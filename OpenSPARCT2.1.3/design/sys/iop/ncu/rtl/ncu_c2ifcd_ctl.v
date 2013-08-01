// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2ifcd_ctl.v
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
module ncu_c2ifcd_ctl (
  cmp_io_sync_en, 
  cpubuf_head_s, 
  intbuf_hit_hwm, 
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
  tcu_scan_en, 
  scan_in, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_din_s, 
  tap_mondo_wr_s, 
  tcu_clk_stop, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  mb0_mondo_rd_en, 
  mb0_mondo_wr_en, 
  mb0_intbuf_wr_en, 
  mb0_waddr, 
  mb0_raddr, 
  mb0_wdata, 
  mb0_run, 
  mb1_run, 
  mb1_wdata, 
  mb1_cpubuf_wr_en, 
  mb1_addr, 
  cpubuf_din, 
  cpubuf_tail_f, 
  cpubuf_tail_ptr, 
  cpubuf_wr, 
  intbuf_wr, 
  intbuf_din, 
  mondo_busy_vec_f, 
  mondo_data0_din, 
  mondo_data0_wr, 
  mondo_data1_din, 
  mondo_data1_wr, 
  mondo_data_addr_p0, 
  mondo_data_addr_p1, 
  mondo_rd_en, 
  ncu_pcx_stall_pq, 
  scan_out, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_acc_seq_d2_f, 
  tap_mondo_dout_d2_f, 
  intbuf_wr2i2c, 
  mondotbl_pe_f, 
  mondotbl_pei) ;
wire io_mondo_data_wr;
wire mondo_data_bypass_d2;
wire mondo_addr_creg_mdata0_dec_d2;
wire mondo_addr_creg_mdata1_dec_d2;
wire mondo_addr_creg_mbusy_dec_d2;
wire tap_mondo_rd_d2;
wire cpu_mondo_addr_invld_d2;
wire cpu_mondo_rd_d2;
wire [5:0] mondo_busy_addr_p0;
wire [5:0] mondo_busy_addr_p1;
wire mondo_busy_wr_p1;
wire [5:0] mondo_busy_addr_p2;
wire mondo_busy_wr_p2;
wire ncu_c2ifc_ctl_scanin;
wire ncu_c2ifc_ctl_scanout;
wire pcx_ncu_vld;
wire [4:0] pcx_ncu_req;
wire [39:0] pcx_ncu_addr;
wire [5:0] pcx_ncu_cputhr;
wire ncu_c2ifd_ctl_scanin;
wire ncu_c2ifd_ctl_scanout;


input			cmp_io_sync_en;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input [5:0]		cpubuf_head_s;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			intbuf_hit_hwm;	// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			io_cmp_sync_en;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input [63:0]		io_mondo_data0_din_s;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input [63:0]		io_mondo_data1_din_s;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input [5:0]		io_mondo_data_wr_addr_s;// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			io_mondo_data_wr_s;	// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			l2clk;			// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input [71:0]		mondo_data0_dout;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input [71:0]		mondo_data1_dout;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input [129:0]		pcx_ncu_data_px2;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input			pcx_ncu_data_rdy_px1;	// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			tcu_scan_en;
input			scan_in;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input [21:0]		tap_mondo_acc_addr_s;	// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			tap_mondo_acc_seq_s;	// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input [63:0]		tap_mondo_din_s;	// To ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
input			tap_mondo_wr_s;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
input			tcu_clk_stop;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input			tcu_pce_ov;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input			tcu_aclk;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
input			tcu_bclk;		// To ncu_c2ifc_ctl of ncu_c2ifc_ctl.v, ...
//input			mb0_mondo_sel;
input			mb0_mondo_rd_en;
input			mb0_mondo_wr_en;
//input			mb0_cpubuf_sel;
//input			mb0_intbuf_sel;
input			mb0_intbuf_wr_en;
input [5:0]		mb0_waddr;
input [5:0]		mb0_raddr;
input [7:0]		mb0_wdata;
input			mb0_run;

input			mb1_run;
input[7:0]		mb1_wdata;
input			mb1_cpubuf_wr_en;
input[5:0]		mb1_addr;

output [143:0]		cpubuf_din;		// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output [5:0]		cpubuf_tail_f;		// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [4:0]		cpubuf_tail_ptr;	// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output			cpubuf_wr;		// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output			intbuf_wr;		// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [143:0]		intbuf_din;		// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output [63:0]		mondo_busy_vec_f;	// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output [71:0]		mondo_data0_din;	// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output			mondo_data0_wr;		// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [71:0]		mondo_data1_din;	// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output			mondo_data1_wr;		// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [5:0]		mondo_data_addr_p0;	// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [5:0]		mondo_data_addr_p1;	// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output 			mondo_rd_en;
output			ncu_pcx_stall_pq;	// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output			scan_out;		// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output			tap_mondo_acc_addr_invld_d2_f;// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output			tap_mondo_acc_seq_d2_f;	// From ncu_c2ifc_ctl of ncu_c2ifc_ctl.v
output [63:0]		tap_mondo_dout_d2_f;	// From ncu_c2ifd_ctl of ncu_c2ifd_ctl.v
output			intbuf_wr2i2c;

// err ecc //
output			mondotbl_pe_f;
input			mondotbl_pei;


//assign mondo_rd_en = mb0_run ? mb0_mondo_rd_en : 1'b1;
assign mondo_rd_en = mb0_run ? mb0_mondo_rd_en : ~((mondo_data_addr_p0[5:0]==mondo_data_addr_p1[5:0])&
                                                                       (mondo_data0_wr|mondo_data1_wr));

/*****************************************************************
 * cpu-to-io fast control
 *****************************************************************/
///* ncu_c2ifc_ctl auto_template ( 
//				.scan_out() ); */
ncu_c2ifc_ctl ncu_c2ifc_ctl (/*AUTOINST*/
			     // Outputs
			     .ncu_pcx_stall_pq(ncu_pcx_stall_pq),
			     .io_mondo_data_wr(io_mondo_data_wr),
			     .mondo_data_bypass_d2(mondo_data_bypass_d2),
			     .mondo_addr_creg_mdata0_dec_d2(mondo_addr_creg_mdata0_dec_d2),
			     .mondo_addr_creg_mdata1_dec_d2(mondo_addr_creg_mdata1_dec_d2),
			     .mondo_addr_creg_mbusy_dec_d2(mondo_addr_creg_mbusy_dec_d2),
			     .tap_mondo_rd_d2(tap_mondo_rd_d2),
			     .cpu_mondo_addr_invld_d2(cpu_mondo_addr_invld_d2),
			     .cpubuf_tail_f(cpubuf_tail_f[5:0]),
			     .intbuf_wr	(intbuf_wr),
			     .intbuf_wr2i2c(intbuf_wr2i2c),
			     .cpu_mondo_rd_d2(cpu_mondo_rd_d2),
			     .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			     .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			     .mondo_data_addr_p0(mondo_data_addr_p0[5:0]),
			     .mondo_busy_addr_p0(mondo_busy_addr_p0[5:0]),
			     .mondo_data_addr_p1(mondo_data_addr_p1[5:0]),
			     .mondo_busy_addr_p1(mondo_busy_addr_p1[5:0]),
			     .mondo_busy_wr_p1(mondo_busy_wr_p1),
			     .mondo_busy_addr_p2(mondo_busy_addr_p2[5:0]),
			     .mondo_busy_wr_p2(mondo_busy_wr_p2),
			     .mondo_data0_wr(mondo_data0_wr),
			     .mondo_data1_wr(mondo_data1_wr),
			     .cpubuf_wr	(cpubuf_wr),
			     .cpubuf_tail_ptr(cpubuf_tail_ptr[4:0]),
			     // Inputs
			     .scan_in(ncu_c2ifc_ctl_scanin),
			     .scan_out(ncu_c2ifc_ctl_scanout),
			     .l2clk	(l2clk),
			     .cmp_io_sync_en(cmp_io_sync_en),
			     .io_cmp_sync_en(io_cmp_sync_en),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .pcx_ncu_data_rdy_px1(pcx_ncu_data_rdy_px1),
			     .pcx_ncu_vld(pcx_ncu_vld),
			     .pcx_ncu_req(pcx_ncu_req[4:0]),
			     .pcx_ncu_addr(pcx_ncu_addr[39:0]),
			     .pcx_ncu_cputhr(pcx_ncu_cputhr[5:0]),
			     .cpubuf_head_s(cpubuf_head_s[5:0]),
			     .intbuf_hit_hwm(intbuf_hit_hwm),
			     .io_mondo_data_wr_s(io_mondo_data_wr_s),
			     .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			     .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			     .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			     .tap_mondo_wr_s(tap_mondo_wr_s),
			     .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
			     .mb1_run(mb1_run),
			     .mb1_waddr(mb1_addr[5:0]),
			     .mb0_run(mb0_run),
			     .mb0_intbuf_wr_en(mb0_intbuf_wr_en),
			     .mb0_waddr	(mb0_waddr[5:0]),
			     .mb0_raddr	(mb0_raddr[5:0]),
  .mb0_mondo_wr_en(mb0_mondo_wr_en));


/*****************************************************************
 * cpu-to-io fast datapath
 *****************************************************************/
///* ncu_c2ifd_ctl auto_template ( 
// 				.scan_out( ) ); */
ncu_c2ifd_ctl ncu_c2ifd_ctl (/*AUTOINST*/
			     // Outputs
			     .pcx_ncu_vld(pcx_ncu_vld),
			     .pcx_ncu_req(pcx_ncu_req[4:0]),
			     .pcx_ncu_addr(pcx_ncu_addr[39:0]),
			     .pcx_ncu_cputhr(pcx_ncu_cputhr[5:0]),
			     .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			     .mondotbl_pe_f(mondotbl_pe_f),
			     .intbuf_din(intbuf_din[143:0]),
			     .mondo_data0_din(mondo_data0_din[71:0]),
			     .mondo_data1_din(mondo_data1_din[71:0]),
			     .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			     .cpubuf_din(cpubuf_din[143:0]),
			     // Inputs
			     .scan_in(ncu_c2ifd_ctl_scanin),
			     .scan_out(ncu_c2ifd_ctl_scanout),
			     .l2clk	(l2clk),
			     .cmp_io_sync_en(cmp_io_sync_en),
			     .io_cmp_sync_en(io_cmp_sync_en),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .pcx_ncu_data_px2(pcx_ncu_data_px2[129:0]),
			     .io_mondo_data_wr(io_mondo_data_wr),
			     .mondo_data_bypass_d2(mondo_data_bypass_d2),
			     .mondo_addr_creg_mdata0_dec_d2(mondo_addr_creg_mdata0_dec_d2),
			     .mondo_addr_creg_mdata1_dec_d2(mondo_addr_creg_mdata1_dec_d2),
			     .mondo_addr_creg_mbusy_dec_d2(mondo_addr_creg_mbusy_dec_d2),
			     .tap_mondo_rd_d2(tap_mondo_rd_d2),
			     .cpu_mondo_rd_d2(cpu_mondo_rd_d2),
			     .cpu_mondo_addr_invld_d2(cpu_mondo_addr_invld_d2),
			     .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			     .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			     .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			     .mb0_mondo_wr_en(mb0_mondo_wr_en),
			     //.mb0_intbuf_wr_en(mb0_intbuf_wr_en),
			     //.mb0_cpubuf_sel(mb0_cpubuf_sel),
			     .mb1_run(mb1_run),
			     .mb1_wdata(mb1_wdata[7:0]),
			     .mb1_addr(mb1_addr[5:0]),
			     .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
			     .mb0_run(mb0_run),
			     .mb0_wdata	(mb0_wdata[7:0]),
			     .mondotbl_pei(mondotbl_pei),
			     .mondo_data0_dout(mondo_data0_dout[71:0]),
			     .mondo_data1_dout(mondo_data1_dout[71:0]),
			     .mondo_busy_addr_p0(mondo_busy_addr_p0[5:0]),
			     .mondo_busy_addr_p1(mondo_busy_addr_p1[5:0]),
			     .mondo_busy_wr_p1(mondo_busy_wr_p1),
			     .mondo_busy_addr_p2(mondo_busy_addr_p2[5:0]),
			     .mondo_busy_wr_p2(mondo_busy_wr_p2));



// fixscan start:
assign ncu_c2ifc_ctl_scanin      = scan_in                  ;
assign ncu_c2ifd_ctl_scanin      = ncu_c2ifc_ctl_scanout    ;
assign scan_out                  = ncu_c2ifd_ctl_scanout    ;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "../common")
// End:
//



// any PARAMS parms go into naming of macro

module ncu_c2ifcd_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__en_1__width_22 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_6 (
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

module ncu_c2ifcd_ctl_l1clkhdr_ctl_macro (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_129 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_72 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_3 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_8 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_64 (
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

module ncu_c2ifcd_ctl_msff_ctl_macro__width_122 (
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








