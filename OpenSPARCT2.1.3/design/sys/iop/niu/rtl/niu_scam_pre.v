// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_scam_pre.v
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

    File name       : niu_scam_pre.v

    Module(s) name  : niu_scam_pre

    Parent modules  : niu_scam.v

    Child modules   :           

    Author's name   : George Chu

    Date            : Jan. 2004

    Description     : 

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_scam_pre (data_inp,    cam_compare,
                     pio_wt,      pio_rd,      pio_sel,    cam_index,
                     reset,       cam_clk, 
                     data_inp_d,  cam_compare_d, 
                     pio_wt_d,    pio_rd_d,    pio_sel_d,  cam_index_d);

input  [199:0] data_inp;      // compare_data/pio_write_data
input          cam_compare;   // initiate compare operation
input          pio_wt;        // if 1, pio writes to  cam's data or mask planes.
input          pio_rd;        // if 1, pio reads from cam's data or mask planes.
input          pio_sel;       // pio access cam's mask<=1, data<=0 plane
input    [6:0] cam_index;     // pio access address,             N2: {1'b0,cam_index[6:0]}
input          reset; 
input          cam_clk; 
output [199:0] data_inp_d;   
output         cam_compare_d; 
output         pio_wt_d;      
output         pio_rd_d;      
output         pio_sel_d; 
output   [6:0] cam_index_d;   

reg    [199:0] data_inp_d;   
reg            cam_compare_d; 
reg            pio_wt_d;      
reg            pio_rd_d;      
reg            pio_sel_d; 
reg      [6:0] cam_index_d;   

  always @(posedge cam_clk) begin
    if (reset) begin
      data_inp_d     <= 200'h0;
      cam_compare_d  <=   1'h0;
      pio_wt_d       <=   1'h0;
      pio_rd_d       <=   1'h0;
      pio_sel_d      <=   1'h0;
      cam_index_d    <=   7'h0;
    end
    else begin
      data_inp_d     <= data_inp[199:0];
      cam_compare_d  <= cam_compare;
      pio_wt_d       <= pio_wt;
      pio_rd_d       <= pio_rd;
      pio_sel_d      <= pio_sel;
      cam_index_d    <= cam_index[6:0];
    end
  end

endmodule
