/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: global.h
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
#ifndef _G_GLOBAL_H_
#define _G_GLOBAL_H_
#include "/import/vcs-release/vcs7.1R13/include/vcsuser.h"
#include "/import/vcs-release/vcs7.1R13/include/acc_user.h"
#include "b_ary.h"
#include <stdlib.h>
#include <string.h>

#define KeyType unsigned long long
#define BUFFER 1024
#define TAG          16
#define VUAD         8
#define DDATA        1024
#define MAX_BANK    8
#define L2WAY       16
#define SUBBANK      256 //12
#define ERROR_ENJECT 5
#define INDEX        1024
#define IVLD_NUM     512
#define DVLD_NUM     512
#define CPU_NUM      8
#define SCRUB_WAIT   0

//how many way


#define UP_BOUND    32
#define WAY_BOUND   64
#define EVEN_BOUND  128
#define BOTTOM      256
#define QUAD        256
#define MAX_CORE    8
//define event record.
typedef struct event_record{
  int   kind;
  //who trig the event.
  int  type;
  int  thrid;
  int  cpu_id;
  int  reg;
  int  wait, src;
  int  num;
  int  bank;
  char ch;
  char* comment;
  //define vectors
  int vec;
  int event_type;
} *event_record_ptr;
//list structure
typedef struct list_node{
  KeyType  addr;
  int way;
  struct list_node *next;

} *list_node_ptr;
//head node for this list.
typedef struct list_head_node{
  list_node_ptr head_ptr, tail_ptr;
  int num;

}*list_head_ptr;
// define avl tree data structure for memory model
typedef struct l2warm_avl_node{
  long long  addr;
  int     state, balance;
  struct l2warm_avl_node *leftPtr;
  struct l2warm_avl_node *rightPtr;
} *l2warm_avl_node_ptr;

typedef struct l2warm_variables{
  char *tag_avalPtr [TAG*MAX_BANK]; 
  int   tag_num;//hold the size of memory for each index.
  char *vuad_avalPtr[VUAD*MAX_BANK];
  int   vuad_num;

  char *data_avalPtr[DDATA*MAX_BANK];
  int   data_num;
  int   bank_type;//number of bank

  int   check_range;
  int   l2_warm, l1_warm;
  int   bank, tag, l2_index, way;
  long long low_bound, up_bound;
  int  tag_data;
  int  turn_on_valid, valid_bit, dirty_bit;
  char *avalPtr, *bvalPtr;
  char slam_data[20];
  char vuad_unpk[160];
  int  low_vuad, up_vuad;
  char l1line[20], ecc[4];
  char parts[MAX_BANK][3];
  int  round_robin[MAX_BANK];
  bool blackboard[MAX_BANK][L2WAY][16];
  int turn_on_dirty, turn_off_dirty;
  int err_enjection, replace, uncorrect_err;
  
  int warm_all;  
  int l2run_error;
  int cpu_invalid;
  int vld_counter;
  int cpu;
  int l2_bank;  

  int rcheck_range, l2run_percent ;
  long long mask_addr, rlow_bound, rup_bound;
  char staledata[64];
  s_tfnodeinfo node_info;
  int idx;
  int stale_idx;
  int wren;
  int tag_pend, tag_pidx[4], tag_pos[4], tag_way[4];
  int tag_pend_now, tag_pidx_now[4], tag_pos_now[4], tag_way_now[4];
  int data_pend, data_pidx[4], data_pos[4], data_way[4];
  int data_pend_now, data_pidx_now[4], data_pos_now[4], data_way_now[4];
  int taken_d, taken_t, not_taken_d, not_taken_t;

  int core_type;
  int l2mask, l1mask;
  int selected;
  l2warm_avl_node_ptr avl_ptr;
  int redundancy;
  int wayLayout[16];
  int tagWay[16];
  int tagPos[16];
  //loadand go
  int loadandgo;
}*l2warm_variablesPtr ;

typedef struct l1warm_variables{

  //argment holder.
  long long low_ibound, up_ibound,
            low_dbound, up_dbound;
  int bank, row, pair, tag, itag, dtag, check_irange, check_drange,
      panel, col, way, cpu, entry, cache;
  int cpu_status, cpu_num;
  int cpu_ptr[MAX_CORE], cpu_chose[MAX_CORE];
  s_tfnodeinfo node_info;
  char *avalPtr, *bvalPtr;
  int l1_debug;
  //l2 directory array.
  int       idir_num, ddir_num;
  int       icache, idone;
  int       dcache, ddone;
  long long temp_val;

  char      *dir_iarray[8 * MAX_BANK];
  long long  dir_ivalid[8 * MAX_BANK];
  long long  dir_iparity[8* MAX_BANK];
  long long  dir_iaddr4[8 * MAX_BANK];

  char      *dir_darray[8 * MAX_BANK];
  long long dir_dvalid[8 * MAX_BANK];
  long long dir_dparity[8 * MAX_BANK];
  long long dir_daddr4[8  * MAX_BANK];

  //dcache info.
  int  dcache_num, dtag_num, dvalid_num;
  char *dcache_w[MAX_CORE][4];
  char *dcache_tag[MAX_CORE][4];
  int  dcache_vld[MAX_CORE];

  int  icache_num, itag_num, ivalid_num;
  char *icache_data[MAX_CORE][16];
  char *icache_tag[MAX_CORE][8];
  int  icache_vld[MAX_CORE];
  //bank mode
  int l2mask,l2bank_type, l2way;
  int iround;
}*l1warm_variablesPtr;

//static struct l2warm_variables l2warm_vars;

#endif
