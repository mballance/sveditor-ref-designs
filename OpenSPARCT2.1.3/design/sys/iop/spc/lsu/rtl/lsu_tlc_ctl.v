// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_tlc_ctl.v
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
module lsu_tlc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  mmu_dtlb_reload, 
  tld_demap_control0, 
  tld_demap_control1, 
  tld_use_secondary_context0, 
  tld_index_valid, 
  lsu_lsu_pmen_, 
  lsu_asi_error_inject_b31, 
  lsu_asi_error_inject_b27, 
  lsu_asi_error_inject_b26, 
  dcc_tlb_rw_index_e, 
  lbist_run, 
  mbi_run, 
  mbi_dtb_write_en, 
  mbi_repl_write, 
  mbi_dis_clr_ubit, 
  mbi_cambist_run, 
  mbi_dtb_demap_en, 
  mbi_demap_type, 
  scan_out, 
  tlc_wr_u_en, 
  tlc_rw_index_vld, 
  tlc_demap, 
  tlc_demap_context, 
  tlc_demap_all, 
  tlc_demap_real, 
  tlc_sel_demap_tag_c0, 
  tlc_sel_demap_tag_c1, 
  tlc_sel_write_tag, 
  tlc_sel_dm_tag, 
  tlc_sel_wr_dm_bist, 
  tlc_sel_tte_tag, 
  tlc_use_primary_context_c0, 
  tlc_use_secondary_context_c0, 
  tlc_wr_or_demap, 
  tlc_write_next, 
  tlc_tte0_clken, 
  tlc_tte1_clken, 
  tlc_tag_error_inj, 
  tlc_data_error_inj, 
  tlc_mbi_run, 
  tlc_dis_clr_ubit, 
  lsu_sel_lsu_addr_e);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire reload0_latch_scanin;
wire reload0_latch_scanout;
wire reload0;
wire reload1_latch_scanin;
wire reload1_latch_scanout;
wire reload1;
wire [2:0] demap_c0;
wire [3:0] demap_c1;
wire wr_vld_in;
wire sel_wr_dm_bist_next;
wire dm_tag_in;
wire wr_vld_latch_scanin;
wire wr_vld_latch_scanout;
wire wr_vld;
wire demap_context;
wire demap_all;
wire demap_real;
wire sel_demap_tag_d;
wire override_context0;
wire tag_error_inj;
wire data_error_inj;
wire error_inj_latch_scanin;
wire error_inj_latch_scanout;
wire bist_latch_scanin;
wire bist_latch_scanout;
wire spares_scanin;
wire spares_scanout;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		tcu_scan_en;
input		spc_aclk;
input		spc_bclk;
                                        // The following signals indicate the
                                        // first cycle of TTE transfer as well
                                        // as the operation (write or demap)
input		mmu_dtlb_reload;

input	[2:0]	tld_demap_control0;	// Demap and context controls
input	[3:0]	tld_demap_control1;	// Demap and context controls
input		tld_use_secondary_context0;
input		tld_index_valid;	// Write with index

input		lsu_lsu_pmen_;		// Power management enable
input		lsu_asi_error_inject_b31;
input		lsu_asi_error_inject_b27;
input		lsu_asi_error_inject_b26;

input		dcc_tlb_rw_index_e;

input		lbist_run;
input		mbi_run;
input		mbi_dtb_write_en;
input		mbi_repl_write;
input		mbi_dis_clr_ubit;
input		mbi_cambist_run;
input		mbi_dtb_demap_en;
input	[1:0]	mbi_demap_type;

output		scan_out;
output		tlc_wr_u_en;		// Write enable for tlb
output		tlc_rw_index_vld;	// Use index for read or write
output		tlc_demap;		// Any demap
output		tlc_demap_context;	// Demap context
output		tlc_demap_all;		// Demap all
output		tlc_demap_real;		// Demap real

output		tlc_sel_demap_tag_c0;
output		tlc_sel_demap_tag_c1;
output		tlc_sel_write_tag;
output		tlc_sel_dm_tag;
output		tlc_sel_wr_dm_bist;
output		tlc_sel_tte_tag;

output		tlc_use_primary_context_c0;// Control context muxes	
output		tlc_use_secondary_context_c0;	
				
output		tlc_wr_or_demap;	// Tells LSU to use the demap/write tid for context selection
output		tlc_write_next;

output		tlc_tte0_clken;
output		tlc_tte1_clken;

output		tlc_tag_error_inj;
output		tlc_data_error_inj;
output		tlc_mbi_run;
output		tlc_dis_clr_ubit;

output		lsu_sel_lsu_addr_e;

//////////////////////////////////////////////////////////////////////////////

assign se 	= tcu_scan_en;
assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;

// Clock header
lsu_tlc_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);





////////////////////////////////////////////////////////////////////////////////
//
//
//



//flop mmu_dtlb_reload 

lsu_tlc_ctl_msff_ctl_macro__width_1 reload0_latch   (
	.scan_in(reload0_latch_scanin),
	.scan_out(reload0_latch_scanout),
	.din	(mmu_dtlb_reload	),
	.dout	(reload0		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_tlc_ctl_msff_ctl_macro__width_1 reload1_latch   (
	.scan_in(reload1_latch_scanin),
	.scan_out(reload1_latch_scanout),
	.din	(reload0		),
	.dout	(reload1		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// demap_control[3]: use secondary context for demap/write
// demap_control[2]:  1 means demap, 0 means write
// demap_control[1:0] (if demap_control[2] is 1)
//      00     Demap page
//      01     Demap context
//      10     Demap all (to be consistent with Niagara 1)
//      11     Demap real
// demap_control[1:0] (if demap_control[2] is 0)
//      00     Demap and write with supplied context
//      01     Demap and write with context_0
//      10     Demap and write with context_1
//      11     Illegal (but demap and write with context_0)

assign demap_c0[2:0] =
       tld_demap_control0[2:0];
assign demap_c1[3:0] =
       tld_demap_control1[3:0];

assign wr_vld_in =
       reload1 & ~demap_c1[2] & ~tlc_mbi_run;
		  
assign tlc_write_next = wr_vld_in;

assign sel_wr_dm_bist_next = wr_vld_in | reload0 | tlc_mbi_run;

assign dm_tag_in = ~(wr_vld_in | tlc_mbi_run);

lsu_tlc_ctl_msff_ctl_macro__width_3 wr_vld_latch   (
	.scan_in(wr_vld_latch_scanin),
	.scan_out(wr_vld_latch_scanout),
	.din	({wr_vld_in, dm_tag_in,     sel_wr_dm_bist_next}),
	.dout	({wr_vld,    tlc_sel_dm_tag,tlc_sel_wr_dm_bist}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_sel_lsu_addr_e = tlc_sel_wr_dm_bist;

assign demap_context =
       reload1 & demap_c1[2] & ~demap_c1[1] &  demap_c1[0];

assign demap_all  =
       reload1 & demap_c1[2] &  demap_c1[1] & ~demap_c1[0];

assign demap_real =
       reload1 & demap_c1[2] &  demap_c1[1] &  demap_c1[0];

// demap default context if:
// a write with the use_context_[0,1] bits off OR
// a demap with use_seconday off
assign sel_demap_tag_d = 
       (reload1 & demap_c1[2] & ~demap_c1[3]) | 
       (reload1 & ~demap_c1[2] & ~demap_c1[1] & ~demap_c1[0]) ;

// demap context 0 if:
// a demap with use_secondary OR
// a write with use_context_0 on
assign tlc_sel_demap_tag_c0 = 
       (reload1 &  demap_c1[2] &  demap_c1[3]) |
       (reload1 & ~demap_c1[2] &  demap_c1[0]) ;

// demap context 1 if a write with use_context_1 on
assign tlc_sel_demap_tag_c1 = 
       (reload1 & ~demap_c1[2] &  demap_c1[1] & ~demap_c1[0]) ;


assign tlc_sel_write_tag = wr_vld;
assign tlc_sel_tte_tag = wr_vld | sel_demap_tag_d | tlc_mbi_run;


// Context mux controls
assign override_context0 =
       reload0 & ~demap_c0[2] & (demap_c0[1] | demap_c0[0]);

assign tlc_use_primary_context_c0 =
       (override_context0 & ~tld_use_secondary_context0) | 
       (reload0 & demap_c0[2] & ~tld_use_secondary_context0) ;

assign tlc_use_secondary_context_c0 =
       (override_context0 & tld_use_secondary_context0) | 
       (reload0 & demap_c0[2] & tld_use_secondary_context0) ;

///outputs

assign tlc_demap		= tlc_mbi_run ? (mbi_cambist_run & mbi_dtb_demap_en) : reload1;
assign tlc_demap_context	= tlc_mbi_run ? (mbi_cambist_run & mbi_dtb_demap_en & (mbi_demap_type[1:0] == 2'b10)) : demap_context;
assign tlc_demap_all   		= tlc_mbi_run ? (mbi_cambist_run & mbi_dtb_demap_en & (mbi_demap_type[1:0] == 2'b11)) : demap_all;
assign tlc_demap_real  		= tlc_mbi_run ? (mbi_cambist_run & mbi_dtb_demap_en & (mbi_demap_type[1:0] == 2'b01)) : demap_real;

assign tlc_wr_u_en 		= tlc_mbi_run ? mbi_dtb_write_en : wr_vld;

assign tlc_rw_index_vld		= (tlc_mbi_run ? ~mbi_repl_write : (dcc_tlb_rw_index_e | (wr_vld & tld_index_valid))) | lbist_run;

// This needs to be a cycle earlier than the tlb controls for timing
assign tlc_wr_or_demap 		= reload0 | wr_vld_in;

//////////////////////////////////
// Power mgmt for the datapath
assign tlc_tte0_clken = mmu_dtlb_reload | reload0 | lsu_lsu_pmen_;
assign tlc_tte1_clken = reload0 | reload1 | lsu_lsu_pmen_;

///////////////////////////////////
// Error injection
assign tag_error_inj  = lsu_asi_error_inject_b31 & lsu_asi_error_inject_b26 & wr_vld_in;
assign data_error_inj = lsu_asi_error_inject_b31 & lsu_asi_error_inject_b27 & wr_vld_in;

lsu_tlc_ctl_msff_ctl_macro__width_2 error_inj_latch   (
	.scan_in(error_inj_latch_scanin),
	.scan_out(error_inj_latch_scanout),
	.din	({    tag_error_inj,    data_error_inj	}),
	.dout	({tlc_tag_error_inj,tlc_data_error_inj	}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////
// BIST

lsu_tlc_ctl_msff_ctl_macro__width_1 bist_latch   (
	.scan_in(bist_latch_scanin),
	.scan_out(bist_latch_scanout),
	.din	(mbi_run),
	.dout	(tlc_mbi_run),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlc_dis_clr_ubit = tlc_mbi_run & mbi_dis_clr_ubit;

lsu_tlc_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign reload0_latch_scanin      = scan_in                  ;
assign reload1_latch_scanin      = reload0_latch_scanout    ;
assign wr_vld_latch_scanin       = reload1_latch_scanout    ;
assign error_inj_latch_scanin    = wr_vld_latch_scanout     ;
assign bist_latch_scanin         = error_inj_latch_scanout  ;
assign spares_scanin             = bist_latch_scanout       ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule	
	
	






// any PARAMS parms go into naming of macro

module lsu_tlc_ctl_l1clkhdr_ctl_macro (
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

module lsu_tlc_ctl_msff_ctl_macro__width_1 (
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

module lsu_tlc_ctl_msff_ctl_macro__width_3 (
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

module lsu_tlc_ctl_msff_ctl_macro__width_2 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_tlc_ctl_spare_ctl_macro__num_1 (
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

