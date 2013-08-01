// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_mondo.v
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
module dmu_imu_rds_mondo (

		// Clock and Reset 

		clk,
		rst_l,
		
		// Static ID for IMU for Mondo's

		j2d_jid,		
		j2d_instance_id, 
		
		// Pipeline Input Select 
		
		pipe_select_in, 
		
		// Pipeline Output Select and Outputs

		pipe_select_out,
		mondo_d_ptr,
		mondo_jid
		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 		clk;
  input			rst_l; 
  
  
  //------------------------------------------------------------------------
  // Static ID for IMU for Mondo's
  //------------------------------------------------------------------------
  input	[`FIRE_J2D_JID_WDTH-1:0]		j2d_jid; 
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;


  //------------------------------------------------------------------------
  // Pipeline Input Select 
  //------------------------------------------------------------------------
  input			pipe_select_in;

  //------------------------------------------------------------------------
  // Pipeline Output Select and Outputs
  //------------------------------------------------------------------------
  output		pipe_select_out;
  output  [3:0]		mondo_d_ptr;
  output  [4:0]		mondo_jid; 
  
 


//############################################################################
//				PARAMETERS
//############################################################################
  
  parameter MONDO_FIRST_DPTR    =   4'b1100;
  parameter MONDO_LAST_DPTR    	=   4'b1111;




//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************
 
//**************************************************
// Registers that Are Not Flops 
//**************************************************
 reg  [4:0]	jid; 
  

//**************************************************
// Registers that Are Flops 
//************************************************** 
 reg		pipe_select_out;
 reg  [3:0]	mondo_d_ptr;
 reg  [4:0]	mondo_jid; 
 reg  [3:0]     dptr; 
 
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  //---------------------------------------------------------------------
  // Range Checkers  
  //---------------------------------------------------------------------
   
   //0in range -var dptr -min MONDO_FIRST_DPTR -max MONDO_LAST_DPTR
   //0in range -var jid  -min 5'h1c	       -max 5'h1f

    

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//--------------------------------------------------------------------------
// Use the ID from the JBC Core to select which ID to use for the Mondo
//--------------------------------------------------------------------------   

always @(j2d_jid or j2d_instance_id)
    begin 
      case ({j2d_jid,j2d_instance_id}) // synopsys parallel_case full_case infer_mux
        2'b00: jid  = 5'h1c; 
        2'b01: jid  = 5'h1d; 
        2'b10: jid  = 5'h1e; 
        2'b11: jid  = 5'h1f; 
      endcase
    end


//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

//--------------------------------------------------------------------------
// ALLOCATION of the DPTR for the MSI DIU RAM
//
//	- The RAM is 1K with 64 rows and holds 16 cachelines of data
//	- Space is alloctaed on cachline boundry
//	- 16 lines is 4 bits
// 	- C-F are dedicated to the Mondo (1100-1111)
// 	- Also need three other bits
//		- upper 2 MSB are to identify ram type in DIU
//			- 00     TLP
//			- 01     PIO
//			- 10     MSI/Mondo RAM 
//		- 1 extra bit to unify the read address space as TLP is 2K
//
//
// 	- Reset the value to the first RAM location 
//
//	- If new requests comes in advance the dptr in cicular fashion
//	- If no new request hold the value. 
//
//-------------------------------------------------------------------------- 

always @ (posedge clk)                          
  if (!rst_l)                                   
       dptr <= MONDO_FIRST_DPTR;                       
  else if (pipe_select_in) 
         begin
	   if(dptr == MONDO_LAST_DPTR)
	       dptr <= MONDO_FIRST_DPTR;
	   else
	        dptr <= dptr + 1;
	 end
  else 
       dptr <= dptr;     
       
//--------------------------------------------------------------------------
// FLOP THE OUTPUTS
//
//-------------------------------------------------------------------------- 

always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       pipe_select_out 	<= 1'b0;   
       mondo_jid	<= 5'h0;
       mondo_d_ptr	<= 4'h0; 
      end 		
  else 
      begin                   		                 
       pipe_select_out 	<= pipe_select_in;   
       mondo_jid	<= jid;
       mondo_d_ptr	<= dptr; 
      end 		
        
       

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


endmodule
