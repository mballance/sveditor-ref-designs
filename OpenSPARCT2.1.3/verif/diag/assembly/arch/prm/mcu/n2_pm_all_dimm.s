/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_pm_all_dimm.s
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

#define L2_1_MCU_DM0_BK0 0x0000134040
#define L2_1_MCU_DM0_BK2 0x0000134240
#define L2_1_MCU_DM0_BK4 0x0000134440
#define L2_1_MCU_DM0_BK6 0x0000134640

#define L2_1_MCU_DM1_BK0 0x0800134040
#define L2_1_MCU_DM1_BK2 0x0800134240
#define L2_1_MCU_DM1_BK4 0x0800134440
#define L2_1_MCU_DM1_BK6 0x0800134640

#define L2_1_MCU_DM2_BK0 0x1000134040
#define L2_1_MCU_DM2_BK2 0x1000134240
#define L2_1_MCU_DM2_BK4 0x1000134440
#define L2_1_MCU_DM2_BK6 0x1000134640

#define L2_1_MCU_DM3_BK0 0x1800134040
#define L2_1_MCU_DM3_BK2 0x1800134240
#define L2_1_MCU_DM3_BK4 0x1800134440
#define L2_1_MCU_DM3_BK6 0x1800134640

#define L2_1_MCU_DM4_BK0 0x2000134040
#define L2_1_MCU_DM4_BK2 0x2000134240
#define L2_1_MCU_DM4_BK4 0x2000134440
#define L2_1_MCU_DM4_BK6 0x2000134640

#define L2_1_MCU_DM5_BK0 0x2800134040
#define L2_1_MCU_DM5_BK2 0x2800134240
#define L2_1_MCU_DM5_BK4 0x2800134440
#define L2_1_MCU_DM5_BK6 0x2800134640

#define L2_1_MCU_DM6_BK0 0x3000134040
#define L2_1_MCU_DM6_BK2 0x3000134240
#define L2_1_MCU_DM6_BK4 0x3000134440
#define L2_1_MCU_DM6_BK6 0x3000134640

#define L2_1_MCU_DM7_BK0 0x3800134040
#define L2_1_MCU_DM7_BK2 0x3800134240
#define L2_1_MCU_DM7_BK4 0x3800134440
#define L2_1_MCU_DM7_BK6 0x3800134640
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

#define L2_1_MCU_DM0_BK0 0x0000134040
#define L2_1_MCU_DM0_BK2 0x0000134140
#define L2_1_MCU_DM0_BK4 0x0000134240
#define L2_1_MCU_DM0_BK6 0x0000134340

#define L2_1_MCU_DM1_BK0 0x0400134040
#define L2_1_MCU_DM1_BK2 0x0400134140
#define L2_1_MCU_DM1_BK4 0x0400134240
#define L2_1_MCU_DM1_BK6 0x0400134340

#define L2_1_MCU_DM2_BK0 0x0800134040
#define L2_1_MCU_DM2_BK2 0x0800134140
#define L2_1_MCU_DM2_BK4 0x0800134240
#define L2_1_MCU_DM2_BK6 0x0800134340

#define L2_1_MCU_DM3_BK0 0x0c00134040
#define L2_1_MCU_DM3_BK2 0x0c00134140
#define L2_1_MCU_DM3_BK4 0x0c00134240
#define L2_1_MCU_DM3_BK6 0x0c00134340

#define L2_1_MCU_DM4_BK0 0x1000134040
#define L2_1_MCU_DM4_BK2 0x1000134140
#define L2_1_MCU_DM4_BK4 0x1000134240
#define L2_1_MCU_DM4_BK6 0x1000134340

#define L2_1_MCU_DM5_BK0 0x1400134040
#define L2_1_MCU_DM5_BK2 0x1400134140
#define L2_1_MCU_DM5_BK4 0x1400134240
#define L2_1_MCU_DM5_BK6 0x1400134340

#define L2_1_MCU_DM6_BK0 0x1800134040
#define L2_1_MCU_DM6_BK2 0x1800134140
#define L2_1_MCU_DM6_BK4 0x1800134240
#define L2_1_MCU_DM6_BK6 0x1800134340

#define L2_1_MCU_DM7_BK0 0x1c00134040
#define L2_1_MCU_DM7_BK2 0x1c00134140
#define L2_1_MCU_DM7_BK4 0x1c00134240
#define L2_1_MCU_DM7_BK6 0x1c00134340
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


#define L2_1_MCU_DM0_BK0 0x0000134040
#define L2_1_MCU_DM0_BK2 0x00001340c0
#define L2_1_MCU_DM0_BK4 0x0000134140
#define L2_1_MCU_DM0_BK6 0x00001341c0

#define L2_1_MCU_DM1_BK0 0x0200134040
#define L2_1_MCU_DM1_BK2 0x02001340c0
#define L2_1_MCU_DM1_BK4 0x0200134140
#define L2_1_MCU_DM1_BK6 0x02001341c0

#define L2_1_MCU_DM2_BK0 0x0400134040
#define L2_1_MCU_DM2_BK2 0x04001340c0
#define L2_1_MCU_DM2_BK4 0x0400134140
#define L2_1_MCU_DM2_BK6 0x04001341c0

#define L2_1_MCU_DM3_BK0 0x0600134040
#define L2_1_MCU_DM3_BK2 0x06001340c0
#define L2_1_MCU_DM3_BK4 0x0600134140
#define L2_1_MCU_DM3_BK6 0x06001341c0

#define L2_1_MCU_DM4_BK0 0x0800134040
#define L2_1_MCU_DM4_BK2 0x08001340c0
#define L2_1_MCU_DM4_BK4 0x0800134140
#define L2_1_MCU_DM4_BK6 0x08001341c0

#define L2_1_MCU_DM5_BK0 0x0a00134040
#define L2_1_MCU_DM5_BK2 0x0a001340c0
#define L2_1_MCU_DM5_BK4 0x0a00134140
#define L2_1_MCU_DM5_BK6 0x0a001341c0

#define L2_1_MCU_DM6_BK0 0x0c00134040
#define L2_1_MCU_DM6_BK2 0x0c001340c0
#define L2_1_MCU_DM6_BK4 0x0c00134140
#define L2_1_MCU_DM6_BK6 0x0c001341c0

#define L2_1_MCU_DM7_BK0 0x0e00134040
#define L2_1_MCU_DM7_BK2 0x0e001340c0
#define L2_1_MCU_DM7_BK4 0x0e00134140
#define L2_1_MCU_DM7_BK6 0x0e001341c0
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

L2_on_off_dm:
        setx  L2CS_PA0, %l6, %g1
        ldx   [%g1], %o1

        setx  0xfffffffffffffffc, %l6, %i1      ! <1:0>=00
        and   %i1, %o1, %o2

        mov   L2_ON_OFF_DM, %l0
        or    %o2, %l0, %l1

        stx   %l1, [%g1]


	membar #Sync

#ifdef BANK0
	/**********************
		L2 Bank 0
	**********************/

/*******************
   DIMM 0,1
*******************/
L20_dimm01_init:
        setx    0x1111111111111110, %g7, %o0
        setx    0x2222222222222220, %g7, %o1
        setx    0x3333333333333330, %g7, %o2
        setx    0x4444444444444440, %g7, %o3
        setx    0x5555555555555550, %g7, %o4
        setx    0x6666666666666660, %g7, %o5
        setx    0x7777777777777770, %g7, %o6
        setx    0x8888888888888880, %g7, %o7

	setx 	L20_MCU_DM0_BK0, %g7, %l0
        setx    L20_MCU_DM0_BK2, %g7, %l1
        setx    L20_MCU_DM0_BK4, %g7, %l2
        setx    L20_MCU_DM0_BK6, %g7, %l3

        setx    L20_MCU_DM1_BK0, %g7, %l4
        setx    L20_MCU_DM1_BK2, %g7, %l5
        setx    L20_MCU_DM1_BK4, %g7, %l6
        setx    L20_MCU_DM1_BK6, %g7, %l7

L20_dimm01_rd_wr:
        !DIMM0,1
        stx     %o0, [%l0]
        ldx     [%l0], %g1

        stx     %o1, [%l1]
        ldx     [%l1], %g1

        stx     %o2, [%l2]
        ldx     [%l2], %g1

        stx     %o3, [%l3]
        ldx     [%l3], %g1

        stx     %o4, [%l4]
        ldx     [%l4], %g1

        stx     %o5, [%l5]
        ldx     [%l5], %g1

        stx     %o6, [%l6]
        ldx     [%l6], %g1

        stx     %o7, [%l7]
        ldx     [%l7], %g1

/*******************
   DIMM2,3
*******************/
L20_dimm23_init:
        setx    L20_MCU_DM2_BK0, %g7, %i0
        setx    L20_MCU_DM2_BK2, %g7, %i1
        setx    L20_MCU_DM2_BK4, %g7, %i2
        setx    L20_MCU_DM2_BK6, %g7, %i3

        setx    L20_MCU_DM3_BK0, %g7, %i4
        setx    L20_MCU_DM3_BK2, %g7, %i5
        setx    L20_MCU_DM3_BK4, %g7, %i6
        setx    L20_MCU_DM3_BK6, %g7, %i7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L20_dimm23_rd_wr:
	!DIMM0,1
	stx	%o0, [%i0]
	ldx	[%i0], %g1

        stx     %o1, [%i1]      
        ldx     [%i1], %g1     

        stx     %o2, [%i2]      
        ldx     [%i2], %g1     

        stx     %o3, [%i3]      
        ldx     [%i3], %g1     
	
        stx     %o4, [%i4]      
        ldx     [%i4], %g1     

        stx     %o5, [%i5]      
        ldx     [%i5], %g1     

        stx     %o6, [%i6]      
        ldx     [%i6], %g1     

        stx     %o7, [%i7]      
        ldx     [%i7], %g1     


/********************************
*  DIMM 4, 5
*********************************/
L20_dimm45_init:
        setx    L20_MCU_DM4_BK0, %g7, %l0
        setx    L20_MCU_DM4_BK2, %g7, %l1
        setx    L20_MCU_DM4_BK4, %g7, %l2
        setx    L20_MCU_DM4_BK6, %g7, %l3

        setx    L20_MCU_DM5_BK0, %g7, %l4
        setx    L20_MCU_DM5_BK2, %g7, %l5
        setx    L20_MCU_DM5_BK4, %g7, %l6
        setx    L20_MCU_DM5_BK6, %g7, %l7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L20_dimm45_rd_wr:
        !DIMM4,5
        stx     %o0, [%l0]
        ldx     [%l0], %g1

        stx     %o1, [%l1]
        ldx     [%l1], %g1

        stx     %o2, [%l2]
        ldx     [%l2], %g1

        stx     %o3, [%l3]
        ldx     [%l3], %g1

        stx     %o4, [%l4]
        ldx     [%l4], %g1

        stx     %o5, [%l5]
        ldx     [%l5], %g1

        stx     %o6, [%l6]
        ldx     [%l6], %g1

        stx     %o7, [%l7]
        ldx     [%l7], %g1

/********************************
*  DIMM 6, 7
*********************************/
L20_dimm67_init:
        setx    L20_MCU_DM6_BK0, %g7, %i0
        setx    L20_MCU_DM6_BK2, %g7, %i1
        setx    L20_MCU_DM6_BK4, %g7, %i2
        setx    L20_MCU_DM6_BK6, %g7, %i3

        setx    L20_MCU_DM7_BK0, %g7, %i4
        setx    L20_MCU_DM7_BK2, %g7, %i5
        setx    L20_MCU_DM7_BK4, %g7, %i6
        setx    L20_MCU_DM7_BK6, %g7, %i7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L20_dimm67_rd_wr:
        !DIMM6,7
        stx     %o0, [%i0]
        ldx     [%i0], %g1

        stx     %o1, [%i1]
        ldx     [%i1], %g1

        stx     %o2, [%i2]
        ldx     [%i2], %g1

        stx     %o3, [%i3]
        ldx     [%i3], %g1

        stx     %o4, [%i4]
        ldx     [%i4], %g1

        stx     %o5, [%i5]
        ldx     [%i5], %g1

        stx     %o6, [%i6]
        ldx     [%i6], %g1

        stx     %o7, [%i7]
        ldx     [%i7], %g1

#endif

#ifdef BANK1

	/***********************************
   		L2 Bank 1
	***********************************/

/********************************
*  DIMM 0, 1
*********************************/
L2_1_dimm01_init:
        setx    L2_1_MCU_DM0_BK0, %g7, %l0
        setx    L2_1_MCU_DM0_BK2, %g7, %l1
        setx    L2_1_MCU_DM0_BK4, %g7, %l2
        setx    L2_1_MCU_DM0_BK6, %g7, %l3

        setx    L2_1_MCU_DM1_BK0, %g7, %l4
        setx    L2_1_MCU_DM1_BK2, %g7, %l5
        setx    L2_1_MCU_DM1_BK4, %g7, %l6
        setx    L2_1_MCU_DM1_BK6, %g7, %l7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L2_1_dimm01_rd_wr:
        !DIMM0,1
        stx     %o0, [%l0]
        ldx     [%l0], %g1

        stx     %o1, [%l1]
        ldx     [%l1], %g1

        stx     %o2, [%l2]
        ldx     [%l2], %g1

        stx     %o3, [%l3]
        ldx     [%l3], %g1

        stx     %o4, [%l4]
        ldx     [%l4], %g1

        stx     %o5, [%l5]
        ldx     [%l5], %g1

        stx     %o6, [%l6]
        ldx     [%l6], %g1

        stx     %o7, [%l7]
        ldx     [%l7], %g1

/********************************
*  DIMM 2, 3
*********************************/
L2_1_dimm23_init:
        setx    L2_1_MCU_DM2_BK0, %g7, %i0
        setx    L2_1_MCU_DM2_BK2, %g7, %i1
        setx    L2_1_MCU_DM2_BK4, %g7, %i2
        setx    L2_1_MCU_DM2_BK6, %g7, %i3

        setx    L2_1_MCU_DM3_BK0, %g7, %i4
        setx    L2_1_MCU_DM3_BK2, %g7, %i5
        setx    L2_1_MCU_DM3_BK4, %g7, %i6
        setx    L2_1_MCU_DM3_BK6, %g7, %i7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L2_1_dimm23_rd_wr:
        !DIMM2,3
        stx     %o0, [%i0]
        ldx     [%i0], %g1

        stx     %o1, [%i1]
        ldx     [%i1], %g1

        stx     %o2, [%i2]
        ldx     [%i2], %g1

        stx     %o3, [%i3]
        ldx     [%i3], %g1

        stx     %o4, [%i4]
        ldx     [%i4], %g1

        stx     %o5, [%i5]
        ldx     [%i5], %g1

        stx     %o6, [%i6]
        ldx     [%i6], %g1

        stx     %o7, [%i7]
        ldx     [%i7], %g1


/********************************
*  DIMM4, 5
*********************************/
L2_1_dimm45_init:
        setx    L2_1_MCU_DM4_BK0, %g7, %l0
        setx    L2_1_MCU_DM4_BK2, %g7, %l1
        setx    L2_1_MCU_DM4_BK4, %g7, %l2
        setx    L2_1_MCU_DM4_BK6, %g7, %l3

        setx    L2_1_MCU_DM5_BK0, %g7, %l4
        setx    L2_1_MCU_DM5_BK2, %g7, %l5
        setx    L2_1_MCU_DM5_BK4, %g7, %l6
        setx    L2_1_MCU_DM5_BK6, %g7, %l7

        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L2_1_dimm45_rd_wr:
        !DIMM4,5
        stx     %o0, [%l0]
        ldx     [%l0], %g1

        stx     %o1, [%l1]
        ldx     [%l1], %g1

        stx     %o2, [%l2]
        ldx     [%l2], %g1

        stx     %o3, [%l3]
        ldx     [%l3], %g1

        stx     %o4, [%l4]
        ldx     [%l4], %g1

        stx     %o5, [%l5]
        ldx     [%l5], %g1

        stx     %o6, [%l6]
        ldx     [%l6], %g1

        stx     %o7, [%l7]
        ldx     [%l7], %g1

/********************************
*  DIMM 6, 7
*********************************/
L2_1_dimm67_init:
        setx    L2_1_MCU_DM6_BK0, %g7, %i0
        setx    L2_1_MCU_DM6_BK2, %g7, %i1
        setx    L2_1_MCU_DM6_BK4, %g7, %i2
        setx    L2_1_MCU_DM6_BK6, %g7, %i3

        setx    L2_1_MCU_DM7_BK0, %g7, %i4
        setx    L2_1_MCU_DM7_BK2, %g7, %i5
        setx    L2_1_MCU_DM7_BK4, %g7, %i6
        setx    L2_1_MCU_DM7_BK6, %g7, %i7


        inc     %o0
        inc     %o1
        inc     %o2
        inc     %o3
        inc     %o4
        inc     %o5
        inc     %o6
        inc     %o7

L2_1_dimm67_rd_wr:
        !DIMM6,7
        stx     %o0, [%i0]
        ldx     [%i0], %g1

        stx     %o1, [%i1]
        ldx     [%i1], %g1

        stx     %o2, [%i2]
        ldx     [%i2], %g1

        stx     %o3, [%i3]
        ldx     [%i3], %g1

        stx     %o4, [%i4]
        ldx     [%i4], %g1

        stx     %o5, [%i5]
        ldx     [%i5], %g1

        stx     %o6, [%i6]
        ldx     [%i6], %g1

        stx     %o7, [%i7]
        ldx     [%i7], %g1
#endif
	

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

