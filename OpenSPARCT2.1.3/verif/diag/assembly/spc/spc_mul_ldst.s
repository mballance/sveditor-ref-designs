/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_mul_ldst.s
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
#include "nmacros.h"
#include "old_boot.s"


.text
.global main

main:
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

!!	wr %g0, 4, %fprs
/*
 ********************************
 *  Multiply and Divide 
 ********************************
 */
!!-----------------------
!!	mulx
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
mulx_start:
	mulx	%l3,	%l4,	%l6
mulx_end:
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
branch_nt_annul_start:	
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1
branch_nt_annul_end:

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	mulx	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
branch_nt_no_annul_start:
	! remove annull bit since it does not affect diag correctness
	! and it gives me an extra performance case to test - JSG
	brnz	%l7,	diag_fail
branch_nt_no_annul_end:
	set	0xeeee0001,	%l1

	mulx	%l3,	-9,	%l6
branch_nt_annul_icache_start:
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1
branch_nt_annul_icache_end:

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	mulx	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

!!------------------------------------
!!	sdivx	( signed divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sdivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sdivx	%l5,	%l3,	%l6
	add	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sub	%l0,	27,	%l5	/* l5 = -27 */

	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1
	
	sdivx	%l5,	-3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

!!------------------------------------
!!	udivx	( divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	udivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	udivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 round */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	sub	%l0,	27,	%l5	/* l5 = 0xffffffffffffffe5 */

	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 rounded */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1
	
	udivx	%l5,	-3,	%l6
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

!!-----------------------
!!	umul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

	umul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

!!-----------------------
!!	smul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smul	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

!!-----------------------
!!	umulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	umulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
	
	set	0x0,	%l0	
	set	0xffffffff, 	%l3
	set	0xffffffff, 	%l4
	umulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
		
!!-----------------------
!!	smulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smulcc	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	set	0x0,	%l0
	smulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	smulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	set	0x0,	%l0	
	set	0xffffffff,	%l3
	set	0x7fffffff,	%l4
	smulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	/* smul signed value */
	set	0x0,	%l0
	set	0x4,	%l3
	set	0x2,	%l4

	sub	%l0,	%l3,	%l5
	smulcc	%l3,	%l5,	%l6	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
	
/*
 *********************************
 *	SETHI
 *********************************
 */
	sethi	0x3faacc,	%l1
	set	0x3faacc,	%l2
	sll	%l2,	10,	%l4
	sub	%l1,	%l4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	sethi	%hi(0xabcd1234), %l1
	or	%l1,	0x234,	%l1
	set	0xabcd1234,	%l2
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	set	0x1,	%l0
	sethi	0x0,	%l0	/* like a nop */

/*
 *********************************
 *	SHIFT 
 *********************************
 */
!!----------------------
!!	shift left 32b
!!----------------------
	set	0xffffffff,	%l0
	sll	%l0,	31,	%l1
	set	0x0,	%l0
	setx	0x7fffffff80000000, %l0, %l2
	sub	%l2,	%l1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sll	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift left 64b
!!----------------------
	set	0xffffffff,	%l0
	sllx	%l0,	32,	%l1
	set	0x0,	%l0
	setx	0xffffffff00000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0xffffffff,	%l0
	sllx	%l0,	63,	%l1
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sllx	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift right 32b
!!----------------------
	set	0x80000000,	%l0
	srl	%l0,	31,	%l1
	srl	%l1,	1,	%l2
	brnz,a	%l2,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	srl	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srlx	%l1,	63,	%l2
	srlx	%l2,	1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srlx	%l1,	%l2,	%l3
	srlx	%l3,	%l2,	%l4

	set	0x80000000,	%l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

!!----------------------
!!	shift right 32b
!!	  arithmetic
!!----------------------
	set	0x80000000,	%l0
	sra	%l0,	31,	%l1
	sra	%l1,	1,	%l2

	set	0x0,	%l3
	setx	0xffffffffffffffff, %l3, %l4	
	sub	%l2,	%l4,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	sra	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srax	%l1,	63,	%l2
	srax	%l2,	1,	%l3
	
	set	0x0,	%l0
	setx	0xffffffffffffffff, %l0, %l4	
	sub	%l4,	%l3,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srax	%l1,	%l2,	%l3
	srax	%l3,	%l2,	%l4

	set	0x0,	%l0
	setx	0xffffffff80000000, %l0, %l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

/*
 ***************************
 * Load FSR from Memory 
 ***************************
 */
!!------------------------
!! LDFSR 
!!------------------------
	setx	ldfsr_sdata,	%l0,	%l2
	set	0x0,	%l0
	ld	[%l2+%l0],	%i5

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */

	fble	%fcc0,	diag_fail

	add	%l0,	0x4,	%l0
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */

	fbge	%fcc0,	diag_fail

	add	%l0,	0x4,	%l0
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */

	add	%l0,	0x4,	%l0
	fbne	%fcc0,	diag_fail

	set	0xffff0005,	%l1

!!------------------------
!! LDXFSR 
!!------------------------
	setx	ldfsr_ddata,	%l0,	%l2
	set	0x0,	%l0

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */
	add	%l0,	0x8,	%l0

	fble	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */
	add	%l0,	0x8,	%l0

	fbge	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */
	add	%l0,	0x8,	%l0

	fbne	%fcc0,	diag_fail
	set	0xffff0006,	%l1

/*
 *********************************
 *  Store Floating Point
 *********************************
 */
        /* load the fp data from the memory */
        /* load single fp */
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) */

        /* load double fp */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f6     /* f6 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* f8 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f10     /* f10 = 8 * (1+1/8) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f12     /* f12 = 32 * (1+1/8) = 36 */
        nop

	/* 
	 * store single
	 */
!!--------------------------
!!  st freg, [addr]	
!!--------------------------
	setx	stfsr_sdata,	%l0,	%l2		
	set	0x0,	%l0

	st	%f0,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	st	%f2,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	set	0x0,	%l0	
	ld	[%l2+%l0],	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0
	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	ld	[%l2+%l0],	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	/* 
	 * store double
	 */
!!--------------------------
!!  std freg, [addr]	
!!--------------------------
	setx	stfsr_ddata,	%l0,	%l2		
	set	0x0,	%l0

	std	%f8,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	std	%f10,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	set	0x0,	%l0	
	ldd	[%l2+%l0],	%f14	/* f14 should = f8 */
	add	%l0,	0x8,	%l0

	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldd	[%l2+%l0],	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	/* 
	 * store fsr : single
	 */
!!--------------------------
!!  st %fsr, [addr]	
!!--------------------------
        setx    ldfsr_sdata,    %l0,    %l2
        set     0x0,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */
        add     %l0,    0x4,    %l0

	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2
	st	%fsr,	[%l2+%l0]
	nop

	ld	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff5000,     %l1

	/* 
	 * store fsr : double
	 */
!!--------------------------
!!  stx %fsr, [addr]	
!!--------------------------
        setx    ldfsr_ddata,    %l0,    %l2
        set     0x0,    %l0
        ldx     [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */

	setx	stfsr_ddata,	%l0,	%l2
	set	0x0,	%l0
	stx	%fsr,	[%l2+%l0]
	nop

	ldx	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff6000,     %l1

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        EXIT_GOOD
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        EXIT_BAD
        nop

.data	

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000

stfsr_sdata:    .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfsr_ddata:    .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stfps_nmdata:   .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfpd_nmdata:   .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stint_1:        .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi1:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi2:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000


ldfsr_sdata:    .word   0x00000800
                .word   0x00000400
                .word   0x00000000
                .word   0x00000c00

ldfsr_ddata:    .xword  0x0000000000000800
                .xword  0x0000000000000400
                .xword  0x0000000000000000
                .xword  0x0000000000000c00

fps_data:       .word   0x00200000
                .word   0x00400000
                .word   0x00600000
                .word   0x00a00000

fps_nmdata:     .word   0x70200000
                .word   0x70400000
                .word   0x70b00000
                .word   0x70b00000

fpd_data:       .xword  0x0002000000000000
                .xword  0x0004000000000000
                .xword  0x0006000000000000
                .xword  0x0008000000000000

fpd_nmdata:     .xword  0x7002000000000000
                .xword  0x7004000000000000
                .xword  0x700b000000000000
                .xword  0x700b000000000000

fpquad_data:    .xword  0x0000200000000000
                .xword  0x0000000000000000
                .xword  0x0000400000000000
                .xword  0x0000000000000000
                .xword  0x0000600000000000
                .xword  0x0000000000000000
                .xword  0x0000800000000000
                .xword  0x0000000000000000

fpquad_nmdata:  .xword  0x7000200000000000
                .xword  0x0000000000000000
                .xword  0x7000400000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000

fps_cvt_data1:	.word	0x00200000
		.word	0x00400000
		.word	0x00600000
		.word	0x00a00000

fps_cvt_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 */
		.word	0x42100000	/* 36 */ 

fpd_cvt_data1:	.xword 	0x0002000000000000
		.xword 	0x0004000000000000
		.xword 	0x0006000000000000
		.xword 	0x0008000000000000

fpd_cvt_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */

int2fps_nmd1: 	.word	0x00000003
		.word	0x00000006
		.word	0x00000009
		.word	0x00000000

int2fpd_nmd1: 	.xword	0x0000000000000003
		.xword	0x0000000000000006
		.xword	0x0000000000000009
		.xword	0x0000000000000000

fps_muldv_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41900000	/* 18 = 16*(1+1/8) */
		.word	0x42100000	/* 36 */

fpd_muldv_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4032000000000000	/* 18 */
		.xword 	0x4042000000000000	/* 36 */	 

fps_sqr_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 = 8*(1+1/8) */
		.word	0x42100000	/* 36 = 32*(1+1/8) */

fpd_sqr_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */	 

.end

