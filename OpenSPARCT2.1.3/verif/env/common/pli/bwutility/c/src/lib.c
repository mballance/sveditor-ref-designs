/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lib.c
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
#include "lib.h"
/*-------------------------------------------------------------------------------

--------------------------------------------------------------------------------*/
void handle_error(int loc)
{
  handle hand;
  hand = acc_handle_tfarg(loc);
  io_printf("(%0d)Error:unkown value detected name(%s) value(%s)\n", 
	    tf_gettime(),
	    acc_fetch_name(hand),
	    acc_fetch_value(hand, "%h", 0));
  tf_putp(0, 1);//indicates error
}
/*-------------------------------------------------------------------------------
 if find x in the variable, kill simulation.
--------------------------------------------------------------------------------*/
void x_checker_call()
{
  char* avalPtr, *bvalPtr;
  int  word, groups, size;
  s_tfnodeinfo node_info;

  tf_nodeinfo(1, &node_info);
  switch(node_info.node_type){
  case TF_MEMORY_NODE :
    word = node_info.node_ngroups * 2;
    for(size = 0;size < node_info.node_mem_size;size++){
      avalPtr = node_info.node_value.memoryval_p + size * word;
      bvalPtr = avalPtr + node_info.node_ngroups;
      for(groups = node_info.node_ngroups - 1; groups >= 0;groups--)
	if(bvalPtr[groups])handle_error(1);
    }
    break;
  case TF_REG_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      if(node_info.node_value.vecval_p[groups].bvalbits)handle_error(1);
    }
    break;
  case TF_NETVECTOR_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      if(node_info.node_value.vecval_p[groups].bvalbits)handle_error(1);
    }
    break;
  }
  tf_putp(0, 0);//indicates error
}
