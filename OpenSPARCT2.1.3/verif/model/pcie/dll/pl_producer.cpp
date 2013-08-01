// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pl_producer.cpp
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
#ifndef DLL_pl_producer_h
#define DLL_pl_producer_h

#include "dll_top.hpp"

namespace pcie {

    /** This function produces DLLPs for PL **/
    void dll_top::pl_dllp_producer()
    {
        LOG_DEBUG<<"DLL: pl_dllp_producer begins...";
        try{  
            RefPciePacket send_packet;

            while(true)
            {
                if ( !queue_DLLP.empty() &&  !ltssm_L0s )
                {
                    //cout << sc_time_stamp() << "---- DLLP Queue Size: " << queue_DLLP.size() << endl;
                    send_packet = queue_DLLP.front();
                    queue_DLLP.pop();
                    while(true){
                        if((send_packet->get_byte(0)==DLLP_ACK || send_packet->get_byte(0)== DLLP_NAK) && queue_DLLP.size()>=1){
                            if((queue_DLLP.front())->get_byte(0)==DLLP_ACK || (queue_DLLP.front())->get_byte(0)== DLLP_NAK){
                                //cout << "Aggregating DLLPs..." << endl;
                                send_packet = queue_DLLP.front();
                                queue_DLLP.pop();
                            }
                            else break;
                        }
                        else break;
                    }
                    LOG_DEBUG << "_DLL_: Sent packet to PL with PktId= " << send_packet->getPacketId() << " Size= " << send_packet->get_size() ;
                    //cout << sc_time_stamp() << "\t\t\t\t\t| DLL: Sent DLLP " << send_packet->getPacketId() << " to PL." << endl;
                    dll_pl_dllp_out.send_packet(send_packet);
                }
                WAIT(eventPlPktRdy);
                wait(sc_time(25,SC_NS),reset_ev);//Added
            }// while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of pl_dllp_producer";
        }


    }// pl_producer


    /** This function produces TLPs for PL **/
    void dll_top::pl_tlp_producer()
    {
        LOG_DEBUG<<"DLL: pl_tlp_producer begins...";
        try{
            RefPciePacket send_packet;
            sc_uint<12> rx_pkt_seq_num;
            sc_uint<8> byte_seq_num;

            while(true)
            {
                if ( !queue_TLP.empty() && !ltssm_L0s && FC_Init_Complete && Flag_FC1 && Flag_FC2)
                {
                    send_packet = queue_TLP.front();

                    sent_first_stp_pkt=true; 
                    queue_TLP.pop();
                    LOG_DEBUG << "_DLL_: Sent packet to PL with PktId= " << send_packet->getPacketId() << " Size= " << send_packet->get_size() ;
                    //cout << sc_time_stamp() << "\t\t\t\t\t| DLL: Sent TLP " << send_packet->getPacketId() << " to PL." << endl;
                    dll_pl_tlp_out.send_packet(send_packet);
                    buffer_add(send_packet);
                    //replay_buffer.push(send_packet);
                    byte_seq_num= send_packet->get_byte(1);
                    rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
                    byte_seq_num= send_packet->get_byte(2);
                    rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);
                    LOG_DEBUG << "REPLAY_BUFFER: Added packet " << rx_pkt_seq_num ;
                }
                WAIT(eventPlPktRdy|fc_init2_complete_ev);
            }// while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of pl_tlp_producer";
        }	  
    }// pl_producer
}

#endif
