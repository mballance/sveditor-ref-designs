/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cmp_macros.h
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
#ifndef ALREADY_INCLUDED_CMP_MACROS_DOT_H
#define ALREADY_INCLUDED_CMP_MACROS_DOT_H


#ifndef SYNC_THREADS
#define SYNC_THREADS    0xff
#endif


/****************************************************************
* Objective:
* Macro used by one main thread to sync up with any other running
* threads, uses parking as the method to accomplish this.
* 
* Syntax:
* SYNC_THREAD_MAIN(
*       exit_label, tmp_reg_1, tmp_reg_2, tmp_reg_3
*       )
* 
* Args:
*    exit_label         -> label to branch to on timeout
*    tmp_reg_1/2/3      -> temporary registers
* 
* Expectation from macro user:
* The macro SYNC_THREAD_OTHER will be used in the other thread's code.
* These two macros work together to accomplish the synchronization.
* NOTE that these macros assume that the other threads have already
* been started.
*
* Also SYNC_THREADS needs to be defined to indicate which threads are
* to be used.  It has a default of 0xff.
*/

define(SYNC_THREAD_MAIN,`
        setx    ASI_CMP_CORE_RUNNING_STATUS, $2, $3
        setx    0x400, $2, $4
1:
        subcc   $4, 1, $4
        brz     $4, $1
        nop
        ldxa    [$3] ASI_CMP_CORE, $2
        membar  #Sync
        subcc   $2, 0x1, $2
        brnz    $2, 1b
        nop

        setx    SYNC_THREADS, $2, $3
        setx    ASI_CMP_CORE_RUNNING_W1S, $2, $4
        stxa    $3, [$4] ASI_CMP_CORE
        membar  #Sync
      ')


/****************************************************************
* Objective:
* Macro used other threads to sync up with a main thread, uses
* parking as the method to accomplish this.
* 
* Syntax:
* SYNC_THREAD_OTHER(
*       thread_id, tmp_reg_1, tmp_reg_2
*       )
* 
* Args:
*    thread_id          -> register containing thread id # for this tread
*    tmp_reg_1/2        -> temporary registers
* 
* Expectation from macro user:
* The macro SYNC_THREAD_OTHER will be used in the code for any thread
* except thread 0.  Works with the SYNC_THREAD_MAIN macro.  These two
* macros work together to accomplish the synchronization.
*/

define(SYNC_THREAD_OTHER,`
      setx      ASI_CMP_CORE_RUNNING_W1C, $2, $3
      set       0x1, $2
      sllx      $2, $1, $2
      stxa      $2, [$3] ASI_CMP_CORE
      membar    #Sync
      ')



/* following endif needs to be at very bottom  -- 6/7/05  */
#endif
