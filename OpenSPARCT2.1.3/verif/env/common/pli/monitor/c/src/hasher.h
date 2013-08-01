/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hasher.h
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
#ifndef jcc_hasher 
#define jcc_hasher 

struct hash_tbl; 

typedef struct hash_tbl HASH_TBL; 

HASH_TBL *ht_new(unsigned int ht_size); 
void *ht_get(HASH_TBL *table, const char *key); 
void ht_put(HASH_TBL *table, char *key, void *value); 
char *ht_rm_ent(HASH_TBL *table, char *key); 
void *ht_sorted_list(HASH_TBL *table, int (*cmp)(const void *, const void *));
void ht_delete(HASH_TBL *table); 
#endif 
