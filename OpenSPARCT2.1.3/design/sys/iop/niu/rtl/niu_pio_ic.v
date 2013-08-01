// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ic.v
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
 * File Name    : niu_pio_ic.v
 * Author Name  : John Lo
 * Description  : Interrupt Controller
 *                
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/18/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/
module niu_pio_ic (/*AUTOARG*/
   // Outputs
   intr_valid, intr_invalid, rst_at, group, memship_group0, 
   memship_group1, memship_group2, memship_group3, memship_group4, 
   memship_group5, memship_group6, memship_group7, memship_group8, 
   memship_group9, memship_group10, memship_group11, memship_group12, 
   memship_group13, memship_group14, memship_group15, 
   memship_group16, memship_group17, memship_group18, 
   memship_group19, memship_group20, memship_group21, 
   memship_group22, memship_group23, memship_group24, 
   memship_group25, memship_group26, memship_group27, 
   memship_group28, memship_group29, memship_group30, 
   memship_group31, memship_group32, memship_group33, 
   memship_group34, memship_group35, memship_group36, 
   memship_group37, memship_group38, memship_group39, 
   memship_group40, memship_group41, memship_group42, 
   memship_group43, memship_group44, memship_group45, 
   memship_group46, memship_group47, memship_group48, 
   memship_group49, memship_group50, memship_group51, 
   memship_group52, memship_group53, memship_group54, 
   memship_group55, memship_group56, memship_group57, 
   memship_group58, memship_group59, memship_group60, 
   memship_group61, memship_group62, memship_group63, 
   ig_state,
   // Inputs
   clk, reset, ldgn0, ldgn1, ldgn2, ldgn3, ldgn4, ldgn5, 
   ldgn6, ldgn7, ldgn8, ldgn9, ldgn10, ldgn11, ldgn12, ldgn13, 
   ldgn14, ldgn15, ldgn16, ldgn17, ldgn18, ldgn19, ldgn20, ldgn21, 
   ldgn22, ldgn23, ldgn24, ldgn25, ldgn26, ldgn27, ldgn28, ldgn29, 
   ldgn30, ldgn31, ldgn32, ldgn33, ldgn34, ldgn35, ldgn36, ldgn37, 
   ldgn38, ldgn39, ldgn40, ldgn41, ldgn42, ldgn43, ldgn44, ldgn45, 
   ldgn46, ldgn47, ldgn48, ldgn49, ldgn50, ldgn51, ldgn52, ldgn53, 
   ldgn54, ldgn55, ldgn56, ldgn57, ldgn58, ldgn59, ldgn60, ldgn61, 
   ldgn62, ldgn63, ldgn64, ldgn65, ldgn66, ldgn67, ldgn68, ldf_mask0, 
   ldf_mask1, ldf_mask2, ldf_mask3, ldf_mask4, ldf_mask5, ldf_mask6, 
   ldf_mask7, ldf_mask8, ldf_mask9, ldf_mask10, ldf_mask11, 
   ldf_mask12, ldf_mask13, ldf_mask14, ldf_mask15, ldf_mask16, 
   ldf_mask17, ldf_mask18, ldf_mask19, ldf_mask20, ldf_mask21, 
   ldf_mask22, ldf_mask23, ldf_mask24, ldf_mask25, ldf_mask26, 
   ldf_mask27, ldf_mask28, ldf_mask29, ldf_mask30, ldf_mask31, 
   ldf_mask32, ldf_mask33, ldf_mask34, ldf_mask35, ldf_mask36, 
   ldf_mask37, ldf_mask38, ldf_mask39, ldf_mask40, ldf_mask41, 
   ldf_mask42, ldf_mask43, ldf_mask44, ldf_mask45, ldf_mask46, 
   ldf_mask47, ldf_mask48, ldf_mask49, ldf_mask50, ldf_mask51, 
   ldf_mask52, ldf_mask53, ldf_mask54, ldf_mask55, ldf_mask56, 
   ldf_mask57, ldf_mask58, ldf_mask59, ldf_mask60, ldf_mask61, 
   ldf_mask62, ldf_mask63, ldf_mask64, ldf_mask65, ldf_mask66, 
   ldf_mask67, ldf_mask68, ldfi, ldfj, arm0, arm1, arm2, arm3, arm4, 
   arm5, arm6, arm7, arm8, arm9, arm10, arm11, arm12, arm13, arm14, 
   arm15, arm16, arm17, arm18, arm19, arm20, arm21, arm22, arm23, 
   arm24, arm25, arm26, arm27, arm28, arm29, arm30, arm31, arm32, 
   arm33, arm34, arm35, arm36, arm37, arm38, arm39, arm40, arm41, 
   arm42, arm43, arm44, arm45, arm46, arm47, arm48, arm49, arm50, 
   arm51, arm52, arm53, arm54, arm55, arm56, arm57, arm58, arm59, 
   arm60, arm61, arm62, arm63, timer0, timer1, timer2, timer3, 
   timer4, timer5, timer6, timer7, timer8, timer9, timer10, timer11, 
   timer12, timer13, timer14, timer15, timer16, timer17, timer18, 
   timer19, timer20, timer21, timer22, timer23, timer24, timer25, 
   timer26, timer27, timer28, timer29, timer30, timer31, timer32, 
   timer33, timer34, timer35, timer36, timer37, timer38, timer39, 
   timer40, timer41, timer42, timer43, timer44, timer45, timer46, 
   timer47, timer48, timer49, timer50, timer51, timer52, timer53, 
   timer54, timer55, timer56, timer57, timer58, timer59, timer60, 
   timer61, timer62, timer63, ibusy
   );
   
   input 		      clk;
   input 		      reset;
   
   input [5:0] 		      ldgn0 ;
   input [5:0] 		      ldgn1 ;
   input [5:0] 		      ldgn2 ;
   input [5:0] 		      ldgn3 ;
   input [5:0] 		      ldgn4 ;
   input [5:0] 		      ldgn5 ;
   input [5:0] 		      ldgn6 ;
   input [5:0] 		      ldgn7 ;
   input [5:0] 		      ldgn8 ;
   input [5:0] 		      ldgn9 ;
   input [5:0] 		      ldgn10;
   input [5:0] 		      ldgn11;
   input [5:0] 		      ldgn12;
   input [5:0] 		      ldgn13;
   input [5:0] 		      ldgn14;
   input [5:0] 		      ldgn15;
   input [5:0] 		      ldgn16;
   input [5:0] 		      ldgn17;
   input [5:0] 		      ldgn18;
   input [5:0] 		      ldgn19;
   input [5:0] 		      ldgn20;
   input [5:0] 		      ldgn21;
   input [5:0] 		      ldgn22;
   input [5:0] 		      ldgn23;
   input [5:0] 		      ldgn24;
   input [5:0] 		      ldgn25;
   input [5:0] 		      ldgn26;
   input [5:0] 		      ldgn27;
   input [5:0] 		      ldgn28;
   input [5:0] 		      ldgn29;
   input [5:0] 		      ldgn30;
   input [5:0] 		      ldgn31;
   input [5:0] 		      ldgn32;
   input [5:0] 		      ldgn33;
   input [5:0] 		      ldgn34;
   input [5:0] 		      ldgn35;
   input [5:0] 		      ldgn36;
   input [5:0] 		      ldgn37;
   input [5:0] 		      ldgn38;
   input [5:0] 		      ldgn39;
   input [5:0] 		      ldgn40;
   input [5:0] 		      ldgn41;
   input [5:0] 		      ldgn42;
   input [5:0] 		      ldgn43;
   input [5:0] 		      ldgn44;
   input [5:0] 		      ldgn45;
   input [5:0] 		      ldgn46;
   input [5:0] 		      ldgn47;
   input [5:0] 		      ldgn48;
   input [5:0] 		      ldgn49;
   input [5:0] 		      ldgn50;
   input [5:0] 		      ldgn51;
   input [5:0] 		      ldgn52;
   input [5:0] 		      ldgn53;
   input [5:0] 		      ldgn54;
   input [5:0] 		      ldgn55;
   input [5:0] 		      ldgn56;
   input [5:0] 		      ldgn57;
   input [5:0] 		      ldgn58;
   input [5:0] 		      ldgn59;
   input [5:0] 		      ldgn60;
   input [5:0] 		      ldgn61;
   input [5:0] 		      ldgn62;
   input [5:0] 		      ldgn63;
   input [5:0] 		      ldgn64;
   input [5:0] 		      ldgn65;
   input [5:0] 		      ldgn66;
   input [5:0] 		      ldgn67;
   input [5:0] 		      ldgn68;

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
   input [1:0]		      ldf_mask64;
   input [1:0]		      ldf_mask65;
   input [1:0]		      ldf_mask66;
   input [1:0]		      ldf_mask67;
   input [1:0]		      ldf_mask68;

   input [68:0] 	      ldfi;
   input [68:0] 	      ldfj;

   input  		      arm0 ;
   input  		      arm1 ;
   input  		      arm2 ;
   input  		      arm3 ;
   input  		      arm4 ;
   input  		      arm5 ;
   input  		      arm6 ;
   input  		      arm7 ;
   input  		      arm8 ;
   input  		      arm9 ;
   input  		      arm10;
   input  		      arm11;
   input  		      arm12;
   input  		      arm13;
   input  		      arm14;
   input  		      arm15;
   input  		      arm16;
   input  		      arm17;
   input  		      arm18;
   input  		      arm19;
   input  		      arm20;
   input  		      arm21;
   input  		      arm22;
   input  		      arm23;
   input  		      arm24;
   input  		      arm25;
   input  		      arm26;
   input  		      arm27;
   input  		      arm28;
   input  		      arm29;
   input  		      arm30;
   input  		      arm31;
   input  		      arm32;
   input  		      arm33;
   input  		      arm34;
   input  		      arm35;
   input  		      arm36;
   input  		      arm37;
   input  		      arm38;
   input  		      arm39;
   input  		      arm40;
   input  		      arm41;
   input  		      arm42;
   input  		      arm43;
   input  		      arm44;
   input  		      arm45;
   input  		      arm46;
   input  		      arm47;
   input  		      arm48;
   input  		      arm49;
   input  		      arm50;
   input  		      arm51;
   input  		      arm52;
   input  		      arm53;
   input  		      arm54;
   input  		      arm55;
   input  		      arm56;
   input  		      arm57;
   input  		      arm58;
   input  		      arm59;
   input  		      arm60;
   input  		      arm61;
   input  		      arm62;
   input  		      arm63;

   input [5:0] 		      timer0 ;
   input [5:0] 		      timer1 ;
   input [5:0] 		      timer2 ;
   input [5:0] 		      timer3 ;
   input [5:0] 		      timer4 ;
   input [5:0] 		      timer5 ;
   input [5:0] 		      timer6 ;
   input [5:0] 		      timer7 ;
   input [5:0] 		      timer8 ;
   input [5:0] 		      timer9 ;
   input [5:0] 		      timer10;
   input [5:0] 		      timer11;
   input [5:0] 		      timer12;
   input [5:0] 		      timer13;
   input [5:0] 		      timer14;
   input [5:0] 		      timer15;
   input [5:0] 		      timer16;
   input [5:0] 		      timer17;
   input [5:0] 		      timer18;
   input [5:0] 		      timer19;
   input [5:0] 		      timer20;
   input [5:0] 		      timer21;
   input [5:0] 		      timer22;
   input [5:0] 		      timer23;
   input [5:0] 		      timer24;
   input [5:0] 		      timer25;
   input [5:0] 		      timer26;
   input [5:0] 		      timer27;
   input [5:0] 		      timer28;
   input [5:0] 		      timer29;
   input [5:0] 		      timer30;
   input [5:0] 		      timer31;
   input [5:0] 		      timer32;
   input [5:0] 		      timer33;
   input [5:0] 		      timer34;
   input [5:0] 		      timer35;
   input [5:0] 		      timer36;
   input [5:0] 		      timer37;
   input [5:0] 		      timer38;
   input [5:0] 		      timer39;
   input [5:0] 		      timer40;
   input [5:0] 		      timer41;
   input [5:0] 		      timer42;
   input [5:0] 		      timer43;
   input [5:0] 		      timer44;
   input [5:0] 		      timer45;
   input [5:0] 		      timer46;
   input [5:0] 		      timer47;
   input [5:0] 		      timer48;
   input [5:0] 		      timer49;
   input [5:0] 		      timer50;
   input [5:0] 		      timer51;
   input [5:0] 		      timer52;
   input [5:0] 		      timer53;
   input [5:0] 		      timer54;
   input [5:0] 		      timer55;
   input [5:0] 		      timer56;
   input [5:0] 		      timer57;
   input [5:0] 		      timer58;
   input [5:0] 		      timer59;
   input [5:0] 		      timer60;
   input [5:0] 		      timer61;
   input [5:0] 		      timer62;
   input [5:0] 		      timer63;

   input 		      ibusy;
   output 		      intr_valid;
   output 		      intr_invalid;
   output 		      rst_at;
   output [5:0] 	      group;
   
   output [68:0] 	      memship_group0 ;
   output [68:0] 	      memship_group1 ;
   output [68:0] 	      memship_group2 ;
   output [68:0] 	      memship_group3 ;
   output [68:0] 	      memship_group4 ;
   output [68:0] 	      memship_group5 ;
   output [68:0] 	      memship_group6 ;
   output [68:0] 	      memship_group7 ;
   output [68:0] 	      memship_group8 ;
   output [68:0] 	      memship_group9 ;
   output [68:0] 	      memship_group10;
   output [68:0] 	      memship_group11;
   output [68:0] 	      memship_group12;
   output [68:0] 	      memship_group13;
   output [68:0] 	      memship_group14;
   output [68:0] 	      memship_group15;
   output [68:0] 	      memship_group16;
   output [68:0] 	      memship_group17;
   output [68:0] 	      memship_group18;
   output [68:0] 	      memship_group19;
   output [68:0] 	      memship_group20;
   output [68:0] 	      memship_group21;
   output [68:0] 	      memship_group22;
   output [68:0] 	      memship_group23;
   output [68:0] 	      memship_group24;
   output [68:0] 	      memship_group25;
   output [68:0] 	      memship_group26;
   output [68:0] 	      memship_group27;
   output [68:0] 	      memship_group28;
   output [68:0] 	      memship_group29;
   output [68:0] 	      memship_group30;
   output [68:0] 	      memship_group31;
   output [68:0] 	      memship_group32;
   output [68:0] 	      memship_group33;
   output [68:0] 	      memship_group34;
   output [68:0] 	      memship_group35;
   output [68:0] 	      memship_group36;
   output [68:0] 	      memship_group37;
   output [68:0] 	      memship_group38;
   output [68:0] 	      memship_group39;
   output [68:0] 	      memship_group40;
   output [68:0] 	      memship_group41;
   output [68:0] 	      memship_group42;
   output [68:0] 	      memship_group43;
   output [68:0] 	      memship_group44;
   output [68:0] 	      memship_group45;
   output [68:0] 	      memship_group46;
   output [68:0] 	      memship_group47;
   output [68:0] 	      memship_group48;
   output [68:0] 	      memship_group49;
   output [68:0] 	      memship_group50;
   output [68:0] 	      memship_group51;
   output [68:0] 	      memship_group52;
   output [68:0] 	      memship_group53;
   output [68:0] 	      memship_group54;
   output [68:0] 	      memship_group55;
   output [68:0] 	      memship_group56;
   output [68:0] 	      memship_group57;
   output [68:0] 	      memship_group58;
   output [68:0] 	      memship_group59;
   output [68:0] 	      memship_group60;
   output [68:0] 	      memship_group61;
   output [68:0] 	      memship_group62;
   output [68:0] 	      memship_group63;

   output [2:0]		      ig_state;		// From niu_pio_ig_sm of niu_pio_ig_sm.v
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			latch_nx_pri_group;	// From niu_pio_ig_sm of niu_pio_ig_sm.v
wire			latch_req_mux_out;	// From niu_pio_ig_sm of niu_pio_ig_sm.v
wire			latch_result_group;	// From niu_pio_ig_sm of niu_pio_ig_sm.v
// End of automatics
   wire  [63:0] 	      ldgn_map0 ;
   wire  [63:0] 	      ldgn_map1 ;
   wire  [63:0] 	      ldgn_map2 ;
   wire  [63:0] 	      ldgn_map3 ;
   wire  [63:0] 	      ldgn_map4 ;
   wire  [63:0] 	      ldgn_map5 ;
   wire  [63:0] 	      ldgn_map6 ;
   wire  [63:0] 	      ldgn_map7 ;
   wire  [63:0] 	      ldgn_map8 ;
   wire  [63:0] 	      ldgn_map9 ;
   wire  [63:0] 	      ldgn_map10;
   wire  [63:0] 	      ldgn_map11;
   wire  [63:0] 	      ldgn_map12;
   wire  [63:0] 	      ldgn_map13;
   wire  [63:0] 	      ldgn_map14;
   wire  [63:0] 	      ldgn_map15;
   wire  [63:0] 	      ldgn_map16;
   wire  [63:0] 	      ldgn_map17;
   wire  [63:0] 	      ldgn_map18;
   wire  [63:0] 	      ldgn_map19;
   wire  [63:0] 	      ldgn_map20;
   wire  [63:0] 	      ldgn_map21;
   wire  [63:0] 	      ldgn_map22;
   wire  [63:0] 	      ldgn_map23;
   wire  [63:0] 	      ldgn_map24;
   wire  [63:0] 	      ldgn_map25;
   wire  [63:0] 	      ldgn_map26;
   wire  [63:0] 	      ldgn_map27;
   wire  [63:0] 	      ldgn_map28;
   wire  [63:0] 	      ldgn_map29;
   wire  [63:0] 	      ldgn_map30;
   wire  [63:0] 	      ldgn_map31;
   wire  [63:0] 	      ldgn_map32;
   wire  [63:0] 	      ldgn_map33;
   wire  [63:0] 	      ldgn_map34;
   wire  [63:0] 	      ldgn_map35;
   wire  [63:0] 	      ldgn_map36;
   wire  [63:0] 	      ldgn_map37;
   wire  [63:0] 	      ldgn_map38;
   wire  [63:0] 	      ldgn_map39;
   wire  [63:0] 	      ldgn_map40;
   wire  [63:0] 	      ldgn_map41;
   wire  [63:0] 	      ldgn_map42;
   wire  [63:0] 	      ldgn_map43;
   wire  [63:0] 	      ldgn_map44;
   wire  [63:0] 	      ldgn_map45;
   wire  [63:0] 	      ldgn_map46;
   wire  [63:0] 	      ldgn_map47;
   wire  [63:0] 	      ldgn_map48;
   wire  [63:0] 	      ldgn_map49;
   wire  [63:0] 	      ldgn_map50;
   wire  [63:0] 	      ldgn_map51;
   wire  [63:0] 	      ldgn_map52;
   wire  [63:0] 	      ldgn_map53;
   wire  [63:0] 	      ldgn_map54;
   wire  [63:0] 	      ldgn_map55;
   wire  [63:0] 	      ldgn_map56;
   wire  [63:0] 	      ldgn_map57;
   wire  [63:0] 	      ldgn_map58;
   wire  [63:0] 	      ldgn_map59;
   wire  [63:0] 	      ldgn_map60;
   wire  [63:0] 	      ldgn_map61;
   wire  [63:0] 	      ldgn_map62;
   wire  [63:0] 	      ldgn_map63;
   wire  [63:0] 	      ldgn_map64;
   wire  [63:0] 	      ldgn_map65;
   wire  [63:0] 	      ldgn_map66;
   wire  [63:0] 	      ldgn_map67;
   wire  [63:0] 	      ldgn_map68;

   wire  [68:0] 	      memship_group0 ;
   wire  [68:0] 	      memship_group1 ;
   wire  [68:0] 	      memship_group2 ;
   wire  [68:0] 	      memship_group3 ;
   wire  [68:0] 	      memship_group4 ;
   wire  [68:0] 	      memship_group5 ;
   wire  [68:0] 	      memship_group6 ;
   wire  [68:0] 	      memship_group7 ;
   wire  [68:0] 	      memship_group8 ;
   wire  [68:0] 	      memship_group9 ;
   wire  [68:0] 	      memship_group10;
   wire  [68:0] 	      memship_group11;
   wire  [68:0] 	      memship_group12;
   wire  [68:0] 	      memship_group13;
   wire  [68:0] 	      memship_group14;
   wire  [68:0] 	      memship_group15;
   wire  [68:0] 	      memship_group16;
   wire  [68:0] 	      memship_group17;
   wire  [68:0] 	      memship_group18;
   wire  [68:0] 	      memship_group19;
   wire  [68:0] 	      memship_group20;
   wire  [68:0] 	      memship_group21;
   wire  [68:0] 	      memship_group22;
   wire  [68:0] 	      memship_group23;
   wire  [68:0] 	      memship_group24;
   wire  [68:0] 	      memship_group25;
   wire  [68:0] 	      memship_group26;
   wire  [68:0] 	      memship_group27;
   wire  [68:0] 	      memship_group28;
   wire  [68:0] 	      memship_group29;
   wire  [68:0] 	      memship_group30;
   wire  [68:0] 	      memship_group31;
   wire  [68:0] 	      memship_group32;
   wire  [68:0] 	      memship_group33;
   wire  [68:0] 	      memship_group34;
   wire  [68:0] 	      memship_group35;
   wire  [68:0] 	      memship_group36;
   wire  [68:0] 	      memship_group37;
   wire  [68:0] 	      memship_group38;
   wire  [68:0] 	      memship_group39;
   wire  [68:0] 	      memship_group40;
   wire  [68:0] 	      memship_group41;
   wire  [68:0] 	      memship_group42;
   wire  [68:0] 	      memship_group43;
   wire  [68:0] 	      memship_group44;
   wire  [68:0] 	      memship_group45;
   wire  [68:0] 	      memship_group46;
   wire  [68:0] 	      memship_group47;
   wire  [68:0] 	      memship_group48;
   wire  [68:0] 	      memship_group49;
   wire  [68:0] 	      memship_group50;
   wire  [68:0] 	      memship_group51;
   wire  [68:0] 	      memship_group52;
   wire  [68:0] 	      memship_group53;
   wire  [68:0] 	      memship_group54;
   wire  [68:0] 	      memship_group55;
   wire  [68:0] 	      memship_group56;
   wire  [68:0] 	      memship_group57;
   wire  [68:0] 	      memship_group58;
   wire  [68:0] 	      memship_group59;
   wire  [68:0] 	      memship_group60;
   wire  [68:0] 	      memship_group61;
   wire  [68:0] 	      memship_group62;
   wire  [68:0] 	      memship_group63;

   wire  [68:0] 	      ldfi;
   wire  [68:0] 	      ldfj;
   wire  [68:0] 	      ld_intr;      // logic device interrupt
   wire  [63:0] 	      intr_req_group;
   wire  [63:0] 	      intr_rel_group;
   wire  [63:0] 	      TO_group;
   
// time out counter logic   
   assign  TO_group[0]  = (timer0   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[1]  = (timer1   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[2]  = (timer2   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[3]  = (timer3   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[4]  = (timer4   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[5]  = (timer5   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[6]  = (timer6   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[7]  = (timer7   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[8]  = (timer8   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[9]  = (timer9   == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[10] = (timer10  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[11] = (timer11  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[12] = (timer12  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[13] = (timer13  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[14] = (timer14  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[15] = (timer15  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[16] = (timer16  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[17] = (timer17  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[18] = (timer18  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[19] = (timer19  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[20] = (timer20  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[21] = (timer21  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[22] = (timer22  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[23] = (timer23  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[24] = (timer24  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[25] = (timer25  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[26] = (timer26  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[27] = (timer27  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[28] = (timer28  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[29] = (timer29  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[30] = (timer30  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[31] = (timer31  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[32] = (timer32  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[33] = (timer33  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[34] = (timer34  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[35] = (timer35  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[36] = (timer36  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[37] = (timer37  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[38] = (timer38  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[39] = (timer39  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[40] = (timer40  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[41] = (timer41  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[42] = (timer42  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[43] = (timer43  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[44] = (timer44  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[45] = (timer45  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[46] = (timer46  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[47] = (timer47  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[48] = (timer48  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[49] = (timer49  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[50] = (timer50  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[51] = (timer51  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[52] = (timer52  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[53] = (timer53  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[54] = (timer54  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[55] = (timer55  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[56] = (timer56  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[57] = (timer57  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[58] = (timer58  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[59] = (timer59  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[60] = (timer60  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[61] = (timer61  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[62] = (timer62  == 6'b0) ? 1'b1:1'b0 ;
   assign  TO_group[63] = (timer63  == 6'b0) ? 1'b1:1'b0 ;
 
//**********************************************************************************************************************   

niu_pio_decoder_6to64 niu_pio_decoder_6to64_u0   (.ldgn(ldgn0[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map0[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u1   (.ldgn(ldgn1[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map1[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u2   (.ldgn(ldgn2[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map2[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u3   (.ldgn(ldgn3[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map3[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u4   (.ldgn(ldgn4[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map4[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u5   (.ldgn(ldgn5[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map5[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u6   (.ldgn(ldgn6[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map6[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u7   (.ldgn(ldgn7[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map7[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u8   (.ldgn(ldgn8[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map8[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u9   (.ldgn(ldgn9[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map9[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u10  (.ldgn(ldgn10[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map10[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u11  (.ldgn(ldgn11[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map11[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u12  (.ldgn(ldgn12[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map12[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u13  (.ldgn(ldgn13[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map13[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u14  (.ldgn(ldgn14[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map14[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u15  (.ldgn(ldgn15[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map15[63:0]));

assign ldgn_map16 = 64'b0 ;
assign ldgn_map17 = 64'b0 ;
assign ldgn_map18 = 64'b0 ;
assign ldgn_map19 = 64'b0 ;
assign ldgn_map20 = 64'b0 ;
assign ldgn_map21 = 64'b0 ;
assign ldgn_map22 = 64'b0 ;
assign ldgn_map23 = 64'b0 ;
assign ldgn_map24 = 64'b0 ;
assign ldgn_map25 = 64'b0 ;
assign ldgn_map26 = 64'b0 ;
assign ldgn_map27 = 64'b0 ;
assign ldgn_map28 = 64'b0 ;
assign ldgn_map29 = 64'b0 ;
assign ldgn_map30 = 64'b0 ;
assign ldgn_map31 = 64'b0 ;

niu_pio_decoder_6to64 niu_pio_decoder_6to64_u32  (.ldgn(ldgn32[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map32[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u33  (.ldgn(ldgn33[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map33[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u34  (.ldgn(ldgn34[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map34[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u35  (.ldgn(ldgn35[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map35[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u36  (.ldgn(ldgn36[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map36[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u37  (.ldgn(ldgn37[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map37[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u38  (.ldgn(ldgn38[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map38[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u39  (.ldgn(ldgn39[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map39[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u40  (.ldgn(ldgn40[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map40[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u41  (.ldgn(ldgn41[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map41[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u42  (.ldgn(ldgn42[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map42[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u43  (.ldgn(ldgn43[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map43[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u44  (.ldgn(ldgn44[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map44[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u45  (.ldgn(ldgn45[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map45[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u46  (.ldgn(ldgn46[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map46[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u47  (.ldgn(ldgn47[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map47[63:0]));

`ifdef NEPTUNE
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u48  (.ldgn(ldgn48[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map48[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u49  (.ldgn(ldgn49[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map49[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u50  (.ldgn(ldgn50[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map50[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u51  (.ldgn(ldgn51[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map51[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u52  (.ldgn(ldgn52[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map52[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u53  (.ldgn(ldgn53[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map53[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u54  (.ldgn(ldgn54[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map54[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u55  (.ldgn(ldgn55[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map55[63:0]));
`else
assign ldgn_map48 = 64'b0 ;
assign ldgn_map49 = 64'b0 ;
assign ldgn_map50 = 64'b0 ;
assign ldgn_map51 = 64'b0 ;
assign ldgn_map52 = 64'b0 ;
assign ldgn_map53 = 64'b0 ;
assign ldgn_map54 = 64'b0 ;
assign ldgn_map55 = 64'b0 ;
`endif

assign ldgn_map56 = 64'b0 ;
assign ldgn_map57 = 64'b0 ;
assign ldgn_map58 = 64'b0 ;
assign ldgn_map59 = 64'b0 ;
assign ldgn_map60 = 64'b0 ;
assign ldgn_map61 = 64'b0 ;
assign ldgn_map62 = 64'b0 ;

niu_pio_decoder_6to64 niu_pio_decoder_6to64_u63  (.ldgn(ldgn63[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map63[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u64  (.ldgn(ldgn64[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map64[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u65  (.ldgn(ldgn65[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map65[63:0]));
`ifdef NEPTUNE
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u66  (.ldgn(ldgn66[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map66[63:0]));
niu_pio_decoder_6to64 niu_pio_decoder_6to64_u67  (.ldgn(ldgn67[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map67[63:0]));
`else
assign ldgn_map66 = 64'b0 ;
assign ldgn_map67 = 64'b0 ;
`endif

niu_pio_decoder_6to64 niu_pio_decoder_6to64_u68  (.ldgn(ldgn68[5:0]),.clk(clk), .reset(reset), .ldgn_map(ldgn_map68[63:0]));

//**********************************************************************************************************************   

niu_pio_ldgn2group    niu_pio_ldgn2group
  (/*AUTOINST*/
   // Outputs
   .memship_group0			(memship_group0[68:0]),
   .memship_group1			(memship_group1[68:0]),
   .memship_group2			(memship_group2[68:0]),
   .memship_group3			(memship_group3[68:0]),
   .memship_group4			(memship_group4[68:0]),
   .memship_group5			(memship_group5[68:0]),
   .memship_group6			(memship_group6[68:0]),
   .memship_group7			(memship_group7[68:0]),
   .memship_group8			(memship_group8[68:0]),
   .memship_group9			(memship_group9[68:0]),
   .memship_group10			(memship_group10[68:0]),
   .memship_group11			(memship_group11[68:0]),
   .memship_group12			(memship_group12[68:0]),
   .memship_group13			(memship_group13[68:0]),
   .memship_group14			(memship_group14[68:0]),
   .memship_group15			(memship_group15[68:0]),
   .memship_group16			(memship_group16[68:0]),
   .memship_group17			(memship_group17[68:0]),
   .memship_group18			(memship_group18[68:0]),
   .memship_group19			(memship_group19[68:0]),
   .memship_group20			(memship_group20[68:0]),
   .memship_group21			(memship_group21[68:0]),
   .memship_group22			(memship_group22[68:0]),
   .memship_group23			(memship_group23[68:0]),
   .memship_group24			(memship_group24[68:0]),
   .memship_group25			(memship_group25[68:0]),
   .memship_group26			(memship_group26[68:0]),
   .memship_group27			(memship_group27[68:0]),
   .memship_group28			(memship_group28[68:0]),
   .memship_group29			(memship_group29[68:0]),
   .memship_group30			(memship_group30[68:0]),
   .memship_group31			(memship_group31[68:0]),
   .memship_group32			(memship_group32[68:0]),
   .memship_group33			(memship_group33[68:0]),
   .memship_group34			(memship_group34[68:0]),
   .memship_group35			(memship_group35[68:0]),
   .memship_group36			(memship_group36[68:0]),
   .memship_group37			(memship_group37[68:0]),
   .memship_group38			(memship_group38[68:0]),
   .memship_group39			(memship_group39[68:0]),
   .memship_group40			(memship_group40[68:0]),
   .memship_group41			(memship_group41[68:0]),
   .memship_group42			(memship_group42[68:0]),
   .memship_group43			(memship_group43[68:0]),
   .memship_group44			(memship_group44[68:0]),
   .memship_group45			(memship_group45[68:0]),
   .memship_group46			(memship_group46[68:0]),
   .memship_group47			(memship_group47[68:0]),
   .memship_group48			(memship_group48[68:0]),
   .memship_group49			(memship_group49[68:0]),
   .memship_group50			(memship_group50[68:0]),
   .memship_group51			(memship_group51[68:0]),
   .memship_group52			(memship_group52[68:0]),
   .memship_group53			(memship_group53[68:0]),
   .memship_group54			(memship_group54[68:0]),
   .memship_group55			(memship_group55[68:0]),
   .memship_group56			(memship_group56[68:0]),
   .memship_group57			(memship_group57[68:0]),
   .memship_group58			(memship_group58[68:0]),
   .memship_group59			(memship_group59[68:0]),
   .memship_group60			(memship_group60[68:0]),
   .memship_group61			(memship_group61[68:0]),
   .memship_group62			(memship_group62[68:0]),
   .memship_group63			(memship_group63[68:0]),
   // Inputs
   .ldgn_map0				(ldgn_map0[63:0]),
   .ldgn_map1				(ldgn_map1[63:0]),
   .ldgn_map2				(ldgn_map2[63:0]),
   .ldgn_map3				(ldgn_map3[63:0]),
   .ldgn_map4				(ldgn_map4[63:0]),
   .ldgn_map5				(ldgn_map5[63:0]),
   .ldgn_map6				(ldgn_map6[63:0]),
   .ldgn_map7				(ldgn_map7[63:0]),
   .ldgn_map8				(ldgn_map8[63:0]),
   .ldgn_map9				(ldgn_map9[63:0]),
   .ldgn_map10				(ldgn_map10[63:0]),
   .ldgn_map11				(ldgn_map11[63:0]),
   .ldgn_map12				(ldgn_map12[63:0]),
   .ldgn_map13				(ldgn_map13[63:0]),
   .ldgn_map14				(ldgn_map14[63:0]),
   .ldgn_map15				(ldgn_map15[63:0]),
   .ldgn_map16				(ldgn_map16[63:0]),
   .ldgn_map17				(ldgn_map17[63:0]),
   .ldgn_map18				(ldgn_map18[63:0]),
   .ldgn_map19				(ldgn_map19[63:0]),
   .ldgn_map20				(ldgn_map20[63:0]),
   .ldgn_map21				(ldgn_map21[63:0]),
   .ldgn_map22				(ldgn_map22[63:0]),
   .ldgn_map23				(ldgn_map23[63:0]),
   .ldgn_map24				(ldgn_map24[63:0]),
   .ldgn_map25				(ldgn_map25[63:0]),
   .ldgn_map26				(ldgn_map26[63:0]),
   .ldgn_map27				(ldgn_map27[63:0]),
   .ldgn_map28				(ldgn_map28[63:0]),
   .ldgn_map29				(ldgn_map29[63:0]),
   .ldgn_map30				(ldgn_map30[63:0]),
   .ldgn_map31				(ldgn_map31[63:0]),
   .ldgn_map32				(ldgn_map32[63:0]),
   .ldgn_map33				(ldgn_map33[63:0]),
   .ldgn_map34				(ldgn_map34[63:0]),
   .ldgn_map35				(ldgn_map35[63:0]),
   .ldgn_map36				(ldgn_map36[63:0]),
   .ldgn_map37				(ldgn_map37[63:0]),
   .ldgn_map38				(ldgn_map38[63:0]),
   .ldgn_map39				(ldgn_map39[63:0]),
   .ldgn_map40				(ldgn_map40[63:0]),
   .ldgn_map41				(ldgn_map41[63:0]),
   .ldgn_map42				(ldgn_map42[63:0]),
   .ldgn_map43				(ldgn_map43[63:0]),
   .ldgn_map44				(ldgn_map44[63:0]),
   .ldgn_map45				(ldgn_map45[63:0]),
   .ldgn_map46				(ldgn_map46[63:0]),
   .ldgn_map47				(ldgn_map47[63:0]),
   .ldgn_map48				(ldgn_map48[63:0]),
   .ldgn_map49				(ldgn_map49[63:0]),
   .ldgn_map50				(ldgn_map50[63:0]),
   .ldgn_map51				(ldgn_map51[63:0]),
   .ldgn_map52				(ldgn_map52[63:0]),
   .ldgn_map53				(ldgn_map53[63:0]),
   .ldgn_map54				(ldgn_map54[63:0]),
   .ldgn_map55				(ldgn_map55[63:0]),
   .ldgn_map56				(ldgn_map56[63:0]),
   .ldgn_map57				(ldgn_map57[63:0]),
   .ldgn_map58				(ldgn_map58[63:0]),
   .ldgn_map59				(ldgn_map59[63:0]),
   .ldgn_map60				(ldgn_map60[63:0]),
   .ldgn_map61				(ldgn_map61[63:0]),
   .ldgn_map62				(ldgn_map62[63:0]),
   .ldgn_map63				(ldgn_map63[63:0]),
   .ldgn_map64				(ldgn_map64[63:0]),
   .ldgn_map65				(ldgn_map65[63:0]),
   .ldgn_map66				(ldgn_map66[63:0]),
   .ldgn_map67				(ldgn_map67[63:0]),
   .ldgn_map68				(ldgn_map68[63:0]));

// one set of interrupt mask for all groups   
  assign  ld_intr[0 ]  = (ldfi[0 ] & (~ldf_mask0 [1])) | (ldfj[0 ] & (~ldf_mask0 [0]));
  assign  ld_intr[1 ]  = (ldfi[1 ] & (~ldf_mask1 [1])) | (ldfj[1 ] & (~ldf_mask1 [0]));
  assign  ld_intr[2 ]  = (ldfi[2 ] & (~ldf_mask2 [1])) | (ldfj[2 ] & (~ldf_mask2 [0]));
  assign  ld_intr[3 ]  = (ldfi[3 ] & (~ldf_mask3 [1])) | (ldfj[3 ] & (~ldf_mask3 [0]));
  assign  ld_intr[4 ]  = (ldfi[4 ] & (~ldf_mask4 [1])) | (ldfj[4 ] & (~ldf_mask4 [0]));
  assign  ld_intr[5 ]  = (ldfi[5 ] & (~ldf_mask5 [1])) | (ldfj[5 ] & (~ldf_mask5 [0]));
  assign  ld_intr[6 ]  = (ldfi[6 ] & (~ldf_mask6 [1])) | (ldfj[6 ] & (~ldf_mask6 [0]));
  assign  ld_intr[7 ]  = (ldfi[7 ] & (~ldf_mask7 [1])) | (ldfj[7 ] & (~ldf_mask7 [0]));
  assign  ld_intr[8 ]  = (ldfi[8 ] & (~ldf_mask8 [1])) | (ldfj[8 ] & (~ldf_mask8 [0]));
  assign  ld_intr[9 ]  = (ldfi[9 ] & (~ldf_mask9 [1])) | (ldfj[9 ] & (~ldf_mask9 [0]));
  assign  ld_intr[10]  = (ldfi[10] & (~ldf_mask10[1])) | (ldfj[10] & (~ldf_mask10[0]));
  assign  ld_intr[11]  = (ldfi[11] & (~ldf_mask11[1])) | (ldfj[11] & (~ldf_mask11[0]));
  assign  ld_intr[12]  = (ldfi[12] & (~ldf_mask12[1])) | (ldfj[12] & (~ldf_mask12[0]));
  assign  ld_intr[13]  = (ldfi[13] & (~ldf_mask13[1])) | (ldfj[13] & (~ldf_mask13[0]));
  assign  ld_intr[14]  = (ldfi[14] & (~ldf_mask14[1])) | (ldfj[14] & (~ldf_mask14[0]));
  assign  ld_intr[15]  = (ldfi[15] & (~ldf_mask15[1])) | (ldfj[15] & (~ldf_mask15[0]));
  assign  ld_intr[16]  = (ldfi[16] & (~ldf_mask16[1])) | (ldfj[16] & (~ldf_mask16[0]));
  assign  ld_intr[17]  = (ldfi[17] & (~ldf_mask17[1])) | (ldfj[17] & (~ldf_mask17[0]));
  assign  ld_intr[18]  = (ldfi[18] & (~ldf_mask18[1])) | (ldfj[18] & (~ldf_mask18[0]));
  assign  ld_intr[19]  = (ldfi[19] & (~ldf_mask19[1])) | (ldfj[19] & (~ldf_mask19[0]));
  assign  ld_intr[20]  = (ldfi[20] & (~ldf_mask20[1])) | (ldfj[20] & (~ldf_mask20[0]));
  assign  ld_intr[21]  = (ldfi[21] & (~ldf_mask21[1])) | (ldfj[21] & (~ldf_mask21[0]));
  assign  ld_intr[22]  = (ldfi[22] & (~ldf_mask22[1])) | (ldfj[22] & (~ldf_mask22[0]));
  assign  ld_intr[23]  = (ldfi[23] & (~ldf_mask23[1])) | (ldfj[23] & (~ldf_mask23[0]));
  assign  ld_intr[24]  = (ldfi[24] & (~ldf_mask24[1])) | (ldfj[24] & (~ldf_mask24[0]));
  assign  ld_intr[25]  = (ldfi[25] & (~ldf_mask25[1])) | (ldfj[25] & (~ldf_mask25[0]));
  assign  ld_intr[26]  = (ldfi[26] & (~ldf_mask26[1])) | (ldfj[26] & (~ldf_mask26[0]));
  assign  ld_intr[27]  = (ldfi[27] & (~ldf_mask27[1])) | (ldfj[27] & (~ldf_mask27[0]));
  assign  ld_intr[28]  = (ldfi[28] & (~ldf_mask28[1])) | (ldfj[28] & (~ldf_mask28[0]));
  assign  ld_intr[29]  = (ldfi[29] & (~ldf_mask29[1])) | (ldfj[29] & (~ldf_mask29[0]));
  assign  ld_intr[30]  = (ldfi[30] & (~ldf_mask30[1])) | (ldfj[30] & (~ldf_mask30[0]));
  assign  ld_intr[31]  = (ldfi[31] & (~ldf_mask31[1])) | (ldfj[31] & (~ldf_mask31[0]));
  assign  ld_intr[32]  = (ldfi[32] & (~ldf_mask32[1])) | (ldfj[32] & (~ldf_mask32[0]));
  assign  ld_intr[33]  = (ldfi[33] & (~ldf_mask33[1])) | (ldfj[33] & (~ldf_mask33[0]));
  assign  ld_intr[34]  = (ldfi[34] & (~ldf_mask34[1])) | (ldfj[34] & (~ldf_mask34[0]));
  assign  ld_intr[35]  = (ldfi[35] & (~ldf_mask35[1])) | (ldfj[35] & (~ldf_mask35[0]));
  assign  ld_intr[36]  = (ldfi[36] & (~ldf_mask36[1])) | (ldfj[36] & (~ldf_mask36[0]));
  assign  ld_intr[37]  = (ldfi[37] & (~ldf_mask37[1])) | (ldfj[37] & (~ldf_mask37[0]));
  assign  ld_intr[38]  = (ldfi[38] & (~ldf_mask38[1])) | (ldfj[38] & (~ldf_mask38[0]));
  assign  ld_intr[39]  = (ldfi[39] & (~ldf_mask39[1])) | (ldfj[39] & (~ldf_mask39[0]));
  assign  ld_intr[40]  = (ldfi[40] & (~ldf_mask40[1])) | (ldfj[40] & (~ldf_mask40[0]));
  assign  ld_intr[41]  = (ldfi[41] & (~ldf_mask41[1])) | (ldfj[41] & (~ldf_mask41[0]));
  assign  ld_intr[42]  = (ldfi[42] & (~ldf_mask42[1])) | (ldfj[42] & (~ldf_mask42[0]));
  assign  ld_intr[43]  = (ldfi[43] & (~ldf_mask43[1])) | (ldfj[43] & (~ldf_mask43[0]));
  assign  ld_intr[44]  = (ldfi[44] & (~ldf_mask44[1])) | (ldfj[44] & (~ldf_mask44[0]));
  assign  ld_intr[45]  = (ldfi[45] & (~ldf_mask45[1])) | (ldfj[45] & (~ldf_mask45[0]));
  assign  ld_intr[46]  = (ldfi[46] & (~ldf_mask46[1])) | (ldfj[46] & (~ldf_mask46[0]));
  assign  ld_intr[47]  = (ldfi[47] & (~ldf_mask47[1])) | (ldfj[47] & (~ldf_mask47[0]));
  assign  ld_intr[48]  = (ldfi[48] & (~ldf_mask48[1])) | (ldfj[48] & (~ldf_mask48[0]));
  assign  ld_intr[49]  = (ldfi[49] & (~ldf_mask49[1])) | (ldfj[49] & (~ldf_mask49[0]));
  assign  ld_intr[50]  = (ldfi[50] & (~ldf_mask50[1])) | (ldfj[50] & (~ldf_mask50[0]));
  assign  ld_intr[51]  = (ldfi[51] & (~ldf_mask51[1])) | (ldfj[51] & (~ldf_mask51[0]));
  assign  ld_intr[52]  = (ldfi[52] & (~ldf_mask52[1])) | (ldfj[52] & (~ldf_mask52[0]));
  assign  ld_intr[53]  = (ldfi[53] & (~ldf_mask53[1])) | (ldfj[53] & (~ldf_mask53[0]));
  assign  ld_intr[54]  = (ldfi[54] & (~ldf_mask54[1])) | (ldfj[54] & (~ldf_mask54[0]));
  assign  ld_intr[55]  = (ldfi[55] & (~ldf_mask55[1])) | (ldfj[55] & (~ldf_mask55[0]));
  assign  ld_intr[56]  = (ldfi[56] & (~ldf_mask56[1])) | (ldfj[56] & (~ldf_mask56[0]));
  assign  ld_intr[57]  = (ldfi[57] & (~ldf_mask57[1])) | (ldfj[57] & (~ldf_mask57[0]));
  assign  ld_intr[58]  = (ldfi[58] & (~ldf_mask58[1])) | (ldfj[58] & (~ldf_mask58[0]));
  assign  ld_intr[59]  = (ldfi[59] & (~ldf_mask59[1])) | (ldfj[59] & (~ldf_mask59[0]));
  assign  ld_intr[60]  = (ldfi[60] & (~ldf_mask60[1])) | (ldfj[60] & (~ldf_mask60[0]));
  assign  ld_intr[61]  = (ldfi[61] & (~ldf_mask61[1])) | (ldfj[61] & (~ldf_mask61[0]));
  assign  ld_intr[62]  = (ldfi[62] & (~ldf_mask62[1])) | (ldfj[62] & (~ldf_mask62[0]));
  assign  ld_intr[63]  = (ldfi[63] & (~ldf_mask63[1])) | (ldfj[63] & (~ldf_mask63[0]));
  assign  ld_intr[64]  = (ldfi[64] & (~ldf_mask64[1])) | (ldfj[64] & (~ldf_mask64[0]));
  assign  ld_intr[65]  = (ldfi[65] & (~ldf_mask65[1])) | (ldfj[65] & (~ldf_mask65[0]));
  assign  ld_intr[66]  = (ldfi[66] & (~ldf_mask66[1])) | (ldfj[66] & (~ldf_mask66[0]));
  assign  ld_intr[67]  = (ldfi[67] & (~ldf_mask67[1])) | (ldfj[67] & (~ldf_mask67[0]));
  assign  ld_intr[68]  = (ldfi[68] & (~ldf_mask68[1])) | (ldfj[68] & (~ldf_mask68[0]));

//
  wire [63:0] memship_intr_TO ;

  assign memship_intr_TO[0 ] = ((|(memship_group0 [68:0] & (ld_intr[68:0]))) & TO_group[0 ]) ;
  assign memship_intr_TO[1 ] = ((|(memship_group1 [68:0] & (ld_intr[68:0]))) & TO_group[1 ]) ;
  assign memship_intr_TO[2 ] = ((|(memship_group2 [68:0] & (ld_intr[68:0]))) & TO_group[2 ]) ;
  assign memship_intr_TO[3 ] = ((|(memship_group3 [68:0] & (ld_intr[68:0]))) & TO_group[3 ]) ;
  assign memship_intr_TO[4 ] = ((|(memship_group4 [68:0] & (ld_intr[68:0]))) & TO_group[4 ]) ;
  assign memship_intr_TO[5 ] = ((|(memship_group5 [68:0] & (ld_intr[68:0]))) & TO_group[5 ]) ;
  assign memship_intr_TO[6 ] = ((|(memship_group6 [68:0] & (ld_intr[68:0]))) & TO_group[6 ]) ;
  assign memship_intr_TO[7 ] = ((|(memship_group7 [68:0] & (ld_intr[68:0]))) & TO_group[7 ]) ;
  assign memship_intr_TO[8 ] = ((|(memship_group8 [68:0] & (ld_intr[68:0]))) & TO_group[8 ]) ;
  assign memship_intr_TO[9 ] = ((|(memship_group9 [68:0] & (ld_intr[68:0]))) & TO_group[9 ]) ;
  assign memship_intr_TO[10] = ((|(memship_group10[68:0] & (ld_intr[68:0]))) & TO_group[10]) ;
  assign memship_intr_TO[11] = ((|(memship_group11[68:0] & (ld_intr[68:0]))) & TO_group[11]) ;
  assign memship_intr_TO[12] = ((|(memship_group12[68:0] & (ld_intr[68:0]))) & TO_group[12]) ;
  assign memship_intr_TO[13] = ((|(memship_group13[68:0] & (ld_intr[68:0]))) & TO_group[13]) ;
  assign memship_intr_TO[14] = ((|(memship_group14[68:0] & (ld_intr[68:0]))) & TO_group[14]) ;
  assign memship_intr_TO[15] = ((|(memship_group15[68:0] & (ld_intr[68:0]))) & TO_group[15]) ;
  assign memship_intr_TO[16] = ((|(memship_group16[68:0] & (ld_intr[68:0]))) & TO_group[16]) ;
  assign memship_intr_TO[17] = ((|(memship_group17[68:0] & (ld_intr[68:0]))) & TO_group[17]) ;
  assign memship_intr_TO[18] = ((|(memship_group18[68:0] & (ld_intr[68:0]))) & TO_group[18]) ;
  assign memship_intr_TO[19] = ((|(memship_group19[68:0] & (ld_intr[68:0]))) & TO_group[19]) ;
  assign memship_intr_TO[20] = ((|(memship_group20[68:0] & (ld_intr[68:0]))) & TO_group[20]) ;
  assign memship_intr_TO[21] = ((|(memship_group21[68:0] & (ld_intr[68:0]))) & TO_group[21]) ;
  assign memship_intr_TO[22] = ((|(memship_group22[68:0] & (ld_intr[68:0]))) & TO_group[22]) ;
  assign memship_intr_TO[23] = ((|(memship_group23[68:0] & (ld_intr[68:0]))) & TO_group[23]) ;
  assign memship_intr_TO[24] = ((|(memship_group24[68:0] & (ld_intr[68:0]))) & TO_group[24]) ;
  assign memship_intr_TO[25] = ((|(memship_group25[68:0] & (ld_intr[68:0]))) & TO_group[25]) ;
  assign memship_intr_TO[26] = ((|(memship_group26[68:0] & (ld_intr[68:0]))) & TO_group[26]) ;
  assign memship_intr_TO[27] = ((|(memship_group27[68:0] & (ld_intr[68:0]))) & TO_group[27]) ;
  assign memship_intr_TO[28] = ((|(memship_group28[68:0] & (ld_intr[68:0]))) & TO_group[28]) ;
  assign memship_intr_TO[29] = ((|(memship_group29[68:0] & (ld_intr[68:0]))) & TO_group[29]) ;
  assign memship_intr_TO[30] = ((|(memship_group30[68:0] & (ld_intr[68:0]))) & TO_group[30]) ;
  assign memship_intr_TO[31] = ((|(memship_group31[68:0] & (ld_intr[68:0]))) & TO_group[31]) ;
  assign memship_intr_TO[32] = ((|(memship_group32[68:0] & (ld_intr[68:0]))) & TO_group[32]) ;
  assign memship_intr_TO[33] = ((|(memship_group33[68:0] & (ld_intr[68:0]))) & TO_group[33]) ;
  assign memship_intr_TO[34] = ((|(memship_group34[68:0] & (ld_intr[68:0]))) & TO_group[34]) ;
  assign memship_intr_TO[35] = ((|(memship_group35[68:0] & (ld_intr[68:0]))) & TO_group[35]) ;
  assign memship_intr_TO[36] = ((|(memship_group36[68:0] & (ld_intr[68:0]))) & TO_group[36]) ;
  assign memship_intr_TO[37] = ((|(memship_group37[68:0] & (ld_intr[68:0]))) & TO_group[37]) ;
  assign memship_intr_TO[38] = ((|(memship_group38[68:0] & (ld_intr[68:0]))) & TO_group[38]) ;
  assign memship_intr_TO[39] = ((|(memship_group39[68:0] & (ld_intr[68:0]))) & TO_group[39]) ;
  assign memship_intr_TO[40] = ((|(memship_group40[68:0] & (ld_intr[68:0]))) & TO_group[40]) ;
  assign memship_intr_TO[41] = ((|(memship_group41[68:0] & (ld_intr[68:0]))) & TO_group[41]) ;
  assign memship_intr_TO[42] = ((|(memship_group42[68:0] & (ld_intr[68:0]))) & TO_group[42]) ;
  assign memship_intr_TO[43] = ((|(memship_group43[68:0] & (ld_intr[68:0]))) & TO_group[43]) ;
  assign memship_intr_TO[44] = ((|(memship_group44[68:0] & (ld_intr[68:0]))) & TO_group[44]) ;
  assign memship_intr_TO[45] = ((|(memship_group45[68:0] & (ld_intr[68:0]))) & TO_group[45]) ;
  assign memship_intr_TO[46] = ((|(memship_group46[68:0] & (ld_intr[68:0]))) & TO_group[46]) ;
  assign memship_intr_TO[47] = ((|(memship_group47[68:0] & (ld_intr[68:0]))) & TO_group[47]) ;
  assign memship_intr_TO[48] = ((|(memship_group48[68:0] & (ld_intr[68:0]))) & TO_group[48]) ;
  assign memship_intr_TO[49] = ((|(memship_group49[68:0] & (ld_intr[68:0]))) & TO_group[49]) ;
  assign memship_intr_TO[50] = ((|(memship_group50[68:0] & (ld_intr[68:0]))) & TO_group[50]) ;
  assign memship_intr_TO[51] = ((|(memship_group51[68:0] & (ld_intr[68:0]))) & TO_group[51]) ;
  assign memship_intr_TO[52] = ((|(memship_group52[68:0] & (ld_intr[68:0]))) & TO_group[52]) ;
  assign memship_intr_TO[53] = ((|(memship_group53[68:0] & (ld_intr[68:0]))) & TO_group[53]) ;
  assign memship_intr_TO[54] = ((|(memship_group54[68:0] & (ld_intr[68:0]))) & TO_group[54]) ;
  assign memship_intr_TO[55] = ((|(memship_group55[68:0] & (ld_intr[68:0]))) & TO_group[55]) ;
  assign memship_intr_TO[56] = ((|(memship_group56[68:0] & (ld_intr[68:0]))) & TO_group[56]) ;
  assign memship_intr_TO[57] = ((|(memship_group57[68:0] & (ld_intr[68:0]))) & TO_group[57]) ;
  assign memship_intr_TO[58] = ((|(memship_group58[68:0] & (ld_intr[68:0]))) & TO_group[58]) ;
  assign memship_intr_TO[59] = ((|(memship_group59[68:0] & (ld_intr[68:0]))) & TO_group[59]) ;
  assign memship_intr_TO[60] = ((|(memship_group60[68:0] & (ld_intr[68:0]))) & TO_group[60]) ;
  assign memship_intr_TO[61] = ((|(memship_group61[68:0] & (ld_intr[68:0]))) & TO_group[61]) ;
  assign memship_intr_TO[62] = ((|(memship_group62[68:0] & (ld_intr[68:0]))) & TO_group[62]) ;
  assign memship_intr_TO[63] = ((|(memship_group63[68:0] & (ld_intr[68:0]))) & TO_group[63]) ;

//   

  assign intr_req_group[0 ] = (memship_intr_TO[0]  & arm0) ;
  assign intr_req_group[1 ] = (memship_intr_TO[1]  & arm1) ;
  assign intr_req_group[2 ] = (memship_intr_TO[2]  & arm2) ;
  assign intr_req_group[3 ] = (memship_intr_TO[3]  & arm3) ;
  assign intr_req_group[4 ] = (memship_intr_TO[4]  & arm4) ;
  assign intr_req_group[5 ] = (memship_intr_TO[5]  & arm5) ;
  assign intr_req_group[6 ] = (memship_intr_TO[6]  & arm6) ;
  assign intr_req_group[7 ] = (memship_intr_TO[7]  & arm7) ;
  assign intr_req_group[8 ] = (memship_intr_TO[8]  & arm8) ;
  assign intr_req_group[9 ] = (memship_intr_TO[9]  & arm9) ;
  assign intr_req_group[10] = (memship_intr_TO[10] & arm10) ;
  assign intr_req_group[11] = (memship_intr_TO[11] & arm11) ;
  assign intr_req_group[12] = (memship_intr_TO[12] & arm12) ;
  assign intr_req_group[13] = (memship_intr_TO[13] & arm13) ;
  assign intr_req_group[14] = (memship_intr_TO[14] & arm14) ;
  assign intr_req_group[15] = (memship_intr_TO[15] & arm15) ;
  assign intr_req_group[16] = (memship_intr_TO[16] & arm16) ;
  assign intr_req_group[17] = (memship_intr_TO[17] & arm17) ;
  assign intr_req_group[18] = (memship_intr_TO[18] & arm18) ;
  assign intr_req_group[19] = (memship_intr_TO[19] & arm19) ;
  assign intr_req_group[20] = (memship_intr_TO[20] & arm20) ;
  assign intr_req_group[21] = (memship_intr_TO[21] & arm21) ;
  assign intr_req_group[22] = (memship_intr_TO[22] & arm22) ;
  assign intr_req_group[23] = (memship_intr_TO[23] & arm23) ;
  assign intr_req_group[24] = (memship_intr_TO[24] & arm24) ;
  assign intr_req_group[25] = (memship_intr_TO[25] & arm25) ;
  assign intr_req_group[26] = (memship_intr_TO[26] & arm26) ;
  assign intr_req_group[27] = (memship_intr_TO[27] & arm27) ;
  assign intr_req_group[28] = (memship_intr_TO[28] & arm28) ;
  assign intr_req_group[29] = (memship_intr_TO[29] & arm29) ;
  assign intr_req_group[30] = (memship_intr_TO[30] & arm30) ;
  assign intr_req_group[31] = (memship_intr_TO[31] & arm31) ;
  assign intr_req_group[32] = (memship_intr_TO[32] & arm32) ;
  assign intr_req_group[33] = (memship_intr_TO[33] & arm33) ;
  assign intr_req_group[34] = (memship_intr_TO[34] & arm34) ;
  assign intr_req_group[35] = (memship_intr_TO[35] & arm35) ;
  assign intr_req_group[36] = (memship_intr_TO[36] & arm36) ;
  assign intr_req_group[37] = (memship_intr_TO[37] & arm37) ;
  assign intr_req_group[38] = (memship_intr_TO[38] & arm38) ;
  assign intr_req_group[39] = (memship_intr_TO[39] & arm39) ;
  assign intr_req_group[40] = (memship_intr_TO[40] & arm40) ;
  assign intr_req_group[41] = (memship_intr_TO[41] & arm41) ;
  assign intr_req_group[42] = (memship_intr_TO[42] & arm42) ;
  assign intr_req_group[43] = (memship_intr_TO[43] & arm43) ;
  assign intr_req_group[44] = (memship_intr_TO[44] & arm44) ;
  assign intr_req_group[45] = (memship_intr_TO[45] & arm45) ;
  assign intr_req_group[46] = (memship_intr_TO[46] & arm46) ;
  assign intr_req_group[47] = (memship_intr_TO[47] & arm47) ;
  assign intr_req_group[48] = (memship_intr_TO[48] & arm48) ;
  assign intr_req_group[49] = (memship_intr_TO[49] & arm49) ;
  assign intr_req_group[50] = (memship_intr_TO[50] & arm50) ;
  assign intr_req_group[51] = (memship_intr_TO[51] & arm51) ;
  assign intr_req_group[52] = (memship_intr_TO[52] & arm52) ;
  assign intr_req_group[53] = (memship_intr_TO[53] & arm53) ;
  assign intr_req_group[54] = (memship_intr_TO[54] & arm54) ;
  assign intr_req_group[55] = (memship_intr_TO[55] & arm55) ;
  assign intr_req_group[56] = (memship_intr_TO[56] & arm56) ;
  assign intr_req_group[57] = (memship_intr_TO[57] & arm57) ;
  assign intr_req_group[58] = (memship_intr_TO[58] & arm58) ;
  assign intr_req_group[59] = (memship_intr_TO[59] & arm59) ;
  assign intr_req_group[60] = (memship_intr_TO[60] & arm60) ;
  assign intr_req_group[61] = (memship_intr_TO[61] & arm61) ;
  assign intr_req_group[62] = (memship_intr_TO[62] & arm62) ;
  assign intr_req_group[63] = (memship_intr_TO[63] & arm63) ;
  
  wire  activate_ig_sm      = |intr_req_group;
   
//   
  wire [63:0] issued_intr ;

  assign intr_rel_group[0 ] = (~memship_intr_TO[0]  & issued_intr[0] ) ;
  assign intr_rel_group[1 ] = (~memship_intr_TO[1]  & issued_intr[1] ) ;
  assign intr_rel_group[2 ] = (~memship_intr_TO[2]  & issued_intr[2] ) ;
  assign intr_rel_group[3 ] = (~memship_intr_TO[3]  & issued_intr[3] ) ;
  assign intr_rel_group[4 ] = (~memship_intr_TO[4]  & issued_intr[4] ) ;
  assign intr_rel_group[5 ] = (~memship_intr_TO[5]  & issued_intr[5] ) ;
  assign intr_rel_group[6 ] = (~memship_intr_TO[6]  & issued_intr[6] ) ;
  assign intr_rel_group[7 ] = (~memship_intr_TO[7]  & issued_intr[7] ) ;
  assign intr_rel_group[8 ] = (~memship_intr_TO[8]  & issued_intr[8] ) ;
  assign intr_rel_group[9 ] = (~memship_intr_TO[9]  & issued_intr[9] ) ;
  assign intr_rel_group[10] = (~memship_intr_TO[10]  & issued_intr[10] ) ;
  assign intr_rel_group[11] = (~memship_intr_TO[11]  & issued_intr[11] ) ;
  assign intr_rel_group[12] = (~memship_intr_TO[12]  & issued_intr[12] ) ;
  assign intr_rel_group[13] = (~memship_intr_TO[13]  & issued_intr[13] ) ;
  assign intr_rel_group[14] = (~memship_intr_TO[14]  & issued_intr[14] ) ;
  assign intr_rel_group[15] = (~memship_intr_TO[15]  & issued_intr[15] ) ;
  assign intr_rel_group[16] = (~memship_intr_TO[16]  & issued_intr[16] ) ;
  assign intr_rel_group[17] = (~memship_intr_TO[17]  & issued_intr[17] ) ;
  assign intr_rel_group[18] = (~memship_intr_TO[18]  & issued_intr[18] ) ;
  assign intr_rel_group[19] = (~memship_intr_TO[19]  & issued_intr[19] ) ;
  assign intr_rel_group[20] = (~memship_intr_TO[20]  & issued_intr[20] ) ;
  assign intr_rel_group[21] = (~memship_intr_TO[21]  & issued_intr[21] ) ;
  assign intr_rel_group[22] = (~memship_intr_TO[22]  & issued_intr[22] ) ;
  assign intr_rel_group[23] = (~memship_intr_TO[23]  & issued_intr[23] ) ;
  assign intr_rel_group[24] = (~memship_intr_TO[24]  & issued_intr[24] ) ;
  assign intr_rel_group[25] = (~memship_intr_TO[25]  & issued_intr[25] ) ;
  assign intr_rel_group[26] = (~memship_intr_TO[26]  & issued_intr[26] ) ;
  assign intr_rel_group[27] = (~memship_intr_TO[27]  & issued_intr[27] ) ;
  assign intr_rel_group[28] = (~memship_intr_TO[28]  & issued_intr[28] ) ;
  assign intr_rel_group[29] = (~memship_intr_TO[29]  & issued_intr[29] ) ;
  assign intr_rel_group[30] = (~memship_intr_TO[30]  & issued_intr[30] ) ;
  assign intr_rel_group[31] = (~memship_intr_TO[31]  & issued_intr[31] ) ;
  assign intr_rel_group[32] = (~memship_intr_TO[32]  & issued_intr[32] ) ;
  assign intr_rel_group[33] = (~memship_intr_TO[33]  & issued_intr[33] ) ;
  assign intr_rel_group[34] = (~memship_intr_TO[34]  & issued_intr[34] ) ;
  assign intr_rel_group[35] = (~memship_intr_TO[35]  & issued_intr[35] ) ;
  assign intr_rel_group[36] = (~memship_intr_TO[36]  & issued_intr[36] ) ;
  assign intr_rel_group[37] = (~memship_intr_TO[37]  & issued_intr[37] ) ;
  assign intr_rel_group[38] = (~memship_intr_TO[38]  & issued_intr[38] ) ;
  assign intr_rel_group[39] = (~memship_intr_TO[39]  & issued_intr[39] ) ;
  assign intr_rel_group[40] = (~memship_intr_TO[40]  & issued_intr[40] ) ;
  assign intr_rel_group[41] = (~memship_intr_TO[41]  & issued_intr[41] ) ;
  assign intr_rel_group[42] = (~memship_intr_TO[42]  & issued_intr[42] ) ;
  assign intr_rel_group[43] = (~memship_intr_TO[43]  & issued_intr[43] ) ;
  assign intr_rel_group[44] = (~memship_intr_TO[44]  & issued_intr[44] ) ;
  assign intr_rel_group[45] = (~memship_intr_TO[45]  & issued_intr[45] ) ;
  assign intr_rel_group[46] = (~memship_intr_TO[46]  & issued_intr[46] ) ;
  assign intr_rel_group[47] = (~memship_intr_TO[47]  & issued_intr[47] ) ;
  assign intr_rel_group[48] = (~memship_intr_TO[48]  & issued_intr[48] ) ;
  assign intr_rel_group[49] = (~memship_intr_TO[49]  & issued_intr[49] ) ;
  assign intr_rel_group[50] = (~memship_intr_TO[50]  & issued_intr[50] ) ;
  assign intr_rel_group[51] = (~memship_intr_TO[51]  & issued_intr[51] ) ;
  assign intr_rel_group[52] = (~memship_intr_TO[52]  & issued_intr[52] ) ;
  assign intr_rel_group[53] = (~memship_intr_TO[53]  & issued_intr[53] ) ;
  assign intr_rel_group[54] = (~memship_intr_TO[54]  & issued_intr[54] ) ;
  assign intr_rel_group[55] = (~memship_intr_TO[55]  & issued_intr[55] ) ;
  assign intr_rel_group[56] = (~memship_intr_TO[56]  & issued_intr[56] ) ;
  assign intr_rel_group[57] = (~memship_intr_TO[57]  & issued_intr[57] ) ;
  assign intr_rel_group[58] = (~memship_intr_TO[58]  & issued_intr[58] ) ;
  assign intr_rel_group[59] = (~memship_intr_TO[59]  & issued_intr[59] ) ;
  assign intr_rel_group[60] = (~memship_intr_TO[60]  & issued_intr[60] ) ;
  assign intr_rel_group[61] = (~memship_intr_TO[61]  & issued_intr[61] ) ;
  assign intr_rel_group[62] = (~memship_intr_TO[62]  & issued_intr[62] ) ;
  assign intr_rel_group[63] = (~memship_intr_TO[63]  & issued_intr[63] ) ;

  wire  activate_ig_sm_rel  = |intr_rel_group;
  wire  activate_ig_sm_rel_latched ;

//

pio_SRFF issued_intr0_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[0]),.iRst(intr_rel_group[0]),.oQ(issued_intr[0]));
pio_SRFF issued_intr1_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[1]),.iRst(intr_rel_group[1]),.oQ(issued_intr[1]));
pio_SRFF issued_intr2_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[2]),.iRst(intr_rel_group[2]),.oQ(issued_intr[2]));
pio_SRFF issued_intr3_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[3]),.iRst(intr_rel_group[3]),.oQ(issued_intr[3]));
pio_SRFF issued_intr4_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[4]),.iRst(intr_rel_group[4]),.oQ(issued_intr[4]));
pio_SRFF issued_intr5_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[5]),.iRst(intr_rel_group[5]),.oQ(issued_intr[5]));
pio_SRFF issued_intr6_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[6]),.iRst(intr_rel_group[6]),.oQ(issued_intr[6]));
pio_SRFF issued_intr7_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[7]),.iRst(intr_rel_group[7]),.oQ(issued_intr[7]));
pio_SRFF issued_intr8_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[8]),.iRst(intr_rel_group[8]),.oQ(issued_intr[8]));
pio_SRFF issued_intr9_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[9]),.iRst(intr_rel_group[9]),.oQ(issued_intr[9]));
pio_SRFF issued_intr10_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[10]),.iRst(intr_rel_group[10]),.oQ(issued_intr[10]));
pio_SRFF issued_intr11_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[11]),.iRst(intr_rel_group[11]),.oQ(issued_intr[11]));
pio_SRFF issued_intr12_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[12]),.iRst(intr_rel_group[12]),.oQ(issued_intr[12]));
pio_SRFF issued_intr13_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[13]),.iRst(intr_rel_group[13]),.oQ(issued_intr[13]));
pio_SRFF issued_intr14_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[14]),.iRst(intr_rel_group[14]),.oQ(issued_intr[14]));
pio_SRFF issued_intr15_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[15]),.iRst(intr_rel_group[15]),.oQ(issued_intr[15]));
pio_SRFF issued_intr16_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[16]),.iRst(intr_rel_group[16]),.oQ(issued_intr[16]));
pio_SRFF issued_intr17_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[17]),.iRst(intr_rel_group[17]),.oQ(issued_intr[17]));
pio_SRFF issued_intr18_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[18]),.iRst(intr_rel_group[18]),.oQ(issued_intr[18]));
pio_SRFF issued_intr19_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[19]),.iRst(intr_rel_group[19]),.oQ(issued_intr[19]));
pio_SRFF issued_intr20_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[20]),.iRst(intr_rel_group[20]),.oQ(issued_intr[20]));
pio_SRFF issued_intr21_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[21]),.iRst(intr_rel_group[21]),.oQ(issued_intr[21]));
pio_SRFF issued_intr22_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[22]),.iRst(intr_rel_group[22]),.oQ(issued_intr[22]));
pio_SRFF issued_intr23_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[23]),.iRst(intr_rel_group[23]),.oQ(issued_intr[23]));
pio_SRFF issued_intr24_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[24]),.iRst(intr_rel_group[24]),.oQ(issued_intr[24]));
pio_SRFF issued_intr25_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[25]),.iRst(intr_rel_group[25]),.oQ(issued_intr[25]));
pio_SRFF issued_intr26_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[26]),.iRst(intr_rel_group[26]),.oQ(issued_intr[26]));
pio_SRFF issued_intr27_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[27]),.iRst(intr_rel_group[27]),.oQ(issued_intr[27]));
pio_SRFF issued_intr28_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[28]),.iRst(intr_rel_group[28]),.oQ(issued_intr[28]));
pio_SRFF issued_intr29_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[29]),.iRst(intr_rel_group[29]),.oQ(issued_intr[29]));
pio_SRFF issued_intr30_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[30]),.iRst(intr_rel_group[30]),.oQ(issued_intr[30]));
pio_SRFF issued_intr31_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[31]),.iRst(intr_rel_group[31]),.oQ(issued_intr[31]));
pio_SRFF issued_intr32_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[32]),.iRst(intr_rel_group[32]),.oQ(issued_intr[32]));
pio_SRFF issued_intr33_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[33]),.iRst(intr_rel_group[33]),.oQ(issued_intr[33]));
pio_SRFF issued_intr34_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[34]),.iRst(intr_rel_group[34]),.oQ(issued_intr[34]));
pio_SRFF issued_intr35_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[35]),.iRst(intr_rel_group[35]),.oQ(issued_intr[35]));
pio_SRFF issued_intr36_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[36]),.iRst(intr_rel_group[36]),.oQ(issued_intr[36]));
pio_SRFF issued_intr37_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[37]),.iRst(intr_rel_group[37]),.oQ(issued_intr[37]));
pio_SRFF issued_intr38_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[38]),.iRst(intr_rel_group[38]),.oQ(issued_intr[38]));
pio_SRFF issued_intr39_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[39]),.iRst(intr_rel_group[39]),.oQ(issued_intr[39]));
pio_SRFF issued_intr40_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[40]),.iRst(intr_rel_group[40]),.oQ(issued_intr[40]));
pio_SRFF issued_intr41_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[41]),.iRst(intr_rel_group[41]),.oQ(issued_intr[41]));
pio_SRFF issued_intr42_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[42]),.iRst(intr_rel_group[42]),.oQ(issued_intr[42]));
pio_SRFF issued_intr43_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[43]),.iRst(intr_rel_group[43]),.oQ(issued_intr[43]));
pio_SRFF issued_intr44_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[44]),.iRst(intr_rel_group[44]),.oQ(issued_intr[44]));
pio_SRFF issued_intr45_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[45]),.iRst(intr_rel_group[45]),.oQ(issued_intr[45]));
pio_SRFF issued_intr46_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[46]),.iRst(intr_rel_group[46]),.oQ(issued_intr[46]));
pio_SRFF issued_intr47_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[47]),.iRst(intr_rel_group[47]),.oQ(issued_intr[47]));
pio_SRFF issued_intr48_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[48]),.iRst(intr_rel_group[48]),.oQ(issued_intr[48]));
pio_SRFF issued_intr49_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[49]),.iRst(intr_rel_group[49]),.oQ(issued_intr[49]));
pio_SRFF issued_intr50_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[50]),.iRst(intr_rel_group[50]),.oQ(issued_intr[50]));
pio_SRFF issued_intr51_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[51]),.iRst(intr_rel_group[51]),.oQ(issued_intr[51]));
pio_SRFF issued_intr52_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[52]),.iRst(intr_rel_group[52]),.oQ(issued_intr[52]));
pio_SRFF issued_intr53_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[53]),.iRst(intr_rel_group[53]),.oQ(issued_intr[53]));
pio_SRFF issued_intr54_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[54]),.iRst(intr_rel_group[54]),.oQ(issued_intr[54]));
pio_SRFF issued_intr55_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[55]),.iRst(intr_rel_group[55]),.oQ(issued_intr[55]));
pio_SRFF issued_intr56_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[56]),.iRst(intr_rel_group[56]),.oQ(issued_intr[56]));
pio_SRFF issued_intr57_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[57]),.iRst(intr_rel_group[57]),.oQ(issued_intr[57]));
pio_SRFF issued_intr58_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[58]),.iRst(intr_rel_group[58]),.oQ(issued_intr[58]));
pio_SRFF issued_intr59_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[59]),.iRst(intr_rel_group[59]),.oQ(issued_intr[59]));
pio_SRFF issued_intr60_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[60]),.iRst(intr_rel_group[60]),.oQ(issued_intr[60]));
pio_SRFF issued_intr61_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[61]),.iRst(intr_rel_group[61]),.oQ(issued_intr[61]));
pio_SRFF issued_intr62_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[62]),.iRst(intr_rel_group[62]),.oQ(issued_intr[62]));
pio_SRFF issued_intr63_srflop (.reset(reset),.clk(clk),.iSet(intr_req_group[63]),.iRst(intr_rel_group[63]),.oQ(issued_intr[63]));

niu_pio_scheduler64  niu_pio_scheduler64
  (/*AUTOINST*/
   // Outputs
   .group				(group[5:0]),
   // Inputs
   .clk					(clk),
   .reset				(reset),
   .intr_req_group			(intr_req_group[63:0]),
   .intr_rel_group			(intr_rel_group[63:0]),
   .activate_ig_sm			(activate_ig_sm),
   .activate_ig_sm_rel			(activate_ig_sm_rel),
   .activate_ig_sm_rel_latched          (activate_ig_sm_rel_latched),
   .latch_req_mux_out			(latch_req_mux_out),
   .latch_result_group			(latch_result_group),
   .latch_nx_pri_group			(latch_nx_pri_group));


niu_pio_ig_sm niu_pio_ig_sm
  (/*AUTOINST*/
   // Outputs
   .latch_req_mux_out			(latch_req_mux_out),
   .latch_result_group			(latch_result_group),
   .latch_nx_pri_group			(latch_nx_pri_group),
   .intr_valid				(intr_valid),
   .intr_invalid	        	(intr_invalid),
   .rst_at				(rst_at),
   .ig_state				(ig_state[2:0]),
   // Inputs
   .clk					(clk),
   .reset				(reset),
   .ibusy				(ibusy),
   .activate_ig_sm			(activate_ig_sm),
   .activate_ig_sm_rel_latched          (activate_ig_sm_rel_latched),
   .activate_ig_sm_rel                  (activate_ig_sm_rel));
   
endmodule // niu_pio_ic
// Local Variables:
// verilog-library-directories:(".")
// End:

module pio_SRFF (reset,clk,iSet,iRst,oQ);

input  reset, clk, iSet, iRst;
output oQ;

reg oQ;

always @ (posedge clk)
if (reset)
   oQ <= 0;
else
   casex({iSet, iRst})
      2'b00:  oQ <= oQ;
      2'b01:  oQ <= 0;
      2'b1x:  oQ <= 1;
   endcase

endmodule // end of Set Reset Flip Flop


