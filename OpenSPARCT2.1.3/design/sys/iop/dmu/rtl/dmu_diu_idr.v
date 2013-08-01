// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_diu_idr.v
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
module dmu_diu_idr 
  (
   // Control Signals
   l2clk,
   clk,
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
 
   // CLU's CTM - DIU Interface
   // CLU's CTM - DIU
   cl2idr_addr,
   cl2di_rd_en,

   // DIU's IDR - DIU's Mux
   idr2mux_dma_pio_data_out,

   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_diu_wr_en,
   dmu_mb0_diu_rd_en
   ); 
 
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter MEM_WIDTH   = `FIRE_DLC_TRD_DATA_WDTH+`FIRE_DLC_TRD_BMASK_WDTH+`FIRE_DLC_TRD_DPAR_WDTH;
//  parameter MEM_TIEHIGH = 1'b1;
//  parameter MEM_TIELOW  = 1'b0;
 
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals 
  input                                   l2clk;
  input                                   clk;
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
 
  // CLU's CTM - DIU Interface
  // CLU's CTM - DIU 
  input [`FIRE_DLC_CRD_ADDR_WDTH-2:0] 	  cl2idr_addr;  // Address width, to address 128 entries DMA / 64 entries PIO / 16 entries INT 2 bit select
  input 	  			  cl2di_rd_en;  // rd enable for diu ram for n2 power savings BP 5-12-05

  // DIU's PDR - CLU's CTM  (128 + 16 + 5  = 149)
  output [MEM_WIDTH-1:0] idr2mux_dma_pio_data_out;  // RAM data output

  // MBIST signals
  input         dmu_mb0_run;

  input [7:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input         dmu_mb0_diu_wr_en;
  input         dmu_mb0_diu_rd_en;
 
  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////
 
  /* #0in memory_access -read_addr cl2idr_addr -read (!tm2di_wr) -write_addr tm2di_addr -write tm2di_wr
    -single_write -read_data  idr2mux_dma_pio_data_out -write_data ({tm2di_dpar, tm2di_bmask, tm2di_data}) */

  // Checks that any data written on waddr is read on raddr before it is overwritten. In
  // addition, it checks that the data read from the memory is correct. Also checks that
  // no location is read by raddr and written by waddr in the same cycle.
/*
  fire_dlc_ram192x149_211hd4 ram192x149_211hd4
    (
     // address ports
     .aadr     (cl2idr_addr),
     .badr     (tm2di_addr),
     
     // clock ports
     .clka     (l2clk),
     .clkb     (l2clk),
     
     // data input ports
     .dib      ({tm2di_dpar, tm2di_bmask, tm2di_data}),
    
     
     // data output ports
    
     .doa      (idr2mux_dma_pio_data_out),
     
     // port enables
     .ena      (MEM_TIEHIGH),
     .enb      (MEM_TIEHIGH),
     
     // write enables
     .web      (tm2di_wr)
     );
*/
//BP N2 9-21-04	add the scan bypass mux
// 	note: that {tm2di_dpar, tm2di_bmask, tm2di_data} come directly from flops in dmu_tmu_dim_datapath.v
wire [MEM_WIDTH-1:0]	dma_pio_data_out;
assign	idr2mux_dma_pio_data_out	= tcu_array_bypass ? {tm2di_dpar, tm2di_bmask, tm2di_data} : dma_pio_data_out;

//SV 02/24/05 added BIST logic
  wire    [148:0]  din_ram  ;
  wire    [7:0]   rd_addr_ram, wr_addr_ram ;
  wire            wr_en_ram, rd_en_ram  ;

  assign  din_ram        =   dmu_mb0_run ? ({dmu_mb0_wdata[4:0],{18{dmu_mb0_wdata}}}) : ({tm2di_dpar, tm2di_bmask, tm2di_data}) ;
  assign  rd_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr[7:0] : cl2idr_addr ;
  assign  wr_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr[7:0] : tm2di_addr ;
  assign  wr_en_ram      =   dmu_mb0_run ? dmu_mb0_diu_wr_en : tm2di_wr ;
  assign  rd_en_ram      =   dmu_mb0_run ? dmu_mb0_diu_rd_en : cl2di_rd_en ;


//BP n2 6-16-04 new ram model

//  /* 0in memory_access -read_addr cl2idr_addr -read (cl2idr_addr != tm2di_addr) 
  /* 0in memory_access -read_addr cl2idr_addr -read (cl2di_rd_en & (cl2idr_addr != tm2di_addr) ) 
	-write_addr tm2di_addr 
	-latency 1 -write tm2di_wr
     -read_data  dma_pio_data_out -write_data ({tm2di_dpar, tm2di_bmask, tm2di_data}) -group mbist_mode */

  // Checks that any data written on waddr is read on raddr before it is overwritten. In
  // addition, it checks that the data read from the memory is correct. Also checks that
  // no location is read by raddr and written by waddr in the same cycle.
        n2_dmu_dp_144x149s_cust  diu_dma_ram144x149
        (
     // address ports
     .rd_addr     (rd_addr_ram),
     .wr_addr     (wr_addr_ram),

     // clock ports
     .clk     (l2clk),

     // data input ports
     .din      (din_ram),

     // data output ports
     .dout      (dma_pio_data_out),

     // port enables
     .rd_en      (rd_en_ram),
     .wr_en      (wr_en_ram),


        // scan ports
        .scan_in                (scan_in),
        .tcu_scan_en   		(tcu_scan_en),
        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
        .tcu_pce_ov             (tcu_pce_ov),
        .pce           		(1'b1),
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_out               (scan_out)
     );

 
endmodule // dmu_diu_idr
