// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ilu_intf.hpp
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
#ifndef INC_ilu_intf_hpp__
#define INC_ilu_intf_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "peu_defines.hpp"

#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/pciePacket.hpp"
#include "pcie_common/data_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"
#include "tlm.h"
USING_NAMESPACE(tlm);

#include <queue>

#define WAIT(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev); \
                     if(POR_RESET) {LOG_WARNING<<"ILU_INTF: WAIT execption thrown...";throw sc_exception();}

namespace pcie {

    class ilu_intf : public sc_module
    {
        public:
            ilu_intf ( sc_module_name module_name, sc_event *parent_global_event, uint8 *parent_global_event_type ) :
                sc_module(module_name),
                in_pkt_port("Ingress_Port"),
                req_pkt_port("Req_port"),
                cmpl_pkt_port("Completion_port"),
                cto_req_port("CTO_req_port"),
                csr_port("CSR_PORT")
            {            
                this->parent_global_event = parent_global_event;
                this->parent_global_event_type = parent_global_event_type;
                SC_METHOD(init);
                SC_THREAD(ehb_write);
                SC_THREAD(edb_write);
                SC_THREAD(ihb_read);
                SC_THREAD(idb_read);
                SC_THREAD(proc_ce_int);
                SC_THREAD(proc_ce_int_en);
                SC_THREAD(proc_ue_int);
                SC_THREAD(proc_ue_int_en);
                SC_THREAD(proc_oe_int);
                SC_THREAD(proc_oe_int_en);
                SC_THREAD(ilu_credit_update_handler);
                SC_THREAD(cto_req_handler);
                SC_THREAD(mps_handler);
                SC_THREAD(drain_handler);
                SC_THREAD(pl_drain_catcher);
                SC_THREAD(ilu_drain_catcher);
                SC_THREAD(reset_handler);
            }
            SC_HAS_PROCESS( ilu_intf);

            void ehb_write();
            void edb_write();
            void ihb_read();
            void idb_read();
            void ingress_packet_handler();
            void egress_packet_handler();
            void ilu_credit_update_handler();
            void write_error_csr(uint8, uint8, uint8, char[]);

            void proc_ce_int();
            void proc_ce_int_en();
            void proc_ue_int();
            void proc_ue_int_en();
            void proc_oe_int();
            void proc_oe_int_en();

            void cto_req_handler();
            void mps_handler();
            void drain_handler();
            void pl_drain_catcher();
            void ilu_drain_catcher();
            void reset_handler();
            void init();


            enum {OE,UE,CE};

            sc_event ce_ev;
            sc_event ce_en_ev;
            sc_uint<64> ce_err;
            sc_uint<64>	ce_int_en;
            sc_event ue_ev;
            sc_event ue_en_ev;
            sc_uint<64> ue_err;
            sc_uint<64>	ue_int_en;
            sc_event oe_ev;
            sc_event oe_en_ev;
            sc_uint<64> oe_err;
            sc_uint<64>	oe_int_en;
            sc_event dev_ctl_ev;

            sc_event drain_req_ev;

            typedef sc_bv<(P2D_IHB_DPAR_WDTH+P2D_IHB_DATA_WDTH)> ihb_entry_type;
            typedef sc_bv<(P2D_IDB_DPAR_WDTH+P2D_IDB_DATA_WDTH)> idb_entry_type;
            typedef sc_bv<(D2P_EHB_DPAR_WDTH+D2P_EHB_DATA_WDTH)> ehb_entry_type;
            typedef sc_bv<(D2P_EDB_DPAR_WDTH+D2P_EDB_DATA_WDTH)> edb_entry_type;

            ihb_entry_type  	                ihb_buffer[IHB_BUF_SIZE];
            idb_entry_type 		        idb_buffer[IDB_BUF_SIZE];

            ehb_entry_type 		        ehb_buffer[EHB_BUF_SIZE];
            edb_entry_type 		        edb_buffer[EDB_BUF_SIZE];

            sc_uint<P2D_IHB_WPTR_WDTH> 		ihb_wptr;
            bool				ihb_empty;
            bool                                drain_state;
            sc_uint<D2P_EDB_ADDR_WDTH-1>	ecd_waddr;
            sc_uint<D2P_EDB_ADDR_WDTH-1>	erd_waddr;
            sc_uint<D2P_IHB_ADDR_WDTH>	        ihb_wr_addr;
            sc_uint<D2P_IHB_ADDR_WDTH+1>	nxt_ihb_wr_addr;
            sc_uint<D2P_IDB_ADDR_WDTH>	        idb_wr_addr;
            sc_uint<D2P_IDB_ADDR_WDTH>	        nxt_idb_wr_addr;
            
            data_in_port<RefPciePacket>		in_pkt_port;
            data_out_port<RefPciePacket>	req_pkt_port;
            data_out_port<RefPciePacket>	cmpl_pkt_port;
            sc_port<tlm_get_if <sc_uint<5> > >  cto_req_port;

            csr_if_port< CSR_ADDR_T, CSR_DATA_T > csr_port;

            sc_in<bool>				clk;
            sc_in<bool>			   	rst_l;

            /** 
              IHB Interface 
             */
            sc_in<bool>				d2p_ihb_clk; 	// IHB clk
            sc_in<bool>				d2p_ihb_rd;	// Read En
            sc_in<sc_bv<D2P_IHB_ADDR_WDTH> >	d2p_ihb_addr;	// Addr
            sc_out<sc_bv<P2D_IHB_DATA_WDTH> >	p2d_ihb_data;	// Data
            sc_out<sc_bv<P2D_IHB_DPAR_WDTH> >	p2d_ihb_dpar;	// Data Parity
            sc_out<sc_bv<P2D_IHB_WPTR_WDTH> >	p2d_ihb_wptr;	// Wr Ptr (GC)

            /** 
              IDB Interface 
             */
            sc_in<bool>				d2p_idb_clk; 	// IDB clk
            sc_in<bool>				d2p_idb_rd;	// Read En
            sc_in<sc_bv<D2P_IDB_ADDR_WDTH> >	d2p_idb_addr;	// Addr
            sc_out<sc_bv<P2D_IDB_DATA_WDTH> >	p2d_idb_data;	// Data
            sc_out<sc_bv<P2D_IDB_DPAR_WDTH> >	p2d_idb_dpar;	// Data Parity

            /**
              Ingress Buffer Credit Interface
             */
            sc_in<bool>				d2p_ibc_req;	// Ingr cr req
            sc_out<bool>			p2d_ibc_ack;	// Ack
            sc_in<sc_bv<D2P_IBC_NHC_WDTH> >	d2p_ibc_nhc;	// NPH credits
            sc_in<sc_bv<D2P_IBC_PHC_WDTH> >	d2p_ibc_phc;	// PH credits
            sc_in<sc_bv<D2P_IBC_PDC_WDTH> >	d2p_ibc_pdc;	// PD credits

            /**
              Completion Timeout Interface
             */
            sc_out<bool>			p2d_cto_req; 
            sc_out<sc_bv<P2D_CTO_TAG_WDTH> >	p2d_cto_tag;
            sc_in<bool>				d2p_cto_ack;

            /**
              Status Interface 
             */
            sc_out<bool>			p2d_drain; 	// Drain signal to ILU
            sc_out<sc_bv<P2D_MPS_WDTH> >	p2d_mps;	// Max Payld size
            sc_out<bool>			p2d_ue_int;	// uncorrectable error
            sc_out<bool>			p2d_ce_int;	// correctable error
            sc_out<bool>			p2d_oe_int;	// other error

            /**
              Buffer Management Interface  (all pointer values are gray coded)
             */
            sc_in<sc_bv<D2P_ECH_WPTR_WDTH> >	d2p_ech_wptr; // Cpl buf EHB wr ptr
            sc_out<sc_bv<P2D_ECH_RPTR_WDTH> >	p2d_ech_rptr; // Cpl buf EHB rd ptr
            sc_in<sc_bv<D2P_ERH_WPTR_WDTH> >	d2p_erh_wptr; // Req buf EHB wr ptr
            sc_out<sc_bv<P2D_ERH_RPTR_WDTH> >	p2d_erh_rptr; // Req buf EHB rd ptr
            sc_out<sc_bv<P2D_ECD_RPTR_WDTH> >	p2d_ecd_rptr; // DMA cpl buf rd ptr
            sc_out<sc_bv<P2D_ERD_RPTR_WDTH> >	p2d_erd_rptr; // PIO Wr buf rd ptr

            /**
              EHB Interfce
             */
            //	sc_in<bool>				d2p_ehb_clk;  // EHB Clk
            sc_in<bool>				d2p_ehb_we;   // EHB Write
            sc_in<sc_bv<D2P_EHB_ADDR_WDTH> >	d2p_ehb_addr; // EHB Wr ptr
            sc_in<sc_bv<D2P_EHB_DATA_WDTH> >	d2p_ehb_data; // EHB record
            sc_in<sc_bv<D2P_EHB_DPAR_WDTH> >	d2p_ehb_dpar; // EHB Wd Parity

            /**
              EDB Interfce
             */
            //	sc_in<bool>				d2p_edb_clk;  // EDB Clk
            sc_in<bool>				d2p_edb_we;   // EDB Write 
            sc_in<sc_bv<D2P_EDB_ADDR_WDTH> >	d2p_edb_addr; // EDB Wr ptr
            sc_in<sc_bv<D2P_EDB_DATA_WDTH> >	d2p_edb_data; // EDB record
            sc_in<sc_bv<D2P_EDB_DPAR_WDTH> >	d2p_edb_dpar; // EDB Wd Parity

            sc_process_handle   ingress_packet_handler_ph;
            sc_process_handle   egress_packet_handler_ph;
            sc_event            *parent_global_event;          //global event
            uint8               *parent_global_event_type;     //global event type

            bool        SW_RESET;
            bool        POR_RESET;
            bool        RETRAIN_NO_RESET;
            sc_event    reset_ev;
            
            sc_uint<64> recovered_credits;

    };
}; // namespace pcie

#endif //INC_ilu_intf_hpp__
