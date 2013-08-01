// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mgrlm_sm.v
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
 * File Name    : mgrlm_sm
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: rx_mii_gmii
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 10/4/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module mgrlm_sm (
   rx_nbclk,
   rx_reset_nbclk,
   rx_enable_nbclk,
   rx_det_sfd, // ipg_done and rx_det_S are level signals.
   rx_det_eop_lv, // rx_det_sfd is level signals.
   rx_heart_beat,
   rxfifo_full_nbclk,
// outputs		
   load_ok_state,
   adjust_rx_heart_beat,	 // should be a pulse
   mgrlm_state
              );
   input          rx_nbclk;
   input 	  rx_reset_nbclk;
   input 	  rx_enable_nbclk;
   input 	  rx_det_sfd; 
   input 	  rx_det_eop_lv;
   input 	  rx_heart_beat;
   input 	  rxfifo_full_nbclk;
   output         load_ok_state;
   output         adjust_rx_heart_beat; // should be a pulse
   output         mgrlm_state;

   reg 	       adjust_rx_heart_beat;
   reg         nx_mgrlm_state;
   wire        mgrlm_state;
   wire        load_ok_state;

   parameter   IDLE       = 1'b0,
	       PAYLOAD    = 1'b1;
   
   assign      load_ok_state = (mgrlm_state == PAYLOAD);

// comb part   
always @ (mgrlm_state or rx_det_sfd or  rx_enable_nbclk or
          rxfifo_full_nbclk or rx_det_eop_lv or  rx_heart_beat)
  begin
     nx_mgrlm_state         = IDLE;
     adjust_rx_heart_beat   = 0; // should be a pulse

     casex(mgrlm_state)
       IDLE:    if (rx_det_sfd & rx_enable_nbclk & (~rxfifo_full_nbclk))
	          begin
                     nx_mgrlm_state         = PAYLOAD;
                     adjust_rx_heart_beat   = 1;
	          end
                else nx_mgrlm_state         = mgrlm_state; // stay

       PAYLOAD: if ((rx_det_eop_lv & rx_heart_beat) | rxfifo_full_nbclk)
                     nx_mgrlm_state         = IDLE; 
                else nx_mgrlm_state         = mgrlm_state; // stay
     endcase // casex(mgrlm_state)
  end

// seq part 
RegRst #(1) mgrlm_state_RegRst(.clk(rx_nbclk),
                               .reset(rx_reset_nbclk),
                               .din(nx_mgrlm_state),
                               .qout(mgrlm_state));
   
endmodule // mgrlm_sm
