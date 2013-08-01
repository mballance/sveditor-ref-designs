/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_107450.s
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

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] 0x74, %g3 ;\
    rd %tick, %g5;\
    stxa %g5, [%g0] 0x72;\
    ldxa    [%g0] 0x74, %g3 ;\
    retry;

#include "hboot.s"

.global main
.text
main:

    rdth_id

    brz %o1, thread_0
    nop
    cmp %o1, 1
    be thread_1
    nop
    nop

    EXIT_GOOD

thread_0:
    ta T_CHANGE_PRIV
    
    wrpr %g0, 0x16, %pstate


    setx data_start, %r30, %r31

    set 0x100, %r30
loop:
!$EV trig_pc_d(1, expr(@VA(.MAIN.loop) + 0, 16, 16)) -> intp(0,0,0,*,9999,*,*,1)
    nop
loop1:
!$EV trig_pc_d(1, expr(@VA(.MAIN.loop1) + 0, 16, 16)) -> intp(0,0,4,*,9999,*,*,1)
    nop
loop2:
!$EV trig_pc_d(1, expr(@VA(.MAIN.loop2) + 0, 16, 16)) -> intp(0,0,8,*,9999,*,*,1)
    nop
loop3:
!$EV trig_pc_d(1, expr(@VA(.MAIN.loop3) + 0, 16, 16)) -> intp(0,0,16,*,9999,*,*,1)
    sub %r30, 1, %r30
loop4:
!$EV trig_pc_d(1, expr(@VA(.MAIN.loop4) + 0, 16, 16)) -> intp(0,0,24,*,9999,*,*,1)
    brnz %r30, loop


    EXIT_GOOD

thread_1:
    ta T_CHANGE_HPRIV
    setx loop, %r27, %r28
    
#ifdef TG_SEED
    setx TG_SEED, %g1, %g2
    wrpr %g0, %g2, %tick 
#endif

loop8:
    rd %tick, %g1
    and %g1, 0x3f, %g1
    stxa %g1, [%g0]0x73
    ld [%r28], %g1
    ba loop8
    nop

.align 128
.data
data_start:
.xword 0x0

