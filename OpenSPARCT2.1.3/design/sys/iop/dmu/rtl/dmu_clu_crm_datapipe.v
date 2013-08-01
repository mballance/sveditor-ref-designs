// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm_datapipe.v
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
module dmu_clu_crm_datapipe 
  (
   // clock
   clk,
   rst_l,
   
   // jbc: dma data port
   j2d_d_data_vld,
   j2d_d_data,
   j2d_d_data_par,
   j2d_d_data_err,
   
   // jbc: pio data port
   j2d_p_data,
   j2d_p_data_par,
   
   // mmu: tdr port
   tdr_data,
   tdr_dpar,
   tdr_derr,
   
   // dou: data port
   cl2do_dma_data,
   cl2do_dma_dpar,
   cl2do_pio_data,
   cl2do_pio_dpar
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock Signal
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // Data Port -> DMA Resp
  input                                 j2d_d_data_vld; // dma data vld
  input [(`FIRE_J2D_D_DATA_WDTH - 1):0] j2d_d_data;     // dma rd data
  input [(`FIRE_J2D_D_DPAR_WDTH - 1):0] j2d_d_data_par; // data parity
  input                                 j2d_d_data_err; // data status
  
  // Data Port -> PIO Req
  input [(`FIRE_J2D_P_DATA_WDTH - 1):0] j2d_p_data;     // pio wr data
  input [(`FIRE_J2D_P_DPAR_WDTH - 1):0] j2d_p_data_par; // data parity
  
  // --------------------------------------------------------
  // MMU Interface
  // --------------------------------------------------------
  
  // Tablewalk Data Record (TDR) Port
  output [(`FIRE_DLC_TDR_DATA_WDTH - 1):0] tdr_data;
  output [(`FIRE_DLC_TDR_DPAR_WDTH - 1):0] tdr_dpar;
  output                                   tdr_derr;
  
  // --------------------------------------------------------
  // DOU Interface
  // --------------------------------------------------------
  
  // DMA Data Buffer Write Port
  output [(`FIRE_DLC_CDD_DATA_WDTH - 1):0] cl2do_dma_data; // dma rd data
  output [(`FIRE_DLC_CDD_DPAR_WDTH - 1):0] cl2do_dma_dpar; // dma data par
  
  // PIO Data Buffer Write Port
  output [(`FIRE_DLC_CPD_DATA_WDTH - 1):0] cl2do_pio_data; // pio wr data
  output [(`FIRE_DLC_CPD_DPAR_WDTH - 1):0] cl2do_pio_dpar; // pio data par
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  // dma data_regs
  reg [(`FIRE_J2D_D_DATA_WDTH - 1):0] dma_data_reg;
  reg [(`FIRE_J2D_D_DPAR_WDTH - 1):0] dma_dpar_reg;
  reg                                 mmu_derr_reg;
  
  // pio data_regs
  reg  [(`FIRE_J2D_P_DATA_WDTH - 1):0] pio_data_reg;
  reg  [(`FIRE_J2D_P_DPAR_WDTH - 1):0] pio_dpar_reg;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Sequential Logic
  // --------------------------------------------------------
  
  // pio: piped data path
  always @(posedge clk)
    if (~rst_l)
      begin
      pio_data_reg <= `FIRE_J2D_P_DATA_WDTH'b0;
      pio_dpar_reg <= `FIRE_J2D_P_DPAR_WDTH'b0;
	end
    else begin
      pio_data_reg <= j2d_p_data;
      pio_dpar_reg <= j2d_p_data_par;
    end
  
  // dma: piped data path
  always @(posedge clk)
    if (~rst_l)
      begin
      dma_data_reg <= `FIRE_J2D_D_DATA_WDTH'b0;
      dma_dpar_reg <= `FIRE_J2D_D_DPAR_WDTH'b0;
      mmu_derr_reg <= 1'b0;
	end
    else begin
      dma_data_reg <= j2d_d_data;
      dma_dpar_reg <= j2d_d_data_par;
      mmu_derr_reg <= j2d_d_data_err & j2d_d_data_vld;
    end
  
  // --------------------------------------------------------
  // Data Path Output
  // --------------------------------------------------------
  
  // mmu tdr data path
  assign tdr_data       = dma_data_reg;
  assign tdr_dpar       = dma_dpar_reg;
  assign tdr_derr       = mmu_derr_reg;
  
  // dou dma data path
  assign cl2do_dma_data = dma_data_reg;
  assign cl2do_dma_dpar = dma_dpar_reg;
  
  // dou pio data path
  assign cl2do_pio_data = pio_data_reg;
  assign cl2do_pio_dpar = pio_dpar_reg;
  
endmodule // dmu_clu_crm_datapipe
