// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xaui.cpp
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
// OpenSPARC T2 Processor File: xaui.cpp
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
#include <systemc.h>

#include "xaui.h"
#include "sharedmem.h"


xaui::xaui(sc_module_name) {
  SC_METHOD(mac_tx);
  sensitive << mac_clk.pos(); 
  SC_METHOD(mac_rx);
  sensitive << mac_clk.pos(); 

  SC_METHOD(xaui_tx);
  sensitive << xaui_clk.pos(); 
  SC_METHOD(xaui_rx);
  sensitive << xaui_clk.neg(); 

  for(int i=0;i<4;i++) xaui_1count[i] = xaui_comma[i] = xaui_1count[i] = xaui_count[i] = 0;
  for(int i=0;i<4;i++) mac_esr_tx[i] = esr_mac_rx_l[i] = 0;
  xaui_serdes_count = 0;
  reset_sync = 1;



}

void xaui::mac_tx() {
  //capture mac tx interface signals every mac cycle 325MHz
  mac_esr_tx[0] = mac_esr_txd0.read();
  mac_esr_tx[1] = mac_esr_txd1.read();
  mac_esr_tx[2] = mac_esr_txd2.read();
  mac_esr_tx[3] = mac_esr_txd3.read();


  //synchronize reset to mac clock
  reset_sync = reset.read();
}

void xaui::mac_rx() {
  esr_mac_rxd0.write(esr_mac_rx_l[0]);
  esr_mac_rxd1.write(esr_mac_rx_l[1]);
  esr_mac_rxd2.write(esr_mac_rx_l[2]);
  esr_mac_rxd3.write(esr_mac_rx_l[3]);
}

void xaui::xaui_tx() {
  //serialize mac tx interface signals 3.25GHz
  XAUI_AMUX.write(0);
  if(!reset_sync) {
    sc_lv<4> tx;
    for(int i=0;i<4;i++) {
      tx[i] = mac_esr_tx[i][9 - xaui_serdes_count];
    }
    XAUI_TX_P.write(tx);
    XAUI_TX_N.write(~tx);
    xaui_serdes_count = (xaui_serdes_count + 1) % 10;
  } else {
    xaui_serdes_count = 0;
    XAUI_TX_P.write("0000");
    XAUI_TX_N.write("1111");
  }
}


void xaui::xaui_rx() {
  //need to detect comma patterns, find 10b boundaries and
  //send them back to mac
  sc_lv<4> xaui = XAUI_RX_P.read();

  if(!reset_sync) {
    for(int i=0;i<4;i++) {
      if(xaui_comma[i] > 0) xaui_comma[i]--;
      //identify comma, 0011111, pattern
      if(xaui[i] == "1") {
        if(xaui_1count[i] >= 2) xaui_1count[i]++; //2 0s alread received and may have been followed by 1s
	else xaui_1count[i] = 0; // reset the number 0s already received
      } else {
        if(xaui_1count[i] > 2) xaui_1count[i] = 1; //1s received, reset 0 count to 1
        else if(xaui_1count[i] < 2) xaui_1count[i]++; //keep 2 0s if more are received
      }

      if(xaui_1count[i] == 7) { xaui_comma[i] = 5; xaui_1count[i] = 0; }
      if(xaui_comma[i] == 1) xaui_count[i] = 0;
      esr_mac_rx[i][9 - xaui_count[i]] = xaui[i];
      xaui_count[i]++;
      if(xaui_count[i] == 10) {
        esr_mac_rx_l[i] = esr_mac_rx[i];
	xaui_count[i] = 0;
      }
    }
/*
    int debug_comma_val = 0;
    int debug_boundry_val = 0;
    for(int i=0;i<4;i++) debug_comma_val += (xaui_comma[i] == 5) ? (1<<i) : 0;
    for(int i=0;i<4;i++) debug_boundry_val += (xaui_count[i] == 0) ? (1<<i) : 0;
    debug_comma.write(debug_comma_val);
    debug_boundry.write(debug_boundry_val);
    debug_1count_0.write(xaui_1count[0]);
    debug_1count_1.write(xaui_1count[1]);
    debug_1count_2.write(xaui_1count[2]);
    debug_1count_3.write(xaui_1count[3]);
*/
  } else {
    for(int i=0;i<4;i++) xaui_1count[i] = xaui_comma[i] = 0;
    for(int i=0;i<4;i++) xaui_count[i] = 0;
    for(int i=0;i<4;i++) esr_mac_rx[i] = "0000000000";
  }
}


