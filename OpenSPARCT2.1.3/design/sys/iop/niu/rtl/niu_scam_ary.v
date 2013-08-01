// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_scam_ary.v
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

    File name       : niu_scam_ary.v

    Module(s) name  : niu_scam_ary

    Parent modules  : niu_scam.v

    Child modules   :           

    Author's name   : George Chu

    Date            : April. 2004

    Description     :

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_scam_ary (
                     data_inp_d,
                     wt_data,
                     wt_mask,
                     rd_data,
                     rd_mask,
                     cam_index_d,
                     reset,
                     cam_clk,
                     match_array,
                     msk_dat_out);

input  [199:0] data_inp_d;    // compare_data/pio_data_input, registered
input          wt_data;       // if 1, pio writes to  cam's data plane.
input          wt_mask;       // if 1, pio writes to  cam's mask plane.
input          rd_data;       // if 1, pio reads from cam's data plane.
input          rd_mask;       // if 1, pio reads from cam's mask plane.
input    [6:0] cam_index_d;   // pio access address, registered
input          reset;
input          cam_clk;       // tcam internal clock 
output [127:0] match_array;   // matched entries 
output [199:0] msk_dat_out;   // pio data read out of cam's mask  or data plane

reg    [127:0] match_array;
reg    [199:0] msk_dat_out;

`ifdef SYN_NIU_WITHOUT_RAM

  always @ (posedge cam_clk)
    if (wt_data || wt_mask || rd_data || rd_mask || reset)
      msk_dat_out  <= data_inp_d;
    else
      msk_dat_out  <= msk_dat_out;

  always @(posedge cam_clk)
    begin
      match_array <= {121'h0,cam_index_d[6:0]};
    end

`else
reg    [199:0] n_msk_dat_out;

reg    [199:0] mem_data [0:127];
wire   [199:0] mem_data_out;

reg    [199:0] mem_mask [0:127];
wire   [199:0] mem_mask_out;

reg      [7:0] entry;
reg    [127:0] match_entry;

/*************** memory ***********************************/
  always @(posedge cam_clk)
    if (wt_data)
      mem_data[cam_index_d] <= #1 data_inp_d[199:0];
    else
      mem_data[cam_index_d] <= #1 mem_data[cam_index_d];

  assign mem_data_out = mem_data[cam_index_d];

/*--------------------------------------------------------*/
  always @(posedge cam_clk)
    if (wt_mask)
      mem_mask[cam_index_d] <= #1 data_inp_d[199:0];
    else
      mem_mask[cam_index_d] <= #1 mem_mask[cam_index_d];

  assign mem_mask_out = mem_mask[cam_index_d];

/*************** compare **********************************/
  always @(posedge cam_clk) begin
    entry       =   8'h0;
    match_entry = 128'h0;
    if (reset) begin
      match_array <= 128'h0;
    end
    else begin
      while (entry < 8'h80) begin
        match_entry[entry] = ((data_inp_d&mem_mask[entry])==(mem_data[entry]&mem_mask[entry]));
        entry = entry[7:0] + 8'h1;
      end
      match_array <= match_entry[127:0];
    end
  end

/*************** read out *********************************/
  always @(rd_data      or rd_mask      or
           mem_data_out or mem_mask_out or 
           msk_dat_out) begin
    case ({rd_data,rd_mask})       //synopsys parallel_case
      (2'b10): n_msk_dat_out = mem_data_out[199:0];
      (2'b01): n_msk_dat_out = mem_mask_out[199:0];
      default: n_msk_dat_out = msk_dat_out[199:0];
    endcase
  end

  always @(posedge cam_clk) begin
    begin
      msk_dat_out   <= n_msk_dat_out[199:0];
    end
  end
/*************** compare **********************************/

`endif

endmodule
