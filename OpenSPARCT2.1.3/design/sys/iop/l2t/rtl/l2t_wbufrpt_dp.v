// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_wbufrpt_dp.v
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
module  l2t_wbufrpt_dp (
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out, 
  l2t_l2b_wbrd_en_r0, 
  l2t_l2b_rdma_rden_r0, 
  wbuf_rdmat_read_en, 
  wbuf_wb_read_en, 
  wbuf_wbufrpt_leave_state0, 
  wbuf_wbufrpt_next_state_1, 
  cycle_count_less_than_7_din, 
  mcu_l2t_wr_ack_d1);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire ff_latched_rdma_read_en_scanin;
wire ff_latched_rdma_read_en_scanout;
wire latched_wb_read_en;
wire latched_rdma_read_en;
wire ff_l2t_l2b_evict_en_r0_scanin;
wire ff_l2t_l2b_evict_en_r0_scanout;
wire state_bit1;
wire l2t_l2b_evict_en_r0_d1_n;
wire cycle_count_less_than_7;
wire l2t_l2b_evict_en_r0_n;
wire l2t_l2b_evict_en_r0;
wire evict_en_r0_d1_n_and_rdma_rd_en;
wire evict_en_r0_d1_n_and_wb_rd_en;




input	l2clk;
input   tcu_pce_ov;
input   tcu_aclk;
input   tcu_bclk;
input   tcu_scan_en;
input   tcu_clk_stop;
input	scan_in;
output	scan_out;

output	l2t_l2b_wbrd_en_r0;
output	l2t_l2b_rdma_rden_r0;

input	wbuf_rdmat_read_en;
input	wbuf_wb_read_en;
input	wbuf_wbufrpt_leave_state0;
input	wbuf_wbufrpt_next_state_1;
input	cycle_count_less_than_7_din;
input	mcu_l2t_wr_ack_d1;




assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = tcu_clk_stop;
assign se = tcu_scan_en;


l2t_msff_macro__dmsff_32x__stack_2r__width_2 ff_latched_rdma_read_en 
          (
	  .scan_in(ff_latched_rdma_read_en_scanin),
	  .scan_out(ff_latched_rdma_read_en_scanout),
	  .dout   ({latched_wb_read_en,latched_rdma_read_en}), 
          .din ({wbuf_wb_read_en,wbuf_rdmat_read_en}), 
          .en  (wbuf_wbufrpt_leave_state0), 
          .clk (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 

l2t_msff_macro__dmsff_32x__stack_4r__width_3 ff_l2t_l2b_evict_en_r0 
          (
          .scan_in(ff_l2t_l2b_evict_en_r0_scanin),
          .scan_out(ff_l2t_l2b_evict_en_r0_scanout),
          .dout  ({state_bit1,l2t_l2b_evict_en_r0_d1_n,cycle_count_less_than_7}),
          .din ({wbuf_wbufrpt_next_state_1,l2t_l2b_evict_en_r0_n,cycle_count_less_than_7_din}),
          .en  (1'b1),
          .clk (l2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_inv_macro__dinv_16x__width_1 inv_l2t_l2b_evict_en_r0 
	(
	.dout	(l2t_l2b_evict_en_r0),
	.din	(l2t_l2b_evict_en_r0_n)
	);

cl_u1_aoi12_16x  aoi_l2t_l2b_evict_en_r0 
      (
      .out    (l2t_l2b_evict_en_r0_n),
      .in00   (state_bit1),
      .in01   (mcu_l2t_wr_ack_d1),
      .in10   (cycle_count_less_than_7)
      );

l2t_and_macro__dinv_24x__dnand_16x__width_2 nand_evict_en_r0_d1_n_and_rd_en 
	(
	.dout	({evict_en_r0_d1_n_and_rdma_rd_en,evict_en_r0_d1_n_and_wb_rd_en}),
	.din0	({l2t_l2b_evict_en_r0_d1_n,l2t_l2b_evict_en_r0_d1_n}),
	.din1	({latched_rdma_read_en,latched_wb_read_en})
	);

l2t_and_macro__dinv_32x__dnand_24x__width_2 nand_l2t_l2b_rdma_rden_r0 
	(
	.dout	({l2t_l2b_rdma_rden_r0,l2t_l2b_wbrd_en_r0}),
	.din0	({evict_en_r0_d1_n_and_rdma_rd_en,evict_en_r0_d1_n_and_wb_rd_en}),
	.din1	({l2t_l2b_evict_en_r0,l2t_l2b_evict_en_r0})
	);

///////////////////////////////////////////////////////////////////////////////////////
//assign  leave_state1          =  (state_bit1 & mcu_l2t_wr_ack_d1);
//assign  l2t_l2b_evict_en_r0   = (state_bit1 & mcu_l2t_wr_ack_d1) | cycle_count_less_than_7 ;
//assign  l2t_l2b_rdma_rden_r0  =  (l2t_l2b_evict_en_r0 & l2t_l2b_evict_en_r0_d1_n) & latched_rdma_read_en  ; 
//assign  l2t_l2b_wbrd_en_r0    = (l2t_l2b_evict_en_r0 & l2t_l2b_evict_en_r0_d1_n) & latched_wb_read_en  ;
///////////////////////////////////////////////////////////////////////////////////////

// fixscan start:
assign ff_latched_rdma_read_en_scanin = scan_in                  ;
assign ff_l2t_l2b_evict_en_r0_scanin = ff_latched_rdma_read_en_scanout;
assign scan_out                  = ff_l2t_l2b_evict_en_r0_scanout;
// fixscan end:
endmodule



// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_4r__width_3 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [1:0] so;

  input [2:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [2:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);




















endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_and_macro__dinv_24x__dnand_16x__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule




//  
//   and macro for ports = 2,3,4
//
//





module l2t_and_macro__dinv_32x__dnand_24x__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule



// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_2r__width_2 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule


//
//   invert macro
//
//





module l2t_inv_macro__dinv_16x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule


