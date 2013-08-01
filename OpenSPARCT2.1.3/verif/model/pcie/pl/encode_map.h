/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: encode_map.h
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
// OpenSPARC T2 Processor File: encode_map.h
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
#ifndef INC_encode_map_h__
#define INC_encode_map_h__

#include "systemc.h"
#include "pcie_common/logger.hpp"


#include<map>

using namespace std;
using namespace Logger;

class encoder_map : public sc_module
{
    public :
        map<int,int> data_encode_map;
        map<int,int> data_decode_map;
        map<int,int> spec_symbol_map;
        map<int,int> neg_spec_symbol_map;
        map<int,int> neg_data_encode_map;
        map<int,int> neg_data_decode_map;
        map<int,int> spec_symbol_decode_map;
        map<int,int> neg_spec_symbol_decode_map;


        SC_CTOR(encoder_map)
        {
            SC_METHOD(map_entry);
            SC_METHOD(decode_map_entry);
            SC_METHOD(neg_map_entry);
            SC_METHOD(neg_decode_map_entry);
            SC_METHOD(spec_symbol_map_entry);
            SC_METHOD(neg_spec_symbol_map_entry);
            SC_METHOD(decode_spec_symbol_map_entry);
            SC_METHOD(decode_neg_spec_symbol_map_entry);
        }

        
        void map_entry()
        {
            map<int,int>::iterator it;
            data_encode_map.insert(pair<int,int>((0x00),(0x18b)));
            data_encode_map.insert(pair<int,int>((0x01),(0x22b)));
            data_encode_map.insert(pair<int,int>((0x02),(0x12b)));
            data_encode_map.insert(pair<int,int>((0x03),(0x314)));
            data_encode_map.insert(pair<int,int>((0x04),(0x0ab)));
            data_encode_map.insert(pair<int,int>((0x05),(0x294)));
            data_encode_map.insert(pair<int,int>((0x06),(0x194)));
            data_encode_map.insert(pair<int,int>((0x07),(0x074)));
            data_encode_map.insert(pair<int,int>((0x08),(0x06b)));
            data_encode_map.insert(pair<int,int>((0x09),(0x254)));
            data_encode_map.insert(pair<int,int>((0x0a),(0x154)));
            data_encode_map.insert(pair<int,int>((0x0b),(0x344)));
            data_encode_map.insert(pair<int,int>((0x0c),(0x0d4)));
            data_encode_map.insert(pair<int,int>((0x0d),(0x2c4)));
            data_encode_map.insert(pair<int,int>((0x0e),(0x1c4)));
            data_encode_map.insert(pair<int,int>((0x0f),(0x28b)));
            data_encode_map.insert(pair<int,int>((0x10),(0x24b)));
            data_encode_map.insert(pair<int,int>((0x11),(0x234)));
            data_encode_map.insert(pair<int,int>((0x12),(0x134)));
            data_encode_map.insert(pair<int,int>((0x13),(0x324)));
            data_encode_map.insert(pair<int,int>((0x14),(0x0b4)));
            data_encode_map.insert(pair<int,int>((0x15),(0x2a4)));
            data_encode_map.insert(pair<int,int>((0x16),(0x1a4)));

            data_encode_map.insert(pair<int,int>((0x17),(0x05b)));
            data_encode_map.insert(pair<int,int>((0x18),(0x0cb)));
            data_encode_map.insert(pair<int,int>((0x19),(0x264)));
            data_encode_map.insert(pair<int,int>((0x1a),(0x164)));
            data_encode_map.insert(pair<int,int>((0x1b),(0x09b)));
            data_encode_map.insert(pair<int,int>((0x1c),(0x0e4)));
            data_encode_map.insert(pair<int,int>((0x1d),(0x11b)));
            data_encode_map.insert(pair<int,int>((0x1e),(0x21b)));
            data_encode_map.insert(pair<int,int>((0x1f),(0x14b)));
            data_encode_map.insert(pair<int,int>((0x20),(0x189)));
            data_encode_map.insert(pair<int,int>((0x21),(0x229)));
            data_encode_map.insert(pair<int,int>((0x22),(0x129)));
            data_encode_map.insert(pair<int,int>((0x23),(0x319)));
            data_encode_map.insert(pair<int,int>((0x24),(0x0a9)));
            data_encode_map.insert(pair<int,int>((0x25),(0x299)));
            data_encode_map.insert(pair<int,int>((0x26),(0x199)));
            data_encode_map.insert(pair<int,int>((0x27),(0x079)));
            data_encode_map.insert(pair<int,int>((0x28),(0x069)));
            data_encode_map.insert(pair<int,int>((0x29),(0x259)));
            data_encode_map.insert(pair<int,int>((0x2a),(0x159)));
            data_encode_map.insert(pair<int,int>((0x2b),(0x349)));
            data_encode_map.insert(pair<int,int>((0x2c),(0x0d9)));
            data_encode_map.insert(pair<int,int>((0x2d),(0x2c9)));
            data_encode_map.insert(pair<int,int>((0x2e),(0x1c9)));
            data_encode_map.insert(pair<int,int>((0x2f),(0x289)));
            data_encode_map.insert(pair<int,int>((0x30),(0x249)));
            data_encode_map.insert(pair<int,int>((0x31),(0x239)));
            data_encode_map.insert(pair<int,int>((0x32),(0x139)));
            data_encode_map.insert(pair<int,int>((0x33),(0x329)));
            data_encode_map.insert(pair<int,int>((0x34),(0x0b9)));
            data_encode_map.insert(pair<int,int>((0x35),(0x2a9)));
            data_encode_map.insert(pair<int,int>((0x36),(0x1a9)));
            data_encode_map.insert(pair<int,int>((0x37),(0x059)));
            data_encode_map.insert(pair<int,int>((0x38),(0x0c9)));
            data_encode_map.insert(pair<int,int>((0x39),(0x269)));
            data_encode_map.insert(pair<int,int>((0x3a),(0x169)));
            data_encode_map.insert(pair<int,int>((0x3b),(0x099)));
            data_encode_map.insert(pair<int,int>((0x3c),(0x0e9)));
            data_encode_map.insert(pair<int,int>((0x3d),(0x119)));
            data_encode_map.insert(pair<int,int>((0x3e),(0x219)));
            data_encode_map.insert(pair<int,int>((0x3f),(0x149)));
            data_encode_map.insert(pair<int,int>((0x40),(0x185)));
            data_encode_map.insert(pair<int,int>((0x41),(0x225)));
            data_encode_map.insert(pair<int,int>((0x42),(0x125)));
            data_encode_map.insert(pair<int,int>((0x43),(0x315)));
            data_encode_map.insert(pair<int,int>((0x44),(0x0a5)));
            data_encode_map.insert(pair<int,int>((0x45),(0x295)));
            data_encode_map.insert(pair<int,int>((0x46),(0x195)));
            data_encode_map.insert(pair<int,int>((0x47),(0x075)));
            data_encode_map.insert(pair<int,int>((0x48),(0x065)));
            data_encode_map.insert(pair<int,int>((0x49),(0x255)));
            data_encode_map.insert(pair<int,int>((0x4a),(0x155)));
            data_encode_map.insert(pair<int,int>((0x4b),(0x345)));
            data_encode_map.insert(pair<int,int>((0x4c),(0x0d5)));
            data_encode_map.insert(pair<int,int>((0x4d),(0x2c5)));
            data_encode_map.insert(pair<int,int>((0x4e),(0x1c5)));
            data_encode_map.insert(pair<int,int>((0x4f),(0x285)));
            data_encode_map.insert(pair<int,int>((0x50),(0x245)));
            data_encode_map.insert(pair<int,int>((0x51),(0x235)));
            data_encode_map.insert(pair<int,int>((0x52),(0x135)));
            data_encode_map.insert(pair<int,int>((0x53),(0x325)));
            data_encode_map.insert(pair<int,int>((0x54),(0x0b5)));
            data_encode_map.insert(pair<int,int>((0x55),(0x2a5)));
            data_encode_map.insert(pair<int,int>((0x56),(0x1a5)));
            data_encode_map.insert(pair<int,int>((0x57),(0x055)));
            data_encode_map.insert(pair<int,int>((0x58),(0x0c5)));
            data_encode_map.insert(pair<int,int>((0x59),(0x265)));
            data_encode_map.insert(pair<int,int>((0x5a),(0x165)));
            data_encode_map.insert(pair<int,int>((0x5b),(0x095)));
            data_encode_map.insert(pair<int,int>((0x5c),(0x0e5)));
            data_encode_map.insert(pair<int,int>((0x5d),(0x115)));
            data_encode_map.insert(pair<int,int>((0x5e),(0x215)));
            data_encode_map.insert(pair<int,int>((0x5f),(0x145)));
            data_encode_map.insert(pair<int,int>((0x60),(0x18c)));
            data_encode_map.insert(pair<int,int>((0x61),(0x22c)));
            data_encode_map.insert(pair<int,int>((0x62),(0x12c)));
            data_encode_map.insert(pair<int,int>((0x63),(0x313)));
            data_encode_map.insert(pair<int,int>((0x64),(0x0ac)));
            data_encode_map.insert(pair<int,int>((0x65),(0x293)));
            data_encode_map.insert(pair<int,int>((0x66),(0x193)));
            data_encode_map.insert(pair<int,int>((0x67),(0x073)));
            data_encode_map.insert(pair<int,int>((0x68),(0x06c)));
            data_encode_map.insert(pair<int,int>((0x69),(0x253)));
            data_encode_map.insert(pair<int,int>((0x6a),(0x153)));
            data_encode_map.insert(pair<int,int>((0x6b),(0x343)));
            data_encode_map.insert(pair<int,int>((0x6c),(0x0d3)));
            data_encode_map.insert(pair<int,int>((0x6d),(0x2c3)));
            data_encode_map.insert(pair<int,int>((0x6e),(0x1c3)));
            data_encode_map.insert(pair<int,int>((0x6f),(0x28c)));
            data_encode_map.insert(pair<int,int>((0x70),(0x24c)));
            data_encode_map.insert(pair<int,int>((0x71),(0x233)));
            data_encode_map.insert(pair<int,int>((0x72),(0x133)));
            data_encode_map.insert(pair<int,int>((0x73),(0x323)));
            data_encode_map.insert(pair<int,int>((0x74),(0x0b3)));
            data_encode_map.insert(pair<int,int>((0x75),(0x2a3)));
            data_encode_map.insert(pair<int,int>((0x76),(0x1a3)));
            data_encode_map.insert(pair<int,int>((0x77),(0x05c)));
            data_encode_map.insert(pair<int,int>((0x78),(0x0cc)));
            data_encode_map.insert(pair<int,int>((0x79),(0x263)));
            data_encode_map.insert(pair<int,int>((0x7a),(0x163)));
            data_encode_map.insert(pair<int,int>((0x7b),(0x09c)));
            data_encode_map.insert(pair<int,int>((0x7c),(0x0e3)));
            data_encode_map.insert(pair<int,int>((0x7d),(0x11c)));
            data_encode_map.insert(pair<int,int>((0x7e),(0x21c)));
            data_encode_map.insert(pair<int,int>((0x7f),(0x14c)));
            data_encode_map.insert(pair<int,int>((0x80),(0x18d)));
            data_encode_map.insert(pair<int,int>((0x81),(0x22d)));
            data_encode_map.insert(pair<int,int>((0x82),(0x12d)));
            data_encode_map.insert(pair<int,int>((0x83),(0x312)));
            data_encode_map.insert(pair<int,int>((0x84),(0x0ad)));
            data_encode_map.insert(pair<int,int>((0x85),(0x292)));
            data_encode_map.insert(pair<int,int>((0x86),(0x192)));
            data_encode_map.insert(pair<int,int>((0x87),(0x072)));
            data_encode_map.insert(pair<int,int>((0x88),(0x06d)));
            data_encode_map.insert(pair<int,int>((0x89),(0x252)));
            data_encode_map.insert(pair<int,int>((0x8a),(0x152)));
            data_encode_map.insert(pair<int,int>((0x8b),(0x342)));
            data_encode_map.insert(pair<int,int>((0x8c),(0x0d2)));
            data_encode_map.insert(pair<int,int>((0x8d),(0x2c2)));
            data_encode_map.insert(pair<int,int>((0x8e),(0x1c2)));
            data_encode_map.insert(pair<int,int>((0x8f),(0x28d)));
            data_encode_map.insert(pair<int,int>((0x90),(0x24d)));
            data_encode_map.insert(pair<int,int>((0x91),(0x232)));
            data_encode_map.insert(pair<int,int>((0x92),(0x132)));
            data_encode_map.insert(pair<int,int>((0x93),(0x322)));
            data_encode_map.insert(pair<int,int>((0x94),(0x0b2)));
            data_encode_map.insert(pair<int,int>((0x95),(0x2a2)));
            data_encode_map.insert(pair<int,int>((0x96),(0x1a2)));
            data_encode_map.insert(pair<int,int>((0x97),(0x05d)));
            data_encode_map.insert(pair<int,int>((0x98),(0x0cd)));
            data_encode_map.insert(pair<int,int>((0x99),(0x262)));
            data_encode_map.insert(pair<int,int>((0x9a),(0x162)));
            data_encode_map.insert(pair<int,int>((0x9b),(0x09d)));
            data_encode_map.insert(pair<int,int>((0x9c),(0x0e2)));
            data_encode_map.insert(pair<int,int>((0x9d),(0x11d)));
            data_encode_map.insert(pair<int,int>((0x9e),(0x21d)));
            data_encode_map.insert(pair<int,int>((0x9f),(0x14d)));
            data_encode_map.insert(pair<int,int>((0xa0),(0x18a)));
            data_encode_map.insert(pair<int,int>((0xa1),(0x22a)));
            data_encode_map.insert(pair<int,int>((0xa2),(0x12a)));
            data_encode_map.insert(pair<int,int>((0xa3),(0x31a)));
            data_encode_map.insert(pair<int,int>((0xa4),(0x0aa)));
            data_encode_map.insert(pair<int,int>((0xa5),(0x29a)));
            data_encode_map.insert(pair<int,int>((0xa6),(0x19a)));
            data_encode_map.insert(pair<int,int>((0xa7),(0x07a)));
            data_encode_map.insert(pair<int,int>((0xa8),(0x06a)));
            data_encode_map.insert(pair<int,int>((0xa9),(0x25a)));
            data_encode_map.insert(pair<int,int>((0xaa),(0x15a)));
            data_encode_map.insert(pair<int,int>((0xab),(0x34a)));
            data_encode_map.insert(pair<int,int>((0xac),(0x0da)));
            data_encode_map.insert(pair<int,int>((0xad),(0x2ca)));
            data_encode_map.insert(pair<int,int>((0xae),(0x1ca)));
            data_encode_map.insert(pair<int,int>((0xaf),(0x28a)));
            data_encode_map.insert(pair<int,int>((0xb0),(0x24a)));
            data_encode_map.insert(pair<int,int>((0xb1),(0x23a)));
            data_encode_map.insert(pair<int,int>((0xb2),(0x13a)));
            data_encode_map.insert(pair<int,int>((0xb3),(0x32a)));
            data_encode_map.insert(pair<int,int>((0xb4),(0x0ba)));
            data_encode_map.insert(pair<int,int>((0xb5),(0x2aa)));
            data_encode_map.insert(pair<int,int>((0xb6),(0x1aa)));
            data_encode_map.insert(pair<int,int>((0xb7),(0x05a)));
            data_encode_map.insert(pair<int,int>((0xb8),(0x0ca)));
            data_encode_map.insert(pair<int,int>((0xb9),(0x26a)));
            data_encode_map.insert(pair<int,int>((0xba),(0x16a)));
            data_encode_map.insert(pair<int,int>((0xbb),(0x09a)));
            data_encode_map.insert(pair<int,int>((0xbc),(0x0ea)));
            data_encode_map.insert(pair<int,int>((0xbd),(0x11a)));
            data_encode_map.insert(pair<int,int>((0xbe),(0x21a)));
            data_encode_map.insert(pair<int,int>((0xbf),(0x14a)));
            data_encode_map.insert(pair<int,int>((0xc0),(0x186)));
            data_encode_map.insert(pair<int,int>((0xc1),(0x226)));
            data_encode_map.insert(pair<int,int>((0xc2),(0x126)));
            data_encode_map.insert(pair<int,int>((0xc3),(0x316)));
            data_encode_map.insert(pair<int,int>((0xc4),(0x0a6)));
            data_encode_map.insert(pair<int,int>((0xc5),(0x296)));
            data_encode_map.insert(pair<int,int>((0xc6),(0x196)));
            data_encode_map.insert(pair<int,int>((0xc7),(0x076)));
            data_encode_map.insert(pair<int,int>((0xc8),(0x066)));
            data_encode_map.insert(pair<int,int>((0xc9),(0x256)));
            data_encode_map.insert(pair<int,int>((0xca),(0x156)));
            data_encode_map.insert(pair<int,int>((0xcb),(0x346)));
            data_encode_map.insert(pair<int,int>((0xcc),(0x0d6)));
            data_encode_map.insert(pair<int,int>((0xcd),(0x2c6)));
            data_encode_map.insert(pair<int,int>((0xce),(0x1c6)));
            data_encode_map.insert(pair<int,int>((0xcf),(0x286)));
            data_encode_map.insert(pair<int,int>((0xd0),(0x246)));
            data_encode_map.insert(pair<int,int>((0xd1),(0x236)));
            data_encode_map.insert(pair<int,int>((0xd2),(0x136)));
            data_encode_map.insert(pair<int,int>((0xd3),(0x326)));
            data_encode_map.insert(pair<int,int>((0xd4),(0x0b6)));
            data_encode_map.insert(pair<int,int>((0xd5),(0x2a6)));
            data_encode_map.insert(pair<int,int>((0xd6),(0x1a6)));
            data_encode_map.insert(pair<int,int>((0xd7),(0x056)));
            data_encode_map.insert(pair<int,int>((0xd8),(0x0c6)));
            data_encode_map.insert(pair<int,int>((0xd9),(0x266)));
            data_encode_map.insert(pair<int,int>((0xda),(0x166)));
            data_encode_map.insert(pair<int,int>((0xdb),(0x096)));
            data_encode_map.insert(pair<int,int>((0xdc),(0x0e6)));
            data_encode_map.insert(pair<int,int>((0xdd),(0x116)));
            data_encode_map.insert(pair<int,int>((0xde),(0x216)));
            data_encode_map.insert(pair<int,int>((0xdf),(0x146)));
            data_encode_map.insert(pair<int,int>((0xe0),(0x18e)));
            data_encode_map.insert(pair<int,int>((0xe1),(0x22e)));
            data_encode_map.insert(pair<int,int>((0xe2),(0x12e)));
            data_encode_map.insert(pair<int,int>((0xe3),(0x311)));
            data_encode_map.insert(pair<int,int>((0xe4),(0x0ae)));
            data_encode_map.insert(pair<int,int>((0xe5),(0x291)));
            data_encode_map.insert(pair<int,int>((0xe6),(0x191)));
            data_encode_map.insert(pair<int,int>((0xe7),(0x071)));
            data_encode_map.insert(pair<int,int>((0xe8),(0x06e)));
            data_encode_map.insert(pair<int,int>((0xe9),(0x251)));
            data_encode_map.insert(pair<int,int>((0xea),(0x151)));
            data_encode_map.insert(pair<int,int>((0xeb),(0x348)));
            data_encode_map.insert(pair<int,int>((0xec),(0x0d1)));
            data_encode_map.insert(pair<int,int>((0xed),(0x2c8)));
            data_encode_map.insert(pair<int,int>((0xee),(0x1c8)));
            data_encode_map.insert(pair<int,int>((0xef),(0x28e)));
            data_encode_map.insert(pair<int,int>((0xf0),(0x24e)));
            data_encode_map.insert(pair<int,int>((0xf1),(0x231)));
            data_encode_map.insert(pair<int,int>((0xf2),(0x131)));
            data_encode_map.insert(pair<int,int>((0xf3),(0x321)));
            data_encode_map.insert(pair<int,int>((0xf4),(0x0b1)));
            data_encode_map.insert(pair<int,int>((0xf5),(0x2a1)));
            data_encode_map.insert(pair<int,int>((0xf6),(0x1a1)));
            data_encode_map.insert(pair<int,int>((0xf7),(0x05e)));
            data_encode_map.insert(pair<int,int>((0xf8),(0x0ce)));
            data_encode_map.insert(pair<int,int>((0xf9),(0x261)));
            data_encode_map.insert(pair<int,int>((0xfa),(0x161)));
            data_encode_map.insert(pair<int,int>((0xfb),(0x09e)));
            data_encode_map.insert(pair<int,int>((0xfc),(0x0e1)));
            data_encode_map.insert(pair<int,int>((0xfd),(0x11e)));
            data_encode_map.insert(pair<int,int>((0xfe),(0x21e)));
            data_encode_map.insert(pair<int,int>((0xff),(0x14e)));
        }

        void neg_map_entry()
        {
            neg_data_encode_map.insert(pair<int,int>((0x00),(0x274)));
            neg_data_encode_map.insert(pair<int,int>((0x01),(0x1d4)));
            neg_data_encode_map.insert(pair<int,int>((0x02),(0x2d4)));
            neg_data_encode_map.insert(pair<int,int>((0x03),(0x31b)));
            neg_data_encode_map.insert(pair<int,int>((0x04),(0x354)));
            neg_data_encode_map.insert(pair<int,int>((0x05),(0x29b)));
            neg_data_encode_map.insert(pair<int,int>((0x06),(0x19b)));
            neg_data_encode_map.insert(pair<int,int>((0x07),(0x38b)));
            neg_data_encode_map.insert(pair<int,int>((0x08),(0x394)));
            neg_data_encode_map.insert(pair<int,int>((0x09),(0x25b)));
            neg_data_encode_map.insert(pair<int,int>((0x0a),(0x15b)));
            neg_data_encode_map.insert(pair<int,int>((0x0b),(0x34b)));
            neg_data_encode_map.insert(pair<int,int>((0x0c),(0x0db)));
            neg_data_encode_map.insert(pair<int,int>((0x0d),(0x2cb)));
            neg_data_encode_map.insert(pair<int,int>((0x0e),(0x1cb)));
            neg_data_encode_map.insert(pair<int,int>((0x0f),(0x174)));
            neg_data_encode_map.insert(pair<int,int>((0x10),(0x1b4)));
            neg_data_encode_map.insert(pair<int,int>((0x11),(0x23b)));
            neg_data_encode_map.insert(pair<int,int>((0x12),(0x13b)));
            neg_data_encode_map.insert(pair<int,int>((0x13),(0x32b)));
            neg_data_encode_map.insert(pair<int,int>((0x14),(0x0bb)));
            neg_data_encode_map.insert(pair<int,int>((0x15),(0x2ab)));
            neg_data_encode_map.insert(pair<int,int>((0x16),(0x1ab)));

            neg_data_encode_map.insert(pair<int,int>((0x17),(0x3a4)));
            neg_data_encode_map.insert(pair<int,int>((0x18),(0x334)));
            neg_data_encode_map.insert(pair<int,int>((0x19),(0x26b)));
            neg_data_encode_map.insert(pair<int,int>((0x1a),(0x16b)));
            neg_data_encode_map.insert(pair<int,int>((0x1b),(0x364)));
            neg_data_encode_map.insert(pair<int,int>((0x1c),(0x0eb)));
            neg_data_encode_map.insert(pair<int,int>((0x1d),(0x2e4)));
            neg_data_encode_map.insert(pair<int,int>((0x1e),(0x1e4)));
            neg_data_encode_map.insert(pair<int,int>((0x1f),(0x2b4)));
            neg_data_encode_map.insert(pair<int,int>((0x20),(0x279)));
            neg_data_encode_map.insert(pair<int,int>((0x21),(0x1d9)));
            neg_data_encode_map.insert(pair<int,int>((0x22),(0x2d9)));
            neg_data_encode_map.insert(pair<int,int>((0x23),(0x319)));
            neg_data_encode_map.insert(pair<int,int>((0x24),(0x359)));
            neg_data_encode_map.insert(pair<int,int>((0x25),(0x299)));
            neg_data_encode_map.insert(pair<int,int>((0x26),(0x199)));
            neg_data_encode_map.insert(pair<int,int>((0x27),(0x389)));
            neg_data_encode_map.insert(pair<int,int>((0x28),(0x399)));
            neg_data_encode_map.insert(pair<int,int>((0x29),(0x259)));
            neg_data_encode_map.insert(pair<int,int>((0x2a),(0x159)));
            neg_data_encode_map.insert(pair<int,int>((0x2b),(0x349)));
            neg_data_encode_map.insert(pair<int,int>((0x2c),(0x0d9)));
            neg_data_encode_map.insert(pair<int,int>((0x2d),(0x2c9)));
            neg_data_encode_map.insert(pair<int,int>((0x2e),(0x1c9)));
            neg_data_encode_map.insert(pair<int,int>((0x2f),(0x179)));
            neg_data_encode_map.insert(pair<int,int>((0x30),(0x1b9)));
            neg_data_encode_map.insert(pair<int,int>((0x31),(0x239)));
            neg_data_encode_map.insert(pair<int,int>((0x32),(0x139)));
            neg_data_encode_map.insert(pair<int,int>((0x33),(0x329)));
            neg_data_encode_map.insert(pair<int,int>((0x34),(0x0b9)));
            neg_data_encode_map.insert(pair<int,int>((0x35),(0x2a9)));
            neg_data_encode_map.insert(pair<int,int>((0x36),(0x1a9)));
            neg_data_encode_map.insert(pair<int,int>((0x37),(0x3a9)));
            neg_data_encode_map.insert(pair<int,int>((0x38),(0x339)));
            neg_data_encode_map.insert(pair<int,int>((0x39),(0x269)));
            neg_data_encode_map.insert(pair<int,int>((0x3a),(0x169)));
            neg_data_encode_map.insert(pair<int,int>((0x3b),(0x369)));
            neg_data_encode_map.insert(pair<int,int>((0x3c),(0x0e9)));
            neg_data_encode_map.insert(pair<int,int>((0x3d),(0x2e9)));
            neg_data_encode_map.insert(pair<int,int>((0x3e),(0x1e9)));
            neg_data_encode_map.insert(pair<int,int>((0x3f),(0x2b9)));
            neg_data_encode_map.insert(pair<int,int>((0x40),(0x275)));
            neg_data_encode_map.insert(pair<int,int>((0x41),(0x1d5)));
            neg_data_encode_map.insert(pair<int,int>((0x42),(0x2d5)));
            neg_data_encode_map.insert(pair<int,int>((0x43),(0x315)));
            neg_data_encode_map.insert(pair<int,int>((0x44),(0x355)));
            neg_data_encode_map.insert(pair<int,int>((0x45),(0x295)));
            neg_data_encode_map.insert(pair<int,int>((0x46),(0x195)));
            neg_data_encode_map.insert(pair<int,int>((0x47),(0x385)));
            neg_data_encode_map.insert(pair<int,int>((0x48),(0x395)));
            neg_data_encode_map.insert(pair<int,int>((0x49),(0x255)));
            neg_data_encode_map.insert(pair<int,int>((0x4a),(0x155)));
            neg_data_encode_map.insert(pair<int,int>((0x4b),(0x345)));
            neg_data_encode_map.insert(pair<int,int>((0x4c),(0x0d5)));
            neg_data_encode_map.insert(pair<int,int>((0x4d),(0x2c5)));
            neg_data_encode_map.insert(pair<int,int>((0x4e),(0x1c5)));
            neg_data_encode_map.insert(pair<int,int>((0x4f),(0x175)));
            neg_data_encode_map.insert(pair<int,int>((0x50),(0x1b5)));
            neg_data_encode_map.insert(pair<int,int>((0x51),(0x235)));
            neg_data_encode_map.insert(pair<int,int>((0x52),(0x135)));
            neg_data_encode_map.insert(pair<int,int>((0x53),(0x325)));
            neg_data_encode_map.insert(pair<int,int>((0x54),(0x0b5)));
            neg_data_encode_map.insert(pair<int,int>((0x55),(0x2a5)));
            neg_data_encode_map.insert(pair<int,int>((0x56),(0x1a5)));
            neg_data_encode_map.insert(pair<int,int>((0x57),(0x3a5)));
            neg_data_encode_map.insert(pair<int,int>((0x58),(0x335)));
            neg_data_encode_map.insert(pair<int,int>((0x59),(0x265)));
            neg_data_encode_map.insert(pair<int,int>((0x5a),(0x165)));
            neg_data_encode_map.insert(pair<int,int>((0x5b),(0x365)));
            neg_data_encode_map.insert(pair<int,int>((0x5c),(0x0e5)));
            neg_data_encode_map.insert(pair<int,int>((0x5d),(0x2e5)));
            neg_data_encode_map.insert(pair<int,int>((0x5e),(0x1e5)));
            neg_data_encode_map.insert(pair<int,int>((0x5f),(0x2b5)));
            neg_data_encode_map.insert(pair<int,int>((0x60),(0x273)));
            neg_data_encode_map.insert(pair<int,int>((0x61),(0x1d3)));
            neg_data_encode_map.insert(pair<int,int>((0x62),(0x2d3)));
            neg_data_encode_map.insert(pair<int,int>((0x63),(0x31c)));
            neg_data_encode_map.insert(pair<int,int>((0x64),(0x353)));
            neg_data_encode_map.insert(pair<int,int>((0x65),(0x29c)));
            neg_data_encode_map.insert(pair<int,int>((0x66),(0x19c)));
            neg_data_encode_map.insert(pair<int,int>((0x67),(0x38c)));
            neg_data_encode_map.insert(pair<int,int>((0x68),(0x393)));
            neg_data_encode_map.insert(pair<int,int>((0x69),(0x25c)));
            neg_data_encode_map.insert(pair<int,int>((0x6a),(0x15c)));
            neg_data_encode_map.insert(pair<int,int>((0x6b),(0x34c)));
            neg_data_encode_map.insert(pair<int,int>((0x6c),(0x0dc)));
            neg_data_encode_map.insert(pair<int,int>((0x6d),(0x2cc)));
            neg_data_encode_map.insert(pair<int,int>((0x6e),(0x1cc)));
            neg_data_encode_map.insert(pair<int,int>((0x6f),(0x173)));
            neg_data_encode_map.insert(pair<int,int>((0x70),(0x1b3)));
            neg_data_encode_map.insert(pair<int,int>((0x71),(0x23c)));
            neg_data_encode_map.insert(pair<int,int>((0x72),(0x13c)));
            neg_data_encode_map.insert(pair<int,int>((0x73),(0x32c)));
            neg_data_encode_map.insert(pair<int,int>((0x74),(0x0bc)));
            neg_data_encode_map.insert(pair<int,int>((0x75),(0x2ac)));
            neg_data_encode_map.insert(pair<int,int>((0x76),(0x1ac)));
            neg_data_encode_map.insert(pair<int,int>((0x77),(0x3a3)));
            neg_data_encode_map.insert(pair<int,int>((0x78),(0x333)));
            neg_data_encode_map.insert(pair<int,int>((0x79),(0x26c)));
            neg_data_encode_map.insert(pair<int,int>((0x7a),(0x16c)));
            neg_data_encode_map.insert(pair<int,int>((0x7b),(0x363)));
            neg_data_encode_map.insert(pair<int,int>((0x7c),(0x0ec)));
            neg_data_encode_map.insert(pair<int,int>((0x7d),(0x2e3)));
            neg_data_encode_map.insert(pair<int,int>((0x7e),(0x1e3)));
            neg_data_encode_map.insert(pair<int,int>((0x7f),(0x2b3)));
            neg_data_encode_map.insert(pair<int,int>((0x80),(0x272)));
            neg_data_encode_map.insert(pair<int,int>((0x81),(0x1d2)));
            neg_data_encode_map.insert(pair<int,int>((0x82),(0x2d2)));
            neg_data_encode_map.insert(pair<int,int>((0x83),(0x31d)));
            neg_data_encode_map.insert(pair<int,int>((0x84),(0x352)));
            neg_data_encode_map.insert(pair<int,int>((0x85),(0x29d)));
            neg_data_encode_map.insert(pair<int,int>((0x86),(0x19d)));
            neg_data_encode_map.insert(pair<int,int>((0x87),(0x38d)));
            neg_data_encode_map.insert(pair<int,int>((0x88),(0x392)));
            neg_data_encode_map.insert(pair<int,int>((0x89),(0x25d)));
            neg_data_encode_map.insert(pair<int,int>((0x8a),(0x15d)));
            neg_data_encode_map.insert(pair<int,int>((0x8b),(0x34d)));
            neg_data_encode_map.insert(pair<int,int>((0x8c),(0x0dd)));
            neg_data_encode_map.insert(pair<int,int>((0x8d),(0x2cd)));
            neg_data_encode_map.insert(pair<int,int>((0x8e),(0x1cd)));
            neg_data_encode_map.insert(pair<int,int>((0x8f),(0x172)));
            neg_data_encode_map.insert(pair<int,int>((0x90),(0x1b2)));
            neg_data_encode_map.insert(pair<int,int>((0x91),(0x23d)));
            neg_data_encode_map.insert(pair<int,int>((0x92),(0x13d)));
            neg_data_encode_map.insert(pair<int,int>((0x93),(0x32d)));
            neg_data_encode_map.insert(pair<int,int>((0x94),(0x0bd)));
            neg_data_encode_map.insert(pair<int,int>((0x95),(0x2ad)));
            neg_data_encode_map.insert(pair<int,int>((0x96),(0x1ad)));
            neg_data_encode_map.insert(pair<int,int>((0x97),(0x3a2)));
            neg_data_encode_map.insert(pair<int,int>((0x98),(0x332)));
            neg_data_encode_map.insert(pair<int,int>((0x99),(0x26d)));
            neg_data_encode_map.insert(pair<int,int>((0x9a),(0x16d)));
            neg_data_encode_map.insert(pair<int,int>((0x9b),(0x362)));
            neg_data_encode_map.insert(pair<int,int>((0x9c),(0x0ed)));
            neg_data_encode_map.insert(pair<int,int>((0x9d),(0x2e2)));
            neg_data_encode_map.insert(pair<int,int>((0x9e),(0x1e2)));
            neg_data_encode_map.insert(pair<int,int>((0x9f),(0x2b2)));
            neg_data_encode_map.insert(pair<int,int>((0xa0),(0x27a)));
            neg_data_encode_map.insert(pair<int,int>((0xa1),(0x1da)));
            neg_data_encode_map.insert(pair<int,int>((0xa2),(0x2da)));
            neg_data_encode_map.insert(pair<int,int>((0xa3),(0x31a)));
            neg_data_encode_map.insert(pair<int,int>((0xa4),(0x35a)));
            neg_data_encode_map.insert(pair<int,int>((0xa5),(0x29a)));
            neg_data_encode_map.insert(pair<int,int>((0xa6),(0x19a)));
            neg_data_encode_map.insert(pair<int,int>((0xa7),(0x38a)));
            neg_data_encode_map.insert(pair<int,int>((0xa8),(0x39a)));
            neg_data_encode_map.insert(pair<int,int>((0xa9),(0x25a)));
            neg_data_encode_map.insert(pair<int,int>((0xaa),(0x15a)));
            neg_data_encode_map.insert(pair<int,int>((0xab),(0x34a)));
            neg_data_encode_map.insert(pair<int,int>((0xac),(0x0da)));
            neg_data_encode_map.insert(pair<int,int>((0xad),(0x2ca)));
            neg_data_encode_map.insert(pair<int,int>((0xae),(0x1ca)));
            neg_data_encode_map.insert(pair<int,int>((0xaf),(0x17a)));
            neg_data_encode_map.insert(pair<int,int>((0xb0),(0x1ba)));
            neg_data_encode_map.insert(pair<int,int>((0xb1),(0x23a)));
            neg_data_encode_map.insert(pair<int,int>((0xb2),(0x13a)));
            neg_data_encode_map.insert(pair<int,int>((0xb3),(0x32a)));
            neg_data_encode_map.insert(pair<int,int>((0xb4),(0x0ba)));
            neg_data_encode_map.insert(pair<int,int>((0xb5),(0x2aa)));
            neg_data_encode_map.insert(pair<int,int>((0xb6),(0x1aa)));
            neg_data_encode_map.insert(pair<int,int>((0xb7),(0x3aa)));
            neg_data_encode_map.insert(pair<int,int>((0xb8),(0x33a)));
            neg_data_encode_map.insert(pair<int,int>((0xb9),(0x26a)));
            neg_data_encode_map.insert(pair<int,int>((0xba),(0x16a)));
            neg_data_encode_map.insert(pair<int,int>((0xbb),(0x36a)));
            neg_data_encode_map.insert(pair<int,int>((0xbc),(0x0ea)));
            neg_data_encode_map.insert(pair<int,int>((0xbd),(0x2ea)));
            neg_data_encode_map.insert(pair<int,int>((0xbe),(0x1ea)));
            neg_data_encode_map.insert(pair<int,int>((0xbf),(0x2ba)));
            neg_data_encode_map.insert(pair<int,int>((0xc0),(0x276)));
            neg_data_encode_map.insert(pair<int,int>((0xc1),(0x1d6)));
            neg_data_encode_map.insert(pair<int,int>((0xc2),(0x2d6)));
            neg_data_encode_map.insert(pair<int,int>((0xc3),(0x316)));
            neg_data_encode_map.insert(pair<int,int>((0xc4),(0x356)));
            neg_data_encode_map.insert(pair<int,int>((0xc5),(0x296)));
            neg_data_encode_map.insert(pair<int,int>((0xc6),(0x196)));
            neg_data_encode_map.insert(pair<int,int>((0xc7),(0x386)));
            neg_data_encode_map.insert(pair<int,int>((0xc8),(0x396)));
            neg_data_encode_map.insert(pair<int,int>((0xc9),(0x256)));
            neg_data_encode_map.insert(pair<int,int>((0xca),(0x156)));
            neg_data_encode_map.insert(pair<int,int>((0xcb),(0x346)));
            neg_data_encode_map.insert(pair<int,int>((0xcc),(0x0d6)));
            neg_data_encode_map.insert(pair<int,int>((0xcd),(0x2c6)));
            neg_data_encode_map.insert(pair<int,int>((0xce),(0x1c6)));
            neg_data_encode_map.insert(pair<int,int>((0xcf),(0x176)));
            neg_data_encode_map.insert(pair<int,int>((0xd0),(0x1b6)));
            neg_data_encode_map.insert(pair<int,int>((0xd1),(0x236)));
            neg_data_encode_map.insert(pair<int,int>((0xd2),(0x136)));
            neg_data_encode_map.insert(pair<int,int>((0xd3),(0x326)));
            neg_data_encode_map.insert(pair<int,int>((0xd4),(0x0b6)));
            neg_data_encode_map.insert(pair<int,int>((0xd5),(0x2a6)));
            neg_data_encode_map.insert(pair<int,int>((0xd6),(0x1a6)));
            neg_data_encode_map.insert(pair<int,int>((0xd7),(0x3a6)));
            neg_data_encode_map.insert(pair<int,int>((0xd8),(0x336)));
            neg_data_encode_map.insert(pair<int,int>((0xd9),(0x266)));
            neg_data_encode_map.insert(pair<int,int>((0xda),(0x166)));
            neg_data_encode_map.insert(pair<int,int>((0xdb),(0x366)));
            neg_data_encode_map.insert(pair<int,int>((0xdc),(0x0e6)));
            neg_data_encode_map.insert(pair<int,int>((0xdd),(0x2e6)));
            neg_data_encode_map.insert(pair<int,int>((0xde),(0x1e6)));
            neg_data_encode_map.insert(pair<int,int>((0xdf),(0x2b6)));
            neg_data_encode_map.insert(pair<int,int>((0xe0),(0x271)));
            neg_data_encode_map.insert(pair<int,int>((0xe1),(0x1d1)));
            neg_data_encode_map.insert(pair<int,int>((0xe2),(0x2d1)));
            neg_data_encode_map.insert(pair<int,int>((0xe3),(0x31e)));
            neg_data_encode_map.insert(pair<int,int>((0xe4),(0x351)));
            neg_data_encode_map.insert(pair<int,int>((0xe5),(0x29e)));
            neg_data_encode_map.insert(pair<int,int>((0xe6),(0x19e)));
            neg_data_encode_map.insert(pair<int,int>((0xe7),(0x38e)));
            neg_data_encode_map.insert(pair<int,int>((0xe8),(0x391)));
            neg_data_encode_map.insert(pair<int,int>((0xe9),(0x25e)));
            neg_data_encode_map.insert(pair<int,int>((0xea),(0x15e)));
            neg_data_encode_map.insert(pair<int,int>((0xeb),(0x34e)));
            neg_data_encode_map.insert(pair<int,int>((0xec),(0x0de)));
            neg_data_encode_map.insert(pair<int,int>((0xed),(0x2ce)));
            neg_data_encode_map.insert(pair<int,int>((0xee),(0x1ce)));
            neg_data_encode_map.insert(pair<int,int>((0xef),(0x171)));
            neg_data_encode_map.insert(pair<int,int>((0xf0),(0x1b1)));
            neg_data_encode_map.insert(pair<int,int>((0xf1),(0x237)));
            neg_data_encode_map.insert(pair<int,int>((0xf2),(0x137)));
            neg_data_encode_map.insert(pair<int,int>((0xf3),(0x32e)));
            neg_data_encode_map.insert(pair<int,int>((0xf4),(0x0b7)));
            neg_data_encode_map.insert(pair<int,int>((0xf5),(0x2ae)));
            neg_data_encode_map.insert(pair<int,int>((0xf6),(0x1ae)));
            neg_data_encode_map.insert(pair<int,int>((0xf7),(0x3a1)));
            neg_data_encode_map.insert(pair<int,int>((0xf8),(0x331)));
            neg_data_encode_map.insert(pair<int,int>((0xf9),(0x26e)));
            neg_data_encode_map.insert(pair<int,int>((0xfa),(0x16e)));
            neg_data_encode_map.insert(pair<int,int>((0xfb),(0x361)));
            neg_data_encode_map.insert(pair<int,int>((0xfc),(0x0ee)));
            neg_data_encode_map.insert(pair<int,int>((0xfd),(0x2e1)));
            neg_data_encode_map.insert(pair<int,int>((0xfe),(0x1e1)));
            neg_data_encode_map.insert(pair<int,int>((0xff),(0x2b1)));

        }

        void decode_map_entry()
        {
            map<int,int>::iterator it;
            for(it=data_encode_map.begin(); it != data_encode_map.end(); it++)
            {
                data_decode_map[it->second] = it->first;
            }
        }

        void neg_decode_map_entry()
        {
            map<int,int>::iterator it;
            for(it=neg_data_encode_map.begin(); it != neg_data_encode_map.end(); it++)
            {
                neg_data_decode_map[it->second] = it->first;
            }
        }

        void spec_symbol_map_entry()
        {
            spec_symbol_map.insert(pair<int,int>((0x1c),(0x30b)));
            spec_symbol_map.insert(pair<int,int>((0x3c),(0x306)));
            spec_symbol_map.insert(pair<int,int>((0x5c),(0x30a)));
            spec_symbol_map.insert(pair<int,int>((0x7c),(0x30c)));
            spec_symbol_map.insert(pair<int,int>((0x9c),(0x30d)));
            spec_symbol_map.insert(pair<int,int>((0xbc),(0x305)));
            spec_symbol_map.insert(pair<int,int>((0xdc),(0x309)));
            spec_symbol_map.insert(pair<int,int>((0xfc),(0x307)));
            spec_symbol_map.insert(pair<int,int>((0xf7),(0x057)));
            spec_symbol_map.insert(pair<int,int>((0xfb),(0x097)));
            spec_symbol_map.insert(pair<int,int>((0xfd),(0x117)));
            spec_symbol_map.insert(pair<int,int>((0xfe),(0x217)));
        }

        void neg_spec_symbol_map_entry()
        {
            map<int,int>::iterator it;
            neg_spec_symbol_map.insert(pair<int,int>((0x1c),(0x0f4)));
            neg_spec_symbol_map.insert(pair<int,int>((0x3c),(0x0f9)));
            neg_spec_symbol_map.insert(pair<int,int>((0x5c),(0x0f5)));
            neg_spec_symbol_map.insert(pair<int,int>((0x7c),(0x0f3)));
            neg_spec_symbol_map.insert(pair<int,int>((0x9c),(0x0f2)));
            neg_spec_symbol_map.insert(pair<int,int>((0xbc),(0x0fa)));
            neg_spec_symbol_map.insert(pair<int,int>((0xdc),(0x0f6)));
            neg_spec_symbol_map.insert(pair<int,int>((0xfc),(0x0f8)));
            neg_spec_symbol_map.insert(pair<int,int>((0xf7),(0x3a8)));
            neg_spec_symbol_map.insert(pair<int,int>((0xfb),(0x368)));
            neg_spec_symbol_map.insert(pair<int,int>((0xfd),(0x2e8)));
            neg_spec_symbol_map.insert(pair<int,int>((0xfe),(0x1e8)));
        }

        void decode_spec_symbol_map_entry()
        {
            map<int,int>::iterator it;
            for(it = spec_symbol_map.begin(); it != spec_symbol_map.end(); it++)
            {
                spec_symbol_decode_map[it->second] = it->first;
            }
        }

        void decode_neg_spec_symbol_map_entry()
        {
            map<int,int>::iterator it;
            for(it = neg_spec_symbol_map.begin(); it != neg_spec_symbol_map.end(); it++)
            {
                neg_spec_symbol_decode_map[it->second] = it->first;
            }
        }


            

};
#endif

                    
        
