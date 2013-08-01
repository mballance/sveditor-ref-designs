// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_dbg.v
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
module dmu_rmu_dbg (

		// Clock 

		clk,
		rst_l,
		  
		// Block Level Selects and Output Ports     

		cr2rm_dbg_sel_a,
   		cr2rm_dbg_sel_b,
		
   		rm2cr_dbg_a,
   		rm2cr_dbg_b,
		
		// Sub Block Selects and Output Ports
		
	    	//    RRM sub block
		dbg2rrm_dbg_sel_a,
		dbg2rrm_dbg_sel_b,

		rrm2dbg_dbg_a,
		rrm2dbg_dbg_b,

		//    LRM sub block
		dbg2lrm_dbg_sel_a,
		dbg2lrm_dbg_sel_b,

		lrm2dbg_dbg_a,
		lrm2dbg_dbg_b
		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################


  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 	clk;
  input 	rst_l;

  //------------------------------------------------------------------------
  //  Block Level Selects and Output Ports     
  //------------------------------------------------------------------------

  input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2rm_dbg_sel_a;	// 6 bit select
  input  [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2rm_dbg_sel_b;	// 6 bit select
  
  output [`FIRE_DEBUG_WDTH-1:0]	      		rm2cr_dbg_a;		// 8 bit debug port
  output [`FIRE_DEBUG_WDTH-1:0]			rm2cr_dbg_b;		// 8 bit debug port
   
   
  //------------------------------------------------------------------------
  //  Sub Block Level Selects and Output Ports
  //------------------------------------------------------------------------

  output [2:0] 					dbg2rrm_dbg_sel_a;	// 3 bit selects
  output [2:0] 					dbg2rrm_dbg_sel_b;	// 3 bit selects
  
  input  [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_a;		// 8 bit debug port
  input  [`FIRE_DEBUG_WDTH-1:0]			rrm2dbg_dbg_b;		// 8 bit debug port

  output [2:0] 					dbg2lrm_dbg_sel_a;	// 3 bit selects
  output [2:0] 					dbg2lrm_dbg_sel_b;	// 3 bit selects

  input  [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_a;		// 8 bit debug port
  input  [`FIRE_DEBUG_WDTH-1:0]			lrm2dbg_dbg_b;		// 8 bit debug port


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  //**************************************************
  // Wires 
  //**************************************************

   
  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************
  reg  [`FIRE_DEBUG_WDTH-1:0]			next_rm2cr_dbg_a;
  reg  [`FIRE_DEBUG_WDTH-1:0]			next_rm2cr_dbg_b;

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg  [`FIRE_DEBUG_WDTH-1:0]			rm2cr_dbg_a;
  reg  [`FIRE_DEBUG_WDTH-1:0]			rm2cr_dbg_b;


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		               COMBINATIONAL LOGIC 
//############################################################################   

  // RRM sub-block selects (3 bit selects)
  assign dbg2rrm_dbg_sel_a = cr2rm_dbg_sel_a[2:0];
  assign dbg2rrm_dbg_sel_b = cr2rm_dbg_sel_b[2:0];

  // LRM sub-block select (3 bit selects)
  assign dbg2lrm_dbg_sel_a = cr2rm_dbg_sel_a[2:0];
  assign dbg2lrm_dbg_sel_b = cr2rm_dbg_sel_b[2:0];

  // Debug Port A

  always @ (cr2rm_dbg_sel_a or rrm2dbg_dbg_a or lrm2dbg_dbg_a ) 
    begin
      case (cr2rm_dbg_sel_a[5:3]) // synopsys infer_mux
        3'b000: next_rm2cr_dbg_a = rrm2dbg_dbg_a;
        3'b001: next_rm2cr_dbg_a = lrm2dbg_dbg_a;
        3'b010: next_rm2cr_dbg_a = 8'h0;
        3'b011: next_rm2cr_dbg_a = 8'h0;
        3'b100: next_rm2cr_dbg_a = 8'h0;
        3'b101: next_rm2cr_dbg_a = 8'h0;
        3'b110: next_rm2cr_dbg_a = 8'h0;
        3'b111: next_rm2cr_dbg_a = 8'h0;
      endcase
    end
  

  // Debug Port B
  
  always @ (cr2rm_dbg_sel_b or rrm2dbg_dbg_b or lrm2dbg_dbg_b) 
    begin
      case (cr2rm_dbg_sel_b[5:3]) // synopsys infer_mux
        3'b000: next_rm2cr_dbg_b = rrm2dbg_dbg_b;
        3'b001: next_rm2cr_dbg_b = lrm2dbg_dbg_b;
        3'b010: next_rm2cr_dbg_b = 8'h0;
        3'b011: next_rm2cr_dbg_b = 8'h0;
        3'b100: next_rm2cr_dbg_b = 8'h0;
        3'b101: next_rm2cr_dbg_b = 8'h0;
        3'b110: next_rm2cr_dbg_b = 8'h0;
        3'b111: next_rm2cr_dbg_b = 8'h0;
      endcase
  end  
 
  
//############################################################################
//		              SEQUENTIAL LOGIC 
//############################################################################   

// Registered Output Debug Ports (A and B)
	
  always @ (posedge clk)
	if(~rst_l) begin
      rm2cr_dbg_a <= {`FIRE_DEBUG_WDTH{1'b0}};
      rm2cr_dbg_b <= {`FIRE_DEBUG_WDTH{1'b0}};
	end
     else begin 
      rm2cr_dbg_a <= next_rm2cr_dbg_a;
      rm2cr_dbg_b <= next_rm2cr_dbg_b;
     end   
    

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


endmodule
