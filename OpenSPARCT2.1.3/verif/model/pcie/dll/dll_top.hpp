// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dll_top.hpp
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
#ifndef DLL_TOP_h
#define DLL_TOP_h

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "pcie_common/pciePacket.hpp"
#include "pcie_common/data_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"

#include "pcie_common/dll_defines.hpp"
#include "pcie_common/symbol_encoding.hpp"
#include "pcie_common/csr_if_port.hpp"

#include <queue>
#include <sstream>
#include <iostream>
#include <list>

#define WAIT(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev); \
                     if(POR_RESET) throw sc_exception();
#define WAIT1(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev | cs2_ev); \
                     if(POR_RESET) throw sc_exception();

namespace pcie {
  
  /** This is the top DLL **/
  class dll_top : public sc_module 
  {

    public:
  	// Instance of write interface to fifo channel
	data_out_port<RefPciePacket>  dll_tl_out;
	data_out_port<RefPciePacket>  dll_pl_tlp_out;
	data_out_port<RefPciePacket>  dll_pl_dllp_out;
	data_in_port<RefPciePacket>  tl_dll_in;
	data_in_port<RefPciePacket> pl_dll_in;
	sc_in<bool>  PhysicalLinkUp;
	int DL_Status;
	csr_if_port<sc_uint<32>,sc_uint<64> >	csr_port;

	int FC_INIT1_Complete, FC_INIT2_Complete;
	int DL_State;
	int INIT_State;
	int FC_Init_Complete;

	int Flag_FC1_P, Flag_FC1_NP, Flag_FC1_CPL, Flag_FC1;
	int Flag_FC2_P, Flag_FC2_NP, Flag_FC2_CPL, Flag_FC2;
	int ltssm_L0s;
	bool sent_first_stp_pkt;

	sc_bv<2> DLL_State;
	sc_bv<64> Csr_Write_Mask;
	sc_bv<64> Csr_Write_Data;

	// internal registers
	sc_uint<16> dllp_crc;
	sc_uint<32> lcrc;

	bool  NAK_SCHEDULED;    //Added for error support
	bool  DO_NAK_SCHEDULED_CHECK;    //Added for error support
	bool  EDB_DETECTED;    //Added for error support
	bool  LCRC_MATCHED;    //Added for error support
	sc_uint<12> NEXT_TRANSMIT_SEQ;
	sc_uint<12> NEXT_RECEIVE_SEQ;
	sc_uint<12> ACKD_SEQ;
	sc_uint<8> prepend_byte0;
	sc_uint<8> prepend_byte1;
	sc_uint<64> dll_timer;
	sc_clock clock;
	sc_bv<64>  csr_data_reg;
	sc_bv<64>  ltssm_state_reg;
	sc_uint<64> time_last_ack_nak_received,replay_timer_limit;

	sc_event csr_core_status_ev,tlu_ecl_ev,fire_tlu_ecl_ev,dll_tlu_ica_ev,fc_init1_complete_ev,fc_init2_complete_ev;
	sc_event send_updatefc_ev;
	sc_event cs2_ev;
	sc_event credit_consumed_ev; ///< When ICR==ICA

        //Replay Buffer Data Elements
	sc_uint<2> REPLAY_NUM;
	sc_uint<12> REPLAY_TIMER;
	sc_uint<64> replay_buffer_size;
	USE_NAMESPACE(std)queue<RefPciePacket> replay_buffer;
	USE_NAMESPACE(std)queue<RefPciePacket> tmp_replay_buffer;


	USE_NAMESPACE(std)queue<RefPciePacket> queueTL,queue_DLLP,queue_TLP;
	sc_event eventPlPktRdy, eventTlPktRdy;
        
	dll_top(sc_module_name module_name, sc_event *parent_global_ev, uint8 *global_event_type) :
	  sc_module (module_name),
	  clock("MY_CLK1",20,0.5,200,true),
	  PhysicalLinkUp("PhysicalLinkUp"),
	  dll_tl_out("DLL_TL_Out"),
	  tl_dll_in("TL_DLL_In"),
	  dll_pl_tlp_out("DLL_PL_TLP_Out"),
	  dll_pl_dllp_out("DLL_PL_DLLP_Out"),
	  csr_port("csr_port"),
	  pl_dll_in("PL_DLL_In")
	{
	  this->parent_global_ev = parent_global_ev;
	  this->global_event_type = global_event_type;
	  // Producer process is ran as a thread on first processing element
	  SC_METHOD(init);
	  SC_THREAD(reset_handler);
	  SC_THREAD(credit_checker);
	  
	  LOG_DEBUG << "DLL TOP created ";
 	}

	SC_HAS_PROCESS(dll_top);

	
  private:
	void tl_producer();
	void tl_consumer();
	void pl_dllp_producer();
	void pl_tlp_producer();
	void pl_consumer();
	sc_uint<16> calculate_dllp_crc(RefPciePacket received_packet,int pkt_begin, int pkt_end);
	sc_uint<32> calculate_lcrc(RefPciePacket received_packet,int pkt_begin, int pkt_end); 
	void dll_ctrl_mgmt();
	void fc_init();
	void init();
	void ltssm_state_check();
	void fc_update();
	void buffer_add(RefPciePacket packet);
	void buffer_remove(sc_uint<12> seq_num);
	void buffer_replay( sc_uint<12> seq_num);
	void buffer_replay_single( sc_uint<12> seq_id);
        bool in_replay_buffer(sc_uint<12> seq_num);
	void write_error_csr(uint8,uint8,uint8,char[]);
	void write_error_csr2(uint8,uint8,uint8,char[]);
	sc_uint<14> get_mps();
	void reset_handler();
	void credit_checker();

	enum {OE,UE,CE};

	bool POR_RESET;
	bool STOP_TIMER;
	sc_event reset_ev;              //Reset event for threads in the module
	sc_event *parent_global_ev;      //Reset event to the module

	uint8 *global_event_type;

	//Proc handles
	sc_process_handle pl_consumer_ph;
	sc_process_handle pl_dllp_producer_ph;
	sc_process_handle pl_tlp_producer_ph;
	sc_process_handle tl_consumer_ph;
	sc_process_handle tl_producer_ph;
	sc_process_handle ltssm_state_check_ph;
	sc_process_handle fc_init_ph;
	sc_process_handle fc_update_ph;
	sc_process_handle dll_ctrl_mgmt_ph;
  };

}

#endif
