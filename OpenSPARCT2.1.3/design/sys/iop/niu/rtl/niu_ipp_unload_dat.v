// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_unload_dat.v
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

    File name       : niu_ipp_unload_dat.v

    Module(s) name  : niu_ipp_unload_dat

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp.h

    Author's name   : George Chu

    Date            : Jan. 2004

    Description     : This module maintains the data path of the ipp_unload. 

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_unload_dat (
                           ipp_hfifo_dat_dout,  
                           inc_hfifo_dat_rptr_d,  
                           ipp_hfifo_dat_tag_rd,  
                           wt_dfifo_1st_wd,  
                           cur_pkt_ffl_sum_info,  
                           ipp_dsc_pkt,
                           mac_drop_bad_crc,
                           status_rd_abort,
                           ipp_hfifo_over_run_r,
                           ipp_hfifo_under_run_r,
                           ipp_hfifo_par_err,
                           fet_pio_tcp_ena,  
                           ipp_full_cksum,  
                           sum_prt_cksum,  
                           sum_prt_length,  
                           sum_prt_fail,  
                           addr_status,  
                           datfifo_pio_wr_ena,
                           dfifo_wt_data_reg,
                           clr_ipp_unload,  

                           reset,
                           clk, 

                           ipp_dfifo_dinp
                          );

input  [129:0]  ipp_hfifo_dat_dout;
input           inc_hfifo_dat_rptr_d;
input    [1:0]  ipp_hfifo_dat_tag_rd;
input   [13:0]  cur_pkt_ffl_sum_info;
input           wt_dfifo_1st_wd;
input           ipp_dsc_pkt;
input           mac_drop_bad_crc;
input           status_rd_abort;
input           ipp_hfifo_over_run_r;
input           ipp_hfifo_under_run_r;
input           ipp_hfifo_par_err;
input           fet_pio_tcp_ena;
input           ipp_full_cksum;
input   [15:0]  sum_prt_cksum;
input   [15:0]  sum_prt_length;
input           sum_prt_fail;
input   [11:0]  addr_status;
input           datfifo_pio_wr_ena;
input  [129:0]  dfifo_wt_data_reg;
input           clr_ipp_unload;

input           reset;
input           clk;

output [129:0]  ipp_dfifo_dinp;

wire   [129:0]  ipp_dfifo_dinp;

wire    [35:0]  cur_cksum_info;

wire            sop = 1'b1;    // start of a packet 
wire            eop = 1'b0;    // end   of a packet 

wire     [5:0]  cur_pkt_disc;

wire   [129:0]  dfifo_status_wd; 
wire    [39:0]  n_mac_status_wd; 
reg     [39:0]    mac_status_wd; 

// =============================================================================

  assign n_mac_status_wd    = inc_hfifo_dat_rptr_d ? 
                               ((ipp_hfifo_dat_tag_rd==2'h3) ? ipp_hfifo_dat_dout[103:64] :
                                (ipp_hfifo_dat_tag_rd==2'h1) ? ipp_hfifo_dat_dout[039:00] : 40'h0) :
                               mac_status_wd[39:0];

  assign cur_pkt_disc       = {ipp_hfifo_par_err, ipp_hfifo_under_run_r, ipp_hfifo_over_run_r,
                               status_rd_abort,   mac_drop_bad_crc,
                               ipp_dsc_pkt};

  assign cur_cksum_info     = {sum_prt_length[15:0],
                               1'h0, fet_pio_tcp_ena, sum_prt_fail, ipp_full_cksum,
                               sum_prt_cksum[15:0]};

// =============================================================================

  assign dfifo_status_wd = {eop, sop, 
                            mac_status_wd[39:0],
                            4'h0,addr_status[11:0],
                            14'h0,
                            cur_pkt_disc[5:0],
                            2'h0, cur_pkt_ffl_sum_info[13:0],
                            cur_cksum_info[35:0] 
                           }; 

// =============================================================================
  assign ipp_dfifo_dinp = datfifo_pio_wr_ena  ? dfifo_wt_data_reg[129:0] :
                          wt_dfifo_1st_wd     ? dfifo_status_wd[129:0]   :
                                                {ipp_hfifo_dat_dout[129],1'h0,ipp_hfifo_dat_dout[127:0]}; 

// =============================================================================
  always @ (posedge clk)
    if (reset || clr_ipp_unload)
      begin
        mac_status_wd        <= #1 40'h0;
      end
    else
      begin
        mac_status_wd        <= #1 n_mac_status_wd[39:0];
      end

endmodule  // 


