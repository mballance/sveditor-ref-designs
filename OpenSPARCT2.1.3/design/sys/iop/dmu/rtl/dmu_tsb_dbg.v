// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tsb_dbg.v
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
module dmu_tsb_dbg 
  (
   clk, 	
   rst_l,
   
   // TSB 
   cr2ts_dbg_sel_a,   // TSB debug select a
   cr2ts_dbg_sel_b,   // TSB debug select b
   
   ts2cr_dbg_a,       // TSB debug output a
   ts2cr_dbg_b,       // TSB debug output b
   
   // TTG
   dbg2ttg_dbg_sel_a, // TTG debug select a
   dbg2ttg_dbg_sel_b, // TTG debug select b
   
   ttg2dbg_dbg_a,     // TTG debug output a
   ttg2dbg_dbg_b,     // TTG debug output b
   
   // TDL
   dbg2tdl_dbg_sel_a, // TDL debug select a
   dbg2tdl_dbg_sel_b, // TDL debug select b
   
   tdl2dbg_dbg_a,     // TDL debug output a
   tdl2dbg_dbg_b,     // TDL debug output b
   
   // TIC
   dbg2tic_dbg_sel_a, // TIC debug select a
   dbg2tic_dbg_sel_b, // TIC debug select b
   
   tic2dbg_dbg_a,     // TIC debug output a
   tic2dbg_dbg_b,     // TIC debug output b
   
   // TEC
   dbg2tec_dbg_sel_a, // TEC debug select a
   dbg2tec_dbg_sel_b, // TEC debug select b
   
   tec2dbg_dbg_a,     // TEC debug output a
   tec2dbg_dbg_b      // TEC debug output b
   );
  
  // synopsys sync_set_reset "rst_l"
  
  //************************************************
  //				PORTS
  //************************************************
  
  input                                        clk;                                 
  input 				       rst_l;                               
  
  // TSB Debug
  input [5:0] 				       cr2ts_dbg_sel_a;
  input [5:0] 				       cr2ts_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS] 		       ts2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		       ts2cr_dbg_b;
  
  // TTG debug   
  input [`FIRE_DBG_DATA_BITS] 		       ttg2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       ttg2dbg_dbg_b; 	
  output [2:0] 				       dbg2ttg_dbg_sel_a;			       
  output [2:0] 				       dbg2ttg_dbg_sel_b;
  
  // TDL debug
  input [`FIRE_DBG_DATA_BITS] 		       tdl2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       tdl2dbg_dbg_b;
  output [2:0] 				       dbg2tdl_dbg_sel_a;
  output [2:0] 				       dbg2tdl_dbg_sel_b;
  
  // TIC debug
  input [`FIRE_DBG_DATA_BITS] 		       tic2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       tic2dbg_dbg_b;
  output [2:0] 				       dbg2tic_dbg_sel_a;
  output [2:0] 				       dbg2tic_dbg_sel_b;
  
  // TEC debug
  input [`FIRE_DBG_DATA_BITS] 		       tec2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       tec2dbg_dbg_b;
  output [2:0] 				       dbg2tec_dbg_sel_a;
  output [2:0] 				       dbg2tec_dbg_sel_b;
  
  
  //************************************************
  //				SIGNALS
  //************************************************
  
  // Debug Port Interface

  // TSB 
  wire [5:0] 				      cr2ts_dbg_sel_a;   // TSB debug select a
  wire [5:0] 				      cr2ts_dbg_sel_b;   // TSB debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ts2cr_dbg_a;       // TSB debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ts2cr_dbg_b;       // TSB debug output b
   
  // TTG
  wire [2:0] 				      dbg2ttg_dbg_sel_a; // TTG debug select a
  wire [2:0] 				      dbg2ttg_dbg_sel_b; // TTG debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ttg2dbg_dbg_a;     // TTG debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ttg2dbg_dbg_b;     // TTG debug output b
   
  // TDL
  wire [2:0] 				      dbg2tdl_dbg_sel_a; // TDL debug select a
  wire [2:0] 				      dbg2tdl_dbg_sel_b; // TDL debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tdl2dbg_dbg_a;     // TDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tdl2dbg_dbg_b;     // TDL debug output b
   
  // TIC
  wire [2:0] 				      dbg2tic_dbg_sel_a; // TIC debug select a
  wire [2:0] 				      dbg2tic_dbg_sel_b; // TIC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tic2dbg_dbg_a;     // TIC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tic2dbg_dbg_b;     // TIC debug output b
   
  // TEC 
  wire [2:0] 				      dbg2tec_dbg_sel_a; // TEC debug select a
  wire [2:0] 				      dbg2tec_dbg_sel_b; // TEC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      tec2dbg_dbg_a;     // TEC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      tec2dbg_dbg_b;     // TEC debug output b

  // *************** Local Declarations *************************************
  reg [`FIRE_DBG_DATA_BITS] 		      dbg_bus [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		      nxt_dbg_bus [0:1];
  
  integer 				      i;
  
  //************************************************
  // Zero In checkers
  //************************************************
  
  
  // *************** Procedures *************************************
  
  // ********************** signal registers *************************/
  
  always @ (cr2ts_dbg_sel_a or ttg2dbg_dbg_a or tdl2dbg_dbg_a 
            or tic2dbg_dbg_a  or tec2dbg_dbg_a) 
    begin
      case (cr2ts_dbg_sel_a[5:3]) // synopsys infer_mux
	3'b000: nxt_dbg_bus[0] = ttg2dbg_dbg_a;
	3'b001: nxt_dbg_bus[0] = tdl2dbg_dbg_a;
	3'b010: nxt_dbg_bus[0] = tic2dbg_dbg_a;
	3'b011: nxt_dbg_bus[0] = tec2dbg_dbg_a;
	3'b100: nxt_dbg_bus[0] = 8'h00;
	3'b101: nxt_dbg_bus[0] = 8'h00;
	3'b110: nxt_dbg_bus[0] = 8'h00;
	3'b111: nxt_dbg_bus[0] = 8'h00;
      endcase // case(cr2ts_dbg_sel_a[5:3])
    end // always @ (cr2ts_dbg_sel_a or ttg2dbg_dbg_a or tdl2dbg_dbg_a...
  
  always @ (cr2ts_dbg_sel_b or ttg2dbg_dbg_b or tdl2dbg_dbg_b 
            or tic2dbg_dbg_b or tec2dbg_dbg_b ) 
    begin
      case (cr2ts_dbg_sel_b[5:3]) // synopsys infer_mux
	3'b000: nxt_dbg_bus[1] = ttg2dbg_dbg_b;
	3'b001: nxt_dbg_bus[1] = tdl2dbg_dbg_b;
	3'b010: nxt_dbg_bus[1] = tic2dbg_dbg_b;
	3'b011: nxt_dbg_bus[1] = tec2dbg_dbg_b;
	3'b100: nxt_dbg_bus[1] = 8'h00;
	3'b101: nxt_dbg_bus[1] = 8'h00;
	3'b110: nxt_dbg_bus[1] = 8'h00;
	3'b111: nxt_dbg_bus[1] = 8'h00;
      endcase // case(cr2ts_dbg_sel_b[5:3])
    end // always @ (cr2ts_dbg_sel_b or ttg2dbg_dbg_b or tdl2dbg_dbg_b...
  
  // ********************** Output Procedures ***********************/
  
  always @ (posedge clk)
    begin 
      if(~rst_l) 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= 8'h00;
      else 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= nxt_dbg_bus[i];
    end // always @ (posedge clk)
  
  
  // ***********************Assignments *****************************/
  
  // debug select ab data port distribution
  assign dbg2ttg_dbg_sel_a = cr2ts_dbg_sel_a [2:0];
  assign dbg2ttg_dbg_sel_b = cr2ts_dbg_sel_b [2:0];
  assign dbg2tdl_dbg_sel_a = cr2ts_dbg_sel_a [2:0];
  assign dbg2tdl_dbg_sel_b = cr2ts_dbg_sel_b [2:0];
  assign dbg2tic_dbg_sel_a = cr2ts_dbg_sel_a [2:0];
  assign dbg2tic_dbg_sel_b = cr2ts_dbg_sel_b [2:0];
  assign dbg2tec_dbg_sel_a = cr2ts_dbg_sel_a [2:0];
  assign dbg2tec_dbg_sel_b = cr2ts_dbg_sel_b [2:0];
  
  // Output
  assign ts2cr_dbg_a = dbg_bus[0];
  assign ts2cr_dbg_b = dbg_bus[1];
  
endmodule // dmu_tsb_dbg

