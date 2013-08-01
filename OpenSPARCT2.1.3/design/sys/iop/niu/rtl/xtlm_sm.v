// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xtlm_sm.v
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
 * File Name    : xtlm_sm.v
 * Author Name  : John Lo
 * Description  : This module is used to gnerate txfifo_rd_en, 
 *                tx_on.
 * Parent Module: tx_xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 5/24/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module xtlm_sm (   
tx_clk,
tx_reset,
link_up,
txfifo_empty_txclk,
txfifo_unload_rdy,
tx_enable_txclk,
eop_tag,
ipg_done,
ipg_done_lead,
max_pkt_size_limit_txclk,
min_pkt_size_limit_txclk,
`ifdef ENABLE_XMAC_PAD_64_BYTES
cond1,
cond2,
cond3,
cond4,
`else
`endif
pause,
// outputs
txfifo_rd_en,
tx_on,          // exclude pa_time
tx_on_half,
set_back2back,
pa_time,
txfifo_xfr_err,
tx_max_pkt_size_err,
set_tx_pkt_ok,
restart_ipg_timer,
eop_txclk,
add_fcs,
force_tx_err,
txfifo_underrun_txclk,
xtlm_state
);

   input       tx_clk;
   input       tx_reset;
   input       link_up;
   input       txfifo_unload_rdy;
   input       tx_enable_txclk;
   input       txfifo_empty_txclk;
   input       eop_tag; // Hi or Low eop pulse
   input       ipg_done;
   input       ipg_done_lead;
   input       max_pkt_size_limit_txclk;
   input       min_pkt_size_limit_txclk;
`ifdef ENABLE_XMAC_PAD_64_BYTES
   input       cond1; // 63~61 
   input       cond2; // 60~57
   input       cond3; // 56~49
   input       cond4; // 48~1
`else
`endif
   input       pause;
// outputs
   output      txfifo_rd_en;
   output      tx_on;          // exclude pa_time
   output      tx_on_half;
   output      set_back2back;
   output      pa_time;
   output      txfifo_xfr_err;
   output      tx_max_pkt_size_err;
   output      set_tx_pkt_ok;
   output      restart_ipg_timer;
   output      eop_txclk;
   output      add_fcs;
   output      force_tx_err;
   output      txfifo_underrun_txclk;
   output [2:0]xtlm_state;

   reg 	       txfifo_underrun_txclk;
   reg 	       force_tx_err;
   reg         txfifo_rd_en;
   reg 	       tx_on_half;
   reg         pa_time;
   reg 	       eop_txclk;
   reg 	       add_fcs;
   reg         txfifo_xfr_err;
   reg 	       tx_max_pkt_size_err ;
   reg 	       set_tx_pkt_ok;
   reg 	       set_back2back;
   reg         restart_ipg_timer;
   reg [2:0]   nx_xtlm_state;

   wire [2:0]  xtlm_state;
   parameter   IDLE      = 3'b000,  // 0
	       RD_DATA   = 3'b100,  // 4  , no 2
`ifdef ENABLE_XMAC_PAD_64_BYTES
	       PAD_COND3 = 3'b101,  // 5
	       PAD_COND4 = 3'b110,  // 6
`else
`endif
	       PAD_UNDER = 3'b111,  // 7
	       PHONEY_RD = 3'b001;  // 1  , no 7 // read/flush out remaining packet.

assign tx_on = xtlm_state[2];

//   assign      tx_on = (xtlm_state == RD_DATA)     |
//                       (xtlm_state == PAD_COND3)   |
//                       (xtlm_state == PAD_COND4)   |
//                       (xtlm_state == PAD_UNDER)   ;

/* ----------------------- com part ----------------------- */
always @ (xtlm_state or eop_tag or txfifo_unload_rdy or
          ipg_done or pause or tx_enable_txclk or link_up or
          ipg_done_lead or 
          min_pkt_size_limit_txclk or txfifo_empty_txclk  or
          max_pkt_size_limit_txclk
`ifdef ENABLE_XMAC_PAD_64_BYTES
          or 
          cond1 or cond2 or cond3 or cond4
`else
`endif
)
  begin
     nx_xtlm_state          = IDLE;
     txfifo_rd_en           =    0;
     tx_on_half             =    0;
     set_back2back          =    0;
     pa_time                =    0;
     txfifo_xfr_err         =    0; // a delay version of force_tx_err.
     tx_max_pkt_size_err    =    0;
     set_tx_pkt_ok          =    0;
     restart_ipg_timer      =    0;
     eop_txclk              =    0;
     add_fcs                =    0;
     force_tx_err           =    0;
     txfifo_underrun_txclk  =    0;

     casex(xtlm_state) // synopsys parallel_case full_case
       IDLE:
	 if (eop_tag) // packet is <= 16 bytes
	   begin // phoney read
              nx_xtlm_state          = xtlm_state;
              txfifo_rd_en           =    1; // phoney read
	      txfifo_xfr_err         =    1;
           end // if (eop_tag)
       
	 else if(txfifo_unload_rdy & ipg_done & ~pause & tx_enable_txclk & link_up) // (~eop_tag) 
	   begin // normal data transfer
	      nx_xtlm_state          = RD_DATA;
              pa_time                =    1; // pulse
	      if (ipg_done_lead)
		  set_back2back      =    1;
	   end // if (~txfifo_empty_txclk & ipg_done)
         else nx_xtlm_state          = xtlm_state;  // stay

       RD_DATA:
         casex({eop_tag,min_pkt_size_limit_txclk,txfifo_empty_txclk}) // synopsys parallel_case full_case
           3'b0x0: begin  // normal reading
	             if (max_pkt_size_limit_txclk)
                       begin
	                 nx_xtlm_state          = PHONEY_RD;
                         tx_max_pkt_size_err    = 1;
                         eop_txclk              = 1;
	                 force_tx_err           = 1;
                       end // if (max_pkt_size_limit_txclk)
	             else
		       begin
  	                 nx_xtlm_state          = xtlm_state; // stay
                         txfifo_rd_en           = 1; // valid read
                       end // else: !if(max_pkt_size_limit_txclk)
	           end // case: 3'b0x0
	   
           3'b001: begin  // txfifo underrun
	                 nx_xtlm_state          = PHONEY_RD;
                         eop_txclk              = 1;
	                 force_tx_err           = 1;
	                 txfifo_underrun_txclk  = 1;
	           end // case: 3'b001
	   
           3'b011: begin
	                 nx_xtlm_state          = PAD_UNDER;
	           end // case: 3'b011
	   
           3'b100: begin // normal ending
	                 nx_xtlm_state          = IDLE;
                         txfifo_rd_en           = 1; // valid read
	                 restart_ipg_timer      = 1;
	                 set_tx_pkt_ok          = 1;
	                 eop_txclk              = 1;
	           end // case: 3'b100
	   
           3'b1x1: begin // impossible condition
	                 nx_xtlm_state          = IDLE;
                         txfifo_rd_en           = 1; // valid read
                   end // case: 3'b1x1
	   
`ifdef ENABLE_XMAC_PAD_64_BYTES
           3'b110: begin // pad the min pkt 
                         txfifo_rd_en           = 1; // valid read
	             if (cond1) // 61~63
		       begin
	                 nx_xtlm_state          = IDLE;
                         add_fcs                = 1;
	                 restart_ipg_timer      = 1;
	                 set_tx_pkt_ok          = 1;
	                 eop_txclk              = 1;
                       end // if (cond1)
	             else if (cond2) // 57~60
		       begin
	                 nx_xtlm_state          = IDLE;
                         add_fcs                = 1;
                         tx_on_half             = 1;
	                 restart_ipg_timer      = 1;
	                 set_tx_pkt_ok          = 1;
	                 eop_txclk              = 1;
                       end // if (cond2)
	             else if (cond3) // 49~56
		       begin
	                 nx_xtlm_state          = PAD_COND3;
                       end // if (cond4)
	             else if (cond4) // 1~48
		       begin 
	                 nx_xtlm_state          = PAD_COND4;
                       end // if (cond4)
	             else 
		       begin
			 // synopsys translate_off
			 // synopsys translate_on
                         nx_xtlm_state          = IDLE;
                       end
                   end // case: 3'b110
`else
`endif	   
           default:
                   begin // impossible condition
	                 nx_xtlm_state          = IDLE;
	           end // case: default
	 endcase // casex({eop_tag,min_pkt_size_limit_txclk,txfifo_empty_txclk})
	 
`ifdef ENABLE_XMAC_PAD_64_BYTES
       PAD_COND3:
	 begin // same as cond2
	                 nx_xtlm_state          = IDLE;
                         add_fcs                = 1;
                         tx_on_half             = 1;
	                 restart_ipg_timer      = 1;
	                 set_tx_pkt_ok          = 1;
	                 eop_txclk              = 1;
         end
       
       PAD_COND4:
	 begin
	    if (~cond3)
	      begin
	                 nx_xtlm_state          = xtlm_state;
              end // if (~cond3)
	    else
	      begin
	                 nx_xtlm_state          = PAD_COND3;
              end // else: !if(~cond3)
         end
       

       PAD_UNDER:
	 begin
	    if (min_pkt_size_limit_txclk)
	      begin
	                 nx_xtlm_state          = xtlm_state; // stay
              end 
	    else
	      begin
	                 nx_xtlm_state          = PHONEY_RD;
                         eop_txclk              = 1;
                         restart_ipg_timer      = 1;
	                 force_tx_err           = 1;
              end
         end // case: PAD_UNDER
`else
`endif	   

       PHONEY_RD: 
	 casex({eop_tag,txfifo_empty_txclk}) // synopsys parallel_case full_case
	     2'b00: begin
	                 nx_xtlm_state          = xtlm_state; // stay
                         txfifo_rd_en           = 1; // phoney read
                    end // case: 2'b00
	     2'b01: begin
	                 nx_xtlm_state          = xtlm_state; // stay
                    end // case: 2'b01
	     2'b1x: begin
	                 nx_xtlm_state          = IDLE;
                         txfifo_rd_en           = 1; // phoney read
                         txfifo_xfr_err         = 1;
                    end // case: 2'b1x
             default:begin 
			 // synopsys translate_off
                         $display("( Warning: PHONEY_RD in unknown state.)");
			 // synopsys translate_on
	                 nx_xtlm_state          = IDLE;
		     end
	 endcase // casex({eop_tag,txfifo_empty_txclk})
      
       default:
	 begin 
                         nx_xtlm_state          = IDLE;
                         txfifo_rd_en           =    0;
                         tx_on_half             =    0;
                         set_back2back          =    0;
                         pa_time                =    0;
                         txfifo_xfr_err         =    0;
                         tx_max_pkt_size_err    =    0;
                         set_tx_pkt_ok          =    0;
                         restart_ipg_timer      =    0;
                         eop_txclk              =    0;
                         add_fcs                =    0;
                         force_tx_err           =    0;
	                 txfifo_underrun_txclk  =    0;
	 end // case: endcase...
     endcase // casex(xtlm_state)
  end // always @ (tx_clk or xtlm_state or eop_tag or txfifo_unload_rdy or...
   
   
// seq part 
RegRst #(3) xtlm_state_RegRst(.din(nx_xtlm_state),
                              .clk(tx_clk),
                              .reset(tx_reset),
                              .qout(xtlm_state));
   
endmodule // xtlm_sm


   
