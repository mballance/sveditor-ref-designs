/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hboot_init.s
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
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 1, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 2, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 3, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 0, %gl

	mov	%g0, %r24
	mov	%g0, %r25
	mov	%g0, %r26
	mov	%g0, %r27
	mov	%g0, %r28
	mov	%g0, %r29
	mov	%g0, %r30
	mov	%g0, %r31

	! get maxwin
!	rdhpr	%ver, %g1
	.word	0x83498000
	sllx	%g1, 59, %g1
	srlx	%g1, 59, %g1
reg_init_loop:
	wrpr	%g1, %cwp
	mov	%g0, %r8
	mov	%g0, %r9
	mov	%g0, %r11
	mov	%g0, %r12
	mov	%g0, %r13
	mov	%g0, %r14
	mov	%g0, %r15
	mov	%g0, %r16
	mov	%g0, %r17
	mov	%g0, %r18
	mov	%g0, %r19
	mov	%g0, %r20
	mov	%g0, %r21
	mov	%g0, %r22
	mov	%g0, %r23
	brnz	%g1, reg_init_loop
	sub	%g1, 1, %g1

	wrpr	%g0, %cwp

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear icache/dcache valid
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	mov	0x3, %g1
	sllx	%g1, 16, %g1
	mov	0x1, %g3
	sllx	%g3, 16, %g3
icache_init_loop1:
	mov	0x7f, %g2
	sllx	%g2, 6, %g2
icache_init_loop2:
	stxa	%g0, [%g1+%g2] 0x67	! ASI_ICACHE_TAG
	brnz	%g2, icache_init_loop2
	sub	%g2, 0x40, %g2

	brnz	%g1, icache_init_loop1
	sub	%g1, %g3, %g1

	mov	0x1ff, %g1
	sllx	%g1, 4, %g1
dcache_init_loop:
	stxa	%g0, [%g0+%g1] 0x47	! ASI_DCACHE_TAG
	brnz	%g1, dcache_init_loop
	sub	%g1, 0x10, %g1

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear itlb/dtlb valid
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	stxa	%g0, [%g0] 0x60		! ASI_ITLB_INVALIDATE_ALL
	mov	0x8, %g1
	stxa	%g0, [%g0 + %g1] 0x60	! ASI_DTLB_INVALIDATE_ALL

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear L2 vuad
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        setx    0xa600000000, %g1, %g2
        setx    0xa600100000, %g1, %g3
	mov	0x1ff, %g1
	sllx	%g1, 7, %g1
	mov	0x1, %g4
	sllx	%g4, 7, %g4
l2_init_loop:
        stx     %g0, [%g2 + %g1]
        stx     %g0, [%g3 + %g1]
	brnz	%g1, l2_init_loop
	sub	%g1, %g4, %g1

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! SPU?
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! DRAM init provided by Rakesh/Sumti
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        setx    0x9700000000, %l7, %l0
        setx    0x0130, %l7, %l1
        setx    0x1000, %l7, %l2
        setx    0x1, %l7, %l3
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        setx    0x0108, %l7, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        setx    0x0218, %l7, %l1
        setx    0xf, %l7, %l3
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
        add     %l1, %l2, %l1
        stx     %l3, [%l0+%l1]
