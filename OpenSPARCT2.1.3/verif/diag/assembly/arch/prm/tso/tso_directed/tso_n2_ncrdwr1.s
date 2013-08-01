/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_ncrdwr1.s
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
#define MAIN_PAGE_HV_ALSO
#define ASI_NUCLEUS        0x40
#define ASI_NUCLEUS_LITTLE 0xc0
#define ASI_BLK_P          0xf0
#define ASI_BLK_S          0xf1
#define ASI_BLK_PL         0xf8
#define ASI_BLK_SL         0xf9
#define ASI_BLK_INIT_ST_QUAD_LDD_P 0xe2
#define ASI_BLK_INIT_ST_QUAD_LDD_P 0xe3
#define ASI_NUCLEUS_QUAD_LDD 0x24
#define ENABLE_PCIE_LINK_TRAINING    
#include "hboot.s"

.text
.global main
main:
  ta T_CHANGE_HPRIV
  nop
	
/************************************
  set up pointers
*************************************/
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xc100beef00, %g1, %g3          ! MEM32 address space
/************************************ 
   Start doing non cacheable access 
   RW's are done to the DMUPIO space 
   starting from 0xC1
*************************************/
!=====================
! Now some NC writes and reads
!=====================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

mov 0x78, %g4
set 0x10, %g2
set 0x10, %g5

ldloop1:
ldx [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	h_bad_end
nop
dec %g2
sub %g4, 0x8, %g4
deccc %g5
bne ldloop1
nop

!========================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop2:
st %g2, [%g3 + %g4]
inc %g2
add 0x4, %g4, %g4
deccc %g5
bne stloop2
nop

mov 0x3c, %g4
set 0x10, %g2
set 0x10, %g5

ldloop2:
ld [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	h_bad_end
nop
dec %g2
sub %g4, 0x4, %g4
deccc %g5
bne ldloop2
nop

!=============================

mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop3:
sth %g2, [%g3 + %g4]
inc %g2
add 0x2, %g4, %g4
deccc %g5
bne stloop3
nop

mov 0x1e, %g4
set 0x10, %g2
set 0x10, %g5

ldloop3:
lduh [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	h_bad_end
nop
dec %g2
sub %g4, 0x2, %g4
deccc %g5
bne ldloop3
nop

!=============================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop4:
stb %g2, [%g3 + %g4]
inc %g2
add 0x1, %g4, %g4
deccc %g5
bne stloop4
nop

mov 0xf, %g4
set 0x10, %g2
set 0x10, %g5

ldloop4:
ldub [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	h_bad_end
nop
dec %g2
sub %g4, 0x1, %g4
deccc %g5
bne ldloop4
nop

normal_end:
ta T_GOOD_TRAP
nop

h_bad_end:
ta T_BAD_TRAP
nop
   
/*
* Data section
*/

 .data
    user_data_start:
    .word 0xD6B3479D
    .word 0xDB28926C
    .end
