// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_fcd_ctl.v
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
module ncu_fcd_ctl (
  cpubuf_din, 
  cpubuf_tail_f, 
  cpubuf_tail_ptr, 
  cpubuf_wr, 
  intbuf_din, 
  intbuf_head_ptr, 
  intbuf_tail_ptr, 
  intbuf_wr, 
  intbuf_rden, 
  iobuf_head_f, 
  iobuf_head_ptr, 
  iobuf_rden, 
  mondo_busy_vec_f, 
  mondo_data0_din, 
  mondo_data0_wr, 
  mondo_data1_din, 
  mondo_data1_wr, 
  mondo_data_addr_p0, 
  mondo_data_addr_p1, 
  mondo_rd_en, 
  ncu_cpx_data_ca, 
  ncu_cpx_req_cq, 
  ncu_pcx_stall_pq, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_acc_seq_d2_f, 
  tap_mondo_dout_d2_f, 
  scan_out, 
  mb0_wdata, 
  mb0_run, 
  mb0_addr, 
  mb0_iobuf_wr_en, 
  mb1_run, 
  mb1_wdata, 
  mb1_cpubuf_wr_en, 
  mb1_addr, 
  tcu_mbist_user_mode, 
  tcu_mbist_bisi_en, 
  cmp_io_sync_en, 
  cpubuf_head_s, 
  cpx_ncu_grant_cx, 
  intbuf_dout, 
  iobuf_dout, 
  iobuf_tail_s, 
  io_cmp_sync_en, 
  io_mondo_data0_din_s, 
  io_mondo_data1_din_s, 
  io_mondo_data_wr_addr_s, 
  io_mondo_data_wr_s, 
  l2clk, 
  mondo_data0_dout, 
  mondo_data1_dout, 
  pcx_ncu_data_px2, 
  pcx_ncu_data_rdy_px1, 
  scan_in, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_din_s, 
  tap_mondo_wr_s, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_clk_stop, 
  tcu_pce_ov, 
  tcu_scan_en, 
  cpubuf_mb0_data, 
  mb0_scanout, 
  mb0_done, 
  mb0_fail, 
  mb0_start, 
  mb0_scanin, 
  iobuf_ue_f, 
  iobuf_uei, 
  intbuf_ue_f, 
  intbuf_uei, 
  mondotbl_pe_f, 
  mondotbl_pei, 
  array_wr_inhibit_io, 
  array_wr_inhibit_cmp, 
  array_wr_inhibit_gate) ;
wire intbuf_wr2i2c;
wire cmp_io_sync_en_dout;
wire intbuf_hit_hwm;
wire io_cmp_sync_en_dout;
wire ncu_c2ifcd_ctl_scanin;
wire ncu_c2ifcd_ctl_scanout;
wire mb0_mondo_wr_en;
wire mb0_mondo_rd_en;
wire mb0_intbuf_wr_en;
wire ncu_i2cfcd_ctl_scanin;
wire ncu_i2cfcd_ctl_scanout;
wire mb0_intbuf_rd_en;
wire mb0_iobuf_rd_en;
wire l1clk;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;
wire cmp_io_sync_en_ff_scanin;
wire cmp_io_sync_en_ff_scanout;
wire io_cmp_sync_en_ff_scanin;
wire io_cmp_sync_en_ff_scanout;


output [143:0]		cpubuf_din;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [5:0]		cpubuf_tail_f;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [4:0]		cpubuf_tail_ptr;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			cpubuf_wr;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [143:0]		intbuf_din;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [4:0]		intbuf_head_ptr;	// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output [4:0]		intbuf_tail_ptr;	// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output			intbuf_wr;		// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output			intbuf_rden;		// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output [5:0]		iobuf_head_f;		// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output [4:0]		iobuf_head_ptr;	// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output			iobuf_rden;		// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output [63:0]		mondo_busy_vec_f;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [71:0]		mondo_data0_din;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			mondo_data0_wr;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [71:0]		mondo_data1_din;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			mondo_data1_wr;		// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [5:0]		mondo_data_addr_p0;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [5:0]		mondo_data_addr_p1;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output 			mondo_rd_en;
output [145:0]		ncu_cpx_data_ca;	// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output [7:0]		ncu_cpx_req_cq;		// From ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
output			ncu_pcx_stall_pq;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			tap_mondo_acc_addr_invld_d2_f;// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			tap_mondo_acc_seq_d2_f;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output [63:0]		tap_mondo_dout_d2_f;	// From ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
output			scan_out;

// mb0 interface
output [7:0]		mb0_wdata;
output 			mb0_run;
output [5:0]		mb0_addr;
output			mb0_iobuf_wr_en;
input			mb1_run;
input[7:0]		mb1_wdata;
input			mb1_cpubuf_wr_en;
input[5:0]		mb1_addr;
input			tcu_mbist_user_mode;
input			tcu_mbist_bisi_en;

input			cmp_io_sync_en;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input [5:0]		cpubuf_head_s;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [7:0]		cpx_ncu_grant_cx;	// To ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
input [143:0]		intbuf_dout;		// To ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
input [175:0]		iobuf_dout;		// To ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
input [5:0]		iobuf_tail_s;		// To ncu_i2cfcd_ctl of ncu_i2cfcd_ctl.v
input			io_cmp_sync_en;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input [63:0]		io_mondo_data0_din_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [63:0]		io_mondo_data1_din_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [5:0]		io_mondo_data_wr_addr_s;// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			io_mondo_data_wr_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			l2clk;			// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input [71:0]		mondo_data0_dout;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [71:0]		mondo_data1_dout;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [129:0]		pcx_ncu_data_px2;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			pcx_ncu_data_rdy_px1;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			scan_in;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input [21:0]		tap_mondo_acc_addr_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			tap_mondo_acc_seq_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input [63:0]		tap_mondo_din_s;	// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			tap_mondo_wr_s;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v
input			tcu_aclk;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input			tcu_bclk;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input			tcu_clk_stop;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input			tcu_pce_ov;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input			tcu_scan_en;		// To ncu_c2ifcd_ctl of ncu_c2ifcd_ctl.v, ...
input [7:0]		cpubuf_mb0_data ;

//mb0 connection from tcu//
output			mb0_scanout;
output			mb0_done;
output			mb0_fail;
input			mb0_start;
input			mb0_scanin;

// err ecc //
output			iobuf_ue_f;
input			iobuf_uei;
output			intbuf_ue_f;
input			intbuf_uei;
output			mondotbl_pe_f;
input			mondotbl_pei;

// wr_inhibit
input			array_wr_inhibit_io;
input			array_wr_inhibit_cmp;
output			array_wr_inhibit_gate;



/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics


assign array_wr_inhibit_gate = array_wr_inhibit_io & array_wr_inhibit_cmp;

///* ncu_c2ifcd_ctl auto_template ( 
// 				  .scan_out () ); */
ncu_c2ifcd_ctl ncu_c2ifcd_ctl ( /*AUTOINST*/
			       // Outputs
			       .cpubuf_din(cpubuf_din[143:0]),
			       .cpubuf_tail_f(cpubuf_tail_f[5:0]),
			       .cpubuf_tail_ptr(cpubuf_tail_ptr[4:0]),
			       .cpubuf_wr(cpubuf_wr),
			       .intbuf_wr(intbuf_wr),
			       .intbuf_din(intbuf_din[143:0]),
			       .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			       .mondo_data0_din(mondo_data0_din[71:0]),
			       .mondo_data0_wr(mondo_data0_wr),
			       .mondo_data1_din(mondo_data1_din[71:0]),
			       .mondo_data1_wr(mondo_data1_wr),
			       .mondo_data_addr_p0(mondo_data_addr_p0[5:0]),
			       .mondo_data_addr_p1(mondo_data_addr_p1[5:0]),
			       .mondo_rd_en(mondo_rd_en),
			       .ncu_pcx_stall_pq(ncu_pcx_stall_pq),
			       .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			       .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			       .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			       .intbuf_wr2i2c(intbuf_wr2i2c),
			       .mondotbl_pe_f(mondotbl_pe_f),
			       // Inputs
			       .cmp_io_sync_en(cmp_io_sync_en_dout),
			       .cpubuf_head_s(cpubuf_head_s[5:0]),
			       .intbuf_hit_hwm(intbuf_hit_hwm),
			       .io_cmp_sync_en(io_cmp_sync_en_dout),
			       .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			       .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			       .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			       .io_mondo_data_wr_s(io_mondo_data_wr_s),
			       .scan_in(ncu_c2ifcd_ctl_scanin),
			       .scan_out(ncu_c2ifcd_ctl_scanout),
			       .l2clk	(l2clk),
			       .mondo_data0_dout(mondo_data0_dout[71:0]),
			       .mondo_data1_dout(mondo_data1_dout[71:0]),
			       .pcx_ncu_data_px2(pcx_ncu_data_px2[129:0]),
			       .pcx_ncu_data_rdy_px1(pcx_ncu_data_rdy_px1),
			       .tcu_scan_en(tcu_scan_en),
			       .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			       .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			       .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			       .tap_mondo_wr_s(tap_mondo_wr_s),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .mb1_run(mb1_run),
			       .mb1_wdata(mb1_wdata[7:0]),
			       .mb1_addr(mb1_addr[5:0]),
			       .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
			       //.mb0_mondo_sel(mb0_mondo_wr_en),
			       .mb0_mondo_wr_en(mb0_mondo_wr_en),
			       .mb0_mondo_rd_en(mb0_mondo_rd_en),
			       //.mb0_cpubuf_sel(mb0_cpubuf_sel),
			       //.mb0_intbuf_sel(mb0_intbuf_wr_en),
			       .mb0_intbuf_wr_en(mb0_intbuf_wr_en),
			       .mb0_run(mb0_run),
			       .mb0_waddr(mb0_addr[5:0]),
			       .mb0_raddr(mb0_addr[5:0]),
			       .mb0_wdata(mb0_wdata[7:0]),
			       .mondotbl_pei(mondotbl_pei));



///* ncu_i2cfcd_ctl auto_template ( 
//			        .scan_out() ); */
ncu_i2cfcd_ctl ncu_i2cfcd_ctl ( /*AUTOINST*/
			       // Outputs
			       .intbuf_head_ptr(intbuf_head_ptr[4:0]),
			       .intbuf_hit_hwm(intbuf_hit_hwm),
			       .intbuf_tail_ptr(intbuf_tail_ptr[4:0]),
			       .intbuf_rden(intbuf_rden),
			       .iobuf_head_f(iobuf_head_f[5:0]),
			       .iobuf_head_ptr(iobuf_head_ptr[4:0]),
			       .iobuf_rden(iobuf_rden),
			       .ncu_cpx_data_ca(ncu_cpx_data_ca[145:0]),
			       .ncu_cpx_req_cq(ncu_cpx_req_cq[7:0]),
			       .iobuf_ue_f(iobuf_ue_f),
			       .intbuf_ue_f(intbuf_ue_f),
			       // Inputs
			       .cmp_io_sync_en(cmp_io_sync_en_dout),
			       .cpx_ncu_grant_cx(cpx_ncu_grant_cx[7:0]),
			       .intbuf_dout(intbuf_dout[143:0]),
			       .iobuf_dout(iobuf_dout[175:0]),
			       .iobuf_tail_s(iobuf_tail_s[5:0]),
			       .io_cmp_sync_en(io_cmp_sync_en_dout),
			       .scan_in(ncu_i2cfcd_ctl_scanin),
			       .scan_out(ncu_i2cfcd_ctl_scanout),
			       .l2clk	(l2clk),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .mb0_raddr(mb0_addr[4:0]),
			       .mb0_waddr(mb0_addr[4:0]),
			       .mb0_run(mb0_run),
			       .mb0_intbuf_wr_en(mb0_intbuf_wr_en),
			       .mb0_intbuf_rd_en(mb0_intbuf_rd_en),
			       .mb0_iobuf_rd_en(mb0_iobuf_rd_en),
			       .intbuf_wr2i2c(intbuf_wr2i2c),
			       .iobuf_uei(iobuf_uei),
			       .intbuf_uei(intbuf_uei));







ncu_mb0_ctl ncu_mb0_ctl(
			// outputs
			.mb0_run(mb0_run),
			.mb0_addr(mb0_addr[5:0]),
			.mb0_wdata(mb0_wdata[7:0]),
			.mb0_intbuf_wr_en(mb0_intbuf_wr_en),
			.mb0_intbuf_rd_en(mb0_intbuf_rd_en),
			.mb0_mondo_wr_en(mb0_mondo_wr_en),
			.mb0_mondo_rd_en(mb0_mondo_rd_en),
			.mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			.mb0_iobuf_rd_en(mb0_iobuf_rd_en),
			.mb0_done(mb0_done),
			.mb0_fail(mb0_fail),
			.scan_out(mb0_scanout),
			// inputs
			.l2clk(l2clk),	// mb0 tests l2clk domin
			.scan_in(mb0_scanin),
			.tcu_pce_ov(tcu_pce_ov),	 
			.tcu_clk_stop(tcu_clk_stop),
			.tcu_aclk(tcu_aclk),
			.tcu_bclk(tcu_bclk),
			.tcu_scan_en(tcu_scan_en),
			.mb0_start(mb0_start),
			//.mb0_userdata_mode(1'b0),
			.mb0_bisi_mode(tcu_mbist_bisi_en),
			//.mb0_loop_mode(1'b0),
			//.mb0_loop_on_address(1'b0),
			//.mb0_stop_on_fail(1'b0),
			//.mb0_stop_on_next_fail(1'b0),
			.mb0_user_mode(tcu_mbist_user_mode),
			.intbuf_dout(intbuf_dout[143:0]),
			.iobuf_dout(iobuf_dout[175:0]),
			.mondo_data0_dout(mondo_data0_dout[71:0]),
			.mondo_data1_dout(mondo_data1_dout[71:0]));

/* spare gate, 12398 cells/450 = 28 spare gate */

/*
spare_ctl_macro spares (num=28) (
                .scan_in(spares_scanin),
                .scan_out(spares_scanout),
                .l1clk  (l1clk)
        );
*/

ncu_fcd_ctl_l1clkhdr_ctl_macro clkgen (
                                .l2clk  (l2clk),
                                .l1en   (1'b1),
                                .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                                );

assign  siclk = tcu_aclk;
assign  soclk = tcu_bclk;
assign     se = tcu_scan_en;
assign  pce_ov = tcu_pce_ov;
assign  stop = tcu_clk_stop;

ncu_fcd_ctl_msff_ctl_macro__width_1 cmp_io_sync_en_ff 
                                (
                                .scan_in(cmp_io_sync_en_ff_scanin),
                                .scan_out(cmp_io_sync_en_ff_scanout),
                                .dout           (cmp_io_sync_en_dout),
                                .l1clk          (l1clk),
                                .din            (cmp_io_sync_en),
  .siclk(siclk),
  .soclk(soclk)
                                );

ncu_fcd_ctl_msff_ctl_macro__width_1 io_cmp_sync_en_ff 
                                (
                                .scan_in(io_cmp_sync_en_ff_scanin),
                                .scan_out(io_cmp_sync_en_ff_scanout),
                                .dout           (io_cmp_sync_en_dout),
                                .l1clk          (l1clk),
                                .din            (io_cmp_sync_en),
  .siclk(siclk),
  .soclk(soclk)
                                );				



// fixscan start:
assign ncu_c2ifcd_ctl_scanin     = scan_in                  ;
assign ncu_i2cfcd_ctl_scanin     = ncu_c2ifcd_ctl_scanout   ;
assign cmp_io_sync_en_ff_scanin	 = ncu_i2cfcd_ctl_scanout;
assign io_cmp_sync_en_ff_scanin  =  cmp_io_sync_en_ff_scanout ;
assign scan_out                  = io_cmp_sync_en_ff_scanout;
// fixscan end:
endmodule //ncu_fcd_ctl



// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule





// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_129 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [128:0] fdin;
wire [127:0] so;

  input [128:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [128:0] dout;
  output scan_out;
assign fdin[128:0] = din[128:0];






dff #(129)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[128:0]),
.si({scan_in,so[127:0]}),
.so({so[127:0],scan_out}),
.q(dout[128:0])
);












endmodule










// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_72 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [71:0] fdin;
wire [70:0] so;

  input [71:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [71:0] dout;
  output scan_out;
assign fdin[71:0] = din[71:0];






dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule





// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_122 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [121:0] fdin;
wire [120:0] so;

  input [121:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [121:0] dout;
  output scan_out;
assign fdin[121:0] = din[121:0];






dff #(122)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[121:0]),
.si({scan_in,so[120:0]}),
.so({so[120:0],scan_out}),
.q(dout[121:0])
);












endmodule



// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule




// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_146 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [145:0] fdin;
wire [144:0] so;

  input [145:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [145:0] dout;
  output scan_out;
assign fdin[145:0] = din[145:0];






dff #(146)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[145:0]),
.si({scan_in,so[144:0]}),
.so({so[144:0],scan_out}),
.q(dout[145:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_144 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [143:0] fdin;
wire [142:0] so;

  input [143:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [143:0] dout;
  output scan_out;
assign fdin[143:0] = (din[143:0] & {144{en}}) | (dout[143:0] & ~{144{en}});






dff #(144)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[143:0]),
.si({scan_in,so[142:0]}),
.so({so[142:0],scan_out}),
.q(dout[143:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_154 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [153:0] fdin;
wire [152:0] so;

  input [153:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [153:0] dout;
  output scan_out;
assign fdin[153:0] = (din[153:0] & {154{en}}) | (dout[153:0] & ~{154{en}});






dff #(154)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[153:0]),
.si({scan_in,so[152:0]}),
.so({so[152:0],scan_out}),
.q(dout[153:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__en_1__width_176 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [175:0] fdin;
wire [174:0] so;

  input [175:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [175:0] dout;
  output scan_out;
assign fdin[175:0] = (din[175:0] & {176{en}}) | (dout[175:0] & ~{176{en}});






dff #(176)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[175:0]),
.si({scan_in,so[174:0]}),
.so({so[174:0],scan_out}),
.q(dout[175:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_fcd_ctl_spare_ctl_macro__num_11 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));
assign scan_out = so_10;



endmodule



module ncu_mb0_ctl (
  mb0_run, 
  mb0_addr, 
  mb0_wdata, 
  mb0_intbuf_wr_en, 
  mb0_intbuf_rd_en, 
  mb0_mondo_wr_en, 
  mb0_mondo_rd_en, 
  mb0_iobuf_wr_en, 
  mb0_iobuf_rd_en, 
  mb0_done, 
  mb0_fail, 
  scan_out, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  mb0_start, 
  mb0_bisi_mode, 
  mb0_user_mode, 
  intbuf_dout, 
  iobuf_dout, 
  mondo_data0_dout, 
  mondo_data1_dout);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire config_reg_scanin;
wire config_reg_scanout;
wire [8:0] config_in;
wire [8:0] config_out;
wire start_transition;
wire reset_engine;
wire mbist_user_loop_mode;
wire mbist_done;
wire run;
wire bisi;
wire user_mode;
wire user_data_mode;
wire user_addr_mode;
wire user_loop_mode;
wire user_cmpsel_hold;
wire ten_n_mode;
wire mbist_user_data_mode;
wire mbist_user_addr_mode;
wire mbist_user_cmpsel_hold;
wire mbist_ten_n_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data_out;
wire user_start_addr_reg_scanin;
wire user_start_addr_reg_scanout;
wire [5:0] user_start_addr_in;
wire [5:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [5:0] user_stop_addr_in;
wire [5:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [5:0] user_incr_addr_in;
wire [5:0] user_incr_addr;
wire user_array_sel_reg_scanin;
wire user_array_sel_reg_scanout;
wire [1:0] user_array_sel_in;
wire [1:0] user_array_sel;
wire user_cmpsel_reg_scanin;
wire user_cmpsel_reg_scanout;
wire [1:0] user_cmpsel_in;
wire [1:0] user_cmpsel;
wire user_bisi_wr_reg_scanin;
wire user_bisi_wr_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_reg_scanin;
wire user_bisi_rd_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire mbist_user_bisi_wr_mode;
wire mbist_user_bisi_wr_rd_mode;
wire start_transition_reg_scanin;
wire start_transition_reg_scanout;
wire start_transition_piped;
wire run_reg_scanin;
wire run_reg_scanout;
wire counter_reg_scanin;
wire counter_reg_scanout;
wire [3:0] counter_in;
wire [3:0] counter_out;
wire cycle16;
wire run_piped16;
wire msb;
wire intbuf_rd_wr_en_reg_scanin;
wire intbuf_rd_wr_en_reg_scanout;
wire mbist_intbuf_read;
wire mbist_intbuf_write;
wire mondo_rd_wr_en_reg_scanin;
wire mondo_rd_wr_en_reg_scanout;
wire mbist_mondo_read;
wire mbist_mondo_write;
wire iobuf_rd_wr_en_reg_scanin;
wire iobuf_rd_wr_en_reg_scanout;
wire mbist_iobuf_read;
wire mbist_iobuf_write;
wire mb0_addr_reg_scanin;
wire mb0_addr_reg_scanout;
wire [5:0] mbist_address;
wire mb0_wdata_reg_scanin;
wire mb0_wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire done_fail_reg_scanin;
wire done_fail_reg_scanout;
wire fail;
wire intbuf_rd_en_piped2;
wire mondo_rd_en_piped2;
wire iobuf_rd_en_piped2;
wire [1:0] cmpsel_piped3;
wire res_read_data_reg_scanin;
wire res_read_data_reg_scanout;
wire [47:0] res_read_data_piped;
wire control_reg_scanin;
wire control_reg_scanout;
wire [21:0] control_in;
wire [21:0] control_out;
wire bisi_wr_rd;
wire [1:0] array_sel;
wire [1:0] cmpsel;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [5:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [5:0] start_addr;
wire [5:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [5:0] stop_addr;
wire [6:0] overflow_addr;
wire intbuf_sel;
wire iobuf_sel;
wire [5:0] incr_addr;
wire overflow;
wire [6:0] compare_addr;
wire [5:0] add;
wire [5:0] adj_address;
wire mondo_sel;
wire increment_march_elem;
wire [1:0] next_array_sel;
wire [1:0] next_cmpsel;
wire [1:0] next_data_control;
wire next_address_mix;
wire [3:0] next_march_element;
wire array_write;
wire array_read;
wire true_data;
wire [7:0] data_pattern;
wire done_counter_reg_scanin;
wire done_counter_reg_scanout;
wire [2:0] done_counter_in;
wire [2:0] done_counter_out;
wire data_pipe_reg1_scanin;
wire data_pipe_reg1_scanout;
wire [7:0] date_pipe_reg1_in;
wire [7:0] data_pipe_out1;
wire data_pipe_reg2_scanin;
wire data_pipe_reg2_scanout;
wire [7:0] date_pipe_reg2_in;
wire [7:0] data_pipe_out2;
wire data_pipe_reg3_scanin;
wire data_pipe_reg3_scanout;
wire [7:0] date_pipe_reg3_in;
wire [7:0] data_pipe_out3;
wire [7:0] ncu_mb0_piped_wdata;
wire ren_pipe_reg1_scanin;
wire ren_pipe_reg1_scanout;
wire [2:0] ren_pipe_reg1_in;
wire [2:0] rd_en_piped;
wire ren_pipe_reg2_scanin;
wire ren_pipe_reg2_scanout;
wire [2:0] ren_pipe_reg2_in;
wire [2:0] rd_en_piped2;
wire ren_pipe_reg3_scanin;
wire ren_pipe_reg3_scanout;
wire [2:0] ren_pipe_reg3_in;
wire [2:0] rd_en_piped3;
wire intbuf_rd_en_piped3;
wire mondo_rd_en_piped3;
wire iobuf_rd_en_piped3;
wire cmpsel_pipe_reg1_scanin;
wire cmpsel_pipe_reg1_scanout;
wire [1:0] cmpsel_pipe_reg1_in;
wire [1:0] cmpsel_pipe_out1;
wire cmpsel_pipe_reg2_scanin;
wire cmpsel_pipe_reg2_scanout;
wire [1:0] cmpsel_pipe_reg2_in;
wire [1:0] cmpsel_pipe_out2;
wire cmpsel_pipe_reg3_scanin;
wire cmpsel_pipe_reg3_scanout;
wire [1:0] cmpsel_pipe_reg3_in;
wire [1:0] cmpsel_pipe_out3;
wire cmpsel_pipe_reg4_scanin;
wire cmpsel_pipe_reg4_scanout;
wire [1:0] cmpsel_pipe_reg4_in;
wire [1:0] cmpsel_pipe_out4;
wire [1:0] cmpsel_piped4;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [2:0] fail_reg_in;
wire [2:0] fail_reg_out;
wire qual_iobuf_fail;
wire qual_mondo_fail;
wire qual_intbuf_fail;
wire fail_detect;





// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output 	          mb0_run;

   output [5:0]	      mb0_addr;
   output [7:0]       mb0_wdata;

   output 	          mb0_intbuf_wr_en;
   output 	          mb0_intbuf_rd_en;
   
   output 	          mb0_mondo_wr_en;
   output 	          mb0_mondo_rd_en;
   
   output 	          mb0_iobuf_wr_en;
   output 	          mb0_iobuf_rd_en;
   
   output             mb0_done;
   output             mb0_fail;

   output             scan_out;



// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input              l2clk;
   input              scan_in;
   input              tcu_pce_ov;             // scan signals
   input              tcu_clk_stop;
   input              tcu_aclk;
   input              tcu_bclk;
   input	          tcu_scan_en;


   input              mb0_start;
   input              mb0_bisi_mode;
   input              mb0_user_mode;

   input [143:0]	intbuf_dout;

   input [175:0]	iobuf_dout;

   input  [71:0]	mondo_data0_dout;
   input  [71:0]	mondo_data1_dout;


// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////
reg [47:0] res_read_data;

assign pce_ov = tcu_pce_ov;
assign stop   = tcu_clk_stop;
assign siclk  = tcu_aclk;
assign soclk  = tcu_bclk;
assign se     = tcu_scan_en;



////////////////////////////////////////////////////////////////////////////////
// Clock header

ncu_fcd_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mb0_start will reset and start the engine.  
// mb0_start must remain active high for the duration of MBIST.  
// If mb0_start deasserts the engine will stop but not reset.
// Once MBIST has completed mbist_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mb0_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  ncu_fcd_ctl_msff_ctl_macro__width_9 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[8:0]       ),
               .dout     ( config_out[8:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign config_in[0]        =    mb0_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1];  // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   mb0_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   mb0_user_mode:      config_out[3];
  assign user_mode           =    config_out[3];

  assign config_in[4]        =    config_out[4];
  assign user_data_mode      =    config_out[4];

  assign config_in[5]        =    config_out[5];
  assign user_addr_mode      =    config_out[5];

  assign config_in[6]        =    config_out[6];
  assign user_loop_mode      =    config_out[6];

  assign config_in[7]        =    config_out[7];
  assign user_cmpsel_hold    =    config_out[7];   //cmpsel_hold = 0 :  Default, All cominations
                                                   //          = 1 :  User-specified cmpsel
  assign config_in[8]        =    config_out[8];
  assign ten_n_mode          =    config_out[8];
                                                 

  assign mbist_user_data_mode =   user_mode & user_data_mode;
  assign mbist_user_addr_mode =   user_mode & user_addr_mode;
  assign mbist_user_loop_mode =   user_mode & user_loop_mode;
  assign mbist_user_cmpsel_hold = user_mode & user_cmpsel_hold;
  assign mbist_ten_n_mode     =   user_mode & ten_n_mode;


  ncu_fcd_ctl_msff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];


// Defining User start, stop, and increment addresses.

  ncu_fcd_ctl_msff_ctl_macro__width_6 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[5:0]  ),
                 .dout     ( user_start_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[5:0]   =    user_start_addr[5:0];

  ncu_fcd_ctl_msff_ctl_macro__width_6 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[5:0]  ),
                 .dout     ( user_stop_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[5:0]   =    user_stop_addr[5:0];


  ncu_fcd_ctl_msff_ctl_macro__width_6 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[5:0]  ),
                 .dout     ( user_incr_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[5:0]   =    user_incr_addr[5:0];

// Defining User array_sel.

  ncu_fcd_ctl_msff_ctl_macro__width_2 user_array_sel_reg  (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in[1:0]  ),
                 .dout     ( user_array_sel[1:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in[1:0]   =    user_array_sel[1:0];

// Defining User cmpsel.

  ncu_fcd_ctl_msff_ctl_macro__width_2 user_cmpsel_reg  (
                 .scan_in(user_cmpsel_reg_scanin),
                 .scan_out(user_cmpsel_reg_scanout),
                 .din      ( user_cmpsel_in[1:0]  ),
                 .dout     ( user_cmpsel[1:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cmpsel_in[1:0]      =    user_cmpsel[1:0];

// Defining user_bisi write and read registers

  ncu_fcd_ctl_msff_ctl_macro__width_1 user_bisi_wr_reg  (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  ncu_fcd_ctl_msff_ctl_macro__width_1 user_bisi_rd_reg  (
                 .scan_in(user_bisi_rd_reg_scanin),
                 .scan_out(user_bisi_rd_reg_scanout),
                 .din      ( user_bisi_rd_mode_in  ),
                 .dout     ( user_bisi_rd_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_rd_mode_in     =    user_bisi_rd_mode;

  assign mbist_user_bisi_wr_mode  =    user_mode & bisi & user_bisi_wr_mode & ~user_bisi_rd_mode;
//  assign mbist_user_bisi_rd_mode  =    user_mode & bisi & user_bisi_rd_mode & ~user_bisi_wr_mode;

  assign mbist_user_bisi_wr_rd_mode =   user_mode & bisi & 
                                      ((user_bisi_wr_mode & user_bisi_rd_mode) |
                                       (~user_bisi_wr_mode & ~user_bisi_rd_mode));

////////////////////////////////////////////////////////////////////////////////
// Piping start_transition 
////////////////////////////////////////////////////////////////////////////////

  ncu_fcd_ctl_msff_ctl_macro__width_1 start_transition_reg  (
               .scan_in(start_transition_reg_scanin),
               .scan_out(start_transition_reg_scanout),
               .din      ( start_transition ),
               .dout     ( start_transition_piped ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Staging run for 16 cycles for mbist engines supporting async FIFO's
////////////////////////////////////////////////////////////////////////////////

 ncu_fcd_ctl_msff_ctl_macro__width_1 run_reg (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run  ),
               .dout     ( mb0_run ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_4 counter_reg  (
               .scan_in(counter_reg_scanin),
               .scan_out(counter_reg_scanout),
               .din      ( counter_in[3:0]       ),
               .dout     ( counter_out[3:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cycle16 = (&counter_out[3:0] == 1'b1);
  assign counter_in[3:0] = reset_engine         ?   4'b0:    
                            run & ~cycle16      ?   counter_out[3:0] + 4'b0001:
                                                    counter_out[3:0];

  assign run_piped16 = config_out[0] & cycle16 & ~msb; // One cycle after start going low, mbist operation is done!           
// /////////////////////////////////////////////////////////////////////////////
// Adding Flop Boundaries for mbist
// /////////////////////////////////////////////////////////////////////////////

ncu_fcd_ctl_msff_ctl_macro__width_2 intbuf_rd_wr_en_reg (
               .scan_in(intbuf_rd_wr_en_reg_scanin),
               .scan_out(intbuf_rd_wr_en_reg_scanout),
               .din      ( {mbist_intbuf_read, mbist_intbuf_write}   ),
               .dout     ( {mb0_intbuf_rd_en, mb0_intbuf_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_fcd_ctl_msff_ctl_macro__width_2 mondo_rd_wr_en_reg (
               .scan_in(mondo_rd_wr_en_reg_scanin),
               .scan_out(mondo_rd_wr_en_reg_scanout),
               .din      ( {mbist_mondo_read, mbist_mondo_write}   ),
               .dout     ( {mb0_mondo_rd_en, mb0_mondo_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_fcd_ctl_msff_ctl_macro__width_2 iobuf_rd_wr_en_reg (
               .scan_in(iobuf_rd_wr_en_reg_scanin),
               .scan_out(iobuf_rd_wr_en_reg_scanout),
               .din      ( {mbist_iobuf_read, mbist_iobuf_write}   ),
               .dout     ( {mb0_iobuf_rd_en, mb0_iobuf_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_fcd_ctl_msff_ctl_macro__width_6 mb0_addr_reg (
               .scan_in(mb0_addr_reg_scanin),
               .scan_out(mb0_addr_reg_scanout),
               .din      ( mbist_address[5:0]   ),
               .dout     ( mb0_addr[5:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_fcd_ctl_msff_ctl_macro__width_8 mb0_wdata_reg (
               .scan_in(mb0_wdata_reg_scanin),
               .scan_out(mb0_wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]   ),
               .dout     ( mb0_wdata[7:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_fcd_ctl_msff_ctl_macro__width_2 done_fail_reg (
               .scan_in(done_fail_reg_scanin),
               .scan_out(done_fail_reg_scanout),
               .din      ( {mbist_done, fail}   ),
               .dout     ( {mb0_done, mb0_fail}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// Creating 48 bit result read_data to be compared

always@( intbuf_rd_en_piped2 or mondo_rd_en_piped2 or iobuf_rd_en_piped2 or cmpsel_piped3 or intbuf_dout or mondo_data0_dout or mondo_data1_dout or iobuf_dout ) begin
    case( {intbuf_rd_en_piped2,mondo_rd_en_piped2,iobuf_rd_en_piped2,cmpsel_piped3[1:0]} ) //synopsys parallel_case full_case
    5'b10000  : res_read_data[47:0] = intbuf_dout[47:0];
    5'b10001  : res_read_data[47:0] = intbuf_dout[95:48];
    5'b10010  : res_read_data[47:0] = intbuf_dout[143:96];
    5'b01000  : res_read_data[47:0] = mondo_data0_dout[47:0];
    5'b01001  : res_read_data[47:0] = {mondo_data1_dout[23:0],mondo_data0_dout[71:48]};
    5'b01010  : res_read_data[47:0] = mondo_data1_dout[71:24];
    5'b00100  : res_read_data[47:0] = iobuf_dout[47:0];
    5'b00101  : res_read_data[47:0] = iobuf_dout[95:48];
    5'b00110  : res_read_data[47:0] = iobuf_dout[143:96];
    5'b00111  : res_read_data[47:0] = {16'd0,iobuf_dout[175:144]};
    default   : res_read_data[47:0] = intbuf_dout[47:0];
    endcase
 end   

  ncu_fcd_ctl_msff_ctl_macro__width_48 res_read_data_reg  (
                 .scan_in(res_read_data_reg_scanin),
                 .scan_out(res_read_data_reg_scanout),
                 .din      ( res_read_data[47:0]       ),
                 .dout     ( res_read_data_piped[47:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// Remove Address mix disable before delivery
// /////////////////////////////////////////////////////////////////////////////

   ncu_fcd_ctl_msff_ctl_macro__width_22 control_reg  (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[21:0]           ),
                      .dout  ( control_out[21:0]          ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[21];
  assign   bisi_wr_rd     = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[20] : 1'b1;
  assign   array_sel[1:0]            =     user_mode           ?  user_array_sel[1:0] : control_out[19:18];
  assign   cmpsel[1:0]               =  mbist_user_cmpsel_hold ?  user_cmpsel         : control_out[17:16];
  assign   data_control[1:0]         =     control_out[15:14];
  assign   address_mix               =  (bisi | mbist_user_addr_mode) ?  1'b0:   control_out[13];
  assign   march_element[3:0]        =     control_out[12:9];
  assign   array_address[5:0]        =     upaddress_march     ?  control_out[8:3] : ~control_out[8:3];

  assign   read_write_control[2:0]   =     ~five_cycle_march   ?   {2'b11,  control_out[0]} :
                                                                   control_out[2:0];


  assign   control_in[2:0]           =     reset_engine        ?   3'b0:
                                          ~run_piped16         ?   control_out[2:0]:
     (five_cycle_march && (read_write_control[2:0] == 3'b100)) ?   3'b000:
      (one_cycle_march && (read_write_control[2:0] == 3'b110)) ?   3'b000:
                                                                   control_out[2:0]   +  3'b001;

  assign   increment_addr            =     (five_cycle_march && (read_write_control[2:0] == 3'b100)) || 
                                            (one_cycle_march && (read_write_control[2:0] == 3'b110)) ||
                                            (read_write_control[2:0] == 3'b111);

  assign   control_in[8:3]           = start_transition_piped || reset_engine     ?  start_addr[5:0]:
                              ~run_piped16 || ~increment_addr   ?  control_out[8:3]:
                                                                   next_array_address[5:0];

  assign   next_array_address[5:0]   =    next_upaddr_march     ?  start_addr[5:0]:
                                          next_downaddr_march   ?  ~stop_addr[5:0]:
                                                                   (overflow_addr[5:0]);   // array_addr + incr_addr

  assign   start_addr[5:0]           =    mbist_user_addr_mode  ?   user_start_addr[5:0] : 6'b000000;
  assign   stop_addr[5:0]            =    mbist_user_addr_mode  ?   user_stop_addr[5:0] :  
                                        intbuf_sel || iobuf_sel ?   6'b011111           : 6'b111111;
  assign   incr_addr[5:0]            =    mbist_user_addr_mode  ?   user_incr_addr[5:0] : 6'b000001;

  assign   overflow_addr[6:0]        =    {1'b0,control_out[8:3]} + {1'b0,incr_addr[5:0]};
  assign   overflow                  =    compare_addr[6:0] < overflow_addr[6:0];

  assign   compare_addr[6:0]         =    upaddress_march       ?  {1'b0, stop_addr[5:0]} :
                                                                   {1'b0, ~start_addr[5:0]}; 

  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   
   
  assign   add[5:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[5:0]:    array_address[5:0];

  assign   adj_address[5:0]          =     { array_address[5:3], ~array_address[2], array_address[1:0] };  // 16 Row addresses per Bitline 

  assign   mbist_address[5:0]        =     address_mix & mondo_sel ? {add[1:0],add[5:2]}:         //4 blks (banks) of 16 rows
                                           address_mix             ? {add[5],add[0],add[4],add[3],add[2],add[1]}: //2 blks of 16 rows
                                                                      add[5:0];

// Definition of the rest of the control register  
  assign   increment_march_elem      =     increment_addr && overflow;

  assign   control_in[21:9]          =     reset_engine        ?   13'b0:
                                          ~run_piped16         ?   control_out[21:9]:
                                           {msb, bisi_wr_rd, next_array_sel[1:0], next_cmpsel[1:0], next_data_control[1:0], next_address_mix, next_march_element[3:0]} + 
                                           {12'b0, increment_march_elem};                        


  assign   next_array_sel[1:0]       =     user_mode           ?   2'b11: 
           bisi & (array_sel[1:0] == 2'b10) & 
      (cmpsel[1:0] == 2'b11) & (array_address == stop_addr)    ?   2'b11:        
   (array_sel[1:0] == 2'b10) & (cmpsel[1:0] == 2'b11) & (data_control[1:0] == 2'b11) & 
   (next_address_mix == 1'b1) & (march_element[3:0] == 4'b1000) &
   (array_address == 6'b0) & (read_write_control[2:0] == 3'h4) ?   2'b11 :  control_out[19:18]; 

  assign   next_cmpsel[1:0]          =  (mbist_user_cmpsel_hold || ~bisi_wr_rd || mbist_user_bisi_wr_mode) ? 2'b11 : 
           bisi & (intbuf_sel || mondo_sel) & (cmpsel[1:0] == 2'b10) & 
           (array_address == stop_addr)                          ? 2'b11 :
   (intbuf_sel || mondo_sel) & (cmpsel[1:0] == 2'b10) & (data_control[1:0] == 2'b11) & 
   (next_address_mix == 1'b1) & ((march_element[3:0] == 4'b1000) | (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) ) &
   (array_address == start_addr) & ((read_write_control[2:0] == 3'h4) | 
                                    (mbist_ten_n_mode && (read_write_control[2:0] == 3'b110)) ) ? 2'b11 :  control_out[17:16]; 
 
  
  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow ?   4'b1111:  march_element[3:0];


  assign   array_write               =     ~run_piped16          ?    1'b0:
                                           five_cycle_march    ?  (read_write_control[2:0] == 3'h0) || 
                                                                  (read_write_control[2:0] == 3'h1) ||
                                                                  (read_write_control[2:0] == 3'h4): 
                        (~five_cycle_march & ~one_cycle_march) ?  read_write_control[0]:
     ( ((march_element[3:0] == 4'h0) & (~bisi || ~bisi_wr_rd || mbist_user_bisi_wr_mode)) || (march_element[3:0] == 4'h7));

  assign   array_read                =    ~array_write        &&  run_piped16;     //  &&  ~initialize;
//  assign   mbist_done                =     msb;

  assign   mbist_wdata[7:0]          =     true_data           ?   data_pattern[7:0]:      ~data_pattern[7:0];


  assign   five_cycle_march          =    (march_element[3:0] == 4'h6)    ||  (march_element[3:0] == 4'h8);
  assign   one_cycle_march           =    (march_element[3:0] == 4'h0)    ||  (march_element[3:0] == 4'h5) || 
                                          (march_element[3:0] == 4'h7);

  assign   upaddress_march           =    (march_element[3:0] == 4'h0)    ||  (march_element[3:0] == 4'h1) ||
                                          (march_element[3:0] == 4'h2)    ||  (march_element[3:0] == 4'h6) ||
                                          (march_element[3:0] == 4'h7);

//  assign   true_data                 =     read_write_control[1] ^ ~march_element[0];

  assign   true_data                 =     (five_cycle_march && (march_element[3:0] == 4'h6)) ? 
                                           ((read_write_control[2:0] == 3'h0) || (read_write_control[2:0] == 3'h2)):
                                           (five_cycle_march && (march_element[3:0] == 4'h8)) ? 
                                           ((read_write_control[2:0] == 3'h1) || 
                                            (read_write_control[2:0] == 3'h3) || (read_write_control[2:0] == 3'h4)):
                                            one_cycle_march   ?   (march_element[3:0] == 4'h7):
                                            ~(read_write_control[0] ^ march_element[0]);                                
                                                    
  
  assign   data_pattern[7:0]         =    (bisi & mbist_user_data_mode) ?   ~user_data_out[7:0]:
                                           mbist_user_data_mode         ?    user_data_out[7:0]:
                                           bisi                         ?    8'hFF:  // true_data function will invert to 8'h00
                                          (data_control[1:0] == 2'h0)   ?    8'hAA:
                                          (data_control[1:0] == 2'h1)   ?    8'h99:
                                          (data_control[1:0] == 2'h2)   ?    8'hCC:
                                                                             8'h00;

/////////////////////////////////////////////////////////////////////////
// Creating the mbist_done signal
/////////////////////////////////////////////////////////////////////////
// Delaying mbist_done 8 clock signals after msb going high, to provide
// a generic solution for done going high after the last fail has come back!

  ncu_fcd_ctl_msff_ctl_macro__width_3 done_counter_reg  (
               .scan_in(done_counter_reg_scanin),
               .scan_out(done_counter_reg_scanout),
               .din      ( done_counter_in[2:0]       ),
               .dout     ( done_counter_out[2:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// config_out[1] is AND'ed to force mbist_done low 2 cycles after mbist_start
// goes low.  

  assign mbist_done = (&done_counter_out[2:0] == 1'b1) & config_out[1];
  assign done_counter_in[2:0] = reset_engine       ?   3'b000:    
                 msb & ~mbist_done & config_out[1] ?   done_counter_out[2:0] + 3'b001:
                                                       done_counter_out[2:0];


// /////////////////////////////////////////////////////////////////////////////
// Array Selects and read and write_en
// /////////////////////////////////////////////////////////////////////////////
  
  assign   intbuf_sel                =    ~array_sel[1] & ~array_sel[0];
  assign   mondo_sel                 =    ~array_sel[1] &  array_sel[0];
  assign   iobuf_sel                 =     array_sel[1] & ~array_sel[0];
  
  assign   mbist_intbuf_read         =    intbuf_sel  &&  array_read;
  assign   mbist_intbuf_write        =    intbuf_sel  &&  array_write;

  assign   mbist_mondo_read          =    mondo_sel  &&  array_read;
  assign   mbist_mondo_write         =    mondo_sel  &&  array_write;

  assign   mbist_iobuf_read          =    iobuf_sel  &&  array_read;
  assign   mbist_iobuf_write         =    iobuf_sel  &&  array_write;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for wdata, enables, and cmpsel
// /////////////////////////////////////////////////////////////////////////////

// Pipeline for wdata

  ncu_fcd_ctl_msff_ctl_macro__width_8  data_pipe_reg1 (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( date_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_8  data_pipe_reg2 (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( date_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_8  data_pipe_reg3 (
               .scan_in(data_pipe_reg3_scanin),
               .scan_out(data_pipe_reg3_scanout),
               .din        ( date_pipe_reg3_in[7:0]  ),
               .dout       ( data_pipe_out3[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign date_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      mb0_wdata[7:0];
  assign date_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
  assign date_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];

  assign ncu_mb0_piped_wdata[7:0]  =  data_pipe_out3[7:0];

// Pipeline for Read Enable
  ncu_fcd_ctl_msff_ctl_macro__width_3 ren_pipe_reg1 (
               .scan_in(ren_pipe_reg1_scanin),
               .scan_out(ren_pipe_reg1_scanout),
               .din        ( ren_pipe_reg1_in[2:0]  ),
               .dout       ( rd_en_piped[2:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_3 ren_pipe_reg2 (
               .scan_in(ren_pipe_reg2_scanin),
               .scan_out(ren_pipe_reg2_scanout),
               .din        ( ren_pipe_reg2_in[2:0]  ),
               .dout       ( rd_en_piped2[2:0]    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_3 ren_pipe_reg3 (
               .scan_in(ren_pipe_reg3_scanin),
               .scan_out(ren_pipe_reg3_scanout),
               .din        ( ren_pipe_reg3_in[2:0]  ),
               .dout       ( rd_en_piped3[2:0]    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ren_pipe_reg1_in[2:0]  =  reset_engine   ?   3'b0:  {mb0_iobuf_rd_en, mb0_mondo_rd_en, mb0_intbuf_rd_en} ; 
  assign ren_pipe_reg2_in[2:0]  =  reset_engine   ?   3'b0:  rd_en_piped[2:0];
  assign ren_pipe_reg3_in[2:0]  =  reset_engine   ?   3'b0:  rd_en_piped2[2:0];

  assign intbuf_rd_en_piped2    =  rd_en_piped2[0];
  assign mondo_rd_en_piped2     =  rd_en_piped2[1];
  assign iobuf_rd_en_piped2     =  rd_en_piped2[2];

  assign intbuf_rd_en_piped3    =  rd_en_piped3[0];
  assign mondo_rd_en_piped3     =  rd_en_piped3[1];
  assign iobuf_rd_en_piped3     =  rd_en_piped3[2];

// Pipelining cmpsel

  ncu_fcd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg1 (
               .scan_in(cmpsel_pipe_reg1_scanin),
               .scan_out(cmpsel_pipe_reg1_scanout),
               .din        ( cmpsel_pipe_reg1_in[1:0]  ),
               .dout       ( cmpsel_pipe_out1[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg2 (
               .scan_in(cmpsel_pipe_reg2_scanin),
               .scan_out(cmpsel_pipe_reg2_scanout),
               .din        ( cmpsel_pipe_reg2_in[1:0]  ),
               .dout       ( cmpsel_pipe_out2[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg3 (
               .scan_in(cmpsel_pipe_reg3_scanin),
               .scan_out(cmpsel_pipe_reg3_scanout),
               .din        ( cmpsel_pipe_reg3_in[1:0]  ),
               .dout       ( cmpsel_pipe_out3[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_fcd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg4 (
               .scan_in(cmpsel_pipe_reg4_scanin),
               .scan_out(cmpsel_pipe_reg4_scanout),
               .din        ( cmpsel_pipe_reg4_in[1:0]  ),
               .dout       ( cmpsel_pipe_out4[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cmpsel_pipe_reg1_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel[1:0];
  assign cmpsel_pipe_reg2_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out1[1:0];
  assign cmpsel_pipe_reg3_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out2[1:0];
  assign cmpsel_pipe_reg4_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out3[1:0];
  assign cmpsel_piped3[1:0]         =  cmpsel_pipe_out3[1:0];
  assign cmpsel_piped4[1:0]         =  cmpsel_pipe_out4[1:0];


// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  ncu_fcd_ctl_msff_ctl_macro__width_3 fail_reg  (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[2:0]   ),
                   .dout     ( fail_reg_out[2:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[2:0]      =    reset_engine      ?    3'b0: 
                           {qual_iobuf_fail,qual_mondo_fail,qual_intbuf_fail}  |  fail_reg_out[2:0];


  assign    qual_intbuf_fail     =  fail_detect && intbuf_rd_en_piped3;
  assign    qual_mondo_fail      =  fail_detect && mondo_rd_en_piped3;
  assign    qual_iobuf_fail      =  fail_detect && iobuf_rd_en_piped3;

  assign    fail               =  mbist_done ?  |fail_reg_out[2:0]:
                                  qual_intbuf_fail | qual_mondo_fail | qual_iobuf_fail;


  assign    fail_detect        = iobuf_rd_en_piped3 & (cmpsel_piped4[1:0] == 2'b11) ?
                          ({4{ncu_mb0_piped_wdata[7:0]}}  !=  res_read_data_piped[31:0]):
                          ({6{ncu_mb0_piped_wdata[7:0]}}  !=  res_read_data_piped[47:0]);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// /////////////////////////////////////////////////////////////////////////////
// fixscan start:
assign config_reg_scanin         = scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_array_sel_reg_scanin = user_incr_addr_reg_scanout;
assign user_cmpsel_reg_scanin    = user_array_sel_reg_scanout;
assign user_bisi_wr_reg_scanin   = user_cmpsel_reg_scanout  ;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run_reg_scanin            = start_transition_reg_scanout;
assign counter_reg_scanin        = run_reg_scanout          ;
assign intbuf_rd_wr_en_reg_scanin = counter_reg_scanout      ;
assign mondo_rd_wr_en_reg_scanin = intbuf_rd_wr_en_reg_scanout;
assign iobuf_rd_wr_en_reg_scanin = mondo_rd_wr_en_reg_scanout;
assign mb0_addr_reg_scanin       = iobuf_rd_wr_en_reg_scanout;
assign mb0_wdata_reg_scanin      = mb0_addr_reg_scanout     ;
assign done_fail_reg_scanin      = mb0_wdata_reg_scanout    ;
assign res_read_data_reg_scanin  = done_fail_reg_scanout    ;
assign control_reg_scanin        = res_read_data_reg_scanout;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign data_pipe_reg1_scanin     = done_counter_reg_scanout ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign data_pipe_reg3_scanin     = data_pipe_reg2_scanout   ;
assign ren_pipe_reg1_scanin      = data_pipe_reg3_scanout   ;
assign ren_pipe_reg2_scanin      = ren_pipe_reg1_scanout    ;
assign ren_pipe_reg3_scanin      = ren_pipe_reg2_scanout    ;
assign cmpsel_pipe_reg1_scanin   = ren_pipe_reg3_scanout    ;
assign cmpsel_pipe_reg2_scanin   = cmpsel_pipe_reg1_scanout ;
assign cmpsel_pipe_reg3_scanin   = cmpsel_pipe_reg2_scanout ;
assign cmpsel_pipe_reg4_scanin   = cmpsel_pipe_reg3_scanout ;
assign fail_reg_scanin           = cmpsel_pipe_reg4_scanout ;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule
// /////////////////////////////////////////////////////////////////////////////






// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_48 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [47:0] fdin;
wire [46:0] so;

  input [47:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [47:0] dout;
  output scan_out;
assign fdin[47:0] = din[47:0];






dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_fcd_ctl_msff_ctl_macro__width_22 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = din[21:0];






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule








