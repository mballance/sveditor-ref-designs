/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_trans_test0.s
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
#include "nmacros.h"
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO
#define ENABLE_T0_Data_Access_Exception_0x30
#define ENABLE_HT0_DAE_so_page_0x30
#define ENABLE_T0_Tag_Overflow_0x23
#define ENABLE_HT0_Tag_Overflow_0x23
#define ENABLE_T0_Privileged_Action_0x37
#define ENABLE_HT0_Privileged_Action_0x37
#define ENABLE_HT0_DAE_Invalid_Asi_0x14
#define ENABLE_HT0_DAE_Privilege_Violation_0x15
#define ENABLE_HT0_DAE_Nfo_Page_0x17
#define DMMU_SKIP_IF_NO_TTE
#define ENABLE_HT0_data_access_protection_0x6c
#include "hboot.s"

/************************************************************************
  This test uses directed and random methods to check all ASI's that
  affect translation.
 ************************************************************************/

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta T_TRAP_EN

	/* Switch to hpriv mode */
	ta T_CHANGE_HPRIV

	/* Set HPSTATE.ENB */
	rdhpr %hpstate, %i7
	or %i7, 0x0800, %i7
	wrhpr %i7, %hpstate

	/* initialize TLB mappings */
	setx	page_0, %i0, %g1
	set	0, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and writable bit
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_0, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	setx	page_0, %i0, %g1
	set	1, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and writable bit
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_1, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	setx	page_0, %i0, %g1
	set	2, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and writable bit
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_2, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	setx	page_0, %i0, %g1
	set	3, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and writable bit
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_3, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	/* initialize a real TLB mapping */
	setx	page_0, %i0, %g1
	set	0, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and writable bit
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_4, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
	! Make this one an RA->PA translation
        mov  0xc00, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
        
	wr	%g0, 0x21, %asi

	ta T_CHANGE_NONHPRIV
	ta T_CHANGE_PRIV

	/* Load from the same VA, different contexts */
	setx	page_0, %i0, %l7
	ldx	[%l7 + 0x00], %l0
	nop
	nop
	/* P0=P1=0, set S0=S1=2 */
	set	2, %l2
	stxa	%l2, [0x10] %asi	
	ldxa	[%l7 + %g0] 0x81, %l0	/* F7E83D131531F50C */
	nop
	nop
	/* P0=P1=0, set S0=S1=3 */
	set	3, %l2
	stxa	%l2, [0x10] %asi	
	ldxa	[%l7 + %g0] 0x81, %l0	/* F7E83D131531F50C */

	/* Load from nucleus should give result from page_0 */
	ldxa	[%l7 + %g0] 0x04, %l0

	/* Make scontext0 a non-match, scontext1 a match. */
	/* P0=P1=0, S0=F, S1=3 */
	set	0xF, %l2
	stxa	%l2, [0x10] %asi	
	set	3, %l2
	stxa	%l2, [0x110] %asi	
	ldxa	[%l7 + %g0] 0x81, %l0	/* DCA9B47105DDA017 */
	
	/* Try a real access */
	ldxa	[%l7 + %g0] 0x14, %l0	/* 5C55F98827B11F1E */

	/* Now, set context0=context1 for both prim & sec.  Keep them
	   the same so that we can randomly test. */
	/* P0=P1=0, set S0=S1=2 */
	set	2, %l2
	stxa	%l2, [0x10] %asi	

	/* Random code in PRIV mode */
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%i1
	nop
	setx	0xB04B8000,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x81,	%g4
	st	%f2,	[%l7 + 0x3C]
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%l2
	stw	%o0,	[%l7 + 0x78]
	nop
	setx	0x56E1C73CE0477800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	setx	0x207D4400,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l0
	ldsh	[%l7 + 0x44],	%g5
	wr	%g0,	0x23,	%asi
	stda	%g2,	[%l7 + 0x18] %asi
	membar	#Sync
	set	0x38, %l3
	stwa	%o7,	[%l7 + %l3] 0x80
	stbar
	stx	%g6,	[%l7 + 0x58]
	std	%i2,	[%l7 + 0x78]
	andn	%i2,	0x0803,	%o2
	ldsw	[%l7 + 0x4C],	%i5
	stx	%i4,	[%l7 + 0x78]
	ldd	[%l7 + 0x28],	%f30
	add	%o4,	%l5,	%g7
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x80,	 2
	nop
	wr	%g0,	0x22,	%asi
	stba	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l1
	st	%f29,	[%l7 + 0x68]
	nop
        wr      %g0,    0x14,   %asi
        lduha   [%l7 + 0x60] %asi,      %i7
	set	0x7A, %g6
	lduh	[%l7 + %g6],	%o5
	ldsw	[%l7 + 0x34],	%l4
	set	0x10, %i1
	ldsha	[%l7 + %i1] 0x8a,	%o1
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%l3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x83,	%f0
	ldd	[%l7 + 0x08],	%g2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x8b,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%i7
	ld	[%l7 + 0x18],	%f19
	movu	%fcc0,	0x089,	%l6
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%i0
	lduh	[%l7 + 0x2C],	%o3
	nop
	set	0x28, %g5
	lduh	[%l7 + %g5],	%i1
	stbar
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x82,	%g4
	ldsh	[%l7 + 0x28],	%l2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	nop
	set	0x48, %l4
	std	%f24,	[%l7 + %l4]
	set	0x48, %i3
	ldswa	[%l7 + %i3] 0x80,	%l0
	prefetch	[%l7 + 0x78],	 1
	ldsh	[%l7 + 0x20],	%g2
	stx	%o7,	[%l7 + 0x40]
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g4
	nop
	set	0x10, %o2
	lduh	[%l7 + %o2],	%g6
	std	%f22,	[%l7 + 0x68]
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i2
	popc	0x072E,	%i3
	nop
	set	0x38, %o7
	swap	[%l7 + %o7],	%o2
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x88,	%i4
	ldx	[%l7 + 0x20],	%o4
	alignaddrl	%i4,	%g7,	%g1
	movrgez	%l5,	0x377,	%l1
	nop
	set	0x2E, %i0
	ldsh	[%l7 + %i0],	%o6
	ldd	[%l7 + 0x38],	%f10
	wr	%g0,	0x8a,	%asi
	lduha	[%l7 + 0x34] %asi,	%l4
	movule	%fcc1,	0x576,	%o1
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%l3
	ld	[%l7 + 0x30],	%f4
	nop
	set	0x09, %g1
	ldub	[%l7 + %g1],	%g3
	nop
        set     0x1C, %i4
        sta     %f25,   [%l7 + %i4] 0x15
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x83,	%o4
	nop
	set	0x7E, %l0
	lduh	[%l7 + %l0],	%i7
	array8	%l6,	%i6,	%o3
	nop
	set	0x08, %l5
	prefetch	[%l7 + %l5],	 1
	stbar
	nop
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x04,	%i0
	nop
	set	0x62, %o5
	ldsb	[%l7 + %o5],	%i1
	nop
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
	set	0x7C, %g7
	ldsha	[%l7 + %g7] 0x10,	%g4
	nop
	set	0x10, %i2
	std	%f30,	[%l7 + %i2]
	set	0x50, %o3
	stha	%o0,	[%l7 + %o3] 0x19
	nop
	set	0x39, %g4
	ldsba	[%l7 + %g4] 0x8b,	%l2
	wr	%g0,	0x82,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	stbar
	set	0x1C, %o4
	ldsba	[%l7 + %o4] 0x8a,	%g2
	sth	%o7,	[%l7 + 0x66]
	nop
	set	0x40, %l3
	flush	%l7 + %l3
	lduh	[%l7 + 0x2C],	%g5
	set	0x18, %i5
	ldsba	[%l7 + %i5] 0x88,	%l0
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%g6
	nop
        wr      %g0,    0x1c,   %asi
        ldsba   [%l7 + 0x41] %asi,      %l2
	set	0x68, %i1
	ldd	[%l7 + %i1],	%i2
	ldub	[%l7 + 0x22],	%i3
	set	0x5B, %g3
	ldsba	[%l7 + %g3] 0x8a,	%i5
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x10,	%o4
	nop
	set	0x60, %l2
	flush	%l7 + %l2
	set	0x44, %g5
	ldsba	[%l7 + %g5] 0x8b,	%o2
	set	0x60, %i4
!!	ldda	[%l7 + %i4] 0x34,	%g6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%i4
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x19,	%g1
	set	0x78, %i3
	prefetcha	[%l7 + %i3] 0x10,	 0
	set	0x46, %o0
	stba	%l1,	[%l7 + %o0] 0x10
	set	0x10, %o1
	lduwa	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x50, %o2
	ldsh	[%l7 + %o2],	%l4
	nop
	set	0x08, %l6
	std	%f2,	[%l7 + %l6]
	movle	%fcc2,	0x673,	%l3
        wr      %g0,    0x1c,   %asi
        stda    %g2,    [%l7 + 0x50] %asi
	sdivx	%g3,	0x00A6,	%o1
	set	0x54, %i0
	lda	[%l7 + %i0] 0x88,	%f13
	edge16n	%o5,	%i7,	%i6
	stbar
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%l6
	nop
        wr      %g0,    0x1c,   %asi
        lduwa   [%l7 + 0x50] %asi,      %g5
	set	0x18, %o7
	stwa	%i0,	[%l7 + %o7] 0x82
	std	%o2,	[%l7 + 0x60]
	stb	%g4,	[%l7 + 0x60]
	lduw	[%l7 + 0x38],	%o0
	swap	[%l7 + 0x4C],	%l2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x10
	ldsb	[%l7 + 0x1F],	%g2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x74] %asi,	%i1
	lduw	[%l7 + 0x54],	%g5
	set	0x6A, %g1
	ldsha	[%l7 + %g1] 0x81,	%l0
	nop
	set	0x18, %i6
	stda	%o6,	[%l7 + %i6] 0x83
	umul	%i2,	%g6,	%i3
	set	0x0C, %l5
	sta	%f18,	[%l7 + %l5] 0x88
	lduw	[%l7 + 0x44],	%o4
	sra	%i5,	%o2,	%i4
	st	%f18,	[%l7 + 0x50]
	nop
	wr	%g0,	0x8b,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
        set     0x3C, %g3
        stwa    %o3,    [%l7 + %g3] 0x1d
	set	0x16, %l0
	lduh	[%l7 + %l0],	%g1
        set     0x78, %l6
        prefetcha       [%l7 + %l6] 0x1d,        1
	sub	%l5,	%l1,	%g7
	set	0x50, %o5
	stxa	%l4,	[%l7 + %o5] 0x8b
	edge8l	%o6,	%l3,	%g3
	wr	%g0,	0x0c,	%asi
	stwa	%o1,	[%l7 + 0x54] %asi
	array8	%o5,	%i7,	%l6
	nop
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f0
	lduh	[%l7 + 0x76],	%i0
	flush	%l7 + 0x40
	nop
	set	0x3F, %g7
	ldub	[%l7 + %g7],	%o3
	nop
	setx	0x711B4924B04C4000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	nop
	set	0x10, %i2
	stw	%g4,	[%l7 + %i2]
	wr	%g0,	0x8a,	%asi
	lda	[%l7 + 0x40] %asi,	%f11
	nop
	set	0x60, %l1
	stxa	%i6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x2A, %g4
	ldub	[%l7 + %g4],	%l2
	swap	[%l7 + 0x1C],	%o0
	nop
	set	0x08, %o4
        set     0x6F, %g4
        ldsba   [%l7 + %g4] 0x1d,       %g5
	std	%f0,	[%l7 + %o4]
	std	%i0,	[%l7 + 0x40]
	movrlez	%g2,	%g5,	%o7
	add	%l7,	0x30,	%l6
        set     0x4E, %i4
        stba    %g2,    [%l7 + %i4] 0x14
        wr      %g0,    0x8a,   %asi
        ldda    [%l7 + 0x60] %asi,      %l4
        wr      %g0,    0x8a,   %asi
        lda     [%l7 + 0x20] %asi,      %f10
        wr      %g0,    0x14,   %asi
        lduba   [%l7 + 0x65] %asi,      %i0
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%g6
	nop
	set	0x08, %l3
	stw	%i3,	[%l7 + %l3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i2,	%i5
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f6
	swap	[%l7 + 0x28],	%o4
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f14
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%i4
	nop
	set	0x54, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x22,	%o2
	ldd	[%l7 + 0x70],	%f26
	nop
	set	0x5D, %l2
	ldstub	[%l7 + %l2],	%g1
	stx	%l1,	[%l7 + 0x30]
	nop
	set	0x1C, %g5
	lduba	[%l7 + %g5] 0x81,	%l5
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%g6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x59] %asi,	%l4
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x83,	%f0
	wr	%g0,	0x10,	%asi
	sta	%f18,	[%l7 + 0x68] %asi
	nop
	set	0x38, %l4
	stb	%o6,	[%l7 + %l4]
	set	0x38, %i3
	lduwa	[%l7 + %i3] 0x04,	%g3
	sth	%o1,	[%l7 + 0x78]
	ld	[%l7 + 0x68],	%f4
	sth	%o5,	[%l7 + 0x42]
	nop
	set	0x5C, %o1
	stw	%l6,	[%l7 + %o1]
	ldsb	[%l7 + 0x6B],	%i7
	stbar
	nop
	set	0x60, %o2
	stxa	%o3,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x33, %l6
	ldsb	[%l7 + %l6],	%i0
	lduw	[%l7 + 0x0C],	%g4
	wr	%g0,	0xe3,	%asi
	stwa	%i6,	[%l7 + 0x70] %asi
	membar	#Sync
        set     0x08, %l4
        lduwa   [%l7 + %l4] 0x1d,       %i5
        set     0x75, %l2
        lduba   [%l7 + %l2] 0x1d,       %i2
	set	0x58, %i0
	sta	%f1,	[%l7 + %i0] 0x80
	ldd	[%l7 + 0x18],	%o0
	st	%f5,	[%l7 + 0x24]
	wr	%g0,	0x8a,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i1
	nop
        set     0x1C, %g2
        lduwa   [%l7 + %g2] 0x1d,       %o7
        stbar
        wr      %g0,    0x1d,   %asi
        ldswa   [%l7 + 0x20] %asi,      %o2
	wr	%g0,	0x83,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 4
	nop
	set	0x08, %o0
	swap	[%l7 + %o0],	%g5
	stbar
	nop
	set	0x74, %o7
	flush	%l7 + %o7
	ldsh	[%l7 + 0x5E],	%l2
	nop
	set	0x2C, %g1
	lduha	[%l7 + %g1] 0x88,	%l0
	nop
	set	0x60, %i6
	stb	%o7,	[%l7 + %i6]
	prefetch	[%l7 + 0x40],	 0
	nop
	set	0x7E, %l5
	lduh	[%l7 + %l5],	%g6
	wr	%g0,	0x82,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i3
	stb	%i5,	[%l7 + 0x33]
	stx	%o4,	[%l7 + 0x10]
	nop
	set	0x08, %l0
	lduw	[%l7 + %l0],	%i4
	nop
	set	0x34, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x48, %g2
	stxa	%i2,	[%l7 + %g2] 0x82
	movle	%fcc0,	0x528,	%g1
	set	0x48, %g7
	lduba	[%l7 + %g7] 0x81,	%o2
	set	0x40, %o5
	ldsha	[%l7 + %o5] 0x10,	%l1
	prefetch	[%l7 + 0x08],	 0
	std	%f0,	[%l7 + 0x60]
	ldsb	[%l7 + 0x50],	%l5
	andn	%l4,	%g7,	%o6
	nop
	set	0x18, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x30, %i2
	sth	%l3,	[%l7 + %i2]
	set	0x3F, %g4
	stba	%g3,	[%l7 + %g4] 0x18
	nop
	set	0x10, %o4
	ldub	[%l7 + %o4],	%o1
	nop
	set	0x75, %o3
	ldub	[%l7 + %o3],	%l6
	nop
	setx	0x307F5000,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	nop
	set	0x20, %l3
	stx	%i7,	[%l7 + %l3]
	set	0x70, %i5
	lduwa	[%l7 + %i5] 0x89,	%o5
	sth	%o3,	[%l7 + 0x2E]
	swap	[%l7 + 0x6C],	%i0
	nop
	set	0x44, %g6
	prefetch	[%l7 + %g6],	 2
	sub	%g4,	%i6,	%i1
        set     0x10, %g5
        swapa   [%l7 + %g5] 0x15,       %i1
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%o0
	nop
	set	0x70, %g3
	swap	[%l7 + %g3],	%g5
	nop
	set	0x2B, %i1
	stb	%l2,	[%l7 + %i1]
	wr	%g0,	0x2f,	%asi
	stwa	%g2,	[%l7 + 0x44] %asi
	membar	#Sync
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x88
	wr	%g0,	0x8a,	%asi
	stba	%o7,	[%l7 + 0x3D] %asi
	wr	%g0,	0x23,	%asi
	stba	%l0,	[%l7 + 0x5B] %asi
	membar	#Sync
	nop
	setx	0xD05FBC00,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	nop
	set	0x50, %i7
	swap	[%l7 + %i7],	%g6
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x0c,	%f16
	ldsb	[%l7 + 0x6B],	%i3
	nop
	setx	0x304C3000,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	add	%l7,	0x30,	%l6
	wr	%g0,	0x8a,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x8a,	%o4,	%i5
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f10
	set	0x3F, %i3
	stba	%i2,	[%l7 + %i3] 0x10
	ldub	[%l7 + 0x28],	%g1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o2
	stbar
	lduw	[%l7 + 0x18],	%l1
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x82,	%asi
	casxa	[%l6] 0x82,	%i4,	%l4
	nop
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x82,	%o6
	ldsw	[%l7 + 0x1C],	%g7
	lduw	[%l7 + 0x50],	%l3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g3
	alignaddrl	%l6,	%i7,	%o1
	ldsw	[%l7 + 0x24],	%o3
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i0
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%o5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x60] %asi,	%f19
	nop
	set	0x62, %l6
	ldsh	[%l7 + %l6],	%i6
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%g4
        set     0x1C, %l3
        lda     [%l7 + %l3] 0x15,       %f29
	nop
	wr	%g0,	0xeb,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x5C, %o0
	stwa	%o0,	[%l7 + %o0] 0xe3
	membar	#Sync
	wr	%g0,	0x8b,	%asi
	sta	%f29,	[%l7 + 0x1C] %asi
	stw	%g5,	[%l7 + 0x28]
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%l2
	set	0x1A, %g1
	ldsha	[%l7 + %g1] 0x8b,	%g2
	nop
	setx	0x616800,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	add	%l7,	0x58,	%l6
	wr	%g0,	0x83,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%l0
	nop
	set	0x3C, %l5
	ldsh	[%l7 + %l5],	%g6
	nop
	set	0x08, %i6
	stb	%i3,	[%l7 + %i6]
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%i5
	set	0x12, %l0
	stba	%i2,	[%l7 + %l0] 0x18
	ldub	[%l7 + 0x17],	%g1
	nop
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x19,	%o4
	lduh	[%l7 + 0x38],	%o2
        wr      %g0,    0x15,   %asi
        sta     %f28,   [%l7 + 0x10] %asi
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x18, %l1
	lduw	[%l7 + %l1],	%l5
	set	0x56, %g7
	lduba	[%l7 + %g7] 0x0c,	%i4
	ldstub	[%l7 + 0x41],	%l4
	set	0x7C, %g4
	stwa	%o6,	[%l7 + %g4] 0x8b
	stx	%g7,	[%l7 + 0x20]
	std	%l2,	[%l7 + 0x10]
	wr	%g0,	0x8a,	%asi
	swapa	[%l7 + 0x30] %asi,	%g3
	swap	[%l7 + 0x34],	%l6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i7
	nop
	set	0x14, %i2
	ldsb	[%l7 + %i2],	%o1
	stbar
	nop
	set	0x44, %o3
	stw	%l1,	[%l7 + %o3]
	nop
	set	0x2A, %o4
	ldsh	[%l7 + %o4],	%i0
	st	%f31,	[%l7 + 0x54]
	stb	%o3,	[%l7 + 0x3A]
	set	0x4C, %i5
	sta	%f6,	[%l7 + %i5] 0x81
	nop
	set	0x4A, %g6
	ldsb	[%l7 + %g6],	%i6
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f6
        set     0x5D, %i7
        ldstuba [%l7 + %i7] 0x15,       %l0
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%o4
	stx	%i1,	[%l7 + 0x10]
	set	0x18, %l2
	stha	%g4,	[%l7 + %l2] 0x80
	nop
	set	0x47, %i7
	stb	%o0,	[%l7 + %i7]
	std	%g4,	[%l7 + 0x58]
	stb	%g2,	[%l7 + 0x29]
	nop
	setx	0xD605B94480720000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x75, %i4
	ldstub	[%l7 + %i4],	%l2
	nop
	wr	%g0,	0x83,	%asi
	lda	[%l7 + 0x6C] %asi,	%f3
	ldd	[%l7 + 0x08],	%o6
	nop
	set	0x58, %i3
	stx	%g6,	[%l7 + %i3]
	nop
	setx	0x08BC,	%l1,	%l0
	udivcc	%i3,	%l0,	%i5
	nop
	set	0x78, %g5
	stx	%i2,	[%l7 + %g5]
	set	0x50, %l4
	stwa	%g1,	[%l7 + %l4] 0x0c
	nop
	set	0x7C, %o2
	stw	%o2,	[%l7 + %o2]
	nop
	set	0x08, %i0
	stx	%o4,	[%l7 + %i0]
	lduw	[%l7 + 0x30],	%l5
	nop
	set	0x20, %l6
	lduha	[%l7 + %l6] 0x0c,	%i4
	nop
	set	0x66, %o1
	lduba	[%l7 + %o1] 0x82,	%o6
	set	0x7E, %o0
	stha	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x78, %o7
	std	%g6,	[%l7 + %o7]
	set	0x1C, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%l3
	movre	%l6,	0x370,	%i7
	nop
	set	0x58, %g1
	ldub	[%l7 + %g1],	%o1
	nop
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x11
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x3C] %asi,	%i0
	set	0x44, %g2
	ldswa	[%l7 + %g2] 0x19,	%o3
	nop
	setx	0x607C1C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	stx	%i6,	[%l7 + 0x08]
        set     0x30, %i3
        ldxa    [%l7 + %i3] 0x15,       %l4
	nop
	wr	%g0,	0x8b,	%asi
	stba	%g3,	[%l7 + 0x75] %asi
	nop
	set	0x70, %i6
	swap	[%l7 + %i6],	%i1
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x11,	%f28
	ldd	[%l7 + 0x10],	%g4
	lduw	[%l7 + 0x7C],	%o5
	smulcc	%g5,	0x03B2,	%g2
	movug	%fcc0,	%l2,	%o7
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x8a,	%asi
	casxa	[%l6] %asi,	%o0,	%i3
	st	%f6,	[%l7 + 0x20]
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x40] %asi,	%g6
	stw	%l0,	[%l7 + 0x64]
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f16
	stbar
	ldsw	[%l7 + 0x74],	%i2
	nop
	set	0x60, %g4
	ldsha	[%l7 + %g4] 0x8a,	%g1
	nop
	set	0x30, %i2
	stxa	%i5,	[%l7 + %i2] 0x0c
	nop
	wr	%g0,	0x8a,	%asi
	sta	%f19,	[%l7 + 0x5C] %asi
	std	%o2,	[%l7 + 0x10]
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x40] %asi,	%l5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldub	[%l7 + 0x52],	%i4
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%o4
        wr      %g0,    0x26,   %asi
        ldda    [%l7 + 0x40] %asi,      %g4
	nop
	set	0x14, %o3
	lda	[%l7 + %o3] 0x0c,	%f3
	nop
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd1
	nop
	set	0x44, %o4
	sth	%o6,	[%l7 + %o4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g7,	%l4
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%l6
	prefetch	[%l7 + 0x20],	 3
	nop
	setx	0x107E5C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	wr	%g0,	0x82,	%asi
	lda	[%l7 + 0x70] %asi,	%f17
	nop
	setx	0xC05F1C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	nop
	setx	0xF6950BA7D0748400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	prefetch	[%l7 + 0x70],	 3
	sth	%l3,	[%l7 + 0x48]
	nop
	set	0x4C, %l3
	swap	[%l7 + %l3],	%o1
	nop
	set	0x70, %l2
	std	%i6,	[%l7 + %l2]
	stb	%l1,	[%l7 + 0x47]
	nop
	set	0x3C, %i7
	ldsw	[%l7 + %i7],	%o3
	wr	%g0,	0x19,	%asi
	stwa	%i6,	[%l7 + 0x74] %asi
	set	0x57, %g3
	lduba	[%l7 + %g3] 0x81,	%i0
	set	0x63, %i4
	stba	%g3,	[%l7 + %i4] 0x2a
	membar	#Sync
	nop
	set	0x38, %i1
	stx	%i1,	[%l7 + %i1]
	ldd	[%l7 + 0x28],	%f8
	nop
	setx	0x1F5471ACB07BC800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	ldx	[%l7 + 0x10],	%g4
	std	%f6,	[%l7 + 0x78]
	nop
	set	0x18, %g5
	stx	%g5,	[%l7 + %g5]
	wr	%g0,	0x82,	%asi
	stxa	%o5,	[%l7 + 0x10] %asi
	std	%l2,	[%l7 + 0x10]
        wr      %g0,    0x2e,   %asi
        ldda    [%l7 + 0x70] %asi,      %o2
	stbar
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x88,	%o7
	swap	[%l7 + 0x50],	%o0
	nop
	set	0x50, %l4
	std	%i2,	[%l7 + %l4]
	wr	%g0,	0x8a,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g6
	nop
	setx	0xF0636000,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	set	0x34, %i0
	stba	%g2,	[%l7 + %i0] 0x83
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i2
	nop
	set	0x70, %o2
	ldstuba	[%l7 + %o2] 0x82,	%g1
	stbar
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%l0
	stbar
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x29] %asi,	%i5
	nop
	set	0x6A, %o0
	ldsb	[%l7 + %o0],	%l5
	wr	%g0,	0x8a,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i4
	ldd	[%l7 + 0x78],	%o2
	ldsw	[%l7 + 0x14],	%o4
	sth	%g7,	[%l7 + 0x44]
	nop
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x11,	%o6
	swap	[%l7 + 0x2C],	%l6
	nop
	set	0x0B, %o1
	ldsb	[%l7 + %o1],	%l3
	nop
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x08, %g1
	lduw	[%l7 + %g1],	%l4
	nop
	set	0x3C, %o6
	lduh	[%l7 + %o6],	%o1
	lduh	[%l7 + 0x6A],	%l1
	nop
	setx	0x105C5800,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f30
	nop
	set	0x6C, %g2
	stw	%o3,	[%l7 + %g2]
	prefetch	[%l7 + 0x34],	 1
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%i6
	ldd	[%l7 + 0x18],	%f16
	nop
	wr	%g0,	0x81,	%asi
	stda	%i0,	[%l7 + 0x70] %asi
	prefetch	[%l7 + 0x14],	 3
	set	0x30, %l1
	stwa	%i7,	[%l7 + %l1] 0x8a
	nop
	setx	0x09A9,	%l0,	%g3
	sdivcc	%i1,	%g3,	%g4
	subc	%o5,	%g5,	%l2
	nop
	set	0x1C, %o5
	ldsh	[%l7 + %o5],	%o7
	nop
	set	0x24, %g4
	lduh	[%l7 + %g4],	%o0
	wr	%g0,	0xeb,	%asi
	stda	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	nop
	set	0x1E, %l5
	ldsh	[%l7 + %l5],	%g6
	ldsb	[%l7 + 0x15],	%i2
	nop
	set	0x0C, %i2
	stba	%g1,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x7C, %g7
	stw	%g2,	[%l7 + %g7]
	nop
	set	0x78, %i5
	stxa	%i5,	[%l7 + %i5] 0x89
	prefetch	[%l7 + 0x20],	 2
	sll	%l5,	0x09,	%i4
	set	0x6A, %o4
	lduba	[%l7 + %o4] 0x11,	%l0
	nop
	set	0x20, %o3
	stw	%o4,	[%l7 + %o3]
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%g7
	st	%f12,	[%l7 + 0x74]
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o2
	nop
	wr	%g0,	0x82,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o6
	set	0x10, %l3
	stba	%l3,	[%l7 + %l3] 0x10
	stbar
	nop
	setx	0x5BE8B18A00524000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	stbar
	wr	%g0,	0x2a,	%asi
	stwa	%l6,	[%l7 + 0x28] %asi
	membar	#Sync
	nop
	set	0x44, %i7
	lduha	[%l7 + %i7] 0x04,	%l4
	ldub	[%l7 + 0x77],	%l1
	nop
	set	0x3B, %g3
	ldub	[%l7 + %g3],	%o3
	nop
	setx	0x5612D61C7050D400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	nop
	set	0x40, %i4
	stx	%o1,	[%l7 + %i4]
	nop
	set	0x0C, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x10, %g5
	lduh	[%l7 + %g5],	%i0
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f19
	nop
	set	0x54, %i3
	lduw	[%l7 + %i3],	%i7
	ldsh	[%l7 + 0x18],	%i1
	ldstub	[%l7 + 0x57],	%i6
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g4
	nop
	wr	%g0,	0x8a,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o5
	stbar
	nop
	setx	0xA8897D76D0630400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	ldd	[%l7 + 0x30],	%f2
	nop
	set	0x08, %l2
	stw	%g3,	[%l7 + %l2]
	nop
	set	0x42, %l4
	ldsba	[%l7 + %l4] 0x19,	%g5
	wr	%g0,	0x0c,	%asi
	stwa	%l2,	[%l7 + 0x2C] %asi
	set	0x78, %i0
	lduha	[%l7 + %i0] 0x18,	%o0
	ldsw	[%l7 + 0x54],	%i3
	set	0x64, %l6
	ldstuba	[%l7 + %l6] 0x8a,	%g6
	ldsw	[%l7 + 0x2C],	%i2
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x82,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%g1
	ldstub	[%l7 + 0x3A],	%g2
	nop
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x8a,	%l5
	wr	%g0,	0x0c,	%asi
	stxa	%i4,	[%l7 + 0x28] %asi
	std	%f28,	[%l7 + 0x38]
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x8a,	 2
	edge32n	%i5,	%g7,	%o2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc0
	nop
	setx	0x304FAC00,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movlg	%fcc3,	0x665,	%o4
	nop
	set	0x16, %g1
	ldub	[%l7 + %g1],	%o6
	set	0x40, %o1
	stwa	%l6,	[%l7 + %o1] 0x2f
	membar	#Sync
	set	0x6C, %l0
	ldswa	[%l7 + %l0] 0x04,	%l3
	set	0x68, %g2
	lduha	[%l7 + %g2] 0x82,	%l4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o3
	nop
	set	0x76, %i6
	ldsb	[%l7 + %i6],	%l1
	ldd	[%l7 + 0x30],	%f22
	umulcc	%i0,	0x1918,	%i7
	ld	[%l7 + 0x74],	%f17
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i6
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x18] %asi,	%f28
	nop
	set	0x24, %l1
	stwa	%i1,	[%l7 + %l1] 0xeb
	membar	#Sync
	wr	%g0,	0x8b,	%asi
	ldsha	[%l7 + 0x34] %asi,	%g4
	ldx	[%l7 + 0x50],	%g3
	prefetch	[%l7 + 0x08],	 2
	smul	%o5,	%g5,	%l2
	nop
	set	0x6E, %o6
	sth	%i3,	[%l7 + %o6]
	nop
	set	0x10, %o5
	ldsb	[%l7 + %o5],	%o0
	nop
	set	0x76, %g4
	stb	%i2,	[%l7 + %g4]
	nop
	setx	0xD063E400,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	ldd	[%l7 + 0x50],	%g6
	nop
	wr	%g0,	0x80,	%asi
	sta	%f5,	[%l7 + 0x6C] %asi
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f16
	stx	%o7,	[%l7 + 0x30]
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5C] %asi,	%g1
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%l5
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%g2
	ldd	[%l7 + 0x58],	%f0
	ldsb	[%l7 + 0x51],	%i4
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x8a,	 4
	ldsw	[%l7 + 0x30],	%g7
	nop
	set	0x10, %o3
	swap	[%l7 + %o3],	%o2
	edge8l	%o4,	%o6,	%l6
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
	wr	%g0,	0x8b,	%asi
	sta	%f17,	[%l7 + 0x0C] %asi
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%l4
	wr	%g0,	0x8a,	%asi
	lduha	[%l7 + 0x36] %asi,	%o3
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%l1
	stb	%l0,	[%l7 + 0x25]
	wr	%g0,	0x83,	%asi
	stwa	%i7,	[%l7 + 0x2C] %asi
	ldd	[%l7 + 0x78],	%o0
	nop
	set	0x74, %l3
	stwa	%i0,	[%l7 + %l3] 0x0c
	std	%i6,	[%l7 + 0x68]
	stbar
	ldd	[%l7 + 0x78],	%f30
	nop
	setx	0xCB356C3AC0662000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	nop
	set	0x7A, %o4
	stha	%g4,	[%l7 + %o4] 0x88
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%i1
	nop
	set	0x68, %g3
	lduw	[%l7 + %g3],	%o5
	add	%g5,	%g3,	%l2
	stx	%o0,	[%l7 + 0x48]
	st	%f19,	[%l7 + 0x1C]
	nop
	setx	0x1EDB,	%l0,	%g6
	sdiv	%i3,	%g6,	%o7
	wr	%g0,	0x83,	%asi
	ldsba	[%l7 + 0x68] %asi,	%g1
	lduh	[%l7 + 0x74],	%i2
	nop
	setx	0xEE8ACC32305A4000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	set	0x2D, %i7
	ldstub	[%l7 + %i7],	%g2
	nop
	set	0x23, %i4
	stba	%l5,	[%l7 + %i4] 0x22
	membar	#Sync
	nop
	set	0x19, %i1
	ldub	[%l7 + %i1],	%i5
	set	0x6C, %i3
	lduha	[%l7 + %i3] 0x10,	%i4
	nop
	set	0x70, %g5
	stx	%o2,	[%l7 + %g5]
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%o4
	flush	%l7 + 0x0C
	addcc	%g7,	0x1FC6,	%l6
	nop
	set	0x60, %l4
	stx	%o6,	[%l7 + %l4]
	flush	%l7 + 0x24
	nop
	set	0x2C, %i0
	ldsh	[%l7 + %i0],	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l1
	umulcc	%l0,	0x0ADD,	%i7
	std	%l2,	[%l7 + 0x70]
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x11,	 1
	st	%f6,	[%l7 + 0x78]
	movgu	%icc,	0x03C,	%o1
	nop
	setx	0x1BBB,	%l0,	%i6
	udiv	%g4,	%i6,	%i1
	nop
	set	0x4D, %o0
	ldsb	[%l7 + %o0],	%g5
	ldub	[%l7 + 0x59],	%o5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	wr	%g0,	0x80,	%asi
	stba	%g3,	[%l7 + 0x25] %asi
	nop
	setx	0x607AE400,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	add	%l7,	0x70,	%l6
	wr	%g0,	0x83,	%asi
	casa	[%l6] %asi,	%i3,	%g6
	nop
	set	0x36, %o7
	sth	%o0,	[%l7 + %o7]
	nop
	setx	0x2486512540408000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%g1
	ldd	[%l7 + 0x70],	%f12
	set	0x28, %g1
	stxa	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
	ldsb	[%l7 + 0x68],	%i2
	nop
	set	0x28, %o1
	flush	%l7 + %o1
	nop
	setx	0xE0570000,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	stbar
	nop
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x0c,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%o2
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x64] %asi
	nop
	set	0x63, %g2
	ldub	[%l7 + %g2],	%l5
	swap	[%l7 + 0x28],	%g7
	stbar
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%l6
	std	%f20,	[%l7 + 0x38]
	nop
	wr	%g0,	0x10,	%asi
	stxa	%o6,	[%l7 + 0x40] %asi
	nop
	set	0x30, %l6
	lda	[%l7 + %l6] 0x19,	%f4
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f8
	alignaddrl	%l4,	%o3,	%o4
	ldub	[%l7 + 0x13],	%l0
	ldsh	[%l7 + 0x68],	%l1
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array8	%l3,	%i7,	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x83,	%asi
	casxa	[%l6] %asi,	%i0,	%g4
	nop
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%i6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g5
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f16
	set	0x78, %l5
	lduwa	[%l7 + %l5] 0x8a,	%i1
	nop
	setx	0x3F4CCC59005EA800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f18
	nop
	set	0x36, %g7
	sth	%g3,	[%l7 + %g7]
	prefetch	[%l7 + 0x34],	 3
	nop
	setx	0xE7BDD091605A1400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	set	0x10, %o3
	stx	%i3,	[%l7 + %o3]
	nop
	setx	0x1F213DD8A070FC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x40, %g6
	stx	%g6,	[%l7 + %g6]
	set	0x68, %i2
	stba	%l2,	[%l7 + %i2] 0x27
	membar	#Sync
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x74] %asi,	%o0
	set	0x60, %o4
	lda	[%l7 + %o4] 0x88,	%f7
	edge16l	%g1,	%o7,	%i2
	wr	%g0,	0x2b,	%asi
	stha	%i5,	[%l7 + 0x42] %asi
	membar	#Sync
	set	0x44, %g3
	lduha	[%l7 + %g3] 0x89,	%i4
	wr	%g0,	0x8a,	%asi
	sta	%f20,	[%l7 + 0x34] %asi
	sll	%o2,	0x1F,	%g2
	set	0x74, %l3
	ldswa	[%l7 + %l3] 0x81,	%g7
	nop
	set	0x54, %i7
	ldsha	[%l7 + %i7] 0x82,	%l5
	ldsw	[%l7 + 0x28],	%l6
	ldx	[%l7 + 0x20],	%l4
	mulx	%o6,	%o4,	%o3
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%l1
	nop
	setx	0xEA4412DB205A3400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	set	0x3A, %i4
	stha	%l3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x16
	membar	#Sync
	movre	%l0,	%i7,	%o1
	nop
	setx	0xFF52A63A06E8000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	set	0x0C, %i1
	lduh	[%l7 + %i1],	%i0
	ld	[%l7 + 0x58],	%f4
	ldx	[%l7 + 0x58],	%i6
	ldsb	[%l7 + 0x4B],	%g5
	sth	%o5,	[%l7 + 0x4E]
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0
	ld	[%l7 + 0x6C],	%f1
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%g3
	nop
	set	0x18, %g5
	stxa	%i1,	[%l7 + %g5] 0x10
	nop
	set	0x50, %l4
	std	%i2,	[%l7 + %l4]
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g6
	ld	[%l7 + 0x7C],	%f10
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%l2
	movvs	%xcc,	0x06F,	%o0
	ld	[%l7 + 0x60],	%f26
	swap	[%l7 + 0x08],	%g1
	move	%fcc0,	%o7,	%i2
	nop
	set	0x33, %o7
	ldub	[%l7 + %o7],	%i5
	ldd	[%l7 + 0x58],	%i4
	set	0x70, %g1
	ldsha	[%l7 + %g1] 0x8b,	%g2
	nop
	set	0x24, %o2
	ldsba	[%l7 + %o2] 0x0c,	%g7
	nop
	set	0x7A, %o1
	lduh	[%l7 + %o1],	%o2
	nop
	set	0x54, %l0
	flush	%l7 + %l0
	nop
	set	0x7C, %i6
	ldstub	[%l7 + %i6],	%l6
	mulx	%l5,	%o6,	%l4
	nop
	set	0x39, %g2
	ldstub	[%l7 + %g2],	%o4
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%l1
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x8a,	%asi
	casa	[%l6] %asi,	%o3,	%l3
	stw	%i7,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%f28
	st	%f31,	[%l7 + 0x70]
	st	%f28,	[%l7 + 0x64]
	nop
	set	0x73, %l6
	ldsba	[%l7 + %l6] 0x83,	%o1
	nop
	setx	0x7062C800,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%l0
	wr	%g0,	0x18,	%asi
	stba	%i0,	[%l7 + 0x68] %asi
	sra	%g5,	%i6,	%o5
	stbar
	nop
	set	0x36, %g4
	sth	%g4,	[%l7 + %g4]
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x50, %l1
	sta	%f15,	[%l7 + %l1] 0x04
	nop
	set	0x3C, %i5
	ldsh	[%l7 + %i5],	%i3
	nop
	setx	0x5CB25D57B078B800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	nop
	set	0x33, %g7
	ldstub	[%l7 + %g7],	%g6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x1e,	%f0
	set	0x08, %l5
	stwa	%i1,	[%l7 + %l5] 0x8a
	nop
	set	0x70, %i2
	stx	%l2,	[%l7 + %i2]
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x6E, %g6
	ldstub	[%l7 + %g6],	%g1
	wr	%g0,	0x83,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x44, %g3
	flush	%l7 + %g3
	ld	[%l7 + 0x5C],	%f22
	nop
	set	0x76, %l3
	ldsh	[%l7 + %l3],	%o0
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i2
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i5
	set	0x44, %o4
	stha	%o7,	[%l7 + %o4] 0x2b
	membar	#Sync
	nop
	set	0x24, %i4
	flush	%l7 + %i4
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 4
	ldd	[%l7 + 0x20],	%f22
	nop
	set	0x30, %i7
	std	%f4,	[%l7 + %i7]
	ldd	[%l7 + 0x28],	%f4
	nop
	set	0x78, %l2
	stha	%i4,	[%l7 + %l2] 0x80
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g7
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x20, %g5
	lduw	[%l7 + %g5],	%l5
	sth	%l1,	[%l7 + 0x64]
	lduw	[%l7 + 0x7C],	%o3
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%l3
	nop
	set	0x58, %i1
	std	%i6,	[%l7 + %i1]
	edge8n	%l6,	%o1,	%i0
	lduw	[%l7 + 0x7C],	%g5
	nop
	set	0x6C, %i0
	lduh	[%l7 + %i0],	%i6
	nop
	set	0x7E, %l4
	sth	%o5,	[%l7 + %l4]
	ldstub	[%l7 + 0x34],	%l0
	nop
	wr	%g0,	0x2f,	%asi
	stba	%g4,	[%l7 + 0x6C] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 4
	stx	%i3,	[%l7 + 0x28]
	lduw	[%l7 + 0x58],	%g6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x18] %asi,	%l2
	sllx	%i1,	0x1F,	%g1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i2
	nop
	set	0x38, %o0
	swap	[%l7 + %o0],	%o0
	stw	%o7,	[%l7 + 0x68]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x11,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x19,	%i5,	%i4
	nop
	set	0x20, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x63, %o1
	stb	%g7,	[%l7 + %o1]
	ldstub	[%l7 + 0x0E],	%o2
	swap	[%l7 + 0x3C],	%l5
	set	0x54, %l0
	ldsba	[%l7 + %l0] 0x8a,	%l4
	set	0x40, %i6
	stha	%o4,	[%l7 + %i6] 0x2f
	membar	#Sync
	nop
	set	0x12, %o2
	sth	%l1,	[%l7 + %o2]
	edge8n	%o3,	%o6,	%i7
	wr	%g0,	0x82,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
	nop
	set	0x38, %g2
	std	%i6,	[%l7 + %g2]
	nop
	wr	%g0,	0xe3,	%asi
	stba	%i0,	[%l7 + 0x2C] %asi
	membar	#Sync
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%g5
	nop
	setx	0xDC38193B30561400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x46] %asi,	%o1
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%l0
	wr	%g0,	0x82,	%asi
	stda	%g2,	[%l7 + 0x60] %asi
	nop
	setx	0x1475,	%l0,	%g4
	sdiv	%i3,	%g4,	%l2
	sth	%g6,	[%l7 + 0x74]
	nop
	setx	0x275979DFD0435000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc2
	nop
	set	0x52, %o5
	sth	%i1,	[%l7 + %o5]
	movre	%g1,	0x122,	%i2
	array16	%o7,	%i5,	%i4
	nop
	set	0x48, %g4
	stda	%g2,	[%l7 + %g4] 0x83
	stbar
	nop
	set	0x0E, %l1
	stb	%g7,	[%l7 + %l1]
	wr	%g0,	0x83,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o0
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x2c,	%o2
	set	0x79, %g7
	ldsba	[%l7 + %g7] 0x82,	%l4
	nop
	set	0x52, %o3
	ldub	[%l7 + %o3],	%o4
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%l1
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	nop
	set	0x50, %g6
	swap	[%l7 + %g6],	%o6
	nop
	set	0x3B, %l5
	ldub	[%l7 + %l5],	%o3
	sth	%i7,	[%l7 + 0x4A]
	stb	%l6,	[%l7 + 0x61]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x50] %asi,	%i0
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%o1
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x10,	 2
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o5
	set	0x78, %i3
	lduba	[%l7 + %i3] 0x8b,	%l0
	bmask	%g3,	%i3,	%g4
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%i6
	bmask	%g6,	%i1,	%l2
	lduw	[%l7 + 0x54],	%i2
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%g1
	add	%o7,	%i5,	%i4
	nop
	setx	0xF07BA000,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	add	%g7,	%g2,	%o0
	nop
	setx	0xB3382695C060F800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	wr	%g0,	0x8b,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l4
	edge16	%o4,	%l1,	%l5
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x54, %l2
	swapa	[%l7 + %l2] 0x83,	%o6
	ldstub	[%l7 + 0x53],	%o3
	set	0x71, %i1
	lduba	[%l7 + %i1] 0x81,	%i7
	ldx	[%l7 + 0x10],	%l6
	movneg	%icc,	0x6CF,	%i0
	nop
	set	0x30, %l4
	stx	%o2,	[%l7 + %l4]
	wr	%g0,	0x11,	%asi
	stda	%o0,	[%l7 + 0x20] %asi
	nop
	setx	0xD0468000,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	movrgez	%g5,	0x346,	%o5
	nop
	set	0x28, %i0
	std	%l2,	[%l7 + %i0]
	stbar
	nop
	set	0x74, %g1
	prefetch	[%l7 + %g1],	 0
	stx	%l0,	[%l7 + 0x08]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x8a,	%asi
	casxa	[%l6] %asi,	%g3,	%g4
	nop
	set	0x36, %o7
	ldsb	[%l7 + %o7],	%i3
	flush	%l7 + 0x68
	ldsw	[%l7 + 0x3C],	%i6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g6
	nop
	set	0x65, %o0
	stb	%l2,	[%l7 + %o0]
	ldstub	[%l7 + 0x14],	%i2
	ldsw	[%l7 + 0x38],	%g1
	wr	%g0,	0x04,	%asi
	sta	%f1,	[%l7 + 0x6C] %asi
	nop
	set	0x30, %l0
	ldswa	[%l7 + %l0] 0x80,	%i1
	ldsb	[%l7 + 0x71],	%i5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%g7
	ldsb	[%l7 + 0x5E],	%o7
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	nop
	set	0x38, %o1
	std	%f14,	[%l7 + %o1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%o4
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x2a,	%l4
	nop
	set	0x0C, %g2
	ldstub	[%l7 + %g2],	%l5
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x18, %l6
	stw	%o6,	[%l7 + %l6]
	ld	[%l7 + 0x70],	%f5
	std	%l0,	[%l7 + 0x18]
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x82,	%i7
	stbar
	nop
	set	0x3C, %o6
	sth	%l6,	[%l7 + %o6]
	prefetch	[%l7 + 0x78],	 3
	lduh	[%l7 + 0x2C],	%i0
	andncc	%o2,	%o1,	%o3
	std	%f30,	[%l7 + 0x28]
	std	%g4,	[%l7 + 0x60]
	movleu	%icc,	%l3,	%o5
	nop
	set	0x2F, %l1
	ldstub	[%l7 + %l1],	%g3
	std	%l0,	[%l7 + 0x50]
	wr	%g0,	0x19,	%asi
	stha	%g4,	[%l7 + 0x50] %asi
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x8a,	%asi
	casxa	[%l6] %asi,	%i3,	%g6
	nop
	set	0x10, %g4
	swap	[%l7 + %g4],	%l2
	set	0x70, %g7
	stha	%i6,	[%l7 + %g7] 0x8a
	ldd	[%l7 + 0x40],	%i2
	nop
	setx	0x205B3C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	nop
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	ldsh	[%l7 + 0x3A],	%g1
	ldd	[%l7 + 0x30],	%f22
	stx	%i5,	[%l7 + 0x20]
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i4
	wr	%g0,	0x18,	%asi
	stwa	%g7,	[%l7 + 0x34] %asi
	lduh	[%l7 + 0x4C],	%o0
	nop
	set	0x52, %i2
	ldsb	[%l7 + %i2],	%o7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addcc	%o4,	%l4,	%g2
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o6
	nop
	set	0x5D, %o3
	ldstub	[%l7 + %o3],	%l5
	nop
	set	0x50, %l5
	std	%f30,	[%l7 + %l5]
	wr	%g0,	0x18,	%asi
	stda	%l0,	[%l7 + 0x50] %asi
	ldd	[%l7 + 0x60],	%i6
	nop
	wr	%g0,	0x8a,	%asi
	sta	%f8,	[%l7 + 0x4C] %asi
	nop
	set	0x14, %g6
	prefetch	[%l7 + %g6],	 0
	prefetch	[%l7 + 0x28],	 3
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x18] %asi,	%l6
	nop
	set	0x2E, %l3
	ldsh	[%l7 + %l3],	%o2
	ldub	[%l7 + 0x14],	%i0
	nop
	setx	0xB0415400,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o3
	nop
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x67] %asi,	%g5
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd3
	nop
	set	0x16, %o4
	stb	%l3,	[%l7 + %o4]
	addccc	%o1,	0x18E9,	%o5
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%g3
	ldd	[%l7 + 0x58],	%f4
	nop
	wr	%g0,	0x22,	%asi
	stba	%g4,	[%l7 + 0x2B] %asi
	membar	#Sync
	movneg	%xcc,	%l0,	%g6
	nop
	set	0x2B, %i3
	ldub	[%l7 + %i3],	%i3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l2
	stw	%i2,	[%l7 + 0x28]
	nop
	set	0x72, %i4
	ldsh	[%l7 + %i4],	%i1
	set	0x20, %g5
	stda	%g0,	[%l7 + %g5] 0x11
	nop
	wr	%g0,	0x83,	%asi
	sta	%f17,	[%l7 + 0x2C] %asi
	nop
	set	0x24, %l2
	lduh	[%l7 + %l2],	%i6
	stb	%i4,	[%l7 + 0x74]
	stw	%i5,	[%l7 + 0x24]
	stbar
	nop
	set	0x18, %i7
	stda	%l4,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x2E, %i1
	ldsh	[%l7 + %i1],	%g2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2C] %asi,	%o6
	nop
	set	0x1C, %i0
	ldstub	[%l7 + %i0],	%o4
	prefetch	[%l7 + 0x0C],	 1
	set	0x20, %g1
	stxa	%l5,	[%l7 + %g1] 0x04
	ldx	[%l7 + 0x40],	%i7
	alignaddr	%l1,	%l6,	%o2
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f26
	sth	%i0,	[%l7 + 0x7A]
	ldsw	[%l7 + 0x70],	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o3,	%l3
	nop
	set	0x20, %o7
	lduwa	[%l7 + %o7] 0x10,	%o5
	ld	[%l7 + 0x0C],	%f25
	nop
	set	0x54, %l0
	ldsw	[%l7 + %l0],	%g3
	nop
	set	0x13, %o1
	stb	%g4,	[%l7 + %o1]
	set	0x2E, %i6
	stba	%o1,	[%l7 + %i6] 0x27
	membar	#Sync
	nop
	set	0x30, %g2
	std	%l0,	[%l7 + %g2]
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 3
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x44] %asi,	%l2
	nop
	set	0x0C, %o2
	prefetch	[%l7 + %o2],	 4
	wr	%g0,	0x80,	%asi
	stba	%g6,	[%l7 + 0x43] %asi
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x2C, %l6
	sta	%f7,	[%l7 + %l6] 0x18
	swap	[%l7 + 0x60],	%i1
	ldsh	[%l7 + 0x46],	%g1
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	nop
	setx	0xFA82F5F190502C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ldd	[%l7 + 0x60],	%f4
	nop
	set	0x40, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x58, %o6
	lda	[%l7 + %o6] 0x04,	%f21
	nop
	setx	0xB305D1D7A05FF400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	nop
	setx	0x40616800,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	nop
	set	0x70, %o0
	swap	[%l7 + %o0],	%i5
	st	%f4,	[%l7 + 0x14]
	st	%f0,	[%l7 + 0x38]
	edge16n	%i4,	%o0,	%o7
	set	0x70, %l1
	lduba	[%l7 + %l1] 0x04,	%l4
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 2
	nop
	set	0x48, %g4
	std	%f24,	[%l7 + %g4]
	movpos	%icc,	0x1EC,	%o6
	nop
	setx	0xE064C000,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	nop
	set	0x1E, %i5
	sth	%o4,	[%l7 + %i5]
	nop
	set	0x3B, %g7
	ldsb	[%l7 + %g7],	%g2
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x8a,	%i7
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%l1
	st	%f13,	[%l7 + 0x68]
	lduw	[%l7 + 0x20],	%l6
	movl	%fcc3,	%l5,	%o2
	lduw	[%l7 + 0x5C],	%i0
	smul	%o3,	0x11D1,	%l3
	nop
	set	0x08, %i2
	swap	[%l7 + %i2],	%o5
	nop
	setx	0x60D1C831F05C8000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	addccc	%g3,	%g4,	%o1
	lduw	[%l7 + 0x3C],	%l0
	ldstub	[%l7 + 0x09],	%i3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd3,	%f0
	swap	[%l7 + 0x0C],	%l2
	set	0x2F, %l3
	lduba	[%l7 + %l3] 0x10,	%g6
	ldsh	[%l7 + 0x68],	%g5
	nop
	set	0x08, %g3
	stx	%g1,	[%l7 + %g3]
	set	0x3F, %l5
	ldsba	[%l7 + %l5] 0x81,	%i6
	nop
	set	0x36, %o4
	lduh	[%l7 + %o4],	%i2
	ldx	[%l7 + 0x38],	%i5
	set	0x76, %i4
	ldsba	[%l7 + %i4] 0x10,	%i4
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i1,	%o7
	addcc	%l4,	%g7,	%o0
	set	0x76, %i3
	lduha	[%l7 + %i3] 0x89,	%o6
	alignaddrl	%g2,	%i7,	%o4
	nop
	set	0x68, %g5
	stb	%l1,	[%l7 + %g5]
	ldsw	[%l7 + 0x2C],	%l5
	ldd	[%l7 + 0x70],	%f30
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x8a,	%asi
	casa	[%l6] 0x8a,	%o2,	%l6
	stb	%i0,	[%l7 + 0x6D]
	stbar
	set	0x74, %i7
	lduwa	[%l7 + %i7] 0x04,	%o3
	swap	[%l7 + 0x20],	%o5
	set	0x35, %l2
	stba	%l3,	[%l7 + %l2] 0x22
	membar	#Sync
	stbar
	ld	[%l7 + 0x50],	%f23
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x88,	%g3
	set	0x30, %g1
	stwa	%g4,	[%l7 + %g1] 0x8a
	movule	%fcc3,	%o1,	%l0
	or	%i3,	0x0DFA,	%g6
	wr	%g0,	0x8b,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g5
	nop
	set	0x20, %i0
	lduh	[%l7 + %i0],	%l2
	nop
	set	0x50, %l4
	std	%f0,	[%l7 + %l4]
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%i6
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%i2
	nop
	setx	0x2540DBF980447400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	nop
	setx	0xC7891694F06EF400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	ldsw	[%l7 + 0x5C],	%g1
	nop
	setx	0x3052F400,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	ldd	[%l7 + 0x20],	%i4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc1
	stbar
	add	%l7,	0x58,	%l6
	wr	%g0,	0x8a,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o7
	st	%f18,	[%l7 + 0x38]
	nop
	set	0x48, %i6
	stw	%i4,	[%l7 + %i6]
	nop
	wr	%g0,	0x8b,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%l4
	stb	%o0,	[%l7 + 0x6F]
	nop
	set	0x1E, %o2
	lduh	[%l7 + %o2],	%g7
	st	%f5,	[%l7 + 0x74]
	prefetch	[%l7 + 0x30],	 4
	nop
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd8
	flush	%l7 + 0x3C
	lduh	[%l7 + 0x78],	%o6
	wr	%g0,	0x8b,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%i7
	ld	[%l7 + 0x14],	%f21
	set	0x08, %o5
	stxa	%o4,	[%l7 + %o5] 0x8a
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f6
	ldd	[%l7 + 0x50],	%l0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe3,	%g2
	ldub	[%l7 + 0x66],	%o2
	set	0x63, %l1
	lduba	[%l7 + %l1] 0x04,	%l5
	nop
	set	0x0C, %g4
	stb	%l6,	[%l7 + %g4]
	xnorcc	%i0,	0x1731,	%o3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l3
	array16	%o5,	%g4,	%g3
	nop
	set	0x20, %i5
	lduw	[%l7 + %i5],	%l0
	ldsw	[%l7 + 0x58],	%o1
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f4
	nop
	set	0x1C, %o3
	stw	%g6,	[%l7 + %o3]
	nop
	setx	0xF1111187C07C2800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x74, %i2
	stw	%g5,	[%l7 + %i2]
	ldd	[%l7 + 0x40],	%l2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i3
	ld	[%l7 + 0x3C],	%f8
	stbar
	flush	%l7 + 0x64
	ldx	[%l7 + 0x18],	%i2
	ldstub	[%l7 + 0x16],	%i6
	nop
	set	0x2E, %g7
	ldsb	[%l7 + %g7],	%i5
	std	%g0,	[%l7 + 0x70]
	nop
	set	0x48, %g6
	stha	%i1,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x68, %g3
	swap	[%l7 + %g3],	%o7
	nop
	set	0x43, %l5
	ldub	[%l7 + %l5],	%l4
	ldstub	[%l7 + 0x5D],	%i4
	st	%f13,	[%l7 + 0x48]
	nop
	set	0x79, %o4
	ldstub	[%l7 + %o4],	%o0
	nop
	set	0x2C, %l3
	ldsh	[%l7 + %l3],	%g7
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o6
	std	%f0,	[%l7 + 0x68]
	sllx	%i7,	%o4,	%l1
	st	%f16,	[%l7 + 0x4C]
	ldstub	[%l7 + 0x54],	%o2
	movue	%fcc0,	%g2,	%l6
	std	%l4,	[%l7 + 0x78]
	stbar
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%o3
	edge8ln	%l3,	%i0,	%o5
	nop
	setx	0xAC737E10E07D5400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	nop
	set	0x7E, %i4
	ldsh	[%l7 + %i4],	%g3
	st	%f11,	[%l7 + 0x58]
	nop
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x04,	 4
	std	%g4,	[%l7 + 0x20]
	set	0x5C, %l2
	ldsha	[%l7 + %l2] 0x11,	%g6
	array32	%g5,	%o1,	%l2
	set	0x0E, %g5
	stba	%i2,	[%l7 + %g5] 0x89
	ldd	[%l7 + 0x40],	%i2
	nop
	set	0x40, %i1
	std	%f16,	[%l7 + %i1]
	swap	[%l7 + 0x70],	%i1
	sth	%i5,	[%l7 + 0x48]
	nop
	set	0x40, %g1
	std	%f30,	[%l7 + %g1]
	lduw	[%l7 + 0x58],	%l4
	orcc	%o7,	%o0,	%i4
	set	0x08, %l4
	stwa	%o6,	[%l7 + %l4] 0x0c
	addcc	%g7,	0x1991,	%i7
	ldsh	[%l7 + 0x14],	%o4
	sethi	0x1490,	%l1
	and	%o2,	%l6,	%g2
	nop
	set	0x78, %i0
	flush	%l7 + %i0
	popc	0x06F2,	%o3
	nop
	set	0x6C, %l0
	ldsw	[%l7 + %l0],	%l3
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l5
	nop
	set	0x43, %o1
	lduba	[%l7 + %o1] 0x8b,	%i0
	set	0x1F, %i6
	stba	%o5,	[%l7 + %i6] 0x22
	membar	#Sync
	nop
	setx	0x52E40DC6B0794C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	stw	%g3,	[%l7 + 0x1C]
	set	0x70, %o2
	ldswa	[%l7 + %o2] 0x81,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x8b,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g5
	wr	%g0,	0x81,	%asi
	sta	%f17,	[%l7 + 0x4C] %asi
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x11,	%o1,	%g4
	lduw	[%l7 + 0x74],	%i2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%l2
	ldsh	[%l7 + 0x3A],	%i6
	set	0x24, %o7
	ldsba	[%l7 + %o7] 0x19,	%i5
	edge16	%l4,	%o0,	%i4
	movule	%fcc2,	%o7,	%g7
	nop
	set	0x3C, %o5
	swap	[%l7 + %o5],	%i7
	nop
	set	0x48, %o6
	stha	%o4,	[%l7 + %o6] 0x04
	set	0x47, %o0
	ldsba	[%l7 + %o0] 0x82,	%l1
	move	%xcc,	0x2AC,	%o6
	set	0x1C, %l1
	lduwa	[%l7 + %l1] 0x0c,	%o2
	nop
	wr	%g0,	0x8b,	%asi
	ldswa	[%l7 + 0x18] %asi,	%g2
	nop
	set	0x6C, %g4
	flush	%l7 + %g4
	nop
	setx	0x504F2400,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o3,	%l3
	nop
	set	0x24, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x79, %l6
	ldsba	[%l7 + %l6] 0x89,	%l5
	ldd	[%l7 + 0x20],	%f20
	ldub	[%l7 + 0x11],	%i0
	set	0x74, %o3
	swapa	[%l7 + %o3] 0x18,	%l6
	st	%f28,	[%l7 + 0x48]
	sth	%o5,	[%l7 + 0x08]
	nop
	set	0x10, %i2
	sth	%g3,	[%l7 + %i2]
	nop
	set	0x40, %i5
	sth	%l0,	[%l7 + %i5]
	ldsh	[%l7 + 0x74],	%g5
	stw	%o1,	[%l7 + 0x60]
	nop
	wr	%g0,	0x8a,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g6
	nop
	set	0x28, %g6
	lduwa	[%l7 + %g6] 0x8b,	%g4
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x10,	%i3,	%l2
	ldstub	[%l7 + 0x30],	%i1
	sethi	0x0DA2,	%g1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc0
	prefetch	[%l7 + 0x44],	 4
	alignaddr	%i6,	%l4,	%i5
	ldd	[%l7 + 0x28],	%i4
	ld	[%l7 + 0x14],	%f10
	nop
	wr	%g0,	0x8a,	%asi
	lduha	[%l7 + 0x30] %asi,	%o7
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%o0
	set	0x50, %g3
	stda	%g6,	[%l7 + %g3] 0x23
	membar	#Sync
	set	0x70, %o4
	ldstuba	[%l7 + %o4] 0x04,	%o4
	movre	%l1,	%i7,	%o6
	nop
	set	0x10, %i3
	std	%o2,	[%l7 + %i3]
	nop
	set	0x74, %l3
	lduw	[%l7 + %l3],	%g2
	swap	[%l7 + 0x40],	%o3
	wr	%g0,	0x83,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 4
	nop
	set	0x10, %i4
	std	%l4,	[%l7 + %i4]
	ldstub	[%l7 + 0x65],	%i0
	nop
	set	0x1E, %i7
	ldsba	[%l7 + %i7] 0x88,	%l6
	stw	%g3,	[%l7 + 0x08]
	set	0x08, %l2
	lduwa	[%l7 + %l2] 0x83,	%l0
	sllx	%o5,	%o1,	%g6
	stw	%g4,	[%l7 + 0x54]
	ld	[%l7 + 0x28],	%f15
	wr	%g0,	0x83,	%asi
	swapa	[%l7 + 0x44] %asi,	%i2
	nop
	set	0x0C, %g5
	ldswa	[%l7 + %g5] 0x80,	%i3
	set	0x18, %g1
	stda	%l2,	[%l7 + %g1] 0x10
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x58] %asi,	%g5
	ldd	[%l7 + 0x40],	%i0
	prefetch	[%l7 + 0x20],	 1
	nop
	set	0x3C, %i1
	stwa	%g1,	[%l7 + %i1] 0x11
	nop
	set	0x47, %l4
	ldsb	[%l7 + %l4],	%i6
	ldub	[%l7 + 0x25],	%l4
	std	%i4,	[%l7 + 0x38]
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o7
	stw	%i4,	[%l7 + 0x24]
	stbar
	nop
	set	0x08, %l0
	stda	%o0,	[%l7 + %l0] 0x27
	membar	#Sync
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x26] %asi,	%g7
	or	%o4,	%i7,	%l1
	orn	%o2,	%g2,	%o3
	nop
	set	0x62, %i0
	ldub	[%l7 + %i0],	%l3
	ldub	[%l7 + 0x23],	%o6
	nop
	set	0x58, %i6
	stw	%l5,	[%l7 + %i6]
!!	wr	%g0,	0x3c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	ldd	[%l7 + 0x48],	%i0
	ldub	[%l7 + 0x09],	%g3
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%l0
	ldsh	[%l7 + 0x64],	%o5
	nop
	set	0x24, %o7
	sta	%f16,	[%l7 + %o7] 0x10
	nop
	set	0x20, %o1
	std	%i2,	[%l7 + %o1]
	set	0x40, %o5
	stxa	%i3,	[%l7 + %o5] 0x8b
	stx	%g6,	[%l7 + 0x08]
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g5
	nop
	setx	0x27F5784D104F3C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	ldd	[%l7 + 0x58],	%f6
	ld	[%l7 + 0x4C],	%f12
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%i1
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%g1,	[%l7 + 0x28] %asi
	membar	#Sync
	lduw	[%l7 + 0x6C],	%l2
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f20
	st	%f3,	[%l7 + 0x6C]
	nop
	set	0x5C, %l1
	stwa	%i6,	[%l7 + %l1] 0x0c
	nop
	set	0x0C, %o0
	ldsha	[%l7 + %o0] 0x89,	%i5
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%l4
	prefetch	[%l7 + 0x24],	 1
	ldsh	[%l7 + 0x5E],	%o7
	nop
	set	0x32, %g4
	stha	%i4,	[%l7 + %g4] 0x04
	nop
	set	0x52, %l6
	stb	%g7,	[%l7 + %l6]
	prefetch	[%l7 + 0x70],	 2
	nop
	setx	0x5452CDDB8058B800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	set	0x74, %o3
	ldswa	[%l7 + %o3] 0x89,	%o0
	nop
	set	0x10, %i2
	swap	[%l7 + %i2],	%o4
	lduw	[%l7 + 0x54],	%l1
	nop
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xeb,	%o2
	nop
	set	0x77, %i5
	ldstub	[%l7 + %i5],	%i7
	set	0x15, %g7
	ldsba	[%l7 + %g7] 0x81,	%o3
	st	%f1,	[%l7 + 0x58]
	std	%f12,	[%l7 + 0x70]
	nop
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%o6
	ld	[%l7 + 0x3C],	%f5
	nop
	setx	0x46BC6538D0579C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	lduw	[%l7 + 0x30],	%l5
	nop
	set	0x46, %o4
	ldsh	[%l7 + %o4],	%l6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	stbar
	nop
	setx	0x605F4800,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	sth	%l3,	[%l7 + 0x64]
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x34] %asi,	%g3
	stbar
	stw	%l0,	[%l7 + 0x28]
	swap	[%l7 + 0x18],	%i0
	nop
	wr	%g0,	0x11,	%asi
	stda	%o4,	[%l7 + 0x18] %asi
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%o1
	nop
	set	0x3C, %i3
	lduh	[%l7 + %i3],	%g6
	set	0x58, %g3
	ldstuba	[%l7 + %g3] 0x8a,	%i3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldstub	[%l7 + 0x51],	%g5
	movul	%fcc1,	%i1,	%g1
	wr	%g0,	0x82,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i6
	nop
	set	0x60, %i4
	ldsw	[%l7 + %i4],	%i5
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x89,	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x08, %l2
	stw	%g7,	[%l7 + %l2]
	lduw	[%l7 + 0x60],	%o0
	nop
	set	0x24, %g5
	ldsh	[%l7 + %g5],	%o7
	sra	%l1,	%o4,	%o2
	nop
	set	0x7C, %g1
	lduha	[%l7 + %g1] 0x88,	%o3
	nop
	set	0x1B, %l3
	stb	%i7,	[%l7 + %l3]
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g2
	stbar
	nop
	setx	0xB0771400,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ld	[%l7 + 0x58],	%f25
	wr	%g0,	0x8b,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o6
	std	%f22,	[%l7 + 0x20]
	ldstub	[%l7 + 0x71],	%l5
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x83,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x83,	%l3,	%l6
	nop
	set	0x7B, %i1
	ldub	[%l7 + %i1],	%g3
	set	0x74, %l4
	stba	%l0,	[%l7 + %l4] 0x83
	stbar
	stx	%i0,	[%l7 + 0x78]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcd
	stb	%g4,	[%l7 + 0x0B]
	nop
	set	0x2A, %l0
	lduh	[%l7 + %l0],	%i2
	ldd	[%l7 + 0x38],	%f0
	ldstub	[%l7 + 0x56],	%o5
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%o0
	lduh	[%l7 + 0x3C],	%g6
	nop
	set	0x3E, %i6
	ldsb	[%l7 + %i6],	%g5
	ldsh	[%l7 + 0x50],	%i3
	st	%f15,	[%l7 + 0x34]
	nop
	setx	0x5515491E9041A400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	nop
	set	0x48, %o1
	stw	%g1,	[%l7 + %o1]
	ldx	[%l7 + 0x20],	%i1
	stb	%i6,	[%l7 + 0x58]
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	ldd	[%l7 + 0x58],	%f28
	edge16l	%l2,	%i5,	%i4
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o0
	movug	%fcc0,	0x58D,	%o7
	ldsb	[%l7 + 0x1D],	%g7
	ldd	[%l7 + 0x38],	%o4
	ldstub	[%l7 + 0x2C],	%l1
	set	0x34, %o5
	lduwa	[%l7 + %o5] 0x88,	%o2
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x19,	%o3,	%i7
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f12
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%g2
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x81,	%o6
	stbar
	ldsh	[%l7 + 0x54],	%l3
	nop
	set	0x3A, %l1
	stha	%l5,	[%l7 + %l1] 0x80
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x0C, %o3
	flush	%l7 + %o3
	wr	%g0,	0x8a,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g3
	movlg	%fcc3,	0x3C8,	%l6
	nop
	set	0x2C, %g4
	flush	%l7 + %g4
	ldub	[%l7 + 0x18],	%i0
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x73] %asi,	%l0
	nop
	set	0x58, %i2
	ldsb	[%l7 + %i2],	%i2
	set	0x38, %i5
	stwa	%g4,	[%l7 + %i5] 0x2f
	membar	#Sync
	lduw	[%l7 + 0x0C],	%o1
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f18
	nop
	set	0x2C, %l5
	stw	%g6,	[%l7 + %l5]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x8b,	%f0
	nop
	set	0x14, %i3
	prefetch	[%l7 + %i3],	 0
	membar	0x46
	nop
	setx	0xE060B800,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	nop
	setx	0x1F585B8FA07C4C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	nop
	set	0x4A, %g6
	ldstub	[%l7 + %g6],	%o5
	nop
	setx	0xE0728800,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	lduh	[%l7 + 0x4A],	%g5
	std	%f20,	[%l7 + 0x18]
	movrgz	%g1,	%i3,	%i1
	nop
	set	0x08, %g3
	stb	%l4,	[%l7 + %g3]
	st	%f18,	[%l7 + 0x78]
	stw	%i6,	[%l7 + 0x44]
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x50, %i4
	ldswa	[%l7 + %i4] 0x83,	%i5
	st	%f31,	[%l7 + 0x24]
	ldsw	[%l7 + 0x74],	%i4
	nop
	setx	0x73B400,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	stb	%l2,	[%l7 + 0x74]
	nop
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x8a,	%o7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	0x88181F4ED0759800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ldd	[%l7 + 0x20],	%f22
	ldub	[%l7 + 0x25],	%g7
	prefetch	[%l7 + 0x44],	 4
	st	%f6,	[%l7 + 0x20]
	nop
	set	0x14, %g5
	swap	[%l7 + %g5],	%o4
	movn	%fcc3,	0x1EF,	%l1
	swap	[%l7 + 0x68],	%o2
	nop
	set	0x14, %g1
	ldub	[%l7 + %g1],	%o3
	stw	%o0,	[%l7 + 0x4C]
	st	%f5,	[%l7 + 0x70]
	nop
	wr	%g0,	0x8a,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i7
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%o6
	ld	[%l7 + 0x2C],	%f8
	nop
	set	0x20, %i1
	stwa	%g2,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%l3,	[%l7 + 0x30] %asi
	membar	#Sync
	std	%g2,	[%l7 + 0x68]
	ldub	[%l7 + 0x65],	%l6
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l5,	%i0
	ldub	[%l7 + 0x30],	%l0
	movue	%fcc0,	%g4,	%o1
	ld	[%l7 + 0x5C],	%f10
	stw	%i2,	[%l7 + 0x14]
	nop
	setx	0x5046B400,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	nop
	set	0x54, %l2
	lduh	[%l7 + %l2],	%g6
	stbar
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g5,	%g1
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x04,	 1
	movrlez	%i3,	%l4,	%i5
	edge8ln	%i4,	%l2,	%i6
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x82,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l1
	set	0x54, %l0
	lduwa	[%l7 + %l0] 0x82,	%o2
	nop
	set	0x70, %l4
	stw	%o4,	[%l7 + %l4]
	lduw	[%l7 + 0x40],	%o3
	nop
	set	0x1C, %o2
	flush	%l7 + %o2
	movcc	%icc,	0x2BA,	%o0
	st	%f19,	[%l7 + 0x48]
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x10] %asi,	%f0
	nop
	set	0x40, %o1
	stx	%i7,	[%l7 + %o1]
	set	0x72, %i6
	ldsba	[%l7 + %i6] 0x8b,	%g2
	set	0x6E, %o5
	lduha	[%l7 + %o5] 0x19,	%l3
	ldx	[%l7 + 0x08],	%g3
	ldx	[%l7 + 0x78],	%o6
	stb	%l6,	[%l7 + 0x1F]
	nop
	set	0x0E, %o6
	ldsha	[%l7 + %o6] 0x10,	%i0
	stb	%l5,	[%l7 + 0x43]
	swap	[%l7 + 0x18],	%l0
	ldd	[%l7 + 0x10],	%f4
	nop
	set	0x70, %o0
	lduw	[%l7 + %o0],	%o1
	set	0x18, %o7
	stda	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	flush	%l7 + 0x1C
	wr	%g0,	0x04,	%asi
	sta	%f27,	[%l7 + 0x64] %asi
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%g6
	nop
	set	0x47, %l6
	ldsb	[%l7 + %l6],	%g5
	stbar
	nop
	set	0x79, %o3
	ldsb	[%l7 + %o3],	%g1
	lduh	[%l7 + 0x54],	%g4
	nop
	set	0x28, %g4
	ldsh	[%l7 + %g4],	%i1
	lduh	[%l7 + 0x38],	%o5
	lduw	[%l7 + 0x70],	%l4
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%i3
	nop
	set	0x30, %i2
	stw	%i5,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	stw	%l2,	[%l7 + 0x2C]
	smulcc	%i6,	%i4,	%o7
	ldstub	[%l7 + 0x6A],	%l1
	lduh	[%l7 + 0x66],	%o2
	nop
	set	0x0C, %i5
	flush	%l7 + %i5
	edge16n	%o4,	%o3,	%o0
	lduw	[%l7 + 0x24],	%i7
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x8b,	%asi
	casa	[%l6] %asi,	%g7,	%g3
	sub	%o6,	0x06E5,	%l6
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f12
	nop
	set	0x4C, %o4
	sth	%i0,	[%l7 + %o4]
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f2
	nop
	set	0x2B, %g3
	stb	%l5,	[%l7 + %g3]
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%l3
	nop
	set	0x74, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x62, %g5
	lduha	[%l7 + %g5] 0x8b,	%o1
	nop
	set	0x59, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%l0
	nop
	set	0x47, %l3
	ldstub	[%l7 + %l3],	%i2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g6
	nop
	set	0x60, %i1
	std	%g4,	[%l7 + %i1]
	set	0x1C, %l2
	sta	%f6,	[%l7 + %l2] 0x10
	ldd	[%l7 + 0x20],	%f10
	nop
	set	0x3B, %g1
	ldstub	[%l7 + %g1],	%i1
	wr	%g0,	0x11,	%asi
	stxa	%o5,	[%l7 + 0x60] %asi
	nop
	set	0x3C, %l0
	lduw	[%l7 + %l0],	%g1
	std	%i2,	[%l7 + 0x20]
	nop
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x8a,	%i5
	ldstub	[%l7 + 0x2A],	%l2
	ldd	[%l7 + 0x50],	%f10
	nop
	set	0x30, %i0
	lduha	[%l7 + %i0] 0x81,	%i6
	ldsb	[%l7 + 0x72],	%l4
	movcc	%xcc,	0x4AD,	%i4
	nop
	set	0x38, %o2
	lduh	[%l7 + %o2],	%o7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x18,	%o2,	%o4
	and	%l1,	%o0,	%i7
	flush	%l7 + 0x3C
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x28] %asi,	%o3
	set	0x0C, %i6
	lduwa	[%l7 + %i6] 0x8a,	%g7
	st	%f31,	[%l7 + 0x50]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g2
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x04,	%g3
	stw	%l6,	[%l7 + 0x0C]
	nop
	setx	0x907F8C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	bmask	%i0,	%l5,	%l3
	ldsh	[%l7 + 0x30],	%o6
	wr	%g0,	0x0c,	%asi
	stxa	%l0,	[%l7 + 0x70] %asi
	nop
	set	0x48, %o5
	std	%o0,	[%l7 + %o5]
	nop
	set	0x10, %o0
	flush	%l7 + %o0
	nop
	setx	0xA0630000,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	sth	%i2,	[%l7 + 0x20]
	prefetch	[%l7 + 0x30],	 3
	nop
	wr	%g0,	0x83,	%asi
	stba	%g5,	[%l7 + 0x09] %asi
	ldub	[%l7 + 0x52],	%g6
	subccc	%g4,	%o5,	%i1
	subccc	%i3,	%i5,	%l2
	nop
	set	0x40, %o7
	std	%f20,	[%l7 + %o7]
	alignaddrl	%g1,	%i6,	%l4
	array8	%i4,	%o7,	%o4
	nop
	wr	%g0,	0x11,	%asi
	sta	%f6,	[%l7 + 0x1C] %asi
	ldx	[%l7 + 0x68],	%o2
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%l1
	nop
	set	0x78, %g2
	prefetch	[%l7 + %g2],	 1
	ldstub	[%l7 + 0x5A],	%i7
	swap	[%l7 + 0x2C],	%o0
	movre	%g7,	%o3,	%g2
	movlg	%fcc1,	%g3,	%i0
	ldx	[%l7 + 0x58],	%l5
	stb	%l3,	[%l7 + 0x30]
	stb	%l6,	[%l7 + 0x26]
	nop
	set	0x5A, %l6
	stb	%l0,	[%l7 + %l6]
	nop
	set	0x5A, %o3
	sth	%o6,	[%l7 + %o3]
	set	0x11, %l1
	lduba	[%l7 + %l1] 0x04,	%i2
	nop
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0x0c
	nop
	set	0x10, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x70, %i5
	lduh	[%l7 + %i5],	%g6
	std	%f12,	[%l7 + 0x38]
	nop
	set	0x78, %g7
	ldsw	[%l7 + %g7],	%o1
	nop
	set	0x40, %l5
	ldsw	[%l7 + %l5],	%o5
	wr	%g0,	0xeb,	%asi
	stba	%i1,	[%l7 + 0x56] %asi
	membar	#Sync
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	sth	%i3,	[%l7 + 0x1A]
	nop
	set	0x4C, %g3
	sth	%i5,	[%l7 + %g3]
	ldsw	[%l7 + 0x70],	%l2
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g1,	%l4
	nop
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%i4
	set	0x66, %o4
	stha	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
	stx	%o4,	[%l7 + 0x68]
	ld	[%l7 + 0x08],	%f13
	nop
	set	0x75, %i7
	stb	%o7,	[%l7 + %i7]
	set	0x58, %g5
	stxa	%o2,	[%l7 + %g5] 0x19
	st	%f7,	[%l7 + 0x20]
	stbar
	nop
	set	0x68, %i4
	std	%i6,	[%l7 + %i4]
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc3
	nop
	set	0x7C, %i1
	sth	%l1,	[%l7 + %i1]
	lduh	[%l7 + 0x32],	%o3
	ldsw	[%l7 + 0x74],	%g7
	nop
	set	0x1D, %i3
	ldstub	[%l7 + %i3],	%g2
	ld	[%l7 + 0x2C],	%f0
	nop
	set	0x48, %g1
	lduh	[%l7 + %g1],	%g3
	stw	%l5,	[%l7 + 0x08]
	nop
	setx	0xE07F8800,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	nop
	wr	%g0,	0x83,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%l3,	0x16CB,	%l6
	bmask	%l0,	%i0,	%o6
	nop
	setx	0x507A0C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	wr	%g0,	0xe3,	%asi
	stwa	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 0
	wr	%g0,	0x82,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%g6
	ldub	[%l7 + 0x22],	%g5
	ldsw	[%l7 + 0x08],	%o5
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i1
	xor	%g4,	%i3,	%o1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i5
	nop
	wr	%g0,	0x83,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 3
	std	%g0,	[%l7 + 0x48]
	flush	%l7 + 0x2C
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l4
	flush	%l7 + 0x78
	ldsw	[%l7 + 0x28],	%i6
	ldd	[%l7 + 0x60],	%o4
	nop
	wr	%g0,	0x83,	%asi
	stha	%o7,	[%l7 + 0x08] %asi
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x0C] %asi,	%f30
	set	0x5B, %l0
	ldsba	[%l7 + %l0] 0x81,	%i4
	set	0x2B, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o2
	ldub	[%l7 + 0x31],	%o0
	st	%f22,	[%l7 + 0x7C]
	stbar
	stbar
	nop
	wr	%g0,	0x19,	%asi
	sta	%f2,	[%l7 + 0x1C] %asi
	stbar
	flush	%l7 + 0x50
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%l1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x78, %o2
	sth	%i7,	[%l7 + %o2]
	set	0x2C, %o1
	sta	%f9,	[%l7 + %o1] 0x8a
	edge32	%g7,	%o3,	%g2
	lduw	[%l7 + 0x2C],	%l5
	std	%g2,	[%l7 + 0x58]
	stb	%l3,	[%l7 + 0x3F]
	nop
	setx	0x7780916140462400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x72] %asi,	%l6
	nop
	setx	0x429CE98F40535400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	lduw	[%l7 + 0x68],	%i0
	nop
	setx	0xD9E37633B06E4400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	umulcc	%o6,	%i2,	%l0
	stx	%g6,	[%l7 + 0x58]
	nop
	set	0x56, %o6
	ldsh	[%l7 + %o6],	%g5
	nop
	set	0x2C, %o5
	ldsha	[%l7 + %o5] 0x82,	%i1
	nop
	set	0x68, %i6
	swap	[%l7 + %i6],	%o5
	nop
	set	0x28, %o7
	swap	[%l7 + %o7],	%g4
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%o1
	nop
	setx	0x4154BE0430724400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	lduw	[%l7 + 0x70],	%i3
	set	0x52, %g2
	stba	%i5,	[%l7 + %g2] 0x22
	membar	#Sync
	std	%f2,	[%l7 + 0x18]
	stx	%l2,	[%l7 + 0x50]
	nop
	set	0x2C, %o0
	stha	%g1,	[%l7 + %o0] 0x8b
	nop
	setx	0x8B3C618F407A9000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x78, %o3
	std	%i6,	[%l7 + %o3]
	addc	%l4,	0x10A5,	%o7
	wr	%g0,	0x2a,	%asi
	stba	%o4,	[%l7 + 0x66] %asi
	membar	#Sync
	movne	%fcc1,	%o2,	%o0
	st	%f17,	[%l7 + 0x0C]
	wr	%g0,	0x82,	%asi
	stba	%i4,	[%l7 + 0x3F] %asi
	set	0x6C, %l6
	lduba	[%l7 + %l6] 0x18,	%i7
	nop
	set	0x08, %l1
	swap	[%l7 + %l1],	%l1
	nop
	set	0x3E, %g4
	ldub	[%l7 + %g4],	%g7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%l5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc0
	nop
	setx	0x582800,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x44] %asi,	%g2
	nop
	set	0x38, %i2
	std	%f12,	[%l7 + %i2]
	wr	%g0,	0x8b,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%g3
	movvc	%xcc,	%l6,	%i0
	swap	[%l7 + 0x30],	%o6
	nop
	set	0x6C, %l5
	swap	[%l7 + %l5],	%i2
	nop
	setx	0x3BB817CAE0711000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	nop
	set	0x64, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l3
	nop
	setx	0xCEE6284D40488800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%g6
	addc	%l0,	0x0B2A,	%g5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%i1
	std	%f4,	[%l7 + 0x30]
	nop
	set	0x32, %o4
	ldsh	[%l7 + %o4],	%g4
	nop
	set	0x3C, %g7
	stw	%o5,	[%l7 + %g7]
	nop
	set	0x63, %g5
	ldstub	[%l7 + %g5],	%i3
	swap	[%l7 + 0x3C],	%i5
	nop
	set	0x44, %i4
	lduh	[%l7 + %i4],	%l2
	nop
	set	0x48, %l3
	std	%f30,	[%l7 + %l3]
	prefetch	[%l7 + 0x3C],	 1
	flush	%l7 + 0x10
	movul	%fcc0,	0x7A4,	%g1
	wr	%g0,	0x23,	%asi
	stba	%o1,	[%l7 + 0x32] %asi
	membar	#Sync
	ldx	[%l7 + 0x10],	%l4
	wr	%g0,	0x11,	%asi
	stba	%o7,	[%l7 + 0x4D] %asi
	nop
	setx	0xC2775694105AA800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	st	%f18,	[%l7 + 0x2C]
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x36] %asi,	%o4
	wr	%g0,	0x82,	%asi
	stwa	%i6,	[%l7 + 0x78] %asi
	std	%o0,	[%l7 + 0x38]
	ldd	[%l7 + 0x48],	%f8
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x1C, %i7
	lduwa	[%l7 + %i7] 0x11,	%o2
	nop
	set	0x3C, %i1
	ldsw	[%l7 + %i1],	%i4
	andn	%i7,	%g7,	%l1
	nop
	set	0x62, %i3
	ldsha	[%l7 + %i3] 0x80,	%l5
	nop
	set	0x28, %g1
	ldsw	[%l7 + %g1],	%o3
	stbar
	movrlez	%g3,	%g2,	%l6
	nop
	set	0x18, %l2
	std	%f6,	[%l7 + %l2]
	set	0x6C, %l0
	lduwa	[%l7 + %l0] 0x8b,	%i0
	lduh	[%l7 + 0x10],	%i2
	lduw	[%l7 + 0x20],	%o6
	ld	[%l7 + 0x64],	%f25
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%l3
	orcc	%l0,	0x0862,	%g6
	nop
	set	0x48, %o2
	stw	%i1,	[%l7 + %o2]
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x18] %asi
	sth	%g4,	[%l7 + 0x36]
	nop
	set	0x60, %o1
	flush	%l7 + %o1
	nop
	set	0x20, %l4
	stx	%l4,	[%l7 + %l4]
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%o4
	set	0x71, %o6
	ldsba	[%l7 + %o6] 0x89,	%i6
	ldd	[%l7 + 0x40],	%o0
	ld	[%l7 + 0x44],	%f22
	st	%f11,	[%l7 + 0x44]
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x60] %asi,	%o7
	edge32	%i4,	%o2,	%i7
	nop
	set	0x4C, %i6
	stwa	%l1,	[%l7 + %i6] 0x81
	wr	%g0,	0xeb,	%asi
	stba	%l5,	[%l7 + 0x10] %asi
	membar	#Sync
	std	%f6,	[%l7 + 0x20]
	wr	%g0,	0x2f,	%asi
	stda	%g6,	[%l7 + 0x18] %asi
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd9,	%f16
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	set	0x10, %o3
	ldsba	[%l7 + %o3] 0x8b,	%g3
	nop
	set	0x36, %l6
	lduh	[%l7 + %l6],	%g2
	nop
	set	0x29, %l1
	ldub	[%l7 + %l1],	%l6
	st	%f10,	[%l7 + 0x7C]
	stbar
	nop
	set	0x3C, %o7
	ldsb	[%l7 + %o7],	%i2
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f30
	set	0x48, %i5
	stda	%i0,	[%l7 + %i5] 0x22
	membar	#Sync
	nop
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x8a,	%l3
	prefetch	[%l7 + 0x68],	 3
	nop
	set	0x4E, %l5
	lduh	[%l7 + %l5],	%l0
	nop
	set	0x50, %g6
	std	%g6,	[%l7 + %g6]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g5
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x74] %asi,	%g4
	ld	[%l7 + 0x3C],	%f10
	st	%f22,	[%l7 + 0x14]
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x3C, %g3
	stwa	%i5,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x50, %g7
	stw	%l2,	[%l7 + %g7]
	ldx	[%l7 + 0x50],	%g1
	andn	%o1,	%o5,	%l4
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o4
	nop
	set	0x70, %i4
	std	%o0,	[%l7 + %i4]
	ld	[%l7 + 0x60],	%f7
	prefetch	[%l7 + 0x2C],	 0
	nop
	setx	0x35FD49FEB0787000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x37] %asi,	%i6
	nop
	set	0x10, %l3
	std	%i4,	[%l7 + %l3]
	nop
	setx	0x655C1CD7E06D8800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	add	%l7,	0x40,	%l6
	wr	%g0,	0x8a,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x8a,	%o7,	%o2
	nop
	set	0x68, %i7
	stb	%l1,	[%l7 + %i7]
	stbar
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x83,	%i7
	ld	[%l7 + 0x14],	%f11
	swap	[%l7 + 0x08],	%g7
	edge16n	%l5,	%g3,	%o3
	lduw	[%l7 + 0x08],	%l6
	st	%f8,	[%l7 + 0x78]
	lduh	[%l7 + 0x3C],	%i2
	nop
	set	0x0F, %i1
	ldsb	[%l7 + %i1],	%i0
	stw	%g2,	[%l7 + 0x34]
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x8b,	%l3
	ldsb	[%l7 + 0x39],	%g6
	stx	%l0,	[%l7 + 0x08]
	ldd	[%l7 + 0x28],	%f10
	nop
	set	0x71, %l2
	ldstub	[%l7 + %l2],	%g5
	set	0x08, %l0
	stda	%i0,	[%l7 + %l0] 0x2b
	membar	#Sync
	nop
	set	0x14, %i0
	swapa	[%l7 + %i0] 0x82,	%i3
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x19,	%g4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i5
	st	%f0,	[%l7 + 0x30]
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x2f,	%o6
	st	%f15,	[%l7 + 0x68]
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x5F, %o1
	ldsb	[%l7 + %o1],	%g1
	nop
	setx	0x10659C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	ldd	[%l7 + 0x58],	%f30
	stx	%l2,	[%l7 + 0x28]
	std	%f4,	[%l7 + 0x50]
	nop
	set	0x63, %o5
	stb	%o1,	[%l7 + %o5]
	nop
	set	0x4E, %l4
	ldsh	[%l7 + %l4],	%o5
	nop
	setx	0x40512400,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	lduh	[%l7 + 0x74],	%l4
	set	0x54, %o6
	ldswa	[%l7 + %o6] 0x82,	%o0
	ldd	[%l7 + 0x58],	%f22
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%i6
	nop
	set	0x48, %o0
	flush	%l7 + %o0
	srlx	%o4,	0x11,	%o7
	set	0x6F, %o3
	stba	%i4,	[%l7 + %o3] 0x82
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x8b,	%asi
	casa	[%l6] 0x8b,	%l1,	%o2
	set	0x78, %l6
	lda	[%l7 + %l6] 0x80,	%f4
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%g6
	sth	%l5,	[%l7 + 0x6A]
	ld	[%l7 + 0x64],	%f18
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%g3
	wr	%g0,	0xe3,	%asi
	stwa	%i7,	[%l7 + 0x60] %asi
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%i2
	sub	%i0,	%l6,	%l3
	nop
	set	0x50, %l1
	stx	%g2,	[%l7 + %l1]
	set	0x1C, %g4
	sta	%f7,	[%l7 + %g4] 0x8b
	nop
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd1
	nop
	set	0x0C, %i5
	ldsh	[%l7 + %i5],	%l0
	std	%g6,	[%l7 + 0x10]
	nop
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x8b,	%g4
	nop
	set	0x56, %g3
	ldsh	[%l7 + %g3],	%i3
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x18] %asi,	%f7
	nop
	wr	%g0,	0x83,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i1
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%g4
	nop
	set	0x3C, %g7
	flush	%l7 + %g7
	st	%f31,	[%l7 + 0x0C]
	ldx	[%l7 + 0x68],	%i5
	nop
	set	0x2C, %i4
	ldsh	[%l7 + %i4],	%o6
	nop
	set	0x38, %l5
	stx	%l2,	[%l7 + %l5]
	nop
	set	0x30, %i7
	stda	%o0,	[%l7 + %i7] 0x2a
	membar	#Sync
	nop
	set	0x54, %g5
	stw	%o5,	[%l7 + %g5]
	stx	%l4,	[%l7 + 0x78]
	nop
	set	0x40, %i1
	std	%f14,	[%l7 + %i1]
	stbar
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f6
	nop
	set	0x18, %l3
	stx	%g1,	[%l7 + %l3]
	st	%f30,	[%l7 + 0x28]
	stx	%o0,	[%l7 + 0x20]
	orn	%o4,	%i6,	%o7
	ld	[%l7 + 0x68],	%f5
	ldsb	[%l7 + 0x69],	%l1
	ldsw	[%l7 + 0x08],	%o2
	nop
	set	0x54, %l0
	ldswa	[%l7 + %l0] 0x81,	%g7
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%l5
	movl	%icc,	%i4,	%g3
	nop
	set	0x39, %o2
	ldub	[%l7 + %o2],	%o3
	nop
	setx	0x9A9F0BFFE0605800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldx	[%l7 + 0x50],	%i2
	nop
	wr	%g0,	0x83,	%asi
	lduba	[%l7 + 0x08] %asi,	%i0
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%i7
	nop
	set	0x48, %o1
	stx	%l6,	[%l7 + %o1]
	nop
	setx	0xF0465000,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	subccc	%g2,	%l0,	%g6
	nop
	setx	0x595000,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%l3
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g5
	mova	%fcc1,	%g4,	%i1
	st	%f12,	[%l7 + 0x24]
	ldsh	[%l7 + 0x38],	%o6
	set	0x40, %o5
	sta	%f14,	[%l7 + %o5] 0x10
	ld	[%l7 + 0x5C],	%f1
	sth	%l2,	[%l7 + 0x60]
	movpos	%icc,	%i5,	%o1
	smulcc	%o5,	%g1,	%l4
	st	%f29,	[%l7 + 0x60]
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	membar	0x5E
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f12
	ldsb	[%l7 + 0x59],	%o0
	stb	%i6,	[%l7 + 0x36]
	nop
	set	0x46, %o6
	ldsb	[%l7 + %o6],	%o7
	swap	[%l7 + 0x10],	%l1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o2
	ldd	[%l7 + 0x70],	%g6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	addccc	%o4,	%g3,	%o3
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%i2
	umul	%i4,	0x1EAD,	%i0
	wr	%g0,	0x83,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i7
	nop
	set	0x78, %o0
	std	%f20,	[%l7 + %o0]
	nop
	set	0x38, %i0
	ldx	[%l7 + %i0],	%l6
	ldd	[%l7 + 0x10],	%g2
	nop
	set	0x08, %o3
	std	%f8,	[%l7 + %o3]
	nop
	set	0x7E, %l6
	sth	%g6,	[%l7 + %l6]
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%l0
	stbar
	stbar
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	setx	0xF0614000,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	ld	[%l7 + 0x28],	%f31
	nop
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x82,	%i3
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%l3
	nop
	set	0x48, %i2
	std	%g4,	[%l7 + %i2]
	nop
	setx	0x842E1A15105AA400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%g5
	mova	%icc,	0x394,	%o6
	nop
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x74] %asi
	nop
	set	0x1D, %i5
	ldstuba	[%l7 + %i5] 0x82,	%l2
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f16
	movg	%xcc,	%i5,	%o1
	nop
	set	0x28, %o4
	sth	%i1,	[%l7 + %o4]
	stw	%o5,	[%l7 + 0x28]
	nop
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x81,	%g1
	nop
	set	0x22, %i4
	sth	%l4,	[%l7 + %i4]
	set	0x08, %g7
	stda	%o0,	[%l7 + %g7] 0x88
	ldub	[%l7 + 0x39],	%o7
	nop
	set	0x78, %i7
	std	%i6,	[%l7 + %i7]
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o2
	nop
	setx	0xC07A8000,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	nop
	set	0x68, %g5
	std	%f16,	[%l7 + %g5]
	ld	[%l7 + 0x4C],	%f26
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%g7
	edge8	%o4,	%l5,	%g3
	nop
	setx	0x96F8986A70416800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movlg	%fcc3,	%i2,	%i4
	nop
	set	0x60, %i1
	ldstuba	[%l7 + %i1] 0x18,	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x8a,	%asi
	casa	[%l6] 0x8a,	%o3,	%l6
	sllx	%g2,	%g6,	%i7
	lduh	[%l7 + 0x2C],	%l0
	nop
	wr	%g0,	0x82,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%i3
	nop
	set	0x70, %i3
	sta	%f21,	[%l7 + %i3] 0x18
	ldstub	[%l7 + 0x18],	%l3
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x82,	 3
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%l2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x16,	%f0
	ldstub	[%l7 + 0x20],	%g4
	sub	%o1,	0x1B63,	%i1
!!	wr	%g0,	0x3c,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	lduw	[%l7 + 0x5C],	%i5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0
	nop
	set	0x58, %l2
	stxa	%g1,	[%l7 + %l2] 0x2a
	membar	#Sync
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%o0
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 3
	wr	%g0,	0x2a,	%asi
	stwa	%o7,	[%l7 + 0x50] %asi
	membar	#Sync
	nop
	setx	0x204F8400,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x8b,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o2
	nop
	set	0x64, %o5
	stw	%g7,	[%l7 + %o5]
	stx	%l1,	[%l7 + 0x78]
	set	0x54, %o2
	lduwa	[%l7 + %o2] 0x10,	%o4
	nop
	set	0x3A, %o6
	stha	%g3,	[%l7 + %o6] 0x80
	wr	%g0,	0x8b,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i2
	stbar
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f8
	flush	%l7 + 0x68
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%l4
	stb	%i4,	[%l7 + 0x2E]
	wr	%g0,	0x2a,	%asi
	stba	%o3,	[%l7 + 0x17] %asi
	membar	#Sync
	flush	%l7 + 0x74
	nop
	set	0x70, %g2
	std	%f28,	[%l7 + %g2]
	nop
	set	0x30, %i0
	flush	%l7 + %i0
	ldsb	[%l7 + 0x1A],	%l6
	set	0x54, %l6
	lduha	[%l7 + %l6] 0x89,	%i0
	nop
	set	0x3A, %o3
	ldstuba	[%l7 + %o3] 0x19,	%g2
	nop
	set	0x78, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%g6
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i7,	%l0
	mova	%xcc,	%i3,	%g5
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x57] %asi,	%o6
	wr	%g0,	0x82,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%l2
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%g4
	nop
	set	0x68, %i2
	lduw	[%l7 + %i2],	%l3
	set	0x34, %l1
	stba	%i1,	[%l7 + %l1] 0x22
	membar	#Sync
	prefetch	[%l7 + 0x14],	 4
	nop
	set	0x7A, %g3
	sth	%o1,	[%l7 + %g3]
	wr	%g0,	0x2a,	%asi
	stxa	%i5,	[%l7 + 0x20] %asi
	membar	#Sync
	wr	%g0,	0x8a,	%asi
	lda	[%l7 + 0x10] %asi,	%f29
	prefetch	[%l7 + 0x54],	 1
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x23,	%o4
	nop
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x8b,	%l4
	nop
	setx	0x60673000,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	nop
	set	0x08, %g6
	std	%g0,	[%l7 + %g6]
	nop
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x32] %asi
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%o0
	ld	[%l7 + 0x58],	%f0
	nop
	set	0x78, %i4
	ldsha	[%l7 + %i4] 0x89,	%i6
	nop
	set	0x14, %i7
	ldswa	[%l7 + %i7] 0x89,	%g7
	nop
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x8b,	%l1
	nop
	setx	0x306D8000,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	nop
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	xnor	%o2,	0x16A0,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%o4
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l5
	nop
	set	0x2C, %i1
	swap	[%l7 + %i1],	%i2
	lduw	[%l7 + 0x58],	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%i0
	wr	%g0,	0x82,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i4
	movpos	%xcc,	0x564,	%g2
	prefetch	[%l7 + 0x10],	 0
	stx	%i7,	[%l7 + 0x70]
	std	%f10,	[%l7 + 0x40]
	set	0x2E, %l3
	ldsha	[%l7 + %l3] 0x04,	%g6
	nop
	set	0x49, %i3
	ldsb	[%l7 + %i3],	%i3
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%l0
	sth	%o6,	[%l7 + 0x38]
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%g5
	nop
	set	0x70, %l0
	ldsha	[%l7 + %l0] 0x0c,	%g4
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f28
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x10,	%l3,	%o1
	stw	%i5,	[%l7 + 0x44]
	nop
	set	0x28, %o1
	std	%i0,	[%l7 + %o1]
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l4
	nop
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x5C] %asi
	nop
	set	0x24, %o2
	stw	%g1,	[%l7 + %o2]
	stx	%o5,	[%l7 + 0x50]
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%o0
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	prefetch	[%l7 + 0x2C],	 4
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x70] %asi
	ldstub	[%l7 + 0x2F],	%o7
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 2
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x11,	 1
	nop
	wr	%g0,	0x8a,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g7
	wr	%g0,	0x8a,	%asi
	sta	%f2,	[%l7 + 0x58] %asi
	std	%f26,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l1
	prefetch	[%l7 + 0x2C],	 4
	wr	%g0,	0x0c,	%asi
	stwa	%o2,	[%l7 + 0x0C] %asi
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	ld	[%l7 + 0x2C],	%f0
	stw	%l5,	[%l7 + 0x38]
	set	0x13, %o0
	ldsba	[%l7 + %o0] 0x0c,	%i2
	nop
	set	0x44, %i0
	lduw	[%l7 + %i0],	%o3
	nop
	set	0x58, %l6
	swap	[%l7 + %l6],	%l6
	ldd	[%l7 + 0x78],	%i0
	nop
	set	0x2C, %o7
	stwa	%g3,	[%l7 + %o7] 0x82
	nop
	set	0x30, %g4
	std	%f20,	[%l7 + %g4]
	or	%i4,	%g2,	%g6
	wr	%g0,	0x27,	%asi
	stxa	%i3,	[%l7 + 0x18] %asi
	membar	#Sync
	stb	%l0,	[%l7 + 0x39]
	sll	%i7,	0x0E,	%g5
	wr	%g0,	0x04,	%asi
	stha	%g4,	[%l7 + 0x16] %asi
	wr	%g0,	0x82,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%l2
	stx	%l3,	[%l7 + 0x58]
	nop
	setx	0x2EB7E03EE06F5C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	alignaddr	%o6,	%o1,	%i5
	ld	[%l7 + 0x1C],	%f0
	nop
	set	0x68, %o3
	lduh	[%l7 + %o3],	%o5
	std	%o0,	[%l7 + 0x28]
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f14
	ld	[%l7 + 0x4C],	%f11
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x18] %asi,	%o7
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 2
	nop
	set	0x18, %i2
	std	%f20,	[%l7 + %i2]
	set	0x60, %g3
	stwa	%i6,	[%l7 + %g3] 0x82
	nop
	setx	0x30668000,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	wr	%g0,	0xe2,	%asi
	stba	%l1,	[%l7 + 0x22] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 4
	nop
	setx	0x9C32B0C930655C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	set	0x6C, %i5
	stw	%l5,	[%l7 + %i5]
	wr	%g0,	0xd3,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	set	0x12, %l1
	lduha	[%l7 + %l1] 0x19,	%o3
	nop
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	sethi	0x1990,	%i0
	stx	%g3,	[%l7 + 0x28]
	lduh	[%l7 + 0x4A],	%i4
	nop
	set	0x6A, %g7
	ldsb	[%l7 + %g7],	%g6
	swap	[%l7 + 0x44],	%g2
	stw	%l0,	[%l7 + 0x14]
	nop
	set	0x18, %o4
	prefetch	[%l7 + %o4],	 4
	ldub	[%l7 + 0x79],	%g4
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i7
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x11,	 2
	nop
	set	0x28, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x30, %g5
	flush	%l7 + %g5
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 3
	nop
	set	0x3D, %l3
	ldstub	[%l7 + %l3],	%o1
	set	0x48, %i3
	lduha	[%l7 + %i3] 0x8a,	%i5
	nop
	set	0x2C, %l2
	lduba	[%l7 + %l2] 0x04,	%i1
	ldd	[%l7 + 0x68],	%l4
	swap	[%l7 + 0x58],	%o5
	ld	[%l7 + 0x6C],	%f20
	nop
	set	0x6C, %i1
	swap	[%l7 + %i1],	%o0
	stw	%o7,	[%l7 + 0x08]
	st	%f23,	[%l7 + 0x08]
	movne	%icc,	%i6,	%g1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%l1
	nop
	set	0x30, %l0
	swap	[%l7 + %l0],	%g7
	nop
	set	0x58, %o1
	std	%o2,	[%l7 + %o1]
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ld	[%l7 + 0x10],	%f0
	ldstub	[%l7 + 0x51],	%o4
	prefetch	[%l7 + 0x24],	 2
	nop
	wr	%g0,	0x19,	%asi
	stda	%i2,	[%l7 + 0x20] %asi
	nop
	wr	%g0,	0x8b,	%asi
	stda	%o2,	[%l7 + 0x78] %asi
	nop
	set	0x7E, %g1
	sth	%l5,	[%l7 + %g1]
	std	%f6,	[%l7 + 0x18]
	nop
	set	0x50, %o2
	flush	%l7 + %o2
	ldstub	[%l7 + 0x6E],	%i0
	nop
	setx	0x3A826624106A9400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movrgez	%l6,	0x06E,	%i4
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%g6,	[%l7 + 0x10] %asi
	membar	#Sync
	ld	[%l7 + 0x20],	%f8
	nop
	set	0x68, %o5
	stw	%g3,	[%l7 + %o5]
	movne	%icc,	%g2,	%i3
	ldsh	[%l7 + 0x72],	%g5
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x1f,	%f16
	ldd	[%l7 + 0x48],	%g4
	set	0x78, %g2
	stxa	%l0,	[%l7 + %g2] 0x82
	or	%i7,	0x06EC,	%l2
	std	%l2,	[%l7 + 0x60]
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%o6
	nop
	wr	%g0,	0x82,	%asi
	lduba	[%l7 + 0x49] %asi,	%i5
	orncc	%i1,	%l4,	%o1
	ldx	[%l7 + 0x10],	%o0
	lduh	[%l7 + 0x66],	%o7
	nop
	set	0x52, %o0
	ldsh	[%l7 + %o0],	%i6
	prefetch	[%l7 + 0x28],	 0
	stw	%g1,	[%l7 + 0x30]
	nop
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x10,	%f24
	ldx	[%l7 + 0x68],	%o5
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l1,	%g7
	nop
	set	0x08, %o7
	ldsh	[%l7 + %o7],	%o2
	st	%f9,	[%l7 + 0x6C]
	nop
	set	0x5A, %l6
	lduh	[%l7 + %l6],	%o4
	wr	%g0,	0x23,	%asi
	stda	%i2,	[%l7 + 0x38] %asi
	membar	#Sync
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2C] %asi,	%l5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%i0
	nop
	set	0x68, %o3
	ldswa	[%l7 + %o3] 0x8b,	%o3
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	nop
	set	0x29, %i6
	stba	%g6,	[%l7 + %i6] 0x89
	st	%f29,	[%l7 + 0x60]
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%g3
	lduh	[%l7 + 0x7C],	%i4
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x13] %asi,	%i3
	nop
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x8a,	 3
	swap	[%l7 + 0x7C],	%g4
	nop
	setx	0xE05B2800,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	ld	[%l7 + 0x7C],	%f30
	nop
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	set	0x34, %i2
	swapa	[%l7 + %i2] 0x80,	%l0
	nop
	set	0x30, %l1
	stw	%i7,	[%l7 + %l1]
	nop
	set	0x58, %g7
	stda	%g4,	[%l7 + %g7] 0x04
	nop
	set	0x08, %o4
	ldub	[%l7 + %o4],	%l2
	nop
	set	0x20, %i4
	stda	%l2,	[%l7 + %i4] 0x10
	wr	%g0,	0x22,	%asi
	stha	%i5,	[%l7 + 0x18] %asi
	membar	#Sync
	nop
	set	0x4A, %g6
	sth	%i1,	[%l7 + %g6]
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o6
	lduw	[%l7 + 0x0C],	%l4
	wr	%g0,	0xea,	%asi
	stda	%o0,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x68] %asi,	%f12
	lduh	[%l7 + 0x4C],	%o7
	ldstub	[%l7 + 0x47],	%o1
	flush	%l7 + 0x70
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%g1
	nop
	set	0x58, %i7
	std	%f18,	[%l7 + %i7]
	swap	[%l7 + 0x70],	%o5
	std	%f22,	[%l7 + 0x40]
	nop
	set	0x18, %l5
	ldswa	[%l7 + %l5] 0x8a,	%i6
	stb	%l1,	[%l7 + 0x23]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	flush	%l7 + 0x74
	nop
	set	0x50, %g5
	ldsh	[%l7 + %g5],	%g7
	set	0x28, %l3
	lduwa	[%l7 + %l3] 0x10,	%o2
	std	%f4,	[%l7 + 0x70]
	set	0x4C, %i3
	ldswa	[%l7 + %i3] 0x8a,	%i2
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x5C, %l2
	ldsw	[%l7 + %l2],	%l5
	stw	%i0,	[%l7 + 0x10]
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%o4
	nop
	set	0x08, %i1
	std	%f4,	[%l7 + %i1]
	nop
	setx	0x19CECC2540527800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	wr	%g0,	0x81,	%asi
	stda	%i6,	[%l7 + 0x30] %asi
	flush	%l7 + 0x3C
	nop
	set	0x08, %g1
	lduw	[%l7 + %g1],	%g6
	nop
	set	0x38, %o1
	prefetch	[%l7 + %o1],	 2
	ldd	[%l7 + 0x60],	%f14
	nop
	set	0x2C, %o5
	sth	%g3,	[%l7 + %o5]
	set	0x76, %o2
	ldsha	[%l7 + %o2] 0x10,	%o3
	nop
	set	0x70, %g2
	stda	%i4,	[%l7 + %g2] 0x88
	nop
	set	0x1A, %o6
	ldstub	[%l7 + %o6],	%i3
	wr	%g0,	0x81,	%asi
	stwa	%g2,	[%l7 + 0x0C] %asi
	ld	[%l7 + 0x7C],	%f24
	set	0x58, %l4
	lduwa	[%l7 + %l4] 0x80,	%g4
	nop
	set	0x28, %i0
	std	%f12,	[%l7 + %i0]
	set	0x78, %o0
	stxa	%l0,	[%l7 + %o0] 0xe2
	membar	#Sync
	stw	%g5,	[%l7 + 0x48]
	st	%f21,	[%l7 + 0x7C]
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x60] %asi,	%i7
	ld	[%l7 + 0x40],	%f7
	ldub	[%l7 + 0x4B],	%l3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l2
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%i5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x19
	std	%o6,	[%l7 + 0x78]
	nop
	set	0x12, %o7
	ldub	[%l7 + %o7],	%i1
	nop
	set	0x70, %i6
	flush	%l7 + %i6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%o0
	stw	%o7,	[%l7 + 0x18]
	stw	%o1,	[%l7 + 0x38]
	set	0x7A, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l4
	nop
	wr	%g0,	0x82,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udivcc	%g1,	0x18F2,	%o5
	wr	%g0,	0x83,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l1
	wr	%g0,	0x83,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g7
	nop
	set	0x76, %i5
	sth	%i6,	[%l7 + %i5]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f4
	movvc	%xcc,	%o2,	%i2
	nop
	set	0x0C, %l1
	prefetch	[%l7 + %l1],	 4
	and	%l5,	0x1E83,	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%g6
	nop
	setx	0x904F6400,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	std	%i6,	[%l7 + 0x60]
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%g3
	std	%f24,	[%l7 + 0x40]
	ldsw	[%l7 + 0x50],	%o3
	nop
	set	0x10, %o4
	lda	[%l7 + %o4] 0x82,	%f21
	nop
	set	0x34, %i4
	lda	[%l7 + %i4] 0x18,	%f20
	movne	%fcc2,	%i4,	%g2
	prefetch	[%l7 + 0x5C],	 3
	ldx	[%l7 + 0x60],	%g4
	stbar
	swap	[%l7 + 0x48],	%l0
	set	0x5C, %g6
	sta	%f31,	[%l7 + %g6] 0x18
	nop
	set	0x0D, %o3
	ldsba	[%l7 + %o3] 0x89,	%i3
	ldsb	[%l7 + 0x7A],	%i7
	std	%f28,	[%l7 + 0x58]
	nop
	wr	%g0,	0x83,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%l3
	ldsb	[%l7 + 0x49],	%l2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x83,	%asi
	casa	[%l6] 0x83,	%g5,	%i5
	lduw	[%l7 + 0x4C],	%i1
	edge32	%o6,	%o7,	%o0
	movle	%fcc3,	%l4,	%g1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x18] %asi,	%o1
	std	%o4,	[%l7 + 0x48]
	nop
	set	0x34, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x75, %i7
	ldsb	[%l7 + %i7],	%g7
	ldstub	[%l7 + 0x4D],	%l1
	nop
	wr	%g0,	0xd8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldub	[%l7 + 0x25],	%i6
	wr	%g0,	0x27,	%asi
	stda	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	movul	%fcc0,	0x162,	%i2
	nop
	set	0x0F, %g5
	ldub	[%l7 + %g5],	%l5
	stbar
	ldsb	[%l7 + 0x09],	%o4
	nop
	set	0x76, %l3
	lduh	[%l7 + %l3],	%g6
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x8a,	 1
	nop
	set	0x4C, %l2
	flush	%l7 + %l2
	nop
	set	0x6B, %l0
	stb	%g3,	[%l7 + %l0]
	set	0x20, %g1
	lda	[%l7 + %g1] 0x81,	%f21
	nop
	set	0x38, %i1
	stxa	%o3,	[%l7 + %i1] 0x19
	ldsb	[%l7 + 0x19],	%l6
	nop
	set	0x1F, %o1
	ldstub	[%l7 + %o1],	%g2
	movo	%fcc3,	0x1DA,	%i4
	lduw	[%l7 + 0x54],	%l0
	nop
	set	0x30, %o5
	ldsw	[%l7 + %o5],	%g4
	std	%f8,	[%l7 + 0x38]
	nop
	set	0x48, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%l3
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f12
	std	%f28,	[%l7 + 0x40]
	sth	%g5,	[%l7 + 0x3A]
	nop
	setx	0x0E67,	%l0,	%i1
	sdiv	%l2,	%i1,	%i5
	std	%o6,	[%l7 + 0x50]
	st	%f8,	[%l7 + 0x64]
	stbar
	nop
	set	0x28, %i0
	stx	%o7,	[%l7 + %i0]
	set	0x4C, %l6
	lduwa	[%l7 + %l6] 0x81,	%l4
	subc	%o0,	0x1D4D,	%o1
	nop
	setx	0x704F7000,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	ldx	[%l7 + 0x70],	%g1
	ldub	[%l7 + 0x7C],	%o5
	nop
	wr	%g0,	0x8b,	%asi
	lda	[%l7 + 0x7C] %asi,	%f31
	stw	%l1,	[%l7 + 0x68]
	nop
	setx	0xF0524000,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%i6
	nop
	set	0x69, %o0
	ldstub	[%l7 + %o0],	%g7
	nop
	set	0x10, %g4
	swap	[%l7 + %g4],	%i2
	wr	%g0,	0x83,	%asi
	stwa	%o2,	[%l7 + 0x2C] %asi
	wr	%g0,	0x82,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%l5
	wr	%g0,	0x83,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%g6
	set	0x0C, %i6
	swapa	[%l7 + %i6] 0x11,	%i0
	std	%f8,	[%l7 + 0x40]
	orncc	%o4,	0x0641,	%g3
	ldsb	[%l7 + 0x26],	%l6
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x10,	%f16
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%o2
	nop
	set	0x18, %i5
	sth	%g2,	[%l7 + %i5]
	st	%f6,	[%l7 + 0x58]
	flush	%l7 + 0x64
	add	%l7,	0x28,	%l6
	wr	%g0,	0x8a,	%asi
	casxa	[%l6] 0x8a,	%l0,	%g4
	nop
	set	0x08, %i2
	std	%i6,	[%l7 + %i2]
	nop
	setx	0x1079A400,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	set	0x30, %l1
	lduba	[%l7 + %l1] 0x83,	%i4
	stbar
	ldd	[%l7 + 0x38],	%l2
	lduh	[%l7 + 0x64],	%i3
	ldsh	[%l7 + 0x38],	%g5
	ldd	[%l7 + 0x40],	%l2
	stx	%i1,	[%l7 + 0x08]
	set	0x1C, %o4
	stwa	%o6,	[%l7 + %o4] 0x2a
	membar	#Sync
	nop
	set	0x58, %i4
	ldsb	[%l7 + %i4],	%i5
	ld	[%l7 + 0x08],	%f18
	ldx	[%l7 + 0x68],	%l4
	st	%f28,	[%l7 + 0x74]
	set	0x18, %g6
	sta	%f13,	[%l7 + %g6] 0x8a
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldsw	[%l7 + 0x6C],	%o7
	ldsw	[%l7 + 0x50],	%o1
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x14] %asi,	%f21
	stbar
	umulcc	%o0,	0x0FC4,	%o5
	nop
	setx	0x906B3400,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	ldsb	[%l7 + 0x10],	%l1
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%i6
	nop
	set	0x22, %o3
	ldsha	[%l7 + %o3] 0x8a,	%g1
	nop
	set	0x44, %l5
	sth	%i2,	[%l7 + %l5]
	ldx	[%l7 + 0x68],	%o2
	movrne	%g7,	%l5,	%i0
	movvs	%icc,	0x352,	%g6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%o4
	nop
	set	0x32, %i7
	ldstub	[%l7 + %i7],	%g3
	set	0x23, %g7
	lduba	[%l7 + %g7] 0x0c,	%l6
	set	0x14, %l3
	stwa	%g2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x41, %i3
	ldstub	[%l7 + %i3],	%o3
	stbar
	ldsh	[%l7 + 0x68],	%l0
	nop
	set	0x44, %l2
	stha	%i7,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x3C, %l0
	lda	[%l7 + %l0] 0x80,	%f30
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x19,	 4
	nop
	set	0x39, %i1
	ldsb	[%l7 + %i1],	%l3
	nop
	setx	0x318CAFC0904DC800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	orn	%g4,	%g5,	%i3
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%l2
	stw	%i1,	[%l7 + 0x0C]
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%o6,	[%l7 + 0x50] %asi
	membar	#Sync
	nop
	wr	%g0,	0x27,	%asi
	stda	%i4,	[%l7 + 0x78] %asi
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x82,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%o7
	set	0x1C, %o5
	sta	%f13,	[%l7 + %o5] 0x83
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x10] %asi,	%o1
	std	%f6,	[%l7 + 0x40]
	ldd	[%l7 + 0x20],	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x8b,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x8b,	%o0,	%i6
	stx	%l1,	[%l7 + 0x18]
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%i2
	stw	%o2,	[%l7 + 0x28]
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 4
	stbar
	ldstub	[%l7 + 0x48],	%g7
	nop
	set	0x0A, %o6
	lduh	[%l7 + %o6],	%i0
	set	0x58, %g1
	lduwa	[%l7 + %g1] 0x0c,	%l5
	edge8ln	%o4,	%g3,	%l6
	nop
	set	0x67, %o2
	stb	%g2,	[%l7 + %o2]
	nop
	set	0x48, %l4
	std	%o2,	[%l7 + %l4]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x10,	%f0
	nop
	setx	0x90422400,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%l0
	addcc	%i7,	0x1BE7,	%i4
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x12] %asi,	%l3
	nop
	wr	%g0,	0x8b,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g6
	flush	%l7 + 0x4C
	sdivx	%g4,	0x0CC3,	%g5
	wr	%g0,	0x83,	%asi
	stha	%i3,	[%l7 + 0x3C] %asi
	nop
	set	0x14, %i0
	sth	%i1,	[%l7 + %i0]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc9
	ld	[%l7 + 0x58],	%f1
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%l2
	ldstub	[%l7 + 0x63],	%i5
	nop
	set	0x63, %o7
	ldstub	[%l7 + %o7],	%l4
	subccc	%o7,	0x08DE,	%o1
	set	0x7C, %i5
	swapa	[%l7 + %i5] 0x10,	%o6
	lduh	[%l7 + 0x76],	%o5
	nop
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x04,	%f0
	wr	%g0,	0x11,	%asi
	sta	%f22,	[%l7 + 0x40] %asi
	nop
	set	0x72, %l1
	lduh	[%l7 + %l1],	%o0
	ldub	[%l7 + 0x11],	%l1
	std	%f2,	[%l7 + 0x08]
	nop
	wr	%g0,	0x2f,	%asi
	stda	%i6,	[%l7 + 0x28] %asi
	membar	#Sync
	set	0x5D, %o4
	ldstuba	[%l7 + %o4] 0x8b,	%i2
	std	%g0,	[%l7 + 0x60]
	nop
	set	0x54, %i4
	lduw	[%l7 + %i4],	%o2
	nop
	set	0x08, %g6
	ldstub	[%l7 + %g6],	%i0
	nop
	setx	0x10457800,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g7
	nop
	set	0x1C, %i2
	stb	%l5,	[%l7 + %i2]
	nop
	setx	0xB11953757041A800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	wr	%g0,	0x8b,	%asi
	lduba	[%l7 + 0x15] %asi,	%o4
	stx	%l6,	[%l7 + 0x08]
	wr	%g0,	0x82,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	st	%f17,	[%l7 + 0x70]
	bmask	%o3,	%g2,	%i7
	st	%f14,	[%l7 + 0x68]
	ld	[%l7 + 0x70],	%f23
	ld	[%l7 + 0x48],	%f2
	edge16ln	%l0,	%l3,	%i4
	nop
	set	0x44, %o3
	sta	%f11,	[%l7 + %o3] 0x8b
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%g4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 3
	ldub	[%l7 + 0x45],	%i3
	set	0x6C, %g7
	ldswa	[%l7 + %g7] 0x0c,	%i1
	nop
	set	0x08, %l3
	sta	%f23,	[%l7 + %l3] 0x18
	wr	%g0,	0x8b,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l2
	sth	%i5,	[%l7 + 0x5A]
	ldsw	[%l7 + 0x30],	%l4
	ldstub	[%l7 + 0x25],	%o7
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x0C, %l2
	ldsw	[%l7 + %l2],	%g6
	ldsh	[%l7 + 0x50],	%o6
	sth	%o0,	[%l7 + 0x3C]
	nop
	setx	0xCB5EF33D704C6000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x83,	%l0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x44] %asi,	%i2
	ldsb	[%l7 + 0x73],	%o5
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%o2
	nop
	set	0x28, %g5
	prefetch	[%l7 + %g5],	 2
	set	0x69, %i1
	ldsba	[%l7 + %i1] 0x81,	%i0
	add	%g7,	%g1,	%l5
	set	0x7B, %o5
	lduba	[%l7 + %o5] 0x18,	%l6
	set	0x24, %g2
	lduwa	[%l7 + %g2] 0x0c,	%o4
	ldd	[%l7 + 0x58],	%o2
	nop
	set	0x77, %o6
	stb	%g3,	[%l7 + %o6]
	movul	%fcc2,	0x62F,	%g2
	set	0x70, %g1
	ldswa	[%l7 + %g1] 0x80,	%i7
	std	%f12,	[%l7 + 0x40]
	ld	[%l7 + 0x34],	%f12
	nop
	set	0x11, %o2
	ldsb	[%l7 + %o2],	%l0
	nop
	set	0x08, %l4
	stwa	%i4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%g4
	set	0x6E, %o0
	stha	%g5,	[%l7 + %o0] 0xea
	membar	#Sync
	movcc	%icc,	%l3,	%i1
	nop
	setx	0x20410400,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	wr	%g0,	0x11,	%asi
	stba	%l2,	[%l7 + 0x2C] %asi
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x18, %o1
	flush	%l7 + %o1
	swap	[%l7 + 0x24],	%i3
	lduh	[%l7 + 0x3E],	%i5
	nop
	set	0x48, %i0
	ldsw	[%l7 + %i0],	%o7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o1
	ldsb	[%l7 + 0x59],	%g6
	lduw	[%l7 + 0x48],	%l4
	std	%f6,	[%l7 + 0x70]
	nop
	set	0x50, %g4
	ldsh	[%l7 + %g4],	%o0
	xnorcc	%o6,	%l1,	%i6
	mulscc	%o5,	0x1182,	%i2
	set	0x38, %o7
	stha	%o2,	[%l7 + %o7] 0xeb
	membar	#Sync
	stx	%g7,	[%l7 + 0x40]
	nop
	setx	0x6280CEB20624000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	stx	%i0,	[%l7 + 0x38]
	swap	[%l7 + 0x18],	%l5
	stw	%l6,	[%l7 + 0x30]
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6C] %asi,	%g1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	lduw	[%l7 + 0x1C],	%o3
	nop
	set	0x78, %i6
	prefetch	[%l7 + %i6],	 2
	wr	%g0,	0x8b,	%asi
	lduba	[%l7 + 0x53] %asi,	%g3
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%o4
	ldsw	[%l7 + 0x24],	%i7
	nop
	set	0x68, %g3
	stw	%g2,	[%l7 + %g3]
	std	%f12,	[%l7 + 0x40]
	sllx	%l0,	%i4,	%g4
	nop
	set	0x70, %l1
	lda	[%l7 + %l1] 0x8a,	%f11
	nop
	set	0x0F, %i4
	ldub	[%l7 + %i4],	%g5
	wr	%g0,	0xe3,	%asi
	stha	%l3,	[%l7 + 0x6A] %asi
	membar	#Sync
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x44] %asi,	%l2
	ldd	[%l7 + 0x60],	%i0
	nop
	set	0x4D, %g6
	ldub	[%l7 + %g6],	%i5
	ldub	[%l7 + 0x6E],	%o7
	nop
	set	0x54, %i2
	flush	%l7 + %i2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x44] %asi,	%f18
	set	0x50, %o4
	lduwa	[%l7 + %o4] 0x04,	%o1
	ldx	[%l7 + 0x38],	%i3
	ldsh	[%l7 + 0x42],	%g6
	nop
	set	0x30, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x60, %o3
	stx	%o0,	[%l7 + %o3]
	stbar
	ldstub	[%l7 + 0x0B],	%o6
	nop
	wr	%g0,	0xe3,	%asi
	stda	%l4,	[%l7 + 0x08] %asi
	membar	#Sync
	ldd	[%l7 + 0x08],	%f20
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%l0
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x8b,	 0
	nop
	set	0x47, %i3
	stb	%i2,	[%l7 + %i3]
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x89,	%o2
	set	0x26, %l0
	lduha	[%l7 + %l0] 0x10,	%i6
	ldsb	[%l7 + 0x5E],	%g7
	set	0x08, %l2
	ldsha	[%l7 + %l2] 0x83,	%i0
	stb	%l6,	[%l7 + 0x24]
	set	0x38, %g5
	stxa	%g1,	[%l7 + %g5] 0x80
	nop
	set	0x7D, %i1
	ldstub	[%l7 + %i1],	%l5
	stx	%o3,	[%l7 + 0x18]
	stb	%o4,	[%l7 + 0x46]
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc0
	stbar
	nop
	set	0x54, %i7
	swap	[%l7 + %i7],	%g3
	wr	%g0,	0x82,	%asi
	stba	%g2,	[%l7 + 0x2F] %asi
	stb	%l0,	[%l7 + 0x34]
	prefetch	[%l7 + 0x0C],	 0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldd	[%l7 + 0x38],	%f16
	add	%l7,	0x30,	%l6
	wr	%g0,	0x83,	%asi
	casxa	[%l6] 0x83,	%g4,	%g5
	nop
	setx	0xFADF2C8BA0435000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	ldub	[%l7 + 0x70],	%i7
	nop
	set	0x3F, %g2
	ldsb	[%l7 + %g2],	%l3
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%i1
	nop
	setx	0x316D8016F049A400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x0c,	%f0
	ldd	[%l7 + 0x70],	%f2
	stbar
	set	0x08, %g1
	stda	%l2,	[%l7 + %g1] 0x04
	sth	%o7,	[%l7 + 0x6C]
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%o1,	[%l7 + 0x08] %asi
	membar	#Sync
	nop
	set	0x1B, %l4
	ldsba	[%l7 + %l4] 0x04,	%i5
	nop
	wr	%g0,	0x82,	%asi
	ldswa	[%l7 + 0x18] %asi,	%g6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x8b,	%f0
	nop
	set	0x52, %l6
	ldsh	[%l7 + %l6],	%i3
	wr	%g0,	0x2f,	%asi
	stwa	%o0,	[%l7 + 0x54] %asi
	membar	#Sync
	nop
	set	0x58, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x0F, %o0
	ldub	[%l7 + %o0],	%o6
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	set	0x10, %g4
	stda	%l4,	[%l7 + %g4] 0x80
	std	%f12,	[%l7 + 0x40]
	nop
	set	0x54, %i0
	lduh	[%l7 + %i0],	%l1
	stbar
	ldstub	[%l7 + 0x5B],	%o5
	nop
	setx	0x604A6800,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	set	0x0A, %o7
	ldsha	[%l7 + %o7] 0x8b,	%i2
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%o2
	lduh	[%l7 + 0x2A],	%i6
	stb	%i0,	[%l7 + 0x31]
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x22] %asi,	%l6
	edge16n	%g1,	%l5,	%g7
	movre	%o3,	0x140,	%g3
	wr	%g0,	0x8b,	%asi
	sta	%f10,	[%l7 + 0x74] %asi
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%g2
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x50, %i4
	std	%f20,	[%l7 + %i4]
	edge16n	%o4,	%l0,	%i4
	nop
	set	0x58, %g6
	lduba	[%l7 + %g6] 0x81,	%g4
	nop
	wr	%g0,	0x82,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i7
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x1f,	%f16
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x19,	%l3
	nop
	set	0x34, %o4
	stw	%g5,	[%l7 + %o4]
	st	%f31,	[%l7 + 0x44]
	ldstub	[%l7 + 0x50],	%i1
	movge	%fcc3,	0x4C5,	%l2
	edge32ln	%o1,	%i5,	%g6
	nop
	set	0x28, %l5
	flush	%l7 + %l5
	edge32ln	%i3,	%o0,	%o6
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x82,	%f16
	std	%l4,	[%l7 + 0x30]
	stb	%o7,	[%l7 + 0x5C]
	prefetch	[%l7 + 0x2C],	 1
	movle	%icc,	%l1,	%o5
	std	%o2,	[%l7 + 0x78]
	stx	%i6,	[%l7 + 0x58]
	sth	%i2,	[%l7 + 0x18]
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x52] %asi,	%i0
	nop
	set	0x2C, %i3
	ldswa	[%l7 + %i3] 0x80,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x4C] %asi,	%f9
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g1
	set	0x33, %l3
	stba	%l5,	[%l7 + %l3] 0x19
	alignaddrl	%o3,	%g3,	%g7
	wr	%g0,	0x8a,	%asi
	stxa	%g2,	[%l7 + 0x60] %asi
	nop
	set	0x70, %g7
	ldsh	[%l7 + %g7],	%l0
	swap	[%l7 + 0x1C],	%o4
	stw	%g4,	[%l7 + 0x54]
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x1E] %asi
	nop
	set	0x10, %l0
	stw	%l3,	[%l7 + %l0]
	nop
	set	0x50, %l2
	flush	%l7 + %l2
	nop
	wr	%g0,	0x8b,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i7
	nop
	set	0x18, %i1
	swap	[%l7 + %i1],	%g5
	ldd	[%l7 + 0x28],	%i0
	addccc	%o1,	0x0F54,	%i5
	wr	%g0,	0x19,	%asi
	stba	%l2,	[%l7 + 0x5C] %asi
	nop
	set	0x75, %o5
	ldstub	[%l7 + %o5],	%g6
	set	0x78, %g5
	lduwa	[%l7 + %g5] 0x11,	%i3
	nop
	setx	0xF04FA000,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x15] %asi,	%o6
	nop
	set	0x34, %g2
	stw	%o0,	[%l7 + %g2]
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x38] %asi,	%l4
	nop
	set	0x34, %o6
	lduba	[%l7 + %o6] 0x82,	%l1
	set	0x60, %i7
	ldsha	[%l7 + %i7] 0x80,	%o5
	ldsw	[%l7 + 0x20],	%o7
	stbar
	std	%f30,	[%l7 + 0x78]
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x19,	%o2
	nop
	set	0x48, %g1
	stw	%i6,	[%l7 + %g1]
	movue	%fcc3,	0x3A8,	%i2
	nop
	set	0x58, %l6
	prefetch	[%l7 + %l6],	 4
	flush	%l7 + 0x74
	lduw	[%l7 + 0x7C],	%i0
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g1
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	ldd	[%l7 + 0x30],	%f14
	ldstub	[%l7 + 0x7F],	%l6
	nop
	wr	%g0,	0x8b,	%asi
	ldsba	[%l7 + 0x19] %asi,	%o3
	nop
	wr	%g0,	0x83,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 4
	ldstub	[%l7 + 0x25],	%g2
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0
	flush	%l7 + 0x6C
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%o4
	ldstub	[%l7 + 0x44],	%l0
	nop
	set	0x38, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x74, %o2
	flush	%l7 + %o2
	stx	%g4,	[%l7 + 0x20]
	nop
	set	0x39, %g4
	ldsba	[%l7 + %g4] 0x81,	%i4
	movcs	%icc,	0x367,	%l3
	ldsw	[%l7 + 0x3C],	%i7
	nop
	set	0x30, %i0
	prefetch	[%l7 + %i0],	 0
	set	0x20, %i6
	stda	%i0,	[%l7 + %i6] 0x11
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%o1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 4
	nop
	set	0x44, %o7
	ldsw	[%l7 + %o7],	%l2
	nop
	set	0x20, %l1
	std	%f28,	[%l7 + %l1]
	wr	%g0,	0x8a,	%asi
	ldsha	[%l7 + 0x54] %asi,	%g6
	st	%f30,	[%l7 + 0x18]
	ldd	[%l7 + 0x18],	%i4
	nop
	set	0x32, %g3
	ldsh	[%l7 + %g3],	%o6
	nop
	set	0x10, %i4
	ldsw	[%l7 + %i4],	%i3
	wr	%g0,	0x83,	%asi
	stha	%o0,	[%l7 + 0x5C] %asi
	nop
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x83,	%l1
	nop
	set	0x5F, %i5
	ldstub	[%l7 + %i5],	%l4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%o7
	prefetch	[%l7 + 0x68],	 3
	set	0x36, %o4
	lduha	[%l7 + %o4] 0x04,	%o2
	ldd	[%l7 + 0x58],	%i6
	stbar
	nop
	set	0x7C, %l5
	swap	[%l7 + %l5],	%i2
	nop
	set	0x1E, %i2
	ldsb	[%l7 + %i2],	%i0
	wr	%g0,	0xea,	%asi
	stwa	%g1,	[%l7 + 0x34] %asi
	membar	#Sync
	set	0x34, %i3
	ldswa	[%l7 + %i3] 0x89,	%l5
	sth	%o5,	[%l7 + 0x7A]
	ldd	[%l7 + 0x78],	%i6
	stw	%o3,	[%l7 + 0x28]
	nop
	set	0x48, %o3
	std	%f26,	[%l7 + %o3]
	nop
	set	0x60, %l3
	lduw	[%l7 + %l3],	%g3
	nop
	set	0x63, %l0
	ldstub	[%l7 + %l0],	%g2
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x8b,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g7
	nop
	set	0x48, %g7
	sta	%f17,	[%l7 + %g7] 0x80
	set	0x10, %i1
	swapa	[%l7 + %i1] 0x8b,	%l0
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7F] %asi,	%i4
	wr	%g0,	0x23,	%asi
	stwa	%g4,	[%l7 + 0x68] %asi
	membar	#Sync
	lduh	[%l7 + 0x38],	%i7
	nop
	set	0x40, %o5
	std	%f26,	[%l7 + %o5]
	nop
	wr	%g0,	0x82,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l3
	ldx	[%l7 + 0x28],	%o1
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i1,	%l2
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 1
	stbar
	nop
	set	0x5C, %g2
	sta	%f15,	[%l7 + %g2] 0x04
	nop
	set	0x50, %o6
	stw	%g5,	[%l7 + %o6]
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x8a,	%asi
	casa	[%l6] 0x8a,	%g6,	%o6
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%i3
	nop
	set	0x18, %l2
	flush	%l7 + %l2
	nop
	setx	0x11E6C9D7504D1400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	set	0x70, %g1
	stwa	%o0,	[%l7 + %g1] 0x10
	nop
	set	0x16, %l6
	stba	%l4,	[%l7 + %l6] 0x8b
	nop
	set	0x32, %o1
	ldub	[%l7 + %o1],	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o7
	ldd	[%l7 + 0x38],	%f6
	stbar
	set	0x10, %o0
	lduha	[%l7 + %o0] 0x89,	%i6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	ldd	[%l7 + 0x78],	%i0
	set	0x79, %o2
	lduba	[%l7 + %o2] 0x81,	%g1
	lduh	[%l7 + 0x3A],	%i2
	andcc	%l5,	0x00F3,	%l6
	nop
	set	0x38, %i0
	stx	%o3,	[%l7 + %i0]
	st	%f1,	[%l7 + 0x50]
	wr	%g0,	0x8b,	%asi
	stxa	%o5,	[%l7 + 0x30] %asi
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g2
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%o4
	nop
	wr	%g0,	0x8b,	%asi
	lda	[%l7 + 0x10] %asi,	%f19
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%l0
	nop
	set	0x38, %l1
	std	%f2,	[%l7 + %l1]
	set	0x70, %g3
	lda	[%l7 + %g3] 0x89,	%f6
	std	%g2,	[%l7 + 0x10]
	set	0x0F, %i4
	ldstuba	[%l7 + %i4] 0x10,	%g4
	set	0x24, %i5
	sta	%f13,	[%l7 + %i5] 0x88
	nop
	set	0x76, %o4
	ldsb	[%l7 + %o4],	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%l3
	nop
	wr	%g0,	0x82,	%asi
	sta	%f8,	[%l7 + 0x40] %asi
	nop
	set	0x20, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x8a,	%f1
	prefetch	[%l7 + 0x20],	 1
	set	0x46, %i2
	stha	%i1,	[%l7 + %i2] 0x81
	set	0x24, %i3
	stwa	%l2,	[%l7 + %i3] 0x80
	stbar
	wr	%g0,	0xe2,	%asi
	stha	%o1,	[%l7 + 0x2E] %asi
	membar	#Sync
	nop
	set	0x42, %o3
	sth	%g5,	[%l7 + %o3]
	nop
	set	0x48, %l0
	ldsw	[%l7 + %l0],	%i5
	stb	%o6,	[%l7 + 0x21]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f6
	nop
	set	0x08, %g7
	flush	%l7 + %g7
	sth	%g6,	[%l7 + 0x20]
	wr	%g0,	0x8a,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x78] %asi
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x11,	%i3
	xor	%l4,	%o2,	%o7
	nop
	set	0x4C, %g5
	sth	%i6,	[%l7 + %g5]
	set	0x32, %g2
	stha	%i0,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x44, %o5
	stw	%g1,	[%l7 + %o5]
	nop
	set	0x24, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x54, %l2
	ldsh	[%l7 + %l2],	%i2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l5
	prefetch	[%l7 + 0x20],	 1
	ld	[%l7 + 0x20],	%f0
	wr	%g0,	0x10,	%asi
	stha	%l1,	[%l7 + 0x14] %asi
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x8a,	%asi
	ldsha	[%l7 + 0x58] %asi,	%l6
	wr	%g0,	0x83,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o3
	stw	%o5,	[%l7 + 0x2C]
	stbar
	set	0x2D, %o6
	ldsba	[%l7 + %o6] 0x83,	%o4
	nop
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x19,	%g2
	stw	%l0,	[%l7 + 0x28]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x48, %o1
	swap	[%l7 + %o1],	%g3
	nop
	set	0x08, %g1
	sta	%f13,	[%l7 + %g1] 0x19
	nop
	set	0x20, %l4
	swap	[%l7 + %l4],	%g7
	nop
	setx	0x73E4FA7AF06F7000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	set	0x58, %o2
	stwa	%g4,	[%l7 + %o2] 0x22
	membar	#Sync
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x79] %asi,	%i7
	stx	%i4,	[%l7 + 0x20]
	nop
	setx	0x11529D6E205D0400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	wr	%g0,	0x82,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 3
	stb	%l2,	[%l7 + 0x68]
	ldsb	[%l7 + 0x1A],	%i1
	ldx	[%l7 + 0x28],	%g5
	nop
	set	0x66, %i0
	sth	%o1,	[%l7 + %i0]
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%i5
	nop
	set	0x7F, %g4
	ldub	[%l7 + %g4],	%g6
	nop
	setx	0x407B8400,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	stx	%o0,	[%l7 + 0x10]
	nop
	set	0x2C, %i6
	flush	%l7 + %i6
	sll	%i3,	%l4,	%o2
	st	%f13,	[%l7 + 0x78]
	nop

	ta T_CHANGE_NONPRIV
!!	ta T_CHANGE_NONHPRIV

	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x48] %asi,	%o7
	nop
	set	0x37, %o7
	stb	%o6,	[%l7 + %o7]
	stx	%i0,	[%l7 + 0x68]
	ldub	[%l7 + 0x30],	%l1
	nop
	set	0x20, %g3
	lduha	[%l7 + %g3] 0x89,	%l6
	nop
	set	0x0C, %i4
	flush	%l7 + %i4
	nop
	set	0x6C, %l1
	lduh	[%l7 + %l1],	%o3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 3
	nop
	set	0x58, %o4
	swapa	[%l7 + %o4] 0x18,	%o5
	st	%f31,	[%l7 + 0x48]
	srlx	%o4,	%l0,	%g2
	nop
	wr	%g0,	0x82,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%g7
	nop
	setx	0x9178B877E047A800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	prefetch	[%l7 + 0x10],	 0
	ldub	[%l7 + 0x4F],	%g4
	wr	%g0,	0x27,	%asi
	stba	%g3,	[%l7 + 0x63] %asi
	membar	#Sync
	nop
	set	0x18, %i5
	ldsha	[%l7 + %i5] 0x88,	%i7
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f12
	edge8l	%i4,	%l3,	%i1
	nop
	set	0x54, %i2
	flush	%l7 + %i2
	lduw	[%l7 + 0x10],	%l2
	flush	%l7 + 0x70
	swap	[%l7 + 0x30],	%g5
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x89
	nop
	set	0x70, %g6
	sth	%i5,	[%l7 + %g6]
	movrgz	%g6,	%o1,	%i3
	std	%l4,	[%l7 + 0x18]
	stx	%o2,	[%l7 + 0x40]
	edge32l	%o0,	%o7,	%i0
	edge16ln	%o6,	%g1,	%l5
	sdivcc	%i6,	0x1B95,	%l6
	ldub	[%l7 + 0x1B],	%o3
	lduw	[%l7 + 0x58],	%i2
	nop
	set	0x48, %o3
	stw	%o5,	[%l7 + %o3]
	lduh	[%l7 + 0x78],	%l1
	nop
	set	0x78, %l0
	stda	%l0,	[%l7 + %l0] 0x0c
	st	%f3,	[%l7 + 0x7C]
	nop
	set	0x40, %l3
	stx	%g2,	[%l7 + %l3]
	set	0x40, %g7
	stda	%o4,	[%l7 + %g7] 0x8a
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x5E] %asi,	%g7
	ldub	[%l7 + 0x33],	%g3
	flush	%l7 + 0x24
	movcc	%icc,	0x698,	%i7
	lduw	[%l7 + 0x58],	%g4
	nop
	set	0x61, %i1
	ldsba	[%l7 + %i1] 0x80,	%l3
	nop
	setx	0x8054A000,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	set	0x22, %g5
	ldstuba	[%l7 + %g5] 0x10,	%i1
	nop
	set	0x44, %g2
	ldsh	[%l7 + %g2],	%l2
	ldub	[%l7 + 0x2F],	%g5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%i4
	ldsh	[%l7 + 0x3C],	%g6
	st	%f0,	[%l7 + 0x28]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i5,	%i3
	nop
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldx	[%l7 + 0x10],	%l4
	set	0x1C, %i7
	lduwa	[%l7 + %i7] 0x89,	%o2
	ldd	[%l7 + 0x40],	%o0
	stbar
	st	%f20,	[%l7 + 0x48]
	std	%o0,	[%l7 + 0x68]
	set	0x14, %l2
	lduwa	[%l7 + %l2] 0x83,	%i0
	nop
	set	0x08, %o6
	prefetch	[%l7 + %o6],	 1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x51] %asi,	%o7
	stb	%o6,	[%l7 + 0x2B]
	nop
	set	0x40, %l6
	std	%l4,	[%l7 + %l6]
	std	%g0,	[%l7 + 0x10]
	nop
	wr	%g0,	0x81,	%asi
	sta	%f15,	[%l7 + 0x7C] %asi
	sth	%l6,	[%l7 + 0x42]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%o2
	movg	%fcc1,	0x21B,	%i2
	nop
	wr	%g0,	0x83,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l1,	%o5
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f2
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%l0
	nop
	set	0x5E, %o2
	ldsh	[%l7 + %o2],	%g2
	std	%f20,	[%l7 + 0x38]
	srax	%g7,	%o4,	%i7
	movrne	%g4,	0x2CB,	%l3
	movne	%xcc,	0x3D2,	%g3
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%l2
	nop
	set	0x14, %i0
	ldstub	[%l7 + %i0],	%i1
	nop
	set	0x25, %g4
	ldstub	[%l7 + %g4],	%i4
	st	%f30,	[%l7 + 0x08]
	swap	[%l7 + 0x08],	%g5
	flush	%l7 + 0x74
	prefetch	[%l7 + 0x34],	 2
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x89,	%i5
	stbar
	ldsh	[%l7 + 0x56],	%g6
	movue	%fcc3,	%l4,	%i3
	sth	%o1,	[%l7 + 0x6A]
	nop
	set	0x10, %o0
	std	%f18,	[%l7 + %o0]
	ldsh	[%l7 + 0x0E],	%o0
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x88,	%o2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x6C] %asi,	%i0
	lduw	[%l7 + 0x40],	%o7
	set	0x56, %i4
	stba	%l5,	[%l7 + %i4] 0x23
	membar	#Sync
	ldsw	[%l7 + 0x68],	%g1
	nop
	set	0x14, %g3
	ldsw	[%l7 + %g3],	%l6
	nop
	setx	0x3058F800,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	set	0x0C, %o4
	sta	%f17,	[%l7 + %o4] 0x83
	stx	%o3,	[%l7 + 0x28]
	movul	%fcc3,	0x157,	%o6
	sll	%i6,	%l1,	%o5
	wr	%g0,	0x2a,	%asi
	stda	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
	movrlz	%l0,	0x109,	%g2
	ldsb	[%l7 + 0x6C],	%o4
	stbar
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd1,	%f16
	stw	%g7,	[%l7 + 0x58]
	nop
	set	0x44, %i5
	stw	%i7,	[%l7 + %i5]
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%g4
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f26
	set	0x1C, %i2
	sta	%f10,	[%l7 + %i2] 0x10
	nop
	set	0x24, %g6
	ldswa	[%l7 + %g6] 0x0c,	%l3
	prefetch	[%l7 + 0x78],	 2
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	stw	%i1,	[%l7 + 0x1C]
	set	0x08, %l3
	lda	[%l7 + %l3] 0x8a,	%f19
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x11,	%f16
	stbar
	set	0x64, %i1
	sta	%f26,	[%l7 + %i1] 0x88
	nop
	wr	%g0,	0x22,	%asi
	stba	%i4,	[%l7 + 0x21] %asi
	membar	#Sync
	nop
	set	0x50, %g5
	std	%g4,	[%l7 + %g5]
	nop
	set	0x16, %g2
	sth	%i5,	[%l7 + %g2]
	nop
	wr	%g0,	0x2a,	%asi
	stda	%g6,	[%l7 + 0x78] %asi
	membar	#Sync
	nop
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc9
	prefetch	[%l7 + 0x0C],	 2
	ldd	[%l7 + 0x78],	%f14
	nop
	set	0x68, %l2
	ldsb	[%l7 + %l2],	%l2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%l4
	nop
	set	0x48, %l6
	ldsh	[%l7 + %l6],	%i3
	ldsw	[%l7 + 0x58],	%o1
	nop
	set	0x0C, %o5
	sth	%o0,	[%l7 + %o5]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xea,	%o2
	nop
	setx	0xBE1A9A8BC0720800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	set	0x60, %g1
	std	%f16,	[%l7 + %g1]
	membar	0x25
	stbar
	ldd	[%l7 + 0x58],	%o6
	stbar
	nop
	set	0x20, %o1
	stw	%i0,	[%l7 + %o1]
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x34] %asi
	edge8	%l5,	%l6,	%g1
	ldstub	[%l7 + 0x10],	%o6
	nop
	set	0x30, %o2
	ldsh	[%l7 + %o2],	%o3
	addccc	%l1,	%i6,	%o5
	prefetch	[%l7 + 0x38],	 2
	and	%l0,	0x02B1,	%i2
	nop
	wr	%g0,	0x83,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o4
	ldsw	[%l7 + 0x20],	%g2
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 2
	movrlez	%g7,	%g4,	%l3
	prefetch	[%l7 + 0x7C],	 1
	srl	%i7,	0x1E,	%g3
	ld	[%l7 + 0x54],	%f19
	set	0x0E, %i0
	ldsba	[%l7 + %i0] 0x19,	%g6
	nop
	set	0x7E, %g4
	stha	%g5,	[%l7 + %g4] 0x2a
	membar	#Sync
	nop
	set	0x4C, %o0
	stw	%l4,	[%l7 + %o0]
	prefetch	[%l7 + 0x48],	 4
	ldsb	[%l7 + 0x3B],	%l2
	subccc	%o1,	%i3,	%o0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o2
	set	0x28, %i6
	stwa	%o7,	[%l7 + %i6] 0x10
	ldsw	[%l7 + 0x40],	%i0
	ldd	[%l7 + 0x68],	%f24
	nop
	set	0x34, %i4
	stw	%l6,	[%l7 + %i4]
	nop
	set	0x62, %o7
	ldsh	[%l7 + %o7],	%g1
	stbar
	nop
	set	0x2A, %o4
	ldsb	[%l7 + %o4],	%l5
	nop
	set	0x38, %l1
	sth	%o6,	[%l7 + %l1]
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 1
	ldsb	[%l7 + 0x3A],	%i6
	ldstub	[%l7 + 0x78],	%o5
	set	0x10, %i5
	stxa	%l0,	[%l7 + %i5] 0x0c
	nop
	set	0x58, %g3
	lduh	[%l7 + %g3],	%i2
	srax	%o3,	0x1A,	%g2
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g7
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x8b,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x8b,	%o4,	%l3
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%g4
	wr	%g0,	0xe3,	%asi
	stba	%i7,	[%l7 + 0x6E] %asi
	membar	#Sync
	ldd	[%l7 + 0x30],	%f26
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc8
	nop
	set	0x17, %o3
	ldub	[%l7 + %o3],	%g3
	ld	[%l7 + 0x1C],	%f9
	array32	%i1,	%i5,	%g6
	nop
	set	0x3A, %g6
	sth	%i4,	[%l7 + %g6]
	membar	0x76
	nop
	setx	0x4E7400,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	nop
	set	0x50, %l3
	lduh	[%l7 + %l3],	%l4
	nop
	set	0x28, %i1
	flush	%l7 + %i1
	edge16l	%g5,	%l2,	%o1
	and	%o0,	%i3,	%o2
	nop
	set	0x38, %g7
	sth	%i0,	[%l7 + %g7]
	ldsw	[%l7 + 0x78],	%l6
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o7
	std	%g0,	[%l7 + 0x38]
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x10] %asi,	%l5
	std	%o6,	[%l7 + 0x50]
	stb	%l1,	[%l7 + 0x25]
	subccc	%i6,	%l0,	%i2
	nop
	set	0x18, %g5
	lduh	[%l7 + %g5],	%o5
	set	0x28, %i7
	stxa	%g2,	[%l7 + %i7] 0x2b
	membar	#Sync
	prefetch	[%l7 + 0x44],	 1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%o3
	wr	%g0,	0x2f,	%asi
	stba	%o4,	[%l7 + 0x26] %asi
	membar	#Sync
	set	0x4C, %g2
	ldsha	[%l7 + %g2] 0x04,	%g4
	sth	%l3,	[%l7 + 0x64]
	stb	%g3,	[%l7 + 0x34]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%i5
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x8a,	%g6
	swap	[%l7 + 0x0C],	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x11,	%i4,	%g5
	st	%f17,	[%l7 + 0x14]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%l2
	movre	%o1,	0x3AC,	%o0
	nop
	set	0x68, %o5
	stda	%l4,	[%l7 + %o5] 0x23
	membar	#Sync
	stx	%i3,	[%l7 + 0x28]
	ldsw	[%l7 + 0x60],	%o2
	mulx	%l6,	%o7,	%g1
	ldx	[%l7 + 0x40],	%i0
	stbar
	std	%f22,	[%l7 + 0x08]
	subcc	%o6,	0x0540,	%l1
	stw	%i6,	[%l7 + 0x34]
	xorcc	%l0,	%l5,	%o5
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i2
	prefetch	[%l7 + 0x2C],	 4
	nop
	set	0x50, %o6
	std	%g2,	[%l7 + %o6]
	lduh	[%l7 + 0x10],	%g7
	swap	[%l7 + 0x58],	%o3
	nop
	set	0x1C, %o1
	ldsh	[%l7 + %o1],	%o4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f18
	nop

	ta T_CHANGE_HPRIV

	/* Now, set one of the TTE's to have P=1 */
	setx	page_0, %i0, %g1
	set	2, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical and priv
        or %i2, 0x540, %i2
        ! Now set up PA [39:13] only
	setx	page_2, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	ta T_CHANGE_NONHPRIV

	/* More testing */
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%o1
	nop
	set	0x5C, %i3
	ldub	[%l7 + %i3],	%i2
	nop
	set	0x50, %o6
	ldub	[%l7 + %o6],	%i6
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%o7
	nop
	set	0x60, %l3
	stx	%o0,	[%l7 + %l3]
	ldsh	[%l7 + 0x10],	%o5
	swap	[%l7 + 0x20],	%o2
	std	%f30,	[%l7 + 0x28]
	movrne	%o6,	%g7,	%l4
	set	0x24, %g7
	sta	%f26,	[%l7 + %g7] 0x80
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x10] %asi
	sth	%l3,	[%l7 + 0x3E]
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f6
	set	0x5C, %i7
	stha	%g3,	[%l7 + %i7] 0x8b
	set	0x0A, %l5
	ldstuba	[%l7 + %l5] 0x11,	%i1
	nop
	set	0x38, %o4
	prefetch	[%l7 + %o4],	 3
	movrlez	%g2,	0x3BC,	%g4
	set	0x14, %g2
	stha	%l5,	[%l7 + %g2] 0x19
	std	%i6,	[%l7 + 0x70]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o4,	%g6
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%g5
	fmovda	%fcc3,	%f4,	%f12
	wr	%g0,	0x22,	%asi
	stwa	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i5,	%i4
	ld	[%l7 + 0x2C],	%f27
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x88,	%g1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l2
	nop
	set	0x44, %i4
	lduh	[%l7 + %i4],	%l0
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x09] %asi,	%i3
	wr	%g0,	0x8a,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x50] %asi,	%i2
	fmovsa	%fcc0,	%f4,	%f31
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i6,	%o7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x8a
	mova	%icc,	%o1,	%o5
	ldub	[%l7 + 0x10],	%o0
	ldub	[%l7 + 0x41],	%o2
	wr	%g0,	0x80,	%asi
	stwa	%o6,	[%l7 + 0x1C] %asi
	ldstub	[%l7 + 0x78],	%g7
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%l4
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%l1
	ld	[%l7 + 0x70],	%f18
	nop
	set	0x60, %l6
	stwa	%g3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x44, %o3
	stwa	%i1,	[%l7 + %o3] 0x88
	wr	%g0,	0x8a,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%l3
	nop
	set	0x58, %l2
	ldsh	[%l7 + %l2],	%g4
	sth	%g2,	[%l7 + 0x2E]
	nop
	setx	0x1047F400,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	set	0x3C, %l0
	lduha	[%l7 + %l0] 0x18,	%l5
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%o4
	fmovsa	%fcc1,	%f10,	%f23
	set	0x78, %o0
	sta	%f11,	[%l7 + %o0] 0x19
	st	%f13,	[%l7 + 0x34]
	wr	%g0,	0x23,	%asi
	stha	%i7,	[%l7 + 0x38] %asi
	membar	#Sync
	wr	%g0,	0x83,	%asi
	stwa	%g5,	[%l7 + 0x4C] %asi
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g6
	movl	%fcc3,	0x169,	%i0
	swap	[%l7 + 0x58],	%l6
	stbar
	set	0x66, %i2
	stha	%i5,	[%l7 + %i2] 0x80
	set	0x71, %o5
	lduba	[%l7 + %o5] 0x11,	%i4
	set	0x28, %o7
	stxa	%g1,	[%l7 + %o7] 0x88
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%l2
	wr	%g0,	0xd0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x04,	%l0,	%i3
	nop
	set	0x30, %i3
	stw	%o3,	[%l7 + %i3]
	wr	%g0,	0x8b,	%asi
	lduha	[%l7 + 0x68] %asi,	%i2
	set	0x72, %o1
	ldsha	[%l7 + %o1] 0x80,	%o7
	stbar
	set	0x70, %l4
	lda	[%l7 + %l4] 0x8a,	%f27
	nop
	set	0x70, %l3
	stx	%i6,	[%l7 + %l3]
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o5
	nop
	set	0x1A, %g7
	sth	%o0,	[%l7 + %g7]
	movlg	%fcc3,	%o1,	%o2
	sra	%o6,	%g7,	%l1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x2a,	%g2
	wr	%g0,	0x83,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l4
	nop
	set	0x0E, %i7
	sth	%l3,	[%l7 + %i7]
	fmovsa	%fcc1,	%f29,	%f12
	nop
	set	0x5A, %o2
	ldsh	[%l7 + %o2],	%i1
	sra	%g2,	%l5,	%o4
	set	0x58, %l5
	lduba	[%l7 + %l5] 0x8a,	%g4
	nop
	set	0x56, %g2
	lduh	[%l7 + %g2],	%i7
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x8b,	 4
	nop
	setx	0x6579829AE0462C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	set	0x3C, %g3
	lduha	[%l7 + %g3] 0x88,	%g5
	ldsh	[%l7 + 0x3A],	%i0
	wr	%g0,	0x11,	%asi
	stda	%i6,	[%l7 + 0x50] %asi
	nop
	set	0x26, %g5
	ldsh	[%l7 + %g5],	%i4
	ldsw	[%l7 + 0x3C],	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x83,	%asi
	casa	[%l6] %asi,	%i5,	%l0
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x88,	%i3
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x82,	 1
	nop
	set	0x18, %g1
	sth	%o3,	[%l7 + %g1]
	stbar
	set	0x48, %i5
	stxa	%i2,	[%l7 + %i5] 0x83
	wr	%g0,	0x82,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o5,	%o7
	wr	%g0,	0x8b,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x30, %i4
	stw	%o0,	[%l7 + %i4]
	set	0x68, %i0
	stda	%o2,	[%l7 + %i0] 0x88
	and	%o6,	0x0853,	%l1
	st	%f0,	[%l7 + 0x24]
	stbar
	mova	%fcc3,	0x46E,	%g7
	set	0x20, %l6
	ldswa	[%l7 + %l6] 0x11,	%l4
	set	0x78, %i1
	lduwa	[%l7 + %i1] 0x10,	%g3
	orncc	%l3,	0x1951,	%g2
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i1,	%o4
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x19,	 1
	wr	%g0,	0x82,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x14] %asi,	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%g6
	ld	[%l7 + 0x48],	%f0
	fmovda	%fcc0,	%f16,	%f14
	nop
	setx	0x1B3B8D2E804EAC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x3C] %asi
	nop
	setx	0x66C6722120495400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	wr	%g0,	0x04,	%asi
	sta	%f22,	[%l7 + 0x68] %asi
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x58] %asi
	membar	#Sync
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x10
	std	%f20,	[%l7 + 0x58]
	wr	%g0,	0x11,	%asi
	sta	%f30,	[%l7 + 0x40] %asi
	nop
	set	0x58, %i6
	stw	%g5,	[%l7 + %i6]
	std	%i4,	[%l7 + 0x08]
	set	0x4E, %o0
	stha	%l6,	[%l7 + %o0] 0xeb
	membar	#Sync
	sth	%i5,	[%l7 + 0x10]
	movrgez	%g1,	0x38B,	%i3
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	movuge	%fcc0,	%o3,	%i2
	set	0x70, %i2
	swapa	[%l7 + %i2] 0x80,	%i6
	set	0x62, %o7
	lduha	[%l7 + %o7] 0x81,	%l0
	edge16	%o5,	%o7,	%o1
	set	0x30, %l1
	ldstuba	[%l7 + %l1] 0x19,	%o0
	nop
	set	0x58, %o1
	stxa	%o6,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x4E, %i3
	ldstuba	[%l7 + %i3] 0x8b,	%o2
	edge32ln	%l1,	%l4,	%g3
	ldd	[%l7 + 0x20],	%g6
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l3,	%l5
	set	0x23, %g7
	stba	%o4,	[%l7 + %g7] 0x0c
	ldd	[%l7 + 0x08],	%i6
	nop
	set	0x1A, %l4
	lduh	[%l7 + %l4],	%i1
	wr	%g0,	0x83,	%asi
	stda	%g4,	[%l7 + 0x08] %asi
	ldd	[%l7 + 0x38],	%f26
	set	0x2C, %i7
	stwa	%g6,	[%l7 + %i7] 0x10
	nop
	set	0x0C, %o2
	stw	%i0,	[%l7 + %o2]
	nop
	set	0x28, %o6
	stw	%g5,	[%l7 + %o6]
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i4
	wr	%g0,	0x2b,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	membar	#Sync
	set	0x3C, %g2
	lduwa	[%l7 + %g2] 0x0c,	%g1
	nop
	set	0x78, %l5
	std	%i6,	[%l7 + %l5]
	ldstub	[%l7 + 0x5A],	%l2
	wr	%g0,	0xea,	%asi
	stwa	%o3,	[%l7 + 0x2C] %asi
	membar	#Sync
	ld	[%l7 + 0x14],	%f31
	ldstub	[%l7 + 0x21],	%i2
	wr	%g0,	0x82,	%asi
	stha	%i6,	[%l7 + 0x08] %asi
	faligndata	%f0,	%f20,	%f6
	lduh	[%l7 + 0x4E],	%l0
	stw	%i3,	[%l7 + 0x74]
	set	0x44, %g3
	lduwa	[%l7 + %g3] 0x83,	%o7
	set	0x20, %g5
	stda	%o0,	[%l7 + %g5] 0x23
	membar	#Sync
	wr	%g0,	0x83,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o0
	ld	[%l7 + 0x5C],	%f24
	set	0x10, %o4
	stda	%o4,	[%l7 + %o4] 0x80
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 0
	edge8n	%o6,	%l1,	%l4
	set	0x6C, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g3
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xca
	nop
	set	0x30, %i4
	prefetch	[%l7 + %i4],	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o2,	%g2
	addccc	%g7,	0x1844,	%l3
	wr	%g0,	0x8b,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 1
	srlx	%i7,	0x05,	%l5
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x83,	%g4
	nop
	set	0x30, %l6
	prefetch	[%l7 + %l6],	 4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
	stbar
	stx	%i1,	[%l7 + 0x10]
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sth	%g5,	[%l7 + 0x1A]
	wr	%g0,	0x0c,	%asi
	sta	%f7,	[%l7 + 0x10] %asi
	wr	%g0,	0x8b,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 4
	nop
	set	0x21, %o3
	ldsb	[%l7 + %o3],	%i5
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f16
	set	0x29, %l2
	stba	%i4,	[%l7 + %l2] 0x2b
	membar	#Sync
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%l6
	wr	%g0,	0x11,	%asi
	stha	%g1,	[%l7 + 0x52] %asi
	sth	%o3,	[%l7 + 0x0E]
	nop
	setx	0x35B75AB5B06CDC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x11,	%l2
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	set	0x40, %o5
	lduha	[%l7 + %o5] 0x88,	%l0
	nop
	set	0x7F, %i2
	ldub	[%l7 + %i2],	%i2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%o7
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x08] %asi,	%o1
	set	0x38, %o7
	ldsha	[%l7 + %o7] 0x18,	%o0
	nop
	setx	0x7068D800,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x82,	%f0
	wr	%g0,	0x23,	%asi
	stwa	%o5,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x37, %i3
	ldub	[%l7 + %i3],	%i3
	set	0x7C, %o1
	lduwa	[%l7 + %o1] 0x8b,	%l1
	set	0x25, %g7
	ldsba	[%l7 + %g7] 0x10,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o6,	%o2
	wr	%g0,	0x04,	%asi
	stba	%g3,	[%l7 + 0x36] %asi
	set	0x76, %l4
	ldstuba	[%l7 + %l4] 0x18,	%g2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l3
	set	0x08, %i7
	swapa	[%l7 + %i7] 0x10,	%g7
	ldd	[%l7 + 0x60],	%f28
	set	0x1C, %l3
	swapa	[%l7 + %l3] 0x80,	%i7
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	set	0x14, %l5
	lduha	[%l7 + %l5] 0x04,	%o4
	set	0x74, %g3
	lda	[%l7 + %g3] 0x83,	%f27
	set	0x70, %g5
	ldstuba	[%l7 + %g5] 0x11,	%g6
	set	0x37, %o4
	ldstuba	[%l7 + %o4] 0x83,	%i1
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x80,	%g5
	wr	%g0,	0x22,	%asi
	stba	%g4,	[%l7 + 0x7A] %asi
	membar	#Sync
	ldstub	[%l7 + 0x5B],	%i5
	wr	%g0,	0x83,	%asi
	ldsha	[%l7 + 0x50] %asi,	%i4
	set	0x40, %g6
	ldswa	[%l7 + %g6] 0x10,	%l6
	fmovsa	%icc,	%f12,	%f1
	stbar
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g1,	%i0
	set	0x6A, %g4
	stha	%o3,	[%l7 + %g4] 0x22
	membar	#Sync
	set	0x3E, %g1
	stha	%i6,	[%l7 + %g1] 0xe3
	membar	#Sync
	wr	%g0,	0x11,	%asi
	stda	%l0,	[%l7 + 0x30] %asi
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l2,	%i2
	nop
	set	0x64, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x58, %i4
	lduwa	[%l7 + %i4] 0x10,	%o7
	mova	%fcc1,	%o0,	%o1
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	setx	0x5FC18728B045E800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 2
	set	0x5C, %l6
	lduwa	[%l7 + %l6] 0x83,	%l1
	std	%i2,	[%l7 + 0x58]
	swap	[%l7 + 0x40],	%o6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd9,	%f0
	wr	%g0,	0x2b,	%asi
	stha	%o2,	[%l7 + 0x28] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x8b,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x8b,	%g3,	%l3
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x81,	%i6
	lduh	[%l7 + 0x40],	%g2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x70] %asi,	%l5
	nop
	set	0x5C, %l0
	prefetch	[%l7 + %l0],	 1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o4,	%g6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x22,	%g4
	nop
	set	0x58, %o5
	swap	[%l7 + %o5],	%g4
	lduh	[%l7 + 0x76],	%i1
	wr	%g0,	0x10,	%asi
	stxa	%i4,	[%l7 + 0x70] %asi
	stx	%i5,	[%l7 + 0x48]
	lduh	[%l7 + 0x4E],	%g1
	nop
	set	0x28, %o0
	stx	%l6,	[%l7 + %o0]
	nop
	set	0x38, %o7
	ldstub	[%l7 + %o7],	%o3
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i0
	set	0x18, %l1
	stwa	%l0,	[%l7 + %l1] 0x2b
	membar	#Sync
	nop
	set	0x59, %i3
	ldstub	[%l7 + %i3],	%i6
	nop
	set	0x58, %i2
	stx	%l2,	[%l7 + %i2]
	set	0x7B, %o1
	ldsba	[%l7 + %o1] 0x8b,	%o7
	set	0x1C, %l4
	ldsha	[%l7 + %l4] 0x89,	%i2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
	wr	%g0,	0x88,	%asi
	sta	%f18,	[%l7 + 0x2C] %asi
	ldsh	[%l7 + 0x66],	%o1
	wr	%g0,	0xeb,	%asi
	stwa	%o5,	[%l7 + 0x6C] %asi
	membar	#Sync
	set	0x54, %g7
	ldswa	[%l7 + %g7] 0x88,	%i3
	ld	[%l7 + 0x14],	%f10
	lduh	[%l7 + 0x0E],	%l1
	nop
	set	0x78, %l3
	stx	%o2,	[%l7 + %l3]
	set	0x48, %o2
	lda	[%l7 + %o2] 0x8b,	%f22
	srlx	%o6,	%l4,	%l3
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xcc
	set	0x70, %i7
	sta	%f2,	[%l7 + %i7] 0x8a
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%i7
	set	0x26, %g3
	lduha	[%l7 + %g3] 0x89,	%g2
	set	0x56, %l5
	stba	%l5,	[%l7 + %l5] 0x82
	nop
	set	0x46, %o4
	sth	%o4,	[%l7 + %o4]
	set	0x14, %g2
	sta	%f18,	[%l7 + %g2] 0x04
	wr	%g0,	0x82,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g6
	sth	%g5,	[%l7 + 0x3C]
	nop
	set	0x20, %g5
	sth	%g3,	[%l7 + %g5]
	set	0x14, %g4
	lda	[%l7 + %g4] 0x8b,	%f15
	ldsb	[%l7 + 0x46],	%g4
	set	0x6C, %g1
	lduwa	[%l7 + %g1] 0x89,	%i1
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x89,	%i4
	fmovda	%icc,	%f8,	%f20
	set	0x60, %i4
	stxa	%g1,	[%l7 + %i4] 0x2f
	membar	#Sync
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i5
	set	0x40, %i0
	stda	%o2,	[%l7 + %i0] 0x82
	ld	[%l7 + 0x08],	%f5
	ldub	[%l7 + 0x0D],	%i0
	nop
	setx	0xB59C78C580585000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	set	0x1A, %i5
	ldstub	[%l7 + %i5],	%l6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x19,	%f0
	nop
	set	0x47, %o3
	stba	%i6,	[%l7 + %o3] 0x04
	set	0x28, %i1
	sta	%f30,	[%l7 + %i1] 0x04
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x82,	%l2
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x0c,	%l0
	set	0x6A, %i6
	ldsha	[%l7 + %i6] 0x82,	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x83,	%f16
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x18
	movrne	%o0,	%o1,	%o5
	nop
	setx	0x10734C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x11,	 0
	nop
	setx	0xAE46BDC80589C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movu	%fcc1,	0x558,	%l1

	ta T_CHANGE_HPRIV

	/* Now, set one of the TTE's to have W=0 */
	setx	page_0, %i0, %g1
	set	2, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  1, %i2
        sllx %i2, 63, %i2
        ! Set cacheable in physical 
        or %i2, 0x400, %i2
        ! Now set up PA [39:13] only
	setx	page_2, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	ta T_CHANGE_NONHPRIV

	/* More testing */
	set	0x38, %o4
	lduwa	[%l7 + %o4] 0x88,	%l2
	set	0x55, %o6
	stba	%l6,	[%l7 + %o6] 0xeb
	membar	#Sync
	wr	%g0,	0xeb,	%asi
	stwa	%i2,	[%l7 + 0x34] %asi
	membar	#Sync
	fmovsa	%fcc2,	%f5,	%f0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o7
	stbar
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i1
	set	0x0C, %l3
	lduwa	[%l7 + %l3] 0x82,	%l4
	st	%f12,	[%l7 + 0x60]
	wr	%g0,	0xdb,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x22,	%i4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x09] %asi,	%g3
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x78] %asi
	wr	%g0,	0x2a,	%asi
	stha	%o2,	[%l7 + 0x32] %asi
	membar	#Sync
	ldstub	[%l7 + 0x32],	%o0
	wr	%g0,	0x8a,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x88,	 4
	wr	%g0,	0x8a,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g1
	set	0x23, %l6
	ldsba	[%l7 + %l6] 0x83,	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g2,	%o1
	wr	%g0,	0x18,	%asi
	stxa	%o5,	[%l7 + 0x20] %asi
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x89,	%i4
	ldx	[%l7 + 0x78],	%g4
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x82,	 2
	set	0x5C, %i1
	stwa	%l5,	[%l7 + %i1] 0xeb
	membar	#Sync
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%l1
	sra	%o3,	%g6,	%l0
	nop
	setx	0x1BA4,	%l0,	%o6
	sdivcc	%i0,	%o6,	%o4
	nop
	setx	0x2D54453870639000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 2
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x8b,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%l6
	set	0x50, %o0
	stwa	%o7,	[%l7 + %o0] 0x27
	membar	#Sync
	ldstub	[%l7 + 0x5C],	%i1
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%i3
	ldd	[%l7 + 0x38],	%f2
	movgu	%xcc,	0x02E,	%l4
	set	0x28, %l4
	stda	%i4,	[%l7 + %l4] 0x19
	set	0x32, %g5
	ldsha	[%l7 + %g5] 0x11,	%o2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 1
	wr	%g0,	0x23,	%asi
	stxa	%g3,	[%l7 + 0x78] %asi
	membar	#Sync
	nop
	set	0x24, %i5
	stw	%i7,	[%l7 + %i5]
	nop
	setx	0xE058C000,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	wr	%g0,	0x83,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	nop
	set	0x10, %o2
	lduw	[%l7 + %o2],	%g5
	ldsh	[%l7 + 0x6E],	%g2
	fmovda	%fcc3,	%f12,	%f28
	nop
	set	0x2A, %g1
	stb	%o1,	[%l7 + %g1]
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x63] %asi,	%g1
	mova	%xcc,	0x518,	%o5
	set	0x56, %g2
	lduha	[%l7 + %g2] 0x11,	%i4
	nop
	set	0x44, %o1
	stba	%g4,	[%l7 + %o1] 0x11
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	set	0x64, %o5
	stha	%l5,	[%l7 + %o5] 0x11
	movge	%xcc,	0x384,	%l1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x65] %asi,	%o3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 3
	ldub	[%l7 + 0x56],	%l0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x5D] %asi,	%i0
	set	0x0A, %i6
	stba	%l3,	[%l7 + %i6] 0x82
	nop
	setx	0x1F6D0FEBB05A8000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge16l	%o6,	%o4,	%l2
	stbar
	srlx	%i2,	%l6,	%o7
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xda
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%g7
	wr	%g0,	0x83,	%asi
	lda	[%l7 + 0x68] %asi,	%f31
	nop
	set	0x20, %i4
	ldsh	[%l7 + %i4],	%i3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o2
	set	0x1E, %g6
	ldsha	[%l7 + %g6] 0x82,	%o0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%i7
	wr	%g0,	0x83,	%asi
	lda	[%l7 + 0x6C] %asi,	%f26
	nop
	setx	0xFD24E88440701800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ldd	[%l7 + 0x40],	%f22
	wr	%g0,	0x81,	%asi
	stba	%i6,	[%l7 + 0x25] %asi
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x11,	%g5
	ldd	[%l7 + 0x30],	%f14
	stw	%g3,	[%l7 + 0x10]
	nop
	set	0x40, %l0
	stx	%g2,	[%l7 + %l0]
	set	0x66, %l1
	ldstuba	[%l7 + %l1] 0x8a,	%o1
	movrlz	%g1,	0x1C7,	%i4
	nop
	set	0x14, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x38, %o4
	stba	%g4,	[%l7 + %o4] 0x82
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%l5
	set	0x60, %o6
	stxa	%o3,	[%l7 + %o6] 0x8a
	nop
	set	0x41, %l3
	stb	%g6,	[%l7 + %l3]
	set	0x40, %l2
	stxa	%l0,	[%l7 + %l2] 0xe3
	membar	#Sync
	ldsh	[%l7 + 0x18],	%i0
	ldstub	[%l7 + 0x0D],	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%l1
	nop
	set	0x48, %g7
	std	%f26,	[%l7 + %g7]
	ldsw	[%l7 + 0x3C],	%l2
	sth	%o4,	[%l7 + 0x34]
	lduw	[%l7 + 0x1C],	%l6
	nop
	setx	0xC066D400,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i2,	%o7
	wr	%g0,	0xd3,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f18
	wr	%g0,	0x04,	%asi
	stha	%g7,	[%l7 + 0x68] %asi
	wr	%g0,	0x8a,	%asi
	sta	%f12,	[%l7 + 0x5C] %asi
	smulcc	%i3,	%l4,	%i1
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x18,	%o2
	set	0x78, %o7
	stwa	%o0,	[%l7 + %o7] 0xeb
	membar	#Sync
	wr	%g0,	0x88,	%asi
	sta	%f24,	[%l7 + 0x60] %asi
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x13] %asi,	%i7
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%i4
	prefetch	[%l7 + 0x08],	 2
	sra	%g5,	%i6,	%g2
	set	0x36, %i1
	ldsha	[%l7 + %i1] 0x11,	%o1
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i4
	wr	%g0,	0x83,	%asi
	stxa	%o5,	[%l7 + 0x60] %asi
	ldsw	[%l7 + 0x28],	%g4
	set	0x48, %i3
	stba	%l5,	[%l7 + %i3] 0x8a
	nop
	set	0x7C, %o0
	ldsw	[%l7 + %o0],	%g3
	set	0x60, %l4
	lduwa	[%l7 + %l4] 0x81,	%g6
	wr	%g0,	0x82,	%asi
	stxa	%o3,	[%l7 + 0x38] %asi
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f2
	set	0x1D, %i5
	stba	%i0,	[%l7 + %i5] 0x11
	wr	%g0,	0x8b,	%asi
	stba	%l3,	[%l7 + 0x4E] %asi
	nop
	set	0x0B, %o2
	ldsb	[%l7 + %o2],	%l1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x83,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%o4
	set	0x66, %g1
	lduha	[%l7 + %g1] 0x19,	%l2
	membar	0x4B
	fmovsa	%icc,	%f24,	%f21
	set	0x20, %g2
	stda	%i2,	[%l7 + %g2] 0x80
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6E] %asi,	%l6
	wr	%g0,	0x83,	%asi
	stha	%g7,	[%l7 + 0x4C] %asi
	fmovda	%fcc1,	%f28,	%f20
	nop
	set	0x10, %o1
	prefetch	[%l7 + %o1],	 4
	srl	%i3,	%o7,	%i1
	set	0x38, %o5
	stda	%l4,	[%l7 + %o5] 0x81
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x68] %asi
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x42] %asi,	%o0
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xea,	%i6
	nop
	setx	0x3ED4B4B3705AB800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	set	0x52, %i6
	lduh	[%l7 + %i6],	%i5
	set	0x46, %i4
	ldsba	[%l7 + %i4] 0x10,	%g5
	stbar
	edge32n	%o2,	%g2,	%i6
	nop
	set	0x60, %g3
	std	%g0,	[%l7 + %g3]
	ldub	[%l7 + 0x42],	%o1
	set	0x24, %g4
	lduba	[%l7 + %g4] 0x18,	%o5
	set	0x7C, %g6
	lduwa	[%l7 + %g6] 0x10,	%g4
	set	0x78, %l0
	ldsba	[%l7 + %l0] 0x83,	%l5
	lduw	[%l7 + 0x20],	%i4
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x89,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g6,	%o3
	wr	%g0,	0xea,	%asi
	stwa	%l0,	[%l7 + 0x0C] %asi
	membar	#Sync
	movvs	%icc,	%i0,	%l1
	ldstub	[%l7 + 0x63],	%l3
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x0A] %asi,	%o4
	set	0x30, %o4
	ldxa	[%l7 + %o4] 0x11,	%o6
	stbar
	fmovsa	%fcc1,	%f21,	%f26
	stx	%i2,	[%l7 + 0x70]
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%l2
	set	0x6C, %i0
	stwa	%g7,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x78, %o6
	lda	[%l7 + %o6] 0x8a,	%f21
	ldsb	[%l7 + 0x16],	%l6
	set	0x34, %l3
	lda	[%l7 + %l3] 0x83,	%f13
	wr	%g0,	0x82,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o7
	nop
	set	0x2B, %l2
	ldstub	[%l7 + %l2],	%i1
	std	%f22,	[%l7 + 0x10]
	nop
	set	0x2C, %g7
	lduw	[%l7 + %g7],	%i3
	sth	%l4,	[%l7 + 0x64]
	set	0x0C, %l6
	sta	%f10,	[%l7 + %l6] 0x80
	nop
	setx	0xC7763EB7D0566400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x28, %o7
	stxa	%o0,	[%l7 + %o7] 0x0c
	set	0x3C, %o3
	ldswa	[%l7 + %o3] 0x81,	%i7
	nop
	setx	0xD744709250575C00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	set	0x2C, %i1
	lduha	[%l7 + %i1] 0x04,	%g5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i5
	mova	%icc,	0x227,	%g2
	ldstub	[%l7 + 0x36],	%g1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%i6
	std	%o0,	[%l7 + 0x18]
	set	0x48, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o5
	wr	%g0,	0x8b,	%asi
	stba	%l5,	[%l7 + 0x6B] %asi
	set	0x18, %o0
	stha	%g4,	[%l7 + %o0] 0x27
	membar	#Sync
	std	%g2,	[%l7 + 0x30]
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%i4
	set	0x20, %g5
	stwa	%g6,	[%l7 + %g5] 0xe3
	membar	#Sync
	lduh	[%l7 + 0x18],	%l0
	wr	%g0,	0x8b,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i0
	nop
	set	0x10, %l4
	std	%l0,	[%l7 + %l4]
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x19,	%o3

	ta T_CHANGE_HPRIV

	/* Now, set one of the TTE's to have NFO=1 */
	setx	page_0, %i0, %g1
	set	2, %g2
	or	%g1, %g2, %g3
	mov	0x30, %i1
	stxa	%g3, [%i1 + %g0] 0x58

        ! First set valid bit
        add  %g0,  3, %i2
        sllx %i2, 62, %i2
        ! Set cacheable in physical and writeable
        or %i2, 0x440, %i2
        ! Now set up PA [39:13] only
	setx	page_2, %i0, %g1
        srlx %g1, 13, %i5
        sllx %i5, 37, %i5
        srlx %i5, 24, %i5
        ! Now merge them
        or %i2, %i5, %i2
        
        ! Write it to dtlb_data_in register
        ! ASI 0x5C, address with bit 10 set (for sun4v)
        mov  0x400, %i3
        stxa %i2, [%i3 + %g0] 0x5C
        
	ta T_CHANGE_NONHPRIV

        set     0x2A, %i6
        ldsha   [%l7 + %i6] 0x89,       %l3
        set     0x26, %g1
        stha    %o4,    [%l7 + %g1] 0x81
        set     0x68, %g7
        ldswa   [%l7 + %g7] 0x81,       %l6
        set     0x48, %l4
        lda     [%l7 + %l4] 0x8a,       %f20
        set     0x09, %l5
        lduba   [%l7 + %l5] 0x82,       %o0
        set     0x30, %g6
        ldxa    [%l7 + %g6] 0x83,       %i3
        set     0x60, %o5
        ldxa    [%l7 + %o5] 0x83,       %l6
        set     0x08, %i5
        lda     [%l7 + %i5] 0x8b,       %f23
        set     0x27, %g5
        lduba   [%l7 + %g5] 0x88,       %g2
        wr      %g0,    0x88,   %asi
        sta     %f11,   [%l7 + 0x74] %asi
        set     0x60, %i1
        stxa    %i1,    [%l7 + %i1] 0x82
        set     0x1C, %l1
        stha    %l6,    [%l7 + %l1] 0x81
        set     0x28, %i4
        stda    %g2,    [%l7 + %i4] 0x83
        wr      %g0,    0x8b,   %asi
        stda    %o2,    [%l7 + 0x50] %asi
        wr      %g0,    0x80,   %asi
        stxa    %l3,    [%l7 + 0x18] %asi
        set     0x34, %o6
        ldswa   [%l7 + %o6] 0x80,       %g1
        set     0x52, %g2
        stha    %i6,    [%l7 + %g2] 0x8a

	ldda	[%l7 + %g0] 0xf1, %f0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1, %f0
	set	0x80, %g1
	ldda	[%l7 + %g1] 0xf1, %f0

	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
page_0:
.word 0x9FA10F4B
.word 0x0F82EF5F
.word 0xF5888ED7
.word 0x37A23193
.word 0x0EE3EE96
.word 0xB2A151B3
.word 0x1E352092
.word 0x06AD73DF
.word 0x4C257678
.word 0xFECECC81
.word 0xF25CF485
.word 0x379F844A
.word 0x0D245C03
.word 0x77D5EB10
.word 0x4130D0E2
.word 0x824DD513
.word 0xFC48966C
.word 0x96C60D17
.word 0x071F376A
.word 0xB3E4B82D
.word 0x4302DFB8
.word 0xC48F3715
.word 0x3EE9C606
.word 0xDEC90AC1
.word 0x6D7F88D5
.word 0x3B595978
.word 0xC8C78A04
.word 0x7FDF80CC
.word 0xEC8BA253
.word 0xC59CEBBB
.word 0x5F8F62EF
.word 0x431CB8D7
.word 0xF53F9DB0
.word 0xF0A52175
.word 0x11746C02
.word 0x48990E55
.word 0xA61C0CC3
.word 0x89E8A4E6
.word 0x6726D6E7
.word 0x306186A9
.word 0xD0AF0665
.word 0xEED7E000
.word 0xB1BAD8D7
.word 0xD469F929
.word 0x7394F857
.word 0x1FC059FE
.word 0x117B2FB0
.word 0x13415EB4
.word 0xA8C96D48
.word 0x1C3FA454
.word 0x8FD559E3
.word 0x71D6649C
.word 0x934A6A59
.word 0xF2253105
.word 0xB03E91AD
.word 0xB792D3D3
.word 0x80B4E890
.word 0x1560CC5D
.word 0x42802908
.word 0x35AEE0CD
.word 0x89294A98
.word 0x816B2F95
.word 0xB66405F2
.word 0x171EF859
.word 0xC34555D4
.word 0x320A993F
.word 0xFA9CB44F
.word 0xCDAE4FAB
.word 0xE8017F60
.word 0x98086B17
.word 0xF9BE4D63
.word 0xC543725A
.word 0xFF90C40F
.word 0x681F6D1D
.word 0x21DFE501
.word 0x2FF0436D
.word 0x6B37E200
.word 0xBE3124F9
.word 0x8F5A3B47
.word 0xF783BF8F
.word 0x24F6FC34
.word 0xAC9A0363
.word 0x50CC0330
.word 0xF6DC1178
.word 0x08223208
.word 0xE7C08394
.word 0xB520954C
.word 0x7C3C51C5
.word 0xF887AC7E
.word 0x8C24D324
.word 0x1DEC663D
.word 0x2A41F3F2
.word 0xE442DFE4
.word 0xE6AE464C
.word 0x77BDAC24
.word 0x38AF1A5E
.word 0xD8F07CB9
.word 0xB269E423
.word 0xF977A68D
.align 8192
page_1:
.word 0xFF5AA8FE
.word 0x42FABD79
.word 0xC8FFBA88
.word 0x91B9C965
.word 0x0D5C83B3
.word 0xC1C74187
.word 0x391DF0A3
.word 0xEF5C97ED
.word 0x8895D3F5
.word 0x9D93A995
.word 0x9C476DFC
.word 0xB0434B64
.word 0x46FE862C
.word 0x2FF7FE5F
.word 0xDEB9FDEA
.word 0x6CD7BEEF
.word 0x2F8949FF
.word 0x666928E6
.word 0x4F7EF88E
.word 0xEBCC55C7
.word 0x9577B555
.word 0x25E6F198
.word 0xC9E06195
.word 0x1A7116BF
.word 0x209A9D9E
.word 0x8687FFB3
.word 0x45EC54E3
.word 0x40A0F0DD
.word 0x92584D98
.word 0xC3844BB8
.word 0x7525D073
.word 0xF8D2BC3F
.word 0xD8B678BE
.word 0x916185DF
.word 0x4C66B040
.word 0x99482FF8
.word 0x6DB807C5
.word 0x1C3A8269
.word 0x8B32555F
.word 0x06C705BC
.word 0x91111C9E
.word 0xB0460430
.word 0xDFF85A02
.word 0xBE02E712
.word 0x6054F6EB
.word 0x429FABFA
.word 0x32B360B7
.word 0xA684E977
.word 0x38198047
.word 0xFBD66CC7
.word 0x6CA0AAF6
.word 0x4ABD0F09
.word 0xF9AFB420
.word 0x7DC93795
.word 0x4CBDA81A
.word 0xEDFEF356
.word 0x46CF198E
.word 0xA7E0CF9C
.word 0x15972D3C
.word 0xE2C2436D
.word 0x11493B28
.word 0xBBD9BA74
.word 0xB7949457
.word 0x1FF70D7D
.word 0xBD9B1691
.word 0x3F555205
.word 0xB361FCE9
.word 0x892300A7
.word 0xD8EF7706
.word 0x3104A33D
.word 0x664EFE87
.word 0x5BDCF974
.word 0x0778B172
.word 0x8251EFF7
.word 0x91997E66
.word 0x86EB8A19
.word 0x4B97D36C
.word 0x1095546F
.word 0x8AE7298C
.word 0x2B46232B
.word 0x1A177396
.word 0x39ACF7B0
.word 0x5715399D
.word 0x68FB0264
.word 0x6E382F17
.word 0x98A0C3F7
.word 0x9499022F
.word 0x8A618504
.word 0x94F00F1A
.word 0x7AB9B1AC
.word 0xBBA48653
.word 0xDD8CB9E4
.word 0x467CF4A5
.word 0x456AE15F
.word 0x474BB986
.word 0x53747440
.align 8192
page_2:
.word 0xF7E83D13
.word 0xF9BE4D63
.word 0xC543725A
.word 0xED56BB36
.word 0x382D38C2
.word 0x771392E0
.word 0xDBBC15BF
.word 0xF79BDB88
.word 0x272BBC65
.word 0xBBFE5B32
.word 0x66D0EC45
.word 0xB627C0EC
.word 0xC5F1EF77
.word 0x07EAA2C1
.word 0x5A989869
.word 0xA49631FC
.word 0xB12B9405
.word 0xD82B7C62
.word 0x29389553
.word 0xC8E409F9
.word 0x1508ECF5
.word 0x8F50351A
.word 0x931A9BE3
.word 0x65CC9635
.word 0xF9C9C91C
.word 0x1267A614
.word 0x9762DB3C
.word 0x86BC1692
.word 0x7AC54092
.word 0xFC636E2E
.word 0x3C9B0FAD
.word 0xC11B7F1C
.word 0x9E2751F1
.word 0xB450EB67
.word 0xF8DDEF81
.word 0x6C33E2B1
.word 0xFC7A0424
.word 0x1531F50C
.word 0x28C3EC2B
.word 0xEB38C1F4
.word 0x51C983E2
.word 0xB2202FFC
.word 0x29F00D7F
.word 0xEA668046
.word 0xB28D1B2D
.word 0x42C61FCF
.word 0xD9BF1AEE
.word 0x6D8FC883
.word 0x0D03268A
.word 0x9CF88B1D
.word 0x06CA2130
.word 0x2160BC69
.word 0xEF40B943
.word 0xFEC35CA7
.word 0xA5012A9D
.word 0x9211D67F
.word 0x4D0435F2
.word 0xF9DB3FD3
.word 0x08C8C8CA
.word 0xFE8D6CF7
.word 0x9AA3B478
.word 0x614C5B50
.word 0x53292F1D
.word 0xED0096F2
.word 0xF82B1BEF
.word 0xB692DFA6
.word 0xC70CF366
.word 0x8F916D63
.word 0x76F86472
.word 0x16D79295
.word 0x3F506949
.word 0x48667794
.word 0x665D46D4
.word 0x6F73F1BE
.word 0x44A16FD3
.word 0xFD67A866
.word 0xD5FCF437
.word 0x2903D8B2
.word 0x2CE637F7
.word 0x9BD9A7C0
.word 0xBE2AA72A
.word 0x088C53DD
.align 8192
page_3:
.word 0xDCA9B471
.word 0x05DDA017
.word 0x6E6AF6BF
.word 0xB36B12BB
.word 0x33F52247
.word 0x88C65740
.word 0x64C99298
.word 0x3C9B0FAD
.word 0xC11B7F1C
.word 0x9E2751F1
.word 0xB450EB67
.word 0xF8DDEF81
.word 0x6C33E2B1
.word 0xFC7A0424
.word 0x351BCB2B
.word 0x0767FE5E
.word 0x7847E3A0
.word 0xFA02BAFE
.word 0xAFCD199B
.word 0x24E6228F
.word 0xF344A93E
.word 0xC5555039
.word 0x6DC94F49
.word 0xA5B8778C
.word 0xDA6422A1
.word 0x4B553F07
.word 0x0E65E792
.word 0x42EAAB90
.word 0x0F4B301A
.word 0x5012143F
.word 0x116EC5CD
.word 0x5595B55F
.word 0x55B9948C
.word 0x1EE5170D
.word 0xA3EEBF72
.word 0x3F747FA9
.align 8192
page_4:
.word 0x5C55F988
.word 0x27B11F1E
.word 0xAF8A4B40
.word 0x80D2A6EE
.word 0x764D38CB
.word 0xA5E6CDC6
.word 0x4AC4AC86
.word 0xE010649C
.word 0x393568AF
.word 0x013ABB43
.word 0x52093A60
.word 0x8054A3AC
.word 0xE3742198
.word 0x2A505D31
.word 0xA3042B9C
.word 0x8C204E46
.word 0xB4F4C981
.word 0x3E735F0E
.word 0xDB2EC566
.word 0x3B343A7C
.word 0xE7EF4E60
.word 0x322AB575
.word 0x40DEB56E
.word 0xBD421B2D
.word 0x21610DA9
.word 0xB3B20845
.word 0x4E02661E
.word 0xBD4F1F72
.word 0x9041403A
.word 0x5EB60B2F
.word 0x0C2C17E5
.word 0xB9E47075
.word 0x8C330220
.word 0x0D154BA9
.word 0x6DCC6086
.word 0x90164DEE
.word 0xB50143E5
.align 8192
page_5:
.word 0x5C01AFED
.word 0xE05881BB
.word 0x14215C04
.word 0xE3DBB86F
.word 0x0D0B3AF8
.word 0x8AC0CE2D
.word 0xC29F7644
.word 0x51A97264
.word 0x9583F216
.word 0x5FF93848
.word 0x6FE0F1E7
.word 0xE9B13480
.word 0x9383A344
.word 0x6A4F0122
.word 0x7F4B80D8
.word 0x4BF1ED67
.word 0x7A02202E
.word 0xF996253F
.align 8192
page_6:
.word 0x7C1D8200
.word 0x73595043
.word 0x1A811540
.word 0x472340A6
.word 0xA598EE44
.word 0x3A216234
.word 0xF0F78871
.word 0x2536D2F3
.word 0x33A451AD
.word 0x84FF25B1
.word 0x84B64D72
.word 0xDAC47452
.word 0x83ADCAA8
.word 0xE925A8BE
.word 0x2E0D4262
.word 0xFB238555
.word 0xB52E8698
.align 8192
page_7:
.word 0xE658D8F3
.word 0x83050143
.word 0xB5CD1224
.word 0xE693148A
.word 0xDC2A44F0
.word 0xB3A0BADA
.word 0x14215C04
.word 0xE3DBB86F
.word 0x0D0B3AF8
.word 0x8AC0CE2D
.word 0xC29F7644
.word 0x51A97264
.word 0x9583F216
.word 0x5FF93848
.word 0x6FE0F1E7
.word 0xE9B13480
.word 0x9383A344
.word 0x6A4F0122
.word 0x7F4B80D8
.word 0x4BF1ED67
.end
