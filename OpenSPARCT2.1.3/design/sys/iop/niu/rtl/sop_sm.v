// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sop_sm.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : sop_sm
 * Author Name  : John Lo
 * Description  : start of frame deliminter detection state machine.
 *                It looks at two different data point at different time.
 * 
 *                In the initial state CHK_SOP sop_sm looks at 
 *                xrc_a, xrc_b, xrd_a, xrd_b.
 *                S_detected is used at this state.
 * 
 *                After S is verify, sop_sm is in CHK_T_E state and looks at 
 *                rxc_a, rxc_b, rxd_a, rxd_b.
 *                T_detected_at_modified_pkt and RR_detected_at_modified_pkt
 *                are used at this state.
 * 
 * Parent Module: rx_xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 7/19/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : complete redesign on 5/29/03 to take care of 
 *                64 bit xpcs intf.
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/
  
module sop_sm (   
rx_clk,
rx_reset,
S_D,
S_I,
D_S,
I_S,
S_detected, 
T_detected_at_modified_pkt,   
MID_PKT_ERR_detected_at_modified_pkt,   
rxfifo_full_rxclk,
rxfifo_afull_rxclk,
link_fault,
// outputs
set_data_ready,
rst_data_ready,
set_sel,
rst_sel,
sop_state
		  );
   
   
   input           rx_clk;
   input 	   rx_reset;
   input 	   S_D;
   input 	   S_I;
   input 	   D_S;
   input 	   I_S;
   input 	   S_detected; 
   input 	   T_detected_at_modified_pkt;   
   input 	   MID_PKT_ERR_detected_at_modified_pkt;   
   input 	   rxfifo_full_rxclk;
   input 	   rxfifo_afull_rxclk;
   input 	   link_fault;
                   // outputs
   output 	   set_data_ready;
   output 	   rst_data_ready;
   output [1:0]	   set_sel;
   output [1:0]	   rst_sel;
   output          sop_state;
   
   reg 		   set_data_ready;
   reg 		   rst_data_ready;
   reg [1:0]	   set_sel;
   reg 	[1:0]	   rst_sel;
   reg             nx_sop_state;// next state
   wire            sop_state;   // current state
   wire 	   S_D,S_I,D_S,I_S;

   // ------------------------------------------------
   // truth talbe
   // --------------------------  --------------------
   //  xrc_a   xrc_b   encode     comments
   // ------- ------- ----------  --------------------
   //    S       D      2'b00     no action
   //
   //    S       I      2'b01     pull b   (abnormal)
   //
   //    D       S      2'b10     swap a&b (abnormal)
   //
   //    I       S      2'b11     swap a&b + pull a
   // ------------------------------------------------
   //
   // comments: 
   // 1. whenever the I is detected,
   //    the rxc_a_p1/rxc_b_p1 is used.
   // 2. sel[1]: is the swap enable bit
   //    sel[0]: is the delay bit.

   parameter 	   CHK_SOP  = 1'b0,
		   CHK_T_E  = 1'b1;

/* ----------------------- com part ----------------------- */
always @ (sop_state or rxfifo_full_rxclk or rxfifo_afull_rxclk or 
          link_fault or S_detected or S_D or S_I or D_S or I_S or
          T_detected_at_modified_pkt or MID_PKT_ERR_detected_at_modified_pkt)
  begin
    nx_sop_state    = CHK_SOP;
    set_data_ready  = 0;
    rst_data_ready  = 0;
    set_sel         = 0;
    rst_sel         = 0;
    case (sop_state) // synopsys parallel_case full_case
      CHK_SOP:  if (rxfifo_full_rxclk | rxfifo_afull_rxclk | 
                    link_fault | ~S_detected)
                  begin
	                 nx_sop_state    = sop_state; // stay
                         rst_data_ready  = 1;
                  end 
                else
                  begin
                         nx_sop_state    = CHK_T_E;
                         set_data_ready  = 1;
                    case({S_D,S_I,D_S,I_S})
                           4'b1000: begin
                                    set_sel= 2'b00;
                                    rst_sel= 2'b11;
			            end
                           4'b0100: begin
                                    set_sel= 2'b01;
                                    rst_sel= 2'b10;
			            end
                           4'b0010: begin
                                    set_sel= 2'b10;
                                    rst_sel= 2'b01;
			            end
                           4'b0001: begin
                                    set_sel= 2'b11;
                                    rst_sel= 2'b00;
			            end
                           default: begin
                                    set_sel= 2'b00;
                                    rst_sel= 2'b00;
			            end
                    endcase
                  end 
      
      CHK_T_E:  if (rxfifo_full_rxclk | rxfifo_afull_rxclk |
                    link_fault | T_detected_at_modified_pkt | (~T_detected_at_modified_pkt & MID_PKT_ERR_detected_at_modified_pkt))
                  begin
	                 nx_sop_state    = CHK_SOP;
                         rst_data_ready  = 1;
                  end 
                else     nx_sop_state    = sop_state; // stay

      default:  begin
                         nx_sop_state    = CHK_SOP;
                         set_data_ready  = 0;
                         rst_data_ready  = 0;
                         set_sel         = 0;
                         rst_sel         = 0;
	        end
    endcase // case(sop_state)
  end // always @ (sop_state or S_detected_R or S_detected_F or...
   


// seq part
RegRst #(1) sop_state_RegRst(.clk(rx_clk),.reset(rx_reset),.din(nx_sop_state),.qout(sop_state));
   
endmodule // sop_sm

