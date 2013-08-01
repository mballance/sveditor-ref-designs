// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_msi.v
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
module dmu_imu_rds_msi (
		clk,
		rst_l,
		
		pipe_select_in, 		
		msi_data, 
		msi_error,
		
		pipe_select_out,
		header_good, 
		msi_eq_num,
		
		msi_not_enabled_error,
		
		sw_mondo_data_0,
		sw_mondo_data_1,
		
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
  input	[7:0]		msi_data; 
  input			msi_error; 
  
  //------------------------------------------------------------------------
  //  Output  Signals     
  //------------------------------------------------------------------------
  output				pipe_select_out;
  output				header_good; 
  output  [5:0]				msi_eq_num;

  output				msi_not_enabled_error;


  output  [`FIRE_CSR_DATA_WIDTH-7:0] 	sw_mondo_data_0;  
  output  [`FIRE_CSR_DATA_WIDTH-1:0] 	sw_mondo_data_1; 

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
  output					csrbus_acc_vio; 
  
  
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;


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
// SW Signal for CSRTOOl
//-------------------------- 
  wire 	[7:0]   sw_addr; 	// SW address comming out of CSRTool to address 256 rows
  wire 		sw_wr; 		// SW write enable signal 
  wire 		sw_map_select; 	// SW Select signal comming from CSRTool to say a PIO acesss is happening; 
  wire 		sw_clr_select; 	// SW Select signal comming from CSRTool to say a PIO acesss is happening; 

  
  wire	[63:0]	sw_map_rd_data; 	// SW Data Bus from CSRTool 
  wire	[63:0]	sw_clr_rd_data; 	// SW Data Bus from CSRTool 

  wire 	[5:0]	sw_eq_num_wr_data; 	// Portion of the data bus thats these bits use for eq num 
  wire		sw_v_wr_data; 		// Portion of the data bus thats these bits use for valid bit
  wire		sw_ok_2_wr_wr_data; 	// Portion of the data bus thats these bits use for ok 2 wr bit
  
  wire 	[5:0]	sw_eq_num_rd_data; 	// Portion of the data bus thats these bits use for eq num 
  wire		sw_v_rd_data; 		// Portion of the data bus thats these bits use for valid bit
  wire		sw_ok_2_wr_rd_data; 	// Portion of the data bus thats these bits use for ok 2 wr bit
  
  
//--------------------------
// HW Address Signal
//--------------------------   
  wire 	[7:0]   hw_msi_addr; 	// HW address comming out the lower 8 bits of msi data
  //wire 		header_error; 
  wire		n_header_good; 
  wire	[5:0]	n_msi_eq_num; 
  wire		n_msi_not_enabled_error;
  wire		hw_set_ok_2_wr;
  wire [255:0]	n_msi_ok_2_wr; 


//**************************************************
// Registers that Are Not Flops 
//**************************************************

//**************************************************
// Registers that Are Flops 
//**************************************************
 reg [255:0]	msi_ok_2_wr; 
 reg [255:0] 	msi_valid; 
 reg [255:0]    msi_eq_num_0; 
 reg [255:0]    msi_eq_num_1; 
 reg [255:0]    msi_eq_num_2; 
 reg [255:0]    msi_eq_num_3; 
 reg [255:0]    msi_eq_num_4; 
 reg [255:0]    msi_eq_num_5; 
 
 reg [255:0]    msi_clr_vector; 
 reg [255:0]    msi_set_vector; 

 
 reg		pipe_select_out;
 reg		header_good; 
 
 reg  [5:0]	msi_eq_num;
 reg		msi_not_enabled_error; 
 
 
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
  
//--------------------------------------------------------------------------
// Mux the proper bits for the Read Paths 
//
// 	- Since there are 256 possible MSI's we need to mux the proper one
//	  from the SW address
//
//	- Need to do this for all 3 components of the MSI state 
//		- valid bit
//		- ok to write bit
//		- EQ number  
//--------------------------------------------------------------------------  
  assign sw_v_rd_data 		= msi_valid[sw_addr]; 
  assign sw_ok_2_wr_rd_data 	= msi_ok_2_wr[sw_addr]; 
  assign sw_eq_num_rd_data 	= {msi_eq_num_5[sw_addr],msi_eq_num_4[sw_addr], msi_eq_num_3[sw_addr], 
  				   msi_eq_num_2[sw_addr],msi_eq_num_1[sw_addr], msi_eq_num_0[sw_addr]}; 

   
//--------------------------------------------------------------------------
// Build up the PIO Data Read Bus 
// 	
//	- We have two possible read data paths 
//		- msi mapping register 
//		- msi clear register 
//--------------------------------------------------------------------------   
  assign sw_map_rd_data = {sw_v_rd_data, sw_ok_2_wr_rd_data, 56'h0,sw_eq_num_rd_data};
  assign sw_clr_rd_data = {1'b0, sw_ok_2_wr_rd_data, 62'h0};

  
//--------------------------------------------------------------------------
// Assign the HW signals used for MSI look up 
//
//	- We use the msi data as the address for the MSI lookup 
//
//	-In HW, if MSI was ok to write (1'b0) we need to set so it is not 
//	 ok to write next time through 
//		- If header was good, neeed to set this bit  
//-------------------------------------------------------------------------- 
 
 assign hw_msi_addr = msi_data; 
 
 assign hw_set_ok_2_wr = n_header_good; 
 
//--------------------------------------------------------------------------
// Get the outputs Ready to be flopped
//
//  - Determine if the Header is Good 
//	- The header is good if:
//		- pipe stage was selected
//		- msi is valid (as set by SW) for msi now in pipe
//			- Done by the mux set up above
//				- Using hw_msi_addr as select line
//		- msi is ok to write (1'b0)
//
//  - Determin if the Value of the EQ 
//	- Done by the mux set up above
//		- Using hw_msi_addr as select line
//
//--------------------------------------------------------------------------  
 
 assign n_header_good =  pipe_select_in & ~msi_ok_2_wr[hw_msi_addr] & msi_valid[hw_msi_addr] & ~msi_error; 
 
 assign n_msi_eq_num  =  {msi_eq_num_5[hw_msi_addr],msi_eq_num_4[hw_msi_addr], msi_eq_num_3[hw_msi_addr],
 			    msi_eq_num_2[hw_msi_addr],msi_eq_num_1[hw_msi_addr], msi_eq_num_0[hw_msi_addr]};

 assign n_msi_not_enabled_error =  pipe_select_in & ~msi_valid[hw_msi_addr];
 
//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

//--------------------------------------------------------------------------
// MSI VAlID BITS
//   - 1 bit
//   - Says if MSI is enabled by software
//   - SW has Read/ Write Access
//   - HW has read Only
//-------------------------------------------------------------------------- 

always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_valid <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_valid[sw_addr] <=  sw_v_wr_data; 
  else 
       msi_valid <= msi_valid;			// Hold the Value. 
       
       
//--------------------------------------------------------------------------
// EQ NUMBER BITS
//   - 6 bit
//   - Says what EQ the MSI should go to 
//   - SW has Read/ Write Access
//   - HW has read Only
//-------------------------------------------------------------------------- 

always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_0 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_0[sw_addr] <=  sw_eq_num_wr_data[0]; 
  else 
       msi_eq_num_0 <= msi_eq_num_0;		// Hold the Value. 

                    
 always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_1 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_1[sw_addr] <=  sw_eq_num_wr_data[1]; 
  else 
       msi_eq_num_1 <= msi_eq_num_1;		// Hold the Value. 

       
 always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_2 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_2[sw_addr] <=  sw_eq_num_wr_data[2]; 
  else 
       msi_eq_num_2 <= msi_eq_num_2;		// Hold the Value. 
                                 
 always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_3 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_3[sw_addr] <=  sw_eq_num_wr_data[3]; 
  else 
       msi_eq_num_3 <= msi_eq_num_3;		// Hold the Value.       
       
 always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_4 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_4[sw_addr] <=  sw_eq_num_wr_data[4]; 
  else 
       msi_eq_num_4 <= msi_eq_num_4;		//  Hold the Value.      
             
  always @ (posedge clk)                         
  if (!rst_l)                  			// At reset reset all of them to zero.                  
       msi_eq_num_5 <= 256'h0;   		
  else if (sw_map_select & sw_wr) 		// If SW does a PIO Wr update the value with the new bit
        msi_eq_num_5[sw_addr] <=  sw_eq_num_wr_data[5]; 
  else 
       msi_eq_num_5 <= msi_eq_num_5;		//  Hold the Value.     
            
       
       
       
//--------------------------------------------------------------------------
// MSI OK 2 WR BITS
//   - 1 bit
//   - Says if MSI is ok to write to EQ and not a duplicate
//   - O = OK to write   1 = not ok to write
//   - SW has Read / Write Access
//   - HW has Read / Write Access
//-------------------------------------------------------------------------- 

always @ (sw_clr_select or sw_wr or sw_ok_2_wr_wr_data or sw_addr)
    begin 
        msi_clr_vector          = 256'h0;
	msi_clr_vector[sw_addr] = sw_clr_select & sw_wr & sw_ok_2_wr_wr_data; 
    end
    
always @ (hw_set_ok_2_wr or  hw_msi_addr) 
    begin 
        msi_set_vector              = 256'h0; 
	msi_set_vector[hw_msi_addr] = hw_set_ok_2_wr;
    end

     
assign n_msi_ok_2_wr = (msi_ok_2_wr | msi_set_vector)  & ~msi_clr_vector; 

always @ (posedge clk)                         
  if (!rst_l)                  					// At reset reset all of them to zero.                  
       msi_ok_2_wr <= 256'h0;   		
  else 
       msi_ok_2_wr <= n_msi_ok_2_wr;				// Hold the Value. 
             
       
//--------------------------------------------------------------------------
// FLOP THE OUTPUTS
//
//-------------------------------------------------------------------------- 

always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       pipe_select_out 		<= 1'b0;   
       header_good 		<= 1'b0;
       msi_eq_num		<= 6'h0; 
       msi_not_enabled_error 	<= 1'b0;
      end 		
  else 
      begin                   		// At reset reset all of them to zero.                  
       pipe_select_out 		<= pipe_select_in;   
       header_good 		<= n_header_good;
       msi_eq_num		<= n_msi_eq_num; 
       msi_not_enabled_error	<= n_msi_not_enabled_error;
      end 		
        
       

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


dmu_imu_rds_msi_csr csr (
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

	.ext_addr				(sw_addr),
	.ext_wr					(sw_wr),
	
	.msi_mapping_v_ext_wr_data		(sw_v_wr_data),
	.msi_mapping_eqnum_ext_wr_data		(sw_eq_num_wr_data),
	.msi_clear_reg_eqwr_n_ext_wr_data	(sw_ok_2_wr_wr_data),
	
	.msi_mapping_ext_select			(sw_map_select),
	.msi_mapping_ext_read_data		(sw_map_rd_data),
	
	.msi_clear_reg_ext_select		(sw_clr_select),
	.msi_clear_reg_ext_read_data		(sw_clr_rd_data),
		

	.int_mondo_data_0_reg_data_hw_read	(sw_mondo_data_0),
	.int_mondo_data_1_reg_hw_read		(sw_mondo_data_1)
	);	



endmodule
