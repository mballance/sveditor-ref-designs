// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_csr.cpp
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
#include "peu_csr.hpp"
#include "pcie_common/logger.hpp"

namespace pcie {

  /// Init start the CSR Ring intf
  void peu_csr::init(void) {
	ring_data_out.write(0x00);
	csr_port.create_csr_db();
	for ( ; ; ) {
	  ring_data_out.write(0x00);
	  LOG_DEBUG << "PEU_CSR::CREATE CSR()\n";
	  csr_port.reset_csr_db();
	  LOG_DEBUG << "PEU_CSR::CREATE CSR() DONE\n";
	  
	  wait (rst_l.posedge_event());
	}
  }

  /// Read the incoming CSR ring request packet
  void peu_csr::read_csr_ring(void) {
	
	csr_pkt *nxt_rng_req;
	sc_uint<CSR_RING_WDTH>   data_in;
	
	for ( ; ; ) {
	  
	  wait (csr_if_clk.negedge_event());
	  data_in = ring_data_in.read().to_uint();
	  if (data_in(CSR_RING_CMND_BITS) != 0) {
		
		/// Read CSR Ring cycle 1
		nxt_rng_req = new csr_pkt;
		nxt_rng_req->cmd = data_in(CSR_RING_CMND_BITS);
		nxt_rng_req->srcb = data_in(CSR_RING_SRCB_BITS);
		nxt_rng_req->addr = data_in(CSR_RING_ADDR_BITS);
		
		/// Read CSR Ring cycle 2
		wait (csr_if_clk.negedge_event());
		data_in = ring_data_in.read();
		nxt_rng_req->data(CSR_RDMS_BITS) = data_in;
		
		/// Read CSR Ring cycle 3
		wait (csr_if_clk.negedge_event());
		data_in = ring_data_in.read();
		nxt_rng_req->data(CSR_RDLS_BITS) = data_in;
		
		LOG_DEBUG << "CSR Ring In: " 
				  << ((nxt_rng_req->cmd == CSR_CMND_WREQ) ?  "WRITE: " :
					  (nxt_rng_req->cmd == CSR_CMND_RREQ) ?  "READ: " : "UnKnown Cmd:" )
				  << ", Addr: " << nxt_rng_req->addr
				  << ", SrcBus: " << nxt_rng_req->srcb << ", Data: " << nxt_rng_req->data;
		ring_in_q.push(nxt_rng_req);
	  }
	} // for ever
  } // peu_csr::read_csr_ring
  

  /// Write the CSR Ring packet on the out bus
  void peu_csr::write_csr_ring(void) {
	
	csr_pkt* rng_rsp;
	sc_uint<CSR_RING_WDTH>   data_out;
	
	for ( ; ; ) {
	  wait (csr_if_clk.posedge_event());
	  
	  if (!(ring_out_q.empty())) {
		rng_rsp = ring_out_q.front();
		ring_out_q.pop();
		LOG_DEBUG << "CSR Ring Out: " 
				  << ((rng_rsp->cmd == CSR_CMND_WREQ) ?  "WRITE: " :
					  (rng_rsp->cmd == CSR_CMND_RREQ) ?  "READ: " : 
					  (rng_rsp->cmd == CSR_CMND_RRSP) ?  "READ RSP: " : 
					  (rng_rsp->cmd == CSR_CMND_WRSP) ?  "WRITE RSP: " : "UnKnown CMD")
				  << ", Addr: " << rng_rsp->addr
				  << ", SrcBus: " << rng_rsp->srcb << ", Data: " << rng_rsp->data;
		
		data_out(CSR_RING_CMND_BITS) = rng_rsp->cmd;
		data_out(CSR_RING_SRCB_BITS) = rng_rsp->srcb;
		data_out(CSR_RING_ADDR_BITS) = rng_rsp->addr;
		ring_data_out.write(data_out);
		
		wait (csr_if_clk.posedge_event());
		data_out = rng_rsp->data(CSR_RDMS_BITS);
		ring_data_out.write(data_out);
		
		wait (csr_if_clk.posedge_event());
		data_out = rng_rsp->data(CSR_RDLS_BITS);
		ring_data_out.write(data_out);
		
		data_out = 0x0;
		wait (csr_if_clk.posedge_event());
		ring_data_out.write(data_out);
		delete rng_rsp;
		
	  }
	}
  } // write_csr_ring()


  void peu_csr::process_ring_req() {
	
	csr_pkt *nxt_req;
	csr_pkt *nxt_rsp;
	
	LOG_DEBUG << "> PEU_CSR:: process_ring_req()";
	
	for ( ; ; ) {
	  wait (csr_if_clk.negedge_event());
	  if (!(ring_in_q.empty())) {
		nxt_req = ring_in_q.front();
		ring_in_q.pop();
		nxt_rsp = new csr_pkt;
		nxt_rsp->is_rsp = true;
		nxt_rsp->cmd = nxt_req->cmd;
		nxt_rsp->srcb = nxt_req->srcb;
		nxt_rsp->addr = nxt_req->addr;
		nxt_rsp->data = nxt_req->data;
		ring_out_q.push(nxt_req);
		
		switch (nxt_rsp->cmd) {
		case CSR_CMND_WREQ:
		  if (csr_port.is_mapped(nxt_rsp->addr)) {
			nxt_rsp->data = csr_port.write_csr(nxt_rsp->addr, nxt_rsp->data); 
			nxt_rsp->cmd = CSR_CMND_WRSP;
			ring_out_q.push(nxt_rsp);
		  }
		  break;
		  
		case CSR_CMND_RREQ:
		  if (csr_port.is_mapped(nxt_rsp->addr)) {
			nxt_rsp->data = csr_port.read_csr(nxt_rsp->addr); 
			nxt_rsp->cmd = CSR_CMND_RRSP;
			ring_out_q.push(nxt_rsp);
		  }
		  break;
		default:
		  LOG_WARNING << "CSR Packet with Unsupported CMD: " << nxt_rsp->cmd;
		}
	  }
	}
  } // process_ring_req()

} // namespace pcie
