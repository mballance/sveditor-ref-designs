/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: xaui.h
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
* OpenSPARC T2 Processor File: xaui.h
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


SC_MODULE(xaui) {
  sc_lv<10>	mac_esr_tx[4];
  int		xaui_serdes_count;
  bool		reset_sync;
 
  int		xaui_1count[4];

  int		xaui_comma[4];
  int		xaui_count[4];
  sc_lv<10>	esr_mac_rx[4], esr_mac_rx_l[4];

public:
  sc_in<sc_lv<4> >	XAUI_RX_N;
  sc_in<sc_lv<4> >	XAUI_RX_P;

  sc_in<bool>		xaui_clk;
  sc_in<bool>		mac_clk;
  sc_in<bool>		reset;

  sc_out<bool>		XAUI_AMUX;
  sc_out<sc_lv<4> >	XAUI_TX_N;
  sc_out<sc_lv<4> >	XAUI_TX_P;

  sc_out<sc_lv<10> >	esr_mac_rxd0;
  sc_out<sc_lv<10> >	esr_mac_rxd1;
  sc_out<sc_lv<10> >	esr_mac_rxd2;
  sc_out<sc_lv<10> >	esr_mac_rxd3;

  sc_in<sc_lv<10> >	mac_esr_txd0;
  sc_in<sc_lv<10> >	mac_esr_txd1;
  sc_in<sc_lv<10> >	mac_esr_txd2;
  sc_in<sc_lv<10> >	mac_esr_txd3;
/*
  sc_out<sc_lv<4> >	debug_comma;
  sc_out<sc_lv<4> >	debug_boundry;

  sc_out<sc_lv<4> >	debug_1count_0;
  sc_out<sc_lv<4> >	debug_1count_1;
  sc_out<sc_lv<4> >	debug_1count_2;
  sc_out<sc_lv<4> >	debug_1count_3;
*/

  SC_CTOR(xaui);

  void mac_tx();
  void mac_rx();
  void xaui_tx();
  void xaui_rx();

};

