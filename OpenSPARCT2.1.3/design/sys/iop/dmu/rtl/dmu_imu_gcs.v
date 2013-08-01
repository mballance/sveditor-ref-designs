// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_gcs.v
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
module dmu_imu_gcs (

		// Clock and Reset 

		clk, 
		rst_l,
		
		// Mondo Requests Comming from each of the 4 group controllers 
		    
		iss2gcs_gc_0_mdo_needed,
		iss2gcs_gc_1_mdo_needed,
		iss2gcs_gc_2_mdo_needed,
		iss2gcs_gc_3_mdo_needed,

		// ISS lookup request signals

		gcs2iss_tid_req,
		gcs2iss_tid_sel,
		gcs2iss_mdo_pending, 
			
		// ISS lookup response signals
	
		iss2gcs_tid_ack, 
		iss2gcs_tid, 
		iss2gcs_mondo_mode,
		
		// Static Counter Limit from CSR
				
		iss2gcs_counter_limit,
				
		// Interface for Mondo Reply Status 

		rss2gcs_rply,
		rss2gcs_id, 
		rss2gcs_valid, 

		// LRM Mondo Enqueue Interface 

		im2rm_mdo_enq,
		im2rm_mdo, 
		
		
		// Debug Ports 
		
		dbg2gcs_dbg_sel_a,
		dbg2gcs_dbg_sel_b,
		gcs2dbg_dbg_a,
		gcs2dbg_dbg_b,
		
		// Idle checkers 
		
		gcs2dbg_idle 
		
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
  // Mondo Requests Comming from each of the 4 group controllers      
  //------------------------------------------------------------------------

  input [63:0]  iss2gcs_gc_0_mdo_needed;  //Requests to issue and interrupt from GC 0   
  input [63:0]  iss2gcs_gc_1_mdo_needed;  //Requests to issue and interrupt from GC 1 
  input [63:0]  iss2gcs_gc_2_mdo_needed;  //Requests to issue and interrupt from GC 2  
  input [63:0]  iss2gcs_gc_3_mdo_needed;  //Requests to issue and interrupt from GC 3 
  
  //------------------------------------------------------------------------
  // ISS lookup request signals
  //------------------------------------------------------------------------
  
  output        gcs2iss_tid_req;        // Request to ISS for TID for accepted mondo
  output [5:0]  gcs2iss_tid_sel;	// Select for the TID output mux
  output [63:0] gcs2iss_mdo_pending;    // ID of mondo that was accecpted

  //------------------------------------------------------------------------
  // ISS lookup response signals
  //------------------------------------------------------------------------
  input         iss2gcs_tid_ack;  	// ACK Qualifier for tid of mondo	
  input  [5:0]  iss2gcs_tid;           	// TID of mondo 
  input 	iss2gcs_mondo_mode;     // Mode of the modo 
 
  //-----------------------------------------------------
  // Static Counter Limit from CSR
  //-----------------------------------------------------
    
  input [24:0]  iss2gcs_counter_limit; 		// COunter Limit fo rthe retry counter 
 
  //-----------------------------------------------------
  // Interface for Mondo Reply Status 
  //-----------------------------------------------------
  
  input	  	rss2gcs_rply; 		// Reply type from RSS ack =1 nack =0
  input [1:0]	rss2gcs_id; 		// Group controller ID for response
  input 	rss2gcs_valid; 		// Valid signal to validate respose
  
  //-----------------------------------------------------
  // Interface for to LRM for Mondo Records
  //-----------------------------------------------------
  
  output        			im2rm_mdo_enq;    	//Enqueue signal for mondo record
  output [`FIRE_DLC_MQR_REC_WDTH-1:0] 	im2rm_mdo;         	// Mondo data 

  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2gcs_dbg_sel_a;
  input [2:0] 					dbg2gcs_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_b;

  //------------------------------------------------------------------------
  // Idle Checkers  
  //------------------------------------------------------------------------
  output					gcs2dbg_idle; 
  
//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################  
 
  //------------------------
  //  Wires 
  //------------------------
  
  wire       gc_0_req, gc_1_req, gc_2_req, gc_3_req; 
  wire [5:0] gc_0_ino, gc_1_ino, gc_2_ino, gc_3_ino; 
  wire       gc_0_gnt, gc_1_gnt, gc_2_gnt, gc_3_gnt; 
  wire  [`FIRE_DEBUG_WDTH-1:0]   gc_0_fsm_dbg, gc_1_fsm_dbg, gc_2_fsm_dbg, gc_3_fsm_dbg; 
  wire  [`FIRE_DEBUG_WDTH-1:0]  csm_fsm_dbg; 
  
  wire [5:0] gc_arb_ino;  
  wire [1:0] gc_arb_id;  
  
  wire 	     next_arb; 
  wire 	     gc_arb_valid; 

  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************
 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_b;

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################
//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2gcs_dbg_sel_a or gc_0_fsm_dbg or gc_1_fsm_dbg or gc_2_fsm_dbg or
	  gc_3_fsm_dbg or csm_fsm_dbg or gc_arb_ino or im2rm_mdo_enq or im2rm_mdo) 
  begin
    case (dbg2gcs_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = gc_0_fsm_dbg;
      3'b001: n_dbg_a = gc_1_fsm_dbg;
      3'b010: n_dbg_a = gc_2_fsm_dbg;
      3'b011: n_dbg_a = gc_3_fsm_dbg;
      3'b100: n_dbg_a = csm_fsm_dbg;
      3'b101: n_dbg_a = {2'h0, gc_arb_ino[5:0]};
      3'b110: n_dbg_a = {im2rm_mdo_enq, im2rm_mdo[6:0]};
      3'b111: n_dbg_a = {im2rm_mdo_enq, im2rm_mdo[13:7]};
    endcase
  end

always @ (dbg2gcs_dbg_sel_b or gc_0_fsm_dbg or gc_1_fsm_dbg or gc_2_fsm_dbg or
	  gc_3_fsm_dbg or csm_fsm_dbg or gc_arb_ino or im2rm_mdo_enq or im2rm_mdo) 
  begin
    case (dbg2gcs_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = gc_0_fsm_dbg;
      3'b001: n_dbg_b = gc_1_fsm_dbg;
      3'b010: n_dbg_b = gc_2_fsm_dbg;
      3'b011: n_dbg_b = gc_3_fsm_dbg;
      3'b100: n_dbg_b = csm_fsm_dbg;
      3'b101: n_dbg_b = {2'h0, gc_arb_ino[5:0]};
      3'b110: n_dbg_b = {im2rm_mdo_enq, im2rm_mdo[6:0]};
      3'b111: n_dbg_b = {im2rm_mdo_enq, im2rm_mdo[13:7]};
    endcase
  end

  
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
   

assign gcs2dbg_dbg_a = dbg_a; 
assign gcs2dbg_dbg_b = dbg_b; 

 //------------------------------------------------------------------------
  // Idle Checkers  
  //------------------------------------------------------------------------
 assign gcs2dbg_idle =  ~gc_0_fsm_dbg[7] & ~gc_0_fsm_dbg[6] &
			~gc_1_fsm_dbg[7] & ~gc_1_fsm_dbg[6] &
			~gc_2_fsm_dbg[7] & ~gc_2_fsm_dbg[6] &
			~gc_3_fsm_dbg[7] & ~gc_3_fsm_dbg[6] &
			~csm_fsm_dbg[5]  & ~csm_fsm_dbg[4];			
			 


//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    

 dmu_imu_gcs_gc gc_0 (

		.clk  (clk), 
		.rst_l  (rst_l),
		
		.int_req_vec  (iss2gcs_gc_0_mdo_needed),
		
		.gcs_req  (gc_0_req),
		.gcs_ino  (gc_0_ino), 
		.gcs_gnt  (gc_0_gnt), 
		
		.rss2gcs_rply  (rss2gcs_rply),
		.rss2gcs_id  (rss2gcs_id ), 
		.rss2gcs_valid  (rss2gcs_valid), 
		
		.iss2gcs_counter_limit  (iss2gcs_counter_limit), 
				
		.static_gc_id  (2'b00),
		
		.fsm_dbg (gc_0_fsm_dbg)
		
		);
		

 dmu_imu_gcs_gc gc_1 (

		.clk  (clk), 
		.rst_l  (rst_l),
		
		.int_req_vec  (iss2gcs_gc_1_mdo_needed),
		
		.gcs_req  (gc_1_req),
		.gcs_ino  (gc_1_ino), 
		.gcs_gnt  (gc_1_gnt), 
		
		.rss2gcs_rply  (rss2gcs_rply),
		.rss2gcs_id  (rss2gcs_id ), 
		.rss2gcs_valid  (rss2gcs_valid), 
		
		.iss2gcs_counter_limit  (iss2gcs_counter_limit), 
				
		.static_gc_id  (2'b01),
		
		.fsm_dbg (gc_1_fsm_dbg)
		
		);
		


 dmu_imu_gcs_gc gc_2 (

		.clk  (clk), 
		.rst_l  (rst_l),
		
		.int_req_vec  (iss2gcs_gc_2_mdo_needed),
		
		.gcs_req  (gc_2_req),
		.gcs_ino  (gc_2_ino), 
		.gcs_gnt  (gc_2_gnt), 
		
		.rss2gcs_rply  (rss2gcs_rply),
		.rss2gcs_id  (rss2gcs_id ), 
		.rss2gcs_valid  (rss2gcs_valid), 
		
		.iss2gcs_counter_limit  (iss2gcs_counter_limit), 
				
		.static_gc_id  (2'b10),
		
		.fsm_dbg (gc_2_fsm_dbg)
		
		);
		


 dmu_imu_gcs_gc gc_3 (

		.clk  (clk), 
		.rst_l  (rst_l),
		
		.int_req_vec  (iss2gcs_gc_3_mdo_needed),
		
		.gcs_req  (gc_3_req),
		.gcs_ino  (gc_3_ino), 
		.gcs_gnt  (gc_3_gnt), 
		
		.rss2gcs_rply  (rss2gcs_rply),
		.rss2gcs_id  (rss2gcs_id ), 
		.rss2gcs_valid  (rss2gcs_valid), 
		
		.iss2gcs_counter_limit  (iss2gcs_counter_limit), 
				
		.static_gc_id  (2'b11),
		
		.fsm_dbg (gc_3_fsm_dbg)
		
		);
		

 dmu_imu_gcs_arb arb (

		.clk     (clk), 
		.rst_l   (rst_l),
	
		.gc_0_req  (gc_0_req),
		.gc_0_ino  (gc_0_ino), 
		.gc_0_gnt  (gc_0_gnt), 

		.gc_1_req  (gc_1_req),
		.gc_1_ino  (gc_1_ino), 
		.gc_1_gnt  (gc_1_gnt), 

		.gc_2_req  (gc_2_req),
		.gc_2_ino  (gc_2_ino), 
		.gc_2_gnt  (gc_2_gnt), 


		.gc_3_req  (gc_3_req),
		.gc_3_ino  (gc_3_ino), 
		.gc_3_gnt  (gc_3_gnt), 


                .next_arb   (next_arb), 

                .gc_arb_valid (gc_arb_valid), 
                .gc_arb_ino   (gc_arb_ino),
                .gc_arb_id    (gc_arb_id)
		
		);



 dmu_imu_gcs_csm csm(

		.clk			(clk), 
		.rst_l			(rst_l), 
		
		.gcs2iss_tid_req	(gcs2iss_tid_req),
		.gcs2iss_tid_sel	(gcs2iss_tid_sel),

		.gcs2iss_mdo_pending	(gcs2iss_mdo_pending),
		.iss2gcs_tid_ack	(iss2gcs_tid_ack), 
		.iss2gcs_tid		(iss2gcs_tid), 		
		.iss2gcs_mondo_mode	(iss2gcs_mondo_mode),

                .next_arb		(next_arb), 
		
              	.gc_arb_valid		(gc_arb_valid), 
              	.gc_arb_ino		(gc_arb_ino),
              	.gc_arb_id		(gc_arb_id),


		.im2rm_mdo_enq		(im2rm_mdo_enq),
		.im2rm_mdo		(im2rm_mdo),
		
		.fsm_dbg 		(csm_fsm_dbg)

		);






endmodule 
