// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_sum_unit.v
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

    File name       : niu_ipp_sum_unit.v

    Module(s) name  : niu_ipp_sum_unit
    Original:       : sum_unit.v main.5, label:               

    Parent modules  : niu_ipp_sum.v

    Child modules   : niu_ipp_sum_lib.v, niu_ipp_sum.h,
		      niu_ipp_sum_data.v, niu_ipp_sum_ctrl.v.

    Author's name   : George Chu

    Date            : March. 2004

    Description     : One unit of the ipp checksum.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_sum_unit (ipp_din_dat, port_num,  ipp_full_cksum,
                 ipp_la4_prot,    ipp_la3_vers,  ipp_la2_opti, ip4_hdr_leng,
                 ipp_info_valid,  ipp_start_tcp, ipp_pkt_end,  ipp_max_bytes,
                 reset,           clk,
                 sum_prt_started, sum_prt_valid, 
                 sum_prt_fail,    sum_prt_cksum, sum_prt_length,
                 sum_prt_state);

input  [127:0] ipp_din_dat;         // pkt data 
input          port_num;            // if 1, this sum_unit is enabled
input          ipp_full_cksum;      // if 1, do the full check_sum
input    [1:0] ipp_la4_prot;        // layer_4, protocol, 0:not_interested,1:Tcp,2:Udp,3:SCTP
input    [1:0] ipp_la3_vers;        // layer_3, version,  0:not_interested,1:Ip4,2:Ip6,3:reser
input    [1:0] ipp_la2_opti;        // layer_2, options {LLC,VLAN}
input    [3:0] ip4_hdr_leng;        // layer_3, IPv4 header_length
input          ipp_info_valid;      // pkt data valid    
input          ipp_start_tcp;       // start a tcp checksum
input          ipp_pkt_end;         // end of the pkt data
input   [16:0] ipp_max_bytes;       // pio program: maximum bytes for a pkt to pass checksum
input          reset;
input          clk;
output         sum_prt_started;     // the sum_unit is busy, processing a pkt
output         sum_prt_valid;       // the following checksum outputs are valid
output         sum_prt_fail;        // the checked result is a failure
output  [15:0] sum_prt_cksum;       // the check sum 
output  [15:0] sum_prt_length;      // the IPv4,6's IP length field
output  [31:0] sum_prt_state;       // the states of the checksum_unit 

wire           sum_prt_started;
wire           sum_prt_valid;
wire           sum_prt_fail;
wire    [15:0] sum_prt_cksum;
wire    [15:0] sum_prt_length;
wire    [31:0] sum_prt_state;

/* ---------- sum data -------- */
wire           c_dsum_fail;
wire    [15:0] tcp_prt_cksum;

/* ---------- sum ctrl -------- */
wire           clr;
wire     [3:0] hdr_off;
wire     [1:0] sel_awd;
wire     [7:0] sel_asw;
wire     [7:0] sel_bwd;
wire           sel_add;
wire    [15:0] byt_ena;
wire    [15:0] udp_dat_len_r;
wire           get_uln;
wire           add_uln;

wire           tcp_prt_fail;
wire    [15:0] tcp_prt_length;
wire    [31:0] tcp_prt_state;

wire   [127:0] din_wrd;
wire   [127:0] din_wrd_d;

wire           ipp_start = ipp_start_tcp;
wire           ipp_start_d;
wire           clr_prt   = ipp_start && !ipp_start_d || reset;
wire           clr_sum;

wire           sum_prt_fail_d;
wire    [15:0] sum_prt_cksum_d;
wire    [15:0] sum_prt_length_d;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  assign sum_prt_fail     = sum_prt_valid ? tcp_prt_fail         : sum_prt_fail_d;
  assign sum_prt_cksum    = sum_prt_valid ? tcp_prt_cksum[15:0]  : sum_prt_cksum_d[15:0];
  assign sum_prt_length   = sum_prt_valid ? tcp_prt_length[15:0] : sum_prt_length_d[15:0];

  niu_ipp_sum_data sum_data (
                             .din_wrd              (din_wrd_d[127:0]),
                             .hdr_off              (hdr_off[3:0]),
                             .byt_ena              (byt_ena[15:0]),
                             .sel_awd              (sel_awd[1:0]),
                             .sel_asw7             (sel_asw[7]),
                             .sel_asw6             (sel_asw[6]),
                             .sel_asw5             (sel_asw[5]),
                             .sel_asw3             (sel_asw[3]),
                             .sel_asw2             (sel_asw[2]),
                             .sel_asw1             (sel_asw[1]),
                             .sel_bwd7             (sel_bwd[7]),
                             .sel_bwd5             (sel_bwd[5]),
                             .sel_bwd4             (sel_bwd[4]),
                             .sel_bwd3             (sel_bwd[3]),
                             .sel_bwd1             (sel_bwd[1]),
                             .sel_add              (sel_add),
                             .inp_uln              (udp_dat_len_r[15:0]),
                             .get_uln              (get_uln),
                             .add_uln              (add_uln),
                             .clr                  (clr_sum),
                             .clk                  (clk),
                             .sum_prt_cksum        (tcp_prt_cksum[15:0]),
                             .c_dsum_fail          (c_dsum_fail) 
                            );

  niu_ipp_sum_ctrl sum_ctrl (
                             .din_wrd              (din_wrd[127:0]),
                             .port_num             (port_num),
                             .ipp_full_cksum       (ipp_full_cksum),
                             .ipp_la4_prot         (ipp_la4_prot[1:0]),
                             .ipp_la3_vers         (ipp_la3_vers[1:0]),
                             .ipp_la2_opti         (ipp_la2_opti[1:0]),
                             .ip4_hdr_leng         (ip4_hdr_leng[3:0]),
                             .ipp_info_valid       (ipp_info_valid),
                             .ipp_start_cksum      (ipp_start_tcp),
                             .ipp_pkt_end          (ipp_pkt_end),
                             .ipp_max_bytes        (ipp_max_bytes[16:0]),
                             .c_dsum_fail          (c_dsum_fail),
                             .reset                (reset),
                             .clk                  (clk),
                             .clr                  (clr),
                             .hdr_off              (hdr_off[3:0]),
                             .sel_awd              (sel_awd[1:0]),
                             .sel_asw              (sel_asw[7:0]),
                             .sel_bwd              (sel_bwd[7:0]),
                             .sel_add              (sel_add),
                             .byt_ena              (byt_ena[15:0]),
                             .udp_dat_len_r        (udp_dat_len_r[15:0]),
                             .get_uln              (get_uln),
                             .add_uln              (add_uln),
                             .sum_prt_started      (sum_prt_started),
                             .sum_prt_valid        (sum_prt_valid),
                             .sum_prt_fail         (tcp_prt_fail),
                             .sum_prt_length       (tcp_prt_length[15:0]),
                             .sum_prt_state        (tcp_prt_state[31:0]) 
                            );

  assign din_wrd =
                  {ipp_din_dat[007:000],ipp_din_dat[015:008],ipp_din_dat[023:016],ipp_din_dat[031:024],
                   ipp_din_dat[039:032],ipp_din_dat[047:040],ipp_din_dat[055:048],ipp_din_dat[063:056],
                   ipp_din_dat[071:064],ipp_din_dat[079:072],ipp_din_dat[087:080],ipp_din_dat[095:088],
                   ipp_din_dat[103:096],ipp_din_dat[111:104],ipp_din_dat[119:112],ipp_din_dat[127:120]};

  ipp_sum_reg_r_1    su_reg_r_1_clr  (clr,                                 reset,  clk,clr_sum);
  ipp_sum_reg_r_1    su_reg_r_1_sta  (ipp_start,                           reset,  clk,ipp_start_d);
  ipp_sum_reg_r_128  su_reg_r_128_wrd(din_wrd[127:0],                      reset,  clk,din_wrd_d[127:0]);
  ipp_sum_reg_r_1    su_reg_r_1_fai  (sum_prt_fail,                        clr_prt,clk,sum_prt_fail_d);
  ipp_sum_reg_r_16   su_reg_r_16_sum (sum_prt_cksum[15:0],                 clr_prt,clk,sum_prt_cksum_d[15:0]);
  ipp_sum_reg_r_16   su_reg_r_16_len (sum_prt_length[15:0],                clr_prt,clk,sum_prt_length_d[15:0]);
  ipp_sum_reg_r_9_s0 su_reg_w_r_9_s0 (tcp_prt_state[08:0],                 reset,  clk,sum_prt_state[08:0]);
  ipp_sum_reg_w_r_23 su_reg_w_r_23_st(tcp_prt_state[31:9], sum_prt_started,clr_prt,clk,sum_prt_state[31:9]);


endmodule
