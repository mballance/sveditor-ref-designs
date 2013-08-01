/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: b_ary.h
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
#ifndef _B_ARY_H_
#define _B_ARY_H_
#define B_TREE_ORDER    2
#define B_TREE_MAX      2*B_TREE_ORDER
#define KeyType unsigned long long
#define ATOM_DATA_SIZE  64 //hold 64 bytes
#include <stdio.h>
#include "/import/vcs-release/vcs7.1R13/include/vcsuser.h"
#include "/import/vcs-release/vcs7.1R13/include/acc_user.h"
//declare B-tree atom
typedef struct b_tree_atom{
  unsigned long long key;
  int     size;
  //data type
  char    data[ATOM_DATA_SIZE+1];
}*b_tree_atom_ptr;

//delare B-tree node
typedef struct b_tree_node{
  int size;
  struct b_tree_atom* data [B_TREE_MAX+1];
  struct b_tree_node* child[B_TREE_MAX+2];
  struct b_tree_node* parent;
} *b_tree_node_ptr;

//define protype of b-tree.
b_tree_node_ptr b_create();
void b_copy(b_tree_node_ptr p, int pLo, int pHi,
	    b_tree_node_ptr q, int qLo, int qHi);
int  b_scanNode(b_tree_node_ptr node, 
		KeyType key, 
		int* low);

void b_addData(b_tree_atom_ptr atom,
	       int index,
	       b_tree_node_ptr* node,
	       b_tree_node_ptr* rp,
	       b_tree_atom_ptr* promoted);
void b_recursiveInsert(b_tree_node_ptr* node,
		       b_tree_atom_ptr* promoted,
		       b_tree_node_ptr* rp,
		       b_tree_atom_ptr* atom);
void b_insert(b_tree_node_ptr* root, 
	      b_tree_atom_ptr* atom);
b_tree_atom_ptr b_Find(b_tree_node_ptr* p,
		       KeyType* key);
int b_update(b_tree_atom_ptr* atom,
	     b_tree_node_ptr* p);
int b_rmFind(b_tree_node_ptr* p,
	     b_tree_node_ptr* parent,
	     b_tree_atom_ptr* atom);
int b_delete(b_tree_node_ptr* root,
	     KeyType key);
void b_destory(b_tree_node_ptr* root);

#endif
