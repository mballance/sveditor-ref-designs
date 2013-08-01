// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_regs.v
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
 * File Name    : niu_pio_regs.v
 * Author Name  : John Lo
 * Description  : It contains PIO registers,
 * 
 * Parent Module: niu_pio.v
 * Child  Module: many decoders.
 * Interface Mod: 
 * Date Created : 3/12/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/

module niu_pio_regs(/*AUTOARG*/
   // Outputs
   slv_ack, slv_rdata, slv_err, fzc_slv_ack, fzc_slv_rdata, 
   fzc_slv_err, vdmc_addr, vdmc_sel_ok, ldsv_ack, ldsv_rdata, 
   ldsv_err, ldgim_ack, ldgim_rdata, ldgim_err, intr_reg_sel,
   imask0_ack, imask0_rdata, imask0_err, imask1_ack, imask1_rdata,
   imask1_err, 
   mpc, ack_TO_en, ack_TO_value, 
   mac_reset0, mac_reset1, 
   mac_reset2, mac_reset3, msi_data, ldgn0, ldgn1, ldgn2, ldgn3, 
   ldgn4, ldgn5, ldgn6, ldgn7, ldgn8, ldgn9, ldgn10, ldgn11, ldgn12, 
   ldgn13, ldgn14, ldgn15, ldgn16, ldgn17, ldgn18, ldgn19, ldgn20, 
   ldgn21, ldgn22, ldgn23, ldgn24, ldgn25, ldgn26, ldgn27, ldgn28, 
   ldgn29, ldgn30, ldgn31, ldgn32, ldgn33, ldgn34, ldgn35, ldgn36, 
   ldgn37, ldgn38, ldgn39, ldgn40, ldgn41, ldgn42, ldgn43, ldgn44, 
   ldgn45, ldgn46, ldgn47, ldgn48, ldgn49, ldgn50, ldgn51, ldgn52, 
   ldgn53, ldgn54, ldgn55, ldgn56, ldgn57, ldgn58, ldgn59, ldgn60, 
   ldgn61, ldgn62, ldgn63, ldgn64, ldgn65, ldgn66, ldgn67, ldgn68, 
   arm0, arm1, arm2, arm3, arm4, arm5, arm6, arm7, arm8, arm9, arm10, 
   arm11, arm12, arm13, arm14, arm15, arm16, arm17, arm18, arm19, 
   arm20, arm21, arm22, arm23, arm24, arm25, arm26, arm27, arm28, 
   arm29, arm30, arm31, arm32, arm33, arm34, arm35, arm36, arm37, 
   arm38, arm39, arm40, arm41, arm42, arm43, arm44, arm45, arm46, 
   arm47, arm48, arm49, arm50, arm51, arm52, arm53, arm54, arm55, 
   arm56, arm57, arm58, arm59, arm60, arm61, arm62, arm63, ldf_mask0, 
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
   ldf_mask67, ldf_mask68, timer0, timer1, timer2, timer3, timer4, 
   timer5, timer6, timer7, timer8, timer9, timer10, timer11, timer12, 
   timer13, timer14, timer15, timer16, timer17, timer18, timer19, 
   timer20, timer21, timer22, timer23, timer24, timer25, timer26, 
   timer27, timer28, timer29, timer30, timer31, timer32, timer33, 
   timer34, timer35, timer36, timer37, timer38, timer39, timer40, 
   timer41, timer42, timer43, timer44, timer45, timer46, timer47, 
   timer48, timer49, timer50, timer51, timer52, timer53, timer54, 
   timer55, timer56, timer57, timer58, timer59, timer60, timer61, 
   timer62, timer63, 
   debug_select, TrainingVector, arb_ctrl, arb_debug_vector,
   arb_dirtid_en, arb_dirtid_clr, arb_np_threshold, arb_rd_threshold,
   sys_err_mask, smx_meta_intr_hld ,
`ifdef NEPTUNE
   gpio_dout, gpio_en,
`else
   smx_ctrl, smx_debug_vector, smx_config_data, smx_intr_clr,
`endif
   // Inputs
   clk, reset, niu_reset, addr, rd, slv_sel_reg, 
   fzc_slv_sel_reg, ldsv_sel_reg, ldgim_sel_reg, imask0_sel_reg, 
   imask1_sel_reg, group, memship_group0, memship_group1, 
   memship_group2, memship_group3, memship_group4, memship_group5, 
   memship_group6, memship_group7, memship_group8, memship_group9, 
   memship_group10, memship_group11, memship_group12, 
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
   rst_at, ldfi, ldfj, pio_32b_wr,
   arb_rdstat, arb_wrstat,
   ipp_intr, fflp_intr, zcp_intr, txc_intr, rdmc_intr, 
   meta_intr1, meta_intr2, mif_intr, 
`ifdef NEPTUNE
   pim_intr,
   gpio_din,
   wr_data
`else
   smx_intr, wr_data, smx_status
`endif
   );
   
   input [31:0]               wr_data;
   input 		      clk;
   input 		      reset;
   input 		      niu_reset;
                              // pio broadcast signals
   input [26:0] 	      addr;
   input 		      rd;
   input 		      slv_sel_reg;
   input 		      fzc_slv_sel_reg;
   input 		      ldsv_sel_reg;
   input 		      ldgim_sel_reg;
   input 		      imask0_sel_reg;
   input 		      imask1_sel_reg;
	
   output [10:0] 	      sys_err_mask;
   output                     smx_meta_intr_hld; 

   output 		      slv_ack;
   output [63:0] 	      slv_rdata;
   output 		      slv_err;

   output 		      fzc_slv_ack;
   output [63:0] 	      fzc_slv_rdata;
   output 		      fzc_slv_err;

   output [19:0] 	      vdmc_addr;
   output 		      vdmc_sel_ok;
   
   output 		      ldsv_ack;
   output [63:0] 	      ldsv_rdata;
   output 		      ldsv_err;

   output 		      ldgim_ack;
   output [63:0] 	      ldgim_rdata;
   output 		      ldgim_err;
   output 		      intr_reg_sel;

   output 		      imask0_ack;
   output [63:0] 	      imask0_rdata;
   output 		      imask0_err;

   output 		      imask1_ack;
   output [63:0] 	      imask1_rdata;
   output 		      imask1_err;

   output         	      mpc;
   output 		      ack_TO_en;
   output [9:0] 	      ack_TO_value;
   output 		      mac_reset0;
   output 		      mac_reset1;
   output 		      mac_reset2;
   output 		      mac_reset3;
                              //
   input [5:0] 		      group;
   
   input [68:0] 	      memship_group0 ;
   input [68:0] 	      memship_group1 ;
   input [68:0] 	      memship_group2 ;
   input [68:0] 	      memship_group3 ;
   input [68:0] 	      memship_group4 ;
   input [68:0] 	      memship_group5 ;
   input [68:0] 	      memship_group6 ;
   input [68:0] 	      memship_group7 ;
   input [68:0] 	      memship_group8 ;
   input [68:0] 	      memship_group9 ;
   input [68:0] 	      memship_group10;
   input [68:0] 	      memship_group11;
   input [68:0] 	      memship_group12;
   input [68:0] 	      memship_group13;
   input [68:0] 	      memship_group14;
   input [68:0] 	      memship_group15;
   input [68:0] 	      memship_group16;
   input [68:0] 	      memship_group17;
   input [68:0] 	      memship_group18;
   input [68:0] 	      memship_group19;
   input [68:0] 	      memship_group20;
   input [68:0] 	      memship_group21;
   input [68:0] 	      memship_group22;
   input [68:0] 	      memship_group23;
   input [68:0] 	      memship_group24;
   input [68:0] 	      memship_group25;
   input [68:0] 	      memship_group26;
   input [68:0] 	      memship_group27;
   input [68:0] 	      memship_group28;
   input [68:0] 	      memship_group29;
   input [68:0] 	      memship_group30;
   input [68:0] 	      memship_group31;
   input [68:0] 	      memship_group32;
   input [68:0] 	      memship_group33;
   input [68:0] 	      memship_group34;
   input [68:0] 	      memship_group35;
   input [68:0] 	      memship_group36;
   input [68:0] 	      memship_group37;
   input [68:0] 	      memship_group38;
   input [68:0] 	      memship_group39;
   input [68:0] 	      memship_group40;
   input [68:0] 	      memship_group41;
   input [68:0] 	      memship_group42;
   input [68:0] 	      memship_group43;
   input [68:0] 	      memship_group44;
   input [68:0] 	      memship_group45;
   input [68:0] 	      memship_group46;
   input [68:0] 	      memship_group47;
   input [68:0] 	      memship_group48;
   input [68:0] 	      memship_group49;
   input [68:0] 	      memship_group50;
   input [68:0] 	      memship_group51;
   input [68:0] 	      memship_group52;
   input [68:0] 	      memship_group53;
   input [68:0] 	      memship_group54;
   input [68:0] 	      memship_group55;
   input [68:0] 	      memship_group56;
   input [68:0] 	      memship_group57;
   input [68:0] 	      memship_group58;
   input [68:0] 	      memship_group59;
   input [68:0] 	      memship_group60;
   input [68:0] 	      memship_group61;
   input [68:0] 	      memship_group62;
   input [68:0] 	      memship_group63;
   
   input 		      rst_at;
   input [68:0] 	      ldfi;
   input [68:0] 	      ldfj;

   output [6:0] 	      msi_data;
   output [5:0] 	      ldgn0 ;
   output [5:0] 	      ldgn1 ;
   output [5:0] 	      ldgn2 ;
   output [5:0] 	      ldgn3 ;
   output [5:0] 	      ldgn4 ;
   output [5:0] 	      ldgn5 ;
   output [5:0] 	      ldgn6 ;
   output [5:0] 	      ldgn7 ;
   output [5:0] 	      ldgn8 ;
   output [5:0] 	      ldgn9 ;
   output [5:0] 	      ldgn10;
   output [5:0] 	      ldgn11;
   output [5:0] 	      ldgn12;
   output [5:0] 	      ldgn13;
   output [5:0] 	      ldgn14;
   output [5:0] 	      ldgn15;
   output [5:0] 	      ldgn16;
   output [5:0] 	      ldgn17;
   output [5:0] 	      ldgn18;
   output [5:0] 	      ldgn19;
   output [5:0] 	      ldgn20;
   output [5:0] 	      ldgn21;
   output [5:0] 	      ldgn22;
   output [5:0] 	      ldgn23;
   output [5:0] 	      ldgn24;
   output [5:0] 	      ldgn25;
   output [5:0] 	      ldgn26;
   output [5:0] 	      ldgn27;
   output [5:0] 	      ldgn28;
   output [5:0] 	      ldgn29;
   output [5:0] 	      ldgn30;
   output [5:0] 	      ldgn31;
   output [5:0] 	      ldgn32;
   output [5:0] 	      ldgn33;
   output [5:0] 	      ldgn34;
   output [5:0] 	      ldgn35;
   output [5:0] 	      ldgn36;
   output [5:0] 	      ldgn37;
   output [5:0] 	      ldgn38;
   output [5:0] 	      ldgn39;
   output [5:0] 	      ldgn40;
   output [5:0] 	      ldgn41;
   output [5:0] 	      ldgn42;
   output [5:0] 	      ldgn43;
   output [5:0] 	      ldgn44;
   output [5:0] 	      ldgn45;
   output [5:0] 	      ldgn46;
   output [5:0] 	      ldgn47;
   output [5:0] 	      ldgn48;
   output [5:0] 	      ldgn49;
   output [5:0] 	      ldgn50;
   output [5:0] 	      ldgn51;
   output [5:0] 	      ldgn52;
   output [5:0] 	      ldgn53;
   output [5:0] 	      ldgn54;
   output [5:0] 	      ldgn55;
   output [5:0] 	      ldgn56;
   output [5:0] 	      ldgn57;
   output [5:0] 	      ldgn58;
   output [5:0] 	      ldgn59;
   output [5:0] 	      ldgn60;
   output [5:0] 	      ldgn61;
   output [5:0] 	      ldgn62;
   output [5:0] 	      ldgn63;
   output [5:0] 	      ldgn64;
   output [5:0] 	      ldgn65;
   output [5:0] 	      ldgn66;
   output [5:0] 	      ldgn67;
   output [5:0] 	      ldgn68;

   output      	              arm0 ;
   output      	              arm1 ;
   output      	              arm2 ;
   output      	              arm3 ;
   output      	              arm4 ;
   output      	              arm5 ;
   output      	              arm6 ;
   output      	              arm7 ;
   output      	              arm8 ;
   output      	              arm9 ;
   output      	              arm10;
   output      	              arm11;
   output      	              arm12;
   output      	              arm13;
   output      	              arm14;
   output      	              arm15;
   output      	              arm16;
   output      	              arm17;
   output      	              arm18;
   output      	              arm19;
   output      	              arm20;
   output      	              arm21;
   output      	              arm22;
   output      	              arm23;
   output      	              arm24;
   output      	              arm25;
   output      	              arm26;
   output      	              arm27;
   output      	              arm28;
   output      	              arm29;
   output      	              arm30;
   output      	              arm31;
   output      	              arm32;
   output      	              arm33;
   output      	              arm34;
   output      	              arm35;
   output      	              arm36;
   output      	              arm37;
   output      	              arm38;
   output      	              arm39;
   output      	              arm40;
   output      	              arm41;
   output      	              arm42;
   output      	              arm43;
   output      	              arm44;
   output      	              arm45;
   output      	              arm46;
   output      	              arm47;
   output      	              arm48;
   output      	              arm49;
   output      	              arm50;
   output      	              arm51;
   output      	              arm52;
   output      	              arm53;
   output      	              arm54;
   output      	              arm55;
   output      	              arm56;
   output      	              arm57;
   output      	              arm58;
   output      	              arm59;
   output      	              arm60;
   output      	              arm61;
   output      	              arm62;
   output      	              arm63;   

   output [1:0] 	      ldf_mask0 ;
   output [1:0] 	      ldf_mask1 ;
   output [1:0] 	      ldf_mask2 ;
   output [1:0] 	      ldf_mask3 ;
   output [1:0] 	      ldf_mask4 ;
   output [1:0] 	      ldf_mask5 ;
   output [1:0] 	      ldf_mask6 ;
   output [1:0] 	      ldf_mask7 ;
   output [1:0] 	      ldf_mask8 ;
   output [1:0] 	      ldf_mask9 ;
   output [1:0] 	      ldf_mask10;
   output [1:0] 	      ldf_mask11;
   output [1:0] 	      ldf_mask12;
   output [1:0] 	      ldf_mask13;
   output [1:0] 	      ldf_mask14;
   output [1:0] 	      ldf_mask15;
   output [1:0] 	      ldf_mask16;
   output [1:0] 	      ldf_mask17;
   output [1:0] 	      ldf_mask18;
   output [1:0] 	      ldf_mask19;
   output [1:0] 	      ldf_mask20;
   output [1:0] 	      ldf_mask21;
   output [1:0] 	      ldf_mask22;
   output [1:0] 	      ldf_mask23;
   output [1:0] 	      ldf_mask24;
   output [1:0] 	      ldf_mask25;
   output [1:0] 	      ldf_mask26;
   output [1:0] 	      ldf_mask27;
   output [1:0] 	      ldf_mask28;
   output [1:0] 	      ldf_mask29;
   output [1:0] 	      ldf_mask30;
   output [1:0] 	      ldf_mask31;
   output [1:0] 	      ldf_mask32;
   output [1:0] 	      ldf_mask33;
   output [1:0] 	      ldf_mask34;
   output [1:0] 	      ldf_mask35;
   output [1:0] 	      ldf_mask36;
   output [1:0] 	      ldf_mask37;
   output [1:0] 	      ldf_mask38;
   output [1:0] 	      ldf_mask39;
   output [1:0] 	      ldf_mask40;
   output [1:0] 	      ldf_mask41;
   output [1:0] 	      ldf_mask42;
   output [1:0] 	      ldf_mask43;
   output [1:0] 	      ldf_mask44;
   output [1:0] 	      ldf_mask45;
   output [1:0] 	      ldf_mask46;
   output [1:0] 	      ldf_mask47;
   output [1:0] 	      ldf_mask48;
   output [1:0] 	      ldf_mask49;
   output [1:0] 	      ldf_mask50;
   output [1:0] 	      ldf_mask51;
   output [1:0] 	      ldf_mask52;
   output [1:0] 	      ldf_mask53;
   output [1:0] 	      ldf_mask54;
   output [1:0] 	      ldf_mask55;
   output [1:0] 	      ldf_mask56;
   output [1:0] 	      ldf_mask57;
   output [1:0] 	      ldf_mask58;
   output [1:0] 	      ldf_mask59;
   output [1:0] 	      ldf_mask60;
   output [1:0] 	      ldf_mask61;
   output [1:0] 	      ldf_mask62;
   output [1:0] 	      ldf_mask63;
   output [1:0] 	      ldf_mask64;
   output [1:0] 	      ldf_mask65;
   output [1:0] 	      ldf_mask66;
   output [1:0] 	      ldf_mask67;
   output [1:0] 	      ldf_mask68;
   
   output [5:0] 	      timer0 ;
   output [5:0] 	      timer1 ;
   output [5:0] 	      timer2 ;
   output [5:0] 	      timer3 ;
   output [5:0] 	      timer4 ;
   output [5:0] 	      timer5 ;
   output [5:0] 	      timer6 ;
   output [5:0] 	      timer7 ;
   output [5:0] 	      timer8 ;
   output [5:0] 	      timer9 ;
   output [5:0] 	      timer10;
   output [5:0] 	      timer11;
   output [5:0] 	      timer12;
   output [5:0] 	      timer13;
   output [5:0] 	      timer14;
   output [5:0] 	      timer15;
   output [5:0] 	      timer16;
   output [5:0] 	      timer17;
   output [5:0] 	      timer18;
   output [5:0] 	      timer19;
   output [5:0] 	      timer20;
   output [5:0] 	      timer21;
   output [5:0] 	      timer22;
   output [5:0] 	      timer23;
   output [5:0] 	      timer24;
   output [5:0] 	      timer25;
   output [5:0] 	      timer26;
   output [5:0] 	      timer27;
   output [5:0] 	      timer28;
   output [5:0] 	      timer29;
   output [5:0] 	      timer30;
   output [5:0] 	      timer31;
   output [5:0] 	      timer32;
   output [5:0] 	      timer33;
   output [5:0] 	      timer34;
   output [5:0] 	      timer35;
   output [5:0] 	      timer36;
   output [5:0] 	      timer37;
   output [5:0] 	      timer38;
   output [5:0] 	      timer39;
   output [5:0] 	      timer40;
   output [5:0] 	      timer41;
   output [5:0] 	      timer42;
   output [5:0] 	      timer43;
   output [5:0] 	      timer44;
   output [5:0] 	      timer45;
   output [5:0] 	      timer46;
   output [5:0] 	      timer47;
   output [5:0] 	      timer48;
   output [5:0] 	      timer49;
   output [5:0] 	      timer50;
   output [5:0] 	      timer51;
   output [5:0] 	      timer52;
   output [5:0] 	      timer53;
   output [5:0] 	      timer54;
   output [5:0] 	      timer55;
   output [5:0] 	      timer56;
   output [5:0] 	      timer57;
   output [5:0] 	      timer58;
   output [5:0] 	      timer59;
   output [5:0] 	      timer60;
   output [5:0] 	      timer61;
   output [5:0] 	      timer62;
   output [5:0] 	      timer63;
   output [5:0] 	      debug_select;
   output [31:0] 	      TrainingVector;

   output [31:0]              arb_ctrl; 
   output [31:0]              arb_debug_vector; 
   output                     arb_dirtid_en; 
   output                     arb_dirtid_clr; 
   output [5:0]               arb_np_threshold; 
   output [5:0]               arb_rd_threshold;
   input  [5:0]               arb_rdstat;
   input  [5:0]               arb_wrstat;

   input                      pio_32b_wr;
   input                      mif_intr;
   input                      ipp_intr;
   input                      fflp_intr;
   input                      zcp_intr;
   input                      txc_intr; 
   input                      rdmc_intr; 
   input                      meta_intr1; 
   input                      meta_intr2; 
`ifdef NEPTUNE
   input                      pim_intr;
   output [15:0]              gpio_dout;
   output [15:0]              gpio_en;
   input  [15:0]              gpio_din;
`else
   input                      smx_intr;
   input  [31:0] 	      smx_status;
   output [31:0] 	      smx_config_data;
   output [31:0] 	      smx_ctrl;
   output [31:0] 	      smx_debug_vector;
   output         	      smx_intr_clr;
`endif
   
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			ld_config1;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sys_err_mask;	// 
wire			ld_sys_err_stat;	// 
wire			ld_rst_ctl;		//
wire			ld_dev_func_share;	// From niu_pio_slv_decoder of niu_pio_slv_decoder.v
wire			rd_dev_func_share;	// From niu_pio_slv_decoder of niu_pio_slv_decoder.v
wire			ld_dma_bind0;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind1;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind10;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind11;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind12;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind13;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind14;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind15;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind16;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind17;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind18;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind19;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind2;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind20;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind21;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind22;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind23;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind24;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind25;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind26;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind27;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind28;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind29;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind3;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind30;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind31;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind32;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind33;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind34;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind35;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind36;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind37;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind38;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind39;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind4;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind40;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind41;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind42;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind43;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind44;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind45;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind46;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind47;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind48;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind49;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind5;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind50;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind51;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind52;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind53;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind54;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind55;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind56;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind57;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind58;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind59;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind6;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind60;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind61;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind62;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind63;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind7;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind8;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_dma_bind9;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldf_mask0;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask1;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask10;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask11;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask12;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask13;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask14;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask15;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask16;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask17;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask18;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask19;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask2;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask20;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask21;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask22;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask23;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask24;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask25;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask26;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask27;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask28;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask29;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask3;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask30;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask31;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask32;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask33;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask34;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask35;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask36;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask37;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask38;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask39;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask4;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask40;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask41;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask42;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask43;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask44;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask45;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask46;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask47;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask48;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask49;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask5;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask50;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask51;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask52;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask53;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask54;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask55;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask56;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask57;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask58;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask59;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask6;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask60;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask61;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask62;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask63;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask64;		// From niu_pio_imask1_decoder of niu_pio_imask1_decoder.v
wire			ld_ldf_mask65;		// From niu_pio_imask1_decoder of niu_pio_imask1_decoder.v
wire			ld_ldf_mask66;		// From niu_pio_imask1_decoder of niu_pio_imask1_decoder.v
wire			ld_ldf_mask67;		// From niu_pio_imask1_decoder of niu_pio_imask1_decoder.v
wire			ld_ldf_mask68;		// From niu_pio_imask1_decoder of niu_pio_imask1_decoder.v
wire			ld_ldf_mask7;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask8;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldf_mask9;		// From niu_pio_imask0_decoder of niu_pio_imask0_decoder.v
wire			ld_ldgim0;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim1;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim10;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim11;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim12;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim13;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim14;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim15;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim16;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim17;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim18;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim19;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim2;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim20;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim21;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim22;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim23;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim24;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim25;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim26;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim27;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim28;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim29;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim3;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim30;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim31;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim32;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim33;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim34;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim35;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim36;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim37;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim38;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim39;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim4;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim40;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim41;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim42;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim43;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim44;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim45;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim46;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim47;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim48;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim49;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim5;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim50;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim51;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim52;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim53;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim54;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim55;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim56;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim57;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim58;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim59;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim6;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim60;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim61;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim62;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim63;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim7;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim8;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgim9;		// From niu_pio_ldgim_decoder of niu_pio_ldgim_decoder.v
wire			ld_ldgn0;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn1;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn10;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn11;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn12;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn13;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn14;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn15;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn16;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn17;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn18;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn19;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn2;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn20;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn21;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn22;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn23;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn24;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn25;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn26;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn27;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn28;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn29;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn3;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn30;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn31;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn32;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn33;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn34;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn35;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn36;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn37;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn38;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn39;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn4;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn40;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn41;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn42;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn43;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn44;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn45;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn46;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn47;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn48;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn49;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn5;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn50;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn51;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn52;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn53;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn54;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn55;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn56;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn57;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn58;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn59;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn6;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn60;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn61;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn62;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn63;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn64;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn65;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn66;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn67;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn68;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn7;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn8;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_ldgn9;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_rtimer;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid0;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid1;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid10;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid11;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid12;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid13;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid14;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid15;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid16;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid17;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid18;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid19;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid2;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid20;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid21;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid22;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid23;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid24;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid25;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid26;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid27;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid28;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid29;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid3;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid30;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid31;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid32;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid33;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid34;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid35;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid36;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid37;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid38;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid39;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid4;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid40;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid41;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid42;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid43;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid44;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid45;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid46;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid47;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid48;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid49;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid5;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid50;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid51;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid52;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid53;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid54;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid55;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid56;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid57;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid58;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid59;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid6;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid60;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid61;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid62;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid63;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid7;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid8;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ld_sid9;		// From niu_pio_fzc_slv_decoder of niu_pio_fzc_slv_decoder.v
wire			ras_dev_func_share;	// From niu_pio_slv_decoder of niu_pio_slv_decoder.v
// End of automatics
   
   wire [13:0] 		      dma_bind0 ;
   wire [13:0] 		      dma_bind1 ;
   wire [13:0] 		      dma_bind2 ;
   wire [13:0] 		      dma_bind3 ;
   wire [13:0] 		      dma_bind4 ;
   wire [13:0] 		      dma_bind5 ;
   wire [13:0] 		      dma_bind6 ;
   wire [13:0] 		      dma_bind7 ;
   wire [13:0] 		      dma_bind8 ;
   wire [13:0] 		      dma_bind9 ;
   wire [13:0] 		      dma_bind10;
   wire [13:0] 		      dma_bind11;
   wire [13:0] 		      dma_bind12;
   wire [13:0] 		      dma_bind13;
   wire [13:0] 		      dma_bind14;
   wire [13:0] 		      dma_bind15;
   wire [13:0] 		      dma_bind16;
   wire [13:0] 		      dma_bind17;
   wire [13:0] 		      dma_bind18;
   wire [13:0] 		      dma_bind19;
   wire [13:0] 		      dma_bind20;
   wire [13:0] 		      dma_bind21;
   wire [13:0] 		      dma_bind22;
   wire [13:0] 		      dma_bind23;
   wire [13:0] 		      dma_bind24;
   wire [13:0] 		      dma_bind25;
   wire [13:0] 		      dma_bind26;
   wire [13:0] 		      dma_bind27;
   wire [13:0] 		      dma_bind28;
   wire [13:0] 		      dma_bind29;
   wire [13:0] 		      dma_bind30;
   wire [13:0] 		      dma_bind31;
   wire [13:0] 		      dma_bind32;
   wire [13:0] 		      dma_bind33;
   wire [13:0] 		      dma_bind34;
   wire [13:0] 		      dma_bind35;
   wire [13:0] 		      dma_bind36;
   wire [13:0] 		      dma_bind37;
   wire [13:0] 		      dma_bind38;
   wire [13:0] 		      dma_bind39;
   wire [13:0] 		      dma_bind40;
   wire [13:0] 		      dma_bind41;
   wire [13:0] 		      dma_bind42;
   wire [13:0] 		      dma_bind43;
   wire [13:0] 		      dma_bind44;
   wire [13:0] 		      dma_bind45;
   wire [13:0] 		      dma_bind46;
   wire [13:0] 		      dma_bind47;
   wire [13:0] 		      dma_bind48;
   wire [13:0] 		      dma_bind49;
   wire [13:0] 		      dma_bind50;
   wire [13:0] 		      dma_bind51;
   wire [13:0] 		      dma_bind52;
   wire [13:0] 		      dma_bind53;
   wire [13:0] 		      dma_bind54;
   wire [13:0] 		      dma_bind55;
   wire [13:0] 		      dma_bind56;
   wire [13:0] 		      dma_bind57;
   wire [13:0] 		      dma_bind58;
   wire [13:0] 		      dma_bind59;
   wire [13:0] 		      dma_bind60;
   wire [13:0] 		      dma_bind61;
   wire [13:0] 		      dma_bind62;
   wire [13:0] 		      dma_bind63;

   wire [6:0] 		      sid0 ;
   wire [6:0] 		      sid1 ;
   wire [6:0] 		      sid2 ;
   wire [6:0] 		      sid3 ;
   wire [6:0] 		      sid4 ;
   wire [6:0] 		      sid5 ;
   wire [6:0] 		      sid6 ;
   wire [6:0] 		      sid7 ;
   wire [6:0] 		      sid8 ;
   wire [6:0] 		      sid9 ;
   wire [6:0] 		      sid10;
   wire [6:0] 		      sid11;
   wire [6:0] 		      sid12;
   wire [6:0] 		      sid13;
   wire [6:0] 		      sid14;
   wire [6:0] 		      sid15;
   wire [6:0] 		      sid16;
   wire [6:0] 		      sid17;
   wire [6:0] 		      sid18;
   wire [6:0] 		      sid19;
   wire [6:0] 		      sid20;
   wire [6:0] 		      sid21;
   wire [6:0] 		      sid22;
   wire [6:0] 		      sid23;
   wire [6:0] 		      sid24;
   wire [6:0] 		      sid25;
   wire [6:0] 		      sid26;
   wire [6:0] 		      sid27;
   wire [6:0] 		      sid28;
   wire [6:0] 		      sid29;
   wire [6:0] 		      sid30;
   wire [6:0] 		      sid31;
   wire [6:0] 		      sid32;
   wire [6:0] 		      sid33;
   wire [6:0] 		      sid34;
   wire [6:0] 		      sid35;
   wire [6:0] 		      sid36;
   wire [6:0] 		      sid37;
   wire [6:0] 		      sid38;
   wire [6:0] 		      sid39;
   wire [6:0] 		      sid40;
   wire [6:0] 		      sid41;
   wire [6:0] 		      sid42;
   wire [6:0] 		      sid43;
   wire [6:0] 		      sid44;
   wire [6:0] 		      sid45;
   wire [6:0] 		      sid46;
   wire [6:0] 		      sid47;
   wire [6:0] 		      sid48;
   wire [6:0] 		      sid49;
   wire [6:0] 		      sid50;
   wire [6:0] 		      sid51;
   wire [6:0] 		      sid52;
   wire [6:0] 		      sid53;
   wire [6:0] 		      sid54;
   wire [6:0] 		      sid55;
   wire [6:0] 		      sid56;
   wire [6:0] 		      sid57;
   wire [6:0] 		      sid58;
   wire [6:0] 		      sid59;
   wire [6:0] 		      sid60;
   wire [6:0] 		      sid61;
   wire [6:0] 		      sid62;
   wire [6:0] 		      sid63;
   
   wire [63:0] 		      fzc_slv_rdata;
   wire [63:0] 		      ldsv_rdata;
   wire [63:0] 		      ldgim_rdata;
   wire [63:0] 		      imask0_rdata;
   wire [63:0] 		      imask1_rdata;

   wire  		      config1 ;
   wire [22:0] 		      rst_ctl ;
   wire 		      rst_at  ;
   wire 		      rst_at0 ;
   wire 		      rst_at1 ;
   wire 		      rst_at2 ;
   wire 		      rst_at3 ;
   wire 		      rst_at4 ;
   wire 		      rst_at5 ;
   wire 		      rst_at6 ;
   wire 		      rst_at7 ;
   wire 		      rst_at8 ;
   wire 		      rst_at9 ;
   wire 		      rst_at10;
   wire 		      rst_at11;
   wire 		      rst_at12;
   wire 		      rst_at13;
   wire 		      rst_at14;
   wire 		      rst_at15;
   wire 		      rst_at16;
   wire 		      rst_at17;
   wire 		      rst_at18;
   wire 		      rst_at19;
   wire 		      rst_at20;
   wire 		      rst_at21;
   wire 		      rst_at22;
   wire 		      rst_at23;
   wire 		      rst_at24;
   wire 		      rst_at25;
   wire 		      rst_at26;
   wire 		      rst_at27;
   wire 		      rst_at28;
   wire 		      rst_at29;
   wire 		      rst_at30;
   wire 		      rst_at31;
   wire 		      rst_at32;
   wire 		      rst_at33;
   wire 		      rst_at34;
   wire 		      rst_at35;
   wire 		      rst_at36;
   wire 		      rst_at37;
   wire 		      rst_at38;
   wire 		      rst_at39;
   wire 		      rst_at40;
   wire 		      rst_at41;
   wire 		      rst_at42;
   wire 		      rst_at43;
   wire 		      rst_at44;
   wire 		      rst_at45;
   wire 		      rst_at46;
   wire 		      rst_at47;
   wire 		      rst_at48;
   wire 		      rst_at49;
   wire 		      rst_at50;
   wire 		      rst_at51;
   wire 		      rst_at52;
   wire 		      rst_at53;
   wire 		      rst_at54;
   wire 		      rst_at55;
   wire 		      rst_at56;
   wire 		      rst_at57;
   wire 		      rst_at58;
   wire 		      rst_at59;
   wire 		      rst_at60;
   wire 		      rst_at61;
   wire 		      rst_at62;
   wire 		      rst_at63;

   wire [63:0]		      ldsv0grp0 ;
   wire [63:0]		      ldsv1grp0 ;
   wire [63:0]		      ldsv2grp0 ;
   wire [63:0]		      ldsv0grp1 ;
   wire [63:0]		      ldsv1grp1 ;
   wire [63:0]		      ldsv2grp1 ;
   wire [63:0]		      ldsv0grp2 ;
   wire [63:0]		      ldsv1grp2 ;
   wire [63:0]		      ldsv2grp2 ;
   wire [63:0]		      ldsv0grp3 ;
   wire [63:0]		      ldsv1grp3 ;
   wire [63:0]		      ldsv2grp3 ;
   wire [63:0]		      ldsv0grp4 ;
   wire [63:0]		      ldsv1grp4 ;
   wire [63:0]		      ldsv2grp4 ;
   wire [63:0]		      ldsv0grp5 ;
   wire [63:0]		      ldsv1grp5 ;
   wire [63:0]		      ldsv2grp5 ;
   wire [63:0]		      ldsv0grp6 ;
   wire [63:0]		      ldsv1grp6 ;
   wire [63:0]		      ldsv2grp6 ;
   wire [63:0]		      ldsv0grp7 ;
   wire [63:0]		      ldsv1grp7 ;
   wire [63:0]		      ldsv2grp7 ;
   wire [63:0]		      ldsv0grp8 ;
   wire [63:0]		      ldsv1grp8 ;
   wire [63:0]		      ldsv2grp8 ;
   wire [63:0]		      ldsv0grp9 ;
   wire [63:0]		      ldsv1grp9 ;
   wire [63:0]		      ldsv2grp9 ;
   wire [63:0]		      ldsv0grp10;
   wire [63:0]		      ldsv1grp10;
   wire [63:0]		      ldsv2grp10;
   wire [63:0]		      ldsv0grp11;
   wire [63:0]		      ldsv1grp11;
   wire [63:0]		      ldsv2grp11;
   wire [63:0]		      ldsv0grp12;
   wire [63:0]		      ldsv1grp12;
   wire [63:0]		      ldsv2grp12;
   wire [63:0]		      ldsv0grp13;
   wire [63:0]		      ldsv1grp13;
   wire [63:0]		      ldsv2grp13;
   wire [63:0]		      ldsv0grp14;
   wire [63:0]		      ldsv1grp14;
   wire [63:0]		      ldsv2grp14;
   wire [63:0]		      ldsv0grp15;
   wire [63:0]		      ldsv1grp15;
   wire [63:0]		      ldsv2grp15;
   wire [63:0]		      ldsv0grp16;
   wire [63:0]		      ldsv1grp16;
   wire [63:0]		      ldsv2grp16;
   wire [63:0]		      ldsv0grp17;
   wire [63:0]		      ldsv1grp17;
   wire [63:0]		      ldsv2grp17;
   wire [63:0]		      ldsv0grp18;
   wire [63:0]		      ldsv1grp18;
   wire [63:0]		      ldsv2grp18;
   wire [63:0]		      ldsv0grp19;
   wire [63:0]		      ldsv1grp19;
   wire [63:0]		      ldsv2grp19;
   wire [63:0]		      ldsv0grp20;
   wire [63:0]		      ldsv1grp20;
   wire [63:0]		      ldsv2grp20;
   wire [63:0]		      ldsv0grp21;
   wire [63:0]		      ldsv1grp21;
   wire [63:0]		      ldsv2grp21;
   wire [63:0]		      ldsv0grp22;
   wire [63:0]		      ldsv1grp22;
   wire [63:0]		      ldsv2grp22;
   wire [63:0]		      ldsv0grp23;
   wire [63:0]		      ldsv1grp23;
   wire [63:0]		      ldsv2grp23;
   wire [63:0]		      ldsv0grp24;
   wire [63:0]		      ldsv1grp24;
   wire [63:0]		      ldsv2grp24;
   wire [63:0]		      ldsv0grp25;
   wire [63:0]		      ldsv1grp25;
   wire [63:0]		      ldsv2grp25;
   wire [63:0]		      ldsv0grp26;
   wire [63:0]		      ldsv1grp26;
   wire [63:0]		      ldsv2grp26;
   wire [63:0]		      ldsv0grp27;
   wire [63:0]		      ldsv1grp27;
   wire [63:0]		      ldsv2grp27;
   wire [63:0]		      ldsv0grp28;
   wire [63:0]		      ldsv1grp28;
   wire [63:0]		      ldsv2grp28;
   wire [63:0]		      ldsv0grp29;
   wire [63:0]		      ldsv1grp29;
   wire [63:0]		      ldsv2grp29;
   wire [63:0]		      ldsv0grp30;
   wire [63:0]		      ldsv1grp30;
   wire [63:0]		      ldsv2grp30;
   wire [63:0]		      ldsv0grp31;
   wire [63:0]		      ldsv1grp31;
   wire [63:0]		      ldsv2grp31;
   wire [63:0]		      ldsv0grp32;
   wire [63:0]		      ldsv1grp32;
   wire [63:0]		      ldsv2grp32;
   wire [63:0]		      ldsv0grp33;
   wire [63:0]		      ldsv1grp33;
   wire [63:0]		      ldsv2grp33;
   wire [63:0]		      ldsv0grp34;
   wire [63:0]		      ldsv1grp34;
   wire [63:0]		      ldsv2grp34;
   wire [63:0]		      ldsv0grp35;
   wire [63:0]		      ldsv1grp35;
   wire [63:0]		      ldsv2grp35;
   wire [63:0]		      ldsv0grp36;
   wire [63:0]		      ldsv1grp36;
   wire [63:0]		      ldsv2grp36;
   wire [63:0]		      ldsv0grp37;
   wire [63:0]		      ldsv1grp37;
   wire [63:0]		      ldsv2grp37;
   wire [63:0]		      ldsv0grp38;
   wire [63:0]		      ldsv1grp38;
   wire [63:0]		      ldsv2grp38;
   wire [63:0]		      ldsv0grp39;
   wire [63:0]		      ldsv1grp39;
   wire [63:0]		      ldsv2grp39;
   wire [63:0]		      ldsv0grp40;
   wire [63:0]		      ldsv1grp40;
   wire [63:0]		      ldsv2grp40;
   wire [63:0]		      ldsv0grp41;
   wire [63:0]		      ldsv1grp41;
   wire [63:0]		      ldsv2grp41;
   wire [63:0]		      ldsv0grp42;
   wire [63:0]		      ldsv1grp42;
   wire [63:0]		      ldsv2grp42;
   wire [63:0]		      ldsv0grp43;
   wire [63:0]		      ldsv1grp43;
   wire [63:0]		      ldsv2grp43;
   wire [63:0]		      ldsv0grp44;
   wire [63:0]		      ldsv1grp44;
   wire [63:0]		      ldsv2grp44;
   wire [63:0]		      ldsv0grp45;
   wire [63:0]		      ldsv1grp45;
   wire [63:0]		      ldsv2grp45;
   wire [63:0]		      ldsv0grp46;
   wire [63:0]		      ldsv1grp46;
   wire [63:0]		      ldsv2grp46;
   wire [63:0]		      ldsv0grp47;
   wire [63:0]		      ldsv1grp47;
   wire [63:0]		      ldsv2grp47;
   wire [63:0]		      ldsv0grp48;
   wire [63:0]		      ldsv1grp48;
   wire [63:0]		      ldsv2grp48;
   wire [63:0]		      ldsv0grp49;
   wire [63:0]		      ldsv1grp49;
   wire [63:0]		      ldsv2grp49;
   wire [63:0]		      ldsv0grp50;
   wire [63:0]		      ldsv1grp50;
   wire [63:0]		      ldsv2grp50;
   wire [63:0]		      ldsv0grp51;
   wire [63:0]		      ldsv1grp51;
   wire [63:0]		      ldsv2grp51;
   wire [63:0]		      ldsv0grp52;
   wire [63:0]		      ldsv1grp52;
   wire [63:0]		      ldsv2grp52;
   wire [63:0]		      ldsv0grp53;
   wire [63:0]		      ldsv1grp53;
   wire [63:0]		      ldsv2grp53;
   wire [63:0]		      ldsv0grp54;
   wire [63:0]		      ldsv1grp54;
   wire [63:0]		      ldsv2grp54;
   wire [63:0]		      ldsv0grp55;
   wire [63:0]		      ldsv1grp55;
   wire [63:0]		      ldsv2grp55;
   wire [63:0]		      ldsv0grp56;
   wire [63:0]		      ldsv1grp56;
   wire [63:0]		      ldsv2grp56;
   wire [63:0]		      ldsv0grp57;
   wire [63:0]		      ldsv1grp57;
   wire [63:0]		      ldsv2grp57;
   wire [63:0]		      ldsv0grp58;
   wire [63:0]		      ldsv1grp58;
   wire [63:0]		      ldsv2grp58;
   wire [63:0]		      ldsv0grp59;
   wire [63:0]		      ldsv1grp59;
   wire [63:0]		      ldsv2grp59;
   wire [63:0]		      ldsv0grp60;
   wire [63:0]		      ldsv1grp60;
   wire [63:0]		      ldsv2grp60;
   wire [63:0]		      ldsv0grp61;
   wire [63:0]		      ldsv1grp61;
   wire [63:0]		      ldsv2grp61;
   wire [63:0]		      ldsv0grp62;
   wire [63:0]		      ldsv1grp62;
   wire [63:0]		      ldsv2grp62;
   wire [63:0]		      ldsv0grp63;
   wire [63:0]		      ldsv1grp63;
   wire [63:0]		      ldsv2grp63;

   wire [19:0] 		      rtimer;

   reg [6:0] 		      msi_data;


   wire                       dec_timer ;

   wire [31:0]                arb_din;
   reg  [31:0]                arb_dout;

   assign arb_din[31:0]         = {18'b0,arb_wrstat[5:0],2'b0,arb_rdstat[5:0]};
   assign arb_dirtid_en         = arb_dout[0];
   assign arb_dirtid_clr        = arb_dout[1];
// assign arb_np_threshold[5:0] = arb_dout[9:4];
// assign arb_rd_threshold[5:0] = arb_dout[21:16];

   assign arb_np_threshold[5:0] = arb_dout[21:16];
   assign arb_rd_threshold[5:0] = arb_dout[9:4];

`ifdef NEPTUNE
/* ------------- GPIO registers -------------------------------- */ 
   reg [15:0] 		      gpio_dout;
   reg [15:0] 		      gpio_en;
   reg [15:0] 		      gpio_din_int;

   wire  		      ld_gpio_dout;
   wire  		      ld_gpio_en;
   wire  		      ld_gpio_din;

always @(posedge clk)
 if (reset)
  begin
   gpio_dout[15:0]    <= 16'b0;
   gpio_en[15:0]      <= 16'hffff;
   gpio_din_int[15:0] <= 16'b0 ;
  end
 else 
  begin
   if (ld_gpio_dout & !pio_32b_wr )
    gpio_dout[15:0]    <= wr_data[15:0];
   if (ld_gpio_en & !pio_32b_wr )
    gpio_en[15:0]      <= wr_data[15:0];
   if (ld_gpio_din & !pio_32b_wr )
    gpio_din_int[15:0] <= gpio_din[15:0];
  end

`else
/* ------------- SMx register -------------------------------- */ 
   reg [31:0] 		      smx_intr_status;
   reg [31:0] 		      smx_config_data;
   reg [31:0] 		      smx_ctrl;
   reg  		      smx_intr_clr;
   reg [31:0] 		      smx_debug_vector;
   reg  		      del_ld_smx_intr_clr;

   wire 		      ld_smx_config_data;
   wire 		      ld_smx_ctrl ;
   wire 		      ld_smx_debug_vector ;
   wire 		      ld_smx_intr_status ;
   wire 		      ld_smx_intr_clr ;

always @(posedge clk)
begin
 if (reset)
  begin
// smx_config_data[31:0] <= 32'b0 ;
   smx_config_data[31:0] <= 32'hCFF0FFFF ;
   smx_intr_status[31:0] <= 32'b0 ;
   smx_intr_clr          <= 1'b0 ;
   smx_ctrl[31:0]        <= 32'b0 ;
   smx_debug_vector[31:0]<= 32'b0 ;
   del_ld_smx_intr_clr   <= 1'b0 ;
  end
 else
  begin
   del_ld_smx_intr_clr    <= ld_smx_intr_clr ;
   if (ld_smx_config_data)
    smx_config_data[31:0] <= ({wr_data[31:30],2'b00,wr_data[27:0]}) ;
   if (ld_smx_intr_status)
    smx_intr_status[31:0] <= smx_status[31:0] ;
   if (ld_smx_ctrl)
    smx_ctrl[31:0]        <= wr_data[31:0] ;
   if (ld_smx_debug_vector)
    smx_debug_vector[31:0]<= wr_data[31:0] ;
   begin
    if (del_ld_smx_intr_clr)
     smx_intr_clr         <= 1'b0 ;
    else
     if (ld_smx_intr_clr )
       smx_intr_clr       <= wr_data[0] ;
   end
  end

end

`endif
/* ----------------------------------------------------------- */ 

   reg  [31:0]                arb_din_int ;
   reg  [31:0]                arb_ctrl ;
   reg  [31:0]                arb_debug_vector ;
   reg  [5:0]                 debug_select ;
   reg  [31:0]                TrainingVector ;
   reg  [10:0]                sys_err_mask ; 
   reg  [10:0]                sys_err_stat ; 
   reg                        smx_meta_intr_hld ; 
   reg                        del_ld_arb_dout ; 

   wire                       ld_debug_select ;
   wire                       ld_TrainingVector ;
   wire                       ld_arb_dout ;
   wire                       ld_arb_din ;
   wire                       ld_arb_ctrl ;
   wire                       ld_arb_debug_vector ;
   wire                       ld_smx_meta_intr_hld ; 

/* ----------------------------------------------------------- */ 
always @(posedge clk)
begin
 if (reset)
  begin
   arb_dout[3:0]          <= 4'b0000; 
   arb_dout[9:4]          <= 6'b100000;
   arb_dout[15:10]        <= 6'b000000;
   arb_dout[21:16]        <= 6'b011111;
   arb_dout[31:22]        <= 10'b0000000000;
   del_ld_arb_dout        <= 1'b0; 
  end
 else 
begin
   del_ld_arb_dout          <= ld_arb_dout ; 
   if (ld_arb_dout & !pio_32b_wr & !del_ld_arb_dout)
    begin
     arb_dout[31:2]         <= ({10'b0,wr_data[21:16],6'b0,wr_data[9:4],2'b0}) ;
     arb_dout[1]            <= wr_data[1] ;
     arb_dout[0]            <= wr_data[0] ;
    end
  else
   if (del_ld_arb_dout)
     arb_dout[1]            <= 1'b0 ;
end
end
/* ----------------------------------------------------------- */ 
always @(posedge clk)
begin
 if (reset)
  begin
   arb_din_int[31:0]      <= 32'b0 ;
   arb_ctrl[31:0]         <= 32'b0 ;
   arb_debug_vector[31:0] <= 32'b0 ;
   debug_select[5:0]      <= 6'b0;
   TrainingVector[31:0]   <= 32'b0;
   sys_err_mask[10:0]     <= 11'b11111111111 ; 
   sys_err_stat[10:0]     <= 11'b0 ; 
   smx_meta_intr_hld      <= 1'b0 ; 
  end
 else 
begin
   if (ld_arb_din)
     arb_din_int[31:0]      <= arb_din[31:0] ; 
   if (ld_debug_select & !pio_32b_wr)
     debug_select[5:0]      <= wr_data[5:0] ; 
   if (ld_TrainingVector & !pio_32b_wr)
     TrainingVector[31:0]   <= wr_data[31:0] ; 
   if (ld_arb_ctrl & !pio_32b_wr)
     arb_ctrl[31:0]         <= wr_data[31:0] ; 
   if (ld_arb_debug_vector & !pio_32b_wr)
     arb_debug_vector[31:0] <= wr_data[31:0] ; 
   if (ld_sys_err_mask & !pio_32b_wr)
     sys_err_mask[10:0]     <= wr_data[10:0] ; 

`ifdef NEPTUNE
   if (ld_sys_err_stat & !pio_32b_wr)
   begin
     sys_err_stat[10]	    <= meta_intr2 ;// META 
     sys_err_stat[9]	    <= meta_intr1 ;// META 
     sys_err_stat[8]	    <= pim_intr ;  // PEU
     sys_err_stat[7]	    <= txc_intr ;  // TXC
     sys_err_stat[6]	    <= rdmc_intr ; // RDMC
     sys_err_stat[5]	    <= 1'b0 ;      // TDMC
     sys_err_stat[4]	    <= zcp_intr ;  // ZCP
     sys_err_stat[3]	    <= fflp_intr;  // FFLP
     sys_err_stat[2]	    <= ipp_intr ;  // IPP
     sys_err_stat[1]	    <= mif_intr ;  // MAC
     sys_err_stat[0]	    <= 1'b0 ;      // PIO
   end
`else
   if (ld_sys_err_stat & !pio_32b_wr)
   begin
     sys_err_stat[10]	    <= meta_intr2 ;// META 
     sys_err_stat[9]	    <= meta_intr1 ;// META 
     sys_err_stat[8]	    <= 1'b0 ;      // PEU
     sys_err_stat[7]	    <= txc_intr ;  // TXC
     sys_err_stat[6]	    <= rdmc_intr ; // RDMC
     sys_err_stat[5]	    <= 1'b0 ;      // TDMC
     sys_err_stat[4]	    <= zcp_intr ;  // ZCP
     sys_err_stat[3]	    <= fflp_intr;  // FFLP
     sys_err_stat[2]	    <= ipp_intr ;  // IPP
     sys_err_stat[1]	    <= mif_intr ;  // MAC
     sys_err_stat[0]	    <= smx_intr ;  // SMX 
   end
`endif

   if (ld_smx_meta_intr_hld & !pio_32b_wr)
     smx_meta_intr_hld      <= wr_data[0] ; 
  end
end
/* ----------------------------------------------------------- */ 
/* ------------- device function shared register ------------- */ 

//   dffre #(1) tas_dffe (.clk(clk),
//                             .reset(reset),
//                             .en(ld_dev_func_share | ras_dev_func_share),
//                             .d(wr_data[31] | ras_dev_func_share),
//                             .q(tas));


   reg                            dev_func_share_31 ;
   wire [63:0] 		          dev_func_share;
   wire [15:0] 		          dev_func_share_15_0;
   wire [1:0] 		          dev_func_share_17_16;

   assign dev_func_share[63:32] = 0;
   assign dev_func_share[31:0]  = ({dev_func_share_31,13'b0,dev_func_share_17_16[1:0],dev_func_share_15_0[15:0]});

   dffre #(16) dev_func_share0_dffe (.clk(clk),
				.reset(reset),
                                .en(ld_dev_func_share & !pio_32b_wr),
                                .d(wr_data[15:0]),
                                .q(dev_func_share_15_0[15:0]));

   dffre #(2) dev_func_share1_dffe (.clk(clk),
				.reset(reset),
                                .en(rd_dev_func_share),
                                .d(addr[26:25]),
                                .q(dev_func_share_17_16[1:0]));
 always @(posedge clk)
   if (reset)
    begin
     dev_func_share_31     <= 1'b0;
    end
   else 
    begin
     if (ld_dev_func_share & !pio_32b_wr & !rd_dev_func_share)
      dev_func_share_31    <= wr_data[31];
     else 
      if (rd_dev_func_share)
       dev_func_share_31   <= 1'b1;
    end
   
/* ------------- config1 register (mpc) ------------- */   
// MULTI_PART_CTL (FZC_PIO+0x00000)
pio_xREG2  #(1) config1_xREG2(.clk(clk),
                         .reset(reset),
                         .reset_value(1'b0),
                         .load(ld_config1 & !pio_32b_wr),
                         .din(wr_data[0]),
                         .qout(config1));

    wire         mpc                 = config1;

// RST_CTL (FZC_PIO+0x00080)
pio_xREG2  #(23) config1_early_reset_xREG2(.clk(clk),
                          .reset(niu_reset),   // <- early clock
                          .reset_value(23'b00000000000111111111110),
                          .load(ld_rst_ctl & !pio_32b_wr),
                          .din({wr_data[22:19],7'b0,wr_data[11:1], 1'b0}),
                          .qout(rst_ctl[22:0]));

    wire [9:0]   ack_TO_value        = rst_ctl[10:1];
    wire         ack_TO_en           = rst_ctl[11];
    wire         mac_reset0          = rst_ctl[19];
    wire         mac_reset1          = rst_ctl[20];
    wire         mac_reset2          = rst_ctl[21];
    wire         mac_reset3          = rst_ctl[22];
   
   
/* ------------- dma channel binding register ------------- */   
	
dffre #(14) dma_bind0_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind0 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind0 [13:0]));
dffre #(14) dma_bind1_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind1 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind1 [13:0]));
dffre #(14) dma_bind2_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind2 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind2 [13:0]));
dffre #(14) dma_bind3_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind3 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind3 [13:0]));
dffre #(14) dma_bind4_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind4 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind4 [13:0]));
dffre #(14) dma_bind5_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind5 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind5 [13:0]));
dffre #(14) dma_bind6_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind6 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind6 [13:0]));
dffre #(14) dma_bind7_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind7 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind7 [13:0]));
dffre #(14) dma_bind8_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind8 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind8 [13:0]));
dffre #(14) dma_bind9_dffre  (.clk(clk),.reset(reset),.en(ld_dma_bind9 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind9 [13:0]));
dffre #(14) dma_bind10_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind10 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind10[13:0]));
dffre #(14) dma_bind11_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind11 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind11[13:0]));
dffre #(14) dma_bind12_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind12 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind12[13:0]));
dffre #(14) dma_bind13_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind13 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind13[13:0]));
dffre #(14) dma_bind14_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind14 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind14[13:0]));
dffre #(14) dma_bind15_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind15 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind15[13:0]));
dffre #(14) dma_bind16_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind16 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind16[13:0]));
dffre #(14) dma_bind17_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind17 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind17[13:0]));
dffre #(14) dma_bind18_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind18 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind18[13:0]));
dffre #(14) dma_bind19_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind19 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind19[13:0]));
dffre #(14) dma_bind20_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind20 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind20[13:0]));
dffre #(14) dma_bind21_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind21 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind21[13:0]));
dffre #(14) dma_bind22_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind22 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind22[13:0]));
dffre #(14) dma_bind23_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind23 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind23[13:0]));
dffre #(14) dma_bind24_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind24 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind24[13:0]));
dffre #(14) dma_bind25_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind25 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind25[13:0]));
dffre #(14) dma_bind26_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind26 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind26[13:0]));
dffre #(14) dma_bind27_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind27 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind27[13:0]));
dffre #(14) dma_bind28_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind28 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind28[13:0]));
dffre #(14) dma_bind29_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind29 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind29[13:0]));
dffre #(14) dma_bind30_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind30 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind30[13:0]));
dffre #(14) dma_bind31_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind31 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind31[13:0]));
dffre #(14) dma_bind32_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind32 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind32[13:0]));
dffre #(14) dma_bind33_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind33 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind33[13:0]));
dffre #(14) dma_bind34_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind34 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind34[13:0]));
dffre #(14) dma_bind35_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind35 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind35[13:0]));
dffre #(14) dma_bind36_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind36 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind36[13:0]));
dffre #(14) dma_bind37_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind37 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind37[13:0]));
dffre #(14) dma_bind38_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind38 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind38[13:0]));
dffre #(14) dma_bind39_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind39 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind39[13:0]));
dffre #(14) dma_bind40_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind40 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind40[13:0]));
dffre #(14) dma_bind41_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind41 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind41[13:0]));
dffre #(14) dma_bind42_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind42 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind42[13:0]));
dffre #(14) dma_bind43_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind43 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind43[13:0]));
dffre #(14) dma_bind44_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind44 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind44[13:0]));
dffre #(14) dma_bind45_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind45 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind45[13:0]));
dffre #(14) dma_bind46_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind46 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind46[13:0]));
dffre #(14) dma_bind47_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind47 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind47[13:0]));
dffre #(14) dma_bind48_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind48 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind48[13:0]));
dffre #(14) dma_bind49_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind49 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind49[13:0]));
dffre #(14) dma_bind50_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind50 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind50[13:0]));
dffre #(14) dma_bind51_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind51 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind51[13:0]));
dffre #(14) dma_bind52_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind52 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind52[13:0]));
dffre #(14) dma_bind53_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind53 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind53[13:0]));
dffre #(14) dma_bind54_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind54 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind54[13:0]));
dffre #(14) dma_bind55_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind55 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind55[13:0]));
dffre #(14) dma_bind56_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind56 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind56[13:0]));
dffre #(14) dma_bind57_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind57 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind57[13:0]));
dffre #(14) dma_bind58_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind58 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind58[13:0]));
dffre #(14) dma_bind59_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind59 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind59[13:0]));
dffre #(14) dma_bind60_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind60 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind60[13:0]));
dffre #(14) dma_bind61_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind61 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind61[13:0]));
dffre #(14) dma_bind62_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind62 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind62[13:0]));
dffre #(14) dma_bind63_dffre (.clk(clk),.reset(reset),.en(ld_dma_bind63 & !pio_32b_wr ),.d({wr_data[13:8],2'b00,wr_data[5:0]}),.q(dma_bind63[13:0]));

/* --------------- system interrupt ------------------ */
// logical device group number. count 69
dffre #(6) ldgn0_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn0 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn0 [5:0]));
dffre #(6) ldgn1_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn1 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn1 [5:0]));
dffre #(6) ldgn2_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn2 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn2 [5:0]));
dffre #(6) ldgn3_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn3 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn3 [5:0]));
dffre #(6) ldgn4_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn4 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn4 [5:0]));
dffre #(6) ldgn5_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn5 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn5 [5:0]));
dffre #(6) ldgn6_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn6 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn6 [5:0]));
dffre #(6) ldgn7_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn7 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn7 [5:0]));
dffre #(6) ldgn8_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn8 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn8 [5:0]));
dffre #(6) ldgn9_dffre  (.clk(clk),.reset(reset),.en(ld_ldgn9 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn9 [5:0]));
dffre #(6) ldgn10_dffre (.clk(clk),.reset(reset),.en(ld_ldgn10 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn10[5:0]));
dffre #(6) ldgn11_dffre (.clk(clk),.reset(reset),.en(ld_ldgn11 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn11[5:0]));
dffre #(6) ldgn12_dffre (.clk(clk),.reset(reset),.en(ld_ldgn12 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn12[5:0]));
dffre #(6) ldgn13_dffre (.clk(clk),.reset(reset),.en(ld_ldgn13 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn13[5:0]));
dffre #(6) ldgn14_dffre (.clk(clk),.reset(reset),.en(ld_ldgn14 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn14[5:0]));
dffre #(6) ldgn15_dffre (.clk(clk),.reset(reset),.en(ld_ldgn15 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn15[5:0]));
dffre #(6) ldgn16_dffre (.clk(clk),.reset(reset),.en(ld_ldgn16 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn16[5:0]));
dffre #(6) ldgn17_dffre (.clk(clk),.reset(reset),.en(ld_ldgn17 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn17[5:0]));
dffre #(6) ldgn18_dffre (.clk(clk),.reset(reset),.en(ld_ldgn18 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn18[5:0]));
dffre #(6) ldgn19_dffre (.clk(clk),.reset(reset),.en(ld_ldgn19 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn19[5:0]));
dffre #(6) ldgn20_dffre (.clk(clk),.reset(reset),.en(ld_ldgn20 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn20[5:0]));
dffre #(6) ldgn21_dffre (.clk(clk),.reset(reset),.en(ld_ldgn21 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn21[5:0]));
dffre #(6) ldgn22_dffre (.clk(clk),.reset(reset),.en(ld_ldgn22 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn22[5:0]));
dffre #(6) ldgn23_dffre (.clk(clk),.reset(reset),.en(ld_ldgn23 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn23[5:0]));
dffre #(6) ldgn24_dffre (.clk(clk),.reset(reset),.en(ld_ldgn24 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn24[5:0]));
dffre #(6) ldgn25_dffre (.clk(clk),.reset(reset),.en(ld_ldgn25 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn25[5:0]));
dffre #(6) ldgn26_dffre (.clk(clk),.reset(reset),.en(ld_ldgn26 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn26[5:0]));
dffre #(6) ldgn27_dffre (.clk(clk),.reset(reset),.en(ld_ldgn27 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn27[5:0]));
dffre #(6) ldgn28_dffre (.clk(clk),.reset(reset),.en(ld_ldgn28 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn28[5:0]));
dffre #(6) ldgn29_dffre (.clk(clk),.reset(reset),.en(ld_ldgn29 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn29[5:0]));
dffre #(6) ldgn30_dffre (.clk(clk),.reset(reset),.en(ld_ldgn30 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn30[5:0]));
dffre #(6) ldgn31_dffre (.clk(clk),.reset(reset),.en(ld_ldgn31 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn31[5:0]));
dffre #(6) ldgn32_dffre (.clk(clk),.reset(reset),.en(ld_ldgn32 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn32[5:0]));
dffre #(6) ldgn33_dffre (.clk(clk),.reset(reset),.en(ld_ldgn33 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn33[5:0]));
dffre #(6) ldgn34_dffre (.clk(clk),.reset(reset),.en(ld_ldgn34 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn34[5:0]));
dffre #(6) ldgn35_dffre (.clk(clk),.reset(reset),.en(ld_ldgn35 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn35[5:0]));
dffre #(6) ldgn36_dffre (.clk(clk),.reset(reset),.en(ld_ldgn36 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn36[5:0]));
dffre #(6) ldgn37_dffre (.clk(clk),.reset(reset),.en(ld_ldgn37 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn37[5:0]));
dffre #(6) ldgn38_dffre (.clk(clk),.reset(reset),.en(ld_ldgn38 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn38[5:0]));
dffre #(6) ldgn39_dffre (.clk(clk),.reset(reset),.en(ld_ldgn39 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn39[5:0]));
dffre #(6) ldgn40_dffre (.clk(clk),.reset(reset),.en(ld_ldgn40 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn40[5:0]));
dffre #(6) ldgn41_dffre (.clk(clk),.reset(reset),.en(ld_ldgn41 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn41[5:0]));
dffre #(6) ldgn42_dffre (.clk(clk),.reset(reset),.en(ld_ldgn42 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn42[5:0]));
dffre #(6) ldgn43_dffre (.clk(clk),.reset(reset),.en(ld_ldgn43 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn43[5:0]));
dffre #(6) ldgn44_dffre (.clk(clk),.reset(reset),.en(ld_ldgn44 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn44[5:0]));
dffre #(6) ldgn45_dffre (.clk(clk),.reset(reset),.en(ld_ldgn45 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn45[5:0]));
dffre #(6) ldgn46_dffre (.clk(clk),.reset(reset),.en(ld_ldgn46 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn46[5:0]));
dffre #(6) ldgn47_dffre (.clk(clk),.reset(reset),.en(ld_ldgn47 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn47[5:0]));
dffre #(6) ldgn48_dffre (.clk(clk),.reset(reset),.en(ld_ldgn48 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn48[5:0]));
dffre #(6) ldgn49_dffre (.clk(clk),.reset(reset),.en(ld_ldgn49 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn49[5:0]));
dffre #(6) ldgn50_dffre (.clk(clk),.reset(reset),.en(ld_ldgn50 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn50[5:0]));
dffre #(6) ldgn51_dffre (.clk(clk),.reset(reset),.en(ld_ldgn51 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn51[5:0]));
dffre #(6) ldgn52_dffre (.clk(clk),.reset(reset),.en(ld_ldgn52 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn52[5:0]));
dffre #(6) ldgn53_dffre (.clk(clk),.reset(reset),.en(ld_ldgn53 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn53[5:0]));
dffre #(6) ldgn54_dffre (.clk(clk),.reset(reset),.en(ld_ldgn54 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn54[5:0]));
dffre #(6) ldgn55_dffre (.clk(clk),.reset(reset),.en(ld_ldgn55 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn55[5:0]));
dffre #(6) ldgn56_dffre (.clk(clk),.reset(reset),.en(ld_ldgn56 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn56[5:0]));
dffre #(6) ldgn57_dffre (.clk(clk),.reset(reset),.en(ld_ldgn57 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn57[5:0]));
dffre #(6) ldgn58_dffre (.clk(clk),.reset(reset),.en(ld_ldgn58 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn58[5:0]));
dffre #(6) ldgn59_dffre (.clk(clk),.reset(reset),.en(ld_ldgn59 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn59[5:0]));
dffre #(6) ldgn60_dffre (.clk(clk),.reset(reset),.en(ld_ldgn60 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn60[5:0]));
dffre #(6) ldgn61_dffre (.clk(clk),.reset(reset),.en(ld_ldgn61 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn61[5:0]));
dffre #(6) ldgn62_dffre (.clk(clk),.reset(reset),.en(ld_ldgn62 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn62[5:0]));
dffre #(6) ldgn63_dffre (.clk(clk),.reset(reset),.en(ld_ldgn63 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn63[5:0]));
dffre #(6) ldgn64_dffre (.clk(clk),.reset(reset),.en(ld_ldgn64 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn64[5:0]));
dffre #(6) ldgn65_dffre (.clk(clk),.reset(reset),.en(ld_ldgn65 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn65[5:0]));
dffre #(6) ldgn66_dffre (.clk(clk),.reset(reset),.en(ld_ldgn66 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn66[5:0]));
dffre #(6) ldgn67_dffre (.clk(clk),.reset(reset),.en(ld_ldgn67 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn67[5:0]));
dffre #(6) ldgn68_dffre (.clk(clk),.reset(reset),.en(ld_ldgn68 & !pio_32b_wr ),.d(wr_data[5:0]),.q(ldgn68[5:0]));

// logical device state vectors	

/* ------------- logical device state vector (RO) ------------- */
/* This file is genetated from ldsv.c */ 
   assign  ldsv0grp0 = memship_group0[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp0 = memship_group0[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp0 = {54'b0,{memship_group0[68:64] & ldfi[68:64]},{memship_group0[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp1 = memship_group1[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp1 = memship_group1[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp1 = {54'b0,{memship_group1[68:64] & ldfi[68:64]},{memship_group1[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp2 = memship_group2[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp2 = memship_group2[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp2 = {54'b0,{memship_group2[68:64] & ldfi[68:64]},{memship_group2[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp3 = memship_group3[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp3 = memship_group3[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp3 = {54'b0,{memship_group3[68:64] & ldfi[68:64]},{memship_group3[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp4 = memship_group4[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp4 = memship_group4[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp4 = {54'b0,{memship_group4[68:64] & ldfi[68:64]},{memship_group4[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp5 = memship_group5[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp5 = memship_group5[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp5 = {54'b0,{memship_group5[68:64] & ldfi[68:64]},{memship_group5[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp6 = memship_group6[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp6 = memship_group6[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp6 = {54'b0,{memship_group6[68:64] & ldfi[68:64]},{memship_group6[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp7 = memship_group7[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp7 = memship_group7[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp7 = {54'b0,{memship_group7[68:64] & ldfi[68:64]},{memship_group7[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp8 = memship_group8[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp8 = memship_group8[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp8 = {54'b0,{memship_group8[68:64] & ldfi[68:64]},{memship_group8[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp9 = memship_group9[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp9 = memship_group9[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp9 = {54'b0,{memship_group9[68:64] & ldfi[68:64]},{memship_group9[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp10 = memship_group10[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp10 = memship_group10[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp10 = {54'b0,{memship_group10[68:64] & ldfi[68:64]},{memship_group10[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp11 = memship_group11[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp11 = memship_group11[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp11 = {54'b0,{memship_group11[68:64] & ldfi[68:64]},{memship_group11[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp12 = memship_group12[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp12 = memship_group12[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp12 = {54'b0,{memship_group12[68:64] & ldfi[68:64]},{memship_group12[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp13 = memship_group13[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp13 = memship_group13[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp13 = {54'b0,{memship_group13[68:64] & ldfi[68:64]},{memship_group13[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp14 = memship_group14[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp14 = memship_group14[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp14 = {54'b0,{memship_group14[68:64] & ldfi[68:64]},{memship_group14[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp15 = memship_group15[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp15 = memship_group15[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp15 = {54'b0,{memship_group15[68:64] & ldfi[68:64]},{memship_group15[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp16 = memship_group16[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp16 = memship_group16[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp16 = {54'b0,{memship_group16[68:64] & ldfi[68:64]},{memship_group16[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp17 = memship_group17[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp17 = memship_group17[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp17 = {54'b0,{memship_group17[68:64] & ldfi[68:64]},{memship_group17[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp18 = memship_group18[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp18 = memship_group18[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp18 = {54'b0,{memship_group18[68:64] & ldfi[68:64]},{memship_group18[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp19 = memship_group19[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp19 = memship_group19[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp19 = {54'b0,{memship_group19[68:64] & ldfi[68:64]},{memship_group19[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp20 = memship_group20[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp20 = memship_group20[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp20 = {54'b0,{memship_group20[68:64] & ldfi[68:64]},{memship_group20[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp21 = memship_group21[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp21 = memship_group21[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp21 = {54'b0,{memship_group21[68:64] & ldfi[68:64]},{memship_group21[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp22 = memship_group22[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp22 = memship_group22[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp22 = {54'b0,{memship_group22[68:64] & ldfi[68:64]},{memship_group22[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp23 = memship_group23[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp23 = memship_group23[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp23 = {54'b0,{memship_group23[68:64] & ldfi[68:64]},{memship_group23[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp24 = memship_group24[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp24 = memship_group24[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp24 = {54'b0,{memship_group24[68:64] & ldfi[68:64]},{memship_group24[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp25 = memship_group25[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp25 = memship_group25[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp25 = {54'b0,{memship_group25[68:64] & ldfi[68:64]},{memship_group25[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp26 = memship_group26[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp26 = memship_group26[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp26 = {54'b0,{memship_group26[68:64] & ldfi[68:64]},{memship_group26[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp27 = memship_group27[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp27 = memship_group27[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp27 = {54'b0,{memship_group27[68:64] & ldfi[68:64]},{memship_group27[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp28 = memship_group28[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp28 = memship_group28[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp28 = {54'b0,{memship_group28[68:64] & ldfi[68:64]},{memship_group28[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp29 = memship_group29[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp29 = memship_group29[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp29 = {54'b0,{memship_group29[68:64] & ldfi[68:64]},{memship_group29[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp30 = memship_group30[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp30 = memship_group30[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp30 = {54'b0,{memship_group30[68:64] & ldfi[68:64]},{memship_group30[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp31 = memship_group31[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp31 = memship_group31[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp31 = {54'b0,{memship_group31[68:64] & ldfi[68:64]},{memship_group31[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp32 = memship_group32[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp32 = memship_group32[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp32 = {54'b0,{memship_group32[68:64] & ldfi[68:64]},{memship_group32[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp33 = memship_group33[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp33 = memship_group33[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp33 = {54'b0,{memship_group33[68:64] & ldfi[68:64]},{memship_group33[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp34 = memship_group34[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp34 = memship_group34[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp34 = {54'b0,{memship_group34[68:64] & ldfi[68:64]},{memship_group34[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp35 = memship_group35[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp35 = memship_group35[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp35 = {54'b0,{memship_group35[68:64] & ldfi[68:64]},{memship_group35[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp36 = memship_group36[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp36 = memship_group36[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp36 = {54'b0,{memship_group36[68:64] & ldfi[68:64]},{memship_group36[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp37 = memship_group37[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp37 = memship_group37[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp37 = {54'b0,{memship_group37[68:64] & ldfi[68:64]},{memship_group37[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp38 = memship_group38[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp38 = memship_group38[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp38 = {54'b0,{memship_group38[68:64] & ldfi[68:64]},{memship_group38[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp39 = memship_group39[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp39 = memship_group39[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp39 = {54'b0,{memship_group39[68:64] & ldfi[68:64]},{memship_group39[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp40 = memship_group40[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp40 = memship_group40[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp40 = {54'b0,{memship_group40[68:64] & ldfi[68:64]},{memship_group40[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp41 = memship_group41[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp41 = memship_group41[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp41 = {54'b0,{memship_group41[68:64] & ldfi[68:64]},{memship_group41[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp42 = memship_group42[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp42 = memship_group42[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp42 = {54'b0,{memship_group42[68:64] & ldfi[68:64]},{memship_group42[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp43 = memship_group43[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp43 = memship_group43[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp43 = {54'b0,{memship_group43[68:64] & ldfi[68:64]},{memship_group43[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp44 = memship_group44[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp44 = memship_group44[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp44 = {54'b0,{memship_group44[68:64] & ldfi[68:64]},{memship_group44[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp45 = memship_group45[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp45 = memship_group45[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp45 = {54'b0,{memship_group45[68:64] & ldfi[68:64]},{memship_group45[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp46 = memship_group46[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp46 = memship_group46[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp46 = {54'b0,{memship_group46[68:64] & ldfi[68:64]},{memship_group46[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp47 = memship_group47[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp47 = memship_group47[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp47 = {54'b0,{memship_group47[68:64] & ldfi[68:64]},{memship_group47[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp48 = memship_group48[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp48 = memship_group48[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp48 = {54'b0,{memship_group48[68:64] & ldfi[68:64]},{memship_group48[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp49 = memship_group49[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp49 = memship_group49[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp49 = {54'b0,{memship_group49[68:64] & ldfi[68:64]},{memship_group49[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp50 = memship_group50[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp50 = memship_group50[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp50 = {54'b0,{memship_group50[68:64] & ldfi[68:64]},{memship_group50[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp51 = memship_group51[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp51 = memship_group51[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp51 = {54'b0,{memship_group51[68:64] & ldfi[68:64]},{memship_group51[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp52 = memship_group52[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp52 = memship_group52[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp52 = {54'b0,{memship_group52[68:64] & ldfi[68:64]},{memship_group52[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp53 = memship_group53[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp53 = memship_group53[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp53 = {54'b0,{memship_group53[68:64] & ldfi[68:64]},{memship_group53[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp54 = memship_group54[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp54 = memship_group54[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp54 = {54'b0,{memship_group54[68:64] & ldfi[68:64]},{memship_group54[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp55 = memship_group55[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp55 = memship_group55[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp55 = {54'b0,{memship_group55[68:64] & ldfi[68:64]},{memship_group55[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp56 = memship_group56[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp56 = memship_group56[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp56 = {54'b0,{memship_group56[68:64] & ldfi[68:64]},{memship_group56[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp57 = memship_group57[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp57 = memship_group57[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp57 = {54'b0,{memship_group57[68:64] & ldfi[68:64]},{memship_group57[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp58 = memship_group58[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp58 = memship_group58[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp58 = {54'b0,{memship_group58[68:64] & ldfi[68:64]},{memship_group58[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp59 = memship_group59[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp59 = memship_group59[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp59 = {54'b0,{memship_group59[68:64] & ldfi[68:64]},{memship_group59[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp60 = memship_group60[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp60 = memship_group60[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp60 = {54'b0,{memship_group60[68:64] & ldfi[68:64]},{memship_group60[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp61 = memship_group61[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp61 = memship_group61[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp61 = {54'b0,{memship_group61[68:64] & ldfi[68:64]},{memship_group61[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp62 = memship_group62[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp62 = memship_group62[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp62 = {54'b0,{memship_group62[68:64] & ldfi[68:64]},{memship_group62[68:64] & ldfj[68:64]}}; 
   assign  ldsv0grp63 = memship_group63[63:0]  &  ldfj[63:0]; 
   assign  ldsv1grp63 = memship_group63[63:0]  &  ldfi[63:0]; 
   assign  ldsv2grp63 = {54'b0,{memship_group63[68:64] & ldfi[68:64]},{memship_group63[68:64] & ldfj[68:64]}}; 
 
// logical device interrupt mask register. 69 count
pio_xREG2 #(2) ldf_mask0_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask0 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask0 [1:0]));
pio_xREG2 #(2) ldf_mask1_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask1 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask1 [1:0]));
pio_xREG2 #(2) ldf_mask2_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask2 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask2 [1:0]));
pio_xREG2 #(2) ldf_mask3_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask3 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask3 [1:0]));
pio_xREG2 #(2) ldf_mask4_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask4 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask4 [1:0]));
pio_xREG2 #(2) ldf_mask5_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask5 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask5 [1:0]));
pio_xREG2 #(2) ldf_mask6_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask6 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask6 [1:0]));
pio_xREG2 #(2) ldf_mask7_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask7 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask7 [1:0]));
pio_xREG2 #(2) ldf_mask8_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask8 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask8 [1:0]));
pio_xREG2 #(2) ldf_mask9_xREG2  (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask9 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask9 [1:0]));
pio_xREG2 #(2) ldf_mask10_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask10 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask10[1:0]));
pio_xREG2 #(2) ldf_mask11_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask11 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask11[1:0]));
pio_xREG2 #(2) ldf_mask12_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask12 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask12[1:0]));
pio_xREG2 #(2) ldf_mask13_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask13 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask13[1:0]));
pio_xREG2 #(2) ldf_mask14_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask14 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask14[1:0]));
pio_xREG2 #(2) ldf_mask15_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask15 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask15[1:0]));
pio_xREG2 #(2) ldf_mask16_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask16 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask16[1:0]));
pio_xREG2 #(2) ldf_mask17_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask17 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask17[1:0]));
pio_xREG2 #(2) ldf_mask18_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask18 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask18[1:0]));
pio_xREG2 #(2) ldf_mask19_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask19 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask19[1:0]));
pio_xREG2 #(2) ldf_mask20_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask20 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask20[1:0]));
pio_xREG2 #(2) ldf_mask21_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask21 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask21[1:0]));
pio_xREG2 #(2) ldf_mask22_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask22 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask22[1:0]));
pio_xREG2 #(2) ldf_mask23_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask23 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask23[1:0]));
pio_xREG2 #(2) ldf_mask24_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask24 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask24[1:0]));
pio_xREG2 #(2) ldf_mask25_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask25 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask25[1:0]));
pio_xREG2 #(2) ldf_mask26_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask26 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask26[1:0]));
pio_xREG2 #(2) ldf_mask27_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask27 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask27[1:0]));
pio_xREG2 #(2) ldf_mask28_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask28 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask28[1:0]));
pio_xREG2 #(2) ldf_mask29_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask29 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask29[1:0]));
pio_xREG2 #(2) ldf_mask30_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask30 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask30[1:0]));
pio_xREG2 #(2) ldf_mask31_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask31 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask31[1:0]));
pio_xREG2 #(2) ldf_mask32_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask32 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask32[1:0]));
pio_xREG2 #(2) ldf_mask33_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask33 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask33[1:0]));
pio_xREG2 #(2) ldf_mask34_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask34 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask34[1:0]));
pio_xREG2 #(2) ldf_mask35_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask35 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask35[1:0]));
pio_xREG2 #(2) ldf_mask36_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask36 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask36[1:0]));
pio_xREG2 #(2) ldf_mask37_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask37 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask37[1:0]));
pio_xREG2 #(2) ldf_mask38_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask38 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask38[1:0]));
pio_xREG2 #(2) ldf_mask39_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask39 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask39[1:0]));
pio_xREG2 #(2) ldf_mask40_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask40 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask40[1:0]));
pio_xREG2 #(2) ldf_mask41_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask41 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask41[1:0]));
pio_xREG2 #(2) ldf_mask42_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask42 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask42[1:0]));
pio_xREG2 #(2) ldf_mask43_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask43 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask43[1:0]));
pio_xREG2 #(2) ldf_mask44_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask44 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask44[1:0]));
pio_xREG2 #(2) ldf_mask45_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask45 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask45[1:0]));
pio_xREG2 #(2) ldf_mask46_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask46 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask46[1:0]));
pio_xREG2 #(2) ldf_mask47_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask47 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask47[1:0]));
pio_xREG2 #(2) ldf_mask48_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask48 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask48[1:0]));
pio_xREG2 #(2) ldf_mask49_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask49 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask49[1:0]));
pio_xREG2 #(2) ldf_mask50_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask50 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask50[1:0]));
pio_xREG2 #(2) ldf_mask51_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask51 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask51[1:0]));
pio_xREG2 #(2) ldf_mask52_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask52 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask52[1:0]));
pio_xREG2 #(2) ldf_mask53_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask53 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask53[1:0]));
pio_xREG2 #(2) ldf_mask54_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask54 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask54[1:0]));
pio_xREG2 #(2) ldf_mask55_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask55 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask55[1:0]));
pio_xREG2 #(2) ldf_mask56_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask56 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask56[1:0]));
pio_xREG2 #(2) ldf_mask57_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask57 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask57[1:0]));
pio_xREG2 #(2) ldf_mask58_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask58 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask58[1:0]));
pio_xREG2 #(2) ldf_mask59_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask59 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask59[1:0]));
pio_xREG2 #(2) ldf_mask60_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask60 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask60[1:0]));
pio_xREG2 #(2) ldf_mask61_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask61 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask61[1:0]));
pio_xREG2 #(2) ldf_mask62_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask62 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask62[1:0]));
pio_xREG2 #(2) ldf_mask63_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask63 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask63[1:0]));
pio_xREG2 #(2) ldf_mask64_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask64 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask64[1:0]));
pio_xREG2 #(2) ldf_mask65_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask65 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask65[1:0]));
pio_xREG2 #(2) ldf_mask66_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask66 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask66[1:0]));
pio_xREG2 #(2) ldf_mask67_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask67 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask67[1:0]));
pio_xREG2 #(2) ldf_mask68_xREG2 (.clk(clk),.reset(reset),.reset_value(2'b11),.load(ld_ldf_mask68 & !pio_32b_wr),.din(wr_data[1:0]),.qout(ldf_mask68[1:0]));
 
   
// logical device group interrupt management. 64 count
rffre arm0_rffre  (.clk(clk),.reset(reset),.rst(rst_at0 ),.en(ld_ldgim0 & !pio_32b_wr),.d(wr_data[31]),.q(arm0 ));
rffre arm1_rffre  (.clk(clk),.reset(reset),.rst(rst_at1 ),.en(ld_ldgim1 & !pio_32b_wr),.d(wr_data[31]),.q(arm1 ));
rffre arm2_rffre  (.clk(clk),.reset(reset),.rst(rst_at2 ),.en(ld_ldgim2 & !pio_32b_wr),.d(wr_data[31]),.q(arm2 ));
rffre arm3_rffre  (.clk(clk),.reset(reset),.rst(rst_at3 ),.en(ld_ldgim3 & !pio_32b_wr),.d(wr_data[31]),.q(arm3 ));
rffre arm4_rffre  (.clk(clk),.reset(reset),.rst(rst_at4 ),.en(ld_ldgim4 & !pio_32b_wr),.d(wr_data[31]),.q(arm4 ));
rffre arm5_rffre  (.clk(clk),.reset(reset),.rst(rst_at5 ),.en(ld_ldgim5 & !pio_32b_wr),.d(wr_data[31]),.q(arm5 ));
rffre arm6_rffre  (.clk(clk),.reset(reset),.rst(rst_at6 ),.en(ld_ldgim6 & !pio_32b_wr),.d(wr_data[31]),.q(arm6 ));
rffre arm7_rffre  (.clk(clk),.reset(reset),.rst(rst_at7 ),.en(ld_ldgim7 & !pio_32b_wr),.d(wr_data[31]),.q(arm7 ));
rffre arm8_rffre  (.clk(clk),.reset(reset),.rst(rst_at8 ),.en(ld_ldgim8 & !pio_32b_wr),.d(wr_data[31]),.q(arm8 ));
rffre arm9_rffre  (.clk(clk),.reset(reset),.rst(rst_at9 ),.en(ld_ldgim9 & !pio_32b_wr),.d(wr_data[31]),.q(arm9 ));
rffre arm10_rffre (.clk(clk),.reset(reset),.rst(rst_at10),.en(ld_ldgim10 & !pio_32b_wr),.d(wr_data[31]),.q(arm10));
rffre arm11_rffre (.clk(clk),.reset(reset),.rst(rst_at11),.en(ld_ldgim11 & !pio_32b_wr),.d(wr_data[31]),.q(arm11));
rffre arm12_rffre (.clk(clk),.reset(reset),.rst(rst_at12),.en(ld_ldgim12 & !pio_32b_wr),.d(wr_data[31]),.q(arm12));
rffre arm13_rffre (.clk(clk),.reset(reset),.rst(rst_at13),.en(ld_ldgim13 & !pio_32b_wr),.d(wr_data[31]),.q(arm13));
rffre arm14_rffre (.clk(clk),.reset(reset),.rst(rst_at14),.en(ld_ldgim14 & !pio_32b_wr),.d(wr_data[31]),.q(arm14));
rffre arm15_rffre (.clk(clk),.reset(reset),.rst(rst_at15),.en(ld_ldgim15 & !pio_32b_wr),.d(wr_data[31]),.q(arm15));
rffre arm16_rffre (.clk(clk),.reset(reset),.rst(rst_at16),.en(ld_ldgim16 & !pio_32b_wr),.d(wr_data[31]),.q(arm16));
rffre arm17_rffre (.clk(clk),.reset(reset),.rst(rst_at17),.en(ld_ldgim17 & !pio_32b_wr),.d(wr_data[31]),.q(arm17));
rffre arm18_rffre (.clk(clk),.reset(reset),.rst(rst_at18),.en(ld_ldgim18 & !pio_32b_wr),.d(wr_data[31]),.q(arm18));
rffre arm19_rffre (.clk(clk),.reset(reset),.rst(rst_at19),.en(ld_ldgim19 & !pio_32b_wr),.d(wr_data[31]),.q(arm19));
rffre arm20_rffre (.clk(clk),.reset(reset),.rst(rst_at20),.en(ld_ldgim20 & !pio_32b_wr),.d(wr_data[31]),.q(arm20));
rffre arm21_rffre (.clk(clk),.reset(reset),.rst(rst_at21),.en(ld_ldgim21 & !pio_32b_wr),.d(wr_data[31]),.q(arm21));
rffre arm22_rffre (.clk(clk),.reset(reset),.rst(rst_at22),.en(ld_ldgim22 & !pio_32b_wr),.d(wr_data[31]),.q(arm22));
rffre arm23_rffre (.clk(clk),.reset(reset),.rst(rst_at23),.en(ld_ldgim23 & !pio_32b_wr),.d(wr_data[31]),.q(arm23));
rffre arm24_rffre (.clk(clk),.reset(reset),.rst(rst_at24),.en(ld_ldgim24 & !pio_32b_wr),.d(wr_data[31]),.q(arm24));
rffre arm25_rffre (.clk(clk),.reset(reset),.rst(rst_at25),.en(ld_ldgim25 & !pio_32b_wr),.d(wr_data[31]),.q(arm25));
rffre arm26_rffre (.clk(clk),.reset(reset),.rst(rst_at26),.en(ld_ldgim26 & !pio_32b_wr),.d(wr_data[31]),.q(arm26));
rffre arm27_rffre (.clk(clk),.reset(reset),.rst(rst_at27),.en(ld_ldgim27 & !pio_32b_wr),.d(wr_data[31]),.q(arm27));
rffre arm28_rffre (.clk(clk),.reset(reset),.rst(rst_at28),.en(ld_ldgim28 & !pio_32b_wr),.d(wr_data[31]),.q(arm28));
rffre arm29_rffre (.clk(clk),.reset(reset),.rst(rst_at29),.en(ld_ldgim29 & !pio_32b_wr),.d(wr_data[31]),.q(arm29));
rffre arm30_rffre (.clk(clk),.reset(reset),.rst(rst_at30),.en(ld_ldgim30 & !pio_32b_wr),.d(wr_data[31]),.q(arm30));
rffre arm31_rffre (.clk(clk),.reset(reset),.rst(rst_at31),.en(ld_ldgim31 & !pio_32b_wr),.d(wr_data[31]),.q(arm31));
rffre arm32_rffre (.clk(clk),.reset(reset),.rst(rst_at32),.en(ld_ldgim32 & !pio_32b_wr),.d(wr_data[31]),.q(arm32));
rffre arm33_rffre (.clk(clk),.reset(reset),.rst(rst_at33),.en(ld_ldgim33 & !pio_32b_wr),.d(wr_data[31]),.q(arm33));
rffre arm34_rffre (.clk(clk),.reset(reset),.rst(rst_at34),.en(ld_ldgim34 & !pio_32b_wr),.d(wr_data[31]),.q(arm34));
rffre arm35_rffre (.clk(clk),.reset(reset),.rst(rst_at35),.en(ld_ldgim35 & !pio_32b_wr),.d(wr_data[31]),.q(arm35));
rffre arm36_rffre (.clk(clk),.reset(reset),.rst(rst_at36),.en(ld_ldgim36 & !pio_32b_wr),.d(wr_data[31]),.q(arm36));
rffre arm37_rffre (.clk(clk),.reset(reset),.rst(rst_at37),.en(ld_ldgim37 & !pio_32b_wr),.d(wr_data[31]),.q(arm37));
rffre arm38_rffre (.clk(clk),.reset(reset),.rst(rst_at38),.en(ld_ldgim38 & !pio_32b_wr),.d(wr_data[31]),.q(arm38));
rffre arm39_rffre (.clk(clk),.reset(reset),.rst(rst_at39),.en(ld_ldgim39 & !pio_32b_wr),.d(wr_data[31]),.q(arm39));
rffre arm40_rffre (.clk(clk),.reset(reset),.rst(rst_at40),.en(ld_ldgim40 & !pio_32b_wr),.d(wr_data[31]),.q(arm40));
rffre arm41_rffre (.clk(clk),.reset(reset),.rst(rst_at41),.en(ld_ldgim41 & !pio_32b_wr),.d(wr_data[31]),.q(arm41));
rffre arm42_rffre (.clk(clk),.reset(reset),.rst(rst_at42),.en(ld_ldgim42 & !pio_32b_wr),.d(wr_data[31]),.q(arm42));
rffre arm43_rffre (.clk(clk),.reset(reset),.rst(rst_at43),.en(ld_ldgim43 & !pio_32b_wr),.d(wr_data[31]),.q(arm43));
rffre arm44_rffre (.clk(clk),.reset(reset),.rst(rst_at44),.en(ld_ldgim44 & !pio_32b_wr),.d(wr_data[31]),.q(arm44));
rffre arm45_rffre (.clk(clk),.reset(reset),.rst(rst_at45),.en(ld_ldgim45 & !pio_32b_wr),.d(wr_data[31]),.q(arm45));
rffre arm46_rffre (.clk(clk),.reset(reset),.rst(rst_at46),.en(ld_ldgim46 & !pio_32b_wr),.d(wr_data[31]),.q(arm46));
rffre arm47_rffre (.clk(clk),.reset(reset),.rst(rst_at47),.en(ld_ldgim47 & !pio_32b_wr),.d(wr_data[31]),.q(arm47));
rffre arm48_rffre (.clk(clk),.reset(reset),.rst(rst_at48),.en(ld_ldgim48 & !pio_32b_wr),.d(wr_data[31]),.q(arm48));
rffre arm49_rffre (.clk(clk),.reset(reset),.rst(rst_at49),.en(ld_ldgim49 & !pio_32b_wr),.d(wr_data[31]),.q(arm49));
rffre arm50_rffre (.clk(clk),.reset(reset),.rst(rst_at50),.en(ld_ldgim50 & !pio_32b_wr),.d(wr_data[31]),.q(arm50));
rffre arm51_rffre (.clk(clk),.reset(reset),.rst(rst_at51),.en(ld_ldgim51 & !pio_32b_wr),.d(wr_data[31]),.q(arm51));
rffre arm52_rffre (.clk(clk),.reset(reset),.rst(rst_at52),.en(ld_ldgim52 & !pio_32b_wr),.d(wr_data[31]),.q(arm52));
rffre arm53_rffre (.clk(clk),.reset(reset),.rst(rst_at53),.en(ld_ldgim53 & !pio_32b_wr),.d(wr_data[31]),.q(arm53));
rffre arm54_rffre (.clk(clk),.reset(reset),.rst(rst_at54),.en(ld_ldgim54 & !pio_32b_wr),.d(wr_data[31]),.q(arm54));
rffre arm55_rffre (.clk(clk),.reset(reset),.rst(rst_at55),.en(ld_ldgim55 & !pio_32b_wr),.d(wr_data[31]),.q(arm55));
rffre arm56_rffre (.clk(clk),.reset(reset),.rst(rst_at56),.en(ld_ldgim56 & !pio_32b_wr),.d(wr_data[31]),.q(arm56));
rffre arm57_rffre (.clk(clk),.reset(reset),.rst(rst_at57),.en(ld_ldgim57 & !pio_32b_wr),.d(wr_data[31]),.q(arm57));
rffre arm58_rffre (.clk(clk),.reset(reset),.rst(rst_at58),.en(ld_ldgim58 & !pio_32b_wr),.d(wr_data[31]),.q(arm58));
rffre arm59_rffre (.clk(clk),.reset(reset),.rst(rst_at59),.en(ld_ldgim59 & !pio_32b_wr),.d(wr_data[31]),.q(arm59));
rffre arm60_rffre (.clk(clk),.reset(reset),.rst(rst_at60),.en(ld_ldgim60 & !pio_32b_wr),.d(wr_data[31]),.q(arm60));
rffre arm61_rffre (.clk(clk),.reset(reset),.rst(rst_at61),.en(ld_ldgim61 & !pio_32b_wr),.d(wr_data[31]),.q(arm61));
rffre arm62_rffre (.clk(clk),.reset(reset),.rst(rst_at62),.en(ld_ldgim62 & !pio_32b_wr),.d(wr_data[31]),.q(arm62));
rffre arm63_rffre (.clk(clk),.reset(reset),.rst(rst_at63),.en(ld_ldgim63 & !pio_32b_wr),.d(wr_data[31]),.q(arm63));	

timer_6bit timer0_6bit  (.clk(clk),.reset(reset),.rst(rst_at0 ),.dec(dec_timer),.en(ld_ldgim0 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer0 [5:0]));
timer_6bit timer1_6bit  (.clk(clk),.reset(reset),.rst(rst_at1 ),.dec(dec_timer),.en(ld_ldgim1 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer1 [5:0]));
timer_6bit timer2_6bit  (.clk(clk),.reset(reset),.rst(rst_at2 ),.dec(dec_timer),.en(ld_ldgim2 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer2 [5:0]));
timer_6bit timer3_6bit  (.clk(clk),.reset(reset),.rst(rst_at3 ),.dec(dec_timer),.en(ld_ldgim3 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer3 [5:0]));
timer_6bit timer4_6bit  (.clk(clk),.reset(reset),.rst(rst_at4 ),.dec(dec_timer),.en(ld_ldgim4 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer4 [5:0]));
timer_6bit timer5_6bit  (.clk(clk),.reset(reset),.rst(rst_at5 ),.dec(dec_timer),.en(ld_ldgim5 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer5 [5:0]));
timer_6bit timer6_6bit  (.clk(clk),.reset(reset),.rst(rst_at6 ),.dec(dec_timer),.en(ld_ldgim6 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer6 [5:0]));
timer_6bit timer7_6bit  (.clk(clk),.reset(reset),.rst(rst_at7 ),.dec(dec_timer),.en(ld_ldgim7 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer7 [5:0]));
timer_6bit timer8_6bit  (.clk(clk),.reset(reset),.rst(rst_at8 ),.dec(dec_timer),.en(ld_ldgim8 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer8 [5:0]));
timer_6bit timer9_6bit  (.clk(clk),.reset(reset),.rst(rst_at9 ),.dec(dec_timer),.en(ld_ldgim9 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer9 [5:0]));
timer_6bit timer10_6bit (.clk(clk),.reset(reset),.rst(rst_at10),.dec(dec_timer),.en(ld_ldgim10 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer10[5:0]));
timer_6bit timer11_6bit (.clk(clk),.reset(reset),.rst(rst_at11),.dec(dec_timer),.en(ld_ldgim11 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer11[5:0]));
timer_6bit timer12_6bit (.clk(clk),.reset(reset),.rst(rst_at12),.dec(dec_timer),.en(ld_ldgim12 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer12[5:0]));
timer_6bit timer13_6bit (.clk(clk),.reset(reset),.rst(rst_at13),.dec(dec_timer),.en(ld_ldgim13 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer13[5:0]));
timer_6bit timer14_6bit (.clk(clk),.reset(reset),.rst(rst_at14),.dec(dec_timer),.en(ld_ldgim14 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer14[5:0]));
timer_6bit timer15_6bit (.clk(clk),.reset(reset),.rst(rst_at15),.dec(dec_timer),.en(ld_ldgim15 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer15[5:0]));
timer_6bit timer16_6bit (.clk(clk),.reset(reset),.rst(rst_at16),.dec(dec_timer),.en(ld_ldgim16 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer16[5:0]));
timer_6bit timer17_6bit (.clk(clk),.reset(reset),.rst(rst_at17),.dec(dec_timer),.en(ld_ldgim17 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer17[5:0]));
timer_6bit timer18_6bit (.clk(clk),.reset(reset),.rst(rst_at18),.dec(dec_timer),.en(ld_ldgim18 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer18[5:0]));
timer_6bit timer19_6bit (.clk(clk),.reset(reset),.rst(rst_at19),.dec(dec_timer),.en(ld_ldgim19 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer19[5:0]));
timer_6bit timer20_6bit (.clk(clk),.reset(reset),.rst(rst_at20),.dec(dec_timer),.en(ld_ldgim20 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer20[5:0]));
timer_6bit timer21_6bit (.clk(clk),.reset(reset),.rst(rst_at21),.dec(dec_timer),.en(ld_ldgim21 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer21[5:0]));
timer_6bit timer22_6bit (.clk(clk),.reset(reset),.rst(rst_at22),.dec(dec_timer),.en(ld_ldgim22 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer22[5:0]));
timer_6bit timer23_6bit (.clk(clk),.reset(reset),.rst(rst_at23),.dec(dec_timer),.en(ld_ldgim23 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer23[5:0]));
timer_6bit timer24_6bit (.clk(clk),.reset(reset),.rst(rst_at24),.dec(dec_timer),.en(ld_ldgim24 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer24[5:0]));
timer_6bit timer25_6bit (.clk(clk),.reset(reset),.rst(rst_at25),.dec(dec_timer),.en(ld_ldgim25 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer25[5:0]));
timer_6bit timer26_6bit (.clk(clk),.reset(reset),.rst(rst_at26),.dec(dec_timer),.en(ld_ldgim26 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer26[5:0]));
timer_6bit timer27_6bit (.clk(clk),.reset(reset),.rst(rst_at27),.dec(dec_timer),.en(ld_ldgim27 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer27[5:0]));
timer_6bit timer28_6bit (.clk(clk),.reset(reset),.rst(rst_at28),.dec(dec_timer),.en(ld_ldgim28 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer28[5:0]));
timer_6bit timer29_6bit (.clk(clk),.reset(reset),.rst(rst_at29),.dec(dec_timer),.en(ld_ldgim29 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer29[5:0]));
timer_6bit timer30_6bit (.clk(clk),.reset(reset),.rst(rst_at30),.dec(dec_timer),.en(ld_ldgim30 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer30[5:0]));
timer_6bit timer31_6bit (.clk(clk),.reset(reset),.rst(rst_at31),.dec(dec_timer),.en(ld_ldgim31 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer31[5:0]));
timer_6bit timer32_6bit (.clk(clk),.reset(reset),.rst(rst_at32),.dec(dec_timer),.en(ld_ldgim32 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer32[5:0]));
timer_6bit timer33_6bit (.clk(clk),.reset(reset),.rst(rst_at33),.dec(dec_timer),.en(ld_ldgim33 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer33[5:0]));
timer_6bit timer34_6bit (.clk(clk),.reset(reset),.rst(rst_at34),.dec(dec_timer),.en(ld_ldgim34 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer34[5:0]));
timer_6bit timer35_6bit (.clk(clk),.reset(reset),.rst(rst_at35),.dec(dec_timer),.en(ld_ldgim35 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer35[5:0]));
timer_6bit timer36_6bit (.clk(clk),.reset(reset),.rst(rst_at36),.dec(dec_timer),.en(ld_ldgim36 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer36[5:0]));
timer_6bit timer37_6bit (.clk(clk),.reset(reset),.rst(rst_at37),.dec(dec_timer),.en(ld_ldgim37 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer37[5:0]));
timer_6bit timer38_6bit (.clk(clk),.reset(reset),.rst(rst_at38),.dec(dec_timer),.en(ld_ldgim38 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer38[5:0]));
timer_6bit timer39_6bit (.clk(clk),.reset(reset),.rst(rst_at39),.dec(dec_timer),.en(ld_ldgim39 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer39[5:0]));
timer_6bit timer40_6bit (.clk(clk),.reset(reset),.rst(rst_at40),.dec(dec_timer),.en(ld_ldgim40 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer40[5:0]));
timer_6bit timer41_6bit (.clk(clk),.reset(reset),.rst(rst_at41),.dec(dec_timer),.en(ld_ldgim41 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer41[5:0]));
timer_6bit timer42_6bit (.clk(clk),.reset(reset),.rst(rst_at42),.dec(dec_timer),.en(ld_ldgim42 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer42[5:0]));
timer_6bit timer43_6bit (.clk(clk),.reset(reset),.rst(rst_at43),.dec(dec_timer),.en(ld_ldgim43 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer43[5:0]));
timer_6bit timer44_6bit (.clk(clk),.reset(reset),.rst(rst_at44),.dec(dec_timer),.en(ld_ldgim44 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer44[5:0]));
timer_6bit timer45_6bit (.clk(clk),.reset(reset),.rst(rst_at45),.dec(dec_timer),.en(ld_ldgim45 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer45[5:0]));
timer_6bit timer46_6bit (.clk(clk),.reset(reset),.rst(rst_at46),.dec(dec_timer),.en(ld_ldgim46 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer46[5:0]));
timer_6bit timer47_6bit (.clk(clk),.reset(reset),.rst(rst_at47),.dec(dec_timer),.en(ld_ldgim47 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer47[5:0]));
timer_6bit timer48_6bit (.clk(clk),.reset(reset),.rst(rst_at48),.dec(dec_timer),.en(ld_ldgim48 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer48[5:0]));
timer_6bit timer49_6bit (.clk(clk),.reset(reset),.rst(rst_at49),.dec(dec_timer),.en(ld_ldgim49 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer49[5:0]));
timer_6bit timer50_6bit (.clk(clk),.reset(reset),.rst(rst_at50),.dec(dec_timer),.en(ld_ldgim50 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer50[5:0]));
timer_6bit timer51_6bit (.clk(clk),.reset(reset),.rst(rst_at51),.dec(dec_timer),.en(ld_ldgim51 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer51[5:0]));
timer_6bit timer52_6bit (.clk(clk),.reset(reset),.rst(rst_at52),.dec(dec_timer),.en(ld_ldgim52 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer52[5:0]));
timer_6bit timer53_6bit (.clk(clk),.reset(reset),.rst(rst_at53),.dec(dec_timer),.en(ld_ldgim53 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer53[5:0]));
timer_6bit timer54_6bit (.clk(clk),.reset(reset),.rst(rst_at54),.dec(dec_timer),.en(ld_ldgim54 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer54[5:0]));
timer_6bit timer55_6bit (.clk(clk),.reset(reset),.rst(rst_at55),.dec(dec_timer),.en(ld_ldgim55 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer55[5:0]));
timer_6bit timer56_6bit (.clk(clk),.reset(reset),.rst(rst_at56),.dec(dec_timer),.en(ld_ldgim56 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer56[5:0]));
timer_6bit timer57_6bit (.clk(clk),.reset(reset),.rst(rst_at57),.dec(dec_timer),.en(ld_ldgim57 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer57[5:0]));
timer_6bit timer58_6bit (.clk(clk),.reset(reset),.rst(rst_at58),.dec(dec_timer),.en(ld_ldgim58 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer58[5:0]));
timer_6bit timer59_6bit (.clk(clk),.reset(reset),.rst(rst_at59),.dec(dec_timer),.en(ld_ldgim59 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer59[5:0]));
timer_6bit timer60_6bit (.clk(clk),.reset(reset),.rst(rst_at60),.dec(dec_timer),.en(ld_ldgim60 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer60[5:0]));
timer_6bit timer61_6bit (.clk(clk),.reset(reset),.rst(rst_at61),.dec(dec_timer),.en(ld_ldgim61 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer61[5:0]));
timer_6bit timer62_6bit (.clk(clk),.reset(reset),.rst(rst_at62),.dec(dec_timer),.en(ld_ldgim62 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer62[5:0]));
timer_6bit timer63_6bit (.clk(clk),.reset(reset),.rst(rst_at63),.dec(dec_timer),.en(ld_ldgim63 & !pio_32b_wr),.d(wr_data[5:0]),.q(timer63[5:0]));	
// timer resolution value
rtimer_20bit  rtimer_20bit(.clk(clk),.reset(reset),.dec_timer(dec_timer),.en(ld_rtimer & !pio_32b_wr),.d(wr_data[19:0]),.q(rtimer[19:0]));

// system interrupt data. count 64
dffre #(7) sid0_dffre  (.clk(clk),.reset(reset),.en(ld_sid0 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid0 [6:0]));
dffre #(7) sid1_dffre  (.clk(clk),.reset(reset),.en(ld_sid1 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid1 [6:0]));
dffre #(7) sid2_dffre  (.clk(clk),.reset(reset),.en(ld_sid2 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid2 [6:0]));
dffre #(7) sid3_dffre  (.clk(clk),.reset(reset),.en(ld_sid3 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid3 [6:0]));
dffre #(7) sid4_dffre  (.clk(clk),.reset(reset),.en(ld_sid4 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid4 [6:0]));
dffre #(7) sid5_dffre  (.clk(clk),.reset(reset),.en(ld_sid5 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid5 [6:0]));
dffre #(7) sid6_dffre  (.clk(clk),.reset(reset),.en(ld_sid6 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid6 [6:0]));
dffre #(7) sid7_dffre  (.clk(clk),.reset(reset),.en(ld_sid7 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid7 [6:0]));
dffre #(7) sid8_dffre  (.clk(clk),.reset(reset),.en(ld_sid8 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid8 [6:0]));
dffre #(7) sid9_dffre  (.clk(clk),.reset(reset),.en(ld_sid9 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid9 [6:0]));
dffre #(7) sid10_dffre (.clk(clk),.reset(reset),.en(ld_sid10 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid10[6:0]));
dffre #(7) sid11_dffre (.clk(clk),.reset(reset),.en(ld_sid11 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid11[6:0]));
dffre #(7) sid12_dffre (.clk(clk),.reset(reset),.en(ld_sid12 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid12[6:0]));
dffre #(7) sid13_dffre (.clk(clk),.reset(reset),.en(ld_sid13 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid13[6:0]));
dffre #(7) sid14_dffre (.clk(clk),.reset(reset),.en(ld_sid14 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid14[6:0]));
dffre #(7) sid15_dffre (.clk(clk),.reset(reset),.en(ld_sid15 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid15[6:0]));
dffre #(7) sid16_dffre (.clk(clk),.reset(reset),.en(ld_sid16 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid16[6:0]));
dffre #(7) sid17_dffre (.clk(clk),.reset(reset),.en(ld_sid17 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid17[6:0]));
dffre #(7) sid18_dffre (.clk(clk),.reset(reset),.en(ld_sid18 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid18[6:0]));
dffre #(7) sid19_dffre (.clk(clk),.reset(reset),.en(ld_sid19 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid19[6:0]));
dffre #(7) sid20_dffre (.clk(clk),.reset(reset),.en(ld_sid20 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid20[6:0]));
dffre #(7) sid21_dffre (.clk(clk),.reset(reset),.en(ld_sid21 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid21[6:0]));
dffre #(7) sid22_dffre (.clk(clk),.reset(reset),.en(ld_sid22 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid22[6:0]));
dffre #(7) sid23_dffre (.clk(clk),.reset(reset),.en(ld_sid23 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid23[6:0]));
dffre #(7) sid24_dffre (.clk(clk),.reset(reset),.en(ld_sid24 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid24[6:0]));
dffre #(7) sid25_dffre (.clk(clk),.reset(reset),.en(ld_sid25 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid25[6:0]));
dffre #(7) sid26_dffre (.clk(clk),.reset(reset),.en(ld_sid26 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid26[6:0]));
dffre #(7) sid27_dffre (.clk(clk),.reset(reset),.en(ld_sid27 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid27[6:0]));
dffre #(7) sid28_dffre (.clk(clk),.reset(reset),.en(ld_sid28 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid28[6:0]));
dffre #(7) sid29_dffre (.clk(clk),.reset(reset),.en(ld_sid29 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid29[6:0]));
dffre #(7) sid30_dffre (.clk(clk),.reset(reset),.en(ld_sid30 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid30[6:0]));
dffre #(7) sid31_dffre (.clk(clk),.reset(reset),.en(ld_sid31 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid31[6:0]));
dffre #(7) sid32_dffre (.clk(clk),.reset(reset),.en(ld_sid32 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid32[6:0]));
dffre #(7) sid33_dffre (.clk(clk),.reset(reset),.en(ld_sid33 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid33[6:0]));
dffre #(7) sid34_dffre (.clk(clk),.reset(reset),.en(ld_sid34 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid34[6:0]));
dffre #(7) sid35_dffre (.clk(clk),.reset(reset),.en(ld_sid35 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid35[6:0]));
dffre #(7) sid36_dffre (.clk(clk),.reset(reset),.en(ld_sid36 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid36[6:0]));
dffre #(7) sid37_dffre (.clk(clk),.reset(reset),.en(ld_sid37 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid37[6:0]));
dffre #(7) sid38_dffre (.clk(clk),.reset(reset),.en(ld_sid38 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid38[6:0]));
dffre #(7) sid39_dffre (.clk(clk),.reset(reset),.en(ld_sid39 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid39[6:0]));
dffre #(7) sid40_dffre (.clk(clk),.reset(reset),.en(ld_sid40 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid40[6:0]));
dffre #(7) sid41_dffre (.clk(clk),.reset(reset),.en(ld_sid41 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid41[6:0]));
dffre #(7) sid42_dffre (.clk(clk),.reset(reset),.en(ld_sid42 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid42[6:0]));
dffre #(7) sid43_dffre (.clk(clk),.reset(reset),.en(ld_sid43 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid43[6:0]));
dffre #(7) sid44_dffre (.clk(clk),.reset(reset),.en(ld_sid44 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid44[6:0]));
dffre #(7) sid45_dffre (.clk(clk),.reset(reset),.en(ld_sid45 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid45[6:0]));
dffre #(7) sid46_dffre (.clk(clk),.reset(reset),.en(ld_sid46 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid46[6:0]));
dffre #(7) sid47_dffre (.clk(clk),.reset(reset),.en(ld_sid47 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid47[6:0]));
dffre #(7) sid48_dffre (.clk(clk),.reset(reset),.en(ld_sid48 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid48[6:0]));
dffre #(7) sid49_dffre (.clk(clk),.reset(reset),.en(ld_sid49 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid49[6:0]));
dffre #(7) sid50_dffre (.clk(clk),.reset(reset),.en(ld_sid50 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid50[6:0]));
dffre #(7) sid51_dffre (.clk(clk),.reset(reset),.en(ld_sid51 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid51[6:0]));
dffre #(7) sid52_dffre (.clk(clk),.reset(reset),.en(ld_sid52 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid52[6:0]));
dffre #(7) sid53_dffre (.clk(clk),.reset(reset),.en(ld_sid53 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid53[6:0]));
dffre #(7) sid54_dffre (.clk(clk),.reset(reset),.en(ld_sid54 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid54[6:0]));
dffre #(7) sid55_dffre (.clk(clk),.reset(reset),.en(ld_sid55 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid55[6:0]));
dffre #(7) sid56_dffre (.clk(clk),.reset(reset),.en(ld_sid56 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid56[6:0]));
dffre #(7) sid57_dffre (.clk(clk),.reset(reset),.en(ld_sid57 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid57[6:0]));
dffre #(7) sid58_dffre (.clk(clk),.reset(reset),.en(ld_sid58 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid58[6:0]));
dffre #(7) sid59_dffre (.clk(clk),.reset(reset),.en(ld_sid59 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid59[6:0]));
dffre #(7) sid60_dffre (.clk(clk),.reset(reset),.en(ld_sid60 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid60[6:0]));
dffre #(7) sid61_dffre (.clk(clk),.reset(reset),.en(ld_sid61 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid61[6:0]));
dffre #(7) sid62_dffre (.clk(clk),.reset(reset),.en(ld_sid62 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid62[6:0]));
dffre #(7) sid63_dffre (.clk(clk),.reset(reset),.en(ld_sid63 & !pio_32b_wr),.d(wr_data[6:0]),.q(sid63[6:0]));
// sid selection

always @ (/*AUTOSENSE*/group or sid0 or sid1 or sid10 or sid11
	  or sid12 or sid13 or sid14 or sid15 or sid16 or sid17
	  or sid18 or sid19 or sid2 or sid20 or sid21 or sid22
	  or sid23 or sid24 or sid25 or sid26 or sid27 or sid28
	  or sid29 or sid3 or sid30 or sid31 or sid32 or sid33
	  or sid34 or sid35 or sid36 or sid37 or sid38 or sid39
	  or sid4 or sid40 or sid41 or sid42 or sid43 or sid44
	  or sid45 or sid46 or sid47 or sid48 or sid49 or sid5
	  or sid50 or sid51 or sid52 or sid53 or sid54 or sid55
	  or sid56 or sid57 or sid58 or sid59 or sid6 or sid60
	  or sid61 or sid62 or sid63 or sid7 or sid8 or sid9)
  begin
              msi_data = sid0 [6:0];
     case(group[5:0])
       6'd0 : msi_data = sid0 [6:0];
       6'd1 : msi_data = sid1 [6:0];
       6'd2 : msi_data = sid2 [6:0];
       6'd3 : msi_data = sid3 [6:0];
       6'd4 : msi_data = sid4 [6:0];
       6'd5 : msi_data = sid5 [6:0];
       6'd6 : msi_data = sid6 [6:0];
       6'd7 : msi_data = sid7 [6:0];
       6'd8 : msi_data = sid8 [6:0];
       6'd9 : msi_data = sid9 [6:0];
       6'd10: msi_data = sid10[6:0];
       6'd11: msi_data = sid11[6:0];
       6'd12: msi_data = sid12[6:0];
       6'd13: msi_data = sid13[6:0];
       6'd14: msi_data = sid14[6:0];
       6'd15: msi_data = sid15[6:0];
       6'd16: msi_data = sid16[6:0];
       6'd17: msi_data = sid17[6:0];
       6'd18: msi_data = sid18[6:0];
       6'd19: msi_data = sid19[6:0];
       6'd20: msi_data = sid20[6:0];
       6'd21: msi_data = sid21[6:0];
       6'd22: msi_data = sid22[6:0];
       6'd23: msi_data = sid23[6:0];
       6'd24: msi_data = sid24[6:0];
       6'd25: msi_data = sid25[6:0];
       6'd26: msi_data = sid26[6:0];
       6'd27: msi_data = sid27[6:0];
       6'd28: msi_data = sid28[6:0];
       6'd29: msi_data = sid29[6:0];
       6'd30: msi_data = sid30[6:0];
       6'd31: msi_data = sid31[6:0];
       6'd32: msi_data = sid32[6:0];
       6'd33: msi_data = sid33[6:0];
       6'd34: msi_data = sid34[6:0];
       6'd35: msi_data = sid35[6:0];
       6'd36: msi_data = sid36[6:0];
       6'd37: msi_data = sid37[6:0];
       6'd38: msi_data = sid38[6:0];
       6'd39: msi_data = sid39[6:0];
       6'd40: msi_data = sid40[6:0];
       6'd41: msi_data = sid41[6:0];
       6'd42: msi_data = sid42[6:0];
       6'd43: msi_data = sid43[6:0];
       6'd44: msi_data = sid44[6:0];
       6'd45: msi_data = sid45[6:0];
       6'd46: msi_data = sid46[6:0];
       6'd47: msi_data = sid47[6:0];
       6'd48: msi_data = sid48[6:0];
       6'd49: msi_data = sid49[6:0];
       6'd50: msi_data = sid50[6:0];
       6'd51: msi_data = sid51[6:0];
       6'd52: msi_data = sid52[6:0];
       6'd53: msi_data = sid53[6:0];
       6'd54: msi_data = sid54[6:0];
       6'd55: msi_data = sid55[6:0];
       6'd56: msi_data = sid56[6:0];
       6'd57: msi_data = sid57[6:0];
       6'd58: msi_data = sid58[6:0];
       6'd59: msi_data = sid59[6:0];
       6'd60: msi_data = sid60[6:0];
       6'd61: msi_data = sid61[6:0];
       6'd62: msi_data = sid62[6:0];
       6'd63: msi_data = sid63[6:0];
     endcase		  
  end

// arm timer reset generation

   assign    rst_at0  = rst_at & (group[5:0] == 6'd0 );
   assign    rst_at1  = rst_at & (group[5:0] == 6'd1 );
   assign    rst_at2  = rst_at & (group[5:0] == 6'd2 );
   assign    rst_at3  = rst_at & (group[5:0] == 6'd3 );
   assign    rst_at4  = rst_at & (group[5:0] == 6'd4 );
   assign    rst_at5  = rst_at & (group[5:0] == 6'd5 );
   assign    rst_at6  = rst_at & (group[5:0] == 6'd6 );
   assign    rst_at7  = rst_at & (group[5:0] == 6'd7 );
   assign    rst_at8  = rst_at & (group[5:0] == 6'd8 );
   assign    rst_at9  = rst_at & (group[5:0] == 6'd9 );
   assign    rst_at10 = rst_at & (group[5:0] == 6'd10);
   assign    rst_at11 = rst_at & (group[5:0] == 6'd11);
   assign    rst_at12 = rst_at & (group[5:0] == 6'd12);
   assign    rst_at13 = rst_at & (group[5:0] == 6'd13);
   assign    rst_at14 = rst_at & (group[5:0] == 6'd14);
   assign    rst_at15 = rst_at & (group[5:0] == 6'd15);
   assign    rst_at16 = rst_at & (group[5:0] == 6'd16);
   assign    rst_at17 = rst_at & (group[5:0] == 6'd17);
   assign    rst_at18 = rst_at & (group[5:0] == 6'd18);
   assign    rst_at19 = rst_at & (group[5:0] == 6'd19);
   assign    rst_at20 = rst_at & (group[5:0] == 6'd20);
   assign    rst_at21 = rst_at & (group[5:0] == 6'd21);
   assign    rst_at22 = rst_at & (group[5:0] == 6'd22);
   assign    rst_at23 = rst_at & (group[5:0] == 6'd23);
   assign    rst_at24 = rst_at & (group[5:0] == 6'd24);
   assign    rst_at25 = rst_at & (group[5:0] == 6'd25);
   assign    rst_at26 = rst_at & (group[5:0] == 6'd26);
   assign    rst_at27 = rst_at & (group[5:0] == 6'd27);
   assign    rst_at28 = rst_at & (group[5:0] == 6'd28);
   assign    rst_at29 = rst_at & (group[5:0] == 6'd29);
   assign    rst_at30 = rst_at & (group[5:0] == 6'd30);
   assign    rst_at31 = rst_at & (group[5:0] == 6'd31);
   assign    rst_at32 = rst_at & (group[5:0] == 6'd32);
   assign    rst_at33 = rst_at & (group[5:0] == 6'd33);
   assign    rst_at34 = rst_at & (group[5:0] == 6'd34);
   assign    rst_at35 = rst_at & (group[5:0] == 6'd35);
   assign    rst_at36 = rst_at & (group[5:0] == 6'd36);
   assign    rst_at37 = rst_at & (group[5:0] == 6'd37);
   assign    rst_at38 = rst_at & (group[5:0] == 6'd38);
   assign    rst_at39 = rst_at & (group[5:0] == 6'd39);
   assign    rst_at40 = rst_at & (group[5:0] == 6'd40);
   assign    rst_at41 = rst_at & (group[5:0] == 6'd41);
   assign    rst_at42 = rst_at & (group[5:0] == 6'd42);
   assign    rst_at43 = rst_at & (group[5:0] == 6'd43);
   assign    rst_at44 = rst_at & (group[5:0] == 6'd44);
   assign    rst_at45 = rst_at & (group[5:0] == 6'd45);
   assign    rst_at46 = rst_at & (group[5:0] == 6'd46);
   assign    rst_at47 = rst_at & (group[5:0] == 6'd47);
   assign    rst_at48 = rst_at & (group[5:0] == 6'd48);
   assign    rst_at49 = rst_at & (group[5:0] == 6'd49);
   assign    rst_at50 = rst_at & (group[5:0] == 6'd50);
   assign    rst_at51 = rst_at & (group[5:0] == 6'd51);
   assign    rst_at52 = rst_at & (group[5:0] == 6'd52);
   assign    rst_at53 = rst_at & (group[5:0] == 6'd53);
   assign    rst_at54 = rst_at & (group[5:0] == 6'd54);
   assign    rst_at55 = rst_at & (group[5:0] == 6'd55);
   assign    rst_at56 = rst_at & (group[5:0] == 6'd56);
   assign    rst_at57 = rst_at & (group[5:0] == 6'd57);
   assign    rst_at58 = rst_at & (group[5:0] == 6'd58);
   assign    rst_at59 = rst_at & (group[5:0] == 6'd59);
   assign    rst_at60 = rst_at & (group[5:0] == 6'd60);
   assign    rst_at61 = rst_at & (group[5:0] == 6'd61);
   assign    rst_at62 = rst_at & (group[5:0] == 6'd62);
   assign    rst_at63 = rst_at & (group[5:0] == 6'd63);


niu_pio_slv_decoder niu_pio_slv_decoder
(/*AUTOINST*/
 // Outputs
  .slv_ack				(slv_ack),
  .slv_rdata				(slv_rdata[63:0]),
  .slv_err				(slv_err),
  .ras_dev_func_share			(ras_dev_func_share),
  .ld_dev_func_share			(ld_dev_func_share),
  .rd_dev_func_share			(rd_dev_func_share),
 // Inputs
  .clk					(clk),
  .reset				(reset),
  .slv_sel_reg				(slv_sel_reg),
  .addr					(addr[18:0]),
  .rd					(rd),
  .dev_func_share			(dev_func_share[63:0]));

niu_pio_fzc_slv_decoder niu_pio_fzc_slv_decoder
(/*AUTOINST*/
 // Outputs
 .fzc_slv_ack				(fzc_slv_ack),
 .fzc_slv_rdata				(fzc_slv_rdata[63:0]),
 .fzc_slv_err				(fzc_slv_err),
 .ld_config1				(ld_config1),
 .ld_sys_err_mask			(ld_sys_err_mask),
 .ld_sys_err_stat			(ld_sys_err_stat),
 .ld_rst_ctl				(ld_rst_ctl),
 .ld_rtimer				(ld_rtimer),
 .ld_dma_bind0				(ld_dma_bind0),
 .ld_dma_bind1				(ld_dma_bind1),
 .ld_dma_bind2				(ld_dma_bind2),
 .ld_dma_bind3				(ld_dma_bind3),
 .ld_dma_bind4				(ld_dma_bind4),
 .ld_dma_bind5				(ld_dma_bind5),
 .ld_dma_bind6				(ld_dma_bind6),
 .ld_dma_bind7				(ld_dma_bind7),
 .ld_dma_bind8				(ld_dma_bind8),
 .ld_dma_bind9				(ld_dma_bind9),
 .ld_dma_bind10				(ld_dma_bind10),
 .ld_dma_bind11				(ld_dma_bind11),
 .ld_dma_bind12				(ld_dma_bind12),
 .ld_dma_bind13				(ld_dma_bind13),
 .ld_dma_bind14				(ld_dma_bind14),
 .ld_dma_bind15				(ld_dma_bind15),
 .ld_dma_bind16				(ld_dma_bind16),
 .ld_dma_bind17				(ld_dma_bind17),
 .ld_dma_bind18				(ld_dma_bind18),
 .ld_dma_bind19				(ld_dma_bind19),
 .ld_dma_bind20				(ld_dma_bind20),
 .ld_dma_bind21				(ld_dma_bind21),
 .ld_dma_bind22				(ld_dma_bind22),
 .ld_dma_bind23				(ld_dma_bind23),
 .ld_dma_bind24				(ld_dma_bind24),
 .ld_dma_bind25				(ld_dma_bind25),
 .ld_dma_bind26				(ld_dma_bind26),
 .ld_dma_bind27				(ld_dma_bind27),
 .ld_dma_bind28				(ld_dma_bind28),
 .ld_dma_bind29				(ld_dma_bind29),
 .ld_dma_bind30				(ld_dma_bind30),
 .ld_dma_bind31				(ld_dma_bind31),
 .ld_dma_bind32				(ld_dma_bind32),
 .ld_dma_bind33				(ld_dma_bind33),
 .ld_dma_bind34				(ld_dma_bind34),
 .ld_dma_bind35				(ld_dma_bind35),
 .ld_dma_bind36				(ld_dma_bind36),
 .ld_dma_bind37				(ld_dma_bind37),
 .ld_dma_bind38				(ld_dma_bind38),
 .ld_dma_bind39				(ld_dma_bind39),
 .ld_dma_bind40				(ld_dma_bind40),
 .ld_dma_bind41				(ld_dma_bind41),
 .ld_dma_bind42				(ld_dma_bind42),
 .ld_dma_bind43				(ld_dma_bind43),
 .ld_dma_bind44				(ld_dma_bind44),
 .ld_dma_bind45				(ld_dma_bind45),
 .ld_dma_bind46				(ld_dma_bind46),
 .ld_dma_bind47				(ld_dma_bind47),
 .ld_dma_bind48				(ld_dma_bind48),
 .ld_dma_bind49				(ld_dma_bind49),
 .ld_dma_bind50				(ld_dma_bind50),
 .ld_dma_bind51				(ld_dma_bind51),
 .ld_dma_bind52				(ld_dma_bind52),
 .ld_dma_bind53				(ld_dma_bind53),
 .ld_dma_bind54				(ld_dma_bind54),
 .ld_dma_bind55				(ld_dma_bind55),
 .ld_dma_bind56				(ld_dma_bind56),
 .ld_dma_bind57				(ld_dma_bind57),
 .ld_dma_bind58				(ld_dma_bind58),
 .ld_dma_bind59				(ld_dma_bind59),
 .ld_dma_bind60				(ld_dma_bind60),
 .ld_dma_bind61				(ld_dma_bind61),
 .ld_dma_bind62				(ld_dma_bind62),
 .ld_dma_bind63				(ld_dma_bind63),
 .ld_sid0				(ld_sid0),
 .ld_sid1				(ld_sid1),
 .ld_sid2				(ld_sid2),
 .ld_sid3				(ld_sid3),
 .ld_sid4				(ld_sid4),
 .ld_sid5				(ld_sid5),
 .ld_sid6				(ld_sid6),
 .ld_sid7				(ld_sid7),
 .ld_sid8				(ld_sid8),
 .ld_sid9				(ld_sid9),
 .ld_sid10				(ld_sid10),
 .ld_sid11				(ld_sid11),
 .ld_sid12				(ld_sid12),
 .ld_sid13				(ld_sid13),
 .ld_sid14				(ld_sid14),
 .ld_sid15				(ld_sid15),
 .ld_sid16				(ld_sid16),
 .ld_sid17				(ld_sid17),
 .ld_sid18				(ld_sid18),
 .ld_sid19				(ld_sid19),
 .ld_sid20				(ld_sid20),
 .ld_sid21				(ld_sid21),
 .ld_sid22				(ld_sid22),
 .ld_sid23				(ld_sid23),
 .ld_sid24				(ld_sid24),
 .ld_sid25				(ld_sid25),
 .ld_sid26				(ld_sid26),
 .ld_sid27				(ld_sid27),
 .ld_sid28				(ld_sid28),
 .ld_sid29				(ld_sid29),
 .ld_sid30				(ld_sid30),
 .ld_sid31				(ld_sid31),
 .ld_sid32				(ld_sid32),
 .ld_sid33				(ld_sid33),
 .ld_sid34				(ld_sid34),
 .ld_sid35				(ld_sid35),
 .ld_sid36				(ld_sid36),
 .ld_sid37				(ld_sid37),
 .ld_sid38				(ld_sid38),
 .ld_sid39				(ld_sid39),
 .ld_sid40				(ld_sid40),
 .ld_sid41				(ld_sid41),
 .ld_sid42				(ld_sid42),
 .ld_sid43				(ld_sid43),
 .ld_sid44				(ld_sid44),
 .ld_sid45				(ld_sid45),
 .ld_sid46				(ld_sid46),
 .ld_sid47				(ld_sid47),
 .ld_sid48				(ld_sid48),
 .ld_sid49				(ld_sid49),
 .ld_sid50				(ld_sid50),
 .ld_sid51				(ld_sid51),
 .ld_sid52				(ld_sid52),
 .ld_sid53				(ld_sid53),
 .ld_sid54				(ld_sid54),
 .ld_sid55				(ld_sid55),
 .ld_sid56				(ld_sid56),
 .ld_sid57				(ld_sid57),
 .ld_sid58				(ld_sid58),
 .ld_sid59				(ld_sid59),
 .ld_sid60				(ld_sid60),
 .ld_sid61				(ld_sid61),
 .ld_sid62				(ld_sid62),
 .ld_sid63				(ld_sid63),
 .ld_ldgn0				(ld_ldgn0),
 .ld_ldgn1				(ld_ldgn1),
 .ld_ldgn2				(ld_ldgn2),
 .ld_ldgn3				(ld_ldgn3),
 .ld_ldgn4				(ld_ldgn4),
 .ld_ldgn5				(ld_ldgn5),
 .ld_ldgn6				(ld_ldgn6),
 .ld_ldgn7				(ld_ldgn7),
 .ld_ldgn8				(ld_ldgn8),
 .ld_ldgn9				(ld_ldgn9),
 .ld_ldgn10				(ld_ldgn10),
 .ld_ldgn11				(ld_ldgn11),
 .ld_ldgn12				(ld_ldgn12),
 .ld_ldgn13				(ld_ldgn13),
 .ld_ldgn14				(ld_ldgn14),
 .ld_ldgn15				(ld_ldgn15),
 .ld_ldgn16				(ld_ldgn16),
 .ld_ldgn17				(ld_ldgn17),
 .ld_ldgn18				(ld_ldgn18),
 .ld_ldgn19				(ld_ldgn19),
 .ld_ldgn20				(ld_ldgn20),
 .ld_ldgn21				(ld_ldgn21),
 .ld_ldgn22				(ld_ldgn22),
 .ld_ldgn23				(ld_ldgn23),
 .ld_ldgn24				(ld_ldgn24),
 .ld_ldgn25				(ld_ldgn25),
 .ld_ldgn26				(ld_ldgn26),
 .ld_ldgn27				(ld_ldgn27),
 .ld_ldgn28				(ld_ldgn28),
 .ld_ldgn29				(ld_ldgn29),
 .ld_ldgn30				(ld_ldgn30),
 .ld_ldgn31				(ld_ldgn31),
 .ld_ldgn32				(ld_ldgn32),
 .ld_ldgn33				(ld_ldgn33),
 .ld_ldgn34				(ld_ldgn34),
 .ld_ldgn35				(ld_ldgn35),
 .ld_ldgn36				(ld_ldgn36),
 .ld_ldgn37				(ld_ldgn37),
 .ld_ldgn38				(ld_ldgn38),
 .ld_ldgn39				(ld_ldgn39),
 .ld_ldgn40				(ld_ldgn40),
 .ld_ldgn41				(ld_ldgn41),
 .ld_ldgn42				(ld_ldgn42),
 .ld_ldgn43				(ld_ldgn43),
 .ld_ldgn44				(ld_ldgn44),
 .ld_ldgn45				(ld_ldgn45),
 .ld_ldgn46				(ld_ldgn46),
 .ld_ldgn47				(ld_ldgn47),
 .ld_ldgn48				(ld_ldgn48),
 .ld_ldgn49				(ld_ldgn49),
 .ld_ldgn50				(ld_ldgn50),
 .ld_ldgn51				(ld_ldgn51),
 .ld_ldgn52				(ld_ldgn52),
 .ld_ldgn53				(ld_ldgn53),
 .ld_ldgn54				(ld_ldgn54),
 .ld_ldgn55				(ld_ldgn55),
 .ld_ldgn56				(ld_ldgn56),
 .ld_ldgn57				(ld_ldgn57),
 .ld_ldgn58				(ld_ldgn58),
 .ld_ldgn59				(ld_ldgn59),
 .ld_ldgn60				(ld_ldgn60),
 .ld_ldgn61				(ld_ldgn61),
 .ld_ldgn62				(ld_ldgn62),
 .ld_ldgn63				(ld_ldgn63),
 .ld_ldgn64				(ld_ldgn64),
 .ld_ldgn65				(ld_ldgn65),
 .ld_ldgn66				(ld_ldgn66),
 .ld_ldgn67				(ld_ldgn67),
 .ld_ldgn68				(ld_ldgn68),
 .ld_debug_select    		        (ld_debug_select),
 .ld_arb_dout    		        (ld_arb_dout),
 .ld_arb_din    		        (ld_arb_din),
 .ld_TrainingVector    		        (ld_TrainingVector),
 .ld_arb_ctrl    		        (ld_arb_ctrl),
 .ld_arb_debug_vector    		(ld_arb_debug_vector),
 .ld_smx_meta_intr_hld                  (ld_smx_meta_intr_hld),
`ifdef NEPTUNE
 .ld_gpio_dout    		        (ld_gpio_dout),
 .ld_gpio_en    		        (ld_gpio_en),
 .ld_gpio_din    		        (ld_gpio_din),
`else
 .ld_smx_config_data    		(ld_smx_config_data),
 .ld_smx_ctrl            		(ld_smx_ctrl),
 .ld_smx_debug_vector          		(ld_smx_debug_vector),
 .ld_smx_intr_status          		(ld_smx_intr_status),
 .ld_smx_intr_clr          		(ld_smx_intr_clr),
`endif
 // Inputs
 .niu_clk	           		(clk),
 .reset					(reset),
 .fzc_slv_sel_reg			(fzc_slv_sel_reg),
 .addr					(addr[18:0]),
 .rd					(rd),
 .config1				(config1),
 .rst_ctl				(rst_ctl[22:0]),
 .sys_err_mask				(sys_err_mask[10:0]),
 .sys_err_stat				(sys_err_stat[10:0]),
 .rtimer				(rtimer[19:0]),
 .dma_bind0				(dma_bind0[13:0]),
 .dma_bind1				(dma_bind1[13:0]),
 .dma_bind2				(dma_bind2[13:0]),
 .dma_bind3				(dma_bind3[13:0]),
 .dma_bind4				(dma_bind4[13:0]),
 .dma_bind5				(dma_bind5[13:0]),
 .dma_bind6				(dma_bind6[13:0]),
 .dma_bind7				(dma_bind7[13:0]),
 .dma_bind8				(dma_bind8[13:0]),
 .dma_bind9				(dma_bind9[13:0]),
 .dma_bind10				(dma_bind10[13:0]),
 .dma_bind11				(dma_bind11[13:0]),
 .dma_bind12				(dma_bind12[13:0]),
 .dma_bind13				(dma_bind13[13:0]),
 .dma_bind14				(dma_bind14[13:0]),
 .dma_bind15				(dma_bind15[13:0]),
 .dma_bind16				(dma_bind16[13:0]),
 .dma_bind17				(dma_bind17[13:0]),
 .dma_bind18				(dma_bind18[13:0]),
 .dma_bind19				(dma_bind19[13:0]),
 .dma_bind20				(dma_bind20[13:0]),
 .dma_bind21				(dma_bind21[13:0]),
 .dma_bind22				(dma_bind22[13:0]),
 .dma_bind23				(dma_bind23[13:0]),
 .dma_bind24				(dma_bind24[13:0]),
 .dma_bind25				(dma_bind25[13:0]),
 .dma_bind26				(dma_bind26[13:0]),
 .dma_bind27				(dma_bind27[13:0]),
 .dma_bind28				(dma_bind28[13:0]),
 .dma_bind29				(dma_bind29[13:0]),
 .dma_bind30				(dma_bind30[13:0]),
 .dma_bind31				(dma_bind31[13:0]),
 .dma_bind32				(dma_bind32[13:0]),
 .dma_bind33				(dma_bind33[13:0]),
 .dma_bind34				(dma_bind34[13:0]),
 .dma_bind35				(dma_bind35[13:0]),
 .dma_bind36				(dma_bind36[13:0]),
 .dma_bind37				(dma_bind37[13:0]),
 .dma_bind38				(dma_bind38[13:0]),
 .dma_bind39				(dma_bind39[13:0]),
 .dma_bind40				(dma_bind40[13:0]),
 .dma_bind41				(dma_bind41[13:0]),
 .dma_bind42				(dma_bind42[13:0]),
 .dma_bind43				(dma_bind43[13:0]),
 .dma_bind44				(dma_bind44[13:0]),
 .dma_bind45				(dma_bind45[13:0]),
 .dma_bind46				(dma_bind46[13:0]),
 .dma_bind47				(dma_bind47[13:0]),
 .dma_bind48				(dma_bind48[13:0]),
 .dma_bind49				(dma_bind49[13:0]),
 .dma_bind50				(dma_bind50[13:0]),
 .dma_bind51				(dma_bind51[13:0]),
 .dma_bind52				(dma_bind52[13:0]),
 .dma_bind53				(dma_bind53[13:0]),
 .dma_bind54				(dma_bind54[13:0]),
 .dma_bind55				(dma_bind55[13:0]),
 .dma_bind56				(dma_bind56[13:0]),
 .dma_bind57				(dma_bind57[13:0]),
 .dma_bind58				(dma_bind58[13:0]),
 .dma_bind59				(dma_bind59[13:0]),
 .dma_bind60				(dma_bind60[13:0]),
 .dma_bind61				(dma_bind61[13:0]),
 .dma_bind62				(dma_bind62[13:0]),
 .dma_bind63				(dma_bind63[13:0]),
 .sid0					(sid0[6:0]),
 .sid1					(sid1[6:0]),
 .sid2					(sid2[6:0]),
 .sid3					(sid3[6:0]),
 .sid4					(sid4[6:0]),
 .sid5					(sid5[6:0]),
 .sid6					(sid6[6:0]),
 .sid7					(sid7[6:0]),
 .sid8					(sid8[6:0]),
 .sid9					(sid9[6:0]),
 .sid10					(sid10[6:0]),
 .sid11					(sid11[6:0]),
 .sid12					(sid12[6:0]),
 .sid13					(sid13[6:0]),
 .sid14					(sid14[6:0]),
 .sid15					(sid15[6:0]),
 .sid16					(sid16[6:0]),
 .sid17					(sid17[6:0]),
 .sid18					(sid18[6:0]),
 .sid19					(sid19[6:0]),
 .sid20					(sid20[6:0]),
 .sid21					(sid21[6:0]),
 .sid22					(sid22[6:0]),
 .sid23					(sid23[6:0]),
 .sid24					(sid24[6:0]),
 .sid25					(sid25[6:0]),
 .sid26					(sid26[6:0]),
 .sid27					(sid27[6:0]),
 .sid28					(sid28[6:0]),
 .sid29					(sid29[6:0]),
 .sid30					(sid30[6:0]),
 .sid31					(sid31[6:0]),
 .sid32					(sid32[6:0]),
 .sid33					(sid33[6:0]),
 .sid34					(sid34[6:0]),
 .sid35					(sid35[6:0]),
 .sid36					(sid36[6:0]),
 .sid37					(sid37[6:0]),
 .sid38					(sid38[6:0]),
 .sid39					(sid39[6:0]),
 .sid40					(sid40[6:0]),
 .sid41					(sid41[6:0]),
 .sid42					(sid42[6:0]),
 .sid43					(sid43[6:0]),
 .sid44					(sid44[6:0]),
 .sid45					(sid45[6:0]),
 .sid46					(sid46[6:0]),
 .sid47					(sid47[6:0]),
 .sid48					(sid48[6:0]),
 .sid49					(sid49[6:0]),
 .sid50					(sid50[6:0]),
 .sid51					(sid51[6:0]),
 .sid52					(sid52[6:0]),
 .sid53					(sid53[6:0]),
 .sid54					(sid54[6:0]),
 .sid55					(sid55[6:0]),
 .sid56					(sid56[6:0]),
 .sid57					(sid57[6:0]),
 .sid58					(sid58[6:0]),
 .sid59					(sid59[6:0]),
 .sid60					(sid60[6:0]),
 .sid61					(sid61[6:0]),
 .sid62					(sid62[6:0]),
 .sid63					(sid63[6:0]),
 .ldgn0					(ldgn0[5:0]),
 .ldgn1					(ldgn1[5:0]),
 .ldgn2					(ldgn2[5:0]),
 .ldgn3					(ldgn3[5:0]),
 .ldgn4					(ldgn4[5:0]),
 .ldgn5					(ldgn5[5:0]),
 .ldgn6					(ldgn6[5:0]),
 .ldgn7					(ldgn7[5:0]),
 .ldgn8					(ldgn8[5:0]),
 .ldgn9					(ldgn9[5:0]),
 .ldgn10				(ldgn10[5:0]),
 .ldgn11				(ldgn11[5:0]),
 .ldgn12				(ldgn12[5:0]),
 .ldgn13				(ldgn13[5:0]),
 .ldgn14				(ldgn14[5:0]),
 .ldgn15				(ldgn15[5:0]),
 .ldgn16				(ldgn16[5:0]),
 .ldgn17				(ldgn17[5:0]),
 .ldgn18				(ldgn18[5:0]),
 .ldgn19				(ldgn19[5:0]),
 .ldgn20				(ldgn20[5:0]),
 .ldgn21				(ldgn21[5:0]),
 .ldgn22				(ldgn22[5:0]),
 .ldgn23				(ldgn23[5:0]),
 .ldgn24				(ldgn24[5:0]),
 .ldgn25				(ldgn25[5:0]),
 .ldgn26				(ldgn26[5:0]),
 .ldgn27				(ldgn27[5:0]),
 .ldgn28				(ldgn28[5:0]),
 .ldgn29				(ldgn29[5:0]),
 .ldgn30				(ldgn30[5:0]),
 .ldgn31				(ldgn31[5:0]),
 .ldgn32				(ldgn32[5:0]),
 .ldgn33				(ldgn33[5:0]),
 .ldgn34				(ldgn34[5:0]),
 .ldgn35				(ldgn35[5:0]),
 .ldgn36				(ldgn36[5:0]),
 .ldgn37				(ldgn37[5:0]),
 .ldgn38				(ldgn38[5:0]),
 .ldgn39				(ldgn39[5:0]),
 .ldgn40				(ldgn40[5:0]),
 .ldgn41				(ldgn41[5:0]),
 .ldgn42				(ldgn42[5:0]),
 .ldgn43				(ldgn43[5:0]),
 .ldgn44				(ldgn44[5:0]),
 .ldgn45				(ldgn45[5:0]),
 .ldgn46				(ldgn46[5:0]),
 .ldgn47				(ldgn47[5:0]),
 .ldgn48				(ldgn48[5:0]),
 .ldgn49				(ldgn49[5:0]),
 .ldgn50				(ldgn50[5:0]),
 .ldgn51				(ldgn51[5:0]),
 .ldgn52				(ldgn52[5:0]),
 .ldgn53				(ldgn53[5:0]),
 .ldgn54				(ldgn54[5:0]),
 .ldgn55				(ldgn55[5:0]),
 .ldgn56				(ldgn56[5:0]),
 .ldgn57				(ldgn57[5:0]),
 .ldgn58				(ldgn58[5:0]),
 .ldgn59				(ldgn59[5:0]),
 .ldgn60				(ldgn60[5:0]),
 .ldgn61				(ldgn61[5:0]),
 .ldgn62				(ldgn62[5:0]),
 .ldgn63				(ldgn63[5:0]),
 .ldgn64				(ldgn64[5:0]),
 .ldgn65				(ldgn65[5:0]),
 .ldgn66				(ldgn66[5:0]),
 .ldgn67				(ldgn67[5:0]),
 .ldgn68				(ldgn68[5:0]),
 .debug_select    		        (debug_select[5:0]),
 .TrainingVector    		        (TrainingVector[31:0]),
 .arb_dout    		                (arb_dout[31:0]),
 .arb_din_int    		        (arb_din_int[31:0]),
 .arb_ctrl    		                (arb_ctrl[31:0]),
 .arb_debug_vector  	                (arb_debug_vector[31:0]),
 .smx_meta_intr_hld  	                (smx_meta_intr_hld),
`ifdef NEPTUNE
 .gpio_dout    		                (gpio_dout[15:0]),
 .gpio_en    		                (gpio_en[15:0]),
 .gpio_din_int   	                (gpio_din_int[15:0]));
`else
 .smx_config_data    		        (smx_config_data[31:0]),
 .smx_ctrl    		                (smx_ctrl[31:0]),
 .smx_intr_clr    		        (smx_intr_clr),
 .smx_debug_vector 	                (smx_debug_vector[31:0]),
 .smx_intr_status    		        (smx_intr_status[31:0]));
`endif
   
niu_pio_ldgim_decoder    niu_pio_ldgim_decoder
(/*AUTOINST*/
 // Outputs
 .ldgim_ack				(ldgim_ack),
 .ldgim_rdata				(ldgim_rdata[63:0]),
 .ldgim_err				(ldgim_err),
 .ld_ldgim0				(ld_ldgim0),
 .ld_ldgim1				(ld_ldgim1),
 .ld_ldgim2				(ld_ldgim2),
 .ld_ldgim3				(ld_ldgim3),
 .ld_ldgim4				(ld_ldgim4),
 .ld_ldgim5				(ld_ldgim5),
 .ld_ldgim6				(ld_ldgim6),
 .ld_ldgim7				(ld_ldgim7),
 .ld_ldgim8				(ld_ldgim8),
 .ld_ldgim9				(ld_ldgim9),
 .ld_ldgim10				(ld_ldgim10),
 .ld_ldgim11				(ld_ldgim11),
 .ld_ldgim12				(ld_ldgim12),
 .ld_ldgim13				(ld_ldgim13),
 .ld_ldgim14				(ld_ldgim14),
 .ld_ldgim15				(ld_ldgim15),
 .ld_ldgim16				(ld_ldgim16),
 .ld_ldgim17				(ld_ldgim17),
 .ld_ldgim18				(ld_ldgim18),
 .ld_ldgim19				(ld_ldgim19),
 .ld_ldgim20				(ld_ldgim20),
 .ld_ldgim21				(ld_ldgim21),
 .ld_ldgim22				(ld_ldgim22),
 .ld_ldgim23				(ld_ldgim23),
 .ld_ldgim24				(ld_ldgim24),
 .ld_ldgim25				(ld_ldgim25),
 .ld_ldgim26				(ld_ldgim26),
 .ld_ldgim27				(ld_ldgim27),
 .ld_ldgim28				(ld_ldgim28),
 .ld_ldgim29				(ld_ldgim29),
 .ld_ldgim30				(ld_ldgim30),
 .ld_ldgim31				(ld_ldgim31),
 .ld_ldgim32				(ld_ldgim32),
 .ld_ldgim33				(ld_ldgim33),
 .ld_ldgim34				(ld_ldgim34),
 .ld_ldgim35				(ld_ldgim35),
 .ld_ldgim36				(ld_ldgim36),
 .ld_ldgim37				(ld_ldgim37),
 .ld_ldgim38				(ld_ldgim38),
 .ld_ldgim39				(ld_ldgim39),
 .ld_ldgim40				(ld_ldgim40),
 .ld_ldgim41				(ld_ldgim41),
 .ld_ldgim42				(ld_ldgim42),
 .ld_ldgim43				(ld_ldgim43),
 .ld_ldgim44				(ld_ldgim44),
 .ld_ldgim45				(ld_ldgim45),
 .ld_ldgim46				(ld_ldgim46),
 .ld_ldgim47				(ld_ldgim47),
 .ld_ldgim48				(ld_ldgim48),
 .ld_ldgim49				(ld_ldgim49),
 .ld_ldgim50				(ld_ldgim50),
 .ld_ldgim51				(ld_ldgim51),
 .ld_ldgim52				(ld_ldgim52),
 .ld_ldgim53				(ld_ldgim53),
 .ld_ldgim54				(ld_ldgim54),
 .ld_ldgim55				(ld_ldgim55),
 .ld_ldgim56				(ld_ldgim56),
 .ld_ldgim57				(ld_ldgim57),
 .ld_ldgim58				(ld_ldgim58),
 .ld_ldgim59				(ld_ldgim59),
 .ld_ldgim60				(ld_ldgim60),
 .ld_ldgim61				(ld_ldgim61),
 .ld_ldgim62				(ld_ldgim62),
 .ld_ldgim63				(ld_ldgim63),
 .intr_reg_sel				(intr_reg_sel),
 // Inputs
 .clk					(clk),
 .reset					(reset),
 .ldgim_sel_reg				(ldsv_sel_reg),
 .addr					(addr[18:0]),
 .rd					(rd),
 .arm0					(arm0),
 .arm1					(arm1),
 .arm2					(arm2),
 .arm3					(arm3),
 .arm4					(arm4),
 .arm5					(arm5),
 .arm6					(arm6),
 .arm7					(arm7),
 .arm8					(arm8),
 .arm9					(arm9),
 .arm10					(arm10),
 .arm11					(arm11),
 .arm12					(arm12),
 .arm13					(arm13),
 .arm14					(arm14),
 .arm15					(arm15),
 .arm16					(arm16),
 .arm17					(arm17),
 .arm18					(arm18),
 .arm19					(arm19),
 .arm20					(arm20),
 .arm21					(arm21),
 .arm22					(arm22),
 .arm23					(arm23),
 .arm24					(arm24),
 .arm25					(arm25),
 .arm26					(arm26),
 .arm27					(arm27),
 .arm28					(arm28),
 .arm29					(arm29),
 .arm30					(arm30),
 .arm31					(arm31),
 .arm32					(arm32),
 .arm33					(arm33),
 .arm34					(arm34),
 .arm35					(arm35),
 .arm36					(arm36),
 .arm37					(arm37),
 .arm38					(arm38),
 .arm39					(arm39),
 .arm40					(arm40),
 .arm41					(arm41),
 .arm42					(arm42),
 .arm43					(arm43),
 .arm44					(arm44),
 .arm45					(arm45),
 .arm46					(arm46),
 .arm47					(arm47),
 .arm48					(arm48),
 .arm49					(arm49),
 .arm50					(arm50),
 .arm51					(arm51),
 .arm52					(arm52),
 .arm53					(arm53),
 .arm54					(arm54),
 .arm55					(arm55),
 .arm56					(arm56),
 .arm57					(arm57),
 .arm58					(arm58),
 .arm59					(arm59),
 .arm60					(arm60),
 .arm61					(arm61),
 .arm62					(arm62),
 .arm63					(arm63),
 .timer0				(timer0[5:0]),
 .timer1				(timer1[5:0]),
 .timer2				(timer2[5:0]),
 .timer3				(timer3[5:0]),
 .timer4				(timer4[5:0]),
 .timer5				(timer5[5:0]),
 .timer6				(timer6[5:0]),
 .timer7				(timer7[5:0]),
 .timer8				(timer8[5:0]),
 .timer9				(timer9[5:0]),
 .timer10				(timer10[5:0]),
 .timer11				(timer11[5:0]),
 .timer12				(timer12[5:0]),
 .timer13				(timer13[5:0]),
 .timer14				(timer14[5:0]),
 .timer15				(timer15[5:0]),
 .timer16				(timer16[5:0]),
 .timer17				(timer17[5:0]),
 .timer18				(timer18[5:0]),
 .timer19				(timer19[5:0]),
 .timer20				(timer20[5:0]),
 .timer21				(timer21[5:0]),
 .timer22				(timer22[5:0]),
 .timer23				(timer23[5:0]),
 .timer24				(timer24[5:0]),
 .timer25				(timer25[5:0]),
 .timer26				(timer26[5:0]),
 .timer27				(timer27[5:0]),
 .timer28				(timer28[5:0]),
 .timer29				(timer29[5:0]),
 .timer30				(timer30[5:0]),
 .timer31				(timer31[5:0]),
 .timer32				(timer32[5:0]),
 .timer33				(timer33[5:0]),
 .timer34				(timer34[5:0]),
 .timer35				(timer35[5:0]),
 .timer36				(timer36[5:0]),
 .timer37				(timer37[5:0]),
 .timer38				(timer38[5:0]),
 .timer39				(timer39[5:0]),
 .timer40				(timer40[5:0]),
 .timer41				(timer41[5:0]),
 .timer42				(timer42[5:0]),
 .timer43				(timer43[5:0]),
 .timer44				(timer44[5:0]),
 .timer45				(timer45[5:0]),
 .timer46				(timer46[5:0]),
 .timer47				(timer47[5:0]),
 .timer48				(timer48[5:0]),
 .timer49				(timer49[5:0]),
 .timer50				(timer50[5:0]),
 .timer51				(timer51[5:0]),
 .timer52				(timer52[5:0]),
 .timer53				(timer53[5:0]),
 .timer54				(timer54[5:0]),
 .timer55				(timer55[5:0]),
 .timer56				(timer56[5:0]),
 .timer57				(timer57[5:0]),
 .timer58				(timer58[5:0]),
 .timer59				(timer59[5:0]),
 .timer60				(timer60[5:0]),
 .timer61				(timer61[5:0]),
 .timer62				(timer62[5:0]),
 .timer63				(timer63[5:0]));

niu_pio_ldsv_decoder     niu_pio_ldsv_decoder
(/*AUTOINST*/
 // Outputs
 .ldsv_ack				(ldsv_ack),
 .ldsv_rdata				(ldsv_rdata[63:0]),
 .ldsv_err				(ldsv_err),
 // Inputs
 .clk					(clk),
`ifdef NEPTUNE
 .reset					(reset),
`else
`endif
 .ldsv_sel_reg				(ldsv_sel_reg),
 .addr					(addr[18:0]),
 .rd					(rd),
 .ldsv0grp0				(ldsv0grp0[63:0]),
 .ldsv1grp0				(ldsv1grp0[63:0]),
 .ldsv2grp0				(ldsv2grp0[63:0]),
 .ldsv0grp1				(ldsv0grp1[63:0]),
 .ldsv1grp1				(ldsv1grp1[63:0]),
 .ldsv2grp1				(ldsv2grp1[63:0]),
 .ldsv0grp2				(ldsv0grp2[63:0]),
 .ldsv1grp2				(ldsv1grp2[63:0]),
 .ldsv2grp2				(ldsv2grp2[63:0]),
 .ldsv0grp3				(ldsv0grp3[63:0]),
 .ldsv1grp3				(ldsv1grp3[63:0]),
 .ldsv2grp3				(ldsv2grp3[63:0]),
 .ldsv0grp4				(ldsv0grp4[63:0]),
 .ldsv1grp4				(ldsv1grp4[63:0]),
 .ldsv2grp4				(ldsv2grp4[63:0]),
 .ldsv0grp5				(ldsv0grp5[63:0]),
 .ldsv1grp5				(ldsv1grp5[63:0]),
 .ldsv2grp5				(ldsv2grp5[63:0]),
 .ldsv0grp6				(ldsv0grp6[63:0]),
 .ldsv1grp6				(ldsv1grp6[63:0]),
 .ldsv2grp6				(ldsv2grp6[63:0]),
 .ldsv0grp7				(ldsv0grp7[63:0]),
 .ldsv1grp7				(ldsv1grp7[63:0]),
 .ldsv2grp7				(ldsv2grp7[63:0]),
 .ldsv0grp8				(ldsv0grp8[63:0]),
 .ldsv1grp8				(ldsv1grp8[63:0]),
 .ldsv2grp8				(ldsv2grp8[63:0]),
 .ldsv0grp9				(ldsv0grp9[63:0]),
 .ldsv1grp9				(ldsv1grp9[63:0]),
 .ldsv2grp9				(ldsv2grp9[63:0]),
 .ldsv0grp10				(ldsv0grp10[63:0]),
 .ldsv1grp10				(ldsv1grp10[63:0]),
 .ldsv2grp10				(ldsv2grp10[63:0]),
 .ldsv0grp11				(ldsv0grp11[63:0]),
 .ldsv1grp11				(ldsv1grp11[63:0]),
 .ldsv2grp11				(ldsv2grp11[63:0]),
 .ldsv0grp12				(ldsv0grp12[63:0]),
 .ldsv1grp12				(ldsv1grp12[63:0]),
 .ldsv2grp12				(ldsv2grp12[63:0]),
 .ldsv0grp13				(ldsv0grp13[63:0]),
 .ldsv1grp13				(ldsv1grp13[63:0]),
 .ldsv2grp13				(ldsv2grp13[63:0]),
 .ldsv0grp14				(ldsv0grp14[63:0]),
 .ldsv1grp14				(ldsv1grp14[63:0]),
 .ldsv2grp14				(ldsv2grp14[63:0]),
 .ldsv0grp15				(ldsv0grp15[63:0]),
 .ldsv1grp15				(ldsv1grp15[63:0]),
 .ldsv2grp15				(ldsv2grp15[63:0]),
 .ldsv0grp16				(ldsv0grp16[63:0]),
 .ldsv1grp16				(ldsv1grp16[63:0]),
 .ldsv2grp16				(ldsv2grp16[63:0]),
 .ldsv0grp17				(ldsv0grp17[63:0]),
 .ldsv1grp17				(ldsv1grp17[63:0]),
 .ldsv2grp17				(ldsv2grp17[63:0]),
 .ldsv0grp18				(ldsv0grp18[63:0]),
 .ldsv1grp18				(ldsv1grp18[63:0]),
 .ldsv2grp18				(ldsv2grp18[63:0]),
 .ldsv0grp19				(ldsv0grp19[63:0]),
 .ldsv1grp19				(ldsv1grp19[63:0]),
 .ldsv2grp19				(ldsv2grp19[63:0]),
 .ldsv0grp20				(ldsv0grp20[63:0]),
 .ldsv1grp20				(ldsv1grp20[63:0]),
 .ldsv2grp20				(ldsv2grp20[63:0]),
 .ldsv0grp21				(ldsv0grp21[63:0]),
 .ldsv1grp21				(ldsv1grp21[63:0]),
 .ldsv2grp21				(ldsv2grp21[63:0]),
 .ldsv0grp22				(ldsv0grp22[63:0]),
 .ldsv1grp22				(ldsv1grp22[63:0]),
 .ldsv2grp22				(ldsv2grp22[63:0]),
 .ldsv0grp23				(ldsv0grp23[63:0]),
 .ldsv1grp23				(ldsv1grp23[63:0]),
 .ldsv2grp23				(ldsv2grp23[63:0]),
 .ldsv0grp24				(ldsv0grp24[63:0]),
 .ldsv1grp24				(ldsv1grp24[63:0]),
 .ldsv2grp24				(ldsv2grp24[63:0]),
 .ldsv0grp25				(ldsv0grp25[63:0]),
 .ldsv1grp25				(ldsv1grp25[63:0]),
 .ldsv2grp25				(ldsv2grp25[63:0]),
 .ldsv0grp26				(ldsv0grp26[63:0]),
 .ldsv1grp26				(ldsv1grp26[63:0]),
 .ldsv2grp26				(ldsv2grp26[63:0]),
 .ldsv0grp27				(ldsv0grp27[63:0]),
 .ldsv1grp27				(ldsv1grp27[63:0]),
 .ldsv2grp27				(ldsv2grp27[63:0]),
 .ldsv0grp28				(ldsv0grp28[63:0]),
 .ldsv1grp28				(ldsv1grp28[63:0]),
 .ldsv2grp28				(ldsv2grp28[63:0]),
 .ldsv0grp29				(ldsv0grp29[63:0]),
 .ldsv1grp29				(ldsv1grp29[63:0]),
 .ldsv2grp29				(ldsv2grp29[63:0]),
 .ldsv0grp30				(ldsv0grp30[63:0]),
 .ldsv1grp30				(ldsv1grp30[63:0]),
 .ldsv2grp30				(ldsv2grp30[63:0]),
 .ldsv0grp31				(ldsv0grp31[63:0]),
 .ldsv1grp31				(ldsv1grp31[63:0]),
 .ldsv2grp31				(ldsv2grp31[63:0]),
 .ldsv0grp32				(ldsv0grp32[63:0]),
 .ldsv1grp32				(ldsv1grp32[63:0]),
 .ldsv2grp32				(ldsv2grp32[63:0]),
 .ldsv0grp33				(ldsv0grp33[63:0]),
 .ldsv1grp33				(ldsv1grp33[63:0]),
 .ldsv2grp33				(ldsv2grp33[63:0]),
 .ldsv0grp34				(ldsv0grp34[63:0]),
 .ldsv1grp34				(ldsv1grp34[63:0]),
 .ldsv2grp34				(ldsv2grp34[63:0]),
 .ldsv0grp35				(ldsv0grp35[63:0]),
 .ldsv1grp35				(ldsv1grp35[63:0]),
 .ldsv2grp35				(ldsv2grp35[63:0]),
 .ldsv0grp36				(ldsv0grp36[63:0]),
 .ldsv1grp36				(ldsv1grp36[63:0]),
 .ldsv2grp36				(ldsv2grp36[63:0]),
 .ldsv0grp37				(ldsv0grp37[63:0]),
 .ldsv1grp37				(ldsv1grp37[63:0]),
 .ldsv2grp37				(ldsv2grp37[63:0]),
 .ldsv0grp38				(ldsv0grp38[63:0]),
 .ldsv1grp38				(ldsv1grp38[63:0]),
 .ldsv2grp38				(ldsv2grp38[63:0]),
 .ldsv0grp39				(ldsv0grp39[63:0]),
 .ldsv1grp39				(ldsv1grp39[63:0]),
 .ldsv2grp39				(ldsv2grp39[63:0]),
 .ldsv0grp40				(ldsv0grp40[63:0]),
 .ldsv1grp40				(ldsv1grp40[63:0]),
 .ldsv2grp40				(ldsv2grp40[63:0]),
 .ldsv0grp41				(ldsv0grp41[63:0]),
 .ldsv1grp41				(ldsv1grp41[63:0]),
 .ldsv2grp41				(ldsv2grp41[63:0]),
 .ldsv0grp42				(ldsv0grp42[63:0]),
 .ldsv1grp42				(ldsv1grp42[63:0]),
 .ldsv2grp42				(ldsv2grp42[63:0]),
 .ldsv0grp43				(ldsv0grp43[63:0]),
 .ldsv1grp43				(ldsv1grp43[63:0]),
 .ldsv2grp43				(ldsv2grp43[63:0]),
 .ldsv0grp44				(ldsv0grp44[63:0]),
 .ldsv1grp44				(ldsv1grp44[63:0]),
 .ldsv2grp44				(ldsv2grp44[63:0]),
 .ldsv0grp45				(ldsv0grp45[63:0]),
 .ldsv1grp45				(ldsv1grp45[63:0]),
 .ldsv2grp45				(ldsv2grp45[63:0]),
 .ldsv0grp46				(ldsv0grp46[63:0]),
 .ldsv1grp46				(ldsv1grp46[63:0]),
 .ldsv2grp46				(ldsv2grp46[63:0]),
 .ldsv0grp47				(ldsv0grp47[63:0]),
 .ldsv1grp47				(ldsv1grp47[63:0]),
 .ldsv2grp47				(ldsv2grp47[63:0]),
 .ldsv0grp48				(ldsv0grp48[63:0]),
 .ldsv1grp48				(ldsv1grp48[63:0]),
 .ldsv2grp48				(ldsv2grp48[63:0]),
 .ldsv0grp49				(ldsv0grp49[63:0]),
 .ldsv1grp49				(ldsv1grp49[63:0]),
 .ldsv2grp49				(ldsv2grp49[63:0]),
 .ldsv0grp50				(ldsv0grp50[63:0]),
 .ldsv1grp50				(ldsv1grp50[63:0]),
 .ldsv2grp50				(ldsv2grp50[63:0]),
 .ldsv0grp51				(ldsv0grp51[63:0]),
 .ldsv1grp51				(ldsv1grp51[63:0]),
 .ldsv2grp51				(ldsv2grp51[63:0]),
 .ldsv0grp52				(ldsv0grp52[63:0]),
 .ldsv1grp52				(ldsv1grp52[63:0]),
 .ldsv2grp52				(ldsv2grp52[63:0]),
 .ldsv0grp53				(ldsv0grp53[63:0]),
 .ldsv1grp53				(ldsv1grp53[63:0]),
 .ldsv2grp53				(ldsv2grp53[63:0]),
 .ldsv0grp54				(ldsv0grp54[63:0]),
 .ldsv1grp54				(ldsv1grp54[63:0]),
 .ldsv2grp54				(ldsv2grp54[63:0]),
 .ldsv0grp55				(ldsv0grp55[63:0]),
 .ldsv1grp55				(ldsv1grp55[63:0]),
 .ldsv2grp55				(ldsv2grp55[63:0]),
 .ldsv0grp56				(ldsv0grp56[63:0]),
 .ldsv1grp56				(ldsv1grp56[63:0]),
 .ldsv2grp56				(ldsv2grp56[63:0]),
 .ldsv0grp57				(ldsv0grp57[63:0]),
 .ldsv1grp57				(ldsv1grp57[63:0]),
 .ldsv2grp57				(ldsv2grp57[63:0]),
 .ldsv0grp58				(ldsv0grp58[63:0]),
 .ldsv1grp58				(ldsv1grp58[63:0]),
 .ldsv2grp58				(ldsv2grp58[63:0]),
 .ldsv0grp59				(ldsv0grp59[63:0]),
 .ldsv1grp59				(ldsv1grp59[63:0]),
 .ldsv2grp59				(ldsv2grp59[63:0]),
 .ldsv0grp60				(ldsv0grp60[63:0]),
 .ldsv1grp60				(ldsv1grp60[63:0]),
 .ldsv2grp60				(ldsv2grp60[63:0]),
 .ldsv0grp61				(ldsv0grp61[63:0]),
 .ldsv1grp61				(ldsv1grp61[63:0]),
 .ldsv2grp61				(ldsv2grp61[63:0]),
 .ldsv0grp62				(ldsv0grp62[63:0]),
 .ldsv1grp62				(ldsv1grp62[63:0]),
 .ldsv2grp62				(ldsv2grp62[63:0]),
 .ldsv0grp63				(ldsv0grp63[63:0]),
 .ldsv1grp63				(ldsv1grp63[63:0]),
 .ldsv2grp63				(ldsv2grp63[63:0]));

niu_pio_imask0_decoder   niu_pio_imask0_decoder
(/*AUTOINST*/
 // Outputs
 .imask0_ack				(imask0_ack),
 .imask0_rdata				(imask0_rdata[63:0]),
 .imask0_err				(imask0_err),
 .ld_ldf_mask0				(ld_ldf_mask0),
 .ld_ldf_mask1				(ld_ldf_mask1),
 .ld_ldf_mask2				(ld_ldf_mask2),
 .ld_ldf_mask3				(ld_ldf_mask3),
 .ld_ldf_mask4				(ld_ldf_mask4),
 .ld_ldf_mask5				(ld_ldf_mask5),
 .ld_ldf_mask6				(ld_ldf_mask6),
 .ld_ldf_mask7				(ld_ldf_mask7),
 .ld_ldf_mask8				(ld_ldf_mask8),
 .ld_ldf_mask9				(ld_ldf_mask9),
 .ld_ldf_mask10				(ld_ldf_mask10),
 .ld_ldf_mask11				(ld_ldf_mask11),
 .ld_ldf_mask12				(ld_ldf_mask12),
 .ld_ldf_mask13				(ld_ldf_mask13),
 .ld_ldf_mask14				(ld_ldf_mask14),
 .ld_ldf_mask15				(ld_ldf_mask15),
 .ld_ldf_mask16				(ld_ldf_mask16),
 .ld_ldf_mask17				(ld_ldf_mask17),
 .ld_ldf_mask18				(ld_ldf_mask18),
 .ld_ldf_mask19				(ld_ldf_mask19),
 .ld_ldf_mask20				(ld_ldf_mask20),
 .ld_ldf_mask21				(ld_ldf_mask21),
 .ld_ldf_mask22				(ld_ldf_mask22),
 .ld_ldf_mask23				(ld_ldf_mask23),
 .ld_ldf_mask24				(ld_ldf_mask24),
 .ld_ldf_mask25				(ld_ldf_mask25),
 .ld_ldf_mask26				(ld_ldf_mask26),
 .ld_ldf_mask27				(ld_ldf_mask27),
 .ld_ldf_mask28				(ld_ldf_mask28),
 .ld_ldf_mask29				(ld_ldf_mask29),
 .ld_ldf_mask30				(ld_ldf_mask30),
 .ld_ldf_mask31				(ld_ldf_mask31),
 .ld_ldf_mask32				(ld_ldf_mask32),
 .ld_ldf_mask33				(ld_ldf_mask33),
 .ld_ldf_mask34				(ld_ldf_mask34),
 .ld_ldf_mask35				(ld_ldf_mask35),
 .ld_ldf_mask36				(ld_ldf_mask36),
 .ld_ldf_mask37				(ld_ldf_mask37),
 .ld_ldf_mask38				(ld_ldf_mask38),
 .ld_ldf_mask39				(ld_ldf_mask39),
 .ld_ldf_mask40				(ld_ldf_mask40),
 .ld_ldf_mask41				(ld_ldf_mask41),
 .ld_ldf_mask42				(ld_ldf_mask42),
 .ld_ldf_mask43				(ld_ldf_mask43),
 .ld_ldf_mask44				(ld_ldf_mask44),
 .ld_ldf_mask45				(ld_ldf_mask45),
 .ld_ldf_mask46				(ld_ldf_mask46),
 .ld_ldf_mask47				(ld_ldf_mask47),
 .ld_ldf_mask48				(ld_ldf_mask48),
 .ld_ldf_mask49				(ld_ldf_mask49),
 .ld_ldf_mask50				(ld_ldf_mask50),
 .ld_ldf_mask51				(ld_ldf_mask51),
 .ld_ldf_mask52				(ld_ldf_mask52),
 .ld_ldf_mask53				(ld_ldf_mask53),
 .ld_ldf_mask54				(ld_ldf_mask54),
 .ld_ldf_mask55				(ld_ldf_mask55),
 .ld_ldf_mask56				(ld_ldf_mask56),
 .ld_ldf_mask57				(ld_ldf_mask57),
 .ld_ldf_mask58				(ld_ldf_mask58),
 .ld_ldf_mask59				(ld_ldf_mask59),
 .ld_ldf_mask60				(ld_ldf_mask60),
 .ld_ldf_mask61				(ld_ldf_mask61),
 .ld_ldf_mask62				(ld_ldf_mask62),
 .ld_ldf_mask63				(ld_ldf_mask63),
 // Inputs
 .clk					(clk),
 .reset					(reset),
 .imask0_sel_reg			(imask0_sel_reg),
 .addr					(addr[18:0]),
 .rd					(rd),
 .ldf_mask0				(ldf_mask0[1:0]),
 .ldf_mask1				(ldf_mask1[1:0]),
 .ldf_mask2				(ldf_mask2[1:0]),
 .ldf_mask3				(ldf_mask3[1:0]),
 .ldf_mask4				(ldf_mask4[1:0]),
 .ldf_mask5				(ldf_mask5[1:0]),
 .ldf_mask6				(ldf_mask6[1:0]),
 .ldf_mask7				(ldf_mask7[1:0]),
 .ldf_mask8				(ldf_mask8[1:0]),
 .ldf_mask9				(ldf_mask9[1:0]),
 .ldf_mask10				(ldf_mask10[1:0]),
 .ldf_mask11				(ldf_mask11[1:0]),
 .ldf_mask12				(ldf_mask12[1:0]),
 .ldf_mask13				(ldf_mask13[1:0]),
 .ldf_mask14				(ldf_mask14[1:0]),
 .ldf_mask15				(ldf_mask15[1:0]),
 .ldf_mask16				(ldf_mask16[1:0]),
 .ldf_mask17				(ldf_mask17[1:0]),
 .ldf_mask18				(ldf_mask18[1:0]),
 .ldf_mask19				(ldf_mask19[1:0]),
 .ldf_mask20				(ldf_mask20[1:0]),
 .ldf_mask21				(ldf_mask21[1:0]),
 .ldf_mask22				(ldf_mask22[1:0]),
 .ldf_mask23				(ldf_mask23[1:0]),
 .ldf_mask24				(ldf_mask24[1:0]),
 .ldf_mask25				(ldf_mask25[1:0]),
 .ldf_mask26				(ldf_mask26[1:0]),
 .ldf_mask27				(ldf_mask27[1:0]),
 .ldf_mask28				(ldf_mask28[1:0]),
 .ldf_mask29				(ldf_mask29[1:0]),
 .ldf_mask30				(ldf_mask30[1:0]),
 .ldf_mask31				(ldf_mask31[1:0]),
 .ldf_mask32				(ldf_mask32[1:0]),
 .ldf_mask33				(ldf_mask33[1:0]),
 .ldf_mask34				(ldf_mask34[1:0]),
 .ldf_mask35				(ldf_mask35[1:0]),
 .ldf_mask36				(ldf_mask36[1:0]),
 .ldf_mask37				(ldf_mask37[1:0]),
 .ldf_mask38				(ldf_mask38[1:0]),
 .ldf_mask39				(ldf_mask39[1:0]),
 .ldf_mask40				(ldf_mask40[1:0]),
 .ldf_mask41				(ldf_mask41[1:0]),
 .ldf_mask42				(ldf_mask42[1:0]),
 .ldf_mask43				(ldf_mask43[1:0]),
 .ldf_mask44				(ldf_mask44[1:0]),
 .ldf_mask45				(ldf_mask45[1:0]),
 .ldf_mask46				(ldf_mask46[1:0]),
 .ldf_mask47				(ldf_mask47[1:0]),
 .ldf_mask48				(ldf_mask48[1:0]),
 .ldf_mask49				(ldf_mask49[1:0]),
 .ldf_mask50				(ldf_mask50[1:0]),
 .ldf_mask51				(ldf_mask51[1:0]),
 .ldf_mask52				(ldf_mask52[1:0]),
 .ldf_mask53				(ldf_mask53[1:0]),
 .ldf_mask54				(ldf_mask54[1:0]),
 .ldf_mask55				(ldf_mask55[1:0]),
 .ldf_mask56				(ldf_mask56[1:0]),
 .ldf_mask57				(ldf_mask57[1:0]),
 .ldf_mask58				(ldf_mask58[1:0]),
 .ldf_mask59				(ldf_mask59[1:0]),
 .ldf_mask60				(ldf_mask60[1:0]),
 .ldf_mask61				(ldf_mask61[1:0]),
 .ldf_mask62				(ldf_mask62[1:0]),
 .ldf_mask63				(ldf_mask63[1:0]));

niu_pio_imask1_decoder  niu_pio_imask1_decoder
(/*AUTOINST*/
 // Outputs
 .imask1_ack				(imask1_ack),
 .imask1_rdata				(imask1_rdata[63:0]),
 .imask1_err				(imask1_err),
 .ld_ldf_mask64				(ld_ldf_mask64),
 .ld_ldf_mask65				(ld_ldf_mask65),
 .ld_ldf_mask66				(ld_ldf_mask66),
 .ld_ldf_mask67				(ld_ldf_mask67),
 .ld_ldf_mask68				(ld_ldf_mask68),
 // Inputs
 .clk					(clk),
 .reset					(reset),
 .imask1_sel_reg			(imask1_sel_reg),
 .addr					(addr[18:0]),
 .rd					(rd),
 .ldf_mask64				(ldf_mask64[1:0]),
 .ldf_mask65				(ldf_mask65[1:0]),
 .ldf_mask66				(ldf_mask66[1:0]),
 .ldf_mask67				(ldf_mask67[1:0]),
 .ldf_mask68				(ldf_mask68[1:0]));

   
niu_pio_vdmc_decoder  niu_pio_vdmc_decoder
(/*AUTOINST*/
 // Outputs
 .vdmc_addr				(vdmc_addr[19:0]),
 .vdmc_sel_ok				(vdmc_sel_ok),
 // Inputs
 .addr					(addr[26:0]),
 .dma_bind0				(dma_bind0[13:0]),
 .dma_bind1				(dma_bind1[13:0]),
 .dma_bind2				(dma_bind2[13:0]),
 .dma_bind3				(dma_bind3[13:0]),
 .dma_bind4				(dma_bind4[13:0]),
 .dma_bind5				(dma_bind5[13:0]),
 .dma_bind6				(dma_bind6[13:0]),
 .dma_bind7				(dma_bind7[13:0]),
 .dma_bind8				(dma_bind8[13:0]),
 .dma_bind9				(dma_bind9[13:0]),
 .dma_bind10				(dma_bind10[13:0]),
 .dma_bind11				(dma_bind11[13:0]),
 .dma_bind12				(dma_bind12[13:0]),
 .dma_bind13				(dma_bind13[13:0]),
 .dma_bind14				(dma_bind14[13:0]),
 .dma_bind15				(dma_bind15[13:0]),
 .dma_bind16				(dma_bind16[13:0]),
 .dma_bind17				(dma_bind17[13:0]),
 .dma_bind18				(dma_bind18[13:0]),
 .dma_bind19				(dma_bind19[13:0]),
 .dma_bind20				(dma_bind20[13:0]),
 .dma_bind21				(dma_bind21[13:0]),
 .dma_bind22				(dma_bind22[13:0]),
 .dma_bind23				(dma_bind23[13:0]),
 .dma_bind24				(dma_bind24[13:0]),
 .dma_bind25				(dma_bind25[13:0]),
 .dma_bind26				(dma_bind26[13:0]),
 .dma_bind27				(dma_bind27[13:0]),
 .dma_bind28				(dma_bind28[13:0]),
 .dma_bind29				(dma_bind29[13:0]),
 .dma_bind30				(dma_bind30[13:0]),
 .dma_bind31				(dma_bind31[13:0]),
 .dma_bind32				(dma_bind32[13:0]),
 .dma_bind33				(dma_bind33[13:0]),
 .dma_bind34				(dma_bind34[13:0]),
 .dma_bind35				(dma_bind35[13:0]),
 .dma_bind36				(dma_bind36[13:0]),
 .dma_bind37				(dma_bind37[13:0]),
 .dma_bind38				(dma_bind38[13:0]),
 .dma_bind39				(dma_bind39[13:0]),
 .dma_bind40				(dma_bind40[13:0]),
 .dma_bind41				(dma_bind41[13:0]),
 .dma_bind42				(dma_bind42[13:0]),
 .dma_bind43				(dma_bind43[13:0]),
 .dma_bind44				(dma_bind44[13:0]),
 .dma_bind45				(dma_bind45[13:0]),
 .dma_bind46				(dma_bind46[13:0]),
 .dma_bind47				(dma_bind47[13:0]),
 .dma_bind48				(dma_bind48[13:0]),
 .dma_bind49				(dma_bind49[13:0]),
 .dma_bind50				(dma_bind50[13:0]),
 .dma_bind51				(dma_bind51[13:0]),
 .dma_bind52				(dma_bind52[13:0]),
 .dma_bind53				(dma_bind53[13:0]),
 .dma_bind54				(dma_bind54[13:0]),
 .dma_bind55				(dma_bind55[13:0]),
 .dma_bind56				(dma_bind56[13:0]),
 .dma_bind57				(dma_bind57[13:0]),
 .dma_bind58				(dma_bind58[13:0]),
 .dma_bind59				(dma_bind59[13:0]),
 .dma_bind60				(dma_bind60[13:0]),
 .dma_bind61				(dma_bind61[13:0]),
 .dma_bind62				(dma_bind62[13:0]),
 .dma_bind63				(dma_bind63[13:0]));

endmodule // niu_pio_regs
