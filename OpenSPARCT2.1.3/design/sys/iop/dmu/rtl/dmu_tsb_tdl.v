// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tsb_tdl.v
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
module dmu_tsb_tdl 
  (
   // Control Signals
   
   clk, 
   rst_l,
   
   // Input from TIC Controller to TDL (Write Data)
   tic2tdl_wr_in,
   tic2tdl_trtag_in,
   tic2tdl_wr_data_in,
   tic2tdl_req_in,
   
   // Input from TEC Controller to TDL (Write Data)
   tec2tdl_wr_in,
   tec2tdl_trtag_in,
   tec2tdl_wr_data_in,     
   tec2tdl_req_in,
   
   // Output from TDL to TEC Controller (Read Data)
   tdl2tec_rd_data_out,   
   
   // CSR interface
   ext_addr,
   
   tsb_dma_ext_done,
   tsb_dma_ext_select,
   tsb_dma_ext_rd_data,
   
   // Debug Ports
   tdl2dbg_dbg_a,
   tdl2dbg_dbg_b,
   dbg2tdl_dbg_sel_a,
   dbg2tdl_dbg_sel_b
   );
  
  // synopsys sync_set_reset "rst_l"
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
  
  parameter DEPTH            = 32;       //32
  parameter DCD_TAG_WIDTH    = 32;       //32
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals
  input                                    clk;
  input 				   rst_l;
  
  // TIC to TDL Interface
  input 				   tic2tdl_wr_in;
  input [`FIRE_DLC_TSR_TRN_WDTH-1:0] 	   tic2tdl_trtag_in;
  input [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]   tic2tdl_wr_data_in;
  input 				   tic2tdl_req_in;
  
  // TEC to TDL Interface 
  input 				   tec2tdl_wr_in;
  input [`FIRE_DLC_TSR_TRN_WDTH-1:0] 	   tec2tdl_trtag_in;
  input [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]   tec2tdl_wr_data_in;
  input 				   tec2tdl_req_in;
  
  // TDL to TEC Interface 
  output [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0]  tdl2tec_rd_data_out;
  
  // CSR Interface
  input [`FIRE_DLC_TSR_TRN_WDTH-1:0] 	   ext_addr;
  input 				   tsb_dma_ext_select;
  
  output 				   tsb_dma_ext_done;
  output [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0]  tsb_dma_ext_rd_data;   // SAME AS tdl2tec_rd_data_out
  
  
  // Debug Ports
  
  output [`FIRE_DBG_DATA_BITS] 			 tdl2dbg_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 			 tdl2dbg_dbg_b;
  
  input [2:0] 					 dbg2tdl_dbg_sel_a;
  input [2:0] 					 dbg2tdl_dbg_sel_b;
  
  //////////////////////////////////////////////////////////////////////
  //***********************    Wires and Regs   ************************
  //////////////////////////////////////////////////////////////////////
  
  wire 						 tic2tdl_wr_in; 
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 tic2tdl_wr_data_in;
  
  wire 						 tec2tdl_wr_in;
  wire [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 	 tec2tdl_wr_data_in;
  wire [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	 tdl2tec_rd_data_out;
  
  wire 						 req_in;
  reg [DCD_TAG_WIDTH - 1:0] 			 trtag1_dcd;        // decoded trtag1 4 bit to 16 bit 
  reg [DCD_TAG_WIDTH - 1:0] 			 trtag2_dcd;        // decoded trtag2 4 bit to 16 bit
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 trtag1; 
  wire [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 trtag2; 
  
  wire [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0] 	 tsb_dma_ext_rd_data;
  reg 						 tsb_dma_ext_done;		 
  
  reg [`FIRE_DLC_TSR_TRN_WDTH-1:0] 		 dma_addr;
  reg [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 		 nxt_wr_data_in [0:DEPTH-1];
  
  wire [DEPTH-1:0] 				 wr_data_ld;
  wire [DEPTH-1:0] 				 tic_wr_data_ld;
  wire [DEPTH-1:0] 				 tec_wr_data_ld;
  
  integer 					 i, j, k, l;
  
  // memory array
  reg [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0] 		 dma_data[0:DEPTH-1]; // memory with 32 - 48 bit entries
  
  // debug 
  reg [2:0] 					 dbg_sel     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 			 dbg_bus     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 			 nxt_dbg_bus [0:1];
  
  // debug wires
  wire [`FIRE_DBG_DATA_BITS] 			 tdl2dbg_dbg_a;          // TDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 			 tdl2dbg_dbg_b;          // TDL debug output b
  wire [2:0] 					 dbg2tdl_dbg_sel_a;      // TDL debug select a
  wire [2:0] 					 dbg2tdl_dbg_sel_b;      // TDL debug select b
    
  //////////////////////////////////////////////////////////////////////
  // ******** Zero-in checkers************************************
  //////////////////////////////////////////////////////////////////////
  
  // 0in decoder -in trtag1 -out trtag1_dcd
  // 0in decoder -in trtag2 -out trtag2_dcd
  
  // 0in bits_on -var tic_wr_data_ld -max 1
  // 0in bits_on -var tec_wr_data_ld -max 1
  // 0in bits_on -var wr_data_ld     -max 2
  
  //////////////////////////////////////////////////////////////////////
  // ********  Combinational Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  // debug
  
  always @ (dbg2tdl_dbg_sel_a or dbg2tdl_dbg_sel_b) 
    begin
      dbg_sel[0] = dbg2tdl_dbg_sel_a;
      dbg_sel[1] = dbg2tdl_dbg_sel_b;
    end
  
  always @ (dbg_sel[0] or dbg_sel[1] or tic2tdl_wr_in or tic2tdl_req_in or tic2tdl_trtag_in 
            or tec2tdl_wr_in or tec2tdl_req_in or tec2tdl_trtag_in or 
            tsb_dma_ext_done or tsb_dma_ext_select or ext_addr) 
    begin
      for (i = 0; i < 2; i = i + 1) 
	begin
	  case (dbg_sel[i]) // synopsys parallel_case infer_mux
	    3'b000: nxt_dbg_bus[i] = {1'b0, tic2tdl_wr_in, tic2tdl_req_in, tic2tdl_trtag_in};
	    3'b001: nxt_dbg_bus[i] = {1'b0, tec2tdl_wr_in, tec2tdl_req_in, tec2tdl_trtag_in};
	    3'b010: nxt_dbg_bus[i] = {1'b0, tsb_dma_ext_done,tsb_dma_ext_select, ext_addr};
	    3'b011: nxt_dbg_bus[i] = 8'b0;
	    3'b100: nxt_dbg_bus[i] = 8'b0;
	    3'b101: nxt_dbg_bus[i] = 8'b0;
	    3'b110: nxt_dbg_bus[i] = 8'b0;
	    3'b111: nxt_dbg_bus[i] = 8'b0;
	  endcase
	end
    end
  
  assign tdl2dbg_dbg_a = dbg_bus[0];
  assign tdl2dbg_dbg_b = dbg_bus[1];
  
  // end debug
  
  //--------------------------------------------------------------------
  // trtag1 and trtag2  decode 
  //--------------------------------------------------------------------
  assign trtag1 =  tic2tdl_trtag_in;
  
  always @(trtag1)
    begin
      trtag1_dcd = {DCD_TAG_WIDTH{1'b0}};
      trtag1_dcd[trtag1] = 1'b1;
    end
  
  assign trtag2 = tec2tdl_trtag_in;
  
  always @(trtag2)
    begin
      trtag2_dcd = {DCD_TAG_WIDTH{1'b0}};
      trtag2_dcd[trtag2] = 1'b1;
    end
  
  //--------------------------------------------------------------------
  //  Scoreboard Controller read from tdl 
  //--------------------------------------------------------------------
  
  assign tdl2tec_rd_data_out = dma_data[dma_addr];
  assign tsb_dma_ext_rd_data = tdl2tec_rd_data_out;
  
  assign req_in = tic2tdl_req_in | tec2tdl_req_in;
  
  // dcm read from tdl
  
  always @ (req_in or tsb_dma_ext_select or ext_addr or tec2tdl_trtag_in)
    if (!req_in && tsb_dma_ext_select)
      begin
	dma_addr = ext_addr;
	tsb_dma_ext_done = 1'b1;
      end
    else
      begin
	dma_addr = tec2tdl_trtag_in;
	tsb_dma_ext_done = 1'b0;
      end
  
  // Register array load is determined by the wr_data_load for the individual
  // address row. This value is generated from a decode of the transaction tag
  // input and the wr_data input for each agent wanting to perform a write.
  
  // load logic to determine which row will get written to
  assign tic_wr_data_ld = trtag1_dcd & {DEPTH{tic2tdl_wr_in}};
  assign tec_wr_data_ld = trtag2_dcd & {DEPTH{tec2tdl_wr_in}};
  assign wr_data_ld = tic_wr_data_ld | tec_wr_data_ld;
  
  //--------------------------------------------------------------------
  // write from scoreboard controllers
  //--------------------------------------------------------------------
  
  // mux for each row of the flop array to select data from controller 1 or 2
  
  always @ (tec_wr_data_ld or tic2tdl_wr_data_in or tec2tdl_wr_data_in)
    begin
      for (j=0; j < DEPTH; j=j+1)
	begin	 
	  case(tec_wr_data_ld[j]) // synopsys parallel_case
	    1'b0 : nxt_wr_data_in[j] = tic2tdl_wr_data_in;
	    1'b1 : nxt_wr_data_in[j] = tec2tdl_wr_data_in;
	  endcase // case(tec_wr_data_ld [j])
	end
    end
  //////////////////////////////////////////////////////////////////////
  // ***********  Sequential Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  always @(posedge clk)
    begin
      for (k=0; k < DEPTH; k=k+1)
	begin	 
	  if (!rst_l)
	    dma_data[k] <= {`FIRE_DLC_TSR_WR_DATA_WDTH{1'b0}};
	  else if(wr_data_ld[k])
	    dma_data[k] <= nxt_wr_data_in[k];
	end
    end
  
  // Debug port outputs
  always @ (posedge clk)
    begin 
      for (l = 0; l < 2; l = l + 1)
	begin
	  if(!rst_l) 
	    dbg_bus[l] <= 8'h00;
	  else 
	    dbg_bus[l] <= nxt_dbg_bus[l];
	end
    end // always @ (posedge clk)
  
endmodule // dmu_tsb_tdl
