// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_rrm_efsm.v
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
module dmu_rmu_rrm_efsm (
				
			clk,
			rst_l,
		
			// Inputs from CMU - Retire Record (TCM to RRM) 
			cm2rm_rcd,
			cm2rm_rcd_enq,

			// Output to CMU
			rm2cm_rcd_full,

			// Outputs to ILU - EPE Record (Egress PEC Record) 
			k2y_rcd,
			k2y_rcd_enq,

			// Input from ILU
			y2k_rcd_deq,

			// Outputs to IMU - Mondo Reply Record (RRM to IMU)
  			rm2im_rply,
  			rm2im_rply_enq,

			// Input from IMU - Static CSR MEM64 Address Offset
  			im2rm_mem64_offset_reg,

			// Outputs to TSB
			rm2ts_e_trn,
			rm2ts_e_wr_data,

			// Inputs from TSB
			ts2rm_e_rd_data,

			// Input from CRU
			cr2rm_req_id,

			// Outputs to Local ETSB module
			gen_tsb_access,
			sr_err_last_pkt,

			// Inputs from Local ETSB module
			tsb_fsm_idle,
			ld_epe_rcd_tsb,

			// Outputs (local) for Debug Visibility
			wrb_bcnt,
			ilu_credit_cnt,
			type_decode,
			sr_err_empty,
			e_state

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
  //  CMU Interface
  //------------------------------------------------------------------------

  // Egress pipeline interface - Egress RETIRE RECORD (TCM to RRM)
  input  [`FIRE_DLC_ERR_REC_WDTH-1:0]	cm2rm_rcd;
  input					cm2rm_rcd_enq;
  output				rm2cm_rcd_full;

  //------------------------------------------------------------------------
  //  ILU Interface
  //------------------------------------------------------------------------

  // Egress pipeline interface - EPE (Egress PEC record) (RRM to ILU)
  output [`FIRE_DLC_EPE_REC_WDTH-1:0]	k2y_rcd;
  output 				k2y_rcd_enq;
  input					y2k_rcd_deq;


  //------------------------------------------------------------------------
  //  IMU Interface
  //------------------------------------------------------------------------

  // Mondo Reply Record (RRM to IMU)
  output [`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply;		// 3 bit field
  output				rm2im_rply_enq;
  input	 [`FIRE_DLC_SCW_MEM64_WDTH-1:0] im2rm_mem64_offset_reg;	// 40 bit field
  

  //------------------------------------------------------------------------
  //  TSB Interfacs
  //------------------------------------------------------------------------
		
  output [`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_e_wr_data;// 48 bit Write Data
  output [`FIRE_DLC_TSR_TRN_WDTH-1:0]		rm2ts_e_trn;	// 5 bit TSB trn 
  input  [`FIRE_DLC_TSR_RD_DATA_WDTH-1:0]	ts2rm_e_rd_data;// 48 bit Rd Data


  //------------------------------------------------------------------------
  //  CRU Interface
  //------------------------------------------------------------------------
		
  input  [`FIRE_PCIE_REQ_ID_WDTH-1:0]		cr2rm_req_id;	// FIRE's 16 bit Prog. ReqID


  //------------------------------------------------------------------------
  //  Egress TSB FSM Interface
  //------------------------------------------------------------------------
  
  output 		gen_tsb_access;				// Generate TSB Access
  output		sr_err_last_pkt;			// Last Pkt bit from ERR
  input			tsb_fsm_idle;				// ETSB FSM Idle		
  input			ld_epe_rcd_tsb;				// TSB Rd complete - Load

  
  //------------------------------------------------------------------------
  //  Outputs for Debug Visibility
  //------------------------------------------------------------------------
  
  output [`FIRE_DLC_TSR_BYTECNT_WDTH:0] 	wrb_bcnt;	// 13 bit field -> [12:0] to
								// handle special case of rcving 4K 
								// request 
  output [2:0]					ilu_credit_cnt;	// ILU credit count - starts at 4
  output [2:0]					e_state;	// 3 bit 1-hot Egress FSM	
  output [1:0]					type_decode;	// Transaction Type Decoder
  output					sr_err_empty;	// No ERR available in Egress SR Fifo

  
//############################################################################
//				PARAMETERS
//############################################################################

  // Transaction Class Type Decoder Parameter
  parameter
  	CLASPIO	=	2'b00,		// PIO header - Push down Egress Pipeline	
 	CLASMDO =	2'b01,		// Mondo Reply - will be forked to IMU 
	CLASDMA =	2'b10,		// DMA Response - NEEDS TSB Access 
  	UNDEFINED =	2'b11;		// For ZERO In to detect Invalid TYPE

  // Egress Command Type Decoder Parameter 

  parameter
  	PIOMRD32  =	7'b0000000,	// CLASPIO, PIO MRd - 32 bit Addr
	PIOMRD64  = 	7'b0100000, 	// CLASPIO, PIO MRd - 64 bit Addr
	PIOIORD	  =	7'b0000010, 	// CLASPIO, PIO IO Rd 
	PIOCFGRD0 =	7'b0000100, 	// CLASPIO, PIO Cfg Rd Type 0
        PIOCFGRD1 =   	7'b0000101, 	// CLASPIO, PIO Cfg Rd Type 1
	PIOIOWR	  =	7'b1000010, 	// CLASPIO, PIO IO Wr
	PIOMWR32  =	7'b1000000,	// CLASPIO, PIO MWr - 32 bit Addr
	PIOMWR64  =	7'b1100000,	// CLASPIO, PIO MWr - 64 bit Addr
	PIOCFGWR0 =	7'b1000100,	// CLASPIO, PIO Cfg Wr Type 0
	PIOCFGWR1 = 	7'b1000101, 	// CLASPIO, PIO Cfg Wr Type 1
	MONDORPLY =	7'b1111010, 	// CLASMDO, Mondo Reply
	DMACPL	  =	7'b0001010,	// CLASDMA, DMA Completion wOut Data
	DMACPLLK  =	7'b0001011, 	// CLASDMA, DMA Cpl Lk
	DMACPLD   =	7'b1001010;	// CLASDMA, DMA Cpl w Data

	
	
  // Egress Control Finite State Machine Parameters
	
  parameter
	E_PROCESS =	0,		// Process Retire RCD from TCM
	E_FULL    =  	1,		// Egress Pipeline Stall (DEM queue full)
	E_TSB_RD  =	2; 	// TSB Read Access in progress
	
  parameter
  	NUM_STATES = 	3;


  // Egress SR FIFO (Egress Retire Records) DEPTH and WIDTH parameters

  parameter
  	E_SR_DEPTH =	8,				// 8 Entry FIFO per MAS 2.0 spec
	E_SR_WIDTH =	`FIRE_DLC_ERR_REC_WDTH;		// currently 70 bit width


//############################################################################
//		DECLARE Module Wires and Registers
//############################################################################

  wire	sr_err_empty;			// No ERR available in Egress SR Fifo


//--------------------------------------------------
// Internal Sub-Block Wires 
//--------------------------------------------------

  // Incoming Egress Retire Record fields out of the SR fifo - 70 bit ERR record

  wire	[`FIRE_DLC_ERR_REC_WDTH-1:0]	sr_err_dout;		// Entire ERR Record

  wire	[`FIRE_DLC_ERR_TYP_WDTH-1:0]	sr_err_type;		// 7 bit Type
  wire	[`FIRE_DLC_ERR_LEN_WDTH-1:0]	sr_err_len;		// 10 bit Length  
  wire	[`FIRE_DLC_ERR_LDWBE_WDTH-1:0]	sr_err_ldwbe;		// 4 bit last DWBE
  wire	[`FIRE_DLC_ERR_FDWBE_WDTH-1:0]	sr_err_fdwbe;		// 4 bit first DWBE
  wire	[`FIRE_DLC_ERR_ADDR_WDTH-1:0]	sr_err_addr;		// 34 bit Address
  wire	[`FIRE_DLC_ERR_SBDTAG_WDTH-1:0]	sr_err_sbdtag;		// 5 bit tag
  wire	[`FIRE_DLC_ERR_DPTR_WDTH-1:0]	sr_err_dptr;		// 6 bit Data Pointer

  wire	sr_err_last_pkt;					// DMA Cpl last packet bit
  wire	sr_err_dma_cpl;						// Fast decode for DMA Cpl 
  wire	sr_err_pio_mem64;					// Fast decode for PIO mem 64


  // Incoming Transaction Scoreboard Read Data - Broken down into Appropriate Fields

  wire	[`FIRE_DLC_TSR_TC_WDTH-1:0]		tsb_rd_tc;	// 3 bit traffic class
  wire 	[`FIRE_DLC_TSR_ATTR_WDTH-1:0]		tsb_rd_attr;	// 2 bit attribute
  wire 	[`FIRE_DLC_TSR_BYTECNT_WDTH-1:0]	tsb_rd_bcnt;	// 12 bit byte count 
  wire	[`FIRE_DLC_TSR_REQID_WDTH-1:0]		tsb_rd_reqid;	// 16 bit reqid
  wire	[`FIRE_DLC_TSR_TLPTAG_WDTH-1:0]		tsb_rd_tlp_tag;	// 8 bit tlp_tag
  wire	[`FIRE_DLC_TSR_ADALIGN_WDTH-1:0]	tsb_rd_adalign;	// 7 bit adalign field

  wire	tsb_rd_bcnt_fourk;					// Flag for BCNT = 4K   	     

  // Outgoing Transaction Scoreboard Write Data - Just Appropriate Fields

  wire	[`FIRE_DLC_TSR_ADALIGN_WDTH-1:0] 	wrb_adalign;
  wire	[`FIRE_DLC_TSR_BYTECNT_WDTH:0] 		wrb_bcnt;	// 13 bit field -> [12:0] to
								// handle special case of rcving 4K 
								// request 

  // Outgoing PEC (EgressPEc) record fields that need to be calculated - 128 bit EPE record
  wire	[`FIRE_DLC_EPE_TC_WDTH-1:0]	next_epe_tc;		// 3 bit TC 
  wire	[`FIRE_DLC_EPE_ATR_WDTH-1:0]	next_epe_atr;		// 2 bit Attribute 
  wire	[`FIRE_DLC_EPE_TAG_WDTH-1:0]	next_epe_tag;		// 8 bit tag
  wire	[`FIRE_DLC_EPE_LDWBE_WDTH-1:0]	next_epe_ldwbe;		// 4 bit last DWBE
  wire	[`FIRE_DLC_EPE_FDWBE_WDTH-1:0]	next_epe_fdwbe;		// 4 bit last DWBE
  wire	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	next_epe_addr;		// 64 bit Address
  wire	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	dma_addr_field;		// 64 bit Address
  wire	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	pio_addr_field;		// 64 bit Address
  wire	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	pio_mem64_addr;		// 64 bit Address
  wire	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	pio_mem32_addr;		// 64 bit Address

  
  wire	retire_rcd_deq;			// Dequeue Signal SR FIFO - dequeues new
  					// sr_err_dout[70:0] to EFSM module
  wire	ld_epe_rcd;			// Load Enable for the RRM Record

  wire	no_epe_rcd_credit;		// LRM has credit for IOT Rcds


//--------------------------------------------------
// Registers that Are Not Flops 
//--------------------------------------------------

  // Output from Combinatorial Decode of sr_err_data
  reg	[1:0]	type_decode;				// Transaction Type Decoder
  							// PIO, Mondo Reply or DMA (TSB)
  
  // Outputs from EFSM State Machine
  reg		ld_mdo_rply_rcd;			// Mdo Rply Rcd Load Enable
  reg		ld_epe_rcd_pio;				// RRM Load Enable due to PIO Rcd
  reg		gen_tsb_access;				// Kicks off TSB FSM - AND loads
  							// TSB Trn pointer output!

//--------------------------------------------------
// Registers that Are Flops 
//--------------------------------------------------

  // 	Egress FSM 1-hot state machine
  reg	[NUM_STATES-1:0]		e_state, next_e_state;		// 1-hot Egress FSM	

 
  // 	Egress State Machine Registered Outputs
  reg	k2y_rcd_enq, 	next_k2y_rcd_enq;				// RRM Enqueue to TMU DEM
  reg	rm2im_rply_enq,	next_rm2im_rply_enq;				// MDO Rply Enqueue to IMU	


  //	Outgoing EPE record field Registers to ILU - 128 bit PEC record
  reg	[`FIRE_DLC_EPE_F_WDTH-1:0]	epe_f;				// 2 bit F
  reg	[`FIRE_DLC_EPE_TYPE_WDTH-1:0]	epe_type;			// 5 bit Type
  reg	[`FIRE_DLC_EPE_TC_WDTH-1:0]	epe_tc;				// 3 bit TC 
  reg	[`FIRE_DLC_EPE_ATR_WDTH-1:0]	epe_atr;			// 2 bit Attribute 
  reg	[`FIRE_DLC_EPE_LEN_WDTH-1:0]	epe_len;			// 10 bit Length  
  reg	[`FIRE_DLC_EPE_TAG_WDTH-1:0]	epe_tag;			// 8 bit tag
  reg	[`FIRE_DLC_EPE_LDWBE_WDTH-1:0]	epe_ldwbe;			// 4 bit last DWBE
  reg	[`FIRE_DLC_EPE_FDWBE_WDTH-1:0]	epe_fdwbe;			// 4 bit first DWBE
  reg	[`FIRE_DLC_EPE_ADDR_WDTH-1:0]	epe_addr;			// 34 bit Address
  reg	[`FIRE_DLC_EPE_DPTR_WDTH-1:0]	epe_dptr;			// 6 bit Data Pointer

  //	Outgoing Mondo Reply Record
  reg	[`FIRE_DLC_MRR_REC_WDTH-1:0]	rm2im_rply;			// 3 bit mdo rply field

  // 	Registered Outputs to TSB 
  reg	[`FIRE_DLC_TSR_TRN_WDTH-1:0]	rm2ts_e_trn;			// 5 bit tag to TSB
  
  reg	[`FIRE_DLC_TSR_TC_WDTH-1:0]	 tsb_wrb_tc;			// 3 bit traffic class
  reg 	[`FIRE_DLC_TSR_ATTR_WDTH-1:0]	 tsb_wrb_attr;			// 2 bit attribute
  reg	[`FIRE_DLC_TSR_BYTECNT_WDTH-1:0] tsb_wrb_bcnt;			// 12 bit writeback count
  reg	[`FIRE_DLC_TSR_REQID_WDTH-1:0]	 tsb_wrb_reqid;			// 16 bit reqid
  reg	[`FIRE_DLC_TSR_TLPTAG_WDTH-1:0]	 tsb_wrb_tlp_tag;		// 8 bit tlp_tag
  reg	[`FIRE_DLC_TSR_ADALIGN_WDTH-1:0] tsb_wrb_adalign;		// 7 bit adalign


  // WILL be register in INT2 - Outgoing TSB write data - need to calculate length
  wire	[`FIRE_DLC_TSR_WR_DATA_WDTH-1:0]	rm2ts_e_wr_data;	// 48 bit Write Data

  
  // RRM <-> ILU Credit Mechanism
  reg	[2:0]	ilu_credit_cnt, next_ilu_credit_cnt;


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
  //---------------------------------------------------------------------
  //  Egress Transfer Control State Machine Checkers
  //---------------------------------------------------------------------

   /* 
      0in state -var e_state 
      -val 	(3'b001 << E_PROCESS)	
      -next 	(3'b001 << E_TSB_RD) 
      		(3'b001 << E_FULL) 
   */
  
   /* 
      0in state -var e_state 
      -val 	(3'b001 << E_TSB_RD) 	
      -next 	(3'b001 << E_PROCESS) 
      		(3'b001 << E_FULL)
   */
  
   /* 
      0in state -var e_state 
      -val 	(3'b001 << E_FULL)	
      -next 	(3'b001 << E_PROCESS)
   */

   // 0in one_hot -var	e_state

   // 0in maximum -var	ilu_credit_cnt  -val	4

   // 0in maximum -var	type_decode	-val	2 


//############################################################################
//	    		COMBINATORIAL LOGIC
//############################################################################   


  //---------------------------------------------------------------------------
  // Outgoing RRM record to TMU concatenation of Registered Fields
  //---------------------------------------------------------------------------
  
  assign	k2y_rcd = {	epe_f,	
      				epe_type,
      				epe_tc,
				epe_atr,
				epe_len,
				cr2rm_req_id,		// epe_reqid - was 16'b0 for Fire since Root 
				epe_tag,		// Complex as a Requestor and Completor
				epe_ldwbe,		// UNTIL P1731 - now programmable
				epe_fdwbe,
				epe_addr,
				epe_dptr 
  				};

  //------------------------
  // Outgoing TSB Write Data
  //------------------------

  assign	rm2ts_e_wr_data = {	tsb_wrb_tc,
	    				tsb_wrb_attr,
    	    				tsb_wrb_bcnt,
    	    				tsb_wrb_reqid,
    	    				tsb_wrb_tlp_tag,
    	    				tsb_wrb_adalign
 				     	}; 
  

  //---------------------------------------------------------------------------
  // ERR Fields used to build outgoing RRM - using define file [MSB:LSB] fields 
  //---------------------------------------------------------------------------

  assign 	sr_err_type 	= sr_err_dout[`FIRE_DLC_ERR_TYP];	// 7 bit TYPE field
  assign	sr_err_len	= sr_err_dout[`FIRE_DLC_ERR_LEN];	// 10 bit Length 
  assign	sr_err_ldwbe	= sr_err_dout[`FIRE_DLC_ERR_LDWBE];	// 4 bit last DWBE
  assign	sr_err_fdwbe	= sr_err_dout[`FIRE_DLC_ERR_FDWBE];	// 4 bit first DWBE
  assign	sr_err_addr	= sr_err_dout[`FIRE_DLC_ERR_ADDR];	// 34 bit Addr
  assign	sr_err_sbdtag	= sr_err_dout[`FIRE_DLC_ERR_SBDTAG];	// 5 bit sbdtag 
  assign	sr_err_dptr	= sr_err_dout[`FIRE_DLC_ERR_DPTR];	// 6 bit Data Pointer

  assign	sr_err_last_pkt	= sr_err_ldwbe[0];			// Bit 0 of LDWBE is the
  									// DMACpl Last Packet field
  assign 	sr_err_dma_cpl	= ~sr_err_type[4] & sr_err_type[3];	// ERR is a DMA Cpl type
									// fast version type_decode
  assign	sr_err_pio_mem64 = sr_err_type[5];

  //--------------------------------------------------------------------------------------------
  // Transaction Scoreboard Values Read from TSB - used to create EPE records and TSB write data
  //--------------------------------------------------------------------------------------------

  assign 	tsb_rd_tc	= ts2rm_e_rd_data[`FIRE_DLC_TSR_TC];
  assign	tsb_rd_attr	= ts2rm_e_rd_data[`FIRE_DLC_TSR_ATTR];
  assign	tsb_rd_bcnt	= ts2rm_e_rd_data[`FIRE_DLC_TSR_BYTECNT];
  assign	tsb_rd_reqid	= ts2rm_e_rd_data[`FIRE_DLC_TSR_REQID];
  assign	tsb_rd_tlp_tag	= ts2rm_e_rd_data[`FIRE_DLC_TSR_TLPTAG];
  assign	tsb_rd_adalign	= ts2rm_e_rd_data[`FIRE_DLC_TSR_ADALIGN];

  assign	tsb_rd_bcnt_fourk = ~|tsb_rd_bcnt;

  //----------------------------------------------
  // Dequeue signal to SR Fifo
  //----------------------------------------------
  
  assign	retire_rcd_deq	= (ld_epe_rcd_pio | ld_epe_rcd_tsb | ld_mdo_rply_rcd);
		

  //----------------------------------------------
  // Egress Retire Record Class Type Decoder Logic 
  //----------------------------------------------

  always @ (sr_err_type or sr_err_empty)
    begin

      if (sr_err_empty)
	type_decode[1:0] = CLASPIO;
	
      else
        case (sr_err_type)	// 0in < case -default 

	    PIOMRD32  : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO MRd - 32 bit Addr
            PIOMRD64  : type_decode[1:0] = CLASPIO;     // CLASPIO, PIO MRd - 64 bit Addr
	    PIOIORD   : type_decode[1:0] = CLASPIO; 	// CLASPIO, PIO IO Rd 
	    PIOCFGRD0 : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO Cfg Rd Type 0
	    PIOCFGRD1 : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO Cfg Rd Type 1
	    PIOIOWR   : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO IO Wr
	    PIOMWR32  : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO MWr - 32 bit Addr
	    PIOMWR64  : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO MWr - 64 bit Addr
	    PIOCFGWR0 : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO Cfg Wr Type 0
	    PIOCFGWR1 : type_decode[1:0] = CLASPIO;	// CLASPIO, PIO Cfg Wr Type 1
	    MONDORPLY : type_decode[1:0] = CLASMDO;	// CLASMDO, Mondo Reply
	    DMACPL    : type_decode[1:0] = CLASDMA;	// CLASDMA, DMA Completion wOut Data
	    DMACPLLK  : type_decode[1:0] = CLASDMA;	// CLASDMA, DMA Cpl Lk
	    DMACPLD   : type_decode[1:0] = CLASDMA;	// CLASDMA, DMA Cpl w Data

            // Sero In check for Unitialized or Undefined Class Type - Check ONLY if Valid FIFO Data 
	    default   : type_decode[1:0] = UNDEFINED; 	

	endcase // case
    end // always 


//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
  //----------------------------------------------
  // Mondo Reply Record generation
  //----------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	rm2im_rply	<=	{`FIRE_DLC_MRR_REC_WDTH{1'b0}};	
    else if (ld_mdo_rply_rcd)
    	rm2im_rply	<=	sr_err_fdwbe[2:0];		// 3 LSB's of FDWBE field
    else
    	rm2im_rply	<=	rm2im_rply;


  //----------------------------------------------
  // EPE Record generation
  //----------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	begin
	    epe_f	<=	`FIRE_DLC_EPE_F_WDTH'b0;
	    epe_type	<=	`FIRE_DLC_EPE_TYPE_WDTH'b0;
	    epe_tc	<=	`FIRE_DLC_EPE_TC_WDTH'b0;
	    epe_atr	<=	`FIRE_DLC_EPE_ATR_WDTH'b0;
	    epe_len	<=	`FIRE_DLC_EPE_LEN_WDTH'b0;
	    epe_tag	<=	`FIRE_DLC_EPE_TAG_WDTH'b0;
	    epe_ldwbe	<=	`FIRE_DLC_EPE_LDWBE_WDTH'b0;
	    epe_fdwbe	<=	`FIRE_DLC_EPE_FDWBE_WDTH'b0;
	    epe_addr	<=	`FIRE_DLC_EPE_ADDR_WDTH'b0;
	    epe_dptr	<=	`FIRE_DLC_EPE_DPTR_WDTH'b0;
	end
    else if (ld_epe_rcd)				// RRM Load Enable = ld_epe_rcd_pio | ld_epe_rcd_tsb
	begin						
	    epe_f	<=	sr_err_type[6:5];	// Taken directly from Egress Retire Record
	    epe_type	<=	sr_err_type[4:0];	// 7 bit TYPE field - ERR type field ALWAYS 7 bits
	    epe_tc	<=	next_epe_tc;
	    epe_atr	<=	next_epe_atr;
	    epe_len	<=	sr_err_len;		// Calculated by PRM on ingress side-up to maxpayload
	    epe_tag	<=	next_epe_tag;
	    epe_ldwbe	<=	next_epe_ldwbe;
	    epe_fdwbe	<=	next_epe_fdwbe;		
	    epe_addr	<=	next_epe_addr;
	    epe_dptr	<=	sr_err_dptr;		//Taken directly from Egress Retire Record
	end
    else
	begin
	    epe_f	<=	epe_f;
	    epe_type	<=	epe_type;
	    epe_tc	<=	epe_tc;
	    epe_atr	<=	epe_atr;
	    epe_len	<=	epe_len;
	    epe_tag	<=	epe_tag;
	    epe_ldwbe	<=	epe_ldwbe;
	    epe_fdwbe	<=	epe_fdwbe;
	    epe_addr	<=	epe_addr;
	    epe_dptr	<=	epe_dptr;
	end


  //-----------------------------------------------------------
  // For Readability - will define next EPE record fields here!
  //-----------------------------------------------------------

  // RRM register Load Enable Signal - spelled out for debug - Loading RRM from ERR or TSB Rd Data
  assign ld_epe_rcd	= ld_epe_rcd_pio | ld_epe_rcd_tsb;

  // Traffic Class Field - 0's for PIO's - or Read from TSB if DMA Cpl
  assign next_epe_tc	= sr_err_dma_cpl ? tsb_rd_tc :`FIRE_DLC_EPE_TC_WDTH'b0;

  // Attribute Field - 0's for PIO's - or Read from TSB if DMA Cpl
  assign next_epe_atr 	= sr_err_dma_cpl ? tsb_rd_attr :`FIRE_DLC_EPE_ATR_WDTH'b0;
	    
  // TLP Tag Field - maintains ERR value for PIO's - if DMA Cmpl = cpl_sts[2:0], bcm, bcnt[11:8]
  assign next_epe_tag	= sr_err_dma_cpl ? {sr_err_fdwbe[2:0],1'b0,tsb_rd_bcnt[11:8]} : {3'b000, sr_err_sbdtag};

  // LDWBE Field - maintains ERR value for PIO - remaining bytecount for DMA (incl bytes in cur EPE record)
  assign next_epe_ldwbe	= sr_err_dma_cpl ? tsb_rd_bcnt[7:4] : sr_err_ldwbe;

  // FDWBE Field - maintains ERR value for PIO - remaining bytecount for DMA (incl bytes in cur EPE record)
  assign next_epe_fdwbe	= sr_err_dma_cpl ? tsb_rd_bcnt[3:0] : sr_err_fdwbe;

  // Address field - for PIO, need to calculate for 64 bit addressing - for DMA, Rd from TSB and calc ADALIGN
  assign next_epe_addr	= sr_err_dma_cpl ? dma_addr_field : pio_addr_field;

  // Supporting Logic for EPE Record Address Field Calculations - MUXes should be built in parallel
      // Address field if Record Type is DMA (DMA Cpl, DMA CplLk, DMA CplD) 
      assign dma_addr_field	= {32'b0, tsb_rd_reqid, tsb_rd_tlp_tag, 1'b0, tsb_rd_adalign};

      // Address field Record Type a PIO - (and of 64 bit or 32 bit addressing mode)
      assign pio_addr_field	= sr_err_pio_mem64 ? pio_mem64_addr : pio_mem32_addr;

      // RSV bits set to 0 for debug - will experiment with synthesis using sr_err_addr fields as rsvd
      // but since fields get shifted - mux's will still be implemented - and addtl fanout of sr_err_addr
      assign pio_mem64_addr	= {im2rm_mem64_offset_reg[39:12], 
			  	   (im2rm_mem64_offset_reg[11:0] | sr_err_addr[33:22]),
			  	    sr_err_addr[21:0], 2'b00};
      
      assign pio_mem32_addr	= {28'b0, sr_err_addr, 2'b00};
      

  //----------------------------------------------------------
  // TSB index tag (TRN tag) to look up DMA Read Response Info
  //----------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
    	rm2ts_e_trn	<=	`FIRE_DLC_TSR_TRN_WDTH'b0;	// Clear TSB TRN index
    else if (gen_tsb_access)					// Load Enable is the GO bit!
    	rm2ts_e_trn	<=	sr_err_sbdtag;			// ERR sbdtag IS TSB pointer
    else
    	rm2ts_e_trn	<=	rm2ts_e_trn;


  //---------------------------------------------------------------------------
  // TSB Write Data - Registered values that need to be written back to the TSB 
  //---------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	begin
	    tsb_wrb_tc		<=	`FIRE_DLC_TSR_TC_WDTH'b0;	    
	    tsb_wrb_attr	<=	`FIRE_DLC_TSR_ATTR_WDTH'b0;	    
    	    tsb_wrb_bcnt	<=	`FIRE_DLC_TSR_BYTECNT_WDTH'b0;	
    	    tsb_wrb_reqid	<=	`FIRE_DLC_TSR_REQID_WDTH'b0;	
    	    tsb_wrb_tlp_tag	<=	`FIRE_DLC_TSR_TLPTAG_WDTH'b0;	
    	    tsb_wrb_adalign	<=	`FIRE_DLC_TSR_ADALIGN_WDTH'b0;	
	end
    else if (ld_epe_rcd_tsb)					
	begin
	    tsb_wrb_tc		<=	tsb_rd_tc;		// Unmodified TC field
	    tsb_wrb_attr	<=	tsb_rd_attr;		// Unmodified Attr field
    	    tsb_wrb_bcnt	<=	wrb_bcnt[11:0];		// Calculated wr back remaining byte count
    	    tsb_wrb_reqid	<=	tsb_rd_reqid;		// Unmodified Reqid field
    	    tsb_wrb_tlp_tag	<=	tsb_rd_tlp_tag;		// Unmodified TLP Tag field
    	    tsb_wrb_adalign	<=	wrb_adalign;		// Calculated wr back aligned address
	end
    else
	begin
	    tsb_wrb_tc		<=	tsb_wrb_tc;
	    tsb_wrb_attr	<=	tsb_wrb_attr;
    	    tsb_wrb_bcnt	<=	tsb_wrb_bcnt;	
    	    tsb_wrb_reqid	<=	tsb_wrb_reqid;
    	    tsb_wrb_tlp_tag	<=	tsb_wrb_tlp_tag;
    	    tsb_wrb_adalign	<=	tsb_wrb_adalign;
	end

  // Remaining Byte Count -> TSB Read Byte count less Bytes transmitted in EPE DMACplD record
  // sr_err_addr[11:0] == Packet Record Byte Count (actual bytes transferred in Egress Retire Record

  assign wrb_bcnt 		= {tsb_rd_bcnt_fourk, tsb_rd_bcnt[11:0]} - 	// wrb_bcnt is 13 bit field
					{2'b00, sr_err_addr[10:0]};		// Max payload = 512-sr_err_addr[12:11]=0
  										// tsb_rd_bcnt - {2'b00,sr_err_addr[9:0]}

  // Aligned Address - TSB Address Alignment - Address alignment of next valid DMACplD
  assign wrb_adalign[6:0] 	= tsb_rd_adalign + sr_err_addr[6:0];
   


  //--------------------------------------------------------------------------------------------
  // ILU Credit Counter Logic - Establishes whether there is credit to enqueue EPE record to EIL
  //--------------------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	ilu_credit_cnt	<=	3'b100;		// Initially sized to IOT FIFO Size - 8
    else
	ilu_credit_cnt	<=	next_ilu_credit_cnt;


  // NOTE: Need to put Zero In checker to make sure credit stays within 0 to 4 range!
  
always @ (next_k2y_rcd_enq or y2k_rcd_deq or ilu_credit_cnt)		
    begin						// Combinatorial next_ilu_credit_cnt logic

    	next_ilu_credit_cnt = 3'b000;			// Just for initialization

	case ({y2k_rcd_deq, next_k2y_rcd_enq})	// synopsys infer_mux

    	  (2'b01) :						// Enqueueing EPE record 
	    next_ilu_credit_cnt =	ilu_credit_cnt - 1'b1;	// Decrement EIL credit
	  (2'b10) :						// Dequeueing Record from EIL
	    next_ilu_credit_cnt =	ilu_credit_cnt + 1'b1;	// Increment EIL credit
	  (2'b00),
	  (2'b11) :
	    next_ilu_credit_cnt =	ilu_credit_cnt;		// Credit Count Remains the Same
	    
	endcase
    end

    // RRM <-> ILU Credit Mechanism
    assign 	no_epe_rcd_credit = ~|ilu_credit_cnt;			
    								// If Credit is 1-4, then OK!!
								// If Credit is 0 - NOT ok! IOT SR full

//----------------------------------------------
// Egress State Machine Sequential Logic
//----------------------------------------------

always @ (posedge clk)
    if (~rst_l)
	begin
  	    e_state[NUM_STATES-1:0] 	<= {NUM_STATES{1'b0}};	// Makes sure all OTHER bits are 0
	    e_state[E_PROCESS] 	<= 1'b1;
	    k2y_rcd_enq	<= 1'b0;
	    rm2im_rply_enq	<= 1'b0;
    	end
    else
    	begin
    	    e_state 		<= next_e_state;
	    k2y_rcd_enq		<= next_k2y_rcd_enq;
	    rm2im_rply_enq	<= next_rm2im_rply_enq;
	end
	

	
// Egress State Machine Combinatorial (Next State) Logic	


always @ ( e_state or sr_err_empty or type_decode or no_epe_rcd_credit or
	   tsb_fsm_idle or ld_epe_rcd_tsb )

  begin
    next_e_state 	= {NUM_STATES{1'b0}};			
    next_k2y_rcd_enq	= 1'b0;					// prepare to Enqueue RRM Rcd
    next_rm2im_rply_enq	= 1'b0;					// prepare to Enqueue MDO Rply
	
    ld_epe_rcd_pio	= 1'b0;					// ld newly formed RRM Rcd
    ld_mdo_rply_rcd	= 1'b0;					// ld mondo reply Rcd
    gen_tsb_access	= 1'b0;					// ld rm2ts_e_trn AND start TSB fsm
	
    case(1'b1)	// synopsys parallel_case
    		// 0in < case -full
	
    // E_PROCESS - Data valid at output of SR fifo - FORMULATE RRM Record Depending on Type
    
    e_state[E_PROCESS]	:

    if (~sr_err_empty)						// Data at SR Output!
      begin

    	case(type_decode)	// 0in < case -full

	(CLASPIO)	:					// PIO - formulate RRM rcd
	    begin						// and advance SR FIFO
		ld_epe_rcd_pio	= 1'b1;				 	
		if (no_epe_rcd_credit)				// Pipe Full - Wait for DEM
    		    begin
    		    	next_e_state[E_FULL] 	= 1'b1;
		    	next_k2y_rcd_enq	= 1'b0;
		    end	
		else						// Enqueue RRM record to DEM
		    begin
		    	next_k2y_rcd_enq	= 1'b1;		
			next_e_state[E_PROCESS]	= 1'b1;
		    end
	    end	
		
	(CLASMDO)	:					// Fork Mondo Reply to IMU
	    begin
		ld_mdo_rply_rcd			= 1'b1;
		next_rm2im_rply_enq		= 1'b1;	
		next_e_state[E_PROCESS]		= 1'b1;
	    end   
	    
	    
	(CLASDMA)	:					// DMA Reply - NEEDS TSB Access!
	    if (tsb_fsm_idle)					// TSB FSM able to accept request
		begin
		    gen_tsb_access 		= 1'b1;
		    next_e_state[E_TSB_RD]	= 1'b1;
		end
	    else
	    	begin
		    gen_tsb_access		= 1'b0;
		    next_e_state[E_PROCESS]	= 1'b1;		// wait for TSB FSM
		end

	endcase		// ends e_state[E_PROCESS] type_decode case statement

	end

    else							// SR is EMPTY!!!  Keep Default Values
      	next_e_state[E_PROCESS]	= 1'b1;



    // E_TSB_RD - TSB access in process - Enqueue RRM record when data returned from TSB Rd
    
    e_state[E_TSB_RD]	:

	case({ld_epe_rcd_tsb, no_epe_rcd_credit})	// synopsys infer_mux
    								
    								// ld_epe_rcd_tsb occurs when 
	(2'b00),						// TSB rd access is done
	(2'b01):						// TSB Rd still in progress - wait
	    begin						
		next_k2y_rcd_enq	= 1'b0;
		next_e_state[E_TSB_RD]	= 1'b1;
	    end

	(2'b10) :						// TSB Rd done - OK to enqueue
	    begin
		next_k2y_rcd_enq	= 1'b1;
		next_e_state[E_PROCESS]	= 1'b1;			// process next retire record
	    end
		  
	(2'b11) :						// Ready to Enqueue but DEM full
	    begin						// Can't Enqueue just yet!
		next_k2y_rcd_enq	= 1'b0;
		next_e_state[E_FULL]	= 1'b1;
	    end

	endcase


    // E_FULL - RRM record ready to be enqueued down pipeline but stalled due to DEM being FULL
	    
    e_state[E_FULL] 	:
	
    	if (no_epe_rcd_credit)
    	    begin
	    	next_k2y_rcd_enq 		= 1'b0;
		next_e_state[E_FULL]		= 1'b1;
	    end
	else
	    begin
	    	next_k2y_rcd_enq		= 1'b1;
		next_e_state[E_PROCESS]		= 1'b1;		// process next retire record
	    end

    endcase	// ends e_state 1 hot state machine	
	    
end	// ends combinatorial always block for e_fsm state machine


      
//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		
		

//---------------------------------------------------
// Egress Retire Record FIFO = 70 * 8 = 560 registers
//---------------------------------------------------

fire_dmc_common_srfifo #(E_SR_WIDTH, E_SR_DEPTH) e_sr_fifo (
		.clk 		(clk), 	
		.rst_l 		(rst_l),
        	.enq 		(cm2rm_rcd_enq),
		.data_in 	(cm2rm_rcd),
        	.deq 		(retire_rcd_deq), 
		.data_out 	(sr_err_dout),
		.full 		(rm2cm_rcd_full),
        	.empty 		(sr_err_empty),
        	.overflow	(),
        	.underflow	()
		);


endmodule 
