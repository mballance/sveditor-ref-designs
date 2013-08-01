// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rx_xgmii_intf.v
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
 * File Name    : rx_xgmii_intf
 * Author Name  : John Lo
 * Description  : This module if for rx xgmii interface.
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/24/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module rx_xgmii_intf (
rx_clk,
// xgmii 32bit  interface
xgmii_rxc,
xgmii_rxd,
// xgmii 64bit  interfaceoutput
xgmii_rxc_8b,
xgmii_rxd_64b
		   );

   input           rx_clk;
                   // xgmii 32bit  interface
   input [3:0] 	   xgmii_rxc;
   input [31:0]    xgmii_rxd;
                   // xgmii 64bit  interfaceoutput
   output [7:0]    xgmii_rxc_8b;
   output [63:0]   xgmii_rxd_64b;
   
   wire 	   rx_clk;
   wire 	   rx_clk_n;
   wire [3:0] 	   xgmii_rxc_reg_n;
   wire [3:0] 	   xgmii_rxc_reg;
   wire [31:0] 	   xgmii_rxd_reg_n;
   wire [31:0] 	   xgmii_rxd_reg;
   wire [7:0] 	   xgmii_rxc_8  = {xgmii_rxc_reg_n,xgmii_rxc_reg};
   wire [63:0] 	   xgmii_rxd_64 = {xgmii_rxd_reg_n,xgmii_rxd_reg};
   wire [7:0] 	   xgmii_rxc_8b;
   wire [63:0] 	   xgmii_rxd_64b;
   	     

/* -------------------- negative clock definition ------------- */

`ifdef USE_XGMII_INTF
   assign 	   rx_clk_n = ~rx_clk;
`else // !ifdef USE_XGMII_INTF
   assign 	   rx_clk_n =  rx_clk;
`endif
/* ***************** normal data path ************************* */
/* ----------------- xgmii pre statge registers --------------- */
   RegDff   #(4)  xgmii_rxc_reg_n_RegDff (.din(xgmii_rxc),.clk(rx_clk_n),.qout(xgmii_rxc_reg_n));
   RegDff   #(4)  xgmii_rxc_reg_RegDff   (.din(xgmii_rxc),.clk(rx_clk  ),.qout(xgmii_rxc_reg  ));
   RegDff   #(32) xgmii_rxd_reg_n_RegDff (.din(xgmii_rxd),.clk(rx_clk_n),.qout(xgmii_rxd_reg_n));
   RegDff   #(32) xgmii_rxd_reg_RegDff   (.din(xgmii_rxd),.clk(rx_clk  ),.qout(xgmii_rxd_reg  ));
   // convert to positive edge pipeline

   RegDff   #(8)  xgmii_rxc_8b_RegDff(.din(xgmii_rxc_8), .clk(rx_clk  ),.qout(xgmii_rxc_8b));
   RegDff   #(64) xgmii_rxd_64b_RegDff(.din(xgmii_rxd_64),.clk(rx_clk  ),.qout(xgmii_rxd_64b));

endmodule // rx_xgmii_intf

