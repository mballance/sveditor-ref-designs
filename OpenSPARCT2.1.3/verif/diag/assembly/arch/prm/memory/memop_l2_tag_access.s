/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_l2_tag_access.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define L2_TAG_ARRAY_BASE_ADDR 0xa400000000

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Until the simulation evniorment gets updated to initialize
	! the tag array in L2$, do it myself.

init0:
	setx	L2_TAG_ARRAY_BASE_ADDR, %g1, %o0	! address to init.
	set	0x40, %g3				! Increment
	set	8, %g4					! # lines to initialize

initloop:
	call    init_l2_line
	sub	%g4, 1, %g4
	cmp	%g4, 0
	bne	initloop
	add	%o0, %g3, %o0

init1:
	setx	L2_TAG_ARRAY_BASE_ADDR, %g1, %o0	! address to init.
	setx	0x00200, %g1, %g3	! increment to get next set
	setx	0x3fe00, %g1, %g4
	add	%o0, %g4, %g4		! addr for last set in bank 0

initloop1:
	call    init_l2_line
	nop
	cmp	%o0, %g4
	bne	initloop1
	add	%o0, %g3, %o0

	! Done with initialization


	! Check first word in each bank of the L2 tag array.

	setx	L2_TAG_ARRAY_BASE_ADDR, %g1, %g2
bank0:
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank1:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank2:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank3:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank4:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank5:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank6:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync
bank7:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	membar #Sync
	stx	%l0, [%g2]
	membar #Sync

	! Check first word in each set of bank 0 of the L2 tag array.
sets:	
	setx	L2_TAG_ARRAY_BASE_ADDR, %g1, %g2
	setx	0x00200, %g1, %g3	! increment to get next set
	setx	0x3fe00, %g1, %g4
	add	%g2, %g4, %g4		! addr for last set in bank 0
setloop:
	ldx	[%g2], %l1
	stx	%l1, [%g2]
	cmp	%g2, %g4
	bne	setloop
	add	%g2, %g3, %g2

	! Check first word in each way of set 0, bank 0 of the L2 tag array.
ways:
	setx	L2_TAG_ARRAY_BASE_ADDR, %g1, %g2
	setx	0x040000, %g1, %g3	! increment to get next way
	setx	0x3c0000, %g1, %g4
	add	%g2, %g4, %g4		! addr for last way in bank 0, set 0
wayloop:
	ldx	[%g2], %l1
	stx	%l1, [%g2]
	cmp	%g2, %g4
	bne	wayloop
	add	%g2, %g3, %g2

	ba	test_passed
	nop

/**********************************************************************
 *  Common code.
 *********************************************************************/

        ! Assumes that %o0 contains VA that maps to L2$ line to be initialized.
        ! This is done by doing 16 stores from different addresses that alias
        ! to that line.

init_l2_line:
        setx    0x3ffff, %o1, %o2
        and     %o0, %o2, %o3
        setx    alias1, %o1, %o4
        ldx     [%o3+%o4], %g0
	setx	0x40000, %o1, %o5
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %g0
	add	%o4, %o5, %o4
        ldx     [%o3+%o4], %o4
	membar	#Sync
	and	%o4, %o3, %g0
        jmpl    %o7+0x8, %g0
        nop


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=0x70000000
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global single_data
.global double_data
.global zero_data
.global block_data
.global result_area
.global alias1
.global alias2
.global alias3
.global alias4
.global alias5
.global alias6
.global alias7
.global alias8
.global alias9
.global alias10
.global alias11
.global alias12
.global alias13
.global alias14
.global alias15
.global alias16

user_data_start:
zero_data:
        .xword 0x0000000000000000
        .align  256

        .align  0x40000         ! each 246kb, 0x40000, aliases to same L2$ line
alias1:
        .skip   1024
        .align  0x40000
alias2:
        .skip   1024
        .align  0x40000
alias3:
        .skip   1024
        .align  0x40000
alias4:
        .skip   1024
        .align  0x40000
alias5:
        .skip   1024
        .align  0x40000
alias6:
        .skip   1024
        .align  0x40000
alias7:
        .skip   1024
        .align  0x40000
alias8:
        .skip   1024
        .align  0x40000
alias9:
        .skip   1024
        .align  0x40000
alias10:
        .skip   1024
        .align  0x40000
alias11:
        .skip   1024
        .align  0x40000
alias12:
        .skip   1024
        .align  0x40000
alias13:
        .skip   1024
        .align  0x40000
alias14:
        .skip   1024
        .align  0x40000
alias15:
        .skip   1024
        .align  0x40000
alias16:
        .skip   1024

user_data_end:
.end



