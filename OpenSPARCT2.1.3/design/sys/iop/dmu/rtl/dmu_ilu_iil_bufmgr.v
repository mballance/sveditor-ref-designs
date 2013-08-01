// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil_bufmgr.v
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
module dmu_ilu_iil_bufmgr (
				clk,
				rst_l,
				p2d_ihb_wptr,
				d2p_ihb_addr,
				ihb_rptr_inc,
				ihb_empty,

				// debug 
				ihb_rptr,
				ihb_wptr);
 
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock
  input		  rst_l;   	    // input reset
    
  //---------------------------------------------------------------------
  //   IHB and IHB management interface
  //---------------------------------------------------------------------
  input    [6:0]  p2d_ihb_wptr;     // gray-coded IHB write pointer
  output   [5:0]  d2p_ihb_addr;     // binary read pointer to IHB
  
  //---------------------------------------------------------------------
  //   IIL internal interface
  //---------------------------------------------------------------------
  input 	  ihb_rptr_inc;     // advance d2p_ihb_addr, from *_xfrfsm.v
  output 	  ihb_empty;        //                         to *_xfrfsm.v

  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output [6:0] 	  ihb_rptr;         // binary IHB read pointer
  output [6:0] 	  ihb_wptr;          // binary IHB write pointer
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [6:0] 	  ihb_rptr;         // binary IHB read pointer

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [6:0] 	  gray_ihb_wptr;     // gray-coded IHB write pointer

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in known_driven -var ihb_rptr_inc
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<

  // converts gray-coded to binary-coded
  function [6:0] gray2bin;
    input [6:0] gray;
    reg         temp;
    integer i;
    begin
      temp = 0;
      for (i=6; i>=0; i=i-1)  begin
        temp = temp ^ gray[i];
        gray2bin[i] = temp;
      end
    end
  endfunction // gray2bin
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  assign ihb_empty = (ihb_rptr == ihb_wptr);
  assign ihb_wptr = gray2bin(gray_ihb_wptr);
  assign d2p_ihb_addr = ihb_rptr[5:0];

  always @ (posedge clk)
    if (!rst_l) begin
      ihb_rptr <= 7'b0;
    end
    else if(ihb_rptr_inc) begin
	ihb_rptr <= ihb_rptr + 1'b1;
    end
			   
  // ******************************** Instantiation ************************
  // sync flops
//  pcie_common_sync_flop #(7) sync_flop (
//					.clk(clk),
//					.din(p2d_ihb_wptr),
//					.dout(gray_ihb_wptr));  
  cl_a1_clksyncff_4x sync_flop_6 ( .d(p2d_ihb_wptr[6]), .si(1'b0), .q( gray_ihb_wptr[6]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_5 ( .d(p2d_ihb_wptr[5]), .si(1'b0), .q( gray_ihb_wptr[5]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_4 ( .d(p2d_ihb_wptr[4]), .si(1'b0), .q( gray_ihb_wptr[4]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_3 ( .d(p2d_ihb_wptr[3]), .si(1'b0), .q( gray_ihb_wptr[3]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_2 ( .d(p2d_ihb_wptr[2]), .si(1'b0), .q( gray_ihb_wptr[2]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_1 ( .d(p2d_ihb_wptr[1]), .si(1'b0), .q( gray_ihb_wptr[1]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );
  cl_a1_clksyncff_4x sync_flop_0 ( .d(p2d_ihb_wptr[0]), .si(1'b0), .q( gray_ihb_wptr[0]), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

endmodule // dmu_ilu_iil_bufmgr



