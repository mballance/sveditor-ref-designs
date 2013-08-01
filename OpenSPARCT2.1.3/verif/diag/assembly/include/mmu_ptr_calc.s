/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_ptr_calc.s
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
    sllx %g6, 51, %g5
    brnz,a %g5, 1f
    add %g7, 0x20, %g7     ! this executes only if branch taken

1:
!%g1 = ldxa tsb_config
    ldxa [%g7] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1

!%g2 = tsbsz = %g1 & 0xf
    and %g1, 0xf, %g2

!%g3 = pgsz = %g1 & 0x70 >> 4
    and %g1, 0x70, %g3
    srlx %g3, 4, %g3

!tsb64[63:40] = 0
!tsb64[39:13+tsbsz] = tsb_base[39:13+tsbsz]
!tsb64[12+tsbsz:0] = 0
!
!tsb64 = ({24'b0,27'b1,13'b0} << (tsbsz)) & tsb_base
!      = (0xffffffff000 << (tsbsz)) & tsb_base
!        ((~0xfff) << (tsbsz)) & tsb_base

!%g4 = 0x000000ffffffe000
    not %g0, %g4
    srlx %g4, 36, %g4
    sllx %g4, 13, %g4

!%g4  = sllx %g2
    sllx %g4, %g2, %g4

!%g4 = and %g1 %g4
    and %g1, %g4, %g4

!va_mask = {(8+tsbsz)'b1,4'b0}
!        = (0xffffff >> (15-tsbsz)

!%g5 = 0xffffff
    set  0xffffff, %g5

!%g1 = 15
    mov 15, %g1

!%g1 = sub %g1 %g2
    sub %g1, %g2, %g1

!%g5 = srax %g5 %g1
    srax %g5, %g1, %g1

!va_1 = va >> (13+3*pgsz)
        
!%g5 = mulx %g3
    mulx %g3, 3, %g5

!%g5 = add %g5 13
    add %g5, 13, %g5

!%g1 = srax %g6 %g5
    srax %g6, %g5, %g5

!va64 = va_1 & va_mask

!%g1 = and %g1 %g5
    and %g1, %g5, %g1

! va64 << 4 
!%g1 = sllx 4, %g1
    sllx %g1, 4, %g1

!tsb_pointer = (tsb64 | VA64) 

!%g1 = or %g1 %g4 
    or %g1, %g4, %g1
