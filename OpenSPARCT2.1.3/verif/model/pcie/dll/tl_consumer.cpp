// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tl_consumer.cpp
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
#ifndef DLL_tl_consumer_h
#define DLL_tl_consumer_h

#include "dll_top.hpp"

namespace pcie {

    /** This function processes packets from TL **/
    void dll_top::tl_consumer()
    {
        LOG_DEBUG<<"DLL: tl_consumer begins...";
        try{
            RefPciePacket receive_packet;
            int i,packet_size;
            sc_uint<32> lcrc_mapped;

            while (true) {

                if ( ltssm_L0s ) // || replay_buffer_size <= 0 )
                {
                    // Cease accepting TLPs from TL until the equation is not satisfied
                }
                else
                {
                    // Receive packet from TL
                    tl_dll_in.get_packet(receive_packet);
                    // Display packet
                    LOG_DEBUG << " _DLL_: Received packet from TL with PktId= " << receive_packet->getPacketId() << " Size= " <<  receive_packet->get_size(); 
                    //cout << sc_time_stamp() << "\t\t\t\t\t| DLL: Received TLP " << receive_packet->getPacketId() << " from ETL." << endl;
                    // Apply NEXT_TRANSMIT_SEQ to TLP
                    prepend_byte0.range(7,4) = 0;
                    prepend_byte0.range(3,0) = NEXT_TRANSMIT_SEQ.range(11,8); 

                    prepend_byte1 = NEXT_TRANSMIT_SEQ.range(7,0); 

                    receive_packet->modify_byte(1,prepend_byte0);
                    receive_packet->modify_byte(2,prepend_byte1);

                    lcrc_mapped=calculate_lcrc(receive_packet,1,receive_packet->get_size() - 4);

                    packet_size=receive_packet->get_size();

                    if(receive_packet->get_control() != 0x12){
                        receive_packet->set_control(0xa);
                        receive_packet->modify_byte(packet_size-4,lcrc_mapped.range(31,24));
                        receive_packet->modify_byte(packet_size-3,lcrc_mapped.range(23,16));
                        receive_packet->modify_byte(packet_size-2,lcrc_mapped.range(15,8));
                        receive_packet->modify_byte(packet_size-1,lcrc_mapped.range(7,0));
                    }
                    else{
                        LOG_DEBUG << "NULLifying PACKET";
                        receive_packet->modify_byte(packet_size-4,~lcrc_mapped.range(31,24));
                        receive_packet->modify_byte(packet_size-3,~lcrc_mapped.range(23,16));
                        receive_packet->modify_byte(packet_size-2,~lcrc_mapped.range(15,8));
                        receive_packet->modify_byte(packet_size-1,~lcrc_mapped.range(7,0));
                    }

                    queue_TLP.push(receive_packet);
                    eventPlPktRdy.notify();
                    // Update registers 
                    NEXT_TRANSMIT_SEQ++;

                    // Do FC init checks
                    if ( Flag_FC1 && !Flag_FC2 &&
                            (receive_packet->get_byte(0) == STP ) )
                    {
                        Flag_FC2=1;
                        LOG_DEBUG << "_DLL_:FI1 and FI2 flags are set! ";
                    }// if
                }// else
            }// while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of tl_consumer";
        }
    } // tl_consumer


    /** This function polls LTSSM state **/
    void dll_top::ltssm_state_check()
    {
        LOG_DEBUG<<"DLL: ltssm_state_check begins...";
        try{

            while ( true)
            {
                WAIT(csr_core_status_ev);
                ltssm_state_reg = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);
                if ( ltssm_state_reg.range(48,44) == 17 ) // ILUPEU_LTSSM_L0S
                    ltssm_L0s = 1;
                else
                    ltssm_L0s = 0;
            } // while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of ltss_state_check";
        }
    } // ltssm_state_check 
}
#endif
