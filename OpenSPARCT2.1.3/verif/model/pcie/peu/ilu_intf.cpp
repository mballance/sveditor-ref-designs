// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ilu_intf.cpp
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
#include "ilu_intf.hpp"
#include "pcie_common/logger.hpp"

namespace pcie {

    /**
     *  Binary to gray code helper function
     */
    sc_uint<32> bin2gc (sc_uint<32> binval) {
        sc_uint<32> gcval = 0;
        sc_uint<1> bit_zero = 0;

        gcval = binval ^ (bit_zero, binval(32-1, 1));
        return gcval;
    }

    /**
     *  Gray code to binary helper function
     */
    sc_uint<32> gc2bin (sc_uint<32> gcval) {
        sc_uint<32> binval = 0;
        int i;

        binval[32-1] = gcval[32-1];
        for (i = (32 - 2); i >= 0; --i) 
            binval[i] = binval[i+1] ^ gcval[i];
        return binval;
    }

    /**
     *  Parity calculator
     */
    int parity (sc_uint<32> data) {
        sc_uint<1> par =0;

        par = 1;
        for (int i = 0; i < 32; i++) {
            par ^= (data & 1);
            data >>= 1;
        }
        return par;
    }

    /**
     *  This thread collects outgoing Hdr from the ILU and loads it into the EHB.
     */
    void ilu_intf::ehb_write(void) {
        bool ehb_we = false;
        sc_uint<D2P_EHB_ADDR_WDTH> ehb_addr;

        while (1) {
            wait(clk.negedge_event());
            ehb_we = d2p_ehb_we.read();
            ehb_addr = d2p_ehb_addr.read().to_uint();

            if (ehb_we) {
                ehb_buffer[ehb_addr](127,0) = d2p_ehb_data.read();
                ehb_buffer[ehb_addr](131,128) = d2p_ehb_dpar.read();

                LOG_DEBUG << "EHB Write @ " << ehb_addr  
                    << " DATA: " << (string) d2p_ehb_data.read().to_string();
            }
        }
    }

    /**
     *  This thread collects outgoing data from the ILU and loads it into the EDB.
     */
    void ilu_intf::edb_write(void) {
        bool edb_we;
        sc_uint<D2P_EDB_ADDR_WDTH> edb_addr;

        while (1) {
            wait(clk.negedge_event());
            edb_we = d2p_edb_we.read();
            edb_addr = d2p_edb_addr.read().to_uint();

            if (edb_we) {
                edb_buffer[edb_addr](127,0) = d2p_edb_data.read();
                edb_buffer[edb_addr](131,128) = d2p_edb_dpar.read();
                LOG_DEBUG << "EDB Write @ " << edb_addr;

                if (edb_addr < 0x80) 
                    ecd_waddr += 1;
                else 
                    erd_waddr += 1;
            }
        }
    }

    /**
     *  This thread provides IHB content to the ILU.
     */
    void ilu_intf::ihb_read(void) {
        bool ihb_rd;
        sc_uint<D2P_IHB_ADDR_WDTH> ihb_addr;

        while (1) {
            wait (clk.negedge_event());
            ihb_addr = d2p_ihb_addr.read().to_uint();
            ihb_rd = d2p_ihb_rd.read();

            if (ihb_rd) {
                wait (clk.posedge_event());
                if ( (bin2gc(ihb_addr) != ihb_wptr) && (!ihb_empty) ) {
                    p2d_ihb_dpar.write ( ihb_buffer[ihb_addr]
                            (P2D_IHB_DATA_WDTH+P2D_IHB_DPAR_WDTH-1, 
                             P2D_IHB_DATA_WDTH) 
                            );
                    p2d_ihb_data.write(ihb_buffer[ihb_addr](P2D_IHB_DATA_WDTH-1, 0));
                    LOG_DEBUG << "IHB Read @ " << ihb_addr;
                } else {
                    ihb_empty = true;
                    LOG_DEBUG << "Reading empty IHB @ " << ihb_addr;
                }
            }
        }// while(1)
    }//end ihb_read()

    /**
     *  This thread provides IDB content to the ILU.
     */
    void ilu_intf::idb_read(void) {
        bool idb_rd;
        sc_uint<D2P_IDB_ADDR_WDTH> idb_addr;

        while (1) {
            wait (clk.negedge_event());
            idb_addr = d2p_idb_addr.read().to_uint();
            idb_rd = d2p_idb_rd.read();

            if (idb_rd) {
                wait (clk.posedge_event());
                p2d_idb_dpar.write ( idb_buffer[idb_addr]
                        (P2D_IDB_DATA_WDTH+P2D_IDB_DPAR_WDTH-1, 
                         P2D_IDB_DATA_WDTH) );
                p2d_idb_data.write(idb_buffer[idb_addr](P2D_IDB_DATA_WDTH-1, 0));
                //LOG_DEBUG << "IDB Read @ " << idb_addr;
            }
        }// while(1)
    }

    /**
     *  This thread receives ingress TLPs from the lower layers (i.e. ITL), and loads
     *  it into the IHB and IDB.
     */
    void ilu_intf::ingress_packet_handler() {
        LOG_INFO<<"ILU_INTF: ingress_packet_handler begins...";
        RefPciePacket	                next_pkt;
        //sc_uint<D2P_IHB_ADDR_WDTH>	ihb_wr_addr;
        //sc_uint<D2P_IHB_ADDR_WDTH+1>	nxt_ihb_wr_addr;
        sc_uint<10>		        pld_len;
        sc_uint<10>			idb_wr_len;
        //sc_uint<D2P_IDB_ADDR_WDTH>	idb_wr_addr;
        //sc_uint<D2P_IDB_ADDR_WDTH>	nxt_idb_wr_addr;

        //ihb_wr_addr = 0;
        //nxt_ihb_wr_addr = 0;
        try{
            while (true) {
                in_pkt_port.get_packet(next_pkt);
                LOG_DEBUG << "Received Ingress Packet " << next_pkt->to_string();
                //cout<< sc_time_stamp()  << " ILU_INTF: Received TLP " << next_pkt->getPacketId() << " from itl." << endl;
                if(next_pkt->get_control() == DROP_TLP_ILUINTF_RECOVER_CREDITS){//indicates that the packet is to be dropped in here and credits are to be recovered
                    LOG_DEBUG<<"Recvd pkt to be dropped";
                    if(next_pkt->isCmpl()){
                        LOG_DEBUG<<"Recovering CHC/CDC...";
                        recovered_credits.range(CHC) = recovered_credits.range(CHC) + 1;
                        if(next_pkt->hasData()){
                            sc_uint<12> cred = (GET_TLP_LEN(next_pkt))/4; 	
                            if((GET_TLP_LEN(next_pkt))%4 != 0) cred++; 
                            recovered_credits.range(CDC) = recovered_credits.range(CDC) + cred;
                        }
                    }
                    else if(next_pkt->isPosted()){
                        LOG_DEBUG<<"Recovering PHC/PDC...";
                        recovered_credits.range(PHC) = recovered_credits.range(PHC) + 1;
                        if(next_pkt->hasData()){
                            sc_uint<12> cred = (GET_TLP_LEN(next_pkt))/4; 	
                            if((GET_TLP_LEN(next_pkt))%4 != 0) cred++; 
                            recovered_credits.range(PDC) = recovered_credits.range(PDC) + cred;
                        }
                    }
                    else{
                        LOG_DEBUG<<"Recovering NHC/NDC...";
                        recovered_credits.range(NHC) = recovered_credits.range(NHC) + 1;
                        if(next_pkt->hasData()){
                            sc_uint<12> cred = (GET_TLP_LEN(next_pkt))/4; 	
                            if((GET_TLP_LEN(next_pkt))%4 != 0) cred++; 
                            recovered_credits.range(NDC) = recovered_credits.range(NDC) + cred;
                        }
                    }
                }
                else {
                    ihb_empty = false;
                    ihb_wr_addr = nxt_ihb_wr_addr;
                    nxt_ihb_wr_addr += 1;
                    if(!drain_state && !POR_RESET ){
                        int hdr_size;
                        if (GET_TLP_FMT(next_pkt) & 0x01) {
                            hdr_size = 16;
                        } else {
                            hdr_size = 12;
                        }

                        /// Load the Header into Header buffer
                        for (int byte = 15, pkt_byte=0; pkt_byte  < hdr_size; byte--, pkt_byte++) {
                            ihb_buffer[ihb_wr_addr](byte*8+7, byte*8) = 
                                next_pkt->get_byte(TLP_HDR_START + pkt_byte);
                        }

                        /// Calculate Header Parity
                        ihb_buffer[ihb_wr_addr][128] = parity(ihb_buffer[ihb_wr_addr](31,0).to_uint());
                        ihb_buffer[ihb_wr_addr][129] = parity(ihb_buffer[ihb_wr_addr](63,32).to_uint());
                        ihb_buffer[ihb_wr_addr][130] = parity(ihb_buffer[ihb_wr_addr](95,64).to_uint());
                        ihb_buffer[ihb_wr_addr][131] = parity(ihb_buffer[ihb_wr_addr](127,96).to_uint());

                        /// Polulate Data buffers, if data associated with the packet
                        if ((GET_TLP_FMT(next_pkt) >> 1) &&
                                ((next_pkt->get_byte(TLP_HDR_START) != tlp_IORd) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_IOWr) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_MRdLk_32) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_MRdLk_64) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_CfgRd0) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_CfgRd1) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_CfgWr0) &&
                                 (next_pkt->get_byte(TLP_HDR_START) != tlp_CfgWr1) )
                           ) { // Packet with data 
                            pld_len = GET_TLP_LEN(next_pkt);
                            idb_wr_len = pld_len(9,2);
                            LOG_DEBUG << "Payload Length: " << pld_len << " IDB Write Len: " << idb_wr_len;

                            int pkt_byte_ctr = TLP_HDR_START+hdr_size;
                            for (int idb_ctr = 0; idb_ctr < idb_wr_len; idb_ctr++) {
                                idb_wr_addr = nxt_idb_wr_addr;
                                nxt_idb_wr_addr += 1;
                                for (int byte = 15; byte >= 0; byte--) {
                                    idb_buffer[idb_wr_addr](byte*8+7, byte*8) = 
                                        next_pkt->get_byte(pkt_byte_ctr++);
                                    idb_buffer[idb_wr_addr][128] =  
                                        parity(idb_buffer[idb_wr_addr](31,0).to_uint());
                                    idb_buffer[idb_wr_addr][129] = 
                                        parity(idb_buffer[idb_wr_addr](63,32).to_uint());
                                    idb_buffer[idb_wr_addr][130] = 
                                        parity(idb_buffer[idb_wr_addr](95,64).to_uint());
                                    idb_buffer[idb_wr_addr][131] = 
                                        parity(idb_buffer[idb_wr_addr](127,96).to_uint());
                                }
                            }
                            if (pld_len(1,0).or_reduce()) { 
                                idb_wr_addr = nxt_idb_wr_addr;
                                nxt_idb_wr_addr += 1;
                                sc_uint<32> idb_byte_cnt = pld_len(1,0) * 4;

                                for (int byte = 15; byte > 15-(pld_len(1,0)*4); byte--) {
                                    idb_buffer[idb_wr_addr](byte*8+7, byte*8) = 
                                        next_pkt->get_byte(pkt_byte_ctr++);

                                    idb_buffer[idb_wr_addr][128] = 
                                        parity(idb_buffer[idb_wr_addr](31,0).to_uint());
                                    idb_buffer[idb_wr_addr][129] = 
                                        parity(idb_buffer[idb_wr_addr](63,32).to_uint());
                                    idb_buffer[idb_wr_addr][130] = 
                                        parity(idb_buffer[idb_wr_addr](95,64).to_uint());
                                    idb_buffer[idb_wr_addr][131] = 
                                        parity(idb_buffer[idb_wr_addr](127,96).to_uint());
                                }
                            }
                        } // If Payload
                        WAIT(clk.posedge_event());
                        p2d_ihb_wptr.write(bin2gc(nxt_ihb_wr_addr));
                        ihb_wptr = bin2gc(nxt_ihb_wr_addr);
                    }//end if(!drain_state)
                    else WAIT(clk.posedge_event());
                }
            } //end while(1)
        }//end try
        catch(sc_exception &e){
            LOG_WARNING<<"ILU_INTF: Out of ingress_packet_handler";
        }
    } // ingress_packet_handler()


    /**
     *  This thread build TLPs out of requests in the EHB and fwds them to the DLL.
     *  Parity errors are also checked for. If detected, Drain State is entered.
     */
    void ilu_intf::egress_packet_handler() {
        /** EHB Interface Signals
          d2p_ehb_clk
          d2p_ehb_we
          d2p_ehb_addr
          d2p_ehb_data & dpar

          d2p_ech_wptr
          d2p_erh_wptr

          p2d_ech_rptr
          p2d_erh_rptr

          p2d_ecd_rptr
          p2d_erd_rptr
         */
        LOG_INFO<<"ILU_INTF: egress_packet_handler begins...";
        sc_uint<P2D_EHB_ADDR_WDTH>	erh_addr;
        sc_uint<P2D_ERH_RPTR_WDTH>	erh_rptr;
        sc_uint<P2D_ERH_RPTR_WDTH>	nxt_erh_rptr;
        sc_uint<P2D_EHB_ADDR_WDTH>	ech_addr;
        sc_uint<P2D_ECH_RPTR_WDTH>	ech_rptr;
        sc_uint<P2D_ERH_RPTR_WDTH>	nxt_ech_rptr;
        sc_uint<P2D_EHB_ADDR_WDTH>	ehb_addr;

        sc_uint<D2P_EDB_ADDR_WDTH-1>	erd_rd_addr;
        sc_uint<D2P_EDB_ADDR_WDTH-1>	ecd_rd_addr;
        sc_uint<D2P_EDB_ADDR_WDTH>	edb_rd_addr;

        sc_biguint<D2P_EHB_DATA_WDTH>	ehb_data;
        sc_uint<D2P_EHB_DPAR_WDTH>	ehb_dpar;
        sc_biguint<D2P_EDB_DATA_WDTH>	edb_data;
        sc_uint<D2P_EDB_DPAR_WDTH>	edb_dpar;

        bool	req_arb = true;
        RefPciePacket	nxt_pkt;
        bool 	par_error = false;
        sc_uint<PCIE_PLD_LEN_WDTH>	pld_len;
        sc_uint<PCIE_PLD_LEN_WDTH-1>	edb_rd_len;

        erh_addr = 0x00;
        ech_addr = 0x00;
        erd_rd_addr = 0x00;
        ecd_rd_addr = 0x00;
        ihb_wptr = 0x00;

        pld_len = 0;
        edb_rd_len = 0;

        erh_rptr = bin2gc(erh_addr);
        nxt_erh_rptr = bin2gc(erh_addr);
        ech_rptr = bin2gc(ech_addr);

        try{
            while (true) {
                WAIT(clk.negedge_event());
                if(!drain_state && !POR_RESET){
                    if (req_arb) {
                        req_arb = false;
                        nxt_erh_rptr = d2p_erh_wptr.read();
                        /// Check if the req empty
                        if (erh_rptr != nxt_erh_rptr) {
                            ehb_addr = erh_addr | 0x20;
                            p2d_erh_rptr.write(erh_rptr);
                            LOG_DEBUG << " Processing Egress Request Header \n"
                                << " ERH_ADDR : " << erh_addr
                                << " ERH_RPTR : " << erh_rptr
                                << " EHB_ADDR : " << ehb_addr << "\n"
                                << "Next: ERH Addr: " << erh_addr+1
                                << " ERH Rptr: " << bin2gc(erh_addr+1);
                            /// Read erh 
                            (ehb_dpar, ehb_data) = ehb_buffer[ehb_addr];		  

                            /// Verify parity
                            for (int dword = 0; dword < 4; dword++) {
                                sc_uint<32>	dw_data = (sc_uint<32>) ehb_data(31+(dword * 32), dword * 32);
                                LOG_DEBUG << "dw_data: " << dw_data << " datapar: " << ehb_dpar[dword] << " calcpar: " <<parity(dw_data); 
                                if (ehb_dpar[dword] != parity(dw_data)) {
                                    LOG_ERROR << "Parity Error detected on DMU Request Header\n" 
                                        << "Data: " << (string) dw_data.to_string()
                                        << " Parity: " << (int) parity(dw_data);
                                    par_error = true;
                                }
                            }
                            if(par_error){
                                write_error_csr(OE,12,44,"ehp");
                                drain_req_ev.notify();
                            }
                            if(!par_error){
                                /// Build TLP
                                int hdr_size = (ehb_data[125] & 0x1) ? 16 : 12;
                                nxt_pkt = NEW_TLP(hdr_size);
                                nxt_pkt->modify_byte(0, STP);
                                LOG_DEBUG << " TLP Hdr Size " << hdr_size;
                                for (int byte = 15, pkt_byte = 0; 
                                        pkt_byte < hdr_size; 
                                        byte--, pkt_byte++) {
                                    sc_uint<8> data_byte;
                                    data_byte = ehb_data((byte*8)+7, (byte*8));
                                    nxt_pkt->modify_byte( TLP_HDR_START+pkt_byte, 
                                            data_byte);
                                }

                                /// Check for the Data:
                                if ((GET_TLP_FMT(nxt_pkt) >> 1)) {
                                    pld_len = GET_TLP_LEN(nxt_pkt);
                                    edb_rd_len = pld_len(9,2);
                                    int pkt_byte_ctr = TLP_HDR_START+hdr_size;
                                    LOG_DEBUG << "Egress Request : Payload Length: " << pld_len
                                        << " EDB Read Len: " << edb_rd_len;

                                    nxt_pkt->alloc_bytes(edb_rd_len * 16 + (pld_len(1,0)*4));
                                    /// Read Req Data
                                    for (int edb_ctr = 0; edb_ctr < edb_rd_len; edb_ctr++) {
                                        while (erd_rd_addr == erd_waddr) {
                                            WAIT(clk.negedge_event());
                                        }

                                        edb_rd_addr = (1,erd_rd_addr);
                                        erd_rd_addr += 1;
                                        p2d_erd_rptr.write(bin2gc(edb_rd_addr));
                                        LOG_DEBUG << "TL: EDB Read Addr: " << edb_rd_addr 
                                            << " ERD Rd Ptr: " << bin2gc(edb_rd_addr);
                                        (edb_dpar, edb_data) = edb_buffer[edb_rd_addr];

                                        /// Verify Data Parity
                                        for (int dword = 0; dword < 4; dword++) {
                                            sc_uint<32>	dw_data = (sc_uint<32>) edb_data(31+(dword * 32), dword * 32);
                                            LOG_DEBUG << "EBD: dw_data: " << dw_data << " datapar: " << edb_dpar[dword] << " calcpar: " <<parity(dw_data); 
                                            if (edb_dpar[dword] != parity(dw_data) && GET_TLP_EP(nxt_pkt)!=1) {
                                                LOG_ERROR << "Parity Error detected on DMU Request Data\n";
                                                par_error = true;
                                            }
                                        }
                                        if(par_error){
                                            write_error_csr(OE,13,45,"edp");
                                        }
                                        /// Load ERD Data to Packet
                                        for (int byte = 15; byte >= 0; byte--) {
                                            sc_uint<8> data_byte;
                                            data_byte =  (sc_uint<8>) edb_data((byte*8)+7, (byte*8));
                                            nxt_pkt->modify_byte( pkt_byte_ctr++, data_byte);
                                        }
                                    } // Read ERD Data
                                    if (pld_len(1,0).or_reduce()) {
                                        while (erd_rd_addr == erd_waddr) {
                                            WAIT(clk.negedge_event());
                                        }
                                        edb_rd_addr = (1,erd_rd_addr);
                                        erd_rd_addr += 1;
                                        p2d_erd_rptr.write(bin2gc(edb_rd_addr));
                                        LOG_DEBUG << "TL: EDB Read Addr: " << edb_rd_addr 
                                            << " ERD Rd Ptr: " << bin2gc(edb_rd_addr);
                                        (edb_dpar, edb_data) = edb_buffer[edb_rd_addr];

                                        /// Verify Data Parity
                                        for (int dword = 0; dword < 4; dword++) {
                                            sc_uint<32>	dw_data = (sc_uint<32>) edb_data(31+(dword * 32), dword * 32);
                                            LOG_DEBUG << "EBD: dw_data: " << dw_data << " datapar: " << edb_dpar[dword] << " calcpar: " <<parity(dw_data); 
                                            if (edb_dpar[dword] != parity(dw_data) && GET_TLP_EP(nxt_pkt)!=1) {
                                                LOG_ERROR << "Parity Error detected on DMU Request Data\n";
                                                par_error = true;
                                            }
                                        }
                                        if(par_error){
                                            write_error_csr(OE,13,45,"edp");
                                        }

                                        for (int byte = 15; byte >= 15-(pld_len(1,0)*4); byte--) {
                                            sc_uint<8> data_byte;
                                            data_byte =  (sc_uint<8>) edb_data((byte*8)+7, (byte*8));
                                            nxt_pkt->modify_byte( pkt_byte_ctr++, data_byte);
                                        }  
                                    }
                                } // If Packet contains Data
                                if(!par_error){
                                    par_error=false;  
                                    nxt_pkt->set_control(0x2);
                                    LOG_DEBUG << "Sending Request Packet to DLL" << nxt_pkt->to_string();
                                    //cout << sc_time_stamp() << "\t\t\t\t\t| ILU_INTF: Sending Req TLP " << nxt_pkt->getPacketId() << " to ETL." << endl;
                                    req_pkt_port.send_packet(nxt_pkt);
                                }
                                else{
                                    nxt_pkt->set_control(0x12);
                                    LOG_DEBUG << "Sending Request Packet to DLL" << nxt_pkt->to_string();
                                    //cout << sc_time_stamp() << "\t\t\t\t\t| ILU_INTF: Sending Req TLP " << nxt_pkt->getPacketId() << " to ETL." << endl;
                                    req_pkt_port.send_packet(nxt_pkt);
                                    drain_req_ev.notify();
                                }

                            }//end if(!par_error)
                            erh_addr += 1;
                            erh_rptr = bin2gc(erh_addr);
                        } // If Req Hdr not empty
                    } else { // Completion arb
                        req_arb = true;
                        nxt_ech_rptr = d2p_ech_wptr.read();
                        /// Check if the req empty
                        if (ech_rptr != nxt_ech_rptr) {
                            ehb_addr = ech_addr & 0x1F;
                            p2d_ech_rptr.write(ech_rptr);

                            LOG_DEBUG << " Processing Completion Header "
                                << " ECH_ADDR : " << ech_addr
                                << " ECH_RPTR : " << ech_rptr
                                << " EHB_ADDR : " << ehb_addr << "\n"
                                << "Next: ERH Addr: " << ech_addr+1
                                << " ERH Rptr: " << bin2gc(ech_addr+1);
                            /// Read erh 
                            (ehb_dpar, ehb_data) = ehb_buffer[ehb_addr];
                            /// Verify parity
                            for (int dword = 0; dword < 4; dword++) {
                                sc_uint<32>	dw_data = (sc_uint<32>) ehb_data(31+(dword * 32), dword * 32);
                                if (ehb_dpar[dword] != parity(dw_data)) {
                                    LOG_ERROR << "Parity Error detected on DMU Completion Header\n"
                                        << "Data: " << (string) dw_data.to_string()
                                        << " Parity: " << (int) parity(dw_data);
                                    par_error = true;
                                }
                            }
                            if(par_error){
                                write_error_csr(OE,12,44,"ehp");
                                drain_req_ev.notify();
                            }
                            if(!par_error){
                                /// Build TLP
                                int hdr_size = (ehb_data[125] & 0x1) ? 16 : 12;
                                nxt_pkt = NEW_TLP(hdr_size);
                                nxt_pkt->modify_byte(0, STP);
                                LOG_DEBUG << " TLP Hdr Size " << hdr_size;
                                for (int byte = 15, pkt_byte = 0; 
                                        pkt_byte < hdr_size; 
                                        byte--, pkt_byte++) {
                                    sc_uint<8> data_byte;
                                    data_byte = ehb_data((byte*8)+7, (byte*8));
                                    nxt_pkt->modify_byte( TLP_HDR_START+pkt_byte, data_byte);
                                }

                                /// Check for the Data:
                                if ((GET_TLP_FMT(nxt_pkt) >> 1)) {
                                    pld_len = GET_TLP_LEN(nxt_pkt);
                                    edb_rd_len = pld_len(9,2);
                                    int pkt_byte_ctr = TLP_HDR_START+hdr_size;
                                    LOG_DEBUG << "Egress Completion Packet : Payload Length: " << pld_len
                                        << "EDB Read Len: " << edb_rd_len;

                                    nxt_pkt->alloc_bytes(edb_rd_len * 16 + (pld_len(1,0)*4));
                                    /// Read Req Data
                                    for (int edb_ctr = 0; edb_ctr < edb_rd_len; edb_ctr++) {
                                        while (ecd_rd_addr == ecd_waddr) {
                                            WAIT(clk.negedge_event());
                                        }

                                        edb_rd_addr = (0,ecd_rd_addr);
                                        ecd_rd_addr += 1;
                                        p2d_ecd_rptr.write(bin2gc(edb_rd_addr));
                                        LOG_DEBUG << "TL: EDB Read Addr: " << edb_rd_addr 
                                            << " ECD Rd Ptr: " << bin2gc(edb_rd_addr);

                                        (edb_dpar, edb_data) = edb_buffer[edb_rd_addr];

                                        /// Verify Data Parity
                                        for (int dword = 0; dword < 4; dword++) {
                                            sc_uint<32>	dw_data = (sc_uint<32>) edb_data(31+(dword * 32), dword * 32);
                                            if (edb_dpar[dword] != parity(dw_data) && GET_TLP_EP(nxt_pkt)!=1) {
                                                LOG_ERROR << "Parity Error detected on DMU Request Data\n";
                                                par_error = true;
                                            }
                                        }
                                        if(par_error){
                                            write_error_csr(OE,13,45,"edp");
                                        }
                                        /// Load ECD Data to Packet
                                        for (int byte = 15; byte >= 0; byte--) {
                                            sc_uint<8> data_byte;
                                            data_byte =  (sc_uint<8>) edb_data((byte*8)+7, (byte*8));				
                                            nxt_pkt->modify_byte( pkt_byte_ctr++,  data_byte);

                                        } // Load ECD Data
                                    } // Read ECD Data
                                    if (pld_len(1,0).or_reduce()) {
                                        while (ecd_rd_addr == ecd_waddr) {
                                            WAIT(clk.negedge_event());
                                        }

                                        edb_rd_addr = (0,ecd_rd_addr);
                                        ecd_rd_addr += 1;
                                        p2d_ecd_rptr.write(bin2gc(edb_rd_addr));

                                        LOG_DEBUG << "TL: EDB Read Addr: " << edb_rd_addr 
                                            << " ECD Rd Ptr: " << bin2gc(edb_rd_addr);
                                        (edb_dpar, edb_data) = edb_buffer[edb_rd_addr];

                                        /// Verify Data Parity
                                        for (int dword = 0; dword < 4; dword++) {
                                            sc_uint<32>	dw_data = (sc_uint<32>) edb_data(31+(dword * 32), dword * 32);
                                            if (edb_dpar[dword] != parity(dw_data) && GET_TLP_EP(nxt_pkt)!=1) {
                                                LOG_ERROR << "Parity Error detected on DMU Request Data\n";
                                                par_error = true;
                                            }
                                        }
                                        if(par_error){
                                            write_error_csr(OE,13,45,"edp");
                                        }

                                        for (int byte = 15; byte >= 15-(pld_len(1,0)*4); byte--) {
                                            sc_uint<8> data_byte;
                                            data_byte =  (sc_uint<8>) edb_data((byte*8)+7, (byte*8));
                                            nxt_pkt->modify_byte( pkt_byte_ctr++, data_byte);
                                        }  
                                    }
                                } // If Packet contains Data
                                if(!par_error){
                                    par_error=false;  
                                    nxt_pkt->set_control(0x2);
                                    LOG_DEBUG << "Sending Completion Packet to DLL" << nxt_pkt->to_string();
                                    //cout<< sc_time_stamp()  << "\t\t\t\t\t| ILU_INTF: Sending Cpl TLP " << nxt_pkt->getPacketId() << " to ETL." << endl;
                                    cmpl_pkt_port.send_packet(nxt_pkt);
                                }
                                else{
                                    nxt_pkt->set_control(0x12);
                                    LOG_DEBUG << "Sending Completion Packet to DLL" << nxt_pkt->to_string();
                                    //cout<< sc_time_stamp() << "\t\t\t\t\t| ILU_INTF: Sending Cpl TLP " << nxt_pkt->getPacketId() << " to ETL." << endl;
                                    cmpl_pkt_port.send_packet(nxt_pkt);
                                    drain_req_ev.notify();
                                }
                            }//end if(!parr_error)
                            ech_addr += 1;
                            ech_rptr = bin2gc(ech_addr);
                        } // If Req Hdr not empty
                    }
                    par_error=false;
                }
            } // while (true)
        }
        catch(sc_exception &e){
            LOG_WARNING<<"ILU_INTF: Out of egress_packet_handler";
        }
    }

    /** Interrupt Generators 
     *  When interrupt enabled error bits are set in the OE, CE or UE CSRs, a corresponding interrupt
     *  is generated.
     */

    void ilu_intf::proc_ce_int() {
        csr_port.set_notify_event(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR, &ce_ev);

        while (1) {
            wait (ce_ev);
            ce_err = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);

            if ( (ce_err & ce_int_en) != 0) {
                wait (clk.posedge_event());
                p2d_ce_int.write(1);
            } else {
                wait (clk.posedge_event());
                p2d_ce_int.write(0);
            }
        }
    }

    void ilu_intf::proc_ce_int_en() {
        csr_port.set_notify_event(PEU_CSR_A_CE_INT_EN_HW_ADDR, &ce_en_ev);
        while (1) {
            wait (ce_en_ev);
            ce_int_en = csr_port.read_csr(PEU_CSR_A_CE_INT_EN_HW_ADDR);
        }
    }

    void ilu_intf::proc_ue_int() {
        csr_port.set_notify_event(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR, &ue_ev);

        while (1) {
            wait (ue_ev);
            ue_err = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);

            if ( (ue_err & ue_int_en) != 0) {
                wait (clk.posedge_event());
                p2d_ue_int.write(1);
            } else {
                wait (clk.posedge_event());
                p2d_ue_int.write(0);
            }
        }
    }

    void ilu_intf::proc_ue_int_en() {
        csr_port.set_notify_event(PEU_CSR_A_UE_INT_EN_HW_ADDR, &ue_en_ev);
        while (1) {
            wait (ue_en_ev);
            ue_int_en = csr_port.read_csr(PEU_CSR_A_UE_INT_EN_HW_ADDR);
        }
    }

    void ilu_intf::proc_oe_int() {
        csr_port.set_notify_event(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR, &oe_ev);

        while (1) {
            wait (oe_ev);
            oe_err = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);

            if ( (oe_err & oe_int_en) != 0) {
                wait (clk.posedge_event());
                p2d_oe_int.write(1);
            } else {
                wait (clk.posedge_event());
                p2d_oe_int.write(0);
            }
        }
    }

    void ilu_intf::proc_oe_int_en() {
        csr_port.set_notify_event(PEU_CSR_A_OE_INT_EN_HW_ADDR, &oe_en_ev);
        while (1) {
            wait (oe_en_ev);
            oe_int_en = csr_port.read_csr(PEU_CSR_A_OE_INT_EN_HW_ADDR);
        }
    }

    /**
     *  This thread collects credits from the ILU and updates the Ingress Credits Allocated CSR.
     */
    void ilu_intf::ilu_credit_update_handler(){
        sc_uint<D2P_IBC_NHC_WDTH> prev_nhc_cred=0;
        sc_uint<D2P_IBC_PHC_WDTH> prev_phc_cred=0;
        sc_uint<D2P_IBC_PDC_WDTH> prev_pdc_cred=0;
        while(1) {
            wait(d2p_ibc_req.posedge_event()|p2d_drain.negedge_event());
            sc_uint<D2P_IBC_NHC_WDTH> nhc_cred = d2p_ibc_nhc.read();
            sc_uint<D2P_IBC_PHC_WDTH> phc_cred = d2p_ibc_phc.read();
            sc_uint<D2P_IBC_PDC_WDTH> pdc_cred = d2p_ibc_pdc.read();
            //LOG_DEBUG << "ILU_INTF: ilu_credit_update_handler: drain_state: " << drain_state << " nhc:" << nhc_cred << " phc:" << phc_cred << " pdc:" << pdc_cred;
            //LOG_DEBUG << "ILU_INTF: p_nhc:" << prev_nhc_cred << " p_phc:" << prev_phc_cred << " p_pdc:" << prev_pdc_cred;
            if(!drain_state && (nhc_cred!=prev_nhc_cred || phc_cred!=prev_phc_cred || pdc_cred!=prev_pdc_cred))
            {
                LOG_DEBUG << "ILU_INTF : IIL has sent IBC credit updates. ";
                LOG_DEBUG << "NHC: " << nhc_cred << " PHC: " << phc_cred << " PDC: " << pdc_cred;
                sc_uint<64> ica_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICA_HW_ADDR);
                sc_uint<64> ici_reg = csr_port.read_csr(PEU_CSR_A_TLU_ICI_HW_ADDR);
                ica_reg.range(NHC) = (sc_uint<8>)(ici_reg(NHC) + nhc_cred + recovered_credits(NHC));
                ica_reg.range(PHC) = (sc_uint<8>)(ici_reg(PHC) + phc_cred + recovered_credits(PHC));
                ica_reg.range(PDC) = (sc_uint<12>)(ici_reg(PDC) + pdc_cred + recovered_credits(PDC));
                csr_port.write_csr(PEU_CSR_A_TLU_ICA_HW_ADDR,ica_reg);
                prev_nhc_cred = nhc_cred;
                prev_phc_cred = phc_cred;
                prev_pdc_cred = pdc_cred;
            }
            p2d_ibc_ack.write(true);
            try{
                WAIT(clk.posedge_event());
                WAIT(clk.posedge_event());
                WAIT(clk.posedge_event());
                WAIT(clk.posedge_event());
                WAIT(clk.posedge_event());
                WAIT(clk.posedge_event());
            }
            catch(sc_exception &e){
                LOG_WARNING<<"ILU_INTF: ilu_credit_update_handler...ending clock wait";
                if(RETRAIN_NO_RESET) wait(clk.posedge_event());
            }
            p2d_ibc_ack.write(false);
        }
    }

    /**
     *  This thread forwards CMPL Timeout requests from the RSB to the ILU.
     */
    void ilu_intf::cto_req_handler(){
        sc_uint<5> cto_req_tag;
        while(1){
            cto_req_port->get(cto_req_tag);
            LOG_WARNING << "ILU_INTF: cto_req_handler recvd: " << cto_req_tag ;
            p2d_cto_req.write(1);
            p2d_cto_tag.write(cto_req_tag);
            try{
                WAIT(d2p_cto_ack.posedge_event());
                p2d_cto_req.write(0);
                WAIT(d2p_cto_ack.negedge_event());
                LOG_INFO << "ILU_INTF: CTO Req handling complete" ;
            }
            catch(sc_exception &e){
                LOG_WARNING<<"ILUT_INTF: cto req handler resetting...";
                p2d_cto_req.write(0);
                p2d_cto_tag.write(0);
            }
        }
    }

    /**
     *  This function updates the requested UE, CE and OE error bits.
     */
    void ilu_intf::write_error_csr(uint8 err_type, uint8 primary, uint8 secondary, char field_name[3]){
        sc_uint<64> orig_csr_val;
        sc_uint<64> new_csr_val=0;
        sc_uint<64> log_enable;

        LOG_DEBUG << "Setting err bit: " << field_name;

        switch(err_type){
            case OE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating OE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case UE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating UE CSR (orig val: " << orig_csr_val << ")";
                     break;
            case CE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_DEBUG << "Updating CE CSR (orig val: " << orig_csr_val << ")";
                     break;
            default: LOG_ERROR << "Warning: undefined error type!";
                     return;
        }

        switch(err_type){
            case OE: log_enable = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);
                     LOG_DEBUG << "OE Log enable            : " << log_enable << ")";
                     break;
            case UE: log_enable = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
                     LOG_DEBUG << "UE Log Enable            : " << log_enable << ")";
                     break;
            case CE: log_enable = csr_port.read_csr(PEU_CSR_A_CE_LOG_HW_ADDR);
                     LOG_DEBUG << "CE Log Enable            : " << log_enable << ")";
                     break;
        }

        if(log_enable.range(primary,primary)==1)
        {
            if(orig_csr_val.range(primary,primary)!=1)
                new_csr_val.range(primary,primary)=1;
            else if(orig_csr_val.range(secondary,secondary)!=1)
                new_csr_val.range(secondary,secondary)=1;
            else
                LOG_DEBUG << "Warning: Both PRIMARY and SECONDARY of " << field_name << "are set.";
        }

        switch(err_type){
            case OE: csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating OE CSR (new val : " << new_csr_val << ")";
                     break;
            case UE: csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating UE CSR (new val : " << new_csr_val << ")";
                     break;
            case CE: csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating CE CSR (new val : " << new_csr_val << ")";
                     break;
        }
        return;
    }//end write_csr_error

    /**
     *  Updates to the Max Payload Size ILU port are reflected into the corresponding CSR.
     */
    void ilu_intf::mps_handler() {
        sc_uint<64>	dev_ctl;
        sc_uint<3> dev_mps;

        csr_port.set_notify_event(PEU_CSR_A_DEV_CTL_HW_ADDR, &dev_ctl_ev);
        while (1) {
            wait (dev_ctl_ev);
            dev_ctl = csr_port.read_csr(PEU_CSR_A_DEV_CTL_HW_ADDR);
            dev_mps = dev_ctl(7,5);
            LOG_DEBUG << "P2D MPS:  " << dev_mps << " Device Ctrl Reg: " << dev_ctl;
            p2d_mps.write(dev_mps);
            LOG_DEBUG << "P2D MPS:  " << dev_mps << " Device Ctrl Reg: " << dev_ctl << " written";
        }
    }

    /**
     *  This thread handles entry and exit of the model from 'drain state'.
     */
    void ilu_intf::drain_handler(){
        sc_event csr_core_status_ev,csr_tlu_status_ev,csr_lnk_ctl_ev;
        csr_port.set_notify_event(PEU_CSR_A_CORE_STATUS_HW_ADDR,&csr_core_status_ev);
        csr_port.set_notify_event(PEU_CSR_A_TLU_STS_HW_ADDR,&csr_tlu_status_ev);
        csr_port.set_notify_event(PEU_CSR_A_LINK_CTL_HW_ADDR,&csr_lnk_ctl_ev);
        while(1){
            wait(drain_req_ev);
            if(!drain_state){
                LOG_DEBUG<<"++++++++++ ILU_INTF: Signaling DRAIN STATE to ILU ++++++++++";
                drain_state=true;
                if(csr_port.read_csr(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR).range(4,4)!=1){
                    //Setting drain bit in PEU Status CSR
                    csr_port.write_csr_mask(PEU_CSR_A_TLU_STS_HW_ADDR,(0x1 << 8),PEU_CSR_TLU_STS_SET_MASK);
                    p2d_drain.write(1);
                }
                *parent_global_event_type = SW_RESET_ENTER; //This state is needed to ensure timers are stopped and to keep updatefcs sent...
                notify(*parent_global_event);
                wait(SC_ZERO_TIME);

                if(csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR).range(9,9)!=1){
                    //Wait for  RESET ASSERT
                    while((csr_port.read_csr(PEU_CSR_A_LINK_CTL_HW_ADDR)).range(0,0)!=0x1) wait(csr_lnk_ctl_ev);
                    LOG_INFO<<"ILU_INTF: Reset-assert bit is set...";
                    //Setting retrain bit in Link Ctrl CSR
                    sc_uint<64> lnk_ctrl_reg = csr_port.read_csr(PEU_CSR_A_LNK_CTL_HW_ADDR);
                    lnk_ctrl_reg(5,5)=1;
                    csr_port.write_csr(PEU_CSR_A_LNK_CTL_HW_ADDR,lnk_ctrl_reg);

                    while((csr_port.read_csr(PEU_CSR_A_CORE_STATUS_HW_ADDR)).range(48,44)!=0x0D) wait(csr_core_status_ev);
                    LOG_WARNING<<"ILU_INTF: PEU now in Recovery...";
                }
                while(1){
                    wait(rst_l.negedge_event()|csr_tlu_status_ev);
                    if(rst_l.read()==0){
                        LOG_WARNING<<"ILU_INTF: PEU now receives RESET_L...";
                        break;
                    }
                    if(csr_port.read_csr(PEU_CSR_A_TLU_STS_HW_ADDR).range(8,8)==0){
                        //cout << "=== ILU_INTF: SW has cleared drain-state bit ===" << endl;
                        sc_uint<D2P_IHB_ADDR_WDTH>	prev_ihb_wr_addr     = ihb_wr_addr;
                        sc_uint<D2P_IHB_ADDR_WDTH+1>	prev_nxt_ihb_wr_addr = nxt_ihb_wr_addr;
                        sc_uint<D2P_IDB_ADDR_WDTH>	prev_idb_wr_addr     = idb_wr_addr;
                        sc_uint<D2P_IDB_ADDR_WDTH+1>	prev_nxt_idb_wr_addr = nxt_idb_wr_addr;

                        RETRAIN_NO_RESET = true;

                        *parent_global_event_type = SW_RESET_EXIT; 
                        notify(*parent_global_event);
                        wait(SC_ZERO_TIME);

                        p2d_drain.write(0);

                        *parent_global_event_type = WMR_RESET_ENTER; 
                        notify(*parent_global_event);
                        wait(SC_ZERO_TIME);

                        *parent_global_event_type = SW_RESET_CHNL_EXIT; 
                        notify(*parent_global_event);
                        wait(SC_ZERO_TIME);

                        *parent_global_event_type = WMR_RESET_EXIT; 
                        notify(*parent_global_event);
                        wait(SC_ZERO_TIME);


                        ihb_wr_addr     = prev_ihb_wr_addr;
                        nxt_ihb_wr_addr = prev_nxt_ihb_wr_addr;
                        p2d_ihb_wptr.write(bin2gc(nxt_ihb_wr_addr));
                        idb_wr_addr     = prev_idb_wr_addr;
                        nxt_idb_wr_addr = prev_nxt_idb_wr_addr;

                        break;
                    }
                }
                if(rst_l.read()==0){
                    *parent_global_event_type = SW_RESET_EXIT; 
                    notify(*parent_global_event);
                    wait(SC_ZERO_TIME);
                    p2d_drain.write(0);

                    *parent_global_event_type = WMR_RESET_ENTER; 
                    notify(*parent_global_event);
                    wait(SC_ZERO_TIME);
                    sc_uint<D2P_IHB_ADDR_WDTH> ihb_wr_addr=0;
                    p2d_ihb_wptr.write(bin2gc(ihb_wr_addr));

                    *parent_global_event_type = SW_RESET_CHNL_EXIT; 
                    notify(*parent_global_event);
                    wait(rst_l.posedge_event());

                    *parent_global_event_type = WMR_RESET_EXIT; 
                    notify(*parent_global_event);
                    wait(SC_ZERO_TIME);
                    drain_state=false;         
                }
            }

        }//end while(1)
    }//end drain_handler()

    /**
     *  This thread monitors the 'link down' event. This event puts the model into 'drain state'
     */
    void ilu_intf::pl_drain_catcher(){
        sc_event csr_status_ev;
        csr_port.set_notify_event(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR,&csr_status_ev);
        while(1){
            wait(csr_status_ev);
            if(!drain_state && csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR).range(9,9)==1) {
                LOG_WARNING<<"ILU_INTF: LINK DOWN...Entering DRAIN state";
                drain_req_ev.notify();
            }
        }
    }

    /**
     *  This method initializes module registers and flags.
     *  It also spawns threads that handle module operation.
     */
    void ilu_intf::init(){
        ihb_empty = true;
        ecd_waddr = 0x00;
        erd_waddr = 0x00;
        ihb_wr_addr = 0;
        nxt_ihb_wr_addr = 0;
        idb_wr_addr = 0;
        nxt_idb_wr_addr = 0;
        recovered_credits=0x0;
        drain_state=false;
        SW_RESET=false;
        POR_RESET=false;
        RETRAIN_NO_RESET=false;
        sc_uint<P2D_EHB_ADDR_WDTH>	erh_addr;
        p2d_erh_rptr.write(bin2gc(erh_addr));
        sc_uint<P2D_EHB_ADDR_WDTH>	ech_addr;
        p2d_ech_rptr.write(bin2gc(ech_addr));
        p2d_ihb_wptr.write(bin2gc(ihb_wr_addr));
        ihb_wptr = bin2gc(ihb_wr_addr);
        ingress_packet_handler_ph = sc_spawn(sc_bind(&ilu_intf::ingress_packet_handler,this));
        egress_packet_handler_ph = sc_spawn(sc_bind(&ilu_intf::egress_packet_handler,this));
        p2d_ce_int.write(0);
        p2d_oe_int.write(0);
        p2d_ue_int.write(0);
        LOG_INFO<<"ILU_INTF: threads spawned...";
    }//end init()

    /**
     *  This thread handles reset behavior of the module. On the arrival of a reset global event,
     *  it issues termination requests to threads in this module. Following the reset exit global event
     *  it invokes init() to re-spawn terminated threads.
     */
    void ilu_intf::reset_handler(){
        while(1){
            wait(*parent_global_event);
            switch(*parent_global_event_type){
                case WMR_RESET_ENTER:
                case POR_RESET_ENTER:
                    POR_RESET=true;
                    reset_ev.notify();
                    //Wait for all thread to terminate
                    while(1){
                        if(ingress_packet_handler_ph.terminated() && egress_packet_handler_ph.terminated()) break;
                        wait(ingress_packet_handler_ph.terminated_event()|egress_packet_handler_ph.terminated_event());
                    }
                    LOG_WARNING << "ILU_INTF: WMR/POR Reset threads terminated" ;
                    LOG_WARNING << "ILU_INTF: WMR/POR Reset dbs cleared" ;
                    break;

                case WMR_RESET_EXIT:
                case POR_RESET_EXIT:
                    LOG_INFO<<"ILU_INTF: WMR/POR Reset exit";
                    init();
                    break;
            }
        }//end while(1)
    }//end reset_handler()

    /**
     *  This thread monitors the 'ihb parity error' event. This event puts the model into 'drain state'
     */
    void ilu_intf::ilu_drain_catcher(){
        sc_event ilu_err_rw1s_ev;
        csr_port.set_notify_event(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR,&ilu_err_rw1s_ev);
        while(1){
            wait(ilu_err_rw1s_ev);
            if(!drain_state && csr_port.read_csr(ILU_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_HW_ADDR).range(4,4)==1) {
                LOG_WARNING<<"ILU_INTF: ILU has detected a parity error...Entering DRAIN state";
                drain_req_ev.notify();
            }
        }
    }


}; // namespace pcie
