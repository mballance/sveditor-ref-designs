// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sharedmem.cpp
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
// OpenSPARC T2 Processor File: sharedmem.cpp
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
#include <string.h>

#include "sharedmem.h"

#define RX_FIFO_DEPTH 50
#define RX_FIFO_SIZE (RX_FIFO_DEPTH * 9650)

sharedmem::sharedmem(key_t key, int create) {
  int size = RX_FIFO_SIZE * 2 + 200000;
#if 0
  int shmid;
  if ((shmid = shmget(key, size, 0666 | (create ? IPC_CREAT : 0))) < 0) {
    perror(" -shmget");
    exit(1);
  }
  if ((shm = (char*)shmat(shmid, NULL, 0)) == (char *) -1) {
     perror("shmat");
     exit(1);
  }
#else
  shm = (char*)malloc(size * sizeof(char));
#endif

  xaui0_size = (int *) shm;
  xaui1_size = xaui0_size + 1;
  interrupt = (unsigned int *)(xaui1_size + 1);
  *xaui0_size = *xaui1_size = 0;
  *interrupt = 0;

  shm = (char *) (interrupt + 1);
  
  sp_niu_pio_request	= (sema_t*) (shm + 0 * sizeof(sema_t));
  sp_niu_pio_response	= (sema_t*) (shm + 1 * sizeof(sema_t));
  sp_sii_rd_req		= (sema_t*) (shm + 2 * sizeof(sema_t));
  sp_sii_rd_res		= (sema_t*) (shm + 3 * sizeof(sema_t));
  sp_sii_rd_available	= (sema_t*) (shm + 4 * sizeof(sema_t));
  sp_sii_wr_available	= (sema_t*) (shm + 5 * sizeof(sema_t));
  sp_xaui0_available	= (sema_t*) (shm + 6 * sizeof(sema_t));
  sp_xaui1_available	= (sema_t*) (shm + 7 * sizeof(sema_t));
  sp_xaui0_req		= (sema_t*) (shm + 8 * sizeof(sema_t));
  sp_xaui1_req		= (sema_t*) (shm + 9 * sizeof(sema_t));
  sp_rx0_available	= (sema_t*) (shm +10 * sizeof(sema_t));
  sp_rx1_available	= (sema_t*) (shm +11 * sizeof(sema_t));
  sp_sii_wr_req		= (sema_t*) (shm +12 * sizeof(sema_t));
  sp_sii_wr_res		= (sema_t*) (shm +13 * sizeof(sema_t));

  if(create) {
    sema_init(sp_niu_pio_request, 0, USYNC_PROCESS , NULL);
    sema_init(sp_niu_pio_response, 0, USYNC_PROCESS , NULL);
    sema_init(sp_sii_rd_req, 0, USYNC_PROCESS , NULL);
    sema_init(sp_sii_rd_res, 0, USYNC_PROCESS , NULL);
    sema_init(sp_sii_wr_req, 0, USYNC_PROCESS , NULL);
    sema_init(sp_sii_wr_res, 0, USYNC_PROCESS , NULL);
    sema_init(sp_sii_rd_available, 1, USYNC_PROCESS , NULL);
    sema_init(sp_sii_wr_available, 1, USYNC_PROCESS , NULL);
    sema_init(sp_xaui0_available, 1, USYNC_PROCESS , NULL);
    sema_init(sp_xaui1_available, 1, USYNC_PROCESS , NULL);
    sema_init(sp_xaui0_req, 0, USYNC_PROCESS , NULL);
    sema_init(sp_xaui1_req, 0, USYNC_PROCESS , NULL);
    sema_init(sp_rx0_available, 0, USYNC_PROCESS , NULL);
    sema_init(sp_rx1_available, 0, USYNC_PROCESS , NULL);
  }

  typ = (int*)(shm + 14 * sizeof(sema_t));
  data = (char*)(typ + 1);
  sii_wr_data = (char *)((char *)data + 16);
  sii_wr_size = (int *)(((char *)sii_wr_data) + 10000);

  sii_wr_addr = (unsigned long long int *)(sii_wr_size + 1);
  pa_read = (unsigned long long int*) (sii_wr_addr + 1);

  niu_read = (int*)(pa_read + 1);
  niu_write = niu_read + 1;
  read_size = niu_write + 1;
  sio_data = (void *) (read_size + 1);
  *niu_read = 0;
  *sii_wr_size = 0;

  xaui_rx_pointer[0] = (int *)(((char*)sio_data) + 20000);
  xaui_rx_head[0] = xaui_rx_pointer[0] + RX_FIFO_DEPTH;
  xaui_rx_tail[0] = xaui_rx_head[0] + 1;

  xaui_rx_pointer[1] = xaui_rx_tail[0] + 1;
  xaui_rx_head[1] = xaui_rx_pointer[1] + RX_FIFO_DEPTH;
  xaui_rx_tail[1] = xaui_rx_head[1] + 1;

  *xaui_rx_head[0] = *xaui_rx_tail[0] = 0;
  *xaui_rx_head[1] = *xaui_rx_tail[1] = 0;
  xaui_rx_pointer[0][0] = xaui_rx_pointer[1][0] = 0;


  xaui0_data = (void *) (xaui_rx_tail[1] + 1);
  xaui1_data = (void *) ((char *)xaui0_data + 10000);
  xaui_rx_data[0] = (unsigned char *) ((char *)xaui1_data + 10000);
  xaui_rx_data[1] = (unsigned char *) ((char *)xaui_rx_data[0] + RX_FIFO_SIZE);

/*
  printf("sp_niu_pio_request	: %x\n",(void*)sp_niu_pio_request);
  printf("sp_niu_pio_response	: %x\n",(void *)sp_niu_pio_response);
  printf("sp_sii_rd_req		: %x\n",(void *)sp_sii_rd_req);
  printf("sp_sii_rd_res		: %x\n",(void *)sp_sii_rd_res);
  printf("sp_sii_rd_available	: %x\n",(void *)sp_sii_rd_available);
  printf("sp_sii_wr_available	: %x\n",(void *)sp_sii_wr_available);
  printf("sp_xaui0_available	: %x\n", (void *)sp_xaui0_available);
  printf("sp_xaui1_available	: %x\n", (void *)sp_xaui1_available);
  printf("sp_xaui0_req		: %x\n", (void *)sp_xaui0_req);
  printf("sp_xaui1_req		: %x\n", (void *)sp_xaui1_req);

  printf("typ			: %x\n",(void *)typ);
  printf("data			: %x\n",(void *)data);
  printf("niu_read		: %x\n",(void *)niu_read);
  printf("niu_write		: %x\n",(void *)niu_write);
  printf("read_size		: %x\n",(void *)read_size);
  printf("pa_read		: %x\n",(void *)pa_read);
  printf("sio_data		: %x\n",(void *)sio_data);
*/


}

void sharedmem::deliver_ncu_req(void *buf, int size) {
  ncu_interface((unsigned int *)buf);
  //memcpy(data, buf, size);
  //sema_post(sp_niu_pio_request);
}

void sharedmem::receive_niu_res(void *buf, int size) {
  sema_wait(sp_niu_pio_response);
  memcpy(buf, data, size);
}

void sharedmem::deliver_niu_res(void *buf, int size) {
  memcpy(data, buf, size);
  sema_post(sp_niu_pio_response);
}

void sharedmem::receive_ncu_req(void *buf, int size) {
  sema_wait(sp_niu_pio_request);
  memcpy(buf, data, size);
}


void sharedmem::signalExit() {
  setType(EXIT);
  sema_post(sp_niu_pio_request);
}



void sharedmem::setType(int t) {
  *(int*)typ = t;
}

int sharedmem::getType() {
  return *(int*)typ;
}

void sharedmem::sii_write_req(uint64_t paddr, uint8_t * data, uint64_t size) {
  sema_wait(sp_sii_wr_available);
  memcpy(sii_wr_data, data, size);
  *niu_write = 1;
  *sii_wr_addr = paddr;
  *sii_wr_size = size;
  sema_wait(sp_sii_wr_res);
}

int sharedmem::sii_receive_write_req(uint64_t &paddr, uint8_t * data, uint64_t &size) {
  paddr = *sii_wr_addr;
  size  = *sii_wr_size;
  memcpy(data, sii_wr_data, size);
  if(*niu_write != 0) {
    *niu_write = 0;
    return 1;
  } 
  return 0;
}

void sharedmem::sii_write_res() {
  sema_post(sp_sii_wr_res);
  sema_post(sp_sii_wr_available);
}



void sharedmem::sii_read_req(uint64_t paddr, uint8_t * data, uint64_t size) {
  sema_wait(sp_sii_rd_available);
  *niu_read = 1;
  *read_size = size;   
  *pa_read = paddr;
  sema_wait(sp_sii_rd_res);
  memcpy(data, sio_data, size);
  sema_post(sp_sii_rd_available);
}

int sharedmem::sii_receive_read_req(uint64_t &paddr, uint64_t &size) {
  paddr = *pa_read;
  size = *read_size;
  if(*niu_read) {
    *niu_read = 0;
    return 1;
  }
  return 0;
}

void sharedmem::sii_read_res(uint8_t * data, uint64_t size) {
  memcpy(sio_data, data, size);
  sema_post(sp_sii_rd_res);
}


void sharedmem::tx0_send_packet(int size, uint8_t * data) {
  sema_wait(sp_xaui0_available);
  memcpy(xaui0_data, data, size);
  *xaui0_size = size;
  sema_wait(sp_xaui0_req);
}

int sharedmem::tx0_wait_packet(int &size, uint8_t * data) {
  if(*xaui0_size) {
    memcpy(data, xaui0_data, *xaui0_size);
    size = *xaui0_size;
    *xaui0_size = 0;
    return 1;
  }
  return 0;
}

void sharedmem::tx0_packet_sent() {
  sema_post(sp_xaui0_req);
  sema_post(sp_xaui0_available);
}

void sharedmem::tx1_send_packet(int size, uint8_t * data) {
  sema_wait(sp_xaui1_available);
  memcpy(xaui1_data, data, size);
  *xaui1_size = size;
  sema_wait(sp_xaui1_req);
}

int sharedmem::tx1_wait_packet(int &size, uint8_t * data) {
  if(*xaui1_size) {
    memcpy(data, xaui1_data, *xaui1_size);
    size = *xaui1_size;
    *xaui1_size = 0;
    return 1;
  }
  return 0;
}

void sharedmem::tx1_packet_sent() {
  sema_post(sp_xaui1_req);
  sema_post(sp_xaui1_available);
}



void sharedmem::rx0_wait_packet(int &size, uint8_t * data) {
  sema_wait(sp_rx0_available);
  remove_rx_packet(0, data, size);
  //display_rx_packet_queue(0);
}

void sharedmem::rx1_wait_packet(int &size, uint8_t * data) {
  sema_wait(sp_rx1_available);
  remove_rx_packet(1, data, size);
  //display_rx_packet_queue(1);
}

void sharedmem::rx0_packet_rec(int size, uint8_t * data) {
  add_rx_packet(0, data, size);
  //display_rx_packet_queue(0);
  sema_post(sp_rx0_available);
}

void sharedmem::rx1_packet_rec(int size, uint8_t * data) {
  add_rx_packet(1, data, size);
  //display_rx_packet_queue(1);
  sema_post(sp_rx1_available);
}


void sharedmem::add_rx_packet(int port, void *data, int size) {
  //if not enough data in the buffer, use 2 pointers for it 
  //move to the beginning of the buffer
  int head = *xaui_rx_head[port];
  int tail = *xaui_rx_tail[port];
  //printf("RX PACKET QUEUE: Port:%d - Head:%d Tail:%d\n", port, head, tail);
  if((xaui_rx_pointer[port][head] + size) > RX_FIFO_SIZE) {
    head = (head + 1) % RX_FIFO_DEPTH;
    if(head == tail) {
      //Too many packets buffered, need to discard current packet
      printf("WARNING: Congestion! too many packets waiting in the queue, dropping the packet!\n");
      return;
    }
    memcpy((void*)(xaui_rx_data[port] + xaui_rx_pointer[port][head]), data, size);
    head = (head + 1) % RX_FIFO_DEPTH;
    if(head == tail) {
      //Too many packets buffered, need to discard current packet
      printf("WARNING: Congestion! too many packets waiting in the queue, dropping the packet!\n");
      return;
    }
    xaui_rx_pointer[port][head] = xaui_rx_pointer[port][*xaui_rx_head[port]] + size;
  } else {
    memcpy(xaui_rx_data[port] + xaui_rx_pointer[port][head], data, size);
    head = (head + 1) % RX_FIFO_DEPTH;
    if(head == tail) {
      //Too many packets buffered, need to discard current packet
      printf("WARNING: Congestion! too many packets waiting in the queue, dropping the packet!\n");
      return;
    }
    xaui_rx_pointer[port][head] = xaui_rx_pointer[port][*xaui_rx_head[port]] + size;
  }
  *xaui_rx_head[port] = head;
}

void sharedmem::remove_rx_packet(int port, void *data, int &size) {
  //assume that data is available // checked through semaphores
  //make sure that simultaneous add/remove does not create a problem
  int tail = *xaui_rx_tail[port];
  //printf("RX PACKET QUEUE: Port:%d - Tail:%d\n", port, tail);
  tail = (tail + 1) % RX_FIFO_DEPTH;
  if(xaui_rx_pointer[port][tail] == 0) {
    *xaui_rx_tail[port] = tail;
    tail = (tail + 1) % RX_FIFO_DEPTH;
  }
  size = xaui_rx_pointer[port][tail] - xaui_rx_pointer[port][*xaui_rx_tail[port]];
  memcpy(data, xaui_rx_data[port] + xaui_rx_pointer[port][*xaui_rx_tail[port]], size);
  *xaui_rx_tail[port] = tail;
}

void sharedmem::display_rx_packet_queue(int port) {
  int head = *xaui_rx_head[port];
  int tail = *xaui_rx_tail[port];
  printf("display_rx%d_packet_queue: head:%d tail:%d\n", port, head, tail);
  while(head != tail) {
    if(xaui_rx_pointer[port][(tail + 1) % RX_FIFO_DEPTH]  == 0) tail = (tail + 1) % RX_FIFO_DEPTH;
    printf("Packet Size: %d - %d\n", xaui_rx_pointer[port][(tail + 1) % RX_FIFO_DEPTH] - xaui_rx_pointer[port][tail], tail);
    tail = (tail + 1) % RX_FIFO_DEPTH;
  }
}

void sharedmem::deliverInterrupt(unsigned int data) {
  *interrupt = data;
}

void sharedmem::receiveInterrupt(unsigned int &data) {
  data = *interrupt;
  *interrupt = 0;
}


