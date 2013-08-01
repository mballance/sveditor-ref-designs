// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_fsm.v
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
module dmu_imu_eqs_fsm (

		// Clock and Reset 

		clk,
		rst_l,
		
		// Over Flow Error Signal Inputs 

		set_over_err, 
		
		// SW CSR State Update Access Interface 
		
		sw_wr,
		sw_set_addr_sel,
		sw_clr_addr_sel,
		sw_wr_data,
				
		//EQ State Status Signal

		eq_state
		 
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
  //  Over Flow Error Signal Inputs 
  //------------------------------------------------------------------------
  input        	set_over_err; 


  //------------------------------------------------------------------------
  //  SW CSR State Update Access Interface 
  //------------------------------------------------------------------------

  input         sw_wr; 
  input		sw_set_addr_sel; 
  input		sw_clr_addr_sel; 
  input	[1:0]	sw_wr_data; 


  //------------------------------------------------------------------------
  //  EQ State Status Signal  
  //------------------------------------------------------------------------

  output [2:0] 	eq_state; 


//############################################################################
//				PARAMETERS
//############################################################################	

  //------------------------------------------------------------------------
  //  Parameters for the Value of the FSM States
  //------------------------------------------------------------------------
  parameter	IDLE		= 3'b001;		
  parameter	ACTIVE		= 3'b010; 		
  parameter	ERROR		= 3'b100;	
	

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################  
  
  //------------------------
  //  Wires 
  //------------------------
   wire 	go_sw_en_eq; 
   wire 	go_sw_dis_eq; 
   wire 	go_sw_e2i_eq; 
  
   
  //-------------------------
  // Regs that are NOT flops
  //-------------------------  
  reg	[2:0]	n_state;


  //------------------------
  //  Regs that are flops
  //------------------------
  reg	[2:0]	state;
  

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  //---------------------------------------------------------------------
  // State Machine Checkers
  //--------------------------------------------------------------------- 
    //0in state_transition  -var state -val IDLE    -next ACTIVE     
    //0in state_transition  -var state -val ACTIVE  -next ERROR IDLE 
    //0in state_transition  -var state -val ERROR   -next IDLE      


  
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################   
 
  //---------------------------------------------------------------------
  // The signals for SW PIOs
  //--------------------------------------------------------------------- 
   
  //------------------------
  // Enable the EQ
  //------------------------
   assign go_sw_en_eq  = sw_set_addr_sel & sw_wr & sw_wr_data[0]; 
  
  //------------------------
  // Diasable the EQ
  //------------------------
   assign go_sw_dis_eq = sw_clr_addr_sel & sw_wr & sw_wr_data[0]; 
   
  //------------------------
  // Take from Error to Idle
  //------------------------
   assign go_sw_e2i_eq = sw_clr_addr_sel & sw_wr & sw_wr_data[1]; 

  
  //------------------------
  //  Assign the Output
  //------------------------

   assign   eq_state = state; 
   
   
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
  
always @ (state or go_sw_en_eq or go_sw_e2i_eq or go_sw_dis_eq or set_over_err)
  case (state) // synopsys parallel_case 
  
  
    //********************************************************
    //
    //  IDLE STATE
    //
    //	- Wait here until the SW has enabled the EQ 
    //
    //********************************************************

    IDLE 	: begin
    		  
		   if (go_sw_en_eq)			// SW PIO Enables event queue
		      n_state = ACTIVE;
		   else 
		      n_state = IDLE;

		  end
		    
    //********************************************************
    //
    //  ACTIVE STATE
    //
    //	- Wait here until:
    //		- Receive a HW or SW overflow error
    //			- goto ERROR
    //		- SW disbales the EQ
    //			- goto IDLE
    //
    //********************************************************
		    
    ACTIVE       : begin
    
                   if (set_over_err)			// Overflow Error
         	      n_state = ERROR;
		      
		   else if (go_sw_dis_eq)		// SW PIO disables event queue
		      n_state = IDLE;
	
		   else 
		      n_state = ACTIVE;
    		   end

    //********************************************************
    //
    //  ERROR STATE
    //
    //	- Wait here until the SW has puts the EQ back to IDLE
    //
    //********************************************************
		    		   
    ERROR       : begin
                   if (go_sw_e2i_eq)			// SW Puts back into IDLE
		      n_state = IDLE;
		        
		   else 
		      n_state = ERROR;
    
    		   end

    //********************************************************
    //
    //  DEFAULT STATE
    //    
    //   - Go to IDLE
    //********************************************************		  
		  
    default: 
    
        begin
	    n_state = IDLE; //0in < fire -message "Illegal State Reached in module fire_dlc_imu_eqs_fsm.v"

        end  	  	  


    endcase
 
endmodule
