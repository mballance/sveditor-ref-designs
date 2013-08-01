// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: phy_dpath.v
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
 * File Name    : phy_dpath
 * Author Name  : John Lo
 * Description  : This module is composed of some simple logic     
 * 		  (i.e. muxes, buffers, small gates) which ties    
 * 		  together the different physical interfaces GEM   
 * 		  supports.                                   
 * 		                                                   
 * 		  The MAC will accept a clock from the SERDES if   
 * 		  the external MII/GMII is not being used.  If it  
 * 		  is being used, the nclk_div2 clocks are buffered 
 * 		  and given to MAC.  Otherwise these are ignored.  
 * 		                                                   
 * 		  PCS will get its transmit clock from the refclk  
 * 		  pin.                                             
 * 
 * Parent Module: bmac_pcs_core or xmac_pcs_core
 * Interface Mod:  
 * Date Created : 8/30/01
 *
 * Copyright (c) 2003, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

 
module phy_dpath(
phy_mode,
rxd_int,	// from PCS block
rx_dv_int,	// from PCS block
rx_er_int,	// from PCS block
crs_int,	// from PCS block	
col_int,	// from PCS block
gmii_rxd,	// from external gmii interface	
gmii_rx_dv,	// from external gmii interface	
gmii_rx_err,	// from external gmii interface	
gmii_crs,	// from external gmii interface	
gmii_col,	// from external gmii interface	
// outputs
mii_rxd,	// to MAC
mii_rx_dv,	// to MAC
mii_rx_err,	// to MAC
mii_crs,	// to MAC
mii_col 	// to MAC
                 );

		
   input		phy_mode;
   input [7:0] 		rxd_int;	// from PCS block
   input 		rx_dv_int;	// from PCS block
   input 		rx_er_int;	// from PCS block
   input 		crs_int;	// from PCS block	
   input 		col_int;	// from PCS block
   input  [7:0] 	gmii_rxd;	// from external gmii interface	
   input  		gmii_rx_dv;	// from external gmii interface	
   input  		gmii_rx_err;	// from external gmii interface	
   input  		gmii_crs;	// from external gmii interface	
   input  		gmii_col;	// from external gmii interface
// outputs
   output [7:0] 	mii_rxd;	// to MAC
   output 		mii_rx_dv;	// to MAC
   output 		mii_rx_err;	// to MAC
   output 		mii_crs;	// to MAC
   output 		mii_col;	// to MAC
   

// in vega design, 
   // phy_mode (pcs_bypass) == 1 -> use rgmii interface and disable internal pcs.
   // phy_mode (pcs_bypass) == 0 -> use internal pcs.

MUX2TO1 #(8) MUX_RXD_GMII (.dout(mii_rxd),.sel(phy_mode),
		.data0(rxd_int[7:0]),
		.data1(gmii_rxd[7:0]));
MUX2TO1 #(1) MUX_RX_DV_GMII (.dout(mii_rx_dv),.sel(phy_mode),
		.data0(rx_dv_int),
		.data1(gmii_rx_dv));
MUX2TO1 #(1) MUX_RX_ER_GMII (.dout(mii_rx_err),.sel(phy_mode),
		.data0(rx_er_int),
		.data1(gmii_rx_err));
MUX2TO1 #(1) MUX_CRS_GMII (.dout(mii_crs),.sel(phy_mode),
		.data0(crs_int),
		.data1(gmii_crs));
MUX2TO1 #(1) MUX_COL_GMII (.dout(mii_col),.sel(phy_mode),
		.data0(col_int),
		.data1(gmii_col));



endmodule
