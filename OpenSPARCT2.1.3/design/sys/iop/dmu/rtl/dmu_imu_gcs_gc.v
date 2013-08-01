// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs_gc.v
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
module dmu_imu_gcs_gc (

		// Clock and Reset 
		
		clk, 
		rst_l,
		
		//  Mondo Input Vector from the ISS  
		
		int_req_vec,
		
		// Interface to Group Controller Arbiter
		
		gcs_req,
		gcs_ino, 
		gcs_gnt, 
		
		// Interface from the Reply status
		
		rss2gcs_rply,
		rss2gcs_id, 
		rss2gcs_valid, 
		
		// Interface for Interrupt Retry Timer
		
		iss2gcs_counter_limit, 				
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
  
  //------------------------------------------------------------------------
  //  Mondo Input Vector from the ISS  
  //------------------------------------------------------------------------
  
  
  input [63:0]  int_req_vec;   //Requests to issue and interrupt   
  
  //-----------------------------------------------------
  // Interface to Group Controller Arbiter
  //-----------------------------------------------------
  
  output 	 gcs_req; 		// Request to group controller arbiter
  output [5:0]	 gcs_ino;		// INO for requesting mondo   		
  input		 gcs_gnt; 		// Acknowldge for Request signal 
  
  
  //-----------------------------------------------------
  // Interface from the Reply status block 
  //-----------------------------------------------------
  
  input		 rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  input [1:0]	 rss2gcs_id; 		// Group controller ID for response
  input 	 rss2gcs_valid; 	// Valid signal to validate respose
  
  //-----------------------------------------------------
  // Interface for Interrupt Retry Timer
  //-----------------------------------------------------
    
  input [24:0]   iss2gcs_counter_limit; 	// Cuunter Limit fo rthe retry counter 
  input	[1:0]	 static_gc_id; 		// Id for group controller
  
  //-----------------------------------------------------
  // Debug Interface
  //-----------------------------------------------------
		
  output  [`FIRE_DEBUG_WDTH-1:0]        fsm_dbg; 
 
 
//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################   
  
  //------------------------
  //  Wires 
  //------------------------
   wire		update_winner;
   wire [63:0] 	int_req_vec; 
   wire [63:0]  int_winner_vec;
 
   wire 	timer_start;		// Signal to start retry timer
   wire		timer_done; 		// SIgnal showing the retry timer is done
   
   
//############################################################################
//		    		MODULE INSTANCIATIONS
//############################################################################    


 pcie_common_frr_arbiter  #(64) frr_gc_arb(
		
		.clk			(clk), 
		.rst_l			(rst_l), 
		
		.current_request_vector	(int_req_vec),
		.update_winner		(update_winner),

		// Arbiter Outputs 
		
		.current_winner_vector  (int_winner_vec)
		
		);
		


dmu_imu_gcs_gc_cnt cnt(

		.clk			(clk), 
		.rst_l			(rst_l), 
		
		.timer_start		(timer_start),
		.timer_done		(timer_done), 
				
		.iss2gcs_counter_limit		(iss2gcs_counter_limit)
		
		);
		
		
 dmu_imu_gcs_gc_fsm fsm (

		.clk			(clk), 
		.rst_l			(rst_l),
		
		.int_req_vec		(int_req_vec),
		.int_winner_vec		(int_winner_vec),
		
		.update_winner		(update_winner), 
		
		.gcs_req		(gcs_req),
		.gcs_ino		(gcs_ino), 
		.gcs_gnt		(gcs_gnt), 
		
		.rss2gcs_rply		(rss2gcs_rply),
		.rss2gcs_id		(rss2gcs_id), 
		.rss2gcs_valid		(rss2gcs_valid), 
		
		.timer_start		(timer_start),
		.timer_done		(timer_done), 
				
		.static_gc_id		(static_gc_id),
		
		.fsm_dbg		(fsm_dbg)
		
		);		
		
endmodule 
