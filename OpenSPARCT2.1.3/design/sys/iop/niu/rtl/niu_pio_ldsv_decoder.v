// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ldsv_decoder.v
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
 * File Name    : niu_pio_ldsv_decoder.v
 * Author Name  : John Lo
 * Description  : It contains PIO itslef read/write decoder,
 * 
 * Parent Module: niu_pio_ldsv_decoder.v
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

module niu_pio_ldsv_decoder (/*AUTOARG*/
   // Outputs
   ldsv_ack, ldsv_rdata, ldsv_err, 
   // Inputs
   clk, ldsv_sel_reg, addr, rd, ldsv0grp0, ldsv1grp0, 
   ldsv2grp0, ldsv0grp1, ldsv1grp1, ldsv2grp1, ldsv0grp2, ldsv1grp2, 
   ldsv2grp2, ldsv0grp3, ldsv1grp3, ldsv2grp3, ldsv0grp4, ldsv1grp4, 
   ldsv2grp4, ldsv0grp5, ldsv1grp5, ldsv2grp5, ldsv0grp6, ldsv1grp6, 
   ldsv2grp6, ldsv0grp7, ldsv1grp7, ldsv2grp7, ldsv0grp8, ldsv1grp8, 
   ldsv2grp8, ldsv0grp9, ldsv1grp9, ldsv2grp9, ldsv0grp10, 
   ldsv1grp10, ldsv2grp10, ldsv0grp11, ldsv1grp11, ldsv2grp11, 
   ldsv0grp12, ldsv1grp12, ldsv2grp12, ldsv0grp13, ldsv1grp13, 
   ldsv2grp13, ldsv0grp14, ldsv1grp14, ldsv2grp14, ldsv0grp15, 
   ldsv1grp15, ldsv2grp15, ldsv0grp16, ldsv1grp16, ldsv2grp16, 
   ldsv0grp17, ldsv1grp17, ldsv2grp17, ldsv0grp18, ldsv1grp18, 
   ldsv2grp18, ldsv0grp19, ldsv1grp19, ldsv2grp19, ldsv0grp20, 
   ldsv1grp20, ldsv2grp20, ldsv0grp21, ldsv1grp21, ldsv2grp21, 
   ldsv0grp22, ldsv1grp22, ldsv2grp22, ldsv0grp23, ldsv1grp23, 
   ldsv2grp23, ldsv0grp24, ldsv1grp24, ldsv2grp24, ldsv0grp25, 
   ldsv1grp25, ldsv2grp25, ldsv0grp26, ldsv1grp26, ldsv2grp26, 
   ldsv0grp27, ldsv1grp27, ldsv2grp27, ldsv0grp28, ldsv1grp28, 
   ldsv2grp28, ldsv0grp29, ldsv1grp29, ldsv2grp29, ldsv0grp30, 
   ldsv1grp30, ldsv2grp30, ldsv0grp31, ldsv1grp31, ldsv2grp31, 
   ldsv0grp32, ldsv1grp32, ldsv2grp32, ldsv0grp33, ldsv1grp33, 
   ldsv2grp33, ldsv0grp34, ldsv1grp34, ldsv2grp34, ldsv0grp35, 
   ldsv1grp35, ldsv2grp35, ldsv0grp36, ldsv1grp36, ldsv2grp36, 
   ldsv0grp37, ldsv1grp37, ldsv2grp37, ldsv0grp38, ldsv1grp38, 
   ldsv2grp38, ldsv0grp39, ldsv1grp39, ldsv2grp39, ldsv0grp40, 
   ldsv1grp40, ldsv2grp40, ldsv0grp41, ldsv1grp41, ldsv2grp41, 
   ldsv0grp42, ldsv1grp42, ldsv2grp42, ldsv0grp43, ldsv1grp43, 
   ldsv2grp43, ldsv0grp44, ldsv1grp44, ldsv2grp44, ldsv0grp45, 
   ldsv1grp45, ldsv2grp45, ldsv0grp46, ldsv1grp46, ldsv2grp46, 
   ldsv0grp47, ldsv1grp47, ldsv2grp47, ldsv0grp48, ldsv1grp48, 
   ldsv2grp48, ldsv0grp49, ldsv1grp49, ldsv2grp49, ldsv0grp50, 
   ldsv1grp50, ldsv2grp50, ldsv0grp51, ldsv1grp51, ldsv2grp51, 
   ldsv0grp52, ldsv1grp52, ldsv2grp52, ldsv0grp53, ldsv1grp53, 
   ldsv2grp53, ldsv0grp54, ldsv1grp54, ldsv2grp54, ldsv0grp55, 
   ldsv1grp55, ldsv2grp55, ldsv0grp56, ldsv1grp56, ldsv2grp56, 
   ldsv0grp57, ldsv1grp57, ldsv2grp57, ldsv0grp58, ldsv1grp58, 
   ldsv2grp58, ldsv0grp59, ldsv1grp59, ldsv2grp59, ldsv0grp60, 
   ldsv1grp60, ldsv2grp60, ldsv0grp61, ldsv1grp61, ldsv2grp61, 
   ldsv0grp62, ldsv1grp62, ldsv2grp62, ldsv0grp63, ldsv1grp63, 
   ldsv2grp63
   );
   input 		      clk;
   input 		      ldsv_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input [63:0]		      ldsv0grp0 ;
   input [63:0]		      ldsv1grp0 ;
   input [63:0]		      ldsv2grp0 ;
   input [63:0]		      ldsv0grp1 ;
   input [63:0]		      ldsv1grp1 ;
   input [63:0]		      ldsv2grp1 ;
   input [63:0]		      ldsv0grp2 ;
   input [63:0]		      ldsv1grp2 ;
   input [63:0]		      ldsv2grp2 ;
   input [63:0]		      ldsv0grp3 ;
   input [63:0]		      ldsv1grp3 ;
   input [63:0]		      ldsv2grp3 ;
   input [63:0]		      ldsv0grp4 ;
   input [63:0]		      ldsv1grp4 ;
   input [63:0]		      ldsv2grp4 ;
   input [63:0]		      ldsv0grp5 ;
   input [63:0]		      ldsv1grp5 ;
   input [63:0]		      ldsv2grp5 ;
   input [63:0]		      ldsv0grp6 ;
   input [63:0]		      ldsv1grp6 ;
   input [63:0]		      ldsv2grp6 ;
   input [63:0]		      ldsv0grp7 ;
   input [63:0]		      ldsv1grp7 ;
   input [63:0]		      ldsv2grp7 ;
   input [63:0]		      ldsv0grp8 ;
   input [63:0]		      ldsv1grp8 ;
   input [63:0]		      ldsv2grp8 ;
   input [63:0]		      ldsv0grp9 ;
   input [63:0]		      ldsv1grp9 ;
   input [63:0]		      ldsv2grp9 ;
   input [63:0]		      ldsv0grp10;
   input [63:0]		      ldsv1grp10;
   input [63:0]		      ldsv2grp10;
   input [63:0]		      ldsv0grp11;
   input [63:0]		      ldsv1grp11;
   input [63:0]		      ldsv2grp11;
   input [63:0]		      ldsv0grp12;
   input [63:0]		      ldsv1grp12;
   input [63:0]		      ldsv2grp12;
   input [63:0]		      ldsv0grp13;
   input [63:0]		      ldsv1grp13;
   input [63:0]		      ldsv2grp13;
   input [63:0]		      ldsv0grp14;
   input [63:0]		      ldsv1grp14;
   input [63:0]		      ldsv2grp14;
   input [63:0]		      ldsv0grp15;
   input [63:0]		      ldsv1grp15;
   input [63:0]		      ldsv2grp15;
   input [63:0]		      ldsv0grp16;
   input [63:0]		      ldsv1grp16;
   input [63:0]		      ldsv2grp16;
   input [63:0]		      ldsv0grp17;
   input [63:0]		      ldsv1grp17;
   input [63:0]		      ldsv2grp17;
   input [63:0]		      ldsv0grp18;
   input [63:0]		      ldsv1grp18;
   input [63:0]		      ldsv2grp18;
   input [63:0]		      ldsv0grp19;
   input [63:0]		      ldsv1grp19;
   input [63:0]		      ldsv2grp19;
   input [63:0]		      ldsv0grp20;
   input [63:0]		      ldsv1grp20;
   input [63:0]		      ldsv2grp20;
   input [63:0]		      ldsv0grp21;
   input [63:0]		      ldsv1grp21;
   input [63:0]		      ldsv2grp21;
   input [63:0]		      ldsv0grp22;
   input [63:0]		      ldsv1grp22;
   input [63:0]		      ldsv2grp22;
   input [63:0]		      ldsv0grp23;
   input [63:0]		      ldsv1grp23;
   input [63:0]		      ldsv2grp23;
   input [63:0]		      ldsv0grp24;
   input [63:0]		      ldsv1grp24;
   input [63:0]		      ldsv2grp24;
   input [63:0]		      ldsv0grp25;
   input [63:0]		      ldsv1grp25;
   input [63:0]		      ldsv2grp25;
   input [63:0]		      ldsv0grp26;
   input [63:0]		      ldsv1grp26;
   input [63:0]		      ldsv2grp26;
   input [63:0]		      ldsv0grp27;
   input [63:0]		      ldsv1grp27;
   input [63:0]		      ldsv2grp27;
   input [63:0]		      ldsv0grp28;
   input [63:0]		      ldsv1grp28;
   input [63:0]		      ldsv2grp28;
   input [63:0]		      ldsv0grp29;
   input [63:0]		      ldsv1grp29;
   input [63:0]		      ldsv2grp29;
   input [63:0]		      ldsv0grp30;
   input [63:0]		      ldsv1grp30;
   input [63:0]		      ldsv2grp30;
   input [63:0]		      ldsv0grp31;
   input [63:0]		      ldsv1grp31;
   input [63:0]		      ldsv2grp31;
   input [63:0]		      ldsv0grp32;
   input [63:0]		      ldsv1grp32;
   input [63:0]		      ldsv2grp32;
   input [63:0]		      ldsv0grp33;
   input [63:0]		      ldsv1grp33;
   input [63:0]		      ldsv2grp33;
   input [63:0]		      ldsv0grp34;
   input [63:0]		      ldsv1grp34;
   input [63:0]		      ldsv2grp34;
   input [63:0]		      ldsv0grp35;
   input [63:0]		      ldsv1grp35;
   input [63:0]		      ldsv2grp35;
   input [63:0]		      ldsv0grp36;
   input [63:0]		      ldsv1grp36;
   input [63:0]		      ldsv2grp36;
   input [63:0]		      ldsv0grp37;
   input [63:0]		      ldsv1grp37;
   input [63:0]		      ldsv2grp37;
   input [63:0]		      ldsv0grp38;
   input [63:0]		      ldsv1grp38;
   input [63:0]		      ldsv2grp38;
   input [63:0]		      ldsv0grp39;
   input [63:0]		      ldsv1grp39;
   input [63:0]		      ldsv2grp39;
   input [63:0]		      ldsv0grp40;
   input [63:0]		      ldsv1grp40;
   input [63:0]		      ldsv2grp40;
   input [63:0]		      ldsv0grp41;
   input [63:0]		      ldsv1grp41;
   input [63:0]		      ldsv2grp41;
   input [63:0]		      ldsv0grp42;
   input [63:0]		      ldsv1grp42;
   input [63:0]		      ldsv2grp42;
   input [63:0]		      ldsv0grp43;
   input [63:0]		      ldsv1grp43;
   input [63:0]		      ldsv2grp43;
   input [63:0]		      ldsv0grp44;
   input [63:0]		      ldsv1grp44;
   input [63:0]		      ldsv2grp44;
   input [63:0]		      ldsv0grp45;
   input [63:0]		      ldsv1grp45;
   input [63:0]		      ldsv2grp45;
   input [63:0]		      ldsv0grp46;
   input [63:0]		      ldsv1grp46;
   input [63:0]		      ldsv2grp46;
   input [63:0]		      ldsv0grp47;
   input [63:0]		      ldsv1grp47;
   input [63:0]		      ldsv2grp47;
   input [63:0]		      ldsv0grp48;
   input [63:0]		      ldsv1grp48;
   input [63:0]		      ldsv2grp48;
   input [63:0]		      ldsv0grp49;
   input [63:0]		      ldsv1grp49;
   input [63:0]		      ldsv2grp49;
   input [63:0]		      ldsv0grp50;
   input [63:0]		      ldsv1grp50;
   input [63:0]		      ldsv2grp50;
   input [63:0]		      ldsv0grp51;
   input [63:0]		      ldsv1grp51;
   input [63:0]		      ldsv2grp51;
   input [63:0]		      ldsv0grp52;
   input [63:0]		      ldsv1grp52;
   input [63:0]		      ldsv2grp52;
   input [63:0]		      ldsv0grp53;
   input [63:0]		      ldsv1grp53;
   input [63:0]		      ldsv2grp53;
   input [63:0]		      ldsv0grp54;
   input [63:0]		      ldsv1grp54;
   input [63:0]		      ldsv2grp54;
   input [63:0]		      ldsv0grp55;
   input [63:0]		      ldsv1grp55;
   input [63:0]		      ldsv2grp55;
   input [63:0]		      ldsv0grp56;
   input [63:0]		      ldsv1grp56;
   input [63:0]		      ldsv2grp56;
   input [63:0]		      ldsv0grp57;
   input [63:0]		      ldsv1grp57;
   input [63:0]		      ldsv2grp57;
   input [63:0]		      ldsv0grp58;
   input [63:0]		      ldsv1grp58;
   input [63:0]		      ldsv2grp58;
   input [63:0]		      ldsv0grp59;
   input [63:0]		      ldsv1grp59;
   input [63:0]		      ldsv2grp59;
   input [63:0]		      ldsv0grp60;
   input [63:0]		      ldsv1grp60;
   input [63:0]		      ldsv2grp60;
   input [63:0]		      ldsv0grp61;
   input [63:0]		      ldsv1grp61;
   input [63:0]		      ldsv2grp61;
   input [63:0]		      ldsv0grp62;
   input [63:0]		      ldsv1grp62;
   input [63:0]		      ldsv2grp62;
   input [63:0]		      ldsv0grp63;
   input [63:0]		      ldsv1grp63;
   input [63:0]		      ldsv2grp63;

   output 		      ldsv_ack;
   output [63:0] 	      ldsv_rdata;
   output 		      ldsv_err;
   
// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      ldsv_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration

niu_rw_ctl ldsv_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(ldsv_ack),
		      .rdata		(ldsv_rdata[63:0]),
		      .err		(ldsv_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(clk),
		      .sel		(ldsv_sel_reg),
		      .rd		(rd),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));

always @ (/*AUTOSENSE*/addr or ldsv0grp0 or ldsv0grp1 or ldsv0grp10
	  or ldsv0grp11 or ldsv0grp12 or ldsv0grp13 or ldsv0grp14
	  or ldsv0grp15 or ldsv0grp16 or ldsv0grp17 or ldsv0grp18
	  or ldsv0grp19 or ldsv0grp2 or ldsv0grp20 or ldsv0grp21
	  or ldsv0grp22 or ldsv0grp23 or ldsv0grp24 or ldsv0grp25
	  or ldsv0grp26 or ldsv0grp27 or ldsv0grp28 or ldsv0grp29
	  or ldsv0grp3 or ldsv0grp30 or ldsv0grp31 or ldsv0grp32
	  or ldsv0grp33 or ldsv0grp34 or ldsv0grp35 or ldsv0grp36
	  or ldsv0grp37 or ldsv0grp38 or ldsv0grp39 or ldsv0grp4
	  or ldsv0grp40 or ldsv0grp41 or ldsv0grp42 or ldsv0grp43
	  or ldsv0grp44 or ldsv0grp45 or ldsv0grp46 or ldsv0grp47
	  or ldsv0grp48 or ldsv0grp49 or ldsv0grp5 or ldsv0grp50
	  or ldsv0grp51 or ldsv0grp52 or ldsv0grp53 or ldsv0grp54
	  or ldsv0grp55 or ldsv0grp56 or ldsv0grp57 or ldsv0grp58
	  or ldsv0grp59 or ldsv0grp6 or ldsv0grp60 or ldsv0grp61
	  or ldsv0grp62 or ldsv0grp63 or ldsv0grp7 or ldsv0grp8
	  or ldsv0grp9 or ldsv1grp0 or ldsv1grp1 or ldsv1grp10
	  or ldsv1grp11 or ldsv1grp12 or ldsv1grp13 or ldsv1grp14
	  or ldsv1grp15 or ldsv1grp16 or ldsv1grp17 or ldsv1grp18
	  or ldsv1grp19 or ldsv1grp2 or ldsv1grp20 or ldsv1grp21
	  or ldsv1grp22 or ldsv1grp23 or ldsv1grp24 or ldsv1grp25
	  or ldsv1grp26 or ldsv1grp27 or ldsv1grp28 or ldsv1grp29
	  or ldsv1grp3 or ldsv1grp30 or ldsv1grp31 or ldsv1grp32
	  or ldsv1grp33 or ldsv1grp34 or ldsv1grp35 or ldsv1grp36
	  or ldsv1grp37 or ldsv1grp38 or ldsv1grp39 or ldsv1grp4
	  or ldsv1grp40 or ldsv1grp41 or ldsv1grp42 or ldsv1grp43
	  or ldsv1grp44 or ldsv1grp45 or ldsv1grp46 or ldsv1grp47
	  or ldsv1grp48 or ldsv1grp49 or ldsv1grp5 or ldsv1grp50
	  or ldsv1grp51 or ldsv1grp52 or ldsv1grp53 or ldsv1grp54
	  or ldsv1grp55 or ldsv1grp56 or ldsv1grp57 or ldsv1grp58
	  or ldsv1grp59 or ldsv1grp6 or ldsv1grp60 or ldsv1grp61
	  or ldsv1grp62 or ldsv1grp63 or ldsv1grp7 or ldsv1grp8
	  or ldsv1grp9 or ldsv2grp0 or ldsv2grp1 or ldsv2grp10
	  or ldsv2grp11 or ldsv2grp12 or ldsv2grp13 or ldsv2grp14
	  or ldsv2grp15 or ldsv2grp16 or ldsv2grp17 or ldsv2grp18
	  or ldsv2grp19 or ldsv2grp2 or ldsv2grp20 or ldsv2grp21
	  or ldsv2grp22 or ldsv2grp23 or ldsv2grp24 or ldsv2grp25
	  or ldsv2grp26 or ldsv2grp27 or ldsv2grp28 or ldsv2grp29
	  or ldsv2grp3 or ldsv2grp30 or ldsv2grp31 or ldsv2grp32
	  or ldsv2grp33 or ldsv2grp34 or ldsv2grp35 or ldsv2grp36
	  or ldsv2grp37 or ldsv2grp38 or ldsv2grp39 or ldsv2grp4
	  or ldsv2grp40 or ldsv2grp41 or ldsv2grp42 or ldsv2grp43
	  or ldsv2grp44 or ldsv2grp45 or ldsv2grp46 or ldsv2grp47
	  or ldsv2grp48 or ldsv2grp49 or ldsv2grp5 or ldsv2grp50
	  or ldsv2grp51 or ldsv2grp52 or ldsv2grp53 or ldsv2grp54
	  or ldsv2grp55 or ldsv2grp56 or ldsv2grp57 or ldsv2grp58
	  or ldsv2grp59 or ldsv2grp6 or ldsv2grp60 or ldsv2grp61
	  or ldsv2grp62 or ldsv2grp63 or ldsv2grp7 or ldsv2grp8
	  or ldsv2grp9)
  begin
                  non_qualified_addr_err = 0;
                  rd_data            = 64'hdead_beef_dead_beef;

    case({addr[18:3],3'b0}) //synopsys parallel_case full_case infer_mux
                  // grp0
    19'h0_0000:   rd_data            = ldsv0grp0;
    19'h0_0008:   rd_data            = ldsv1grp0;
    19'h0_0010:   rd_data            = ldsv2grp0;
                  // grp1
    19'h0_2000:   rd_data            = ldsv0grp1;
    19'h0_2008:   rd_data            = ldsv1grp1;
    19'h0_2010:   rd_data            = ldsv2grp1;
                  // grp2
    19'h0_4000:   rd_data            = ldsv0grp2;
    19'h0_4008:   rd_data            = ldsv1grp2;
    19'h0_4010:   rd_data            = ldsv2grp2;
                  // grp3
    19'h0_6000:   rd_data            = ldsv0grp3;
    19'h0_6008:   rd_data            = ldsv1grp3;
    19'h0_6010:   rd_data            = ldsv2grp3;
                  // grp4
    19'h0_8000:   rd_data            = ldsv0grp4;
    19'h0_8008:   rd_data            = ldsv1grp4;
    19'h0_8010:   rd_data            = ldsv2grp4;
                  // grp5
    19'h0_a000:   rd_data            = ldsv0grp5;
    19'h0_a008:   rd_data            = ldsv1grp5;
    19'h0_a010:   rd_data            = ldsv2grp5;
                  // grp6
    19'h0_c000:   rd_data            = ldsv0grp6;
    19'h0_c008:   rd_data            = ldsv1grp6;
    19'h0_c010:   rd_data            = ldsv2grp6;
                  // grp7
    19'h0_e000:   rd_data            = ldsv0grp7;
    19'h0_e008:   rd_data            = ldsv1grp7;
    19'h0_e010:   rd_data            = ldsv2grp7;
                  // grp8
    19'h1_0000:   rd_data            = ldsv0grp8;
    19'h1_0008:   rd_data            = ldsv1grp8;
    19'h1_0010:   rd_data            = ldsv2grp8;
                  // grp9
    19'h1_2000:   rd_data            = ldsv0grp9;
    19'h1_2008:   rd_data            = ldsv1grp9;
    19'h1_2010:   rd_data            = ldsv2grp9;
                  // grp10
    19'h1_4000:   rd_data            = ldsv0grp10;
    19'h1_4008:   rd_data            = ldsv1grp10;
    19'h1_4010:   rd_data            = ldsv2grp10;
                  // grp11
    19'h1_6000:   rd_data            = ldsv0grp11;
    19'h1_6008:   rd_data            = ldsv1grp11;
    19'h1_6010:   rd_data            = ldsv2grp11;
                  // grp12
    19'h1_8000:   rd_data            = ldsv0grp12;
    19'h1_8008:   rd_data            = ldsv1grp12;
    19'h1_8010:   rd_data            = ldsv2grp12;
                  // grp13
    19'h1_a000:   rd_data            = ldsv0grp13;
    19'h1_a008:   rd_data            = ldsv1grp13;
    19'h1_a010:   rd_data            = ldsv2grp13;
                  // grp14
    19'h1_c000:   rd_data            = ldsv0grp14;
    19'h1_c008:   rd_data            = ldsv1grp14;
    19'h1_c010:   rd_data            = ldsv2grp14;
                  // grp15
    19'h1_e000:   rd_data            = ldsv0grp15;
    19'h1_e008:   rd_data            = ldsv1grp15;
    19'h1_e010:   rd_data            = ldsv2grp15;
                  // grp16
    19'h2_0000:   rd_data            = ldsv0grp16;
    19'h2_0008:   rd_data            = ldsv1grp16;
    19'h2_0010:   rd_data            = ldsv2grp16;
                  // grp17
    19'h2_2000:   rd_data            = ldsv0grp17;
    19'h2_2008:   rd_data            = ldsv1grp17;
    19'h2_2010:   rd_data            = ldsv2grp17;
                  // grp18
    19'h2_4000:   rd_data            = ldsv0grp18;
    19'h2_4008:   rd_data            = ldsv1grp18;
    19'h2_4010:   rd_data            = ldsv2grp18;
                  // grp19
    19'h2_6000:   rd_data            = ldsv0grp19;
    19'h2_6008:   rd_data            = ldsv1grp19;
    19'h2_6010:   rd_data            = ldsv2grp19;
                  // grp20
    19'h2_8000:   rd_data            = ldsv0grp20;
    19'h2_8008:   rd_data            = ldsv1grp20;
    19'h2_8010:   rd_data            = ldsv2grp20;
                  // grp21
    19'h2_a000:   rd_data            = ldsv0grp21;
    19'h2_a008:   rd_data            = ldsv1grp21;
    19'h2_a010:   rd_data            = ldsv2grp21;
                  // grp22
    19'h2_c000:   rd_data            = ldsv0grp22;
    19'h2_c008:   rd_data            = ldsv1grp22;
    19'h2_c010:   rd_data            = ldsv2grp22;
                  // grp23
    19'h2_e000:   rd_data            = ldsv0grp23;
    19'h2_e008:   rd_data            = ldsv1grp23;
    19'h2_e010:   rd_data            = ldsv2grp23;
                  // grp24
    19'h3_0000:   rd_data            = ldsv0grp24;
    19'h3_0008:   rd_data            = ldsv1grp24;
    19'h3_0010:   rd_data            = ldsv2grp24;
                  // grp25
    19'h3_2000:   rd_data            = ldsv0grp25;
    19'h3_2008:   rd_data            = ldsv1grp25;
    19'h3_2010:   rd_data            = ldsv2grp25;
                  // grp26
    19'h3_4000:   rd_data            = ldsv0grp26;
    19'h3_4008:   rd_data            = ldsv1grp26;
    19'h3_4010:   rd_data            = ldsv2grp26;
                  // grp27
    19'h3_6000:   rd_data            = ldsv0grp27;
    19'h3_6008:   rd_data            = ldsv1grp27;
    19'h3_6010:   rd_data            = ldsv2grp27;
                  // grp28
    19'h3_8000:   rd_data            = ldsv0grp28;
    19'h3_8008:   rd_data            = ldsv1grp28;
    19'h3_8010:   rd_data            = ldsv2grp28;
                  // grp29
    19'h3_a000:   rd_data            = ldsv0grp29;
    19'h3_a008:   rd_data            = ldsv1grp29;
    19'h3_a010:   rd_data            = ldsv2grp29;
                  // grp30
    19'h3_c000:   rd_data            = ldsv0grp30;
    19'h3_c008:   rd_data            = ldsv1grp30;
    19'h3_c010:   rd_data            = ldsv2grp30;
                  // grp31
    19'h3_e000:   rd_data            = ldsv0grp31;
    19'h3_e008:   rd_data            = ldsv1grp31;
    19'h3_e010:   rd_data            = ldsv2grp31;
                  // grp32
    19'h4_0000:   rd_data            = ldsv0grp32;
    19'h4_0008:   rd_data            = ldsv1grp32;
    19'h4_0010:   rd_data            = ldsv2grp32;
                  // grp33
    19'h4_2000:   rd_data            = ldsv0grp33;
    19'h4_2008:   rd_data            = ldsv1grp33;
    19'h4_2010:   rd_data            = ldsv2grp33;
                  // grp34
    19'h4_4000:   rd_data            = ldsv0grp34;
    19'h4_4008:   rd_data            = ldsv1grp34;
    19'h4_4010:   rd_data            = ldsv2grp34;
                  // grp35
    19'h4_6000:   rd_data            = ldsv0grp35;
    19'h4_6008:   rd_data            = ldsv1grp35;
    19'h4_6010:   rd_data            = ldsv2grp35;
                  // grp36
    19'h4_8000:   rd_data            = ldsv0grp36;
    19'h4_8008:   rd_data            = ldsv1grp36;
    19'h4_8010:   rd_data            = ldsv2grp36;
                  // grp37
    19'h4_a000:   rd_data            = ldsv0grp37;
    19'h4_a008:   rd_data            = ldsv1grp37;
    19'h4_a010:   rd_data            = ldsv2grp37;
                  // grp38
    19'h4_c000:   rd_data            = ldsv0grp38;
    19'h4_c008:   rd_data            = ldsv1grp38;
    19'h4_c010:   rd_data            = ldsv2grp38;
                  // grp39
    19'h4_e000:   rd_data            = ldsv0grp39;
    19'h4_e008:   rd_data            = ldsv1grp39;
    19'h4_e010:   rd_data            = ldsv2grp39;
                  // grp40
    19'h5_0000:   rd_data            = ldsv0grp40;
    19'h5_0008:   rd_data            = ldsv1grp40;
    19'h5_0010:   rd_data            = ldsv2grp40;
                  // grp41
    19'h5_2000:   rd_data            = ldsv0grp41;
    19'h5_2008:   rd_data            = ldsv1grp41;
    19'h5_2010:   rd_data            = ldsv2grp41;
                  // grp42
    19'h5_4000:   rd_data            = ldsv0grp42;
    19'h5_4008:   rd_data            = ldsv1grp42;
    19'h5_4010:   rd_data            = ldsv2grp42;
                  // grp43
    19'h5_6000:   rd_data            = ldsv0grp43;
    19'h5_6008:   rd_data            = ldsv1grp43;
    19'h5_6010:   rd_data            = ldsv2grp43;
                  // grp44
    19'h5_8000:   rd_data            = ldsv0grp44;
    19'h5_8008:   rd_data            = ldsv1grp44;
    19'h5_8010:   rd_data            = ldsv2grp44;
                  // grp45
    19'h5_a000:   rd_data            = ldsv0grp45;
    19'h5_a008:   rd_data            = ldsv1grp45;
    19'h5_a010:   rd_data            = ldsv2grp45;
                  // grp46
    19'h5_c000:   rd_data            = ldsv0grp46;
    19'h5_c008:   rd_data            = ldsv1grp46;
    19'h5_c010:   rd_data            = ldsv2grp46;
                  // grp47
    19'h5_e000:   rd_data            = ldsv0grp47;
    19'h5_e008:   rd_data            = ldsv1grp47;
    19'h5_e010:   rd_data            = ldsv2grp47;
                  // grp48
    19'h6_0000:   rd_data            = ldsv0grp48;
    19'h6_0008:   rd_data            = ldsv1grp48;
    19'h6_0010:   rd_data            = ldsv2grp48;
                  // grp49
    19'h6_2000:   rd_data            = ldsv0grp49;
    19'h6_2008:   rd_data            = ldsv1grp49;
    19'h6_2010:   rd_data            = ldsv2grp49;
                  // grp50
    19'h6_4000:   rd_data            = ldsv0grp50;
    19'h6_4008:   rd_data            = ldsv1grp50;
    19'h6_4010:   rd_data            = ldsv2grp50;
                  // grp51
    19'h6_6000:   rd_data            = ldsv0grp51;
    19'h6_6008:   rd_data            = ldsv1grp51;
    19'h6_6010:   rd_data            = ldsv2grp51;
                  // grp52
    19'h6_8000:   rd_data            = ldsv0grp52;
    19'h6_8008:   rd_data            = ldsv1grp52;
    19'h6_8010:   rd_data            = ldsv2grp52;
                  // grp53
    19'h6_a000:   rd_data            = ldsv0grp53;
    19'h6_a008:   rd_data            = ldsv1grp53;
    19'h6_a010:   rd_data            = ldsv2grp53;
                  // grp54
    19'h6_c000:   rd_data            = ldsv0grp54;
    19'h6_c008:   rd_data            = ldsv1grp54;
    19'h6_c010:   rd_data            = ldsv2grp54;
                  // grp55
    19'h6_e000:   rd_data            = ldsv0grp55;
    19'h6_e008:   rd_data            = ldsv1grp55;
    19'h6_e010:   rd_data            = ldsv2grp55;
                  // grp56
    19'h7_0000:   rd_data            = ldsv0grp56;
    19'h7_0008:   rd_data            = ldsv1grp56;
    19'h7_0010:   rd_data            = ldsv2grp56;
                  // grp57
    19'h7_2000:   rd_data            = ldsv0grp57;
    19'h7_2008:   rd_data            = ldsv1grp57;
    19'h7_2010:   rd_data            = ldsv2grp57;
                  // grp58
    19'h7_4000:   rd_data            = ldsv0grp58;
    19'h7_4008:   rd_data            = ldsv1grp58;
    19'h7_4010:   rd_data            = ldsv2grp58;
                  // grp59
    19'h7_6000:   rd_data            = ldsv0grp59;
    19'h7_6008:   rd_data            = ldsv1grp59;
    19'h7_6010:   rd_data            = ldsv2grp59;
                  // grp60
    19'h7_8000:   rd_data            = ldsv0grp60;
    19'h7_8008:   rd_data            = ldsv1grp60;
    19'h7_8010:   rd_data            = ldsv2grp60;
                  // grp61
    19'h7_a000:   rd_data            = ldsv0grp61;
    19'h7_a008:   rd_data            = ldsv1grp61;
    19'h7_a010:   rd_data            = ldsv2grp61;
                  // grp62
    19'h7_c000:   rd_data            = ldsv0grp62;
    19'h7_c008:   rd_data            = ldsv1grp62;
    19'h7_c010:   rd_data            = ldsv2grp62;
                  // grp63
    19'h7_e000:   rd_data            = ldsv0grp63;
    19'h7_e008:   rd_data            = ldsv1grp63;
    19'h7_e010:   rd_data            = ldsv2grp63;

    default:    begin
                  rd_data            = 64'hdead_beef_dead_beef;
                  non_qualified_addr_err = 1;
	        end   // case: default
    endcase // case({addr[18:3],3'b0})
  end // always @ (...
      
endmodule // niu_pio_ldsv_decoder
