// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_lrm_itsb_fsm.v
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
module dmu_rmu_lrm_itsb_fsm (

			clk,
			rst_l,

			// TSB Interface  - Ingress Pipeline
			rm2ts_i_cmd_type,
			rm2ts_i_wr_data,
			rm2ts_i_req,

			ts2rm_i_gnt,
			ts2rm_i_n_trn,

			// Internal LRM Output Control Interface - lrm_octl - Outgoing LRM rcd
			lrm_rcd,
			lrm_rcd_enq,
			lrm_rcd_deq,	

  			// Internal LRM Input Control Interface - lrm_ictl - Incoming STD rcd
  			std_rcd, 
			std_rcd_enq, 
			std_rcd_deq,

			// Outputs (local) for Debug Port Visibility
			trans_type,
			sr_std_empty,
			itsb_state,
			lrm_credit_ok,
			dma_rd_bcnt
			
			);

// synopsys sync_set_reset "rst_l"
		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 				clk;
  input					rst_l; 

  
  //------------------------------------------------------------------------
  //  TSB Interface
  //------------------------------------------------------------------------

  // TSB interface (Ingress Pipeline)
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]	rm2ts_i_cmd_type;	// 4 bit TSB Command
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_i_wr_data;	// 48 bit Write Data
  output 					rm2ts_i_req;

  input						ts2rm_i_gnt;
  input  [`FIRE_DLC_TSR_TRN_WDTH-1:0]		ts2rm_i_n_trn;		// 5 bit TRN - Trans Scoreboard Tag


  //------------------------------------------------------------------------
  //  Internal LRM Interface to LRM Output Control Module
  //------------------------------------------------------------------------

  output [`FIRE_DLC_RMU_LRM_WDTH-1:0]		lrm_rcd; 
  output          				lrm_rcd_enq; 

  input						lrm_rcd_deq;		// LRM FIFO deq
							        

  //------------------------------------------------------------------------
  //  Internal LRM Interface to LRM Input Control Module
  //------------------------------------------------------------------------

  // Standard Records (other than rcd's destined to IMU or RRM)
  // Note: STD Record defined identically as the IIN record
  input  [`FIRE_DLC_RMU_LRM_WDTH-1:0]		std_rcd;	// 131 bit Std Rcd 
  input 					std_rcd_enq;	// Std Rcd FIFO Enqueue

  output					std_rcd_deq;	// SR Std Rcd Dequeue	


  //------------------------------------------------------------------------
  //  Outputs for Debug Port Visibility
  //------------------------------------------------------------------------

  output  [1:0]					trans_type;	// SR STD rcd trans type decoder
  output					sr_std_empty;	// STD SR fifo is empty  
  output  [4:0]					itsb_state;	// Ingress TSB 1-hot FSM
  output					lrm_credit_ok;	// OK to enqueue LRM rcd
  output  [`FIRE_DLC_TSR_BYTECNT_WDTH:0]	dma_rd_bcnt;		// 13 bit bcnt calc [12:0] for dma_rd

    
//############################################################################
//				PARAMETERS
//############################################################################

  // Ingress Transaction Type Decoder Parameters

  parameter
  	SEND2OCTL  =	2'b00,		// Send Record Up Pipeline
 	NP_DMA_TSB  =	2'b01,		// DMA Rd transaction requiring TSB access
	NP_UR_TSB   =	2'b10,		// Unsupported Request requiring TSB access
	UNDEFINED   =	2'b11;		// undefined type

  parameter
        DMA_MRD32   =   7'b0000000,	// NP_DMA_TSB class
        DMA_MRD64   =   7'b0100000,	// NP_DMA_TSB class
        DMA_MRDLK32 =   7'b0000001,	// NP_DMA_TSB class
        DMA_MRDLK64 =   7'b0100001,	// NP_DMA_TSB class
        DMA_UR      =   7'b0001001,	// NP_DMA_TSB class
        DMA_MWR32   =   7'b1000000,	// will send straight to MMU
        DMA_MWR64   =   7'b1100000,	// will send straight to MMU
//      MSI_EQWR_32 =   7'b1011000,	// should not be seen in this module
//      MSI_EQWR_64 =   7'b1111000,	// should not be seen in this module
//      MSG_EQWR_32 =   7'b1010000,	// should not be seen in this module
//      MSG_EQWR_64 =   7'b1110000,	// should not be seen in this module
//	NULL	    = 	7'b1111100,	// should not be seen in this module
//	MONDO	    = 	7'b1111010,	// should not be seen in this module
        PIO_CPLD    =   7'b1001010,	// will send straight to MMU
        PIO_CPL     =   7'b0001010;	// will send straight to MMU


  // Ingress Transaction Scoreboard Parameters
  parameter
        TRN_REQ_WR  =   4'b0101;	// TSB command - Request TRN and Write Data to TRN addr


   // LRM Ingress TSB Finite State Machine Parameters
	
  parameter
	I_PROCESS  =	0,		// FSM ready to process STD records (PIO's, Posted DMA's -DMAWRs)
	I_LDPIPE   =	1, 		// TSB Write Access in progress - Load Pipeline, DEQ next STD rcd 
	I_ENQPIPE  =  	2, 		// Complete TSB access and ENQ LRM Rcd - check if another TSB access
	I_STALL1   =  	3, 		// No lrm_credits while accessing TSB - finish TSB and chk credit
	I_STALL2   =  	4; 		// Pipelined TSB access completed, but had no credits - ENQ when OK!

  parameter
  	NUM_STATES = 	5;


  // LRM Record FIFO Parameters Width = 123, Depth = 5

  parameter
  	STD_SR_WIDTH =	`FIRE_DLC_RMU_LRM_WDTH,			// 131 bits
	STD_SR_DEPTH =	4;					// 4 deep
  

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################

  // Only (1) type of TSB command supported from Ingress Path - TRN Request w Write 
  wire  [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]	rm2ts_i_cmd_type;			// 4 bit TSB Command


//**************************************************
// Internal Sub-Block Wires 
//**************************************************

 // Incoming STD Record fields out of the SR fifo - 131 bit STD record

  wire	[`FIRE_DLC_RMU_LRM_WDTH-1:0]		sr_std_dout;	// Entire STD-LRM Record

  wire	[`FIRE_DLC_RMU_LRM_TYPE_WDTH-1:0]	sr_std_type;	// 7 bit Type Field
  wire	[`FIRE_DLC_RMU_LRM_TC_WDTH-1:0]		sr_std_tc;	// 3 bit TC field
  wire	[`FIRE_DLC_RMU_LRM_ATR_WDTH-1:0]	sr_std_atr;	// 2 bit Atr field
  wire	[`FIRE_DLC_RMU_LRM_LEN_WDTH-1:0]	sr_std_len;	// 10 bit Length 
  wire	[`FIRE_DLC_RMU_LRM_REQID_WDTH-1:0]	sr_std_reqid;	// 16 bit Reqid 
  wire	[`FIRE_DLC_RMU_LRM_TAG_WDTH-1:0]	sr_std_tag;	// 8 bit tlptag 
  wire	[`FIRE_DLC_RMU_LRM_LDWBE_WDTH-1:0]	sr_std_ldwbe;	// 4 bit last DWBE
  wire	[`FIRE_DLC_RMU_LRM_FDWBE_WDTH-1:0]	sr_std_fdwbe;	// 4 bit first DWBE
  wire	[`FIRE_DLC_RMU_LRM_ADDR_WDTH-1:0]  	sr_std_addr;	// 62 bit Addr
  wire	[`FIRE_DLC_RMU_LRM_DPTR_WDTH-1:0]	sr_std_dptr;	// 7 bit Data Pointer
  wire	[`FIRE_DLC_RMU_LRM_LRMTAG_WDTH-1:0]	sr_std_lrmtag;	// 8 bit sbdtag 


  wire						lrm_credit_ok;	// OK to enqueue LRM rcd
  wire						sr_std_empty;	// STD SR fifo is empty  
  

  wire	[`FIRE_DLC_RMU_LRM_WDTH-1:0]		std_lrm_rcd;	// concatenation of entire std_dout rcd 
  wire	[`FIRE_DLC_RMU_LRM_WDTH-1:0]		tsb_lrm_rcd;	// concatenation of entire pipelined rcd

  
  // Fields Used for TSB byte count and lower addr calculations
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH-1:0]	tsb_bcnt;		// 12 bit bcnt written to TSB
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH:0]		dma_rd_bcnt;		// 13 bit bcnt calc [12:0] for dma_rd
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH:0]		dma_rd_bcnt_mult_dws;	// 13 bit bcnt calc [12:0] for multi dw
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH:0]		dma_rd_len_total_bc;	// 13 bit bcnt calc [12:0] from pkt LEN
  									// before bytes subtracted from BE's

  wire	[`FIRE_DLC_TSR_ADALIGN_WDTH-1:0]	tsb_lower_addr;		// 7 bit address
  wire	[`FIRE_DLC_TSR_ADALIGN_WDTH-1:0]	dma_rd_addr;		// 7 bit address

  wire	[`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	next_tsb_write_data;	// 48 bit tsb wr data
  
  wire 	[2:0] 				      	total_bytes_off;	// 3 bit temporary adder for bcnt calc
  wire	[1:0]					dma_rd_lower_addr;	// 2 bit byte aligned lower addr from DMA RD	
  wire						dma_rd_len_eq_dw;	// DMA Rd LEN == 1 DW 
  wire						dma_rd_len_fourk;	// DMA Rd LEN == 0's -> so 4K!

  // Miscellaneous Wires

  wire						tsb_vld;		// transaction type requiring TSB access
  wire						tsb_lrm_rcd_sel;	// Registered lrm rcd mux select	
  wire						ld_tsb_pipe_reg;	// Load tsb_lrm_reg's from sr_std_dout
  wire						ld_tsb_sbdtag_reg;	// Load tsb trn tag into upbound LRM rcd 
  wire	[`FIRE_DLC_TSR_TRN_WDTH-1:0]		tsb_lrm_sbdtag;		// Muxed Output for the 5 bit TSB tag


//**************************************************
// Registers that Are Not Flops 
//**************************************************

  reg	[1:0]	trans_type;					// SR STD rcd trans type decoder
  reg    	std_rcd_deq;					// SR STD rcd dequeue signal
  reg  		lrm_rcd_enq;					// LRM rcd enqueue signal
  reg  		ld_tsb_wr_data;					// Load Enable for TSB WR data
  
  // Signals used to help calculate DMA RD byte count for TSB accesses
  reg 	[1:0] 	bytes_off_frst_dwbe;				// Bytes to be subtracted from FDWBE
  reg 	[1:0] 	bytes_off_last_dwbe;				// Bytes to be subtracted from LDWBE	
  reg 	[2:0]   dma_rd_bcnt_one_dw;				// Value is 1,2,3 or 4

	
//**************************************************
// Registers that Are Flops 
//**************************************************

  // 	LRM Ingress TSB FSM 1-hot state machine
  reg	[NUM_STATES-1:0]	itsb_state, next_itsb_state;		// 1-hot FSM


  // Registered TSB Outputs
  reg	[`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_i_wr_data;	// 48 bit Write Data
  reg	rm2ts_i_req, next_rm2ts_i_req;					// TSB Request Signal


  // LRM FIFO credit mechanism - STD rcd and LRM rcd FIFO's sized to depth of 4
  reg   [2:0]	lrm_credit_count, next_lrm_credit_count;		// 3 bit credit count


  // tsb_lrm_reg's - Pipelined registers fro STD rcd's that need TSB access - allows streaming	
  reg	[`FIRE_DLC_RMU_LRM_TYPE_WDTH-1:0]	tsb_reg_type;		// 7 bit Type Field
  reg	[`FIRE_DLC_RMU_LRM_TC_WDTH-1:0]		tsb_reg_tc;		// 3 bit TC field
  reg	[`FIRE_DLC_RMU_LRM_ATR_WDTH-1:0]	tsb_reg_atr;		// 2 bit Atr field
  reg	[`FIRE_DLC_RMU_LRM_LEN_WDTH-1:0]	tsb_reg_len;		// 10 bit Length 
  reg	[`FIRE_DLC_RMU_LRM_REQID_WDTH-1:0]	tsb_reg_reqid;		// 16 bit Reqid 
  reg	[`FIRE_DLC_RMU_LRM_LDWBE_WDTH-1:0]	tsb_reg_ldwbe;		// 4 bit last DWBE
  reg	[`FIRE_DLC_RMU_LRM_FDWBE_WDTH-1:0]	tsb_reg_fdwbe;		// 4 bit first DWBE
  reg	[`FIRE_DLC_RMU_LRM_ADDR_WDTH-1:0]  	tsb_reg_addr;		// 62 bit Addr
  reg	[`FIRE_DLC_RMU_LRM_DPTR_WDTH-1:0]	tsb_reg_dptr;		// 7 bit Data Pointer
  reg	[`FIRE_DLC_RMU_LRM_LRMTAG_WDTH-1:0]	tsb_reg_lrmtag;		// 8 bit sbdtag 

  reg	[`FIRE_DLC_TSR_TRN_WDTH-1:0]		tsb_reg_sbdtag;		// 5 bit TSB index tag
									// 123 registers total
								

//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
    /* 0in state -var itsb_state 
       -val 	(5'b00001 << I_PROCESS) 
       -next 	(5'b00001 << I_LDPIPE) 
     */

    /* 0in state -var itsb_state 
       -val 	(5'b00001 << I_LDPIPE) 
       -next 	(5'b00001 << I_ENQPIPE)
       		(5'b00001 << I_STALL1)
     */
  
    /* 0in state -var itsb_state 
       -val 	(5'b00001 << I_ENQPIPE) 
       -next 	(5'b00001 << I_LDPIPE)
       		(5'b00001 << I_PROCESS)
     */

    /* 0in state -var itsb_state 
       -val 	(5'b00001 << I_STALL1) 
       -next 	(5'b00001 << I_STALL2)
       		(5'b00001 << I_LDPIPE)
       		(5'b00001 << I_PROCESS)
     */
  
    /* 0in state -var itsb_state 
       -val 	(5'b00001 << I_STALL2) 
       -next 	(5'b00001 << I_LDPIPE)
       		(5'b00001 << I_PROCESS)
     */
  
    // 0in one_hot -var	itsb_state

    // 0in maximum -var  lrm_credit_count  	-val    4

    // 0in maximum -var	trans_type		-val	2


   // Other POTENTIAL areas for Zero In 
   // make sure rm2ts_wr_data doesnt change while rm2ts_req asserted


   /* 0in constant -var rm2ts_i_wr_data
      -active ts2rm_i_gnt
   */
      
	


//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   

  // Only (1) type of TSB command supported from Ingress Path - TRN Request w Write 
  assign	rm2ts_i_cmd_type = TRN_REQ_WR;			// TSB Command - TRN request w write

		
  //---------------------------------------------------------------------------
  // Outgoing LRM record to LRM Output Control Module
  //---------------------------------------------------------------------------

  assign	lrm_rcd = tsb_lrm_rcd_sel ? tsb_lrm_rcd : std_lrm_rcd;

  assign	std_lrm_rcd = {	 
      				sr_std_type,
				sr_std_tc,
				sr_std_atr,
				sr_std_len,
				sr_std_reqid,
				sr_std_tag,
				sr_std_ldwbe,
				sr_std_fdwbe,
				sr_std_addr,
				sr_std_dptr,
				sr_std_lrmtag
  				};
  
  assign	tsb_lrm_rcd = {	 
      				tsb_reg_type,
				tsb_reg_tc,
				tsb_reg_atr,
				tsb_reg_len,
				tsb_reg_reqid,
				{3'b000, tsb_lrm_sbdtag},
				tsb_reg_ldwbe,
				tsb_reg_fdwbe,
				tsb_reg_addr,
				tsb_reg_dptr,
				tsb_reg_lrmtag
  				};


  // Transaction Scoreboard Tag - Only need to mux in the regsitered value if we have no upbound
  // LRM credits - but had already initiated a pipelined TSB Wr w trn request

  assign	tsb_lrm_sbdtag = (itsb_state[I_STALL2]) ?  tsb_reg_sbdtag : ts2rm_i_n_trn;


  //---------------------------------------------------------------------------
  // STD Record Fields used to define outgoing LRM Record
  //---------------------------------------------------------------------------

  assign 	sr_std_type 	= sr_std_dout[`FIRE_DLC_RMU_LRM_TYPE];	// 7 bit TYPE field
  assign 	sr_std_tc 	= sr_std_dout[`FIRE_DLC_RMU_LRM_TC];	// 3 bit TC field
  assign 	sr_std_atr 	= sr_std_dout[`FIRE_DLC_RMU_LRM_ATR];	// 2 bit TYPE field
  assign	sr_std_len	= sr_std_dout[`FIRE_DLC_RMU_LRM_LEN];	// 10 bit Length 
  assign	sr_std_reqid	= sr_std_dout[`FIRE_DLC_RMU_LRM_REQID];	// 16 bit Reqid 
  assign	sr_std_tag	= sr_std_dout[`FIRE_DLC_RMU_LRM_TAG];	// 8 bit tlptag
  assign	sr_std_ldwbe	= sr_std_dout[`FIRE_DLC_RMU_LRM_LDWBE];	// 4 bit last DWBE
  assign	sr_std_fdwbe	= sr_std_dout[`FIRE_DLC_RMU_LRM_FDWBE];	// 4 bit first DWBE
  assign	sr_std_addr	= sr_std_dout[`FIRE_DLC_RMU_LRM_ADDR];	// 62 bit Addr
  assign	sr_std_dptr	= sr_std_dout[`FIRE_DLC_RMU_LRM_DPTR];	// 7 bit Data Pointer
  assign	sr_std_lrmtag	= sr_std_dout[`FIRE_DLC_RMU_LRM_LRMTAG];// 8 bit lrmtag 


  //---------------------------------------------------------------------------------
  // Pipelined STD records that require TSB Access - Pipelined to Stream DMARds, UR's
  //---------------------------------------------------------------------------------

  always @ (posedge clk)
	if(~rst_l) begin
  	    tsb_reg_type 	<= {`FIRE_DLC_RMU_LRM_TYPE_WDTH{1'b0}};
	    tsb_reg_tc		<= {`FIRE_DLC_RMU_LRM_TC_WDTH{1'b0}};
	    tsb_reg_atr		<= {`FIRE_DLC_RMU_LRM_ATR_WDTH{1'b0}};
	    tsb_reg_len		<= {`FIRE_DLC_RMU_LRM_LEN_WDTH{1'b0}};
	    tsb_reg_reqid	<= {`FIRE_DLC_RMU_LRM_REQID_WDTH{1'b0}};
	    tsb_reg_ldwbe	<= {`FIRE_DLC_RMU_LRM_LDWBE_WDTH{1'b0}};
	    tsb_reg_fdwbe	<= {`FIRE_DLC_RMU_LRM_FDWBE_WDTH{1'b0}};
	    tsb_reg_addr	<= {`FIRE_DLC_RMU_LRM_ADDR_WDTH{1'b0}};
	    tsb_reg_dptr	<= {`FIRE_DLC_RMU_LRM_DPTR_WDTH{1'b0}};
	    tsb_reg_lrmtag	<= {`FIRE_DLC_RMU_LRM_LRMTAG_WDTH{1'b0}};
	end
    else if (ld_tsb_pipe_reg)				
    	begin
  	    tsb_reg_type 	<= sr_std_type;
	    tsb_reg_tc		<= sr_std_tc;
	    tsb_reg_atr		<= sr_std_atr;
	    tsb_reg_len		<= sr_std_len;
	    tsb_reg_reqid	<= sr_std_reqid;
	    tsb_reg_ldwbe	<= sr_std_ldwbe;
	    tsb_reg_fdwbe	<= sr_std_fdwbe;
	    tsb_reg_addr	<= sr_std_addr;
	    tsb_reg_dptr	<= sr_std_dptr;
	    tsb_reg_lrmtag	<= sr_std_lrmtag;
	end

    else
    	begin
  	    tsb_reg_type 	<= tsb_reg_type;
	    tsb_reg_tc		<= tsb_reg_tc;
	    tsb_reg_atr		<= tsb_reg_atr;
	    tsb_reg_len		<= tsb_reg_len;
	    tsb_reg_reqid	<= tsb_reg_reqid;
	    tsb_reg_ldwbe	<= tsb_reg_ldwbe;
	    tsb_reg_fdwbe	<= tsb_reg_fdwbe;
	    tsb_reg_addr	<= tsb_reg_addr;
	    tsb_reg_dptr	<= tsb_reg_dptr;
	    tsb_reg_lrmtag	<= tsb_reg_lrmtag;
	end

  // Register TSB index for LRM record - the TSB access may complete before having credits
  // to enqueue up to the LRM - safe bet is to register the value so next TSB trn is not
  // muxed into LRM record  

  always @ (posedge clk)
	if(~rst_l) begin
	tsb_reg_sbdtag	<= {`FIRE_DLC_TSR_TRN_WDTH{1'b0}};
	end
    else if (ld_tsb_sbdtag_reg)				
	tsb_reg_sbdtag	<= ts2rm_i_n_trn;
    else
	tsb_reg_sbdtag	<= tsb_reg_sbdtag;


  //--------------------------------------
  // Ingress LRM Record Type Decoder Logic 
  //--------------------------------------

  // Note: Should NEVER see a MSG, MSI, Mondo or Null IN THIS MODULE - they should have been
  //       forked off to the IMU... and then passed back up to the lrm_octl module where they
  //       are merged back into the Ingress pipeline

  always @ (sr_std_type or sr_std_empty)
    begin
      if (sr_std_empty)
	trans_type = SEND2OCTL;	

      else	
        case (sr_std_type) 		// 0in < case -default

	    DMA_MRD32   : trans_type = NP_DMA_TSB;
            DMA_MRD64   : trans_type = NP_DMA_TSB;
            DMA_MRDLK32 : trans_type = NP_DMA_TSB;
            DMA_MRDLK64 : trans_type = NP_DMA_TSB;
            DMA_UR      : trans_type = NP_UR_TSB;
            DMA_MWR32   : trans_type = SEND2OCTL;
            DMA_MWR64   : trans_type = SEND2OCTL;
	    PIO_CPLD    : trans_type = SEND2OCTL;
	    PIO_CPL     : trans_type = SEND2OCTL;

	    // Zero In Check for INVALID transaction type if FIFO is not empty
	    default	: trans_type = UNDEFINED; 	

	endcase // case
    end // always 


  //----------------------------------------------------------------------
  // Signal that indicates that there is room for LRM rcd - ok to Enqueue
  //----------------------------------------------------------------------
		
  assign 	lrm_credit_ok = |lrm_credit_count;		// If Credit is 1-4, then OK!!
								// If Credit is 0 - NOT ok! LRM SR full

//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   

  //------------------------
  // TSB request register
  //------------------------

  always @ (posedge clk)
    if (~rst_l)
	rm2ts_i_req	<=	1'b0;
    else
    	rm2ts_i_req	<=	next_rm2ts_i_req;


  //------------------------
  // TSB write data register
  //------------------------

  always @ (posedge clk)
    if (~rst_l)
	rm2ts_i_wr_data <=	{`FIRE_DLC_TSR_WR_DATA_WDTH{1'b0}};

    else if (ld_tsb_wr_data)				
	rm2ts_i_wr_data <=	next_tsb_write_data;
	
    else
	rm2ts_i_wr_data <=	rm2ts_i_wr_data;

  
  // Fields that make up the 48 bit TSB write data
  assign 	next_tsb_write_data = {	
      					sr_std_tc,
      					sr_std_atr,
					tsb_bcnt,
					sr_std_reqid,
					sr_std_tag,
					tsb_lower_addr
					};

  assign tsb_bcnt 	= (trans_type == NP_UR_TSB) ? 12'h4 : dma_rd_bcnt[`FIRE_DLC_TSR_BYTECNT_WDTH-1:0];
  assign tsb_lower_addr = (trans_type == NP_UR_TSB) ? 7'h0  : dma_rd_addr;

  // Note: IF len = 4K and NO BE's are subtracted from bcnt, all 0's will be written to TSB, the MSB
  //       or bit 13 of bcnt calculation does not get written to TSB, RRM must check for 4K length

  //------------------------------------------------
  // DMA Rd Byte Count Calculations for TSB accesses
  //------------------------------------------------

  // Note that ANY malformed packets WILL be trapped in the ILU - and that
  // no additioanl checks need to performed in the RMU!

  // Check to see if LEN = 1 DW... if so - then LDWBE's can be ignored - and BC = dma_rd_bcnt_one_dw
  assign dma_rd_len_eq_dw 	= ~|sr_std_len[`FIRE_DLC_RMU_LRM_LEN_WDTH-1:1] & sr_std_len[0];
  
  // Check to see if LEN = 0 DW... if so - then BCNT = 4K, dma_rd_bcnt = 12'h0;
  assign dma_rd_len_fourk	= ~|sr_std_len[`FIRE_DLC_RMU_LRM_LEN_WDTH-1:0];


  // Calculate dma_rd_bcnt for the case when LEN IS exactly equal to 1 DW 
  always @ (sr_std_fdwbe)
    begin
      	casez (sr_std_fdwbe)	// 0in < case -parallel -full -active ~sr_std_empty
	    4'b1zz1 : 	dma_rd_bcnt_one_dw = 3'h4;
	    4'b01z1 : 	dma_rd_bcnt_one_dw = 3'h3;
	    4'b1z10 : 	dma_rd_bcnt_one_dw = 3'h3;
	    4'b0011 : 	dma_rd_bcnt_one_dw = 3'h2;
	    4'b0110 : 	dma_rd_bcnt_one_dw = 3'h2;
	    4'b1100 : 	dma_rd_bcnt_one_dw = 3'h2;
	    4'b0001 : 	dma_rd_bcnt_one_dw = 3'h1;
	    4'b0010 : 	dma_rd_bcnt_one_dw = 3'h1;
	    4'b0100 : 	dma_rd_bcnt_one_dw = 3'h1;
	    4'b1000 : 	dma_rd_bcnt_one_dw = 3'h1;
	    4'b0000 : 	dma_rd_bcnt_one_dw = 3'h1;		// If ZERO byte DMA Rd - byte count = 1!
      	endcase 
    end

  // Number of bytes off from 1st DWBE
  always @ (sr_std_fdwbe)
    begin
    	if (sr_std_fdwbe[0]) 		bytes_off_frst_dwbe = 2'b00;
      	else if (sr_std_fdwbe[1]) 	bytes_off_frst_dwbe = 2'b01;
      	else if (sr_std_fdwbe[2]) 	bytes_off_frst_dwbe = 2'b10;
      	else if (sr_std_fdwbe[3]) 	bytes_off_frst_dwbe = 2'b11;
      	else 				bytes_off_frst_dwbe = 2'b00;
    end
  
  // Number of bytes off from last DWBE
  always @ (sr_std_ldwbe)
    begin
      	if (sr_std_ldwbe[3]) 		bytes_off_last_dwbe = 2'b00;
      	else if (sr_std_ldwbe[2]) 	bytes_off_last_dwbe = 2'b01;
      	else if (sr_std_ldwbe[1]) 	bytes_off_last_dwbe = 2'b10;
      	else if (sr_std_ldwbe[0]) 	bytes_off_last_dwbe = 2'b11;
      	else 				bytes_off_last_dwbe = 2'b00;
    end
   			      
  assign total_bytes_off = {1'b0, bytes_off_frst_dwbe} + {1'b0, bytes_off_last_dwbe}; // 3-bit value (0-6)

  // Calculate DMA Rd BCNT len for cases where the 10 bit LEN field is not a single DW

  // NOTE: this calculation also holds for LEN==0, or 4K - all BE's will set,
  //       total bytes off will = 0 - therefore a value of 12'h0 will be written 
  //       to TSB!  Need to validate cases where LEN may == 0, but BE's not all set?

  assign dma_rd_len_total_bc	= {dma_rd_len_fourk, sr_std_len, 2'b00};	 // 13 bit value

  assign dma_rd_bcnt_mult_dws 	= dma_rd_len_total_bc - {10'h0, total_bytes_off}; // 13 bit value

  assign dma_rd_bcnt 		= dma_rd_len_eq_dw ? {10'h0, dma_rd_bcnt_one_dw} : dma_rd_bcnt_mult_dws;


  //----------------------------------------------------------
  // DMA Lower Address Align Bit Calculations for TSB accesses
  //----------------------------------------------------------

  assign dma_rd_lower_addr	= bytes_off_frst_dwbe;				// 2 bit LSB addr

  assign dma_rd_addr 		= {sr_std_addr[4:0], dma_rd_lower_addr};	// 7 bit field


//-------------------------------------------------
// LRM Ingress TSB State Machine Combinatorial Code
//-------------------------------------------------

  // ttype of 0x01, 0x10 = NP_DMA, NP_UR respectively
  assign tsb_vld	 = trans_type[1]^trans_type[0];		

  // Registered lrm rcd mux select	
  assign tsb_lrm_rcd_sel = (itsb_state[I_ENQPIPE] | itsb_state[I_STALL1] | itsb_state[I_STALL2]);		

  // Load tsb_lrm_reg's from sr_std_dout
  assign ld_tsb_pipe_reg = itsb_state[I_LDPIPE];

  // Load enable for TSB trn number for upbound LRM record
  assign ld_tsb_sbdtag_reg = (itsb_state[I_STALL1]) & ts2rm_i_gnt;




//-----------------------------------------------
// LRM Ingress TSB State Machine Sequential Logic
//-----------------------------------------------

always @ (posedge clk)
    if (~rst_l)
	begin
  	    itsb_state[NUM_STATES-1:0] 	<= {NUM_STATES{1'b0}};
	    itsb_state[I_PROCESS] 	<= 1'b1;
    	end
    else
    	begin
    	    itsb_state 			<= next_itsb_state;
	end
	

// LRM Ingress TSB State Machine Combinatorial (Next State) Logic	

always @ ( itsb_state or sr_std_empty or lrm_credit_ok or trans_type or ts2rm_i_gnt or tsb_vld )

 begin
    next_itsb_state	= {NUM_STATES{1'b0}};			// Default FSM Output Values	
    std_rcd_deq		= 1'b0;
    lrm_rcd_enq		= 1'b0;
    ld_tsb_wr_data	= 1'b0;
    next_rm2ts_i_req	= 1'b0;
	

    case(1'b1)	// synopsys parallel_case
		// 0in < case -full
 
    // I_PROCESS - Initial State
    itsb_state[I_PROCESS] :

        if (~sr_std_empty & lrm_credit_ok)			// STD rcd ready to be processed
	    
	    case(trans_type)

	    (SEND2OCTL)	:					// Send STD rcd up pipeline	
    	    	begin
	    	    std_rcd_deq			= 1'b1;
		    lrm_rcd_enq			= 1'b1;
		    next_itsb_state[I_PROCESS]	= 1'b1;
	        end
	    
	    (NP_DMA_TSB),					// STD rcd needs to be tracked on TSB
	    (NP_UR_TSB) :		
	        begin
	            ld_tsb_wr_data		= 1'b1;
	    	    next_rm2ts_i_req		= 1'b1;
		    next_itsb_state[I_LDPIPE]	= 1'b1;
	        end

	    endcase

	else							// STD rcd fifo empty - Keep Default Values
      	    next_itsb_state[I_PROCESS]		= 1'b1;


    // I_LDPIPE - TSB Write Access in progress - Load Pipeline, DEQ next STD rcd and chk credit
    itsb_state[I_LDPIPE] :					// Pipline Load enable for NP record

        begin
	    next_rm2ts_i_req			= 1'b1;		// Keep REQ asserted
	    std_rcd_deq				= 1'b1;		// Pipeline TSB rcd

	    if (lrm_credit_ok)
	    	next_itsb_state[I_ENQPIPE]	= 1'b1;		// Complete TSB access and ENQ LRM Rcd
	    else
	    	next_itsb_state[I_STALL1]	= 1'b1;		// NO upbound credit - STALL pipeline
	end


    // I_ENQPIPE - Complete TSB access and ENQ LRM Rcd - check if another TSB access
    itsb_state[I_ENQPIPE] :					// LRM output rcd mux select -> tsb_lrm_rcd

    	case({ts2rm_i_gnt, tsb_vld})	// 0in < case -parallel -full

    	    (2'b00),						// Wait for GNT to complete	
	    (2'b01) :						// Keeping REQ asserted
	        begin
		    next_rm2ts_i_req		= 1'b1;
	    	    next_itsb_state[I_ENQPIPE] 	= 1'b1;		
		end

	    (2'b10) :						// TSB access complete, ENQ LRM rcd
	        begin						// since no more TSB accesses required
		    lrm_rcd_enq			= 1'b1;		// just return to PROCESS state
		    next_itsb_state[I_PROCESS]  = 1'b1;
		end

	    (2'b11) :						// TSB access completed, ENQ LRM rcd
	        begin						// and continue to stream NP DMA's
		   lrm_rcd_enq			= 1'b1;
		   ld_tsb_wr_data		= 1'b1;
		   next_rm2ts_i_req		= 1'b1;
		   next_itsb_state[I_LDPIPE]	= 1'b1;
		end
	endcase


    // I_STALL1 - No lrm_credits while accessing TSB - finish TSB and chk credit
    itsb_state[I_STALL1] :					// LRM output rcd mux select -> tsb_lrm_rcd

	case({ts2rm_i_gnt, lrm_credit_ok})	// 0in < case -parallel -full
	 
    	    (2'b00),
	    (2'b01) :
	        begin
		    next_rm2ts_i_req		= 1'b1;		// credit freed up before GNT 
		    next_itsb_state[I_STALL1]	= 1'b1;		// need to wait for credit_ok
		end
	
	    (2'b10) :
	        begin
		    next_itsb_state[I_STALL2]	= 1'b1;		// deassert REQ - but wait for credit
		end

	    (2'b11) :
		begin						// TSB completed and have credit!
		    lrm_rcd_enq			= 1'b1;		// ENQ lrm rcd!, deassert req

		    if (tsb_vld)				// Another NP_DMA or NP_UR ready for TSB
			begin
		    	    ld_tsb_wr_data	= 1'b1;
	    	    	    next_rm2ts_i_req	= 1'b1;
		    	    next_itsb_state[I_LDPIPE] = 1'b1;	// Stream out Non Posted DMA's		
		        end
		    else
		    	begin
			    next_itsb_state[I_PROCESS] = 1'b1;	// Either fifo empty or 
			end
		end
	   endcase


    // I_STALL2 - Pipelined TSB access completed, but had no credits - ENQ when OK!
    itsb_state[I_STALL2] :					// LRM output rcd mux select -> tsb_lrm_rcd

	case({lrm_credit_ok, tsb_vld})	// 0in < case -parallel -full
	 
    	    (2'b00),
	    (2'b01) :
	        begin
		    next_itsb_state[I_STALL2]	= 1'b1;		// need to wait for credit_ok
		end
	
	    (2'b10) :
	        begin
		    lrm_rcd_enq			= 1'b1;		// OK to ENQ LRM Rcd - no more TSB cycles
		    next_itsb_state[I_PROCESS]	= 1'b1;	
		end

	    (2'b11) :						 
		begin						// Have credit!, and Another TSB access
		    lrm_rcd_enq			= 1'b1;		// ENQ lrm rcd!, deassert req
		    ld_tsb_wr_data		= 1'b1;
    	    	    next_rm2ts_i_req		= 1'b1;
	    	    next_itsb_state[I_LDPIPE] 	= 1'b1;
		end

	   endcase


    endcase	// ends itsb_state case FSM

 end	// ends combinatorial always block for i_fsm state machine


  //--------------------------------------------------------------------------------------------
  // LRM rcd Credit Counter - Establishes whether there is credit to Enqueue LRM rcd to lrm_octl
  //--------------------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	lrm_credit_count	<=	3'b100;			// Initially sized to LRM FIFO Depth - 5
    else
	lrm_credit_count	<=	next_lrm_credit_count;


  always @ (lrm_rcd_enq or lrm_rcd_deq or lrm_credit_count)		
    begin						// Combinatorial next_lrm_credit_count logic
    	next_lrm_credit_count = 3'b000;			// Just for initialization

	case ({lrm_rcd_deq, lrm_rcd_enq})	// synopsys infer_mux

    	  (2'b01) :							// Enqueueing LRM record 
	    next_lrm_credit_count =	lrm_credit_count - 1'b1;	// Decrement LRM credit
	  (2'b10) :							// Dequeueing Record from LRM SR
	    next_lrm_credit_count =	lrm_credit_count + 1'b1;	// Increment LRM credit
	  (2'b00),
	  (2'b11) :
	    next_lrm_credit_count =	lrm_credit_count;		// Credit Count Remains the Same

	endcase
    end


//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		
  //----------------------------------------------------
  // STD Standard Record FIFO = 131 * 5 =  655 registers
  // STD Standard Record FIFO = 131 * 4 =  524 registers
  //----------------------------------------------------

  fire_dmc_common_srfifo #(STD_SR_WIDTH, STD_SR_DEPTH) sr_std_fifo (
		.clk 		(clk), 	
		.rst_l 		(rst_l),
        	.enq 		(std_rcd_enq),
		.data_in 	(std_rcd),
        	.deq 		(std_rcd_deq), 
		.data_out 	(sr_std_dout),
		.full 		(),
        	.empty 		(sr_std_empty),
        	.overflow	(),
        	.underflow	()
		);

		
endmodule 
