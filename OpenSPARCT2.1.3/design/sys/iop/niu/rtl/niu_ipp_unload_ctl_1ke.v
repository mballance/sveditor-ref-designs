// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_unload_ctl_1ke.v
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

    File name       : niu_ipp_unload_ctl_1ke.v

    Module(s) name  : niu_ipp_unload_ctl_1ke

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp.h

    Author's name   : George Chu

    Date            : Jan. 2004

    Description     : This module contains a Finite State Machine used to 
		      control the ipp_unload interface protocol.

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

`include "niu_ipp.h"

module niu_ipp_unload_ctl_1ke (
                          ipp_ffl_dvalid_n,  
                          cur_pkt_hdr_base_ptr,  
                          cur_pkt_ffl_sum_info,  
                          ipp_hfifo_dat_tag,  
                          ipp_hfifo_dat_empty,  
                          ipp_dfifo_dout_tag,  
                          ipp_dmc_dat_err1,
                          sum_prt_valid,  
                          dmc_ipp_dat_req,  
                          pio_cksum_ena,  
                          pio_full_cksum,  
                          ipp_enable,  
                          ippfifo_rd_wr_ptr_bypass,
                          ippfifo_rd_ptr_pio_wr_en,
                          datfifo_pio_wr_ena,
                          dfifo_rd_ptr_pio_wr_en,
                          dfifo_wt_ptr_pio_wr_en,
                          dfifo_wt_data_reg_wr_en_pls,
                          ipp_pio_wdata,

                          reset,
                          clk, 

                          inc_hfifo_dat_rptr,
                          inc_hfifo_dat_rptr_d,
                          ipp_hfifo_dat_rptr,
                          ipp_hfifo_dat_tag_rd,
                          ipp_dfifo_wptr,
                          ipp_dfifo_wten,
                          ipp_dfifo_wten_2nd,
                          ipp_dfifo_rden,
                          ipp_dfifo_rptr,
                          ipp_dfifo_full,
                          wt_dfifo_1st_wd,
                          addr_status,
                          ipp_dmc_dat_ack,
                          ipp_dmc_ful_pkt,
                          ipp_full_cksum,
                          ipp_start_tcp,
                          ipp_sum_info_vld,
                          req_rd_dfifo_eop,
                          req_rd_dfifo_sop,
                          ipp_la2_opti,
                          ipp_la3_vers,
                          ip4_hdr_leng,
                          ipp_la4_prot,
                          clr_ipp_unload,
                          n_ipp_unload_idle,
                          fet_pio_tcp_ena,
                          dfifo_miss_eop,
                          dfifo_miss_sop,
                          c_unload_st
                         );

input           ipp_ffl_dvalid_n;
input     [6:0] cur_pkt_hdr_base_ptr;
input     [9:0] cur_pkt_ffl_sum_info;
input     [1:0] ipp_hfifo_dat_tag;
input           ipp_hfifo_dat_empty;
input     [1:0] ipp_dfifo_dout_tag;
input           ipp_dmc_dat_err1;
input           sum_prt_valid; 
input           dmc_ipp_dat_req; 
input           pio_cksum_ena; 
input           pio_full_cksum; 
input           ipp_enable;
input           ippfifo_rd_wr_ptr_bypass;
input           ippfifo_rd_ptr_pio_wr_en;
input           datfifo_pio_wr_ena;
input           dfifo_rd_ptr_pio_wr_en;
input           dfifo_wt_ptr_pio_wr_en;
input           dfifo_wt_data_reg_wr_en_pls;
input    [10:0] ipp_pio_wdata;

input           reset;
input           clk;

output          inc_hfifo_dat_rptr;
output          inc_hfifo_dat_rptr_d;
output    [6:0] ipp_hfifo_dat_rptr;
output    [1:0] ipp_hfifo_dat_tag_rd;
output   [10:0] ipp_dfifo_wptr;          // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
output          ipp_dfifo_wten;
output          ipp_dfifo_wten_2nd;
output          ipp_dfifo_rden;
output   [10:0] ipp_dfifo_rptr;          // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
output          ipp_dfifo_full;
output          wt_dfifo_1st_wd;
output   [11:0] addr_status;
output          ipp_dmc_dat_ack;
output          ipp_dmc_ful_pkt; 
output          ipp_full_cksum; 
output          ipp_start_tcp; 
output          ipp_sum_info_vld; 
output          req_rd_dfifo_eop; 
output          req_rd_dfifo_sop; 
output    [1:0] ipp_la2_opti;
output    [1:0] ipp_la3_vers;
output    [3:0] ip4_hdr_leng;
output    [1:0] ipp_la4_prot;

output          clr_ipp_unload;
output          n_ipp_unload_idle;
output          fet_pio_tcp_ena;
output          dfifo_miss_eop;
output          dfifo_miss_sop;
output    [4:0] c_unload_st;

reg             inc_hfifo_dat_rptr;
reg             inc_hfifo_dat_rptr_d; 
wire      [6:0] ipp_hfifo_dat_rptr;
wire      [1:0] ipp_hfifo_dat_tag_rd;
wire     [10:0] ipp_dfifo_wptr;          // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
wire            ipp_dfifo_wten; 
reg             ipp_dfifo_wten_2nd; 
reg             ipp_dfifo_wten_pkt; 
wire            ipp_dfifo_full;
reg             wt_dfifo_1st_wd,                    wt_dfifo_1st_wd_d, wt_dfifo_1st_wd_d2; 
reg      [11:0] addr_status;
wire            ipp_dmc_dat_ack, ipp_dmc_dat_ack_0, ipp_dmc_dat_ack_1, ipp_dmc_dat_ack_2;
wire            ipp_dmc_ful_pkt,                    ipp_dmc_ful_pkt_1, ipp_dmc_ful_pkt_2, n_ipp_dmc_ful_pkt_2; 
wire                             ipp_dmc_dat_emp_0; 
wire            ipp_full_cksum; 
reg             ipp_start_tcp; 
wire            ipp_sum_info_vld; 
wire            req_rd_dfifo_eop; 
wire            req_rd_dfifo_sop; 
wire      [1:0] ipp_la2_opti = cur_pkt_ffl_sum_info[1:0];
wire      [1:0] ipp_la3_vers = cur_pkt_ffl_sum_info[3:2];
wire      [3:0] ip4_hdr_leng = cur_pkt_ffl_sum_info[7:4];
wire      [1:0] ipp_la4_prot = cur_pkt_ffl_sum_info[9:8];

reg             clr_ipp_unload;
wire            n_ipp_unload_idle;
wire            fet_pio_tcp_ena;
reg             dfifo_miss_eop, n_dfifo_miss_eop;
reg             dfifo_miss_sop, n_dfifo_miss_sop;
reg       [4:0] c_unload_st;
 
reg       [4:0] n_unload_st;

reg             ipp_ffl_dvalid_n_d;
wire            start_unload_n = !ipp_ffl_dvalid_n && ipp_ffl_dvalid_n_d;
reg             start_unload;

reg             ipp_cksum_done_r;
wire            n_ipp_cksum_done; 
wire            ipp_cksum_done;

reg             lod_hfifo_base_rptr;

wire      [6:0] n_hfifo_dat_rptr;
reg       [6:0] hfifo_dat_rptr;
 
wire     [11:0] n_addr_status;

reg             lod_dfifo_base_wptr;
reg             inc_ipp_dfifo_wptr;
reg      [10:0] ipp_dfifo_wptr_r;
wire     [10:0] n_addr_wt_pkt,                n_addr_packet;
reg      [10:0]   addr_wt_pkt,                  addr_packet;

wire              ipp_dfifo_rden;
wire     [10:0] n_ipp_dfifo_rptr;        // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
reg      [10:0]   ipp_dfifo_rptr;        // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
wire     [10:0] dfifo_free_space;
wire            ipp_dfifo_amsful;

wire            ipp_dfifo_empty;

wire            n_ipp_dmc_dat_ack;
 
wire            ipp_dfifo_dout_eop = ipp_dfifo_dout_tag[1];
wire            ipp_dfifo_dout_sop = ipp_dfifo_dout_tag[0];
reg             ipp_dfifo_dout_eop_d;
wire            req_rd_dfifo_eop_d1, req_rd_dfifo_eop_d2;
wire            req_rd_dfifo_eops;

reg       [8:0] n_dfifo_pkt_count;          // 1k entries, up to 16k-bytes
reg       [8:0]   dfifo_pkt_count;          // 1k entries, up to 16k-bytes
wire            n_ipp_dmc_ful_pkt;

reg             n_clr_ipp_unload;

wire            req_rd_dfifo_sop_d; 
wire            req_rd_dfifo_sop_rise = req_rd_dfifo_sop && !req_rd_dfifo_sop_d;
wire            req_rd_dfifo_sop_rise_d;

reg             n_fet_pio_tcp_ena;
wire            no_cksum;

wire            ecc_err_force,  ecc_err_force_d;

wire      [1:0]   hfifo_dat_tag_rd;
wire      [1:0] n_hfifo_dat_tag_rd;
reg       [1:0]   hfifo_dat_tag_rd_d;

reg             n_bad_tag_mac_sta, bad_tag_mac_sta;

reg       [1:0] c_dfifo_tag_st, n_dfifo_tag_st;

// =============================================================================
/* These checkers check for the transition of the state variable. */

/* c_unload_st can transition from `IPP_UNLOAD_IDLE to `IPP_DFIFO_XFR_1ST */
/* 0in state_transition -var c_unload_st -val `IPP_UNLOAD_IDLE -next `IPP_DFIFO_XFR_1ST */

/* c_unload_st can transition from `IPP_DFIFO_XFR_1ST to `IPP_DFIFO_XFR_DAT */
/* 0in state_transition -var c_unload_st -val `IPP_DFIFO_XFR_1ST -next `IPP_DFIFO_XFR_DAT */

/* c_unload_st can transition from `IPP_DFIFO_XFR_DAT to `IPP_BKWT_1ST_WORD,  \
                                                         `IPP_WAIT_HFIFO_STA, \
                                                         `IPP_GET_MAC_STAT,   \
                                                         `IPP_WAIT_HFIFO_DAT */
/* 0in state_transition -var c_unload_st -val `IPP_DFIFO_XFR_DAT -next `IPP_BKWT_1ST_WORD
                                                                       `IPP_WAIT_HFIFO_STA
                                                                       `IPP_GET_MAC_STAT
                                                                       `IPP_WAIT_HFIFO_DAT */

/* c_unload_st can transition from `IPP_GET_MAC_STAT to `IPP_BKWT_1ST_WORD, \
                                                        `IPP_DFIFO_XFR_ERR */
/* 0in state_transition -var c_unload_st -val `IPP_GET_MAC_STAT -next `IPP_BKWT_1ST_WORD
                                                                      `IPP_DFIFO_XFR_ERR */

// geo: /* c_unload_st can transition from `IPP_WAIT_CKSUM_DON to `IPP_BKWT_1ST_WORD */
// geo: /* 0in state_transition -var c_unload_st -val `IPP_WAIT_CKSUM_DON -next `IPP_BKWT_1ST_WORD */

/* c_unload_st can transition from `IPP_BKWT_1ST_WORD to `IPP_UNLOAD_IDLE */
/* 0in state_transition -var c_unload_st -val `IPP_BKWT_1ST_WORD -next `IPP_UNLOAD_IDLE
                                         -match_by_cycle */

/* c_unload_st can transition from `IPP_WAIT_HFIFO_STA to `IPP_GET_MAC_STAT */
/* 0in state_transition -var c_unload_st -val `IPP_WAIT_HFIFO_STA -next `IPP_GET_MAC_STAT */

/* c_unload_st can transition from `IPP_WAIT_HFIFO_DAT to `IPP_DFIFO_XFR_DAT */
/* 0in state_transition -var c_unload_st -val `IPP_WAIT_HFIFO_DAT -next `IPP_DFIFO_XFR_DAT */

// -----------------------------------------------------------------------------
  always @(start_unload          or 
           ipp_dfifo_full        or ipp_hfifo_dat_empty or 
           inc_hfifo_dat_rptr_d  or ipp_hfifo_dat_tag_rd or 
           pio_cksum_ena         or fet_pio_tcp_ena      or
           ipp_la3_vers          or ipp_la4_prot or 
           ipp_cksum_done        or 
           c_unload_st
          ) begin 

    lod_hfifo_base_rptr = 1'h0;
    inc_hfifo_dat_rptr  = 1'h0;
    lod_dfifo_base_wptr = 1'h0;
    ipp_dfifo_wten_2nd  = 1'h0;
    ipp_dfifo_wten_pkt  = 1'h0;
    inc_ipp_dfifo_wptr  = 1'h0;
    ipp_start_tcp       = 1'h0;

    wt_dfifo_1st_wd     = 1'h0;
    n_clr_ipp_unload    = 1'h0;

    n_bad_tag_mac_sta   = 1'h0;

    n_unload_st = 5'h0;
 
    n_fet_pio_tcp_ena = fet_pio_tcp_ena;

    case (c_unload_st)                       //synopsys parallel_case
      /* 0in < case -default */

      (`IPP_UNLOAD_IDLE):
        begin
          if (start_unload) begin
            n_fet_pio_tcp_ena = pio_cksum_ena;
            lod_hfifo_base_rptr = 1'h1;
            inc_hfifo_dat_rptr  = 1'h1;
            lod_dfifo_base_wptr = 1'h1;
            n_unload_st = `IPP_DFIFO_XFR_1ST;
          end
          else begin
            n_fet_pio_tcp_ena = 1'h0;
            n_unload_st = c_unload_st[4:0];
          end
        end

      (`IPP_DFIFO_XFR_1ST):
        if (ipp_dfifo_full)
          begin
            ipp_dfifo_wten_2nd  = inc_hfifo_dat_rptr_d;
            ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
            ipp_start_tcp       = ((ipp_la4_prot==2'h2) || (ipp_la4_prot==2'h1)) &&
                                  ((ipp_la3_vers==2'h1) || (ipp_la3_vers==2'h2)) && fet_pio_tcp_ena;
            n_unload_st = c_unload_st[4:0];
          end
        else
          begin
            inc_hfifo_dat_rptr  = 1'h1;
            ipp_dfifo_wten_2nd  = inc_hfifo_dat_rptr_d;
            ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
            inc_ipp_dfifo_wptr  = 1'h1;
            ipp_start_tcp       = ((ipp_la4_prot==2'h2) || (ipp_la4_prot==2'h1)) &&
                                  ((ipp_la3_vers==2'h1) || (ipp_la3_vers==2'h2)) && fet_pio_tcp_ena;
            n_unload_st = `IPP_DFIFO_XFR_DAT;
          end

      (`IPP_DFIFO_XFR_DAT):
        if (ipp_dfifo_full)
          begin
            ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
            n_unload_st = c_unload_st[4:0];
          end
        else
          begin
            casez (ipp_hfifo_dat_tag_rd)              //synopsys parallel_case
              /* 0in < case -default */
              (2'b?1): begin 
                         ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
                         inc_ipp_dfifo_wptr  = 1'h1;
                         n_unload_st = `IPP_BKWT_1ST_WORD;
                       end
              (2'b10): if (ipp_hfifo_dat_empty) begin
                         ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
                         n_unload_st = `IPP_WAIT_HFIFO_STA;
                       end
                       else begin
                         inc_hfifo_dat_rptr  = 1'h1;
                         ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
                         inc_ipp_dfifo_wptr  = 1'h1;
                         n_unload_st = `IPP_GET_MAC_STAT;
                       end
//            (2'b01): begin
//                       n_unload_st = `IPP_DFIFO_XFR_ERR;
//                       n_bad_tag_xfr_dat = 1'h1;
//                     end
              (2'b00): if (ipp_hfifo_dat_empty) begin
                         ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
                         n_unload_st = `IPP_WAIT_HFIFO_DAT;
                       end
                       else begin
                         inc_hfifo_dat_rptr  = 1'h1;
                         ipp_dfifo_wten_pkt  = inc_hfifo_dat_rptr_d;
                         inc_ipp_dfifo_wptr  = 1'h1;
                         n_unload_st = c_unload_st[4:0];
                       end
              default: begin
                         n_unload_st = `IPP_UNLOAD_IDLE;
                       end
            endcase
          end

      (`IPP_GET_MAC_STAT):
        if (ipp_hfifo_dat_tag_rd[0])
          begin
            n_unload_st = `IPP_BKWT_1ST_WORD;
        end
        else if (ipp_hfifo_dat_empty)
          begin
            n_unload_st = c_unload_st[4:0];   // geo: careful, rd_ptr increase?, can it happen?
          end
        else
          begin
            n_unload_st = `IPP_DFIFO_XFR_ERR;
            n_bad_tag_mac_sta = 1'h1;
          end

//geo (`IPP_WAIT_CKSUM_DON):
//geo   if (!ipp_dfifo_full && ipp_cksum_done)
//geo     begin
//geo       n_wt_dfifo_1st_wd = 1'h1;
//geo       n_unload_st = `IPP_BKWT_1ST_WORD;
//geo     end
//geo   else
//geo     begin
//geo       n_unload_st = c_unload_st[4:0];
//geo     end

      (`IPP_BKWT_1ST_WORD):
        if (!ipp_dfifo_full && ipp_cksum_done)
          begin
            wt_dfifo_1st_wd     = 1'h1;
            ipp_dfifo_wten_pkt  = 1'h1;
            n_clr_ipp_unload    = 1'h1;
            n_unload_st = `IPP_UNLOAD_IDLE;
          end
        else
          begin
            n_unload_st = c_unload_st[4:0];
          end

      (`IPP_WAIT_HFIFO_STA):
        if (ipp_hfifo_dat_empty)
          begin
            n_unload_st = c_unload_st[4:0];
          end
        else
          begin
            inc_hfifo_dat_rptr  = 1'h1;
            inc_ipp_dfifo_wptr  = 1'h1;
            n_unload_st = `IPP_GET_MAC_STAT;
          end

      (`IPP_WAIT_HFIFO_DAT):
        if (ipp_hfifo_dat_empty)
          begin
            n_unload_st = c_unload_st[4:0];
          end
        else
          begin
            inc_hfifo_dat_rptr  = 1'h1;
            inc_ipp_dfifo_wptr  = 1'h1;
            n_unload_st = `IPP_DFIFO_XFR_DAT;
          end

      (`IPP_DFIFO_XFR_ERR):
          begin
//          inc_ipp_dfifo_wptr  = 1'h1; // geo: how to handle it
//          n_unload_st = `IPP_UNLOAD_IDLE;
            n_unload_st = c_unload_st[4:0];
// synopsys translate_off
            $display ("Warning @sim_time=%d, data_fifo missed mac_status_tag bad_tag_mac_sta=%h, hang in DFIFO_XFR_ERR!\n",
                                  $stime,                                    bad_tag_mac_sta);
// synopsys translate_on
          end

      default: begin 
                 n_unload_st = `IPP_UNLOAD_IDLE;
               end
    endcase
  end

// =============================================================================
  always @(req_rd_dfifo_sop or
           req_rd_dfifo_eops or
           c_dfifo_tag_st
          ) begin

    n_dfifo_miss_eop = 1'h0;
    n_dfifo_miss_sop = 1'h0;

    n_dfifo_tag_st   = 2'h0;

    case (c_dfifo_tag_st)                       //synopsys parallel_case
      /* 0in < case -default */

      (`IPP_DFIFO_TAG_IDLE):
        if (req_rd_dfifo_sop)
          begin
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_WAIT_EOP;
          end
        else
          begin
            n_dfifo_tag_st   = c_dfifo_tag_st[1:0];
          end

      (`IPP_DFIFO_TAG_WAIT_EOP):
        if      (req_rd_dfifo_eops)
          begin
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_WAIT_SOP;
          end
        else if (req_rd_dfifo_sop)
          begin
            n_dfifo_miss_eop = 1'h1;
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_IDLE;
          end
        else
          begin
            n_dfifo_tag_st   = c_dfifo_tag_st[1:0];
          end

      (`IPP_DFIFO_TAG_WAIT_SOP):
        if      (req_rd_dfifo_sop)
          begin
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_WAIT_EOP;
          end
        else if (req_rd_dfifo_eops)
          begin
            n_dfifo_miss_sop = 1'h1;
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_IDLE;
          end
        else
          begin
            n_dfifo_tag_st   = c_dfifo_tag_st[1:0];
          end

      default:
          begin
            n_dfifo_tag_st   = `IPP_DFIFO_TAG_IDLE;
          end

    endcase
  end

// =============================================================================
  assign n_ipp_unload_idle  = (n_unload_st[4:0]==`IPP_UNLOAD_IDLE);

// =============================================================================
  assign n_hfifo_dat_rptr   = ippfifo_rd_wr_ptr_bypass ?
                             (ippfifo_rd_ptr_pio_wr_en ? ipp_pio_wdata[6:0]       : hfifo_dat_rptr[6:0]) :
                             (inc_hfifo_dat_rptr ? ipp_hfifo_dat_rptr[6:0] + 7'h1 : ipp_hfifo_dat_rptr[6:0]);

  assign ipp_hfifo_dat_rptr = lod_hfifo_base_rptr ? cur_pkt_hdr_base_ptr[6:0] :
                                                    hfifo_dat_rptr[6:0]; 

  assign   hfifo_dat_tag_rd   = {2{inc_hfifo_dat_rptr_d}} & ipp_hfifo_dat_tag[1:0];
  assign n_hfifo_dat_tag_rd   = {2{ipp_dfifo_full}}       & (hfifo_dat_tag_rd[1:0] | hfifo_dat_tag_rd_d[1:0]);
  assign ipp_hfifo_dat_tag_rd = hfifo_dat_tag_rd[1:0] | hfifo_dat_tag_rd_d[1:0];

// =============================================================================
  assign n_addr_wt_pkt    = lod_dfifo_base_wptr    ?  addr_packet[10:0]   : 
                            inc_ipp_dfifo_wptr     ? (addr_wt_pkt[10:0] + 11'h1) :
                                                      addr_wt_pkt[10:0];

  assign n_addr_packet    = wt_dfifo_1st_wd        ? (addr_wt_pkt[10:0] + 11'h1) :
                                                      addr_packet[10:0];

  assign n_addr_status    = wt_dfifo_1st_wd        ? ({1'b0,addr_wt_pkt[10:0]}) :
                                                      addr_status[11:0];

  assign ipp_dfifo_wptr   = datfifo_pio_wr_ena     ?
                           (dfifo_wt_ptr_pio_wr_en ?  ipp_pio_wdata[10:0] : ipp_dfifo_wptr_r[10:0]) :
                            wt_dfifo_1st_wd        ?  addr_status[10:0]   :
                                                     (addr_wt_pkt[10:0]);

  assign n_ipp_dfifo_rptr = datfifo_pio_wr_ena     ?
                           (dfifo_rd_ptr_pio_wr_en ? (ipp_pio_wdata[10:0]) : ipp_dfifo_rptr[10:0]) :
                            n_ipp_dmc_dat_ack      ? (ipp_dfifo_rptr[10:0] + 11'h1) :
                                                      ipp_dfifo_rptr[10:0];

  assign ipp_dfifo_rden   = ipp_enable || datfifo_pio_wr_ena || reset;
//assign ipp_dfifo_rden   = 1'h1;

  assign ipp_dfifo_wten   = datfifo_pio_wr_ena     ?  dfifo_wt_data_reg_wr_en_pls :
                                                      ipp_dfifo_wten_pkt;

  assign dfifo_free_space = (addr_wt_pkt[10] == ipp_dfifo_rptr[10]) ?
                            11'd1024 - {1'h0,(addr_wt_pkt[9:0]     - ipp_dfifo_rptr[9:0])} :
                                       {1'h0,(ipp_dfifo_rptr[9:0]  - addr_wt_pkt[9:0])};

  assign ipp_dfifo_amsful = dfifo_free_space <= 11'h1;

  assign ipp_dfifo_full   = ipp_dfifo_amsful;
//assign ipp_dfifo_full   = (addr_wt_pkt[10]      == !ipp_dfifo_rptr[10]) &&  // 1k_ent, 
//                          (addr_wt_pkt[9:0]     ==  ipp_dfifo_rptr[9:0]);// spare?

  assign ipp_dfifo_empty  = (addr_wt_pkt[10:0]    ==  ipp_dfifo_rptr[10:0]);

  assign n_ipp_dmc_dat_ack = dmc_ipp_dat_req  && !ipp_dfifo_empty && 
                             (!(req_rd_dfifo_eop || req_rd_dfifo_eop_d1 || req_rd_dfifo_eop_d2));

  assign req_rd_dfifo_eop  = ipp_dmc_dat_ack_0  && !ipp_dmc_dat_emp_0 &&
                             ipp_dfifo_dout_eop && !ipp_dfifo_dout_eop_d;

  assign req_rd_dfifo_eops = ipp_dmc_dat_ack_0  && !ipp_dmc_dat_emp_0 &&
                             ipp_dfifo_dout_eop;

  assign req_rd_dfifo_sop  = ipp_dmc_dat_ack_0  && !ipp_dmc_dat_emp_0 &&
                             ipp_dfifo_dout_sop;

  assign ipp_dmc_dat_ack   = ipp_dmc_dat_ack_2;
  assign ipp_dmc_ful_pkt   = ipp_dmc_ful_pkt_2;

// =============================================================================
  always @(req_rd_dfifo_sop_rise_d or wt_dfifo_1st_wd_d2 or 
           dfifo_pkt_count
          ) begin
    case ({req_rd_dfifo_sop_rise_d,wt_dfifo_1st_wd_d2})    //synopsys parallel_case
      /* 0in < case -default */
      (2'b11): n_dfifo_pkt_count = dfifo_pkt_count[8:0];
      (2'b10): n_dfifo_pkt_count = dfifo_pkt_count[8:0] - 9'h1;
      (2'b01): n_dfifo_pkt_count = dfifo_pkt_count[8:0] + 9'h1;
      (2'b00): n_dfifo_pkt_count = dfifo_pkt_count[8:0];
      default: n_dfifo_pkt_count = dfifo_pkt_count[8:0];
    endcase
  end

  assign ecc_err_force       = ipp_dmc_dat_ack_1 && ipp_dmc_dat_err1 || ecc_err_force_d;
  assign n_ipp_dmc_ful_pkt   = (n_dfifo_pkt_count[7:0]!=8'h0) && !n_dfifo_pkt_count[8];
  assign n_ipp_dmc_ful_pkt_2 = ipp_dmc_ful_pkt_1 && !ecc_err_force;

// =============================================================================
  assign ipp_sum_info_vld   = inc_hfifo_dat_rptr_d && 
                              ((ipp_la3_vers==2'h1) || (ipp_la3_vers==2'h2));

  assign ipp_full_cksum     = ((ipp_la3_vers==2'h1) || (ipp_la3_vers==2'h2)) && 
                              ((ipp_la4_prot==2'h1) || (ipp_la4_prot==2'h2)) ||
                              pio_full_cksum;

  assign no_cksum           =  (ipp_la3_vers==2'h0) || (ipp_la3_vers==2'h3) || 
                              ((ipp_la3_vers==2'h1) || (ipp_la3_vers==2'h2)) && !fet_pio_tcp_ena ||
                               (ipp_la4_prot==2'h0) || (ipp_la4_prot==2'h3);

  assign n_ipp_cksum_done   = (c_unload_st!=`IPP_UNLOAD_IDLE) && (ipp_cksum_done || no_cksum); 

  assign ipp_cksum_done     = sum_prt_valid || ipp_cksum_done_r;

// =============================================================================
  always @ (posedge clk)
    if (reset)
      begin
        ipp_ffl_dvalid_n_d    <= #1  1'h0;
        start_unload          <= #1  1'h0;
        inc_hfifo_dat_rptr_d  <= #1  1'h0;
        ipp_cksum_done_r      <= #1  1'h0;
        hfifo_dat_rptr        <= #1  7'h0;
        wt_dfifo_1st_wd_d     <= #1  1'h0;
        wt_dfifo_1st_wd_d2    <= #1  1'h0;
        ipp_dfifo_wptr_r      <= #1 11'h0;
        addr_wt_pkt           <= #1 11'h1;
        addr_status           <= #1 12'h0;
        addr_packet           <= #1 11'h1;
        ipp_dfifo_dout_eop_d  <= #1  1'h0;
        ipp_dfifo_rptr        <= #1 11'h0;
        dfifo_pkt_count       <= #1  9'h0;
        dfifo_miss_eop        <= #1  1'h0;
        dfifo_miss_sop        <= #1  1'h0;
        bad_tag_mac_sta       <= #1  1'h0;
        hfifo_dat_tag_rd_d    <= #1  2'h0;
        clr_ipp_unload        <= #1  1'h0;
        c_unload_st           <= #1  5'h0;
        c_dfifo_tag_st        <= #1  2'h0;
      end 
    else
      begin
        ipp_ffl_dvalid_n_d    <= #1 ipp_ffl_dvalid_n;
        start_unload          <= #1 start_unload_n;
        inc_hfifo_dat_rptr_d  <= #1 inc_hfifo_dat_rptr;
        ipp_cksum_done_r      <= #1 n_ipp_cksum_done;
        hfifo_dat_rptr        <= #1 n_hfifo_dat_rptr[6:0];
        wt_dfifo_1st_wd_d     <= #1 wt_dfifo_1st_wd;
        wt_dfifo_1st_wd_d2    <= #1 wt_dfifo_1st_wd_d;
        ipp_dfifo_wptr_r      <= #1 ipp_dfifo_wptr[10:0];
        addr_wt_pkt           <= #1 n_addr_wt_pkt[10:0];
        addr_status           <= #1 n_addr_status[11:0];
        addr_packet           <= #1 n_addr_packet[10:0];
        ipp_dfifo_dout_eop_d  <= #1 ipp_dfifo_dout_eop; // geo: correct?;
        ipp_dfifo_rptr        <= #1 n_ipp_dfifo_rptr[10:0];
        dfifo_pkt_count       <= #1 n_dfifo_pkt_count[8:0];
        dfifo_miss_eop        <= #1 (n_dfifo_miss_eop || bad_tag_mac_sta);
        dfifo_miss_sop        <= #1 (n_dfifo_miss_sop || bad_tag_mac_sta);
        bad_tag_mac_sta       <= #1 n_bad_tag_mac_sta;
        hfifo_dat_tag_rd_d    <= #1 n_hfifo_dat_tag_rd[1:0];
        clr_ipp_unload        <= #1 n_clr_ipp_unload;
        c_unload_st           <= #1 n_unload_st[4:0];
        c_dfifo_tag_st        <= #1 n_dfifo_tag_st[1:0];
      end 

  ipp_reg_r_1   reg_r_1_ack0   (.di(n_ipp_dmc_dat_ack),      .rs(reset), .ck(clk), .qo(ipp_dmc_dat_ack_0));
  ipp_reg_r_1   reg_r_1_ack1   (.di(ipp_dmc_dat_ack_0),      .rs(reset), .ck(clk), .qo(ipp_dmc_dat_ack_1));
  ipp_reg_r_1   reg_r_1_ack2   (.di(ipp_dmc_dat_ack_1),      .rs(reset), .ck(clk), .qo(ipp_dmc_dat_ack_2));

  ipp_reg_r_1   reg_r_1_ful1   (.di(n_ipp_dmc_ful_pkt),      .rs(reset), .ck(clk), .qo(ipp_dmc_ful_pkt_1));
  ipp_reg_r_1   reg_r_1_ful2   (.di(n_ipp_dmc_ful_pkt_2),    .rs(reset), .ck(clk), .qo(ipp_dmc_ful_pkt_2));

  ipp_reg_r_1   reg_r_1_emp0   (.di(ipp_dfifo_empty),        .rs(reset), .ck(clk), .qo(ipp_dmc_dat_emp_0));

  ipp_reg_r_1   reg_r_1_sop    (.di(req_rd_dfifo_sop),       .rs(reset), .ck(clk), .qo(req_rd_dfifo_sop_d));
  ipp_reg_r_1   reg_r_1_eop_d1 (.di(req_rd_dfifo_eop),       .rs(reset), .ck(clk), .qo(req_rd_dfifo_eop_d1));
  ipp_reg_r_1   reg_r_1_eop_d2 (.di(req_rd_dfifo_eop_d1),    .rs(reset), .ck(clk), .qo(req_rd_dfifo_eop_d2));

  ipp_reg_r_1   reg_r_1_sop_d  (.di(req_rd_dfifo_sop_rise),  .rs(reset), .ck(clk), .qo(req_rd_dfifo_sop_rise_d));

  ipp_reg_r_1   reg_r_1_sum_en (.di(n_fet_pio_tcp_ena),      .rs(reset), .ck(clk), .qo(fet_pio_tcp_ena));

  ipp_reg_r_1   reg_r_1_ecc_fu (.di(ecc_err_force),          .rs(reset), .ck(clk), .qo(ecc_err_force_d));

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

endmodule  // 


