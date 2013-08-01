// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: replay_buffer.cpp
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
#ifndef DLL_replay_buffer_h
#define DLL_replay_buffer_h

#include "dll_top.hpp"


namespace pcie {

    /** This function adds packets to the replay buffer **/
    void dll_top::buffer_add( RefPciePacket packet){

        replay_buffer.push(packet);
        if ( packet->get_size() < replay_buffer_size )
            replay_buffer_size-=packet->get_size();
        else 
            replay_buffer_size=0;

        LOG_DEBUG << "REPLAY_BUFFER: Added packet " << packet->getPacketId() << ". Current replay buffer size:" << replay_buffer_size ;
    }

    /** This function removes elements from the replay buffer **/
    //void dll_top::buffer_remove( RefPciePacket packet){
    void dll_top::buffer_remove(sc_uint<12> seq_num){
        if(in_replay_buffer(seq_num)){
            sc_uint<12> rx_pkt_seq_num;
            sc_uint<8> byte_seq_num;
            USE_NAMESPACE(std)queue<RefPciePacket> tmp_replay_buffer2;
            RefPciePacket list_packet;
            bool acked=true;
            while(!replay_buffer.empty()){
                list_packet = replay_buffer.front();
                replay_buffer.pop();

                byte_seq_num= list_packet->get_byte(1);
                rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
                byte_seq_num= list_packet->get_byte(2);
                rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);

                if(seq_num==rx_pkt_seq_num)
                {
                    //replay_buffer_size+= packet->get_size();
                    LOG_DEBUG << "REPLAY_BUFFER: 1removed   " << rx_pkt_seq_num;
                    acked=false;
                }
                else if(!acked){
                    tmp_replay_buffer2.push(list_packet);
                }
                else{
                    //replay_buffer_size+= packet->get_size();
                    LOG_DEBUG << "REPLAY_BUFFER: 2removed   " << rx_pkt_seq_num;
                }
            }// while
            replay_buffer = tmp_replay_buffer2;
        }
    }

    /** This function replays all entries in the buffer **/
    void dll_top::buffer_replay(sc_uint<12> seq_num){
        dll_pl_tlp_out.purge_channel();
        if(REPLAY_NUM==3){
            LOG_WARNING << "DLL: REPLAY_BUFFER: REPLAY_NUM ROLLOVER. Need to Retrain Link..." ;
            //notify an event
            //Setting retrain bit in Link Ctrl CSR
            sc_uint<64> lnk_ctrl_reg = csr_port.read_csr(PEU_CSR_A_LNK_CTL_HW_ADDR);
            lnk_ctrl_reg(5,5)=1;
            csr_port.write_csr(PEU_CSR_A_LNK_CTL_HW_ADDR,lnk_ctrl_reg);
            dll_pl_tlp_out.purge_channel();
        }
        REPLAY_NUM++;
        REPLAY_TIMER=0;

        if(seq_num>ACKD_SEQ){
            LOG_DEBUG<<"Fwd progress in seq num ack";
            REPLAY_NUM=0;
        }

        sc_uint<12> rx_pkt_seq_num;
        sc_uint<8>  byte_seq_num;
        RefPciePacket list_packet;
        USE_NAMESPACE(std)queue<RefPciePacket> tmp_replay_buffer2;

        if(in_replay_buffer(seq_num)){
            bool replay = false;
            while (!replay_buffer.empty())
            {
                // get packet from replay buffer
                list_packet = replay_buffer.front();
                replay_buffer.pop();
                //Extract seq num
                byte_seq_num               = list_packet->get_byte(1);
                rx_pkt_seq_num.range(11,8) = byte_seq_num.range(3,0);
                byte_seq_num               = list_packet->get_byte(2);
                rx_pkt_seq_num.range(7,0)  = byte_seq_num.range(7,0);
                if(rx_pkt_seq_num==seq_num){
                    replay=true;
                }
                else if(replay){
                    LOG_DEBUG << "REPLAY_BUFFER: Replay packet " << rx_pkt_seq_num ;
                    // send packet to pl to be retried
                    dll_pl_tlp_out.send_packet(list_packet);
                    // copy packet to tmp list
                    tmp_replay_buffer2.push(list_packet);
                }
            }// while
            replay_buffer = tmp_replay_buffer2;
        }
        else{
            LOG_DEBUG << "REPLAY_BUFFER: TLP not found. Replaying entire replay buffer..." ;
            //A NAK for a TLP not in the replay buffer
            //The whole replay buffer has to be replayed...
            while (!replay_buffer.empty())
            {
                // get packet from replay buffer
                list_packet = replay_buffer.front();
                replay_buffer.pop();
                //Extract seq num
                byte_seq_num               = list_packet->get_byte(1);
                rx_pkt_seq_num.range(11,8) = byte_seq_num.range(3,0);
                byte_seq_num               = list_packet->get_byte(2);
                rx_pkt_seq_num.range(7,0)  = byte_seq_num.range(7,0);
                LOG_DEBUG << "REPLAY_BUFFER: Replay packet " << rx_pkt_seq_num ;
                // send packet to pl to be retried
                dll_pl_tlp_out.send_packet(list_packet);
                // copy packet to tmp list
                tmp_replay_buffer2.push(list_packet);
            }// while
            replay_buffer = tmp_replay_buffer2;
        }
    }

    /** This function replays a single element from the replay buffer **/
    void dll_top::buffer_replay_single( sc_uint<12> seq_id){
        sc_uint<12> rx_pkt_seq_num;
        sc_uint<8> byte_seq_num;

        //RefPciePacket list_packet;
        RefPciePacket list_packet;
        USE_NAMESPACE(std)queue<RefPciePacket> tmp_replay_buffer2;

        while ( !replay_buffer.empty() )
        {
            // get packet from replay buffer
            list_packet = replay_buffer.front();
            replay_buffer.pop();
            // send packet to pl to be retried
            byte_seq_num= list_packet->get_byte(1);
            rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
            byte_seq_num= list_packet->get_byte(2);
            rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);
            if ( rx_pkt_seq_num == seq_id ) {
                dll_pl_dllp_out.send_packet(list_packet);
                LOG_DEBUG << "REPLAY_BUFFER: SINGLE Replay packet " << rx_pkt_seq_num ;
            }
            // copy packet to tmp list
            tmp_replay_buffer2.push(list_packet);
        }// while
        replay_buffer = tmp_replay_buffer2;
    }

    bool dll_top::in_replay_buffer(sc_uint<12> seq_num)
    {
        bool is_in_buffer = false;
        sc_uint<12> rx_pkt_seq_num;
        sc_uint<8>  byte_seq_num;

        //RefPciePacket list_packet;
        RefPciePacket list_packet;
        USE_NAMESPACE(std)queue<RefPciePacket> tmp_replay_buffer2;
        while (!replay_buffer.empty())
        {
            // get packet from replay buffer
            list_packet = replay_buffer.front();
            replay_buffer.pop();
            //Extract seq num
            byte_seq_num               = list_packet->get_byte(1);
            rx_pkt_seq_num.range(11,8) = byte_seq_num.range(3,0);
            byte_seq_num               = list_packet->get_byte(2);
            rx_pkt_seq_num.range(7,0)  = byte_seq_num.range(7,0);
            if(rx_pkt_seq_num==seq_num){
                is_in_buffer=true;
            }
            tmp_replay_buffer2.push(list_packet);
        }// while
        replay_buffer = tmp_replay_buffer2;

        return is_in_buffer;
    }

}
#endif
