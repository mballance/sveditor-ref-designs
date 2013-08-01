/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: list.c
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
#include "list.h"


/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr n2_ck_pop(list_head_ptr handle)
{
  list_node_ptr tmp_ptr;
  if(handle->head_ptr == 0)return 0;
  tmp_ptr          = handle->head_ptr;
  handle->head_ptr = tmp_ptr->next;
  handle->num--;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
void n2_ck_push(list_head_ptr handle, list_node_ptr* item)
{
  (*item)->next = 0;//indicates the last record.

  if(handle->head_ptr == 0)
    handle->head_ptr = *item;
  else 
    handle->tail_ptr->next = *item;
  handle->tail_ptr = *item;
  handle->num++;
}


