/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ifu_basic_br.s
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
#include "old_boot.s"

!SECTION .MAIN TEXT_VA = 0xfffffffff0000000
!attr_text {
!    Name=.MAIN,
!    hypervisor
!}

.text
.global main
		
main:

    ! 1st fetch should be from RSTVaddr+0x20

    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap
    illtrap

    ! First intsruction fetched should be from here  RSTVaddr+0x20
     
    ! First set up some registers with values ..

    setx 0x524e4f2c0e9a829e, %g1, %g2
    setx 0x21f892f023188c4b, %g1, %g3
    setx 0x0b2a330b797f1524, %g1, %g4

    setx 0xfffffffff0000000, %g1, %g5
    setx 0x454f5c220664cd3c, %g1, %g6
    setx 0x5d7085ae11898343, %g1, %g7

    ! Now do some useful stuff ..
start:	
	add  %g1, %g2, %g2
	add  %g2, %g3, %g3
	add  %g3, %g4, %g4
	add  %g4, %g5, %g6
	add  %g5, %g6, %g7
	add  %g6, %g7, %g1
	bpos,a start
	addcc %g0, 0x1fff, %g1

	xor  %g2, %g6, %g1
    
        inc %g6 
        cmp %g5, %g6 ;
        cmp %g3, 0x1
    
	nop
	nop
	nop
	nop
	nop
	nop
!good_trap:
!    b good_trap
EXIT_GOOD
    nop
    nop

!SECTION .DATA TEXT_VA = 0xffffff0000000000
!attr_text {
!    Name=.DATA,
!    hypervisor
!}

.data
.xword 0x0
.xword 0x1
.xword 0x2
.xword 0x3
.xword 0x4
.xword 0x5
.xword 0x6
.xword 0x7

.end


