// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_if.hpp
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
#ifndef INC_csr_if_hpp__
#define INC_csr_if_hpp__

#include <systemc.h>

namespace pcie {
  /** CSR Interface definition */
  template < typename ADDR, typename DATA >
  class csr_if
  {
  public:
	
	virtual bool is_mapped(const ADDR reg_addr) = 0;  /// return true if the reg_addr is mapped on the CSR DB
	virtual DATA read_csr(const ADDR reg_addr) = 0;   /// returns the current CSR value
	virtual DATA write_csr(const ADDR reg_addr, const DATA wr_val) = 0;  /// Overwrites the CSR value with new wr_val and the write_mask
	virtual DATA write_csr_mask(const ADDR reg_addr, const DATA wr_val, const DATA fld_mask) = 0;  /// Writes only the bits enabled by the fld_mask
	virtual void set_notify_event(ADDR reg_addr, sc_event* event_handle) = 0;  /// Registers an event handle to be notified, when the given CSR value changes
	virtual void reset_csr_db() = 0;  /// Reset the CSR values to power on values
	virtual void create_csr_db() = 0;  /// Create the new CSR DB with default values
  };

  
  typedef enum {CSR_READ, CSR_WRITE, CSR_WRITE_MASK, CSR_SETEVENT, CSR_ISMAPPED, CSR_RESET, CSR_CREATE} CSR_CMD;

  template < typename ADDR, typename DATA >
  class csr_req {
  public:
	CSR_CMD	_cmd;
	ADDR	_addr;
	DATA	_data;
	DATA    _fld_mask;
	sc_event *_event;
	bool	_read_clear;
  };
  
  template <typename DATA> 
  class csr_rsp {
  public:
	DATA	_data;
	bool	_is_mapped;
  };
};


#endif // INC_csr_if_hpp__
