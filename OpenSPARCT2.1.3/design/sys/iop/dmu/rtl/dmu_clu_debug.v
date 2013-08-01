// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_debug.v
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
module dmu_clu_debug 
  (
   // clock
   clk,
   rst_l,
   
   // cru : debug ports
   cl2cr_dbg_a,
   cl2cr_dbg_b,
   cr2cl_dbg_sel_a,
   cr2cl_dbg_sel_b,
   
   // ctm : debug ports
   ctm_dbg0_bus_a,
   ctm_dbg0_bus_b,
   ctm_dbg1_bus_a,
   ctm_dbg1_bus_b,
   
   // crm : debug ports
   crm_dbg0_bus_a,
   crm_dbg0_bus_b,
   crm_dbg1_bus_a,
   crm_dbg1_bus_b
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock Signal
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // CSR Interface
  // --------------------------------------------------------
  
  // ----- Debug Ports -----
  output [`FIRE_DBG_DATA_BITS] cl2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] cl2cr_dbg_b;
  input [2:0] 		       cr2cl_dbg_sel_a;
  input [2:0] 		       cr2cl_dbg_sel_b;
  
  // --------------------------------------------------------
  // Debug Ports Sub-block Interface
  // --------------------------------------------------------
  
  // debug: debug ports
  input [`FIRE_DBG_DATA_BITS]  ctm_dbg0_bus_a;
  input [`FIRE_DBG_DATA_BITS]  ctm_dbg0_bus_b;
  input [`FIRE_DBG_DATA_BITS]  ctm_dbg1_bus_a;
  input [`FIRE_DBG_DATA_BITS]  ctm_dbg1_bus_b;
  input [`FIRE_DBG_DATA_BITS]  crm_dbg0_bus_a;
  input [`FIRE_DBG_DATA_BITS]  crm_dbg0_bus_b;
  input [`FIRE_DBG_DATA_BITS]  crm_dbg1_bus_a;
  input [`FIRE_DBG_DATA_BITS]  crm_dbg1_bus_b;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [`FIRE_DBG_DATA_BITS]    cl2cr_dbg_a;
  reg [`FIRE_DBG_DATA_BITS]    cl2cr_dbg_b;
  
  // ********** Non-Flops ******
  
  reg [`FIRE_DBG_DATA_BITS]    nxt_dbg_bus_a;
  reg [`FIRE_DBG_DATA_BITS]    nxt_dbg_bus_b;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Debug Port Block Level Logic
  // --------------------------------------------------------
  
  // ----- sub-block debug bus select -----
  
  // debug_bus_a sub-block select
  always @(cr2cl_dbg_sel_a or ctm_dbg0_bus_a or ctm_dbg1_bus_a or
           crm_dbg0_bus_a or crm_dbg1_bus_a)
    begin
      case (cr2cl_dbg_sel_a) // synopsys infer_mux
	3'b000: nxt_dbg_bus_a = ctm_dbg0_bus_a;
	3'b001: nxt_dbg_bus_a = ctm_dbg1_bus_a;
	3'b010: nxt_dbg_bus_a = crm_dbg0_bus_a;
	3'b011: nxt_dbg_bus_a = crm_dbg1_bus_a;
	3'b100: nxt_dbg_bus_a = 8'h0;
	3'b101: nxt_dbg_bus_a = 8'h0;
	3'b110: nxt_dbg_bus_a = 8'h0;
	3'b111: nxt_dbg_bus_a = 8'h0;
      endcase
    end
  
  // debug_bus_b sub-block select
  always @(cr2cl_dbg_sel_b or ctm_dbg0_bus_b or ctm_dbg1_bus_b or
           crm_dbg0_bus_b or crm_dbg1_bus_b)
    begin
      case (cr2cl_dbg_sel_b) // synopsys infer_mux
	3'b000: nxt_dbg_bus_b = ctm_dbg0_bus_b;
	3'b001: nxt_dbg_bus_b = ctm_dbg1_bus_b;
	3'b010: nxt_dbg_bus_b = crm_dbg0_bus_b;
	3'b011: nxt_dbg_bus_b = crm_dbg1_bus_b;
	3'b100: nxt_dbg_bus_b = 8'h0;
	3'b101: nxt_dbg_bus_b = 8'h0;
	3'b110: nxt_dbg_bus_b = 8'h0;
	3'b111: nxt_dbg_bus_b = 8'h0;
      endcase
    end
  
  // register debug_a/b busses
  always @(posedge clk)
    if (~rst_l) begin
      cl2cr_dbg_a <= `FIRE_DEBUG_WDTH'b0;
      cl2cr_dbg_b <= `FIRE_DEBUG_WDTH'b0;
        end
    else begin
      cl2cr_dbg_a <= nxt_dbg_bus_a;
      cl2cr_dbg_b <= nxt_dbg_bus_b;
    end
  
endmodule // dmu_clu_debug
