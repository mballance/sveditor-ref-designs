// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_dbg.v
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
module dmu_imu_dbg (

		// Clock and Reset 

		clk,
                rst_l,
		  
		//  Block Level Selects and Output Ports     

		cr2im_dbg_sel_a,
   		cr2im_dbg_sel_b,
		
   		im2cr_dbg_a,
   		im2cr_dbg_b,
		
		//  Block Level Selects and Output Ports
		
		
		dbg2eqs_dbg_sel_a,
		dbg2eqs_dbg_sel_b,
		eqs2dbg_dbg_a,
		eqs2dbg_dbg_b,

		dbg2gcs_dbg_sel_a,
		dbg2gcs_dbg_sel_b,
		gcs2dbg_dbg_a,
		gcs2dbg_dbg_b,
		
		dbg2irs_dbg_sel_a,
		dbg2irs_dbg_sel_b,
		irs2dbg_dbg_a,
		irs2dbg_dbg_b,
		
		dbg2iss_dbg_sel_a,
		dbg2iss_dbg_sel_b,
		iss2dbg_dbg_a,
		iss2dbg_dbg_b,
		
		dbg2ors_dbg_sel_a,
		dbg2ors_dbg_sel_b,
		ors2dbg_dbg_a,
		ors2dbg_dbg_b,
		
		dbg2rds_dbg_sel_a,
		dbg2rds_dbg_sel_b,
		rds2dbg_dbg_a,
		rds2dbg_dbg_b,
		
		rss2dbg_dbg_a,
		rss2dbg_dbg_b,
		
		dbg2scs_dbg_sel_a,
		dbg2scs_dbg_sel_b,
		scs2dbg_dbg_a,
		scs2dbg_dbg_b, 
		
		//Idle Checkers 
		
		rds2dbg_idle, 
		ors2dbg_idle, 
		gcs2dbg_idle
		
		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################


  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 	clk;
  input 	rst_l;

  //------------------------------------------------------------------------
  //  Block Level Selects and Output Ports     
  //------------------------------------------------------------------------

  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2im_dbg_sel_a;
  input [`FIRE_DLC_DEBUG_SEL_WDTH-1:0]	      	cr2im_dbg_sel_b;
  
  output  [`FIRE_DEBUG_WDTH-1:0]	      	im2cr_dbg_a;
  output  [`FIRE_DEBUG_WDTH-1:0]		im2cr_dbg_b;
   
   
  //------------------------------------------------------------------------
  //  Block Level Selects and Output Ports
  //------------------------------------------------------------------------

  output [2:0] 					dbg2eqs_dbg_sel_a;
  output [2:0] 					dbg2eqs_dbg_sel_b;
  
  input   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_b;

  output [2:0] 					dbg2gcs_dbg_sel_a;
  output [2:0] 					dbg2gcs_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		gcs2dbg_dbg_b;
		
  output [2:0] 					dbg2irs_dbg_sel_a;
  output [2:0] 					dbg2irs_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		irs2dbg_dbg_b;
		
  output [2:0] 					dbg2iss_dbg_sel_a;
  output [2:0] 					dbg2iss_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_b;
		
  output [2:0] 					dbg2ors_dbg_sel_a;
  output [2:0] 					dbg2ors_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		ors2dbg_dbg_b;
		
  output [2:0] 					dbg2rds_dbg_sel_a;
  output [2:0] 					dbg2rds_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_b;
		
  input   [`FIRE_DEBUG_WDTH-1:0]		rss2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		rss2dbg_dbg_b;
		
  output [2:0] 					dbg2scs_dbg_sel_a;
  output [2:0] 					dbg2scs_dbg_sel_b;
  input   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_a;
  input   [`FIRE_DEBUG_WDTH-1:0]		scs2dbg_dbg_b;

  //------------------------------------------------------------------------
  //  Idle Checkers 
  //------------------------------------------------------------------------
		
  input						rds2dbg_idle; 
  input						ors2dbg_idle;
  input						gcs2dbg_idle;

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  //**************************************************
  // Wires 
  //**************************************************
  wire 						imu_idle; 
   
  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************
  reg   [`FIRE_DEBUG_WDTH-1:0]			n_im2cr_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0]			n_im2cr_dbg_b;

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg   [`FIRE_DEBUG_WDTH-1:0]			im2cr_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0]			im2cr_dbg_b;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		               COMBINATIONAL LOGIC 
//############################################################################   

assign dbg2eqs_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2eqs_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2gcs_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2gcs_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2irs_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2irs_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2iss_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2iss_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2ors_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2ors_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2rds_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2rds_dbg_sel_b = cr2im_dbg_sel_b[2:0];

assign dbg2scs_dbg_sel_a = cr2im_dbg_sel_a[2:0];
assign dbg2scs_dbg_sel_b = cr2im_dbg_sel_b[2:0];


always @ (cr2im_dbg_sel_a or eqs2dbg_dbg_a or gcs2dbg_dbg_a or irs2dbg_dbg_a or iss2dbg_dbg_a or
         ors2dbg_dbg_a or rds2dbg_dbg_a or rss2dbg_dbg_a or scs2dbg_dbg_a or imu_idle) 
  begin
    case (cr2im_dbg_sel_a[5:3]) // synopsys infer_mux
      3'b000: n_im2cr_dbg_a = eqs2dbg_dbg_a;
      3'b001: n_im2cr_dbg_a = gcs2dbg_dbg_a;
      3'b010: n_im2cr_dbg_a = irs2dbg_dbg_a;
      3'b011: n_im2cr_dbg_a = iss2dbg_dbg_a;
      3'b100: n_im2cr_dbg_a = ors2dbg_dbg_a;
      3'b101: n_im2cr_dbg_a = rds2dbg_dbg_a;
      3'b110: n_im2cr_dbg_a = {(rss2dbg_dbg_a[7] | imu_idle), rss2dbg_dbg_a[6:0]};
      3'b111: n_im2cr_dbg_a = scs2dbg_dbg_a;
    endcase
  end
  
  
always @ (cr2im_dbg_sel_b or eqs2dbg_dbg_b or gcs2dbg_dbg_b or irs2dbg_dbg_b or iss2dbg_dbg_b or
         ors2dbg_dbg_b or rds2dbg_dbg_b or rss2dbg_dbg_b or scs2dbg_dbg_b or imu_idle) 
  begin
    case (cr2im_dbg_sel_b[5:3]) // synopsys infer_mux
      3'b000: n_im2cr_dbg_b = eqs2dbg_dbg_b;
      3'b001: n_im2cr_dbg_b = gcs2dbg_dbg_b;
      3'b010: n_im2cr_dbg_b = irs2dbg_dbg_b;
      3'b011: n_im2cr_dbg_b = iss2dbg_dbg_b;
      3'b100: n_im2cr_dbg_b = ors2dbg_dbg_b;
      3'b101: n_im2cr_dbg_b = rds2dbg_dbg_b;
      3'b110: n_im2cr_dbg_b = {(rss2dbg_dbg_b[7] | imu_idle), rss2dbg_dbg_b[6:0]};
      3'b111: n_im2cr_dbg_b = scs2dbg_dbg_b;
    endcase
  end  
 
  
always @ (posedge clk)
     begin 
     if (!rst_l) begin
      im2cr_dbg_a <= 8'b0;
      im2cr_dbg_b <= 8'b0;
     end
     else begin
      im2cr_dbg_a <= n_im2cr_dbg_a;
      im2cr_dbg_b <= n_im2cr_dbg_b;
     end   
     end   
//------------------------------------------------------------------------
//  Idle Checkers 
//------------------------------------------------------------------------   
assign imu_idle = rds2dbg_idle & ors2dbg_idle & gcs2dbg_idle;
  
//############################################################################
//		              SEQUENTIAL LOGIC 
//############################################################################   
	

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


endmodule





