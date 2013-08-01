// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlm_data_channel.hpp
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
#ifndef INC_tlm_data_channel_hpp__
#define INC_tlm_data_channel_hpp__

#include <systemc.h>

#include "pcie_common/logger.hpp"
#include "pcie_common/packet_if.hpp"

namespace pcie {

  USING_NAMESPACE(Logger)

	template < typename DATA >
  class tlm_data_channel : public packet_if <DATA>, public sc_module
  {
  public:
	/**
	 *  This channel constructor is used for reset-able modules. This makes access to the
	 *  data channel non-blocking.
	 */
	tlm_data_channel(sc_event *parent_global_ev, uint8 *global_event_type, int fifo_size = 256) :
	  sc_module( sc_module_name( sc_gen_unique_name("tlm_data_channel") ) ) ,
	  in_reset(false),
	  data_fifo( fifo_size )
	{
	  this->global_ev = parent_global_ev;
	  this->global_event_type = global_event_type;
	  LOG_INFO << "TLM Data Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  SC_THREAD(reset);
	}

	tlm_data_channel( sc_module_name module_name ,
					  sc_event *parent_global_ev, uint8 *global_event_type, int fifo_size = 256) :
	  sc_module( module_name ) ,
	  in_reset(false),
	  data_fifo( fifo_size ) 
	{
	  this->global_ev = parent_global_ev;
	  this->global_event_type = global_event_type;
	  LOG_INFO << "TLM Data Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  SC_THREAD(reset);
	}

	tlm_data_channel( int fifo_size = 256) :
	  sc_module( sc_module_name( sc_gen_unique_name("tlm_data_channel") ) ) ,
	  in_reset(false),
	  data_fifo( fifo_size )
	{
	  this->global_ev=&dummy;
	  LOG_INFO << "TLM Data Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  SC_THREAD(reset);
	}

	tlm_data_channel( sc_module_name module_name ,
					  int fifo_size = 256) :
	  sc_module( module_name ) ,
	  in_reset(false),
	  data_fifo( fifo_size ) 
	{
	  this->global_ev=&dummy;
	  LOG_INFO << "TLM Data Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  SC_THREAD(reset);
	}

	/** 
	 * Blocking interface Returns packet from the channel 
	 * Throws an exception if the channel is in reset
	 */
	int get_packet(DATA &p) {
	  if (in_reset) {
		throw sc_exception();
	  }
	  if (data_fifo.nb_can_get()) {
		p = data_fifo.get();
		return 0;
	  } else {
		wait (data_fifo.ok_to_get() | local_ev);
		if (in_reset) {
		  throw sc_exception();
		}
		p = data_fifo.get();
		return 0;
	  }
	  return 0;
	}

	bool get_packet_nb(DATA &p) {
	  if (!in_reset) {
		return data_fifo.nb_get(p);
	  } else {
		LOG_DEBUG<<"DEBUG: TLM data channel throwing an exception";
		throw sc_exception();
	  }
	  return false;
	}

	bool is_packet_ready() {
	  if (!in_reset) {
		return data_fifo.nb_can_get();
	  } 
	  return false;
	}

	int send_packet(const DATA &p) {
	  if (in_reset) {
		throw sc_exception();
	  }
	  if (data_fifo.nb_can_put()) {
		data_fifo.put(p);
		return 0;
	  } else {
		wait (data_fifo.ok_to_put() | local_ev);
		if (in_reset) {
		  throw sc_exception();
		}
		data_fifo.put(p);
	  }
	  return 0;
	}

        void purge_channel(){
            while(data_fifo.nb_can_get()) data_fifo.get();
        }

	SC_HAS_PROCESS( tlm_data_channel );

  protected:

	bool	in_reset;               ///< flag indicates that this channel is in reset
	tlm_fifo<DATA> data_fifo;       
	sc_event *global_ev;            ///< Global event pointer
	sc_event local_ev;              ///< local reset event to prevent channel blocking
	uint8    *global_event_type;    ///< Global event type 
	sc_event dummy;

	void reset () {
	  while (true) {
		wait (*global_ev);
		switch (*global_event_type) {

		case POR_RESET_ENTER:
		case WMR_RESET_ENTER:
		  LOG_WARNING<<"TLM DATA Channel " << name() << " IN reset";
		  in_reset = true;
		  local_ev.notify();
		  while(data_fifo.nb_can_get()) data_fifo.get();
		  break;

		case SW_RESET_CHNL_EXIT:
		  LOG_INFO<<"TLM DATA Channel " << name() << " OUT reset";
		  local_ev.notify();
		  in_reset = false;
		  break;
		}
	  }
	}

	void init () {
	}
  };
}
#endif
