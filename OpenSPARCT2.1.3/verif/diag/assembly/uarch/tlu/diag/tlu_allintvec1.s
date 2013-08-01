/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_allintvec1.s
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
#define MAIN_PAGE_NUCLEUS_ALSO

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g1, %g3 ;\
    nop; \
    retry;

#include "hboot.s"

.text
.global main
main:

    rdth_id
    and %o1, 7, %o2
    brnz %o2, non0
    andn %o1, 7, %o1     ! %o1 has Core ID
    
    ta T_CHANGE_HPRIV
! Disable all threads (in my core) ..
    mov 0x68, %g1
    mov 0xfe, %g2
#if (MAX_THREADS > 8)
    sllx %g2, %o1, %g2
#endif
    stxa %g2, [%g1]ASI_CMP_CORE

    mov 64, %g1

outer:
    dec %g1
#if (MAX_THREADS > 8)
    mov 64, %g2
#else
    mov 8, %g2
#endif
inner:
    dec %g2
    sllx %g2, 8, %g3
    or %g3, %g1, %g3
    stxa %g3, [%g0]ASI_SWVR_UDB_INTR_W
    brnz,a %g2, inner
    nop
    brnz,a %g1, outer
    nop

done_loops:
! Wake up all threads (in my core) ..
    mov 0x60, %g1
    mov 0xff, %g2
#if (MAX_THREADS > 8)
    sllx %g2, %o1, %g2
#endif
    stxa %g2, [%g1]ASI_CMP_CORE

    ta T_GOOD_TRAP

non0:
    mov  100, %g1
wait:
    brnz %g1, wait
    dec %g1

    ta T_GOOD_TRAP

