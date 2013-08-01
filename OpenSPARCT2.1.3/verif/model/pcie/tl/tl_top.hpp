// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tl_top.hpp
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
#ifndef INC_tl_top_hpp__
#define INC_tl_top_hpp__

#include <systemc.h>

#include "pcie_common/tlm/tlm_data_channel.hpp"
#include "etl.hpp"
#include "itl.hpp"
#include "rsb.hpp"

namespace pcie {

    class tl_top : public sc_module
    {
        public:
            tl_top(sc_module_name module_name, sc_event *parent_global_event, uint8 *parent_global_event_type) :
                sc_module (module_name),
                csr_port("CSR_PORT")
            {
                this->parent_global_event = parent_global_event;
                this->parent_global_event_type = parent_global_event_type;

                m_etl = new etl("etl",parent_global_event,parent_global_event_type);
                m_itl = new itl("itl",parent_global_event,parent_global_event_type);
                m_rsb = new rsb("rsb",parent_global_event,parent_global_event_type);

                itl_rsb_data_chnl = new tlm_transport_channel<RefPciePacket,bool>;
                m_rsb->ing_port(itl_rsb_data_chnl->slave_export);
                m_itl->rsb_out_port(itl_rsb_data_chnl->target_export);

                etl_rsb_data_chnl = new tlm_data_channel<RefPciePacket>("etl_rsb_chnl",parent_global_event,parent_global_event_type);

                m_etl->eg_etl_rsb_port(*etl_rsb_data_chnl);
                m_rsb->eg_port(*etl_rsb_data_chnl);

                SC_THREAD(link_events);

            }

            SC_HAS_PROCESS( tl_top );

            csr_if_port< CSR_ADDR_T, CSR_DATA_T >	csr_port;

            ~tl_top() {
                delete m_itl;
                delete m_etl;
                delete m_rsb;
            }

            void etl_data_port(data_out_port<RefPciePacket>::if_type& i) {
                m_etl->dout_port(i);
            }

            void itl_data_port(data_in_port<RefPciePacket>::if_type& i) {
                m_itl->d_in_port(i);
            }

            void link_events() {
                sc_event core_status_ev;
                csr_port.set_notify_event(PEU_CSR_A_CORE_STATUS_HW_ADDR,&core_status_ev);
                sc_uint<64> core_status;

                while (true) {
                    wait (core_status_ev);
                    core_status = csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR);
                    if (core_status(48,44) == 16) {
                        csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR, 0x100);
                    }
                }
            }

            etl		*m_etl;
            itl		*m_itl;
            rsb         *m_rsb;

            tlm_transport_channel< RefPciePacket , bool>    *itl_rsb_data_chnl;
            tlm_data_channel< RefPciePacket >               *etl_rsb_data_chnl;

            sc_event *parent_global_event;
            uint8 *parent_global_event_type;
    };
} // namespace pcie

#endif // INC_tl_top_hpp__
