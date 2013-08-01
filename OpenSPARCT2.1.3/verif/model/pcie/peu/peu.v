// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu.v
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
`timescale 1ns/10ps
`ifdef LINK_1
    `define LINK_WIDTH 1
`else
    `ifdef LINK_2
        `define LINK_WIDTH 2
    `else
        `ifdef LINK_4
            `define LINK_WIDTH 4
        `else
            `ifdef LINK_12
                `define LINK_WIDTH 12
            `else
                `ifdef LINK_16
                    `define LINK_WIDTH 16
                `else
                    `ifdef LINK_24
                        `define LINK_WIDTH 24
                    `else
                        `ifdef LINK_32
                            `define LINK_WIDTH 32
                        `else
                            `define LINK_WIDTH 8
                        `endif
                    `endif
                `endif
            `endif
        `endif
    `endif
`endif



module peu (
            iol2clk,
			l2t_clk,
			rst_wmr_,
			rst_por_,
			d2p_ihb_clk,
			d2p_ihb_rd,
			d2p_ihb_addr,
			p2d_ihb_data,
			p2d_ihb_dpar,
			p2d_ihb_wptr,
			d2p_idb_clk,
			d2p_idb_rd,
			d2p_idb_addr,
			p2d_idb_data,
			p2d_idb_dpar,
			d2p_ibc_req,
			p2d_ibc_ack,
			d2p_ibc_nhc,
			d2p_ibc_phc,
			d2p_ibc_pdc,
			p2d_cto_req,
			p2d_cto_tag,
			d2p_cto_ack,
			p2d_drain,
			p2d_mps,
			p2d_ue_int,
			p2d_ce_int,
			p2d_oe_int,
			d2p_ech_wptr,
			p2d_ech_rptr,
			d2p_erh_wptr,
			p2d_erh_rptr,
			p2d_ecd_rptr,
			p2d_erd_rptr,
			d2p_ehb_we,
			d2p_ehb_addr,
			d2p_ehb_data,
			d2p_ehb_dpar,
			d2p_edb_we,
			d2p_edb_addr,
			d2p_edb_data,
			d2p_edb_dpar,
			d2p_csr_req,
			p2d_csr_ack,
			d2p_csr_rcd,
			p2d_csr_req,
			d2p_csr_ack,
			p2d_csr_rcd,
            link_clk,
            link_in, // For LTSSM/Deser lane_in
            link_in_bar, // For LTSSM/Deser lane_in_bar
            link_out, // For LTSSM/Ser lane_out
            link_out_bar, // For LTSSM/Ser lane_out
			);

   parameter delay_375 = 1.33;
   parameter delay_250 = 2.0;
   
   
   input 	 l2t_clk;
   input 	 rst_wmr_;
   input 	 rst_por_;
   
   /** 
	IHB Interface 
	*/
   input 	 d2p_ihb_clk; 	// IHB clk
   input 	 d2p_ihb_rd;		// Read En
   input [`FIRE_D2P_IHB_ADDR_BITS] d2p_ihb_addr;	// Addr
   output [`FIRE_P2D_IHB_DATA_BITS] p2d_ihb_data;	// Data
   output [`FIRE_P2D_IHB_DPAR_BITS] p2d_ihb_dpar;	// Data Parity
   output [`FIRE_P2D_IHB_WPTR_BITS] p2d_ihb_wptr;	// Wr Ptr (GC)
   
   /** 
	IDB Interface 
	*/
   input							d2p_idb_clk; 	// IDB clk
   input							d2p_idb_rd;		// Read En
   input [`FIRE_D2P_IDB_ADDR_BITS] 	d2p_idb_addr;	// Addr
   output [`FIRE_P2D_IDB_DATA_BITS] p2d_idb_data;	// Data
   output [`FIRE_P2D_IDB_DPAR_BITS] p2d_idb_dpar;	// Data Parity
   
   /**
	Ingress Buffer Credit Interface
	*/
   input							d2p_ibc_req;	// Ingr cr req
   output 							p2d_ibc_ack;	// Ack
   input [`FIRE_D2P_IBC_NHC_BITS] 	d2p_ibc_nhc;	// NPH credits
   input [`FIRE_D2P_IBC_PHC_BITS] 	d2p_ibc_phc;	// PH credits
   input [`FIRE_D2P_IBC_PDC_BITS] 	d2p_ibc_pdc;	// PD credits

   /**
	Completion Timeout Interface
	*/
   output 							p2d_cto_req; 
   output [`FIRE_P2D_CTO_TAG_BITS] 	p2d_cto_tag;
   input							d2p_cto_ack;

   /**
	Status Interface 
	*/
   output 							p2d_drain; 	// Drain signal to ILU
   output [`FIRE_P2D_MPS_BITS] 		p2d_mps;	// Max Payld size
   output 							p2d_ue_int;	// uncorrectable error
   output 							p2d_ce_int;	// correctable error
   output 							p2d_oe_int;	// other error

   /**
	Buffer Management Interface  (all pointer values are gray coded)
	*/
   input [`FIRE_D2P_ECH_WPTR_BITS] 	d2p_ech_wptr; // Cpl buf EHB wr ptr
   output [`FIRE_P2D_ECH_RPTR_BITS] p2d_ech_rptr; // Cpl buf EHB rd ptr
   input [`FIRE_D2P_ERH_WPTR_BITS] 	d2p_erh_wptr; // Req buf EHB wr ptr
   output [`FIRE_P2D_ERH_RPTR_BITS] p2d_erh_rptr; // Req buf EHB rd ptr
   output [`FIRE_P2D_ECD_RPTR_BITS] p2d_ecd_rptr; // DMA cpl buf rd ptr
   output [`FIRE_P2D_ERD_RPTR_BITS] p2d_erd_rptr; // PIO Wr buf rd ptr

   /**
	EHB Interfce
	*/
   input							d2p_ehb_we;   // EHB Write
   input [`FIRE_D2P_EHB_ADDR_BITS] 	d2p_ehb_addr; // EHB Wr ptr
   input [`FIRE_D2P_EHB_DATA_BITS] 	d2p_ehb_data; // EHB record
   input [`FIRE_D2P_EHB_DPAR_BITS] 	d2p_ehb_dpar; // EHB Wd Parity

   /**
	EDB Interfce
	*/
   input							d2p_edb_we;   // EDB Write 
   input [`FIRE_D2P_EDB_ADDR_BITS] 	d2p_edb_addr; // EDB Wr ptr
   input [`FIRE_D2P_EDB_DATA_BITS] 	d2p_edb_data; // EDB record
   input [`FIRE_D2P_EDB_DPAR_BITS] 	d2p_edb_dpar; // EDB Wd Parity

   /** 
	CSR Ring Interface
	*/
   input							d2p_csr_req;
   output 							p2d_csr_ack;
   input [`FIRE_CSR_PCKT_BITS] 		d2p_csr_rcd;

   output 							p2d_csr_req;
   input							d2p_csr_ack;
   output [`FIRE_CSR_PCKT_BITS] 	p2d_csr_rcd; 

   /**
	Differential PCIE Link Signals
	*/
   
   input 							link_clk;
   
   input [`LINK_WIDTH-1:0] 			link_in;
   input [`LINK_WIDTH-1:0] 			link_in_bar;
   output [`LINK_WIDTH-1:0] 			link_out;
   output [`LINK_WIDTH-1:0] 			link_out_bar;

   reg                              link_clk_by_10;
   wire                             link_clk_by_10_w;

   wire [`LINK_WIDTH-1:0] 			in_ln0;
   wire [`LINK_WIDTH-1:0] 			in_ln1;
   wire [`LINK_WIDTH-1:0] 			in_ln2;
   wire [`LINK_WIDTH-1:0] 			in_ln3;
   wire [`LINK_WIDTH-1:0] 			in_ln4;
   wire [`LINK_WIDTH-1:0] 			in_ln5;
   wire [`LINK_WIDTH-1:0] 			in_ln6;
   wire [`LINK_WIDTH-1:0] 			in_ln7;
   wire [`LINK_WIDTH-1:0] 			in_ln8;
   wire [`LINK_WIDTH-1:0] 			in_ln9;

   wire [`LINK_WIDTH-1:0]           in_ln0_b;
   wire [`LINK_WIDTH-1:0]           in_ln1_b;
   wire [`LINK_WIDTH-1:0]           in_ln2_b;
   wire [`LINK_WIDTH-1:0]           in_ln3_b;
   wire [`LINK_WIDTH-1:0]           in_ln4_b;
   wire [`LINK_WIDTH-1:0]           in_ln5_b;
   wire [`LINK_WIDTH-1:0]           in_ln6_b;
   wire [`LINK_WIDTH-1:0]           in_ln7_b;
   wire [`LINK_WIDTH-1:0]           in_ln8_b;
   wire [`LINK_WIDTH-1:0]           in_ln9_b;

   wire [`LINK_WIDTH-1:0] 			out_ln0;
   wire [`LINK_WIDTH-1:0] 			out_ln1;
   wire [`LINK_WIDTH-1:0] 			out_ln2;
   wire [`LINK_WIDTH-1:0] 			out_ln3;
   wire [`LINK_WIDTH-1:0] 			out_ln4;
   wire [`LINK_WIDTH-1:0] 			out_ln5;
   wire [`LINK_WIDTH-1:0] 			out_ln6;
   wire [`LINK_WIDTH-1:0] 			out_ln7;
   wire [`LINK_WIDTH-1:0] 			out_ln8;
   wire [`LINK_WIDTH-1:0] 			out_ln9;

   wire 							in_frm_boundary;
   wire 							out_frm_boundary;
   wire 							ser_ref_clk;
   wire 							deser_ref_clk;
   wire 							in_data_rdy;
   wire                             ts1_pattern_received;
   wire [`LINK_WIDTH-1:0] 			link_out_w;
   wire [`LINK_WIDTH-1:0] 			link_out_bar_w;
   wire [`LINK_WIDTH-1:0] 			link_out_w_ltssm;
   wire [`LINK_WIDTH-1:0] 			link_out_bar_w_ltssm;
   wire                             init_done;
   wire                             start_reinit;
   wire                             stage_reinit;
   wire                             init_done_rx;
   wire                             frame_boundary_ltssm_rx;
   wire                             frame_boundary_ltssm_tx;
   wire                             last_idle_frame;
   wire                             last_idle_frame_retraining;
   

   wire [`FIRE_CSR_RING_BITS] 		dcd2csr_ring_data;
   wire [`FIRE_CSR_RING_BITS] 		csr2dcs_ring_data;
   input 							iol2clk;
   wire [`LINK_WIDTH-1:0] 			out_w;
   wire [`LINK_WIDTH-1:0] 			out_bar_w;



   wire [63:0] 						tlu_ctl_csrbus_read_data;
   wire [63:0] 						tlu_ctl_csrbus_omni_data;

   wire [63:0] 						ilu_err_rw1s_alias_csrbus_read_data;
   wire [63:0] 						ilu_err_rw1s_alias_csrbus_omni_data;

   wire [63:0] 						tlu_sts_csrbus_read_data;
   wire [63:0] 						tlu_sts_csrbus_omni_data;

   wire [63:0] 						trn_off_csrbus_read_data;
   wire [63:0] 						trn_off_csrbus_omni_data;

   wire [63:0] 						tlu_ici_csrbus_read_data;
   wire [63:0] 						tlu_ici_csrbus_omni_data;

   wire [63:0] 						tlu_diag_csrbus_read_data;
   wire [63:0] 						tlu_diag_csrbus_omni_data;

   wire [63:0] 						tlu_ecc_csrbus_read_data;
   wire [63:0] 						tlu_ecc_csrbus_omni_data;

   wire [63:0] 						tlu_ecl_csrbus_read_data;
   wire [63:0] 						tlu_ecl_csrbus_omni_data;

   wire [63:0] 						tlu_erb_csrbus_read_data;
   wire [63:0] 						tlu_erb_csrbus_omni_data;

   wire [63:0] 						tlu_ica_csrbus_read_data;
   wire [63:0] 						tlu_ica_csrbus_omni_data;

   wire [63:0] 						tlu_icr_csrbus_read_data;
   wire [63:0] 						tlu_icr_csrbus_omni_data;

   wire [63:0] 						oe_log_csrbus_read_data;
   wire [63:0] 						oe_log_csrbus_omni_data;

   wire [63:0] 						oe_int_en_csrbus_read_data;
   wire [63:0] 						oe_int_en_csrbus_omni_data;

   wire [63:0] 						oe_en_err_csrbus_read_data;
   wire [63:0] 						oe_en_err_csrbus_omni_data;

   wire [63:0] 						oe_err_rw1c_alias_csrbus_read_data;
   wire [63:0] 						oe_err_rw1c_alias_csrbus_omni_data;

   wire [63:0] 						oe_err_rw1s_alias_csrbus_read_data;
   wire [63:0] 						oe_err_rw1s_alias_csrbus_omni_data;

   wire [63:0] 						roe_hdr1_csrbus_read_data;
   wire [63:0] 						roe_hdr1_csrbus_omni_data;

   wire [63:0] 						roe_hdr2_csrbus_read_data;
   wire [63:0] 						roe_hdr2_csrbus_omni_data;

   wire [63:0] 						toe_hdr1_csrbus_read_data;
   wire [63:0] 						toe_hdr1_csrbus_omni_data;

   wire [63:0] 						toe_hdr2_csrbus_read_data;
   wire [63:0] 						toe_hdr2_csrbus_omni_data;

   wire [63:0] 						tlu_prfc_csrbus_read_data;
   wire [63:0] 						tlu_prfc_csrbus_omni_data;

   wire [63:0] 						tlu_prf0_csrbus_read_data;
   wire [63:0] 						tlu_prf0_csrbus_omni_data;

   wire [63:0] 						tlu_prf1_csrbus_read_data;
   wire [63:0] 						tlu_prf1_csrbus_omni_data;

   wire [63:0] 						tlu_prf2_csrbus_read_data;
   wire [63:0] 						tlu_prf2_csrbus_omni_data;

   wire [63:0] 						tlu_dbg_sel_a_csrbus_read_data;
   wire [63:0] 						tlu_dbg_sel_a_csrbus_omni_data;

   wire [63:0] 						tlu_dbg_sel_b_csrbus_read_data;
   wire [63:0] 						tlu_dbg_sel_b_csrbus_omni_data;

   wire [63:0] 						dev_cap_csrbus_read_data;
   wire [63:0] 						dev_cap_csrbus_omni_data;

   wire [63:0] 						dev_ctl_csrbus_read_data;
   wire [63:0] 						dev_ctl_csrbus_omni_data;

   wire [63:0] 						dev_sts_csrbus_read_data;
   wire [63:0] 						dev_sts_csrbus_omni_data;

   wire [63:0] 						lnk_cap_csrbus_read_data;
   wire [63:0] 						lnk_cap_csrbus_omni_data;

   wire [63:0] 						lnk_ctl_csrbus_read_data;
   wire [63:0] 						lnk_ctl_csrbus_omni_data;

   wire [63:0] 						lnk_sts_csrbus_read_data;
   wire [63:0] 						lnk_sts_csrbus_omni_data;

   wire [63:0] 						slt_cap_csrbus_read_data;
   wire [63:0] 						slt_cap_csrbus_omni_data;

   wire [63:0] 						ue_log_csrbus_read_data;
   wire [63:0] 						ue_log_csrbus_omni_data;

   wire [63:0] 						ue_int_en_csrbus_read_data;
   wire [63:0] 						ue_int_en_csrbus_omni_data;

   wire [63:0] 						ue_en_err_csrbus_read_data;
   wire [63:0] 						ue_en_err_csrbus_omni_data;

   wire [63:0] 						ue_err_rw1c_alias_csrbus_read_data;
   wire [63:0] 						ue_err_rw1c_alias_csrbus_omni_data;

   wire [63:0] 						ue_err_rw1s_alias_csrbus_read_data;
   wire [63:0] 						ue_err_rw1s_alias_csrbus_omni_data;

   wire [63:0] 						rue_hdr1_csrbus_read_data;
   wire [63:0] 						rue_hdr1_csrbus_omni_data;

   wire [63:0] 						rue_hdr2_csrbus_read_data;
   wire [63:0] 						rue_hdr2_csrbus_omni_data;

   wire [63:0] 						tue_hdr1_csrbus_read_data;
   wire [63:0] 						tue_hdr1_csrbus_omni_data;

   wire [63:0] 						tue_hdr2_csrbus_read_data;
   wire [63:0] 						tue_hdr2_csrbus_omni_data;

   wire [63:0] 						ce_log_csrbus_read_data;
   wire [63:0] 						ce_log_csrbus_omni_data;

   wire [63:0] 						ce_int_en_csrbus_read_data;
   wire [63:0] 						ce_int_en_csrbus_omni_data;

   wire [63:0] 						ce_en_err_csrbus_read_data;
   wire [63:0] 						ce_en_err_csrbus_omni_data;

   wire [63:0] 						ce_err_rw1c_alias_csrbus_read_data;
   wire [63:0] 						ce_err_rw1c_alias_csrbus_omni_data;

   wire [63:0] 						ce_err_rw1s_alias_csrbus_read_data;
   wire [63:0] 						ce_err_rw1s_alias_csrbus_omni_data;

   wire [63:0] 						peu_dlpl_serdes_rev_csrbus_read_data;
   wire [63:0] 						peu_dlpl_serdes_rev_csrbus_omni_data;

   wire [63:0] 						acknak_thresh_csrbus_read_data;
   wire [63:0] 						acknak_thresh_csrbus_omni_data;

   wire [63:0] 						acknak_timer_csrbus_read_data;
   wire [63:0] 						acknak_timer_csrbus_omni_data;

   wire [63:0] 						replay_tim_thresh_csrbus_read_data;
   wire [63:0] 						replay_tim_thresh_csrbus_omni_data;

   wire [63:0] 						replay_timer_csrbus_read_data;
   wire [63:0] 						replay_timer_csrbus_omni_data;

   wire [63:0] 						ven_dllp_msg_csrbus_read_data;
   wire [63:0] 						ven_dllp_msg_csrbus_omni_data;

   wire [63:0] 						force_ltssm_csrbus_read_data;
   wire [63:0] 						force_ltssm_csrbus_omni_data;

   wire [63:0] 						link_cfg_csrbus_read_data;
   wire [63:0] 						link_cfg_csrbus_omni_data;

   wire [63:0] 						link_ctl_csrbus_read_data;
   wire [63:0] 						link_ctl_csrbus_omni_data;

   wire [63:0] 						lane_skew_csrbus_read_data;
   wire [63:0] 						lane_skew_csrbus_omni_data;

   wire [63:0] 						symbol_num_csrbus_read_data;
   wire [63:0] 						symbol_num_csrbus_omni_data;

   wire [63:0] 						symbol_timer_csrbus_read_data;
   wire [63:0] 						symbol_timer_csrbus_omni_data;

   wire [63:0] 						core_status_csrbus_read_data;
   wire [63:0] 						core_status_csrbus_omni_data;

   wire [63:0] 						event_err_log_en_csrbus_read_data;
   wire [63:0] 						event_err_log_en_csrbus_omni_data;

   wire [63:0] 						event_err_int_en_csrbus_read_data;
   wire [63:0] 						event_err_int_en_csrbus_omni_data;

   wire [63:0] 						event_err_int_sts_csrbus_read_data;
   wire [63:0] 						event_err_int_sts_csrbus_omni_data;

   wire [63:0] 						event_err_sts_clr_rw1c_alias_csrbus_read_data;
   wire [63:0] 						event_err_sts_clr_rw1c_alias_csrbus_omni_data;

   wire [63:0] 						event_err_sts_clr_rw1s_alias_csrbus_read_data;
   wire [63:0] 						event_err_sts_clr_rw1s_alias_csrbus_omni_data;

   wire [63:0] 						lnk_bit_err_cnt_1_csrbus_read_data;
   wire [63:0] 						lnk_bit_err_cnt_1_csrbus_omni_data;

   wire [63:0] 						lnk_bit_err_cnt_2_csrbus_read_data;
   wire [63:0] 						lnk_bit_err_cnt_2_csrbus_omni_data;

   wire [63:0] 						serdes_pll_csrbus_read_data;
   wire [63:0] 						serdes_pll_csrbus_omni_data;

   wire [63:0] 						serdes_receiver_lane_ctl_csrbus_read_data;
   wire [63:0] 						serdes_receiver_lane_ctl_csrbus_omni_data;

   wire [63:0] 						serdes_receiver_lane_status_csrbus_read_data;
   wire [63:0] 						serdes_receiver_lane_status_csrbus_omni_data;

   wire [63:0] 						serdes_xmitter_lane_ctl_csrbus_read_data;
   wire [63:0] 						serdes_xmitter_lane_ctl_csrbus_omni_data;

   wire [63:0] 						serdes_xmitter_lane_status_csrbus_read_data;
   wire [63:0] 						serdes_xmitter_lane_status_csrbus_omni_data;

   wire [63:0] 						serdes_macro_test_cfg_csrbus_read_data;
   wire [63:0] 						serdes_macro_test_cfg_csrbus_omni_data;

   initial begin
       link_clk_by_10 = 0;
       #(2) link_clk_by_10 = ~link_clk_by_10;
       forever begin
           #(0.2) link_clk_by_10 = ~link_clk_by_10;
       end
   end

   assign link_clk_by_10_w = link_clk_by_10;


   assign 							link_out  = out_w;
   assign 							link_out_bar = out_bar_w;

   pcie_common_dcd dcd (
						.clk (iol2clk),
						.rst_l (rst_wmr_),
						.csr_pkt_data (d2p_csr_rcd),
						.csr_pkt_req (d2p_csr_req),
						.csr_pkt_ack (p2d_csr_ack),
						.csr_rng_data (dcd2csr_ring_data)
						);

   
   pcie_common_dcs dcs (
						.clk (iol2clk),
						.rst_l (rst_wmr_),
						.csr_pkt_data (p2d_csr_rcd),
						.csr_pkt_req (p2d_csr_req),
						.csr_pkt_ack (d2p_csr_ack),
						.csr_rng_data (csr2dcs_ring_data)
						);


   peu_top peu_model (
					  .l2t_clk(iol2clk),
					  .j2p_rst_l(rst_wmr_),
					  .j2p_por_l(rst_por_),
					  .d2p_ihb_clk(d2p_ihb_clk),
					  .d2p_ihb_rd(d2p_ihb_rd),
					  .d2p_ihb_addr(d2p_ihb_addr),
					  .p2d_ihb_data(p2d_ihb_data),
					  .p2d_ihb_dpar(p2d_ihb_dpar),
					  .p2d_ihb_wptr(p2d_ihb_wptr),
					  .d2p_idb_clk(d2p_idb_clk),
					  .d2p_idb_rd(d2p_idb_rd),
					  .d2p_idb_addr(d2p_idb_addr),
					  .p2d_idb_data(p2d_idb_data),
					  .p2d_idb_dpar(p2d_idb_dpar),
					  .d2p_ibc_req(d2p_ibc_req),
					  .p2d_ibc_ack(p2d_ibc_ack),
					  .d2p_ibc_nhc(d2p_ibc_nhc),
					  .d2p_ibc_phc(d2p_ibc_phc),
					  .d2p_ibc_pdc(d2p_ibc_pdc),
					  .p2d_cto_req(p2d_cto_req),
					  .p2d_cto_tag(p2d_cto_tag),
					  .d2p_cto_ack(d2p_cto_ack),
					  .p2d_drain(p2d_drain),
					  .p2d_mps(p2d_mps),
					  .p2d_ue_int(p2d_ue_int),
					  .p2d_ce_int(p2d_ce_int),
					  .p2d_oe_int(p2d_oe_int),
					  .d2p_ech_wptr(d2p_ech_wptr),
					  .p2d_ech_rptr(p2d_ech_rptr),
					  .d2p_erh_wptr(d2p_erh_wptr),
					  .p2d_erh_rptr(p2d_erh_rptr),
					  .p2d_ecd_rptr(p2d_ecd_rptr),
					  .p2d_erd_rptr(p2d_erd_rptr),
					  .d2p_ehb_we(d2p_ehb_we),
					  .d2p_ehb_addr(d2p_ehb_addr),
					  .d2p_ehb_data(d2p_ehb_data),
					  .d2p_ehb_dpar(d2p_ehb_dpar),
					  .d2p_edb_we(d2p_edb_we),
					  .d2p_edb_addr(d2p_edb_addr),
					  .d2p_edb_data(d2p_edb_data),
					  .d2p_edb_dpar(d2p_edb_dpar),
					  .d2p_csr_req(d2p_csr_req),
					  .d2p_csr_rcd(d2p_csr_rcd),
					  .d2p_csr_ack(d2p_csr_ack),
					  .dcd2csr_ring_data(dcd2csr_ring_data),
					  .csr2dcs_ring_data(csr2dcs_ring_data),
					  .lane_in0(in_ln0),
					  .lane_in1(in_ln1),
					  .lane_in2(in_ln2),
					  .lane_in3(in_ln3),
					  .lane_in4(in_ln4),
					  .lane_in5(in_ln5),
					  .lane_in6(in_ln6),
					  .lane_in7(in_ln7),
					  .lane_in8(in_ln8),
					  .lane_in9(in_ln9),
                      .lane_in0_b(in_ln0_b),
                      .lane_in1_b(in_ln1_b),
                      .lane_in2_b(in_ln2_b),
                      .lane_in3_b(in_ln3_b),
                      .lane_in4_b(in_ln4_b),
                      .lane_in5_b(in_ln5_b),
                      .lane_in6_b(in_ln6_b),
                      .lane_in7_b(in_ln7_b),
                      .lane_in8_b(in_ln8_b),
                      .lane_in9_b(in_ln9_b),
					  .frm_boundary_deser(frame_boundary_ltssm_rx),
					  .encoded_data0(out_ln0),
					  .encoded_data1(out_ln1),
					  .encoded_data2(out_ln2),
					  .encoded_data3(out_ln3),
					  .encoded_data4(out_ln4),
					  .encoded_data5(out_ln5),
					  .encoded_data6(out_ln6),
					  .encoded_data7(out_ln7),
					  .encoded_data8(out_ln8),
					  .encoded_data9(out_ln9),
                      .ts1_pattern_received(ts1_pattern_received),
					  .sym_boundary(out_frm_boundry),
                      .lane_in(link_in),
                      .lane_in_bar(link_in_bar),
                      .link_clk(link_clk_by_10_w),
                      .lane_out(link_out_w_ltssm),
                      .lane_out_bar(link_out_bar_w_ltssm),
                      .init_done(init_done),
                      .start_reinit(start_reinit),
                      .stage_reinit(stage_reinit),
                      .init_done_rx(init_done_rx),
                      .frame_boundary_ltssm_rx(frame_boundary_ltssm_rx),
                      .frame_boundary_ltssm_tx(frame_boundary_ltssm_tx),
                      .last_idle_frame(last_idle_frame),
                      .last_idle_frame_retraining(last_idle_frame_retraining),
					  .tlu_ctl_csrbus_read_data(tlu_ctl_csrbus_read_data),
					  .tlu_ctl_csrbus_omni_data(tlu_ctl_csrbus_omni_data),
					  .ilu_err_rw1s_alias_csrbus_read_data(ilu_err_rw1s_alias_csrbus_read_data),
					  .ilu_err_rw1s_alias_csrbus_omni_data(ilu_err_rw1s_alias_csrbus_omni_data),
					  .tlu_sts_csrbus_read_data(tlu_sts_csrbus_read_data),
					  .tlu_sts_csrbus_omni_data(tlu_sts_csrbus_omni_data),
					  .trn_off_csrbus_read_data(trn_off_csrbus_read_data),
					  .trn_off_csrbus_omni_data(trn_off_csrbus_omni_data),
					  .tlu_ici_csrbus_read_data(tlu_ici_csrbus_read_data),
					  .tlu_ici_csrbus_omni_data(tlu_ici_csrbus_omni_data),
					  .tlu_diag_csrbus_read_data(tlu_diag_csrbus_read_data),
					  .tlu_diag_csrbus_omni_data(tlu_diag_csrbus_omni_data),
					  .tlu_ecc_csrbus_read_data(tlu_ecc_csrbus_read_data),
					  .tlu_ecc_csrbus_omni_data(tlu_ecc_csrbus_omni_data),
					  .tlu_ecl_csrbus_read_data(tlu_ecl_csrbus_read_data),
					  .tlu_ecl_csrbus_omni_data(tlu_ecl_csrbus_omni_data),
					  .tlu_erb_csrbus_read_data(tlu_erb_csrbus_read_data),
					  .tlu_erb_csrbus_omni_data(tlu_erb_csrbus_omni_data),
					  .tlu_ica_csrbus_read_data(tlu_ica_csrbus_read_data),
					  .tlu_ica_csrbus_omni_data(tlu_ica_csrbus_omni_data),
					  .tlu_icr_csrbus_read_data(tlu_icr_csrbus_read_data),
					  .tlu_icr_csrbus_omni_data(tlu_icr_csrbus_omni_data),
					  .oe_log_csrbus_read_data(oe_log_csrbus_read_data),
					  .oe_log_csrbus_omni_data(oe_log_csrbus_omni_data),
					  .oe_int_en_csrbus_read_data(oe_int_en_csrbus_read_data),
					  .oe_int_en_csrbus_omni_data(oe_int_en_csrbus_omni_data),
					  .oe_en_err_csrbus_read_data(oe_en_err_csrbus_read_data),
					  .oe_en_err_csrbus_omni_data(oe_en_err_csrbus_omni_data),
					  .oe_err_rw1c_alias_csrbus_read_data(oe_err_rw1c_alias_csrbus_read_data),
					  .oe_err_rw1c_alias_csrbus_omni_data(oe_err_rw1c_alias_csrbus_omni_data),
					  .oe_err_rw1s_alias_csrbus_read_data(oe_err_rw1s_alias_csrbus_read_data),
					  .oe_err_rw1s_alias_csrbus_omni_data(oe_err_rw1s_alias_csrbus_omni_data),
					  .roe_hdr1_csrbus_read_data(roe_hdr1_csrbus_read_data),
					  .roe_hdr1_csrbus_omni_data(roe_hdr1_csrbus_omni_data),
					  .roe_hdr2_csrbus_read_data(roe_hdr2_csrbus_read_data),
					  .roe_hdr2_csrbus_omni_data(roe_hdr2_csrbus_omni_data),
					  .toe_hdr1_csrbus_read_data(toe_hdr1_csrbus_read_data),
					  .toe_hdr1_csrbus_omni_data(toe_hdr1_csrbus_omni_data),
					  .toe_hdr2_csrbus_read_data(toe_hdr2_csrbus_read_data),
					  .toe_hdr2_csrbus_omni_data(toe_hdr2_csrbus_omni_data),
					  .tlu_prfc_csrbus_read_data(tlu_prfc_csrbus_read_data),
					  .tlu_prfc_csrbus_omni_data(tlu_prfc_csrbus_omni_data),
					  .tlu_prf0_csrbus_read_data(tlu_prf0_csrbus_read_data),
					  .tlu_prf0_csrbus_omni_data(tlu_prf0_csrbus_omni_data),
					  .tlu_prf1_csrbus_read_data(tlu_prf1_csrbus_read_data),
					  .tlu_prf1_csrbus_omni_data(tlu_prf1_csrbus_omni_data),
					  .tlu_prf2_csrbus_read_data(tlu_prf2_csrbus_read_data),
					  .tlu_prf2_csrbus_omni_data(tlu_prf2_csrbus_omni_data),
					  .tlu_dbg_sel_a_csrbus_read_data(tlu_dbg_sel_a_csrbus_read_data),
					  .tlu_dbg_sel_a_csrbus_omni_data(tlu_dbg_sel_a_csrbus_omni_data),
					  .tlu_dbg_sel_b_csrbus_read_data(tlu_dbg_sel_b_csrbus_read_data),
					  .tlu_dbg_sel_b_csrbus_omni_data(tlu_dbg_sel_b_csrbus_omni_data),
					  .dev_cap_csrbus_read_data(dev_cap_csrbus_read_data),
					  .dev_cap_csrbus_omni_data(dev_cap_csrbus_omni_data),
					  .dev_ctl_csrbus_read_data(dev_ctl_csrbus_read_data),
					  .dev_ctl_csrbus_omni_data(dev_ctl_csrbus_omni_data),
					  .dev_sts_csrbus_read_data(dev_sts_csrbus_read_data),
					  .dev_sts_csrbus_omni_data(dev_sts_csrbus_omni_data),
					  .lnk_cap_csrbus_read_data(lnk_cap_csrbus_read_data),
					  .lnk_cap_csrbus_omni_data(lnk_cap_csrbus_omni_data),
					  .lnk_ctl_csrbus_read_data(lnk_ctl_csrbus_read_data),
					  .lnk_ctl_csrbus_omni_data(lnk_ctl_csrbus_omni_data),
					  .lnk_sts_csrbus_read_data(lnk_sts_csrbus_read_data),
					  .lnk_sts_csrbus_omni_data(lnk_sts_csrbus_omni_data),
					  .slt_cap_csrbus_read_data(slt_cap_csrbus_read_data),
					  .slt_cap_csrbus_omni_data(slt_cap_csrbus_omni_data),
					  .ue_log_csrbus_read_data(ue_log_csrbus_read_data),
					  .ue_log_csrbus_omni_data(ue_log_csrbus_omni_data),
					  .ue_int_en_csrbus_read_data(ue_int_en_csrbus_read_data),
					  .ue_int_en_csrbus_omni_data(ue_int_en_csrbus_omni_data),
					  .ue_en_err_csrbus_read_data(ue_en_err_csrbus_read_data),
					  .ue_en_err_csrbus_omni_data(ue_en_err_csrbus_omni_data),
					  .ue_err_rw1c_alias_csrbus_read_data(ue_err_rw1c_alias_csrbus_read_data),
					  .ue_err_rw1c_alias_csrbus_omni_data(ue_err_rw1c_alias_csrbus_omni_data),
					  .ue_err_rw1s_alias_csrbus_read_data(ue_err_rw1s_alias_csrbus_read_data),
					  .ue_err_rw1s_alias_csrbus_omni_data(ue_err_rw1s_alias_csrbus_omni_data),
					  .rue_hdr1_csrbus_read_data(rue_hdr1_csrbus_read_data),
					  .rue_hdr1_csrbus_omni_data(rue_hdr1_csrbus_omni_data),
					  .rue_hdr2_csrbus_read_data(rue_hdr2_csrbus_read_data),
					  .rue_hdr2_csrbus_omni_data(rue_hdr2_csrbus_omni_data),
					  .tue_hdr1_csrbus_read_data(tue_hdr1_csrbus_read_data),
					  .tue_hdr1_csrbus_omni_data(tue_hdr1_csrbus_omni_data),
					  .tue_hdr2_csrbus_read_data(tue_hdr2_csrbus_read_data),
					  .tue_hdr2_csrbus_omni_data(tue_hdr2_csrbus_omni_data),
					  .ce_log_csrbus_read_data(ce_log_csrbus_read_data),
					  .ce_log_csrbus_omni_data(ce_log_csrbus_omni_data),
					  .ce_int_en_csrbus_read_data(ce_int_en_csrbus_read_data),
					  .ce_int_en_csrbus_omni_data(ce_int_en_csrbus_omni_data),
					  .ce_en_err_csrbus_read_data(ce_en_err_csrbus_read_data),
					  .ce_en_err_csrbus_omni_data(ce_en_err_csrbus_omni_data),
					  .ce_err_rw1c_alias_csrbus_read_data(ce_err_rw1c_alias_csrbus_read_data),
					  .ce_err_rw1c_alias_csrbus_omni_data(ce_err_rw1c_alias_csrbus_omni_data),
					  .ce_err_rw1s_alias_csrbus_read_data(ce_err_rw1s_alias_csrbus_read_data),
					  .ce_err_rw1s_alias_csrbus_omni_data(ce_err_rw1s_alias_csrbus_omni_data),
					  .peu_dlpl_serdes_rev_csrbus_read_data(peu_dlpl_serdes_rev_csrbus_read_data),
					  .peu_dlpl_serdes_rev_csrbus_omni_data(peu_dlpl_serdes_rev_csrbus_omni_data),
					  .acknak_thresh_csrbus_read_data(acknak_thresh_csrbus_read_data),
					  .acknak_thresh_csrbus_omni_data(acknak_thresh_csrbus_omni_data),
					  .acknak_timer_csrbus_read_data(acknak_timer_csrbus_read_data),
					  .acknak_timer_csrbus_omni_data(acknak_timer_csrbus_omni_data),
					  .replay_tim_thresh_csrbus_read_data(replay_tim_thresh_csrbus_read_data),
					  .replay_tim_thresh_csrbus_omni_data(replay_tim_thresh_csrbus_omni_data),
					  .replay_timer_csrbus_read_data(replay_timer_csrbus_read_data),
					  .replay_timer_csrbus_omni_data(replay_timer_csrbus_omni_data),
					  .ven_dllp_msg_csrbus_read_data(ven_dllp_msg_csrbus_read_data),
					  .ven_dllp_msg_csrbus_omni_data(ven_dllp_msg_csrbus_omni_data),
					  .force_ltssm_csrbus_read_data(force_ltssm_csrbus_read_data),
					  .force_ltssm_csrbus_omni_data(force_ltssm_csrbus_omni_data),
					  .link_cfg_csrbus_read_data(link_cfg_csrbus_read_data),
					  .link_cfg_csrbus_omni_data(link_cfg_csrbus_omni_data),
					  .link_ctl_csrbus_read_data(link_ctl_csrbus_read_data),
					  .link_ctl_csrbus_omni_data(link_ctl_csrbus_omni_data),
					  .lane_skew_csrbus_read_data(lane_skew_csrbus_read_data),
					  .lane_skew_csrbus_omni_data(lane_skew_csrbus_omni_data),
					  .symbol_num_csrbus_read_data(symbol_num_csrbus_read_data),
					  .symbol_num_csrbus_omni_data(symbol_num_csrbus_omni_data),
					  .symbol_timer_csrbus_read_data(symbol_timer_csrbus_read_data),
					  .symbol_timer_csrbus_omni_data(symbol_timer_csrbus_omni_data),
					  .core_status_csrbus_read_data(core_status_csrbus_read_data),
					  .core_status_csrbus_omni_data(core_status_csrbus_omni_data),
					  .event_err_log_en_csrbus_read_data(event_err_log_en_csrbus_read_data),
					  .event_err_log_en_csrbus_omni_data(event_err_log_en_csrbus_omni_data),
					  .event_err_int_en_csrbus_read_data(event_err_int_en_csrbus_read_data),
					  .event_err_int_en_csrbus_omni_data(event_err_int_en_csrbus_omni_data),
					  .event_err_int_sts_csrbus_read_data(event_err_int_sts_csrbus_read_data),
					  .event_err_int_sts_csrbus_omni_data(event_err_int_sts_csrbus_omni_data),
					  .event_err_sts_clr_rw1c_alias_csrbus_read_data(event_err_sts_clr_rw1c_alias_csrbus_read_data),
					  .event_err_sts_clr_rw1c_alias_csrbus_omni_data(event_err_sts_clr_rw1c_alias_csrbus_omni_data),
					  .event_err_sts_clr_rw1s_alias_csrbus_read_data(event_err_sts_clr_rw1s_alias_csrbus_read_data),
					  .event_err_sts_clr_rw1s_alias_csrbus_omni_data(event_err_sts_clr_rw1s_alias_csrbus_omni_data),
					  .lnk_bit_err_cnt_1_csrbus_read_data(lnk_bit_err_cnt_1_csrbus_read_data),
					  .lnk_bit_err_cnt_1_csrbus_omni_data(lnk_bit_err_cnt_1_csrbus_omni_data),
					  .lnk_bit_err_cnt_2_csrbus_read_data(lnk_bit_err_cnt_2_csrbus_read_data),
					  .lnk_bit_err_cnt_2_csrbus_omni_data(lnk_bit_err_cnt_2_csrbus_omni_data),
					  .serdes_pll_csrbus_read_data(serdes_pll_csrbus_read_data),
					  .serdes_pll_csrbus_omni_data(serdes_pll_csrbus_omni_data),
					  .serdes_receiver_lane_ctl_csrbus_read_data(serdes_receiver_lane_ctl_csrbus_read_data),
					  .serdes_receiver_lane_ctl_csrbus_omni_data(serdes_receiver_lane_ctl_csrbus_omni_data),
					  .serdes_receiver_lane_status_csrbus_read_data(serdes_receiver_lane_status_csrbus_read_data),
					  .serdes_receiver_lane_status_csrbus_omni_data(serdes_receiver_lane_status_csrbus_omni_data),
					  .serdes_xmitter_lane_ctl_csrbus_read_data(serdes_xmitter_lane_ctl_csrbus_read_data),
					  .serdes_xmitter_lane_ctl_csrbus_omni_data(serdes_xmitter_lane_ctl_csrbus_omni_data),
					  .serdes_xmitter_lane_status_csrbus_read_data(serdes_xmitter_lane_status_csrbus_read_data),
					  .serdes_xmitter_lane_status_csrbus_omni_data(serdes_xmitter_lane_status_csrbus_omni_data),
					  .serdes_macro_test_cfg_csrbus_read_data(serdes_macro_test_cfg_csrbus_read_data),
					  .serdes_macro_test_cfg_csrbus_omni_data(serdes_macro_test_cfg_csrbus_omni_data)

					  );
   
   
   peu_csr_omni csr_omni(
						 .tlu_ctl_csrbus_read_data(tlu_ctl_csrbus_read_data),
						 .tlu_ctl_csrbus_omni_data(tlu_ctl_csrbus_omni_data),
						 .ilu_err_rw1s_alias_csrbus_read_data(ilu_err_rw1s_alias_csrbus_read_data),
						 .ilu_err_rw1s_alias_csrbus_omni_data(ilu_err_rw1s_alias_csrbus_omni_data),
						 .tlu_sts_csrbus_read_data(tlu_sts_csrbus_read_data),
						 .tlu_sts_csrbus_omni_data(tlu_sts_csrbus_omni_data),
						 .trn_off_csrbus_read_data(trn_off_csrbus_read_data),
						 .trn_off_csrbus_omni_data(trn_off_csrbus_omni_data),
						 .tlu_ici_csrbus_read_data(tlu_ici_csrbus_read_data),
						 .tlu_ici_csrbus_omni_data(tlu_ici_csrbus_omni_data),
						 .tlu_diag_csrbus_read_data(tlu_diag_csrbus_read_data),
						 .tlu_diag_csrbus_omni_data(tlu_diag_csrbus_omni_data),
						 .tlu_ecc_csrbus_read_data(tlu_ecc_csrbus_read_data),
						 .tlu_ecc_csrbus_omni_data(tlu_ecc_csrbus_omni_data),
						 .tlu_ecl_csrbus_read_data(tlu_ecl_csrbus_read_data),
						 .tlu_ecl_csrbus_omni_data(tlu_ecl_csrbus_omni_data),
						 .tlu_erb_csrbus_read_data(tlu_erb_csrbus_read_data),
						 .tlu_erb_csrbus_omni_data(tlu_erb_csrbus_omni_data),
						 .tlu_ica_csrbus_read_data(tlu_ica_csrbus_read_data),
						 .tlu_ica_csrbus_omni_data(tlu_ica_csrbus_omni_data),
						 .tlu_icr_csrbus_read_data(tlu_icr_csrbus_read_data),
						 .tlu_icr_csrbus_omni_data(tlu_icr_csrbus_omni_data),
						 .oe_log_csrbus_read_data(oe_log_csrbus_read_data),
						 .oe_log_csrbus_omni_data(oe_log_csrbus_omni_data),
						 .oe_int_en_csrbus_read_data(oe_int_en_csrbus_read_data),
						 .oe_int_en_csrbus_omni_data(oe_int_en_csrbus_omni_data),
						 .oe_en_err_csrbus_read_data(oe_en_err_csrbus_read_data),
						 .oe_en_err_csrbus_omni_data(oe_en_err_csrbus_omni_data),
						 .oe_err_rw1c_alias_csrbus_read_data(oe_err_rw1c_alias_csrbus_read_data),
						 .oe_err_rw1c_alias_csrbus_omni_data(oe_err_rw1c_alias_csrbus_omni_data),
						 .oe_err_rw1s_alias_csrbus_read_data(oe_err_rw1s_alias_csrbus_read_data),
						 .oe_err_rw1s_alias_csrbus_omni_data(oe_err_rw1s_alias_csrbus_omni_data),
						 .roe_hdr1_csrbus_read_data(roe_hdr1_csrbus_read_data),
						 .roe_hdr1_csrbus_omni_data(roe_hdr1_csrbus_omni_data),
						 .roe_hdr2_csrbus_read_data(roe_hdr2_csrbus_read_data),
						 .roe_hdr2_csrbus_omni_data(roe_hdr2_csrbus_omni_data),
						 .toe_hdr1_csrbus_read_data(toe_hdr1_csrbus_read_data),
						 .toe_hdr1_csrbus_omni_data(toe_hdr1_csrbus_omni_data),
						 .toe_hdr2_csrbus_read_data(toe_hdr2_csrbus_read_data),
						 .toe_hdr2_csrbus_omni_data(toe_hdr2_csrbus_omni_data),
						 .tlu_prfc_csrbus_read_data(tlu_prfc_csrbus_read_data),
						 .tlu_prfc_csrbus_omni_data(tlu_prfc_csrbus_omni_data),
						 .tlu_prf0_csrbus_read_data(tlu_prf0_csrbus_read_data),
						 .tlu_prf0_csrbus_omni_data(tlu_prf0_csrbus_omni_data),
						 .tlu_prf1_csrbus_read_data(tlu_prf1_csrbus_read_data),
						 .tlu_prf1_csrbus_omni_data(tlu_prf1_csrbus_omni_data),
						 .tlu_prf2_csrbus_read_data(tlu_prf2_csrbus_read_data),
						 .tlu_prf2_csrbus_omni_data(tlu_prf2_csrbus_omni_data),
						 .tlu_dbg_sel_a_csrbus_read_data(tlu_dbg_sel_a_csrbus_read_data),
						 .tlu_dbg_sel_a_csrbus_omni_data(tlu_dbg_sel_a_csrbus_omni_data),
						 .tlu_dbg_sel_b_csrbus_read_data(tlu_dbg_sel_b_csrbus_read_data),
						 .tlu_dbg_sel_b_csrbus_omni_data(tlu_dbg_sel_b_csrbus_omni_data),
						 .dev_cap_csrbus_read_data(dev_cap_csrbus_read_data),
						 .dev_cap_csrbus_omni_data(dev_cap_csrbus_omni_data),
						 .dev_ctl_csrbus_read_data(dev_ctl_csrbus_read_data),
						 .dev_ctl_csrbus_omni_data(dev_ctl_csrbus_omni_data),
						 .dev_sts_csrbus_read_data(dev_sts_csrbus_read_data),
						 .dev_sts_csrbus_omni_data(dev_sts_csrbus_omni_data),
						 .lnk_cap_csrbus_read_data(lnk_cap_csrbus_read_data),
						 .lnk_cap_csrbus_omni_data(lnk_cap_csrbus_omni_data),
						 .lnk_ctl_csrbus_read_data(lnk_ctl_csrbus_read_data),
						 .lnk_ctl_csrbus_omni_data(lnk_ctl_csrbus_omni_data),
						 .lnk_sts_csrbus_read_data(lnk_sts_csrbus_read_data),
						 .lnk_sts_csrbus_omni_data(lnk_sts_csrbus_omni_data),
						 .slt_cap_csrbus_read_data(slt_cap_csrbus_read_data),
						 .slt_cap_csrbus_omni_data(slt_cap_csrbus_omni_data),
						 .ue_log_csrbus_read_data(ue_log_csrbus_read_data),
						 .ue_log_csrbus_omni_data(ue_log_csrbus_omni_data),
						 .ue_int_en_csrbus_read_data(ue_int_en_csrbus_read_data),
						 .ue_int_en_csrbus_omni_data(ue_int_en_csrbus_omni_data),
						 .ue_en_err_csrbus_read_data(ue_en_err_csrbus_read_data),
						 .ue_en_err_csrbus_omni_data(ue_en_err_csrbus_omni_data),
						 .ue_err_rw1c_alias_csrbus_read_data(ue_err_rw1c_alias_csrbus_read_data),
						 .ue_err_rw1c_alias_csrbus_omni_data(ue_err_rw1c_alias_csrbus_omni_data),
						 .ue_err_rw1s_alias_csrbus_read_data(ue_err_rw1s_alias_csrbus_read_data),
						 .ue_err_rw1s_alias_csrbus_omni_data(ue_err_rw1s_alias_csrbus_omni_data),
						 .rue_hdr1_csrbus_read_data(rue_hdr1_csrbus_read_data),
						 .rue_hdr1_csrbus_omni_data(rue_hdr1_csrbus_omni_data),
						 .rue_hdr2_csrbus_read_data(rue_hdr2_csrbus_read_data),
						 .rue_hdr2_csrbus_omni_data(rue_hdr2_csrbus_omni_data),
						 .tue_hdr1_csrbus_read_data(tue_hdr1_csrbus_read_data),
						 .tue_hdr1_csrbus_omni_data(tue_hdr1_csrbus_omni_data),
						 .tue_hdr2_csrbus_read_data(tue_hdr2_csrbus_read_data),
						 .tue_hdr2_csrbus_omni_data(tue_hdr2_csrbus_omni_data),
						 .ce_log_csrbus_read_data(ce_log_csrbus_read_data),
						 .ce_log_csrbus_omni_data(ce_log_csrbus_omni_data),
						 .ce_int_en_csrbus_read_data(ce_int_en_csrbus_read_data),
						 .ce_int_en_csrbus_omni_data(ce_int_en_csrbus_omni_data),
						 .ce_en_err_csrbus_read_data(ce_en_err_csrbus_read_data),
						 .ce_en_err_csrbus_omni_data(ce_en_err_csrbus_omni_data),
						 .ce_err_rw1c_alias_csrbus_read_data(ce_err_rw1c_alias_csrbus_read_data),
						 .ce_err_rw1c_alias_csrbus_omni_data(ce_err_rw1c_alias_csrbus_omni_data),
						 .ce_err_rw1s_alias_csrbus_read_data(ce_err_rw1s_alias_csrbus_read_data),
						 .ce_err_rw1s_alias_csrbus_omni_data(ce_err_rw1s_alias_csrbus_omni_data),
						 .peu_dlpl_serdes_rev_csrbus_read_data(peu_dlpl_serdes_rev_csrbus_read_data),
						 .peu_dlpl_serdes_rev_csrbus_omni_data(peu_dlpl_serdes_rev_csrbus_omni_data),
						 .acknak_thresh_csrbus_read_data(acknak_thresh_csrbus_read_data),
						 .acknak_thresh_csrbus_omni_data(acknak_thresh_csrbus_omni_data),
						 .acknak_timer_csrbus_read_data(acknak_timer_csrbus_read_data),
						 .acknak_timer_csrbus_omni_data(acknak_timer_csrbus_omni_data),
						 .replay_tim_thresh_csrbus_read_data(replay_tim_thresh_csrbus_read_data),
						 .replay_tim_thresh_csrbus_omni_data(replay_tim_thresh_csrbus_omni_data),
						 .replay_timer_csrbus_read_data(replay_timer_csrbus_read_data),
						 .replay_timer_csrbus_omni_data(replay_timer_csrbus_omni_data),
						 .ven_dllp_msg_csrbus_read_data(ven_dllp_msg_csrbus_read_data),
						 .ven_dllp_msg_csrbus_omni_data(ven_dllp_msg_csrbus_omni_data),
						 .force_ltssm_csrbus_read_data(force_ltssm_csrbus_read_data),
						 .force_ltssm_csrbus_omni_data(force_ltssm_csrbus_omni_data),
						 .link_cfg_csrbus_read_data(link_cfg_csrbus_read_data),
						 .link_cfg_csrbus_omni_data(link_cfg_csrbus_omni_data),
						 .link_ctl_csrbus_read_data(link_ctl_csrbus_read_data),
						 .link_ctl_csrbus_omni_data(link_ctl_csrbus_omni_data),
						 .lane_skew_csrbus_read_data(lane_skew_csrbus_read_data),
						 .lane_skew_csrbus_omni_data(lane_skew_csrbus_omni_data),
						 .symbol_num_csrbus_read_data(symbol_num_csrbus_read_data),
						 .symbol_num_csrbus_omni_data(symbol_num_csrbus_omni_data),
						 .symbol_timer_csrbus_read_data(symbol_timer_csrbus_read_data),
						 .symbol_timer_csrbus_omni_data(symbol_timer_csrbus_omni_data),
						 .core_status_csrbus_read_data(core_status_csrbus_read_data),
						 .core_status_csrbus_omni_data(core_status_csrbus_omni_data),
						 .event_err_log_en_csrbus_read_data(event_err_log_en_csrbus_read_data),
						 .event_err_log_en_csrbus_omni_data(event_err_log_en_csrbus_omni_data),
						 .event_err_int_en_csrbus_read_data(event_err_int_en_csrbus_read_data),
						 .event_err_int_en_csrbus_omni_data(event_err_int_en_csrbus_omni_data),
						 .event_err_int_sts_csrbus_read_data(event_err_int_sts_csrbus_read_data),
						 .event_err_int_sts_csrbus_omni_data(event_err_int_sts_csrbus_omni_data),
						 .event_err_sts_clr_rw1c_alias_csrbus_read_data(event_err_sts_clr_rw1c_alias_csrbus_read_data),
						 .event_err_sts_clr_rw1c_alias_csrbus_omni_data(event_err_sts_clr_rw1c_alias_csrbus_omni_data),
						 .event_err_sts_clr_rw1s_alias_csrbus_read_data(event_err_sts_clr_rw1s_alias_csrbus_read_data),
						 .event_err_sts_clr_rw1s_alias_csrbus_omni_data(event_err_sts_clr_rw1s_alias_csrbus_omni_data),
						 .lnk_bit_err_cnt_1_csrbus_read_data(lnk_bit_err_cnt_1_csrbus_read_data),
						 .lnk_bit_err_cnt_1_csrbus_omni_data(lnk_bit_err_cnt_1_csrbus_omni_data),
						 .lnk_bit_err_cnt_2_csrbus_read_data(lnk_bit_err_cnt_2_csrbus_read_data),
						 .lnk_bit_err_cnt_2_csrbus_omni_data(lnk_bit_err_cnt_2_csrbus_omni_data),
						 .serdes_pll_csrbus_read_data(serdes_pll_csrbus_read_data),
						 .serdes_pll_csrbus_omni_data(serdes_pll_csrbus_omni_data),
						 .serdes_receiver_lane_ctl_csrbus_read_data(serdes_receiver_lane_ctl_csrbus_read_data),
						 .serdes_receiver_lane_ctl_csrbus_omni_data(serdes_receiver_lane_ctl_csrbus_omni_data),
						 .serdes_receiver_lane_status_csrbus_read_data(serdes_receiver_lane_status_csrbus_read_data),
						 .serdes_receiver_lane_status_csrbus_omni_data(serdes_receiver_lane_status_csrbus_omni_data),
						 .serdes_xmitter_lane_ctl_csrbus_read_data(serdes_xmitter_lane_ctl_csrbus_read_data),
						 .serdes_xmitter_lane_ctl_csrbus_omni_data(serdes_xmitter_lane_ctl_csrbus_omni_data),
						 .serdes_xmitter_lane_status_csrbus_read_data(serdes_xmitter_lane_status_csrbus_read_data),
						 .serdes_xmitter_lane_status_csrbus_omni_data(serdes_xmitter_lane_status_csrbus_omni_data),
						 .serdes_macro_test_cfg_csrbus_read_data(serdes_macro_test_cfg_csrbus_read_data),
						 .serdes_macro_test_cfg_csrbus_omni_data(serdes_macro_test_cfg_csrbus_omni_data)

						 );
   

   deserializer deser ( // Internally, model is gated by init_done
						.lane_in(link_in),
						.lane_in_bar(link_in_bar),
						.lane_out0(in_ln0),
						.lane_out1(in_ln1),
						.lane_out2(in_ln2),
						.lane_out3(in_ln3),
						.lane_out4(in_ln4),
						.lane_out5(in_ln5),
						.lane_out6(in_ln6),
						.lane_out7(in_ln7),
                        .lane_out8(in_ln8),
                        .lane_out9(in_ln9),
                        .lane_out0_b(in_ln0_b),
                        .lane_out1_b(in_ln1_b),
                        .lane_out2_b(in_ln2_b),
                        .lane_out3_b(in_ln3_b),
                        .lane_out4_b(in_ln4_b),
                        .lane_out5_b(in_ln5_b),
                        .lane_out6_b(in_ln6_b),
                        .lane_out7_b(in_ln7_b),
                        .lane_out8_b(in_ln8_b),
                        .lane_out9_b(in_ln9_b),
						.init_done(init_done_rx),
                        .ts1_pattern_received(ts1_pattern_received),
						.frm_boundary(frame_boundary_ltssm_rx),
						.data_rdy(in_data_rdy),
						.link_clk(link_clk_by_10_w)
						);
   
   serializer ser (
				   .out(link_out_w),
				   .out_bar(link_out_bar_w),
				   .lane_in0(out_ln0),
				   .lane_in1(out_ln1),
				   .lane_in2(out_ln2),
				   .lane_in3(out_ln3),
				   .lane_in4(out_ln4),
				   .lane_in5(out_ln5),
				   .lane_in6(out_ln6),
				   .lane_in7(out_ln7),
                   .lane_in8(out_ln8),
                   .lane_in9(out_ln9),
				   .frame_boundary(frame_boundary_ltssm_tx),
				   .link_clk(link_clk_by_10_w)
				   );

   skew       skew (.lane_in(((init_done || !stage_reinit) && (!last_idle_frame && !last_idle_frame_retraining))? link_out_w : link_out_w_ltssm),
                    .lane_in_bar( (init_done)? link_out_bar_w : link_out_bar_w_ltssm),
                    .link_clk (link_clk_by_10_w),
                    .out (out_w),
                    .out_bar (out_bar_w));

   
   

   
   
endmodule // peu
