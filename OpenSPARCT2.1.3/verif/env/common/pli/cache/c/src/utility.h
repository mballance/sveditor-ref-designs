/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: utility.h
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
#ifndef _UTILITY_H_
#define _UTILITY_H_
#include "/import/vcs-release/vcs7.1R13/include/vcsuser.h"
#include "/import/vcs-release/vcs7.1R13/include/acc_user.h"
#include "global.h"
#include <malloc.h>
#include <stdio.h>
#include <string.h>
#define  BUFFER  1024


l2warm_avl_node_ptr l2warm_create_avl_node(long long addr);
int l2warm_difference(l2warm_avl_node_ptr t_ptr);
void l2warm_rotate_right(l2warm_avl_node_ptr* pivot_ptr);
void l2warm_rotate_left(l2warm_avl_node_ptr* pivot_ptr);
void l2warm_balance_right(l2warm_avl_node_ptr* t_ptr);
void l2warm_balance_left(l2warm_avl_node_ptr* t_ptr);
void l2warm_fixFB(l2warm_avl_node_ptr t_ptr);
int l2warm_insert_avl_node(l2warm_avl_node_ptr *t_ptr, long long* addr);
l2warm_avl_node_ptr l2warm_search_node(l2warm_avl_node_ptr* t_ptr, long long* addr);

#endif
