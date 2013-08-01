/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ltssm.h
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
// OpenSPARC T2 Processor File: ltssm.h
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
#ifndef INC_ltssm_h__
#define INC_ltssm_h__
#define IDLE 0
#define ACTIVE 1
#define DetectQuietDelay 10

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

#include "systemc.h"
#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/symbol_encoding.hpp"
#include "pcie_common/ilupeu_defines.h"
#include "pcie_common/logger.hpp"
#include "pl/encode_map.h"
#include "pl/data_scrambler.h"
#include "pl/running_disparity.h"

#define curr_running_disp running_disparity::current_disparity() 
#define descrambler_i data_scrambler::descramble()
#define scrambler_i data_scrambler::scramble()

using namespace Logger;
using namespace pcie;

class ltssm : public sc_module
{
    public :
        sc_in<sc_lv<LINK_WIDTH> > lane_in; // 10 bit lane
        sc_in<sc_lv<LINK_WIDTH> > lane_in_bar;
        sc_in<bool> link_clk;
        sc_in<bool> reset_l;
        sc_in<bool> reset_por_l;
        sc_in<bool> q_not_empty;
        sc_in<bool> start_reinit;
        sc_out<bool> init_done;
        sc_out<bool> init_done_rx;
        sc_out<bool> frame_boundary_rx;
        sc_out<bool> frame_boundary_tx;
        sc_out <sc_lv<LINK_WIDTH> > lane_out;
        sc_out <sc_lv<LINK_WIDTH> > lane_out_bar;
        sc_out <bool> disable_scrambling;
        sc_out <bool> last_idle_frame;
        sc_out <bool> last_idle_frame_retraining;
        sc_out <bool>  ts1_pattern_received;
        csr_if_port<CSR_ADDR_T, CSR_DATA_T>	csr_port;

        ltssm(sc_module_name _name) :
            sc_module(_name),
            csr_port("csr_port")
    {
        int i;
        LOG_DEBUG << "LTSSM CTOR";
        map_table = new encoder_map("map_table");
        init_state = DETECT_QUIET; // Directly start from polling, by skipping detect state
        init_state_rx = DETECT_QUIET;
        write_init_done = false;
        write_init_done_rx = false;
        received_electrical_idle = false;
        received_electrical_idle_constant_voltage = false;
        constant_voltage_count = 0;
        toRecovery = false;
        received_skp_ordered_set = false;
        received_2xts1_hot_reset = false;
        ts1_hot_reset_count = 0;
        from_cfg_lanenum_wait = false;
        start_pattern_aligned = false;
        first_retrain_idle_detection = true;
        com_detected_tx = false;
        frame_boundary_tx_counter = 0;
        start_frame_boundary_tx = false;
        stage_init_state_rx = false;
        stage_init_state = false;
        retraining = false;
        this_is_retraining = false;
        enter_drain_state = false;
        disable_link_reg = false;
        disable_scrambling_reg = false;
        transmitted_16xts1_disabled = false;
        transmitted_1xelec_idle = false;
        lock_negedge_clock = false;
        done_last_idle = 0;
        done_last_idle_retrain = 0;
        ireg = 0;
        ts1_disabled_bit = 0;
        frame_boundary_detected = 0;
        frame_boundary_tx_detected = 0;
        ts1_disabled_pattern_count = 0;
        sym_counter = 0;
        lock_counter = 0;
        start_ordered_set = 0;
        ts1_count = 0;
        ts2_pattern_bit = 0;
        elec_idle_pattern_bit = 0;
        idle_pattern_bit = 0;
        general_idle_pattern_bit = 0;
        generated_pattern = 0;
        ts1_non_pad_link_bit = 0;
        ts1_non_pad_link_lane = 0;
        ts1_non_pad_lane_bit = 0;
        ts1_non_pad_diff_lane_bit = 0;
        ts1_disable_link_count = 0;
        ts1_disable_scrambling_count = 0;
        this_ts1_2 = 0;
        idl_count = 0;
        ts1_2 = 0x0000000000000000000000000000000000000000;
        electrical_idle_constant_voltage_set = 0x3ff;
        symbol_count = 0;
        come_next_time = 0;
        transmit_ts1_count = 0;
        transmit_ts2_count = 0;
        transmit_idl_count = 0;
        transmit_failover_ts2_count = 0;
        transmitted_ts1_pattern = 0;
        transmitted_ts2_pattern = 0;
        transmitted_idl_pattern = 0;
        link_field_is_non_PAD_ts1 = 0;
        lane_field_is_non_PAD_ts1 = 0;
        lane_field_is_non_PAD_ts2 = 0;
        move_to_cfg_lanenum_wait = 0;
        move_to_cfg_lanenum_accept = 0;
        move_to_detect_quiet = 0;
        symbol_num = 0;
        ts1_pattern_received.initialize(false);

        for(i=0;i<160;i++)
        {
            ts1_link_num_non_PAD[i] = 0x00000000;
            ts1_lane_num_non_PAD[i] = 0x00000000;
            ts1_link_lane_non_PAD[i] = 0x00000000;
        }
        for(i=0;i<LINK_WIDTH;i++)
            first_packet[i] = true;

        SC_THREAD(assign_block2);
        SC_THREAD(rx_block);
        SC_THREAD(init_state_machine);
        SC_THREAD(counter_block0);
        SC_THREAD(counter_block2);
        SC_THREAD(counter_block4);
        SC_THREAD(in_block);
        SC_THREAD(frame_boundary_assign);
        SC_THREAD(frame_boundary_assign_rx);
        SC_THREAD(init_state_machine_rx);
        SC_THREAD(read_csr_block);
        SC_THREAD(read_csr1_block);
        SC_THREAD(tx_block);
    }

        SC_HAS_PROCESS(ltssm);

        sc_event csr_core_status_ev;
        sc_event link_sts_csr_ev;
        sc_event macl_pcs_ctl_ev;

    private:
        void set_delim_value(int set,int i);
        void reset_var_detect_quiet();
        encoder_map *map_table;
        map<int,int>::iterator map_iter;
        sc_bv<10>  ireg_in[LINK_WIDTH];
        sc_bv<10>  ireg_in_bar[LINK_WIDTH];
        sc_bv<10>  ireg_in_p[LINK_WIDTH];
        sc_bv<10>  ireg_in_p_bar[LINK_WIDTH];
        sc_bv<10>  ireg_in_p_p[LINK_WIDTH];
        sc_bv<10>  ireg_in_p_p_bar[LINK_WIDTH];
        sc_bv<10>  ts1_lane_diff_non_PAD[LINK_WIDTH];
        sc_bv<10>  ts2_lane_diff_non_PAD[LINK_WIDTH];
        sc_bv<10>  ts1_lane_diff_non_PAD_tmp[LINK_WIDTH];
        sc_bv<10>  out_reg_ser;
        sc_bv<10>  out_reg_ser_bar;
        sc_bv<LINK_WIDTH>  out_reg;
        sc_bv<LINK_WIDTH>  out_reg_bar;
        sc_bv<LINK_WIDTH>  in_val;
        sc_bv<LINK_WIDTH>  in_val_bar;
        sc_bv<LINK_WIDTH>  ireg;
        sc_bv<LINK_WIDTH>  ireg_bar;
        bool com_detected;
        bool enter_drain_state;
        bool negedge_skip_this;
        bool come_next_time;
        bool retraining;
        bool this_is_retraining;
        bool frame_boundary_detected;
        bool frame_boundary_tx_detected;
        bool first_packet[LINK_WIDTH];
        bool first_retrain_idle_detection;
        int  done_last_idle;
        int  done_last_idle_retrain;

        sc_bv<160> ts1_2;
        sc_bv<160> disabled_set[LINK_WIDTH];
        sc_bv<160> ts1_2_negedge;
        sc_bv<160> ts1_2_serial[LINK_WIDTH];
        sc_bv<160> ts1_2_serial_negedge[LINK_WIDTH];
        sc_bv<160> ts1_set,ts2_set;
        sc_bv<160> ts1_set_const[LINK_WIDTH],ts2_set_const[LINK_WIDTH];
        sc_bv<10>  ts1_2_N_FTS;
        sc_bv<10>  ts1_2_rate_ID;
        sc_bv<8>  ts1_trn_ctrl;
        sc_bv<10>  ts2_trn_ctrl;
        sc_bv<10>  ts1_2_TSID;
        bool disable_scrambling_reg;
        bool disable_link_reg;
        bool write_init_done;
        bool write_init_done_rx;
        bool stage_init_state_rx;
        bool stage_init_state;
        bool start_pattern_aligned;
        bool lock_negedge_clock;
        sc_bv<10>  idle_set[LINK_WIDTH];
        sc_bv<10>  idle_set_negedge[LINK_WIDTH];
        sc_bv<40>  fts_set;
        sc_bv<40>  fts_set_negedge;
        sc_bv<40>  skip_set;
        sc_bv<40>  skip_set_negedge;
        sc_bv<10> training_ctl;
        sc_bv<10>  ts1_2_link_num[LINK_WIDTH];
        sc_bv<10>  ts1_2_lane_num[LINK_WIDTH];
        sc_bv<LINK_WIDTH>  transmit_link_num_non_PAD;
        sc_bv<LINK_WIDTH>  transmit_lane_num_non_PAD;
        sc_bv<160>  ts1_link_num_non_PAD[LINK_WIDTH];
        sc_bv<160>  ts1_lane_num_non_PAD[LINK_WIDTH];
        sc_bv<160>  ts1_link_lane_non_PAD[LINK_WIDTH];
        sc_bv<160>  ts2_link_lane_non_PAD[LINK_WIDTH];
        sc_bv<40>   idle_set_const[LINK_WIDTH];
        sc_bv<40>   elec_idle_set[LINK_WIDTH];
        sc_bv<40>   electrical_idle_set;
        sc_bv<10>   electrical_idle_constant_voltage_set;
        sc_bv<40>   electrical_idle_set_negedge;
        sc_bv<10> encoded_value[256];
        sc_bv<10> neg_encoded_value[256];
        sc_bv<64> link_ctl_csr;
        sc_bv<64> macl_pcs_ctl_csr;
        sc_signal<bool> frame_boundary_reg;
        sc_signal<bool> frame_boundary_reg_tx;
        bool com_detected_tx;
        bool start_frame_boundary_tx;
        int frame_boundary_tx_counter;
        int ts1_disabled_pattern_count;

        bool start_ordered_set;
        bool move_to_cfg_lanenum_wait,move_to_detect_quiet,move_to_cfg_lanenum_accept;
        int generated_pattern ;
        int elec_idle_pattern_bit;
        int ts1_disabled_bit;
        int init_state;
        int prev_init_state;
        int init_state_rx;
        int lock_counter;
        int sym_counter;
        int ts1_count,ts1_hot_reset_count,ts2_count,transmit_ts1_count,transmit_ts2_count,transmit_idl_count,transmit_failover_ts2_count;
        int lane_field_is_PAD_ts1,link_field_is_PAD_ts1,lane_field_is_PAD_ts2,link_field_is_PAD_ts2;
        int link_field_PAD_ts1_ok,link_field_PAD_ts2_ok,lane_field_PAD_ts1_ok,lane_field_PAD_ts2_ok;
        int link_field_non_PAD_ts1_ok,link_field_non_PAD_ts2_ok;
        bool this_ts1_2;
        int ts1_disable_link_count;
        int ts1_disable_scrambling_count;
        bool received_8xts2_sets,received_8xts1_sets,received_8xidl_sets,transmitted_16xts2_sets,transmitted_16xidl_sets,transmitted_1024xts1_2sets;
        bool transmitted_1xelec_idle;
        bool received_1xts2_sets,received_1xts1_sets,received_1xidl_sets;
        bool received_electrical_idle,received_skp_ordered_set;
        bool received_electrical_idle_constant_voltage;
        bool received_2xts1_hot_reset;
        int constant_voltage_count;
        bool from_cfg_lanenum_wait;
        bool toRecovery;
        bool toHotReset1;
        bool transmitted_16xts1_disabled;
        int symbol_count;
        int idl_count;
        int ts2_pattern_bit,idle_pattern_bit,ts1_pattern_bit,ts1_non_pad_link_bit,ts1_non_pad_link_lane,ts1_non_pad_lane_bit,general_idle_pattern_bit;
        int ts1_non_pad_diff_lane_bit;
        int ts2_failover_pattern_bit;
        int transmitted_ts1_pattern,transmitted_ts2_pattern,transmitted_idl_pattern;
        int link_field_is_non_PAD_ts1,lane_field_is_non_PAD_ts1,link_field_is_non_PAD_ts2,lane_field_is_non_PAD_ts2;
        int symbol_num;

        CSR_DATA_T ltssm_control_reg;  /** 006E2050 */
        CSR_DATA_T core_status_reg;	/** 006E2100 */


        //Module threads and methods
        void in_block();
        void read_csr_block();           ///< Read LNK_CTL_HW CSR to look at disable link/scrambling etc
        void read_csr1_block();          ///< This CSR Read is for HOT-RESET control
        void assign_block2();
        void frame_boundary_assign_rx();
        void frame_boundary_assign();
        void counter_block0();           ///< Counter block for receive side
        void counter_block2();           ///< Counter block for receive side to check for COM_DETECTED
        void counter_block4();           ///< Staged negedge_clk in data read
        void reg_block1();               ///< Main block to receive/transmit data based on current LTSSM state
        void tx_block();
        void rx_block();                 /// Function for teh receive port processing
        void init_state_machine();       ///< always @(negedge frame_boundary)
        void init_state_machine_rx();
};

#endif // INC_ltssm_h__
