/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_siu_interface.h
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
* OpenSPARC T2 Processor File: niu_siu_interface.h
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


SC_MODULE(niu_siu_interface) {
  uint64_t rd_addr;
  uint64_t rd_addr_itr;
  uint64_t rd_size;
  uint64_t rd_size_mod;
  uint64_t rd_frag;

  uint64_t wr_addr;
  uint64_t wr_addr_itr;
  uint64_t wr_size;
  unsigned char     wr_data[10000];
  bool	   wr_busy;
  bool     rd_busy;
  int	   wr_packet_state;

  int	sii_bypass_credit;
  int	sii_ordered_credit;
  int	sii_request_id; 

  int	rd_request_ids[160];
  int	rd_request_chunks;

  sc_lv<128> sio_data[4];
  sc_lv<128> sio_header;
  int response_id;
  int chunks;
  uint8_t rd_response[10000];
  int rd_ptr;
  int reset;


public:
  sc_in<bool>		clk;

  sc_out<bool>	 	niu_sii_hdr_vld;
  sc_out<bool>	 	niu_sii_reqbypass;
  sc_out<sc_lv<128> > 	niu_sii_data;
  sc_out<bool> 		niu_sii_datareq;
  sc_out<sc_lv<8> > 	niu_sii_parity;
  sc_out<bool> 		niu_sio_dq;	//credir to sio; 4 initial credits

  sc_in<sc_lv<128> >	sio_niu_data;
  sc_in<sc_lv<8> >	sio_niu_parity;
  sc_in<bool>		sio_niu_datareq;
  sc_in<bool>		sio_niu_hdr_vld;

  sc_in<bool>		sii_niu_bqdq;	//bypass queue credit; 16 initial credits
  sc_in<bool>		sii_niu_oqdq;	//ordered queue credit; 16 initial credits



  void ecc16(sc_lv<16> id, sc_lv<6> &ecc);
  void formHeader(uint64_t paddr, int write, sc_lv<128> &niu_sii_packet);
  void pa_parity_n(sc_lv<40> addr, sc_lv<2> &aparity);
  void formDataPacket(unsigned char *data, sc_lv<128> &niu_sii_packet, sc_lv<8> &niu_sii_parity);


  SC_CTOR(niu_siu_interface);

  void sii_interface();
  void sio_interface();

};

