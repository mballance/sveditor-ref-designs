/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: iob_main.c
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
#include "global.h"

#include "b_ary.h"
#include "bw_lib.h"
#include "list.h"
#include "l2warm.h"
#include "l1warm.h"
#include "utility.h"

typedef struct  iop_main_struct{
  b_tree_node_ptr sysMem;//b_try for memory
  list_head_ptr l1_list;

}*iop_main_structPtr;
static struct iop_main_struct iop_TempVariable;
//---------------------------------------------------------------
//
char* searchPattern(char *buf, char* pattern)
{ 
  return strpbrk(buf, pattern); 
}
//---------------------------------------------------------------
//
void copyStr(char *nextPtr, char* tbuf, char* pattern)
{ 
  
  int size;
  if(strlen(nextPtr) == 0){
    tbuf[0] = '\0';
  }
  else{
    size =  strcspn(nextPtr, pattern); 
    memcpy(tbuf, nextPtr, size);
    tbuf[size] = '\0';
  }
}
//---------------------------------------------------------------
//
int extract_intValue(char *nextPtr, char* pattern)
{ 
  char tbuf[BUFFER];
  copyStr(nextPtr, tbuf, pattern);
  return atoi(tbuf);
}
//---------------------------------------------------------------
//
unsigned long long extract_longValue(char *nextPtr, char* pattern)
{ 
  char tbuf[BUFFER];
  copyStr(nextPtr, tbuf, pattern);
  return n2_ck_getEight(tbuf, 0);
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
void packingData(char* buf, char* cbuf)
{
  char ch;
  int idx, cidx;
  idx = 0;
  cidx= 0;
  while(buf[idx] != '\0'){
    ch  = buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
    ch <<= 4;
    idx++;
    if(buf[idx] == '\0')break;
    ch  |= buf[idx] > '9' ? ((buf[idx] & 0xf) + 9) : buf[idx] & 0xf;
    cbuf[cidx] = ch;
    idx++;
    cidx++;
  }
}

/*------------------------------------------
load and go

-------------------------------------------*/
void l2_warm_forloadAndgo_call()
{  
 
  char    *pargs;
 
  io_printf("Info(PLI):loadandgo warm start....\n");
  l2warm_set();
  FILE *fp;
  char  buf [BUFFER];
  char  tbuf[BUFFER];
  KeyType addr;
 
  int  subbank;
  char *nextPtr; 
  char hexa[17] = "0123456789abcdef";
  char space[3] = " \n";
  char data[65]; //hold data
  int  expected;
  int  set, bank, way;

  //get options will bes used in this file.
  pargs = mc_scan_plusargs ("loadngo_log=");
  if(pargs != (char *) 0)fp = fopen(pargs, "r");
  else fp = fopen("loadngo_l2array_dumped.log", "r");

  if(fp == null){
    io_printf("Error:  can not open file %s for reading\n", pargs != (char *) 0 ? pargs : 
	      "loadngo_l2array_dumped.log");
    tf_dofinish();
  }
  io_printf("Info: reading %s file \n", pargs != (char *) 0 ? pargs : "loadngo_l2array_dumped.log");
  expected = 0;
  while(fgets(buf, BUFFER, fp)){

    if(expected){//slam here
      nextPtr = searchPattern(buf, hexa);
      if(nextPtr == null)continue;
      copyStr(nextPtr, tbuf, space);
      packingData(tbuf, data);

      subbank  = (int)((addr >> 4) & 0x3); 
      l2warm_get_Mode(&addr);
      l2warm_vars.way      = way;
      l2warm_vars.bank     = bank;
      l2warm_vars.l2_index = set;

      l2warm_slam_tag(); //process tag
      l2warm_slam_vuad();//process vuad
      //     for(int idx = 0;idx<64;idx++)io_printf("%02x",data[idx] &0xff);io_printf("\n");
      l2warm_slam_real_data(data, subbank);//process data    
      expected = 0;
      continue;
    }
    if((nextPtr = strstr(buf, "Set")) == null)continue;
    nextPtr = searchPattern(nextPtr+3, hexa);
    set     = extract_intValue(nextPtr, space);    
    if((nextPtr = strstr(buf, "Bank")) == null)continue;
    nextPtr = searchPattern(nextPtr+4, hexa);
    bank    = extract_intValue(nextPtr, space);   
    if((nextPtr = strstr(buf, "Way")) == null)continue;
    nextPtr = searchPattern(nextPtr+4, hexa);
    way     = extract_intValue(nextPtr, space);   
    if((nextPtr = strstr(buf, "Addr")) == null)continue;
    nextPtr = searchPattern(nextPtr+4, hexa);
    addr    =  extract_longValue(nextPtr, space);   
    expected = 1;   
  }
  fclose(fp);
}

/*------------------------------------------
do l2 warming here.
-------------------------------------------*/
void l2_warm_call()
{  
  int idx ;
  char *pargs, cbuf[17];
  //b_tree_node_ptr sysMem;//b_try for memory
  char  zero_data[64];
  int  slam_flag;
  b_tree_atom_ptr  data;//b-tree node.
  list_node_ptr  addr_ptr;
  list_head_ptr  addr_list;
  KeyType        mask_addr, b_addr;
  //get options will bes used in this file.
  pargs = mc_scan_plusargs ("loandgo=");
  if(pargs != (char *) 0)l2warm_vars.loadandgo = atoi(pargs);
  if(l2warm_vars.loadandgo != 0){
    l2_warm_forloadAndgo_call();
    return;    
  }
  l2warm_set();
  //get options will bes used in this file.
  l2warm_vars.l2_warm = 0;
  pargs = mc_scan_plusargs ("l2warm=");
  if(pargs != (char *) 0)l2warm_vars.l2_warm = atoi(pargs);
  l2warm_vars.l1_warm = 0;
  pargs = mc_scan_plusargs ("l1warm=");
  if(pargs != (char *) 0)l2warm_vars.l1_warm = atoi(pargs);
  if(l2warm_vars.l2_warm == 0)return;
  addr_list           = (list_head_ptr)malloc(sizeof(struct list_head_node));
  addr_list->head_ptr = 0;
  addr_list->tail_ptr = 0;
  addr_list->num      = 0;
  
  //set argment
  iop_TempVariable.sysMem = b_create();//create
  n2_ck_read_mem("mem.image", &iop_TempVariable.sysMem, addr_list);//read memory
  
  io_printf("Info:l2 warm start....\n");
  l2warm_vars.check_range = 0;
  pargs = mc_scan_plusargs ("l2range=");

  if(pargs != (char *) 0){
    l2warm_vars.check_range = 1;
    idx = l2warm_copy(pargs, cbuf, 0);
    l2warm_vars.up_bound  = l2warm_getEight(cbuf);
    l2warm_copy(pargs, cbuf, idx);
    l2warm_vars.low_bound = l2warm_getEight(cbuf);
    io_printf("Info:L2warm range %llx:%llx\n", l2warm_vars.up_bound, l2warm_vars.low_bound);
  }
  for(idx = 0; idx < MAX_BANK;idx++)l2warm_l2_clear_vuad(idx);
  if(l2warm_vars.l1_warm ){
    iop_TempVariable.l1_list           = (list_head_ptr)malloc(sizeof(struct list_head_node));
    iop_TempVariable.l1_list->head_ptr = 0;
    iop_TempVariable.l1_list->tail_ptr = 0;
    iop_TempVariable.l1_list->num      = 0;
    io_printf("Info:L1warm is on\n");
  }
  if(l2warm_vars.check_range){
    for(b_addr = l2warm_vars.low_bound  & 0xffffffffc0 ; b_addr < l2warm_vars.up_bound;b_addr += 64){
      mask_addr = (b_addr >> 6) & 0x3ffffffff;
      data      = b_Find(&iop_TempVariable.sysMem, &mask_addr);
      if(data == 0)for(idx = 0; idx < 64;idx++)zero_data[idx] = random() & 0xff;
      slam_flag = data ? l2warm_slam(b_addr, data->data) : l2warm_slam(b_addr, zero_data);
      if(l2warm_vars.l1_warm && (slam_flag & 1) ){//slam this address
	addr_ptr       = (list_node_ptr)malloc(sizeof(struct list_node));
	addr_ptr->addr = b_addr;
	addr_ptr->way  = (slam_flag >> 1) & 0xf;
	n2_ck_push(iop_TempVariable.l1_list, &addr_ptr);
      }
    }
  }
  else{
    //warm start
    while((addr_ptr = n2_ck_pop(addr_list)) != 0 ){//get address
      mask_addr = (addr_ptr->addr >> 6) & 0x3ffffffff;       
      data      = b_Find(&iop_TempVariable.sysMem, &mask_addr);//get data to be slammed.
      slam_flag = data ? l2warm_slam(addr_ptr->addr, data->data) : l2warm_slam(addr_ptr->addr, zero_data);
      if(l2warm_vars.l1_warm && (slam_flag & 1)){
	addr_ptr->way  = (slam_flag >> 1) & 0xf;
	n2_ck_push(iop_TempVariable.l1_list, &addr_ptr);
      }
      else free(addr_ptr);
    }
  }
  if(l2warm_vars.l1_warm == 0)b_destory(&iop_TempVariable.sysMem);
}
/*------------------------------------------
do l1 warming here.
-------------------------------------------*/
void l1_warm_call()
{
  int    dev;
  char*  pargs;
  b_tree_atom_ptr  data;//b-tree node.
  list_node_ptr    addr_ptr;
  KeyType          mask_addr;

  //no l2slam, it means that we dont need l1slam.
  //because l2 is an inclusive cache.
  pargs = mc_scan_plusargs ("l2warm=");
  if(pargs != (char *) 0)dev = atoi(pargs);
  else return;
  if(dev == 0)return;
  pargs = mc_scan_plusargs ("l1warm=");
  if(pargs != (char *) 0)dev = atoi(pargs);
  else return;
  if(dev == 0)return;

  l1warm_set_cpu();//get the infomation how many core is on.

  l1warm_set(); 
  l1warm_clean_dir(); 
  io_printf("Info:L1 warm start\n");
  //warm start
  while((addr_ptr = n2_ck_pop(iop_TempVariable.l1_list)) != 0){
    //here we can slam l1 randomly.
    mask_addr = (addr_ptr->addr >> 6) & 0x3ffffffff;
    data      = b_Find(&iop_TempVariable.sysMem, &mask_addr);
    if(data)l1warm_slam(addr_ptr->addr, data->data, addr_ptr->way);
    //io_printf("Info address %llx %x\n", addr_ptr->addr, addr_ptr->way);
    free(addr_ptr);
  }
  l1warm_store_parityValidAddr();
  b_destory(&iop_TempVariable.sysMem);
}

/*------------------------------------------
get l2event.
!$EV  trig_pc_d(1, 64'h0000000001834140) -> l2warm()

--------------------------------------------*/
void l2warm_get_event(char *str)
{
  FILE *fp;//file pointer
  char  buf [BUFFER], cbuf[BUFFER];//temp variavle for intermiate data
  int   idx;
  long long key;

  l2warm_vars.avl_ptr = 0;
  if((fp = fopen(str, "r")) == 0){
    io_printf("Info(Warnning): can not open the event file %s for reading\n", str);
    return;
  }
  while(fgets(buf, BUFFER, fp)){
    idx = n2_ck_rmSpace(buf, 0, BUFFER);    
    l2warm_replace(buf);
    if(strncmp(buf, "trig_pc_d ", 10))continue; 
    idx = n2_ck_rmSpace(buf, 10, BUFFER);   
    idx = l2warm_copy(buf, cbuf, idx);

    idx = n2_ck_rmSpace(buf, idx, BUFFER);   
    idx = l2warm_copy(buf, cbuf, idx);//pc value

    l2warm_rmhexa(cbuf);
    key = l2warm_getEight(cbuf);
    idx = n2_ck_rmSpace(buf, idx, BUFFER);   
    idx = l2warm_copy(buf, cbuf, idx); 

    if(strncmp(cbuf, "l2warm", 6))continue;//here only handle interrupt
    l2warm_insert_avl_node(&l2warm_vars.avl_ptr, &key);

  }
  fclose(fp); 
}
/*------------------------------------------
do the pc event check here.
-------------------------------------------*/
void n2_check_event_call()
{
  int active, l2warm, loc, low, high, idx;
  long long pc, tlow, thigh;
  char  *str;
  if(tf_getp(1) == 2){
    l2warm = tf_getp(3);
    if(l2warm)return;//have event to be executed.
    active = tf_getp(2);
    loc    = 4;
    for(idx = 0;idx < (tf_nump() - 4);idx += 2){
      if(tf_getp(loc)){
	low     = tf_getlongp(&high, loc+1);
	tlow    = low;
	thigh   = high;
	thigh <<= 32;
	thigh  &= 0xffffffff00000000;
	tlow   &= 0x00000000ffffffff;
	pc    = thigh | tlow;
	if(l2warm_vars.avl_ptr && l2warm_search_node(&l2warm_vars.avl_ptr, &pc)){
	  io_printf("Info(%d): l2warm event HIT pc =  %llx\n", tf_gettime(), pc);
	  tf_putp(3, 1);
	  break;
	}
      }
      loc += 2;
    }
  }
  else if(tf_getp(1) == 1){
    l2warm_vars.avl_ptr = 0;  
    str = tf_getcstringp(3);  // a get file name
    l2warm_get_event(str);
    l2warm_setRdancy(tf_getp(4));
  }
}
