// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_fzc_slv_decoder.v
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
/*%w%	%G%*/

/*****************************************************************
 *
 * File Name    : niu_pio_fzc_slv_decoder.v
 * Author Name  : John Lo
 * Description  : It contains PIO itslef read/write decoder,
 * 
 * Parent Module: niu_pio_fzc_slv_decoder.v
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

module niu_pio_fzc_slv_decoder (/*AUTOARG*/
   // Outputs
   fzc_slv_ack, fzc_slv_rdata, fzc_slv_err, ld_config1, 
   ld_rst_ctl, ld_sys_err_mask, ld_sys_err_stat, ld_rtimer, 
   ld_dma_bind0, ld_dma_bind1, ld_dma_bind2, ld_dma_bind3, 
   ld_dma_bind4, ld_dma_bind5, ld_dma_bind6, ld_dma_bind7, 
   ld_dma_bind8, ld_dma_bind9, ld_dma_bind10, ld_dma_bind11, 
   ld_dma_bind12, ld_dma_bind13, ld_dma_bind14, ld_dma_bind15, 
   ld_dma_bind16, ld_dma_bind17, ld_dma_bind18, ld_dma_bind19, 
   ld_dma_bind20, ld_dma_bind21, ld_dma_bind22, ld_dma_bind23, 
   ld_dma_bind24, ld_dma_bind25, ld_dma_bind26, ld_dma_bind27, 
   ld_dma_bind28, ld_dma_bind29, ld_dma_bind30, ld_dma_bind31, 
   ld_dma_bind32, ld_dma_bind33, ld_dma_bind34, ld_dma_bind35, 
   ld_dma_bind36, ld_dma_bind37, ld_dma_bind38, ld_dma_bind39, 
   ld_dma_bind40, ld_dma_bind41, ld_dma_bind42, ld_dma_bind43, 
   ld_dma_bind44, ld_dma_bind45, ld_dma_bind46, ld_dma_bind47, 
   ld_dma_bind48, ld_dma_bind49, ld_dma_bind50, ld_dma_bind51, 
   ld_dma_bind52, ld_dma_bind53, ld_dma_bind54, ld_dma_bind55, 
   ld_dma_bind56, ld_dma_bind57, ld_dma_bind58, ld_dma_bind59, 
   ld_dma_bind60, ld_dma_bind61, ld_dma_bind62, ld_dma_bind63, 
   ld_sid0, ld_sid1, ld_sid2, ld_sid3, ld_sid4, ld_sid5, ld_sid6, 
   ld_sid7, ld_sid8, ld_sid9, ld_sid10, ld_sid11, ld_sid12, ld_sid13, 
   ld_sid14, ld_sid15, ld_sid16, ld_sid17, ld_sid18, ld_sid19, 
   ld_sid20, ld_sid21, ld_sid22, ld_sid23, ld_sid24, ld_sid25, 
   ld_sid26, ld_sid27, ld_sid28, ld_sid29, ld_sid30, ld_sid31, 
   ld_sid32, ld_sid33, ld_sid34, ld_sid35, ld_sid36, ld_sid37, 
   ld_sid38, ld_sid39, ld_sid40, ld_sid41, ld_sid42, ld_sid43, 
   ld_sid44, ld_sid45, ld_sid46, ld_sid47, ld_sid48, ld_sid49, 
   ld_sid50, ld_sid51, ld_sid52, ld_sid53, ld_sid54, ld_sid55, 
   ld_sid56, ld_sid57, ld_sid58, ld_sid59, ld_sid60, ld_sid61, 
   ld_sid62, ld_sid63, ld_ldgn0, ld_ldgn1, ld_ldgn2, ld_ldgn3, 
   ld_ldgn4, ld_ldgn5, ld_ldgn6, ld_ldgn7, ld_ldgn8, ld_ldgn9, 
   ld_ldgn10, ld_ldgn11, ld_ldgn12, ld_ldgn13, ld_ldgn14, ld_ldgn15, 
   ld_ldgn16, ld_ldgn17, ld_ldgn18, ld_ldgn19, ld_ldgn20, ld_ldgn21, 
   ld_ldgn22, ld_ldgn23, ld_ldgn24, ld_ldgn25, ld_ldgn26, ld_ldgn27, 
   ld_ldgn28, ld_ldgn29, ld_ldgn30, ld_ldgn31, ld_ldgn32, ld_ldgn33, 
   ld_ldgn34, ld_ldgn35, ld_ldgn36, ld_ldgn37, ld_ldgn38, ld_ldgn39, 
   ld_ldgn40, ld_ldgn41, ld_ldgn42, ld_ldgn43, ld_ldgn44, ld_ldgn45, 
   ld_ldgn46, ld_ldgn47, ld_ldgn48, ld_ldgn49, ld_ldgn50, ld_ldgn51, 
   ld_ldgn52, ld_ldgn53, ld_ldgn54, ld_ldgn55, ld_ldgn56, ld_ldgn57, 
   ld_ldgn58, ld_ldgn59, ld_ldgn60, ld_ldgn61, ld_ldgn62, ld_ldgn63, 
   ld_ldgn64, ld_ldgn65, ld_ldgn66, ld_ldgn67, ld_ldgn68, 
   ld_debug_select, ld_TrainingVector, 
   ld_arb_dout, ld_arb_din, ld_arb_ctrl, ld_arb_debug_vector,
   ld_smx_meta_intr_hld,
`ifdef NEPTUNE
   ld_gpio_dout, ld_gpio_en, ld_gpio_din, 
`else
   ld_smx_intr_clr, ld_smx_config_data, ld_smx_ctrl, ld_smx_debug_vector, 
   ld_smx_intr_status,
`endif
   // Inputs
   niu_clk, fzc_slv_sel_reg, addr, rd, config1, rst_ctl, sys_err_stat,
   sys_err_mask, rtimer, 
   dma_bind0, dma_bind1, dma_bind2, dma_bind3, dma_bind4, dma_bind5, 
   dma_bind6, dma_bind7, dma_bind8, dma_bind9, dma_bind10, 
   dma_bind11, dma_bind12, dma_bind13, dma_bind14, dma_bind15, 
   dma_bind16, dma_bind17, dma_bind18, dma_bind19, dma_bind20, 
   dma_bind21, dma_bind22, dma_bind23, dma_bind24, dma_bind25, 
   dma_bind26, dma_bind27, dma_bind28, dma_bind29, dma_bind30, 
   dma_bind31, dma_bind32, dma_bind33, dma_bind34, dma_bind35, 
   dma_bind36, dma_bind37, dma_bind38, dma_bind39, dma_bind40, 
   dma_bind41, dma_bind42, dma_bind43, dma_bind44, dma_bind45, 
   dma_bind46, dma_bind47, dma_bind48, dma_bind49, dma_bind50, 
   dma_bind51, dma_bind52, dma_bind53, dma_bind54, dma_bind55, 
   dma_bind56, dma_bind57, dma_bind58, dma_bind59, dma_bind60, 
   dma_bind61, dma_bind62, dma_bind63, sid0, sid1, sid2, sid3, sid4, 
   sid5, sid6, sid7, sid8, sid9, sid10, sid11, sid12, sid13, sid14, 
   sid15, sid16, sid17, sid18, sid19, sid20, sid21, sid22, sid23, 
   sid24, sid25, sid26, sid27, sid28, sid29, sid30, sid31, sid32, 
   sid33, sid34, sid35, sid36, sid37, sid38, sid39, sid40, sid41, 
   sid42, sid43, sid44, sid45, sid46, sid47, sid48, sid49, sid50, 
   sid51, sid52, sid53, sid54, sid55, sid56, sid57, sid58, sid59, 
   sid60, sid61, sid62, sid63, ldgn0, ldgn1, ldgn2, ldgn3, ldgn4, 
   ldgn5, ldgn6, ldgn7, ldgn8, ldgn9, ldgn10, ldgn11, ldgn12, ldgn13, 
   ldgn14, ldgn15, ldgn16, ldgn17, ldgn18, ldgn19, ldgn20, ldgn21, 
   ldgn22, ldgn23, ldgn24, ldgn25, ldgn26, ldgn27, ldgn28, ldgn29, 
   ldgn30, ldgn31, ldgn32, ldgn33, ldgn34, ldgn35, ldgn36, ldgn37, 
   ldgn38, ldgn39, ldgn40, ldgn41, ldgn42, ldgn43, ldgn44, ldgn45, 
   ldgn46, ldgn47, ldgn48, ldgn49, ldgn50, ldgn51, ldgn52, ldgn53, 
   ldgn54, ldgn55, ldgn56, ldgn57, ldgn58, ldgn59, ldgn60, ldgn61, 
   ldgn62, ldgn63, ldgn64, ldgn65, ldgn66, ldgn67, ldgn68,
   debug_select, TrainingVector, reset, 
   arb_ctrl, arb_debug_vector, arb_dout, arb_din_int,
   smx_meta_intr_hld, 
`ifdef NEPTUNE
   gpio_dout, gpio_en, gpio_din_int
`else
   smx_intr_clr, smx_config_data, smx_ctrl, smx_debug_vector, 
   smx_intr_status
`endif
   );
   input 		      niu_clk;
   input 		      reset;

   input 		      fzc_slv_sel_reg;
                              // pio broadcast signals
   input [18:0] 	      addr;
   input 		      rd;
   input                      config1;
   input [22:0] 	      rst_ctl;
   input [10:0] 	      sys_err_stat;
   input [10:0] 	      sys_err_mask;
   input [19:0] 	      rtimer;
   input [13:0] 	      dma_bind0 ;
   input [13:0] 	      dma_bind1 ;
   input [13:0] 	      dma_bind2 ;
   input [13:0] 	      dma_bind3 ;
   input [13:0] 	      dma_bind4 ;
   input [13:0] 	      dma_bind5 ;
   input [13:0] 	      dma_bind6 ;
   input [13:0] 	      dma_bind7 ;
   input [13:0] 	      dma_bind8 ;
   input [13:0] 	      dma_bind9 ;
   input [13:0] 	      dma_bind10;
   input [13:0] 	      dma_bind11;
   input [13:0] 	      dma_bind12;
   input [13:0] 	      dma_bind13;
   input [13:0] 	      dma_bind14;
   input [13:0] 	      dma_bind15;
   input [13:0] 	      dma_bind16;
   input [13:0] 	      dma_bind17;
   input [13:0] 	      dma_bind18;
   input [13:0] 	      dma_bind19;
   input [13:0] 	      dma_bind20;
   input [13:0] 	      dma_bind21;
   input [13:0] 	      dma_bind22;
   input [13:0] 	      dma_bind23;
   input [13:0] 	      dma_bind24;
   input [13:0] 	      dma_bind25;
   input [13:0] 	      dma_bind26;
   input [13:0] 	      dma_bind27;
   input [13:0] 	      dma_bind28;
   input [13:0] 	      dma_bind29;
   input [13:0] 	      dma_bind30;
   input [13:0] 	      dma_bind31;
   input [13:0] 	      dma_bind32;
   input [13:0] 	      dma_bind33;
   input [13:0] 	      dma_bind34;
   input [13:0] 	      dma_bind35;
   input [13:0] 	      dma_bind36;
   input [13:0] 	      dma_bind37;
   input [13:0] 	      dma_bind38;
   input [13:0] 	      dma_bind39;
   input [13:0] 	      dma_bind40;
   input [13:0] 	      dma_bind41;
   input [13:0] 	      dma_bind42;
   input [13:0] 	      dma_bind43;
   input [13:0] 	      dma_bind44;
   input [13:0] 	      dma_bind45;
   input [13:0] 	      dma_bind46;
   input [13:0] 	      dma_bind47;
   input [13:0] 	      dma_bind48;
   input [13:0] 	      dma_bind49;
   input [13:0] 	      dma_bind50;
   input [13:0] 	      dma_bind51;
   input [13:0] 	      dma_bind52;
   input [13:0] 	      dma_bind53;
   input [13:0] 	      dma_bind54;
   input [13:0] 	      dma_bind55;
   input [13:0] 	      dma_bind56;
   input [13:0] 	      dma_bind57;
   input [13:0] 	      dma_bind58;
   input [13:0] 	      dma_bind59;
   input [13:0] 	      dma_bind60;
   input [13:0] 	      dma_bind61;
   input [13:0] 	      dma_bind62;
   input [13:0] 	      dma_bind63;   

   input [6:0] 	              sid0 ;
   input [6:0] 	              sid1 ;
   input [6:0] 	              sid2 ;
   input [6:0] 	              sid3 ;
   input [6:0] 	              sid4 ;
   input [6:0] 	              sid5 ;
   input [6:0] 	              sid6 ;
   input [6:0] 	              sid7 ;
   input [6:0] 	              sid8 ;
   input [6:0] 	              sid9 ;
   input [6:0] 	              sid10;
   input [6:0] 	              sid11;
   input [6:0] 	              sid12;
   input [6:0] 	              sid13;
   input [6:0] 	              sid14;
   input [6:0] 	              sid15;
   input [6:0] 	              sid16;
   input [6:0] 	              sid17;
   input [6:0] 	              sid18;
   input [6:0] 	              sid19;
   input [6:0] 	              sid20;
   input [6:0] 	              sid21;
   input [6:0] 	              sid22;
   input [6:0] 	              sid23;
   input [6:0] 	              sid24;
   input [6:0] 	              sid25;
   input [6:0] 	              sid26;
   input [6:0] 	              sid27;
   input [6:0] 	              sid28;
   input [6:0] 	              sid29;
   input [6:0] 	              sid30;
   input [6:0] 	              sid31;
   input [6:0] 	              sid32;
   input [6:0] 	              sid33;
   input [6:0] 	              sid34;
   input [6:0] 	              sid35;
   input [6:0] 	              sid36;
   input [6:0] 	              sid37;
   input [6:0] 	              sid38;
   input [6:0] 	              sid39;
   input [6:0] 	              sid40;
   input [6:0] 	              sid41;
   input [6:0] 	              sid42;
   input [6:0] 	              sid43;
   input [6:0] 	              sid44;
   input [6:0] 	              sid45;
   input [6:0] 	              sid46;
   input [6:0] 	              sid47;
   input [6:0] 	              sid48;
   input [6:0] 	              sid49;
   input [6:0] 	              sid50;
   input [6:0] 	              sid51;
   input [6:0] 	              sid52;
   input [6:0] 	              sid53;
   input [6:0] 	              sid54;
   input [6:0] 	              sid55;
   input [6:0] 	              sid56;
   input [6:0] 	              sid57;
   input [6:0] 	              sid58;
   input [6:0] 	              sid59;
   input [6:0] 	              sid60;
   input [6:0] 	              sid61;
   input [6:0] 	              sid62;
   input [6:0] 	              sid63;
   
   input [5:0] 	              ldgn0 ;
   input [5:0] 	              ldgn1 ;
   input [5:0] 	              ldgn2 ;
   input [5:0] 	              ldgn3 ;
   input [5:0] 	              ldgn4 ;
   input [5:0] 	              ldgn5 ;
   input [5:0] 	              ldgn6 ;
   input [5:0] 	              ldgn7 ;
   input [5:0] 	              ldgn8 ;
   input [5:0] 	              ldgn9 ;
   input [5:0] 	              ldgn10;
   input [5:0] 	              ldgn11;
   input [5:0] 	              ldgn12;
   input [5:0] 	              ldgn13;
   input [5:0] 	              ldgn14;
   input [5:0] 	              ldgn15;
   input [5:0] 	              ldgn16;
   input [5:0] 	              ldgn17;
   input [5:0] 	              ldgn18;
   input [5:0] 	              ldgn19;
   input [5:0] 	              ldgn20;
   input [5:0] 	              ldgn21;
   input [5:0] 	              ldgn22;
   input [5:0] 	              ldgn23;
   input [5:0] 	              ldgn24;
   input [5:0] 	              ldgn25;
   input [5:0] 	              ldgn26;
   input [5:0] 	              ldgn27;
   input [5:0] 	              ldgn28;
   input [5:0] 	              ldgn29;
   input [5:0] 	              ldgn30;
   input [5:0] 	              ldgn31;
   input [5:0] 	              ldgn32;
   input [5:0] 	              ldgn33;
   input [5:0] 	              ldgn34;
   input [5:0] 	              ldgn35;
   input [5:0] 	              ldgn36;
   input [5:0] 	              ldgn37;
   input [5:0] 	              ldgn38;
   input [5:0] 	              ldgn39;
   input [5:0] 	              ldgn40;
   input [5:0] 	              ldgn41;
   input [5:0] 	              ldgn42;
   input [5:0] 	              ldgn43;
   input [5:0] 	              ldgn44;
   input [5:0] 	              ldgn45;
   input [5:0] 	              ldgn46;
   input [5:0] 	              ldgn47;
   input [5:0] 	              ldgn48;
   input [5:0] 	              ldgn49;
   input [5:0] 	              ldgn50;
   input [5:0] 	              ldgn51;
   input [5:0] 	              ldgn52;
   input [5:0] 	              ldgn53;
   input [5:0] 	              ldgn54;
   input [5:0] 	              ldgn55;
   input [5:0] 	              ldgn56;
   input [5:0] 	              ldgn57;
   input [5:0] 	              ldgn58;
   input [5:0] 	              ldgn59;
   input [5:0] 	              ldgn60;
   input [5:0] 	              ldgn61;
   input [5:0] 	              ldgn62;
   input [5:0] 	              ldgn63;
   input [5:0] 	              ldgn64;
   input [5:0] 	              ldgn65;
   input [5:0] 	              ldgn66;
   input [5:0] 	              ldgn67;
   input [5:0] 	              ldgn68;

   output 		      fzc_slv_ack;
   output [63:0] 	      fzc_slv_rdata;
   output 		      fzc_slv_err;
                              //
   output 		      ld_config1;
   output 		      ld_sys_err_mask;
   output 		      ld_sys_err_stat;
   output 		      ld_rst_ctl;
   output 		      ld_rtimer;
   
   output  		      ld_dma_bind0 ;
   output  		      ld_dma_bind1 ;
   output  		      ld_dma_bind2 ;
   output  		      ld_dma_bind3 ;
   output  		      ld_dma_bind4 ;
   output  		      ld_dma_bind5 ;
   output  		      ld_dma_bind6 ;
   output  		      ld_dma_bind7 ;
   output  		      ld_dma_bind8 ;
   output  		      ld_dma_bind9 ;
   output  		      ld_dma_bind10;
   output  		      ld_dma_bind11;
   output  		      ld_dma_bind12;
   output  		      ld_dma_bind13;
   output  		      ld_dma_bind14;
   output  		      ld_dma_bind15;
   output  		      ld_dma_bind16;
   output  		      ld_dma_bind17;
   output  		      ld_dma_bind18;
   output  		      ld_dma_bind19;
   output  		      ld_dma_bind20;
   output  		      ld_dma_bind21;
   output  		      ld_dma_bind22;
   output  		      ld_dma_bind23;
   output  		      ld_dma_bind24;
   output  		      ld_dma_bind25;
   output  		      ld_dma_bind26;
   output  		      ld_dma_bind27;
   output  		      ld_dma_bind28;
   output  		      ld_dma_bind29;
   output  		      ld_dma_bind30;
   output  		      ld_dma_bind31;
   output  		      ld_dma_bind32;
   output  		      ld_dma_bind33;
   output  		      ld_dma_bind34;
   output  		      ld_dma_bind35;
   output  		      ld_dma_bind36;
   output  		      ld_dma_bind37;
   output  		      ld_dma_bind38;
   output  		      ld_dma_bind39;
   output  		      ld_dma_bind40;
   output  		      ld_dma_bind41;
   output  		      ld_dma_bind42;
   output  		      ld_dma_bind43;
   output  		      ld_dma_bind44;
   output  		      ld_dma_bind45;
   output  		      ld_dma_bind46;
   output  		      ld_dma_bind47;
   output  		      ld_dma_bind48;
   output  		      ld_dma_bind49;
   output  		      ld_dma_bind50;
   output  		      ld_dma_bind51;
   output  		      ld_dma_bind52;
   output  		      ld_dma_bind53;
   output  		      ld_dma_bind54;
   output  		      ld_dma_bind55;
   output  		      ld_dma_bind56;
   output  		      ld_dma_bind57;
   output  		      ld_dma_bind58;
   output  		      ld_dma_bind59;
   output  		      ld_dma_bind60;
   output  		      ld_dma_bind61;
   output  		      ld_dma_bind62;
   output  		      ld_dma_bind63;   

   output		      ld_sid0 ;
   output		      ld_sid1 ;
   output		      ld_sid2 ;
   output		      ld_sid3 ;
   output		      ld_sid4 ;
   output		      ld_sid5 ;
   output		      ld_sid6 ;
   output		      ld_sid7 ;
   output		      ld_sid8 ;
   output		      ld_sid9 ;
   output		      ld_sid10;
   output		      ld_sid11;
   output		      ld_sid12;
   output		      ld_sid13;
   output		      ld_sid14;
   output		      ld_sid15;
   output		      ld_sid16;
   output		      ld_sid17;
   output		      ld_sid18;
   output		      ld_sid19;
   output		      ld_sid20;
   output		      ld_sid21;
   output		      ld_sid22;
   output		      ld_sid23;
   output		      ld_sid24;
   output		      ld_sid25;
   output		      ld_sid26;
   output		      ld_sid27;
   output		      ld_sid28;
   output		      ld_sid29;
   output		      ld_sid30;
   output		      ld_sid31;
   output		      ld_sid32;
   output		      ld_sid33;
   output		      ld_sid34;
   output		      ld_sid35;
   output		      ld_sid36;
   output		      ld_sid37;
   output		      ld_sid38;
   output		      ld_sid39;
   output		      ld_sid40;
   output		      ld_sid41;
   output		      ld_sid42;
   output		      ld_sid43;
   output		      ld_sid44;
   output		      ld_sid45;
   output		      ld_sid46;
   output		      ld_sid47;
   output		      ld_sid48;
   output		      ld_sid49;
   output		      ld_sid50;
   output		      ld_sid51;
   output		      ld_sid52;
   output		      ld_sid53;
   output		      ld_sid54;
   output		      ld_sid55;
   output		      ld_sid56;
   output		      ld_sid57;
   output		      ld_sid58;
   output		      ld_sid59;
   output		      ld_sid60;
   output		      ld_sid61;
   output		      ld_sid62;
   output		      ld_sid63;

   output 	 	      ld_ldgn0 ;
   output 		      ld_ldgn1 ;
   output 		      ld_ldgn2 ;
   output 		      ld_ldgn3 ;
   output 		      ld_ldgn4 ;
   output 		      ld_ldgn5 ;
   output 		      ld_ldgn6 ;
   output 		      ld_ldgn7 ;
   output 		      ld_ldgn8 ;
   output 		      ld_ldgn9 ;
   output 		      ld_ldgn10;
   output 		      ld_ldgn11;
   output 		      ld_ldgn12;
   output 		      ld_ldgn13;
   output 		      ld_ldgn14;
   output 		      ld_ldgn15;
   output 		      ld_ldgn16;
   output 		      ld_ldgn17;
   output 		      ld_ldgn18;
   output 		      ld_ldgn19;
   output 		      ld_ldgn20;
   output 		      ld_ldgn21;
   output 		      ld_ldgn22;
   output 		      ld_ldgn23;
   output 		      ld_ldgn24;
   output 		      ld_ldgn25;
   output 		      ld_ldgn26;
   output 		      ld_ldgn27;
   output 		      ld_ldgn28;
   output 		      ld_ldgn29;
   output 		      ld_ldgn30;
   output 		      ld_ldgn31;
   output 		      ld_ldgn32;
   output 		      ld_ldgn33;
   output 		      ld_ldgn34;
   output 		      ld_ldgn35;
   output 		      ld_ldgn36;
   output 		      ld_ldgn37;
   output 		      ld_ldgn38;
   output 		      ld_ldgn39;
   output 		      ld_ldgn40;
   output 		      ld_ldgn41;
   output 		      ld_ldgn42;
   output 		      ld_ldgn43;
   output 		      ld_ldgn44;
   output 		      ld_ldgn45;
   output 		      ld_ldgn46;
   output 		      ld_ldgn47;
   output 		      ld_ldgn48;
   output 		      ld_ldgn49;
   output 		      ld_ldgn50;
   output 		      ld_ldgn51;
   output 		      ld_ldgn52;
   output 		      ld_ldgn53;
   output 		      ld_ldgn54;
   output 		      ld_ldgn55;
   output 		      ld_ldgn56;
   output 		      ld_ldgn57;
   output 		      ld_ldgn58;
   output 		      ld_ldgn59;
   output 		      ld_ldgn60;
   output 		      ld_ldgn61;
   output 		      ld_ldgn62;
   output 		      ld_ldgn63;
   output 		      ld_ldgn64;
   output 		      ld_ldgn65;
   output 		      ld_ldgn66;
   output 		      ld_ldgn67;
   output 		      ld_ldgn68;

   input [5:0] 	              debug_select ;
   output 		      ld_debug_select ;

   input [31:0]               TrainingVector ;
   output 		      ld_TrainingVector ;

   output 		      ld_arb_dout ;
   output 		      ld_arb_din ;
   output 		      ld_arb_ctrl ;
   output 		      ld_arb_debug_vector ;
   output 		      ld_smx_meta_intr_hld ;
   input [31:0]               arb_ctrl ;
   input [31:0]               arb_debug_vector ;
   input [31:0]               arb_dout ;
   input [31:0]               arb_din_int ;
   input                      smx_meta_intr_hld ;

`ifdef NEPTUNE
   output        	      ld_gpio_dout ;
   output        	      ld_gpio_en ;
   output        	      ld_gpio_din ;
   input [15:0]               gpio_dout ;
   input [15:0]               gpio_en ;
   input [15:0]               gpio_din_int ;
`else
   input  [31:0] 	      smx_config_data ;
   input  [31:0] 	      smx_intr_status ;
   input  [31:0] 	      smx_ctrl ;
   input  [31:0] 	      smx_debug_vector ;
   input        	      smx_intr_clr ;
   output 		      ld_smx_config_data ;
   output 		      ld_smx_ctrl ;
   output 		      ld_smx_debug_vector ;
   output 		      ld_smx_intr_clr ;
   output 		      ld_smx_intr_status ;
`endif
   
// common reg declaration
   reg [63:0] 		      rd_data;
   reg 			      non_qualified_addr_err;
// common wrie declaration
   wire [63:0] 		      fzc_slv_rdata;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      rasr;
// output reg declaration
   reg 			      ld_config1;
   reg 			      ld_sys_err_mask;
   reg 			      ld_sys_err_stat;
   reg 			      ld_rst_ctl;
   reg 			      ld_rtimer;
   reg  		      ld_dma_bind0 ;
   reg  		      ld_dma_bind1 ;
   reg  		      ld_dma_bind2 ;
   reg  		      ld_dma_bind3 ;
   reg  		      ld_dma_bind4 ;
   reg  		      ld_dma_bind5 ;
   reg  		      ld_dma_bind6 ;
   reg  		      ld_dma_bind7 ;
   reg  		      ld_dma_bind8 ;
   reg  		      ld_dma_bind9 ;
   reg  		      ld_dma_bind10;
   reg  		      ld_dma_bind11;
   reg  		      ld_dma_bind12;
   reg  		      ld_dma_bind13;
   reg  		      ld_dma_bind14;
   reg  		      ld_dma_bind15;
   reg  		      ld_dma_bind16;
   reg  		      ld_dma_bind17;
   reg  		      ld_dma_bind18;
   reg  		      ld_dma_bind19;
   reg  		      ld_dma_bind20;
   reg  		      ld_dma_bind21;
   reg  		      ld_dma_bind22;
   reg  		      ld_dma_bind23;
   reg  		      ld_dma_bind24;
   reg  		      ld_dma_bind25;
   reg  		      ld_dma_bind26;
   reg  		      ld_dma_bind27;
   reg  		      ld_dma_bind28;
   reg  		      ld_dma_bind29;
   reg  		      ld_dma_bind30;
   reg  		      ld_dma_bind31;
   reg  		      ld_dma_bind32;
   reg  		      ld_dma_bind33;
   reg  		      ld_dma_bind34;
   reg  		      ld_dma_bind35;
   reg  		      ld_dma_bind36;
   reg  		      ld_dma_bind37;
   reg  		      ld_dma_bind38;
   reg  		      ld_dma_bind39;
   reg  		      ld_dma_bind40;
   reg  		      ld_dma_bind41;
   reg  		      ld_dma_bind42;
   reg  		      ld_dma_bind43;
   reg  		      ld_dma_bind44;
   reg  		      ld_dma_bind45;
   reg  		      ld_dma_bind46;
   reg  		      ld_dma_bind47;
   reg  		      ld_dma_bind48;
   reg  		      ld_dma_bind49;
   reg  		      ld_dma_bind50;
   reg  		      ld_dma_bind51;
   reg  		      ld_dma_bind52;
   reg  		      ld_dma_bind53;
   reg  		      ld_dma_bind54;
   reg  		      ld_dma_bind55;
   reg  		      ld_dma_bind56;
   reg  		      ld_dma_bind57;
   reg  		      ld_dma_bind58;
   reg  		      ld_dma_bind59;
   reg  		      ld_dma_bind60;
   reg  		      ld_dma_bind61;
   reg  		      ld_dma_bind62;
   reg  		      ld_dma_bind63;   

   reg 			      ld_sid0 ;
   reg 			      ld_sid1 ;
   reg 			      ld_sid2 ;
   reg 			      ld_sid3 ;
   reg 			      ld_sid4 ;
   reg 			      ld_sid5 ;
   reg 			      ld_sid6 ;
   reg 			      ld_sid7 ;
   reg 			      ld_sid8 ;
   reg 			      ld_sid9 ;
   reg 			      ld_sid10;
   reg 			      ld_sid11;
   reg 			      ld_sid12;
   reg 			      ld_sid13;
   reg 			      ld_sid14;
   reg 			      ld_sid15;
   reg 			      ld_sid16;
   reg 			      ld_sid17;
   reg 			      ld_sid18;
   reg 			      ld_sid19;
   reg 			      ld_sid20;
   reg 			      ld_sid21;
   reg 			      ld_sid22;
   reg 			      ld_sid23;
   reg 			      ld_sid24;
   reg 			      ld_sid25;
   reg 			      ld_sid26;
   reg 			      ld_sid27;
   reg 			      ld_sid28;
   reg 			      ld_sid29;
   reg 			      ld_sid30;
   reg 			      ld_sid31;
   reg 			      ld_sid32;
   reg 			      ld_sid33;
   reg 			      ld_sid34;
   reg 			      ld_sid35;
   reg 			      ld_sid36;
   reg 			      ld_sid37;
   reg 			      ld_sid38;
   reg 			      ld_sid39;
   reg 			      ld_sid40;
   reg 			      ld_sid41;
   reg 			      ld_sid42;
   reg 			      ld_sid43;
   reg 			      ld_sid44;
   reg 			      ld_sid45;
   reg 			      ld_sid46;
   reg 			      ld_sid47;
   reg 			      ld_sid48;
   reg 			      ld_sid49;
   reg 			      ld_sid50;
   reg 			      ld_sid51;
   reg 			      ld_sid52;
   reg 			      ld_sid53;
   reg 			      ld_sid54;
   reg 			      ld_sid55;
   reg 			      ld_sid56;
   reg 			      ld_sid57;
   reg 			      ld_sid58;
   reg 			      ld_sid59;
   reg 			      ld_sid60;
   reg 			      ld_sid61;
   reg 			      ld_sid62;
   reg 			      ld_sid63;

   reg 	 		      ld_ldgn0 ;
   reg 			      ld_ldgn1 ;
   reg 			      ld_ldgn2 ;
   reg 			      ld_ldgn3 ;
   reg 			      ld_ldgn4 ;
   reg 			      ld_ldgn5 ;
   reg 			      ld_ldgn6 ;
   reg 			      ld_ldgn7 ;
   reg 			      ld_ldgn8 ;
   reg 			      ld_ldgn9 ;
   reg 			      ld_ldgn10;
   reg 			      ld_ldgn11;
   reg 			      ld_ldgn12;
   reg 			      ld_ldgn13;
   reg 			      ld_ldgn14;
   reg 			      ld_ldgn15;
   reg 			      ld_ldgn16;
   reg 			      ld_ldgn17;
   reg 			      ld_ldgn18;
   reg 			      ld_ldgn19;
   reg 			      ld_ldgn20;
   reg 			      ld_ldgn21;
   reg 			      ld_ldgn22;
   reg 			      ld_ldgn23;
   reg 			      ld_ldgn24;
   reg 			      ld_ldgn25;
   reg 			      ld_ldgn26;
   reg 			      ld_ldgn27;
   reg 			      ld_ldgn28;
   reg 			      ld_ldgn29;
   reg 			      ld_ldgn30;
   reg 			      ld_ldgn31;
   reg 			      ld_ldgn32;
   reg 			      ld_ldgn33;
   reg 			      ld_ldgn34;
   reg 			      ld_ldgn35;
   reg 			      ld_ldgn36;
   reg 			      ld_ldgn37;
   reg 			      ld_ldgn38;
   reg 			      ld_ldgn39;
   reg 			      ld_ldgn40;
   reg 			      ld_ldgn41;
   reg 			      ld_ldgn42;
   reg 			      ld_ldgn43;
   reg 			      ld_ldgn44;
   reg 			      ld_ldgn45;
   reg 			      ld_ldgn46;
   reg 			      ld_ldgn47;
   reg 			      ld_ldgn48;
   reg 			      ld_ldgn49;
   reg 			      ld_ldgn50;
   reg 			      ld_ldgn51;
   reg 			      ld_ldgn52;
   reg 			      ld_ldgn53;
   reg 			      ld_ldgn54;
   reg 			      ld_ldgn55;
   reg 			      ld_ldgn56;
   reg 			      ld_ldgn57;
   reg 			      ld_ldgn58;
   reg 			      ld_ldgn59;
   reg 			      ld_ldgn60;
   reg 			      ld_ldgn61;
   reg 			      ld_ldgn62;
   reg 			      ld_ldgn63;
   reg 			      ld_ldgn64;
   reg 			      ld_ldgn65;
   reg 			      ld_ldgn66;
   reg 			      ld_ldgn67;
   reg 			      ld_ldgn68;
   reg 			      ld_debug_select;
   reg 			      ld_TrainingVector;
   reg 			      ld_arb_dout;
   reg 			      ld_arb_din;
   reg 			      ld_arb_ctrl;
   reg 			      ld_arb_debug_vector;
   reg 			      ld_smx_meta_intr_hld;

`ifdef NEPTUNE
   reg 			      ld_gpio_dout;
   reg 			      ld_gpio_din;
   reg 			      ld_gpio_en;
`else
   reg 			      ld_smx_config_data;
   reg 			      ld_smx_ctrl;
   reg 			      ld_smx_debug_vector;
   reg 			      ld_smx_intr_clr;
   reg 			      ld_smx_intr_status;
`endif

`ifdef NEPTUNE
/* ---------------------------------------------------------- */
   reg				fzc_slv_sel_reg_int;
   reg				rd_int;
   reg [18:0]			addr_int;

always @(posedge niu_clk)
 if (reset)
  begin
   fzc_slv_sel_reg_int  <= 1'b0;
   rd_int		<= 1'b0;
   addr_int		<= 19'b0;
  end
 else
  begin
   fzc_slv_sel_reg_int  <= fzc_slv_sel_reg ;
   rd_int		<= rd ;
   addr_int		<= addr;
  end

`else
/* ---------------------------------------------------------- */

   wire				fzc_slv_sel_reg_int;
   wire				rd_int;
   wire [18:0]			addr_int;

   assign fzc_slv_sel_reg_int   = fzc_slv_sel_reg ;
   assign rd_int		= rd ;
   assign addr_int		= addr ;
/* ----------------------------------------------------------- */
`endif


niu_rw_ctl fzc_slv_rw_ctl(
		      // Outputs
		      .wr_en		(wr_en),
		      .rd_en		(rd_en),
		      .ack		(fzc_slv_ack),
		      .rdata		(fzc_slv_rdata[63:0]),
		      .err		(fzc_slv_err),
		      .rasr		(rasr),
		      // Inputs
		      .clk		(niu_clk),
		      .sel		(fzc_slv_sel_reg_int),
		      .rd		(rd_int),
		      .rd_data		(rd_data[63:0]),
		      .non_qualified_addr_err(non_qualified_addr_err));

always @ (/*AUTOSENSE*/addr_int or config1 
          or rst_ctl  or sys_err_stat or sys_err_mask
          or dma_bind0 or dma_bind1
	  or dma_bind10 or dma_bind11 or dma_bind12 or dma_bind13
	  or dma_bind14 or dma_bind15 or dma_bind16 or dma_bind17
	  or dma_bind18 or dma_bind19 or dma_bind2 or dma_bind20
	  or dma_bind21 or dma_bind22 or dma_bind23 or dma_bind24
	  or dma_bind25 or dma_bind26 or dma_bind27 or dma_bind28
	  or dma_bind29 or dma_bind3 or dma_bind30 or dma_bind31
	  or dma_bind32 or dma_bind33 or dma_bind34 or dma_bind35
	  or dma_bind36 or dma_bind37 or dma_bind38 or dma_bind39
	  or dma_bind4 or dma_bind40 or dma_bind41 or dma_bind42
	  or dma_bind43 or dma_bind44 or dma_bind45 or dma_bind46
	  or dma_bind47 or dma_bind48 or dma_bind49 or dma_bind5
	  or dma_bind50 or dma_bind51 or dma_bind52 or dma_bind53
	  or dma_bind54 or dma_bind55 or dma_bind56 or dma_bind57
	  or dma_bind58 or dma_bind59 or dma_bind6 or dma_bind60
	  or dma_bind61 or dma_bind62 or dma_bind63 or dma_bind7
	  or dma_bind8 or dma_bind9 or ldgn0 or ldgn1 or ldgn10
	  or ldgn11 or ldgn12 or ldgn13 or ldgn14 or ldgn15 or ldgn16
	  or ldgn17 or ldgn18 or ldgn19 or ldgn2 or ldgn20 or ldgn21
	  or ldgn22 or ldgn23 or ldgn24 or ldgn25 or ldgn26 or ldgn27
	  or ldgn28 or ldgn29 or ldgn3 or ldgn30 or ldgn31 or ldgn32
	  or ldgn33 or ldgn34 or ldgn35 or ldgn36 or ldgn37 or ldgn38
	  or ldgn39 or ldgn4 or ldgn40 or ldgn41 or ldgn42 or ldgn43
	  or ldgn44 or ldgn45 or ldgn46 or ldgn47 or ldgn48 or ldgn49
	  or ldgn5 or ldgn50 or ldgn51 or ldgn52 or ldgn53 or ldgn54
	  or ldgn55 or ldgn56 or ldgn57 or ldgn58 or ldgn59 or ldgn6
	  or ldgn60 or ldgn61 or ldgn62 or ldgn63 or ldgn64 or ldgn65
	  or ldgn66 or ldgn67 or ldgn68 or ldgn7 or ldgn8 or ldgn9
	  or rtimer or sid0 or sid1 or sid10 or sid11 or sid12
	  or sid13 or sid14 or sid15 or sid16 or sid17 or sid18
	  or sid19 or sid2 or sid20 or sid21 or sid22 or sid23
	  or sid24 or sid25 or sid26 or sid27 or sid28 or sid29
	  or sid3 or sid30 or sid31 or sid32 or sid33 or sid34
	  or sid35 or sid36 or sid37 or sid38 or sid39 or sid4
	  or sid40 or sid41 or sid42 or sid43 or sid44 or sid45
	  or sid46 or sid47 or sid48 or sid49 or sid5 or sid50
	  or sid51 or sid52 or sid53 or sid54 or sid55 or sid56
	  or sid57 or sid58 or sid59 or sid6 or sid60 or sid61
	  or sid62 or sid63 or sid7 or sid8 or sid9 or wr_en
          or debug_select[5:0] or TrainingVector[31:0] 
          or arb_ctrl[31:0] or arb_debug_vector[31:0]
          or arb_dout[31:0] or arb_din_int[31:0]
          or smx_meta_intr_hld or rd_int
`ifdef NEPTUNE
          or gpio_dout[15:0] or gpio_en[15:0] or gpio_din_int[15:0]
`else
          or smx_intr_clr or smx_config_data or smx_intr_status or smx_ctrl or 
             smx_debug_vector
`endif
          )
  begin
                  non_qualified_addr_err = 0;
                  rd_data            = 64'hdead_beef_dead_beef;
                  ld_config1         = 0;
                  ld_sys_err_mask    = 0;
                  ld_sys_err_stat    = 0;
                  ld_rst_ctl         = 0;
                  ld_rtimer          = 0;
                  ld_dma_bind0       = 0;
                  ld_dma_bind1       = 0;
                  ld_dma_bind2       = 0;
                  ld_dma_bind3       = 0;
                  ld_dma_bind4       = 0;
                  ld_dma_bind5       = 0;
                  ld_dma_bind6       = 0;
                  ld_dma_bind7       = 0;
                  ld_dma_bind8       = 0;
                  ld_dma_bind9       = 0;
                  ld_dma_bind10      = 0;
                  ld_dma_bind11      = 0;
                  ld_dma_bind12      = 0;
                  ld_dma_bind13      = 0;
                  ld_dma_bind14      = 0;
                  ld_dma_bind15      = 0;
                  ld_dma_bind16      = 0;
                  ld_dma_bind17      = 0;
                  ld_dma_bind18      = 0;
                  ld_dma_bind19      = 0;
                  ld_dma_bind20      = 0;
                  ld_dma_bind21      = 0;
                  ld_dma_bind22      = 0;
                  ld_dma_bind23      = 0;
                  ld_dma_bind24      = 0;
                  ld_dma_bind25      = 0;
                  ld_dma_bind26      = 0;
                  ld_dma_bind27      = 0;
                  ld_dma_bind28      = 0;
                  ld_dma_bind29      = 0;
                  ld_dma_bind30      = 0;
                  ld_dma_bind31      = 0;
                  ld_dma_bind32      = 0;
                  ld_dma_bind33      = 0;
                  ld_dma_bind34      = 0;
                  ld_dma_bind35      = 0;
                  ld_dma_bind36      = 0;
                  ld_dma_bind37      = 0;
                  ld_dma_bind38      = 0;
                  ld_dma_bind39      = 0;
                  ld_dma_bind40      = 0;
                  ld_dma_bind41      = 0;
                  ld_dma_bind42      = 0;
                  ld_dma_bind43      = 0;
                  ld_dma_bind44      = 0;
                  ld_dma_bind45      = 0;
                  ld_dma_bind46      = 0;
                  ld_dma_bind47      = 0;
                  ld_dma_bind48      = 0;
                  ld_dma_bind49      = 0;
                  ld_dma_bind50      = 0;
                  ld_dma_bind51      = 0;
                  ld_dma_bind52      = 0;
                  ld_dma_bind53      = 0;
                  ld_dma_bind54      = 0;
                  ld_dma_bind55      = 0;
                  ld_dma_bind56      = 0;
                  ld_dma_bind57      = 0;
                  ld_dma_bind58      = 0;
                  ld_dma_bind59      = 0;
                  ld_dma_bind60      = 0;
                  ld_dma_bind61      = 0;
                  ld_dma_bind62      = 0;
                  ld_dma_bind63      = 0;
     
                  ld_sid0            = 0;
                  ld_sid1            = 0;
                  ld_sid2            = 0;
                  ld_sid3            = 0;
                  ld_sid4            = 0;
                  ld_sid5            = 0;
                  ld_sid6            = 0;
                  ld_sid7            = 0;
                  ld_sid8            = 0;
                  ld_sid9            = 0;
                  ld_sid10           = 0;
                  ld_sid11           = 0;
                  ld_sid12           = 0;
                  ld_sid13           = 0;
                  ld_sid14           = 0;
                  ld_sid15           = 0;
                  ld_sid16           = 0;
                  ld_sid17           = 0;
                  ld_sid18           = 0;
                  ld_sid19           = 0;
                  ld_sid20           = 0;
                  ld_sid21           = 0;
                  ld_sid22           = 0;
                  ld_sid23           = 0;
                  ld_sid24           = 0;
                  ld_sid25           = 0;
                  ld_sid26           = 0;
                  ld_sid27           = 0;
                  ld_sid28           = 0;
                  ld_sid29           = 0;
                  ld_sid30           = 0;
                  ld_sid31           = 0;
                  ld_sid32           = 0;
                  ld_sid33           = 0;
                  ld_sid34           = 0;
                  ld_sid35           = 0;
                  ld_sid36           = 0;
                  ld_sid37           = 0;
                  ld_sid38           = 0;
                  ld_sid39           = 0;
                  ld_sid40           = 0;
                  ld_sid41           = 0;
                  ld_sid42           = 0;
                  ld_sid43           = 0;
                  ld_sid44           = 0;
                  ld_sid45           = 0;
                  ld_sid46           = 0;
                  ld_sid47           = 0;
                  ld_sid48           = 0;
                  ld_sid49           = 0;
                  ld_sid50           = 0;
                  ld_sid51           = 0;
                  ld_sid52           = 0;
                  ld_sid53           = 0;
                  ld_sid54           = 0;
                  ld_sid55           = 0;
                  ld_sid56           = 0;
                  ld_sid57           = 0;
                  ld_sid58           = 0;
                  ld_sid59           = 0;
                  ld_sid60           = 0;
                  ld_sid61           = 0;
                  ld_sid62           = 0;
                  ld_sid63           = 0;

                  ld_ldgn0           = 0;
                  ld_ldgn1           = 0;
                  ld_ldgn2           = 0;
                  ld_ldgn3           = 0;
                  ld_ldgn4           = 0;
                  ld_ldgn5           = 0;
                  ld_ldgn6           = 0;
                  ld_ldgn7           = 0;
                  ld_ldgn8           = 0;
                  ld_ldgn9           = 0;
                  ld_ldgn10          = 0;
                  ld_ldgn11          = 0;
                  ld_ldgn12          = 0;
                  ld_ldgn13          = 0;
                  ld_ldgn14          = 0;
                  ld_ldgn15          = 0;
                  ld_ldgn16          = 0;
                  ld_ldgn17          = 0;
                  ld_ldgn18          = 0;
                  ld_ldgn19          = 0;
                  ld_ldgn20          = 0;
                  ld_ldgn21          = 0;
                  ld_ldgn22          = 0;
                  ld_ldgn23          = 0;
                  ld_ldgn24          = 0;
                  ld_ldgn25          = 0;
                  ld_ldgn26          = 0;
                  ld_ldgn27          = 0;
                  ld_ldgn28          = 0;
                  ld_ldgn29          = 0;
                  ld_ldgn30          = 0;
                  ld_ldgn31          = 0;
                  ld_ldgn32          = 0;
                  ld_ldgn33          = 0;
                  ld_ldgn34          = 0;
                  ld_ldgn35          = 0;
                  ld_ldgn36          = 0;
                  ld_ldgn37          = 0;
                  ld_ldgn38          = 0;
                  ld_ldgn39          = 0;
                  ld_ldgn40          = 0;
                  ld_ldgn41          = 0;
                  ld_ldgn42          = 0;
                  ld_ldgn43          = 0;
                  ld_ldgn44          = 0;
                  ld_ldgn45          = 0;
                  ld_ldgn46          = 0;
                  ld_ldgn47          = 0;
                  ld_ldgn48          = 0;
                  ld_ldgn49          = 0;
                  ld_ldgn50          = 0;
                  ld_ldgn51          = 0;
                  ld_ldgn52          = 0;
                  ld_ldgn53          = 0;
                  ld_ldgn54          = 0;
                  ld_ldgn55          = 0;
                  ld_ldgn56          = 0;
                  ld_ldgn57          = 0;
                  ld_ldgn58          = 0;
                  ld_ldgn59          = 0;
                  ld_ldgn60          = 0;
                  ld_ldgn61          = 0;
                  ld_ldgn62          = 0;
                  ld_ldgn63          = 0;
                  ld_ldgn64          = 0;
                  ld_ldgn65          = 0;
                  ld_ldgn66          = 0;
                  ld_ldgn67          = 0;
                  ld_ldgn68          = 0;
                  ld_arb_dout        = 0;
                  ld_arb_din         = 0;
                ld_smx_meta_intr_hld = 0;

`ifdef NEPTUNE
                  ld_gpio_dout       = 0;
                  ld_gpio_en         = 0;
                  ld_gpio_din        = 0;
`else
                  ld_smx_config_data = 0;
                  ld_smx_ctrl        = 0;
                  ld_smx_debug_vector= 0;
                  ld_smx_intr_clr    = 0;
                  ld_smx_intr_status = 0;
`endif
                  ld_debug_select    = 0;
                  ld_TrainingVector  = 0;
                  ld_arb_ctrl        = 0;
                  ld_arb_debug_vector= 0;


 // case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case 
    case({addr_int[18:3],3'b0}) //synopsys parallel_case full_case infer_mux

    19'h0_0000: begin
                  ld_config1         = wr_en;
                  rd_data            = {63'b0,config1};
                end

    19'h0_0038: begin
                  ld_rst_ctl         = wr_en;
                  rd_data            = {41'b0,rst_ctl};
                end

    19'h0_0090: begin
                  ld_sys_err_mask    = wr_en;
                  rd_data            = {53'b0,sys_err_mask[10:0]};
                end

    19'h0_0098: begin
                  ld_sys_err_stat    = rd_int;
                  rd_data            = {53'b0,sys_err_stat[10:0]};
                end
                // resolution timer
    19'h0_0008: begin
                  ld_rtimer          = wr_en;
                  rd_data            = {44'b0,rtimer};
                end
//    *****************************************************************

                // Meta Arb Data Out Register
    19'h0_0010: begin
                  ld_arb_dout        = wr_en;
                  rd_data            = {32'b0,arb_dout[31:0]};
                end

                // Meta Arb Data In Register
    19'h0_0018: begin
                  ld_arb_din         = 1'b1;
                  rd_data            = {32'b0,arb_din_int[31:0]};
                end

`ifdef NEPTUNE
//    *****************************************************************
                // GPIO Data Out Register
    19'h0_0020: begin
                  ld_gpio_dout       = wr_en;
                  rd_data            = {48'b0,gpio_dout[15:0]};
                end

                // GPIO Enable Register
    19'h0_0028: begin
                  ld_gpio_en         = wr_en;
                  rd_data            = {48'b0,gpio_en[15:0]};
                end

                // GPIO Data In Register
    19'h0_0030: begin
                  ld_gpio_din        = 1'b1;
                  rd_data            = {48'b0,gpio_din_int[15:0]};
                end

`else
//    *****************************************************************
                // SMx Register
    19'h0_0040: begin
                  ld_smx_config_data = wr_en;
                  rd_data            = {32'b0,smx_config_data};
                end

    19'h0_0048: begin
                  ld_smx_intr_status = rd_int ;
                  rd_data            = {32'b0,smx_intr_status};
                end

    19'h0_0050: begin
                  ld_smx_ctrl        = wr_en ;
                  rd_data            = {32'b0,smx_ctrl};
                end

    19'h0_0058: begin
                  ld_smx_debug_vector= wr_en ;
                  rd_data            = {32'b0,smx_debug_vector};
                end

    19'h0_00a0: begin
                  ld_smx_intr_clr      = wr_en;
                  rd_data              = {63'b0, smx_intr_clr};
                end
  
`endif

//    *****************************************************************

    19'h0_0060: begin
                  ld_debug_select    = wr_en;
                  rd_data            = {58'b0,debug_select[5:0]};
                end
  
    19'h0_0068: begin
                  ld_TrainingVector  = wr_en;
                  rd_data            = {32'b0,TrainingVector[31:0]};
                end
  
    19'h0_0070: begin
                  ld_arb_ctrl        = wr_en;
                  rd_data            = {32'b0,arb_ctrl[31:0]};
                end
  
    19'h0_0078: begin
                  ld_arb_debug_vector = wr_en;
                  rd_data             = {32'b0,arb_debug_vector[31:0]};
                end
//    *****************************************************************
  
    19'h0_00a8: begin
                  ld_smx_meta_intr_hld = wr_en;
                  rd_data              = {32'b0,31'b0,smx_meta_intr_hld};
                end
  
//    *****************************************************************
//    19'h0_0010: begin
//                end
//    *****************************************************************

                // DMA binding registers
    19'h1_0000: begin 
                  ld_dma_bind0       = wr_en;
                  rd_data            = {50'b0,dma_bind0};
                end
    19'h1_0008: begin
                  ld_dma_bind1       = wr_en;
                  rd_data            = {50'b0,dma_bind1};
                end
    19'h1_0010: begin 
                  ld_dma_bind2       = wr_en;
                  rd_data            = {50'b0,dma_bind2};
                end
    19'h1_0018: begin
                  ld_dma_bind3       = wr_en;
                  rd_data            = {50'b0,dma_bind3};
                end
    19'h1_0020: begin 
                  ld_dma_bind4       = wr_en;
                  rd_data            = {50'b0,dma_bind4};
                end
    19'h1_0028: begin
                  ld_dma_bind5       = wr_en;
                  rd_data            = {50'b0,dma_bind5};
                end
    19'h1_0030: begin 
                  ld_dma_bind6       = wr_en;
                  rd_data            = {50'b0,dma_bind6};
                end
    19'h1_0038: begin
                  ld_dma_bind7       = wr_en;
                  rd_data            = {50'b0,dma_bind7};
                end
    19'h1_0040: begin 
                  ld_dma_bind8       = wr_en;
                  rd_data            = {50'b0,dma_bind8};
                end
    19'h1_0048: begin
                  ld_dma_bind9       = wr_en;
                  rd_data            = {50'b0,dma_bind9};
                end
    19'h1_0050: begin 
                  ld_dma_bind10      = wr_en;
                  rd_data            = {50'b0,dma_bind10};
                end
    19'h1_0058: begin
                  ld_dma_bind11      = wr_en;
                  rd_data            = {50'b0,dma_bind11};
                end
    19'h1_0060: begin 
                  ld_dma_bind12      = wr_en;
                  rd_data            = {50'b0,dma_bind12};
                end
    19'h1_0068: begin
                  ld_dma_bind13      = wr_en;
                  rd_data            = {50'b0,dma_bind13};
                end
    19'h1_0070: begin 
                  ld_dma_bind14      = wr_en;
                  rd_data            = {50'b0,dma_bind14};
                end
    19'h1_0078: begin
                  ld_dma_bind15      = wr_en;
                  rd_data            = {50'b0,dma_bind15};
                end
    19'h1_0080: begin 
                  ld_dma_bind16      = wr_en;
                  rd_data            = {50'b0,dma_bind16};
                end
    19'h1_0088: begin
                  ld_dma_bind17      = wr_en;
                  rd_data            = {50'b0,dma_bind17};
                end
    19'h1_0090: begin 
                  ld_dma_bind18      = wr_en;
                  rd_data            = {50'b0,dma_bind18};
                end
    19'h1_0098: begin
                  ld_dma_bind19      = wr_en;
                  rd_data            = {50'b0,dma_bind19};
                end
    19'h1_00A0: begin 
                  ld_dma_bind20      = wr_en;
                  rd_data            = {50'b0,dma_bind20};
                end
    19'h1_00A8: begin
                  ld_dma_bind21      = wr_en;
                  rd_data            = {50'b0,dma_bind21};
                end
    19'h1_00B0: begin 
                  ld_dma_bind22      = wr_en;
                  rd_data            = {50'b0,dma_bind22};
                end
    19'h1_00B8: begin
                  ld_dma_bind23      = wr_en;
                  rd_data            = {50'b0,dma_bind23};
                end
    19'h1_00C0: begin 
                  ld_dma_bind24      = wr_en;
                  rd_data            = {50'b0,dma_bind24};
                end
    19'h1_00C8: begin
                  ld_dma_bind25      = wr_en;
                  rd_data            = {50'b0,dma_bind25};
                end
    19'h1_00D0: begin 
                  ld_dma_bind26      = wr_en;
                  rd_data            = {50'b0,dma_bind26};
                end
    19'h1_00D8: begin
                  ld_dma_bind27      = wr_en;
                  rd_data            = {50'b0,dma_bind27};
                end
    19'h1_00E0: begin 
                  ld_dma_bind28      = wr_en;
                  rd_data            = {50'b0,dma_bind28};
                end
    19'h1_00E8: begin
                  ld_dma_bind29      = wr_en;
                  rd_data            = {50'b0,dma_bind29};
                end
    19'h1_00F0: begin 
                  ld_dma_bind30      = wr_en;
                  rd_data            = {50'b0,dma_bind30};
                end
    19'h1_00F8: begin
                  ld_dma_bind31      = wr_en;
                  rd_data            = {50'b0,dma_bind31};
                end
    19'h1_0100: begin 
                  ld_dma_bind32      = wr_en;
                  rd_data            = {50'b0,dma_bind32};
                end
    19'h1_0108: begin
                  ld_dma_bind33      = wr_en;
                  rd_data            = {50'b0,dma_bind33};
                end
    19'h1_0110: begin 
                  ld_dma_bind34      = wr_en;
                  rd_data            = {50'b0,dma_bind34};
                end
    19'h1_0118: begin
                  ld_dma_bind35      = wr_en;
                  rd_data            = {50'b0,dma_bind35};
                end
    19'h1_0120: begin 
                  ld_dma_bind36      = wr_en;
                  rd_data            = {50'b0,dma_bind36};
                end
    19'h1_0128: begin
                  ld_dma_bind37      = wr_en;
                  rd_data            = {50'b0,dma_bind37};
                end
    19'h1_0130: begin 
                  ld_dma_bind38      = wr_en;
                  rd_data            = {50'b0,dma_bind38};
                end
    19'h1_0138: begin
                  ld_dma_bind39      = wr_en;
                  rd_data            = {50'b0,dma_bind39};
                end
    19'h1_0140: begin 
                  ld_dma_bind40      = wr_en;
                  rd_data            = {50'b0,dma_bind40};
                end
    19'h1_0148: begin
                  ld_dma_bind41      = wr_en;
                  rd_data            = {50'b0,dma_bind41};
                end
    19'h1_0150: begin 
                  ld_dma_bind42      = wr_en;
                  rd_data            = {50'b0,dma_bind42};
                end
    19'h1_0158: begin
                  ld_dma_bind43      = wr_en;
                  rd_data            = {50'b0,dma_bind43};
                end
    19'h1_0160: begin 
                  ld_dma_bind44      = wr_en;
                  rd_data            = {50'b0,dma_bind44};
                end
    19'h1_0168: begin
                  ld_dma_bind45      = wr_en;
                  rd_data            = {50'b0,dma_bind45};
                end
    19'h1_0170: begin 
                  ld_dma_bind46      = wr_en;
                  rd_data            = {50'b0,dma_bind46};
                end
    19'h1_0178: begin
                  ld_dma_bind47      = wr_en;
                  rd_data            = {50'b0,dma_bind47};
                end
    19'h1_0180: begin 
                  ld_dma_bind48      = wr_en;
                  rd_data            = {50'b0,dma_bind48};
                end
    19'h1_0188: begin
                  ld_dma_bind49      = wr_en;
                  rd_data            = {50'b0,dma_bind49};
                end
    19'h1_0190: begin 
                  ld_dma_bind50      = wr_en;
                  rd_data            = {50'b0,dma_bind50};
                end
    19'h1_0198: begin
                  ld_dma_bind51      = wr_en;
                  rd_data            = {50'b0,dma_bind51};
                end
    19'h1_01A0: begin 
                  ld_dma_bind52      = wr_en;
                  rd_data            = {50'b0,dma_bind52};
                end
    19'h1_01A8: begin
                  ld_dma_bind53      = wr_en;
                  rd_data            = {50'b0,dma_bind53};
                end
    19'h1_01B0: begin 
                  ld_dma_bind54      = wr_en;
                  rd_data            = {50'b0,dma_bind54};
                end
    19'h1_01B8: begin
                  ld_dma_bind55      = wr_en;
                  rd_data            = {50'b0,dma_bind55};
                end
    19'h1_01C0: begin 
                  ld_dma_bind56      = wr_en;
                  rd_data            = {50'b0,dma_bind56};
                end
    19'h1_01C8: begin
                  ld_dma_bind57      = wr_en;
                  rd_data            = {50'b0,dma_bind57};
                end
    19'h1_01D0: begin 
                  ld_dma_bind58      = wr_en;
                  rd_data            = {50'b0,dma_bind58};
                end
    19'h1_01D8: begin
                  ld_dma_bind59      = wr_en;
                  rd_data            = {50'b0,dma_bind59};
                end
    19'h1_01E0: begin 
                  ld_dma_bind60      = wr_en;
                  rd_data            = {50'b0,dma_bind60};
                end
    19'h1_01E8: begin
                  ld_dma_bind61      = wr_en;
                  rd_data            = {50'b0,dma_bind61};
                end
    19'h1_01F0: begin 
                  ld_dma_bind62      = wr_en;
                  rd_data            = {50'b0,dma_bind62};
                end
    19'h1_01F8: begin
                  ld_dma_bind63      = wr_en;
                  rd_data            = {50'b0,dma_bind63};
                end
    
                // System Interrupt Data (sid)
    19'h1_0200: begin 
                  ld_sid0            = wr_en;
                  rd_data            = {57'b0,sid0};
                end
    19'h1_0208: begin
                  ld_sid1            = wr_en;
                  rd_data            = {57'b0,sid1};
                end
    19'h1_0210: begin 
                  ld_sid2            = wr_en;
                  rd_data            = {57'b0,sid2};
                end
    19'h1_0218: begin
                  ld_sid3            = wr_en;
                  rd_data            = {57'b0,sid3};
                end
    19'h1_0220: begin 
                  ld_sid4            = wr_en;
                  rd_data            = {57'b0,sid4};
                end
    19'h1_0228: begin
                  ld_sid5            = wr_en;
                  rd_data            = {57'b0,sid5};
                end
    19'h1_0230: begin 
                  ld_sid6            = wr_en;
                  rd_data            = {57'b0,sid6};
                end
    19'h1_0238: begin
                  ld_sid7            = wr_en;
                  rd_data            = {57'b0,sid7};
                end
    19'h1_0240: begin 
                  ld_sid8            = wr_en;
                  rd_data            = {57'b0,sid8};
                end
    19'h1_0248: begin
                  ld_sid9            = wr_en;
                  rd_data            = {57'b0,sid9};
                end
    19'h1_0250: begin 
                  ld_sid10           = wr_en;
                  rd_data            = {57'b0,sid10};
                end
    19'h1_0258: begin
                  ld_sid11           = wr_en;
                  rd_data            = {57'b0,sid11};
                end
    19'h1_0260: begin 
                  ld_sid12           = wr_en;
                  rd_data            = {57'b0,sid12};
                end
    19'h1_0268: begin
                  ld_sid13           = wr_en;
                  rd_data            = {57'b0,sid13};
                end
    19'h1_0270: begin 
                  ld_sid14           = wr_en;
                  rd_data            = {57'b0,sid14};
                end
    19'h1_0278: begin
                  ld_sid15           = wr_en;
                  rd_data            = {57'b0,sid15};
                end
    19'h1_0280: begin 
                  ld_sid16           = wr_en;
                  rd_data            = {57'b0,sid16};
                end
    19'h1_0288: begin
                  ld_sid17           = wr_en;
                  rd_data            = {57'b0,sid17};
                end
    19'h1_0290: begin 
                  ld_sid18           = wr_en;
                  rd_data            = {57'b0,sid18};
                end
    19'h1_0298: begin
                  ld_sid19           = wr_en;
                  rd_data            = {57'b0,sid19};
                end
    19'h1_02A0: begin 
                  ld_sid20           = wr_en;
                  rd_data            = {57'b0,sid20};
                end
    19'h1_02A8: begin
                  ld_sid21           = wr_en;
                  rd_data            = {57'b0,sid21};
                end
    19'h1_02B0: begin 
                  ld_sid22           = wr_en;
                  rd_data            = {57'b0,sid22};
                end
    19'h1_02B8: begin
                  ld_sid23           = wr_en;
                  rd_data            = {57'b0,sid23};
                end
    19'h1_02C0: begin 
                  ld_sid24           = wr_en;
                  rd_data            = {57'b0,sid24};
                end
    19'h1_02C8: begin
                  ld_sid25           = wr_en;
                  rd_data            = {57'b0,sid25};
                end
    19'h1_02D0: begin 
                  ld_sid26           = wr_en;
                  rd_data            = {57'b0,sid26};
                end
    19'h1_02D8: begin
                  ld_sid27           = wr_en;
                  rd_data            = {57'b0,sid27};
                end
    19'h1_02E0: begin 
                  ld_sid28           = wr_en;
                  rd_data            = {57'b0,sid28};
                end
    19'h1_02E8: begin
                  ld_sid29           = wr_en;
                  rd_data            = {57'b0,sid29};
                end
    19'h1_02F0: begin 
                  ld_sid30           = wr_en;
                  rd_data            = {57'b0,sid30};
                end
    19'h1_02F8: begin
                  ld_sid31           = wr_en;
                  rd_data            = {57'b0,sid31};
                end
    19'h1_0300: begin 
                  ld_sid32           = wr_en;
                  rd_data            = {57'b0,sid32};
                end
    19'h1_0308: begin
                  ld_sid33           = wr_en;
                  rd_data            = {57'b0,sid33};
                end
    19'h1_0310: begin 
                  ld_sid34           = wr_en;
                  rd_data            = {57'b0,sid34};
                end
    19'h1_0318: begin
                  ld_sid35           = wr_en;
                  rd_data            = {57'b0,sid35};
                end
    19'h1_0320: begin 
                  ld_sid36           = wr_en;
                  rd_data            = {57'b0,sid36};
                end
    19'h1_0328: begin
                  ld_sid37           = wr_en;
                  rd_data            = {57'b0,sid37};
                end
    19'h1_0330: begin 
                  ld_sid38           = wr_en;
                  rd_data            = {57'b0,sid38};
                end
    19'h1_0338: begin
                  ld_sid39           = wr_en;
                  rd_data            = {57'b0,sid39};
                end
    19'h1_0340: begin 
                  ld_sid40           = wr_en;
                  rd_data            = {57'b0,sid40};
                end
    19'h1_0348: begin
                  ld_sid41           = wr_en;
                  rd_data            = {57'b0,sid41};
                end
    19'h1_0350: begin 
                  ld_sid42           = wr_en;
                  rd_data            = {57'b0,sid42};
                end
    19'h1_0358: begin
                  ld_sid43           = wr_en;
                  rd_data            = {57'b0,sid43};
                end
    19'h1_0360: begin 
                  ld_sid44           = wr_en;
                  rd_data            = {57'b0,sid44};
                end
    19'h1_0368: begin
                  ld_sid45           = wr_en;
                  rd_data            = {57'b0,sid45};
                end
    19'h1_0370: begin 
                  ld_sid46           = wr_en;
                  rd_data            = {57'b0,sid46};
                end
    19'h1_0378: begin
                  ld_sid47           = wr_en;
                  rd_data            = {57'b0,sid47};
                end
    19'h1_0380: begin 
                  ld_sid48           = wr_en;
                  rd_data            = {57'b0,sid48};
                end
    19'h1_0388: begin
                  ld_sid49           = wr_en;
                  rd_data            = {57'b0,sid49};
                end
    19'h1_0390: begin 
                  ld_sid50           = wr_en;
                  rd_data            = {57'b0,sid50};
                end
    19'h1_0398: begin
                  ld_sid51           = wr_en;
                  rd_data            = {57'b0,sid51};
                end
    19'h1_03A0: begin 
                  ld_sid52           = wr_en;
                  rd_data            = {57'b0,sid52};
                end
    19'h1_03A8: begin
                  ld_sid53           = wr_en;
                  rd_data            = {57'b0,sid53};
                end
    19'h1_03B0: begin 
                  ld_sid54           = wr_en;
                  rd_data            = {57'b0,sid54};
                end
    19'h1_03B8: begin
                  ld_sid55           = wr_en;
                  rd_data            = {57'b0,sid55};
                end
    19'h1_03C0: begin 
                  ld_sid56           = wr_en;
                  rd_data            = {57'b0,sid56};
                end
    19'h1_03C8: begin
                  ld_sid57           = wr_en;
                  rd_data            = {57'b0,sid57};
                end
    19'h1_03D0: begin 
                  ld_sid58           = wr_en;
                  rd_data            = {57'b0,sid58};
                end
    19'h1_03D8: begin
                  ld_sid59           = wr_en;
                  rd_data            = {57'b0,sid59};
                end
    19'h1_03E0: begin 
                  ld_sid60           = wr_en;
                  rd_data            = {57'b0,sid60};
                end
    19'h1_03E8: begin
                  ld_sid61           = wr_en;
                  rd_data            = {57'b0,sid61};
                end
    19'h1_03F0: begin 
                  ld_sid62           = wr_en;
                  rd_data            = {57'b0,sid62};
                end
    19'h1_03F8: begin
                  ld_sid63           = wr_en;
                  rd_data            = {57'b0,sid63};
                end
 
                // Logical Device Group Number
    19'h2_0000: begin 
                  ld_ldgn0           = wr_en;
                  rd_data            = {58'b0,ldgn0};
                end
    19'h2_0008: begin
                  ld_ldgn1           = wr_en;
                  rd_data            = {58'b0,ldgn1};
                end
    19'h2_0010: begin 
                  ld_ldgn2           = wr_en;
                  rd_data            = {58'b0,ldgn2};
                end
    19'h2_0018: begin
                  ld_ldgn3           = wr_en;
                  rd_data            = {58'b0,ldgn3};
                end
    19'h2_0020: begin 
                  ld_ldgn4           = wr_en;
                  rd_data            = {58'b0,ldgn4};
                end
    19'h2_0028: begin
                  ld_ldgn5           = wr_en;
                  rd_data            = {58'b0,ldgn5};
                end
    19'h2_0030: begin 
                  ld_ldgn6           = wr_en;
                  rd_data            = {58'b0,ldgn6};
                end
    19'h2_0038: begin
                  ld_ldgn7           = wr_en;
                  rd_data            = {58'b0,ldgn7};
                end
    19'h2_0040: begin 
                  ld_ldgn8           = wr_en;
                  rd_data            = {58'b0,ldgn8};
                end
    19'h2_0048: begin
                  ld_ldgn9           = wr_en;
                  rd_data            = {58'b0,ldgn9};
                end
    19'h2_0050: begin 
                  ld_ldgn10          = wr_en;
                  rd_data            = {58'b0,ldgn10};
                end
    19'h2_0058: begin
                  ld_ldgn11          = wr_en;
                  rd_data            = {58'b0,ldgn11};
                end
    19'h2_0060: begin 
                  ld_ldgn12          = wr_en;
                  rd_data            = {58'b0,ldgn12};
                end
    19'h2_0068: begin
                  ld_ldgn13          = wr_en;
                  rd_data            = {58'b0,ldgn13};
                end
    19'h2_0070: begin 
                  ld_ldgn14          = wr_en;
                  rd_data            = {58'b0,ldgn14};
                end
    19'h2_0078: begin
                  ld_ldgn15          = wr_en;
                  rd_data            = {58'b0,ldgn15};
                end
    19'h2_0080: begin 
                  ld_ldgn16          = wr_en;
                  rd_data            = {58'b0,ldgn16};
                end
    19'h2_0088: begin
                  ld_ldgn17          = wr_en;
                  rd_data            = {58'b0,ldgn17};
                end
    19'h2_0090: begin 
                  ld_ldgn18          = wr_en;
                  rd_data            = {58'b0,ldgn18};
                end
    19'h2_0098: begin
                  ld_ldgn19          = wr_en;
                  rd_data            = {58'b0,ldgn19};
                end
    19'h2_00A0: begin 
                  ld_ldgn20          = wr_en;
                  rd_data            = {58'b0,ldgn20};
                end
    19'h2_00A8: begin
                  ld_ldgn21          = wr_en;
                  rd_data            = {58'b0,ldgn21};
                end
    19'h2_00B0: begin 
                  ld_ldgn22          = wr_en;
                  rd_data            = {58'b0,ldgn22};
                end
    19'h2_00B8: begin
                  ld_ldgn23          = wr_en;
                  rd_data            = {58'b0,ldgn23};
                end
    19'h2_00C0: begin 
                  ld_ldgn24          = wr_en;
                  rd_data            = {58'b0,ldgn24};
                end
    19'h2_00C8: begin
                  ld_ldgn25          = wr_en;
                  rd_data            = {58'b0,ldgn25};
                end
    19'h2_00D0: begin 
                  ld_ldgn26          = wr_en;
                  rd_data            = {58'b0,ldgn26};
                end
    19'h2_00D8: begin
                  ld_ldgn27          = wr_en;
                  rd_data            = {58'b0,ldgn27};
                end
    19'h2_00E0: begin 
                  ld_ldgn28          = wr_en;
                  rd_data            = {58'b0,ldgn28};
                end
    19'h2_00E8: begin
                  ld_ldgn29          = wr_en;
                  rd_data            = {58'b0,ldgn29};
                end
    19'h2_00F0: begin 
                  ld_ldgn30          = wr_en;
                  rd_data            = {58'b0,ldgn30};
                end
    19'h2_00F8: begin
                  ld_ldgn31          = wr_en;
                  rd_data            = {58'b0,ldgn31};
                end
    19'h2_0100: begin 
                  ld_ldgn32          = wr_en;
                  rd_data            = {58'b0,ldgn32};
                end
    19'h2_0108: begin
                  ld_ldgn33          = wr_en;
                  rd_data            = {58'b0,ldgn33};
                end
    19'h2_0110: begin 
                  ld_ldgn34          = wr_en;
                  rd_data            = {58'b0,ldgn34};
                end
    19'h2_0118: begin
                  ld_ldgn35          = wr_en;
                  rd_data            = {58'b0,ldgn35};
                end
    19'h2_0120: begin 
                  ld_ldgn36          = wr_en;
                  rd_data            = {58'b0,ldgn36};
                end
    19'h2_0128: begin
                  ld_ldgn37          = wr_en;
                  rd_data            = {58'b0,ldgn37};
                end
    19'h2_0130: begin 
                  ld_ldgn38          = wr_en;
                  rd_data            = {58'b0,ldgn38};
                end
    19'h2_0138: begin
                  ld_ldgn39          = wr_en;
                  rd_data            = {58'b0,ldgn39};
                end
    19'h2_0140: begin 
                  ld_ldgn40          = wr_en;
                  rd_data            = {58'b0,ldgn40};
                end
    19'h2_0148: begin
                  ld_ldgn41          = wr_en;
                  rd_data            = {58'b0,ldgn41};
                end
    19'h2_0150: begin 
                  ld_ldgn42          = wr_en;
                  rd_data            = {58'b0,ldgn42};
                end
    19'h2_0158: begin
                  ld_ldgn43          = wr_en;
                  rd_data            = {58'b0,ldgn43};
                end
    19'h2_0160: begin 
                  ld_ldgn44          = wr_en;
                  rd_data            = {58'b0,ldgn44};
                end
    19'h2_0168: begin
                  ld_ldgn45          = wr_en;
                  rd_data            = {58'b0,ldgn45};
                end
    19'h2_0170: begin 
                  ld_ldgn46          = wr_en;
                  rd_data            = {58'b0,ldgn46};
                end
    19'h2_0178: begin
                  ld_ldgn47          = wr_en;
                  rd_data            = {58'b0,ldgn47};
                end
    19'h2_0180: begin 
                  ld_ldgn48          = wr_en;
                  rd_data            = {58'b0,ldgn48};
                end
    19'h2_0188: begin
                  ld_ldgn49          = wr_en;
                  rd_data            = {58'b0,ldgn49};
                end
    19'h2_0190: begin 
                  ld_ldgn50          = wr_en;
                  rd_data            = {58'b0,ldgn50};
                end
    19'h2_0198: begin
                  ld_ldgn51          = wr_en;
                  rd_data            = {58'b0,ldgn51};
                end
    19'h2_01A0: begin 
                  ld_ldgn52          = wr_en;
                  rd_data            = {58'b0,ldgn52};
                end
    19'h2_01A8: begin
                  ld_ldgn53          = wr_en;
                  rd_data            = {58'b0,ldgn53};
                end
    19'h2_01B0: begin 
                  ld_ldgn54          = wr_en;
                  rd_data            = {58'b0,ldgn54};
                end
    19'h2_01B8: begin
                  ld_ldgn55          = wr_en;
                  rd_data            = {58'b0,ldgn55};
                end
    19'h2_01C0: begin 
                  ld_ldgn56          = wr_en;
                  rd_data            = {58'b0,ldgn56};
                end
    19'h2_01C8: begin
                  ld_ldgn57          = wr_en;
                  rd_data            = {58'b0,ldgn57};
                end
    19'h2_01D0: begin 
                  ld_ldgn58          = wr_en;
                  rd_data            = {58'b0,ldgn58};
                end
    19'h2_01D8: begin
                  ld_ldgn59          = wr_en;
                  rd_data            = {58'b0,ldgn59};
                end
    19'h2_01E0: begin 
                  ld_ldgn60          = wr_en;
                  rd_data            = {58'b0,ldgn60};
                end
    19'h2_01E8: begin
                  ld_ldgn61          = wr_en;
                  rd_data            = {58'b0,ldgn61};
                end
    19'h2_01F0: begin 
                  ld_ldgn62          = wr_en;
                  rd_data            = {58'b0,ldgn62};
                end
    19'h2_01F8: begin
                  ld_ldgn63          = wr_en;
                  rd_data            = {58'b0,ldgn63};
                end
    19'h2_0200: begin 
                  ld_ldgn64          = wr_en;
                  rd_data            = {58'b0,ldgn64};
                end
    19'h2_0208: begin
                  ld_ldgn65          = wr_en;
                  rd_data            = {58'b0,ldgn65};
                end
    19'h2_0210: begin 
                  ld_ldgn66          = wr_en;
                  rd_data            = {58'b0,ldgn66};
                end
    19'h2_0218: begin
                  ld_ldgn67          = wr_en;
                  rd_data            = {58'b0,ldgn67};
                end
    19'h2_0220: begin 
                  ld_ldgn68          = wr_en;
                  rd_data            = {58'b0,ldgn68};
                end

    default:    begin
                  rd_data            = 64'hdead_beef_dead_beef;
                  non_qualified_addr_err = 1;
	        end // case: default
    endcase // case({addr[18:3],3'b0})
  end // always @ (...
      
endmodule // niu_pio_fzc_slv_decoder

