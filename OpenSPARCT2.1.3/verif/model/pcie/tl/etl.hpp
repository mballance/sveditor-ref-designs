// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: etl.hpp
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
#ifndef INC_etl_hpp__
#define INC_etl_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "pcie_common/pciePacket.hpp"

#include "pcie_common/data_port.hpp"
#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"

#include <queue>

#define WAIT(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev); \
    if(POR_RESET) {LOG_WARNING<<"ETL:WAIT throwing exception"; throw sc_exception();}

namespace pcie {

    class etl : public sc_module
    {
        public:
            etl(sc_module_name module_name, sc_event *parent_global_ev, uint8 *global_event_type) :
                sc_module (module_name),
                dout_port("data_out_port"),
                req_port("Req_port"),
                cmpl_port("CMPL_port"),
                csr_port("CSR_PORT"),
                eg_etl_rsb_port("EG_ETL_RSB_PORT")
            {
                this->parent_global_ev = parent_global_ev;
                this->global_event_type = global_event_type;
                SC_METHOD(init);
                SC_THREAD(reset_handler);
            }

            SC_HAS_PROCESS( etl);

            data_out_port<RefPciePacket> dout_port;
            data_out_port<RefPciePacket> eg_etl_rsb_port;
            data_in_port<RefPciePacket>	 req_port;
            data_in_port<RefPciePacket>	 cmpl_port;

            csr_if_port< CSR_ADDR_T, CSR_DATA_T >	csr_port;

            sc_uint<64>		ecl, ecc;     ///< local credit consumed and credit limit registers.
            sc_event 		ecl_event;

        private:
            //Module threads and methods
            void execute();
            void req_handler();
            void cmpl_handler();
            void get_p_credit(RefPciePacket& p);
            void get_np_credit(RefPciePacket& p);
            void get_cmpl_credit(RefPciePacket& p);
            void ecl_update();
            void init();
            void reset_handler();

            //Module events
            sc_event ecl_ev;            ///< Egress Credit Limit CSR update event
            sc_event epktRdy_ev;        ///< Egress Pkt Rdy event
            sc_event reset_ev;          ///< Reset event for threads in the module
            sc_event *parent_global_ev; ///< Global event to the module

            uint8 *global_event_type;

            bool POR_RESET;

            //Proc handles
            sc_process_handle execute_ph;
            sc_process_handle req_handler_ph;
            sc_process_handle cmpl_handler_ph;
            sc_process_handle ecl_update_ph;

            USE_NAMESPACE(std)queue<RefPciePacket>	egress_q; ///< Egress TLP queue 
    };
} // namespace pcie_tl
#endif // INC_etl_hpp__
