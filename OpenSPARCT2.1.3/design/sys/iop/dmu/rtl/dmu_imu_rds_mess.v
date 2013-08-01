// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_mess.v
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
module dmu_imu_rds_mess (
		clk,
		rst_l,
		
		pipe_select_in, 		
		message_code, 
		
		pipe_select_out,
		header_good, 
		message_eq_num,
		
		rds2ics_pmeack_mes_not_en_error,
		rds2ics_pmpme_mes_not_en_error,
		rds2ics_fatal_mes_not_en_error,
		rds2ics_nonfatal_mes_not_en_error,
		rds2ics_cor_mes_not_en_error,		
		
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
  output		header_good; 
  output  [5:0]		message_eq_num;
  
  
  output		rds2ics_pmeack_mes_not_en_error;
  output		rds2ics_pmpme_mes_not_en_error;
  output		rds2ics_fatal_mes_not_en_error;
  output		rds2ics_nonfatal_mes_not_en_error;
  output		rds2ics_cor_mes_not_en_error;  

 //------------------------------------------------------------------------
  // PIO INTERFACE   
  //------------------------------------------------------------------------
  input         				csrbus_valid; 
  output        				csrbus_done;
  output        				csrbus_mapped; 
  
   
  input  [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_wr_data; 
  input                                 	csrbus_wr; 
  
  output [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_read_data;
  
  input  [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  	csrbus_addr;
       
  input  [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]	csrbus_src_bus; 
  output					csrbus_acc_vio; 
  
  
  
  input	 [`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

 
  
//############################################################################
//				PARAMETERS
//############################################################################
  parameter ERR_COR_CODE    	 =   8'b0011_0000;
  parameter ERR_NONFATAL_CODE 	 =   8'b0011_0001;
  parameter ERR_FATAL_CODE 	 =   8'b0011_0011;
  parameter PM_PME_CODE 	 =   8'b0001_1000;
  parameter PME_TO_ACK_CODE 	 =   8'b0001_1011;



//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************


//--------------------------
// Unsupported Message Signals
//--------------------------   
  wire 		unsupported_valid; 
  wire 	[5:0]	unsupported_eq; 

//--------------------------
// Message Signals
//-------------------------- 
  wire 	[7:0]	message_valid; 
  wire 	[7:0]	message_eq_bit_5; 
  wire 	[7:0]	message_eq_bit_4; 
  wire 	[7:0]	message_eq_bit_3; 
  wire 	[7:0]	message_eq_bit_2; 
  wire 	[7:0]	message_eq_bit_1; 
  wire 	[7:0]	message_eq_bit_0; 

//--------------------------
// Supported Message Selects
//--------------------------   

  wire 		err_corr_sel; 
  wire 		err_nonfatal_sel; 
  wire 		err_fatal_sel; 
  wire 		pm_pme_sel; 
  wire		pme_to_ack_sel; 
 
  wire 	[4:0]   supported_sel; 

//--------------------------
// Supported Message Valid
//--------------------------   

  wire 		err_corr_valid; 
  wire 		err_nonfatal_valid; 
  wire 		err_fatal_valid; 
  wire 		pm_pme_valid; 
  wire 		pme_to_ack_valid; 

//--------------------------
// Supported Message EQ Num
//--------------------------   
 
  wire 	[5:0]	 err_corr_eq; 
  wire  [5:0]	 err_nonfatal_eq; 
  wire 	[5:0]	 err_fatal_eq; 
  wire 	[5:0]	 pm_pme_eq; 
  wire 	[5:0]	 pme_to_ack_eq; 
 
//--------------------------
// HW Address Signal
//--------------------------   
  //wire 		header_error; 
  wire		n_header_good; 
  wire	[5:0]	n_message_eq_num; 
  wire		n_rds2ics_pmeack_mes_not_en_error;
  wire		n_rds2ics_pmpme_mes_not_en_error;
  wire		n_rds2ics_fatal_mes_not_en_error;
  wire		n_rds2ics_nonfatal_mes_not_en_error;
  wire		n_rds2ics_cor_mes_not_en_error; 
     
//**************************************************
// Registers that Are Not Flops 
//**************************************************

 reg  [2:0]	message_sel;

//**************************************************
// Registers that Are Flops 
//************************************************** 
 reg		pipe_select_out;
 reg		header_good; 
 reg  [5:0]	message_eq_num;
 reg		rds2ics_pmeack_mes_not_en_error;
 reg		rds2ics_pmpme_mes_not_en_error;
 reg		rds2ics_fatal_mes_not_en_error;
 reg		rds2ics_nonfatal_mes_not_en_error;
 reg		rds2ics_cor_mes_not_en_error;   
 
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
  //---------------------------------------------------
  // One Hot Message Decodes
  //---------------------------------------------------
  
    //0in bits_on -var  supported_sel   -max 1

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//--------------------------------------------------------------------------
// Decode the Supported Message Types 
//--------------------------------------------------------------------------  
assign err_corr_sel 		= pipe_select_in & (message_code == ERR_COR_CODE); 
assign err_nonfatal_sel 	= pipe_select_in & (message_code == ERR_NONFATAL_CODE); 
assign err_fatal_sel 		= pipe_select_in & (message_code == ERR_FATAL_CODE); 
assign pm_pme_sel 		= pipe_select_in & (message_code == PM_PME_CODE); 
assign pme_to_ack_sel 		= pipe_select_in & (message_code == PME_TO_ACK_CODE); 

assign supported_sel		= {err_corr_sel, err_nonfatal_sel, err_fatal_sel, pm_pme_sel, pme_to_ack_sel};

//--------------------------------------------------------------------------
// Unsupported Valid and EQ
// 
//  Since all unsuported messages are dropped silently 
//  the following two signal are used as the defaults when 
//  a non valid message is received
//
//  - the unsupported_valid signal is used to make the header NOT good
//  - the unsupported_eq sets the EQ to a default value of zero 
//--------------------------------------------------------------------------  
assign unsupported_valid = 1'b0; 
assign unsupported_eq = 6'h0; 

//--------------------------------------------------------------------------
// Encode Supported Messages and Unsupported Messages 
//
// Turn the supported messages and unsupported  message into a encoded number
//	- atten_but_press_sel 	= 0 
//	- pme_to_ack_sel	= 1
//	- pm_pme_sel		= 2
//	- err_fatal_sel		= 3
//	- err_nonfatal_sel	= 4
//	- err_corr_sel		= 5
//
//	- all unsupported 	= 6
//--------------------------------------------------------------------------   

always @(supported_sel)
    begin 
      case (supported_sel)
        5'b00001: message_sel  = 3'h0; 	// pme_to_ack_sel
        5'b00010: message_sel  = 3'h1; 	// pm_pme_sel
        5'b00100: message_sel  = 3'h2; 	// err_fatal_sel
        5'b01000: message_sel  = 3'h3; 	// err_nonfatal_sel
        5'b10000: message_sel  = 3'h4; 	// err_corr_sel
	 default: message_sel  = 3'h5;  // unsuported 
       endcase
     end
     	 
	 
//--------------------------------------------------------------------------
// Concatenate the valid and eq number data 
//
//	- Since we support 36 EQ's this takes 6 bits when encoded
//	- Each Message can be rounted to any of those EQ's depending 
//	  on the SW programmed value
//
// 	- Since we support 6 messages + unsupported we have 7 EQ's to
//	 choose from
//
//	- Below is code to set up each of the 6 EQ bits with 1 of 7 possible
//	  selections
//
//	- This code will be used as a mux later on based on the selected 
//        message
//
// 	- The same is done for the valid signals 
//--------------------------------------------------------------------------   
assign message_valid = {2'h0,unsupported_valid, err_corr_valid, err_nonfatal_valid, err_fatal_valid,
		        pm_pme_valid, pme_to_ack_valid}; 

assign message_eq_bit_5  = {2'h0,unsupported_eq[5], err_corr_eq[5], err_nonfatal_eq[5], err_fatal_eq[5],
 		            pm_pme_eq[5], pme_to_ack_eq[5]}; 
			    						
assign message_eq_bit_4  = {2'h0,unsupported_eq[4], err_corr_eq[4], err_nonfatal_eq[4], err_fatal_eq[4],
 		            pm_pme_eq[4], pme_to_ack_eq[4]}; 
			    
assign message_eq_bit_3  = {2'h0,unsupported_eq[3], err_corr_eq[3], err_nonfatal_eq[3], err_fatal_eq[3],
 		            pm_pme_eq[3], pme_to_ack_eq[3]}; 
			    
assign message_eq_bit_2  = {2'h0,unsupported_eq[2], err_corr_eq[2], err_nonfatal_eq[2], err_fatal_eq[2],
 		            pm_pme_eq[2], pme_to_ack_eq[2]}; 
			    
assign message_eq_bit_1  = {2'h0,unsupported_eq[1], err_corr_eq[1], err_nonfatal_eq[1], err_fatal_eq[1],
 		            pm_pme_eq[1], pme_to_ack_eq[1]}; 
			    									
assign message_eq_bit_0  = {2'h0,unsupported_eq[0], err_corr_eq[0], err_nonfatal_eq[0], err_fatal_eq[0],
 		            pm_pme_eq[0], pme_to_ack_eq[0]}; 
			    

//--------------------------------------------------------------------------
// Get the outputs Ready to be flopped. 
//
//  - Determine if the Header is Good 
//	- The header is good if:
//		- pipe stage was selected
//		- message is valid (as set by SW) for message now in pipe
//			- Done by the mux set up above
//				- Using message_sel as select line
//			- Unsupported are always invalid
//
//  - Determin if the Value of the EQ 
//	- Done by the mux set up above
//		- Using message_sel as select line
//  		- Unsupported are always EQ 0
//
//--------------------------------------------------------------------------  
 
 assign n_header_good =  pipe_select_in & message_valid[message_sel]; 
 
 assign n_message_eq_num  = {message_eq_bit_5[message_sel],message_eq_bit_4[message_sel],message_eq_bit_3[message_sel],
 		               message_eq_bit_2[message_sel],message_eq_bit_1[message_sel],message_eq_bit_0[message_sel]};


 assign n_rds2ics_pmeack_mes_not_en_error	= pipe_select_in & ~message_valid[0] & (message_sel == 3'h0);
 assign n_rds2ics_pmpme_mes_not_en_error	= pipe_select_in & ~message_valid[1] & (message_sel == 3'h1);
 assign n_rds2ics_fatal_mes_not_en_error	= pipe_select_in & ~message_valid[2] & (message_sel == 3'h2);
 assign n_rds2ics_nonfatal_mes_not_en_error	= pipe_select_in & ~message_valid[3] & (message_sel == 3'h3);
 assign n_rds2ics_cor_mes_not_en_error		= pipe_select_in & ~message_valid[4] & (message_sel == 3'h4); 
 
 
 
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
       	pipe_select_out 			<= 1'b0;   
       	header_good 				<= 1'b0;
       	message_eq_num				<= 6'h0;
	rds2ics_pmeack_mes_not_en_error 	<= 1'b0;
	rds2ics_pmpme_mes_not_en_error 		<= 1'b0;
	rds2ics_fatal_mes_not_en_error 		<= 1'b0;
	rds2ics_nonfatal_mes_not_en_error 	<= 1'b0;
	rds2ics_cor_mes_not_en_error  		<= 1'b0;     
       end 		
  else 
      begin                   		                 
       	pipe_select_out 			<= pipe_select_in;   
       	header_good 				<= n_header_good;
       	message_eq_num				<= n_message_eq_num; 
      	rds2ics_pmeack_mes_not_en_error 	<= n_rds2ics_pmeack_mes_not_en_error;
	rds2ics_pmpme_mes_not_en_error 		<= n_rds2ics_pmpme_mes_not_en_error;
	rds2ics_fatal_mes_not_en_error 		<= n_rds2ics_fatal_mes_not_en_error;
	rds2ics_nonfatal_mes_not_en_error 	<= n_rds2ics_nonfatal_mes_not_en_error;
	rds2ics_cor_mes_not_en_error  		<= n_rds2ics_cor_mes_not_en_error;     
      end 		
        
       

//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    


dmu_imu_rds_mess_csr csr (

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

	.err_cor_mapping_v_hw_read		(err_corr_valid),
	.err_cor_mapping_eqnum_hw_read		(err_corr_eq),
	.err_nonfatal_mapping_v_hw_read		(err_nonfatal_valid),
	.err_nonfatal_mapping_eqnum_hw_read	(err_nonfatal_eq),
	.err_fatal_mapping_v_hw_read		(err_fatal_valid),
	.err_fatal_mapping_eqnum_hw_read	(err_fatal_eq),
	.pm_pme_mapping_v_hw_read		(pm_pme_valid),
	.pm_pme_mapping_eqnum_hw_read		(pm_pme_eq),
	.pme_to_ack_mapping_v_hw_read		(pme_to_ack_valid),
	.pme_to_ack_mapping_eqnum_hw_read	(pme_to_ack_eq)
	);	


endmodule
