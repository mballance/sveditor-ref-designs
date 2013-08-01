/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pepintx.s
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
#define DBG_CONFIG_PA 0x8600000000
#define DBG_REPEAT_VAL 0x8000000000000005

#ifndef DMAEPTADDR
#define DMAEPTADDR 0x0
#endif

#ifndef DMAEPTCNT
#define DMAEPTCNT 0x0
#endif

! Pick a value that pauses some, but not for the full duration of
! the operation. I think the value below is about one quarter of
! the full operation with four engines running.                        
#ifndef DMAEPTPAUSE
#define DMAEPTPAUSE ((DMAEPTCNT*4)/4)
#endif

#ifndef DMAEPTENGCNT
#define DMAEPTENGCNT 1
#endif
        
#define DMAEPTMWTO ((DMAEPTCNT/0x500)*DMAEPTENGCNT)+2
#define DMAEPTMRTO (DMAEPTCNT/0x140)+2
        
#include "hboot.s"
#include "pep_util.s"
                
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta      T_CHANGE_HPRIV
        nop

thread_0:
!
! Thread 0 Start
!

        setx   DMAEPTENGCNT, %l0, %l1 ! Initial engine number 
Setup:
        setx    DMAEPTADDR, %l0, %o1
        setx    0x6990, %l0, %o2
        setx    0x10000, %l0, %o3 ! Generate INT A interrupt at the end
        setx    0x0, %l0, %o4 ! Packet size of 0, hope this works.
        call    SetupDMA
        mov     %l1, %o0 ! Engine number

        ! Now start an MW
        setx   DMAEPTENGCNT, %l0, %l1 ! Initial engine number
        setx    0x02000000 + DMAEPTCNT, %l0, %o1 ! MW by device
Start:
        call    InitiateDMA
        mov     %l1, %o0 ! Engine number

        ! Now wait for engine to finish
        setx   DMAEPTENGCNT, %l0, %l1 ! Initial engine number
        setx   DMAEPTMWTO, %l0, %o1
Wait:
        call    WaitOnDMA
        mov     %l1, %o0 ! Engine number
        brnz    %o0, test_failed
                
test_passed:
        EXIT_GOOD
        nop
        
test_failed:
        EXIT_BAD
        nop
