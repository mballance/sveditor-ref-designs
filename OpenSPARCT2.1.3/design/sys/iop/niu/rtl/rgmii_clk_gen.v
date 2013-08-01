// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rgmii_clk_gen.v
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
 * File Name    : rgmii_clk_gen.v
 * Author Name  : John Lo
 * Description  : Use 250Mhz ref clk to generate 
 *                125Mhz, 25Mhz and 2.5Mhz clocks.
 *                To generate 50% duty cycle, the ref clk has to be 250Mhz.
 * 
 * Parent Module: xmac_2pcs_clk_mux or bmcac_pcs_clk_mux
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 1-1-2003
 *
 * Copyright (c) 2008, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/



module rgmii_clk_gen (
ref_clk_250mhz,
reset,
gmii_mode,
sel_clk_25mhz,
// output
tclk_int,
// for observation
toggle,		      
cnt3,
cnt4,		      
cnt49		      
		      );

   input 	  ref_clk_250mhz;
   input 	  reset;
   input 	  gmii_mode;
   input 	  sel_clk_25mhz;
                  // output
   output 	  tclk_int;
                  // for observation
   output 	  toggle;
   output 	  cnt3;
   output 	  cnt4;
   output 	  cnt49;

   wire 	  tclk_int;
   wire 	  hw_reset_tclk;
   wire 	  d_hw_reset_tclk;
   
/* --------------- tx_rgmii_timer -------------------- */

   SYNC_CELL hw_reset_tclk_SYNC_CELL(.D(reset),.CP(ref_clk_250mhz),.Q(hw_reset_tclk));
   
   FD1 d_hw_reset_tclk_FD1(.D(hw_reset_tclk),
                           .CP(ref_clk_250mhz),
                           .Q(d_hw_reset_tclk));
   
   wire  hw_reset_tclk_lead = hw_reset_tclk & ~d_hw_reset_tclk;
// -----------------------------------------------------------------
// 250Mhz period is 4ns.
// -----------------------------------------------------------------

// -----------------------------------------------------------------
// 25Mhz  perios is 40ns.  It needs 10, 250Mhz clocks to make 40ns.    
// 5  250Mhz clocks for each edge. -> cnt4
// -----------------------------------------------------------------

// -----------------------------------------------------------------
// 2.5Mhz period is 400ns. It needs 100, 250Mhz clocks to make 400ns. 
// 50  250Mhz clocks for each edge. -> cnt49
// -----------------------------------------------------------------

   wire [5:0] 	  tx_rgmii_timer;
   wire       	  cnt3  = tx_rgmii_timer == 6'd03;
   wire       	  cnt4  = tx_rgmii_timer == 6'd04;
   wire      	  cnt49 = tx_rgmii_timer == 6'd49;
   reg 	      	  toggle;
   
   always @ (gmii_mode or sel_clk_25mhz or
             cnt4 or cnt49)
     begin
	if (gmii_mode)
	  toggle = 1'b1;    // 1G mode  freq = 125mhz
	else if (sel_clk_25mhz)
	  toggle = cnt4;    // 100Mhz   freq =  25mhz
	else 
	  toggle = cnt49;   // 10Mhz    freq =   2.5mhz
     end
   
Counter #(6) tx_rgmii_timer_Counter (.reset(hw_reset_tclk_lead | toggle),
                                     .clk(ref_clk_250mhz),
                                     .ce(1'b1),
                                     .count(tx_rgmii_timer));

TFF tclk_int_TFF (.toggle(toggle), 
                  .clk(ref_clk_250mhz),
                  .reset(hw_reset_tclk_lead),
                  .qout(tclk_int));


endmodule // rgmii_clk_gen
				    
