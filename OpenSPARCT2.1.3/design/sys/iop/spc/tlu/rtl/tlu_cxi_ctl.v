// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_cxi_ctl.v
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
module tlu_cxi_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  fls_core_running, 
  fls_ss_request, 
  lsu_cpx_req, 
  lsu_cpx_err, 
  lsu_cpx_sre, 
  lsu_cpx_err_thread_id, 
  lsu_cpx_thread_id, 
  lsu_cpx_valid, 
  lsu_cpx_type, 
  lsu_cpx_vector, 
  lsu_cpx_prefetch, 
  lsu_ext_interrupt, 
  lsu_ext_int_type, 
  lsu_ext_int_vec, 
  lsu_ext_int_tid, 
  trl_ss_complete, 
  asi_irl_cleared, 
  cth_irl_cleared, 
  tlu_cerer_l2c_socc, 
  tlu_cerer_l2u_socu, 
  tlu_cerer_l2nd, 
  scan_out, 
  cxi_xir, 
  cxi_ivt, 
  cxi_wr_int_dis, 
  cxi_int_dis_vec, 
  cxi_l2_soc_sre, 
  cxi_l2_soc_err_type, 
  cxi_l2_soc_tid, 
  cxi_l2_err, 
  cxi_soc_err, 
  spc_ss_complete);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire request_lat_scanin;
wire request_lat_scanout;
wire [1:0] cpx_err;
wire cpx_sre;
wire [2:0] cpx_err_thr_id;
wire [2:0] cpx_thr_id;
wire [3:0] cpx_req;
wire cpx_valid;
wire [1:0] cpx_type;
wire [5:0] cpx_vector;
wire cpx_prefetch;
wire valid_req;
wire [7:0] id_decode;
wire reset_type;
wire xir_excp;
wire ivd_lat_scanin;
wire ivd_lat_scanout;
wire l_ext_interrupt;
wire [1:0] l_ext_int_type;
wire [5:0] l_ext_int_vec;
wire [2:0] l_ext_int_tid;
wire [7:0] ivd_decode;
wire irr_ne_0;
wire hwint_type;
wire ivt_excp;
wire cerer_lat_scanin;
wire cerer_lat_scanout;
wire cerer_l2c_socc;
wire cerer_l2u_socu;
wire cerer_l2nd;
wire valid_l2_err;
wire valid_soc_err;
wire valid_prefetch_err;
wire [7:0] step_pending_in;
wire [7:0] step_pending;
wire step_pending_lat_scanin;
wire step_pending_lat_scanout;
wire ss_complete_in;
wire ss_complete_lat_scanin;
wire ss_complete_lat_scanout;
wire ss_complete;
wire spares_scanin;
wire spares_scanout;



input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input	[7:0] fls_core_running;
input		fls_ss_request;

input	[3:0] lsu_cpx_req;		// Same as "rtntype" in CPX chapter
input	[1:0]	lsu_cpx_err;		// Error type for errors
input		lsu_cpx_sre;		// software_recoverable_error
input	[2:0]	lsu_cpx_err_thread_id;	// Thread ID from CPX control
input	[2:0]	lsu_cpx_thread_id;	// Thread ID from CPX data
input		lsu_cpx_valid;		// Valid for CPX packet
input	[1:0] lsu_cpx_type;		// Interrupt type
input	[5:0]	lsu_cpx_vector;		// Trap requests from crossbar
input		lsu_cpx_prefetch;	// Prefetch response (not load)

input		lsu_ext_interrupt;	// Write to interrupt vector dispatch
input	[1:0]	lsu_ext_int_type;	// Type for CPX packet
input	[5:0]	lsu_ext_int_vec;	// Interrupt vector
input	[2:0]	lsu_ext_int_tid;

input 	[7:0]	trl_ss_complete;	// Single step is complete 

input	[7:0] asi_irl_cleared;	// Int_Received Reg had bits cleared
input	[63:0]	cth_irl_cleared;	// Copy of IRR after clearing operations

input		tlu_cerer_l2c_socc;	
input		tlu_cerer_l2u_socu;	
input		tlu_cerer_l2nd;	



output		scan_out;

output	[7:0]	cxi_xir;		// External Interrupt Request
output 	[7:0]	cxi_ivt;		// Interrupt Vector Trap Request

output 	[7:0]	cxi_wr_int_dis;		// Interrupt Vector Dispatch packet
output 	[5:0]	cxi_int_dis_vec;	//   from gasket

output		cxi_l2_soc_sre;		// software_recoverable_error
output	[1:0] cxi_l2_soc_err_type;	// C=01, UC=10, ND=11
output	[2:0] cxi_l2_soc_tid;
output		cxi_l2_err;		// L2 error reported
output		cxi_soc_err;		// SOC error reported

output		spc_ss_complete;	// Single step complete for all threads



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;



////////////////////////////////////////////////////////////////////////////////
// Clock header

tlu_cxi_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



// Latch the request

tlu_cxi_ctl_msff_ctl_macro__width_23 request_lat  (
	.scan_in(request_lat_scanin),
	.scan_out(request_lat_scanout),
	.din	({lsu_cpx_err		[1:0],
		  lsu_cpx_sre		       ,
		  lsu_cpx_err_thread_id	[2:0],
		  lsu_cpx_thread_id	[2:0],
		  lsu_cpx_req		[3:0],
		  lsu_cpx_valid		       ,
		  lsu_cpx_type		[1:0],
		  lsu_cpx_vector	[5:0],
		  lsu_cpx_prefetch	       }),
	.dout	({cpx_err		[1:0],
		  cpx_sre		       ,
		  cpx_err_thr_id	[2:0],
		  cpx_thr_id		[2:0],
		  cpx_req		[3:0],
		  cpx_valid		       ,
		  cpx_type		[1:0],
		  cpx_vector		[5:0],
		  cpx_prefetch		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
// XIR decode
//
// decode thread_id

assign valid_req    =  cpx_valid & (cpx_req[3:0] == 4'b0111);

assign id_decode[7:0] =
       {cpx_thr_id[2:0] == 3'b111,
        cpx_thr_id[2:0] == 3'b110,
        cpx_thr_id[2:0] == 3'b101,
        cpx_thr_id[2:0] == 3'b100,
        cpx_thr_id[2:0] == 3'b011,
        cpx_thr_id[2:0] == 3'b010,
        cpx_thr_id[2:0] == 3'b001,
        cpx_thr_id[2:0] == 3'b000};


// process CPX interrupt type

assign reset_type = (cpx_type[1:0] == 2'b01);

assign xir_excp = valid_req & reset_type & (cpx_vector[5:0] == 6'b000011);

assign cxi_xir[7:0] = {8 {xir_excp}} & id_decode[7:0]; 



//////////////////////////////////////////////////////////////////////////////
//
// Interrupt Vector Dispatch decode
//

tlu_cxi_ctl_msff_ctl_macro__width_12 ivd_lat  (
	.scan_in(ivd_lat_scanin),
	.scan_out(ivd_lat_scanout),
	.din	({lsu_ext_interrupt	       ,
		  lsu_ext_int_type	[1:0],
		  lsu_ext_int_vec	[5:0],
		  lsu_ext_int_tid	[2:0]}),
	.dout	({l_ext_interrupt	       ,
		  l_ext_int_type	[1:0],
		  l_ext_int_vec		[5:0],
		  l_ext_int_tid		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ivd_decode[7:0] =
       {l_ext_int_tid[2:0] == 3'b111,
        l_ext_int_tid[2:0] == 3'b110,
        l_ext_int_tid[2:0] == 3'b101,
        l_ext_int_tid[2:0] == 3'b100,
        l_ext_int_tid[2:0] == 3'b011,
        l_ext_int_tid[2:0] == 3'b010,
        l_ext_int_tid[2:0] == 3'b001,
        l_ext_int_tid[2:0] == 3'b000};


// Check if Interrupt Receive Register is zero   

assign irr_ne_0 = 
       (| cth_irl_cleared[63:0]);


// process  interrupt type

assign hwint_type = (l_ext_int_type[1:0] == 2'b00);

assign ivt_excp = l_ext_interrupt & hwint_type; 

assign cxi_ivt[7:0] = 
       ({8 {ivt_excp}} & ivd_decode[7:0]) |
       ({8 {irr_ne_0}} & asi_irl_cleared[7:0]) ;

assign cxi_wr_int_dis[7:0] = {8 {ivt_excp}} & ivd_decode[7:0];

assign cxi_int_dis_vec[5:0] = l_ext_int_vec[5:0];



//////////////////////////////////////////////////////////////////////////////
//
// L2 and SOC error decode
//

tlu_cxi_ctl_msff_ctl_macro__width_3 cerer_lat  (
	.scan_in(cerer_lat_scanin),
	.scan_out(cerer_lat_scanout),
	.din	({tlu_cerer_l2c_socc	       ,
		  tlu_cerer_l2u_socu	       ,
		  tlu_cerer_l2nd    	       }),
	.dout	({cerer_l2c_socc	       ,
		  cerer_l2u_socu	       ,
		  cerer_l2nd    	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign valid_l2_err  =  
	cpx_valid & (cpx_req[3:0] == 4'b1100) & 
	((cpx_err[1:0] == 2'b01 & cerer_l2c_socc) |
	 (cpx_err[1:0] == 2'b10 & cerer_l2u_socu) |
	 (cpx_err[1:0] == 2'b11 & cerer_l2nd    ) ) ;
assign valid_soc_err  =  
	cpx_valid & (cpx_req[3:0] == 4'b1101) & 
	((cpx_err[1:0] == 2'b01 & cerer_l2c_socc) |
	 (cpx_err[1:0] == 2'b10 & cerer_l2u_socu) ) ;
assign valid_prefetch_err  =  
	cpx_valid & (cpx_req[3:0] == 4'b0000) & cpx_prefetch & 
	((cpx_err[1:0] == 2'b01 & cerer_l2c_socc) |
	 (cpx_err[1:0] == 2'b10 & cerer_l2u_socu) |
	 (cpx_err[1:0] == 2'b11 & cerer_l2nd    ) ) ;

assign cxi_l2_soc_sre =
       ((cpx_sre | (cpx_req[3:0] == 4'b0000 & cpx_prefetch)) & 
        (cpx_err[1:0] == 2'b01)) | 
       ((cpx_req[3:0] == 4'b1101) & 
        (cpx_err[1:0] == 2'b10)) ;
assign cxi_l2_soc_err_type[1:0] = 
       cpx_err[1:0];
assign cxi_l2_err =
       valid_l2_err | valid_prefetch_err;
assign cxi_soc_err =
       valid_soc_err;

assign cxi_l2_soc_tid[2:0] = 
       cpx_err_thr_id[2:0];



//////////////////////////////////////////////////////////////////////////////
//
// Figure out when all threads have stepped 
//

assign step_pending_in[7:0] =
       ((fls_core_running[7:0] & {8 {fls_ss_request}}) | 
	step_pending[7:0]) & ~trl_ss_complete[7:0];

tlu_cxi_ctl_msff_ctl_macro__width_8 step_pending_lat  (
	.scan_in(step_pending_lat_scanin),
	.scan_out(step_pending_lat_scanout),
	.din	(step_pending_in	[7:0]	),
	.dout	(step_pending		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ss_complete_in =
       (| step_pending[7:0]) & ~(| step_pending_in[7:0]);

tlu_cxi_ctl_msff_ctl_macro__width_1 ss_complete_lat  (
	.scan_in(ss_complete_lat_scanin),
	.scan_out(ss_complete_lat_scanout),
	.din	(ss_complete_in			),
	.dout	(ss_complete			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign spc_ss_complete =
       ss_complete;



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//

tlu_cxi_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk				),
  .siclk(siclk),
  .soclk(soclk)
);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// fixscan start:
assign request_lat_scanin        = scan_in                  ;
assign ivd_lat_scanin            = request_lat_scanout      ;
assign cerer_lat_scanin          = ivd_lat_scanout          ;
assign step_pending_lat_scanin   = cerer_lat_scanout        ;
assign ss_complete_lat_scanin    = step_pending_lat_scanout ;
assign spares_scanin             = ss_complete_lat_scanout  ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tlu_cxi_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module tlu_cxi_ctl_msff_ctl_macro__width_23 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [22:0] fdin;
wire [21:0] so;

  input [22:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [22:0] dout;
  output scan_out;
assign fdin[22:0] = din[22:0];






dff #(23)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22:0]),
.si({scan_in,so[21:0]}),
.so({so[21:0],scan_out}),
.q(dout[22:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_cxi_ctl_msff_ctl_macro__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_cxi_ctl_msff_ctl_macro__width_3 (
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

module tlu_cxi_ctl_msff_ctl_macro__width_8 (
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

module tlu_cxi_ctl_msff_ctl_macro__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tlu_cxi_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

