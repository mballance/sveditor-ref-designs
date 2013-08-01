// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dll_ctrl_mgmt.cpp
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



    /** This function initializes values to be used at DLL **/

    void dll_top::init()
    {
        FC_INIT1_Complete = 0;
        FC_INIT2_Complete = 0;
        FC_Init_Complete = 0;
        DL_State = DL_INACTIVE;
        NAK_SCHEDULED = 0;
        dllp_crc = 0xffff;
        lcrc = 0xffffffff;
        ltssm_L0s =0;
        replay_buffer_size=128;

        Flag_FC1=0;
        Flag_FC1_P=0;
        Flag_FC1_NP=0;
        Flag_FC1_CPL=0;
        Flag_FC2=0;
        Flag_FC2_P=0;
        Flag_FC2_NP=0;
        Flag_FC2_CPL=0;

        DO_NAK_SCHEDULED_CHECK = 0;
        NEXT_TRANSMIT_SEQ = 0;
        NEXT_RECEIVE_SEQ = 0;
        ACKD_SEQ=0;
        REPLAY_NUM=0;

        POR_RESET=false;
        STOP_TIMER=false;
        pl_consumer_ph = sc_spawn(sc_bind(&dll_top::pl_consumer,this));
        tl_consumer_ph = sc_spawn(sc_bind(&dll_top::tl_consumer,this));
        tl_producer_ph = sc_spawn(sc_bind(&dll_top::tl_producer,this));
        pl_dllp_producer_ph = sc_spawn(sc_bind(&dll_top::pl_dllp_producer,this));
        pl_tlp_producer_ph = sc_spawn(sc_bind(&dll_top::pl_tlp_producer,this));
        ltssm_state_check_ph = sc_spawn(sc_bind(&dll_top::ltssm_state_check,this));
        fc_init_ph = sc_spawn(sc_bind(&dll_top::fc_init,this));
        fc_update_ph = sc_spawn(sc_bind(&dll_top::fc_update,this));
        dll_ctrl_mgmt_ph = sc_spawn(sc_bind(&dll_top::dll_ctrl_mgmt,this));
        LOG_DEBUG << "DLL: SW Reset : threads re-spawned" ;
    }  

    void dll_top::reset_handler()
    {
        csr_port.set_notify_event(PEU_CSR_A_CORE_STATUS_HW_ADDR,&csr_core_status_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_ECL_HW_ADDR,&tlu_ecl_ev);
        while(1){
            //Step 1: Detect reset event
            wait(*parent_global_ev);
            switch(*global_event_type){
                case POR_RESET_ENTER:
                case WMR_RESET_ENTER:
                    //Step 2: SW Reset activities
                    LOG_DEBUG << "\tDLL: WMR/POR_RESET enter signal..." ;
                    POR_RESET=true;
                    reset_ev.notify();
                    //Wait for all thread to terminate
                    while(1){
                        if(pl_consumer_ph.terminated() && tl_consumer_ph.terminated() &&
                                tl_producer_ph.terminated() && pl_dllp_producer_ph.terminated() &&
                                pl_tlp_producer_ph.terminated() && ltssm_state_check_ph.terminated() &&
                                fc_init_ph.terminated() && fc_update_ph.terminated() &&
                                dll_ctrl_mgmt_ph.terminated() )
                            break;
                        wait(pl_consumer_ph.terminated_event()|tl_consumer_ph.terminated_event()|tl_producer_ph.terminated_event()|pl_dllp_producer_ph.terminated_event()|pl_tlp_producer_ph.terminated_event()|ltssm_state_check_ph.terminated_event()|fc_init_ph.terminated_event()|fc_update_ph.terminated_event()|dll_ctrl_mgmt_ph.terminated_event());
                    }
                    LOG_DEBUG << "DLL: WMR/POR Reset threads terminated" ;
                    while(!queueTL.empty()) queueTL.pop();
                    while(!queue_DLLP.empty()) queue_DLLP.pop();
                    while(!queue_TLP.empty()) queue_TLP.pop();
                    LOG_DEBUG << "DLL: WMR/POR Reset dbs cleared" ;
                    break;

                case POR_RESET_EXIT:
                case WMR_RESET_EXIT:
                    LOG_DEBUG << "\tDLL: WMR/POR_RESET exit signal..." ;
                    init();
                    //while((csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR)).range(48,44)!=16) wait(csr_core_status_ev);
                    //cs2_ev.notify(); //notify FC_INIT that its good to go.
                    break;

                case SW_RESET_ENTER:
                    LOG_DEBUG<<"DLL: SW_RESET_ENTER";
                    STOP_TIMER=true;
                    break;

                case SW_RESET_EXIT:
                    LOG_DEBUG<<"DLL: SW_RESET_EXIT";
                    STOP_TIMER=false;
                    break;
            }
        }//end while(1)
    }

    void dll_top::dll_ctrl_mgmt()
    {
        LOG_DEBUG<<"DLL: dll_ctrl_mgmt begins...";
        try
        {
            while (true)
            {
                WAIT1(csr_core_status_ev);
                csr_data_reg = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);

                switch(DL_State)
                {    
                    case DL_INACTIVE:  
                        LOG_DEBUG <<   " Entered DL_INACTIVE state";
                        NAK_SCHEDULED = 0;
                        if ( csr_data_reg.range(48,44) == 16 )  // L) state
                            DL_State = DL_INIT;
                        break;
                    case DL_INIT : 
                        LOG_DEBUG <<  " Entered DL_INIT stage" ;

                        if ( INIT_State == FC_INIT1 ) {
                            Csr_Write_Mask = 0;     
                            Csr_Write_Mask.range(53,52) = MASK3;
                            Csr_Write_Data = 0;     
                            Csr_Write_Data.range(53,52) = MASK1;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,Csr_Write_Data,Csr_Write_Mask);
                        }
                        else if ( INIT_State == FC_INIT2 )
                        {
                            Csr_Write_Mask = 0;     
                            Csr_Write_Mask.range(53,52) = MASK3;
                            Csr_Write_Data = 0;     
                            Csr_Write_Data.range(53,52) = MASK3;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,Csr_Write_Data,Csr_Write_Mask);
                        }
                        if ( FC_Init_Complete & (csr_data_reg.range(48,44) == 16) )
                        {
                            Csr_Write_Mask = 0;     
                            Csr_Write_Mask.range(53,52) = MASK3;
                            Csr_Write_Data = 0;     
                            Csr_Write_Data.range(53,52) = MASK2;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,Csr_Write_Data,Csr_Write_Mask);
                            DL_State = DL_ACTIVE;
                        }
                        if ( csr_data_reg.range(48,44) != 16  )
                        { 
                            Csr_Write_Mask = 0;     
                            Csr_Write_Mask.range(53,52) = MASK3;
                            Csr_Write_Data = 0;     
                            Csr_Write_Data.range(53,52) = MASK0;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,Csr_Write_Data,Csr_Write_Mask);
                            DL_State = DL_INACTIVE;
                        }
                        break;
                    case DL_ACTIVE : 
                        LOG_DEBUG <<  " Entered DL_ACTIVE stage"; 
                        DL_Status = 1; // Report DL_UP to TL
                        if ( csr_data_reg.range(48,44) != 16  )
                        { 
                            Csr_Write_Mask = 0;     
                            Csr_Write_Mask.range(53,52) = MASK3;
                            Csr_Write_Data = 0;     
                            Csr_Write_Data.range(53,52) = MASK0;
                            csr_port.write_csr_mask(PEU_CSR_A_CORE_STATUS_HW_ADDR,Csr_Write_Data,Csr_Write_Mask);
                            DL_State =  DL_INACTIVE;
                        }
                        break;
                } // switch
            }
        }
        catch(sc_exception &e){
            LOG_DEBUG<<"DLL: Out of dll_ctrl_mgmt";
        }
    }

}	
