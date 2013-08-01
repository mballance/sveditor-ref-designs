// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_dmc_txcache.v
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

// 4K + Parity +tags
module niu_dmc_txcache( // 

`ifdef NEPTUNE
`else
			tcu_aclk,
			tcu_bclk,
			tcu_se_scancollar_in,
			tcu_se_scancollar_out,
			tcu_array_wr_inhibit,
			tds_tdmc_mbist_scan_in,
			tds_tdmc_mbist_scan_out,
			tcu_mbist_bisi_en,
			tcu_tds_tdmc_mbist_start,
			tds_tdmc_tcu_mbist_fail,
			tds_tdmc_tcu_mbist_done,
			tcu_scan_en,
			tcu_mbist_user_mode,
			l2clk_2x,
			hdr_sram_rvalue_tdmc,
			hdr_sram_rid_tdmc,
			hdr_sram_wr_en_tdmc,
			hdr_sram_red_clr_tdmc,
			sram_hdr_read_data_tdmc,
			tds_tcu_dmo_data_out,
			sram_reset,
			iol2clk,

			
`endif // !ifdef NEPTUNE
			
			WriteStrobe,        // Strobe for Write Port
			WriteClock,         // Clock for Write Port
			ReadStrobe,         // Strobe for Read Port
			ReadAddr,           // Address for Read Port
			WriteAddr,          // Address for Write Port
			DataIn,             // Data Output for Write Port
			DataOut,             // Data Input for Read Port
			ParityStatus,        // Result of Parity Comparison
			parity_corrupt_dma_match,
			parity_corrupt_config,
			Reset_L
			);
   
   
   input 	  WriteStrobe;
   input 	  WriteClock;
   input 	  ReadStrobe;
   input [7:0] 	  ReadAddr;
   input [7:0] 	  WriteAddr;
   input [131:0]  DataIn;
   
   input [31:0] parity_corrupt_dma_match;
   
   input [31:0] 	      parity_corrupt_config;
   input Reset_L;
   output [131:0] DataOut;
   output 	  ParityStatus;
   
`ifdef NEPTUNE
`else
   
   // mbist if
   input 	  tcu_aclk;
   input 	  tcu_bclk;
   input 	  tcu_se_scancollar_in;
   input 	  tcu_se_scancollar_out;
   input 	  tcu_array_wr_inhibit;
   input 	  tcu_scan_en;

   input 	  tds_tdmc_mbist_scan_in;
   output 	  tds_tdmc_mbist_scan_out;


   input 	  tcu_tds_tdmc_mbist_start; 
   input 	  tcu_mbist_bisi_en;
   output 	  tds_tdmc_tcu_mbist_fail;
   output 	  tds_tdmc_tcu_mbist_done;

   
   input          l2clk_2x;
   input          iol2clk;
   input 	  tcu_mbist_user_mode;


   input [6:0] 	  hdr_sram_rvalue_tdmc;
   input [1:0] 	  hdr_sram_rid_tdmc;
   input 	  hdr_sram_wr_en_tdmc;
   input 	  hdr_sram_red_clr_tdmc;
   output [6:0]   sram_hdr_read_data_tdmc;
   output [39:0] tds_tcu_dmo_data_out;
   input 	 sram_reset;

   
   
`endif // !ifdef NEPTUNE
   

   wire [131:0]   RamDataOut;
   wire [131:0]   DataOut;
   wire [15:0] 	  parity_in;
   wire [15:0] 	  parity_out;
   
   wire 	  ParityStatus;

`ifdef NEPTUNE
`else
   wire [7:0] niu_mb2_wdata;
   wire [7:0] niu_mb2_addr;
   wire [6:0] sram_hdr_read_data_tdmc;
   wire niu_mb2_wr_en;
   wire niu_mb2_rd_en;
   wire niu_mb2_run;
   wire [39:0] tds_tcu_dmo_data_out;
//   wire scan_wire; // cc Added per Carlos

   wire [147:0]   concat_niu_mb2_ram_256_148_wdata={
					       niu_mb2_wdata[3:0],
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata,
					       niu_mb2_wdata
					       }; 
   
   wire [147:0]   niu_mb2_ram_256_148_data_out =  {parity_out,RamDataOut};
`endif
   
   
   niu_tdmc_cacheparity niu_tdmc_cacheparity (
					      .SysClk(WriteClock),
					      .Reset_L(Reset_L),
					      .data_in(DataIn),
					      .parity(parity_in), 
					      .write_strobe(WriteStrobe),
					      .write_addr(WriteAddr[2:0]),
					      .parity_corrupt_dma_match(parity_corrupt_dma_match),
					      .parity_corrupt_config(parity_corrupt_config),
					      .data_out(DataOut), // floped version of RamDataOut
					      .ram_data_out(RamDataOut),	
					      .ram_parity_out(parity_out),
					      .parity_status(ParityStatus)
					      );
   


   niu_ram_256_148 niu_ram_256_148 ( 

`ifdef NEPTUNE
`else
				     
		    		     .tcu_scan_en (tcu_scan_en),
				     .tcu_aclk(tcu_aclk),
				     .tcu_bclk(tcu_bclk),
				     .tcu_se_scancollar_in(tcu_se_scancollar_in),
				     .tcu_se_scancollar_out(tcu_se_scancollar_out),
				     .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
				     .scan_in(1'b0),   // cc
				     .scan_out(),      // cc
				     // array name = <array_name>
				     // 8 bit wdata used for 152 bits
				     .mbi_wdata(concat_niu_mb2_ram_256_148_wdata[147:0]),
				     .mbi_rd_adr(niu_mb2_addr),
				     .mbi_wr_adr(niu_mb2_addr),
				     .mbi_wr_en(niu_mb2_wr_en),
				     .mbi_rd_en(niu_mb2_rd_en), 
				     .mbi_run(niu_mb2_run),
				     .l2clk_2x(l2clk_2x),
				     // signals for efuse

				     .hdr_sram_rvalue            (hdr_sram_rvalue_tdmc),
				     .hdr_sram_rid               (hdr_sram_rid_tdmc),
				     .hdr_sram_wr_en             (hdr_sram_wr_en_tdmc),
				     .hdr_sram_red_clr           (hdr_sram_red_clr_tdmc),
				     .sram_hdr_read_data         (sram_hdr_read_data_tdmc),
				     .reset			 (sram_reset),
`endif
				     
				     .data_inp({parity_in,DataIn}),
				     .addr_rd(ReadAddr),
				     .addr_wt(WriteAddr),
				     .wt_enable(WriteStrobe),
				     .cs_rd(ReadStrobe),
`ifdef NEPTUNE
				     .clk(WriteClock),
`else
				     .clk(iol2clk),
`endif

				     .data_out({parity_out,RamDataOut})
				     );
   
   // reg    [131:0] regFile[255:0];
   
   /*--------------------------------------------------------------*/
   // Read logic
   /*--------------------------------------------------------------*/
   // always @(posedge ReadClock or negedge Reset_L)
   // if (!Reset_L)         DataOut <= 146'h0;
   // else if (ReadStrobe)  DataOut <= regFile[ReadAddr];
   
   /*--------------------------------------------------------------*/
   // Write logic
   /*--------------------------------------------------------------*/
   // always @(posedge WriteClock or negedge Reset_L)
   // if (!Reset_L)         regFile[0] <= 146'h0;
   // else if (WriteStrobe) regFile[WriteAddr] <= DataIn;
   
`ifdef NEPTUNE
`else
   
   niu_mb2 niu_mb2 (/*AUTOJUNK*/
		    // Outputs
		    .niu_mb2_rd_en	(niu_mb2_rd_en),
		    .niu_mb2_wr_en	(niu_mb2_wr_en),
		    .niu_mb2_addr	(niu_mb2_addr[7:0]),
		    .niu_mb2_wdata	(niu_mb2_wdata[7:0]),
		    .niu_mb2_run	(niu_mb2_run),
		    .niu_tcu_mbist_fail_2(tds_tdmc_tcu_mbist_fail),
		    .niu_tcu_mbist_done_2(tds_tdmc_tcu_mbist_done),
		    .mb2_scan_out	(tds_tdmc_mbist_scan_out),
	            // signals for DMO
		    .mb2_dmo_dout(tds_tcu_dmo_data_out), 
		    // Inputs
		    .l1clk		(WriteClock),
		    .rst_l		(Reset_L),
		    .tcu_mbist_user_mode(tcu_mbist_user_mode),
		    .mb2_scan_in	(tds_tdmc_mbist_scan_in),
		    .tcu_aclk		(tcu_aclk),
		    .tcu_bclk		(tcu_bclk),
		    .tcu_niu_mbist_start_2(tcu_tds_tdmc_mbist_start),
		    .tcu_mbist_bisi_en	(tcu_mbist_bisi_en),
		    .niu_mb2_tdmc_data_out({niu_mb2_ram_256_148_data_out[147:0]}) );
`endif
endmodule
// Local Variables:
// verilog-library-directories:(".")
// End:
