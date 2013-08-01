// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs_gc_cnt.v
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
module dmu_imu_gcs_gc_cnt (

		// Clock and Reset 

		clk, 
		rst_l,
		 
		// Interface for Interrupt Retry Timer
		
		timer_start,
		timer_done, 
		
		// Interface for Static Value for Counter
				
		iss2gcs_counter_limit
		
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
  // Interface for Interrupt Retry Timer
  //-----------------------------------------------------
  
  input 	 timer_start;		// Signal to start retry timer
  output	 timer_done; 		// SIgnal showing the retry timer is done
  
  //-----------------------------------------------------
  // Interface for Static Value for Counter
  //-----------------------------------------------------
  
  input	[24:0]	 iss2gcs_counter_limit;       // Limit the counter counts down from 
 
//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################   
  
  //------------------------
  //  Regs that are flops
  //------------------------
  
  reg      	counter_armed;
  reg	[24:0]	cnt; 
 
 
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
    // 0in req_ack -req timer_start -ack timer_done -max_ack 1 
 
   
//############################################################################
//		    		COMBINATIONAL LOGIC 
//############################################################################        
 
//-----------------------------------------------------------------------
// Assign the output going back to the group controller state machine
//     - When the counter reaches zero and the counter is armed 
//     - This takes care of reset 
//----------------------------------------------------------------------- 

 assign timer_done = counter_armed & (cnt == 25'h00000); 

//############################################################################
//		    		SEQUENTIAL LOGIC 
//############################################################################  


//-----------------------------------------------------------------------
// Counter Arm logic to prevent false firing of counter_done
//     - Counter is only armed when counter start is pulsed
//     - COunter is unarmed when counter reaches zero 
//----------------------------------------------------------------------- 
  always @(posedge clk)
    begin
      if (~rst_l | timer_done)			// When the timer reaches zero dis-arm itor at reset
        begin
	  counter_armed <=  1'b0;
	end
      else if (timer_start) 			// When group control says start, arm timer
        begin
	  counter_armed <=  1'b1;
	end 
      else 
        begin
	  counter_armed <= counter_armed;	// Hold the current value 
	end
    end
   
//-----------------------------------------------------------------------
// Counter Logic 
//    - When timer_start pulses the limit is loaded into the counter
//      and the counter is started 
//    - The counter counts down and will continue until it reaches zero
//-----------------------------------------------------------------------   
   always @(posedge clk)
      begin
	 if (~rst_l)				// Reset the counter to zero 
	    begin
	       cnt    <=  25'h0;
	    end
	 else if (timer_start)			// WHen started load the CSR count down value 
	    begin
	       cnt    <= iss2gcs_counter_limit; 
	    end
	 else
	    begin
	       if(counter_armed & (|cnt))	// Decrement if armed and above zero
		  cnt <= cnt - 1;           	//0in < decrement -var cnt  
	       else
		  cnt <= cnt;
	    end
      end
      
      
endmodule
