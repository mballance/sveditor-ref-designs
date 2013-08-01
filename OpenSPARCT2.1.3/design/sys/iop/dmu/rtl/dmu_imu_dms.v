// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_dms.v
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
module dmu_imu_dms (

		clk,
		rst_l,
		
		// Inputs from RDS
		
		rds2dms_data_sel,
		rds2dms_data,
		rds2dms_d_ptr,

		// Outputs to the DIU
		
		
		im2di_wr,
		im2di_addr,
		im2di_data,
		im2di_dpar,
		im2di_bmask		

		
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
  //  Inputs from RDS Sub-block Signals     
  //------------------------------------------------------------------------
  input					rds2dms_data_sel;
  input [127:0]				rds2dms_data;
  input	[3:0]				rds2dms_d_ptr; 
  
  
  
  //------------------------------------------------------------------------
  //  Outputs to DIU Block Signals     
  //------------------------------------------------------------------------
  
  output 				im2di_wr;
  output [`FIRE_DLC_IRD_ADDR_WDTH-1:0]	im2di_addr; 
  output [`FIRE_DLC_IRD_DATA_WDTH-1:0]	im2di_data;
  output [`FIRE_DLC_IRD_DPAR_WDTH-1:0]	im2di_dpar;
  output [`FIRE_DLC_IRD_BMASK_WDTH-1:0]	im2di_bmask; 		

  
  

//############################################################################
//				PARAMETERS
//############################################################################

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************

wire 					bmask_dpar; 
wire					quad_0_dpar; 
wire					quad_1_dpar; 
wire					quad_2_dpar; 
wire					quad_3_dpar; 

wire [`FIRE_DLC_IRD_DPAR_WDTH-1:0] 	rds2dms_dpar_del; 

//**************************************************
// Registers that Are Not Flops 
//**************************************************
wire [`FIRE_DLC_IRD_BMASK_WDTH-1:0]	im2di_bmask; 	

//**************************************************
// Registers that Are Flops 
//**************************************************
reg					rds2dms_data_sel_del;
reg [127:0]				rds2dms_data_del;
reg [3:0]				rds2dms_d_ptr_del; 

reg 					im2di_wr;
reg [`FIRE_DLC_IRD_ADDR_WDTH-1:0]	im2di_addr; 
reg [`FIRE_DLC_IRD_DATA_WDTH-1:0]	im2di_data;
reg [`FIRE_DLC_IRD_DPAR_WDTH-1:0]	im2di_dpar;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
 
    
//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//----------------------------------------------
// Outputs Bmask
//
//	- Since the 16 bytes of data is always
// 	  valid can just hard wire to 1
//
//	- Also the 1 parity bit can also be 
//	  hard wireed to 1 for odd parity
//----------------------------------------------
  	
assign   im2di_bmask = 16'hffff;
assign   bmask_dpar  = 1'b1; 
 
 
//----------------------------------------------
// Outputs Data Parity 
//
//	- calculate 1 bit of parity for every 32 
//	  bits of data
//
//	- Do this off of the delayed data 
//
//	- Assign output next value
//		- {data3--0, bmask}
//----------------------------------------------
 
assign  quad_3_dpar = !(^rds2dms_data_del[127:96]);
assign  quad_2_dpar = !(^rds2dms_data_del[95:64]);
assign  quad_1_dpar = !(^rds2dms_data_del[63:32]);
assign  quad_0_dpar = !(^rds2dms_data_del[31:0]);

assign  rds2dms_dpar_del = {quad_3_dpar, quad_2_dpar,  quad_1_dpar, quad_0_dpar, bmask_dpar};


//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

//-----------------------------------------------------------------------------
// Delay the Data Record from the RDS to match pipe delay  
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       rds2dms_data_del		<= 128'h0; 
       rds2dms_data_sel_del	<= 1'h0; 
       rds2dms_d_ptr_del	<= 4'h0;
      end 		
  else 
      begin                   		                 
       rds2dms_data_del  	<= rds2dms_data;        
       rds2dms_data_sel_del	<= rds2dms_data_sel;  
       rds2dms_d_ptr_del	<= rds2dms_d_ptr; 
      end 
      

//-----------------------------------------------------------------------------
// Flop the Outputs to the DIU Block 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       im2di_wr			<= 1'b0; 
       im2di_addr		<= {`FIRE_DLC_IRD_ADDR_WDTH{1'h0}}; 
       im2di_data		<= {`FIRE_DLC_IRD_DATA_WDTH{1'h0}};
       im2di_dpar		<= {`FIRE_DLC_IRD_DPAR_WDTH{1'h0}};
      end 		
  else 
      begin                   		                 
       im2di_wr			<= rds2dms_data_sel_del; 
       im2di_addr		<= rds2dms_d_ptr_del; 
       im2di_data		<= rds2dms_data_del;
       im2di_dpar		<= rds2dms_dpar_del;
      end 	           
      
endmodule
