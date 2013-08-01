// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2cbuf4_ni_ctl.v
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
module ncu_i2cbuf4_ni_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  ucb_iob_vld, 
  ucb_iob_data, 
  iob_ucb_stall, 
  req_ack_obj, 
  req_ack_vld, 
  rd_req_ack_dbl_buf) ;
wire stall_d1_n;
wire stall_d1;
wire vld_d1_ff_scanin;
wire vld_d1_ff_scanout;
wire vld_d1;
wire l1clk;
wire rdy1;
wire data_d1_ff_scanin;
wire data_d1_ff_scanout;
wire [3:0] data_d1;
wire stall_ff_scanin;
wire stall_ff_scanout;
wire iob_ucb_stall_a1;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire rdy0_ff_scanin;
wire rdy0_ff_scanout;
wire rdy0;
wire rdy1_ff_scanin;
wire rdy1_ff_scanout;
wire skid_buf0_en;
wire vld_buf0_ff_scanin;
wire vld_buf0_ff_scanout;
wire vld_buf0;
wire data_buf0_ff_scanin;
wire data_buf0_ff_scanout;
wire [3:0] data_buf0;
wire skid_buf1_en_ff_scanin;
wire skid_buf1_en_ff_scanout;
wire skid_buf1_en;
wire vld_buf1_ff_scanin;
wire vld_buf1_ff_scanout;
wire vld_buf1;
wire data_buf1_ff_scanin;
wire data_buf1_ff_scanout;
wire [3:0] data_buf1;
wire skid_buf0_sel;
wire skid_buf1_sel_ff_scanin;
wire skid_buf1_sel_ff_scanout;
wire skid_buf1_sel;
wire vld_mux;
wire [3:0] data_mux;
wire [31:0] indata_vec_next;
wire [31:0] indata_vec;
wire iob_ucb_stall_a1_;
wire indata_vec_ff_scanin;
wire indata_vec_ff_scanout;
wire [127:0] indata_buf_next;
wire [127:0] indata_buf;
wire indata_buf_ff_scanin;
wire indata_buf_ff_scanout;
wire indata_vec0_d1_ff_scanin;
wire indata_vec0_d1_ff_scanout;
wire indata_vec0_d1;
wire indata_buf_vld;
wire req_ack_pending;
wire req_ack_dbl_buf_full;
wire wr_req_ack_dbl_buf;
wire wr_buf0;
wire buf1_vld;
wire buf0_vld;
wire buf1_older;
wire wr_buf1;
wire rd_buf0;
wire rd_buf1;
wire rd_buf;
wire buf1_older_n;
wire buf1_older_ff_scanin;
wire buf1_older_ff_scanout;
wire en_vld0;
wire en_vld1;
wire buf0_vld_ff_scanin;
wire buf0_vld_ff_scanout;
wire buf1_vld_ff_scanin;
wire buf1_vld_ff_scanout;
wire buf0_obj_ff_scanin;
wire buf0_obj_ff_scanout;
wire [127:0] buf0_obj;
wire buf1_obj_ff_scanin;
wire buf1_obj_ff_scanout;
wire [127:0] buf1_obj;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;




////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;



   // UCB interface
input		ucb_iob_vld;
input [3:0]	ucb_iob_data;
output		iob_ucb_stall;


   // i2c slow control/datapath interface
output [127:0]	req_ack_obj;
output		req_ack_vld;
input		rd_req_ack_dbl_buf;


   // Internal signals


/************************************************************
 * Assemble inbound packet
 ************************************************************/
// ucb_bus_in #(UCB_BUS_WIDTH) ucb_bus_in 
//				(
//				.clk(iol2clk),
//				.vld(ucb_iob_vld),
//				.data(ucb_iob_data[UCB_BUS_WIDTH-1:0]),
//				.stall(iob_ucb_stall),
//				.indata_buf_vld(indata_buf_vld),
//				.indata_buf(indata_buf[127:0]),
//				.stall_a1(iob_ucb_stall_a1)
//				);
//=============================================================
//=============================================================
//=============================================================
/************************************************************
 * UCB bus interface flops
 * This is to make signals going between IOB and UCB flop-to-flop
 * to improve timing.
 ************************************************************/
assign	stall_d1_n = ~stall_d1;
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 vld_d1_ff  
				(
				.scan_in(vld_d1_ff_scanin),
				.scan_out(vld_d1_ff_scanout),
				.dout		(vld_d1),
				.l1clk		(l1clk),
				.en		(stall_d1_n&rdy1),
				.din		(ucb_iob_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_4 data_d1_ff  
				(
				.scan_in(data_d1_ff_scanin),
				.scan_out(data_d1_ff_scanout),
				.dout		(data_d1[3:0]),
				.l1clk		(l1clk),
				.en		(stall_d1_n),
				.din		(ucb_iob_data[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 stall_ff 
				(
				.scan_in(stall_ff_scanin),
				.scan_out(stall_ff_scanout),
				.dout		(iob_ucb_stall),
				.l1clk		(l1clk),
				.din		(iob_ucb_stall_a1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 stall_d1_ff 
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.l1clk		(l1clk),
				.din		(iob_ucb_stall),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 rdy0_ff 
				(
				.scan_in(rdy0_ff_scanin),
				.scan_out(rdy0_ff_scanout),
				.dout		(rdy0),
				.l1clk		(l1clk),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 rdy1_ff 
				(
				.scan_in(rdy1_ff_scanin),
				.scan_out(rdy1_ff_scanout),
				.dout		(rdy1),
				.l1clk		(l1clk),
				.din		(rdy0),
  .siclk(siclk),
  .soclk(soclk)
				);



/************************************************************
 * Skid buffer
 * We need a two deep skid buffer to handle stalling.
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

// Buffer 0
assign  skid_buf0_en = iob_ucb_stall_a1 & ~iob_ucb_stall;

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 vld_buf0_ff  
				(
				.scan_in(vld_buf0_ff_scanin),
				.scan_out(vld_buf0_ff_scanout),
				.dout		(vld_buf0),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_4 data_buf0_ff  
				(
				.scan_in(data_buf0_ff_scanin),
				.scan_out(data_buf0_ff_scanout),
				.dout		(data_buf0[3:0]),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(data_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer 1
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 skid_buf1_en_ff 
				(
				.scan_in(skid_buf1_en_ff_scanin),
				.scan_out(skid_buf1_en_ff_scanout),
				.dout		(skid_buf1_en),
				.l1clk		(l1clk),
				.din		(skid_buf0_en),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 vld_buf1_ff  
				(
				.scan_in(vld_buf1_ff_scanin),
				.scan_out(vld_buf1_ff_scanout),
				.dout		(vld_buf1),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_4 data_buf1_ff  
				(
				.scan_in(data_buf1_ff_scanin),
				.scan_out(data_buf1_ff_scanout),
				.dout		(data_buf1[3:0]),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(data_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

/************************************************************
 * Mux between skid buffer and interface flop
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

assign  skid_buf0_sel = ~iob_ucb_stall_a1 & iob_ucb_stall;

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 skid_buf1_sel_ff 
				(
				.scan_in(skid_buf1_sel_ff_scanin),
				.scan_out(skid_buf1_sel_ff_scanout),
				.dout		(skid_buf1_sel),
				.l1clk		(l1clk),
				.din		(skid_buf0_sel),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  vld_mux = skid_buf0_sel ? vld_buf0 : 
	   	  skid_buf1_sel ? vld_buf1 : vld_d1;

assign  data_mux[3:0] =  skid_buf0_sel ? data_buf0[3:0] : 
	   		 skid_buf1_sel ? data_buf1[3:0] : data_d1[3:0];

/************************************************************
 * Assemble inbound data
 ************************************************************/
// valid vector
assign  indata_vec_next[31:0] = {vld_mux, indata_vec[31:1]};
assign	iob_ucb_stall_a1_= ~iob_ucb_stall_a1;
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_32 indata_vec_ff  
				(
				.scan_in(indata_vec_ff_scanin),
				.scan_out(indata_vec_ff_scanout),
				.dout		(indata_vec[31:0]),
				.l1clk		(l1clk),
				.en		(iob_ucb_stall_a1_),
				.din		(indata_vec_next[31:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// data buffer
assign  indata_buf_next[127:0] = {data_mux[3:0], indata_buf[127:4]};
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_128 indata_buf_ff  
				(
				.scan_in(indata_buf_ff_scanin),
				.scan_out(indata_buf_ff_scanout),
				.dout		(indata_buf[127:0]),
				.l1clk		(l1clk),
				.en		(iob_ucb_stall_a1_),
				.din		(indata_buf_next[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// detect a new packet	  
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 indata_vec0_d1_ff  
				(
				.scan_in(indata_vec0_d1_ff_scanin),
				.scan_out(indata_vec0_d1_ff_scanout),
				.dout		(indata_vec0_d1),
				.l1clk		(l1clk),
				.en		(iob_ucb_stall_a1_),
				.din		(indata_vec[0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;
//=============================================================
//=============================================================
//=============================================================




/************************************************************
 * Decode inbound packet type
 ************************************************************/
// non-interrupt packet
assign	req_ack_pending = indata_buf_vld;

assign	iob_ucb_stall_a1 = (req_ack_pending & req_ack_dbl_buf_full); 

/************************************************************
 * Double buffer to store non-interrupt packets
 ************************************************************/
assign	wr_req_ack_dbl_buf = req_ack_pending & ~req_ack_dbl_buf_full;

// dbl_buf #(128) req_ack_dbl_buf (
//			 .clk(iol2clk),
//			 .wr(wr_req_ack_dbl_buf),
//			 .din(indata_buf[127:0]),
//			 .rd(rd_req_ack_dbl_buf),
//			 .dout(req_ack_obj[127:0]),
//			 .vld(req_ack_vld),
//			 .full(req_ack_dbl_buf_full));
//=============================================================
//=============================================================
//=============================================================

// if both entries are empty, write to entry pointed to by the older pointer
assign	wr_buf0 = wr_req_ack_dbl_buf & (buf1_vld | (~buf0_vld & ~buf1_older));
assign	wr_buf1 = wr_req_ack_dbl_buf & (buf0_vld | (~buf1_vld & buf1_older));

// read from the older entry
assign	rd_buf0 = rd_req_ack_dbl_buf & ~buf1_older;
assign	rd_buf1 = rd_req_ack_dbl_buf &  buf1_older;

// flip older pointer when an entry is read
assign	rd_buf = rd_req_ack_dbl_buf & (buf0_vld | buf1_vld);
assign	buf1_older_n = ~buf1_older ;
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 buf1_older_ff  
				(
				.scan_in(buf1_older_ff_scanin),
				.scan_out(buf1_older_ff_scanout),
				.dout		(buf1_older),
				.l1clk		(l1clk),
				.en		(rd_buf),
				.din		(buf1_older_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	en_vld0 = wr_buf0 | rd_buf0;
assign	en_vld1 = wr_buf1 | rd_buf1;

// the actual buffers
ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 buf0_vld_ff  
				(
				.scan_in(buf0_vld_ff_scanin),
				.scan_out(buf0_vld_ff_scanout),
				.dout		(buf0_vld),
				.l1clk		(l1clk),
				.en		(en_vld0),
				.din		(wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 buf1_vld_ff  
				(
				.scan_in(buf1_vld_ff_scanin),
				.scan_out(buf1_vld_ff_scanout),
				.dout		(buf1_vld),
				.l1clk		(l1clk),
				.en		(en_vld1),
				.din		(wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_128 buf0_obj_ff  
				(
				.scan_in(buf0_obj_ff_scanin),
				.scan_out(buf0_obj_ff_scanout),
				.dout		(buf0_obj[127:0]),
				.l1clk		(l1clk),
				.en		(wr_buf0),
				.din		(indata_buf[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_128 buf1_obj_ff  
				(
				.scan_in(buf1_obj_ff_scanin),
				.scan_out(buf1_obj_ff_scanout),
				.dout		(buf1_obj[127:0]),
				.l1clk		(l1clk),
				.en		(wr_buf1),
				.din		(indata_buf[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	req_ack_obj[127:0] = (buf1_older) ? buf1_obj[127:0] : buf0_obj[127:0] ;

assign	req_ack_vld = buf0_vld | buf1_vld;
assign	req_ack_dbl_buf_full = buf0_vld & buf1_vld;
//=============================================================
//=============================================================
//=============================================================

	  


/**** adding clock header ****/
ncu_i2cbuf4_ni_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign vld_d1_ff_scanin          = scan_in                  ;
assign data_d1_ff_scanin         = vld_d1_ff_scanout        ;
assign stall_ff_scanin           = data_d1_ff_scanout       ;
assign stall_d1_ff_scanin        = stall_ff_scanout         ;
assign rdy0_ff_scanin            = stall_d1_ff_scanout      ;
assign rdy1_ff_scanin            = rdy0_ff_scanout          ;
assign vld_buf0_ff_scanin        = rdy1_ff_scanout          ;
assign data_buf0_ff_scanin       = vld_buf0_ff_scanout      ;
assign skid_buf1_en_ff_scanin    = data_buf0_ff_scanout     ;
assign vld_buf1_ff_scanin        = skid_buf1_en_ff_scanout  ;
assign data_buf1_ff_scanin       = vld_buf1_ff_scanout      ;
assign skid_buf1_sel_ff_scanin   = data_buf1_ff_scanout     ;
assign indata_vec_ff_scanin      = skid_buf1_sel_ff_scanout ;
assign indata_buf_ff_scanin      = indata_vec_ff_scanout    ;
assign indata_vec0_d1_ff_scanin  = indata_buf_ff_scanout    ;
assign buf1_older_ff_scanin      = indata_vec0_d1_ff_scanout;
assign buf0_vld_ff_scanin        = buf1_older_ff_scanout    ;
assign buf1_vld_ff_scanin        = buf0_vld_ff_scanout      ;
assign buf0_obj_ff_scanin        = buf1_vld_ff_scanout      ;
assign buf1_obj_ff_scanin        = buf0_obj_ff_scanout      ;
assign scan_out                  = buf1_obj_ff_scanout      ;
// fixscan end:
endmodule // i2c_buf








// any PARAMS parms go into naming of macro

module ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module ncu_i2cbuf4_ni_ctl_msff_ctl_macro__width_1 (
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

module ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cbuf4_ni_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cbuf4_ni_ctl_l1clkhdr_ctl_macro (
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








