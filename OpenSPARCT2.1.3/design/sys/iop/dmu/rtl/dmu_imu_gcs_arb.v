// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs_arb.v
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
module dmu_imu_gcs_arb (

		// Clock and Reset 

		clk, 
		rst_l,
	
		// Group 0 Req/Gnt Interface 
		
		gc_0_req,
		gc_0_ino,
		gc_0_gnt,
		
		// Group 1 Req/Gnt Interface 

		gc_1_req,
		gc_1_ino,
		gc_1_gnt,
		
		// Group 2 Req/Gnt Interface 

		gc_2_req,
		gc_2_ino,
		gc_2_gnt,
		
		// Group 3 Req/Gnt Interface 

		gc_3_req,
		gc_3_ino,
		gc_3_gnt,

		// Next Arbitration Interface

              	next_arb, 
		
		// CSM Interface

              	gc_arb_valid, 
              	gc_arb_ino,
              	gc_arb_id
		
		);
		



//############################################################################
//				PORT DECLARATIONS
//############################################################################
 
  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  
  input         clk; 
  input         rst_l; 
  
  //------------------------------------------------------------------------
  // Requests and ack interface to/from the group controllers 
  //------------------------------------------------------------------------
 
  input        gc_0_req;            // Request Signal from the group controller 
  input [5:0]  gc_0_ino;            // INO for the corresponding request from the group controller 
  output       gc_0_gnt;            // grant signal for req for the group controller

  input        gc_1_req;            // Request Signal from the group controller 
  input [5:0]  gc_1_ino;            // INO for the corresponding request from the group controller 
  output       gc_1_gnt;            // grant signal for req for the group controller

  input        gc_2_req;            // Request Signal from the group controller 
  input [5:0]  gc_2_ino;            // INO for the corresponding request from the group controller 
  output       gc_2_gnt;            // grant signal for req for the group controller

  input        gc_3_req;            // Request Signal from the group controller 
  input [5:0]  gc_3_ino;            // INO for the corresponding request from the group controller 
  output       gc_3_gnt;            // grant signal for req for the group controller

  //------------------------------------------------------------------------
  // Signal to do the next arbitration 
  //------------------------------------------------------------------------
  
  input        next_arb;            // Signal from Central GC FSM to do next arb

  //------------------------------------------------------------------------
  // Interface to the csm with the arbitration winner 
  //------------------------------------------------------------------------
  
  output       gc_arb_valid;        // Valid signal saying that the arb winner is now valid are ready to be taken 
  output [5:0] gc_arb_ino;          // The ino of winner from arbitration; 
  output [1:0] gc_arb_id;           // ID of the group controller of the arb winner


//############################################################################
//				PARAMETERS
//############################################################################		
parameter IDLE    =   2'b00;
parameter ARB_GNT =   2'b01;
parameter W_4_CSM =   2'b10;



//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################  
  
  //------------------------
  //  Wires 
  //------------------------
   wire arb_needed; 

  //-------------------------
  // Regs that are NOT flops
  //-------------------------
  reg [1:0] arb_winner; 
  reg [1:0] n_state;
  reg [1:0] n_arb_winner;
  reg [5:0] gc_arb_ino; 

  //------------------------
  //  Regs that are flops
  //------------------------
  reg [1:0] last_arb_winner; 
  reg [1:0] state;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
  //---------------------------------------------------------------------
  // Arbiter Checker 
  //--------------------------------------------------------------------- 
    /* 0in arbiter -req gc_0_req gc_1_req gc_2_req gc_3_req
                   -gnt gc_0_gnt gc_1_gnt gc_2_gnt gc_3_gnt
		   -fair 
		   -round_robin 
		   -known_grant 
		   -req_until_gnt
   	           -max_grant 1
		   -deassert 0
                   -no_simultaneous_req_gnt

    */

  //---------------------------------------------------------------------
  // State Machine Checkers
  //--------------------------------------------------------------------- 
    //0in state_transition  -var state -val IDLE    -next ARB_GNT
    //0in state_transition  -var state -val ARB_GNT -next W_4_CSM
    //0in state_transition  -var state -val W_4_CSM -next ARB_GNT IDLE
    
  
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################    


//-------------------------------------------------------------------
//  Signal to tell gc central FSM if there is a request pending   
//  and if arbitration is then needed 
// 
// It is an OR of all 4 of the request Signals
//-------------------------------------------------------------------
assign arb_needed = (gc_0_req | gc_1_req | gc_2_req |gc_3_req);
 

//-------------------------------------------------------------------
//  Logic to figure out the who the next arbitration winner is   
//  it is based on the last person who one and what the current
//  req's are. Look first at the last winner then the current reqs
//
//  For example for a last winner of 01 the proper order would then be
//               10     2 
//               11     3
//               00     0
//               01     1 (parked)
// 
//   For the first term, is only set when 2 or 3 is requesting
//   For the secoond term if 2 is not requesting  and 3 or 0 is 
//-------------------------------------------------------------------

 always @ (gc_0_req or gc_1_req or gc_2_req or gc_3_req or last_arb_winner)
  case (last_arb_winner) // synopsys parallel_case full_case infer_mux
    2'b00 : arb_winner = {(~gc_1_req&(gc_2_req|gc_3_req))   ,(gc_1_req|(~gc_2_req&gc_3_req))};
    2'b01 : arb_winner = {(gc_2_req|gc_3_req)               ,(~gc_2_req&(gc_3_req|~gc_0_req))};
    2'b10 : arb_winner = {(gc_3_req|~(gc_0_req|gc_1_req))   ,(gc_3_req|(~gc_0_req&gc_1_req))};
    2'b11 : arb_winner = {~(gc_0_req|gc_1_req)              ,~(gc_0_req|(~gc_1_req&gc_2_req))};
  endcase

//-------------------------------------------------------------------
//  Logic to figure out which grant needs to be asserted
//    - Only assert the GNT when in ARB_GRT state 
//-------------------------------------------------------------------

assign  gc_0_gnt = (state == ARB_GNT) &  (last_arb_winner == 2'b00); 
assign  gc_1_gnt = (state == ARB_GNT) &  (last_arb_winner == 2'b01); 
assign  gc_2_gnt = (state == ARB_GNT) &  (last_arb_winner == 2'b10); 
assign  gc_3_gnt = (state == ARB_GNT) &  (last_arb_winner == 2'b11); 

//-------------------------------------------------------------------
//  Logic for output to CSM 
//     - Only assert valid in W_4_CSM state  
//     - Mux the correct ino from the granted gc to the CSM 
//     - Assign the id to the grated gc 
//-------------------------------------------------------------------
assign gc_arb_valid = (state == W_4_CSM); 


always @ (gc_0_ino or gc_1_ino or gc_2_ino or gc_3_ino or last_arb_winner)
  case (last_arb_winner) // synopsys parallel_case full_case infer_mux
    2'b00 : gc_arb_ino = gc_0_ino;
    2'b01 : gc_arb_ino = gc_1_ino;
    2'b10 : gc_arb_ino = gc_2_ino;
    2'b11 : gc_arb_ino = gc_3_ino;
  endcase


assign gc_arb_id = last_arb_winner;   


//############################################################################
//		    		SEQUENTIAL LOGIC 
//############################################################################    

//-----------------------------------------------------------------------
// Next State Logic, Assign next state to current state 
//----------------------------------------------------------------------- 
  always @(posedge clk)
    begin
      if (~rst_l)
        begin
	  state <=  IDLE;
	end
      else
        begin
	 state  <=  n_state;
	end 
    end
  
//-----------------------------------------------------------------------
// Next arbitration winner logic 
//-----------------------------------------------------------------------  

always @(posedge clk)
    begin
      if (~rst_l)
	last_arb_winner <=  2'b11;        // Reset to 11 so that the next arb winner will be zero if not it will be 1 
      else
	last_arb_winner <=  n_arb_winner;
    end

//-----------------------------------------------------------------------
// FSM Combination Logic 
//-----------------------------------------------------------------------   
  
  always @(state or arb_winner or arb_needed or last_arb_winner or next_arb)
    begin 
    
      case (state)   // synopsys parallel_case 
          
          //********************************************************
	  //
	  //  IDLE STATE
	  //
	  //	- Wait here until the arbiter has a request 
	  //		- Do not update the last winner 
	  //
	  //    -If it has a request which needs servicing use the arb 
	  //     winner as the one to req for
	  //		- Update the next winner 
	  //   		- By doing this we register the winner and 
	  //		  use that value for the rest of the 
	  //		  calculations (last_arb_winner)
	  //		
	  //
          //********************************************************
	  IDLE: 
		begin
		  if (arb_needed)        			// If there is at least group controller thats needs servicing
		    begin
		      n_state =   ARB_GNT;
		      n_arb_winner =   arb_winner; 
		    end
		  else                    			// If there no group controllers that need servicing
		    begin
		      n_state = IDLE;
		      n_arb_winner =  last_arb_winner;
		    end
		end
		
		
	  //********************************************************
	  //
	  //  ARB_GNT STATE
	  //
	  //	- This state is used to grant the winner of the 
	  //      arbitaration
	  //	  
	  //		- Do not update the last winner 

	  //
          //********************************************************	
		
	  ARB_GNT:
		begin
		  n_state =  W_4_CSM;                  	// Grant the bus winner 
		  n_arb_winner =  last_arb_winner;
		end
		
		
	 //********************************************************
	  //
	  //  W_4_CSM STATE
	  //
	  //	- This state is used to wait, until the CSM is done 
	  //      and is ready to handle the next request
	  //
	  //    - When the CSM replys, need to check if we have more 
	  //      requests that need processing. 
	  //		- If yes 
	  //			- see if we have any more reqs waiting
	  //			- if yes ARB again and update last winner
	  //			- if no go to IDLE, no update
	  //
          //********************************************************		
		
		
	  W_4_CSM:
		begin
		  if (next_arb)                         	// Get signal from CSM to go and do next arb  
		    begin 
		     
		     if (arb_needed)				// more requests waiting 
		       begin
		         n_state =  ARB_GNT;
		         n_arb_winner =  arb_winner;
		       end
		     
		     else 					// No more requests waiting 
		       begin
		         n_state =  IDLE;
		         n_arb_winner =  last_arb_winner;			 
		       end
		     end   
		     
		  else						// NO reply yet, the CSM is Busy 
		     begin   
		       n_state =  W_4_CSM ;
		       n_arb_winner =  last_arb_winner;
		     end
		end 
	//********************************************************
    	//
    	//  DEFAULT STATE
    	//    
    	//   - Go to IDLE
    	//********************************************************		  
		  
    	default: 
    
             begin
	    	n_state = IDLE; //0in < fire -message "Illegal State Reached in module fire_dlc_imu_gcs_arb.v"
		n_arb_winner =  last_arb_winner;
             end  	  	  
	
	endcase
    end 

endmodule
