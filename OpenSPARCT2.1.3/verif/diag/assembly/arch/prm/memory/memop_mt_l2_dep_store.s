/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_mt_l2_dep_store.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#ifndef SYNC_THREADS
#define SYNC_THREADS	0xff
#endif

#include "hboot.s"
#include "asi_s.h"
#include "nmacros.h"

/****************************************************************
* Objective:
* Macro used by one main thread to sync up with any other running
* threads, uses parking as the method to accomplish this.
* 
* Syntax:
* SYNC_THREAD_MAIN(
*       unpark_value, exit_label, tmp_reg_1, tmp_reg_2, tmp_reg_3
*       )
* 
* Args:
*    unpark_value       -> value to write to CMP_CORE_RUNNING_W1S
*                          to unpark the other threads, 1 bit/thread
*    exit_label         -> label to branch to on timeout
*    tmp_reg_1/2/3      -> temporary registers
* 
* Expectation from macro user:
* The macro SYNC_THREAD_OTHER will be used in the other thread's code.
* These two macros work together to accomplish the synchronization.
* NOTE that these macros assume that the other threads have already
* been started.
*/

define(SYNC_THREAD_MAIN,`
        setx    ASI_CMP_CORE_RUNNING_STATUS, $3, $4
        setx    0x400, $3, $5
1:
        subcc   $5, 1, $5
        brz     $5, $2
        nop
        ldxa    [$4] ASI_CMP_CORE, $3
        membar  #Sync
        subcc   $3, 0x1, $3
        brnz    $3, 1b
        nop

        setx    $1, $3, $4
        setx    ASI_CMP_CORE_RUNNING_W1S, $3, $5
        stxa    $4, [$5] ASI_CMP_CORE
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
      membar	#Sync
      ')

	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Initialize the global registers.
	mov	%g0, %g1	
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	ta	T_RD_THID
	cmp	%o1, 0x0
	be	main_t0
	nop
	ba	main_t1_to_t63
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

main_t0:

	! Sync up all the treads.

	SYNC_THREAD_MAIN( SYNC_THREADS, test_failed, %g1, %g2, %g3 )

	! Bring data of all 1's into a L2 cache line
test1_t0:
	setx	dep_store_addr, %g1, %g2
	ldx	[%g2], %l0
	membar	#Sync

	! Do byte stores into that same L2 cache line.
	! Data = 0, 1, 2, 3, ..., 63

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

storeloop_t0:
	stb	%g1, [%g3]
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	storeloop_t0
	add	%g3, 1, %g3

	! Do byte reads from that same L2 cache line
	! Check the data read.

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

readloop_t0:
	ldub	[%g3], %l1
	cmp	%l1, %g1
	bne	test_failed
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	readloop_t0
	add	%g3, 1, %g3

	ba	test_passed
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 1 Start
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

main_t1_to_t63:	

	! Sync up the treads.

	SYNC_THREAD_OTHER( %o1,%g1,%g2 )
	
	! Bring data of all 1's into a L2 cache line
test1_t1_t63:
	setx	dep_store_addr, %g1, %g2
	ldx	[%g2], %l0
	membar	#Sync

	! Do byte stores into that same L2 cache line.
	! Data = 0, 1, 2, 3, ..., 63

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

storeloop_t1_t63:
	stb	%g1, [%g3]
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	storeloop_t1_t63
	add	%g3, 1, %g3

	! Do byte reads from that same L2 cache line
	! Check the data read.

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

readloop_t1_t63:
	ldub	[%g3], %l1
	cmp	%l1, %g1
	bne	test_failed
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	readloop_t1_t63
	add	%g3, 1, %g3

	ba	test_passed
	nop

/**********************************************************************
 *  Common code.
 *********************************************************************/

test_passed:
	EXIT_GOOD
	nop

test_failed:
	EXIT_BAD
	nop
user_text_end:	

/************************************************************************
 *  Test case data start
 ************************************************************************/
	.align	8192
.data
user_data_start:
	.xword 0x00000000
	.xword 0x00000000
	.xword 0x00000000
	.xword 0x00000000
dep_store_addr:	
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
	.xword 0xffffffff
.end



