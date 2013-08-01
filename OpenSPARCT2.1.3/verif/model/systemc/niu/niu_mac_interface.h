/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_mac_interface.h
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
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_mac_interface.h
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
#include <systemc.h>

typedef unsigned long long int uint64_t;

struct CodePair8b10b {
  int neg, pos;
};

struct CodeTriple {
  const char *name;
  int code;
  int neg, pos;
};

struct DecodePair {
  int data;
  int type;  //0 for DATA, 1 for CODE
};

extern DecodePair decode10b8b[1024];

extern CodePair8b10b Dcode8b10b[256];
extern CodeTriple    Kcode8b10b[12];


SC_MODULE(niu_mac_interface) {
  typedef enum {DATA, CODE} MAC8B10BType;
  sc_lv<10>	mac_esr_tx0[4];
  sc_lv<10>	mac_esr_tx1[4];
  int		mac_serdes_count;
  bool		reset_sync;
  int		rdisparity0[4];
  int		rdisparity1[4];

  int		xaui0_size, xaui1_size;
  int		xaui0_start, xaui1_start;
  int		xaui0_count, xaui1_count;

  unsigned char xaui0_data[10000], xaui1_data[10000];
  unsigned char xaui_rx_data[2][10000];
  int xaui_rx_size[2];
  int xaui_rx_count[2];

public:
  sc_in<bool>		mac_clk;
  sc_in<bool>		reset;

  sc_in<sc_lv<10> >	esr_mac_rxd0_0;
  sc_in<sc_lv<10> >	esr_mac_rxd0_1;
  sc_in<sc_lv<10> >	esr_mac_rxd1_0;
  sc_in<sc_lv<10> >	esr_mac_rxd1_1;
  sc_in<sc_lv<10> >	esr_mac_rxd2_0;
  sc_in<sc_lv<10> >	esr_mac_rxd2_1;
  sc_in<sc_lv<10> >	esr_mac_rxd3_0;
  sc_in<sc_lv<10> >	esr_mac_rxd3_1;

  sc_out<sc_lv<10> >	mac_esr_txd0_0;
  sc_out<sc_lv<10> >	mac_esr_txd0_1;
  sc_out<sc_lv<10> >	mac_esr_txd1_0;
  sc_out<sc_lv<10> >	mac_esr_txd1_1;
  sc_out<sc_lv<10> >	mac_esr_txd2_0;
  sc_out<sc_lv<10> >	mac_esr_txd2_1;
  sc_out<sc_lv<10> >	mac_esr_txd3_0;
  sc_out<sc_lv<10> >	mac_esr_txd3_1;


  SC_CTOR(niu_mac_interface);

  void mac_tx();
  void mac_rx();

  int lfsr();
  void updateDisparity(int &disparity, int code);
  int get10BCode(MAC8B10BType type, int &disparity, int data);

};

