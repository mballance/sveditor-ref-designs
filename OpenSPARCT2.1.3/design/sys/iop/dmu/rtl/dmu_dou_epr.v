// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dou_epr.v
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
module dmu_dou_epr 
  (
   // Control Signals
   l2clk,
   clk,
   scan_in,
   tcu_array_bypass,
   tcu_se_scancollar_in,
   tcu_se_scancollar_out,
   tcu_array_wr_inhibit,
   tcu_pce_ov,
   tcu_aclk,
   tcu_bclk,
   scan_out,

   
   // CLU's CRM - DOU's PIO Interface
   cl2do_pio_wr,
   cl2do_pio_addr,
   cl2do_pio_data,
   cl2do_pio_dpar,
  
   // ILU's EIL - DOU EPR Interface
   // ILU's EIL - DOU
   y2epr_addr,
   
   // EDR - Mux
   epr2mux_pio_data_out,

   dmu_mb0_run,
   dmu_mb0_addr,
   dmu_mb0_wdata,
   dmu_mb0_dou_pio_data_wr_en,
   dmu_mb0_dou_pio_data_rd_en  
   
   ); 
 
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter MEM_WIDTH   = `FIRE_DLC_ERD_DATA_WDTH+`FIRE_DLC_ERD_DPAR_WDTH;
  parameter MEM_TIEHIGH = 1'b1;
//  parameter MEM_TIELOW  = 1'b0;
 

  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  
  input                                   l2clk;
  input                                   clk;
  input                                   scan_in;
  input                                   tcu_array_bypass;
  input                                   tcu_se_scancollar_in;
  input                                   tcu_se_scancollar_out;
  input                                   tcu_array_wr_inhibit;
  input                                   tcu_pce_ov;
  input                                   tcu_aclk;
  input                                   tcu_bclk;
  output                                  scan_out;
 
 // CLU's CRM - DOU's EPR PIO Interface
  input 	                          cl2do_pio_wr;
  input [`FIRE_DLC_CPD_ADDR_WDTH-1:0] 	  cl2do_pio_addr; // Address width, to address 64 entries PIO
  input [`FIRE_DLC_CPD_DATA_WDTH-1:0] 	  cl2do_pio_data; // Data width, 16 bytes
  input [`FIRE_DLC_CPD_DPAR_WDTH-1:0] 	  cl2do_pio_dpar; // Parity width 32 bit parity on data

  // ILU's EIL - DOU Interface
  input [`FIRE_DLC_ERD_ADDR_WDTH-3:0] 	  y2epr_addr;     // Address width, to address 128 entries DMA / 64 entries PIO 

  // DOU's EPR - Mux
  output [MEM_WIDTH-1:0]                  epr2mux_pio_data_out;  // RAM data output
  
  // MBIST signals
  input         dmu_mb0_run;

  input [3:0]   dmu_mb0_addr;
  input [7:0]   dmu_mb0_wdata;
  input         dmu_mb0_dou_pio_data_wr_en;
  input         dmu_mb0_dou_pio_data_rd_en;

  //////////////////////////////////////////////////////////////////////
  //***************   Submodule Instantiations   ***********************
  //////////////////////////////////////////////////////////////////////
/*
  fire_dlc_ram64x132_211hd4 ram64x132_211hd4
    (
     // address ports
     .aadr     (y2epr_addr),
     .badr     (cl2do_pio_addr),
     
     // clock ports
     .clka     (l2clk),
     .clkb     (l2clk),
     
     // data input ports
     .dib      ({cl2do_pio_dpar, cl2do_pio_data}),
         
     // data output ports
     .doa      (epr2mux_pio_data_out),
     
     // port enables
     .ena      (MEM_TIEHIGH),
     .enb      (MEM_TIEHIGH),
     
     // write enables
     .web      (cl2do_pio_wr)
     );
*/
//BP n2 6-17-04 new ram model
//BP n2 7-20-04 new ram model from ram compiler
//BP n2 9-22-04
//	note that {cl2do_pio_dpar, cl2do_pio_data} come directly from flops in clu

wire	[MEM_WIDTH-1:0]	pio_data_out;
assign epr2mux_pio_data_out = tcu_array_bypass ? {cl2do_pio_dpar, cl2do_pio_data} : pio_data_out ;


//SV 02/24/05 added BIST logic
  wire    [131:0]  din_ram  ;
  wire    [3:0]   rd_addr_ram, wr_addr_ram ;
  wire            wr_en_ram, rd_en_ram  ;

  assign  din_ram        =   dmu_mb0_run ? ({dmu_mb0_wdata[3:0],{16{dmu_mb0_wdata}}}) : ({cl2do_pio_dpar, cl2do_pio_data}) ;
  assign  rd_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr[3:0] : y2epr_addr[3:0] ;
  assign  wr_addr_ram    =   dmu_mb0_run ? dmu_mb0_addr[3:0] : cl2do_pio_addr[3:0] ;
  assign  wr_en_ram      =   dmu_mb0_run ? dmu_mb0_dou_pio_data_wr_en : cl2do_pio_wr ;
  assign  rd_en_ram      =   dmu_mb0_run ? dmu_mb0_dou_pio_data_rd_en : MEM_TIEHIGH ;

  /* 0in memory_access -read_addr y2epr_addr[3:0] -read (y2epr_addr[3:0] != cl2do_pio_addr[3:0]) 
	-write_addr cl2do_pio_addr[3:0]
        -latency 1 -write cl2do_pio_wr
     -read_data  pio_data_out -write_data ({cl2do_pio_dpar, cl2do_pio_data}) -group mbist_mode */

        n2_com_dp_16x132s_cust  dou_pio_ram16x132
        (
     // address ports
     .rd_adr     (rd_addr_ram),
     .wr_adr     (wr_addr_ram),

     // clock ports
     .rdclk     (l2clk),
     .wrclk     (l2clk),

     // data input ports
     .din      (din_ram),

     // data output ports
     .dout      (pio_data_out),

     // port enables
     .rd_en      (rd_en_ram),

     // write enables
     .wr_en      (wr_en_ram),

        // scan ports
        .scan_in                (scan_in),
        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
        .tcu_pce_ov             (tcu_pce_ov),
        .rd_pce         	(1'b1),
        .wr_pce         	(1'b1),
        .bist_clk_mux_sel      	(1'b0),
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_out               (scan_out)
     );


endmodule // dmu_dou_epr

