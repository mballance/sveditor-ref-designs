/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dcacheOvL.s
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
#define DMMU_SKIP_IF_NO_TTE
#define CREGS_PIL 0x0
#define PCONTEXT0 0xF     

#include "mmu_custom_intr_handlers.s"
#include "hboot.s"
    
.text
.global main

main:   
    nop;nop;nop;nop;nop;nop;nop;nop
    
    ta T_CHANGE_HPRIV

    ! Setup counter
    set 0x1810C0BE,	%l0 ! count D-Cache Misses

    ! Set a high pic value
    setx 0xFFFFFF00FFFFFFEC, %i4, %i5
    !mov %g0, %i5
    
   	wr	%l0, %g0, %pcr 	! count D-Cache Misses
   	wr 	%i5, %g0, %pic 	! zero out the counter

    
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
    setx 0x10044, %g5, %g6             ! Data for Tag Access
    setx 0x8000003FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x10, %g0, %i0
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D

    ! Setup a DTLB Entry
    setx 0x20044, %g5, %g6             ! Data for Tag Access
    setx 0x8000004FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
     add  0x20, %g0, %i0   
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x30044, %g5, %g6             ! Data for Tag Access
    setx 0x8000005FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x30, %g0, %i0
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x40044, %g5, %g6             ! Data for Tag Access
    setx 0x8000006FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x40, %g0, %i0     
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    ! Setup a DTLB Entry
    setx 0x50044, %g5, %g6             ! Data for Tag Access
    setx 0x8000007FF0010440, %g5, %g7  ! Data for Data-Access

    add  0x30, %g0, %o0
    add  0x50, %g0, %i0    
    stxa %g6, [%o0] 0x58               ! Write tag access
    stxa %g7, [%i0] 0x5D
    
    
    ta T_CHANGE_NONHPRIV           
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


    ta T_CHANGE_PRIV
! 	rdhpr	%hpstate, %g1
!	andn    %g1, 0x4, %g2
    setx 0x500000005, %g4, %g5
   	rd 	%pic, %g2        ! load the current pic value into %g2
    xor %g2, %g5, %g6
   	brnz %g6, bad_trap
    nop


!good_trap:
!    ba good_trap

bad_trap:
    ba bad_trap
    nop
    nop
    
.data
user_data_start:
.word 0xFFFF2e2d   

