/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: loadngo_l2_init.s
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
#ifdef DTM_ENABLED
        setx 0x8900000810, %g3, %g2 !! RESET STATUS reg
        ldx [%g2], %g3          !! read reset source
        and %g3, 2, %g3         !! nonzero if WMR
        brz %g3, loadngo_done  
        nop
#endif
        ldxa    [%g0] ASI_INTR_ID, %g1
#ifndef SIXGUNS
#ifndef PORTABLE_CORE
changequote([, ])dnl ! The M4_* variables need this
        cmp %g1, M4_master_tid
changequote(`,')dnl ! [] are not quotes anymore
#else
        andcc %g1, 0x7, %g2
#endif
#else
    ! Determine master thread by querying CORE_RUNNING
    mov 0x50, %g3
    ldxa [%g3]ASI_CMP_CORE, %g2         ! Who is running ?
    neg %g2, %l1
    xnor %g2, %l1, %l1
    popc %l1, %l1                       ! Get lowest bit set ..
    dec %l1
    cmp %l1, %g1
#endif
        bne %xcc, loadngo_done
        nop
loadngo_turnonL2:
	! enable L2-cache
	mov     0xa9, %l2
	sllx    %l2, 32, %l2
	stx     %g0, [%l2 + 0x000]
	stx     %g0, [%l2 + 0x040]
	stx     %g0, [%l2 + 0x080]
	stx     %g0, [%l2 + 0x0c0]
	stx     %g0, [%l2 + 0x100]
	stx     %g0, [%l2 + 0x140]
	stx     %g0, [%l2 + 0x180]
	stx     %g0, [%l2 + 0x1c0]
loadngo_turnonL1:
	 ! gee I sure do hope that these magic tricks work here!!
	mov (CREGS_LSU_CTL_REG_DC << 1 | CREGS_LSU_CTL_REG_IC), %g2
	stxa %g2, [%g0] 0x45

 ! Up to here, all forms of loadngo are the same, but from here down,
 ! only pass2_preamble needs the fancy loaderloader and the diag data.

 ! In pass1 we don't care WHAT SSI instructions execute, all we want
 ! is the cache dump at the end, and the SSI at the front don't matter.

 ! In pass2slam, we will use the vectors from the end on, but not those
 ! before here, so we need to branch directly to loadngo_done label.

#ifdef LOADNGO_PREAMBLE
	ba,a loadngo_shovecodein
!	nop	 delay slot for both paths
#else
! ASI_RST_VEC_MASK to 1
#ifndef DTM_ENABLED
        set 0x1, %i3
        wr %g0, 0x45, %asi
        stxa %i3, [%g0 + 0x18] %asi
#endif
	ba,a loadngo_done
!	nop	! delay slot for both paths
#endif

 ! Here is the code for PASS2 only.

loadngo_shovecodein:
 ! In an amusing example of recursive development, the loader code
 ! that will be loaded is used to load the loader.  In addition to
 ! providing self documentation, this is still somewhat efficient
 ! code and using it here puts a copy of it in mem.image.

 ! this loader requires several registers to be setup

loadngo_setupLoader:
	setx	LoaderData, %l1, %l7	! setx is a macro
	ba loadngo_gettagaddr			! NOT FIRST CACHE LINE, 0x3c in
	sethi %hi(0x400000), %l4	! one instruction in delay slot
 
! NOTE loop does not start here, entry is gettagADDR, NO FALLTHROUGH
.align 32	! MUST align cacheable version, SSI doesn't really care
loadngo_gettagdata:
	ldx [%l7], %l1		! get tag data
	inc 8, %l7		! advance data pointer
	stx %l1, [%l2]		! store tag into tag array
	ldx [%l7], %l2		! get diagnostic address for data word 0
	inc 8, %l7		! advance data pointer
	add %l2, 0x38, %l2	! add 0x38 to even address base in l2
	add %l2, %l4, %l3	! odd word address (+0x400000) in l3

loadngo_dwordloop:
	ldx [%l7], %l1		! get even data word (0,0x10,0x20...)
	inc 8, %l7		! advance data pointer
	stx %l1, [%l2+%l0]	! store even instruction into data array
	ldx [%l7], %l1		! get odd data word (8,0x18,0x28...)
	inc 8, %l7		! advance data pointer
	stx %l1, [%l3+%l0]	! store odd instruction into data array
	brlz %l0, loadngo_dwordloop	! repeat loop while negative, eight times
	inc 8, %l0		! step loop in delay slot, last loop is 0
!  fallthrough means we are done with 16 data words, get next tag addr

loadngo_gettagaddr:
	sub %g0, 0x38, %l0	! put -0x38 into %l0 for loop control
	ldx [%l7], %l2		! get tag diagnostic address
	brnz %l2, loadngo_gettagdata	! branch on register, no need to test first
	inc 8, %l7		! advance data pointer in delay slot

!  fallthrough means got a tag addr of 0, go to vuad loop

loadngo_vuadloop:
	ldx [%l7], %l2		! get vuad diagnostic address
	brz %l2, loadngo_done4now	! branch on register, no need to test first
	inc 8, %l7		! advance data pointer
	ldx [%l7], %l1		! get vuad data
	inc 8, %l7		! advance data pointer
	ba loadngo_vuadloop		! repeat until a 0 address
	stx %l1, [%l2]		! store vuad into vuad array
! The cache versions has a few more instructions 
! done4now:
!	call %l6
!	nop	(actually 6 nops to finish the line)

 ! I think I could tighten that up a bit, especially vuadloop, but once
 ! we have two cache lines, there is no advantage, I can't do it in one.

loadngo_done4now: ! no need to do the call %l6, running from SSI space

 ! Now use that loader we just loaded to load the rest of cache.

 ! Need to do the same setup operations.
	setx	loadngo_SSIdata, %l1, %l7
	! because of the way data is layed out, that setx isn't needed.
	! sethi %hi(0x400000), %l4	! %l4 still has 0x400000
	setx	loadngo_done, %l1, %l6	! where to go when finished

loadngo_gocacheable:	! don't forget, entry point is not at first cacheline,
!ASI_RST_VEC_MASK to 1
#ifndef DTM_ENABLED
        set 0x1, %i3
        wr %g0, 0x45, %asi
        stxa %i3, [%g0 + 0x18] %asi
#endif
	setx 0x1234567bc, %l1, %l2	! must offset 0x3c onto 123456780
	call %l2
	nop

loadngo_done:
! we now return you to hboot.s, or BOOTPROM_INIT, or wherever else you may have
! stuck this #include call.  L2 is enabled, loaded, VUAD set, and ready to go.
       nop


! here is the data for the 2 cache lines of the loader, 23 xwords.
.data

LoaderData:

     !** Writing cache line at address 0x123456780 to bank: 2,  set: 179, way: 0

     ! Write the cache Tag for 0xa400016780 = 0x123451
.xword 0xa400016780 ! TagAddr
.xword 0x123451 ! TagData

     ! Write the diagnostic address for B=2, S=179, W=0
.xword 0xa000016780 ! Data Address

     ! Write the cache data for word 0
.xword 0x712ee00068 ! Data for addr 0xa000016780

     ! Write the cache data for word 1
.xword 0x5702f00445 ! Data for addr 0xa000416780

     ! Write the cache data for word 2
.xword 0x713a400068 ! Data for addr 0xa000016788

     ! Write the cache data for word 3
.xword 0x722ee00016 ! Data for addr 0xa000416788

     ! Write the cache data for word 4
.xword 0x5702f00445 ! Data for addr 0xa000016790

     ! Write the cache data for word 5
.xword 0x5202501c79 ! Data for addr 0xa000416790

     ! Write the cache data for word 6
.xword 0x5302400a7e ! Data for addr 0xa000016798

     ! Write the cache data for word 7
.xword 0x712ee00068 ! Data for addr 0xa000416798

     ! Write the cache data for word 8
.xword 0x5702f00445 ! Data for addr 0xa0000167a0

     ! Write the cache data for word 9
.xword 0x713a400821 ! Data for addr 0xa0004167a0

     ! Write the cache data for word 10
.xword 0x712ee00068 ! Data for addr 0xa0000167a8

     ! Write the cache data for word 11
.xword 0x5702f00445 ! Data for addr 0xa0004167a8

     ! Write the cache data for word 12
.xword 0x713a600875 ! Data for addr 0xa0000167b0

     ! Write the cache data for word 13
.xword 0x37e1ffd65 ! Data for addr 0xa0004167b0

     ! Write the cache data for word 14
.xword 0x500210040e ! Data for addr 0xa0000167b8

     ! Write the cache data for word 15
.xword 0x5010101c0e ! Data for addr 0xa0004167b8



     !** Writing cache line at address 0x1234567C0 to bank: 3,  set: 179, way: 0

     ! Write the cache Tag for 0xa4000167c0 = 0x123451
.xword 0xa4000167c0 ! TagAddr
.xword 0x123451 ! TagData

     ! Write the diagnostic address for B=3, S=179, W=0
.xword 0xa0000167c0 ! Data Address

     ! Write the cache data for word 0
.xword 0x722ee00016 ! Data for addr 0xa0000167c0

     ! Write the cache data for word 1
.xword 0x57e5ff7bf ! Data for addr 0xa0004167c0

     ! Write the cache data for word 2
.xword 0x5702f00445 ! Data for addr 0xa0000167c8

     ! Write the cache data for word 3
.xword 0x722ee00016 ! Data for addr 0xa0004167c8

     ! Write the cache data for word 4
.xword 0x166400309 ! Data for addr 0xa0000167d0

     ! Write the cache data for word 5
.xword 0x5702f00445 ! Data for addr 0xa0004167d0

     ! Write the cache data for word 6
.xword 0x712ee00068 ! Data for addr 0xa0000167d8

     ! Write the cache data for word 7
.xword 0x5702f00445 ! Data for addr 0xa0004167d8

     ! Write the cache data for word 8
.xword 0x85ffffde7 ! Data for addr 0xa0000167e0

     ! Write the cache data for word 9
.xword 0x713a400068 ! Data for addr 0xa0004167e0

     ! Write the cache data for word 10
.xword 0x4fe2c0005d ! Data for addr 0xa0000167e8

     ! Write the cache data for word 11
.xword 0x8000005e ! Data for addr 0xa0004167e8

     ! Write the cache data for word 12
.xword 0x8000005e ! Data for addr 0xa0000167f0

     ! Write the cache data for word 13
.xword 0x8000005e ! Data for addr 0xa0004167f0

     ! Write the cache data for word 14
.xword 0x8000005e ! Data for addr 0xa0000167f8

     ! Write the cache data for word 15
.xword 0x8000005e ! Data for addr 0xa0004167f8

.xword 0 !** stop tag/data loop, begin vuad loop.

     !** Writing valid/dirty vectors.

     ! Write the cache VUAD for bank:2, set:0x0b3
.xword 0xa600416780 ! VUAD Address
.xword 0x1600010000 ! VUAD Data

     ! Write the cache VUAD for bank:3, set:0x0b3
.xword 0xa6004167c0 ! VUAD Address
.xword 0x1600010000 ! VUAD Data

.xword 0 !** stop vuad loop, all done now, jump to it!


 ! and here is diag cache load data from teh pass1 L2 dump...

loadngo_SSIdata:
#ifdef LOADNGO_PREAMBLE
#include <diag.lng>
#endif

loadngo_endofdata:	 ! use this label to see how BIG the data is
.text
