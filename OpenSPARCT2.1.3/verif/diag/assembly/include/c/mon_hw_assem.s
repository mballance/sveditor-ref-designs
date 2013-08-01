/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mon_hw_assem.s
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
#ident "@(#)  mon_hw_assem.s  1.11        05/06/28 20:56:27"
#ifdef ISS_VERSION
#define _ASM
#endif

#include <sys/asm_linkage.h>
#include <sys/stack.h>
#include <v9/sys/privregs.h>



	ENTRY( caller )
	retl
	mov     %i7, %o0
	SET_SIZE(caller)

	ENTRY( callee )
	retl
	mov     %o7, %o0
	SET_SIZE(callee)

	ENTRY(getfp)
	retl
	mov     %fp, %o0
	SET_SIZE(getfp)

	ENTRY(getsp)
	retl
	mov     %sp, %o0
	SET_SIZE(getsp)

	ENTRY(getpc)
	retl
	mov     %o7, %o0
	SET_SIZE(getpc)

	ENTRY(geti6)
	retl
	mov     %i6, %o0
	SET_SIZE(geti6)

	ENTRY(geto6)
	retl
	mov     %o6, %o0
	SET_SIZE(geto6)

	ENTRY(geti7)
	retl
	mov     %i7, %o0
	SET_SIZE(geti7)

	ENTRY(geto7)
	retl
	mov     %o7, %o0
	SET_SIZE(geto7)

	ENTRY(getpstate)
	retl
	rdpr    %pstate, %o0
	SET_SIZE(getpstate)

	ENTRY(getcwp)
	rdpr    %cwp, %o0
	nop
	retl
	nop
	SET_SIZE(getcwp)

	ENTRY(getcansave)
	rdpr    %cansave, %o0
	nop
	retl
	nop
	SET_SIZE(getcansave)

	ENTRY(getcanrestore)
	rdpr    %canrestore, %o0
	nop
	retl
	nop
	SET_SIZE(getcanrestore)

	ENTRY(getotherwin)
	rdpr    %otherwin, %o0
	nop
	retl
	nop
	SET_SIZE(getotherwin)

	ENTRY(getcleanwin)
	rdpr    %cleanwin, %o0
	nop
	retl
	nop
	SET_SIZE(getcleanwin)
/*
	ENTRY(membar_sync)
	membar          #Sync
	retl
	nop
	SET_SIZE(membar_sync)
*/
	ENTRY(flushwindows)
	save            %sp, -MINFRAME, %sp
	flushw
	ret
	restore
	SET_SIZE(flushwindows)

	ENTRY(gettba)
	rdpr    %tba, %o0
	retl
	nop
	SET_SIZE(gettba)

	ENTRY(settba)
	wrpr    %o0, %tba
	retl
	nop
	SET_SIZE(settba)

	ENTRY(gettl)
	rdpr    %tl, %o0
	retl
	nop
	SET_SIZE(gettl)

	ENTRY(disable_interrupts)
	rdpr    %pstate, %o0
	andn    %o0, PSTATE_IE | PSTATE_AM, %o0
	wrpr    %o0, %pstate
	retl
	nop
	SET_SIZE(disable_interrupts)

	ENTRY(flushi)
	iflush  %i6
	nop
	nop
	retl
	nop
	SET_SIZE(flushi)

/*
 * ensure fp is on in pstate and fprs
 */

	ENTRY(getfsr)
	rdpr    %pstate, %o5
	or      %o5, PSTATE_PEF, %o1
	wrpr    %o1, %pstate

	rd      %fprs, %o4
	or      %o4, FPRS_FEF, %o1
	wr      %g0,%o1, %fprs

	stx     %fsr, [ %sp + STACK_BIAS - 32]

	! Restore %fprs

	wr      %g0,%o4, %fprs

	! restore pstate

	wrpr    %o5, %pstate
	retl
	ldx     [%sp + STACK_BIAS - 32], %o0
	SET_SIZE(getfsr)

	ENTRY(getfprs)
	retl
	rd      %fprs, %o0
	SET_SIZE(getfprs)


	ENTRY(gettick)
	retl
	rd      %tick, %o0
	SET_SIZE(gettick)

	ENTRY(getsys_tick)
	retl
#if defined(BW_CPU) || defined(N2_CPU)
	mov     %g0, %o0
!       rdasr   %stick_reg, %o0
#else
	rd      %sys_tick, %o0
#endif
	SET_SIZE(getsys_tick)







/* end of assem.s */





