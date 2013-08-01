// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dirbuf_ctl.v
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
module l2t_dirbuf_ctl (
  rd_en_c4, 
  wr_en_c4, 
  dir_inval_mask_c4, 
  rw_row_en_c4, 
  rw_panel_en_c4, 
  dir_rw_entry_c4, 
  lkup_row_en_c4, 
  lkup_panel_en_c4, 
  lkup_wr_data_c4, 
  dir_clear_c4, 
  ic_dc_dir, 
  arbadr_arbdp_addr4_c4, 
  arb_force_hit_c4, 
  addr_index_bit5, 
  l2t_mb0_run, 
  l2t_mb0_mask, 
  l2t_mb0_addr, 
  l2t_mb0_row_panel_en, 
  l2t_mb0_row_row_en, 
  l2t_mb0_row_lookup_en, 
  l2t_mb0_lookup_wdata, 
  l2t_mb0_row_wr_en, 
  l2t_mb0_row_rd_en, 
  l1clk, 
  scan_in, 
  scan_out, 
  dirlbf_force_hit_c4, 
  dirlbf_lkup_en_c4_buf, 
  dirlbf_inval_mask_c4_buf, 
  dirlbf_rw_dec_c4_buf, 
  dirlbf_rd_en_c4_buf, 
  dirlbf_wr_en_c4_buf, 
  dirlbf_rw_entry_c4_buf, 
  dirlbf_lkup_wr_data_c4_buf, 
  dirlbf_dir_clear_c4_buf, 
  aclk, 
  bclk);
wire siclk;
wire soclk;
wire ff_l2t_mb0_run_r1_scanin;
wire ff_l2t_mb0_run_r1_scanout;
wire l2t_mb0_run_r1;
wire mb0_row_row_en;
wire dirlbf_force_hit_c41;
wire [5:0] rw_index;
wire l2t_mb0_row_wr_en_qual;
wire l2t_mb0_row_rd_en_qual;
wire address_bit4_0;
wire ic_address_bit4;
wire address_bit4_1;
wire dc_address_bit4;
wire address_bit4;
wire sel_address_bit4;
wire dir_wr_par_c4;
wire cam_row_select;
wire rw_row_select;
wire [3:0] dirlbf_rw_dec_c4_buf_fnl;
wire [3:0] dirlbf_lkup_en_c4_buf_fnl;
 

input		rd_en_c4;	
input		wr_en_c4;	
input	[7:0]	dir_inval_mask_c4;	
input	[1:0]	rw_row_en_c4;	
input	[3:0]	rw_panel_en_c4;	
input	[5:0]	dir_rw_entry_c4;	// BS and SR 11/18/03 Reverse Directory change 
input	[1:0]	lkup_row_en_c4; // qualified already	
input	[3:0]	lkup_panel_en_c4; // qualified already	
input	[14:0]	lkup_wr_data_c4;  //  BS and SR 11/18/03 Reverse Directory change 
input		dir_clear_c4; 
input		ic_dc_dir; 
input		arbadr_arbdp_addr4_c4; 
input		arb_force_hit_c4; 
input		addr_index_bit5; 

input		l2t_mb0_run;
input	[7:0]	l2t_mb0_mask;
input	[5:0]	l2t_mb0_addr;
input	[3:0]	l2t_mb0_row_panel_en;
input		l2t_mb0_row_row_en;
input	[3:0]	l2t_mb0_row_lookup_en;
input	[15:0]	l2t_mb0_lookup_wdata;
input		l2t_mb0_row_wr_en;
input		l2t_mb0_row_rd_en;
input		l1clk;
input		scan_in;
output		scan_out;
 
output   	dirlbf_force_hit_c4;
output	[3:0]	dirlbf_lkup_en_c4_buf ;  
output	[7:0]	dirlbf_inval_mask_c4_buf ;
output	[3:0]	dirlbf_rw_dec_c4_buf; 
output		dirlbf_rd_en_c4_buf ;
output		dirlbf_wr_en_c4_buf ; 
output	[5:0]	dirlbf_rw_entry_c4_buf; // BS and SR 11/18/03 Reverse Directory change 
output	[15:0]	dirlbf_lkup_wr_data_c4_buf; // 14(top) to 0(bottom) 
output		dirlbf_dir_clear_c4_buf; 


 input aclk;
 input bclk;

assign siclk = aclk;
assign soclk = bclk;

//
// Muxing of MBIST and functional signals
//

l2t_dirbuf_ctl_msff_ctl_macro__width_1 ff_l2t_mb0_run_r1 
        (
	.din(l2t_mb0_run), 
	.l1clk(l1clk),  
	//.en(1'b1),
	.scan_in(ff_l2t_mb0_run_r1_scanin),
	.scan_out(ff_l2t_mb0_run_r1_scanout),
	.dout(l2t_mb0_run_r1),
  .siclk(siclk),
  .soclk(soclk)  
	); 



l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_mb0_row_row_en_wdata 
	(
	.dout	({dirlbf_force_hit_c4,mb0_row_row_en}),
	.din0	({1'b0,l2t_mb0_row_row_en}),
	.din1	({dirlbf_force_hit_c41,1'b0}),
	.sel0	(l2t_mb0_run_r1),
	.sel1	(~l2t_mb0_run_r1)
	);

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_dirlbf_inval_mask_c4_buf 
	(
	.dout   (dirlbf_inval_mask_c4_buf[7:0]),
        .din0   (dir_inval_mask_c4[7:0]),
        .din1   (l2t_mb0_mask[7:0]),
	.sel0	(~l2t_mb0_run_r1),
	.sel1	(l2t_mb0_run_r1)
	);



l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 mux_rw_index 
	(
	.dout	(rw_index[5:0]),
	.din0	({addr_index_bit5,dir_rw_entry_c4[4:0]}),
	.din1	(dir_rw_entry_c4[5:0]),
	.sel0	(~dirlbf_wr_en_c4_buf),
	.sel1	(dirlbf_wr_en_c4_buf)
	);


assign l2t_mb0_row_wr_en_qual = l2t_mb0_row_wr_en & l2t_mb0_row_row_en;
assign l2t_mb0_row_rd_en_qual = l2t_mb0_row_rd_en & l2t_mb0_row_row_en;

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_dirlbf_rd_wr_entry_c4_buf 
        (
        .dout   ({dirlbf_rw_entry_c4_buf[5:0],dirlbf_wr_en_c4_buf,dirlbf_rd_en_c4_buf}),
        .din0    ({rw_index[5:0],wr_en_c4,rd_en_c4}),
        .din1    ({l2t_mb0_addr[5:0],l2t_mb0_row_wr_en_qual,l2t_mb0_row_rd_en_qual}),
        .sel0   (~l2t_mb0_run_r1),
        .sel1   (l2t_mb0_run_r1)
        );



assign address_bit4_0 = ~(ic_address_bit4 & ic_dc_dir);
assign address_bit4_1 = ~(dc_address_bit4 & ~ic_dc_dir);
assign address_bit4   = ~(address_bit4_0  & address_bit4_1);

assign dirlbf_force_hit_c41 = arb_force_hit_c4 | (lkup_row_en_c4[0] & lkup_row_en_c4[1]);


assign sel_address_bit4 = (dirlbf_wr_en_c4_buf | dirlbf_rd_en_c4_buf);

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_address_bit4 
	(
	.dout	({dc_address_bit4,ic_address_bit4}),
	.din0	({dir_rw_entry_c4[5],dir_rw_entry_c4[5]}),
	.din1	({lkup_row_en_c4[1],arbadr_arbdp_addr4_c4}),
	.sel0	(sel_address_bit4),
	.sel1	(~sel_address_bit4)
	);


//prty_macro prty_dir_wr_par_c4 (width=16)
//	(
//	.dout	(dir_wr_par_c4),
//	.din	({1'b0,address_bit4,lkup_wr_data_c4[13:0]})
//	);

assign dir_wr_par_c4 = ^(lkup_wr_data_c4[13:0]) ^ address_bit4;

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_dirlbf_lkup_wr_data_c4_buf 
	(
	.dout	(dirlbf_lkup_wr_data_c4_buf[15:0]),
	.din0	({lkup_wr_data_c4[14],dir_wr_par_c4,address_bit4,lkup_wr_data_c4[12:0]}),
	.din1	(l2t_mb0_lookup_wdata[15:0]),
        .sel0   (~l2t_mb0_run_r1),
        .sel1   (l2t_mb0_run_r1)
	);
	


assign cam_row_select = |(lkup_row_en_c4[1:0]);
assign rw_row_select =  ((|(rw_row_en_c4[1:0])) | mb0_row_row_en);
assign dirlbf_dir_clear_c4_buf = dir_clear_c4;

assign dirlbf_rw_dec_c4_buf_fnl[3:0] = rw_panel_en_c4[3:0] & {4{rw_row_select}};

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_dirlbf_rw_dec_c4_buf  
	(
	.dout	(dirlbf_rw_dec_c4_buf[3:0]),
	.din0	(dirlbf_rw_dec_c4_buf_fnl[3:0]),
	.din1	(l2t_mb0_row_panel_en),
        .sel0   (~l2t_mb0_run_r1),
        .sel1   (l2t_mb0_run_r1)
	);



assign dirlbf_lkup_en_c4_buf_fnl[3:0] = lkup_panel_en_c4[3:0] & {4{cam_row_select}};

//assign mbist_lookup_en[3:0] = l2t_mb0_row_lookup_en[3:0] & {4{l2t_mb0_row_row_en}};

l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_dirlbf_lkup_en_c4_buf 
	(
	.dout	(dirlbf_lkup_en_c4_buf[3:0]),
	.din0	(dirlbf_lkup_en_c4_buf_fnl[3:0]),
	.din1	(l2t_mb0_row_lookup_en[3:0]),
        .sel0   (~l2t_mb0_run_r1),
        .sel1   (l2t_mb0_run_r1)
	);




// fixscan start:
assign ff_l2t_mb0_run_r1_scanin  = scan_in                  ;
assign scan_out                  = ff_l2t_mb0_run_r1_scanout;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_msff_ctl_macro__width_1 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





assign dout[1:0] = ( {2{sel0}} & din0[1:0] ) |
                       ( {2{sel1}} & din1[1:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





assign dout[7:0] = ( {8{sel0}} & din0[7:0] ) |
                       ( {8{sel1}} & din1[7:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





assign dout[5:0] = ( {6{sel0}} & din0[5:0] ) |
                       ( {6{sel1}} & din1[5:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





assign dout[15:0] = ( {16{sel0}} & din0[15:0] ) |
                       ( {16{sel1}} & din1[15:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]);





endmodule

