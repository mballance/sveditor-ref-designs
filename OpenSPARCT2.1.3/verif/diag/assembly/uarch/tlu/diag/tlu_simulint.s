/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_simulint.s
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
#define CREGS_PIL 0

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    rdhpr %hpstate, %l3;\
    and %l3, 0xfa, %l3;\
    wrhpr %l3, 0, %htstate;\
    retry

#define H_HT0_Trap_Instruction_0
#define My_HT0_Trap_Instruction_0 \
	rdpr %tpc, %g2;\
	rdpr %tnpc, %g3;\
	wrpr %g0, 1, %tl;\
    wrhpr %g0, 1, %htstate;\
	wrpr %g2, 0, %tpc;\
	wrpr %g3, 0, %tnpc;\
    not %g0, %g1;\
	mov CETER_VA, %g4;\
    stxa %g1, [%g4]0x4c;\
    done;

#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler

#include "tlu_custom_intr_handlers.s"
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV
    
    ta T_CHANGE_TO_TL1

disable_intr: 
    rdpr %pstate, %g1
    andn %g1, 2, %g1
    wrpr %g1, %pstate
	mov CETER_VA, %g4
    stxa %g0, [%g4]0x4c

setup_interrupts:

    mov  0xf, %g2
    sllx %g2, 32, %g3
    or %g2, %g3, %g2
    not %g2, %g2
    wr %g2, %g0, %pic
    set 0x1ff8bfff, %g2
    wr %g2, %g0, %pcr
    sllx %o1, 8, %g1
    or %o1, %g1, %g1
    inc %g1
    stxa %g1, [%g0] 0x73
	wr	%g0,	ASI_QUEUE,	%asi
    sllx %g1, 8, %g2
    stxa %g2, [ASI_CPU_MONDO_QUEUE_HEAD]  %asi
	stxa    %g2,  [ASI_DEVICE_QUEUE_HEAD]  %asi
	stxa    %g2,  [ASI_RES_ERROR_QUEUE_HEAD]  %asi
	stxa    %g2,  [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi
    inc %g1
    sllx %g1, 8, %g2
    stxa %g2, [ASI_CPU_MONDO_QUEUE_TAIL]  %asi
	stxa    %g2,  [ASI_DEVICE_QUEUE_TAIL]  %asi
	stxa    %g2,  [ASI_RES_ERROR_QUEUE_TAIL]  %asi
	stxa    %g2,  [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi
    
    not %g0, %g1

    wr %g1, %g0, %softint
    wrhpr %g1, %hintp

    set (1<<31|1<<17|1), %g1
    stxa %g1, [%g0] ASI_ERROR_INJECT
    stx %g0, [%g0]
    stxa %g0, [%g0] ASI_ERROR_INJECT

    ta 0x30

mov 0x0f, %g1
endloop:
    brnz %g1, endloop
    dec %g1

	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C
.end


