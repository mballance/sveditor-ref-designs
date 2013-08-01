// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs_csm.v
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
module dmu_imu_gcs_csm (

		// Clock and Reset 

		clk, 
		rst_l, 
		
		// ISS lookup request signals

		gcs2iss_tid_req,
		gcs2iss_tid_sel,
		gcs2iss_mdo_pending,
		
		// ISS lookup response signals

		iss2gcs_tid_ack, 
		iss2gcs_tid,
		iss2gcs_mondo_mode, 		

		// Signal to Arbiter to arbitrate again 
		 
                next_arb, 
		
		// Signals from arbiter
		
              	gc_arb_valid, 
              	gc_arb_ino,
              	gc_arb_id,

		// LRM Mondo Enqueue Interface 
		
		im2rm_mdo_enq,
		im2rm_mdo, 
		
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
  
  //------------------------------------------------------------------------
  // ISS lookup request signals
  //------------------------------------------------------------------------
  output        gcs2iss_tid_req;        // Request  ot ISS for TID for accepted mondo
  output [5:0]  gcs2iss_tid_sel;	// Select for the TID output mux
  output [63:0] gcs2iss_mdo_pending;    // ID of mondo that was accecpted
  
  //------------------------------------------------------------------------
  //  ISS lookup response signals  
  //------------------------------------------------------------------------

  input         iss2gcs_tid_ack; 	// Qualifier for tid of mondo	
  input  [5:0]  iss2gcs_tid;          	// TID of mondo 
  input 	iss2gcs_mondo_mode;     // Mode of the modo 

  //------------------------------------------------------------------------
  // Signal to Arbiter to arbitrate again  
  //------------------------------------------------------------------------

  output        next_arb;          	// Signal to GC arb  to do next arb

  //------------------------------------------------------------------------
  // Signals from arbiter
  //------------------------------------------------------------------------

  input       	gc_arb_valid;        	// Valid signal saying that the arb winner is now valid are ready to be taken 
  input [5:0] 	gc_arb_ino;          	// The ino of winner from arbitration; 
  input [1:0] 	gc_arb_id;           	// ID of the group controller of the arb winner


  //-----------------------------------------------------
  // Interface for to LRM for Mondo Records
  //-----------------------------------------------------
  
  output        			im2rm_mdo_enq;    	//Enqueue signal for mondo record
  output [`FIRE_DLC_MQR_REC_WDTH-1:0] 	im2rm_mdo;         	// Mondo data 

 //-----------------------------------------------------
  // Debug Interface
  //-----------------------------------------------------
		
  output  [`FIRE_DEBUG_WDTH-1:0]        fsm_dbg; 
  


//############################################################################
//				PARAMETERS
//############################################################################		
parameter IDLE    =   2'b00;
parameter TID_REQ =   2'b01;
parameter TID_ACK =   2'b10;
parameter LRM_ENQ =   2'b11;

 
//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################   
  
  //------------------------
  //  Wires 
  //------------------------
  
   wire load_new_mondo;     

  //-------------------------
  // Regs that are NOT flops
  //-------------------------
  reg [1:0] n_state;
  

  //------------------------
  //  Regs that are flops
  //------------------------
  reg [1:0] state;
  reg [5:0] current_ino; 
  reg [1:0] current_id;


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
  //---------------------------------------------------------------------
  //  One Hot / Bits On Checkers  
  //---------------------------------------------------------------------
  
   //0in bits_on -var gcs2iss_mdo_pending -max 1
   
  //---------------------------------------------------------------------
  // REQ / ACK Interface Checkers  
  //---------------------------------------------------------------------
  
   //0in req_ack -req gcs2iss_tid_req -ack iss2gcs_tid_ack -req_until_ack -new_req_after_ack -max_ack 1 
   //0in req_ack -req gc_arb_valid    -ack next_arb        -req_until_ack -new_req_after_ack -max_ack 1 
   
  //---------------------------------------------------------------------
  // Known and Constant Checkers  
  //---------------------------------------------------------------------
    //0in known_driven  -var gcs2iss_mdo_pending -active gcs2iss_tid_req
    //0in constant      -var gcs2iss_mdo_pending -active gcs2iss_tid_req
    
    //0in known_driven  -var iss2gcs_tid         -active iss2gcs_tid_ack
    //0in constant      -var iss2gcs_tid         -active iss2gcs_tid_ack
    
    //0in known_driven  -var iss2gcs_mondo_mode  -active iss2gcs_tid_ack
    //0in constant      -var iss2gcs_mondo_mode  -active iss2gcs_tid_ack
    
    //0in known_driven  -var gc_arb_ino          -active gc_arb_valid
    //0in constant      -var gc_arb_ino          -active gc_arb_valid
    
    //0in known_driven  -var gc_arb_id           -active gc_arb_valid
    //0in constant      -var gc_arb_id           -active gc_arb_valid
    
    //0in known_driven  -var im2rm_mdo           -active im2rm_mdo_enq
    //0in constant      -var im2rm_mdo           -active im2rm_mdo_enq
    
    
  //---------------------------------------------------------------------
  // Assert Timers 
  //---------------------------------------------------------------------
    //0in assert_timer -var im2rm_mdo_enq -min 1 -max 1
    
     
  //---------------------------------------------------------------------
  // State Machine Checkers
  //--------------------------------------------------------------------- 
    //0in state_transition  -var state -val IDLE    -next TID_REQ
    //0in state_transition  -var state -val TID_REQ -next TID_ACK
    //0in state_transition  -var state -val TID_ACK -next LRM_ENQ
    //0in state_transition  -var state -val LRM_ENQ -next TID_REQ IDLE
    //0in sequence          -var state -val TID_REQ TID_ACK LRM_ENQ


//############################################################################
//		    		FUNCTION  DECLARATIONS
//############################################################################    
//----------------------------------------------------------------------
//  This function takes as an input a 6 bit vector encodes it to 
//  a 64 bit vector with one bit set. 
//
//  For Example on a 8 bit vector
//
//    Input   = 00011
//
//    Output  = 000100
//
//-----------------------------------------------------------------------
  
  function [63:0] decode;
    input [5:0] vec;

    reg [63:0] decode_vec;
    reg [6:0]i;
   
    begin 
    
      decode_vec = 64'h0;
      
      for (i=7'd0; i<= 7'd63; i=i+7'd1)
	begin 
	  if (i[5:0] == vec) decode_vec[i] = 1'b1;
	  else decode_vec[i] = 1'b0;
	end 
	
      decode = decode_vec;
      
      //$display($time,": Ecoded value for vec = %0b is %0b\n",vec, enc_vec);
    end 
  endfunction
  


 
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################        

//-------------------------------------------------------------------
//  Assign the outputs to the ISS
//   	- req should be assrted in REQ state until gets and ACK back 
//	- The ino should be the registered version encoded to 64 bits
//-------------------------------------------------------------------
assign gcs2iss_tid_req  = (state == TID_REQ) | (state == TID_ACK); 
assign gcs2iss_mdo_pending = decode(current_ino); 
assign gcs2iss_tid_sel  = current_ino;	


//-------------------------------------------------------------------
//  Assign the outputs to the LRM
//   	- Enq should be pulsed every LRM_ENQ state
//	- Concat the proper registed flops togther. 
//-------------------------------------------------------------------

assign im2rm_mdo_enq = (state == LRM_ENQ);
assign im2rm_mdo = {iss2gcs_tid[5],iss2gcs_mondo_mode, current_ino, iss2gcs_tid[4:0], current_id};

//-------------------------------------------------------------------
//  Do the internal combination control signals
//   	- Next arb should happen ever TID req to get the next arb ready and exposed
//	- Register the current id and ino before the new values are loaded in on the 
//        next cycle.  
//-------------------------------------------------------------------
assign next_arb = (state == TID_REQ);
assign load_new_mondo = (n_state == TID_REQ);

//-------------------------------------------------------------------------
// Debug Ports
//-------------------------------------------------------------------------

assign fsm_dbg = {2'h0, state[1:0], gc_arb_valid, iss2gcs_tid_ack, gc_arb_id[1:0]};  

//############################################################################
//		    		SEQUENTIAL LOGIC 
//############################################################################    

//-----------------------------------------------------------------------
// Flop the arb winner's INO and ID 
//  	- Load the new valaue of the winner when appropriate
//	  or hold the current value
//----------------------------------------------------------------------- 
  always @(posedge clk)
    begin
      if (~rst_l)
        begin
	  current_ino <=  6'h0;
          current_id  <= 2'b00; 
	end
      else if (load_new_mondo)
        begin
	  current_ino <= gc_arb_ino;
          current_id  <= gc_arb_id; 
	end 
      else 
       begin
	  current_ino <= current_ino;
          current_id  <= current_id ; 
	end 
    end
  

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
// FSM Combination Logic 
//-----------------------------------------------------------------------   
  
  always @(state or gc_arb_valid or iss2gcs_tid_ack)
    begin 
    
     
      case (state)  // synopsys parallel_case full_case 
      
          //********************************************************
	  //
	  //  IDLE STATE
	  //
	  //	- Wait here until the arbiter has a mondo which needs
	  //      to be sent . 
	  //
          //********************************************************
      
      
	  IDLE: 
		begin
		  if (gc_arb_valid)       	// If there is interrupt waiting arb
		    begin
		      n_state = TID_REQ;
		    end
		  else                   	// If there are no interrupts that needs servicing
		    begin
		      n_state = IDLE;
		    end
		end
	
	  //********************************************************
	  //
	  //  TID_REQ STATE
	  //
	  //	- This state is used to issue the request to the ISS
	  //      to obatin the TID for the mondo which the arbiter
	  //      selected as the winner. 
	  //
	  //    - This state is also used to trigger the loading of
	  //      the next winner for the arbiter and to latch in 
	  //      the value of the current winners before they change
	  //
          //********************************************************
	
          TID_REQ:
		begin
		   n_state =  TID_ACK;  	// Stay here for one cycle
		end
		
	  //********************************************************
	  //
	  //  TID_ACK STATE
	  //
	  //	- Wait in this state until the ISS respons with an
	  //      ACK and the TID of the requested mondo
	  //
          //********************************************************	
		
	  TID_ACK:
		begin
		   if (iss2gcs_tid_ack)     	// If get granted by the ISS
		     begin
		        n_state =  LRM_ENQ;
		     end
		   else
		     begin
		        n_state =  TID_ACK; 	// If still not granted wait here 
		     end
		end
		
		
	  //********************************************************
	  //
	  //  LRM_ENQ STATE
	  //
	  //	- This state is used to enqueue the request to the 
	  //      LRM . 
	  //    - If another requests is waiting go handle it
	  //    - If not go back to IDLE
	  //
          //********************************************************		
		
	  LRM_ENQ:
		begin
		  if (gc_arb_valid)		// If another request is waiting 
		     begin
		       n_state =  TID_REQ;
		     end
		     
		  else 			 	// Another request is not waiting  more waiting 
		     begin
		       n_state =  IDLE;
		     end
		end 
	
	endcase
    end 



endmodule  
 
