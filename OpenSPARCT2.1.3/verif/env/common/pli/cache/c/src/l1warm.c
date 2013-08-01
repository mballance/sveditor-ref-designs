/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: l1warm.c
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
#include "l1warm.h"
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l1warm_init()
{
    int i;
  l1warm_vars.idir_num   = 0;
  l1warm_vars.ddir_num   = 0;
  //slam icache & dcache 50%, respectively. 
  l1warm_vars.icache     = 50;
  l1warm_vars.dcache     = 50;
  l1warm_vars.idone      = 0;
  l1warm_vars.ddone      = 0;
  l1warm_vars.dcache_num = 0;
  l1warm_vars.icache_num = 0;
  l1warm_vars.dtag_num   = 0;
  l1warm_vars.itag_num   = 0;
  l1warm_vars.ivalid_num = 0;
  l1warm_vars.dvalid_num = 0;

  for(i = 0; i < 8 * MAX_BANK; i++){
    l1warm_vars.dir_ivalid[i]  = 0;
    l1warm_vars.dir_dvalid[i]  = 0;
    l1warm_vars.dir_iparity[i] = 0;
    l1warm_vars.dir_dparity[i] = 0; 
    l1warm_vars.dir_iaddr4[i]  = 0;
    l1warm_vars.dir_daddr4[i]  = 0;
  }
  l1warm_vars.iround = 0;
  //debug
  l1warm_vars.l1_debug     = 0;
  l1warm_vars.check_irange = 0;
  l1warm_vars.check_drange = 0;
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
void l1warm_clean_dir()
{
    int i;
  for(i = 0; i < 8 * MAX_BANK; i++){
    l1warm_vars.dir_ivalid[i]  = 0;
    l1warm_vars.dir_dvalid[i]  = 0;
    l1warm_vars.dir_iparity[i] = 0;
    l1warm_vars.dir_dparity[i] = 0;
  }
}
/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
int l1warm_copy(char* buf, char* cbuf, int idx)
{
  int ind = 0;
  while((buf[idx] != '\0') && 
	(buf[idx] != ':')  &&
	(buf[idx] != ' ')  &&
	(ind < 16))cbuf[ind++] = buf[idx++];
  cbuf[ind] = '\0';
  return ++idx;
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
long long  l1warm_getEight(char *buf)
{
  int  i;
  long long  key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}
/*-------------------------------------------
check whether it is invalidate_all.
---------------------------------------------*/
long long l1warm_get_long(int loc){
  int       low, high;
  long long sixty;

  low     = tf_getlongp(&high, loc);
  sixty   = high;
  sixty <<= 32;
  sixty  |= low;
  return sixty;
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l1warm_set()
{
  int arg, idx, bank, row, panel;
  //set options.
  char*  pargs, cbuf[16];
  s_tfnodeinfo node_info;
  l1warm_init(); 

  //get dcache directory pointer
  //l1 dcache
  idx = 0;arg = 2;
  for(bank = 0; bank < MAX_BANK;bank++){
    idx = bank * 8;
    for(row = 0; row < 2;row++){
      for(panel = 0; panel < 4; panel++){
	tf_nodeinfo(arg, &node_info);
	if(l1warm_vars.ddir_num == 0)l1warm_vars.ddir_num = node_info.node_ngroups;
	l1warm_vars.dir_darray[idx]  = node_info.node_value.memoryval_p;
	arg += 4;
	idx++;
      }
    }

  //l2 icache directory
  //64 for each memory
    idx = bank * 8;
    for(row = 0; row < 2;row++){
      for(panel = 0; panel < 4; panel++){
	tf_nodeinfo(arg, &node_info);
	if(l1warm_vars.idir_num == 0)l1warm_vars.idir_num = node_info.node_ngroups;
	l1warm_vars.dir_iarray[idx]  = node_info.node_value.memoryval_p;
	arg += 4;
	idx++;
      }
    }
  }//for(bank = 0; bank < MAX_BANK;bank++){

  /*
  //i$ & D$ of l1
  for(idx = 0;idx < MAX_CORE;idx++){
    if(l1warm_vars.cpu_status & (1 << idx)){//if instantiate, do it.
      //get the dcache pointer.
      for(i = 0; i < 4;i++){
	tf_nodeinfo(arg++, &node_info);
	l1warm_vars.dcache_w[idx][i] = node_info.node_value.memoryval_p;//way and core
	if(l1warm_vars.dcache_num == 0)l1warm_vars.dcache_num  = node_info.node_ngroups;
      }
      //tag
      for(i = 0; i < 4;i++){
	tf_nodeinfo(arg++, &node_info);
	l1warm_vars.dcache_tag[idx][i] = node_info.node_value.memoryval_p;//way and core
	if(l1warm_vars.dtag_num == 0)l1warm_vars.dtag_num  = node_info.node_ngroups;
      }
      //valid
      //slam valid to zero.
      l1warm_vars.dcache_vld[idx] = arg;
      tf_nodeinfo(arg++, &node_info);
      for(i = 0; i < node_info.node_ngroups;i++){
	node_info.node_value.vecval_p[i].avalbits = 0;
	node_info.node_value.vecval_p[i].bvalbits = 0;
      }
      tf_propagatep(l1warm_vars.dcache_vld[idx]);

      //get icache pointer
      //icache data

      for(i = 0; i < 16;i++){
	tf_nodeinfo(arg++, &node_info);
	l1warm_vars.icache_data[idx][i] = node_info.node_value.memoryval_p;//way and core
	if(l1warm_vars.dtag_num == 0)l1warm_vars.icache_num  = node_info.node_ngroups;
      }
      for(i = 0; i < 8;i++){
	tf_nodeinfo(arg++, &node_info);
	l1warm_vars.icache_tag[idx][i] = node_info.node_value.memoryval_p;//way and core
	if(l1warm_vars.itag_num == 0)l1warm_vars.itag_num  = node_info.node_ngroups;
      }
      //slam valid to zero.
      l1warm_vars.icache_vld[idx] = arg;
      tf_nodeinfo(arg++, &node_info);
      for(i = 0; i < node_info.node_ngroups;i++){
	node_info.node_value.vecval_p[i].avalbits = 0;
	node_info.node_value.vecval_p[i].bvalbits = 0;
      }
      tf_propagatep(l1warm_vars.icache_vld[idx]);
    }
  }
  //get option for l1 warm
  */
  pargs = mc_scan_plusargs ("l1_debug=");
  if(pargs != (char *) 0)l1warm_vars.l1_debug = 1;

  pargs = mc_scan_plusargs ("l1_irange=");
  if(pargs != (char *) 0){
    l1warm_vars.check_irange = 1;
    idx                      = l1warm_copy(pargs, cbuf, 0);
    l1warm_vars.up_ibound    = l1warm_getEight(cbuf);
    l1warm_copy(pargs, cbuf, idx);
    l1warm_vars.low_ibound   = l1warm_getEight(cbuf);
    io_printf("Info:L1_islam range %llx:%llx\n", l1warm_vars.up_ibound, l1warm_vars.low_ibound);
  }

  pargs = mc_scan_plusargs ("l1_drange=");
  if(pargs != (char *) 0){
    l1warm_vars.check_drange = 1;
    idx                      = l1warm_copy(pargs, cbuf, 0);
    l1warm_vars.up_dbound    = l1warm_getEight(cbuf);
    l1warm_copy(pargs, cbuf, idx);
    l1warm_vars.low_dbound   = l1warm_getEight(cbuf);
    io_printf("Info:L1_dslam range %llx:%llx\n", l1warm_vars.up_dbound, l1warm_vars.low_dbound);
  }

  //check bank mode.
  l1warm_vars.l2mask      = 0xf;
  l1warm_vars.l2bank_type = 4;   
  pargs = mc_scan_plusargs ("bank_set+mask=");
  if(pargs != (char *) 0){
    l1warm_vars.l2mask    = atoi(pargs);
    l1warm_vars.l2bank_type = 0;   
    for(idx = 0; idx < 4;idx++){
      if(l1warm_vars.l2mask & (1 << idx))l1warm_vars.l2bank_type++;
    } 
  } 
}

/*--------------------------------------------
after slam tag, save valid & parity into memory.
--------------------------------------------*/
void l1warm_store_parityValidAddr()
{
  int bank, row, pair, arg,  idx;
  //ddirectory
  for(bank = 0; bank < 8;bank++){
    for(row = 0; row < 2;row++){
      for(pair = 0; pair < 4; pair++){
	idx = bank * BANK_NUM + row * ROW_NUM + pair;
	arg = 3 + bank * BANK_NUM + row * ROW_NUM + pair;
	tf_putlongp(arg++, l1warm_vars.dir_dvalid[idx],  l1warm_vars.dir_dvalid[idx] >> 32);
	tf_putlongp(arg++, l1warm_vars.dir_dparity[idx], l1warm_vars.dir_dparity[idx] >> 32);
	tf_putlongp(arg,   l1warm_vars.dir_daddr4[idx],  l1warm_vars.dir_daddr4[idx] >> 32);
      }
    }
  }
  //idirectory
  for(bank = 0; bank < 8;bank++){
    for(row = 0; row < 2;row++){
      for(pair = 0; pair < 4; pair++){
	  idx = bank * BANK_NUM + row * ROW_NUM + pair;
	  arg = 35+ bank * BANK_NUM + row * ROW_NUM + pair;
	  tf_putlongp(arg++, l1warm_vars.dir_ivalid[idx],  l1warm_vars.dir_ivalid[idx]  >> 32);
	  tf_putlongp(arg++, l1warm_vars.dir_iparity[idx], l1warm_vars. dir_iparity[idx] >> 32);
	  tf_putlongp(arg,   l1warm_vars.dir_daddr4[idx],  l1warm_vars.dir_iaddr4[idx] >> 32);
      }
    }
  }
}

/*--------------------------------------------
clean valid bits when l2_warm is called beacuse
ni is inclusive cache. 
--------------------------------------------*/
void l1warm_clean_valid()
{
 
  int idx, byte;
  s_tfnodeinfo node_info;

  for(idx = 2; idx < tf_nump();idx++){
    //slam valid to zero.
    tf_nodeinfo(idx, &node_info);
    for(byte = 0; byte < node_info.node_ngroups;byte++){
      node_info.node_value.vecval_p[byte].avalbits = 0;
      node_info.node_value.vecval_p[byte].bvalbits = 0;
    }
    tf_propagatep(idx);
  }
}
/*--------------------------------------------
clean valid bits when l2_warm is called beacuse
ni is inclusive cache. 
--------------------------------------------*/
void l1warm_clean_dirvld()
{
int idx; 
  for(idx = 2; idx < tf_nump();idx++)tf_putlongp(idx, 0, 0);

}
/*--------------------------------------------
got the predecode information.
--------------------------------------------*/
int l1warm_predecoder(int inst)
{
  int out, op, op1, op2, op3;
  op  = (inst >> 30 ) & 0x3; 
  out = 0;
  if(op == 1)out = 1;//call
  else if(op == 0){//branch, sethi, nop
    op1 = (inst >> 22) & 0x7;
    if(op1 == 0x4)out = 0; // nop/sethi
    else out = 1;// branch
  }
  else if(op == 2){// arith, shift, mem#, mov
    op1 = (inst >> 23) & 0x3;
    if(op1 == 3)out = 1;// wrpr, vis, save, jmpl
    else if((op1 & 2) == 0){// arith
      op2 = (inst >> 22) & 0x3;
      op3 = (inst >> 19) & 0x3;
      if((op2 & 1) == 0)out = 0;// alu op
      else if((op2 & 1) && (op3 == 0))out = 0;// subc or addc
      else out = 1;// mul, div
    }
    else{// if (in[24:23] == 2'b10)  shft, mov, rdpr, tag
      op2 = (inst >> 19) & 0xf;
      if(op2 == 4)out = 1; // mulscc
      else if((op2 & 0x8) == 0)out = 0;
      else if((op2 == 0xc) ||(op2 == 0xf)) out = 0;// mov
      else out = 1;// rdsr, mem#, popc, flushw, rdpr
    }
  }
  else{// ld st
    op1 = (inst >> 19) & 0x3f;
    op2 = (inst >> 21) & 0x3;
    if(op1 & 0x20 || op1 & 0x10 || (op1 & 0x4) == 0)out = 1; // fp, alt space or ld
    else if (((op1 & 0x10) == 0) &&((op1& 0xf) == 0xe)) out = 0; // stx
    else if (op2 == 1)out = 0;  // other st
    else out = 1;
  }
  return out;
}
/*--------------------------------------------
deceide which cache is slammed at this time.
--------------------------------------------*/
int l1warm_which_cache()
{
  int which = (random() & 1) + 1;
  if(which == 1){//dcache
    if(l1warm_vars.ddone == l1warm_vars.dcache){
      l1warm_vars.idone++;
      which = 2;
    }
    else l1warm_vars.ddone++;
  }
  else {//icache
    if(l1warm_vars.idone == l1warm_vars.icache){
      l1warm_vars.ddone++;
      which = 1;
    }
    else l1warm_vars.idone++;
  }
  if((l1warm_vars.icache == l1warm_vars.idone) && (l1warm_vars.dcache == l1warm_vars.ddone)){
    l1warm_vars.idone = 0;
    l1warm_vars.ddone = 0;
  }
  return which;
}
/*--------------------------------------------
choose the way to be slammed.
--------------------------------------------*/
int l1warm_which_way(KeyType addr)
{
  long long lword;
  int       gidx, sidx, idx;
  int       addr_idx, i, j, avld;
  int       etag;
  s_tfnodeinfo node_info;
  char *avalPtr;

  l1warm_vars.itag  = (addr >> 12) & 0xfffffff;//28 bits addr[39:12]
  addr_idx   = (addr >> 5)  & 0x7f;
  addr_idx <<= 2;
  tf_nodeinfo(l1warm_vars.icache_vld[l1warm_vars.cpu], &node_info);
  for(i = 0; i < 4;i++){
    idx  = addr_idx + i;
    gidx = idx / 32;
    sidx = idx % 32;
    avld = node_info.node_value.vecval_p[gidx].avalbits;
    if((avld & ( 1 << sidx)) == 0)continue;
    //avalPtr    = l1warm_vars.icache_tag[l1warm_vars.cpu] + idx * l1warm_vars.itag_num * 2;
    for(j = l1warm_vars.itag_num - 1; j >= 0;j--){
      lword <<= 8;
      lword  |= avalPtr[j] & 0xff;
    }
    etag = (lword >> 1) & 0xfffffff;
    if(l1warm_vars.itag == etag){
      l1warm_vars.way = i;
      return 1;
    }
  }
  if(i == 4)l1warm_vars.way = random() & 0x3;
  return 0;
}
/*--------------------------------------------
count how many cores are turned on.
--------------------------------------------*/
void l1warm_set_cpu()
{
  int idx, stat;
  l1warm_vars.cpu_status = tf_getp(1);
  l1warm_vars.cpu_num    = 0;
  
  for(idx = 0; idx < MAX_CORE;idx++){
    if(stat & (1 << idx))l1warm_vars.cpu_ptr[l1warm_vars.cpu_num++] = idx;
  }
  io_printf("Info Core_status(%x) number(%d)\n", l1warm_vars.cpu_status, l1warm_vars.cpu_num);
}
/*--------------------------------------------
choose the core to be slammed.
--------------------------------------------*/
void l1warm_core(int num)
{
  l1warm_vars.cpu = l1warm_vars.cpu_chose[num];
}
/*--------------------------------------------
choose the followings to be slammed:
1. how many core.
2. which core.
--------------------------------------------*/
int l1warm_howmany_cpu()
{
  int i,chose, status = 0;
  int num  = random() % l1warm_vars.cpu_num + 1;

  for(i = 0; i < num;i++){
    while(1){
      chose = random() % l1warm_vars.cpu_num;
      if((status & ( 1 << chose)) == 0){
	status      |= (1 << chose);
	l1warm_vars.cpu_chose[i] = l1warm_vars.cpu_ptr[chose];
	break;
      }
    }
  }
  return num;
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l1warm_even_parity(int data, int num)
{
  int i,parity = 0;
  for(i = 0; i < num;i++){
    parity ^= (data & 1);
    data  >>= 1;
  }
  return parity;
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l1warm_even_parityLong(long long data, int num)
{

  int i,parity = 0;
  for(i = 0; i < num;i++){
    parity ^= (data & 1);
    data  >>= 1;
  }
  return parity;
}
/*--------------------------------------------
get options from command line.
--------------------------------------------*/
void l1warm_option()
{
  char*  pargs;

  pargs = mc_scan_plusargs ("icache=");
  if(pargs != (char *) 0)l1warm_vars.icache = atoi(pargs);
  pargs = mc_scan_plusargs ("dcache=");
  if(pargs != (char *) 0)l1warm_vars.dcache = atoi(pargs);
}
/*--------------------------------------------
slam data into dir. cache.

--------------------------------------------*/
void l1warm_slam_tag(int word, int size)
{
int groups;
  for(groups = 0; groups < size;groups++){
    l1warm_vars.avalPtr[groups] = word & 0xff;
    l1warm_vars.bvalPtr[groups] = 0;
    word  >>= 8;
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void l1warm_slam_dataLong(long long word, int size)
{
    int groups;
  for(groups = 0; groups < size;groups++){
    l1warm_vars.avalPtr[groups] = word & 0xff;
    l1warm_vars.bvalPtr[groups] = 0;
    word          >>= 8;
  }
}
/*--------------------------------------------
slam data into cache.
--------------------------------------------*/
void l1warm_slam_data(char* word, int size)
{
    int groups;
  for(groups = 0; groups < size;groups++){
    l1warm_vars.avalPtr[groups] = word[groups] & 0xff;
    l1warm_vars.bvalPtr[groups] = 0;
  }
}
/*--------------------------------------------
set valid bit.
--------------------------------------------*/
void l1warm_find_location(int idx,int *vld )
{
 s_tfnodeinfo node_info;
  tf_nodeinfo(vld[l1warm_vars.cpu], &node_info);

  int gidx = idx / 32;
  int sidx = idx % 32;
  int word = node_info.node_value.vecval_p[gidx].avalbits;
  word    |= (1 << sidx);
  node_info.node_value.vecval_p[gidx].avalbits = word;
  tf_propagatep(vld[l1warm_vars.cpu]);
}
/*--------------------------------------------
extract 4 bytes from memory buffer.
--------------------------------------------*/
int l1warm_get_word(char*data, int num)
{
  int i,word = 0;
  for(i = num; i < (num+4);i++){
    word <<= 8;
    word |= data[i] & 0xff;
  }
  return word;
}
/*--------------------------------------------
create icache data to be slammed into icd.
1). generate predecoder bit.
2). parity bit.
--------------------------------------------*/
long long l1warm_make_icache_data(int word)
{
  long long lparity, lword = word & 0xffffffff;
  lword <<= 1;  
  if(l1warm_predecoder(word))lword  |= 1;
  if(l1warm_even_parityLong(lword, 33)){
    lparity   = 1;
    lparity <<= 33;
    lword    |=  lparity;
  }
  return lword;
}
/*--------------------------------------------
slam data inti icd.
--------------------------------------------*/
void l1warm_slam_l1idata(KeyType addr, char* data, int num)
{ 
  int word;
  int addr_idx = addr & 0xff0;
  addr_idx    |=  l1warm_vars.way;
  //word 0;
  //l1warm_vars.avalPtr = l1warm_vars.icache_data[l1warm_vars.cpu] + addr_idx * l1warm_vars.icache_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.icache_num;
  word    = l1warm_get_word(data, num);
  l1warm_slam_dataLong(l1warm_make_icache_data(word), l1warm_vars.icache_num);
  //word 1;
  //l1warm_vars.avalPtr = l1warm_vars.icache_data[l1warm_vars.cpu] + (addr_idx + 4) * l1warm_vars.icache_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.icache_num;
  word    = l1warm_get_word(data, 4+num);
  l1warm_slam_dataLong(l1warm_make_icache_data(word), l1warm_vars.icache_num);
 //word 0;
  //l1warm_vars.avalPtr = l1warm_vars.icache_data[l1warm_vars.cpu] + (addr_idx + 8) * l1warm_vars.icache_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.icache_num;
  word    = l1warm_get_word(data, 8+num);
  l1warm_slam_dataLong(l1warm_make_icache_data(word), l1warm_vars.icache_num);
  //word 1;
  //l1warm_vars.avalPtr = l1warm_vars.icache_data[l1warm_vars.cpu] + (addr_idx + 12) * l1warm_vars.icache_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.icache_num;
  word    = l1warm_get_word(data, 12+num);
  l1warm_slam_dataLong(l1warm_make_icache_data(word), l1warm_vars.icache_num);
}
/*--------------------------------------------
 assign wr_index0 = {index_f[11:4], 2'b00, wrway_f};
 assign wr_index1 = {index_f[11:4], 2'b01, wrway_f};
 assign wr_index2 = {index_f[11:4], 2'b10, wrway_f};
 assign wr_index3 = {index_f[11:4], 2'b11, wrway_f};
//tag 
{4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}
--------------------------------------------*/
void l1warm_slam_icache(KeyType addr, char* data, int num)
{
 int       addr_idx;
 long long lword;
 //slam data
 l1warm_slam_l1idata(addr, data, num);
 l1warm_slam_l1idata(addr+16, data, num+16);
 
 //slam tag
 l1warm_vars.itag       = (addr >> 12) & 0xfffffff;//28 bits addr[39:12]
 addr_idx   = (addr >> 5)  & 0x7f;
 addr_idx <<= 2;
 addr_idx  |= l1warm_vars.way;
 
 //l1warm_vars.avalPtr    = l1warm_vars.icache_tag[l1warm_vars.cpu] + addr_idx * l1warm_vars.itag_num * 2;
 l1warm_vars.bvalPtr    = l1warm_vars.avalPtr + l1warm_vars.itag_num;
 l1warm_vars.itag      |= (l1warm_even_parity(l1warm_vars.itag, 28) << 28);
 lword      = l1warm_vars.itag;
 //io_printf("addr %llx TAG tag = %x addr_idx %x way=%d \n", addr, itag, addr_idx, way);
 l1warm_slam_dataLong(lword, l1warm_vars.itag_num);
 //valid bit
 l1warm_find_location(addr_idx, l1warm_vars.icache_vld);
}

/*--------------------------------------------
slam data inti icm.
index for dcm_array:dcache_rwaddr_e[10:4]
16 byte128 bits

// way0 and way1 are interleaved physically across 2 subbanks
//        [288,277,..................,145,144] -- xdec -- [143,142,.............,1,0]
//          H   L   H   L       H   L   H   L  -- xdec --  L   H   L   H      L H L H      
// way1 = [288,287,284,283,...,151,150,147,146 -- xdec -- 141,140,137,136,...,5,4,1,0
// way0 = [286,285,282,281,...,149,148,145,144 -- xdec -- 143,142,139,138,...,7,6,3,2
--------------------------------------------*/
void l1warm_slam_l1ddata(KeyType addr, char* data, int num)
{  
  char l1size[18];
  int i, parity, idx, word;
  int  addr_idx = ((addr >> 4) & 0x7f);
  //  l1warm_vars.way = 
  l1warm_vars.avalPtr = l1warm_vars.dcache_w[l1warm_vars.cpu][l1warm_vars.way] + addr_idx * l1warm_vars.dcache_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.dcache_num;
  parity  = 0;
  idx     = 17;
  //create parity bits
  for(i = 0 ; i < 16;i++){
    word        = data[num+i];
    l1size[idx] = data[num+i];
    parity     |= (l1warm_even_parity(word, 8) << (15-i));
    idx--;
  }
  l1size[1] = (parity >> 8) & 0xff;
  l1size[0] = parity & 0xff;
  l1warm_slam_data(l1size, l1warm_vars.dcache_num);
}
/*--------------------------------------------
tag: lmq_ld_addr[39:11];
76 75 74 73 72 71 70 69 68 67 66 65 64
12 11 10  9  8  7  6  5  4  3  2  1  0
--------------------------------------------*/
void l1warm_slam_dcache(KeyType addr, char* data, int num)
{
  int addr_idx;
  long long lword;

  //slam l1 dcache
  l1warm_slam_l1ddata(addr, data, num);
  //tag
  l1warm_vars.dtag  = (addr >> 11) & 0x1fffffff;
  addr_idx   = ((addr >> 4) & 0x7f);
  addr_idx <<= 2;
  addr_idx  |= l1warm_vars.way;
 
  //  l1warm_vars.avalPtr    = l1warm_vars.dcache_tag[l1warm_vars.cpu] + addr_idx * l1warm_vars.dtag_num * 2;
  l1warm_vars.bvalPtr    = l1warm_vars.avalPtr + l1warm_vars.dtag_num;
  l1warm_vars.dtag      |= (l1warm_even_parity(l1warm_vars.dtag, 29) << 29);
  lword      = l1warm_vars.dtag;
  l1warm_slam_dataLong(lword, l1warm_vars.dtag_num);
  //valid
  l1warm_find_location(addr_idx, l1warm_vars.dcache_vld);
  //io_printf(" addr %llx DTAG tag = %x addr_idx %x way=%d\n", addr, dtag, addr_idx, way);
}
/*------------------------------------------
mask out address and get index, tag and bank
based on the bank type.
--------------------------------------------*/
void l1warm_get_Mode(KeyType* addr)
{
  int idx;
  bool found;
 //generate the variables, index, bank, tag of l2 cache.
  if(l1warm_vars.l2bank_type == 4){
    l1warm_vars.bank     = (int)((*addr >> 6)  & 0x7);//l2bank 
    l1warm_vars.tag      = (int)((*addr >> 9)  & 0x1ff);
  }
  else if(l1warm_vars.l2bank_type == 2){
    l1warm_vars.bank     = (int)((*addr >> 6)  & 0x3);//l2bank 
    l1warm_vars.tag      = (int)((*addr >> 8)  & 0x1ff);

    if(l1warm_vars.bank >= 2){//looking for high bit
      found = 0;
      for(idx = 0;idx < 4;idx++){
	if(l1warm_vars.l2mask & (1 << idx)){
	  if(!found){
	    found = 1;
	    continue;
	  }
	  l1warm_vars.bank = idx * 2 + l1warm_vars.bank % 2 ? 1 : 0;
	  break;
	}
      }
    }
    else{//looking for low bit
      for(idx = 0;idx < 4;idx++){
	if(l1warm_vars.l2mask & (1 << idx)){
	  l1warm_vars.bank = idx * 2 + l1warm_vars.bank % 2 ? 1 : 0;
	  break;
	}
      }
    }
  }
  else if(l1warm_vars.l2bank_type == 1){
    l1warm_vars.bank     = (int)((*addr >> 6)  & 0x1);//l2bank 
    l1warm_vars.tag      = (int)((*addr >> 7)  & 0x1ff);

    for(idx = 0;idx < 4;idx++){
      if(l1warm_vars.l2mask & (1 << idx)){
	l1warm_vars.bank = idx * 2 + l1warm_vars.bank;
	break;
      }
    }
  }
  l1warm_vars.tag = (l1warm_vars.tag << 4 ) | l1warm_vars.l2way;//9 bits 512
}
/*--------------------------------------------
slam tag into d$ directory.
  .din0(lkup_addr_c3[17:9]), // original idx , all banks enabled
  .din1(lkup_addr_c3[16:8]), // 1 bit shifted idx in case of 4 banks enabled
  .din2(lkup_addr_c3[15:7]), // 2 bit shifted idx in case of 2 banks enabled

addr_array[rw_addr] <=  wr_data[12:0] ; // BS and SR 11/18/03 Reverse Directory change
addr_bit4[rw_addr]  <=  wr_data[13] ; // BS and SR 11/18/03 Reverse Directory change
parity[rw_addr]     <=  wr_data[14] ; // BS and SR 11/18/03 Reverse Directory change
valid[rw_addr]      <=  wr_data[15] ; // BS and SR 11/18/03 Reverse Directory change
The Four panels correspond to addr<10:9> decoded.
input	[15:0]	wr_data; // { parity, valid, addr<4>,addr<17:9>, L2 way[3:0]} 
assign dir_wr_par_c4 = ^(lkup_wr_data_c4[13:0]) ^ address_bit4;

row:[5:4]
col[10:9]
index{cpu[2:0]. way[1:0]}
index addr[4], cpu_id, way[1:0]

assign	dirrep_dc_lkup_panel_dec_c4[0] = ( lkup_row_addr_dcd_c4[1:0] == 2'd0 ); 
assign	dirrep_dc_lkup_panel_dec_c4[1] = ( lkup_row_addr_dcd_c4[1:0] == 2'd1 ); 
assign	dirrep_dc_lkup_panel_dec_c4[2] = ( lkup_row_addr_dcd_c4[1:0] == 2'd2 ); 
assign	dirrep_dc_lkup_panel_dec_c4[3] = ( lkup_row_addr_dcd_c4[1:0] == 2'd3 ); 
 
assign dir_wr_par_c4 = ^(lkup_wr_data_c4[13:0]) ^ address_bit4;

--------------------------------------------*/
void l1warm_slam_ddirectory(KeyType addr_tmp){  
  int       index, addr4, addr5, entry;
  long long temp_val;
 
  l1warm_get_Mode(&addr_tmp);
  addr4 = addr_tmp & 0x10 ? 1 : 0;
  addr5 = addr_tmp & 0x20 ? 1 : 0; 
  //create parity bit based on index and way.
  int parity = l1warm_even_parity(l1warm_vars.tag, 13) ^ addr4;

  //make entry index. which 63-0 5bits
  entry  = addr4  << 5;
  entry  = l1warm_vars.way;
  entry |= (l1warm_vars.cpu << 3);

  //column
  l1warm_vars.col     = (addr_tmp >> 9)  & 0x3;//deceide 4 panel
  index               = l1warm_vars.bank * BANK_NUM + addr5 * ROW_NUM + l1warm_vars.col;

  l1warm_vars.avalPtr = l1warm_vars.dir_darray[index] + entry * l1warm_vars.ddir_num * 2;
  l1warm_vars.bvalPtr = l1warm_vars.avalPtr + l1warm_vars.ddir_num;

  l1warm_slam_tag(l1warm_vars.tag, l1warm_vars.ddir_num);

  temp_val            = parity ? ( 1 << entry) : 0;
  l1warm_vars.dir_dparity[index] |= temp_val;
  temp_val            = (1 << entry);
  l1warm_vars.dir_dvalid[index]  |= temp_val;

  temp_val  = (addr4 <<  entry);
  l1warm_vars.dir_daddr4[index]  |= temp_val;
  // io_printf("DIER addr=%llx entry = %d row = %d col = %d bank = %d index = %d %llx %llx tag %x\n",
  //	    addr_tmp, entry, row, col, bank, index, dir_dparity[index], dir_dvalid[index], dtag);
}
/*--------------------------------------------
slam l2 directory of l1 icache.
l2 bank 7:6
entry<cpu_id[2:0],way[1:0], addr[8]>
row<addr[5], addr[11]>
--------------------------------------------*/
void l1warm_slam_idirectory(KeyType addr_tmp)
{
  int index, entry, addr4, addr5;
  long long temp_val;
 
  l1warm_get_Mode(&addr_tmp);
  l1warm_vars.iround ^= 1;
  addr4 = l1warm_vars.iround;
  addr5 = addr_tmp & 0x20  ? 1 : 0;
  //make entry index.
  int parity = l1warm_even_parity(l1warm_vars.tag, 13) ^ addr4;

  //make entry index.
  entry  = addr4 << 5;
  entry |= l1warm_vars.way;
  entry |= (l1warm_vars.cpu << 3);
  l1warm_vars.col    = (addr_tmp >> 9)  & 0x3;//deceide 4 panel
  //get the pointer of valid and parity.
  index  = l1warm_vars.bank * MAX_BANK + addr5 * ROW_NUM + l1warm_vars.col;
  l1warm_vars.avalPtr    = l1warm_vars.dir_iarray[index]  + l1warm_vars.entry * l1warm_vars.idir_num * 2;
  l1warm_vars.bvalPtr    = l1warm_vars.avalPtr + l1warm_vars.idir_num;
  l1warm_slam_tag(l1warm_vars.tag, l1warm_vars.idir_num);

  temp_val  = (parity << entry);
  l1warm_vars.dir_iparity[index] |= temp_val;
  temp_val  = (1 << entry);
  l1warm_vars.dir_ivalid[index]  |= temp_val;

  temp_val  = (addr4 <<  entry);
  l1warm_vars.dir_iaddr4[index]  |= temp_val;
}
/*--------------------------------------------
slam icache and dcache
data format to dcm:
[32:0] { addr<39:10>, addr<8>, parity, valid}
reg   [29:0]  addr_array[63:0]
dcache:
l1dcache: 16 bytes.

<10 9 8 7 6  5 4>
  ^      ^    ^
  |      |    |
 col    bank  row

index <cpu_id, way, 8> -> 64 entries
icache:
l1icache: 32 bytes
--------------------------------------------*/
void l1warm_slam_ionly(KeyType addr, char* data)
{
  int num, i, j;
  KeyType addr_tmp;
  num   = l1warm_howmany_cpu();

  for(j = 0; j < num;j++){
    l1warm_core(j);//which core
    l1warm_which_way(addr);//which way
    addr_tmp = addr;
    if(l1warm_vars.l1_debug){
      io_printf("Info: l1icache  slam address %llx\n", addr);
      io_printf("data-->");
      for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
      io_printf("\n");
    }
    for(i = 0; i < 2; i++){
      l1warm_slam_icache(addr_tmp, data, i * 32);
      l1warm_slam_idirectory(addr_tmp);
      addr_tmp += 32;
    }
  }
}
/*--------------------------------------------
check range.
--------------------------------------------*/
int l1warm_islam(KeyType addr, char* data)
{
  if(addr >= l1warm_vars.low_ibound && 
     addr <   l1warm_vars.up_ibound){
    l1warm_slam_ionly(addr, data);
    return 1;
  }
  return 0;
}
/*--------------------------------------------
slam dcahe.
--------------------------------------------*/
void l1warm_slam_donly(KeyType addr, char* data)
{
  int num, i, j;
  KeyType addr_tmp;
  num   = l1warm_howmany_cpu();
  for(j = 0; j < num;j++){
    l1warm_core(j);//which core
    l1warm_which_way(addr);//which way
    addr_tmp = addr;
    if(l1warm_vars.l1_debug){
      io_printf("Info: l1dcache  slam address %llx\n", addr);
      io_printf("data-->");
      for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
      io_printf("\n");
    }
    for(i = 0; i < 4;i++){
      l1warm_slam_dcache(addr_tmp, data, i * 16);
      l1warm_slam_ddirectory(addr_tmp);
      addr_tmp += 16;
    }
  }
}
/*--------------------------------------------
check range.
--------------------------------------------*/
int l1warm_dslam(KeyType addr, char* data)
{

  if(addr >= l1warm_vars.low_dbound && 
     addr <  l1warm_vars.up_dbound){
    l1warm_slam_donly(addr, data);
    return 1;
  }
  return 0;
}
/*--------------------------------------------
slam l1 caches
--------------------------------------------*/
int l1warm_slam(KeyType addr, char* data, int l2way)
{
  int i,j, num;
  KeyType addr_tmp;
  //common thing
  addr &= 0xffffffffc0;//always 64 bytes aligment.
  l1warm_vars.tag   = (addr >> 10) & 0x3fffffff;//30 bits
  
  //  if(l1warm_vars.check_irange && l1warm_islam(addr, data))return 1;
  //if(l1warm_vars.check_drange && l1warm_dslam(addr, data))return 1;
  l1warm_vars.l2way = l2way;

  //if(l1warm_vars.check_irange == 0  &&  l1warm_vars.check_drange == 0){
    num   = l1warm_howmany_cpu();
    for(j = 0; j < num;j++){
      l1warm_core(j);//which core
      // l1warm_which_way(addr);//which way
      addr_tmp = addr;
      switch(l1warm_which_cache()){//which cache
      case 1 ://dcache
	//first 16 bytes
	if(l1warm_vars.l1_debug){
	  io_printf("Info: l1dcache  slam address %llx\n", addr);
	  io_printf("data-->");
	  for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
	  io_printf("\n");
	}
	for(i = 0; i < 4;i++){
	  //	  l1warm_slam_dcache(addr_tmp, data, i * 16);
	  l1warm_slam_ddirectory(addr_tmp);
	  addr_tmp += 16;
	}
	break;
      case 2 ://do icache operation.
	//first 16 bytes
	if(l1warm_vars.l1_debug){
	  io_printf("Info: l1icache  slam address %llx\n", addr);
	  io_printf("data-->");
	  for(i = 0; i < 64; i++)io_printf("%02x", data[i] &0xff);
	  io_printf("\n");
	}
	for(i = 0; i < 2; i++){
	  //l1warm_slam_icache(addr_tmp, data, i * 32);
	  l1warm_slam_idirectory(addr_tmp);
	  addr_tmp += 32;
	}
	break;
      }
    }
    //}
  return 0;
}
