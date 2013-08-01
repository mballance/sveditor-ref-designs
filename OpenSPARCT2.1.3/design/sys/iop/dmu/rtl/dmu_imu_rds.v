// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds.v
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
module dmu_imu_rds (

		clk,
		rst_l,
		
		// Inputs from the Header Queue
		
		irs2rds_rcd, 
		rds2irs_rcd_deq,
		irs2rds_rcd_empty, 
		
		// Inputs and Outputs from the MSI Data Queue
		
		irs2rds_data, 
		rds2irs_data_deq,
		irs2rds_data_empty, 
		
		// Static Jbus ID Sel 

		j2d_jid,		
		j2d_instance_id,
		
		// INTX Interrupt Notifcation Mechanism 

		rds2iss_intx_int_l,
		
		// Outputs to State Check Sub-block 
		
		rds2scs_rcd,
		rds2scs_rcd_sel,
		rds2scs_eq, 
		
		// Outputs to EQ state Sub-block 

		rds2eqs_eq,
		rds2eqs_eq_sel,
		
		// Outputs to Data Move Sub-block
		
		rds2dms_data_sel,
		rds2dms_data,
		rds2dms_d_ptr,
		
		// Error Signal Outputs 
		
		rds2ics_msi_mal_error,
		rds2ics_msi_par_error,
		rds2ics_pmeack_mes_not_en_error,
		rds2ics_pmpme_mes_not_en_error,
		rds2ics_fatal_mes_not_en_error,
		rds2ics_nonfatal_mes_not_en_error,
		rds2ics_cor_mes_not_en_error,				
		rds2ics_msi_not_en_error,
		rds2ics_error_data,

		// CSRBUS Interface

		csrbus_valid,
                csrbus_done,
                csrbus_mapped,
                csrbus_wr_data,
                csrbus_wr,
                csrbus_read_data,
                csrbus_addr,
		csrbus_src_bus,
		csrbus_acc_vio, 
		
		
		// Debug Ports 
		
		dbg2rds_dbg_sel_a,
		dbg2rds_dbg_sel_b,
		rds2dbg_dbg_a,
		rds2dbg_dbg_b, 
		
		//Idle Checkers 
		
		rds2dbg_idle

		
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
  //   Inputs for Recod Headers to RDS    
  //------------------------------------------------------------------------

  input  [`FIRE_DLC_IIN_REC_WDTH-1:0]   irs2rds_rcd; 
  output           			rds2irs_rcd_deq; 
  input    	   			irs2rds_rcd_empty; 

  //------------------------------------------------------------------------
  //   Inputs for Data Headers to RDS    
  //------------------------------------------------------------------------

  input  [`FIRE_DLC_MDF_REC_WDTH-1:0]	irs2rds_data; 
  output           			rds2irs_data_deq; 
  input    	   			irs2rds_data_empty; 
 
  //------------------------------------------------------------------------
  //  Input Select Signals     
  //------------------------------------------------------------------------
  input	[`FIRE_J2D_JID_WDTH-1:0]		j2d_jid; 
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

  //------------------------------------------------------------------------
  //  Output Interrupt Signals     
  //------------------------------------------------------------------------
  output [3:0]				rds2iss_intx_int_l; 
  
  //------------------------------------------------------------------------
  //  Output to State Check Sub-block Signals     
  //------------------------------------------------------------------------
		
  output [`FIRE_DLC_IIN_REC_WDTH-1:0]	rds2scs_rcd;
  output				rds2scs_rcd_sel;
  output [5:0]				rds2scs_eq;
		
 //------------------------------------------------------------------------
  //  Output to EQ State Sub-block Signals     
  //------------------------------------------------------------------------
  output [5:0]				rds2eqs_eq;
  output				rds2eqs_eq_sel;
		
  //------------------------------------------------------------------------
  //  Output to DMS Sub-block Signals     
  //------------------------------------------------------------------------
  output				rds2dms_data_sel;
  output [127:0]			rds2dms_data;
  output [3:0]				rds2dms_d_ptr;
  
 
  output				rds2ics_msi_mal_error;
  output				rds2ics_msi_par_error;
  output				rds2ics_pmeack_mes_not_en_error;
  output				rds2ics_pmpme_mes_not_en_error;
  output				rds2ics_fatal_mes_not_en_error;
  output				rds2ics_nonfatal_mes_not_en_error;
  output				rds2ics_cor_mes_not_en_error;    
  output				rds2ics_msi_not_en_error;
  output [63:0]				rds2ics_error_data;
  
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


  //------------------------------------------------------------------------
  // Debug Ports   
  //------------------------------------------------------------------------

  input [2:0] 					dbg2rds_dbg_sel_a;
  input [2:0] 					dbg2rds_dbg_sel_b;
  output   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_a;
  output   [`FIRE_DEBUG_WDTH-1:0]		rds2dbg_dbg_b;

  //------------------------------------------------------------------------
  // Idle Checkers    
  //------------------------------------------------------------------------
  output					rds2dbg_idle;

//############################################################################
//				PARAMETERS
//############################################################################

  parameter EQ_WRITE_FIRST_DPTR    =   4'b0000;
  parameter EQ_WRITE_LAST_DPTR     =   4'b1011;

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


//**************************************************
// Wire 
//**************************************************

//----------------------------------------------------
// Header Fields Delayed by one cycle
//----------------------------------------------------
wire 	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	in_lrm_tag_del; 	// LRM tag  bits 7:0
wire 	[`FIRE_DLC_IIN_DPTR_WDTH-1:0]	in_d_ptr_del;		// d_ptr    bits 14:8    
wire    [`FIRE_DLC_IIN_ADDR_WDTH-1:0]  	in_address_del;  	// Address 63:2 bits 76:15
wire 	[`FIRE_DLC_IIN_DATA_WDTH-1:0]	in_data_del; 		// message code and byte enables  bits 84:77
wire 	[`FIRE_DLC_IIN_TLPTAG_WDTH-1:0]	in_tlp_tag_del; 	// TLP tag  bits 92:85
wire 	[`FIRE_DLC_IIN_REQID_WDTH-1:0]	in_req_id_del; 		// PCIE REQ ID  bits 108:93
wire 	[`FIRE_DLC_IIN_LEN_WDTH-1:0]	in_length_del; 		// PCIE Length  bits 118:109
wire 	[`FIRE_DLC_IIN_ATR_WDTH-1:0]	in_attr_del; 		// PCIE attr    bits 120:119
wire 	[`FIRE_DLC_IIN_TC_WDTH-1:0]	in_tc_del; 		// PCIE Length  bits 123:121
wire 	[`FIRE_DLC_IIN_TYPE_WDTH-1:0]	in_type_del; 		// PCIE type    bits 130:124

// wire 	[`FIRE_DLC_MDF_DATA_WDTH-1:0]	in_msi_data_del; 	// MSI Data error bits 0:15
 wire  [15:0]                          in_msi_data_del;        // MSI Data low order
 wire  [15:0]                          in_msi_x_data_del;      // MSI Data high order bytes
 wire  [15:0]                          msi_x_wr_data; 


//----------------------------------------------------
// Header Sub-Fields Delayed
//----------------------------------------------------
wire  		in_mondo_mode_del;		// Mondo Mode 
wire 	[5:0]	in_mondo_ino_del; 		// INO number
wire 	[5:0]	in_mondo_tid_del; 		// TID number
//wire 	[1:0]	in_mondo_group_del; 		// Group controller number


//----------------------------------------------------
// Live Record Fields
//----------------------------------------------------
wire 	[1:0]				in_type; 			// PCIE type  
wire 	[`FIRE_DLC_IIN_DATA_WDTH-1:0]	in_message_code; 		// message code 



//----------------------------------------------------
// Live Record Types 
//----------------------------------------------------
wire 		msi_record; 
wire		intx_record;
wire		message_record; 
wire		mondo_record; 

//----------------------------------------------------
// Pipe Output Selects
//----------------------------------------------------
wire 		msi_sel_out; 
wire		intx_sel_out;
wire		message_sel_out; 
wire		mondo_sel_out; 

//----------------------------------------------------
// MSI and Mess Pipe Output Good and EQ Signals
//----------------------------------------------------
wire 		msi_hd_good; 
wire		message_hd_good; 
wire 	[5:0]	msi_eq_num; 
wire	[5:0]	message_eq_num;
 
//----------------------------------------------------
// Mondo Pipe Output d_ptr and jid  Signals
//----------------------------------------------------

wire 	[3:0]	mondo_d_ptr;
reg     [3:0]   eq_write_d_ptr;  
wire		inc_eq_write_ptr; 
wire	[4:0]	mondo_jid; 

//----------------------------------------------------
// Record pipeline Signals based on output sub-blocks
//----------------------------------------------------
wire	[`FIRE_DLC_IIN_ADDR_WDTH-1:0]	out_address; 
wire 	[9:0]				out_length; 

		
//----------------------------------------------------
// Type Selects Signals based on output sub-blocks
//----------------------------------------------------
wire	[3:0]				all_type_sel; 

//----------------------------------------------------
// Next pipe stage outputs 
//----------------------------------------------------
wire 	[`FIRE_DLC_IIN_REC_WDTH-1:0]	n_rds2scs_rcd;
wire	[5:0]				n_rds2eqs_eq; 
wire 	[127:0]				n_rds2dms_data; 
wire	[3:0]				n_rds2dms_d_ptr;

//----------------------------------------------------
// MSI malformed and Parity Error Signal 
//----------------------------------------------------
wire 					msi_parity_err;
wire					msi_malformed; 
wire 					msi_first_be_good; 
wire					msi_length_good; 
wire					mes_not_en_error;
wire					msi_not_enabled_error;
wire					malformed_error; 
wire					msi_error; 
//----------------------------------------------------
// Wires for DMS 
//----------------------------------------------------

wire 		msi_record_del;
wire 		mondo_record_del;

wire 	[15:0]	eq_wr_data; 
wire	[15:0]	rds_msi_data;

wire	[63:0]	sw_mondo_data_1; 
wire    [57:0] 	sw_mondo_data_0;  

wire 	[63:0]	eq_wr_dw_0; 
wire 	[63:0]	eq_wr_dw_1;

wire 	[63:0]	mondo_dw_0; 
wire 	[63:0]	mondo_dw_1; 

wire 	[127:0]	eq_wr_dms_data;
wire 	[127:0]	mondo_dms_data;



//----------------------------------------------------
// Wires For Muxing PIO Path
//----------------------------------------------------

wire 					intx_acc_vio; 
wire					msi_acc_vio; 
wire					message_acc_vio;

wire 					intx_done; 
wire					msi_done; 
wire					message_done;

wire 					intx_mapped; 
wire					msi_mapped; 
wire					message_mapped;

wire 	[`FIRE_CSR_DATA_WIDTH-1:0]	intx_read_data; 
wire	[`FIRE_CSR_DATA_WIDTH-1:0]	msi_read_data; 
wire	[`FIRE_CSR_DATA_WIDTH-1:0]	message_read_data;


//**************************************************
// Registers that Are Not Flops 
//**************************************************

//--------------------------
// Output Reg Signals
//--------------------------
reg 	[6:0]	out_type; 		
reg	        n_rds2eqs_eq_sel;

reg   [`FIRE_DEBUG_WDTH-1:0] 		n_dbg_a;
reg   [`FIRE_DEBUG_WDTH-1:0] 		n_dbg_b;
//**************************************************
// Registers that Are Flops 
//**************************************************
reg 	[`FIRE_DLC_IIN_REC_WDTH-1:0]	irs2rds_rcd_del;  	// Delayed record by one clock 
reg  	[`FIRE_DLC_MDF_REC_WDTH-1:0]	irs2rds_data_del; 


reg 	[`FIRE_DLC_IIN_REC_WDTH-1:0]	rds2scs_rcd;		// Record Output to SCS		
reg					rds2scs_rcd_sel; 	// Select Output to SCS 

reg	[5:0]				rds2eqs_eq; 		// Record Output to EQS
reg					rds2eqs_eq_sel; 	// Select Output to EQS 

reg 					rds2dms_data_sel;	// Select Output to RDS 
reg	[127:0]				rds2dms_data;		// Record Output to RDS
reg	[3:0]				rds2dms_d_ptr; 		// Address into the DIU RAM 
reg     [`FIRE_DEBUG_WDTH-1:0] 		dbg_a;
reg     [`FIRE_DEBUG_WDTH-1:0] 		dbg_b;
reg					malformed_error_del; 


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
  //---------------------------------------------------------------------
  //  One Hot / Bits On Checkers  
  //---------------------------------------------------------------------

     //0in bits_on -var {msi_record, message_record, mondo_record, intx_record} -max 1 
     //0in bits_on -var all_type_sel -max 1
  
  //---------------------------------------------------------------------
  //  Maximum and Range   
  //---------------------------------------------------------------------
     
     //0in maximum -var n_rds2eqs_eq -val 35
    
  //---------------------------------------------------------------------
  //  Value Checker    
  //---------------------------------------------------------------------
    /* 0in val -var irs2rds_rcd[`FIRE_DLC_IIN_TYPE_MSB : `FIRE_DLC_IIN_TYPE_LSB] 
    	       -val 
	       		7'b1011_000	
	        	7'b1111_000
			
    			7'b0110_000
			7'b0110_001
    			7'b0110_010
    			7'b0110_011
    			7'b0110_100
    			7'b0110_101
    			7'b0110_110
    			7'b0110_111
			
    			7'b1111_010
			
	       -active 	~irs2rds_rcd_empty
    
    */
    
     /* 0in val -var out_type 
    	       -val 
	       		`FIRE_DLC_IMU_TYPE_MONDO	
	        	`FIRE_DLC_IMU_TYPE_NULL
			`FIRE_DLC_IMU_TYPE_MSI_32
			`FIRE_DLC_IMU_TYPE_MES_32
			
	       -active 	|all_type_sel;
    
    */
    
    
    
//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
 
 
//------------------------------------------------------------------------------
// Header Fields Delayed
//------------------------------------------------------------------------------
  assign	in_lrm_tag_del		= irs2rds_rcd_del[`FIRE_DLC_IIN_LRMTAG_MSB : `FIRE_DLC_IIN_LRMTAG_LSB];	// NO CHANGE
  assign	in_d_ptr_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_DPTR_MSB   : `FIRE_DLC_IIN_DPTR_LSB];   // MONDO ONLY *****
  assign  	in_address_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_ADDR_MSB   : `FIRE_DLC_IIN_ADDR_LSB];	// MONDO ONLY *****
  assign	in_data_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_DATA_MSB   : `FIRE_DLC_IIN_DATA_LSB];	// NO CHANGE 
  assign	in_tlp_tag_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_TLPTAG_MSB : `FIRE_DLC_IIN_TLPTAG_LSB];	// NO CHANGE
  assign	in_req_id_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_REQID_MSB  : `FIRE_DLC_IIN_REQID_LSB];	// NO CHANGE
  assign	in_length_del		= irs2rds_rcd_del[`FIRE_DLC_IIN_LEN_MSB    : `FIRE_DLC_IIN_LEN_LSB];	// UPDATE to 10h *****
  assign	in_attr_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_ATR_MSB    : `FIRE_DLC_IIN_ATR_LSB];	// NO CHANGE
  assign	in_tc_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_TC_MSB     : `FIRE_DLC_IIN_TC_LSB];	// NO CHANGE
  assign	in_type_del 		= irs2rds_rcd_del[`FIRE_DLC_IIN_TYPE_MSB   : `FIRE_DLC_IIN_TYPE_LSB];	// CHANGE ON ALL 4 *****

//  assign 	in_msi_data_del		= irs2rds_data_del[15:0]; 
   assign      in_msi_data_del         = irs2rds_data_del[31:16];    // Byte 0 (31:24) and Byte 1 (23:16) of MSI Data   
   assign      in_msi_x_data_del       = irs2rds_data_del[15:0];   // Byte 2 (15:8)  and Byte 3 (7:0) of MSI data 



//----------------------------------------------------------------------------
// Header Sub Fields Delayed
//----------------------------------------------------------------------------
  assign 	in_mondo_mode_del	= in_req_id_del[13]; 	
  assign	in_mondo_ino_del	= in_req_id_del[12:7]; 		
  assign	in_mondo_tid_del	= {in_req_id_del[14],in_req_id_del[6:2]}; 		
//assign	in_mondo_group_del	= in_req_id_del[1:0]; 	
	
//-----------------------------------------------------------------------------
// Do the output muxing after the lookups have been done. 
//
//   d_ptr - This is for Mondo Transactions ONLY
//		- If mondo take new d_ptr
//		- Else take the delayed value
//
//   address - This is for Mondo Transactions ONLY
//		- If mondo take new address
//		- Else take the delayed value

//   length - This is for ALL Transactions 
//		- set to 10H

//-----------------------------------------------------------------------------

assign n_rds2dms_d_ptr 		= mondo_sel_out ?  mondo_d_ptr : eq_write_d_ptr; 
assign out_address 		= mondo_sel_out ? {22'h0,in_mondo_tid_del,mondo_jid,29'h0}: in_address_del;  // ADD MONDO MODE
assign out_length 		= 10'h10;

//-----------------------------------------------------------------------------
// Create the selc signals used fo rthe output selects to different blocks
//-----------------------------------------------------------------------------

assign all_type_sel = {mondo_sel_out,intx_sel_out,msi_sel_out,message_sel_out}; 

assign inc_eq_write_ptr = |all_type_sel[2:0];
//-----------------------------------------------------------------------------
// Create Parity Error 
//
// Packet is and MSI and there is a parity error (irs2rds_data_del[16])
//-----------------------------------------------------------------------------

assign msi_parity_err = irs2rds_data_del[32] & msi_sel_out; 

//-----------------------------------------------------------------------------
// Create Malformed MSI Signals 
//
// Rules
//
// a) length of PCIE packet is NOT 01h
//  
//  b) If the last byte enable field is not 0000b
//	- howevere the PEC already does this check so I do not need to do it here 
//	- if the length is one the Last BE are have to be 0000b or the packet
//	  is malfomed and dropped in the PEC
//  
//  c) if the lower 2 bits in the first byte enable field are not 11b
//  
// 
//  All checking of the actual MSI data will be ignored (ie upper two bytes equals 0
//  as well as the upper two bits of the the first byte enable field. 
//  
//-----------------------------------------------------------------------------

assign msi_length_good   = (irs2rds_rcd[`FIRE_DLC_IIN_LEN_MSB : `FIRE_DLC_IIN_LEN_LSB] == 10'h01);

assign msi_first_be_good = irs2rds_rcd[`FIRE_DLC_IIN_DATA_LSB] & irs2rds_rcd[`FIRE_DLC_IIN_DATA_LSB + 1]; 

assign malformed_error = !msi_first_be_good | !msi_length_good; 

assign msi_malformed =  malformed_error_del & msi_sel_out; 


//-----------------------------------------------------------------------------
// Create Error Signal going into MSI Block 
//
// This is needed as to not update the ok 2 write on any of the follwoing errors
//	- msi not enabled 
//	- msi parity error 
//	- msi malformed error
//
// Since the msi not enable error is detected in the MSI block it does not need
// to factor into this equation as the valid bit will be not set and thus the
// value of the ok 2 write bit will also not chnage
//
// This error signal will only for the remanining 2 errors
//
//-----------------------------------------------------------------------------

assign msi_error =  malformed_error | irs2rds_data[32]; 



//-----------------------------------------------------------------------------
// Do the output muxing after the lookups have been done. 
//
//   type - This is for All Transactions
//		- For Mondos - type is always MONDO
//		- For INTX - type is always NULL
//		- For MSI 
//			- good header - type is MSI_EQ_WR
//			- bad  header - type is NULL
//			- parity err  - type is NULL
//			- malformed   - type is NULL
//
//		    - This totals 7 error cases and 1 good case 
//
//		- For MES 
//			- good header- type is MES_EQ_WR
//			- bad  header- type is NULL
//-----------------------------------------------------------------------------

always @(all_type_sel or msi_parity_err or msi_malformed or msi_hd_good or message_hd_good)
   begin 
      casez ({all_type_sel,msi_parity_err,msi_malformed,msi_hd_good,message_hd_good}) 
      
         8'b1000_000_0:
	     begin
	        out_type  = `FIRE_DLC_IMU_TYPE_MONDO; 	// MONDO HEADER - ALWAYS MONDO
		n_rds2eqs_eq_sel = 1'b0;
	     end
	     	
	 8'b0100_000_0:
	     begin 
	 	out_type  = `FIRE_DLC_IMU_TYPE_NULL; 	// INTX HEADER  - ALWAYS NULL 
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
	     	
	 8'b0010_zz0_0: 
	     begin
	        out_type  = `FIRE_DLC_IMU_TYPE_NULL; 	// MSI HEADER - 4 of 7 errors - TURN TO NULL 
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
	 8'b0010_1z1_0:
	     begin
	        out_type  = `FIRE_DLC_IMU_TYPE_NULL; 	// MSI HEADER - 2 of 7 errors - TURN TO NULL 
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
	 8'b0010_011_0:
	     begin 
	        out_type  = `FIRE_DLC_IMU_TYPE_NULL; 	// MSI HEADER - 1 of 7 errors - TURN TO NULL 
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
	 
	 8'b0010_001_0:
	     begin 
	        out_type  = `FIRE_DLC_IMU_TYPE_MSI_32; 	// MSI HEADER - GOOD HEADER - MSI TYPE
	 	n_rds2eqs_eq_sel = 1'b1;
	     end
	 
	 8'b0001_000_0:
	     begin 
	        out_type  = `FIRE_DLC_IMU_TYPE_NULL; 	// MESSAGE HEADER - BAD HEADER - TURN TO NULL 
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
	     
	 8'b0001_000_1:
	     begin 
	        out_type  = `FIRE_DLC_IMU_TYPE_MES_32; 	// MESSAGE HEADER - GOOD HEADER - MESSAGE TYPE 
	 	n_rds2eqs_eq_sel = 1'b1;
	     end
	 
         default:
	     begin 
	        out_type  = 7'b0000000;
	 	n_rds2eqs_eq_sel = 1'b0;
	     end
       endcase
     end
     	 
	
//--------------------------------
// Concat all of the signals 
//--------------------------------	
assign n_rds2scs_rcd = {out_type, in_tc_del, in_attr_del, out_length, in_req_id_del, in_tlp_tag_del, 
			  in_data_del, out_address, in_d_ptr_del, in_lrm_tag_del};
  
 
assign n_rds2eqs_eq =    message_sel_out ? message_eq_num : (msi_sel_out ? msi_eq_num: 6'h0);    
	
//--------------------------------
// Live Header Fields Off of Fifo
//--------------------------------	
	
assign	in_type 		= {irs2rds_rcd[`FIRE_DLC_IIN_TYPE_LSB + `FIRE_DLC_IMU_ITYPE_DECODE_1],  //bit 3 of type field
				   irs2rds_rcd[`FIRE_DLC_IIN_TYPE_LSB + `FIRE_DLC_IMU_ITYPE_DECODE_0]   //bit 1 of type field
				  };	
				  
assign	in_message_code		= irs2rds_rcd[`FIRE_DLC_IIN_DATA_MSB : `FIRE_DLC_IIN_DATA_LSB];		
 
//-----------------------------------------------------------------------------
// The IMU decodes three different types of token based on the the valeu of the 
// in_type file. 
//
// For this case, bits 3 and bits 1 will be choosen making the decode as
//  follows
//
//	- MSI - bit[3] & !bit[1]
//	- MSG - !bit[3]
//	- MDO - bit[3] & bit[1] 
//
// Since we are only doing a 3 type a full decode is not needed we can just look 
// two bits
//-----------------------------------------------------------------------------

assign 	msi_record 	=  in_type[1] & ~in_type[0] & ~irs2rds_rcd_empty;  
assign	message_record 	= ~in_type[1] & ~(in_message_code[7:4] == 4'b0010)     & ~irs2rds_rcd_empty; 
assign	mondo_record 	=  in_type[1] &  in_type[0] & ~irs2rds_rcd_empty; 
assign	intx_record 	= ~in_type[1] &  (in_message_code[7:4] == 4'b0010)     & ~irs2rds_rcd_empty;


//-----------------------------------------------------------------------------
// Assign the Values to the Dequeue Signals for the Two fifo's
//
//   The command fifo needs to be dequeued as long as its not empty 
//
//   The MSI data fifo only needs to be dequeued if its a MSI transaction
// 
//-----------------------------------------------------------------------------

assign rds2irs_rcd_deq = ~irs2rds_rcd_empty; 

assign rds2irs_data_deq = rds2irs_rcd_deq & msi_record & ~irs2rds_data_empty; 



//-----------------------------------------------------------------------------
//  Muxing Logic for PIO Path 
// 
//-----------------------------------------------------------------------------
assign csrbus_acc_vio = msi_acc_vio | intx_acc_vio | message_acc_vio; 
assign csrbus_done = msi_done | intx_done | message_done; 
assign csrbus_mapped = msi_mapped | intx_mapped | message_mapped; 
assign csrbus_read_data = msi_done ? msi_read_data : (message_done ? message_read_data : intx_read_data); 




//-----------------------------------------------------------------------------
//  DATA PATH SETUP 
// 
//-----------------------------------------------------------------------------

//----------------------
// Decode delayed type
//----------------------

assign msi_record_del 	  =  in_type_del[`FIRE_DLC_IMU_ITYPE_DECODE_1] & ~in_type_del[`FIRE_DLC_IMU_ITYPE_DECODE_0];
assign mondo_record_del   =  in_type_del[`FIRE_DLC_IMU_ITYPE_DECODE_1] &  in_type_del[`FIRE_DLC_IMU_ITYPE_DECODE_0];

//-----------------------------------------
// Pick what the Data field will be 
//    - for msi - msi_data 
//    - for mes - message code 
//-----------------------------------------

// assign eq_wr_data   = msi_record_del ? in_msi_data_del : {8'h0, in_data_del}; 
assign eq_wr_data    = msi_record_del ? {in_msi_data_del[7:0],in_msi_data_del[15:8]} : {8'h0, in_data_del};

assign rds_msi_data = msi_record_del ? in_msi_data_del : {16'h0}; 
assign msi_x_wr_data = msi_record_del ? {in_msi_x_data_del[7:0],in_msi_x_data_del[15:8]}  : {in_address_del[13:0], 2'h0};

//-----------------------------------------
// Assign Each Data Word
//-----------------------------------------
assign eq_wr_dw_0 = {1'b0, in_type_del, in_length_del,in_address_del[13:0],in_req_id_del,eq_wr_data};
// assign eq_wr_dw_1 = {in_address_del, 2'b0};
assign eq_wr_dw_1 = {in_address_del[61:14], msi_x_wr_data};


//BP n2 11-21-05 assign mondo_dw_0 = in_mondo_mode_del ? {sw_mondo_data_0, in_mondo_ino_del} : {52'b0, in_mondo_tid_del, in_mondo_ino_del}; 
assign mondo_dw_0 = in_mondo_mode_del ? {sw_mondo_data_0[57:6],in_mondo_tid_del, in_mondo_ino_del} : {52'b0, in_mondo_tid_del, in_mondo_ino_del}; 
// assign mondo_dw_0 = in_mondo_mode_del ? {sw_mondo_data_0, in_mondo_ino_del} : {53'b0, mondo_jid, in_mondo_ino_del};
assign mondo_dw_1 = in_mondo_mode_del ? sw_mondo_data_1 : 64'h0; 

//-----------------------------------------
//Make the 128 bit bus
//-----------------------------------------
assign eq_wr_dms_data 	 = {eq_wr_dw_0, eq_wr_dw_1};
assign mondo_dms_data 	 = {mondo_dw_0, mondo_dw_1};

//-----------------------------------------
//Make the 128 bit bus
//-----------------------------------------

assign n_rds2dms_data = mondo_record_del ? mondo_dms_data : eq_wr_dms_data; 


//-----------------------------------------------------------------------------
//  ERRORS
// 
//-----------------------------------------------------------------------------
assign	rds2ics_msi_par_error    = msi_parity_err;
assign	rds2ics_msi_mal_error    = msi_malformed & ~msi_parity_err;
assign	rds2ics_msi_not_en_error = msi_not_enabled_error & ~(msi_parity_err | msi_malformed);

assign  rds2ics_error_data = {in_type_del[5:0],in_length_del,in_req_id_del,in_tlp_tag_del,in_data_del,rds_msi_data};

assign mes_not_en_error =   rds2ics_pmeack_mes_not_en_error   |
			    rds2ics_pmpme_mes_not_en_error    |
			    rds2ics_fatal_mes_not_en_error    | 
			    rds2ics_nonfatal_mes_not_en_error |
			    rds2ics_cor_mes_not_en_error;
			    
			    		
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
//
// 	- Reset the value to the first RAM location 
//
//	- If new requests comes in advance the dptr in cicular fashion
//	- If no new request hold the value. 
//
//-------------------------------------------------------------------------- 

always @ (posedge clk)                          
  if (!rst_l)                                   
       eq_write_d_ptr <= EQ_WRITE_FIRST_DPTR;                       
  else if (inc_eq_write_ptr) 
         begin
	   if(eq_write_d_ptr == EQ_WRITE_LAST_DPTR)
	       eq_write_d_ptr <= EQ_WRITE_FIRST_DPTR;
	   else
	        eq_write_d_ptr <= eq_write_d_ptr + 1;
	 end
  else 
       eq_write_d_ptr <= eq_write_d_ptr;    


//-----------------------------------------------------------------------------
// Delay all of the In Record infomrtaion to keep in step with the pipeline. 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
       begin                   		// At reset reset all of them to zero.                  
       irs2rds_rcd_del	<= {`FIRE_DLC_IIN_REC_WDTH{1'h0}}; 
       irs2rds_data_del <= {`FIRE_DLC_MDF_REC_WDTH{1'h0}}; 
      end 		
  else 
      begin                   		                 
       irs2rds_rcd_del  <= irs2rds_rcd; 
       irs2rds_data_del <= irs2rds_data; 
      end 	
      	
//-----------------------------------------------------------------------------
// Delay error to keep in step with the pipeline. 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
       begin                   		// At reset reset all of them to zero.                  
       malformed_error_del <= 1'h0; 
      end 		
  else 
      begin                   		                 
       malformed_error_del <= malformed_error; 
      end 		     
      
//-----------------------------------------------------------------------------
// Flop the Out Record to the SCS 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       rds2scs_rcd	<= {`FIRE_DLC_IIN_REC_WDTH{1'h0}}; 
       rds2scs_rcd_sel	<= 1'h0; 
      end 		
  else 
      begin                   		                 
       rds2scs_rcd  	<= n_rds2scs_rcd;        
       rds2scs_rcd_sel	<= |all_type_sel;  // if any of the stages where selected

      end 		     
//-----------------------------------------------------------------------------
// Flop the Data Record to the DMS 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       rds2dms_data	<= 128'h0; 
       rds2dms_data_sel	<= 1'h0; 
       rds2dms_d_ptr	<= 4'h0;
      end 		
  else 
      begin                   		                 
       rds2dms_data  	<= n_rds2dms_data;        
       rds2dms_data_sel	<= |all_type_sel;  // if any of the stages where selected
       rds2dms_d_ptr	<= n_rds2dms_d_ptr; // select the lower 4 bits 
      end 		           
      
      
      
 //-----------------------------------------------------------------------------
// Flop the EQ Record to the EQS 
//
//-----------------------------------------------------------------------------
always @ (posedge clk)                         
  if (!rst_l)
      begin                   		// At reset reset all of them to zero.                  
       rds2eqs_eq	<= 6'h0; 
       rds2eqs_eq_sel	<= 1'h0; 
      end 		
  else 
      begin                   		                 
       rds2eqs_eq  	<= n_rds2eqs_eq;        
       rds2eqs_eq_sel	<= n_rds2eqs_eq_sel;  // if any of the stages where selected

      end 
      
assign rds2scs_eq =  rds2eqs_eq;      
           
//-----------------------------------------------------
//  Debug Ports  
//-----------------------------------------------------  

always @ (dbg2rds_dbg_sel_a or msi_record or message_record or mondo_record or intx_record or irs2rds_rcd_empty or
	  mondo_sel_out or mondo_d_ptr or mondo_jid  or intx_sel_out or in_message_code or 
	  message_sel_out or message_hd_good or message_eq_num or msi_sel_out or msi_hd_good or msi_eq_num or 
	  rds2scs_rcd_sel or rds2scs_rcd or rds2ics_msi_mal_error or rds2ics_msi_par_error or mes_not_en_error or
	  rds2ics_msi_not_en_error or msi_length_good or msi_first_be_good) 
  begin
    case (dbg2rds_dbg_sel_a) // synopsys infer_mux
      3'b000: n_dbg_a = {3'h0, msi_record, message_record, mondo_record, intx_record, irs2rds_rcd_empty};
      3'b001: n_dbg_a = {3'h0, mondo_sel_out, mondo_d_ptr[3:0]};
      3'b010: n_dbg_a = {1'b0, mondo_jid[4:0], mondo_record, intx_sel_out};
      3'b011: n_dbg_a = {in_message_code[7:0]};
      3'b100: n_dbg_a = {message_sel_out, message_hd_good,message_eq_num[5:0]};
      3'b101: n_dbg_a = {msi_sel_out, msi_hd_good, msi_eq_num[5:0]};
      3'b110: n_dbg_a = {rds2scs_rcd_sel, rds2scs_rcd[`FIRE_DLC_IIN_TYPE_MSB:`FIRE_DLC_IIN_TYPE_LSB]};
      3'b111: n_dbg_a = {2'b00, rds2ics_msi_mal_error, rds2ics_msi_par_error, mes_not_en_error,
      			 rds2ics_msi_not_en_error, msi_length_good, msi_first_be_good };
    endcase
  end

always @ (dbg2rds_dbg_sel_b or msi_record or message_record or mondo_record or intx_record or irs2rds_rcd_empty or
	  mondo_sel_out or mondo_d_ptr or mondo_jid  or intx_sel_out or in_message_code or 
	  message_sel_out or message_hd_good or message_eq_num or msi_sel_out or msi_hd_good or msi_eq_num or 
	  rds2scs_rcd_sel or rds2scs_rcd or rds2ics_msi_mal_error or rds2ics_msi_par_error or mes_not_en_error or
	  rds2ics_msi_not_en_error or msi_length_good or msi_first_be_good) 
  begin
    case (dbg2rds_dbg_sel_b) // synopsys infer_mux
      3'b000: n_dbg_b = {3'h0, msi_record, message_record, mondo_record, intx_record, irs2rds_rcd_empty};
      3'b001: n_dbg_b = {3'h0, mondo_sel_out, mondo_d_ptr[3:0]};
      3'b010: n_dbg_b = {1'b0, mondo_jid[4:0], mondo_record, intx_sel_out};
      3'b011: n_dbg_b = {in_message_code[7:0]};
      3'b100: n_dbg_b = {message_sel_out, message_hd_good,message_eq_num[5:0]};
      3'b101: n_dbg_b = {msi_sel_out, msi_hd_good, msi_eq_num[5:0]};
      3'b110: n_dbg_b = {rds2scs_rcd_sel, rds2scs_rcd[`FIRE_DLC_IIN_TYPE_MSB:`FIRE_DLC_IIN_TYPE_LSB]};
      3'b111: n_dbg_b = {2'b00, rds2ics_msi_mal_error, rds2ics_msi_par_error, mes_not_en_error,
      			 rds2ics_msi_not_en_error, msi_length_good, msi_first_be_good };
    endcase
  end

  
always @ (posedge clk)
     begin 
      if (!rst_l )  begin
       dbg_a <= `FIRE_DEBUG_WDTH'b0;
       dbg_b <= `FIRE_DEBUG_WDTH'b0;
      end
      else  begin
      dbg_a <= n_dbg_a;
      dbg_b <= n_dbg_b;
     end   
     end   
   

assign rds2dbg_dbg_a = dbg_a; 
assign rds2dbg_dbg_b = dbg_b; 

 //------------------------------------------------------------------------
  // Idle Checkers    
  //------------------------------------------------------------------------
assign rds2dbg_idle  = ~rds2scs_rcd_sel	 & 
		       ~(|all_type_sel)  & 
		       irs2rds_rcd_empty & 
		       irs2rds_data_empty;

     
      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    

 dmu_imu_rds_mondo mondo(
		.clk			(clk),
		.rst_l			(rst_l),
		
		.j2d_jid		(1'b0),		
		.j2d_instance_id	(1'b0),

		.pipe_select_in		(mondo_record), 
		
		.pipe_select_out	(mondo_sel_out),
		.mondo_d_ptr		(mondo_d_ptr),
		.mondo_jid		(mondo_jid)
		
		);	

	

 dmu_imu_rds_mess mess(
		.clk					(clk),
		.rst_l					(rst_l),
		
		.pipe_select_in				(message_record), 		
		.message_code				(in_message_code), 
		
		.pipe_select_out			(message_sel_out),
		.header_good				(message_hd_good), 
		.message_eq_num				(message_eq_num),
		
		.rds2ics_pmeack_mes_not_en_error	(rds2ics_pmeack_mes_not_en_error),
		.rds2ics_pmpme_mes_not_en_error		(rds2ics_pmpme_mes_not_en_error),
		.rds2ics_fatal_mes_not_en_error		(rds2ics_fatal_mes_not_en_error),
		.rds2ics_nonfatal_mes_not_en_error	(rds2ics_nonfatal_mes_not_en_error),
		.rds2ics_cor_mes_not_en_error		(rds2ics_cor_mes_not_en_error),				
        	
		.csrbus_valid           		(csrbus_valid),
        	.csrbus_done            		(message_done),
        	.csrbus_mapped          		(message_mapped),
        	.csrbus_wr_data         		(csrbus_wr_data),
        	.csrbus_wr              		(csrbus_wr),
        	.csrbus_read_data       		(message_read_data),
        	.csrbus_addr            		(csrbus_addr),
		
		.csrbus_src_bus				(csrbus_src_bus),
		.csrbus_acc_vio				(message_acc_vio),
		.j2d_instance_id			(j2d_instance_id)

		
		);
		
		
		
 dmu_imu_rds_msi msi(
		.clk			(clk),
		.rst_l			(rst_l),
		
		.pipe_select_in		(msi_record), 				
// 		.msi_data		(irs2rds_data[15:8]), 
                .msi_data               (irs2rds_data[31:24]),
		.msi_error		(msi_error),
		
		.pipe_select_out	(msi_sel_out),
		.header_good		(msi_hd_good), 
		.msi_eq_num		(msi_eq_num),
		.msi_not_enabled_error	(msi_not_enabled_error),
		
		.sw_mondo_data_0	(sw_mondo_data_0),
		.sw_mondo_data_1	(sw_mondo_data_1),
		
		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (msi_done),
        	.csrbus_mapped          (msi_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (msi_read_data),
        	.csrbus_addr            (csrbus_addr),
		
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(msi_acc_vio),
		.j2d_instance_id	(j2d_instance_id)

		
		);
				

 dmu_imu_rds_intx intx(
		.clk			(clk),
		.rst_l			(rst_l),
		
		.pipe_select_in		(intx_record), 			
		.message_code		(in_message_code), 
		
		.pipe_select_out	(intx_sel_out),
		.rds2iss_intx_int_l	(rds2iss_intx_int_l),
		
		
		.csrbus_valid           (csrbus_valid),
        	.csrbus_done            (intx_done),
        	.csrbus_mapped          (intx_mapped),
        	.csrbus_wr_data         (csrbus_wr_data),
        	.csrbus_wr              (csrbus_wr),
        	.csrbus_read_data       (intx_read_data),
        	.csrbus_addr            (csrbus_addr),
		
		.csrbus_src_bus		(csrbus_src_bus),
		.csrbus_acc_vio		(intx_acc_vio),
		.j2d_instance_id	(j2d_instance_id)

		
		);
		
		

endmodule
