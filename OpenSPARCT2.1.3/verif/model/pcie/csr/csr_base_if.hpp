// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_base_if.hpp
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
#ifndef INC_csr_base_if_hpp__
#define INC_csr_base_if_hpp__

#include <systemc.h>
#include "pcie_common/config.hpp"
#include "pcie_common/csr_if.hpp"
#include <map>

namespace pcie {

    template < typename ADDR, typename DATA>
        class csr_base_if : public virtual csr_if <ADDR, DATA>,
                            public virtual tlm_transport_if <csr_req <ADDR, DATA>, csr_rsp <DATA> >
        {
            public:
                typedef tlm_transport_if <csr_req < ADDR, DATA > ,
                        csr_rsp < DATA > > if_type;

                csr_rsp<DATA> transport (const csr_req<ADDR, DATA> &req) {
                    csr_rsp<DATA>  rsp;

                    switch (req._cmd) {
                        case CSR_READ:
                            rsp._data = read_csr(req._addr);
                            break;
                        case CSR_WRITE:
                            rsp._data = write_csr(req._addr, req._data);
                            break;
                        case CSR_WRITE_MASK:
                            rsp._data = write_csr_mask(req._addr, req._data, req._fld_mask);
                            break;

                        case CSR_ISMAPPED:
                            rsp._is_mapped = is_mapped(req._addr);
                            break;

                        case CSR_SETEVENT:
                            set_notify_event(req._addr, req._event);
                            break;
                        case CSR_RESET:
                            reset_csr_db();
                            break;
                        case CSR_CREATE:
                            create_csr_db();
                            break;
                    }
                    return rsp;
                }
        };
} // namespace pcie_tl

#endif // INC_csr_hpp__
