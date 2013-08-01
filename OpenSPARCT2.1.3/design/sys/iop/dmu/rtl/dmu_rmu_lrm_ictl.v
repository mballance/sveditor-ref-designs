// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_lrm_ictl.v
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
module dmu_rmu_lrm_ictl (
				
			clk,
			rst_l,
		
			// TMU Interface (DIM) - DIM Record
			tm2rm_rcd,
			tm2rm_rcd_enq,
			rm2tm_rcd_full,

			// Inputs from IMU - Mondo Request Record
  			im2rm_mdo,
  			im2rm_mdo_enq,

			// Outputs to IMU - Interrupt In Record (RRM to IMU)
  			rm2im_rcd,
  			rm2im_rcd_enq,

			// LRM Sub-block Interface to Ingress TSB FSM - STD rcd
  			std_rcd,	
  			std_rcd_enq,
  			std_rcd_deq,

			// Input from IMU - used to flow control IIN rcds
			iot_rcd_deq,

			// Output to RMU - PIO WR Release
			lrm2rrm_cpl,
			lrm2rrm_cpl_enq,

			// Output (local) for Debug Visibility
			fork_type,
			sr_dim_deq,
			sr_dim_empty,
			iot_credit_ok,
			ld_iin_mdo_reg,
			mdo_fifo_empty,
			std_credit_ok

			);
		
// synopsys sync_set_reset "rst_l"		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 		clk;
  input			rst_l; 


  //------------------------------------------------------------------------
  //  TMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - 123 bit DIM RECORD (DIM to LRM)
  input	 [`FIRE_DLC_DIM_REC_WDTH-1:0]	tm2rm_rcd;
  input 				tm2rm_rcd_enq;
  output				rm2tm_rcd_full;

  //------------------------------------------------------------------------
  //  IMU Interface
  //------------------------------------------------------------------------

  // Mondo Requests from IMU - 15 bit Mondo ReQuest Record (IMU to LRM)
  input	 [`FIRE_DLC_MQR_REC_WDTH-1:0]	im2rm_mdo;		
  input					im2rm_mdo_enq;

  // Interrupt In Record - 131 bit IIN Record (LRM to IMU)
  output [`FIRE_DLC_IIN_REC_WDTH-1:0]	rm2im_rcd;		
  output				rm2im_rcd_enq;

  
  //------------------------------------------------------------------------
  //  Internal LRM Interface to LRM Output Ingress TSB FSM Module
  //------------------------------------------------------------------------

  // Standard Records that are being sent up Ingress Pipeline - includes lrmtag 
  output [`FIRE_DLC_RMU_LRM_WDTH-1:0]	std_rcd;		// 131 bit Std Rcd 
  output				std_rcd_enq;		// Std Rcd FIFO Enqueue
  input					std_rcd_deq;		// SR STD rcd Dequeue 

  input					iot_rcd_deq;		// Dequeue Intr Out Rcd input

  //------------------------------------------------------------------------
  //  Sub-Block Interface to RRM
  //------------------------------------------------------------------------

  // PIO Transaction Credit Recorda - 4 bits

  output  [`FIRE_DLC_RMU_LRM_REL_WDTH-1:0]	lrm2rrm_cpl;
  output					lrm2rrm_cpl_enq;

  
  //------------------------------------------------------------------------
  //  Outputs for Debug Port Visibility
  //------------------------------------------------------------------------

  output  [1:0]				fork_type;		// Ingress Trans Type Decoder
  output				sr_dim_deq;		// Dequeue DIM record from SR FIFO
  output				sr_dim_empty;		// Output from DIM SR FIFO
  output				iot_credit_ok;		// LRM has credit for IOT Rcds
  output				ld_iin_mdo_reg;		// Load IIN rcd from Mondo FIFO  
  output				mdo_fifo_empty;		// Output from Mondo ReQuest FIFO
  output				std_credit_ok;		// Std Rcd FIFO has room


  
//############################################################################
//				PARAMETERS
//############################################################################

  // Ingress Transaction Type Decoder - either continue up INGRESS or Fork to IMU
  parameter 		
  	FORK_INGRESS =	2'b00,		// DMA or (Posted) PIO header - continue up Ingress Pipeline	
 	FORK_IMU     =	2'b01,		// MSG or MSI Type - fork to IMU for Servicing
	FORK_RMU     =  2'b10,		// Non Posted PIO Wr Completion
	UNKNOWN_TYPE =  2'b11;		// For zero in

  // Ingress Command Type Decoder Parameter 

  parameter
 	DMA_MRD32   = 	7'b0000000,
        DMA_MRD64   = 	7'b0100000,
        DMA_MRDLK32 = 	7'b0000001,
        DMA_MRDLK64 = 	7'b0100001,
        DMA_MWR32   = 	7'b1000000,
        DMA_MWR64   = 	7'b1100000,
        PIO_CPL     = 	7'b0001010,
        PIO_CPLD    = 	7'b1001010,
        DMA_UR      = 	7'b0001001,
        MSG    	    = 	7'b0110zzz,
	MSI_32	    =	7'b1011000,	// Need to find out more info wrt MSI's
	MSI_64	    =	7'b1111000,
	MONDO	    =	7'b1111010;	// Identifies MONDO type out from LRM sub-block

  
  // Ingress LRM SR FIFO (DIM Records) DEPTH and WIDTH Parameters

  parameter
  	DIM_SR_DEPTH =	6,				// 6 Entry FIFO per MAS 2.0 spec
	DIM_SR_WIDTH =	`FIRE_DLC_DIM_REC_WDTH;		// DIM record currently 123 bits wide

  //-------------------------------------------------------------------------------------------
  // Parameters to be passed into Common Simple FIFO
  //    MDO_WDTH                =       `FIRE_DLC_MQR_REC_WDTH  = 14 bit Mondo Request from IMU
  //    MDO_DPTH                =       3'd4                    = Max sized to 4 Mondo's
  //    MDO_PTR_WDTH            =       2                       = 
  //    MDO_DPTH_MINUSONE       =       2'd3                    = Depth-1
  //-------------------------------------------------------------------------------------------
  
  parameter
  	MDO_WDTH		= 	`FIRE_DLC_MQR_REC_WDTH,
	MDO_DPTH                =       3'd4,
	MDO_PTR_WDTH            =       2,
	MDO_DPTH_MINUSONE       =       2'd3;
 

//############################################################################
//		DECLARE Module Wires and Registers
//############################################################################

  wire	[`FIRE_DLC_RMU_LRM_WDTH-1:0]	std_rcd;		// DIM record + lrmtag Std SR FIFO
								// 123+8 = 131 bit Record

  wire	mdo_fifo_empty;						// Output from Mondo ReQuest FIFO
  wire	sr_dim_empty;						// Output from DIM SR FIFO

  //--------------------------------------------------
  // Internal Sub-Block Wires 
  //--------------------------------------------------

  // Ingress DIM Record fields out of the SR fifo - 70 bit ERR record

  wire	[`FIRE_DLC_DIM_REC_WDTH-1:0]	sr_dim_dout;		// Entire 123 bit DIM Record
  wire	[`FIRE_DLC_DIM_TYPE_WDTH-1:0]	sr_dim_type;		// 7 bit Type Field
  wire					sr_dim_piowr;		// decoded bit that signifies NonPosted
								// PIO Wr completion - to be forked to RMU
  
  wire	[`FIRE_DLC_DIM_REC_WDTH-1:0]	next_iin_reg;		// Int In Rcd Generation - less lrm tag

  wire	[`FIRE_DLC_MQR_REC_WDTH-1:0]	mdo_fifo_dout;		// 15 bit Mondo Req Rcd out of FIFO

  wire	ld_iin_rcd;						// Load Enable for IIN record
  wire	mdo_fifo_deq;						// Dequeue signal to Mondo Simple FIFO
  wire	iot_credit_ok;						// LRM has credit for IOT Rcds
  wire	std_credit_ok;						// Std Rcd FIFO has room

  wire	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	next_lrmtag;		// TTAG for merge logic in Pipeline
  wire	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	lrmtag_plusone;		// Incremented version of TTAG
  
  wire	[`FIRE_DLC_RMU_LRM_REL_WDTH-1:0] sr_dim_piotag;		// 4 bit pio_tag taken from sr_dim_dout TAG
  

  //--------------------------------------------------
  // Registers that Are Not Flops 
  //--------------------------------------------------

  // Output from Combinatorial Decode of sr_dim_dout - type field from DIM record
  reg	[1:0]	fork_type;					// LRM Transaction Type Decoder

  // Combinatorial Outputs from Ingress Control Logic block
  reg		ld_iin_mdo_reg;					// Load IIN rcd from Mondo FIFO  
  reg		ld_iin_dim_reg;					// Load IIN rcd from DIM SR FIFO
  reg		ld_pio_cpl_reg;					// Load 4 bit PIO Tag to be Released 
  reg		incr_lrmtag;					// Increment LRM transmit tag
  reg		sr_dim_deq;					// Dequeue DIM record from SR FIFO
  reg		std_rcd_enq;					// Enqueue signal to STD Rcd FIFO


  //--------------------------------------------------
  // Registers that Are Flops 
  //--------------------------------------------------

  reg	[3:0]	iot_credit_count, next_iot_credit_count;	// IIN, IOT Rcd Credit Mechanism
  reg	[2:0]	std_credit_count, next_std_credit_count;	// STD Rcd Credit Mechanism
  
  reg	[`FIRE_DLC_DIM_REC_WDTH-1:0]	iin_reg;		// Interrupt In Record Generation
  reg					rm2im_rcd_enq;		// Enqueue signal to IMU for IIN Rcd

  reg	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	lrmtag;			// DIM Transmit Tag for Pipeline Merging
  reg	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	imu_lrmtag;		// IMU Transmit Tag for Pipeline Merging
								// mtag is a synchronized version of lrmtag
  reg	[`FIRE_DLC_RMU_LRM_REL_WDTH-1:0] lrm2rrm_cpl;		// PIOWR Completion (NP WR ack) to RRM
  reg					 lrm2rrm_cpl_enq;	// PIOWR Cpl Enqueue to	RRM


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
  // 0in maximum -var  	iot_credit_count  		-val    8

  // 0in maximum -var  	std_credit_count  		-val    5

  // 0in known_driven  -var fork_type	-active  ~sr_dim_empty	

  // 0in maximum -var	fork_type			-val 	2	

  // Intentional Redundant checks on fork_type - but wanted to ask if there is a 
  // benefit of using one type over another

  // Note: The following check triggered... values in dim_type = 0x36, 0x35, 0x34, 0x30 - test is eq_full_with_msg_twice
  /* zeroin val
     -var 	sr_dim_type
     -val 	DMA_MRD32
	  	DMA_MRD64
	  	DMA_MRDLK32
	  	DMA_MRDLK64
	  	DMA_MWR32
	  	DMA_MWR64
	  	PIO_CPL
	  	PIO_CPLD
	  	DMA_UR
	  	MSI_32
	  	MSI_64
	  	MSG
    -active 	~sr_dim_empty
    -message	"Illegal Type Field written into DIM Queue - LRM ictl module" 
  */

//############################################################################
//	    		COMBINATORIAL LOGIC
//############################################################################   

  //--------------------------------------------------------------------
  // Outgoing IIN Record to IMU, or Outgoing DIM Record to Std Rcd Queue
  //--------------------------------------------------------------------
  
  assign	rm2im_rcd = {	iin_reg,
				imu_lrmtag 		};

  assign	std_rcd	  = {   sr_dim_dout,
      				lrmtag		};

  // Want to make sure that identical tags are never seen... checker will be in lrm_octl module


  //----------------------------------------------------------------------
  // Signal that indicates that LRM has credit to hold IOT record from IMU
  //----------------------------------------------------------------------
		
  assign 	iot_credit_ok = |iot_credit_count;		// If Credit is 1-8, then OK!!
								// If Credit is 0 - NOT ok! IOT SR full

  assign 	std_credit_ok = |std_credit_count;		// If Credit is 1-5, then OK!!
								// If Credit is 0 - NOT ok! IOT SR full

  //------------------------------------------------------------------------------
  // DIM Record Type Field needed to determine whether IMU needs to service Record 
  //------------------------------------------------------------------------------

  assign 	sr_dim_type 	= sr_dim_dout[`FIRE_DLC_DIM_TYPE_MSB:`FIRE_DLC_DIM_TYPE_LSB];

  assign	sr_dim_piotag	= sr_dim_dout[`FIRE_DLC_DIM_TAG_LSB+3:`FIRE_DLC_DIM_TAG_LSB];
  assign	sr_dim_piowr	= sr_dim_dout[`FIRE_DLC_DIM_TAG_LSB+4];	// if 1 - PIOWR Cpl


  //----------------------------------------------------------
  // Ingress DIM Record Type Decode Logic - fork to IMU or SRM
  //----------------------------------------------------------


  always @ (sr_dim_type or sr_dim_piowr or sr_dim_empty)
    begin
      if (sr_dim_empty)
        fork_type = FORK_INGRESS;
    
      else 
	casez (sr_dim_type)         	// 0in < case -parallel -default
	    DMA_MRD32   : fork_type = FORK_INGRESS;	
	    DMA_MRD64   : fork_type = FORK_INGRESS;	
	    DMA_MRDLK32 : fork_type = FORK_INGRESS;	
	    DMA_MRDLK64 : fork_type = FORK_INGRESS;	
	    DMA_MWR32   : fork_type = FORK_INGRESS;	
	    DMA_MWR64   : fork_type = FORK_INGRESS;	
	    PIO_CPL     : fork_type = sr_dim_piowr ? FORK_RMU : FORK_INGRESS;	
	    PIO_CPLD    : fork_type = FORK_INGRESS;	
	    DMA_UR      : fork_type = FORK_INGRESS;	
	    MSI_32	: fork_type = FORK_IMU;	
	    MSI_64	: fork_type = FORK_IMU;	
	    MSG    	: fork_type = FORK_IMU;			// Using casez to match MSG type

	    // Zero In Check for INVALID decode if FIFO is not empty
	    default	: fork_type = UNKNOWN_TYPE;

	endcase
    end
  

  //----------------------------------------------------------------------------- 
  // LRM Ingress Control Logic - Controls both the Mondo FIFO and the DIM SR FIFO
  //----------------------------------------------------------------------------- 

  assign	mdo_fifo_deq = ld_iin_mdo_reg;		// explicit signal to Mondo simple_fifo


  always @ (mdo_fifo_empty or sr_dim_empty or iot_credit_ok or fork_type or std_credit_ok)

    begin
    	ld_iin_mdo_reg		= 1'b0;			// Saves some typing - Defaults for
	ld_iin_dim_reg		= 1'b0;			// when FIFO's are not empty
	ld_pio_cpl_reg		= 1'b0;
	incr_lrmtag		= 1'b0;
	sr_dim_deq		= 1'b0;
	std_rcd_enq		= 1'b0;

    	if (~mdo_fifo_empty & iot_credit_ok)		// Mondo FIFO has highest priority!
	    begin
	    	ld_iin_mdo_reg		= 1'b1;		// Deq's Mondo FIFO, assert next_rm2im_rcd_enq
		incr_lrmtag		= 1'b1;		// Increment lrmtag!	
	    end

	else if (~sr_dim_empty)				// SR FIFO has valid DIM record at output!
	    begin
	    	case (fork_type)	// 0in < case -full

		  FORK_INGRESS :
		    begin
		    	if (std_credit_ok)
    			    begin
		    	    	sr_dim_deq	 = 1'b1;	// Deq SR FIFO 
			    	std_rcd_enq	 = 1'b1;	// Enqueue DIM rcd to Std Rcd SR
			    	incr_lrmtag	 = 1'b1;	// Increment lrmtag!
			    end
			else
    			    begin
		    	    	sr_dim_deq	 = 1'b0;	// Std Rcd FIFO is full - hold up
			    	std_rcd_enq	 = 1'b0;	
			    	incr_lrmtag	 = 1'b0;	
			    end
		    end

  		  FORK_IMU :
		    begin
		    	if (iot_credit_ok)
    			    begin
		    		sr_dim_deq	   = 1'b1;	// Dequeue MSI or MSG from Rcd In FIFO 
				ld_iin_dim_reg	   = 1'b1;	// Load IIN rcd from DIM, assert next_rm2im_rcd_enq
				incr_lrmtag	   = 1'b1;	// Increment lrmtag
			    end
			else
			    begin
		    		sr_dim_deq	   = 1'b0;	// LRM IOT FIFO full - Wait for Credit
				ld_iin_dim_reg	   = 1'b0;	 
				incr_lrmtag	   = 1'b0;	
			    end
		    end
		  
		  FORK_RMU :					// Non Posted PIO Wr (Io/Config)
		    begin
		    	sr_dim_deq	= 1'b1;			// Dequeue DIM rcd and
			ld_pio_cpl_reg	= 1'b1;			// Ld CPL reg, Enq CPL rcd to RRM
		    end


		endcase		// ends fork_type case
	    end		// ends sr_dim_empty begin
	    
	    else						// Default values for when FIFO's are EMPTY
	    begin
    		ld_iin_mdo_reg		= 1'b0;		
		ld_iin_dim_reg		= 1'b0;
		ld_pio_cpl_reg		= 1'b0;
		incr_lrmtag		= 1'b0;
		sr_dim_deq		= 1'b0;
		std_rcd_enq		= 1'b0;
	    end

    end		// Ends Always Block for Ingress Control Logic	    		



//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
  //----------------------------------------------
  // LRM PIOWR Cpl (Release) Record generation
  //----------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	lrm2rrm_cpl	<=	{`FIRE_DLC_RMU_LRM_REL_WDTH{1'b0}};	
    else if (ld_pio_cpl_reg)
    	lrm2rrm_cpl	<=	sr_dim_piotag;			// 4 bit pio_tag to be released
    else
    	lrm2rrm_cpl	<=	lrm2rrm_cpl;

  // LRM PIOWR Cpl (Release) Record generation

  always @ (posedge clk)
    if (~rst_l)
	lrm2rrm_cpl_enq	<=	1'b0;	
    else
    	lrm2rrm_cpl_enq	<=	ld_pio_cpl_reg;			// next_lrm2rrm_cpl_enq = ld_pio_cpl_reg


  //-----------------------------------------------------
  // Interrupt In Record Generation - LESS 8 bit LRM lrmtag
  //-----------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	iin_reg	<=	{`FIRE_DLC_DIM_REC_WDTH{1'b0}};
    else if (ld_iin_rcd)				// IIN Load Enable = ld_iin_mdo | ld_in_dim
	iin_reg	<= 	next_iin_reg;		
    else
	iin_reg	<=	iin_reg;	

  // Interrupt In Record Enqueue Signal

  always @ (posedge clk)
    if (~rst_l)
	rm2im_rcd_enq	<=	1'b0;
    else
    	rm2im_rcd_enq	<=	ld_iin_rcd;		// next_rm2im_rcd_enq = ld_iin_rcd


  //-----------------------------------------------------------
  // For Readability - will define next IIN record fields here!
  //-----------------------------------------------------------

  // IIN register Load Enable Signal - spelled out for debug - Loading RRM from MDO or DIM record
  assign ld_iin_rcd	= ld_iin_mdo_reg | ld_iin_dim_reg;

  // IIN Record based on incoming MONDO from IMU - or MSI,MSG from TMU
  assign next_iin_reg	= ld_iin_mdo_reg ? 
  				      { MONDO,
					`FIRE_DLC_IIN_TC_WDTH'b0,
					`FIRE_DLC_IIN_ATR_WDTH'b0,
					`FIRE_DLC_IIN_LEN_WDTH'b0,
					1'b0, mdo_fifo_dout,
					`FIRE_DLC_IIN_TLPTAG_WDTH'b0,
					`FIRE_DLC_IIN_DATA_WDTH'b0,
					`FIRE_DLC_IIN_ADDR_WDTH'b0,
					`FIRE_DLC_IIN_DPTR_WDTH'b0 }	: sr_dim_dout;
						

  //------------------------------------------------------------------------------------------
  // IOT rcd Credit Counter Logic - Determines whether the IIN rcd's can be Enqueued to IMU
  //------------------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	iot_credit_count	<=	4'b1000;		// Initially sized to IOT FIFO depth - 8
    else
	iot_credit_count	<=	next_iot_credit_count;


  always @ (ld_iin_rcd or iot_rcd_deq or iot_credit_count)		
    begin						
    	next_iot_credit_count = 4'b0000;				// Just for initialization

	case ({iot_rcd_deq, ld_iin_rcd})	// synopsys infer_mux

    	  (2'b01) :							// Enqueueing IIN record 
	    next_iot_credit_count =	iot_credit_count - 1'b1;	// Decrement LRM credit
	  (2'b10) :							// Dequeueing Record from IOT SR
	    next_iot_credit_count =	iot_credit_count + 1'b1;	// Increment LRM credit
	  (2'b00),
	  (2'b11) :
	    next_iot_credit_count =	iot_credit_count;		// Credit Count Remains the Same

	endcase
    end


  //------------------------------------------------------------------------------------------
  // STD rcd Credit Counter Logic - Determines whether the STD rcd FIFO can be Enqueued
  //------------------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	std_credit_count	<=	3'b100;			// Initially sized to STD FIFO depth - 4
    else
	std_credit_count	<=	next_std_credit_count;


  always @ (std_rcd_enq or std_rcd_deq or std_credit_count)		
    begin						
    	next_std_credit_count = 3'b000;				

	case ({std_rcd_deq, std_rcd_enq})	// synopsys infer_mux
    	  
    	  (2'b01) :							// Enqueueing STD record 
	    next_std_credit_count =	std_credit_count - 1'b1;	// Decrement STD credit
	  (2'b10) :							// Dequeueing Record from STD SR
	    next_std_credit_count =	std_credit_count + 1'b1;	// Increment STD credit
	  (2'b00),
	  (2'b11) :
	    next_std_credit_count =	std_credit_count;		// Credit Count Remains the Same

	endcase
    end


  //------------------------------
  // LRM Tag Manager Functionality
  //------------------------------

  always @ (posedge clk)
    if (~rst_l)
    	begin
	    lrmtag	<=	`FIRE_DLC_IIN_LRMTAG_WDTH'b0;	
	    imu_lrmtag	<=	`FIRE_DLC_IIN_LRMTAG_WDTH'b0;
	end

    else
    	begin
	    lrmtag	<=	next_lrmtag;
	    imu_lrmtag	<=	lrmtag;		// Synchronized lrmtag - ie: 1 clock delayed version to 
	end					// IMU - this accounts for IIN registered output delay


  // LRM Transmit Tag Logic is simply a counter
  assign next_lrmtag 	= 	incr_lrmtag ? lrmtag_plusone : lrmtag;
  assign lrmtag_plusone	= 	lrmtag + 1'b1;	
  
      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		

  //-------------------------------------------------------------------------
  // LRM Ingress DIM Record SR FIFO = (WIDTH) 123 * (DEPTH) 6 = 738 registers
  //-------------------------------------------------------------------------

  fire_dmc_common_srfifo #(DIM_SR_WIDTH, DIM_SR_DEPTH) sr_dim_fifo (
		.clk 		(clk), 	
		.rst_l 		(rst_l),
		
        	.enq 		(tm2rm_rcd_enq),
		.data_in 	(tm2rm_rcd),
		
        	.deq 		(sr_dim_deq), 
		.data_out 	(sr_dim_dout),
		
		.full 		(rm2tm_rcd_full),
        	.empty 		(sr_dim_empty),
        	.overflow	(),
        	.underflow	()
		);

  //-------------------------------------------------------------------------------------------
  // Parameters to be passed into Common Simple FIFO
  //    MDO_WDTH                =       `FIRE_DLC_MQR_REC_WDTH  = 14 bit Mondo Request from IMU
  //    MDO_DPTH                =       3'd4                    = Max sized to 4 Mondo's
  //    MDO_PTR_WDTH            =       2                       = 
  //    MDO_DPTH_MINUSONE       =       2'd3                    = Depth-1
  //-------------------------------------------------------------------------------------------
  

dmu_common_simple_fifo #(MDO_WDTH,MDO_DPTH,MDO_PTR_WDTH,MDO_DPTH_MINUSONE) mdo_request_fifo(
                .clk                    (clk),
                .rst_l                  (rst_l),

                .data_in                (im2rm_mdo),
                .write                  (im2rm_mdo_enq),

                .data_out               (mdo_fifo_dout),
                .read                   (mdo_fifo_deq),

                .fifo_full              (),
                .fifo_almost_full       (),
                .fifo_empty             (mdo_fifo_empty)

     );


endmodule 
