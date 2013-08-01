// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sys_fbdimm8.v
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
module sys_fbdimm8 (   ps , ps_bar, sn , sn_bar, pn, pn_bar, ss , ss_bar , // channel interface
                       sclk);
// Parameters
parameter NB_LINK = 14;
parameter SB_LINK = 10;

// Inputs/Outputs
output  [NB_LINK-1:0] pn,pn_bar; // primary northbound
input   [NB_LINK-1:0] sn,sn_bar; // secondary northbound
output  [SB_LINK-1:0] ss,ss_bar; // secondary southbound
input   [SB_LINK-1:0] ps,ps_bar; // primary southbound
input                sclk;

// internal registers/wires
wire [NB_LINK-1:0] fbdimm0_sn,fbdimm1_sn,fbdimm2_sn,fbdimm3_sn;
wire [NB_LINK-1:0] fbdimm4_sn,fbdimm5_sn,fbdimm6_sn,fbdimm7_sn;
wire [SB_LINK-1:0] fbdimm0_ss,fbdimm1_ss,fbdimm2_ss,fbdimm3_ss;
wire [SB_LINK-1:0] fbdimm4_ss,fbdimm5_ss,fbdimm6_ss,fbdimm7_ss;
wire [SB_LINK-1:0] fbdimm0_ss_bar,fbdimm1_ss_bar,fbdimm2_ss_bar,fbdimm3_ss_bar;
wire [SB_LINK-1:0] fbdimm4_ss_bar,fbdimm5_ss_bar,fbdimm6_ss_bar,fbdimm7_ss_bar;

fbdimm #(NB_LINK,SB_LINK,0) fbdimm0 ( .ps   (ps),
                                      .ps_bar (ps_bar),
                                      .sn   (fbdimm0_sn),
                                      .pn   (pn),
                                      .ss   (fbdimm0_ss),
                                      .ss_bar   (fbdimm0_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,1) fbdimm1 ( .ps   (fbdimm0_ss),
                                      .ps_bar (fbdimm0_ss_bar),
                                      .sn   (fbdimm1_sn),
                                      .pn   (fbdimm0_sn),
                                      .ss   (fbdimm1_ss),
                                      .ss_bar   (fbdimm1_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,2) fbdimm2 ( .ps   (fbdimm1_ss),
                                      .ps_bar (fbdimm1_ss_bar),
                                      .sn   (fbdimm2_sn),
                                      .pn   (fbdimm1_sn),
                                      .ss   (fbdimm2_ss),
                                      .ss_bar   (fbdimm2_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,3) fbdimm3 ( .ps   (fbdimm2_ss),
                                      .ps_bar ( fbdimm2_ss_bar),
                                      .sn   (fbdimm3_sn),
                                      .pn   (fbdimm2_sn),
                                      .ss   (fbdimm3_ss),
                                      .ss_bar   (fbdimm3_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,4) fbdimm4 ( .ps   (fbdimm3_ss),
                                      .ps_bar (fbdimm3_ss_bar),
                                      .sn   (fbdimm4_sn),
                                      .pn   (fbdimm3_sn),
                                      .ss   (fbdimm4_ss),
                                      .ss_bar   (fbdimm4_ss_bar),
                                      .sclk (sclk));


fbdimm #(NB_LINK,SB_LINK,5) fbdimm5 ( .ps   (fbdimm4_ss),
                                      .ps_bar (fbdimm4_ss_bar),
                                      .sn   (fbdimm5_sn),
                                      .pn   (fbdimm4_sn),
                                      .ss   (fbdimm5_ss),
                                      .ss_bar   (fbdimm5_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,6) fbdimm6 ( .ps   (fbdimm5_ss),
                                      .ps_bar (fbdimm5_ss_bar ),
                                      .sn   (fbdimm6_sn),
                                      .pn   (fbdimm5_sn),
                                      .ss   (fbdimm6_ss),
                                      .ss_bar   (fbdimm6_ss_bar),
                                      .sclk (sclk));

fbdimm #(NB_LINK,SB_LINK,7) fbdimm7 ( .ps   (fbdimm6_ss),
                                      .ps_bar (fbdimm6_ss_bar),
                                      .sn   (fbdimm7_sn),
                                      .pn   (fbdimm6_sn),
                                      .ss   (fbdimm7_ss),
                                      .ss_bar   (fbdimm7_ss_bar),
                                      .sclk (sclk));


endmodule
