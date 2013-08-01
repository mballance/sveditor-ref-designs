// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_rmu_rrm_erel.v
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
module dmu_rmu_rrm_erel (
			clk,
			rst_l,
		
			// Outputs to JBC Block - PIO credit release 
			d2j_p_wrack_tag,
			d2j_p_wrack_vld,

			// Inputs from ILU (EIL) Block - Release Record for PIO Cpl/DMA Rd
			y2k_rel_rcd,
			y2k_rel_enq,

			// Outputs to CLU
  			rm2cl_bufrel,
  			rm2cl_bufrel_enq,

  			// Internal sub-block Inputs - PIO Transaction Credit Record
  			lrm2rrm_cpl,
			lrm2rrm_cpl_enq,

			// Outputs for idle port
			i_pio_rel_empty,
			e_pio_rel_empty,

			// Outputs for debug port visibility
			rel_state,
		
			// npwr wrack to crm
			rm2crm_npwr_wrack
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
  //  JBC Interface 
  //------------------------------------------------------------------------

  // Copy of original JBC PIO request tag - and corresponding valid signal 
  // PIO credit release mechanism - 4 bit tag
  output  [`FIRE_D2J_P_WRACK_WDTH-1:0]	d2j_p_wrack_tag; 
  output				d2j_p_wrack_vld; 
 
  
  //------------------------------------------------------------------------
  //  ILU Interface
  //------------------------------------------------------------------------
 
  // 9 bit Downbound Release Rcd from EIL - (PIO Cpl and DMA Rd buffer release)
  input [`FIRE_DLC_DRR_REC_WDTH-1:0]	y2k_rel_rcd;
  input					y2k_rel_enq;
 

  //------------------------------------------------------------------------
  //  CLU Interface
  //------------------------------------------------------------------------

  //  DMA Rd Buffer Release Record - 5 bit DOU Buffer Release
  output [`FIRE_DLC_DOU_REL_WDTH-1:0]	rm2cl_bufrel;
  output				rm2cl_bufrel_enq;
  
  //------------------------------------------------------------------------
  //  Sub-block Interface to SRM
  //------------------------------------------------------------------------
 
  // 4 bit (non-posted) PIO Transaction Credit Record
  input  [`FIRE_DLC_RMU_LRM_REL_WDTH-1:0]	lrm2rrm_cpl;
  input						lrm2rrm_cpl_enq;

  
  //------------------------------------------------------------------------
  //  Outputs (local) for Idle check Debug Port Visibility
  //------------------------------------------------------------------------
  
  output					e_pio_rel_empty;
  output					i_pio_rel_empty;

  output  [1:0]					rel_state; // Simple Dequeue-Priority FSM
		
  output					rm2crm_npwr_wrack;
  
//############################################################################
//				PARAMETERS
//############################################################################

  // Simple State Machine for DeQueuing Ingress or Egress Release FIFO's
  parameter	
  	NUM_STATES	= 2;

  parameter
  	E_PRIORITY	= 0,				// State Machine Parameter
	I_PRIORITY	= 1;				// Dequeue/Priority FSM
 

  // PIO Release Rcd FIFO paramaters
  parameter
  	REL_WDTH		=	`FIRE_D2J_P_WRACK_WDTH,	// 4 bit tag
  	REL_DPTH		=	4'd15,			// Max Cr - 1
  	REL_PTR_WDTH 		=	4, 			// 3'b000-3'b111	
  	REL_DPTH_MINUSONE	=	4'd14;			// Depth - 1


//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################


  //**************************************************
  // 	Internal Sub-Block Wires 
  //**************************************************

  wire	[`FIRE_DLC_DOU_REL_WDTH-1:0]	next_rm2cl_bufrel;	// 5 bit DMA Rd Buf Release
  wire					next_rm2cl_bufrel_enq;

  wire	[3:0]				e_pio_rel;		// Posted PIOW Release In
  wire					e_pio_rel_enq;		// Write FIFO
  wire					e_pio_rel_empty;	// FIFO Empty
  
  wire	[3:0]				e_pio_rel_dout;		// Posted PIOW Release Out

  // wire [3:0]				i_pio_rel;		// Non Posted PIO Release In
  // wire				i_pio_rel_enq;
  //
  // Note: Above (2) signals come directly from SRM sub block - lrm2rrm_cpl, lrm2rrm_cpl_enq 
  //       - and although they are inputs to the i_pio_rel fifo - I'm not remaning inputs

  wire					i_pio_rel_empty;	// FIFO Empty
  wire	[3:0] 				i_pio_rel_dout;		// Non Posted PIO Rel Out

		
  wire	[`FIRE_D2J_P_WRACK_WDTH-1:0]	next_d2j_p_wrack_tag; 	// 4 bit PIO Credit Release
  wire					next_d2j_p_wrack_vld; 	// Valid bit for Credit Release

  //**************************************************
  // 	Registers that Are Not Flops 
  //**************************************************

  reg					ld_e_pio_rel;		// Dequeue Posted PIO Wr Rel
								// - from Egress Rel path fifo
  reg					ld_i_pio_rel;		// Dequeue Non Posted Wr Rel
								// - Ingress Rel path fifo

  
  //**************************************************
  // 	Registers that Are Flops 
  //**************************************************
 
  reg	[4:0]				rm2cl_bufrel;		// DMA Rd Buffer Release
  reg					rm2cl_bufrel_enq;	// - registered outputs

  reg	[`FIRE_D2J_P_WRACK_WDTH-1:0]	d2j_p_wrack_tag; 	// 4 bit PIO Credit Release
  reg					d2j_p_wrack_vld; 	// Valid bit for Credit Release

  reg	[NUM_STATES-1:0]		rel_state, 		// Simple Dequeue-Priority FSM
  					next_rel_state;		

  
//############################################################################
//		    		ZERO IN CHECKERS  
//############################################################################    
   
  // NOTE1: Need to closely watch the FIFO overflow, underflow flags - 
  //        built into simple_fifo module

  // 0in one_hot -var rel_state 


//############################################################################
//		    		COMBINATIONAL LOGIC
//############################################################################   
		

  //--------------------------------------------------------------------------
  //    Posted PIO write Buffer Release Inputs - PIO Credit Release from EIL
  //--------------------------------------------------------------------------

		// y2k_rel[8] = Type field -> 0 = Posted PIO MWr
  assign	e_pio_rel_enq	=	(~y2k_rel_rcd[8] & y2k_rel_enq) ?	1'b1 :	1'b0;

  		// 4 bit Posted PIO Wr tag lower 4 bits of 9 bit field
  assign	e_pio_rel	=	y2k_rel_rcd[3:0];

  
  //--------------------------------------------------------------------------
  //    DMA Rd buffer Release Combinatorial Logic - Feeds Registered Outputs
  //--------------------------------------------------------------------------

		// y2k_rel[8] = Type field -> 1 = DMA Rd Buf Release
  assign	next_rm2cl_bufrel_enq	=	(y2k_rel_rcd[8] & y2k_rel_enq) ?	1'b1 :	1'b0;

		// 5 bit DMA buffer d_ptr to be released - when Type 1 (DMA Read)
  assign	next_rm2cl_bufrel 	=	y2k_rel_rcd[4:0];			
		

  //--------------------------------------------------------------------------
  //	PIO Credit Release Logic - (E-Posted PIO Wr or I-Non Posted PIO Wr) 
  //--------------------------------------------------------------------------

  assign	next_d2j_p_wrack_vld 	=	(ld_e_pio_rel | ld_i_pio_rel);

  assign	rm2crm_npwr_wrack	= 	ld_i_pio_rel;	//BP 12-02-05 wrack to crm for npwr
  

  //--------------------------------------------------------------------------
  // 	PIO Credit Release Tag to JBC - simple MUX select at Input of Register
  //--------------------------------------------------------------------------

  assign	next_d2j_p_wrack_tag	=	ld_e_pio_rel ? e_pio_rel_dout : i_pio_rel_dout;


//############################################################################
//		    		SEQUENTIAL LOGIC
//############################################################################   
   	
  //-----------------------------------------------------------------------------------
  // rm2cm_bufel - DMA Credit Release - DMA Rd Data Buffer Release to CLU - 5 bit d_ptr 
  //-----------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
    	begin
	    rm2cl_bufrel 	<= 	`FIRE_DLC_DOU_REL_WDTH'b0;	// 5 bit Buf Rel Rcd
	    rm2cl_bufrel_enq	<=	1'b0;				// Buffer Release Enqueue
	end
    else
        begin
	    rm2cl_bufrel 	<=	next_rm2cl_bufrel;
	    rm2cl_bufrel_enq	<=	next_rm2cl_bufrel_enq;
	end


  //-------------------------------------------------------------------------------
  // d2j_p_wrack_tag - PIO Credit Release Registered Outputs to JBC - 4 bit pio tag
  //-------------------------------------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
    	begin
	    d2j_p_wrack_tag	<= 	`FIRE_D2J_P_WRACK_WDTH'b0;	// 4 bit PIO Release
	    d2j_p_wrack_vld	<=	1'b0;				// Release Valid bit
	end
    else
        begin
	    d2j_p_wrack_tag	<=	next_d2j_p_wrack_tag;
	    d2j_p_wrack_vld	<=	next_d2j_p_wrack_vld;
	end


//--------------------------------------------------------------------------
//    Simple PIO Credit Release Round Robin Priority Encoder FSM
//--------------------------------------------------------------------------
    

  //-----------------------------------------------------
  // PIO Release Priority State Machine Sequential Logic
  //-----------------------------------------------------

  always @ (posedge clk)
    if (~rst_l)
	begin
  	    rel_state[NUM_STATES-1:0]	<= {NUM_STATES{1'b0}};	
	    rel_state[E_PRIORITY] 	<= 1'b1;
    	end
    else
    	begin
	    rel_state			<= next_rel_state;
	end
	
  //-------------------------------------------------------------------
  // PIO Release Dequeue and Priority State Machine Combinatorial Logic
  //-------------------------------------------------------------------


always @ ( rel_state or e_pio_rel_empty or i_pio_rel_empty )
  begin
    next_rel_state 	= {NUM_STATES{1'b0}};
    ld_e_pio_rel	=	1'b0;			// Posted WR PIO Rel - from Egress
    ld_i_pio_rel	=	1'b0;			// Non Posted PIO Rel - from Ingress
	

    case(1'b1)	// synopsys parallel_case

	rel_state[E_PRIORITY] :					// Posted PIOW given initial Priority
		
    	    if (~e_pio_rel_empty)				// Posted PIOW Release needs service
    		begin
		    ld_e_pio_rel		=	1'b1;
		    ld_i_pio_rel		= 	1'b0;
		    next_rel_state[I_PRIORITY]	= 	1'b1;	// Change Priority to Ingress Path
		end

	    else if (~i_pio_rel_empty)				// OK - do a Non Posted PIO Release 
    		begin
		    ld_e_pio_rel		=	1'b0;
		    ld_i_pio_rel		= 	1'b1;
		    next_rel_state[E_PRIORITY]	= 	1'b1;	// BUT keep priority on Posted PIO
		end

	    else 
    		begin
		    ld_e_pio_rel		=	1'b0;
		    ld_i_pio_rel		= 	1'b0;
		    next_rel_state[E_PRIORITY]	= 	1'b1;	// Nothing Happening Stay Here!
		end


	rel_state[I_PRIORITY] :					// Non Posted PIOW has Priority
		
    	    if (~i_pio_rel_empty)				// Posted PIOW Release needs service
    		begin
		    ld_e_pio_rel		=	1'b0;
		    ld_i_pio_rel		= 	1'b1;
		    next_rel_state[E_PRIORITY]	= 	1'b1;	// Change Priority to Egress Path
		end

	    else if (~e_pio_rel_empty)				// OK - do a Posted PIO Release 
    		begin
		    ld_e_pio_rel		=	1'b1;
		    ld_i_pio_rel		= 	1'b0;
		    next_rel_state[I_PRIORITY]	= 	1'b1;	// BUT keep priority on Non Posted PIO
		end

	    else 
    		begin
		    ld_e_pio_rel		=	1'b0;
		    ld_i_pio_rel		= 	1'b0;
		    next_rel_state[I_PRIORITY]	= 	1'b1;	// Nothing Happening Stay Here!
		end
    endcase
  end



//############################################################################
//		    		MODULE INSTANTIATIONS
//############################################################################    		

  //--------------------------------------------------------------------------
  // PIO Release FIFO's in RRM - E = Egress or Posted Wr Release FIFO
  //				 I = Ingress or Non Posted Wr Release FIFO
  //
  // Parameters to be passed into Common Simple FIFO 
  //	REL_WDTH		=	`FIRE_D2J_P_WRACK_WDTH	= 4 bit tag
  //	REL_DPTH		=	4'd15			= (Max Cr Size-1)
  // 	REL_PTR_WDTH 		=	4			= 3'b000-3'b111	
  //	REL_DPTH_MINUSONE	=	4'd14			= Depth-1
  //
  //
  //	Release FIFO registers = 4 * 15 = 60 registers each
  //
  //--------------------------------------------------------------------------


dmu_common_simple_fifo #(REL_WDTH,REL_DPTH,REL_PTR_WDTH,REL_DPTH_MINUSONE) e_pio_rel_fifo(
		.clk			(clk),
                .rst_l			(rst_l),

                .data_in		(e_pio_rel),
                .write			(e_pio_rel_enq),

                .data_out		(e_pio_rel_dout),
                .read			(ld_e_pio_rel),

                .fifo_full		(),
                .fifo_almost_full	(),
                .fifo_empty		(e_pio_rel_empty)

     );	

dmu_common_simple_fifo #(REL_WDTH,REL_DPTH,REL_PTR_WDTH,REL_DPTH_MINUSONE) i_pio_rel_fifo(
		.clk			(clk),
                .rst_l			(rst_l),

                .data_in		(lrm2rrm_cpl),
                .write			(lrm2rrm_cpl_enq),

                .data_out		(i_pio_rel_dout),
                .read			(ld_i_pio_rel),

                .fifo_full		(),
                .fifo_almost_full	(),
                .fifo_empty		(i_pio_rel_empty)

     );	

endmodule 
