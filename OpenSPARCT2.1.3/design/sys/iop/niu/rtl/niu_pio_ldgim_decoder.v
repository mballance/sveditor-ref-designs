// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ldgim_decoder.v
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
 * File Name    : niu_pio_ldgim_decoder.v
 * Author Name  : John Lo
 * Description  : It contains logical device group interrupt 
 *                management  register read/write decoder,
 * 
 * Parent Module: niu_pio_ldgim_decoder.v
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

module niu_pio_ldgim_decoder (/*AUTOARG*/
   // Outputs
   ldgim_ack, ldgim_rdata, ldgim_err, ld_ldgim0, ld_ldgim1, 
   ld_ldgim2, ld_ldgim3, ld_ldgim4, ld_ldgim5, ld_ldgim6, ld_ldgim7, 
   ld_ldgim8, ld_ldgim9, ld_ldgim10, ld_ldgim11, ld_ldgim12, 
   ld_ldgim13, ld_ldgim14, ld_ldgim15, ld_ldgim16, ld_ldgim17, 
   ld_ldgim18, ld_ldgim19, ld_ldgim20, ld_ldgim21, ld_ldgim22, 
   ld_ldgim23, ld_ldgim24, ld_ldgim25, ld_ldgim26, ld_ldgim27, 
   ld_ldgim28, ld_ldgim29, ld_ldgim30, ld_ldgim31, ld_ldgim32, 
   ld_ldgim33, ld_ldgim34, ld_ldgim35, ld_ldgim36, ld_ldgim37, 
   ld_ldgim38, ld_ldgim39, ld_ldgim40, ld_ldgim41, ld_ldgim42, 
   ld_ldgim43, ld_ldgim44, ld_ldgim45, ld_ldgim46, ld_ldgim47, 
   ld_ldgim48, ld_ldgim49, ld_ldgim50, ld_ldgim51, ld_ldgim52, 
   ld_ldgim53, ld_ldgim54, ld_ldgim55, ld_ldgim56, ld_ldgim57, 
   ld_ldgim58, ld_ldgim59, ld_ldgim60, ld_ldgim61, ld_ldgim62, 
   ld_ldgim63, intr_reg_sel,
   // Inputs
   clk, reset, ldgim_sel_reg, addr, rd, arm0, arm1, arm2, 
   arm3, arm4, arm5, arm6, arm7, arm8, arm9, arm10, arm11, arm12, 
   arm13, arm14, arm15, arm16, arm17, arm18, arm19, arm20, arm21, 
   arm22, arm23, arm24, arm25, arm26, arm27, arm28, arm29, arm30, 
   arm31, arm32, arm33, arm34, arm35, arm36, arm37, arm38, arm39, 
   arm40, arm41, arm42, arm43, arm44, arm45, arm46, arm47, arm48, 
   arm49, arm50, arm51, arm52, arm53, arm54, arm55, arm56, arm57, 
   arm58, arm59, arm60, arm61, arm62, arm63, timer0, timer1, timer2, 
   timer3, timer4, timer5, timer6, timer7, timer8, timer9, timer10, 
   timer11, timer12, timer13, timer14, timer15, timer16, timer17, 
   timer18, timer19, timer20, timer21, timer22, timer23, timer24, 
   timer25, timer26, timer27, timer28, timer29, timer30, timer31, 
   timer32, timer33, timer34, timer35, timer36, timer37, timer38, 
   timer39, timer40, timer41, timer42, timer43, timer44, timer45, 
   timer46, timer47, timer48, timer49, timer50, timer51, timer52, 
   timer53, timer54, timer55, timer56, timer57, timer58, timer59, 
   timer60, timer61, timer62, timer63
   );
   input 		      clk;
   input 		      reset;
   input 		      ldgim_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input       	              arm0 ;
   input       	              arm1 ;
   input       	              arm2 ;
   input       	              arm3 ;
   input       	              arm4 ;
   input       	              arm5 ;
   input       	              arm6 ;
   input       	              arm7 ;
   input       	              arm8 ;
   input       	              arm9 ;
   input       	              arm10;
   input       	              arm11;
   input       	              arm12;
   input       	              arm13;
   input       	              arm14;
   input       	              arm15;
   input       	              arm16;
   input       	              arm17;
   input       	              arm18;
   input       	              arm19;
   input       	              arm20;
   input       	              arm21;
   input       	              arm22;
   input       	              arm23;
   input       	              arm24;
   input       	              arm25;
   input       	              arm26;
   input       	              arm27;
   input       	              arm28;
   input       	              arm29;
   input       	              arm30;
   input       	              arm31;
   input       	              arm32;
   input       	              arm33;
   input       	              arm34;
   input       	              arm35;
   input       	              arm36;
   input       	              arm37;
   input       	              arm38;
   input       	              arm39;
   input       	              arm40;
   input       	              arm41;
   input       	              arm42;
   input       	              arm43;
   input       	              arm44;
   input       	              arm45;
   input       	              arm46;
   input       	              arm47;
   input       	              arm48;
   input       	              arm49;
   input       	              arm50;
   input       	              arm51;
   input       	              arm52;
   input       	              arm53;
   input       	              arm54;
   input       	              arm55;
   input       	              arm56;
   input       	              arm57;
   input       	              arm58;
   input       	              arm59;
   input       	              arm60;
   input       	              arm61;
   input       	              arm62;
   input       	              arm63;   


   input [5:0] 	              timer0 ;
   input [5:0] 	              timer1 ;
   input [5:0] 	              timer2 ;
   input [5:0] 	              timer3 ;
   input [5:0] 	              timer4 ;
   input [5:0] 	              timer5 ;
   input [5:0] 	              timer6 ;
   input [5:0] 	              timer7 ;
   input [5:0] 	              timer8 ;
   input [5:0] 	              timer9 ;
   input [5:0] 	              timer10;
   input [5:0] 	              timer11;
   input [5:0] 	              timer12;
   input [5:0] 	              timer13;
   input [5:0] 	              timer14;
   input [5:0] 	              timer15;
   input [5:0] 	              timer16;
   input [5:0] 	              timer17;
   input [5:0] 	              timer18;
   input [5:0] 	              timer19;
   input [5:0] 	              timer20;
   input [5:0] 	              timer21;
   input [5:0] 	              timer22;
   input [5:0] 	              timer23;
   input [5:0] 	              timer24;
   input [5:0] 	              timer25;
   input [5:0] 	              timer26;
   input [5:0] 	              timer27;
   input [5:0] 	              timer28;
   input [5:0] 	              timer29;
   input [5:0] 	              timer30;
   input [5:0] 	              timer31;
   input [5:0] 	              timer32;
   input [5:0] 	              timer33;
   input [5:0] 	              timer34;
   input [5:0] 	              timer35;
   input [5:0] 	              timer36;
   input [5:0] 	              timer37;
   input [5:0] 	              timer38;
   input [5:0] 	              timer39;
   input [5:0] 	              timer40;
   input [5:0] 	              timer41;
   input [5:0] 	              timer42;
   input [5:0] 	              timer43;
   input [5:0] 	              timer44;
   input [5:0] 	              timer45;
   input [5:0] 	              timer46;
   input [5:0] 	              timer47;
   input [5:0] 	              timer48;
   input [5:0] 	              timer49;
   input [5:0] 	              timer50;
   input [5:0] 	              timer51;
   input [5:0] 	              timer52;
   input [5:0] 	              timer53;
   input [5:0] 	              timer54;
   input [5:0] 	              timer55;
   input [5:0] 	              timer56;
   input [5:0] 	              timer57;
   input [5:0] 	              timer58;
   input [5:0] 	              timer59;
   input [5:0] 	              timer60;
   input [5:0] 	              timer61;
   input [5:0] 	              timer62;
   input [5:0] 	              timer63;   


   output 		      ldgim_ack;
   output [63:0] 	      ldgim_rdata;
   output 		      ldgim_err;
                              //
   output  		      ld_ldgim0 ;
   output  		      ld_ldgim1 ;
   output  		      ld_ldgim2 ;
   output  		      ld_ldgim3 ;
   output  		      ld_ldgim4 ;
   output  		      ld_ldgim5 ;
   output  		      ld_ldgim6 ;
   output  		      ld_ldgim7 ;
   output  		      ld_ldgim8 ;
   output  		      ld_ldgim9 ;
   output  		      ld_ldgim10;
   output  		      ld_ldgim11;
   output  		      ld_ldgim12;
   output  		      ld_ldgim13;
   output  		      ld_ldgim14;
   output  		      ld_ldgim15;
   output  		      ld_ldgim16;
   output  		      ld_ldgim17;
   output  		      ld_ldgim18;
   output  		      ld_ldgim19;
   output  		      ld_ldgim20;
   output  		      ld_ldgim21;
   output  		      ld_ldgim22;
   output  		      ld_ldgim23;
   output  		      ld_ldgim24;
   output  		      ld_ldgim25;
   output  		      ld_ldgim26;
   output  		      ld_ldgim27;
   output  		      ld_ldgim28;
   output  		      ld_ldgim29;
   output  		      ld_ldgim30;
   output  		      ld_ldgim31;
   output  		      ld_ldgim32;
   output  		      ld_ldgim33;
   output  		      ld_ldgim34;
   output  		      ld_ldgim35;
   output  		      ld_ldgim36;
   output  		      ld_ldgim37;
   output  		      ld_ldgim38;
   output  		      ld_ldgim39;
   output  		      ld_ldgim40;
   output  		      ld_ldgim41;
   output  		      ld_ldgim42;
   output  		      ld_ldgim43;
   output  		      ld_ldgim44;
   output  		      ld_ldgim45;
   output  		      ld_ldgim46;
   output  		      ld_ldgim47;
   output  		      ld_ldgim48;
   output  		      ld_ldgim49;
   output  		      ld_ldgim50;
   output  		      ld_ldgim51;
   output  		      ld_ldgim52;
   output  		      ld_ldgim53;
   output  		      ld_ldgim54;
   output  		      ld_ldgim55;
   output  		      ld_ldgim56;
   output  		      ld_ldgim57;
   output  		      ld_ldgim58;
   output  		      ld_ldgim59;
   output  		      ld_ldgim60;
   output  		      ld_ldgim61;
   output  		      ld_ldgim62;
   output  		      ld_ldgim63;   
   output  		      intr_reg_sel;   
   
// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      ldgim_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration
   reg  		      ld_ldgim0 ;
   reg  		      ld_ldgim1 ;
   reg  		      ld_ldgim2 ;
   reg  		      ld_ldgim3 ;
   reg  		      ld_ldgim4 ;
   reg  		      ld_ldgim5 ;
   reg  		      ld_ldgim6 ;
   reg  		      ld_ldgim7 ;
   reg  		      ld_ldgim8 ;
   reg  		      ld_ldgim9 ;
   reg  		      ld_ldgim10;
   reg  		      ld_ldgim11;
   reg  		      ld_ldgim12;
   reg  		      ld_ldgim13;
   reg  		      ld_ldgim14;
   reg  		      ld_ldgim15;
   reg  		      ld_ldgim16;
   reg  		      ld_ldgim17;
   reg  		      ld_ldgim18;
   reg  		      ld_ldgim19;
   reg  		      ld_ldgim20;
   reg  		      ld_ldgim21;
   reg  		      ld_ldgim22;
   reg  		      ld_ldgim23;
   reg  		      ld_ldgim24;
   reg  		      ld_ldgim25;
   reg  		      ld_ldgim26;
   reg  		      ld_ldgim27;
   reg  		      ld_ldgim28;
   reg  		      ld_ldgim29;
   reg  		      ld_ldgim30;
   reg  		      ld_ldgim31;
   reg  		      ld_ldgim32;
   reg  		      ld_ldgim33;
   reg  		      ld_ldgim34;
   reg  		      ld_ldgim35;
   reg  		      ld_ldgim36;
   reg  		      ld_ldgim37;
   reg  		      ld_ldgim38;
   reg  		      ld_ldgim39;
   reg  		      ld_ldgim40;
   reg  		      ld_ldgim41;
   reg  		      ld_ldgim42;
   reg  		      ld_ldgim43;
   reg  		      ld_ldgim44;
   reg  		      ld_ldgim45;
   reg  		      ld_ldgim46;
   reg  		      ld_ldgim47;
   reg  		      ld_ldgim48;
   reg  		      ld_ldgim49;
   reg  		      ld_ldgim50;
   reg  		      ld_ldgim51;
   reg  		      ld_ldgim52;
   reg  		      ld_ldgim53;
   reg  		      ld_ldgim54;
   reg  		      ld_ldgim55;
   reg  		      ld_ldgim56;
   reg  		      ld_ldgim57;
   reg  		      ld_ldgim58;
   reg  		      ld_ldgim59;
   reg  		      ld_ldgim60;
   reg  		      ld_ldgim61;
   reg  		      ld_ldgim62;
   reg  		      ld_ldgim63;   
   reg  		      intr_reg_sel;   

`ifdef NEPTUNE
/* ---------------------------------------------------------- */
   reg				ldgim_sel_reg_int;
   reg				rd_int;
   reg [18:0]			addr_int;

always @(posedge clk)
 if (reset)
  begin
   ldgim_sel_reg_int    <= 1'b0;
   rd_int		<= 1'b0;
   addr_int		<= 19'b0;
  end
 else
  begin
   ldgim_sel_reg_int    <= ldgim_sel_reg ;
   rd_int		<= rd ;
   addr_int		<= addr;
  end

`else
/* ---------------------------------------------------------- */

   wire				ldgim_sel_reg_int;
   wire				rd_int;
   wire [18:0]			addr_int;

   assign ldgim_sel_reg_int     = ldgim_sel_reg ;
   assign rd_int		= rd ;
   assign addr_int		= addr ;
/* ----------------------------------------------------------- */
`endif

 
niu_rw_ctl ldgim_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(ldgim_ack),
		      .rdata		(ldgim_rdata[63:0]),
		      .err		(ldgim_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(clk),
		      .sel		(ldgim_sel_reg_int),
		      .rd		(rd_int),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));


always @ (/*AUTOSENSE*/addr_int or arm0 or arm1 or arm10 or arm11 or arm12
	  or arm13 or arm14 or arm15 or arm16 or arm17 or arm18
	  or arm19 or arm2 or arm20 or arm21 or arm22 or arm23
	  or arm24 or arm25 or arm26 or arm27 or arm28 or arm29
	  or arm3 or arm30 or arm31 or arm32 or arm33 or arm34
	  or arm35 or arm36 or arm37 or arm38 or arm39 or arm4
	  or arm40 or arm41 or arm42 or arm43 or arm44 or arm45
	  or arm46 or arm47 or arm48 or arm49 or arm5 or arm50
	  or arm51 or arm52 or arm53 or arm54 or arm55 or arm56
	  or arm57 or arm58 or arm59 or arm6 or arm60 or arm61
	  or arm62 or arm63 or arm7 or arm8 or arm9 or timer0
	  or timer1 or timer10 or timer11 or timer12 or timer13
	  or timer14 or timer15 or timer16 or timer17 or timer18
	  or timer19 or timer2 or timer20 or timer21 or timer22
	  or timer23 or timer24 or timer25 or timer26 or timer27
	  or timer28 or timer29 or timer3 or timer30 or timer31
	  or timer32 or timer33 or timer34 or timer35 or timer36
	  or timer37 or timer38 or timer39 or timer4 or timer40
	  or timer41 or timer42 or timer43 or timer44 or timer45
	  or timer46 or timer47 or timer48 or timer49 or timer5
	  or timer50 or timer51 or timer52 or timer53 or timer54
	  or timer55 or timer56 or timer57 or timer58 or timer59
	  or timer6 or timer60 or timer61 or timer62 or timer63
	  or timer7 or timer8 or timer9 or wr_en)
  begin
                  non_qualified_addr_err = 0;
                  rd_data            = 64'hdead_beef_dead_beef;

                  ld_ldgim0       = 0;
                  ld_ldgim1       = 0;
                  ld_ldgim2       = 0;
                  ld_ldgim3       = 0;
                  ld_ldgim4       = 0;
                  ld_ldgim5       = 0;
                  ld_ldgim6       = 0;
                  ld_ldgim7       = 0;
                  ld_ldgim8       = 0;
                  ld_ldgim9       = 0;
                  ld_ldgim10      = 0;
                  ld_ldgim11      = 0;
                  ld_ldgim12      = 0;
                  ld_ldgim13      = 0;
                  ld_ldgim14      = 0;
                  ld_ldgim15      = 0;
                  ld_ldgim16      = 0;
                  ld_ldgim17      = 0;
                  ld_ldgim18      = 0;
                  ld_ldgim19      = 0;
                  ld_ldgim20      = 0;
                  ld_ldgim21      = 0;
                  ld_ldgim22      = 0;
                  ld_ldgim23      = 0;
                  ld_ldgim24      = 0;
                  ld_ldgim25      = 0;
                  ld_ldgim26      = 0;
                  ld_ldgim27      = 0;
                  ld_ldgim28      = 0;
                  ld_ldgim29      = 0;
                  ld_ldgim30      = 0;
                  ld_ldgim31      = 0;
                  ld_ldgim32      = 0;
                  ld_ldgim33      = 0;
                  ld_ldgim34      = 0;
                  ld_ldgim35      = 0;
                  ld_ldgim36      = 0;
                  ld_ldgim37      = 0;
                  ld_ldgim38      = 0;
                  ld_ldgim39      = 0;
                  ld_ldgim40      = 0;
                  ld_ldgim41      = 0;
                  ld_ldgim42      = 0;
                  ld_ldgim43      = 0;
                  ld_ldgim44      = 0;
                  ld_ldgim45      = 0;
                  ld_ldgim46      = 0;
                  ld_ldgim47      = 0;
                  ld_ldgim48      = 0;
                  ld_ldgim49      = 0;
                  ld_ldgim50      = 0;
                  ld_ldgim51      = 0;
                  ld_ldgim52      = 0;
                  ld_ldgim53      = 0;
                  ld_ldgim54      = 0;
                  ld_ldgim55      = 0;
                  ld_ldgim56      = 0;
                  ld_ldgim57      = 0;
                  ld_ldgim58      = 0;
                  ld_ldgim59      = 0;
                  ld_ldgim60      = 0;
                  ld_ldgim61      = 0;
                  ld_ldgim62      = 0;
                  ld_ldgim63      = 0;
                  intr_reg_sel    = 0;

    case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case

                // DMA binding registers
    19'h0_0018: begin 
                  ld_ldgim0       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm0,25'b0,timer0};
                end
    19'h0_2018: begin
                  ld_ldgim1       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm1,25'b0,timer1};
                end
    19'h0_4018: begin 
                  ld_ldgim2       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm2,25'b0,timer2};
                end
    19'h0_6018: begin
                  ld_ldgim3       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm3,25'b0,timer3};
                end
    19'h0_8018: begin 
                  ld_ldgim4       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm4,25'b0,timer4};
                end
    19'h0_a018: begin
                  ld_ldgim5       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm5,25'b0,timer5};
                end
    19'h0_c018: begin 
                  ld_ldgim6       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm6,25'b0,timer6};
                end
    19'h0_e018: begin
                  ld_ldgim7       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm7,25'b0,timer7};
                end
    19'h1_0018: begin 
                  ld_ldgim8       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm8,25'b0,timer8};
                end
    19'h1_2018: begin
                  ld_ldgim9       = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm9,25'b0,timer9};
                end
    19'h1_4018: begin 
                  ld_ldgim10      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm10,25'b0,timer10};
                end
    19'h1_6018: begin
                  ld_ldgim11      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm11,25'b0,timer11};
                end
    19'h1_8018: begin 
                  ld_ldgim12      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm12,25'b0,timer12};
                end
    19'h1_a018: begin
                  ld_ldgim13      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm13,25'b0,timer13};
                end
    19'h1_c018: begin 
                  ld_ldgim14      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm14,25'b0,timer14};
                end
    19'h1_e018: begin
                  ld_ldgim15      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm15,25'b0,timer15};
                end
    19'h2_0018: begin 
                  ld_ldgim16      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm16,25'b0,timer16};
                end
    19'h2_2018: begin
                  ld_ldgim17      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm17,25'b0,timer17};
                end
    19'h2_4018: begin 
                  ld_ldgim18      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm18,25'b0,timer18};
                end
    19'h2_6018: begin
                  ld_ldgim19      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm19,25'b0,timer19};
                end
    19'h2_8018: begin 
                  ld_ldgim20      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm20,25'b0,timer20};
                end
    19'h2_a018: begin
                  ld_ldgim21      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm21,25'b0,timer21};
                end
    19'h2_c018: begin 
                  ld_ldgim22      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm22,25'b0,timer22};
                end
    19'h2_e018: begin
                  ld_ldgim23      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm23,25'b0,timer23};
                end
    19'h3_0018: begin 
                  ld_ldgim24      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm24,25'b0,timer24};
                end
    19'h3_2018: begin
                  ld_ldgim25      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm25,25'b0,timer25};
                end
    19'h3_4018: begin 
                  ld_ldgim26      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm26,25'b0,timer26};
                end
    19'h3_6018: begin
                  ld_ldgim27      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm27,25'b0,timer27};
                end
    19'h3_8018: begin 
                  ld_ldgim28      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm28,25'b0,timer28};
                end
    19'h3_a018: begin
                  ld_ldgim29      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm29,25'b0,timer29};
                end
    19'h3_c018: begin 
                  ld_ldgim30      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm30,25'b0,timer30};
                end
    19'h3_e018: begin
                  ld_ldgim31      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm31,25'b0,timer31};
                end
    19'h4_0018: begin 
                  ld_ldgim32      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm32,25'b0,timer32};
                end
    19'h4_2018: begin
                  ld_ldgim33      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm33,25'b0,timer33};
                end
    19'h4_4018: begin 
                  ld_ldgim34      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm34,25'b0,timer34};
                end
    19'h4_6018: begin
                  ld_ldgim35      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm35,25'b0,timer35};
                end
    19'h4_8018: begin 
                  ld_ldgim36      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm36,25'b0,timer36};
                end
    19'h4_a018: begin
                  ld_ldgim37      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm37,25'b0,timer37};
                end
    19'h4_c018: begin 
                  ld_ldgim38      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm38,25'b0,timer38};
                end
    19'h4_e018: begin
                  ld_ldgim39      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm39,25'b0,timer39};
                end
    19'h5_0018: begin 
                  ld_ldgim40      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm40,25'b0,timer40};
                end
    19'h5_2018: begin
                  ld_ldgim41      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm41,25'b0,timer41};
                end
    19'h5_4018: begin 
                  ld_ldgim42      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm42,25'b0,timer42};
                end
    19'h5_6018: begin
                  ld_ldgim43      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm43,25'b0,timer43};
                end
    19'h5_8018: begin 
                  ld_ldgim44      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm44,25'b0,timer44};
                end
    19'h5_a018: begin
                  ld_ldgim45      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm45,25'b0,timer45};
                end
    19'h5_c018: begin 
                  ld_ldgim46      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm46,25'b0,timer46};
                end
    19'h5_e018: begin
                  ld_ldgim47      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm47,25'b0,timer47};
                end
    19'h6_0018: begin 
                  ld_ldgim48      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm48,25'b0,timer48};
                end
    19'h6_2018: begin
                  ld_ldgim49      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm49,25'b0,timer49};
                end
    19'h6_4018: begin 
                  ld_ldgim50      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm50,25'b0,timer50};
                end
    19'h6_6018: begin
                  ld_ldgim51      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm51,25'b0,timer51};
                end
    19'h6_8018: begin 
                  ld_ldgim52      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm52,25'b0,timer52};
                end
    19'h6_a018: begin
                  ld_ldgim53      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm53,25'b0,timer53};
                end
    19'h6_c018: begin 
                  ld_ldgim54      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm54,25'b0,timer54};
                end
    19'h6_e018: begin
                  ld_ldgim55      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm55,25'b0,timer55};
                end
    19'h7_0018: begin 
                  ld_ldgim56      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm56,25'b0,timer56};
                end
    19'h7_2018: begin
                  ld_ldgim57      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm57,25'b0,timer57};
                end
    19'h7_4018: begin 
                  ld_ldgim58      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm58,25'b0,timer58};
                end
    19'h7_6018: begin
                  ld_ldgim59      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm59,25'b0,timer59};
                end
    19'h7_8018: begin 
                  ld_ldgim60      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm60,25'b0,timer60};
                end
    19'h7_a018: begin
                  ld_ldgim61      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm61,25'b0,timer61};
                end
    19'h7_c018: begin 
                  ld_ldgim62      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm62,25'b0,timer62};
                end
    19'h7_e018: begin
                  ld_ldgim63      = wr_en;
                  intr_reg_sel    = 1'b1;
                  rd_data         = {32'b0,arm63,25'b0,timer63};
                end

    default:    begin
                  rd_data                = 64'hdead_beef_dead_beef;
                  intr_reg_sel           = 1'b0;
                  non_qualified_addr_err = 0;
	        end // case: default
    endcase // case({addr[18:3],3'b0})
  end // always @ (...
 
endmodule // niu_pio_ldgim_decoder

