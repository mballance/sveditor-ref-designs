// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rw_ctl.v
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

/*****************************************************************
 *
 * File Name    : niu_rw_ctl.v
 * Author Name  : John Lo
 * Description  : It contains PIO read/write decoder, registers,
 * 
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/30/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : This is of /vobs/neptune/deisgn/niu/pio/rtl/niu_rw_ctl.v.main_5
 * 
 ****************************************************************/

module niu_rw_ctl (/*AUTOARG*/
   // Outputs
   wr_en, rd_en, ack, rdata, err, rasr, 
   // Inputs
   clk, sel, rd, rd_data, non_qualified_addr_err
   );
   input 		      clk;
   input 		      sel;
   input 		      rd;
   input  [63:0] 	      rd_data;
   input 		      non_qualified_addr_err;

   output 		      wr_en;
   output 		      rd_en;
   output 		      ack;
   output [63:0] 	      rdata;
   output 		      err;
   output 		      rasr;   // read auto set/rst

/* ----------- Read and Write logic ------------------------ */


   wire 		      rasr;
   wire 		      rasr_ok;
   wire 		      addr_err;
   wire [63:0] 		      rdata;
   wire [63:0] 		      rd_data;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      sel_lead;
   wire 		      sel_trail ;
   
   niu_pls_gen2 sel_pls_gen2(.sig_in(sel),.clk(clk),
                             .lead(sel_lead),
                             .trail(sel_trail));

   assign    rd_en   = sel       &   rd;
   assign    rasr_ok = sel_lead  &   rd;
   assign    wr_en   = sel_lead  & (~rd);

   df1 #(1)  ras_pls_df1 (.clk(clk),   
                         .d(rasr_ok),
                         .q(rasr));

   // register pio output signals
   df1 #(64) rdata_df1 (.clk(clk),
                        .d(rd_data[63:0]),
                        .q(rdata[63:0]));
   
   df1 #(1)  ack_df1 (.clk(clk),   
                      .d(sel_lead),
                      .q(ack));

   assign    addr_err = non_qualified_addr_err & sel_lead;

   df1 #(1)  err_df1 (.clk(clk),   
                      .d(addr_err),
                      .q(err));

endmodule // niu_rw_ctl


// /*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : niu_rw_ctl.v
 * Author Name  : John Lo
 * Description  : It contains PIO read/write decoder, registers,
 * 
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/30/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : This is of /vobs/neptune/deisgn/niu/pio/rtl/niu_rw_ctl.v.main_5
 *                + niu_pio_eco_r3, for niu_pio_slv_decoder ONLY.
 ****************************************************************/

module niu_rw_ctl_0 (/*AUTOARG*/
   // Outputs
   wr_en, rd_en, ack, rdata, err, rasr, 
   // Inputs
   clk, sel, rd, rd_data, non_qualified_addr_err
   );
   input 		      clk;
   input 		      sel;
   input 		      rd;
   input  [63:0] 	      rd_data;
   input 		      non_qualified_addr_err;

   output 		      wr_en;
   output 		      rd_en;
   output 		      ack;
   output [63:0] 	      rdata;
   output 		      err;
   output 		      rasr;   // read auto set/rst

/* ----------- Read and Write logic ------------------------ */


   wire 		      rasr;
   wire 		      rasr_ok;
   wire 		      addr_err;
   wire [63:0] 		      rdata;
   wire [63:0] 		      rd_data;
   wire 		      rd_en;
   wire 		      wr_en;
   wire 		      sel_lead;
   wire 		      sel_trail ;
   
   niu_pls_gen2 sel_pls_gen2(.sig_in(sel),.clk(clk),
                             .lead(sel_lead),
                             .trail(sel_trail));

   assign    rd_en   = sel       &   rd;
   assign    rasr_ok = sel_lead  &   rd;
   assign    wr_en   = sel_lead  & (~rd);

   df1 #(1)  ras_pls_df1 (.clk(clk),   
                         .d(rasr_ok),
                         .q(rasr));

/* geo_niu_pio_eco_r3 */
/* fix dev_funcID 1 read behind, bugID: 119443, skip a flop for bit[17:16] */
wire            rdata_t17, rdata_t16;

  assign rdata[17:16] = rd_data[17:16];

   // register pio output signals
   df1 #(64) rdata_df1 (.clk(clk),
                        .d(rd_data[63:0]),
/* geo_niu_pio_eco_r3 */.q({rdata[63:18],rdata_t17,rdata_t16,rdata[15:0]}));
   
   df1 #(1)  ack_df1 (.clk(clk),   
                      .d(sel_lead),
                      .q(ack));

   assign    addr_err = non_qualified_addr_err & sel_lead;

   df1 #(1)  err_df1 (.clk(clk),   
                      .d(addr_err),
                      .q(err));

endmodule // niu_rw_ctl_0
