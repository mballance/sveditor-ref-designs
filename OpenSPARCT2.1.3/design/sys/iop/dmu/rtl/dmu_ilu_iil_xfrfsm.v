// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil_xfrfsm.v
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
module dmu_ilu_iil_xfrfsm (
				clk,
				rst_l,

				p2d_cto_req,
				p2d_cto_tag,
				d2p_cto_ack,
				n_cto_req_reg,

                                cib2iil_ihb_pe_drain, // caused by iil2cib_ihb_pe
                                cib2iil_pec_drain,    // caused by p2d_drain				
//				cib2iil_drain,
				iil2cib_ihb_pe,

				y2k_rcd_enq,
				k2y_rcd_deq,
			 
				ihb_rcd_is_cpl,
				
				iil2isb_clr,
				isb2iil_vld,

				is_ihb_rcd,
				is_cto_rcd,
				pio_tag_gen,

				ihb_empty,
				ihb_rptr_inc,

				// idle check
				iil_is_idle,

				// debug 
				state,
				is_fifo_space,
				drop_inserted_rcd  );
 
  //synopsys sync_set_reset "rst_l"

 // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // states
  parameter // summit enum xfr_enum
	    IDLE      = 0,
	    IHB       = 1,
	    CTO_WAIT  = 2,
	    CTO_SERV  = 3,
	    DRAIN     = 4;

  // num of states
  parameter STATE_NUM = 5;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock
  input		  rst_l;   	    // input reset
    

  //---------------------------------------------------------------------
  //   cto interface - PIO completion time out
  //---------------------------------------------------------------------
  input 	  p2d_cto_req;       // cto request from TLU
  input [4:0]	  p2d_cto_tag;
  output 	  d2p_cto_ack;       // cto ack back
  output 	  n_cto_req_reg;     // p2d_cto_req synchronized to iol2clk for dbg

  //---------------------------------------------------------------------
  //   drain interface
  //--------------------------------------------------------------------- 
//  input 	  cib2iil_drain;     // drain signal
  input           cib2iil_ihb_pe_drain; // caused by iil2cib_ihb_pe
  input           cib2iil_pec_drain;    // caused by p2d_drain

   
  //---------------------------------------------------------------------
  //   record interface to TMU
  //---------------------------------------------------------------------
  input 	  k2y_rcd_deq;        // record fifo dequeue
  output 	  y2k_rcd_enq;        // ingress PEC record enqueue
  
  //---------------------------------------------------------------------
  //   sub-block to sub-block interface
  //---------------------------------------------------------------------
  output 	  iil2isb_clr;       
  input 	  isb2iil_vld;

  input 	  iil2cib_ihb_pe;     // ingress header parity error, from *_parchk.v

  //---------------------------------------------------------------------
  //  IHB rcd status
  //---------------------------------------------------------------------
  input 	  ihb_rcd_is_cpl;      // to determine iil2isb_clr,    from *_rcdbldr.v

  //---------------------------------------------------------------------
  //  IHB management
  //---------------------------------------------------------------------
  input 	  ihb_empty;          //                              from *_bufmgr.v
  output 	  ihb_rptr_inc;       // advance ihb rptr,              to *_bufmgr.v

  //---------------------------------------------------------------------
  //  states releated info
  //---------------------------------------------------------------------
  output 	  is_ihb_rcd;     // in-process rcd is ihb rcd, to *_rcdbldr.v & *_crdtcnt.v
  output 	  is_cto_rcd;     // in-process rcd is CTO rcd, to *_rcdbldr.v
  output [4:0] 	  pio_tag_gen;    // pio_tag to gen cpl header,     to *_rcdbldr.v

  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output [STATE_NUM-1:0] state;
  output 		 is_fifo_space;
  output 		 drop_inserted_rcd;
  
  //---------------------------------------------------------------------
  //  idle check
  //---------------------------------------------------------------------
  output 		       iil_is_idle;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg 		  cto_req_reg;
  reg 		  d2p_cto_ack;

  reg [STATE_NUM-1:0] state;

  reg [4:0] 	  pio_tag_drain;  // loop through in drain state

  reg [2:0] 	  fifo_credit;    // TMU rcd fifo credit

  reg		  is_ihb_rcd_ps2;
  reg		  is_cto_rcd_ps2;
  reg 		  is_drain_rcd_ps2;

  reg [4:0] 	  pio_tag_ps1;
  reg [4:0] 	  pio_tag_ps2;

  reg		  y2k_rcd_enq;

  reg 		  ihb_ihb_pe_detected;
    
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg [STATE_NUM-1:0] n_state;
  
  reg [2:0] 	  n_fifo_credit; // TMU rcd next fifo credit value
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 		  n_cto_req_reg;
  wire 		  cto_req;            
  wire 		  n_cto_ack;

  wire 		  n_y2k_rcd_enq;
  
  wire [4:0] 	  pio_tag_ne0;  // muxed out from pio_tag_drain and p2d_cto_tag

  wire 		  is_ihb_rcd_ps1;
  wire 		  is_cto_rcd_ps1;
  wire 		  is_drain_rcd_ps1;

  wire 		  crdt_back;      // fifo credit when rcd need be dropped
  wire 		  cnsm_crdt;      // consume fifo credit when inject rcd in pipeline
		  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in one_hot -var state
  // 0in max -var fifo_credit -val 6
  
  // 0in known_driven -var cib2iil_ihb_pe_drain

  // 0in known_driven -var cib2iil_pec_drain
  
  /* 0in assert -var isb2iil_vld
               -active ((is_ihb_rcd_ps2 & ihb_rcd_is_cpl) | 
			 is_cto_rcd_ps2 )  */

  /* 0in state -var state -val (5'b1 << IDLE) -next
                               (5'b1 << IDLE)
                               (5'b1 << IHB)
                               (5'b1 << CTO_WAIT)
                               (5'b1 << CTO_SERV)
                               (5'b1 << DRAIN) */
  
  /* 0in state -var state -val (5'b1 << IHB) -next
                               (5'b1 << IDLE)
                               (5'b1 << IHB)
                               (5'b1 << CTO_WAIT)
                               (5'b1 << CTO_SERV)
                               (5'b1 << DRAIN) */

  
  /* 0in state -var state -val (5'b1 << CTO_WAIT) -next
                               (5'b1 << CTO_WAIT)
                               (5'b1 << CTO_SERV) */

  /* 0in state -var state -val (5'b1 << CTO_SERV) -next
                               (5'b1 << IDLE)  */

  /* 0in state -var state -val (5'b1 << DRAIN) -next
                               (5'b1 << IDLE)
                               (5'b1 << DRAIN) */ 

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  PIO completion timeout request (cto) handling in stage 0
  //---------------------------------------------------------------------
  assign cto_req = n_cto_req_reg ^ cto_req_reg;
  assign n_cto_ack = d2p_cto_ack ^ is_cto_rcd_ps1;

  always @ (posedge clk)
    if (!rst_l) begin
      d2p_cto_ack <= 1'b0;
    end
    else begin
      d2p_cto_ack <= n_cto_ack;
    end

  always @ (posedge clk)
    if (!rst_l) begin
      cto_req_reg <= {{1'b0}};
	end
    else begin
      cto_req_reg <= n_cto_req_reg;
    end
  
  //---------------------------------------------------------------------
  //  propagation through pipeline
  //---------------------------------------------------------------------
//  assign pio_tag_ne0 = cib2iil_drain ? pio_tag_drain : p2d_cto_tag;

  assign pio_tag_ne0 = n_state[DRAIN] ? pio_tag_drain : p2d_cto_tag;

  assign is_cto_rcd_ps1 = state[CTO_SERV];
  assign is_ihb_rcd_ps1 = state[IHB];
  assign is_drain_rcd_ps1 = state[DRAIN];
  
  always @ (posedge clk)
    if (!rst_l) begin
      pio_tag_ps1 <= {5{1'b0}};
      pio_tag_ps2 <= {5{1'b0}};
      is_cto_rcd_ps2 <= {{1'b0}};
      is_ihb_rcd_ps2 <= {{1'b0}};
      is_drain_rcd_ps2 <= {{1'b0}};
      y2k_rcd_enq <= {{1'b0}};
   end
    else begin
      pio_tag_ps1 <= pio_tag_ne0;
      pio_tag_ps2 <= pio_tag_ps1;
      is_cto_rcd_ps2 <= is_cto_rcd_ps1;
      is_ihb_rcd_ps2 <= is_ihb_rcd_ps1;
      is_drain_rcd_ps2 <= is_drain_rcd_ps1;
      y2k_rcd_enq <= n_y2k_rcd_enq;
    end

  assign is_ihb_rcd = is_ihb_rcd_ps2;
  assign is_cto_rcd = is_cto_rcd_ps2;
  assign pio_tag_gen = pio_tag_ps2;
  
  //---------------------------------------------------------------------
  //  fsm - stage 0
  //---------------------------------------------------------------------

  // summit state_vector state enum xfr_enum
  
  // present state
  always @ (posedge clk)
    begin
      if (!rst_l) begin
	state <= {STATE_NUM{1'b0}};
	state[IDLE] <= 1'b1;
      end
      else
	state <= n_state;
    end
  

  // next state ps 0 logic
  always @ (state or is_fifo_space or cto_req or cib2iil_ihb_pe_drain or cib2iil_pec_drain or ihb_empty)
    begin
      n_state = {STATE_NUM{1'b0}};
      case (1'b1) // 0in < case -full // synopsys parallel_case 
	
	state[IDLE],
	state[IHB]    :
	  casez ({is_fifo_space, cib2iil_ihb_pe_drain, cib2iil_pec_drain, cto_req, ihb_empty}) // 0in < case -parallel -full
	    5'b0001z:                    n_state[CTO_WAIT] = 1'b1;

	    5'b1001z:                    n_state[CTO_SERV] = 1'b1;

	    5'b0000z,                    
	    5'b10001,                    
	    5'b01zzz,                    
	    5'b001zz:                    n_state[IDLE] = 1'b1;

	    5'b11zzz,                    
	    5'b101z1:                    n_state[DRAIN] = 1'b1;

	    5'b10000,                    
	    5'b101z0:                    n_state[IHB] = 1'b1;
	  endcase // casez({is_fifo_space, cib2iil_ihb_pe_drain, cib2iil_pec_drain, cto_req, ihb_empty})
	
	state[DRAIN]  :
	  casez ({cib2iil_ihb_pe_drain, cib2iil_pec_drain, is_fifo_space}) // 0in < case -parallel -full
	    3'b011,
	    3'b1z1:                       n_state[DRAIN] = 1'b1;

            3'bzz0,
            3'b001:                     n_state[IDLE] = 1'b1;
          endcase // case({cib2iil_ihb_pe_drain, cib2iil_pec_drain, is_fifo_space})

	state[CTO_WAIT] :
	    if (is_fifo_space)          n_state[CTO_SERV] = 1'b1;
	    else   	                n_state[CTO_WAIT] = 1'b1;
	
	state[CTO_SERV]:                n_state[IDLE] = 1'b1;

      endcase // case(1'b1)
    end // always @ (state, is_fifo_space, cto_req, cib2iil_ihb_pe_drain, cib2iil_pec_drain, ihb_empty)
  
  // outputs
  assign ihb_rptr_inc = n_state[IHB];
  assign cnsm_crdt = n_state[DRAIN] | n_state[IHB] | n_state[CTO_SERV];
      
  //---------------------------------------------------------------------
  //  log iil2cib_ihb_pe to reg ihb_ihb_pe_detected as a status bit
  //---------------------------------------------------------------------
  always @(posedge clk) begin
    if (~rst_l) begin
      ihb_ihb_pe_detected <= 1'b0;
    end
    else if (iil2cib_ihb_pe) begin
      ihb_ihb_pe_detected <= 1'b1;
    end
  end

  //---------------------------------------------------------------------
  //  check if inserted rcd need be dropped
  //---------------------------------------------------------------------
  assign drop_inserted_rcd = (is_ihb_rcd_ps2 & iil2cib_ihb_pe) |
			     (is_ihb_rcd_ps2 & ihb_ihb_pe_detected) |
			     ((is_cto_rcd_ps2 | is_drain_rcd_ps2) & 
			      ~isb2iil_vld);

  assign n_y2k_rcd_enq = (is_ihb_rcd_ps2 | is_cto_rcd_ps2 | is_drain_rcd_ps2) &
			   (~drop_inserted_rcd);

  assign crdt_back = drop_inserted_rcd;
  
  //---------------------------------------------------------------------
  //  only assert iil2isb_clr when the entry is valid
  //---------------------------------------------------------------------
//  assign iil2isb_clr = isb2iil_vld & ((is_ihb_rcd_ps2 & ihb_rcd_is_cpl) | 
//			 is_cto_rcd_ps2 | is_drain_rcd_ps2);
//BP n2 4-8-05 bug 92994 rfe 2258
  assign iil2isb_clr = isb2iil_vld & 
		((is_ihb_rcd_ps2 & ihb_rcd_is_cpl & ~iil2cib_ihb_pe & ~ihb_ihb_pe_detected) 
			| is_cto_rcd_ps2 
			| is_drain_rcd_ps2);

  //---------------------------------------------------------------------
  //  TMU rcd fifo credit management
  //---------------------------------------------------------------------
  // next fifo_credit
  always @(fifo_credit or crdt_back or k2y_rcd_deq or cnsm_crdt)
    case ({crdt_back, k2y_rcd_deq, cnsm_crdt})
      3'b000: n_fifo_credit = fifo_credit;
      3'b001: n_fifo_credit = fifo_credit - 1'b1;
      3'b010: n_fifo_credit = fifo_credit + 1'b1;
      3'b011: n_fifo_credit = fifo_credit;
      3'b100: n_fifo_credit = fifo_credit + 1'b1;
      3'b101: n_fifo_credit = fifo_credit;
      3'b110: n_fifo_credit = fifo_credit + 3'b010;
      3'b111: n_fifo_credit = fifo_credit + 1'b1;
    endcase // case({crdt_back, k2y_rcd_deq, cnsm_crdt})

  // current fifo_credit
  always @(posedge clk)
    if (~rst_l)
      fifo_credit <= 3'b110;
    else
      fifo_credit <= n_fifo_credit;

  // is_fifo_space check
  assign is_fifo_space = |fifo_credit;

  //---------------------------------------------------------------------
  //  loop through scoreboad for pio_tag_drain
  //---------------------------------------------------------------------
  always @(posedge clk)
    if (~rst_l)
      pio_tag_drain <= 5'b0;
    else if (state[DRAIN])
      pio_tag_drain <= pio_tag_drain + 1'b1;

  //---------------------------------------------------------------------
  //  idle check output
  //---------------------------------------------------------------------

  assign iil_is_idle = ihb_empty & state[IDLE];

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // sync-flop instantiations for p2d_cto_req
//  pcie_common_sync_flop #(1) cto_req_sync_flop(
//                                               .clk(clk),
//                                               .din(p2d_cto_req),
//                                               .dout(n_cto_req_reg));
  cl_a1_clksyncff_4x cto_req_sync_flop ( .d(p2d_cto_req), .si(1'b0), .q( n_cto_req_reg), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

  
endmodule // dmu_ilu_iil_xfrfsm

