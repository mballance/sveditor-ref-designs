// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_diu.v
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
module dmu_diu 
  (
   // Control Signals
   l2clk,
   clk,
   rst_l,
   scan_in,
   tcu_array_bypass,
   tcu_scan_en,
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   // TMU's DIM - DIU Interface
   tm2di_wr,
   tm2di_addr,
   tm2di_data,
   tm2di_bmask,
   tm2di_dpar,

   // IMU's DMS - DIU Interface
   im2di_wr,
   im2di_addr,
   im2di_data,
   im2di_bmask,
   im2di_dpar,
   
   // CLU's CTM - DIU Interface
   // CLU's CTM - DIU
   cl2di_addr,
   cl2di_rd_en,

   // DIU - CLU's CTM Interface 
   di2cl_data,
   di2cl_dpar,
   di2cl_bmask,

   dmu_diu_read_data,
   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_diu_wr_en,
   dmu_mb0_diu_rd_en

   );
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter MEM_WIDTH   = `FIRE_DLC_CRD_DATA_WDTH+`FIRE_DLC_CRD_BMASK_WDTH+`FIRE_DLC_CRD_DPAR_WDTH;
 
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  
  input                                   l2clk;
  input                                   clk;
  input                                   rst_l;
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_scan_en;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;
  
  // TMU's DIM - DIU Interface
  input 				  tm2di_wr;
  input [`FIRE_DLC_TRD_ADDR_WDTH-1:0] 	  tm2di_addr;  // Address width, to address 128 entries DMA / 64 entries PIO 1 bit select
  input [`FIRE_DLC_TRD_DATA_WDTH-1:0] 	  tm2di_data;  // Data width, 16 bytes
  input [`FIRE_DLC_TRD_BMASK_WDTH-1:0] 	  tm2di_bmask; // 16 bit bmask
  input [`FIRE_DLC_TRD_DPAR_WDTH-1:0] 	  tm2di_dpar;  // Parity width 32 bit parity on data 1 bit for 16 bit bmask

  // IMU's DMS - DIU Interface
  input 				  im2di_wr;
  input [`FIRE_DLC_IRD_ADDR_WDTH-1:0] 	  im2di_addr;  // Address width, to address 16 entries
  input [`FIRE_DLC_IRD_DATA_WDTH-1:0] 	  im2di_data;  // Data width, 16 bytes
  input [`FIRE_DLC_IRD_BMASK_WDTH-1:0] 	  im2di_bmask; // 16 bit bmask 
  input [`FIRE_DLC_IRD_DPAR_WDTH-1:0] 	  im2di_dpar;  // Parity width 32 bit parity on data 1 bit for 16 bit bmask

  // CLU's CTM - DIU Interface
  // CLU's CTM - DIU 
  input [`FIRE_DLC_CRD_ADDR_WDTH-1:0] 	  cl2di_addr;  // Address width, to address 128 entries DMA / 64 entries PIO / 16 entries INT 2 bit select
  input 			 	  cl2di_rd_en;  // BP 5-12-05 n2 rd enable to diu ram for power savings

  // DIU - CLU's CTM
  output [`FIRE_DLC_CRD_DATA_WDTH-1:0] 	  di2cl_data;  // Data with, 16 bytes
  output [`FIRE_DLC_CRD_DPAR_WDTH-1:0] 	  di2cl_dpar;  // Parity width 32 bit parity on data 1 bit for 16 bit bmask
  output [`FIRE_DLC_CRD_BMASK_WDTH-1:0]   di2cl_bmask; // 16 bit bmask

  //  MEMBIST signals
  output [MEM_WIDTH-1:0]                  dmu_diu_read_data;
  input         			  dmu_mb0_run;
  input [7:0]   			  dmu_mb0_addr;
  input [7:0]   			  dmu_mb0_wdata;
  input         			  dmu_mb0_diu_wr_en;
  input         			  dmu_mb0_diu_rd_en;

  //////////////////////////////////////////////////////////////////////
  //*************************    Wires and Regs   **********************
  //////////////////////////////////////////////////////////////////////  
   
  //  flops  
  reg 					  data_sel;
  reg [MEM_WIDTH-1:0] 			  idm2mux_int_data_out;

  //  non flops  
  reg [MEM_WIDTH-1:0] 			  di2cl_data_out;					  
  wire [MEM_WIDTH-1:0] 			  idr2mux_dma_pio_data_out;
  wire [MEM_WIDTH-1:0] 			  n_idm2mux_int_data_out;

  
  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////
  
  // PIO / DMA data RAM
  assign  dmu_diu_read_data = idr2mux_dma_pio_data_out;
  
  dmu_diu_idr idr
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
     
     // TMU's DIM - DIU to PDR Interface
     .tm2di_wr                    (tm2di_wr),
     .tm2di_addr                  (tm2di_addr),
     .tm2di_data                  (tm2di_data),
     .tm2di_bmask                 (tm2di_bmask),
     .tm2di_dpar                  (tm2di_dpar),
 
     // CLU's CTM - DIU to PDR Interface
     // CLU's CTM - PDR
     .cl2idr_addr                  (cl2di_addr[7:0]),
     .cl2di_rd_en                  (cl2di_rd_en),
     
     // PDR - Mux    
     .idr2mux_dma_pio_data_out     (idr2mux_dma_pio_data_out),
     .dmu_mb0_run		   (dmu_mb0_run),
     .dmu_mb0_addr		   (dmu_mb0_addr),
     .dmu_mb0_wdata		   (dmu_mb0_wdata),
     .dmu_mb0_diu_wr_en		   (dmu_mb0_diu_wr_en),
     .dmu_mb0_diu_rd_en            (dmu_mb0_diu_rd_en)
     ); 
  
  // Interupt data memory
  
  dmu_diu_idm idm
    (
     // Control Signals
     .clk                         (clk),
     .rst_l                       (rst_l),
     
     // IMU's DMS - DIU Interface
     .im2di_wr                    (im2di_wr),
     .im2di_addr                  (im2di_addr),
     .im2di_data                  (im2di_data),
     .im2di_bmask                 (im2di_bmask),
     .im2di_dpar                  (im2di_dpar),
     
     // CLU's CTM - DIU to PDR Interface
     // CLU's CTM - PDR
     .cl2idm_addr                  (cl2di_addr[5:2]),
     
     // IDM - Mux     
     .n_idm2mux_int_data_out        (n_idm2mux_int_data_out)   
     ); 
     
  //////////////////////////////////////////////////////////////////////
  // ********  Combinational Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  assign  di2cl_data  = di2cl_data_out[`FIRE_DLC_CRD_DATA_WDTH-1:0];
  assign  di2cl_bmask = di2cl_data_out[`FIRE_DLC_CRD_DATA_WDTH+`FIRE_DLC_CRD_BMASK_WDTH-1:`FIRE_DLC_CRD_DATA_WDTH];
  assign  di2cl_dpar  = di2cl_data_out[MEM_WIDTH-1:`FIRE_DLC_CRD_DATA_WDTH+`FIRE_DLC_CRD_BMASK_WDTH];

  // 0in mux -in idr2mux_dma_pio_data_out idm2mux_int_data_out -out di2cl_data_out -select data_sel -binary  
  
  // decode logic for reads mux to select ram data for PIO/DMA or INT data from flops 
  
  always @(data_sel or idr2mux_dma_pio_data_out or idm2mux_int_data_out)
    begin
      if (data_sel == 0)
        di2cl_data_out  = idr2mux_dma_pio_data_out;
      else
	di2cl_data_out  = idm2mux_int_data_out;
    end  
     
  //////////////////////////////////////////////////////////////////////
  // ***********  Sequential Logic  ************************************
  //////////////////////////////////////////////////////////////////////

  always @(posedge clk)
	if(~rst_l) begin
    data_sel <= 1'b0;
	end
  else begin
    data_sel <= cl2di_addr[8];
   end

 always @(posedge clk)
	if(~rst_l) begin
    idm2mux_int_data_out <= {MEM_WIDTH{1'b0}};
	end
   else begin
    idm2mux_int_data_out <= n_idm2mux_int_data_out;
   end

endmodule // dmu_diu
