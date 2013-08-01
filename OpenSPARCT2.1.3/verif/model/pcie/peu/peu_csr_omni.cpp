// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_csr_omni.cpp
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

#include "peu_csr_omni.h"
#include "pcie_common/logger.hpp"

#ifndef __EDG__

namespace pcie {

    void peu_csr_omni::init(void) {

        sc_uint<64>  data_reg;
        wait (10, SC_PS);

        data_reg = csr_port.read_csr(PEU_CSR_A_ACKNAK_THRESH_HW_ADDR);
        acknak_thresh_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR);
        ilu_err_rw1s_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_CTL_HW_ADDR);
        tlu_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_STS_HW_ADDR);
        tlu_sts_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TRN_OFF_HW_ADDR);
        trn_off_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);
        tlu_ici_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR);
        tlu_diag_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
        tlu_ecc_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECL_HW_ADDR);
        tlu_ecl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ERB_HW_ADDR);
        tlu_erb_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
        tlu_ica_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);
        tlu_icr_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);
        oe_log_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_OE_INT_EN_HW_ADDR);
        oe_int_en_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_OE_EN_ERR_HW_ADDR);
        oe_en_err_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
        oe_err_rw1c_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR);
        oe_err_rw1s_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_ROE_HDR1_HW_ADDR);
        roe_hdr1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_ROE_HDR2_HW_ADDR);
        roe_hdr2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TOE_HDR1_HW_ADDR);
        toe_hdr1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TOE_HDR2_HW_ADDR);
        toe_hdr2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRFC_HW_ADDR);
        tlu_prfc_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF0_HW_ADDR);
        tlu_prf0_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF1_HW_ADDR);
        tlu_prf1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF2_HW_ADDR);
        tlu_prf2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DBG_SEL_A_HW_ADDR);
        tlu_dbg_sel_a_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DBG_SEL_B_HW_ADDR);
        tlu_dbg_sel_b_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_DEV_CAP_HW_ADDR);
        dev_cap_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_DEV_CTL_HW_ADDR);
        dev_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_DEV_STS_HW_ADDR);
        dev_sts_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LNK_CAP_HW_ADDR);
        lnk_cap_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LNK_CTL_HW_ADDR);
        lnk_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LNK_STS_HW_ADDR);
        lnk_sts_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SLT_CAP_HW_ADDR);
        slt_cap_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
        ue_log_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_UE_INT_EN_HW_ADDR);
        ue_int_en_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_UE_EN_ERR_HW_ADDR);
        ue_en_err_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
        ue_err_rw1c_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR);
        ue_err_rw1s_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_RUE_HDR1_HW_ADDR);
        rue_hdr1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_RUE_HDR2_HW_ADDR);
        rue_hdr2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TUE_HDR1_HW_ADDR);
        tue_hdr1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_TUE_HDR2_HW_ADDR);
        tue_hdr2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CE_LOG_HW_ADDR);
        ce_log_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CE_INT_EN_HW_ADDR);
        ce_int_en_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CE_EN_ERR_HW_ADDR);
        ce_en_err_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
        ce_err_rw1c_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR);
        ce_err_rw1s_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_PEU_DLPL_SERDES_REV_HW_ADDR);
        peu_dlpl_serdes_rev_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_ACKNAK_TIMER_HW_ADDR);
        acknak_timer_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_REPLAY_TIM_THRESH_HW_ADDR);
        replay_tim_thresh_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_REPLAY_TIMER_HW_ADDR);
        replay_timer_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_VEN_DLLP_MSG_HW_ADDR);
        ven_dllp_msg_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_FORCE_LTSSM_HW_ADDR);
        force_ltssm_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LINK_CFG_HW_ADDR);
        link_cfg_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LINK_CTL_HW_ADDR);
        link_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LANE_SKEW_HW_ADDR);
        lane_skew_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SYMBOL_NUM_HW_ADDR);
        symbol_num_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SYMBOL_TIMER_HW_ADDR);
        symbol_timer_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);
        core_status_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_LOG_EN_HW_ADDR);
        event_err_log_en_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_INT_EN_HW_ADDR);
        event_err_int_en_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_INT_STS_HW_ADDR);
        event_err_int_sts_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR);
        event_err_sts_clr_rw1c_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR);
        event_err_sts_clr_rw1s_alias_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR);
        lnk_bit_err_cnt_1_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_2_HW_ADDR);
        lnk_bit_err_cnt_2_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_PLL_HW_ADDR);
        serdes_pll_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_CTL_HW_ADDR);
        serdes_receiver_lane_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_STATUS_HW_ADDR);
        serdes_receiver_lane_status_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_XMITTER_LANE_CTL_HW_ADDR);
        serdes_xmitter_lane_ctl_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_XMITTER_LANE_STATUS_HW_ADDR);
        serdes_xmitter_lane_status_csrbus_read_data.write(data_reg);

        data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_MACRO_TEST_CFG_HW_ADDR);
        serdes_macro_test_cfg_csrbus_read_data.write(data_reg);

        csr_port.set_notify_event(PEU_CSR_A_ACKNAK_THRESH_HW_ADDR, &acknak_thresh_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_CTL_HW_ADDR, &tlu_ctl_ev);
        csr_port.set_notify_event(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR, &ilu_err_rw1s_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_STS_HW_ADDR, &tlu_sts_ev);
        csr_port.set_notify_event(PEU_CSR_A_TRN_OFF_HW_ADDR, &trn_off_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ICI_HW_ADDR, &tlu_ici_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_DIAG_HW_ADDR, &tlu_diag_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ECC_HW_ADDR, &tlu_ecc_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ECL_HW_ADDR, &tlu_ecl_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ERB_HW_ADDR, &tlu_erb_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ICA_HW_ADDR, &tlu_ica_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ICR_HW_ADDR, &tlu_icr_ev);
        csr_port.set_notify_event(PEU_CSR_A_OE_LOG_HW_ADDR, &oe_log_ev);
        csr_port.set_notify_event(PEU_CSR_A_OE_INT_EN_HW_ADDR, &oe_int_en_ev);
        csr_port.set_notify_event(PEU_CSR_A_OE_EN_ERR_HW_ADDR, &oe_en_err_ev);
        csr_port.set_notify_event(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR, &oe_err_rw1c_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR, &oe_err_rw1s_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_ROE_HDR1_HW_ADDR, &roe_hdr1_ev);
        csr_port.set_notify_event(PEU_CSR_A_ROE_HDR2_HW_ADDR, &roe_hdr2_ev);
        csr_port.set_notify_event(PEU_CSR_A_TOE_HDR1_HW_ADDR, &toe_hdr1_ev);
        csr_port.set_notify_event(PEU_CSR_A_TOE_HDR2_HW_ADDR, &toe_hdr2_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_PRFC_HW_ADDR, &tlu_prfc_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_PRF0_HW_ADDR, &tlu_prf0_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_PRF1_HW_ADDR, &tlu_prf1_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_PRF2_HW_ADDR, &tlu_prf2_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_DBG_SEL_A_HW_ADDR, &tlu_dbg_sel_a_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_DBG_SEL_B_HW_ADDR, &tlu_dbg_sel_b_ev);
        csr_port.set_notify_event(PEU_CSR_A_DEV_CAP_HW_ADDR, &dev_cap_ev);
        csr_port.set_notify_event(PEU_CSR_A_DEV_CTL_HW_ADDR, &dev_ctl_ev);
        csr_port.set_notify_event(PEU_CSR_A_DEV_STS_HW_ADDR, &dev_sts_ev);
        csr_port.set_notify_event(PEU_CSR_A_LNK_CAP_HW_ADDR, &lnk_cap_ev);
        csr_port.set_notify_event(PEU_CSR_A_LNK_CTL_HW_ADDR, &lnk_ctl_ev);
        csr_port.set_notify_event(PEU_CSR_A_LNK_STS_HW_ADDR, &lnk_sts_ev);
        csr_port.set_notify_event(PEU_CSR_A_SLT_CAP_HW_ADDR, &slt_cap_ev);
        csr_port.set_notify_event(PEU_CSR_A_UE_LOG_HW_ADDR, &ue_log_ev);
        csr_port.set_notify_event(PEU_CSR_A_UE_INT_EN_HW_ADDR, &ue_int_en_ev);
        csr_port.set_notify_event(PEU_CSR_A_UE_EN_ERR_HW_ADDR, &ue_en_err_ev);
        csr_port.set_notify_event(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR, &ue_err_rw1c_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR, &ue_err_rw1s_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_RUE_HDR1_HW_ADDR, &rue_hdr1_ev);
        csr_port.set_notify_event(PEU_CSR_A_RUE_HDR2_HW_ADDR, &rue_hdr2_ev);
        csr_port.set_notify_event(PEU_CSR_A_TUE_HDR1_HW_ADDR, &tue_hdr1_ev);
        csr_port.set_notify_event(PEU_CSR_A_TUE_HDR2_HW_ADDR, &tue_hdr2_ev);
        csr_port.set_notify_event(PEU_CSR_A_CE_LOG_HW_ADDR, &ce_log_ev);
        csr_port.set_notify_event(PEU_CSR_A_CE_INT_EN_HW_ADDR, &ce_int_en_ev);
        csr_port.set_notify_event(PEU_CSR_A_CE_EN_ERR_HW_ADDR, &ce_en_err_ev);
        csr_port.set_notify_event(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR, &ce_err_rw1c_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR, &ce_err_rw1s_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_PEU_DLPL_SERDES_REV_HW_ADDR, &peu_dlpl_serdes_rev_ev);
        csr_port.set_notify_event(PEU_CSR_A_ACKNAK_THRESH_HW_ADDR, &acknak_thresh_ev);
        csr_port.set_notify_event(PEU_CSR_A_ACKNAK_TIMER_HW_ADDR, &acknak_timer_ev);
        csr_port.set_notify_event(PEU_CSR_A_REPLAY_TIM_THRESH_HW_ADDR, &replay_tim_thresh_ev);
        csr_port.set_notify_event(PEU_CSR_A_REPLAY_TIMER_HW_ADDR, &replay_timer_ev);
        csr_port.set_notify_event(PEU_CSR_A_VEN_DLLP_MSG_HW_ADDR, &ven_dllp_msg_ev);
        csr_port.set_notify_event(PEU_CSR_A_FORCE_LTSSM_HW_ADDR, &force_ltssm_ev);
        csr_port.set_notify_event(PEU_CSR_A_LINK_CFG_HW_ADDR, &link_cfg_ev);
        csr_port.set_notify_event(PEU_CSR_A_LINK_CTL_HW_ADDR, &link_ctl_ev);
        csr_port.set_notify_event(PEU_CSR_A_LANE_SKEW_HW_ADDR, &lane_skew_ev);
        csr_port.set_notify_event(PEU_CSR_A_SYMBOL_NUM_HW_ADDR, &symbol_num_ev);
        csr_port.set_notify_event(PEU_CSR_A_SYMBOL_TIMER_HW_ADDR, &symbol_timer_ev);
        csr_port.set_notify_event(PEU_CSR_A_CORE_STATUS_HW_ADDR, &core_status_ev);

        csr_port.set_notify_event(PEU_CSR_A_EVENT_ERR_LOG_EN_HW_ADDR, &event_err_log_en_ev);
        csr_port.set_notify_event(PEU_CSR_A_EVENT_ERR_INT_EN_HW_ADDR, &event_err_int_en_ev);
        csr_port.set_notify_event(PEU_CSR_A_EVENT_ERR_INT_STS_HW_ADDR, &event_err_int_sts_ev);
        csr_port.set_notify_event(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR, &event_err_sts_clr_rw1c_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR, &event_err_sts_clr_rw1s_alias_ev);
        csr_port.set_notify_event(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR, &lnk_bit_err_cnt_1_ev);
        csr_port.set_notify_event(PEU_CSR_A_LNK_BIT_ERR_CNT_2_HW_ADDR, &lnk_bit_err_cnt_2_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_PLL_HW_ADDR, &serdes_pll_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_RECEIVER_LANE_CTL_HW_ADDR, &serdes_receiver_lane_ctl_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_RECEIVER_LANE_STATUS_HW_ADDR, &serdes_receiver_lane_status_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_XMITTER_LANE_CTL_HW_ADDR, &serdes_xmitter_lane_ctl_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_XMITTER_LANE_STATUS_HW_ADDR, &serdes_xmitter_lane_status_ev);
        csr_port.set_notify_event(PEU_CSR_A_SERDES_MACRO_TEST_CFG_HW_ADDR, &serdes_macro_test_cfg_ev);

    }

    void peu_csr_omni::read_acknak_thresh(void) {

        sc_uint<64>  acknak_thresh_csrbus_read_data_reg;

        for ( ; ; ) {
            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR acknak_thresh ";
            acknak_thresh_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_ACKNAK_THRESH_HW_ADDR);
            csr_port_sem.post();
            acknak_thresh_csrbus_read_data.write(acknak_thresh_csrbus_read_data_reg);
            wait (acknak_thresh_ev);
        }

    }

    void peu_csr_omni::write_acknak_thresh(void) {

        while (true) {
            wait (acknak_thresh_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR acknak_thresh";
            acknak_thresh_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_ACKNAK_THRESH_HW_ADDR, acknak_thresh_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_ctl(void) {

        sc_uint<64>  tlu_ctl_csrbus_read_data_reg;

        for ( ; ; ) {
            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_ctl ";
            tlu_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_CTL_HW_ADDR);
            csr_port_sem.post();
            tlu_ctl_csrbus_read_data.write(tlu_ctl_csrbus_read_data_reg);
            wait (tlu_ctl_ev);
        }

    }

    void peu_csr_omni::write_tlu_ctl(void) {

        while (true) {
            wait (tlu_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_ctl";
            tlu_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_CTL_HW_ADDR, tlu_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ilu_err_rw1s_alias(void) {

        sc_uint<64>  ilu_err_rw1s_alias_csrbus_read_data_reg;

        for ( ; ; ) {
            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ilu_err_rw1s_alias ";
            ilu_err_rw1s_alias_csrbus_read_data_reg = csr_port.read_csr(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR);
            csr_port_sem.post();
            ilu_err_rw1s_alias_csrbus_read_data.write(ilu_err_rw1s_alias_csrbus_read_data_reg);
            wait (ilu_err_rw1s_alias_ev);
        }

    }

    void peu_csr_omni::write_ilu_err_rw1s_alias(void) {

        while (true) {
            wait (ilu_err_rw1s_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ilu_err_rw1s_alias";
            ilu_err_rw1s_alias_csrbus_read_data = csr_port.write_csr(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR, ilu_err_rw1s_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_sts(void) {

        sc_uint<64>  tlu_sts_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_sts ";
            tlu_sts_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_STS_HW_ADDR);
            csr_port_sem.post();
            tlu_sts_csrbus_read_data.write(tlu_sts_csrbus_read_data_reg);
            wait (tlu_sts_ev);
        }

    }

    void peu_csr_omni::write_tlu_sts(void) {

        while (true) {
            wait (tlu_sts_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_sts";
            tlu_sts_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_STS_HW_ADDR, tlu_sts_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_trn_off(void) {

        sc_uint<64>  trn_off_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR trn_off ";
            trn_off_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TRN_OFF_HW_ADDR);
            csr_port_sem.post();
            trn_off_csrbus_read_data.write(trn_off_csrbus_read_data_reg);
            wait (trn_off_ev);
        }

    }

    void peu_csr_omni::write_trn_off(void) {

        while (true) {
            wait (trn_off_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR trn_off";
            trn_off_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TRN_OFF_HW_ADDR, trn_off_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_ici(void) {

        sc_uint<64>  tlu_ici_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_ici ";
            tlu_ici_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);
            csr_port_sem.post();
            tlu_ici_csrbus_read_data.write(tlu_ici_csrbus_read_data_reg);
            wait (tlu_ici_ev);
        }

    }

    void peu_csr_omni::write_tlu_ici(void) {

        while (true) {
            wait (tlu_ici_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_ici "; 
            tlu_ici_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ICI_HW_ADDR,tlu_ici_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_diag(void) {

        sc_uint<64>  tlu_diag_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_diag ";
            tlu_diag_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR);
            csr_port_sem.post();
            tlu_diag_csrbus_read_data.write(tlu_diag_csrbus_read_data_reg);
            wait (tlu_diag_ev);
        }

    }

    void peu_csr_omni::write_tlu_diag(void) {

        while (true) {
            wait (tlu_diag_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_diag";
            tlu_diag_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR, tlu_diag_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_ecc(void) {

        sc_uint<64>  tlu_ecc_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_ecc ";
            tlu_ecc_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
            csr_port_sem.post();
            tlu_ecc_csrbus_read_data.write(tlu_ecc_csrbus_read_data_reg);
            wait (tlu_ecc_ev);
        }

    }

    void peu_csr_omni::write_tlu_ecc(void) {

        while (true) {
            wait (tlu_ecc_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_ecc";
            tlu_ecc_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR, tlu_ecc_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_ecl(void) {

        sc_uint<64>  tlu_ecl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_ecl ";
            tlu_ecl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECL_HW_ADDR);
            csr_port_sem.post();
            tlu_ecl_csrbus_read_data.write(tlu_ecl_csrbus_read_data_reg);
            wait (tlu_ecl_ev);
        }

    }

    void peu_csr_omni::write_tlu_ecl(void) {

        while (true) {
            wait (tlu_ecl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_ecl";
            tlu_ecl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR, tlu_ecl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_erb(void) {

        sc_uint<64>  tlu_erb_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_erb ";
            tlu_erb_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ERB_HW_ADDR);
            csr_port_sem.post();
            tlu_erb_csrbus_read_data.write(tlu_erb_csrbus_read_data_reg);
            wait (tlu_erb_ev);
        }

    }

    void peu_csr_omni::write_tlu_erb(void) {

        while (true) {
            wait (tlu_erb_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_erb";
            tlu_erb_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ERB_HW_ADDR, tlu_erb_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_ica(void) {

        sc_uint<64>  tlu_ica_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_ica ";
            tlu_ica_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
            csr_port_sem.post();
            tlu_ica_csrbus_read_data.write(tlu_ica_csrbus_read_data_reg);
            wait (tlu_ica_ev);
        }

    }

    void peu_csr_omni::write_tlu_ica(void) {

        while (true) {
            wait (tlu_ica_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_ica";
            tlu_ica_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ICA_HW_ADDR, tlu_ica_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_icr(void) {

        sc_uint<64>  tlu_icr_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_icr ";
            tlu_icr_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);
            csr_port_sem.post();
            tlu_icr_csrbus_read_data.write(tlu_icr_csrbus_read_data_reg);
            wait (tlu_icr_ev);
        }

    }

    void peu_csr_omni::write_tlu_icr(void) {

        while (true) {
            wait (tlu_icr_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_icr";
            tlu_icr_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_ICR_HW_ADDR, tlu_icr_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_oe_log(void) {

        sc_uint<64>  oe_log_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR oe_log ";
            oe_log_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);
            csr_port_sem.post();
            oe_log_csrbus_read_data.write(oe_log_csrbus_read_data_reg);
            wait (oe_log_ev);
        }

    }

    void peu_csr_omni::write_oe_log(void) {

        while (true) {
            wait (oe_log_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR oe_log";
            oe_log_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_OE_LOG_HW_ADDR, oe_log_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_oe_int_en(void) {

        sc_uint<64>  oe_int_en_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR oe_int_en ";
            oe_int_en_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_OE_INT_EN_HW_ADDR);
            csr_port_sem.post();
            oe_int_en_csrbus_read_data.write(oe_int_en_csrbus_read_data_reg);
            wait (oe_int_en_ev);
        }

    }

    void peu_csr_omni::write_oe_int_en(void) {

        while (true) {
            wait (oe_int_en_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR oe_int_en";
            oe_int_en_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_OE_INT_EN_HW_ADDR, oe_int_en_csrbus_omni_data.read().to_uint64());
        }
    }


    void peu_csr_omni::read_oe_en_err(void) {

        sc_uint<64>  oe_en_err_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR oe_en_err ";
            oe_en_err_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_OE_EN_ERR_HW_ADDR);
            csr_port_sem.post();
            oe_en_err_csrbus_read_data.write(oe_en_err_csrbus_read_data_reg);
            wait (oe_en_err_ev);
        }

    }

    void peu_csr_omni::write_oe_en_err(void) {

        while (true) {
            wait (oe_en_err_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR oe_en_err";
            oe_en_err_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_OE_EN_ERR_HW_ADDR, oe_en_err_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_oe_err_rw1c_alias(void) {

        sc_uint<64>  oe_err_rw1c_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR oe_err_rw1c_alias ";
            oe_err_rw1c_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
            csr_port_sem.post();
            oe_err_rw1c_alias_csrbus_read_data.write(oe_err_rw1c_alias_csrbus_read_data_reg);
            wait (oe_err_rw1c_alias_ev);
        }

    }

    void peu_csr_omni::write_oe_err_rw1c_alias(void) {

        while (true) {
            wait (oe_err_rw1c_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR oe_err_rw1c_alias";
            oe_err_rw1c_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR, oe_err_rw1c_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_oe_err_rw1s_alias(void) {

        sc_uint<64>  oe_err_rw1s_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR oe_err_rw1s_alias ";
            oe_err_rw1s_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR);
            csr_port_sem.post();
            oe_err_rw1s_alias_csrbus_read_data.write(oe_err_rw1s_alias_csrbus_read_data_reg);
            wait (oe_err_rw1s_alias_ev);
        }

    }

    void peu_csr_omni::write_oe_err_rw1s_alias(void) {

        while (true) {
            wait (oe_err_rw1s_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR oe_err_rw1s_alias";
            oe_err_rw1s_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR, oe_err_rw1s_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_roe_hdr1(void) {

        sc_uint<64>  roe_hdr1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR roe_hdr1 ";
            roe_hdr1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_ROE_HDR1_HW_ADDR);
            csr_port_sem.post();
            roe_hdr1_csrbus_read_data.write(roe_hdr1_csrbus_read_data_reg);
            wait (roe_hdr1_ev);
        }

    }

    void peu_csr_omni::write_roe_hdr1(void) {

        while (true) {
            wait (roe_hdr1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR roe_hdr1";
            roe_hdr1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_ROE_HDR1_HW_ADDR, roe_hdr1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_roe_hdr2(void) {

        sc_uint<64>  roe_hdr2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR roe_hdr2 ";
            roe_hdr2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_ROE_HDR2_HW_ADDR);
            csr_port_sem.post();
            roe_hdr2_csrbus_read_data.write(roe_hdr2_csrbus_read_data_reg);
            wait (roe_hdr2_ev);
        }

    }

    void peu_csr_omni::write_roe_hdr2(void) {

        while (true) {
            wait (roe_hdr2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR roe_hdr2";
            roe_hdr2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_ROE_HDR2_HW_ADDR, roe_hdr2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_toe_hdr1(void) {

        sc_uint<64>  toe_hdr1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR toe_hdr1 ";
            toe_hdr1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TOE_HDR1_HW_ADDR);
            csr_port_sem.post();
            toe_hdr1_csrbus_read_data.write(toe_hdr1_csrbus_read_data_reg);
            wait (toe_hdr1_ev);
        }

    }

    void peu_csr_omni::write_toe_hdr1(void) {

        while (true) {
            wait (toe_hdr1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR toe_hdr1";
            toe_hdr1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TOE_HDR1_HW_ADDR, toe_hdr1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_toe_hdr2(void) {

        sc_uint<64>  toe_hdr2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR toe_hdr2 ";
            toe_hdr2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TOE_HDR2_HW_ADDR);
            csr_port_sem.post();
            toe_hdr2_csrbus_read_data.write(toe_hdr2_csrbus_read_data_reg);
            wait (toe_hdr2_ev);
        }

    }

    void peu_csr_omni::write_toe_hdr2(void) {

        while (true) {
            wait (toe_hdr2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR toe_hdr2";
            toe_hdr2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TOE_HDR2_HW_ADDR, toe_hdr2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_prfc(void) {

        sc_uint<64>  tlu_prfc_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_prfc ";
            tlu_prfc_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRFC_HW_ADDR);
            csr_port_sem.post();
            tlu_prfc_csrbus_read_data.write(tlu_prfc_csrbus_read_data_reg);
            wait (tlu_prfc_ev);
        }

    }

    void peu_csr_omni::write_tlu_prfc(void) {

        while (true) {
            wait (tlu_prfc_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_prfc";
            tlu_prfc_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_PRFC_HW_ADDR, tlu_prfc_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_prf0(void) {

        sc_uint<64>  tlu_prf0_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_prf0 ";
            tlu_prf0_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF0_HW_ADDR);
            csr_port_sem.post();
            tlu_prf0_csrbus_read_data.write(tlu_prf0_csrbus_read_data_reg);
            wait (tlu_prf0_ev);
        }

    }

    void peu_csr_omni::write_tlu_prf0(void) {

        while (true) {
            wait (tlu_prf0_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_prf0";
            tlu_prf0_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_PRF0_HW_ADDR, tlu_prf0_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_prf1(void) {

        sc_uint<64>  tlu_prf1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_prf1 ";
            tlu_prf1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF1_HW_ADDR);
            csr_port_sem.post();
            tlu_prf1_csrbus_read_data.write(tlu_prf1_csrbus_read_data_reg);
            wait (tlu_prf1_ev);
        }

    }

    void peu_csr_omni::write_tlu_prf1(void) {

        while (true) {
            wait (tlu_prf1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_prf1";
            tlu_prf1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_PRF1_HW_ADDR, tlu_prf1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_prf2(void) {

        sc_uint<64>  tlu_prf2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_prf2 ";
            tlu_prf2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_PRF2_HW_ADDR);
            csr_port_sem.post();
            tlu_prf2_csrbus_read_data.write(tlu_prf2_csrbus_read_data_reg);
            wait (tlu_prf2_ev);
        }

    }

    void peu_csr_omni::write_tlu_prf2(void) {

        while (true) {
            wait (tlu_prf2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_prf2";
            tlu_prf2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_PRF2_HW_ADDR, tlu_prf2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_dbg_sel_a(void) {

        sc_uint<64>  tlu_dbg_sel_a_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_dbg_sel_a ";
            tlu_dbg_sel_a_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DBG_SEL_A_HW_ADDR);
            csr_port_sem.post();
            tlu_dbg_sel_a_csrbus_read_data.write(tlu_dbg_sel_a_csrbus_read_data_reg);
            wait (tlu_dbg_sel_a_ev);
        }

    }

    void peu_csr_omni::write_tlu_dbg_sel_a(void) {

        while (true) {
            wait (tlu_dbg_sel_a_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_dbg_sel_a";
            tlu_dbg_sel_a_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_DBG_SEL_A_HW_ADDR, tlu_dbg_sel_a_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tlu_dbg_sel_b(void) {

        sc_uint<64>  tlu_dbg_sel_b_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tlu_dbg_sel_b ";
            tlu_dbg_sel_b_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TLU_DBG_SEL_B_HW_ADDR);
            csr_port_sem.post();
            tlu_dbg_sel_b_csrbus_read_data.write(tlu_dbg_sel_b_csrbus_read_data_reg);
            wait (tlu_dbg_sel_b_ev);
        }

    }

    void peu_csr_omni::write_tlu_dbg_sel_b(void) {

        while (true) {
            wait (tlu_dbg_sel_b_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tlu_dbg_sel_b";
            tlu_dbg_sel_b_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TLU_DBG_SEL_B_HW_ADDR, tlu_dbg_sel_b_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_dev_cap(void) {

        sc_uint<64>  dev_cap_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR dev_cap ";
            dev_cap_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_DEV_CAP_HW_ADDR);
            csr_port_sem.post();
            dev_cap_csrbus_read_data.write(dev_cap_csrbus_read_data_reg);
            wait (dev_cap_ev);
        }

    }

    void peu_csr_omni::write_dev_cap(void) {

        while (true) {
            wait (dev_cap_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR dev_cap";
            dev_cap_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_DEV_CAP_HW_ADDR, dev_cap_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_dev_ctl(void) {

        sc_uint<64>  dev_ctl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR dev_ctl ";
            dev_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_DEV_CTL_HW_ADDR);
            csr_port_sem.post();
            dev_ctl_csrbus_read_data.write(dev_ctl_csrbus_read_data_reg);
            wait (dev_ctl_ev);
        }

    }

    void peu_csr_omni::write_dev_ctl(void) {

        while (true) {
            wait (dev_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR dev_ctl";
            dev_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_DEV_CTL_HW_ADDR, dev_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_dev_sts(void) {

        sc_uint<64>  dev_sts_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR dev_sts ";
            dev_sts_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_DEV_STS_HW_ADDR);
            csr_port_sem.post();
            dev_sts_csrbus_read_data.write(dev_sts_csrbus_read_data_reg);
            wait (dev_sts_ev);
        }

    }

    void peu_csr_omni::write_dev_sts(void) {

        while (true) {
            wait (dev_sts_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR dev_sts";
            dev_sts_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_DEV_STS_HW_ADDR, dev_sts_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lnk_cap(void) {

        sc_uint<64>  lnk_cap_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lnk_cap ";
            lnk_cap_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LNK_CAP_HW_ADDR);
            csr_port_sem.post();
            lnk_cap_csrbus_read_data.write(lnk_cap_csrbus_read_data_reg);
            wait (lnk_cap_ev);
        }

    }

    void peu_csr_omni::write_lnk_cap(void) {

        while (true) {
            wait (lnk_cap_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lnk_cap";
            lnk_cap_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LNK_CAP_HW_ADDR, lnk_cap_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lnk_ctl(void) {

        sc_uint<64>  lnk_ctl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lnk_ctl ";
            lnk_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LNK_CTL_HW_ADDR);
            csr_port_sem.post();
            lnk_ctl_csrbus_read_data.write(lnk_ctl_csrbus_read_data_reg);
            wait (lnk_ctl_ev);
        }

    }

    void peu_csr_omni::write_lnk_ctl(void) {

        while (true) {
            wait (lnk_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lnk_ctl";
            lnk_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LNK_CTL_HW_ADDR, lnk_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lnk_sts(void) {

        sc_uint<64>  lnk_sts_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lnk_sts ";
            lnk_sts_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LNK_STS_HW_ADDR);
            csr_port_sem.post();
            lnk_sts_csrbus_read_data.write(lnk_sts_csrbus_read_data_reg);
            wait (lnk_sts_ev);
        }

    }

    void peu_csr_omni::write_lnk_sts(void) {

        while (true) {
            wait (lnk_sts_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lnk_sts";
            lnk_sts_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LNK_STS_HW_ADDR, lnk_sts_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_slt_cap(void) {

        sc_uint<64>  slt_cap_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR slt_cap ";
            slt_cap_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SLT_CAP_HW_ADDR);
            csr_port_sem.post();
            slt_cap_csrbus_read_data.write(slt_cap_csrbus_read_data_reg);
            wait (slt_cap_ev);
        }

    }

    void peu_csr_omni::write_slt_cap(void) {

        while (true) {
            wait (slt_cap_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR slt_cap";
            slt_cap_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SLT_CAP_HW_ADDR, slt_cap_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ue_log(void) {

        sc_uint<64>  ue_log_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ue_log ";
            ue_log_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
            csr_port_sem.post();
            ue_log_csrbus_read_data.write(ue_log_csrbus_read_data_reg);
            wait (ue_log_ev);
        }

    }

    void peu_csr_omni::write_ue_log(void) {

        while (true) {
            wait (ue_log_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ue_log";
            ue_log_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_UE_LOG_HW_ADDR, ue_log_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ue_int_en(void) {

        sc_uint<64>  ue_int_en_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ue_int_en ";
            ue_int_en_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_UE_INT_EN_HW_ADDR);
            csr_port_sem.post();
            ue_int_en_csrbus_read_data.write(ue_int_en_csrbus_read_data_reg);
            wait (ue_int_en_ev);
        }

    }

    void peu_csr_omni::write_ue_int_en(void) {

        while (true) {
            wait (ue_int_en_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ue_int_en";
            ue_int_en_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_UE_INT_EN_HW_ADDR, ue_int_en_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ue_en_err(void) {

        sc_uint<64>  ue_en_err_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ue_en_err ";
            ue_en_err_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_UE_EN_ERR_HW_ADDR);
            csr_port_sem.post();
            ue_en_err_csrbus_read_data.write(ue_en_err_csrbus_read_data_reg);
            wait (ue_en_err_ev);
        }

    }

    void peu_csr_omni::write_ue_en_err(void) {

        while (true) {
            wait (ue_en_err_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ue_en_err";
            ue_en_err_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_UE_EN_ERR_HW_ADDR, ue_en_err_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ue_err_rw1c_alias(void) {

        sc_uint<64>  ue_err_rw1c_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ue_err_rw1c_alias ";
            ue_err_rw1c_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
            csr_port_sem.post();
            ue_err_rw1c_alias_csrbus_read_data.write(ue_err_rw1c_alias_csrbus_read_data_reg);
            wait (ue_err_rw1c_alias_ev);
        }

    }

    void peu_csr_omni::write_ue_err_rw1c_alias(void) {

        while (true) {
            wait (ue_err_rw1c_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ue_err_rw1c_alias";
            ue_err_rw1c_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR, ue_err_rw1c_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ue_err_rw1s_alias(void) {

        sc_uint<64>  ue_err_rw1s_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ue_err_rw1s_alias ";
            ue_err_rw1s_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR);
            csr_port_sem.post();
            ue_err_rw1s_alias_csrbus_read_data.write(ue_err_rw1s_alias_csrbus_read_data_reg);
            wait (ue_err_rw1s_alias_ev);
        }

    }

    void peu_csr_omni::write_ue_err_rw1s_alias(void) {

        while (true) {
            wait (ue_err_rw1s_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ue_err_rw1s_alias";
            ue_err_rw1s_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR, ue_err_rw1s_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_rue_hdr1(void) {

        sc_uint<64>  rue_hdr1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR rue_hdr1 ";
            rue_hdr1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_RUE_HDR1_HW_ADDR);
            csr_port_sem.post();
            rue_hdr1_csrbus_read_data.write(rue_hdr1_csrbus_read_data_reg);
            wait (rue_hdr1_ev);
        }

    }

    void peu_csr_omni::write_rue_hdr1(void) {

        while (true) {
            wait (rue_hdr1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR rue_hdr1";
            rue_hdr1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_RUE_HDR1_HW_ADDR, rue_hdr1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_rue_hdr2(void) {

        sc_uint<64>  rue_hdr2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR rue_hdr2 ";
            rue_hdr2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_RUE_HDR2_HW_ADDR);
            csr_port_sem.post();
            rue_hdr2_csrbus_read_data.write(rue_hdr2_csrbus_read_data_reg);
            wait (rue_hdr2_ev);
        }

    }

    void peu_csr_omni::write_rue_hdr2(void) {

        while (true) {
            wait (rue_hdr2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR rue_hdr2";
            rue_hdr2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_RUE_HDR2_HW_ADDR, rue_hdr2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tue_hdr1(void) {

        sc_uint<64>  tue_hdr1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tue_hdr1 ";
            tue_hdr1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TUE_HDR1_HW_ADDR);
            csr_port_sem.post();
            tue_hdr1_csrbus_read_data.write(tue_hdr1_csrbus_read_data_reg);
            wait (tue_hdr1_ev);
        }

    }

    void peu_csr_omni::write_tue_hdr1(void) {

        while (true) {
            wait (tue_hdr1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tue_hdr1";
            tue_hdr1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TUE_HDR1_HW_ADDR, tue_hdr1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_tue_hdr2(void) {

        sc_uint<64>  tue_hdr2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR tue_hdr2 ";
            tue_hdr2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_TUE_HDR2_HW_ADDR);
            csr_port_sem.post();
            tue_hdr2_csrbus_read_data.write(tue_hdr2_csrbus_read_data_reg);
            wait (tue_hdr2_ev);
        }

    }

    void peu_csr_omni::write_tue_hdr2(void) {

        while (true) {
            wait (tue_hdr2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR tue_hdr2";
            tue_hdr2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_TUE_HDR2_HW_ADDR, tue_hdr2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ce_log(void) {

        sc_uint<64>  ce_log_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ce_log ";
            ce_log_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CE_LOG_HW_ADDR);
            csr_port_sem.post();
            ce_log_csrbus_read_data.write(ce_log_csrbus_read_data_reg);
            wait (ce_log_ev);
        }

    }

    void peu_csr_omni::write_ce_log(void) {

        while (true) {
            wait (ce_log_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ce_log";
            ce_log_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CE_LOG_HW_ADDR, ce_log_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ce_int_en(void) {

        sc_uint<64>  ce_int_en_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ce_int_en ";
            ce_int_en_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CE_INT_EN_HW_ADDR);
            csr_port_sem.post();
            ce_int_en_csrbus_read_data.write(ce_int_en_csrbus_read_data_reg);
            wait (ce_int_en_ev);
        }

    }

    void peu_csr_omni::write_ce_int_en(void) {

        while (true) {
            wait (ce_int_en_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ce_int_en";
            ce_int_en_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CE_INT_EN_HW_ADDR, ce_int_en_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ce_en_err(void) {

        sc_uint<64>  ce_en_err_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ce_en_err ";
            ce_en_err_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CE_EN_ERR_HW_ADDR);
            csr_port_sem.post();
            ce_en_err_csrbus_read_data.write(ce_en_err_csrbus_read_data_reg);
            wait (ce_en_err_ev);
        }

    }

    void peu_csr_omni::write_ce_en_err(void) {

        while (true) {
            wait (ce_en_err_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ce_en_err";
            ce_en_err_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CE_EN_ERR_HW_ADDR, ce_en_err_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ce_err_rw1c_alias(void) {

        sc_uint<64>  ce_err_rw1c_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ce_err_rw1c_alias ";
            ce_err_rw1c_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
            csr_port_sem.post();
            ce_err_rw1c_alias_csrbus_read_data.write(ce_err_rw1c_alias_csrbus_read_data_reg);
            wait (ce_err_rw1c_alias_ev);
        }

    }

    void peu_csr_omni::write_ce_err_rw1c_alias(void) {

        while (true) {
            wait (ce_err_rw1c_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ce_err_rw1c_alias";
            ce_err_rw1c_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR, ce_err_rw1c_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ce_err_rw1s_alias(void) {

        sc_uint<64>  ce_err_rw1s_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ce_err_rw1s_alias ";
            ce_err_rw1s_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR);
            csr_port_sem.post();
            ce_err_rw1s_alias_csrbus_read_data.write(ce_err_rw1s_alias_csrbus_read_data_reg);
            wait (ce_err_rw1s_alias_ev);
        }

    }

    void peu_csr_omni::write_ce_err_rw1s_alias(void) {

        while (true) {
            wait (ce_err_rw1s_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ce_err_rw1s_alias";
            ce_err_rw1s_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR, ce_err_rw1s_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_peu_dlpl_serdes_rev(void) {

        sc_uint<64>  peu_dlpl_serdes_rev_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR peu_dlpl_serdes_rev ";
            peu_dlpl_serdes_rev_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_PEU_DLPL_SERDES_REV_HW_ADDR);
            csr_port_sem.post();
            peu_dlpl_serdes_rev_csrbus_read_data.write(peu_dlpl_serdes_rev_csrbus_read_data_reg);
            wait (peu_dlpl_serdes_rev_ev);
        }

    }

    void peu_csr_omni::write_peu_dlpl_serdes_rev(void) {

        while (true) {
            wait (peu_dlpl_serdes_rev_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR peu_dlpl_serdes_rev";
            peu_dlpl_serdes_rev_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_PEU_DLPL_SERDES_REV_HW_ADDR, peu_dlpl_serdes_rev_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_acknak_timer(void) {

        sc_uint<64>  acknak_timer_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR acknak_timer ";
            acknak_timer_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_ACKNAK_TIMER_HW_ADDR);
            csr_port_sem.post();
            acknak_timer_csrbus_read_data.write(acknak_timer_csrbus_read_data_reg);
            wait (acknak_timer_ev);
        }

    }

    void peu_csr_omni::write_acknak_timer(void) {

        while (true) {
            wait (acknak_timer_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR acknak_timer";
            acknak_timer_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_ACKNAK_TIMER_HW_ADDR, acknak_timer_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_replay_tim_thresh(void) {

        sc_uint<64>  replay_tim_thresh_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR replay_tim_thresh ";
            replay_tim_thresh_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_REPLAY_TIM_THRESH_HW_ADDR);
            csr_port_sem.post();
            replay_tim_thresh_csrbus_read_data.write(replay_tim_thresh_csrbus_read_data_reg);
            wait (replay_tim_thresh_ev);
        }

    }

    void peu_csr_omni::write_replay_tim_thresh(void) {

        while (true) {
            wait (replay_tim_thresh_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR replay_tim_thresh";
            replay_tim_thresh_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_REPLAY_TIM_THRESH_HW_ADDR, replay_tim_thresh_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_replay_timer(void) {

        sc_uint<64>  replay_timer_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR replay_timer ";
            replay_timer_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_REPLAY_TIMER_HW_ADDR);
            csr_port_sem.post();
            replay_timer_csrbus_read_data.write(replay_timer_csrbus_read_data_reg);
            wait (replay_timer_ev);
        }

    }

    void peu_csr_omni::write_replay_timer(void) {

        while (true) {
            wait (replay_timer_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR replay_timer";
            replay_timer_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_REPLAY_TIMER_HW_ADDR, replay_timer_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_ven_dllp_msg(void) {

        sc_uint<64>  ven_dllp_msg_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR ven_dllp_msg ";
            ven_dllp_msg_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_VEN_DLLP_MSG_HW_ADDR);
            csr_port_sem.post();
            ven_dllp_msg_csrbus_read_data.write(ven_dllp_msg_csrbus_read_data_reg);
            wait (ven_dllp_msg_ev);
        }

    }

    void peu_csr_omni::write_ven_dllp_msg(void) {

        while (true) {
            wait (ven_dllp_msg_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR ven_dllp_msg";
            ven_dllp_msg_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_VEN_DLLP_MSG_HW_ADDR, ven_dllp_msg_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_force_ltssm(void) {

        sc_uint<64>  force_ltssm_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR force_ltssm ";
            force_ltssm_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_FORCE_LTSSM_HW_ADDR);
            csr_port_sem.post();
            force_ltssm_csrbus_read_data.write(force_ltssm_csrbus_read_data_reg);
            wait (force_ltssm_ev);
        }

    }

    void peu_csr_omni::write_force_ltssm(void) {

        while (true) {
            wait (force_ltssm_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR force_ltssm";
            force_ltssm_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_FORCE_LTSSM_HW_ADDR, force_ltssm_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_link_cfg(void) {

        sc_uint<64>  link_cfg_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR link_cfg ";
            link_cfg_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LINK_CFG_HW_ADDR);
            csr_port_sem.post();
            link_cfg_csrbus_read_data.write(link_cfg_csrbus_read_data_reg);
            wait (link_cfg_ev);
        }

    }

    void peu_csr_omni::write_link_cfg(void) {

        while (true) {
            wait (link_cfg_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR link_cfg";
            link_cfg_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LINK_CFG_HW_ADDR, link_cfg_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_link_ctl(void) {

        sc_uint<64>  link_ctl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR link_ctl ";
            link_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LINK_CTL_HW_ADDR);
            csr_port_sem.post();
            link_ctl_csrbus_read_data.write(link_ctl_csrbus_read_data_reg);
            wait (link_ctl_ev);
        }

    }

    void peu_csr_omni::write_link_ctl(void) {

        while (true) {
            wait (link_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR link_ctl";
            link_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LINK_CTL_HW_ADDR, link_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lane_skew(void) {

        sc_uint<64>  lane_skew_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lane_skew ";
            lane_skew_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LANE_SKEW_HW_ADDR);
            csr_port_sem.post();
            lane_skew_csrbus_read_data.write(lane_skew_csrbus_read_data_reg);
            wait (lane_skew_ev);
        }

    }

    void peu_csr_omni::write_lane_skew(void) {

        while (true) {
            wait (lane_skew_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lane_skew";
            lane_skew_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LANE_SKEW_HW_ADDR, lane_skew_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_symbol_num(void) {

        sc_uint<64>  symbol_num_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR symbol_num ";
            symbol_num_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SYMBOL_NUM_HW_ADDR);
            csr_port_sem.post();
            symbol_num_csrbus_read_data.write(symbol_num_csrbus_read_data_reg);
            wait (symbol_num_ev);
        }

    }

    void peu_csr_omni::write_symbol_num(void) {

        while (true) {
            wait (symbol_num_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR symbol_num";
            symbol_num_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SYMBOL_NUM_HW_ADDR, symbol_num_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_symbol_timer(void) {

        sc_uint<64>  symbol_timer_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR symbol_timer ";
            symbol_timer_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SYMBOL_TIMER_HW_ADDR);
            csr_port_sem.post();
            symbol_timer_csrbus_read_data.write(symbol_timer_csrbus_read_data_reg);
            wait (symbol_timer_ev);
        }

    }

    void peu_csr_omni::write_symbol_timer(void) {

        while (true) {
            wait (symbol_timer_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR symbol_timer";
            symbol_timer_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SYMBOL_TIMER_HW_ADDR, symbol_timer_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_core_status(void) {

        sc_uint<64>  core_status_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR core_status ";
            core_status_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);
            csr_port_sem.post();
            core_status_csrbus_read_data.write(core_status_csrbus_read_data_reg);
            wait (core_status_ev);
        }

    }

    void peu_csr_omni::write_core_status(void) {

        while (true) {
            wait (core_status_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR core_status";
            core_status_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR, core_status_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_event_err_log_en(void) {

        sc_uint<64>  event_err_log_en_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR event_err_log_en ";
            event_err_log_en_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_LOG_EN_HW_ADDR);
            csr_port_sem.post();
            event_err_log_en_csrbus_read_data.write(event_err_log_en_csrbus_read_data_reg);
            wait (event_err_log_en_ev);
        }

    }

    void peu_csr_omni::write_event_err_log_en(void) {

        while (true) {
            wait (event_err_log_en_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR event_err_log_en";
            event_err_log_en_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_EVENT_ERR_LOG_EN_HW_ADDR, event_err_log_en_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_event_err_int_en(void) {

        sc_uint<64>  event_err_int_en_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR event_err_int_en ";
            event_err_int_en_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_INT_EN_HW_ADDR);
            csr_port_sem.post();
            event_err_int_en_csrbus_read_data.write(event_err_int_en_csrbus_read_data_reg);
            wait (event_err_int_en_ev);
        }

    }

    void peu_csr_omni::write_event_err_int_en(void) {

        while (true) {
            wait (event_err_int_en_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR event_err_int_en";
            event_err_int_en_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_EVENT_ERR_INT_EN_HW_ADDR, event_err_int_en_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_event_err_int_sts(void) {

        sc_uint<64>  event_err_int_sts_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR event_err_int_sts ";
            event_err_int_sts_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_INT_STS_HW_ADDR);
            csr_port_sem.post();
            event_err_int_sts_csrbus_read_data.write(event_err_int_sts_csrbus_read_data_reg);
            wait (event_err_int_sts_ev);
        }

    }

    void peu_csr_omni::write_event_err_int_sts(void) {

        while (true) {
            wait (event_err_int_sts_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR event_err_int_sts";
            event_err_int_sts_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_EVENT_ERR_INT_STS_HW_ADDR, event_err_int_sts_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_event_err_sts_clr_rw1c_alias(void) {

        sc_uint<64>  event_err_sts_clr_rw1c_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR event_err_sts_clr_rw1c_alias ";
            event_err_sts_clr_rw1c_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR);
            csr_port_sem.post();
            event_err_sts_clr_rw1c_alias_csrbus_read_data.write(event_err_sts_clr_rw1c_alias_csrbus_read_data_reg);
            wait (event_err_sts_clr_rw1c_alias_ev);
        }

    }

    void peu_csr_omni::write_event_err_sts_clr_rw1c_alias(void) {

        while (true) {
            wait (event_err_sts_clr_rw1c_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR event_err_sts_clr_rw1c_alias";
            event_err_sts_clr_rw1c_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR, event_err_sts_clr_rw1c_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_event_err_sts_clr_rw1s_alias(void) {

        sc_uint<64>  event_err_sts_clr_rw1s_alias_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR event_err_sts_clr_rw1s_alias ";
            event_err_sts_clr_rw1s_alias_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR);
            csr_port_sem.post();
            event_err_sts_clr_rw1s_alias_csrbus_read_data.write(event_err_sts_clr_rw1s_alias_csrbus_read_data_reg);
            wait (event_err_sts_clr_rw1s_alias_ev);
        }

    }

    void peu_csr_omni::write_event_err_sts_clr_rw1s_alias(void) {

        while (true) {
            wait (event_err_sts_clr_rw1s_alias_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR event_err_sts_clr_rw1s_alias";
            event_err_sts_clr_rw1s_alias_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR, event_err_sts_clr_rw1s_alias_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lnk_bit_err_cnt_1(void) {

        sc_uint<64>  lnk_bit_err_cnt_1_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lnk_bit_err_cnt_1 ";
            lnk_bit_err_cnt_1_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR);
            csr_port_sem.post();
            lnk_bit_err_cnt_1_csrbus_read_data.write(lnk_bit_err_cnt_1_csrbus_read_data_reg);
            wait (lnk_bit_err_cnt_1_ev);
        }

    }

    void peu_csr_omni::write_lnk_bit_err_cnt_1(void) {

        while (true) {
            wait (lnk_bit_err_cnt_1_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lnk_bit_err_cnt_1";
            lnk_bit_err_cnt_1_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR, lnk_bit_err_cnt_1_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_lnk_bit_err_cnt_2(void) {

        sc_uint<64>  lnk_bit_err_cnt_2_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR lnk_bit_err_cnt_2 ";
            lnk_bit_err_cnt_2_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_2_HW_ADDR);
            csr_port_sem.post();
            lnk_bit_err_cnt_2_csrbus_read_data.write(lnk_bit_err_cnt_2_csrbus_read_data_reg);
            wait (lnk_bit_err_cnt_2_ev);
        }

    }

    void peu_csr_omni::write_lnk_bit_err_cnt_2(void) {

        while (true) {
            wait (lnk_bit_err_cnt_2_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR lnk_bit_err_cnt_2";
            lnk_bit_err_cnt_2_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_2_HW_ADDR, lnk_bit_err_cnt_2_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_pll(void) {

        sc_uint<64>  serdes_pll_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_pll ";
            serdes_pll_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_PLL_HW_ADDR);
            csr_port_sem.post();
            serdes_pll_csrbus_read_data.write(serdes_pll_csrbus_read_data_reg);
            wait (serdes_pll_ev);
        }

    }

    void peu_csr_omni::write_serdes_pll(void) {

        while (true) {
            wait (serdes_pll_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_pll";
            serdes_pll_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_PLL_HW_ADDR, serdes_pll_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_receiver_lane_ctl(void) {

        sc_uint<64>  serdes_receiver_lane_ctl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_receiver_lane_ctl ";
            serdes_receiver_lane_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_CTL_HW_ADDR);
            csr_port_sem.post();
            serdes_receiver_lane_ctl_csrbus_read_data.write(serdes_receiver_lane_ctl_csrbus_read_data_reg);
            wait (serdes_receiver_lane_ctl_ev);
        }

    }

    void peu_csr_omni::write_serdes_receiver_lane_ctl(void) {

        while (true) {
            wait (serdes_receiver_lane_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_receiver_lane_ctl";
            serdes_receiver_lane_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_CTL_HW_ADDR, serdes_receiver_lane_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_receiver_lane_status(void) {

        sc_uint<64>  serdes_receiver_lane_status_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_receiver_lane_status ";
            serdes_receiver_lane_status_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_STATUS_HW_ADDR);
            csr_port_sem.post();
            serdes_receiver_lane_status_csrbus_read_data.write(serdes_receiver_lane_status_csrbus_read_data_reg);
            wait (serdes_receiver_lane_status_ev);
        }

    }

    void peu_csr_omni::write_serdes_receiver_lane_status(void) {

        while (true) {
            wait (serdes_receiver_lane_status_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_receiver_lane_status";
            serdes_receiver_lane_status_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_RECEIVER_LANE_STATUS_HW_ADDR, serdes_receiver_lane_status_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_xmitter_lane_ctl(void) {

        sc_uint<64>  serdes_xmitter_lane_ctl_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_xmitter_lane_ctl ";
            serdes_xmitter_lane_ctl_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_XMITTER_LANE_CTL_HW_ADDR);
            csr_port_sem.post();
            serdes_xmitter_lane_ctl_csrbus_read_data.write(serdes_xmitter_lane_ctl_csrbus_read_data_reg);
            wait (serdes_xmitter_lane_ctl_ev);
        }

    }

    void peu_csr_omni::write_serdes_xmitter_lane_ctl(void) {

        while (true) {
            wait (serdes_xmitter_lane_ctl_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_xmitter_lane_ctl";
            serdes_xmitter_lane_ctl_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_XMITTER_LANE_CTL_HW_ADDR, serdes_xmitter_lane_ctl_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_xmitter_lane_status(void) {

        sc_uint<64>  serdes_xmitter_lane_status_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_xmitter_lane_status ";
            serdes_xmitter_lane_status_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_XMITTER_LANE_STATUS_HW_ADDR);
            csr_port_sem.post();
            serdes_xmitter_lane_status_csrbus_read_data.write(serdes_xmitter_lane_status_csrbus_read_data_reg);
            wait (serdes_xmitter_lane_status_ev);
        }

    }

    void peu_csr_omni::write_serdes_xmitter_lane_status(void) {

        while (true) {
            wait (serdes_xmitter_lane_status_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_xmitter_lane_status";
            serdes_xmitter_lane_status_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_XMITTER_LANE_STATUS_HW_ADDR, serdes_xmitter_lane_status_csrbus_omni_data.read().to_uint64());
        }
    }

    void peu_csr_omni::read_serdes_macro_test_cfg(void) {

        sc_uint<64>  serdes_macro_test_cfg_csrbus_read_data_reg;

        for ( ; ; ) {

            csr_port_sem.wait();
            LOG_DEBUG << "READ EVENT : Reading the CSR serdes_macro_test_cfg ";
            serdes_macro_test_cfg_csrbus_read_data_reg = csr_port.read_csr(PEU_CSR_A_SERDES_MACRO_TEST_CFG_HW_ADDR);
            csr_port_sem.post();
            serdes_macro_test_cfg_csrbus_read_data.write(serdes_macro_test_cfg_csrbus_read_data_reg);
            wait (serdes_macro_test_cfg_ev);
        }

    }

    void peu_csr_omni::write_serdes_macro_test_cfg(void) {

        while (true) {
            wait (serdes_macro_test_cfg_csrbus_omni_data.value_changed_event());
            LOG_DEBUG << "WRITE EVENT : Writing the CSR serdes_macro_test_cfg";
            serdes_macro_test_cfg_csrbus_read_data = csr_port.write_csr(PEU_CSR_A_SERDES_MACRO_TEST_CFG_HW_ADDR, serdes_macro_test_cfg_csrbus_omni_data.read().to_uint64());
        }
    }

} // namespace pcie

#endif // __EDG__
