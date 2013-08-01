/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peu_top.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#ifndef INC_peu_top_hpp__
#define INC_peu_top_hpp__

#include <systemc.h>

#include "peu_defines.hpp"

#ifdef LINK_1
#define LINK_WIDTH 1
#else
#ifdef LINK_2
#define LINK_WIDTH 2
#else
#ifdef LINK_4
#define LINK_WIDTH 4
#else
#define LINK_WIDTH 8
#endif
#endif
#endif

#define NUM_CSR_PORTS 9

#ifdef __EDG__
SC_MODULE (peu_top) 
{
    public:
        sc_in<bool>				l2t_clk;
        sc_in<bool>				j2p_rst_l;
        sc_in<bool>				j2p_por_l;

        /** 
          IHB Interface 
         */
        sc_in<bool>				d2p_ihb_clk; 	// IHB clk
        sc_in<bool>				d2p_ihb_rd;	// Read En
        sc_in<sc_bv<D2P_IHB_ADDR_WDTH> >	d2p_ihb_addr;	// Addr
        sc_out<sc_bv<P2D_IHB_DATA_WDTH> >	p2d_ihb_data;	// Data
        sc_out<sc_bv<P2D_IHB_DPAR_WDTH> >	p2d_ihb_dpar;	// Data Parity
        sc_out<sc_bv<P2D_IHB_WPTR_WDTH> >	p2d_ihb_wptr;	// Wr Ptr (GC)

        /** 
          IDB Interface 
         */
        sc_in<bool>				d2p_idb_clk; 	// IDB clk
        sc_in<bool>				d2p_idb_rd;		// Read En
        sc_in<sc_bv<D2P_IDB_ADDR_WDTH> >	d2p_idb_addr;	// Addr
        sc_out<sc_bv<P2D_IDB_DATA_WDTH> >	p2d_idb_data;	// Data
        sc_out<sc_bv<P2D_IDB_DPAR_WDTH> >	p2d_idb_dpar;	// Data Parity

        /**
          Ingress Buffer Credit Interface
         */
        sc_in<bool>				d2p_ibc_req;	// Ingr cr req
        sc_out<bool>				p2d_ibc_ack;	// Ack
        sc_in<sc_bv<D2P_IBC_NHC_WDTH> >	d2p_ibc_nhc;	// NPH credits
        sc_in<sc_bv<D2P_IBC_PHC_WDTH> >	d2p_ibc_phc;	// PH credits
        sc_in<sc_bv<D2P_IBC_PDC_WDTH> >	d2p_ibc_pdc;	// PD credits

        /**
          Completion Timeout Interface
         */
        sc_out<bool>				p2d_cto_req; 
        sc_out<sc_bv<P2D_CTO_TAG_WDTH> >	p2d_cto_tag;
        sc_in<bool>				d2p_cto_ack;

        /**
          Status Interface 
         */
        sc_out<bool>				p2d_drain; 	// Drain signal to ILU
        sc_out<sc_bv<P2D_MPS_WDTH> >		p2d_mps;	// Max Payld size
        sc_out<bool>				p2d_ue_int;	// uncorrectable error
        sc_out<bool>				p2d_ce_int;	// correctable error
        sc_out<bool>				p2d_oe_int;	// other error

        /**
          Buffer Management Interface  (all pointer values are gray coded)
         */
        sc_in<sc_bv<D2P_ECH_WPTR_WDTH> >	d2p_ech_wptr; // Cpl buf EHB wr ptr
        sc_out<sc_bv<P2D_ECH_RPTR_WDTH> >	p2d_ech_rptr; // Cpl buf EHB rd ptr
        sc_in<sc_bv<D2P_ERH_WPTR_WDTH> >	d2p_erh_wptr; // Req buf EHB wr ptr
        sc_out<sc_bv<P2D_ERH_RPTR_WDTH> >	p2d_erh_rptr; // Req buf EHB rd ptr
        sc_out<sc_bv<P2D_ECD_RPTR_WDTH> >	p2d_ecd_rptr; // DMA cpl buf rd ptr
        sc_out<sc_bv<P2D_ERD_RPTR_WDTH> >	p2d_erd_rptr; // PIO Wr buf rd ptr

        /**
          EHB Interfce
         */
        sc_in<bool>				d2p_ehb_we;   // EHB Write
        sc_in<sc_bv<D2P_EHB_ADDR_WDTH> >	d2p_ehb_addr; // EHB Wr ptr
        sc_in<sc_bv<D2P_EHB_DATA_WDTH> >	d2p_ehb_data; // EHB record
        sc_in<sc_bv<D2P_EHB_DPAR_WDTH> >	d2p_ehb_dpar; // EHB Wd Parity

        /**
          EDB Interfce
         */
        sc_in<bool>				d2p_edb_we;   // EDB Write 
        sc_in<sc_bv<D2P_EDB_ADDR_WDTH> >	d2p_edb_addr; // EDB Wr ptr
        sc_in<sc_bv<D2P_EDB_DATA_WDTH> >	d2p_edb_data; // EDB record
        sc_in<sc_bv<D2P_EDB_DPAR_WDTH> >	d2p_edb_dpar; // EDB Wd Parity

        /** 
          CSR Ring Interface
         */
        sc_in<bool>				d2p_csr_req;
        sc_in<sc_bv<D2P_CSR_RING_WDTH> >	d2p_csr_rcd;

        sc_in<bool>				d2p_csr_ack;

        sc_in<sc_bv<CSR_RING_WDTH> >		dcd2csr_ring_data;
        sc_out<sc_bv<CSR_RING_WDTH> >		csr2dcs_ring_data;

        // Inputs from the deserializer
        sc_in<sc_lv<LINK_WIDTH> > lane_in0;
        sc_in<sc_lv<LINK_WIDTH> > lane_in1;
        sc_in<sc_lv<LINK_WIDTH> > lane_in2;
        sc_in<sc_lv<LINK_WIDTH> > lane_in3;
        sc_in<sc_lv<LINK_WIDTH> > lane_in4;
        sc_in<sc_lv<LINK_WIDTH> > lane_in5;
        sc_in<sc_lv<LINK_WIDTH> > lane_in6;
        sc_in<sc_lv<LINK_WIDTH> > lane_in7;
        sc_in<sc_lv<LINK_WIDTH> > lane_in8;
        sc_in<sc_lv<LINK_WIDTH> > lane_in9;

        sc_in<sc_lv<LINK_WIDTH> > lane_in0_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in1_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in2_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in3_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in4_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in5_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in6_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in7_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in8_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in9_b;
        sc_out<bool > sym_boundary;

        // LTSSM input ports
        sc_in<sc_lv<LINK_WIDTH> > lane_in; // For input going into the ltssm
        sc_in<sc_lv<LINK_WIDTH> > lane_in_bar; // For input going into the ltssm
        sc_in<bool> link_clk; // Input clk to ltssm


        // Outputs to the serializer
        sc_out<sc_lv<LINK_WIDTH> > encoded_data0;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data1;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data2;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data3;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data4;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data5;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data6;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data7;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data8;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data9;
        sc_out<bool> ts1_pattern_received;
        sc_in<bool> frm_boundary_deser;
        // LTSSM output ports
        sc_out<sc_lv<LINK_WIDTH> > lane_out; // For output going from the ltssm
        sc_out<sc_lv<LINK_WIDTH> > lane_out_bar; // For output going from the ltssm
        sc_out<bool> init_done; // For init done signal from ltssm
        sc_out<bool> init_done_rx; // For init done signal from ltssm
        sc_out<bool> frame_boundary_ltssm_rx; // Output frame boundary from LTSSM
        sc_out<bool> frame_boundary_ltssm_tx; // Output frame boundary from LTSSM
        sc_out<bool> last_idle_frame;
        sc_out <bool> last_idle_frame_retraining;
        sc_out<bool> start_reinit;
        sc_out<bool> stage_reinit;
        sc_signal<bool> q_not_empty;
        sc_signal<bool> disable_scrambling;

        /// CSR Omni Interface Signals
        sc_out <sc_bv<64> > 	tlu_ctl_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ctl_csrbus_omni_data;

        sc_out <sc_bv<64> > 	ilu_err_rw1s_alias_csrbus_read_data;
        sc_in  <sc_bv<64> >   ilu_err_rw1s_alias_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_sts_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_sts_csrbus_omni_data;

        sc_out <sc_bv<64> > 	trn_off_csrbus_read_data;
        sc_in  <sc_bv<64> >   trn_off_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ici_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ici_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_diag_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_diag_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ecc_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ecc_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ecl_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ecl_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_erb_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_erb_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ica_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ica_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_icr_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_icr_csrbus_omni_data;

        sc_out <sc_bv<64> > 	oe_log_csrbus_read_data;
        sc_in  <sc_bv<64> >   oe_log_csrbus_omni_data;

        sc_out <sc_bv<64> > 	oe_int_en_csrbus_read_data;
        sc_in  <sc_bv<64> >   oe_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > roe_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  roe_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > roe_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  roe_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > toe_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  toe_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > toe_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  toe_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prfc_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prfc_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf0_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf0_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf1_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf1_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf2_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf2_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_dbg_sel_a_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_dbg_sel_a_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_dbg_sel_b_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_dbg_sel_b_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > slt_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  slt_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_log_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_log_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > rue_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  rue_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > rue_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  rue_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > tue_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  tue_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > tue_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  tue_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_log_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_log_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > peu_dlpl_serdes_rev_csrbus_read_data;
        sc_in<sc_bv<64> >  peu_dlpl_serdes_rev_csrbus_omni_data;

        sc_out<sc_bv<64> > acknak_thresh_csrbus_read_data;
        sc_in<sc_bv<64> >  acknak_thresh_csrbus_omni_data;

        sc_out<sc_bv<64> > acknak_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  acknak_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > replay_tim_thresh_csrbus_read_data;
        sc_in<sc_bv<64> >  replay_tim_thresh_csrbus_omni_data;

        sc_out<sc_bv<64> > replay_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  replay_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > ven_dllp_msg_csrbus_read_data;
        sc_in<sc_bv<64> >  ven_dllp_msg_csrbus_omni_data;

        sc_out<sc_bv<64> > force_ltssm_csrbus_read_data;
        sc_in<sc_bv<64> >  force_ltssm_csrbus_omni_data;

        sc_out<sc_bv<64> > link_cfg_csrbus_read_data;
        sc_in<sc_bv<64> >  link_cfg_csrbus_omni_data;

        sc_out<sc_bv<64> > link_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  link_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > lane_skew_csrbus_read_data;
        sc_in<sc_bv<64> >  lane_skew_csrbus_omni_data;

        sc_out<sc_bv<64> > symbol_num_csrbus_read_data;
        sc_in<sc_bv<64> >  symbol_num_csrbus_omni_data;

        sc_out<sc_bv<64> > symbol_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  symbol_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > core_status_csrbus_read_data;
        sc_in<sc_bv<64> >  core_status_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_log_en_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_log_en_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_int_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_int_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_sts_clr_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_sts_clr_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_sts_clr_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_sts_clr_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_bit_err_cnt_1_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_bit_err_cnt_1_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_bit_err_cnt_2_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_bit_err_cnt_2_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_pll_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_pll_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_receiver_lane_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_receiver_lane_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_receiver_lane_status_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_receiver_lane_status_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_xmitter_lane_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_xmitter_lane_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_xmitter_lane_status_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_xmitter_lane_status_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_macro_test_cfg_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_macro_test_cfg_csrbus_omni_data;


        peu_top ( sc_module_name module_name );

};

#else // __EDG__
#include "pcie_common/config.hpp"

#include "peu_csr.hpp"
#include "csr_top.hpp"
#include "pcie_top.hpp"
#include "ltssm.h"
#include "peu_csr_omni.h"
#include "pcie_common/tlm/tlm_data_channel.hpp"
#include "pcie_common/tlm/tlm_fifo_channel.hpp"
#include "ilu_intf.hpp"

USING_NAMESPACE(pcie);
using tlm::tlm_fifo_channel;

class peu_top : public sc_module
{
    public:
        typedef tlm_data_channel< RefPciePacket > data_channel;  
        peu_top ( sc_module_name module_name );

        sc_in<bool>						l2t_clk;
        sc_in<bool>						j2p_rst_l;
        sc_in<bool>						j2p_por_l;

        /** 
          IHB Interface 
         */
        sc_in<bool>				d2p_ihb_clk; 	// IHB clk
        sc_in<bool>				d2p_ihb_rd;	// Read En
        sc_in<sc_bv<D2P_IHB_ADDR_WDTH> >	d2p_ihb_addr;	// Addr
        sc_out<sc_bv<P2D_IHB_DATA_WDTH> >	p2d_ihb_data;	// Data
        sc_out<sc_bv<P2D_IHB_DPAR_WDTH> >	p2d_ihb_dpar;	// Data Parity
        sc_out<sc_bv<P2D_IHB_WPTR_WDTH> >	p2d_ihb_wptr;	// Wr Ptr (GC)

        /** 
          IDB Interface 
         */
        sc_in<bool>				d2p_idb_clk; 	// IDB clk
        sc_in<bool>				d2p_idb_rd;	// Read En
        sc_in<sc_bv<D2P_IDB_ADDR_WDTH> >	d2p_idb_addr;	// Addr
        sc_out<sc_bv<P2D_IDB_DATA_WDTH> >	p2d_idb_data;	// Data
        sc_out<sc_bv<P2D_IDB_DPAR_WDTH> >	p2d_idb_dpar;	// Data Parity

        /**
          Ingress Buffer Credit Interface
         */
        sc_in<bool>				d2p_ibc_req;	// Ingr cr req
        sc_out<bool>				p2d_ibc_ack;	// Ack
        sc_in<sc_bv<D2P_IBC_NHC_WDTH> >	d2p_ibc_nhc;	// NPH credits
        sc_in<sc_bv<D2P_IBC_PHC_WDTH> >	d2p_ibc_phc;	// PH credits
        sc_in<sc_bv<D2P_IBC_PDC_WDTH> >	d2p_ibc_pdc;	// PD credits

        /**
          Completion Timeout Interface
         */
        sc_out<bool>				p2d_cto_req; 
        sc_out<sc_bv<P2D_CTO_TAG_WDTH> >	p2d_cto_tag;
        sc_in<bool>				d2p_cto_ack;

        /**
          Status Interface 
         */
        sc_out<bool>				p2d_drain; 	// Drain signal to ILU
        sc_out<sc_bv<P2D_MPS_WDTH> >		p2d_mps;	// Max Payld size
        sc_out<bool>				p2d_ue_int;	// uncorrectable error
        sc_out<bool>				p2d_ce_int;	// correctable error
        sc_out<bool>				p2d_oe_int;	// other error

        /**
          Buffer Management Interface  (all pointer values are gray coded)
         */
        sc_in<sc_bv<D2P_ECH_WPTR_WDTH> >	d2p_ech_wptr; // Cpl buf EHB wr ptr
        sc_out<sc_bv<P2D_ECH_RPTR_WDTH> >	p2d_ech_rptr; // Cpl buf EHB rd ptr
        sc_in<sc_bv<D2P_ERH_WPTR_WDTH> >	d2p_erh_wptr; // Req buf EHB wr ptr
        sc_out<sc_bv<P2D_ERH_RPTR_WDTH> >	p2d_erh_rptr; // Req buf EHB rd ptr
        sc_out<sc_bv<P2D_ECD_RPTR_WDTH> >	p2d_ecd_rptr; // DMA cpl buf rd ptr
        sc_out<sc_bv<P2D_ERD_RPTR_WDTH> >	p2d_erd_rptr; // PIO Wr buf rd ptr

        /**
          EHB Interfce
         */
        sc_in<bool>				d2p_ehb_we;   // EHB Write
        sc_in<sc_bv<D2P_EHB_ADDR_WDTH> >	d2p_ehb_addr; // EHB Wr ptr
        sc_in<sc_bv<D2P_EHB_DATA_WDTH> >	d2p_ehb_data; // EHB record
        sc_in<sc_bv<D2P_EHB_DPAR_WDTH> >	d2p_ehb_dpar; // EHB Wd Parity

        /**
          EDB Interfce
         */
        sc_in<bool>				d2p_edb_we;   // EDB Write 
        sc_in<sc_bv<D2P_EDB_ADDR_WDTH> >	d2p_edb_addr; // EDB Wr ptr
        sc_in<sc_bv<D2P_EDB_DATA_WDTH> >	d2p_edb_data; // EDB record
        sc_in<sc_bv<D2P_EDB_DPAR_WDTH> >	d2p_edb_dpar; // EDB Wd Parity

        /** 
          CSR Ring Interface
         */
        sc_in<bool>				d2p_csr_req;
        sc_in<sc_bv<D2P_CSR_RING_WDTH> >	d2p_csr_rcd;

        sc_in<bool>				d2p_csr_ack;

        sc_in<sc_bv<CSR_RING_WDTH> >	dcd2csr_ring_data;
        sc_out<sc_bv<CSR_RING_WDTH> >	csr2dcs_ring_data;

        // Inputs from the deserializer
        sc_in<sc_lv<LINK_WIDTH> > lane_in0;
        sc_in<sc_lv<LINK_WIDTH> > lane_in1;
        sc_in<sc_lv<LINK_WIDTH> > lane_in2;
        sc_in<sc_lv<LINK_WIDTH> > lane_in3;
        sc_in<sc_lv<LINK_WIDTH> > lane_in4;
        sc_in<sc_lv<LINK_WIDTH> > lane_in5;
        sc_in<sc_lv<LINK_WIDTH> > lane_in6;
        sc_in<sc_lv<LINK_WIDTH> > lane_in7;
        sc_in<sc_lv<LINK_WIDTH> > lane_in8;
        sc_in<sc_lv<LINK_WIDTH> > lane_in9;

        sc_in<sc_lv<LINK_WIDTH> > lane_in0_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in1_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in2_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in3_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in4_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in5_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in6_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in7_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in8_b;
        sc_in<sc_lv<LINK_WIDTH> > lane_in9_b;
        sc_in<bool> frm_boundary_deser;


        // LTSSM input ports
        sc_in<sc_lv<LINK_WIDTH> > lane_in; // For input going into the ltssm
        sc_in<sc_lv<LINK_WIDTH> > lane_in_bar; // For input going into the ltssm
        sc_in<bool> link_clk; // Input clk to ltssm


        //Outputs to the serializer
        sc_out<sc_lv<LINK_WIDTH> > encoded_data0;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data1;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data2;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data3;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data4;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data5;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data6;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data7;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data8;
        sc_out<sc_lv<LINK_WIDTH> > encoded_data9;
        sc_out<bool> ts1_pattern_received;
        sc_out<bool > sym_boundary;



        // LTSSM output ports
        sc_out<sc_lv<LINK_WIDTH> > lane_out; // For output going from the ltssm
        sc_out<sc_lv<LINK_WIDTH> > lane_out_bar; // For output going from the ltssm
        sc_out<bool> init_done; // For init done signal from ltssm
        sc_out<bool> init_done_rx; // For init done signal from ltssm
        sc_out<bool> frame_boundary_ltssm_rx; // Output frame boundary from LTSSM
        sc_out<bool> frame_boundary_ltssm_tx; // Output frame boundary from LTSSM
        sc_out <bool> last_idle_frame;
        sc_out <bool> last_idle_frame_retraining;
        sc_out<bool> start_reinit;
        sc_out<bool> stage_reinit;
        sc_signal<bool> disable_scrambling;
        sc_signal <bool> q_not_empty;

        /// CSR Omni Interface Signals
        sc_out <sc_bv<64> > 	tlu_ctl_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ctl_csrbus_omni_data;

        sc_out <sc_bv<64> > 	ilu_err_rw1s_alias_csrbus_read_data;
        sc_in  <sc_bv<64> >   ilu_err_rw1s_alias_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_sts_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_sts_csrbus_omni_data;

        sc_out <sc_bv<64> > 	trn_off_csrbus_read_data;
        sc_in  <sc_bv<64> >   trn_off_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ici_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ici_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_diag_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_diag_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ecc_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ecc_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ecl_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ecl_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_erb_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_erb_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_ica_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_ica_csrbus_omni_data;

        sc_out <sc_bv<64> > 	tlu_icr_csrbus_read_data;
        sc_in  <sc_bv<64> >   tlu_icr_csrbus_omni_data;

        sc_out <sc_bv<64> > 	oe_log_csrbus_read_data;
        sc_in  <sc_bv<64> >   oe_log_csrbus_omni_data;

        sc_out <sc_bv<64> > 	oe_int_en_csrbus_read_data;
        sc_in  <sc_bv<64> >   oe_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > oe_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  oe_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > roe_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  roe_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > roe_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  roe_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > toe_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  toe_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > toe_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  toe_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prfc_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prfc_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf0_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf0_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf1_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf1_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_prf2_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_prf2_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_dbg_sel_a_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_dbg_sel_a_csrbus_omni_data;

        sc_out<sc_bv<64> > tlu_dbg_sel_b_csrbus_read_data;
        sc_in<sc_bv<64> >  tlu_dbg_sel_b_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > dev_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  dev_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > slt_cap_csrbus_read_data;
        sc_in<sc_bv<64> >  slt_cap_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_log_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_log_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > ue_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ue_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > rue_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  rue_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > rue_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  rue_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > tue_hdr1_csrbus_read_data;
        sc_in<sc_bv<64> >  tue_hdr1_csrbus_omni_data;

        sc_out<sc_bv<64> > tue_hdr2_csrbus_read_data;
        sc_in<sc_bv<64> >  tue_hdr2_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_log_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_log_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_en_err_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_en_err_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_err_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_err_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > ce_err_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  ce_err_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > peu_dlpl_serdes_rev_csrbus_read_data;
        sc_in<sc_bv<64> >  peu_dlpl_serdes_rev_csrbus_omni_data;

        sc_out<sc_bv<64> > acknak_thresh_csrbus_read_data;
        sc_in<sc_bv<64> >  acknak_thresh_csrbus_omni_data;

        sc_out<sc_bv<64> > acknak_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  acknak_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > replay_tim_thresh_csrbus_read_data;
        sc_in<sc_bv<64> >  replay_tim_thresh_csrbus_omni_data;

        sc_out<sc_bv<64> > replay_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  replay_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > ven_dllp_msg_csrbus_read_data;
        sc_in<sc_bv<64> >  ven_dllp_msg_csrbus_omni_data;

        sc_out<sc_bv<64> > force_ltssm_csrbus_read_data;
        sc_in<sc_bv<64> >  force_ltssm_csrbus_omni_data;

        sc_out<sc_bv<64> > link_cfg_csrbus_read_data;
        sc_in<sc_bv<64> >  link_cfg_csrbus_omni_data;

        sc_out<sc_bv<64> > link_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  link_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > lane_skew_csrbus_read_data;
        sc_in<sc_bv<64> >  lane_skew_csrbus_omni_data;

        sc_out<sc_bv<64> > symbol_num_csrbus_read_data;
        sc_in<sc_bv<64> >  symbol_num_csrbus_omni_data;

        sc_out<sc_bv<64> > symbol_timer_csrbus_read_data;
        sc_in<sc_bv<64> >  symbol_timer_csrbus_omni_data;

        sc_out<sc_bv<64> > core_status_csrbus_read_data;
        sc_in<sc_bv<64> >  core_status_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_log_en_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_log_en_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_int_en_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_int_en_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_int_sts_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_int_sts_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_sts_clr_rw1c_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_sts_clr_rw1c_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > event_err_sts_clr_rw1s_alias_csrbus_read_data;
        sc_in<sc_bv<64> >  event_err_sts_clr_rw1s_alias_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_bit_err_cnt_1_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_bit_err_cnt_1_csrbus_omni_data;

        sc_out<sc_bv<64> > lnk_bit_err_cnt_2_csrbus_read_data;
        sc_in<sc_bv<64> >  lnk_bit_err_cnt_2_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_pll_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_pll_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_receiver_lane_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_receiver_lane_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_receiver_lane_status_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_receiver_lane_status_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_xmitter_lane_ctl_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_xmitter_lane_ctl_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_xmitter_lane_status_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_xmitter_lane_status_csrbus_omni_data;

        sc_out<sc_bv<64> > serdes_macro_test_cfg_csrbus_read_data;
        sc_in<sc_bv<64> >  serdes_macro_test_cfg_csrbus_omni_data;


        peu_csr 		        *peu_csr_i;
        csr_top<NUM_CSR_PORTS>	        *csr_i;
        pcie_top			*pcie_i; // pcie_top
        ltssm                           *ltssm_i; // ltssm
        peu_csr_omni			*peu_csr_omni_i;

        ilu_intf			*ilu_intf_i;
        data_channel 			*tl_in_data_chnl;
        data_channel 			*tl_out_data_chnl;
        data_channel 			*tl_req_data_chnl;
        data_channel 			*tl_preq_data_chnl;
        data_channel 			*tl_npreq_data_chnl;
        data_channel 			*tl_cmpl_data_chnl;
        data_channel 			*tl_tc0_data_chnl;
        data_channel 			*tl_tc1_data_chnl;
        data_channel 			*tl_tc2_data_chnl;
        data_channel 			*tl_tc3_data_chnl;
        data_channel 			*tl_tc4_data_chnl;
        data_channel 			*tl_tc5_data_chnl;
        data_channel 			*tl_tc6_data_chnl;
        data_channel 			*tl_tc7_data_chnl;
        tlm_fifo_channel<sc_uint<5> >   *tl_cto_req_chnl;

        //Global Event
        sc_event      global_event;
        uint8         global_event_type;
};

#endif // __EDG__

#endif //INC_peu_top_hpp__
