// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_scam.v
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

    File name       : niu_scam.v

    Module(s) name  : niu_scam

    Parent modules  : niu_scam.v

    Child modules   : niu_scam_lib.v

    Author's name   : George Chu

    Date            : April, 2004

    Description     : 

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_scam (
                 data_inp,    cam_compare,
                 pio_wt,      pio_rd,     pio_sel, cam_index, 
                 reset,       clk, 
                 cam_valid,   cam_hit,    cam_haddr, 
                 pio_rd_vld,
                 msk_dat_out);   

input  [199:0] data_inp;      // compare_data/pio_data_input 
input          cam_compare;   // initiate compare operation 
input          pio_wt;        // if 1, pio writes to  cam's data or mask or valid planes. 
input          pio_rd;        // if 1, pio reads from cam's data or mask or valid planes. 
input          pio_sel;       // pio access cam's mask<=1, data<=0 plane 
input    [6:0] cam_index;     // pio access address,             N2: {1'b0,cam_index[6:0]} 
input          reset;
input          clk;
output         cam_valid;     // if 1, cam is ready to accept a new comparison  
output         cam_hit;       // if 1, there is a cam match/hit
output   [6:0] cam_haddr;     // index of a cam match/hit entry, N2: {1'b0,haddr[6:0]} 
output         pio_rd_vld;    // pio_read_out_data valid for the core_clk domain
output [199:0] msk_dat_out;   // pio data read out of cam's mask  or data plane  

wire           cam_valid; 
wire           cam_hit; 
wire     [6:0] cam_haddr;
wire           pio_rd_vld;
wire   [199:0] msk_dat_out;

// ----------- cam's pre-registers --------------------
wire   [199:0] data_inp_d;
wire           cam_compare_d;
wire           pio_wt_d;
wire           pio_rd_d;
wire           pio_sel_d;
wire     [6:0] cam_index_d;

// ----------- cam's match_array ----------------------
wire   [127:0] match_array;

// ----------- cam's control --------------------------
wire           cmp_enc;
wire           cmp_busy;
wire           clr_cam;
wire           c_scam_st;
wire           wt_data;
wire           wt_mask;
wire           rd_data;
wire           rd_mask;
wire           c_pio_rw_st;

// =================================== CAM's data pre_registered ==========================  
  niu_scam_pre niu_scam_pre0 (
                              .data_inp       (data_inp[199:0]),
                              .cam_compare    (cam_compare),
                              .pio_wt         (pio_wt),
                              .pio_rd         (pio_rd),
                              .pio_sel        (pio_sel),
                              .cam_index      (cam_index[6:0]),
                              .reset          (reset),
                              .cam_clk        (clk),
                              .data_inp_d     (data_inp_d[199:0]),
                              .cam_compare_d  (cam_compare_d),
                              .pio_wt_d       (pio_wt_d),
                              .pio_rd_d       (pio_rd_d),
                              .pio_sel_d      (pio_sel_d),
                              .cam_index_d    (cam_index_d[6:0])
                             );

// =================================== CAM's arrays =======================================  
  niu_scam_ary niu_scam_ary0 (
                              .data_inp_d     (data_inp_d[199:0]),
                              .wt_data        (wt_data),
                              .wt_mask        (wt_mask),
                              .rd_data        (rd_data),
                              .rd_mask        (rd_mask),
                              .cam_index_d    (cam_index_d[6:0]),
                              .reset          (reset),
                              .cam_clk        (clk),
                              .match_array    (match_array[127:0]),
                              .msk_dat_out    (msk_dat_out[199:0])
                             );

// =================================== CAM's priority encoder =============================  
  niu_scam_enc niu_scam_enc0 (
                              .match_array    (match_array[127:0]),
                              .cmp_enc        (cmp_enc),
                              .reset          (reset),
                              .cam_clk        (clk),
                              .cam_hit        (cam_hit),
                              .cam_haddr      (cam_haddr[6:0])
                             );

// =================================== CAM's control ======================================  
  niu_scam_ctl niu_scam_ctl0 (
                              .cam_compare_d  (cam_compare_d),
                              .pio_wt_d       (pio_wt_d),
                              .pio_rd_d       (pio_rd_d),
                              .pio_sel_d      (pio_sel_d),
                              .reset          (reset),
                              .cam_clk        (clk),
                              .cmp_enc        (cmp_enc),
                              .cmp_busy       (cmp_busy),
                              .cam_valid      (cam_valid),
                              .clr_cam        (clr_cam),
                              .c_scam_st      (c_scam_st),
                              .wt_data        (wt_data),
                              .wt_mask        (wt_mask),
                              .rd_data        (rd_data),
                              .rd_mask        (rd_mask),
                              .pio_rd_vld     (pio_rd_vld),
                              .c_pio_rw_st    (c_pio_rw_st)
                             );

endmodule
