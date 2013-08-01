// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil_parchk.v
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
module dmu_ilu_iil_parchk (
				clk,
				rst_l,
				p2d_ihb_dpar,
				is_ihb_rcd,
				iil2cib_ihb_pe,
				in_ihb_rcd);
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock
  input		  rst_l;	    // synchronous reset
    
  //---------------------------------------------------------------------
  //   IHB interface
  //---------------------------------------------------------------------
  input    [3:0]  p2d_ihb_dpar;     // TLP header record parity

  //---------------------------------------------------------------------
  //   talk to rcdbldr
  //---------------------------------------------------------------------
  input [`FIRE_IHB_REC_WDTH-1:0] in_ihb_rcd;

  //---------------------------------------------------------------------
  //   IIL internal interface
  //---------------------------------------------------------------------
  output 	  iil2cib_ihb_pe;
  input 	  is_ihb_rcd;
    	  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [3:0] 	  in_ihb_dpar;          // flop input p2d_ihb_dpar

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [3:0] 	  calc_ihb_dpar;     // calulated parity from p2d_ihb_data

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  /* #0in odd_parity -var {in_ihb_rcd[127:96], in_ihb_dpar[3]} 
                                   -name ilu_iil_odd_parchk_3
                                   -active is_ihb_rcd */
  /* #0in odd_parity -var {in_ihb_rcd[95:64], in_ihb_dpar[2]} 
                                   -name ilu_iil_odd_parchk_2
                                   -active is_ihb_rcd */
  /* #0in odd_parity -var {in_ihb_rcd[63:32], in_ihb_dpar[1]} 
                                   -name ilu_iil_odd_parchk_1
                                   -active is_ihb_rcd */
  /* #0in odd_parity -var {in_ihb_rcd[31:0], in_ihb_dpar[0]} 
                                   -name ilu_iil_odd_parchk_0
                                   -active is_ihb_rcd */

  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<

  function [3:0] calc_parity;  // odd parity
    input [127:0] data;
    begin      
      calc_parity[3] = ~(^data[127:96]);
      calc_parity[2] = ~(^data[95:64]);
      calc_parity[1] = ~(^data[63:32]);
      calc_parity[0] = ~(^data[31:0]);
    end
  endfunction // calc_parity
  
      
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  assign iil2cib_ihb_pe = is_ihb_rcd & (|(in_ihb_dpar ^ calc_ihb_dpar)); // odd parity

  assign calc_ihb_dpar = calc_parity(in_ihb_rcd);
  
  always @ (posedge clk)
	if(~rst_l) begin
      in_ihb_dpar <= {4{1'b0}};
   end
    else begin
      in_ihb_dpar <= p2d_ihb_dpar;
    end

endmodule // dmu_ilu_iil_parchk



