// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcc.v
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
module pcie_common_dcc 
  (
   csr_ring_out,		// ring output
   csrbus_wr_data,		// csr write data
   csrbus_addr,			// csr address
   csrbus_wr,			// csr write
   csrbus_valid,		// csr valid
   csrbus_src_bus,		// csr source bus
   clk,				// clock
   rst_l,			// reset
   csr_ring_in,			// ring input
   csrbus_read_data,		// csr read data
   csrbus_done,			// csr done
   csrbus_mapped,		// csr mapped
   csrbus_acc_vio		// csr access violation
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 3'b000,		// state machine states
		REQ0 = 3'b001,
		REQ1 = 3'b010,
		WAIT = 3'b011,
		MAPD = 3'b100,
		DONE = 3'b101,
		RSP0 = 3'b110,
		RSP1 = 3'b111;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  output [`FIRE_CSR_RING_BITS]		csr_ring_out;
  output [`FIRE_CSR_DATA_BITS]		csrbus_wr_data;
  output [`FIRE_CSR_ADDR_BITS]		csrbus_addr;
  output				csrbus_wr;
  output				csrbus_valid;
  output [`FIRE_CSR_SRCB_BITS]		csrbus_src_bus;

  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_RING_BITS]		csr_ring_in;
  input  [`FIRE_CSR_DATA_BITS]		csrbus_read_data;
  input 				csrbus_done;
  input 				csrbus_mapped;
  input 				csrbus_acc_vio;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_ADDR_BITS]		csrbus_addr;
  wire [`FIRE_CSR_DATA_BITS]		csrbus_wr_data;
  wire [`FIRE_CSR_SRCB_BITS]		csrbus_src_bus;
  wire [`FIRE_CSR_CMND_BITS]		rng_cmnd, new_cmnd;

  reg  [`FIRE_CSR_RING_BITS]		rsp_addr, csr_ring_out, nxt_ring_out;
  reg  [`FIRE_CSR_DATA_BITS]		data, rsp_data;
  reg  [`FIRE_CSR_ADDR_BITS]		addr;
  reg  [`FIRE_CSR_SRCB_BITS]		srcb;
  reg  [`FIRE_CSR_CMND_BITS]		rsp_cmnd;
  reg  [2:0]				state, nxt_state;
  reg  [2:0]				req_vld;
  reg  [1:0]				sel_out;
  reg					rsp_vld;
  reg					sel, nxt_sel;
  reg					vld, nxt_vld;
  reg					wrt;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in known_driven -var csrbus_wr_data -active csrbus_valid
  // 0in change_window -start csrbus_valid -stop ~csrbus_valid -not_in csrbus_wr_data -exclude_stop
  // 0in known_driven -var csrbus_addr  -active csrbus_valid
  // 0in change_window -start csrbus_valid -stop ~csrbus_valid -not_in csrbus_addr -exclude_stop
  // 0in known_driven -var csrbus_wr -active csrbus_valid
  // 0in change_window -start csrbus_valid -stop ~csrbus_valid -not_in csrbus_wr -exclude_stop
  // 0in known_driven -var csrbus_src_bus -active csrbus_valid
  // 0in change_window -start csrbus_valid -stop ~csrbus_valid -not_in csrbus_src_bus -exclude_stop

  // 0in assert_timer -var (csrbus_valid && csrbus_mapped) -min 1 -active csrbus_valid
  // 0in assert_timer -var (csrbus_valid && csrbus_done) -min 1 -active csrbus_valid

  // 0in state_transition -var state -val IDLE -next REQ0 RSP0
  // 0in state_transition -var state -val REQ0 -next REQ1
  // 0in state_transition -var state -val REQ1 -next WAIT
  // 0in state_transition -var state -val WAIT -next IDLE REQ0 RSP0 MAPD DONE
  // 0in state_transition -var state -val MAPD -next IDLE REQ0 RSP0 DONE
  // 0in state_transition -var state -val DONE -next RSP0
  // 0in state_transition -var state -val RSP0 -next RSP1
  // 0in state_transition -var state -val RSP1 -next IDLE

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// valid and command
  assign rng_cmnd = csr_ring_in[`FIRE_CSR_RING_CMND_BITS];

// next state
  always @ (state or rng_cmnd or csrbus_mapped or csrbus_done or csrbus_acc_vio) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	case (rng_cmnd) // synopsys parallel_case
	  `FIRE_CSR_CMND_RREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_WREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_RRSP : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WRSP : nxt_state = RSP0;
	  `FIRE_CSR_CMND_RERR : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WERR : nxt_state = RSP0;
	  default             : nxt_state = IDLE;
	endcase
      end
      REQ0 : nxt_state = REQ1;
      REQ1 : nxt_state = WAIT;
      WAIT : begin
	case (rng_cmnd) // synopsys parallel_case
	  `FIRE_CSR_CMND_RSET : nxt_state = IDLE;
	  `FIRE_CSR_CMND_RREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_WREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_RRSP : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WRSP : nxt_state = RSP0;
 	  `FIRE_CSR_CMND_RERR : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WERR : nxt_state = RSP0;
	  default : begin
	    case ({csrbus_mapped, csrbus_done, csrbus_acc_vio}) // synopsys parallel_case
	      3'b000 : nxt_state = WAIT;
	      3'b001 : nxt_state = DONE;
	      3'b010 : nxt_state = DONE;
	      3'b011 : nxt_state = DONE;
	      3'b100 : nxt_state = MAPD;
	      3'b101 : nxt_state = DONE;
	      3'b110 : nxt_state = DONE;
	      3'b111 : nxt_state = DONE;
	    endcase
	  end
	endcase
      end
      MAPD : begin
	case (rng_cmnd) // synopsys parallel_case
	  `FIRE_CSR_CMND_RSET : nxt_state = IDLE;
	  `FIRE_CSR_CMND_RREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_WREQ : nxt_state = REQ0;
	  `FIRE_CSR_CMND_RRSP : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WRSP : nxt_state = RSP0;
 	  `FIRE_CSR_CMND_RERR : nxt_state = RSP0;
	  `FIRE_CSR_CMND_WERR : nxt_state = RSP0;
	  default : begin
	    case ({csrbus_done, csrbus_acc_vio}) // synopsys parallel_case
	      2'b00 : nxt_state = MAPD;
	      2'b01 : nxt_state = DONE;
	      2'b10 : nxt_state = DONE;
	      2'b11 : nxt_state = DONE;
	    endcase
	  end
	endcase
      end
      DONE : nxt_state = RSP0;
      RSP0 : nxt_state = RSP1;
      RSP1 : nxt_state = IDLE;
    endcase
  end

// state outputs
  always @ (state or nxt_state or sel or wrt) begin
    nxt_sel = 0;
    nxt_vld = 0;
    req_vld = 0;
    rsp_vld = 0;
    sel_out = 0;
    case (state) // synopsys parallel_case
      IDLE : begin
	req_vld = 3'b100;
      end
      REQ0 : begin
	req_vld = 3'b010;
      end
      REQ1 : begin
	nxt_vld = 1'b1;
	req_vld = 3'b001;
      end
      WAIT : begin
	case (nxt_state) // synopsys parallel_case
	  REQ0 : begin
	    req_vld = 3'b100;
	  end
	  WAIT : begin
	    nxt_vld = 1'b1;
	  end
	  MAPD : begin
	    nxt_vld = 1'b1;
	  end
	  DONE : begin
	    rsp_vld = 1'b1;
	  end
	  default : begin
	    nxt_vld = 0;
	  end
	endcase
      end
      MAPD : begin
	case (nxt_state) // synopsys parallel_case
	  REQ0 : begin
	    req_vld = 3'b100;
	  end
	  MAPD : begin
	    nxt_vld = 1'b1;
	  end
	  DONE : begin
	    rsp_vld = 1'b1;
	  end
	  default : begin
	    nxt_vld = 0;
	  end
	endcase
      end	
      DONE : begin
	nxt_sel = ~wrt;
	sel_out = 2'b01;
      end
      RSP0 : begin
	nxt_sel = sel;
	sel_out = {sel, 1'b0};
      end
      RSP1 : begin
	sel_out = {sel, sel};
      end
    endcase      
  end

// response command
  assign new_cmnd[2] = csrbus_done | csrbus_acc_vio;
  assign new_cmnd[1] = csrbus_acc_vio;
  assign new_cmnd[0] = wrt;

// response address
  always @ (rsp_cmnd or srcb or addr) begin
    rsp_addr = 0;
    rsp_addr[`FIRE_CSR_RING_CMND_BITS] = rsp_cmnd;
    rsp_addr[`FIRE_CSR_RING_SRCB_BITS] = srcb;
    rsp_addr[`FIRE_CSR_RING_ADDR_BITS] = addr;
  end

// next csr ring out
  always @ (sel_out or csr_ring_in or rsp_addr or rsp_data) begin
    case (sel_out) // synopsys infer_mux
      2'b00 : nxt_ring_out = csr_ring_in;
      2'b01 : nxt_ring_out = rsp_addr;
      2'b10 : nxt_ring_out = rsp_data[`FIRE_CSR_RDMS_BITS];
      2'b11 : nxt_ring_out = rsp_data[`FIRE_CSR_RDLS_BITS];
    endcase
  end

// csrbus outputs
  assign csrbus_addr    = addr;
  assign csrbus_wr_data = data;
  assign csrbus_src_bus = srcb;
  wire   csrbus_valid   = vld;
  wire   csrbus_wr      = wrt;
  
// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      state <= IDLE;
      sel   <= 0;
      vld   <= 0;
    end
    else begin
      state <= nxt_state;
      sel   <= nxt_sel;
      vld   <= nxt_vld;
    end
  end

  always @ (posedge clk) 
    if (!rst_l) begin 
      rsp_cmnd <= {3{1'b0}};
      rsp_data <= {64{1'b0}};
    end
	else begin
    if (rsp_vld) begin
      rsp_cmnd <= new_cmnd;
      rsp_data <= csrbus_read_data;
    end
  end

  always @ (posedge clk) 
    if (!rst_l) begin 
      addr <= {27{1'b0}};
      wrt  <= {{1'b0}};
      srcb <= {2{1'b0}};
    end
	else begin
    if (req_vld[2]) begin
      addr <= csr_ring_in[`FIRE_CSR_RING_ADDR_BITS];
      wrt  <= csr_ring_in[`FIRE_CSR_RING_WRIT_BITS];
      srcb <= csr_ring_in[`FIRE_CSR_RING_SRCB_BITS];
    end
  end
  
  always @ (posedge clk) 
    if (!rst_l) begin 
    		 data[`FIRE_CSR_RDMS_BITS] <= {32{1'b0}};
    end
	else begin
    if (req_vld[1]) data[`FIRE_CSR_RDMS_BITS] <= csr_ring_in;
  end

  always @ (posedge clk) 
    if (!rst_l) begin 
     		data[`FIRE_CSR_RDLS_BITS] <= {32{1'b0}};
    end
	else begin
    if (req_vld[0]) data[`FIRE_CSR_RDLS_BITS] <= csr_ring_in;
  end

  always @ (posedge clk) 
    if (!rst_l) begin 
    csr_ring_out <= {32{1'b0}};
     end
	else begin
    csr_ring_out <= nxt_ring_out;
  end

endmodule // pcie_common_dcc
