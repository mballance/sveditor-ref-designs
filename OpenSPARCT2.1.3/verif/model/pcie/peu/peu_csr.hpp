// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_csr.hpp
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
#ifndef INC_peu_csr_hpp__
#define INC_peu_csr_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "peu_defines.hpp"
#include "pcie_common/csr_if_port.hpp"

#include "pcie_common/data_port.hpp"
#include "pcie_common/logger.hpp"

#include <queue>

#define CSR_ADDR_T 	sc_uint<32>
#define CSR_DATA_T	sc_uint<64>

namespace pcie {

  /** CSR Ring Intf packet format */
  class csr_pkt {
  public:
	bool                   is_rsp;
	sc_uint<CSR_CMND_WDTH> cmd;
	sc_uint<CSR_SRCB_WDTH> srcb;
	sc_uint<1>	           write;
	sc_uint<CSR_ADDR_WDTH> addr;
	sc_uint<CSR_DATA_WDTH> data;
	csr_pkt() {
	  is_rsp = false;
	  cmd = 0x0;
	  srcb = 0x0;
	  addr = 0x0;
	  data = 0x0;
	}
  };
  
  /**
   * CSR Ring Interface protocol, specific to the T2 design
   */
  class peu_csr : public sc_module
  {
  public:
	peu_csr(sc_module_name module_name) :
	  sc_module (module_name),
	  csr_port("csr_port")
	{
	  LOG_DEBUG << "> PEU_CSR(): CTOR() ";
	  SC_THREAD(init);
	  
	  SC_THREAD(read_csr_ring);
	  SC_THREAD(write_csr_ring);
	  SC_THREAD(process_ring_req);
	  LOG_DEBUG << "< PEU_CSR(): CTOR() ";
	}
	
	SC_HAS_PROCESS( peu_csr );
	
	sc_in  < sc_bv < CSR_RING_WDTH > >	ring_data_in;
	sc_out < sc_bv < CSR_RING_WDTH > >	ring_data_out;
	sc_in  < bool >			csr_if_clk;
	sc_in  < bool >	  	        rst_l;
	
	sc_event csr_init_lock;
	
	csr_if_port<CSR_ADDR_T, CSR_DATA_T>	csr_port;
	
  private:
	void read_csr_ring();
	void write_csr_ring();
	void process_ring_req();
	void init();
	
	USE_NAMESPACE(std)queue<csr_pkt*>	ring_in_q;
	USE_NAMESPACE(std)queue<csr_pkt*>	ring_out_q;
  };
  
} // namespace pcie_tl

#endif // INC_etl_hpp__
