/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: l1warm.h
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
#ifndef _L1WARM_H_
#define _L1WARM_H_
#include "global.h"
#include "list.h"
#define  BANK 4
#define  BANK_NUM 8
#define  ROW_NUM  4
#define  COL_NUM  4
#define  ICACHE_ARG 193
#define  DCACHE_ARG 1
/*----------------------------------------------------------------------------
dcache==>
tag[39:110]
index[10:4]
offset[3:0]

icache=>
tag[39:11]
index[10:5]
offset[4:0]
----------------------------------------------------------------------------*/

#define DCACHE_NUM  8
static struct l1warm_variables l1warm_vars;

//routines
long long l1warm_get_long(int loc);
int  l1warm_which_cache();
int  l1warm_which_way(KeyType addr);  
int  l1warm_howmany_cpu();
void l1warm_core(int num);
int  l1warm_even_parity(int data, int num);
int  l1warm_even_parityLong(long long data, int num);
void l1warm_slam_idirectory(KeyType addr);
void l1warm_slam_ddirectory(KeyType addr);
void l1warm_slam_tag(int word, int size);
void l1warm_slam_dataLong(long long  word, int size);
void l1warm_slam_data(char* word, int size);
long long l1warm_make_icache_data(int word);
int  l1warm_predecoder(int inst);
int  l1warm_get_word(char*data, int num);
void l1warm_slam_dcache(KeyType addr,char* data, int num);
void l1warm_slam_icache(KeyType addr,char* data, int num);
void l1warm_find_location(int idx, int* vld);
int  l1warm_copy(char* buf, char* cbuf, int idx);
long long l1warm_getEight(char *buf);
void l1warm_slam_l1idata(KeyType addr, char* data, int num);
void l1warm_slam_l1ddata(KeyType addr, char* data, int num);
void l1warm_slam_ionly(KeyType addr, char* data);
void l1warm_slam_donly(KeyType addr, char* data);
int  l1warm_islam(KeyType addr, char* data);
int  l1warm_dslam(KeyType addr, char* data);

void l1warm_init();
void l1warm_option();
void l1warm_set();
void l1warm_set_cpu();
int  l1warm_slam(KeyType addr, char* data, int l2way);
void l1warm_store_parityValidAddr();
void l1warm_clean_valid();
void l1warm_clean_dir();
void l1warm_clean_dirvld();
void l1warm_get_Mode(KeyType* addr);

#endif
