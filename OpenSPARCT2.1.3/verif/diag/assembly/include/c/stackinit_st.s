/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: stackinit_st.s
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
#include "defines.h"

#define SP_OFFSET (STACKSIZE-4095)
#define INIT_LOCAL_REGS				\
	set 0x0, %l0;				\
	set 0x0, %l1;				\
	set 0x0, %l2;				\
	set 0x0, %l3;				\
	set 0x0, %l4;				\
	set 0x0, %l5;				\
	set 0x0, %l6;				\
	set 0x0, %l7;				\
	set 0x0, %i0;				\
	set 0x0, %i1;				\
	set 0x0, %i2;				\
	set 0x0, %i3;				\
	set 0x0, %i4;				\
	set 0x0, %i5;				\
	set 0x0, %i6;				\
	set 0x0, %i7;

	
.section .text
.align 4
.global c_start
	
c_start:

! register init - avoid mismatches in spill/fill traps
	
	ta              T_CHANGE_PRIV
	
	wrpr            %g0, 0, %cwp
        INIT_LOCAL_REGS
	wrpr            %g0, 1, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 2, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 3, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 4, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 5, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 6, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 7, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 0, %cwp
	
	ta		T_CHANGE_NONPRIV



! set up stack
        setx    stacklocs, %l5, %l0
        ldx     [%l0], %sp

! call main
	
        call    main
        nop

	brnz	%o0, c_fail
	nop
	
        ta      T_GOOD_TRAP
        nop

c_fail:
	ta	T_BAD_TRAP
	nop

	

/*	
stack0:
	.skip STACKSIZE
	*/

.section .data

.align 16
.global stacklocs
stacklocs:      
        .xword  stack0+SP_OFFSET
