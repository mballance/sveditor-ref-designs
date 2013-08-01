// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_scs.v
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
module dmu_imu_scs (

		// Clock and Reset 
		
		clk,
		rst_l,
		
		
		// Inputs from RDS sub-block
		
		rds2scs_rcd,
		rds2scs_rcd_sel,
		rds2scs_eq,
		
		// Inputs from the EQS sub-block 
		
		eqs2scs_eq_ok,
		eqs2scs_eq_not_en,
		
		// Outputs to ORS state Sub-block 

		scs2ors_rcd,
		scs2ors_rcd_sel,
		
		
		// Error Int Output
		scs2ics_eq_not_en_error,
		scs2ics_error_data, 
		
		
		// Debug Ports 
		
		dbg2scs_dbg_sel_a,
		dbg2scs_dbg_sel_b,
		scs2dbg_dbg_a,
		scs2dbg_dbg_b 
		
		
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
  //  Input from RDS    
  //------------------------------------------------------------------------
  input [`FIRE_DLC_IIN_REC_WDTH-1:0]	rds2scs_rcd;
  input					rds2scs_rcd_sel;
  input  [5:0]				rds2scs_eq; 

  
  //------------------------------------------------------------------------
  //  Input from Decoder sub-block    
  //------------------------------------------------------------------------
  input					eqs2scs_eq_ok;
  input					eqs2scs_eq_not_en;
  
  //------------------------------------------------------------------------
  //  Output to Out Record Sub-block     
  //------------------------------------------------------------------------
  output [`FIRE_DLC_IIN_REC_WDTH-1:0]	scs2ors_rcd;
  output				scs2ors_rcd_sel;
		
  output				scs2ics_eq_not_en_error;		
  output [63:0]				scs2ics_error_data;
  
  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2scs_dbg_sel_a;
  input [2:0] 					dbg2scs_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_b;

//############################################################################
//				PARAMETERS
//############################################################################


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wires 
//**************************************************

//-------------------------------------
// Live In Record Fields
//-------------------------------------
  wire 	[`FIRE_DLC_IIN_TYPE_WDTH -1:0]		in_type; 

//-------------------------------------
// Packet Type Decode Wires
//-------------------------------------    
  wire						pkt_is_msi; 
  wire						pkt_is_mes; 	

//-------------------------------------
// Signal to look at EQ lookup results
//-------------------------------------
  wire 						check_results; 
  
 //-------------------------------------
// Signal for out record type 
//------------------------------------- 
  wire	[`FIRE_DLC_IIN_TYPE_WDTH -1:0]		out_type; 

//**************************************************
// Registers that Are Not Flops 
//**************************************************
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_b;

//**************************************************
// Registers that Are Flops 
//**************************************************

//-------------------------------------
// Out Record Flops
//-------------------------------------
  reg [`FIRE_DLC_IIN_REC_WDTH-1:0]		scs2ors_rcd;
  reg						scs2ors_rcd_sel;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
   
//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
	
//--------------------------------
// Grab the Incomming Packet Type
//--------------------------------	

assign	in_type = rds2scs_rcd[`FIRE_DLC_IIN_TYPE_MSB:`FIRE_DLC_IIN_TYPE_LSB];	  

//--------------------------------
// Decode Incomming Packet Type
//
//   See if the packet is either
//	- MSI 
//	- Message
//--------------------------------	

assign pkt_is_msi =   in_type[`FIRE_DLC_IMU_OTYPE_DECODE_2] & 
		     !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_1] & 
		     !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_0]; 
		     
assign pkt_is_mes = !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_2];

//--------------------------------
// Form check results Signal
// 
// If it is either
//	- MSI 
//	- Message
//--------------------------------	

assign  check_results = pkt_is_msi | pkt_is_mes; 

//--------------------------------------
// Calculate Proper Output Type
//
// If need to check results 
//
//    -Check to see if results are good
// 	- if good keep type
//	- if bad put in null
//
// If dont need to check results 
//
///   - Keep current type
//--------------------------------------
 
assign  out_type = check_results ? ( eqs2scs_eq_ok ? in_type : `FIRE_DLC_IMU_TYPE_NULL) : in_type;


//--------------------------------
// Error Checking for Interrupt
//  - get an EQ wite (mess or msi)
//  - EQ is in IDLE state
// 
//--------------------------------

assign  scs2ics_eq_not_en_error =  rds2scs_rcd_sel  & check_results &  eqs2scs_eq_not_en; 


assign  scs2ics_error_data = { rds2scs_rcd[`FIRE_DLC_IIN_TYPE_MSB-1 : `FIRE_DLC_IIN_TYPE_LSB], 
			       rds2scs_rcd[`FIRE_DLC_IIN_LEN_MSB    : `FIRE_DLC_IIN_LEN_LSB],
			       rds2scs_rcd[`FIRE_DLC_IIN_REQID_MSB  : `FIRE_DLC_IIN_REQID_LSB],
			       rds2scs_rcd[`FIRE_DLC_IIN_TLPTAG_MSB : `FIRE_DLC_IIN_TLPTAG_LSB],
			       rds2scs_rcd[`FIRE_DLC_IIN_DATA_MSB   : `FIRE_DLC_IIN_DATA_LSB],
			       10'h0, rds2scs_eq};
			       
//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2scs_dbg_sel_a or rds2scs_rcd_sel or in_type or pkt_is_msi or pkt_is_mes or
          check_results or eqs2scs_eq_ok or eqs2scs_eq_not_en or scs2ics_eq_not_en_error) 
  begin
    case (dbg2scs_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {rds2scs_rcd_sel, in_type[6:0]};
      3'b001: n_dbg_a = {3'h0, pkt_is_msi, pkt_is_mes, check_results, eqs2scs_eq_ok, eqs2scs_eq_not_en};
      3'b010: n_dbg_a = {7'h0, scs2ics_eq_not_en_error};
      3'b011: n_dbg_a = 8'h00;
      3'b100: n_dbg_a = 8'h00;
      3'b101: n_dbg_a = 8'h00;
      3'b110: n_dbg_a = 8'h00;
      3'b111: n_dbg_a = 8'h00;
    endcase
  end

always @ (dbg2scs_dbg_sel_b or rds2scs_rcd_sel or in_type or pkt_is_msi or pkt_is_mes or
          check_results or eqs2scs_eq_ok or eqs2scs_eq_not_en or scs2ics_eq_not_en_error) 
  begin
    case (dbg2scs_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {rds2scs_rcd_sel, in_type[6:0]};
      3'b001: n_dbg_b = {3'h0, pkt_is_msi, pkt_is_mes, check_results, eqs2scs_eq_ok, eqs2scs_eq_not_en};
      3'b010: n_dbg_b = {7'h0, scs2ics_eq_not_en_error};
      3'b011: n_dbg_b = 8'h00;
      3'b100: n_dbg_b = 8'h00;
      3'b101: n_dbg_b = 8'h00;
      3'b110: n_dbg_b = 8'h00;
      3'b111: n_dbg_b = 8'h00;
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
   

assign scs2dbg_dbg_a = dbg_a; 
assign scs2dbg_dbg_b = dbg_b; 


			       

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   
//-----------------------------------------------------------------------------
// Delay all of the In Record information to keep in step with the pipeline. 
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		                  
       scs2ors_rcd	<= {`FIRE_DLC_IIN_REC_WDTH{1'h0}}; 
       scs2ors_rcd_sel	<= 1'h0; 
      end 		
  else 
      begin                   		                 
       scs2ors_rcd  	<= {out_type,rds2scs_rcd[`FIRE_DLC_IIN_TC_MSB:0]}; 
       scs2ors_rcd_sel	<= rds2scs_rcd_sel; 
      end 		      
		

endmodule
