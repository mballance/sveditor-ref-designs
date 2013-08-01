// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_frr_arbiter.v
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
module pcie_common_frr_arbiter (
		
		//Clock and Reset 
		
		clk,
		rst_l,
		
		
		// Arbiter Inputs 

		current_request_vector,
		update_winner,
		
		

		// Arbiter Outputs 
		
		current_winner_vector
		 
		
		);
		

//############################################################################
//				PARAMETERS
//############################################################################		
parameter SIZE      =   64;

//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset 
  //------------------------------------------------------------------------  
  input			clk;
  input			rst_l; 


  //------------------------------------------------------------------------
  //  Arbiter Inputs 
  //------------------------------------------------------------------------  
  input [SIZE-1:0]  	current_request_vector;   	//Requests to win arbitration    
  input 	    	update_winner; 	 		//Last Winner 

  //------------------------------------------------------------------------
  //  Arbiter Outputs 
  //------------------------------------------------------------------------    
  output [SIZE-1:0]  	current_winner_vector;		// Arbiter Winner
  

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################  


//**************************************************
// Wire 
//**************************************************
  
  wire [SIZE-1:0]  current_reqeust_mask;  		// Mask for the Current request

  wire [SIZE-1:0]  unmask_high_pri_regs;  	
  wire [SIZE-1:0]  mask_high_pri_regs;  	
  wire [SIZE-1:0]  grant_masked;  	
  wire [SIZE-1:0]  grant_unmasked;  	
  wire [SIZE-1:0]  grant;  	

  wire 		   no_req_masked; 
  
//**************************************************
// Registers that Are Flops 
//**************************************************
  reg [SIZE-1:0]   arbiter_pointer; 
  reg [SIZE-1:0]   current_winner_vector; 

  
  
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################     
 
  //---------------------------------------------------------------------
  //  One Hot / Bits On Checkers  
  //---------------------------------------------------------------------
  
   //0in bits_on -var current_winner_vector -max 1

  //---------------------------------------------------------------------
  // Arbiter Checker 
  //--------------------------------------------------------------------- 
    /* 0in arbiter -req current_request_vector
                   -gnt current_winner_vector
		   -fair 
		   -round_robin 
		   -known_grant
		   -no_simultaneous_req_gnt
    */


//############################################################################
//		    		Combinational Logic  
//############################################################################     

//----------------------------------------------------------------------------
//	- Arbiter Pointer
//		- Needs to point to the location AFTER the last grant 
//		- It is a vector as follows 11111100000
//		- It is with the first 1 at the next location after 
//		  the current winner 
//
//	- So by ANDing these two vectors together you
//
//	   current = 0101      pointer = 1110 
//
//		1)   	0101
//			1110
//		       -------
//			0100    
//
//	   current = 0111      pointer = 1110 
//
//		2)   	0111
//			1110
//		       -------
//			0110    
//
//
//  This is basically a vector of all of the incomming requests which are 
//  to the LEFT or EQUAL to the Pointer
//
//----------------------------------------------------------------------------

assign current_reqeust_mask = current_request_vector & arbiter_pointer; 

//----------------------------------------------------------------------------
// Perform a Kind of Left shift Function 
//
//
//    For Case 1 
//
//		curr_req_mask = 0100
//
//		mask_high = 	xxx0
//				xx00
//				x000
//				1000
//
//    For Case 2 
//
//		curr_req_mask = 0110
//
//		mask_high = 	xxx0
//				x100
//				1100
//
// This basically creates a vector where if read from right to left the zero
// before the first 1 is the bit making the request
//
// Or creates the pointer for the next arbitration if high priorty wins 
//	
//----------------------------------------------------------------------------

assign mask_high_pri_regs[SIZE-1:1] = mask_high_pri_regs[SIZE-2:0] | current_reqeust_mask[SIZE-2:0];
assign mask_high_pri_regs[0] = 1'b0; 


//----------------------------------------------------------------------------
//  Now Find your Winner 
//
//	- Invert the high priority mask to get a vector as follows 0000001111
//		- The first 1 left to right is the one who should go. 
// 
//	- And together to get single bit winner. 
//
//----------------------------------------------------------------------------
assign grant_masked = current_reqeust_mask & ~mask_high_pri_regs; 


//----------------------------------------------------------------------------
// Perform a Kind of Left shift Function 
//
// This basically creates a vector where if read from right to left the zero
// before the first 1 is the bit making the request
//
// Or creates the pointer for the next arbitration if low priorty wins 
//	
//----------------------------------------------------------------------------

assign unmask_high_pri_regs[SIZE-1:1] = unmask_high_pri_regs[SIZE-2:0] | current_request_vector[SIZE-2:0];
assign unmask_high_pri_regs[0] = 1'b0; 


//----------------------------------------------------------------------------
//  Now Find your Winner 
//
//	- Invert the high priority mask to get a vector as follows 0000001111
//		- The first 1 left to right is the one who should go. 
// 
//	- And together to get single bit winner. 
//
//----------------------------------------------------------------------------
assign grant_unmasked = current_request_vector & ~unmask_high_pri_regs; 


//----------------------------------------------------------------------------
// Determine which of the Grants to Use.  
// 
//----------------------------------------------------------------------------


assign no_req_masked = ~(|current_reqeust_mask);

assign grant = ({SIZE{no_req_masked}} & grant_unmasked) | grant_masked; 




//############################################################################
//		    		Sequential Logic  
//############################################################################     


//----------------------------------------------------------------------------
// Flop the actual arbiter pointer when told to update  
// 
//----------------------------------------------------------------------------


always @ (posedge clk)
   begin 
      if(~rst_l)
      	  begin 
	     arbiter_pointer <= {SIZE{1'b1}};
	  end
       else if (update_winner)
          begin
	     if (|current_reqeust_mask)
	        begin
		  arbiter_pointer <= mask_high_pri_regs; 
		end
	     else
	        begin
		  arbiter_pointer <= unmask_high_pri_regs; 
		end	  
	  end
       else
          begin
              arbiter_pointer <= arbiter_pointer; 
          end
    end
    
    
//----------------------------------------------------------------------------
// Flop the actual winner  
// 
//----------------------------------------------------------------------------    
 
 always @(posedge clk)
    begin
      if (~rst_l)
	current_winner_vector <=  64'b0;

      else if (update_winner)
      	current_winner_vector <=  grant;
      else
	current_winner_vector <=  current_winner_vector;
    end
   
    	  
endmodule
