/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ifu_basic_branch.s
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
    
    setx 0x524e4f2c0e9a829e, %g1, %g2
    setx 0x21f892f023188c4b, %g1, %g3
    setx 0x0b2a330b797f1524, %g1, %g4

    setx 0xfffffffff0000000, %g1, %g5
    setx 0x454f5c220664cd3c, %g1, %g6
    setx 0x5d7085ae11898343, %g1, %g7

    ! Now do some useful stuff ..

	bpos,a t2
	bpos,a t4
	inc  %g2
	b goodbye


t2:
	bpos,a t3
	inc %g3			
	b goodbye


t3:
	bneg,a goodbye
	inc %g4
	b goodbye


t4:
	bpos,a t5
        inc %g5
	b goodbye


t5:
	bneg,a goodbye
        inc %g6 
	xor  %g2, %g6, %g1
    
        cmp %g5, %g6 ;
        cmp %g3, 0x1


    setx 0x524e4f2c0e9a829e, %g1, %g2
    setx 0x21f892f023188c4b, %g1, %g3
    setx 0x0b2a330b797f1524, %g1, %g4

    setx 0xfffffffff0000000, %g1, %g5
    setx 0x454f5c220664cd3c, %g1, %g6
    setx 0x5d7085ae11898343, %g1, %g7

    ! Now do some useful stuff ..

	bpos r2
	bpos r4
	inc  %g2
	b goodbye


r2:
	bpos r3
	inc %g3			
	b goodbye


r3:
	bneg goodbye
	inc %g4
	b goodbye


r4:
	bpos r5
        inc %g5
	b goodbye


r5:
	bneg goodbye
        inc %g6 
	xor  %g2, %g6, %g1
    
        cmp %g5, %g6 ;
        cmp %g3, 0x1

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
    set 0x4,    %g2
	set	0x0,	%g7
	!# Input registers
	set	-0x4,	%i0
	!# Local registers
	set	0x6BC97FF6,	%l0

	!# Execute some ALU ops ..
    brz %g1, b1
    nop
    inc %g7
b1: brlez %i0, b2
    nop
    inc %g7
b2: brlez %g1, b3
    nop
    inc %g7
b3: brlz %i0, b4
    nop
    inc %g7
b4: brnz %g2, b5
    nop
    inc %g7
b5: brnz %i0, b6
    nop
    inc %g7
b6: brgz %g2, b7
    nop
    inc %g7
b7: brgez %g2, b8
    nop
    inc %g7
b8: brgez %g1, b9
    nop
    inc %g7
b9: brz %g7, not_taken_cases
    nop
back_br: 
    dec %g7
    dec %g7
!    brz %g7, good_trap
    brz %g7, my_pass
    nop
    EXIT_BAD

not_taken_cases:
	set	0x8,	%g7
    brz %g2, b10
    nop
    dec %g7
b10: brlez %g2, b11
    nop
    dec %g7
b11: brlz %g1, b12
    nop
    dec %g7
b12: brlz %g2, b13
    nop
    dec %g7
b13: brnz %g1, b14
    nop
    dec %g7
b14: brgz %i0, b15
    nop
    dec %g7
b15: brgz %g1, b16
    nop
    dec %g7
b16: brgez %i0, b17
    nop
    dec %g7
b17: 
    nop
    nop
    nop
    nop
    nop
    nop
    brz %g7, back_br
    set 0x2,     %g7
    nop
    nop

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

    setx 0x524e4f2c0e9a829e, %g1, %g2
    setx 0x0000000080000000, %g1, %g3
    setx 0x7fffffff7fffffff, %g1, %g4
    setx 0x0000000080000000, %g1, %g5
    setx 0x0000000000000000, %g1, %g6
    setx 0x5d7085ae11898343, %g1, %g7

    ! Now do some useful stuff ..
! unconditional Branches (BA, BN)
! Icc-Conditional Branches (if taken, no annul)

!ISA1
!BPr1 =          00.0..1011......................
!BPr2 =          00.0.1.011......................
!BiccA =         00..000010......................
!Bicc1 =         00..1..010......................
!Bicc2 =         00...1.010......................
!Bicc3 =         00....1010......................
!BPccA =         00..000001......................
!BPcc1 =         00..1..001......................
!BPcc2 =         00...1.001......................
!BPcc3 =         00....1001......................
    
       
	add  %g1, %g2, %g2
	!add  %g2, %g3, %g3
	!add  %g3, %g4, %g4
	add  %g4, %g5, %g6
	add  %g5, %g6, %g7
	add  %g6, %g7, %g1
	bn,a C0a
        addcc %g0, 0x0000, %g7
C0a:    addcc %g0, 0x0001, %g2
        ba,a  C0
        addcc %g0, 0x0001, %g2
        inc   %g7
C0:     addcc %g0, 0x0001, %g2
        ba  C1a
        addcc %g0, 0x0001, %g2
        inc   %g7
C1a:    addcc %g0, 0x0001, %g2
        bn,a  C1
        addcc %g0, 0x0001, %g2
        inc   %g7
C1:     addcc %g0, 0x0001, %g2
        bn  C2a
        addcc %g0, 0x0001, %g2
        inc   %g7
C2a:    addcc %g0, 0x0001, %g2
        bne,a C2b		! taken & a
        addcc %g0, 0x1fff, %g1	
        inc   %g7
C2b:    addcc %g0, 0x0001, %g2
        bne C2c			! taken & ~a
        addcc %g0, 0x1fff, %g1	
        inc   %g7
C2c:    addcc %g0, 0x0000, %g2
        bne,a C2d		! ~taken & a
        addcc %g0, 0x1fff, %g1	
        inc   %g7
C2d:    addcc %g0, 0x0000, %g2
        bne C3a			! ~taken & ~a
        addcc %g0, 0x1fff, %g1	
        inc   %g7
C3a:    addcc %g0, 0x0000, %g1
        be,a  C3b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C3b:    addcc %g0, 0x0000, %g1
        be  C3c			! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C3c:    addcc %g0, 0x0001, %g2
        be,a  C3d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C3d:    addcc %g0, 0x0001, %g2
        be  C4a			! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7	
C4a:    addcc %g0, 0x0001, %g1
        bg,a  C4b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C4b:    addcc %g0, 0x0001, %g1
        bg  C4c			! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C4c:    addcc %g0, 0x0000, %g1
        bg,a  C4d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C4d:    addcc %g0, 0x0000, %g1
        bg  C5a			! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C5a:    addcc %g0, 0x0000, %g1
        dec %g1
        ble,a  C5b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C5b:    addcc %g0, 0x0000, %g2
        ble  C5c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C5c:    addcc %g0, 0x0001, %g2
        ble,a  C5d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C5d:    addcc %g0, 0x0001, %g2
        ble  C6a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7	
C6a:    addcc %g0, 0x0000, %g1
        inc %g1
        bge,a  C6b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C6b:    addcc %g0, 0x0000, %g1
        bge  C6c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C6c:    subcc %g0, 0x0001, %g1
        dec %g1
        bge,a  C6d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C6d:    subcc %g0, 0x0001, %g1
        bge  C7a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C7a:    addcc %g0, 0x1fff, %g2
        inc %g2
        bl,a  C7b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C7b:    addcc %g0, 0x1fff, %g2
        inc %g2
        bl  C7c			! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C7c:    addcc %g0, 0x0000, %g1
        bl,a  C7d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C7d:    addcc %g0, 0x0000, %g1
        bl  C8a			! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C8a:    addcc %g0, 0x0001, %g1
        bgu,a  C8b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C8b:    addcc %g0, 0x0001, %g1
        bgu  C8c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C8c:    addcc %g0, 0x0000, %g2
        bgu,a  C8d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C8d:    addcc %g0, 0x0000, %g2
        bgu  C9a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C9a:    addcc %g0, 0x0000, %g2
        bleu,a  C9b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C9b:    addcc %g0, 0x0000, %g2
        bleu  C9c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C9c:    addcc %g0, 0x0001, %g2
        bleu,a  C9d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C9d:    addcc %g0, 0x1fff, %g2
        bleu  C10a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7	
C10a:   addcc %g0, 0x0001, %g6
        bcc,a  C10b		! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C10b:   addcc %g0, 0x0001, %g6
        bcc  C10c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C10c:   addcc %g1, 0x0001, %g5
        bcc,a  C10d             ! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C10d:   addcc %g1, 0x0001, %g5
        bcc  C11a               ! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C11a:   addcc %g1, 0x0001, %g5
        bcs,a  C11b             ! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C11b:   addcc %g1, 0x0001, %g5
        bcs  C11c               ! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C11c:   addcc %g0, 0x0001, %g6
        bcs,a  C11d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C11d:   addcc %g0, 0x0001, %g6
        inc   %g1
        bcs  C12a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C12a:   addcc %g0, 0x0000, %g2
        inc   %g2
        bpos,a  C12b		! taken & a
	addcc %g0, 0x1fff, %g1
        inc   %g7
C12b:   addcc %g0, 0x0002, %g2
        dec   %g2
        bpos  C12c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C12c:   subcc %g0, 0x0001, %g5
        bpos,a  C12d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C12d:   subcc %g0, 0x0001, %g5
        bpos  C13a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C13a:   subcc %g0, 0x0001, %g5        
        bneg,a  C13b		! taken & a
	addcc %g0, 0x1fff, %g1
        inc   %g7
C13b:   subcc %g0, 0x0001, %g5 
        bneg  C13c		! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C13c:   addcc %g0, 0x0000, %g2
        inc   %g2
        bneg,a  C13d		! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C13d:   addcc %g0, 0x0000, %g1
        bneg  C14a		! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C14a:   addcc %g0, 0x0001, %g2
        dec   %g2
        bvc,a   C14b		! taken & a
	addcc %g0, 0x1fff, %g1
        inc   %g7
C14b:   addcc %g0, 0x0001, %g2
        dec   %g2
        bvc   C14c		! taken & ~a
	addcc %g0, 0x1fff, %g1
        inc   %g7
C14c:   addcc %g4, 0x0002, %g5
        bvc,a   C14d            ! ~taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C14d:   addcc %g4, 0x0001, %g5
        bvc   C15a              ! ~taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C15a:   addcc %g4, 0x0001, %g5
        dec   %g2
        bvs,a   C15b            ! taken & a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C15b:   addcc %g4, 0x0001, %g5
        dec   %g2
        bvs   C15c              ! taken & ~a
        addcc %g0, 0x1fff, %g1
        inc   %g7
C15c:   addcc %g0, 0x0001, %g2
        inc   %g2
        bvs,a   C15d		! ~taken & a
	addcc %g0, 0x1fff, %g1
        inc   %g7
C15d:   addcc %g0, 0x0001, %g2
        inc   %g2
        bvs   Cz		! ~taken & ~a
	addcc %g0, 0x1fff, %g1
        inc   %g7	
Cz:     cmp   %g7, 0x0
	nop
	nop
	nop
	
goodbye:	    
	nop
	nop
!bad_trap: 
!    b bad_trap
    EXIT_BAD
    nop
    nop
	
my_pass:
    nop
    nop
    EXIT_GOOD
!good_trap:
!    b good_trap
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


