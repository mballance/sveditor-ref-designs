// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_psb_dbg.v
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
module dmu_psb_dbg 
  (
   clk, 	
   rst_l,
   
   // PSB 
   cr2ps_dbg_sel_a,   // PSB debug select a
   cr2ps_dbg_sel_b,   // PSB debug select b
   
   ps2cr_dbg_a,       // PSB debug output a
   ps2cr_dbg_b,       // PSB debug output b
   
   // PTG
   dbg2ptg_dbg_sel_a, // PTG debug select a
   dbg2ptg_dbg_sel_b, // PTG debug select b
   
   ptg2dbg_dbg_a,     // PTG debug output a
   ptg2dbg_dbg_b,     // PTG debug output b
   
   // PDL
   dbg2pdl_dbg_sel_a, // PDL debug select a
   dbg2pdl_dbg_sel_b, // PDL debug select b
   
   pdl2dbg_dbg_a,     // PDL debug output a
   pdl2dbg_dbg_b,     // PDL debug output b
   
   // PIC
   dbg2pic_dbg_sel_a, // PIC debug select a
   dbg2pic_dbg_sel_b, // PIC debug select b
   
   pic2dbg_dbg_a,     // PIC debug output a
   pic2dbg_dbg_b,     // PIC debug output b
   
   // PCE 
   dbg2pce_dbg_sel_a, // PCE debug select a
   dbg2pce_dbg_sel_b, // PCE debug select b
   
   pce2dbg_dbg_a,     // PCE debug output a
   pce2dbg_dbg_b      // PCE debug output b
   );
  
  // synopsys sync_set_reset "rst_l"
  
  //************************************************
  //				PORTS
  //************************************************
  
  input                                        clk;                                 
  input 				       rst_l;                               
  
  // PSB Debug
  input [5:0] 				       cr2ps_dbg_sel_a;
  input [5:0] 				       cr2ps_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS] 		       ps2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		       ps2cr_dbg_b;
  
  // PTG debug   
  input [`FIRE_DBG_DATA_BITS] 		       ptg2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       ptg2dbg_dbg_b; 	
  output [2:0] 				       dbg2ptg_dbg_sel_a;			       
  output [2:0] 				       dbg2ptg_dbg_sel_b;
  
  // PDL debug
  input [`FIRE_DBG_DATA_BITS] 		       pdl2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       pdl2dbg_dbg_b;
  output [2:0] 				       dbg2pdl_dbg_sel_a;
  output [2:0] 				       dbg2pdl_dbg_sel_b;
  
  // PIC debug
  input [`FIRE_DBG_DATA_BITS] 		       pic2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       pic2dbg_dbg_b;
  output [2:0] 				       dbg2pic_dbg_sel_a;
  output [2:0] 				       dbg2pic_dbg_sel_b;
  
  // PCE debug
  input [`FIRE_DBG_DATA_BITS] 		       pce2dbg_dbg_a;
  input [`FIRE_DBG_DATA_BITS] 		       pce2dbg_dbg_b;
  output [2:0] 				       dbg2pce_dbg_sel_a;
  output [2:0] 				       dbg2pce_dbg_sel_b;
  
  
  //************************************************
  //				SIGNALS
  //************************************************
  
  // Debug Port Interface

  // PSB 
  wire [5:0] 				      cr2ps_dbg_sel_a;   // PSB debug select a
  wire [5:0] 				      cr2ps_dbg_sel_b;   // PSB debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_a;       // PSB debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ps2cr_dbg_b;       // PSB debug output b
   
  // PTG
  wire [2:0] 				      dbg2ptg_dbg_sel_a; // PTG debug select a
  wire [2:0] 				      dbg2ptg_dbg_sel_b; // PTG debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      ptg2dbg_dbg_a;     // PTG debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      ptg2dbg_dbg_b;     // PTG debug output b
   
  // PDL
  wire [2:0] 				      dbg2pdl_dbg_sel_a; // PDL debug select a
  wire [2:0] 				      dbg2pdl_dbg_sel_b; // PDL debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pdl2dbg_dbg_a;     // PDL debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pdl2dbg_dbg_b;     // PDL debug output b
   
  // PIC
  wire [2:0] 				      dbg2pic_dbg_sel_a; // PIC debug select a
  wire [2:0] 				      dbg2pic_dbg_sel_b; // PIC debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pic2dbg_dbg_a;     // PIC debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pic2dbg_dbg_b;     // PIC debug output b
   
  // PCE 
  wire [2:0] 				      dbg2pce_dbg_sel_a; // PCE debug select a
  wire [2:0] 				      dbg2pce_dbg_sel_b; // PCE debug select b
   
  wire [`FIRE_DBG_DATA_BITS] 		      pce2dbg_dbg_a;     // PCE debug output a
  wire [`FIRE_DBG_DATA_BITS] 		      pce2dbg_dbg_b;     // PCE debug output b

  // *************** Local Declarations *************************************
  reg [`FIRE_DBG_DATA_BITS] 		      dbg_bus [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		      nxt_dbg_bus [0:1];
  
  integer 				      i;
  
  //************************************************
  // Zero In checkers
  //************************************************
  
  
  // *************** Procedures *************************************
  
  // ********************** signal registers *************************/
  
  always @ (cr2ps_dbg_sel_a or ptg2dbg_dbg_a or pdl2dbg_dbg_a 
            or pic2dbg_dbg_a  or pce2dbg_dbg_a) 
    begin
      case (cr2ps_dbg_sel_a[5:3]) // synopsys infer_mux
	3'b000: nxt_dbg_bus[0] = ptg2dbg_dbg_a;
	3'b001: nxt_dbg_bus[0] = pdl2dbg_dbg_a;
	3'b010: nxt_dbg_bus[0] = pic2dbg_dbg_a;
	3'b011: nxt_dbg_bus[0] = pce2dbg_dbg_a;
	3'b100: nxt_dbg_bus[0] = 8'h00;
	3'b101: nxt_dbg_bus[0] = 8'h00;
	3'b110: nxt_dbg_bus[0] = 8'h00;
	3'b111: nxt_dbg_bus[0] = 8'h00;
      endcase // case(cr2ps_dbg_sel_a[5:3])
    end // always @ (cr2ps_dbg_sel_a or ptg2dbg_dbg_a or pdl2dbg_dbg_a...
  
  always @ (cr2ps_dbg_sel_b or ptg2dbg_dbg_b or pdl2dbg_dbg_b 
            or pic2dbg_dbg_b or pce2dbg_dbg_b ) 
    begin
      case (cr2ps_dbg_sel_b[5:3]) // synopsys infer_mux
	3'b000: nxt_dbg_bus[1] = ptg2dbg_dbg_b;
	3'b001: nxt_dbg_bus[1] = pdl2dbg_dbg_b;
	3'b010: nxt_dbg_bus[1] = pic2dbg_dbg_b;
	3'b011: nxt_dbg_bus[1] = pce2dbg_dbg_b;
	3'b100: nxt_dbg_bus[1] = 8'h00;
	3'b101: nxt_dbg_bus[1] = 8'h00;
	3'b110: nxt_dbg_bus[1] = 8'h00;
	3'b111: nxt_dbg_bus[1] = 8'h00;
      endcase // case(cr2ps_dbg_sel_b[5:3])
    end // always @ (cr2ps_dbg_sel_b or ptg2dbg_dbg_b or pdl2dbg_dbg_b...
  
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
  assign dbg2ptg_dbg_sel_a = cr2ps_dbg_sel_a [2:0];
  assign dbg2ptg_dbg_sel_b = cr2ps_dbg_sel_b [2:0];
  assign dbg2pdl_dbg_sel_a = cr2ps_dbg_sel_a [2:0];
  assign dbg2pdl_dbg_sel_b = cr2ps_dbg_sel_b [2:0];
  assign dbg2pic_dbg_sel_a = cr2ps_dbg_sel_a [2:0];
  assign dbg2pic_dbg_sel_b = cr2ps_dbg_sel_b [2:0];
  assign dbg2pce_dbg_sel_a = cr2ps_dbg_sel_a [2:0];
  assign dbg2pce_dbg_sel_b = cr2ps_dbg_sel_b [2:0];
  
  // Output
  assign ps2cr_dbg_a = dbg_bus[0];
  assign ps2cr_dbg_b = dbg_bus[1];
  
endmodule // dmu_psb_dbg

