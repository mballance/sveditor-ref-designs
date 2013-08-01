/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_pm_mcu_diff_th_wr_rd.s
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


#ifdef BANK0
#define L2_0_ADDR0      0x220000000
#endif

#ifdef BANK1
#define L2_0_ADDR0      0x220000040
#endif

#define L2_0_ADDR1      0x440000000

#define	TAG_SHIFT	22

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

get_th_id_o0:
        ta      T_RD_THID
	
	! Core0
	cmp	%o1, 0x0
	be	main_th_wr
	nop

	cmp	%o1, 0x1
	be	main_th_rd
	nop

	cmp	%o1, 0x2
	be	main_th_wr
	nop

	cmp	%o1, 0x3
	be	main_th_rd
	nop

	cmp	%o1, 0x4
	be	main_th_wr
	nop

	cmp	%o1, 0x5
	be	main_th_rd
	nop

	cmp	%o1, 0x6
	be	main_th_wr
	nop

	cmp	%o1, 0x7
	be	main_th_rd
	nop

        ! Core1
        cmp     %o1, 0x8
	be	main_th_wr
        nop

        cmp     %o1, 0x9
        be      main_th_rd
        nop

        cmp     %o1, 0xa
        be      main_th_wr
        nop

        cmp     %o1, 0xb
        be      main_th_rd
        nop

        cmp     %o1, 0xc
        be      main_th_wr
        nop

        cmp     %o1, 0xd
        be      main_th_rd
        nop

        cmp     %o1, 0xe
        be      main_th_wr
        nop

        cmp     %o1, 0xf
        be      main_th_rd
        nop


        ! Core2
	cmp	%o1, 0x10
	be	main_th_wr
	nop

	cmp	%o1, 0x11
	be	main_th_rd
	nop

	cmp	%o1, 0x12
	be	main_th_wr
	nop

	cmp	%o1, 0x13
	be	main_th_rd
	nop

	cmp	%o1, 0x14
	be	main_th_wr
	nop

	cmp	%o1, 0x15
	be	main_th_rd
	nop

	cmp	%o1, 0x16
	be	main_th_wr
	nop

	cmp	%o1, 0x17
	be	main_th_rd
	nop


        ! Core3
	cmp	%o1, 0x18
	be	main_th_wr
	nop

	cmp	%o1, 0x19
	be	main_th_rd
	nop

	cmp	%o1, 0x1a
	be	main_th_wr
	nop

	cmp	%o1, 0x1b
	be	main_th_rd
	nop

	cmp	%o1, 0x1c
	be	main_th_wr
	nop

	cmp	%o1, 0x1d
	be	main_th_rd
	nop

	cmp	%o1, 0x1e
	be	main_th_wr
	nop

	cmp	%o1, 0x1f
	be	main_th_rd
	nop


        ! Core4
	cmp	%o1, 0x20
	be	main_th_wr
	nop

	cmp	%o1, 0x21
	be	main_th_rd
	nop

	cmp	%o1, 0x22
	be	main_th_wr
	nop

	cmp	%o1, 0x23
	be	main_th_rd
	nop

	cmp	%o1, 0x24
	be	main_th_wr
	nop

	cmp	%o1, 0x25
	be	main_th_rd
	nop

	cmp	%o1, 0x26
	be	main_th_wr
	nop

	cmp	%o1, 0x27
	be	main_th_rd
	nop


        ! Core5
	cmp	%o1, 0x28
	be	main_th_wr
	nop

	cmp	%o1, 0x29
	be	main_th_rd
	nop

	cmp	%o1, 0x2a
	be	main_th_wr
	nop

	cmp	%o1, 0x2b
	be	main_th_rd
	nop

	cmp	%o1, 0x2c
	be	main_th_wr
	nop

	cmp	%o1, 0x2d
	be	main_th_rd
	nop

	cmp	%o1, 0x2e
	be	main_th_wr
	nop

	cmp	%o1, 0x2f
	be	main_th_rd
	nop


        ! Core6
	cmp	%o1, 0x30
	be	main_th_wr
	nop

	cmp	%o1, 0x31
	be	main_th_rd
	nop

	cmp	%o1, 0x32
	be	main_th_wr
	nop

	cmp	%o1, 0x33
	be	main_th_rd
	nop

	cmp	%o1, 0x34
	be	main_th_wr
	nop

	cmp	%o1, 0x35
	be	main_th_rd
	nop

	cmp	%o1, 0x36
	be	main_th_wr
	nop

	cmp	%o1, 0x37
	be	main_th_rd
	nop


        ! Core7
	cmp	%o1, 0x38
	be	main_th_wr
	nop

	cmp	%o1, 0x39
	be	main_th_rd
	nop

	cmp	%o1, 0x3a
	be	main_th_wr
	nop

	cmp	%o1, 0x3b
	be	main_th_rd
	nop

	cmp	%o1, 0x3c
	be	main_th_wr
	nop

	cmp	%o1, 0x3d
	be	main_th_rd
	nop

	cmp	%o1, 0x3e
	be	main_th_wr
	nop

	cmp	%o1, 0x3f
	be	main_th_rd
	nop


	ba	test_failed
	nop

        /*****************************************
                All Memory Write 
        ******************************************/
main_th_wr:
        setx    0x1111111111110000, %g7, %g1
        setx    0x2222222222220000, %g7, %g2
	mov 	0x1, %l2
	sllx 	%l2, 22, %g6

	setx	L2_0_ADDR0, %g7, %g3
	setx	0x40,	%g7, %g5
st_loop_1:
	stx	%g1, [%g3]
	add	%g3, %g6, %g4
        stx     %g2, [%g4]

	add 	%g3, 0x200, %g3

	dec	%g5

	inc	%g1
	inc	%g2

	cmp	%g5, %g0
	bne	st_loop_1
	nop

        /*****************************************
		All Memory Read
	******************************************/
main_th_rd:
        setx    L2_0_ADDR1, %g7, %g3
        setx    0x40, %g7, %g5
ld_loop_1:
        ldx     [%g3], %o1
        add     %g3, %g6, %g4
        ldx     [%g4], %o2

        add     %g3, 0x200, %g3

        dec     %g5

        cmp     %g5, %g0
        bne     ld_loop_1        
        nop


/******************************************************
 * Exit code
 *******************************************************/

test_passed:
EXIT_GOOD

test_failed:
EXIT_BAD

