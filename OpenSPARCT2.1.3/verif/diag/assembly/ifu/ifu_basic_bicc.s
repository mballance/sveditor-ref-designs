/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ifu_basic_bicc.s
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


    ! Now do some useful stuff ..
start:	
	add  %g0, 0x0000, %g1
	add  %g0, 0x0000, %g2
	add  %g0, 0x0000, %g3
	add  %g0, 0x0000, %g4
	add  %g0, 0x0000, %g5
	add  %g0, 0x0000, %g6
	add  %g0, 0x0000, %g7
        addcc %g0, 0x0000, %g7
B0:     addcc %g0, 0x0001, %g2
	ba  B1
	addcc %g0, 0x1fff, %g1
        inc   %g7
B1:     addcc %g0, 0x0001, %g2
	bne B2
	addcc %g0, 0x1fff, %g1
        inc   %g7
B2:     addcc %g0, 0x0000, %g2
        be    B3
	addcc %g0, 0x1fff, %g1
        inc   %g7
B3:     addcc %g0, 0x0001, %g2
        bg    B4
	addcc %g0, 0x1fff, %g1
        inc   %g7
B4:     addcc %g0, 0x0000, %g2
        dec   %g2
        ble    B5
	addcc %g0, 0x1fff, %g1
        inc   %g7
B5:     addcc %g0, 0x0001, %g2
        bge    B6
	addcc %g0, 0x1fff, %g1
        inc   %g7
B6:     addcc %g0, 0x0000, %g2
        bge    B7
	addcc %g0, 0x1fff, %g1
        inc   %g7
B7:     addcc %g0, 0x0000, %g2
        dec   %g2
        bl     B8
	addcc %g0, 0x1fff, %g1
        inc   %g7
B8:     addcc %g0, 0x0001, %g2
        bgu    B9
	addcc %g0, 0x1fff, %g1
        inc   %g7
B9:     addcc %g0, 0x0000, %g2
        bleu  B10
	addcc %g0, 0x1fff, %g1
        inc   %g7
B10:    addcc %g0, 0x0001, %g2
        dec   %g2
        bcc   B11
	addcc %g0, 0x1fff, %g1
        inc   %g7
B11:    addcc %g0, 0x0002, %g2
        dec   %g2
        bpos  B12
	addcc %g0, 0x1fff, %g1
        inc   %g7
B12:    addcc %g0, 0x0000, %g2
        dec   %g2
        bneg  B13
	addcc %g0, 0x1fff, %g1
        inc   %g7
B13:    addcc %g0, 0x0001, %g2
        dec   %g2
        bvc   Bx
	addcc %g0, 0x1fff, %g1
        inc   %g7
Bx:     cmp   %g7, 0x0
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


