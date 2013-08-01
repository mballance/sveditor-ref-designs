/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: queue.c
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
#define __QUEUE_C_
#include <unistd.h>
#include "queue.h"
#include "monitor.h"
#include "veriuser.h"
#include "vcsuser.h"
#define ULLONG_MAX 18446744073709551615
////////////////////////////////////////////////////////////////////////
// Initialize the Array of Lists structure and return pointer
////////////////////////////////////////////////////////////////////////
mt_list_ptr init_q (mt_list_ptr q) {

    int i;
    cDispmon ("queue", MON_NORMAL,"Initializing Queue ..");
    // Create Array of Lists

    q = (mt_list_ptr)malloc(sizeof(struct mt_list)) ;

    // Initialize each list 
    for (i=0; i<(NUMCORE*NUMTHREAD); i++) {
    q->t_list[i] = (t_list_head_ptr)malloc(sizeof(struct t_list_head_node));
        q->t_list[i]->head_ptr = NULL;
        q->t_list[i]->tail_ptr = NULL;
    }

    // Return pointer

    if (debug_queue)
        cDispmon("queue", MON_INFO, "Initialized QID %d",q);
    return (q);
}
    
///////////////////////////////////////////////////////////////////////////////
// Push a node structure into one of the lists
///////////////////////////////////////////////////////////////////////////////
int push_q (mt_list_ptr q, int tid, void *item) {
    t_list_node_ptr node; 

    node = (t_list_node_ptr)malloc(sizeof(struct t_list_node));
    if (node == NULL) {
        cDispmon ("queue",MON_ERR,"Malloc Error  pushing values to queue (%d)",
                    tid);
        tf_dofinish();
    }

    
    node->record = item;
    node->next = NULL;


    // Attach item node to apprpriate list and update head/tail pointers
    
    if (q->t_list[tid]->head_ptr == NULL) {   // Empty Q
        q->t_list[tid]->head_ptr = node;
    } else {
        q->t_list[tid]->tail_ptr->next = node;
    }
    q->t_list[tid]->tail_ptr = node;

    return 1;
}

//////////////////////////////////////////////////////////////////////////////
// Pop the oldest element form one of the lists
//////////////////////////////////////////////////////////////////////////////
void * pop_q (mt_list_ptr q, int tid ) {
    t_list_node_ptr node;
    void *record;

    // Copy head item out, and redirect head pointer to item->next

    // Check if Q is already empty.
    if (q->t_list[tid]->head_ptr == NULL) {
        return 0;
    }

    // Get Node from Q
    node = q->t_list[tid]->head_ptr->next;
    record = q->t_list[tid]->head_ptr->record;


    // Deallocate structure
    free (q->t_list[tid]->head_ptr);

    // Update head pointer
    q->t_list[tid]->head_ptr = node;

    // Return the record pointer
    return record;

}

///////////////////////////////////////////////////////////////////////////////
// Print the contents of one of the lists
///////////////////////////////////////////////////////////////////////////////
int print_q (mt_list_ptr q, int tid) {
    t_list_node_ptr last;
    t_check_item_ptr item;


    io_printf ("Queue %d  ==> \n", tid);

    if (q->t_list[tid]->head_ptr == NULL) {
        io_printf ("\tNULL\n");
        return 0;
    } else {
        last = q->t_list[tid]->head_ptr;
        while (last != NULL) {
            item = (t_check_item_ptr) last->record;
            printf ("\tTime :%llu\n", item->time);
            printf ("\tType :%c\n", item->type);
            printf ("\tReg  :%d\n", item->reg_num);
            printf ("\tValue:0x%llx\n\n", item->value);
            last = last->next;
        }
    }
return 0;
}

///////////////////////////////////////////////////////////////////////////////
// Return the size of one of the lists
///////////////////////////////////////////////////////////////////////////////
int size_q (mt_list_ptr q, int tid) {
    int i;
    t_list_node_ptr last;


    if (q->t_list[tid]->head_ptr == NULL) {
        return 0;
    } else {
        if (debug_queue) {
            i = 1; last = q->t_list[tid]->head_ptr->next;
            while (last != NULL) {
                i++; last = last->next;
            }
            return i;
        } else {
            return 1;
        }
    }
}

//////////////////////////////////////////////////////////////////////////////
// Scan the Instruction queues for matching VA and return record. 
// Remove record from queue
//////////////////////////////////////////////////////////////////////////////
t_instr_item_ptr scan_instr4va (mt_list_ptr q, int tid, unsigned long long va) {

    t_list_node_ptr node, prev;
    t_instr_item_ptr item;

    if (q->t_list[tid]->head_ptr == NULL) {
        return NULL;       
    }

    // Start at head. Scan each item for matching va
    
    node = q->t_list[tid]->head_ptr;
    prev = node;
    item = (t_instr_item_ptr) node->record;
    while (item->va != va && (node->next != NULL)) {
        prev = node;
        node = node->next;
        item = (t_instr_item_ptr) node->record;
    }
    // If match adjust pointer  and return item ..
    if (item->va == va) {
        if (node == q->t_list[tid]->head_ptr) {  // First item ..
            q->t_list[tid]->head_ptr = node -> next;
        } else {
            prev->next = node->next;
        }
        if (node == q->t_list[tid]->tail_ptr)  // PJ: Last item ..
            q->t_list[tid]->tail_ptr = prev;


        free(node);
        return item;
    } else {
        return NULL;
    }
}

//////////////////////////////////////////////////////////////////////////////
// Get Status of all queues - 64 bit return value
//////////////////////////////////////////////////////////////////////////////
unsigned long long status_q (mt_list_ptr q) {
    unsigned long long status;
    int i, j;
    status = 0;
    
    for (i = NUMCORE*NUMTHREAD-1; i >= 0; i--) {
        status <<= 1;
        j = size_q (q, i);
        if (j) {
            status |= 1;
        }
    }
    return  status ;
}

//////////////////////////////////////////////////////////////////////////////
// Find the oldest entry (smallest timestamp) in all thread queues
//////////////////////////////////////////////////////////////////////////////
int  oldest_t (mt_list_ptr q) {
    t_check_item_ptr item;
    unsigned long long oldest=0, tstamp=ULLONG_MAX;
    int i ;

    for (i = NUMCORE*NUMTHREAD-1; i >= 0; i--) {
        if (size_q(q, i)) {
            item = (t_check_item_ptr) q->t_list[i]->head_ptr->record;
            if (item->time < tstamp) {
                tstamp = item->time; oldest = i;
            }
        }
    } 
    return  oldest ;
}

//////////////////////////////////////////////////////////////////////////////
// queue_call () Main PLI call routine
//
//  Input Params : mt_list_ptr, command, params
//                 Command   : 0 = Init, 1 = Push, 2 = Pop, 3 = Status
//                 Push :  tid, time. type, [level/win], num, value, oldest
//                 Pop : tid, time, type, level, win, num, value, oldest
//                 Instr: tid, va, time, pre_string, post_string
//                 Status: mt_list_ptr for Q2
//  Return Values: Init : mt_list_ptr
//                 Push : Status (64 bits)
//                 Pop : Status (64 bits) , data as params
//                 Status : Status (64 bits), oldest for param2
//                 Instr : Print Instruction String, Return Status for list
//
//////////////////////////////////////////////////////////////////////////////

#ifdef NCV
int queue_size() { return(64); }
int queue_call() {
#else
unsigned long long queue_call() {
#endif

    mt_list_ptr q, q2;
    t_check_item_ptr item;
    t_instr_item_ptr instr;
    int command, tid, level=0, win=0, regnum, i, high;
    unsigned low;
    unsigned long long value, status, va, time;
    char type;
    char *prestring, *postring;
    static int instr_count = 1;
#ifndef USE_FPRINTF
    unsigned char ff = 255; unsigned char fe = 254;
    unsigned char lev,wn,rn; short td;
#endif

    // Get queue handle && type of action to be done on queue

    i = 1;
    q = (mt_list_ptr) tf_getp (i++);
    command = tf_getp(i++);

    if (debug_queue) cDispmon ("queue", MON_DEBUG, "CMD=%d:", command);
    
    switch (command) {
        case INIT_Q :// Initialize queues
                q = init_q (q);
                tf_putp (0, (unsigned int) q); 
                return 0;
                break;
        case PUSH_Q :// Push parameters into queue for tid
                // Get params ..
                tid = tf_getp(i++); 
                low  = tf_getlongp (&high, i++); 
                time  = high; time <<= 32; time |= low;
                type = (tf_getcstringp(i++))[0]; 
                switch (type) {
                    case 'G' : level = tf_getp(i++); break;
                    case 'W':
                    case 'X': win = tf_getp(i++); break;
                }
                regnum = tf_getp(i++); 
                low  = tf_getlongp (&high, i++); 
                value  = high; value <<= 32; value |= low;
                
                // Nas trace dump
                if (nas_trace) {
                    /*printf ("IN=%c: PUSH tid=%d time=%llu type=%c win=%d level=%d num=%d val=%llx\n", 
                                indelta[tid], tid, time, type, win, level, regnum, value);
                     */
#ifndef USE_FPRINTF
                        td = (short)tid; lev = (unsigned char) level;
                        wn = (unsigned char) win; rn = (unsigned char) regnum;
#endif
                    if(indelta[tid] != '1') {
                        indelta[tid] = '1';
#ifndef USE_FPRINTF
                        write(nas_fd, &ff, 1);
                        write(nas_fd, &td, 2);
                        write(nas_fd, &type, 1);
                        switch (type) {
                            case 'G' : write(nas_fd, &lev, 1); break;
                            case 'W':
                            case 'X': write(nas_fd,  &wn, 1);break;
                        }
                        write(nas_fd, &rn, 1);
                        write(nas_fd, &value, 8);
#else
                        fprintf(nas_fd, "ff%04d%c", tid, type);
                        switch (type) {
                            case 'G' : fprintf(nas_fd, "%02d", level); break;
                            case 'W':
                            case 'X': fprintf(nas_fd, "%02d", win);break;
                        }
                        fprintf(nas_fd, "%02d%016llx", regnum, value);
#endif
                    } else if ((indelta[tid] == '1') && (regnum == 999)) {
                        indelta[tid] = '0';
#ifndef USE_FPRINTF
                        write(nas_fd, &fe, 1);
                    } else {
                        write(nas_fd, &type, 1);
                        switch (type) {
                            case 'G' : write(nas_fd, &lev, 1); break;
                            case 'W':
                            case 'X': write(nas_fd,  &wn, 1);break;
                        }
                        write(nas_fd, &rn, 1);
                        write(nas_fd,  &value, 8);
                    }
#else
                        fprintf(nas_fd, "fe");
                    } else {
                        fprintf(nas_fd, "%c", type);
                        switch (type) {
                            case 'G' : fprintf(nas_fd, "%02d", level); break;
                            case 'W':
                            case 'X': fprintf(nas_fd, "%02d", win);break;
                        }
                        fprintf(nas_fd, "%02d%016llx", regnum, value);
                    }
#endif
                }
                // Build item ..
                //
                item = (t_check_item_ptr)malloc(sizeof(struct t_check_item));
                if (item == NULL) {
                    cDispmon ("queue", MON_ERR, "Malloc Error adding to queue (%d)",
                                tid);
                    tf_dofinish();
                }

                if (debug_queue) 
                    cWritemon ("queue", MON_DEBUG, "PUSH tid=%d time=%llu type=%c win=%d level=%d num=%d val=%llx", 
                                tid, time, type, win, level, regnum, value);


                item->time = time;
                item->type = type;
                item->level = level;
                item->win = win;
                item->reg_num = regnum;
                item->value = value;

                // Push into queue


                if (! push_q (q, tid, item)) {
                    cDispmon ("queue", MON_ERR, "Error pushing values to queue (%d)\n",
                                tid);
                    tf_dofinish();
                }
                q2=q;
                break;
        case POP_Q :// Pop oldest record from tid queue and send to bench
                tid = tf_getp(i++);
                item = (t_check_item_ptr) pop_q (q, tid);
                if (item == NULL) {
                    cDispmon("queue", MON_ERR, "Error popping values from queue (%d)\n",
                                tid);
                    tf_dofinish();
                }
                tf_putlongp(i++, item->time, item->time >> 32);
                tf_putp(i++, item->type);
                tf_putp(i++, item->level);
                tf_putp(i++, item->win);
                tf_putp(i++, item->reg_num);
                tf_putlongp(i++, item->value, item->value >> 32);
                q2=q;
                if (debug_queue)
                    cWritemon("queue", MON_DEBUG, "POP tid=%d time=%llu type=%c win=%d level=%d num=%d val=%llx", 
                                tid, item->time, item->type, item->win, item->level, item->reg_num,
                                item->value);
                free(item);
                break;
        case STATUS_Q :// Return the Status of the queues
                if (tf_nump() >= i) {
                    q2 = (mt_list_ptr)tf_getp(i++);
                }
                break;
        case PR_INSTR_Q :// Print the current instruction for tid
                tid = tf_getp(i++); 
                low  = tf_getlongp (&high, i++); 
                va  = high; va <<= 32; va |= low;
                low  = tf_getlongp (&high, i++); 
                time  = high; time <<= 32; time |= low;
                // Get the prestring if available
                if (tf_nump() >= i) {
                    prestring = tf_getcstringp(i++);
                }
                // Get the postring if available
                if (tf_nump() >= i) {
                    postring = tf_getcstringp(i++);
                }
                // Check if instruction available in tid queue
                if ((instr = scan_instr4va(q_instr, tid, va)) == NULL) {
                    //cDispmon("nas", MON_NORMAL, " @%llu #%d T%d %012llx  -- Instr Unavailable -- %s",
                    if (! quiet)
                        printf("%s: nas[nas_top]: @%llu #%d T%d %012llx  -- Instr Unavailable -- %s\n",
                        tf_strgettime(), time, instr_count, tid, va, postring);
                } else {
                  if (!show_instr_pa) {
                    //cWritemon("nas", MON_NORMAL, " @%llu #%d T%d %012llx %s %s",
                    if (!quiet) 
                        printf("%s: nas[nas_top]: @%llu #%d T%d %012llx %s %s\n",
                        tf_strgettime(), time, instr_count, tid, va, 
                            instr->instruction, postring);
                  } else {
                    //cWritemon("nas", MON_NORMAL, " @%llu #%d T%d v:%012llx p:%012llx %s %s",
                    if (!quiet) 
                        printf("%s: nas[nas_top]: @%llu #%d T%d v:%012llx p:%012llx %s %s\n",
                        tf_strgettime(), time, instr_count, tid, va, instr->pa,
                            instr->instruction, postring);
                  }
                    //cDispmon("nas", MON_NORMAL,"");
                    free(instr);
                }
                instr_count++;
                break;
    case FLUSH_TH_Q: // Drain contents of the queue for a single thread
                tid = tf_getp(i++); 
                if (debug_queue)
                     cWritemon("queue", MON_DEBUG, "Q FLUSH tid=%d", tid);

                q-> t_list[tid]->head_ptr = NULL;         
                q-> t_list[tid]->tail_ptr = NULL;  
                q2 = q;
                break;
        default: 
                cDispmon("queue", MON_ERR, "Unexpected command (%d) .. terminating!\n",
                                command );
                tf_dofinish();
                break;
    }
        if (tf_nump() >=i) {
        tf_putp(i, oldest_t(q2));
        if (debug_queue)
            cWritemon("queue", MON_DEBUG, " oldest=%d ", oldest_t(q2));
    }
    status = status_q (q);
    if (debug_queue)
        cDispmon("queue", MON_DEBUG, " status=%llx", status);
    tf_putlongp(0, status, status >> 32);
    return 0;
}
