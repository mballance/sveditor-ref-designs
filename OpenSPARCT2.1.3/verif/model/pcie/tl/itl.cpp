// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: itl.cpp
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
#include "itl.hpp"
#include "pcie_common/logger.hpp"

namespace pcie {

    /** 
     *  This thread receives TLPs from the DLL and enqueues them into fc_q for credit processing.
     *  Post processing, this TLP is forwarded to the ILU interface for delivery.
     */
    void itl::execute(void){
        LOG_INFO << "ITL: execute begin...";

        RefPciePacket next_pkt;
        try{
            while(1){
                d_in_port.get_packet(next_pkt);
                LOG_INFO << "ITL: Get Packet " << next_pkt->getPacketId() << "\n";
                //cout << sc_time_stamp() << " ITL: Recieved TLP " << next_pkt->getPacketId() << " from DLL." << endl;
                fc_q.push(next_pkt);
                inPkt_ev.notify();

                WAIT(fcComp_ev);

                if(!DROP){
                    //cout << sc_time_stamp() << " ITL: Sending TLP " << next_pkt->getPacketId() << " to ILU_INTF." << endl;
                    d_out_port.send_packet(next_pkt);	
                }
                else {
                    LOG_WARNING << "ITL: Dropping packet ...";
                    DROP = false;
                }
            } //end while
        }//end try
        catch (sc_exception &e){
            LOG_WARNING<<"ITL: Out of execute thread!";
        }
    }//end execute()

    /**
     *  This thread (i) updates credit counters, (ii) checks for overflows, (iii) checks for malformed
     *  TLPs and (iv) checks for valid CMPLs with the RSB.
     */
    void itl::update_ica(){
        LOG_INFO<<"ITL: update_ica begin...";

        RefPciePacket   in_pkt;
        sc_uint<64>     ici_val, ica_val;
        bool            log_rcv_ueh = false;

        icc_val = 0x00;

        try{
            while (1){
                WAIT(inPkt_ev);

                in_pkt = fc_q.front();
                fc_q.pop();

                sc_uint<64> peu_diag_reg = csr_port.read_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR);

                if( (GET_TLP_EP(in_pkt) == 1) &&
                        ((in_pkt->get_byte(TLP_HDR_START) == tlp_MWr_32) ||
                         (in_pkt->get_byte(TLP_HDR_START) == tlp_MWr_64) ||
                         //              (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd0) || 
                         //              (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd1) ||
                         //              (in_pkt->get_byte(TLP_HDR_START) == tlp_IORd) ||
                         (in_pkt->get_byte(TLP_HDR_START) == tlp_CplD) )){
                    LOG_WARNING << "TL: Warning: Ingr TLP(MWr32, MWr64, CplD) is POISONed.";
                    write_error_csr(UE,12,44,"pp");
                    log_rcv_ueh = true; //Log rcv header
                    DROP=true;
                } else if( (GET_TLP_EP(in_pkt) == 1) &&
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_IOWr || 
                         in_pkt->get_byte(TLP_HDR_START) == tlp_CfgWr0 || 
                         in_pkt->get_byte(TLP_HDR_START) == tlp_CfgWr1 
                         //                  || (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd0) || (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd1)
                        )){
                    LOG_WARNING << "TL: Warning: Ingr TLP (IOWr, CfgWr0, CfgWr1) is POISONed.";
                    write_error_csr(UE,12,44,"pp");
                    write_error_csr(UE,20,52,"ur");
                    log_rcv_ueh = true; //Log rcv header
                    DROP=true;
                } else if( (in_pkt->get_byte(TLP_HDR_START) == tlp_IORd) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_IOWr) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_MRdLk_32) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_MRdLk_64) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd0) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgRd1) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgWr0) ||
                        (in_pkt->get_byte(TLP_HDR_START) == tlp_CfgWr1) ) {
                    LOG_WARNING << "TL: Warning: Ingr TLP is UR. ";
                    write_error_csr(UE,20,52,"ur");
                    log_rcv_ueh = true; //Log rcv header
                } else {
                    ici_val = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);
                    ica_val = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);

                    if (in_pkt->isCmpl()) {
                        bool rs2it_err;
                        rsb_out_port->transport(in_pkt,rs2it_err);
                        if(rs2it_err){
                            LOG_WARNING << "Warning: Error in CMPL.";
                            DROP=true;
                        } else {
                            icc_val(CHC) = (sc_uint<8>)icc_val(CHC) + 1;
                            if (in_pkt->hasData()) {
                                icc_val(CDC) = (sc_uint<12>)icc_val(CDC) + 1;
                            }
                            LOG_DEBUG << "ICC Reg : CHC = " << (sc_uint<8>)icc_val(CHC) << ", CDC = " << (sc_uint<12>)icc_val(CDC);
                            LOG_DEBUG << "ICA Reg : CHC = " << (sc_uint<8>)ica_val(CHC) << ", CDC = " << (sc_uint<12>)ica_val(CDC);
                        }
                    } else if (in_pkt->isPosted()) {
                        //Posted Handling//////////////////////////////////
                        if(GET_TLP_FMT(in_pkt)==3 && GET_TLP_TYPE(in_pkt)>=0x10)
                        {
                            LOG_WARNING << "Warning : MsgD TLP received.";
                            write_error_csr(UE,20,52,"ur");
                            log_rcv_ueh = true; //Log rcv header
                            //DROP=true;
                            in_pkt->set_control(DROP_TLP_ILUINTF_RECOVER_CREDITS);//To indicate that this packet is to be dropped by the ilu_intf
                        } else if(GET_TLP_FMT(in_pkt)==1 && GET_TLP_TYPE(in_pkt)>=0x10) {
                            //Msg TLp Recvd
                            if(GET_TLP_TC(in_pkt)!=0){
                                LOG_WARNING << "Warning: Msg TLP received, but TC!=0...";
                                write_error_csr(UE,18,50,"mfp");
                                log_rcv_ueh = true; //Log rcv header
                                DROP=true;
                            } else {
                                if(in_pkt->isMalformed(peu_diag_reg)) {
                                    LOG_WARNING << "TL: Warning: Malformed TLP.";
                                    write_error_csr(UE,18,50,"mfp");
                                    log_rcv_ueh = true; //Log rcv header
                                    DROP=true;
                                } else {
                                    icc_val(PHC) = (sc_uint<8>)icc_val(PHC) + 1;
                                    if(peu_diag_reg.range(38,38)!=1 && ( (ica_val(PHC)-icc_val(PHC)) % 256 >= 128) && ici_val(PHC)!=0) {
                                        LOG_WARNING << "**TL : Warning: Overflow in PHC**";
                                        write_error_csr(UE,17,49,"rof");
                                        icc_val(PHC) = (sc_uint<8>)icc_val(PHC) - 1;
                                        DROP=true;
                                    }
                                }
                            }
                        } else {
                            if(in_pkt->isMalformed(peu_diag_reg)) {
                                LOG_WARNING << "TL: Malformed TLP.";
                                write_error_csr(UE,18,50,"mfp");
                                log_rcv_ueh = true; //Log rcv header
                                DROP=true;
                            } else {
                                icc_val(PHC) = (sc_uint<8>)icc_val(PHC) + 1;
                                if(peu_diag_reg.range(38,38)!=1 && ( (ica_val(PHC)-icc_val(PHC)) % 256 >= 128) && ici_val(PHC)!=0){
                                    LOG_WARNING << "**TL : Warning: Overflow in PHC**";
                                    write_error_csr(UE,17,49,"rof");
                                    icc_val(PHC) = (sc_uint<8>)icc_val(PHC) - 1;
                                    DROP=true;
                                }
                                else if (in_pkt->hasData()) { 
                                    sc_uint<12> cred = (GET_TLP_LEN(in_pkt))/4;
                                    if((GET_TLP_LEN(in_pkt))%4 != 0) cred++;
                                    icc_val(PDC) = (sc_uint<12>)icc_val(PDC) + cred;
                                    if(peu_diag_reg.range(38,38)!=1 && ((ica_val(PDC)-icc_val(PDC)) % 4096 >= 2048) && ici_val(PDC)!=0){
                                        LOG_WARNING << "**TL : Warning: Overflow in PDC**";
                                        DROP=true;
                                        write_error_csr(UE,17,49,"rof");
                                        icc_val(PDC) = (sc_uint<12>)icc_val(PDC) - cred;
                                    }
                                }
                            }
                        }
                            LOG_DEBUG << "ICC Reg : PHC = " << (sc_uint<8>)icc_val(PHC) << ", PDC = " << (sc_uint<12>)icc_val(PDC);
                            LOG_DEBUG << "ICA Reg : PHC = " << (sc_uint<8>)ica_val(PHC) << ", PDC = " << (sc_uint<12>)ica_val(PDC);
                    } else {
                        //Non-posted Handling//////////////////////////////////////
                        if(in_pkt->isMalformed(peu_diag_reg)) {
                            LOG_WARNING << "TL: Warning: Malformed TLP.";
                            write_error_csr(UE,18,50,"mfp");
                            log_rcv_ueh = true; //Log rcv header
                            DROP=true;
                        } else {
                            icc_val(NHC) = (sc_uint<8>)icc_val(NHC) + 1;
                            if(peu_diag_reg.range(38,38)!=1 &&  ( (ica_val(NHC)-icc_val(NHC)) % 256 >= 128) && ici_val(NHC)!=0){
                                LOG_WARNING << "**TL : Warning: Overflow in NHC**";
                                write_error_csr(UE,17,49,"rof");
                                icc_val(NHC) = (sc_uint<8>)icc_val(NHC) - 1;
                                DROP=true;
                            }
                            else if (in_pkt->hasData()) {  
                                sc_uint<12> cred = (GET_TLP_LEN(in_pkt))/4; 	
                                if((GET_TLP_LEN(in_pkt))%4 != 0) cred++;
                                icc_val(NDC) = (sc_uint<12>)icc_val(NDC) + cred;
                                if(peu_diag_reg.range(38,38)!=1 && ( (ica_val(NDC)-icc_val(NDC)) % 4096 >= 2048) && ici_val(NDC)!=0){
                                    LOG_WARNING << "**TL : Warning: Overflow in NDC**";
                                    DROP=true;
                                    write_error_csr(UE,17,49,"rof");
                                    icc_val(NDC) = (sc_uint<12>)icc_val(NDC) - cred;
                                }
                            }
                        }
                            LOG_DEBUG << "ICC Reg : NHC = " << (sc_uint<8>)icc_val(NHC) << ", NDC = " << (sc_uint<12>)icc_val(NDC);
                            LOG_DEBUG << "ICA Reg : NHC = " << (sc_uint<8>)ica_val(NHC) << ", NDC = " << (sc_uint<12>)ica_val(NDC);
                    } //end if() Header Processing
                    //Update Credits Recvd
                    csr_port.write_csr(PEU_CSR_A_TLU_ICR_HW_ADDR,icc_val);
                }//end else not UR

                if(log_rcv_ueh){
                    sc_uint<64> peu_rcv_ueh1_log_reg; //PEU Recv Uncorrectable Event Header1 Log Register
                    sc_uint<64> peu_rcv_ueh2_log_reg; //PEU Recv Uncorrectable Event Header2 Log Register 
                    peu_rcv_ueh1_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 0);
                    peu_rcv_ueh1_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 1);
                    peu_rcv_ueh1_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+ 2);
                    peu_rcv_ueh1_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+ 3);
                    peu_rcv_ueh1_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+ 4);
                    peu_rcv_ueh1_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+ 5);
                    peu_rcv_ueh1_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+ 6);
                    peu_rcv_ueh1_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+ 7);

                    peu_rcv_ueh2_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 8);
                    peu_rcv_ueh2_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 9);
                    peu_rcv_ueh2_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+10);
                    peu_rcv_ueh2_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+11);
                    if(GET_TLP_FMT(in_pkt) == 1 || GET_TLP_FMT(in_pkt) == 3)
                    {
                        peu_rcv_ueh2_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+12);
                        peu_rcv_ueh2_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+13);
                        peu_rcv_ueh2_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+14);
                        peu_rcv_ueh2_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+15);
                    }
                    csr_port.write_csr(PEU_CSR_A_RUE_HDR1_HW_ADDR,peu_rcv_ueh1_log_reg);
                    csr_port.write_csr(PEU_CSR_A_RUE_HDR2_HW_ADDR,peu_rcv_ueh2_log_reg);

                    log_rcv_ueh = false;
                }
                fcComp_ev.notify(); 
            } // while (1)
        }//end try
        catch (sc_exception &e){
            LOG_WARNING<<"ITL: Out of update_ica thread!";
        }
    } // update_ica()

    /**
     *  This function updates the requested UE, CE and OE error bits.
     */
    void itl::write_error_csr(uint8 err_type, uint8 primary, uint8 secondary, char field_name[3]){
        sc_uint<64> orig_csr_val;
        sc_uint<64> new_csr_val=0;
        sc_uint<64> log_enable;

        LOG_INFO << "Setting err bit: " << field_name;

        switch(err_type){
            case OE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating OE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);
                     LOG_INFO << "OE Log enable            : " << log_enable << ")";
                     break;
            case UE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating UE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
                     LOG_INFO << "UE Log Enable            : " << log_enable << ")";
                     break;
            case CE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating CE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_CE_LOG_HW_ADDR);
                     LOG_INFO << "CE Log Enable            : " << log_enable << ")";
                     break;
            default: LOG_ERROR << "Warning: undefined error type!";
                     return;
        }

        if(log_enable.range(primary,primary)==1)
        {
            if(orig_csr_val.range(primary,primary)!=1)
                new_csr_val.range(primary,primary)=1;
            else if(orig_csr_val.range(secondary,secondary)!=1)
                new_csr_val.range(secondary,secondary)=1;
            else
                LOG_WARNING << "Warning: Both PRIMARY and SECONDARY of " << field_name << "are set.";
        }

        switch(err_type){
            case OE: csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_INFO << "Updating OE CSR (new val : " << new_csr_val << ")";
                     break;
            case UE: csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_INFO << "Updating UE CSR (new val : " << new_csr_val << ")";
                     break;
            case CE: csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_INFO << "Updating CE CSR (new val : " << new_csr_val << ")";
                     break;
        }
        return;
    }//end write_csr_error

    /**
     *  This thread handles reset behavior of the module. On the arrival of a reset global event,
     *  it issue termination requests to threads in this module. Following the reset exit global event
     *  it invokes init() to re-spawn terminated threads.
     */
    void itl::reset_handler(){
        while(1){
            wait(*parent_global_ev);
            switch(*global_event_type){
                case POR_RESET_ENTER:
                case WMR_RESET_ENTER:
                    LOG_INFO << "\tITL: WMR/POR_RESET enter signal...";
                    POR_RESET=true;
                    //Notify wait()'s in ITL thread
                    reset_ev.notify();
                    //Wait for all thread to terminate
                    while(1){
                        if(execute_ph.terminated() && update_ica_ph.terminated()) break;
                        wait(execute_ph.terminated_event()|update_ica_ph.terminated_event());
                    }
                    LOG_WARNING << "ITL: WMR/POR Reset threads terminated";
                    while(!fc_q.empty()) fc_q.pop();
                    DROP=false;
                    LOG_WARNING << "ITL: WMR/POR Reset dbs cleared";
                    break;

                case POR_RESET_EXIT:
                case WMR_RESET_EXIT:
                    LOG_INFO << "\tITL: WMR/POR_RESET exit signal...";
                    init();
                    csr_port.write_csr(PEU_CSR_A_TLU_ICR_HW_ADDR,icc_val);
                    break;

                case SW_RESET_EXIT:
                    LOG_INFO<<"ITL: SW_RESET_EXIT";
                    icc_val=0;
                    break;
            }
        }//end while(1)
    }

    /**
     *  This method initializes module registers and flags.
     *  It also spawns threads that handle module operation.
     */ 
    void itl::init(){
        DROP = false;
        POR_RESET = false;
        icc_val = 0x0;
        execute_ph = sc_spawn(sc_bind(&itl::execute,this));
        update_ica_ph = sc_spawn(sc_bind(&itl::update_ica,this));
        LOG_INFO << "ITL: SW Reset : threads spawned";
    }
} //namepsace(pcie)
