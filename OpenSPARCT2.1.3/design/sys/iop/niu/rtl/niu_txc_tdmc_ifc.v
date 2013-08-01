// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_tdmc_ifc.v
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
/*********************************************************************
 *
 *  niu_txc_tdmc_ifc.v
 *
 *  NIU TXC To TDMC Grouped Interface
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):
 *  Project(s):          Neptune
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

`include "timescale.v"

module niu_txc_tdmc_ifc (
        SysClk,
        Reset_L,
        Port0_Nack_Pkt_Rd,
        Port0_DMA_Nack_Pkt_Rd,
        Port0_Nack_Pkt_Rd_Addr,
        Port0_DMA0_inc_head,
        Port0_DMA0_reset_done,
        Port0_DMA0_mark_bit,
        Port0_DMA0_inc_pkt_cnt,
        Port0_SetGetNextDescDMA0,
        Port0_DMA1_inc_head,
        Port0_DMA1_reset_done,
        Port0_DMA1_mark_bit,
        Port0_DMA1_inc_pkt_cnt,
        Port0_SetGetNextDescDMA1,
        Port0_DMA2_inc_head,
        Port0_DMA2_reset_done,
        Port0_DMA2_mark_bit,
        Port0_DMA2_inc_pkt_cnt,
        Port0_SetGetNextDescDMA2,
        Port0_DMA3_inc_head,
        Port0_DMA3_reset_done,
        Port0_DMA3_mark_bit,
        Port0_DMA3_inc_pkt_cnt,
        Port0_SetGetNextDescDMA3,
        Port0_DMA4_inc_head,
        Port0_DMA4_reset_done,
        Port0_DMA4_mark_bit,
        Port0_DMA4_inc_pkt_cnt,
        Port0_SetGetNextDescDMA4,
        Port0_DMA5_inc_head,
        Port0_DMA5_reset_done,
        Port0_DMA5_mark_bit,
        Port0_DMA5_inc_pkt_cnt,
        Port0_SetGetNextDescDMA5,
        Port0_DMA6_inc_head,
        Port0_DMA6_reset_done,
        Port0_DMA6_mark_bit,
        Port0_DMA6_inc_pkt_cnt,
        Port0_SetGetNextDescDMA6,
        Port0_DMA7_inc_head,
        Port0_DMA7_reset_done,
        Port0_DMA7_mark_bit,
        Port0_DMA7_inc_pkt_cnt,
        Port0_SetGetNextDescDMA7,
        Port0_DMA8_inc_head,
        Port0_DMA8_reset_done,
        Port0_DMA8_mark_bit,
        Port0_DMA8_inc_pkt_cnt,
        Port0_SetGetNextDescDMA8,
        Port0_DMA9_inc_head,
        Port0_DMA9_reset_done,
        Port0_DMA9_mark_bit,
        Port0_DMA9_inc_pkt_cnt,
        Port0_SetGetNextDescDMA9,
        Port0_DMA10_inc_head,
        Port0_DMA10_reset_done,
        Port0_DMA10_mark_bit,
        Port0_DMA10_inc_pkt_cnt,
        Port0_SetGetNextDescDMA10,
        Port0_DMA11_inc_head,
        Port0_DMA11_reset_done,
        Port0_DMA11_mark_bit,
        Port0_DMA11_inc_pkt_cnt,
        Port0_SetGetNextDescDMA11,
        Port0_DMA12_inc_head,
        Port0_DMA12_reset_done,
        Port0_DMA12_mark_bit,
        Port0_DMA12_inc_pkt_cnt,
        Port0_SetGetNextDescDMA12,
        Port0_DMA13_inc_head,
        Port0_DMA13_reset_done,
        Port0_DMA13_mark_bit,
        Port0_DMA13_inc_pkt_cnt,
        Port0_SetGetNextDescDMA13,
        Port0_DMA14_inc_head,
        Port0_DMA14_reset_done,
        Port0_DMA14_mark_bit,
        Port0_DMA14_inc_pkt_cnt,
        Port0_SetGetNextDescDMA14,
        Port0_DMA15_inc_head,
        Port0_DMA15_reset_done,
        Port0_DMA15_mark_bit,
        Port0_DMA15_inc_pkt_cnt,
        Port0_SetGetNextDescDMA15,
        Port0_DMA16_inc_head,
        Port0_DMA16_reset_done,
        Port0_DMA16_mark_bit,
        Port0_DMA16_inc_pkt_cnt,
        Port0_SetGetNextDescDMA16,
        Port0_DMA17_inc_head,
        Port0_DMA17_reset_done,
        Port0_DMA17_mark_bit,
        Port0_DMA17_inc_pkt_cnt,
        Port0_SetGetNextDescDMA17,
        Port0_DMA18_inc_head,
        Port0_DMA18_reset_done,
        Port0_DMA18_mark_bit,
        Port0_DMA18_inc_pkt_cnt,
        Port0_SetGetNextDescDMA18,
        Port0_DMA19_inc_head,
        Port0_DMA19_reset_done,
        Port0_DMA19_mark_bit,
        Port0_DMA19_inc_pkt_cnt,
        Port0_SetGetNextDescDMA19,
        Port0_DMA20_inc_head,
        Port0_DMA20_reset_done,
        Port0_DMA20_mark_bit,
        Port0_DMA20_inc_pkt_cnt,
        Port0_SetGetNextDescDMA20,
        Port0_DMA21_inc_head,
        Port0_DMA21_reset_done,
        Port0_DMA21_mark_bit,
        Port0_DMA21_inc_pkt_cnt,
        Port0_SetGetNextDescDMA21,
        Port0_DMA22_inc_head,
        Port0_DMA22_reset_done,
        Port0_DMA22_mark_bit,
        Port0_DMA22_inc_pkt_cnt,
        Port0_SetGetNextDescDMA22,
        Port0_DMA23_inc_head,
        Port0_DMA23_reset_done,
        Port0_DMA23_mark_bit,
        Port0_DMA23_inc_pkt_cnt,
        Port0_SetGetNextDescDMA23,
        Port1_Nack_Pkt_Rd,
        Port1_DMA_Nack_Pkt_Rd,
        Port1_Nack_Pkt_Rd_Addr,
        Port1_DMA0_inc_head,
        Port1_DMA0_reset_done,
        Port1_DMA0_mark_bit,
        Port1_DMA0_inc_pkt_cnt,
        Port1_SetGetNextDescDMA0,
        Port1_DMA1_inc_head,
        Port1_DMA1_reset_done,
        Port1_DMA1_mark_bit,
        Port1_DMA1_inc_pkt_cnt,
        Port1_SetGetNextDescDMA1,
        Port1_DMA2_inc_head,
        Port1_DMA2_reset_done,
        Port1_DMA2_mark_bit,
        Port1_DMA2_inc_pkt_cnt,
        Port1_SetGetNextDescDMA2,
        Port1_DMA3_inc_head,
        Port1_DMA3_reset_done,
        Port1_DMA3_mark_bit,
        Port1_DMA3_inc_pkt_cnt,
        Port1_SetGetNextDescDMA3,
        Port1_DMA4_inc_head,
        Port1_DMA4_reset_done,
        Port1_DMA4_mark_bit,
        Port1_DMA4_inc_pkt_cnt,
        Port1_SetGetNextDescDMA4,
        Port1_DMA5_inc_head,
        Port1_DMA5_reset_done,
        Port1_DMA5_mark_bit,
        Port1_DMA5_inc_pkt_cnt,
        Port1_SetGetNextDescDMA5,
        Port1_DMA6_inc_head,
        Port1_DMA6_reset_done,
        Port1_DMA6_mark_bit,
        Port1_DMA6_inc_pkt_cnt,
        Port1_SetGetNextDescDMA6,
        Port1_DMA7_inc_head,
        Port1_DMA7_reset_done,
        Port1_DMA7_mark_bit,
        Port1_DMA7_inc_pkt_cnt,
        Port1_SetGetNextDescDMA7,
        Port1_DMA8_inc_head,
        Port1_DMA8_reset_done,
        Port1_DMA8_mark_bit,
        Port1_DMA8_inc_pkt_cnt,
        Port1_SetGetNextDescDMA8,
        Port1_DMA9_inc_head,
        Port1_DMA9_reset_done,
        Port1_DMA9_mark_bit,
        Port1_DMA9_inc_pkt_cnt,
        Port1_SetGetNextDescDMA9,
        Port1_DMA10_inc_head,
        Port1_DMA10_reset_done,
        Port1_DMA10_mark_bit,
        Port1_DMA10_inc_pkt_cnt,
        Port1_SetGetNextDescDMA10,
        Port1_DMA11_inc_head,
        Port1_DMA11_reset_done,
        Port1_DMA11_mark_bit,
        Port1_DMA11_inc_pkt_cnt,
        Port1_SetGetNextDescDMA11,
        Port1_DMA12_inc_head,
        Port1_DMA12_reset_done,
        Port1_DMA12_mark_bit,
        Port1_DMA12_inc_pkt_cnt,
        Port1_SetGetNextDescDMA12,
        Port1_DMA13_inc_head,
        Port1_DMA13_reset_done,
        Port1_DMA13_mark_bit,
        Port1_DMA13_inc_pkt_cnt,
        Port1_SetGetNextDescDMA13,
        Port1_DMA14_inc_head,
        Port1_DMA14_reset_done,
        Port1_DMA14_mark_bit,
        Port1_DMA14_inc_pkt_cnt,
        Port1_SetGetNextDescDMA14,
        Port1_DMA15_inc_head,
        Port1_DMA15_reset_done,
        Port1_DMA15_mark_bit,
        Port1_DMA15_inc_pkt_cnt,
        Port1_SetGetNextDescDMA15,
        Port1_DMA16_inc_head,
        Port1_DMA16_reset_done,
        Port1_DMA16_mark_bit,
        Port1_DMA16_inc_pkt_cnt,
        Port1_SetGetNextDescDMA16,
        Port1_DMA17_inc_head,
        Port1_DMA17_reset_done,
        Port1_DMA17_mark_bit,
        Port1_DMA17_inc_pkt_cnt,
        Port1_SetGetNextDescDMA17,
        Port1_DMA18_inc_head,
        Port1_DMA18_reset_done,
        Port1_DMA18_mark_bit,
        Port1_DMA18_inc_pkt_cnt,
        Port1_SetGetNextDescDMA18,
        Port1_DMA19_inc_head,
        Port1_DMA19_reset_done,
        Port1_DMA19_mark_bit,
        Port1_DMA19_inc_pkt_cnt,
        Port1_SetGetNextDescDMA19,
        Port1_DMA20_inc_head,
        Port1_DMA20_reset_done,
        Port1_DMA20_mark_bit,
        Port1_DMA20_inc_pkt_cnt,
        Port1_SetGetNextDescDMA20,
        Port1_DMA21_inc_head,
        Port1_DMA21_reset_done,
        Port1_DMA21_mark_bit,
        Port1_DMA21_inc_pkt_cnt,
        Port1_SetGetNextDescDMA21,
        Port1_DMA22_inc_head,
        Port1_DMA22_reset_done,
        Port1_DMA22_mark_bit,
        Port1_DMA22_inc_pkt_cnt,
        Port1_SetGetNextDescDMA22,
        Port1_DMA23_inc_head,
        Port1_DMA23_reset_done,
        Port1_DMA23_mark_bit,
        Port1_DMA23_inc_pkt_cnt,
        Port1_SetGetNextDescDMA23,
        Port2_Nack_Pkt_Rd,
        Port2_DMA_Nack_Pkt_Rd,
        Port2_Nack_Pkt_Rd_Addr,
        Port2_DMA0_inc_head,
        Port2_DMA0_reset_done,
        Port2_DMA0_mark_bit,
        Port2_DMA0_inc_pkt_cnt,
        Port2_SetGetNextDescDMA0,
        Port2_DMA1_inc_head,
        Port2_DMA1_reset_done,
        Port2_DMA1_mark_bit,
        Port2_DMA1_inc_pkt_cnt,
        Port2_SetGetNextDescDMA1,
        Port2_DMA2_inc_head,
        Port2_DMA2_reset_done,
        Port2_DMA2_mark_bit,
        Port2_DMA2_inc_pkt_cnt,
        Port2_SetGetNextDescDMA2,
        Port2_DMA3_inc_head,
        Port2_DMA3_reset_done,
        Port2_DMA3_mark_bit,
        Port2_DMA3_inc_pkt_cnt,
        Port2_SetGetNextDescDMA3,
        Port2_DMA4_inc_head,
        Port2_DMA4_reset_done,
        Port2_DMA4_mark_bit,
        Port2_DMA4_inc_pkt_cnt,
        Port2_SetGetNextDescDMA4,
        Port2_DMA5_inc_head,
        Port2_DMA5_reset_done,
        Port2_DMA5_mark_bit,
        Port2_DMA5_inc_pkt_cnt,
        Port2_SetGetNextDescDMA5,
        Port2_DMA6_inc_head,
        Port2_DMA6_reset_done,
        Port2_DMA6_mark_bit,
        Port2_DMA6_inc_pkt_cnt,
        Port2_SetGetNextDescDMA6,
        Port2_DMA7_inc_head,
        Port2_DMA7_reset_done,
        Port2_DMA7_mark_bit,
        Port2_DMA7_inc_pkt_cnt,
        Port2_SetGetNextDescDMA7,
        Port2_DMA8_inc_head,
        Port2_DMA8_reset_done,
        Port2_DMA8_mark_bit,
        Port2_DMA8_inc_pkt_cnt,
        Port2_SetGetNextDescDMA8,
        Port2_DMA9_inc_head,
        Port2_DMA9_reset_done,
        Port2_DMA9_mark_bit,
        Port2_DMA9_inc_pkt_cnt,
        Port2_SetGetNextDescDMA9,
        Port2_DMA10_inc_head,
        Port2_DMA10_reset_done,
        Port2_DMA10_mark_bit,
        Port2_DMA10_inc_pkt_cnt,
        Port2_SetGetNextDescDMA10,
        Port2_DMA11_inc_head,
        Port2_DMA11_reset_done,
        Port2_DMA11_mark_bit,
        Port2_DMA11_inc_pkt_cnt,
        Port2_SetGetNextDescDMA11,
        Port2_DMA12_inc_head,
        Port2_DMA12_reset_done,
        Port2_DMA12_mark_bit,
        Port2_DMA12_inc_pkt_cnt,
        Port2_SetGetNextDescDMA12,
        Port2_DMA13_inc_head,
        Port2_DMA13_reset_done,
        Port2_DMA13_mark_bit,
        Port2_DMA13_inc_pkt_cnt,
        Port2_SetGetNextDescDMA13,
        Port2_DMA14_inc_head,
        Port2_DMA14_reset_done,
        Port2_DMA14_mark_bit,
        Port2_DMA14_inc_pkt_cnt,
        Port2_SetGetNextDescDMA14,
        Port2_DMA15_inc_head,
        Port2_DMA15_reset_done,
        Port2_DMA15_mark_bit,
        Port2_DMA15_inc_pkt_cnt,
        Port2_SetGetNextDescDMA15,
        Port2_DMA16_inc_head,
        Port2_DMA16_reset_done,
        Port2_DMA16_mark_bit,
        Port2_DMA16_inc_pkt_cnt,
        Port2_SetGetNextDescDMA16,
        Port2_DMA17_inc_head,
        Port2_DMA17_reset_done,
        Port2_DMA17_mark_bit,
        Port2_DMA17_inc_pkt_cnt,
        Port2_SetGetNextDescDMA17,
        Port2_DMA18_inc_head,
        Port2_DMA18_reset_done,
        Port2_DMA18_mark_bit,
        Port2_DMA18_inc_pkt_cnt,
        Port2_SetGetNextDescDMA18,
        Port2_DMA19_inc_head,
        Port2_DMA19_reset_done,
        Port2_DMA19_mark_bit,
        Port2_DMA19_inc_pkt_cnt,
        Port2_SetGetNextDescDMA19,
        Port2_DMA20_inc_head,
        Port2_DMA20_reset_done,
        Port2_DMA20_mark_bit,
        Port2_DMA20_inc_pkt_cnt,
        Port2_SetGetNextDescDMA20,
        Port2_DMA21_inc_head,
        Port2_DMA21_reset_done,
        Port2_DMA21_mark_bit,
        Port2_DMA21_inc_pkt_cnt,
        Port2_SetGetNextDescDMA21,
        Port2_DMA22_inc_head,
        Port2_DMA22_reset_done,
        Port2_DMA22_mark_bit,
        Port2_DMA22_inc_pkt_cnt,
        Port2_SetGetNextDescDMA22,
        Port2_DMA23_inc_head,
        Port2_DMA23_reset_done,
        Port2_DMA23_mark_bit,
        Port2_DMA23_inc_pkt_cnt,
        Port2_SetGetNextDescDMA23,
        Port3_Nack_Pkt_Rd,
        Port3_DMA_Nack_Pkt_Rd,
        Port3_Nack_Pkt_Rd_Addr,
        Port3_DMA0_inc_head,
        Port3_DMA0_reset_done,
        Port3_DMA0_mark_bit,
        Port3_DMA0_inc_pkt_cnt,
        Port3_SetGetNextDescDMA0,
        Port3_DMA1_inc_head,
        Port3_DMA1_reset_done,
        Port3_DMA1_mark_bit,
        Port3_DMA1_inc_pkt_cnt,
        Port3_SetGetNextDescDMA1,
        Port3_DMA2_inc_head,
        Port3_DMA2_reset_done,
        Port3_DMA2_mark_bit,
        Port3_DMA2_inc_pkt_cnt,
        Port3_SetGetNextDescDMA2,
        Port3_DMA3_inc_head,
        Port3_DMA3_reset_done,
        Port3_DMA3_mark_bit,
        Port3_DMA3_inc_pkt_cnt,
        Port3_SetGetNextDescDMA3,
        Port3_DMA4_inc_head,
        Port3_DMA4_reset_done,
        Port3_DMA4_mark_bit,
        Port3_DMA4_inc_pkt_cnt,
        Port3_SetGetNextDescDMA4,
        Port3_DMA5_inc_head,
        Port3_DMA5_reset_done,
        Port3_DMA5_mark_bit,
        Port3_DMA5_inc_pkt_cnt,
        Port3_SetGetNextDescDMA5,
        Port3_DMA6_inc_head,
        Port3_DMA6_reset_done,
        Port3_DMA6_mark_bit,
        Port3_DMA6_inc_pkt_cnt,
        Port3_SetGetNextDescDMA6,
        Port3_DMA7_inc_head,
        Port3_DMA7_reset_done,
        Port3_DMA7_mark_bit,
        Port3_DMA7_inc_pkt_cnt,
        Port3_SetGetNextDescDMA7,
        Port3_DMA8_inc_head,
        Port3_DMA8_reset_done,
        Port3_DMA8_mark_bit,
        Port3_DMA8_inc_pkt_cnt,
        Port3_SetGetNextDescDMA8,
        Port3_DMA9_inc_head,
        Port3_DMA9_reset_done,
        Port3_DMA9_mark_bit,
        Port3_DMA9_inc_pkt_cnt,
        Port3_SetGetNextDescDMA9,
        Port3_DMA10_inc_head,
        Port3_DMA10_reset_done,
        Port3_DMA10_mark_bit,
        Port3_DMA10_inc_pkt_cnt,
        Port3_SetGetNextDescDMA10,
        Port3_DMA11_inc_head,
        Port3_DMA11_reset_done,
        Port3_DMA11_mark_bit,
        Port3_DMA11_inc_pkt_cnt,
        Port3_SetGetNextDescDMA11,
        Port3_DMA12_inc_head,
        Port3_DMA12_reset_done,
        Port3_DMA12_mark_bit,
        Port3_DMA12_inc_pkt_cnt,
        Port3_SetGetNextDescDMA12,
        Port3_DMA13_inc_head,
        Port3_DMA13_reset_done,
        Port3_DMA13_mark_bit,
        Port3_DMA13_inc_pkt_cnt,
        Port3_SetGetNextDescDMA13,
        Port3_DMA14_inc_head,
        Port3_DMA14_reset_done,
        Port3_DMA14_mark_bit,
        Port3_DMA14_inc_pkt_cnt,
        Port3_SetGetNextDescDMA14,
        Port3_DMA15_inc_head,
        Port3_DMA15_reset_done,
        Port3_DMA15_mark_bit,
        Port3_DMA15_inc_pkt_cnt,
        Port3_SetGetNextDescDMA15,
        Port3_DMA16_inc_head,
        Port3_DMA16_reset_done,
        Port3_DMA16_mark_bit,
        Port3_DMA16_inc_pkt_cnt,
        Port3_SetGetNextDescDMA16,
        Port3_DMA17_inc_head,
        Port3_DMA17_reset_done,
        Port3_DMA17_mark_bit,
        Port3_DMA17_inc_pkt_cnt,
        Port3_SetGetNextDescDMA17,
        Port3_DMA18_inc_head,
        Port3_DMA18_reset_done,
        Port3_DMA18_mark_bit,
        Port3_DMA18_inc_pkt_cnt,
        Port3_SetGetNextDescDMA18,
        Port3_DMA19_inc_head,
        Port3_DMA19_reset_done,
        Port3_DMA19_mark_bit,
        Port3_DMA19_inc_pkt_cnt,
        Port3_SetGetNextDescDMA19,
        Port3_DMA20_inc_head,
        Port3_DMA20_reset_done,
        Port3_DMA20_mark_bit,
        Port3_DMA20_inc_pkt_cnt,
        Port3_SetGetNextDescDMA20,
        Port3_DMA21_inc_head,
        Port3_DMA21_reset_done,
        Port3_DMA21_mark_bit,
        Port3_DMA21_inc_pkt_cnt,
        Port3_SetGetNextDescDMA21,
        Port3_DMA22_inc_head,
        Port3_DMA22_reset_done,
        Port3_DMA22_mark_bit,
        Port3_DMA22_inc_pkt_cnt,
        Port3_SetGetNextDescDMA22,
        Port3_DMA23_inc_head,
        Port3_DMA23_reset_done,
        Port3_DMA23_mark_bit,
        Port3_DMA23_inc_pkt_cnt,
        Port3_SetGetNextDescDMA23,
        TXC_DMC_Nack_Pkt_Rd,
        TXC_DMC_DMA_Nack_Pkt_Rd,
        TXC_DMC_Nack_Pkt_Rd_Addr,
        DMC_TXC_DMA0_GotNxtDesc,
        TXC_DMC_DMA0_GetNxtDesc,
        TXC_DMC_DMA0_inc_head,
        TXC_DMC_DMA0_reset_done,
        TXC_DMC_DMA0_mark_bit,
        TXC_DMC_DMA0_inc_pkt_cnt,
        DMC_TXC_DMA1_GotNxtDesc,
        TXC_DMC_DMA1_GetNxtDesc,
        TXC_DMC_DMA1_inc_head,
        TXC_DMC_DMA1_reset_done,
        TXC_DMC_DMA1_mark_bit,
        TXC_DMC_DMA1_inc_pkt_cnt,
        DMC_TXC_DMA2_GotNxtDesc,
        TXC_DMC_DMA2_GetNxtDesc,
        TXC_DMC_DMA2_inc_head,
        TXC_DMC_DMA2_reset_done,
        TXC_DMC_DMA2_mark_bit,
        TXC_DMC_DMA2_inc_pkt_cnt,
        DMC_TXC_DMA3_GotNxtDesc,
        TXC_DMC_DMA3_GetNxtDesc,
        TXC_DMC_DMA3_inc_head,
        TXC_DMC_DMA3_reset_done,
        TXC_DMC_DMA3_mark_bit,
        TXC_DMC_DMA3_inc_pkt_cnt,
        DMC_TXC_DMA4_GotNxtDesc,
        TXC_DMC_DMA4_GetNxtDesc,
        TXC_DMC_DMA4_inc_head,
        TXC_DMC_DMA4_reset_done,
        TXC_DMC_DMA4_mark_bit,
        TXC_DMC_DMA4_inc_pkt_cnt,
        DMC_TXC_DMA5_GotNxtDesc,
        TXC_DMC_DMA5_GetNxtDesc,
        TXC_DMC_DMA5_inc_head,
        TXC_DMC_DMA5_reset_done,
        TXC_DMC_DMA5_mark_bit,
        TXC_DMC_DMA5_inc_pkt_cnt,
        DMC_TXC_DMA6_GotNxtDesc,
        TXC_DMC_DMA6_GetNxtDesc,
        TXC_DMC_DMA6_inc_head,
        TXC_DMC_DMA6_reset_done,
        TXC_DMC_DMA6_mark_bit,
        TXC_DMC_DMA6_inc_pkt_cnt,
        DMC_TXC_DMA7_GotNxtDesc,
        TXC_DMC_DMA7_GetNxtDesc,
        TXC_DMC_DMA7_inc_head,
        TXC_DMC_DMA7_reset_done,
        TXC_DMC_DMA7_mark_bit,
        TXC_DMC_DMA7_inc_pkt_cnt,
        DMC_TXC_DMA8_GotNxtDesc,
        TXC_DMC_DMA8_GetNxtDesc,
        TXC_DMC_DMA8_inc_head,
        TXC_DMC_DMA8_reset_done,
        TXC_DMC_DMA8_mark_bit,
        TXC_DMC_DMA8_inc_pkt_cnt,
        DMC_TXC_DMA9_GotNxtDesc,
        TXC_DMC_DMA9_GetNxtDesc,
        TXC_DMC_DMA9_inc_head,
        TXC_DMC_DMA9_reset_done,
        TXC_DMC_DMA9_mark_bit,
        TXC_DMC_DMA9_inc_pkt_cnt,
        DMC_TXC_DMA10_GotNxtDesc,
        TXC_DMC_DMA10_GetNxtDesc,
        TXC_DMC_DMA10_inc_head,
        TXC_DMC_DMA10_reset_done,
        TXC_DMC_DMA10_mark_bit,
        TXC_DMC_DMA10_inc_pkt_cnt,
        DMC_TXC_DMA11_GotNxtDesc,
        TXC_DMC_DMA11_GetNxtDesc,
        TXC_DMC_DMA11_inc_head,
        TXC_DMC_DMA11_reset_done,
        TXC_DMC_DMA11_mark_bit,
        TXC_DMC_DMA11_inc_pkt_cnt,
        DMC_TXC_DMA12_GotNxtDesc,
        TXC_DMC_DMA12_GetNxtDesc,
        TXC_DMC_DMA12_inc_head,
        TXC_DMC_DMA12_reset_done,
        TXC_DMC_DMA12_mark_bit,
        TXC_DMC_DMA12_inc_pkt_cnt,
        DMC_TXC_DMA13_GotNxtDesc,
        TXC_DMC_DMA13_GetNxtDesc,
        TXC_DMC_DMA13_inc_head,
        TXC_DMC_DMA13_reset_done,
        TXC_DMC_DMA13_mark_bit,
        TXC_DMC_DMA13_inc_pkt_cnt,
        DMC_TXC_DMA14_GotNxtDesc,
        TXC_DMC_DMA14_GetNxtDesc,
        TXC_DMC_DMA14_inc_head,
        TXC_DMC_DMA14_reset_done,
        TXC_DMC_DMA14_mark_bit,
        TXC_DMC_DMA14_inc_pkt_cnt,
        DMC_TXC_DMA15_GotNxtDesc,
        TXC_DMC_DMA15_GetNxtDesc,
        TXC_DMC_DMA15_inc_head,
        TXC_DMC_DMA15_reset_done,
        TXC_DMC_DMA15_mark_bit,
        TXC_DMC_DMA15_inc_pkt_cnt,
        DMC_TXC_DMA16_GotNxtDesc,
        TXC_DMC_DMA16_GetNxtDesc,
        TXC_DMC_DMA16_inc_head,
        TXC_DMC_DMA16_reset_done,
        TXC_DMC_DMA16_mark_bit,
        TXC_DMC_DMA16_inc_pkt_cnt,
        DMC_TXC_DMA17_GotNxtDesc,
        TXC_DMC_DMA17_GetNxtDesc,
        TXC_DMC_DMA17_inc_head,
        TXC_DMC_DMA17_reset_done,
        TXC_DMC_DMA17_mark_bit,
        TXC_DMC_DMA17_inc_pkt_cnt,
        DMC_TXC_DMA18_GotNxtDesc,
        TXC_DMC_DMA18_GetNxtDesc,
        TXC_DMC_DMA18_inc_head,
        TXC_DMC_DMA18_reset_done,
        TXC_DMC_DMA18_mark_bit,
        TXC_DMC_DMA18_inc_pkt_cnt,
        DMC_TXC_DMA19_GotNxtDesc,
        TXC_DMC_DMA19_GetNxtDesc,
        TXC_DMC_DMA19_inc_head,
        TXC_DMC_DMA19_reset_done,
        TXC_DMC_DMA19_mark_bit,
        TXC_DMC_DMA19_inc_pkt_cnt,
        DMC_TXC_DMA20_GotNxtDesc,
        TXC_DMC_DMA20_GetNxtDesc,
        TXC_DMC_DMA20_inc_head,
        TXC_DMC_DMA20_reset_done,
        TXC_DMC_DMA20_mark_bit,
        TXC_DMC_DMA20_inc_pkt_cnt,
        DMC_TXC_DMA21_GotNxtDesc,
        TXC_DMC_DMA21_GetNxtDesc,
        TXC_DMC_DMA21_inc_head,
        TXC_DMC_DMA21_reset_done,
        TXC_DMC_DMA21_mark_bit,
        TXC_DMC_DMA21_inc_pkt_cnt,
        DMC_TXC_DMA22_GotNxtDesc,
        TXC_DMC_DMA22_GetNxtDesc,
        TXC_DMC_DMA22_inc_head,
        TXC_DMC_DMA22_reset_done,
        TXC_DMC_DMA22_mark_bit,
        TXC_DMC_DMA22_inc_pkt_cnt,
        DMC_TXC_DMA23_GotNxtDesc,
        TXC_DMC_DMA23_GetNxtDesc,
        TXC_DMC_DMA23_inc_head,
        TXC_DMC_DMA23_reset_done,
        TXC_DMC_DMA23_mark_bit,
        TXC_DMC_DMA23_inc_pkt_cnt
       );

`include "txc_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Port 0 DMA Signals
input          Port0_Nack_Pkt_Rd;
input  [23:0]  Port0_DMA_Nack_Pkt_Rd;
input  [43:0]  Port0_Nack_Pkt_Rd_Addr;

input          Port0_DMA0_inc_head;
input          Port0_DMA0_reset_done;
input          Port0_DMA0_mark_bit;
input          Port0_DMA0_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA0;

input          Port0_DMA1_inc_head;
input          Port0_DMA1_reset_done;
input          Port0_DMA1_mark_bit;
input          Port0_DMA1_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA1;

input          Port0_DMA2_inc_head;
input          Port0_DMA2_reset_done;
input          Port0_DMA2_mark_bit;
input          Port0_DMA2_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA2;

input          Port0_DMA3_inc_head;
input          Port0_DMA3_reset_done;
input          Port0_DMA3_mark_bit;
input          Port0_DMA3_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA3;

input          Port0_DMA4_inc_head;
input          Port0_DMA4_reset_done;
input          Port0_DMA4_mark_bit;
input          Port0_DMA4_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA4;

input          Port0_DMA5_inc_head;
input          Port0_DMA5_reset_done;
input          Port0_DMA5_mark_bit;
input          Port0_DMA5_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA5;

input          Port0_DMA6_inc_head;
input          Port0_DMA6_reset_done;
input          Port0_DMA6_mark_bit;
input          Port0_DMA6_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA6;

input          Port0_DMA7_inc_head;
input          Port0_DMA7_reset_done;
input          Port0_DMA7_mark_bit;
input          Port0_DMA7_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA7;

input          Port0_DMA8_inc_head;
input          Port0_DMA8_reset_done;
input          Port0_DMA8_mark_bit;
input          Port0_DMA8_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA8;

input          Port0_DMA9_inc_head;
input          Port0_DMA9_reset_done;
input          Port0_DMA9_mark_bit;
input          Port0_DMA9_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA9;

input          Port0_DMA10_inc_head;
input          Port0_DMA10_reset_done;
input          Port0_DMA10_mark_bit;
input          Port0_DMA10_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA10;

input          Port0_DMA11_inc_head;
input          Port0_DMA11_reset_done;
input          Port0_DMA11_mark_bit;
input          Port0_DMA11_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA11;

input          Port0_DMA12_inc_head;
input          Port0_DMA12_reset_done;
input          Port0_DMA12_mark_bit;
input          Port0_DMA12_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA12;

input          Port0_DMA13_inc_head;
input          Port0_DMA13_reset_done;
input          Port0_DMA13_mark_bit;
input          Port0_DMA13_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA13;

input          Port0_DMA14_inc_head;
input          Port0_DMA14_reset_done;
input          Port0_DMA14_mark_bit;
input          Port0_DMA14_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA14;

input          Port0_DMA15_inc_head;
input          Port0_DMA15_reset_done;
input          Port0_DMA15_mark_bit;
input          Port0_DMA15_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA15;

input          Port0_DMA16_inc_head;
input          Port0_DMA16_reset_done;
input          Port0_DMA16_mark_bit;
input          Port0_DMA16_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA16;

input          Port0_DMA17_inc_head;
input          Port0_DMA17_reset_done;
input          Port0_DMA17_mark_bit;
input          Port0_DMA17_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA17;

input          Port0_DMA18_inc_head;
input          Port0_DMA18_reset_done;
input          Port0_DMA18_mark_bit;
input          Port0_DMA18_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA18;

input          Port0_DMA19_inc_head;
input          Port0_DMA19_reset_done;
input          Port0_DMA19_mark_bit;
input          Port0_DMA19_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA19;

input          Port0_DMA20_inc_head;
input          Port0_DMA20_reset_done;
input          Port0_DMA20_mark_bit;
input          Port0_DMA20_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA20;

input          Port0_DMA21_inc_head;
input          Port0_DMA21_reset_done;
input          Port0_DMA21_mark_bit;
input          Port0_DMA21_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA21;

input          Port0_DMA22_inc_head;
input          Port0_DMA22_reset_done;
input          Port0_DMA22_mark_bit;
input          Port0_DMA22_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA22;

input          Port0_DMA23_inc_head;
input          Port0_DMA23_reset_done;
input          Port0_DMA23_mark_bit;
input          Port0_DMA23_inc_pkt_cnt;
input          Port0_SetGetNextDescDMA23;

// Port 1 DMA Signals
input          Port1_Nack_Pkt_Rd;
input  [23:0]  Port1_DMA_Nack_Pkt_Rd;
input  [43:0]  Port1_Nack_Pkt_Rd_Addr;

input          Port1_DMA0_inc_head;
input          Port1_DMA0_reset_done;
input          Port1_DMA0_mark_bit;
input          Port1_DMA0_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA0;

input          Port1_DMA1_inc_head;
input          Port1_DMA1_reset_done;
input          Port1_DMA1_mark_bit;
input          Port1_DMA1_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA1;

input          Port1_DMA2_inc_head;
input          Port1_DMA2_reset_done;
input          Port1_DMA2_mark_bit;
input          Port1_DMA2_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA2;

input          Port1_DMA3_inc_head;
input          Port1_DMA3_reset_done;
input          Port1_DMA3_mark_bit;
input          Port1_DMA3_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA3;

input          Port1_DMA4_inc_head;
input          Port1_DMA4_reset_done;
input          Port1_DMA4_mark_bit;
input          Port1_DMA4_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA4;

input          Port1_DMA5_inc_head;
input          Port1_DMA5_reset_done;
input          Port1_DMA5_mark_bit;
input          Port1_DMA5_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA5;

input          Port1_DMA6_inc_head;
input          Port1_DMA6_reset_done;
input          Port1_DMA6_mark_bit;
input          Port1_DMA6_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA6;

input          Port1_DMA7_inc_head;
input          Port1_DMA7_reset_done;
input          Port1_DMA7_mark_bit;
input          Port1_DMA7_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA7;

input          Port1_DMA8_inc_head;
input          Port1_DMA8_reset_done;
input          Port1_DMA8_mark_bit;
input          Port1_DMA8_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA8;

input          Port1_DMA9_inc_head;
input          Port1_DMA9_reset_done;
input          Port1_DMA9_mark_bit;
input          Port1_DMA9_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA9;

input          Port1_DMA10_inc_head;
input          Port1_DMA10_reset_done;
input          Port1_DMA10_mark_bit;
input          Port1_DMA10_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA10;

input          Port1_DMA11_inc_head;
input          Port1_DMA11_reset_done;
input          Port1_DMA11_mark_bit;
input          Port1_DMA11_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA11;

input          Port1_DMA12_inc_head;
input          Port1_DMA12_reset_done;
input          Port1_DMA12_mark_bit;
input          Port1_DMA12_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA12;

input          Port1_DMA13_inc_head;
input          Port1_DMA13_reset_done;
input          Port1_DMA13_mark_bit;
input          Port1_DMA13_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA13;

input          Port1_DMA14_inc_head;
input          Port1_DMA14_reset_done;
input          Port1_DMA14_mark_bit;
input          Port1_DMA14_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA14;

input          Port1_DMA15_inc_head;
input          Port1_DMA15_reset_done;
input          Port1_DMA15_mark_bit;
input          Port1_DMA15_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA15;

input          Port1_DMA16_inc_head;
input          Port1_DMA16_reset_done;
input          Port1_DMA16_mark_bit;
input          Port1_DMA16_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA16;

input          Port1_DMA17_inc_head;
input          Port1_DMA17_reset_done;
input          Port1_DMA17_mark_bit;
input          Port1_DMA17_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA17;

input          Port1_DMA18_inc_head;
input          Port1_DMA18_reset_done;
input          Port1_DMA18_mark_bit;
input          Port1_DMA18_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA18;

input          Port1_DMA19_inc_head;
input          Port1_DMA19_reset_done;
input          Port1_DMA19_mark_bit;
input          Port1_DMA19_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA19;

input          Port1_DMA20_inc_head;
input          Port1_DMA20_reset_done;
input          Port1_DMA20_mark_bit;
input          Port1_DMA20_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA20;

input          Port1_DMA21_inc_head;
input          Port1_DMA21_reset_done;
input          Port1_DMA21_mark_bit;
input          Port1_DMA21_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA21;

input          Port1_DMA22_inc_head;
input          Port1_DMA22_reset_done;
input          Port1_DMA22_mark_bit;
input          Port1_DMA22_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA22;

input          Port1_DMA23_inc_head;
input          Port1_DMA23_reset_done;
input          Port1_DMA23_mark_bit;
input          Port1_DMA23_inc_pkt_cnt;
input          Port1_SetGetNextDescDMA23;

// Port 2 DMA Signals
input          Port2_Nack_Pkt_Rd;
input  [23:0]  Port2_DMA_Nack_Pkt_Rd;
input  [43:0]  Port2_Nack_Pkt_Rd_Addr;

input          Port2_DMA0_inc_head;
input          Port2_DMA0_reset_done;
input          Port2_DMA0_mark_bit;
input          Port2_DMA0_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA0;

input          Port2_DMA1_inc_head;
input          Port2_DMA1_reset_done;
input          Port2_DMA1_mark_bit;
input          Port2_DMA1_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA1;

input          Port2_DMA2_inc_head;
input          Port2_DMA2_reset_done;
input          Port2_DMA2_mark_bit;
input          Port2_DMA2_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA2;

input          Port2_DMA3_inc_head;
input          Port2_DMA3_reset_done;
input          Port2_DMA3_mark_bit;
input          Port2_DMA3_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA3;

input          Port2_DMA4_inc_head;
input          Port2_DMA4_reset_done;
input          Port2_DMA4_mark_bit;
input          Port2_DMA4_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA4;

input          Port2_DMA5_inc_head;
input          Port2_DMA5_reset_done;
input          Port2_DMA5_mark_bit;
input          Port2_DMA5_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA5;

input          Port2_DMA6_inc_head;
input          Port2_DMA6_reset_done;
input          Port2_DMA6_mark_bit;
input          Port2_DMA6_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA6;

input          Port2_DMA7_inc_head;
input          Port2_DMA7_reset_done;
input          Port2_DMA7_mark_bit;
input          Port2_DMA7_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA7;

input          Port2_DMA8_inc_head;
input          Port2_DMA8_reset_done;
input          Port2_DMA8_mark_bit;
input          Port2_DMA8_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA8;

input          Port2_DMA9_inc_head;
input          Port2_DMA9_reset_done;
input          Port2_DMA9_mark_bit;
input          Port2_DMA9_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA9;

input          Port2_DMA10_inc_head;
input          Port2_DMA10_reset_done;
input          Port2_DMA10_mark_bit;
input          Port2_DMA10_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA10;

input          Port2_DMA11_inc_head;
input          Port2_DMA11_reset_done;
input          Port2_DMA11_mark_bit;
input          Port2_DMA11_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA11;

input          Port2_DMA12_inc_head;
input          Port2_DMA12_reset_done;
input          Port2_DMA12_mark_bit;
input          Port2_DMA12_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA12;

input          Port2_DMA13_inc_head;
input          Port2_DMA13_reset_done;
input          Port2_DMA13_mark_bit;
input          Port2_DMA13_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA13;

input          Port2_DMA14_inc_head;
input          Port2_DMA14_reset_done;
input          Port2_DMA14_mark_bit;
input          Port2_DMA14_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA14;

input          Port2_DMA15_inc_head;
input          Port2_DMA15_reset_done;
input          Port2_DMA15_mark_bit;
input          Port2_DMA15_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA15;

input          Port2_DMA16_inc_head;
input          Port2_DMA16_reset_done;
input          Port2_DMA16_mark_bit;
input          Port2_DMA16_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA16;

input          Port2_DMA17_inc_head;
input          Port2_DMA17_reset_done;
input          Port2_DMA17_mark_bit;
input          Port2_DMA17_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA17;

input          Port2_DMA18_inc_head;
input          Port2_DMA18_reset_done;
input          Port2_DMA18_mark_bit;
input          Port2_DMA18_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA18;

input          Port2_DMA19_inc_head;
input          Port2_DMA19_reset_done;
input          Port2_DMA19_mark_bit;
input          Port2_DMA19_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA19;

input          Port2_DMA20_inc_head;
input          Port2_DMA20_reset_done;
input          Port2_DMA20_mark_bit;
input          Port2_DMA20_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA20;

input          Port2_DMA21_inc_head;
input          Port2_DMA21_reset_done;
input          Port2_DMA21_mark_bit;
input          Port2_DMA21_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA21;

input          Port2_DMA22_inc_head;
input          Port2_DMA22_reset_done;
input          Port2_DMA22_mark_bit;
input          Port2_DMA22_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA22;

input          Port2_DMA23_inc_head;
input          Port2_DMA23_reset_done;
input          Port2_DMA23_mark_bit;
input          Port2_DMA23_inc_pkt_cnt;
input          Port2_SetGetNextDescDMA23;

// Port 3 DMA Signals
input          Port3_Nack_Pkt_Rd;
input  [23:0]  Port3_DMA_Nack_Pkt_Rd;
input  [43:0]  Port3_Nack_Pkt_Rd_Addr;

input          Port3_DMA0_inc_head;
input          Port3_DMA0_reset_done;
input          Port3_DMA0_mark_bit;
input          Port3_DMA0_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA0;

input          Port3_DMA1_inc_head;
input          Port3_DMA1_reset_done;
input          Port3_DMA1_mark_bit;
input          Port3_DMA1_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA1;

input          Port3_DMA2_inc_head;
input          Port3_DMA2_reset_done;
input          Port3_DMA2_mark_bit;
input          Port3_DMA2_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA2;

input          Port3_DMA3_inc_head;
input          Port3_DMA3_reset_done;
input          Port3_DMA3_mark_bit;
input          Port3_DMA3_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA3;

input          Port3_DMA4_inc_head;
input          Port3_DMA4_reset_done;
input          Port3_DMA4_mark_bit;
input          Port3_DMA4_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA4;

input          Port3_DMA5_inc_head;
input          Port3_DMA5_reset_done;
input          Port3_DMA5_mark_bit;
input          Port3_DMA5_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA5;

input          Port3_DMA6_inc_head;
input          Port3_DMA6_reset_done;
input          Port3_DMA6_mark_bit;
input          Port3_DMA6_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA6;

input          Port3_DMA7_inc_head;
input          Port3_DMA7_reset_done;
input          Port3_DMA7_mark_bit;
input          Port3_DMA7_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA7;

input          Port3_DMA8_inc_head;
input          Port3_DMA8_reset_done;
input          Port3_DMA8_mark_bit;
input          Port3_DMA8_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA8;

input          Port3_DMA9_inc_head;
input          Port3_DMA9_reset_done;
input          Port3_DMA9_mark_bit;
input          Port3_DMA9_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA9;

input          Port3_DMA10_inc_head;
input          Port3_DMA10_reset_done;
input          Port3_DMA10_mark_bit;
input          Port3_DMA10_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA10;

input          Port3_DMA11_inc_head;
input          Port3_DMA11_reset_done;
input          Port3_DMA11_mark_bit;
input          Port3_DMA11_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA11;

input          Port3_DMA12_inc_head;
input          Port3_DMA12_reset_done;
input          Port3_DMA12_mark_bit;
input          Port3_DMA12_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA12;

input          Port3_DMA13_inc_head;
input          Port3_DMA13_reset_done;
input          Port3_DMA13_mark_bit;
input          Port3_DMA13_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA13;

input          Port3_DMA14_inc_head;
input          Port3_DMA14_reset_done;
input          Port3_DMA14_mark_bit;
input          Port3_DMA14_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA14;

input          Port3_DMA15_inc_head;
input          Port3_DMA15_reset_done;
input          Port3_DMA15_mark_bit;
input          Port3_DMA15_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA15;

input          Port3_DMA16_inc_head;
input          Port3_DMA16_reset_done;
input          Port3_DMA16_mark_bit;
input          Port3_DMA16_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA16;

input          Port3_DMA17_inc_head;
input          Port3_DMA17_reset_done;
input          Port3_DMA17_mark_bit;
input          Port3_DMA17_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA17;

input          Port3_DMA18_inc_head;
input          Port3_DMA18_reset_done;
input          Port3_DMA18_mark_bit;
input          Port3_DMA18_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA18;

input          Port3_DMA19_inc_head;
input          Port3_DMA19_reset_done;
input          Port3_DMA19_mark_bit;
input          Port3_DMA19_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA19;

input          Port3_DMA20_inc_head;
input          Port3_DMA20_reset_done;
input          Port3_DMA20_mark_bit;
input          Port3_DMA20_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA20;

input          Port3_DMA21_inc_head;
input          Port3_DMA21_reset_done;
input          Port3_DMA21_mark_bit;
input          Port3_DMA21_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA21;

input          Port3_DMA22_inc_head;
input          Port3_DMA22_reset_done;
input          Port3_DMA22_mark_bit;
input          Port3_DMA22_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA22;

input          Port3_DMA23_inc_head;
input          Port3_DMA23_reset_done;
input          Port3_DMA23_mark_bit;
input          Port3_DMA23_inc_pkt_cnt;
input          Port3_SetGetNextDescDMA23;

// TXC To TDMC Error Interface Signals
output         TXC_DMC_Nack_Pkt_Rd;
output [23:0]  TXC_DMC_DMA_Nack_Pkt_Rd;
output [43:0]  TXC_DMC_Nack_Pkt_Rd_Addr;

// TXC To TDMC DMA Interface Signals
input          DMC_TXC_DMA0_GotNxtDesc;

output         TXC_DMC_DMA0_GetNxtDesc;
output         TXC_DMC_DMA0_inc_head;
output         TXC_DMC_DMA0_reset_done;
output         TXC_DMC_DMA0_mark_bit;
output         TXC_DMC_DMA0_inc_pkt_cnt;

input          DMC_TXC_DMA1_GotNxtDesc;

output         TXC_DMC_DMA1_GetNxtDesc;
output         TXC_DMC_DMA1_inc_head;
output         TXC_DMC_DMA1_reset_done;
output         TXC_DMC_DMA1_mark_bit;
output         TXC_DMC_DMA1_inc_pkt_cnt;

input          DMC_TXC_DMA2_GotNxtDesc;

output         TXC_DMC_DMA2_GetNxtDesc;
output         TXC_DMC_DMA2_inc_head;
output         TXC_DMC_DMA2_reset_done;
output         TXC_DMC_DMA2_mark_bit;
output         TXC_DMC_DMA2_inc_pkt_cnt;

input          DMC_TXC_DMA3_GotNxtDesc;

output         TXC_DMC_DMA3_GetNxtDesc;
output         TXC_DMC_DMA3_inc_head;
output         TXC_DMC_DMA3_reset_done;
output         TXC_DMC_DMA3_mark_bit;
output         TXC_DMC_DMA3_inc_pkt_cnt;

input          DMC_TXC_DMA4_GotNxtDesc;

output         TXC_DMC_DMA4_GetNxtDesc;
output         TXC_DMC_DMA4_inc_head;
output         TXC_DMC_DMA4_reset_done;
output         TXC_DMC_DMA4_mark_bit;
output         TXC_DMC_DMA4_inc_pkt_cnt;

input          DMC_TXC_DMA5_GotNxtDesc;

output         TXC_DMC_DMA5_GetNxtDesc;
output         TXC_DMC_DMA5_inc_head;
output         TXC_DMC_DMA5_reset_done;
output         TXC_DMC_DMA5_mark_bit;
output         TXC_DMC_DMA5_inc_pkt_cnt;

input          DMC_TXC_DMA6_GotNxtDesc;

output         TXC_DMC_DMA6_GetNxtDesc;
output         TXC_DMC_DMA6_inc_head;
output         TXC_DMC_DMA6_reset_done;
output         TXC_DMC_DMA6_mark_bit;
output         TXC_DMC_DMA6_inc_pkt_cnt;

input          DMC_TXC_DMA7_GotNxtDesc;

output         TXC_DMC_DMA7_GetNxtDesc;
output         TXC_DMC_DMA7_inc_head;
output         TXC_DMC_DMA7_reset_done;
output         TXC_DMC_DMA7_mark_bit;
output         TXC_DMC_DMA7_inc_pkt_cnt;

input          DMC_TXC_DMA8_GotNxtDesc;

output         TXC_DMC_DMA8_GetNxtDesc;
output         TXC_DMC_DMA8_inc_head;
output         TXC_DMC_DMA8_reset_done;
output         TXC_DMC_DMA8_mark_bit;
output         TXC_DMC_DMA8_inc_pkt_cnt;

input          DMC_TXC_DMA9_GotNxtDesc;

output         TXC_DMC_DMA9_GetNxtDesc;
output         TXC_DMC_DMA9_inc_head;
output         TXC_DMC_DMA9_reset_done;
output         TXC_DMC_DMA9_mark_bit;
output         TXC_DMC_DMA9_inc_pkt_cnt;

input          DMC_TXC_DMA10_GotNxtDesc;

output         TXC_DMC_DMA10_GetNxtDesc;
output         TXC_DMC_DMA10_inc_head;
output         TXC_DMC_DMA10_reset_done;
output         TXC_DMC_DMA10_mark_bit;
output         TXC_DMC_DMA10_inc_pkt_cnt;

input          DMC_TXC_DMA11_GotNxtDesc;

output         TXC_DMC_DMA11_GetNxtDesc;
output         TXC_DMC_DMA11_inc_head;
output         TXC_DMC_DMA11_reset_done;
output         TXC_DMC_DMA11_mark_bit;
output         TXC_DMC_DMA11_inc_pkt_cnt;

input          DMC_TXC_DMA12_GotNxtDesc;

output         TXC_DMC_DMA12_GetNxtDesc;
output         TXC_DMC_DMA12_inc_head;
output         TXC_DMC_DMA12_reset_done;
output         TXC_DMC_DMA12_mark_bit;
output         TXC_DMC_DMA12_inc_pkt_cnt;

input          DMC_TXC_DMA13_GotNxtDesc;

output         TXC_DMC_DMA13_GetNxtDesc;
output         TXC_DMC_DMA13_inc_head;
output         TXC_DMC_DMA13_reset_done;
output         TXC_DMC_DMA13_mark_bit;
output         TXC_DMC_DMA13_inc_pkt_cnt;

input          DMC_TXC_DMA14_GotNxtDesc;

output         TXC_DMC_DMA14_GetNxtDesc;
output         TXC_DMC_DMA14_inc_head;
output         TXC_DMC_DMA14_reset_done;
output         TXC_DMC_DMA14_mark_bit;
output         TXC_DMC_DMA14_inc_pkt_cnt;

input          DMC_TXC_DMA15_GotNxtDesc;

output         TXC_DMC_DMA15_GetNxtDesc;
output         TXC_DMC_DMA15_inc_head;
output         TXC_DMC_DMA15_reset_done;
output         TXC_DMC_DMA15_mark_bit;
output         TXC_DMC_DMA15_inc_pkt_cnt;

input          DMC_TXC_DMA16_GotNxtDesc;

output         TXC_DMC_DMA16_GetNxtDesc;
output         TXC_DMC_DMA16_inc_head;
output         TXC_DMC_DMA16_reset_done;
output         TXC_DMC_DMA16_mark_bit;
output         TXC_DMC_DMA16_inc_pkt_cnt;

input          DMC_TXC_DMA17_GotNxtDesc;

output         TXC_DMC_DMA17_GetNxtDesc;
output         TXC_DMC_DMA17_inc_head;
output         TXC_DMC_DMA17_reset_done;
output         TXC_DMC_DMA17_mark_bit;
output         TXC_DMC_DMA17_inc_pkt_cnt;

input          DMC_TXC_DMA18_GotNxtDesc;

output         TXC_DMC_DMA18_GetNxtDesc;
output         TXC_DMC_DMA18_inc_head;
output         TXC_DMC_DMA18_reset_done;
output         TXC_DMC_DMA18_mark_bit;
output         TXC_DMC_DMA18_inc_pkt_cnt;

input          DMC_TXC_DMA19_GotNxtDesc;

output         TXC_DMC_DMA19_GetNxtDesc;
output         TXC_DMC_DMA19_inc_head;
output         TXC_DMC_DMA19_reset_done;
output         TXC_DMC_DMA19_mark_bit;
output         TXC_DMC_DMA19_inc_pkt_cnt;

input          DMC_TXC_DMA20_GotNxtDesc;

output         TXC_DMC_DMA20_GetNxtDesc;
output         TXC_DMC_DMA20_inc_head;
output         TXC_DMC_DMA20_reset_done;
output         TXC_DMC_DMA20_mark_bit;
output         TXC_DMC_DMA20_inc_pkt_cnt;

input          DMC_TXC_DMA21_GotNxtDesc;

output         TXC_DMC_DMA21_GetNxtDesc;
output         TXC_DMC_DMA21_inc_head;
output         TXC_DMC_DMA21_reset_done;
output         TXC_DMC_DMA21_mark_bit;
output         TXC_DMC_DMA21_inc_pkt_cnt;

input          DMC_TXC_DMA22_GotNxtDesc;

output         TXC_DMC_DMA22_GetNxtDesc;
output         TXC_DMC_DMA22_inc_head;
output         TXC_DMC_DMA22_reset_done;
output         TXC_DMC_DMA22_mark_bit;
output         TXC_DMC_DMA22_inc_pkt_cnt;

input          DMC_TXC_DMA23_GotNxtDesc;

output         TXC_DMC_DMA23_GetNxtDesc;
output         TXC_DMC_DMA23_inc_head;
output         TXC_DMC_DMA23_reset_done;
output         TXC_DMC_DMA23_mark_bit;
output         TXC_DMC_DMA23_inc_pkt_cnt;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Module Instantiations
/*--------------------------------------------------------------*/
niu_txc_tdmc_error niu_txc_tdmc_error (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_Nack_Pkt_Rd            (Port0_Nack_Pkt_Rd),
        .Port0_DMA_Nack_Pkt_Rd        (Port0_DMA_Nack_Pkt_Rd),
        .Port0_Nack_Pkt_Rd_Addr       (Port0_Nack_Pkt_Rd_Addr),
        .Port1_Nack_Pkt_Rd            (Port1_Nack_Pkt_Rd),
        .Port1_DMA_Nack_Pkt_Rd        (Port1_DMA_Nack_Pkt_Rd),
        .Port1_Nack_Pkt_Rd_Addr       (Port1_Nack_Pkt_Rd_Addr),
        .Port2_Nack_Pkt_Rd            (Port2_Nack_Pkt_Rd),
        .Port2_DMA_Nack_Pkt_Rd        (Port2_DMA_Nack_Pkt_Rd),
        .Port2_Nack_Pkt_Rd_Addr       (Port2_Nack_Pkt_Rd_Addr),
        .Port3_Nack_Pkt_Rd            (Port3_Nack_Pkt_Rd),
        .Port3_DMA_Nack_Pkt_Rd        (Port3_DMA_Nack_Pkt_Rd),
        .Port3_Nack_Pkt_Rd_Addr       (Port3_Nack_Pkt_Rd_Addr),
        .TXC_DMC_Nack_Pkt_Rd          (TXC_DMC_Nack_Pkt_Rd),
        .TXC_DMC_DMA_Nack_Pkt_Rd      (TXC_DMC_DMA_Nack_Pkt_Rd),
        .TXC_DMC_Nack_Pkt_Rd_Addr     (TXC_DMC_Nack_Pkt_Rd_Addr)
       );


niu_txc_tdmc_context niu_txc_tdmc_context0 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA0_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA0_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA0_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA0_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA0),
        .Port1_DMA_inc_head           (Port1_DMA0_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA0_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA0_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA0_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA0),
        .Port2_DMA_inc_head           (Port2_DMA0_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA0_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA0_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA0_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA0),
        .Port3_DMA_inc_head           (Port3_DMA0_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA0_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA0_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA0_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA0),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA0_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA0_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA0_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA0_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA0_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA0_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context1 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA1_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA1_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA1_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA1_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA1),
        .Port1_DMA_inc_head           (Port1_DMA1_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA1_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA1_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA1_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA1),
        .Port2_DMA_inc_head           (Port2_DMA1_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA1_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA1_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA1_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA1),
        .Port3_DMA_inc_head           (Port3_DMA1_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA1_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA1_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA1_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA1),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA1_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA1_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA1_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA1_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA1_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA1_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context2 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA2_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA2_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA2_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA2_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA2),
        .Port1_DMA_inc_head           (Port1_DMA2_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA2_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA2_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA2_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA2),
        .Port2_DMA_inc_head           (Port2_DMA2_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA2_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA2_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA2_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA2),
        .Port3_DMA_inc_head           (Port3_DMA2_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA2_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA2_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA2_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA2),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA2_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA2_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA2_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA2_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA2_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA2_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context3 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA3_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA3_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA3_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA3_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA3),
        .Port1_DMA_inc_head           (Port1_DMA3_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA3_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA3_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA3_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA3),
        .Port2_DMA_inc_head           (Port2_DMA3_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA3_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA3_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA3_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA3),
        .Port3_DMA_inc_head           (Port3_DMA3_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA3_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA3_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA3_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA3),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA3_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA3_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA3_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA3_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA3_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA3_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context4 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA4_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA4_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA4_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA4_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA4),
        .Port1_DMA_inc_head           (Port1_DMA4_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA4_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA4_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA4_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA4),
        .Port2_DMA_inc_head           (Port2_DMA4_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA4_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA4_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA4_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA4),
        .Port3_DMA_inc_head           (Port3_DMA4_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA4_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA4_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA4_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA4),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA4_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA4_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA4_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA4_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA4_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA4_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context5 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA5_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA5_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA5_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA5_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA5),
        .Port1_DMA_inc_head           (Port1_DMA5_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA5_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA5_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA5_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA5),
        .Port2_DMA_inc_head           (Port2_DMA5_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA5_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA5_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA5_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA5),
        .Port3_DMA_inc_head           (Port3_DMA5_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA5_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA5_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA5_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA5),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA5_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA5_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA5_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA5_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA5_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA5_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context6 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA6_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA6_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA6_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA6_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA6),
        .Port1_DMA_inc_head           (Port1_DMA6_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA6_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA6_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA6_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA6),
        .Port2_DMA_inc_head           (Port2_DMA6_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA6_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA6_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA6_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA6),
        .Port3_DMA_inc_head           (Port3_DMA6_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA6_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA6_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA6_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA6),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA6_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA6_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA6_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA6_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA6_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA6_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context7 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA7_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA7_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA7_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA7_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA7),
        .Port1_DMA_inc_head           (Port1_DMA7_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA7_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA7_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA7_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA7),
        .Port2_DMA_inc_head           (Port2_DMA7_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA7_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA7_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA7_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA7),
        .Port3_DMA_inc_head           (Port3_DMA7_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA7_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA7_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA7_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA7),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA7_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA7_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA7_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA7_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA7_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA7_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context8 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA8_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA8_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA8_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA8_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA8),
        .Port1_DMA_inc_head           (Port1_DMA8_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA8_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA8_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA8_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA8),
        .Port2_DMA_inc_head           (Port2_DMA8_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA8_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA8_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA8_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA8),
        .Port3_DMA_inc_head           (Port3_DMA8_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA8_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA8_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA8_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA8),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA8_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA8_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA8_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA8_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA8_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA8_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context9 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA9_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA9_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA9_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA9_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA9),
        .Port1_DMA_inc_head           (Port1_DMA9_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA9_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA9_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA9_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA9),
        .Port2_DMA_inc_head           (Port2_DMA9_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA9_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA9_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA9_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA9),
        .Port3_DMA_inc_head           (Port3_DMA9_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA9_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA9_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA9_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA9),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA9_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA9_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA9_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA9_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA9_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA9_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context10 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA10_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA10_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA10_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA10_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA10),
        .Port1_DMA_inc_head           (Port1_DMA10_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA10_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA10_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA10_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA10),
        .Port2_DMA_inc_head           (Port2_DMA10_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA10_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA10_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA10_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA10),
        .Port3_DMA_inc_head           (Port3_DMA10_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA10_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA10_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA10_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA10),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA10_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA10_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA10_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA10_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA10_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA10_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context11 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA11_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA11_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA11_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA11_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA11),
        .Port1_DMA_inc_head           (Port1_DMA11_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA11_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA11_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA11_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA11),
        .Port2_DMA_inc_head           (Port2_DMA11_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA11_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA11_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA11_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA11),
        .Port3_DMA_inc_head           (Port3_DMA11_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA11_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA11_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA11_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA11),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA11_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA11_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA11_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA11_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA11_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA11_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context12 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA12_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA12_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA12_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA12_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA12),
        .Port1_DMA_inc_head           (Port1_DMA12_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA12_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA12_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA12_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA12),
        .Port2_DMA_inc_head           (Port2_DMA12_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA12_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA12_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA12_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA12),
        .Port3_DMA_inc_head           (Port3_DMA12_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA12_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA12_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA12_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA12),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA12_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA12_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA12_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA12_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA12_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA12_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context13 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA13_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA13_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA13_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA13_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA13),
        .Port1_DMA_inc_head           (Port1_DMA13_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA13_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA13_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA13_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA13),
        .Port2_DMA_inc_head           (Port2_DMA13_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA13_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA13_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA13_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA13),
        .Port3_DMA_inc_head           (Port3_DMA13_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA13_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA13_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA13_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA13),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA13_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA13_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA13_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA13_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA13_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA13_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context14 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA14_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA14_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA14_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA14_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA14),
        .Port1_DMA_inc_head           (Port1_DMA14_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA14_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA14_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA14_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA14),
        .Port2_DMA_inc_head           (Port2_DMA14_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA14_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA14_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA14_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA14),
        .Port3_DMA_inc_head           (Port3_DMA14_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA14_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA14_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA14_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA14),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA14_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA14_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA14_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA14_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA14_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA14_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context15 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA15_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA15_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA15_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA15_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA15),
        .Port1_DMA_inc_head           (Port1_DMA15_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA15_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA15_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA15_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA15),
        .Port2_DMA_inc_head           (Port2_DMA15_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA15_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA15_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA15_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA15),
        .Port3_DMA_inc_head           (Port3_DMA15_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA15_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA15_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA15_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA15),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA15_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA15_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA15_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA15_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA15_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA15_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context16 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA16_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA16_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA16_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA16_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA16),
        .Port1_DMA_inc_head           (Port1_DMA16_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA16_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA16_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA16_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA16),
        .Port2_DMA_inc_head           (Port2_DMA16_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA16_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA16_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA16_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA16),
        .Port3_DMA_inc_head           (Port3_DMA16_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA16_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA16_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA16_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA16),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA16_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA16_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA16_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA16_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA16_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA16_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context17 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA17_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA17_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA17_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA17_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA17),
        .Port1_DMA_inc_head           (Port1_DMA17_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA17_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA17_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA17_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA17),
        .Port2_DMA_inc_head           (Port2_DMA17_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA17_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA17_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA17_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA17),
        .Port3_DMA_inc_head           (Port3_DMA17_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA17_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA17_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA17_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA17),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA17_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA17_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA17_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA17_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA17_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA17_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context18 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA18_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA18_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA18_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA18_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA18),
        .Port1_DMA_inc_head           (Port1_DMA18_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA18_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA18_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA18_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA18),
        .Port2_DMA_inc_head           (Port2_DMA18_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA18_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA18_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA18_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA18),
        .Port3_DMA_inc_head           (Port3_DMA18_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA18_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA18_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA18_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA18),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA18_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA18_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA18_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA18_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA18_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA18_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context19 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA19_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA19_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA19_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA19_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA19),
        .Port1_DMA_inc_head           (Port1_DMA19_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA19_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA19_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA19_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA19),
        .Port2_DMA_inc_head           (Port2_DMA19_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA19_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA19_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA19_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA19),
        .Port3_DMA_inc_head           (Port3_DMA19_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA19_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA19_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA19_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA19),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA19_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA19_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA19_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA19_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA19_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA19_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context20 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA20_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA20_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA20_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA20_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA20),
        .Port1_DMA_inc_head           (Port1_DMA20_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA20_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA20_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA20_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA20),
        .Port2_DMA_inc_head           (Port2_DMA20_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA20_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA20_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA20_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA20),
        .Port3_DMA_inc_head           (Port3_DMA20_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA20_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA20_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA20_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA20),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA20_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA20_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA20_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA20_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA20_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA20_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context21 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA21_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA21_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA21_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA21_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA21),
        .Port1_DMA_inc_head           (Port1_DMA21_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA21_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA21_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA21_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA21),
        .Port2_DMA_inc_head           (Port2_DMA21_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA21_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA21_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA21_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA21),
        .Port3_DMA_inc_head           (Port3_DMA21_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA21_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA21_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA21_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA21),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA21_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA21_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA21_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA21_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA21_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA21_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context22 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA22_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA22_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA22_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA22_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA22),
        .Port1_DMA_inc_head           (Port1_DMA22_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA22_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA22_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA22_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA22),
        .Port2_DMA_inc_head           (Port2_DMA22_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA22_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA22_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA22_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA22),
        .Port3_DMA_inc_head           (Port3_DMA22_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA22_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA22_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA22_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA22),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA22_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA22_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA22_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA22_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA22_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA22_inc_pkt_cnt)
       );

niu_txc_tdmc_context niu_txc_tdmc_context23 (
        .SysClk                       (SysClk),
        .Reset_L                      (Reset_L),
        .Port0_DMA_inc_head           (Port0_DMA23_inc_head),
        .Port0_DMA_reset_done         (Port0_DMA23_reset_done),
        .Port0_DMA_mark_bit           (Port0_DMA23_mark_bit),
        .Port0_DMA_inc_pkt_cnt        (Port0_DMA23_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA      (Port0_SetGetNextDescDMA23),
        .Port1_DMA_inc_head           (Port1_DMA23_inc_head),
        .Port1_DMA_reset_done         (Port1_DMA23_reset_done),
        .Port1_DMA_mark_bit           (Port1_DMA23_mark_bit),
        .Port1_DMA_inc_pkt_cnt        (Port1_DMA23_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA      (Port1_SetGetNextDescDMA23),
        .Port2_DMA_inc_head           (Port2_DMA23_inc_head),
        .Port2_DMA_reset_done         (Port2_DMA23_reset_done),
        .Port2_DMA_mark_bit           (Port2_DMA23_mark_bit),
        .Port2_DMA_inc_pkt_cnt        (Port2_DMA23_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA      (Port2_SetGetNextDescDMA23),
        .Port3_DMA_inc_head           (Port3_DMA23_inc_head),
        .Port3_DMA_reset_done         (Port3_DMA23_reset_done),
        .Port3_DMA_mark_bit           (Port3_DMA23_mark_bit),
        .Port3_DMA_inc_pkt_cnt        (Port3_DMA23_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA      (Port3_SetGetNextDescDMA23),
        .DMC_TXC_DMA_GotNxtDesc       (DMC_TXC_DMA23_GotNxtDesc),
        .TXC_DMC_DMA_GetNxtDesc       (TXC_DMC_DMA23_GetNxtDesc),
        .TXC_DMC_DMA_inc_head         (TXC_DMC_DMA23_inc_head),
        .TXC_DMC_DMA_reset_done       (TXC_DMC_DMA23_reset_done),
        .TXC_DMC_DMA_mark_bit         (TXC_DMC_DMA23_mark_bit),
        .TXC_DMC_DMA_inc_pkt_cnt      (TXC_DMC_DMA23_inc_pkt_cnt)
       );

endmodule
