// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_scoreboard_controller.v
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
module dmu_common_scoreboard_controller 
  ( 
    // Control Signals
    clk,
    rst_l,
    
    // External Interface
    
    // input
    req_in,
    cmd_type_in,
    trn_in,
    wr_data_in,
    
    // output
    full_out,
    n_trn_out,
    rd_data_out,
    grant_out,
    
    // Internal Interface
    
    // input
    rd_data_in,
    
    // output
    wr1_out,
    wr2_out,
    trn1_out,
    type_out,
    wr_data_out,
    req_out,
    
    // input
    full_in,
    n_trn_in,
    
    // output
    deq_out,
    trn2_out,
    enq_out,

    // debug ports
    dbg_a,
    dbg_b,
    dbg_sel_a,
    dbg_sel_b
    );

  //////////////////////////////////////////////////////////////////////
    //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////

// PARAMETERS PASSED IN ON INDIVIDUAL INSTANTIATIONS
  parameter CMD_TYPE_WIDTH = 4;
  parameter TAG_WIDTH      = 5;
  parameter WR_DATA_WIDTH  = 48;
  parameter RD_DATA_WIDTH  = 48;

// for command type definitions in case statement
  parameter IDLE        = 4'b0000;

  parameter DMA_RD      = 4'b0001;
  parameter DMA_CLR     = 4'b0010;
  parameter DMA_RD_CLR  = 4'b0011;
  parameter DMA_WR      = 4'b0100;
  parameter DMA_TRN_REQ = 4'b0101;

  parameter PIO_RD      = 4'b1001;
  parameter PIO_CLR     = 4'b1010;
  parameter PIO_RD_CLR  = 4'b1011;
  parameter PIO_WR      = 4'b1100;
  parameter PIO_TRN_REQ = 4'b1101;
  
  
  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control Signals 
  input                        clk;          // input clock
  input 		       rst_l;        // input reset
  
  // Controller external interface inputs
  
  input 		       req_in;       // service request signal
  input [CMD_TYPE_WIDTH-1:0]   cmd_type_in;  // command to be serviced from agent
  input [TAG_WIDTH-1:0]        trn_in;       // transaction number unique ID from agent
  input [WR_DATA_WIDTH-1:0]    wr_data_in;   // write data bus from agent
  
  // Controller external interface outputs
  
  output 		       full_out;     // full signals to agent
  output [TAG_WIDTH-1:0]       n_trn_out;    // next trn available for issue to agent
  output [RD_DATA_WIDTH-1:0]   rd_data_out;  // read data bus to agent
  output 		       grant_out;    // service granted signal to agent
  
  // Controller internal interface inputs
  
  input [RD_DATA_WIDTH-1:0]    rd_data_in;   // read data bus from scoreboard
  
  output 		       wr1_out;      // write enable to scoreboard
  output 		       wr2_out;      // write enable to scoreboard
  output [TAG_WIDTH-1:0]       trn1_out;     // transaction number unique ID to scoreboard
  output 		       type_out;     // command to be serviced from agent

  output [WR_DATA_WIDTH-1:0]   wr_data_out;  // write data bus to scoreboard
  output                       req_out;      // req out to scoreboard

  input 		       full_in;      // full signals from ttg
  input [TAG_WIDTH-1:0]        n_trn_in;     // next trn available from ttg
  
  // Controller internal interface outputs
  
  output 		     deq_out;        // dequeue signal to ttg to get next trn
  output [TAG_WIDTH-1:0]     trn2_out;       // transaction number unique ID to scoreboard
  output 		     enq_out;        // enqueue signal to ttg to retire trn
  
    // debug ports
  output [7:0] 		     dbg_a;          // Controller debug output a
  output [7:0] 		     dbg_b;          // Controller debug output b
  input [2:0] 		     dbg_sel_a;      // Controller debug select a
  input [2:0] 		     dbg_sel_b;      // Controller debug select b
  
  //////////////////////////////////////////////////////////////////////
  //***********************    Wires and Regs   ************************
  //////////////////////////////////////////////////////////////////////
  
  // registers that are flops
  reg [TAG_WIDTH-1:0] 	     n_trn_out;
  reg [RD_DATA_WIDTH-1:0]    rd_data_out;
  reg 			     grant_out;
  reg [3:0] 		     state,next_state;
 
  // registers that are not flops
  
 
  reg 			     next_grant;
  reg 			     wr1_out;
  reg 			     wr2_out;
  reg 			     deq_out;
  reg 			     enq_out; 
  reg [TAG_WIDTH-1:0] 	     trn1_out;
  wire 			     type_out;
  reg 			     full_out;
  // Wires
  
  wire 			     req_in; 
  wire 			     req_out;
  wire [CMD_TYPE_WIDTH-1:0]  cmd_type_in;
  wire [TAG_WIDTH-1:0] 	     trn_in;
  wire [WR_DATA_WIDTH-1:0]   wr_data_in;
  wire [TAG_WIDTH-1:0] 	     trn2_out;
  
  
  wire [RD_DATA_WIDTH-1:0]   rd_data_in;
  
  
  wire [WR_DATA_WIDTH-1:0]   wr_data_out;
  wire 			     full_in;
  wire [TAG_WIDTH-1:0] 	     n_trn_in;

  // Idle
  reg 			     scbd_idle;

  //debug 
  reg [2:0] 		     dbg_sel     [0:1];
  reg [7:0] 		     dbg_bus     [0:1];
  reg [7:0] 		     nxt_dbg_bus [0:1];

  // debug ports
  wire [7:0] 		     dbg_a;          // Controller debug output a
  wire [7:0] 		     dbg_b;          // Controller debug output b
  wire [2:0] 		     dbg_sel_a;      // Controller debug select a
  wire [2:0] 		     dbg_sel_b;      // Controller debug select b
  
  integer 		     i;
  
  //////////////////////////////////////////////////////////////////////
  // *********************  Combinational Logic  ***********************
  //////////////////////////////////////////////////////////////////////

  // debug

  always @ (dbg_sel_a or dbg_sel_b) 
    begin
      dbg_sel[0] = dbg_sel_a;
      dbg_sel[1] = dbg_sel_b;
    end

  always @ (dbg_sel[0] or dbg_sel[1] or state or next_state or trn_in or n_trn_in
            or trn1_out or n_trn_out or grant_out or full_out or req_in or cmd_type_in
            or wr1_out or wr2_out or deq_out or enq_out or scbd_idle) 
    begin
      for (i = 0; i < 2; i = i + 1) 
	begin
	  case (dbg_sel[i]) // synopsys parallel_case infer_mux
	    3'b000: nxt_dbg_bus[i] = {next_state, state};
	    3'b001: nxt_dbg_bus[i] = {3'b0, trn_in};
	    3'b010: nxt_dbg_bus[i] = {3'b0, n_trn_in};
	    3'b011: nxt_dbg_bus[i] = {3'b0, trn1_out};
	    3'b100: nxt_dbg_bus[i] = {3'b0, n_trn_out};
	    3'b101: nxt_dbg_bus[i] = {1'b0, grant_out, full_out, req_in, cmd_type_in};
	    3'b110: nxt_dbg_bus[i] = {4'b0, wr1_out, wr2_out, deq_out, enq_out};
	    3'b111: nxt_dbg_bus[i] = {7'b0, scbd_idle};
	  endcase
	end
    end

  assign dbg_a = dbg_bus[0];
  assign dbg_b = dbg_bus[1];

  // end debug

  assign wr_data_out = wr_data_in;            // pass through the write data
  assign trn2_out = trn1_out;                 // connect up inside module
  assign type_out = req_in & cmd_type_in[3];  // pass bit out off controller
  assign req_out = req_in;                    // pass through the req


  // Decode the command type

  always @(state or req_in or full_in or cmd_type_in or full_out)
    begin
      next_state      = IDLE;
      next_grant      = 1'b0;
      deq_out         = 1'b0;
      enq_out         = 1'b0;
      wr1_out         = 1'b0;
      wr2_out         = 1'b0;
      
      case(state)
	IDLE :	 
	    if(req_in)
	      begin
		next_state = cmd_type_in;
		if((cmd_type_in == DMA_TRN_REQ || cmd_type_in == PIO_TRN_REQ) && full_in)
		  next_grant = 1'b0;
		else
		  next_grant = 1'b1;
	      end
	    else
	      begin
		next_grant = 1'b0;
		next_state = IDLE;
		deq_out    = 1'b0;
		enq_out    = 1'b0;
		wr1_out    = 1'b0;
		wr2_out    = 1'b0;
	      end
	DMA_RD :                   // Read (DMA)
	  begin	   
	    next_grant = 1'b0;
	    next_state = IDLE;
	  end	     
	DMA_CLR :                 // Clear (DMA)
	  begin
	    enq_out    = 1'b1;
	    next_grant = 1'b0;
	    next_state = IDLE; 
	  end
	
	DMA_RD_CLR :             // Read w/ Clear (DMA)
	  begin	    
	    enq_out    = 1'b1;
	    next_grant = 1'b0;
	    next_state = IDLE;    
	  end
	
	DMA_WR :                 // Write (DMA)
	  begin
	    wr1_out    = 1'b1;
	    next_grant = 1'b0;
	    next_state = IDLE;   
	  end
	
	DMA_TRN_REQ :            // TRN Request w/ Write (DMA)
	  begin
	    if(!full_out)	   
	      begin
		deq_out    = 1'b1;	
		wr1_out    = 1'b1; 
		next_grant = 1'b0;
		next_state = IDLE;
	      end	    
	    else
	      begin
		next_state = IDLE;
	      end
	  end	
	PIO_RD:                 // Read (PIO)
	  begin
	    next_grant = 1'b0;
	    next_state = IDLE; 
	  end
	
	PIO_CLR :                // Clear(PIO)
	  begin
	    next_grant = 1'b0;
	    enq_out    = 1'b1;
	    next_state = IDLE;
	  end
	
	PIO_RD_CLR :              // Read w/ Clear(PIO)
	  begin
	   
	    next_grant = 1'b0;
	    enq_out    = 1'b1;
	    next_state = IDLE;
	  end
	
	PIO_WR :                 // Write(PIO)
	  begin
	    wr2_out    = 1'b1; 
	    next_grant = 1'b0;
	    next_state = IDLE;  
	  end
	
	PIO_TRN_REQ :            // TRN Request w/ Write(PIO)
	  begin
	    if(!full_out)
	      begin
		deq_out    = 1'b1;
		wr2_out    = 1'b1;  
		next_grant = 1'b0;
		next_state = IDLE;
	      end
	    else
	      begin
		next_state = IDLE;
	      end
	  end // case: PIO_TRN_REQ
	default : // 0in < fire -message " Error - controller default state entered "
	  begin
	    next_grant   = 1'b0;
	    next_state = IDLE;
	  end 
      endcase // case(cmd_type_in)
    end	
  
  // assign trn out to next trn on a TRN request
  always @ (trn_in or cmd_type_in or n_trn_in)
    begin
      if (cmd_type_in == DMA_TRN_REQ || cmd_type_in == PIO_TRN_REQ)
	trn1_out = n_trn_in;
      else
	trn1_out = trn_in;
    end
  
  //////////////////////////////////////////////////////////////////////
  // *********************  Sequential Logic  ***********************
  //////////////////////////////////////////////////////////////////////
  always@(posedge clk)
    if (!rst_l)
      state <= IDLE;
    else
      state <= next_state;

  // Give grant for request
  always @(posedge clk)
    if (!rst_l)
      grant_out <= 1'b0;
    else 
      grant_out <= next_grant;
  
  // for Read and Read w/ Clear
  always @(posedge clk)
    if (!rst_l)
      rd_data_out <= {RD_DATA_WIDTH{1'b0}};
    else 
      rd_data_out <= rd_data_in;
  
  // for TRN Request w/write
  always @(posedge clk)
    if (!rst_l)
      n_trn_out <= {TAG_WIDTH{1'b0}};
    else
      n_trn_out <= n_trn_in;

  // Assert full after last trn request is made
  always @(posedge clk)
    if (!rst_l)
      full_out <= 1'b0;
    else
      full_out <= full_in;

  always@(posedge clk)
    if(~rst_l)
      scbd_idle <=1'b1;
    else if (req_in == 1'b0)
      scbd_idle <=1'b1;
    else
      scbd_idle <=1'b0;
  // Debug port outputs
  always @ (posedge clk)
    begin 
      if(~rst_l) 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= 8'h00;
      else 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= nxt_dbg_bus[i];
    end // always @ (posedge clk)
  
    
endmodule // dmu_common_scoreboard_controller

