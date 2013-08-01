/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: l2warm.c
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
#include "l2warm.h"
/*--------------------------------------------
initialize scoreboard to hold the info of
slam, it will be used to select the slam line.
--------------------------------------------*/
void l2warm_set_init()
{
  int i,j,idx;
  char*  pargs, cbuf[17];

  //mark blackboard.
  for( i = 0; i < L2WAY; i++){
    for( j = 0; j < 16; j++){
      l2warm_vars.blackboard[0][i][j] = 0;
      l2warm_vars.blackboard[1][i][j] = 0;
      l2warm_vars.blackboard[2][i][j] = 0;
      l2warm_vars.blackboard[3][i][j] = 0;
      l2warm_vars.blackboard[4][i][j] = 0;
      l2warm_vars.blackboard[5][i][j] = 0;
      l2warm_vars.blackboard[6][i][j] = 0;
      l2warm_vars.blackboard[7][i][j] = 0;
    }
  }
  //n2 initialize
  for(idx = 0;idx < MAX_BANK;idx++)l2warm_vars.round_robin[idx] = 0;
  //get bank mode default 8 bank

  l2warm_vars.l2mask = 0xf;
  l2warm_vars.bank_type = 4;   
  pargs = mc_scan_plusargs ("bank_set_mask=");
  if(pargs != (char *) 0){
    l2warm_vars.l2mask    = atoi(pargs);
    if(*pargs == 'a')l2warm_vars.l2mask = 10;
    else if(*pargs == 'b')l2warm_vars.l2mask = 11;
    else if(*pargs == 'c')l2warm_vars.l2mask = 12;

    l2warm_vars.bank_type = 0;   
    for(idx = 0; idx < 4;idx++){
      if( l2warm_vars.l2mask & (1 << idx))l2warm_vars.bank_type++;
    } 
  } 
  int t_mask = l2warm_vars.l2mask;
  int type   = 0;

  for( i = 0; i < 4;i++){
    if(t_mask & (1 << i))type += 2; 
  }

  if(type == 0)type = 8;
  io_printf("Info: L2 bank MASK(%x) %d bank mode selected\n", l2warm_vars.l2mask, type);
 
  //default 8 bank
  l2warm_vars.l1mask    = 0xf;
  l2warm_vars.core_type = 4;  
  pargs = mc_scan_plusargs ("core_set_mask=");

  if(pargs != (char *) 0){
    l2warm_vars.l1mask =  atoi(pargs);
    if(*pargs == 'a')l2warm_vars.l1mask = 10;
    else if(*pargs == 'b')l2warm_vars.l1mask = 11;
    else if(*pargs == 'c')l2warm_vars.l1mask = 12;
    l2warm_vars.core_type = 0;
    for(idx = 0; idx < 4;idx++){
      if( l2warm_vars.l1mask & (1 << idx))l2warm_vars.core_type++;
    }
  }
  t_mask = l2warm_vars.l1mask;
  type = 0;
  for( i = 0; i < 4;i++){
    if(t_mask & (1 << i))type += 2; 
  }
  if(type == 0)type = 8;
  io_printf("Info: L1 bank MASK(%x) %d bank mode selected\n", l2warm_vars.l1mask, type);

  //get options
  pargs = mc_scan_plusargs ("l2valid=");
  if(pargs != (char *) 0)l2warm_vars.turn_on_valid = 1;

  pargs = mc_scan_plusargs ("l2dirty=");
  if(pargs != (char *) 0)l2warm_vars.turn_on_dirty = 1;

  pargs = mc_scan_plusargs ("l2dirty_off=");
  if(pargs != (char *) 0)l2warm_vars.turn_off_dirty= 1;

  pargs = mc_scan_plusargs ("err_enjection_on");
  if(pargs != (char *) 0)l2warm_vars.err_enjection = 1;

  //replace
  pargs = mc_scan_plusargs ("l2warm_round_robin=");
  if(pargs != (char *) 0)l2warm_vars.replace = 1;

  //warm all the cache line.
  pargs = mc_scan_plusargs ("warm_all=");
  if(pargs != (char *) 0)l2warm_vars.warm_all = 1;

  pargs = mc_scan_plusargs ("uncorrectable_err=");
  if(pargs != (char *) 0)l2warm_vars.uncorrect_err = atoi(pargs);

  if(l2warm_vars.uncorrect_err)l2warm_vars.err_enjection = 1;
  pargs = mc_scan_plusargs ("l2range=");
  l2warm_vars.check_range = 0;

  if(pargs != (char *) 0){
    l2warm_vars.check_range = 1;
    idx = l2warm_copy(pargs, cbuf, 0);
    l2warm_vars.up_bound  = l2warm_getEight(cbuf);
    l2warm_copy(pargs, cbuf, idx);
    l2warm_vars.low_bound = l2warm_getEight(cbuf);
    io_printf("Info:L2warm range %llx:%llx\n", l2warm_vars.up_bound, l2warm_vars.low_bound);
  }
  //run time error
  pargs = mc_scan_plusargs ("l2run_error=");
  if(pargs != (char *) 0)l2warm_vars.l2run_error = 1;
  pargs = mc_scan_plusargs ("l2run_percent=");
  if(pargs != (char *) 0){
    l2warm_vars.l2run_percent = atoi(pargs);
    io_printf("Info: L2 runtime percent %d\n", l2warm_vars.l2run_percent);
  }
  pargs = mc_scan_plusargs ("l2run_range=");
  
  if(pargs != (char *) 0){
    l2warm_vars.rcheck_range = 1;
    idx = l2warm_copy(pargs, cbuf, 0);
    l2warm_vars.rup_bound  = l2warm_getEight(cbuf);
    l2warm_copy(pargs, cbuf, idx);
    l2warm_vars.rlow_bound = l2warm_getEight(cbuf);
    io_printf("Info:L2run_error range %llx:%llx\n", l2warm_vars.rup_bound, l2warm_vars.rlow_bound);
  }
  //data way laoytout
  l2warm_vars.wayLayout[0] = 0;
  l2warm_vars.wayLayout[1] = 4;
  l2warm_vars.wayLayout[2] = 1;
  l2warm_vars.wayLayout[3] = 5;

  l2warm_vars.wayLayout[4] = 8;
  l2warm_vars.wayLayout[5] = 12;

  l2warm_vars.wayLayout[6] = 9;
  l2warm_vars.wayLayout[7] = 13;

  l2warm_vars.wayLayout[8]  = 2;
  l2warm_vars.wayLayout[9]  = 6;

  l2warm_vars.wayLayout[10] = 3;
  l2warm_vars.wayLayout[11] = 7;

  l2warm_vars.wayLayout[12] = 10;
  l2warm_vars.wayLayout[13] = 14;

  l2warm_vars.wayLayout[14] = 11;
  l2warm_vars.wayLayout[15] = 15;
  //array
  //ssign way3[3:0]  = {wrway[15:14],wrway[11:10]};
  //assign way2[3:0] = {wrway[7:6],wrway[3:2]};
  //assign way1[3:0] = {wrway[13:12],wrway[9:8]};
  //assign way0[3:0] = {wrway[5:4],wrway[1:0]};

  //assign  way_a0[1:0]  	= {way[2], way[0]};
  //assign  way_a1[1:0]  	= {way[3], way[1]};

  l2warm_vars.tagWay[0] = 0;l2warm_vars.tagPos[0] = 0;
  l2warm_vars.tagWay[4] = 0;l2warm_vars.tagPos[4] = 1;

  l2warm_vars.tagWay[1] = 2;l2warm_vars.tagPos[1] = 0;
  l2warm_vars.tagWay[5] = 2;l2warm_vars.tagPos[5] = 1;

  l2warm_vars.tagWay[8]  = 4;l2warm_vars.tagPos[8] = 0;
  l2warm_vars.tagWay[12] = 4;l2warm_vars.tagPos[12]= 1;

  l2warm_vars.tagWay[9]  = 6;l2warm_vars.tagPos[9]  = 0;
  l2warm_vars.tagWay[13] = 6;l2warm_vars.tagPos[13] = 1;

  l2warm_vars.tagWay[2] = 8;l2warm_vars.tagPos[2] = 0;
  l2warm_vars.tagWay[6] = 8;l2warm_vars.tagPos[6] = 1;

  l2warm_vars.tagWay[3] = 10;l2warm_vars.tagPos[3] = 0;
  l2warm_vars.tagWay[7] = 10;l2warm_vars.tagPos[7] = 1;

  l2warm_vars.tagWay[10] = 12;l2warm_vars.tagPos[10] = 0;
  l2warm_vars.tagWay[14] = 12;l2warm_vars.tagPos[14] = 1;

  l2warm_vars.tagWay[11] = 14;l2warm_vars.tagPos[11] = 0;
  l2warm_vars.tagWay[15] = 14;l2warm_vars.tagPos[15] = 1;
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l2warm_setRdancy(int value){
  l2warm_vars.redundancy = value;
  io_printf("Info: Which mod of Tag(%x)\n", value);
}
/*--------------------------------------------
constructor.
bind caller's argments to pointer table.
--------------------------------------------*/
void l2warm_set()
{
  s_tfnodeinfo node_info;
  int idx, bank;
  int loc  = 1;//argment should be 1.
  l2warm_vars.tag_num  = 0;
  l2warm_vars.vuad_num = 0;
  l2warm_vars.data_num = 0;
  l2warm_set_init();

  for(bank = 0; bank < MAX_BANK; bank++){
    for(idx = bank * TAG; idx < (bank + 1) * TAG; idx++){//get tag
      tf_nodeinfo(loc, &node_info);
      if(l2warm_vars.tag_num == 0)l2warm_vars.tag_num = node_info.node_ngroups;
      l2warm_vars.tag_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }
    for(idx = (bank * VUAD); idx < (bank + 1) * VUAD; idx++){//get vuad
      tf_nodeinfo(loc, &node_info);
      if(l2warm_vars.vuad_num == 0)l2warm_vars.vuad_num = node_info.node_ngroups;
      l2warm_vars.vuad_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }

    for(idx = (bank * DDATA); idx < (bank + 1) * DDATA; idx++){//get data
      tf_nodeinfo(loc, &node_info);
      if(l2warm_vars.data_num == 0)l2warm_vars.data_num = node_info.node_ngroups;
      l2warm_vars.data_avalPtr[idx] = node_info.node_value.memoryval_p;
      loc++;
    }
  }
}

/*-------------------------------------------------------------------------------
  convert ascii to hex array.
--------------------------------------------------------------------------------*/
int l2warm_copy(char* buf, char* cbuf, int idx)
{
  int ind = 0;
  while((buf[idx] != '\0') && 
	(buf[idx] != ':')  &&
	(buf[idx] != ' '))cbuf[ind++] = buf[idx++];
  cbuf[ind] = '\0';
  return ++idx;
}
/*-------------------------------------------------------------------------------
   check the address symbol that is "@".
   if symbol there, return address.
--------------------------------------------------------------------------------*/
long long  l2warm_getEight(char *buf)
{
  int  i;
  long long  key = 0;

  for(i = 0;  buf[i] != '\0';i++){
    key <<= 4;
    key  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
  }
  return key;
}
/*--------------------------------------------
clear vuad array.
not valid, not dirty, not used and not alloc.
--------------------------------------------*/
void l2warm_l2_clear_vuad(int bank)
{
  char *avalPtr, *bvalPtr;
  int vuad, size, idx, groups;
  //for(int bank = 0; bank < BANK; bank++){
  for(vuad = 0; vuad < VUAD;vuad++){
    idx = bank * VUAD + vuad;
    for(size = 0; size < 32;size++){
      avalPtr  = l2warm_vars.vuad_avalPtr[idx] + size * l2warm_vars.vuad_num * 2;
      bvalPtr  = avalPtr + l2warm_vars.vuad_num;
      for(groups = 0; groups < l2warm_vars.vuad_num;groups++){
	avalPtr[groups] = 0;
	bvalPtr[groups] = 0;
      }
    }
  }
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l2warm_even_parity(int data, int num)
{
  int i, parity;
  parity= 0;
  for(i = 0; i < num;i++){
    parity ^= (data & 1);
    data  >>= 1;
  }
  return parity;
}
/*--------------------------------------------
compute even parity.
--------------------------------------------*/
int l2warm_range(int max)
{
  int num = random() & 0xff;
  return num % max;
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
void l2warm_error_enject_three(char* bits, int low, int high, int parity)
{
  int num;

  if(l2warm_vars.err_enjection){
    num = l2warm_range(high - low);
    if(num == parity)num = 0;
    bits[low+num] ^= 1;//flip bit
  }
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
void l2warm_error_enject_two(int* bits, int low, int high)
{
  int num;

  if(l2warm_vars.err_enjection){
    num    = l2warm_range(high - low);
    *bits ^= (1 << num);//flip bit
  }
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
int l2warm_error_enject_one(int bits)
{
  int num    = l2warm_range(28);
  bits      ^= (1 << num);//flip bit
  return bits;
}
/*--------------------------------------------
enject error.
--------------------------------------------*/
long long  l2warm_error_enject_long(long long bits)
{
  int num    = l2warm_range(38);
  bits      ^= (1 << num);//flip bit
  return bits;
}
/*--------------------------------------------
check parity
--------------------------------------------*/
int l2warm_check_parity_two(long long bits, int num)
{
  int i, p;
  p = 0;
  for(i = 0; i < num; i++){
    p     ^= bits & 1;
    bits >>= 1;
  }
  return p;
}
/*--------------------------------------------
check parity
--------------------------------------------*/
int l2warm_check_parity()
{
  char ch;
  int j, i;
  int p = 0;
  for(j = 0; j < 19;j++){
    ch = l2warm_vars.slam_data[j];
    for(i = 0; i < 8; i++){
      p     ^= ch & 1;
      ch >>= 1;
    }
  }
  ch = l2warm_vars.slam_data[19];
  for(i = 0; i < 4; i++){
      p   ^= ch& 1;
      ch >>= 1;
  }
  return p;
}
/*--------------------------------------------
// This task generates the 7b ECC for a 32b data segment.
// The input is a 32b data segment.
// The output is {1b_parity, 6b_ecc}.
--------------------------------------------*/
int l2warm_decc(int data){
  char d[32], dcc[7];
  int i;
  int ecc;
  for(i = 0; i < 32;i++){//unpack
    d[i]   = data & 1;
    data >>= 1;
  }
  // parity bit
  dcc[6] = d[0]  ^ d[1]  ^ d[2]  ^ d[4]  ^ d[5]  ^ d[7]  ^ d[10] ^
           d[11] ^ d[12] ^ d[14] ^ d[17] ^ d[18] ^ d[21] ^ d[23] ^ 
           d[24] ^ d[26] ^ d[27] ^ d[29];
  // ecc bits
  dcc[5] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26];
  dcc[4] = d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^
           d[19] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^
           d[13] ^ d[12] ^ d[11];

  dcc[3] = d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^
           d[19] ^ d[18] ^ d[10] ^ d[9]  ^ d[8]  ^ d[7]  ^
           d[6]  ^ d[5]  ^ d[4];

  dcc[2] = d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^
           d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[10] ^ d[9]  ^ d[8]  ^ 
           d[7]  ^ d[3]  ^ d[2]  ^ d[1];

  dcc[1] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]  ^ d[6]  ^ d[9]  ^ d[10] ^
           d[12] ^ d[13] ^ d[16] ^ d[17] ^ d[20] ^ d[21] ^ d[24] ^ 
           d[25] ^ d[27] ^ d[28] ^ d[31];

  dcc[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]  ^ d[6]  ^ d[8]  ^ d[10] ^
           d[11] ^ d[13] ^ d[15] ^ d[17] ^ d[19] ^ d[21] ^ d[23] ^ 
           d[25] ^ d[26] ^ d[28] ^ d[30];

  //pack binarty to hexa.
  ecc = 0;
  for(i = 6; i >= 0; i--){
    ecc <<= 1;
    ecc  |= dcc[i];
  }
  return ecc;
}

/*--------------------------------------------
// This function generates the 6b ECC for a 22b tag.

// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
int l2warm_tecc(int tag){
  char t[22], tcc[6];
  int  i;
  int ecc;
  //unpack
  for(i = 0; i < 22;i++){
    t[i]  = tag & 1;
    tag >>= 1;
  }
  // parity bit
  tcc[0] = t[0]  ^ t[1]  ^ t[2]  ^ t[4]  ^ t[5]  ^ t[7]  ^ t[10] ^
           t[11] ^ t[12] ^ t[14] ^ t[17] ^ t[18] ^ t[21];
  // ecc bits
  tcc[1] = t[0]  ^ t[1]  ^ t[3]  ^ t[4]  ^ t[6]  ^ t[8]  ^ t[10] ^
           t[11] ^ t[13] ^ t[15] ^ t[17] ^ t[19] ^ t[21];

  tcc[2] = t[0]  ^ t[2]  ^ t[3]  ^ t[5]  ^ t[6]  ^ t[9]  ^ t[10] ^
           t[12] ^ t[13] ^ t[16] ^ t[17] ^ t[20] ^ t[21];

  tcc[3] = t[17] ^ t[16] ^ t[15] ^ t[14] ^ t[10] ^ t[9] ^ t[8] ^
           t[7]  ^ t[3]  ^ t[2]  ^ t[1];

  tcc[4] = t[21] ^ t[20] ^ t[19] ^ t[18] ^ t[10] ^ t[9] ^ t[8] ^
           t[7]  ^ t[6]  ^ t[5]  ^ t[4];

  tcc[5] = t[21] ^ t[20] ^ t[19] ^ t[18] ^ t[17] ^ t[16] ^ t[15] ^
           t[14] ^ t[13] ^ t[12] ^ t[11];
  
  ecc = 0;
  for(i = 5; i >= 0; i--){
    ecc <<= 1;
    ecc  |= tcc[i];
  }
  return ecc;
}

/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
void l2warm_slam_value(int num)
{
  int groups;
  for(groups = 0; groups < num;groups++){
    l2warm_vars.avalPtr[groups] = l2warm_vars.slam_data[groups];
    l2warm_vars.bvalPtr[groups] = 0;
  }
}
/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
int l2warm_used(int vuad)
{
  vuad &= 0xfff;
  //do here
  vuad |= (l2warm_even_parity(vuad, 12) << 12);
  return vuad;
}
/*--------------------------------------------
initilally, alloc bit reseted.
--------------------------------------------*/
int l2warm_alloc(int vuad)
{
 vuad &= 0xfff;
 //do here
 vuad |= (l2warm_even_parity(vuad, 12) << 12);
 return vuad;
}
/*--------------------------------------------
turn on the valid bit used the way index.
--------------------------------------------*/
int l2warm_valid(int vuad)
{
  //set valid

  vuad |= (l2warm_vars.valid_bit << l2warm_vars.way);
  vuad &= 0xffff;
  return vuad;
}
/*--------------------------------------------
initilally, alloc bit reseted.
--------------------------------------------*/
int l2warm_dirty(int vuad)
{
 
 vuad |= (l2warm_vars.dirty_bit << l2warm_vars.way);
 vuad &= 0xffff;
 return vuad;
}
/*--------------------------------------------
unpack char array into binary format.
data layout:
RTL:bit [107:0]
C++:word[0].....word[13]
--------------------------------------------*/
void l2warm_unpack()
{
  char ch;
  int i, j, idx;
 
  idx = 0;
  for(i = 0; i < l2warm_vars.vuad_num - 1;i++){
    ch = l2warm_vars.slam_data[i];
    for(j = 0; j < 8;j++){
      l2warm_vars.vuad_unpk[idx++] = ch & 1;
      ch  >>= 1;
    }
  }
  //process the last 4 bits.
  ch = l2warm_vars.slam_data[i];
  for(j = 0; j < 4;j++){
    l2warm_vars.vuad_unpk[idx++] = ch & 1;
    ch  >>= 1;
  }
}
/*--------------------------------------------
pack binary format to char foramy.
--------------------------------------------*/
void l2warm_pack()
{
  char ch;
  int i, j, idx;
 
  idx = 0;
  for(i = 0; i < l2warm_vars.vuad_num;i++){
    ch = 0;
    for(j = 0; j < 8;j++)ch |= (l2warm_vars.vuad_unpk[idx++] << j);
    l2warm_vars.slam_data[i] = ch;
  }
}
/*--------------------------------------------
N1:{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}
N1:layout of vuad
 .din0 ({vd_ecc_wr_data_c4[6:0], valid_c4[15:0], dirty_c4[15:0]}),

--------------------------------------------*/
void l2warm_extract_vuad(int vuad_idx)
{
  int i;

  l2warm_vars.low_vuad = 0;
  for(i  = 60; i >= 0;i -= 4){//get alloc and dirty.
    l2warm_vars.low_vuad <<= 1;
    l2warm_vars.low_vuad  |= l2warm_vars.vuad_unpk[i + vuad_idx];
  }
 
  l2warm_vars.up_vuad = 0;
  for(i  = 124; i >= 64;i -= 4){//get used and valid
    l2warm_vars.up_vuad <<= 1;
    l2warm_vars.up_vuad  |= l2warm_vars.vuad_unpk[i + vuad_idx];
  }
}
/*--------------------------------------------
{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}
--------------------------------------------*/
void l2warm_integrate_vuad(int vuad_idx, int ecc)
{
  int i;

  for(i  = 0; i < 64;i += 4){//get alloc and dirty.
    l2warm_vars.vuad_unpk[i + vuad_idx] = l2warm_vars.low_vuad & 1;
    l2warm_vars.low_vuad              >>= 1;
  } 
  for(i  = 64; i < 128;i += 4){//get used and valid
   l2warm_vars.vuad_unpk[i + vuad_idx] = l2warm_vars.up_vuad & 1;
   l2warm_vars.up_vuad >>= 1;
  }

  for(i  = 128; i < 156;i += 4){
    l2warm_vars.vuad_unpk[i + vuad_idx] = ecc & 1;
    ecc >>= 1;
  } 
}
/*--------------------------------------------
initilally, used bit reseted.
--------------------------------------------*/
void l2warm_updated_ua(int idx, int vuadarray, int vuad)
{
  int groups, ecc; 
  //get the pointer of ua
  l2warm_vars.avalPtr = l2warm_vars.vuad_avalPtr[idx]  + vuadarray * l2warm_vars.vuad_num * 2;
  l2warm_vars.bvalPtr = l2warm_vars.avalPtr + l2warm_vars.vuad_num;
  //read vuad data.
  //used and alloc data field

  for(groups = 0; groups < l2warm_vars.vuad_num;groups++)l2warm_vars.slam_data[groups] = l2warm_vars.avalPtr[groups];
  l2warm_unpack();
  l2warm_extract_vuad(vuad);
  //modify fields.
  l2warm_vars.up_vuad  = l2warm_used(l2warm_vars.up_vuad);
  l2warm_vars.low_vuad = l2warm_alloc(l2warm_vars.low_vuad);
  ecc = l2warm_decc((l2warm_vars.up_vuad << 16) | l2warm_vars.low_vuad); 
  l2warm_integrate_vuad(vuad, ecc);
  l2warm_pack();
  l2warm_slam_value(l2warm_vars.vuad_num);
}
/*--------------------------------------------
set valid/dirty bit randomly.
vuadarray is index of 32 array.
vuad contain index of word.
--------------------------------------------*/
void l2warm_updated_vd(int idx, int vuadarray, int vuad)
{
  int groups, ecc; 

  //valid and dirty data field
  l2warm_vars.avalPtr = l2warm_vars.vuad_avalPtr[idx+4] + vuadarray * l2warm_vars.vuad_num * 2;
  l2warm_vars.bvalPtr = l2warm_vars.avalPtr + l2warm_vars.vuad_num;
  //get 160 bits.
  //ascending order.
 
  for(groups = 0; groups < l2warm_vars.vuad_num;groups++)l2warm_vars.slam_data[groups] = l2warm_vars.avalPtr[groups];
  l2warm_unpack();//unpack hexa to binary
  l2warm_extract_vuad(vuad);

  //modify fields.
  l2warm_vars.up_vuad  = l2warm_valid(l2warm_vars.up_vuad);
  l2warm_vars.low_vuad = l2warm_dirty(l2warm_vars.low_vuad);

  ecc = l2warm_decc((l2warm_vars.up_vuad << 16) | l2warm_vars.low_vuad); 
  l2warm_integrate_vuad(vuad, ecc);

  l2warm_pack();
  l2warm_slam_value(l2warm_vars.vuad_num);
}
/*--------------------------------------------
layout:
{cache_data_out_c5[31:0],   cache_ecc_out_c5[6:0]}     = cache_decc_out_c5[38:0];[38:7]
{cache_data_out_c5[63:32],  cache_ecc_out_c5[13:7]}    = cache_decc_out_c5[77:39];[77:46]
{cache_data_out_c5[95:64],  cache_ecc_out_c5[20:14]}   = cache_decc_out_c5[116:78];[116:85]
{cache_data_out_c5[127:96], cache_ecc_out_c5[27:21]}   = cache_decc_out_c5[155:117];[155:124]

{cache_data_out_c5[159:128], cache_ecc_out_c5[34:28]}  = cache_decc_out_c5[194:156];[194:163]
{cache_data_out_c5[191:160], cache_ecc_out_c5[41:35]}  = cache_decc_out_c5[233:195];[233:202]
{cache_data_out_c5[223:192], cache_ecc_out_c5[48:42]}  = cache_decc_out_c5[272:234];[272:241]
{cache_data_out_c5[255:224], cache_ecc_out_c5[55:49]}  = cache_decc_out_c5[311:273];[311:280]

{cache_data_out_c5[287:256], cache_ecc_out_c5[62:56]}  = cache_decc_out_c5[350:312];[350:329]
{cache_data_out_c5[319:288], cache_ecc_out_c5[69:63]}  = cache_decc_out_c5[389:351];[389:358]
{cache_data_out_c5[351:320], cache_ecc_out_c5[76:70]}  = cache_decc_out_c5[428:390];[428:397]
{cache_data_out_c5[383:352], cache_ecc_out_c5[83:77]}  = cache_decc_out_c5[467:429];[467:436]

{cache_data_out_c5[415:384], cache_ecc_out_c5[90:84]}   = cache_decc_out_c5[506:468];[506:475]
{cache_data_out_c5[447:416], cache_ecc_out_c5[97:91]}   = cache_decc_out_c5[545:507];[545:514]
{cache_data_out_c5[479:448], cache_ecc_out_c5[104:98]}  = cache_decc_out_c5[584:546];[584:553]
{cache_data_out_c5[511:480], cache_ecc_out_c5[111:105]} = cache_decc_out_c5[623:585];[623:592]

data:unpack ascending order.
--------------------------------------------*/
void l2warm_adjust_data(int which_shift)
{
  char ch, unpk[156], temp[128];
  int i, j;

  //unpack 
  int idx = 0;
  for(i = 15; i >= 0; i--){
    ch = l2warm_vars.l1line[i];
    for(j = 0; j < 8;j++){
      temp[idx++] = ch & 1;
      ch        >>= 1;
    }
  }
  //insert ecc into data array.
  ch  = l2warm_vars.ecc[0];//first four bytes
  idx = 124;
  for(i = 96;i < 128;i++)unpk[idx++] = temp[i];
  for(i = 117; i < 124;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }

  //the second four bytes
  ch  = l2warm_vars.ecc[1];
  idx = 85;
  for(i = 64;i  < 96;i++)unpk[idx++] = temp[i];
  for(i = 78; i < 85;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }

  //the third four bytes
  ch  = l2warm_vars.ecc[2];
  idx = 46;
  for(i = 32;i < 64;i++)unpk[idx++] = temp[i];
  for(i = 39; i < 46;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }

  //last 4 bytes
  ch  = l2warm_vars.ecc[3];
  idx = 7;
  for(i = 0;i < 32;i++)unpk[idx++] = temp[i];
  for(i = 0;i < 7;i++){
    unpk[i] = ch & 1;
    ch    >>= 1;
  }  
  
  //pack binaray data to hexa
  //we need to adjust this routine.
  for(i = 0;i < 8;i++){
    for(j = 0; j < 3;j++)l2warm_vars.parts[i][j] = 0;
  }

  idx = 0;
  for(i = 0;i < 19;i++){
    ch = 0;
    for(j = 0;j < 8;j++)ch |= unpk[idx++] << j;
  }
  l2warm_vars.idx = 0;
  if(which_shift > 1){
    l2warm_parts(7, 4, unpk); //19
    l2warm_parts(6, 3, unpk); //20
    l2warm_parts(5, 4, unpk); //19
    l2warm_parts(4, 3, unpk);//20
    
    l2warm_parts(3, 4, unpk); 
    l2warm_parts(2, 3, unpk);
    l2warm_parts(1, 4, unpk); 
    l2warm_parts(0, 3, unpk);
  }
  else{
    l2warm_parts(7, 3, unpk); //20
    l2warm_parts(6, 4, unpk); //19
    l2warm_parts(5, 3, unpk); //20
    l2warm_parts(4, 4, unpk);//19
    
    l2warm_parts(3, 3, unpk); 
    l2warm_parts(2, 4, unpk);
    l2warm_parts(1, 3, unpk); 
    l2warm_parts(0, 4, unpk);
  }
}
/*--------------------------------------------
slam data into data array.
index          :address[17:8]
--------------------------------------------*/
void l2warm_parts(int row, int etc, char* unpk)
{
  int i, j;
  //parts[0]
  for(i = 0; i < 2;i++){
    for(j = 0; j < 8; j++){
      l2warm_vars.parts[row][i] |= unpk[l2warm_vars.idx++] << j;
    }
  }

  for(j = 0; j < etc; j++){
    l2warm_vars.parts[row][i] |= unpk[l2warm_vars.idx++] << j; 
  }
} 

/*--------------------------------------------
slam data
--------------------------------------------*/

void l2warm_slam_data(int row)
{
  int groups;

  l2warm_vars.bvalPtr = l2warm_vars.avalPtr + l2warm_vars.data_num;
  for(groups = 0; groups < 3;groups++){
    l2warm_vars.avalPtr[groups] = l2warm_vars.parts[row][groups];
    l2warm_vars.bvalPtr[groups] = 0;

  }
}
/*--------------------------------------------
slam data into data array.
index          :address[17:8]
sub bank select:address<5:4>->the same as l1 cache size
way            :12
sub-bank includes:
block_5 : way_sel[1:0]
block_4 : way_sel[3:2]
........
block_4 : way_sel[11:10]
l1line layout:

[58:39]           [19:0]
[136:117]         [97:78]
[155:137]         [116:98]
[77:59]           [38:20]
-------------------------------------------*/
void l2warm_slam_real_data(char* data, int subbank)
{
  int l1bank, fbyte[4], i, sub, l2index, l2high, ind, pointer;
  int idx  = l2warm_vars.bank * DDATA;//place the pointer on the target bank.
  int didx = 0;//start from the first byte

  l2index = l2warm_vars.l2_index & 0xff;
  l2high  = l2warm_vars.l2_index & 0x100 ? 0 : 4;

  for(l1bank = 3; l1bank >= 0;l1bank--){//process data by l1 cache size
    //get 16 bytes
    for(i = 0;i < 16; i++){
      l2warm_vars.l1line[i] = data[didx++];
      fbyte[i / 4] <<= 8;
      fbyte[i / 4]  |= l2warm_vars.l1line[i] & 0xff;      
    }
    for(i = 0; i < 4;i++)l2warm_vars.ecc[i] = l2warm_decc(fbyte[i]);
    l2warm_adjust_data(subbank);
    sub = subbank == 0 || subbank == 2 ? 0 : 1;//deceide top or bottom based on addr[5:4]

    //parts[0]
    ind     = idx + sub * QUAD * 2 + l2warm_vars.way * 8 + l2high ;
    pointer = l2index * l2warm_vars.data_num * 2;

    if(subbank== 0 || subbank == 1){
      //left
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 128+1] + pointer ;//0lo
      l2warm_slam_data(0);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 3] + pointer;//1hi
      l2warm_slam_data(1);
      //right 
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 128 +1] + pointer;//0lo
      l2warm_slam_data(2);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 3] + pointer;//1hi
      l2warm_slam_data(3);
      //left
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 128] + pointer;//0hi
      l2warm_slam_data(4);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 2] + pointer;//1lo
      l2warm_slam_data(5);
      //right
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 128] + pointer;//0lo
      l2warm_slam_data(6);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 2]+ pointer;//1hi
      l2warm_slam_data(7);
    } 
    else if(subbank == 2 ||subbank == 3 ){
      //left
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 128 + 3]+ pointer;//0lo
      l2warm_slam_data(0);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 1]+ pointer;//1hi
      l2warm_slam_data(1);

      //right numb= 3
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 128 + 3]+ pointer;//0lo
      l2warm_slam_data(2);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 1]+ pointer;//1hi
      l2warm_slam_data(3);

      //left num=2
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 128 + 2]+ pointer;//0hi
      l2warm_slam_data(4);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind]+ pointer;//1lo
      l2warm_slam_data(5);

      //right
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256 + 128+2]+ pointer;//0lo
      l2warm_slam_data(6);
      l2warm_vars.avalPtr = l2warm_vars.data_avalPtr[ind + 256]+ pointer;//1hi
      l2warm_slam_data(7);
    }
    subbank++;
    if(subbank == 4)subbank = 0;
  }
  
}
/*--------------------------------------------
slam vuad into vuad array.
vuad memory:[107:0] vuad [31:0]

ua->51:26                            valid           dirty   
  <51-39>         <38-26>           <25-13>          <12-0>
{parity, 11-0} {parity, 11-0}   {parity, 11- 0} {parity, 11- 0}
array0:                          array8:
array1:                          array9:
array2:                          array10:
array3:                          array11:
array4:                          array12:
array5:                          array13:
array6:                          array14:
array7:                          array15:

layout of vuad:
index[9:8]  ->be used as an index of vuad.
index[14:10]->be used as an index of vuad array.
index[17:15]->be used as an index of subarray.
{parity, used} ->{51, 50:39} {parity, alloc}->{38, 37:26}
{parity, valid}->{25, 24:13} {parity, dirty}->{12, 11:0}

//N2
array0:                          array8:
array1:                          array9:
array2:                          array10:
array3:                          array11:
reg [159:0]  inq_ary [31:0];

<135-119>   <118-102>  <101-85>  <84-68>  <67-51>  <50-34>  <33-17>  <16-0>
l6 index 9 bits
inq_ary 8-7
index 6-2
vuad  1-0
98 sub array 
10 word
--------------------------------------------*/
void l2warm_slam_vuad()
{
  //generate the subsript for vuad access based on index.
  int subarray  = (l2warm_vars.l2_index >> 7) & 0x3;//4 inq_arry
  int vuadarray = (l2warm_vars.l2_index >> 2) & 0x1f;//32 array
  int vuad      = l2warm_vars.l2_index & 0x3;//4 words
  int idx       = l2warm_vars.bank * VUAD + subarray;
  l2warm_vars.valid_bit = 1;
  l2warm_vars.dirty_bit = 0;
  l2warm_updated_vd(idx, vuadarray, vuad);
}
/*--------------------------------------------
implemented:
// 29 27 25 |23 21 19 17|15 13 11 9|7 5 3 1
--------------------------------------------*/
void l2warm_fillerOdd(char* aval, char*bval, int cval, int num)
{
  int i, j;
  char val;
  for(j = 0; j < 3;j++){
    val = 0;
    for(i = 0; i < 4;i++){
      val   |= ((cval & 1)  << (2*i+ 1));
      cval >>= 1;
    }
    aval[j] &=  0x55;//0101_0101
    aval[j] |= val;
    bval[j] &=  0x55;//0101_0101
  }

  val = 0;
  for(i = 0; i < num;i++){
    val   |= ((cval & 1)  << (2*i+ 1));
    cval >>= 1;
  }
  aval[3] &= 0x55;//0101_0101
  aval[3] |= val;
  bval[3] &= 0x55;//0101_0101
}
/*--------------------------------------------
30 28 26 24 |22 20 18 16 |14 12 10 8 |6 4 2
--------------------------------------------*/
void l2warm_fillerEven(char* aval, char*bval, int cval, int add)
{
  int i, j;
  char val;
  
  val = 0;
  for(i = 0; i < 3;i++){
    val   |= ((cval & 1)  << (2*i+ 2 + add));
    cval >>= 1;
  }
  aval[0] &= 0xaa;//1010 1010
  aval[0] |= val;
  bval[0] &= 0xaa;//1010 1010

  for(j = 1; j < 4;j++){
    val = 0;
    for(i = 0; i < 4;i++){
      val   |= ((cval & 1)  << (2*i));
      cval >>= 1;
    }
    aval[j] &= 0xaa;//0101_0101
    aval[j] |= val;
    bval[j] &= 0xaa;//0101_0101
  }
}

/*--------------------------------------------
2 | 4 6 8 10 | 12 14 16 18 | 20 22 24 26
--------------------------------------------*/
void l2warm_filler13(char* aval, char* bval, int cval, int num)
{
  int i, j,  idx;
  char val;
  for(j = 0; j < 3;j++){
    val = 0;
    for(i = 0; i < 4;i++){
      idx = 2 * i;
      val   |= (cval & 1) ? 1 << idx : 0 ;
      cval >>= 1;
    }
    aval[j] &= 0xaa;//0101_0101
    aval[j] |= val;
    bval[j] &= 0xaa;//0101_0101
  }
  val = 0;
  for(i = 0; i < num;i++){
    idx  = 2 * i;
    val |= (cval & 1) ? 1 << idx : 0;
    cval >>= 1;
  }
  aval[3] &= 0xaa;//0101_0101
  aval[3] |= val;
  bval[3] &= 0xaa;//0101_0101
}
/*--------------------------------------------
0 2 | 4 6 8 10 | 12 14 16 18 | 20 22 24 
--------------------------------------------*/
void l2warm_filler13o(char* aval, char* bval, int cval)
{
  int i, j, idx;
  char val;
  val = 0;
  for(i = 0; i < 3;i++){
    val   |= ((cval & 1)  << (2*i+ 2));
    cval >>= 1;
  }
  aval[0] &= 0xaa;//0101 0101
  aval[0] |= val;
  bval[0] &= 0xaa;//0101 0101
  for(j = 1; j < 3;j++){
    val = 0;
    for(i = 0; i < 4;i++){
      idx = 2 * i;
      val   |= (cval & 1) ? 1 << idx : 0 ;
      cval >>= 1;
    }
    aval[j] &= 0xaa;//0101_0101
    aval[j] |= val;
    bval[j] &= 0xaa;//0101_0101
  }
  val = 0;
  for(i = 0; i < 2;i++){
    idx  = 2 * i;
    val |= (cval & 1) ? 1 << idx : 0;
    cval >>= 1;
  }
  aval[3] &= 0xaa;//0101_0101
  aval[3] |= val;
  bval[3] &= 0xaa;//0101_0101
}
/*--------------------------------------------
slam tag into tag array.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm_slam_tag()
{

  char *avalPtr, *bvalPtr;
  char  aval[4],  bval[4];
  int way, up_half, low_half ;
  int groups, tag_data, idx, even; 
  
  //new layout of l2tag
  tag_data = l2warm_vars.tag << 6 | l2warm_tecc(l2warm_vars.tag);
  low_half = tag_data & 0x1fff;
  up_half  = (tag_data >> 13) & 0x7fff;

  //  way = l2warm_varsl2warm_vars.way % 2 ?  l2warm_vars.way - 1 : l2warm_vars.way;//need even number
  way  = l2warm_vars.tagWay[l2warm_vars.way];
  even = l2warm_vars.tagPos[l2warm_vars.way];
  idx  = l2warm_vars.bank * TAG + way;
  //io_printf("TAG = %x low = %x up = %x\n", tag_data, low_half, up_half);
  //upper 15 bits
  avalPtr = l2warm_vars.tag_avalPtr[idx] + l2warm_vars.l2_index * l2warm_vars.tag_num * 2;
  bvalPtr = avalPtr + l2warm_vars.tag_num;
  //read data

  //io_printf("read up = "); 
  for(groups = 0; groups < l2warm_vars.tag_num;groups++){
    aval[groups] = avalPtr[groups];
    bval[groups] = bvalPtr[groups];
    //io_printf("%02x",avalPtr[groups] & 0xff); 
  }
  
  if(l2warm_vars.redundancy)
    even ? l2warm_fillerEven(aval, bval, up_half, 0): l2warm_fillerOdd(aval, bval, up_half, 3);
  else 
    //even ? l2warm_fillerOdd(aval, bval, up_half, 3) : l2warm_fillerEven(aval, bval, up_half, -2);
    even ? l2warm_fillerOdd(aval, bval, up_half, 3) :l2warm_filler13(aval, bval, up_half, 3);

  //io_printf(" write up = "); 
  //write data
  for(groups = 0; groups < l2warm_vars.tag_num;groups++){
    avalPtr[groups] = aval[groups];
    bvalPtr[groups] = bval[groups];
    //io_printf("%02x",avalPtr[groups] & 0xff); 
  }

  //13 bits
  avalPtr = l2warm_vars.tag_avalPtr[idx+1] + l2warm_vars.l2_index * l2warm_vars.tag_num * 2;
  bvalPtr = avalPtr + l2warm_vars.tag_num;
  //io_printf("read low = "); 

  for(groups = 0; groups < l2warm_vars.tag_num;groups++){
    aval[groups] = avalPtr[groups];
    bval[groups] = bvalPtr[groups];
    //io_printf("%02x",avalPtr[groups] & 0xff); 
  }

  if(l2warm_vars.redundancy)
    even ? l2warm_filler13(aval, bval, low_half,1)    : l2warm_fillerOdd(aval, bval, low_half, 1);
  else //no redundancy
    even ? l2warm_fillerOdd(aval, bval, low_half, 1) : l2warm_filler13o(aval, bval, low_half);

  //io_printf(" write low = "); 

  for(groups = 0; groups < l2warm_vars.tag_num;groups++){
    avalPtr[groups] = aval[groups];
    bvalPtr[groups] = bval[groups];
    //io_printf("%02x",avalPtr[groups] & 0xff); 
  }
  //io_printf("\n"); 
}
/*------------------------------------------
mask out address and get index, tag and bank
based on the bank type.
--------------------------------------------*/
void l2warm_get_Mode(KeyType* addr)
{
  int idx, bank;
  bool found;
 //generate the variables, index, bank, tag of l2 cache.
  if(l2warm_vars.bank_type == 4){
    *addr               &= 0xffffffffc0; 
    l2warm_vars.bank     = (int)((*addr >> 6)  & 0x7);//l2bank 
    l2warm_vars.l2_index = (int)((*addr >> 9)  & 0x1ff);//9 bits 512
    l2warm_vars.tag      = (int)((*addr >> 18) & 0x3fffff);//22 bit   
    l2warm_vars.selected = (l2warm_vars.l2_index & 0x3) | (((l2warm_vars.l2_index >> 7) & 0x3) << 2);
  }
  else if(l2warm_vars.bank_type == 2){
    *addr               &= 0x7fffffffc0; 
    bank                 = (int)((*addr >> 6)  & 0x3);//l2bank 
    l2warm_vars.l2_index = (int)((*addr >> 8)  & 0x1ff);//9 bits 512
    l2warm_vars.tag      = (int)((*addr >> 17) & 0x3fffff);//22 bit
    l2warm_vars.selected = (l2warm_vars.l2_index & 0x3) | (((l2warm_vars.l2_index >> 7) & 0x3) << 2);
    //    io_printf("Info:address(%llx) bank(%x) ", *addr, l2warm_vars.bank);
    if(bank >= 2){//looking for high bit
      found = 0;
      for(idx = 0;idx < 4;idx++){
	if(l2warm_vars.l2mask & (1 << idx)){
	  if(!found)found = 1;
	  else{

	    l2warm_vars.bank  = idx * 2;
	    l2warm_vars.bank += bank % 2;
	    //	    io_printf("inside %d", idx);
	    break;
	  }
	}//if
      }//for
    }
    else{//looking for low bit
      for(idx = 0;idx < 4;idx++){
	if(l2warm_vars.l2mask & (1 << idx)){
	  l2warm_vars.bank  = idx * 2;
	  l2warm_vars.bank += bank % 2;
	  break;
	}
      }
    }
    //   io_printf("after(%x)\n", l2warm_vars.bank);
  }
  else if(l2warm_vars.bank_type == 1){
    *addr               &= 0x3fffffffc0; 
    bank                 = (int)((*addr >> 6)  & 0x1);//l2bank 
    l2warm_vars.l2_index = (int)((*addr >> 7)  & 0x1ff);//9 bits 512
    l2warm_vars.tag      = (int)((*addr >> 16) & 0x3fffff);//22 bit
    l2warm_vars.selected = (l2warm_vars.l2_index & 0x3) | (((l2warm_vars.l2_index >> 7) & 0x3) << 2);
    for(idx = 0;idx < 4;idx++){
      if(l2warm_vars.l2mask & (1 << idx)){
	l2warm_vars.bank = idx * 2 + bank;
	break;
      }
    }
  }
}
/*------------------------------------------
main routine of l2 warm
slam tag, data, vuad into rtl.
l1bank[5:4]
l2bank[7:6]
index[17:8]
tag[39:18]
`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
reg 	[`L2T_ARR_D_WIDTH + 1:0]    	way0[`L2T_ARR_DEPTH - 1 :0];	//one extra bit for redundancy
reg 	[`L2T_ARR_D_WIDTH - 1:0]    	way1[`L2T_ARR_DEPTH - 1:0];

--------------------------------------------*/
bool l2warm_slam(KeyType addr, char* data)
{  
  int subbank, finite;
  //  if(addr < 0x100)return 0;// 0x40040)return;
  subbank  = (int)((addr >> 4) & 0x3); //l1 bank common for every bank type.
  l2warm_get_Mode(&addr);//generate the variables, index, bank, tag of l2 cache.
 
  if((l2warm_vars.check_range == 0) || 
     (l2warm_vars.check_range && (addr < l2warm_vars.up_bound) && (addr >= l2warm_vars.low_bound))){
    //    subbank  = (int)((addr >> 4) & 0x3); //l1 bank common for every bank type.
    if(l2warm_vars.replace || l2warm_vars.check_range){
      l2warm_vars.way  =l2warm_vars.round_robin[l2warm_vars.bank];
      finite           = 0;
      while(l2warm_vars.blackboard[l2warm_vars.bank][l2warm_vars.way][l2warm_vars.selected]){
	l2warm_vars.round_robin[l2warm_vars.bank]++;
	l2warm_vars.way = l2warm_vars.round_robin[l2warm_vars.bank];
	if(l2warm_vars.way > (L2WAY-1)){
	  l2warm_vars.way  = 0;
	  l2warm_vars.round_robin[l2warm_vars.bank] = 0;
	}
	finite++;
	if(finite > (L2WAY - 1))return 0;//no available way for this address
      }
    }
    else {
      l2warm_vars.way = random() & 0xf; 
      finite = 0;
      while(l2warm_vars.blackboard[l2warm_vars.bank][l2warm_vars.way][l2warm_vars.selected]){
      	finite++;
      	if(finite > 15)return 0;
	l2warm_vars.way = random() & 0xf; 
      }
      //      if(l2warm_vars.way >0 && l2warm_vars.way <4 || l2warm_vars.way >7 && l2warm_vars.way <12)return 0;
    }
    //slam start here
    // io_printf("ADDRESS %llx way = %x bank = %d index = %x\n", addr, l2warm_vars.way, l2warm_vars.bank, l2warm_vars.l2_index);
    l2warm_vars.blackboard[l2warm_vars.bank][l2warm_vars.way][l2warm_vars.selected] = 1;
    l2warm_slam_tag(); //process tag
    l2warm_slam_vuad();//process vuad
    l2warm_slam_real_data(data, subbank);//process data    
    return (l2warm_vars.way << 1 | 1);
  }//if(l2
  return 0;
}
/*------------------------------------------
warm cache line which is not in mem.image
--------------------------------------------*/
void l2warm_warm_all_cache(b_tree_node_ptr* mem)
{
  int i, subbank;
  int warm_tag[4];
  b_tree_atom_ptr  data;//b-tree node.
  KeyType          mask_addr;
  char             rdata[64];
 // variables for warm_all
  KeyType last_addr[4];

  for(i= 0; i < 4;i++){
    while(1){
      last_addr[i] += (KeyType)1 << 18;
      mask_addr = (last_addr[i] >> 6) & 0x3ffffffff;
      data      = b_Find(mem, &mask_addr);
      if(data == 0){
	warm_tag[i] = (int)((last_addr[i] >> 18) & 0x3fffff);
	break;
      }
    }
  }

  l2warm_vars.turn_on_dirty = 1;//on dirty bit.
  for(l2warm_vars.bank = 0; l2warm_vars.bank < 4;l2warm_vars. bank++){
    l2warm_vars.tag = warm_tag[l2warm_vars.bank];
    for(l2warm_vars.way = 0; l2warm_vars.way < L2WAY;l2warm_vars.way++){
      for(l2warm_vars.l2_index = 0; l2warm_vars.l2_index < 1024; l2warm_vars.l2_index++){
	subbank = 0;
	if(l2warm_vars.blackboard[l2warm_vars.bank][l2warm_vars.way][l2warm_vars.l2_index])continue;
	for(i = 0; i < 64;i++)rdata[i] = random() & 0xff;
	l2warm_slam_tag(); //process tag
	l2warm_slam_vuad();//process vuad
	l2warm_slam_real_data(rdata, subbank);//process data
      }
    }
  }
}

/*------------------------------------------
how percent.
 --------------------------------------------*/
int l2warm_percent(int* taken, int* not_taken)
{
  int num, ret;
  if(l2warm_vars.l2run_percent == 0)return 1;
  num = l2warm_range(100);
  ret = 1;
  if(num > l2warm_vars.l2run_percent){//not taken
    if(*not_taken == (100 -  l2warm_vars.l2run_percent)){
      *taken++;
    }
    else{
      ret = 0;
      *not_taken++;
    }
  }
  else{
    if(*taken == l2warm_vars.l2run_percent){
      *not_taken++;
      ret = 0;
    } 
    else{
      *taken++;
    }
  }
  if((*taken + *not_taken) == 100){
    *taken     = 0;
    *not_taken = 0;
  }
  return ret;
}
/*------------------------------------------
dynamically inject error int l2 tag or data.
1). tag wenable, 1 bit
2). tag index    10 bits
3). tag way ->2'b10:way0, 2'b10:way1 2bits
 --------------------------------------------*/
void l2warm_l2_tag_update( int loc)
{
  long long pos;
  int idx, tidx;

  if(l2warm_percent(&l2warm_vars.taken_t, &l2warm_vars.not_taken_t)){
    for(idx = 0; idx < 6;idx++){
      if((l2warm_vars.wren & 1) && (l2warm_vars.way & 3))break;
      l2warm_vars.wren >>= 1;
      l2warm_vars.way  >>= 2;
    }
    l2warm_vars.way &= 3;
    pos  = l2warm_get_long(loc+1);//arg 2 index
    tidx = (pos >> (idx * 10)) & 0x3ff;//get memory index
    l2warm_vars.tag_pend      |= (1 << l2warm_vars.bank);
    l2warm_vars.tag_pidx[l2warm_vars.bank] = tidx;
    l2warm_vars.tag_pos[l2warm_vars.bank]  = (idx << 1) + loc + 3;//arg 4
    if(l2warm_vars.way & 2)l2warm_vars.tag_pos[l2warm_vars.bank]++;
 
    if((l2warm_vars.tag_pend_now & (1 << l2warm_vars.bank))          &&
       (l2warm_vars.tag_pidx[l2warm_vars.bank] == l2warm_vars.tag_pidx_now[l2warm_vars.bank])&&
       (l2warm_vars.tag_pos[l2warm_vars.bank]  == l2warm_vars.tag_pos_now[l2warm_vars.bank] ))l2warm_vars.tag_pend_now ^= (1 << l2warm_vars.bank);
  }
}
/*--------------------------------------------
slam tag into tag array with dynamic error injection.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm_slam_tag_error()
{
  int groups, err;
  int pos;
  int tag_data;
  char *avalPtr, *bvalPtr;

  for(l2warm_vars.bank = 0; l2warm_vars.bank < 4; l2warm_vars.bank++){
    l2warm_vars.l2_index = l2warm_vars.tag_pidx_now[l2warm_vars.bank];
    pos   = l2warm_vars.tag_pos_now[l2warm_vars.bank] - (l2warm_vars.bank * 71 + 4); 
    if(!(l2warm_vars.tag_pend_now & ( 1 << l2warm_vars.bank)) || pos > 11 || pos < 0){
      if(pos > 11 || pos < 0){
	io_printf("(%d):Info PLI Argment error(%d) bank(%d)\n", tf_gettime(), pos, l2warm_vars.bank);
      }
      continue;
    }
    tf_nodeinfo(l2warm_vars.tag_pos_now[l2warm_vars.bank] , &l2warm_vars.node_info);
    avalPtr  = l2warm_vars.node_info.node_value.memoryval_p + l2warm_vars.l2_index * l2warm_vars.tag_num * 2;
    bvalPtr  = avalPtr + l2warm_vars.tag_num;
    tag_data = 0;
    for(groups = l2warm_vars.tag_num - 1; groups >= 0;groups--){
      tag_data <<= 8;
      tag_data  |= avalPtr[groups] & 0xff;
    } 
    tag_data &= 0xfffffff;
    if(l2warm_check_parity_two(tag_data, 28))continue;
    err = l2warm_error_enject_long(tag_data);
    io_printf("Info(%0d): L2_Tag error injection L2_bank(%d) way(%d) index(%d)  original_tag(%x) after_tag(%x)\n",
	      tf_gettime(), l2warm_vars.bank, pos, l2warm_vars.l2_index, tag_data, err);

    for(groups = 0; groups < l2warm_vars.tag_num;groups++){
      avalPtr[groups] = err & 0xff;
      bvalPtr[groups] = 0;
      err           >>= 8;
    }
  }
  l2warm_vars.tag_pend_now = 0;
}
/*------------------------------------------
dynamicaly inject error int l2 tag or data.
4). data subbank0:wenable 2'b01:way0_decc, 2'b10:way1_decc
5). data subbank0:index
 --------------------------------------------*/
void l2warm_l2_data_update(int wren, int loc)
{
  long long pos;
  int idx;
  if(l2warm_percent(&l2warm_vars.taken_d, &l2warm_vars.not_taken_d)){
    pos  = l2warm_get_long(loc+1);
    for(idx = 0; idx < 6;idx++){
      if(wren & 3)break;
      wren >>= 2;
      pos  >>= 10;
    }
    l2warm_vars.data_pend      |= (1 << l2warm_vars.bank);
    l2warm_vars.data_pidx[l2warm_vars.bank] = pos & 0x3ff;
    l2warm_vars.data_pos[l2warm_vars.bank]  = (idx << 1) + loc + 3;//
    if(wren & 2)l2warm_vars.tag_pos[l2warm_vars.bank]++;
    if((l2warm_vars.data_pend_now & (1 << l2warm_vars.bank))            &&
       (l2warm_vars.data_pidx[l2warm_vars.bank] == l2warm_vars.data_pidx_now[l2warm_vars.bank])&&
       (l2warm_vars.data_pos[l2warm_vars.bank]  == l2warm_vars.data_pos_now[l2warm_vars.bank] ))l2warm_vars.data_pend_now ^= (1 << l2warm_vars.bank);
  }
}
/*--------------------------------------------
slam tag into tag array with dynamic error injection.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.

{cache_data_out_c5[31:0],   cache_ecc_out_c5[6:0]}     = cache_decc_out_c5[38:0];
{cache_data_out_c5[63:32],  cache_ecc_out_c5[13:7]}    = cache_decc_out_c5[77:39];
{cache_data_out_c5[95:64],  cache_ecc_out_c5[20:14]}   = cache_decc_out_c5[116:78];
{cache_data_out_c5[127:96], cache_ecc_out_c5[27:21]}   = cache_decc_out_c5[155:117];
groups0[4:0] {38, 37, 36, 35, 34, 33, 32}
groups1[9:5] {77, 76, 75, 74, 73, 72}
groups2[15:10]
groups3[19:16]
--------------------------------------------*/
void l2warm_slam_data_error()
{
  int groups, idx;
  long long temp_val;
  char *avalPtr, *bvalPtr;

  for(l2warm_vars.bank = 0; l2warm_vars.bank < 4; l2warm_vars.bank++){
    if(!(l2warm_vars.data_pend_now & ( 1 << l2warm_vars.bank)))continue;
     tf_nodeinfo(l2warm_vars.data_pos_now[l2warm_vars.bank] , &l2warm_vars.node_info);
     l2warm_vars.l2_index    = l2warm_vars.data_pidx_now[l2warm_vars.bank]; 
     if(1){
       avalPtr  = l2warm_vars.node_info.node_value.memoryval_p + l2warm_vars.l2_index * l2warm_vars.data_num * 2;
       bvalPtr  = avalPtr + l2warm_vars.data_num;
       for(groups = l2warm_vars.tag_num - 1; groups >= 0;groups--)l2warm_vars.slam_data[groups] = avalPtr[groups];
       if(l2warm_check_parity())continue;
       switch(l2warm_range(4)){
       case 0 :
	 temp_val = l2warm_vars.slam_data[4] & 0x7f;
	 for(idx = 3; idx >= 0;idx--){
	   temp_val <<= 8;
	   temp_val  |= l2warm_vars.slam_data[idx] & 0xff;
	 }
	 if(!l2warm_check_parity_two(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), l2warm_vars.bank, l2warm_vars.data_way_now[l2warm_vars.bank], l2warm_vars.data_pidx_now[l2warm_vars.bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val = l2warm_error_enject_long(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   for(idx = 0; idx < 4;idx++){
	     l2warm_vars.slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   l2warm_vars.slam_data[4] &= 0x80;
	   l2warm_vars.slam_data[4] |= temp_val & 0x7f;
	 }
	 break;
       case 1 :
	 temp_val = l2warm_vars.slam_data[9] & 0x3f;
	 for(idx = 8; idx >= 5;idx--){
	   temp_val <<= 8;
	   temp_val  |= l2warm_vars.slam_data[idx] & 0xff;
	 }
	 temp_val <<= 1;
	 temp_val  |= l2warm_vars.slam_data[4] & 0x80 ? 1 : 0;
	 if(!l2warm_check_parity_two(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), l2warm_vars.bank, l2warm_vars.data_way_now[l2warm_vars.bank], l2warm_vars.data_pidx_now[l2warm_vars.bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = l2warm_error_enject_long(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   l2warm_vars.slam_data[4] &= 0x7f;
	   l2warm_vars.slam_data[4] |= temp_val & 1 ? 0x80 : 0;
	   temp_val    >>= 1;
	   for(idx = 5; idx < 10;idx++){
	     l2warm_vars.slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   l2warm_vars.slam_data[9] &= 0xc0;
	   l2warm_vars.slam_data[9] |= temp_val & 0x3f;
	 }
	 break;
       case 2:
	 temp_val = l2warm_vars.slam_data[14] & 0x1f;
	 for(idx = 13; idx >= 10;idx--){
	   temp_val <<= 8;
	   temp_val  |= l2warm_vars.slam_data[idx] & 0xff;
	 }
	 temp_val <<= 2;
	 temp_val  |= (l2warm_vars.slam_data[9] >> 6) & 3;
	 if(!l2warm_check_parity_two(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), l2warm_vars.bank, l2warm_vars.data_way_now[l2warm_vars.bank], l2warm_vars.data_pidx_now[l2warm_vars.bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = l2warm_error_enject_long(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   l2warm_vars.slam_data[9] &= 0x3f;
	   l2warm_vars.slam_data[9] |= ((temp_val & 3) << 6);
	   temp_val >>= 2;
	   for(idx = 10; idx < 14;idx++){
	     l2warm_vars.slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   l2warm_vars.slam_data[14] &= 0xe0;
	   l2warm_vars.slam_data[14] |= temp_val & 0x1f;
	 }
	 break;
       case 3 :
	 temp_val = l2warm_vars.slam_data[19] & 0xf;
	 for(idx = 18; idx >= 15;idx--){
	   temp_val <<= 8;
	   temp_val  |= l2warm_vars.slam_data[idx] & 0xff;
	 }
	 temp_val <<= 3;
	 temp_val |= (l2warm_vars.slam_data[14] >> 5) & 7;
	 if(!l2warm_check_parity_two(temp_val, 39)){
	   io_printf("Info(%0d): L2_Data error injection L2_l2warm_vars.bank(%d) way(%0x) index(%05d)",
		     tf_gettime(), l2warm_vars.bank, l2warm_vars.data_way_now[l2warm_vars.bank], l2warm_vars.data_pidx_now[l2warm_vars.bank]);
	   io_printf(" orginal_data(%016llx) ", temp_val);
	   temp_val   = l2warm_error_enject_long(temp_val);//error inject
	   io_printf(" after_data(%016llx)\n", temp_val);
	   l2warm_vars.slam_data[14] &= 0x1f;
	   l2warm_vars.slam_data[14] |= ((temp_val & 7) << 5);
	   for(idx = 15; idx < 19;idx++){
	     l2warm_vars.slam_data[idx] = temp_val & 0xff;
	     temp_val     >>= 8;
	   }
	   l2warm_vars.slam_data[19] |= temp_val & 0xf;
	 }
	 break;
       }
       //slam
       for(groups = l2warm_vars.tag_num - 1; groups >= 0;groups--){
	 avalPtr[groups] = l2warm_vars.slam_data[groups];
	 bvalPtr[groups] = 0;
       }
     }
  }
  l2warm_vars.data_pend_now = 0;
}
/*------------------------------------------
  inject error.
 --------------------------------------------*/
void l2warm_error_enject_void()
{
  int sub;
  int loc = 1;
  // save the previous write to avoid the confliction between
  // the current and the previous update.

  if(l2warm_vars.tag_pend){
    l2warm_vars.tag_pend_now = l2warm_vars.tag_pend;
    for(sub = 0; sub < 4; sub++){
      l2warm_vars.tag_pidx_now[sub] = l2warm_vars.tag_pidx[sub];
      l2warm_vars.tag_pos_now[sub]  = l2warm_vars.tag_pos[sub]; 
    }
    l2warm_vars.tag_pend = 0;
  }
  if(l2warm_vars.data_pend){
    l2warm_vars.data_pend_now = l2warm_vars.data_pend;
    for(sub = 0; sub < 4; sub++){
      l2warm_vars.data_pidx_now[sub] = l2warm_vars.data_pidx[sub];
      l2warm_vars.data_pos_now[sub]  = l2warm_vars.data_pos[sub];
      l2warm_vars.data_way_now[sub]  = l2warm_vars.data_way[sub];
    }
    l2warm_vars.data_pend = 0;
  }

  //Are there Tag or data updated?
  for(l2warm_vars.bank = 0; l2warm_vars.bank < MAX_BANK; l2warm_vars.bank++){
    l2warm_vars.wren = tf_getp(loc);//arg 1
    l2warm_vars.way  = tf_getp(loc+2);//arg 3 way
    if(l2warm_vars.wren && l2warm_vars.way)l2warm_l2_tag_update(loc);//arg 1
    loc   += 15;//move loc to data. arg 16
    for(sub = 0; sub < 4; sub++){//16
      if(tf_getp(loc))l2warm_l2_data_update(tf_getp(loc), loc);//pass 16
      loc += 14;//30
    }
  }
  if(l2warm_vars.tag_pend_now)l2warm_slam_tag_error();
  if(l2warm_vars.data_pend_now)l2warm_slam_data_error();
}
/*------------------------------------------
invalidate icache
--------------------------------------------*/
void l2warm_clean_reg(int loc)
{
  int groups;

  tf_nodeinfo(loc, &l2warm_vars.node_info);
  for(groups = 0; groups < l2warm_vars.node_info.node_ngroups ; groups++){
      l2warm_vars.node_info.node_value.vecval_p[groups].avalbits = 0;
  }
  tf_propagatep(loc);
}
/*--------------------------------------------
slam tag into tag array.
// The input is a 22b tag.
// The output is {5b_ecc, 1b_parity}.
--------------------------------------------*/
void l2warm_get_tag()
{
  int groups;
  char *avalPtr, *bvalPtr;
  int idx  = l2warm_vars.bank * TAG + l2warm_vars.way;
  avalPtr  = l2warm_vars.tag_avalPtr[idx] + l2warm_vars.l2_index * l2warm_vars.tag_num * 2;
  bvalPtr  = avalPtr + l2warm_vars.tag_num;
  l2warm_vars.tag_data = 0;
  for(groups = l2warm_vars.tag_num - 1; groups >= 0;groups--){
    l2warm_vars.tag_data <<= 8;
    l2warm_vars.tag_data  |= avalPtr[groups] & 0xff;
  }
  l2warm_vars.tag >>= 6;//6bit ecc
  l2warm_vars.tag  &= 0x3ffff;//22 bit
}

/*--------------------------------------------
pack 4 bytes.
--------------------------------------------*/
void l2warm_pack_4bytes(int idx, char* unpk){

  int i, j;

  for(i = 0; i < 4; i++){
    l2warm_vars.staledata[l2warm_vars.stale_idx] = 0;
    for(j = 0; j < 8; j++){
      l2warm_vars.staledata[l2warm_vars.stale_idx] <<= 1;
      l2warm_vars.staledata[l2warm_vars.stale_idx]  |= unpk[idx--];
    }
    l2warm_vars.stale_idx++;
  }
}
/*--------------------------------------------
pack 16 bytes.
--------------------------------------------*/
void l2warm_pack_data(char* unpk)
{
  l2warm_pack_4bytes(155, unpk);
  l2warm_pack_4bytes(116, unpk);
  l2warm_pack_4bytes(77, unpk);
  l2warm_pack_4bytes(38, unpk);
}
/*--------------------------------------------
read data from scdat.
--------------------------------------------*/
void l2warm_get_data()
{
  int l1bank, j, pkidx, groups ;
  char *avalPtr, ch, unpk[156];

  int idx  = l2warm_vars.bank * DDATA;//place the pointer on the target bank.

  l2warm_vars.stale_idx = 0;
  for(l1bank = 3; l1bank >= 0;l1bank--){//process data by l1 cache size
    avalPtr = l2warm_vars.data_avalPtr[idx + l1bank * SUBBANK + l2warm_vars.way] + l2warm_vars.l2_index * l2warm_vars.data_num * 2;
    pkidx   = 0;
    for(groups = 0; groups < l2warm_vars.data_num;groups++){
      ch  = avalPtr[groups];
      for(j = 0; j < 8;j++){
	unpk[pkidx++] = ch & 1;
	ch          >>= 1;
      }
    }
    l2warm_pack_data(unpk);
  }
}
/*-------------------------------------------------------------------------------
 get 64 bits.
--------------------------------------------------------------------------------*/
long long l2warm_get_long(int loc){
  int       low, high;
  long long val;

  low  = tf_getlongp(&high, loc);
  val   = high;
  val <<= 32;
  val  |= low;
  return val;
}

/*------------------------------------------
l2bank[7:6]
index[17:8]
tag[39:18]
--------------------------------------------*/
void l2warm_gen_addr()
{
  l2warm_vars.mask_addr  = 0;
  l2warm_vars.mask_addr |= l2warm_vars.tag   << 18;
  l2warm_vars.mask_addr |= l2warm_vars.l2_index << 8;
  l2warm_vars.mask_addr |= l2warm_vars.bank  << 6;
}
/*------------------------------------------
invalidate cache.
--------------------------------------------*/
void l2warm_l2_invalidate(int bank_t)
{
//generate the subsript for vuad access based on index.
  int subarray, vuadarray, vuad, idx, groups;
  char *avalPtr, *bvalPtr;
  l2warm_vars.bank = bank_t;
  for(l2warm_vars.l2_index = 0; l2warm_vars.l2_index < INDEX; l2warm_vars.l2_index++){
    subarray  = (l2warm_vars.l2_index >> 7) & 0x7;
    vuadarray = (l2warm_vars.l2_index >> 2) & 0x1f;//32 array
    vuad      = l2warm_vars.l2_index & 0x3;//4 words
    idx       = l2warm_vars.bank * VUAD + subarray;
    //valid and dirty data field
    avalPtr = l2warm_vars.vuad_avalPtr[idx+8] + vuadarray * l2warm_vars.vuad_num * 2;
    bvalPtr = avalPtr + l2warm_vars.vuad_num;
    //get 108 bits.
    //ascending order.
    for(groups = 0; groups < l2warm_vars.vuad_num;groups++)l2warm_vars.slam_data[groups] = avalPtr[groups];
    l2warm_unpack();//unpack hexa to binary
    l2warm_extract_vuad(vuad);
    for(l2warm_vars.way = 0; l2warm_vars.way < L2WAY; l2warm_vars.way++){
      if((l2warm_vars.up_vuad & 1) && (l2warm_vars.low_vuad & 1)){
	l2warm_get_tag();
	l2warm_get_data();
	l2warm_gen_addr();	  
	//write_dram_call(&mask_addr, staledata);
	}
      l2warm_vars.up_vuad  >>= 1;
      l2warm_vars.low_vuad >>= 1;
    }
  }

  //after writeback
  l2warm_l2_clear_vuad(l2warm_vars.bank);
}
/*------------------------------------------
enject error during run time.
--------------------------------------------*/
void l2warm_l1_invalidate(int ivld, int dvld, int cpu)
{
  l2warm_clean_reg(dvld);
  l2warm_clean_reg(ivld);
  //mark uninvalid cpu.
  l2warm_vars.cpu_invalid ^= 1 << cpu;
  io_printf("%0d:Info Invalidated L1cache core(%0d)\n",tf_gettime(), cpu);
}
/*------------------------------------------
When l2_bypass is deasserted, slam dram memory.
--------------------------------------------*/
void l2warm_stale_data(int loc)
{
  int i;
  list_node_ptr addr_ptr;

  l2warm_vars.bank     = tf_getp(loc);
  //addr_ptr = addr_list[bank].shift();

  while(addr_ptr){
    l2warm_vars.mask_addr = addr_ptr->addr;
    for(i = 0; i < 64;i++)l2warm_vars.staledata[i] = random() & 0xff;
    //write_dram_call(&mask_addr, staledata);
    //addr_ptr = addr_list[bank].shift();
  }
}
/*------------------------------------------
display l2 warm data.
--------------------------------------------*/
void l2warm_debug()
{
  int idx, sub, groups, col;
  char *avalPtr;
  for(idx = 0; idx < 4;idx++){ 
    io_printf("Info:L2 Tag valid bits for bank(%d)\n", idx);
    for(sub = 8; sub < 16;sub++){
      io_printf("(%d) Sub array", sub);
      io_printf("                                              ");
      io_printf("(%d) Sub Array\n", sub-8);
      for(col = 0; col < 32;col++){
	avalPtr = l2warm_vars.vuad_avalPtr[idx * VUAD + sub] + col * l2warm_vars.vuad_num * 2;
	io_printf("index(%02d) -> valid/dirty bits(", col);
	io_printf("%01x",avalPtr[l2warm_vars.vuad_num - 1] & 0xf);
	for(groups =  l2warm_vars.vuad_num - 2;groups >= 0; groups--)io_printf("%02x", avalPtr[groups] & 0xff);
	io_printf(")");
	io_printf("  index(%02d) -> u/a bits(", col);
	avalPtr = l2warm_vars.vuad_avalPtr[idx * VUAD + sub-8] + col * l2warm_vars.vuad_num * 2;
	io_printf("%01x",avalPtr[l2warm_vars.vuad_num - 1] & 0xf);
	for(groups =  l2warm_vars.vuad_num - 2;groups >= 0; groups--)io_printf("%02x",avalPtr[groups] & 0xff);
	io_printf(")\n");
      }
    }
  }
}

/*---------------------------------------
  replace char with space.
  ----------------------------------------*/
void l2warm_replace(char* str)
{
  int i;
  for(i = 0; i < strlen(str);i++){
    if(
       str[i] == '(' ||
       str[i] == ')' ||
       str[i] == '-' ||
       str[i] == '>' ||
       str[i] == '"' ||
       str[i] == ',')str[i] = ' ';
  }
}
/*---------------------------------------
  replace char with space.
  ----------------------------------------*/
void l2warm_rmhexa(char* buf){
  int i, j;
  
  for(i = 0;i < strlen(buf);i++)if(buf[i] == 'h' || buf[i] == 'x')break;
  j  = 0;
  for(i = i+1;i < strlen(buf);i++){
    buf[j++] = buf[i];
  }
  buf[j] = '\0'; 
}
