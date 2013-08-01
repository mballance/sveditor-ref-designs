/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dcacheMissSl3.s
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
#define STORE_VA 0xfffffffff0010000


SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000, DATA_VA = STORE_VA

attr_text {
        Name=.RED_SEC,
        hypervisor
}

attr_data {
        Name=.RED_SEC,
        hypervisor
}

.text

    nop;nop;nop;nop;nop;nop;nop;nop

Power_On_Reset:
    setx data_area, %g2, %g1
    wrpr    %g0, %g0, %tl

    
    ! Setup a context
    add  0xF, %g0, %g5
    add  0x8, %g0, %g6
    stxa %g5, [%g6] 0x21


    !turn on ITLB
    ldxa [%g0] 0x45, %l5
    or   0xE, %l5, %l5
    stxa %l5, [%g0] 0x45


    ! Setup counter
    set 0x1810c082,	%l0 ! count D-Cache Misses

   	wr	%l0, %g0, %pcr 	! count D-Cache Misses
   	wr 	%g0, %g0, %pic 	! zero out the counter

    
    !Create the address
    setx 0xfffffffff1004000, %o1, %o2
    
    ! Setup a TLB Entry
    setx 0xfffffffff100400F, %g5, %g6  ! Data for Tag Access
    setx 0x800000FFF0100000, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    stxa %g6, [%o0] 0x50               ! Write tag access
    stxa %g7, [%g0] 0x55

    ! Setup a TLB Entry
    setx 0xfffffffff010600F, %g5, %g6  ! Data for Tag Access
    setx 0x800000FFF0106000, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x10,  %g0, %o1
    
    stxa %g6, [%o0] 0x50               ! Write tag access
    stxa %g7, [%o1] 0x55    


    ! Setup a DTLB Entry
    setx 0x1000F, %g5, %g6             ! Data for Tag Access
    setx 0x8000003FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x10, %g0, %i0
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D

    ! Setup a DTLB Entry
    setx 0x2000F, %g5, %g6             ! Data for Tag Access
    setx 0x8000004FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
     add  0x20, %g0, %i0   
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x3000F, %g5, %g6             ! Data for Tag Access
    setx 0x8000005FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x30, %g0, %i0
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x4000F, %g5, %g6             ! Data for Tag Access
    setx 0x8000006FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x40, %g0, %i0     
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x5000F, %g5, %g6             ! Data for Tag Access
    setx 0x8000007FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x50, %g0, %i0    
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
                    
    
! 	rdhpr	%hpstate, %g1
!	andn    %g1, 0x4, %g2

    jmp     %o2
	wrhpr	%g0, %g0, %hpstate

bad_trap:
    ba bad_trap
    nop
    nop
    



.data
data_area:
.xword 0x0
.xword 0x0

    
SECTION .NEWSECTION TEXT_VA = 0xfffffffff0104000
attr_text {
        RA =  0xfff0100000,
        PA =  0xfff0100000,
        Name=.NEWSECTION,
        notsb
}
.text
  setx 0xfffffffff0106000, %l0, %l1

  setx 0x10000, %g4, %g3
  ldx  [%g3], %g2
  setx 0x20000, %g4, %g3
  ldx  [%g3], %g2
  setx 0x30000, %g4, %g3
  ldx  [%g3], %g2
  setx 0x40000, %g4, %g3
  ldx  [%g3], %g2
  setx 0x50000, %g4, %g3
  ldx  [%g3], %g2

        
  jmp %l1
  nop

    
SECTION .NEWSECTION1 TEXT_VA = 0xfffffffff0106000
attr_text {
        RA =  0xfff0106000,
        PA =  0xfff0106000,
        Name=.NEWSECTION1,
        notsb
}
.text
  setx 0x123456789ABCDEF, %l2, %l3
    setx 0x500000005, %g4, %g5
   	rd 	%pic, %g2        ! load the current pic value into %g2
    xor %g2, %g5, %g6
   	brnz %g6, bad_trap   
    nop
    
good_trap:
    ba good_trap
    nop
    nop    
   
bad_trap:
    ba bad_trap
    nop
    nop
    

    
