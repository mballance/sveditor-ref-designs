// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_stg2_dp.v
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
module sio_stg2_dp (
  l2clk, 
  l2b_sio_data, 
  l2b_sio_parity, 
  l2b_sio_ue_err, 
  l2b_sio_ctag_vld, 
  l2b_sio_data_r, 
  l2b_sio_parity_r, 
  l2b_sio_ue_err_r, 
  l2b_sio_ctag_vld_r, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire muxtst;
wire test;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire dff_l2b_sio_data_scanin;
wire dff_l2b_sio_data_scanout;
wire [31:0] l2b_sio_data_r1;
wire l2b_sio_ctag_vld_r1;
wire [1:0] l2b_sio_parity_r1;
wire l2b_sio_ue_err_r1;
wire dff_l2b_sio_data_2_scanin;
wire dff_l2b_sio_data_2_scanout;
		           
				           
   input          l2clk;
   input [31:0]   l2b_sio_data;		
   input [1:0] 	  l2b_sio_parity;		           
   input 	  l2b_sio_ue_err;		           
   input 	  l2b_sio_ctag_vld;		           
   
   output [31:0]  l2b_sio_data_r;		
   output [1:0]   l2b_sio_parity_r;		           
   output 	  l2b_sio_ue_err_r;		           
   output 	  l2b_sio_ctag_vld_r;		           

   input          tcu_muxtest;
   input 	  tcu_dectest;
   input 	  tcu_scan_en;
   
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   output 	  scan_out;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  muxtst = tcu_muxtest;
   assign 	  test   = tcu_dectest;
   assign 	  se     = tcu_scan_en;
   
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan



   sio_stg2_dp_msff_macro__stack_36c__width_36 dff_l2b_sio_data   (
	.scan_in(dff_l2b_sio_data_scanin),
	.scan_out(dff_l2b_sio_data_scanout),
	.clk  (l2clk),
	.din  ({l2b_sio_data[31:0], l2b_sio_ctag_vld, l2b_sio_parity[1:0],l2b_sio_ue_err}),
	.dout ({l2b_sio_data_r1[31:0], l2b_sio_ctag_vld_r1, l2b_sio_parity_r1[1:0],l2b_sio_ue_err_r1}),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_stg2_dp_msff_macro__stack_36c__width_36 dff_l2b_sio_data_2   (
	.scan_in(dff_l2b_sio_data_2_scanin),
	.scan_out(dff_l2b_sio_data_2_scanout),
	.clk  (l2clk),
	.din ({l2b_sio_data_r1[31:0], l2b_sio_ctag_vld_r1, l2b_sio_parity_r1[1:0],l2b_sio_ue_err_r1}),
	.dout ({l2b_sio_data_r[31:0], l2b_sio_ctag_vld_r, l2b_sio_parity_r[1:0],l2b_sio_ue_err_r}),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


// fixscan start:
assign dff_l2b_sio_data_scanin   = scan_in                  ;
assign dff_l2b_sio_data_2_scanin = dff_l2b_sio_data_scanout ;
assign scan_out                  = dff_l2b_sio_data_2_scanout;
// fixscan end:
endmodule // sio_old_dp		           
				           
				           






// any PARAMS parms go into naming of macro

module sio_stg2_dp_msff_macro__stack_36c__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule








