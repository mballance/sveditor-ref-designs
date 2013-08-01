/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_1215htraps1.s
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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define H_HT0_HTrap_Instruction_0 
#define My_HT0_HTrap_Instruction_0 \
    rdpr    %tt, %g5; \
    rdpr    %pstate, %g6; \
    rdhpr   %hpstate, %g7; \
    done; \
    nop;

#define My_RED_Mode_Other_Reset \
    rdhpr   %htstate, %g1; \
    rdpr    %tstate, %g2; \
    rdpr    %tpc, %g3; \
    rdpr    %tnpc, %g4; \
    rdpr    %tt, %g5; \
    rdpr    %pstate, %g6; \
    rdhpr   %hpstate, %g7; \
	wrpr	%g0, 1, %tl ; \
	wrhpr	%g1, %htstate ; \
	wrpr	%g2, %tstate ; \
	wrpr	%g3, %tpc ; \
	wrpr	%g4, %tnpc ; \
	retry ;\
    nop;

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    rdpr    %tt, %g5; \
    rdpr    %pstate, %g6; \
    rdhpr   %hpstate, %g7; \
    rdhpr   %htstate, %g1; \
    wrhpr %g1, 5, %htstate; \
    done; \
    nop;

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV

set_maxtl:
    wrpr %g0, 0x6, %tl

    ta T_CHANGE_PRIV            ! Should cause Watchdog_reset trap

set_maxtl_minus1:
    wrpr %g0, 0x5, %tl

take_htrap:
    ta 0x90                     ! Should cause htrap to RED state
                                ! because TL = MAXTL -1
set_tlz:
    ta T_CHANGE_HPRIV
    wrhpr %g0, 5, %hpstate

    ta T_CHANGE_NONHPRIV         ! Return should cause tlz trap ?


    
done:
	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end

