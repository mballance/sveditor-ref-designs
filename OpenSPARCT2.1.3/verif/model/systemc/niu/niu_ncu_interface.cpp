// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ncu_interface.cpp
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
// OpenSPARC T2 Processor File: niu_ncu_interface.cpp
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

#include "niu_ncu_interface.h"
#include "sharedmem.h"

extern "C" void vcs_atexit(void(*pfun)(int code));

sharedmem *shmem = NULL; 

niu_ncu_interface::niu_ncu_interface(sc_module_name) {
  SC_METHOD(ncu_interface);
  sensitive << clk.pos();
 
  ncu_niu_vld_d = false;
  ncu_niu_stall_d = false;
  niu_ncu_stall_d = false;
  ncu_word = 0; 
  niu_word = 0;
  niu_int_word = 0;
  reset = 1;
}

void niu_ncu_interface::ncu_interface() {
  if(reset) {
    niu_rd.write(false);
    niu_rd_addr.write(0);
    niu_rd_data.write(0);
    niu_ncu_stall.write(false);
    reset = 0;
  }


//When an interrupt is received from NIU, send it to NCU
    if(shmem) {
      unsigned int data;
      shmem->receiveInterrupt(data);
      if(data) {
	niu_interrupt.range(63,57) = 0;
	niu_interrupt.range(56,51) = 0;
	niu_interrupt.range(50,19) = 0;
	niu_interrupt.range(18,10) = data & 0x1ff;
	niu_interrupt.range(9,7) = 0;
	niu_interrupt.range(6,4) = 0;
	niu_interrupt.range(3,0) = "1000";
        niu_int_word = 3;
      }
    }

    if(niu_int_word > 1) {
      niu_ncu_vld.write(true);
      switch(niu_int_word) {
        case 3: niu_ncu_data.write(niu_data.get_word(0)); break;
	case 2: niu_ncu_data.write(niu_data.get_word(1)); break;
      }
      niu_int_word--;
    } else if(niu_int_word == 1) {
      niu_ncu_vld.write(false);
      niu_int_word--;
    }

//When the response to ncu is ready, send it to NCU
//Total of 5 cycles; 4 x 32-bits + 1 idle cycle
    if(niu_word > 1) {
      niu_ncu_vld.write(true);
      switch(niu_word) {
        case 5: niu_ncu_data.write(niu_data.get_word(0)); break;
        case 4: niu_ncu_data.write(niu_data.get_word(1)); break;
        case 3: niu_ncu_data.write(niu_data.get_word(2)); break;
	case 2: niu_ncu_data.write(niu_data.get_word(3));
	        niu_rd.write(true);
		niu_rd_addr.write(niu_data.range(41,15));
		niu_rd_data.write(niu_data.range(127,64));
		break;
      }
      niu_word--;
    } else if(niu_word == 1) {
      niu_ncu_vld.write(false);
      niu_rd.write(false);
      niu_word--;
    }

//When ncu_niu_vld deasserts, the request is complete
//Send the request to the niu model, and wait for the response
    if(!ncu_niu_vld.read() && ncu_niu_vld_d) {
      unsigned long int mem[4];
      for(int i=0;i<4;i++) mem[i] = ncu_data.get_word(i);

      shmem->deliver_ncu_req(mem, 16);
      //shmem->receive_niu_res(mem, 16);

      for(int i=0;i<4;i++) {
        niu_data.set_word(i, mem[i]);
	niu_data.set_cword(i, 0); //no x or z
      }
      if(ncu_data.range(3,0) == "0100") {
        niu_data.range(3,0) = "0001";
        niu_word = 5;
      }
    }

//Process the request from NCU to NIU
//A complete request takes 4 cycles, each with 32-bit data
    if(!ncu_niu_vld.read()) {
       ncu_word = 0;  
       ncu_data = 0;
    } else {
      if(!niu_ncu_stall_d) {
        switch(ncu_word) {
          case 0: ncu_data.range(31,0) = ncu_niu_data.read(); break;
          case 1: ncu_data.range(63,32) = ncu_niu_data.read(); break;
          case 2: ncu_data.range(95,64) = ncu_niu_data.read(); break;
          case 3: ncu_data.range(127,96) = ncu_niu_data.read(); break;
        }
	ncu_word++;
      }
    }

//Delay ncu_niu_stall, niu_ncu_stall, and ncu_niu_vld signals for a cycle
    ncu_niu_stall_d = ncu_niu_stall.read();
    niu_ncu_stall_d = niu_ncu_stall.read();
    ncu_niu_vld_d = ncu_niu_vld.read();
}



