// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_sum_data.v
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

`timescale 1ns/10ps

/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_sum_data.v

    Module(s) name  : niu_ipp_sum_data
    Original:       : sum_data.v main.2, label:               

    Parent modules  : niu_ipp_sum.v

    Child modules   : niu_ipp_sum_lib.v, niu_ipp_sum_lib.h, 

    Author's name   : George Chu

    Date            : March. 2004

    Description     : Data logic of the ipp checksum.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_sum_data (din_wrd, hdr_off,
                 byt_ena, sel_awd, 
                 sel_asw7,
                 sel_asw6,
                 sel_asw5,
                 sel_asw3,
                 sel_asw2,
                 sel_asw1,
                 sel_bwd7,
                 sel_bwd5,
                 sel_bwd4,
                 sel_bwd3,
                 sel_bwd1,
                 sel_add,
                 inp_uln,
                 get_uln,
                 add_uln,
                 clr,     clk,
                 sum_prt_cksum, c_dsum_fail);

input  [127:0] din_wrd;
input    [3:0] hdr_off;
input   [15:0] byt_ena;
input    [1:0] sel_awd;
input          sel_asw7;
input          sel_asw6;
input          sel_asw5;
input          sel_asw3;
input          sel_asw2;
input          sel_asw1;
input          sel_bwd7;
input          sel_bwd5;
input          sel_bwd4;
input          sel_bwd3;
input          sel_bwd1;
input          sel_add;
input   [15:0] inp_uln;
input          get_uln;
input          add_uln;
input          clr;
input          clk;
output  [15:0] sum_prt_cksum;
output         c_dsum_fail;

wire    [15:0] sum_prt_cksum;
wire           c_dsum_fail;

wire    [15:0] sum_wrd1;
wire    [15:0] sum_wrd2;
wire    [15:0] sum_wrd3;
wire    [15:0] sum_wrd4;
wire    [15:0] sum_wrd5;
wire    [15:0] sum_wrd6;
wire    [15:0] sum_wrd7;

wire           sel_add_q = sel_add || add_uln;

  ipp_sum_dev_01_0q su_dev_01_0q_0 (
                               .inp_wd3    (sum_wrd4[15:0]),
                               .inp_wd2    (sum_wrd2[15:0]),
                               .inp_wd1    (sum_wrd1[15:0]),
                               .inp_wrd    (din_wrd[15:00]),
                               .byt_ena    (byt_ena[01:00]),
                               .sel_awd    (sel_awd[1:0]),
                               .sel_add    (sel_add_q),
                               .clr        (clr),
                               .clk        (clk),
                               .prt_cksum  (sum_prt_cksum[15:0]),
                               .cksum_fail (c_dsum_fail) 
                              );

  ipp_sum_dev_01_ut su_dev_01_ut_1 (
                               .inp_uln    (inp_uln[15:00]),
                               .inp_wrd    (din_wrd[31:16]),
                               .hdr_off    (hdr_off[03:0]),
                               .byt_ena    (byt_ena[03:02]),
                               .sel_asw    (sel_asw1),
                               .sel_bwd    (sel_bwd1),
                               .sel_add    (sel_add),
                               .get_uln    (get_uln),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd1[15:0])
                              );

  ipp_sum_dev_01_0s su_dev_01_0s_2 (
                               .inp_wd1    (sum_wrd3[15:0]),
                               .inp_wrd    (din_wrd[47:32]),
                               .byt_ena    (byt_ena[05:04]),
                               .sel_awd    (sel_awd[0]),
                               .sel_asw    (sel_asw2),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd2[15:0])
                              );

  ipp_sum_dev_01_0t su_dev_01_0t_3 (
                               .inp_wrd    (din_wrd[63:48]),
                               .hdr_off    (hdr_off[03:0]),
                               .byt_ena    (byt_ena[07:06]),
                               .sel_asw    (sel_asw3),
                               .sel_bwd    (sel_bwd3),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd3[15:0])
                              );

  ipp_sum_dev_01_0r su_dev_01_0r_4 (
                               .inp_wd2    (sum_wrd6[15:0]),
                               .inp_wd1    (sum_wrd5[15:0]),
                               .inp_wrd    (din_wrd[79:64]),
                               .hdr_off    (hdr_off[03:0]),
                               .byt_ena    (byt_ena[09:08]),
                               .sel_awd    (sel_awd[1:0]),
                               .sel_bwd    (sel_bwd4),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd4[15:0])
                              );

  ipp_sum_dev_01_0t su_dev_01_0t_5 (
                               .inp_wrd    (din_wrd[95:80]),
                               .hdr_off    (hdr_off[03:0]),
                               .byt_ena    (byt_ena[11:10]),
                               .sel_asw    (sel_asw5),
                               .sel_bwd    (sel_bwd5),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd5[15:0])
                              );

  ipp_sum_dev_01_0s su_dev_01_0s_6 (
                               .inp_wd1    (sum_wrd7[15:0]),
                               .inp_wrd    (din_wrd[111:96]),
                               .byt_ena    (byt_ena[13:12]),
                               .sel_awd    (sel_awd[0]),
                               .sel_asw    (sel_asw6),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd6[15:0])
                              );

  ipp_sum_dev_01_0t su_dev_01_0t_7 (
                               .inp_wrd    (din_wrd[127:112]),
                               .hdr_off    (hdr_off[03:0]),
                               .byt_ena    (byt_ena[15:14]),
                               .sel_asw    (sel_asw7),
                               .sel_bwd    (sel_bwd7),
                               .sel_add    (sel_add),
                               .clr        (clr),
                               .clk        (clk),
                               .sum_wrd    (sum_wrd7[15:0])
                              );

endmodule

