/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bw_lib.h
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
#ifndef _BW_LIB_H_
#define _BW_LIB_H_
#include "b_ary.h"
#include "list.h"
#include "/import/vcs-release/vcs7.1R13/include/vcsuser.h"
#include "/import/vcs-release/vcs7.1R13/include/acc_user.h"

//general
#define BUFFER 1024

int     n2_ck_rmSpace(char* buf, int index, int max);
KeyType n2_ck_getEight(char *buf, int idx);
int     n2_getAddr(char *buf, unsigned long long *addr, int idx);
void    n2_a2h(char* buf,int idx,  char* cbuf, int* cidx);
int     n2_ck_align_buf(char* cbuf, int cidx);
KeyType n2_ck_mask_addr (KeyType addr);
void    n2_ck_read_mem(char* str, b_tree_node_ptr* root, list_head_ptr addr_list);
void    n2_ck_set_random();
void    n2_ck_padding(char* buf, int index);
#endif

