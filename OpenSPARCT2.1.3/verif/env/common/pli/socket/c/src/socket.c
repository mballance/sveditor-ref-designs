/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: socket.c
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
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include "vcsuser.h"
#include "acc_user.h"
#include <regex.h>
#include "monitor.h"

#define CMD_BUFSIZE 10240
#define RCV_BUFSIZE 102400
#define SEND_MAX    10240
#define NODE_SIZE  1024
//simics comands
#define PLI_QUIT                0x01    /* None */
#define PLI_SSTEP               0x02    /* %1 th id */
#define PLI_READ_TH_REG         0x03    /* %1 th id, %2 win num, %3 reg num */
#define PLI_READ_TH_CTL_REG     0x04    /* %1 th id, %2 reg num */
#define PLI_READ_TH_FP_REG_I    0x05    /* %1 th id, %2 reg num */
#define PLI_READ_TH_FP_REG_X    0x06    /* %1 th id, %2 reg num */
#define PLI_RTL_DATA            0x07    /* 436 bytes rtl data */
#define PLI_RTL_CYCLE           0x08
#define PLI_WRITE_TH_XCC_REG    0x09
#define PLI_WRITE_TH_REG_HI     10
#define PLI_RETRY               0x0f
#define PLI_IHWTW               0x11  /* %1=tid %2=itlb-write-time 
                                         %3=VA  %4=entry# */
#define PLI_DHWTW               0x12  /* %1=tid %2=dtlb-write-time 
                                         %3=VA %4=ASI# %5=entry# */
#define PLI_ITLBREAD            0x13  /* %1=tid %2=itlb-read-time */
#define PLI_DTLBREAD            0x14  /* %1=tid %2=dtlb-read-time */
#define PLI_ITLBWRITE           0x15  /* %1=tid %2=itlb-write-time
                                         %3=entry# */
#define PLI_DTLBWRITE           0x16  /* %1=tid %2=dtlb-write-time
                                         %3=entry# */
#define PLI_ITLBPROBE           0x17  /* %1=tid %2=itlbprobe-time */

/* %0=cmd(1) for every command. (N) - N bytes */
/* %1=tid(1),%2=pa(5),%3=data(8),%4=size_vec(1),%5=itype(1),%6=time(4) */
#define PLI_MEM_ST_ISSUE        0x20
/* %1=tid(1),%2=pa(5),%3=size_vec(1),%4=inv_vec(2),%5=time(4) */
#define PLI_MEM_ST_L2_COMMIT    0x21
/* %1=cid(1),%2=src_tid(1),%3=pa(5),%4=time(4) */
#define PLI_MEM_ST_INV          0x22
/* %1=cid(1),%2=pa(5),%3=time(4) */
#define PLI_MEM_ST_UPDATE       0x23
/* %1=cid(1),%2=rmo(1),%3=time(4) */
#define PLI_MEM_ST_ACK          0x24
/* %1=tid(1),%2=ld_id(4),%3=pa(5),%4=size(1),%5=itype(1),%6=cache(1),%7=time(4)
 * */
#define PLI_MEM_LD_ISSUE        0x25
/* %1=tid(1),%2=ld_id(4),%3=pa(5),%4=size(1),%5=data_src(1),%6=cache(1),%7=time(4)
 * */
#define PLI_MEM_LD_DATA         0x26
/* %1=cid(1),%2=ld_id(4),%3=pa(5),%4=time(4) */
#define PLI_MEM_LD_FILL         0x27
/* %1=pa(5),%2=set(4),%3=way(1),%4=inv_vec(4),%5=time(4) */
#define PLI_MEM_EVICT           0x28
/* %1=cid(1),%2=src_bankid(1),%3=set(4),%4=way(1),%5=time(4) */
#define PLI_MEM_EVICT_INV       0x29

/* %1=tid(1),%2=tt(1) */
#define PLI_INT_INTP            0x40

/* %1=tid(1),%2=asr(1),%3=value(8) */
#define PLI_ASR_WRITE       0x41

/* %1=tid(1),%2=asi(1),%3=va(8),%4=value(8) */
#define PLI_ASI_WRITE       0x42

/* %1=tid(1) %2=asi(1) %3=va(1) %4=value(8) */
#define PLI_ASI_READ        0x43

/* %1=va(1) %2=value(8) */
#define PLI_CMP_WRITE       0x44

/* %1=tid(1),%2=asr(1),%3=value(8) */
#define PLI_ASR_READ        0x45


#define INTR_RECEIVE            106
#define VER                     88
#define TICK_CMPR               41
#define FPSR                    36
#define CCR                     35
#define TPC                     52
#define TNPC                    62
#define HINTP                   120
#define MID                     122
#define END_INSTR               999
#include "queue.h"


//list node for socket buffer
typedef struct buf_node{
  int  start, count, thrid;
  char data[NODE_SIZE];
  struct buf_node *next;
} *buf_node_ptr;

typedef struct buf_head_node{
  buf_node_ptr head_ptr, tail_ptr;
  int vld[32];
}*buf_head_ptr;

//socket head
typedef struct sock_handle{
  fd_set fd_rd, fd_wr;
  int    sockfd;
  struct timeval tv;
  char   data[RCV_BUFSIZE+1];
  char   rerv[CMD_BUFSIZE];
  int    len;
  int    num,  read;
  int    max_count, max_recv;  
  buf_head_ptr active, heap;
  int    max;
  int    step; 
  char   sent;
} *sockPtr;

static sockPtr sock;

int debug_socket, use_flush, send_count;

// Execution string REGEX 
static char *sim_instr_ere
        = "([0-9]+):.+swvp([0-9]+).th([0-9]+).+<v:([0-9A-fa-f]+)>.+<p:([0-9A-Fa-f]+)>(.*)\n";
static regex_t regex;
/*
static char* symbolic [] = {
"PC",
"NPC",
"Y",
"CCR",
"FPRS",
"FSR",
"ASI",
"TICK",
"GSR",
"TICK_CMPR",
"STICK",
"STICK_CMPR",
"PSTATE",
"TL",
"PIL",
"TPC1",
"TPC2",
"TPC3",
"TPC4",
"TPC5",
"TPC6", "", "", "", "",
"TNPC1",
"TNPC2",
"TNPC3",
"TNPC4",
"TNPC5",
"TNPC6", "", "", "", "",
"TSTATE1",
"TSTATE2",
"TSTATE3",
"TSTATE4",
"TSTATE5",
"TSTATE6","", "", "", "",
"TT1",
"TT2",
"TT3",
"TT4",
"TT5",
"TT6", "", "", "", "",
"TBA",
"VER",
"CWP",
"CANSAVE",
"CANRESTORE",
"OTHERWIN",
"WSTATE",
"CLEANWIN",
"SOFTINT",
"ECACHE_ERROR_ENABLE",
"ASYNCHRONOUS_FAULT_STATUS",
"ASYNCHRONOUS_FAULT_ADDRESS",
"OUT_INTR_DATA0",
"OUT_INTR_DATA1",
"OUT_INTR_DATA2",
"INTR_DISPATCH_STATUS",
"IN_INTR_DATA0",
"IN_INTR_DATA1",
"IN_INTR_DATA2",
"INTR_RECEIVE",
"GL",
"HPSTATE",
"HTSTATE1",
"HTSTATE2",
"HTSTATE3",
"HTSTATE4",
"HTSTATE5",
"HTSTATE6",
"HTSTATE7",
"HTSTATE8",
"HTSTATE9",
"HTSTATE10",
"HTBA",
"HINTP",
"HSTICK_CMPR",
"MID"
};
*/

int send_socket_nfd(char* send_buf, int len);

/*----------------------------------------------------------------------------
open tcp socket
-----------------------------------------------------------------------------*/
int socket_init_call()
{
  struct sockaddr_in  sin;
  int   csocket, sockfd, status;
  char  *pargs;
  int sockbufsize = 0;
  int size = sizeof(int);
  int err;

  sock       = (sockPtr)malloc(sizeof(struct sock_handle));
  pargs      = mc_scan_plusargs ("csocket=");  
  csocket    = atoi(pargs); 
  if(csocket == 0){
    cDispmon("socket", MON_ERR,  "Socket Not Found");
    tf_dofinish();
  }
  if((sockfd = socket (AF_INET, SOCK_STREAM, 0)) < 0){
     cDispmon("socket", MON_ERR,  "Can't open stream socket"); 
    tf_dofinish();
  }
  bzero ((char *) &sin, sizeof (sin));
  sin.sin_family      = AF_INET;
  sin.sin_addr.s_addr = htonl (INADDR_ANY);
  sin.sin_port        = htons (csocket);
  if(connect (sockfd, (struct sockaddr *) &sin, sizeof (sin)) < 0){
     cDispmon("socket", MON_ERR,  "Can't connect to in server");
     tf_dofinish();
  }
  status = fcntl(sockfd, F_GETFL, 0);
  status |= O_NONBLOCK;
  fcntl(sockfd, F_SETFL, status);
  sock->sockfd     = sockfd;
  sock->tv.tv_sec  = 0;
  sock->tv.tv_usec = 0;
  sock->len        = 0;
  sock->data[0]    = '\0';
  sock->num        = 0;
  sock->read       = 0;
  sock->max_count  = 0;
  sock->sent       = 0;

  //print socket size :
  sockbufsize = RCV_BUFSIZE;
  err = setsockopt(sockfd, SOL_SOCKET, SO_SNDBUF, (char *)&sockbufsize, 
                        (int)sizeof(sockbufsize));

  err = getsockopt(sockfd, SOL_SOCKET, SO_RCVBUF, (char *)&sockbufsize,&size);

  if(debug_socket) 
    cDispmon("socket", MON_INFO, "Socket Rcv Buffer size is %d bytes", sockbufsize);

  sockbufsize = 0;
  err = getsockopt(sockfd, SOL_SOCKET, SO_SNDBUF, (char *)&sockbufsize,&size);
  cDispmon("socket", MON_INFO, "Socket Snd Buffer size is %d bytes", sockbufsize);

  //get the debug flag

  pargs = mc_scan_plusargs ("max_count=");  
  if(pargs != (char *) 0) {
      sock->max = atoi (pargs);
  }
  else sock->max = 0;
  sock->active     = (buf_head_ptr)malloc(sizeof(struct buf_head_node));
  sock->heap       = (buf_head_ptr)malloc(sizeof(struct buf_head_node));
  sock->active->head_ptr     = 0;
  sock->active->tail_ptr     = 0;
  sock->heap->head_ptr       = 0;
  sock->heap->tail_ptr       = 0;
  sock->step                 = 0;
  sock->max_recv             = 0;

  cDispmon ("socket", MON_NORMAL, "Initialized socket %d.", csocket);
  // Initialize the Pattern matching strings
  // Compile the ERE ..

  if (regcomp(&regex, sim_instr_ere, REG_EXTENDED) != 0) {
     cDispmon ("socket", MON_ERR,  "Regex compilation problem in Regcomp()");
    tf_dofinish();
  }

  // Initialize the Instruction sequence Queue

  q_instr = init_q(q_instr);
   cDispmon ("socket", MON_NORMAL, "Initialized Sequence Queue\n");

  if(mc_scan_plusargs ("debug_socket") ) {
    debug_socket = 1;
  } else {
    debug_socket = 0;
  }
  if(mc_scan_plusargs ("socket_use_flush") ) {
    use_flush = 1;
    send_count = 0;
    cDispmon ("socket", MON_NORMAL, "Socket in flush mode\n");
  } else {
    use_flush = 0;
    send_count = 0;
  }
  if(mc_scan_plusargs ("debug_queue") ) {
    debug_queue = 1;
  } else {
    debug_queue = 0;
  }
  if(mc_scan_plusargs ("quiet") ) {
    quiet = 1;
  } else {
    quiet = 0;
  }
  if(mc_scan_plusargs ("nas_trace") ) {
#ifndef USE_FPRINTF
    if((nas_fd = open("nas.trace", O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP))==-1) {
#else
    nas_fd = fopen("nas.trace", "w");
    if (nas_fd == NULL) {
#endif
         cDispmon ("socket", MON_ERR, "Could not open \"nas.trace\" for writing!");
    } else {
        nas_trace = 1;
        cDispmon ("socket", MON_NORMAL, "Nas trace dump enabled\n");
    }
  } else {
    nas_trace = 0;
  }
  show_instr_pa = 0;
  if(!(mc_scan_plusargs ("show_pa") == NULL)) {
    show_instr_pa = 1;
    cDispmon ("socket", MON_NORMAL, "Enabled PA display\n");
  }
  return 0;
}
/*----------------------------------------------------------------------------
  do the fron operation on the buffer list.
-----------------------------------------------------------------------------*/
buf_node_ptr buf_pop(buf_head_ptr handle)
{
  buf_node_ptr tmp_ptr;

  tmp_ptr          = handle->head_ptr;
  handle->head_ptr = tmp_ptr->next;
  return tmp_ptr;
}
/*----------------------------------------------------------------------------
  push a node on the buffer list.
-----------------------------------------------------------------------------*/
void buf_push(buf_head_ptr handle, buf_node_ptr* item)
{
  (*item)->next  = 0;//indicates the last record.
  if(handle->head_ptr == 0)
    handle->head_ptr = *item;
  else 
    handle->tail_ptr->next = *item;
  handle->tail_ptr   = *item; 
}
/*----------------------------------------------------------------------------
   remove leading space or tab.
   if found carriage return, return -1 to indicate anenpty string.
-----------------------------------------------------------------------------*/
int rm_leading_space(char* buf, int index, int max){
  while((index < max) && (buf[index] == ' '  || 
			  buf[index] == '\t' || 
			  buf[index] == ',' ))index++;
  return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*----------------------------------------------------------------------------
    Convert hex string to 64 bit value
-----------------------------------------------------------------------------*/
unsigned long long str2hex64(char* buf) {
    unsigned long long val = 0;
    int i;

    for (i = 0; i<strlen (buf); i++) {
        val <<= 4;
        val  |= buf[i] > '9' ? ((buf[i] & 0xf) + 9) : buf[i] & 0xf;
    }
  return val;
}
/*----------------------------------------------------------------------------
    Extract the instruction strings and insert into instr queue
    Return 0 if valid match found, non-zero otherwise ..

    Formats are :
        216: [swvp0.th00] <v:fffffffff0080350> <p:000000fff0080350> nop
        \d+: [swvp\d.th\d+] <v:val64> <p:val64> INSTRUCTION STRING
-----------------------------------------------------------------------------*/
int extract_instr_info(char *buf) {
    int i, ret, len;
    regmatch_t *submatch;
    int coreid, tid;
    char *substrings[10];
    t_instr_item_ptr item;


    // Allocate submatch arrays
    submatch = (regmatch_t *)malloc(sizeof(regmatch_t)*(regex.re_nsub+1));
    if (submatch == NULL) {
         cDispmon ("socket", MON_ERR, "Error in Allocating for Subexpressions");
    }
    
    // Do the match ..

    if ((ret = regexec (&regex, buf, regex.re_nsub+1, submatch, 0)) ==0) {
        // Populate the submatch variables ..     
        for (i = 1; i<=regex.re_nsub; i++) {
            if (submatch[i].rm_so != -1) {
                len = submatch[i].rm_eo-submatch[i].rm_so;
                substrings[i] = (char *)malloc(sizeof(char)*(len+1));
                strncpy(substrings[i], buf+submatch[i].rm_so, len);
                substrings[i][len] = NULL;
            } else {
                substrings[i] = NULL;
            }
        }
        // Now assign the values and push into Queue


        item = (t_instr_item_ptr)malloc(sizeof(struct t_instr_item));
        if (item == NULL) {
             cDispmon ("socket",  MON_ERR, "Malloc Error Instr queue (%d)");
            tf_dofinish();
        }
        
        item->num = atoi(substrings[1]);
        coreid = atoi(substrings[2]);
        tid = atoi(substrings[3]);
        item->va = str2hex64(substrings[4]) & 0xffffffffffffULL; // Only 48 bits
        item->pa = str2hex64(substrings[5]) & 0xffffffffffffULL; 
        
        item->instruction = (char*)malloc(sizeof(char)*strlen(substrings[6])+1);
        strcpy (item->instruction, substrings[6]);


        if (! push_q (q_instr, coreid*NUMCORE+tid, item)) {
             cDispmon ("socket", MON_ERR,  "Error pushing values to queue (%d)",
                        coreid*NUMCORE+tid);
            tf_dofinish();
        }
        for (i = 1; i<=regex.re_nsub; i++) {
            free (substrings[i]);
        }
        free (submatch);
    } else {
        if (ret != REG_NOMATCH) {
             cDispmon ("socket", MON_ERR, "Error in Regexec()\n");
        } else {
            free (submatch);
            return ret;
        }
    }
        return 0;
}
/*----------------------------------------------------------------------------
    Extract the updated data from simics and put into Expected queue ..

    Formats are :
        STEP: <tid> G <gl> <num> <val64>
        STEP: <tid> W <win> <num> <val64>
        STEP: <tid> F <num> <val32>
        STEP: <tid> C <num> <val64>
    Assumption - A carriage return will delimit instruction boundary
-----------------------------------------------------------------------------*/
void extract_step_info(mt_list_ptr queue, char *buf)
{
    char buf1[RCV_BUFSIZE], buf2[256], type;
    char *strseq;
    unsigned long long value;
    int currlen;
    int tid, regnum, win=0, level=0;
    t_check_item_ptr item;          // Individual record items

    //time = tf_gettime();
    // io_printf("socket > InFo:(%d), %s\n", time, buf); 

    strcpy(buf1, buf);
    
    // Break String into 'STEP: ..' Sequences

    currlen = 0;
    strseq = strtok(buf1, "STEP:");
    while (strseq != NULL) {
        currlen = currlen+strlen(strseq)+5;
        //printf ("Found string %s (%d)\n", strseq, currlen); fflush (NULL);
        // First is TID
        strcpy (buf2, strseq);
        tid = atoi (strtok(buf2, " "));
        // printf("\tTID = %d\n", tid);
        // Second is Type
        type = (strtok(NULL, " "))[0];
        // printf("\tTYPE = %c\n", type);
        switch (type) {
            case 'G' : // Global Register
                       level = atoi(strtok(NULL, " "));
                       // printf("\tLevel = %d\n", level);
                       break;
            case 'W' : // Window Register
                       win = atoi(strtok(NULL, " "));
                       // printf("\tWin = %d\n", win);
                       break;
        }
        // Next is register number
        regnum = atoi(strtok(NULL, " "));
        // printf("\tNum = %d\n", regnum);
        // Last is value - 64 bits
        value = str2hex64(strtok(NULL, " "));
        // printf("\tval = %llx\n", value);

        // OK Lets save this in queue # tid ..
        
        // Build item ..
        //
        item = (t_check_item_ptr)malloc(sizeof(struct t_check_item));
        if (item == NULL) {
             cDispmon ("socket", MON_ERR, "Malloc Error  pushing values to queue (%d)",
                        tid);
            tf_dofinish();
        }

        item->time = 0;
        item->type = type;
        item->level = level;
        item->win = win;
        item->reg_num = regnum;
        item->value = value;

        // Push into queue


        if (! push_q (queue, tid, item)) {
             cDispmon ("socket", MON_ERR, "Error pushing values to queue (%d)",
                        tid);
            tf_dofinish();
        }
        
        // Get next STEP: entry  ..

        strcpy(buf1, buf+currlen);
        strseq = strtok(buf1, "STEP:");
    }

    // Push a END_INSTR into the queue for instruction delimitation .
    //
    item = (t_check_item_ptr)malloc(sizeof(struct t_check_item));
    if (item == NULL) {
         cDispmon ("socket", MON_ERR, "Malloc Error  pushing values to queue (%d)",
                    tid);
        tf_dofinish();
    }

    item->time = 0;
    item->type = 'X';
    item->level = 0;
    item->win = 0;
    item->reg_num = END_INSTR;
    item->value = 0;

    // Push into queue


    if (! push_q (queue, tid, item)) {
         cDispmon ("socket", MON_ERR, "Error pushing values to queue (%d)",
                    tid);
        tf_dofinish();
    }

}
/*-----------------------------------------------------------------------------
    Process the receiving data from simics.
-----------------------------------------------------------------------------*/
int parse_data(mt_list_ptr queue)
{
  int   num=0, found;
  char  tmp_buf[1024];

  if(debug_socket) 
    cDispmon ("socket", MON_DEBUG,  "parse_data(%d) [%s]\n", sock->len, sock->data);
  found = 0;
  while(sock->len > num){
    tmp_buf[num] =  sock->data[num];
    if(tmp_buf[num] == '\n'){
      tmp_buf[++num] = '\0';
      sock->len     -= num;
      // Check for SAS Error
      if(strncmp (tmp_buf, "ERROR:", 6) == 0){
        cDispmon ("socket", MON_WARN, " %s ", tmp_buf);
        strcpy(sock->data, sock->data + num);
        num = 0;
        continue;
      }
      // Check for STEP return 
      if(strncmp (tmp_buf, "STEP: ", 6) == 0){
	    strcpy(sock->data, sock->data + num);
        extract_step_info(queue, tmp_buf);
	    num = 0;
        found = 1;
	    continue;
      }
      // Check for Instruction string 
      if (extract_instr_info(tmp_buf) != 0) {
          // Check for Regval
          if(strncmp (tmp_buf, "regval", 6) != 0){
             cDispmon ("socket", MON_NORMAL, "%s", tmp_buf);
            strcpy(sock->data, sock->data + num);
            num = 0;
            continue;
          }
      } else {
        strcpy(sock->data, sock->data + num);
        num = 0;
        continue;
      }
    }
    num++;
  }
  return found;
}
/*----------------------------------------------------------------------------
    Get data from socket.
-----------------------------------------------------------------------------*/
int read_socket_nfd()
{
  char read_buf[RCV_BUFSIZE+1];
  int  len;
 
  // io_printf("socket > Starting to read socket ..\n");
  // fflush(NULL);
  len = RCV_BUFSIZE - sock->len;
  if (debug_socket) cWritemon ("socket", MON_INFO, "Starting read of (%d) bytes  [%d]", len, sock->len);
  len = read(sock->sockfd, read_buf, len);
  if (debug_socket) cDispmon ("socket", MON_INFO, ".. read  (%d) bytes", len);
  if(len == -1){
    if (errno != EAGAIN && errno != EINTR) {
      cDispmon ("socket", MON_ERR, "Socket read error");
      read_buf[0] = PLI_QUIT;
      send_socket_nfd(read_buf, 1);
      tf_dofinish();
    }
    return 0;
  }
  if (len == (RCV_BUFSIZE - sock->len)) {
    sock->max_recv = 1;
  } else {
    sock->max_recv = 0;
  }
  sock->len      += len;
  read_buf[len]   = '\0';  
  sock->max_count = 0;
  strcat(sock->data, read_buf);
  if(debug_socket && len){
    read_buf[len - 1] != '\n' ?  cDispmon ("socket", MON_DEBUG, "[%s:]", read_buf) : 
                                 cWritemon ("socket", MON_DEBUG, "[%s]",  read_buf);
  }
  // io_printf("socket > Just read %d from socket (Q=%d)\n", len,sock->len);
  return len;
}
/*----------------------------------------------------------------------------
    Receiving data from server.
    Return back an information on which threads are in Recd queue
    Arguments : 1. 'Expected' Queue handle
                2. Conditional 2nd Queue hanlde for oldest tid
                3. Conditional Sent back oldest tid info for 1nd queue
    Returned  : 64 bit queue status array
               Conditional oldest (integer)
-----------------------------------------------------------------------------*/

#ifdef NCV
int sim_recv_call()
#else
unsigned long long sim_recv_call()
#endif

{
    int temp, i, j, k, l;
    mt_list_ptr exp_queue, act_queue;
    unsigned long long status;
    
    // Get handle for Expected queue

    exp_queue = (mt_list_ptr) tf_getp (1);
    if (tf_nump() > 1) {
        act_queue  = (mt_list_ptr) tf_getp (2);
    }


    temp = 0;

    // Read Socket and parse if data available ..
        

    if (debug_socket) 
        cDispmon ("socket", MON_DEBUG, "Checking socket for incoming ..");
    sock->read = 0;
    while(read_socket_nfd() && sock->len) {
        temp = parse_data(exp_queue);
        if (!sock->max_recv) break;
    }

    // Get Expected queue status - 64 bits
    
    status = status_q(exp_queue);
    if (tf_nump() == 3) {
        tf_putp(3, oldest_t(act_queue));
    }

    if (debug_socket) 
        cDispmon ("socket", MON_DEBUG, "Recd & parsed data with status = %llx", status);
    // Return values

    tf_putlongp(0, status, status >> 32);

    if(debug_queue) {
        j=0;k=0;l=0;
        for (i = NUMCORE*NUMTHREAD-1; i >= 0; i--) {
            j = j+size_q (exp_queue, i);
            k = k+size_q (act_queue, i);
            l = l+size_q (q_instr, i);
        }
        cDispmon ("queue", MON_INFO, "[sim_recv_call] Exp Q = %d Act Q = %d Inst Q = %d ", j, k, l);
    }
    return 0;
}

/*----------------------------------------------------------------------------
    Send  Socket request.
-----------------------------------------------------------------------------*/
int send_socket_nfd(char* send_buf, int len)
{
  int slen, counter, i;
  static int tot_slen;

  slen = send(sock->sockfd, send_buf, len, 0);
  send_count++;
  if (debug_socket) {
    tot_slen = tot_slen + slen;
    cDispmon("socket", MON_INFO, ".. Sent %d of %d bytes  (%d total)", slen, len, tot_slen);
  }
  if(slen == -1){
    switch(errno) {
        case (EINTR): cDispmon ("socket", MON_DEBUG, "Err=EINTR"); break;
        case (EMSGSIZE): cDispmon ("socket", MON_DEBUG, "Err=EMSGSIZE"); break;
        case (ENOMEM): cDispmon ("socket", MON_DEBUG, "Err=ENOMEM"); break;
        case (ENOSR): cDispmon ("socket", MON_DEBUG, "Err=ENOSR"); break;
        case (EWOULDBLOCK): cDispmon ("socket", MON_DEBUG, "Err=EWOULDBLOCK"); 
            return 0;
        case (EINVAL): cDispmon ("socket", MON_DEBUG, "Err=EINVAL"); break;
        case (EPIPE): cDispmon ("socket", MON_DEBUG, "Err=EPIPE"); break;
        default : cDispmon ("socket", MON_DEBUG, "Err=%d", errno);
    }
     cDispmon ("socket", MON_NORMAL, "Trying, but can't send data. Length(%d)", len);
  }
  else if(slen == len){
    sock->num = 0;
    sock->sent= 1;
    return 1;
  }
  else if(slen < len){
    counter = 0;
    for(i = slen; i < len;i++)send_buf[counter++] =  send_buf[i];
    sock->num -= slen;
    sock->sent= 1;
  }
    return 0; 
}

/*----------------------------------------------------------------------------
    Copy data to socket send buffer.
-----------------------------------------------------------------------------*/
void copyPacket(char* buf, int num)
{
  int idx;

  for(idx = 0; idx < num; idx++)sock->rerv[sock->num++] = buf[idx];
}
/*----------------------------------------------------------------------------
 shift data in list to reserved buffer of send.
-----------------------------------------------------------------------------*/
int packed()
{
  int available, num;
  buf_node_ptr node;

  available = CMD_BUFSIZE - sock->num;
  while(sock->active->head_ptr && available){  
    node = sock->active->head_ptr;
    num  = node->count;
    if(num <= available){//move whole junk.
      node = (buf_node_ptr) buf_pop(sock->active);
      copyPacket(node->data+node->start, num);
      buf_push(sock->heap, &node);    
    }
    else {
      num = available;
      copyPacket(node->data+node->start, num);
      node->start += num;
      node->count -= num;
    }
    available -= num;
  }
  return 0;
}
/*----------------------------------------------------------------------------
 add the new data to the end of send list.
-----------------------------------------------------------------------------*/
void add_node(char* buf, int index, int num)
{
  int idx, nidx, available;
  buf_node_ptr node;

  if(sock->active->head_ptr){//fill the last node if space is available.
    node      = sock->active->tail_ptr;
    nidx      = node->start + node->count;
    available = NODE_SIZE   - nidx;
    if(available){
      available    = available > num ? num : available; 
      num         -= available;   
      node->count += available;   
      for(idx   = nidx; idx < (nidx + available);idx++)node->data[idx] = buf[index++]; 
    }
  }
  while(num){
    if(sock->heap->head_ptr)node = buf_pop(sock->heap);
    else node = (buf_node_ptr)malloc(sizeof(struct buf_node));
    node->start = 0;     
    available   = NODE_SIZE > num ? num : NODE_SIZE; 
    for(idx = 0; idx < available; idx++)node->data[idx] = buf[index++];
    node->count  = available;
    num         -= available;
    buf_push(sock->active, &node);
  }
}
/*----------------------------------------------------------------------------
    Make the reusable buffer for socket send.
-----------------------------------------------------------------------------*/
void handle_buf(char *cmd_buf, int num)
{
  int available, idx, send_max;

  if (use_flush) {
    send_max = SEND_MAX;
  } else {
    send_max = 1;
  }

  available = sock->num + num;
  if((cmd_buf[0] != PLI_RETRY) && 
     (cmd_buf[0] != PLI_QUIT)  &&
     (available  < send_max)){//not reach the minimum number to be sent.
     copyPacket(cmd_buf, num);
     sock->sent = 0;
     return;
  }
   if(debug_socket && cmd_buf[0] == PLI_QUIT) {
     cDispmon("socket", MON_ALWAYS, "Socket Send Count Was %d", send_count);
   }
  //send data to simcs.  
  available = CMD_BUFSIZE - sock->num;
  available = available  > num ? num : available;
  copyPacket(cmd_buf, available);
  send_socket_nfd(sock->rerv, sock->num);
  num      -= available;
  idx       = available;
  //check list buffer
  if(sock->active->head_ptr)packed();
  available = CMD_BUFSIZE - sock->num;
  if(available && num && (sock->active->head_ptr == 0)){
  //move data on the send buffer if avaiable.
    available = available  > num ? num : available;
    copyPacket(cmd_buf+idx, available);
    num      -= available;
    idx      += available;
  }
  if(num)add_node(cmd_buf, idx, num);
}
/*----------------------------------------------------------------------------
flush buffer NOW
-----------------------------------------------------------------------------*/
int sim_flush_call()
{
    if (debug_socket) {
        cDispmon ("socket", MON_INFO, "Flush Send Buffer (%d)\n", sock->num);
    }
    if (use_flush && ( sock->num >0))
        send_socket_nfd(sock->rerv, sock->num);

    return 0;
}
/*----------------------------------------------------------------------------
send a command to simics
-----------------------------------------------------------------------------*/

#ifdef NCV
int sim_send_call()
#else
unsigned long long sim_send_call()
#endif

{
  unsigned int word;
  unsigned long long longword;
  char cmd_buf[2024];
  int  groups, ind,  num, size, hword, i;
  s_tfnodeinfo node_info;


  // Need to format params in a byte stream ..
  // 1st two are <command> <tid>, which will fit in bytes.
  // Others need to be formatted into bytes ..

    ind = 0;  // ind tracks bytes in message
              // num tracks current parameter ..
    cmd_buf[ind] = tf_getp(1);
    ind++;
#ifndef USE_FPRINTF    
    if (nas_trace) write(nas_fd, &cmd_buf[0], 1);
#else
    if (nas_trace) fprintf(nas_fd, "%02x", cmd_buf[0]);
#endif
    if (debug_socket)
    switch(cmd_buf[0]){  // {{{ Debug Dispmons ..
    case(PLI_QUIT) : 
       cWritemon ("socket", MON_INFO, "Sending quit\n");
      break;
    case(PLI_SSTEP) :
      sock->step++;
       cWritemon ("socket", MON_INFO, "Sending step(%d) ", sock->step);     
      break;
    case(PLI_READ_TH_REG) :
       cWritemon ("socket", MON_INFO, "Sending read ");
      break;
    case(PLI_READ_TH_CTL_REG) :
       cWritemon ("socket", MON_INFO, "Sending read-special ");
      break;
    case(PLI_READ_TH_FP_REG_I) :
       cWritemon ("socket", MON_INFO, "Sending float-32 ");
      break;
    case(PLI_READ_TH_FP_REG_X) :
       cWritemon ("socket", MON_INFO, "Sending float-64 ");
      break;
    case(PLI_RTL_DATA) :  cWritemon ("socket", MON_INFO, "Sending rtl-data") ;
      break;
    case(PLI_WRITE_TH_XCC_REG) :  
        cWritemon ("socket", MON_INFO, "Sending PLI_WRITE_TH_XCC_REG ");
      break;
    case(PLI_WRITE_TH_REG_HI) :
       cWritemon ("socket", MON_INFO, "Sending PLI_WRITE_TH_REG ");
      break;  
    case(PLI_RETRY) :  
        cWritemon ("socket", MON_INFO, "Sending ReTry remained-data(%0d)\n",  sock->num);
      break;
    case(PLI_IHWTW) : cWritemon ("socket", MON_INFO, "Sending IHWTW ");
      break;
    case(PLI_DHWTW) : cWritemon ("socket", MON_INFO, "Sending DHWTW ");
      break;
    case(PLI_ITLBREAD) : cWritemon ("socket", MON_INFO, "Sending ITLBREAD ");
      break;
    case(PLI_DTLBREAD) : cWritemon ("socket", MON_INFO, "Sending DTLBREAD  ");
      break;
    case(PLI_ITLBWRITE) : cWritemon ("socket", MON_INFO, "Sending ITLBWRITE ");
      break;
    case(PLI_DTLBWRITE) : cWritemon ("socket", MON_INFO, "Sending DTLBWRITE ");
      break;
    case(PLI_ITLBPROBE) : cWritemon ("socket", MON_INFO, "Sending ITLBPROBE ");
      break;
    case(PLI_MEM_ST_ISSUE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_ST_ISSUE "); break;
    case(PLI_MEM_ST_L2_COMMIT): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_ST_L2_COMMIT "); break;
    case(PLI_MEM_ST_INV): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_ST_INV "); break;
    case(PLI_MEM_ST_UPDATE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_ST_UPDATE "); break;
    case(PLI_MEM_ST_ACK): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_ST_ACK "); break;
    case(PLI_MEM_LD_ISSUE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_LD_ISSUE "); break;
    case(PLI_MEM_LD_DATA): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_LD_DATA "); break;
    case(PLI_MEM_LD_FILL): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_LD_FILL "); break;
    case(PLI_MEM_EVICT): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_EVICT "); break;
    case(PLI_MEM_EVICT_INV): 
        cWritemon ("socket", MON_INFO, "Sending PLI_MEM_EVICT_INV "); break;
    case(PLI_INT_INTP): 
        cWritemon ("socket", MON_INFO, "Sending PLI_INT_INTP "); break;
    case(PLI_ASR_WRITE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_ASR_WRITE "); break;
    case(PLI_ASI_WRITE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_ASI_WRITE "); break;
    case(PLI_ASI_READ): 
        cWritemon ("socket", MON_INFO, "Sending PLI_ASI_READ "); break;
    case(PLI_CMP_WRITE): 
        cWritemon ("socket", MON_INFO, "Sending PLI_CMP_WRITE "); break;
    case(PLI_ASR_READ): 
        cWritemon ("socket", MON_INFO, "Sending PLI_ASR_READ "); break;
    default: cDispmon ("socket", MON_INFO, "Unknown message %x\n", cmd_buf[0]);
    } // }}}

    for(num = 1; num < tf_nump(); num++) {
        size = tf_sizep(num+1);
        groups = (size+7)/8;
        if (debug_socket) 
            cWritemon ("socket", MON_DEBUG, " Parm(%d)[%db=%dB] = ", 
                    num, size,groups);
        if (size > 32) {
            word = tf_getlongp(&hword, num+1);
            longword = hword; longword <<= 32; longword |= word;
            for (i=groups; i>0;i--) {
                cmd_buf[ind] = (longword >> ((i-1)*8)) & 0xff;
                if (debug_socket)
                    cWritemon ("socket", MON_DEBUG, "%02x", (unsigned char)cmd_buf[ind]);
#ifndef USE_FPRINTF
                if (nas_trace) write(nas_fd, &cmd_buf[ind], 1);
#else
                if (nas_trace) fprintf(nas_fd, "%02x", (unsigned char) cmd_buf[ind]);
#endif
                ind++;
            }
        } else {
            word = tf_getp(num+1);
            for (i=groups; i>0;i--) {
                cmd_buf[ind] = (word >> ((i-1)*8)) & 0xff;
                if (debug_socket)
                    cWritemon ("socket", MON_DEBUG, "%02x", (unsigned char)cmd_buf[ind]);
#ifndef USE_FPRINTF
                if (nas_trace) write(nas_fd, &cmd_buf[ind], 1);
#else
                if (nas_trace) fprintf(nas_fd, "%02x", (unsigned char) cmd_buf[ind]);
#endif
                ind++;
            }
        }

    }
  if (debug_socket) cWritemon ("socket", MON_DEBUG, "\n");
  

  if(cmd_buf[0] == PLI_RTL_CYCLE){//send rtl cycle
    num = tf_getp(2);
    for(ind = 0; ind < num;ind++)cmd_buf[ind] = PLI_RTL_CYCLE;
  }
  if(cmd_buf[0] == PLI_RTL_DATA){
    tf_nodeinfo(2, &node_info);
    ind        = 1;
    for(groups = (node_info.node_ngroups - 1); groups >= 0; groups--){
      word   = node_info.node_value.vecval_p[groups].avalbits;
      cmd_buf[ind]   = (word >> 24) & 0xff;
      cmd_buf[ind+1] = (word >> 16) & 0xff;
      cmd_buf[ind+2] = (word >> 8)  & 0xff;
      cmd_buf[ind+3] = word & 0xff;
      ind += 4;
    }
  }
  if(cmd_buf[0] == PLI_RETRY)ind = 0;
  if(cmd_buf[0] == PLI_QUIT){
    sock->num = 0;
    if(sock->active->head_ptr)sock->active->head_ptr = 0;
#ifndef USE_FPRINTF
    if (nas_trace) close(nas_fd);
#else
    if (nas_trace) fclose(nas_fd);
#endif
  }
  handle_buf(cmd_buf, ind);
  return 0;
}

