// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_mac_interface.cpp
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
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_mac_interface.cpp
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
#include <stdio.h>
#include <stdlib.h>
#include <systemc.h>

#include "niu_mac_interface.h"
#include "sharedmem.h"

#include "niu_debug_functions.h"


#define symbolA 0x7C
#define symbolR 0x1C
#define symbolK 0xBC
#define symbolS 0xFB
#define symbolT 0xFD


extern sharedmem *shmem;


niu_mac_interface::niu_mac_interface(sc_module_name) {
  SC_METHOD(mac_tx);
  sensitive << mac_clk.pos(); 
  SC_METHOD(mac_rx);
  sensitive << mac_clk.pos(); 
  xaui0_start = 0; xaui1_start = 0;
  xaui0_size = 0;  xaui1_size = 0;
  
  for(int i=0;i<1024;i++) decode10b8b[i].type = -1;
 
  for(int i=0;i<256;i++) {
    decode10b8b[Dcode8b10b[i].pos].data = i;
    decode10b8b[Dcode8b10b[i].neg].data = i;
    decode10b8b[Dcode8b10b[i].pos].type = 0;
    decode10b8b[Dcode8b10b[i].neg].type = 0;
	
  }
  for(int i=0;i<12;i++) {
    decode10b8b[Kcode8b10b[i].pos].data = Kcode8b10b[i].code;
    decode10b8b[Kcode8b10b[i].neg].data = Kcode8b10b[i].code;
    decode10b8b[Kcode8b10b[i].pos].type = 1;
    decode10b8b[Kcode8b10b[i].neg].type = 1;
  }
  xaui_rx_count[0] = xaui_rx_count[1] = -2;
  xaui_rx_size[0] = xaui_rx_size[1] = 0;
  for(int i=0;i<4;i++) rdisparity0[i] = rdisparity1[i] = -1;
}

//After start send: ||S|| 55 55 55 ; 55 55 55 d5

void niu_mac_interface::mac_tx() {
  //receive data from niu model through shared memory
  //compute checksum and send the data to xaui
  if(!reset.read()) {
    int symbol = lfsr();
    int code;
    int codes0[4];
    int codes1[4];

    if(shmem)
    if(shmem->tx0_wait_packet(xaui0_size, xaui0_data)) {
      xaui0_start = 1; xaui0_count = 0;
      xaui0_size++; // to accomodate terminate symbol;
    }
    if(shmem)
    if(shmem->tx1_wait_packet(xaui1_size, xaui1_data)) {
      xaui1_start = 1; xaui1_count = 0;
      xaui1_size++; // to accomodate terminate symbol;
    }

    if(xaui0_size) {
      if(xaui0_start == 1) {
        codes0[0] = get10BCode(CODE, rdisparity0[0], symbolS);
        for(int i=1;i<4;i++) codes0[i] = get10BCode(DATA, rdisparity0[i], 0x55);
	xaui0_start++;
      } else if (xaui0_start == 2) {
        for(int i=0;i<4;i++) codes0[i] = get10BCode(DATA, rdisparity0[i], (i == 3) ? 0xd5 : 0x55);
	xaui0_start = 0;
      } else {
        if(xaui0_size > 4) {
          xaui0_size -= 4;
	  for(int i=0;i<4;i++) codes0[i] = get10BCode(DATA, rdisparity0[i], xaui0_data[xaui0_count++]);
        } else {
          for(int i=0;i<xaui0_size-1;i++) codes0[i] = get10BCode(DATA, rdisparity0[i], xaui0_data[xaui0_count++]);
          codes0[xaui0_size-1] = get10BCode(CODE, rdisparity0[xaui0_size-1], symbolT);
          for(int i=xaui0_size;i<4;i++) codes0[i] = get10BCode(CODE, rdisparity0[i], symbolK);
          xaui0_size = 0;
          shmem->tx0_packet_sent();
        }
      }
      mac_esr_txd0_0.write(codes0[0]);
      mac_esr_txd1_0.write(codes0[1]);
      mac_esr_txd2_0.write(codes0[2]);
      mac_esr_txd3_0.write(codes0[3]);
    } else {
      code = get10BCode(CODE, rdisparity0[0], symbol); mac_esr_txd0_0.write(code);
      code = get10BCode(CODE, rdisparity0[1], symbol); mac_esr_txd1_0.write(code);
      code = get10BCode(CODE, rdisparity0[2], symbol); mac_esr_txd2_0.write(code);
      code = get10BCode(CODE, rdisparity0[3], symbol); mac_esr_txd3_0.write(code);
    }

    if(xaui1_size) {
      if(xaui1_start == 1) {
        codes1[0] = get10BCode(CODE, rdisparity1[0], symbolS);
        for(int i=1;i<4;i++) codes1[i] = get10BCode(DATA, rdisparity1[i], 0x55);
        xaui1_start++;
      } else if (xaui1_start == 2) {
        for(int i=0;i<4;i++) codes1[i] = get10BCode(DATA, rdisparity1[i], (i == 3) ? 0xd5 : 0x55);
        xaui1_start = 0;
      } else {
        if(xaui1_size > 4) {
          xaui1_size -= 4;
          for(int i=0;i<4;i++) codes1[i] = get10BCode(DATA, rdisparity1[i], xaui1_data[xaui1_count++]);
        } else {
          for(int i=0;i<xaui1_size-1;i++) codes1[i] = get10BCode(DATA, rdisparity1[i], xaui1_data[xaui1_count++]);
          codes1[xaui1_size-1] = get10BCode(CODE, rdisparity1[xaui1_size-1], symbolT);
          for(int i=xaui1_size;i<4;i++) codes1[i] = get10BCode(CODE, rdisparity1[i], symbolK);
          xaui1_size = 0;
          shmem->tx1_packet_sent();
        }
      }
      mac_esr_txd0_1.write(codes1[0]);
      mac_esr_txd1_1.write(codes1[1]);
      mac_esr_txd2_1.write(codes1[2]);
      mac_esr_txd3_1.write(codes1[3]);
    } else{
      code = get10BCode(CODE, rdisparity1[0], symbol); mac_esr_txd0_1.write(code);
      code = get10BCode(CODE, rdisparity1[1], symbol); mac_esr_txd1_1.write(code);
      code = get10BCode(CODE, rdisparity1[2], symbol); mac_esr_txd2_1.write(code);
      code = get10BCode(CODE, rdisparity1[3], symbol); mac_esr_txd3_1.write(code);
    }
  } else {
    xaui0_start = 0; xaui1_start = 0;
    xaui0_size = 0;  xaui1_size = 0;
    mac_esr_txd0_0.write("0000000000");
    mac_esr_txd1_0.write("0000000000");
    mac_esr_txd2_0.write("0000000000");
    mac_esr_txd3_0.write("0000000000");
    mac_esr_txd0_1.write("0000000000");
    mac_esr_txd1_1.write("0000000000");
    mac_esr_txd2_1.write("0000000000");
    mac_esr_txd3_1.write("0000000000");
    //negative running disparity after reset
    for(int i=0;i<4;i++) rdisparity0[i] = rdisparity1[i] = -1; 
  }

}

void niu_mac_interface::mac_rx() {
  int esr_mac_rx[2][4];
  esr_mac_rx[0][0] = esr_mac_rxd0_0.read().get_word(0);
  esr_mac_rx[0][1] = esr_mac_rxd1_0.read().get_word(0);
  esr_mac_rx[0][2] = esr_mac_rxd2_0.read().get_word(0);
  esr_mac_rx[0][3] = esr_mac_rxd3_0.read().get_word(0);
  esr_mac_rx[1][0] = esr_mac_rxd0_1.read().get_word(0);
  esr_mac_rx[1][1] = esr_mac_rxd1_1.read().get_word(0);
  esr_mac_rx[1][2] = esr_mac_rxd2_1.read().get_word(0);
  esr_mac_rx[1][3] = esr_mac_rxd3_1.read().get_word(0);


  int mac_data[2][4][2];
  for(int i=0;i<2;i++) {
    for(int j=0;j<4;j++) {
      mac_data[i][j][0] = decode10b8b[esr_mac_rx[i][j]].data;
      mac_data[i][j][1] = decode10b8b[esr_mac_rx[i][j]].type;
    }
  }
  for(int i=0;i<2;i++) {
    if(xaui_rx_count[i] == -2) {
      if((mac_data[i][0][0] == symbolS) && (mac_data[i][0][1] == 1)) { xaui_rx_count[i]++; }
    } else
    if(xaui_rx_count[i] == -1) {
      if((mac_data[i][0][0] == 0x55) && (mac_data[i][0][1] == 0)) xaui_rx_count[i]++; else xaui_rx_count[i]++;
    } else
    if(xaui_rx_count[i] > 10000) {
      //missing terminate
      printf("XAUI packet end is not reached!!!\n");
      exit(0);
    } else
    if(xaui_rx_count[i] >= 0) {
      for(int j=0;j<4;j++) {
        if((mac_data[i][j][0] == symbolT) && (mac_data[i][j][1] == 1)) { 
	  xaui_rx_size[i] = xaui_rx_count[i];
	  xaui_rx_count[i] = -2;
	  break;
        } else {
	  if(mac_data[i][j][1] == 1) {
            printf("XAUI: control code received instead of data code!\n");
	    exit(0);
	  }
	  xaui_rx_data[i][xaui_rx_count[i]++] = mac_data[i][j][0]; 
        }
      }
    }
  }
  if(xaui_rx_size[0] != 0) {
     niu_debug_hex_dump("Packet received from port 0", xaui_rx_data[0], xaui_rx_size[0]);
     shmem->rx0_packet_rec(xaui_rx_size[0], xaui_rx_data[0]);
  }
  if(xaui_rx_size[1] != 0) {
     niu_debug_hex_dump("Packet received from port 1", xaui_rx_data[1], xaui_rx_size[1]);
     shmem->rx1_packet_rec(xaui_rx_size[1], xaui_rx_data[1]);
  }
  xaui_rx_size[0] = xaui_rx_size[1] = 0;
}

int niu_mac_interface::lfsr() {
//static int  poly = 0x89; x^7 + x^3 + 1
//static int  poly = 0xc1; x^7 + x^6 + 1
  static int poly = 0x91; //x^7 + x^4 + 1
  static int seed = 1;
  static int acount = 16;

  if(seed % 2) seed = seed ^ poly;
  seed = seed >> 1;

  acount--;
  if(acount == 0) {
    acount = 16 + (seed & 0xf);
    return symbolA;
  } else
  if(seed % 2) return symbolR;
  return symbolK;
}

void niu_mac_interface::updateDisparity(int &disparity, int code) {
//Can be replaced with a lookup table to improve performance
//111000 - negative
//000111 - positive
//1100   - negative
//0011   - positive

  int count = 0;
  for(int i=0;i<6;i++) {
    if((code >> (4+i)) & 0x1) count++;
  }
  if(count < 3) disparity = -1;
  else if(count > 3) disparity = +1;
  else if((code >> 4) == 56) disparity = -1;
  else if((code >> 4) == 7) disparity = +1;

  count = 0;
  for(int i=0;i<4;i++) {
    if((code >> i) & 0x1) count++;
  }
  if(count < 2) disparity = -1;
  else if(count > 2) disparity = +1;
  else if((code & 0xf) == 12) disparity = -1;
  else if((code & 0xf) == 3) disparity = +1;
}

int niu_mac_interface::get10BCode(MAC8B10BType type, int &rdisparity, int data) {
  int code = -1;
  if(type == DATA) {
    if(rdisparity == 1) code = Dcode8b10b[data].pos; else code = Dcode8b10b[data].neg;
  } else if(type == CODE) {
    for(int j=0;j<12;j++) {
      if(Kcode8b10b[j].code == data) {
        if(rdisparity == 1) code = Kcode8b10b[j].pos; else code = Kcode8b10b[j].neg;
        break;
      }
    }
  }
  if(code == -1) {
    fprintf(stderr, "Error in niu_mac_interface::get10BCode\n");
    exit(1);
  }
  updateDisparity(rdisparity, code);
  return code;
}


DecodePair decode10b8b[1024];

CodePair8b10b Dcode8b10b[256] = {
{0x274,0x18b}, {0x1d4,0x22b}, {0x2d4,0x12b}, {0x31b,0x314}, {0x354,0x0ab}, {0x29b,0x294}, {0x19b,0x194}, {0x38b,0x074},
{0x394,0x06b}, {0x25b,0x254}, {0x15b,0x154}, {0x34b,0x344}, {0x0db,0x0d4}, {0x2cb,0x2c4}, {0x1cb,0x1c4}, {0x174,0x28b},
{0x1b4,0x24b}, {0x23b,0x234}, {0x13b,0x134}, {0x32b,0x324}, {0x0bb,0x0b4}, {0x2ab,0x2a4}, {0x1ab,0x1a4}, {0x3a4,0x05b},
{0x334,0x0cb}, {0x26b,0x264}, {0x16b,0x164}, {0x364,0x09b}, {0x0eb,0x0e4}, {0x2e4,0x11b}, {0x1e4,0x21b}, {0x2b4,0x14b},
{0x279,0x189}, {0x1d9,0x229}, {0x2d9,0x129}, {0x319,0x319}, {0x359,0x0a9}, {0x299,0x299}, {0x199,0x199}, {0x389,0x079},
{0x399,0x069}, {0x259,0x259}, {0x159,0x159}, {0x349,0x349}, {0x0d9,0x0d9}, {0x2c9,0x2c9}, {0x1c9,0x1c9}, {0x179,0x289},
{0x1b9,0x249}, {0x239,0x239}, {0x139,0x139}, {0x329,0x329}, {0x0b9,0x0b9}, {0x2a9,0x2a9}, {0x1a9,0x1a9}, {0x3a9,0x059},
{0x339,0x0c9}, {0x269,0x269}, {0x169,0x169}, {0x369,0x099}, {0x0e9,0x0e9}, {0x2e9,0x119}, {0x1e9,0x219}, {0x2b9,0x149},
{0x275,0x185}, {0x1d5,0x225}, {0x2d5,0x125}, {0x315,0x315}, {0x355,0x0a5}, {0x295,0x295}, {0x195,0x195}, {0x385,0x075},
{0x395,0x065}, {0x255,0x255}, {0x155,0x155}, {0x345,0x345}, {0x0d5,0x0d5}, {0x2c5,0x2c5}, {0x1c5,0x1c5}, {0x175,0x285},
{0x1b5,0x245}, {0x235,0x235}, {0x135,0x135}, {0x325,0x325}, {0x0b5,0x0b5}, {0x2a5,0x2a5}, {0x1a5,0x1a5}, {0x3a5,0x055},
{0x335,0x0c5}, {0x265,0x265}, {0x165,0x165}, {0x365,0x095}, {0x0e5,0x0e5}, {0x2e5,0x115}, {0x1e5,0x215}, {0x2b5,0x145},
{0x273,0x18c}, {0x1d3,0x22c}, {0x2d3,0x12c}, {0x31c,0x313}, {0x353,0x0ac}, {0x29c,0x293}, {0x19c,0x193}, {0x38c,0x073},
{0x393,0x06c}, {0x25c,0x253}, {0x15c,0x153}, {0x34c,0x343}, {0x0dc,0x0d3}, {0x2cc,0x2c3}, {0x1cc,0x1c3}, {0x173,0x28c},
{0x1b3,0x24c}, {0x23c,0x233}, {0x13c,0x133}, {0x32c,0x323}, {0x0bc,0x0b3}, {0x2ac,0x2a3}, {0x1ac,0x1a3}, {0x3a3,0x05c},
{0x333,0x0cc}, {0x26c,0x263}, {0x16c,0x163}, {0x363,0x09c}, {0x0ec,0x0e3}, {0x2e3,0x11c}, {0x1e3,0x21c}, {0x2b3,0x14c},
{0x272,0x18d}, {0x1d2,0x22d}, {0x2d2,0x12d}, {0x31d,0x312}, {0x352,0x0ad}, {0x29d,0x292}, {0x19d,0x192}, {0x38d,0x072},
{0x392,0x06d}, {0x25d,0x252}, {0x15d,0x152}, {0x34d,0x342}, {0x0dd,0x0d2}, {0x2cd,0x2c2}, {0x1cd,0x1c2}, {0x172,0x28d},
{0x1b2,0x24d}, {0x23d,0x232}, {0x13d,0x132}, {0x32d,0x322}, {0x0bd,0x0b2}, {0x2ad,0x2a2}, {0x1ad,0x1a2}, {0x3a2,0x05d},
{0x332,0x0cd}, {0x26d,0x262}, {0x16d,0x162}, {0x362,0x09d}, {0x0ed,0x0e2}, {0x2e2,0x11d}, {0x1e2,0x21d}, {0x2b2,0x14d},
{0x27a,0x18a}, {0x1da,0x22a}, {0x2da,0x12a}, {0x31a,0x31a}, {0x35a,0x0aa}, {0x29a,0x29a}, {0x19a,0x19a}, {0x38a,0x07a},
{0x39a,0x06a}, {0x25a,0x25a}, {0x15a,0x15a}, {0x34a,0x34a}, {0x0da,0x0da}, {0x2ca,0x2ca}, {0x1ca,0x1ca}, {0x17a,0x28a},
{0x1ba,0x24a}, {0x23a,0x23a}, {0x13a,0x13a}, {0x32a,0x32a}, {0x0ba,0x0ba}, {0x2aa,0x2aa}, {0x1aa,0x1aa}, {0x3aa,0x05a},
{0x33a,0x0ca}, {0x26a,0x26a}, {0x16a,0x16a}, {0x36a,0x09a}, {0x0ea,0x0ea}, {0x2ea,0x11a}, {0x1ea,0x21a}, {0x2ba,0x14a},
{0x276,0x186}, {0x1d6,0x226}, {0x2d6,0x126}, {0x316,0x316}, {0x356,0x0a6}, {0x296,0x296}, {0x196,0x196}, {0x386,0x076},
{0x396,0x066}, {0x256,0x256}, {0x156,0x156}, {0x346,0x346}, {0x0d6,0x0d6}, {0x2c6,0x2c6}, {0x1c6,0x1c6}, {0x176,0x286},
{0x1b6,0x246}, {0x236,0x236}, {0x136,0x136}, {0x326,0x326}, {0x0b6,0x0b6}, {0x2a6,0x2a6}, {0x1a6,0x1a6}, {0x3a6,0x056},
{0x336,0x0c6}, {0x266,0x266}, {0x166,0x166}, {0x366,0x096}, {0x0e6,0x0e6}, {0x2e6,0x116}, {0x1e6,0x216}, {0x2b6,0x146},
{0x271,0x18e}, {0x1d1,0x22e}, {0x2d1,0x12e}, {0x31e,0x311}, {0x351,0x0ae}, {0x29e,0x291}, {0x19e,0x191}, {0x38e,0x071},
{0x391,0x06e}, {0x25e,0x251}, {0x15e,0x151}, {0x34e,0x348}, {0x0de,0x0d1}, {0x2ce,0x2c8}, {0x1ce,0x1c8}, {0x171,0x28e},
{0x1b1,0x24e}, {0x237,0x231}, {0x137,0x131}, {0x32e,0x321}, {0x0b7,0x0b1}, {0x2ae,0x2a1}, {0x1ae,0x1a1}, {0x3a1,0x05e},
{0x331,0x0ce}, {0x26e,0x261}, {0x16e,0x161}, {0x361,0x09e}, {0x0ee,0x0e1}, {0x2e1,0x11e}, {0x1e1,0x21e}, {0x2b1,0x14e}};

CodeTriple Kcode8b10b[12] = {
{"K28.0", 0x1c, 0x0f4, 0x30b},
{"K28.1", 0x3c, 0x0f9, 0x306},
{"K28.2", 0x5c, 0x0f5, 0x30a},
{"K28.3", 0x7c, 0x0f3, 0x30c},
{"K28.4", 0x9c, 0x0f2, 0x30d},
{"K28.5", 0xbc, 0x0fa, 0x305},
{"K28.6", 0xdc, 0x0f6, 0x309},
{"K28.7", 0xfc, 0x0f8, 0x307},
{"K23.7", 0xf7, 0x3a8, 0x057},
{"K27.7", 0xfb, 0x368, 0x097},
{"K29.7", 0xfd, 0x2e8, 0x117},
{"K30.7", 0xfe, 0x1e8, 0x217}};


