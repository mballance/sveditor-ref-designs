// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tcam.v
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

    File name       : niu_tcam.v

    Module(s) name  : niu_tcam

    Parent modules  : niu_rxc.v

    Child modules   : niu_acam.v, niu_scam.v, niu_tcam_reset_blk  

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

module niu_tcam (
                 data_inp,    cam_compare,
                 pio_wt,      pio_rd,     pio_sel, cam_index, 
`ifdef NEPTUNE
`else            tcu_se_scancollar_in,
                 tcu_se_scancollar_out,
                 tcu_array_wr_inhibit,
                 tcu_aclk,
                 tcu_bclk,
                 iol2clk,
                 scan_in,
                 scan_out,
                 reset_core_tcam,
                 mbi_wdata,
                 mbi_rw_adr,
                 mbi_pio_sel,
                 mbi_wr_en,
                 mbi_rd_en,
                 mbi_compare,
                 mbi_run,
`endif           reset_l,     clk, 
                 cam_valid,   cam_hit,    cam_haddr, 
                 reset_core_fflp_l,
                 pio_rd_vld,
                 msk_dat_out);   

input  [199:0] data_inp;      // compare_data/pio_data_input 
input          cam_compare;   // initiate compare operation 
input          pio_wt;        // if 1, pio writes to  cam's data or mask or valid planes. 
input          pio_rd;        // if 1, pio reads from cam's data or mask or valid planes. 
input          pio_sel;       // pio access cam's mask<=1, data<=0 plane 
`ifdef NEPTUNE
input    [7:0] cam_index;     // pio access address,
`else
input    [6:0] cam_index;     // pio access address,
input          tcu_se_scancollar_in;   // dft - se for input flops              default=0
input          tcu_se_scancollar_out;  // dft - se for output flops             default=0
input          tcu_array_wr_inhibit;   // dft - write inhibit during scan       default=0
input          tcu_aclk;               // dft - scan clock a                    default=0
input          tcu_bclk;               // dft - scan clock b                    default=0
input          iol2clk;
input          scan_in;                // dft - scan in    default= previous flop output
output         scan_out;               // dft - scan out
output         reset_core_tcam;

input  [199:0] mbi_wdata;
input    [6:0] mbi_rw_adr;
input          mbi_pio_sel;
input          mbi_wr_en;
input          mbi_rd_en;
input          mbi_compare;
input          mbi_run;
`endif
input          reset_l;
input          clk;
output         cam_valid;     // if 1, cam is ready to accept a new comparison  
output         cam_hit;       // if 1, there is a cam match/hit
`ifdef NEPTUNE
output   [7:0] cam_haddr;     // index of a cam match/hit entry, N2: {1'b0,haddr[6:0]} 
`else
output   [6:0] cam_haddr;
`endif
output         reset_core_fflp_l;
output         pio_rd_vld;    // pio_read_out_data valid for the core_clk domain
output [201:0] msk_dat_out;   // pio data read out of cam's mask  or data plane  

wire           cam_valid; 
wire           cam_hit; 
`ifdef NEPTUNE
wire     [7:0] cam_haddr;
`else
wire     [6:0] cam_haddr;
wire           scan_out;
`endif
wire           reset_core_fflp_l;
wire           pio_rd_vld;
wire   [201:0] msk_dat_out;

/******************************* local reset *********************************/
wire           reset_core_tcam;

  niu_tcam_reset_blk tcam_reset_blk (
                                     .reset_l           (reset_l),
                                     .clk               (clk), 
                                     .reset_core_fflp_l (reset_core_fflp_l),
                                     .reset_core_tcam   (reset_core_tcam)
                                    );


// =================================== CAM's arrays =======================================  

/* 0in custom -fire (cam_compare && pio_wt) -message "TCAM compare & write at the same time" */

`ifdef NEPTUNE
  niu_acam niu_acam0 (
                      .data_inp             (data_inp[199:0]),
                      .cam_compare          (cam_compare),
                      .pio_wt               (pio_wt),
                      .pio_rd               (pio_rd),
                      .pio_sel              (pio_sel),
                      .cam_index            (cam_index[7:0]),
                      .reset                (reset_core_tcam),
                      .clk                  (clk),
                      .cam_valid            (cam_valid),
                      .cam_hit              (cam_hit),
                      .cam_haddr            (cam_haddr[7:0]),
                      .pio_rd_vld           (pio_rd_vld),
                      .msk_dat_out          (msk_dat_out[201:0])
                     );

`else

  niu_cam_128x200 niu_scam0 (
                             .tcu_aclk                 (tcu_aclk),
                             .tcu_bclk                 (tcu_bclk),
                             .tcu_se_scancollar_in     (tcu_se_scancollar_in),
                             .tcu_se_scancollar_out    (tcu_se_scancollar_out),
                             .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
                             .scan_in                  (scan_in),
                             .scan_out                 (scan_out),
                             .clk                      (iol2clk),
                             .mbi_wdata                (mbi_wdata),
                             .mbi_rw_adr               (mbi_rw_adr),
                             .mbi_pio_sel              (mbi_pio_sel),
                             .mbi_wr_en                (mbi_wr_en),
                             .mbi_rd_en                (mbi_rd_en),
                             .mbi_compare              (mbi_compare),
                             .mbi_run                  (mbi_run),
                             .data_inp                 (data_inp[199:0]),
                             .cam_compare              (cam_compare),
                             .pio_wt                   (pio_wt),
                             .pio_rd                   (pio_rd),
                             .pio_sel                  (pio_sel),
                             .cam_index                (cam_index[6:0]),
                             .reset                    (reset_core_tcam),
                             .cam_valid                (cam_valid),
                             .cam_hit                  (cam_hit),
                             .cam_haddr                (cam_haddr[6:0]),
                             .pio_rd_vld               (pio_rd_vld),
                             .msk_dat_out              (msk_dat_out[199:0])
                            );

  assign msk_dat_out[201:200] = 2'h3;
`endif

endmodule


module niu_tcam_reset_blk (reset_l, clk, reset_core_fflp_l, reset_core_tcam);

input           reset_l;
input           clk;
output          reset_core_fflp_l;
output          reset_core_tcam;

wire            reset_core_fflp_l;
wire            reset_core_tcam;

reg             reset;
wire            reset_p = !reset_l;

`ifdef NEPTUNE
reg             reset_d;
reg             reset_nep_tcam_st, n_reset_nep_tcam_st;
reg       [4:0] reset_cyc_cnt,     n_reset_cyc_cnt;

wire            reset_fall = !reset && reset_d;

  always @(reset_fall        or
           reset_cyc_cnt     or
           reset_nep_tcam_st
          ) begin

    n_reset_cyc_cnt     = 5'h0;
    n_reset_nep_tcam_st = 1'h0;

    case (reset_nep_tcam_st)                     //synopsys parallel_case
      (1'h0): if (reset_fall) begin
                n_reset_nep_tcam_st = 1'h1;
              end
              else begin
                n_reset_nep_tcam_st = reset_nep_tcam_st;
              end
      (1'h1): if (reset_cyc_cnt>=5'h16) begin
                n_reset_cyc_cnt     = 5'h0;
                n_reset_nep_tcam_st = 1'h0;
              end
              else begin
                n_reset_cyc_cnt     = reset_cyc_cnt + 5'h1;
                n_reset_nep_tcam_st = reset_nep_tcam_st;
              end
      default:  n_reset_nep_tcam_st = 1'h0;
    endcase
  end

  always @(posedge clk) begin
    if (reset) begin
      reset_nep_tcam_st   <= #1 1'h0;
      reset_cyc_cnt       <= #1 5'h0;
    end
    else begin
      reset_nep_tcam_st   <= #1 n_reset_nep_tcam_st;
      reset_cyc_cnt       <= #1 n_reset_cyc_cnt;
    end
  end

  always @(posedge clk) begin
      reset_d             <= #1 reset;
  end

`endif

`ifdef NEPTUNE
  assign reset_core_tcam   = reset_nep_tcam_st;
  assign reset_core_fflp_l = !(!reset_l || reset_d || reset_nep_tcam_st);
`else
  assign reset_core_tcam   = reset;
  assign reset_core_fflp_l = reset_l;
`endif 

  always @(posedge clk)
    reset     <= #1 reset_p;

endmodule

