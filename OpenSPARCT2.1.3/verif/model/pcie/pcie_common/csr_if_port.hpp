// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_if_port.hpp
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
#ifndef INC_csr_if_port_hpp__
#define INC_csr_if_port_hpp__

#include <systemc.h>

#include "pcie_common/csr_if.hpp"
#include "pcie_common/logger.hpp"

#include "tlm.h"

#define CSR_ADDR_T sc_uint<32> 
#define CSR_DATA_T sc_uint<64> 

namespace pcie {
  USING_NAMESPACE(tlm);
  USING_NAMESPACE(Logger);
  
  /** Port definition for the CSR DB interface */

  template < typename ADDR, typename DATA, int N = 1>
  class csr_if_port :  
	public sc_port< tlm_transport_if < csr_req <ADDR, DATA> , csr_rsp <DATA> > , N  > ,
	public virtual csr_if< ADDR, DATA > 
  {
  public:
	typedef tlm_transport_if < csr_req <ADDR, DATA>, csr_rsp <DATA> > if_type;
	
	csr_if_port( const char* port_name ) : sc_port< if_type, N > (port_name) 
	{
	}
	

	virtual bool is_mapped(const ADDR reg_addr) {
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  
	  req._cmd = CSR_ISMAPPED;
	  req._addr = reg_addr;
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "IS_MAPPED (" << name() << ") Addr: " << reg_addr 
				<< " Response: " << (rsp._is_mapped ? "true" : "false");

	  return rsp._is_mapped;
	}

	virtual DATA read_csr(const ADDR addr) {
	  
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  
	  req._cmd = CSR_READ;
	  req._addr = addr;
	  req._read_clear = false;
	  
	  
	  LOG_DEBUG << "READ_CSR ( " << name() << ") Addr : " << addr << "\n";
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "READ_CSR ( " << name() << ") Addr : " << addr 
				<< " Data returned : " << rsp._data << " \n";
	  return rsp._data;
	}

	
	virtual DATA write_csr(const ADDR addr, const DATA data) {
	  
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  
	  req._cmd = CSR_WRITE;
	  req._addr = addr;
	  req._data = data;

	  
	  LOG_DEBUG << "WRITE_CSR ( " << name() << ") Addr : " << addr  << "\n";
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "WRITE_CSR ( " << name() << ") Addr : " << addr 
				<< " Data returned : " << rsp._data << " \n";
	  return rsp._data;
	}

	virtual DATA write_csr_mask(const ADDR addr, const DATA data, const DATA fld_mask) {
	  
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  
	  req._cmd = CSR_WRITE_MASK;
	  req._addr = addr;
	  req._data = data;
	  req._fld_mask = fld_mask;

	  
	  LOG_DEBUG << "WRITE_CSR ( " << name() << ") Addr : " << addr  << "\n";
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "WRITE_CSR ( " << name() << ") Addr : " << addr 
				<< " Data returned : " << rsp._data << " \n";
	  return rsp._data;
	}



	virtual void set_notify_event(ADDR reg_addr, sc_event* event_handle) {
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  
	  req._cmd = CSR_SETEVENT;
	  req._addr = reg_addr;
	  req._event = event_handle;
	  rsp = (*this)->transport(req);
	}

	virtual void reset_csr_db() {
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  	  
	  LOG_DEBUG << "RESET_CSR_DB() ";

	  req._cmd = CSR_RESET;
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "RESET_CSR_DB() .. returned";
	}
	
        virtual void create_csr_db() {
	  csr_req <ADDR, DATA>  req;
	  csr_rsp <DATA>  rsp;
	  	  
	  LOG_DEBUG << "Create_CSR_DB() ";

	  req._cmd = CSR_CREATE;
	  rsp = (*this)->transport(req);
	  LOG_DEBUG << "Create_CSR_DB() .. returned";
	}

  };

 
  
} // namespace pcie


#endif // INC_csr_if_port_hpp__
