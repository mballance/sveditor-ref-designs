/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pl_top.h
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
// OpenSPARC T2 Processor File: pl_top.h
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
#ifndef INC_pl_top_h__
#define INC_pl_top_h__

#ifndef __EDG__

#include <systemc.h>
#include <math.h>
#include "pcie_common/config.hpp"
#include "pcie_common/pciePacket.hpp"
#include "pcie_common/logger.hpp"
#include "pcie_common/symbol_encoding.hpp"
#include "data_scrambler.h"
#include "encode_map.h"
#include "pl/running_disparity.h"
#include <map>

#include "pcie_common/data_port.hpp"

USING_NAMESPACE(pcie)
USING_NAMESPACE(Logger)

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

#define curr_running_disp running_disparity::current_disparity()
#define scrambler_i data_scrambler::scramble()
#define descrambler_i data_scrambler::descramble()

class pl_top : public sc_module
{
    public :
        /// Instance of read interface to fifo channel
        data_in_port<RefPciePacket> dll_pl_dllp_in;
        data_in_port<RefPciePacket> dll_pl_tlp_in;
        data_out_port<RefPciePacket> pl_dll_out;

        // Encoded data signals go into the serializer....
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
        sc_out <bool> sym_boundary;
        sc_out <bool> q_not_empty;
        sc_out <bool> start_reinit;
        sc_out <bool> stage_reinit;
        sc_out<bool > PhysicalLinkUp;

        /// These are the signals which are inputs from the deserializer
        sc_in<sc_lv<LINK_WIDTH> > deser_data0;
        sc_in<sc_lv<LINK_WIDTH> > deser_data1;
        sc_in<sc_lv<LINK_WIDTH> > deser_data2;
        sc_in<sc_lv<LINK_WIDTH> > deser_data3;
        sc_in<sc_lv<LINK_WIDTH> > deser_data4;
        sc_in<sc_lv<LINK_WIDTH> > deser_data5;
        sc_in<sc_lv<LINK_WIDTH> > deser_data6;
        sc_in<sc_lv<LINK_WIDTH> > deser_data7;
        sc_in<sc_lv<LINK_WIDTH> > deser_data8;
        sc_in<sc_lv<LINK_WIDTH> > deser_data9;
        sc_in<sc_lv<LINK_WIDTH> > deser_data0_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data1_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data2_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data3_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data4_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data5_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data6_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data7_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data8_b;
        sc_in<sc_lv<LINK_WIDTH> > deser_data9_b;
        sc_in<bool> frm_boundary_deser;
        sc_in<bool> disable_scrambling;
        sc_in<bool> link_clk;
        sc_in<bool> init_done;
        sc_in<bool> init_done_rx;
        sc_in<bool> frame_boundary_ltssm_tx;
        sc_in<bool> last_idle_frame;
        sc_in<bool> reset_l;
        sc_in<bool> reset_por_l;
        sc_in<bool> ts1_pattern_received;


        pl_top(sc_module_name _name) :
            sc_module(_name),
            dll_pl_tlp_in("dll_pl_tlp_in"),
            dll_pl_dllp_in("dll_pl_dllp_in"),
            pl_dll_out("pl_dll_out")
        {
            map_table = new encoder_map("encoder_map");
            finished_sending_pkt = false;
            SC_THREAD(ingress_process_packet);
            SC_THREAD(process_packet);
            SC_THREAD(check_reinit);
            SC_THREAD(check_stage_reinit);
            start_reinit.initialize(true);
            stage_reinit.initialize(true);
        }

        SC_HAS_PROCESS(pl_top);




    private :
        bool interleave_idle;
        bool xtracted_data_c[50000];
        bool finished_sending_pkt;
        bool initialization_done;

        unsigned int bitlane[10];
        sc_lv<10> encoded_data;
        sc_lv<LINK_WIDTH> ingr_xtracted_data[50000];
        sc_lv<LINK_WIDTH> ingr_xtracted_data_b[50000];
        sc_lv<10> ingr_decoded_data[50000];
        sc_lv<8> ingr_xtracted_byte[50000];
        bool ingr_xtracted_byte_c[50000];
        sc_lv<10> xtracted_data[50000];
        sc_int<10> ingress_data[50000];
        sc_uint<LINK_WIDTH> lane_data_bit[10];
        sc_lv <LINK_WIDTH> lane_data[10];
        sc_lv<10> ingr_lane_data[LINK_WIDTH];
        RefPciePacket global_packet;
        RefPciePacket global_ingress_packet;
        encoder_map *map_table;
        int this_pkt_size;


        void process_packet(); // Transmit port processing of packets
        void check_reinit(); // For recovery state control handover to LTSSM
        void check_stage_reinit(); // Recovery state transition staging
        void ingress_process_packet(); // Receiver/Ingress process packet

};

#endif // __EDG__

#endif // inc_pl_top_h__
