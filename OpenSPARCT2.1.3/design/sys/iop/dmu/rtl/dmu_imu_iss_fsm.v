// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss_fsm.v
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
module dmu_imu_iss_fsm (

		// Clock and Reset 

		clk,
		rst_l,
		
		// HW State Update Access Interface 
		
		int_detected, 
		int_scheduled,
				
		// SW CSR State Update Access Interface 

		sw_wr,
		sw_addr_sel,
		sw_wr_data,
		
		//Mondo State Status Signal
		
		mondo_state
		 
		);
		
//############################################################################
//				PORT DECLARATIONS
//############################################################################
 
  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
 
  input 	clk;
  input		rst_l; 
  
  
  //------------------------------------------------------------------------
  //  Hw State Update Access Signals    
  //------------------------------------------------------------------------
  
  input        	int_detected; 
  input		int_scheduled; 
  
  //------------------------------------------------------------------------
  //  SW CSR State Update Access Interface 
  //------------------------------------------------------------------------

  input         sw_wr; 
  input		sw_addr_sel; 
  input	[1:0]	sw_wr_data; 



  //------------------------------------------------------------------------
  //  Mondo State Status Signals   
  //------------------------------------------------------------------------

  output [1:0]  mondo_state; 

//############################################################################
//				PARAMETERS
//############################################################################	

parameter	IDLE		= 2'b00;		
parameter	RECEIVED	= 2'b01; 		
parameter	PENDING		= 2'b11;		


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################  
  
  //------------------------
  //  Wires 
  //------------------------
  wire 		go_sw_idle;         	// Signal for when CSR to IDLE is done by SW 
  wire		go_sw_received; 	// Signal for when CSR to RECEIVED is done by SW 
  wire		go_sw_pending; 		// Signal for when CSR to PENDING is done by SW 
  
  //-------------------------
  // Regs that are NOT flops
  //-------------------------
  
  reg	[1:0]	n_state;

  //------------------------
  //  Regs that are flops
  //------------------------

  reg	[1:0]	state;
  

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  //---------------------------------------------------------------------
  // State Machine Checkers
  //--------------------------------------------------------------------- 
    //0in state_transition  -var state -val IDLE      -next RECEIVED PENDING     
    //0in state_transition  -var state -val RECEIVED  -next PENDING IDLE 
    //0in state_transition  -var state -val PENDING   -next IDLE RECEIVED  
  
  
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################    
  
  //------------------------
  //  Assign the Output
  //------------------------

    assign   mondo_state = state;
     
  //---------------------------------------------------------------------
  // The signals which cause state transistions for HW and SW 
  //--------------------------------------------------------------------- 
    assign   go_sw_idle     = sw_addr_sel & sw_wr & ~sw_wr_data[1] & ~sw_wr_data[0]; 
    assign   go_sw_received = sw_addr_sel & sw_wr & ~sw_wr_data[1] &  sw_wr_data[0];
    assign   go_sw_pending  = sw_addr_sel & sw_wr &  sw_wr_data[1] &  sw_wr_data[0]; 


//############################################################################
//		    		SEQUENTIAL LOGIC 
//############################################################################    

//-----------------------------------------------------------------------
// Next State Logic, Assign next state to current state 
//----------------------------------------------------------------------- 
always @ (posedge clk)
  if (!rst_l)
    state <= IDLE;
  else
    state <= n_state;

//-----------------------------------------------------------------------
// FSM Combination Logic 
//-----------------------------------------------------------------------   
  
always @ (state or go_sw_received or go_sw_pending or int_detected or go_sw_idle
 	  or  int_scheduled )
  case (state) // synopsys parallel_case
  
   //********************************************************
   //
   //  IDLE STATE
   //
   //	- Wait here until 
   //        - HW receives and interrupt  (Active Low)
   //        - or SW PIO directs us to another state
   //
   //   - Software gets priority
   //
   //********************************************************
  
  
    IDLE: 
       begin
    		  
	  if (go_sw_pending)				// Software PIO to PENDING 			
             n_state = PENDING;
     	  else if (go_sw_received | ~int_detected)	// Software PIO to RECEIVED  or HW detects an int			
	     n_state = RECEIVED;
          else 					        // Software PIO to IDLE or nothing happens 
	     n_state = IDLE;

        end
		    
	
   //********************************************************
   //
   //  RECEIVED STATE
   //
   //	- Wait here until 
   //        - HW can process the RECEIVED interrupt 
   //        - or SW PIO directs us to another state
   //
   //   - Software gets priority
   //
   //********************************************************	
	
		    
    RECEIVED: 
        begin
    
          if (go_sw_idle)				// Software PIO to IDLE 			
             n_state = IDLE;
     	  else if (go_sw_pending | int_scheduled)	// Software PIO to PENDING or HW detects an int			
	     n_state = PENDING;
          else 					        // Software PIO to RECEIVED or nothing happens 
	     n_state = RECEIVED;

        end  
	
   //********************************************************
   //
   //  PENDING STATE
   //
   //	- Wait here until 
   //        - SW PIO directs us to another state
   //
   //********************************************************	
			   
    PENDING:
        begin

          if (go_sw_idle)				// Software PIO to IDLE 			
             n_state = IDLE;
     	  else if (go_sw_received)			// Software PIO to RECEIVED 			
	     n_state = RECEIVED;
          else 					        // Software PIO to PENDNIG or nothing happens 
	     n_state = PENDING;

        end      
    
 
    //********************************************************
    //
    //  DEFAULT STATE
    //    
    //   - Go to IDLE
    //********************************************************		  
		  
    default: 
    
        begin
	    n_state = IDLE; //0in < fire -message "Illegal State Reached in module fire_dlc_imu_iss_fsm.v"

        end  	  	  
	 
    endcase
endmodule
