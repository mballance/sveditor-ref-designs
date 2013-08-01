/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_cpx_fill_io_8b.s
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
#define PSTATE_CLE_MASK	0x200
#define PSTATE_TLE_MASK	0x100
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define PART0_NZ_RANOTPA_1 0
#define PART0_Z_RANOTPA_1 0
#define DISABLE_PART_LIMIT_CHECK
#define SKIP_TRAPCHECK
# 444 "diag.j"
# include "hboot.s"
.text
.global main

main:

main_text_start:
    setx MEM_DATA3_START, %r4, %r10
    setx IOPRI_DATA0_START, %r4, %r31
# 466 "diag.j"
    and %r10, 0xfffffffffffff000, %r10
    ldswa [%r10]0x80, %r1
    add %r10, 0x40,  %r19
    ldswa [%r19]0x80, %r1
    add %r10, 0x80,  %r20
    ldswa [%r20]0x80, %r1
    add %r10, 0xc0,  %r21
    ldswa [%r21]0x80, %r1
    add %r10, 0x100, %r22
    ldswa [%r22]0x80, %r1
    add %r10, 0x140, %r25
    ldswa [%r25]0x80, %r1
    add %r10, 0x180, %r27
    ldswa [%r27]0x80, %r1
    add %r10, 0x1c0, %r30
    ldswa [%r30]0x80, %r1

    mov 0x80, %g1
    wr %g1, %g0, %asi
# 488 "diag.j"
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffffffffffff; target strm = 0x1               
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2               
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4               
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8               
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10              
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20              
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40              
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80              
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
	call call_label_40_0
.align 0x20
call_label_40_0:
     b 0f
     nop
.align 0x20
0:
     b 1f
     nop
.align 0x20
1:
     b 2f
     nop
.align 0x20
2:
     b 3f
     nop
.align 0x20
3:
     b 4f
     nop
.align 0x20
4:
     b 5f
     nop
.align 0x20
5:
     b 6f
     nop
.align 0x20
6:
     b 7f
     nop
.align 0x20
7:
     b 8f
     nop
.align 0x20
8:
     b 9f
     nop
.align 0x20
9:
     //jmpl %r15 + 4, %r0
	 return %r15
     nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
	call call_label_10_0
.align 0x20
call_label_10_0:
     b 0f
     nop
.align 0x20
0:
     b 1f
     nop
.align 0x20
1:
     b 2f
     nop
.align 0x20
2:
     b 3f
     nop
.align 0x20
3:
     b 4f
     nop
.align 0x20
4:
     b 5f
     nop
.align 0x20
5:
     b 6f
     nop
.align 0x20
6:
     b 7f
     nop
.align 0x20
7:
     b 8f
     nop
.align 0x20
8:
     b 9f
     nop
.align 0x20
9:
     //jmpl %r15 + 4, %r0
	 return %r15
     nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
	call call_label_4_0
.align 0x20
call_label_4_0:
     b 0f
     nop
.align 0x20
0:
     b 1f
     nop
.align 0x20
1:
     b 2f
     nop
.align 0x20
2:
     b 3f
     nop
.align 0x20
3:
     b 4f
     nop
.align 0x20
4:
     b 5f
     nop
.align 0x20
5:
     b 6f
     nop
.align 0x20
6:
     b 7f
     nop
.align 0x20
7:
     b 8f
     nop
.align 0x20
8:
     b 9f
     nop
.align 0x20
9:
     //jmpl %r15 + 4, %r0
	 return %r15
     nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
	stwa %r0, [%r10]0xe2
	stwa %r0, [%r19]0xe2
	stwa %r0, [%r20]0xe2
	stwa %r0, [%r21]0xe2
	stwa %r0, [%r22]0xe2
	stwa %r0, [%r25]0xe2
	stwa %r0, [%r27]0xe2
	stwa %r0, [%r30]0xe2
	stwa %r0, [%r31]0x80
	ldswa [%r31]0x80, %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
	call call_label_1_0
.align 0x20
call_label_1_0:
     b 0f
     nop
.align 0x20
0:
     b 1f
     nop
.align 0x20
1:
     b 2f
     nop
.align 0x20
2:
     b 3f
     nop
.align 0x20
3:
     b 4f
     nop
.align 0x20
4:
     b 5f
     nop
.align 0x20
5:
     b 6f
     nop
.align 0x20
6:
     b 7f
     nop
.align 0x20
7:
     b 8f
     nop
.align 0x20
8:
     b 9f
     nop
.align 0x20
9:
     //jmpl %r15 + 4, %r0
	 return %r15
     nop

join_lbl_0_0:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop
# 581 "diag.j"
main_data_start:
.xword 0xa28cd0a68cb8fcaf
.xword 0xaf365a07f77d3e28
.xword 0x207a0a355c718559
.xword 0xdf3e99fb52092723
.xword 0x5dce345aebb99b9e
.xword 0x3966c05dbed5d40a
.xword 0xf4cd6eabfdf56f28
.xword 0x13ef2535b49a1d92
.xword 0xe67c1cd61b261ca3
.xword 0x17c396fdbe28d2a3
.xword 0x7b9863c2d5f39c85
.xword 0x4ca83006511c612e
.xword 0xeab294a5b7967f93
.xword 0x6239173a7b957327
.xword 0x34d630778258f3cf
.xword 0x0fdbe6a7b4e083d1
.xword 0x0d3e84d4bde0de22
.xword 0x9fd1f1e779072005
.xword 0xf27c57fd8c9f3943
.xword 0x6a3587aa0c35d7e8
.xword 0x2612ce8ca30884c4
.xword 0xfbd5d01473907a97
.xword 0x456988d6bb0c4c8c
.xword 0xdd3ec19202acc1a2
.xword 0x36cb51e18c896886
.xword 0xb978a649546742b7
.xword 0x98aef17047d2b91f
.xword 0xc57f2b348198fe2c
.xword 0x732a26ecad1dadbf
.xword 0x41c74b2d71b94d13
.xword 0x5be2f08ea5019761
.xword 0x0e604af5bd0069ee
.xword 0x59b89cd6ccce5f55
.xword 0x7e278787655f996c
.xword 0xc9ea72e20073ea3e
.xword 0xf0f1beb776c76663
.xword 0xa11cb0ead55676b7
.xword 0xdc88c16731e1d67a
.xword 0xaefe4c4df0143a54
.xword 0x3bf8b1890264a484
.xword 0xa5cc3905b6d3dd6f
.xword 0x5e77134c4cf777bb
.xword 0x1d77914ab9355702
.xword 0xdf193f8eba735b16
.xword 0x09503a0254c34135
.xword 0xf45d080ea71830cd
.xword 0x4b66d04f665f59f1
.xword 0xbf6229409d6cd9f7
.xword 0xe41cb95a0fabd264
.xword 0x1825aff06df441d0
.xword 0x67c894cffe710daa
.xword 0xb58112f3a65063d5
.xword 0x350d217797fb4c2a
.xword 0x64743ca63c0fe364
.xword 0x84435778ebba1750
.xword 0x1453282417cca62c
.xword 0xd01d7b87354ce1a9
.xword 0x7a6a747e270f98bd
.xword 0x35152a75f9604a0b
.xword 0x030fe79e07c0064f
.xword 0x0cd075efe3a04b61
.xword 0x0856d65deb7a2f5e
.xword 0x9846af85dc4a49c4
.xword 0xa0e7e4b538438882
.xword 0x6eacd0fe3b8ab80f
.xword 0x61b57f1acb525341
.xword 0x7cc2b0fd7d9738ac
.xword 0xc2b19f283884c1e6
.xword 0x88905c2e3169fdb8
.xword 0xad6eebed25e74a33
.xword 0x552ccc1293b64602
.xword 0x528ea36a1f34648e
.xword 0xb1d19df2da275ba8
.xword 0xb47e9d80f81c2c4f
.xword 0x2f0722b493e0cf53
.xword 0xb52728672578fbfd
.xword 0x3bbbfa1632bbbe05
.xword 0xe2f451541dc03115
.xword 0xf24793840d79b377
.xword 0xbef9f1861992b36d
.xword 0x36502b5d78ce163a
.xword 0x965b34c188303cc5
.xword 0x45e8288870d1afd7
.xword 0xde1145a106dc5e7a
.xword 0x0206a916904aadd8
.xword 0x89ef00af26ca7259
.xword 0x82fa8e47549ef2a7
.xword 0x28b96a998d3a5e48
.xword 0x167abe570321f6b1
.xword 0xeb7459960a9285ad
.xword 0x3caf38e8b0040782
.xword 0x0d9d7c2aff69651b
.xword 0x72d5542882c3b928
.xword 0x1f8f01046e2b2d19
.xword 0xe609bbc409b06e97
.xword 0x01ea55f3087602eb



SECTION .PRIM_SEG_0 DATA_VA = 0x0000000000c7c000
attr_data {
	Name	 = .PRIM_SEG_0,
	VA	 = 0x0000000000c7c000,
	RA	 = 0x0000000000c7c000,
	PA	 = ra2pa(0x0000000000c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA0_START
MEM_DATA0_START:
.xword 0x9659ede890d928fb

.xword 0x5cbef88c0792fe14

.xword 0x833b6904983ab004

.xword 0x262310e183961a5d

.xword 0xe5fcb116b68ad768

.xword 0xf6118c3833501caf

.xword 0xb8cd693d4a5e4040

.xword 0xed4209093f6f530b

.xword 0xc0d0a3cac5a61923

.xword 0x3bc396550c3051b1

.xword 0x07a4a5cb86e4eb69

.xword 0x0bc6e614733c6f34

.xword 0x47e3f0e3af0f74bb

.xword 0x5ebd62a549f0821a

.xword 0x45456cc17c4c5918

.xword 0x9422b2f6fdf82876

.xword 0x6c00e51720711958

.xword 0x18ebaf166adbdcda

.xword 0xc98006d16e173ac3

.xword 0xd6591c402727d54e

.xword 0xa91ad847f3fd2e48

.xword 0x0f6f49e80a6f298e

.xword 0xd583eb60cce02e33

.xword 0x774218ec2c2304ad

.xword 0x0e819484d57b912b

.xword 0xb35c85743dbcf8c3

.xword 0x7f16e6c949df6a89

.xword 0x0805223c7b337146

.xword 0x24ba463195123143

.xword 0x8d6a3e86791c21cf

.xword 0x9a72b633bfe22a58

.xword 0x723416f3dbcfd718




SECTION .PRIM_SEG_1 DATA_VA = 0x0000000002c7c000
attr_data {
	Name	 = .PRIM_SEG_1,
	VA	 = 0x0000000002c7c000,
	RA	 = 0x0000000002c7c000,
	PA	 = ra2pa(0x0000000002c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA1_START
MEM_DATA1_START:
.xword 0xae62a779d01c4d3f
.xword 0xa097781340cba202
.xword 0x1cdcd01c6f5272e2
.xword 0xf8594775b70f1b2b
.xword 0x8b26102ce506e5f6
.xword 0xc607961538c57891
.xword 0xb95e59afb9e554bb
.xword 0x9be7051f7c7d30d2
.xword 0x0c4cca092adaaf96




SECTION .PRIM_SEG_2 DATA_VA = 0x0000000004c7c000
attr_data {
	Name	 = .PRIM_SEG_2,
	VA	 = 0x0000000004c7c000,
	RA	 = 0x0000000004c7c000,
	PA	 = ra2pa(0x0000000004c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA2_START
MEM_DATA2_START:
.xword 0x35aef587957e709b
.xword 0xba2e0aa4aeb87a21
.xword 0xfb98b3dca9de17ac
.xword 0x70b16504c926836f
.xword 0xe939d81696e33894
.xword 0x4a7302fe81857819
.xword 0xf5af836b470a2602
.xword 0xfbee155598405030
.xword 0xc662c0ed333608f6




SECTION .PRIM_SEG_3 DATA_VA = 0x0000000006c7c000
attr_data {
	Name	 = .PRIM_SEG_3,
	VA	 = 0x0000000006c7c000,
	RA	 = 0x0000000006c7c000,
	PA	 = ra2pa(0x0000000006c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA3_START
MEM_DATA3_START:
.xword 0x2558b96128a81feb
.xword 0xbc06d7a2407b51a4
.xword 0xeb9a86ca9280b4aa
.xword 0x6da683c48927344b
.xword 0x47ab671334fa5f19
.xword 0x0eaaa56e6930ab93
.xword 0x63b477f93e36f38d
.xword 0xac9d93065a04a79f
.xword 0x80ea8d13bdef9939




SECTION .PRIM_SEG_4 DATA_VA = 0x0000000008c7c000
attr_data {
	Name	 = .PRIM_SEG_4,
	VA	 = 0x0000000008c7c000,
	RA	 = 0x0000000008c7c000,
	PA	 = ra2pa(0x0000000008c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA4_START
MEM_DATA4_START:
.xword 0xcdb8802328b2b1a0
.xword 0x19a804dd1cf4d842
.xword 0x37a041e6190c7c3b
.xword 0x65d71b547900e4f3
.xword 0x145e6f643bae6731
.xword 0x12ffcc1410f9638c
.xword 0x22e61365db49b936
.xword 0x5f63fcfbf081ca32
.xword 0x404d688f27e76a3b




SECTION .PRIM_SEG_5 DATA_VA = 0x000000000ac7c000
attr_data {
	Name	 = .PRIM_SEG_5,
	VA	 = 0x000000000ac7c000,
	RA	 = 0x000000000ac7c000,
	PA	 = ra2pa(0x000000000ac7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA5_START
MEM_DATA5_START:
.xword 0x03778bad55adf102
.xword 0x71d23c42e9413079
.xword 0xc93ae97f5cf6089b
.xword 0xfa3fa3018f63a475
.xword 0xd4ef57b683beea4e
.xword 0x8b9b9fbc25cbd41e
.xword 0xc91b857bcb6c0cfc
.xword 0x60e00a26e0228fef
.xword 0x7eccd65664d124c5




SECTION .PRIM_SEG_6 DATA_VA = 0x000000000cc7c000
attr_data {
	Name	 = .PRIM_SEG_6,
	VA	 = 0x000000000cc7c000,
	RA	 = 0x000000000cc7c000,
	PA	 = ra2pa(0x000000000cc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA6_START
MEM_DATA6_START:
.xword 0xbf0523668ecb1d4c
.xword 0x08de369dfbc260ef
.xword 0x1cd21f0693658ff6
.xword 0x15dde9cdd3e5bfc4
.xword 0x581d6d984d9948cd
.xword 0x31d748175f9ca8d3
.xword 0x537b8b0fa25ba5de
.xword 0x51e85d56e303793f
.xword 0x693f58496a6a6006




SECTION .PRIM_SEG_7 DATA_VA = 0x000000000ec7c000
attr_data {
	Name	 = .PRIM_SEG_7,
	VA	 = 0x000000000ec7c000,
	RA	 = 0x000000000ec7c000,
	PA	 = ra2pa(0x000000000ec7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA7_START
MEM_DATA7_START:
.xword 0xa3a0ad622e4419cb
.xword 0x1b9b98a2de72583e
.xword 0x5b2e7d6d69eab352
.xword 0x3fcfa31271c04157
.xword 0xb64ad9756a652117
.xword 0x2d0504df8fbcfc12
.xword 0x68da1900b89ab19a
.xword 0xe841f92c268318f2
.xword 0xc85431b7e5ae53bf




SECTION .PRIM_SEG_8 DATA_VA = 0x0000000010c7c000
attr_data {
	Name	 = .PRIM_SEG_8,
	VA	 = 0x0000000010c7c000,
	RA	 = 0x0000000010c7c000,
	PA	 = ra2pa(0x0000000010c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA8_START
MEM_DATA8_START:
.xword 0x6eb26c7e8b342724
.xword 0xe209b5f9f12edcf5
.xword 0xf71727df1af7b9b8
.xword 0x737f22dab7b6a71b
.xword 0xa3665ebc4e21b627
.xword 0x8e2ab11fdd4046d9
.xword 0xc708f3c754fadf57
.xword 0xb8b9029cfc53337e
.xword 0x21ae7df029e1d4d6




SECTION .PRIM_SEG_9 DATA_VA = 0x0000000012c7c000
attr_data {
	Name	 = .PRIM_SEG_9,
	VA	 = 0x0000000012c7c000,
	RA	 = 0x0000000012c7c000,
	PA	 = ra2pa(0x0000000012c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA9_START
MEM_DATA9_START:
.xword 0xd7446579237a9c95
.xword 0x3227f0cee2e7d7df
.xword 0x3499869f24426cef
.xword 0x4cab3c3d860adeb1
.xword 0xfca619f23fbfbd94
.xword 0x3a337e8d7c551545
.xword 0x5d8fcbed8f4460aa
.xword 0x0c97042788929ab3
.xword 0x1755afda41239a24




SECTION .PRIM_SEG_10 DATA_VA = 0x0000000014c7c000
attr_data {
	Name	 = .PRIM_SEG_10,
	VA	 = 0x0000000014c7c000,
	RA	 = 0x0000000014c7c000,
	PA	 = ra2pa(0x0000000014c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA10_START
MEM_DATA10_START:
.xword 0x2e690f328453e93f
.xword 0x5be6f5917873be63
.xword 0x9255c2bdfc8a99c7
.xword 0x81506ddeee278b48
.xword 0x43e755692a828f7b
.xword 0x6e22768735883d8c
.xword 0xe3fe4020547c7688
.xword 0x0213715baf4eddf8
.xword 0x84fde724c1c4d83c




SECTION .PRIM_SEG_11 DATA_VA = 0x0000000016c7c000
attr_data {
	Name	 = .PRIM_SEG_11,
	VA	 = 0x0000000016c7c000,
	RA	 = 0x0000000016c7c000,
	PA	 = ra2pa(0x0000000016c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA11_START
MEM_DATA11_START:
.xword 0x049307525a08ef83
.xword 0xc3f9fe0c66b97d83
.xword 0x2b5b98a2f0a9bfa9
.xword 0xb326a397dc884b57
.xword 0x63d2f56046e3902f
.xword 0x96497d9988c5ed9d
.xword 0xb0d893684af02664
.xword 0x759695bb4175e439
.xword 0x5de385322ff99dc8




SECTION .PRIM_SEG_12 DATA_VA = 0x0000000018c7c000
attr_data {
	Name	 = .PRIM_SEG_12,
	VA	 = 0x0000000018c7c000,
	RA	 = 0x0000000018c7c000,
	PA	 = ra2pa(0x0000000018c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA12_START
MEM_DATA12_START:
.xword 0x5079f3c7a1d3c2b7
.xword 0x3c07d45cff4eb21f
.xword 0x40684175dc528c29
.xword 0x19cde3374c7805a3
.xword 0x985fc93abfb45912
.xword 0x15840e0cf0dc2fbd
.xword 0xd25d34a27e43e97a
.xword 0x3847832430291785
.xword 0x2bbb7dde591cc203




SECTION .PRIM_SEG_13 DATA_VA = 0x000000001ac7c000
attr_data {
	Name	 = .PRIM_SEG_13,
	VA	 = 0x000000001ac7c000,
	RA	 = 0x000000001ac7c000,
	PA	 = ra2pa(0x000000001ac7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA13_START
MEM_DATA13_START:
.xword 0x309ded8360301900
.xword 0x2618b5c264b224c1
.xword 0xd840f8db4b1ce44d
.xword 0xc1200929b2557e05
.xword 0x59a8d44b45c8e0a8
.xword 0xf66a73fd5c9d00dd
.xword 0x94d5f183b81651b6
.xword 0x9fcb9118ebc93705
.xword 0xd5f8bbc5653cdccb




SECTION .PRIM_SEG_14 DATA_VA = 0x000000001cc7c000
attr_data {
	Name	 = .PRIM_SEG_14,
	VA	 = 0x000000001cc7c000,
	RA	 = 0x000000001cc7c000,
	PA	 = ra2pa(0x000000001cc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA14_START
MEM_DATA14_START:
.xword 0xfaf10edfaa4b47ba
.xword 0x9d014c996029d62b
.xword 0x5bab48c62ad1d1af
.xword 0x39abe648fdf98505
.xword 0x8e34e25e493e5e39
.xword 0xf391c9ec6a9b1df9
.xword 0x3f96ecf8111e9b61
.xword 0xbbcdc3667850c506
.xword 0x4279f044a855eb7b




SECTION .PRIM_SEG_15 DATA_VA = 0x000000001ec7c000
attr_data {
	Name	 = .PRIM_SEG_15,
	VA	 = 0x000000001ec7c000,
	RA	 = 0x000000001ec7c000,
	PA	 = ra2pa(0x000000001ec7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA15_START
MEM_DATA15_START:
.xword 0x7a5f1669fe69934f
.xword 0x5110d0e61c243e4b
.xword 0xf55140e0a4a120f3
.xword 0xdae78ca584202596
.xword 0xa46cce453ff28e34
.xword 0xc5c26c68a8a9d7bf
.xword 0x364ace5a4e5b8e1a
.xword 0x9204081ba8d67be6
.xword 0xcb2cfac175465fc0




SECTION .PRIM_SEG_16 DATA_VA = 0x0000000020c7c000
attr_data {
	Name	 = .PRIM_SEG_16,
	VA	 = 0x0000000020c7c000,
	RA	 = 0x0000000020c7c000,
	PA	 = ra2pa(0x0000000020c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA16_START
MEM_DATA16_START:
.xword 0x15c8df6ba412f00b
.xword 0x8fb46bbd2acb2724
.xword 0xdcfae5b0c40a4bff
.xword 0x8e3489bc186cbcca
.xword 0xa9313d1e5d9b16f2
.xword 0x5a261ea89546142f
.xword 0xc8dd397a0fff3d8b
.xword 0x0a5306483d2e49d0
.xword 0x59210061d51e8328




SECTION .PRIM_SEG_17 DATA_VA = 0x0000000022c7c000
attr_data {
	Name	 = .PRIM_SEG_17,
	VA	 = 0x0000000022c7c000,
	RA	 = 0x0000000022c7c000,
	PA	 = ra2pa(0x0000000022c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA17_START
MEM_DATA17_START:
.xword 0xb22caf0b09320980
.xword 0xbeb6ecb6384577e7
.xword 0x0c52f71cb4e19202
.xword 0xbac5218feda60985
.xword 0xb08a34d15bfff554
.xword 0x82d27fcd21675d27
.xword 0x97b5dd78f831b871
.xword 0x7a6501b976e14076
.xword 0x817952d9bfc2d1ab




SECTION .PRIM_SEG_18 DATA_VA = 0x0000000024c7c000
attr_data {
	Name	 = .PRIM_SEG_18,
	VA	 = 0x0000000024c7c000,
	RA	 = 0x0000000024c7c000,
	PA	 = ra2pa(0x0000000024c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA18_START
MEM_DATA18_START:
.xword 0x1d6b1bdedbd5ced0
.xword 0x4133db8bea7af673
.xword 0xec8b1408e8dbdc89
.xword 0x853d9f982561d9ef
.xword 0x9dfb29346f19d17e
.xword 0x9673980fa3bdf927
.xword 0x24f8e0effb61a02d
.xword 0x6b345368c095cbf0
.xword 0x2e15d5355fbf6657




SECTION .PRIM_SEG_19 DATA_VA = 0x0000000026c7c000
attr_data {
	Name	 = .PRIM_SEG_19,
	VA	 = 0x0000000026c7c000,
	RA	 = 0x0000000026c7c000,
	PA	 = ra2pa(0x0000000026c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA19_START
MEM_DATA19_START:
.xword 0x87db50639c9b0299
.xword 0x1f77977877eb7073
.xword 0xcf3e472efffa6d7b
.xword 0x12d7364834bce0d7
.xword 0xef581779d1ff1e9a
.xword 0x6f50aa743a5dbc2a
.xword 0x13ce4ba2dfbd3b27
.xword 0x4652afb602d5cf8f
.xword 0x27c8c4d02e2a42c9




SECTION .PRIM_SEG_20 DATA_VA = 0x0000000028c7c000
attr_data {
	Name	 = .PRIM_SEG_20,
	VA	 = 0x0000000028c7c000,
	RA	 = 0x0000000028c7c000,
	PA	 = ra2pa(0x0000000028c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA20_START
MEM_DATA20_START:
.xword 0xaeec4efb534de2a5
.xword 0x7cfd01d280df9c6f
.xword 0x3a3bfa5d1d8e922b
.xword 0xf0435d766f2484fd
.xword 0x02ad35f68d5af3cc
.xword 0xfd0125aa6735076f
.xword 0x7c1da7c2893bd274
.xword 0x458d4c5b80cc0d8d
.xword 0xa1c16fd3f5f6bd1e




SECTION .PRIM_SEG_21 DATA_VA = 0x000000002ac7c000
attr_data {
	Name	 = .PRIM_SEG_21,
	VA	 = 0x000000002ac7c000,
	RA	 = 0x000000002ac7c000,
	PA	 = ra2pa(0x000000002ac7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA21_START
MEM_DATA21_START:
.xword 0xef5b65b96e2e7cf7
.xword 0xb8bfec38e7826084
.xword 0x746cef7677d25c20
.xword 0x669282c1568a96ad
.xword 0x7dbecf8f325ff08d
.xword 0xe59f2094e50ddbbf
.xword 0x68f768964ec91538
.xword 0x6bbf2d42c3c15669
.xword 0x114ed37cd5ef7c08




SECTION .PRIM_SEG_22 DATA_VA = 0x000000002cc7c000
attr_data {
	Name	 = .PRIM_SEG_22,
	VA	 = 0x000000002cc7c000,
	RA	 = 0x000000002cc7c000,
	PA	 = ra2pa(0x000000002cc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA22_START
MEM_DATA22_START:
.xword 0x5e9b84a6560bfc01
.xword 0x00787c681eadd9e3
.xword 0x9eaab49056ac4c87
.xword 0x7192d50be8a5f65e
.xword 0x68085855bc860491
.xword 0xb2e323bae94baf0b
.xword 0xc10ed1921c19e9aa
.xword 0x7bfdf5561cbe9c6d
.xword 0x4a017b75b299e275




SECTION .PRIM_SEG_23 DATA_VA = 0x000000002ec7c000
attr_data {
	Name	 = .PRIM_SEG_23,
	VA	 = 0x000000002ec7c000,
	RA	 = 0x000000002ec7c000,
	PA	 = ra2pa(0x000000002ec7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA23_START
MEM_DATA23_START:
.xword 0x402eac580b7c9df0
.xword 0x4a339671c7e8279c
.xword 0xc450057c1bbbf1e9
.xword 0x621d1e7607e2aaab
.xword 0x35f6f51ed1eca54f
.xword 0xc957dc52e79ca0c1
.xword 0x9666d2c8f66adf71
.xword 0x01947b3fde62d933
.xword 0xc6b3dab4a9ba1293




SECTION .PRIM_SEG_24 DATA_VA = 0x0000000030c7c000
attr_data {
	Name	 = .PRIM_SEG_24,
	VA	 = 0x0000000030c7c000,
	RA	 = 0x0000000030c7c000,
	PA	 = ra2pa(0x0000000030c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA24_START
MEM_DATA24_START:
.xword 0x0f0183291bff8d0b
.xword 0xa1d4102c3d34c9bc
.xword 0xae807a22cad2c46e
.xword 0xaf3010469416c70f
.xword 0x93b28bde06dd9d03
.xword 0x24009244cada3f18
.xword 0x4148f9ff672b9641
.xword 0xa863c861f6ddd800
.xword 0x0486c613e7944b81




SECTION .PRIM_SEG_25 DATA_VA = 0x0000000032c7c000
attr_data {
	Name	 = .PRIM_SEG_25,
	VA	 = 0x0000000032c7c000,
	RA	 = 0x0000000032c7c000,
	PA	 = ra2pa(0x0000000032c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA25_START
MEM_DATA25_START:
.xword 0xc61ccf2094ced80a
.xword 0xf8e95baca5e3fdc3
.xword 0x4f0b3c5ecc48c134
.xword 0xe617c5c789c8036d
.xword 0x44400bcfc562cb74
.xword 0x47b7af8d78960337
.xword 0x11aade2521af2b38
.xword 0xc00cbc4625cf6b58
.xword 0x61581da46e60bf22




SECTION .PRIM_SEG_26 DATA_VA = 0x0000000034c7c000
attr_data {
	Name	 = .PRIM_SEG_26,
	VA	 = 0x0000000034c7c000,
	RA	 = 0x0000000034c7c000,
	PA	 = ra2pa(0x0000000034c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA26_START
MEM_DATA26_START:
.xword 0x06b7af47fb004bd2
.xword 0x5445c9cc6b7067ae
.xword 0xa138b9dd5deb0365
.xword 0x31eabaa41a264201
.xword 0xdc864485ee012acb
.xword 0xf2cef08d3e01fb0f
.xword 0x2906e1d1c9eba100
.xword 0x1e577c6be2f50e5a
.xword 0x6e7ecc28324f6090




SECTION .PRIM_SEG_27 DATA_VA = 0x0000000036c7c000
attr_data {
	Name	 = .PRIM_SEG_27,
	VA	 = 0x0000000036c7c000,
	RA	 = 0x0000000036c7c000,
	PA	 = ra2pa(0x0000000036c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA27_START
MEM_DATA27_START:
.xword 0x163dcaaf39611183
.xword 0xd1ab965996cad647
.xword 0x5b172a26f7f1b1bb
.xword 0xb8b0abe16b559e68
.xword 0x51d2951b70264f8c
.xword 0x4bd23f1092964838
.xword 0x09ea8fa660a6db6a
.xword 0x4a9c94e49813ffe7
.xword 0x35cbd81e58f25326




SECTION .PRIM_SEG_28 DATA_VA = 0x0000000038c7c000
attr_data {
	Name	 = .PRIM_SEG_28,
	VA	 = 0x0000000038c7c000,
	RA	 = 0x0000000038c7c000,
	PA	 = ra2pa(0x0000000038c7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA28_START
MEM_DATA28_START:
.xword 0x584665cd595b98b6
.xword 0xdfd4240060dd1f94
.xword 0xdaf8819977fd38ce
.xword 0x5e3dedd665ff5b6c
.xword 0xcdea9ad35e7a6e58
.xword 0x3f0d0bc2b6e4f94c
.xword 0xe1d81a88c92b7b2f
.xword 0x2a5e7639ba2f9778
.xword 0x0982d0c94525722d




SECTION .PRIM_SEG_29 DATA_VA = 0x000000003ac7c000
attr_data {
	Name	 = .PRIM_SEG_29,
	VA	 = 0x000000003ac7c000,
	RA	 = 0x000000003ac7c000,
	PA	 = ra2pa(0x000000003ac7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA29_START
MEM_DATA29_START:
.xword 0xf273e086e44543ce
.xword 0x303e8b8309d9595c
.xword 0x037df2e7a1b029ad
.xword 0x3da8e6173475fcb7
.xword 0xc87428f61db259cd
.xword 0x19ab6f5248072972
.xword 0x4aa494aec0379322
.xword 0xb90d3be8b53ba74f
.xword 0xea233bad97e71f0f




SECTION .PRIM_SEG_30 DATA_VA = 0x000000003cc7c000
attr_data {
	Name	 = .PRIM_SEG_30,
	VA	 = 0x000000003cc7c000,
	RA	 = 0x000000003cc7c000,
	PA	 = ra2pa(0x000000003cc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA30_START
MEM_DATA30_START:
.xword 0xf40012fb4f16a321
.xword 0x3b30c0a2725ebd7d
.xword 0xed85d7e0b60833cb
.xword 0x5db0428bfe8944f5
.xword 0xf13747d416edbc12
.xword 0xfe73c8da4bf04940
.xword 0x02f2be67b8e832e6
.xword 0x0477efb4ba740909
.xword 0xc703c659e7f88c60




SECTION .PRIM_SEG_31 DATA_VA = 0x000000003ec7c000
attr_data {
	Name	 = .PRIM_SEG_31,
	VA	 = 0x000000003ec7c000,
	RA	 = 0x000000003ec7c000,
	PA	 = ra2pa(0x000000003ec7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA31_START
MEM_DATA31_START:
.xword 0xdf3ba2fd19f51565
.xword 0x27a3bdf08c4a5974
.xword 0xd47326c88a9a55f6
.xword 0x7fc6baa9364dc0b7
.xword 0xcc70d4c8c137b5e8
.xword 0x5bb99b9f4447dbf8
.xword 0xf0b466e78ee5403c
.xword 0x5faa34841ad1ba5e
.xword 0xb50f22c22b04bee7






SECTION .IOPRI_SEG_0 DATA_VA = 0x000000802f0fc000
attr_data {
	Name	 = .IOPRI_SEG_0,
	VA	 = 0x000000802f0fc000,
	RA	 = 0x000000802f0fc000,
	PA	 = ra2pa(0x000000802f0fc000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global IOPRI_DATA0_START
IOPRI_DATA0_START:
.xword 0xc59caef4689fd1da
.xword 0xa1f9005be3554f1d
.xword 0xbd22209a26906b5c
.xword 0xf4e0d8a38f3fd5c0
.xword 0x191bba0b34ed3f53
.xword 0xd6784115598c4bb8
.xword 0x577550669219a28f
.xword 0x068827d87395398e
.xword 0xa750d7a2ed1767a6
.xword 0x74e1d041cec9411f
.xword 0x8f05980ea5ae2338
.xword 0x529e86ae2c5b129a
.xword 0xe7185d7e0fe9074b
.xword 0xa0bc4bbc3f6388af
.xword 0xc0f1498aaa8a5d84
.xword 0x1d150bf8ff6cb2dc
.xword 0xd3f0d60a271477dd
.xword 0x89f9e10b5f31d7d5
.xword 0x7b64bc0e534ffb03
.xword 0xdff6936626a0b297
.xword 0x476fc0d29edbf410
.xword 0x5171ec35ab7e63c4
.xword 0x1f23fa1105aace99
.xword 0xe39515a03089e947
.xword 0x271628c9bd2660e3
.xword 0x39680f37cb142737
.xword 0x30206116f507f721
.xword 0x0f43e30937c70936
.xword 0x11db1c73566a49e5
.xword 0xe2e528a12063466d
.xword 0x7b33700ec5a9f4b3
.xword 0xb77c52699eb868a0





SECTION .CPSEC_SEG_0 DATA_VA = 0x0000007123500000
attr_data {
	Name	 = .CPSEC_SEG_0,
	VA	 = 0x0000007123500000,
	RA	 = 0x0000006789aa0000,
	PA	 = ra2pa(0x0000006789aa0000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA0_START
MEM_SEC_DATA0_START:
.xword 0x4b65c7931839ac13
.xword 0xabe7cffbe2dbf3a6
.xword 0xc1bc77271ddc8e13
.xword 0x26c6437a2580de53
.xword 0xa7293e751a8d78f8
.xword 0xf5b7bfa851ba99a9
.xword 0xa47e62039d27fd8f
.xword 0x8ba3e97e038bfff1
.xword 0x955d26ffd454c093
.xword 0x757d1691abe8185d
.xword 0x5b5011d1bf316fec
.xword 0xe99dde24207bc36a
.xword 0xc0f192c1d0f683ad
.xword 0x1de405070fbfef4a
.xword 0x349cbad6e262dfbf
.xword 0x5f1961652a93d026
.xword 0x0ab43dcd30b5d750
.xword 0x3458437d659c0338
.xword 0x0d06b6998d0b3ad5
.xword 0x47b7330a40ae8085
.xword 0x648e3bd3b29c5422
.xword 0x04e47691ec2b3ef2
.xword 0x0ccb543ff872691e
.xword 0x7e0c7f86f21f943d
.xword 0x23fc1b967bca18a4
.xword 0x01463fc3e282f5d7
.xword 0xe4ec7b5921d49cde
.xword 0x003f910189e272b5
.xword 0x77d46d7f8f99db23
.xword 0x43a81132ec528948
.xword 0x01ed10b20001c1d6
.xword 0x1878ade3e654478b
.xword 0xffa60c50107b3716
.xword 0x1836f819dbaf53c3
.xword 0xe1515cbe6e2cd1d7
.xword 0xa7e1d10d368588ce
.xword 0xb7698d33f5348146
.xword 0x2068cd8a4392cb64
.xword 0x622fce37cdf203c7
.xword 0xfa3515b7a63019a7




SECTION .CPSEC_SEG_1 DATA_VA = 0x0000007123504000
attr_data {
	Name	 = .CPSEC_SEG_1,
	VA	 = 0x0000007123504000,
	RA	 = 0x0000006789aa2000,
	PA	 = ra2pa(0x0000006789aa2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA1_START
MEM_SEC_DATA1_START:
.xword 0x9c0a36997e2f3b2e
.xword 0x3c710e8abf63b1a9
.xword 0x3fd54f1c98438a36
.xword 0x13c55ec119890693
.xword 0x2ca541cc030c27d8
.xword 0x0c6be43cda459b60
.xword 0x61355753d297064e
.xword 0x9f5485fd64aa7789
.xword 0x56a668fe81b78f54
.xword 0xea41c5d20c1c93c5
.xword 0xbd8255f3dcc08c64
.xword 0x3b49dc104e35a1f1
.xword 0xb67945b146c8b525
.xword 0xc7ff6a130f3622ed
.xword 0xed19239f50ea1913
.xword 0x6e7c5634d32e1da8
.xword 0x0ca20d0808fbae73




SECTION .CPSEC_SEG_2 DATA_VA = 0x0000007123508000
attr_data {
	Name	 = .CPSEC_SEG_2,
	VA	 = 0x0000007123508000,
	RA	 = 0x0000006789aa4000,
	PA	 = ra2pa(0x0000006789aa4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA2_START
MEM_SEC_DATA2_START:
.xword 0xb2cf3bd0f6c03cd7
.xword 0x4a03ba58f72b0403
.xword 0x8f1a04fd6c724672
.xword 0x143b9c579365cf2b
.xword 0xcaefdedcf3c0742b
.xword 0x448ad976e08a1195
.xword 0xf97d6eba35f051af
.xword 0xead273781c75e27f
.xword 0x147141bacd64d271
.xword 0x4bb92aa55b3b34b5
.xword 0x82224cd818e5bb1b
.xword 0x9c349a18fca9e486
.xword 0x78092a7b74626be1
.xword 0xf04b58c2dcd4c2e9
.xword 0xa792429932df92b3
.xword 0xc75381c422a14478
.xword 0x4665fe4c6b2a137f




SECTION .CPSEC_SEG_3 DATA_VA = 0x000000712350c000
attr_data {
	Name	 = .CPSEC_SEG_3,
	VA	 = 0x000000712350c000,
	RA	 = 0x0000006789aa6000,
	PA	 = ra2pa(0x0000006789aa6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA3_START
MEM_SEC_DATA3_START:
.xword 0x6f421d9a68c3b15e
.xword 0x6bcac1d97ee4ec09
.xword 0xa7fcf2f206ffa510
.xword 0x368559f5669f31e7
.xword 0x08bfb23c4b317fe5
.xword 0xfd3a07697832224a
.xword 0xa27caea0eaac26ca
.xword 0x99da429e2aae8dd0
.xword 0xdfb3761f772cbdc6
.xword 0x7c088532d7182407
.xword 0xe3d58d8090924e9e
.xword 0x450b5432f065f785
.xword 0xc70eb1abe4fc52b7
.xword 0x3e3fef8c5e366c04
.xword 0xa04aeb933175eb37
.xword 0x82c55e250d0dc8b7
.xword 0x96b5e4edbab37378




SECTION .CPSEC_SEG_4 DATA_VA = 0x0000007123510000
attr_data {
	Name	 = .CPSEC_SEG_4,
	VA	 = 0x0000007123510000,
	RA	 = 0x0000006789aa8000,
	PA	 = ra2pa(0x0000006789aa8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA4_START
MEM_SEC_DATA4_START:
.xword 0x28c42b823edf549c
.xword 0xcaec15b195ba1a3a
.xword 0x7c2fb8ed7f759a25
.xword 0x432128027f522d55
.xword 0x8e0ce5f0b6454a0a
.xword 0x784f7690746c5739
.xword 0x08e3583b7645c9ba
.xword 0x8fa6a54a78f37bba
.xword 0x7b1be9783b648214
.xword 0xc3b2fdc0cff33122
.xword 0x2b4827f3ca79568b
.xword 0x81a638cbb4801bfe
.xword 0xca7cf709c3507211
.xword 0x837e7a251d2875a3
.xword 0xc5eae2be5bed6785
.xword 0x3c03044bc58139db
.xword 0xdc74524f50ee562c




SECTION .CPSEC_SEG_5 DATA_VA = 0x0000007123514000
attr_data {
	Name	 = .CPSEC_SEG_5,
	VA	 = 0x0000007123514000,
	RA	 = 0x0000006789aaa000,
	PA	 = ra2pa(0x0000006789aaa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA5_START
MEM_SEC_DATA5_START:
.xword 0x6308c7ca2cca2981
.xword 0x34ce5661ffe8ccc0
.xword 0xdf07593688d14f73
.xword 0x6ceacb5689045507
.xword 0x72c123f44021dae9
.xword 0x889a9077185265c6
.xword 0x052b8b01282b1658
.xword 0xe9cd12f75670a59c
.xword 0xb93afca2b3927c90
.xword 0x011f6f6a718d69aa
.xword 0x4da171f86478da81
.xword 0x0be061edf332c204
.xword 0x0fccdc11f025b0ec
.xword 0xdff516ae54236156
.xword 0xf08affa9df899316
.xword 0x90853b77053f0c11
.xword 0x2427a52e8ba1d7a6




SECTION .CPSEC_SEG_6 DATA_VA = 0x0000007123518000
attr_data {
	Name	 = .CPSEC_SEG_6,
	VA	 = 0x0000007123518000,
	RA	 = 0x0000006789aac000,
	PA	 = ra2pa(0x0000006789aac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA6_START
MEM_SEC_DATA6_START:
.xword 0xe7599c786f08ab84
.xword 0x291123db56c7def9
.xword 0xa0c4aae827dc3eec
.xword 0x2cae807e14befa45
.xword 0x836b5790fec64ab2
.xword 0x9333e73d2abf2382
.xword 0x2397543305dd441f
.xword 0x141792c66d7c2685
.xword 0x914e1bc46bd4f190
.xword 0x5120cb46057e737f
.xword 0x8f013fbc66c24d52
.xword 0xe5eeba9108696330
.xword 0x83b15d3ebf4c6bcc
.xword 0x0f0ef549ff9958c5
.xword 0x8f5c3fd86b6a44f7
.xword 0xbcafc5b39ae972eb
.xword 0x7ff54949130d035c




SECTION .CPSEC_SEG_7 DATA_VA = 0x000000712351c000
attr_data {
	Name	 = .CPSEC_SEG_7,
	VA	 = 0x000000712351c000,
	RA	 = 0x0000006789aae000,
	PA	 = ra2pa(0x0000006789aae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA7_START
MEM_SEC_DATA7_START:
.xword 0x45713034c50dd9d3
.xword 0xcc80d239de25f772
.xword 0x72241bc63540b4f4
.xword 0x278a3ebce1ffe483
.xword 0x44978fda9fb38107
.xword 0x65827d0e7433087d
.xword 0x32b209876f94a1bb
.xword 0x79becc5821f850f3
.xword 0x278e3694490a1857
.xword 0x0e6da3158b562fec
.xword 0x6d9f37cb226fd842
.xword 0xe955ebc2280e8333
.xword 0xac816a1936753349
.xword 0xcaa47c77852e5a76
.xword 0x04d8c0418f7e1405
.xword 0xb0153a9bdedec1f9
.xword 0xfe86880fffd633d5






SECTION .IOSEC_SEG_0 DATA_VA = 0x0000004567980000
attr_data {
	Name	 = .IOSEC_SEG_0,
	VA	 = 0x0000004567980000,
	RA	 = 0x0000004567880000,
	PA	 = ra2pa(0x0000004567880000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x3a8bce88e644850e
.xword 0x65aea3e54929ab69
.xword 0x9b42d8f813bacbc4
.xword 0xffc87b415175871d
.xword 0xb78a422e061e963f
.xword 0xa92ff17117afb108
.xword 0x265f48c807ac6a06
.xword 0xe17b42b35c5a8ba4




SECTION .IOSEC_SEG_1 DATA_VA = 0x0000004567984000
attr_data {
	Name	 = .IOSEC_SEG_1,
	VA	 = 0x0000004567984000,
	RA	 = 0x0000004567882000,
	PA	 = ra2pa(0x0000004567882000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xfb3d5c4a250eae81
.xword 0x5833de434a368305
.xword 0xb1c60ff4df86fd32
.xword 0xf968c32ae2b9e879
.xword 0xf9fae7a85b952d93
.xword 0xc7dcd1791212d845
.xword 0x4607c504397f37ba
.xword 0x41c9aa036d66e0b9




SECTION .IOSEC_SEG_2 DATA_VA = 0x0000004567988000
attr_data {
	Name	 = .IOSEC_SEG_2,
	VA	 = 0x0000004567988000,
	RA	 = 0x0000004567884000,
	PA	 = ra2pa(0x0000004567884000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x537fc0b7ab4dd1b2
.xword 0x650e54be64e1910d
.xword 0x1596247bfe17808a
.xword 0x051600ad4b295754
.xword 0x2aeb49dafc41d109
.xword 0x50ec187dd2042422
.xword 0xe20ed79f4a749d73
.xword 0x63bbe5e556b97b1c




SECTION .IOSEC_SEG_3 DATA_VA = 0x000000456798c000
attr_data {
	Name	 = .IOSEC_SEG_3,
	VA	 = 0x000000456798c000,
	RA	 = 0x0000004567886000,
	PA	 = ra2pa(0x0000004567886000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x6ae802a8493e39e6
.xword 0x40038e904c07bbeb
.xword 0x3741171c7d0e148f
.xword 0xe3404559ca5c71e7
.xword 0xa540bab0a679b971
.xword 0x0bb874798a175605
.xword 0x5844ee469c57cedb
.xword 0x543c508c28f7bd3b




SECTION .IOSEC_SEG_4 DATA_VA = 0x0000004567990000
attr_data {
	Name	 = .IOSEC_SEG_4,
	VA	 = 0x0000004567990000,
	RA	 = 0x0000004567888000,
	PA	 = ra2pa(0x0000004567888000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x4687607220f752be
.xword 0x3a73957b9bba7ed9
.xword 0xd664c95ce73ba55e
.xword 0x7fd0339769ece236
.xword 0x7a51d54adcbb17e4
.xword 0xb3f73517d426db5d
.xword 0x56c62e7933d5f73b
.xword 0x807a6ef8238b6077




SECTION .IOSEC_SEG_5 DATA_VA = 0x0000004567994000
attr_data {
	Name	 = .IOSEC_SEG_5,
	VA	 = 0x0000004567994000,
	RA	 = 0x000000456788a000,
	PA	 = ra2pa(0x000000456788a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x99bc4a683eb23894
.xword 0xb9706e37b5557f97
.xword 0xf536805bd0676c97
.xword 0x89265153e7808276
.xword 0xb2e05e0bc2432c0b
.xword 0x6ca1d1b8af688691
.xword 0x0962a9c866eefdf8
.xword 0xd3ff2ff595c06aae




SECTION .IOSEC_SEG_6 DATA_VA = 0x0000004567998000
attr_data {
	Name	 = .IOSEC_SEG_6,
	VA	 = 0x0000004567998000,
	RA	 = 0x000000456788c000,
	PA	 = ra2pa(0x000000456788c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x24c29c79ebd9e1fa
.xword 0x186b805dcdfbaaef
.xword 0xa3bc38acb5d7e822
.xword 0xf4451e9ecaa8550c
.xword 0x67d53ac4f9b50acb
.xword 0xe5ac7163bb60b1fe
.xword 0xa4d13765b42257f3
.xword 0xe8278fe0b88429b3




SECTION .IOSEC_SEG_7 DATA_VA = 0x000000456799c000
attr_data {
	Name	 = .IOSEC_SEG_7,
	VA	 = 0x000000456799c000,
	RA	 = 0x000000456788e000,
	PA	 = ra2pa(0x000000456788e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x71e02178801d1bc0
.xword 0x5a4ad6a41268265c
.xword 0x162c2430b6727dd7
.xword 0xbaebd942961d0219
.xword 0xa37195f8ef1c59a0
.xword 0x7534b4f667d7c063
.xword 0x93629a2471d2485f
.xword 0x26f78944585a0c3e






SECTION .CPNUC_SEG_0 DATA_VA = 0x00000019aba00000
attr_data {
	Name	 = .CPNUC_SEG_0,
	VA	 = 0x00000019aba00000,
	RA	 = 0x00000069debc0000,
	PA	 = ra2pa(0x00000069debc0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x4eb4050a18f8fbe4
.xword 0x566011a72ff656bb
.xword 0x4f6bedaeac785692
.xword 0x0454d4fd9d8773a6
.xword 0x62f04abc1bd81682
.xword 0x9eb50e270f074a7a
.xword 0x2637a549ec6c0355
.xword 0x77f406e7e804952d




SECTION .CPNUC_SEG_1 DATA_VA = 0x00000019aba04000
attr_data {
	Name	 = .CPNUC_SEG_1,
	VA	 = 0x00000019aba04000,
	RA	 = 0x00000069debc2000,
	PA	 = ra2pa(0x00000069debc2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xd0885e86eef247f5
.xword 0x53339def1c0822f7
.xword 0xa72e0f98698bd552
.xword 0x57f5b25351c92976
.xword 0x28add33f3221a79f
.xword 0x10b563111466be22
.xword 0xe5e6bbd342159e7b
.xword 0x4ea92b57ede6dd44




SECTION .CPNUC_SEG_2 DATA_VA = 0x00000019aba08000
attr_data {
	Name	 = .CPNUC_SEG_2,
	VA	 = 0x00000019aba08000,
	RA	 = 0x00000069debc4000,
	PA	 = ra2pa(0x00000069debc4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x7892c52b220143d3
.xword 0x63c127aa46dcd634
.xword 0x9fb20df7b5b35279
.xword 0x718a9c1552f2a2b5
.xword 0x94ec6441d4a2fecd
.xword 0x0e176a94319063a8
.xword 0x03dff4d015bed526
.xword 0x8fb7bf07d8c59e3f




SECTION .CPNUC_SEG_3 DATA_VA = 0x00000019aba0c000
attr_data {
	Name	 = .CPNUC_SEG_3,
	VA	 = 0x00000019aba0c000,
	RA	 = 0x00000069debc6000,
	PA	 = ra2pa(0x00000069debc6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x1d0f45e178bcf192
.xword 0x7f468430f39a3c7b
.xword 0x9be72180afaa4dae
.xword 0x312f5377a8d45d90
.xword 0xb2041ebefbd96385
.xword 0xd9e85016678cce54
.xword 0x81082712bb2fdbd9
.xword 0xbbe8cb878c6ecd7f




SECTION .CPNUC_SEG_4 DATA_VA = 0x00000019aba10000
attr_data {
	Name	 = .CPNUC_SEG_4,
	VA	 = 0x00000019aba10000,
	RA	 = 0x00000069debc8000,
	PA	 = ra2pa(0x00000069debc8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x8617b0a05bcbb6cd
.xword 0x13c5e4c9d024496e
.xword 0x96f71b91f5bfad60
.xword 0xb37f71363949b5c0
.xword 0xfad87825fed1e241
.xword 0x620f7461ee7b74b9
.xword 0xbe27664473cf3f6c
.xword 0x17580de3dc7ef372




SECTION .CPNUC_SEG_5 DATA_VA = 0x00000019aba14000
attr_data {
	Name	 = .CPNUC_SEG_5,
	VA	 = 0x00000019aba14000,
	RA	 = 0x00000069debca000,
	PA	 = ra2pa(0x00000069debca000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x271f8265ae1827a1
.xword 0xc55d486494a5a696
.xword 0xaac04300a16fd3be
.xword 0xfdbe0b82d85b9283
.xword 0x16681cc5c462196e
.xword 0x07d91c5e43547ba3
.xword 0x44d74042605fa960
.xword 0x00767e1bf79cc4ca




SECTION .CPNUC_SEG_6 DATA_VA = 0x00000019aba18000
attr_data {
	Name	 = .CPNUC_SEG_6,
	VA	 = 0x00000019aba18000,
	RA	 = 0x00000069debcc000,
	PA	 = ra2pa(0x00000069debcc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x9388ccec3432dc90
.xword 0x71cbfb634307e7f2
.xword 0xc5943f6758af2b78
.xword 0x4b20a74d0066254c
.xword 0xd9c3618cea721efd
.xword 0x912972f7fbb4523a
.xword 0x09ad71b9f572a080
.xword 0x4fa7f0843c9899d4




SECTION .CPNUC_SEG_7 DATA_VA = 0x00000019aba1c000
attr_data {
	Name	 = .CPNUC_SEG_7,
	VA	 = 0x00000019aba1c000,
	RA	 = 0x00000069debce000,
	PA	 = ra2pa(0x00000069debce000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x5a21d35b40002d5b
.xword 0x3949d407e5db43bc
.xword 0x1da5095d501e7c1e
.xword 0x4e593b3f2dec03cc
.xword 0xb7e10339852855de
.xword 0xf5f31dd0f906579b
.xword 0x6368c109b419d2b7
.xword 0x845ca99cc6ed7549






SECTION .IONUC_SEG_0 DATA_VA = 0x0000004def280000
attr_data {
	Name	 = .IONUC_SEG_0,
	VA	 = 0x0000004def280000,
	RA	 = 0x00000049abcd0000,
	PA	 = ra2pa(0x00000049abcd0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x149178de1cc05840
.xword 0xb93ec92c5d4cdf55
.xword 0x5f45e6a7d0425cba
.xword 0xe8911da699267daa
.xword 0xc38e8a46d9a37e84
.xword 0x9b00b35920132e55
.xword 0xb7ac80e78f5b84b6
.xword 0xd5a860f8b2a3ed3f




SECTION .IONUC_SEG_1 DATA_VA = 0x0000004def284000
attr_data {
	Name	 = .IONUC_SEG_1,
	VA	 = 0x0000004def284000,
	RA	 = 0x00000049abcd2000,
	PA	 = ra2pa(0x00000049abcd2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x617c541c23bbf277
.xword 0x9697875cd15d3142
.xword 0x49e21b4189e9861c
.xword 0x2f7757b0bebe05af
.xword 0x3bf6db143e467cc3
.xword 0x2efc083a131b6217
.xword 0x742bdeea910e7595
.xword 0xec4402edf4269606




SECTION .IONUC_SEG_2 DATA_VA = 0x0000004def288000
attr_data {
	Name	 = .IONUC_SEG_2,
	VA	 = 0x0000004def288000,
	RA	 = 0x00000049abcd4000,
	PA	 = ra2pa(0x00000049abcd4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x17e84fa5eb04afb2
.xword 0x700492114a3e6d9b
.xword 0x0c44793a4e86c9c4
.xword 0xe809100023cb50ad
.xword 0x35403bfb590f4f17
.xword 0x6a652c66ecad3cdd
.xword 0x08721eb5cd6b6519
.xword 0x91a6e7eae3ad1137




SECTION .IONUC_SEG_3 DATA_VA = 0x0000004def28c000
attr_data {
	Name	 = .IONUC_SEG_3,
	VA	 = 0x0000004def28c000,
	RA	 = 0x00000049abcd6000,
	PA	 = ra2pa(0x00000049abcd6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x684d991eb12a4434
.xword 0xbd11ff50a2991a4c
.xword 0x1cf3fb78b3b1d745
.xword 0xc68aabd657f36f71
.xword 0x8e4a080a61ffae2d
.xword 0x77dac268498897a3
.xword 0x4f884acaf8c10f78
.xword 0xa049172173a59bea




SECTION .IONUC_SEG_4 DATA_VA = 0x0000004def290000
attr_data {
	Name	 = .IONUC_SEG_4,
	VA	 = 0x0000004def290000,
	RA	 = 0x00000049abcd8000,
	PA	 = ra2pa(0x00000049abcd8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x12331c961e213c05
.xword 0x80038c8ac5dff5f3
.xword 0x8d23db254deef141
.xword 0x68170b85e5ce2820
.xword 0x36c33720dd4587bd
.xword 0xcd462a8e23902bc3
.xword 0x73e8cf212859d7b5
.xword 0x6e3165f1339fba81




SECTION .IONUC_SEG_5 DATA_VA = 0x0000004def294000
attr_data {
	Name	 = .IONUC_SEG_5,
	VA	 = 0x0000004def294000,
	RA	 = 0x00000049abcda000,
	PA	 = ra2pa(0x00000049abcda000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x8729dd2c88a6c612
.xword 0x97ef260da81291e9
.xword 0xd480cfbb8d344ac1
.xword 0x1347025957f0c90a
.xword 0xc9d0c014d0364bff
.xword 0x3810096caa870f79
.xword 0x3e27a6b22229395a
.xword 0xe70361ff8c20657e




SECTION .IONUC_SEG_6 DATA_VA = 0x0000004def298000
attr_data {
	Name	 = .IONUC_SEG_6,
	VA	 = 0x0000004def298000,
	RA	 = 0x00000049abcdc000,
	PA	 = ra2pa(0x00000049abcdc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x6cafd1d9169b7ae8
.xword 0x2af84af075f7f7b3
.xword 0x53c4d7fe306f1b2f
.xword 0xbea74ddcc0d15ed5
.xword 0x9a61fa59029e64e2
.xword 0x17bfa807ad4989d9
.xword 0xc80ab62efdb21cf6
.xword 0x70e3859314758c7c




SECTION .IONUC_SEG_7 DATA_VA = 0x0000004def29c000
attr_data {
	Name	 = .IONUC_SEG_7,
	VA	 = 0x0000004def29c000,
	RA	 = 0x00000049abcde000,
	PA	 = ra2pa(0x00000049abcde000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xca50061b1670a780
.xword 0xa38614cbed1e43c9
.xword 0xa63e8f271a2afd94
.xword 0xd21aba54aa7d1b4e
.xword 0xccbf93343d76d5fe
.xword 0xc31f8c0fd2d06ed2
.xword 0xada878db30307c37
.xword 0x9a6b069652a1b116






SECTION .CP_REAL_MEM_SEG_0 DATA_VA = 0x00000000ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_0,
	VA	 = 0x00000000ef300000,
	RA	 = 0x00000000ef300000,
	PA	 = ra2pa(0x00000000ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA0_START
MEM_REAL_DATA0_START:
.xword 0x978bce9638cfc98d
.xword 0xec6bad67d93e257b
.xword 0x25847a049c2119ba
.xword 0x8f794e94b5f2fc36
.xword 0x024f96e79c7bf002
.xword 0x20c99b1e0ed4ee9a
.xword 0x20e1e30e6519a356
.xword 0x2e1c852f9c27a2d1
.xword 0xdd23ddcdef61d8c5
.xword 0xf24e582c9315256a
.xword 0x7700637ae0b69c92
.xword 0xda9960071e63fb22
.xword 0xd2ae4876704397ee
.xword 0xf8c43ed4dc978495
.xword 0x728c686fe62264eb
.xword 0xe085983333c3945b
.xword 0xe981f0b455ceabd6
.xword 0x3af494d797ff499c
.xword 0xd8645cf7a8f9f216
.xword 0xd678039e42983bf6
.xword 0xd56e7e0d2c294b17
.xword 0xcd100feb9751ba54
.xword 0x780941290afa13f8
.xword 0x83d7da85185c4b9f
.xword 0xba6ca7c8ac3054cc
.xword 0x1f5082fb64597a5d
.xword 0xbbb6423d6e8c6d4d
.xword 0x43167dcab560ce7d
.xword 0xdd215f920613ae10
.xword 0x3b559ba1a7e4e8aa
.xword 0x4c85bf8550eca3f8
.xword 0xae8cee1db5b123d4



SECTION .CP_REAL_MEM_SEG_1 DATA_VA = 0x00000001ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_1,
	VA	 = 0x00000001ef300000,
	RA	 = 0x00000001ef300000,
	PA	 = ra2pa(0x00000001ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA1_START
MEM_REAL_DATA1_START:
.xword 0x89b854fc967da83f
.xword 0x122289d8fb1d05ed
.xword 0xcae1ff36269eb0b8
.xword 0xf541b6dc75fa961a
.xword 0xfe6a3240b85575a3
.xword 0x1ddd08a4829e8982
.xword 0x4e121b204609a726
.xword 0xbd823789a68e7a31
.xword 0x1b5707a4b1f50af6



SECTION .CP_REAL_MEM_SEG_2 DATA_VA = 0x00000002ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_2,
	VA	 = 0x00000002ef300000,
	RA	 = 0x00000002ef300000,
	PA	 = ra2pa(0x00000002ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA2_START
MEM_REAL_DATA2_START:
.xword 0xc21df69e5a77ab9c
.xword 0x2bfb1ab30916a2e6
.xword 0xa306afa5cec29a64
.xword 0x5dc8de0c54b5418e
.xword 0xa20a7d3025d78e13
.xword 0x2fec267449e58a19
.xword 0xba7b159b9c654895
.xword 0xbf546d77de7d6a23
.xword 0x570cfaa1093ea354



SECTION .CP_REAL_MEM_SEG_3 DATA_VA = 0x00000003ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_3,
	VA	 = 0x00000003ef300000,
	RA	 = 0x00000003ef300000,
	PA	 = ra2pa(0x00000003ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA3_START
MEM_REAL_DATA3_START:
.xword 0x1743ed7ace1a68b2
.xword 0x04f6ea3099ee19c5
.xword 0x09c11bd42d999e2b
.xword 0x6e6bcce6e3e183d5
.xword 0x2dd4672a145394ef
.xword 0xa3bd43e02b6c1dec
.xword 0x9cb68f42183c952d
.xword 0x03da7024e3e5cf78
.xword 0x8e46964ea5d9b670



SECTION .CP_REAL_MEM_SEG_4 DATA_VA = 0x00000008ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_4,
	VA	 = 0x00000008ef300000,
	RA	 = 0x00000008ef300000,
	PA	 = ra2pa(0x00000008ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA4_START
MEM_REAL_DATA4_START:
.xword 0x4a1526bb87819991
.xword 0xcfcc57f35aa473c8
.xword 0x12e08d1ab09bf172
.xword 0xa0f801ca70da6977
.xword 0xabb86f7542bd0f6c
.xword 0xf8543af7420a621d
.xword 0x60b1abbf05973ae8
.xword 0x93d8d8c1a1f5e711
.xword 0xfed5d09487219111



SECTION .CP_REAL_MEM_SEG_5 DATA_VA = 0x00000009ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_5,
	VA	 = 0x00000009ef300000,
	RA	 = 0x00000009ef300000,
	PA	 = ra2pa(0x00000009ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA5_START
MEM_REAL_DATA5_START:
.xword 0x0625a7afa2c092cd
.xword 0x4cf6cc253800a415
.xword 0xc9aba61441670d02
.xword 0x3f0ba6aebb53b472
.xword 0x03a4e9c4a1064a6e
.xword 0xf71bd3b186fc3455
.xword 0xe8af0d12cd8a3ff4
.xword 0x996c7dd4b8011887
.xword 0xe6a746bdd09db076



SECTION .CP_REAL_MEM_SEG_6 DATA_VA = 0x0000000aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_6,
	VA	 = 0x0000000aef300000,
	RA	 = 0x0000000aef300000,
	PA	 = ra2pa(0x0000000aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA6_START
MEM_REAL_DATA6_START:
.xword 0x4c036f08bef3bee6
.xword 0x026ff5762431b024
.xword 0x09c8dea5dcb682c4
.xword 0xccea8436adcbc25e
.xword 0x3a63c5fd392ce7ee
.xword 0x436d4a50ff7dde19
.xword 0x2d6a7f420b18323e
.xword 0xcc19d00bad08afd1
.xword 0xf94218bc6af584ef



SECTION .CP_REAL_MEM_SEG_7 DATA_VA = 0x0000000bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_7,
	VA	 = 0x0000000bef300000,
	RA	 = 0x0000000bef300000,
	PA	 = ra2pa(0x0000000bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA7_START
MEM_REAL_DATA7_START:
.xword 0x689e3e3f1c179eae
.xword 0x75c2c8acc124e994
.xword 0x159f9fcc32690535
.xword 0x10a106cfa26d158d
.xword 0x79973ac90cf163dc
.xword 0xae1a322a8b568135
.xword 0x6c0c0a3c9a99a4d7
.xword 0x22eff26d28ba09f0
.xword 0x23adbe7aa35b53ab



SECTION .CP_REAL_MEM_SEG_8 DATA_VA = 0x00000020ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_8,
	VA	 = 0x00000020ef300000,
	RA	 = 0x00000020ef300000,
	PA	 = ra2pa(0x00000020ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA8_START
MEM_REAL_DATA8_START:
.xword 0xcb33cf798e497395
.xword 0x3b7c95636add285a
.xword 0x56e622985d6f5725
.xword 0x16918b10ca096480
.xword 0x39ccfe2d4ec37ff5
.xword 0xd0aec4c4bb513c9d
.xword 0x3d10fdd0ae30645b
.xword 0x760461e57c64857d
.xword 0x571e1a14c6af177b



SECTION .CP_REAL_MEM_SEG_9 DATA_VA = 0x00000021ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_9,
	VA	 = 0x00000021ef300000,
	RA	 = 0x00000021ef300000,
	PA	 = ra2pa(0x00000021ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA9_START
MEM_REAL_DATA9_START:
.xword 0x7ed42aca35fb517f
.xword 0xc178465a703aba93
.xword 0xdd351ac449f49421
.xword 0xbcb858da183f1750
.xword 0xc88c39d86768cbb5
.xword 0xb79a54aea7ac5fdf
.xword 0xf731e04e08dc3c98
.xword 0x857d8e717db6bd2a
.xword 0x87f09c76a6588a50



SECTION .CP_REAL_MEM_SEG_10 DATA_VA = 0x00000022ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_10,
	VA	 = 0x00000022ef300000,
	RA	 = 0x00000022ef300000,
	PA	 = ra2pa(0x00000022ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA10_START
MEM_REAL_DATA10_START:
.xword 0xb4a9e1f4ad1b9b4b
.xword 0x711047f01b3ae087
.xword 0x35c6f064da4b8978
.xword 0xc4598c3c830bd7f2
.xword 0x2e696706d895d697
.xword 0x1280f03c288fc4b7
.xword 0xdbfcb56b0df3139d
.xword 0x40616fc9c6c54a18
.xword 0xe61e548c3ba8300e



SECTION .CP_REAL_MEM_SEG_11 DATA_VA = 0x00000023ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_11,
	VA	 = 0x00000023ef300000,
	RA	 = 0x00000023ef300000,
	PA	 = ra2pa(0x00000023ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA11_START
MEM_REAL_DATA11_START:
.xword 0x56982cf07047e9e3
.xword 0xe74756ee2b6119dc
.xword 0x3b523989bf90c255
.xword 0xbd482deba9e96436
.xword 0xa232f1c45622d681
.xword 0x27beb686560d3f65
.xword 0xc87c10e5e7202bf8
.xword 0x728b3c4f9baa97a5
.xword 0x2076076fc99fe515



SECTION .CP_REAL_MEM_SEG_12 DATA_VA = 0x00000028ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_12,
	VA	 = 0x00000028ef300000,
	RA	 = 0x00000028ef300000,
	PA	 = ra2pa(0x00000028ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA12_START
MEM_REAL_DATA12_START:
.xword 0x1063158a2bcabbeb
.xword 0xbd3ec54dbd0d948c
.xword 0x68f2f48064b14524
.xword 0x3451d76be68ba8a8
.xword 0x8e41b9037fab0532
.xword 0x914e107832ae12b5
.xword 0x12d56d477e502a22
.xword 0x3b9730dbcb39742a
.xword 0x01bf24b40c239bdd



SECTION .CP_REAL_MEM_SEG_13 DATA_VA = 0x00000029ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_13,
	VA	 = 0x00000029ef300000,
	RA	 = 0x00000029ef300000,
	PA	 = ra2pa(0x00000029ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA13_START
MEM_REAL_DATA13_START:
.xword 0xaac0974e4af30907
.xword 0x617a6ce8c6ac4b86
.xword 0x2bdbacb18d3955c9
.xword 0xda4836c7202e5c3d
.xword 0x7d971875a1185195
.xword 0x3219553e46b98774
.xword 0x6d041e3066a8101c
.xword 0x2a7e9b34dd346f15
.xword 0xc6b202f1142079f9



SECTION .CP_REAL_MEM_SEG_14 DATA_VA = 0x0000002aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_14,
	VA	 = 0x0000002aef300000,
	RA	 = 0x0000002aef300000,
	PA	 = ra2pa(0x0000002aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA14_START
MEM_REAL_DATA14_START:
.xword 0x490ed2ee2397f781
.xword 0x3a414066af00b8a3
.xword 0x76273dce7fca0df4
.xword 0x286a5c775663a310
.xword 0x543fa79a187a734d
.xword 0xb850b49560e1c7ae
.xword 0xeb63304d8b0074c8
.xword 0x03a8cbae110de7f6
.xword 0x5f3fa5260b1c317d



SECTION .CP_REAL_MEM_SEG_15 DATA_VA = 0x0000002bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_15,
	VA	 = 0x0000002bef300000,
	RA	 = 0x0000002bef300000,
	PA	 = ra2pa(0x0000002bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA15_START
MEM_REAL_DATA15_START:
.xword 0x6e119ae9dabbbef1
.xword 0x2dd0ef24c4d0af7a
.xword 0x5c45520d81528bb5
.xword 0x8f4375521f4b77bf
.xword 0xa329015a5f7e6a4c
.xword 0xdd4fd911e5d2c8fb
.xword 0x48a7b9e8a9fbe55c
.xword 0xc5e0e311709511e9
.xword 0x761db2b5b2d65413



SECTION .CP_REAL_MEM_SEG_16 DATA_VA = 0x00000040ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_16,
	VA	 = 0x00000040ef300000,
	RA	 = 0x00000040ef300000,
	PA	 = ra2pa(0x00000040ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA16_START
MEM_REAL_DATA16_START:
.xword 0x1f8f3280831b65b7
.xword 0xaa6fce915ea87476
.xword 0x78192045d20cdb98
.xword 0x08493e1d5dde8612
.xword 0xea3c0e0981aefbaa
.xword 0x4e3325169d99e0e7
.xword 0x3d9641f9b978239a
.xword 0xbcf5c7c940b90975
.xword 0x2aa5a39ea5200d98



SECTION .CP_REAL_MEM_SEG_17 DATA_VA = 0x00000041ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_17,
	VA	 = 0x00000041ef300000,
	RA	 = 0x00000041ef300000,
	PA	 = ra2pa(0x00000041ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA17_START
MEM_REAL_DATA17_START:
.xword 0xb11d7c38e89197fb
.xword 0xcfb3dcf820b142ec
.xword 0x760f4443a128f0a2
.xword 0x0c29c6b09c3555f5
.xword 0x5b07cab1bfdf7c2e
.xword 0x748e9fd29512c1db
.xword 0x86d68f5e98f412b4
.xword 0x587a9369573e3678
.xword 0xb0f920814b09ca31



SECTION .CP_REAL_MEM_SEG_18 DATA_VA = 0x00000042ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_18,
	VA	 = 0x00000042ef300000,
	RA	 = 0x00000042ef300000,
	PA	 = ra2pa(0x00000042ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA18_START
MEM_REAL_DATA18_START:
.xword 0xd7aa5afa58ed1bc8
.xword 0xbb7e2d65ee28a98d
.xword 0xcbcd346cd4220681
.xword 0xa0cd5a603632ac26
.xword 0xf7e2af879440b2c8
.xword 0x06b617b0877911b5
.xword 0x47a5418e519b9a0d
.xword 0x926922a723d8070f
.xword 0xb83804d102434815



SECTION .CP_REAL_MEM_SEG_19 DATA_VA = 0x00000043ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_19,
	VA	 = 0x00000043ef300000,
	RA	 = 0x00000043ef300000,
	PA	 = ra2pa(0x00000043ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA19_START
MEM_REAL_DATA19_START:
.xword 0xce30a96038e29fb3
.xword 0xb7ae43ac454cc3de
.xword 0x9aa5bc2c863e72ff
.xword 0x1e375c5ca9328a6a
.xword 0xcb1f01bce669b646
.xword 0x6ab0a3e2a90b3d84
.xword 0x13b3fb68b90621d1
.xword 0xb78f9522b79f59a3
.xword 0xccd570741682b06c



SECTION .CP_REAL_MEM_SEG_20 DATA_VA = 0x00000048ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_20,
	VA	 = 0x00000048ef300000,
	RA	 = 0x00000048ef300000,
	PA	 = ra2pa(0x00000048ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA20_START
MEM_REAL_DATA20_START:
.xword 0xb08bbbe45355758b
.xword 0x7c4870a7c12d84b7
.xword 0x36532352ee08fc89
.xword 0xb3a6046f344e4427
.xword 0x2204846316973ae4
.xword 0x57af207b69d5516e
.xword 0x2dab13f870d52ed7
.xword 0x77e53f2a237e3e76
.xword 0x7035ebb953d0094e



SECTION .CP_REAL_MEM_SEG_21 DATA_VA = 0x00000049ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_21,
	VA	 = 0x00000049ef300000,
	RA	 = 0x00000049ef300000,
	PA	 = ra2pa(0x00000049ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA21_START
MEM_REAL_DATA21_START:
.xword 0x25b96cb7049493a1
.xword 0x68c6e5995d69d4f6
.xword 0x0c0c49a6d3910e4c
.xword 0xc633cafc2ed1d85e
.xword 0x12668bec101555bd
.xword 0xfd4f8c69db459039
.xword 0x25a72071af737014
.xword 0x4b4e4171d6c9d6b4
.xword 0x4f71073976a047a9



SECTION .CP_REAL_MEM_SEG_22 DATA_VA = 0x0000004aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_22,
	VA	 = 0x0000004aef300000,
	RA	 = 0x0000004aef300000,
	PA	 = ra2pa(0x0000004aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA22_START
MEM_REAL_DATA22_START:
.xword 0x69f9ec3583e2c579
.xword 0xac7374db4bed05e6
.xword 0x841fbdca9e66b931
.xword 0xf44417f2cb63ec87
.xword 0x563db153f0df98a9
.xword 0xb9465926d1b07206
.xword 0x051787a2322ca53e
.xword 0x2bedec7442b32483
.xword 0xca5f3d4df3eb11ff



SECTION .CP_REAL_MEM_SEG_23 DATA_VA = 0x0000004bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_23,
	VA	 = 0x0000004bef300000,
	RA	 = 0x0000004bef300000,
	PA	 = ra2pa(0x0000004bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA23_START
MEM_REAL_DATA23_START:
.xword 0x23ca5b0e73863f97
.xword 0x8e93e62175dd2755
.xword 0xe0379458356ac590
.xword 0x5a78e441c1f4b9d1
.xword 0xd10b6ba325c63721
.xword 0x34418b8c8de8cec8
.xword 0xbdcc365844116228
.xword 0xe3d55cf118ba5ff2
.xword 0x2cdfa8cc74a87bd6



SECTION .CP_REAL_MEM_SEG_24 DATA_VA = 0x00000060ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_24,
	VA	 = 0x00000060ef300000,
	RA	 = 0x00000060ef300000,
	PA	 = ra2pa(0x00000060ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA24_START
MEM_REAL_DATA24_START:
.xword 0x2b3c501cc146a43a
.xword 0x7c48aba9eea51fd5
.xword 0x18ce0ba39db654cc
.xword 0x4e6e52724985228c
.xword 0xc04d69d022ed4367
.xword 0x4a726452419cfd7d
.xword 0x3ff8dd376ea68c69
.xword 0x5a5ca0e9723c18ab
.xword 0x0f9a40279678331a



SECTION .CP_REAL_MEM_SEG_25 DATA_VA = 0x00000061ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_25,
	VA	 = 0x00000061ef300000,
	RA	 = 0x00000061ef300000,
	PA	 = ra2pa(0x00000061ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA25_START
MEM_REAL_DATA25_START:
.xword 0xf794bca8598dc268
.xword 0xd46653545f6067fe
.xword 0xdbfa77348ddded80
.xword 0x9f49f7a1e3369f42
.xword 0x03b30fa253a9220b
.xword 0x37240873f583b9c5
.xword 0xd9f83aa6d41117e6
.xword 0x51b3651bde49fb50
.xword 0xdb51739a9d3030f4



SECTION .CP_REAL_MEM_SEG_26 DATA_VA = 0x00000062ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_26,
	VA	 = 0x00000062ef300000,
	RA	 = 0x00000062ef300000,
	PA	 = ra2pa(0x00000062ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA26_START
MEM_REAL_DATA26_START:
.xword 0xc7e6346201c44b8e
.xword 0xb0f1ad6607b3f824
.xword 0x48a19689186b8be5
.xword 0x8a6394c488f42648
.xword 0xefb9578226939894
.xword 0xf552ee275270437c
.xword 0x34c158e23f822b29
.xword 0x5d4cb7e8f7b7749b
.xword 0x203df11e25ee1cf4



SECTION .CP_REAL_MEM_SEG_27 DATA_VA = 0x00000063ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_27,
	VA	 = 0x00000063ef300000,
	RA	 = 0x00000063ef300000,
	PA	 = ra2pa(0x00000063ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA27_START
MEM_REAL_DATA27_START:
.xword 0xa4f69755a5d9dec5
.xword 0x916d4a48b19ee206
.xword 0xc715a18595fe6fb0
.xword 0x1f2e21ad768b79ed
.xword 0x240fd268cea317d9
.xword 0xe2e7e05ce7c35d48
.xword 0x6cc674cecabaeeab
.xword 0x2acda35a896f9768
.xword 0xd9a00702aee7bb34



SECTION .CP_REAL_MEM_SEG_28 DATA_VA = 0x00000068ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_28,
	VA	 = 0x00000068ef300000,
	RA	 = 0x00000068ef300000,
	PA	 = ra2pa(0x00000068ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA28_START
MEM_REAL_DATA28_START:
.xword 0x3b97d50fd504db68
.xword 0x00ceba940beea600
.xword 0x20a00c261cdf8d92
.xword 0xf170a6b4b697a4b8
.xword 0x75b84daad89e751b
.xword 0x35f8741c116618d4
.xword 0xc70e84bd6bd9b2cc
.xword 0x837c4a205df3600e
.xword 0x50feb1fd65a69475



SECTION .CP_REAL_MEM_SEG_29 DATA_VA = 0x00000069ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_29,
	VA	 = 0x00000069ef300000,
	RA	 = 0x00000069ef300000,
	PA	 = ra2pa(0x00000069ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA29_START
MEM_REAL_DATA29_START:
.xword 0x323064b63967e3d0
.xword 0xecd740b358d1f85a
.xword 0xe3db4f82dff18bf9
.xword 0x49030d4e62f1d95c
.xword 0x7ac231a2f4b1a9b3
.xword 0x13732fab02103005
.xword 0xdb6e8d104627d3fe
.xword 0x44fe33e07ca9e1d0
.xword 0x96d53284b890eb69



SECTION .CP_REAL_MEM_SEG_30 DATA_VA = 0x0000006aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_30,
	VA	 = 0x0000006aef300000,
	RA	 = 0x0000006aef300000,
	PA	 = ra2pa(0x0000006aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA30_START
MEM_REAL_DATA30_START:
.xword 0xf25141d58cf73997
.xword 0xee25311dc04bfd8b
.xword 0xe1db37973030f4eb
.xword 0x0bf795ebb5673941
.xword 0x289b34ac1979059c
.xword 0x1fb59880633ec4b9
.xword 0xf85d894f7d424c9f
.xword 0xb68cdbcd0eacb76b
.xword 0x27e80c4275c88f3a



SECTION .CP_REAL_MEM_SEG_31 DATA_VA = 0x0000006bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_31,
	VA	 = 0x0000006bef300000,
	RA	 = 0x0000006bef300000,
	PA	 = ra2pa(0x0000006bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA31_START
MEM_REAL_DATA31_START:
.xword 0x9e0d745eeceaf82f
.xword 0x35492d247cb95643
.xword 0x8f6342880d44af80
.xword 0x6d1e5eb486234f42
.xword 0x46d29943f0c3c1bb
.xword 0xe9a85263f02e90d8
.xword 0xb7da5c58d38063cc
.xword 0xc30c1e0d4143d587
.xword 0xc3df5a95a9c14723





SECTION .IO_REAL_IO_SEG_0 DATA_VA = 0x0000004ef03a0000
attr_data {
	Name	 = .IO_REAL_IO_SEG_0,
	VA	 = 0x0000004ef03a0000,
	RA	 = 0x0000004ef03a0000,
	PA	 = ra2pa(0x0000004ef03a0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x1c82eefd32f37abc
.xword 0xb4fc5890f17fc0a0
.xword 0x7a71d4463efa5d61
.xword 0x91284c65b6097a5b
.xword 0xa96d636bb7285ac9
.xword 0x5bffbde90e402ad9
.xword 0x4f8b6c4d701895ae
.xword 0x10f5425f00a42b2b




SECTION .IO_REAL_IO_SEG_1 DATA_VA = 0x0000004ef03a4000
attr_data {
	Name	 = .IO_REAL_IO_SEG_1,
	VA	 = 0x0000004ef03a4000,
	RA	 = 0x0000004ef03a4000,
	PA	 = ra2pa(0x0000004ef03a4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x92016b2e487913b7
.xword 0x037f585e2342b573
.xword 0x4ac0aebd9de6369c
.xword 0x4dce48f99062080d
.xword 0xcba2602c3c538c5d
.xword 0x913971a4e4d0014b
.xword 0xea18fe894704f2c9
.xword 0x1596813afaba8d34




SECTION .IO_REAL_IO_SEG_2 DATA_VA = 0x0000004ef03a8000
attr_data {
	Name	 = .IO_REAL_IO_SEG_2,
	VA	 = 0x0000004ef03a8000,
	RA	 = 0x0000004ef03a8000,
	PA	 = ra2pa(0x0000004ef03a8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x93474cee5fb934b8
.xword 0xc85e139b9bb8c3b7
.xword 0xdc937d8e265cf5aa
.xword 0x753bcf8434833b8c
.xword 0xcad6620f8634769b
.xword 0x174736e691ee4d74
.xword 0x38bf52635bdef3f3
.xword 0x8b8a73d001650ea2




SECTION .IO_REAL_IO_SEG_3 DATA_VA = 0x0000004ef03ac000
attr_data {
	Name	 = .IO_REAL_IO_SEG_3,
	VA	 = 0x0000004ef03ac000,
	RA	 = 0x0000004ef03ac000,
	PA	 = ra2pa(0x0000004ef03ac000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xbf3666943032c89d
.xword 0xcf9c01f6873667bb
.xword 0x11275d8453261fc0
.xword 0x9261120641d99221
.xword 0x5458bf427b43b535
.xword 0xc7aedd7d70f5c699
.xword 0x989c58401f868d5e
.xword 0x123375979df83d93




SECTION .IO_REAL_IO_SEG_4 DATA_VA = 0x0000004ef03b0000
attr_data {
	Name	 = .IO_REAL_IO_SEG_4,
	VA	 = 0x0000004ef03b0000,
	RA	 = 0x0000004ef03b0000,
	PA	 = ra2pa(0x0000004ef03b0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xa2468af427e86911
.xword 0xf53a9e6a6dd4a739
.xword 0x50a59ecf1205ff65
.xword 0xe8de23d5f6d0ec00
.xword 0x34901955999f1518
.xword 0xa6804921470609d2
.xword 0xbdfce599a3e150f5
.xword 0xe823308515301464




SECTION .IO_REAL_IO_SEG_5 DATA_VA = 0x0000004ef03b4000
attr_data {
	Name	 = .IO_REAL_IO_SEG_5,
	VA	 = 0x0000004ef03b4000,
	RA	 = 0x0000004ef03b4000,
	PA	 = ra2pa(0x0000004ef03b4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xbd9786712d658474
.xword 0x4ae4ab35f064082a
.xword 0xd06261670f9420eb
.xword 0xe379489be28e7e27
.xword 0x4af90563a2fed67d
.xword 0x49233821bd953237
.xword 0xf1b2fc5caa69c610
.xword 0xcd6ddde490aa67a9




SECTION .IO_REAL_IO_SEG_6 DATA_VA = 0x0000004ef03b8000
attr_data {
	Name	 = .IO_REAL_IO_SEG_6,
	VA	 = 0x0000004ef03b8000,
	RA	 = 0x0000004ef03b8000,
	PA	 = ra2pa(0x0000004ef03b8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xedef29d8748de8c3
.xword 0x8585b833e1411396
.xword 0x3c97135bb886eada
.xword 0x66c1b3879cd820d1
.xword 0x9115f3ca1ca9e29c
.xword 0x8901e21cc71a39ad
.xword 0x9a9607323e058a93
.xword 0xcc1a151d81428433




SECTION .IO_REAL_IO_SEG_7 DATA_VA = 0x0000004ef03bc000
attr_data {
	Name	 = .IO_REAL_IO_SEG_7,
	VA	 = 0x0000004ef03bc000,
	RA	 = 0x0000004ef03bc000,
	PA	 = ra2pa(0x0000004ef03bc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xccbf4017a50a74ea
.xword 0xc9248505bc5ddfee
.xword 0x4ceb3a16812d4a3a
.xword 0xb5e61ad6fcd06357
.xword 0xab32f2c2ab2c0a7c
.xword 0xb4c4311093d9b1e8
.xword 0xfc2e7701f52061e5
.xword 0x4d97a7d3fcfa8f03






SECTION .CP_AIUP_SEG_0 DATA_VA = 0x0000002123502000
attr_data {
	Name	 = .CP_AIUP_SEG_0,
	VA	 = 0x0000002123502000,
	RA	 = 0x0000004a5a550000,
	PA	 = ra2pa(0x0000004a5a550000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x7ef6f0e9ca46f83a
.xword 0x1718cc81e9d4c876
.xword 0x202e22242a3a5522
.xword 0x76950410289be513
.xword 0xad0ba138aac42906
.xword 0x16e18cba17e42214
.xword 0x41f631ef7ab2b234
.xword 0x554a38d095dc4db1




SECTION .CP_AIUP_SEG_1 DATA_VA = 0x0000002123506000
attr_data {
	Name	 = .CP_AIUP_SEG_1,
	VA	 = 0x0000002123506000,
	RA	 = 0x0000004a5a552000,
	PA	 = ra2pa(0x0000004a5a552000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xe39565fabed1ee6f
.xword 0xa56f8a2fd9e477ea
.xword 0x14dac482554447a8
.xword 0xac3acb09d87f08e1
.xword 0x227c93e3a1f9493b
.xword 0x879811e436e62312
.xword 0x786617ce96a9a864
.xword 0x2a80ab2aa0d8dfe8




SECTION .CP_AIUP_SEG_2 DATA_VA = 0x000000212350a000
attr_data {
	Name	 = .CP_AIUP_SEG_2,
	VA	 = 0x000000212350a000,
	RA	 = 0x0000004a5a554000,
	PA	 = ra2pa(0x0000004a5a554000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x77d251815d781a05
.xword 0x89c2459b645b7a68
.xword 0xfd60fface8d80f5a
.xword 0x24e7428ebff374ea
.xword 0x224d190a4decee77
.xword 0xa207a2ddb1421c63
.xword 0x124cf950931c79a9
.xword 0xa602afd5619260a2




SECTION .CP_AIUP_SEG_3 DATA_VA = 0x000000212350e000
attr_data {
	Name	 = .CP_AIUP_SEG_3,
	VA	 = 0x000000212350e000,
	RA	 = 0x0000004a5a556000,
	PA	 = ra2pa(0x0000004a5a556000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x571705f8528b8a9d
.xword 0xd07e5ada59cb76ea
.xword 0x965fdfca27e0f4b1
.xword 0x4ca734950b88034f
.xword 0x44a05af60c4b2e21
.xword 0xc060ad4d24991fec
.xword 0x84798382840a3c1b
.xword 0x4155e27d5399245b




SECTION .CP_AIUP_SEG_4 DATA_VA = 0x0000002123512000
attr_data {
	Name	 = .CP_AIUP_SEG_4,
	VA	 = 0x0000002123512000,
	RA	 = 0x0000004a5a558000,
	PA	 = ra2pa(0x0000004a5a558000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x3e8afd1a7a57db53
.xword 0x244ed772c0c3dd9c
.xword 0x99aacadd18f8e2a2
.xword 0x608275f205455d8f
.xword 0xc98933895dfe79c8
.xword 0xbdd0638ef5b577ae
.xword 0x24153120f4fcc0da
.xword 0x62817c7a62155f6c




SECTION .CP_AIUP_SEG_5 DATA_VA = 0x0000002123516000
attr_data {
	Name	 = .CP_AIUP_SEG_5,
	VA	 = 0x0000002123516000,
	RA	 = 0x0000004a5a55a000,
	PA	 = ra2pa(0x0000004a5a55a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x70b10cb68014e135
.xword 0x3d144e497bf02084
.xword 0x581edc69a07d8a02
.xword 0x95ad8fa99f88f587
.xword 0xb27ad9df5347db82
.xword 0x427338223e07b20b
.xword 0x181b21792ba86f65
.xword 0x0db6b40022b1bdfc




SECTION .CP_AIUP_SEG_6 DATA_VA = 0x000000212351a000
attr_data {
	Name	 = .CP_AIUP_SEG_6,
	VA	 = 0x000000212351a000,
	RA	 = 0x0000004a5a55c000,
	PA	 = ra2pa(0x0000004a5a55c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x319bedf18ed1f08e
.xword 0xf820a8ef589ca7ca
.xword 0xccd625c7b7e6f44a
.xword 0xbf4fc6a3aec70f06
.xword 0xf4011a0d575c476e
.xword 0x36d7e22c4fd0a562
.xword 0x0c40c68599ffe1c8
.xword 0xa62aa14d0367ae2f




SECTION .CP_AIUP_SEG_7 DATA_VA = 0x000000212351e000
attr_data {
	Name	 = .CP_AIUP_SEG_7,
	VA	 = 0x000000212351e000,
	RA	 = 0x0000004a5a55e000,
	PA	 = ra2pa(0x0000004a5a55e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x2694b13b372eb19a
.xword 0x32aef0ca5483ab87
.xword 0xe0fa9bf93e14a181
.xword 0xa168f3940aa5055d
.xword 0x3944d0e7a58353dc
.xword 0x5fe971d823cb77b3
.xword 0x4675a8877bea9aee
.xword 0xc88b810ff7e9c4bc






SECTION .IO_AIUP_SEG_0 DATA_VA = 0x00000045254a0000
attr_data {
	Name	 = .IO_AIUP_SEG_0,
	VA	 = 0x00000045254a0000,
	RA	 = 0x00000045256a0000,
	PA	 = ra2pa(0x00000045256a0000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x863882623f61f2c1
.xword 0x5dc7ede5130a4b25
.xword 0x756b8c6e4949addf
.xword 0x982bda5f39c3084c
.xword 0x3ad8218b44fc00ac
.xword 0xf5b4f7efd23c022d
.xword 0x2456d132d032c925
.xword 0x782388c4cd70aa8d




SECTION .IO_AIUP_SEG_1 DATA_VA = 0x00000045254a2000
attr_data {
	Name	 = .IO_AIUP_SEG_1,
	VA	 = 0x00000045254a2000,
	RA	 = 0x00000045256a2000,
	PA	 = ra2pa(0x00000045256a2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xdc0d68b4a87190be
.xword 0x7d6abb1c61bcc07d
.xword 0xdd919577c894e289
.xword 0xdc45f1c817f3037f
.xword 0xda16cf1ebfb79c18
.xword 0x9023c33f435e75fe
.xword 0xbfcf0bee46016260
.xword 0xb734e87700e08eea




SECTION .IO_AIUP_SEG_2 DATA_VA = 0x00000045254a4000
attr_data {
	Name	 = .IO_AIUP_SEG_2,
	VA	 = 0x00000045254a4000,
	RA	 = 0x00000045256a4000,
	PA	 = ra2pa(0x00000045256a4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x541188168106713d
.xword 0xdf5d1feffb5b173f
.xword 0xbe8cbc4c37550cb1
.xword 0x5c72b0bfab8e2e58
.xword 0x38e4c403546a136f
.xword 0x587fc1225034c1d5
.xword 0x48c504211f33dede
.xword 0x582eb562105ba435




SECTION .IO_AIUP_SEG_3 DATA_VA = 0x00000045254a6000
attr_data {
	Name	 = .IO_AIUP_SEG_3,
	VA	 = 0x00000045254a6000,
	RA	 = 0x00000045256a6000,
	PA	 = ra2pa(0x00000045256a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xa630418a424334ac
.xword 0x13667d092508b22e
.xword 0x36ab171edb5ad6d1
.xword 0x687697c303709ffc
.xword 0x36d1313b28e31a11
.xword 0x4671a8d240993c7a
.xword 0xe6268f4d3243256a
.xword 0x0de772a3ae7344da




SECTION .IO_AIUP_SEG_4 DATA_VA = 0x00000045254a8000
attr_data {
	Name	 = .IO_AIUP_SEG_4,
	VA	 = 0x00000045254a8000,
	RA	 = 0x00000045256a8000,
	PA	 = ra2pa(0x00000045256a8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x3f2ef7082f3710d5
.xword 0x50933e91b7622b64
.xword 0x95d706a619c73ab0
.xword 0x0068ea67e9d2ad6c
.xword 0xcb53f4bfd324abc4
.xword 0xcdfae172679a950b
.xword 0x1d01c8f90a2dfe98
.xword 0x500679709051f840




SECTION .IO_AIUP_SEG_5 DATA_VA = 0x00000045254aa000
attr_data {
	Name	 = .IO_AIUP_SEG_5,
	VA	 = 0x00000045254aa000,
	RA	 = 0x00000045256aa000,
	PA	 = ra2pa(0x00000045256aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x268ab941eb031864
.xword 0xfb2a4b227e62c92b
.xword 0x613df23ced3739cc
.xword 0xe06f04d116fa020e
.xword 0x62e03d34c87493c0
.xword 0x309baa70ee5ae5e1
.xword 0x77ebc62f990da207
.xword 0x52e55bc536d464c8




SECTION .IO_AIUP_SEG_6 DATA_VA = 0x00000045254ac000
attr_data {
	Name	 = .IO_AIUP_SEG_6,
	VA	 = 0x00000045254ac000,
	RA	 = 0x00000045256ac000,
	PA	 = ra2pa(0x00000045256ac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x1555c3415f330c87
.xword 0xa37e0d652d4109ee
.xword 0x4c59d762d0414ffd
.xword 0xc9a27dddf29fd944
.xword 0x4443f61c53b43e3c
.xword 0xc6950df58d4fab12
.xword 0x3532761b471ee557
.xword 0xce9de3d9ebadde17




SECTION .IO_AIUP_SEG_7 DATA_VA = 0x00000045254ae000
attr_data {
	Name	 = .IO_AIUP_SEG_7,
	VA	 = 0x00000045254ae000,
	RA	 = 0x00000045256ae000,
	PA	 = ra2pa(0x00000045256ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xd76c8d413d9dc0a9
.xword 0xe5297666fea542d4
.xword 0x3bedbba6bea51f19
.xword 0xac274b46f1000c6c
.xword 0x952710cecd63d65b
.xword 0x3ce873b12876d021
.xword 0x492cb26a8db2cc9e
.xword 0x5a1c42063bfa4b4e






SECTION .CP_AIUS_SEG_0 DATA_VA = 0x00000049abc12000
attr_data {
	Name	 = .CP_AIUS_SEG_0,
	VA	 = 0x00000049abc12000,
	RA	 = 0x00000049abc12000,
	PA	 = ra2pa(0x00000049abc12000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x256d634ac80e9c53
.xword 0x6bc4eaf3623ea966
.xword 0x560eecf79ef2f539
.xword 0x0aaf18dbdd9a930a
.xword 0x63f6fdb8a4970d64
.xword 0xa88dcf8af7d71d0d
.xword 0xcdab821ddf0879ee
.xword 0x605280f6f790f137




SECTION .CP_AIUS_SEG_1 DATA_VA = 0x00000049abc16000
attr_data {
	Name	 = .CP_AIUS_SEG_1,
	VA	 = 0x00000049abc16000,
	RA	 = 0x00000049abc16000,
	PA	 = ra2pa(0x00000049abc16000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x3a72e02f553e4056
.xword 0x27bdee0f22cc5e92
.xword 0x3b77709a93b87f46
.xword 0xf091f89b2917cca3
.xword 0x1f5d586ba967bacd
.xword 0xd8295f8e07eabd58
.xword 0x68bc61a1c9b686af
.xword 0x374027de3a0b6f52




SECTION .CP_AIUS_SEG_2 DATA_VA = 0x00000049abc1a000
attr_data {
	Name	 = .CP_AIUS_SEG_2,
	VA	 = 0x00000049abc1a000,
	RA	 = 0x00000049abc1a000,
	PA	 = ra2pa(0x00000049abc1a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xda34219f2df8e239
.xword 0xda289590eaacffff
.xword 0x2c65ef2d6175ec74
.xword 0x1029af991787fd7b
.xword 0x3dcaa708c8746005
.xword 0xcf661c56810f3d18
.xword 0x7b8930d6f92f3dd1
.xword 0x2f7ae9bbea25ab86




SECTION .CP_AIUS_SEG_3 DATA_VA = 0x00000049abc1e000
attr_data {
	Name	 = .CP_AIUS_SEG_3,
	VA	 = 0x00000049abc1e000,
	RA	 = 0x00000049abc1e000,
	PA	 = ra2pa(0x00000049abc1e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x27feeac856172182
.xword 0x959f4c495a44f843
.xword 0x2151563cade4bb90
.xword 0x12563da6bcc1afe1
.xword 0xce6c92e39324431b
.xword 0xb5733fde039e2041
.xword 0x1370883f6173a24f
.xword 0xe2c063fb3fc2c94e






SECTION .IO_AIUS_SEG_0 DATA_VA = 0x0000004def1a2000
attr_data {
	Name	 = .IO_AIUS_SEG_0,
	VA	 = 0x0000004def1a2000,
	RA	 = 0x0000004def1a2000,
	PA	 = ra2pa(0x0000004def1a2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xcb0f78fbd1de1aeb
.xword 0x103cebcbaab25364
.xword 0x85c88d6dcbb90ac9
.xword 0x0ad1d84f812dc8d3
.xword 0xa13492978f29f7b9
.xword 0xa2b5496f23ca52ac
.xword 0xa22060d9ea15a26c
.xword 0xc8744e375bc3f2e7




SECTION .IO_AIUS_SEG_1 DATA_VA = 0x0000004def1a6000
attr_data {
	Name	 = .IO_AIUS_SEG_1,
	VA	 = 0x0000004def1a6000,
	RA	 = 0x0000004def1a6000,
	PA	 = ra2pa(0x0000004def1a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xfa676749fe9d5755
.xword 0x86376aef7a3ee14f
.xword 0xf5a7d199f13f7dc2
.xword 0x533daeda175df5e6
.xword 0x48f216308ac3b8c3
.xword 0x01ac939a3468482d
.xword 0x0b466a8638f6252e
.xword 0x8ce80ef4473c80af




SECTION .IO_AIUS_SEG_2 DATA_VA = 0x0000004def1aa000
attr_data {
	Name	 = .IO_AIUS_SEG_2,
	VA	 = 0x0000004def1aa000,
	RA	 = 0x0000004def1aa000,
	PA	 = ra2pa(0x0000004def1aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x4eaf8b5627364d28
.xword 0xfee0b3864f21bf10
.xword 0x38d4500c6c4ff107
.xword 0x850a710984086c15
.xword 0x5b3ca4f9a81510de
.xword 0x1a0460387a10093d
.xword 0x518335b527b64682
.xword 0xce6fe50a57f94fec




SECTION .IO_AIUS_SEG_3 DATA_VA = 0x0000004def1ae000
attr_data {
	Name	 = .IO_AIUS_SEG_3,
	VA	 = 0x0000004def1ae000,
	RA	 = 0x0000004def1ae000,
	PA	 = ra2pa(0x0000004def1ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xbc8c4afd3189373b
.xword 0xdd86aa90f226178a
.xword 0x1662d79a05b58bdd
.xword 0xb3c2c387ee540546
.xword 0x35482b6d1e2e0384
.xword 0x886ad4003102bb1d
.xword 0x3d1a5f5b99b69c07
.xword 0x61b513b56f3530eb




SECTION .IO_AIUS_SEG_4 DATA_VA = 0x0000004def1b2000
attr_data {
	Name	 = .IO_AIUS_SEG_4,
	VA	 = 0x0000004def1b2000,
	RA	 = 0x0000004def1b2000,
	PA	 = ra2pa(0x0000004def1b2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x66d947b5b4c1d7d6
.xword 0x2352023e11d619e1
.xword 0x9194db4211943df4
.xword 0x7286039475832fc2
.xword 0x172725746c390b6b
.xword 0xada7e61e351edf39
.xword 0xc56489a0c36515ea
.xword 0x158bcc6c26bffdae




SECTION .IO_AIUS_SEG_5 DATA_VA = 0x0000004def1b6000
attr_data {
	Name	 = .IO_AIUS_SEG_5,
	VA	 = 0x0000004def1b6000,
	RA	 = 0x0000004def1b6000,
	PA	 = ra2pa(0x0000004def1b6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb18b85efb956cec0
.xword 0xccbcbb7ae84f099b
.xword 0x64ab80becd1ba658
.xword 0x56aa98797ec67150
.xword 0xbe05bbc924484cd9
.xword 0x77a92984fe7ae906
.xword 0x1fce4e646c76586e
.xword 0xcf3b94c5b80baec7




SECTION .IO_AIUS_SEG_6 DATA_VA = 0x0000004def1ba000
attr_data {
	Name	 = .IO_AIUS_SEG_6,
	VA	 = 0x0000004def1ba000,
	RA	 = 0x0000004def1ba000,
	PA	 = ra2pa(0x0000004def1ba000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x1e913cd45283c2b4
.xword 0xd5504a832aa59002
.xword 0xd7c773eadd9b4abd
.xword 0x64bf58c7032f4abd
.xword 0xc6e815eb87a02685
.xword 0xec3537ed23e56750
.xword 0xd14ba19bc9b2c514
.xword 0x892ac99b00126637




SECTION .IO_AIUS_SEG_7 DATA_VA = 0x0000004def1be000
attr_data {
	Name	 = .IO_AIUS_SEG_7,
	VA	 = 0x0000004def1be000,
	RA	 = 0x0000004def1be000,
	PA	 = ra2pa(0x0000004def1be000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xb30c355d5b4fb358
.xword 0x7d873bcfaaf1ae3c
.xword 0x57c0a027368e86f6
.xword 0xd41e169f52fdbb8b
.xword 0xa6460e8e953d0a60
.xword 0xdb579c6e1af2f2dc
.xword 0xf547f5691f93d8a5
.xword 0x43219124cfb3eb74




#if 0
#endif

