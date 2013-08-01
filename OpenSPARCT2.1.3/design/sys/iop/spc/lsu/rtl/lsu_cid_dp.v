// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_cid_dp.v
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
module lsu_cid_dp (
  cpq_rdata, 
  cpx_spc_data_cx, 
  cic_byp_sel, 
  cic_d1_sel, 
  cic_cpq_sel, 
  cic_fifo_sel, 
  cic_fifo_clken, 
  cid_fill_data_e, 
  cid_l2miss, 
  cid_pkt_type, 
  cid_tid, 
  cid_tid_unbuf, 
  cid_cpuid, 
  cid_st_data_sel, 
  cid_xinval, 
  cid_pref, 
  cid_err, 
  cid_xway, 
  cid_st_addr, 
  cid_st_vector, 
  cid_st_bmask, 
  cid_st_way, 
  cid_inv_vec, 
  cid_inv_index, 
  cid_ncache, 
  cid_atomic, 
  cid_atomic_unbuf, 
  cid_rmo_ack, 
  cid_set_inval, 
  cid_set_icinval, 
  cid_cpq_wdata, 
  cid_dcsoc_err_e, 
  cid_d1_rtntyp, 
  cid_d1_tid, 
  cid_d1_cpuid, 
  cid_d1_wv, 
  cid_d1_rmo, 
  cid_d1_pref, 
  cid_d1_inval, 
  cid_cpq_cmp_1, 
  cid_cpq_cmp_2, 
  cid_cpq_cmp_3, 
  lsu_cpx_data, 
  lsu_cpx_cpkt, 
  lsu_cpx_valid, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  const_cpuid, 
  mbi_run, 
  mbi_wdata, 
  bist_wdata_1, 
  bist_cmpsel_2);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [145:0] in_data;
wire dff_d1_0_scanin;
wire dff_d1_0_scanout;
wire [145:0] data_d1;
wire dff_d1_1_scanin;
wire dff_d1_1_scanout;
wire dff_d1_2_scanin;
wire dff_d1_2_scanout;
wire dff_d1_3_scanin;
wire dff_d1_3_scanout;
wire [145:0] cpq_read_data;
wire dff_fifo_0_scanin;
wire dff_fifo_0_scanout;
wire [145:0] fifo_data;
wire dff_fifo_1_scanin;
wire dff_fifo_1_scanout;
wire dff_fifo_2_scanin;
wire dff_fifo_2_scanout;
wire dff_fifo_3_scanin;
wire dff_fifo_3_scanout;
wire [145:0] cpq_mx_data;
wire dff_out_0_scanin;
wire dff_out_0_scanout;
wire [145:0] cpq_data_out;
wire dff_out_1_scanin;
wire dff_out_1_scanout;
wire dff_out_2_scanin;
wire dff_out_2_scanout;
wire dff_out_3_scanin;
wire dff_out_3_scanout;
wire [3:0] buf_unused;
wire [144:129] cid_pkt_data_e;
wire cid_pkt_unused;
wire [1:1] cid_unused;
wire [17:0] inv_vec;
wire dff_cmp_data_scanin;
wire dff_cmp_data_scanout;
wire [7:0] bist_cmp_data;
wire [72:0] fifo_cmp_data;


input	[145:0]	cpq_rdata;		// Read data from CPQ
input	[145:0]	cpx_spc_data_cx;	// CPX packet

input		cic_byp_sel;
input		cic_d1_sel;
input		cic_cpq_sel;
input		cic_fifo_sel;
input		cic_fifo_clken;

output	[127:0]	cid_fill_data_e;	// Fill data for dcache
output		cid_l2miss;
output	[4:0]	cid_pkt_type;
output	[2:0]	cid_tid;
output	[2:0]	cid_tid_unbuf;
output	[2:0]	cid_cpuid;
output		cid_st_data_sel;
output		cid_xinval;
output		cid_pref;
output	[1:0]	cid_err;
output	[1:0]	cid_xway;
output	[10:3]	cid_st_addr;		// Store update address
output	[15:0]	cid_st_vector;		// Store invalidate vector
output	[7:0]	cid_st_bmask;		// Store byte mask
output	[1:0]	cid_st_way;		// Dcache way to which store data gets written
output	[17:0]	cid_inv_vec;		// Invalidation data
output	[10:6]	cid_inv_index;		// Cache index for invalidation
output		cid_ncache;
output		cid_atomic;
output		cid_atomic_unbuf;
output		cid_rmo_ack;
output		cid_set_inval;
output		cid_set_icinval;
output	[145:0]	cid_cpq_wdata;
output		cid_dcsoc_err_e;

output	[4:0]	cid_d1_rtntyp;
output	[2:0]	cid_d1_tid;
output	[2:0]	cid_d1_cpuid;
output		cid_d1_wv;
output		cid_d1_rmo;
output		cid_d1_pref;
output	[1:0]	cid_d1_inval;

output		cid_cpq_cmp_1;
output		cid_cpq_cmp_2;
output		cid_cpq_cmp_3;

// Flopped versions to IFU
output	[127:0]	lsu_cpx_data;
output	[17:0]	lsu_cpx_cpkt;
output		lsu_cpx_valid;

// Globals 
input 		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input		tcu_se_scancollar_out;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input	[2:0]	const_cpuid;


// BIST
input		mbi_run;
input	[7:0]	mbi_wdata;
input	[7:0]	bist_wdata_1;
input		bist_cmpsel_2;

// scan renames
assign stop = 1'b0;
// end scan

lsu_cid_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

assign in_data[145:0] = cpx_spc_data_cx[145:0];

lsu_cid_dp_msff_macro__stack_64c__width_64 dff_d1_0    (
	.scan_in(dff_d1_0_scanin),
	.scan_out(dff_d1_0_scanout),
	.clk	(l2clk),
	.en	(1'b1),
	.se	(tcu_se_scancollar_out),
        .din    (in_data[63:0]),
        .dout   (data_d1[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_64c__width_64 dff_d1_1    (
	.scan_in(dff_d1_1_scanin),
	.scan_out(dff_d1_1_scanout),
	.clk	(l2clk),
	.en	(1'b1),
	.se	(tcu_se_scancollar_out),
        .din    (in_data[127:64]),
        .dout   (data_d1[127:64]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_9 dff_d1_2    (
	.scan_in(dff_d1_2_scanin),
	.scan_out(dff_d1_2_scanout),
	.clk	(l2clk),
	.en	(1'b1),
	.se	(tcu_se_scancollar_out),
        .din    ({in_data[128],in_data[130],in_data[132],in_data[134],in_data[136],in_data[138],
		  in_data[140],in_data[142],in_data[144]}),
        .dout   ({data_d1[128],data_d1[130],data_d1[132],data_d1[134],data_d1[136],data_d1[138],
		  data_d1[140],data_d1[142],data_d1[144]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_9 dff_d1_3    (
	.scan_in(dff_d1_3_scanin),
	.scan_out(dff_d1_3_scanout),
	.clk	(l2clk),
	.en	(1'b1),
	.se	(tcu_se_scancollar_out),
        .din    ({in_data[129],in_data[131],in_data[133],in_data[135],in_data[137],in_data[139],
		  in_data[141],in_data[143],in_data[145]}),
        .dout   ({data_d1[129],data_d1[131],data_d1[133],data_d1[135],data_d1[137],data_d1[139],
		  data_d1[141],data_d1[143],data_d1[145]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign cid_d1_rtntyp[4:0] = data_d1[145:141];
assign cid_d1_tid[2:0]    = data_d1[136:134];
assign cid_d1_wv          = data_d1[133];
assign cid_d1_pref        = data_d1[128];
assign cid_d1_rmo         = lsu_cpx_data[125];
assign cid_d1_cpuid[2:0]  = lsu_cpx_data[120:118];
assign cid_d1_inval[1:0]  = lsu_cpx_data[124:123];

lsu_cid_dp_buff_macro__stack_64c__width_64 d1_data_buf_0    (
        .din    (data_d1[63:0]),
        .dout   (lsu_cpx_data[63:0])
);
lsu_cid_dp_buff_macro__stack_64c__width_64 d1_data_buf_1    (
        .din    (data_d1[127:64]),
        .dout   (lsu_cpx_data[127:64])
);
lsu_cid_dp_buff_macro__stack_10l__width_9 d1_data_buf_2    (
        .din    ({data_d1[128],    data_d1[130],    data_d1[132],    data_d1[134],    data_d1[136],
		  data_d1[138],    data_d1[140],    data_d1[142],    data_d1[144]}),
        .dout   ({lsu_cpx_cpkt[0],lsu_cpx_cpkt[2],lsu_cpx_cpkt[4],lsu_cpx_cpkt[6],lsu_cpx_cpkt[8],
		  lsu_cpx_cpkt[10],lsu_cpx_cpkt[12],lsu_cpx_cpkt[15],lsu_cpx_cpkt[17]})
);
lsu_cid_dp_buff_macro__stack_10l__width_9 d1_data_buf_3    (
        .din    ({data_d1[129],    data_d1[131],    data_d1[133],    data_d1[135],
		  data_d1[137],    data_d1[139],    data_d1[141],    data_d1[143],    data_d1[145]}),
        .dout   ({lsu_cpx_cpkt[1],lsu_cpx_cpkt[3],lsu_cpx_cpkt[5],lsu_cpx_cpkt[7],
		  lsu_cpx_cpkt[9],lsu_cpx_cpkt[11],lsu_cpx_cpkt[14],lsu_cpx_cpkt[16],lsu_cpx_valid})
);
assign lsu_cpx_cpkt[13] = 1'b0;

lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_64c__width_64 cpq_data_buf_0     (
	.din	(cpq_rdata[63:0]),
	.dout	(cpq_read_data[63:0])
);
lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_64c__width_64 cpq_data_buf_1     (
	.din	(cpq_rdata[127:64]),
	.dout	(cpq_read_data[127:64])
);
lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_10l__width_9 cpq_data_buf_2     (
        .din    ({cpq_rdata[128],cpq_rdata[130],cpq_rdata[132],cpq_rdata[134],cpq_rdata[136],cpq_rdata[138],
		  cpq_rdata[140],cpq_rdata[142],cpq_rdata[144]}),
        .dout    ({cpq_read_data[128],cpq_read_data[130],cpq_read_data[132],cpq_read_data[134],cpq_read_data[136],cpq_read_data[138],
		  cpq_read_data[140],cpq_read_data[142],cpq_read_data[144]})
);
lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_10l__width_9 cpq_data_buf_3     (
        .din    ({cpq_rdata[129],cpq_rdata[131],cpq_rdata[133],cpq_rdata[135],cpq_rdata[137],cpq_rdata[139],
		  cpq_rdata[141],cpq_rdata[143],cpq_rdata[145]}),
        .dout    ({cpq_read_data[129],cpq_read_data[131],cpq_read_data[133],cpq_read_data[135],cpq_read_data[137],cpq_read_data[139],
		  cpq_read_data[141],cpq_read_data[143],cpq_read_data[145]})
);

lsu_cid_dp_msff_macro__stack_64c__width_64 dff_fifo_0    (
	.scan_in(dff_fifo_0_scanin),
	.scan_out(dff_fifo_0_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(cic_fifo_clken),
        .din    (cpq_read_data[63:0]),
        .dout   (fifo_data[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_64c__width_64 dff_fifo_1    (
	.scan_in(dff_fifo_1_scanin),
	.scan_out(dff_fifo_1_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(cic_fifo_clken),
        .din    (cpq_read_data[127:64]),
        .dout   (fifo_data[127:64]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_9 dff_fifo_2    (
	.scan_in(dff_fifo_2_scanin),
	.scan_out(dff_fifo_2_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(cic_fifo_clken),
        .din    ({cpq_read_data[128],cpq_read_data[130],cpq_read_data[132],cpq_read_data[134],cpq_read_data[136],cpq_read_data[138],
		  cpq_read_data[140],cpq_read_data[142],cpq_read_data[144]}),
        .dout   ({fifo_data[128],fifo_data[130],fifo_data[132],fifo_data[134],fifo_data[136],fifo_data[138],
		  fifo_data[140],fifo_data[142],fifo_data[144]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_9 dff_fifo_3    (
	.scan_in(dff_fifo_3_scanin),
	.scan_out(dff_fifo_3_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(cic_fifo_clken),
        .din    ({cpq_read_data[129],cpq_read_data[131],cpq_read_data[133],cpq_read_data[135],cpq_read_data[137],cpq_read_data[139],
		  cpq_read_data[141],cpq_read_data[143],cpq_read_data[145]}),
        .dout   ({fifo_data[129],fifo_data[131],fifo_data[133],fifo_data[135],fifo_data[137],fifo_data[139],
		  fifo_data[141],fifo_data[143],fifo_data[145]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 cpq_mx_0      (
        .din0   (fifo_data[63:0]),
        .din1   (cpq_read_data[63:0]),
        .din2   (data_d1[63:0]),
        .din3   (in_data[63:0]),
	.sel0	(cic_fifo_sel),
	.sel1	(cic_cpq_sel),
	.sel2	(cic_d1_sel),
	.sel3	(cic_byp_sel),
        .dout   (cpq_mx_data[63:0])
);
lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 cpq_mx_1      (
        .din0   (fifo_data[127:64]),
        .din1   (cpq_read_data[127:64]),
        .din2   (data_d1[127:64]),
        .din3   (in_data[127:64]),
	.sel0	(cic_fifo_sel),
	.sel1	(cic_cpq_sel),
	.sel2	(cic_d1_sel),
	.sel3	(cic_byp_sel),
        .dout   (cpq_mx_data[127:64])
);
lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_10l__width_9 cpq_mx_2      (
        .din0   ({fifo_data[128],fifo_data[130],fifo_data[132],fifo_data[134],fifo_data[136],fifo_data[138],
		  fifo_data[140],fifo_data[142],fifo_data[144]}),
        .din1   ({cpq_read_data[128],cpq_read_data[130],cpq_read_data[132],cpq_read_data[134],cpq_read_data[136],cpq_read_data[138],
		  cpq_read_data[140],cpq_read_data[142],cpq_read_data[144]}),
        .din2   ({data_d1[128],data_d1[130],data_d1[132],data_d1[134],data_d1[136],data_d1[138],
		  data_d1[140],data_d1[142],data_d1[144]}),
        .din3   ({in_data[128],in_data[130],in_data[132],in_data[134],in_data[136],in_data[138],
		  in_data[140],in_data[142],in_data[144]}),
	.sel0	(cic_fifo_sel),
	.sel1	(cic_cpq_sel),
	.sel2	(cic_d1_sel),
	.sel3	(cic_byp_sel),
        .dout   ({cpq_mx_data[128],cpq_mx_data[130],cpq_mx_data[132],cpq_mx_data[134],cpq_mx_data[136],cpq_mx_data[138],
		  cpq_mx_data[140],cpq_mx_data[142],cpq_mx_data[144]})
);
lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_10l__width_9 cpq_mx_3      (
        .din0   ({fifo_data[129],fifo_data[131],fifo_data[133],fifo_data[135],fifo_data[137],fifo_data[139],
		  fifo_data[141],fifo_data[143],fifo_data[145]}),
        .din1   ({cpq_read_data[129],cpq_read_data[131],cpq_read_data[133],cpq_read_data[135],cpq_read_data[137],cpq_read_data[139],
		  cpq_read_data[141],cpq_read_data[143],cpq_read_data[145]}),
        .din2   ({data_d1[129],data_d1[131],data_d1[133],data_d1[135],data_d1[137],data_d1[139],
		  data_d1[141],data_d1[143],data_d1[145]}),
        .din3   ({in_data[129],in_data[131],in_data[133],in_data[135],in_data[137],in_data[139],
		  in_data[141],in_data[143],in_data[145]}),
	.sel0	(cic_fifo_sel),
	.sel1	(cic_cpq_sel),
	.sel2	(cic_d1_sel),
	.sel3	(cic_byp_sel),
        .dout   ({cpq_mx_data[129],cpq_mx_data[131],cpq_mx_data[133],cpq_mx_data[135],cpq_mx_data[137],cpq_mx_data[139],
		  cpq_mx_data[141],cpq_mx_data[143],cpq_mx_data[145]})
);

lsu_cid_dp_msff_macro__stack_64c__width_64 dff_out_0    (
	.scan_in(dff_out_0_scanin),
	.scan_out(dff_out_0_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(1'b1),		// should have PM here, but need enough time to see incoming packet
        .din    (cpq_mx_data[63:0]),
        .dout   (cpq_data_out[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_64c__width_64 dff_out_1    (
	.scan_in(dff_out_1_scanin),
	.scan_out(dff_out_1_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(1'b1),
        .din    (cpq_mx_data[127:64]),
        .dout   (cpq_data_out[127:64]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_9 dff_out_2    (
	.scan_in(dff_out_2_scanin),
	.scan_out(dff_out_2_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(1'b1),
        .din    ({cpq_mx_data[128],cpq_mx_data[130],cpq_mx_data[132],cpq_mx_data[134],cpq_mx_data[136],cpq_mx_data[138],
		  cpq_mx_data[140],cpq_mx_data[142],cpq_mx_data[144]}),
        .dout   ({cpq_data_out[128],cpq_data_out[130],cpq_data_out[132],cpq_data_out[134],cpq_data_out[136],cpq_data_out[138],
		  cpq_data_out[140],cpq_data_out[142],cpq_data_out[144]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_cid_dp_msff_macro__stack_10l__width_10 dff_out_3    (
	.scan_in(dff_out_3_scanin),
	.scan_out(dff_out_3_scanout),
	.se	(tcu_se_scancollar_out),
	.clk	(l2clk),
	.en	(1'b1),
        .din    ({cpq_mx_data[143],cpq_mx_data[129],cpq_mx_data[131],cpq_mx_data[133],cpq_mx_data[135],cpq_mx_data[137],
		  cpq_mx_data[139],cpq_mx_data[141],cpq_mx_data[143],cpq_mx_data[145]}),
        .dout   ({cid_st_data_sel,  cpq_data_out[129],cpq_data_out[131],cpq_data_out[133],cpq_data_out[135],cpq_data_out[137],
		  cpq_data_out[139],cpq_data_out[141],cpq_data_out[143],cpq_data_out[145]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign cid_tid_unbuf[2:0] = cpq_data_out[136:134];
assign cid_pref           = cpq_data_out[128];
assign cid_pkt_type[4:0]  = cpq_data_out[145:141];
assign cid_atomic_unbuf   = cpq_data_out[129];

lsu_cid_dp_buff_macro__dbuff_16x__rep_1__stack_64c__width_64 fill_data_buf_0    (
        .din    (cpq_data_out[63:0]),
        .dout   (cid_fill_data_e[63:0])
);
lsu_cid_dp_buff_macro__dbuff_16x__rep_1__stack_64c__width_64 fill_data_buf_1    (
        .din    (cpq_data_out[127:64]),
        .dout   (cid_fill_data_e[127:64])
);
lsu_cid_dp_buff_macro__rep_1__stack_10l__width_9 fill_data_buf_2    (
        .din    ({1'b0,         cpq_data_out[130],  cpq_data_out[132],  cpq_data_out[134],  cpq_data_out[136],
		  cpq_data_out[138],  cpq_data_out[140],  1'b0,         cpq_data_out[144]}),
        .dout   ({buf_unused[0],cid_pkt_data_e[130],cid_pkt_data_e[132],cid_pkt_data_e[134],cid_pkt_data_e[136],
		  cid_pkt_data_e[138],cid_pkt_data_e[140],buf_unused[1],cid_pkt_data_e[144]})
);
lsu_cid_dp_buff_macro__rep_1__stack_10l__width_9 fill_data_buf_3    (
        .din    ({cpq_data_out[129],  cpq_data_out[131],  cpq_data_out[133],  cpq_data_out[135],
		  cpq_data_out[137],  cpq_data_out[139],  1'b0,         cpq_data_out[143],  1'b0}),
        .dout   ({cid_pkt_data_e[129],cid_pkt_data_e[131],cid_pkt_data_e[133],cid_pkt_data_e[135],
		  cid_pkt_data_e[137],cid_pkt_data_e[139],buf_unused[2],cid_pkt_data_e[143],buf_unused[3]})
);

lsu_cid_dp_buff_macro__width_3 misc_data_buf  (
	.din	(cpq_data_out[120:118]),
	.dout	(cid_cpuid[2:0])
); 

assign cid_rmo_ack       = cid_fill_data_e[125];
assign cid_set_icinval   = cid_fill_data_e[124];
assign cid_set_inval     = cid_fill_data_e[123];
assign cid_st_addr[5:4]  = cid_fill_data_e[122:121];
assign cid_st_addr[10:6] = cid_fill_data_e[116:112];
assign cid_st_addr[3]    = cid_fill_data_e[104];
assign cid_st_bmask[7:0] = cid_fill_data_e[103:96];
assign cid_st_vector[15:0]= {cid_fill_data_e[93:92],cid_fill_data_e[89:88],cid_fill_data_e[85:84],cid_fill_data_e[81:80],
                             cid_fill_data_e[77:76],cid_fill_data_e[73:72],cid_fill_data_e[69:68],cid_fill_data_e[65:64]};

assign cid_inv_index[10:6] = cid_st_addr[10:6];

assign cid_dcsoc_err_e     = cid_pkt_data_e[144];
assign cid_pkt_unused      = cid_pkt_data_e[143];
assign cid_l2miss          = cid_pkt_data_e[140];
assign cid_err[1:0]        = cid_pkt_data_e[139:138];
assign cid_ncache          = cid_pkt_data_e[137];
assign cid_tid[2:0]        = cid_pkt_data_e[136:134];
assign cid_xinval          = cid_pkt_data_e[133];
assign cid_xway[1:0]       = cid_pkt_data_e[132:131];
assign cid_unused[1]       = cid_pkt_data_e[130];
assign cid_atomic          = cid_pkt_data_e[129];

////////////////////////////////////////////////////////////////////////////////
// Invalidate processing
// Invalidation vectors have the following format.
// Vectors for store ack packets contain the first 32 bits only.
// [31:0]   = {cpu7[3:0],cpu6[3:0],...,cpu1[3:0],cpu0[3:0]} for addr[5:4]=00
// [55:32]  = {cpu7[2:0],cpu6[2:0],...,cpu1[2:0],cpu0[2:0]} for addr[5:4]=01
// [87:56]  = {cpu7[3:0],cpu6[3:0],...,cpu1[3:0],cpu0[3:0]} for addr[5:4]=10
// [111:88] = {cpu7[2:0],cpu6[2:0],...,cpu1[2:0],cpu0[2:0]} for addr[5:4]=11

//Select the invalidation info specific to this cpu
lsu_cid_dp_mux_macro__mux_aodec__ports_8__stack_18l__width_18 inv_vec_mx     (
	.din0	({cid_fill_data_e[67:64],cid_fill_data_e[90:88],cid_fill_data_e[59:56],cid_fill_data_e[34:32],cid_fill_data_e[3:0]}),
	.din1	({cid_fill_data_e[71:68],cid_fill_data_e[93:91],cid_fill_data_e[63:60],cid_fill_data_e[37:35],cid_fill_data_e[7:4]}),
	.din2	({cid_fill_data_e[75:72],cid_fill_data_e[96:94],cid_fill_data_e[67:64],cid_fill_data_e[40:38],cid_fill_data_e[11:8]}),
	.din3	({cid_fill_data_e[79:76],cid_fill_data_e[99:97],cid_fill_data_e[71:68],cid_fill_data_e[43:41],cid_fill_data_e[15:12]}),
	.din4	({cid_fill_data_e[83:80],cid_fill_data_e[102:100],cid_fill_data_e[75:72],cid_fill_data_e[46:44],cid_fill_data_e[19:16]}),
	.din5	({cid_fill_data_e[87:84],cid_fill_data_e[105:103],cid_fill_data_e[79:76],cid_fill_data_e[49:47],cid_fill_data_e[23:20]}),
	.din6	({cid_fill_data_e[91:88],cid_fill_data_e[108:106],cid_fill_data_e[83:80],cid_fill_data_e[52:50],cid_fill_data_e[27:24]}),
	.din7	({cid_fill_data_e[95:92],cid_fill_data_e[111:109],cid_fill_data_e[87:84],cid_fill_data_e[55:53],cid_fill_data_e[31:28]}),
	.sel	(const_cpuid[2:0]),
	.dout	(inv_vec[17:0])
);

lsu_cid_dp_buff_macro__stack_18l__width_18 inv_vec_buf   ( 
	.din	(inv_vec[17:0]),
	.dout	(cid_inv_vec[17:0])
);

assign cid_st_way[1:0] = cid_inv_vec[17:16];

////////////////////////////////////////////////////////////////////////////////
// BIST

// Flop compare data
lsu_cid_dp_msff_macro__stack_8l__width_8 dff_cmp_data   (
	.scan_in(dff_cmp_data_scanin),
	.scan_out(dff_cmp_data_scanout),
	.din	(bist_wdata_1[7:0]),
	.dout	(bist_cmp_data[7:0]),
	.clk	(l2clk),
	.en	(mbi_run),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Write data mux
lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 bist_wdata_mx_0      (
        .din0   ({8{mbi_wdata[7:0]}}),
        .din1   (in_data[63:0]),
	.sel0	(mbi_run),
        .dout   (cid_cpq_wdata[63:0])
);
lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 bist_wdata_mx_1      (
        .din0   ({8{mbi_wdata[7:0]}}),
        .din1   (in_data[127:64]),
	.sel0	(mbi_run),
        .dout   (cid_cpq_wdata[127:64])
);
lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_10l__width_9 bist_wdata_mx_2      (
        .din0   ({mbi_wdata[0],mbi_wdata[7:0]}),
        .din1   ({in_data[128],in_data[130],in_data[132],in_data[134],in_data[136],in_data[138],
		  in_data[140],in_data[142],in_data[144]}),
	.sel0	(mbi_run),
        .dout   ({cid_cpq_wdata[128],cid_cpq_wdata[130],cid_cpq_wdata[132],cid_cpq_wdata[134],cid_cpq_wdata[136],
		  cid_cpq_wdata[138],cid_cpq_wdata[140],cid_cpq_wdata[142],cid_cpq_wdata[144]})
);
lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_10l__width_9 bist_wdata_mx_3      (
        .din0   ({mbi_wdata[0],mbi_wdata[7:0]}),
        .din1   ({in_data[129],in_data[131],in_data[133],in_data[135],in_data[137],in_data[139],
		  in_data[141],in_data[143],in_data[145]}),
	.sel0	(mbi_run),
        .dout   ({cid_cpq_wdata[129],cid_cpq_wdata[131],cid_cpq_wdata[133],cid_cpq_wdata[135],cid_cpq_wdata[137],
		  cid_cpq_wdata[139],cid_cpq_wdata[141],cid_cpq_wdata[143],cid_cpq_wdata[145]})
);

// Read data mux

lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 cpq_bist_mx_0      (
        .din0   (fifo_data[127:64]),
        .din1   (fifo_data[63:0]),
	.sel0	(bist_cmpsel_2),
        .dout   (fifo_cmp_data[63:0])
);
lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_10l__width_9 cpq_bist_mx_2      (
        .din0   ({fifo_data[129],fifo_data[131],fifo_data[133],fifo_data[135],fifo_data[137],fifo_data[139],
		  fifo_data[141],fifo_data[143],fifo_data[145]}),
        .din1   ({fifo_data[128],fifo_data[130],fifo_data[132],fifo_data[134],fifo_data[136],fifo_data[138],
		  fifo_data[140],fifo_data[142],fifo_data[144]}),
	.sel0	(bist_cmpsel_2),
        .dout   (fifo_cmp_data[72:64])
);

// Comparators

lsu_cid_dp_cmp_macro__width_64 bist_cmp1  (
	.din0	({8{bist_cmp_data[7:0]}}),
	.din1	({fifo_cmp_data[63:0]}),
	.dout	(cid_cpq_cmp_1)
);
lsu_cid_dp_cmp_macro__width_16 bist_cmp2  (
	.din0	({2{bist_cmp_data[7:0]}}),
	.din1	({bist_cmp_data[7:1],fifo_cmp_data[72:64]}),
	.dout	(cid_cpq_cmp_2)
);
assign cid_cpq_cmp_3 = 1'b1;


// fixscan start:
assign dff_d1_0_scanin           = scan_in                  ;
assign dff_d1_1_scanin           = dff_d1_0_scanout         ;
assign dff_d1_2_scanin           = dff_d1_1_scanout         ;
assign dff_d1_3_scanin           = dff_d1_2_scanout         ;
assign dff_fifo_0_scanin         = dff_d1_3_scanout         ;
assign dff_fifo_1_scanin         = dff_fifo_0_scanout       ;
assign dff_fifo_2_scanin         = dff_fifo_1_scanout       ;
assign dff_fifo_3_scanin         = dff_fifo_2_scanout       ;
assign dff_out_0_scanin          = dff_fifo_3_scanout       ;
assign dff_out_1_scanin          = dff_out_0_scanout        ;
assign dff_out_2_scanin          = dff_out_1_scanout        ;
assign dff_out_3_scanin          = dff_out_2_scanout        ;
assign dff_cmp_data_scanin       = dff_out_3_scanout        ;
assign scan_out                  = dff_cmp_data_scanout     ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_cid_dp_msff_macro__stack_64c__width_64 (
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
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module lsu_cid_dp_msff_macro__stack_10l__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__stack_10l__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__dbuff_4x__minbuff_1__stack_10l__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 (
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

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





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
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_cid_dp_mux_macro__mux_aonpe__ports_4__stack_10l__width_9 (
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

  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  input [8:0] din2;
  input sel2;
  input [8:0] din3;
  input sel3;
  output [8:0] dout;





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
mux4s #(9)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
  .in2(din2[8:0]),
  .in3(din3[8:0]),
.dout(dout[8:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_cid_dp_msff_macro__stack_10l__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__dbuff_16x__rep_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__rep_1__stack_10l__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_cid_dp_mux_macro__mux_aodec__ports_8__stack_18l__width_18 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [17:0] din0;
  input [17:0] din1;
  input [17:0] din2;
  input [17:0] din3;
  input [17:0] din4;
  input [17:0] din5;
  input [17:0] din6;
  input [17:0] din7;
  input [2:0] sel;
  output [17:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(18)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[17:0]),
  .in1(din1[17:0]),
  .in2(din2[17:0]),
  .in3(din3[17:0]),
  .in4(din4[17:0]),
  .in5(din5[17:0]),
  .in6(din6[17:0]),
  .in7(din7[17:0]),
.dout(dout[17:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_cid_dp_buff_macro__stack_18l__width_18 (
  din, 
  dout);
  input [17:0] din;
  output [17:0] dout;






buff #(18)  d0_0 (
.in(din[17:0]),
.out(dout[17:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_cid_dp_msff_macro__stack_8l__width_8 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_cid_dp_mux_macro__mux_aope__ports_2__stack_10l__width_9 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [8:0] din0;
  input [8:0] din1;
  input sel0;
  output [8:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(9)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_cid_dp_cmp_macro__width_64 (
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





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_cid_dp_cmp_macro__width_16 (
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




