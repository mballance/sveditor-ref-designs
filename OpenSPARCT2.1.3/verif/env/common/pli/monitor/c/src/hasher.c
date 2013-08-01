/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hasher.c
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
#include <stdlib.h>  
#include <stdio.h>  
#include <string.h>
#include <math.h> 
#include <assert.h>
#include "hasher.h"  

struct hash_ent  
{  
    struct hash_ent *next;  
    unsigned long h_hash;  
    char *key; 
    void *data;  
};  

struct hash_tbl  
{  
    long size;  
    long mask; 
    long used;  
    long limit;  
    struct hash_ent **tbl;  
};  

HASH_TBL *ht_new(unsigned int ht_size)  
/* ht_size should be power of 2 */ 
{  
    HASH_TBL *retval;  
    retval=(HASH_TBL *)malloc(sizeof(HASH_TBL));
    int i;  

    if (retval==NULL)
    {  
        perror("Not enough memory to create hash table...");  
    }  

    retval->size=(long)pow(2.0, log((double)ht_size)/log(2.0) + 0.5 );
    retval->mask=retval->size-1;  
    retval->limit=(retval->size*2)/3;  
    retval->used=0;

    retval->tbl=(struct hash_ent **)malloc(retval->size*sizeof(struct hash_ent *));
    if (retval->tbl==NULL)
    {  
        perror("Not enough memory to create hash table entries...");  
    }  

    for(i=0; i<retval->size; retval->tbl[i++]=0)  
        ;  

    return retval;  
}  

/* GCCism, get rid of inline if we migrate away from GCC */
static unsigned long hash_value(const char *string)  
{  
    unsigned char *p;       /* or signed char *, not really important */  
    unsigned long h;  

    h = 0;  
    for (p = (unsigned char *)string; *p != '\0'; p++)  
            h = h * 33 + *p;      

    return h;  
}  

static void expand_table(register HASH_TBL *table)  
{      
    register int n = table->size * 2, i;  
    register struct hash_ent *p, **h, **newh, **oldh, *q;  

    newh = (struct hash_ent **)malloc(n * sizeof *newh);  
    if (newh==NULL)
    { 
        perror("Not enough memory to expand hash table..."); 
    } 

    for (h = newh, i = n; --i >= 0;)  
        *h++=0;  

    oldh = table->tbl;  
    n--;                    /* change to mask */  
    for (i = table->size; --i >= 0;)  
    {  
        for (p = *oldh++; p != NULL; p = q)   
        {  
            q = p->next; 
            p->next = newh[p->h_hash & n];  
            newh[p->h_hash & n] = p;  
        }  
    }  

    free((char *)table->tbl);  
    table->tbl = newh;  
    table->mask = n;  
    table->size = ++n;  
    table->limit= (table->size*2)/3;
}  

void *ht_get(HASH_TBL *table, const char *key)  
{  
    struct hash_ent *ptr;  
    unsigned long hash=hash_value(key);  

    for (ptr=table->tbl[hash&table->mask]; ptr && strcmp(key, ptr->key);  
         ptr=ptr->next)  
        ;  

    return ptr ? ptr->data : NULL;  
}  

/* assumes that entry is not already in table */  
void ht_put(HASH_TBL *table, char *key, void *data)  
{  
    struct hash_ent *newnode;  
    newnode=(struct hash_ent *)malloc(sizeof(struct hash_ent));
    unsigned long hash=hash_value(key);  

    if (newnode==NULL)
    {  
        perror("Not enough memory to add to hash table..."); 
    }  

    newnode->h_hash=hash;  
    newnode->key=strdup(key);  
    newnode->data=data;   
    newnode->next=table->tbl[hash&table->mask];  
    table->tbl[hash&table->mask]=newnode;  
    table->used++;  
    if (table->used>table->limit)  
        expand_table(table);  
}  

char *ht_rm_ent(HASH_TBL *table, char *key)  
{  
    unsigned long hash=hash_value(key);   
    struct hash_ent *nxt=0, *prv=0;  
    char *retval=0;  

    for (nxt=table->tbl[hash&table->mask]; nxt && strcmp(key, nxt->key);  
         prv=nxt, nxt=nxt->next)  
        ;  

    if (nxt)  
    {  
        if (!prv)  
        {  
            table->tbl[hash&table->mask]=nxt->next;  
        } else  
            prv->next=nxt->next;  
        retval=(char*)nxt->data;  
        free((void *)nxt);  
    }  

    return retval;  
}  

/* returns a sorted list of (void *), 
   each of which points to one of the objects in the hash table */
/* The list is sorted by data.  The comparison routine doesn't get the key
   explicitly so if you want to sort by key you have to get what the keys are
   some other way (such as if the key happens to be in the objects pointed by
   the void pointers).  Yes, the return type is "wrong", you can't get it
   "right" in C anyways.*/
/* it takes a comparison function, which gets passed into qsort() */
/* be careful since qsort() will give the comparison function a pointer
   to a pointer to the actual object */
/* a 0 terminates the list */
void *ht_sorted_list(HASH_TBL *table, int (*cmp)(const void *, const void *))
{
    void **list=(void**)malloc((table->used+1)*sizeof(void *));
    long i=0;
    long bucket;
    struct hash_ent *p, **h;

    h = table->tbl;
    for(bucket=table->size; --bucket >=0; )
    {
        for (p = *h++; p; p = p->next) 
        {
	    if(p->data)
		list[i++]=p->data;
        }  
    }   
    assert(i<=table->used);
    fflush(stdout);
    qsort(list, i, sizeof(void *), cmp);
    list[i]=0;

    fflush(stdout);
    return list;
}

/* this only frees all memory if the data have already been freed somehow */ 
void ht_delete(HASH_TBL *table)  
{  
    long i;  
    struct hash_ent *p, *q, **ht; 

    for(i=table->size, ht=table->tbl; --i>=0;)  
    {  
        for (p=*ht++; p; p=q)  
        {  
            q=p->next;  
	    free(p->key);
            free((void *)p);  
        }  
    }  

    free((void *)table->tbl);  
    free((void *)table);  
}  
