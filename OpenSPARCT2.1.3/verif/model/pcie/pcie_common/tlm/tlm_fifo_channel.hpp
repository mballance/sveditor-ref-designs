// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlm_fifo_channel.hpp
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
#ifndef INC_tlm_fifo_channel_hpp__
#define INC_tlm_fifo_channel_hpp__

#include <systemc.h>

#include "pcie_common/logger.hpp"


namespace tlm {

  USING_NAMESPACE(Logger)

  template < typename DATA >
  class tlm_fifo_channel : public sc_module
  {
  public:
	// uni-directional destination Interface
	
	sc_export< tlm_fifo_get_if< DATA > > get_data_export;
	
	// uni-directional initiator interface
	
	sc_export< tlm_fifo_put_if< DATA > > put_data_export;
	
	tlm_fifo_channel( int fifo_size = 256 ) :
	  sc_module( sc_module_name( sc_gen_unique_name("tlm_fifo_channel") ) ) ,
	  data_fifo( fifo_size )
	{
	  LOG_INFO << "TLM Fifo Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  bind_exports();
	}

	tlm_fifo_channel( sc_module_name module_name ,
					  int fifo_size = 256 ) :
	  sc_module( module_name  ) ,
	  data_fifo( fifo_size ) 
	{

	  LOG_INFO << "TLM Fifo Channel: " << name() 
			   << " Init with fifo size " << fifo_size << "\n";
	  bind_exports();
	  
	}

  private:
	void bind_exports() {

	  put_data_export( data_fifo );
    
	  get_data_export( data_fifo );

	}

  protected:

	tlm_fifo<DATA> data_fifo;
  };

}
#endif
