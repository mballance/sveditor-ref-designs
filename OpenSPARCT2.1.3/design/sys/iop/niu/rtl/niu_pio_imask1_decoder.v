// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_imask1_decoder.v
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
 * File Name    : niu_pio_imask1_decoder.v
 * Author Name  : John Lo
 * Description  : It contains ldf_mask 64~68 read/write decoder,
 * 
 * Parent Module: niu_pio_imask1_decoder.v
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

module niu_pio_imask1_decoder (/*AUTOARG*/
   // Outputs
   imask1_ack, imask1_rdata, imask1_err, ld_ldf_mask64, 
   ld_ldf_mask65, ld_ldf_mask66, ld_ldf_mask67, ld_ldf_mask68, 
   // Inputs
   clk, reset, imask1_sel_reg, addr, rd, ldf_mask64, 
   ldf_mask65, ldf_mask66, ldf_mask67, ldf_mask68
   );
   input 		      clk;
   input 		      reset;
   input 		      imask1_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input [1:0]		      ldf_mask64;
   input [1:0]		      ldf_mask65;
   input [1:0]		      ldf_mask66;
   input [1:0]		      ldf_mask67;
   input [1:0]		      ldf_mask68;

   output 		      imask1_ack;
   output [63:0] 	      imask1_rdata;
   output 		      imask1_err;
   
   output      		      ld_ldf_mask64;
   output      		      ld_ldf_mask65;
   output      		      ld_ldf_mask66;
   output      		      ld_ldf_mask67;
   output      		      ld_ldf_mask68;

// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      imask1_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration
   reg      		      ld_ldf_mask64;
   reg      		      ld_ldf_mask65;
   reg      		      ld_ldf_mask66;
   reg      		      ld_ldf_mask67;
   reg      		      ld_ldf_mask68;

`ifdef NEPTUNE
/* ---------------------------------------------------------- */
   reg				imask1_sel_reg_int;
   reg				rd_int;
   reg [18:0]			addr_int;

always @(posedge clk)
 if (reset)
  begin
   imask1_sel_reg_int	<= 1'b0;
   rd_int		<= 1'b0;
   addr_int		<= 19'b0;
  end
 else
  begin
   imask1_sel_reg_int	<= imask1_sel_reg ;
   rd_int		<= rd ;
   addr_int		<= addr;
  end

`else
/* ---------------------------------------------------------- */

   wire				imask1_sel_reg_int;
   wire				rd_int;
   wire [18:0]			addr_int;

   assign imask1_sel_reg_int	= imask1_sel_reg ;
   assign rd_int		= rd ;
   assign addr_int		= addr ;
/* ----------------------------------------------------------- */
`endif


   
niu_rw_ctl imask1_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(imask1_ack),
		      .rdata		(imask1_rdata[63:0]),
		      .err		(imask1_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(clk),
		      .sel		(imask1_sel_reg_int),
		      .rd		(rd_int),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));


always @ (/*AUTOSENSE*/addr_int or ldf_mask64 or ldf_mask65 or ldf_mask66
	  or ldf_mask67 or ldf_mask68 or wr_en)
  begin
                  non_qualified_addr_err = 0;
                  rd_data            = 64'hdead_beef_dead_beef;

                  ld_ldf_mask64      = 0;
                  ld_ldf_mask65      = 0;
                  ld_ldf_mask66      = 0;
                  ld_ldf_mask67      = 0;
                  ld_ldf_mask68      = 0;
     
    case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case
    19'h0_0000: begin
                  ld_ldf_mask64      = wr_en;
                  rd_data            = {62'b0,ldf_mask64};
                end
    19'h0_2000: begin
                  ld_ldf_mask65      = wr_en;
                  rd_data            = {62'b0,ldf_mask65};
                end
    19'h0_4000: begin
                  ld_ldf_mask66      = wr_en;
                  rd_data            = {62'b0,ldf_mask66};
                end
    19'h0_6000: begin
                  ld_ldf_mask67      = wr_en;
                  rd_data            = {62'b0,ldf_mask67};
                end
    19'h0_8000: begin
                  ld_ldf_mask68      = wr_en;
                  rd_data            = {62'b0,ldf_mask68};
                end

    default:    begin
                  rd_data            = 64'hdead_beef_dead_beef;
                  non_qualified_addr_err = 1;
	        end   // case: default
    endcase // case({addr[18:3],3'b0})
  end // always @ (...
   
 

      
endmodule // niu_pio_imask1_decoder


