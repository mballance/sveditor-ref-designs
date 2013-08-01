// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rss.v
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
module dmu_imu_rss (
		
		// Clock and Reset 
		
		clk,
		rst_l,
		
		// Inputs from RMU block

		rm2im_rply,
		rm2im_rply_enq,
		
		// Outputs to GCS state Sub-block 

		rss2gcs_rply,
		rss2gcs_id, 
		rss2gcs_valid, 
		
		
		// Debug Ports 
		
		rss2dbg_dbg_a,
		rss2dbg_dbg_b, 
		
		//Perf Counters

		rss2ics_perf_mondo_nacks  

		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################


  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 				clk;
  input					rst_l; 
  
  //------------------------------------------------------------------------
  //  Input Signals from RRM Block  Signals      
  //------------------------------------------------------------------------
  
  input 				rm2im_rply_enq; 	// Enqueue Signal from RRM
  input	[`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply; 		// 1:0 - group id 2: ACK/NACK 0 = NACK 1= ACK
    
  //-----------------------------------------------------
  // Interface for Group Controller Arbiter
  //-----------------------------------------------------
  
  output				rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  output [`FIRE_DLC_MRR_TAG_WDTH-1:0]	rss2gcs_id; 		// Group controller ID for response
  output 				rss2gcs_valid; 		// Valid signal to validate respose
  
  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------
  output   [`FIRE_DEBUG_WDTH-1:0]	rss2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]	rss2dbg_dbg_b;
 
  //------------------------------------------------------------------------
  // Perf Counters   
  //------------------------------------------------------------------------
  output					rss2ics_perf_mondo_nacks;

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################
  //**************************************************
  // Wires 
  //**************************************************
 
  wire   [`FIRE_DEBUG_WDTH-1:0] 	n_dbg_a;
  wire   [`FIRE_DEBUG_WDTH-1:0] 	n_dbg_b;

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg   [`FIRE_DEBUG_WDTH-1:0] 		dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 		dbg_b;

  reg					rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  reg [`FIRE_DLC_MRR_TAG_WDTH-1:0]	rss2gcs_id; 		// Group controller ID for response
  reg 					rss2gcs_valid; 		// Valid signal to validate respose

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

  //**************************************************
  // Register the inputs from, the RRM and send them
  // The the group controller sub-block 
  //**************************************************


always @ (posedge clk)
  if (!rst_l)
    begin
      rss2gcs_valid <= 1'b0;
      rss2gcs_rply  <= 1'b0;
      rss2gcs_id    <= 2'b0; 
    end
  else
    begin
      rss2gcs_valid <= rm2im_rply_enq;
      rss2gcs_rply  <= rm2im_rply[`FIRE_DLC_MRR_ACK_MSB];
      rss2gcs_id    <= rm2im_rply[`FIRE_DLC_MRR_TAG_MSB:`FIRE_DLC_MRR_TAG_LSB]; 
    end



//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

assign n_dbg_a = {4'h0, rss2gcs_valid, rss2gcs_rply, rss2gcs_id};
assign n_dbg_b = {4'h0, rss2gcs_valid, rss2gcs_rply, rss2gcs_id};


always @ (posedge clk)
     begin 
      if (!rst_l) begin
      dbg_a <= 8'b0;
      dbg_b <= 8'b0;
      end
      else begin
      dbg_a <= n_dbg_a;
      dbg_b <= n_dbg_b;
     end   
     end   
   

assign rss2dbg_dbg_a = dbg_a; 
assign rss2dbg_dbg_b = dbg_b; 


//-----------------------------------------------------
//  Performace Counters 
//----------------------------------------------------- 

assign rss2ics_perf_mondo_nacks  = rm2im_rply_enq & ~rm2im_rply[`FIRE_DLC_MRR_ACK_MSB]; 
 
endmodule





