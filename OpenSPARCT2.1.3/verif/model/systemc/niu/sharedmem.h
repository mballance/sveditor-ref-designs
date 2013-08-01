/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: sharedmem.h
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
* OpenSPARC T2 Processor File: sharedmem.h
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
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <thread.h>
#include <synch.h>

extern void ncu_interface(unsigned int mem[4]);



class sharedmem {
char *shm;
sema_t *sp_niu_pio_request;
sema_t *sp_niu_pio_response;
sema_t *sp_sii_rd_available;
sema_t *sp_sii_wr_available;
sema_t *sp_sii_rd_req;
sema_t *sp_sii_rd_res;
sema_t *sp_xaui0_available;
sema_t *sp_xaui0_req;
sema_t *sp_xaui1_available;
sema_t *sp_xaui1_req;
sema_t *sp_rx0_available;
sema_t *sp_rx1_available;
sema_t *sp_sii_wr_req;
sema_t *sp_sii_wr_res;

void *data;
int *typ;

void *sii_wr_data;
int  *sii_wr_size;
unsigned long long int *sii_wr_addr;

int *niu_read;
int *niu_write;
int *read_size;
unsigned long long int *pa_read;
void *sio_data;

void *xaui0_data;
int  *xaui0_size;

void *xaui1_data;
int  *xaui1_size;

unsigned char *xaui_rx_data[2];

int *xaui_rx_pointer[2];
int *xaui_rx_head[2];
int *xaui_rx_tail[2];

unsigned int *interrupt;


void add_rx_packet(int port, void *data, int size);
void remove_rx_packet(int port, void *data, int &size);
void display_rx_packet_queue(int port);


public:

typedef enum {NCU, SIU, ESR, EXIT} TYPE;
sharedmem(key_t key, int create);
void deliver_ncu_req(void *buf, int size);
void receive_ncu_req(void *buf, int size);
void deliver_niu_res(void *buf, int size);
void receive_niu_res(void *buf, int size);
void signalExit();

void tx0_send_packet(int size, uint8_t * data);
int tx0_wait_packet(int &size, uint8_t * data);
void tx0_packet_sent();

void tx1_send_packet(int size, uint8_t * data);
int tx1_wait_packet(int &size, uint8_t * data);
void tx1_packet_sent();

void setType(int t);
int getType();

void rx0_wait_packet(int &size, uint8_t * data);
void rx1_wait_packet(int &size, uint8_t * data);
void rx0_packet_rec(int size, uint8_t * data);
void rx1_packet_rec(int size, uint8_t * data);

void sii_write_req(uint64_t paddr, uint8_t * data, uint64_t size);
int  sii_receive_write_req(uint64_t &paddr, uint8_t * data, uint64_t &size);
void sii_write_res();

void sii_read_req(uint64_t paddr, uint8_t * data, uint64_t size);
int sii_receive_read_req(uint64_t &paddr, uint64_t &size);
void sii_read_res(uint8_t * data, uint64_t size);


void deliverInterrupt(unsigned int data);
void receiveInterrupt(unsigned int &data);



};

