// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_ififo.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_zcp_ififo.v
 * Author Name  : John Lo
 * Description  : fflp to zcp input fifo (ififo)
 * Parent Module: 
 * Child  Module: 
 * Interface Mod:
 * Date Created : 3/18/2005
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "niu_zcp.h"

module niu_zcp_ififo
  (/*AUTOARG*/
   // Outputs
   ififo_dout, empty, ififo_overrun, 
   // Inputs
   clk, reset, ififo_ren1, fflp_zcp_wr, fflp_zcp_data
   );
   

   
   input                      clk;
   input  [4:0]		      reset;
   input         	      ififo_ren1;
                              // fflp intf
   input  [4:0]		      fflp_zcp_wr;
   input  [`IFIFO_W_R]	      fflp_zcp_data;// 27 bytes = 216 bits
   output [`IFIFO_W_R] 	      ififo_dout;
   output 		      empty;
   output 		      ififo_overrun;

/* ----- ififo pointer management ----------------------- */
   reg  [`IFIFO_W_R]          ififo_dout;
   wire [`IFIFO_PTR] 	      rp;
   wire [`IFIFO_PTR] 	      wp;
   wire 		      full;
   wire 		      empty;
   wire [3:0]		      wen;
   wire 		      ififo_overrun;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 		      fflp_wr_err =  ~(&fflp_zcp_wr);
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
   assign  wen[0] = fflp_zcp_wr[0] & (wp[1:0] == 2'h0); // wp == 0
   assign  wen[1] = fflp_zcp_wr[1] & (wp[1:0] == 2'h1); // wp == 1
   assign  wen[2] = fflp_zcp_wr[2] & (wp[1:0] == 2'h2); // wp == 2
   assign  wen[3] = fflp_zcp_wr[3] & (wp[1:0] == 2'h3); // wp == 3
   assign  ififo_overrun  =  full & fflp_zcp_wr[4];
  
   zcp_counter #(`IFIFO_A_ADD1) wp_counter (
                .reset(reset[0]),.clk(clk),.ce(fflp_zcp_wr[4]),
                .count(wp[`IFIFO_PTR]));

   zcp_counter #(`IFIFO_A_ADD1) rp_counter (
                .reset(reset[0]),.clk(clk),.ce(ififo_ren1),
                .count(rp[`IFIFO_PTR]));

   // synopsys translate_off
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [`IFIFO_PTR] empty_space =
        (wp[`IFIFO_A] == rp[`IFIFO_A]) ?
        `IFIFO_D - ({1'b0,wp[`IFIFO_A_R]} - {1'b0,rp[`IFIFO_A_R]}):
        ({1'b0,rp[`IFIFO_A_R]} - {1'b0,wp[`IFIFO_A_R]});
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   // synopsys translate_on
   
   assign  full=
           (wp[`IFIFO_A]==(!rp[`IFIFO_A])) &&
           (wp[`IFIFO_A_R]==rp[`IFIFO_A_R]);

   assign  empty=
           (wp[`IFIFO_PTR]==rp[`IFIFO_PTR]);

/* ----- end of ififo pointer management ------------------- */
   
/* ----- ififo instantiation ------------------------------ */
   wire [`IFIFO_W_R] wd0;
   wire [`IFIFO_W_R] wd1;
   wire [`IFIFO_W_R] wd2;
   wire [`IFIFO_W_R] wd3;

zcp_xREG #(`IFIFO_W) wd0_xREG(.clk(clk),.reset(reset[1]),.en(wen[0]),.din(fflp_zcp_data[`IFIFO_W_R]),  .qout(wd0[`IFIFO_W_R]));
zcp_xREG #(`IFIFO_W) wd1_xREG(.clk(clk),.reset(reset[2]),.en(wen[1]),.din(fflp_zcp_data[`IFIFO_W_R]),  .qout(wd1[`IFIFO_W_R]));
zcp_xREG #(`IFIFO_W) wd2_xREG(.clk(clk),.reset(reset[3]),.en(wen[2]),.din(fflp_zcp_data[`IFIFO_W_R]),  .qout(wd2[`IFIFO_W_R]));
zcp_xREG #(`IFIFO_W) wd3_xREG(.clk(clk),.reset(reset[4]),.en(wen[3]),.din(fflp_zcp_data[`IFIFO_W_R]),  .qout(wd3[`IFIFO_W_R]));
   
always @ (rp or wd0 or wd1 or wd2 or wd3)
  begin
     casex (rp[1:0])  // synopsys parallel_case full_case infer_mux
       2'h0:    ififo_dout[`IFIFO_W_R] = wd0;
       2'h1:    ififo_dout[`IFIFO_W_R] = wd1;
       2'h2:    ififo_dout[`IFIFO_W_R] = wd2;
       2'h3:    ififo_dout[`IFIFO_W_R] = wd3;
       default: ififo_dout[`IFIFO_W_R] = wd0;
     endcase
  end


   
endmodule // niu_zcp_ififo

