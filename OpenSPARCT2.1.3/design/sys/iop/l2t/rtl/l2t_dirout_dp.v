// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dirout_dp.v
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
module l2t_dirout_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  rddata_out_c52_top, 
  rddata_out_c52_bottom, 
  rd_data_sel_c52_top, 
  rd_data_sel_c52_bottom, 
  parity_vld_in, 
  dirout_parity_vld_out, 
  mbist_read_data_pick_top, 
  mbist_read_data_pick_bottom, 
  mbist_lkup_wrdata, 
  l2t_mb0_run, 
  mbist_dc_ic_read_en, 
  cam_read_fail, 
  scan_out, 
  l2clk, 
  scan_in, 
  dirout_parity_vld);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire rd_data_sel_c52_top_final;
wire rd_data_sel_c52_bottom_final;
wire mbist_read_data_pick_top_r2;
wire mbist_read_data_pick_bottom_r2;
wire l2t_mb0_run_r1;
wire l2t_mb0_run_r1_n;
wire ff_rddata_out_c52_top_scanin;
wire ff_rddata_out_c52_top_scanout;
wire [15:0] rddata_out_c52_top_reg;
wire ff_rddata_out_c52_bottom_scanin;
wire ff_rddata_out_c52_bottom_scanout;
wire mbist_read_data_pick_top_r1;
wire [15:0] rddata_out_c52_bottom_reg;
wire ff_mbist_dirin_rddata_out_c52_scanin;
wire ff_mbist_dirin_rddata_out_c52_scanout;
wire mbist_read_data_pick_bottom_r1;
wire [15:0] dirin_rddata_out_c6;
wire row_parity;
wire rd_data_sel_top_or_bot;
wire dir_rddata_and_rd_data_sel_top_or_bot;
wire ff_parity_vld_scanin;
wire ff_parity_vld_scanout;
wire read_enable;
wire ff_lookup_cmp_data_scanin;
wire ff_lookup_cmp_data_scanout;
wire mbist_dc_ic_read_en_r1;
wire mbist_dc_ic_read_en_r2;
wire cam_read_fail_unbuff_w;
wire mbist_dc_ic_read_en_r3;
wire [15:0] mbist_lkup_wrdata_r1;
wire ff_mbist_wdata_r2_r3_split1_scanin;
wire ff_mbist_wdata_r2_r3_split1_scanout;
wire [15:0] mbist_lkup_wrdata_r2;
wire ff_mbist_wdata_r2_r3_split2_scanin;
wire ff_mbist_wdata_r2_r3_split2_scanout;
wire [15:0] mbist_lkup_wrdata_r3;
wire mbist_dc_ic_read_en_r3_n;
wire cam_read_fail_unbuff;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;

 
input	[15:0]	rddata_out_c52_top; // Top , BS and SR 11/18/03 Reverse Directory change
                                     // BS and SR 11/18/03 Reverse Directory change
input	[15:0]	rddata_out_c52_bottom; // Bottom , BS and SR 11/18/03 Reverse Directory change
                                     // BS and SR 11/18/03 Reverse Directory change
 
input		rd_data_sel_c52_top; // Top 
                                     // BS and SR 11/18/03 Reverse Directory change
input		rd_data_sel_c52_bottom; // Bottom 
                                     // BS and SR 11/18/03 Reverse Directory change
input	[2:0]	parity_vld_in; //  Right 
output	[2:0]	dirout_parity_vld_out; // Left 

input		mbist_read_data_pick_top;
input		mbist_read_data_pick_bottom;
input	[15:0]	mbist_lkup_wrdata;
input		l2t_mb0_run;

input	[1:0]	mbist_dc_ic_read_en;



output		cam_read_fail;
output 		scan_out; 
input		l2clk; 
input 		scan_in; 
output		dirout_parity_vld; 

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;


//assign scan_out = 1'b0;

 
 
wire	[15:0]	dirin_rddata_out_c52; 
wire	row1_parity; 
wire	row2_parity; 
wire	parity; 
wire	parity_vld_prev; 
wire    rd_data_sel_c52_top_n;
 
// This is a 16 wide dp 
// bits {0,1} {2,3} occupy the same bit pitches. 

l2t_dirout_dp_mux_macro__mux_aonpe__width_2 mux_rd_data_sel  
	(
	.dout	({rd_data_sel_c52_top_final,rd_data_sel_c52_bottom_final}),
	.din0	({mbist_read_data_pick_top_r2,mbist_read_data_pick_bottom_r2}),
	.din1	({rd_data_sel_c52_top,rd_data_sel_c52_bottom}),
	.sel0	(l2t_mb0_run_r1),
	.sel1	(l2t_mb0_run_r1_n)
	);
l2t_dirout_dp_inv_macro__width_2 inv_added 
        (
        .dout   ({rd_data_sel_c52_top_n,l2t_mb0_run_r1_n}),
        .din    ({rd_data_sel_c52_top_final,l2t_mb0_run_r1})
        );


l2t_dirout_dp_msff_macro__stack_18c__width_17 ff_rddata_out_c52_top 
	(
	.scan_in(ff_rddata_out_c52_top_scanin),
	.scan_out(ff_rddata_out_c52_top_scanout),
	.dout	({l2t_mb0_run_r1,rddata_out_c52_top_reg[15:0]}),
	.din	({l2t_mb0_run,rddata_out_c52_top[15:0]}),
	.clk  (l2clk),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_dirout_dp_msff_macro__stack_18c__width_18 ff_rddata_out_c52_bottom 
	(
	.scan_in(ff_rddata_out_c52_bottom_scanin),
	.scan_out(ff_rddata_out_c52_bottom_scanout),
	.dout	({mbist_read_data_pick_top_r1,mbist_read_data_pick_top_r2,rddata_out_c52_bottom_reg[15:0]}),
	.din	({mbist_read_data_pick_top,mbist_read_data_pick_top_r1,rddata_out_c52_bottom[15:0]}),
	.clk    (l2clk),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


l2t_dirout_dp_msff_macro__stack_18c__width_18 ff_mbist_dirin_rddata_out_c52 
	(
	.scan_in(ff_mbist_dirin_rddata_out_c52_scanin),
	.scan_out(ff_mbist_dirin_rddata_out_c52_scanout),
	.dout	({mbist_read_data_pick_bottom_r1,mbist_read_data_pick_bottom_r2,
			dirin_rddata_out_c6[15:0]}),
	.din	({mbist_read_data_pick_bottom,mbist_read_data_pick_bottom_r1,
			dirin_rddata_out_c52[15:0]}),
	.clk    (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


 
l2t_dirout_dp_mux_macro__mux_aonpe__ports_2__stack_16c__width_16 mux_rddata_out_c52  // BS and SR 11/18/03 Reverse Directory change
			(
			.dout 	(dirin_rddata_out_c52[15:0]) , 
                	.din0	(rddata_out_c52_top_reg[15:0]),  
			.din1	(rddata_out_c52_bottom_reg[15:0]), 
                	.sel0	(rd_data_sel_c52_top_final),  
			.sel1	(rd_data_sel_c52_top_n)
			); 
 
//zzpar16 par_row1_parity   ( .z(row1_parity), 
//                        .d({dirin_rddata_out_c52[30],dirin_rddata_out_c52[28],dirin_rddata_out_c52[26], 
//			dirin_rddata_out_c52[24],dirin_rddata_out_c52[22],dirin_rddata_out_c52[20], 
//			dirin_rddata_out_c52[18],dirin_rddata_out_c52[16],dirin_rddata_out_c52[14], 
//			dirin_rddata_out_c52[12],dirin_rddata_out_c52[10],dirin_rddata_out_c52[8], 
//			dirin_rddata_out_c52[6],dirin_rddata_out_c52[4],dirin_rddata_out_c52[2], 
//			dirin_rddata_out_c52[0]})); 
// 
//zzpar16 par_row2_parity   ( .z(row2_parity), 
//                        .d({	1'b0,dirin_rddata_out_c52[29],dirin_rddata_out_c52[27], 
//                        dirin_rddata_out_c52[25],dirin_rddata_out_c52[23],dirin_rddata_out_c52[21], 
//                        dirin_rddata_out_c52[19],dirin_rddata_out_c52[17],dirin_rddata_out_c52[15], 
//                        dirin_rddata_out_c52[13],dirin_rddata_out_c52[11],dirin_rddata_out_c52[9], 
//                        dirin_rddata_out_c52[7],dirin_rddata_out_c52[5],dirin_rddata_out_c52[3], 
//                        dirin_rddata_out_c52[1]})); 
//assign	parity_vld_prev = (row1_parity ^ row2_parity)  
//			& dirin_rddata_out_c52[31]  & 
//			( rd_data_sel_c52_top | rd_data_sel_c52_bottom); 

l2t_dirout_dp_prty_macro__width_16 par_row_parity  // BS and SR 11/18/03 Reverse Directory change
			(
                        .din	({1'b0,dirin_rddata_out_c52[14:0]}),
                        .dout	(row_parity)
                         );

l2t_dirout_dp_or_macro__width_1 or_sel_top_bot  
		(
		.dout	(rd_data_sel_top_or_bot),
		.din0	(rd_data_sel_c52_top_final),
		.din1	(rd_data_sel_c52_bottom_final)
		);

l2t_dirout_dp_and_macro__width_1 andor_sel_top_bot_dir_data  (
		.dout	(dir_rddata_and_rd_data_sel_top_or_bot),
		.din0	(rd_data_sel_top_or_bot),
		.din1	(dirin_rddata_out_c52[15])
		);
 
l2t_dirout_dp_and_macro__width_1 and_xorprty_andor_sel_top_bot_dir  ( // BS and SR 11/18/03 Reverse Directory change
                .dout   (parity_vld_prev),
                .din0   (dir_rddata_and_rd_data_sel_top_or_bot),
                .din1   (row_parity)
                );

l2t_dirout_dp_msff_macro__stack_1c__width_1 ff_parity_vld 
             (
		.scan_in(ff_parity_vld_scanin),
		.scan_out(ff_parity_vld_scanout),
		.din	(parity_vld_prev), 
		.clk	(l2clk), 
               	.dout	(dirout_parity_vld), 
		.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ); 
 

l2t_dirout_dp_or_macro__width_1 or_read_enable 
	(
	.dout	(read_enable),
	.din0	(mbist_dc_ic_read_en[1]),
	.din1	(mbist_dc_ic_read_en[0])
	);

l2t_dirout_dp_msff_macro__stack_20c__width_20 ff_lookup_cmp_data 
             (
                .scan_in(ff_lookup_cmp_data_scanin),
                .scan_out(ff_lookup_cmp_data_scanout),
                .din    ({read_enable,mbist_dc_ic_read_en_r1,mbist_dc_ic_read_en_r2,
			  cam_read_fail_unbuff_w,mbist_lkup_wrdata[15:0]}),
                .clk    (l2clk),
                .dout   ({mbist_dc_ic_read_en_r1,mbist_dc_ic_read_en_r2,mbist_dc_ic_read_en_r3,
			  cam_read_fail,mbist_lkup_wrdata_r1[15:0]}),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              );



l2t_dirout_dp_msff_macro__stack_16c__width_16 ff_mbist_wdata_r2_r3_split1 
	(
	.scan_in(ff_mbist_wdata_r2_r3_split1_scanin),
	.scan_out(ff_mbist_wdata_r2_r3_split1_scanout),
	.dout	(mbist_lkup_wrdata_r2[15:0]),
	.din	(mbist_lkup_wrdata_r1[15:0]),
	.clk  (l2clk),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_dirout_dp_msff_macro__stack_16c__width_16 ff_mbist_wdata_r2_r3_split2 
        (
        .scan_in(ff_mbist_wdata_r2_r3_split2_scanin),
        .scan_out(ff_mbist_wdata_r2_r3_split2_scanout),
        .dout   (mbist_lkup_wrdata_r3[15:0]),
        .din    (mbist_lkup_wrdata_r2[15:0]),
        .clk  (l2clk),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_dirout_dp_inv_macro__width_1 inv_mbist_dc_ic_read_en_r2 
	(
	.dout	(mbist_dc_ic_read_en_r3_n),
	.din	(mbist_dc_ic_read_en_r3)
	);

//assign mbist_dc_ic_read_en_r2_n = mbist_dc_ic_read_en_r2;

l2t_dirout_dp_cmp_macro__width_16  cmp_mbist_data 
	(
	.dout	(cam_read_fail_unbuff),
	.din0	(mbist_lkup_wrdata_r3[15:0]),
	.din1	(dirin_rddata_out_c6[15:0])
	);

 
l2t_dirout_dp_mux_macro__mux_aonpe__ports_2__width_1 mux_cam_fail 
	(
	.dout	(cam_read_fail_unbuff_w),
	.din0	(cam_read_fail_unbuff),
	.din1	(1'b1),
	.sel0	(mbist_dc_ic_read_en_r3),
	.sel1	(mbist_dc_ic_read_en_r3_n)
	);
 
//assign	dirout_parity_vld_out = parity_vld_in ; // use a 30X buffer. 

l2t_dirout_dp_buff_macro__width_3 buff_dirout_parity_vld_out 
	(
	.dout	(dirout_parity_vld_out[2:0]),
	.din	(parity_vld_in)
	);

 
// fixscan start:
assign ff_rddata_out_c52_top_scanin = scan_in                  ;
assign ff_rddata_out_c52_bottom_scanin = ff_rddata_out_c52_top_scanout;
assign ff_mbist_dirin_rddata_out_c52_scanin = ff_rddata_out_c52_bottom_scanout;
assign ff_parity_vld_scanin      = ff_mbist_dirin_rddata_out_c52_scanout;
assign ff_lookup_cmp_data_scanin = ff_parity_vld_scanout    ;
assign ff_mbist_wdata_r2_r3_split1_scanin = ff_lookup_cmp_data_scanout;
assign ff_mbist_wdata_r2_r3_split2_scanin = ff_mbist_wdata_r2_r3_split1_scanout;
assign scan_out                  = ff_mbist_wdata_r2_r3_split2_scanout;
// fixscan end:
endmodule 



// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirout_dp_mux_macro__mux_aonpe__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(2)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_dirout_dp_inv_macro__width_2 (
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

module l2t_dirout_dp_msff_macro__stack_18c__width_17 (
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
wire [15:0] so;

  input [16:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [16:0] dout;


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
dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_dirout_dp_msff_macro__stack_18c__width_18 (
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
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


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
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirout_dp_mux_macro__mux_aonpe__ports_2__stack_16c__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module l2t_dirout_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_dirout_dp_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_dirout_dp_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_dirout_dp_msff_macro__stack_1c__width_1 (
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

  input [0:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [0:0] dout;


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
dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_dirout_dp_msff_macro__stack_20c__width_20 (
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
wire [18:0] so;

  input [19:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [19:0] dout;


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
dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_dirout_dp_msff_macro__stack_16c__width_16 (
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
wire [14:0] so;

  input [15:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [15:0] dout;


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
dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_dirout_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_dirout_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirout_dp_mux_macro__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_dirout_dp_buff_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule




