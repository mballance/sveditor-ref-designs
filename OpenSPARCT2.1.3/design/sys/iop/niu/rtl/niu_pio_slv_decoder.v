// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_slv_decoder.v
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

/*****************************************************************
 *
 * File Name    : niu_pio_slv_decoder.v
 * Author Name  : John Lo
 * Description  : It contains PIO itslef read/write decoder,
 * 
 * Parent Module: niu_pio_slv_decoder.v
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/30/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/

module niu_pio_slv_decoder (/*AUTOARG*/
   // Outputs
   slv_ack, slv_rdata, slv_err, ras_dev_func_share, 
   ld_dev_func_share,rd_dev_func_share, 
   // Inputs
   reset, clk, slv_sel_reg, addr, rd, dev_func_share
   );

   input 		      clk;
   input 		      reset;

   input 		      slv_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input [63:0] 	      dev_func_share;

   output 		      slv_ack;
   output [63:0] 	      slv_rdata;
   output 		      slv_err;
                              //
   output		      ras_dev_func_share;
   output		      ld_dev_func_share;
   output		      rd_dev_func_share;
   

// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      slv_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration
   reg 			      ras_dev_func_share;
   reg 			      ld_dev_func_share;
   reg 			      rd_dev_func_share;
   
`ifdef NEPTUNE
/* ---------------------------------------------------------- */
   reg				slv_sel_reg_int;
   reg				rd_int;
   reg [18:0]			addr_int;

always @(posedge clk)
 if (reset)
  begin
	slv_sel_reg_int	<= 1'b0;
	rd_int		<= 1'b0;
	addr_int	<= 19'b0;
  end
 else
  begin
	slv_sel_reg_int	<= slv_sel_reg ;
	rd_int		<= rd ;
	addr_int	<= addr;
  end

`else
/* ---------------------------------------------------------- */

   wire				slv_sel_reg_int;
   wire				rd_int;
   wire [18:0]			addr_int;

   assign slv_sel_reg_int	= slv_sel_reg ;
   assign rd_int		= rd ;
   assign addr_int		= addr ;
/* ----------------------------------------------------------- */
`endif

 
niu_rw_ctl_0 slv_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(slv_ack),
		      .rdata		(slv_rdata[63:0]),
		      .err		(slv_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(clk),
		      .sel		(slv_sel_reg_int),
		      .rd		(rd_int),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));


always @ (/*AUTOSENSE*/addr_int or dev_func_share or rasr or wr_en or rd_en)
  begin
                non_qualified_addr_err = 0;
                rd_data            = 64'hdead_beef_dead_beef;
                ras_dev_func_share = 0;
                ld_dev_func_share  = 0;
                rd_dev_func_share  = 0;
     
    case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case
    19'h1_0000: begin // device function shared register
                  ras_dev_func_share = rasr;
                  ld_dev_func_share  = wr_en;
                  rd_dev_func_share  = rd_en;
                  rd_data            = dev_func_share;
                  
                end

    default:    begin
                  rd_data            = 64'hdead_beef_dead_beef;
                  non_qualified_addr_err = 1;
	        end // case: default
    endcase // case({addr[18:3],3'b0})
     
  end // always @ (...
   
endmodule // niu_pio_slv_decoder
