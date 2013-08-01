// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: t2_fpga.v
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
module t2_fpga(
         clk, 
            cts_pad_i, 
         dsr_pad_i, 
        efu_spc_fuse_ixfer_en, 
         ri_pad_i, 
         srx_pad_i, sys_interrupt_source_i,
            wbm_ack_i8, wbm_adr_uart, wbm_cycle_nc_not_uart,
        wbm_cycle_uart, wbm_data_i8, wbm_data_uart_i, wbm_sel_uart,
        wbm_strobe_nc_not_uart, wbm_strobe_uart,
         cpx_io_grant_cx, cpx_sctag0_grant_cx,
        cpx_sctag1_grant_cx, cpx_sctag2_grant_cx, cpx_sctag3_grant_cx,
        cpx_sctag4_grant_cx, cpx_sctag5_grant_cx, cpx_sctag6_grant_cx,
        cpx_sctag7_grant_cx,
        dmo_dout, dtr_pad_o, int_o,
        pcx_spc1_grant_px, pcx_spc2_grant_px, pcx_spc3_grant_px,
        pcx_spc4_grant_px, pcx_spc5_grant_px, pcx_spc6_grant_px,
        pcx_spc7_grant_px, rts_pad_o, 
        spc_core_running_status,
        spc_dbg_instr_cmt_grp0, spc_dbg_instr_cmt_grp1, spc_efu_fuse_ddata,
        spc_efu_fuse_dxfer_en, spc_efu_fuse_idata, spc_efu_fuse_ixfer_en,
        spc_grant_o, spc_grant_o_8, spc_hardstop_request, spc_mbist_done,
        spc_mbist_fail, spc_shscan_scan_out, spc_softstop_request,
        spc_ss_complete, spc_tcu_lbist_done, spc_tcu_lbist_scan_out,
        spc_tcu_mbist_scan_out, spc_trigger_pulse, stx_pad_o,
        wbm_ack_nc_not_uart, wbm_ack_uart, wbm_cycle_o8, wbm_data_nc_not_uart,
        wbm_data_uart, wbm_strobe_o8,
mem_harness0_wbs_addr_i ,
mem_harness1_wbs_addr_i ,
wbm_ack_i0 ,
wbm_ack_i1 ,
wbm_addr_o0 ,
wbm_addr_o1 ,
wbm_addr_o8 ,
wbm_cycle_o0 ,
wbm_cycle_o1 ,
wbm_data_i0 ,
wbm_data_i1 ,
wbm_data_o0 ,
wbm_data_o1 ,
wbm_data_o8 ,
wbm_sel_o0 ,
wbm_sel_o1 ,
wbm_sel_o8,
wbm_strobe_o0 ,
wbm_strobe_o1 ,
wbm_we_o0 ,
wbm_we_o1 
 );

        wire    [159:0]         ccx_lstg_in = 0;
        wire [159:0]            ccx_rstg_in = 0;
        input                   clk;
        wire    [191:0]         cpu_rep0_in = 0;
        wire    [191:0]         cpu_rep1_in = 0;
        input                   cts_pad_i;
        input                   dsr_pad_i;
        input                   efu_spc_fuse_ixfer_en;
        input                   ri_pad_i;
        wire                    sctag2_cpx_atom_cq = 0;
        wire    [145:0]         sctag2_cpx_data_ca = 0;
        wire    [7:0]           sctag2_cpx_req_cq = 0;
        wire                    sctag2_pcx_stall_pq = 0;
        wire                    sctag3_cpx_atom_cq = 0;
        wire    [145:0]         sctag3_cpx_data_ca = 0;
        wire    [7:0]           sctag3_cpx_req_cq = 0;
        wire                    sctag3_pcx_stall_pq = 0;
        wire                    sctag4_cpx_atom_cq = 0;
        wire    [145:0]         sctag4_cpx_data_ca = 0;
        wire    [7:0]           sctag4_cpx_req_cq = 0;
        wire                    sctag4_pcx_stall_pq = 0; 
        wire                    sctag5_cpx_atom_cq = 0;
        wire    [145:0]         sctag5_cpx_data_ca = 0;
        wire    [7:0]           sctag5_cpx_req_cq = 0;
        wire                    sctag5_pcx_stall_pq = 0;
        wire                    sctag6_cpx_atom_cq = 0;
       wire    [145:0]         sctag6_cpx_data_ca = 0;
        wire    [7:0]           sctag6_cpx_req_cq = 0;
        wire                    sctag6_pcx_stall_pq = 0;
        wire                    sctag7_cpx_atom_cq = 0;
        wire    [145:0]         sctag7_cpx_data_ca = 0;
        wire    [7:0]           sctag7_cpx_req_cq = 0;


        wire                    sctag7_pcx_stall_pq;
        wire    [8:0]           spc1_pcx_atm_pq;
        wire    [129:0]         spc1_pcx_data_pa = 0;
        wire    [8:0]           spc1_pcx_req_pq = 0;
        wire    [8:0]           spc2_pcx_atm_pq = 0;
        wire    [129:0]         spc2_pcx_data_pa = 0;
        wire    [8:0]           spc2_pcx_req_pq = 0;
        wire    [8:0]           spc3_pcx_atm_pq = 0;
        wire    [129:0]         spc3_pcx_data_pa = 0;
        wire    [8:0]           spc3_pcx_req_pq = 0;
        wire    [8:0]           spc4_pcx_atm_pq = 0;
        wire    [129:0]         spc4_pcx_data_pa = 0;
        wire    [8:0]           spc4_pcx_req_pq = 0;
        wire    [8:0]           spc5_pcx_atm_pq = 0;
        wire    [129:0]         spc5_pcx_data_pa = 0;
        wire    [8:0]           spc5_pcx_req_pq = 0;
        wire    [8:0]           spc6_pcx_atm_pq = 0;
        wire    [129:0]         spc6_pcx_data_pa = 0;
        wire    [8:0]           spc6_pcx_req_pq = 0;
        wire    [8:0]           spc7_pcx_atm_pq = 0;
        wire    [129:0]         spc7_pcx_data_pa = 0;
        wire    [8:0]           spc7_pcx_req_pq = 0;

        input                   srx_pad_i;
        input   [5:0]           sys_interrupt_source_i;
        output                  wbm_ack_i8;
        output  [(3 - 1):0]     wbm_adr_uart;
        output                  wbm_cycle_nc_not_uart;
        output                  wbm_cycle_uart;
        output  [(64 - 1):0]    wbm_data_i8;
        output  [7:0]           wbm_data_uart_i;
        input   [3:0]           wbm_sel_uart;
        output                  wbm_strobe_nc_not_uart;
        output                  wbm_strobe_uart;
        wire    [159:0]         ccx_lstg_out;
        wire    [159:0]         ccx_rstg_out;
        wire    [191:0]         cpu_rep0_out;
        wire    [191:0]         cpu_rep1_out;
        output  [7:0]           cpx_io_grant_cx;
        output  [7:0]           cpx_sctag0_grant_cx;
        output  [7:0]           cpx_sctag1_grant_cx;
        output  [7:0]           cpx_sctag2_grant_cx;
        output  [7:0]           cpx_sctag3_grant_cx;
        output  [7:0]           cpx_sctag4_grant_cx;
        output  [7:0]           cpx_sctag5_grant_cx;
        output  [7:0]           cpx_sctag6_grant_cx;
        output  [7:0]           cpx_sctag7_grant_cx;
        wire    [145:0]         cpx_spc1_data_cx2;
        wire    [145:0]         cpx_spc2_data_cx2;
        wire    [145:0]         cpx_spc3_data_cx2;
        wire    [145:0]         cpx_spc4_data_cx2;
        wire    [145:0]         cpx_spc5_data_cx2;
        wire    [145:0]         cpx_spc6_data_cx2;
        wire    [145:0]         cpx_spc7_data_cx2;
        output  [35:0]          dmo_dout;
        output                  dtr_pad_o;
        output                  int_o;
        wire                    pcx_sctag2_atm_px1;
        wire    [129:0]         pcx_sctag2_data_px2;
        wire                    pcx_sctag2_data_rdy_px1;
wire                    pcx_sctag3_atm_px1;
        wire    [129:0]         pcx_sctag3_data_px2;
        wire                    pcx_sctag3_data_rdy_px1;
        wire                    pcx_sctag4_atm_px1;
        wire    [129:0]         pcx_sctag4_data_px2;
        wire                    pcx_sctag4_data_rdy_px1;
        wire                    pcx_sctag5_atm_px1;
        wire    [129:0]         pcx_sctag5_data_px2;
        wire                    pcx_sctag5_data_rdy_px1;
        wire                    pcx_sctag6_atm_px1;
        wire    [129:0]         pcx_sctag6_data_px2;
        wire                    pcx_sctag6_data_rdy_px1;
        wire                    pcx_sctag7_atm_px1;
        wire    [129:0]         pcx_sctag7_data_px2;
        wire                    pcx_sctag7_data_rdy_px1;
        output  [8:0]           pcx_spc1_grant_px;
        output  [8:0]           pcx_spc2_grant_px;
        output  [8:0]           pcx_spc3_grant_px;
        output  [8:0]           pcx_spc4_grant_px;
        output  [8:0]           pcx_spc5_grant_px;
        output  [8:0]           pcx_spc6_grant_px;
        output  [8:0]           pcx_spc7_grant_px;
        output                  rts_pad_o;
        output  [7:0]           spc_core_running_status;
        output  [1:0]           spc_dbg_instr_cmt_grp0;
        output  [1:0]           spc_dbg_instr_cmt_grp1;
        output                  spc_efu_fuse_ddata;
        output                  spc_efu_fuse_dxfer_en;
        output                  spc_efu_fuse_idata;
        output                  spc_efu_fuse_ixfer_en;
        output  [4:0]           spc_grant_o;
        output                  spc_grant_o_8;
        output                  spc_hardstop_request;
        output                  spc_mbist_done;
        output                  spc_mbist_fail;
        output                  spc_shscan_scan_out;
        output                  spc_softstop_request;
        output                  spc_ss_complete;
        output                  spc_tcu_lbist_done;
        output                  spc_tcu_lbist_scan_out;
        output                  spc_tcu_mbist_scan_out;
        output                  spc_trigger_pulse;
        output                  stx_pad_o;
        output                  wbm_ack_nc_not_uart;
        output                  wbm_ack_uart;
        output                  wbm_cycle_o8;
     output  [(64 - 1):0]    wbm_data_nc_not_uart;
        output  [31:0]          wbm_data_uart;
        output                  wbm_strobe_o8;

        output  [63:0]          mem_harness0_wbs_addr_i ;
        output  [63:0]          mem_harness1_wbs_addr_i ;
        output                  wbm_ack_i0 ;
        output                  wbm_ack_i1 ;
        output  [(64 - 1):0]    wbm_addr_o0 ;
        output  [(64 - 1):0]    wbm_addr_o1 ;
        output  [(64 - 1):0]    wbm_addr_o8 ;
        output                  wbm_cycle_o0 ;
        output                  wbm_cycle_o1 ;
        output  [(64 - 1):0]    wbm_data_i0 ;
        output  [(64 - 1):0]    wbm_data_i1 ;
        output  [(64 - 1):0]    wbm_data_o0 ;
        output  [(64 - 1):0]    wbm_data_o1 ;
        output  [(64 - 1):0]    wbm_data_o8 ;
        output  [((64 / 8) - 1):0] wbm_sel_o0 ;
        output  [((64 / 8) - 1):0] wbm_sel_o1 ;
        output  [((64 / 8) - 1):0] wbm_sel_o8;
        output                  wbm_strobe_o0 ;
        output                  wbm_strobe_o1 ;
        output                  wbm_we_o0 ;
        output                  wbm_we_o1 ;


	wire			gclk;
	wire	[63:0]		mem_harness0_wbs_addr_i;
	wire	[63:0]		mem_harness1_wbs_addr_i;
	wire			reset;
	wire			wbm_ack_i0;
	wire			wbm_ack_i1;
	wire	[(64 - 1):0]	wbm_addr_o0;
	wire	[(64 - 1):0]	wbm_addr_o1;
	wire	[(64 - 1):0]	wbm_addr_o8;
	wire			wbm_cycle_o0;
	wire			wbm_cycle_o1;
	wire	[(64 - 1):0]	wbm_data_i0;
	wire	[(64 - 1):0]	wbm_data_i1;
	wire	[(64 - 1):0]	wbm_data_o0;
	wire	[(64 - 1):0]	wbm_data_o1;
	wire	[(64 - 1):0]	wbm_data_o8;
	wire	[((64 / 8) - 1):0]
				wbm_sel_o0;
	wire	[((64 / 8) - 1):0]
				wbm_sel_o1;
	wire	[((64 / 8) - 1):0]
				wbm_sel_o8;
	wire			wbm_strobe_o0;
	wire			wbm_strobe_o1;
	wire			wbm_we_o0;
	wire			wbm_we_o1;
	wire			wbm_we_o8;
	reg	[7:0]		count;

  `ifdef FPGA_SIM
        reg cmp_refclk ;
        assign GlobalReset = 1'b1;
          initial begin         // generate cmp ref clock (100 MHZ)
            count = 0;
            cmp_refclk = 1'b0;
        end

        initial begin         // generate cmp ref clock (100 MHZ)
           #7;
         forever #(100) cmp_refclk = ~cmp_refclk;
        end
`else
        wire                    cmp_refclk;
`endif

	wire			clk1;
	wire			clk2;
	reg	[7:0]		uart_dat;
	reg	[2:0]		adr_uart;
	reg			rst;

        assign gclk = clk;


		// synopsys translate_off
                assign sys_interrupt_source_i = 6'h0 ;

		defparam mem_harness0.memfilename	= "memory0.hex";
		defparam mem_harness1.memfilename	= "memory1.hex";
		defparam mem_harness2.initmem		= 1;
		defparam mem_harness2.loadmem		= 1;
		defparam mem_harness2.memfilename	= "memory2.hex";
		defparam mem_harness0.addr_bits		= 26;
		defparam mem_harness1.addr_bits		= 26;
		defparam mem_harness2.addr_bits		= 20;
		// synopsys translate_on 

		assign mem_harness0_wbs_addr_i = {wbm_addr_o0[(64 - 1):7], 
			wbm_addr_o0[5:0]};
		assign mem_harness1_wbs_addr_i = {wbm_addr_o1[(64 - 1):7], 
			wbm_addr_o1[5:0]};
		assign clk = cmp_refclk;
		assign reset = rst;
		assign wbm_strobe_nc_not_uart = ((wbm_addr_o8[39:12] == 28'hfff0c2c) ? 0
			: wbm_strobe_o8);
		assign wbm_strobe_uart = ((wbm_addr_o8[39:12] == 28'hfff0c2c) ? 
			wbm_strobe_o8 : 0);
		assign wbm_cycle_nc_not_uart = ((wbm_addr_o8[39:12] == 28'hfff0c2c) ? 0
			: wbm_cycle_o8);
		assign wbm_cycle_uart = ((wbm_addr_o8[39:12] == 28'hfff0c2c) ? 
			wbm_cycle_o8 : 0);
		assign wbm_ack_i8 = (wbm_ack_nc_not_uart | wbm_ack_uart);
		assign wbm_data_i8 = (wbm_ack_nc_not_uart ? wbm_data_nc_not_uart : {8 {
			wbm_data_uart[7:0]}});
		assign wbm_data_uart_i = wbm_data_o8[7:0];
		assign wbm_adr_uart[2:0] = (wbm_sel_o8[0] ? 3'b0 : (wbm_sel_o8[1] ? 3'b1
			: (wbm_sel_o8[2] ? 3'd2 : (wbm_sel_o8[3] ? 3'd3 : (wbm_sel_o8[4]
			? 3'd4 : (wbm_sel_o8[5] ? 3'd5 : (wbm_sel_o8[6] ? 3'd6 : 3'd7)))
			))));

		t2 t2(	.ccx_lstg_in			(ccx_lstg_in[159:0]), 
			.ccx_rstg_in			(ccx_rstg_in[159:0]), 
			.cluster_arst_l			((~reset)), 
			.cpu_rep0_in			(cpu_rep0_in[191:0]), 
			.cpu_rep1_in			(cpu_rep1_in[191:0]), 
			.gclk				(clk), 
			.sctag2_cpx_atom_cq		(sctag2_cpx_atom_cq), 
			.sctag2_cpx_data_ca		(sctag2_cpx_data_ca[145:0]), 
			.sctag2_cpx_req_cq		(sctag2_cpx_req_cq[7:0]), 
			.sctag2_pcx_stall_pq		(sctag2_pcx_stall_pq), 
			.sctag3_cpx_atom_cq		(sctag3_cpx_atom_cq), 
			.sctag3_cpx_data_ca		(sctag3_cpx_data_ca[145:0]), 
			.sctag3_cpx_req_cq		(sctag3_cpx_req_cq[7:0]), 
			.sctag3_pcx_stall_pq		(sctag3_pcx_stall_pq), 
			.sctag4_cpx_atom_cq		(sctag4_cpx_atom_cq), 
			.sctag4_cpx_data_ca		(sctag4_cpx_data_ca[145:0]), 
			.sctag4_cpx_req_cq		(sctag4_cpx_req_cq[7:0]), 
			.sctag4_pcx_stall_pq		(sctag4_pcx_stall_pq), 
			.sctag5_cpx_atom_cq		(sctag5_cpx_atom_cq), 
			.sctag5_cpx_data_ca		(sctag5_cpx_data_ca[145:0]), 
			.sctag5_cpx_req_cq		(sctag5_cpx_req_cq[7:0]), 
			.sctag5_pcx_stall_pq		(sctag5_pcx_stall_pq), 
			.sctag6_cpx_atom_cq		(sctag6_cpx_atom_cq), 
			.sctag6_cpx_data_ca		(sctag6_cpx_data_ca[145:0]), 
			.sctag6_cpx_req_cq		(sctag6_cpx_req_cq[7:0]), 
			.sctag6_pcx_stall_pq		(sctag6_pcx_stall_pq), 
			.sctag7_cpx_atom_cq		(sctag7_cpx_atom_cq), 
			.sctag7_cpx_data_ca		(sctag7_cpx_data_ca[145:0]), 
			.sctag7_cpx_req_cq		(sctag7_cpx_req_cq[7:0]), 
			.sctag7_pcx_stall_pq		(sctag7_pcx_stall_pq), 
			.spc1_pcx_atm_pq		(spc1_pcx_atm_pq[8:0]), 
			.spc1_pcx_data_pa		(spc1_pcx_data_pa[129:0]), 
			.spc1_pcx_req_pq		(spc1_pcx_req_pq[8:0]), 
			.spc2_pcx_atm_pq		(spc2_pcx_atm_pq[8:0]), 
			.spc2_pcx_data_pa		(spc2_pcx_data_pa[129:0]), 
			.spc2_pcx_req_pq		(spc2_pcx_req_pq[8:0]), 
			.spc3_pcx_atm_pq		(spc3_pcx_atm_pq[8:0]), 
			.spc3_pcx_data_pa		(spc3_pcx_data_pa[129:0]), 
			.spc3_pcx_req_pq		(spc3_pcx_req_pq[8:0]), 
			.spc4_pcx_atm_pq		(spc4_pcx_atm_pq[8:0]), 
			.spc4_pcx_data_pa		(spc4_pcx_data_pa[129:0]), 
			.spc4_pcx_req_pq		(spc4_pcx_req_pq[8:0]), 
			.spc5_pcx_atm_pq		(spc5_pcx_atm_pq[8:0]), 
			.spc5_pcx_data_pa		(spc5_pcx_data_pa[129:0]), 
			.spc5_pcx_req_pq		(spc5_pcx_req_pq[8:0]), 
			.spc6_pcx_atm_pq		(spc6_pcx_atm_pq[8:0]), 
			.spc6_pcx_data_pa		(spc6_pcx_data_pa[129:0]), 
			.spc6_pcx_req_pq		(spc6_pcx_req_pq[8:0]), 
			.spc7_pcx_atm_pq		(spc7_pcx_atm_pq[8:0]), 
			.spc7_pcx_data_pa		(spc7_pcx_data_pa[129:0]), 
			.spc7_pcx_req_pq		(spc7_pcx_req_pq[8:0]), 
    			.sys_interrupt_source_i         (sys_interrupt_source_i[5:0]),	
			.tcu_aclk			(reset), 
			.wbm_ack_i0			(wbm_ack_i0), 
			.wbm_ack_i1			(wbm_ack_i1), 
			.wbm_ack_i8			(wbm_ack_i8), 
			.wbm_data_i0			(wbm_data_i0[(64 - 1):0]), 
			.wbm_data_i1			(wbm_data_i1[(64 - 1):0]), 
			.wbm_data_i8			(wbm_data_i8[(64 - 1):0]), 
			.ccx_lstg_out			(ccx_lstg_out[159:0]), 
			.ccx_rstg_out			(ccx_rstg_out[159:0]), 
			.cpu_rep0_out			(cpu_rep0_out[191:0]), 
			.cpu_rep1_out			(cpu_rep1_out[191:0]), 
			.cpx_io_grant_cx		(cpx_io_grant_cx[7:0]), 
			.cpx_sctag0_grant_cx		(cpx_sctag0_grant_cx[7:0]), 
			.cpx_sctag1_grant_cx		(cpx_sctag1_grant_cx[7:0]), 
			.cpx_sctag2_grant_cx		(cpx_sctag2_grant_cx[7:0]), 
			.cpx_sctag3_grant_cx		(cpx_sctag3_grant_cx[7:0]), 
			.cpx_sctag4_grant_cx		(cpx_sctag4_grant_cx[7:0]), 
			.cpx_sctag5_grant_cx		(cpx_sctag5_grant_cx[7:0]), 
			.cpx_sctag6_grant_cx		(cpx_sctag6_grant_cx[7:0]), 
			.cpx_sctag7_grant_cx		(cpx_sctag7_grant_cx[7:0]), 
			.cpx_spc1_data_cx2		(cpx_spc1_data_cx2[145:0]), 
			.cpx_spc2_data_cx2		(cpx_spc2_data_cx2[145:0]), 
			.cpx_spc3_data_cx2		(cpx_spc3_data_cx2[145:0]), 
			.cpx_spc4_data_cx2		(cpx_spc4_data_cx2[145:0]), 
			.cpx_spc5_data_cx2		(cpx_spc5_data_cx2[145:0]), 
			.cpx_spc6_data_cx2		(cpx_spc6_data_cx2[145:0]), 
			.cpx_spc7_data_cx2		(cpx_spc7_data_cx2[145:0]), 
			.dmo_dout			(dmo_dout[35:0]), 
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
			.pcx_spc1_grant_px		(pcx_spc1_grant_px[8:0]), 
			.pcx_spc2_grant_px		(pcx_spc2_grant_px[8:0]), 
			.pcx_spc3_grant_px		(pcx_spc3_grant_px[8:0]), 
			.pcx_spc4_grant_px		(pcx_spc4_grant_px[8:0]), 
			.pcx_spc5_grant_px		(pcx_spc5_grant_px[8:0]), 
			.pcx_spc6_grant_px		(pcx_spc6_grant_px[8:0]), 
			.pcx_spc7_grant_px		(pcx_spc7_grant_px[8:0]), 
			.scan_out			(), 
			.spc_core_running_status	(spc_core_running_status[7:0]), 
			.spc_dbg_instr_cmt_grp0		(spc_dbg_instr_cmt_grp0[1:0]), 
			.spc_dbg_instr_cmt_grp1		(spc_dbg_instr_cmt_grp1[1:0]), 
			.spc_efu_fuse_ddata		(spc_efu_fuse_ddata), 
			.spc_efu_fuse_dxfer_en		(spc_efu_fuse_dxfer_en), 
			.spc_efu_fuse_idata		(spc_efu_fuse_idata), 
			.spc_efu_fuse_ixfer_en		(spc_efu_fuse_ixfer_en), 
			.spc_grant_o			(spc_grant_o[4:0]), 
			.spc_grant_o_8			(spc_grant_o_8), 
			.spc_hardstop_request		(spc_hardstop_request), 
			.spc_mbist_done			(spc_mbist_done), 
			.spc_mbist_fail			(spc_mbist_fail), 
			.spc_shscan_scan_out		(spc_shscan_scan_out), 
			.spc_softstop_request		(spc_softstop_request), 
			.spc_ss_complete		(spc_ss_complete), 
			.spc_tcu_lbist_done		(spc_tcu_lbist_done), 
			.spc_tcu_lbist_scan_out		(spc_tcu_lbist_scan_out), 
			.spc_tcu_mbist_scan_out		(spc_tcu_mbist_scan_out), 
			.spc_trigger_pulse		(spc_trigger_pulse), 
			.wbm_addr_o0			(wbm_addr_o0[(64 - 1):0]), 
			.wbm_addr_o1			(wbm_addr_o1[(64 - 1):0]), 
			.wbm_addr_o8			(wbm_addr_o8[(64 - 1):0]), 
			.wbm_cycle_o0			(wbm_cycle_o0), 
			.wbm_cycle_o1			(wbm_cycle_o1), 
			.wbm_cycle_o8			(wbm_cycle_o8), 
			.wbm_data_o0			(wbm_data_o0[(64 - 1):0]), 
			.wbm_data_o1			(wbm_data_o1[(64 - 1):0]), 
			.wbm_data_o8			(wbm_data_o8[(64 - 1):0]), 
			.wbm_sel_o0			(wbm_sel_o0[((64 / 8) - 1):0]), 
			.wbm_sel_o1			(wbm_sel_o1[((64 / 8) - 1):0]), 
			.wbm_sel_o8			(wbm_sel_o8[((64 / 8) - 1):0]), 
			.wbm_strobe_o0			(wbm_strobe_o0), 
			.wbm_strobe_o1			(wbm_strobe_o1), 
			.wbm_strobe_o8			(wbm_strobe_o8), 
			.wbm_we_o0			(wbm_we_o0), 
			.wbm_we_o1			(wbm_we_o1), 
			.wbm_we_o8			(wbm_we_o8));

	mem_harness mem_harness0(
		.sys_clock_i			(clk), 
		.sys_reset_i			(reset), 
		.wbs_cycle_i			(wbm_cycle_o0), 
		.wbs_strobe_i			(wbm_strobe_o0), 
		.wbs_addr_i			(mem_harness0_wbs_addr_i), 
		.wbs_data_i			(wbm_data_o0[(64 - 1):0]), 
		.wbs_we_i			(wbm_we_o0), 
		.wbs_sel_i			(wbm_sel_o0[((64 / 8) - 1):0]), 
		.wbs_ack_o			(wbm_ack_i0), 
		.wbs_data_o			(wbm_data_i0));
	mem_harness mem_harness1(
		.sys_clock_i			(clk), 
		.sys_reset_i			(reset), 
		.wbs_cycle_i			(wbm_cycle_o1), 
		.wbs_strobe_i			(wbm_strobe_o1), 
		.wbs_addr_i			(mem_harness1_wbs_addr_i), 
		.wbs_data_i			(wbm_data_o1[(64 - 1):0]), 
		.wbs_we_i			(wbm_we_o1), 
		.wbs_sel_i			(wbm_sel_o1[((64 / 8) - 1):0]), 
		.wbs_ack_o			(wbm_ack_i1), 
		.wbs_data_o			(wbm_data_i1));
	mem_harness mem_harness2(
		.sys_clock_i			(clk), 
		.sys_reset_i			(reset), 
		.wbs_cycle_i			(wbm_cycle_nc_not_uart), 
		.wbs_strobe_i			(wbm_strobe_nc_not_uart), 
		.wbs_addr_i			(wbm_addr_o8[(64 - 1):0]), 
		.wbs_data_i			(wbm_data_o8[(64 - 1):0]), 
		.wbs_we_i			(wbm_we_o8), 
		.wbs_sel_i			(wbm_sel_o8[((64 / 8) - 1):0]), 
		.wbs_ack_o			(wbm_ack_nc_not_uart), 
		.wbs_data_o			(wbm_data_nc_not_uart[(64 -
		1):0]));

	uart_top uart_top(
		.wb_clk_i			(clk), 
		.wb_rst_i			(reset), 
		.wb_adr_i			(wbm_adr_uart[(3 - 1):0]), 
		.wb_dat_i			(wbm_data_uart_i[7:0]), 
		.wb_dat_o			(wbm_data_uart[31:0]), 
		.wb_we_i			(wbm_we_o8), 
		.wb_stb_i			(wbm_strobe_uart), 
		.wb_cyc_i			(wbm_cycle_uart), 
		.wb_sel_i			(wbm_sel_uart[3:0]), 
		.wb_ack_o			(wbm_ack_uart), 
		.int_o				(int_o), 
		.srx_pad_i			(srx_pad_i), 
		.stx_pad_o			(stx_pad_o), 
		.rts_pad_o			(rts_pad_o), 
		.cts_pad_i			(cts_pad_i), 
		.dtr_pad_o			(dtr_pad_o), 
		.dsr_pad_i			(dsr_pad_i), 
		.ri_pad_i			(ri_pad_i));

	always @(negedge clk) begin
	  if ((wbm_cycle_uart & wbm_strobe_uart) & wbm_we_o8) begin
	    uart_dat <= wbm_data_uart_i;
	    adr_uart <= wbm_adr_uart;
	  end
	  if (wbm_ack_uart) begin
	    $display("SSI CONSOLE WRITE 0 %x %x", adr_uart, uart_dat);
	  end
	end
	always @(posedge clk) if (count < 8'hf0) begin
	  rst <= 1'b1;
	  count <= (count + 8'b1);
	end
	else begin
	  rst <= 1'b0;
	end

// synopsys translate_off
`ifdef FPGA_SIM 

reg [47:0] pc0_w ;
reg [47:0] last_pc ;
reg timeout_count_en ;
reg [31:0] timeout_count ;

initial
begin
timeout_count_en = 1'b0 ;
timeout_count = 32'h00000000 ;
end

always @ (negedge clk) begin

//pc0_w[47:0] <= {t2_fpga.t2.spc.tlu_pc_0_d[47:2], 2'b00} ;
pc0_w[47:0] <= {t2_fpga.t2.spc.tlu.pct0.pc_0_w[47:2], 2'b00} ;
last_pc <= pc0_w ;

if(last_pc == 48'h000000083400) begin
$display ("%t : GOOD TRAP Reached ! " ,$time ,last_pc );
        // regreport needs "GOOD End". Do not alter.
$display ("%t: dummyClass[]: Diag Reached GOOD End! (pre regreport checking)",$time);
$display("");
$display ("%t: dummyClass[]: regreport will determine if diag has really PASSED",$time);
$display("");
$display ("%t: dummyClass[]: regreport clock period: 100000 units",$time);
$display("");

$finish ;
end

if(last_pc == 48'h000000083420) begin
$display ("%t : BAD TRAP Reached !  ",$time ,last_pc );
$display ("%t: ERROR : Diag Reached BAD End! (pre regreport checking)",$time);
$display("");
$display ("%t: ERROR : regreport clock period: 100000 units",$time);
$display("");

$finish ;
end


// Logic to catch timeout 

if(last_pc != pc0_w) begin
timeout_count_en <= 1'b0 ;
`ifdef FPGA_MONITOR
$display ("%t : PC VALUE is %h ",$time ,pc0_w) ;
`endif
end

if(last_pc ==  pc0_w) begin
timeout_count_en <= 1'b1;
end

if(timeout_count_en == 1'b1) begin
timeout_count <= timeout_count + 1 ;
end
else if (timeout_count_en == 1'b0) begin
timeout_count <= 32'h00000000 ;
end

if(timeout_count == 32'd100000) begin
$display ("%t : ERROR : Time out reached after 100K idle cycles ! " ,$time ) ;
$display("");
$display ("%t: ERROR : regreport clock period: 100000 units",$time);
$display("");
$finish ;
end


end  // end always


// dump enabler

`include "dump.v"
`endif
// synopsys translate_on 


endmodule

