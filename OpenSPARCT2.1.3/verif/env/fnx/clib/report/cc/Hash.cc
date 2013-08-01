// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: Hash.cc
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================

#include <stdio.h>
#include <string.h>
#include "cReport.h"
#include "Hash.h"

  
// HashTable::insert
//	  
// Inserts an item into the hash.
//
void
HashTable::insert(HashValueListNode *node) {
  unsigned long hash = node->Hash() % _HASH_SIZE;
  HashValueListNode *table_node = valueNodes[hash];

  while (table_node != NULL) {
    // is this a duplicate?
    if (0 == strcmp(table_node->mip_name, node->mip_name)) {
      // done.  entry already exists
      return;
    } else {
      table_node = table_node->next;
    }
  }

  //fprintf(stderr, "inserting: %s\n", node->mip_name);

  // This is a new entry.  Prepend to the bucket.
  table_node = valueNodes[hash];
  valueNodes[hash] = node;
  valueNodes[hash]->next = table_node;
  valueNodes[hash]->next_overall = most_recent_inserted;
  most_recent_inserted = valueNodes[hash];

} // HashTable::insert()


// HashTable::lookup()
//
// Return a pointer to the value hashed to by key node.
//
const HashValueListNode*
HashTable::lookup(const HashValueListNode& node) {
  unsigned long hash = node.Hash() % _HASH_SIZE;
  HashValueListNode *table_node = valueNodes[hash];

  while (table_node != NULL) {
    // search the bucket
    if (0 == strcmp(table_node->mip_name, node.mip_name)) {
      // match.
      break;
    } else {
      table_node = table_node->next;
    }
  }
  return table_node;
}


// HashTable::next_element
//
// Returns the `next' element from the hash.  Call start_walk() to start at
// the beginning.
//
// NOTE! The order of elements returned by this function is essentially
// arbitrary.  This is sufficient for traversing the table, but not much
// else.
//
const HashValueListNode*
HashTable::next_element() {
  HashValueListNode* table_node = next_walk;
  if (table_node != NULL) {
    next_walk = table_node->next_overall;
  }
  return table_node;
}


