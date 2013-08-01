// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_dbg.v
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
module dmu_cmu_dbg (
		 clk, 	
		 rst_l,

        // CMU 					 
		cr2cm_dbg_sel_a,	   // CMU debug select a
		cr2cm_dbg_sel_b,	   // CMU debug select b
		cm2cr_dbg_a,   // CMU debug output a
		cm2cr_dbg_b,   // CMU debug output b

        // RCM
		dbg2rcm_dbg_sel_a,  // RCM debug select a
		dbg2rcm_dbg_sel_b,  // RCM debug select b
		rcm2dbg_dbg_a, // RCM debug output a
		rcm2dbg_dbg_b, // RCM debug output b

        // TCM
		dbg2tcm_dbg_sel_a,  // TCM debug select a
		dbg2tcm_dbg_sel_b,  // TCM debug select b
		tcm2dbg_dbg_a, // TCM debug output a
		tcm2dbg_dbg_b, // TCM debug output b

		// CTX
		dbg2ctx_dbg_sel_a,  // CTX debug select a
		dbg2ctx_dbg_sel_b,  // CTX debug select b
		ctx2dbg_dbg_a, // CTX debug output a
		ctx2dbg_dbg_b  // CTX debug output b
		);
     
//************************************************
//				PARAMETERS
//************************************************



//************************************************
//				PORTS
//************************************************

   input clk;                                   // The input clock
   input rst_l;                                 // synopsys sync_set_reset "rst_l"

// Debug
   input [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_a;	// CMU debug select a
   input [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_b;	// CMU debug select b
   output [`FIRE_DBG_DATA_BITS] cm2cr_dbg_a;    // CMU debug output a	
   output [`FIRE_DBG_DATA_BITS] cm2cr_dbg_b;    // CMU debug output b

// RCM debug   
   output [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_a;
   output [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_b;
   input [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_a;
   input [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_b;

// TCM debug
   output [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_a;
   output [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_b;
   input [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_a;
   input [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_b;
   
// CTX debug
   output [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_a;
   output [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_b;
   input [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_a;
   input [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_b;

//************************************************
//				SIGNALS
//************************************************
 
   wire clk;
   wire rst_l;

// Debug
   wire [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_a;	   // CMU debug select a
   wire [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_b;	   // CMU debug select b
   wire [`FIRE_DBG_DATA_BITS] cm2cr_dbg_a;     // CMU debug output a	
   wire [`FIRE_DBG_DATA_BITS] cm2cr_dbg_b;     // CMU debug output b

// RCM debug   
   wire [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_a;
   wire [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_b;

// TCM debug
   wire [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_a;
   wire [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_b;
   
// CTX debug
   wire [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_a;
   wire [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_b;
   
// *************** Local Declarations *************************************
  reg  [`FIRE_DBG_DATA_BITS]		dbg_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]		nxt_dbg_bus [0:1];

  integer	  			i;
   
//************************************************
// Zero In checkers
//************************************************


// *************** Procedures *************************************


// ********************** signal registers *************************/

  always @ (cr2cm_dbg_sel_a or rcm2dbg_dbg_a 
            or tcm2dbg_dbg_a or ctx2dbg_dbg_a ) 
    begin
	   case (cr2cm_dbg_sel_a[5:3]) // synopsys infer_mux
		 3'b000: nxt_dbg_bus[0] = rcm2dbg_dbg_a;
		 3'b001: nxt_dbg_bus[0] = tcm2dbg_dbg_a;
		 3'b010: nxt_dbg_bus[0] = ctx2dbg_dbg_a;
		 3'b011: nxt_dbg_bus[0] = 8'h00;
		 3'b100: nxt_dbg_bus[0] = 8'h00;
		 3'b101: nxt_dbg_bus[0] = 8'h00;
		 3'b110: nxt_dbg_bus[0] = 8'h00;
		 3'b111: nxt_dbg_bus[0] = 8'h00;
	   endcase // case(cr2cm_dbg_sel_a[5:3])
	end // always @ (cr2cm_dbg_sel_a or dbg2rcm_dbg_a...

  always @ (cr2cm_dbg_sel_b or rcm2dbg_dbg_b 
            or tcm2dbg_dbg_b or ctx2dbg_dbg_b ) 
    begin
	   case (cr2cm_dbg_sel_b[5:3]) // synopsys infer_mux
		 3'b000: nxt_dbg_bus[1] = rcm2dbg_dbg_b;
		 3'b001: nxt_dbg_bus[1] = tcm2dbg_dbg_b;
		 3'b010: nxt_dbg_bus[1] = ctx2dbg_dbg_b;
		 3'b011: nxt_dbg_bus[1] = 8'h00;
		 3'b100: nxt_dbg_bus[1] = 8'h00;
		 3'b101: nxt_dbg_bus[1] = 8'h00;
		 3'b110: nxt_dbg_bus[1] = 8'h00;
		 3'b111: nxt_dbg_bus[1] = 8'h00;
	   endcase // case(cr2cm_dbg_sel_b[5:3])
	end // always @ (cr2cm_dbg_sel_b or dbg2rcm_dbg_b...
   
// ********************** Output Procedures ***********************/

always @ (posedge clk) begin
   if(rst_l == 1'b0) begin
    for (i = 0; i < 2; i = i + 1) begin
      dbg_bus[i] <= 8'h00;
    end
   end
   else begin
	  for (i = 0; i < 2; i = i + 1) begin
		 dbg_bus[i] <= nxt_dbg_bus[i];
	  end
   end
end // always @ (posedge clk)
	  
   
// ***********************Assignments *****************************/
   
// debug select abd data port distribution
  assign dbg2rcm_dbg_sel_a = cr2cm_dbg_sel_a [`FIRE_DLC_CMU_RCM_DS_BITS];
  assign dbg2rcm_dbg_sel_b = cr2cm_dbg_sel_b [`FIRE_DLC_CMU_RCM_DS_BITS];
  assign dbg2tcm_dbg_sel_a = cr2cm_dbg_sel_a [`FIRE_DLC_CMU_TCM_DS_BITS];
  assign dbg2tcm_dbg_sel_b = cr2cm_dbg_sel_b [`FIRE_DLC_CMU_TCM_DS_BITS];
  assign dbg2ctx_dbg_sel_a = cr2cm_dbg_sel_a [`FIRE_DLC_CMU_CTX_DS_BITS];
  assign dbg2ctx_dbg_sel_b = cr2cm_dbg_sel_b [`FIRE_DLC_CMU_CTX_DS_BITS];

// Output
  assign cm2cr_dbg_a = dbg_bus[0];
  assign cm2cr_dbg_b = dbg_bus[1];
   
endmodule 
