/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_hang_cwp.s
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
#define MAIN_PAGE_HV_ALSO
#include "hboot.s"

#ifndef THREADS
#define THREADS 8
#endif

#ifndef LOOPS
#define LOOPS 30
#endif
!SIMS+ARGS: -vcs_run_args=+min_ccx_gnt_delay=500
!SIMS+ARGS: -vcs_run_args=+max_ccx_gnt_delay=1000
! Variable usage
!   %o0, %o1 used in ldd
!   %o2 is location of TID number - local_counter
!        incremented each loop to next line
!   %o3 is thread specific scratch memory location 
!   %o5 is static counter 
!   %o7 is loop count

!   %l1 is my TID

! Algorithm :
!
!   for (loop count) {
!       until ([%o2] == mytid) {st %o1, [%o3], ld [%o3]}
!       increment [%o5]
!       increment [%o2]
!       until ([%o5]==max_thread) {}
!       increment %o2
!       reset [%o2]
!   } 
!
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV

    ldxa [%g0]0x63, %l1             ! my TID
    mov LOOPS, %o7
    setx static_counter, %o0, %o5
    setx thread_scratch, %o0, %o3
    sllx %l1, 6, %o6
    add %o3, %o6, %o3               ! Offset by 2xTID
    setx local_counter , %o0, %o2

    cmp %l1, THREADS-1
    be lone_star
    nop
main_loop:

    ldd [%o2], %o0
wait_for_tid_match:
    st %o1, [%o3]
    ld [%o3], %o4
    cmp %l1, %o0
    bne,a wait_for_tid_match
    ldd [%o2], %o0
    cmp %l1, %o4
    bne,a wait_for_tid_match
    ldd [%o2], %o0

    add %l1, 1, %l2
    st %l2, [%o5]               ! Set [%o5] = tid
    
    add %l1, 1, %l3
    std %l2, [%o2]              ! Set [%o2] = tid
        
    ld [%o5], %o6
wait_for_tid_match2:
    cmp %o6, THREADS-1
    bne,a wait_for_tid_match2
    ld [%o5], %o6
     
      
    add %o2, 0x80, %o2

    dec %o7
    brnz %o7, main_loop
    nop
    nop

    ta T_GOOD_TRAP

    nop
    nop
lone_star:

    mov (LOOPS *5), %g7

lone_loop:
    wrpr 1, %cwp
    rdpr %cwp, %g1
    wrpr 2, %cwp
    rdpr %cwp, %g1
    wrpr 3, %cwp
    rdpr %cwp, %g1
    wrpr 4, %cwp
    rdpr %cwp, %g1
    wrpr 5, %cwp
    rdpr %cwp, %g1
    wrpr 6, %cwp
    rdpr %cwp, %g1
    wrpr 7, %cwp
    rdpr %cwp, %g1
    wrpr 1, %cwp
    rdpr %cwp, %g1
    wrpr 2, %cwp
    rdpr %cwp, %g1
    wrpr 3, %cwp
    rdpr %cwp, %g1
    wrpr 4, %cwp
    rdpr %cwp, %g1
    wrpr 5, %cwp
    rdpr %cwp, %g1
    wrpr 6, %cwp
    rdpr %cwp, %g1
    wrpr 7, %cwp
    rdpr %cwp, %g1
    wrpr 1, %cwp
    rdpr %cwp, %g1
    wrpr 2, %cwp
    rdpr %cwp, %g1
    wrpr 3, %cwp
    rdpr %cwp, %g1
    wrpr 4, %cwp
    rdpr %cwp, %g1
    wrpr 5, %cwp
    rdpr %cwp, %g1
    wrpr 6, %cwp
    rdpr %cwp, %g1
    wrpr 7, %cwp
    rdpr %cwp, %g1
    wrpr 1, %cwp
    rdpr %cwp, %g1
    wrpr 2, %cwp
    rdpr %cwp, %g1
    wrpr 3, %cwp
    rdpr %cwp, %g1
    wrpr 4, %cwp
    rdpr %cwp, %g1
    wrpr 5, %cwp
    rdpr %cwp, %g1
    wrpr 6, %cwp
    rdpr %cwp, %g1
    wrpr 7, %cwp
    rdpr %cwp, %g1

    dec %g7
    brnz %g7, lone_loop
    nop

    nop

    ta T_GOOD_TRAP

.data

static_counter:
.xword 0
.xword 0

thread_scratch:
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0
.xword 0 0

local_counter:
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
.xword 0  0
