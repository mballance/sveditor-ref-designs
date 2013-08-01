/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_pm_all_dimm_rdwr_5.s
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


#include "hboot.s"
#include "asi_s.h"

#ifdef PM_8BANK
#define L20_MCU_DM0_BK0 0x0000134000
#define L20_MCU_DM0_BK2 0x0000134200
#define L20_MCU_DM0_BK4 0x0000134400
#define L20_MCU_DM0_BK6 0x0000134600

#define L20_MCU_DM1_BK0 0x0800134000
#define L20_MCU_DM1_BK2 0x0800134200
#define L20_MCU_DM1_BK4 0x0800134400
#define L20_MCU_DM1_BK6 0x0800134600

#define L20_MCU_DM2_BK0 0x1000134000
#define L20_MCU_DM2_BK2 0x1000134200
#define L20_MCU_DM2_BK4 0x1000134400
#define L20_MCU_DM2_BK6 0x1000134600

#define L20_MCU_DM3_BK0 0x1800134000
#define L20_MCU_DM3_BK2 0x1800134200
#define L20_MCU_DM3_BK4 0x1800134400
#define L20_MCU_DM3_BK6 0x1800134600

#define L20_MCU_DM4_BK0 0x2000134000
#define L20_MCU_DM4_BK2 0x2000134200
#define L20_MCU_DM4_BK4 0x2000134400
#define L20_MCU_DM4_BK6 0x2000134600

#define L20_MCU_DM5_BK0 0x2800134000
#define L20_MCU_DM5_BK2 0x2800134200
#define L20_MCU_DM5_BK4 0x2800134400
#define L20_MCU_DM5_BK6 0x2800134600

#define L20_MCU_DM6_BK0 0x3000134000
#define L20_MCU_DM6_BK2 0x3000134200
#define L20_MCU_DM6_BK4 0x3000134400
#define L20_MCU_DM6_BK6 0x3000134600

#define L20_MCU_DM7_BK0 0x3800134000
#define L20_MCU_DM7_BK2 0x3800134200
#define L20_MCU_DM7_BK4 0x3800134400
#define L20_MCU_DM7_BK6 0x3800134600

#define L2_1_MCU_DM0_BK1 0x0000134040
#define L2_1_MCU_DM0_BK3 0x0000134240
#define L2_1_MCU_DM0_BK5 0x0000134440
#define L2_1_MCU_DM0_BK7 0x0000134640

#define L2_1_MCU_DM1_BK1 0x0800134040
#define L2_1_MCU_DM1_BK3 0x0800134240
#define L2_1_MCU_DM1_BK5 0x0800134440
#define L2_1_MCU_DM1_BK7 0x0800134640

#define L2_1_MCU_DM2_BK1 0x1000134040
#define L2_1_MCU_DM2_BK3 0x1000134240
#define L2_1_MCU_DM2_BK5 0x1000134440
#define L2_1_MCU_DM2_BK7 0x1000134640

#define L2_1_MCU_DM3_BK1 0x1800134040
#define L2_1_MCU_DM3_BK3 0x1800134240
#define L2_1_MCU_DM3_BK5 0x1800134440
#define L2_1_MCU_DM3_BK7 0x1800134640

#define L2_1_MCU_DM4_BK1 0x2000134040
#define L2_1_MCU_DM4_BK3 0x2000134240
#define L2_1_MCU_DM4_BK5 0x2000134440
#define L2_1_MCU_DM4_BK7 0x2000134640

#define L2_1_MCU_DM5_BK1 0x2800134040
#define L2_1_MCU_DM5_BK3 0x2800134240
#define L2_1_MCU_DM5_BK5 0x2800134440
#define L2_1_MCU_DM5_BK7 0x2800134640

#define L2_1_MCU_DM6_BK1 0x3000134040
#define L2_1_MCU_DM6_BK3 0x3000134240
#define L2_1_MCU_DM6_BK5 0x3000134440
#define L2_1_MCU_DM6_BK7 0x3000134640

#define L2_1_MCU_DM7_BK1 0x3800134040
#define L2_1_MCU_DM7_BK3 0x3800134240
#define L2_1_MCU_DM7_BK5 0x3800134440
#define L2_1_MCU_DM7_BK7 0x3800134640
#endif

#ifdef PM_4BANK 
#define	L20_MCU_DM0_BK0 0x0000134000
#define	L20_MCU_DM0_BK2 0x0000134100
#define	L20_MCU_DM0_BK4 0x0000134200
#define	L20_MCU_DM0_BK6 0x0000134300

#define	L20_MCU_DM1_BK0 0x0400134000
#define	L20_MCU_DM1_BK2 0x0400134100
#define	L20_MCU_DM1_BK4 0x0400134200
#define	L20_MCU_DM1_BK6 0x0400134300

#define	L20_MCU_DM2_BK0 0x0800134000
#define	L20_MCU_DM2_BK2 0x0800134100
#define	L20_MCU_DM2_BK4 0x0800134200
#define	L20_MCU_DM2_BK6 0x0800134300

#define	L20_MCU_DM3_BK0 0x0c00134000
#define	L20_MCU_DM3_BK2 0x0c00134100
#define	L20_MCU_DM3_BK4 0x0c00134200
#define	L20_MCU_DM3_BK6 0x0c00134300

#define	L20_MCU_DM4_BK0 0x1000134000
#define	L20_MCU_DM4_BK2 0x1000134100
#define	L20_MCU_DM4_BK4 0x1000134200
#define	L20_MCU_DM4_BK6 0x1000134300

#define	L20_MCU_DM5_BK0 0x1400134000
#define	L20_MCU_DM5_BK2 0x1400134100
#define	L20_MCU_DM5_BK4 0x1400134200
#define	L20_MCU_DM5_BK6 0x1400134300

#define	L20_MCU_DM6_BK0 0x1800134000
#define	L20_MCU_DM6_BK2 0x1800134100
#define	L20_MCU_DM6_BK4 0x1800134200
#define	L20_MCU_DM6_BK6 0x1800134300

#define	L20_MCU_DM7_BK0 0x1c00134000
#define	L20_MCU_DM7_BK2 0x1c00134100
#define	L20_MCU_DM7_BK4 0x1c00134200
#define	L20_MCU_DM7_BK6 0x1c00134300

#define L2_1_MCU_DM0_BK1 0x0000134040
#define L2_1_MCU_DM0_BK3 0x0000134140
#define L2_1_MCU_DM0_BK5 0x0000134240
#define L2_1_MCU_DM0_BK7 0x0000134340

#define L2_1_MCU_DM1_BK1 0x0400134040
#define L2_1_MCU_DM1_BK3 0x0400134140
#define L2_1_MCU_DM1_BK5 0x0400134240
#define L2_1_MCU_DM1_BK7 0x0400134340

#define L2_1_MCU_DM2_BK1 0x0800134040
#define L2_1_MCU_DM2_BK3 0x0800134140
#define L2_1_MCU_DM2_BK5 0x0800134240
#define L2_1_MCU_DM2_BK7 0x0800134340

#define L2_1_MCU_DM3_BK1 0x0c00134040
#define L2_1_MCU_DM3_BK3 0x0c00134140
#define L2_1_MCU_DM3_BK5 0x0c00134240
#define L2_1_MCU_DM3_BK7 0x0c00134340

#define L2_1_MCU_DM4_BK1 0x1000134040
#define L2_1_MCU_DM4_BK3 0x1000134140
#define L2_1_MCU_DM4_BK5 0x1000134240
#define L2_1_MCU_DM4_BK7 0x1000134340

#define L2_1_MCU_DM5_BK1 0x1400134040
#define L2_1_MCU_DM5_BK3 0x1400134140
#define L2_1_MCU_DM5_BK5 0x1400134240
#define L2_1_MCU_DM5_BK7 0x1400134340

#define L2_1_MCU_DM6_BK1 0x1800134040
#define L2_1_MCU_DM6_BK3 0x1800134140
#define L2_1_MCU_DM6_BK5 0x1800134240
#define L2_1_MCU_DM6_BK7 0x1800134340

#define L2_1_MCU_DM7_BK1 0x1c00134040
#define L2_1_MCU_DM7_BK3 0x1c00134140
#define L2_1_MCU_DM7_BK5 0x1c00134240
#define L2_1_MCU_DM7_BK7 0x1c00134340
#endif



#ifdef PM_2BANK
#define L20_MCU_DM0_BK0 0x0000134000
#define L20_MCU_DM0_BK2 0x0000134080
#define L20_MCU_DM0_BK4 0x0000134100
#define L20_MCU_DM0_BK6 0x0000134180

#define L20_MCU_DM1_BK0 0x0200134000
#define L20_MCU_DM1_BK2 0x0200134080
#define L20_MCU_DM1_BK4 0x0200134100
#define L20_MCU_DM1_BK6 0x0200134180

#define L20_MCU_DM2_BK0 0x0400134000
#define L20_MCU_DM2_BK2 0x0400134080
#define L20_MCU_DM2_BK4 0x0400134100
#define L20_MCU_DM2_BK6 0x0400134180

#define L20_MCU_DM3_BK0 0x0600134000
#define L20_MCU_DM3_BK2 0x0600134080
#define L20_MCU_DM3_BK4 0x0600134100
#define L20_MCU_DM3_BK6 0x0600134180

#define L20_MCU_DM4_BK0 0x0800134000
#define L20_MCU_DM4_BK2 0x0800134080
#define L20_MCU_DM4_BK4 0x0800134100
#define L20_MCU_DM4_BK6 0x0800134180

#define L20_MCU_DM5_BK0 0x0a00134000
#define L20_MCU_DM5_BK2 0x0a00134080
#define L20_MCU_DM5_BK4 0x0a00134100
#define L20_MCU_DM5_BK6 0x0a00134180

#define L20_MCU_DM6_BK0 0x0c00134000
#define L20_MCU_DM6_BK2 0x0c00134080
#define L20_MCU_DM6_BK4 0x0c00134100
#define L20_MCU_DM6_BK6 0x0c00134180

#define L20_MCU_DM7_BK0 0x0e00134000
#define L20_MCU_DM7_BK2 0x0e00134080
#define L20_MCU_DM7_BK4 0x0e00134100
#define L20_MCU_DM7_BK6 0x0e00134180


#define L2_1_MCU_DM0_BK1 0x0000134040
#define L2_1_MCU_DM0_BK3 0x00001340c0
#define L2_1_MCU_DM0_BK5 0x0000134140
#define L2_1_MCU_DM0_BK7 0x00001341c0

#define L2_1_MCU_DM1_BK1 0x0200134040
#define L2_1_MCU_DM1_BK3 0x02001340c0
#define L2_1_MCU_DM1_BK5 0x0200134140
#define L2_1_MCU_DM1_BK7 0x02001341c0

#define L2_1_MCU_DM2_BK1 0x0400134040
#define L2_1_MCU_DM2_BK3 0x04001340c0
#define L2_1_MCU_DM2_BK5 0x0400134140
#define L2_1_MCU_DM2_BK7 0x04001341c0

#define L2_1_MCU_DM3_BK1 0x0600134040
#define L2_1_MCU_DM3_BK3 0x06001340c0
#define L2_1_MCU_DM3_BK5 0x0600134140
#define L2_1_MCU_DM3_BK7 0x06001341c0

#define L2_1_MCU_DM4_BK1 0x0800134040
#define L2_1_MCU_DM4_BK3 0x08001340c0
#define L2_1_MCU_DM4_BK5 0x0800134140
#define L2_1_MCU_DM4_BK7 0x08001341c0

#define L2_1_MCU_DM5_BK1 0x0a00134040
#define L2_1_MCU_DM5_BK3 0x0a001340c0
#define L2_1_MCU_DM5_BK5 0x0a00134140
#define L2_1_MCU_DM5_BK7 0x0a001341c0

#define L2_1_MCU_DM6_BK1 0x0c00134040
#define L2_1_MCU_DM6_BK3 0x0c001340c0
#define L2_1_MCU_DM6_BK5 0x0c00134140
#define L2_1_MCU_DM6_BK7 0x0c001341c0

#define L2_1_MCU_DM7_BK1 0x0e00134040
#define L2_1_MCU_DM7_BK3 0x0e001340c0
#define L2_1_MCU_DM7_BK5 0x0e00134140
#define L2_1_MCU_DM7_BK7 0x0e001341c0
#endif

#ifdef L2_OFF
#define L2_ON_OFF_DM	0x1
#else
#define L2_ON_OFF_DM    0x0
#endif
 

.text
.global	 main


main:
  ta	T_CHANGE_HPRIV
	nop

	membar #Sync

	ta	T_RD_THID

	! Preserve Thread id in %g4 left shifted 28 bits
	sllx	%o1, 24, %g4
	nop

branch_th:
	! Core0
	cmp	%o1, 0x0
	be	main_bank0
	nop

	cmp	%o1, 0x1
	be	main_bank1
	nop

	cmp	%o1, 0x2
	be	main_bank0
	nop

	cmp	%o1, 0x3
	be	main_bank1
	nop

	cmp	%o1, 0x4
	be	main_bank0
	nop

	cmp	%o1, 0x5
	be	main_bank1
	nop

	cmp	%o1, 0x6
	be	main_bank0
	nop

	cmp	%o1, 0x7
	be	main_bank1
	nop

	! Core1
	cmp	%o1, 0x8
	be	main_bank0
	nop

	cmp	%o1, 0x9
	be	main_bank1
	nop

	cmp	%o1, 0xa
	be	main_bank0
	nop

	cmp	%o1, 0xb
	be	main_bank1
	nop

	cmp	%o1, 0xc
	be	main_bank0
	nop

	cmp	%o1, 0xd
	be	main_bank1
	nop

	cmp	%o1, 0xe
	be	main_bank0
	nop

	cmp	%o1, 0xf
	be	main_bank1
	nop

	! Core2
	cmp	%o1, 0x10
	be	main_bank0
	nop

	cmp	%o1, 0x11
	be	main_bank1
	nop

	cmp	%o1, 0x12
	be	main_bank0
	nop

	cmp	%o1, 0x13
	be	main_bank1
	nop

	cmp	%o1, 0x14
	be	main_bank0
	nop

	cmp	%o1, 0x15
	be	main_bank1
	nop

	cmp	%o1, 0x16
	be	main_bank0
	nop

	cmp	%o1, 0x17
	be	main_bank1
	nop


	! Core3
	cmp	%o1, 0x18
	be	main_bank0
	nop

	cmp	%o1, 0x19
	be	main_bank1
	nop

	cmp	%o1, 0x1a
	be	main_bank0
	nop

	cmp	%o1, 0x1b
	be	main_bank1
	nop

	cmp	%o1, 0x1c
	be	main_bank0
	nop

	cmp	%o1, 0x1d
	be	main_bank1
	nop

	cmp	%o1, 0x1e
	be	main_bank0
	nop

	cmp	%o1, 0x1f
	be	main_bank1
	nop

	! Core4
	cmp	%o1, 0x20
	be	main_bank0
	nop

	cmp	%o1, 0x21
	be	main_bank1
	nop

	cmp	%o1, 0x22
	be	main_bank0
	nop

	cmp	%o1, 0x23
	be	main_bank1
	nop

	cmp	%o1, 0x24
	be	main_bank0
	nop

	cmp	%o1, 0x25
	be	main_bank1
	nop

	cmp	%o1, 0x26
	be	main_bank0
	nop

	cmp	%o1, 0x27
	be	main_bank1
	nop

	! Core5
	cmp	%o1, 0x28
	be	main_bank0
	nop

	cmp	%o1, 0x29
	be	main_bank1
	nop

	cmp	%o1, 0x2a
	be	main_bank0
	nop

	cmp	%o1, 0x2b
	be	main_bank1
	nop

	cmp	%o1, 0x2c
	be	main_bank0
	nop

	cmp	%o1, 0x2d
	be	main_bank1
	nop

	cmp	%o1, 0x2e
	be	main_bank0
	nop

	cmp	%o1, 0x2f
	be	main_bank1
	nop

	! Core6
	cmp	%o1, 0x30
	be	main_bank0
	nop

	cmp	%o1, 0x31
	be	main_bank1
	nop

	cmp	%o1, 0x32
	be	main_bank0
	nop

	cmp	%o1, 0x33
	be	main_bank1
	nop

	cmp	%o1, 0x34
	be	main_bank0
	nop

	cmp	%o1, 0x35
	be	main_bank1
	nop

	cmp	%o1, 0x36
	be	main_bank0
	nop

	cmp	%o1, 0x37
	be	main_bank1
	nop

	! Core7
	cmp	%o1, 0x38
	be	main_bank0
	nop

	cmp	%o1, 0x39
	be	main_bank1
	nop

	cmp	%o1, 0x3a
	be	main_bank0
	nop

	cmp	%o1, 0x3b
	be	main_bank1
	nop

	cmp	%o1, 0x3c
	be	main_bank0
	nop

	cmp	%o1, 0x3d
	be	main_bank1
	nop

	cmp	%o1, 0x3e
	be	main_bank0
	nop

	cmp	%o1, 0x3f
	be	main_bank1
	nop


	ba	test_failed
	nop

	/**********************
		L2 Bank 0
	**********************/
main_bank0:
	nop
	nop
/*******************
   DIMM 0,1
*******************/
L20_dimm01_init:
        setx    0x1111111111110000, %g7, %g5

	setx 	L20_MCU_DM0_BK0, %g7, %o0
        setx    L20_MCU_DM0_BK2, %g7, %o1
        setx    L20_MCU_DM0_BK4, %g7, %o2
        setx    L20_MCU_DM0_BK6, %g7, %o3

        setx    L20_MCU_DM1_BK0, %g7, %o4
        setx    L20_MCU_DM1_BK2, %g7, %o5
        setx    L20_MCU_DM1_BK4, %g7, %o6
        setx    L20_MCU_DM1_BK6, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up 
	add	%o0, %g4, %l0
        add     %o1, %g4, %l1
        add     %o2, %g4, %l2
        add     %o3, %g4, %l3
        add     %o4, %g4, %l4
        add     %o5, %g4, %l5
        add     %o6, %g4, %l6
        add     %o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
        mov     0x1, %g1
        sllx    %g1, 22, %g6

	mov	0x1, %g7
	sllx	%g7, 12, %g1
	set	0x2, %g3
L20_dimm01_rd_wr:
        !DIMM0,1
        stx     %g5, [%l0]
        stx     %g5, [%l1]
        stx     %g5, [%l2]
        stx     %g5, [%l3]
        stx     %g5, [%l4]
        stx     %g5, [%l5]
        stx     %g5, [%l6]
        stx     %g5, [%l7]

	add	%l0, %g6, %o0
        add     %l1, %g6, %o1
        add     %l2, %g6, %o2
        add     %l3, %g6, %o3
        add     %l4, %g6, %o4
        add     %l5, %g6, %o5
        add     %l6, %g6, %o6
        add     %l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]

	ldx	[%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7

	add	%l0, %g1, %l0
        add     %l1, %g1, %l1
        add     %l2, %g1, %l2
        add     %l3, %g1, %l3
        add     %l4, %g1, %l4
        add     %l5, %g1, %l5
        add     %l6, %g1, %l6
        add     %l7, %g1, %l7

        add     %o0, %g1, %o0
        add     %o1, %g1, %o1
        add     %o2, %g1, %o2
        add     %o3, %g1, %o3
        add     %o4, %g1, %o4
        add     %o5, %g1, %o5
        add     %o6, %g1, %o6
        add     %o7, %g1, %o7

	dec	%g3
	brnz	%g3, L20_dimm01_rd_wr 
	nop

/*******************
   DIMM2,3
*******************/
L20_dimm23_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L20_MCU_DM2_BK0, %g7, %o0
	setx	L20_MCU_DM2_BK2, %g7, %o1
	setx	L20_MCU_DM2_BK4, %g7, %o2
	setx	L20_MCU_DM2_BK6, %g7, %o3

	setx	L20_MCU_DM3_BK0, %g7, %o4
	setx	L20_MCU_DM3_BK2, %g7, %o5
	setx	L20_MCU_DM3_BK4, %g7, %o6
	setx	L20_MCU_DM3_BK6, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L20_dimm23_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

        add     %l0, %g6, %o0
        add     %l1, %g6, %o1
        add     %l2, %g6, %o2
        add     %l3, %g6, %o3
        add     %l4, %g6, %o4
        add     %l5, %g6, %o5
        add     %l6, %g6, %o6
        add     %l7, %g6, %o7

        ! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]



        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


        add     %l0, %g1, %l0
        add     %l1, %g1, %l1
        add     %l2, %g1, %l2
        add     %l3, %g1, %l3
        add     %l4, %g1, %l4
        add     %l5, %g1, %l5
        add     %l6, %g1, %l6
        add     %l7, %g1, %l7

        add     %o0, %g1, %o0
        add     %o1, %g1, %o1
        add     %o2, %g1, %o2
        add     %o3, %g1, %o3
        add     %o4, %g1, %o4
        add     %o5, %g1, %o5
        add     %o6, %g1, %o6
        add     %o7, %g1, %o7

	dec	%g3
	brnz	%g3, L20_dimm23_rd_wr
	nop

/********************************
*  DIMM 4, 5
*********************************/
L20_dimm45_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L20_MCU_DM4_BK0, %g7, %o0
	setx	L20_MCU_DM4_BK2, %g7, %o1
	setx	L20_MCU_DM4_BK4, %g7, %o2
	setx	L20_MCU_DM4_BK6, %g7, %o3

	setx	L20_MCU_DM5_BK0, %g7, %o4
	setx	L20_MCU_DM5_BK2, %g7, %o5
	setx	L20_MCU_DM5_BK4, %g7, %o6
	setx	L20_MCU_DM5_BK6, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L20_dimm45_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]



        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


        add     %l0, %g1, %l0
        add     %l1, %g1, %l1
        add     %l2, %g1, %l2
        add     %l3, %g1, %l3
        add     %l4, %g1, %l4
        add     %l5, %g1, %l5
        add     %l6, %g1, %l6
        add     %l7, %g1, %l7

        add     %o0, %g1, %o0
        add     %o1, %g1, %o1
        add     %o2, %g1, %o2
        add     %o3, %g1, %o3
        add     %o4, %g1, %o4
        add     %o5, %g1, %o5
        add     %o6, %g1, %o6
        add     %o7, %g1, %o7

	dec	%g3
	brnz	%g3, L20_dimm45_rd_wr
	nop

/********************************
*  DIMM 6, 7
*********************************/
L20_dimm67_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L20_MCU_DM6_BK0, %g7, %o0
	setx	L20_MCU_DM6_BK2, %g7, %o1
	setx	L20_MCU_DM6_BK4, %g7, %o2
	setx	L20_MCU_DM6_BK6, %g7, %o3

	setx	L20_MCU_DM7_BK0, %g7, %o4
	setx	L20_MCU_DM7_BK2, %g7, %o5
	setx	L20_MCU_DM7_BK4, %g7, %o6
	setx	L20_MCU_DM7_BK6, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L20_dimm67_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]

        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


        add     %l0, %g1, %l0
        add     %l1, %g1, %l1
        add     %l2, %g1, %l2
        add     %l3, %g1, %l3
        add     %l4, %g1, %l4
        add     %l5, %g1, %l5
        add     %l6, %g1, %l6
        add     %l7, %g1, %l7

        add     %o0, %g1, %o0
        add     %o1, %g1, %o1
        add     %o2, %g1, %o2
        add     %o3, %g1, %o3
        add     %o4, %g1, %o4
        add     %o5, %g1, %o5
        add     %o6, %g1, %o6
        add     %o7, %g1, %o7

	dec	%g3
	brnz	%g3, L20_dimm67_rd_wr
	nop

	/***********************************
   		L2 Bank 1
	***********************************/
main_bank1:
	nop
	nop

/********************************
*  DIMM 0, 1
*********************************/
L2_1_dimm01_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L2_1_MCU_DM0_BK1, %g7, %o0
	setx	L2_1_MCU_DM0_BK3, %g7, %o1
	setx	L2_1_MCU_DM0_BK5, %g7, %o2
	setx	L2_1_MCU_DM0_BK7, %g7, %o3

	setx	L2_1_MCU_DM1_BK1, %g7, %o4
	setx	L2_1_MCU_DM1_BK3, %g7, %o5
	setx	L2_1_MCU_DM1_BK5, %g7, %o6
	setx	L2_1_MCU_DM1_BK7, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L2_1_dimm01_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]



        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


        add     %l0, %g1, %l0
        add     %l1, %g1, %l1
        add     %l2, %g1, %l2
        add     %l3, %g1, %l3
        add     %l4, %g1, %l4
        add     %l5, %g1, %l5
        add     %l6, %g1, %l6
        add     %l7, %g1, %l7

        add     %o0, %g1, %o0
        add     %o1, %g1, %o1
        add     %o2, %g1, %o2
        add     %o3, %g1, %o3
        add     %o4, %g1, %o4
        add     %o5, %g1, %o5
        add     %o6, %g1, %o6
        add     %o7, %g1, %o7

	dec	%g3
	brnz	%g3, L2_1_dimm01_rd_wr
	nop

/********************************
*  DIMM 2, 3
*********************************/
L2_1_dimm23_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L2_1_MCU_DM0_BK1, %g7, %o0
	setx	L2_1_MCU_DM0_BK3, %g7, %o1
	setx	L2_1_MCU_DM0_BK5, %g7, %o2
	setx	L2_1_MCU_DM0_BK7, %g7, %o3

	setx	L2_1_MCU_DM1_BK1, %g7, %o4
	setx	L2_1_MCU_DM1_BK3, %g7, %o5
	setx	L2_1_MCU_DM1_BK5, %g7, %o6
	setx	L2_1_MCU_DM1_BK7, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L2_1_dimm23_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]



        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


	add	%l0, %g1, %l0
	add	%l1, %g1, %l1
	add	%l2, %g1, %l2
	add	%l3, %g1, %l3
	add	%l4, %g1, %l4
	add	%l5, %g1, %l5
	add	%l6, %g1, %l6
	add	%l7, %g1, %l7

	add	%o0, %g1, %o0
	add	%o1, %g1, %o1
	add	%o2, %g1, %o2
	add	%o3, %g1, %o3
	add	%o4, %g1, %o4
	add	%o5, %g1, %o5
	add	%o6, %g1, %o6
	add	%o7, %g1, %o7

	dec	%g3
	 brnz    %g3, L2_1_dimm23_rd_wr
        nop

/********************************
*  DIMM4, 5
*********************************/
L2_1_dimm45_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L2_1_MCU_DM0_BK1, %g7, %o0
	setx	L2_1_MCU_DM0_BK3, %g7, %o1
	setx	L2_1_MCU_DM0_BK5, %g7, %o2
	setx	L2_1_MCU_DM0_BK7, %g7, %o3

	setx	L2_1_MCU_DM1_BK1, %g7, %o4
	setx	L2_1_MCU_DM1_BK3, %g7, %o5
	setx	L2_1_MCU_DM1_BK5, %g7, %o6
	setx	L2_1_MCU_DM1_BK7, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L2_1_dimm45_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]



        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


	add	%l0, %g1, %l0
	add	%l1, %g1, %l1
	add	%l2, %g1, %l2
	add	%l3, %g1, %l3
	add	%l4, %g1, %l4
	add	%l5, %g1, %l5
	add	%l6, %g1, %l6
	add	%l7, %g1, %l7

	add	%o0, %g1, %o0
	add	%o1, %g1, %o1
	add	%o2, %g1, %o2
	add	%o3, %g1, %o3
	add	%o4, %g1, %o4
	add	%o5, %g1, %o5
	add	%o6, %g1, %o6
	add	%o7, %g1, %o7

	dec	%g3
	 brnz    %g3, L2_1_dimm45_rd_wr
        nop

/********************************
*  DIMM 6, 7
*********************************/
L2_1_dimm67_init:
	setx	0x1111111111110000, %g7, %g5

	setx	L2_1_MCU_DM0_BK1, %g7, %o0
	setx	L2_1_MCU_DM0_BK3, %g7, %o1
	setx	L2_1_MCU_DM0_BK5, %g7, %o2
	setx	L2_1_MCU_DM0_BK7, %g7, %o3

	setx	L2_1_MCU_DM1_BK1, %g7, %o4
	setx	L2_1_MCU_DM1_BK3, %g7, %o5
	setx	L2_1_MCU_DM1_BK5, %g7, %o6
	setx	L2_1_MCU_DM1_BK7, %g7, %o7

	! to make the addr unique for each thread in PA[28] and up
	add	%o0, %g4, %l0
	add	%o1, %g4, %l1
	add	%o2, %g4, %l2
	add	%o3, %g4, %l3
	add	%o4, %g4, %l4
	add	%o5, %g4, %l5
	add	%o6, %g4, %l6
	add	%o7, %g4, %l7

	setx	0xabcdef1234, %g7, %g2
	mov	0x1, %g1
	sllx	%g1, 22, %g6

	mov	0x1, %g7
	sllx    %g7, 12, %g1
	set	0x2, %g3

L2_1_dimm67_rd_wr:
	stx	%g5, [%l0]
	stx	%g5, [%l1]
	stx	%g5, [%l2]
	stx	%g5, [%l3]
	stx	%g5, [%l4]
	stx	%g5, [%l5]
	stx	%g5, [%l6]
	stx	%g5, [%l7]

	add	%l0, %g6, %o0
	add	%l1, %g6, %o1
	add	%l2, %g6, %o2
	add	%l3, %g6, %o3
	add	%l4, %g6, %o4
	add	%l5, %g6, %o5
	add	%l6, %g6, %o6
	add	%l7, %g6, %o7

	! cause wrb
        stx     %g2, [%o0]
        stx     %g2, [%o1]
        stx     %g2, [%o2]
        stx     %g2, [%o3]
        stx     %g2, [%o4]
        stx     %g2, [%o5]
        stx     %g2, [%o6]
        stx     %g2, [%o7]


        ldx     [%l0], %g7
        ldx     [%l1], %g7
        ldx     [%l2], %g7
        ldx     [%l3], %g7
        ldx     [%l4], %g7
        ldx     [%l5], %g7
        ldx     [%l6], %g7
        ldx     [%l7], %g7

        ldx     [%o0], %g7
        ldx     [%o1], %g7
        ldx     [%o2], %g7
        ldx     [%o3], %g7
        ldx     [%o4], %g7
        ldx     [%o5], %g7
        ldx     [%o6], %g7
        ldx     [%o7], %g7


	
	add	%l0, %g1, %l0
	add	%l1, %g1, %l1
	add	%l2, %g1, %l2
	add	%l3, %g1, %l3
	add	%l4, %g1, %l4
	add	%l5, %g1, %l5
	add	%l6, %g1, %l6
	add	%l7, %g1, %l7

	add	%o0, %g1, %o0
	add	%o1, %g1, %o1
	add	%o2, %g1, %o2
	add	%o3, %g1, %o3
	add	%o4, %g1, %o4
	add	%o5, %g1, %o5
	add	%o6, %g1, %o6
	add	%o7, %g1, %o7

	dec	%g3
	 brnz    %g3, L2_1_dimm67_rd_wr
        nop

/******************************************************
 * Exit code
 *******************************************************/

test_passed:
EXIT_GOOD

test_failed:
EXIT_BAD

