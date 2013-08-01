// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr_arb.hpp
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
#ifndef INC_csr_arb_hpp__
#define INC_csr_arb_hpp__

#include "pcie_common/config.hpp"
#include <queue>

USING_NAMESPACE(std);
using std::pair;

#include "tlm.h"
using tlm::tlm_transport_if;
using tlm::tlm_slave_if;

namespace pcie
{
    template < typename REQ , typename RSP , int N =1>
        class csr_arb : public sc_module
        {
            public:
                typedef sc_port< tlm_slave_if< REQ , RSP > > port_type;

                port_type master_port[N];

                sc_port< tlm_transport_if< REQ , RSP > , 1 > slave_port;

                sc_in< bool >	csr_clock;

                SC_HAS_PROCESS( csr_arb );

                csr_arb( sc_module_name module_name ,
                        const sc_time &t = sc_time( 1 , SC_NS ) ) :
                    sc_module( module_name ) ,
                    slave_port("slave_port") ,
                    arb_t( t ) 
                    {
                        LOG_DEBUG << "csr_arb()";
                        SC_THREAD( run );
                    }

                void add_interface( port_type *port , const int priority ) {
                    if_map.insert( multimap_type::value_type( priority , port ) );
                }

            protected:
                typedef multimap< int , port_type * > multimap_type;
                multimap_type if_map;

                typedef struct {
                    REQ	req;
                    port_type *port;
                } req_port_type;

                queue < req_port_type* > event_q, read_q, write_q;

                sc_time arb_t;

                virtual void run() {
                    req_port_type *next_rp;
                    RSP rsp;
                    LOG_DEBUG << "csr_arb::run()";
                    for( ;; ) {
                        wait( csr_clock.posedge_event() );

                        gather_requests ();
                        // Process setup requests
                        while (!event_q.empty()) {
                            next_rp = event_q.front();
                            event_q.pop();
                            //LOG_DEBUG << "Calling Event Req : " << next_rp->port->name();
                            rsp = slave_port->transport((next_rp->req));
                            //LOG_DEBUG << "Putting Event Req : " << next_rp->port->name();
                            (*(next_rp->port))->put(rsp);
                            //LOG_DEBUG << "Putting Event Req (done): " << next_rp->port->name();
                            delete next_rp;
                            //LOG_DEBUG << "Delete ReqPacket";	   
                        }
                        while (!write_q.empty()) {
                            next_rp = write_q.front();
                            write_q.pop();
                            //LOG_DEBUG << "Calling Write Req";
                            rsp = slave_port->transport((next_rp->req));
                            //LOG_DEBUG << "Putting Write Req";
                            (*(next_rp->port))->put(rsp);
                            delete next_rp;
                            //LOG_DEBUG << "Delete ReqPacket";	   

                        }
                        while (!read_q.empty()) {
                            next_rp = read_q.front();
                            read_q.pop();
                            //LOG_DEBUG << "Calling Read Req";
                            rsp = slave_port->transport((next_rp->req));
                            //LOG_DEBUG << "Putting Read Req";
                            (*(next_rp->port))->put(rsp);
                            delete next_rp;
                            //LOG_DEBUG << "Delete ReqPacket";	   
                        }
                    }//end for(;;)
                }//end run()

                virtual void gather_requests () {
                    multimap_type::iterator i;
                    port_type *p;
                    REQ  req;
                    req_port_type *rp;

                    for (i = if_map.begin(); i != if_map.end(); ++i) {
                        p = (*i).second;
                        if ( (*p)->nb_get(req) ) {
                            rp = new req_port_type;
                            //LOG_DEBUG << "NEW ReqPacket";
                            rp->req = req;
                            rp->port = p;

                            switch (rp->req._cmd) {
                                case CSR_RESET:
                                    LOG_DEBUG << "CSR_RESET : " << rp->port->name();
                                    event_q.push(rp);
                                    break;
                                case CSR_CREATE:
                                    LOG_DEBUG << "CSR_CREATE : " << rp->port->name();
                                    event_q.push(rp);
                                    break;
                                case CSR_SETEVENT:
                                    LOG_DEBUG << "CSR_SETEVENT : " << rp->port->name();
                                    event_q.push(rp);
                                    break;
                                case CSR_ISMAPPED:
                                    LOG_DEBUG << "CSR_ISMAPPED: " << rp->port->name();
                                    read_q.push(rp);
                                    break;		  
                                case CSR_READ:
                                    LOG_DEBUG << "CSR_READ: " << rp->port->name();
                                    read_q.push(rp);
                                    break;
                                case CSR_WRITE:
                                    LOG_DEBUG << "CSR_WRITE : " << rp->port->name();
                                    write_q.push(rp);
                                    break;
                                case CSR_WRITE_MASK:
                                    LOG_DEBUG << "CSR_WRITE_FIELD : " << rp->port->name();
                                    write_q.push(rp);
                                    break;
                            }
                        } 
                    }
                }//end gather_requests()
        };
};
#endif //INC_csr_arb_hpp__
