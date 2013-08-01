// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_vdmc_decoder.v
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
 * File Name    : niu_pio_vdmc_decoder.v
 * Author Name  : John Lo
 * Description  : 
 * 
 * Parent Module: niu_pio_regs.v
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

`define     VDMA_TX_BASE_ADDR  6'b0100_00
`define     VDMA_RX_BASE_ADDR  6'b0000_00

module niu_pio_vdmc_decoder (/*AUTOARG*/
   // Outputs
   vdmc_addr, vdmc_sel_ok, 
   // Inputs
   addr, dma_bind0, dma_bind1, dma_bind2, dma_bind3, dma_bind4, 
   dma_bind5, dma_bind6, dma_bind7, dma_bind8, dma_bind9, dma_bind10, 
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
   dma_bind61, dma_bind62, dma_bind63
   );
                              // pio broadcast signals
   input [26:0] 	      addr;
                              //
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
   output [19:0] 	      vdmc_addr;
   output 		      vdmc_sel_ok;

// common reg declaration
   reg [19:0] 		      vdmc_addr;
   reg 			      vdmc_sel_ok;
// common wrie declaration
// output reg declaration
   

always @ (/*AUTOSENSE*/`VDMA_RX_BASE_ADDR or `VDMA_TX_BASE_ADDR
	  or addr or dma_bind0 or dma_bind1 or dma_bind10
	  or dma_bind11 or dma_bind12 or dma_bind13 or dma_bind14
	  or dma_bind15 or dma_bind16 or dma_bind17 or dma_bind18
	  or dma_bind19 or dma_bind2 or dma_bind20 or dma_bind21
	  or dma_bind22 or dma_bind23 or dma_bind24 or dma_bind25
	  or dma_bind26 or dma_bind27 or dma_bind28 or dma_bind29
	  or dma_bind3 or dma_bind30 or dma_bind31 or dma_bind32
	  or dma_bind33 or dma_bind34 or dma_bind35 or dma_bind36
	  or dma_bind37 or dma_bind38 or dma_bind39 or dma_bind4
	  or dma_bind40 or dma_bind41 or dma_bind42 or dma_bind43
	  or dma_bind44 or dma_bind45 or dma_bind46 or dma_bind47
	  or dma_bind48 or dma_bind49 or dma_bind5 or dma_bind50
	  or dma_bind51 or dma_bind52 or dma_bind53 or dma_bind54
	  or dma_bind55 or dma_bind56 or dma_bind57 or dma_bind58
	  or dma_bind59 or dma_bind6 or dma_bind60 or dma_bind61
	  or dma_bind62 or dma_bind63 or dma_bind7 or dma_bind8
	  or dma_bind9)
  begin
                vdmc_addr[19:0]        = addr[19:0];
    if (addr[9])     // rx dma
//    case({addr[15:10]}) //synopsys parallel_case full_case
      case({addr[26:25],addr[14],addr[12:10]}) //synopsys parallel_case full_case
        6'd0  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind0 [4:0],addr[8:0]};
        6'd1  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind1 [4:0],addr[8:0]};
        6'd2  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind2 [4:0],addr[8:0]};
        6'd3  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind3 [4:0],addr[8:0]};
        6'd4  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind4 [4:0],addr[8:0]};
        6'd5  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind5 [4:0],addr[8:0]};
        6'd6  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind6 [4:0],addr[8:0]};
        6'd7  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind7 [4:0],addr[8:0]};
        6'd8  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind8 [4:0],addr[8:0]};
        6'd9  : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind9 [4:0],addr[8:0]};
        6'd10 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind10[4:0],addr[8:0]};
        6'd11 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind11[4:0],addr[8:0]};
        6'd12 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind12[4:0],addr[8:0]};
        6'd13 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind13[4:0],addr[8:0]};
        6'd14 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind14[4:0],addr[8:0]};
        6'd15 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind15[4:0],addr[8:0]};
        6'd16 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind16[4:0],addr[8:0]};
        6'd17 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind17[4:0],addr[8:0]};
        6'd18 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind18[4:0],addr[8:0]};
        6'd19 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind19[4:0],addr[8:0]};
        6'd20 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind20[4:0],addr[8:0]};
        6'd21 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind21[4:0],addr[8:0]};
        6'd22 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind22[4:0],addr[8:0]};
        6'd23 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind23[4:0],addr[8:0]};
        6'd24 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind24[4:0],addr[8:0]};
        6'd25 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind25[4:0],addr[8:0]};
        6'd26 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind26[4:0],addr[8:0]};
        6'd27 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind27[4:0],addr[8:0]};
        6'd28 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind28[4:0],addr[8:0]};
        6'd29 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind29[4:0],addr[8:0]};
        6'd30 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind30[4:0],addr[8:0]};
        6'd31 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind31[4:0],addr[8:0]};
        6'd32 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind32[4:0],addr[8:0]};
        6'd33 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind33[4:0],addr[8:0]};
        6'd34 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind34[4:0],addr[8:0]};
        6'd35 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind35[4:0],addr[8:0]};
        6'd36 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind36[4:0],addr[8:0]};
        6'd37 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind37[4:0],addr[8:0]};
        6'd38 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind38[4:0],addr[8:0]};
        6'd39 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind39[4:0],addr[8:0]};
        6'd40 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind40[4:0],addr[8:0]};
        6'd41 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind41[4:0],addr[8:0]};
        6'd42 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind42[4:0],addr[8:0]};
        6'd43 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind43[4:0],addr[8:0]};
        6'd44 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind44[4:0],addr[8:0]};
        6'd45 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind45[4:0],addr[8:0]};
        6'd46 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind46[4:0],addr[8:0]};
        6'd47 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind47[4:0],addr[8:0]};
        6'd48 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind48[4:0],addr[8:0]};
        6'd49 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind49[4:0],addr[8:0]};
        6'd50 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind50[4:0],addr[8:0]};
        6'd51 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind51[4:0],addr[8:0]};
        6'd52 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind52[4:0],addr[8:0]};
        6'd53 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind53[4:0],addr[8:0]};
        6'd54 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind54[4:0],addr[8:0]};
        6'd55 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind55[4:0],addr[8:0]};
        6'd56 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind56[4:0],addr[8:0]};
        6'd57 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind57[4:0],addr[8:0]};
        6'd58 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind58[4:0],addr[8:0]};
        6'd59 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind59[4:0],addr[8:0]};
        6'd60 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind60[4:0],addr[8:0]};
        6'd61 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind61[4:0],addr[8:0]};
        6'd62 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind62[4:0],addr[8:0]};
        6'd63 : vdmc_addr[19:0] = {`VDMA_RX_BASE_ADDR,dma_bind63[4:0],addr[8:0]};
        default:vdmc_addr[19:0] = 20'hdead;
      endcase
    else             // tx dma
//    case({addr[15:10]}) //synopsys parallel_case full_case
      case({addr[26:25],addr[14],addr[12:10]}) //synopsys parallel_case full_case
        6'd0  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind0 [12:8],addr[8:0]};
        6'd1  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind1 [12:8],addr[8:0]};
        6'd2  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind2 [12:8],addr[8:0]};
        6'd3  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind3 [12:8],addr[8:0]};
        6'd4  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind4 [12:8],addr[8:0]};
        6'd5  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind5 [12:8],addr[8:0]};
        6'd6  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind6 [12:8],addr[8:0]};
        6'd7  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind7 [12:8],addr[8:0]};
        6'd8  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind8 [12:8],addr[8:0]};
        6'd9  : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind9 [12:8],addr[8:0]};
        6'd10 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind10[12:8],addr[8:0]};
        6'd11 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind11[12:8],addr[8:0]};
        6'd12 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind12[12:8],addr[8:0]};
        6'd13 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind13[12:8],addr[8:0]};
        6'd14 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind14[12:8],addr[8:0]};
        6'd15 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind15[12:8],addr[8:0]};
        6'd16 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind16[12:8],addr[8:0]};
        6'd17 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind17[12:8],addr[8:0]};
        6'd18 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind18[12:8],addr[8:0]};
        6'd19 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind19[12:8],addr[8:0]};
        6'd20 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind20[12:8],addr[8:0]};
        6'd21 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind21[12:8],addr[8:0]};
        6'd22 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind22[12:8],addr[8:0]};
        6'd23 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind23[12:8],addr[8:0]};
        6'd24 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind24[12:8],addr[8:0]};
        6'd25 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind25[12:8],addr[8:0]};
        6'd26 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind26[12:8],addr[8:0]};
        6'd27 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind27[12:8],addr[8:0]};
        6'd28 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind28[12:8],addr[8:0]};
        6'd29 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind29[12:8],addr[8:0]};
        6'd30 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind30[12:8],addr[8:0]};
        6'd31 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind31[12:8],addr[8:0]};
        6'd32 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind32[12:8],addr[8:0]};
        6'd33 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind33[12:8],addr[8:0]};
        6'd34 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind34[12:8],addr[8:0]};
        6'd35 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind35[12:8],addr[8:0]};
        6'd36 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind36[12:8],addr[8:0]};
        6'd37 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind37[12:8],addr[8:0]};
        6'd38 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind38[12:8],addr[8:0]};
        6'd39 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind39[12:8],addr[8:0]};
        6'd40 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind40[12:8],addr[8:0]};
        6'd41 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind41[12:8],addr[8:0]};
        6'd42 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind42[12:8],addr[8:0]};
        6'd43 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind43[12:8],addr[8:0]};
        6'd44 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind44[12:8],addr[8:0]};
        6'd45 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind45[12:8],addr[8:0]};
        6'd46 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind46[12:8],addr[8:0]};
        6'd47 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind47[12:8],addr[8:0]};
        6'd48 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind48[12:8],addr[8:0]};
        6'd49 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind49[12:8],addr[8:0]};
        6'd50 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind50[12:8],addr[8:0]};
        6'd51 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind51[12:8],addr[8:0]};
        6'd52 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind52[12:8],addr[8:0]};
        6'd53 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind53[12:8],addr[8:0]};
        6'd54 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind54[12:8],addr[8:0]};
        6'd55 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind55[12:8],addr[8:0]};
        6'd56 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind56[12:8],addr[8:0]};
        6'd57 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind57[12:8],addr[8:0]};
        6'd58 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind58[12:8],addr[8:0]};
        6'd59 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind59[12:8],addr[8:0]};
        6'd60 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind60[12:8],addr[8:0]};
        6'd61 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind61[12:8],addr[8:0]};
        6'd62 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind62[12:8],addr[8:0]};
        6'd63 : vdmc_addr[19:0] = {`VDMA_TX_BASE_ADDR,dma_bind63[12:8],addr[8:0]};
        default:vdmc_addr[19:0] = 20'hdead;
       endcase
  end
 
   
always @ (/*AUTOSENSE*/addr or dma_bind0 or dma_bind1 or dma_bind10
	  or dma_bind11 or dma_bind12 or dma_bind13 or dma_bind14
	  or dma_bind15 or dma_bind16 or dma_bind17 or dma_bind18
	  or dma_bind19 or dma_bind2 or dma_bind20 or dma_bind21
	  or dma_bind22 or dma_bind23 or dma_bind24 or dma_bind25
	  or dma_bind26 or dma_bind27 or dma_bind28 or dma_bind29
	  or dma_bind3 or dma_bind30 or dma_bind31 or dma_bind32
	  or dma_bind33 or dma_bind34 or dma_bind35 or dma_bind36
	  or dma_bind37 or dma_bind38 or dma_bind39 or dma_bind4
	  or dma_bind40 or dma_bind41 or dma_bind42 or dma_bind43
	  or dma_bind44 or dma_bind45 or dma_bind46 or dma_bind47
	  or dma_bind48 or dma_bind49 or dma_bind5 or dma_bind50
	  or dma_bind51 or dma_bind52 or dma_bind53 or dma_bind54
	  or dma_bind55 or dma_bind56 or dma_bind57 or dma_bind58
	  or dma_bind59 or dma_bind6 or dma_bind60 or dma_bind61
	  or dma_bind62 or dma_bind63 or dma_bind7 or dma_bind8
	  or dma_bind9)
  begin
                vdmc_sel_ok        = 0;
    if (addr[9])     // rx dma
//    case({addr[15:10]}) //synopsys parallel_case full_case
      case({addr[26:25],addr[14],addr[12:10]}) //synopsys parallel_case full_case
        6'd0  : vdmc_sel_ok = dma_bind0 [5];
        6'd1  : vdmc_sel_ok = dma_bind1 [5];
        6'd2  : vdmc_sel_ok = dma_bind2 [5];
        6'd3  : vdmc_sel_ok = dma_bind3 [5];
        6'd4  : vdmc_sel_ok = dma_bind4 [5];
        6'd5  : vdmc_sel_ok = dma_bind5 [5];
        6'd6  : vdmc_sel_ok = dma_bind6 [5];
        6'd7  : vdmc_sel_ok = dma_bind7 [5];
        6'd8  : vdmc_sel_ok = dma_bind8 [5];
        6'd9  : vdmc_sel_ok = dma_bind9 [5];
        6'd10 : vdmc_sel_ok = dma_bind10[5];
        6'd11 : vdmc_sel_ok = dma_bind11[5];
        6'd12 : vdmc_sel_ok = dma_bind12[5];
        6'd13 : vdmc_sel_ok = dma_bind13[5];
        6'd14 : vdmc_sel_ok = dma_bind14[5];
        6'd15 : vdmc_sel_ok = dma_bind15[5];
        6'd16 : vdmc_sel_ok = dma_bind16[5];
        6'd17 : vdmc_sel_ok = dma_bind17[5];
        6'd18 : vdmc_sel_ok = dma_bind18[5];
        6'd19 : vdmc_sel_ok = dma_bind19[5];
        6'd20 : vdmc_sel_ok = dma_bind20[5];
        6'd21 : vdmc_sel_ok = dma_bind21[5];
        6'd22 : vdmc_sel_ok = dma_bind22[5];
        6'd23 : vdmc_sel_ok = dma_bind23[5];
        6'd24 : vdmc_sel_ok = dma_bind24[5];
        6'd25 : vdmc_sel_ok = dma_bind25[5];
        6'd26 : vdmc_sel_ok = dma_bind26[5];
        6'd27 : vdmc_sel_ok = dma_bind27[5];
        6'd28 : vdmc_sel_ok = dma_bind28[5];
        6'd29 : vdmc_sel_ok = dma_bind29[5];
        6'd30 : vdmc_sel_ok = dma_bind30[5];
        6'd31 : vdmc_sel_ok = dma_bind31[5];
        6'd32 : vdmc_sel_ok = dma_bind32[5];
        6'd33 : vdmc_sel_ok = dma_bind33[5];
        6'd34 : vdmc_sel_ok = dma_bind34[5];
        6'd35 : vdmc_sel_ok = dma_bind35[5];
        6'd36 : vdmc_sel_ok = dma_bind36[5];
        6'd37 : vdmc_sel_ok = dma_bind37[5];
        6'd38 : vdmc_sel_ok = dma_bind38[5];
        6'd39 : vdmc_sel_ok = dma_bind39[5];
        6'd40 : vdmc_sel_ok = dma_bind40[5];
        6'd41 : vdmc_sel_ok = dma_bind41[5];
        6'd42 : vdmc_sel_ok = dma_bind42[5];
        6'd43 : vdmc_sel_ok = dma_bind43[5];
        6'd44 : vdmc_sel_ok = dma_bind44[5];
        6'd45 : vdmc_sel_ok = dma_bind45[5];
        6'd46 : vdmc_sel_ok = dma_bind46[5];
        6'd47 : vdmc_sel_ok = dma_bind47[5];
        6'd48 : vdmc_sel_ok = dma_bind48[5];
        6'd49 : vdmc_sel_ok = dma_bind49[5];
        6'd50 : vdmc_sel_ok = dma_bind50[5];
        6'd51 : vdmc_sel_ok = dma_bind51[5];
        6'd52 : vdmc_sel_ok = dma_bind52[5];
        6'd53 : vdmc_sel_ok = dma_bind53[5];
        6'd54 : vdmc_sel_ok = dma_bind54[5];
        6'd55 : vdmc_sel_ok = dma_bind55[5];
        6'd56 : vdmc_sel_ok = dma_bind56[5];
        6'd57 : vdmc_sel_ok = dma_bind57[5];
        6'd58 : vdmc_sel_ok = dma_bind58[5];
        6'd59 : vdmc_sel_ok = dma_bind59[5];
        6'd60 : vdmc_sel_ok = dma_bind60[5];
        6'd61 : vdmc_sel_ok = dma_bind61[5];
        6'd62 : vdmc_sel_ok = dma_bind62[5];
        6'd63 : vdmc_sel_ok = dma_bind63[5];
        default:vdmc_sel_ok = 0;
      endcase
    else             // tx dma
//    case({addr[15:10]}) //synopsys parallel_case full_case
      case({addr[26:25],addr[14],addr[12:10]}) //synopsys parallel_case full_case
        6'd0  : vdmc_sel_ok = dma_bind0 [13];
        6'd1  : vdmc_sel_ok = dma_bind1 [13];
        6'd2  : vdmc_sel_ok = dma_bind2 [13];
        6'd3  : vdmc_sel_ok = dma_bind3 [13];
        6'd4  : vdmc_sel_ok = dma_bind4 [13];
        6'd5  : vdmc_sel_ok = dma_bind5 [13];
        6'd6  : vdmc_sel_ok = dma_bind6 [13];
        6'd7  : vdmc_sel_ok = dma_bind7 [13];
        6'd8  : vdmc_sel_ok = dma_bind8 [13];
        6'd9  : vdmc_sel_ok = dma_bind9 [13];
        6'd10 : vdmc_sel_ok = dma_bind10[13];
        6'd11 : vdmc_sel_ok = dma_bind11[13];
        6'd12 : vdmc_sel_ok = dma_bind12[13];
        6'd13 : vdmc_sel_ok = dma_bind13[13];
        6'd14 : vdmc_sel_ok = dma_bind14[13];
        6'd15 : vdmc_sel_ok = dma_bind15[13];
        6'd16 : vdmc_sel_ok = dma_bind16[13];
        6'd17 : vdmc_sel_ok = dma_bind17[13];
        6'd18 : vdmc_sel_ok = dma_bind18[13];
        6'd19 : vdmc_sel_ok = dma_bind19[13];
        6'd20 : vdmc_sel_ok = dma_bind20[13];
        6'd21 : vdmc_sel_ok = dma_bind21[13];
        6'd22 : vdmc_sel_ok = dma_bind22[13];
        6'd23 : vdmc_sel_ok = dma_bind23[13];
        6'd24 : vdmc_sel_ok = dma_bind24[13];
        6'd25 : vdmc_sel_ok = dma_bind25[13];
        6'd26 : vdmc_sel_ok = dma_bind26[13];
        6'd27 : vdmc_sel_ok = dma_bind27[13];
        6'd28 : vdmc_sel_ok = dma_bind28[13];
        6'd29 : vdmc_sel_ok = dma_bind29[13];
        6'd30 : vdmc_sel_ok = dma_bind30[13];
        6'd31 : vdmc_sel_ok = dma_bind31[13];
        6'd32 : vdmc_sel_ok = dma_bind32[13];
        6'd33 : vdmc_sel_ok = dma_bind33[13];
        6'd34 : vdmc_sel_ok = dma_bind34[13];
        6'd35 : vdmc_sel_ok = dma_bind35[13];
        6'd36 : vdmc_sel_ok = dma_bind36[13];
        6'd37 : vdmc_sel_ok = dma_bind37[13];
        6'd38 : vdmc_sel_ok = dma_bind38[13];
        6'd39 : vdmc_sel_ok = dma_bind39[13];
        6'd40 : vdmc_sel_ok = dma_bind40[13];
        6'd41 : vdmc_sel_ok = dma_bind41[13];
        6'd42 : vdmc_sel_ok = dma_bind42[13];
        6'd43 : vdmc_sel_ok = dma_bind43[13];
        6'd44 : vdmc_sel_ok = dma_bind44[13];
        6'd45 : vdmc_sel_ok = dma_bind45[13];
        6'd46 : vdmc_sel_ok = dma_bind46[13];
        6'd47 : vdmc_sel_ok = dma_bind47[13];
        6'd48 : vdmc_sel_ok = dma_bind48[13];
        6'd49 : vdmc_sel_ok = dma_bind49[13];
        6'd50 : vdmc_sel_ok = dma_bind50[13];
        6'd51 : vdmc_sel_ok = dma_bind51[13];
        6'd52 : vdmc_sel_ok = dma_bind52[13];
        6'd53 : vdmc_sel_ok = dma_bind53[13];
        6'd54 : vdmc_sel_ok = dma_bind54[13];
        6'd55 : vdmc_sel_ok = dma_bind55[13];
        6'd56 : vdmc_sel_ok = dma_bind56[13];
        6'd57 : vdmc_sel_ok = dma_bind57[13];
        6'd58 : vdmc_sel_ok = dma_bind58[13];
        6'd59 : vdmc_sel_ok = dma_bind59[13];
        6'd60 : vdmc_sel_ok = dma_bind60[13];
        6'd61 : vdmc_sel_ok = dma_bind61[13];
        6'd62 : vdmc_sel_ok = dma_bind62[13];
        6'd63 : vdmc_sel_ok = dma_bind63[13];
        default:vdmc_sel_ok = 0;
       endcase
  end
      
endmodule // niu_pio_vdmc_decoder
