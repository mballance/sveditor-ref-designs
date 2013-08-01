/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_ncrdwr3.s
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
#define ENABLE_PCIE_LINK_TRAINING    
#include "hboot.s"

.text
.global main
main:
  ta T_CHANGE_HPRIV
  nop
	
  wr      %g0, 0x4, %fprs		/* make sure fef is 1 */

  setx 0xc100beef00, %g1, %g3		! MEM32 address space

  setx	user_data_start, %l0, %o0	! user_data_start

!=====================
! Now some NC writes and reads mixed with cacheable writes and reads
!=====================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop0:
 stx %g2, [%g3 + %g4]		! NonCacheable
 stx %g2, [%o0 + %g4]		! Cacheable
 inc %g2
 add 0x8, %g4, %g4
 deccc %g5
bne stloop0
nop

mov 0x78, %g4
set 0x10, %g2
set 0x10, %g5

ldloop0:
 ldx [%o0 + %g4], %g1		! Cacheable
 ldx [%g3 + %g4], %g1		! NonCacheable
 subcc	%g2, %g1, %g0
 bne	h_bad_end
 nop
 dec %g2
 sub %g4, 0x8, %g4
 deccc %g5
bne ldloop0
nop

!================================
ldda [%o0]ASI_BLK_P, %f0
add  %g3, 0x40, %g3
ldd  [%g3], %f16
	
std  %f0, [%g3]
sub  %g3, 0x40, %g3
stda %f16, [%o0]ASI_BLK_P
membar 0x40
!================================

!================================
add  %g3, 0x40, %g3
ldd [%g3], %f0
add %g3, 0x40, %g3
ldd [%g3], %f16
std %f0, [%g3]
stda %f0, [%o0]ASI_BLK_PL
add %g3, 8, %g3
std %f0, [%g3]
stda %f0, [%o0]ASI_BLK_PL
add %g3, 8, %g3
std %f0, [%g3]
stda %f0, [%o0]ASI_BLK_P
add %g3, 8, %g3
std %f0, [%g3]
stda %f0, [%o0]ASI_BLK_P
stda %f0, [%o0]ASI_BLK_P
stda %f0, [%o0]ASI_BLK_PL
add %g3, 8, %g3
std %f0, [%g3]
add %g3, 8, %g3
std %f0, [%g3]
sub %g3, 0x40, %g3
std %f16, [%g3]
!================================

set 0x10, %g5
mov %g3, %g4
mov %o0, %o1

loop6:
 ldx [%g4], %l0
 inc %l0
 inc %l1
 add %g4, 0x8, %g4
 add %o1, 0x8, %o1
 stx %l0, [%g4]
 add %g4, 0x8, %g4
 stx %l1, [%g4]
 stxa %l0, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P
 add %o1, 0x8, %o1
 stxa %l1, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P

 deccc %g5
bne loop6
nop

!================================
set 0x10, %g5
mov %g3, %g4
mov %o0, %o1

loop8:
 ldx [%g4], %l0
 inc %l0
 inc %l1
 add %g4, 0x8, %g4
 add %o1, 0x8, %o1
 stx %l0, [%g4]
 add %g4, 0x8, %g4
 stx %l1, [%g4]
 stxa %l0, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE
 add %o1, 0x8, %o1
 stxa %l1, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE

 deccc %g5
bne loop8
nop

!================================
set 0x10, %g5
mov %g3, %g4
mov %o0, %o1

loop11:
 ldx [%g4], %l0
 inc  %l0 
 inc  %l1 
 add  %g4, 0x8, %g4
 add  %o1, 0x8, %o1
 stx %l0, [%g4]
 add  %g4, 0x8, %g4
 stx %l1, [%g4]
 stxa %l0, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P
 add  %o1, 0x8, %o1
 stxa %l1, [%o1]ASI_BLK_INIT_ST_QUAD_LDD_P

 deccc %g5
bne loop11
nop

normal_end:
        ta T_GOOD_TRAP
h_bad_end:
	ta T_BAD_TRAP


/******************************************************************/
/*
* Data section
*/

 .data
    user_data_start:
    .word 0xD6B3479D
    .word 0xDB28926C
    .end

