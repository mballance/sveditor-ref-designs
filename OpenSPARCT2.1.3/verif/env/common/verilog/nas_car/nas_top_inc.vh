// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas_top_inc.vh
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
reg  [63:0] lsu_stb_empty_1;
reg  [63:0] lsu_stb_empty_2;
reg  [63:0] lsu_stb_empty_3;
wire [63:0] lsu_stb_empty = lsu_stb_empty_3;  // Used by nas_top & nas_pipe
wire [63:0] lsu_stb_empty_0 = 
  {
  `ifdef CORE_7
     `CPU.spc7.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_6
     `CPU.spc6.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_5
     `CPU.spc5.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_4
     `CPU.spc4.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_3
     `CPU.spc3.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_2
     `CPU.spc2.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_1
     `CPU.spc1.lsu_stb_empty,
  `else
     8'hff,
  `endif
  `ifdef CORE_0
     `CPU.spc0.lsu_stb_empty
  `else
     8'hff
  `endif
  };

//----------------------------------------------------------------------
// Finish the simulation when all outstanding I$ reqs are over.
// Required for global_chkr (L1/L2 cache checker) to work properly.

reg  [63:0] ireq_pending_1;
reg  [63:0] ireq_pending_2;
reg  [63:0] ireq_pending_3;
wire [7:0] ireq_pending_c0 = 
  {
  `ifdef CORE_0
`ifdef GATESIM
     8'hff
`else
     `SPC0.ifu_cmu.cmt.csm7.null_state, `SPC0.ifu_cmu.cmt.csm6.null_state, 
     `SPC0.ifu_cmu.cmt.csm5.null_state, `SPC0.ifu_cmu.cmt.csm4.null_state,
     `SPC0.ifu_cmu.cmt.csm3.null_state, `SPC0.ifu_cmu.cmt.csm2.null_state,
     `SPC0.ifu_cmu.cmt.csm1.null_state, `SPC0.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c1 = 
  {
  `ifdef CORE_1
`ifdef GATESIM
     8'hff
`else
     `SPC1.ifu_cmu.cmt.csm7.null_state, `SPC1.ifu_cmu.cmt.csm6.null_state, 
     `SPC1.ifu_cmu.cmt.csm5.null_state, `SPC1.ifu_cmu.cmt.csm4.null_state,
     `SPC1.ifu_cmu.cmt.csm3.null_state, `SPC1.ifu_cmu.cmt.csm2.null_state,
     `SPC1.ifu_cmu.cmt.csm1.null_state, `SPC1.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c2 = 
  {
  `ifdef CORE_2
`ifdef GATESIM
     8'hff
`else
     `SPC2.ifu_cmu.cmt.csm7.null_state, `SPC2.ifu_cmu.cmt.csm6.null_state, 
     `SPC2.ifu_cmu.cmt.csm5.null_state, `SPC2.ifu_cmu.cmt.csm4.null_state,
     `SPC2.ifu_cmu.cmt.csm3.null_state, `SPC2.ifu_cmu.cmt.csm2.null_state,
     `SPC2.ifu_cmu.cmt.csm1.null_state, `SPC2.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c3 = 
  {
  `ifdef CORE_3
`ifdef GATESIM
     8'hff
`else
     `SPC3.ifu_cmu.cmt.csm7.null_state, `SPC3.ifu_cmu.cmt.csm6.null_state, 
     `SPC3.ifu_cmu.cmt.csm5.null_state, `SPC3.ifu_cmu.cmt.csm4.null_state,
     `SPC3.ifu_cmu.cmt.csm3.null_state, `SPC3.ifu_cmu.cmt.csm2.null_state,
     `SPC3.ifu_cmu.cmt.csm1.null_state, `SPC3.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c4 = 
  {
  `ifdef CORE_4
`ifdef GATESIM
     8'hff
`else
     `SPC4.ifu_cmu.cmt.csm7.null_state, `SPC4.ifu_cmu.cmt.csm6.null_state, 
     `SPC4.ifu_cmu.cmt.csm5.null_state, `SPC4.ifu_cmu.cmt.csm4.null_state,
     `SPC4.ifu_cmu.cmt.csm3.null_state, `SPC4.ifu_cmu.cmt.csm2.null_state,
     `SPC4.ifu_cmu.cmt.csm1.null_state, `SPC4.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c5 = 
  {
  `ifdef CORE_5
`ifdef GATESIM
     8'hff
`else
     `SPC5.ifu_cmu.cmt.csm7.null_state, `SPC5.ifu_cmu.cmt.csm6.null_state, 
     `SPC5.ifu_cmu.cmt.csm5.null_state, `SPC5.ifu_cmu.cmt.csm4.null_state,
     `SPC5.ifu_cmu.cmt.csm3.null_state, `SPC5.ifu_cmu.cmt.csm2.null_state,
     `SPC5.ifu_cmu.cmt.csm1.null_state, `SPC5.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c6 = 
  {
  `ifdef CORE_6
`ifdef GATESIM
     8'hff
`else
     `SPC6.ifu_cmu.cmt.csm7.null_state, `SPC6.ifu_cmu.cmt.csm6.null_state, 
     `SPC6.ifu_cmu.cmt.csm5.null_state, `SPC6.ifu_cmu.cmt.csm4.null_state,
     `SPC6.ifu_cmu.cmt.csm3.null_state, `SPC6.ifu_cmu.cmt.csm2.null_state,
     `SPC6.ifu_cmu.cmt.csm1.null_state, `SPC6.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };
wire [7:0] ireq_pending_c7 = 
  {
  `ifdef CORE_7
`ifdef GATESIM
     8'hff
`else
     `SPC7.ifu_cmu.cmt.csm7.null_state, `SPC7.ifu_cmu.cmt.csm6.null_state, 
     `SPC7.ifu_cmu.cmt.csm5.null_state, `SPC7.ifu_cmu.cmt.csm4.null_state,
     `SPC7.ifu_cmu.cmt.csm3.null_state, `SPC7.ifu_cmu.cmt.csm2.null_state,
     `SPC7.ifu_cmu.cmt.csm1.null_state, `SPC7.ifu_cmu.cmt.csm0.null_state
`endif
  `else
     8'hff
  `endif
  };

 wire [63:0] ireq_pending = `PARGS.gchkr_on ? ireq_pending_3 : 64'hffffffffffffffff;

//----------------------------------------------------------------------
always @ (posedge `BENCH_SPC0_GCLK) begin // {

  // Pipeline STB_empty so that STACK can occur 
  // before th_check_enable is turned off.  (G,M,B,W = 3 cycles)
  lsu_stb_empty_1 <= lsu_stb_empty_0;
  lsu_stb_empty_2 <= lsu_stb_empty_1;
  lsu_stb_empty_3 <= lsu_stb_empty_2;

  //stage ireq to give time for linefill to be written into the I$
  ireq_pending_1 <= {ireq_pending_c7,ireq_pending_c6,ireq_pending_c5,ireq_pending_c4, 
                     ireq_pending_c3,ireq_pending_c2,ireq_pending_c1,ireq_pending_c0};

  ireq_pending_2 <= ireq_pending_1;
  ireq_pending_3 <= ireq_pending_2;
end // }

//----------------------------------------------------------------------
//----------------------------------------------------------------------
