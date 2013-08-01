// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_top.hpp
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
#ifndef INC_pcie_top_hpp__
#define INC_pcie_top_hpp__

#include <systemc.h>
#ifdef LINK_8
#define LINK_WIDTH 8 // This is a temporary arrangement
#endif
#ifdef LINK_1
#define LINK_WIDTH 1
#endif
#ifdef LINK_2
#define LINK_WIDTH 2
#endif

#ifdef LINK_4
#define LINK_WIDTH 4
#endif

#ifdef LINK_12
#define LINK_WIDTH 12
#endif

#ifdef LINK_16
#define LINK_WIDTH 16
#endif

#ifdef LINK_24
#define LINK_WIDTH 24
#endif

#ifdef LINK_32
#define LINK_WIDTH 32
#endif

#include "pcie_common/config.hpp"

#include "tl_top.hpp"
#include "dll_top.hpp"
#include "pl_top.h"
#include "pcie_common/pciePacket.hpp"
#include "pcie_common/tlm/tlm_data_channel.hpp"

USING_NAMESPACE(pcie);

class pcie_top : public sc_module
{
    public:
        typedef tlm_data_channel< RefPciePacket > data_channel;  

        pcie_top(sc_module_name module_name, sc_event *parent_global_event, uint8 *parent_global_event_type) :
            sc_module (module_name)
        {            
            this->parent_global_event = parent_global_event;
            this->parent_global_event_type = parent_global_event_type;

            LOG_DEBUG << " < PCIE_TOP ()";
            pl = new pl_top("PL_Top");
            tl = new tl_top("TL_Top",parent_global_event,parent_global_event_type);
            dll = new dll_top("DLL_Top",parent_global_event,parent_global_event_type);

            tl_dl_data_chnl = new data_channel("TL_DL_Data_Chnl", parent_global_event,parent_global_event_type, 256);
            dl_tl_data_chnl = new data_channel("DL_TL_Data_Chnl", parent_global_event,parent_global_event_type, 256);
            pl_dl_data_chnl = new data_channel("PL_DL_Data_Chnl", parent_global_event,parent_global_event_type, 256);
            dl_pl_dllp_data_chnl = new data_channel("DL_PL_DLLP_Data_Chnl", parent_global_event,parent_global_event_type, 256);
            dl_pl_tlp_data_chnl = new data_channel("DL_PL_TLP_Data_Chnl", parent_global_event,parent_global_event_type, 256);

            tl->etl_data_port(*tl_dl_data_chnl);
            dll->tl_dll_in(*tl_dl_data_chnl);

            tl->itl_data_port(*dl_tl_data_chnl);
            dll->dll_tl_out(*dl_tl_data_chnl);

            dll->dll_pl_dllp_out(*dl_pl_dllp_data_chnl);
            pl->dll_pl_dllp_in(*dl_pl_dllp_data_chnl);

            dll->dll_pl_tlp_out(*dl_pl_tlp_data_chnl);
            pl->dll_pl_tlp_in(*dl_pl_tlp_data_chnl);

            dll->pl_dll_in(*pl_dl_data_chnl);
            pl->pl_dll_out(*pl_dl_data_chnl);

            // Inputs from the deserializer
            pl->deser_data0(deser_data0);
            pl->deser_data1(deser_data1);
            pl->deser_data2(deser_data2);
            pl->deser_data3(deser_data3);
            pl->deser_data4(deser_data4);
            pl->deser_data5(deser_data5);
            pl->deser_data6(deser_data6);
            pl->deser_data7(deser_data7);
            pl->deser_data8(deser_data8);
            pl->deser_data9(deser_data9);
            pl->deser_data0_b(deser_data0_b);
            pl->deser_data1_b(deser_data1_b);
            pl->deser_data2_b(deser_data2_b);
            pl->deser_data3_b(deser_data3_b);
            pl->deser_data4_b(deser_data4_b);
            pl->deser_data5_b(deser_data5_b);
            pl->deser_data6_b(deser_data6_b);
            pl->deser_data7_b(deser_data7_b);
            pl->deser_data8_b(deser_data8_b);
            pl->deser_data9_b(deser_data9_b);
            pl->frm_boundary_deser(frm_boundary_deser);
            pl->disable_scrambling(disable_scrambling);
            pl->link_clk(link_clk);
            pl->init_done(init_done);
            pl->init_done_rx(init_done_rx);

            //  Outputs to the serializer
            pl->encoded_data0(encoded_data0);
            pl->encoded_data1(encoded_data1);
            pl->encoded_data2(encoded_data2);
            pl->encoded_data3(encoded_data3);
            pl->encoded_data4(encoded_data4);
            pl->encoded_data5(encoded_data5);
            pl->encoded_data6(encoded_data6);
            pl->encoded_data7(encoded_data7);
            pl->encoded_data8(encoded_data8);
            pl->encoded_data9(encoded_data9);
            pl->sym_boundary(sym_boundary);

            dll->PhysicalLinkUp(link_up);
            pl->PhysicalLinkUp(link_up);
            LOG_DEBUG << " > PCIE_TOP ()";
        }

        ~pcie_top(){
            delete pl;
            delete tl;
            delete dll;
            delete tl_dl_data_chnl;
            delete dl_tl_data_chnl;
            delete dl_pl_dllp_data_chnl;
            delete dl_pl_tlp_data_chnl;
            delete pl_dl_data_chnl;
        }

        //private:
        pl_top			*pl;
        tl_top			*tl;
        dll_top			*dll;
        data_channel	*tl_dl_data_chnl;
        data_channel 	*dl_tl_data_chnl;
        data_channel 	*dl_pl_dllp_data_chnl;
        data_channel 	*dl_pl_tlp_data_chnl;
        data_channel 	*pl_dl_data_chnl;
                
        sc_signal<bool>	link_up;

        sc_in<sc_lv<LINK_WIDTH> > 	deser_data0;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data1;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data2;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data3;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data4;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data5;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data6;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data7;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data8;
        sc_in<sc_lv<LINK_WIDTH> > 	deser_data9;

        sc_in<sc_lv<LINK_WIDTH> >   deser_data0_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data1_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data2_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data3_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data4_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data5_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data6_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data7_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data8_b;
        sc_in<sc_lv<LINK_WIDTH> >   deser_data9_b;
        sc_out<bool > 				sym_boundary;
        sc_in<bool>                 disable_scrambling;
        sc_in<bool>                 link_clk;
        sc_in<bool>                 init_done;
        sc_in<bool>                 init_done_rx;

        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data0;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data1;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data2;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data3;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data4;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data5;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data6;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data7;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data8;
        sc_out<sc_lv<LINK_WIDTH> > 	encoded_data9;
        sc_in<bool> 				frm_boundary_deser;

        sc_event *parent_global_event;
        uint8 *parent_global_event_type;
};

//} // namespace pcie

#endif // INC_pcie_top_hpp__
