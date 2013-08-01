// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_imask0_decoder.v
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
 * File Name    : niu_pio_imask0_decoder.v
 * Author Name  : John Lo
 * Description  : It contains ldf_mask 0~63 read/write decoder,
 * 
 * Parent Module: niu_pio_imask0_decoder.v
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

module niu_pio_imask0_decoder (/*AUTOARG*/
   // Outputs
   imask0_ack, imask0_rdata, imask0_err, ld_ldf_mask0, ld_ldf_mask1, 
   ld_ldf_mask2, ld_ldf_mask3, ld_ldf_mask4, ld_ldf_mask5, 
   ld_ldf_mask6, ld_ldf_mask7, ld_ldf_mask8, ld_ldf_mask9, 
   ld_ldf_mask10, ld_ldf_mask11, ld_ldf_mask12, ld_ldf_mask13, 
   ld_ldf_mask14, ld_ldf_mask15, ld_ldf_mask16, ld_ldf_mask17, 
   ld_ldf_mask18, ld_ldf_mask19, ld_ldf_mask20, ld_ldf_mask21, 
   ld_ldf_mask22, ld_ldf_mask23, ld_ldf_mask24, ld_ldf_mask25, 
   ld_ldf_mask26, ld_ldf_mask27, ld_ldf_mask28, ld_ldf_mask29, 
   ld_ldf_mask30, ld_ldf_mask31, ld_ldf_mask32, ld_ldf_mask33, 
   ld_ldf_mask34, ld_ldf_mask35, ld_ldf_mask36, ld_ldf_mask37, 
   ld_ldf_mask38, ld_ldf_mask39, ld_ldf_mask40, ld_ldf_mask41, 
   ld_ldf_mask42, ld_ldf_mask43, ld_ldf_mask44, ld_ldf_mask45, 
   ld_ldf_mask46, ld_ldf_mask47, ld_ldf_mask48, ld_ldf_mask49, 
   ld_ldf_mask50, ld_ldf_mask51, ld_ldf_mask52, ld_ldf_mask53, 
   ld_ldf_mask54, ld_ldf_mask55, ld_ldf_mask56, ld_ldf_mask57, 
   ld_ldf_mask58, ld_ldf_mask59, ld_ldf_mask60, ld_ldf_mask61, 
   ld_ldf_mask62, ld_ldf_mask63, 
   // Inputs
   clk, reset, imask0_sel_reg, addr, rd, ldf_mask0, ldf_mask1, 
   ldf_mask2, ldf_mask3, ldf_mask4, ldf_mask5, ldf_mask6, ldf_mask7, 
   ldf_mask8, ldf_mask9, ldf_mask10, ldf_mask11, ldf_mask12, 
   ldf_mask13, ldf_mask14, ldf_mask15, ldf_mask16, ldf_mask17, 
   ldf_mask18, ldf_mask19, ldf_mask20, ldf_mask21, ldf_mask22, 
   ldf_mask23, ldf_mask24, ldf_mask25, ldf_mask26, ldf_mask27, 
   ldf_mask28, ldf_mask29, ldf_mask30, ldf_mask31, ldf_mask32, 
   ldf_mask33, ldf_mask34, ldf_mask35, ldf_mask36, ldf_mask37, 
   ldf_mask38, ldf_mask39, ldf_mask40, ldf_mask41, ldf_mask42, 
   ldf_mask43, ldf_mask44, ldf_mask45, ldf_mask46, ldf_mask47, 
   ldf_mask48, ldf_mask49, ldf_mask50, ldf_mask51, ldf_mask52, 
   ldf_mask53, ldf_mask54, ldf_mask55, ldf_mask56, ldf_mask57, 
   ldf_mask58, ldf_mask59, ldf_mask60, ldf_mask61, ldf_mask62, 
   ldf_mask63
   );
   input 		      clk;
   input 		      reset;
   input 		      imask0_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input [1:0]		      ldf_mask0 ;
   input [1:0]		      ldf_mask1 ;
   input [1:0]		      ldf_mask2 ;
   input [1:0]		      ldf_mask3 ;
   input [1:0]		      ldf_mask4 ;
   input [1:0]		      ldf_mask5 ;
   input [1:0]		      ldf_mask6 ;
   input [1:0]		      ldf_mask7 ;
   input [1:0]		      ldf_mask8 ;
   input [1:0]		      ldf_mask9 ;
   input [1:0]		      ldf_mask10;
   input [1:0]		      ldf_mask11;
   input [1:0]		      ldf_mask12;
   input [1:0]		      ldf_mask13;
   input [1:0]		      ldf_mask14;
   input [1:0]		      ldf_mask15;
   input [1:0]		      ldf_mask16;
   input [1:0]		      ldf_mask17;
   input [1:0]		      ldf_mask18;
   input [1:0]		      ldf_mask19;
   input [1:0]		      ldf_mask20;
   input [1:0]		      ldf_mask21;
   input [1:0]		      ldf_mask22;
   input [1:0]		      ldf_mask23;
   input [1:0]		      ldf_mask24;
   input [1:0]		      ldf_mask25;
   input [1:0]		      ldf_mask26;
   input [1:0]		      ldf_mask27;
   input [1:0]		      ldf_mask28;
   input [1:0]		      ldf_mask29;
   input [1:0]		      ldf_mask30;
   input [1:0]		      ldf_mask31;
   input [1:0]		      ldf_mask32;
   input [1:0]		      ldf_mask33;
   input [1:0]		      ldf_mask34;
   input [1:0]		      ldf_mask35;
   input [1:0]		      ldf_mask36;
   input [1:0]		      ldf_mask37;
   input [1:0]		      ldf_mask38;
   input [1:0]		      ldf_mask39;
   input [1:0]		      ldf_mask40;
   input [1:0]		      ldf_mask41;
   input [1:0]		      ldf_mask42;
   input [1:0]		      ldf_mask43;
   input [1:0]		      ldf_mask44;
   input [1:0]		      ldf_mask45;
   input [1:0]		      ldf_mask46;
   input [1:0]		      ldf_mask47;
   input [1:0]		      ldf_mask48;
   input [1:0]		      ldf_mask49;
   input [1:0]		      ldf_mask50;
   input [1:0]		      ldf_mask51;
   input [1:0]		      ldf_mask52;
   input [1:0]		      ldf_mask53;
   input [1:0]		      ldf_mask54;
   input [1:0]		      ldf_mask55;
   input [1:0]		      ldf_mask56;
   input [1:0]		      ldf_mask57;
   input [1:0]		      ldf_mask58;
   input [1:0]		      ldf_mask59;
   input [1:0]		      ldf_mask60;
   input [1:0]		      ldf_mask61;
   input [1:0]		      ldf_mask62;
   input [1:0]		      ldf_mask63;

   output 		      imask0_ack;
   output [63:0] 	      imask0_rdata;
   output 		      imask0_err;
   
   output      		      ld_ldf_mask0 ;
   output      		      ld_ldf_mask1 ;
   output      		      ld_ldf_mask2 ;
   output      		      ld_ldf_mask3 ;
   output      		      ld_ldf_mask4 ;
   output      		      ld_ldf_mask5 ;
   output      		      ld_ldf_mask6 ;
   output      		      ld_ldf_mask7 ;
   output      		      ld_ldf_mask8 ;
   output      		      ld_ldf_mask9 ;
   output      		      ld_ldf_mask10;
   output      		      ld_ldf_mask11;
   output      		      ld_ldf_mask12;
   output      		      ld_ldf_mask13;
   output      		      ld_ldf_mask14;
   output      		      ld_ldf_mask15;
   output      		      ld_ldf_mask16;
   output      		      ld_ldf_mask17;
   output      		      ld_ldf_mask18;
   output      		      ld_ldf_mask19;
   output      		      ld_ldf_mask20;
   output      		      ld_ldf_mask21;
   output      		      ld_ldf_mask22;
   output      		      ld_ldf_mask23;
   output      		      ld_ldf_mask24;
   output      		      ld_ldf_mask25;
   output      		      ld_ldf_mask26;
   output      		      ld_ldf_mask27;
   output      		      ld_ldf_mask28;
   output      		      ld_ldf_mask29;
   output      		      ld_ldf_mask30;
   output      		      ld_ldf_mask31;
   output      		      ld_ldf_mask32;
   output      		      ld_ldf_mask33;
   output      		      ld_ldf_mask34;
   output      		      ld_ldf_mask35;
   output      		      ld_ldf_mask36;
   output      		      ld_ldf_mask37;
   output      		      ld_ldf_mask38;
   output      		      ld_ldf_mask39;
   output      		      ld_ldf_mask40;
   output      		      ld_ldf_mask41;
   output      		      ld_ldf_mask42;
   output      		      ld_ldf_mask43;
   output      		      ld_ldf_mask44;
   output      		      ld_ldf_mask45;
   output      		      ld_ldf_mask46;
   output      		      ld_ldf_mask47;
   output      		      ld_ldf_mask48;
   output      		      ld_ldf_mask49;
   output      		      ld_ldf_mask50;
   output      		      ld_ldf_mask51;
   output      		      ld_ldf_mask52;
   output      		      ld_ldf_mask53;
   output      		      ld_ldf_mask54;
   output      		      ld_ldf_mask55;
   output      		      ld_ldf_mask56;
   output      		      ld_ldf_mask57;
   output      		      ld_ldf_mask58;
   output      		      ld_ldf_mask59;
   output      		      ld_ldf_mask60;
   output      		      ld_ldf_mask61;
   output      		      ld_ldf_mask62;
   output      		      ld_ldf_mask63;

// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      imask0_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration
   reg      		      ld_ldf_mask0 ;
   reg      		      ld_ldf_mask1 ;
   reg      		      ld_ldf_mask2 ;
   reg      		      ld_ldf_mask3 ;
   reg      		      ld_ldf_mask4 ;
   reg      		      ld_ldf_mask5 ;
   reg      		      ld_ldf_mask6 ;
   reg      		      ld_ldf_mask7 ;
   reg      		      ld_ldf_mask8 ;
   reg      		      ld_ldf_mask9 ;
   reg      		      ld_ldf_mask10;
   reg      		      ld_ldf_mask11;
   reg      		      ld_ldf_mask12;
   reg      		      ld_ldf_mask13;
   reg      		      ld_ldf_mask14;
   reg      		      ld_ldf_mask15;
   reg      		      ld_ldf_mask16;
   reg      		      ld_ldf_mask17;
   reg      		      ld_ldf_mask18;
   reg      		      ld_ldf_mask19;
   reg      		      ld_ldf_mask20;
   reg      		      ld_ldf_mask21;
   reg      		      ld_ldf_mask22;
   reg      		      ld_ldf_mask23;
   reg      		      ld_ldf_mask24;
   reg      		      ld_ldf_mask25;
   reg      		      ld_ldf_mask26;
   reg      		      ld_ldf_mask27;
   reg      		      ld_ldf_mask28;
   reg      		      ld_ldf_mask29;
   reg      		      ld_ldf_mask30;
   reg      		      ld_ldf_mask31;
   reg      		      ld_ldf_mask32;
   reg      		      ld_ldf_mask33;
   reg      		      ld_ldf_mask34;
   reg      		      ld_ldf_mask35;
   reg      		      ld_ldf_mask36;
   reg      		      ld_ldf_mask37;
   reg      		      ld_ldf_mask38;
   reg      		      ld_ldf_mask39;
   reg      		      ld_ldf_mask40;
   reg      		      ld_ldf_mask41;
   reg      		      ld_ldf_mask42;
   reg      		      ld_ldf_mask43;
   reg      		      ld_ldf_mask44;
   reg      		      ld_ldf_mask45;
   reg      		      ld_ldf_mask46;
   reg      		      ld_ldf_mask47;
   reg      		      ld_ldf_mask48;
   reg      		      ld_ldf_mask49;
   reg      		      ld_ldf_mask50;
   reg      		      ld_ldf_mask51;
   reg      		      ld_ldf_mask52;
   reg      		      ld_ldf_mask53;
   reg      		      ld_ldf_mask54;
   reg      		      ld_ldf_mask55;
   reg      		      ld_ldf_mask56;
   reg      		      ld_ldf_mask57;
   reg      		      ld_ldf_mask58;
   reg      		      ld_ldf_mask59;
   reg      		      ld_ldf_mask60;
   reg      		      ld_ldf_mask61;
   reg      		      ld_ldf_mask62;
   reg      		      ld_ldf_mask63;

`ifdef NEPTUNE
/* ---------------------------------------------------------- */
   reg				imask0_sel_reg_int;
   reg				rd_int;
   reg [18:0]			addr_int;

always @(posedge clk)
 if (reset)
  begin
   imask0_sel_reg_int   <= 1'b0;
   rd_int		<= 1'b0;
   addr_int		<= 19'b0;
  end
 else
  begin
   imask0_sel_reg_int   <= imask0_sel_reg ;
   rd_int		<= rd ;
   addr_int		<= addr;
  end

`else
/* ---------------------------------------------------------- */

   wire				imask0_sel_reg_int;
   wire				rd_int;
   wire [18:0]			addr_int;

   assign imask0_sel_reg_int    = imask0_sel_reg ;
   assign rd_int		= rd ;
   assign addr_int		= addr ;
/* ----------------------------------------------------------- */
`endif
   
niu_rw_ctl imask0_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(imask0_ack),
		      .rdata		(imask0_rdata[63:0]),
		      .err		(imask0_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(clk),
		      .sel		(imask0_sel_reg_int),
		      .rd		(rd_int),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));


always @ (/*AUTOSENSE*/addr_int or ldf_mask0 or ldf_mask1 or ldf_mask10
	  or ldf_mask11 or ldf_mask12 or ldf_mask13 or ldf_mask14
	  or ldf_mask15 or ldf_mask16 or ldf_mask17 or ldf_mask18
	  or ldf_mask19 or ldf_mask2 or ldf_mask20 or ldf_mask21
	  or ldf_mask22 or ldf_mask23 or ldf_mask24 or ldf_mask25
	  or ldf_mask26 or ldf_mask27 or ldf_mask28 or ldf_mask29
	  or ldf_mask3 or ldf_mask30 or ldf_mask31 or ldf_mask32
	  or ldf_mask33 or ldf_mask34 or ldf_mask35 or ldf_mask36
	  or ldf_mask37 or ldf_mask38 or ldf_mask39 or ldf_mask4
	  or ldf_mask40 or ldf_mask41 or ldf_mask42 or ldf_mask43
	  or ldf_mask44 or ldf_mask45 or ldf_mask46 or ldf_mask47
	  or ldf_mask48 or ldf_mask49 or ldf_mask5 or ldf_mask50
	  or ldf_mask51 or ldf_mask52 or ldf_mask53 or ldf_mask54
	  or ldf_mask55 or ldf_mask56 or ldf_mask57 or ldf_mask58
	  or ldf_mask59 or ldf_mask6 or ldf_mask60 or ldf_mask61
	  or ldf_mask62 or ldf_mask63 or ldf_mask7 or ldf_mask8
	  or ldf_mask9 or wr_en)
  begin
                  non_qualified_addr_err = 0;
                  rd_data            = 64'hdead_beef_dead_beef;

                  ld_ldf_mask0       = 0;
                  ld_ldf_mask1       = 0;
                  ld_ldf_mask2       = 0;
                  ld_ldf_mask3       = 0;
                  ld_ldf_mask4       = 0;
                  ld_ldf_mask5       = 0;
                  ld_ldf_mask6       = 0;
                  ld_ldf_mask7       = 0;
                  ld_ldf_mask8       = 0;
                  ld_ldf_mask9       = 0;
                  ld_ldf_mask10      = 0;
                  ld_ldf_mask11      = 0;
                  ld_ldf_mask12      = 0;
                  ld_ldf_mask13      = 0;
                  ld_ldf_mask14      = 0;
                  ld_ldf_mask15      = 0;
                  ld_ldf_mask16      = 0;
                  ld_ldf_mask17      = 0;
                  ld_ldf_mask18      = 0;
                  ld_ldf_mask19      = 0;
                  ld_ldf_mask20      = 0;
                  ld_ldf_mask21      = 0;
                  ld_ldf_mask22      = 0;
                  ld_ldf_mask23      = 0;
                  ld_ldf_mask24      = 0;
                  ld_ldf_mask25      = 0;
                  ld_ldf_mask26      = 0;
                  ld_ldf_mask27      = 0;
                  ld_ldf_mask28      = 0;
                  ld_ldf_mask29      = 0;
                  ld_ldf_mask30      = 0;
                  ld_ldf_mask31      = 0;
                  ld_ldf_mask32      = 0;
                  ld_ldf_mask33      = 0;
                  ld_ldf_mask34      = 0;
                  ld_ldf_mask35      = 0;
                  ld_ldf_mask36      = 0;
                  ld_ldf_mask37      = 0;
                  ld_ldf_mask38      = 0;
                  ld_ldf_mask39      = 0;
                  ld_ldf_mask40      = 0;
                  ld_ldf_mask41      = 0;
                  ld_ldf_mask42      = 0;
                  ld_ldf_mask43      = 0;
                  ld_ldf_mask44      = 0;
                  ld_ldf_mask45      = 0;
                  ld_ldf_mask46      = 0;
                  ld_ldf_mask47      = 0;
                  ld_ldf_mask48      = 0;
                  ld_ldf_mask49      = 0;
                  ld_ldf_mask50      = 0;
                  ld_ldf_mask51      = 0;
                  ld_ldf_mask52      = 0;
                  ld_ldf_mask53      = 0;
                  ld_ldf_mask54      = 0;
                  ld_ldf_mask55      = 0;
                  ld_ldf_mask56      = 0;
                  ld_ldf_mask57      = 0;
                  ld_ldf_mask58      = 0;
                  ld_ldf_mask59      = 0;
                  ld_ldf_mask60      = 0;
                  ld_ldf_mask61      = 0;
                  ld_ldf_mask62      = 0;
                  ld_ldf_mask63      = 0;
     
    case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case
    19'h0_0000: begin
                  ld_ldf_mask0       = wr_en;
                  rd_data            = {62'b0,ldf_mask0};
                end
    19'h0_2000: begin
                  ld_ldf_mask1       = wr_en;
                  rd_data            = {62'b0,ldf_mask1};
                end
    19'h0_4000: begin
                  ld_ldf_mask2       = wr_en;
                  rd_data            = {62'b0,ldf_mask2};
                end
    19'h0_6000: begin
                  ld_ldf_mask3       = wr_en;
                  rd_data            = {62'b0,ldf_mask3};
                end
    19'h0_8000: begin
                  ld_ldf_mask4       = wr_en;
                  rd_data            = {62'b0,ldf_mask4};
                end
    19'h0_a000: begin
                  ld_ldf_mask5       = wr_en;
                  rd_data            = {62'b0,ldf_mask5};
                end
    19'h0_c000: begin
                  ld_ldf_mask6       = wr_en;
                  rd_data            = {62'b0,ldf_mask6};
                end
    19'h0_e000: begin
                  ld_ldf_mask7       = wr_en;
                  rd_data            = {62'b0,ldf_mask7};
                end
    19'h1_0000: begin
                  ld_ldf_mask8       = wr_en;
                  rd_data            = {62'b0,ldf_mask8};
                end
    19'h1_2000: begin
                  ld_ldf_mask9       = wr_en;
                  rd_data            = {62'b0,ldf_mask9};
                end
    19'h1_4000: begin
                  ld_ldf_mask10      = wr_en;
                  rd_data            = {62'b0,ldf_mask10};
                end
    19'h1_6000: begin
                  ld_ldf_mask11      = wr_en;
                  rd_data            = {62'b0,ldf_mask11};
                end
    19'h1_8000: begin
                  ld_ldf_mask12      = wr_en;
                  rd_data            = {62'b0,ldf_mask12};
                end
    19'h1_a000: begin
                  ld_ldf_mask13      = wr_en;
                  rd_data            = {62'b0,ldf_mask13};
                end
    19'h1_c000: begin
                  ld_ldf_mask14      = wr_en;
                  rd_data            = {62'b0,ldf_mask14};
                end
    19'h1_e000: begin
                  ld_ldf_mask15      = wr_en;
                  rd_data            = {62'b0,ldf_mask15};
                end
    19'h2_0000: begin
                  ld_ldf_mask16      = wr_en;
                  rd_data            = {62'b0,ldf_mask16};
                end
    19'h2_2000: begin
                  ld_ldf_mask17      = wr_en;
                  rd_data            = {62'b0,ldf_mask17};
                end
    19'h2_4000: begin
                  ld_ldf_mask18      = wr_en;
                  rd_data            = {62'b0,ldf_mask18};
                end
    19'h2_6000: begin
                  ld_ldf_mask19      = wr_en;
                  rd_data            = {62'b0,ldf_mask19};
                end
    19'h2_8000: begin
                  ld_ldf_mask20      = wr_en;
                  rd_data            = {62'b0,ldf_mask20};
                end
    19'h2_a000: begin
                  ld_ldf_mask21      = wr_en;
                  rd_data            = {62'b0,ldf_mask21};
                end
    19'h2_c000: begin
                  ld_ldf_mask22      = wr_en;
                  rd_data            = {62'b0,ldf_mask22};
                end
    19'h2_e000: begin
                  ld_ldf_mask23      = wr_en;
                  rd_data            = {62'b0,ldf_mask23};
                end
    19'h3_0000: begin
                  ld_ldf_mask24      = wr_en;
                  rd_data            = {62'b0,ldf_mask24};
                end
    19'h3_2000: begin
                  ld_ldf_mask25      = wr_en;
                  rd_data            = {62'b0,ldf_mask25};
                end
    19'h3_4000: begin
                  ld_ldf_mask26      = wr_en;
                  rd_data            = {62'b0,ldf_mask26};
                end
    19'h3_6000: begin
                  ld_ldf_mask27      = wr_en;
                  rd_data            = {62'b0,ldf_mask27};
                end
    19'h3_8000: begin
                  ld_ldf_mask28      = wr_en;
                  rd_data            = {62'b0,ldf_mask28};
                end
    19'h3_a000: begin
                  ld_ldf_mask29      = wr_en;
                  rd_data            = {62'b0,ldf_mask29};
                end
    19'h3_c000: begin
                  ld_ldf_mask30      = wr_en;
                  rd_data            = {62'b0,ldf_mask30};
                end
    19'h3_e000: begin
                  ld_ldf_mask31      = wr_en;
                  rd_data            = {62'b0,ldf_mask31};
                end
    19'h4_0000: begin
                  ld_ldf_mask32      = wr_en;
                  rd_data            = {62'b0,ldf_mask32};
                end
    19'h4_2000: begin
                  ld_ldf_mask33      = wr_en;
                  rd_data            = {62'b0,ldf_mask33};
                end
    19'h4_4000: begin
                  ld_ldf_mask34      = wr_en;
                  rd_data            = {62'b0,ldf_mask34};
                end
    19'h4_6000: begin
                  ld_ldf_mask35      = wr_en;
                  rd_data            = {62'b0,ldf_mask35};
                end
    19'h4_8000: begin
                  ld_ldf_mask36      = wr_en;
                  rd_data            = {62'b0,ldf_mask36};
                end
    19'h4_a000: begin
                  ld_ldf_mask37      = wr_en;
                  rd_data            = {62'b0,ldf_mask37};
                end
    19'h4_c000: begin
                  ld_ldf_mask38      = wr_en;
                  rd_data            = {62'b0,ldf_mask38};
                end
    19'h4_e000: begin
                  ld_ldf_mask39      = wr_en;
                  rd_data            = {62'b0,ldf_mask39};
                end
    19'h5_0000: begin
                  ld_ldf_mask40      = wr_en;
                  rd_data            = {62'b0,ldf_mask40};
                end
    19'h5_2000: begin
                  ld_ldf_mask41      = wr_en;
                  rd_data            = {62'b0,ldf_mask41};
                end
    19'h5_4000: begin
                  ld_ldf_mask42      = wr_en;
                  rd_data            = {62'b0,ldf_mask42};
                end
    19'h5_6000: begin
                  ld_ldf_mask43      = wr_en;
                  rd_data            = {62'b0,ldf_mask43};
                end
    19'h5_8000: begin
                  ld_ldf_mask44      = wr_en;
                  rd_data            = {62'b0,ldf_mask44};
                end
    19'h5_a000: begin
                  ld_ldf_mask45      = wr_en;
                  rd_data            = {62'b0,ldf_mask45};
                end
    19'h5_c000: begin
                  ld_ldf_mask46      = wr_en;
                  rd_data            = {62'b0,ldf_mask46};
                end
    19'h5_e000: begin
                  ld_ldf_mask47      = wr_en;
                  rd_data            = {62'b0,ldf_mask47};
                end
    19'h6_0000: begin
                  ld_ldf_mask48      = wr_en;
                  rd_data            = {62'b0,ldf_mask48};
                end
    19'h6_2000: begin
                  ld_ldf_mask49      = wr_en;
                  rd_data            = {62'b0,ldf_mask49};
                end
    19'h6_4000: begin
                  ld_ldf_mask50      = wr_en;
                  rd_data            = {62'b0,ldf_mask50};
                end
    19'h6_6000: begin
                  ld_ldf_mask51      = wr_en;
                  rd_data            = {62'b0,ldf_mask51};
                end
    19'h6_8000: begin
                  ld_ldf_mask52      = wr_en;
                  rd_data            = {62'b0,ldf_mask52};
                end
    19'h6_a000: begin
                  ld_ldf_mask53      = wr_en;
                  rd_data            = {62'b0,ldf_mask53};
                end
    19'h6_c000: begin
                  ld_ldf_mask54      = wr_en;
                  rd_data            = {62'b0,ldf_mask54};
                end
    19'h6_e000: begin
                  ld_ldf_mask55      = wr_en;
                  rd_data            = {62'b0,ldf_mask55};
                end
    19'h7_0000: begin
                  ld_ldf_mask56      = wr_en;
                  rd_data            = {62'b0,ldf_mask56};
                end
    19'h7_2000: begin
                  ld_ldf_mask57      = wr_en;
                  rd_data            = {62'b0,ldf_mask57};
                end
    19'h7_4000: begin
                  ld_ldf_mask58      = wr_en;
                  rd_data            = {62'b0,ldf_mask58};
                end
    19'h7_6000: begin
                  ld_ldf_mask59      = wr_en;
                  rd_data            = {62'b0,ldf_mask59};
                end
    19'h7_8000: begin
                  ld_ldf_mask60      = wr_en;
                  rd_data            = {62'b0,ldf_mask60};
                end
    19'h7_a000: begin
                  ld_ldf_mask61      = wr_en;
                  rd_data            = {62'b0,ldf_mask61};
                end
    19'h7_c000: begin
                  ld_ldf_mask62      = wr_en;
                  rd_data            = {62'b0,ldf_mask62};
                end
    19'h7_e000: begin
                  ld_ldf_mask63      = wr_en;
                  rd_data            = {62'b0,ldf_mask63};
                end

    default:    begin
                  rd_data            = 64'hdead_beef_dead_beef;
                  non_qualified_addr_err = 1;
	        end   // case: default
    endcase // case({addr[18:3],3'b0})
  end // always @ (...
   
 

      
endmodule // niu_pio_imask0_decoder


