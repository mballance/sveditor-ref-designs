// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs.v
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
module dmu_imu_eqs (

		// Clock and Reset 

		clk,
		rst_l,	
		
		// EQ Int signals Outputs to the ISS 
		
		eqs2iss_eq_int_l,	
		
		// EQ Lookup Request Inputs from the RDS

		rds2eqs_eq_sel,
		rds2eqs_eq,
		
		// EQ Lookup Results to the SCS
	
		eqs2scs_eq_ok,
		eqs2scs_eq_not_en,
		
		// EQ Lookup Address to the ORS
				
		eqs2ors_eq_addr,
		eqs2ors_sel,

		// BP 7-25-06 n2 bug 118163
		eq_base_address_63,
		               
		// Error Interupt
		 			       
		eqs2ics_eq_over_error,	       
		eqs2ics_error_data,	       
      
			       
		// CSR Bus Signals 
		
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

		j2d_instance_id, 
		
		
		// Debug Ports 
		
		dbg2eqs_dbg_sel_a,
		dbg2eqs_dbg_sel_b,
		eqs2dbg_dbg_a,
		eqs2dbg_dbg_b

		
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
  //  EQ Int signals Outputs to the ISS 
  //------------------------------------------------------------------------
  output [35:0]				eqs2iss_eq_int_l;
     
  //------------------------------------------------------------------------
  // EQ Lookup Request Inputs from the RDS
  //------------------------------------------------------------------------
  input  [5:0]				rds2eqs_eq; 
  input					rds2eqs_eq_sel; 
  
  //------------------------------------------------------------------------
  // EQ Lookup Results to the SCS
  //------------------------------------------------------------------------  
  output				eqs2scs_eq_ok; 
  output				eqs2scs_eq_not_en;
  
 
  //------------------------------------------------------------------------
  // EQ Lookup Address to the ORS
  //------------------------------------------------------------------------
  
  output [61:0] 			eqs2ors_eq_addr;   
  output       				eqs2ors_sel;   

//BP N2 bu 118163 7-24-06
  output				eq_base_address_63;

  output				eqs2ics_eq_over_error;
  output [63:0]				eqs2ics_error_data;

  //------------------------------------------------------------------------
  // CSR Bus Signals   
  //------------------------------------------------------------------------
  input 					csrbus_valid; 
  output        				csrbus_done;
  output					csrbus_mapped; 

  input [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_wr_data; 
  input                                 	csrbus_wr; 
  
  output [`FIRE_CSR_DATA_WIDTH-1:0]      	csrbus_read_data;
  
  input [`FIRE_CSR_ADDR_MAX_WIDTH-1:0]  	csrbus_addr;
       
  input [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]	csrbus_src_bus; 
  output					csrbus_acc_vio; 

  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2eqs_dbg_sel_a;
  input [2:0] 					dbg2eqs_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		eqs2dbg_dbg_b;

//############################################################################
//                              PARAMETERS
//############################################################################  

  //------------------------------------------------------------------------
  //  Parameters for the Value of the FSM States
  //------------------------------------------------------------------------
  parameter     IDLE            = 0;               
  parameter     ACTIVE          = 1;               
  //parameter     ERROR           = 3;       

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  //**************************************************
  // Wires 
  //************************************************** 
  wire		eq_base_address_63;
  
  //------------------------------------------------------------------------
  // Wires for the CSR access 
  //------------------------------------------------------------------------
   wire    	ext_wr; 		 
   wire 	set_enoverr_ext_wr_data;
   wire		clr_coverr_ext_wr_data; 
   wire 	clr_e2i_ext_wr_data; 
   wire		set_en_ext_wr_data;
    

  //-------------
  //HEAD POINTER 
  //-------------
  wire 	[6:0] 	h_ptr_0, h_ptr_1, h_ptr_2, h_ptr_3, h_ptr_4, h_ptr_5, h_ptr_6, h_ptr_7; 
  wire 	[6:0] 	h_ptr_8, h_ptr_9, h_ptr_10, h_ptr_11, h_ptr_12, h_ptr_13, h_ptr_14, h_ptr_15; 
  wire 	[6:0] 	h_ptr_16, h_ptr_17, h_ptr_18, h_ptr_19, h_ptr_20, h_ptr_21, h_ptr_22, h_ptr_23; 
  wire 	[6:0] 	h_ptr_24, h_ptr_25, h_ptr_26, h_ptr_27, h_ptr_28, h_ptr_29, h_ptr_30, h_ptr_31; 
  wire 	[6:0] 	h_ptr_32, h_ptr_33, h_ptr_34, h_ptr_35; 
 
  //-------------
  //TAIL POINTER 
  //-------------
  wire 	[6:0] 	t_ptr_0, t_ptr_1, t_ptr_2, t_ptr_3, t_ptr_4, t_ptr_5, t_ptr_6, t_ptr_7; 
  wire 	[6:0] 	t_ptr_8, t_ptr_9, t_ptr_10, t_ptr_11, t_ptr_12, t_ptr_13, t_ptr_14, t_ptr_15; 
  wire 	[6:0] 	t_ptr_16, t_ptr_17, t_ptr_18, t_ptr_19, t_ptr_20, t_ptr_21, t_ptr_22, t_ptr_23; 
  wire 	[6:0] 	t_ptr_24, t_ptr_25, t_ptr_26, t_ptr_27, t_ptr_28, t_ptr_29, t_ptr_30, t_ptr_31; 
  wire 	[6:0] 	t_ptr_32, t_ptr_33, t_ptr_34, t_ptr_35; 
  
 
  //------------------------------------------
  //Signals used as to indicate EQ's are OK
  // to issue an EQ write to  
  //------------------------------------------
  wire 	 	eq_ok_0, eq_ok_1, eq_ok_2, eq_ok_3, eq_ok_4, eq_ok_5, eq_ok_6, eq_ok_7; 
  wire 	 	eq_ok_8, eq_ok_9, eq_ok_10, eq_ok_11, eq_ok_12, eq_ok_13, eq_ok_14, eq_ok_15; 
  wire 	 	eq_ok_16, eq_ok_17, eq_ok_18, eq_ok_19, eq_ok_20, eq_ok_21, eq_ok_22, eq_ok_23; 
  wire 	 	eq_ok_24, eq_ok_25, eq_ok_26, eq_ok_27, eq_ok_28, eq_ok_29, eq_ok_30, eq_ok_31; 
  wire 	 	eq_ok_32, eq_ok_33, eq_ok_34, eq_ok_35; 
  

 
  //------------------------------------------
  // Signals used as to indicate when to set
  // the OVER FLOW ERROR bit
  //------------------------------------------
  wire 	 	load_over_err_eq_0,  load_over_err_eq_1, load_over_err_eq_2, load_over_err_eq_3, load_over_err_eq_4, load_over_err_eq_5, load_over_err_eq_6, load_over_err_eq_7; 
  wire 	 	load_over_err_eq_8,  load_over_err_eq_9, load_over_err_eq_10, load_over_err_eq_11, load_over_err_eq_12, load_over_err_eq_13, load_over_err_eq_14, load_over_err_eq_15; 
  wire 	 	load_over_err_eq_16, load_over_err_eq_17, load_over_err_eq_18, load_over_err_eq_19, load_over_err_eq_20, load_over_err_eq_21, load_over_err_eq_22, load_over_err_eq_23; 
  wire 	 	load_over_err_eq_24, load_over_err_eq_25, load_over_err_eq_26, load_over_err_eq_27, load_over_err_eq_28, load_over_err_eq_29, load_over_err_eq_30, load_over_err_eq_31; 
  wire 	 	load_over_err_eq_32, load_over_err_eq_33, load_over_err_eq_34, load_over_err_eq_35; 
  
  wire 	 	set_over_err_eq_0,  set_over_err_eq_1, set_over_err_eq_2, set_over_err_eq_3, set_over_err_eq_4, set_over_err_eq_5, set_over_err_eq_6, set_over_err_eq_7; 
  wire 	 	set_over_err_eq_8,  set_over_err_eq_9, set_over_err_eq_10, set_over_err_eq_11, set_over_err_eq_12, set_over_err_eq_13, set_over_err_eq_14, set_over_err_eq_15; 
  wire 	 	set_over_err_eq_16, set_over_err_eq_17, set_over_err_eq_18, set_over_err_eq_19, set_over_err_eq_20, set_over_err_eq_21, set_over_err_eq_22, set_over_err_eq_23; 
  wire 	 	set_over_err_eq_24, set_over_err_eq_25, set_over_err_eq_26, set_over_err_eq_27, set_over_err_eq_28, set_over_err_eq_29, set_over_err_eq_30, set_over_err_eq_31; 
  wire 	 	set_over_err_eq_32, set_over_err_eq_33, set_over_err_eq_34, set_over_err_eq_35; 
 
  wire 	 	data_over_err_eq_0,  data_over_err_eq_1, data_over_err_eq_2, data_over_err_eq_3, data_over_err_eq_4, data_over_err_eq_5, data_over_err_eq_6, data_over_err_eq_7; 
  wire 	 	data_over_err_eq_8,  data_over_err_eq_9, data_over_err_eq_10, data_over_err_eq_11, data_over_err_eq_12, data_over_err_eq_13, data_over_err_eq_14, data_over_err_eq_15; 
  wire 	 	data_over_err_eq_16, data_over_err_eq_17, data_over_err_eq_18, data_over_err_eq_19, data_over_err_eq_20, data_over_err_eq_21, data_over_err_eq_22, data_over_err_eq_23; 
  wire 	 	data_over_err_eq_24, data_over_err_eq_25, data_over_err_eq_26, data_over_err_eq_27, data_over_err_eq_28, data_over_err_eq_29, data_over_err_eq_30, data_over_err_eq_31; 
  wire 	 	data_over_err_eq_32, data_over_err_eq_33, data_over_err_eq_34, data_over_err_eq_35; 
  
  wire 	 	hw_set_over_err_eq_0,  hw_set_over_err_eq_1, hw_set_over_err_eq_2, hw_set_over_err_eq_3, hw_set_over_err_eq_4, hw_set_over_err_eq_5, hw_set_over_err_eq_6, hw_set_over_err_eq_7; 
  wire 	 	hw_set_over_err_eq_8,  hw_set_over_err_eq_9, hw_set_over_err_eq_10, hw_set_over_err_eq_11, hw_set_over_err_eq_12, hw_set_over_err_eq_13, hw_set_over_err_eq_14, hw_set_over_err_eq_15; 
  wire 	 	hw_set_over_err_eq_16, hw_set_over_err_eq_17, hw_set_over_err_eq_18, hw_set_over_err_eq_19, hw_set_over_err_eq_20, hw_set_over_err_eq_21, hw_set_over_err_eq_22, hw_set_over_err_eq_23; 
  wire 	 	hw_set_over_err_eq_24, hw_set_over_err_eq_25, hw_set_over_err_eq_26, hw_set_over_err_eq_27, hw_set_over_err_eq_28, hw_set_over_err_eq_29, hw_set_over_err_eq_30, hw_set_over_err_eq_31; 
  wire 	 	hw_set_over_err_eq_32, hw_set_over_err_eq_33, hw_set_over_err_eq_34, hw_set_over_err_eq_35; 
  
  wire 	 	sw_set_over_err_eq_0, sw_set_over_err_eq_1, sw_set_over_err_eq_2, sw_set_over_err_eq_3, sw_set_over_err_eq_4, sw_set_over_err_eq_5, sw_set_over_err_eq_6, sw_set_over_err_eq_7; 
  wire 	 	sw_set_over_err_eq_8, sw_set_over_err_eq_9, sw_set_over_err_eq_10, sw_set_over_err_eq_11, sw_set_over_err_eq_12, sw_set_over_err_eq_13, sw_set_over_err_eq_14, sw_set_over_err_eq_15; 
  wire 	 	sw_set_over_err_eq_16, sw_set_over_err_eq_17, sw_set_over_err_eq_18, sw_set_over_err_eq_19, sw_set_over_err_eq_20, sw_set_over_err_eq_21, sw_set_over_err_eq_22, sw_set_over_err_eq_23; 
  wire 	 	sw_set_over_err_eq_24, sw_set_over_err_eq_25, sw_set_over_err_eq_26, sw_set_over_err_eq_27, sw_set_over_err_eq_28, sw_set_over_err_eq_29, sw_set_over_err_eq_30, sw_set_over_err_eq_31; 
  wire 	 	sw_set_over_err_eq_32, sw_set_over_err_eq_33, sw_set_over_err_eq_34, sw_set_over_err_eq_35; 
  
  wire 	 	sw_clr_over_err_eq_0, sw_clr_over_err_eq_1, sw_clr_over_err_eq_2, sw_clr_over_err_eq_3, sw_clr_over_err_eq_4, sw_clr_over_err_eq_5, sw_clr_over_err_eq_6, sw_clr_over_err_eq_7; 
  wire 	 	sw_clr_over_err_eq_8, sw_clr_over_err_eq_9, sw_clr_over_err_eq_10, sw_clr_over_err_eq_11, sw_clr_over_err_eq_12, sw_clr_over_err_eq_13, sw_clr_over_err_eq_14, sw_clr_over_err_eq_15; 
  wire 	 	sw_clr_over_err_eq_16, sw_clr_over_err_eq_17, sw_clr_over_err_eq_18, sw_clr_over_err_eq_19, sw_clr_over_err_eq_20, sw_clr_over_err_eq_21, sw_clr_over_err_eq_22, sw_clr_over_err_eq_23; 
  wire 	 	sw_clr_over_err_eq_24, sw_clr_over_err_eq_25, sw_clr_over_err_eq_26, sw_clr_over_err_eq_27, sw_clr_over_err_eq_28, sw_clr_over_err_eq_29, sw_clr_over_err_eq_30, sw_clr_over_err_eq_31; 
  wire 	 	sw_clr_over_err_eq_32, sw_clr_over_err_eq_33, sw_clr_over_err_eq_34, sw_clr_over_err_eq_35; 

  wire 	 	sw_clr_addr_sel_eq_0, sw_clr_addr_sel_eq_1, sw_clr_addr_sel_eq_2, sw_clr_addr_sel_eq_3, sw_clr_addr_sel_eq_4, sw_clr_addr_sel_eq_5, sw_clr_addr_sel_eq_6, sw_clr_addr_sel_eq_7; 
  wire 	 	sw_clr_addr_sel_eq_8, sw_clr_addr_sel_eq_9, sw_clr_addr_sel_eq_10, sw_clr_addr_sel_eq_11, sw_clr_addr_sel_eq_12, sw_clr_addr_sel_eq_13, sw_clr_addr_sel_eq_14, sw_clr_addr_sel_eq_15; 
  wire 	 	sw_clr_addr_sel_eq_16, sw_clr_addr_sel_eq_17, sw_clr_addr_sel_eq_18, sw_clr_addr_sel_eq_19, sw_clr_addr_sel_eq_20, sw_clr_addr_sel_eq_21, sw_clr_addr_sel_eq_22, sw_clr_addr_sel_eq_23; 
  wire 	 	sw_clr_addr_sel_eq_24, sw_clr_addr_sel_eq_25, sw_clr_addr_sel_eq_26, sw_clr_addr_sel_eq_27, sw_clr_addr_sel_eq_28, sw_clr_addr_sel_eq_29, sw_clr_addr_sel_eq_30, sw_clr_addr_sel_eq_31; 
  wire 	 	sw_clr_addr_sel_eq_32, sw_clr_addr_sel_eq_33, sw_clr_addr_sel_eq_34, sw_clr_addr_sel_eq_35; 
 
  wire 	 	sw_set_addr_sel_eq_0, sw_set_addr_sel_eq_1, sw_set_addr_sel_eq_2, sw_set_addr_sel_eq_3, sw_set_addr_sel_eq_4, sw_set_addr_sel_eq_5, sw_set_addr_sel_eq_6, sw_set_addr_sel_eq_7; 
  wire 	 	sw_set_addr_sel_eq_8, sw_set_addr_sel_eq_9, sw_set_addr_sel_eq_10, sw_set_addr_sel_eq_11, sw_set_addr_sel_eq_12, sw_set_addr_sel_eq_13, sw_set_addr_sel_eq_14, sw_set_addr_sel_eq_15; 
  wire 	 	sw_set_addr_sel_eq_16, sw_set_addr_sel_eq_17, sw_set_addr_sel_eq_18, sw_set_addr_sel_eq_19, sw_set_addr_sel_eq_20, sw_set_addr_sel_eq_21, sw_set_addr_sel_eq_22, sw_set_addr_sel_eq_23; 
  wire 	 	sw_set_addr_sel_eq_24, sw_set_addr_sel_eq_25, sw_set_addr_sel_eq_26, sw_set_addr_sel_eq_27, sw_set_addr_sel_eq_28, sw_set_addr_sel_eq_29, sw_set_addr_sel_eq_30, sw_set_addr_sel_eq_31; 
  wire 	 	sw_set_addr_sel_eq_32, sw_set_addr_sel_eq_33, sw_set_addr_sel_eq_34, sw_set_addr_sel_eq_35; 


 
  //------------------------------------------
  //Signals used as to indicate EQ's are full 
  //------------------------------------------
  wire 	 	full_eq_0, full_eq_1, full_eq_2, full_eq_3, full_eq_4, full_eq_5, full_eq_6, full_eq_7; 
  wire 	 	full_eq_8, full_eq_9, full_eq_10, full_eq_11, full_eq_12, full_eq_13, full_eq_14, full_eq_15; 
  wire 	 	full_eq_16, full_eq_17, full_eq_18, full_eq_19, full_eq_20, full_eq_21, full_eq_22, full_eq_23; 
  wire 	 	full_eq_24, full_eq_25, full_eq_26, full_eq_27, full_eq_28, full_eq_29, full_eq_30, full_eq_31; 
  wire 	 	full_eq_32, full_eq_33, full_eq_34, full_eq_35; 
  

  //--------------------------------------------------
  //Signals used for Incrementing Tail Pointers
  //---------------------------------------------------
  
  wire 	[6:0] 	t_ptr_inc_0, t_ptr_inc_1, t_ptr_inc_2, t_ptr_inc_3, t_ptr_inc_4, t_ptr_inc_5, t_ptr_inc_6, t_ptr_inc_7; 
  wire 	[6:0] 	t_ptr_inc_8, t_ptr_inc_9, t_ptr_inc_10, t_ptr_inc_11, t_ptr_inc_12, t_ptr_inc_13, t_ptr_inc_14, t_ptr_inc_15; 
  wire 	[6:0] 	t_ptr_inc_16, t_ptr_inc_17, t_ptr_inc_18, t_ptr_inc_19, t_ptr_inc_20, t_ptr_inc_21, t_ptr_inc_22, t_ptr_inc_23; 
  wire 	[6:0] 	t_ptr_inc_24, t_ptr_inc_25, t_ptr_inc_26, t_ptr_inc_27, t_ptr_inc_28, t_ptr_inc_29, t_ptr_inc_30, t_ptr_inc_31; 
  wire 	[6:0] 	t_ptr_inc_32, t_ptr_inc_33, t_ptr_inc_34, t_ptr_inc_35; 
  
  wire 	 	t_ptr_inc_sel_0, t_ptr_inc_sel_1, t_ptr_inc_sel_2, t_ptr_inc_sel_3, t_ptr_inc_sel_4, t_ptr_inc_sel_5, t_ptr_inc_sel_6, t_ptr_inc_sel_7; 
  wire 	 	t_ptr_inc_sel_8, t_ptr_inc_sel_9, t_ptr_inc_sel_10, t_ptr_inc_sel_11, t_ptr_inc_sel_12, t_ptr_inc_sel_13, t_ptr_inc_sel_14, t_ptr_inc_sel_15; 
  wire 	 	t_ptr_inc_sel_16, t_ptr_inc_sel_17, t_ptr_inc_sel_18, t_ptr_inc_sel_19, t_ptr_inc_sel_20, t_ptr_inc_sel_21, t_ptr_inc_sel_22, t_ptr_inc_sel_23; 
  wire 	 	t_ptr_inc_sel_24, t_ptr_inc_sel_25, t_ptr_inc_sel_26, t_ptr_inc_sel_27, t_ptr_inc_sel_28, t_ptr_inc_sel_29, t_ptr_inc_sel_30, t_ptr_inc_sel_31; 
  wire  	t_ptr_inc_sel_32, t_ptr_inc_sel_33, t_ptr_inc_sel_34, t_ptr_inc_sel_35; 
  

  //------------------------------------------
  //Signals used as to indicate when each EQ  
  // has been selected to be sent for a write 
  //------------------------------------------

  wire 	 	eq_num_sel_0, eq_num_sel_1, eq_num_sel_2, eq_num_sel_3, eq_num_sel_4, eq_num_sel_5, eq_num_sel_6, eq_num_sel_7; 
  wire 	 	eq_num_sel_8, eq_num_sel_9, eq_num_sel_10, eq_num_sel_11, eq_num_sel_12, eq_num_sel_13, eq_num_sel_14, eq_num_sel_15; 
  wire 	 	eq_num_sel_16, eq_num_sel_17, eq_num_sel_18, eq_num_sel_19, eq_num_sel_20, eq_num_sel_21, eq_num_sel_22, eq_num_sel_23; 
  wire 	 	eq_num_sel_24, eq_num_sel_25, eq_num_sel_26, eq_num_sel_27, eq_num_sel_28, eq_num_sel_29, eq_num_sel_30, eq_num_sel_31; 
  wire  	eq_num_sel_32, eq_num_sel_33, eq_num_sel_34, eq_num_sel_35; 
  
  //-------------------------
  // Eq State (One Hot) 
  //  [2] -- Error State 
  //  [1] -- Active State 
  //  [0] -- Idle State   
  //-------------------------
  
  wire 	[2:0] 	eq_state_0, eq_state_1, eq_state_2, eq_state_3, eq_state_4, eq_state_5, eq_state_6, eq_state_7; 
  wire 	[2:0] 	eq_state_8, eq_state_9, eq_state_10, eq_state_11, eq_state_12, eq_state_13, eq_state_14, eq_state_15; 
  wire 	[2:0] 	eq_state_16, eq_state_17, eq_state_18, eq_state_19, eq_state_20, eq_state_21, eq_state_22, eq_state_23; 
  wire 	[2:0] 	eq_state_24, eq_state_25, eq_state_26, eq_state_27, eq_state_28, eq_state_29, eq_state_30, eq_state_31; 
  wire 	[2:0] 	eq_state_32, eq_state_33, eq_state_34, eq_state_35; 
 

  //-------------------------------------------------------------
  // Wires used to indicated EQ requires a Mondo to be generated
  //-------------------------------------------------------------
  wire 	[35:0]  hw_mondo_trig; 
  
  //-------------------------------------------------------------
  // Wires used to For EQ base address
  //-------------------------------------------------------------
  wire 	[44:0]	eq_base_address; 
  
  //-------------------------------------------------------------
  // Wire for Exteranl write data
  //-------------------------------------------------------------
  wire 		eq_fsm_wr; 
  wire 	[1:0]	eq_fsm_wr_data; 
  
  
  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************
  reg 	[6:0]  					eq_address_mux; 
  reg 	       					eq_ok_mux; 
  reg 	       					eq_state_mux; 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_b;

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  
  reg 	[61:0]   				eqs2ors_eq_addr;   
  reg						eqs2ors_sel; 
  reg 	[35:0] 					eqs2iss_eq_int_l; 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  //--------------------------------
  // Make sure EQ is never over 35
  //--------------------------------     
   
    //0in maximum -var rds2eqs_eq -val 35 

  //----------------------------------
  // Make sure EQ is decoded properly
  //----------------------------------   


   /* 0in decoder -in  rds2eqs_eq 
   		  -out  {28'h0,
		  	 eq_num_sel_35, eq_num_sel_34, eq_num_sel_33, eq_num_sel_32, eq_num_sel_31, eq_num_sel_30,
		         eq_num_sel_29, eq_num_sel_28, eq_num_sel_27, eq_num_sel_26, eq_num_sel_25, eq_num_sel_24, 
 	                 eq_num_sel_23, eq_num_sel_22, eq_num_sel_21, eq_num_sel_20, eq_num_sel_19, eq_num_sel_18, 
			 eq_num_sel_17, eq_num_sel_16, eq_num_sel_15, eq_num_sel_14, eq_num_sel_13, eq_num_sel_12, 
			 eq_num_sel_11, eq_num_sel_10, eq_num_sel_9,  eq_num_sel_8,  eq_num_sel_7,  eq_num_sel_6,  
			 eq_num_sel_5,  eq_num_sel_4,  eq_num_sel_3,  eq_num_sel_2,  eq_num_sel_1,  eq_num_sel_0
                        } 
		  
   */ 
   
  //---------------------------------------
  // Make sure only 1 EQ selected at a time 
  //--------------------------------------- 
   
    /*0in bits_on -var {eq_num_sel_35, eq_num_sel_34, eq_num_sel_33, eq_num_sel_32, eq_num_sel_31, eq_num_sel_30,
		         eq_num_sel_29, eq_num_sel_28, eq_num_sel_27, eq_num_sel_26, eq_num_sel_25, eq_num_sel_24, 
 	                 eq_num_sel_23, eq_num_sel_22, eq_num_sel_21, eq_num_sel_20, eq_num_sel_19, eq_num_sel_18, 
			 eq_num_sel_17, eq_num_sel_16, eq_num_sel_15, eq_num_sel_14, eq_num_sel_13, eq_num_sel_12, 
			 eq_num_sel_11, eq_num_sel_10, eq_num_sel_9,  eq_num_sel_8,  eq_num_sel_7,  eq_num_sel_6,  
			 eq_num_sel_5,  eq_num_sel_4,  eq_num_sel_3,  eq_num_sel_2,  eq_num_sel_1,  eq_num_sel_0
                        } 
    		  -max 1
    */

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
 

//-------------------------------------------------------
// Assigning the external signals from DCM to names for FSM's 
//-------------------------------------------------------
assign   eq_fsm_wr = ext_wr;  
assign   eq_fsm_wr_data = {clr_e2i_ext_wr_data,set_en_ext_wr_data};    // The en/dis bit and the e2i bit 


//-------------------------------------------------------
// Decode the EQ that is comming in 
//
//  The EQ number comming in is a 6 bit encoded value
//   the logic below makes it in to a 1 of 36 select
//-------------------------------------------------------

assign eq_num_sel_0	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_1	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_2	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_3	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_4	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_5	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_6	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_7	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_8	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_9	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_10	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_11	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_12	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_13	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_14	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_15	= ~(rds2eqs_eq[5]) & ~(rds2eqs_eq[4]) & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_16	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_17	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_18	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_19	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_20	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_21	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_22	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_23	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_24	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_25	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_26	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_27	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_28	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_29	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_30	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_31	= ~(rds2eqs_eq[5]) & (rds2eqs_eq[4])  & (rds2eqs_eq[3])  & (rds2eqs_eq[2])  & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 
assign eq_num_sel_32	= (rds2eqs_eq[5]) & ~(rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & ~(rds2eqs_eq[0]); 
assign eq_num_sel_33	= (rds2eqs_eq[5]) & ~(rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & ~(rds2eqs_eq[1]) & (rds2eqs_eq[0]); 
assign eq_num_sel_34	= (rds2eqs_eq[5]) & ~(rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & ~(rds2eqs_eq[0]); 
assign eq_num_sel_35	= (rds2eqs_eq[5]) & ~(rds2eqs_eq[4])  & ~(rds2eqs_eq[3]) & ~(rds2eqs_eq[2]) & (rds2eqs_eq[1])  & (rds2eqs_eq[0]); 


//-----------------------------------------------------------------------------
// Mux the results of the adders using rds2eqs_eq as the select to select which of
// the 32 EQ's the write is for 
//-----------------------------------------------------------------------------

always @ (t_ptr_0 or t_ptr_1 or t_ptr_2 or t_ptr_3 or t_ptr_4 or t_ptr_5 or t_ptr_6 or t_ptr_7 or
          t_ptr_8 or t_ptr_9 or t_ptr_10 or t_ptr_11 or t_ptr_12 or t_ptr_13 or t_ptr_14 or t_ptr_15 or 
	  t_ptr_16 or t_ptr_17 or t_ptr_18 or t_ptr_19 or t_ptr_20 or t_ptr_21 or t_ptr_22 or t_ptr_23 or t_ptr_24 or
	  t_ptr_25 or t_ptr_26 or t_ptr_27 or t_ptr_28 or t_ptr_29 or t_ptr_30 or t_ptr_31 or t_ptr_32 or t_ptr_33 or
	  t_ptr_34 or t_ptr_35 or rds2eqs_eq) 
 
  case (rds2eqs_eq) // synopsys parallel_case full_case infer_mux
    6'b000000 :  eq_address_mux = t_ptr_0;
    6'b000001 :  eq_address_mux = t_ptr_1; 
    6'b000010 :  eq_address_mux = t_ptr_2;
    6'b000011 :  eq_address_mux = t_ptr_3; 
    6'b000100 :  eq_address_mux = t_ptr_4;
    6'b000101 :  eq_address_mux = t_ptr_5; 
    6'b000110 :  eq_address_mux = t_ptr_6;
    6'b000111 :  eq_address_mux = t_ptr_7; 
    
    6'b001000 :  eq_address_mux = t_ptr_8;
    6'b001001 :  eq_address_mux = t_ptr_9; 
    6'b001010 :  eq_address_mux = t_ptr_10;
    6'b001011 :  eq_address_mux = t_ptr_11; 
    6'b001100 :  eq_address_mux = t_ptr_12;
    6'b001101 :  eq_address_mux = t_ptr_13; 
    6'b001110 :  eq_address_mux = t_ptr_14;
    6'b001111 :  eq_address_mux = t_ptr_15; 
    
    6'b010000 :  eq_address_mux = t_ptr_16;
    6'b010001 :  eq_address_mux = t_ptr_17; 
    6'b010010 :  eq_address_mux = t_ptr_18;
    6'b010011 :  eq_address_mux = t_ptr_19; 
    6'b010100 :  eq_address_mux = t_ptr_20;
    6'b010101 :  eq_address_mux = t_ptr_21; 
    6'b010110 :  eq_address_mux = t_ptr_22;
    6'b010111 :  eq_address_mux = t_ptr_23; 
    
    6'b011000 :  eq_address_mux = t_ptr_24;
    6'b011001 :  eq_address_mux = t_ptr_25; 
    6'b011010 :  eq_address_mux = t_ptr_26;
    6'b011011 :  eq_address_mux = t_ptr_27; 
    6'b011100 :  eq_address_mux = t_ptr_28;
    6'b011101 :  eq_address_mux = t_ptr_29; 
    6'b011110 :  eq_address_mux = t_ptr_30;
    6'b011111 :  eq_address_mux = t_ptr_31; 
    
    6'b100000 :  eq_address_mux = t_ptr_32;
    6'b100001 :  eq_address_mux = t_ptr_33; 
    6'b100010 :  eq_address_mux = t_ptr_34;
    6'b100011 :  eq_address_mux = t_ptr_35;    
  endcase 



   
//--------------------------------------------------------------------------------
// Need to notify software when there are items in the EQ which need to be processed
//
//  Since when the tail pointer equals the head pointer the EQ is empty
//  when they are not equal it is safe to say that there are entries in the EQ
//
//  When this happen we need to notify software so that they may processes these 
//  entries. We also only notify software when we are in the active state.  
// 
//------------------------------------------------------------------------------- 

assign  hw_mondo_trig[0]   = (t_ptr_0   != h_ptr_0)  & eq_state_0[ACTIVE];
assign  hw_mondo_trig[1]   = (t_ptr_1   != h_ptr_1)  & eq_state_1[ACTIVE];
assign  hw_mondo_trig[2]   = (t_ptr_2   != h_ptr_2)  & eq_state_2[ACTIVE];
assign  hw_mondo_trig[3]   = (t_ptr_3   != h_ptr_3)  & eq_state_3[ACTIVE];
assign  hw_mondo_trig[4]   = (t_ptr_4   != h_ptr_4)  & eq_state_4[ACTIVE];
assign  hw_mondo_trig[5]   = (t_ptr_5   != h_ptr_5)  & eq_state_5[ACTIVE];
assign  hw_mondo_trig[6]   = (t_ptr_6   != h_ptr_6)  & eq_state_6[ACTIVE];
assign  hw_mondo_trig[7]   = (t_ptr_7   != h_ptr_7)  & eq_state_7[ACTIVE];
assign  hw_mondo_trig[8]   = (t_ptr_8   != h_ptr_8)  & eq_state_8[ACTIVE];
assign  hw_mondo_trig[9]   = (t_ptr_9   != h_ptr_9)  & eq_state_9[ACTIVE];
assign  hw_mondo_trig[10]  = (t_ptr_10  != h_ptr_10) & eq_state_10[ACTIVE];
assign  hw_mondo_trig[11]  = (t_ptr_11  != h_ptr_11) & eq_state_11[ACTIVE];
assign  hw_mondo_trig[12]  = (t_ptr_12  != h_ptr_12) & eq_state_12[ACTIVE];
assign  hw_mondo_trig[13]  = (t_ptr_13  != h_ptr_13) & eq_state_13[ACTIVE];
assign  hw_mondo_trig[14]  = (t_ptr_14  != h_ptr_14) & eq_state_14[ACTIVE];
assign  hw_mondo_trig[15]  = (t_ptr_15  != h_ptr_15) & eq_state_15[ACTIVE];
assign  hw_mondo_trig[16]  = (t_ptr_16  != h_ptr_16) & eq_state_16[ACTIVE];
assign  hw_mondo_trig[17]  = (t_ptr_17  != h_ptr_17) & eq_state_17[ACTIVE];
assign  hw_mondo_trig[18]  = (t_ptr_18  != h_ptr_18) & eq_state_18[ACTIVE];
assign  hw_mondo_trig[19]  = (t_ptr_19  != h_ptr_19) & eq_state_19[ACTIVE];
assign  hw_mondo_trig[20]  = (t_ptr_20  != h_ptr_20) & eq_state_20[ACTIVE];
assign  hw_mondo_trig[21]  = (t_ptr_21  != h_ptr_21) & eq_state_21[ACTIVE];
assign  hw_mondo_trig[22]  = (t_ptr_22  != h_ptr_22) & eq_state_22[ACTIVE];
assign  hw_mondo_trig[23]  = (t_ptr_23  != h_ptr_23) & eq_state_23[ACTIVE];
assign  hw_mondo_trig[24]  = (t_ptr_24  != h_ptr_24) & eq_state_24[ACTIVE];
assign  hw_mondo_trig[25]  = (t_ptr_25  != h_ptr_25) & eq_state_25[ACTIVE];
assign  hw_mondo_trig[26]  = (t_ptr_26  != h_ptr_26) & eq_state_26[ACTIVE];
assign  hw_mondo_trig[27]  = (t_ptr_27  != h_ptr_27) & eq_state_27[ACTIVE];
assign  hw_mondo_trig[28]  = (t_ptr_28  != h_ptr_28) & eq_state_28[ACTIVE];
assign  hw_mondo_trig[29]  = (t_ptr_29  != h_ptr_29) & eq_state_29[ACTIVE];
assign  hw_mondo_trig[30]  = (t_ptr_30  != h_ptr_30) & eq_state_30[ACTIVE];
assign  hw_mondo_trig[31]  = (t_ptr_31  != h_ptr_31) & eq_state_31[ACTIVE];
assign  hw_mondo_trig[32]  = (t_ptr_32  != h_ptr_32) & eq_state_32[ACTIVE];
assign  hw_mondo_trig[33]  = (t_ptr_33  != h_ptr_33) & eq_state_33[ACTIVE];
assign  hw_mondo_trig[34]  = (t_ptr_34  != h_ptr_34) & eq_state_34[ACTIVE];
assign  hw_mondo_trig[35]  = (t_ptr_35  != h_ptr_35) & eq_state_35[ACTIVE]; 


  
//************************
// EQ FULL DETECTION     
//************************

//-----------------------------------------------------------------------------
// Increment the  tail pointers 
//  We do the addition prior to any request
//
//----------------------------------------------------------------------------- 
assign t_ptr_inc_0  = t_ptr_0  + 1; 
assign t_ptr_inc_1  = t_ptr_1  + 1; 
assign t_ptr_inc_2  = t_ptr_2  + 1; 
assign t_ptr_inc_3  = t_ptr_3  + 1; 
assign t_ptr_inc_4  = t_ptr_4  + 1; 
assign t_ptr_inc_5  = t_ptr_5  + 1; 
assign t_ptr_inc_6  = t_ptr_6  + 1; 
assign t_ptr_inc_7  = t_ptr_7  + 1; 
assign t_ptr_inc_8  = t_ptr_8  + 1; 
assign t_ptr_inc_9  = t_ptr_9  + 1; 
assign t_ptr_inc_10 = t_ptr_10 + 1; 
assign t_ptr_inc_11 = t_ptr_11 + 1; 
assign t_ptr_inc_12 = t_ptr_12 + 1; 
assign t_ptr_inc_13 = t_ptr_13 + 1; 
assign t_ptr_inc_14 = t_ptr_14 + 1; 
assign t_ptr_inc_15 = t_ptr_15 + 1; 
assign t_ptr_inc_16 = t_ptr_16 + 1; 
assign t_ptr_inc_17 = t_ptr_17 + 1; 
assign t_ptr_inc_18 = t_ptr_18 + 1; 
assign t_ptr_inc_19 = t_ptr_19 + 1; 
assign t_ptr_inc_20 = t_ptr_20 + 1; 
assign t_ptr_inc_21 = t_ptr_21 + 1; 
assign t_ptr_inc_22 = t_ptr_22 + 1; 
assign t_ptr_inc_23 = t_ptr_23 + 1; 
assign t_ptr_inc_24 = t_ptr_24 + 1; 
assign t_ptr_inc_25 = t_ptr_25 + 1; 
assign t_ptr_inc_26 = t_ptr_26 + 1; 
assign t_ptr_inc_27 = t_ptr_27 + 1; 
assign t_ptr_inc_28 = t_ptr_28 + 1; 
assign t_ptr_inc_29 = t_ptr_29 + 1; 
assign t_ptr_inc_30 = t_ptr_30 + 1; 
assign t_ptr_inc_31 = t_ptr_31 + 1; 
assign t_ptr_inc_32 = t_ptr_32 + 1; 
assign t_ptr_inc_33 = t_ptr_33 + 1; 
assign t_ptr_inc_34 = t_ptr_34 + 1; 
assign t_ptr_inc_35 = t_ptr_35 + 1;     

//-----------------------------------------------------------------------------
//  Now determine if the EQ is Full and can't accept anymore writes
//
// Check if Full If head = tail +1 it is
//----------------------------------------------------------------------------- 

assign full_eq_0  = t_ptr_inc_0  == h_ptr_0;
assign full_eq_1  = t_ptr_inc_1  == h_ptr_1;
assign full_eq_2  = t_ptr_inc_2  == h_ptr_2;
assign full_eq_3  = t_ptr_inc_3  == h_ptr_3;
assign full_eq_4  = t_ptr_inc_4  == h_ptr_4;
assign full_eq_5  = t_ptr_inc_5  == h_ptr_5;
assign full_eq_6  = t_ptr_inc_6  == h_ptr_6;
assign full_eq_7  = t_ptr_inc_7  == h_ptr_7;
assign full_eq_8  = t_ptr_inc_8  == h_ptr_8;
assign full_eq_9  = t_ptr_inc_9  == h_ptr_9;
assign full_eq_10 = t_ptr_inc_10 == h_ptr_10;
assign full_eq_11 = t_ptr_inc_11 == h_ptr_11;
assign full_eq_12 = t_ptr_inc_12 == h_ptr_12;
assign full_eq_13 = t_ptr_inc_13 == h_ptr_13;
assign full_eq_14 = t_ptr_inc_14 == h_ptr_14;
assign full_eq_15 = t_ptr_inc_15 == h_ptr_15;
assign full_eq_16 = t_ptr_inc_16 == h_ptr_16;
assign full_eq_17 = t_ptr_inc_17 == h_ptr_17;
assign full_eq_18 = t_ptr_inc_18 == h_ptr_18;
assign full_eq_19 = t_ptr_inc_19 == h_ptr_19;
assign full_eq_20 = t_ptr_inc_20 == h_ptr_20;
assign full_eq_21 = t_ptr_inc_21 == h_ptr_21;
assign full_eq_22 = t_ptr_inc_22 == h_ptr_22;
assign full_eq_23 = t_ptr_inc_23 == h_ptr_23;
assign full_eq_24 = t_ptr_inc_24 == h_ptr_24;
assign full_eq_25 = t_ptr_inc_25 == h_ptr_25;
assign full_eq_26 = t_ptr_inc_26 == h_ptr_26;
assign full_eq_27 = t_ptr_inc_27 == h_ptr_27;
assign full_eq_28 = t_ptr_inc_28 == h_ptr_28;
assign full_eq_29 = t_ptr_inc_29 == h_ptr_29;
assign full_eq_30 = t_ptr_inc_30 == h_ptr_30;
assign full_eq_31 = t_ptr_inc_31 == h_ptr_31;
assign full_eq_32 = t_ptr_inc_32 == h_ptr_32;
assign full_eq_33 = t_ptr_inc_33 == h_ptr_33;
assign full_eq_34 = t_ptr_inc_34 == h_ptr_34;
assign full_eq_35 = t_ptr_inc_35 == h_ptr_35;


//************************
// EQ OVER FLOW DETECTION     
//************************

//-----------------------------------------------------------------------------
// HW Overflow detection 
//
// If full, and a new write comes in and the EQ is in the ACTIVE state. 
//
// This signal is used to determine:
// 	- as part of when to load the EQ overflow error bit (setting it to 1)
//	- Input into fsm to change from ACTIVE to ERROR
// 
// 
// NOTE - eq_state_* variable is not needed here and may be able to be 
//        removed later if needed to make timing . This can be done since
//        this signal is only used by the FSM in the ACTIVE STATE
//----------------------------------------------------------------------------- 

assign hw_set_over_err_eq_0  = rds2eqs_eq_sel & eq_num_sel_0  & full_eq_0  & eq_state_0[ACTIVE];  
assign hw_set_over_err_eq_1  = rds2eqs_eq_sel & eq_num_sel_1  & full_eq_1  & eq_state_1[ACTIVE];  
assign hw_set_over_err_eq_2  = rds2eqs_eq_sel & eq_num_sel_2  & full_eq_2  & eq_state_2[ACTIVE];  
assign hw_set_over_err_eq_3  = rds2eqs_eq_sel & eq_num_sel_3  & full_eq_3  & eq_state_3[ACTIVE];  
assign hw_set_over_err_eq_4  = rds2eqs_eq_sel & eq_num_sel_4  & full_eq_4  & eq_state_4[ACTIVE];  
assign hw_set_over_err_eq_5  = rds2eqs_eq_sel & eq_num_sel_5  & full_eq_5  & eq_state_5[ACTIVE];  
assign hw_set_over_err_eq_6  = rds2eqs_eq_sel & eq_num_sel_6  & full_eq_6  & eq_state_6[ACTIVE];  
assign hw_set_over_err_eq_7  = rds2eqs_eq_sel & eq_num_sel_7  & full_eq_7  & eq_state_7[ACTIVE];  
assign hw_set_over_err_eq_8  = rds2eqs_eq_sel & eq_num_sel_8  & full_eq_8  & eq_state_8[ACTIVE];  
assign hw_set_over_err_eq_9  = rds2eqs_eq_sel & eq_num_sel_9  & full_eq_9  & eq_state_9[ACTIVE];  
assign hw_set_over_err_eq_10 = rds2eqs_eq_sel & eq_num_sel_10 & full_eq_10 & eq_state_10[ACTIVE];  
assign hw_set_over_err_eq_11 = rds2eqs_eq_sel & eq_num_sel_11 & full_eq_11 & eq_state_11[ACTIVE];  
assign hw_set_over_err_eq_12 = rds2eqs_eq_sel & eq_num_sel_12 & full_eq_12 & eq_state_12[ACTIVE];  
assign hw_set_over_err_eq_13 = rds2eqs_eq_sel & eq_num_sel_13 & full_eq_13 & eq_state_13[ACTIVE];  
assign hw_set_over_err_eq_14 = rds2eqs_eq_sel & eq_num_sel_14 & full_eq_14 & eq_state_14[ACTIVE];  
assign hw_set_over_err_eq_15 = rds2eqs_eq_sel & eq_num_sel_15 & full_eq_15 & eq_state_15[ACTIVE];  
assign hw_set_over_err_eq_16 = rds2eqs_eq_sel & eq_num_sel_16 & full_eq_16 & eq_state_16[ACTIVE];  
assign hw_set_over_err_eq_17 = rds2eqs_eq_sel & eq_num_sel_17 & full_eq_17 & eq_state_17[ACTIVE];  
assign hw_set_over_err_eq_18 = rds2eqs_eq_sel & eq_num_sel_18 & full_eq_18 & eq_state_18[ACTIVE];  
assign hw_set_over_err_eq_19 = rds2eqs_eq_sel & eq_num_sel_19 & full_eq_19 & eq_state_19[ACTIVE];  
assign hw_set_over_err_eq_20 = rds2eqs_eq_sel & eq_num_sel_20 & full_eq_20 & eq_state_20[ACTIVE];  
assign hw_set_over_err_eq_21 = rds2eqs_eq_sel & eq_num_sel_21 & full_eq_21 & eq_state_21[ACTIVE];  
assign hw_set_over_err_eq_22 = rds2eqs_eq_sel & eq_num_sel_22 & full_eq_22 & eq_state_22[ACTIVE];  
assign hw_set_over_err_eq_23 = rds2eqs_eq_sel & eq_num_sel_23 & full_eq_23 & eq_state_23[ACTIVE];  
assign hw_set_over_err_eq_24 = rds2eqs_eq_sel & eq_num_sel_24 & full_eq_24 & eq_state_24[ACTIVE];  
assign hw_set_over_err_eq_25 = rds2eqs_eq_sel & eq_num_sel_25 & full_eq_25 & eq_state_25[ACTIVE];  
assign hw_set_over_err_eq_26 = rds2eqs_eq_sel & eq_num_sel_26 & full_eq_26 & eq_state_26[ACTIVE];  
assign hw_set_over_err_eq_27 = rds2eqs_eq_sel & eq_num_sel_27 & full_eq_27 & eq_state_27[ACTIVE];  
assign hw_set_over_err_eq_28 = rds2eqs_eq_sel & eq_num_sel_28 & full_eq_28 & eq_state_28[ACTIVE];  
assign hw_set_over_err_eq_29 = rds2eqs_eq_sel & eq_num_sel_29 & full_eq_29 & eq_state_29[ACTIVE];  
assign hw_set_over_err_eq_30 = rds2eqs_eq_sel & eq_num_sel_30 & full_eq_30 & eq_state_30[ACTIVE];  
assign hw_set_over_err_eq_31 = rds2eqs_eq_sel & eq_num_sel_31 & full_eq_31 & eq_state_31[ACTIVE];  
assign hw_set_over_err_eq_32 = rds2eqs_eq_sel & eq_num_sel_32 & full_eq_32 & eq_state_32[ACTIVE];  
assign hw_set_over_err_eq_33 = rds2eqs_eq_sel & eq_num_sel_33 & full_eq_33 & eq_state_33[ACTIVE];  
assign hw_set_over_err_eq_34 = rds2eqs_eq_sel & eq_num_sel_34 & full_eq_34 & eq_state_34[ACTIVE];  
assign hw_set_over_err_eq_35 = rds2eqs_eq_sel & eq_num_sel_35 & full_eq_35 & eq_state_35[ACTIVE]; 

//-----------------------------------------------------------------------------
//  State Transistion in controled by a SW Regs
//
//    IDLE   -> ACTIVE eq_ctrl_set reg bit 44 
//    ACTIVE -> IDLE   eq_ctrl_clr reg bit 44
//    ACTIVE -> ERROR  eq_ctrl_set reg bit 57
//    ERROR  -> IDLE   eq_ctrl_clr reg bit 47 
//
//  Error Status Bit 
//
//    Can be set by software eq_ctrl_set reg bit 57 only in ACTIVE STATE
//    Can be cleared by software eq_ctrl_clr reg bit 57 in ANY STATE
//
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// SW Set Overflow 
//
// If SW PIO and the EQ is in the ACTIVE state.
//
// This signal is used to determine:
// 	- as part of when to load the EQ overflow error bit (setting it to 1)
//	- Input into fsm to change state from ACTIVE to ERROR 
//
// NOTE - eq_state_* variable is not needed here and may be able to be 
//        removed later if needed to make timing . This can be done since
//        this signal is only used by the FSM in the ACTIVE STATE 
//
//        However if this is done this signal can not be used to set the 
//	  overflow error status bit. Changes will need to be made to the 
//	  load_over_err_eq_* signals to "and" ACTIVE STATE with 
//        sw_set_over_err_eq_*
//----------------------------------------------------------------------------- 

assign  sw_set_over_err_eq_0  =  sw_set_addr_sel_eq_0  & ext_wr & set_enoverr_ext_wr_data & eq_state_0[ACTIVE];  
assign  sw_set_over_err_eq_1  =  sw_set_addr_sel_eq_1  & ext_wr & set_enoverr_ext_wr_data & eq_state_1[ACTIVE];  
assign  sw_set_over_err_eq_2  =  sw_set_addr_sel_eq_2  & ext_wr & set_enoverr_ext_wr_data & eq_state_2[ACTIVE];  
assign  sw_set_over_err_eq_3  =  sw_set_addr_sel_eq_3  & ext_wr & set_enoverr_ext_wr_data & eq_state_3[ACTIVE];  
assign  sw_set_over_err_eq_4  =  sw_set_addr_sel_eq_4  & ext_wr & set_enoverr_ext_wr_data & eq_state_4[ACTIVE];  
assign  sw_set_over_err_eq_5  =  sw_set_addr_sel_eq_5  & ext_wr & set_enoverr_ext_wr_data & eq_state_5[ACTIVE];  
assign  sw_set_over_err_eq_6  =  sw_set_addr_sel_eq_6  & ext_wr & set_enoverr_ext_wr_data & eq_state_6[ACTIVE];  
assign  sw_set_over_err_eq_7  =  sw_set_addr_sel_eq_7  & ext_wr & set_enoverr_ext_wr_data & eq_state_7[ACTIVE];  
assign  sw_set_over_err_eq_8  =  sw_set_addr_sel_eq_8  & ext_wr & set_enoverr_ext_wr_data & eq_state_8[ACTIVE];  
assign  sw_set_over_err_eq_9  =  sw_set_addr_sel_eq_9  & ext_wr & set_enoverr_ext_wr_data & eq_state_9[ACTIVE];  
assign  sw_set_over_err_eq_10 =  sw_set_addr_sel_eq_10 & ext_wr & set_enoverr_ext_wr_data & eq_state_10[ACTIVE];  
assign  sw_set_over_err_eq_11 =  sw_set_addr_sel_eq_11 & ext_wr & set_enoverr_ext_wr_data & eq_state_11[ACTIVE];  
assign  sw_set_over_err_eq_12 =  sw_set_addr_sel_eq_12 & ext_wr & set_enoverr_ext_wr_data & eq_state_12[ACTIVE];  
assign  sw_set_over_err_eq_13 =  sw_set_addr_sel_eq_13 & ext_wr & set_enoverr_ext_wr_data & eq_state_13[ACTIVE];  
assign  sw_set_over_err_eq_14 =  sw_set_addr_sel_eq_14 & ext_wr & set_enoverr_ext_wr_data & eq_state_14[ACTIVE];  
assign  sw_set_over_err_eq_15 =  sw_set_addr_sel_eq_15 & ext_wr & set_enoverr_ext_wr_data & eq_state_15[ACTIVE];  
assign  sw_set_over_err_eq_16 =  sw_set_addr_sel_eq_16 & ext_wr & set_enoverr_ext_wr_data & eq_state_16[ACTIVE];  
assign  sw_set_over_err_eq_17 =  sw_set_addr_sel_eq_17 & ext_wr & set_enoverr_ext_wr_data & eq_state_17[ACTIVE];  
assign  sw_set_over_err_eq_18 =  sw_set_addr_sel_eq_18 & ext_wr & set_enoverr_ext_wr_data & eq_state_18[ACTIVE];  
assign  sw_set_over_err_eq_19 =  sw_set_addr_sel_eq_19 & ext_wr & set_enoverr_ext_wr_data & eq_state_19[ACTIVE];  
assign  sw_set_over_err_eq_20 =  sw_set_addr_sel_eq_20 & ext_wr & set_enoverr_ext_wr_data & eq_state_20[ACTIVE];  
assign  sw_set_over_err_eq_21 =  sw_set_addr_sel_eq_21 & ext_wr & set_enoverr_ext_wr_data & eq_state_21[ACTIVE];  
assign  sw_set_over_err_eq_22 =  sw_set_addr_sel_eq_22 & ext_wr & set_enoverr_ext_wr_data & eq_state_22[ACTIVE];  
assign  sw_set_over_err_eq_23 =  sw_set_addr_sel_eq_23 & ext_wr & set_enoverr_ext_wr_data & eq_state_23[ACTIVE];  
assign  sw_set_over_err_eq_24 =  sw_set_addr_sel_eq_24 & ext_wr & set_enoverr_ext_wr_data & eq_state_24[ACTIVE];  
assign  sw_set_over_err_eq_25 =  sw_set_addr_sel_eq_25 & ext_wr & set_enoverr_ext_wr_data & eq_state_25[ACTIVE]; 
assign  sw_set_over_err_eq_26 =  sw_set_addr_sel_eq_26 & ext_wr & set_enoverr_ext_wr_data & eq_state_26[ACTIVE];  
assign  sw_set_over_err_eq_27 =  sw_set_addr_sel_eq_27 & ext_wr & set_enoverr_ext_wr_data & eq_state_27[ACTIVE];  
assign  sw_set_over_err_eq_28 =  sw_set_addr_sel_eq_28 & ext_wr & set_enoverr_ext_wr_data & eq_state_28[ACTIVE];  
assign  sw_set_over_err_eq_29 =  sw_set_addr_sel_eq_29 & ext_wr & set_enoverr_ext_wr_data & eq_state_29[ACTIVE];  
assign  sw_set_over_err_eq_30 =  sw_set_addr_sel_eq_30 & ext_wr & set_enoverr_ext_wr_data & eq_state_30[ACTIVE];  
assign  sw_set_over_err_eq_31 =  sw_set_addr_sel_eq_31 & ext_wr & set_enoverr_ext_wr_data & eq_state_31[ACTIVE];  
assign  sw_set_over_err_eq_32 =  sw_set_addr_sel_eq_32 & ext_wr & set_enoverr_ext_wr_data & eq_state_32[ACTIVE];  
assign  sw_set_over_err_eq_33 =  sw_set_addr_sel_eq_33 & ext_wr & set_enoverr_ext_wr_data & eq_state_33[ACTIVE];  
assign  sw_set_over_err_eq_34 =  sw_set_addr_sel_eq_34 & ext_wr & set_enoverr_ext_wr_data & eq_state_34[ACTIVE];  
assign  sw_set_over_err_eq_35 =  sw_set_addr_sel_eq_35 & ext_wr & set_enoverr_ext_wr_data & eq_state_35[ACTIVE]; 

//-----------------------------------------------------------------------------
// SW Clr Overflow 
//
// If SW PIO and the EQ is in the ANY state. 
//
// This signal is used to determine:
// 	- as part of when to load the EQ overflow error bit (clearing it to 0)
// 
//----------------------------------------------------------------------------- 

assign  sw_clr_over_err_eq_0  =  sw_clr_addr_sel_eq_0  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_1  =  sw_clr_addr_sel_eq_1  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_2  =  sw_clr_addr_sel_eq_2  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_3  =  sw_clr_addr_sel_eq_3  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_4  =  sw_clr_addr_sel_eq_4  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_5  =  sw_clr_addr_sel_eq_5  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_6  =  sw_clr_addr_sel_eq_6  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_7  =  sw_clr_addr_sel_eq_7  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_8  =  sw_clr_addr_sel_eq_8  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_9  =  sw_clr_addr_sel_eq_9  & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_10 =  sw_clr_addr_sel_eq_10 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_11 =  sw_clr_addr_sel_eq_11 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_12 =  sw_clr_addr_sel_eq_12 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_13 =  sw_clr_addr_sel_eq_13 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_14 =  sw_clr_addr_sel_eq_14 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_15 =  sw_clr_addr_sel_eq_15 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_16 =  sw_clr_addr_sel_eq_16 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_17 =  sw_clr_addr_sel_eq_17 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_18 =  sw_clr_addr_sel_eq_18 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_19 =  sw_clr_addr_sel_eq_19 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_20 =  sw_clr_addr_sel_eq_20 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_21 =  sw_clr_addr_sel_eq_21 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_22 =  sw_clr_addr_sel_eq_22 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_23 =  sw_clr_addr_sel_eq_23 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_24 =  sw_clr_addr_sel_eq_24 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_25 =  sw_clr_addr_sel_eq_25 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_26 =  sw_clr_addr_sel_eq_26 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_27 =  sw_clr_addr_sel_eq_27 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_28 =  sw_clr_addr_sel_eq_28 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_29 =  sw_clr_addr_sel_eq_29 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_30 =  sw_clr_addr_sel_eq_30 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_31 =  sw_clr_addr_sel_eq_31 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_32 =  sw_clr_addr_sel_eq_32 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_33 =  sw_clr_addr_sel_eq_33 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_34 =  sw_clr_addr_sel_eq_34 & ext_wr & clr_coverr_ext_wr_data;  
assign  sw_clr_over_err_eq_35 =  sw_clr_addr_sel_eq_35 & ext_wr & clr_coverr_ext_wr_data;  





//-----------------------------------------------------------------------------
// Set the Error Bit Signal 
// 
// Combination of SW Set Overflow PIO , HW Set overflow error , 
//----------------------------------------------------------------------------- 
assign set_over_err_eq_0   = hw_set_over_err_eq_0  | sw_set_over_err_eq_0; 
assign set_over_err_eq_1   = hw_set_over_err_eq_1  | sw_set_over_err_eq_1; 
assign set_over_err_eq_2   = hw_set_over_err_eq_2  | sw_set_over_err_eq_2; 
assign set_over_err_eq_3   = hw_set_over_err_eq_3  | sw_set_over_err_eq_3; 
assign set_over_err_eq_4   = hw_set_over_err_eq_4  | sw_set_over_err_eq_4; 
assign set_over_err_eq_5   = hw_set_over_err_eq_5  | sw_set_over_err_eq_5; 
assign set_over_err_eq_6   = hw_set_over_err_eq_6  | sw_set_over_err_eq_6; 
assign set_over_err_eq_7   = hw_set_over_err_eq_7  | sw_set_over_err_eq_7; 
assign set_over_err_eq_8   = hw_set_over_err_eq_8  | sw_set_over_err_eq_8; 
assign set_over_err_eq_9   = hw_set_over_err_eq_9  | sw_set_over_err_eq_9; 
assign set_over_err_eq_10  = hw_set_over_err_eq_10 | sw_set_over_err_eq_10; 
assign set_over_err_eq_11  = hw_set_over_err_eq_11 | sw_set_over_err_eq_11; 
assign set_over_err_eq_12  = hw_set_over_err_eq_12 | sw_set_over_err_eq_12; 
assign set_over_err_eq_13  = hw_set_over_err_eq_13 | sw_set_over_err_eq_13; 
assign set_over_err_eq_14  = hw_set_over_err_eq_14 | sw_set_over_err_eq_14; 
assign set_over_err_eq_15  = hw_set_over_err_eq_15 | sw_set_over_err_eq_15; 
assign set_over_err_eq_16  = hw_set_over_err_eq_16 | sw_set_over_err_eq_16; 
assign set_over_err_eq_17  = hw_set_over_err_eq_17 | sw_set_over_err_eq_17; 
assign set_over_err_eq_18  = hw_set_over_err_eq_18 | sw_set_over_err_eq_18; 
assign set_over_err_eq_19  = hw_set_over_err_eq_19 | sw_set_over_err_eq_19; 
assign set_over_err_eq_20  = hw_set_over_err_eq_20 | sw_set_over_err_eq_20; 
assign set_over_err_eq_21  = hw_set_over_err_eq_21 | sw_set_over_err_eq_21; 
assign set_over_err_eq_22  = hw_set_over_err_eq_22 | sw_set_over_err_eq_22; 
assign set_over_err_eq_23  = hw_set_over_err_eq_23 | sw_set_over_err_eq_23; 
assign set_over_err_eq_24  = hw_set_over_err_eq_24 | sw_set_over_err_eq_24; 
assign set_over_err_eq_25  = hw_set_over_err_eq_25 | sw_set_over_err_eq_25; 
assign set_over_err_eq_26  = hw_set_over_err_eq_26 | sw_set_over_err_eq_26; 
assign set_over_err_eq_27  = hw_set_over_err_eq_27 | sw_set_over_err_eq_27; 
assign set_over_err_eq_28  = hw_set_over_err_eq_28 | sw_set_over_err_eq_28; 
assign set_over_err_eq_29  = hw_set_over_err_eq_29 | sw_set_over_err_eq_29; 
assign set_over_err_eq_30  = hw_set_over_err_eq_30 | sw_set_over_err_eq_30; 
assign set_over_err_eq_31  = hw_set_over_err_eq_31 | sw_set_over_err_eq_31; 
assign set_over_err_eq_32  = hw_set_over_err_eq_32 | sw_set_over_err_eq_32; 
assign set_over_err_eq_33  = hw_set_over_err_eq_33 | sw_set_over_err_eq_33; 
assign set_over_err_eq_34  = hw_set_over_err_eq_34 | sw_set_over_err_eq_34; 
assign set_over_err_eq_35  = hw_set_over_err_eq_35 | sw_set_over_err_eq_35; 



//-----------------------------------------------------------------------------
// Load Signal 
// 
// Combination of SW Overflow PIO , HW overflow error , or SW clear error 
//----------------------------------------------------------------------------- 
assign load_over_err_eq_0   = set_over_err_eq_0  | sw_clr_over_err_eq_0; 
assign load_over_err_eq_1   = set_over_err_eq_1  | sw_clr_over_err_eq_1; 
assign load_over_err_eq_2   = set_over_err_eq_2  | sw_clr_over_err_eq_2; 
assign load_over_err_eq_3   = set_over_err_eq_3  | sw_clr_over_err_eq_3; 
assign load_over_err_eq_4   = set_over_err_eq_4  | sw_clr_over_err_eq_4; 
assign load_over_err_eq_5   = set_over_err_eq_5  | sw_clr_over_err_eq_5; 
assign load_over_err_eq_6   = set_over_err_eq_6  | sw_clr_over_err_eq_6; 
assign load_over_err_eq_7   = set_over_err_eq_7  | sw_clr_over_err_eq_7; 
assign load_over_err_eq_8   = set_over_err_eq_8  | sw_clr_over_err_eq_8; 
assign load_over_err_eq_9   = set_over_err_eq_9  | sw_clr_over_err_eq_9; 
assign load_over_err_eq_10  = set_over_err_eq_10 | sw_clr_over_err_eq_10; 
assign load_over_err_eq_11  = set_over_err_eq_11 | sw_clr_over_err_eq_11; 
assign load_over_err_eq_12  = set_over_err_eq_12 | sw_clr_over_err_eq_12; 
assign load_over_err_eq_13  = set_over_err_eq_13 | sw_clr_over_err_eq_13; 
assign load_over_err_eq_14  = set_over_err_eq_14 | sw_clr_over_err_eq_14; 
assign load_over_err_eq_15  = set_over_err_eq_15 | sw_clr_over_err_eq_15; 
assign load_over_err_eq_16  = set_over_err_eq_16 | sw_clr_over_err_eq_16; 
assign load_over_err_eq_17  = set_over_err_eq_17 | sw_clr_over_err_eq_17; 
assign load_over_err_eq_18  = set_over_err_eq_18 | sw_clr_over_err_eq_18; 
assign load_over_err_eq_19  = set_over_err_eq_19 | sw_clr_over_err_eq_19; 
assign load_over_err_eq_20  = set_over_err_eq_20 | sw_clr_over_err_eq_20; 
assign load_over_err_eq_21  = set_over_err_eq_21 | sw_clr_over_err_eq_21; 
assign load_over_err_eq_22  = set_over_err_eq_22 | sw_clr_over_err_eq_22; 
assign load_over_err_eq_23  = set_over_err_eq_23 | sw_clr_over_err_eq_23; 
assign load_over_err_eq_24  = set_over_err_eq_24 | sw_clr_over_err_eq_24; 
assign load_over_err_eq_25  = set_over_err_eq_25 | sw_clr_over_err_eq_25; 
assign load_over_err_eq_26  = set_over_err_eq_26 | sw_clr_over_err_eq_26; 
assign load_over_err_eq_27  = set_over_err_eq_27 | sw_clr_over_err_eq_27; 
assign load_over_err_eq_28  = set_over_err_eq_28 | sw_clr_over_err_eq_28; 
assign load_over_err_eq_29  = set_over_err_eq_29 | sw_clr_over_err_eq_29; 
assign load_over_err_eq_30  = set_over_err_eq_30 | sw_clr_over_err_eq_30; 
assign load_over_err_eq_31  = set_over_err_eq_31 | sw_clr_over_err_eq_31; 
assign load_over_err_eq_32  = set_over_err_eq_32 | sw_clr_over_err_eq_32; 
assign load_over_err_eq_33  = set_over_err_eq_33 | sw_clr_over_err_eq_33; 
assign load_over_err_eq_34  = set_over_err_eq_34 | sw_clr_over_err_eq_34; 
assign load_over_err_eq_35  = set_over_err_eq_35 | sw_clr_over_err_eq_35; 


//-----------------------------------------------------------------------------
// Data to load into the over_flow error
// 
//----------------------------------------------------------------------------- 


assign data_over_err_eq_0  = ~sw_clr_over_err_eq_0; 
assign data_over_err_eq_1  = ~sw_clr_over_err_eq_1; 
assign data_over_err_eq_2  = ~sw_clr_over_err_eq_2; 
assign data_over_err_eq_3  = ~sw_clr_over_err_eq_3; 
assign data_over_err_eq_4  = ~sw_clr_over_err_eq_4; 
assign data_over_err_eq_5  = ~sw_clr_over_err_eq_5; 
assign data_over_err_eq_6  = ~sw_clr_over_err_eq_6; 
assign data_over_err_eq_7  = ~sw_clr_over_err_eq_7; 
assign data_over_err_eq_8  = ~sw_clr_over_err_eq_8; 
assign data_over_err_eq_9  = ~sw_clr_over_err_eq_9; 
assign data_over_err_eq_10 = ~sw_clr_over_err_eq_10; 
assign data_over_err_eq_11 = ~sw_clr_over_err_eq_11; 
assign data_over_err_eq_12 = ~sw_clr_over_err_eq_12; 
assign data_over_err_eq_13 = ~sw_clr_over_err_eq_13; 
assign data_over_err_eq_14 = ~sw_clr_over_err_eq_14; 
assign data_over_err_eq_15 = ~sw_clr_over_err_eq_15; 
assign data_over_err_eq_16 = ~sw_clr_over_err_eq_16; 
assign data_over_err_eq_17 = ~sw_clr_over_err_eq_17; 
assign data_over_err_eq_18 = ~sw_clr_over_err_eq_18; 
assign data_over_err_eq_19 = ~sw_clr_over_err_eq_19; 
assign data_over_err_eq_20 = ~sw_clr_over_err_eq_20; 
assign data_over_err_eq_21 = ~sw_clr_over_err_eq_21; 
assign data_over_err_eq_22 = ~sw_clr_over_err_eq_22; 
assign data_over_err_eq_23 = ~sw_clr_over_err_eq_23; 
assign data_over_err_eq_24 = ~sw_clr_over_err_eq_24; 
assign data_over_err_eq_25 = ~sw_clr_over_err_eq_25; 
assign data_over_err_eq_26 = ~sw_clr_over_err_eq_26; 
assign data_over_err_eq_27 = ~sw_clr_over_err_eq_27; 
assign data_over_err_eq_28 = ~sw_clr_over_err_eq_28; 
assign data_over_err_eq_29 = ~sw_clr_over_err_eq_29; 
assign data_over_err_eq_30 = ~sw_clr_over_err_eq_30; 
assign data_over_err_eq_31 = ~sw_clr_over_err_eq_31; 
assign data_over_err_eq_32 = ~sw_clr_over_err_eq_32; 
assign data_over_err_eq_33 = ~sw_clr_over_err_eq_33; 
assign data_over_err_eq_34 = ~sw_clr_over_err_eq_34; 
assign data_over_err_eq_35 = ~sw_clr_over_err_eq_35; 



//-----------------------------------------------------------------------------
// Create Error Interrupt Signal 
//----------------------------------------------------------------------------- 


assign eqs2ics_eq_over_error =  set_over_err_eq_0    |
				set_over_err_eq_1    |
				set_over_err_eq_2    |
				set_over_err_eq_3    |
				set_over_err_eq_4    |
				set_over_err_eq_5    |
				set_over_err_eq_6    |
				set_over_err_eq_7    |
				set_over_err_eq_8    |
				set_over_err_eq_9    |
				set_over_err_eq_10   |
				set_over_err_eq_11   |
				set_over_err_eq_12   |
				set_over_err_eq_13   |
				set_over_err_eq_14   |
				set_over_err_eq_15   |
				set_over_err_eq_16   |
				set_over_err_eq_17   |
				set_over_err_eq_18   |
				set_over_err_eq_19   |
				set_over_err_eq_20   |
				set_over_err_eq_21   |
				set_over_err_eq_22   |
				set_over_err_eq_23   |
				set_over_err_eq_24   |
				set_over_err_eq_25   |
				set_over_err_eq_26   |
				set_over_err_eq_27   |
				set_over_err_eq_28   |
				set_over_err_eq_29   |
				set_over_err_eq_30   |
				set_over_err_eq_31   |
				set_over_err_eq_32   |
				set_over_err_eq_33   |
				set_over_err_eq_34   |
				set_over_err_eq_35;    
				
				
assign  eqs2ics_error_data = {58'h0, rds2eqs_eq};
     

//************************
// Tail Pointer Update    
//************************

//-----------------------------------------------------------------------------
// Select signals to know when to update the tail pointer
//
// Only update when 
//	- The pipe line is selected
//  	- It is the proper tail pointer to update
// 	- And the EQ is ok and did not have an error.  
//----------------------------------------------------------------------------- 


assign t_ptr_inc_sel_0  = rds2eqs_eq_sel & eq_ok_0  & eq_num_sel_0; 
assign t_ptr_inc_sel_1  = rds2eqs_eq_sel & eq_ok_1  & eq_num_sel_1; 
assign t_ptr_inc_sel_2  = rds2eqs_eq_sel & eq_ok_2  & eq_num_sel_2; 
assign t_ptr_inc_sel_3  = rds2eqs_eq_sel & eq_ok_3  & eq_num_sel_3; 
assign t_ptr_inc_sel_4  = rds2eqs_eq_sel & eq_ok_4  & eq_num_sel_4; 
assign t_ptr_inc_sel_5  = rds2eqs_eq_sel & eq_ok_5  & eq_num_sel_5; 
assign t_ptr_inc_sel_6  = rds2eqs_eq_sel & eq_ok_6  & eq_num_sel_6; 
assign t_ptr_inc_sel_7  = rds2eqs_eq_sel & eq_ok_7  & eq_num_sel_7; 
assign t_ptr_inc_sel_8  = rds2eqs_eq_sel & eq_ok_8  & eq_num_sel_8; 
assign t_ptr_inc_sel_9  = rds2eqs_eq_sel & eq_ok_9  & eq_num_sel_9; 
assign t_ptr_inc_sel_10 = rds2eqs_eq_sel & eq_ok_10 & eq_num_sel_10; 
assign t_ptr_inc_sel_11 = rds2eqs_eq_sel & eq_ok_11 & eq_num_sel_11; 
assign t_ptr_inc_sel_12 = rds2eqs_eq_sel & eq_ok_12 & eq_num_sel_12; 
assign t_ptr_inc_sel_13 = rds2eqs_eq_sel & eq_ok_13 & eq_num_sel_13; 
assign t_ptr_inc_sel_14 = rds2eqs_eq_sel & eq_ok_14 & eq_num_sel_14; 
assign t_ptr_inc_sel_15 = rds2eqs_eq_sel & eq_ok_15 & eq_num_sel_15; 
assign t_ptr_inc_sel_16 = rds2eqs_eq_sel & eq_ok_16 & eq_num_sel_16; 
assign t_ptr_inc_sel_17 = rds2eqs_eq_sel & eq_ok_17 & eq_num_sel_17; 
assign t_ptr_inc_sel_18 = rds2eqs_eq_sel & eq_ok_18 & eq_num_sel_18; 
assign t_ptr_inc_sel_19 = rds2eqs_eq_sel & eq_ok_19 & eq_num_sel_19; 
assign t_ptr_inc_sel_20 = rds2eqs_eq_sel & eq_ok_20 & eq_num_sel_20; 
assign t_ptr_inc_sel_21 = rds2eqs_eq_sel & eq_ok_21 & eq_num_sel_21; 
assign t_ptr_inc_sel_22 = rds2eqs_eq_sel & eq_ok_22 & eq_num_sel_22; 
assign t_ptr_inc_sel_23 = rds2eqs_eq_sel & eq_ok_23 & eq_num_sel_23; 
assign t_ptr_inc_sel_24 = rds2eqs_eq_sel & eq_ok_24 & eq_num_sel_24; 
assign t_ptr_inc_sel_25 = rds2eqs_eq_sel & eq_ok_25 & eq_num_sel_25; 
assign t_ptr_inc_sel_26 = rds2eqs_eq_sel & eq_ok_26 & eq_num_sel_26; 
assign t_ptr_inc_sel_27 = rds2eqs_eq_sel & eq_ok_27 & eq_num_sel_27; 
assign t_ptr_inc_sel_28 = rds2eqs_eq_sel & eq_ok_28 & eq_num_sel_28; 
assign t_ptr_inc_sel_29 = rds2eqs_eq_sel & eq_ok_29 & eq_num_sel_29; 
assign t_ptr_inc_sel_30 = rds2eqs_eq_sel & eq_ok_30 & eq_num_sel_30; 
assign t_ptr_inc_sel_31 = rds2eqs_eq_sel & eq_ok_31 & eq_num_sel_31; 
assign t_ptr_inc_sel_32 = rds2eqs_eq_sel & eq_ok_32 & eq_num_sel_32; 
assign t_ptr_inc_sel_33 = rds2eqs_eq_sel & eq_ok_33 & eq_num_sel_33; 
assign t_ptr_inc_sel_34 = rds2eqs_eq_sel & eq_ok_34 & eq_num_sel_34; 
assign t_ptr_inc_sel_35 = rds2eqs_eq_sel & eq_ok_35 & eq_num_sel_35; 





//-----------------------------------------------------------------------------
//			 EQ OK OUTPUT GENERATION  	
//
// To find out if it is OK to issue an EQ write we must check three things 
//     	1) Is the EQ Full  
//	2) Is the EQ Enabled (Has SW made it active and ready to accept writes)
//	3) Is the EQ in Error State 
//
//      ?) Or conversly we can just check to make sure it is in the ACTIVE STATE
//
//---- ------------------------------------------------------------------------  


//*********************
// EQ ACTIVE DETECTION    
//*********************

//-----------------------------------------------------------------------------
// Find out if the EQ is Active we must check the state to make sure that 
// It is in the ACTIVE state and not in the ERROR or IDLE states. 
// To do this we can take the 1-hot active bit directly from the state machine
//-----------------------------------------------------------------------------  

//************************
// EQ Ok Wire Assignmeent     
//************************

//-----------------------------------------------------------------------------
// The EQ is ok to send a write to if it is not full and the State is ACTIVE
//-----------------------------------------------------------------------------  

assign eq_ok_0 = !(full_eq_0) & eq_state_0[ACTIVE]; 
assign eq_ok_1 = !(full_eq_1) & eq_state_1[ACTIVE]; 
assign eq_ok_2 = !(full_eq_2) & eq_state_2[ACTIVE]; 
assign eq_ok_3 = !(full_eq_3) & eq_state_3[ACTIVE]; 
assign eq_ok_4 = !(full_eq_4) & eq_state_4[ACTIVE]; 
assign eq_ok_5 = !(full_eq_5) & eq_state_5[ACTIVE]; 
assign eq_ok_6 = !(full_eq_6) & eq_state_6[ACTIVE]; 
assign eq_ok_7 = !(full_eq_7) & eq_state_7[ACTIVE]; 
assign eq_ok_8 = !(full_eq_8) & eq_state_8[ACTIVE];
assign eq_ok_9 = !(full_eq_9) & eq_state_9[ACTIVE];
assign eq_ok_10 = !(full_eq_10) & eq_state_10[ACTIVE];
assign eq_ok_11 = !(full_eq_11) & eq_state_11[ACTIVE];
assign eq_ok_12 = !(full_eq_12) & eq_state_12[ACTIVE];
assign eq_ok_13 = !(full_eq_13) & eq_state_13[ACTIVE];
assign eq_ok_14 = !(full_eq_14) & eq_state_14[ACTIVE];
assign eq_ok_15 = !(full_eq_15) & eq_state_15[ACTIVE];
assign eq_ok_16 = !(full_eq_16) & eq_state_16[ACTIVE]; 
assign eq_ok_17 = !(full_eq_17) & eq_state_17[ACTIVE]; 
assign eq_ok_18 = !(full_eq_18) & eq_state_18[ACTIVE];
assign eq_ok_19 = !(full_eq_19) & eq_state_19[ACTIVE];
assign eq_ok_20 = !(full_eq_20) & eq_state_20[ACTIVE];
assign eq_ok_21 = !(full_eq_21) & eq_state_21[ACTIVE];
assign eq_ok_22 = !(full_eq_22) & eq_state_22[ACTIVE];
assign eq_ok_23 = !(full_eq_23) & eq_state_23[ACTIVE];
assign eq_ok_24 = !(full_eq_24) & eq_state_24[ACTIVE];
assign eq_ok_25 = !(full_eq_25) & eq_state_25[ACTIVE];
assign eq_ok_26 = !(full_eq_26) & eq_state_26[ACTIVE]; 
assign eq_ok_27 = !(full_eq_27) & eq_state_27[ACTIVE]; 
assign eq_ok_28 = !(full_eq_28) & eq_state_28[ACTIVE];
assign eq_ok_29 = !(full_eq_29) & eq_state_29[ACTIVE];
assign eq_ok_30 = !(full_eq_30) & eq_state_30[ACTIVE];
assign eq_ok_31 = !(full_eq_31) & eq_state_31[ACTIVE];
assign eq_ok_32 = !(full_eq_32) & eq_state_32[ACTIVE];
assign eq_ok_33 = !(full_eq_33) & eq_state_33[ACTIVE];
assign eq_ok_34 = !(full_eq_34) & eq_state_34[ACTIVE];
assign eq_ok_35 = !(full_eq_35) & eq_state_35[ACTIVE];

//*******************
// EQ OK  Muxing    
//*******************

//-----------------------------------------------------------------------------
// Mux the results of the 36 eq ok signals using rds2eqs_eq as the select to select 
// which of the EQ's the write is for 
//-----------------------------------------------------------------------------

always @ (eq_ok_0 or eq_ok_1 or eq_ok_2 or eq_ok_3 or eq_ok_4 or eq_ok_5 or eq_ok_6 or eq_ok_7 or
          eq_ok_8 or eq_ok_9 or eq_ok_10 or eq_ok_11 or eq_ok_12 or eq_ok_13 or eq_ok_14 or eq_ok_15 or 
	  eq_ok_16 or eq_ok_17 or eq_ok_18 or eq_ok_19 or eq_ok_20 or eq_ok_21 or eq_ok_22 or eq_ok_23 or eq_ok_24 or
	  eq_ok_25 or eq_ok_26 or eq_ok_27 or eq_ok_28 or eq_ok_29 or eq_ok_30 or eq_ok_31 or eq_ok_32 or eq_ok_33 or
	  eq_ok_34 or eq_ok_35 or rds2eqs_eq) 
 
  case (rds2eqs_eq) // synopsys parallel_case full_case infer_mux
    6'b000000 :  eq_ok_mux = eq_ok_0;
    6'b000001 :  eq_ok_mux = eq_ok_1; 
    6'b000010 :  eq_ok_mux = eq_ok_2;
    6'b000011 :  eq_ok_mux = eq_ok_3; 
    6'b000100 :  eq_ok_mux = eq_ok_4;
    6'b000101 :  eq_ok_mux = eq_ok_5; 
    6'b000110 :  eq_ok_mux = eq_ok_6;
    6'b000111 :  eq_ok_mux = eq_ok_7; 
    
    6'b001000 :  eq_ok_mux = eq_ok_8;
    6'b001001 :  eq_ok_mux = eq_ok_9; 
    6'b001010 :  eq_ok_mux = eq_ok_10;
    6'b001011 :  eq_ok_mux = eq_ok_11; 
    6'b001100 :  eq_ok_mux = eq_ok_12;
    6'b001101 :  eq_ok_mux = eq_ok_13; 
    6'b001110 :  eq_ok_mux = eq_ok_14;
    6'b001111 :  eq_ok_mux = eq_ok_15; 
    
    6'b010000 :  eq_ok_mux = eq_ok_16;
    6'b010001 :  eq_ok_mux = eq_ok_17; 
    6'b010010 :  eq_ok_mux = eq_ok_18;
    6'b010011 :  eq_ok_mux = eq_ok_19; 
    6'b010100 :  eq_ok_mux = eq_ok_20;
    6'b010101 :  eq_ok_mux = eq_ok_21; 
    6'b010110 :  eq_ok_mux = eq_ok_22;
    6'b010111 :  eq_ok_mux = eq_ok_23; 
    
    6'b011000 :  eq_ok_mux = eq_ok_24;
    6'b011001 :  eq_ok_mux = eq_ok_25; 
    6'b011010 :  eq_ok_mux = eq_ok_26;
    6'b011011 :  eq_ok_mux = eq_ok_27; 
    6'b011100 :  eq_ok_mux = eq_ok_28;
    6'b011101 :  eq_ok_mux = eq_ok_29; 
    6'b011110 :  eq_ok_mux = eq_ok_30;
    6'b011111 :  eq_ok_mux = eq_ok_31; 
    
    6'b100000 :  eq_ok_mux = eq_ok_32;
    6'b100001 :  eq_ok_mux = eq_ok_33; 
    6'b100010 :  eq_ok_mux = eq_ok_34;
    6'b100011 :  eq_ok_mux = eq_ok_35; 
    
   
  endcase 

//**********************
// EQ IDLE State Muxing    
//**********************

//-----------------------------------------------------------------------------
// Mux the results of the 36 eq ok signals using rds2eqs_eq as the select to select 
// which of the EQ's the write is for 
//-----------------------------------------------------------------------------

always @ (eq_state_0 or eq_state_1 or eq_state_2 or eq_state_3 or eq_state_4 or eq_state_5 or eq_state_6 or eq_state_7 or
          eq_state_8 or eq_state_9 or eq_state_10 or eq_state_11 or eq_state_12 or eq_state_13 or eq_state_14 or eq_state_15 or 
	  eq_state_16 or eq_state_17 or eq_state_18 or eq_state_19 or eq_state_20 or eq_state_21 or eq_state_22 or eq_state_23 or eq_state_24 or
	  eq_state_25 or eq_state_26 or eq_state_27 or eq_state_28 or eq_state_29 or eq_state_30 or eq_state_31 or eq_state_32 or eq_state_33 or
	  eq_state_34 or eq_state_35 or rds2eqs_eq) 
 
  case (rds2eqs_eq) // synopsys parallel_case full_case infer_mux
    6'b000000 :  eq_state_mux = eq_state_0[IDLE];
    6'b000001 :  eq_state_mux = eq_state_1[IDLE]; 
    6'b000010 :  eq_state_mux = eq_state_2[IDLE];
    6'b000011 :  eq_state_mux = eq_state_3[IDLE]; 
    6'b000100 :  eq_state_mux = eq_state_4[IDLE];
    6'b000101 :  eq_state_mux = eq_state_5[IDLE]; 
    6'b000110 :  eq_state_mux = eq_state_6[IDLE];
    6'b000111 :  eq_state_mux = eq_state_7[IDLE]; 
    
    6'b001000 :  eq_state_mux = eq_state_8[IDLE];
    6'b001001 :  eq_state_mux = eq_state_9[IDLE]; 
    6'b001010 :  eq_state_mux = eq_state_10[IDLE];
    6'b001011 :  eq_state_mux = eq_state_11[IDLE]; 
    6'b001100 :  eq_state_mux = eq_state_12[IDLE];
    6'b001101 :  eq_state_mux = eq_state_13[IDLE]; 
    6'b001110 :  eq_state_mux = eq_state_14[IDLE];
    6'b001111 :  eq_state_mux = eq_state_15[IDLE]; 
    
    6'b010000 :  eq_state_mux = eq_state_16[IDLE];
    6'b010001 :  eq_state_mux = eq_state_17[IDLE]; 
    6'b010010 :  eq_state_mux = eq_state_18[IDLE];
    6'b010011 :  eq_state_mux = eq_state_19[IDLE]; 
    6'b010100 :  eq_state_mux = eq_state_20[IDLE];
    6'b010101 :  eq_state_mux = eq_state_21[IDLE]; 
    6'b010110 :  eq_state_mux = eq_state_22[IDLE];
    6'b010111 :  eq_state_mux = eq_state_23[IDLE]; 
    
    6'b011000 :  eq_state_mux = eq_state_24[IDLE];
    6'b011001 :  eq_state_mux = eq_state_25[IDLE]; 
    6'b011010 :  eq_state_mux = eq_state_26[IDLE];
    6'b011011 :  eq_state_mux = eq_state_27[IDLE]; 
    6'b011100 :  eq_state_mux = eq_state_28[IDLE];
    6'b011101 :  eq_state_mux = eq_state_29[IDLE]; 
    6'b011110 :  eq_state_mux = eq_state_30[IDLE];
    6'b011111 :  eq_state_mux = eq_state_31[IDLE]; 
    
    6'b100000 :  eq_state_mux = eq_state_32[IDLE];
    6'b100001 :  eq_state_mux = eq_state_33[IDLE]; 
    6'b100010 :  eq_state_mux = eq_state_34[IDLE];
    6'b100011 :  eq_state_mux = eq_state_35[IDLE]; 
    
   
  endcase 



//*******************
// Assign the Output   
//*******************

//-----------------------------------------------------------------------------
// Dont flop the out put of eq ok need the signal immediately 
//-----------------------------------------------------------------------------

assign eqs2scs_eq_ok = eq_ok_mux; 
assign eqs2scs_eq_not_en = eq_state_mux;

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

//*******************
// Assign the Output   
//*******************

//-----------------------------------------------------------------------------
// Flop the output of the block. Load the flop if selected else hold the 
// value.  
//-----------------------------------------------------------------------------

always @ (posedge clk)
  if (!rst_l)
     begin
      eqs2ors_eq_addr   <= 62'h0;
      eqs2ors_sel 	<= 1'b0; 
     end
  else if (rds2eqs_eq_sel & eqs2scs_eq_ok)    
     begin
      eqs2ors_eq_addr   <= {eq_base_address,rds2eqs_eq,eq_address_mux,4'h0} ; 
      eqs2ors_sel 	<= rds2eqs_eq_sel; 
      end
  else 
     begin    
      eqs2ors_eq_addr   <= eqs2ors_eq_addr;
      eqs2ors_sel 	<= rds2eqs_eq_sel; 
     end

//BP 7-25-06 N2 bug 118163, eq_base_address_63 to tmu for msi decode
assign	eq_base_address_63	= eq_base_address[44];

//-----------------------------------------------------------------------------
// Flop the output of the block. 
// 
// This is for the interrupt requests to the ISS 
// 
// Signal is active low thats why it is inverted 
//-----------------------------------------------------------------------------

always @ (posedge clk)				
  if (!rst_l)					
        eqs2iss_eq_int_l  <= 36'hFFFF_FFFF_F; 			
  else 
        eqs2iss_eq_int_l <= ~hw_mondo_trig; 



//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2eqs_dbg_sel_a or rds2eqs_eq_sel or rds2eqs_eq[5:0] or eqs2ics_eq_over_error or 
	  eqs2scs_eq_ok or eqs2scs_eq_not_en or eqs2ors_sel or eqs2iss_eq_int_l or 
	  eq_fsm_wr or eq_fsm_wr_data) 
  begin
    case (dbg2eqs_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {rds2eqs_eq_sel, rds2eqs_eq[5:0], eqs2ics_eq_over_error};
      3'b001: n_dbg_a = {1'b0, eqs2scs_eq_ok, eqs2scs_eq_not_en, eqs2ors_sel, eqs2iss_eq_int_l[35:32]};
      3'b010: n_dbg_a = {eqs2iss_eq_int_l[7:0]};
      3'b011: n_dbg_a = {eqs2iss_eq_int_l[15:8]};
      3'b100: n_dbg_a = {eqs2iss_eq_int_l[23:16]};
      3'b101: n_dbg_a = {eqs2iss_eq_int_l[31:24]};
      3'b110: n_dbg_a = {5'h0, eq_fsm_wr, eq_fsm_wr_data[1:0]};
      3'b111: n_dbg_a = 8'h00;
    endcase
  end

always @ (dbg2eqs_dbg_sel_b or rds2eqs_eq_sel or rds2eqs_eq[5:0] or eqs2ics_eq_over_error or 
	  eqs2scs_eq_ok or eqs2scs_eq_not_en or eqs2ors_sel or eqs2iss_eq_int_l or 
	  eq_fsm_wr or eq_fsm_wr_data ) 
  begin
    case (dbg2eqs_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {rds2eqs_eq_sel, rds2eqs_eq[5:0], eqs2ics_eq_over_error};
      3'b001: n_dbg_b = {1'b0, eqs2scs_eq_ok, eqs2scs_eq_not_en, eqs2ors_sel, eqs2iss_eq_int_l[35:32]};
      3'b010: n_dbg_b = {eqs2iss_eq_int_l[7:0]};
      3'b011: n_dbg_b = {eqs2iss_eq_int_l[15:8]};
      3'b100: n_dbg_b = {eqs2iss_eq_int_l[23:16]};
      3'b101: n_dbg_b = {eqs2iss_eq_int_l[31:24]};
      3'b110: n_dbg_b = {5'h0, eq_fsm_wr, eq_fsm_wr_data[1:0]};
      3'b111: n_dbg_b = 8'h00;
    endcase
  end

  
always @ (posedge clk)
     begin 
     if (~rst_l ) begin
      dbg_a <= `FIRE_DEBUG_WDTH'b0;
      dbg_b <= `FIRE_DEBUG_WDTH'b0;
     end
     else  begin
      dbg_a <= n_dbg_a;
      dbg_b <= n_dbg_b;
     end   
     end   
   

assign eqs2dbg_dbg_a = dbg_a; 
assign eqs2dbg_dbg_b = dbg_b; 


//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    

 dmu_imu_eqs_csr csr (
 
	.clk					(clk),
	.csrbus_valid				(csrbus_valid),
	.csrbus_done				(csrbus_done),
	.csrbus_mapped				(csrbus_mapped),
	.csrbus_wr_data				(csrbus_wr_data),
	.csrbus_wr				(csrbus_wr),
	.csrbus_read_data			(csrbus_read_data),
	.csrbus_addr				(csrbus_addr),
	.rst_l					(rst_l),
	
	.csrbus_src_bus				(csrbus_src_bus),
	.csrbus_acc_vio				(csrbus_acc_vio),
	.instance_id				(j2d_instance_id),
	
	.ext_wr					(ext_wr),
	
	.eq_ctrl_set_enoverr_ext_wr_data	(set_enoverr_ext_wr_data),
	.eq_ctrl_set_en_ext_wr_data		(set_en_ext_wr_data),
	.eq_ctrl_clr_coverr_ext_wr_data		(clr_coverr_ext_wr_data),
	.eq_ctrl_clr_e2i_ext_wr_data		(clr_e2i_ext_wr_data),
	
	// Dont need anything here same as set_en_ext_wr_data 
	// csrtool quork spits out twice for same data bitI only need 1 to pass to fsm's
	.eq_ctrl_clr_dis_ext_wr_data		(),	
	
	.eq_base_address_address_hw_read	(eq_base_address),
	
	.eq_ctrl_set_ext_select_0		(sw_set_addr_sel_eq_0),
	.eq_ctrl_set_ext_select_1		(sw_set_addr_sel_eq_1),
	.eq_ctrl_set_ext_select_2		(sw_set_addr_sel_eq_2),
	.eq_ctrl_set_ext_select_3		(sw_set_addr_sel_eq_3),
	.eq_ctrl_set_ext_select_4		(sw_set_addr_sel_eq_4),
	.eq_ctrl_set_ext_select_5		(sw_set_addr_sel_eq_5),
	.eq_ctrl_set_ext_select_6		(sw_set_addr_sel_eq_6),
	.eq_ctrl_set_ext_select_7		(sw_set_addr_sel_eq_7),
	.eq_ctrl_set_ext_select_8		(sw_set_addr_sel_eq_8),
	.eq_ctrl_set_ext_select_9		(sw_set_addr_sel_eq_9),
	.eq_ctrl_set_ext_select_10		(sw_set_addr_sel_eq_10),
	.eq_ctrl_set_ext_select_11		(sw_set_addr_sel_eq_11),
	.eq_ctrl_set_ext_select_12		(sw_set_addr_sel_eq_12),
	.eq_ctrl_set_ext_select_13		(sw_set_addr_sel_eq_13),
	.eq_ctrl_set_ext_select_14		(sw_set_addr_sel_eq_14),
	.eq_ctrl_set_ext_select_15		(sw_set_addr_sel_eq_15),
	.eq_ctrl_set_ext_select_16		(sw_set_addr_sel_eq_16),
	.eq_ctrl_set_ext_select_17		(sw_set_addr_sel_eq_17),
	.eq_ctrl_set_ext_select_18		(sw_set_addr_sel_eq_18),
	.eq_ctrl_set_ext_select_19		(sw_set_addr_sel_eq_19),
	.eq_ctrl_set_ext_select_20		(sw_set_addr_sel_eq_20),
	.eq_ctrl_set_ext_select_21		(sw_set_addr_sel_eq_21),
	.eq_ctrl_set_ext_select_22		(sw_set_addr_sel_eq_22),
	.eq_ctrl_set_ext_select_23		(sw_set_addr_sel_eq_23),
	.eq_ctrl_set_ext_select_24		(sw_set_addr_sel_eq_24),
	.eq_ctrl_set_ext_select_25		(sw_set_addr_sel_eq_25),
	.eq_ctrl_set_ext_select_26		(sw_set_addr_sel_eq_26),
	.eq_ctrl_set_ext_select_27		(sw_set_addr_sel_eq_27),
	.eq_ctrl_set_ext_select_28		(sw_set_addr_sel_eq_28),
	.eq_ctrl_set_ext_select_29		(sw_set_addr_sel_eq_29),
	.eq_ctrl_set_ext_select_30		(sw_set_addr_sel_eq_30),
	.eq_ctrl_set_ext_select_31		(sw_set_addr_sel_eq_31),
	.eq_ctrl_set_ext_select_32		(sw_set_addr_sel_eq_32),
	.eq_ctrl_set_ext_select_33		(sw_set_addr_sel_eq_33),
	.eq_ctrl_set_ext_select_34		(sw_set_addr_sel_eq_34),
	.eq_ctrl_set_ext_select_35		(sw_set_addr_sel_eq_35),
	
	
	.eq_ctrl_clr_ext_select_0		(sw_clr_addr_sel_eq_0),
	.eq_ctrl_clr_ext_select_1		(sw_clr_addr_sel_eq_1),
	.eq_ctrl_clr_ext_select_2		(sw_clr_addr_sel_eq_2),
	.eq_ctrl_clr_ext_select_3		(sw_clr_addr_sel_eq_3),
	.eq_ctrl_clr_ext_select_4		(sw_clr_addr_sel_eq_4),
	.eq_ctrl_clr_ext_select_5		(sw_clr_addr_sel_eq_5),
	.eq_ctrl_clr_ext_select_6		(sw_clr_addr_sel_eq_6),
	.eq_ctrl_clr_ext_select_7		(sw_clr_addr_sel_eq_7),
	.eq_ctrl_clr_ext_select_8		(sw_clr_addr_sel_eq_8),
	.eq_ctrl_clr_ext_select_9		(sw_clr_addr_sel_eq_9),
	.eq_ctrl_clr_ext_select_10		(sw_clr_addr_sel_eq_10),
	.eq_ctrl_clr_ext_select_11		(sw_clr_addr_sel_eq_11),
	.eq_ctrl_clr_ext_select_12		(sw_clr_addr_sel_eq_12),
	.eq_ctrl_clr_ext_select_13		(sw_clr_addr_sel_eq_13),
	.eq_ctrl_clr_ext_select_14		(sw_clr_addr_sel_eq_14),
	.eq_ctrl_clr_ext_select_15		(sw_clr_addr_sel_eq_15),
	.eq_ctrl_clr_ext_select_16		(sw_clr_addr_sel_eq_16),
	.eq_ctrl_clr_ext_select_17		(sw_clr_addr_sel_eq_17),
	.eq_ctrl_clr_ext_select_18		(sw_clr_addr_sel_eq_18),
	.eq_ctrl_clr_ext_select_19		(sw_clr_addr_sel_eq_19),
	.eq_ctrl_clr_ext_select_20		(sw_clr_addr_sel_eq_20),
	.eq_ctrl_clr_ext_select_21		(sw_clr_addr_sel_eq_21),
	.eq_ctrl_clr_ext_select_22		(sw_clr_addr_sel_eq_22),
	.eq_ctrl_clr_ext_select_23		(sw_clr_addr_sel_eq_23),
	.eq_ctrl_clr_ext_select_24		(sw_clr_addr_sel_eq_24),
	.eq_ctrl_clr_ext_select_25		(sw_clr_addr_sel_eq_25),
	.eq_ctrl_clr_ext_select_26		(sw_clr_addr_sel_eq_26),
	.eq_ctrl_clr_ext_select_27		(sw_clr_addr_sel_eq_27),
	.eq_ctrl_clr_ext_select_28		(sw_clr_addr_sel_eq_28),
	.eq_ctrl_clr_ext_select_29		(sw_clr_addr_sel_eq_29),
	.eq_ctrl_clr_ext_select_30		(sw_clr_addr_sel_eq_30),
	.eq_ctrl_clr_ext_select_31		(sw_clr_addr_sel_eq_31),
	.eq_ctrl_clr_ext_select_32		(sw_clr_addr_sel_eq_32),
	.eq_ctrl_clr_ext_select_33		(sw_clr_addr_sel_eq_33),
	.eq_ctrl_clr_ext_select_34		(sw_clr_addr_sel_eq_34),
	.eq_ctrl_clr_ext_select_35		(sw_clr_addr_sel_eq_35),
	
	
	.eq_state_state_ext_read_data_0		(eq_state_0),
	.eq_state_state_ext_read_data_1		(eq_state_1),
	.eq_state_state_ext_read_data_2		(eq_state_2),
	.eq_state_state_ext_read_data_3		(eq_state_3),
	.eq_state_state_ext_read_data_4		(eq_state_4),
	.eq_state_state_ext_read_data_5		(eq_state_5),
	.eq_state_state_ext_read_data_6		(eq_state_6),
	.eq_state_state_ext_read_data_7		(eq_state_7),
	.eq_state_state_ext_read_data_8		(eq_state_8),
	.eq_state_state_ext_read_data_9		(eq_state_9),
	.eq_state_state_ext_read_data_10	(eq_state_10),
	.eq_state_state_ext_read_data_11	(eq_state_11),
	.eq_state_state_ext_read_data_12	(eq_state_12),
	.eq_state_state_ext_read_data_13	(eq_state_13),
	.eq_state_state_ext_read_data_14	(eq_state_14),
	.eq_state_state_ext_read_data_15	(eq_state_15),
	.eq_state_state_ext_read_data_16	(eq_state_16),
	.eq_state_state_ext_read_data_17	(eq_state_17),
	.eq_state_state_ext_read_data_18	(eq_state_18),
	.eq_state_state_ext_read_data_19	(eq_state_19),
	.eq_state_state_ext_read_data_20	(eq_state_20),
	.eq_state_state_ext_read_data_21	(eq_state_21),
	.eq_state_state_ext_read_data_22	(eq_state_22),
	.eq_state_state_ext_read_data_23	(eq_state_23),
	.eq_state_state_ext_read_data_24	(eq_state_24),
	.eq_state_state_ext_read_data_25	(eq_state_25),
	.eq_state_state_ext_read_data_26	(eq_state_26),
	.eq_state_state_ext_read_data_27	(eq_state_27),
	.eq_state_state_ext_read_data_28	(eq_state_28),
	.eq_state_state_ext_read_data_29	(eq_state_29),
	.eq_state_state_ext_read_data_30	(eq_state_30),
	.eq_state_state_ext_read_data_31	(eq_state_31),
	.eq_state_state_ext_read_data_32	(eq_state_32),
	.eq_state_state_ext_read_data_33	(eq_state_33),
	.eq_state_state_ext_read_data_34	(eq_state_34),
	.eq_state_state_ext_read_data_35	(eq_state_35),
	
	
	.eq_tail_overr_hw_ld_0			(load_over_err_eq_0),
	.eq_tail_overr_hw_ld_1			(load_over_err_eq_1),
	.eq_tail_overr_hw_ld_2			(load_over_err_eq_2),
	.eq_tail_overr_hw_ld_3			(load_over_err_eq_3),
	.eq_tail_overr_hw_ld_4			(load_over_err_eq_4),
	.eq_tail_overr_hw_ld_5			(load_over_err_eq_5),
	.eq_tail_overr_hw_ld_6			(load_over_err_eq_6),
	.eq_tail_overr_hw_ld_7			(load_over_err_eq_7),
	.eq_tail_overr_hw_ld_8			(load_over_err_eq_8),
	.eq_tail_overr_hw_ld_9			(load_over_err_eq_9),
	.eq_tail_overr_hw_ld_10			(load_over_err_eq_10),
	.eq_tail_overr_hw_ld_11			(load_over_err_eq_11),
	.eq_tail_overr_hw_ld_12			(load_over_err_eq_12),
	.eq_tail_overr_hw_ld_13			(load_over_err_eq_13),
	.eq_tail_overr_hw_ld_14			(load_over_err_eq_14),
	.eq_tail_overr_hw_ld_15			(load_over_err_eq_15),
	.eq_tail_overr_hw_ld_16			(load_over_err_eq_16),
	.eq_tail_overr_hw_ld_17			(load_over_err_eq_17),
	.eq_tail_overr_hw_ld_18			(load_over_err_eq_18),
	.eq_tail_overr_hw_ld_19			(load_over_err_eq_19),
	.eq_tail_overr_hw_ld_20			(load_over_err_eq_20),
	.eq_tail_overr_hw_ld_21			(load_over_err_eq_21),
	.eq_tail_overr_hw_ld_22			(load_over_err_eq_22),
	.eq_tail_overr_hw_ld_23			(load_over_err_eq_23),
	.eq_tail_overr_hw_ld_24			(load_over_err_eq_24),
	.eq_tail_overr_hw_ld_25			(load_over_err_eq_25),
	.eq_tail_overr_hw_ld_26			(load_over_err_eq_26),
	.eq_tail_overr_hw_ld_27			(load_over_err_eq_27),
	.eq_tail_overr_hw_ld_28			(load_over_err_eq_28),
	.eq_tail_overr_hw_ld_29			(load_over_err_eq_29),
	.eq_tail_overr_hw_ld_30			(load_over_err_eq_30),
	.eq_tail_overr_hw_ld_31			(load_over_err_eq_31),
	.eq_tail_overr_hw_ld_32			(load_over_err_eq_32),
	.eq_tail_overr_hw_ld_33			(load_over_err_eq_33),
	.eq_tail_overr_hw_ld_34			(load_over_err_eq_34),
	.eq_tail_overr_hw_ld_35			(load_over_err_eq_35),
	
	
	.eq_tail_overr_hw_write_0		(data_over_err_eq_0),
	.eq_tail_overr_hw_write_1		(data_over_err_eq_1),
	.eq_tail_overr_hw_write_2		(data_over_err_eq_2),
	.eq_tail_overr_hw_write_3		(data_over_err_eq_3),
	.eq_tail_overr_hw_write_4		(data_over_err_eq_4),
	.eq_tail_overr_hw_write_5		(data_over_err_eq_5),
	.eq_tail_overr_hw_write_6		(data_over_err_eq_6),
	.eq_tail_overr_hw_write_7		(data_over_err_eq_7),
	.eq_tail_overr_hw_write_8		(data_over_err_eq_8),
	.eq_tail_overr_hw_write_9		(data_over_err_eq_9),
	.eq_tail_overr_hw_write_10		(data_over_err_eq_10),
	.eq_tail_overr_hw_write_11		(data_over_err_eq_11),
	.eq_tail_overr_hw_write_12		(data_over_err_eq_12),
	.eq_tail_overr_hw_write_13		(data_over_err_eq_13),
	.eq_tail_overr_hw_write_14		(data_over_err_eq_14),
	.eq_tail_overr_hw_write_15		(data_over_err_eq_15),
	.eq_tail_overr_hw_write_16		(data_over_err_eq_16),
	.eq_tail_overr_hw_write_17		(data_over_err_eq_17),
	.eq_tail_overr_hw_write_18		(data_over_err_eq_18),
	.eq_tail_overr_hw_write_19		(data_over_err_eq_19),
	.eq_tail_overr_hw_write_20		(data_over_err_eq_20),
	.eq_tail_overr_hw_write_21		(data_over_err_eq_21),
	.eq_tail_overr_hw_write_22		(data_over_err_eq_22),
	.eq_tail_overr_hw_write_23		(data_over_err_eq_23),
	.eq_tail_overr_hw_write_24		(data_over_err_eq_24),
	.eq_tail_overr_hw_write_25		(data_over_err_eq_25),
	.eq_tail_overr_hw_write_26		(data_over_err_eq_26),
	.eq_tail_overr_hw_write_27		(data_over_err_eq_27),
	.eq_tail_overr_hw_write_28		(data_over_err_eq_28),
	.eq_tail_overr_hw_write_29		(data_over_err_eq_29),
	.eq_tail_overr_hw_write_30		(data_over_err_eq_30),
	.eq_tail_overr_hw_write_31		(data_over_err_eq_31),
	.eq_tail_overr_hw_write_32		(data_over_err_eq_32),
	.eq_tail_overr_hw_write_33		(data_over_err_eq_33),
	.eq_tail_overr_hw_write_34		(data_over_err_eq_34),
	.eq_tail_overr_hw_write_35		(data_over_err_eq_35),
	
	
	.eq_tail_tail_hw_ld_0			(t_ptr_inc_sel_0),
	.eq_tail_tail_hw_ld_1			(t_ptr_inc_sel_1),
	.eq_tail_tail_hw_ld_2			(t_ptr_inc_sel_2),
	.eq_tail_tail_hw_ld_3			(t_ptr_inc_sel_3),
	.eq_tail_tail_hw_ld_4			(t_ptr_inc_sel_4),
	.eq_tail_tail_hw_ld_5			(t_ptr_inc_sel_5),
	.eq_tail_tail_hw_ld_6			(t_ptr_inc_sel_6),
	.eq_tail_tail_hw_ld_7			(t_ptr_inc_sel_7),
	.eq_tail_tail_hw_ld_8			(t_ptr_inc_sel_8),
	.eq_tail_tail_hw_ld_9			(t_ptr_inc_sel_9),
	.eq_tail_tail_hw_ld_10			(t_ptr_inc_sel_10),
	.eq_tail_tail_hw_ld_11			(t_ptr_inc_sel_11),
	.eq_tail_tail_hw_ld_12			(t_ptr_inc_sel_12),
	.eq_tail_tail_hw_ld_13			(t_ptr_inc_sel_13),
	.eq_tail_tail_hw_ld_14			(t_ptr_inc_sel_14),
	.eq_tail_tail_hw_ld_15			(t_ptr_inc_sel_15),
	.eq_tail_tail_hw_ld_16			(t_ptr_inc_sel_16),
	.eq_tail_tail_hw_ld_17			(t_ptr_inc_sel_17),
	.eq_tail_tail_hw_ld_18			(t_ptr_inc_sel_18),
	.eq_tail_tail_hw_ld_19			(t_ptr_inc_sel_19),
	.eq_tail_tail_hw_ld_20			(t_ptr_inc_sel_20),
	.eq_tail_tail_hw_ld_21			(t_ptr_inc_sel_21),
	.eq_tail_tail_hw_ld_22			(t_ptr_inc_sel_22),
	.eq_tail_tail_hw_ld_23			(t_ptr_inc_sel_23),
	.eq_tail_tail_hw_ld_24			(t_ptr_inc_sel_24),
	.eq_tail_tail_hw_ld_25			(t_ptr_inc_sel_25),
	.eq_tail_tail_hw_ld_26			(t_ptr_inc_sel_26),
	.eq_tail_tail_hw_ld_27			(t_ptr_inc_sel_27),
	.eq_tail_tail_hw_ld_28			(t_ptr_inc_sel_28),
	.eq_tail_tail_hw_ld_29			(t_ptr_inc_sel_29),
	.eq_tail_tail_hw_ld_30			(t_ptr_inc_sel_30),
	.eq_tail_tail_hw_ld_31			(t_ptr_inc_sel_31),
	.eq_tail_tail_hw_ld_32			(t_ptr_inc_sel_32),
	.eq_tail_tail_hw_ld_33			(t_ptr_inc_sel_33),
	.eq_tail_tail_hw_ld_34			(t_ptr_inc_sel_34),
	.eq_tail_tail_hw_ld_35			(t_ptr_inc_sel_35),
	
	
	.eq_tail_tail_hw_write_0		(t_ptr_inc_0),
	.eq_tail_tail_hw_write_1		(t_ptr_inc_1),
	.eq_tail_tail_hw_write_2		(t_ptr_inc_2),
	.eq_tail_tail_hw_write_3		(t_ptr_inc_3),
	.eq_tail_tail_hw_write_4		(t_ptr_inc_4),
	.eq_tail_tail_hw_write_5		(t_ptr_inc_5),
	.eq_tail_tail_hw_write_6		(t_ptr_inc_6),
	.eq_tail_tail_hw_write_7		(t_ptr_inc_7),
	.eq_tail_tail_hw_write_8		(t_ptr_inc_8),
	.eq_tail_tail_hw_write_9		(t_ptr_inc_9),
	.eq_tail_tail_hw_write_10		(t_ptr_inc_10),
	.eq_tail_tail_hw_write_11		(t_ptr_inc_11),
	.eq_tail_tail_hw_write_12		(t_ptr_inc_12),
	.eq_tail_tail_hw_write_13		(t_ptr_inc_13),
	.eq_tail_tail_hw_write_14		(t_ptr_inc_14),
	.eq_tail_tail_hw_write_15		(t_ptr_inc_15),
	.eq_tail_tail_hw_write_16		(t_ptr_inc_16),
	.eq_tail_tail_hw_write_17		(t_ptr_inc_17),
	.eq_tail_tail_hw_write_18		(t_ptr_inc_18),
	.eq_tail_tail_hw_write_19		(t_ptr_inc_19),
	.eq_tail_tail_hw_write_20		(t_ptr_inc_20),
	.eq_tail_tail_hw_write_21		(t_ptr_inc_21),
	.eq_tail_tail_hw_write_22		(t_ptr_inc_22),
	.eq_tail_tail_hw_write_23		(t_ptr_inc_23),
	.eq_tail_tail_hw_write_24		(t_ptr_inc_24),
	.eq_tail_tail_hw_write_25		(t_ptr_inc_25),
	.eq_tail_tail_hw_write_26		(t_ptr_inc_26),
	.eq_tail_tail_hw_write_27		(t_ptr_inc_27),
	.eq_tail_tail_hw_write_28		(t_ptr_inc_28),
	.eq_tail_tail_hw_write_29		(t_ptr_inc_29),
	.eq_tail_tail_hw_write_30		(t_ptr_inc_30),
	.eq_tail_tail_hw_write_31		(t_ptr_inc_31),
	.eq_tail_tail_hw_write_32		(t_ptr_inc_32),
	.eq_tail_tail_hw_write_33		(t_ptr_inc_33),
	.eq_tail_tail_hw_write_34		(t_ptr_inc_34),
	.eq_tail_tail_hw_write_35		(t_ptr_inc_35),
	
	
	.eq_tail_tail_hw_read_0			(t_ptr_0),
	.eq_tail_tail_hw_read_1			(t_ptr_1),
	.eq_tail_tail_hw_read_2			(t_ptr_2),
	.eq_tail_tail_hw_read_3			(t_ptr_3),
	.eq_tail_tail_hw_read_4			(t_ptr_4),
	.eq_tail_tail_hw_read_5			(t_ptr_5),
	.eq_tail_tail_hw_read_6			(t_ptr_6),
	.eq_tail_tail_hw_read_7			(t_ptr_7),
	.eq_tail_tail_hw_read_8			(t_ptr_8),
	.eq_tail_tail_hw_read_9			(t_ptr_9),
	.eq_tail_tail_hw_read_10		(t_ptr_10),
	.eq_tail_tail_hw_read_11		(t_ptr_11),
	.eq_tail_tail_hw_read_12		(t_ptr_12),
	.eq_tail_tail_hw_read_13		(t_ptr_13),
	.eq_tail_tail_hw_read_14		(t_ptr_14),
	.eq_tail_tail_hw_read_15		(t_ptr_15),
	.eq_tail_tail_hw_read_16		(t_ptr_16),
	.eq_tail_tail_hw_read_17		(t_ptr_17),
	.eq_tail_tail_hw_read_18		(t_ptr_18),
	.eq_tail_tail_hw_read_19		(t_ptr_19),
	.eq_tail_tail_hw_read_20		(t_ptr_20),
	.eq_tail_tail_hw_read_21		(t_ptr_21),
	.eq_tail_tail_hw_read_22		(t_ptr_22),
	.eq_tail_tail_hw_read_23		(t_ptr_23),
	.eq_tail_tail_hw_read_24		(t_ptr_24),
	.eq_tail_tail_hw_read_25		(t_ptr_25),
	.eq_tail_tail_hw_read_26		(t_ptr_26),
	.eq_tail_tail_hw_read_27		(t_ptr_27),
	.eq_tail_tail_hw_read_28		(t_ptr_28),
	.eq_tail_tail_hw_read_29		(t_ptr_29),
	.eq_tail_tail_hw_read_30		(t_ptr_30),
	.eq_tail_tail_hw_read_31		(t_ptr_31),
	.eq_tail_tail_hw_read_32		(t_ptr_32),
	.eq_tail_tail_hw_read_33		(t_ptr_33),
	.eq_tail_tail_hw_read_34		(t_ptr_34),
	.eq_tail_tail_hw_read_35		(t_ptr_35),
	
	
	.eq_head_head_hw_read_0			(h_ptr_0),
	.eq_head_head_hw_read_1			(h_ptr_1),
	.eq_head_head_hw_read_2			(h_ptr_2),
	.eq_head_head_hw_read_3			(h_ptr_3),
	.eq_head_head_hw_read_4			(h_ptr_4),
	.eq_head_head_hw_read_5			(h_ptr_5),
	.eq_head_head_hw_read_6			(h_ptr_6),
	.eq_head_head_hw_read_7			(h_ptr_7),
	.eq_head_head_hw_read_8			(h_ptr_8),
	.eq_head_head_hw_read_9			(h_ptr_9),
	.eq_head_head_hw_read_10		(h_ptr_10),
	.eq_head_head_hw_read_11		(h_ptr_11),
	.eq_head_head_hw_read_12		(h_ptr_12),
	.eq_head_head_hw_read_13		(h_ptr_13),
	.eq_head_head_hw_read_14		(h_ptr_14),
	.eq_head_head_hw_read_15		(h_ptr_15),
	.eq_head_head_hw_read_16		(h_ptr_16),
	.eq_head_head_hw_read_17		(h_ptr_17),
	.eq_head_head_hw_read_18		(h_ptr_18),
	.eq_head_head_hw_read_19		(h_ptr_19),
	.eq_head_head_hw_read_20		(h_ptr_20),
	.eq_head_head_hw_read_21		(h_ptr_21),
	.eq_head_head_hw_read_22		(h_ptr_22),
	.eq_head_head_hw_read_23		(h_ptr_23),
	.eq_head_head_hw_read_24		(h_ptr_24),
	.eq_head_head_hw_read_25		(h_ptr_25),
	.eq_head_head_hw_read_26		(h_ptr_26),
	.eq_head_head_hw_read_27		(h_ptr_27),
	.eq_head_head_hw_read_28		(h_ptr_28),
	.eq_head_head_hw_read_29		(h_ptr_29),
	.eq_head_head_hw_read_30		(h_ptr_30),
	.eq_head_head_hw_read_31		(h_ptr_31),
	.eq_head_head_hw_read_32		(h_ptr_32),
	.eq_head_head_hw_read_33		(h_ptr_33),
	.eq_head_head_hw_read_34		(h_ptr_34),
	.eq_head_head_hw_read_35		(h_ptr_35)

	);

							
dmu_imu_eqs_fsm fsm_0 ( 				//------ 
							//  EQ 0 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_0), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_0),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_0),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_0));
		
		
dmu_imu_eqs_fsm fsm_1 ( 				//------ 
							//  EQ 1 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_1), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_1),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_1),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_1));
		
dmu_imu_eqs_fsm fsm_2 ( 				//------ 
							//  EQ 2 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_2), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_2),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_2),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_2));		
		
		
dmu_imu_eqs_fsm fsm_3 ( 				//------ 
							//  EQ 3 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_3), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_3),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_3),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_3));
		
		
dmu_imu_eqs_fsm fsm_4 ( 				//------ 
							//  EQ 4 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_4), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_4),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_4),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_4));
		
dmu_imu_eqs_fsm fsm_5 ( 				//------ 
							//  EQ 5 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_5), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_5),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_5),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_5));		
		
dmu_imu_eqs_fsm fsm_6 ( 				//------ 
							//  EQ 6 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_6), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_6),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_6),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_6));
		
		
dmu_imu_eqs_fsm fsm_7 ( 				//------ 
							//  EQ 7 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_7), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_7),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_7),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_7));
		
dmu_imu_eqs_fsm fsm_8 ( 				//------ 
							//  EQ 8 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_8), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_8),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_8),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_8));		
		
dmu_imu_eqs_fsm fsm_9 ( 				//------ 
							//  EQ 9 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_9), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_9),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_9),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_9));
		
		
dmu_imu_eqs_fsm fsm_10 ( 				//------ 
							//  EQ 10 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_10), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_10),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_10),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_10));
		
dmu_imu_eqs_fsm fsm_11 ( 				//------ 
							//  EQ 11 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_11), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_11),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_11),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_11));		
		
dmu_imu_eqs_fsm fsm_12 ( 				//------ 
							//  EQ 12 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_12), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_12),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_12),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_12));
		
		
dmu_imu_eqs_fsm fsm_13 ( 				//------ 
							//  EQ 13 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_13), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_13),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_13),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_13));
		
dmu_imu_eqs_fsm fsm_14 ( 				//------ 
							//  EQ 14 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_14), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_14),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_14),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_14));		
		
dmu_imu_eqs_fsm fsm_15 ( 				//------ 
							//  EQ 15 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_15), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_15),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_15),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_15));
		
		
		
dmu_imu_eqs_fsm fsm_16 ( 				//------ 
							//  EQ 16 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_16), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_16),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_16),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_16));
		
		
dmu_imu_eqs_fsm fsm_17 ( 				//------ 
							//  EQ 17 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_17), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_17),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_17),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_17));
		
dmu_imu_eqs_fsm fsm_18 ( 				//------ 
							//  EQ 18 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_18), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_18),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_18),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_18));		
		
dmu_imu_eqs_fsm fsm_19 ( 				//------ 
							//  EQ 19 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_19), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_19),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_19),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_19));
		
		
							
dmu_imu_eqs_fsm fsm_20 ( 				//------ 
							//  EQ 20 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_20), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_20),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_20),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_20));
		
		
dmu_imu_eqs_fsm fsm_21 ( 				//------ 
							//  EQ 21 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_21), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_21),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_21),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_21));
		
dmu_imu_eqs_fsm fsm_22 ( 				//------ 
							//  EQ 22 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_22), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_22),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_22),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_22));		
		
		
dmu_imu_eqs_fsm fsm_23 ( 				//------ 
							//  EQ 23 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_23), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_23),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_23),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_23));
		
		
dmu_imu_eqs_fsm fsm_24 ( 				//------ 
							//  EQ 24 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_24), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_24),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_24),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_24));
		
dmu_imu_eqs_fsm fsm_25 ( 				//------ 
							//  EQ 25 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_25), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_25),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_25),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_25));		
		
dmu_imu_eqs_fsm fsm_26 ( 				//------ 
							//  EQ 26 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_26), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_26),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_26),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_26));
		
		
dmu_imu_eqs_fsm fsm_27 ( 				//------ 
							//  EQ 27 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_27), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_27),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_27),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_27));
		
dmu_imu_eqs_fsm fsm_28 ( 				//------ 
							//  EQ 28 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_28), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_28),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_28),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_28));		
		
dmu_imu_eqs_fsm fsm_29 ( 				//------ 
							//  EQ 29 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_29), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_29),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_29),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_29));
				
		

							
dmu_imu_eqs_fsm fsm_30 ( 				//------ 
							//  EQ 30 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_30), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_30),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_30),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_30));
		
		
dmu_imu_eqs_fsm fsm_31 ( 				//------ 
							//  EQ 31 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_31), 

		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_31),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_31),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_31));
		
dmu_imu_eqs_fsm fsm_32 ( 				//------ 
							//  EQ 32 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_32), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_32),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_32),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_32));		
		
		
dmu_imu_eqs_fsm fsm_33 ( 				//------ 
							//  EQ 33 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_33), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_33),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_33),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_33));
		
		
dmu_imu_eqs_fsm fsm_34 ( 				//------ 
							//  EQ 34 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_34), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_34),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_34),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_34));
		
dmu_imu_eqs_fsm fsm_35 ( 				//------ 
							//  EQ 35 
		.clk                	(clk),		//------
		.rst_l                	(rst_l),
		
		.set_over_err    	(set_over_err_eq_35), 
		
		.sw_wr			(eq_fsm_wr),
		.sw_set_addr_sel	(sw_set_addr_sel_eq_35),
		.sw_clr_addr_sel	(sw_clr_addr_sel_eq_35),
		.sw_wr_data		(eq_fsm_wr_data),
		
		.eq_state               (eq_state_35));		
				


endmodule 
