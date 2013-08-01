/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: checkp.h
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
#define CHECKPOINT_HACKS
#if 1  /* def N1_setup*/
#define OBP_TOP_COPY_BASE 0x1d0000000
#define OBP_TOP_BASE       0x46000000
#define OBP_TOP_COPY_LENGTH 0x2000000
#define DUMP_BASE_ADDR 0x180800000
#define PA_DUMP_AREA   0x180c00000
#define PA_DUMP_FLAGS_AREA   0x180d00000
#define SRC_ADDR       0x000100000
#define DST_ADDR       0x190100000
#else                    0x4000000
#define OBP_TOP_COPY_BASE 0x1deff0000
#define OBP_TOP_BASE    0x1feff0000
#define DUMP_BASE_ADDR 0x0c0000000
#define PA_DUMP_AREA   0x0c0c00000
#define PA_DUMP_FLAGS_AREA   0x0c0d00000
#define SRC_ADDR       0x000000000
#define DST_ADDR       0x018000000
#endif

/* #define NUM_THREADS 1 */
/* #define MAX_THREADS 28 */
#define OBP_MEM 2047
#define HV_MEM 128
#define MEM_SIZE ((OBP_MEM+HV_MEM)*1024*1024)
#define N_BLOCKS (MEM_SIZE/0x2000)
#define N_BLOCK_WORDS (N_BLOCKS/64)


#define        LOG_ADDR_FOR_CHECKP(pa, len, scr, scr1, scr2) \
  setx PA_DUMP_AREA, scr, scr1                                             ;\
  srlx pa, 19, scr/*# of 8k pages from base  */                        ;\
  sllx scr, 3, scr                                                      ;\
  add scr1, scr, scr1                                                   ;\
  srlx len, 13, len                                                     ;\
 /*put a bit mask of page flags within 64 bit word that are modified*/  \
  subcc %g0, 1, scr2 /*assume all      */                               ;\
  subcc len, 1, %g0                                                     ;\
  move %icc, 1, scr2      /*only 1 bit if 8k page  */                   ;\
  subcc len, 8, %g0                                                     ;\
  move  %icc, 0xff, scr2   /*only 8 bits if 64k page  */                ;\
  srlx pa, 13, pa                                                       ;\
  and pa, 0x3f, scr /*shift mask to correct position */                 ;\
  sllx scr2, scr, scr2                                                  ;\
  ldx [scr1], scr   /*or in new page bits           */                  ;\
  or scr,scr2,scr                                                       ;\
  subcc len, 8, %g0                                                     ;\
  ble 1f                                                                ;\
  stx scr, [scr1]                                                       ;\
/*below only for 4M page size (512 8k pages accessed) */                ;\
  stx scr, [scr1+0x8]                                                   ;\
  stx scr, [scr1+0x10]                                                  ;\
  stx scr, [scr1+0x18]                                                  ;\
  stx scr, [scr1+0x20]                                                  ;\
  stx scr, [scr1+0x28]                                                  ;\
  stx scr, [scr1+0x30]                                                  ;\
  stx scr, [scr1+0x38]                                                  ;\
1:
