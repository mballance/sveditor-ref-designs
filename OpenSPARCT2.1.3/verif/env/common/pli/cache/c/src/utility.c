/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: utility.c
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
#include "utility.h"


l2warm_avl_node_ptr l2warm_search_node(l2warm_avl_node_ptr* t_ptr, long long* addr);

/*-------------------------------------------------------------------------------
   create new avl_node.
  state bit : 
     0 dirty,
     1 valid
     2 clean
--------------------------------------------------------------------------------*/
l2warm_avl_node_ptr l2warm_create_avl_node(long long addr){
  l2warm_avl_node_ptr n_ptr;
  n_ptr = (l2warm_avl_node_ptr)malloc(sizeof(struct l2warm_avl_node));
  if(n_ptr != 0){
    n_ptr->state   = 2;
    n_ptr->addr    = addr;
    n_ptr->balance = 0;
    n_ptr->leftPtr = 0;
    n_ptr->rightPtr= 0;
  }
  else {
    io_printf("Out of memory\n");
    tf_dofinish();
  }
  return n_ptr;
}

/*-------------------------------------------------------------------------------
   check difference.
--------------------------------------------------------------------------------*/
int l2warm_difference(l2warm_avl_node_ptr t_ptr){
  int left, right;
  left  = -1;right = -1;

  if(t_ptr == 0)return 0;
  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  return (left - right);
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void l2warm_rotate_right(l2warm_avl_node_ptr* pivot_ptr){
  l2warm_avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->leftPtr != 0){
      t_ptr                 = (*pivot_ptr)->leftPtr;
      (*pivot_ptr)->leftPtr = t_ptr->rightPtr;
      t_ptr->rightPtr       = *pivot_ptr;
      *pivot_ptr            = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void l2warm_rotate_left(l2warm_avl_node_ptr* pivot_ptr){
  l2warm_avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->rightPtr != 0){
      t_ptr                  = (*pivot_ptr)->rightPtr;
      (*pivot_ptr)->rightPtr = t_ptr->leftPtr;
      t_ptr->leftPtr         = *pivot_ptr;
      *pivot_ptr             = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void l2warm_balance_right(l2warm_avl_node_ptr* t_ptr){

  if(l2warm_difference((*t_ptr)->rightPtr) == 0){
    l2warm_rotate_left(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->leftPtr->balance++;

  }
  else if(l2warm_difference((*t_ptr)->rightPtr) < 0){
    l2warm_rotate_left(&(*t_ptr));
    (*t_ptr)->leftPtr->balance -= 2;
  }
  else{
    l2warm_rotate_right(&(*t_ptr)->rightPtr);
    l2warm_rotate_left(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->leftPtr->balance -= 2;
    (*t_ptr)->rightPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: rightPtr.
--------------------------------------------------------------------------------*/
void l2warm_balance_left(l2warm_avl_node_ptr* t_ptr){

  if(l2warm_difference((*t_ptr)->leftPtr) == 0){
    l2warm_rotate_right(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->rightPtr->balance++;

  }
  else if(l2warm_difference((*t_ptr)->leftPtr) < 0){
    l2warm_rotate_right(&(*t_ptr));
    (*t_ptr)->rightPtr->balance -= 2;
  }
  else{
    l2warm_rotate_left(&(*t_ptr)->leftPtr);
    l2warm_rotate_right(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->rightPtr->balance -= 2;
    (*t_ptr)->leftPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   update balance.
--------------------------------------------------------------------------------*/
void l2warm_fixFB(l2warm_avl_node_ptr t_ptr){
  int left, right;
  left  = -1;right = -1;

  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  if(left > right)t_ptr->balance   = left + 1;
  else            t_ptr->balance   = right + 1;
}
/*-------------------------------------------------------------------------------
   write data into memory.
--------------------------------------------------------------------------------*/
int l2warm_insert_avl_node(l2warm_avl_node_ptr *t_ptr, long long* addr){
  
  if((*t_ptr) == 0){
    (*t_ptr)  = l2warm_create_avl_node(*addr); // add new node to tree.
 
    if((*t_ptr) == 0){
      io_printf("Error : Out of Memory\n");
      tf_dofinish();
    }
  }
  else if(*addr == (*t_ptr)->addr)return 1;
  else{
    if(*addr < (*t_ptr)->addr)l2warm_insert_avl_node(&(*t_ptr)->leftPtr, addr);
    else l2warm_insert_avl_node(&(*t_ptr)->rightPtr, addr);
    l2warm_fixFB(*t_ptr);
    if(l2warm_difference(*t_ptr) > 1)       l2warm_balance_left (&(*t_ptr));
    else if(l2warm_difference(*t_ptr) < -1) l2warm_balance_right(&(*t_ptr));
  }
return 0;
}
/*-------------------------------------------------------------------------------
search address on avl.
--------------------------------------------------------------------------------*/
l2warm_avl_node_ptr l2warm_search_node(l2warm_avl_node_ptr* t_ptr, long long* addr){

  if((*t_ptr)->addr == *addr){
    return *t_ptr;
  }
  if((*t_ptr)->addr > *addr){
    if((*t_ptr)->leftPtr == 0){
      return 0;
    }
    return l2warm_search_node(&(*t_ptr)->leftPtr, addr);
  }
  else{
    if((*t_ptr)->rightPtr == 0){
      return 0;
    }
    return l2warm_search_node(&(*t_ptr)->rightPtr, addr);
  }
}

