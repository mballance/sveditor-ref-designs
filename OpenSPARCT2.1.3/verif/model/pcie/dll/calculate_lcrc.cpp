// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: calculate_lcrc.cpp
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
#include "dll_top.hpp"

namespace pcie {

    /** 
       This function calculates the LCRC value 
    **/
    sc_uint<32> dll_top::calculate_lcrc(RefPciePacket received_packet,int pkt_begin,int pkt_end)
    {
        int index,byte_index;;
        sc_uint<32> tmp_lcrc;
        sc_uint<8> byte; 
        sc_uint<32> lcrc_mapped;

        /// Resetting the initial lcrc value
        lcrc = 0xffffffff;

        for(byte_index=pkt_begin; byte_index < pkt_end; byte_index++)
        {
            byte = received_packet->get_byte(byte_index);
            for (index=0; index < 8; index++)
            {
                tmp_lcrc = lcrc;
                lcrc[0]  = byte[index] ^ tmp_lcrc[31];
                lcrc[1]  = byte[index] ^ tmp_lcrc[0] ^ tmp_lcrc[31];
                lcrc[2]  = byte[index] ^ tmp_lcrc[1] ^ tmp_lcrc[31];
                lcrc[3]  = tmp_lcrc[2];
                lcrc[4]  = byte[index] ^ tmp_lcrc[3] ^ tmp_lcrc[31];
                lcrc[5]  = byte[index] ^ tmp_lcrc[4] ^ tmp_lcrc[31];
                lcrc[6]  = tmp_lcrc[5];
                lcrc[7]  = byte[index] ^ tmp_lcrc[6] ^ tmp_lcrc[31];
                lcrc[8]  = byte[index] ^ tmp_lcrc[7] ^ tmp_lcrc[31];
                lcrc[9]  = tmp_lcrc[8];
                lcrc[10] = byte[index] ^ tmp_lcrc[9] ^ tmp_lcrc[31];
                lcrc[11] = byte[index] ^ tmp_lcrc[10] ^ tmp_lcrc[31];
                lcrc[12] = byte[index] ^ tmp_lcrc[11] ^ tmp_lcrc[31];
                lcrc[13] = tmp_lcrc[12];
                lcrc[14] = tmp_lcrc[13];
                lcrc[15] = tmp_lcrc[14];
                lcrc[16] = byte[index] ^ tmp_lcrc[15] ^ tmp_lcrc[31];
                lcrc[17] = tmp_lcrc[16];
                lcrc[18] = tmp_lcrc[17];
                lcrc[19] = tmp_lcrc[18];
                lcrc[20] = tmp_lcrc[19];
                lcrc[21] = tmp_lcrc[20];
                lcrc[22] = byte[index] ^ tmp_lcrc[21] ^ tmp_lcrc[31];
                lcrc[23] = byte[index] ^ tmp_lcrc[22] ^ tmp_lcrc[31];
                lcrc[24] = tmp_lcrc[23];
                lcrc[25] = tmp_lcrc[24];
                lcrc[26] = byte[index] ^ tmp_lcrc[25] ^ tmp_lcrc[31];
                lcrc[27] = tmp_lcrc[26];
                lcrc[28] = tmp_lcrc[27];
                lcrc[29] = tmp_lcrc[28];
                lcrc[30] = tmp_lcrc[29];
                lcrc[31] = tmp_lcrc[30];

                lcrc_mapped[0] = ~lcrc[7];
                lcrc_mapped[1] = ~lcrc[6];
                lcrc_mapped[2] = ~lcrc[5];
                lcrc_mapped[3] = ~lcrc[4];
                lcrc_mapped[4] = ~lcrc[3];
                lcrc_mapped[5] = ~lcrc[2];
                lcrc_mapped[6] = ~lcrc[1];
                lcrc_mapped[7] = ~lcrc[0];

                lcrc_mapped[8]  = ~lcrc[15];
                lcrc_mapped[9]  = ~lcrc[14];
                lcrc_mapped[10] = ~lcrc[13];
                lcrc_mapped[11] = ~lcrc[12];
                lcrc_mapped[12] = ~lcrc[11];
                lcrc_mapped[13] = ~lcrc[10];
                lcrc_mapped[14] = ~lcrc[9];
                lcrc_mapped[15] = ~lcrc[8];

                lcrc_mapped[16] = ~lcrc[23];
                lcrc_mapped[17] = ~lcrc[22];
                lcrc_mapped[18] = ~lcrc[21];
                lcrc_mapped[19] = ~lcrc[20];
                lcrc_mapped[20] = ~lcrc[19];
                lcrc_mapped[21] = ~lcrc[18];
                lcrc_mapped[22] = ~lcrc[17];
                lcrc_mapped[23] = ~lcrc[16];

                lcrc_mapped[24] = ~lcrc[31];
                lcrc_mapped[25] = ~lcrc[30];
                lcrc_mapped[26] = ~lcrc[29];
                lcrc_mapped[27] = ~lcrc[28];
                lcrc_mapped[28] = ~lcrc[27];
                lcrc_mapped[29] = ~lcrc[26];
                lcrc_mapped[30] = ~lcrc[25];
                lcrc_mapped[31] = ~lcrc[24];
            }// for
        } // for
        return lcrc_mapped;
    }// void calculate_lcrc
}

