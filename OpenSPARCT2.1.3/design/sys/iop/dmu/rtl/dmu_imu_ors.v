// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ors.v
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
module dmu_imu_ors (

		// Clock and Reset 
		
		clk,
		rst_l,
		
		// Inputs from SCS sub-block
				
		scs2ors_rcd,
		scs2ors_rcd_sel, 
		
		// Inputs from EQS sub-block

		eqs2ors_eq_addr,
                eqs2ors_sel,      

		// Outputs to LRM Block 

		im2rm_rcd,
		im2rm_rcd_enq,
				
		// Debug Ports 
		
		dbg2ors_dbg_sel_a,
		dbg2ors_dbg_sel_b,
		ors2dbg_dbg_a,
		ors2dbg_dbg_b, 
		
		//Perf Counters

		ors2ics_perf_eq_mondos,
		ors2ics_perf_mondos,
		ors2ics_perf_msi,
		ors2ics_perf_eq_wr, 
		
		ors2dbg_idle,
		csr_sun4v_en
		
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
  //  Inputs to Out Record Sub-block     
  //------------------------------------------------------------------------
		
  input  [`FIRE_DLC_IOT_REC_WDTH-1:0]	scs2ors_rcd;
  input					scs2ors_rcd_sel;
	
		
  input  [`FIRE_DLC_IOT_ADDR_WDTH-1:0]	eqs2ors_eq_addr;   	
  input        				eqs2ors_sel;   		
		
 //------------------------------------------------------------------------
  //  Outputs to LRM    
  //------------------------------------------------------------------------
 
  output  [`FIRE_DLC_IOT_REC_WDTH-1:0]	im2rm_rcd;
  output				im2rm_rcd_enq;
 

  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2ors_dbg_sel_a;
  input [2:0] 					dbg2ors_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_b;
   
  //------------------------------------------------------------------------
  // Perf Counters   
  //------------------------------------------------------------------------
  output					ors2ics_perf_eq_mondos;
  output					ors2ics_perf_mondos;
  output					ors2ics_perf_msi;
  output					ors2ics_perf_eq_wr;
 
  //------------------------------------------------------------------------
  // Idle Checkers 
  //------------------------------------------------------------------------
  output					ors2dbg_idle;

  //------------------------------------------------------------------------
  // for sun4v eq address
  //------------------------------------------------------------------------
  input						csr_sun4v_en;

 
//############################################################################
//				PARAMETERS
//############################################################################

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************

//--------------------------
// Live Record Fields
//--------------------------
  wire 	[`FIRE_DLC_IOT_TYPE_WDTH-1:0]	in_type; 
  wire	[`FIRE_DLC_IOT_ADDR_WDTH-1:0]	in_address; 	

//-------------------------------------
// Signal to look at EQ lookup results
//-------------------------------------
  wire 					scs_addr_insert; 
  wire 					eqs_addr_insert; 
  wire 					addr_insert; 
  wire	[`FIRE_DLC_IOT_ADDR_WDTH-1:0]	out_address; 
  wire 	[`FIRE_DLC_IOT_TYPE_WDTH-1:0]	out_type; 
  wire					out_addr_mode;
  
  wire					pkt_is_msi; 
  wire					pkt_is_mes; 	
  wire					is_mondo_eq; 
  
//**************************************************
// Registers that Are Not Flops 
//**************************************************

//**************************************************
// Registers that Are Flops 
//**************************************************
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_b;
//-------------------------------------
// Out Record Fields
//-------------------------------------
  reg  [`FIRE_DLC_IOT_REC_WDTH-1:0]		im2rm_rcd;
  reg						im2rm_rcd_enq;
  
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
   // Need to make sure that EQS and SCS think record is an MSI or Message
   //and assert together
   
   //0in assert_together -leader scs_addr_insert -follower eqs_addr_insert -active (scs_addr_insert & scs2ors_rcd_sel)
   
   //Check Address format comming from EQS 
   
   //----------------------------------------
   // 63:19  - Base address  	    - 61:17
   // 18:13  - EQ		    - 16:11		
   // 12:6   - Tail pointer for EQ  - 10:4 
   // 5:2    - All zero's	    - 3:0
   //----------------------------------------

   //0in maximum -var eqs2ors_eq_addr[16:11] -val 35 
   
   
   
//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//--------------------------------
// Grab the Incomming Packet Type
//--------------------------------	

assign	in_type = scs2ors_rcd[`FIRE_DLC_IOT_TYPE_MSB:`FIRE_DLC_IOT_TYPE_LSB];	 


//----------------------------------
//Grab the Incomming Packet Address 
//----------------------------------	

assign in_address = scs2ors_rcd[`FIRE_DLC_IOT_ADDR_MSB:`FIRE_DLC_IOT_ADDR_LSB]; 


//**************************************************
// The address portion  
//**************************************************
//--------------------------------
// Check to See if the packet is
//	- MSI 
//	- Message
//--------------------------------	

assign pkt_is_msi =   in_type[`FIRE_DLC_IMU_OTYPE_DECODE_2] & 
		     !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_1] & 
		     !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_0]; 
		     
assign pkt_is_mes = !in_type[`FIRE_DLC_IMU_OTYPE_DECODE_2];

assign scs_addr_insert= pkt_is_msi | pkt_is_mes; 

//--------------------------------
// Check to See if the EQS thinks
// an address should be inserted
//--------------------------------
assign eqs_addr_insert = eqs2ors_sel; 

//--------------------------------
// Check to See if they both agree
// an address should be inserted
//--------------------------------
assign addr_insert = eqs_addr_insert & scs_addr_insert; 

//--------------------------------
// If the packet is
//	- MSI 
//	- Message
//
// Check to see if address is needed
// 	- if yes insert new addr
//	- if no use old address
//--------------------------------

//BP n2 12-12-05 
//	if sun4v mode & eqs_ors_addr[61]=1 & addr_insert force addr[61] to 1  or if
//	in sun4v mode and eqs_ors_addr[61] =0, the use the in_address[61] instead of the eqs2ors_eq_addr[61]
//	thus use the pipeline value going to devtsb of bit 61 because this bit and the bus number
//	are used in the devtsb lookup
//assign  out_address = addr_insert ? eqs2ors_eq_addr : in_address; 
assign  out_address[61] = (
			(csr_sun4v_en & addr_insert & pkt_is_mes) ? {1'b1} :
			(
			(csr_sun4v_en & addr_insert & pkt_is_msi & (eqs2ors_eq_addr[61]==1'b1)) ? 
				1'b1 : 
			( (csr_sun4v_en & addr_insert & pkt_is_msi & (eqs2ors_eq_addr[61]==1'b0)) ?
				in_address[61] :
				(addr_insert ? eqs2ors_eq_addr[61] : in_address[61]) ) 
			)	); 


assign  out_address[60:0] = (csr_sun4v_en & addr_insert & pkt_is_mes) ? {24'hfff800,eqs2ors_eq_addr[36:0]} :
				(
				addr_insert ? eqs2ors_eq_addr[60:0] : in_address[60:0]
				); 


//**************************************************
// The type portion  
//*************************************************

//--------------------------------
// If the packet is
//	- MSI 
//	- Message
//
// Use the upper bit of the EQ address
// to check if it is bypass mode or
// not. If set it is in by pass mode 
// and need to be set to a 1. 
//
// This chose 64 bit over 32 bit mode
//
//--------------------------------
assign out_addr_mode = eqs2ors_eq_addr[`FIRE_DLC_IOT_ADDR_WDTH-1];

assign out_type = addr_insert ? {in_type[6],out_addr_mode,in_type[4:0]} : in_type; 

//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2ors_dbg_sel_a or im2rm_rcd_enq or im2rm_rcd or scs2ors_rcd_sel or in_type or
	  pkt_is_msi or pkt_is_mes or scs_addr_insert or eqs_addr_insert or addr_insert) 
  begin
    case (dbg2ors_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {im2rm_rcd_enq, im2rm_rcd[`FIRE_DLC_IOT_TYPE_MSB:`FIRE_DLC_IOT_TYPE_LSB]};
      3'b001: n_dbg_a = {scs2ors_rcd_sel, in_type[6:0]};
      3'b010: n_dbg_a = {3'h0, pkt_is_msi, pkt_is_mes, scs_addr_insert, eqs_addr_insert, addr_insert};
      3'b011: n_dbg_a = 8'h00;
      3'b100: n_dbg_a = 8'h00;
      3'b101: n_dbg_a = 8'h00;
      3'b110: n_dbg_a = 8'h00;
      3'b111: n_dbg_a = 8'h00;
    endcase
  end

always @ (dbg2ors_dbg_sel_b or im2rm_rcd_enq or im2rm_rcd or scs2ors_rcd_sel or in_type or
	  pkt_is_msi or pkt_is_mes or scs_addr_insert or eqs_addr_insert or addr_insert) 
  begin
    case (dbg2ors_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {im2rm_rcd_enq, im2rm_rcd[`FIRE_DLC_IOT_TYPE_MSB:`FIRE_DLC_IOT_TYPE_LSB]};
      3'b001: n_dbg_b = {scs2ors_rcd_sel, in_type[6:0]};
      3'b010: n_dbg_b = {3'h0, pkt_is_msi, pkt_is_mes, scs_addr_insert, eqs_addr_insert, addr_insert};
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
   

assign ors2dbg_dbg_a = dbg_a; 
assign ors2dbg_dbg_b = dbg_b; 

//-----------------------------------------------------
//  Performace Counters 
//-----------------------------------------------------  

assign is_mondo_eq = (scs2ors_rcd[`FIRE_DLC_IOT_REQID_MSB-3:`FIRE_DLC_IOT_REQID_LSB+7] < 6'd60) &
                     (scs2ors_rcd[`FIRE_DLC_IOT_REQID_MSB-3:`FIRE_DLC_IOT_REQID_LSB+7] > 6'd23);

assign ors2ics_perf_eq_mondos = is_mondo_eq & out_type[`FIRE_DLC_IMU_OTYPE_DECODE_0] & scs2ors_rcd_sel; 

assign ors2ics_perf_mondos = out_type[`FIRE_DLC_IMU_OTYPE_DECODE_0] & scs2ors_rcd_sel; 

assign ors2ics_perf_msi    = pkt_is_msi & scs2ors_rcd_sel; 

assign ors2ics_perf_eq_wr  = (pkt_is_msi | pkt_is_mes) & scs2ors_rcd_sel; 

//------------------------------------------------------------------------
// Idle Checkers 
//------------------------------------------------------------------------
assign ors2dbg_idle = ~scs2ors_rcd_sel & ~im2rm_rcd_enq; 

 
//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   
//-----------------------------------------------------------------------------
// Delay all of the In Record infomrtaion to keep in step with the pipeline. 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       im2rm_rcd	<= {`FIRE_DLC_IOT_REC_WDTH{1'h0}}; 
       im2rm_rcd_enq	<= 1'h0; 
      end 		
  else 
      begin                   		                 
       im2rm_rcd  	<= {out_type,scs2ors_rcd[`FIRE_DLC_IOT_TC_MSB:`FIRE_DLC_IOT_DATA_LSB], out_address, scs2ors_rcd[`FIRE_DLC_IOT_DPTR_MSB:0]}; 
       im2rm_rcd_enq	<= scs2ors_rcd_sel; 
      end 		      
		

endmodule
