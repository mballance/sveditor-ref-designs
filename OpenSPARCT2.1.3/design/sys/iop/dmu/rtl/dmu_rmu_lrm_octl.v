// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_lrm_octl.v
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
module dmu_rmu_lrm_octl (
				
			clk,
			rst_l,

			// MMU Interface
			rm2mm_rcd,
			rm2mm_rcd_enq,
			mm2rm_rcd_full,
		
			// IMU interface - Interrupt Out Record (IOT)
  			im2rm_rcd,
  			im2rm_rcd_enq,

			// Internal LRM interface with lrm_itsb_fsm module
			lrm_rcd,
			lrm_rcd_enq,
			lrm_rcd_deq,	

			// Internal LRM Interface with lrm_ictl module
			iot_rcd_deq,

			// Outputs (local) for Debug Port Visibility
			sr_lrm_empty,
			sr_iot_empty,
			ttag_match_iot,
			ttag_match_lrm

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
  //  MMU Interface
  //------------------------------------------------------------------------

  // Ingress pipeline interface - 116 bit SRM RECORD (LRM to MMU)
  output [`FIRE_DLC_SRM_WDTH-1:0]		rm2mm_rcd;
  output					rm2mm_rcd_enq;
  input						mm2rm_rcd_full;


  //------------------------------------------------------------------------
  //  IMU Interface
  //------------------------------------------------------------------------

  // Interrupt Out Record - 131 bit IOT Record (IMU to LRM)
  input	 [`FIRE_DLC_IOT_REC_WDTH-1:0]		im2rm_rcd;		
  input						im2rm_rcd_enq;

  
  //------------------------------------------------------------------------
  //   Internal LRM Interface to LRM Ingress TSB FSM Module
  //------------------------------------------------------------------------

  // LRM Record - 131 bit LRM record from lrm_itsb_fsm module
  input [`FIRE_DLC_RMU_LRM_WDTH-1:0]		lrm_rcd; 
  input 					lrm_rcd_enq; 
  output					lrm_rcd_deq;
							        

  //------------------------------------------------------------------------
  //  Internal LRM Interface to LRM Input Control Module
  //------------------------------------------------------------------------
  
  output					iot_rcd_deq;


  //------------------------------------------------------------------------
  //  Outputs for Debug Port Visibility
  //------------------------------------------------------------------------
  
  output					sr_lrm_empty;	// LRM Rcd FIFO empty signal
  output					sr_iot_empty;	// LRM Rcd FIFO empty signal
  output					ttag_match_iot;	// OK to forward IOT record to MMU
  output					ttag_match_lrm; // OK to forward LRM record to MMU



//############################################################################
//				PARAMETERS
//############################################################################

  //-------------------------------------------------------------------------
  // LRM Standard Record SR FIFO = (WIDTH) 131 * (DEPTH) 5 = 655 registers
  // LRM Standard Record SR FIFO = (WIDTH) 131 * (DEPTH) 4 = 524 registers
  //-------------------------------------------------------------------------

  parameter
	LRM_SR_WIDTH =	`FIRE_DLC_RMU_LRM_WDTH,
  	LRM_SR_DEPTH =	4;


  //----------------------------------------------------------------------------------
  // LRM Interrupt Out Record (IOT) SR FIFO = (WIDTH) 131 * (DEPTH) 8 = 1048 registers
  // Note: For comparison - (gate size and io timing) will use simple fifo for IOT Rcd
  //
  // Parameters to be passed into Common Simple FIFO
  //    IOT_WDTH                =       `FIRE_DLC_IOT_REC_WDTH  = 131 bit IOT Record
  //    IOT_DPTH                =       4'd8                    = MAS2.0 = 8 entries
  //    IOT_PTR_WDTH            =       3                       = 3 bits
  //    IOT_DPTH_MINUSONE       =       3'd7                    = Depth-1
  //-------------------------------------------------------------------------------------------
  
  parameter
  	IOT_WDTH                =       `FIRE_DLC_IOT_REC_WDTH,
  	IOT_DPTH                =       4'd8,
  	IOT_PTR_WDTH            =       3,
  	IOT_DPTH_MINUSONE       =       3'd7;


  // Identifies MONDO type out from IOT Record Input - used for Mondo Tag Sterring Logic
  parameter
	MONDO       =   7'b1111010;     


//############################################################################
//		DECLARE Module Wires and Registers
//############################################################################

  wire	[`FIRE_DLC_SRM_WDTH-1:0]	next_rm2mm_rcd;		// SRM record to MMU

  wire	[`FIRE_DLC_RMU_LRM_WDTH-1:0]	sr_lrm_dout;		// Output of LRM FIFO
  wire	[`FIRE_DLC_IOT_REC_WDTH-1:0]	sr_iot_dout;		// Output of IOT FIFO
  
  
  wire	ttag_match_iot;						// OK to forward IOT record to MMU
  wire	ttag_match_lrm;						// OK to forward LRM record to MMU

  wire	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	next_ttag;		// Next Transmit Tag Value
  wire	[`FIRE_DLC_IIN_LRMTAG_WDTH-1:0]	ttag_plusone;		// Transmit Tag Incremented Value
  
  wire	[`FIRE_DLC_IOT_LRMTAG_WDTH-1:0]	iot_rcd_lrmtag;		// lrmtag field in IOT Rcd
  wire	[`FIRE_DLC_IOT_LRMTAG_WDTH-1:0]	sr_lrm_lrmtag;		// lrmtag field in LRM Rcd

  wire	lrm_rcd_deq;						// LRM rcd dequeue IS also Load EN
  wire	iot_rcd_deq;						// IOT rcd dequeue IS also Load EN

  wire	ld_srm_rcd;						// ld_srm_lrm_rcd or ld_srm_iot_rcd
  wire	sr_iot_empty;						// Output of IOT fifo

  wire	sr_lrm_empty;						// Std Rcd FIFO empty signal

  wire	mondo_vld;						// Record from IMU is of type MONDO


  //--------------------------------------------------
  // Registers that Are Not Flops 
  //--------------------------------------------------

  // SRM Record formulation - otuput of 2 to 1 (IOT and LRM) Mux
  reg	[`FIRE_DLC_SRM_TYPE_WDTH-1:0]	next_srm_type;		// 7 bit type
  reg	[`FIRE_DLC_SRM_LEN_WDTH-1:0]	next_srm_len;		// 10 bit length	
  reg	[`FIRE_DLC_SRM_REQID_WDTH-1:0]	next_srm_reqid;		// 16 bit reqid 
  reg	[`FIRE_DLC_SRM_DWBE_WDTH-1:0]	next_srm_dwbe;		// 8 bit DWBE {ldwbe,fdwbe}
  reg	[`FIRE_DLC_SRM_ADDR_WDTH-1:0]	next_srm_addr;		// 62 bit address
  reg	[`FIRE_DLC_SRM_DPTR_WDTH-1:0]	next_srm_dptr;		// 7 bit dptr
  reg	[`FIRE_DLC_SRM_SBDTAG_WDTH-1:0] next_srm_sbdtag;	// 5 bit TSB trn tag	
  

  reg	ld_srm_lrm_rcd;						// Load SRM rcd from LRM rcd
  reg	ld_srm_iot_rcd;						// Load SRM rcd from IOT rcd
  reg	next_rm2mm_rcd_enq;					// Enqueue to MMU AND increment ttag!


  //--------------------------------------------------
  // Registers that Are Flops 
  //--------------------------------------------------

  reg	[`FIRE_DLC_SRM_WDTH-1:0]	rm2mm_rcd;		// SRM record to MMU
  reg					rm2mm_rcd_enq;		// Enqueue SRM rcd to MMU AND increment ttag!

  reg	[`FIRE_DLC_IOT_LRMTAG_WDTH-1:0]	ttag;			// Transmit Tag value used for Merging Rcd's


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
  // NOTE1: Need zero-in check for DUPLICATE TTAG
  // ttag_match_iot and ttag_match_lrm should never be both asserted at the same time

  // 0in custom -fire (ttag_match_iot & ttag_match_lrm) -active (~sr_lrm_empty & ~sr_iot_empty)


//############################################################################
//	    		COMBINATORIAL LOGIC
//############################################################################   

  //--------------------------------------------------------------
  // LRM Record and IOT Record Dequeue Signals
  //--------------------------------------------------------------

  assign	lrm_rcd_deq	= 	ld_srm_lrm_rcd;		// LRM rcd dequeue IS also Load EN
  assign	iot_rcd_deq	=	ld_srm_iot_rcd;		// IOT rcd dequeue IS also Load EN
	
  
  //---------------------------------------------------------------------------------------------
  // SRM register Load Enable Signal - spelled out for debug - Loading SRM from LRM or IOT record
  //---------------------------------------------------------------------------------------------

  assign ld_srm_rcd	= ld_srm_lrm_rcd | ld_srm_iot_rcd;


  //--------------------------------------------------------------
  // Transmit Tag compared to LRM Tag inserted onto IOT or LRM Rcd
  //--------------------------------------------------------------

  assign iot_rcd_lrmtag	= sr_iot_dout[`FIRE_DLC_IOT_LRMTAG_MSB:`FIRE_DLC_IOT_LRMTAG_LSB];
  assign sr_lrm_lrmtag	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_LRMTAG_MSB:`FIRE_DLC_RMU_LRM_LRMTAG_LSB];
  
  assign ttag_match_iot = ((ttag == iot_rcd_lrmtag) & ~sr_iot_empty);	
  assign ttag_match_lrm = ((ttag == sr_lrm_lrmtag) & ~sr_lrm_empty);	


  //-----------------------------------------------------------------------------------------
  // SRM Output Control Logic - Merges either IOT Rcd or LRM Rcd into Ingress Pipeline to MMU 
  //-----------------------------------------------------------------------------------------

  always @ ( ttag_match_iot or ttag_match_lrm or mm2rm_rcd_full )
    begin

    	ld_srm_lrm_rcd		=	1'b0;			// Load Enable and LRM rcd dequeue
	ld_srm_iot_rcd		=	1'b0;			// Load Enable and IOT rcd dequeue
	next_rm2mm_rcd_enq	=	1'b0;			// Registered Enqueue signal to SRM
	
	case ({mm2rm_rcd_full, ttag_match_iot, ttag_match_lrm})	// 0in < case -parallel

    	  (3'b001) :						// OK to send LRM rcd to SRM!
	    begin
	    	ld_srm_lrm_rcd		= 	1'b1;		// Load SRM rcd, dequeue LRM rcd
		next_rm2mm_rcd_enq	=	1'b1;		// Incr ttag and Enqueue SRM
	    end

    	  (3'b010) :						// OK to send IOT rcd to SRM!
	    begin
	    	ld_srm_iot_rcd		= 	1'b1;		// Load SRM rcd, dequeue IOT rcd
		next_rm2mm_rcd_enq	=	1'b1;		// Incr ttag and Enqueue SRM
	    end

	  default :						// NO tag matches OR SRM fifo FULL
	    begin
    		ld_srm_lrm_rcd		=	1'b0;
		ld_srm_iot_rcd		=	1'b0;
		next_rm2mm_rcd_enq	=	1'b0;
	    end
	endcase		// Ends case statement
    end		// Ends Always block


  //---------------------------------------------------------
  // Outgoing SRM Record is MUXed from either IOT or LRM fifo 
  //---------------------------------------------------------

  always @ (ld_srm_iot_rcd or sr_iot_dout or sr_lrm_dout or mondo_vld)
    begin
      
        case (ld_srm_iot_rcd)		// synopsys infer_mux
	    
    	// SRM Mux Select - IOT Record
	(1'b1) : 
	    begin
	    	next_srm_type 	= sr_iot_dout[`FIRE_DLC_IOT_TYPE];
	    	next_srm_len	= sr_iot_dout[`FIRE_DLC_IOT_LEN];
	    	next_srm_reqid	= sr_iot_dout[`FIRE_DLC_IOT_REQID];
	    	next_srm_dwbe	= mondo_vld ? {sr_iot_dout[`FIRE_DLC_IOT_DATA_MSB:`FIRE_DLC_IOT_DATA_LSB+2],
		    			       sr_iot_dout[`FIRE_DLC_IOT_REQID_LSB+1:`FIRE_DLC_IOT_REQID_LSB]} :
							sr_iot_dout[`FIRE_DLC_IOT_DATA];
	    	next_srm_addr	= sr_iot_dout[`FIRE_DLC_IOT_ADDR];
		next_srm_dptr	= sr_iot_dout[`FIRE_DLC_IOT_DPTR];
		next_srm_sbdtag	= sr_iot_dout[`FIRE_DLC_IOT_TLPTAG_LSB+4:`FIRE_DLC_IOT_TLPTAG_LSB];		    
	    end

	// SRM record by default will originate from Ingress Pipeline LRM record
	(1'b0) :
	    begin
	    	next_srm_type 	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_TYPE];
	    	next_srm_len	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_LEN];
	    	next_srm_reqid	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_REQID];
	    	next_srm_dwbe	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_LDWBE_MSB:`FIRE_DLC_RMU_LRM_FDWBE_LSB];
	    	next_srm_addr	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_ADDR];
		next_srm_dptr	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_DPTR];
		next_srm_sbdtag	= sr_lrm_dout[`FIRE_DLC_RMU_LRM_TAG_LSB+4:`FIRE_DLC_RMU_LRM_TAG_LSB];		    
	    end
	endcase
    end


  //  Steering logiv for SRM DWBE field
  assign 	mondo_vld = (sr_iot_dout[`FIRE_DLC_IOT_TYPE] == MONDO) & ~sr_iot_empty;


  //-----------------------------------------------------------
  // For Readability - will define next SRM record fields here!
  //-----------------------------------------------------------

  // Formulation of the 115 bit Next SRM Record - Output of LRM/IOT fifo's 
  assign next_rm2mm_rcd	=	{	next_srm_type,
      					next_srm_len,
					next_srm_reqid,
					next_srm_dwbe,
					next_srm_addr,
					next_srm_dptr,
					next_srm_sbdtag
					};
   			
  

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	

  //-----------------------------------------------------
  // SRM Record Enqueue Signal
  //-----------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	rm2mm_rcd_enq	<=	1'b0;
    else
    	rm2mm_rcd_enq	<=	next_rm2mm_rcd_enq;


  //----------------------------------------------
  // 115 bit Registered SRM Record Generation 
  //----------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	rm2mm_rcd	<=	{`FIRE_DLC_SRM_WDTH{1'b0}};
    else if (ld_srm_rcd)				// SRM Load Enable = ld_srm_iot,ld_srm_lrm
	rm2mm_rcd	<= 	next_rm2mm_rcd;		
    else
	rm2mm_rcd	<=	rm2mm_rcd;	


//-------------------------------------------
  // Transmit Tag (Merge) Manager Functionality
  //-------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	ttag	<=	`FIRE_DLC_IIN_LRMTAG_WDTH'b0;		// First Tag to Look for is 8'b0
    else
	ttag	<=	next_ttag;


  // Transmit Tag is simply a counter - As each Record is Transmitted - we look for the next
  // record - from either IOT or LRM record fifo - that was assigned an lrmtag IN ORDER received

  assign next_ttag 	= 	next_rm2mm_rcd_enq ? ttag_plusone : ttag;
  assign ttag_plusone	= 	ttag + 1'b1;	
  
      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		

  //-------------------------------------------------------------------------
  // LRM Record SR FIFO = (WIDTH) 131 * (DEPTH) 5 = 655 registers
  // LRM Record SR FIFO = (WIDTH) 131 * (DEPTH) 4 = 524 registers
  //-------------------------------------------------------------------------

  fire_dmc_common_srfifo #(LRM_SR_WIDTH, LRM_SR_DEPTH) sr_lrm_fifo (
		.clk 		(clk), 	
		.rst_l 		(rst_l),
		
        	.enq 		(lrm_rcd_enq),
		.data_in 	(lrm_rcd),
		
        	.deq 		(lrm_rcd_deq), 
		.data_out 	(sr_lrm_dout),
		
		.full 		(),
        	.empty 		(sr_lrm_empty),
        	.overflow	(),
        	.underflow	()
		);

  //----------------------------------------------------------------------------------
  // LRM Interrupt Out Record (IOT) SR FIFO = (WIDTH) 131 * (DEPTH) 8 = 1048 registers
  // Note: For comparison - (gate size and io timing) will use simple fifo for IOT Rcd
  //
  // Parameters to be passed into Common Simple FIFO
  //    IOT_WDTH                =       `FIRE_DLC_IOT_REC_WDTH  = 131 bit IOT Record
  //    IOT_DPTH                =       4'd8                    = MAS2.0 = 8 entries
  //    IOT_PTR_WDTH            =       3                       = 3 bits
  //    IOT_DPTH_MINUSONE       =       3'd7                    = Depth-1
  //-------------------------------------------------------------------------------------------
  

dmu_common_simple_fifo #(IOT_WDTH,IOT_DPTH,IOT_PTR_WDTH,IOT_DPTH_MINUSONE) iot_rcd_fifo(
                .clk                    (clk),
                .rst_l                  (rst_l),

                .data_in                (im2rm_rcd),
                .write                  (im2rm_rcd_enq),

                .data_out               (sr_iot_dout),
                .read                   (iot_rcd_deq),

                .fifo_full              (),
                .fifo_almost_full       (),
                .fifo_empty             (sr_iot_empty)
		);
		
//
//  //----------------------------------------------------------------------------------
//  // LRM Interrupt Out Record (IOT) SR FIFO = (WIDTH) 131 * (DEPTH) 8 = 1048 registers
//  // Note: For comparison - (gate size and io timing) will use simple fifo for IOT Rcd
//  //----------------------------------------------------------------------------------
//
//  fire_dmc_common_srfifo #(IOT_SR_WIDTH, IOT_SR_DEPTH) sr_iot_fifo (
//		.clk 		(clk), 	
//		.rst_l 		(rst_l),
//		
//        	.enq 		(im2rm_rcd_enq),
//		.data_in 	(im2rm_rcd),
//		
//        	.deq 		(iot_rcd_deq), 
//		.data_out 	(sr_iot_dout),
//		
//		.full 		(),
//        	.empty 		(sr_iot_empty),
//        	.overflow	(),
//        	.underflow	()
//		);



endmodule 
