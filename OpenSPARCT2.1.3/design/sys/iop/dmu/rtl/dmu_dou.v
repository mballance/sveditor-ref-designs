// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dou.v
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
module dmu_dou 
  (
   // Control Signals
   l2clk,  
   clk,  
   rst_l,  
   scan_in,
   tcu_array_bypass,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_se_scancollar_out,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   // CLU's CRM - DOU's DMA Interface
   cl2do_dma_wr,
   cl2do_dma_addr,
   cl2do_dma_data,
   cl2do_dma_dpar,

   // CLU's CRM - DOU's PIO Interface
   cl2do_pio_wr,
   cl2do_pio_addr,
   cl2do_pio_data,
   cl2do_pio_dpar,
   
   // ILU's EIL - DOU Interface
   // ILU's EIL - DOU
   y2k_buf_addr,
   
   // DOU - ILU's EIL   
   k2y_buf_data,
   k2y_buf_dpar,

   // MBIST signals
   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_dou_dma_data_wr_en,
   dmu_mb0_dou_dma_data_rd_en,
   dmu_mb0_dou_pio_data_wr_en,
   dmu_mb0_dou_pio_data_rd_en,
   dmu_dou_pio_read_data,
   dmu_dou_dma_read_data
   
   );
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter MEM_WIDTH   = `FIRE_DLC_ERD_DATA_WDTH+`FIRE_DLC_ERD_DPAR_WDTH;

  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  input                                   l2clk;		// clock to rams only, since they already have headers 
  input                                   clk; 
  input                                   rst_l; 
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_scan_en;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_se_scancollar_out;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;
  
  // CLU's CRM - DOU's EDR DMA Interface
  input 	                          cl2do_dma_wr;
  input [`FIRE_DLC_CDD_ADDR_WDTH-1:0] 	  cl2do_dma_addr; // Address width, to address 128 entries DMA
  input [`FIRE_DLC_CDD_DATA_WDTH-1:0] 	  cl2do_dma_data; // Data width, 16 bytes
  input [`FIRE_DLC_CDD_DPAR_WDTH-1:0] 	  cl2do_dma_dpar; // Parity width 32 bit parity on data

  // CLU's CRM - DOU's EPR PIO Interface
  input 				  cl2do_pio_wr;
  input [`FIRE_DLC_CPD_ADDR_WDTH-1:0] 	  cl2do_pio_addr; // Address width, to address 64 entries PIO
  input [`FIRE_DLC_CPD_DATA_WDTH-1:0] 	  cl2do_pio_data; // Data width, 16 bytes
  input [`FIRE_DLC_CPD_DPAR_WDTH-1:0] 	  cl2do_pio_dpar; // Parity width 32 bit parity on data

  // ILU's EIL - DOU Interface
  input [`FIRE_DLC_ERD_ADDR_WDTH-1:0] 	  y2k_buf_addr;   // Address width, to address 128 entries DMA / 64 entries PIO 
 
  output [`FIRE_DLC_ERD_DATA_WDTH-1:0] 	  k2y_buf_data;   // Data width, 16 bytes
  output [`FIRE_DLC_ERD_DPAR_WDTH-1:0] 	  k2y_buf_dpar;   // Parity width 32 bit parity on data 

  output [MEM_WIDTH-1:0] 		  dmu_dou_pio_read_data;
  output [MEM_WIDTH-1:0] 		  dmu_dou_dma_read_data;
  input                                   dmu_mb0_run;
  input [7:0]                             dmu_mb0_addr;
  input [7:0]                             dmu_mb0_wdata;
  input                                   dmu_mb0_dou_pio_data_wr_en;
  input                                   dmu_mb0_dou_pio_data_rd_en;
  input                                   dmu_mb0_dou_dma_data_wr_en;
  input                                   dmu_mb0_dou_dma_data_rd_en;

  //////////////////////////////////////////////////////////////////////
  //*************************    Wires and Regs   **********************
  //////////////////////////////////////////////////////////////////////  
 
  //  flops  
  reg 					  data_sel;
 
  //  non flops  
  reg [MEM_WIDTH-1:0] 			  k2y_data_out;					  
  wire [MEM_WIDTH-1:0] 			  edr2mux_dma_data_out;
  wire [MEM_WIDTH-1:0] 			  epr2mux_pio_data_out;

 
  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////

  assign   dmu_dou_pio_read_data  =  epr2mux_pio_data_out;
  assign   dmu_dou_dma_read_data  =  edr2mux_dma_data_out;
  // DMA data RAM
  
  dmu_dou_edr edr
    (
     // Control Signals
     .l2clk                       (l2clk),
     .clk                         (clk),
     .scan_in                     (scan_in),
     .tcu_array_bypass            (tcu_array_bypass),
     .tcu_scan_en        	  (tcu_scan_en),
     .tcu_se_scancollar_in        (tcu_se_scancollar_in),
     .tcu_array_wr_inhibit        (tcu_array_wr_inhibit),
     .tcu_pce_ov                  (tcu_pce_ov),
     .tcu_aclk                    (tcu_aclk),
     .tcu_bclk                    (tcu_bclk),
     .scan_out                    (scan_out),

     // CLU's CRM - DOU's EDR DMA Interface
     .cl2do_dma_wr                  (cl2do_dma_wr),
     .cl2do_dma_addr                (cl2do_dma_addr),
     .cl2do_dma_data                (cl2do_dma_data),
     .cl2do_dma_dpar                (cl2do_dma_dpar),

     // ILU's EIL - DOU Interface
     // ILU's EIL - DOU
     .y2edr_addr                    (y2k_buf_addr[6:0]),
  
     // EDR - Mux    
     .edr2mux_dma_data_out          (edr2mux_dma_data_out),

     .dmu_mb0_run                   (dmu_mb0_run),
     .dmu_mb0_addr                  (dmu_mb0_addr[6:0]),
     .dmu_mb0_wdata                 (dmu_mb0_wdata),
     .dmu_mb0_dou_dma_data_wr_en    (dmu_mb0_dou_dma_data_wr_en),
     .dmu_mb0_dou_dma_data_rd_en    (dmu_mb0_dou_dma_data_rd_en)
       
     );

  // PIO data RAM
 
  dmu_dou_epr epr
    (
     // Control Signals
     .l2clk                       (l2clk),
     .clk                         (clk),
     .scan_in                     (scan_in),     
     .tcu_array_bypass            (tcu_array_bypass),
     .tcu_se_scancollar_in        (tcu_se_scancollar_in),
     .tcu_se_scancollar_out       (tcu_se_scancollar_out),
     .tcu_array_wr_inhibit        (tcu_array_wr_inhibit),
     .tcu_pce_ov                  (tcu_pce_ov),
     .tcu_aclk                    (tcu_aclk),
     .tcu_bclk                    (tcu_bclk),
     .scan_out                    (),
      
     // CLU's CRM - DOU's PIO Interface
     .cl2do_pio_wr                  (cl2do_pio_wr),
     .cl2do_pio_addr                (cl2do_pio_addr),
     .cl2do_pio_data                (cl2do_pio_data),
     .cl2do_pio_dpar                (cl2do_pio_dpar),
     
     // ILU's EIL - DOU Interface
     // ILU's EIL - DOU
     .y2epr_addr                    (y2k_buf_addr[5:0]),
     
     // EDR - Mux     
     .epr2mux_pio_data_out          (epr2mux_pio_data_out),

     .dmu_mb0_run		    (dmu_mb0_run),
     .dmu_mb0_addr		    (dmu_mb0_addr[3:0]),
     .dmu_mb0_wdata		    (dmu_mb0_wdata),
     .dmu_mb0_dou_pio_data_wr_en    (dmu_mb0_dou_pio_data_wr_en),
     .dmu_mb0_dou_pio_data_rd_en    (dmu_mb0_dou_pio_data_rd_en)   
     ); 
     
  //////////////////////////////////////////////////////////////////////
  // ********  Combinational Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  assign  k2y_buf_data  = k2y_data_out[`FIRE_DLC_ERD_DATA_WDTH-1:0]; 
  assign  k2y_buf_dpar  = k2y_data_out[MEM_WIDTH-1:`FIRE_DLC_ERD_DATA_WDTH];

  // 0in mux -in edr2mux_dma_data_out epr2mux_pio_data_out -out k2y_data_out -select data_sel -binary
  
  // decode logic for reads (mux to select data from PIO or DMA ram)
  
  always @(data_sel or edr2mux_dma_data_out or epr2mux_pio_data_out)
    begin
      if (data_sel == 0)
        k2y_data_out  = edr2mux_dma_data_out;
      else
	k2y_data_out  = epr2mux_pio_data_out;
    end

  always @(posedge clk)
	if(~rst_l) begin
    data_sel <= 1'b0;
	end
   else begin
    data_sel <= y2k_buf_addr[7];
   end

endmodule // dmu_dou

