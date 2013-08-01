/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mod_arith_int_1215_0x3d.s
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

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d  	andcc	%l1, %l2, %l1 ;  \
	bne,pn %xcc,	test_fail1 ;  \
	nop			;  \
	EXIT_GOOD		;  \
test_fail1:	EXIT_BAD

#include "hboot.s"

.text
.global main  

main:

	ta T_CHANGE_HPRIV

	!# Write bit 9 of MACTL (causes interrupt upon completion)
	!# 21:0 == 00 0010 0000 0000 0011 1111
	!# 20:18 TID == 0
	!#    17 cause interrupt
	!# 12:08 modular addition (1001)
	!# 12:08 load MA mem      (0000)
	!# 07:00 length = 63

        wr %g0, 0x40, %asi
	setx	0x2003f, %g1, %g3
	stxa	%g3, [%g0 + 0x80] %asi

	!# setup mask to check busy bit
	or	%g0, 0x1, %l2
	sllx	%l2, 16, %l2

	#! Try MA_SYNC operation...
wait1:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	!# since disrupting interrupting on complete, TPC should point to
	!# instruction below or a later one. Copy this to the trap handler.
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	test_fail
	nop
		

	nop

	EXIT_BAD
	
/*******************************************************
 * Exit code
 *******************************************************/

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data
