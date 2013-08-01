/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peu_csr_omni.h
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
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_csr_omni.h
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
#ifndef INC_peu_csr_omni_hpp__
#define INC_peu_csr_omni_hpp__

#include <systemc.h>
#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"

#define CSR_ADDR_T sc_uint<32> 
#define CSR_DATA_T sc_uint<64> 

#ifdef __EDG__
SC_MODULE (peu_csr_omni) 
{
    public:
        peu_csr_omni ( sc_module_name module_name );
};

#else // __EDG__

#include "pcie_common/config.hpp"
#include "pcie_common/csr_if_port.hpp"

USING_NAMESPACE(pcie);

class peu_csr_omni : public sc_module
{
    public:
        peu_csr_omni ( sc_module_name module_name ) :
            sc_module(module_name),
            csr_port ("csr_port"),
            csr_port_sem("csr_port_sem", 1)
        {
            SC_THREAD(init);
            SC_THREAD(read_tlu_ctl);
            SC_THREAD(write_tlu_ctl);
            SC_THREAD(read_ilu_err_rw1s_alias);
            SC_THREAD(write_ilu_err_rw1s_alias);
            SC_THREAD(read_tlu_sts);
            SC_THREAD(write_tlu_sts);
            SC_THREAD(read_trn_off);
            SC_THREAD(write_trn_off);
            SC_THREAD(read_tlu_ici);
            SC_THREAD(write_tlu_ici);
            SC_THREAD(read_tlu_diag);
            SC_THREAD(write_tlu_diag);
            SC_THREAD(read_tlu_ecc);
            SC_THREAD(write_tlu_ecc);
            SC_THREAD(read_tlu_ecl);
            SC_THREAD(write_tlu_ecl);
            SC_THREAD(read_tlu_erb);
            SC_THREAD(write_tlu_erb);
            SC_THREAD(read_tlu_ica);
            SC_THREAD(write_tlu_ica);
            SC_THREAD(read_tlu_icr);
            SC_THREAD(write_tlu_icr);
            SC_THREAD(read_oe_log);
            SC_THREAD(write_oe_log);
            SC_THREAD(read_oe_int_en);
            SC_THREAD(write_oe_int_en);
            SC_THREAD(read_oe_en_err);
            SC_THREAD(read_oe_err_rw1c_alias);
            SC_THREAD(read_oe_err_rw1s_alias);
            SC_THREAD(read_roe_hdr1);
            SC_THREAD(read_roe_hdr2);
            SC_THREAD(read_toe_hdr1);
            SC_THREAD(read_toe_hdr2);
            SC_THREAD(read_tlu_prfc);
            SC_THREAD(read_tlu_prf0);
            SC_THREAD(read_tlu_prf1);
            SC_THREAD(read_tlu_prf2);
            SC_THREAD(read_tlu_dbg_sel_a);
            SC_THREAD(read_tlu_dbg_sel_b);
            SC_THREAD(read_dev_cap);
            SC_THREAD(read_dev_ctl);
            SC_THREAD(read_dev_sts);
            SC_THREAD(read_lnk_cap);
            SC_THREAD(read_lnk_ctl);
            SC_THREAD(read_lnk_sts);
            SC_THREAD(read_slt_cap);
            SC_THREAD(read_ue_log);
            SC_THREAD(read_ue_int_en);
            SC_THREAD(read_ue_en_err);
            SC_THREAD(read_ue_err_rw1c_alias);
            SC_THREAD(read_ue_err_rw1s_alias);
            SC_THREAD(read_rue_hdr1);
            SC_THREAD(read_rue_hdr2);
            SC_THREAD(read_tue_hdr1);
            SC_THREAD(read_tue_hdr2);
            SC_THREAD(read_ce_log);
            SC_THREAD(read_ce_int_en);
            SC_THREAD(read_ce_en_err);
            SC_THREAD(read_ce_err_rw1c_alias);
            SC_THREAD(read_ce_err_rw1s_alias);
            SC_THREAD(read_peu_dlpl_serdes_rev);
            SC_THREAD(read_acknak_thresh);
            SC_THREAD(read_acknak_timer);
            SC_THREAD(read_replay_tim_thresh);
            SC_THREAD(read_replay_timer);
            SC_THREAD(read_ven_dllp_msg);
            SC_THREAD(read_force_ltssm);
            SC_THREAD(read_link_cfg);
            SC_THREAD(read_link_ctl);
            SC_THREAD(read_lane_skew);
            SC_THREAD(read_symbol_num);
            SC_THREAD(read_symbol_timer);
            SC_THREAD(read_core_status);
            SC_THREAD(read_event_err_log_en);
            SC_THREAD(read_event_err_int_en);
            SC_THREAD(read_event_err_int_sts);
            SC_THREAD(read_event_err_sts_clr_rw1c_alias);
            SC_THREAD(read_event_err_sts_clr_rw1s_alias);
            SC_THREAD(read_lnk_bit_err_cnt_1);
            SC_THREAD(read_lnk_bit_err_cnt_2);
            SC_THREAD(read_serdes_pll);
            SC_THREAD(read_serdes_receiver_lane_ctl);
            SC_THREAD(read_serdes_receiver_lane_status);
            SC_THREAD(read_serdes_xmitter_lane_ctl);
            SC_THREAD(read_serdes_xmitter_lane_status);
            SC_THREAD(read_serdes_macro_test_cfg);
            SC_THREAD(write_oe_en_err);
            SC_THREAD(write_oe_err_rw1c_alias);
            SC_THREAD(write_oe_err_rw1s_alias);
            SC_THREAD(write_roe_hdr1);
            SC_THREAD(write_roe_hdr2);
            SC_THREAD(write_toe_hdr1);
            SC_THREAD(write_toe_hdr2);
            SC_THREAD(write_tlu_prfc);
            SC_THREAD(write_tlu_prf0);
            SC_THREAD(write_tlu_prf1);
            SC_THREAD(write_tlu_prf2);
            SC_THREAD(write_tlu_dbg_sel_a);
            SC_THREAD(write_tlu_dbg_sel_b);
            SC_THREAD(write_dev_cap);
            SC_THREAD(write_dev_ctl);
            SC_THREAD(write_dev_sts);
            SC_THREAD(write_lnk_cap);
            SC_THREAD(write_lnk_ctl);
            SC_THREAD(write_lnk_sts);
            SC_THREAD(write_slt_cap);
            SC_THREAD(write_ue_log);
            SC_THREAD(write_ue_int_en);
            SC_THREAD(write_ue_en_err);
            SC_THREAD(write_ue_err_rw1c_alias);
            SC_THREAD(write_ue_err_rw1s_alias);
            SC_THREAD(write_rue_hdr1);
            SC_THREAD(write_rue_hdr2);
            SC_THREAD(write_tue_hdr1);
            SC_THREAD(write_tue_hdr2);
            SC_THREAD(write_ce_log);
            SC_THREAD(write_ce_int_en);
            SC_THREAD(write_ce_en_err);
            SC_THREAD(write_ce_err_rw1c_alias);
            SC_THREAD(write_ce_err_rw1s_alias);
            SC_THREAD(write_peu_dlpl_serdes_rev);
            SC_THREAD(write_acknak_thresh);
            SC_THREAD(write_acknak_timer);
            SC_THREAD(write_replay_tim_thresh);
            SC_THREAD(write_replay_timer);
            SC_THREAD(write_ven_dllp_msg);
            SC_THREAD(write_force_ltssm);
            SC_THREAD(write_link_cfg);
            SC_THREAD(write_link_ctl);
            SC_THREAD(write_lane_skew);
            SC_THREAD(write_symbol_num);
            SC_THREAD(write_symbol_timer);
            SC_THREAD(write_core_status);
            SC_THREAD(write_event_err_log_en);
            SC_THREAD(write_event_err_int_en);
            SC_THREAD(write_event_err_int_sts);
            SC_THREAD(write_event_err_sts_clr_rw1c_alias);
            SC_THREAD(write_event_err_sts_clr_rw1s_alias);
            SC_THREAD(write_lnk_bit_err_cnt_1);
            SC_THREAD(write_lnk_bit_err_cnt_2);
            SC_THREAD(write_serdes_pll);
            SC_THREAD(write_serdes_receiver_lane_ctl);
            SC_THREAD(write_serdes_receiver_lane_status);
            SC_THREAD(write_serdes_xmitter_lane_ctl);
            SC_THREAD(write_serdes_xmitter_lane_status);
            SC_THREAD(write_serdes_macro_test_cfg);

        } 
        SC_HAS_PROCESS( peu_csr_omni );

        void init (void);
        void read_tlu_ctl(void);
        void write_tlu_ctl(void);
        void read_ilu_err_rw1s_alias(void);
        void write_ilu_err_rw1s_alias(void);
        void read_tlu_sts(void);
        void write_tlu_sts(void);
        void read_trn_off(void);
        void write_trn_off(void);
        void read_tlu_ici(void);
        void write_tlu_ici(void);
        void read_tlu_diag(void);
        void write_tlu_diag(void);
        void read_tlu_ecc(void);
        void write_tlu_ecc(void);
        void read_tlu_ecl(void);
        void write_tlu_ecl(void);
        void read_tlu_erb(void);
        void write_tlu_erb(void);
        void read_tlu_ica(void);
        void write_tlu_ica(void);
        void read_tlu_icr(void);
        void write_tlu_icr(void);
        void read_oe_log(void);
        void write_oe_log(void);
        void read_oe_int_en(void);
        void write_oe_int_en(void);
        void read_oe_en_err(void);
        void read_oe_err_rw1c_alias(void);
        void read_oe_err_rw1s_alias(void);
        void read_roe_hdr1(void);
        void read_roe_hdr2(void);
        void read_toe_hdr1(void);
        void read_toe_hdr2(void);
        void read_tlu_prfc(void);
        void read_tlu_prf0(void);
        void read_tlu_prf1(void);
        void read_tlu_prf2(void);
        void read_tlu_dbg_sel_a(void);
        void read_tlu_dbg_sel_b(void);
        void read_dev_cap(void);
        void read_dev_ctl(void);
        void read_dev_sts(void);
        void read_lnk_cap(void);
        void read_lnk_ctl(void);
        void read_lnk_sts(void);
        void read_slt_cap(void);
        void read_ue_log(void);
        void read_ue_int_en(void);
        void read_ue_en_err(void);
        void read_ue_err_rw1c_alias(void);
        void read_ue_err_rw1s_alias(void);
        void read_rue_hdr1(void);
        void read_rue_hdr2(void);
        void read_tue_hdr1(void);
        void read_tue_hdr2(void);
        void read_ce_log(void);
        void read_ce_int_en(void);
        void read_ce_en_err(void);
        void read_ce_err_rw1c_alias(void);
        void read_ce_err_rw1s_alias(void);
        void read_peu_dlpl_serdes_rev(void);
        void read_acknak_thresh(void);
        void read_acknak_timer(void);
        void read_replay_tim_thresh(void);
        void read_replay_timer(void);
        void read_ven_dllp_msg(void);
        void read_force_ltssm(void);
        void read_link_cfg(void);
        void read_link_ctl(void);
        void read_lane_skew(void);
        void read_symbol_num(void);
        void read_symbol_timer(void);
        void read_core_status(void);
        void read_event_err_log_en(void);
        void read_event_err_int_en(void);
        void read_event_err_int_sts(void);
        void read_event_err_sts_clr_rw1c_alias(void);
        void read_event_err_sts_clr_rw1s_alias(void);
        void read_lnk_bit_err_cnt_1(void);
        void read_lnk_bit_err_cnt_2(void);
        void read_serdes_pll(void);
        void read_serdes_receiver_lane_ctl(void);
        void read_serdes_receiver_lane_status(void);
        void read_serdes_xmitter_lane_ctl(void);
        void read_serdes_xmitter_lane_status(void);
        void read_serdes_macro_test_cfg(void);
        void write_oe_en_err(void);
        void write_oe_err_rw1c_alias(void);
        void write_oe_err_rw1s_alias(void);
        void write_roe_hdr1(void);
        void write_roe_hdr2(void);
        void write_toe_hdr1(void);
        void write_toe_hdr2(void);
        void write_tlu_prfc(void);
        void write_tlu_prf0(void);
        void write_tlu_prf1(void);
        void write_tlu_prf2(void);
        void write_tlu_dbg_sel_a(void);
        void write_tlu_dbg_sel_b(void);
        void write_dev_cap(void);
        void write_dev_ctl(void);
        void write_dev_sts(void);
        void write_lnk_cap(void);
        void write_lnk_ctl(void);
        void write_lnk_sts(void);
        void write_slt_cap(void);
        void write_ue_log(void);
        void write_ue_int_en(void);
        void write_ue_en_err(void);
        void write_ue_err_rw1c_alias(void);
        void write_ue_err_rw1s_alias(void);
        void write_rue_hdr1(void);
        void write_rue_hdr2(void);
        void write_tue_hdr1(void);
        void write_tue_hdr2(void);
        void write_ce_log(void);
        void write_ce_int_en(void);
        void write_ce_en_err(void);
        void write_ce_err_rw1c_alias(void);
        void write_ce_err_rw1s_alias(void);
        void write_peu_dlpl_serdes_rev(void);
        void write_acknak_thresh(void);
        void write_acknak_timer(void);
        void write_replay_tim_thresh(void);
        void write_replay_timer(void);
        void write_ven_dllp_msg(void);
        void write_force_ltssm(void);
        void write_link_cfg(void);
        void write_link_ctl(void);
        void write_lane_skew(void);
        void write_symbol_num(void);
        void write_symbol_timer(void);
        void write_core_status(void);
        void write_event_err_log_en(void);
        void write_event_err_int_en(void);
        void write_event_err_int_sts(void);
        void write_event_err_sts_clr_rw1c_alias(void);
        void write_event_err_sts_clr_rw1s_alias(void);
        void write_lnk_bit_err_cnt_1(void);
        void write_lnk_bit_err_cnt_2(void);
        void write_serdes_pll(void);
        void write_serdes_receiver_lane_ctl(void);
        void write_serdes_receiver_lane_status(void);
        void write_serdes_xmitter_lane_ctl(void);
        void write_serdes_xmitter_lane_status(void);
        void write_serdes_macro_test_cfg(void);

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


        sc_semaphore csr_port_sem;
        csr_if_port<CSR_ADDR_T, CSR_DATA_T>	csr_port;
        sc_event 	tlu_ctl_ev;
        sc_event 	ilu_err_rw1s_alias_ev;
        sc_event 	tlu_sts_ev;
        sc_event 	trn_off_ev;
        sc_event 	tlu_ici_ev;
        sc_event 	tlu_diag_ev;
        sc_event 	tlu_ecc_ev;
        sc_event 	tlu_ecl_ev;
        sc_event 	tlu_erb_ev;
        sc_event 	tlu_ica_ev;
        sc_event 	tlu_icr_ev;
        sc_event 	oe_log_ev;
        sc_event 	oe_int_en_ev;

        sc_event oe_en_err_ev;
        sc_event   oe_err_rw1c_alias_ev;
        sc_event   oe_err_rw1s_alias_ev;
        sc_event   roe_hdr1_ev;
        sc_event   roe_hdr2_ev;
        sc_event   toe_hdr1_ev;
        sc_event   toe_hdr2_ev;
        sc_event   tlu_prfc_ev;
        sc_event   tlu_prf0_ev;
        sc_event   tlu_prf1_ev;
        sc_event   tlu_prf2_ev;
        sc_event   tlu_dbg_sel_a_ev;
        sc_event   tlu_dbg_sel_b_ev;
        sc_event   dev_cap_ev;
        sc_event   dev_ctl_ev;
        sc_event   dev_sts_ev;
        sc_event   lnk_cap_ev;
        sc_event   lnk_ctl_ev;
        sc_event   lnk_sts_ev;
        sc_event   slt_cap_ev;
        sc_event   ue_log_ev;
        sc_event   ue_int_en_ev;
        sc_event   ue_en_err_ev;
        sc_event   ue_err_rw1c_alias_ev;
        sc_event   ue_err_rw1s_alias_ev;
        sc_event   rue_hdr1_ev;
        sc_event   rue_hdr2_ev;
        sc_event   tue_hdr1_ev;
        sc_event   tue_hdr2_ev;
        sc_event   ce_log_ev;
        sc_event   ce_int_en_ev;
        sc_event   ce_en_err_ev;
        sc_event   ce_err_rw1c_alias_ev;
        sc_event   ce_err_rw1s_alias_ev;
        sc_event   peu_dlpl_serdes_rev_ev;
        sc_event   acknak_thresh_ev;
        sc_event   acknak_timer_ev;
        sc_event   replay_tim_thresh_ev;
        sc_event   replay_timer_ev;
        sc_event   ven_dllp_msg_ev;
        sc_event   force_ltssm_ev;
        sc_event   link_cfg_ev;
        sc_event   link_ctl_ev;
        sc_event   lane_skew_ev;
        sc_event   symbol_num_ev;
        sc_event   symbol_timer_ev;
        sc_event   core_status_ev;
        sc_event   event_err_log_en_ev;
        sc_event   event_err_int_en_ev;
        sc_event   event_err_int_sts_ev;
        sc_event   event_err_sts_clr_rw1c_alias_ev;
        sc_event   event_err_sts_clr_rw1s_alias_ev;
        sc_event   lnk_bit_err_cnt_1_ev;
        sc_event   lnk_bit_err_cnt_2_ev;
        sc_event   serdes_pll_ev;
        sc_event   serdes_receiver_lane_ctl_ev;
        sc_event   serdes_receiver_lane_status_ev;
        sc_event   serdes_xmitter_lane_ctl_ev;
        sc_event   serdes_xmitter_lane_status_ev;
        sc_event   serdes_macro_test_cfg_ev;
};

#endif // __EDG__

#endif //INC_peu_csr_omni_hpp__
