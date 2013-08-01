// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_scam_ctl.v
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

    File name       : niu_scam_ctl.v

    Module(s) name  : niu_scam_ctl

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

`include "niu_scam.h"

module niu_scam_ctl (
                     cam_compare_d, 
                     pio_wt_d, 
                     pio_rd_d, 
                     pio_sel_d, 
                     reset, 
                     cam_clk, 
                     cmp_enc, 
                     cmp_busy, 
                     cam_valid, 
                     clr_cam, 
                     c_scam_st,
                     wt_data,
                     wt_mask,
                     rd_data,
                     rd_mask,
                     pio_rd_vld,  
                     c_pio_rw_st 
                    );

input          cam_compare_d; // initiate compare operation
input          pio_wt_d; 
input          pio_rd_d; 
input          pio_sel_d; 
input          reset; 
input          cam_clk; 
output         cmp_enc;
output         cmp_busy;
output         cam_valid;
output         clr_cam;
output         c_scam_st;
output         wt_data;
output         wt_mask;
output         rd_data;
output         rd_mask;
output         pio_rd_vld;
output         c_pio_rw_st;

/**********************************************************/
reg  /*geo*/   cmp_enc;
reg            cmp_busy;
reg            cam_valid;
reg            clr_cam;
reg            c_scam_st;

wire           wt_data;
wire           wt_mask;
wire           rd_data;
wire           rd_mask;
reg            pio_rd_vld;
reg            c_pio_rw_st;

/*--------------------------------------------------------*/
reg            inc_cyc_cnt;
reg            n_cmp_busy;
reg            n_cam_valid;
reg            n_clr_scam;

reg            n_scam_st;

wire     [2:0] pio_cam_cyc_1 = 3'h2;  // geo, real 3-1=2
wire     [2:0] pio_cam_cyc_2 = 3'h1;  // geo, real 3-2=1

wire     [2:0] cyc_cnt;

wire           n_cmp_enc = (cyc_cnt==pio_cam_cyc_2[2:0]) && (c_scam_st==`NIU_SCAM_CMP);

/*--------------------------------------------------------*/
reg            n_catch_pio_rd;
reg              catch_pio_rd;

reg            n_pio_rw_st;

/**********************************************************/
  always @(cam_compare_d    or
           cyc_cnt          or
           pio_cam_cyc_1    or
           cmp_busy         or
           c_scam_st
          ) begin

    inc_cyc_cnt    = 1'h0;
    n_cam_valid    = 1'h0;
    n_clr_scam     = 1'h0;
    n_scam_st      = `NIU_SCAM_IDL;

    n_cmp_busy     = cmp_busy;

    case (c_scam_st)                 //synopsys parallel_case
      (`NIU_SCAM_IDL):
        begin
          if (cam_compare_d) begin
            inc_cyc_cnt  = 1'h1;
            n_cmp_busy   = 1'h1;
            n_scam_st    = `NIU_SCAM_CMP;
          end
          else begin
            n_cmp_busy   = 1'h0;
            n_scam_st    = `NIU_SCAM_IDL;
          end
        end
      (`NIU_SCAM_CMP):
        begin
          if (cyc_cnt>=pio_cam_cyc_1) begin
            n_cmp_busy   = 1'h0;
            n_cam_valid  = 1'h1;
            n_clr_scam   = 1'h1;
            n_scam_st    = `NIU_SCAM_IDL;
          end
          else begin
            inc_cyc_cnt  = 1'h1;
            n_scam_st    = `NIU_SCAM_CMP;
          end
        end
      default:
        begin
            n_cmp_busy   = 1'h0;
            n_cam_valid  = 1'h1;
            n_clr_scam   = 1'h1;
            n_scam_st    = `NIU_SCAM_IDL;
        end
    endcase
  end

  niu_scam_cnt_i_r_3 cam_cnt_i_r_3_0(.incr(inc_cyc_cnt), .rs(clr_cam), .ck(cam_clk), .qo(cyc_cnt[2:0]));

/**********************************************************/
 always @(pio_wt_d or pio_rd_d or
          c_pio_rw_st
         ) begin

   n_catch_pio_rd   = 1'h0;
   n_pio_rw_st      = `NIU_SCAM_PIO_IDL;

   case (c_pio_rw_st)                 //synopsys parallel_case
     (`NIU_SCAM_PIO_IDL):
       begin
         if (pio_wt_d || pio_rd_d) begin
           n_catch_pio_rd   = pio_rd_d;
           n_pio_rw_st      = `NIU_SCAM_PIO_OUT;
         end
         else begin
           n_catch_pio_rd   = 1'h0;
           n_pio_rw_st      = `NIU_SCAM_PIO_IDL;
         end
       end
     (`NIU_SCAM_PIO_OUT):
       begin
           n_catch_pio_rd   = 1'h0;
           n_pio_rw_st      = `NIU_SCAM_PIO_IDL;
       end
     default:
       begin
           n_catch_pio_rd   = 1'h0;
           n_pio_rw_st      = `NIU_SCAM_PIO_IDL;
       end
   endcase
 end

  assign wt_data = pio_wt_d && !pio_sel_d && (c_pio_rw_st==`NIU_SCAM_PIO_IDL) && !cmp_busy;
  assign wt_mask = pio_wt_d &&  pio_sel_d && (c_pio_rw_st==`NIU_SCAM_PIO_IDL) && !cmp_busy;
  assign rd_data = pio_rd_d && !pio_sel_d && (c_pio_rw_st==`NIU_SCAM_PIO_IDL);
  assign rd_mask = pio_rd_d &&  pio_sel_d && (c_pio_rw_st==`NIU_SCAM_PIO_IDL);

/**********************************************************/

  always @(posedge cam_clk)
    if (reset)
      begin 
/*geo*/ cmp_enc            <= #1 (1'h0);
        cmp_busy           <= #1 (1'h0);
        cam_valid          <= #1 (1'h0);
        clr_cam            <= #1 (1'h1);
        c_scam_st          <= #1 (1'h0);

        catch_pio_rd       <= #1 (1'h0);
        pio_rd_vld         <= #1 (1'h0);
        c_pio_rw_st        <= #1 (`NIU_SCAM_PIO_IDL);
      end
    else
      begin 
/*geo*/ cmp_enc            <= #1 (n_cmp_enc);
        cmp_busy           <= #1 (n_cmp_busy);
        cam_valid          <= #1 (n_cam_valid);
        clr_cam            <= #1 (n_clr_scam);
        c_scam_st          <= #1 (n_scam_st);

        catch_pio_rd       <= #1 (n_catch_pio_rd);
        pio_rd_vld         <= #1 (catch_pio_rd);
        c_pio_rw_st        <= #1 (n_pio_rw_st);
      end

endmodule
