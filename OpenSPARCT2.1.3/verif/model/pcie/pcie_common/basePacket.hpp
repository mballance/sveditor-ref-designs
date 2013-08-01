// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: basePacket.hpp
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
#ifndef INC_basePacket_hpp__
#define INC_basePacket_hpp__

#include "pcie_common/config.hpp"
#include "pcie_common/packetRefCount.hpp"
#include "pcie_common/packet.hpp"

#include <string>
#include <strstream>

namespace pcie {
  

  uint32 genUniqPacketId();
  

  class basePacket : public packet {
  public:
	basePacket() : _type("BASE_PACKET"), 
				   _id(genUniqPacketId()) 
	{ }
	basePacket(USE_NAMESPACE(std)string type) : _type(type), 
							   _id(genUniqPacketId())
	{ }
	basePacket(const basePacket& other) : _type(other._type), 
										  _id(genUniqPacketId()) 
	{ }

	uint32 getPacketId() 
	{
	  return _id;
	}

	USE_NAMESPACE(std)string getPacketType()
	{
	  return _type;
	}

	virtual ~basePacket() 
	{ }
	
	virtual const USE_NAMESPACE(std)string to_string () const 
	{
	  USE_NAMESPACE(std)strstream ts;
	  ts << _type<<" id: "<<_id;
	  return ts.str();
	}

  protected:
	
	uint32 	_id;
	USE_NAMESPACE(std)string  _type;
	
  };
  
  typedef packetRefCount<basePacket> RefBasePacket;
  
  
}

#endif //INC_basePacket_hpp__
