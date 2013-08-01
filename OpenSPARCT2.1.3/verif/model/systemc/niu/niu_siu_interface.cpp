// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_siu_interface.cpp
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
// OpenSPARC T2 Processor File: niu_siu_interface.cpp
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
#include "niu_debug_functions.h"

#include "niu_siu_interface.h"
#include "sharedmem.h"


extern sharedmem *shmem;


niu_siu_interface::niu_siu_interface(sc_module_name) {
  SC_METHOD(sii_interface);
  sensitive << clk.pos();
  SC_METHOD(sio_interface);
  sensitive << clk.pos();

  sii_bypass_credit = 16;
  sii_ordered_credit = 16;
  sii_request_id = 0; //16-bit request ID

  wr_packet_state = 0;
  wr_busy = false;
  rd_busy = false;
  chunks = 0;
  reset = 1;
}


void niu_siu_interface::ecc16(sc_lv<16> id, sc_lv<6> &ecc) {
  ecc[0] = id[0] ^ id[1] ^ id[3] ^ id[4] ^ id[6] ^ id[8] ^ id[10] ^ id[11] ^ id[13] ^ id[15];
  ecc[1] = id[0] ^ id[2] ^ id[3] ^ id[5] ^ id[6] ^ id[9] ^ id[10] ^ id[12] ^ id[13];
  ecc[2] = id[1] ^ id[2] ^ id[3] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ^ id[14] ^ id[15];
  ecc[3] = id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^ id[10];
  ecc[4] = id[11] ^ id[12] ^ id[13] ^ id[14] ^ id[15];
  ecc[5]=  id[0] ^ id[1] ^ id[2] ^ id[3] ^ ecc[0] ^ ecc[1] ^ ecc[2];
}

void niu_siu_interface::pa_parity_n(sc_lv<40> addr, sc_lv<2> &aparity) {
  aparity[0] = ~addr[ 0] ^ addr[ 2] ^ addr[ 4] ^ addr[ 6] ^ addr[ 8] ^ addr[10] ^ addr[12] ^
	       addr[14] ^ addr[16] ^ addr[18] ^ addr[20] ^ addr[22] ^ addr[24] ^ addr[26] ^
	       addr[28] ^ addr[30] ^ addr[32] ^ addr[34] ^ addr[36] ^ addr[38];
  aparity[1] = ~addr[ 1] ^ addr[ 3] ^ addr[ 5] ^ addr[ 7] ^ addr[ 9] ^ addr[11] ^ addr[13] ^
	       addr[15] ^ addr[17] ^ addr[19] ^ addr[21] ^ addr[23] ^ addr[25] ^ addr[27] ^
	       addr[29] ^ addr[31] ^ addr[33] ^ addr[35] ^ addr[37] ^ addr[39];
}



void niu_siu_interface::formHeader(uint64_t paddr, int write, sc_lv<128> &niu_sii_packet) {
  sc_lv<6> command;
  if(write) command = "010010"; else command = "001010";
  sc_lv<37> reserved1 = 0;
  sc_lv<2>  aparity;
  sc_lv<1>  timeout = "0";
  sc_lv<1>  unmapped = "0";
  sc_lv<1>  uncorrectable = "0";
  sc_lv<16> id;
  id.set_cword(0, 0);
  id.set_word(0, ++sii_request_id);
  sc_lv<1>  reserved2 = "0";
  sc_lv<1>  cparity;
  cparity[0] = ~command[0] ^ command[1] ^ command[2] ^ command[3] ^  command[4] ^ command[5];
  sc_lv<6>  ctagecc;
  sc_lv<16> reserved3 = 0;
  sc_lv<40> pa;
  pa.set_cword(0, 0);
  pa.set_cword(1, 0);
  pa.set_word(0, paddr & 0xffffffff);
  pa.set_word(1, (paddr >> 32) & 0xffffffff);
  ecc16(id, ctagecc);
  pa_parity_n(pa, aparity);

  niu_sii_packet.range(127, 122) = command;
  niu_sii_packet.range(121, 85) = reserved1;
  niu_sii_packet.range(84, 83) = aparity;
  niu_sii_packet.range(82, 82) = timeout;
  niu_sii_packet.range(81, 81) = unmapped;
  niu_sii_packet.range(80, 80) = uncorrectable;
  niu_sii_packet.range(79, 64) = id;
  niu_sii_packet.range(63, 63) = reserved2;
  niu_sii_packet.range(62, 62) = cparity;
  niu_sii_packet.range(61, 56) = ctagecc;
  niu_sii_packet.range(55, 40) = reserved3;
  niu_sii_packet.range(39, 0) = pa;

  cout << command << reserved1 << aparity << timeout << unmapped << uncorrectable << id << reserved2 << cparity << ctagecc << reserved3 << pa << endl; 
  //niu_sii_packet = command, reserved1, timeout,unmapped, uncorrectable, id, reserved2, cparity, ctagecc, reserved3, pa; 
  cout << niu_sii_packet << endl;
}

void niu_siu_interface::formDataPacket(unsigned char *data, sc_lv<128> &niu_sii_packet, sc_lv<8> &niu_sii_parity) {
  int parity = 0;
  for(int i=0;i<8;i++) {
    int parity_bit = 1;
    for(int j=0;j<16;j++) {
      int bit = (i/2) * 32 + (i % 2) + j * 2;
      parity_bit ^= (data[15 - (bit / 8)] >> (bit % 8)) & 0x1;
    }
    parity |= parity_bit << i;
  }
  niu_sii_parity.set_cword(0, 0);
  niu_sii_parity.set_word(0, parity);

  for(int i=0;i<4; i++) {
    unsigned int word = 0;
    for(int j=0;j<4; j++) word = (word << 8) + *data++;
    niu_sii_packet.set_cword(3-i, 0);
    niu_sii_packet.set_word(3-i, word);
  }
}


void niu_siu_interface::sii_interface() {
  if(reset) {
    niu_sii_data.write(0);
    niu_sii_parity.write(0);
    niu_sii_datareq.write(false);
    niu_sii_hdr_vld.write(false);
    niu_sii_reqbypass.write(false);
    niu_sio_dq.write(false);
    reset = 0;
  }

    //Check queue credits
    if(sii_niu_bqdq.read()) sii_bypass_credit++;
    if(sii_niu_oqdq.read()) sii_ordered_credit++;
    if((sii_bypass_credit > 16) || (sii_bypass_credit < 0)) {
      fprintf(stderr, "niu_siu_interface::sii_interface - incorrect value for sii_bypass_credit = %d\n", sii_bypass_credit);
      exit(1);
    }
    if((sii_ordered_credit > 16) || (sii_ordered_credit < 0)) { 
      fprintf(stderr, "niu_siu_interface::sii_interface - incorrect value for sii_ordered_credit = %d\n", sii_ordered_credit);
      exit(1);
    }

//There could be simultaneous read & write requests due to sp_sii_wr_available/sp_sii_rd_available
//If read in progress, do not let write to start, or if write is in progress, do not let read to start


    //Process READ request here...
    if(shmem)
    if(wr_busy == false)
    if(shmem->sii_receive_read_req(rd_addr, rd_size)) {
      //printf("SII READ REQUEST: %llx %llx\n", rd_addr, rd_size); 
      rd_frag = rd_addr % 64; //handle unaligned read requests
      rd_size_mod = rd_size + rd_frag;
      rd_addr_itr = rd_addr;
      rd_busy = true;
      rd_request_chunks = 0;
    } 
    if(rd_busy) {
      if(rd_addr_itr < (rd_addr + rd_size_mod)) {
	//printf("SII READ: RD_ADDR_ITR: %llx %llx %llx %llx\n", rd_addr_itr, rd_addr, rd_size_mod, rd_addr + rd_size_mod);
	if(sii_ordered_credit > 0) {
          sc_lv<128> niu_sii_packet;
          formHeader(rd_addr_itr, 0, niu_sii_packet);
	  rd_request_ids[rd_request_chunks++] = sii_request_id; //keep track of the request IDs
          niu_sii_data.write(niu_sii_packet);
          niu_sii_hdr_vld.write(true);
	  sii_ordered_credit--;
	  rd_addr_itr = (rd_addr_itr + 64) & 0xFFFFFFFFFFFFFFC0ull ; //align to 64-byte boundary
	} else {
	  niu_sii_hdr_vld.write(false);
        }
      } else {
	rd_busy = false;
	niu_sii_hdr_vld.write(false);
        return;
      }
    }


    //Process Write Requests here
    if(shmem)
    if(rd_busy == false)
    if(shmem->sii_receive_write_req(wr_addr, wr_data, wr_size)) {
      //Need to form the request; 
      //For each 64-byte, head + 4 x 128 bits data
      //Figure out data parity computation
      //If size is larger than 64 bytes, need to have multiple requests
      //Keep track of the credit as well; no more than 16 requests
      //Cannot get a new request while processing one; sp_siu_available...
      wr_busy = true;
      wr_addr_itr = wr_addr;
      wr_packet_state = 1; //5 per 64-byte chunk
    }
    //Need to handle credits here...
    if(wr_busy) {
      //printf("NIU WRITE: State:%d ITR=%llx ADDR=%llx SIZE=%llx\n", wr_packet_state, wr_addr_itr, wr_addr, wr_size);
      if(wr_packet_state == 1) { //header cycle
	if(sii_ordered_credit >0) {
          sc_lv<128> niu_sii_packet;
          formHeader(wr_addr_itr, 1, niu_sii_packet);
	  niu_sii_data.write(niu_sii_packet);
          niu_sii_hdr_vld.write(true);
          niu_sii_datareq.write(true);
	  sii_ordered_credit--;
          wr_packet_state++;
	}
      } else if(wr_packet_state == 6) {
	//done with the write
        wr_busy  = false;
 	wr_packet_state = 0;
        niu_sii_parity.write("00000000");
        niu_sii_data.write(0);
        shmem->sii_write_res();
      } else { //data cycle
        sc_lv<128> niu_sii_packet;
	sc_lv<8> parity;
	formDataPacket(&wr_data[wr_addr_itr - wr_addr + (wr_packet_state - 2) * 16], niu_sii_packet, parity);
	niu_sii_data.write(niu_sii_packet);
        niu_sii_parity.write(parity);
        niu_sii_hdr_vld.write(false);
        niu_sii_datareq.write(false);
        wr_packet_state++;
	if(wr_packet_state == 6) {
	  wr_addr_itr += 64;
	  if(wr_addr_itr < (wr_addr + wr_size))  {
	    wr_packet_state = 1; //go to the next chunk on the next cycle
	  }
	}
      }
    }
}


void niu_siu_interface::sio_interface() {

    if(chunks != 0) {
      sio_data[4-chunks] = sio_niu_data.read();
      if(chunks == 1) {
	//received the complete packet; return the data back to sam niu model
        niu_sio_dq.write(true); //dequeue
  	uint8_t data[64];   
	for(int i=0;i<4;i++) {
	  for(int j=0;j<4;j++) {
	    for(int k=0;k<4;k++) {
	      unsigned int word = sio_data[i].get_word(j);
	      data[i*16+15 - (j*4+k)] = (word >> (k*8)) & 0xff;
	    }
	  }
        }
	//printf("RD_PTR: %d\n", rd_ptr);
        int rd_vl_data_size = (rd_ptr == 0) ? 64 - rd_frag : 64;
	if(rd_ptr != 0) rd_ptr -= rd_frag;
	for(int i=0;i<rd_vl_data_size;i++) rd_response[rd_ptr + i] = data[i];

	int flag = 1;
	//printf("READ REQUEST IDS: ");
	for(int i=0;i<rd_request_chunks;i++) {
	  //printf("%d ", rd_request_ids[i]);
	  if(rd_request_ids[i] != -1) { 
	    flag = 0;
	    break;
	  }
	}
	//printf("\n");
	if(flag) {
 	  niu_debug_hex_dump("SIO Data Return", rd_response, rd_size);
          shmem->sii_read_res(rd_response, rd_size);
	}
      } 
      chunks--;
    } else 
        niu_sio_dq.write(false);

    //A read response is received
    if(sio_niu_hdr_vld.read() & sio_niu_datareq.read()) {
      //printf("SIO Header valid\n");
      sio_header = sio_niu_data.read();
      response_id = sio_header.range(79,64).get_word(0);
      rd_ptr = -1;
      for(int i=0;i<rd_request_chunks;i++) {
	if(rd_request_ids[i] == response_id) {
	  rd_ptr = i * 64;
	  rd_request_ids[i] = -1;
	  break;
	}
      }
      if(rd_ptr == -1) {
	printf("niu_siu_interface::sio_interface - incorrect response_id = %d\n", response_id);
	exit(1);
      }
      chunks = 4;
    }
}


