// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_irs.v
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
module dmu_imu_irs (

		// Clock and Reset 

		clk,
		rst_l,
		
		// Inputs to Record Header Queue from LRM
		
		rm2im_rcd,
		rm2im_rcd_enq, 
		
		
		//Record Header Queue Interface to RDS
		
		irs2rds_rcd, 
		rds2irs_rcd_deq,
		irs2rds_rcd_empty, 
		
		
		// Inputs to Record Data Queue from LRM 
		
		tm2im_data,
		tm2im_data_enq, 
		
		
		//Data Queue Interface to RDS
		
		irs2rds_data, 
		rds2irs_data_deq,
		irs2rds_data_empty, 
		
		
		// Debug Ports 
		
		dbg2irs_dbg_sel_a,
		dbg2irs_dbg_sel_b,
		irs2dbg_dbg_a,
		irs2dbg_dbg_b 
		
		
		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
   input           			clk;
   input           			rst_l; 
   
  //------------------------------------------------------------------------
  //  Inputs to Record Header Queue from LRM
  //------------------------------------------------------------------------

  input   [`FIRE_DLC_IIN_REC_WDTH-1:0] 	rm2im_rcd; 
  input           			rm2im_rcd_enq; 
 
  //------------------------------------------------------------------------
  //  Record Header Queue Interface to RDS 
  //------------------------------------------------------------------------

  output  [`FIRE_DLC_IIN_REC_WDTH-1:0]  irs2rds_rcd; 
  input           			rds2irs_rcd_deq; 
  output    	  			irs2rds_rcd_empty; 

  //------------------------------------------------------------------------
  //  Inputs to Record Data Queue from LRM 
  //------------------------------------------------------------------------

  input   [`FIRE_DLC_MDF_REC_WDTH-1:0]  tm2im_data; 
  input           			tm2im_data_enq; 
 
  //------------------------------------------------------------------------
  //  Data Queue Interface to RDS
  //------------------------------------------------------------------------

  output  [`FIRE_DLC_MDF_REC_WDTH-1:0]  irs2rds_data; 
  input           			rds2irs_data_deq; 
  output    				irs2rds_data_empty; 


  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2irs_dbg_sel_a;
  input [2:0] 					dbg2irs_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_b;


//######################## END PORT DECLARATIONS #############################
  
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

//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2irs_dbg_sel_a or rm2im_rcd_enq or rm2im_rcd or tm2im_data or tm2im_data_enq or 
	  rds2irs_rcd_deq or irs2rds_rcd_empty or rds2irs_data_deq or irs2rds_data_empty) 
  begin
    case (dbg2irs_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {rm2im_rcd_enq, rm2im_rcd[`FIRE_DLC_IIN_TYPE_MSB:`FIRE_DLC_IIN_TYPE_LSB]};
      3'b001: n_dbg_a = {rm2im_rcd[`FIRE_DLC_IIN_LRMTAG_MSB:`FIRE_DLC_IIN_LRMTAG_LSB]};
      3'b010: n_dbg_a = {tm2im_data[7:0]};
      3'b011: n_dbg_a = {tm2im_data[15:8]};
      3'b100: n_dbg_a = {2'h0, tm2im_data_enq, tm2im_data[16], rds2irs_rcd_deq, 
                         irs2rds_rcd_empty, rds2irs_data_deq, irs2rds_data_empty};
      3'b101: n_dbg_a = 8'h00;
      3'b110: n_dbg_a = 8'h00;
      3'b111: n_dbg_a = 8'h00;
    endcase
  end

always @ (dbg2irs_dbg_sel_b or rm2im_rcd_enq or rm2im_rcd or tm2im_data or tm2im_data_enq or 
	  rds2irs_rcd_deq or irs2rds_rcd_empty or rds2irs_data_deq or irs2rds_data_empty ) 
  begin
    case (dbg2irs_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {rm2im_rcd_enq, rm2im_rcd[`FIRE_DLC_IIN_TYPE_MSB:`FIRE_DLC_IIN_TYPE_LSB]};
      3'b001: n_dbg_b = {rm2im_rcd[`FIRE_DLC_IIN_LRMTAG_MSB:`FIRE_DLC_IIN_LRMTAG_LSB]};
      3'b010: n_dbg_b = {tm2im_data[7:0]};
      3'b011: n_dbg_b = {tm2im_data[15:8]};
      3'b100: n_dbg_b = {2'h0, tm2im_data_enq, tm2im_data[16], rds2irs_rcd_deq, 
                         irs2rds_rcd_empty, rds2irs_data_deq, irs2rds_data_empty};
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
   

assign irs2dbg_dbg_a = dbg_a; 
assign irs2dbg_dbg_b = dbg_b; 



//############################################################################
//  MODULE INSTANCIATION				
//############################################################################    


 //------------------------------------------------------------------------
 //  Header Fifo for All Commands Comming from LRM 
 //
 //        WIDTH - 131 bits
 //        DEPTH - 2 entries 
 //        PTR SIZE - 1 bits
 //
 //  Total Data storage  = 131 * 2 = 262 Flops
 //------------------------------------------------------------------------

 dmu_common_simple_fifo #(`FIRE_DLC_IIN_REC_WDTH,2'd2,1,1'd1) simple_fifo_header (
 
		.clk			(clk), 	
		.rst_l			(rst_l), 
		
		.data_in		(rm2im_rcd),  
		.write			(rm2im_rcd_enq), 
		
		.data_out		(irs2rds_rcd), 
		.read			(rds2irs_rcd_deq),  
		
		.fifo_full		(), 
		.fifo_almost_full	(), 

		.fifo_empty		(irs2rds_rcd_empty) 
		
               );
	       
//------------------------------------------------------------------------
 //  Data Fifo for MSI Commands Comming from LRM 
 //
 //        WIDTH - 17 bits
 //        DEPTH - 8 entries 
 //        PTR SIZE - 3 bits
 //
 //  Total Data storage  = 17 * 8 = 136 Flops
 //------------------------------------------------------------------------
 
 dmu_common_simple_fifo #(`FIRE_DLC_MDF_REC_WDTH,4'd8,3, 3'd7)  simple_fifo_data (
  
		.clk			(clk), 	
		.rst_l			(rst_l), 
		
		.data_in		(tm2im_data),  
		.write			(tm2im_data_enq), 
		
		.data_out		(irs2rds_data), 
		.read			(rds2irs_data_deq),  
		
		.fifo_full		(), 
		.fifo_almost_full	(), 

		.fifo_empty		(irs2rds_data_empty) 
		
               );


endmodule
