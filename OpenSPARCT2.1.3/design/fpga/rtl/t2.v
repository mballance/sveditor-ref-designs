// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: t2.v
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
`timescale 1 ns / 100 ps
module t2(sys_interrupt_source_i , ccx_lstg_in, ccx_rstg_in, 
	cluster_arst_l,
	cpu_rep0_in, cpu_rep1_in,
	gclk, 
	sctag2_cpx_atom_cq, 
	sctag2_cpx_data_ca, sctag2_cpx_req_cq, sctag2_pcx_stall_pq, 
	sctag3_cpx_atom_cq, sctag3_cpx_data_ca, sctag3_cpx_req_cq, 
	sctag3_pcx_stall_pq, sctag4_cpx_atom_cq, sctag4_cpx_data_ca, 
	sctag4_cpx_req_cq, sctag4_pcx_stall_pq, sctag5_cpx_atom_cq, 
	sctag5_cpx_data_ca, sctag5_cpx_req_cq, sctag5_pcx_stall_pq, 
	sctag6_cpx_atom_cq, sctag6_cpx_data_ca, sctag6_cpx_req_cq, 
	sctag6_pcx_stall_pq, sctag7_cpx_atom_cq, sctag7_cpx_data_ca, 
	sctag7_cpx_req_cq, sctag7_pcx_stall_pq, spc1_pcx_atm_pq, 
	spc1_pcx_data_pa, spc1_pcx_req_pq, spc2_pcx_atm_pq, spc2_pcx_data_pa, 
	spc2_pcx_req_pq, spc3_pcx_atm_pq, spc3_pcx_data_pa, spc3_pcx_req_pq, 
	spc4_pcx_atm_pq, spc4_pcx_data_pa, spc4_pcx_req_pq, spc5_pcx_atm_pq, 
	spc5_pcx_data_pa, spc5_pcx_req_pq, spc6_pcx_atm_pq, spc6_pcx_data_pa, 
	spc6_pcx_req_pq, spc7_pcx_atm_pq, spc7_pcx_data_pa, spc7_pcx_req_pq, 
	tcu_aclk,
	wbm_ack_i0, wbm_ack_i1,
	wbm_ack_i8, wbm_data_i0, wbm_data_i1, wbm_data_i8, ccx_lstg_out, 
	ccx_rstg_out, cpu_rep0_out, cpu_rep1_out, cpx_io_grant_cx, 
	cpx_sctag0_grant_cx, cpx_sctag1_grant_cx, cpx_sctag2_grant_cx, 
	cpx_sctag3_grant_cx, cpx_sctag4_grant_cx, cpx_sctag5_grant_cx, 
	cpx_sctag6_grant_cx, cpx_sctag7_grant_cx, cpx_spc1_data_cx2, 
	cpx_spc2_data_cx2, cpx_spc3_data_cx2, cpx_spc4_data_cx2, 
	cpx_spc5_data_cx2, cpx_spc6_data_cx2, cpx_spc7_data_cx2, dmo_dout, 
	pcx_sctag2_atm_px1, pcx_sctag2_data_px2, pcx_sctag2_data_rdy_px1, 
	pcx_sctag3_atm_px1, pcx_sctag3_data_px2, pcx_sctag3_data_rdy_px1, 
	pcx_sctag4_atm_px1, pcx_sctag4_data_px2, pcx_sctag4_data_rdy_px1, 
	pcx_sctag5_atm_px1, pcx_sctag5_data_px2, pcx_sctag5_data_rdy_px1, 
	pcx_sctag6_atm_px1, pcx_sctag6_data_px2, pcx_sctag6_data_rdy_px1, 
	pcx_sctag7_atm_px1, pcx_sctag7_data_px2, pcx_sctag7_data_rdy_px1, 
	pcx_spc1_grant_px, pcx_spc2_grant_px, pcx_spc3_grant_px, 
	pcx_spc4_grant_px, pcx_spc5_grant_px, pcx_spc6_grant_px, 
	pcx_spc7_grant_px, scan_out, spc_core_running_status, 
	spc_dbg_instr_cmt_grp0, spc_dbg_instr_cmt_grp1, spc_efu_fuse_ddata, 
	spc_efu_fuse_dxfer_en, spc_efu_fuse_idata, spc_efu_fuse_ixfer_en, 
	spc_grant_o, spc_grant_o_8, spc_hardstop_request, spc_mbist_done, 
	spc_mbist_fail, spc_shscan_scan_out, spc_softstop_request, 
	spc_ss_complete, spc_tcu_lbist_done, spc_tcu_lbist_scan_out, 
	spc_tcu_mbist_scan_out, spc_trigger_pulse, wbm_addr_o0, wbm_addr_o1, 
	wbm_addr_o8, wbm_cycle_o0, wbm_cycle_o1, wbm_cycle_o8, wbm_data_o0, 
	wbm_data_o1, wbm_data_o8, wbm_sel_o0, wbm_sel_o1, wbm_sel_o8, 
	wbm_strobe_o0, wbm_strobe_o1, wbm_strobe_o8, wbm_we_o0, wbm_we_o1, 
	wbm_we_o8);

	input   [5:0]           sys_interrupt_source_i;


	input	[159:0]		ccx_lstg_in;
	input	[159:0]		ccx_rstg_in;
	input			cluster_arst_l;
	input	[191:0]		cpu_rep0_in;
	input	[191:0]		cpu_rep1_in;
	input			gclk;
	input			sctag2_cpx_atom_cq;
	input	[145:0]		sctag2_cpx_data_ca;
	input	[7:0]		sctag2_cpx_req_cq;
	input			sctag2_pcx_stall_pq;
	input			sctag3_cpx_atom_cq;
	input	[145:0]		sctag3_cpx_data_ca;
	input	[7:0]		sctag3_cpx_req_cq;
	input			sctag3_pcx_stall_pq;
	input			sctag4_cpx_atom_cq;
	input	[145:0]		sctag4_cpx_data_ca;
	input	[7:0]		sctag4_cpx_req_cq;
	input			sctag4_pcx_stall_pq;
	input			sctag5_cpx_atom_cq;
	input	[145:0]		sctag5_cpx_data_ca;
	input	[7:0]		sctag5_cpx_req_cq;
	input			sctag5_pcx_stall_pq;
	input			sctag6_cpx_atom_cq;
	input	[145:0]		sctag6_cpx_data_ca;
	input	[7:0]		sctag6_cpx_req_cq;
	input			sctag6_pcx_stall_pq;
	input			sctag7_cpx_atom_cq;
	input	[145:0]		sctag7_cpx_data_ca;
	input	[7:0]		sctag7_cpx_req_cq;
	input			sctag7_pcx_stall_pq;
	input	[8:0]		spc1_pcx_atm_pq;
	input	[129:0]		spc1_pcx_data_pa;
	input	[8:0]		spc1_pcx_req_pq;
	input	[8:0]		spc2_pcx_atm_pq;
	input	[129:0]		spc2_pcx_data_pa;
	input	[8:0]		spc2_pcx_req_pq;
	input	[8:0]		spc3_pcx_atm_pq;
	input	[129:0]		spc3_pcx_data_pa;
	input	[8:0]		spc3_pcx_req_pq;
	input	[8:0]		spc4_pcx_atm_pq;
	input	[129:0]		spc4_pcx_data_pa;
	input	[8:0]		spc4_pcx_req_pq;
	input	[8:0]		spc5_pcx_atm_pq;
	input	[129:0]		spc5_pcx_data_pa;
	input	[8:0]		spc5_pcx_req_pq;
	input	[8:0]		spc6_pcx_atm_pq;
	input	[129:0]		spc6_pcx_data_pa;
	input	[8:0]		spc6_pcx_req_pq;
	input	[8:0]		spc7_pcx_atm_pq;
	input	[129:0]		spc7_pcx_data_pa;
	input	[8:0]		spc7_pcx_req_pq;
	input			tcu_aclk;
	input			wbm_ack_i0;
	input			wbm_ack_i1;
	input			wbm_ack_i8;
	input	[(64 - 1):0]	wbm_data_i0;
	input	[(64 - 1):0]	wbm_data_i1;
	input	[(64 - 1):0]	wbm_data_i8;
	output	[159:0]		ccx_lstg_out;
	output	[159:0]		ccx_rstg_out;
	output	[191:0]		cpu_rep0_out;
	output	[191:0]		cpu_rep1_out;
	output	[7:0]		cpx_io_grant_cx;
	output	[7:0]		cpx_sctag0_grant_cx;
	output	[7:0]		cpx_sctag1_grant_cx;
	output	[7:0]		cpx_sctag2_grant_cx;
	output	[7:0]		cpx_sctag3_grant_cx;
	output	[7:0]		cpx_sctag4_grant_cx;
	output	[7:0]		cpx_sctag5_grant_cx;
	output	[7:0]		cpx_sctag6_grant_cx;
	output	[7:0]		cpx_sctag7_grant_cx;
	output	[145:0]		cpx_spc1_data_cx2;
	output	[145:0]		cpx_spc2_data_cx2;
	output	[145:0]		cpx_spc3_data_cx2;
	output	[145:0]		cpx_spc4_data_cx2;
	output	[145:0]		cpx_spc5_data_cx2;
	output	[145:0]		cpx_spc6_data_cx2;
	output	[145:0]		cpx_spc7_data_cx2;
	output	[35:0]		dmo_dout;
	output			pcx_sctag2_atm_px1;
	output	[129:0]		pcx_sctag2_data_px2;
	output			pcx_sctag2_data_rdy_px1;
	output			pcx_sctag3_atm_px1;
	output	[129:0]		pcx_sctag3_data_px2;
	output			pcx_sctag3_data_rdy_px1;
	output			pcx_sctag4_atm_px1;
	output	[129:0]		pcx_sctag4_data_px2;
	output			pcx_sctag4_data_rdy_px1;
	output			pcx_sctag5_atm_px1;
	output	[129:0]		pcx_sctag5_data_px2;
	output			pcx_sctag5_data_rdy_px1;
	output			pcx_sctag6_atm_px1;
	output	[129:0]		pcx_sctag6_data_px2;
	output			pcx_sctag6_data_rdy_px1;
	output			pcx_sctag7_atm_px1;
	output	[129:0]		pcx_sctag7_data_px2;
	output			pcx_sctag7_data_rdy_px1;
	output	[8:0]		pcx_spc1_grant_px;
	output	[8:0]		pcx_spc2_grant_px;
	output	[8:0]		pcx_spc3_grant_px;
	output	[8:0]		pcx_spc4_grant_px;
	output	[8:0]		pcx_spc5_grant_px;
	output	[8:0]		pcx_spc6_grant_px;
	output	[8:0]		pcx_spc7_grant_px;
	output	[1:0]		scan_out;
	output	[7:0]		spc_core_running_status;
	output	[1:0]		spc_dbg_instr_cmt_grp0;
	output	[1:0]		spc_dbg_instr_cmt_grp1;
	output			spc_efu_fuse_ddata;
	output			spc_efu_fuse_dxfer_en;
	output			spc_efu_fuse_idata;
	output			spc_efu_fuse_ixfer_en;
	output	[4:0]		spc_grant_o;
	output			spc_grant_o_8;
	output			spc_hardstop_request;
	output			spc_mbist_done;
	output			spc_mbist_fail;
	output			spc_shscan_scan_out;
	output			spc_softstop_request;
	output			spc_ss_complete;
	output			spc_tcu_lbist_done;
	output			spc_tcu_lbist_scan_out;
	output			spc_tcu_mbist_scan_out;
	output			spc_trigger_pulse;
	output	[(64 - 1):0]	wbm_addr_o0;
	output	[(64 - 1):0]	wbm_addr_o1;
	output	[(64 - 1):0]	wbm_addr_o8;
	output			wbm_cycle_o0;
	output			wbm_cycle_o1;
	output			wbm_cycle_o8;
	output	[(64 - 1):0]	wbm_data_o0;
	output	[(64 - 1):0]	wbm_data_o1;
	output	[(64 - 1):0]	wbm_data_o8;
	output	[((64 / 8) - 1):0]
				wbm_sel_o0;
	output	[((64 / 8) - 1):0]
				wbm_sel_o1;
	output	[((64 / 8) - 1):0]
				wbm_sel_o8;
	output			wbm_strobe_o0;
	output			wbm_strobe_o1;
	output			wbm_strobe_o8;
	output			wbm_we_o0;
	output			wbm_we_o1;
	output			wbm_we_o8;

	wire	[145:0]		cpx_spc0_data_cx2;
	wire	[145:0]		io_cpx_data_ca;
	wire	[7:0]		io_cpx_req_cq;
	wire			io_pcx_stall_pq;
	wire	[129:0]		pcx_fpio_data_px2;
	wire			pcx_sctag0_atm_px1;
	wire			pcx_sctag0_data_rdy_px1;
	wire			pcx_sctag1_atm_px1;
	wire			pcx_sctag1_data_rdy_px1;
	wire	[8:0]		pcx_spc0_grant_px;
	wire			sctag0_pcx_stall_pq;
	wire			sctag1_pcx_stall_pq;
	wire	[8:0]		spc0_pcx_atm_pq;
	wire	[129:0]		spc0_pcx_data_pa;
	wire	[8:0]		spc0_pcx_req_pq;
	wire	[145:0]		spc_packetin_o_0;
	wire	[145:0]		spc_packetin_o_1;
	wire	[129:0]		spc_packetout_i_0;
	wire	[129:0]		spc_packetout_i_1;
	wire			spc_ready_o_0;
	wire			spc_ready_o_1;
	wire			spc_req_i_8;

//. 
	//. wire 	[5:0]	sys_interrupt_source_i = 6'h0 ;
	wire 		tcu_clk_stop = 0;
	wire 		tcu_dectest = 1;
	wire 		tcu_muxtest = 1;
	wire tcu_array_wr_inhibit = 0;
	wire tcu_se_scancollar_in = 0;
	wire tcu_se_scancollar_out = 0;
	wire rst_wmr_protect = 0;
	wire tcu_shscan_pce_ov = 0;
	wire tcu_shscan_clk_stop = 0;
	wire tcu_shscan_aclk = 0;
	wire tcu_shscan_bclk = 0;
	wire tcu_shscan_scan_in = 0;
	wire tcu_shscan_scan_en = 0;
	wire [2:0]      tcu_shscanid = 0;
	wire tcu_spc_mbist_scan_in = 0;
	wire tcu_mbist_bisi_en = 0;
	wire tcu_spc_mbist_start = 0;
	wire tcu_mbist_user_mode = 0;
	wire [2:0]      const_cpuid = 0;
	wire tcu_ss_mode = 0;
	wire tcu_do_mode = 0;
	wire tcu_ss_request = 0;
	wire ncu_cmp_tick_enable = 1;
	wire ncu_wmr_vec_mask = 1;
	wire ncu_spc_pm = 1;
	wire ncu_spc_ba01 = 1;
	wire ncu_spc_ba23 = 0;
	wire ncu_spc_ba45 = 0;
	wire ncu_spc_ba67 = 0;
	wire efu_spc_fuse_data = 0;
	wire efu_spc_fuse_ixfer_en = 0;
	wire efu_spc_fuse_dxfer_en = 0;
	wire efu_spc_fuse_iclr = 0;
	wire efu_spc_fuse_dclr = 0;
	wire vnw_ary0 = 1;
	wire vnw_ary1 = 1;
	wire tcu_spc_lbist_start = 0;
	wire tcu_spc_lbist_scan_in = 0;
	wire tcu_spc_lbist_pgm = 0;
	wire tcu_spc_test_mode = 0;
	wire [35:0]     dmo_din = 36'b0;
	wire dmo_coresel = 0;
	wire dmo_icmuxctl = 0;
	wire dmo_dcmuxctl = 0;
	wire ncu_spc_l2_idx_hash_en = 0;
	wire [7:0]      tcu_core_running = 8'b1;
	wire [2:0]      power_throttle = 0;
	wire [3:0]      hver_mask_minor_rev = 0;
	wire ccu_slow_cmp_sync_en = 1;
	wire ccu_cmp_slow_sync_en = 1;
	wire cmp_gclk_c2_ccx_left = gclk;
	wire cmp_gclk_c2_ccx_right = gclk;
	wire [1:0] scan_in = 0;
	wire tcu_pce_ov = 0;
	wire gl_ccx_clk_stop_left = 0;
	wire gl_ccx_clk_stop_right = 0;
	wire tcu_bclk = 0;
	wire tcu_scan_en = 0;
	wire tcu_atpg_mode = 0;


	spc spc(
		.gclk				(gclk), 
		.scan_in			(scan_in[1:0]), 
		.tcu_pce_ov			(tcu_pce_ov), 
		.tcu_clk_stop			(tcu_clk_stop), 
		.tcu_aclk			(tcu_aclk), 
		.tcu_bclk			(tcu_bclk), 
		.tcu_dectest			(tcu_dectest), 
		.tcu_muxtest			(tcu_muxtest), 
		.tcu_scan_en			(tcu_scan_en), 
		.tcu_array_wr_inhibit		(tcu_array_wr_inhibit), 
		.tcu_se_scancollar_in		(tcu_se_scancollar_in), 
		.tcu_se_scancollar_out		(tcu_se_scancollar_out), 
		.tcu_atpg_mode			(tcu_atpg_mode), 
		.rst_wmr_protect		(rst_wmr_protect), 
		.scan_out			(), 
		.tcu_shscan_pce_ov		(tcu_shscan_pce_ov), 
		.tcu_shscan_clk_stop		(tcu_shscan_clk_stop), 
		.tcu_shscan_aclk		(tcu_shscan_aclk), 
		.tcu_shscan_bclk		(tcu_shscan_bclk), 
		.tcu_shscan_scan_in		(tcu_shscan_scan_in), 
		.tcu_shscan_scan_en		(tcu_shscan_scan_en), 
		.tcu_shscanid			(tcu_shscanid[2:0]), 
		.spc_shscan_scan_out		(spc_shscan_scan_out), 
		.cluster_arst_l			(cluster_arst_l), 
		.tcu_spc_mbist_scan_in		(tcu_spc_mbist_scan_in), 
		.tcu_mbist_bisi_en		(tcu_mbist_bisi_en), 
		.tcu_spc_mbist_start		(tcu_spc_mbist_start), 
		.tcu_mbist_user_mode		(tcu_mbist_user_mode), 
		.spc_mbist_fail			(spc_mbist_fail), 
		.spc_mbist_done			(spc_mbist_done), 
		.spc_tcu_mbist_scan_out		(spc_tcu_mbist_scan_out), 
		.const_cpuid			(const_cpuid[2:0]), 
		.tcu_ss_mode			(tcu_ss_mode), 
		.tcu_do_mode			(tcu_do_mode), 
		.tcu_ss_request			(tcu_ss_request), 
		.ncu_cmp_tick_enable		(ncu_cmp_tick_enable), 
		.spc_ss_complete		(spc_ss_complete), 
		.ncu_wmr_vec_mask		(ncu_wmr_vec_mask), 
		.spc_hardstop_request		(spc_hardstop_request), 
		.spc_softstop_request		(spc_softstop_request), 
		.spc_trigger_pulse		(spc_trigger_pulse), 
		.ncu_spc_pm			(ncu_spc_pm), 
		.ncu_spc_ba01			(ncu_spc_ba01), 
		.ncu_spc_ba23			(ncu_spc_ba23), 
		.ncu_spc_ba45			(ncu_spc_ba45), 
		.ncu_spc_ba67			(ncu_spc_ba67), 
		.efu_spc_fuse_data		(efu_spc_fuse_data), 
		.efu_spc_fuse_ixfer_en		(efu_spc_fuse_ixfer_en), 
		.efu_spc_fuse_dxfer_en		(efu_spc_fuse_dxfer_en), 
		.efu_spc_fuse_iclr		(efu_spc_fuse_iclr), 
		.efu_spc_fuse_dclr		(efu_spc_fuse_dclr), 
		.spc_efu_fuse_ddata		(spc_efu_fuse_ddata), 
		.spc_efu_fuse_idata		(spc_efu_fuse_idata), 
		.spc_efu_fuse_ixfer_en		(spc_efu_fuse_ixfer_en), 
		.spc_efu_fuse_dxfer_en		(spc_efu_fuse_dxfer_en), 
		.vnw_ary0			(vnw_ary0), 
		.vnw_ary1			(vnw_ary1), 
		.tcu_spc_lbist_start		(tcu_spc_lbist_start), 
		.tcu_spc_lbist_scan_in		(tcu_spc_lbist_scan_in), 
		.tcu_spc_lbist_pgm		(tcu_spc_lbist_pgm), 
		.tcu_spc_test_mode		(tcu_spc_test_mode), 
		.spc_tcu_lbist_done		(spc_tcu_lbist_done), 
		.spc_tcu_lbist_scan_out		(spc_tcu_lbist_scan_out), 
		.dmo_din			(dmo_din[35:0]), 
		.dmo_coresel			(dmo_coresel), 
		.dmo_icmuxctl			(dmo_icmuxctl), 
		.dmo_dcmuxctl			(dmo_dcmuxctl), 
		.dmo_dout			(dmo_dout[35:0]), 
		.ncu_spc_l2_idx_hash_en		(ncu_spc_l2_idx_hash_en), 
		.cpx_spc_data_cx		(cpx_spc0_data_cx2), 
		.pcx_spc_grant_px		(pcx_spc0_grant_px), 
		.spc_pcx_req_pq			(spc0_pcx_req_pq), 
		.spc_pcx_atm_pq			(spc0_pcx_atm_pq), 
		.spc_pcx_data_pa		(spc0_pcx_data_pa), 
		.tcu_core_running		(tcu_core_running[7:0]), 
		.spc_core_running_status	(spc_core_running_status[7:0]), 
		.power_throttle			(power_throttle[2:0]), 
		.spc_dbg_instr_cmt_grp0		(spc_dbg_instr_cmt_grp0[1:0]), 
		.spc_dbg_instr_cmt_grp1		(spc_dbg_instr_cmt_grp1[1:0]), 
		.hver_mask_minor_rev		(hver_mask_minor_rev[3:0]), 
		.ccu_slow_cmp_sync_en		(ccu_slow_cmp_sync_en), 
		.ccu_cmp_slow_sync_en		(ccu_cmp_slow_sync_en));
	spc2wbm spc2wbm0(
		.sys_clock_i			(gclk), 
		.sys_reset_i			((~cluster_arst_l)), 
		.sys_interrupt_source_i		(sys_interrupt_source_i[5:0]), 
		.spc_req_i			({4'h0,pcx_sctag0_data_rdy_px1}), 
		.spc_atom_i			(pcx_sctag0_atm_px1), 
		.spc_packetout_i		(spc_packetout_i_0[129:0]), 
		.wbm_ack_i			(wbm_ack_i0), 
		.wbm_data_i			(wbm_data_i0[(64 - 1):0]), 
		.spc_grant_o			(spc_grant_o[4:0]), 
		.spc_ready_o			(spc_ready_o_0), 
		.spc_packetin_o			(spc_packetin_o_0[145:0]), 
		.spc_stallreq_o			(sctag0_pcx_stall_pq), 
		.wbm_cycle_o			(wbm_cycle_o0), 
		.wbm_strobe_o			(wbm_strobe_o0), 
		.wbm_we_o			(wbm_we_o0), 
		.wbm_addr_o			(wbm_addr_o0[(64 - 1):0]), 
		.wbm_data_o			(wbm_data_o0[(64 - 1):0]), 
		.wbm_sel_o			(wbm_sel_o0[((64 / 8) - 1):0]));
	spc2wbm spc2wbm1(
		.sys_clock_i			(gclk), 
		.sys_reset_i			((~cluster_arst_l)), 
		.sys_interrupt_source_i		(sys_interrupt_source_i[5:0]), 
		.spc_req_i			({4'h0,pcx_sctag1_data_rdy_px1}), 
		.spc_atom_i			(pcx_sctag1_atm_px1), 
		.spc_packetout_i		(spc_packetout_i_1[129:0]), 
		.wbm_ack_i			(wbm_ack_i1), 
		.wbm_data_i			(wbm_data_i1[(64 - 1):0]), 
		.spc_grant_o			(), 
		.spc_ready_o			(spc_ready_o_1), 
		.spc_packetin_o			(spc_packetin_o_1[145:0]), 
		.spc_stallreq_o			(sctag1_pcx_stall_pq), 
		.wbm_cycle_o			(wbm_cycle_o1), 
		.wbm_strobe_o			(wbm_strobe_o1), 
		.wbm_we_o			(wbm_we_o1), 
		.wbm_addr_o			(wbm_addr_o1[(64 - 1):0]), 
		.wbm_data_o			(wbm_data_o1[(64 - 1):0]), 
		.wbm_sel_o			(wbm_sel_o1[((64 / 8) - 1):0]));
	spc2wbm spc2wbm_ncu(
		.sys_clock_i			(gclk), 
		.sys_reset_i			((~cluster_arst_l)), 
		.sys_interrupt_source_i		(sys_interrupt_source_i[5:0]), 
		.spc_req_i			({4'h0,spc_req_i_8}), 
		.spc_atom_i			(1'b0), 
		.spc_packetout_i		(pcx_fpio_data_px2), 
		.wbm_ack_i			(wbm_ack_i8), 
		.wbm_data_i			(wbm_data_i8[(64 - 1):0]), 
		.spc_grant_o			(spc_grant_o_8), 
		.spc_ready_o			(io_cpx_req_cq), 
		.spc_packetin_o			(io_cpx_data_ca), 
		.spc_stallreq_o			(io_pcx_stall_pq), 
		.wbm_cycle_o			(wbm_cycle_o8), 
		.wbm_strobe_o			(wbm_strobe_o8), 
		.wbm_we_o			(wbm_we_o8), 
		.wbm_addr_o			(wbm_addr_o8[(64 - 1):0]), 
		.wbm_data_o			(wbm_data_o8[(64 - 1):0]), 
		.wbm_sel_o			(wbm_sel_o8[((64 / 8) - 1):0]));
	ccx ccx(
		.cmp_gclk_c2_ccx_left		(cmp_gclk_c2_ccx_left), 
		.cmp_gclk_c2_ccx_right		(cmp_gclk_c2_ccx_right), 
		.scan_in			(scan_in[1:0]), 
		.tcu_pce_ov			(tcu_pce_ov), 
		.gl_ccx_clk_stop_left		(gl_ccx_clk_stop_left), 
		.gl_ccx_clk_stop_right		(gl_ccx_clk_stop_right), 
		.tcu_aclk			(tcu_aclk), 
		.tcu_bclk			(tcu_bclk), 
		.tcu_scan_en			(tcu_scan_en), 
		.cluster_arst_l			(cluster_arst_l), 
		.tcu_atpg_mode			(tcu_atpg_mode), 
		.scan_out			(), 
		.cpu_rep0_in			(cpu_rep0_in[191:0]), 
		.cpu_rep0_out			(cpu_rep0_out[191:0]), 
		.cpu_rep1_in			(cpu_rep1_in[191:0]), 
		.cpu_rep1_out			(cpu_rep1_out[191:0]), 
		.ccx_lstg_in			(ccx_lstg_in[159:0]), 
		.ccx_lstg_out			(ccx_lstg_out[159:0]), 
		.ccx_rstg_in			(ccx_rstg_in[159:0]), 
		.ccx_rstg_out			(ccx_rstg_out[159:0]), 
		.spc0_pcx_data_pa		(spc0_pcx_data_pa[129:0]), 
		.spc0_pcx_req_pq		(spc0_pcx_req_pq[8:0]), 
		.spc0_pcx_atm_pq		(spc0_pcx_atm_pq[8:0]), 
		.spc1_pcx_data_pa		(spc1_pcx_data_pa[129:0]), 
		.spc1_pcx_req_pq		(spc1_pcx_req_pq[8:0]), 
		.spc1_pcx_atm_pq		(spc1_pcx_atm_pq[8:0]), 
		.spc2_pcx_data_pa		(spc2_pcx_data_pa[129:0]), 
		.spc2_pcx_req_pq		(spc2_pcx_req_pq[8:0]), 
		.spc2_pcx_atm_pq		(spc2_pcx_atm_pq[8:0]), 
		.spc3_pcx_data_pa		(spc3_pcx_data_pa[129:0]), 
		.spc3_pcx_req_pq		(spc3_pcx_req_pq[8:0]), 
		.spc3_pcx_atm_pq		(spc3_pcx_atm_pq[8:0]), 
		.spc4_pcx_data_pa		(spc4_pcx_data_pa[129:0]), 
		.spc4_pcx_req_pq		(spc4_pcx_req_pq[8:0]), 
		.spc4_pcx_atm_pq		(spc4_pcx_atm_pq[8:0]), 
		.spc5_pcx_data_pa		(spc5_pcx_data_pa[129:0]), 
		.spc5_pcx_req_pq		(spc5_pcx_req_pq[8:0]), 
		.spc5_pcx_atm_pq		(spc5_pcx_atm_pq[8:0]), 
		.spc6_pcx_data_pa		(spc6_pcx_data_pa[129:0]), 
		.spc6_pcx_req_pq		(spc6_pcx_req_pq[8:0]), 
		.spc6_pcx_atm_pq		(spc6_pcx_atm_pq[8:0]), 
		.spc7_pcx_data_pa		(spc7_pcx_data_pa[129:0]), 
		.spc7_pcx_req_pq		(spc7_pcx_req_pq[8:0]), 
		.spc7_pcx_atm_pq		(spc7_pcx_atm_pq[8:0]), 
		.io_pcx_stall_pq		(io_pcx_stall_pq), 
		.sctag0_pcx_stall_pq		(sctag0_pcx_stall_pq), 
		.sctag1_pcx_stall_pq		(sctag1_pcx_stall_pq), 
		.sctag2_pcx_stall_pq		(sctag2_pcx_stall_pq), 
		.sctag3_pcx_stall_pq		(sctag3_pcx_stall_pq), 
		.sctag4_pcx_stall_pq		(sctag4_pcx_stall_pq), 
		.sctag5_pcx_stall_pq		(sctag5_pcx_stall_pq), 
		.sctag6_pcx_stall_pq		(sctag6_pcx_stall_pq), 
		.sctag7_pcx_stall_pq		(sctag7_pcx_stall_pq), 
		.pcx_spc0_grant_px		(pcx_spc0_grant_px[8:0]), 
		.pcx_spc1_grant_px		(pcx_spc1_grant_px[8:0]), 
		.pcx_spc2_grant_px		(pcx_spc2_grant_px[8:0]), 
		.pcx_spc3_grant_px		(pcx_spc3_grant_px[8:0]), 
		.pcx_spc4_grant_px		(pcx_spc4_grant_px[8:0]), 
		.pcx_spc5_grant_px		(pcx_spc5_grant_px[8:0]), 
		.pcx_spc6_grant_px		(pcx_spc6_grant_px[8:0]), 
		.pcx_spc7_grant_px		(pcx_spc7_grant_px[8:0]), 
		.pcx_fpio_data_px2		(pcx_fpio_data_px2[129:0]), 
		.pcx_fpio_data_rdy_px1		(spc_req_i_8), 
		.pcx_sctag0_atm_px1		(pcx_sctag0_atm_px1), 
		.pcx_sctag0_data_px2		(spc_packetout_i_0[129:0]), 
		.pcx_sctag0_data_rdy_px1	(pcx_sctag0_data_rdy_px1), 
		.pcx_sctag1_atm_px1		(pcx_sctag1_atm_px1), 
		.pcx_sctag1_data_px2		(spc_packetout_i_1[129:0]), 
		.pcx_sctag1_data_rdy_px1	(pcx_sctag1_data_rdy_px1), 
		.pcx_sctag2_atm_px1		(pcx_sctag2_atm_px1), 
		.pcx_sctag2_data_px2		(pcx_sctag2_data_px2[129:0]), 
		.pcx_sctag2_data_rdy_px1	(pcx_sctag2_data_rdy_px1), 
		.pcx_sctag3_atm_px1		(pcx_sctag3_atm_px1), 
		.pcx_sctag3_data_px2		(pcx_sctag3_data_px2[129:0]), 
		.pcx_sctag3_data_rdy_px1	(pcx_sctag3_data_rdy_px1), 
		.pcx_sctag4_atm_px1		(pcx_sctag4_atm_px1), 
		.pcx_sctag4_data_px2		(pcx_sctag4_data_px2[129:0]), 
		.pcx_sctag4_data_rdy_px1	(pcx_sctag4_data_rdy_px1), 
		.pcx_sctag5_atm_px1		(pcx_sctag5_atm_px1), 
		.pcx_sctag5_data_px2		(pcx_sctag5_data_px2[129:0]), 
		.pcx_sctag5_data_rdy_px1	(pcx_sctag5_data_rdy_px1), 
		.pcx_sctag6_atm_px1		(pcx_sctag6_atm_px1), 
		.pcx_sctag6_data_px2		(pcx_sctag6_data_px2[129:0]), 
		.pcx_sctag6_data_rdy_px1	(pcx_sctag6_data_rdy_px1), 
		.pcx_sctag7_atm_px1		(pcx_sctag7_atm_px1), 
		.pcx_sctag7_data_px2		(pcx_sctag7_data_px2[129:0]), 
		.pcx_sctag7_data_rdy_px1	(pcx_sctag7_data_rdy_px1), 
		.io_cpx_data_ca			(io_cpx_data_ca[145:0]), 
		.io_cpx_req_cq			(io_cpx_req_cq[7:0]), 
		.sctag0_cpx_atom_cq		(1'b0), 
		.sctag0_cpx_data_ca		(spc_packetin_o_0[145:0]), 
		.sctag0_cpx_req_cq		(spc_ready_o_0), 
		.sctag1_cpx_atom_cq		(1'b0), 
		.sctag1_cpx_data_ca		(spc_packetin_o_1[145:0]), 
		.sctag1_cpx_req_cq		(spc_ready_o_1), 
		.sctag2_cpx_atom_cq		(sctag2_cpx_atom_cq), 
		.sctag2_cpx_data_ca		(sctag2_cpx_data_ca[145:0]), 
		.sctag2_cpx_req_cq		(sctag2_cpx_req_cq[7:0]), 
		.sctag3_cpx_atom_cq		(sctag3_cpx_atom_cq), 
		.sctag3_cpx_data_ca		(sctag3_cpx_data_ca[145:0]), 
		.sctag3_cpx_req_cq		(sctag3_cpx_req_cq[7:0]), 
		.sctag4_cpx_atom_cq		(sctag4_cpx_atom_cq), 
		.sctag4_cpx_data_ca		(sctag4_cpx_data_ca[145:0]), 
		.sctag4_cpx_req_cq		(sctag4_cpx_req_cq[7:0]), 
		.sctag5_cpx_atom_cq		(sctag5_cpx_atom_cq), 
		.sctag5_cpx_data_ca		(sctag5_cpx_data_ca[145:0]), 
		.sctag5_cpx_req_cq		(sctag5_cpx_req_cq[7:0]), 
		.sctag6_cpx_atom_cq		(sctag6_cpx_atom_cq), 
		.sctag6_cpx_data_ca		(sctag6_cpx_data_ca[145:0]), 
		.sctag6_cpx_req_cq		(sctag6_cpx_req_cq[7:0]), 
		.sctag7_cpx_atom_cq		(sctag7_cpx_atom_cq), 
		.sctag7_cpx_data_ca		(sctag7_cpx_data_ca[145:0]), 
		.sctag7_cpx_req_cq		(sctag7_cpx_req_cq[7:0]), 
		.cpx_io_grant_cx		(cpx_io_grant_cx[7:0]), 
		.cpx_sctag0_grant_cx		(cpx_sctag0_grant_cx[7:0]), 
		.cpx_sctag1_grant_cx		(cpx_sctag1_grant_cx[7:0]), 
		.cpx_sctag2_grant_cx		(cpx_sctag2_grant_cx[7:0]), 
		.cpx_sctag3_grant_cx		(cpx_sctag3_grant_cx[7:0]), 
		.cpx_sctag4_grant_cx		(cpx_sctag4_grant_cx[7:0]), 
		.cpx_sctag5_grant_cx		(cpx_sctag5_grant_cx[7:0]), 
		.cpx_sctag6_grant_cx		(cpx_sctag6_grant_cx[7:0]), 
		.cpx_sctag7_grant_cx		(cpx_sctag7_grant_cx[7:0]), 
		.cpx_spc0_data_cx2		(cpx_spc0_data_cx2[145:0]), 
		.cpx_spc1_data_cx2		(cpx_spc1_data_cx2[145:0]), 
		.cpx_spc2_data_cx2		(cpx_spc2_data_cx2[145:0]), 
		.cpx_spc3_data_cx2		(cpx_spc3_data_cx2[145:0]), 
		.cpx_spc4_data_cx2		(cpx_spc4_data_cx2[145:0]), 
		.cpx_spc5_data_cx2		(cpx_spc5_data_cx2[145:0]), 
		.cpx_spc6_data_cx2		(cpx_spc6_data_cx2[145:0]), 
		.cpx_spc7_data_cx2		(cpx_spc7_data_cx2[145:0]));
endmodule

