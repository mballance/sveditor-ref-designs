// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xrlm_sm.v
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
 * File Name    : xrlm_sm.v
 * Author Name  : John Lo
 * Description  : xgmii receive link manager state machine.
 * Parent Module: rx_xmac
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module xrlm_sm     (
       rx_clk,
       rx_reset,
       rx_enable_rxclk,
       rx_data_valid_gmux,
       rx_data_valid_gmux_lead,//rx_1st_word_time == rx_data_valid_gmux_lead
       da_match_err,
       rxfifo_full_rxclk,
       rxfifo_afull_rxclk,
       max_pkt_size_limit,
       err_chk_dis,
       link_fault,		    
// outputs
       valid_data,
       set_err_time,
       eop,
       rx_ok,
       err_cond,
       xrlm_state
		    );
   

   input       rx_clk;
   input       rx_reset;
   input       rx_enable_rxclk;
   input       rx_data_valid_gmux;
   input       rx_data_valid_gmux_lead;//rx_1st_word_time == rx_data_valid_gmux_lead
   input       da_match_err;
   input       rxfifo_full_rxclk;
   input       rxfifo_afull_rxclk;
   input       max_pkt_size_limit;
   input       err_chk_dis;
   input       link_fault;
// outputs
   output      valid_data;
   output      set_err_time;
   output      eop;
   output      rx_ok;
   output      err_cond;
   output      xrlm_state;
   
   reg 	  valid_data;
   reg 	  set_err_time;
   reg 	  eop;
   reg 	  nx_xrlm_state;
   wire	  xrlm_state;
   wire   rx_ok,err_cond;
   // rx_1st_word_time == rx_data_valid_gmux_lead
   assign  rx_ok = rx_data_valid_gmux_lead & !da_match_err & ~link_fault & 
              ~(rxfifo_afull_rxclk | rxfifo_full_rxclk) & rx_enable_rxclk;
   
   // There is no min_pkt_size_err,crc_err. Since rlm_sm won't be able
   // to see them in time.
   assign  err_cond = link_fault | rxfifo_afull_rxclk | (~err_chk_dis & ( max_pkt_size_limit));
   

 parameter IDLE          = 1'h0,
           RX_BODY       = 1'h1;
   
// com part
always @ (xrlm_state or 
          rx_ok or rx_data_valid_gmux or
          err_cond )
  begin
    nx_xrlm_state= IDLE;
    valid_data   = 1'b0;
    set_err_time = 1'b0;
    eop          = 1'b0;

    casex(xrlm_state)  // synopsys parallel_case full_case
      IDLE:
 	if (rx_ok)
 	  begin
 	     nx_xrlm_state= RX_BODY;
	     valid_data   = 1;
 	  end // if (rx_ok)
 	else 
          begin 
	     nx_xrlm_state= xrlm_state;
	     valid_data   = 0;
	  end // else: !if(rx_ok)

      RX_BODY:
        begin
	     valid_data   = 1;
	if (err_cond)                                                
	  begin
 	     nx_xrlm_state= IDLE;
	     set_err_time = 1;
	     eop          = 1;
	     valid_data   = 0;
	  end // if (err_cond)
	else if (~rx_data_valid_gmux)
	  begin
 	     nx_xrlm_state= IDLE;
	     eop          = 1;
	     valid_data   = 0;
	  end // if (~rx_data_valid_gmux)
	else
          begin
             nx_xrlm_state= RX_BODY;
	     valid_data   = 1;
	  end // else: !if(~rx_data_valid_gmux)
	end // case: RX_BODY

      default: 
	begin
 	     nx_xrlm_state= IDLE;
             valid_data   = 1'b0;
             set_err_time = 1'b0;
             eop          = 1'b0;
	     // synopsys translate_off
             $display("( Warning: xrlm_state in unknown state.)");
	     // synopsys translate_on
	end // case: default
    endcase // casex(xrlm_state)
  end // always @ (xrlm_state or...
   
   

// seq part
RegRst #(1) xrlm_state_RegRst(.din(nx_xrlm_state),
                              .clk(rx_clk),
                              .reset(rx_reset),
                              .qout(xrlm_state));

endmodule // xrlm_sm


