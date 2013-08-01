/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bw_lib.c
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
#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include "bw_lib.h"
/*-------------------------------------------------------------------------------
   remove leading space or tab.
   if found carriage return, return -1 to indicate anenpty string.
--------------------------------------------------------------------------------*/
int n2_ck_rmSpace(char* buf, int index, int max){
  while((index < max) && (buf[index] == ' ' || buf[index] == '\t'))index++;
  return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
unsigned long long n2_ck_getEight(char *buf, int idx)
{
  int  i;
  unsigned long long addr = 0;

  //for(i = idx;  buf[i] != '\0';i++){
    for(i = idx; ( ( (buf[i] >= '0') && (buf[i] <= '9') ) ||
	         ( (buf[i] >= 'a') && (buf[i] <= 'f') ) ) ;i++){
    addr <<= 4;
    addr  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return addr;
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
int n2_ck_getAddr(char *buf, unsigned long long *addr, int idx){
  int i;

  for(i = idx; buf[i] != '\0'; i++)
    if(buf[i] == '/'){
      for(i = i-1; i >= 0;i--)
	if(buf[i] >= '0' && buf[i] <= '9'){
	  buf[i+1] = '\0';
	  break;
	}
      break;
    }
  for(i = idx; buf[i] != '\0'; i++){
    if(buf[i] == '@'){
      i++;
      // io_printf("BUFFER %s\n", buf);
      *addr = n2_ck_getEight(buf, i);//ato_long(buf, &i); 
      return 1;
    }
  }
  return 0;
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
void n2_ck_a2h(char* buf,int idx,  char* cbuf, int* cidx){

  char ch;

  while((buf[idx] != '\0') && (buf[idx] != '\n')){
    if(buf[idx] == ' '){ 
      idx++;
      continue;
    }
    ch  = buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
    ch <<= 4;
    idx++;
    if(buf[idx] == '\0' ||  buf[idx] == '\n'){
      cbuf[*cidx] = ch;
      (*cidx)++;
      break;
    }
    ch  |= buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
    cbuf[*cidx] = ch;
    idx++;
    (*cidx)++;
  }
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
int n2_ck_align_buf(char* cbuf, int cidx){
  int i;

  if(cidx < 64)return cidx;
  for(i = 64; i < cidx;i++)cbuf[i-64] = cbuf[i];
  return 64;
} 
/*-------------------------------------------------------------------------------
  1). only use 40 bits
  2). line size 64 bytes.
--------------------------------------------------------------------------------*/
KeyType n2_ck_mask_addr (KeyType addr){

  addr >>= 6;
  addr  &= 0x3ffffffff;
  return addr;
}
/*-------------------------------------------------------------------------------
   read mem.image and build memory.
--------------------------------------------------------------------------------*/
void n2_ck_padding(char* buf, int index)
{
  int num,  ind;
  ind = index;
  num = 0;
  //  io_printf("PADDING %s\n", buf);
  //counter how many character in buff.
  while(num < 64){
    if(buf[ind] == ' '){
      ind++;
      continue;
    }
    if((buf[ind] == '\n') || (buf[ind] == '\0')){
      break;
    }
    ind++;
    num++;
  } 

  if(num < 64){//do padding
    ind--;
    if(buf[ind] != ' ')ind++;
    while(num < 64){
      if((num % 16) == 0){
	buf[ind] = ' ';
	ind++;
      }
      buf[ind] = '0';
      ind++;
      num++;
    }
    buf[ind] = '\n';
  }// io_printf("after PADDING %s", buf);
}
/*------------------------------------------
 initiliaze jbus handle.
-------------------------------------------*/
void n2_ck_read_mem(char*        str, 
	      b_tree_node_ptr*   root,
	      list_head_ptr addr_list)
{
  FILE *fp;
  char  buf [BUFFER];
  char  cbuf[BUFFER];
  int   idx, cidx;
  KeyType  addr, t_addr;
  b_tree_atom_ptr atom;//node for b-tree.
  list_node_ptr   addr_ptr;
  int dev, zero;

  if((fp = fopen(str, "r")) == 0){
    io_printf("Error:  can not open file %s for reading\n", str);
    tf_dofinish();
  }
  cidx = 0;
  addr = 0;
  zero = 0;

  while(fgets(buf, BUFFER, fp)){
    idx = n2_ck_rmSpace(buf, 0, BUFFER);
    if(idx < 0 || strncmp (buf, "//", 2) == 0){
      idx  = n2_ck_rmSpace(buf, idx+2, BUFFER);
      if(strncmp(buf+idx, "zero_bytes", 10) == 0)zero = 1;
      continue;//empty string
    }
    t_addr = addr;
    if(n2_ck_getAddr(buf, &addr, idx)){//get address
      //io_printf("IO ADDRESS %s %llx\n", buf, addr);
      if(cidx){
	atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
	for(idx = 0;idx < cidx;idx++)atom->data[idx] = cbuf[idx];
	atom->data[cidx] = '\0'; 
	atom->key        = n2_ck_mask_addr(t_addr);
	atom->size       = cidx;
	b_insert(root, &atom);
	dev  = (int)(t_addr >> 28);
	dev &= 0xfff;
	//if next data is zero byte, don't store address into list.
	if(dev < 0x200){
	  //save address for l2warm
	  if(zero == 0){
	    addr_ptr       = (list_node_ptr)malloc(sizeof(struct list_node));
	    addr_ptr->addr = t_addr;
	    n2_ck_push(addr_list, &addr_ptr);
	  }
	}
	zero = 0;
      }
      cidx = addr & 0x3f;
      continue;
    }//if(getAddr
    n2_ck_padding(buf, idx);
    n2_ck_a2h(buf, idx,  cbuf, &cidx);
    while(cidx >= 64){
      atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
      for(idx = 0;idx < 64;idx++)atom->data[idx] = cbuf[idx];
      atom->data[64] = '\0';
      atom->key      = n2_ck_mask_addr(addr);
      atom->size     = 64; 
      b_insert(root, &atom);
      dev  = (int)(addr >> 28);
      dev &= 0xfff;
      if(dev < 0x200){
	if(zero == 0){
	  //save address
	  addr_ptr       = (list_node_ptr)malloc(sizeof(struct list_node));
	  addr_ptr->addr = addr;
	  n2_ck_push(addr_list, &addr_ptr);
	}
      }
      //generate the next address
      cidx -= n2_ck_align_buf(cbuf, cidx);      
      addr += 64;
    }
  }//while(fgets(buf, BUFFER, fp)){
  fclose(fp);

  //process the last input
  if(cidx){
    atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
    for(idx = 0;idx < cidx;idx++)atom->data[idx] = cbuf[idx];
    atom->data[cidx] = '\0';
    atom->key      = n2_ck_mask_addr(addr);
    atom->size     = cidx; 
    b_insert(root, &atom);
    dev  = (int)(addr >> 28);
    dev &= 0xfff;
    if(dev < 0x200){
      if(zero == 0){
	//save address
	addr_ptr       = (list_node_ptr)malloc(sizeof(struct list_node));
	addr_ptr->addr = addr;
	n2_ck_push(addr_list, &addr_ptr);
      }
    }
  }
}

/*------------------------------------------
set random seed
-------------------------------------------*/
void n2_ck_set_random()
{
  char  *pargs;
  unsigned int seed;
  pargs = mc_scan_plusargs ("tg_seed=");  
  if(pargs != (char *) 0) {
    seed = atoi(pargs);
    srand(seed);
    srandom(seed);
  }
}
