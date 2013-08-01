// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_top.vh
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
`ifdef AXIS_TL
`ifdef AXIS_FBDIMM_NO_FSR
  wire dram_3x_clk;
`ifdef FAST_AXIS
  assign dram_3x_clk=tb_top.cpu.ccu.ccu_pll.clk33;
`else
  assign dram_3x_clk=tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk33;
`endif

  wire dram_2x_clk;
`ifdef FAST_AXIS
  assign dram_2x_clk=tb_top.cpu.ccu.ccu_pll.clk32;
`else
  assign dram_2x_clk=tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk32;
`endif
`endif

  reg dbg_en;
  reg dbg_en1;
  reg dbg_io;
  reg tlu_dbg_en;
  reg tlb_dbg_en;
  reg stop_on_wdto;
  reg [63:0] thread_wdto;
  reg pc_trc_mode;
  reg repeatablility_check;
  reg [22:0] dump_pc_size;
  wire [7:0] cmp_cores =8'h01;

`ifdef AXIS_FBDIMM_NO_FSR
  //this removes one flop in nb_encode_crc to avoid race on hw
  wire run_on_axis_hw = 1'b1;
`else
  //turn off when run tl model in sw
  wire run_on_axis_hw = 1'b0;
`endif
  initial $export_frcrel(tb_top.run_on_axis_hw);

  initial dbg_en=0;
  initial dbg_en1=0;
  initial dbg_io=0;
  initial tlu_dbg_en=0;
  initial tlb_dbg_en=0;
  initial thread_wdto=8192;
  initial stop_on_wdto=0;
  initial pc_trc_mode=0;
  initial repeatablility_check=0;
  initial dump_pc_size=512;
  initial $export_frcrel(tb_top.cpu.ccu.csr_blk.pll_div2);
  initial $export_frcrel(tb_top.cpu.ccu.csr_blk.pll_div4);
`ifndef FAST_AXIS
  initial $export_frcrel(tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.saved_div);
`endif
  initial $export_frcrel(tb_top.cpu.mcu0.fbdic.fbdic_status_parity_error_en);
  initial $export_frcrel(tb_top.cpu.mcu1.fbdic.fbdic_status_parity_error_en);
  initial $export_frcrel(tb_top.cpu.mcu2.fbdic.fbdic_status_parity_error_en);
  initial $export_frcrel(tb_top.cpu.mcu3.fbdic.fbdic_status_parity_error_en);
  initial $export_frcrel(tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.wmr_vec_mask);
  initial $export_frcrel(tb_top.cpu.ccu.ccu_serdes_dtm);
  initial $export_frcrel(tb_top.cpu.SSI_MISO);
  initial $export_frcrel(tb_top.SSI_EXT_INT_L);
  initial $export_frcrel(tb_top.cpu.ccu_ncu_vld);
  initial $export_frcrel(tb_top.cpu.ccu_rst_sync_stable);
  //initial $export_frcrel(tb_top.cpu.rst.rst_cmp_ctl.mio_rst_pwron_rst_cmp_);
  //initial $export_frcrel(tb_top.cpu.rst.rst_cmp_ctl.pwron_rst_l);
`ifndef AXIS_TL_ICE
  initial $export_frcrel(`CPU.tcu.jtag_ctl.clock_chop_bclk);
  initial $export_frcrel(`CPU.tcu.jtag_ctl.clock_chop_aclk);
`endif
  initial $export_frcrel(`TOP.dbg_en);
  initial $export_frcrel(`TOP.dbg_io);
  initial $export_frcrel(`TOP.tlu_dbg_en);
  initial $export_frcrel(`TOP.tlb_dbg_en);
  initial $export_frcrel(`TOP.dbg_en1);
  initial $export_frcrel(`TOP.thread_wdto);
  initial $export_frcrel(`TOP.stop_on_wdto);
  initial $export_frcrel(`TOP.pc_trc_mode);
  initial $export_frcrel(`TOP.repeatablility_check);
  initial $export_frcrel(`TOP.dump_pc_size);
  `define AXIS_DRAM `TOP.mcusat_fbdimm.axis_dimm
  initial $export_frcrel(`AXIS_DRAM.dimm.dram_dump);
  initial $export_frcrel(`AXIS_DRAM.dimm.dram_addr_dump);
  initial $export_frcrel(`AXIS_DRAM.data_delay);
  initial $export_frcrel(tb_top.cpu.ncu.tcu_sck_bypass);

   axis_io_mon axis_io_mon (
                        .clk               (`CPU.l2clk),
                        .reset96           (~reset),
			.io_cpx_data_ca    (`CPU.ccx.io_cpx_data_ca),
			.io_cpx_req_cq	   (`CPU.ccx.io_cpx_req_cq),
			.io_pcx_stall_pq   (`CPU.ccx.io_pcx_stall_pq),
			.cpx_io_grant_cx   (`CPU.ccx.cpx_io_grant_cx),
                        .CLK_CNT           (cycle[39:0]),
                        .core_mask         (cmp_cores[ 7: 0]),
                        .core_id           (3'b000),
                        .en_status         (1'b1),
                        .pcx_cpx_en        (dbg_en),
                        .pcx_cpx_short     (dbg_en1),
                        .pcx_cpx_io        (dbg_io),
                        .watch_dog_finish  ()
                   );
	
  //{{{  0
  `ifdef CORE_0
    axis_cmp_mon core0 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc0_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc0_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc0_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc0_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc0_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b000),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c0 itlb_mon_c0(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c0 dtlb_mon_c0(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  1
  `ifdef CORE_1
    axis_cmp_mon core1 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc1_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc1_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc1_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc1_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc1_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b001),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c1 itlb_mon_c1(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c1 dtlb_mon_c1(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  2
  `ifdef CORE_2
    axis_cmp_mon core2 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc2_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc2_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc2_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc2_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc2_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b010),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c2 itlb_mon_c2(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c2 dtlb_mon_c2(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  3
  `ifdef CORE_3
    axis_cmp_mon core3 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc3_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc3_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc3_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc3_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc3_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b011),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c3 itlb_mon_c3(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c3 dtlb_mon_c3(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  4
  `ifdef CORE_4
    axis_cmp_mon core4 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc4_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc4_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc4_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc4_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc4_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b100),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c4 itlb_mon_c4(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c4 dtlb_mon_c4(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  5
  `ifdef CORE_5
    axis_cmp_mon core5 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc5_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc5_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc5_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc5_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc5_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b101),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c5 itlb_mon_c5(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c5 dtlb_mon_c5(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  6
  `ifdef CORE_6
    axis_cmp_mon core6 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc6_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc6_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc6_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc6_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc6_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b110),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c6 itlb_mon_c6(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c6 dtlb_mon_c6(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  
  //{{{  7
  `ifdef CORE_7
    axis_cmp_mon core7 (
			.clk               (`CPU.l2clk),
			.reset96           (~reset),
			.spc_pcx_req_pq    (`CPU.spc7_pcx_req_pq),
			.pcx_spc_grant_px  (`CPU.pcx_spc7_grant_px),
			.spc_pcx_atom_pq   (`CPU.spc7_pcx_atm_pq),
			.spc_pcx_data_pa   (`CPU.spc7_pcx_data_pa),
			.cpx_spc_data_cx2  (`CPU.cpx_spc7_data_cx2),
			.CLK_CNT           (cycle[39:0]),
			.core_mask         (cmp_cores[ 7: 0]),
			.core_id           (3'b111),
			.en_status         (1'b1),
			.pcx_cpx_en        (dbg_en),
			.pcx_cpx_short     (dbg_en1),
	 		.pcx_cpx_io	   (dbg_io),
			.watch_dog_finish  ()
		   );
   itlb_wr_c7 itlb_mon_c7(
	.dbg_in           (tlb_dbg_en)
    );
   dtlb_wr_c7 dtlb_mon_c7(
	.dbg_in           (tlb_dbg_en)
    );

  `endif
  //}}}  

  //{{{  0
  `ifdef CORE_0
  wire [7:0] good_trap_sigs_c0 = {`TOP.axis_trap_top.c0.t7.hit_good_trap,
			       `TOP.axis_trap_top.c0.t6.hit_good_trap,
			       `TOP.axis_trap_top.c0.t5.hit_good_trap,
			       `TOP.axis_trap_top.c0.t4.hit_good_trap,
			       `TOP.axis_trap_top.c0.t3.hit_good_trap,
			       `TOP.axis_trap_top.c0.t2.hit_good_trap,
			       `TOP.axis_trap_top.c0.t1.hit_good_trap,
			       `TOP.axis_trap_top.c0.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c0 = 8'b0;
  `endif
  //}}}  
  //{{{  1
  `ifdef CORE_1
  wire [7:0] good_trap_sigs_c1 = {`TOP.axis_trap_top.c1.t7.hit_good_trap,
			       `TOP.axis_trap_top.c1.t6.hit_good_trap,
			       `TOP.axis_trap_top.c1.t5.hit_good_trap,
			       `TOP.axis_trap_top.c1.t4.hit_good_trap,
			       `TOP.axis_trap_top.c1.t3.hit_good_trap,
			       `TOP.axis_trap_top.c1.t2.hit_good_trap,
			       `TOP.axis_trap_top.c1.t1.hit_good_trap,
			       `TOP.axis_trap_top.c1.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c1 = 8'b0;
  `endif
  //}}}  
  //{{{  2
  `ifdef CORE_2
  wire [7:0] good_trap_sigs_c2 = {`TOP.axis_trap_top.c2.t7.hit_good_trap,
			       `TOP.axis_trap_top.c2.t6.hit_good_trap,
			       `TOP.axis_trap_top.c2.t5.hit_good_trap,
			       `TOP.axis_trap_top.c2.t4.hit_good_trap,
			       `TOP.axis_trap_top.c2.t3.hit_good_trap,
			       `TOP.axis_trap_top.c2.t2.hit_good_trap,
			       `TOP.axis_trap_top.c2.t1.hit_good_trap,
			       `TOP.axis_trap_top.c2.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c2 = 8'b0;
  `endif
  //}}}  
  //{{{  3
  `ifdef CORE_3
  wire [7:0] good_trap_sigs_c3 = {`TOP.axis_trap_top.c3.t7.hit_good_trap,
			       `TOP.axis_trap_top.c3.t6.hit_good_trap,
			       `TOP.axis_trap_top.c3.t5.hit_good_trap,
			       `TOP.axis_trap_top.c3.t4.hit_good_trap,
			       `TOP.axis_trap_top.c3.t3.hit_good_trap,
			       `TOP.axis_trap_top.c3.t2.hit_good_trap,
			       `TOP.axis_trap_top.c3.t1.hit_good_trap,
			       `TOP.axis_trap_top.c3.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c3 = 8'b0;
  `endif
  //}}}  
  //{{{  4
  `ifdef CORE_4
  wire [7:0] good_trap_sigs_c4 = {`TOP.axis_trap_top.c4.t7.hit_good_trap,
			       `TOP.axis_trap_top.c4.t6.hit_good_trap,
			       `TOP.axis_trap_top.c4.t5.hit_good_trap,
			       `TOP.axis_trap_top.c4.t4.hit_good_trap,
			       `TOP.axis_trap_top.c4.t3.hit_good_trap,
			       `TOP.axis_trap_top.c4.t2.hit_good_trap,
			       `TOP.axis_trap_top.c4.t1.hit_good_trap,
			       `TOP.axis_trap_top.c4.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c4 = 8'b0;
  `endif
  //}}}  
  //{{{  5
  `ifdef CORE_5
  wire [7:0] good_trap_sigs_c5 = {`TOP.axis_trap_top.c5.t7.hit_good_trap,
			       `TOP.axis_trap_top.c5.t6.hit_good_trap,
			       `TOP.axis_trap_top.c5.t5.hit_good_trap,
			       `TOP.axis_trap_top.c5.t4.hit_good_trap,
			       `TOP.axis_trap_top.c5.t3.hit_good_trap,
			       `TOP.axis_trap_top.c5.t2.hit_good_trap,
			       `TOP.axis_trap_top.c5.t1.hit_good_trap,
			       `TOP.axis_trap_top.c5.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c5 = 8'b0;
  `endif
  //}}}  
  //{{{  6
  `ifdef CORE_6
  wire [7:0] good_trap_sigs_c6 = {`TOP.axis_trap_top.c6.t7.hit_good_trap,
			       `TOP.axis_trap_top.c6.t6.hit_good_trap,
			       `TOP.axis_trap_top.c6.t5.hit_good_trap,
			       `TOP.axis_trap_top.c6.t4.hit_good_trap,
			       `TOP.axis_trap_top.c6.t3.hit_good_trap,
			       `TOP.axis_trap_top.c6.t2.hit_good_trap,
			       `TOP.axis_trap_top.c6.t1.hit_good_trap,
			       `TOP.axis_trap_top.c6.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c6 = 8'b0;
  `endif
  //}}}  
  //{{{  7
  `ifdef CORE_7
  wire [7:0] good_trap_sigs_c7 = {`TOP.axis_trap_top.c7.t7.hit_good_trap,
			       `TOP.axis_trap_top.c7.t6.hit_good_trap,
			       `TOP.axis_trap_top.c7.t5.hit_good_trap,
			       `TOP.axis_trap_top.c7.t4.hit_good_trap,
			       `TOP.axis_trap_top.c7.t3.hit_good_trap,
			       `TOP.axis_trap_top.c7.t2.hit_good_trap,
			       `TOP.axis_trap_top.c7.t1.hit_good_trap,
			       `TOP.axis_trap_top.c7.t0.hit_good_trap} ;
  `else
  wire [7:0] good_trap_sigs_c7 = 8'b0;
  `endif
  //}}}  
  wire [63:0] good_trap_sigs={ good_trap_sigs_c7, good_trap_sigs_c6, good_trap_sigs_c5, good_trap_sigs_c4,
			       good_trap_sigs_c3, good_trap_sigs_c2, good_trap_sigs_c1, good_trap_sigs_c0};
  always @(posedge `CPU.l2clk)
  begin
    if (((good_trap_sigs & `TOP.verif_args.finish_mask) == `TOP.verif_args.finish_mask) && `TOP.verif_args.finish_mask)
    begin  // axis tbcall_region // {
	`PR_NORMAL ("tb_top", `NORMAL, "all checked threads (%x) reached Good Trap.  returning to cli", `TOP.verif_args.finish_mask);
	`PR_NORMAL ("tb_top", `NORMAL, "Diag Reached GOOD End! (pre-regreport checking)");
	`PR_NORMAL ("tb_top", `NORMAL, "regreport will determine if diag has really PASSED");
	$stop;
    end //}
  end

  axis_trap_top axis_trap_top (dump_pc_size);


`ifdef AXIS_TL_ICE
  wire tck_fb;
  reg tck_fb_r;
  reg [3:0]tap_state;
  reg [7:0]tap_instr;
  reg tap_dbg;
  initial tap_dbg=1'b1;
  reg  [3:0] tap_state_r;
  reg  [7:0] tap_instr_r;
  always @(posedge tb_top.SystemClock) begin
    tap_state = `TCU.jtag_ctl.tap_state;
    tap_instr = `TCU.jtag_ctl.instr;
  end
`ifdef FAST_AXIS
  always @(posedge tb_top.cpu.ccu.ccu_pll.clk22) begin
`else
  always @(posedge tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk22) begin
`endif
    if (tap_state_r !=  tap_state) begin
      if (tap_dbg) begin // axis tbcall_region
	$display("%t TAP state changed to %x", $time, tap_state);
      end
      tap_state_r <=  tap_state;
    end
    if (tap_instr_r !=  tap_instr) begin
      if (tap_dbg) begin // axis tbcall_region
	$display("%t TAP instruction changed to %x", $time, tap_instr);
      end
      tap_instr_r <=  tap_instr;
    end
  end
`ifdef FAST_AXIS
  always @(posedge tb_top.cpu.ccu.ccu_pll.clk22)
`else
  always @(posedge tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk22)
`endif
    tck_fb_r=`CPU.tcu.jtag_ctl.tcu_jtag_tap_ctl.l1tck;
  assign tck_fb=tck_fb_r;
  assign TRST=reset;

  jtag_ice jtag_ice(TMS,TDI,TDO,TCK,tck_fb);
  initial $export_frcrel(tb_top.tap_dbg);
  initial $export_frcrel(tb_top.jtag_ice.dbg);
  initial $export_frcrel(tb_top.jtag_ice.dbg1);
  initial $export_frcrel(tb_top.jtag_ice.tck_fb);

`endif //  `ifdef AXIS_TL_ICE

// SIU to DMU/NIU monitor -  12/15/2005   
axis_siu_mon axis_siu_mon(
			  .clk (`CPU.gl_io_out_c3b0),
			  .reset (~reset),

			  .niu_sii_hdr_vld (`CPU.niu_sii_hdr_vld),
			  .niu_sii_reqbypass (`CPU.niu_sii_reqbypass),
			  .niu_sii_datareq (`CPU.niu_sii_datareq),
			  .niu_sii_data (`CPU.niu_sii_data),
			  .niu_sii_parity (`CPU.niu_sii_parity),
			  .sii_niu_oqdq (`CPU.sii_niu_oqdq),
			  .sii_niu_bqdq (`CPU.sii_niu_bqdq),

			  .niu_sio_dq (`CPU.niu_sio_dq),
			  .sio_niu_hdr_vld (`CPU.sio_niu_hdr_vld),
			  .sio_niu_datareq (`CPU.sio_niu_datareq),
			  .sio_niu_data (`CPU.sio_niu_data),
			  .sio_niu_parity (`CPU.sio_niu_parity),

			  .dmu_sii_hdr_vld (`CPU.dmu_sii_hdr_vld),
			  .dmu_sii_reqbypass (`CPU.dmu_sii_reqbypass),
			  .dmu_sii_datareq (`CPU.dmu_sii_datareq),
			  .dmu_sii_datareq16 (`CPU.dmu_sii_datareq16),
			  .dmu_sii_data (`CPU.dmu_sii_data),
			  .dmu_sii_parity (`CPU.dmu_sii_parity),
			  .dmu_sii_be_parity (`CPU.dmu_sii_be_parity),
			  .dmu_sii_be (`CPU.dmu_sii_be),
			  .sii_dmu_wrack_vld (`CPU.sii_dmu_wrack_vld),
			  .sii_dmu_wrack_tag (`CPU.sii_dmu_wrack_tag),
			  .sii_dmu_wrack_parity (`CPU.sii_dmu_wrack_parity),

			  .sio_dmu_hdr_vld (`CPU.sio_dmu_hdr_vld),
			  .sio_dmu_data (`CPU.sio_dmu_data),
			  .sio_dmu_parity (`CPU.sio_dmu_parity)
			  );

// MCU Error monitors. These simply print a message anytime the 
// DRAM_ERROR_STATUS_REG (0x84-0000-0280) changes. -  1/19/2006
axis_mcu_errmon #(0) axis_mcu0_errmon(
			      .clk (`MCU0.rdpctl.l1clk),
			      .rdpctl_meu_error (`MCU0.rdpctl.rdpctl_meu_error),
			      .rdpctl_mec_error (`MCU0.rdpctl.rdpctl_mec_error),
			      .rdpctl_dac_error (`MCU0.rdpctl.rdpctl_dac_error),
			      .rdpctl_dau_error (`MCU0.rdpctl.rdpctl_dau_error),
			      .rdpctl_dsc_error (`MCU0.rdpctl.rdpctl_dsc_error),
			      .rdpctl_dsu_error (`MCU0.rdpctl.rdpctl_dsu_error),
			      .rdpctl_dbu_error (`MCU0.rdpctl.rdpctl_dbu_error),
			      .rdpctl_meb_error (`MCU0.rdpctl.rdpctl_meb_error),
			      .rdpctl_fbu_error (`MCU0.rdpctl.rdpctl_fbu_error),
			      .rdpctl_fbr_error (`MCU0.rdpctl.rdpctl_fbr_error)
			      );

axis_mcu_errmon #(1) axis_mcu1_errmon(
			      .clk (`MCU1.rdpctl.l1clk),
			      .rdpctl_meu_error (`MCU1.rdpctl.rdpctl_meu_error),
			      .rdpctl_mec_error (`MCU1.rdpctl.rdpctl_mec_error),
			      .rdpctl_dac_error (`MCU1.rdpctl.rdpctl_dac_error),
			      .rdpctl_dau_error (`MCU1.rdpctl.rdpctl_dau_error),
			      .rdpctl_dsc_error (`MCU1.rdpctl.rdpctl_dsc_error),
			      .rdpctl_dsu_error (`MCU1.rdpctl.rdpctl_dsu_error),
			      .rdpctl_dbu_error (`MCU1.rdpctl.rdpctl_dbu_error),
			      .rdpctl_meb_error (`MCU1.rdpctl.rdpctl_meb_error),
			      .rdpctl_fbu_error (`MCU1.rdpctl.rdpctl_fbu_error),
			      .rdpctl_fbr_error (`MCU1.rdpctl.rdpctl_fbr_error)
			      );
axis_mcu_errmon #(2) axis_mcu2_errmon(
			      .clk (`MCU2.rdpctl.l1clk),
			      .rdpctl_meu_error (`MCU2.rdpctl.rdpctl_meu_error),
			      .rdpctl_mec_error (`MCU2.rdpctl.rdpctl_mec_error),
			      .rdpctl_dac_error (`MCU2.rdpctl.rdpctl_dac_error),
			      .rdpctl_dau_error (`MCU2.rdpctl.rdpctl_dau_error),
			      .rdpctl_dsc_error (`MCU2.rdpctl.rdpctl_dsc_error),
			      .rdpctl_dsu_error (`MCU2.rdpctl.rdpctl_dsu_error),
			      .rdpctl_dbu_error (`MCU2.rdpctl.rdpctl_dbu_error),
			      .rdpctl_meb_error (`MCU2.rdpctl.rdpctl_meb_error),
			      .rdpctl_fbu_error (`MCU2.rdpctl.rdpctl_fbu_error),
			      .rdpctl_fbr_error (`MCU2.rdpctl.rdpctl_fbr_error)
			      );
axis_mcu_errmon #(3) axis_mcu3_errmon(
			      .clk (`MCU3.rdpctl.l1clk),
			      .rdpctl_meu_error (`MCU3.rdpctl.rdpctl_meu_error),
			      .rdpctl_mec_error (`MCU3.rdpctl.rdpctl_mec_error),
			      .rdpctl_dac_error (`MCU3.rdpctl.rdpctl_dac_error),
			      .rdpctl_dau_error (`MCU3.rdpctl.rdpctl_dau_error),
			      .rdpctl_dsc_error (`MCU3.rdpctl.rdpctl_dsc_error),
			      .rdpctl_dsu_error (`MCU3.rdpctl.rdpctl_dsu_error),
			      .rdpctl_dbu_error (`MCU3.rdpctl.rdpctl_dbu_error),
			      .rdpctl_meb_error (`MCU3.rdpctl.rdpctl_meb_error),
			      .rdpctl_fbu_error (`MCU3.rdpctl.rdpctl_fbu_error),
			      .rdpctl_fbr_error (`MCU3.rdpctl.rdpctl_fbr_error)
			      );

`endif //  `ifdef AXIS_TL

`ifndef AXIS_TL
`ifdef AXIS_FBDIMM_NO_FSR
reg ref_dram_3x_clk_reg;
integer ref_dram_3x_clk_period;
integer time1_r2, time2_r2;

// ---- Clock Generator for FBD Channel clock ; dr_clk X 3 (linkclk) -----
initial
begin
  ref_dram_3x_clk_reg=0;
  @ (posedge `CCU.ccu_rst_sync_stable);
  @ (posedge sysclk);
   time1_r2=$realtime;
  @ (posedge sysclk);
   time2_r2=$realtime;
  if ($test$plusargs("DTM_ENABLED"))
    ref_dram_3x_clk_period=(time2_r2-time1_r2)/(3);
  else
    ref_dram_3x_clk_period=(time2_r2-time1_r2)/(3*2);
  forever begin #(ref_dram_3x_clk_period/2) ref_dram_3x_clk_reg = ~ref_dram_3x_clk_reg; end
end

  assign dram_3x_clk = ref_dram_3x_clk_reg ;

reg ref_dram_2x_clk_reg;
integer ref_dram_2x_clk_period;
integer time1_r3, time2_r3;

// ---- Clock Generator for FBD Channel clock ; dr_clk X 2 (linkclk) -----
initial
begin
  ref_dram_2x_clk_reg=0;
  @ (posedge `CCU.ccu_rst_sync_stable);
  @ (posedge sysclk);
   time1_r3=$realtime;
  @ (posedge sysclk);
   time2_r3=$realtime;
  if ($test$plusargs("DTM_ENABLED"))
    ref_dram_2x_clk_period=(time2_r3-time1_r3)/(2);
  else
    ref_dram_2x_clk_period=(time2_r3-time1_r3)/(2*2);
  forever begin #(ref_dram_2x_clk_period/2) ref_dram_2x_clk_reg = ~ref_dram_2x_clk_reg; end
end

  assign dram_2x_clk = ref_dram_2x_clk_reg ;
`endif
`endif //not AXIS_TL

