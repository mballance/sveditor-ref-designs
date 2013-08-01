// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_msf0_dp.v
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
module spc_msf0_dp (
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  tcu_atpg_mode, 
  scan_in, 
  lb_lbist_running, 
  slow_cmp_sync_en, 
  cmp_slow_sync_en, 
  ncu_cmp_tick_enable, 
  ncu_wmr_vec_mask, 
  tcu_ss_mode, 
  tcu_do_mode, 
  tcu_mbist_user_mode, 
  tcu_mbist_bisi_en, 
  tcu_ss_request, 
  tcu_core_running, 
  tcu_shscan_clk_stop, 
  tcu_shscanid, 
  efu_spc_fuse_data, 
  efu_spc_fuse_ixfer_en, 
  efu_spc_fuse_dxfer_en, 
  efu_spc_fuse_iclr, 
  efu_spc_fuse_dclr, 
  spc_efu_fuse_ddata, 
  spc_efu_fuse_idata, 
  spc_efu_fuse_ixfer_en, 
  spc_efu_fuse_dxfer_en, 
  efu_spc_fuse_data_buf, 
  efu_spc_fuse_ixfer_en_buf, 
  efu_spc_fuse_dxfer_en_buf, 
  efu_spc_fuse_iclr_buf, 
  efu_spc_fuse_dclr_buf, 
  spc_efu_fuse_ddata_buf, 
  spc_efu_fuse_idata_buf, 
  spc_efu_fuse_ixfer_en_buf, 
  spc_efu_fuse_dxfer_en_buf, 
  tlu_core_running_status, 
  tlu_ss_complete, 
  tlu_hardstop_request, 
  tlu_softstop_request, 
  tlu_trigger_pulse, 
  tlu_dbg_instr_cmt_grp0, 
  tlu_dbg_instr_cmt_grp1, 
  scan_out, 
  msf0_cmp_tick_enable, 
  msf0_wmr_vec_mask, 
  msf0_ss_mode, 
  msf0_do_mode, 
  msf0_ss_request, 
  msf0_core_running, 
  msf0_shscan_clk_stop, 
  msf0_shscanid, 
  msf0_mbist_user_mode_ff, 
  msf0_mbist_bisi_en_ff, 
  msf0_atpg_mode_buf, 
  spc_core_running_status, 
  spc_ss_complete, 
  spc_hardstop_request, 
  spc_softstop_request, 
  spc_trigger_pulse, 
  spc_dbg_instr_cmt_grp0, 
  spc_dbg_instr_cmt_grp1, 
  power_throttle, 
  power_throttle_buf);
wire stop;
wire en;
wire clk;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire bank0_lat_scanin;
wire bank0_lat_scanout;
wire cmp_slow_sync_en_ff;
wire [7:0] tlu_core_running_status_rep0;
wire tlu_ss_complete_rep0;
wire tlu_hardstop_request_rep0;
wire tlu_softstop_request_rep0;
wire tlu_trigger_pulse_rep0;
wire [1:0] tlu_dbg_instr_cmt_grp0_rep0;
wire [1:0] tlu_dbg_instr_cmt_grp1_rep0;
wire bank1_lat_scanin;
wire bank1_lat_scanout;
wire tcu_ss_request_rep0;
wire bank2_lat_scanin;
wire bank2_lat_scanout;
wire slow_cmp_sync_en_ff;
wire efu_spc_fuse_data_bufin;
wire efu_spc_fuse_ixfer_en_bufin;
wire efu_spc_fuse_dxfer_en_bufin;
wire efu_spc_fuse_iclr_bufin;
wire efu_spc_fuse_dclr_bufin;
wire lb_lbist_running_n1;
wire lb_efu_spc_fuse_data;
wire lb_efu_spc_fuse_ixfer_en;
wire lb_efu_spc_fuse_dxfer_en;
wire lb_efu_spc_fuse_iclr;
wire lb_efu_spc_fuse_dclr;
wire ncu_cmp_tick_enable_rep0;
wire [7:0] tcu_core_running_rep0;
wire ncu_wmr_vec_mask_rep0;
wire bank3_lat_scanin;
wire bank3_lat_scanout;
wire tcu_ss_mode_rep0;
wire tcu_mbist_user_mode_rep0;
wire tcu_mbist_bisi_en_rep0;
wire tcu_do_mode_rep0;
wire bank4_lat_scanin;
wire bank4_lat_scanout;
wire [2:0] tcu_shscanid_rep0;
wire tcu_shscan_clk_stop_rep0;
wire bank5_lat_scanin;
wire bank5_lat_scanout;


input		l2clk;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_se_scancollar_out;
input		tcu_atpg_mode;
input 		scan_in;

input		lb_lbist_running;

input		slow_cmp_sync_en;
input		cmp_slow_sync_en;

// Core inputs before the MSFF
input		ncu_cmp_tick_enable;
input		ncu_wmr_vec_mask;
input		tcu_ss_mode;
input		tcu_do_mode;
input		tcu_mbist_user_mode;
input		tcu_mbist_bisi_en;
input		tcu_ss_request;
input	[7:0]	tcu_core_running;
input		tcu_shscan_clk_stop;	
input	[2:0]	tcu_shscanid;		

input		efu_spc_fuse_data;	
input		efu_spc_fuse_ixfer_en;	
input		efu_spc_fuse_dxfer_en;	
input		efu_spc_fuse_iclr;	
input		efu_spc_fuse_dclr;	

output		spc_efu_fuse_ddata;	
output		spc_efu_fuse_idata;	
output		spc_efu_fuse_ixfer_en;	
output		spc_efu_fuse_dxfer_en;	

output		efu_spc_fuse_data_buf;	
output		efu_spc_fuse_ixfer_en_buf;	
output		efu_spc_fuse_dxfer_en_buf;	
output		efu_spc_fuse_iclr_buf;	
output		efu_spc_fuse_dclr_buf;	

input		spc_efu_fuse_ddata_buf;	
input 		spc_efu_fuse_idata_buf;	
input		spc_efu_fuse_ixfer_en_buf;
input		spc_efu_fuse_dxfer_en_buf;

// Core outputs before the MSFF
input	[7:0]	tlu_core_running_status;
input		tlu_ss_complete;
input		tlu_hardstop_request;
input		tlu_softstop_request;
input 		tlu_trigger_pulse;
input 	[1:0]	tlu_dbg_instr_cmt_grp0;
input 	[1:0]	tlu_dbg_instr_cmt_grp1;

output		scan_out;

// Core inputs after the MSFF
output		msf0_cmp_tick_enable;
output		msf0_wmr_vec_mask;
output		msf0_ss_mode;
output		msf0_do_mode;
output		msf0_ss_request;
output	[7:0]	msf0_core_running;
output		msf0_shscan_clk_stop;	
output	[2:0]	msf0_shscanid;		
output          msf0_mbist_user_mode_ff;
output          msf0_mbist_bisi_en_ff;
output		msf0_atpg_mode_buf;

// Core outputs after the MSFF
output	[7:0]	spc_core_running_status;
output		spc_ss_complete;
output		spc_hardstop_request;
output		spc_softstop_request;
output 		spc_trigger_pulse;
output 	[1:0]	spc_dbg_instr_cmt_grp0;
output 	[1:0]	spc_dbg_instr_cmt_grp1;

input	[2:0]	power_throttle;
output	[2:0] power_throttle_buf;


//////////////////////////////////////////////////////////////////////

assign stop	= 1'b0;
assign en	= 1'b1;
assign clk	= l2clk;

assign pce_ov	= tcu_pce_ov;
assign se	= tcu_scan_en;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;

//////////////////////////////////////////////////////////////////////


spc_msf0_dpmsff_macro__stack_10r__width_8 bank0_lat   (
        .scan_in(bank0_lat_scanin),
        .scan_out(bank0_lat_scanout),
        .en     (cmp_slow_sync_en_ff),
	.din	(tlu_core_running_status	[7:0]	),
	.dout	(tlu_core_running_status_rep0	[7:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_8 bank0_rep   (
        .din(tlu_core_running_status_rep0[7:0]),
        .dout(spc_core_running_status[7:0])
);

//inv_macro bank1_inv (width=1) (
//        .din(lb_lbist_running),
//        .dout(lb_lbist_running_n)
//);

//buff_macro bank1_rep0 (width=3,stack=none,dbuff=16x,rep=1) (
//        .din    (power_throttle[2:0]),
//        .dout   (power_throttle_bufin[2:0])
//);

//and_macro bank1_and (width=3) (
//        .din0   (power_throttle_bufin[2:0]),
//        .din1   ({3 {lb_lbist_running_n}}),
//        .dout   (lb_power_throttle[2:0])
//);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_11 bank1_rep1  (
	.din	({tlu_ss_complete_rep0		       ,
		  tlu_hardstop_request_rep0	       ,
		  tlu_softstop_request_rep0	       ,
                  power_throttle[2:0]                  ,
		  tlu_trigger_pulse_rep0	       ,
		  tlu_dbg_instr_cmt_grp0_rep0	[1:0],
		  tlu_dbg_instr_cmt_grp1_rep0	[1:0]}),
	.dout	({spc_ss_complete		       ,
		  spc_hardstop_request 	               ,
		  spc_softstop_request	               ,
                  power_throttle_buf[2:0]              ,
		  spc_trigger_pulse		       ,
		  spc_dbg_instr_cmt_grp0	[1:0],
		  spc_dbg_instr_cmt_grp1	[1:0]})
);

spc_msf0_dpmsff_macro__stack_8r__width_8 bank1_lat   (
	.scan_in(bank1_lat_scanin),
	.scan_out(bank1_lat_scanout),
	.din	({tlu_ss_complete	        ,
		  tlu_hardstop_request	        ,
		  tlu_softstop_request	        ,
		  tlu_trigger_pulse		,
		  tlu_dbg_instr_cmt_grp0	[1:0],
		  tlu_dbg_instr_cmt_grp1	[1:0]}),
	.dout	({tlu_ss_complete_rep0		,
		  tlu_hardstop_request_rep0     ,
		  tlu_softstop_request_rep0     ,
		  tlu_trigger_pulse_rep0	,
		  tlu_dbg_instr_cmt_grp0_rep0	[1:0],
		  tlu_dbg_instr_cmt_grp1_rep0	[1:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 bank2_rep1  (
       .din    (tcu_ss_request                       ),
       .dout   (tcu_ss_request_rep0                  )
);

spc_msf0_dpmsff_macro__stack_8r__width_3 bank2_lat   (
	.scan_in(bank2_lat_scanin),
	.scan_out(bank2_lat_scanout),
	.se	( tcu_se_scancollar_out			),
	.din    ({slow_cmp_sync_en                       ,
                  cmp_slow_sync_en                       ,
		  tcu_ss_request_rep0		       }),
        .dout   ({slow_cmp_sync_en_ff                  ,
                  cmp_slow_sync_en_ff                  ,
		  msf0_ss_request		       }),
  .clk(clk),
  .en(en),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

spc_msf0_dpbuff_macro__dbuff_16x__rep_1__stack_none__width_5 bank3_rep0  (
        .din    ({efu_spc_fuse_data, 
                  efu_spc_fuse_ixfer_en, 
		  efu_spc_fuse_dxfer_en,	
		  efu_spc_fuse_iclr,	
		  efu_spc_fuse_dclr}),	
        .dout   ({efu_spc_fuse_data_bufin, 
                  efu_spc_fuse_ixfer_en_bufin, 
		  efu_spc_fuse_dxfer_en_bufin,	
		  efu_spc_fuse_iclr_bufin,	
		  efu_spc_fuse_dclr_bufin})	
);

spc_msf0_dpinv_macro__width_1 bank3_inv  (
        .din(lb_lbist_running),
        .dout(lb_lbist_running_n1)
);

spc_msf0_dpand_macro__width_5 bank3_and  (
        .din0   ({efu_spc_fuse_data_bufin, 
                  efu_spc_fuse_ixfer_en_bufin, 
		  efu_spc_fuse_dxfer_en_bufin,	
		  efu_spc_fuse_iclr_bufin,	
		  efu_spc_fuse_dclr_bufin}),	
        .din1   ({5 {lb_lbist_running_n1}}),
        .dout   ({lb_efu_spc_fuse_data, 
                  lb_efu_spc_fuse_ixfer_en, 
		  lb_efu_spc_fuse_dxfer_en,	
		  lb_efu_spc_fuse_iclr,	
		  lb_efu_spc_fuse_dclr})	

);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_19 bank3_rep1  (
	.din	({ncu_cmp_tick_enable		       ,
                  tcu_core_running[7:0],
   		  lb_efu_spc_fuse_data,	
		  lb_efu_spc_fuse_ixfer_en,	
		  lb_efu_spc_fuse_dxfer_en,	
		  lb_efu_spc_fuse_iclr,	
		  lb_efu_spc_fuse_dclr,	
  		  spc_efu_fuse_ddata_buf,	
		  spc_efu_fuse_idata_buf,	
		  spc_efu_fuse_ixfer_en_buf,	
		  spc_efu_fuse_dxfer_en_buf,	
                  ncu_wmr_vec_mask		       }),
	.dout	({ncu_cmp_tick_enable_rep0	       ,
                  tcu_core_running_rep0[7:0],
   		  efu_spc_fuse_data_buf,	
		  efu_spc_fuse_ixfer_en_buf,	
		  efu_spc_fuse_dxfer_en_buf,	
		  efu_spc_fuse_iclr_buf,	
		  efu_spc_fuse_dclr_buf,	
  		  spc_efu_fuse_ddata,	
		  spc_efu_fuse_idata,	
		  spc_efu_fuse_ixfer_en,	
		  spc_efu_fuse_dxfer_en,	
                  ncu_wmr_vec_mask_rep0		       })
);

spc_msf0_dpmsff_macro__stack_10r__width_10 bank3_lat   (
	.scan_in(bank3_lat_scanin),
	.scan_out(bank3_lat_scanout),
	.se	( tcu_se_scancollar_out			),
        .en	( slow_cmp_sync_en_ff),
	.din	({ncu_cmp_tick_enable_rep0		       ,
                  tcu_core_running_rep0[7:0],
                  ncu_wmr_vec_mask_rep0		       }),
	.dout	({msf0_cmp_tick_enable		       ,
		  msf0_core_running[7:0]	       ,
                  msf0_wmr_vec_mask                    }),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 bank4_rep1  (
	.din    ({tcu_atpg_mode,
                  tcu_ss_mode,
                  tcu_mbist_user_mode,
                  tcu_mbist_bisi_en,
		  tcu_do_mode			       }),
	.dout    ({msf0_atpg_mode_buf,
                  tcu_ss_mode_rep0,
                  tcu_mbist_user_mode_rep0,
                  tcu_mbist_bisi_en_rep0,
		  tcu_do_mode_rep0		 })
);

spc_msf0_dpmsff_macro__stack_8r__width_4 bank4_lat   (
	.scan_in(bank4_lat_scanin),
	.scan_out(bank4_lat_scanout),
	.se	( tcu_se_scancollar_out			),
        .en	( slow_cmp_sync_en_ff),
	.din    ({tcu_ss_mode_rep0,
                  tcu_mbist_user_mode_rep0,
                  tcu_mbist_bisi_en_rep0,
		  tcu_do_mode_rep0		       }),
        .dout   ({msf0_ss_mode,
                  msf0_mbist_user_mode_ff,
                  msf0_mbist_bisi_en_ff,
		  msf0_do_mode			       }),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_4 bank5_rep1  (
	.din	({tcu_shscanid			[2:0],
                  tcu_shscan_clk_stop		}),
	.dout	({tcu_shscanid_rep0		[2:0],
                  tcu_shscan_clk_stop_rep0	})
);

spc_msf0_dpmsff_macro__stack_8r__width_4 bank5_lat   (
	.scan_in(bank5_lat_scanin),
	.scan_out(bank5_lat_scanout),
	.se	( tcu_se_scancollar_out			),
        .en	( slow_cmp_sync_en_ff),
	.din	({tcu_shscanid_rep0		[2:0],
                  tcu_shscan_clk_stop_rep0	       }),
	.dout	({msf0_shscanid			[2:0],
                  msf0_shscan_clk_stop		       }),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


// fixscan start:
assign bank0_lat_scanin          = scan_in                  ;
assign bank1_lat_scanin          = bank0_lat_scanout        ;
assign bank2_lat_scanin          = bank1_lat_scanout        ;
assign bank3_lat_scanin          = bank2_lat_scanout        ;
assign bank4_lat_scanin          = bank3_lat_scanout        ;
assign bank5_lat_scanin          = bank4_lat_scanout        ;
assign scan_out                  = bank5_lat_scanout        ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module spc_msf0_dpmsff_macro__stack_10r__width_8 (
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
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_11 (
  din, 
  dout);
  input [10:0] din;
  output [10:0] dout;






buff #(11)  d0_0 (
.in(din[10:0]),
.out(dout[10:0])
);








endmodule









// any PARAMS parms go into naming of macro

module spc_msf0_dpmsff_macro__stack_8r__width_8 (
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
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module spc_msf0_dpmsff_macro__stack_8r__width_3 (
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
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_16x__rep_1__stack_none__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   invert macro
//
//





module spc_msf0_dpinv_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module spc_msf0_dpand_macro__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






and2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





//
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule









// any PARAMS parms go into naming of macro

module spc_msf0_dpmsff_macro__stack_10r__width_10 (
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





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule









// any PARAMS parms go into naming of macro

module spc_msf0_dpmsff_macro__stack_8r__width_4 (
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
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   buff macro
//
//





module spc_msf0_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule




