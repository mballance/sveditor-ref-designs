// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_psb_pdl.v
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
module dmu_psb_pdl 
  (
  
   // Control Signals
   clk,
   rst_l,

   // Input from PIC Controller to PDL
   pic2pdl_dma_wr_in,
   pic2pdl_pktag_in,
   pic2pdl_type_in,
   pic2pdl_dma_wr_data_in,
   pic2pdl_req_in,
  
   // Output from PDL to PIC Controller
   pdl2pic_pio_rd_data_out,
   
   // Input from PCE Controller to PDL
   pce2pdl_pio_wr_in,
  
   pce2pdl_pktag_in,
   pce2pdl_type_in,
   pce2pdl_pio_wr_data_in,
   pce2pdl_req_in,
   
   // Output from PDL to PCE Controller
   pdl2pce_dma_rd_data_out,
   
   // CSR interface
   ext_addr,
   psb_dma_ext_done,
   psb_pio_ext_done,
   psb_dma_ext_select,
   psb_dma_ext_rd_data,
   psb_pio_ext_select,
   psb_pio_ext_rd_data,
   
   // Debug Ports
   pdl2dbg_dbg_a,
   pdl2dbg_dbg_b,
   dbg2pdl_dbg_sel_a,
   dbg2pdl_dbg_sel_b

   );
  
  // synopsys sync_set_reset "rst_l"

  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter DMA_DEPTH        = 32;       // 32
  parameter PIO_DEPTH        = 16;       // 16

  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
 
  // Control signals

  input                                          clk;
  input                                          rst_l;

  // PIC to PDL Interface
  input                                          pic2pdl_dma_wr_in;
  input [`FIRE_DLC_PSR_TRN_WDTH-1:0]    	 pic2pdl_pktag_in;
  input 					 pic2pdl_type_in;
  input [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 pic2pdl_dma_wr_data_in;
  input 					 pic2pdl_req_in;

  // PDL to PIC Interface
  output [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 pdl2pic_pio_rd_data_out;
  
  // PCE to PDL Interface 
  input 					 pce2pdl_pio_wr_in;
  input [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		 pce2pdl_pktag_in;
  input 					 pce2pdl_type_in;
  input [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 pce2pdl_pio_wr_data_in; 
  input 					 pce2pdl_req_in;

  // PDL to PCE Interface
  output [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 pdl2pce_dma_rd_data_out;

  // CSR Interface
  input [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		 ext_addr;
  input 					 psb_dma_ext_select; 
  input 					 psb_pio_ext_select;
  
  output 					 psb_dma_ext_done;
  output 					 psb_pio_ext_done;
  output [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 psb_dma_ext_rd_data;   // SAME AS pdl2pce_rd_data_out
  output [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 psb_pio_ext_rd_data;   // SAME AS pdl2pic_rd_data_out 

  // Debug Ports

  output [`FIRE_DBG_DATA_BITS] 			 pdl2dbg_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 			 pdl2dbg_dbg_b;
  
  input [2:0] 					 dbg2pdl_dbg_sel_a;
  input [2:0] 					 dbg2pdl_dbg_sel_b;
  

  //////////////////////////////////////////////////////////////////////
  //***********************    Wires and Regs   ************************
  //////////////////////////////////////////////////////////////////////

  wire 						 pic2pdl_dma_wr_in;
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 pic2pdl_dma_wr_data_in;
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 pdl2pic_pio_rd_data_out;
  
  
  wire 						 pce2pdl_pio_wr_in;
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 pce2pdl_pio_wr_data_in;
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 pdl2pce_dma_rd_data_out;
  
  wire 						 req_in;
  reg [DMA_DEPTH-1:0] 			         pktag1_dcd;        // decoded pktag1   5 bit to 32 bit
  reg [PIO_DEPTH-1:0] 			         pktag2_dcd;        // decoded pktag2   4 bit to 16 bit
  
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 psb_pio_ext_rd_data; 
  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 psb_dma_ext_rd_data;
   
  reg 						 psb_dma_ext_done;
  reg 						 psb_pio_ext_done;
  
  reg [`FIRE_DLC_PSR_TRN_WDTH-2:0] 		 pio_addr;
  reg [`FIRE_DLC_PSR_TRN_WDTH-1:0] 		 dma_addr;
  

  wire [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0] 	 dma_wr_data_in;
  wire [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0] 	 pio_wr_data_in;
  
  
  wire [DMA_DEPTH-1:0] 			         pic_dma_wr_data_ld;   
  wire [PIO_DEPTH-1:0] 			         pce_pio_wr_data_ld;   
  integer 				         i, j, k, m;
  
  //-----------------  FLOPS  -----------------------------
  
  // memory array's
  // memory with 32 - 46 bit entries
  reg [`FIRE_DLC_PSR_DMA_DATA_WDTH-1:0]        dma_data[0:DMA_DEPTH-1]; 

  // memory with 16 - 6 bit entries
  reg [`FIRE_DLC_PSR_PIO_DATA_WDTH-1:0]        pio_data[0:PIO_DEPTH-1]; 

  // debug 
  reg [2:0] 				       dbg_sel     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		       dbg_bus     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		       nxt_dbg_bus [0:1];
  
  // debug wires
  wire [`FIRE_DBG_DATA_BITS] 		       pdl2dbg_dbg_a;          // PDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 		       pdl2dbg_dbg_b;          // PDL debug output b
  wire [2:0] 				       dbg2pdl_dbg_sel_a;      // PDL debug select a
  wire [2:0] 				       dbg2pdl_dbg_sel_b;      // PDL debug select b
   
  //////////////////////////////////////////////////////////////////////
  // ******** Zero-in checkers************************************
  //////////////////////////////////////////////////////////////////////
  
  
  // 0in decoder -in pic2pdl_pktag_in -out pktag1_dcd
  // 0in decoder -in pce2pdl_pktag_in[3:0] -out pktag2_dcd
  
  // 0in bits_on -var pic_dma_wr_data_ld -max 1
  // 0in bits_on -var pce_pio_wr_data_ld -max 1


  //////////////////////////////////////////////////////////////////////
  // ********  Combinational Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  // debug
  
  always @ (dbg2pdl_dbg_sel_a or dbg2pdl_dbg_sel_b) 
    begin
      dbg_sel[0] = dbg2pdl_dbg_sel_a;
      dbg_sel[1] = dbg2pdl_dbg_sel_b;
    end
  
  always @ (dbg_sel[0] or dbg_sel[1] or pic2pdl_req_in or pic2pdl_type_in or pic2pdl_dma_wr_in or pic2pdl_pktag_in
            or pce2pdl_req_in or pce2pdl_type_in or pce2pdl_pktag_in or pce2pdl_pio_wr_in
            or psb_dma_ext_select or psb_pio_ext_select or ext_addr or psb_dma_ext_done or psb_pio_ext_done) 
    begin
      for (i = 0; i < 2; i = i + 1) 
	begin
	  case (dbg_sel[i]) // synopsys parallel_case infer_mux
	    3'b000: nxt_dbg_bus[i] = {pic2pdl_dma_wr_in, pic2pdl_req_in, pic2pdl_type_in, pic2pdl_pktag_in};
	    3'b001: nxt_dbg_bus[i] = {pce2pdl_pio_wr_in, pce2pdl_req_in, pce2pdl_type_in, pce2pdl_pktag_in};
	    3'b010: nxt_dbg_bus[i] = {1'b0, psb_dma_ext_select, psb_dma_ext_done, ext_addr};
	    3'b011: nxt_dbg_bus[i] = {1'b0, psb_pio_ext_select, psb_pio_ext_done, ext_addr};
	    3'b100: nxt_dbg_bus[i] = 8'b0;
	    3'b101: nxt_dbg_bus[i] = 8'b0;
	    3'b110: nxt_dbg_bus[i] = 8'b0;
	    3'b111: nxt_dbg_bus[i] = 8'b0;
	  endcase
	end
    end

  assign pdl2dbg_dbg_a = dbg_bus[0];
  assign pdl2dbg_dbg_b = dbg_bus[1];

  // end debug

  //--------------------------------------------------------------------
  // pktag1 and pktag2  decode 
  //--------------------------------------------------------------------
 
  // returns a binary 32 bit vector with 1 bit set
  // decode pktag from PIC controller (type_in pio = 1 , dma = 0)
 
  always @(pic2pdl_pktag_in)
    begin
      pktag1_dcd = {DMA_DEPTH{1'b0}};
      pktag1_dcd[pic2pdl_pktag_in] = 1'b1;
    end

  // returns a binary 16 bit vector with 1 bit set
  // decode pktag from PCE controller (type_in pio = 1 , dma = 0)
   
  always @(pce2pdl_pktag_in)
    begin
      pktag2_dcd = {PIO_DEPTH{1'b0}};
      pktag2_dcd[pce2pdl_pktag_in[3:0]] = 1'b1;
    end 
  
  //--------------------------------------------------------------------
  // Scoreboard Controller read from pdl
  //--------------------------------------------------------------------
  
  assign pdl2pic_pio_rd_data_out = pio_data[pio_addr];
  assign pdl2pce_dma_rd_data_out = dma_data[dma_addr];


  assign psb_pio_ext_rd_data = pdl2pic_pio_rd_data_out; 
  assign psb_dma_ext_rd_data = pdl2pce_dma_rd_data_out;
  
  assign req_in = pic2pdl_req_in | pce2pdl_req_in;
  // dcm read from pdl

  always @ (req_in or psb_pio_ext_select or ext_addr or pic2pdl_pktag_in or psb_dma_ext_select or pce2pdl_pktag_in )
    if (!req_in && psb_pio_ext_select)
      begin
	pio_addr = ext_addr[3:0];
	dma_addr = pce2pdl_pktag_in;
	psb_pio_ext_done = 1'b1;
	psb_dma_ext_done = 1'b0;
      end
    else if (!req_in && psb_dma_ext_select)
      begin
	dma_addr = ext_addr;
	pio_addr = pic2pdl_pktag_in[3:0];
	psb_dma_ext_done = 1'b1;
	psb_pio_ext_done = 1'b0;
      end
    else 
      begin
	dma_addr = pce2pdl_pktag_in;
	pio_addr = pic2pdl_pktag_in[3:0];
	psb_pio_ext_done = 1'b0;
	psb_dma_ext_done = 1'b0;
      end

   // Register array load is determined by the wr_data_load for the individual
   // address row. This value is generated from a decode of the packet tag
   // input and the wr_data input for each agent wanting to perform a write.
  
  // load logic to determine which row will get written to
  assign pic_dma_wr_data_ld  = pktag1_dcd & {DMA_DEPTH{pic2pdl_dma_wr_in}};
  assign pce_pio_wr_data_ld  = pktag2_dcd & {PIO_DEPTH{pce2pdl_pio_wr_in}};
 
  //--------------------------------------------------------------------
  // write from scoreboard controllers
  //--------------------------------------------------------------------
  assign dma_wr_data_in = pic2pdl_dma_wr_data_in;
  assign pio_wr_data_in = pce2pdl_pio_wr_data_in;

  //////////////////////////////////////////////////////////////////////
  // ***********  Sequential Logic  ************************************
  //////////////////////////////////////////////////////////////////////

  always @(posedge clk)
    begin
      if (~rst_l)
	for(j=0; j < DMA_DEPTH; j=j+1)
	  dma_data[j] <= {`FIRE_DLC_PSR_DMA_DATA_WDTH{1'b0}};
      else
	for(j=0; j < DMA_DEPTH; j=j+1)
	  if (pic_dma_wr_data_ld[j])
	    dma_data[j] <= dma_wr_data_in;
    end
  
  always @(posedge clk)
    begin
      if (~rst_l)
	for(k=0; k < PIO_DEPTH; k=k+1)
	  pio_data[k] <= {`FIRE_DLC_PSR_PIO_DATA_WDTH{1'b0}};
      else
	for(k=0; k < PIO_DEPTH; k=k+1) 
	  if (pce_pio_wr_data_ld[k])
	    pio_data[k] <= pio_wr_data_in;
    end

  
  // Debug port outputs
  always @ (posedge clk)
    begin 
      if(~rst_l) 
	for (m = 0; m < 2; m = m + 1)
	  dbg_bus[m] <= 8'h00;
      else 
	for (m = 0; m < 2; m = m + 1)
	  dbg_bus[m] <= nxt_dbg_bus[m];
    end // always @ (posedge clk)
  
endmodule // dmu_psb_pdl

