// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: debug.v
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
/*********************************************************************
 *
 *  debug.v
 *
 *  Global Debug Module
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):         Maya Suresh, Elisa Rodrigues
 *  Project(s):          Neptune/Niagara 2
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

module debug (/*AUTOARG*/
   // Outputs
   debug_port_data_out, debug_clock0_out, debug_clock1_out, 
   // Inputs
   debug_port_sel_in, txc_debug_port, tdmc_debug_port, 
   rdmc_debug_port, zcp_debug_port, ipp_debug_port, fflp_debug_port, 
   pio_debug_port, mac_debug_port, 
   meta_arb_debug_port, 
   niu_clk, 

`ifdef NEPTUNE
   mac_debug_clock0, 
   mac_debug_clock1, 
   peu_debug_port, 
   peu_debug_clock0, 
   peu_debug_clock1,
   peu_phy_debug_out,
   peu_phy_debug_sel,
   ext_spc_stuck
`else
   smx_debug_port
`endif

   );


// Debug IO Ports (to/from pads)
input  [4:0]  debug_port_sel_in;	// connect to test_sel_x_in on top (from pads)

output [31:0] debug_port_data_out;	// output to pads

// NIU Debug Ports
input  [31:0] 	txc_debug_port;
input  [31:0] 	tdmc_debug_port;
input  [31:0] 	rdmc_debug_port;
input  [31:0] 	zcp_debug_port;
input  [31:0] 	ipp_debug_port;
input  [31:0] 	fflp_debug_port;
input  [31:0] 	pio_debug_port;
input  [31:0] 	mac_debug_port;
input  [31:0]	meta_arb_debug_port;

input		niu_clk;

`ifdef NEPTUNE
input  [31:0]	peu_debug_port;
input		peu_debug_clock0;
input		peu_debug_clock1;
input		mac_debug_clock0;
input		mac_debug_clock1;
input [31:0]    peu_phy_debug_out;
output  [1:0]   peu_phy_debug_sel;
output          ext_spc_stuck;
`else
input  [31:0]   smx_debug_port;
`endif



// add input of clock from diff domain

output	debug_clock0_out;	// output to pads
output	debug_clock1_out;	

reg    [31:0] debug_port_data_out;
reg           debug_clock0_out;
reg 	      debug_clock1_out;
reg           niu_clk_divby2;
reg           niu_clk_divby4;
reg           niu_clk_divby8;
//reg    [1:0]  peu_phy_debug_sel;

`ifdef NEPTUNE
reg  mac_debug_clock0_divby2;
reg  mac_debug_clock0_divby4;
reg  mac_debug_clock0_divby8;
reg  mac_debug_clock1_divby2;
reg  mac_debug_clock1_divby4;
reg  mac_debug_clock1_divby8;
reg  peu_debug_clock0_divby2;
reg  peu_debug_clock0_divby4;
reg  peu_debug_clock0_divby8;
reg  peu_debug_clock1_divby2;
reg  peu_debug_clock1_divby4;
reg  peu_debug_clock1_divby8;
reg    [1:0]  peu_phy_debug_sel;
wire ext_spc_stuck;
wire [31:0] smx_debug_port= 32'h0;
`else
wire [31:0] peu_debug_port= 32'h0;
// wire	 peu_debug_clock0= 1'b0;
// wire	 peu_debug_clock1= 1'b0;
// wire	 mac_debug_clock0= 1'b0;
// wire	 mac_debug_clock1= 1'b0;
//wire     mac_debug_clock0_divby2 = 1'b0;     VJH
//wire     mac_debug_clock0_divby4 = 1'b0;     VJH
wire     mac_debug_clock0_divby8 = 1'b0;
//wire     mac_debug_clock1_divby2 = 1'b0;     VJH
//wire     mac_debug_clock1_divby4 = 1'b0;     VJH
wire     mac_debug_clock1_divby8 = 1'b0;
//wire     peu_debug_clock0_divby2 = 1'b0;	VJH
//wire     peu_debug_clock0_divby4 = 1'b0;      VJH
wire     peu_debug_clock0_divby8 = 1'b0;
//wire     peu_debug_clock1_divby2 = 1'b0;      VJH
//wire     peu_debug_clock1_divby4 = 1'b0;	VJH
wire     peu_debug_clock1_divby8 = 1'b0;
//wire [31:0] peu_phy_debug_out = 32'h0;        VJH
`endif

`ifdef NEPTUNE
always @(/*AUTOSENSE*/debug_port_sel_in or fflp_debug_port
	 or ipp_debug_port or mac_debug_port or meta_arb_debug_port
	 or peu_debug_port or pio_debug_port or rdmc_debug_port
	 or smx_debug_port or tdmc_debug_port or txc_debug_port
	 or zcp_debug_port or peu_phy_debug_out)
`else
always @(/*AUTOSENSE*/debug_port_sel_in or fflp_debug_port
	 or ipp_debug_port or mac_debug_port or meta_arb_debug_port
	 or peu_debug_port or pio_debug_port or rdmc_debug_port
	 or smx_debug_port or tdmc_debug_port or txc_debug_port
	 or zcp_debug_port )
`endif
begin
  case(debug_port_sel_in)   // Synopsys full_case parallel_case
    5'h11 :   debug_port_data_out = txc_debug_port;
    5'h12 :   debug_port_data_out = tdmc_debug_port;
    5'h13 :   debug_port_data_out = rdmc_debug_port;
    5'h14 :   debug_port_data_out = zcp_debug_port;
    5'h15 :   debug_port_data_out = ipp_debug_port;
    5'h16 :   debug_port_data_out = fflp_debug_port;
    5'h17 :   debug_port_data_out = pio_debug_port;
    5'h18 :   debug_port_data_out = mac_debug_port;
    5'h19 :   debug_port_data_out = peu_debug_port;
    5'h1a :   debug_port_data_out = meta_arb_debug_port;
    5'h1b :   debug_port_data_out = smx_debug_port;
`ifdef NEPTUNE
    5'h1c :   debug_port_data_out = peu_phy_debug_out;
    5'h1d :   debug_port_data_out = peu_phy_debug_out;
    5'h1e :   debug_port_data_out = peu_phy_debug_out;
    5'h1f :   debug_port_data_out = peu_phy_debug_out;
`endif
  default :   debug_port_data_out = 32'h0;
  endcase
end

// generate niu_clk_divby2,niu_clk_divby4,niu_clk_divby8

always @(posedge niu_clk)
 begin
   niu_clk_divby2 <= ~niu_clk_divby2;
 end

always @(posedge niu_clk_divby2)
 begin
   niu_clk_divby4 <= ~niu_clk_divby4;
 end

always @(posedge niu_clk_divby4)
 begin
   niu_clk_divby8 <= ~niu_clk_divby8;
 end

// generate mac_debug_clock0_divby2  & 
// generate mac_debug_clock1_divby2 in neptune mode only
// this is driven to zero in n2 mode

`ifdef NEPTUNE

 always @(posedge mac_debug_clock0)
  begin
   mac_debug_clock0_divby2 = ~mac_debug_clock0_divby2;
  end

 always @(posedge mac_debug_clock0_divby2)
  begin
   mac_debug_clock0_divby4 = ~mac_debug_clock0_divby4;
  end

 always @(posedge mac_debug_clock0_divby4)
  begin
   mac_debug_clock0_divby8 = ~mac_debug_clock0_divby8;
  end

 

 always @(posedge mac_debug_clock1)
  begin
   mac_debug_clock1_divby2 = ~mac_debug_clock1_divby2;
  end

 always @(posedge mac_debug_clock1_divby2)
  begin
   mac_debug_clock1_divby4 = ~mac_debug_clock1_divby4;
  end

 always @(posedge mac_debug_clock1_divby4)
  begin
   mac_debug_clock1_divby8 = ~mac_debug_clock1_divby8;
  end
  
`endif

// generate peu_debug_clock0_divby2  & 
// generate peu_debug_clock1_divby2 in neptune mode only
// this is driven to zero in n2 mode

`ifdef NEPTUNE

 always @(posedge peu_debug_clock0)
  begin
   peu_debug_clock0_divby2 = ~peu_debug_clock0_divby2;
  end

 always @(posedge peu_debug_clock0_divby2)
  begin
   peu_debug_clock0_divby4 = ~peu_debug_clock0_divby4;
  end

 always @(posedge peu_debug_clock0_divby4)
  begin
   peu_debug_clock0_divby8 = ~peu_debug_clock0_divby8;
  end

 always @(posedge peu_debug_clock1)
  begin
   peu_debug_clock1_divby2 = ~peu_debug_clock1_divby2;
  end

 always @(posedge peu_debug_clock1_divby2)
  begin
   peu_debug_clock1_divby4 = ~peu_debug_clock1_divby4;
  end

 always @(posedge peu_debug_clock1_divby4)
  begin
   peu_debug_clock1_divby8 = ~peu_debug_clock1_divby8;
  end
  
`endif




always @(/*AUTOSENSE*/debug_port_sel_in or mac_debug_clock0_divby8 or niu_clk_divby8
	 or peu_debug_clock0_divby8)
begin
  case(debug_port_sel_in)   // Synopsys full_case parallel_case
    5'h0 :   debug_clock0_out=1'b0;
    5'h8 :   debug_clock0_out= mac_debug_clock0_divby8;	
    5'h9 :   debug_clock0_out= peu_debug_clock0_divby8;	
  default :   debug_clock0_out= niu_clk_divby8;	
  endcase
end


// added code for driving peu_phy_sel signal
`ifdef NEPTUNE
always @(/*AUTOSENSE*/debug_port_sel_in)
begin
	case(debug_port_sel_in)   // Synopsys full_case parallel_case
	5'h1c :   peu_phy_debug_sel = 2'b00;
	5'h1d :   peu_phy_debug_sel = 2'b01;
	5'h1e :   peu_phy_debug_sel = 2'b10;
	5'h1f :   peu_phy_debug_sel = 2'b11;
      default :   peu_phy_debug_sel = 2'b00;
  endcase
end
`endif

always @(/*AUTOSENSE*/debug_port_sel_in or mac_debug_clock1_divby8 or niu_clk_divby8
	 or peu_debug_clock1_divby8)
begin
  case(debug_port_sel_in)   // Synopsys full_case parallel_case
    5'h0 :   debug_clock1_out= 1'b0;
    5'h8 :   debug_clock1_out= mac_debug_clock1_divby8;	
    5'h9 :   debug_clock1_out= peu_debug_clock1_divby8;	
  default :   debug_clock1_out= niu_clk_divby8;	
  endcase
end

// add code to drive the ext_spc_stuck signal,
// when sel is 5'h1b

`ifdef NEPTUNE
 assign ext_spc_stuck = (debug_port_sel_in == 5'h1b);
`endif

  
endmodule
