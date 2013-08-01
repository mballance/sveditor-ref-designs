// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2ibuf32_ctl.v
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
module ncu_c2ibuf32_ctl (
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  c2i_packet_vld, 
  ucb_sel, 
  ucb_buf_acpt, 
  c2i_packet, 
  iob_ucb_vld, 
  iob_ucb_data, 
  ucb_iob_stall) ;
wire dbl_buf_wr;
wire dbl_buf_full;
wire dbl_buf_rd;
wire dbl_buf_vld;
wire outdata_buf_busy;
wire outdata_buf_wr;
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
wire l1clk;
wire en_vld0;
wire en_vld1;
wire buf0_vld_ff_scanin;
wire buf0_vld_ff_scanout;
wire buf1_vld_ff_scanin;
wire buf1_vld_ff_scanout;
wire buf0_obj_p_ff_scanin;
wire buf0_obj_p_ff_scanout;
wire [63:0] buf0_obj_p;
wire buf0_obj_h_ff_scanin;
wire buf0_obj_h_ff_scanout;
wire [54:0] buf0_obj_h;
wire buf1_obj_p_ff_scanin;
wire buf1_obj_p_ff_scanout;
wire [63:0] buf1_obj_p;
wire buf1_obj_h_ff_scanin;
wire buf1_obj_h_ff_scanout;
wire [54:0] buf1_obj_h;
wire [127:0] outdata_buf_in;
wire [3:0] outdata_vec;
wire [127:0] outdata_buf;
wire rdy0_ff_scanin;
wire rdy0_ff_scanout;
wire rdy0;
wire rdy1_ff_scanin;
wire rdy1_ff_scanout;
wire rdy1;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire stall_d1;
wire load_outdata;
wire shift_outdata;
wire [3:0] outdata_vec_next;
wire outdata_vec_ff_scanin;
wire outdata_vec_ff_scanout;
wire [127:0] outdata_buf_next;
wire outdata_buf_ff_scanin;
wire outdata_buf_ff_scanout;
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

input		tcu_scan_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_dbr_gateoff;


// slow control interface
input		c2i_packet_vld;
input		ucb_sel;
output		ucb_buf_acpt;


// slow datapath interface
input [127:0]	c2i_packet;


// UCB interface
output		iob_ucb_vld;
output [31:0]	iob_ucb_data;
input		ucb_iob_stall;


// Internal signals



////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////

assign	dbl_buf_wr = c2i_packet_vld & ucb_sel & ~dbl_buf_full;
assign	ucb_buf_acpt = dbl_buf_wr;
assign	dbl_buf_rd = dbl_buf_vld & ~outdata_buf_busy;
assign	outdata_buf_wr = dbl_buf_rd;
//assign	outdata_vec_in = {128/UCB_BUS_WIDTH{1'b1}};

/******************************************************************
//dbl_buf #(128) dbl_buf (
//		    .clk(l2clk),
//		    .wr(dbl_buf_wr),
//		    .din(c2i_packet[127:0]),
//		    .rd(dbl_buf_rd),
//		    .dout(outdata_buf_in[127:0]),
//		    .vld(dbl_buf_vld),
//		    .full(dbl_buf_full));
******************************************************************/
assign	wr_buf0 = dbl_buf_wr & (buf1_vld | (~buf0_vld & ~buf1_older));
assign	wr_buf1 = dbl_buf_wr & (buf0_vld | (~buf1_vld & buf1_older));

// read from the older entry
assign	rd_buf0 = dbl_buf_rd & ~buf1_older;
assign	rd_buf1 = dbl_buf_rd &  buf1_older;

// flip older pointer when an entry is read
assign	rd_buf = dbl_buf_rd & (buf0_vld | buf1_vld);
assign	buf1_older_n = ~buf1_older;
ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_1 buf1_older_ff  
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
ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_1 buf0_vld_ff  
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

ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_1 buf1_vld_ff  
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

ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_64 buf0_obj_p_ff  
				(
				.scan_in(buf0_obj_p_ff_scanin),
				.scan_out(buf0_obj_p_ff_scanout),
				.dout		(buf0_obj_p[63:0]),
				.l1clk		(l1clk),
				.en		(wr_buf0),
				.din		(c2i_packet[127:64]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_55 buf0_obj_h_ff  
				(
				.scan_in(buf0_obj_h_ff_scanin),
				.scan_out(buf0_obj_h_ff_scanout),
				.dout		(buf0_obj_h[54:0]),
				.l1clk		(l1clk),
				.en		(wr_buf0),
				.din		(c2i_packet[54:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_64 buf1_obj_p_ff  
				(
				.scan_in(buf1_obj_p_ff_scanin),
				.scan_out(buf1_obj_p_ff_scanout),
				.dout		(buf1_obj_p[63:0]),
				.l1clk		(l1clk),
				.en		(wr_buf1),
				.din		(c2i_packet[127:64]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_55 buf1_obj_h_ff  
				(
				.scan_in(buf1_obj_h_ff_scanin),
				.scan_out(buf1_obj_h_ff_scanout),
				.dout		(buf1_obj_h[54:0]),
				.l1clk		(l1clk),
				.en		(wr_buf1),
				.din		(c2i_packet[54:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
//assign	outdata_buf_in[127:0] = (buf1_older) ? buf1_obj[127:0] : buf0_obj[127:0] ;
assign	outdata_buf_in[127:0] = (buf1_older) ? {buf1_obj_p[63:0],9'b0,buf1_obj_h[54:0]} : 
					       {buf0_obj_p[63:0],9'b0,buf0_obj_h[54:0]} ;

assign	dbl_buf_vld = buf0_vld | buf1_vld;
assign	dbl_buf_full = buf0_vld & buf1_vld;






/*******************************************************************   
//ucb_bus_out #(UCB_BUS_WIDTH) ucb_bus_out ( 
//                                .clk(l2clk),
//                                .outdata_buf_wr(outdata_buf_wr),
//                                .outdata_buf_in(outdata_buf_in[127:0]),
//                                .outdata_vec_in(outdata_vec_in[128/UCB_BUS_WIDTH-1:0]),
//                                .outdata_buf_busy(outdata_buf_busy),
//                                .vld(iob_ucb_vld),
//                                .data(iob_ucb_data[UCB_BUS_WIDTH-1:0]),
//                                .stall(ucb_iob_stall));
*******************************************************************/

assign	iob_ucb_vld = outdata_vec[0] & tcu_dbr_gateoff;
assign	iob_ucb_data[31:0] = outdata_buf[31:0];

ncu_c2ibuf32_ctl_msff_ctl_macro__width_1 rdy0_ff 
				(
				.scan_in(rdy0_ff_scanin),
				.scan_out(rdy0_ff_scanout),
				.dout		(rdy0),
				.l1clk		(l1clk),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibuf32_ctl_msff_ctl_macro__width_1 rdy1_ff 
				(
				.scan_in(rdy1_ff_scanin),
				.scan_out(rdy1_ff_scanout),
				.dout		(rdy1),
				.l1clk		(l1clk),
				.din		(rdy0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_1 stall_d1_ff  
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.l1clk		(l1clk),
				.en		(rdy1),
				.din		(ucb_iob_stall),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Outbound Data
 ************************************************************/
// accept new data only if there is none being processed
assign	load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign  outdata_buf_busy = outdata_vec[0] | stall_d1;

assign  shift_outdata = outdata_vec[0] & ~stall_d1;

assign  outdata_vec_next[3:0] =
			//load_outdata  ? outdata_vec_in[3:0] : 
			load_outdata  ? 4'b1111 :
			//shift_outdata ? outdata_vec[128/UCB_BUS_WIDTH-1:0] >> 1 : 
			shift_outdata ? {1'b0,outdata_vec[3:1]} : outdata_vec[3:0] ;

ncu_c2ibuf32_ctl_msff_ctl_macro__width_4 outdata_vec_ff 
				(
				.scan_in(outdata_vec_ff_scanin),
				.scan_out(outdata_vec_ff_scanout),
				.dout		(outdata_vec[3:0]),
				.l1clk		(l1clk),
				.din		(outdata_vec_next[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  outdata_buf_next[127:0] = load_outdata  ? outdata_buf_in[127:0] :
	 		          shift_outdata ? (outdata_buf[127:0] >> 32) :  
	                         		     outdata_buf[127:0] ;

ncu_c2ibuf32_ctl_msff_ctl_macro__width_128 outdata_buf_ff 
				(
				.scan_in(outdata_buf_ff_scanin),
				.scan_out(outdata_buf_ff_scanout),
				.dout		(outdata_buf[127:0]),
				.l1clk		(l1clk),
				.din		(outdata_buf_next[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

	



/**** adding clock header ****/
ncu_c2ibuf32_ctl_l1clkhdr_ctl_macro clkgen (
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
assign buf1_older_ff_scanin      = scan_in                  ;
assign buf0_vld_ff_scanin        = buf1_older_ff_scanout    ;
assign buf1_vld_ff_scanin        = buf0_vld_ff_scanout      ;
assign buf0_obj_p_ff_scanin      = buf1_vld_ff_scanout      ;
assign buf0_obj_h_ff_scanin      = buf0_obj_p_ff_scanout    ;
assign buf1_obj_p_ff_scanin      = buf0_obj_h_ff_scanout    ;
assign buf1_obj_h_ff_scanin      = buf1_obj_p_ff_scanout    ;
assign rdy0_ff_scanin            = buf1_obj_h_ff_scanout    ;
assign rdy1_ff_scanin            = rdy0_ff_scanout          ;
assign stall_d1_ff_scanin        = rdy1_ff_scanout          ;
assign outdata_vec_ff_scanin     = stall_d1_ff_scanout      ;
assign outdata_buf_ff_scanin     = outdata_vec_ff_scanout   ;
assign scan_out                  = outdata_buf_ff_scanout   ;
// fixscan end:
endmodule // c2i_buf







// any PARAMS parms go into naming of macro

module ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_c2ibuf32_ctl_msff_ctl_macro__en_1__width_55 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [54:0] fdin;
wire [53:0] so;

  input [54:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [54:0] dout;
  output scan_out;
assign fdin[54:0] = (din[54:0] & {55{en}}) | (dout[54:0] & ~{55{en}});






dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ibuf32_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2ibuf32_ctl_msff_ctl_macro__width_4 (
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

module ncu_c2ibuf32_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






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

module ncu_c2ibuf32_ctl_l1clkhdr_ctl_macro (
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








