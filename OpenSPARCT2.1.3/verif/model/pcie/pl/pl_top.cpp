// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pl_top.cpp
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
#include <systemc.h>
#include <math.h>
#include "pl/pl_top.h"
#include <map>

USING_NAMESPACE(pcie)
USING_NAMESPACE(Logger)

/// This is the main transmit block.
/// It gets the packet from the TLM FIFO
/// forms the PL frame and then sends out according to the LINK_WIDTH
/// It first scrambles, then encodes and then finally forms frames
/// It is also responsible for forming intermediate SKP Ordered sets and IDLE sets
void pl_top::process_packet()
{
    int i,j;
    int lane;
    int pkt_cnt = 0;
    int pkt_id = 0;
    int skp_counter = 0;
    int dll_pkt_cnt = 0;
    double size; 
    unsigned short scramble_lfsr;
    unsigned long word_val;
    map<int,int>::iterator iter;
    RefPciePacket pkt;
    RefPciePacket receive_packet;
    RefPciePacket idle_packet;
    RefPciePacket skp_packet;
    bool waitingforFirstData = true;
    bool packet_ready_dll,packet_ready_tl,round_robin_dll_tl = false;
    bool skp_ordered_set = false;
    bool put_end_symbol = false;
    sc_lv<5> control; /// control signal from the DLL

    while(1){
        if ( dll_pkt_cnt >= 5)
            packet_ready_tl = dll_pl_tlp_in.is_packet_ready();

        packet_ready_dll = dll_pl_dllp_in.is_packet_ready();


#ifdef SEND_SKP
        if((packet_ready_tl || packet_ready_dll) && init_done.read() && !last_idle_frame.read() && !interleave_idle && ((skp_counter < 1450) || skp_counter == 0)) /// Link Init complete and DLLP has put a packet into the FIFO
#else
            if((packet_ready_tl || packet_ready_dll) && init_done.read() && !last_idle_frame.read() && !interleave_idle) /// Link Init complete and DLLP has put a packet into the FIFO
#endif
            {
                if(packet_ready_dll && !round_robin_dll_tl)
                {
                    dll_pl_dllp_in.get_packet(receive_packet);
                    //cout<< sc_time_stamp() <<"\t\t\t\t\t| PL: Recvd DLLP " << receive_packet->getPacketId() << " from DLL." <<endl;
                    dll_pkt_cnt++;
                    if(dll_pkt_cnt >= 5) /// Make sure FC_INIT packets go before any TLP
                        round_robin_dll_tl = true;
                }
                else if(packet_ready_tl && round_robin_dll_tl)
                {
                    dll_pl_tlp_in.get_packet(receive_packet);
                    //cout<< sc_time_stamp() <<"\t\t\t\t\t| PL: Recvd TLP " << receive_packet->getPacketId() << " from DLL." <<endl;
                    round_robin_dll_tl = false;
                }
                else if(packet_ready_dll && !packet_ready_tl && round_robin_dll_tl) /// Still keep next priority for TL. But dequeue DLL Q for now
                {
                    dll_pl_dllp_in.get_packet(receive_packet);
                    //cout<< sc_time_stamp() <<"\t\t\t\t\t| PL: Recvd DLLP " << receive_packet->getPacketId() << " from DLL." <<endl;
                    dll_pkt_cnt++;
                }
                else if( packet_ready_tl && !packet_ready_dll && !round_robin_dll_tl) /// Still Keep next priority for DLL. But dequeue TL for now
                {
                    dll_pl_tlp_in.get_packet(receive_packet);
                    //cout<< sc_time_stamp() <<"\t\t\t\t\t| PL: Recvd TLP " << receive_packet->getPacketId() << " from DLL." <<endl;
                }

                pkt_id = receive_packet->getPacketId();

                global_packet = receive_packet;
                q_not_empty.write(true);
                waitingforFirstData = false;
                size = global_packet->get_size();
                interleave_idle = true;
                control = global_packet->get_control();
            }
#ifdef SEND_SKP
            else if((skp_counter < 1450) || skp_counter == 0)/// Produce IDLE packets
#else
            else 
#endif
            {
                idle_packet = new pciePacket(LINK_WIDTH);
                for(i=0;i<LINK_WIDTH;i++)
                    idle_packet->modify_byte(i,0x00);
                global_packet = idle_packet;
                if(packet_ready_dll || packet_ready_tl)
                {
                    q_not_empty.write(true); /// data is available, but the last IDLE frame has not been transmitted
                }
                else if(!packet_ready_dll && !packet_ready_tl && waitingforFirstData)
                    q_not_empty.write(false);

                size = global_packet->get_size();
                interleave_idle = false; /// Interleave every DLLP/TLP with an IDLE frame
                control = 0x000; /// No Control Chars in the IDLE frame
            }
#ifdef SEND_SKP
        else if((skp_counter >= 1450))
        {
            skp_packet = new pciePacket(4*LINK_WIDTH); /// SKP is sent across 4 frames
            for(i=0;i<LINK_WIDTH;i++)
                skp_packet->modify_byte(i,COM);
            for(i=LINK_WIDTH;i<2*LINK_WIDTH;i++)
                skp_packet->modify_byte(i,SKP);
            for(i=2*LINK_WIDTH;i<3*LINK_WIDTH;i++)
                skp_packet->modify_byte(i,SKP);
            for(i=3*LINK_WIDTH;i<4*LINK_WIDTH;i++)
                skp_packet->modify_byte(i,SKP);

            global_packet = skp_packet;
            size = global_packet->get_size();
            control = 0x001;
            skp_counter = 0;
        }
#endif
        pkt = global_packet;

        put_end_symbol = false;
        control = pkt->get_control();
        if(control[1] == 0x1) /// Only for STP, ignore the 0th byte
            size--;
        /// Check if LINK_WIDTH > size + 2
        if(size <= LINK_WIDTH) /// For FC_Init and IDLE frames
        {
            control = pkt->get_control(); /// Control signal from the DLLP
            /// [0] = D/K#
            /// [1] = STP
            /// [2] = SDP
            /// [3] = END
            /// [4] = EDB
            if((control[1] != 0x1) && (control[2] != 0x1)) /// IDLE packet
            {
                for(i = 0; i < size; i++) /// The actual data without STP/SDP
                {
                    xtracted_data[i] = pkt->get_byte(i);
                    xtracted_data_c[i] = false;
                }                
                for(i = size ; i < LINK_WIDTH ; i++) /// PAD or END character
                {
                    xtracted_data[i] = PAD;
                }
                size = LINK_WIDTH;
            }
            else /// FC_Init
            {
                if(control[1] == 0x1)
                {
                    xtracted_data[0] = STP;
                    xtracted_data_c[0] = true;
                }
                else if(control[2] == 0x1)
                {
                    xtracted_data[0] = SDP;
                    xtracted_data_c[0] = true;
                }
                for(i = 1,j=0; i <= size,j< size; i++,j++) /// The actual data with CRC
                {
                    xtracted_data[i] = pkt->get_byte(j);
                    xtracted_data_c[i] = false;
                }                
                for(i = size+1 ; i < LINK_WIDTH ; i++) /// PAD or END character
                {
                    if(((i+1) % 4) == 0 && (control[3] == 0x1) && !put_end_symbol) /// END
                    {
                        xtracted_data[i] = END;
                        xtracted_data_c[i] = true;
                        put_end_symbol = true;
                    }
                    else if(((i+1) %4) == 0 && (control[4] == 0x1) && !put_end_symbol) /// EDB
                    {
                        xtracted_data[i] = EDB;
                        xtracted_data_c[i] = true;
                        put_end_symbol = true;
                    }
                    else
                    {
                        xtracted_data[i] = PAD;
                        xtracted_data_c[i] = true;
                    }
                }
                size = LINK_WIDTH;
            }
        }
        else/// Transaction Layer packets or SKP Ordered Set or DLLP with size > LINK_WIDTH
        {
            control = pkt->get_control();
            if(control[0] == 0) /// TLP
            {
                if(control[1] == 0x1)
                {
                    xtracted_data[0] = STP;
                    xtracted_data_c[0] = true;
                }
                else if(control[2] == 0x1)
                {
                    xtracted_data[0] = SDP;
                    xtracted_data_c[0] = true;
                }
                for(i=1,j=0; i<= size,j<size ; i++,j++) /// The actual data with CRC for TLP
                {
                    if(xtracted_data[0] == SDP) /// get data from byte 0
                        xtracted_data[i] = pkt->get_byte(j);
                    else
                        xtracted_data[i] = pkt->get_byte(i);
                    xtracted_data_c[i] = false;
                }
                for(i = size+1 ; i < LINK_WIDTH*ceil(double((size+2)/LINK_WIDTH)); i++)
                {
                    if(((i+1) % 4) == 0 && (control[3] == 0x1) && !put_end_symbol) /// END
                    {
                        xtracted_data[i] = END;
                        xtracted_data_c[i] = true;
                        put_end_symbol = true;
                    }
                    else if(((i+1) % 4) == 0 && (control[4] == 0x1) && !put_end_symbol) /// EDB
                    {
                        xtracted_data[i] = EDB;
                        xtracted_data_c[i] = true;
                        put_end_symbol = true;
                    }
                    else
                    {
                        xtracted_data[i] = PAD;
                        xtracted_data_c[i] = true;
                    }
                }
                size = LINK_WIDTH*ceil(double((size+2)/LINK_WIDTH));
            }
            else
            {
                /// SKP Ordered Set
                for(i=0; i< size; i++)
                {
                    xtracted_data[i] = pkt->get_byte(i);
                    xtracted_data_c[i] = true;
                }
                size = 4*LINK_WIDTH;
            }
        }

        /// Now scramble the data
        if(init_done.read() && reset_l.read() && reset_por_l.read())
        {
            initialization_done = true;
            for(int lane_scram=0; lane_scram<LINK_WIDTH; lane_scram++)
                scrambler_i->start_scramble_reg[lane_scram] = true;
            scramble_lfsr = scrambler_i->get_lfsr(0);
            for(i = 0 ; i< size ; i++) /// Whether to scramble or descramble the data. The Start, end and PAD symbols will not be scrambled anyway
            {
                if(((i % LINK_WIDTH) == 0 && (i > 0)) || (LINK_WIDTH == 1 && xtracted_data[i] == SKP))
                {
                    if(xtracted_data_c[i]) /// Should go into this block when LINK_1 and control character
                    {
                        if(xtracted_data[i] == SKP)
                        {
                            skp_ordered_set = true;
                            scrambler_i->scramble_descramble_all(SKP,0,1);
                        }
                    }
                    else
                    {
                        scrambler_i->scramble_descramble_all(0x00,1,0); /// Forward the LFSR for the next scramble
                        scramble_lfsr = scrambler_i->get_lfsr(0);
                    }
                }

                if(control[0] == 0x1) /// This is a control packet. Dont scramble it at all
                {
                    xtracted_data_c[i] = true;
                    continue;
                }

                if(xtracted_data_c[i]) /// Dont scramble K characters
                {
                    /// First check if its a COM...Reset lfsr
                    word_val = xtracted_data[i].get_word(0);
                    if(xtracted_data[i] == COM) 
                        scrambler_i->scramble_descramble_all(word_val,1,1);
                    continue;
                }

                word_val = xtracted_data[i].get_word(0);
                xtracted_data[i] = scrambler_i->scramble_descramble_all(word_val,1,0);
                if(scrambler_i->get_lfsr(0) != 0xffff) {
                    for(int lane_scram=0; lane_scram<LINK_WIDTH; lane_scram++)                        
                        scrambler_i->set_lfsr(scramble_lfsr,lane_scram);
                }
                wait(SC_ZERO_TIME);

            }
            if(!skp_ordered_set)
            {
                scrambler_i->scramble_descramble_all(0x00,1,0); /// Size of packet is only 8 bytes
                for(int lane_scram=0; lane_scram<LINK_WIDTH; lane_scram++)                        
                    scrambler_i->start_scramble_reg[lane_scram] = false;
            }
            else
            {
                skp_ordered_set = false;
            }

            skp_ordered_set = false;
            /// Now encode the data
            for(i = 0; i< size ; i++)
            {
                wait(SC_ZERO_TIME);
                lane = i%LINK_WIDTH;
                if(curr_running_disp->get_CRD(lane) == 0)            
                {
                    word_val = xtracted_data[i].get_word(0);
                    iter = map_table->neg_spec_symbol_map.find(word_val);
                    if((iter == map_table->neg_spec_symbol_map.end()) || !xtracted_data_c[i]) /// This is not a control packet and not STP/SDP/END/EDB when not scrambled
                        iter = map_table->neg_data_encode_map.find(word_val);
                    xtracted_data[i] = iter->second;
                }
                else if(curr_running_disp->get_CRD(lane) == 1)
                {
                    word_val = xtracted_data[i].get_word(0);
                    iter = map_table->spec_symbol_map.find(word_val);
                    if((iter == map_table->spec_symbol_map.end()) || !xtracted_data_c[i]) /// This is not a control packet and not STP/SDP/END/EDB when not scrambled
                        iter = map_table->data_encode_map.find(word_val);
                    xtracted_data[i] = iter->second;
                }
                if(curr_running_disp->calculate_disparity(xtracted_data[i].get_word(0),0) == 0)
                {
                    curr_running_disp->set_CRD(lane,sc_logic(0));
                }
                else if(curr_running_disp->calculate_disparity(xtracted_data[i].get_word(0),0) == 1)
                {
                    curr_running_disp->set_CRD(lane,sc_logic(1));
                }
                wait(SC_ZERO_TIME);
            }
            /// data has now been encoded...needs to be serialized
            /// Have the packet, now packetize it properly
            /// If we now have to just send the data onto the bus this data, xtracted_data can be forwarded
        }
        else if(!init_done.read())
        {
            initialization_done = false;
            interleave_idle = true;
            skp_counter = 0;
        }

        finished_sending_pkt = false;
        while(pkt_cnt < size)
        {
            finished_sending_pkt = false;
            for(j=0;j<10;j++)
            {
                for(i=pkt_cnt;i< (pkt_cnt+LINK_WIDTH) ;i++)
                {
                    if(LINK_WIDTH == 1)
                        lane_data[j] = (xtracted_data[i].range(9-j,9-j));
                    else
                        lane_data[j] = (xtracted_data[i].range(9-j,9-j),lane_data[j].range(LINK_WIDTH-1,1));
                }
            }
            pkt_cnt += LINK_WIDTH;
            sym_boundary = 1;
            wait(frame_boundary_ltssm_tx.posedge_event()); /// init_done will not be detected first time
            /// So send IDLE frames first time only in this section
            /// Else send the correct frames
            /// At the end of this cycle, the data format is as we would like it to be (packetized properly)
            for(i=0;i<10;i++)
            {
                encoded_data = 0;
                encoded_data = lane_data[i]; /// This should be just fine
                wait(link_clk.negedge_event());
                skp_counter++;
                switch(i)
                {
                    case 0 : encoded_data0 = encoded_data;
                    case 1 : encoded_data1 = encoded_data;
                    case 2 : encoded_data2 = encoded_data;
                    case 3 : encoded_data3 = encoded_data;
                    case 4 : encoded_data4 = encoded_data;
                    case 5 : encoded_data5 = encoded_data;
                    case 6 : encoded_data6 = encoded_data;
                    case 7 : encoded_data7 = encoded_data;
                    case 8 : encoded_data8 = encoded_data;
                    case 9 : encoded_data9 = encoded_data;
                }
            }
            sym_boundary = 0;
            /// The data into the serializer input is ready and available
            /// The serializer gives out data at every posedge link_clk.
            /// Look at the data at the negedge to take care of race conditions
            /// Thus, get the serialized at every negedge link_clk for the entire packet
            /// Data is in serialized_data_out. This is a logic value
        }
        finished_sending_pkt = true;
        pkt_cnt = 0;
    }
}

//// Signal for retraining
void pl_top::check_reinit()
{
    while(true)
    {
        wait(frame_boundary_ltssm_tx.posedge_event());
        if(!init_done.read() && finished_sending_pkt)
            start_reinit.write(true);
        else if(!init_done.read() && !initialization_done)
            start_reinit.write(true);
        else 
            start_reinit.write(false);
    }
}

/// Singal for staging the retraining
void pl_top::check_stage_reinit()
{
    while(true)
    {
        wait(frame_boundary_ltssm_tx.negedge_event());
        if(start_reinit.read())
            stage_reinit.write(true);
        else
            stage_reinit.write(false);
    }
}

/// This block is responsible for processing the incoming
/// data on the ingress port/receiver side.
/// It does the reverse of the transmit side.
/// First decodes, then descrambles and then reframes
/// Forms the appropriate packet and then puts into into the TLM FIFO
/// for the DLL to consume the packet
void pl_top::ingress_process_packet() /// Receiver/Ingress port
{
    int i,j;
    int ingr_cnt = 0;
    int pkt_cnt = 0;
    int idl_count = 0,num_pad = 0;
    int lane_with_start = 0,lane_with_end = 0;
    int reset_lfsr_counter = 0;
    unsigned short descramble_lfsr[LINK_WIDTH];
    unsigned long word_val;
    RefPciePacket ingress_packet,send_packet;
    bool end_detected = false;
    bool stp_sdp_ended = true;
    bool start_ingr_packet[LINK_WIDTH],end_ingr_packet[LINK_WIDTH],start_ingr_pkt = false;
    bool first_time_after_L0 = true;
    bool reset_lfsr;
    bool com_detected = false;
    bool skp_ordered_set = false;
    bool last_frame_idle = false;
    bool back2back_pkt = false;
    bool this_frame_start_detected = false,this_frame_end_detected = false;
    map<int,int>::iterator iter1,iter2,iter3,iter4;

    //Receive Error types
    enum {RE_NONE, RE_PRD, RE_NRD, RE_FRA, RE_8b10b};
    int rcv_error = RE_NONE;

    while(true)
    {
        while(!end_detected) /// Read in the entire packet
        {
            /// Now its the turn of the deserializer to play its part
            /// Make sure the deserializer can see the internal PL layer frame_boundary/ref_clk properly
            wait(frm_boundary_deser.posedge_event());
            wait(link_clk.posedge_event());

            ingr_xtracted_data[ingr_cnt++] = deser_data0; /// First chunk and so on
            ingr_xtracted_data[ingr_cnt++] = deser_data1;
            ingr_xtracted_data[ingr_cnt++] = deser_data2;
            ingr_xtracted_data[ingr_cnt++] = deser_data3;
            ingr_xtracted_data[ingr_cnt++] = deser_data4;
            ingr_xtracted_data[ingr_cnt++] = deser_data5;
            ingr_xtracted_data[ingr_cnt++] = deser_data6;
            ingr_xtracted_data[ingr_cnt++] = deser_data7;
            ingr_xtracted_data[ingr_cnt++] = deser_data8;
            ingr_xtracted_data[ingr_cnt++] = deser_data9;
            /// Received LINK_WIDTH number of characters
            if((init_done_rx.read() && reset_l.read() && reset_por_l.read())) /// Wait until a packet is sent before handling over control to the LTSSM
            {
                for(j=0;j<LINK_WIDTH;j++)
                {
                    for(i=0;i<10;i++)
                    {
                        ingr_lane_data[j] = (ingr_xtracted_data[ingr_cnt+i-10].range(j,j),ingr_lane_data[j].range(9,1));
                    }
                    start_ingr_packet[j] = false;
                    end_ingr_packet[j] = false;
                    descrambler_i->start_scramble_reg[j] = true;
                    descramble_lfsr[j] = descrambler_i->get_lfsr(j); /// Descramble all the packets with this lfsr
                }
                for(i=0;i<LINK_WIDTH;i++) /// Form the packets
                {
                    ingr_decoded_data[pkt_cnt] = ingr_lane_data[i].range(0,9);
                    pkt_cnt++;
                    if(i % 4 == 0)
                    {
                        if(ingr_decoded_data[pkt_cnt-1] == 0x097 || ingr_decoded_data[pkt_cnt-1] == 0x368 || ingr_decoded_data[pkt_cnt-1] == 0x30a || ingr_decoded_data[pkt_cnt-1] == 0x0f5) /// STP/SDP
                        {
                            start_ingr_packet[i] = true;
                            start_ingr_pkt = true;
                            this_frame_start_detected = true;
                        }
                    }
                    if((i+1) % 4 == 0)
                    {
                        if(ingr_decoded_data[pkt_cnt-1] == 0x117 || ingr_decoded_data[pkt_cnt-1] == 0x2e8 || ingr_decoded_data[pkt_cnt-1] == 0x217 || ingr_decoded_data[pkt_cnt-1] == 0x1e8) /// END/EDB
                        {
                            end_ingr_packet[i] = true;
                            this_pkt_size = pkt_cnt;
                            end_detected = true;
                            this_frame_end_detected = true;
                        }
                    }
                    /// Decode the characters in this frame
                    /// ingr_decoded_data[pkt_cnt-1].concat_get_data(val,0);
                    word_val = ingr_decoded_data[pkt_cnt-1].get_word(0);
                    iter3 = map_table->spec_symbol_decode_map.find(word_val);
                    iter1 = map_table->data_decode_map.find(word_val);
                    iter4 = map_table->neg_spec_symbol_decode_map.find(word_val);
                    iter2 = map_table->neg_data_decode_map.find(word_val);
                    if(iter3 != map_table->spec_symbol_decode_map.end())
                    {
                        ingr_xtracted_byte[pkt_cnt-1] = iter3->second;
                        if(!curr_running_disp->get_rx_CRD(i).to_bool() && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Positive running Disparity Error in lane " << i;
                            rcv_error = RE_PRD;
                        }
                        else if(init_done_rx.read())
                        {
                            if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 1)
                                curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            else if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 0)
                                curr_running_disp->set_rx_CRD(i,sc_logic(0));
                        }
                        /// Check for STP/SDP framing error
                        if(iter3->second == STP || iter3->second == SDP)
                        {
                            if((i % 4 != 0) && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). STP/SDP should come on modulo 4 lanes";
                                rcv_error = RE_FRA;
                            }
                            if(last_frame_idle && i != 0 && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). STP/SDP must be in lane 0 after Logical Idle";
                                rcv_error = RE_FRA;
                            }
                            if(!stp_sdp_ended && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR : Framing Error (Lane= " << i << "). STP/SDP without previous END/EDB";
                                rcv_error = RE_FRA;
                            }
                            stp_sdp_ended = false;
                        }
                        else if(iter3->second == SKP)
                        {
                            LOG_DEBUG << "DEBUG : _PL_INGR_ : SKP Character received (Lane= " << i << ")";
                        }

                        /// Check for END/EDB framing error
                        else if(iter3->second == END || iter3->second == EDB)
                        {
                            if(((i+1) % 4) != 0 && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB should come in modulo 4 - 1 lanes";
                                rcv_error = RE_FRA;
                            }

                            if(i != LINK_WIDTH - 1) /// Make sure the next packet is a PAD/STP/SDP
                            {
                                if(ingr_lane_data[i+1].range(0,9) != 0x97 && ingr_lane_data[i+1].range(0,9) != 0x368 && ingr_lane_data[i+1].range(0,9) != 0x30a && ingr_lane_data[i+1].range(0,9) != 0xf5 && ingr_lane_data[i+1].range(0,9) != 0x3a8 && ingr_lane_data[i+1].range(0,9) != 0x57 && init_done_rx.read())
                                {
                                    LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB must be followed by PAD/STP/SDP";
                                    rcv_error = RE_FRA;
                                }
                            }
                            if(stp_sdp_ended && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB without previous STP/SDP";
                                rcv_error = RE_FRA;
                            }
                            stp_sdp_ended = true;
                        }
                        else if(iter3->second == COM && !stp_sdp_ended && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). Unexpected COM Character. Unterminated STP/SDP";
                            rcv_error = RE_FRA;
                        }

                        ingr_xtracted_byte_c[pkt_cnt-1] = true;
                    }
                    else if(iter4 != map_table->neg_spec_symbol_decode_map.end())
                    {
                        ingr_xtracted_byte[pkt_cnt-1] = iter4->second;
                        if(curr_running_disp->get_rx_CRD(i).to_bool() && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Negative running Disparity Error in lane " << i;
                            rcv_error = RE_NRD;
                        }
                        else if(init_done_rx.read())
                        {
                            if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 1)
                                curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            else if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 0)
                                curr_running_disp->set_rx_CRD(i,sc_logic(0));
                        }
                        if(iter4->second == STP || iter4->second == SDP)
                        {
                            if(i % 4 != 0 && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). STP/SDP should come on modulo 4 lanes";
                                rcv_error = RE_FRA;
                            }
                            if(last_frame_idle && i != 0 && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). STP/SDP must be in lane 0 after Logical Idle";
                                rcv_error = RE_FRA;
                            }
                            if(!stp_sdp_ended && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR : Framing Error (Lane= " << i << "). STP/SDP without previous END/EDB";
                                rcv_error = RE_FRA;
                            }
                            stp_sdp_ended = false;
                        }
                        else if(iter4->second == SKP)
                        {
                            LOG_DEBUG << "DEBUG : _PL_INGR_ : SKP Character received (Lane= " << i << ")";
                        }
                        /// Check for END/EDB framing error
                        else if(iter4->second == END || iter4->second == EDB)
                        {
                            if(((i+1) % 4) != 0 && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB should come in modulo 4 - 1 lanes";
                                rcv_error = RE_FRA;
                            }

                            if(i != LINK_WIDTH - 1) /// Make sure the next packet is a PAD/STP/SDP
                            {
                                if(ingr_lane_data[i+1].range(0,9) != 0x97 && ingr_lane_data[i+1].range(0,9) != 0x368 && ingr_lane_data[i+1].range(0,9) != 0x30a && ingr_lane_data[i+1].range(0,9) != 0xf5 && ingr_lane_data[i+1].range(0,9) != 0x3a8 && ingr_lane_data[i+1].range(0,9) != 0x57 && init_done_rx.read())
                                {
                                    LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB must be followed by PAD/STP/SDP";
                                    rcv_error = RE_FRA;
                                }
                            }
                            if(stp_sdp_ended && init_done_rx.read())
                            {
                                LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). END/EDB without previous STP/SDP";
                                rcv_error = RE_FRA;
                            }
                            stp_sdp_ended = true;
                        }
                        else if(iter4->second == COM && !stp_sdp_ended && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Framing Error (Lane= " << i << "). Unexpected COM. Unterminated STP/SDP";
                            rcv_error = RE_FRA;
                        }
                        ingr_xtracted_byte_c[pkt_cnt-1] = true;
                    }
                    else if(iter1 != map_table->data_decode_map.end())
                    {
                        ingr_xtracted_byte[pkt_cnt-1] = iter1->second;
                        ingr_xtracted_byte_c[pkt_cnt-1] = false;
                        if(!curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) != 2 && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Positive running Disparity Error in lane " << i;
                            rcv_error = RE_PRD;
                        }
                        else if(init_done_rx.read())
                        {
                            if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 1)
                                curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            else if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 0)
                                curr_running_disp->set_rx_CRD(i,sc_logic(0));
                        }
                    }
                    else if(iter2 != map_table->neg_data_decode_map.end())
                    {
                        ingr_xtracted_byte[pkt_cnt-1] = iter2->second;
                        ingr_xtracted_byte_c[pkt_cnt-1] = false;
                        if(curr_running_disp->get_rx_CRD(i).to_bool() && curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) != 2 && init_done_rx.read())
                        {
                            LOG_WARNING << "WARNING : _PL_INGR_ : Negative running Disparity Error in lane " << i;
                            rcv_error = RE_NRD;
                        }
                        else if(init_done_rx.read())
                        {
                            if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 1)
                                curr_running_disp->set_rx_CRD(i,sc_logic(1));
                            else if(curr_running_disp->calculate_disparity(ingr_decoded_data[pkt_cnt-1],0) == 0)
                                curr_running_disp->set_rx_CRD(i,sc_logic(0));
                        }
                    }
                    else if(!first_time_after_L0 && init_done_rx.read())
                    {
                        ingr_xtracted_byte[pkt_cnt-1] = "xxxxxxxx"; 
                        ingr_xtracted_byte_c[pkt_cnt-1] = false;
                        LOG_WARNING << "WARNING : _PL_INGR_ : 8b/10b Decode Error (Lane= " << i << ")";
                        rcv_error = RE_8b10b;
                    }

                    if(ingr_xtracted_byte_c[pkt_cnt - 1] && ingr_xtracted_byte[pkt_cnt - 1] == K28_5) /// COM Reset
                    {
                        reset_lfsr_counter++;
                    }
                    if(ingr_xtracted_byte_c[pkt_cnt-1] && (ingr_xtracted_byte[pkt_cnt - 1] == SKP) && com_detected) /// This is a SKP ordered set
                    {
                        skp_ordered_set = true;
                        LOG_DEBUG << "DEBUG : _PL_INGR_ : SKP Ordered Set Received (Lane= " << i << ")";
                    }
                    else
                    {
                        skp_ordered_set = false;
                    }
                    /// Dont forward the LFSR
                    /// Also the LFSR should not be forwarded for the entire SKP ordered set
                    if(ingr_xtracted_byte_c[pkt_cnt-1] && (ingr_xtracted_byte[pkt_cnt-1] == PAD) && (end_detected == 1)) /// Dont send PAD after END/EDB to DLL
                    {
                        num_pad++;
                    }
                    if(!ingr_xtracted_byte_c[pkt_cnt-1])
                    {
                        word_val = ingr_xtracted_byte[pkt_cnt-1].get_word(0);
                        ingr_xtracted_byte[pkt_cnt-1] = descrambler_i->scramble_descramble(word_val,0,0,i);
                        if(ingr_xtracted_byte[pkt_cnt-1] == 0x00)
                            idl_count++;
                        descrambler_i->set_lfsr(descramble_lfsr[i],i);
                    }
                }
                if(reset_lfsr_counter == LINK_WIDTH)
                    reset_lfsr = true;
                else
                    reset_lfsr = false;
                reset_lfsr_counter = 0;

                if(idl_count == 8) /// An IDLE Frame
                {
                    last_frame_idle = 1;
                    idl_count = 0;
                }
                else
                {
                    last_frame_idle = 0;
                }
                if(reset_lfsr)
                {
                    descrambler_i->scramble_descramble_all(K28_5,0,1);
                    reset_lfsr = false;
                    com_detected = true; /// Could be the start of an ordered set
                }
                else if(skp_ordered_set)
                    descrambler_i->scramble_descramble_all(SKP,0,1);
                else if(!first_time_after_L0) /// Dont forward the LFSR immediatly after coming out of the LTSSM control
                {
                    com_detected = false;
                    for(int lane_num = 0; lane_num < LINK_WIDTH; lane_num++){
                        word_val = ingr_xtracted_byte[(pkt_cnt-1)-(LINK_WIDTH-1-lane_num)].get_word(0);
                        if(ingr_xtracted_byte_c[(pkt_cnt-1)-(LINK_WIDTH-1-lane_num)])
                            descrambler_i->scramble_descramble(word_val,0,1,lane_num);
                        else
                            descrambler_i->scramble_descramble(word_val,0,0,lane_num);
                    }
                }

                if(first_time_after_L0) first_time_after_L0 = false;

                for(int lane_scram = 0; lane_scram < LINK_WIDTH; lane_scram++)
                    descrambler_i->start_scramble_reg[lane_scram] = false;
                /// pkt_cnt is always a multiple of LINK_WIDTH
                /// the END might be encountered at a boundary of LINK_WIDTH or somewhere in between
                /// Lets check for that
            }
            else
            {
                ingr_cnt = 0;
                pkt_cnt = 0;
                num_pad = 0;
                first_time_after_L0 = true;
                rcv_error = RE_NONE;
                stp_sdp_ended = true;
            }
            /// Checks for LINK_WIDTH byte DLLP or IDL interleaved TLP or back to back TLP
            for(i=0;i<LINK_WIDTH;i++)
            {
                if(start_ingr_packet[i])
                {
                    /// This lane has STP/SDP
                    lane_with_start = i;
                }
                if(end_ingr_packet[i])
                {
                    lane_with_end = i;
                }
            }
            if(this_frame_start_detected && this_frame_end_detected) /// Test for Back to Back packets without interleaving
            {
                if(lane_with_start > lane_with_end)
                    back2back_pkt = true;
                else
                    back2back_pkt = false;

                lane_with_start = 0;
                lane_with_end = 0;
            }
            if(!start_ingr_pkt && rcv_error==RE_NONE)
            {
                pkt_cnt = 0;
                this_pkt_size = 0;
                ingr_cnt = 0;
                num_pad = 0;
            }
            
            this_frame_start_detected = false;
            this_frame_end_detected = false;
        }
        /// If it comes out of this loop, it means it received an END/EDB symbol
        /// Its fair to assume that a start must have come 

        /// Now just form the packets
        ingress_packet = new pciePacket(this_pkt_size);

        for(i=0;i<this_pkt_size;i++)
        {
            ingress_packet->modify_byte(i,ingr_xtracted_byte[i]);
        }
        global_ingress_packet = ingress_packet;
        /// Notify the producer that the packet has been produced
        /// Before I reset everything to 0 I need to check for back2back
        if(back2back_pkt)
        {
            for(i=this_pkt_size,j=0;i<pkt_cnt;i++,j++)
            {
                ingr_xtracted_byte[j] = ingr_xtracted_byte[i]; /// Prepare for the next packet
                ingr_xtracted_byte_c[j] = ingr_xtracted_byte_c[i];
            }
            start_ingr_pkt = true;
            pkt_cnt = j;
            end_detected = 0;
            num_pad = 0;
            ingr_cnt = 0;
        }
        else
        {
            pkt_cnt = 0;
            end_detected = 0;
            start_ingr_pkt = false;
            num_pad = 0;
            ingr_cnt = 0;
        }
        back2back_pkt = false;

        /// The Producer code now begins
        send_packet = global_ingress_packet;

        if(send_packet->get_size() != 0)
        {
            switch(rcv_error){
                case RE_NONE:
                    send_packet->set_control(DLLP_ACK);
                    break;
                case RE_FRA:
                    send_packet->set_control(DLLP_NAK_FRAMING);
                    break;
                case RE_8b10b:
                case RE_PRD:
                case RE_NRD:
                    send_packet->set_control(DLLP_NAK);
                    break;

            }
            pl_dll_out.send_packet(send_packet);
        }
        LOG_DEBUG << "PL_TOP: Resetting rcv_error to RE_NONE";
        rcv_error=RE_NONE;
    }
}
