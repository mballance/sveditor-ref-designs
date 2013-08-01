// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: data_port.hpp
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
#ifndef INC_data_port_hpp__
#define INC_data_port_hpp__

#include <systemc.h>

#include "pcie_common/packet_if.hpp"
#include "pcie_common/logger.hpp"

#include "tlm.h"
#include "pcie_common/pciePacket.hpp"
namespace pcie {
  USING_NAMESPACE(tlm);
  USING_NAMESPACE(Logger);

  /** In port interface receive the Packet information */
  template< typename PACKET, int N = 1 >
  class data_in_port : public sc_port< packet_in_if < PACKET >, N >
  {
  public:
	typedef packet_in_if < PACKET > if_type;
	
	data_in_port( const char* port_name ) : sc_port< if_type, N > (port_name) 
	{
	}

	/// Blocking interface to get the next packet over the intf
	virtual int get_packet(PACKET &p) {
	  
	  int rt_val = (*this)->get_packet(p);
	  if (rt_val == 0) {
		RefPciePacket pref;
		pref  = (RefPciePacket) p; 
		LOG_DEBUG << "GET_PACKET on Channel : " << name() << "PktId= " << pref->to_string() << "\n"; 
	  } else {
		//		throw sc_exception();
		return rt_val;
	  }
	  return rt_val;
	}

	/// Non blocking interface to get the next packet over the intf
	virtual bool get_packet_nb(PACKET &p) {
	  

	  return (*this)->get_packet_nb(p);
	}

	/// Returns true if next packet is ready on the interface to get 
	virtual bool is_packet_ready() {
	  //		return (*this)->nb_can_get();
	  return (*this)->is_packet_ready();
	}
  };
  
  
  /** In port interface receive the Packet information */
  template< typename PACKET, int N = 1 >
  class data_out_port : public sc_port< packet_out_if< PACKET > , N > 

  {
  public:
	typedef packet_out_if < PACKET > if_type;
	
	data_out_port( const char* port_name ) : sc_port< if_type, N > (port_name) 
	{
	}

	/// Blocking interface to send a packet over the intf
	virtual int send_packet(const PACKET &p) {
	  
	  RefPciePacket pref;
	  pref  = (RefPciePacket) p; 
	  LOG_DEBUG << "SEND_PACKET on Channel : " << name() << " Packet : " << pref->to_string() << "\n";
	  //		(*this)->put(p);
	  return (*this)->send_packet(p);
	}
        
	/// Purges data channel                                           
	virtual void purge_channel() {
          (*this)->purge_channel();
	  return ;
	}
  };
  
} // namespace pcie

#endif // INC_data_port_hpp__
