// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_top.cpp
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
#include "peu_top.h"

#ifndef __EDG__
 
#include "pcie_common/config.hpp"
#include "pcie_common/logger.hpp"


class set_time_resolution
{
    public:
        set_time_resolution()
        {
            sc_set_time_resolution(1, SC_PS);
            sc_set_default_time_unit(1, SC_PS);
        }
};

static int SetTimeResolution()
{
    new set_time_resolution();
    return 1;
}

static int time_resolution_is_set = SetTimeResolution();


USING_NAMESPACE(Logger);
logger* logger::inst = 0;
data_scrambler *data_scrambler::scrambler = 0;
data_scrambler *data_scrambler::descrambler = 0;
running_disparity *running_disparity::disparity = 0;
running_disparity *running_disparity::rx_disparity = 0;
int packetRef::ref_id_ctr = 0;

peu_top::peu_top ( sc_module_name module_name ) :
    sc_module (module_name)
{
    LOG_DEBUG << " > PEU_TOP ()::ctor()";

 
  LOG_DEBUG << " > PEU_TOP ()::ctor()";

  cout << "Number of arguments = " << sc_argc() << endl;
  for (int i = 0; i < sc_argc(); i++) {
	LOG_DEBUG << "Command Arg " << i << " " << sc_argv()[i];
	if (strcmp(sc_argv()[i], "-SYSC_LOG_LEVEL=ALWAYS") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::ALWAYS;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_ERROR") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::ERROR;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_WARNING") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::WARNING;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_NORMAL") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::NORMAL;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_VERBOSE") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::VERBOSE;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_INFO") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::INFO;
	} else if (strcmp(sc_argv()[i], "-SYSC_LOG_DEBUG") == 0) {
	  logger::instance()->log_level = (Logger::LogLevel) Logger::DEBUG;
	}
  }


    csr_i             = new csr_top<NUM_CSR_PORTS> ("CSR_TOP",&global_event,&global_event_type);
    peu_csr_i         = new peu_csr ("PEU_CSR");
    pcie_i            = new pcie_top("PCIE_TOP",           &global_event,&global_event_type);
    ltssm_i           = new ltssm("LTSSM");
    peu_csr_omni_i    = new peu_csr_omni("PEU_CSR_OMNI");
    ilu_intf_i        = new ilu_intf("ILU_INTF",           &global_event,&global_event_type);
    tl_in_data_chnl   = new data_channel("TL_INGRESS_CHNL",&global_event,&global_event_type);
    tl_req_data_chnl  = new data_channel("TL_REQ_CHNL",    &global_event,&global_event_type);
    tl_cmpl_data_chnl = new data_channel("TL_CMPL_CHNL",   &global_event,&global_event_type);
    tl_cto_req_chnl   = new tlm_fifo_channel <sc_uint<5> > ("TL_CTO_REQ_CHNL");


    ilu_intf_i->in_pkt_port(*tl_in_data_chnl);
    ilu_intf_i->req_pkt_port(*tl_req_data_chnl);
    ilu_intf_i->cmpl_pkt_port(*tl_cmpl_data_chnl);

    ilu_intf_i->cto_req_port(tl_cto_req_chnl->get_data_export);

    pcie_i->tl->m_etl->req_port(*tl_req_data_chnl);
    pcie_i->tl->m_etl->cmpl_port(*tl_cmpl_data_chnl);
    pcie_i->tl->m_itl->d_out_port(*tl_in_data_chnl);
    pcie_i->tl->m_rsb->cto_req_port(tl_cto_req_chnl->put_data_export);

    // CSR connections to requesting modules
    peu_csr_i->csr_port(csr_i->chnl[0].target_export);
    ltssm_i->csr_port(csr_i->chnl[2].target_export);
    pcie_i->dll->csr_port(csr_i->chnl[1].target_export);
    peu_csr_omni_i->csr_port(csr_i->chnl[3].target_export);
    pcie_i->tl->m_etl->csr_port(csr_i->chnl[4].target_export);
    pcie_i->tl->m_itl->csr_port(csr_i->chnl[5].target_export);
    pcie_i->tl->csr_port(csr_i->chnl[6].target_export);
    ilu_intf_i->csr_port(csr_i->chnl[7].target_export);
    pcie_i->tl->m_rsb->csr_port(csr_i->chnl[8].target_export);

    peu_csr_i->csr_if_clk(l2t_clk);
    peu_csr_i->rst_l(j2p_rst_l);
    peu_csr_i->ring_data_in(dcd2csr_ring_data);
    peu_csr_i->ring_data_out(csr2dcs_ring_data);

    // peu_top connections to PL
    pcie_i->deser_data0(lane_in0);
    pcie_i->deser_data1(lane_in1);
    pcie_i->deser_data2(lane_in2);
    pcie_i->deser_data3(lane_in3);
    pcie_i->deser_data4(lane_in4);
    pcie_i->deser_data5(lane_in5);
    pcie_i->deser_data6(lane_in6);
    pcie_i->deser_data7(lane_in7);
    pcie_i->deser_data8(lane_in8);
    pcie_i->deser_data9(lane_in9);

    pcie_i->deser_data0_b(lane_in0_b);
    pcie_i->deser_data1_b(lane_in1_b);
    pcie_i->deser_data2_b(lane_in2_b);
    pcie_i->deser_data3_b(lane_in3_b);
    pcie_i->deser_data4_b(lane_in4_b);
    pcie_i->deser_data5_b(lane_in5_b);
    pcie_i->deser_data6_b(lane_in6_b);
    pcie_i->deser_data7_b(lane_in7_b);
    pcie_i->deser_data8_b(lane_in8_b);
    pcie_i->deser_data9_b(lane_in9_b);
    pcie_i->frm_boundary_deser(frm_boundary_deser);
    pcie_i->disable_scrambling(disable_scrambling);

    pcie_i->link_clk(link_clk);
    pcie_i->encoded_data0(encoded_data0);
    pcie_i->encoded_data1(encoded_data1);
    pcie_i->encoded_data2(encoded_data2);
    pcie_i->encoded_data3(encoded_data3);
    pcie_i->encoded_data4(encoded_data4);
    pcie_i->encoded_data5(encoded_data5);
    pcie_i->encoded_data6(encoded_data6);
    pcie_i->encoded_data7(encoded_data7);
    pcie_i->encoded_data8(encoded_data8);
    pcie_i->encoded_data9(encoded_data9);
    pcie_i->sym_boundary(sym_boundary);
    pcie_i->init_done(init_done);
    pcie_i->init_done_rx(init_done_rx);
    pcie_i->pl->q_not_empty(q_not_empty);
    pcie_i->pl->frame_boundary_ltssm_tx(frame_boundary_ltssm_tx);
    pcie_i->pl->last_idle_frame(last_idle_frame);
    pcie_i->pl->reset_l(j2p_rst_l);
    pcie_i->pl->reset_por_l(j2p_por_l);
    pcie_i->pl->start_reinit(start_reinit);
    pcie_i->pl->stage_reinit(stage_reinit);
    pcie_i->pl->ts1_pattern_received(ts1_pattern_received);

    // LTSSM connections
    ltssm_i->lane_in(lane_in);
    ltssm_i->lane_in_bar(lane_in_bar);
    ltssm_i->link_clk(link_clk);
    ltssm_i->lane_out(lane_out);
    ltssm_i->lane_out_bar(lane_out_bar);
    ltssm_i->disable_scrambling(disable_scrambling);
    ltssm_i->init_done(init_done);
    ltssm_i->init_done_rx(init_done_rx);
    ltssm_i->frame_boundary_rx(frame_boundary_ltssm_rx);
    ltssm_i->frame_boundary_tx(frame_boundary_ltssm_tx);
    ltssm_i->reset_l(j2p_rst_l);
    ltssm_i->reset_por_l(j2p_por_l);
    ltssm_i->q_not_empty(q_not_empty);
    ltssm_i->last_idle_frame(last_idle_frame);
    ltssm_i->last_idle_frame_retraining(last_idle_frame_retraining);
    ltssm_i->start_reinit(start_reinit);
    ltssm_i->ts1_pattern_received(ts1_pattern_received);

    /// ILU Intf
    ilu_intf_i->clk(l2t_clk);
    ilu_intf_i->rst_l(j2p_rst_l);
    ilu_intf_i->d2p_ihb_clk(d2p_ihb_clk);
    ilu_intf_i->d2p_ihb_rd(d2p_ihb_rd);
    ilu_intf_i->d2p_ihb_addr(d2p_ihb_addr);
    ilu_intf_i->p2d_ihb_data(p2d_ihb_data);
    ilu_intf_i->p2d_ihb_dpar(p2d_ihb_dpar);
    ilu_intf_i->p2d_ihb_wptr(p2d_ihb_wptr);
    ilu_intf_i->d2p_idb_clk(d2p_idb_clk);
    ilu_intf_i->d2p_idb_rd(d2p_idb_rd);
    ilu_intf_i->d2p_idb_addr(d2p_idb_addr);
    ilu_intf_i->p2d_idb_data(p2d_idb_data);
    ilu_intf_i->p2d_idb_dpar(p2d_idb_dpar);
    ilu_intf_i->d2p_ibc_req(d2p_ibc_req);
    ilu_intf_i->p2d_ibc_ack(p2d_ibc_ack);
    ilu_intf_i->d2p_ibc_nhc(d2p_ibc_nhc);
    ilu_intf_i->d2p_ibc_phc(d2p_ibc_phc);
    ilu_intf_i->d2p_ibc_pdc(d2p_ibc_pdc);
    ilu_intf_i->p2d_cto_req(p2d_cto_req);
    ilu_intf_i->p2d_cto_tag(p2d_cto_tag);
    ilu_intf_i->d2p_cto_ack(d2p_cto_ack);
    ilu_intf_i->p2d_drain(p2d_drain);
    ilu_intf_i->p2d_mps(p2d_mps);
    ilu_intf_i->p2d_ue_int(p2d_ue_int);
    ilu_intf_i->p2d_ce_int(p2d_ce_int);
    ilu_intf_i->p2d_oe_int(p2d_oe_int);
    ilu_intf_i->d2p_ech_wptr(d2p_ech_wptr);
    ilu_intf_i->p2d_ech_rptr(p2d_ech_rptr);
    ilu_intf_i->d2p_erh_wptr(d2p_erh_wptr);
    ilu_intf_i->p2d_erh_rptr(p2d_erh_rptr);
    ilu_intf_i->p2d_ecd_rptr(p2d_ecd_rptr);
    ilu_intf_i->p2d_erd_rptr(p2d_erd_rptr);
    ilu_intf_i->d2p_ehb_we(d2p_ehb_we);
    ilu_intf_i->d2p_ehb_addr(d2p_ehb_addr);
    ilu_intf_i->d2p_ehb_data(d2p_ehb_data);
    ilu_intf_i->d2p_ehb_dpar(d2p_ehb_dpar);
    ilu_intf_i->d2p_edb_we(d2p_edb_we);
    ilu_intf_i->d2p_edb_addr(d2p_edb_addr);
    ilu_intf_i->d2p_edb_data(d2p_edb_data);
    ilu_intf_i->d2p_edb_dpar(d2p_edb_dpar);


    /// PEU CSR OMNI Intf
    peu_csr_omni_i->tlu_ctl_csrbus_read_data(tlu_ctl_csrbus_read_data);
    peu_csr_omni_i->tlu_ctl_csrbus_omni_data(tlu_ctl_csrbus_omni_data);
    peu_csr_omni_i->ilu_err_rw1s_alias_csrbus_read_data(ilu_err_rw1s_alias_csrbus_read_data);
    peu_csr_omni_i->ilu_err_rw1s_alias_csrbus_omni_data(ilu_err_rw1s_alias_csrbus_omni_data);
    peu_csr_omni_i->tlu_sts_csrbus_read_data(tlu_sts_csrbus_read_data);
    peu_csr_omni_i->tlu_sts_csrbus_omni_data(tlu_sts_csrbus_omni_data);
    peu_csr_omni_i->trn_off_csrbus_read_data(trn_off_csrbus_read_data);
    peu_csr_omni_i->trn_off_csrbus_omni_data(trn_off_csrbus_omni_data);
    peu_csr_omni_i->tlu_ici_csrbus_read_data(tlu_ici_csrbus_read_data);
    peu_csr_omni_i->tlu_ici_csrbus_omni_data(tlu_ici_csrbus_omni_data);
    peu_csr_omni_i->tlu_diag_csrbus_read_data(tlu_diag_csrbus_read_data);
    peu_csr_omni_i->tlu_diag_csrbus_omni_data(tlu_diag_csrbus_omni_data);
    peu_csr_omni_i->tlu_ecc_csrbus_read_data(tlu_ecc_csrbus_read_data);
    peu_csr_omni_i->tlu_ecc_csrbus_omni_data(tlu_ecc_csrbus_omni_data);
    peu_csr_omni_i->tlu_ecl_csrbus_read_data(tlu_ecl_csrbus_read_data);
    peu_csr_omni_i->tlu_ecl_csrbus_omni_data(tlu_ecl_csrbus_omni_data);
    peu_csr_omni_i->tlu_erb_csrbus_read_data(tlu_erb_csrbus_read_data);
    peu_csr_omni_i->tlu_erb_csrbus_omni_data(tlu_erb_csrbus_omni_data);
    peu_csr_omni_i->tlu_ica_csrbus_read_data(tlu_ica_csrbus_read_data);
    peu_csr_omni_i->tlu_ica_csrbus_omni_data(tlu_ica_csrbus_omni_data);
    peu_csr_omni_i->tlu_icr_csrbus_read_data(tlu_icr_csrbus_read_data);
    peu_csr_omni_i->tlu_icr_csrbus_omni_data(tlu_icr_csrbus_omni_data);
    peu_csr_omni_i->oe_log_csrbus_read_data(oe_log_csrbus_read_data);
    peu_csr_omni_i->oe_log_csrbus_omni_data(oe_log_csrbus_omni_data);
    peu_csr_omni_i->oe_int_en_csrbus_read_data(oe_int_en_csrbus_read_data);
    peu_csr_omni_i->oe_int_en_csrbus_omni_data(oe_int_en_csrbus_omni_data);

    peu_csr_omni_i->oe_en_err_csrbus_read_data(oe_en_err_csrbus_read_data);
    peu_csr_omni_i->oe_en_err_csrbus_omni_data(oe_en_err_csrbus_omni_data);

    peu_csr_omni_i->oe_err_rw1c_alias_csrbus_read_data(oe_err_rw1c_alias_csrbus_read_data);
    peu_csr_omni_i->oe_err_rw1c_alias_csrbus_omni_data(oe_err_rw1c_alias_csrbus_omni_data);

    peu_csr_omni_i->oe_err_rw1s_alias_csrbus_read_data(oe_err_rw1s_alias_csrbus_read_data);
    peu_csr_omni_i->oe_err_rw1s_alias_csrbus_omni_data(oe_err_rw1s_alias_csrbus_omni_data);

    peu_csr_omni_i->roe_hdr1_csrbus_read_data(roe_hdr1_csrbus_read_data);
    peu_csr_omni_i->roe_hdr1_csrbus_omni_data(roe_hdr1_csrbus_omni_data);

    peu_csr_omni_i->roe_hdr2_csrbus_read_data(roe_hdr2_csrbus_read_data);
    peu_csr_omni_i->roe_hdr2_csrbus_omni_data(roe_hdr2_csrbus_omni_data);

    peu_csr_omni_i->toe_hdr1_csrbus_read_data(toe_hdr1_csrbus_read_data);
    peu_csr_omni_i->toe_hdr1_csrbus_omni_data(toe_hdr1_csrbus_omni_data);

    peu_csr_omni_i->toe_hdr2_csrbus_read_data(toe_hdr2_csrbus_read_data);
    peu_csr_omni_i->toe_hdr2_csrbus_omni_data(toe_hdr2_csrbus_omni_data);

    peu_csr_omni_i->tlu_prfc_csrbus_read_data(tlu_prfc_csrbus_read_data);
    peu_csr_omni_i->tlu_prfc_csrbus_omni_data(tlu_prfc_csrbus_omni_data);

    peu_csr_omni_i->tlu_prf0_csrbus_read_data(tlu_prf0_csrbus_read_data);
    peu_csr_omni_i->tlu_prf0_csrbus_omni_data(tlu_prf0_csrbus_omni_data);

    peu_csr_omni_i->tlu_prf1_csrbus_read_data(tlu_prf1_csrbus_read_data);
    peu_csr_omni_i->tlu_prf1_csrbus_omni_data(tlu_prf1_csrbus_omni_data);

    peu_csr_omni_i->tlu_prf2_csrbus_read_data(tlu_prf2_csrbus_read_data);
    peu_csr_omni_i->tlu_prf2_csrbus_omni_data(tlu_prf2_csrbus_omni_data);

    peu_csr_omni_i->tlu_dbg_sel_a_csrbus_read_data(tlu_dbg_sel_a_csrbus_read_data);
    peu_csr_omni_i->tlu_dbg_sel_a_csrbus_omni_data(tlu_dbg_sel_a_csrbus_omni_data);

    peu_csr_omni_i->tlu_dbg_sel_b_csrbus_read_data(tlu_dbg_sel_b_csrbus_read_data);
    peu_csr_omni_i->tlu_dbg_sel_b_csrbus_omni_data(tlu_dbg_sel_b_csrbus_omni_data);

    peu_csr_omni_i->dev_cap_csrbus_read_data(dev_cap_csrbus_read_data);
    peu_csr_omni_i->dev_cap_csrbus_omni_data(dev_cap_csrbus_omni_data);

    peu_csr_omni_i->dev_ctl_csrbus_read_data(dev_ctl_csrbus_read_data);
    peu_csr_omni_i->dev_ctl_csrbus_omni_data(dev_ctl_csrbus_omni_data);

    peu_csr_omni_i->dev_sts_csrbus_read_data(dev_sts_csrbus_read_data);
    peu_csr_omni_i->dev_sts_csrbus_omni_data(dev_sts_csrbus_omni_data);

    peu_csr_omni_i->lnk_cap_csrbus_read_data(lnk_cap_csrbus_read_data);
    peu_csr_omni_i->lnk_cap_csrbus_omni_data(lnk_cap_csrbus_omni_data);

    peu_csr_omni_i->lnk_ctl_csrbus_read_data(lnk_ctl_csrbus_read_data);
    peu_csr_omni_i->lnk_ctl_csrbus_omni_data(lnk_ctl_csrbus_omni_data);

    peu_csr_omni_i->lnk_sts_csrbus_read_data(lnk_sts_csrbus_read_data);
    peu_csr_omni_i->lnk_sts_csrbus_omni_data(lnk_sts_csrbus_omni_data);

    peu_csr_omni_i->slt_cap_csrbus_read_data(slt_cap_csrbus_read_data);
    peu_csr_omni_i->slt_cap_csrbus_omni_data(slt_cap_csrbus_omni_data);

    peu_csr_omni_i->ue_log_csrbus_read_data(ue_log_csrbus_read_data);
    peu_csr_omni_i->ue_log_csrbus_omni_data(ue_log_csrbus_omni_data);

    peu_csr_omni_i->ue_int_en_csrbus_read_data(ue_int_en_csrbus_read_data);
    peu_csr_omni_i->ue_int_en_csrbus_omni_data(ue_int_en_csrbus_omni_data);

    peu_csr_omni_i->ue_en_err_csrbus_read_data(ue_en_err_csrbus_read_data);
    peu_csr_omni_i->ue_en_err_csrbus_omni_data(ue_en_err_csrbus_omni_data);

    peu_csr_omni_i->ue_err_rw1c_alias_csrbus_read_data(ue_err_rw1c_alias_csrbus_read_data);
    peu_csr_omni_i->ue_err_rw1c_alias_csrbus_omni_data(ue_err_rw1c_alias_csrbus_omni_data);

    peu_csr_omni_i->ue_err_rw1s_alias_csrbus_read_data(ue_err_rw1s_alias_csrbus_read_data);
    peu_csr_omni_i->ue_err_rw1s_alias_csrbus_omni_data(ue_err_rw1s_alias_csrbus_omni_data);

    peu_csr_omni_i->rue_hdr1_csrbus_read_data(rue_hdr1_csrbus_read_data);
    peu_csr_omni_i->rue_hdr1_csrbus_omni_data(rue_hdr1_csrbus_omni_data);

    peu_csr_omni_i->rue_hdr2_csrbus_read_data(rue_hdr2_csrbus_read_data);
    peu_csr_omni_i->rue_hdr2_csrbus_omni_data(rue_hdr2_csrbus_omni_data);

    peu_csr_omni_i->tue_hdr1_csrbus_read_data(tue_hdr1_csrbus_read_data);
    peu_csr_omni_i->tue_hdr1_csrbus_omni_data(tue_hdr1_csrbus_omni_data);

    peu_csr_omni_i->tue_hdr2_csrbus_read_data(tue_hdr2_csrbus_read_data);
    peu_csr_omni_i->tue_hdr2_csrbus_omni_data(tue_hdr2_csrbus_omni_data);

    peu_csr_omni_i->ce_log_csrbus_read_data(ce_log_csrbus_read_data);
    peu_csr_omni_i->ce_log_csrbus_omni_data(ce_log_csrbus_omni_data);

    peu_csr_omni_i->ce_int_en_csrbus_read_data(ce_int_en_csrbus_read_data);
    peu_csr_omni_i->ce_int_en_csrbus_omni_data(ce_int_en_csrbus_omni_data);

    peu_csr_omni_i->ce_en_err_csrbus_read_data(ce_en_err_csrbus_read_data);
    peu_csr_omni_i->ce_en_err_csrbus_omni_data(ce_en_err_csrbus_omni_data);

    peu_csr_omni_i->ce_err_rw1c_alias_csrbus_read_data(ce_err_rw1c_alias_csrbus_read_data);
    peu_csr_omni_i->ce_err_rw1c_alias_csrbus_omni_data(ce_err_rw1c_alias_csrbus_omni_data);

    peu_csr_omni_i->ce_err_rw1s_alias_csrbus_read_data(ce_err_rw1s_alias_csrbus_read_data);
    peu_csr_omni_i->ce_err_rw1s_alias_csrbus_omni_data(ce_err_rw1s_alias_csrbus_omni_data);

    peu_csr_omni_i->peu_dlpl_serdes_rev_csrbus_read_data(peu_dlpl_serdes_rev_csrbus_read_data);
    peu_csr_omni_i->peu_dlpl_serdes_rev_csrbus_omni_data(peu_dlpl_serdes_rev_csrbus_omni_data);

    peu_csr_omni_i->acknak_thresh_csrbus_read_data(acknak_thresh_csrbus_read_data);
    peu_csr_omni_i->acknak_thresh_csrbus_omni_data(acknak_thresh_csrbus_omni_data);

    peu_csr_omni_i->acknak_timer_csrbus_read_data(acknak_timer_csrbus_read_data);
    peu_csr_omni_i->acknak_timer_csrbus_omni_data(acknak_timer_csrbus_omni_data);

    peu_csr_omni_i->replay_tim_thresh_csrbus_read_data(replay_tim_thresh_csrbus_read_data);
    peu_csr_omni_i->replay_tim_thresh_csrbus_omni_data(replay_tim_thresh_csrbus_omni_data);

    peu_csr_omni_i->replay_timer_csrbus_read_data(replay_timer_csrbus_read_data);
    peu_csr_omni_i->replay_timer_csrbus_omni_data(replay_timer_csrbus_omni_data);

    peu_csr_omni_i->ven_dllp_msg_csrbus_read_data(ven_dllp_msg_csrbus_read_data);
    peu_csr_omni_i->ven_dllp_msg_csrbus_omni_data(ven_dllp_msg_csrbus_omni_data);

    peu_csr_omni_i->force_ltssm_csrbus_read_data(force_ltssm_csrbus_read_data);
    peu_csr_omni_i->force_ltssm_csrbus_omni_data(force_ltssm_csrbus_omni_data);

    peu_csr_omni_i->link_cfg_csrbus_read_data(link_cfg_csrbus_read_data);
    peu_csr_omni_i->link_cfg_csrbus_omni_data(link_cfg_csrbus_omni_data);

    peu_csr_omni_i->link_ctl_csrbus_read_data(link_ctl_csrbus_read_data);
    peu_csr_omni_i->link_ctl_csrbus_omni_data(link_ctl_csrbus_omni_data);

    peu_csr_omni_i->lane_skew_csrbus_read_data(lane_skew_csrbus_read_data);
    peu_csr_omni_i->lane_skew_csrbus_omni_data(lane_skew_csrbus_omni_data);

    peu_csr_omni_i->symbol_num_csrbus_read_data(symbol_num_csrbus_read_data);
    peu_csr_omni_i->symbol_num_csrbus_omni_data(symbol_num_csrbus_omni_data);

    peu_csr_omni_i->symbol_timer_csrbus_read_data(symbol_timer_csrbus_read_data);
    peu_csr_omni_i->symbol_timer_csrbus_omni_data(symbol_timer_csrbus_omni_data);

    peu_csr_omni_i->core_status_csrbus_read_data(core_status_csrbus_read_data);
    peu_csr_omni_i->core_status_csrbus_omni_data(core_status_csrbus_omni_data);

    peu_csr_omni_i->event_err_log_en_csrbus_read_data(event_err_log_en_csrbus_read_data);
    peu_csr_omni_i->event_err_log_en_csrbus_omni_data(event_err_log_en_csrbus_omni_data);

    peu_csr_omni_i->event_err_int_en_csrbus_read_data(event_err_int_en_csrbus_read_data);
    peu_csr_omni_i->event_err_int_en_csrbus_omni_data(event_err_int_en_csrbus_omni_data);

    peu_csr_omni_i->event_err_int_sts_csrbus_read_data(event_err_int_sts_csrbus_read_data);
    peu_csr_omni_i->event_err_int_sts_csrbus_omni_data(event_err_int_sts_csrbus_omni_data);

    peu_csr_omni_i->event_err_sts_clr_rw1c_alias_csrbus_read_data(event_err_sts_clr_rw1c_alias_csrbus_read_data);
    peu_csr_omni_i->event_err_sts_clr_rw1c_alias_csrbus_omni_data(event_err_sts_clr_rw1c_alias_csrbus_omni_data);

    peu_csr_omni_i->event_err_sts_clr_rw1s_alias_csrbus_read_data(event_err_sts_clr_rw1s_alias_csrbus_read_data);
    peu_csr_omni_i->event_err_sts_clr_rw1s_alias_csrbus_omni_data(event_err_sts_clr_rw1s_alias_csrbus_omni_data);

    peu_csr_omni_i->lnk_bit_err_cnt_1_csrbus_read_data(lnk_bit_err_cnt_1_csrbus_read_data);
    peu_csr_omni_i->lnk_bit_err_cnt_1_csrbus_omni_data(lnk_bit_err_cnt_1_csrbus_omni_data);

    peu_csr_omni_i->lnk_bit_err_cnt_2_csrbus_read_data(lnk_bit_err_cnt_2_csrbus_read_data);
    peu_csr_omni_i->lnk_bit_err_cnt_2_csrbus_omni_data(lnk_bit_err_cnt_2_csrbus_omni_data);

    peu_csr_omni_i->serdes_pll_csrbus_read_data(serdes_pll_csrbus_read_data);
    peu_csr_omni_i->serdes_pll_csrbus_omni_data(serdes_pll_csrbus_omni_data);

    peu_csr_omni_i->serdes_receiver_lane_ctl_csrbus_read_data(serdes_receiver_lane_ctl_csrbus_read_data);
    peu_csr_omni_i->serdes_receiver_lane_ctl_csrbus_omni_data(serdes_receiver_lane_ctl_csrbus_omni_data);

    peu_csr_omni_i->serdes_receiver_lane_status_csrbus_read_data(serdes_receiver_lane_status_csrbus_read_data);
    peu_csr_omni_i->serdes_receiver_lane_status_csrbus_omni_data(serdes_receiver_lane_status_csrbus_omni_data);

    peu_csr_omni_i->serdes_xmitter_lane_ctl_csrbus_read_data(serdes_xmitter_lane_ctl_csrbus_read_data);
    peu_csr_omni_i->serdes_xmitter_lane_ctl_csrbus_omni_data(serdes_xmitter_lane_ctl_csrbus_omni_data);

    peu_csr_omni_i->serdes_xmitter_lane_status_csrbus_read_data(serdes_xmitter_lane_status_csrbus_read_data);
    peu_csr_omni_i->serdes_xmitter_lane_status_csrbus_omni_data(serdes_xmitter_lane_status_csrbus_omni_data);

    peu_csr_omni_i->serdes_macro_test_cfg_csrbus_read_data(serdes_macro_test_cfg_csrbus_read_data);
    peu_csr_omni_i->serdes_macro_test_cfg_csrbus_omni_data(serdes_macro_test_cfg_csrbus_omni_data);

    LOG_DEBUG << " > PEU_TOP ()::ctor()";
}

#endif
