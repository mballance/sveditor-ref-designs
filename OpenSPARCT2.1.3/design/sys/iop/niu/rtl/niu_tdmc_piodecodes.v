// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_piodecodes.v
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
 *  NIU TDMC - PIO Decodes and Interface for 32 DMAs
 *
 *  Orignal Author(s):   Arvind Srinivasan
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

`include "niu_dmc_reg_defines.h"
`include "txc_defines.h"


module niu_tdmc_piodecodes (/*AUTOJUNK*/
   // Outputs
   tdmc_pio_ack, tdmc_pio_err, tdmc_pio_rdata,
   Slave_Read_dma0_3, Slave_Sel_dma0_3, Slave_Addr_dma0_3,pio_clients_32b_d_dma0_3, 
   Slave_Read_dma4_7, Slave_Sel_dma4_7, Slave_Addr_dma4_7,pio_clients_32b_d_dma4_7, 
   Slave_Read_dma8_11, Slave_Sel_dma8_11, Slave_Addr_dma8_11,pio_clients_32b_d_dma8_11, 
   Slave_Read_dma12_15, Slave_Sel_dma12_15, Slave_Addr_dma12_15,pio_clients_32b_d_dma12_15, 

   debug_select, training_vector, parity_corrupt_config,  
   slaveStrobe, Slave_DataIn,
   write_DMA0_Register, write_DMA1_Register, write_DMA2_Register, 
   write_DMA3_Register, write_DMA4_Register, write_DMA5_Register, 
   write_DMA6_Register, write_DMA7_Register, write_DMA8_Register, 
   write_DMA9_Register, write_DMA10_Register, write_DMA11_Register, 
   write_DMA12_Register, write_DMA13_Register, write_DMA14_Register, 
   write_DMA15_Register,
`ifdef NEPTUNE
   Slave_Read_dma16_19, Slave_Sel_dma16_19, Slave_Addr_dma16_19,pio_clients_32b_d_dma16_19, 
   Slave_Read_dma20_23, Slave_Sel_dma20_23, Slave_Addr_dma20_23,pio_clients_32b_d_dma20_23, 
 write_DMA16_Register, write_DMA17_Register, 
   write_DMA18_Register, write_DMA19_Register, write_DMA20_Register, 
   write_DMA21_Register, write_DMA22_Register, write_DMA23_Register, 
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
			    
   write_FZC_DMA0_Register, write_FZC_DMA1_Register, 
   write_FZC_DMA2_Register, write_FZC_DMA3_Register, 
   write_FZC_DMA4_Register, write_FZC_DMA5_Register, 
   write_FZC_DMA6_Register, write_FZC_DMA7_Register, 
   write_FZC_DMA8_Register, write_FZC_DMA9_Register, 
   write_FZC_DMA10_Register, write_FZC_DMA11_Register, 
   write_FZC_DMA12_Register, write_FZC_DMA13_Register, 
   write_FZC_DMA14_Register, write_FZC_DMA15_Register, 
`ifdef NEPTUNE
   write_FZC_DMA16_Register, write_FZC_DMA17_Register, 
   write_FZC_DMA18_Register, write_FZC_DMA19_Register, 
   write_FZC_DMA20_Register, write_FZC_DMA21_Register, 
   write_FZC_DMA22_Register, write_FZC_DMA23_Register, 
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
			    
   read_DMA_0_3_Regsister, read_DMA_4_7_Regsister, 
   read_DMA_8_11_Regsister, read_DMA_12_15_Regsister, 
`ifdef NEPTUNE
   read_DMA_16_19_Regsister, read_DMA_20_23_Regsister, 
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
			    
   dmc_txc_tx_addr_md, 
   // Inputs
   SysClk, Reset_L, 
   pio_clients_rd, pio_tdmc_sel, pio_clients_addr, pio_clients_wdata,
   pio_clients_32b, dma_0_3_sl_data, dma_4_7_sl_data, 
   dma_8_11_sl_data, dma_12_15_sl_data, dma_16_19_sl_data, 
   dma_20_23_sl_data,
   read_decode_invalid_dma0_3, read_decode_invalid_dma4_7,
   read_decode_invalid_dma8_11, read_decode_invalid_dma12_15,
   read_decode_invalid_dma16_19, read_decode_invalid_dma20_23

   ) ;

   // Global Signals
   input          SysClk;
   input 	  Reset_L;

   output [5:0]   debug_select;
   output [31:0] training_vector;
   output [31:0]  parity_corrupt_config;
   // PIO I/F Inputs
   output 	  tdmc_pio_ack;                        // pio read data ack
   output 	  tdmc_pio_err;                        // pio read data error
   output [63:0]  tdmc_pio_rdata;                      // pio read data
   input 	  pio_clients_rd;                     // pio read
   input 	  pio_tdmc_sel;                        // pio DMC select
   input [19:0]   pio_clients_addr;                   // pio address
   input [63:0]   pio_clients_wdata;                  // pio write data
   input 	  pio_clients_32b;

   output 	  pio_clients_32b_d_dma0_3;
   output 	  Slave_Read_dma0_3;
   output 	  Slave_Sel_dma0_3;
   output [19:0]  Slave_Addr_dma0_3;

   output 	  pio_clients_32b_d_dma4_7;
   output 	  Slave_Read_dma4_7;
   output 	  Slave_Sel_dma4_7;
   output [19:0]  Slave_Addr_dma4_7;

   output 	  pio_clients_32b_d_dma8_11;
   output 	  Slave_Read_dma8_11;
   output 	  Slave_Sel_dma8_11;
   output [19:0]  Slave_Addr_dma8_11;
   
   output 	  pio_clients_32b_d_dma12_15;
   output 	  Slave_Read_dma12_15;
   output 	  Slave_Sel_dma12_15;
   output [19:0]  Slave_Addr_dma12_15;

   output [63:0]  Slave_DataIn;
   output 	  slaveStrobe;

   // decode signals
   output 	  write_DMA0_Register;
   output 	  write_DMA1_Register;
   output 	  write_DMA2_Register;
   output 	  write_DMA3_Register;
   output 	  write_DMA4_Register;
   output 	  write_DMA5_Register;
   output 	  write_DMA6_Register;
   output 	  write_DMA7_Register;
   output 	  write_DMA8_Register;
   output 	  write_DMA9_Register;
   output 	  write_DMA10_Register;
   output 	  write_DMA11_Register;
   output 	  write_DMA12_Register;
   output 	  write_DMA13_Register;
   output 	  write_DMA14_Register;
   output 	  write_DMA15_Register;
`ifdef NEPTUNE
   output 	  pio_clients_32b_d_dma16_19;
   output 	  Slave_Read_dma16_19;
   output 	  Slave_Sel_dma16_19;
   output [19:0]  Slave_Addr_dma16_19;

   output 	  pio_clients_32b_d_dma20_23;
   output 	  Slave_Read_dma20_23;
   output 	  Slave_Sel_dma20_23;
   output [19:0]  Slave_Addr_dma20_23;

   output 	  write_DMA16_Register;
   output 	  write_DMA17_Register;
   output 	  write_DMA18_Register;
   output 	  write_DMA19_Register;
   output 	  write_DMA20_Register;
   output 	  write_DMA21_Register;
   output 	  write_DMA22_Register;
   output 	  write_DMA23_Register;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   
  

   
   output 	  write_FZC_DMA0_Register ;
   output 	  write_FZC_DMA1_Register ;
   output 	  write_FZC_DMA2_Register ;
   output 	  write_FZC_DMA3_Register ;
   output 	  write_FZC_DMA4_Register ;
   output 	  write_FZC_DMA5_Register ;
   output 	  write_FZC_DMA6_Register ;
   output 	  write_FZC_DMA7_Register ;
   output 	  write_FZC_DMA8_Register ;
   output 	  write_FZC_DMA9_Register ;
   output 	  write_FZC_DMA10_Register ;
   output 	  write_FZC_DMA11_Register ;
   output 	  write_FZC_DMA12_Register ;
   output 	  write_FZC_DMA13_Register ;
   output 	  write_FZC_DMA14_Register ;
   output 	  write_FZC_DMA15_Register ;
`ifdef NEPTUNE
   output 	  write_FZC_DMA16_Register ;
   output 	  write_FZC_DMA17_Register ;
   output 	  write_FZC_DMA18_Register ;
   output 	  write_FZC_DMA19_Register ;
   output 	  write_FZC_DMA20_Register ;
   output 	  write_FZC_DMA21_Register ;
   output 	  write_FZC_DMA22_Register ;
   output 	  write_FZC_DMA23_Register ;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   



   output [7:0]   read_DMA_0_3_Regsister;
   output [7:0]   read_DMA_4_7_Regsister;
   output [7:0]   read_DMA_8_11_Regsister;
   output [7:0]   read_DMA_12_15_Regsister;
`ifdef NEPTUNE
   output [7:0]   read_DMA_16_19_Regsister;
   output [7:0]   read_DMA_20_23_Regsister;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   

 
   output 	  dmc_txc_tx_addr_md;

   // read data inputs
   input [63:0]   dma_0_3_sl_data;
   input [63:0]   dma_4_7_sl_data;
   input [63:0]   dma_8_11_sl_data;
   input [63:0]   dma_12_15_sl_data;
   input [63:0]   dma_16_19_sl_data;
   input [63:0]   dma_20_23_sl_data;
   input           read_decode_invalid_dma0_3;
   input           read_decode_invalid_dma4_7;
   input           read_decode_invalid_dma8_11;
   input           read_decode_invalid_dma12_15;
   input           read_decode_invalid_dma16_19;
   input           read_decode_invalid_dma20_23;
  

   
   
   //
   /*--------------------------------------------------------------*/
   // Wires & Registers
   /*--------------------------------------------------------------*/
   reg 		  Slave_Ack;
   reg 		  Slave_Err;
   reg [63:0] 	  Slave_DataOut;

   wire 	  slaveStrobe;
   wire 	  readSlaveReg_dma0_3;
   wire 	  writeSlaveReg_dma0_3;

   wire 	  readSlaveReg_dma4_7;
   wire 	  writeSlaveReg_dma4_7;

   wire 	  readSlaveReg_dma8_11;
   wire 	  writeSlaveReg_dma8_11;

   wire 	  readSlaveReg_dma12_15;
   wire 	  writeSlaveReg_dma12_15;

   wire 	  dma_fzc_decode_dma0_3;
   wire 	  dma_fzc_decode_dma4_7;
   wire 	  dma_fzc_decode_dma8_11;
   wire 	  dma_fzc_decode_dma12_15;

`ifdef NEPTUNE
   wire 	  readSlaveReg_dma16_19;
   wire 	  writeSlaveReg_dma16_19;
   wire 	  readSlaveReg_dma20_23;
   wire 	  writeSlaveReg_dma20_23;

   wire 	  dma_fzc_decode_dma16_19;
   wire 	  dma_fzc_decode_dma20_23;
`else
`endif


   reg 		  en_Slave_Ack;
   reg 		  en_Slave_AckD1;
   wire 	  niu_dmc_RSV_decode;




   wire 	  read_DMA0_Register ;
   wire 	  write_DMA0_Register;
   wire 	  read_FZC_DMA0_Register;
   wire 	  write_FZC_DMA0_Register;
   wire 	  dma0_decode ;
   wire 	  dma0_rsv_space ;
   wire 	  read_DMA1_Register ;
   wire 	  write_DMA1_Register;
   wire 	  read_FZC_DMA1_Register;
   wire 	  write_FZC_DMA1_Register;
   wire 	  dma1_decode ;
   wire 	  dma1_rsv_space ;
   wire 	  read_DMA2_Register ;
   wire 	  write_DMA2_Register;
   wire 	  read_FZC_DMA2_Register;
   wire 	  write_FZC_DMA2_Register;
   wire 	  dma2_decode ;
   wire 	  dma2_rsv_space ;
   wire 	  read_DMA3_Register ;
   wire 	  write_DMA3_Register;
   wire 	  read_FZC_DMA3_Register;
   wire 	  write_FZC_DMA3_Register;
   wire 	  dma3_decode ;
   wire 	  dma3_rsv_space ;
   wire 	  read_DMA4_Register ;
   wire 	  write_DMA4_Register;
   wire 	  read_FZC_DMA4_Register;
   wire 	  write_FZC_DMA4_Register;
   wire 	  dma4_decode ;
   wire 	  dma4_rsv_space ;
   wire 	  read_DMA5_Register ;
   wire 	  write_DMA5_Register;
   wire 	  read_FZC_DMA5_Register;
   wire 	  write_FZC_DMA5_Register;
   wire 	  dma5_decode ;
   wire 	  dma5_rsv_space ;
   wire 	  read_DMA6_Register ;
   wire 	  write_DMA6_Register;
   wire 	  read_FZC_DMA6_Register;
   wire 	  write_FZC_DMA6_Register;
   wire 	  dma6_decode ;
   wire 	  dma6_rsv_space ;
   wire 	  read_DMA7_Register ;
   wire 	  write_DMA7_Register;
   wire 	  read_FZC_DMA7_Register;
   wire 	  write_FZC_DMA7_Register;
   wire 	  dma7_decode ;
   wire 	  dma7_rsv_space ;
   wire 	  read_DMA8_Register ;
   wire 	  write_DMA8_Register;
   wire 	  read_FZC_DMA8_Register;
   wire 	  write_FZC_DMA8_Register;
   wire 	  dma8_decode ;
   wire 	  dma8_rsv_space ;
   wire 	  read_DMA9_Register ;
   wire 	  write_DMA9_Register;
   wire 	  read_FZC_DMA9_Register;
   wire 	  write_FZC_DMA9_Register;
   wire 	  dma9_decode ;
   wire 	  dma9_rsv_space ;
   wire 	  read_DMA10_Register ;
   wire 	  write_DMA10_Register;
   wire 	  read_FZC_DMA10_Register;
   wire 	  write_FZC_DMA10_Register;
   wire 	  dma10_decode ;
   wire 	  dma10_rsv_space ;
   wire 	  read_DMA11_Register ;
   wire 	  write_DMA11_Register;
   wire 	  read_FZC_DMA11_Register;
   wire 	  write_FZC_DMA11_Register;
   wire 	  dma11_decode ;
   wire 	  dma11_rsv_space ;
   wire 	  read_DMA12_Register ;
   wire 	  write_DMA12_Register;
   wire 	  read_FZC_DMA12_Register;
   wire 	  write_FZC_DMA12_Register;
   wire 	  dma12_decode ;
   wire 	  dma12_rsv_space ;
   wire 	  read_DMA13_Register ;
   wire 	  write_DMA13_Register;
   wire 	  read_FZC_DMA13_Register;
   wire 	  write_FZC_DMA13_Register;
   wire 	  dma13_decode ;
   wire 	  dma13_rsv_space ;
   wire 	  read_DMA14_Register ;
   wire 	  write_DMA14_Register;
   wire 	  read_FZC_DMA14_Register;
   wire 	  write_FZC_DMA14_Register;
   wire 	  dma14_decode ;
   wire 	  dma14_rsv_space ;
   wire 	  read_DMA15_Register ;
   wire 	  write_DMA15_Register;
   wire 	  read_FZC_DMA15_Register;
   wire 	  write_FZC_DMA15_Register;
   wire 	  dma15_decode ;
   wire 	  dma15_rsv_space ;
   wire 	  read_DMA16_Register ;
   wire 	  write_DMA16_Register;
   wire 	  read_FZC_DMA16_Register;
   wire 	  write_FZC_DMA16_Register;
   wire 	  dma16_decode ;
   wire 	  dma16_rsv_space ;
   wire 	  read_DMA17_Register ;
   wire 	  write_DMA17_Register;
   wire 	  read_FZC_DMA17_Register;
   wire 	  write_FZC_DMA17_Register;
   wire 	  dma17_decode ;
   wire 	  dma17_rsv_space ;
   wire 	  read_DMA18_Register ;
   wire 	  write_DMA18_Register;
   wire 	  read_FZC_DMA18_Register;
   wire 	  write_FZC_DMA18_Register;
   wire 	  dma18_decode ;
   wire 	  dma18_rsv_space ;
   wire 	  read_DMA19_Register ;
   wire 	  write_DMA19_Register;
   wire 	  read_FZC_DMA19_Register;
   wire 	  write_FZC_DMA19_Register;
   wire 	  dma19_decode ;
   wire 	  dma19_rsv_space ;
   wire 	  read_DMA20_Register ;
   wire 	  write_DMA20_Register;
   wire 	  read_FZC_DMA20_Register;
   wire 	  write_FZC_DMA20_Register;
   wire 	  dma20_decode ;
   wire 	  dma20_rsv_space ;
   wire 	  read_DMA21_Register ;
   wire 	  write_DMA21_Register;
   wire 	  read_FZC_DMA21_Register;
   wire 	  write_FZC_DMA21_Register;
   wire 	  dma21_decode ;
   wire 	  dma21_rsv_space ;
   wire 	  read_DMA22_Register ;
   wire 	  write_DMA22_Register;
   wire 	  read_FZC_DMA22_Register;
   wire 	  write_FZC_DMA22_Register;
   wire 	  dma22_decode ;
   wire 	  dma22_rsv_space ;
   wire 	  read_DMA23_Register ;
   wire 	  write_DMA23_Register;
   wire 	  read_FZC_DMA23_Register;
   wire 	  write_FZC_DMA23_Register;
   wire 	  dma23_decode ;
   wire 	  dma23_rsv_space ;

 
   wire [7:0] 	  read_DMA_0_3_Regsister;
   wire [7:0] 	  read_DMA_4_7_Regsister;
   wire [7:0] 	  read_DMA_8_11_Regsister;
   wire [7:0] 	  read_DMA_12_15_Regsister;
   wire [7:0] 	  read_DMA_16_19_Regsister;
   wire [7:0] 	  read_DMA_20_23_Regsister;
 
   reg 		  dmc_txc_tx_addr_md;
   wire 	  tx_addr_md_decode;
   wire 	  read_tx_addr_md ;
   wire 	  write_tx_addr_md;
   wire 	  par_corrupt_decode;
   wire 	  read_parity_corrupt_config ;
   wire 	  write_parity_corrupt_config;


   reg [31:0] 	  parity_corrupt_config;
   
   reg [5:0] 	  debug_select;
   reg [31:0] 	  training_vector;
   wire 	  debug_reg_select ;
   wire 	  read_debug_reg ;
   wire 	  write_debug_reg;
   wire 	  debug_training_sel;
   wire 	  read_training_reg ;
   wire 	  write_training_reg;
   wire 	  valid_reads;
   wire 	  pio_32bit_read_resp;
   wire 	  read_decode_invalid_dma;
   
/* DUPLICATE THE FLOPS FOR Fixing High Fanout issues */
   reg [19:0] 	  pio_clients_addr_reg_dma0_3 ;
   reg 		  pio_clients_rd_reg_dma0_3 ;
   reg 		  pio_dmc_sel_reg_dma0_3 ;
   reg 		  pio_clients_32b_d_dma0_3;

   reg [19:0] 	  pio_clients_addr_reg_dma4_7 ;
   reg 		  pio_clients_rd_reg_dma4_7 ;
   reg 		  pio_dmc_sel_reg_dma4_7 ;
   reg 		  pio_clients_32b_d_dma4_7;

   reg [19:0] 	  pio_clients_addr_reg_dma8_11 ;
   reg 		  pio_clients_rd_reg_dma8_11 ;
   reg 		  pio_dmc_sel_reg_dma8_11 ;
   reg 		  pio_clients_32b_d_dma8_11;

   reg [19:0] 	  pio_clients_addr_reg_dma12_15 ;
   reg 		  pio_clients_rd_reg_dma12_15 ;
   reg 		  pio_dmc_sel_reg_dma12_15 ;
   reg 		  pio_clients_32b_d_dma12_15;
`ifdef NEPTUNE
   reg [19:0] 	  pio_clients_addr_reg_dma16_19 ;
   reg 		  pio_clients_rd_reg_dma16_19 ;
   reg 		  pio_dmc_sel_reg_dma16_19 ;
   reg 		  pio_clients_32b_d_dma16_19;

   reg [19:0] 	  pio_clients_addr_reg_dma20_23 ;
   reg 		  pio_clients_rd_reg_dma20_23 ;
   reg 		  pio_dmc_sel_reg_dma20_23 ;
   reg 		  pio_clients_32b_d_dma20_23;
`else // !`ifdef NEPTUNE
`endif // !`ifdef NEPTUNE
   
   
   reg [63:0] 	  pio_clients_wdata_reg ;
   
   wire 	  Slave_Read_dma0_3;
   wire 	  Slave_Sel_dma0_3;
   wire [19:0] 	  Slave_Addr_dma0_3;

   wire 	  Slave_Read_dma4_7;
   wire 	  Slave_Sel_dma4_7;
   wire [19:0] 	  Slave_Addr_dma4_7;

   wire 	  Slave_Read_dma8_11;
   wire 	  Slave_Sel_dma8_11;
   wire [19:0] 	  Slave_Addr_dma8_11;
   
   wire 	  Slave_Read_dma12_15;
   wire 	  Slave_Sel_dma12_15;
   wire [19:0] 	  Slave_Addr_dma12_15;


`ifdef NEPTUNE
   wire 	  Slave_Read_dma16_19;
   wire 	  Slave_Sel_dma16_19;
   wire [19:0] 	  Slave_Addr_dma16_19;
   
   wire 	  Slave_Read_dma20_23;
   wire 	  Slave_Sel_dma20_23;
   wire [19:0] 	  Slave_Addr_dma20_23;
`else
`endif
   
   wire [63:0] 	  Slave_DataIn;
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_wdata_reg <= 64'h0;
      end else begin
	 pio_clients_wdata_reg <= pio_clients_wdata;
      end
   end

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma0_3 <= 20'h0;
	 pio_clients_rd_reg_dma0_3 <= 1'b0;
	 pio_dmc_sel_reg_dma0_3 <= 1'b0;
	 pio_clients_32b_d_dma0_3 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma0_3 <= pio_clients_addr;
	 pio_clients_rd_reg_dma0_3 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma0_3 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma0_3 <= pio_clients_32b;
      end
   end

    always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma4_7 <= 20'h0;
	 pio_clients_rd_reg_dma4_7 <= 1'b0;
	 pio_dmc_sel_reg_dma4_7 <= 1'b0;
	 pio_clients_32b_d_dma4_7 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma4_7 <= pio_clients_addr;
	 pio_clients_rd_reg_dma4_7 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma4_7 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma4_7 <= pio_clients_32b;
      end
   end

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma8_11 <= 20'h0;
	 pio_clients_rd_reg_dma8_11 <= 1'b0;
	 pio_dmc_sel_reg_dma8_11 <= 1'b0;
	 pio_clients_32b_d_dma8_11 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma8_11 <= pio_clients_addr;
	 pio_clients_rd_reg_dma8_11 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma8_11 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma8_11 <= pio_clients_32b;
      end
   end

     always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma12_15 <= 20'h0;
	 pio_clients_rd_reg_dma12_15 <= 1'b0;
	 pio_dmc_sel_reg_dma12_15 <= 1'b0;
	 pio_clients_32b_d_dma12_15 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma12_15 <= pio_clients_addr;
	 pio_clients_rd_reg_dma12_15 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma12_15 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma12_15 <= pio_clients_32b;
      end
   end

`ifdef NEPTUNE
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma16_19 <= 20'h0;
	 pio_clients_rd_reg_dma16_19 <= 1'b0;
	 pio_dmc_sel_reg_dma16_19 <= 1'b0;
	 pio_clients_32b_d_dma16_19 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma16_19 <= pio_clients_addr;
	 pio_clients_rd_reg_dma16_19 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma16_19 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma16_19 <= pio_clients_32b;
      end
   end

     always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pio_clients_addr_reg_dma20_23 <= 20'h0;
	 pio_clients_rd_reg_dma20_23 <= 1'b0;
	 pio_dmc_sel_reg_dma20_23 <= 1'b0;
	 pio_clients_32b_d_dma20_23 <= 1'b0;
      end else begin
	 pio_clients_addr_reg_dma20_23 <= pio_clients_addr;
	 pio_clients_rd_reg_dma20_23 <= pio_clients_rd;
	 pio_dmc_sel_reg_dma20_23 <= pio_tdmc_sel;
	 pio_clients_32b_d_dma20_23 <= pio_clients_32b;
      end
   end
`else
`endif
   
   
   
   
   assign Slave_Read_dma0_3= pio_clients_rd_reg_dma0_3 ;
   assign Slave_Sel_dma0_3= pio_dmc_sel_reg_dma0_3 ;
   assign Slave_Addr_dma0_3=pio_clients_addr_reg_dma0_3;

   assign Slave_Read_dma4_7= pio_clients_rd_reg_dma4_7 ;
   assign Slave_Sel_dma4_7= pio_dmc_sel_reg_dma4_7 ;
   assign Slave_Addr_dma4_7=pio_clients_addr_reg_dma4_7;

   assign Slave_Read_dma8_11= pio_clients_rd_reg_dma8_11 ;
   assign Slave_Sel_dma8_11= pio_dmc_sel_reg_dma8_11 ;
   assign Slave_Addr_dma8_11=pio_clients_addr_reg_dma8_11;

   assign Slave_Read_dma12_15= pio_clients_rd_reg_dma12_15 ;
   assign Slave_Sel_dma12_15= pio_dmc_sel_reg_dma12_15 ;
   assign Slave_Addr_dma12_15=pio_clients_addr_reg_dma12_15;

`ifdef NEPTUNE
   assign Slave_Read_dma16_19= pio_clients_rd_reg_dma16_19 ;
   assign Slave_Sel_dma16_19= pio_dmc_sel_reg_dma16_19 ;
   assign Slave_Addr_dma16_19=pio_clients_addr_reg_dma16_19;

   assign Slave_Read_dma20_23= pio_clients_rd_reg_dma20_23 ;
   assign Slave_Sel_dma20_23= pio_dmc_sel_reg_dma20_23 ;
   assign Slave_Addr_dma20_23=pio_clients_addr_reg_dma20_23;

`else
`endif
   assign Slave_DataIn =pio_clients_wdata_reg;

   assign tdmc_pio_ack =  Slave_Ack;
   assign tdmc_pio_err	  =  Slave_Err;
   assign tdmc_pio_rdata =  Slave_DataOut;
   
   /*--------------------------------------------------------------*/
   // Address Decodes
   /*--------------------------------------------------------------*/
   assign 	  readSlaveReg_dma0_3       = (Slave_Sel_dma0_3 & Slave_Read_dma0_3);
   assign 	  writeSlaveReg_dma0_3      = (Slave_Sel_dma0_3 & ~Slave_Read_dma0_3);

   assign 	  readSlaveReg_dma4_7       = (Slave_Sel_dma4_7 & Slave_Read_dma4_7);
   assign 	  writeSlaveReg_dma4_7      = (Slave_Sel_dma4_7 & ~Slave_Read_dma4_7);
   
   assign 	  readSlaveReg_dma8_11       = (Slave_Sel_dma8_11 & Slave_Read_dma8_11);
   assign 	  writeSlaveReg_dma8_11      = (Slave_Sel_dma8_11 & ~Slave_Read_dma8_11);

   assign 	  readSlaveReg_dma12_15       = (Slave_Sel_dma12_15 & Slave_Read_dma12_15);
   assign 	  writeSlaveReg_dma12_15      = (Slave_Sel_dma12_15 & ~Slave_Read_dma12_15);

   `ifdef NEPTUNE
   assign 	  readSlaveReg_dma16_19       = (Slave_Sel_dma16_19 & Slave_Read_dma16_19);
   assign 	  writeSlaveReg_dma16_19      = (Slave_Sel_dma16_19 & ~Slave_Read_dma16_19);
   assign 	  readSlaveReg_dma20_23       = (Slave_Sel_dma20_23 & Slave_Read_dma20_23);
   assign 	  writeSlaveReg_dma20_23      = (Slave_Sel_dma20_23 & ~Slave_Read_dma20_23);
   `else
   `endif
   // assign niu_dmc_RSV_decode  = ({1'h0, Slave_Addr[18:12]} == `NIU_DMC_RSV);??
   assign 	  niu_dmc_RSV_decode = (~valid_reads & readSlaveReg_dma0_3) | ( read_decode_invalid_dma & readSlaveReg_dma0_3);
   assign         read_decode_invalid_dma =  | {read_decode_invalid_dma0_3, read_decode_invalid_dma4_7,
   				   	        read_decode_invalid_dma8_11, read_decode_invalid_dma12_15,
   				   	        read_decode_invalid_dma16_19, read_decode_invalid_dma20_23};
  


   
   
   /*--------------------------------------------------------------*/
   // Slave Control Logic
   /*--------------------------------------------------------------*/
   always @ (posedge SysClk )
     if (!Reset_L) en_Slave_Ack <= 1'b0;
     else          en_Slave_Ack <= Slave_Sel_dma0_3;

   always @ (posedge SysClk )
     if (!Reset_L) en_Slave_AckD1 <= 1'b0;
     else          en_Slave_AckD1 <= en_Slave_Ack;

   assign 	  slaveStrobe = en_Slave_Ack & ~en_Slave_AckD1;

   /*--------------------------------------------------------------*/
   // Slave Interface
   /*--------------------------------------------------------------*/
   always @ (posedge SysClk )
     if (!Reset_L)         Slave_Ack <= 1'b0;
     else if (slaveStrobe) Slave_Ack <= 1'b1;
     else                  Slave_Ack <= 1'b0;

   always @ (posedge SysClk )
     if (!Reset_L)
       Slave_Err <= 1'b0;
     else if (slaveStrobe)
       begin
          if (niu_dmc_RSV_decode)  Slave_Err <= 1'b1;
          else                     Slave_Err <= 1'b0;
       end
     else
       Slave_Err <= 1'b0;

   assign dma_fzc_decode_dma0_3 = Slave_Addr_dma0_3[19];
   assign dma_fzc_decode_dma4_7 = Slave_Addr_dma4_7[19];
   assign dma_fzc_decode_dma8_11= Slave_Addr_dma8_11[19];
   assign dma_fzc_decode_dma12_15 = Slave_Addr_dma12_15[19];
   `ifdef NEPTUNE
   assign dma_fzc_decode_dma16_19 = Slave_Addr_dma16_19[19];
   assign dma_fzc_decode_dma20_23 = Slave_Addr_dma20_23[19];
   `else
   `endif


   
   assign debug_reg_select = ({1'h0, Slave_Addr_dma0_3[18:3],3'h0} == `TDMC_DEBUG_SELECT);
   assign read_debug_reg = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & debug_reg_select );
   assign write_debug_reg = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & debug_reg_select );

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  debug_select <= 6'b0;
       end else begin // if (!Reset_L)
	  if (write_debug_reg & ~Slave_Addr_dma0_3[2] ) begin
	     debug_select <= Slave_DataIn[5:0];
	  end // if (write_tx_addr_md )
       end // else: !if(!Reset_L)
  
   assign debug_training_sel = ({1'h0, Slave_Addr_dma0_3[18:3],3'h0} == `TDMC_TRAINING_VECTOR);
   assign read_training_reg = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & debug_training_sel );
   assign write_training_reg = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & debug_training_sel );
   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  training_vector <= 32'b0;
       end else begin // if (!Reset_L)
	  if (write_training_reg & ~Slave_Addr_dma0_3[2] ) begin
	     training_vector <= Slave_DataIn[31:0];
	  end // if (write_tx_addr_md )
       end // else: !if(!Reset_L)
   
   


   // for a common register to be shared with all the DMAs

   
   assign tx_addr_md_decode = ({1'h0, Slave_Addr_dma0_3[18:3],3'h0} == `TX_ADDR_MD);
   assign read_tx_addr_md = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & tx_addr_md_decode );
   assign write_tx_addr_md = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & tx_addr_md_decode );

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  dmc_txc_tx_addr_md <= 1'b0;
       end else begin // if (!Reset_L)
	  if (write_tx_addr_md & ~Slave_Addr_dma0_3[2] ) begin
	     dmc_txc_tx_addr_md <= Slave_DataIn[0];
	  end // if (write_tx_addr_md )
       end // else: !if(!Reset_L)
   
   assign par_corrupt_decode = ({1'h0, Slave_Addr_dma0_3[18:3],3'h0} == `TX_CACHE_PAR_CORRUPT);
   assign read_parity_corrupt_config = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & par_corrupt_decode );
   assign write_parity_corrupt_config = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & par_corrupt_decode  );


   always @ (posedge SysClk )
     if (!Reset_L)
       parity_corrupt_config <= 32'h0;
     else begin
	if(write_parity_corrupt_config & ~Slave_Addr_dma0_3[2]) begin
`ifdef NEPTUNE
	   parity_corrupt_config <= {8'h0,Slave_DataIn[23:0]};
`else
	   parity_corrupt_config <= {16'h0,Slave_DataIn[15:0]};
`endif
	end
     end // else: !if(!Reset_L)
   
   

   // below this is script generated
   

   assign     read_DMA0_Register   = ~dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma0_decode & ~dma0_rsv_space);
   assign     write_DMA0_Register  = ~dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma0_decode & ~dma0_rsv_space);

   assign     read_FZC_DMA0_Register   = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma0_decode & ~dma0_rsv_space);
   assign     write_FZC_DMA0_Register  = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma0_decode & ~dma0_rsv_space);

   assign     dma0_decode  = ({1'h0, Slave_Addr_dma0_3[18:9]} == `DMC_DMA0_SPACE);
   assign     dma0_rsv_space  =  (Slave_Addr_dma0_3[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA1_Register   = ~dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma1_decode & ~dma1_rsv_space);
   assign     write_DMA1_Register  = ~dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma1_decode & ~dma1_rsv_space);

   assign     read_FZC_DMA1_Register   = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma1_decode & ~dma1_rsv_space);
   assign     write_FZC_DMA1_Register  = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma1_decode & ~dma1_rsv_space);

   assign     dma1_decode  = ({1'h0, Slave_Addr_dma0_3[18:9]} == `DMC_DMA1_SPACE);
   assign     dma1_rsv_space  =  (Slave_Addr_dma0_3[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA2_Register   = ~dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma2_decode & ~dma2_rsv_space);
   assign     write_DMA2_Register  = ~dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma2_decode & ~dma2_rsv_space);

   assign     read_FZC_DMA2_Register   = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma2_decode & ~dma2_rsv_space);
   assign     write_FZC_DMA2_Register  = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma2_decode & ~dma2_rsv_space);

   assign     dma2_decode  = ({1'h0, Slave_Addr_dma0_3[18:9]} == `DMC_DMA2_SPACE);
   assign     dma2_rsv_space  =  (Slave_Addr_dma0_3[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA3_Register   = ~dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma3_decode & ~dma3_rsv_space);
   assign     write_DMA3_Register  = ~dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma3_decode & ~dma3_rsv_space);

   assign     read_FZC_DMA3_Register   = dma_fzc_decode_dma0_3 & (readSlaveReg_dma0_3 & dma3_decode & ~dma3_rsv_space);
   assign     write_FZC_DMA3_Register  = dma_fzc_decode_dma0_3 & (writeSlaveReg_dma0_3 & dma3_decode & ~dma3_rsv_space);

   assign     dma3_decode  = ({1'h0, Slave_Addr_dma0_3[18:9]} == `DMC_DMA3_SPACE);
   assign     dma3_rsv_space  =  (Slave_Addr_dma0_3[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA4_Register   = ~dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma4_decode & ~dma4_rsv_space);
   assign     write_DMA4_Register  = ~dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma4_decode & ~dma4_rsv_space);

   assign     read_FZC_DMA4_Register   = dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma4_decode & ~dma4_rsv_space);
   assign     write_FZC_DMA4_Register  = dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma4_decode & ~dma4_rsv_space);

   assign     dma4_decode  = ({1'h0, Slave_Addr_dma4_7[18:9]} == `DMC_DMA4_SPACE);
   assign     dma4_rsv_space  =  (Slave_Addr_dma4_7[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA5_Register   = ~dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma5_decode & ~dma5_rsv_space);
   assign     write_DMA5_Register  = ~dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma5_decode & ~dma5_rsv_space);

   assign     read_FZC_DMA5_Register   = dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma5_decode & ~dma5_rsv_space);
   assign     write_FZC_DMA5_Register  = dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma5_decode & ~dma5_rsv_space);

   assign     dma5_decode  = ({1'h0, Slave_Addr_dma4_7[18:9]} == `DMC_DMA5_SPACE);
   assign     dma5_rsv_space  =  (Slave_Addr_dma4_7[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA6_Register   = ~dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma6_decode & ~dma6_rsv_space);
   assign     write_DMA6_Register  = ~dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma6_decode & ~dma6_rsv_space);

   assign     read_FZC_DMA6_Register   = dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma6_decode & ~dma6_rsv_space);
   assign     write_FZC_DMA6_Register  = dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma6_decode & ~dma6_rsv_space);

   assign     dma6_decode  = ({1'h0, Slave_Addr_dma4_7[18:9]} == `DMC_DMA6_SPACE);
   assign     dma6_rsv_space  =  (Slave_Addr_dma4_7[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA7_Register   = ~dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma7_decode & ~dma7_rsv_space);
   assign     write_DMA7_Register  = ~dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma7_decode & ~dma7_rsv_space);

   assign     read_FZC_DMA7_Register   = dma_fzc_decode_dma4_7 & (readSlaveReg_dma4_7 & dma7_decode & ~dma7_rsv_space);
   assign     write_FZC_DMA7_Register  = dma_fzc_decode_dma4_7 & (writeSlaveReg_dma4_7 & dma7_decode & ~dma7_rsv_space);

   assign     dma7_decode  = ({1'h0, Slave_Addr_dma4_7[18:9]} == `DMC_DMA7_SPACE);
   assign     dma7_rsv_space  =  (Slave_Addr_dma4_7[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA8_Register   = ~dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma8_decode & ~dma8_rsv_space);
   assign     write_DMA8_Register  = ~dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma8_decode & ~dma8_rsv_space);

   assign     read_FZC_DMA8_Register   = dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma8_decode & ~dma8_rsv_space);
   assign     write_FZC_DMA8_Register  = dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma8_decode & ~dma8_rsv_space);

   assign     dma8_decode  = ({1'h0, Slave_Addr_dma8_11[18:9]} == `DMC_DMA8_SPACE);
   assign     dma8_rsv_space  =  (Slave_Addr_dma8_11[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA9_Register   = ~dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma9_decode & ~dma9_rsv_space);
   assign     write_DMA9_Register  = ~dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma9_decode & ~dma9_rsv_space);

   assign     read_FZC_DMA9_Register   = dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma9_decode & ~dma9_rsv_space);
   assign     write_FZC_DMA9_Register  = dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma9_decode & ~dma9_rsv_space);

   assign     dma9_decode  = ({1'h0, Slave_Addr_dma8_11[18:9]} == `DMC_DMA9_SPACE);
   assign     dma9_rsv_space  =  (Slave_Addr_dma8_11[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA10_Register   = ~dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma10_decode & ~dma10_rsv_space);
   assign     write_DMA10_Register  = ~dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma10_decode & ~dma10_rsv_space);

   assign     read_FZC_DMA10_Register   = dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma10_decode & ~dma10_rsv_space);
   assign     write_FZC_DMA10_Register  = dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma10_decode & ~dma10_rsv_space);

   assign     dma10_decode  = ({1'h0, Slave_Addr_dma8_11[18:9]} == `DMC_DMA10_SPACE);
   assign     dma10_rsv_space  =  (Slave_Addr_dma8_11[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA11_Register   = ~dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma11_decode & ~dma11_rsv_space);
   assign     write_DMA11_Register  = ~dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma11_decode & ~dma11_rsv_space);

   assign     read_FZC_DMA11_Register   = dma_fzc_decode_dma8_11 & (readSlaveReg_dma8_11 & dma11_decode & ~dma11_rsv_space);
   assign     write_FZC_DMA11_Register  = dma_fzc_decode_dma8_11 & (writeSlaveReg_dma8_11 & dma11_decode & ~dma11_rsv_space);

   assign     dma11_decode  = ({1'h0, Slave_Addr_dma8_11[18:9]} == `DMC_DMA11_SPACE);
   assign     dma11_rsv_space  =  (Slave_Addr_dma8_11[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA12_Register   = ~dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma12_decode & ~dma12_rsv_space);
   assign     write_DMA12_Register  = ~dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma12_decode & ~dma12_rsv_space);

   assign     read_FZC_DMA12_Register   = dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma12_decode & ~dma12_rsv_space);
   assign     write_FZC_DMA12_Register  = dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma12_decode & ~dma12_rsv_space);

   assign     dma12_decode  = ({1'h0, Slave_Addr_dma12_15[18:9]} == `DMC_DMA12_SPACE);
   assign     dma12_rsv_space  =  (Slave_Addr_dma12_15[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA13_Register   = ~dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma13_decode & ~dma13_rsv_space);
   assign     write_DMA13_Register  = ~dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma13_decode & ~dma13_rsv_space);

   assign     read_FZC_DMA13_Register   = dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma13_decode & ~dma13_rsv_space);
   assign     write_FZC_DMA13_Register  = dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma13_decode & ~dma13_rsv_space);

   assign     dma13_decode  = ({1'h0, Slave_Addr_dma12_15[18:9]} == `DMC_DMA13_SPACE);
   assign     dma13_rsv_space  =  (Slave_Addr_dma12_15[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA14_Register   = ~dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma14_decode & ~dma14_rsv_space);
   assign     write_DMA14_Register  = ~dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma14_decode & ~dma14_rsv_space);

   assign     read_FZC_DMA14_Register   = dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma14_decode & ~dma14_rsv_space);
   assign     write_FZC_DMA14_Register  = dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma14_decode & ~dma14_rsv_space);

   assign     dma14_decode  = ({1'h0, Slave_Addr_dma12_15[18:9]} == `DMC_DMA14_SPACE);
   assign     dma14_rsv_space  =  (Slave_Addr_dma12_15[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA15_Register   = ~dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma15_decode & ~dma15_rsv_space);
   assign     write_DMA15_Register  = ~dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma15_decode & ~dma15_rsv_space);

   assign     read_FZC_DMA15_Register   = dma_fzc_decode_dma12_15 & (readSlaveReg_dma12_15 & dma15_decode & ~dma15_rsv_space);
   assign     write_FZC_DMA15_Register  = dma_fzc_decode_dma12_15 & (writeSlaveReg_dma12_15 & dma15_decode & ~dma15_rsv_space);

   assign     dma15_decode  = ({1'h0, Slave_Addr_dma12_15[18:9]} == `DMC_DMA15_SPACE);
   assign     dma15_rsv_space  =  (Slave_Addr_dma12_15[8:0] >= `DMC_DMA_RSV_SPACE);




`ifdef NEPTUNE

   assign     read_DMA16_Register   = ~dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma16_decode & ~dma16_rsv_space);
   assign     write_DMA16_Register  = ~dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma16_decode & ~dma16_rsv_space);

   assign     read_FZC_DMA16_Register   = dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma16_decode & ~dma16_rsv_space);
   assign     write_FZC_DMA16_Register  = dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma16_decode & ~dma16_rsv_space);

   assign     dma16_decode  = ({1'h0, Slave_Addr_dma16_19[18:9]} == `DMC_DMA16_SPACE);
   assign     dma16_rsv_space  =  (Slave_Addr_dma16_19[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA17_Register   = ~dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma17_decode & ~dma17_rsv_space);
   assign     write_DMA17_Register  = ~dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma17_decode & ~dma17_rsv_space);

   assign     read_FZC_DMA17_Register   = dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma17_decode & ~dma17_rsv_space);
   assign     write_FZC_DMA17_Register  = dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma17_decode & ~dma17_rsv_space);

   assign     dma17_decode  = ({1'h0, Slave_Addr_dma16_19[18:9]} == `DMC_DMA17_SPACE);
   assign     dma17_rsv_space  =  (Slave_Addr_dma16_19[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA18_Register   = ~dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma18_decode & ~dma18_rsv_space);
   assign     write_DMA18_Register  = ~dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma18_decode & ~dma18_rsv_space);

   assign     read_FZC_DMA18_Register   = dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma18_decode & ~dma18_rsv_space);
   assign     write_FZC_DMA18_Register  = dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma18_decode & ~dma18_rsv_space);

   assign     dma18_decode  = ({1'h0, Slave_Addr_dma16_19[18:9]} == `DMC_DMA18_SPACE);
   assign     dma18_rsv_space  =  (Slave_Addr_dma16_19[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA19_Register   = ~dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma19_decode & ~dma19_rsv_space);
   assign     write_DMA19_Register  = ~dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma19_decode & ~dma19_rsv_space);

   assign     read_FZC_DMA19_Register   = dma_fzc_decode_dma16_19 & (readSlaveReg_dma16_19 & dma19_decode & ~dma19_rsv_space);
   assign     write_FZC_DMA19_Register  = dma_fzc_decode_dma16_19 & (writeSlaveReg_dma16_19 & dma19_decode & ~dma19_rsv_space);

   assign     dma19_decode  = ({1'h0, Slave_Addr_dma16_19[18:9]} == `DMC_DMA19_SPACE);
   assign     dma19_rsv_space  =  (Slave_Addr_dma16_19[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA20_Register   = ~dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma20_decode & ~dma20_rsv_space);
   assign     write_DMA20_Register  = ~dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma20_decode & ~dma20_rsv_space);

   assign     read_FZC_DMA20_Register   = dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma20_decode & ~dma20_rsv_space);
   assign     write_FZC_DMA20_Register  = dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma20_decode & ~dma20_rsv_space);

   assign     dma20_decode  = ({1'h0, Slave_Addr_dma20_23[18:9]} == `DMC_DMA20_SPACE);
   assign     dma20_rsv_space  =  (Slave_Addr_dma20_23[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA21_Register   = ~dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma21_decode & ~dma21_rsv_space);
   assign     write_DMA21_Register  = ~dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma21_decode & ~dma21_rsv_space);

   assign     read_FZC_DMA21_Register   = dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma21_decode & ~dma21_rsv_space);
   assign     write_FZC_DMA21_Register  = dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma21_decode & ~dma21_rsv_space);

   assign     dma21_decode  = ({1'h0, Slave_Addr_dma20_23[18:9]} == `DMC_DMA21_SPACE);
   assign     dma21_rsv_space  =  (Slave_Addr_dma20_23[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA22_Register   = ~dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma22_decode & ~dma22_rsv_space);
   assign     write_DMA22_Register  = ~dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma22_decode & ~dma22_rsv_space);

   assign     read_FZC_DMA22_Register   = dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma22_decode & ~dma22_rsv_space);
   assign     write_FZC_DMA22_Register  = dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma22_decode & ~dma22_rsv_space);

   assign     dma22_decode  = ({1'h0, Slave_Addr_dma20_23[18:9]} == `DMC_DMA22_SPACE);
   assign     dma22_rsv_space  =  (Slave_Addr_dma20_23[8:0] >= `DMC_DMA_RSV_SPACE);

   assign     read_DMA23_Register   = ~dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma23_decode & ~dma23_rsv_space);
   assign     write_DMA23_Register  = ~dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma23_decode & ~dma23_rsv_space);

   assign     read_FZC_DMA23_Register   = dma_fzc_decode_dma20_23 & (readSlaveReg_dma20_23 & dma23_decode & ~dma23_rsv_space);
   assign     write_FZC_DMA23_Register  = dma_fzc_decode_dma20_23 & (writeSlaveReg_dma20_23 & dma23_decode & ~dma23_rsv_space);

   assign     dma23_decode  = ({1'h0, Slave_Addr_dma20_23[18:9]} == `DMC_DMA23_SPACE);
   assign     dma23_rsv_space  =  (Slave_Addr_dma20_23[8:0] >= `DMC_DMA_RSV_SPACE);

   `else

  assign     read_DMA16_Register   = 1'b0;
  assign     write_DMA16_Register  = 1'b0;

  assign     read_FZC_DMA16_Register   = 1'b0;
  assign     write_FZC_DMA16_Register  = 1'b0;

  assign     dma16_decode  = 1'b0;
  assign     dma16_rsv_space  =  1'b0;
  assign     read_DMA17_Register   = 1'b0;
  assign     write_DMA17_Register  = 1'b0;

  assign     read_FZC_DMA17_Register   = 1'b0;
  assign     write_FZC_DMA17_Register  = 1'b0;

  assign     dma17_decode  = 1'b0;
  assign     dma17_rsv_space  =  1'b0;
  assign     read_DMA18_Register   = 1'b0;
  assign     write_DMA18_Register  = 1'b0;

  assign     read_FZC_DMA18_Register   = 1'b0;
  assign     write_FZC_DMA18_Register  = 1'b0;

  assign     dma18_decode  = 1'b0;
  assign     dma18_rsv_space  =  1'b0;
  assign     read_DMA19_Register   = 1'b0;
  assign     write_DMA19_Register  = 1'b0;

  assign     read_FZC_DMA19_Register   = 1'b0;
  assign     write_FZC_DMA19_Register  = 1'b0;

  assign     dma19_decode  = 1'b0;
  assign     dma19_rsv_space  =  1'b0;
  assign     read_DMA20_Register   = 1'b0;
  assign     write_DMA20_Register  = 1'b0;

  assign     read_FZC_DMA20_Register   = 1'b0;
  assign     write_FZC_DMA20_Register  = 1'b0;

  assign     dma20_decode  = 1'b0;
  assign     dma20_rsv_space  =  1'b0;
  assign     read_DMA21_Register   = 1'b0;
  assign     write_DMA21_Register  = 1'b0;

  assign     read_FZC_DMA21_Register   = 1'b0;
  assign     write_FZC_DMA21_Register  = 1'b0;

  assign     dma21_decode  = 1'b0;
  assign     dma21_rsv_space  =  1'b0;
  assign     read_DMA22_Register   = 1'b0;
  assign     write_DMA22_Register  = 1'b0;

  assign     read_FZC_DMA22_Register   = 1'b0;
  assign     write_FZC_DMA22_Register  = 1'b0;

  assign     dma22_decode  = 1'b0;
  assign     dma22_rsv_space  =  1'b0;
  assign     read_DMA23_Register   = 1'b0;
  assign     write_DMA23_Register  = 1'b0;

  assign     read_FZC_DMA23_Register   = 1'b0;
  assign     write_FZC_DMA23_Register  = 1'b0;

  assign     dma23_decode  = 1'b0;
  assign     dma23_rsv_space  =  1'b0;
   `endif


   



   

   assign     read_DMA_0_3_Regsister = {read_FZC_DMA3_Register,read_FZC_DMA2_Register,read_FZC_DMA1_Register,read_FZC_DMA0_Register,
					read_DMA3_Register,read_DMA2_Register,read_DMA1_Register,read_DMA0_Register };
   assign     read_DMA_4_7_Regsister = {read_FZC_DMA7_Register,read_FZC_DMA6_Register,read_FZC_DMA5_Register,read_FZC_DMA4_Register,
					read_DMA7_Register,read_DMA6_Register,read_DMA5_Register,read_DMA4_Register };
   assign     read_DMA_8_11_Regsister = {read_FZC_DMA11_Register,read_FZC_DMA10_Register,read_FZC_DMA9_Register,read_FZC_DMA8_Register,
					 read_DMA11_Register,read_DMA10_Register,read_DMA9_Register,read_DMA8_Register };
   assign     read_DMA_12_15_Regsister = {read_FZC_DMA15_Register,read_FZC_DMA14_Register,read_FZC_DMA13_Register,read_FZC_DMA12_Register,
					  read_DMA15_Register,read_DMA14_Register,read_DMA13_Register,read_DMA12_Register };
   assign     read_DMA_16_19_Regsister = {read_FZC_DMA19_Register,read_FZC_DMA18_Register,read_FZC_DMA17_Register,read_FZC_DMA16_Register,
					  read_DMA19_Register,read_DMA18_Register,read_DMA17_Register,read_DMA16_Register };
   assign     read_DMA_20_23_Regsister = {read_FZC_DMA23_Register,read_FZC_DMA22_Register,read_FZC_DMA21_Register,read_FZC_DMA20_Register,
					  read_DMA23_Register,read_DMA22_Register,read_DMA21_Register,read_DMA20_Register };
 
   
   
   
   assign valid_reads = |{read_DMA_0_3_Regsister,read_DMA_4_7_Regsister,read_DMA_8_11_Regsister,read_DMA_12_15_Regsister,
	   	          read_DMA_16_19_Regsister,read_DMA_20_23_Regsister,
			  read_tx_addr_md,read_parity_corrupt_config,read_debug_reg,read_training_reg};
   
   assign pio_32bit_read_resp = pio_clients_32b_d_dma0_3 &  Slave_Addr_dma0_3[2] ;
   
   // Mux Data Out
   always @ (posedge SysClk )
     if (!Reset_L)                             Slave_DataOut <= 64'h0;
     else if ( |read_DMA_0_3_Regsister)        Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_0_3_sl_data[63:32]}   : dma_0_3_sl_data;
     else if ( |read_DMA_4_7_Regsister)        Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_4_7_sl_data[63:32]}   :dma_4_7_sl_data;
     else if ( |read_DMA_8_11_Regsister)       Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_8_11_sl_data[63:32]}  :dma_8_11_sl_data;
     else if ( |read_DMA_12_15_Regsister)      Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_12_15_sl_data[63:32]} :dma_12_15_sl_data;
     else if ( |read_DMA_16_19_Regsister)      Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_16_19_sl_data[63:32]} :dma_16_19_sl_data;
     else if ( |read_DMA_20_23_Regsister)      Slave_DataOut <= pio_32bit_read_resp ? {32'h0,dma_20_23_sl_data[63:32]} :dma_20_23_sl_data;
  
     else if (  read_tx_addr_md           )     Slave_DataOut <= pio_32bit_read_resp ? {32'h0,32'h0} : {63'h0, dmc_txc_tx_addr_md };     
     else if (  read_parity_corrupt_config)     Slave_DataOut <= pio_32bit_read_resp ? {32'h0,32'h0} : {32'h0,parity_corrupt_config};
     else if (  read_debug_reg)                 Slave_DataOut <= pio_32bit_read_resp ? {32'h0,32'h0} : {32'h0,26'h0,debug_select};
     else if (  read_training_reg)              Slave_DataOut <= pio_32bit_read_resp ? {32'h0,32'h0} : {32'h0,training_vector};
     else  Slave_DataOut <= 64'hDEADBEEF_DEADBEEF;


 
endmodule // niu_tdmc_piodecodes


