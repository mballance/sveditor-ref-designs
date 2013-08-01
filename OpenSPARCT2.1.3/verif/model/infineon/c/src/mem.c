/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mem.c
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
#include "vcsuser.h"
#include "acc_user.h"
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include "utility.h"
#include "print_dimm.h"

#define	 BUFFER		1024
#define	 CHIPKILL	0x10000

#define DUAL_CHANNEL 0x100
#define SNG_CHANNEL  0x200
#define RANK_HIGH    0x400
#define RANK_LOW	0x800
#define STACK_DIMM 0x1000
#define PARTIAL_BANK_2BK 0x20000
#define PARTIAL_BANK_4BK 0x40000

#define HASH_PA 0x100000


//define global variable
static int slam_val;
static int dimm_config;
static avl_conf_ptr dram_tree;
static unsigned int ck_mcu0;
static unsigned int ck_mcu1;
static unsigned int ck_mcu2;
static unsigned int ck_mcu3;
static int shift;

//function prototypes
avl_node_ptr search_node(avl_node_ptr *t_ptr, long long *addr);
long long pm_address_shift(long long addr, int shift);
long long fc_hash_pa(long long addr, int dimm_config);
long long decode_cs(long long *addr, int dimm_config, int shift);
long long address_decode(long long *addr, int dimm_config, int shift);
int pm_bank_s(long long addr, int shift);
int check_if_valid_PA(long long addr, int dimm_config, int shift);

/*-------------------------------------------------------------------
  create ecc data. {{{
---------------------------------------------------------------------*/
void hamming(char *word,
	     char *ecc){

  int count, multc, tmpicount,  multresult, mult_count, tmpcount,
      divresult, divc, upper_test, parity1, parity2, parity3, parity4;
  int primitive;
  char hword[32];
  primitive = 0x13;//0b010011;
  parity1 = 0;
  parity2 = 0;
  parity3 = 0;
  parity4 = 0;
 
  /*
  primitive = 0x11d;//0b0100011101;
  for (count = 0; count < 16; count++) {
    multresult = 0;
    for (multc = 0; multc < 8; multc++) {
      tmpicount = ((word[count] >> multc) & 1);
      if (tmpicount == 1) {
	multresult = multresult ^ ((count + 1) << multc);
      }
    }
    divresult = multresult;
    for (divc = 0; divc < 8; divc++) {
      upper_test = divresult & 0xff00;//0b1111_1111_1111_0000_0000;
      if (upper_test != 0) {
	tmpicount = ((divresult >> (15 - divc)) & 1);
	if (tmpicount == 1) {
	  divresult = divresult ^ (primitive << (7 - divc));
	}
      }
    }
    parity0 = parity0 ^ divresult;
  }
  for (count = 0; count < 16; count++) {
    parity1 = parity1 ^ (word[count] & 0xff);    
  }
  ecc[1] = (parity0 >> 4 ) & 0xf;
  ecc[0] = (parity0)       & 0xf;
  ecc[3] = (parity1 >> 4 ) & 0xf;
  ecc[2] = (parity1)       & 0xf;
  */


  for (count = 0; count < 16; count++) {
    hword[31 - count*2-1]   = word[count] & 0xf;  
    hword[31 - count*2]     = (word[count] >> 4) & 0xf;  
  }
  for (count = 0; count != 32; count++) {
    if (count != 30) {
      multresult = 0;
      if (count > 14) { 
	if (count == 31) {
	  mult_count = 0;
	} else {
	  mult_count = count - 15;
        }
      } else {
	mult_count = count;
      }
      for (multc = 0; multc != 4; multc++) {
        tmpicount = ((hword[count] >> multc) & 1);
        if (tmpicount == 1) {
          multresult = multresult ^ ((mult_count + 1) << multc);
        }
      }
      divresult = multresult;
      for (divc = 0; divc != 4; divc++) {
        upper_test = divresult & 0xffff0; //0b1111_1111_1111_1111_0000;
        if (upper_test != 0) {
          tmpcount = ((divresult >> (7 - divc)) & 1);
          if (tmpcount == 1) {
            divresult = divresult ^ (primitive << (3 - divc));
          }
        }
      }
      parity1 = parity1 ^ divresult;
    } // if
  }
  for (count = 0; count != 15; count++) {
    parity2 = parity2 ^ hword[count];	
  }
  parity2 = parity2 ^ hword[30] ^ hword[31];
  for (count = 15; count != 32; count++) {
    parity3 = parity3 ^ hword[count];   
  }
  for (count = 0; count != 31; count++) {
      multresult = 0;
        if (count == 0 || count == 15 || count == 30 ) { mult_count = 0; }
        if (count == 1 || count == 16) { mult_count = 8; }
        if (count == 2 || count == 17) { mult_count = 13; }
        if (count == 3 || count == 18) { mult_count = 12; }
        if (count == 4 || count == 19) { mult_count = 10; }
        if (count == 5 || count == 20) { mult_count = 6; }
        if (count == 6 || count == 21) { mult_count = 5; }
        if (count == 7 || count == 22) { mult_count = 14; }
        if (count == 8 || count == 23) { mult_count = 1; }
        if (count == 9 || count == 24) { mult_count = 11; }
        if (count == 10 || count == 25) { mult_count = 4; }
        if (count == 11 || count == 26) { mult_count = 9; }
        if (count == 12 || count == 27) { mult_count = 3; }
        if (count == 13 || count == 28) { mult_count = 2; }
        if (count == 14 || count == 29) { mult_count = 7; }

      for (multc = 0; multc != 4; multc++) {
        tmpicount = ((hword[count] >> multc) & 1);
        if (tmpicount == 1) {
          multresult = multresult ^ ((mult_count + 1) << multc);
        }
      }
      divresult = multresult;
      for (divc = 0; divc != 4; divc++) {
        upper_test = divresult & 0xffff0; //0b11111111111111110000;
        if (upper_test != 0) {
          tmpcount = ((divresult >> (7 - divc)) & 1);
          if (tmpcount == 1) {
            divresult = divresult ^ (primitive << (3 - divc));
          }
        }
      }
      parity4 = parity4 ^ divresult;
  }
  ecc[1] = (parity1) & 0xf;
  ecc[0] = (parity2) & 0xf;
  ecc[3] = (parity3) & 0xf;
  ecc[2] = (parity4) & 0xf;
}
// }}}

/*-------------------------------------------------------------------
 syndrome regenerated from hamming syndrome by XORing address parity. {{{
----------------------------------------------------------------------*/
void addr_parity(char* data, long long addr, char* ecc, int start_bit, int shift)
{
  int i; 
  long long local_addr = 0;
  char parity, addr_parity;
  addr_parity = 0;

  //Partial mode shifting - James
  addr = pm_address_shift(addr, shift);

  if(start_bit == 0)
    addr = fc_hash_pa(addr, dimm_config);

//io_printf((char *)"(PLI)  pre_xor ecc = (%02x %02x %02x %02x)\n", data[0], data[1], data[2], data[3]);
//io_printf((char *)"(PLI)addr_parity: addr = %llx, start_bit = %d\n", addr, start_bit);
 if (start_bit == 0)
 {
     local_addr = local_addr | (addr & 0xfffffffe00);
     local_addr = (local_addr >> 9);
     // restore bit 6
     local_addr = (local_addr << 1) | ((addr & 0x40) >> 6);
     //io_printf((char *)"(PLI)addr_parity: local_addr = %llx\n", local_addr);
     for(i = 0; i < 32; i++){
         addr_parity = addr_parity ^ (local_addr & 1);
         local_addr  >>= 1;
     }
 }
 else
 {
      if (mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL) {
         local_addr = local_addr | (addr & 0x7fffffff8);
         local_addr = (local_addr >> 3);
     }
     else {
         local_addr = local_addr | (addr & 0x7fffffffc);
         local_addr = (local_addr >> 2);
     }
     //io_printf((char *)"(PLI)addr_parity: local_addr = %llx\n", local_addr);
     for(i = 0; i < 32; i++){
         addr_parity = addr_parity ^ (local_addr & 1);
         local_addr  >>= 1;
     }
 }


  parity = addr_parity;
  for(i = 1; i < 8;i++){
	parity <<=1;
	parity = parity | addr_parity;
  }

//io_printf((char *)"(PLI)addr_parity: parity = %x, addr_parity = %x\n", parity, addr_parity);
  ecc[1] = (data[1] ^ parity) & 0xf; 
  ecc[0] = (data[0] ^ parity) & 0xf;
  ecc[3] = (data[3] ^ parity) & 0xf;
  ecc[2] = (data[2] ^ parity) & 0xf;
 //io_printf((char *)"(PLI) ecc calculated after addr_parity is ecc(%02x %02x %02x %02x)\n", ecc[0]  & 0xff, ecc[1] & 0xff, ecc[2] & 0xff, ecc[3] & 0xff);
}
// }}}

/*-------------------------------------------------------------------
   check the address symbol that is "@". {{{
   if symbol there, return address.
---------------------------------------------------------------------*/
int check_at_symbol(char *buf, long long *addr){
  int i;

  for(i = 0; buf[i] != '\0'; i++)
    if(buf[i] == '/'){
      for(i = i-1; i >= 0;i--)if(buf[i] >= '0' && buf[i] <= '9'){
        buf[i+1] = '\0';
        break;
      }
      break;
    }
  for(i = 0; buf[i] != '\0'; i++){
    if(buf[i] == '@'){
      i++;
      *addr = ato_long(buf, &i);
      return 1;
    }
  }
  return 0;
}
// }}}

// /*-------------------------------------------------------------------
//    configure memory(address(bits) x datawidth(bits)). {{{
// ---------------------------------------------------------------------*/
// void config_mem_call(){
//   avl_conf_ptr a_tree;
// 
//   if(tf_nump() < 2){
//     tf_error((char *)"$config_mem_call requires at least two  arguments(address, data-width).");
//     tf_dofinish();
//   }
//   a_tree              = (avl_conf_ptr)malloc(sizeof(struct avl_conf_node));
//   a_tree->addr        = tf_getp(1);// get address size
//   a_tree->half_byte   = a_tree->addr / 4;
//   if((a_tree->addr % 4) != 0)a_tree->half_byte++;
//   a_tree->size        = tf_getp(2);//get data width
//   a_tree->word        = a_tree->size / 32;
//   a_tree->dram        = 0;//dram
//   if((a_tree->size % 32) != 0)a_tree->word++; 
//   //pointer for avl tree set NULL
//   a_tree->data        = 0;
//   tf_putp(0, (unsigned int)a_tree);//reurn handle
//   io_printf((char *)"(PLI)Info -> Creating Memory(address width(%dbits) data width(%dbits)\n", a_tree->addr, a_tree->size);
// }
// }}}

/*-------------------------------------------------------------------
  set to an unintialized memory with random value. {{{
---------------------------------------------------------------------*/
avl_node_ptr store_op(long long addr, int handle)
{
  int i, bank, start, ind, i_bank, l;
  char d_buf[16], buf[16], ecc[4], pre_xor_ecc[4];
  state_node    f_val[1];
  avl_node_ptr  t_ptr;
  int tmp_adjust = 0;
  int ras_cas = 0;
  int j = 0;

  t_ptr = search_node(&(dram_tree)->data, &addr);
  bank  = handle / 32;
  if(bank == 4){//when ecc read.
    handle -= 128;
    bank    = handle / 4;
  }
  start = bank * 32;
  //io_printf((char *)"(PLI)t_ptr returned in store_op, start = %d, bank = %d, handle = %d \n",start, bank, handle);
  if(t_ptr == 0 || ((t_ptr->val[0].bval[start] & 0xff) == 0xff)){
    if(t_ptr == 0){
      for(l = 0;l < 144; l++){
	f_val[0].aval.cval[l] = 0xff;
	f_val[0].bval[l]      = 0xff;
      }
    }

    // slam_val for MCU SAT. Don't return zeros on uninitialized
    if (slam_val)  {
    if (mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL) {
        if (mc_scan_plusargs("RANK_LOW") !=(char *)NULL)
          ras_cas = addr & 0x7fff800;
        else 
          ras_cas = addr & 0x7ffff80;
        ras_cas = ras_cas >> 1;
      } else {
        if (mc_scan_plusargs("RANK_LOW") !=(char *)NULL)
          ras_cas = addr & 0x3fffc00;
        else
          ras_cas = addr & 0x3ffffc0;
      }

      //io_printf((char *)"(PLI)store_op: ras_cas = %x, addr = %llx\n", ras_cas, addr);
      for(i = 0; i < 16; i++) {
        if(i > 11) {
          j = (i % 4) * 8;
          d_buf[i] = ((ras_cas & (0xff000000 >> j)) >> (24 - j)) & 0xff;
        } else d_buf[i] = 0;
      }
    } else {
      for(i = 0; i < 16; i++) d_buf[i] = 0;
    }

       //d_buf[i] = slam_val ? random() & 0xff : 0;// get ram data
       //io_printf((char *)"(PLI)from store_op routine slam_val = %d, d_buf[%d] = %s", slam_val,i, d_buf[i]);
    
    ind = 0;
    for(i_bank = 0; i_bank < 8;i_bank++){
      buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
      buf[ind++] = d_buf[i_bank]        & 0xf;
    }
    for(i_bank = 0; i_bank < 16;i_bank++){
      if(t_ptr){
	(t_ptr)->val[0].aval.cval[start + i_bank] = buf[15-i_bank];
	(t_ptr)->val[0].bval[start + i_bank]      = 0;
      }
      else{
	f_val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	f_val[0].bval[start+i_bank]      = 0;
      }
    }
    start += 16;
    ind    = 0;
    for(i_bank = 8; i_bank < 16;i_bank++){
      buf[ind++] = (d_buf[i_bank] >> 4) & 0xf;
      buf[ind++] = d_buf[i_bank]        & 0xf;
    } 
    for(i_bank = 0; i_bank < 16;i_bank++){
      if(t_ptr){
	(t_ptr)->val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	(t_ptr)->val[0].bval[start+i_bank]      = 0;
      }
      else {
	f_val[0].aval.cval[start+i_bank] = buf[15-i_bank];
	f_val[0].bval[start+i_bank]      = 0;
      }
    }
    tmp_adjust = start - 16;
    hamming(d_buf, pre_xor_ecc);
    //io_printf((char *)"(PLI) calling addr_parity  in store_op foR ADDR = %llx \n", addr);
    addr_parity(pre_xor_ecc, addr, ecc, 6, 0);

    start = 128 + bank * 4;
    
      if(t_ptr){
          (t_ptr)->val[0].aval.cval[start+0] = ecc[0];
          (t_ptr)->val[0].bval[start+0]      = 0;
          (t_ptr)->val[0].aval.cval[start+1] = ecc[1]; 
          (t_ptr)->val[0].bval[start+1]      = 0;
          (t_ptr)->val[0].aval.cval[start+2] = 0; // data
          (t_ptr)->val[0].bval[start+2]      = 0;
          (t_ptr)->val[0].aval.cval[start+3] = 0; // data
          (t_ptr)->val[0].bval[start+3]      = 0;
          (t_ptr)->val[0].aval.cval[tmp_adjust + 14] = ecc[2]; // data
          (t_ptr)->val[0].bval[tmp_adjust + 14]      = 0;
          (t_ptr)->val[0].aval.cval[tmp_adjust + 15] = ecc[3]; // data
          (t_ptr)->val[0].bval[tmp_adjust + 15]      = 0;

          if(dimm_config & CHIPKILL)
          {
              (t_ptr)->val[0].aval.cval[start+0] = ecc[1];
              (t_ptr)->val[0].bval[start+0]      = 0;
              (t_ptr)->val[0].aval.cval[start+1] = 0; // displaced data
              (t_ptr)->val[0].bval[start+1]      = 0;
              (t_ptr)->val[0].aval.cval[start+2] = 0; // data
              (t_ptr)->val[0].bval[start+2]      = 0;
              (t_ptr)->val[0].aval.cval[start+3] = 0; // data
              (t_ptr)->val[0].bval[start+3]      = 0;
              (t_ptr)->val[0].aval.cval[tmp_adjust + 14] = ecc[3]; // data
              (t_ptr)->val[0].bval[tmp_adjust + 14]      = 0;
              (t_ptr)->val[0].aval.cval[tmp_adjust + 15] = ecc[0]; // data
              (t_ptr)->val[0].bval[tmp_adjust + 15]      = 0;
          }
      }
      else {
          f_val[0].aval.cval[start+0] = ecc[0];
          f_val[0].bval[start+0]      = 0;
          f_val[0].aval.cval[start+1] = ecc[1];
          f_val[0].bval[start+1]      = 0;
          f_val[0].aval.cval[start+2] = 0; // data
          f_val[0].bval[start+2]      = 0;
          f_val[0].aval.cval[start+3] = 0; // data
          f_val[0].bval[start+3]      = 0;
          f_val[0].aval.cval[tmp_adjust + 14] = ecc[2]; // data
          f_val[0].bval[tmp_adjust + 14]      = 0;
          f_val[0].aval.cval[tmp_adjust + 15] = ecc[3]; // data
          f_val[0].bval[tmp_adjust + 15]      = 0;

          if(dimm_config & CHIPKILL)
          {
              f_val[0].aval.cval[start+0] = ecc[1];
              f_val[0].bval[start+0]      = 0;
              f_val[0].aval.cval[start+1] = 0; // displaced data
              f_val[0].bval[start+1]      = 0;
              f_val[0].aval.cval[start+2] = 0; // data
              f_val[0].bval[start+2]      = 0;
              f_val[0].aval.cval[start+3] = 0; // data
              f_val[0].bval[start+3]      = 0;
              f_val[0].aval.cval[tmp_adjust + 14] = ecc[3]; // data
              f_val[0].bval[tmp_adjust + 14]      = 0;
              f_val[0].aval.cval[tmp_adjust + 15] = ecc[0]; // data
              f_val[0].bval[tmp_adjust + 15]      = 0;
          }
      }

    io_printf((char *)"(PLI)(%0d)Alert: access an uninitialized address({dimm,ras,cas[10:3],bank,cas[2:0]}=%llx)\n", tf_gettime(), addr);
    if(t_ptr == 0)insert_avl_node(&(dram_tree)->data,  &addr, f_val);
  } 
  return t_ptr;
}
// }}}

/*-------------------------------------------------------------------
  x8_address_decode {{{
    long long addr
---------------------------------------------------------------------*/
long long x8_address_decode(long long addr)
{
/*
  DUAL CHANNEL:
        dway = RAS[14:0], CAS[10:2], BA[2:0], CAS[1:0]
		[28:14]    [13:5]    [4:2]	 [1:0]
  SINGLE CHANNEL:
	dway = RAS[14:0], CAS[10:3], BA[2:0], CAS[2:0]
		  [28:14]    [13:6]    [5:3]     [2:0]
*/
    if (mc_scan_plusargs("DIMM_SIZE_1G") !=(char *)NULL) {
	  addr |= ((addr & 0x10000000) >> 15);
	  addr &= 0xfffffff;
	}
    else if (mc_scan_plusargs("DIMM_SIZE_512") !=(char *)NULL) {
	if (mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL) {
	  addr |= ((addr & 0x20) << 8);
	  addr &= 0x1fffffdf;
	}
	else {
	  addr |= ((addr & 0x10) << 9);
	  addr &= 0x1fffffef;
	}
	}
    else if (mc_scan_plusargs("DIMM_SIZE_256") !=(char *)NULL) {
	  addr |= ((addr & 0x8000000) >> 14);
	  addr &= 0x7ffffff;
	}
    else {	// Default 1Gb
	  addr |= ((addr & 0x10000000) >> 15);
	  addr &= 0xfffffff;
	}
    return addr;
}
//}}}


/*-------------------------------------------------------------------
   $mem_read call routine. {{{
   input:  handle, bank, way.
   output: read_data.
---------------------------------------------------------------------*/
void read_mem_call(){
  long long     addr;
  int           handle;
  avl_node_ptr  t_ptr;
  long long cs = 1;
  long long dimm_addr = 0;
  int btemp = 0;
  int tbank = 0;

  handle = tf_getp(1);     // get this data base.
  addr   = (long long)tf_getp(3);// get index.
  //io_printf((char *)"(PLI)(%0d) read_mem_call with args(before) addr = %llx, handle = %d\n", tf_gettime(),addr, handle);

  if (mc_scan_plusargs("X8") !=(char *)NULL) { addr = x8_address_decode(addr); }
  //io_printf((char *)"(PLI)(%0d) read_mem_call with args(after) addr = %llx, handle = %d\n", tf_gettime(),addr, handle);


  if ((mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL)&& (addr & 0x1)) {
    addr = addr >> 1;
    addr = addr << 1;
    btemp = 1;
  }

  if(handle < 288 && handle >= 144){
    handle -= 144;
    dimm_addr = 1;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle < 432 && handle >= 288){
    handle -= 288;
    dimm_addr = 2;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 432 && handle < 576){
    handle -= 432;
    dimm_addr = 3;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 576 && handle < 720){
    handle -= 576;
    dimm_addr = 4;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 720 && handle < 864){
    handle -= 720;
    dimm_addr = 5;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 864 && handle < 1008){
    handle -= 864;
    dimm_addr = 6;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1008 && handle < 1152){
    handle -= 1008;
    dimm_addr = 7;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1152 && handle < 1296){
      handle -= 1152;
      dimm_addr = 0;
      addr |= (cs << 32);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1296 && handle < 1440){
      handle -= 1296;
      dimm_addr = 1;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1440 && handle < 1584){
      handle -= 1440;
      dimm_addr = 2;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1584 && handle < 1728){
      handle -= 1584;
      dimm_addr = 3;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1728 && handle < 1872){
      handle -= 1728;
      dimm_addr = 4;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1872 && handle < 2016){
      handle -= 1872;
      dimm_addr = 5;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 2016 && handle < 2160){
      handle -= 2016;
      dimm_addr = 6;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 2160 && handle < 2304){
      handle -= 2160;
      dimm_addr = 7;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }

  if ((mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL)&& (btemp == 1)) {
      tbank  = handle / 32;
      if(tbank == 4){//when ecc read.
          handle += 2;
      }
      else
          handle += 16;
  }
  //io_printf((char *)"(PLI)calling read_mem with args addr = %llx, handle = %d\n", addr, handle);
  t_ptr  = store_op(addr, handle);

  if(t_ptr == 0)
    t_ptr = search_node(&(dram_tree)->data, &addr);

  //io_printf((char *)"(PLI)read_mem: slam_mem: with args addr = %llx, handle = %d\n", addr, handle);
  //for(l = 0;l < 144; l++){
  //    io_printf((char *)"(PLI)rval[%d] = %x, ",l, t_ptr->val[0].aval.cval[l]);
  //}

  slam_memory((t_ptr)->val, dram_tree->word, 2, 1, handle);
}
// }}}

/*-------------------------------------------------------------------
 $write_mem call routine. {{{
---------------------------------------------------------------------*/
void write_mem_call(){
  long long    addr;
  state_node   nval[1];
  int          handle, l;
  avl_node_ptr t_ptr;
  long long cs = 1;
  long long dimm_addr = 0;
  int btemp = 0;
  int tbank = 0;

  addr   = (long long)tf_getp(3);
  handle = tf_getp(1); // get this data base.
  //io_printf((char *)"(PLI)(%0d) write_mem_call with args(before) addr = %llx, handle = %d\n", tf_gettime(),addr, handle);

  if (mc_scan_plusargs("X8") !=(char *)NULL) { addr = x8_address_decode(addr); }
  //io_printf((char *)"(PLI)(%0d) write_mem_call with args(after) addr = %llx, handle = %d\n", tf_gettime(),addr, handle);

  if ((mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL)&&(addr & 0x1)) { 
    addr = addr >> 1;
    addr = addr << 1;
    btemp = 1;
  }

  if(handle < 288 && handle >= 144){
    handle -= 144;
    dimm_addr = 1;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)writing here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle < 432 && handle >= 288){
    handle -= 288;
    dimm_addr = 2;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)writing here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 432 && handle < 576){
    handle -= 432;
    dimm_addr = 3;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 576 && handle < 720){
    handle -= 576;
    dimm_addr = 4;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 720 && handle < 864){
    handle -= 720;
    dimm_addr = 5;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 864 && handle < 1008){
    handle -= 864;
    dimm_addr = 6;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1008 && handle < 1152){
    handle -= 1008;
    dimm_addr = 7;
    addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1152 && handle < 1296){
      handle -= 1152;
      dimm_addr = 0;
      addr |= (cs << 32);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1296 && handle < 1440){
      handle -= 1296;
      dimm_addr = 1;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1440 && handle < 1584){
      handle -= 1440;
      dimm_addr = 2;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1584 && handle < 1728){
      handle -= 1584;
      dimm_addr = 3;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1728 && handle < 1872){
      handle -= 1728;
      dimm_addr = 4;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 1872 && handle < 2016){
      handle -= 1872;
      dimm_addr = 5;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 2016 && handle < 2160){
      handle -= 2016;
      dimm_addr = 6;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }
  else if(handle >= 2160 && handle < 2304){
      handle -= 2160;
      dimm_addr = 7;
      addr |= (cs << 32);
      addr |= (dimm_addr << 29);
//   io_printf((char *)"(PLI)here, handle = %d, addr = %d\n",handle, addr);
  }

  if ((mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL)&& (btemp == 1)) {
      tbank  = handle / 32;
      if(tbank == 4){//when ecc read.
          handle += 2;
      }
      else
          handle += 16;
  }
  //io_printf((char *)"(PLI)calling write_mem with args addr = %llx, handle = %d\n", addr, handle);
  t_ptr  = search_node(&(dram_tree)->data, &addr);
 
  if(t_ptr == 0){
    for(l = 0;l < 144; l++){
      nval[0].aval.cval[l] = 0xff;
      nval[0].bval[l]      = 0xff;
    }
  }
  dump_memory(nval, dram_tree->word, 2, handle);
  if(t_ptr){
    t_ptr->val[0].aval.cval[handle] = nval[0].aval.cval[handle];
    t_ptr->val[0].bval[handle]      = nval[0].bval[handle];
  }
  else insert_avl_node(&(dram_tree)->data, &addr, nval);
}
// }}}

/*-------------------------------------------------------------------
   receive the phyical address from rtl. {{{
   return 4 bytes to rtl.
---------------------------------------------------------------------*/
void read_dram_call(){
  int high, bank, i_bank, bank_s;//address
  long long addr, dway;
  avl_node_ptr  t_ptr;
  long long cs;
  unsigned int lowt;
  unsigned long long tempdata1 = 0;
  int ecc_index = 0;
  int t = 0;
  int shift;

 shift = tf_getp(4);
 lowt    = (unsigned int)tf_getlongp(&high, 1);//get address
 addr   = high;
 addr = (unsigned long long) (high & 0xffffffff);
 addr = addr << 32;
 addr  |= lowt;

  //io_printf((char *)"(PLI)(%0d) read_dram_call with args(before X8) addr = %llx\n", tf_gettime(),addr);
  if (mc_scan_plusargs("X8") !=(char *)NULL) { addr = x8_address_decode(addr); }
  //io_printf((char *)"(PLI)(%0d) read_dram_call with args(after X8) addr = %llx\n", tf_gettime(),addr);
    addr = pm_address_shift(addr, shift);

    dway = address_decode(&addr, dimm_config, 0);
    cs = decode_cs(&addr, dimm_config, 0);

    dway |= (cs << 32);
	//io_printf((char *)"(PLI)read_dram: addr = %llx, dway = %llx\n", addr, dway);
    bank_s = (addr  >> 7) & 0x3;
    bank   = bank_s * 32;
  if((addr & 0x8)== 0x8)bank += 16;
  t_ptr = (dram_tree)->data ? search_node(&(dram_tree)->data, &dway) : 0;


     t = (addr >> 3) & 1; 
     if(!t)   
     {
         tempdata1  = 0;
         if(t_ptr){
             for (i_bank = 13; i_bank >= 0; i_bank--){
                 tempdata1 <<= 4;
                 tempdata1  |=  (t_ptr)->val[0].aval.cval[bank+i_bank] & 0xf;
             }
             ecc_index = 128 + bank_s * 4;
             tempdata1 <<=4;
             tempdata1 |= (t_ptr)->val[0].aval.cval[ecc_index+3] & 0xf;
             tempdata1 <<=4;
             tempdata1 |= (t_ptr)->val[0].aval.cval[ecc_index+2] & 0xf;
         } // else tempdata1 returned will be zero.
     }
     else {
         tempdata1  = 0;
         if(t_ptr){
             for (i_bank = 15; i_bank >= 0; i_bank--){
                 tempdata1 <<= 4;
                 tempdata1  |=  (t_ptr)->val[0].aval.cval[bank+i_bank] & 0xf;
             }
         } // else tempdata1 returned will be zero.
     }

//     io_printf((char *)"(PLI)read_dram: tempdata1 = %llx\n", tempdata1);

  tf_putp(2, tempdata1);
  tf_putp(3, (tempdata1 >> 32));
}
// }}}

/*-------------------------------------------------------------------
   extract memory content from string and store data into memory. {{{
---------------------------------------------------------------------*/

void store_into_rdram(char *buf,    long long  *addr,  int index,  
        char *d_buf,  int        *d_ind, int *num_bit, int* l_bit,
        int  *b_ind,  char* ecc,  int dimm_config, int shift){
    long long  dway;
    int        bank, i_bank, i, j, l, bank_s;
    state_node f_val[1];
    char 	     pre_xor_ecc[4];
    avl_node_ptr  t_ptr;
    char tmp_buf[BUFFER];
    long long cs;

    char ck_tmp_buf[BUFFER];
    int start_index_avl, chipkill_index, datafill_index;
    int t_index = 0;
    int mcu, ecc_index ;

    //io_printf ("store_into_rdram with addr %llx, index %x\n", *addr, index);
    for(j = 0; j < 32; j++)
        ck_tmp_buf[j] = 0;

    while((index = remove_leading_space(buf, index, BUFFER)) >= 0){
        convert_a2b(buf, &index, d_buf, d_ind, num_bit);

        dway = address_decode(addr, dimm_config, shift);
        cs = decode_cs(addr, dimm_config, shift);
        //io_printf((char *)"(PLI) after decode: addr=%llx, dimm_config=%d, dway=%llx, cs=%d\n",*addr, dimm_config, dway, cs);

        dway |= (cs << 32);

        //Partial mode shifting - James
        bank_s = pm_bank_s(*addr, shift);

        bank = bank_s * 32;
        // done with address decoding
        if (((*b_ind) & 0x1) == 1) bank += 16;
        (*b_ind)++;
        (*b_ind) &= 0xf;
        //get node if exist
        //io_printf((char *)"(PLI)from init mem: cs is %llx, dway is  %llx, bank_s  %d, bank %d addr %llx\n", cs, dway, bank_s, bank, *addr);


        t_ptr = dram_tree->data ? search_node(&(dram_tree)->data, &dway) : 0;
        if(t_ptr == 0){//new node
            for(l = 0;l < 144; l++){
                f_val[0].aval.cval[l] = 0xff;
                f_val[0].bval[l]      = 0xff;
            }
            i_bank = 0;
            //io_printf((char *)"(PLI) inserting new node at : addr %llx, bank = %d, dway = %llx, d_ind=%d \n", *addr, bank + i_bank, dway, *d_ind);	
            t_index += 16;
            for (i_bank = 0; i_bank < 16; i_bank++){
                if ((*d_ind) <= 0) {
                    //io_printf((char *)"(PLI)WHEN DO WE ENTER THIS BLOCK ?\n");
                    f_val[0].aval.cval[bank+i_bank] = 0;
                    d_buf[16+(*d_ind)-1] = 0;
                    tmp_buf[15-i_bank] = 0;
                    ck_tmp_buf[t_index-i_bank-1] = 0;
                    //                io_printf (" storing node for avl tree at dway = %llx, d_ind=%d, data=%x\n", dway,  (*d_ind), d_buf[16+(*d_ind)-1]);
                }
                else {
                    f_val[0].aval.cval[bank+i_bank] =  d_buf[(*d_ind)-1] & 0xf;
                    tmp_buf[15-i_bank] = d_buf[(*d_ind)-1] & 0xf;
                    ck_tmp_buf[t_index-i_bank-1] = d_buf[(*d_ind)-1] & 0xf;
                    //io_printf (" f_val.cval[%d] = %x = ck_tmp_buf[%d]; bank=%d, i_bank=%d, d_ind=%d, t_index=%d\n",(bank+i_bank), d_buf[(*d_ind)-1], (t_index-i_bank-1), bank, i_bank, *d_ind, t_index);
                }
                f_val[0].bval[bank+i_bank]      = 0;
                (*d_ind)--;
            }
            d_buf = tmp_buf;
            insert_avl_node(&(dram_tree)->data, &dway, f_val);
        } // if t_ptr == 0
        else{//node already exist.
            i_bank = 0;
            //io_printf((char *)"(PLI) overwriting node at : addr %llx, bank %d , dway = %llx, d_ind=%d\n", *addr, bank + i_bank, dway, *d_ind);	
            t_index += 16;
            for (i_bank = 0; i_bank < 16; i_bank++){
                if ((*d_ind) <= 0) {
                    //io_printf((char *)"(PLI)2 WHEN DO WE ENTER THIS BLOCK ?\n");
                    t_ptr->val[0].aval.cval[bank+i_bank] = 0;
                    d_buf[16+(*d_ind)-1] = 0;
                    tmp_buf[15-i_bank] = 0;
                    ck_tmp_buf[t_index-i_bank-1] = 0;
                    //io_printf (" overwriting node for avl tree at dway = %llx, d_ind=%d, data=%x\n", dway,  (*d_ind), d_buf[16+(*d_ind)-1]);
                }
                else {
                    t_ptr->val[0].aval.cval[bank+i_bank] =  d_buf[(*d_ind)-1] & 0xf;
                    tmp_buf[15-i_bank] = d_buf[(*d_ind)-1] & 0xf;
                    ck_tmp_buf[t_index-i_bank-1] = d_buf[(*d_ind)-1] & 0xf;
                    //io_printf (" Overwriting t_ptr.cval[%d] = %x = ck_tmp_buf[%d]; bank=%d, i_bank=%d, d_ind=%d, t_index=%d\n",(bank+i_bank), d_buf[(*d_ind)-1], (t_index-i_bank-1), bank, i_bank, *d_ind, t_index);
                }
                t_ptr->val[0].bval[bank+i_bank]      = 0;
                (*d_ind)--;
            }
            d_buf = tmp_buf;

            // printf("\n");
        }
        ck_tmp_buf[32] = '\0';
        //for(j = 0; j < 32; j++)
            //io_printf((char *)"(PLI) ck_tmp_buf[%d] = %x; ",j, ck_tmp_buf[j]);	

        i_bank = ((*addr >> 3) & 1) * 8;
        j      = 0;
        for (i = i_bank; i < i_bank + 8; i++){
            ecc[i] = d_buf[j*2 + 1] | (d_buf[j*2] << 4);
            //io_printf((char *)"(PLI) ecc[%d] is %x\n", i, ecc[i]);	
            j++;
        }
        //save data here.
        if(i == 16) {
            t_ptr = search_node(&(dram_tree)->data, &dway);
            //io_printf((char *)"(PLI) calling hamming  foR data = %16x\n", &ecc);
            hamming(ecc, pre_xor_ecc);
            //io_printf((char *)"(PLI) calling addr_parity foR ADDR = %llx, pre_xor_ecc =%4x\n", (*addr), &pre_xor_ecc);
            addr_parity(pre_xor_ecc, *addr, d_buf, 0, shift);

            if(dimm_config & CHIPKILL){

                mcu = ((*addr) >> 7) & 0x3;
                if(mcu == 0)
                    chipkill_index = ck_mcu0;
                else if(mcu == 1)
                    chipkill_index = ck_mcu1;
                else if(mcu == 2)
                    chipkill_index = ck_mcu2;
                else if(mcu == 3)
                    chipkill_index = ck_mcu3;


                t_index = 31;
                datafill_index = 0;
                for(i_bank = 0; i_bank < 16; i_bank++) {
                    t_ptr->val[0].aval.cval[bank+i_bank] = ck_tmp_buf[t_index];
                    if(datafill_index != chipkill_index)
                    {
                        t_index--;
                    }
                    datafill_index++;
                }
                ecc_index = 128 + bank_s * 4;
                t_ptr->val[0].aval.cval[ecc_index + 2] = ck_tmp_buf[t_index];
                t_ptr->val[0].bval[ecc_index + 2]      = 0;
                if(datafill_index != chipkill_index)
                {
                    t_index--;
                }
                datafill_index++;
                t_ptr->val[0].aval.cval[ecc_index + 3] = ck_tmp_buf[t_index] ;
                t_ptr->val[0].bval[ecc_index + 3]      = 0;
                if(datafill_index != chipkill_index)
                {
                    t_index--;
                }
                datafill_index++;

                bank -= 16;
                for(i_bank = 0; i_bank < 14; i_bank++) {
                    t_ptr->val[0].aval.cval[bank+i_bank] = ck_tmp_buf[t_index];
                    if(datafill_index != chipkill_index)
                    {
                        t_index--;
                    }
                    datafill_index++;
                }
                t_ptr->val[0].aval.cval[ecc_index + 1] = ck_tmp_buf[t_index] & 0xf;
                t_ptr->val[0].bval[ecc_index + 1]      = 0;
                t_ptr->val[0].aval.cval[ecc_index] =  d_buf[1];
                t_ptr->val[0].bval[ecc_index]      = 0;
                t_ptr->val[0].aval.cval[bank+i_bank] = d_buf[3];
                t_ptr->val[0].aval.cval[bank+i_bank+1] = d_buf[0];

                t_index = 0;
                for(j = 0; j < 32; j++)
                    ck_tmp_buf[j] = 0;

                //for(l = 0;l < 144; l++){
                //    io_printf((char *)"(PLI)cval[%d] = %x, ",l, t_ptr->val[0].aval.cval[l]);
                //}
            }
            else
            {
                bank -= 16;
                start_index_avl = bank;
                for (i_bank = 0; i_bank < 14; i_bank++){
                    t_ptr->val[0].aval.cval[start_index_avl+i_bank] =  ck_tmp_buf[13 - i_bank] & 0xf;
            //        io_printf (" rewriting node for avl tree at dway = %llx, cval[%d] = %x, ck_tmp_buf[%d]\n", dway, (start_index_avl + i_bank), ck_tmp_buf[13 - i_bank], (13 - i_bank));
                }
                t_ptr->val[0].aval.cval[start_index_avl+i_bank] = d_buf[2];
             //   io_printf ("rewriting node for avl tree at dway = %llx, cval[%d] = %x \n", dway, (start_index_avl + i_bank), d_buf[2] );
                t_ptr->val[0].aval.cval[start_index_avl+i_bank + 1] = d_buf[3];
//                io_printf ("rewriting node for avl tree at dway = %llx, cval[%d] = %x \n", dway, (start_index_avl + i_bank + 1), d_buf[3] );

                ecc_index = 128 + bank_s * 4;
                t_ptr->val[0].aval.cval[ecc_index + 1] = d_buf[1];
                t_ptr->val[0].bval[ecc_index + 1]      = 0;
                t_ptr->val[0].aval.cval[ecc_index] =  d_buf[0];
                t_ptr->val[0].bval[ecc_index]      = 0;
                t_ptr->val[0].aval.cval[ecc_index + 2] = ck_tmp_buf[i_bank + 1];
                t_ptr->val[0].bval[ecc_index + 2]      = 0;
                t_ptr->val[0].aval.cval[ecc_index + 3] = ck_tmp_buf[i_bank] ;
                t_ptr->val[0].bval[ecc_index + 3]      = 0;
                t_index = 0;
                for(j = 0; j < 32; j++)
                    ck_tmp_buf[j] = 0;



            }
        }
        (*addr)  += 8;//data[0]-> size / ADDRESS;
        *num_bit -= 64;
    }
    //tf_dofinish();
}
// }}}

/*-------------------------------------------------------------------
Write 4 bytes to memory
---------------------------------------------------------------------*/
void write_dram_call() {
char buf[BUFFER];
int high, dlow;
long long addr = 0;
long long data, tempdata;
int index;
char d_buf[BUFFER], ecc[16];
int d_ind, num_bit, l_bit, b_ind;
unsigned int lowt;
int shift;


// for reads
int bank, i_bank, bank_s, t, ecc_index;//address
long long dway;
avl_node_ptr  t_ptr;  
long long cs;
unsigned long long tempdata1;

 shift = tf_getp(3);

 lowt    = (unsigned int)tf_getlongp(&high, 1);//get address 
 addr   = high; 
 addr = (unsigned long long) (high & 0xffffffff);
 addr = addr << 32;
 addr  |= lowt;

  //io_printf((char *)"(PLI)(%0d) write_dram_call with args(before X8) addr = %llx\n", tf_gettime(),addr);
  if (mc_scan_plusargs("X8") !=(char *)NULL) { addr = x8_address_decode(addr); }
  //io_printf((char *)"(PLI)(%0d) write_dram_call with args(after X8) addr = %llx\n", tf_gettime(),addr);
 addr = pm_address_shift(addr, shift);

     dlow = tf_getlongp(&high, 2);
     data = high; 
     data = (unsigned long long) high << 32;
     tempdata = (unsigned) dlow;
     data  |= (unsigned long long) tempdata;
   //io_printf((char *)"(PLI)write_dram: addr = %llx, data = %llx \n",addr,data);
     sprintf (buf, "%016llx", data);

     t = (addr >> 3) & 1; 
     if(t)   
     {
         addr -= 8;

         // Do a read of 64 bits and then write those 64 bits 
         dway = address_decode(&addr, dimm_config, 0);
         cs = decode_cs(&addr, dimm_config, 0);

         dway |= (cs << 32); 
         bank_s = (addr  >> 7) & 0x3;
         bank   = bank_s * 32;
         if((addr & 0x8)== 0x8)bank += 16;
         t_ptr = (dram_tree)->data ? search_node(&(dram_tree)->data, &dway) : 0;
         tempdata1  = 0;
         if(t_ptr){
             for (i_bank = 13; i_bank >= 0; i_bank--){
                 tempdata1 <<= 4;
                 tempdata1  |=  (t_ptr)->val[0].aval.cval[bank+i_bank] & 0xf;
             }
             ecc_index = 128 + bank_s * 4;
             tempdata1 <<=4;
             tempdata1 |= (t_ptr)->val[0].aval.cval[ecc_index+3] & 0xf;
             tempdata1 <<=4;
             tempdata1 |= (t_ptr)->val[0].aval.cval[ecc_index+2] & 0xf;
         } // else tempdata1 returned will be zero.

         sprintf(buf, "%016llx %016llx", tempdata1, data);
         d_ind   = 0;num_bit = 0;l_bit   = 0;
         //b_ind = low >> 3;//initial
         index = 0;
         sprintf(ecc, "%d", index);


     }

    if(!t)
    {
        addr += 8;
         // Do a read of 64 bits
         dway = address_decode(&addr, dimm_config, 0);
         cs = decode_cs(&addr, dimm_config, 0);

         dway |= (cs << 32);
         bank_s = (addr  >> 7) & 0x3;
         bank   = bank_s * 32;
         if((addr & 0x8)== 0x8)bank += 16;
         t_ptr = (dram_tree)->data ? search_node(&(dram_tree)->data, &dway) : 0;
         tempdata1  = 0;
         if(t_ptr){
             for (i_bank = 15; i_bank >= 0; i_bank--){
                 tempdata1 <<= 4;
                 tempdata1  |=  (t_ptr)->val[0].aval.cval[bank+i_bank] & 0xf;
             }
         } // else tempdata1 returned will be zero.

         sprintf(buf, "%016llx %016llx", data, tempdata1);
         sprintf(ecc, "%d", index);
         addr -= 8;
    }
         d_ind   = 0;num_bit = 0;l_bit   = 0;
     b_ind = addr >> 3;//initial
     index = 0;
    store_into_rdram (buf, &addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, dimm_config, 0);

}
// }}}

/*-------------------------------------------------------------------
   read mem.image and build memory. {{{
---------------------------------------------------------------------*/
void padding(char* buf, int index)
{
  int num, ind;
  ind = index;
  num = 0;
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
  }
}
// }}}

/*-------------------------------------------------------------------
  check the address range based on dram config. {{{
---------------------------------------------------------------------*/
int check_address_range(long long addr, int dimm_config, int shift)
{
    if(check_if_valid_PA(addr, dimm_config, shift) < 0)
        return 1;

    return 0;
}
// }}}

/*------------------------------------------------------------------
   read mem.image and build memory. {{{
--------------------------------------------------------------------*/
void build_rdram(FILE *fp,  int dimm_config, int shift){
    long long  addr, tmp_addr;
    char  buf[BUFFER], d_buf[BUFFER], ecc[16];
    int   index, d_ind, num_bit, l_bit, b_ind;
    int skip_data = 0;

    addr = 0;d_ind   = 0;num_bit = 0;l_bit   = 0;b_ind = 0;//initial

    while(fgets(buf, BUFFER, fp)){
        index = remove_leading_space(buf, 0, BUFFER);
        if(index < 0 || strncmp (buf, "//", 2) == 0)continue;//empty string
        if(check_at_symbol(buf, &addr)){//get address
            tmp_addr = addr;
            skip_data = check_address_range(addr, dimm_config, shift);
            mask_value(dram_tree->addr, &addr);
            d_ind   = 0;num_bit = 0;l_bit   = 0;
            b_ind   = 0;
            continue;
        }
        if(skip_data == 1) continue;//skip data part for invalid PA
        padding(buf, index);
        //io_printf((char *)"(PLI) check_at_symbol:store_into_rdram. buf=%s, tmp_addr=%llx, addr=%llx, index=%d, d_buf=%s, ecc=%s, dimm_config=%d",buf, tmp_addr, addr, index, d_buf, ecc, dimm_config);
        store_into_rdram(buf, &addr, index, d_buf, &d_ind, &num_bit, &l_bit, &b_ind, ecc, dimm_config, shift);
    }
}
//}}}


/*--------------------------------------------------------------------
  initialize dram. {{{
----------------------------------------------------------------------*/
void init_dram_call(){
  char         *str;
  FILE         *fp;
  //allocate top tree.
  dram_tree              = (avl_conf_ptr)malloc(sizeof(struct avl_conf_node));
  if(dram_tree == null)
  {
      io_printf((char *)"(PLI)ERROR : Unable to allocate memory in $init_dram\n");
      tf_dofinish();
  }
  print_dimm();
 if (mc_scan_plusargs("X8") !=(char *)NULL) {
  io_printf((char *)"(PLI)(%0d) X8 inside init_dram_call...\n",tf_gettime());
  if ( (mc_scan_plusargs("DIMM_SIZE_2G") !=(char *)NULL) || 
    ( (mc_scan_plusargs("DIMM_SIZE_1G") == (char *)NULL) &&
      (mc_scan_plusargs("DIMM_SIZE_512") == (char *)NULL) &&
      (mc_scan_plusargs("DIMM_SIZE_256") == (char *)NULL) ) ) {
	io_printf((char *)"(PLI)\n\n\n\t*** CANNOT run X8 mode with DIMM size of 2G!***\n\n\n");
	tf_dofinish();
  }
 }
 else {
  io_printf((char *)"(PLI)(%0d) X4 inside init_dram_call...\n",tf_gettime());
 }

  dram_tree->addr        = 40;//address size;
  dram_tree->size        = 4;//tf_getp(2);//get data width
  dram_tree->word        = dram_tree->size / 32;
  dram_tree->dram        = 0;//dram
  if((dram_tree->size % 32) != 0)dram_tree->word++; 
  //pointer for avl tree set NULL
  dram_tree->data        = 0;
  str                    = tf_getcstringp(1);  // get a file name.
  dimm_config              = tf_getp(2);//get dram config
  ck_mcu0                = tf_getp(3);
  ck_mcu1                = tf_getp(4);
  ck_mcu2                = tf_getp(5);
  ck_mcu3                = tf_getp(6);
  shift			 = tf_getp(7);

  //io_printf((char *)"(PLI)Info: reading %s in init_dram_call\n", str);
  //io_printf((char *)"(PLI)Info: dimm_config = %d, str = %s, dram_tree->word = %d", dimm_config, str, dram_tree->word);

  if((fp = fopen(str, "r")) == 0){
    tf_error((char *)"Error: $init_dram can not open file %s for reading\n", str);
    tf_dofinish();
  }
  build_rdram(fp, dimm_config, shift);
  fclose(fp);
  //slam value if not specified, randomly initialize.
  str      = mc_scan_plusargs ("slam_init_value"); 
  slam_val = 0;
  if(str != (char *) 0)slam_val = 1;
  //io_printf((char *)"(PLI)Info: exiting init_dram_call\n");
  //tf_dofinish();
}
//}}}


// void in_order_call(){
//   FILE*        fp;
//   avl_conf_ptr handle;
//   int          shft;
//   char         *str;
// 
//   if(tf_nump() < 2){
//     io_printf((char *)"(PLI)arg %d\n", tf_nump());
//     tf_error((char *)"$in_order call requires at least two arguments(address, datawidth).");
//     tf_dofinish();
//   }
//   shft = -1;
//   if(tf_nump() > 2){
//     shft = tf_getp(3);
//   }
//   str = tf_getcstringp(2); 
//   if((fp = fopen(str, "w")) == 0){
//     tf_error((char *)"Error: $in_order can not open file %s for writing\n", str);
//     tf_dofinish();
//   }
//   else{
//     handle = (avl_conf_ptr) tf_getp(1);
//     in_order(&(handle)->data, fp, &shft, &(handle)->size);
//     fclose(fp);
//   }
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//   dump verilog instance contents. {{{
// --------------------------------------------------------------------*/
// void v_set_delay_call(){
//   handle hand;
//   double rise, fall, toz;
//   acc_initialize();
//   acc_configure(accPathDelayCount, (char *)"3");
//  
//   hand = acc_handle_by_name(tf_getcstringp(1), 0);
//   switch(acc_fetch_delay_mode(hand)){
//   case accDelayModeNone : io_printf((char *)"(PLI)none\n");break;
//   case accDelayModePath : io_printf((char *)"(PLI)path\n");
//   }
//   acc_replace_delays(hand, rise, fall, toz);
//   acc_close();
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//   dump verilog instance contents. {{{
// ---------------------------------------------------------------------*/
// void v_force_call(){
// 
//   handle hand;
//   s_setval_value valStruct;
//   s_setval_delay delStruct;
//   s_acc_time     timStruct;
// 
//   acc_initialize();
//   hand = acc_handle_by_name(tf_getcstringp(1), 0);
//   if(!hand){
//     io_printf((char *)"(PLI)%0d : Info: Object not found %s\n", tf_gettime(), tf_getcstringp(1));
//     acc_close();
//     return;
//   }
//   valStruct.format    = accBinStrVal;
//   valStruct.value.str = (char*)malloc(acc_fetch_size(hand));
//   strcpy(valStruct.value.str, tf_getcstringp(2));
// 
//   switch(acc_fetch_type(hand)){
//   case accNet : 
//     delStruct.model = accForceFlag;
//     break;
//   case accRegister :
//     timStruct.type  = accTime;
//     timStruct.low   = 5;
//     timStruct.high  = 0;
//     delStruct.time  = timStruct;
//     delStruct.model = accInertialDelay;
//   }
//   acc_set_value(hand, &valStruct, &delStruct);
//   acc_close();
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//   dump verilog instance contents. {{{
// ---------------------------------------------------------------------*/
// void v_dump_call(){
//   handle hand;
//   int v_size, msb, lsb;
//   acc_initialize();
//   hand = acc_handle_by_name(tf_getcstringp(1), 0);
//   if(!hand){
//     io_printf((char *)"(PLI)%0d : Info: Object not found %s\n", tf_gettime(), tf_getcstringp(1));
//     acc_close();
//     return;
//   }
//   switch(acc_fetch_type(hand)){
//   case accRegister:
//     io_printf((char *)"(PLI)%0d : Info -> %s = 0x%s\n", tf_gettime(), tf_getcstringp(1), 
// 	      acc_fetch_value(hand, (char *)"%h", 0));
//     break;
//   case accNet :
//     io_printf((char *)"(PLI)%0d : Info -> %s = 0x%s\n", tf_gettime(), tf_getcstringp(1), 
// 	      acc_fetch_value(hand, (char *)"%h", 0));
//     break;
//   default : 
//     v_size = acc_fetch_size(hand);
//     acc_fetch_range(hand, &msb, &lsb);
//     io_printf((char *)"(PLI)SIZE %d %d %d\n", v_size, msb, lsb);
//   }
//   acc_close();
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//   initialize memory. {{{
// ---------------------------------------------------------------------*/
// void warm_specified(int val, int size, int arg_loc){
//   char* avalPtr, *bvalPtr;
//   int  word, ind, groups;
//   s_tfnodeinfo node_info;
// 
//   ind = 0;
//   tf_nodeinfo(arg_loc, &node_info);
//   switch(node_info.node_type){
//   case TF_MEMORY_NODE :
//     if(size > node_info.node_mem_size)return;
//     word    = node_info.node_ngroups * 2;
//     avalPtr = node_info.node_value.memoryval_p + size * word;
//     bvalPtr = avalPtr + node_info.node_ngroups;
//     for(groups = node_info.node_ngroups - 1; groups >= 0;groups--){
//       avalPtr[groups] =  val & 0xff;
//       bvalPtr[groups] =  0;
//       ind++;
//     }
//     break;
//   case TF_REG_NODE :
//     for(groups = 0; groups < node_info.node_ngroups ; groups++){
//       node_info.node_value.vecval_p[groups].avalbits = val & 0xff;
//       node_info.node_value.vecval_p[groups].bvalbits = 0;
//     }
//     tf_propagatep(arg_loc);
//     break;
//   case TF_NETVECTOR_NODE :
//     for(groups = 0; groups < node_info.node_ngroups ; groups++){
//       node_info.node_value.vecval_p[groups].avalbits = val & 0xff;
//       node_info.node_value.vecval_p[groups].bvalbits = 0;
//     }
//     tf_propagatep(arg_loc);
//     break;
//   }
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//   dump verilog instance contents. {{{
// ---------------------------------------------------------------------*/
// void slam_mem_call(){
//   FILE *fp;
//   char *str;
//   int val, addr;
// 
//   str = tf_getcstringp(1);  // a get file name.
//   if((fp = fopen(str, "r")) == 0){
//     io_printf((char *)"(PLI)Warning -> SPD not set(File not Found %s)\n", str);
//     return;
//   }
//   while(fscanf(fp, "%x %x", &addr, &val) != EOF)warm_specified(val & 0xff, addr & 0xff, 2);
//   fclose(fp);
// }
// // }}}
// 
// /*-------------------------------------------------------------------
//  syndrome for irf and frf. {{{
// --------------------------------------------------------------------*/
// char syndrome(char* data, int fl)
// {
//   int   i, j, ind;
//   char bits [64], ch, byte[8];
//   int num = fl ? 4 : 8;
//   ind     = 0;
// 
//   for(i = num - 1 ; i >= 0;i--){
//     ch  = data[i];
//     for(j = 0; j < 8;j++){
//       bits[ind] = ch & 1;
//       ind++;
//       ch  >>= 1;
//     }
//   }
// 
//   if(fl){
//     byte[0]  = bits[0]  ^ bits[1]  ^ bits[3]  ^ bits[4]  ^ bits[6]  ^
//                bits[8]  ^ bits[10] ^ bits[11] ^ bits[13] ^ bits[15] ^
//                bits[17] ^ bits[19] ^ bits[21] ^ bits[23] ^ bits[25] ^
//                bits[26] ^ bits[28] ^ bits[30];
// 
//     byte[1]  = bits[0]  ^ bits[2]  ^ bits[3]  ^ bits[5]  ^ bits[6]  ^
//                bits[9]  ^ bits[10] ^ bits[12] ^ bits[13] ^ bits[16] ^
//                bits[17] ^ bits[20] ^ bits[21] ^ bits[24] ^ bits[25] ^
//                bits[27] ^ bits[28] ^ bits[31];
// 
//     byte[2]  = bits[1]  ^ bits[2]  ^ bits[3]  ^ bits[7]  ^ bits[8]  ^
//                bits[9]  ^ bits[10] ^ bits[14] ^ bits[15] ^ bits[16] ^
//                bits[17] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25] ^
//                bits[29] ^ bits[30] ^ bits[31]; 
// 
//     byte[3]  = bits[4]  ^ bits[5]  ^ bits[6]  ^ bits[7]  ^ bits[8]  ^
//                bits[9]  ^ bits[10] ^ bits[18] ^ bits[19] ^ bits[20] ^
//                bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25];
//     
//     byte[4]  = bits[11] ^ bits[12] ^ bits[13] ^ bits[14] ^ bits[15] ^
//                bits[16] ^ bits[17] ^ bits[18] ^ bits[19] ^ bits[20] ^
//                bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^ bits[25];
// 
//     byte[5]  = bits[26] ^ bits[27] ^ bits[28] ^ bits[29] ^ bits[30] ^
//                bits[31];
// 
//     byte[6]  = bits[0]  ^ bits[1]  ^ bits[2]  ^ bits[4]  ^ bits[5]  ^
//                bits[7]  ^ bits[10] ^ bits[11] ^ bits[12] ^ bits[14] ^
//                bits[17] ^ bits[18] ^ bits[21] ^ bits[23] ^ bits[24] ^
//                bits[26] ^ bits[27] ^ bits[29];
//     ch = 0;
//     byte[1] <<= 1;byte[2] <<= 2;byte[3] <<= 3;
//     byte[4] <<= 4;byte[5] <<= 5;byte[6] <<= 6;
//     for(i = 0; i < 7; i++)ch |= byte[i];
//   }
//   else {
//     byte[0]  = bits[0]  ^ bits[1]  ^ bits[3]  ^ bits[4]  ^ bits[6]  ^ bits[8]  ^ bits[10] ^
//                bits[11] ^ bits[13] ^ bits[15] ^ bits[17] ^ bits[19] ^ bits[21] ^ bits[23] ^
//                bits[25] ^ bits[26] ^ bits[28] ^ bits[30] ^ bits[32] ^ bits[34] ^ bits[36] ^
//                bits[38] ^ bits[40] ^ bits[42] ^ bits[44] ^ bits[46] ^ bits[48] ^ bits[50] ^
//                bits[52] ^ bits[54] ^ bits[56] ^ bits[57] ^ bits[59] ^ bits[61] ^ bits[63];
// 
//     byte[1]  = bits[0]  ^ bits[2]  ^ bits[3]  ^ bits[5]  ^ bits[6]  ^ bits[9]  ^ bits[10] ^
//                bits[12] ^ bits[13] ^ bits[16] ^ bits[17] ^ bits[20] ^ bits[21] ^ bits[24] ^
//                bits[25] ^ bits[27] ^ bits[28] ^ bits[31] ^ bits[32] ^ bits[35] ^ bits[36] ^
//                bits[39] ^ bits[40] ^ bits[43] ^ bits[44] ^ bits[47] ^ bits[48] ^ bits[51] ^
//                bits[52] ^ bits[55] ^ bits[56] ^ bits[58] ^ bits[59] ^ bits[62] ^ bits[63];
// 
//     byte[2]  = bits[1]  ^ bits[2]  ^ bits[3]  ^ bits[7]  ^ bits[8]  ^ bits[9]  ^ bits[10] ^
//                bits[14] ^ bits[15] ^ bits[16] ^ bits[17] ^ bits[22] ^ bits[23] ^ bits[24] ^
//                bits[25] ^ bits[29] ^ bits[30] ^ bits[31] ^ bits[32] ^ bits[37] ^ bits[38] ^
//                bits[39] ^ bits[40] ^ bits[45] ^ bits[46] ^ bits[47] ^ bits[48] ^ bits[53] ^
//                bits[54] ^ bits[55] ^ bits[56] ^ bits[60] ^ bits[61] ^ bits[62] ^ bits[63];
//     
//     byte[3]  = bits[4]  ^ bits[5]  ^ bits[6]  ^ bits[7]  ^ bits[8]  ^ bits[9]  ^ bits[10] ^
//                bits[18] ^ bits[19] ^ bits[20] ^ bits[21] ^ bits[22] ^ bits[23] ^ bits[24] ^
//                bits[25] ^ bits[33] ^ bits[34] ^ bits[35] ^ bits[36] ^ bits[37] ^ bits[38] ^
//                bits[39] ^ bits[40] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^ bits[53] ^
//                bits[54] ^ bits[55] ^ bits[56];
// 
//     byte[4]  = bits[11] ^ bits[12] ^ bits[13] ^ bits[14] ^ bits[15] ^ bits[16] ^
//                bits[17] ^ bits[18] ^ bits[19] ^ bits[20] ^ bits[21] ^ bits[22] ^ bits[23] ^
//                bits[24] ^ bits[25] ^ bits[41] ^ bits[42] ^ bits[43] ^ bits[44] ^ bits[45] ^
//                bits[46] ^ bits[47] ^ bits[48] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^
//                bits[53] ^ bits[54] ^ bits[55] ^ bits[56];
// 
//     byte[5]  = bits[26] ^ bits[27] ^ bits[28] ^ bits[29] ^ bits[30] ^ bits[31] ^
//                bits[32] ^ bits[33] ^ bits[34] ^ bits[35] ^ bits[36] ^ bits[37] ^ bits[38] ^
//                bits[39] ^ bits[40] ^ bits[41] ^ bits[42] ^ bits[43] ^ bits[44] ^ bits[45] ^
//                bits[46] ^ bits[47] ^ bits[48] ^ bits[49] ^ bits[50] ^ bits[51] ^ bits[52] ^
//                bits[53] ^ bits[54] ^ bits[55] ^ bits[56];
// 
//     byte[6]  = bits[57] ^ bits[58] ^ bits[59] ^ bits[60] ^ bits[61] ^ bits[62] ^ bits[63];
//  
//     byte[7]  = bits[0]  ^ bits[1]  ^ bits[2]  ^ bits[4]  ^ bits[5]  ^ bits[7]  ^ bits[10] ^ bits[11] ^
//                bits[12] ^ bits[14] ^ bits[17] ^ bits[18] ^ bits[21] ^ bits[23] ^ bits[24] ^ bits[26] ^
//                bits[27] ^ bits[29] ^ bits[32] ^ bits[33] ^ bits[36] ^ bits[38] ^ bits[39] ^ bits[41] ^
//                bits[44] ^ bits[46] ^ bits[47] ^ bits[50] ^ bits[51] ^ bits[53] ^ bits[56] ^ bits[57] ^
//                bits[58] ^ bits[60] ^ bits[63];
//     ch = 0;
//     byte[1] <<= 1;byte[2] <<= 2;byte[3] <<= 3;
//     byte[4] <<= 4;byte[5] <<= 5;byte[6] <<= 6;byte[7] <<= 7;
//     for(i = 0; i < 8; i++)ch |= byte[i];
//   }
//   return ch;
// }
// // }}}
// 
// void slam_random_call() {
//   int size, num, word, groups, fl, ind, val, rnd;
//   char* avalPtr, *bvalPtr, ch;
//   char data[8];
//   char  *pargs;
//   s_tfnodeinfo node_info;
//   tf_nodeinfo(1, &node_info);
// 
//   pargs  = mc_scan_plusargs ("slam_value="); 
//   rnd    = 1;
//   if(pargs != (char *) 0) {
//      val  = atoi (pargs);
//      rnd  = 0;
//   }
// 
//   num  = tf_getp(2);
//   fl   = tf_getp(3);
//   word = node_info.node_ngroups * 2;
//   for(size = 0;size < num;size++){
//     avalPtr  = node_info.node_value.memoryval_p + size * word;
//     bvalPtr  = avalPtr + node_info.node_ngroups;
//     ind      = fl ? 3 : 7;
//     for(groups = 0; groups < node_info.node_ngroups; groups++){
//       if(ind < 0){
// 	ch = syndrome(data, fl);
// 	avalPtr[groups] = ch & 0xff;
// 	bvalPtr[groups] = 0;
// 	continue;
//       }
//       ch              = rnd ? random() & 0xff : val;
//       avalPtr[groups] = ch;
//       bvalPtr[groups] = 0;
//       data[ind]     = ch;
//       ind--;
//     }
//   }
// }

#ifdef NCV
int mem_size() { return(32); }
#else
#endif
