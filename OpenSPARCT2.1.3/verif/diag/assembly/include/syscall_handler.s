/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: syscall_handler.s
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
syscall_handler:
	! get tpc/tnpc/tstate and save them
	rdpr	%tpc, %g1
	rdpr	%tnpc, %g2
	rdpr	%tstate, %g3
	stx	%g1, [%g4]	! save tpc
	stx	%g2, [%g4+8]	! save tnpc
	stx	%g3, [%g4+16]	! save tstate
	setx	kernel_syscall, %g1, %g2
	wrpr	%g2, %g0, %tnpc
	sllx	%g3, 59, %g3	! extract cwp from tstate
	srlx	%g3, 59, %g3
	setx	cregs_tstate_r64, %g1, %g2
	srlx	%g2, 5, %g2	! remove cwp from cregs_tstate_r64
	sllx	%g2, 5, %g2
	or	%g3, %g2, %g3
	wrpr	%g3, %g0, %tstate
	
	! get primary/secondary context and save them
	mov	0x8, %g1
	ldxa	[%g1] 0x21, %g2
	stx	%g2, [%g4+24]	! save p context
	stxa	%g0, [%g1] 0x21	! set p context to zero
	
	mov	0x10, %g1
	ldxa	[%g1] 0x21, %g3
	stx	%g3, [%g4+32]	! save s context
	stxa	%g0, [%g1] 0x21 ! set s context to zero

	! go to kernel
	done
	nop	

	
sysret_handler:
	! restore tpc/tnpc/tstate
	ldx	[%g4], %g1	! get tpc
	ldx	[%g4+8], %g2	! get tnpc
	ldx	[%g4+16], %g3	! get tstate
	wrpr	%g1, %g0, %tpc
	wrpr	%g2, %g0, %tnpc
	wrpr	%g3, %g0, %tstate

	! restore primary/secondary context
	mov	0x8, %g1
	ldx	[%g4+24], %g2	! get p context
	stxa	%g2, [%g1] 0x21

	mov	0x10, %g1
	ldx	[%g4+32], %g3	! get s context
	stxa	%g3, [%g1] 0x21

	! return to user
	done
	nop
	
