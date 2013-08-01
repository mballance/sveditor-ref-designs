/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: queue.h
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
#ifndef _QUEUE_C_H_
#define _QUEUE_C_H_
#include <stdlib.h>
#include <stdio.h>
#include <values.h>
#include <limits.h>
#include "vcsuser.h"
#include "acc_user.h"
#define NUMCORE 8
#define NUMTHREAD 8
#define GLOBAL_REG 1
#define WINDOW_REG 2
#define CONTROL_REG 3
#define FLOAT_REG 4

#define INIT_Q 0
#define PUSH_Q 1
#define POP_Q  2
#define STATUS_Q 3
#define PR_INSTR_Q 4
#define FLUSH_TH_Q 5

#define LLONG_BIGNUM  (MAXLONG|(MAXLONG <<12))

// Main Record node for Exp/Act value checking
typedef struct t_check_item{
    unsigned long long time;    // Time stamp
    char type;                  // register Type
    int reg_num;                // register Number
    int level;                  // global level Number
    int win;                    // window Number
    unsigned long long  value;  // 64 bit value
} *t_check_item_ptr;

typedef struct t_instr_item {
    unsigned long long va;      // Virtual Address
    unsigned long long pa;      // Physical Address
    int  num;                   // Sequential number
    char *instruction;          // Instruction String
} *t_instr_item_ptr;

// Queue pointers defined here .. 
// The record is a void pointer to not tie the functions to
// a particular type ..

// Thread wise list node
typedef struct t_list_node{
    void *record;
    struct t_list_node *next;
} *t_list_node_ptr;

// Head node for thread wise list.
typedef struct t_list_head_node{
    t_list_node_ptr head_ptr, tail_ptr;
}*t_list_head_ptr;

// Main List Node - contains array of lists
typedef struct mt_list {
    t_list_head_ptr t_list [NUMCORE*NUMTHREAD];
} *mt_list_ptr ;

// Statics visible in all source files ..

mt_list_ptr q_instr;
int debug_queue;
int nas_trace;
int quiet;
#ifndef USE_FPRINTF
int nas_fd;
#else
FILE *nas_fd;
#endif
int show_instr_pa;
char indelta [64];

#ifndef __QUEUE_C_
// Prototypes  


mt_list_ptr init_q (mt_list_ptr q) ;

int push_q (mt_list_ptr q, int tid, void *item) ;

void * pop_q (mt_list_ptr q, int tid ) ;

int print_q (mt_list_ptr q, int tid) ;

int size_q (mt_list_ptr q, int tid) ;

unsigned long long status_q (mt_list_ptr q) ;

int oldest_t(mt_list_ptr q);

t_instr_item_ptr scan_instr4va (mt_list_ptr q, int tid, unsigned long long va);

#endif
#endif

