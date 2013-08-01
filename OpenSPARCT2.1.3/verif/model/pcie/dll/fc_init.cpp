// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_init.cpp
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
#include "pcie_common/config.hpp"
#include "pcie_common/packetRefCount.hpp"
#include "pcie_common/packet.hpp"
#include "pcie_common/basePacket.hpp"
#include "pcie_common/logger.hpp"

namespace pcie {

    /** This function sends initialization packets to EP **/

    void dll_top::fc_init(){
        LOG_DEBUG<<"DLL: fc_init begins...";
        try{
            RefPciePacket send_packet1; 
            RefPciePacket send_packet2; 
            RefPciePacket send_packet3; 
            RefPciePacket send_packet4; 
            RefPciePacket send_packet5; 
            RefPciePacket send_packet6; 
            sc_uint<8> data,dllp_byte1,dllp_byte2,dllp_byte3;	
            sc_uint<16> dllp_crc_mapped;
            sc_uint<64> tlu_ici_hw_reg,tlu_ecl_hw_reg;
            sc_uint<8>  nhc_reg,chc_reg,phc_reg;
            sc_uint<12> ndc_reg,cdc_reg,pdc_reg;

            /// Main Loop
            while ( true) 
            {
                /// Wait for core status register to be updated
                WAIT(csr_core_status_ev);
                csr_data_reg = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);

                tlu_ici_hw_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);

                nhc_reg=tlu_ici_hw_reg.range(39,32);
                chc_reg=tlu_ici_hw_reg.range(59,52);
                phc_reg=tlu_ici_hw_reg.range(19,12);
                ndc_reg=tlu_ici_hw_reg.range(31,20);
                cdc_reg=tlu_ici_hw_reg.range(51,40);
                pdc_reg=tlu_ici_hw_reg.range(11,0) ;

                if ( (csr_data_reg.range(48,44) == 16) & ~FC_INIT1_Complete )
                {
                    LOG_DEBUG << "_DLL_: Sending FCINIT1 DLLPS ";

                    wait(100,SC_NS);
                    //wait(700,SC_NS);

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=phc_reg.range(7,2);

                    dllp_byte2.range(7,6)=phc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=pdc_reg.range(11,8);

                    dllp_byte3 = pdc_reg.range(7,0);

                    send_packet1 =  new pciePacket(6);
                    send_packet1->modify_byte(0,DLLP_INITFC1_P); // initfc1_p vc=0
                    send_packet1->modify_byte(1,dllp_byte1);
                    send_packet1->modify_byte(2,dllp_byte2);
                    send_packet1->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet1,0,4);
                    send_packet1->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet1->modify_byte(5,dllp_crc_mapped.range(7,0));

                    send_packet1->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet1);
                    //send_packet1->dll2pl_display_sdp_packet(1);


                    wait(5,SC_NS);

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=nhc_reg.range(7,2);

                    dllp_byte2.range(7,6)=nhc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=ndc_reg.range(11,8);

                    dllp_byte3 = ndc_reg.range(7,0);

                    send_packet2 =  new pciePacket(6);
                    send_packet2->modify_byte(0,DLLP_INITFC1_NP);
                    send_packet2->modify_byte(1,dllp_byte1);
                    send_packet2->modify_byte(2,dllp_byte2);
                    send_packet2->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet2,0,4);
                    send_packet2->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet2->modify_byte(5,dllp_crc_mapped.range(7,0));
                    send_packet2->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet2);
                    //send_packet2->dll2pl_display_sdp_packet(1);

                    wait(5,SC_NS);

                    LOG_DEBUG << " FCINIT1: Sending InitFC1_Cpl " ;

                    send_packet3 =  new pciePacket(6);

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=chc_reg.range(7,2);

                    dllp_byte2.range(7,6)=chc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=cdc_reg.range(11,8);

                    dllp_byte3 = cdc_reg.range(7,0);

                    send_packet3->modify_byte(0,DLLP_INITFC1_CPL);
                    send_packet3->modify_byte(1,dllp_byte1);
                    send_packet3->modify_byte(2,dllp_byte2);
                    send_packet3->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet3,0,4);
                    send_packet3->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet3->modify_byte(5,dllp_crc_mapped.range(7,0));

                    send_packet3->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet3);
                    //send_packet3->dll2pl_display_sdp_packet(1);

                    wait(5,SC_NS);

                    FC_INIT1_Complete=1;
                }

                if ( (csr_data_reg.range(48,44) == 16) & ~FC_INIT2_Complete & FC_INIT1_Complete )
                {
                    LOG_DEBUG << "_DLL_: Sending FCINIT2 DLLPS " ;

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=phc_reg.range(7,2);

                    dllp_byte2.range(7,6)=phc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=pdc_reg.range(11,8);

                    dllp_byte3 = pdc_reg.range(7,0);

                    send_packet4 =  new pciePacket(6);
                    send_packet4->modify_byte(0,DLLP_INITFC2_P);
                    send_packet4->modify_byte(1,dllp_byte1);
                    send_packet4->modify_byte(2,dllp_byte2);
                    send_packet4->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet4,0,4);
                    send_packet4->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet4->modify_byte(5,dllp_crc_mapped.range(7,0));
                    send_packet4->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet4);
                    //send_packet4->dll2pl_display_sdp_packet(1);

                    wait(5,SC_NS);

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=nhc_reg.range(7,2);

                    dllp_byte2.range(7,6)=nhc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=ndc_reg.range(11,8);

                    dllp_byte3 = ndc_reg.range(7,0);

                    send_packet5 =  new pciePacket(6);

                    send_packet5->modify_byte(0,DLLP_INITFC2_NP);
                    send_packet5->modify_byte(1,dllp_byte1);
                    send_packet5->modify_byte(2,dllp_byte2);
                    send_packet5->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet5,0,4);
                    send_packet5->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet5->modify_byte(5,dllp_crc_mapped.range(7,0));
                    send_packet5->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet5);
                    //send_packet5->dll2pl_display_sdp_packet(1);

                    wait(5,SC_NS);

                    dllp_byte1.range(7,6)=0;
                    dllp_byte1.range(5,0)=chc_reg.range(7,2);

                    dllp_byte2.range(7,6)=chc_reg.range(1,0);
                    dllp_byte2.range(5,4)=0;
                    dllp_byte2.range(3,0)=cdc_reg.range(11,8);

                    dllp_byte3 = cdc_reg.range(7,0);

                    send_packet6 =  new pciePacket(6);

                    send_packet6->modify_byte(0,DLLP_INITFC2_CPL);
                    send_packet6->modify_byte(1,dllp_byte1);
                    send_packet6->modify_byte(2,dllp_byte2);
                    send_packet6->modify_byte(3,dllp_byte3);

                    dllp_crc_mapped=calculate_dllp_crc(send_packet6,0,4);
                    send_packet6->modify_byte(4,dllp_crc_mapped.range(15,8));
                    send_packet6->modify_byte(5,dllp_crc_mapped.range(7,0));
                    send_packet6->set_control(SDP_CONTROL);

                    dll_pl_dllp_out.send_packet(send_packet6);
                    //send_packet6->dll2pl_display_sdp_packet(1);

                    FC_INIT2_Complete=1;
                    wait(5,SC_NS);
                }

                if ( FC_INIT1_Complete & FC_INIT2_Complete )
                {
                    LOG_DEBUG << "_DLL_: FC_Init_Complete is true! \n";
                    FC_Init_Complete =1;
                    break;
                }
            } // while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of fc_init";
        }
    } // fc_init 


    /** This function sends update packets to EP **/

    void dll_top::fc_update(){
        LOG_DEBUG<<"DLL: fc_update begins...";
        try{
            RefPciePacket send_packet1; 
            RefPciePacket send_packet2; 
            RefPciePacket send_packet3; 

            sc_uint<8> data,dllp_byte1,dllp_byte2,dllp_byte3;	
            sc_uint<16> dllp_crc_mapped;
            sc_uint<8>  nhc_reg,chc_reg,phc_reg;
            sc_uint<12> ndc_reg,cdc_reg,pdc_reg;

            sc_uint<8>  prev_nhc_reg,prev_chc_reg,prev_phc_reg;
            sc_uint<12> prev_ndc_reg,prev_cdc_reg,prev_pdc_reg;

            sc_uint<64> tlu_ica_reg; 
            sc_uint<64> tlu_ici_reg; 
            sc_uint<64> tlu_icr_reg; 

            tlu_ica_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
            tlu_ici_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);
            tlu_icr_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);

            prev_chc_reg=tlu_ica_reg.range(59,52);
            prev_cdc_reg=tlu_ica_reg.range(51,40);
            prev_nhc_reg=tlu_ica_reg.range(39,32);
            prev_ndc_reg=tlu_ica_reg.range(31,20) ;
            prev_phc_reg=tlu_ica_reg.range(19,12) ;
            prev_pdc_reg=tlu_ica_reg.range(11,0) ;
            chc_reg=tlu_ica_reg.range(59,52);
            cdc_reg=tlu_ica_reg.range(51,40);
            nhc_reg=tlu_ica_reg.range(39,32);
            ndc_reg=tlu_ica_reg.range(31,20) ;
            phc_reg=tlu_ica_reg.range(19,12) ;
            pdc_reg=tlu_ica_reg.range(11,0) ;

            while(true) 
            {
                //if(!POR_RESET) wait(sc_time(25,SC_NS),credit_consumed_ev,reset_ev);
                if(!POR_RESET) wait(sc_time(400,SC_NS),credit_consumed_ev|reset_ev);
                if(POR_RESET) throw sc_exception();

                if(FC_Init_Complete && (csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR)).range(48,44)==16){

                    if(STOP_TIMER){
                        if(!POR_RESET) wait(sc_time(125,SC_NS),reset_ev);
                        if(POR_RESET) throw sc_exception();
                        tlu_icr_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);
                    }

                    tlu_ica_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);

                    chc_reg=tlu_ica_reg.range(59,52);
                    cdc_reg=tlu_ica_reg.range(51,40);
                    nhc_reg=tlu_ica_reg.range(39,32);
                    ndc_reg=tlu_ica_reg.range(31,20) ;
                    phc_reg=tlu_ica_reg.range(19,12) ;
                    pdc_reg=tlu_ica_reg.range(11,0) ;

                    if( chc_reg!=prev_chc_reg || 
                        cdc_reg!=prev_cdc_reg || 
                        (STOP_TIMER && ( (chc_reg!=0 && chc_reg==tlu_icr_reg.range(59,52)) || 
                                         (cdc_reg!=0 && cdc_reg==tlu_icr_reg.range(51,40)) )) 
                      ){   
                        
                        LOG_DEBUG<<"== DLL: Sending UpdateFC_CPL...";

                        if(STOP_TIMER){
                            if(!chc_reg==0) chc_reg += tlu_ici_reg.range(59,52);
                            if(!cdc_reg==0) cdc_reg += tlu_ici_reg.range(51,40);
                        }

                        dllp_byte1.range(7,6)=0;
                        dllp_byte1.range(5,0)=chc_reg.range(7,2);

                        dllp_byte2.range(7,6)=chc_reg.range(1,0);
                        dllp_byte2.range(5,4)=0;
                        dllp_byte2.range(3,0)=cdc_reg.range(11,8);

                        dllp_byte3 = cdc_reg.range(7,0);

                        send_packet3 =  new pciePacket(6);
                        send_packet3->modify_byte(0,DLLP_UPDATEFC_CPL);
                        send_packet3->modify_byte(1,dllp_byte1);
                        send_packet3->modify_byte(2,dllp_byte2);
                        send_packet3->modify_byte(3,dllp_byte3);

                        dllp_crc_mapped=calculate_dllp_crc(send_packet3,0,4);
                        send_packet3->modify_byte(4,dllp_crc_mapped.range(15,8));
                        send_packet3->modify_byte(5,dllp_crc_mapped.range(7,0));

                        send_packet3->set_control(SDP_CONTROL);

                        dll_pl_dllp_out.send_packet(send_packet3);
                        //send_packet3->dll2pl_display_sdp_packet(1);
                    }

                    if(nhc_reg!=prev_nhc_reg || ndc_reg!=prev_ndc_reg || 
                        (STOP_TIMER && ((nhc_reg!=0 && nhc_reg==tlu_icr_reg.range(39,32)) || 
                                        (ndc_reg!=0 && ndc_reg==tlu_icr_reg.range(31,20)) ) )){
                        
                        LOG_DEBUG<<"== DLL: Sending UpdateFC_NP...";

                        if(STOP_TIMER){
                            if(!nhc_reg==0) nhc_reg = nhc_reg + tlu_ici_reg.range(39,32);
                            if(!ndc_reg==0) ndc_reg = ndc_reg + tlu_ici_reg.range(31,20);
                        }

                        dllp_byte1.range(7,6)=0;
                        dllp_byte1.range(5,0)=nhc_reg.range(7,2);

                        dllp_byte2.range(7,6)=nhc_reg.range(1,0);
                        dllp_byte2.range(5,4)=0;
                        dllp_byte2.range(3,0)=ndc_reg.range(11,8);

                        dllp_byte3 = ndc_reg.range(7,0);

                        send_packet2 =  new pciePacket(6);
                        send_packet2->modify_byte(0,DLLP_UPDATEFC_NP);
                        send_packet2->modify_byte(1,dllp_byte1);
                        send_packet2->modify_byte(2,dllp_byte2);
                        send_packet2->modify_byte(3,dllp_byte3);

                        dllp_crc_mapped=calculate_dllp_crc(send_packet2,0,4);
                        send_packet2->modify_byte(4,dllp_crc_mapped.range(15,8));
                        send_packet2->modify_byte(5,dllp_crc_mapped.range(7,0));
                        send_packet2->set_control(SDP_CONTROL);

                        dll_pl_dllp_out.send_packet(send_packet2);
                        //send_packet2->dll2pl_display_sdp_packet(1);
                    }

                    if(phc_reg!=prev_phc_reg || pdc_reg!=prev_pdc_reg || 
                        (STOP_TIMER && ((phc_reg!=0 && phc_reg==tlu_icr_reg.range(19,12)) || 
                                        ( pdc_reg!=0 &&pdc_reg==tlu_icr_reg.range(11,0)) ) )){  

                        LOG_DEBUG<<"==== DLL: Sending UpdateFC_P ====";
                        if(STOP_TIMER){
                            if(!phc_reg==0) phc_reg = phc_reg + tlu_ici_reg.range(19,12);
                            if(!pdc_reg==0) pdc_reg = pdc_reg + tlu_ici_reg.range(11,0);
                        }

                        dllp_byte1.range(7,6)=0;
                        dllp_byte1.range(5,0)=phc_reg.range(7,2);

                        dllp_byte2.range(7,6)=phc_reg.range(1,0);
                        dllp_byte2.range(5,4)=0;
                        dllp_byte2.range(3,0)=pdc_reg.range(11,8);

                        dllp_byte3 = pdc_reg.range(7,0);

                        send_packet1 =  new pciePacket(6);
                        send_packet1->modify_byte(0,DLLP_UPDATEFC_P);
                        send_packet1->modify_byte(1,dllp_byte1);
                        send_packet1->modify_byte(2,dllp_byte2);
                        send_packet1->modify_byte(3,dllp_byte3);

                        dllp_crc_mapped=calculate_dllp_crc(send_packet1,0,4);
                        send_packet1->modify_byte(4,dllp_crc_mapped.range(15,8));
                        send_packet1->modify_byte(5,dllp_crc_mapped.range(7,0));
                        send_packet1->set_control(SDP_CONTROL);

                        dll_pl_dllp_out.send_packet(send_packet1);
                        //send_packet1->dll2pl_display_sdp_packet(1);
                    }
                    if(STOP_TIMER){
                        tlu_ica_reg.range(59,52)=chc_reg;
                        tlu_ica_reg.range(51,40)=cdc_reg;
                        tlu_ica_reg.range(19,12)=phc_reg;
                        tlu_ica_reg.range(11,0)=pdc_reg;
                        tlu_ica_reg.range(39,32)=nhc_reg;
                        tlu_ica_reg.range(31,20)=ndc_reg;
                        csr_port.write_csr(PEU_CSR_A_TLU_ICA_HW_ADDR,tlu_ica_reg);
                    }

                    prev_chc_reg=chc_reg;
                    prev_cdc_reg=cdc_reg;
                    prev_nhc_reg=nhc_reg;
                    prev_ndc_reg=ndc_reg;
                    prev_phc_reg=phc_reg;
                    prev_pdc_reg=pdc_reg;
                } // if
            } // while
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of fc_update";
        }
    } //fc_update

    sc_uint<14> dll_top::get_mps(){
        sc_uint<14> mps;
        sc_uint<64> dev_ctl;
        sc_uint<3>  dev_mps;
        dev_ctl = csr_port.read_csr(PEU_CSR_A_DEV_CTL_HW_ADDR);
        dev_mps = dev_ctl(7,5);
        switch(dev_mps){
            case 0: return 128;
            case 1: return 256;
            case 2: return 512;
            case 3: return 1024;
            case 4: return 2048;
            case 5: return 4096;
            default: LOG_ERROR<<"ERROR: Reserved mps field value in PEU Device Control CSR";
                     return 0; //cause simulation to end with divide by zero
        }
    }//end get_mps


    void dll_top::credit_checker(){
        sc_event  ica_event, icr_event;
        csr_port.set_notify_event(PEU_CSR_A_TLU_ICA_HW_ADDR, &ica_event);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ICR_HW_ADDR, &icr_event);
        sc_uint<64> tlu_ica_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
        sc_uint<64> tlu_icr_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);

        while(1){
            wait(ica_event|icr_event);
            tlu_ica_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
            tlu_icr_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICR_HW_ADDR);
            if( (tlu_ica_reg.range(59,52)!=0 && tlu_ica_reg.range(59,52)==tlu_icr_reg.range(59,52)) ||
                (tlu_ica_reg.range(51,40)!=0 && tlu_ica_reg.range(51,40)==tlu_icr_reg.range(51,40)) ||
                (tlu_ica_reg.range(39,32)!=0 && tlu_ica_reg.range(39,32)==tlu_icr_reg.range(39,32)) ||
                (tlu_ica_reg.range(31,20)!=0 && tlu_ica_reg.range(31,20)==tlu_icr_reg.range(31,20)) ||
                (tlu_ica_reg.range(19,12)!=0 && tlu_ica_reg.range(19,12)==tlu_icr_reg.range(19,12)) ||
                (tlu_ica_reg.range(11,0)!=0  && tlu_ica_reg.range(11,0)==tlu_icr_reg.range(11,0))    )
                credit_consumed_ev.notify();
        }

    
    }
    
}
