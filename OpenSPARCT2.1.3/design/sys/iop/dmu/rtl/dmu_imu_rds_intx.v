// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_intx.v
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
module dmu_imu_rds_intx (
		clk,
		rst_l,
		
		pipe_select_in, 		
		message_code, 
		
		pipe_select_out,
		rds2iss_intx_int_l,
		
		
		csrbus_valid,
                csrbus_done,
                csrbus_mapped,
                csrbus_wr_data,
                csrbus_wr,
                csrbus_read_data,
                csrbus_addr,
		csrbus_src_bus,
		csrbus_acc_vio,
		
		// Static ID Sel 
		
		j2d_instance_id
		
		
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
  //  Input Select Signals     
  //------------------------------------------------------------------------
  input			pipe_select_in;
  input	[7:0]		message_code; 
  
  //------------------------------------------------------------------------
  //  Output  Signals     
  //------------------------------------------------------------------------
  output		pipe_select_out;
  output  [3:0]		rds2iss_intx_int_l;
  
  

 //------------------------------------------------------------------------
  // PIO INTERFACE   
  //------------------------------------------------------------------------
  input         				csrbus_valid; 
  output        				csrbus_done;
  output        				csrbus_mapped; 
  
  input [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_wr_data; 
  input                                 	csrbus_wr; 
  
  output [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_read_data;
  
  input [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  	csrbus_addr;
  
  input [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]	csrbus_src_bus; 
  output                                	csrbus_acc_vio;   
  
  
  
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

 
 
  
//############################################################################
//				PARAMETERS
//############################################################################
  parameter ASSERT_A      =   8'b0010_0000;
  parameter ASSERT_B 	  =   8'b0010_0001;
  parameter ASSERT_C      =   8'b0010_0010;
  parameter ASSERT_D 	  =   8'b0010_0011;
  parameter DEASSERT_A    =   8'b0010_0100;
  parameter DEASSERT_B    =   8'b0010_0101;
  parameter DEASSERT_C    =   8'b0010_0110;
  parameter DEASSERT_D    =   8'b0010_0111;


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************
//--------------------------
// Interrupt Read Registers
//--------------------------   
  wire 		int_a_reg; 
  wire		int_b_reg; 
  wire		int_c_reg; 
  wire		int_d_reg; 


//--------------------------
// Supported Message Selects
//--------------------------   

  wire 		assert_a_sel; 
  wire 		deassert_a_sel; 
  wire 		assert_b_sel; 
  wire 		deassert_b_sel; 
  wire 		assert_c_sel; 
  wire 		deassert_c_sel;
  wire 		assert_d_sel; 
  wire 		deassert_d_sel; 
  
//--------------------------
// Signals to Update Flops
//--------------------------   
 
  wire 		load_int_a; 
  wire 		load_int_b;
  wire 		load_int_c;
  wire 		load_int_d;

  wire 		load_data_int_a;
  wire 		load_data_int_b;
  wire 		load_data_int_c;
  wire 		load_data_int_d;

  
//**************************************************
// Registers that Are Not Flops 
//**************************************************


//**************************************************
// Registers that Are Flops 
//************************************************** 
 reg		pipe_select_out;
  
 
 
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//--------------------------------------------------------------------------
// Decode the Supported Message Types 
//--------------------------------------------------------------------------  
assign assert_a_sel 	= (message_code == ASSERT_A); 
assign deassert_a_sel 	= (message_code == DEASSERT_A); 
assign assert_b_sel 	= (message_code == ASSERT_B); 
assign deassert_b_sel 	= (message_code == DEASSERT_B); 
assign assert_c_sel 	= (message_code == ASSERT_C); 
assign deassert_c_sel 	= (message_code == DEASSERT_C); 
assign assert_d_sel 	= (message_code == ASSERT_D); 
assign deassert_d_sel 	= (message_code == DEASSERT_D); 


//--------------------------------------------------------------------------
// Assign the Interrupt Signal for the INTX
//
//  	- Each bit is one of the ints a,b,c,d
// 	- If it is a "1" inetrrupts is needed
//	- Inverted to make active low 
//-------------------------------------------------------------------------- 

assign  rds2iss_intx_int_l = ~{int_d_reg,int_c_reg,int_b_reg,int_a_reg};

       
//--------------------------------------------------------------------------
// Logic to Update Value of the int_x_reg
//
//	- Get an assert set to 1
//	- Get a deassert set to 0
//
//-------------------------------------------------------------------------- 

assign load_int_a = pipe_select_in & (assert_a_sel | deassert_a_sel); 
assign load_int_b = pipe_select_in & (assert_b_sel | deassert_b_sel); 
assign load_int_c = pipe_select_in & (assert_c_sel | deassert_c_sel); 
assign load_int_d = pipe_select_in & (assert_d_sel | deassert_d_sel); 

assign load_data_int_a = assert_a_sel; 
assign load_data_int_b = assert_b_sel; 
assign load_data_int_c = assert_c_sel; 
assign load_data_int_d = assert_d_sel; 



//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

       
//--------------------------------------------------------------------------
// FLOP THE OUTPUTS
//
//-------------------------------------------------------------------------- 

always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       pipe_select_out 	<= 1'b0;   
      end 		
  else 
      begin                   		              
       pipe_select_out 	<= pipe_select_in;  // delay by one pipe stage 
      end 		
        
       

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


dmu_imu_rds_intx_csr csr (
   	.clk                                    (clk),
        .csrbus_valid                           (csrbus_valid),
        .csrbus_done                            (csrbus_done),
        .csrbus_mapped                          (csrbus_mapped),
        .csrbus_wr_data                         (csrbus_wr_data),
        .csrbus_wr                              (csrbus_wr),
        .csrbus_read_data                       (csrbus_read_data),
        .csrbus_addr                        	(csrbus_addr),
	.rst_l					(rst_l),
	
	.csrbus_src_bus				(csrbus_src_bus),
	.csrbus_acc_vio				(csrbus_acc_vio),
	.instance_id				(j2d_instance_id),

	.intx_status_reg_int_a_ext_read_data	(int_a_reg),
	.intx_status_reg_int_b_ext_read_data	(int_b_reg),
	.intx_status_reg_int_c_ext_read_data	(int_c_reg),
	.intx_status_reg_int_d_ext_read_data	(int_d_reg),
	
	.int_a_int_clr_reg_clr_hw_ld		(load_int_a),
	.int_a_int_clr_reg_clr_hw_write		(load_data_int_a),
	.int_a_int_clr_reg_clr_hw_read		(int_a_reg),
	
	.int_b_int_clr_reg_clr_hw_ld		(load_int_b),
	.int_b_int_clr_reg_clr_hw_write		(load_data_int_b),
	.int_b_int_clr_reg_clr_hw_read		(int_b_reg),
	
	.int_c_int_clr_reg_clr_hw_ld		(load_int_c),
	.int_c_int_clr_reg_clr_hw_write		(load_data_int_c),
	.int_c_int_clr_reg_clr_hw_read		(int_c_reg),
	
	.int_d_int_clr_reg_clr_hw_ld		(load_int_d),
	.int_d_int_clr_reg_clr_hw_write		(load_data_int_d),
	.int_d_int_clr_reg_clr_hw_read		(int_d_reg)
	
	
	);	


endmodule
