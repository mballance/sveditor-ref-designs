// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss.v
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
module dmu_imu_iss (

		// Clock and Reset 

		clk,
		rst_l,
		
		// External Interrupt Signals 
		
//		j2d_ext_int_l,
		 
		// INT X Interrupt Signals 
		
		rds2iss_intx_int_l, 
		
		// EQ Interrupt Signals
		
		eqs2iss_eq_int_l, 
		
		// I2C Interrupt Signals 
		
//		j2d_i2c0_int_l, 
//		j2d_i2c1_int_l,
		
		// Internal Core Interrupt Signals 
		
		ics2iss_mondo_62_int_l,  
		ics2iss_mondo_63_int_l,  
//		j2d_jbc_int_l, 

		// Mondo Request Outputs to GCS
		
		iss2gcs_gc_0_mdo_needed, 
		iss2gcs_gc_1_mdo_needed,
		iss2gcs_gc_2_mdo_needed,
		iss2gcs_gc_3_mdo_needed,		
		
		// CPU ID Request Inputs from GCS
		
		gcs2iss_tid_req,
		gcs2iss_tid_sel,
		gcs2iss_mdo_pending, 
		
		// CPU ID Response Outputs to GCS
		
		iss2gcs_tid_ack, 
		iss2gcs_tid, 	
		iss2gcs_mondo_mode,
		
		// Retry Timer Counter Limit to GCS
		
		iss2gcs_counter_limit,
				
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
		
		dbg2iss_dbg_sel_a,
		dbg2iss_dbg_sel_b,
		iss2dbg_dbg_a,
		iss2dbg_dbg_b
		
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################


  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 	clk;
  input		rst_l; 
  
  //------------------------------------------------------------------------
  // External Interrupt Signals 
  //------------------------------------------------------------------------
//  input	[19:0]	j2d_ext_int_l;
  

  //------------------------------------------------------------------------
  // INT X Interrupt Signals 
  //------------------------------------------------------------------------
  input	[3:0]	rds2iss_intx_int_l;
  

  //------------------------------------------------------------------------
  // EQ Interrupt Signals 
  //------------------------------------------------------------------------
  input	[35:0]	eqs2iss_eq_int_l;
  
  
  //------------------------------------------------------------------------
  // I2C Interrupt Signals 
  //------------------------------------------------------------------------
//  input		j2d_i2c0_int_l;  
//  input		j2d_i2c1_int_l;
  
  //------------------------------------------------------------------------
  // Internal Core Interrupt Signals 
  //------------------------------------------------------------------------
  input		ics2iss_mondo_62_int_l;  
  input		ics2iss_mondo_63_int_l;  
//  input		j2d_jbc_int_l;
  
  
  //------------------------------------------------------------------------
  // Mondo Requests Going to each of the 4 group controllers      
  //------------------------------------------------------------------------

  output [63:0]  iss2gcs_gc_0_mdo_needed;  //Requests to issue and interrupt from GC 0   
  output [63:0]  iss2gcs_gc_1_mdo_needed;  //Requests to issue and interrupt from GC 1 
  output [63:0]  iss2gcs_gc_2_mdo_needed;  //Requests to issue and interrupt from GC 2  
  output [63:0]  iss2gcs_gc_3_mdo_needed;  //Requests to issue and interrupt from GC 3 
  
  //------------------------------------------------------------------------
  // Requests to INT state for TID and to move winner to PENDING   
  //------------------------------------------------------------------------
  
  input         gcs2iss_tid_req;        // Request to ISS for TID for accepted mondo
  input	 [5:0]  gcs2iss_tid_sel;	// Select for the TID output mux
  input  [63:0] gcs2iss_mdo_pending;    // ID of mondo that was accecpted

  output        iss2gcs_tid_ack;  	// ACK Qualifier for tid of mondo	
  output [5:0]  iss2gcs_tid;           	// TID of mondo 
  output  	iss2gcs_mondo_mode;     // Mondo Mode of the Mondo
  
  
  //------------------------------------------------------------------------
  // PIO INTERFACE   
  //------------------------------------------------------------------------
  
  output [24:0] iss2gcs_counter_limit; 	// COunter Limit for the Mondo Retry Counter

  //------------------------------------------------------------------------
  // PIO INTERFACE   
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

  input [2:0] 					dbg2iss_dbg_sel_a;
  input [2:0] 					dbg2iss_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		iss2dbg_dbg_b;


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  //**************************************************
  // Wires 
  //**************************************************

  //------------------------------------------------------------------------
  // Wires for the CSR access to the state machines   
  //------------------------------------------------------------------------

   wire [1:0] 	sw_state_data;       	// The two bits of data to control the state of each Mondo        
   wire 	sw_state_wr; 		// Write strobe saying PIO is to a state reg

   wire    	ext_wr; 		// Signals from the PIO controller that serve the same purpose as above 
   wire [1:0]	int_state_ext_wr_data; 
   
  //------------------------------------------------------------------------
  // Wires for setting up the maskes for each of the group controllers   
  //------------------------------------------------------------------------
   wire	[63:0]	g0_mask; 
   wire [63:0]  g1_mask; 
   wire [63:0]  g2_mask; 
   wire [63:0]  g3_mask; 
   wire [63:0]  group_valid; 

   wire [23:0]  sw_mondo_state_1; 
   wire [63:0]  sw_mondo_state_2; 

   wire [63:0]  mondo_state_vector_0; 
   wire [63:0]  mondo_state_vector_1; 
	
	
  //------------------
  // Mondo Mode Bits  
  //------------------
   wire 	 mondo_mode_0,  mondo_mode_1,  mondo_mode_2,  mondo_mode_3,  mondo_mode_4,  mondo_mode_5,  mondo_mode_6,  mondo_mode_7;  
   wire 	 mondo_mode_8,  mondo_mode_9,  mondo_mode_10, mondo_mode_11, mondo_mode_12, mondo_mode_13, mondo_mode_14, mondo_mode_15; 
   wire 	 mondo_mode_16, mondo_mode_17, mondo_mode_18, mondo_mode_19, mondo_mode_20, mondo_mode_21, mondo_mode_22, mondo_mode_23; 
   wire  	 mondo_mode_24, mondo_mode_25, mondo_mode_26, mondo_mode_27, mondo_mode_28, mondo_mode_29, mondo_mode_30, mondo_mode_31;
   wire 	 mondo_mode_32, mondo_mode_33, mondo_mode_34, mondo_mode_35, mondo_mode_36, mondo_mode_37, mondo_mode_38, mondo_mode_39; 
   wire 	 mondo_mode_40, mondo_mode_41, mondo_mode_42, mondo_mode_43, mondo_mode_44, mondo_mode_45, mondo_mode_46, mondo_mode_47; 
   wire 	 mondo_mode_48, mondo_mode_49, mondo_mode_50, mondo_mode_51, mondo_mode_52, mondo_mode_53, mondo_mode_54, mondo_mode_55; 
   wire  	 mondo_mode_56, mondo_mode_57, mondo_mode_58, mondo_mode_59, mondo_mode_60, mondo_mode_61, mondo_mode_62, mondo_mode_63;
	
	
	
  //------------------
  // Mondo Valid Bits  
  //------------------
   wire 	 valid_0,  valid_1,  valid_2,  valid_3,  valid_4,  valid_5,  valid_6,  valid_7;  
   wire 	 valid_8,  valid_9,  valid_10, valid_11, valid_12, valid_13, valid_14, valid_15; 
   wire 	 valid_16, valid_17, valid_18, valid_19, valid_20, valid_21, valid_22, valid_23; 
   wire  	 valid_24, valid_25, valid_26, valid_27, valid_28, valid_29, valid_30, valid_31;
   wire 	 valid_32, valid_33, valid_34, valid_35, valid_36, valid_37, valid_38, valid_39; 
   wire 	 valid_40, valid_41, valid_42, valid_43, valid_44, valid_45, valid_46, valid_47; 
   wire 	 valid_48, valid_49, valid_50, valid_51, valid_52, valid_53, valid_54, valid_55; 
   wire  	 valid_56, valid_57, valid_58, valid_59, valid_60, valid_61, valid_62, valid_63;


  //------------------
  // Mondo Group Bits  
  //------------------
   wire	[3:0] 	group_0,  group_1,  group_2,  group_3,  group_4,  group_5,  group_6,  group_7; 
   wire [3:0] 	group_8,  group_9,  group_10, group_11, group_12, group_13, group_14, group_15; 
   wire [3:0] 	group_16, group_17, group_18, group_19, group_20, group_21, group_22, group_23; 
   wire [3:0] 	group_24, group_25, group_26, group_27, group_28, group_29, group_30, group_31;
   wire [3:0] 	group_32, group_33, group_34, group_35, group_36, group_37, group_38, group_39; 
   wire [3:0] 	group_40, group_41, group_42, group_43, group_44, group_45, group_46, group_47; 
   wire [3:0]	group_48, group_49, group_50, group_51, group_52, group_53, group_54, group_55; 
   wire [3:0]	group_56, group_57, group_58, group_59, group_60, group_61, group_62, group_63;


  //------------------
  // Mondo TID Bits  
  //------------------
   wire	[5:0] 	tid_0,  tid_1,  tid_2,  tid_3,  tid_4,  tid_5,  tid_6,  tid_7; 
   wire [5:0] 	tid_8,  tid_9,  tid_10, tid_11, tid_12, tid_13, tid_14, tid_15; 
   wire [5:0] 	tid_16, tid_17, tid_18, tid_19, tid_20, tid_21, tid_22, tid_23; 
   wire [5:0] 	tid_24, tid_25, tid_26, tid_27, tid_28, tid_29, tid_30, tid_31;
   wire [5:0] 	tid_32, tid_33, tid_34, tid_35, tid_36, tid_37, tid_38, tid_39; 
   wire [5:0] 	tid_40, tid_41, tid_42, tid_43, tid_44, tid_45, tid_46, tid_47; 
   wire [5:0]	tid_48, tid_49, tid_50, tid_51, tid_52, tid_53, tid_54, tid_55; 
   wire [5:0]	tid_56, tid_57, tid_58, tid_59, tid_60, tid_61, tid_62, tid_63;




  //-------------------------
  // Mondo State Bits 
  //-------------------------

   wire	[1:0] 	mondo_state_0,  mondo_state_1,  mondo_state_2,  mondo_state_3,  mondo_state_4,  mondo_state_5,  mondo_state_6,  mondo_state_7; 
   wire [1:0] 	mondo_state_8,  mondo_state_9,  mondo_state_10, mondo_state_11, mondo_state_12, mondo_state_13, mondo_state_14, mondo_state_15; 
   wire [1:0] 	mondo_state_16, mondo_state_17, mondo_state_18, mondo_state_19, mondo_state_20, mondo_state_21, mondo_state_22, mondo_state_23; 
   wire [1:0] 	mondo_state_24, mondo_state_25, mondo_state_26, mondo_state_27, mondo_state_28, mondo_state_29, mondo_state_30, mondo_state_31;
   wire [1:0] 	mondo_state_32, mondo_state_33, mondo_state_34, mondo_state_35, mondo_state_36, mondo_state_37, mondo_state_38, mondo_state_39; 
   wire [1:0] 	mondo_state_40, mondo_state_41, mondo_state_42, mondo_state_43, mondo_state_44, mondo_state_45, mondo_state_46, mondo_state_47; 
   wire [1:0]	mondo_state_48, mondo_state_49, mondo_state_50, mondo_state_51, mondo_state_52, mondo_state_53, mondo_state_54, mondo_state_55; 
   wire [1:0]	mondo_state_56, mondo_state_57, mondo_state_58, mondo_state_59, mondo_state_60, mondo_state_61, mondo_state_62, mondo_state_63;


  //----------------------------------
  // SW Address selects for the state   
  //----------------------------------

   wire	 	sw_state_addr_sel_0,  sw_state_addr_sel_1,  sw_state_addr_sel_2,  sw_state_addr_sel_3,  sw_state_addr_sel_4,  sw_state_addr_sel_5,  sw_state_addr_sel_6,  sw_state_addr_sel_7; 
   wire 	sw_state_addr_sel_8,  sw_state_addr_sel_9,  sw_state_addr_sel_10, sw_state_addr_sel_11, sw_state_addr_sel_12, sw_state_addr_sel_13, sw_state_addr_sel_14, sw_state_addr_sel_15; 
   wire 	sw_state_addr_sel_16, sw_state_addr_sel_17, sw_state_addr_sel_18, sw_state_addr_sel_19, sw_state_addr_sel_20, sw_state_addr_sel_21, sw_state_addr_sel_22, sw_state_addr_sel_23; 
   wire  	sw_state_addr_sel_24, sw_state_addr_sel_25, sw_state_addr_sel_26, sw_state_addr_sel_27, sw_state_addr_sel_28, sw_state_addr_sel_29, sw_state_addr_sel_30, sw_state_addr_sel_31;
   wire 	sw_state_addr_sel_32, sw_state_addr_sel_33, sw_state_addr_sel_34, sw_state_addr_sel_35, sw_state_addr_sel_36, sw_state_addr_sel_37, sw_state_addr_sel_38, sw_state_addr_sel_39; 
   wire 	sw_state_addr_sel_40, sw_state_addr_sel_41, sw_state_addr_sel_42, sw_state_addr_sel_43, sw_state_addr_sel_44, sw_state_addr_sel_45, sw_state_addr_sel_46, sw_state_addr_sel_47; 
   wire 	sw_state_addr_sel_48, sw_state_addr_sel_49, sw_state_addr_sel_50, sw_state_addr_sel_51, sw_state_addr_sel_52, sw_state_addr_sel_53, sw_state_addr_sel_54, sw_state_addr_sel_55; 
   wire  	sw_state_addr_sel_56, sw_state_addr_sel_57, sw_state_addr_sel_58, sw_state_addr_sel_59, sw_state_addr_sel_60, sw_state_addr_sel_61, sw_state_addr_sel_62, sw_state_addr_sel_63;


  //-----------------------------------------------------
  // Wires used to take FSM's from RECEIVED to PENDING  
  //-----------------------------------------------------

   wire	 	int_scheduled_0,  int_scheduled_1,  int_scheduled_2,  int_scheduled_3,  int_scheduled_4,  int_scheduled_5,  int_scheduled_6,  int_scheduled_7; 
   wire 	int_scheduled_8,  int_scheduled_9,  int_scheduled_10, int_scheduled_11, int_scheduled_12, int_scheduled_13, int_scheduled_14, int_scheduled_15; 
   wire 	int_scheduled_16, int_scheduled_17, int_scheduled_18, int_scheduled_19, int_scheduled_20, int_scheduled_21, int_scheduled_22, int_scheduled_23; 
   wire  	int_scheduled_24, int_scheduled_25, int_scheduled_26, int_scheduled_27, int_scheduled_28, int_scheduled_29, int_scheduled_30, int_scheduled_31;
   wire 	int_scheduled_32, int_scheduled_33, int_scheduled_34, int_scheduled_35, int_scheduled_36, int_scheduled_37, int_scheduled_38, int_scheduled_39; 
   wire 	int_scheduled_40, int_scheduled_41, int_scheduled_42, int_scheduled_43, int_scheduled_44, int_scheduled_45, int_scheduled_46, int_scheduled_47; 
   wire 	int_scheduled_48, int_scheduled_49, int_scheduled_50, int_scheduled_51, int_scheduled_52, int_scheduled_53, int_scheduled_54, int_scheduled_55; 
   wire  	int_scheduled_56, int_scheduled_57, int_scheduled_58, int_scheduled_59, int_scheduled_60, int_scheduled_61, int_scheduled_62, int_scheduled_63;



  //--------------------------------------------------------
  // Wires used for ext wr_data for Int_clr_reg
  //--------------------------------------------------------

   wire [1:0] int_state_20_ext_wr_data,int_state_21_ext_wr_data,int_state_22_ext_wr_data,int_state_23_ext_wr_data,int_state_24_ext_wr_data,int_state_25_ext_wr_data,int_state_26_ext_wr_data,int_state_27_ext_wr_data,int_state_28_ext_wr_data,int_state_29_ext_wr_data;
   wire [1:0] int_state_30_ext_wr_data,int_state_31_ext_wr_data,int_state_32_ext_wr_data,int_state_33_ext_wr_data,int_state_34_ext_wr_data,int_state_35_ext_wr_data,int_state_36_ext_wr_data,int_state_37_ext_wr_data,int_state_38_ext_wr_data,int_state_39_ext_wr_data;
   wire [1:0] int_state_40_ext_wr_data,int_state_41_ext_wr_data,int_state_42_ext_wr_data,int_state_43_ext_wr_data,int_state_44_ext_wr_data,int_state_45_ext_wr_data,int_state_46_ext_wr_data,int_state_47_ext_wr_data,int_state_48_ext_wr_data,int_state_49_ext_wr_data;
   wire [1:0] int_state_50_ext_wr_data,int_state_51_ext_wr_data,int_state_52_ext_wr_data,int_state_53_ext_wr_data,int_state_54_ext_wr_data,int_state_55_ext_wr_data,int_state_56_ext_wr_data,int_state_57_ext_wr_data,int_state_58_ext_wr_data,int_state_59_ext_wr_data;
   wire [1:0] int_state_62_ext_wr_data,int_state_63_ext_wr_data;

  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************

  //----------------------------------------------------------
  // Registres used for output muxing of TID value back to GCS  
  //---------------------------------------------------------
  reg 	[6:0] 	tid_mux_0; 
  reg 	[6:0] 	tid_mux_1;
  reg 	[6:0] 	tid_mux_2;
  reg 	[6:0] 	tid_mux_3;
  reg 	[6:0] 	tid_mux_4;
  reg 	[6:0] 	tid_mux_5;
  reg 	[6:0] 	tid_mux_6;
  reg 	[6:0] 	tid_mux_7; 
  reg 	[6:0] 	tid_mux; 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			n_dbg_b;


  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg 						tid_req_reg;   		// Register to hold the value of the req signal 
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_a;
  reg   [`FIRE_DEBUG_WDTH-1:0] 			dbg_b;

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
  //-----------------------------------------------------
  // Make Sure only 1 bit is ever set   
  //-----------------------------------------------------

    //0in bits_on -var gcs2iss_mdo_pending -max 1
    

//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

//-------------------------------------------------------
// Assigning signals from DCM to names for FSM's 
//-------------------------------------------------------
assign   int_state_ext_wr_data = int_state_20_ext_wr_data;
assign   sw_state_wr = ext_wr;  
assign   sw_state_data = int_state_ext_wr_data; 


//----------------------------------------------------------
// Getting the state for all of the Mondos for Software
//----------------------------------------------------------

assign sw_mondo_state_1 = 
        {  mondo_state_31[1], mondo_state_31[0], mondo_state_30[1], mondo_state_30[0], mondo_state_29[1], mondo_state_29[0],
 	   mondo_state_28[1], mondo_state_28[0], mondo_state_27[1], mondo_state_27[0], mondo_state_26[1], mondo_state_26[0],
   	   mondo_state_25[1], mondo_state_25[0], mondo_state_24[1], mondo_state_24[0], mondo_state_23[1], mondo_state_23[0],
	   mondo_state_22[1], mondo_state_22[0], mondo_state_21[1], mondo_state_21[0], mondo_state_20[1], mondo_state_20[0]
	 };
	 
	   
assign sw_mondo_state_2 = 
        {  mondo_state_63[1], mondo_state_63[0], mondo_state_62[1], mondo_state_62[0], 4'b0,
 	   mondo_state_59[1], mondo_state_59[0], mondo_state_58[1], mondo_state_58[0],
   	   mondo_state_57[1], mondo_state_57[0], mondo_state_56[1], mondo_state_56[0], mondo_state_55[1], mondo_state_55[0],
	   mondo_state_54[1], mondo_state_54[0], mondo_state_53[1], mondo_state_53[0], mondo_state_52[1], mondo_state_52[0],
 	   mondo_state_51[1], mondo_state_51[0], mondo_state_50[1], mondo_state_50[0], mondo_state_49[1], mondo_state_49[0],
 	   mondo_state_48[1], mondo_state_48[0], mondo_state_47[1], mondo_state_47[0], mondo_state_46[1], mondo_state_46[0],
 	   mondo_state_45[1], mondo_state_45[0], mondo_state_44[1], mondo_state_44[0], mondo_state_43[1], mondo_state_43[0],
	   mondo_state_42[1], mondo_state_42[0], mondo_state_41[1], mondo_state_41[0], mondo_state_40[1], mondo_state_40[0],
    	   mondo_state_39[1], mondo_state_39[0], mondo_state_38[1], mondo_state_38[0], mondo_state_37[1], mondo_state_37[0],
 	   mondo_state_36[1], mondo_state_36[0], mondo_state_35[1], mondo_state_35[0], mondo_state_34[1], mondo_state_34[0],
 	   mondo_state_33[1], mondo_state_33[0], mondo_state_32[1], mondo_state_32[0]
	 
	 };

//----------------------------------------------------------
// Getting the state for all of the Mondos at the same time 
//----------------------------------------------------------

assign mondo_state_vector_0 = 
        {	
           mondo_state_63[0], mondo_state_62[0], 2'b0, mondo_state_59[0], mondo_state_58[0], mondo_state_57[0], mondo_state_56[0], 
 	   mondo_state_55[0], mondo_state_54[0], mondo_state_53[0], mondo_state_52[0], mondo_state_51[0], mondo_state_50[0], mondo_state_49[0], mondo_state_48[0], 
 	   mondo_state_47[0], mondo_state_46[0], mondo_state_45[0], mondo_state_44[0], mondo_state_43[0], mondo_state_42[0], mondo_state_41[0], mondo_state_40[0], 
 	   mondo_state_39[0], mondo_state_38[0], mondo_state_37[0], mondo_state_36[0], mondo_state_35[0], mondo_state_34[0], mondo_state_33[0], mondo_state_32[0],
 	   mondo_state_31[0], mondo_state_30[0], mondo_state_29[0], mondo_state_28[0], mondo_state_27[0], mondo_state_26[0], mondo_state_25[0], mondo_state_24[0], 
 	   mondo_state_23[0], mondo_state_22[0], mondo_state_21[0], mondo_state_20[0], 20'b0 
        }; 


assign mondo_state_vector_1 = 
        {	
           mondo_state_63[1], mondo_state_62[1], 2'b0, mondo_state_59[1], mondo_state_58[1], mondo_state_57[1], mondo_state_56[1], 
 	   mondo_state_55[1], mondo_state_54[1], mondo_state_53[1], mondo_state_52[1], mondo_state_51[1], mondo_state_50[1], mondo_state_49[1], mondo_state_48[1], 
 	   mondo_state_47[1], mondo_state_46[1], mondo_state_45[1], mondo_state_44[1], mondo_state_43[1], mondo_state_42[1], mondo_state_41[1], mondo_state_40[1], 
 	   mondo_state_39[1], mondo_state_38[1], mondo_state_37[1], mondo_state_36[1], mondo_state_35[1], mondo_state_34[1], mondo_state_33[1], mondo_state_32[1],
 	   mondo_state_31[1], mondo_state_30[1], mondo_state_29[1], mondo_state_28[1], mondo_state_27[1], mondo_state_26[1], mondo_state_25[1], mondo_state_24[1], 
 	   mondo_state_23[1], mondo_state_22[1], mondo_state_21[1], mondo_state_20[1], 20'b0 
       }; 

//----------------------------------------------------------
// Creating the masks for each of the 4 Group controllers 
//----------------------------------------------------------


assign g0_mask = 
        {	
           group_63[0], group_62[0], 2'b0, group_59[0], group_58[0], group_57[0], group_56[0], 
 	   group_55[0], group_54[0], group_53[0], group_52[0], group_51[0], group_50[0], group_49[0], group_48[0], 
 	   group_47[0], group_46[0], group_45[0], group_44[0], group_43[0], group_42[0], group_41[0], group_40[0], 
 	   group_39[0], group_38[0], group_37[0], group_36[0], group_35[0], group_34[0], group_33[0], group_32[0],
 	   group_31[0], group_30[0], group_29[0], group_28[0], group_27[0], group_26[0], group_25[0], group_24[0], 
 	   group_23[0], group_22[0], group_21[0], group_20[0], 20'b0  
        }; 


assign g1_mask = 
        {	
           group_63[1], group_62[1], 2'b0, group_59[1], group_58[1], group_57[1], group_56[1], 
 	   group_55[1], group_54[1], group_53[1], group_52[1], group_51[1], group_50[1], group_49[1], group_48[1], 
 	   group_47[1], group_46[1], group_45[1], group_44[1], group_43[1], group_42[1], group_41[1], group_40[1], 
 	   group_39[1], group_38[1], group_37[1], group_36[1], group_35[1], group_34[1], group_33[1], group_32[1],
 	   group_31[1], group_30[1], group_29[1], group_28[1], group_27[1], group_26[1], group_25[1], group_24[1], 
 	   group_23[1], group_22[1], group_21[1], group_20[1], 20'b0  
        }; 


assign g2_mask = 
        {	
           group_63[2], group_62[2], 2'b0, group_59[2], group_58[2], group_57[2], group_56[2], 
 	   group_55[2], group_54[2], group_53[2], group_52[2], group_51[2], group_50[2], group_49[2], group_48[2], 
 	   group_47[2], group_46[2], group_45[2], group_44[2], group_43[2], group_42[2], group_41[2], group_40[2], 
 	   group_39[2], group_38[2], group_37[2], group_36[2], group_35[2], group_34[2], group_33[2], group_32[2],
 	   group_31[2], group_30[2], group_29[2], group_28[2], group_27[2], group_26[2], group_25[2], group_24[2], 
 	   group_23[2], group_22[2], group_21[2], group_20[2], 20'b0 
        }; 


assign g3_mask = 
        {	
           group_63[3], group_62[3], 2'b0, group_59[3], group_58[3], group_57[3], group_56[3], 
 	   group_55[3], group_54[3], group_53[3], group_52[3], group_51[3], group_50[3], group_49[3], group_48[3], 
 	   group_47[3], group_46[3], group_45[3], group_44[3], group_43[3], group_42[3], group_41[3], group_40[3], 
 	   group_39[3], group_38[3], group_37[3], group_36[3], group_35[3], group_34[3], group_33[3], group_32[3],
 	   group_31[3], group_30[3], group_29[3], group_28[3], group_27[3], group_26[3], group_25[3], group_24[3], 
 	   group_23[3], group_22[3], group_21[3], group_20[3], 20'b0 
        }; 


//----------------------------------------------------------
// Creating the valid vector for all mondo's
//----------------------------------------------------------	
	
assign group_valid = 
        {	
           valid_63, valid_62, 2'b0, valid_59, valid_58, valid_57, valid_56, 
 	   valid_55, valid_54, valid_53, valid_52, valid_51, valid_50, valid_49, valid_48, 
 	   valid_47, valid_46, valid_45, valid_44, valid_43, valid_42, valid_41, valid_40, 
 	   valid_39, valid_38, valid_37, valid_36, valid_35, valid_34, valid_33, valid_32,
 	   valid_31, valid_30, valid_29, valid_28, valid_27, valid_26, valid_25, valid_24, 
 	   valid_23, valid_22, valid_21, valid_20, 20'b0 
        }; 	

//----------------------------------------------------------
// Logic for the Interrupt vectors waiting to be arbitrated for
// by each of the group controllers
//
//   - Each bit can only be asserted in that possition across
//     all four of the vectors
//   - It will only be assrted if
// 		- the mondo  is in the received state
//     	        - mask allows for it
//		- and mondo valid bit is set
//
//
//	- There are race conditions here between a mondo
//	  being selected for arbitration and software 
//	  disableing the valid bit. 
//
//      - It is possible for the group controller arb to 
//        select a winner (1 of 64) and not have that Mondo
// 	  yet be in pending as it still needs to be arbed
//	  for by the GCS arb (1 of 4) So during that window
//        it is possible for SW to disable the valid bit.
//        Howevere this mondo will still go to pending and 
// 	  the interrupt sent. That max time for this race
//        condition is 13 clock cycles. As long as software 
//	  doesn't disable the valid bit and read the mondo 
//	  status in less than 13 clock cycles. The results of
//        the read will be true.
//
//
//----------------------------------------------------------

				
 assign  iss2gcs_gc_0_mdo_needed = ((~mondo_state_vector_1) & mondo_state_vector_0) & g0_mask & group_valid; 
 assign  iss2gcs_gc_1_mdo_needed = ((~mondo_state_vector_1) & mondo_state_vector_0) & g1_mask & group_valid; 
 assign  iss2gcs_gc_2_mdo_needed = ((~mondo_state_vector_1) & mondo_state_vector_0) & g2_mask & group_valid; 
 assign  iss2gcs_gc_3_mdo_needed = ((~mondo_state_vector_1) & mondo_state_vector_0) & g3_mask & group_valid; 
 
 
 
//-----------------------------------------------------------------
// This logic is used to select which one of the 64 TID's should
// be sent back to the GCS sub-block. 
//
//It is basically a 64 to one mux
// 
// It consists of 8, 8 to 1 muxs and then an assignment at the end
//-----------------------------------------------------------------	 

// always @ (gcs2iss_tid_sel[2:0] or tid_0 or tid_1 or tid_2 or 
// 	   tid_3 or tid_4 or tid_5 or tid_6 or tid_7 or
// 	   mondo_mode_0 or mondo_mode_1 or mondo_mode_2 or mondo_mode_3 or
// 	   mondo_mode_4 or mondo_mode_5 or mondo_mode_6 or mondo_mode_7)
// 	   
//     case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
// 	3'b000 :  tid_mux_0 = {mondo_mode_0,tid_0};
//    	3'b001 :  tid_mux_0 = {mondo_mode_1,tid_1}; 
//    	3'b010 :  tid_mux_0 = {mondo_mode_2,tid_2};
//    	3'b011 :  tid_mux_0 = {mondo_mode_3,tid_3}; 
//    	3'b100 :  tid_mux_0 = {mondo_mode_4,tid_4};
//    	3'b101 :  tid_mux_0 = {mondo_mode_5,tid_5}; 
//    	3'b110 :  tid_mux_0 = {mondo_mode_6,tid_6};
//    	3'b111 :  tid_mux_0 = {mondo_mode_7,tid_7}; 
//      endcase  

//always @ (gcs2iss_tid_sel[2:0] or tid_8 or tid_9 or tid_10 or 
//	   tid_11 or tid_12 or tid_13 or tid_14 or tid_15 or 
//	   mondo_mode_8 or mondo_mode_9 or mondo_mode_10 or mondo_mode_11 or
//	   mondo_mode_12 or mondo_mode_13 or mondo_mode_14 or mondo_mode_15)
//
//      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
//   	 3'b000 :  tid_mux_1 = {mondo_mode_8,tid_8};
//   	 3'b001 :  tid_mux_1 = {mondo_mode_9,tid_9}; 
//   	 3'b010 :  tid_mux_1 = {mondo_mode_10,tid_10};
//   	 3'b011 :  tid_mux_1 = {mondo_mode_11,tid_11}; 
//   	 3'b100 :  tid_mux_1 = {mondo_mode_12,tid_12};
//   	 3'b101 :  tid_mux_1 = {mondo_mode_13,tid_13}; 
//   	 3'b110 :  tid_mux_1 = {mondo_mode_14,tid_14};
//   	 3'b111 :  tid_mux_1 = {mondo_mode_15,tid_15}; 
//       endcase  


always @ (gcs2iss_tid_sel[2:0] or  
	   tid_20 or tid_21 or tid_22 or tid_23 or 
	   mondo_mode_20 or mondo_mode_21 or mondo_mode_22 or mondo_mode_23)

      case (gcs2iss_tid_sel[2:0]) // synopsys full_case parallel_case infer_mux
    	3'b000 :  tid_mux_2 = 7'b0;
    	3'b001 :  tid_mux_2 = 7'b0; 
    	3'b010 :  tid_mux_2 = 7'b0;
    	3'b011 :  tid_mux_2 = 7'b0; 
    	3'b100 :  tid_mux_2 = {mondo_mode_20,tid_20};
    	3'b101 :  tid_mux_2 = {mondo_mode_21,tid_21}; 
    	3'b110 :  tid_mux_2 = {mondo_mode_22,tid_22};
    	3'b111 :  tid_mux_2 = {mondo_mode_23,tid_23}; 
      endcase 

always @ (gcs2iss_tid_sel[2:0] or tid_24 or tid_25 or tid_26 or 
	   tid_27 or tid_28 or tid_29 or tid_30 or tid_31 or 
	   mondo_mode_24 or mondo_mode_25 or mondo_mode_26 or mondo_mode_27 or 
	   mondo_mode_28 or mondo_mode_29 or mondo_mode_30 or mondo_mode_31)       
  
      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
    	3'b000 :  tid_mux_3 = {mondo_mode_24,tid_24};
    	3'b001 :  tid_mux_3 = {mondo_mode_25,tid_25}; 
    	3'b010 :  tid_mux_3 = {mondo_mode_26,tid_26};
    	3'b011 :  tid_mux_3 = {mondo_mode_27,tid_27}; 
    	3'b100 :  tid_mux_3 = {mondo_mode_28,tid_28};
    	3'b101 :  tid_mux_3 = {mondo_mode_29,tid_29}; 
    	3'b110 :  tid_mux_3 = {mondo_mode_30,tid_30};
    	3'b111 :  tid_mux_3 = {mondo_mode_31,tid_31}; 
      endcase  
 
always @ (gcs2iss_tid_sel[2:0] or tid_32 or tid_33 or tid_34 or 
	   tid_35 or tid_36 or tid_37 or tid_38 or tid_39 or 
	   mondo_mode_32 or mondo_mode_33 or mondo_mode_34 or mondo_mode_35 or 
	   mondo_mode_36 or mondo_mode_37 or mondo_mode_38 or mondo_mode_39)       
  
      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
    	3'b000 :  tid_mux_4 = {mondo_mode_32,tid_32};
    	3'b001 :  tid_mux_4 = {mondo_mode_33,tid_33}; 
    	3'b010 :  tid_mux_4 = {mondo_mode_34,tid_34};
    	3'b011 :  tid_mux_4 = {mondo_mode_35,tid_35}; 
    	3'b100 :  tid_mux_4 = {mondo_mode_36,tid_36};
    	3'b101 :  tid_mux_4 = {mondo_mode_37,tid_37}; 
    	3'b110 :  tid_mux_4 = {mondo_mode_38,tid_38};
    	3'b111 :  tid_mux_4 = {mondo_mode_39,tid_39}; 
       endcase   
       
always @ (gcs2iss_tid_sel[2:0] or tid_40 or tid_41 or tid_42 or 
	   tid_43 or tid_44 or tid_45 or tid_46 or tid_47 or 
	   mondo_mode_40 or mondo_mode_41 or mondo_mode_42 or mondo_mode_43 or 
	   mondo_mode_44 or mondo_mode_45 or mondo_mode_46 or mondo_mode_47)    
	     
      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
    	3'b000 :  tid_mux_5 = {mondo_mode_40,tid_40};
    	3'b001 :  tid_mux_5 = {mondo_mode_41,tid_41}; 
    	3'b010 :  tid_mux_5 = {mondo_mode_42,tid_42};
    	3'b011 :  tid_mux_5 = {mondo_mode_43,tid_43}; 
    	3'b100 :  tid_mux_5 = {mondo_mode_44,tid_44};
    	3'b101 :  tid_mux_5 = {mondo_mode_45,tid_45}; 
    	3'b110 :  tid_mux_5 = {mondo_mode_46,tid_46};
    	3'b111 :  tid_mux_5 = {mondo_mode_47,tid_47}; 
      endcase   
      
always @ (gcs2iss_tid_sel[2:0] or tid_48 or tid_49 or tid_50 or 
	   tid_51 or tid_52 or tid_53 or tid_54 or tid_55 or 
	   mondo_mode_48 or mondo_mode_49 or mondo_mode_50 or mondo_mode_51 or 
	   mondo_mode_52 or mondo_mode_53 or mondo_mode_54 or mondo_mode_55)      
 
      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
    	3'b000 :  tid_mux_6 = {mondo_mode_48,tid_48};
    	3'b001 :  tid_mux_6 = {mondo_mode_49,tid_49}; 
    	3'b010 :  tid_mux_6 = {mondo_mode_50,tid_50};
    	3'b011 :  tid_mux_6 = {mondo_mode_51,tid_51}; 
    	3'b100 :  tid_mux_6 = {mondo_mode_52,tid_52};
    	3'b101 :  tid_mux_6 = {mondo_mode_53,tid_53}; 
    	3'b110 :  tid_mux_6 = {mondo_mode_54,tid_54};
    	3'b111 :  tid_mux_6 = {mondo_mode_55,tid_55}; 
      endcase    
      
always @ (gcs2iss_tid_sel[2:0] or tid_56 or tid_57 or tid_58 or 
	   tid_59 or tid_62 or tid_63 or 
	   mondo_mode_56 or mondo_mode_57 or mondo_mode_58 or mondo_mode_59 or 
	   mondo_mode_62 or mondo_mode_63)        
	   
      case (gcs2iss_tid_sel[2:0]) // synopsys parallel_case full_case infer_mux
    	3'b000 :  tid_mux_7 = {mondo_mode_56,tid_56};
    	3'b001 :  tid_mux_7 = {mondo_mode_57,tid_57}; 
    	3'b010 :  tid_mux_7 = {mondo_mode_58,tid_58};
    	3'b011 :  tid_mux_7 = {mondo_mode_59,tid_59}; 
    	3'b100 :  tid_mux_7 = 7'b0;
    	3'b101 :  tid_mux_7 = 7'b0; 
    	3'b110 :  tid_mux_7 = {mondo_mode_62,tid_62};
    	3'b111 :  tid_mux_7 = {mondo_mode_63,tid_63}; 
      endcase   

always @ (gcs2iss_tid_sel[5:3] or tid_mux_2 or
          tid_mux_3 or tid_mux_4 or tid_mux_5 or tid_mux_6 or tid_mux_7)   
  
  case (gcs2iss_tid_sel[5:3]) // synopsys parallel_case full_case infer_mux
    3'b000 :  tid_mux = 7'b0;
    3'b001 :  tid_mux = 7'b0; 
    3'b010 :  tid_mux = tid_mux_2;
    3'b011 :  tid_mux = tid_mux_3; 
    3'b100 :  tid_mux = tid_mux_4;
    3'b101 :  tid_mux = tid_mux_5; 
    3'b110 :  tid_mux = tid_mux_6;
    3'b111 :  tid_mux = tid_mux_7; 
  endcase   
   
 
 assign  iss2gcs_tid = tid_mux[5:0];  
 assign  iss2gcs_mondo_mode = tid_mux[6];

//-----------------------------------------------------------------
// Logic to take state machines to from RECEIVED TO PEDNING
//
// When the tid_req comes in it looks at which one of the bit sis set
//-----------------------------------------------------------------

// assign int_scheduled_0 = gcs2iss_tid_req & gcs2iss_mdo_pending[0]; 
// assign int_scheduled_1 = gcs2iss_tid_req & gcs2iss_mdo_pending[1]; 
// assign int_scheduled_2 = gcs2iss_tid_req & gcs2iss_mdo_pending[2]; 
// assign int_scheduled_3 = gcs2iss_tid_req & gcs2iss_mdo_pending[3]; 
// assign int_scheduled_4 = gcs2iss_tid_req & gcs2iss_mdo_pending[4]; 
// assign int_scheduled_5 = gcs2iss_tid_req & gcs2iss_mdo_pending[5]; 
// assign int_scheduled_6 = gcs2iss_tid_req & gcs2iss_mdo_pending[6]; 
// assign int_scheduled_7 = gcs2iss_tid_req & gcs2iss_mdo_pending[7]; 
// assign int_scheduled_8 = gcs2iss_tid_req & gcs2iss_mdo_pending[8]; 
// assign int_scheduled_9 = gcs2iss_tid_req & gcs2iss_mdo_pending[9]; 

// assign int_scheduled_10 = gcs2iss_tid_req & gcs2iss_mdo_pending[10]; 
// assign int_scheduled_11 = gcs2iss_tid_req & gcs2iss_mdo_pending[11]; 
// assign int_scheduled_12 = gcs2iss_tid_req & gcs2iss_mdo_pending[12]; 
// assign int_scheduled_13 = gcs2iss_tid_req & gcs2iss_mdo_pending[13]; 
// assign int_scheduled_14 = gcs2iss_tid_req & gcs2iss_mdo_pending[14]; 
// assign int_scheduled_15 = gcs2iss_tid_req & gcs2iss_mdo_pending[15]; 
// assign int_scheduled_16 = gcs2iss_tid_req & gcs2iss_mdo_pending[16]; 
// assign int_scheduled_17 = gcs2iss_tid_req & gcs2iss_mdo_pending[17]; 
// assign int_scheduled_18 = gcs2iss_tid_req & gcs2iss_mdo_pending[18]; 
// assign int_scheduled_19 = gcs2iss_tid_req & gcs2iss_mdo_pending[19]; 

assign int_scheduled_20 = gcs2iss_tid_req & gcs2iss_mdo_pending[20]; 
assign int_scheduled_21 = gcs2iss_tid_req & gcs2iss_mdo_pending[21]; 
assign int_scheduled_22 = gcs2iss_tid_req & gcs2iss_mdo_pending[22]; 
assign int_scheduled_23 = gcs2iss_tid_req & gcs2iss_mdo_pending[23]; 
assign int_scheduled_24 = gcs2iss_tid_req & gcs2iss_mdo_pending[24]; 
assign int_scheduled_25 = gcs2iss_tid_req & gcs2iss_mdo_pending[25]; 
assign int_scheduled_26 = gcs2iss_tid_req & gcs2iss_mdo_pending[26]; 
assign int_scheduled_27 = gcs2iss_tid_req & gcs2iss_mdo_pending[27]; 
assign int_scheduled_28 = gcs2iss_tid_req & gcs2iss_mdo_pending[28]; 
assign int_scheduled_29 = gcs2iss_tid_req & gcs2iss_mdo_pending[29]; 

assign int_scheduled_30 = gcs2iss_tid_req & gcs2iss_mdo_pending[30]; 
assign int_scheduled_31 = gcs2iss_tid_req & gcs2iss_mdo_pending[31]; 
assign int_scheduled_32 = gcs2iss_tid_req & gcs2iss_mdo_pending[32]; 
assign int_scheduled_33 = gcs2iss_tid_req & gcs2iss_mdo_pending[33]; 
assign int_scheduled_34 = gcs2iss_tid_req & gcs2iss_mdo_pending[34]; 
assign int_scheduled_35 = gcs2iss_tid_req & gcs2iss_mdo_pending[35]; 
assign int_scheduled_36 = gcs2iss_tid_req & gcs2iss_mdo_pending[36]; 
assign int_scheduled_37 = gcs2iss_tid_req & gcs2iss_mdo_pending[37]; 
assign int_scheduled_38 = gcs2iss_tid_req & gcs2iss_mdo_pending[38]; 
assign int_scheduled_39 = gcs2iss_tid_req & gcs2iss_mdo_pending[39]; 

assign int_scheduled_40 = gcs2iss_tid_req & gcs2iss_mdo_pending[40]; 
assign int_scheduled_41 = gcs2iss_tid_req & gcs2iss_mdo_pending[41]; 
assign int_scheduled_42 = gcs2iss_tid_req & gcs2iss_mdo_pending[42]; 
assign int_scheduled_43 = gcs2iss_tid_req & gcs2iss_mdo_pending[43]; 
assign int_scheduled_44 = gcs2iss_tid_req & gcs2iss_mdo_pending[44]; 
assign int_scheduled_45 = gcs2iss_tid_req & gcs2iss_mdo_pending[45]; 
assign int_scheduled_46 = gcs2iss_tid_req & gcs2iss_mdo_pending[46]; 
assign int_scheduled_47 = gcs2iss_tid_req & gcs2iss_mdo_pending[47]; 
assign int_scheduled_48 = gcs2iss_tid_req & gcs2iss_mdo_pending[48]; 
assign int_scheduled_49 = gcs2iss_tid_req & gcs2iss_mdo_pending[49]; 

assign int_scheduled_50 = gcs2iss_tid_req & gcs2iss_mdo_pending[50]; 
assign int_scheduled_51 = gcs2iss_tid_req & gcs2iss_mdo_pending[51]; 
assign int_scheduled_52 = gcs2iss_tid_req & gcs2iss_mdo_pending[52]; 
assign int_scheduled_53 = gcs2iss_tid_req & gcs2iss_mdo_pending[53]; 
assign int_scheduled_54 = gcs2iss_tid_req & gcs2iss_mdo_pending[54]; 
assign int_scheduled_55 = gcs2iss_tid_req & gcs2iss_mdo_pending[55]; 
assign int_scheduled_56 = gcs2iss_tid_req & gcs2iss_mdo_pending[56]; 
assign int_scheduled_57 = gcs2iss_tid_req & gcs2iss_mdo_pending[57]; 
assign int_scheduled_58 = gcs2iss_tid_req & gcs2iss_mdo_pending[58]; 
assign int_scheduled_59 = gcs2iss_tid_req & gcs2iss_mdo_pending[59]; 

// assign int_scheduled_60 = gcs2iss_tid_req & gcs2iss_mdo_pending[60]; 
// assign int_scheduled_61 = gcs2iss_tid_req & gcs2iss_mdo_pending[61]; 
assign int_scheduled_62 = gcs2iss_tid_req & gcs2iss_mdo_pending[62]; 
assign int_scheduled_63 = gcs2iss_tid_req & gcs2iss_mdo_pending[63]; 



//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################    


//------------------------------------------------
// Logic to Register the TID request to know when 
// to send back the ACK 
//------------------------------------------------

always @ (posedge clk)
    begin
      if (~rst_l)
        begin
	  tid_req_reg <=  1'b0;
	end
      else
        begin
	 tid_req_reg  <=  gcs2iss_tid_req;
	end 
    end
  
//----------------------------------------------------
// Produce the ACK signal back to the GCS 
//----------------------------------------------------

assign iss2gcs_tid_ack = gcs2iss_tid_req & tid_req_reg; 


//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2iss_dbg_sel_a or  iss2gcs_mondo_mode or  iss2gcs_tid[4:0] or  gcs2iss_tid_req or  iss2gcs_tid_ack or  
	  gcs2iss_tid_sel or  ics2iss_mondo_62_int_l or  ics2iss_mondo_63_int_l or  
	  rds2iss_intx_int_l or  sw_state_wr or int_state_ext_wr_data) 
  begin
    case (dbg2iss_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {iss2gcs_mondo_mode, iss2gcs_tid[4:0], gcs2iss_tid_req, iss2gcs_tid_ack};
      3'b001: n_dbg_a = {gcs2iss_tid_sel[5:0], 2'h0};
      3'b010: n_dbg_a = {2'h0, ics2iss_mondo_62_int_l, ics2iss_mondo_63_int_l, rds2iss_intx_int_l[3:0]};
      3'b011: n_dbg_a = 8'h00;
      3'b100: n_dbg_a = 8'h00;
      3'b101: n_dbg_a = {1'h0, sw_state_wr, int_state_ext_wr_data[1:0],  4'b0};
      3'b110: n_dbg_a = 8'h00;
      3'b111: n_dbg_a = 8'h00;
    endcase
  end

always @ (dbg2iss_dbg_sel_b or iss2gcs_mondo_mode or  iss2gcs_tid[4:0] or  gcs2iss_tid_req or  iss2gcs_tid_ack or  
	  gcs2iss_tid_sel or  ics2iss_mondo_62_int_l or  ics2iss_mondo_63_int_l or  
	  rds2iss_intx_int_l or  sw_state_wr or int_state_ext_wr_data) 
  begin
    case (dbg2iss_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {iss2gcs_mondo_mode, iss2gcs_tid[4:0], gcs2iss_tid_req, iss2gcs_tid_ack};
      3'b001: n_dbg_b = {gcs2iss_tid_sel[5:0], 2'h0};
      3'b010: n_dbg_b = {2'h0, ics2iss_mondo_62_int_l, ics2iss_mondo_63_int_l, rds2iss_intx_int_l[3:0]};
      3'b011: n_dbg_b = 8'h00;
      3'b100: n_dbg_b = 8'h00;
      3'b101: n_dbg_b = {1'h0, sw_state_wr, int_state_ext_wr_data[1:0], 4'b0 };
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
   

assign iss2dbg_dbg_a = dbg_a; 
assign iss2dbg_dbg_b = dbg_b; 


//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    

//---------------------------------
//  DCM Instanciation 
//----------------------------------

 dmu_imu_iss_csr csr (
        .clk                                    (clk),
        .csrbus_addr                            (csrbus_addr),
        .csrbus_wr_data                         (csrbus_wr_data),
        .csrbus_wr                              (csrbus_wr),
        .csrbus_valid                           (csrbus_valid),
        .csrbus_mapped                          (csrbus_mapped),
        .csrbus_done                            (csrbus_done),
        .csrbus_read_data                       (csrbus_read_data),
        .rst_l                                  (rst_l),
        .csrbus_src_bus                         (csrbus_src_bus),
        .csrbus_acc_vio                         (csrbus_acc_vio),
        .instance_id                            (j2d_instance_id),
        .ext_wr                                 (ext_wr),
        .interrupt_mapping_20_mdo_mode_hw_read  (mondo_mode_20),
	.interrupt_mapping_20_v_hw_read  (valid_20),
	.interrupt_mapping_20_t_id_hw_read  (tid_20),
	.interrupt_mapping_20_int_cntrl_num_hw_read  (group_20),
	.interrupt_mapping_21_mdo_mode_hw_read  (mondo_mode_21),
	.interrupt_mapping_21_v_hw_read  (valid_21),
	.interrupt_mapping_21_t_id_hw_read  (tid_21),
	.interrupt_mapping_21_int_cntrl_num_hw_read  (group_21),
	.interrupt_mapping_22_mdo_mode_hw_read  (mondo_mode_22),
	.interrupt_mapping_22_v_hw_read  (valid_22),
	.interrupt_mapping_22_t_id_hw_read  (tid_22),
	.interrupt_mapping_22_int_cntrl_num_hw_read  (group_22),
	.interrupt_mapping_23_mdo_mode_hw_read  (mondo_mode_23),
	.interrupt_mapping_23_v_hw_read  (valid_23),
	.interrupt_mapping_23_t_id_hw_read  (tid_23),
	.interrupt_mapping_23_int_cntrl_num_hw_read  (group_23),
	.interrupt_mapping_24_mdo_mode_hw_read  (mondo_mode_24),
	.interrupt_mapping_24_v_hw_read  (valid_24),
	.interrupt_mapping_24_t_id_hw_read  (tid_24),
	.interrupt_mapping_24_int_cntrl_num_hw_read  (group_24),
	.interrupt_mapping_25_mdo_mode_hw_read  (mondo_mode_25),
	.interrupt_mapping_25_v_hw_read  (valid_25),
	.interrupt_mapping_25_t_id_hw_read  (tid_25),
	.interrupt_mapping_25_int_cntrl_num_hw_read  (group_25),
	.interrupt_mapping_26_mdo_mode_hw_read  (mondo_mode_26),
	.interrupt_mapping_26_v_hw_read  (valid_26),
	.interrupt_mapping_26_t_id_hw_read  (tid_26),
	.interrupt_mapping_26_int_cntrl_num_hw_read  (group_26),
	.interrupt_mapping_27_mdo_mode_hw_read  (mondo_mode_27),
	.interrupt_mapping_27_v_hw_read  (valid_27),
	.interrupt_mapping_27_t_id_hw_read  (tid_27),
	.interrupt_mapping_27_int_cntrl_num_hw_read  (group_27),
	.interrupt_mapping_28_mdo_mode_hw_read  (mondo_mode_28),
	.interrupt_mapping_28_v_hw_read  (valid_28),
	.interrupt_mapping_28_t_id_hw_read  (tid_28),
	.interrupt_mapping_28_int_cntrl_num_hw_read  (group_28),
	.interrupt_mapping_29_mdo_mode_hw_read  (mondo_mode_29),
	.interrupt_mapping_29_v_hw_read  (valid_29),
	.interrupt_mapping_29_t_id_hw_read  (tid_29),
	.interrupt_mapping_29_int_cntrl_num_hw_read  (group_29),
	.interrupt_mapping_30_mdo_mode_hw_read  (mondo_mode_30),
	.interrupt_mapping_30_v_hw_read  (valid_30),
	.interrupt_mapping_30_t_id_hw_read  (tid_30),
	.interrupt_mapping_30_int_cntrl_num_hw_read  (group_30),
	.interrupt_mapping_31_mdo_mode_hw_read  (mondo_mode_31),
	.interrupt_mapping_31_v_hw_read  (valid_31),
	.interrupt_mapping_31_t_id_hw_read  (tid_31),
	.interrupt_mapping_31_int_cntrl_num_hw_read  (group_31),
	.interrupt_mapping_32_mdo_mode_hw_read  (mondo_mode_32),
	.interrupt_mapping_32_v_hw_read  (valid_32),
	.interrupt_mapping_32_t_id_hw_read  (tid_32),
	.interrupt_mapping_32_int_cntrl_num_hw_read  (group_32),
	.interrupt_mapping_33_mdo_mode_hw_read  (mondo_mode_33),
	.interrupt_mapping_33_v_hw_read  (valid_33),
	.interrupt_mapping_33_t_id_hw_read  (tid_33),
	.interrupt_mapping_33_int_cntrl_num_hw_read  (group_33),
	.interrupt_mapping_34_mdo_mode_hw_read  (mondo_mode_34),
	.interrupt_mapping_34_v_hw_read  (valid_34),
	.interrupt_mapping_34_t_id_hw_read  (tid_34),
	.interrupt_mapping_34_int_cntrl_num_hw_read  (group_34),
	.interrupt_mapping_35_mdo_mode_hw_read  (mondo_mode_35),
	.interrupt_mapping_35_v_hw_read  (valid_35),
	.interrupt_mapping_35_t_id_hw_read  (tid_35),
	.interrupt_mapping_35_int_cntrl_num_hw_read  (group_35),
	.interrupt_mapping_36_mdo_mode_hw_read  (mondo_mode_36),
	.interrupt_mapping_36_v_hw_read  (valid_36),
	.interrupt_mapping_36_t_id_hw_read  (tid_36),
	.interrupt_mapping_36_int_cntrl_num_hw_read  (group_36),
	.interrupt_mapping_37_mdo_mode_hw_read  (mondo_mode_37),
	.interrupt_mapping_37_v_hw_read  (valid_37),
	.interrupt_mapping_37_t_id_hw_read  (tid_37),
	.interrupt_mapping_37_int_cntrl_num_hw_read  (group_37),
	.interrupt_mapping_38_mdo_mode_hw_read  (mondo_mode_38),
	.interrupt_mapping_38_v_hw_read  (valid_38),
	.interrupt_mapping_38_t_id_hw_read  (tid_38),
	.interrupt_mapping_38_int_cntrl_num_hw_read  (group_38),
	.interrupt_mapping_39_mdo_mode_hw_read  (mondo_mode_39),
	.interrupt_mapping_39_v_hw_read  (valid_39),
	.interrupt_mapping_39_t_id_hw_read  (tid_39),
	.interrupt_mapping_39_int_cntrl_num_hw_read  (group_39),
	.interrupt_mapping_40_mdo_mode_hw_read  (mondo_mode_40),
	.interrupt_mapping_40_v_hw_read  (valid_40),
	.interrupt_mapping_40_t_id_hw_read  (tid_40),
	.interrupt_mapping_40_int_cntrl_num_hw_read  (group_40),
	.interrupt_mapping_41_mdo_mode_hw_read  (mondo_mode_41),
	.interrupt_mapping_41_v_hw_read  (valid_41),
	.interrupt_mapping_41_t_id_hw_read  (tid_41),
	.interrupt_mapping_41_int_cntrl_num_hw_read  (group_41),
	.interrupt_mapping_42_mdo_mode_hw_read  (mondo_mode_42),
	.interrupt_mapping_42_v_hw_read  (valid_42),
	.interrupt_mapping_42_t_id_hw_read  (tid_42),
	.interrupt_mapping_42_int_cntrl_num_hw_read  (group_42),
	.interrupt_mapping_43_mdo_mode_hw_read  (mondo_mode_43),
	.interrupt_mapping_43_v_hw_read  (valid_43),
	.interrupt_mapping_43_t_id_hw_read  (tid_43),
	.interrupt_mapping_43_int_cntrl_num_hw_read  (group_43),
	.interrupt_mapping_44_mdo_mode_hw_read  (mondo_mode_44),
	.interrupt_mapping_44_v_hw_read  (valid_44),
	.interrupt_mapping_44_t_id_hw_read  (tid_44),
	.interrupt_mapping_44_int_cntrl_num_hw_read  (group_44),
	.interrupt_mapping_45_mdo_mode_hw_read  (mondo_mode_45),
	.interrupt_mapping_45_v_hw_read  (valid_45),
	.interrupt_mapping_45_t_id_hw_read  (tid_45),
	.interrupt_mapping_45_int_cntrl_num_hw_read  (group_45),
	.interrupt_mapping_46_mdo_mode_hw_read  (mondo_mode_46),
	.interrupt_mapping_46_v_hw_read  (valid_46),
	.interrupt_mapping_46_t_id_hw_read  (tid_46),
	.interrupt_mapping_46_int_cntrl_num_hw_read  (group_46),
	.interrupt_mapping_47_mdo_mode_hw_read  (mondo_mode_47),
	.interrupt_mapping_47_v_hw_read  (valid_47),
	.interrupt_mapping_47_t_id_hw_read  (tid_47),
	.interrupt_mapping_47_int_cntrl_num_hw_read  (group_47),
	.interrupt_mapping_48_mdo_mode_hw_read  (mondo_mode_48),
	.interrupt_mapping_48_v_hw_read  (valid_48),
	.interrupt_mapping_48_t_id_hw_read  (tid_48),
	.interrupt_mapping_48_int_cntrl_num_hw_read  (group_48),
	.interrupt_mapping_49_mdo_mode_hw_read  (mondo_mode_49),
	.interrupt_mapping_49_v_hw_read  (valid_49),
	.interrupt_mapping_49_t_id_hw_read  (tid_49),
	.interrupt_mapping_49_int_cntrl_num_hw_read  (group_49),
	.interrupt_mapping_50_mdo_mode_hw_read  (mondo_mode_50),
	.interrupt_mapping_50_v_hw_read  (valid_50),
	.interrupt_mapping_50_t_id_hw_read  (tid_50),
	.interrupt_mapping_50_int_cntrl_num_hw_read  (group_50),
	.interrupt_mapping_51_mdo_mode_hw_read  (mondo_mode_51),
	.interrupt_mapping_51_v_hw_read  (valid_51),
	.interrupt_mapping_51_t_id_hw_read  (tid_51),
	.interrupt_mapping_51_int_cntrl_num_hw_read  (group_51),
	.interrupt_mapping_52_mdo_mode_hw_read  (mondo_mode_52),
	.interrupt_mapping_52_v_hw_read  (valid_52),
	.interrupt_mapping_52_t_id_hw_read  (tid_52),
	.interrupt_mapping_52_int_cntrl_num_hw_read  (group_52),
	.interrupt_mapping_53_mdo_mode_hw_read  (mondo_mode_53),
	.interrupt_mapping_53_v_hw_read  (valid_53),
	.interrupt_mapping_53_t_id_hw_read  (tid_53),
	.interrupt_mapping_53_int_cntrl_num_hw_read  (group_53),
	.interrupt_mapping_54_mdo_mode_hw_read  (mondo_mode_54),
	.interrupt_mapping_54_v_hw_read  (valid_54),
	.interrupt_mapping_54_t_id_hw_read  (tid_54),
	.interrupt_mapping_54_int_cntrl_num_hw_read  (group_54),
	.interrupt_mapping_55_mdo_mode_hw_read  (mondo_mode_55),
	.interrupt_mapping_55_v_hw_read  (valid_55),
	.interrupt_mapping_55_t_id_hw_read  (tid_55),
	.interrupt_mapping_55_int_cntrl_num_hw_read  (group_55),
	.interrupt_mapping_56_mdo_mode_hw_read  (mondo_mode_56),
	.interrupt_mapping_56_v_hw_read  (valid_56),
	.interrupt_mapping_56_t_id_hw_read  (tid_56),
	.interrupt_mapping_56_int_cntrl_num_hw_read  (group_56),
	.interrupt_mapping_57_mdo_mode_hw_read  (mondo_mode_57),
	.interrupt_mapping_57_v_hw_read  (valid_57),
	.interrupt_mapping_57_t_id_hw_read  (tid_57),
	.interrupt_mapping_57_int_cntrl_num_hw_read  (group_57),
	.interrupt_mapping_58_mdo_mode_hw_read  (mondo_mode_58),
	.interrupt_mapping_58_v_hw_read  (valid_58),
	.interrupt_mapping_58_t_id_hw_read  (tid_58),
	.interrupt_mapping_58_int_cntrl_num_hw_read  (group_58),
	.interrupt_mapping_59_mdo_mode_hw_read  (mondo_mode_59),
	.interrupt_mapping_59_v_hw_read  (valid_59),
	.interrupt_mapping_59_t_id_hw_read  (tid_59),
	.interrupt_mapping_59_int_cntrl_num_hw_read  (group_59),
	.interrupt_mapping_62_mdo_mode_hw_read  (mondo_mode_62),
	.interrupt_mapping_62_v_hw_read  (valid_62),
	.interrupt_mapping_62_t_id_hw_read  (tid_62),
	.interrupt_mapping_62_int_cntrl_num_hw_read  (group_62),
	.interrupt_mapping_63_mdo_mode_hw_read  (mondo_mode_63),
	.interrupt_mapping_63_v_hw_read  (valid_63),
	.interrupt_mapping_63_t_id_hw_read  (tid_63),
	.interrupt_mapping_63_int_cntrl_num_hw_read  (group_63),
	.clr_int_reg_20_int_state_ext_wr_data  (int_state_20_ext_wr_data),
	.clr_int_reg_20_ext_select  (sw_state_addr_sel_20),
	.clr_int_reg_20_int_state_ext_read_data  (mondo_state_20),
	.clr_int_reg_21_int_state_ext_wr_data  (int_state_21_ext_wr_data),
	.clr_int_reg_21_ext_select  (sw_state_addr_sel_21),
	.clr_int_reg_21_int_state_ext_read_data  (mondo_state_21),
	.clr_int_reg_22_int_state_ext_wr_data  (int_state_22_ext_wr_data),
	.clr_int_reg_22_ext_select  (sw_state_addr_sel_22),
	.clr_int_reg_22_int_state_ext_read_data  (mondo_state_22),
	.clr_int_reg_23_int_state_ext_wr_data  (int_state_23_ext_wr_data),
	.clr_int_reg_23_ext_select  (sw_state_addr_sel_23),
	.clr_int_reg_23_int_state_ext_read_data  (mondo_state_23),
	.clr_int_reg_24_int_state_ext_wr_data  (int_state_24_ext_wr_data),
	.clr_int_reg_24_ext_select  (sw_state_addr_sel_24),
	.clr_int_reg_24_int_state_ext_read_data  (mondo_state_24),
	.clr_int_reg_25_int_state_ext_wr_data  (int_state_25_ext_wr_data),
	.clr_int_reg_25_ext_select  (sw_state_addr_sel_25),
	.clr_int_reg_25_int_state_ext_read_data  (mondo_state_25),
	.clr_int_reg_26_int_state_ext_wr_data  (int_state_26_ext_wr_data),
	.clr_int_reg_26_ext_select  (sw_state_addr_sel_26),
	.clr_int_reg_26_int_state_ext_read_data  (mondo_state_26),
	.clr_int_reg_27_int_state_ext_wr_data  (int_state_27_ext_wr_data),
	.clr_int_reg_27_ext_select  (sw_state_addr_sel_27),
	.clr_int_reg_27_int_state_ext_read_data  (mondo_state_27),
	.clr_int_reg_28_int_state_ext_wr_data  (int_state_28_ext_wr_data),
	.clr_int_reg_28_ext_select  (sw_state_addr_sel_28),
	.clr_int_reg_28_int_state_ext_read_data  (mondo_state_28),
	.clr_int_reg_29_int_state_ext_wr_data  (int_state_29_ext_wr_data),
	.clr_int_reg_29_ext_select  (sw_state_addr_sel_29),
	.clr_int_reg_29_int_state_ext_read_data  (mondo_state_29),
	.clr_int_reg_30_int_state_ext_wr_data  (int_state_30_ext_wr_data),
	.clr_int_reg_30_ext_select  (sw_state_addr_sel_30),
	.clr_int_reg_30_int_state_ext_read_data  (mondo_state_30),
	.clr_int_reg_31_int_state_ext_wr_data  (int_state_31_ext_wr_data),
	.clr_int_reg_31_ext_select  (sw_state_addr_sel_31),
	.clr_int_reg_31_int_state_ext_read_data  (mondo_state_31),
	.clr_int_reg_32_int_state_ext_wr_data  (int_state_32_ext_wr_data),
	.clr_int_reg_32_ext_select  (sw_state_addr_sel_32),
	.clr_int_reg_32_int_state_ext_read_data  (mondo_state_32),
	.clr_int_reg_33_int_state_ext_wr_data  (int_state_33_ext_wr_data),
	.clr_int_reg_33_ext_select  (sw_state_addr_sel_33),
	.clr_int_reg_33_int_state_ext_read_data  (mondo_state_33),
	.clr_int_reg_34_int_state_ext_wr_data  (int_state_34_ext_wr_data),
	.clr_int_reg_34_ext_select  (sw_state_addr_sel_34),
	.clr_int_reg_34_int_state_ext_read_data  (mondo_state_34),
	.clr_int_reg_35_int_state_ext_wr_data  (int_state_35_ext_wr_data),
	.clr_int_reg_35_ext_select  (sw_state_addr_sel_35),
	.clr_int_reg_35_int_state_ext_read_data  (mondo_state_35),
	.clr_int_reg_36_int_state_ext_wr_data  (int_state_36_ext_wr_data),
	.clr_int_reg_36_ext_select  (sw_state_addr_sel_36),
	.clr_int_reg_36_int_state_ext_read_data  (mondo_state_36),
	.clr_int_reg_37_int_state_ext_wr_data  (int_state_37_ext_wr_data),
	.clr_int_reg_37_ext_select  (sw_state_addr_sel_37),
	.clr_int_reg_37_int_state_ext_read_data  (mondo_state_37),
	.clr_int_reg_38_int_state_ext_wr_data  (int_state_38_ext_wr_data),
	.clr_int_reg_38_ext_select  (sw_state_addr_sel_38),
	.clr_int_reg_38_int_state_ext_read_data  (mondo_state_38),
	.clr_int_reg_39_int_state_ext_wr_data  (int_state_39_ext_wr_data),
	.clr_int_reg_39_ext_select  (sw_state_addr_sel_39),
	.clr_int_reg_39_int_state_ext_read_data  (mondo_state_39),
	.clr_int_reg_40_int_state_ext_wr_data  (int_state_40_ext_wr_data),
	.clr_int_reg_40_ext_select  (sw_state_addr_sel_40),
	.clr_int_reg_40_int_state_ext_read_data  (mondo_state_40),
	.clr_int_reg_41_int_state_ext_wr_data  (int_state_41_ext_wr_data),
	.clr_int_reg_41_ext_select  (sw_state_addr_sel_41),
	.clr_int_reg_41_int_state_ext_read_data  (mondo_state_41),
	.clr_int_reg_42_int_state_ext_wr_data  (int_state_42_ext_wr_data),
	.clr_int_reg_42_ext_select  (sw_state_addr_sel_42),
	.clr_int_reg_42_int_state_ext_read_data  (mondo_state_42),
	.clr_int_reg_43_int_state_ext_wr_data  (int_state_43_ext_wr_data),
	.clr_int_reg_43_ext_select  (sw_state_addr_sel_43),
	.clr_int_reg_43_int_state_ext_read_data  (mondo_state_43),
	.clr_int_reg_44_int_state_ext_wr_data  (int_state_44_ext_wr_data),
	.clr_int_reg_44_ext_select  (sw_state_addr_sel_44),
	.clr_int_reg_44_int_state_ext_read_data  (mondo_state_44),
	.clr_int_reg_45_int_state_ext_wr_data  (int_state_45_ext_wr_data),
	.clr_int_reg_45_ext_select  (sw_state_addr_sel_45),
	.clr_int_reg_45_int_state_ext_read_data  (mondo_state_45),
	.clr_int_reg_46_int_state_ext_wr_data  (int_state_46_ext_wr_data),
	.clr_int_reg_46_ext_select  (sw_state_addr_sel_46),
	.clr_int_reg_46_int_state_ext_read_data  (mondo_state_46),
	.clr_int_reg_47_int_state_ext_wr_data  (int_state_47_ext_wr_data),
	.clr_int_reg_47_ext_select  (sw_state_addr_sel_47),
	.clr_int_reg_47_int_state_ext_read_data  (mondo_state_47),
	.clr_int_reg_48_int_state_ext_wr_data  (int_state_48_ext_wr_data),
	.clr_int_reg_48_ext_select  (sw_state_addr_sel_48),
	.clr_int_reg_48_int_state_ext_read_data  (mondo_state_48),
	.clr_int_reg_49_int_state_ext_wr_data  (int_state_49_ext_wr_data),
	.clr_int_reg_49_ext_select  (sw_state_addr_sel_49),
	.clr_int_reg_49_int_state_ext_read_data  (mondo_state_49),
	.clr_int_reg_50_int_state_ext_wr_data  (int_state_50_ext_wr_data),
	.clr_int_reg_50_ext_select  (sw_state_addr_sel_50),
	.clr_int_reg_50_int_state_ext_read_data  (mondo_state_50),
	.clr_int_reg_51_int_state_ext_wr_data  (int_state_51_ext_wr_data),
	.clr_int_reg_51_ext_select  (sw_state_addr_sel_51),
	.clr_int_reg_51_int_state_ext_read_data  (mondo_state_51),
	.clr_int_reg_52_int_state_ext_wr_data  (int_state_52_ext_wr_data),
	.clr_int_reg_52_ext_select  (sw_state_addr_sel_52),
	.clr_int_reg_52_int_state_ext_read_data  (mondo_state_52),
	.clr_int_reg_53_int_state_ext_wr_data  (int_state_53_ext_wr_data),
	.clr_int_reg_53_ext_select  (sw_state_addr_sel_53),
	.clr_int_reg_53_int_state_ext_read_data  (mondo_state_53),
	.clr_int_reg_54_int_state_ext_wr_data  (int_state_54_ext_wr_data),
	.clr_int_reg_54_ext_select  (sw_state_addr_sel_54),
	.clr_int_reg_54_int_state_ext_read_data  (mondo_state_54),
	.clr_int_reg_55_int_state_ext_wr_data  (int_state_55_ext_wr_data),
	.clr_int_reg_55_ext_select  (sw_state_addr_sel_55),
	.clr_int_reg_55_int_state_ext_read_data  (mondo_state_55),
	.clr_int_reg_56_int_state_ext_wr_data  (int_state_56_ext_wr_data),
	.clr_int_reg_56_ext_select  (sw_state_addr_sel_56),
	.clr_int_reg_56_int_state_ext_read_data  (mondo_state_56),
	.clr_int_reg_57_int_state_ext_wr_data  (int_state_57_ext_wr_data),
	.clr_int_reg_57_ext_select  (sw_state_addr_sel_57),
	.clr_int_reg_57_int_state_ext_read_data  (mondo_state_57),
	.clr_int_reg_58_int_state_ext_wr_data  (int_state_58_ext_wr_data),
	.clr_int_reg_58_ext_select  (sw_state_addr_sel_58),
	.clr_int_reg_58_int_state_ext_read_data  (mondo_state_58),
	.clr_int_reg_59_int_state_ext_wr_data  (int_state_59_ext_wr_data),
	.clr_int_reg_59_ext_select  (sw_state_addr_sel_59),
	.clr_int_reg_59_int_state_ext_read_data  (mondo_state_59),
	.clr_int_reg_62_int_state_ext_wr_data  (int_state_62_ext_wr_data),
	.clr_int_reg_62_ext_select  (sw_state_addr_sel_62),
	.clr_int_reg_62_int_state_ext_read_data  (mondo_state_62),
	.clr_int_reg_63_int_state_ext_wr_data  (int_state_63_ext_wr_data),
	.clr_int_reg_63_ext_select  (sw_state_addr_sel_63),
	.clr_int_reg_63_int_state_ext_read_data  (mondo_state_63),
	.interrupt_retry_timer_limit_hw_read  (iss2gcs_counter_limit),
	.interrupt_state_status_1_state_ext_read_data  (sw_mondo_state_1),
	.interrupt_state_status_2_state_ext_read_data  (sw_mondo_state_2)

        );


//---------------------------------------------
// External Interupt FSM's  Mondo's 0-19
//---------------------------------------------

//dmu_imu_iss_fsm fsm_0(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[0]), 
//		.int_scheduled	(int_scheduled_0),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_0),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_0)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_1(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[1]), 
//		.int_scheduled	(int_scheduled_1),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_1),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_1)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_2(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[2]), 
//		.int_scheduled	(int_scheduled_2),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_2),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_2)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_3(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[3]), 
//		.int_scheduled	(int_scheduled_3),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_3),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_3)
//		 
//		);
//		
//		
//
//dmu_imu_iss_fsm fsm_4(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[4]), 
//		.int_scheduled	(int_scheduled_4),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_4),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_4)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_5(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[5]), 
//		.int_scheduled	(int_scheduled_5),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_5),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_5)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_6(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[6]), 
//		.int_scheduled	(int_scheduled_6),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_6),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_6)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_7(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[7]), 
//		.int_scheduled	(int_scheduled_7),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_7),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_7)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_8(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[8]), 
//		.int_scheduled	(int_scheduled_8),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_8),
//		.sw_wr_data	(sw_state_data),
//		
//		
//		.mondo_state	(mondo_state_8)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_9(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[9]), 
//		.int_scheduled	(int_scheduled_9),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_9),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_9)
//		 
//		);
//
//
//
//dmu_imu_iss_fsm fsm_10(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[10]), 
//		.int_scheduled	(int_scheduled_10),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_10),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_10)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_11(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[11]), 
//		.int_scheduled	(int_scheduled_11),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_11),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_11)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_12(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[12]), 
//		.int_scheduled	(int_scheduled_12),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_12),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_12)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_13(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[13]), 
//		.int_scheduled	(int_scheduled_13),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_13),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_13)
//		 
//		);
//		
//		
//
//dmu_imu_iss_fsm fsm_14(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[14]), 
//		.int_scheduled	(int_scheduled_14),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_14),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_14)
//		 
//		);
//
//
//dmu_imu_iss_fsm fsm_15(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[15]), 
//		.int_scheduled	(int_scheduled_15),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_15),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_15)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_16(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[16]), 
//		.int_scheduled	(int_scheduled_16),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_16),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_16)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_17(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[17]), 
//		.int_scheduled	(int_scheduled_17),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_17),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_17)
//		 
//		);
//
//dmu_imu_iss_fsm fsm_18(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[18]), 
//		.int_scheduled	(int_scheduled_18),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_18),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_18)
//		 
//		);
//
//
//
//dmu_imu_iss_fsm fsm_19(
//
//		.clk		(clk),
//		.rst_l		(rst_l),
//		
//		.int_detected	(j2d_ext_int_l[19]), 
//		.int_scheduled	(int_scheduled_19),
//		
//		.sw_wr		(sw_state_wr),
//		.sw_addr_sel	(sw_state_addr_sel_19),
//		.sw_wr_data	(sw_state_data),
//				
//		.mondo_state	(mondo_state_19)
//		 
//		);
		

//---------------------------------------------
// INTX  Interupt fsm_'s  Mondo's 20 -23
//---------------------------------------------



dmu_imu_iss_fsm fsm_20(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(rds2iss_intx_int_l[0]), 
		.int_scheduled	(int_scheduled_20),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_20),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_20)
		 
		);

dmu_imu_iss_fsm fsm_21(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(rds2iss_intx_int_l[1]), 
		.int_scheduled	(int_scheduled_21),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_21),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_21)
		 
		);


dmu_imu_iss_fsm fsm_22(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(rds2iss_intx_int_l[2]), 
		.int_scheduled	(int_scheduled_22),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_22),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_22)
		 
		);


dmu_imu_iss_fsm fsm_23(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(rds2iss_intx_int_l[3]), 
		.int_scheduled	(int_scheduled_23),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_23),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_23)
		 
		);
		
		
		

//---------------------------------------------
// EQ Interupt fsm_'s  (Mondo's 24-59)
//---------------------------------------------
		
dmu_imu_iss_fsm fsm_24(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[0]), 
		.int_scheduled	(int_scheduled_24),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_24),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_24)
		 
		);


dmu_imu_iss_fsm fsm_25(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[1]), 
		.int_scheduled	(int_scheduled_25),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_25),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_25)
		 
		);

dmu_imu_iss_fsm fsm_26(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[2]), 
		.int_scheduled	(int_scheduled_26),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_26),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_26)
		 
		);

dmu_imu_iss_fsm fsm_27(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[3]), 
		.int_scheduled	(int_scheduled_27),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_27),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_27)
		 
		);

dmu_imu_iss_fsm fsm_28(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[4]), 
		.int_scheduled	(int_scheduled_28),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_28),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_28)
		 
		);


dmu_imu_iss_fsm fsm_29(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[5]), 
		.int_scheduled	(int_scheduled_29),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_29),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_29)
		 
		);


dmu_imu_iss_fsm fsm_30(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[6]), 
		.int_scheduled	(int_scheduled_30),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_30),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_30)
		 
		);

dmu_imu_iss_fsm fsm_31(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[7]), 
		.int_scheduled	(int_scheduled_31),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_31),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_31)
		 
		);


dmu_imu_iss_fsm fsm_32(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[8]), 
		.int_scheduled	(int_scheduled_32),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_32),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_32)
		 
		);


dmu_imu_iss_fsm fsm_33(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[9]), 
		.int_scheduled	(int_scheduled_33),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_33),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_33)
		 
		);
		
		

dmu_imu_iss_fsm fsm_34(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[10]), 
		.int_scheduled	(int_scheduled_34),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_34),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_34)
		 
		);


dmu_imu_iss_fsm fsm_35(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[11]), 
		.int_scheduled	(int_scheduled_35),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_35),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_35)
		 
		);

dmu_imu_iss_fsm fsm_36(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[12]), 
		.int_scheduled	(int_scheduled_36),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_36),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_36)
		 
		);

dmu_imu_iss_fsm fsm_37(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[13]), 
		.int_scheduled	(int_scheduled_37),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_37),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_37)
		 
		);

dmu_imu_iss_fsm fsm_38(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[14]), 
		.int_scheduled	(int_scheduled_38),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_38),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_38)
		 
		);


dmu_imu_iss_fsm fsm_39(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[15]), 
		.int_scheduled	(int_scheduled_39),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_39),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_39)
		 
		);



dmu_imu_iss_fsm fsm_40(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[16]), 
		.int_scheduled	(int_scheduled_40),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_40),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_40)
		 
		);

dmu_imu_iss_fsm fsm_41(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[17]), 
		.int_scheduled	(int_scheduled_41),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_41),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_41)
		 
		);


dmu_imu_iss_fsm fsm_42(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[18]), 
		.int_scheduled	(int_scheduled_42),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_42),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_42)
		 
		);


dmu_imu_iss_fsm fsm_43(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[19]), 
		.int_scheduled	(int_scheduled_43),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_43),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_43)
		 
		);
		

dmu_imu_iss_fsm fsm_44 (

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[20]), 
		.int_scheduled	(int_scheduled_44),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_44),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_44)
		 
		);


dmu_imu_iss_fsm fsm_45(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[21]), 
		.int_scheduled	(int_scheduled_45),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_45),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_45)
		 
		);

dmu_imu_iss_fsm fsm_46(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[22]), 
		.int_scheduled	(int_scheduled_46),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_46),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_46)
		 
		);

dmu_imu_iss_fsm fsm_47(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[23]), 
		.int_scheduled	(int_scheduled_47),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_47),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_47)
		 
		);

dmu_imu_iss_fsm fsm_48(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[24]), 
		.int_scheduled	(int_scheduled_48),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_48),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_48)
		 
		);


dmu_imu_iss_fsm fsm_49(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[25]), 
		.int_scheduled	(int_scheduled_49),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_49),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_49)
		 
		);


dmu_imu_iss_fsm fsm_50(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[26]), 
		.int_scheduled	(int_scheduled_50),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_50),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_50)
		 
		);

dmu_imu_iss_fsm fsm_51(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[27]), 
		.int_scheduled	(int_scheduled_51),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_51),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_51)
		 
		);


dmu_imu_iss_fsm fsm_52(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[28]), 
		.int_scheduled	(int_scheduled_52),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_52),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_52)
		 
		);


dmu_imu_iss_fsm fsm_53(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[29]), 
		.int_scheduled	(int_scheduled_53),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_53),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_53)
		 
		);
		
		

dmu_imu_iss_fsm fsm_54(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[30]), 
		.int_scheduled	(int_scheduled_54),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_54),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_54)
		 
		);


dmu_imu_iss_fsm fsm_55(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[31]), 
		.int_scheduled	(int_scheduled_55),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_55),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_55)
		 
		);

dmu_imu_iss_fsm fsm_56(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[32]), 
		.int_scheduled	(int_scheduled_56),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_56),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_56)
		 
		);

dmu_imu_iss_fsm fsm_57(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[33]), 
		.int_scheduled	(int_scheduled_57),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_57),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_57)
		 
		);

dmu_imu_iss_fsm fsm_58(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[34]), 
		.int_scheduled	(int_scheduled_58),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_58),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_58)
		 
		);


dmu_imu_iss_fsm fsm_59(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(eqs2iss_eq_int_l[35]), 
		.int_scheduled	(int_scheduled_59),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_59),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_59)
		 
		);
		
		
//---------------------------------------------
// IS2 Interupt FSM's (Mondo's 60 & 61) 
//---------------------------------------------

// dmu_imu_iss_fsm fsm_60(
// 
// 		.clk		(clk),
// 		.rst_l		(rst_l),
// 		
// 		.int_detected	(j2d_i2c0_int_l), 
// 		.int_scheduled	(int_scheduled_60),
// 		
// 		.sw_wr		(sw_state_wr),
// 		.sw_addr_sel	(sw_state_addr_sel_60),
// 		.sw_wr_data	(sw_state_data),
// 				
// 		.mondo_state	(mondo_state_60)
// 		 
// 		);

// dmu_imu_iss_fsm fsm_61(
// 
// 		.clk		(clk),
// 		.rst_l		(rst_l),
// 		
// 		.int_detected	(j2d_i2c1_int_l), 
// 		.int_scheduled	(int_scheduled_61),
// 		
// 		.sw_wr		(sw_state_wr),
// 		.sw_addr_sel	(sw_state_addr_sel_61),
// 		.sw_wr_data	(sw_state_data),
// 				
// 		.mondo_state	(mondo_state_61)
// 		 
// 		);


//---------------------------------------------
// Internal Interupt FSM's (Mondo's 62 & 63) 
//---------------------------------------------


dmu_imu_iss_fsm fsm_62(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(ics2iss_mondo_62_int_l), 
		.int_scheduled	(int_scheduled_62),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_62),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_62)
		 
		);


dmu_imu_iss_fsm fsm_63(

		.clk		(clk),
		.rst_l		(rst_l),
		
		.int_detected	(ics2iss_mondo_63_int_l), 
		.int_scheduled	(int_scheduled_63),
		
		.sw_wr		(sw_state_wr),
		.sw_addr_sel	(sw_state_addr_sel_63),
		.sw_wr_data	(sw_state_data),
				
		.mondo_state	(mondo_state_63)
		 
		);
		
		



endmodule













