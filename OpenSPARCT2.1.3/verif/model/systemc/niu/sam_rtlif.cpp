// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sam_rtlif.cpp
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
// OpenSPARC T2 Processor File: sam_rtlif.cpp
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
// These are functions that must be implement for RTL

#include "loader.h"
#include "sharedmem.h"

#include "niu_debug_functions.h"

extern sharedmem *shmem;

unsigned int compute_crc(unsigned char *buf, int len) {
  static unsigned int poly = 0xedb88320;
  unsigned int crc = 0xffffffff;
  for(int i=0;i<len;i++) {
    crc = crc ^ buf[i];
    for(int j=0;j<8; j++)
      crc = (crc >> 1) ^ ((crc & 0x1) ? poly : 0);
  }
  return ~crc;
}

/// MMI APIs

int  mmi_map_physio(uint64_t base, uint64_t size, void* obj, mmi_access access) {
  // For testing
  module_info.base = base;
  module_info.size = size;
  module_info.access_fn = access;
  ////////

  // RTL stuff goes here. 
  printf("mmi_map_physio called!\n");
  
  return 0;
}

void mmi_memread(uint64_t paddr, uint8_t * data, uint64_t size, SAM_DeviceId sam_id) {
  printf("mmi_memread: %llx %llx\n", paddr, size);
  shmem->sii_read_req(paddr, data, size); 
  printf("MMI_MEMREAD: ADDR:%llx\n", paddr);
  niu_debug_hex_dump("MMI_MEMREAD", data, size);
  fflush(stdout);
}

void mmi_memwrite(uint64_t paddr, const uint8_t * data, uint64_t size, SAM_DeviceId sam_id) {
  printf("mmi_memwrite: %llx %llx\n", paddr, size);
  niu_debug_hex_dump("MMI_MEMWRITE", data, size);
  shmem->sii_write_req(paddr, (unsigned char*)data, size);
}

int netsim_connect(const char *netswitch) {
  printf("netsim_connect: %s\n", netswitch);
  // RTL stuff
  return 0;
}

int netsim_close(int fd) {
  printf("netsim_close: %d\n", fd);
  // RTL stuff
  return 0;
}

extern "C" int netsim_getmsg (int fd, char * buf, int maxlen, swtchdr * hdr) {
  // RTL stuff
  fd--;
  int size;

  if(fd == 0)
    shmem->rx0_wait_packet(size, (unsigned char*) buf);
  else
    shmem->rx1_wait_packet(size, (unsigned char*) buf);

  hdr->pkt_type = 0;
  hdr->pkt_len = size;

  if(fd == 0)
    niu_debug_hex_dump("NETSIM_GETMSG P0", (unsigned char *)buf, size);
  else
    niu_debug_hex_dump("NETSIM_GETMSG P1", (unsigned char *)buf, size);

  return size;
}

extern "C" int netsim_putmsg (int fd, char * buf, int len, swtchdr * hdr) {
  // RTL stuff
  fd--;
  printf("NETSIM_PUTMSG: Port %d \n", fd);

  //Add CRC ; sam does not compute CRC
  unsigned int crc = compute_crc((unsigned char*)buf, len-4);
  for(int i=0;i<4;i++)
    buf[len+i-4] = (crc >> (i*8)) & 0xff;

  niu_debug_hex_dump("NETSIM_PUTMSG", (unsigned char *)buf, len);

  if(fd == 0)
    shmem->tx0_send_packet(len,(unsigned char *)buf); 
  else
    shmem->tx1_send_packet(len,(unsigned char *)buf); 

  return len;
}

int ncu_interrupt(uint32_t cpuid, uint32_t data) {
  printf("ncu_interrup: %x %x \n", cpuid, data);
  shmem->deliverInterrupt(data);
  return 0;
}


