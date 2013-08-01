// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: packetRefCount.hpp
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
#ifndef INC_packetRefCount_hpp__
#define INC_packetRefCount_hpp__

#include <iostream.h>
# include "pcie_common/config.hpp"

namespace pcie {

  class packet;

  struct packetRef
  {
	packet* const ptr;
	unsigned int count;
	uint32 ref_id;
	static int ref_id_ctr;

	packetRef(packet* p);
	~packetRef();
	packetRef* increment()
	{
	  ++count;
	  return this;
	}
	bool decrement()
	{
	  return (--count==0);
	}
   
	static packetRef* getRef(const packet* p);
 
	private:
	packetRef( const packetRef& );
	packetRef& operator=( const packetRef& );
  };
 

  template<class T>
	class packetRefCount
	{
	private:
	  packetRef* ref;

	public:
	  packetRefCount(const packet* p=0)
		: ref(p ? packetRef::getRef(p) : 0)
		{
		}
	  packetRefCount(const packetRefCount<T>& other)
		: ref(other.ref ? other.ref->increment() : 0)
		{
		}
	  ~packetRefCount()
		{
		  if (ref && ref->decrement()) {
			delete ref;
		  }
		}
	  packetRefCount<T>& operator=(packet* other)
		{
		  packetRef* tmp = packetRef::getRef(other);

		  if (ref && ref->decrement()) {

			delete ref;
		  }
		  ref=tmp;

		  return *this;
		}
	  packetRefCount<T>& operator=(const packetRefCount<T>& other)
		{
		  if( other.ref != ref )
			{
			  packetRef* tmp = other.ref ? other.ref->increment() : 0;

			  if (ref && ref->decrement()) {
				delete ref;
			  }

			  ref=tmp;
			}
		  return *this;
		}

	  operator T* ()  const { return ref ? static_cast<T*>(ref->ptr) : 0; }
	  T* operator->() const { return ref ? static_cast<T*>(ref->ptr) : 0; }
	  T* get()        const { return ref ? static_cast<T*>(ref->ptr) : 0; }
	};

  typedef packetRefCount<packet> RefPacket;

}

#endif //INC_packetRefCount_hpp__
