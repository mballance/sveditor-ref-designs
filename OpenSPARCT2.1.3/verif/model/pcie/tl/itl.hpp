// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: itl.hpp
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
#ifndef INC_itl_hpp__
#define INC_itl_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "pcie_common/pciePacket.hpp"

#include "pcie_common/data_port.hpp"
#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"

#include "tlm.h"

using tlm::tlm_transport_if;
using tlm::tlm_slave_if;

#include "pcie_common/tlm/tlm_data_channel.hpp"

#include <queue>

#define WAIT(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev); \
    if(POR_RESET) {LOG_INFO<<"ITL: WAIT exception thrown!"; throw sc_exception();}

namespace pcie {

    class itl : public sc_module 
    {
        public:
            itl(sc_module_name module_name, sc_event *parent_global_ev, uint8 *global_event_type) :
                sc_module (module_name), 
                d_in_port("data_in_port"),
                d_out_port("data_out_port"),
                rsb_out_port("rsb_out_port"),
                csr_port("CSR_PORT")
            {
                this->parent_global_ev = parent_global_ev;
                this->global_event_type = global_event_type;
                SC_METHOD(init);
                SC_THREAD(reset_handler);
            }

            SC_HAS_PROCESS( itl);

            data_in_port<RefPciePacket> 	d_in_port;
            data_out_port<RefPciePacket>	d_out_port;
            sc_port< tlm_transport_if<RefPciePacket, bool> > rsb_out_port;
            csr_if_port< CSR_ADDR_T, CSR_DATA_T >	csr_port;

        private:
            //Module threads and methods
            void execute();
            void update_ica();
            void write_error_csr(uint8, uint8, uint8, char[]);
            void init();
            void reset_handler();

            //Module events
            sc_event fcComp_ev;         ///< Flow Control credits update complete event
            sc_event inPkt_ev;          ///< Ingress pkt rdy for flow control processing event
            sc_event reset_ev;          ///< Reset event for threads in the module
            sc_event *parent_global_ev; ///< Global event to the module

            uint8 *global_event_type;   ///< Global event type

            //Module flags and registers
            bool            DROP;       ///< Ingress Pkt to-be-dropped flag
            bool            POR_RESET;  ///< Power-on Reset flag
            sc_uint<64>     icc_val;    ///< Ingress Credits Consumed/Recvd local register

            //Proc handles
            sc_process_handle execute_ph;
            sc_process_handle update_ica_ph;

            enum {OE,UE,CE};

            USE_NAMESPACE(std)queue<RefPciePacket> fc_q; ///< Ingress TLP recvd queue
    };

} // namespace pcie_tl

#endif // INC_itl_hpp__
