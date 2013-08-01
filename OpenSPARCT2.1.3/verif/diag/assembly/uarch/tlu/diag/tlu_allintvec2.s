/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_allintvec2.s
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
    sllx %o1, 8, %o2  ! # vector destnation

    andn %o1, 7, %g1  ! # core ID
    add %o1, 1, %g2   ! # Next TID
    and %g2, 7, %g2   ! # in same core
    or %g2, %g1, %o4  
    sllx %o4, 8, %o4  ! # vector destnation

    
    ta T_CHANGE_HPRIV

    wrpr %g0, %g0, %pstate

    ! Each thread sends itself N loops of
    ! 64 interrupts - to all IDs
    ! While reading the pending and recv registers
    ! within the loop.
    !
    ! Add the values read from pending register and
    ! use it as a signature to store to memory ..

    mov 0x2, %g1    ! g1 = # of loops
    mov %g0, %o5   ! o5 = value sum
    mov 1, %g7     ! g7 For mask
outer:
    dec %g1
    mov 64, %g2    ! g2 = inner counter
inner:
    ldxa [%g0]ASI_INTR_R, %o3
    add %o5, %o3, %o5
    dec %g2
    add %g2,%g1, %o7
    and %o7, 1, %o7
    or %o2, %g2, %g3        ! g3 = my vector
    stxa %g3, [%g0]ASI_INTR_W
    sllx %g7, %g2, %g6      ! g6 = clear mask
    brnz,a %o7, skip
    ldxa [%g0]ASI_INTR_R, %o3
skip:
    or %o4, %g2, %g4        ! g4 = alt vector
    stxa %g4, [%g0]ASI_INTR_W
    add %o5, %o3, %o5

    brnz,a %g2, inner
    nop

inner1:
    ldxa [%g0]ASI_INTR_R, %o3
    add %o5, %o3, %o5
    inc %g2
    add %g2,%g1, %o7
    and %o7, 1, %o7
    or %o2, %g2, %g3        ! g3 = my vector
    stxa %g3, [%g0]ASI_INTR_W
    sllx %g7, %g2, %g6      ! g6 = clear mask
    brnz,a %o7, skip1
    ldxa [%g0]ASI_INTR_R, %o3
skip1:
    or %o4, %g2, %g4        ! g4 = alt vector
    stxa %g4, [%g0]ASI_INTR_W
    add %o5, %o3, %o5

    cmp %g2, 64
    bne,a inner1
    nop

    brnz,a %g1, outer
    nop

done:
    setx user_data_start, %g1, %g2
    stx %o5, [%g2+%o2]
    nop
    ta T_GOOD_TRAP

.data
user_data_start:
.xword 0x0
