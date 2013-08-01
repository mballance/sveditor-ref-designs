// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ccc_dep.v
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
module dmu_dsn_ccc_dep
  (
   clk,
   rst_l,			     

   d2j_csr_ring_in,

   dep2cdp_data,

   dep2fsm_acc_vio,
   dep2fsm_done,			     
   dep2fsm_valid
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 2'b00,
		RDMS = 2'b01,
		RDLS = 2'b10;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_CSR_RING_BITS]		d2j_csr_ring_in;

  output [`FIRE_CSR_DATA_BITS]		dep2cdp_data;

  output				dep2fsm_acc_vio;
  output				dep2fsm_done;
  output				dep2fsm_valid;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_DATA_BITS]		dep2cdp_data;
  reg					dep2fsm_acc_vio, nxt_vio;
  reg					dep2fsm_done, nxt_dne;
  reg					dep2fsm_valid, nxt_vld;

  reg [`FIRE_CSR_CMND_BITS]		cmnd;
  reg [`FIRE_CSR_DATA_BITS]		data;
  reg [1:0]				state, nxt_state;
  reg [1:0]				data_ld;
  reg					cmnd_ld;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// output data
  assign dep2cdp_data = data;

// valid command
  wire   vld_cmnd = |d2j_csr_ring_in[`FIRE_CSR_RING_CMND_BITS];

// next state  
  always @ (state or vld_cmnd) begin
	nxt_state	= 2'b00;
    case (state) // 0in case -full -parallel
      IDLE : begin
	if (vld_cmnd) nxt_state = RDMS;
	else          nxt_state = IDLE;
      end
      RDMS : nxt_state = RDLS;
      RDLS : nxt_state = IDLE;
     2'b11:  nxt_state = IDLE;
//	default:  nxt_state = 2'bxx;
    endcase
  end

// state outputs
  always @ (state or cmnd) begin
    cmnd_ld = 1'b0;
    data_ld = 2'b00;
    nxt_dne = 1'b0;
    nxt_vio = 1'b0;
    nxt_vld = 1'b0;
    case (state) 
      IDLE : begin
	cmnd_ld = 1'b1;
      end
      RDMS : begin
	data_ld = 2'b10;
      end
      RDLS : begin
	data_ld = 2'b01;
	nxt_vld = 1'b1;
	case (cmnd) // synopsys parallel_case
	  `FIRE_CSR_CMND_RRSP : begin
	    nxt_dne = 1'b1;
	    nxt_vio = 1'b0;
	  end
	  `FIRE_CSR_CMND_WRSP : begin
	    nxt_dne = 1'b1;
	    nxt_vio = 1'b0;
	  end
	  `FIRE_CSR_CMND_RERR : begin
	    nxt_dne = 1'b1;
	    nxt_vio = 1'b1;
	  end
	  `FIRE_CSR_CMND_WERR : begin
	    nxt_dne = 1'b1;
	    nxt_vio = 1'b1;
	  end
	  default : begin
	    nxt_dne = 1'b0;
	    nxt_vio = 1'b0;
	  end
	endcase
      end
	2'b11:	begin
//	default:	begin
			nxt_vld = 1'b0;		//0in < fire  -message " got x's in dsn_ccc_dep"
			data_ld = 2'b00;	
			end
    endcase
  end
  
// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @(posedge clk ) begin
    if (!rst_l) begin      
      state <= IDLE;
    end
    else begin
      state <= nxt_state;                             
    end
  end
      
  always @(posedge clk ) 
    if (!rst_l) begin      
    dep2fsm_acc_vio <= 1'b0;
    dep2fsm_done    <= 1'b0;
    dep2fsm_valid   <= 1'b0;
  end
    else begin
    dep2fsm_acc_vio <= nxt_vio;
    dep2fsm_done    <= nxt_dne;
    dep2fsm_valid   <= nxt_vld;
  end

  always @(posedge clk ) 
    if (!rst_l) begin      
    cmnd 			<= 3'b0;
    data[`FIRE_CSR_RDMS_BITS] <= `FIRE_CSR_RING_WDTH'b0;
    data[`FIRE_CSR_RDLS_BITS] <= `FIRE_CSR_RING_WDTH'b0;
	end
	else begin
    if (cmnd_ld)    cmnd <= d2j_csr_ring_in[`FIRE_CSR_RING_CMND_BITS];
    if (data_ld[1]) data[`FIRE_CSR_RDMS_BITS] <= d2j_csr_ring_in;
    if (data_ld[0]) data[`FIRE_CSR_RDLS_BITS] <= d2j_csr_ring_in;
  end

endmodule // dmu_dsn_ccc_dep
