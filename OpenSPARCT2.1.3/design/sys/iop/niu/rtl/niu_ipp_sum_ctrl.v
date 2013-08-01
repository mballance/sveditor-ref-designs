// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_sum_ctrl.v
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

    File name       : niu_ipp_sum_ctrl.v

    Module(s) name  : niu_ipp_sum_ctrl
    Original:       : sum_ctrl.v main.17, label:               

    Parent modules  : niu_ipp_sum.v

    Child modules   : niu_ipp_sum_lib.v, niu_ipp_sum_lib.h,

    Author's name   : George Chu

    Date            : March. 2004

    Description     : Control logic of the ipp checksum.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

`include "niu_ipp_sum_lib.h"

module niu_ipp_sum_ctrl (din_wrd, port_num,        ipp_full_cksum,
                 ipp_la4_prot,    ipp_la3_vers,    ipp_la2_opti, ip4_hdr_leng,
                 ipp_info_valid,  ipp_start_cksum, ipp_pkt_end,  ipp_max_bytes,
                 c_dsum_fail,     
                 reset,           clk,
                 clr,
                 hdr_off,
                 sel_awd,sel_asw, sel_bwd,         sel_add,      byt_ena,
                 udp_dat_len_r,   get_uln,         add_uln,  
                 sum_prt_started, sum_prt_valid,   
                 sum_prt_fail,    sum_prt_length, 
                 sum_prt_state);

input  [127:0] din_wrd;
input          port_num;
input          ipp_full_cksum;
input    [1:0] ipp_la4_prot;
input    [1:0] ipp_la3_vers;
input    [1:0] ipp_la2_opti;
input    [3:0] ip4_hdr_leng;
input          ipp_info_valid;
input          ipp_start_cksum;
input          ipp_pkt_end;
input   [16:0] ipp_max_bytes;
input          c_dsum_fail;
input          reset;
input          clk;
output         clr;
output   [3:0] hdr_off;
output   [1:0] sel_awd;
output   [7:0] sel_asw;
output   [7:0] sel_bwd;
output         sel_add;
output  [15:0] byt_ena;
output  [15:0] udp_dat_len_r;
output         get_uln;
output         add_uln;
output         sum_prt_started;
output         sum_prt_valid;
output         sum_prt_fail;
output  [15:0] sum_prt_length;
output  [31:0] sum_prt_state;

wire     [3:0] hdr_off, n_hdr_off;
wire     [1:0] sel_awd, n_sel_awd;
wire     [7:0] sel_asw, n_sel_asw;
wire     [7:0] sel_bwd, n_sel_bwd;
wire           sel_add;
wire    [15:0] byt_ena, n_byt_ena;

wire    [15:0] udp_dat_len_r;
wire           get_uln, n_get_uln;
wire           add_uln, n_add_uln;

wire           sum_prt_started, n_sum_prt_started;
wire           sum_prt_valid,   n_sum_prt_valid;
wire           sum_prt_fail;
reg            n_sum_prt_fail;
wire    [15:0] sum_prt_length;
wire    [31:0] sum_prt_state;

reg      [8:0] n_cksum_st;
wire     [8:0] c_cksum_st;

reg      [7:0] aw;
reg      [7:0] bw;
reg     [15:0] bn;

wire           prt_vld_cyc = port_num && ipp_info_valid;
wire           prt_vld_end = prt_vld_cyc && ipp_pkt_end;
wire           c_pkt_ended;
reg            n_pkt_ended;

wire           cur_sta_prt = prt_vld_cyc && ipp_start_cksum;
wire           reg_sta_prt;
wire           sta_prt     = !reg_sta_prt && cur_sta_prt;

wire           fsum        = ipp_full_cksum; // geo: N2: RX full_checksum, TX Partial checksum. 
wire     [1:0] ipp_la4_prot_r;
wire     [1:0] ipp_la3_vers_r;
wire     [1:0] ipp_la2_opti_r;
wire     [1:0] ipp_la3_vers_f = ipp_la3_vers_r[1:0];
wire     [3:0] hdr_r;
wire           la4_udp        = (ipp_la4_prot[1:0]==2'b10); 
wire           udp_r;

reg     [15:0] nxt_len_fld;
reg     [16:0] nxt_len_off;
wire     [3:0] l3l2           = {ipp_la3_vers[1:0],ipp_la2_opti[1:0]};
wire     [3:0] l3l2_r;

reg      [3:0] nxt_hdr_off;

reg     [15:0] udp_dat_sum;
reg     [15:0] udp_dat_len;
reg      [2:0] ul;
wire     [2:0] u_len;
reg      [3:0] u_sml;
wire           nxt_udp_sum_is0, udp_sum_is0;
wire    [16:0] nxt_udp_dat_byt;
wire    [16:0] udp_dat_byt;
reg     [16:0] n_udp_hdr_off;
wire    [16:0] udp_hdr_off;
reg      [1:0] n_udp_sel_sum, n_udp_sel_len;
wire     [1:0]   udp_sel_sum,   udp_sel_len;
wire    [12:0] n_tot_udp_bus_cnt;
wire           wt_sum_uby = u_len[0];
wire           wt_len_uby = u_len[1];

wire    [16:0] nxt_sum_dat_byt;
wire    [16:0] sum_dat_byt;
// geo: wire    [12:0] n_tot_pkt_bus_cnt;

wire     [3:0] las_wrd_ena;

wire           err_dat_byt = 
                   (ipp_la4_prot_r==2'h1) && (ipp_la3_vers_f==2'h1) && (sum_dat_byt[16:0]<17'd54) ||
                   (ipp_la4_prot_r==2'h1) && (ipp_la3_vers_f==2'h2) && (sum_dat_byt[16:0]<17'd74) ||
                   (ipp_la4_prot_r==2'h2) && (ipp_la3_vers_f==2'h1) && (sum_dat_byt[16:0]<17'd42) ||
                   (ipp_la4_prot_r==2'h2) && (ipp_la3_vers_f==2'h2) && (sum_dat_byt[16:0]<17'd62) ||
                                             (ipp_la3_vers_f==2'h1) && (hdr_r[3:0]<4'd5) ||
                   (sum_dat_byt[16:0]>ipp_max_bytes[16:0]);
wire           pas_dat_byt = ((ipp_la4_prot_r==2'h0) || (ipp_la4_prot_r==2'h3)) && fsum ||
                              (ipp_la3_vers_f==2'h0) || (ipp_la3_vers_f==2'h3)            ||
                             ((ipp_la3_vers_f==2'h1) || (ipp_la3_vers_f==2'h2)) && udp_sum_is0;

wire    [12:0] rec_bus_cnt;
wire    [12:0] cur_bus_cnt;
wire           beg_bus_cnt, n_beg_bus_cnt;
wire     [2:0] ls3_bus_cnt =  cur_bus_cnt[2:0];
wire     [7:0] vld_bus_cnt;

wire    [13:0] rem_pkt_bus_cnt;
wire           rem_pkt_bus_emp;
wire           cur_pkt_ful_wrd;

wire    [13:0] rem_udp_bus_cnt;
wire           rem_udp_bus_emp                   ;
wire                            n_udp_sht_pkt_end;
wire           cur_udp_ful_wrd;

wire           rem_bus_emp;
wire           cur_ful_wrd;

wire           to_cksum_w0_1;
wire           to_cksum_w0_2;
wire           to_cksum_w1_2;
wire           to_cksum_w1_t;
wire           to_cksum_w0_t;
wire           to_cksum_w1_0;

reg            n_tsum_fail;
wire           c_tsum_fail;

wire           clr         =   n_cksum_st[0];
wire           clr1        =   c_cksum_st[0];

wire           wt_fet_sta  =   n_cksum_st[1]; 
wire           wt_bus_cnt  = ( n_cksum_st[1] || (|c_cksum_st[3:1]) ) && prt_vld_cyc; 
wire           wt_len_byt  =   c_cksum_st[1]    && prt_vld_cyc;
wire           las_wrd_cyc =   c_cksum_st[6];
wire           n_sel_add   = wt_bus_cnt && !c_cksum_st[7] && !c_cksum_st[0] ||  // geo: [7] should never happen
                             (c_cksum_st==`NIU_IPP_CKSUM_W0) ? prt_vld_cyc : las_wrd_cyc;
wire     [1:0] nxt_sel_awd =  n_cksum_st[5:4] | {1'h0,n_cksum_st[8]};

wire           c_dsum_fail_full = c_dsum_fail && fsum;
wire    [22:0] sum_cnd          = {vld_bus_cnt[7:0],sum_prt_length[11:0],c_dsum_fail_full,c_tsum_fail,err_dat_byt};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  assign       sum_prt_state = {sum_cnd[22:0],c_cksum_st[8:0]};

// geo: ------------ ipv4 header -------------

  always @(ip4_hdr_leng)
    case  (ip4_hdr_leng)               // synopsys parallel_case
      (4'b0101):  begin nxt_hdr_off = 4'b1011; end
      (4'b0110):  begin nxt_hdr_off = 4'b1010; end
      (4'b0111):  begin nxt_hdr_off = 4'b1001; end
      (4'b1000):  begin nxt_hdr_off = 4'b1000; end
      (4'b1001):  begin nxt_hdr_off = 4'b0111; end
      (4'b1010):  begin nxt_hdr_off = 4'b0110; end
      (4'b1011):  begin nxt_hdr_off = 4'b0101; end
      (4'b1100):  begin nxt_hdr_off = 4'b0100; end
      (4'b1101):  begin nxt_hdr_off = 4'b0011; end
      (4'b1110):  begin nxt_hdr_off = 4'b0010; end
      (4'b1111):  begin nxt_hdr_off = 4'b0001; end
        default:  begin nxt_hdr_off = 4'b1011; end
    endcase

// geo: ------------ udp_length --------------

/***** geo: 
  always @(udp_dat_len)
    casez (udp_dat_len)               // synopsys parallel_case
      (16'b0000_0000_0000_0???):  begin u_sml = 4'b0000; end
      (16'b0000_0000_0000_1000):  begin u_sml = 4'b0001; end

      (16'b0000_0000_0000_1001):  begin u_sml = 4'b0010; end
      (16'b0000_0000_0000_1010):  begin u_sml = 4'b0010; end

      (16'b0000_0000_0000_1011):  begin u_sml = 4'b0011; end
      (16'b0000_0000_0000_1100):  begin u_sml = 4'b0011; end

      (16'b0000_0000_0000_1101):  begin u_sml = 4'b0100; end
      (16'b0000_0000_0000_1110):  begin u_sml = 4'b0100; end

      (16'b0000_0000_0000_1111):  begin u_sml = 4'b0101; end
      (16'b0000_0000_0001_0000):  begin u_sml = 4'b0101; end

      (16'b0000_0000_0001_0001):  begin u_sml = 4'b0110; end
      (16'b0000_0000_0001_0010):  begin u_sml = 4'b0110; end

                        default:  begin u_sml = 4'b0000; end
    endcase
*****/

  always @(udp_dat_len)
    casez (udp_dat_len)               // synopsys parallel_case
      (16'b0000_0000_0000_0???):  begin u_sml = 4'b0000; end
      (16'b0000_0000_0000_1000):  begin u_sml = 4'b0001; end
      (16'b0000_0000_0000_1001):  begin u_sml = 4'b0010; end
      (16'b0000_0000_0000_1010):  begin u_sml = 4'b0011; end
      (16'b0000_0000_0000_1011):  begin u_sml = 4'b0100; end
      (16'b0000_0000_0000_1100):  begin u_sml = 4'b0101; end
      (16'b0000_0000_0000_1101):  begin u_sml = 4'b0110; end
      (16'b0000_0000_0000_1110):  begin u_sml = 4'b0111; end
      (16'b0000_0000_0000_1111):  begin u_sml = 4'b1000; end
      (16'b0000_0000_0001_0000):  begin u_sml = 4'b1001; end
      (16'b0000_0000_0001_0001):  begin u_sml = 4'b1010; end
      (16'b0000_0000_0001_0010):  begin u_sml = 4'b1011; end
                        default:  begin u_sml = 4'b0000; end
    endcase

  always @(ip4_hdr_leng or ipp_la3_vers or ipp_la2_opti)
    casez ({ip4_hdr_leng,ipp_la3_vers,ipp_la2_opti})               // synopsys parallel_case
//         (4'b00_00):  begin   nxt_len_off = 17'd14; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h0; end
      (8'b????_00_00):  begin n_udp_hdr_off = 17'd34; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h0; end

//         (4'b01_00):  begin   nxt_len_off = 17'd14; end
      (8'b0101_01_00):  begin n_udp_hdr_off = 17'd34; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b0110_01_00):  begin n_udp_hdr_off = 17'd38; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b0111_01_00):  begin n_udp_hdr_off = 17'd42; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1000_01_00):  begin n_udp_hdr_off = 17'd46; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1001_01_00):  begin n_udp_hdr_off = 17'd50; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1010_01_00):  begin n_udp_hdr_off = 17'd54; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1011_01_00):  begin n_udp_hdr_off = 17'd58; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1100_01_00):  begin n_udp_hdr_off = 17'd62; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1101_01_00):  begin n_udp_hdr_off = 17'd66; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1110_01_00):  begin n_udp_hdr_off = 17'd70; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1111_01_00):  begin n_udp_hdr_off = 17'd74; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end

//         (4'b01_01):  begin   nxt_len_off = 17'd18; end
      (8'b0101_01_01):  begin n_udp_hdr_off = 17'd38; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b0110_01_01):  begin n_udp_hdr_off = 17'd42; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b0111_01_01):  begin n_udp_hdr_off = 17'd46; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1000_01_01):  begin n_udp_hdr_off = 17'd50; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1001_01_01):  begin n_udp_hdr_off = 17'd54; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1010_01_01):  begin n_udp_hdr_off = 17'd58; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1011_01_01):  begin n_udp_hdr_off = 17'd62; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1100_01_01):  begin n_udp_hdr_off = 17'd66; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1101_01_01):  begin n_udp_hdr_off = 17'd70; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1110_01_01):  begin n_udp_hdr_off = 17'd74; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1111_01_01):  begin n_udp_hdr_off = 17'd78; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end

//         (4'b01_10):  begin   nxt_len_off = 17'd22; end
      (8'b0101_01_10):  begin n_udp_hdr_off = 17'd42; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b0110_01_10):  begin n_udp_hdr_off = 17'd46; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b0111_01_10):  begin n_udp_hdr_off = 17'd50; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1000_01_10):  begin n_udp_hdr_off = 17'd54; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1001_01_10):  begin n_udp_hdr_off = 17'd58; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1010_01_10):  begin n_udp_hdr_off = 17'd62; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1011_01_10):  begin n_udp_hdr_off = 17'd66; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1100_01_10):  begin n_udp_hdr_off = 17'd70; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1101_01_10):  begin n_udp_hdr_off = 17'd74; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1110_01_10):  begin n_udp_hdr_off = 17'd78; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1111_01_10):  begin n_udp_hdr_off = 17'd82; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end

//         (4'b01_11):  begin   nxt_len_off = 17'd26; end
      (8'b0101_01_11):  begin n_udp_hdr_off = 17'd46; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b0110_01_11):  begin n_udp_hdr_off = 17'd50; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b0111_01_11):  begin n_udp_hdr_off = 17'd54; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1000_01_11):  begin n_udp_hdr_off = 17'd58; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1001_01_11):  begin n_udp_hdr_off = 17'd62; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1010_01_11):  begin n_udp_hdr_off = 17'd66; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1011_01_11):  begin n_udp_hdr_off = 17'd70; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b1100_01_11):  begin n_udp_hdr_off = 17'd74; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b1101_01_11):  begin n_udp_hdr_off = 17'd78; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b1110_01_11):  begin n_udp_hdr_off = 17'd82; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end
      (8'b1111_01_11):  begin n_udp_hdr_off = 17'd86; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end

      (8'b????_10_00):  begin n_udp_hdr_off = 17'd54; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h1; end
      (8'b????_10_01):  begin n_udp_hdr_off = 17'd58; n_udp_sel_sum = 2'h3; n_udp_sel_len = 2'h0; end
      (8'b????_10_10):  begin n_udp_hdr_off = 17'd62; n_udp_sel_sum = 2'h2; n_udp_sel_len = 2'h3; end
      (8'b????_10_11):  begin n_udp_hdr_off = 17'd66; n_udp_sel_sum = 2'h1; n_udp_sel_len = 2'h2; end

              default:  begin n_udp_hdr_off = 17'd34; n_udp_sel_sum = 2'h0; n_udp_sel_len = 2'h0; end
    endcase

// geo: ------------ byte_enables ------------

always @(fsum or udp_r or u_sml or hdr_r or c_pkt_ended or las_wrd_cyc or las_wrd_ena or l3l2_r or beg_bus_cnt or ls3_bus_cnt)
casez({fsum,udp_r,u_sml,hdr_r,c_pkt_ended,las_wrd_cyc,las_wrd_ena,l3l2_r,beg_bus_cnt,ls3_bus_cnt})//synopsys parallel_case
//geof u      ipv4 e l  las       b ls3
//geos d udp hdr_r n a  wrd       e bus                               1  1  1
//geou p sml  3210 d s  ena l3 l2 g cnt                0  2  4  6  8  0  2  4         tstr_tstq        tstr_tstq
//GE m   (18'b0101_0_0_????_00_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_0101_0_0_????_00_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

//GE     (18'b0101_0_0_????_01_??_1_000): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_0101_0_0_????_01_??_1_000): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

// geo: -hd=5------i4__e---------------------------
(24'b1_0_????_0101_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_0000_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_0000_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b1_1_0001_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0001_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0010_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0010_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0011_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0011_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0100_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0100_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0101_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0101_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0110_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0110_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0111_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0111_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_100?_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_100?_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_101?_0101_0_0_????_01_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_101?_0101_0_0_????_01_00_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=6------i4__e---------------------------
(24'b1_0_????_0110_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_0000_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_0000_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b1_1_0001_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0001_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0010_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0010_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0011_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0011_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_010?_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_010?_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_011?_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_011?_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_100?_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_100?_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_101?_0110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_101?_0110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=7------i4__e---------------------------
(24'b1_0_????_0111_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0111_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0111_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b0_1_????_0111_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end

(24'b?_1_????_0111_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=8------i4__e---------------------------
(24'b1_0_????_1000_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1000_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1000_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1000_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1000_0_0_????_01_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=9------i4__e---------------------------
(24'b1_0_????_1001_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1001_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1001_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1001_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b?_1_0001_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1001_0_0_????_01_00_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=a------i4__e---------------------------
(24'b1_0_????_1010_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1010_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1010_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1010_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b?_1_0001_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1010_0_0_????_01_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=b------i4__e---------------------------
(24'b1_0_????_1011_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1011_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1011_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1011_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1011_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end

(24'b?_1_????_1011_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=c------i4__e---------------------------
(24'b1_0_????_1100_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1100_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1100_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1100_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1100_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1100_0_0_????_01_00_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=d------i4__e---------------------------
(24'b1_0_????_1101_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1101_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1101_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1101_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b?_1_0001_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1101_0_0_????_01_00_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=e------i4__e---------------------------
(24'b1_0_????_1110_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1110_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1110_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

(24'b?_1_0001_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1110_0_0_????_01_00_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=f------i4__e---------------------------
(24'b1_0_????_1111_0_0_????_01_00_1_001): begin bn=16'b11_00_00_01_00_11_11_11; bw=8'b1000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1111_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_00_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_01_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1111_0_0_????_01_00_1_010): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1111_0_0_????_01_00_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1111_0_0_????_01_00_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end

(24'b?_1_????_1111_0_0_????_01_00_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=5------i4__v---------------------------
(24'b1_0_????_0101_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_0000_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_0000_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_0001_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0001_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0010_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0010_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0011_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0011_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_010?_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_010?_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_011?_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_011?_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_100?_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_100?_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_101?_0101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_101?_0101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=6------i4__v---------------------------
(24'b1_0_????_0110_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0110_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0110_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b0_1_????_0110_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end

(24'b?_1_????_0110_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=7------i4__v---------------------------
(24'b1_0_????_0111_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0111_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0111_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_0111_0_0_????_01_01_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=8------i4__v---------------------------
(24'b1_0_????_1000_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1000_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1000_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1000_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1000_0_0_????_01_01_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=9------i4__v---------------------------
(24'b1_0_????_1001_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1001_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1001_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1001_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1001_0_0_????_01_01_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=a------i4__v---------------------------
(24'b1_0_????_1010_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1010_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1010_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1010_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1010_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1010_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1010_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=b------i4__v---------------------------
(24'b1_0_????_1011_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1011_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1011_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1011_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1011_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1011_0_0_????_01_01_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=c------i4__v---------------------------
(24'b1_0_????_1100_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1100_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1100_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1100_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1100_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1100_0_0_????_01_01_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=d------i4__v---------------------------
(24'b1_0_????_1101_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1101_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1101_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1101_0_0_????_01_01_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=e------i4__v---------------------------
(24'b1_0_????_1110_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1110_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_01_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1110_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1110_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1110_0_0_????_01_01_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1110_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=f------i4__v---------------------------
(24'b1_0_????_1111_0_0_????_01_01_1_001): begin bn=16'b00_00_11_00_00_01_00_11; bw=8'b0010_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1111_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_01_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_01_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1111_0_0_????_01_01_1_010): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1111_0_0_????_01_01_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1111_0_0_????_01_01_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1111_0_0_????_01_01_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=5------i4_l----------------------------
(24'b1_0_????_0101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0101_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_0101_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0101_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b0_1_????_0101_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_0101_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=6------i4_l----------------------------
(24'b1_0_????_0110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0110_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0110_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_0110_0_0_????_01_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=7------i4_l----------------------------
(24'b1_0_????_0111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0111_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0111_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_0111_0_0_????_01_10_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=8------i4_l----------------------------
(24'b1_0_????_1000_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1000_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1000_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1000_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1000_0_0_????_01_10_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=9------i4_l----------------------------
(24'b1_0_????_1001_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1001_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1001_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1001_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1001_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1001_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1001_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=a------i4_l----------------------------
(24'b1_0_????_1010_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1010_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1010_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1010_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1010_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1010_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1010_0_0_????_01_10_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=b------i4_l----------------------------
(24'b1_0_????_1011_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1011_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1011_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1011_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1011_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1011_0_0_????_01_10_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=c------i4_l----------------------------
(24'b1_0_????_1100_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1100_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1100_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1100_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1100_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1100_0_0_????_01_10_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=d------i4_l----------------------------
(24'b1_0_????_1101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1101_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1101_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1101_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1101_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1101_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=e------i4_l----------------------------
(24'b1_0_????_1110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1110_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1110_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1110_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1110_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1110_0_0_????_01_10_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=f------i4_l----------------------------
(24'b1_0_????_1111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_11_00_00_01; bw=8'b0000_1000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1111_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_01; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1111_0_0_????_01_10_1_010): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1111_0_0_????_01_10_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1111_0_0_????_01_10_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1111_0_0_????_01_10_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=5------i4_vl---------------------------
(24'b1_0_????_0101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0101_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0101_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0101_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0101_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_0101_0_0_????_01_11_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=6------i4_vl---------------------------
(24'b1_0_????_0110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0110_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0110_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0110_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0110_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_0110_0_0_????_01_11_1_011): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=7------i4_vl---------------------------
(24'b1_0_????_0111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_0111_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_0111_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_0111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_0111_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_0111_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_0111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=8------i4_vl---------------------------
(24'b1_0_????_1000_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1000_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1000_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1000_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1000_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1000_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1000_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1000_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1000_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=9------i4_vl---------------------------
(24'b1_0_????_1001_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1001_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1001_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1001_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1001_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1001_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1001_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1001_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1001_0_0_????_01_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=a------i4_vl---------------------------
(24'b1_0_????_1010_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1010_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1010_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1010_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1010_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1010_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1010_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1010_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1010_0_0_????_01_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=b------i4_vl---------------------------
(24'b1_0_????_1011_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1011_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1011_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1011_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1011_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1011_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1011_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1011_0_0_????_01_11_1_100): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=c------i4_vl---------------------------
(24'b1_0_????_1100_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1100_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1100_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1100_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1100_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1100_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1100_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1100_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1100_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b?_1_????_1100_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -hd=d------i4_vl---------------------------
(24'b1_0_????_1101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1101_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1101_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1101_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1101_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1101_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1101_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1101_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_1101_0_0_????_01_11_1_101): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -hd=e------i4_vl---------------------------
(24'b1_0_????_1110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1110_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1110_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1110_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1110_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1110_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1110_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_100?_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1110_0_0_????_01_11_1_101): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -hd=f------i4_vl---------------------------
(24'b1_0_????_1111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_11_00; bw=8'b0000_0010; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_1111_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_1111_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_0_????_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_1111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_1111_0_0_????_01_11_1_010): begin bn=16'b00_01_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_1111_0_0_????_01_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_????_1111_0_0_????_01_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_????_1111_0_0_????_01_11_1_100): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_1_0000_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_010?_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_011?_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_100?_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_101?_1111_0_0_????_01_11_1_101): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: ------------- ipv6 ------------------------
//  GE   (18'b????_0_0_????_10_??_1_000): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_0_????_10_??_1_000): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

// geo: -----------i6__e---------------------------
(24'b1_0_????_????_0_0_????_10_00_1_001): begin bn=16'b00_11_10_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0010_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_????_0_0_????_10_00_1_001): begin bn=16'b00_00_10_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0010_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_00_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_00_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_00_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_0000_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_0000_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_0001_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0001_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0010_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0010_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0011_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0011_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_010?_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_010?_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_011?_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_011?_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_100?_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_100?_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_101?_????_0_0_????_10_00_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_101?_????_0_0_????_10_00_1_011): begin bn=16'b00_00_00_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: -----------i6__v---------------------------
(24'b1_0_????_????_0_0_????_10_01_1_001): begin bn=16'b00_00_00_11_10_11_11_11; bw=8'b0000_0000; aw=8'b0000_1000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_01_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_01_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_????_0_0_????_10_01_1_001): begin bn=16'b00_00_00_00_10_11_11_11; bw=8'b0000_0000; aw=8'b0000_1000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_01_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_01_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_01_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_01_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end
(24'b0_1_????_????_0_0_????_10_01_1_011): begin bn=16'b00_00_00_00_00_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h2; end

(24'b?_1_????_????_0_0_????_10_01_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h1; end

// geo: -----------i6_l----------------------------
(24'b1_0_????_????_0_0_????_10_10_1_001): begin bn=16'b00_00_00_00_00_11_10_11; bw=8'b0000_0000; aw=8'b0000_0010; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_10_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_10_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_????_0_0_????_10_10_1_001): begin bn=16'b00_00_00_00_00_00_10_11; bw=8'b0000_0000; aw=8'b0000_0010; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_10_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_10_1_010): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_10_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_10_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_10_1_011): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_1_0000_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b?_1_0001_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0010_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0011_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0100_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0101_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0110_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_0111_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1000_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1001_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1010_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b?_1_1011_????_0_0_????_10_10_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end

// geo: -----------i6_vl---------------------------
(24'b1_0_????_????_0_0_????_10_11_1_001): begin bn=16'b00_00_00_00_00_00_00_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_11_1_010): begin bn=16'b10_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b1000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_11_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_0_????_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_0_????_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_????_????_0_0_????_10_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_11_1_001): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_11_1_010): begin bn=16'b10_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b1000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_11_1_010): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b1_1_????_????_0_0_????_10_11_1_011): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b0_1_????_????_0_0_????_10_11_1_011): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b1_1_0000_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_0000_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_0001_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0001_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0010_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0010_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0011_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0011_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0100_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0100_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0101_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0101_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0110_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0110_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_0111_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b0_1_0111_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h7; end
(24'b1_1_100?_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_100?_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b1_1_101?_????_0_0_????_10_11_1_100): begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end
(24'b0_1_101?_????_0_0_????_10_11_1_100): begin bn=16'b00_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h3; end

// geo: ------------- ip unknown ------------------
//  GE   (18'b????_0_0_????_11_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_0_????_11_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

// geo: ----------lase-----------------------------
(24'b?_?_????_????_0_1_0000_??_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0001_??_??_?_???): begin bn=16'b10_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0010_??_??_?_???): begin bn=16'b11_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0011_??_??_?_???): begin bn=16'b11_10_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0100_??_??_?_???): begin bn=16'b11_11_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0101_??_??_?_???): begin bn=16'b11_11_10_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0110_??_??_?_???): begin bn=16'b11_11_11_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_0111_??_??_?_???): begin bn=16'b11_11_11_10_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1000_??_??_?_???): begin bn=16'b11_11_11_11_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1001_??_??_?_???): begin bn=16'b11_11_11_11_10_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1010_??_??_?_???): begin bn=16'b11_11_11_11_11_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1011_??_??_?_???): begin bn=16'b11_11_11_11_11_10_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1100_??_??_?_???): begin bn=16'b11_11_11_11_11_11_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1101_??_??_?_???): begin bn=16'b11_11_11_11_11_11_10_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1110_??_??_?_???): begin bn=16'b11_11_11_11_11_11_11_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
(24'b?_?_????_????_0_1_1111_??_??_?_???): begin bn=16'b11_11_11_11_11_11_11_10; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end

(24'b?_?_????_????_1_?_????_??_??_?_???): begin bn=16'b00_00_00_00_00_00_00_00; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
                                 default: begin bn=16'b11_11_11_11_11_11_11_11; bw=8'b0000_0000; aw=8'b0000_0000; ul=3'h0; end
endcase

  assign n_byt_ena = bn[15:0];
  assign n_sel_bwd = bw[7:0];
  assign n_sel_asw = aw[7:0];
  assign u_len     = ul[2:0];

  assign n_get_uln = (c_cksum_st==`NIU_IPP_CKSUM_W3) && udp_r;
  assign n_add_uln = (c_cksum_st==`NIU_IPP_CKSUM_UL) && fsum;

// geo: ------------ udp_data ----------------

  always @(udp_sel_len or 
           din_wrd)
    case  (udp_sel_len[1:0])               // synopsys parallel_case
      (2'b00):  begin udp_dat_len = din_wrd[015:000]; end
      (2'b01):  begin udp_dat_len = din_wrd[047:032]; end
      (2'b10):  begin udp_dat_len = din_wrd[079:064]; end
      (2'b11):  begin udp_dat_len = din_wrd[111:096]; end
      default:  begin udp_dat_len = din_wrd[015:000]; end
    endcase

  always @(udp_sel_sum or 
           din_wrd)
    case  (udp_sel_sum[1:0])               // synopsys parallel_case
      (2'b00):  begin udp_dat_sum = din_wrd[031:016]; end
      (2'b01):  begin udp_dat_sum = din_wrd[063:048]; end
      (2'b10):  begin udp_dat_sum = din_wrd[095:080]; end
      (2'b11):  begin udp_dat_sum = din_wrd[127:112]; end
      default:  begin udp_dat_sum = din_wrd[031:016]; end
    endcase

  assign nxt_udp_sum_is0 = (udp_dat_sum[15:0]==16'h0) && udp_r;

  ipp_sum_reg_w_r_1  su_reg_w_r_1_usu  (.di(nxt_udp_sum_is0),   .wr(wt_sum_uby), .rs(clr), .ck(clk), .qo(udp_sum_is0));
  ipp_sum_reg_w_r_16 su_reg_w_r_16_ule (.di(udp_dat_len[15:0]), .wr(wt_len_uby), .rs(clr), .ck(clk), .qo(udp_dat_len_r[15:0]));

// geo: ------------ data_length -------------

  always @(ipp_la3_vers_r  or ipp_la2_opti_r or
           din_wrd)
    case  ({ipp_la3_vers_r,ipp_la2_opti_r})               // synopsys parallel_case
      (4'b00_00):  begin nxt_len_fld = 16'd0;            nxt_len_off = 17'd14; end
      (4'b01_00):  begin nxt_len_fld = din_wrd[127:112]; nxt_len_off = 17'd14; end
      (4'b10_00):  begin nxt_len_fld = din_wrd[111:096]; nxt_len_off = 17'd54; end
      (4'b01_01):  begin nxt_len_fld = din_wrd[095:080]; nxt_len_off = 17'd18; end
      (4'b10_01):  begin nxt_len_fld = din_wrd[079:064]; nxt_len_off = 17'd58; end
      (4'b01_10):  begin nxt_len_fld = din_wrd[063:048]; nxt_len_off = 17'd22; end
      (4'b10_10):  begin nxt_len_fld = din_wrd[047:032]; nxt_len_off = 17'd62; end
      (4'b01_11):  begin nxt_len_fld = din_wrd[031:016]; nxt_len_off = 17'd26; end
      (4'b10_11):  begin nxt_len_fld = din_wrd[015:000]; nxt_len_off = 17'd66; end
         default:  begin nxt_len_fld = 16'd0;            nxt_len_off = 17'd14; end
    endcase

  assign nxt_sum_dat_byt[16:1] = {1'b0,nxt_len_fld[15:1]} + nxt_len_off[16:1];
  assign nxt_sum_dat_byt[0]    =       nxt_len_fld[0];

  ipp_sum_reg_w_r_16 su_reg_w_r_16_fld (nxt_len_fld[15:0],    wt_len_byt,clr1,clk,sum_prt_length[15:0]);
  ipp_sum_reg_w_r_17 su_reg_w_r_17_sby (nxt_sum_dat_byt[16:0],wt_len_byt,clr, clk,sum_dat_byt[16:0]);

  assign nxt_udp_dat_byt[16:1] = {1'b0,udp_dat_len[15:1]} + udp_hdr_off[16:1];
  assign nxt_udp_dat_byt[0]    =       udp_dat_len[0];

  ipp_sum_reg_w_r_17 su_reg_w_r_17_uby (nxt_udp_dat_byt[16:0],wt_len_uby,clr,clk,udp_dat_byt[16:0]);

// geo: ------------ bus_cyc_cnt ------------

  assign rec_bus_cnt   = cur_bus_cnt[12:0] + 13'h1;
  assign n_beg_bus_cnt = (rec_bus_cnt[12:3]==10'h0);

  ipp_sum_reg_w_r_13 su_reg_w_r_13_cnt (rec_bus_cnt[12:0],wt_bus_cnt,clr,clk,cur_bus_cnt[12:0]);
  ipp_sum_reg_w_r_1  su_reg_w_r_1_beg  (n_beg_bus_cnt,    wt_bus_cnt,clr,clk,beg_bus_cnt);

// geo: ------------ rec_ful_wrd ------------

  assign rem_pkt_bus_cnt = {1'b0,sum_dat_byt[16:4]} + {1'b0,~cur_bus_cnt[12:0]};
  assign rem_pkt_bus_emp = (sum_dat_byt[16:4]==rec_bus_cnt[12:0]);
  assign cur_pkt_ful_wrd = rem_pkt_bus_cnt[13];

//                       .....

  assign rem_udp_bus_cnt = {1'b0,udp_dat_byt[16:4]} + {1'b0,~cur_bus_cnt[12:0]};
  assign rem_udp_bus_emp = (udp_dat_byt[16:4]==rec_bus_cnt[12:0]);
  assign cur_udp_ful_wrd = rem_udp_bus_cnt[13];

  assign n_tot_udp_bus_cnt = wt_len_uby ? nxt_udp_dat_byt[16:4] : udp_dat_byt[16:4];
  assign n_udp_sht_pkt_end = (n_tot_udp_bus_cnt[12:0]==rec_bus_cnt[12:0]) && !u_len[2] && wt_len_uby;

//                       .....
  assign rem_bus_emp = udp_r ? rem_udp_bus_emp   : rem_pkt_bus_emp;
  assign cur_ful_wrd = udp_r ? cur_udp_ful_wrd   : cur_pkt_ful_wrd;
  assign las_wrd_ena = udp_r ? udp_dat_byt[03:0] : sum_dat_byt[03:0];

// geo: ------------ control ----------------

 assign n_sum_prt_started = !n_cksum_st[0];
 assign n_sum_prt_valid   =  c_cksum_st[7];

 assign to_cksum_w0_1 = prt_vld_cyc &&  cur_ful_wrd && rem_bus_emp;
 assign to_cksum_w0_2 = prt_vld_cyc && (cur_ful_wrd && rem_bus_emp || n_udp_sht_pkt_end);
 assign to_cksum_w1_2 = prt_vld_cyc && (                                                          u_len[2]);
 assign to_cksum_w1_t = prt_vld_cyc && (cur_ful_wrd && rem_bus_emp && (las_wrd_ena[3:0]==4'h0) || u_len[2]);
 assign to_cksum_w0_t = prt_vld_cyc && (rem_bus_emp || n_udp_sht_pkt_end) || prt_vld_end;
 assign to_cksum_w1_0 = prt_vld_cyc ||  c_pkt_ended;

// geo: ------------ state_machine ----------
/* c_cksum_st can have max only2 bits set fot state_variable */
/* 0in bits_on -var c_cksum_st -max 3 */

/* These checkers check for the transition of the state variable. */
/* c_cksum_st can transition from NIU_IPP_IDLE_CKSUM to NIU_IPP_CKSUM_D1 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_IDLE_CKSUM -next `NIU_IPP_CKSUM_D1 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_D1 to NIU_IPP_CKSUM_W4, NIU_IPP_CKSUM_W0, NIU_IPP_CKSUM_D2 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_D1 -next `NIU_IPP_CKSUM_W4 `NIU_IPP_CKSUM_W0 `NIU_IPP_CKSUM_D2 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_D2 to NIU_IPP_CKSUM_W4, NIU_IPP_CKSUM_W1, NIU_IPP_CKSUM_W0, NIU_IPP_CKSUM_DT */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_D2 -next `NIU_IPP_CKSUM_W4 `NIU_IPP_CKSUM_W1
                                                                     `NIU_IPP_CKSUM_W0 `NIU_IPP_CKSUM_DT */

/* c_cksum_st can transition from NIU_IPP_CKSUM_DT to NIU_IPP_CKSUM_W1, NIU_IPP_CKSUM_W0 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_DT -next `NIU_IPP_CKSUM_W1 `NIU_IPP_CKSUM_W0 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_W0 to NIU_IPP_CKSUM_W1 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_W0 -next `NIU_IPP_CKSUM_W1 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_W1 to NIU_IPP_CKSUM_W2 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_W1 -next `NIU_IPP_CKSUM_W2 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_W2 to NIU_IPP_CKSUM_W3 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_W2 -next `NIU_IPP_CKSUM_W3 */

/* c_cksum_st can transition from NIU_IPP_CKSUM_W3 to NIU_IPP_CKSUM_W4, NIU_IPP_CKSUM_UL */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_W3 -next `NIU_IPP_CKSUM_W4
                                                                     `NIU_IPP_CKSUM_UL */

/* c_cksum_st can transition from NIU_IPP_CKSUM_W4 to NIU_IPP_IDLE_CKSUM */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_W4 -next `NIU_IPP_IDLE_CKSUM */

/* c_cksum_st can transition from NIU_IPP_CKSUM_UL to NIU_IPP_CKSUM_W4 */
/* 0in state_transition -var c_cksum_st -val `NIU_IPP_CKSUM_UL -next `NIU_IPP_CKSUM_W4 */

                      
 always @(c_cksum_st       or
          udp_r            or
          sta_prt          or
          prt_vld_cyc      or
          prt_vld_end      or
          err_dat_byt      or
          pas_dat_byt      or
          c_dsum_fail_full or
          c_tsum_fail      or
          c_pkt_ended      or
          to_cksum_w0_1    or
          to_cksum_w0_2    or
          to_cksum_w1_2    or
          to_cksum_w1_t    or
          to_cksum_w0_t    or
          to_cksum_w1_0
         ) begin

    n_sum_prt_fail = 1'h0;
    n_cksum_st     = `NIU_IPP_IDLE_CKSUM;

    n_tsum_fail    = c_tsum_fail;
    n_pkt_ended    = c_pkt_ended;

    case (c_cksum_st)                 //synopsys parallel_case
      (`NIU_IPP_IDLE_CKSUM): 
        begin
          n_tsum_fail  = 1'h0;
          if      (sta_prt) begin
            n_cksum_st = `NIU_IPP_CKSUM_D1;
          end
          else begin
            n_cksum_st = `NIU_IPP_IDLE_CKSUM;
          end
        end
      (`NIU_IPP_CKSUM_D1):
        begin
          n_pkt_ended    = prt_vld_end;
          if      (pas_dat_byt) begin
            n_tsum_fail = 1'h0;
            n_cksum_st = `NIU_IPP_CKSUM_W4;
          end
          else if (prt_vld_end) begin
            n_tsum_fail = 1'h1;
            n_cksum_st = `NIU_IPP_CKSUM_W4;
          end
          else if (to_cksum_w0_1)
            n_cksum_st = `NIU_IPP_CKSUM_W0;
          else if (prt_vld_cyc)
            n_cksum_st = `NIU_IPP_CKSUM_D2;
          else
            n_cksum_st = `NIU_IPP_CKSUM_D1;
        end
      (`NIU_IPP_CKSUM_D2):
        begin
          n_pkt_ended    = prt_vld_end;
          if      (prt_vld_end || err_dat_byt) begin
            n_tsum_fail = 1'h1;
            n_cksum_st = `NIU_IPP_CKSUM_W4;
          end
          else if (to_cksum_w0_2) begin
            n_cksum_st = `NIU_IPP_CKSUM_W0;
          end
          else if (to_cksum_w1_2) begin
            n_cksum_st = `NIU_IPP_CKSUM_W1;
          end
          else if (prt_vld_cyc)
            n_cksum_st = `NIU_IPP_CKSUM_DT;
          else
            n_cksum_st = `NIU_IPP_CKSUM_D2;
        end
      (`NIU_IPP_CKSUM_DT):
        begin
          n_pkt_ended    = prt_vld_end;
          if      (to_cksum_w1_t)
            n_cksum_st = `NIU_IPP_CKSUM_W1;
          else if (to_cksum_w0_t)
            n_cksum_st = `NIU_IPP_CKSUM_W0;
          else
            n_cksum_st = `NIU_IPP_CKSUM_DT;
        end
      (`NIU_IPP_CKSUM_W0): 
        begin
          if (to_cksum_w1_0)
            n_cksum_st = `NIU_IPP_CKSUM_W1;
          else
            n_cksum_st = `NIU_IPP_CKSUM_W0;
        end
      (`NIU_IPP_CKSUM_W1): begin  n_cksum_st = `NIU_IPP_CKSUM_W2;   end
      (`NIU_IPP_CKSUM_W2): begin  n_cksum_st = `NIU_IPP_CKSUM_W3;   end
      (`NIU_IPP_CKSUM_W3):
        begin
          if (udp_r)
            n_cksum_st = `NIU_IPP_CKSUM_UL;
          else
            n_cksum_st = `NIU_IPP_CKSUM_W4;
        end
      (`NIU_IPP_CKSUM_W4):
        begin
          n_sum_prt_fail = !pas_dat_byt && (c_tsum_fail || c_dsum_fail_full);
          n_cksum_st = `NIU_IPP_IDLE_CKSUM;
        end
      (`NIU_IPP_CKSUM_UL): begin  n_cksum_st = `NIU_IPP_CKSUM_W4;   end
      default: 
        begin  
          n_cksum_st = `NIU_IPP_IDLE_CKSUM;
          n_tsum_fail  = 1'h0;
          n_sum_prt_fail = 1'h0;
          n_pkt_ended    = 1'h0;
        end
    endcase
  end


// geo: ------------ registers --------------
  ipp_sum_reg_r_9_s0   su_reg_r_9_s0_sts  (n_cksum_st[8:0],                reset,     clk,c_cksum_st[8:0]);
  ipp_sum_reg_r_1      su_reg_r_1_sta     (cur_sta_prt,                    reset,     clk,reg_sta_prt);
  ipp_sum_reg_w_r_2    su_reg_w_r_2_la4   (ipp_la4_prot[1:0],wt_fet_sta,   clr,       clk,ipp_la4_prot_r[1:0]);
  ipp_sum_reg_w_r_2    su_reg_w_r_2_la3   (ipp_la3_vers[1:0],wt_fet_sta,   clr,       clk,ipp_la3_vers_r[1:0]);
  ipp_sum_reg_w_r_2    su_reg_w_r_2_la2   (ipp_la2_opti[1:0],wt_fet_sta,   clr,       clk,ipp_la2_opti_r[1:0]);
  ipp_sum_reg_w_r_4    su_reg_w_r_4_hdr   (ip4_hdr_leng[3:0],wt_fet_sta,   clr,       clk,hdr_r[3:0]);
  ipp_sum_reg_w_r_4    su_reg_w_r_4_off   (nxt_hdr_off[3:0], wt_fet_sta,   clr,       clk,n_hdr_off[3:0]);
  ipp_sum_reg_w_r_4    su_reg_w_r_3_l32   (l3l2[3:0],        wt_fet_sta,   clr,       clk,l3l2_r[3:0]);
  ipp_sum_reg_w_r_1    su_reg_w_r1_udp    (la4_udp,          wt_fet_sta,   clr,       clk,udp_r);
  ipp_sum_reg_w_r_17   su_reg_w_r_17_uoff (n_udp_hdr_off[16:0], wt_fet_sta,clr,       clk,udp_hdr_off[16:0]);
  ipp_sum_reg_w_r_2    su_reg_w_r_2_ulen  (n_udp_sel_len[1:0],wt_fet_sta,  clr,       clk,udp_sel_len[1:0]);
  ipp_sum_reg_w_r_2    su_reg_w_r_2_usum  (n_udp_sel_sum[1:0],wt_fet_sta,  clr,       clk,udp_sel_sum[1:0]);
  ipp_sum_reg_r_1      su_reg_r_1_std     (n_sum_prt_started,              clr,       clk,sum_prt_started);
  ipp_sum_reg_r_1      su_reg_r_1_vld     (n_sum_prt_valid,                clr1,      clk,sum_prt_valid);
  ipp_sum_reg_r_1      su_reg_r_1_fai     (n_sum_prt_fail,                 clr1,      clk,sum_prt_fail);
  ipp_sum_reg_r_1      su_reg_r_1_tfa     (n_tsum_fail,                    clr,       clk,c_tsum_fail);
  ipp_sum_reg_r_1      su_reg_r_1_ended   (n_pkt_ended,                    clr,       clk,c_pkt_ended);
  ipp_sum_cnt_i_r_8    su_cnt_i_r_8_vld   (                  prt_vld_cyc,  clr,       clk,vld_bus_cnt[7:0]);
  ipp_sum_reg_r_1      su_reg_r_1_get_ule (n_get_uln,                      clr,       clk,get_uln);
  ipp_sum_reg_r_1      su_reg_r_1_add_ule (n_add_uln,                      clr,       clk,add_uln);
  ipp_sum_reg_r_2      su_reg_r_2_sel_awd (nxt_sel_awd[1:0],               clr,       clk,n_sel_awd[1:0]);

  ipp_sum_reg_r_4      su_reg_r_4_off     (n_hdr_off[3:0],                 reset,     clk,hdr_off[3:0]);
  ipp_sum_reg_r_2      su_reg_r_2_awd     (n_sel_awd[1:0],                 reset,     clk,sel_awd[1:0]);
  ipp_sum_reg_r_8      su_reg_r_8_asw     (n_sel_asw[7:0],                 reset,     clk,sel_asw[7:0]);
  ipp_sum_reg_r_8      su_reg_r_8_bwd     (n_sel_bwd[7:0],                 reset,     clk,sel_bwd[7:0]);
  ipp_sum_reg_r_1      su_reg_r_1_add     (n_sel_add,                      reset,     clk,sel_add);
  ipp_sum_reg_r_16     su_reg_r_16_ben    (n_byt_ena[15:0],                reset,     clk,byt_ena[15:0]);

`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  nep_spare_ipp spare_ipp_0 (
                             .di_nd3     ({1'h1, 1'h1, do_q[3]}),
                             .di_nd2     ({1'h1, 1'h1, do_q[2]}),
                             .di_nd1     ({1'h1, 1'h1, do_q[1]}),
                             .di_nd0     ({1'h1, 1'h1, do_q[0]}),
                             .di_nr3     ({1'h0, 1'h0}),
                             .di_nr2     ({1'h0, 1'h0}),
                             .di_nr1     ({1'h0, 1'h0}),
                             .di_nr0     ({1'h0, 1'h0}),
                             .di_inv     (do_nad[3:0]),
                             .di_mx3     ({1'h0, 1'h0}),
                             .di_mx2     ({1'h0, 1'h0}),
                             .di_mx1     ({1'h0, 1'h0}),
                             .di_mx0     ({1'h0, 1'h0}),
                             .mx_sel     (do_nor[3:0]),
                             .di_reg     (do_inv[3:0]),
                             .wt_ena     (do_mux[3:0]),
                             .rst        ({reset,reset,reset,reset}),
                             .si         (1'h0),
                             .se         (1'h0),
                             .clk        (clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );
`endif

endmodule
