/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: watchdog_reset_handler.s
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
	mov	0xf, %g1
	stxa	%g1, [%g0] ASI_LSU_CTL_REG
	stxa	%g0, [%g0] ASI_ERROR_INJECT
	! Read (H)PSTATE/PC/nPC from Trap Stack @maxtl
	rdhpr	%htstate, %g1
	rdpr	%tstate, %g2
	rdpr	%tpc, %g3
	rdpr	%tnpc, %g4
	! Lower the Trap Level
	wrpr	%g0, 1, %tl
	! Write (H)PSTATE/PC/nPC to Trap Stack @new TL
	wrhpr	%g1, %htstate
	wrpr	%g2, %tstate
	wrpr	%g3, %tpc
	wrpr	%g4, %tnpc
	retry
