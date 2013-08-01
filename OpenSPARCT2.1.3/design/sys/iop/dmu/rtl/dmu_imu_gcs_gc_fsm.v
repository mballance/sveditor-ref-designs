// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs_gc_fsm.v
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
module dmu_imu_gcs_gc_fsm (

		// Clock and Reset 

		clk, 
		rst_l, 
		
		// Interface for Arbiter and Incomming Mondo Requests	
	
		int_req_vec,
		int_winner_vec,
		update_winner, 	
			
		// Interface for Group Controller Arbiter
				
		gcs_req,
		gcs_ino, 
		gcs_gnt, 
		
		// Interface for Mondo Reply Status 

		rss2gcs_rply,
		rss2gcs_id, 
		rss2gcs_valid, 
		
		// Interface for Interrupt Retry Timer
		
		timer_start,
		timer_done, 
			
		// Interface for Static Value for group controller 0-3	
			
		static_gc_id, 
		
		// Debug Interface
		
		fsm_dbg	


		
		);
		
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------

  input         clk; 
  input         rst_l; 
  
  //-----------------------------------------------------
  // Interface for Arbiter and Incomming Mondo Requests
  //-----------------------------------------------------

  input  [63:0]  int_req_vec;   	//Incomming Mondo Requests for 64 to 1   
  input  [63:0]  int_winner_vec;	//Incomming Mondo winner from local 64 to 1 mondo arbiter 
  output         update_winner; 	//Last mondo winner, serves as input into local mondo arbiter
  
  
  //-----------------------------------------------------
  // Interface for Group Controller Arbiter
  //-----------------------------------------------------
  
  output 	 gcs_req; 		// Request to group controller arbiter
  output [5:0]	 gcs_ino;		// INO for requesting mondo   		
  input		 gcs_gnt; 		// Acknowldge for Request signal 
  
  
  //-----------------------------------------------------
  // Interface for Mondo Reply Status 
  //-----------------------------------------------------
  
  input		 rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  input [1:0]	 rss2gcs_id; 		// Group controller ID for response
  input 	 rss2gcs_valid; 	// Valid signal to validate respose
  
  //-----------------------------------------------------
  // Interface for Interrupt Retry Timer
  //-----------------------------------------------------
  output 	 timer_start;		// Signal to start retry timer
  input		 timer_done; 		// SIgnal showing the retry timer is done
  
  
  //-----------------------------------------------------
  // Interface for Static Value for group controller 0-3
  //-----------------------------------------------------
  input	[1:0]	 static_gc_id; 		// Id for group controller
    
  //-----------------------------------------------------
  // Debug Interface
  //-----------------------------------------------------
		
  output  [`FIRE_DEBUG_WDTH-1:0]        fsm_dbg; 
  
  	
//############################################################################
//				PARAMETERS
//############################################################################		
parameter IDLE      =   2'b00;
parameter ARB_REQ   =   2'b01;
parameter W_4_REPLY =   2'b10;
parameter RETRY     =   2'b11;  

 
//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################   
  //------------------------
  //  Wires 
  //------------------------
  
   wire 	mondo_ack; 
   wire 	mondo_nack; 
   wire 	mondo_needed; 
  
  //-------------------------
  // Regs that are NOT flops
  //-------------------------
  reg 	[1:0] 	n_state;
 
  
  //------------------------
  //  Regs that are flops
  //------------------------
  		
   reg  [1:0]   state;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
    
  
  //---------------------------------------------------------------------
  // REQ / ACK Interface Checkers  
  //---------------------------------------------------------------------

    //0in req_ack -req gcs_req -ack gcs_gnt -req_until_ack -new_req_after_ack -max_ack 1 

  //---------------------------------------------------------------------
  // Known and Constant Checkers  
  //---------------------------------------------------------------------

    //0in known_driven -var gcs_ino -active gcs_req
    //0in constant     -var gcs_ino -active gcs_req
  
  //---------------------------------------------------------------------
  // State Machine Checkers
  //--------------------------------------------------------------------- 
    //0in state_transition  -var state -val IDLE      -next ARB_REQ
    //0in state_transition  -var state -val ARB_REQ   -next W_4_REPLY
    //0in state_transition  -var state -val W_4_REPLY -next ARB_REQ RETRY IDLE
    //0in state_transition  -var state -val RETRY     -next ARB_REQ 
   

  
//############################################################################
//		    		FUNCTION  DECLARATIONS
//############################################################################    

//----------------------------------------------------------------------
//  This function takes as an input a 64 bit vector with one bit set to
//  1 and encodes the bit number into a 6 bit binary number
//
//  For Example on a 8 bit vector
//
//    Last interrupt vector   = 00001000
//
//    Mask Vector             = 000100
//
//-----------------------------------------------------------------------
  
  function [5:0] encode;
    input [63:0] vec;

    reg [5:0] enc_vec;
    reg [6:0] i;
    
    begin 
    
      enc_vec = 6'h3f;
      
      for (i=7'd0; i<=7'd63; i=i+7'd1)
	begin 
	  if (vec[i[5:0]]) enc_vec = i[5:0];
	end 
	
      encode = enc_vec;
      
      //$display($time,": Ecoded value for vec = %0b is %0b\n",vec, enc_vec);
    end 
  endfunction
  
  
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################        
//-------------------------------------------------------------------------
// We have a transaction which needs to be done
//-------------------------------------------------------------------------
assign mondo_needed = |int_req_vec; 

//-------------------------------------------------------------------------
// Decode reply status bus to detrmin if we have received and ACK or NACK
//-------------------------------------------------------------------------

assign mondo_ack  = rss2gcs_valid &  rss2gcs_rply & (static_gc_id == rss2gcs_id); 
assign mondo_nack = rss2gcs_valid & ~rss2gcs_rply & (static_gc_id == rss2gcs_id); 

//-------------------------------------------------------------------------
// Assign the output values
//-------------------------------------------------------------------------

assign gcs_req = (state == ARB_REQ);                               	// Only doing a request to gc arbiter in the ARB_REQ state
assign gcs_ino = encode(int_winner_vec);				// Take last winner and encode to 6 bit value


//-------------------------------------------------------------------------
// Start the Timer on NACKS
//-------------------------------------------------------------------------
assign timer_start = (state == W_4_REPLY) & mondo_nack;     		// Only start counter when get a Nack


assign update_winner = ((state == IDLE)      & (mondo_needed)) |
		       ((state == W_4_REPLY) & (mondo_needed) & mondo_ack); 

//-------------------------------------------------------------------------
// Debug Ports
//-------------------------------------------------------------------------

assign fsm_dbg = {state[1:0], mondo_ack, mondo_nack, timer_done, gcs_req, gcs_gnt, mondo_needed};  
 
//##########################################################################
//		    		SEQUENTIAL LOGIC 
//############################################################################    

//-----------------------------------------------------------------------
// Next State Logic, Assign nest state to current state 
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
// FSM Combination Logic 
//-----------------------------------------------------------------------   
  
  always @(state  or mondo_needed or gcs_gnt or mondo_ack or mondo_nack or timer_done )
    begin 
     
      case (state)  // synopsys parallel_case full_case 
      
      
          //********************************************************
	  //
	  //  IDLE STATE
	  //
	  //	- Wait here until the arbiter has a mondo which needs
	  //      to be sent . 
	  //		- Do not update the last winner 
	  //
	  //    -If it has a mondo which needs servicing use the arb 
	  //     winner as the one to req for
	  //		- Update the last winner 
	  //   		
	  //		
	  //
          //********************************************************
      
	  IDLE: 
		begin
		  if (mondo_needed)        			// If there is at least one interrupt thats needs servicing
		    begin
		      n_state =   ARB_REQ;
		    end
		  else                    			// If there is no interrupts that needs servicing
		    begin
		      n_state = IDLE;
		    end
		end
		
	  //********************************************************
	  //
	  //  ARB_REQ STATE
	  //
	  //	- Wait here until the req gets a grant from the gc arb
	  //		- Do not update the last winner 
	  //
          //********************************************************
		
		
	  ARB_REQ:
		begin
		   if (gcs_gnt)                     		// If get granted by main 4 to 1 arbiter go to W_4_REPLY  
		     begin
		        n_state =  W_4_REPLY;
		     end
		   else
		     begin
		        n_state =  ARB_REQ;  			// If still not granted wait here 
		     end
		end
		
		
	  //********************************************************
	  //
	  //  W_4_REPLY STATE
	  //
	  //	- Wait here until we get a response from the CPU 
	  //
	  //	- If we get and ACK 
	  //		- see if we have any more reqs waiting
	  //			- if yes ARB again and update last winner
	  //			- if no go to IDLE, no update
	  //
	  //	- If we get a nack we need to retry 
	  //
          //********************************************************
		
		
	  W_4_REPLY:
		begin
		  if (mondo_ack) 			     	// if get ACK back from CPU check if more are waiting 
		    begin 
		     
		     if (mondo_needed)				// ACK and more waiting 
		       begin
		         n_state =  ARB_REQ;
		       end
		     
		     else 					// ACK and no more waiting 
		       begin
		         n_state =  IDLE;
		       end
		     end   
		       
		       
		  else if (mondo_nack) 				// if get NACK back from CPU 
		     begin
		       n_state =  RETRY;
		     end
		     
		  else						// NO reply yet 
		     begin   
		       n_state =  W_4_REPLY ;
		     end
		end 
		
	  //********************************************************
	  //
	  //  RETRY STATE
	  //
	  //	- Wait here until the timer expires
	  //		- Do not update the last winner 
	  //  		- Need to send this one again
	  //
          //********************************************************
		
		
	  RETRY:
		begin
		   if (timer_done)                     		// If get timer done  
		     begin
		        n_state =  ARB_REQ;
		     end
		   else
		    begin
		        n_state =  RETRY;  		    	// If still no timer response wait here 
		   end
		end
	
	endcase
    end 



endmodule  
 
