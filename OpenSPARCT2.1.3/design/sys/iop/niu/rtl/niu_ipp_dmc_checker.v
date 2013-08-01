// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_dmc_checker.v
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
/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_dmc_checker.v

    Module(s) name  : niu_ipp_dmc_checker

    Parent modules  : ipp.v

    Child modules   : sum_unit.v

    Author's name   : George chu 

    Date            : March. 2004

    Description     : This file contains check sum unit 

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_dmc_checker (
                ipp_dmc_data, 
                ipp_dmc_dat_ack, 
                ipp_dmc_ful_pkt, 
                reset, 
                clk,
                dmc_ipp_dat_req, 
                dmc_sum_prt_fail, 
                dmc_sum_prt_cksum, 
                dmc_sum_prt_state, 
                dmc_sum_prt_valid);

input   [129:0] ipp_dmc_data;                   // 
input           ipp_dmc_dat_ack;      		// 
input           ipp_dmc_ful_pkt;      		// 

input           reset;
input           clk;          			// clock

output	        dmc_ipp_dat_req;                // 
output          dmc_sum_prt_fail;
output   [15:0] dmc_sum_prt_cksum;
output   [31:0] dmc_sum_prt_state;
output          dmc_sum_prt_valid;

reg             dmc_ipp_dat_req;
wire            dmc_sum_prt_fail;
wire     [15:0] dmc_sum_prt_cksum;
wire     [31:0] dmc_sum_prt_state;
wire            dmc_sum_prt_valid;

//*********************************************************

// from dmc_driver
wire    [16:0] ipp_max_bytes  = /* geo */ 17'hffff;

reg     [127:0] dmc_stwd_status_wd_r;
wire    [127:0] dmc_stwd_status_wd;
wire     [39:0] dmc_stwd_mac_status_wd    = dmc_stwd_status_wd[127:88];
wire      [2:0] dmc_stwd_reserve_3        = dmc_stwd_status_wd[087:85];
wire     [12:0] dmc_stwd_sop_addr         = dmc_stwd_status_wd[084:72];
wire     [13:0] dmc_stwd_reserve_2        = dmc_stwd_status_wd[071:58];
wire            dmc_stwd_hfifo_par_err    = dmc_stwd_status_wd[057];
wire            dmc_stwd_hfifo_under_run  = dmc_stwd_status_wd[056];
wire            dmc_stwd_hfifo_over_run   = dmc_stwd_status_wd[055];
wire            dmc_stwd_status_rd_abort  = dmc_stwd_status_wd[054];
wire            dmc_stwd_mac_drp_crc      = dmc_stwd_status_wd[053];
wire            dmc_stwd_ipp_disc_pkt     = dmc_stwd_status_wd[052];
wire      [1:0] dmc_stwd_reserve_1        = dmc_stwd_status_wd[051:50];
wire     [13:0] dmc_stwd_pkt_ffl_sum_info = dmc_stwd_status_wd[049:36];
wire     [35:0] dmc_stwd_cksum_info       = dmc_stwd_status_wd[035:0];

wire      [3:0] dmc_stwd_flp_pkt_id       = dmc_stwd_pkt_ffl_sum_info[13:10];
wire      [1:0] dmc_stwd_la4_prot         = dmc_stwd_pkt_ffl_sum_info[09:08];
wire      [3:0] dmc_stwd_ip4_hdr_leng     = dmc_stwd_pkt_ffl_sum_info[07:04];
wire      [1:0] dmc_stwd_la3_vers         = dmc_stwd_pkt_ffl_sum_info[03:02];
wire      [1:0] dmc_stwd_la2_opti         = dmc_stwd_pkt_ffl_sum_info[01:00];

wire     [15:0] dmc_stwd_ip_length        = dmc_stwd_cksum_info[35:20];
wire            dmc_stwd_reserve_0        = dmc_stwd_cksum_info[19];
wire            dmc_stwd_full_cksum_ena   = dmc_stwd_cksum_info[18];
wire            dmc_stwd_full_cksum_fail  = dmc_stwd_cksum_info[17];
wire            dmc_stwd_full_cksum       = dmc_stwd_cksum_info[16];
wire     [15:0] dmc_stwd_cksum            = dmc_stwd_cksum_info[15:0];

wire     [15:0] dmc_sum_prt_length;

wire            dmc_sum_prt_started_0;
wire            dmc_sum_prt_valid_0;
wire            dmc_sum_prt_fail_0;
wire     [15:0] dmc_sum_prt_cksum_0;
wire     [15:0] dmc_sum_prt_length_0;
wire     [31:0] dmc_sum_prt_state_0;

wire            dmc_sum_prt_started_1;
wire            dmc_sum_prt_valid_1;
wire            dmc_sum_prt_fail_1;
wire     [15:0] dmc_sum_prt_cksum_1;
wire     [15:0] dmc_sum_prt_length_1;
wire     [31:0] dmc_sum_prt_state_1;

reg      [15:0] dmc_pkt_cnt;
reg             dmc_checksum_unit;

reg             dmc_ipp_dat_req_d;

reg       [1:0] c_dmc_ipp_st, n_dmc_ipp_st;

  parameter DMC_IPP_IDLE      = 2'b00,
            DMC_IPP_GET_DATA  = 2'b01,
            DMC_IPP_1ST_DATA  = 2'b10;

wire            ipp_dfifo_dout_eop = ipp_dmc_data[129];
wire            ipp_dfifo_dout_sop = ipp_dmc_data[128];
reg             ipp_dfifo_dout_eop_d;

wire            ack_rd_dfifo_sop =  ipp_dmc_ful_pkt && 
                                                       ipp_dmc_dat_ack && 
                                    (c_dmc_ipp_st==DMC_IPP_IDLE) &&
                                    ipp_dfifo_dout_sop;

reg             ipp_dmc_dat_ack_d;
reg             dmc_start_tcp;
reg             dmc_start_tcp_d;

  always @(ack_rd_dfifo_sop or ipp_dmc_dat_ack or ipp_dfifo_dout_eop or 
           dmc_stwd_full_cksum_ena or
           c_dmc_ipp_st)
    begin
      dmc_start_tcp   = 1'h0;
      dmc_ipp_dat_req = 1'h0;
      n_dmc_ipp_st    = DMC_IPP_IDLE;

      case (c_dmc_ipp_st)
        (DMC_IPP_IDLE):
          if (ack_rd_dfifo_sop)
            begin
              dmc_ipp_dat_req = 1'h1;             // geo: NOT sufficient
              n_dmc_ipp_st    = DMC_IPP_1ST_DATA;
            end
          else
            begin
              n_dmc_ipp_st    = c_dmc_ipp_st;
            end

        (DMC_IPP_1ST_DATA):
          if (ipp_dmc_dat_ack)
            begin
              dmc_start_tcp   = dmc_stwd_full_cksum_ena;
              n_dmc_ipp_st    = DMC_IPP_GET_DATA;
            end
          else
            begin
              n_dmc_ipp_st    = c_dmc_ipp_st;
            end

        (DMC_IPP_GET_DATA):
          if (ipp_dfifo_dout_eop)
            begin
              n_dmc_ipp_st    = DMC_IPP_IDLE;
            end
          else
            begin
              dmc_ipp_dat_req = 1'h1;
              n_dmc_ipp_st    = c_dmc_ipp_st;
            end
        default: n_dmc_ipp_st = DMC_IPP_IDLE;
      endcase
    end

  assign dmc_stwd_status_wd = ack_rd_dfifo_sop ? ipp_dmc_data[127:0] : dmc_stwd_status_wd_r[127:0];

  niu_ipp_sum_unit dmc_out_sum (
                       .ipp_din_dat      (ipp_dmc_data[127:0]),
                       .port_num         (1'h1 /* geo */),
                       .ipp_full_cksum   (1'h1 /* geo */),
                       .ipp_la4_prot     (dmc_stwd_la4_prot[1:0]),
                       .ipp_la3_vers     (dmc_stwd_la3_vers[1:0]),
                       .ipp_la2_opti     (dmc_stwd_la2_opti[1:0]),
                       .ip4_hdr_leng     (dmc_stwd_ip4_hdr_leng[3:0]),
                       .ipp_info_valid   (ipp_dmc_dat_ack),
                       .ipp_start_tcp    (dmc_start_tcp && !dmc_checksum_unit),
                       .ipp_pkt_end      (ipp_dfifo_dout_eop && !ipp_dfifo_dout_eop_d),
                       .ipp_max_bytes    (ipp_max_bytes[16:0]),
                       .reset            (reset),
                       .clk              (clk),
                       .sum_prt_started  (dmc_sum_prt_started_0),
                       .sum_prt_valid    (dmc_sum_prt_valid_0),
                       .sum_prt_fail     (dmc_sum_prt_fail_0),
                       .sum_prt_cksum    (dmc_sum_prt_cksum_0[15:0]),
                       .sum_prt_length   (dmc_sum_prt_length_0[15:0]),
                       .sum_prt_state    (dmc_sum_prt_state_0[31:0]) 
                      );

  niu_ipp_sum_unit dmc_out_sum_1 (
                       .ipp_din_dat      (ipp_dmc_data[127:0]),
                       .port_num         (1'h1 /* geo */),
                       .ipp_full_cksum   (1'h1 /* geo */),
                       .ipp_la4_prot     (dmc_stwd_la4_prot[1:0]),
                       .ipp_la3_vers     (dmc_stwd_la3_vers[1:0]),
                       .ipp_la2_opti     (dmc_stwd_la2_opti[1:0]),
                       .ip4_hdr_leng     (dmc_stwd_ip4_hdr_leng[3:0]),
                       .ipp_info_valid   (ipp_dmc_dat_ack),
                       .ipp_start_tcp    (dmc_start_tcp && dmc_checksum_unit),
                       .ipp_pkt_end      (ipp_dfifo_dout_eop && !ipp_dfifo_dout_eop_d),
                       .ipp_max_bytes    (ipp_max_bytes[16:0]),
                       .reset            (reset),
                       .clk              (clk),
                       .sum_prt_started  (dmc_sum_prt_started_1),
                       .sum_prt_valid    (dmc_sum_prt_valid_1),
                       .sum_prt_fail     (dmc_sum_prt_fail_1),
                       .sum_prt_cksum    (dmc_sum_prt_cksum_1[15:0]),
                       .sum_prt_length   (dmc_sum_prt_length_1[15:0]),
                       .sum_prt_state    (dmc_sum_prt_state_1[31:0])
                      );

  assign dmc_sum_prt_valid  = dmc_sum_prt_valid_0 || dmc_sum_prt_valid_1;
  assign dmc_sum_prt_fail   = dmc_sum_prt_fail_0  || dmc_sum_prt_fail_1;
  assign dmc_sum_prt_cksum  = {16{dmc_sum_prt_started_0}} & dmc_sum_prt_cksum_0[15:0] |
                              {16{dmc_sum_prt_started_1}} & dmc_sum_prt_cksum_1[15:0];
  assign dmc_sum_prt_length = {16{dmc_sum_prt_started_0}} & dmc_sum_prt_length_0[15:0] | 
                              {16{dmc_sum_prt_started_1}} & dmc_sum_prt_length_1[15:0];
  assign dmc_sum_prt_state  = {32{dmc_sum_prt_started_0}} & dmc_sum_prt_state_0[31:0]  |
                              {32{dmc_sum_prt_started_1}} & dmc_sum_prt_state_1[31:0];

  always @(posedge clk)
    if (reset) begin
      dmc_ipp_dat_req_d     <= #1   1'h0;
      ipp_dfifo_dout_eop_d  <= #1   1'h0;
      ipp_dmc_dat_ack_d     <= #1   1'h0;

      dmc_stwd_status_wd_r  <= #1 128'h0;
      dmc_start_tcp_d       <= #1   1'h0;

      c_dmc_ipp_st          <= #1   2'h0;
    end

    else begin
      dmc_ipp_dat_req_d     <= #1 dmc_ipp_dat_req;
      ipp_dfifo_dout_eop_d  <= #1 ipp_dfifo_dout_eop;
      ipp_dmc_dat_ack_d     <= #1 ipp_dmc_dat_ack;
  
      dmc_stwd_status_wd_r  <= #1 dmc_stwd_status_wd[127:0];
      dmc_start_tcp_d       <= #1 dmc_start_tcp;

      c_dmc_ipp_st          <= #1 n_dmc_ipp_st;
    end

    always @(posedge clk)
    if (reset) begin
      dmc_checksum_unit     <= #1   1'h0;
      dmc_pkt_cnt           <= #1  16'h0;
    end
    else if (dmc_start_tcp && !dmc_start_tcp_d) begin
      dmc_checksum_unit     <= #1 !dmc_checksum_unit;
      dmc_pkt_cnt           <= #1 (dmc_pkt_cnt + 16'h1);
    end
    else begin
      dmc_checksum_unit     <= #1  dmc_checksum_unit; 
      dmc_pkt_cnt           <= #1  dmc_pkt_cnt;
    end

// synopsys translate_off
  always @ (posedge clk)
  if (!reset)
    begin
      if (dmc_sum_prt_fail && dmc_sum_prt_valid)
        $display("\n -> Warning at sim time = %d, dmc_sum_prt_fail.", $stime);
      else ;
    end
// synopsys translate_on

endmodule

