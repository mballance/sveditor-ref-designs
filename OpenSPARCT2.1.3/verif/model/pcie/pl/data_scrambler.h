/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: data_scrambler.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: data_scrambler.h
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
#ifndef INC_data_scrambler_h__
#define INC_data_scrambler_h__

#ifndef __EDG__

#include "systemc.h"
#define LOG_SERVICE
#include "pcie_common/logger.hpp"
#include "pl/encode_map.h"

#define LINK_WIDTH 8

USING_NAMESPACE(Logger)

/// Static scrambler class
/// As the name suggests, it scrambles an 8 bit input
/// according to the PCIex standard LFSR

class data_scrambler
{
    public :
    bool init_done;
    bool scramble_enable;
    bool start_scramble_reg[LINK_WIDTH];

    static data_scrambler *scramble()
    {
        if(scrambler == NULL)
            scrambler = new data_scrambler();
        return scrambler;
    }

    static data_scrambler *descramble()
    {
        if(descrambler == NULL)
            descrambler = new data_scrambler();
        return descrambler;
    }
 
    protected : data_scrambler()
    {
        int i;
        for(i=0;i<LINK_WIDTH;i++)
        {
            lfsr[i] = 0xffff;
            start_scramble_reg[i] = 0;
        }
        scramble_enable = 0;
        init_done = 0;
    }

    public :
    int data_scrambler::scramble_descramble_all(int inbyte,int is_scrambler,int is_control)
    {
        int i,outbyte;
        for(i=0;i<LINK_WIDTH;i++)
            outbyte = scramble_descramble(inbyte,is_scrambler,is_control,i);
        
        return outbyte;
        
    }

    public : 
    int data_scrambler::scramble_descramble(int inbyte,int is_scrambler,int is_control,int lane_num)
    {
        static int scrambit[16][LINK_WIDTH];
        static int bit[16][LINK_WIDTH];
        static int bit_out[16][LINK_WIDTH];
        int i, outbyte;
        if(inbyte == COM && (is_control == 1))
        {
            lfsr[lane_num] = 0xffff;
            return(COM);
        }

        if(inbyte == SKP && (is_scrambler == 0) && (is_control == 1))
        {
            return(SKP);
        }
        for(i=0 ; i< 16; i++)
        {
            bit[i][lane_num] = (lfsr[lane_num] >> i) &1;
        }

        for(i=0 ; i<8 ; i++)
        {
            scrambit[i][lane_num] = (inbyte >> i) &1;
        }

        if(start_scramble_reg[lane_num])
        {
            scrambit[0][lane_num] ^= bit[15][lane_num];
            scrambit[1][lane_num] ^= bit[14][lane_num];
            scrambit[2][lane_num] ^= bit[13][lane_num];
            scrambit[3][lane_num] ^= bit[12][lane_num];
            scrambit[4][lane_num] ^= bit[11][lane_num];
            scrambit[5][lane_num] ^= bit[10][lane_num];
            scrambit[6][lane_num] ^= bit[9][lane_num];
            scrambit[7][lane_num] ^= bit[8][lane_num];
        }

        // Now advance the LFSR 8 serial clocks
        bit_out[ 0][lane_num] = bit[ 8][lane_num];
        bit_out[ 1][lane_num] = bit[ 9][lane_num];
        bit_out[ 2][lane_num] = bit[10][lane_num];
        bit_out[ 3][lane_num] = bit[11][lane_num] ^ bit[ 8][lane_num];
        bit_out[ 4][lane_num] = bit[12][lane_num] ^ bit[ 9][lane_num] ^ bit[ 8][lane_num];
        bit_out[ 5][lane_num] = bit[13][lane_num] ^ bit[10][lane_num] ^ bit[ 9][lane_num] ^ bit[ 8][lane_num];
        bit_out[ 6][lane_num] = bit[14][lane_num] ^ bit[11][lane_num] ^ bit[10][lane_num] ^ bit[ 9][lane_num];
        bit_out[ 7][lane_num] = bit[15][lane_num] ^ bit[12][lane_num] ^ bit[11][lane_num] ^ bit[10][lane_num];
        bit_out[ 8][lane_num] = bit[ 0][lane_num] ^ bit[13][lane_num] ^ bit[12][lane_num] ^ bit[11][lane_num];
        bit_out[ 9][lane_num] = bit[ 1][lane_num] ^ bit[14][lane_num] ^ bit[13][lane_num] ^ bit[12][lane_num];
        bit_out[10][lane_num] = bit[ 2][lane_num] ^ bit[15][lane_num] ^ bit[14][lane_num] ^ bit[13][lane_num];
        bit_out[11][lane_num] = bit[ 3][lane_num] ^ bit[15][lane_num] ^ bit[14][lane_num];
        bit_out[12][lane_num] = bit[ 4][lane_num] ^ bit[15][lane_num];
        bit_out[13][lane_num] = bit[ 5][lane_num];
        bit_out[14][lane_num] = bit[ 6][lane_num];
        bit_out[15][lane_num] = bit[ 7][lane_num];

        lfsr[lane_num] = 0;
        for (i=0; i <16; i++) // convert the LFSR back to an integer
            lfsr[lane_num] += (bit_out[i][lane_num] << i);
        outbyte = 0;
        for (i= 0; i<8; i++) // convert data back to an integer
            outbyte += (scrambit[i][lane_num] << i);

        wait(SC_ZERO_TIME);

        return outbyte;
    }

    void reset()
    {
        int i;
        for(i=0;i<LINK_WIDTH;i++)
        {
            lfsr[i] = 0xffff;
            start_scramble_reg[i] = 0;
        }
        scramble_enable = 0;
    }

    unsigned short get_lfsr(int lane_num)
    {
        return lfsr[lane_num];
    }

    void set_lfsr(unsigned short val,int lane_num)
    {
        lfsr[lane_num] = val;
    }

    private : 
    static data_scrambler *scrambler;
    static data_scrambler *descrambler;
    unsigned short lfsr[LINK_WIDTH];
};

#endif // __EDG__

#endif //INC_data_scrambler_h__
