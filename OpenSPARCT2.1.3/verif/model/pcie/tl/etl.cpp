// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: etl.cpp
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
#include "etl.hpp"
#include "pcie_common/logger.hpp"

namespace pcie {

    /**
     *  This method initializes module registers and flags.
     *  It also spawns threads that handle module operation.
     */ 
    void etl::init(){
        POR_RESET = false;
        execute_ph = sc_spawn(sc_bind(&etl::execute,this));
        req_handler_ph = sc_spawn(sc_bind(&etl::req_handler,this));
        cmpl_handler_ph = sc_spawn(sc_bind(&etl::cmpl_handler,this));
        ecl_update_ph = sc_spawn(sc_bind(&etl::ecl_update,this));
        LOG_INFO << "ETL: SW Reset : threads spawned";
    }

    /**
     *  This thread forwards TLPs in the egress_q to DLL. Non-posted requests are also
     *  forwarded to the RSB.
     */
    void etl::execute(void) {
        LOG_INFO<<"ETL: execute begin...";
        ecc=0;
        csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR, ecc);
        RefPciePacket next_pkt;
        try{
            while(1){
                while (!egress_q.empty()){
                    next_pkt = egress_q.front();
                    egress_q.pop();

                    LOG_INFO << "ETL: Send Packet " << next_pkt->getPacketId() << "\n";
                    //cout << sc_time_stamp() << "\t\t\t\t\t| ETL: Send Packet " << next_pkt->getPacketId() << " to DLL." << endl;
                    if((!next_pkt->isPosted()) && (!next_pkt->isCmpl())) 
                        eg_etl_rsb_port.send_packet(next_pkt);
                    dout_port.send_packet(next_pkt);
                }
                WAIT(epktRdy_ev);
            } //end while(1)
        }//end try
        catch(sc_exception &e){
            LOG_WARNING << "ETL: Out of execute";
        }
    }//end execute()

    /**
     *  This thread receives TLPs from the ILU interface and enqueues them into
     *  the egress_q, once credit is available.
     */
    void etl::req_handler() {
        LOG_INFO<<"ETL: req_handler begin...";
        RefPciePacket new_pkt;
        try{
            while (1) {
                req_port.get_packet(new_pkt);
                //cout<< sc_time_stamp() <<"\t\t\t\t\t| ETL: Recvd Req TLP " <<new_pkt->getPacketId() << " from ilu_intf" <<endl;
                if (new_pkt->isPosted()) 
                    get_p_credit(new_pkt);
                else
                    get_np_credit(new_pkt);
                egress_q.push(new_pkt);
                epktRdy_ev.notify();
            }
        }
        catch(sc_exception &e){
            LOG_WARNING << "ETL: Out of req_handler";
        }
    }

    /**
     *  This thread receives CMPL TLPs from the ILU interface and enqueues them into
     *  the egress_q, once credit is available.
     */
    void etl::cmpl_handler() {
        LOG_INFO<<"ETL: cmpl_handler begins...";
        try{
            RefPciePacket new_pkt;
            while (1) {
                cmpl_port.get_packet(new_pkt);
                //cout<< sc_time_stamp() <<"\t\t\t\t\t| ETL: Recvd Cpl TLP " <<new_pkt->getPacketId() << " from ilu_intf" <<endl;
                get_cmpl_credit(new_pkt);
                egress_q.push(new_pkt);
                epktRdy_ev.notify();
            }
        }
        catch(sc_exception &e){
            LOG_WARNING << "ETL: Out of cmpl_handler";
        }
    }
    
    /**
     *  This thread monitors the egress credit limit CSR register and provides updates
     *  to any waiting out-going TLPs.
     */
    void etl::ecl_update() {
        LOG_INFO << "ETL: ecl_update begins...";
        try{
            while (1) {
                WAIT(ecl_ev);
                ecl = csr_port.read_csr(PEU_CSR_A_TLU_ECL_HW_ADDR);
                ecl_event.notify();
            }
        }
        catch(sc_exception &e){
            LOG_WARNING << "ETL: Out of ecl_update";
        }
    }

    /**
     *  This blocking thread waits for available posted credits for out-going TLPs.
     */
    void etl::get_p_credit(RefPciePacket& p) {
        bool hcAvail = false;
        bool dcAvail = false;
        sc_uint<12> cred = (GET_TLP_LEN(p))/4;
        if((GET_TLP_LEN(p))%4 != 0) cred++;

        while(1){
            ecc = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
            if(ecc[60] == 0x1)
                hcAvail = true;
            else if(ecc(19,12)==ecl(19,12))
                hcAvail = false;
            else
                hcAvail = true;

            if(p->hasData()){
                if(ecl[60] == 0x1)
                    dcAvail = true;
                else if( (ecl(11,0)-((sc_uint<12>)ecc(11,0)+cred)) %4096 > 2048 )
                    dcAvail=false;
                else 
                    dcAvail = true;
            }
            else 
                dcAvail=true;

            if(hcAvail && dcAvail){
                ecc(19,12) = (sc_uint<8>)ecc(19,12) + 1;
                if(p->hasData()) ecc(11,0) = (sc_uint<12>)ecc(11,0) + cred;
                if(p->hasData()) 
                    LOG_DEBUG << "ETL: PH consumed (+1) = " << ecc(19,12) << " PD consumed (+" << cred << ") = " << ecc(11,0) ;
                else 
                    LOG_DEBUG << "ETL: PH consumed (+1) = " << ecc(19,12) << " PD consumed (+0) = " << ecc(11,0) ;
                csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR, ecc);
                break;
            }
            WAIT(ecl_event);
        }
        return;
    }//end get_p_credit

    /**
     *  This blocking thread waits for available non-posted credits for out-going TLPs.
     */
    void etl::get_np_credit(RefPciePacket& p) {
        bool hcAvail = false;
        bool dcAvail = false;
        sc_uint<12> cred = (GET_TLP_LEN(p))/4;
        if((GET_TLP_LEN(p))%4 != 0) cred++;

        while(1){
            ecc = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
            if(ecc[61] == 0x1)
                hcAvail = true;
            else if(ecc(39,32)==ecl(39,32))
                hcAvail = false;
            else
                hcAvail = true;

            if(p->hasData()){
                if(ecl[61] == 0x1)
                    dcAvail = true;
                else if( (ecl(31,20)-((sc_uint<12>)ecc(31,20)+cred)) %4096 > 2048 )
                    dcAvail=false;
                else 
                    dcAvail = true;
            }
            else 
                dcAvail=true;

            if(hcAvail && dcAvail){
                ecc(39,32) = (sc_uint<8>)ecc(39,32) + 1;
                if(p->hasData()) ecc(31,20) = (sc_uint<12>)ecc(31,20) + cred;
                if(p->hasData()) 
                    LOG_DEBUG << "ETL: NPH consumed (+1) = " << ecc(39,32) << " NPD consumed (+" << cred << ") = " << ecc(31,20) ;
                else 
                    LOG_DEBUG << "ETL: NPH consumed (+1) = " << ecc(39,32) << " NPD consumed (+0) = " << ecc(31,20) ;
                csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR, ecc);
                break;
            }
            WAIT(ecl_event);
        }
        return;
    }//end get_np_credit

    /**
     *  This blocking thread waits for available cmpl credits for out-going TLPs.
     */
    void etl::get_cmpl_credit(RefPciePacket& p) {
        bool hcAvail = false;
        bool dcAvail = false;
        sc_uint<12> cred = (GET_TLP_LEN(p))/4;
        if((GET_TLP_LEN(p))%4 != 0) cred++;

        while(1){
            ecc = csr_port.read_csr(PEU_CSR_A_TLU_ECC_HW_ADDR);
            if(ecc[62] == 0x1)
                hcAvail = true;
            else if(ecc(59,52)==ecl(59,52))
                hcAvail = false;
            else
                hcAvail = true;

            if(p->hasData()){
                if(ecl[62] == 0x1)
                    dcAvail = true;
                else if( (ecl(51,40)-((sc_uint<12>)ecc(51,40)+cred)) %4096 > 2048 )
                    dcAvail=false;
                else 
                    dcAvail = true;
            }
            else 
                dcAvail=true;

            if(hcAvail && dcAvail){
                ecc(59,52) = (sc_uint<8>)ecc(59,52) + 1;
                if(p->hasData()) ecc(51,40) = (sc_uint<12>)ecc(51,40) + cred;
                if(p->hasData()) 
                    LOG_DEBUG << "ETL: CH consumed (+1) = " << ecc(59,52) << " CD consumed (+" << cred << ") = " << ecc(51,40) ;
                else 
                    LOG_DEBUG << "ETL: CH consumed (+1) = " << ecc(59,52) << " CD consumed (+0) = " << ecc(51,40) ;
                csr_port.write_csr(PEU_CSR_A_TLU_ECC_HW_ADDR, ecc);
                break;
            }
            WAIT(ecl_event);
        }
        return;
    }//end get_cmpl_credit

    /**
     *  This thread handles reset behavior of the module. On the arrival of a reset global event,
     *  it issue termination requests to threads in this module. Following the reset exit global event
     *  it invokes init() to re-spawn terminated threads.
     */
    void etl::reset_handler(){
        csr_port.set_notify_event(PEU_CSR_A_TLU_ECL_HW_ADDR, &ecl_ev);
        while(1){
            wait(*parent_global_ev);
            switch(*global_event_type){
                case POR_RESET_ENTER:
                case WMR_RESET_ENTER:
                    LOG_WARNING << "\tETL: WMR/POR_RESET enter signal...";
                    POR_RESET=true;
                    reset_ev.notify();
                    while(1){
                        if(execute_ph.terminated() && req_handler_ph.terminated() && cmpl_handler_ph.terminated() && ecl_update_ph.terminated()) break;
                        wait(execute_ph.terminated_event()|req_handler_ph.terminated_event()|cmpl_handler_ph.terminated_event()|ecl_update_ph.terminated_event());
                    }
                    LOG_WARNING << "ETL: WMR/POR Reset threads terminated";
                    while(!egress_q.empty()) egress_q.pop();
                    LOG_INFO << "ETL: WMR/POR Reset dbs cleared";
                    break;

                case POR_RESET_EXIT:
                case WMR_RESET_EXIT:
                    POR_RESET=false;
                    LOG_INFO << "\tETL: WMR/POR_RESET exit signal...";
                    init();
                    break;
            }
        } //end while(1)
    }//end reset_handler()
}
