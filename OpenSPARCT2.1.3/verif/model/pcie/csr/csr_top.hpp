// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_top.hpp
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
#ifndef INC_csr_top_hpp__
#define INC_csr_top_hpp__

#include <systemc.h>

#include "pcie_common/logger.hpp"
#include "tlm.h"

#include "pcie_common/csr_if_port.hpp"
#include "csr_arb.hpp"
#include "csr.hpp"
#include "tlm.h"
#include "tlm_core/tlm_fifo/tlm_fifo.h"

#include "pcie_common/logger.hpp"

USING_NAMESPACE(Logger);

namespace pcie {

    template <int N = 1>
        class csr_top : public sc_module
        {
            public:
                typedef csr_req<CSR_ADDR_T, CSR_DATA_T>	REQ;
                typedef csr_rsp<CSR_DATA_T>		RSP;

                typedef tlm_transport_channel < REQ, RSP > arb_channel_type;

                arb_channel_type chnl[N];

                csr_top(sc_module_name module_name, sc_event *parent_global_event, uint8 *parent_global_event_type) :
                    sc_module (module_name),
                    csr_clock("CSR_CLK",50,SC_PS,0.5)
                {
                    this->parent_global_event = parent_global_event;
                    this->parent_global_event_type = parent_global_event_type;
                    LOG_DEBUG << ">> CSR_TOP()";
                    LOG_DEBUG << "CSR_TOP():: calling new csr_arb";
                    tl_csr = new csr<CSR_ADDR_T, CSR_DATA_T> ("PCIE_CSR", parent_global_event,parent_global_event_type);
                    LOG_DEBUG << "CSR_TOP():: calling new csr_arb.. done";
                    tl_arb = new csr_arb< REQ, RSP, N > ("PCIE_CSR_ARB");
                    LOG_DEBUG << "CSR_TOP():: calling new csr_arb.. done";
                    for (int i = 0; i < N; i++) {
                        tl_arb->master_port[i](chnl[i].slave_export);
                        tl_arb->add_interface(&(tl_arb->master_port[i]), 1);
                    }
                    LOG_DEBUG << "CSR_TOP():: Ports connect";
                    tl_arb->slave_port (tl_csr->target_port);
                    tl_arb->csr_clock(csr_clock);

                    LOG_DEBUG << ">> CSR_TOP()";
                }

                ~csr_top() 
                {
                    delete tl_csr;
                    delete tl_arb;
                }

                sc_event *parent_global_event;
                uint8 *parent_global_event_type;

            private:
                csr_arb< REQ, RSP, N >	        *tl_arb;
                csr<CSR_ADDR_T, CSR_DATA_T >	*tl_csr;
                sc_clock 	                csr_clock;
        };
} // namespace pcie

#endif // INC_csr_top_hpp__
