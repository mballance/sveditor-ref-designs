/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: l2warm.h
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
#ifndef _L2WARM_H_
#define _L2WARM_H_
#include "global.h"
#include "b_ary.h"
#include "list.h"
#include "utility.h"

//macro here.


//=========================================================================
//  N2 L2 address map
// 8 Banks                4 Banks           2 Banks
// Tag : 39:18         38:17                37:16
// Set 17:9            16:8                 15:7
// Bank 8:6             7:6                 6
// DATA 5:0             5:0                 5:0
//
//DATA SECTION
//top_left:                top_right:   bot_left:    bot_right:
//   way07_00: 
//           set_bot :32
//           set_top :32
//   way70_01:
//           set_bot :32
//           set_top :32   
//   way158_00:
//           set_bot :32
//           set_top :32
//   way158_01:
//           set_bot :32
//           set_top :32
static struct l2warm_variables l2warm_vars;
//vuad temporay data.
void l2warm_set_init();
void l2warm_slam_data(int row);
void l2warm_parts(int row, int etc, char* unpk);
//generate tag & data ecc.
int l2warm_tecc(int tag);
int l2warm_decc(int data);
//slam tag, data, and vuad
void l2warm_fillerOdd(char* aval, char*bval, int val, int num);
void l2warm_fillerEven(char* aval, char*bval, int val, int add);
void l2warm_filler13(char* aval, char*bval, int cval, int num);
void l2warm_filler13o(char* aval, char*bval, int cval);
void l2warm_slam_tag();
void l2warm_slam_real_data(char* data, int subbank);
void l2warm_slam_vuad();
void l2warm_slam_value(int num);
void l2warm_extract_vuad(int vuad_idx);
void l2warm_integrate_vuad(int vuad_idx, int ecc);
void l2warm_unpack();
void l2warm_pack();
void l2warm_adjust_data(int which_shift);
void l2warm_updated_ua(int idx, int vuadarray, int vuad);
void l2warm_updated_vd(int idx, int vuadarray, int vuad);
void l2warm_get_Mode(KeyType* addr);
void l2warm_setRdancy(int arg);

void l2warm_replace(char* str);
void l2warm_rmhexa(char* buf);
  //modify vuad bits
int l2warm_percent(int* taken, int* not_taken);
int l2warm_used(int vuad);
int l2warm_alloc(int vuad);
//modify vuad bits
int l2warm_valid(int vuad);
int l2warm_dirty(int vuad);
int l2warm_even_parity(int data, int num); 
void l2warm_error_enject_three(char* data, int low, int high, int parity);
void l2warm_error_enject_two(int* data, int low, int high);
int  l2warm_error_enject_one(int);
long long  l2warm_error_enject_long(long long bits);
int l2warm_check_parity_two(long long bits, int num);  
int l2warm_check_parity();
int l2warm_range(int max);
//do invalidate

void l2warm_clean_reg(int loc);
void l2warm_get_tag();
void l2warm_get_data();
void l2warm_gen_addr();
void l2warm_pack_data(char*);
void l2warm_pack_4bytes(int idx, char* unpk);
int  l2warm_copy(char* buf, char* cbuf, int idx);
long long l2warm_getEight(char *buf);
void l2warm_l2_tag_update(int loc);
void l2warm_slam_tag_error();
void l2warm_slam_data_error();
void l2warm_l2_data_update(int wren, int loc);
long long l2warm_get_long(int loc);
void l2warm_set();
//slam tag and data into memory.
bool l2warm_slam(KeyType addr, char* data);
void l2warm_l2_clear_vuad(int bank);
void l2warm_warm_all_cache(b_tree_node_ptr* mem);
//run time
void l2warm_error_enject_void();  
void l2warm_l2_invalidate(int bank);
void l2warm_l1_invalidate(int ivld, int dvld, int cp_loc);
//when bypass is deasserted, slam ramdom data into dram.
void l2warm_stale_data(int loc);
void l2warm_debug();

#endif
