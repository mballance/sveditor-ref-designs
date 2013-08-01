// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_ild_dp.v
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
module	sii_ild_dp (
  sii_l2t_req, 
  sii_l2b_ecc, 
  ilc_ild_de_sel, 
  ilc_ild_ldhdr, 
  ilc_ild_addr_h, 
  ilc_ild_addr_lo, 
  ilc_ild_hdr_sel, 
  ilc_ild_cyc_sel, 
  ilc_ild_newhdr, 
  ild_ilc_curhdr, 
  ildq_ild_dout, 
  ipcc_data_out, 
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  sii_mb0_wdata, 
  sii_mb0_ild_fail);
wire [1:0] cmp_err;
wire [1:0] sii_mb0_ild_fail_l;
wire ff_sii_mb0_ild_fail_scanin;
wire ff_sii_mb0_ild_fail_scanout;
wire ff_sii_mb0_wdata_rrr_scanin;
wire ff_sii_mb0_wdata_rrr_scanout;
wire [7:0] sii_mb0_wdata_rr;
wire [7:0] sii_mb0_wdata_rrr;
wire ff_sii_mb0_wdata_rr_scanin;
wire ff_sii_mb0_wdata_rr_scanout;
wire [7:0] sii_mb0_wdata_r;
wire ff_sii_mb0_wdata_r_scanin;
wire ff_sii_mb0_wdata_r_scanout;
wire [31:0] mb_data;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire ilc_ild_de_sel_cyc_unused;
wire [1:0] ilc_ild_de_sel_cyc;
wire [13:0] ildq_ild_ecc;
wire [63:0] ildq_ild_data;
wire [69:0] ild_curhdr_ecc;
wire [6:0] hdr_ecc;
wire ff_sii_l2b_ecc_scanin;
wire ff_sii_l2b_ecc_scanout;
wire [6:0] sii_l2b_ecc_hdr;
wire sii_l2b_ecc_unused;
wire sii_l2b_ecc_hdr_unused;
wire [6:0] sii_l2b_ecc_l;
wire sii_l2b_ecc_l_unused;
wire ff_sii_l2t_req_scanin;
wire ff_sii_l2t_req_scanout;
wire [31:0] sii_l2t_req_l;
wire [69:0] sii_l2t_hdr0;
wire [69:0] sii_l2t_hdr1;
wire [69:0] sii_l2t_hdr2;
wire [69:0] sii_l2t_hdr3;
wire [69:0] ipcc_data_out_buff;
wire ff_sii_l2t_hdr0_scanin;
wire ff_sii_l2t_hdr0_scanout;
wire ff_sii_l2t_hdr1_scanin;
wire ff_sii_l2t_hdr1_scanout;
wire ff_sii_l2t_hdr2_scanin;
wire ff_sii_l2t_hdr2_scanout;
wire ff_sii_l2t_hdr3_scanin;
wire ff_sii_l2t_hdr3_scanout;


output	[31:0]	sii_l2t_req;
output	[6:0]	sii_l2b_ecc;

//------inter-submodule signals-------

input   [1:0]	ilc_ild_de_sel;
input 	[3:0]	ilc_ild_ldhdr;		// load into the hdr register
input   [3:0]	ilc_ild_addr_h;		// select the header register
input   [3:0]	ilc_ild_addr_lo;		// select the header register
input	[1:0]	ilc_ild_hdr_sel;	// select hdr cycle 1 or 2
input	[1:0]	ilc_ild_cyc_sel;
input	[63:0] 	ilc_ild_newhdr;	// l2 formatted header
output	[63:0]	ild_ilc_curhdr;		// current transaction hdr

//-------from data path -----------
input	[81:0]	ildq_ild_dout;		// from the queue for data	
input 	[69:0]	ipcc_data_out;		// partial from data bus for header

input		l2clk;
input		scan_in;
output		scan_out;

input   	tcu_scan_en;
input   	tcu_aclk;
input   	tcu_bclk;
input   	tcu_pce_ov;
input   	tcu_clk_stop;

input	[7:0]   sii_mb0_wdata;
output  [1:0]	sii_mb0_ild_fail;

//************************************************************************
// MBIST COMPARATOR SECTIONS 
//************************************************************************

sii_ild_dpinv_macro__width_2  inv_fail 
			(
			.din (cmp_err[1:0]),
			.dout(sii_mb0_ild_fail_l[1:0])
			);

sii_ild_dpmsff_macro__stack_2c__width_2 ff_sii_mb0_ild_fail 
                        (
                        .scan_in(ff_sii_mb0_ild_fail_scanin),
                        .scan_out(ff_sii_mb0_ild_fail_scanout),
                        .din    (sii_mb0_ild_fail_l[1:0]),
                        .clk    (l2clk),
                        .dout   (sii_mb0_ild_fail[1:0]),
                        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ild_dpmsff_macro__stack_8c__width_8 ff_sii_mb0_wdata_rrr 
                        (
                        .scan_in(ff_sii_mb0_wdata_rrr_scanin),
                        .scan_out(ff_sii_mb0_wdata_rrr_scanout),
                        .din    (sii_mb0_wdata_rr[7:0]),
                        .clk    (l2clk),
                        .dout   (sii_mb0_wdata_rrr[7:0]),
                        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ild_dpmsff_macro__stack_8c__width_8 ff_sii_mb0_wdata_rr 
                        (
                        .scan_in(ff_sii_mb0_wdata_rr_scanin),
                        .scan_out(ff_sii_mb0_wdata_rr_scanout),
                        .din    (sii_mb0_wdata_r[7:0]),
                        .clk    (l2clk),
                        .dout   (sii_mb0_wdata_rr[7:0]),
                        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ild_dpmsff_macro__stack_8c__width_8 ff_sii_mb0_wdata_r 
                        (
                        .scan_in(ff_sii_mb0_wdata_r_scanin),
                        .scan_out(ff_sii_mb0_wdata_r_scanout),
                        .din    (sii_mb0_wdata[7:0]),
                        .clk    (l2clk),
                        .dout   (sii_mb0_wdata_r[7:0]),
                        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

assign mb_data[31:0] = {14'b0, sii_mb0_wdata_rrr[1:0], {2{sii_mb0_wdata_rrr[7:0]}}}; 

sii_ild_dpcmp_macro__dcmp_8x__width_32  cmp_81_64   (
        .din0  ({14'b0, ildq_ild_dout[81:64]}),
        .din1  (mb_data[31:0]),
        .dout  (cmp_err[1])
        );

sii_ild_dpcmp_macro__dcmp_8x__width_64  cmp_63_0   (
        .din0  (ildq_ild_dout[63:0]),
        .din1  ({8{sii_mb0_wdata_rrr[7:0]}}),
        .dout  (cmp_err[0])
        );

//************************************************************************
// SCAN CONNECTIONS
//************************************************************************
   assign 	 se = tcu_scan_en;
   assign 	 siclk = tcu_aclk;
   assign 	 soclk = tcu_bclk;
   assign 	 pce_ov = tcu_pce_ov;
   assign 	 stop = tcu_clk_stop;
   assign        ilc_ild_de_sel_cyc_unused = ilc_ild_de_sel_cyc[0]; 

//assign	parity[3:0]		= ildq_ild_dout[81:78];
assign	ildq_ild_ecc[6:0] 	= ildq_ild_dout[70:64];
assign	ildq_ild_ecc[13:7] 	= ildq_ild_dout[77:71];
assign 	ildq_ild_data[63:0]	= ildq_ild_dout[63:0];
assign  ild_ilc_curhdr[63:0]    = ild_curhdr_ecc[63:0];
assign  hdr_ecc[6:0]		= {1'b0 , ild_curhdr_ecc[69:64]};

sii_ild_dpmsff_macro__stack_8c__width_8 ff_sii_l2b_ecc 
             		(
               		.scan_in(ff_sii_l2b_ecc_scanin),
               		.scan_out(ff_sii_l2b_ecc_scanout),
               		.din    ({1'b0, sii_l2b_ecc_hdr[6:0]} ),
               		.clk    (l2clk),
                	.dout   ({sii_l2b_ecc_unused, sii_l2b_ecc[6:0]}),
                	.en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              		) ;

sii_ild_dpmux_macro__mux_aonpe__ports_2__stack_32r__width_8 mux_sii_l2b_ecc_hdr 
                        (
                        .dout   ({sii_l2b_ecc_hdr_unused, sii_l2b_ecc_hdr[6:0]}) ,
                        .din0   ({1'b0, hdr_ecc[6:0]}),
                        .din1   ({1'b0, sii_l2b_ecc_l[6:0]}),
                        .sel0   (ilc_ild_cyc_sel[0]),
                        .sel1   (ilc_ild_cyc_sel[1])

                        );

sii_ild_dpmux_macro__mux_aonpe__ports_2__stack_32r__width_8 mux_sii_l2b_ecc 
                        (
                        .dout   ({sii_l2b_ecc_l_unused, sii_l2b_ecc_l[6:0]}) ,
                        .din0   ({1'b0, ildq_ild_ecc[6:0]}),
                        .din1   ({1'b0, ildq_ild_ecc[13:7]}),
                        .sel0   (ilc_ild_de_sel[0]),
                        .sel1   (ilc_ild_de_sel[1])
                        );

sii_ild_dpmsff_macro__dmsff_32x__stack_32c__width_32 ff_sii_l2t_req 
             		(
               		.scan_in(ff_sii_l2t_req_scanin),
               		.scan_out(ff_sii_l2t_req_scanout),
               		.din    (sii_l2t_req_l[31:0]),
               		.clk    (l2clk),
                	.dout   (sii_l2t_req[31:0]),
                	.en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              		) ;


//******************************************
//  L2T REQ combine muxes
//******************************************
sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_32l__width_32 mux_sii_l2t_req 
                        (
                        .dout   (sii_l2t_req_l[31:0]),
                        .din0   (ilc_ild_newhdr[31:0]),
                        .din1   (ilc_ild_newhdr[63:32]),
                        .din2   (ildq_ild_data[31:0]),
                        .din3   (ildq_ild_data[63:32]),
                        .sel0   (ilc_ild_hdr_sel[0]),
                        .sel1   (ilc_ild_hdr_sel[1]),
                        .sel2   (ilc_ild_de_sel_cyc[0]),
                        .sel3   (ilc_ild_de_sel_cyc[1])
                        );

sii_ild_dpand_macro__left_0__ports_2__stack_4r__width_2 and_data_cyc_sel     
                        (
                        .din0 ({ilc_ild_de_sel[1], ilc_ild_de_sel[0]}),
                        .din1 ({ilc_ild_cyc_sel[1], ilc_ild_cyc_sel[1]}),
                        .dout ({ilc_ild_de_sel_cyc[1], ilc_ild_de_sel_cyc[0]} )
                        );


//******************************************
// HEADER section
//******************************************
//mux_macro mux_ild_ilc_curhdr_h (width=36,ports=4,mux=aonpe,stack=36r,buffsel=none,dmux=8x)
sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_36r__width_36 mux_ild_ilc_curhdr_h 
                        (
                        .dout   (ild_curhdr_ecc[69:34]),
                        .din0   (sii_l2t_hdr0[69:34]),
                        .din1   (sii_l2t_hdr1[69:34]),
                        .din2   (sii_l2t_hdr2[69:34]),
                        .din3   (sii_l2t_hdr3[69:34]),
                        .sel0   (ilc_ild_addr_h[0]),
                        .sel1   (ilc_ild_addr_h[1]),
                        .sel2   (ilc_ild_addr_h[2]),
                        .sel3   (ilc_ild_addr_h[3])
                        );

//mux_macro mux_ild_ilc_curhdr_l (width=34,ports=4,mux=aonpe,stack=34l,buffsel=none,dmux=8x)
sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_34l__width_34 mux_ild_ilc_curhdr_l 
                        (
                        .dout   (ild_curhdr_ecc[33:0]),
                        .din0   (sii_l2t_hdr0[33:0]),
                        .din1   (sii_l2t_hdr1[33:0]),
                        .din2   (sii_l2t_hdr2[33:0]),
                        .din3   (sii_l2t_hdr3[33:0]),
                        .sel0   (ilc_ild_addr_lo[0]),
                        .sel1   (ilc_ild_addr_lo[1]),
                        .sel2   (ilc_ild_addr_lo[2]),
                        .sel3   (ilc_ild_addr_lo[3])
                        );

sii_ild_dpbuff_macro__dbuff_16x__stack_34c__width_34 buff_ipcc_data_out_h  
        (
        .dout   (ipcc_data_out_buff[69:36]),
        .din    (ipcc_data_out[69:36])
        );

sii_ild_dpbuff_macro__dbuff_16x__stack_36c__width_36 buff_ipcc_data_out_l  
        (
        .dout   (ipcc_data_out_buff[35:0]),
        .din    (ipcc_data_out[35:0])
        );


sii_ild_dpmsff_macro__stack_70c__width_70 ff_sii_l2t_hdr0 
             		(
               		.scan_in(ff_sii_l2t_hdr0_scanin),
               		.scan_out(ff_sii_l2t_hdr0_scanout),
               		.din    (ipcc_data_out_buff[69:0]),
               		.clk    (l2clk),
                	.dout   (sii_l2t_hdr0[69:0]),
                	.en     (ilc_ild_ldhdr[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              		) ;

sii_ild_dpmsff_macro__stack_70c__width_70 ff_sii_l2t_hdr1 
             		(
               		.scan_in(ff_sii_l2t_hdr1_scanin),
               		.scan_out(ff_sii_l2t_hdr1_scanout),
               		.din    (ipcc_data_out_buff[69:0]),
               		.clk    (l2clk),
                	.dout   (sii_l2t_hdr1[69:0]),
                	.en     (ilc_ild_ldhdr[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
			);

sii_ild_dpmsff_macro__stack_70c__width_70 ff_sii_l2t_hdr2 
             		(
               		.scan_in(ff_sii_l2t_hdr2_scanin),
               		.scan_out(ff_sii_l2t_hdr2_scanout),
               		.din    (ipcc_data_out_buff[69:0]),
               		.clk    (l2clk),
                	.dout   (sii_l2t_hdr2[69:0]),
                	.en     (ilc_ild_ldhdr[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
			);

sii_ild_dpmsff_macro__stack_70c__width_70 ff_sii_l2t_hdr3 
             		(
               		.scan_in(ff_sii_l2t_hdr3_scanin),
               		.scan_out(ff_sii_l2t_hdr3_scanout),
               		.din    (ipcc_data_out_buff[69:0]),
               		.clk    (l2clk),
                	.dout   (sii_l2t_hdr3[69:0]),
                	.en     (ilc_ild_ldhdr[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
			);
				

// fixscan start:
assign ff_sii_mb0_ild_fail_scanin = scan_in                  ;
assign ff_sii_mb0_wdata_rrr_scanin = ff_sii_mb0_ild_fail_scanout;
assign ff_sii_mb0_wdata_rr_scanin = ff_sii_mb0_wdata_rrr_scanout;
assign ff_sii_mb0_wdata_r_scanin = ff_sii_mb0_wdata_rr_scanout;
assign ff_sii_l2b_ecc_scanin     = ff_sii_mb0_wdata_r_scanout;
assign ff_sii_l2t_req_scanin     = ff_sii_l2b_ecc_scanout   ;
assign ff_sii_l2t_hdr0_scanin    = ff_sii_l2t_req_scanout   ;
assign ff_sii_l2t_hdr1_scanin    = ff_sii_l2t_hdr0_scanout  ;
assign ff_sii_l2t_hdr2_scanin    = ff_sii_l2t_hdr1_scanout  ;
assign ff_sii_l2t_hdr3_scanin    = ff_sii_l2t_hdr2_scanout  ;
assign scan_out                  = ff_sii_l2t_hdr3_scanout  ;
// fixscan end:
endmodule


//
//   invert macro
//
//





module sii_ild_dpinv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule









// any PARAMS parms go into naming of macro

module sii_ild_dpmsff_macro__stack_2c__width_2 (
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













// any PARAMS parms go into naming of macro

module sii_ild_dpmsff_macro__stack_8c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module sii_ild_dpcmp_macro__dcmp_8x__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module sii_ild_dpcmp_macro__dcmp_8x__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ild_dpmux_macro__mux_aonpe__ports_2__stack_32r__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(8)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module sii_ild_dpmsff_macro__dmsff_32x__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_32l__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;
  output [31:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module sii_ild_dpand_macro__left_0__ports_2__stack_4r__width_2 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_36r__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  input [35:0] din2;
  input sel2;
  input [35:0] din3;
  input sel3;
  output [35:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(36)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
  .in3(din3[35:0]),
.dout(dout[35:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ild_dpmux_macro__dmux_8x__mux_aonpe__ports_4__stack_34l__width_34 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [33:0] din0;
  input sel0;
  input [33:0] din1;
  input sel1;
  input [33:0] din2;
  input sel2;
  input [33:0] din3;
  input sel3;
  output [33:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(34)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[33:0]),
  .in1(din1[33:0]),
  .in2(din2[33:0]),
  .in3(din3[33:0]),
.dout(dout[33:0])
);









  



endmodule


//
//   buff macro
//
//





module sii_ild_dpbuff_macro__dbuff_16x__stack_34c__width_34 (
  din, 
  dout);
  input [33:0] din;
  output [33:0] dout;






buff #(34)  d0_0 (
.in(din[33:0]),
.out(dout[33:0])
);








endmodule





//
//   buff macro
//
//





module sii_ild_dpbuff_macro__dbuff_16x__stack_36c__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






buff #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);








endmodule









// any PARAMS parms go into naming of macro

module sii_ild_dpmsff_macro__stack_70c__width_70 (
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
wire [68:0] so;

  input [69:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [69:0] dout;


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
dff #(70)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[69:0]),
.si({scan_in,so[68:0]}),
.so({so[68:0],scan_out}),
.q(dout[69:0])
);




















endmodule








