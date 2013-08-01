// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_rrm_etsbfsm.v
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
module dmu_rmu_rrm_etsbfsm (
				
			clk,
			rst_l,
		
			// Outputs to TSB - Egress Pipeline
			rm2ts_e_cmd_type,
			rm2ts_e_req,

			// Inputs from TSB
			ts2rm_e_gnt,
			
			// Outputs to EFSM module
			tsb_fsm_idle,
			ld_epe_rcd_tsb,

			// Inputs from EFSM module
			gen_tsb_access,
			sr_err_last_pkt,

			// Output (local) for debug visibility
			e_tsb_state
			);
		
// synopsys sync_set_reset "rst_l"		
				
//############################################################################
//				PORT DECLARATIONS
//############################################################################

  //------------------------------------------------------------------------
  //  Clock and Reset Signals      
  //------------------------------------------------------------------------
  input 	clk;
  input		rst_l; 


  //------------------------------------------------------------------------
  //  TSB Interfacs
  //------------------------------------------------------------------------
		
  output [`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0] 	rm2ts_e_cmd_type;	// 4 bit TSB Cmd
  output					rm2ts_e_req;

  input						ts2rm_e_gnt;


  //------------------------------------------------------------------------
  //  Egress FSM Interface
  //------------------------------------------------------------------------
		
  output	tsb_fsm_idle;				// TSB fsm IDLE
  output	ld_epe_rcd_tsb;				// TSB Read Data Valid
  
  input		gen_tsb_access;				// Kick off TSB FSM
  input		sr_err_last_pkt;			// DMA Cpl LAST Packet bit set


  //------------------------------------------------------------------------
  //  Outputs (local) for Debug Port Visibility
  //------------------------------------------------------------------------
	 
  output  [3:0]						e_tsb_state;	// 1-hot Egress FSM	


//############################################################################
//				PARAMETERS
//############################################################################

  // TSB Command Decode 
  parameter
 	ETSB_CMD_NULL		=	4'b0000,	// Initial Value - NULL - can be removed
 	ETSB_CMD_RDCLR		=	4'b0011,	// Read/Clr - ie: last_pkt=1
  	ETSB_CMD_RD		=	4'b0001,	// Read bcnt - ie: last_pkt=0
	ETSB_CMD_WR		=	4'b0100;	// Write back remaining bcnt

  
// Egress TSB Control Finite State Machine Parameters
	
  parameter
  	ETSB_IDLE    	=	0,			// E_TSB FSM Idle
	ETSB_RDCLR	=	1,			// Issue READ/CLEAR and retire TRN
	ETSB_RD		=  	2,			// Issue READ command to TSB
	ETSB_WR		=	3; 			// Issue WRITE command to TSB
	
  parameter
  	NUM_STATES = 	4;



//############################################################################
//		DECLARE Module Wires and Registers
//############################################################################


  wire	ld_epe_rcd_tsb;				// TSB Rd Data Valid -EFSM to LOAD RRM rcd 	
  wire	tsb_fsm_idle;				// TSB IDLE - ready for action
  

//--------------------------------------------------
// Registers that Are Flops 
//--------------------------------------------------

  // 	Egress TSB FSM 1-hot state machine
  reg	[NUM_STATES-1:0]		e_tsb_state, next_e_tsb_state;	// 1-hot Egress FSM	

 
  // 	Egress State Machine Registered Outputs
  reg	rm2ts_e_req, 	next_rm2ts_e_req;				// Registered E TSB REQ 

  reg	[`FIRE_DLC_TSR_CMD_TYPE_WDTH-1:0]	rm2ts_e_cmd_type, 	// Registerd E TSB Cmnd
  						next_rm2ts_e_cmd_type;	


//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    

  //---------------------------------------------------------------------
  //  Egress TSB State Machine Checkers
  //---------------------------------------------------------------------
    /* 
       0in state -var e_tsb_state 
       -val 	(4'b0001 << ETSB_IDLE) 
       -next 	(4'b0001 << ETSB_RDCLR) 
	      	(4'b0001 << ETSB_RD)
    */

    /* 
       0in state -var e_tsb_state 
       -val 	(4'b0001 << ETSB_RDCLR) 
       -next 	(4'b0001 << ETSB_IDLE)
    */

    /* 
       0in state -var e_tsb_state 
       -val 	(4'b0001 << ETSB_RD) 
       -next 	(4'b0001 << ETSB_WR)
    */

    /* 
       0in state -var e_tsb_state 
       -val 	(4'b0001 << ETSB_WR) 
       -next 	(4'b0001 << ETSB_IDLE)
    */

   // 0in one_hot -var e_tsb_state


   /* 0in kndr -var sr_err_last_pkt
      -active gen_tsb_access
    */


//############################################################################
//	    		COMBINATORIAL LOGIC
//############################################################################   

  // Output signal that tells EFSM to 
  //	1) Load EPE record since TSB Rd data valid and 
  //	2) Tells EFSM to proceed processing ERR's from TCM

  assign	ld_epe_rcd_tsb	= ((e_tsb_state[ETSB_RD] | e_tsb_state[ETSB_RDCLR]) &
  				    ts2rm_e_gnt);

  // Output that keeps Egress FSM in sync with Egress TSB FSM
  assign	tsb_fsm_idle	= e_tsb_state[ETSB_IDLE];


  
//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	

//----------------------------------------------
// Egress TSB State Machine Sequential Logic
//----------------------------------------------

always @ (posedge clk)
    if (~rst_l)
	begin
  	    e_tsb_state[NUM_STATES-1:0]	<= {NUM_STATES{1'b0}};	
	    e_tsb_state[ETSB_IDLE] 	<= 1'b1;
	    
	    rm2ts_e_req			<= 1'b0;		
	    rm2ts_e_cmd_type		<= {`FIRE_DLC_TSR_CMD_TYPE_WDTH{1'b0}};
    	end
    else
    	begin
	    e_tsb_state			<= next_e_tsb_state;
	    
	    rm2ts_e_req			<= next_rm2ts_e_req;		// State Machine Registered Outputs
	    rm2ts_e_cmd_type		<= next_rm2ts_e_cmd_type;
	end
	

//----------------------------------------------------------
// Egress TSB State Machine Combinatorial (Next State) Logic	
//----------------------------------------------------------


always @ ( e_tsb_state or gen_tsb_access or sr_err_last_pkt or ts2rm_e_gnt )

  begin
    next_e_tsb_state 		= {NUM_STATES{1'b0}};			// Default Outputs
    next_rm2ts_e_req		= 1'b0;				
    next_rm2ts_e_cmd_type	= `FIRE_DLC_TSR_CMD_TYPE_WDTH'b0;	

	
	
    case(1'b1)	// synopsys parallel_case
    		// 0in < case -full
	
    // ETSB_IDLE -Initial State
	    
    e_tsb_state[ETSB_IDLE] 	:
        
        casez({gen_tsb_access,sr_err_last_pkt})			
		
	    (2'b0z) :							// Ignore ERR including x's`
	    	begin							// until we NEED to access tsb
		    next_e_tsb_state[ETSB_IDLE]	= 1'b1;			// wait for gen_tsb_access
		    next_rm2ts_e_cmd_type	= ETSB_CMD_NULL;	// keep default value
		    next_rm2ts_e_req		= 1'b0;			// Req deasserted
		end

	    (2'b10) :
	    	begin
		    next_e_tsb_state[ETSB_RD]	= 1'b1;			// DMA Cpl - Not Last Pkt - RDWR
		    next_rm2ts_e_cmd_type	= ETSB_CMD_RD;		// Access TSB to build RRM rcd
		    next_rm2ts_e_req		= 1'b1;			// assert REQ
		end

	    (2'b11) :
	    	begin
		    next_e_tsb_state[ETSB_RDCLR]= 1'b1;			// DMA Cpl - Last Pkt - RD/CLR
		    next_rm2ts_e_cmd_type	= ETSB_CMD_RDCLR;	// Issue Read Clear command
		    next_rm2ts_e_req		= 1'b1;			// assert REQ
		end
	endcase		// ends ETSB_IDLE state case

    
    // ETSB_RD - Go get data associated with DMA Response to build RRM Record 

    e_tsb_state[ETSB_RD]	:

    	begin
	    next_rm2ts_e_req			= 1'b1;			// keep REQ asserted
	    if (ts2rm_e_gnt)						// RD completed - Start WR
		begin
		    next_e_tsb_state[ETSB_WR]	= 1'b1;			// Go to ETSB_WR state
		    next_rm2ts_e_cmd_type	= ETSB_CMD_WR;		// Issue Write command
		end
	    else
		begin
		    next_e_tsb_state[ETSB_RD]	= 1'b1;			// ~gnt - keep RD asserted
		    next_rm2ts_e_cmd_type	= ETSB_CMD_RD;	
		end
	end


    // ETSB_WR - RRM Rcd complete - write back new bcnt to TSB

    e_tsb_state[ETSB_WR]	:

	if (ts2rm_e_gnt)						// TSB WR completed 
	    begin
	   	next_rm2ts_e_req		= 1'b0;			// Deassert REQ
		next_e_tsb_state[ETSB_IDLE]	= 1'b1;			// Back to IDLE
		next_rm2ts_e_cmd_type		= ETSB_CMD_NULL;	// Command no longer Vld
	    end
	else								// GNT not yet asserted
	    begin
	    	next_rm2ts_e_req		= 1'b1;			// Keep REQ asserted
		next_e_tsb_state[ETSB_WR]	= 1'b1;			// Stay in WR state
		next_rm2ts_e_cmd_type		= ETSB_CMD_WR;		// Hold WR Cmd
	    end


    // ETSB_WR - RRM Rcd complete - write back new bcnt to TSB

    e_tsb_state[ETSB_RDCLR]	:

	if (ts2rm_e_gnt)						// RDCLR completed 
	    begin
		next_rm2ts_e_req		= 1'b0;			// Deassert REQ
		next_e_tsb_state[ETSB_IDLE]	= 1'b1;			// Back to IDLE
		next_rm2ts_e_cmd_type		= ETSB_CMD_NULL;	// Command no longer Vld
	    end
	else								// GNT not yet asserted
	    begin
	        next_rm2ts_e_req		= 1'b1;			// Keep REQ asserted
	        next_e_tsb_state[ETSB_RDCLR]	= 1'b1;			// Stay in WR state
	        next_rm2ts_e_cmd_type		= ETSB_CMD_RDCLR;	// Hold RD/CLR Cmd
	    end
    
    endcase	// Ends ETSB 1-hot FSM Case Statement
    
  end    // Ends combinatorial ETSB next state always block 
	    
endmodule 
