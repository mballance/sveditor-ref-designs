// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pl_consumer.cpp
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
#include "dll_top.hpp"

namespace pcie {

    /** This function gets packets from PL and processes them **/
    void dll_top::pl_consumer()
    {
        LOG_DEBUG<<"DLL: pl_consumer begins...";
        try {
            RefPciePacket rx_pkt;
            RefPciePacket tx_ack_nack_pkt;
            int i,rx_pkt_size;
            sc_uint<16> rx_pkt_dllp_crc,tx_pkt_dllp_crc;
            sc_uint<12> rx_pkt_seq_num;
            sc_uint<8>  byte_seq_num;
            sc_uint<12>  tx_pkt_seq_num;
            sc_uint<12>  check_seq_num;
            sc_uint<32>  rx_pkt_calc_lcrc;
            sc_uint<8>   HdrFC;
            sc_uint<12>  DataFC;
            sc_uint<16>  dllp_crc_unmapped;
            sc_uint<8>   SDP_byte1;
            sc_uint<8>   SDP_byte2;
            sc_uint<8>   SDP_byte3;
            sc_uint<8>   SDP_byte4;
            sc_uint<8>   SDP_byte5;
            sc_uint<8>   SDP_byte6;
            sc_uint<64>  tlu_ecl_hw_reg,tlu_ecc_hw_reg ;

            time_last_ack_nak_received=0;

            while (true) {
                //Receive packet from PL
                pl_dll_in.get_packet(rx_pkt);
                //rx_pkt->display_packet();

                if(rx_pkt->get_byte(0) == STP && rx_pkt->get_control() != DLLP_NAK && rx_pkt->get_control() != DLLP_NAK_FRAMING){
                    //cout << sc_time_stamp() << " DLL: Received TLP " << rx_pkt->getPacketId() << " from PL." << endl;
                    rx_pkt_size  = rx_pkt->get_size();
                    byte_seq_num = rx_pkt->get_byte(1);
                    rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
                    byte_seq_num = rx_pkt->get_byte(2);
                    rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);
                    //rx_pkt->pl2dll_display_stp_packet();

                    rx_pkt_calc_lcrc=calculate_lcrc(rx_pkt,1,rx_pkt_size-5);

                    if((rx_pkt->get_byte(rx_pkt_size - 2) == rx_pkt_calc_lcrc.range(7,0))   && 
                       (rx_pkt->get_byte(rx_pkt_size - 3) == rx_pkt_calc_lcrc.range(15,8))  &&
                       (rx_pkt->get_byte(rx_pkt_size - 4) == rx_pkt_calc_lcrc.range(23,16)) && 
                       (rx_pkt->get_byte(rx_pkt_size - 5) == rx_pkt_calc_lcrc.range(31,24))) 
                    {
                        LCRC_MATCHED = 1;
                    }
                    else {
                        LCRC_MATCHED = 0;
                        LOG_DEBUG << "_DLL_ : LCRC MIS-MATCH => Calculated: " << rx_pkt_calc_lcrc << " Received: " << rx_pkt->get_byte(rx_pkt_size-5) << rx_pkt->get_byte(rx_pkt_size-4) << rx_pkt->get_byte(rx_pkt_size-3) << rx_pkt->get_byte(rx_pkt_size-2);

                        sc_uint<64> peu_lnk_bit_err_cnt1 = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR);
                        sc_uint<8> btc = peu_lnk_bit_err_cnt1.range(23,16);
                        if(btc!=ALLONES) 
                        {
                            btc++;
                            peu_lnk_bit_err_cnt1.range(23,16) = btc;
                            csr_port.write_csr_mask(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR,peu_lnk_bit_err_cnt1,PEU_CSR_LNK_BIT_ERR_CNT_1_READ_MASK); 
                        }
                    }

                    if((rx_pkt->get_byte(rx_pkt_size-1)==EDB)){
                        LOG_DEBUG <<" _DLL_ : LCRC matches, but EDB is present. Discarding and sending NAK...";
                        EDB_DETECTED = 1;
                    }
                    else
                        EDB_DETECTED = 0;

                    LOG_DEBUG << "_DLL_ : rx_pkt_seq_num: " << rx_pkt_seq_num << " NEXT_RECEIVE_SEQ: " << NEXT_RECEIVE_SEQ ;

                    DO_NAK_SCHEDULED_CHECK = 0;
                    check_seq_num          = (NEXT_RECEIVE_SEQ - rx_pkt_seq_num ); //% (sc_uint<12>)(4096) ;

                    tx_ack_nack_pkt =  new pciePacket(6);
                    if(EDB_DETECTED){
                        if((rx_pkt->get_byte( rx_pkt_size - 2) == ~rx_pkt_calc_lcrc.range(7,0)) &&
                           (rx_pkt->get_byte( rx_pkt_size - 3) == ~rx_pkt_calc_lcrc.range(15,8)) &&
                           (rx_pkt->get_byte( rx_pkt_size - 4) == ~rx_pkt_calc_lcrc.range(23,16)) &&
                           (rx_pkt->get_byte( rx_pkt_size - 5) == ~rx_pkt_calc_lcrc.range(31,24)))
                        {
                            // Discard tlp
                            LOG_DEBUG << "EDB_DETECTED, LCRC LOGICAL NOT, seqnum: " << rx_pkt_seq_num ;
                            continue;
                        }
                        else {
                            DO_NAK_SCHEDULED_CHECK = 1;
                            LOG_DEBUG << "EDB_DETECTED, LCRC UNINVERTED, seqnum: " << rx_pkt_seq_num ;
                        }
                    }
                    else if(!LCRC_MATCHED){
                        DO_NAK_SCHEDULED_CHECK = 1;
                        LOG_DEBUG << "LCRC DID NOT MATCH.  seqnum: " << rx_pkt_seq_num ;
                    }
                    else if(LCRC_MATCHED && !EDB_DETECTED && rx_pkt->get_control() != DLLP_NAK) {
                        LOG_DEBUG << "LCRC OK and NO EDB FOUND. seqnum: " << rx_pkt_seq_num ;

                        if(rx_pkt_seq_num == NEXT_RECEIVE_SEQ ){
                            LOG_DEBUG << "rx_pkt_seq_num == NEXT_RECEIVE_SEQ  seqnum " << rx_pkt_seq_num ;

                            NEXT_RECEIVE_SEQ++;
                            queueTL.push(rx_pkt);
                            eventTlPktRdy.notify();

                            tx_pkt_seq_num=NEXT_RECEIVE_SEQ-1;
                            tx_ack_nack_pkt->set_control(SDP_CONTROL);                
                            tx_ack_nack_pkt->modify_byte(0,DLLP_ACK);
                            tx_ack_nack_pkt->modify_byte(1,DATA0);
                            tx_ack_nack_pkt->modify_byte(2,tx_pkt_seq_num.range(11,8));
                            tx_ack_nack_pkt->modify_byte(3,tx_pkt_seq_num.range(7,0));
                            tx_pkt_dllp_crc=calculate_dllp_crc(tx_ack_nack_pkt,0,4);
                            tx_ack_nack_pkt->modify_byte(4,tx_pkt_dllp_crc.range(15,8));
                            tx_ack_nack_pkt->modify_byte(5,tx_pkt_dllp_crc.range(7,0));
                            //tx_ack_nack_pkt->pl2dll_display_sdp_packet(1); 

                            queue_DLLP.push(tx_ack_nack_pkt);
                            eventPlPktRdy.notify();

                            NAK_SCHEDULED=0;
                            LOG_DEBUG << "CLEAR NAK SCHEDULED. seqnum: " << rx_pkt_seq_num ;
                            DO_NAK_SCHEDULED_CHECK = 0;
                            LOG_DEBUG << "Send ACK - rx_pkt_seq_num == NEXT_RECEIVE_SEQ " << rx_pkt_seq_num ;
                        }  
                        //else if ( rx_pkt_seq_num <  NEXT_RECEIVE_SEQ )
                        else {
                            if( ((NEXT_RECEIVE_SEQ-rx_pkt_seq_num)%4096) <= 2048 ) { 
                                LOG_DEBUG << "(NEXT_RECEIVE_SEQ - rx_pkt_seq_num) mod 4096 smaller then 2048 seqnum " << rx_pkt_seq_num ;
                                NAK_SCHEDULED=0; //Why was this not there?
                                DO_NAK_SCHEDULED_CHECK = 0;

                                tx_pkt_seq_num=NEXT_RECEIVE_SEQ-1;
                                tx_ack_nack_pkt->set_control(SDP_CONTROL);                
                                tx_ack_nack_pkt->modify_byte(0,DLLP_ACK);
                                tx_ack_nack_pkt->modify_byte(1,DATA0);
                                tx_ack_nack_pkt->modify_byte(2,tx_pkt_seq_num.range(11,8));
                                tx_ack_nack_pkt->modify_byte(3,tx_pkt_seq_num.range(7,0));
                                tx_pkt_dllp_crc=calculate_dllp_crc(tx_ack_nack_pkt,0,4);
                                tx_ack_nack_pkt->modify_byte(4,tx_pkt_dllp_crc.range(15,8));
                                tx_ack_nack_pkt->modify_byte(5,tx_pkt_dllp_crc.range(7,0));
                                //tx_ack_nack_pkt->pl2dll_display_sdp_packet(1); 
                                queue_DLLP.push(tx_ack_nack_pkt);
                                eventPlPktRdy.notify();
                                LOG_DEBUG<<"Send ACK - rx_pkt_seq_num < NEXT_RECEIVE_SEQ " << rx_pkt_seq_num ;
                            }
                            else {
                                LOG_DEBUG<<"TLP Out of Sequence: Recvd: "<<rx_pkt_seq_num<<" NEXT_RECEIVE_SEQ: "<<NEXT_RECEIVE_SEQ<<" value: "<<check_seq_num ;
                                DO_NAK_SCHEDULED_CHECK = 1;
                            }
                        }
                    }
                }
                if(DO_NAK_SCHEDULED_CHECK)
                {
                    LOG_DEBUG << "RAS: DO_NAK_SCHEDULED_CHECK seqnum " << rx_pkt_seq_num ;
                    if ( !NAK_SCHEDULED/* || rx_pkt->get_control() == DLLP_NAK*/)
                    {
                        LOG_DEBUG << "RAS: NAK SCHEDULED is CLEAR seqnum " << rx_pkt_seq_num ;

                        write_error_csr(CE,6,38,"btp");
                        ///////////////////////////////////////////
                        tx_ack_nack_pkt->set_control(SDP_CONTROL);                
                        tx_pkt_seq_num=NEXT_RECEIVE_SEQ-1;
                        tx_ack_nack_pkt->modify_byte(0,DLLP_NAK); 
                        tx_ack_nack_pkt->modify_byte(1,DATA0);
                        tx_ack_nack_pkt->modify_byte(2,tx_pkt_seq_num.range(11,8));
                        tx_ack_nack_pkt->modify_byte(3,tx_pkt_seq_num.range(7,0));

                        tx_pkt_dllp_crc=calculate_dllp_crc(tx_ack_nack_pkt,0,4);
                        tx_ack_nack_pkt->modify_byte(4,tx_pkt_dllp_crc.range(15,8));
                        tx_ack_nack_pkt->modify_byte(5,tx_pkt_dllp_crc.range(7,0));
                        //tx_ack_nack_pkt->pl2dll_display_sdp_packet(1); 
                        queue_DLLP.push(tx_ack_nack_pkt);
                        eventPlPktRdy.notify();
                        LOG_DEBUG << " Send NAK - LCRC Mis-match and/or EDB caused by seqnum " << rx_pkt_seq_num ;

                        NAK_SCHEDULED = 1;
                        DO_NAK_SCHEDULED_CHECK = 0; //WHY was this not there?
                    }
                }
                else{
                    if(!NAK_SCHEDULED && rx_pkt->get_byte(0) == STP && rx_pkt->get_control() == DLLP_NAK){
                    
                        write_error_csr(CE,0,32,"re");
                        byte_seq_num = rx_pkt->get_byte(1);
                        rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
                        byte_seq_num = rx_pkt->get_byte(2);
                        rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);
                        
                        LOG_WARNING << "DLL: Receive Error, seqnum: " << rx_pkt_seq_num << ", scheduling NAK... NEXT_RECEIVE_SEQ: "<<NEXT_RECEIVE_SEQ;
                        
                        tx_ack_nack_pkt->set_control(SDP_CONTROL);                
                        tx_pkt_seq_num=NEXT_RECEIVE_SEQ-1;
                        tx_ack_nack_pkt->modify_byte(0,DLLP_NAK); 
                        tx_ack_nack_pkt->modify_byte(1,DATA0);
                        tx_ack_nack_pkt->modify_byte(2,tx_pkt_seq_num.range(11,8));
                        tx_ack_nack_pkt->modify_byte(3,tx_pkt_seq_num.range(7,0));

                        tx_pkt_dllp_crc=calculate_dllp_crc(tx_ack_nack_pkt,0,4);
                        tx_ack_nack_pkt->modify_byte(4,tx_pkt_dllp_crc.range(15,8));
                        tx_ack_nack_pkt->modify_byte(5,tx_pkt_dllp_crc.range(7,0));
                        //tx_ack_nack_pkt->pl2dll_display_sdp_packet(1); 
                        queue_DLLP.push(tx_ack_nack_pkt);
                        eventPlPktRdy.notify();
                        NAK_SCHEDULED = 1;
                    }
                    else if(!NAK_SCHEDULED && rx_pkt->get_byte(0) == STP && rx_pkt->get_control() == DLLP_NAK_FRAMING){
//rx_pkt_size  = rx_pkt->get_size();
//rx_pkt_calc_lcrc=calculate_lcrc(rx_pkt,1,rx_pkt_size-5);                    
                        write_error_csr(OE,11,11,"lin");
                        byte_seq_num = rx_pkt->get_byte(1);
                        rx_pkt_seq_num.range(11,8)=byte_seq_num.range(3,0);
                        byte_seq_num = rx_pkt->get_byte(2);
                        rx_pkt_seq_num.range(7,0)=byte_seq_num.range(7,0);
                        
                        LOG_WARNING << "DLL: Framing Receive Error, seqnum: " << rx_pkt_seq_num << ", scheduling NAK... NEXT_RECEIVE_SEQ: "<<NEXT_RECEIVE_SEQ;
                        
                        tx_ack_nack_pkt->set_control(SDP_CONTROL);                
                        tx_pkt_seq_num=NEXT_RECEIVE_SEQ-1;
                        tx_ack_nack_pkt->modify_byte(0,DLLP_NAK); 
                        tx_ack_nack_pkt->modify_byte(1,DATA0);
                        tx_ack_nack_pkt->modify_byte(2,tx_pkt_seq_num.range(11,8));
                        tx_ack_nack_pkt->modify_byte(3,tx_pkt_seq_num.range(7,0));

                        tx_pkt_dllp_crc=calculate_dllp_crc(tx_ack_nack_pkt,0,4);
                        tx_ack_nack_pkt->modify_byte(4,tx_pkt_dllp_crc.range(15,8));
                        tx_ack_nack_pkt->modify_byte(5,tx_pkt_dllp_crc.range(7,0));
                        //tx_ack_nack_pkt->pl2dll_display_sdp_packet(1); 
                        queue_DLLP.push(tx_ack_nack_pkt);
                        eventPlPktRdy.notify();
                        NAK_SCHEDULED = 1;
                    }
                }


                // DLLP Processing
                if ( rx_pkt->get_byte(0) == SDP )
                {
                    if((rx_pkt->get_byte(1) == DLLP_ACK )||(rx_pkt->get_byte(1) == DLLP_NAK))
                        time_last_ack_nak_received = dll_timer; 

                    //cout << sc_time_stamp() << " DLL: Received DLLP " << rx_pkt->getPacketId() << " from PL." << endl;
                    //rx_pkt->pl2dll_display_sdp_packet(0);

                    if ( (rx_pkt->get_byte(1) != DLLP_ACK ) &&
                            (rx_pkt->get_byte(1) != DLLP_NAK ) &&
                            (rx_pkt->get_byte(1) != DLLP_PM_ENTER_L1 ) &&
                            (rx_pkt->get_byte(1) != DLLP_PM_ENTER_L23 ) &&
                            (rx_pkt->get_byte(1) != DLLP_PM_ACT_SR_L1 ) &&
                            (rx_pkt->get_byte(1) != DLLP_PM_REQ_ACK ) &&
                            (rx_pkt->get_byte(1) != DLLP_VENDOR ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC1_P_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC1_NP_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC1_CPL_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC2_P_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC2_NP_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_INITFC2_CPL_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_UPDATEFC_P_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_UPDATEFC_NP_NOVC ) &&
                            (rx_pkt->get_byte(1).range(7,3) != DLLP_UPDATEFC_CPL_NOVC ) 
                       )
                    {
                        write_error_csr2(OE,2,2,"xxx");
                    }
                    else if(rx_pkt->get_byte(rx_pkt->get_size() - 1) == EDB){
                        LOG_DEBUG << "SDP PKT with EDB";
                    }
                    else {
                        SDP_byte1=rx_pkt->get_byte(1);
                        SDP_byte2=rx_pkt->get_byte(2);
                        SDP_byte3=rx_pkt->get_byte(3);
                        SDP_byte4=rx_pkt->get_byte(4);
                        SDP_byte5=rx_pkt->get_byte(5);
                        SDP_byte6=rx_pkt->get_byte(6);

                        if ( SDP_byte1.range(7,4) == 0 )
                        {
                            rx_pkt_seq_num.range(11,8) = SDP_byte3.range(3,0);
                            rx_pkt_seq_num.range(7,0)  = SDP_byte4.range(7,0);
                        }

                        if ( SDP_byte1 == DLLP_NAK ) {
                            rx_pkt_seq_num.range(11,8) = SDP_byte3.range(3,0);
                            rx_pkt_seq_num.range(7,0)  = SDP_byte4.range(7,0);
                            LOG_DEBUG << "REPLAY_BUFFER: Received NAK with seqid = " << rx_pkt_seq_num ;
                            //buffer_replay_single(rx_pkt_seq_num);
                            buffer_replay(rx_pkt_seq_num);
                            ACKD_SEQ=rx_pkt_seq_num; 
                        }

                        // if ACK, then remove the corresponding TLP entry in the retry buffer
                        if ( SDP_byte1 == DATA0  ) {   
                            rx_pkt_seq_num.range(11,8)=SDP_byte3.range(3,0);
                            rx_pkt_seq_num.range(7,0)=SDP_byte4.range(7,0);
                            LOG_DEBUG << "REPLAY_BUFFER: Received ACK with seqid = " << rx_pkt_seq_num ;
                            buffer_remove(rx_pkt_seq_num);
                            REPLAY_NUM=0;
                            REPLAY_TIMER=0;
                            ACKD_SEQ=rx_pkt_seq_num; 
                        }

                        rx_pkt_dllp_crc.range(15,8)=SDP_byte5.range(7,0);
                        rx_pkt_dllp_crc.range(7,0)=SDP_byte6.range(7,0);

                        if ( rx_pkt_dllp_crc != calculate_dllp_crc(rx_pkt,1,5) ) {
                            LOG_DEBUG << " _DLL_: DLLP CRC MIS-MATCH : Calculated DLLP CRC "  << calculate_dllp_crc(rx_pkt,1,5)  << " Received DLLP CRC" <<  rx_pkt_dllp_crc ;
                            write_error_csr(CE,7,39,"bdp");
                            sc_uint<64> peu_lnk_bit_err_cnt1 = csr_port.read_csr(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR);
                            sc_uint<8> bdc = peu_lnk_bit_err_cnt1.range(31,24);
                            if(bdc!=ALLONES) {
                                bdc++;
                                peu_lnk_bit_err_cnt1.range(31,24) = bdc;
                                csr_port.write_csr_mask(PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR,peu_lnk_bit_err_cnt1,PEU_CSR_LNK_BIT_ERR_CNT_1_READ_MASK); 
                            }
                            continue;
                        }
                        else {
                            HdrFC.range(7,2)=SDP_byte2.range(5,0);
                            HdrFC.range(1,0)=SDP_byte3.range(7,6);

                            DataFC.range(11,8)=SDP_byte3.range(3,0);
                            DataFC.range(7,0)=SDP_byte4;

                            sc_uint<64> peu_diag_csr = csr_port.read_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR);

                            tlu_ecc_hw_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
                            tlu_ecl_hw_reg = csr_port.read_csr(PEU_CSR_A_TLU_ECL_HW_ADDR);
                            LOG_DEBUG << "ECL: " << tlu_ecl_hw_reg << " ECC: " << tlu_ecc_hw_reg ;

                            sc_uint<64> old_ecc = tlu_ecc_hw_reg;

                            switch(SDP_byte1.range(7,4)){ 
                                case 4: // init fc1 p
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(60,60) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(60,60) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(60,60) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(60,60) = 0;

                                    tlu_ecl_hw_reg.range(19,12) = HdrFC;
                                    tlu_ecl_hw_reg.range(11,0) = DataFC;

                                    LOG_DEBUG << " initfc1P ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc1P ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;
                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 5: // init fc1  np
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(61,61) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(61,61) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(61,61) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(61,61) = 0;

                                    tlu_ecl_hw_reg.range(39,32) = HdrFC;
                                    tlu_ecl_hw_reg.range(31,20) = DataFC;

                                    LOG_DEBUG << " initfc1NP ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc1NP ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;
                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 6: // init fc1 cpl                      
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(62,62) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(62,62) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(62,62) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(62,62) = 0;

                                    tlu_ecl_hw_reg.range(59,52) = HdrFC;
                                    tlu_ecl_hw_reg.range(51,40) = DataFC;

                                    LOG_DEBUG << " initfc1CMPL ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc1CMPL ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;
                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 12: // init fc2 p
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(60,60) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(60,60) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(60,60) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(60,60) = 0;

                                    tlu_ecl_hw_reg.range(19,12) = HdrFC;
                                    tlu_ecl_hw_reg.range(11,0) = DataFC;

                                    LOG_DEBUG << " initfc2P ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc2P ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;
                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 13: // init fc2  np
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(61,61) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(61,61) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(61,61) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(61,61) = 0;

                                    tlu_ecl_hw_reg.range(39,32) = HdrFC;
                                    tlu_ecl_hw_reg.range(31,20) = DataFC;

                                    LOG_DEBUG << " initfc2NP ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc2NP ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;
                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 14: // init fc2 cpl                      
                                    if ( (HdrFC== 0 ) )
                                        tlu_ecc_hw_reg.range(62,62) = 1;
                                    else      
                                        tlu_ecc_hw_reg.range(62,62) = 0;

                                    if ( (DataFC== 0 ) )
                                        tlu_ecl_hw_reg.range(62,62) = 1;
                                    else      
                                        tlu_ecl_hw_reg.range(62,62) = 0;

                                    tlu_ecl_hw_reg.range(59,52) = HdrFC;
                                    tlu_ecl_hw_reg.range(51,40) = DataFC;

                                    LOG_DEBUG << " initfc2CMPL ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                    LOG_DEBUG << " initfc2CMPL ABOUT TO UPDATE ECC with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecc_hw_reg " << tlu_ecc_hw_reg;

                                    csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                                    if(old_ecc!=tlu_ecc_hw_reg) csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR,tlu_ecc_hw_reg);
                                    break;

                                case 8: // update p
                                    if( (HdrFC!=0 && tlu_ecc_hw_reg.range(60,60)==1) || 
                                            (DataFC!=0 && tlu_ecl_hw_reg.range(60,60)==1)) {
                                        //Infinite credit update has arrived
                                        LOG_DEBUG << "Warning: P Infinite credit update error...";
                                        LOG_DEBUG << "HdrFC= " << HdrFC << " DataFC= " << DataFC << " PHI= " << tlu_ecc_hw_reg.range(60,60) << " PDI= " << tlu_ecl_hw_reg.range(60,60);

                                        write_error_csr(UE,13,45,"fcp");
                                        //                               } else if(((HdrFC-tlu_ecl_hw_reg(19,12))%256)>128 || ((DataFC-tlu_ecl_hw_reg(11,0))%4096)>2048){
                                        //                                   LOG_DEBUG << "Warning: UpdateFC_P has HdrFC>128 or DataFC>2048. HdrFC: " << HdrFC << " DataFC: " << DataFC ;
                                        //                                   write_error_csr(UE,13,45,"fcp");
                            } else {
                                tlu_ecl_hw_reg.range(19,12) = HdrFC;
                                tlu_ecl_hw_reg.range(11,0) = DataFC;
                                LOG_DEBUG << " P UpdateFC ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                            }
                            break;
                                case 9: // update np
                            if( (HdrFC!=0 && tlu_ecc_hw_reg.range(61,61)==1) || 
                                    (DataFC!=0 && tlu_ecl_hw_reg.range(61,61)==1)) {
                                //Infinite credit update has arrived
                                LOG_DEBUG << "Warning: NP Infinite credit update error...";
                                LOG_DEBUG << "HdrFC= " << HdrFC << " DataFC= " << DataFC << " NHI= " << tlu_ecc_hw_reg.range(61,61) << " NDI= " << tlu_ecl_hw_reg.range(61,61);
                                write_error_csr(UE,13,45,"fcp");
                                //                               } else if(((HdrFC-tlu_ecl_hw_reg(39,32))%256)>128 || ((DataFC-tlu_ecl_hw_reg(31,20))%4096)>2048){
                                //                                   LOG_DEBUG << "Warning: UpdateFC_NP has HdrFC>128 or DataFC>2048. HdrFC: " << HdrFC << " DataFC: " << DataFC ;
                                //                                   write_error_csr(UE,13,45,"fcp");
                            } else {
                                tlu_ecl_hw_reg.range(39,32) = HdrFC;
                                tlu_ecl_hw_reg.range(31,20) = DataFC;
                                LOG_DEBUG << " NP UpdateFC ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                            }
                            break;
                                case 10: // update cpl                      
                            if( (HdrFC!=0 && tlu_ecc_hw_reg.range(62,62)==1) || 
                                    (DataFC!=0 && tlu_ecl_hw_reg.range(62,62)==1)) {
                                //Infinite credit update has arrived
                                LOG_DEBUG << "Warning: CMPL Infinite credit update error...";
                                LOG_DEBUG << "HdrFC= " << HdrFC << " DataFC= " << DataFC << " CHI= " << tlu_ecc_hw_reg.range(62,62) << " CDI= " << tlu_ecl_hw_reg.range(62,62);
                                write_error_csr(UE,13,45,"fcp");

                                //                               } else if((((sc_uint<8>)HdrFC-tlu_ecl_hw_reg(59,52))%256)>128 || (((sc_uint<12>)DataFC-tlu_ecl_hw_reg(51,40))%4096)>2048){
                                //                                   LOG_DEBUG << "Warning: UpdateFC_CMPL has HdrFC>128 or DataFC>2048. HdrFC: " << HdrFC << " DataFC: " << DataFC ;
                                //                                   write_error_csr(UE,13,45,"fcp");
                            } else {
                                tlu_ecl_hw_reg.range(59,52) = HdrFC;
                                tlu_ecl_hw_reg.range(51,40) = DataFC;
                                LOG_DEBUG << " CMPL UpdateFC ABOUT TO UPDATE ECL with HDR " << HdrFC << " DataFC " << DataFC << " tlu_ecl_hw_reg " << tlu_ecl_hw_reg;
                                csr_port.write_csr(PEU_CSR_A_TLU_ECL_HW_ADDR,tlu_ecl_hw_reg);
                            } 
                            break;
                                default: //Added to capture the unsupport DLLPs
                            LOG_DEBUG << " _DLLP_ : Unsupported DLLP recvd. Drop and ignore.";
                            break;
                            } 
                        } // if(CRC matches)
                    } // if DLLP_INVALID
                }// if(SDP)

                // Check FCINIT1 packets for vc0
                if (  rx_pkt->get_byte(1) == DLLP_INITFC1_P )
                {
                    LOG_DEBUG << "_DLL_ : ------------ Received initfc1_p from PL";
                    Flag_FC1_P = 1;       
                    fc_init1_complete_ev.notify();
                }
                if (  rx_pkt->get_byte(1) == DLLP_INITFC1_NP )
                {
                    LOG_DEBUG << "_DLL_: ------------ Received initfc1_np from PL" ;
                    Flag_FC1_NP = 1;       
                }
                if (  rx_pkt->get_byte(1) == DLLP_INITFC1_CPL )
                {
                    LOG_DEBUG << "_DLL_ : ------------ Received initfc1_cpl from PL";
                    Flag_FC1_CPL = 1;       
                }

                if ( (Flag_FC1_P & Flag_FC1_NP & Flag_FC1_CPL) && !Flag_FC1 ){
                    Flag_FC1 = 1;
                }

                if ( Flag_FC1 && // we are in fcinit2
                        ( ( rx_pkt->get_byte(1) == DLLP_INITFC2_P ) || // any dllp packet sets fI2
                          ( rx_pkt->get_byte(1) == DLLP_INITFC2_NP ) ||
                          ( rx_pkt->get_byte(1) == DLLP_INITFC2_CPL ) ||
                          ( rx_pkt->get_byte(1) == DLLP_UPDATEFC_CPL ) || // any updatefc sets fI2
                          ( rx_pkt->get_byte(1) == DLLP_UPDATEFC_NP ) || 
                          ( rx_pkt->get_byte(1) == DLLP_UPDATEFC_P ) ) )
                {
                    Flag_FC2 = 1;
                    fc_init2_complete_ev.notify();
                }
            }//end while
        }//end try
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of pl_consumer";
        }
    }


    void dll_top::write_error_csr(uint8 err_type, uint8 primary, uint8 secondary, char field_name[3]){
        sc_uint<64> orig_csr_val;
        sc_uint<64> new_csr_val=0;

        LOG_DEBUG << "Setting err bit: " << field_name;

        switch(err_type){
            case OE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating OE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case UE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating UE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case CE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating CE CSR (orig val: " << orig_csr_val << ")";
                     break;
            default: LOG_ERROR << "Warning: undefined error type!";
                     return;
        }

        if(orig_csr_val.range(primary,primary)!=1)
            new_csr_val.range(primary,primary)=1;
        else if(orig_csr_val.range(secondary,secondary)!=1)
            new_csr_val.range(secondary,secondary)=1;
        else
            LOG_DEBUG << "Warning: Both PRIMARY and SECONDARY of " << field_name << "are set.";

        switch(err_type){
            case OE: csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating OE CSR (new val : " << new_csr_val << ")";
                     break;
            case UE: csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating UE CSR (new val : " << new_csr_val << ")";
                     break;
            case CE: csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating CE CSR (new val : " << new_csr_val << ")";
                     break;
        }
        return;
    }//end write_csr_error

    void dll_top::write_error_csr2(uint8 err_type, uint8 primary, uint8 secondary, char field_name[3]){
        sc_uint<64> orig_csr_val;
        sc_uint<64> new_csr_val=0;

        LOG_DEBUG << "Setting err bit: " << field_name;

        switch(err_type){
            case OE: orig_csr_val = csr_port.read_csr( PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR );
                     LOG_DEBUG << "Updating OE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case UE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating UE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case CE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating CE CSR (orig val: " << orig_csr_val << ")";
                     break;
            default: LOG_ERROR << "Warning: undefined error type!";
                     return;
        }

        if(orig_csr_val.range(primary,primary)!=1)
            new_csr_val.range(primary,primary)=1;
        else if(orig_csr_val.range(secondary,secondary)!=1)
            new_csr_val.range(secondary,secondary)=1;
        else
            LOG_DEBUG << "Warning: Both PRIMARY and SECONDARY of " << field_name << "are set.";

        switch(err_type){
            case OE: csr_port.write_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating OE CSR (new val : " << new_csr_val << ")";
                     break;
            case UE: csr_port.write_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating UE CSR (new val : " << new_csr_val << ")";
                     break;
            case CE: csr_port.write_csr(PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating CE CSR (new val : " << new_csr_val << ")";
                     break;
        }
        return;
    }//end write_csr_error
}
