// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: calculate_dllp_crc.cpp
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
       This function calculates the crc in the DLL packet
    **/
    sc_uint<16> dll_top::calculate_dllp_crc(RefPciePacket received_packet,int pkt_begin, int pkt_end)
    {
        int index, byte_index;
        sc_uint<8> byte;
        sc_uint<16> tmp_dllp_crc;
        sc_uint<16> dllp_crc_mapped;

        /// Reset initial dllp crc value
        dllp_crc = 0xffff;

        for(byte_index=pkt_begin; byte_index < pkt_end; byte_index++)
        {
            byte = received_packet->get_byte(byte_index);
            for (index=0; index < 8; index++)
            {
                tmp_dllp_crc = dllp_crc;
                dllp_crc[0] = byte[index] ^ tmp_dllp_crc[15];
                dllp_crc[1] = tmp_dllp_crc[0] ^ tmp_dllp_crc[15] ^ byte[index];
                dllp_crc[2] = tmp_dllp_crc[1];
                dllp_crc[3] = tmp_dllp_crc[2] ^  tmp_dllp_crc[15] ^ byte[index];;
                dllp_crc[4] = tmp_dllp_crc[3] ;
                dllp_crc[5] = tmp_dllp_crc[4];
                dllp_crc[6] = tmp_dllp_crc[5];
                dllp_crc[7] = tmp_dllp_crc[6];
                dllp_crc[8] = tmp_dllp_crc[7];
                dllp_crc[9] = tmp_dllp_crc[8];
                dllp_crc[10] = tmp_dllp_crc[9];
                dllp_crc[11] = tmp_dllp_crc[10];
                dllp_crc[12] = tmp_dllp_crc[11] ^ tmp_dllp_crc[15] ^ byte[index];
                dllp_crc[13] = tmp_dllp_crc[12];
                dllp_crc[14] = tmp_dllp_crc[13];
                dllp_crc[15] = tmp_dllp_crc[14];

                dllp_crc_mapped[0] = ~dllp_crc[7];
                dllp_crc_mapped[1] = ~dllp_crc[6];
                dllp_crc_mapped[2] = ~dllp_crc[5];
                dllp_crc_mapped[3] = ~dllp_crc[4];
                dllp_crc_mapped[4] = ~dllp_crc[3];
                dllp_crc_mapped[5] = ~dllp_crc[2];
                dllp_crc_mapped[6] = ~dllp_crc[1];
                dllp_crc_mapped[7] = ~dllp_crc[0];

                dllp_crc_mapped[8] = ~dllp_crc[15];
                dllp_crc_mapped[9] = ~dllp_crc[14];
                dllp_crc_mapped[10] = ~dllp_crc[13];
                dllp_crc_mapped[11] = ~dllp_crc[12];
                dllp_crc_mapped[12] = ~dllp_crc[11];
                dllp_crc_mapped[13] = ~dllp_crc[10];
                dllp_crc_mapped[14] = ~dllp_crc[9];
                dllp_crc_mapped[15] = ~dllp_crc[8];


            }
        }

        return dllp_crc_mapped;
    }

}

