// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: csr.hpp
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

#ifndef INC_csr_hpp__
#define INC_csr_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"

#include "pcie_common/csr_if.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"
#include "csr_base_if.hpp"

#include <map>
#include <list>
#define MAX_NOTIFY_EVENTS 50

namespace pcie {

    typedef sc_event* sc_event_handle;

    /// CSR Data Element
    template <typename DATA>
        class csr_data {
            public:
                DATA  	        val;
                sc_event_handle events[MAX_NOTIFY_EVENTS];
                uint32		num_events;

                csr_data() : val(0), num_events(0) {};
        };

    typedef enum {READ_ONLY, READ_WRITE, WRITE1_SET, WRITE1_CLEAR} intf_type_t;
    enum {POR_L, RST_L};

    template <typename DATA>
        class csr_data_intf {
            public:
                csr_data<DATA>  *data;
                DATA			rd_mask;
                DATA			wr_mask;
                DATA			clr_mask;
                DATA			set_mask;
                DATA			toggle_mask;
                DATA			por_val;
                intf_type_t		intf_type;
                bool                    sw_reset_val_hold;
                //All error and log registers should have this set to true

                csr_data_intf () {
                    data = NULL;
                    sw_reset_val_hold=true;
                    intf_type = READ_WRITE;
                }

                /**
                 *  This method resets the value of the CSR entry based on the type of the reset
                 *  and warm reset behavior specification
                 */
                DATA reset_data(uint8 rst_type){
                    if(rst_type==POR_L || (rst_type==RST_L && !sw_reset_val_hold)) {
                        data->val = por_val; 
                        for (uint32 i = 0; i < data->num_events; i++) {
                            notify (*(data->events[i]));
                        }
                    }
                    return data->val;
                }
        };


    template < typename ADDR, typename DATA>
        class csr : public sc_module,
                    public virtual csr_base_if <ADDR, DATA>
        {
            public:
                typedef tlm_transport_if <csr_req < ADDR, DATA > ,
                        csr_rsp < DATA > > if_type;
                csr(sc_module_name module_name, sc_event *parent_global_event, uint8 *parent_global_event_type, int N = 10) :
                    sc_module (module_name),
                    target_port("csr_target_port")
                {
                    target_port(*this);
                    this->parent_global_event = parent_global_event;
                    this->parent_global_event_type = parent_global_event_type;
                    SC_THREAD(reset_handler);
                    rst_type=POR_L;
                }

                SC_HAS_PROCESS(csr);

                /**
                 *  This method checks if the specified CSR address is present in the CSR database.
                 */
                bool is_mapped (const ADDR reg_addr) {
                    if (csr_db[reg_addr] == NULL) {
                        return false;
                    }
                    return true;
                }

                /**
                 *  This method returns the data stored at the requested address.
                 */
                DATA read_csr (const ADDR reg_addr) {
                    if (csr_db[reg_addr] == NULL) {
                        LOG_ERROR << "Read_CSR address not mapped  " << reg_addr;
                        return DATA(0);
                    }
                    DATA rd_data = csr_db[reg_addr]->data->val & csr_db[reg_addr]->rd_mask;
                    return rd_data;
                }

                /**
                 *  This method updates the value at the specified address, based on the type of interface
                 *  for that CSR data element.
                 */
                DATA write_csr(const ADDR reg_addr, const DATA wr_val) {
                    if (csr_db[reg_addr] == NULL) {
                        LOG_ERROR << "WRITE_CSR address not mapped  " << reg_addr;
                        return DATA(0);
                    }
                    if(POR_RESET){
                        return csr_db[reg_addr]->data->val;
                    }
                    DATA new_val;
                    new_val = wr_val & csr_db[reg_addr]->rd_mask;
                    if (csr_db[reg_addr]->intf_type == WRITE1_CLEAR) {
                        LOG_DEBUG << "write_csr for a WRITE1_CLEAR type intf, addr: " << reg_addr ;
                        LOG_DEBUG << " new_val: " << new_val << " data->val: " << csr_db[reg_addr]->data->val << " clr_mask: " << csr_db[reg_addr]->clr_mask;
                        new_val = new_val & csr_db[reg_addr]->clr_mask;
                        new_val = new_val & csr_db[reg_addr]->data->val;
                        new_val ^= csr_db[reg_addr]->data->val;
                        csr_db[reg_addr]->data->val = new_val;
                    } else if (csr_db[reg_addr]->intf_type == WRITE1_SET) {
                        LOG_DEBUG << "write_csr for a WRITE1_SET type intf, addr: " << reg_addr ;
                        LOG_DEBUG << " new_val: " << new_val << " data->val: " << csr_db[reg_addr]->data->val << " set_mask: " << csr_db[reg_addr]->set_mask;
                        new_val = new_val & csr_db[reg_addr]->set_mask;
                        new_val |= csr_db[reg_addr]->data->val;
                        csr_db[reg_addr]->data->val = new_val;
                    } else {
                        LOG_DEBUG << "write_csr for a READ_WRITE type intf, addr: " << reg_addr ;
                        LOG_DEBUG << " new_val: " << new_val << " data->val: " << csr_db[reg_addr]->data->val << " clr_mask: " << csr_db[reg_addr]->clr_mask;
                        LOG_DEBUG << " (csr_db[reg_addr]->clr_mask & new_val): " << (csr_db[reg_addr]->clr_mask & new_val) ;
                        csr_db[reg_addr]->data->val = (((csr_db[reg_addr]->data->val & ~csr_db[reg_addr]->wr_mask) ^ (csr_db[reg_addr]->clr_mask & new_val & csr_db[reg_addr]->data->val)) | (new_val & csr_db[reg_addr]->wr_mask));
                        //Original version: csr_db[reg_addr]->data->val = ((csr_db[reg_addr]->data->val & ~csr_db[reg_addr]->wr_mask) | (new_val & csr_db[reg_addr]->wr_mask));
                    }
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    return csr_db[reg_addr]->data->val;
                }

                /**
                 *  This method updates the value at the specified address using the specified mask, 
                 *  based on the tyep of interface for that CSR data element.
                 */
                DATA write_csr_mask(const ADDR reg_addr, const DATA wr_val, const DATA field_mask) {

                    if (csr_db[reg_addr] == NULL) {
                        LOG_ERROR << "WRITE_CSR_mask address not mapped  " << reg_addr;
                        return DATA(0);
                    }
                    if(POR_RESET){
                        return csr_db[reg_addr]->data->val;
                    }
                    DATA new_val;
                    new_val =  csr_db[reg_addr]->data->val & csr_db[reg_addr]->rd_mask;
                        LOG_DEBUG << " new_val: " << new_val << " data->val: " << csr_db[reg_addr]->data->val << " field_mask: " << field_mask;
                    new_val = (new_val & ~field_mask) | wr_val;
                        LOG_DEBUG << " new_val: " << new_val ;
                    csr_db[reg_addr]->data->val = new_val;
                        LOG_DEBUG << " data->val: " << csr_db[reg_addr]->data->val ;
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }
                    return csr_db[reg_addr]->data->val;
                }

                /** 
                 *  This method registers event notifications with the specified CSR address.
                 */
                void set_notify_event(ADDR reg_addr, sc_event* event_handle){
                    LOG_DEBUG << "Set_Notify_Event (Addr: " << reg_addr
                        << ", EvHandle " << uint64(event_handle) << ")";

                    if (csr_db[reg_addr] == NULL) {
                        LOG_ERROR << "Address " << reg_addr << " not mapped on this addres space";
                        exit(0);
                    }
                    csr_db[reg_addr]->data->events[csr_db[reg_addr]->data->num_events++] = event_handle;
                }	  

                /**
                 *  This method populates the CSR database with the required CSRs and their
                 *  desired characteristics.
                 */
                void create_csr_db() {
                    ADDR reg_addr;

                    LOG_DEBUG << "Create CSR DB";
                    POR_RESET=false;

                    reg_addr = PEU_CSR_A_TLU_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_CTL_POR_VALUE;
                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_CTL_POR_VALUE;
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_CTL_POR_VALUE;
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_STS_POR_VALUE;
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_STS_POR_VALUE;
                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TRN_OFF_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TRN_OFF_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TRN_OFF_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TRN_OFF_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TRN_OFF_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TRN_OFF_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TRN_OFF_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TRN_OFF_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TRN_OFF_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TRN_OFF_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TRN_OFF_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TRN_OFF_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TRN_OFF_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TRN_OFF_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TRN_OFF_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TRN_OFF_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ICI_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICI_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICI_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICI_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICI_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICI_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICI_POR_VALUE;
                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICI_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ICI_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICI_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICI_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICI_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICI_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICI_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICI_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICI_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_DIAG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DIAG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DIAG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DIAG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DIAG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DIAG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DIAG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DIAG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_DIAG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DIAG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DIAG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DIAG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DIAG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DIAG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DIAG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DIAG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ECC_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ECC_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ECC_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ECC_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ECC_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ECC_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ECC_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ECC_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ECC_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ECC_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ECC_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ECC_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ECC_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ECC_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ECC_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ECC_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ECL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ECL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ECL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ECL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ECL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ECL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ECL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ECL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ECL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ECL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ECL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ECL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ECL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ECL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ECL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ECL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ERB_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ERB_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ERB_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ERB_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ERB_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ERB_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ERB_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ERB_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ERB_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ERB_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ERB_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ERB_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ERB_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ERB_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ERB_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ERB_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ICA_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICA_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICA_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICA_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICA_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICA_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICA_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICA_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ICA_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICA_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICA_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICA_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICA_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICA_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICA_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICA_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_ICR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_ICR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_ICR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_ICR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_ICR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_ICR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_ICR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_ICR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_ICR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_OE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_OE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_OE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_OE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_OE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_OE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_OE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR]->data;

                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_OE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_B_OE_ERR_RW1C_ALIAS_HW_ADDR]->data;

                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_OE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_OE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_OE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_ROE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ROE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ROE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ROE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ROE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ROE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ROE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ROE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_ROE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ROE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ROE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ROE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ROE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ROE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ROE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ROE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_ROE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ROE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ROE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ROE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ROE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ROE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ROE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ROE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_ROE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ROE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ROE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ROE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ROE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ROE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ROE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ROE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TOE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TOE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TOE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TOE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TOE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TOE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TOE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TOE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TOE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TOE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TOE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TOE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TOE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TOE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TOE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TOE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TOE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TOE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TOE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TOE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TOE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TOE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TOE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TOE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TOE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TOE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TOE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TOE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TOE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TOE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TOE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TOE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_PRFC_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRFC_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRFC_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRFC_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRFC_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRFC_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRFC_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRFC_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_PRFC_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRFC_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRFC_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRFC_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRFC_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRFC_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRFC_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRFC_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_PRF0_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF0_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF0_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF0_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF0_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF0_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF0_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF0_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_PRF0_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF0_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF0_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF0_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF0_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF0_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF0_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF0_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_PRF1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_PRF1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_PRF2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_PRF2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_PRF2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_PRF2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_PRF2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_PRF2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_PRF2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_PRF2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_PRF2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_DBG_SEL_A_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DBG_SEL_A_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DBG_SEL_A_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DBG_SEL_A_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DBG_SEL_A_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DBG_SEL_A_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DBG_SEL_A_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DBG_SEL_A_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_DBG_SEL_A_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DBG_SEL_A_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DBG_SEL_A_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DBG_SEL_A_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DBG_SEL_A_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DBG_SEL_A_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DBG_SEL_A_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DBG_SEL_A_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TLU_DBG_SEL_B_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DBG_SEL_B_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DBG_SEL_B_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DBG_SEL_B_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DBG_SEL_B_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DBG_SEL_B_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DBG_SEL_B_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DBG_SEL_B_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TLU_DBG_SEL_B_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TLU_DBG_SEL_B_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TLU_DBG_SEL_B_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TLU_DBG_SEL_B_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TLU_DBG_SEL_B_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TLU_DBG_SEL_B_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TLU_DBG_SEL_B_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TLU_DBG_SEL_B_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_DEV_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_DEV_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_DEV_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_DEV_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_DEV_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_DEV_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_DEV_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_DEV_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_DEV_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_DEV_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_DEV_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_DEV_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_DEV_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LNK_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LNK_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LNK_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LNK_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LNK_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LNK_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SLT_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SLT_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SLT_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SLT_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SLT_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SLT_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SLT_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SLT_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SLT_CAP_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SLT_CAP_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SLT_CAP_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SLT_CAP_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SLT_CAP_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SLT_CAP_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SLT_CAP_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SLT_CAP_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_UE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_UE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_UE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_UE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_UE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_UE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_UE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_UE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_B_UE_ERR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_UE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_UE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_UE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_RUE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_RUE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_RUE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_RUE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_RUE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_RUE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_RUE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_RUE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_RUE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_RUE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_RUE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_RUE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_RUE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_RUE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_RUE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_RUE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_RUE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_RUE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_RUE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_RUE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_RUE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_RUE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_RUE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_RUE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_RUE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_RUE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_RUE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_RUE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_RUE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_RUE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_RUE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_RUE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TUE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TUE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TUE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TUE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TUE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TUE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TUE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TUE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TUE_HDR1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TUE_HDR1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TUE_HDR1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TUE_HDR1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TUE_HDR1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TUE_HDR1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TUE_HDR1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TUE_HDR1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_TUE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TUE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TUE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TUE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TUE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TUE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TUE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TUE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_TUE_HDR2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_TUE_HDR2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_TUE_HDR2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_TUE_HDR2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_TUE_HDR2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_TUE_HDR2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_TUE_HDR2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_TUE_HDR2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CE_LOG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_LOG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_LOG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_LOG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_LOG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_LOG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_LOG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_LOG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CE_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CE_EN_ERR_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_EN_ERR_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_EN_ERR_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_EN_ERR_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_EN_ERR_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_EN_ERR_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_EN_ERR_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_EN_ERR_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CE_ERR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_ERR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_ERR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_ERR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CE_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_B_CE_ERR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CE_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CE_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CE_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_PEU_DLPL_SERDES_REV_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_PEU_DLPL_SERDES_REV_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_PEU_DLPL_SERDES_REV_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_PEU_DLPL_SERDES_REV_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_PEU_DLPL_SERDES_REV_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_PEU_DLPL_SERDES_REV_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_PEU_DLPL_SERDES_REV_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_PEU_DLPL_SERDES_REV_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_PEU_DLPL_SERDES_REV_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_PEU_DLPL_SERDES_REV_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_PEU_DLPL_SERDES_REV_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_PEU_DLPL_SERDES_REV_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_PEU_DLPL_SERDES_REV_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_PEU_DLPL_SERDES_REV_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_PEU_DLPL_SERDES_REV_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_PEU_DLPL_SERDES_REV_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_ACKNAK_THRESH_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ACKNAK_THRESH_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ACKNAK_THRESH_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ACKNAK_THRESH_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ACKNAK_THRESH_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ACKNAK_THRESH_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ACKNAK_THRESH_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ACKNAK_THRESH_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_ACKNAK_THRESH_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ACKNAK_THRESH_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ACKNAK_THRESH_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ACKNAK_THRESH_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ACKNAK_THRESH_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ACKNAK_THRESH_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ACKNAK_THRESH_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ACKNAK_THRESH_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_ACKNAK_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ACKNAK_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ACKNAK_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ACKNAK_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ACKNAK_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ACKNAK_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ACKNAK_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ACKNAK_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_ACKNAK_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_ACKNAK_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_ACKNAK_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_ACKNAK_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_ACKNAK_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_ACKNAK_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_ACKNAK_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_ACKNAK_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_REPLAY_TIM_THRESH_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_REPLAY_TIM_THRESH_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_REPLAY_TIM_THRESH_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_REPLAY_TIM_THRESH_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_REPLAY_TIM_THRESH_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_REPLAY_TIM_THRESH_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_REPLAY_TIM_THRESH_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_REPLAY_TIM_THRESH_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_REPLAY_TIM_THRESH_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_REPLAY_TIM_THRESH_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_REPLAY_TIM_THRESH_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_REPLAY_TIM_THRESH_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_REPLAY_TIM_THRESH_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_REPLAY_TIM_THRESH_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_REPLAY_TIM_THRESH_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_REPLAY_TIM_THRESH_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_REPLAY_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_REPLAY_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_REPLAY_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_REPLAY_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_REPLAY_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_REPLAY_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_REPLAY_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_REPLAY_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_REPLAY_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_REPLAY_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_REPLAY_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_REPLAY_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_REPLAY_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_REPLAY_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_REPLAY_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_REPLAY_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_VEN_DLLP_MSG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_VEN_DLLP_MSG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_VEN_DLLP_MSG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_VEN_DLLP_MSG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_VEN_DLLP_MSG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_VEN_DLLP_MSG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_VEN_DLLP_MSG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_VEN_DLLP_MSG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_VEN_DLLP_MSG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_VEN_DLLP_MSG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_VEN_DLLP_MSG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_VEN_DLLP_MSG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_VEN_DLLP_MSG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_VEN_DLLP_MSG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_VEN_DLLP_MSG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_VEN_DLLP_MSG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_FORCE_LTSSM_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_FORCE_LTSSM_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_FORCE_LTSSM_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_FORCE_LTSSM_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_FORCE_LTSSM_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_FORCE_LTSSM_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_FORCE_LTSSM_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_FORCE_LTSSM_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_FORCE_LTSSM_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_FORCE_LTSSM_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_FORCE_LTSSM_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_FORCE_LTSSM_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_FORCE_LTSSM_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_FORCE_LTSSM_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_FORCE_LTSSM_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_FORCE_LTSSM_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LINK_CFG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LINK_CFG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LINK_CFG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LINK_CFG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LINK_CFG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LINK_CFG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LINK_CFG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LINK_CFG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LINK_CFG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LINK_CFG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LINK_CFG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LINK_CFG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LINK_CFG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LINK_CFG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LINK_CFG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LINK_CFG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LINK_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LINK_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LINK_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LINK_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LINK_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LINK_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LINK_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LINK_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LINK_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LINK_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LINK_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LINK_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LINK_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LINK_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LINK_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LINK_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LANE_SKEW_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LANE_SKEW_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LANE_SKEW_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LANE_SKEW_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LANE_SKEW_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LANE_SKEW_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LANE_SKEW_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LANE_SKEW_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LANE_SKEW_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LANE_SKEW_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LANE_SKEW_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LANE_SKEW_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LANE_SKEW_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LANE_SKEW_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LANE_SKEW_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LANE_SKEW_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SYMBOL_NUM_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SYMBOL_NUM_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SYMBOL_NUM_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SYMBOL_NUM_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SYMBOL_NUM_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SYMBOL_NUM_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SYMBOL_NUM_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SYMBOL_NUM_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SYMBOL_NUM_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SYMBOL_NUM_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SYMBOL_NUM_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SYMBOL_NUM_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SYMBOL_NUM_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SYMBOL_NUM_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SYMBOL_NUM_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SYMBOL_NUM_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SYMBOL_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SYMBOL_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SYMBOL_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SYMBOL_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SYMBOL_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SYMBOL_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SYMBOL_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SYMBOL_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SYMBOL_TIMER_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SYMBOL_TIMER_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SYMBOL_TIMER_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SYMBOL_TIMER_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SYMBOL_TIMER_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SYMBOL_TIMER_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SYMBOL_TIMER_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SYMBOL_TIMER_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_CORE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CORE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CORE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CORE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CORE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CORE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CORE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CORE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_CORE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_CORE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_CORE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_CORE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_CORE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_CORE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_CORE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_CORE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_EVENT_ERR_LOG_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_LOG_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_LOG_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_LOG_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_LOG_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_LOG_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_LOG_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_LOG_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_EVENT_ERR_LOG_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_LOG_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_LOG_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_LOG_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_LOG_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_LOG_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_LOG_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_LOG_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_EVENT_ERR_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_EVENT_ERR_INT_EN_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_INT_EN_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_INT_EN_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_INT_EN_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_INT_EN_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_INT_EN_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_INT_EN_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_INT_EN_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_EVENT_ERR_INT_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_INT_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_INT_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_INT_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_INT_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_INT_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_INT_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_INT_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_EVENT_ERR_INT_STS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_INT_STS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_INT_STS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_INT_STS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_INT_STS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_INT_STS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_INT_STS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_INT_STS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_CLEAR;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_EVENT_ERR_STS_CLR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = csr_db[PEU_CSR_B_EVENT_ERR_STS_CLR_RW1C_ALIAS_HW_ADDR]->data;
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LNK_BIT_ERR_CNT_1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_BIT_ERR_CNT_1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_BIT_ERR_CNT_1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LNK_BIT_ERR_CNT_1_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_BIT_ERR_CNT_1_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_BIT_ERR_CNT_1_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_BIT_ERR_CNT_1_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_LNK_BIT_ERR_CNT_2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_BIT_ERR_CNT_2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_BIT_ERR_CNT_2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_LNK_BIT_ERR_CNT_2_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_LNK_BIT_ERR_CNT_2_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_LNK_BIT_ERR_CNT_2_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_LNK_BIT_ERR_CNT_2_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_PLL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_PLL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_PLL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_PLL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_PLL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_PLL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_PLL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_PLL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_PLL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_PLL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_PLL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_PLL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_PLL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_PLL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_PLL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_PLL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_RECEIVER_LANE_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_RECEIVER_LANE_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_RECEIVER_LANE_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_RECEIVER_LANE_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_RECEIVER_LANE_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_RECEIVER_LANE_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_RECEIVER_LANE_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_RECEIVER_LANE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_RECEIVER_LANE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_RECEIVER_LANE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_XMITTER_LANE_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_XMITTER_LANE_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_XMITTER_LANE_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_XMITTER_LANE_CTL_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_XMITTER_LANE_CTL_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_XMITTER_LANE_CTL_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_XMITTER_LANE_CTL_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_XMITTER_LANE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_XMITTER_LANE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_XMITTER_LANE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_XMITTER_LANE_STATUS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_XMITTER_LANE_STATUS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_XMITTER_LANE_STATUS_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_XMITTER_LANE_STATUS_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_A_SERDES_MACRO_TEST_CFG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_MACRO_TEST_CFG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_MACRO_TEST_CFG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = PEU_CSR_B_SERDES_MACRO_TEST_CFG_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_READ_MASK;
                    csr_db[reg_addr]->wr_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = PEU_CSR_SERDES_MACRO_TEST_CFG_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = PEU_CSR_SERDES_MACRO_TEST_CFG_POR_VALUE;

                    csr_db[reg_addr]->data->val = PEU_CSR_SERDES_MACRO_TEST_CFG_POR_VALUE;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }

                    reg_addr = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR;
                    if (csr_db[reg_addr] == NULL) {
                        csr_db[reg_addr] = new csr_data_intf<DATA> ();
                        csr_db[reg_addr]->data = new csr_data<DATA> ();
                    }

                    csr_db[reg_addr]->rd_mask = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_READ_MASK;
                    csr_db[reg_addr]->wr_mask = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_WRITE_MASK;
                    csr_db[reg_addr]->clr_mask = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_CLEAR_MASK;
                    csr_db[reg_addr]->set_mask = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_SET_MASK;
                    csr_db[reg_addr]->toggle_mask = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_TOGGLE_MASK;
                    csr_db[reg_addr]->por_val = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE;

                    csr_db[reg_addr]->data->val = ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE;
                    csr_db[reg_addr]->intf_type = WRITE1_SET;
                    csr_db[reg_addr]->sw_reset_val_hold = false;

                    for (uint32 i = 0; i < csr_db[reg_addr]->data->num_events; i++) {
                        notify (*(csr_db[reg_addr]->data->events[i]));
                    }
                    
                    LOG_DEBUG << "Create CSR DB .. Done";
                }

                /**
                 *  This method resets the CSR data element, based on the specified rst_type
                 */
                void reset_csr_db(){
                    LOG_DEBUG << "Reset CSR DB";
                    if(rst_type==POR_L)
                        LOG_INFO<<"CSR: POR_L reset..";
                    else if(rst_type==RST_L)
                        LOG_INFO<<"CSR: RST_L reset..";
                    else LOG_WARNING << "CSR: WARNING: Undefined reset type!";

                    USE_NAMESPACE(std)map<ADDR, csr_data_intf <DATA>* >::iterator it;
                    for(it=csr_db.begin(); it!=csr_db.end(); ++it){
                        ((*it).second)->reset_data(rst_type);
                    }
                    LOG_DEBUG << "Reset CSR DB .. Done";
                } //end reset_csr_db()

                /**
                 *  This thread handles reset behavior of the module. On the arrival of a 
                 *  reset global event, it issues a reset to the CSR DB.
                 */
                void reset_handler(){
                    while(1){
                        wait(*parent_global_event);
                        switch(*parent_global_event_type){
                            case POR_RESET_ENTER:
                                LOG_WARNING<<"CSR: Entering reset state...";
                                rst_type=POR_L;
                                reset_csr_db();
                                POR_RESET=true;
                                break;
                            case WMR_RESET_ENTER:
                                LOG_WARNING<<"CSR: Entering reset state...";
                                rst_type=RST_L;
                                reset_csr_db();
                                POR_RESET=true;
                                break;
                            case POR_RESET_EXIT:
                            case WMR_RESET_EXIT:
                                LOG_INFO<<"CSR: Exiting reset state...";
                                POR_RESET = false;
                                break;
                        }
                    }
                } //end reset_handler()

                sc_export<if_type> 	target_port;
                sc_event                *parent_global_event;      ///< Global event for CSR module
                uint8                   *parent_global_event_type; ///< Global event type 
                bool                    POR_RESET;                 ///< Power-on reset flag
                uint8                   rst_type;                  ///< Reset type

            private:
                USE_NAMESPACE(std)map<ADDR, csr_data_intf <DATA>* >	csr_db;
        };
} // namespace pcie_tl

#endif // INC_csr_hpp__

