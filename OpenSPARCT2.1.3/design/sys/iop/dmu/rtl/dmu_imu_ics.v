// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics.v
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
module dmu_imu_ics (

		// Clock and Reset 

		clk,
		rst_l,
		por_l,
				
		// DMC Block Level Input Interrupt Signals  

		mm2im_int,
		y2k_int_l,    

		// IMU sub-block Level Input Interrupt Signals  
		
		rds2ics_msi_mal_error,
		rds2ics_msi_par_error,
		rds2ics_pmeack_mes_not_en_error,
		rds2ics_pmpme_mes_not_en_error,
		rds2ics_fatal_mes_not_en_error,
		rds2ics_nonfatal_mes_not_en_error,
		rds2ics_cor_mes_not_en_error,
		rds2ics_msi_not_en_error,
		rds2ics_error_data,

		eqs2ics_eq_over_error, 
		eqs2ics_error_data,
		
		scs2ics_eq_not_en_error,
		scs2ics_error_data,
		
		// DMC/PEC Core Level Output Interrupt Signals  

		ics2iss_mondo_62_int_l,
		ics2iss_mondo_63_int_l,
		
		// TMU Static CSR Signals
		
		im2tm_msi32_addr_reg,
		im2tm_msi64_addr_reg,
		im2rm_mem64_offset_reg,

						
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
		
		// Static ID 
		j2d_instance_id, 
		
		//Perf Counters

		ors2ics_perf_eq_mondos,
		ors2ics_perf_mondos,
		ors2ics_perf_msi,
		ors2ics_perf_eq_wr,
		
		rss2ics_perf_mondo_nacks,  
		
		// for N2 debug
		dmu_dbg_err_event,

                // for N2 pio stall enable for bug 107207
                im2crm_bc_stall_en,
                im2crm_ilu_stall_en
  
		);
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################


  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 	clk;
  input		rst_l; 
  input		por_l; 

  
  //------------------------------------------------------------------------
  // DMC Block Level Input Interrupt Signals  
  //------------------------------------------------------------------------
  
  input		mm2im_int;		// MMU Interrupt signal active high 
  input		y2k_int_l;		// PEC core Int signal active low

  
  //------------------------------------------------------------------------
  // IMU sub-block Level Input Interrupt Signals  
  //------------------------------------------------------------------------
  
  input				rds2ics_msi_mal_error;
  input				rds2ics_msi_par_error;
  input				rds2ics_pmeack_mes_not_en_error;
  input				rds2ics_pmpme_mes_not_en_error;
  input				rds2ics_fatal_mes_not_en_error;
  input				rds2ics_nonfatal_mes_not_en_error;
  input				rds2ics_cor_mes_not_en_error;
  input				rds2ics_msi_not_en_error;
  input [63:0]			rds2ics_error_data;
  
  input				eqs2ics_eq_over_error; 
  input [63:0]			eqs2ics_error_data;

  input				scs2ics_eq_not_en_error;
  input [63:0]			scs2ics_error_data;


  //------------------------------------------------------------------------
  // DMC/PEC Core Level Output Interrupt Signals   
  //------------------------------------------------------------------------

  output 	ics2iss_mondo_62_int_l;    
  output 	ics2iss_mondo_63_int_l;    
 
  
  //------------------------------------------------------------------------
  // TMU Static CSR Signals
  //------------------------------------------------------------------------
  		
  output [15:0]	im2tm_msi32_addr_reg;
  output [47:0]	im2tm_msi64_addr_reg;
  output [39:0]	im2rm_mem64_offset_reg;
  
  
  //------------------------------------------------------------------------
  // PIO INTERFACE   
  //------------------------------------------------------------------------
  input 					csrbus_valid; 
  output        				csrbus_done;
  output					csrbus_mapped; 
  
  input	[`FIRE_CSR_DATA_WIDTH-1:0]		csrbus_wr_data; 
  input						csrbus_wr; 
  
  output [`FIRE_CSR_DATA_WIDTH-1:0]		csrbus_read_data;
  
  input	[`FIRE_CSR_ADDR_MAX_WIDTH-1:0]		csrbus_addr;
       
  input [`FIRE_CSR_SRC_BUS_ID_WIDTH-1:0]	csrbus_src_bus; 
  output					csrbus_acc_vio; 
  
  
  input	[`FIRE_J2D_INSTANCE_ID_WDTH-1:0] 	j2d_instance_id;

  //------------------------------------------------------------------------
  // Perf Counters   
  //------------------------------------------------------------------------
  input						ors2ics_perf_eq_mondos;
  input						ors2ics_perf_mondos;
  input						ors2ics_perf_msi;
  input						ors2ics_perf_eq_wr;
  
  input						rss2ics_perf_mondo_nacks; 
  //------------------------------------------------------------------------
  // for N2 debug
  //------------------------------------------------------------------------
  output					dmu_dbg_err_event; 

  //------------------------------------------------------------------------
  // for N2 stall fix enables for bug 107207
  //------------------------------------------------------------------------
  output                                        im2crm_bc_stall_en;
  output                                        im2crm_ilu_stall_en;

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  //**************************************************
  // Wires 
  //**************************************************

  wire		imu_mask; 
  wire 		mmu_mask; 
  wire 		dmc_mask; 

  wire          im2im_int;

  wire    	imu_block_int; 
  wire    	mmu_block_int; 

  wire    	dmc_core_int_l; 
  wire    	dmc_core_int; 
 
  wire    	pec_core_int_l; 
  wire    	pec_core_int; 

  reg  [4:0]    spare_error;
  wire [7:0]    spare_control_load; 
  wire [7:0]    spare_control; 
  wire [7:0]    spare_status;  
  //-------------------------------------------
  // Log Enable Wires 
  //-------------------------------------------

   wire [4:0]   spare_error_log_en;
   wire		eq_over_error_log_en;
   wire		eq_not_en_error_log_en;
   wire		msi_mal_error_log_en; 
   wire		msi_par_error_log_en; 
   wire		pmeack_mes_not_en_error_log_en;
   wire		pmpme_mes_not_en_error_log_en;
   wire		fatal_mes_not_en_error_log_en;
   wire		nonfatal_mes_not_en_error_log_en;
   wire		cor_mes_not_en_error_log_en;   
   wire		msi_not_en_error_log_en; 
   
  //-------------------------------------------
  // INT Enable Primary Wires 
  //-------------------------------------------
   
   wire  [4:0]  spare_error_p_int_en; 
   wire		eq_over_error_p_int_en;
   wire		eq_not_en_error_p_int_en;
   wire		msi_mal_error_p_int_en; 
   wire		msi_par_error_p_int_en; 
   wire		pmeack_mes_not_en_error_p_int_en;
   wire		pmpme_mes_not_en_error_p_int_en;
   wire		fatal_mes_not_en_error_p_int_en;
   wire		nonfatal_mes_not_en_error_p_int_en;
   wire		cor_mes_not_en_error_p_int_en;   
   wire		msi_not_en_error_p_int_en; 
    
  //-------------------------------------------
  // INT Enable Secondary Wires 
  //-------------------------------------------

   wire [4:0]   spare_error_s_int_en;
   wire		eq_over_error_s_int_en;
   wire		eq_not_en_error_s_int_en;
   wire		msi_mal_error_s_int_en; 
   wire		msi_par_error_s_int_en; 
   wire		pmeack_mes_not_en_error_s_int_en;
   wire		pmpme_mes_not_en_error_s_int_en;
   wire		fatal_mes_not_en_error_s_int_en;
   wire		nonfatal_mes_not_en_error_s_int_en;
   wire		cor_mes_not_en_error_s_int_en;      
   wire		msi_not_en_error_s_int_en; 
    
  
   
  //-------------------------------------------
  // Anded Error and Log Enable Wires 
  //-------------------------------------------

   wire [4:0]   log_spare_error; 
   wire		log_eq_over_error;
   wire		log_eq_not_en_error;
   wire		log_msi_mal_error; 
   wire		log_msi_par_error; 
   wire		log_pmeack_mes_not_en_error;
   wire		log_pmpme_mes_not_en_error;
   wire		log_fatal_mes_not_en_error;
   wire		log_nonfatal_mes_not_en_error;
   wire		log_cor_mes_not_en_error;     
   wire		log_msi_not_en_error; 
   
  //-------------------------------------------
  // Set wire for Primary Logged Error Stat
  //-------------------------------------------

   wire [4:0]	set_p_logged_spare; 
   wire		set_p_logged_eq_over;
   wire		set_p_logged_eq_not_en;
   wire		set_p_logged_msi_mal; 
   wire		set_p_logged_msi_par; 
   wire		set_p_logged_pmeack_mes_not_en;
   wire		set_p_logged_pmpme_mes_not_en;
   wire		set_p_logged_fatal_mes_not_en;
   wire		set_p_logged_nonfatal_mes_not_en;
   wire		set_p_logged_cor_mes_not_en;      
   wire		set_p_logged_msi_not_en; 

  //-------------------------------------------
  // Set wire for Sec Logged Error Stat
  //-------------------------------------------
  
   wire [4:0]	set_s_logged_spare; 
   wire		set_s_logged_eq_over;
   wire		set_s_logged_eq_not_en;
   wire		set_s_logged_msi_mal; 
   wire		set_s_logged_msi_par; 
   wire		set_s_logged_pmeack_mes_not_en;
   wire		set_s_logged_pmpme_mes_not_en;
   wire		set_s_logged_fatal_mes_not_en;
   wire		set_s_logged_nonfatal_mes_not_en;
   wire		set_s_logged_cor_mes_not_en;         
   wire		set_s_logged_msi_not_en; 


  //-------------------------------------------
  //Read Port wire Primary Logged Error Stat
  //-------------------------------------------
   
   wire [4:0]   logged_p_spare_reg;
   wire		logged_p_eq_over_reg;
   wire		logged_p_eq_not_en_reg;
   wire		logged_p_msi_mal_reg; 
   wire		logged_p_msi_par_reg; 
   wire		logged_p_pmeack_mes_not_en_reg;
   wire		logged_p_pmpme_mes_not_en_reg;
   wire		logged_p_fatal_mes_not_en_reg;
   wire		logged_p_nonfatal_mes_not_en_reg;
   wire		logged_p_cor_mes_not_en_reg;         
   wire		logged_p_msi_not_en_reg; 
 
  //-------------------------------------------
  //Read Port wire Sec Logged Error Stat
  //-------------------------------------------

   wire [4:0]   logged_s_spare_reg;
   wire		logged_s_eq_over_reg;
   wire		logged_s_eq_not_en_reg;
   wire		logged_s_msi_mal_reg; 
   wire		logged_s_msi_par_reg; 
   wire		logged_s_pmeack_mes_not_en_reg;
   wire		logged_s_pmpme_mes_not_en_reg;
   wire		logged_s_fatal_mes_not_en_reg;
   wire		logged_s_nonfatal_mes_not_en_reg;
   wire		logged_s_cor_mes_not_en_reg;         
   wire		logged_s_msi_not_en_reg; 

  //-------------------------------------------
  // Set wire for Primary Enabled Err Stat Reg
  //-------------------------------------------

   wire [4:0]	enabled_p_spare; 
   wire		enabled_p_eq_over;
   wire		enabled_p_eq_not_en;
   wire		enabled_p_msi_mal; 
   wire		enabled_p_msi_par; 
   wire		enabled_p_pmeack_mes_not_en;
   wire		enabled_p_pmpme_mes_not_en;
   wire		enabled_p_fatal_mes_not_en;
   wire		enabled_p_nonfatal_mes_not_en;
   wire		enabled_p_cor_mes_not_en;         
   wire		enabled_p_msi_not_en; 

  //-------------------------------------------
  //  Set wire for Sec Enabled Err Stat Reg
  //-------------------------------------------

   wire [4:0]   enabled_s_spare; 
   wire		enabled_s_eq_over;
   wire		enabled_s_eq_not_en;
   wire		enabled_s_msi_mal; 
   wire		enabled_s_msi_par; 
   wire		enabled_s_pmeack_mes_not_en;
   wire		enabled_s_pmpme_mes_not_en;
   wire		enabled_s_fatal_mes_not_en;
   wire		enabled_s_nonfatal_mes_not_en;
   wire		enabled_s_cor_mes_not_en;         
   wire		enabled_s_msi_not_en; 

   wire 	rds_group_p_error_set;
   wire 	scs_group_p_error_set;
   wire 	eqs_group_p_error_set;

   wire		load_rds_logging_reg; 
   wire		load_scs_logging_reg; 
   wire		load_eqs_logging_reg; 

   
   //--------------------------------------------
   //     Perf Counters              
   //--------------------------------------------
   wire [`FIRE_PRF_ADDR_BITS] 		prfc_sel1_hw_read;
   wire [`FIRE_PRF_ADDR_BITS] 		prfc_sel0_hw_read;
  
   wire [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_read;
   wire [`FIRE_PRF_DATA_BITS]		prf1_cnt_hw_read;
  
   wire [`FIRE_PRF_DATA_BITS]		prf0_cnt_hw_write;
   wire [`FIRE_PRF_DATA_BITS]		prf1_cnt_hw_write;

   wire [`FIRE_PRF_DATA_BITS]		inc_cnt0; 
   wire [`FIRE_PRF_DATA_BITS]		inc_cnt1;

  //**************************************************
  // Registers that Are Not Flops 
  //**************************************************

  
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg  [`FIRE_PRF_ADDR_BITS]		prf_sel [0:1];
  reg  [1:0] 	  			prf_inc;

  reg [7:0]   				spare_control_load_reg; 
  reg [7:0]   				spare_control_reg; 
  reg [7:0]   				spare_status_reg; 
  
  integer	  			i;
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
  
    

//############################################################################
//		     COMBINATIONAL LOGIC FOR DMC ERRORS
//############################################################################   

//----------------------------------
// IMU Block Level Interrupt Signals
//
// Consentrate All Error Signals
//----------------------------------

assign im2im_int = enabled_p_spare[0]   		|
		   enabled_s_spare[0]   		|
		   enabled_p_spare[1]   		|
		   enabled_s_spare[1]   		|
		   enabled_p_spare[2]   		|
		   enabled_s_spare[2]   		|
		   enabled_p_spare[3]   		|
		   enabled_s_spare[3]   		|
		   enabled_p_spare[4]   		|
		   enabled_s_spare[4]   		|
		   enabled_p_eq_over    		|
		   enabled_p_eq_not_en  		|
		   enabled_p_msi_mal    		|
		   enabled_p_msi_par    		|
 		   enabled_p_pmeack_mes_not_en		|
    		   enabled_p_pmpme_mes_not_en		|
     		   enabled_p_fatal_mes_not_en		|
    	   	   enabled_p_nonfatal_mes_not_en	|
   		   enabled_p_cor_mes_not_en		|         		   
		   enabled_p_msi_not_en 		|
		   enabled_s_eq_over    		|
		   enabled_s_eq_not_en  		|
		   enabled_s_msi_mal    		|
		   enabled_s_msi_par    		|
		   enabled_s_pmeack_mes_not_en		|
    		   enabled_s_pmpme_mes_not_en		|
     		   enabled_s_fatal_mes_not_en		|
    	   	   enabled_s_nonfatal_mes_not_en	|
   		   enabled_s_cor_mes_not_en		|     		   
		   enabled_s_msi_not_en;

//----------------------------------
// IMU Block Level Interrupt Signal
//
//	- Active High 
//      - Anded with IMU Block mask
//	- Anded with DMC Core Mask
//----------------------------------

assign imu_block_int = imu_mask & dmc_mask & im2im_int;

//---------------------------------
// MMU Block Level Interrupt Signal
//
//	- Active High 
//      - Anded with MMU Block mask
//	- Anded with DMC Core Mask
//----------------------------------

assign mmu_block_int = mmu_mask & dmc_mask & mm2im_int;



//---------------------------------
// DMC Core Level Interrupt Signal
//
//	- Active Low
//      - Ored Block level signals
//	- Inverted
//----------------------------------

assign dmc_core_int_l = ~(mmu_block_int | imu_block_int); 
// assign dmc_core_int = ~dmc_core_int_l;

//---------------------------------
// PEC Core Level Interrupt Signal
//
//	- Active Low
//      - Ored Block level signals
// 	- From Pec 
//----------------------------------

assign pec_core_int_l =  y2k_int_l; 
// assign pec_core_int = ~pec_core_int_l;

//---------------------------------
// Mondo 62 Interrupt Signal
//
//	- Active Low
//      - Anded core level signals
//----------------------------------
assign ics2iss_mondo_62_int_l = dmc_core_int_l; 
assign ics2iss_mondo_63_int_l = pec_core_int_l;

// for N2 debug
wire	debug_trig_en;
assign dmu_dbg_err_event	= debug_trig_en & (~(dmc_core_int_l & pec_core_int_l));
//############################################################################
//		     COMBINATIONAL LOGIC FOR IMU ERRORS
//############################################################################   



//-----------------------------------------------------
// Determine if the Detected Error needs to be logged 
//
//	- Take Error Signal and AND with Log Enable 
//------------------------------------------------------

//---------------------------
//  Tie off Spare 
//---------------------------

//---------------------------------------------------------
//  Tie Off spare Errors
//
// Makingthem a Flop so the error logic doesn't get optimized out
//
// Also leaving reset in so can possibly use these as spare flops later
//----------------------------------------------------------

always @(posedge clk) 
  begin
    if (!rst_l)
      spare_error <= 5'b0;
    else 
      spare_error <= 5'b0;
   end
assign log_spare_error[0]   		= spare_error[0]           		& spare_error_log_en[0]; 
assign log_spare_error[1]   		= spare_error[1]           		& spare_error_log_en[1]; 
assign log_spare_error[2]   		= spare_error[2]           		& spare_error_log_en[2]; 
assign log_spare_error[3]   		= spare_error[3]           		& spare_error_log_en[3]; 
assign log_spare_error[4]   		= spare_error[4]           		& spare_error_log_en[4]; 
assign log_eq_over_error    		= eqs2ics_eq_over_error    		& eq_over_error_log_en; 
assign log_eq_not_en_error  		= scs2ics_eq_not_en_error  		& eq_not_en_error_log_en; 
assign log_msi_mal_error    		= rds2ics_msi_mal_error    		& msi_mal_error_log_en; 
assign log_msi_par_error    		= rds2ics_msi_par_error    		& msi_par_error_log_en; 
assign log_pmeack_mes_not_en_error	= rds2ics_pmeack_mes_not_en_error	& pmeack_mes_not_en_error_log_en;
assign log_pmpme_mes_not_en_error	= rds2ics_pmpme_mes_not_en_error	& pmpme_mes_not_en_error_log_en;
assign log_fatal_mes_not_en_error	= rds2ics_fatal_mes_not_en_error	& fatal_mes_not_en_error_log_en;
assign log_nonfatal_mes_not_en_error	= rds2ics_nonfatal_mes_not_en_error	& nonfatal_mes_not_en_error_log_en;
assign log_cor_mes_not_en_error		= rds2ics_cor_mes_not_en_error		& cor_mes_not_en_error_log_en;     
assign log_msi_not_en_error 		= rds2ics_msi_not_en_error 		& msi_not_en_error_log_en; 


//------------------------------------------------------
// Grouping the four errors from rds into one group 
//------------------------------------------------------

//-----------
// RDS
//-----------
assign rds_group_p_error_set    = logged_p_spare_reg[0]   		|
				  logged_p_spare_reg[1]   		|
				  logged_p_msi_mal_reg    		| 
				  logged_p_msi_par_reg    		| 
				  logged_p_pmeack_mes_not_en_reg	|
				  logged_p_pmpme_mes_not_en_reg		|
				  logged_p_fatal_mes_not_en_reg		|
				  logged_p_nonfatal_mes_not_en_reg	|
				  logged_p_cor_mes_not_en_reg		|
				  logged_p_msi_not_en_reg; 

assign load_rds_logging_reg     = ~rds_group_p_error_set; 


//----------
// SCS
//----------

assign scs_group_p_error_set    = logged_p_spare_reg[2]   		|
				  logged_p_eq_not_en_reg;

assign load_scs_logging_reg     = ~logged_p_eq_not_en_reg; 

//----------
// SCS
//----------

assign eqs_group_p_error_set    = logged_p_spare_reg[3]   		|
				  logged_p_eq_over_reg;

assign load_eqs_logging_reg     = ~logged_p_eq_over_reg; 
				  
//-----------------------------------------------------
// Determine if the Primary Error Needs to be loaded 
//  for Logged Error Status Register  
//
//  - Since we are using a set register always set the 
//    the primary bit on error detection
//	
//	- log_*****_error 
//
//------------------------------------------------------
assign set_p_logged_spare[0]    	= log_spare_error[0]    	& ~rds_group_p_error_set; 
assign set_p_logged_spare[1]    	= log_spare_error[1]    	& ~rds_group_p_error_set; 

assign set_p_logged_spare[2]    	= log_spare_error[2]		& ~scs_group_p_error_set; 
assign set_p_logged_spare[3]    	= log_spare_error[3]		& ~eqs_group_p_error_set; 
assign set_p_logged_spare[4]    	= log_spare_error[4]; 

assign set_p_logged_eq_over		= log_eq_over_error		& ~eqs_group_p_error_set;
assign set_p_logged_eq_not_en		= log_eq_not_en_error		& ~scs_group_p_error_set;

assign set_p_logged_msi_mal		= log_msi_mal_error		& ~rds_group_p_error_set;
assign set_p_logged_msi_par		= log_msi_par_error		& ~rds_group_p_error_set;
assign set_p_logged_pmeack_mes_not_en	= log_pmeack_mes_not_en_error	& ~rds_group_p_error_set;
assign set_p_logged_pmpme_mes_not_en	= log_pmpme_mes_not_en_error	& ~rds_group_p_error_set;
assign set_p_logged_fatal_mes_not_en	= log_fatal_mes_not_en_error	& ~rds_group_p_error_set;
assign set_p_logged_nonfatal_mes_not_en	= log_nonfatal_mes_not_en_error	& ~rds_group_p_error_set;
assign set_p_logged_cor_mes_not_en	= log_cor_mes_not_en_error	& ~rds_group_p_error_set;
assign set_p_logged_msi_not_en		= log_msi_not_en_error		& ~rds_group_p_error_set;


//-----------------------------------------------------
// Determine if the Secondary Error Needs to be loaded  
//  for Logged Error Status Register  
//
//  - Since we are using a set register always set the 
//    the secondary bit on error detection only if
//    first is already set. 
//
//
//	- log_*****_error  &   p_logged_*****
//
//------------------------------------------------------

assign set_s_logged_spare[0]    	= log_spare_error[0]    	&  rds_group_p_error_set; 
assign set_s_logged_spare[1]    	= log_spare_error[1]    	&  rds_group_p_error_set; 

assign set_s_logged_spare[2]    	= log_spare_error[2]    	&  scs_group_p_error_set; 
assign set_s_logged_spare[3]    	= log_spare_error[3]    	&  eqs_group_p_error_set; 
assign set_s_logged_spare[4]    	= log_spare_error[4]    	&  logged_p_spare_reg[4]; 

assign set_s_logged_eq_over		= log_eq_over_error		&  eqs_group_p_error_set;
assign set_s_logged_eq_not_en		= log_eq_not_en_error		&  scs_group_p_error_set;

assign set_s_logged_msi_mal		= log_msi_mal_error		&  rds_group_p_error_set;
assign set_s_logged_msi_par		= log_msi_par_error		&  rds_group_p_error_set;
assign set_s_logged_pmeack_mes_not_en	= log_pmeack_mes_not_en_error	&  rds_group_p_error_set;
assign set_s_logged_pmpme_mes_not_en	= log_pmpme_mes_not_en_error	&  rds_group_p_error_set;
assign set_s_logged_fatal_mes_not_en	= log_fatal_mes_not_en_error	&  rds_group_p_error_set;
assign set_s_logged_nonfatal_mes_not_en	= log_nonfatal_mes_not_en_error	&  rds_group_p_error_set;
assign set_s_logged_cor_mes_not_en	= log_cor_mes_not_en_error	&  rds_group_p_error_set;
assign set_s_logged_msi_not_en		= log_msi_not_en_error		&  rds_group_p_error_set;


//-----------------------------------------------------
// Determine if the Primary Error Needs to be loaded 
//  for Enabled Error Status Register  
//
//  - Since we are using a set register always set the 
//    the primary bit on error detection
//	
//	- loggged_p_*****_reg  & ****_p_int_en 
//
//------------------------------------------------------

assign enabled_p_spare[0]       	= logged_p_spare_reg[0]    	   &  spare_error_p_int_en[0] ; 
assign enabled_p_spare[1]       	= logged_p_spare_reg[1]    	   &  spare_error_p_int_en[1] ; 
assign enabled_p_spare[2]       	= logged_p_spare_reg[2]    	   &  spare_error_p_int_en[2] ; 
assign enabled_p_spare[3]       	= logged_p_spare_reg[3]    	   &  spare_error_p_int_en[3] ; 
assign enabled_p_spare[4]       	= logged_p_spare_reg[4]    	   &  spare_error_p_int_en[4] ; 

assign enabled_p_eq_over		= logged_p_eq_over_reg	   	   &  eq_over_error_p_int_en;
assign enabled_p_eq_not_en		= logged_p_eq_not_en_reg   	   &  eq_not_en_error_p_int_en;
assign enabled_p_msi_mal		= logged_p_msi_mal_reg	   	   &  msi_mal_error_p_int_en;
assign enabled_p_msi_par		= logged_p_msi_par_reg	   	   &  msi_par_error_p_int_en; 
assign enabled_p_pmeack_mes_not_en	= logged_p_pmeack_mes_not_en_reg   &  pmeack_mes_not_en_error_p_int_en;
assign enabled_p_pmpme_mes_not_en	= logged_p_pmpme_mes_not_en_reg	   &  pmpme_mes_not_en_error_p_int_en;
assign enabled_p_fatal_mes_not_en	= logged_p_fatal_mes_not_en_reg	   &  fatal_mes_not_en_error_p_int_en;
assign enabled_p_nonfatal_mes_not_en	= logged_p_nonfatal_mes_not_en_reg &  nonfatal_mes_not_en_error_p_int_en;
assign enabled_p_cor_mes_not_en		= logged_p_cor_mes_not_en_reg      &  cor_mes_not_en_error_p_int_en;        
assign enabled_p_msi_not_en		= logged_p_msi_not_en_reg  	   &  msi_not_en_error_p_int_en;

 

//-----------------------------------------------------
// Determine if the Seconday Error Needs to be loaded 
//  for Enabled Error Status Register  
//
//  - Since we are using a set register always set the 
//    the primary bit on error detection
//	
//	- loggged_p_*****_reg  & ****_p_int_en 
//
//------------------------------------------------------

assign enabled_s_spare[0]       	= logged_s_spare_reg[0]       	   &  spare_error_s_int_en[0] ; 
assign enabled_s_spare[1]       	= logged_s_spare_reg[1]    	   &  spare_error_s_int_en[1] ; 
assign enabled_s_spare[2]       	= logged_s_spare_reg[2]    	   &  spare_error_s_int_en[2] ; 
assign enabled_s_spare[3]       	= logged_s_spare_reg[3]    	   &  spare_error_s_int_en[3] ; 
assign enabled_s_spare[4]       	= logged_s_spare_reg[4]    	   &  spare_error_s_int_en[4] ; 

assign enabled_s_eq_over		= logged_s_eq_over_reg	   	   &  eq_over_error_s_int_en;
assign enabled_s_eq_not_en		= logged_s_eq_not_en_reg   	   &  eq_not_en_error_s_int_en;
assign enabled_s_msi_mal		= logged_s_msi_mal_reg	   	   &  msi_mal_error_s_int_en;
assign enabled_s_msi_par		= logged_s_msi_par_reg	   	   &  msi_par_error_s_int_en; 
assign enabled_s_pmeack_mes_not_en	= logged_s_pmeack_mes_not_en_reg   &  pmeack_mes_not_en_error_s_int_en;
assign enabled_s_pmpme_mes_not_en	= logged_s_pmpme_mes_not_en_reg	   &  pmpme_mes_not_en_error_s_int_en;
assign enabled_s_fatal_mes_not_en	= logged_s_fatal_mes_not_en_reg	   &  fatal_mes_not_en_error_s_int_en;
assign enabled_s_nonfatal_mes_not_en	= logged_s_nonfatal_mes_not_en_reg &  nonfatal_mes_not_en_error_s_int_en;
assign enabled_s_cor_mes_not_en		= logged_s_cor_mes_not_en_reg      &  cor_mes_not_en_error_s_int_en;        
assign enabled_s_msi_not_en		= logged_s_msi_not_en_reg  	   &  msi_not_en_error_s_int_en;
	
//----------------------------------------------------------------------------
// Performance Counters
//----------------------------------------------------------------------------
  assign inc_cnt0 = prf0_cnt_hw_read + 1;
  assign inc_cnt1 = prf1_cnt_hw_read + 1;

  always @ (prfc_sel0_hw_read or prfc_sel1_hw_read) begin
    prf_sel[0] = prfc_sel0_hw_read;
    prf_sel[1] = prfc_sel1_hw_read;
  end

  always @ (prf_sel[0] or prf_sel[1] or ors2ics_perf_mondos or ors2ics_perf_msi or 
  	    rss2ics_perf_mondo_nacks or ors2ics_perf_eq_wr or ors2ics_perf_eq_mondos) 
  
   begin
    for (i = 0; i < 2; i = i + 1) begin
      case (prf_sel[i]) // synopsys infer_mux
	8'h00 : prf_inc[i] = 1'b0;
	8'h01 : prf_inc[i] = 1'b1;
	8'h02 : prf_inc[i] = ors2ics_perf_mondos;
	8'h03 : prf_inc[i] = ors2ics_perf_msi;
	8'h04 : prf_inc[i] = rss2ics_perf_mondo_nacks;
	8'h05 : prf_inc[i] = ors2ics_perf_eq_wr;
	8'h06 : prf_inc[i] = ors2ics_perf_eq_mondos;
	8'h07 : prf_inc[i] = 0;
	8'h08 : prf_inc[i] = 0;
	8'h09 : prf_inc[i] = 0;
	8'h0a : prf_inc[i] = 0;
		
	default : prf_inc[i] = 1'b0;
      endcase
    end
  end

  assign prf0_cnt_hw_write = prf_inc[0] ? inc_cnt0 : prf0_cnt_hw_read;
  assign prf1_cnt_hw_write = prf_inc[1] ? inc_cnt1 : prf1_cnt_hw_read;
 

//-----------------------------------------------------
//  Spare Control and Status Registers for ECO's       
//  
//-----------------------------------------------------

always @ (posedge clk)
     begin 
        if (!rst_l ) begin
         spare_control_load_reg <= 8'b0;
         spare_control_reg      <= 8'b0;
         spare_status_reg <= 8'b0;
        end
        else begin
  	spare_control_load_reg <= spare_control_load; 
 	spare_control_reg <= spare_control; 
  	spare_status_reg[7:2] <= spare_status[7:2]; 
  	spare_status_reg[1:0] <= 2'b0; 
     end
     end
   
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    

//---------------------------------
//  DCM Instanciation 
//----------------------------------

 dmu_imu_ics_csr csr (
	.clk						(clk),
	.csrbus_addr					(csrbus_addr),
	.csrbus_wr_data					(csrbus_wr_data),
	.csrbus_wr					(csrbus_wr),
	.csrbus_valid					(csrbus_valid),
	.csrbus_mapped					(csrbus_mapped),
	.csrbus_done					(csrbus_done),
	.csrbus_read_data				(csrbus_read_data),
	.por_l						(por_l),
	.rst_l						(rst_l),

	.csrbus_src_bus					(csrbus_src_bus),
	.csrbus_acc_vio					(csrbus_acc_vio),
	.instance_id					(j2d_instance_id),

//	.multi_core_error_status_reg_pec_ext_read_data	(pec_core_int),
//	.multi_core_error_status_reg_dmc_ext_read_data	(dmc_core_int),
	
	
	// HW READ ONLY PORT of LOG Enable Registers 
	.imu_error_log_en_reg_spare_log_en_hw_read(spare_error_log_en),
	.imu_error_log_en_reg_eq_over_log_en_hw_read(eq_over_error_log_en),
	.imu_error_log_en_reg_eq_not_en_log_en_hw_read(eq_not_en_error_log_en),
	.imu_error_log_en_reg_msi_mal_err_log_en_hw_read(msi_mal_error_log_en),
	.imu_error_log_en_reg_msi_par_err_log_en_hw_read(msi_par_error_log_en),
	.imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read(pmeack_mes_not_en_error_log_en),
	.imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read(pmpme_mes_not_en_error_log_en),
	.imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read(fatal_mes_not_en_error_log_en),
	.imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read(nonfatal_mes_not_en_error_log_en),
	.imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read(cor_mes_not_en_error_log_en),	
	.imu_error_log_en_reg_msi_not_en_log_en_hw_read(msi_not_en_error_log_en),
	
	// HW READ ONLY PORT of INT Enable regs (Secondary)
	.imu_int_en_reg_spare_s_int_en_hw_read(spare_error_s_int_en),
	.imu_int_en_reg_eq_over_s_int_en_hw_read(eq_over_error_s_int_en),
	.imu_int_en_reg_eq_not_en_s_int_en_hw_read(eq_not_en_error_s_int_en),
	.imu_int_en_reg_msi_mal_err_s_int_en_hw_read(msi_mal_error_s_int_en),
	.imu_int_en_reg_msi_par_err_s_int_en_hw_read(msi_par_error_s_int_en),
	.imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read(pmeack_mes_not_en_error_s_int_en),
	.imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read(pmpme_mes_not_en_error_s_int_en),
	.imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read(fatal_mes_not_en_error_s_int_en),
	.imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read(nonfatal_mes_not_en_error_s_int_en),
	.imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read(cor_mes_not_en_error_s_int_en),
	.imu_int_en_reg_msi_not_en_s_int_en_hw_read(msi_not_en_error_s_int_en),
		
		
	// HW READ ONLY PORT of INT Enable regs (Primary)
	
	.imu_int_en_reg_spare_p_int_en_hw_read(spare_error_p_int_en),	
	.imu_int_en_reg_eq_over_p_int_en_hw_read(eq_over_error_p_int_en),
	.imu_int_en_reg_eq_not_en_p_int_en_hw_read(eq_not_en_error_p_int_en),
	.imu_int_en_reg_msi_mal_err_p_int_en_hw_read(msi_mal_error_p_int_en),
	.imu_int_en_reg_msi_par_err_p_int_en_hw_read(msi_par_error_p_int_en),
	.imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read(pmeack_mes_not_en_error_p_int_en),
	.imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read(pmpme_mes_not_en_error_p_int_en),
	.imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read(fatal_mes_not_en_error_p_int_en),
	.imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read(nonfatal_mes_not_en_error_p_int_en),
	.imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read(cor_mes_not_en_error_p_int_en),
	.imu_int_en_reg_msi_not_en_p_int_en_hw_read(msi_not_en_error_p_int_en),
	
	// HW READ PORT of Enabled Error Status regs (Secondary)
	
	.imu_enabled_error_status_reg_spare_s_ext_read_data(enabled_s_spare),
	.imu_enabled_error_status_reg_eq_over_s_ext_read_data(enabled_s_eq_over),
	.imu_enabled_error_status_reg_eq_not_en_s_ext_read_data(enabled_s_eq_not_en),
	.imu_enabled_error_status_reg_msi_mal_err_s_ext_read_data(enabled_s_msi_mal),
	.imu_enabled_error_status_reg_msi_par_err_s_ext_read_data(enabled_s_msi_par),
	.imu_enabled_error_status_reg_pmeack_mes_not_en_s_ext_read_data(enabled_s_pmeack_mes_not_en),
	.imu_enabled_error_status_reg_pmpme_mes_not_en_s_ext_read_data(enabled_s_pmpme_mes_not_en),
	.imu_enabled_error_status_reg_fatal_mes_not_en_s_ext_read_data(enabled_s_fatal_mes_not_en),
	.imu_enabled_error_status_reg_nonfatal_mes_not_en_s_ext_read_data(enabled_s_nonfatal_mes_not_en),
	.imu_enabled_error_status_reg_cor_mes_not_en_s_ext_read_data(enabled_s_cor_mes_not_en),	
	.imu_enabled_error_status_reg_msi_not_en_s_ext_read_data(enabled_s_msi_not_en),
	
	
	// HW READ PORT of Enabled Error Status regs (Primary)
	.imu_enabled_error_status_reg_spare_p_ext_read_data(enabled_p_spare),
	.imu_enabled_error_status_reg_eq_over_p_ext_read_data(enabled_p_eq_over),
	.imu_enabled_error_status_reg_eq_not_en_p_ext_read_data(enabled_p_eq_not_en),
	.imu_enabled_error_status_reg_msi_mal_err_p_ext_read_data(enabled_p_msi_mal),
	.imu_enabled_error_status_reg_msi_par_err_p_ext_read_data(enabled_p_msi_par),
	.imu_enabled_error_status_reg_pmeack_mes_not_en_p_ext_read_data(enabled_p_pmeack_mes_not_en),
	.imu_enabled_error_status_reg_pmpme_mes_not_en_p_ext_read_data(enabled_p_pmpme_mes_not_en),
	.imu_enabled_error_status_reg_fatal_mes_not_en_p_ext_read_data(enabled_p_fatal_mes_not_en),
	.imu_enabled_error_status_reg_nonfatal_mes_not_en_p_ext_read_data(enabled_p_nonfatal_mes_not_en),
	.imu_enabled_error_status_reg_cor_mes_not_en_p_ext_read_data(enabled_p_cor_mes_not_en),		
	.imu_enabled_error_status_reg_msi_not_en_p_ext_read_data(enabled_p_msi_not_en),

	// READ and SET Ports of the Logged Error Status regs (Secondary)
	.imu_logged_error_status_reg_spare_s_hw_set(set_s_logged_spare),
	.imu_logged_error_status_reg_spare_s_hw_read(logged_s_spare_reg),
	
	.imu_logged_error_status_reg_eq_over_s_hw_set(set_s_logged_eq_over),
	.imu_logged_error_status_reg_eq_over_s_hw_read(logged_s_eq_over_reg),
	
	.imu_logged_error_status_reg_eq_not_en_s_hw_set(set_s_logged_eq_not_en),
	.imu_logged_error_status_reg_eq_not_en_s_hw_read(logged_s_eq_not_en_reg),
	
	.imu_logged_error_status_reg_msi_mal_err_s_hw_set(set_s_logged_msi_mal),
	.imu_logged_error_status_reg_msi_mal_err_s_hw_read(logged_s_msi_mal_reg),
	
	.imu_logged_error_status_reg_msi_par_err_s_hw_set(set_s_logged_msi_par),
	.imu_logged_error_status_reg_msi_par_err_s_hw_read(logged_s_msi_par_reg),
	
	.imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set(set_s_logged_pmeack_mes_not_en),
	.imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read(logged_s_pmeack_mes_not_en_reg),
	
	.imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set(set_s_logged_pmpme_mes_not_en),
	.imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read(logged_s_pmpme_mes_not_en_reg),
	
	.imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set(set_s_logged_fatal_mes_not_en),
	.imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read(logged_s_fatal_mes_not_en_reg),
	
	.imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set(set_s_logged_nonfatal_mes_not_en),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read(logged_s_nonfatal_mes_not_en_reg),
	
	.imu_logged_error_status_reg_cor_mes_not_en_s_hw_set(set_s_logged_cor_mes_not_en),
	.imu_logged_error_status_reg_cor_mes_not_en_s_hw_read(logged_s_cor_mes_not_en_reg),
		
	.imu_logged_error_status_reg_msi_not_en_s_hw_set(set_s_logged_msi_not_en),
	.imu_logged_error_status_reg_msi_not_en_s_hw_read(logged_s_msi_not_en_reg),
	

	// READ and SET Ports of the Logged Error Status regs (Primary)

	.imu_logged_error_status_reg_spare_p_hw_set(set_p_logged_spare),
	.imu_logged_error_status_reg_spare_p_hw_read(logged_p_spare_reg),
	
	.imu_logged_error_status_reg_eq_over_p_hw_set(set_p_logged_eq_over),
	.imu_logged_error_status_reg_eq_over_p_hw_read(logged_p_eq_over_reg),
	
	.imu_logged_error_status_reg_eq_not_en_p_hw_set(set_p_logged_eq_not_en),
	.imu_logged_error_status_reg_eq_not_en_p_hw_read(logged_p_eq_not_en_reg),
	
	.imu_logged_error_status_reg_msi_mal_err_p_hw_set(set_p_logged_msi_mal),
	.imu_logged_error_status_reg_msi_mal_err_p_hw_read(logged_p_msi_mal_reg),
	
	.imu_logged_error_status_reg_msi_par_err_p_hw_set(set_p_logged_msi_par),
	.imu_logged_error_status_reg_msi_par_err_p_hw_read(logged_p_msi_par_reg),
	
	.imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set(set_p_logged_pmeack_mes_not_en),
	.imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read(logged_p_pmeack_mes_not_en_reg),
	
	.imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set(set_p_logged_pmpme_mes_not_en),
	.imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read(logged_p_pmpme_mes_not_en_reg),
	
	.imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set(set_p_logged_fatal_mes_not_en),
	.imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read(logged_p_fatal_mes_not_en_reg),
	
	.imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set(set_p_logged_nonfatal_mes_not_en),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read(logged_p_nonfatal_mes_not_en_reg),
	
	.imu_logged_error_status_reg_cor_mes_not_en_p_hw_set(set_p_logged_cor_mes_not_en),
	.imu_logged_error_status_reg_cor_mes_not_en_p_hw_read(logged_p_cor_mes_not_en_reg),	
	
	.imu_logged_error_status_reg_msi_not_en_p_hw_set(set_p_logged_msi_not_en),
	.imu_logged_error_status_reg_msi_not_en_p_hw_read(logged_p_msi_not_en_reg),
	
	.imu_rds_error_log_reg_hw_ld(load_rds_logging_reg),
	.imu_rds_error_log_reg_hw_write(rds2ics_error_data),
	
	.imu_scs_error_log_reg_hw_ld(load_scs_logging_reg),
	.imu_scs_error_log_reg_hw_write(scs2ics_error_data),
	
	.imu_eqs_error_log_reg_hw_ld(load_eqs_logging_reg),
	.imu_eqs_error_log_reg_hw_write(eqs2ics_error_data),
	
	.dmc_interrupt_mask_reg_dmc_hw_read		(dmc_mask),
	.dmc_interrupt_mask_reg_debug_trig_en_hw_read	(debug_trig_en),
	.dmc_interrupt_mask_reg_mmu_hw_read		(mmu_mask),
	.dmc_interrupt_mask_reg_imu_hw_read		(imu_mask),
	.dmc_interrupt_status_reg_mmu_ext_read_data	(mmu_block_int),
	.dmc_interrupt_status_reg_imu_ext_read_data	(imu_block_int),
	.imu_perf_cntrl_sel1_hw_read			(prfc_sel1_hw_read),
	.imu_perf_cntrl_sel0_hw_read			(prfc_sel0_hw_read),
	.imu_perf_cnt0_cnt_hw_write			(prf0_cnt_hw_write),
	.imu_perf_cnt0_cnt_hw_read			(prf0_cnt_hw_read),
	.imu_perf_cnt1_cnt_hw_write			(prf1_cnt_hw_write),
	.imu_perf_cnt1_cnt_hw_read			(prf1_cnt_hw_read),
	.msi_32_addr_reg_addr_hw_read			(im2tm_msi32_addr_reg),
	.msi_64_addr_reg_addr_hw_read			(im2tm_msi64_addr_reg),
	.mem_64_pcie_offset_reg_addr_hw_read		(im2rm_mem64_offset_reg),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_ld(spare_status_reg[7]),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_write(spare_control_load_reg[7]),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_read(spare_control_load[7]),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_ld(spare_status_reg[6]),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_write(spare_control_load_reg[6]),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_read(spare_control_load[6]),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_ld(spare_status_reg[5]),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_write(spare_control_load_reg[5]),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_read(spare_control_load[5]),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_ld(spare_status_reg[4]),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_write(spare_control_load_reg[4]),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_read(spare_control_load[4]),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_ld(spare_status_reg[3]),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_write(spare_control_load_reg[3]),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_read(spare_control_load[3]),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_ld(spare_status_reg[2]),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_write(spare_control_load_reg[2]),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_read(spare_control_load[2]),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_ld(spare_status_reg[1]),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_write(spare_control_load_reg[1]),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_read(spare_control_load[1]),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_ld(spare_status_reg[0]),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_write(spare_control_load_reg[0]),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_read(spare_control_load[0]),
	.mem_64_pcie_offset_reg_spare_control_hw_write(spare_control_reg),
	.mem_64_pcie_offset_reg_spare_control_hw_read(spare_control),
	.mem_64_pcie_offset_reg_spare_status_hw_read(spare_status)
	);


//BP n2 12-19-05 use 2 of the spare bits in the above register , these control
//      2 different solutions to the lockup issue, see bug 107207, ie. since the
//      egress pipe merges the dma rd completions and pio requests into the cr2rm fifo
//      there could be cases where the pio's back up and stall the dma rd's from completing
//      these 2 bits control 2 different solutions for the same thing, but since we are
//      close to freezing we are putting both in, just in case, they can both be disabled
//      or enabled
assign  im2crm_bc_stall_en      = spare_status[0];   // stall statemachine enable
assign  im2crm_ilu_stall_en     = spare_status[1];   // stall statemachine enable from ilu



endmodule





