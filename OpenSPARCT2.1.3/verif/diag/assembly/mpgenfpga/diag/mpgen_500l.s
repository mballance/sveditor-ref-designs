/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_500l.s
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
!	Niagara2 UP Random Test
!	Seed = 626115435
!	Riesling can be on
!	1 Thread, 500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_500.s created on Jun 26, 2009 (11:54:35)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_500 -p 1 -l 500

#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler

#define	MAIN_PAGE_NUCLEUS_ALSO
#define	MAIN_PAGE_HV_ALSO
#define	N_CPUS	1
#define	ENABLE_T0_Fp_exception_ieee_754_0x21
#define	ENABLE_T0_Fp_exception_other_0x22
#define	ENABLE_T0_Fp_disabled_0x20
#define	ENABLE_T0_Illegal_instruction_0x10
#define	ENABLE_T1_Illegal_instruction_0x10
#define	ENABLE_HT0_Illegal_instruction_0x10
#define	ENABLE_HT1_Illegal_instruction_0x10
#define	ENABLE_T0_Clean_Window_0x24
#define	THREAD_COUNT	1
#define	THREAD_STRIDE	1
#define	SKIP_TRAPCHECK
#define USE_MPGEN_TRAPS

#include "hboot.s"

	.text
	.global	main
main:

!	Initialize the input and output registers

!	Random code for Thread 0

thread_0:
	ta	T_CHANGE_PRIV		! Trap to Supervisor Mode
	set	p0_fsr,%g3
	ldx	[%g3],%fsr		! Set %fsr to 0000000000
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi		! Setting default %asi to 80

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
!	%f0  = 1feb9920 04bc80b1 125c5b5e 512abb37
!	%f4  = 302e600c 2f00e86d 11891eaa 5277f1d3
!	%f8  = 15e1eab8 1d85ace9 4e73d3b6 64093b2f
!	%f12 = 5a7e8524 12426a25 31c42682 152c134b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 1f7e3b50 7b117c21 33c1830e 5f76b627
!	%f20 = 2308d93c 082bfedd 5b5f155a 52241fc3
!	%f24 = 745feae8 5b65ce59 7b07c966 6c300c1f
!	%f28 = 640abc54 2c298695 172a4b32 6132f73b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 7bc25980 7c348391 228506be 44fe1d17
!	%f36 = 0a1d8e6c 3912e14d 7c32280a 59f779b3
!	%f40 = 0dfce718 665b7bc9 5b739b16 7e35c90f
!	%f44 = 0db6af84 2cabef05 153f0be2 735c872b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xc4ff7fb40000002c,%g7,%g1 ! %gsr scale =  5, align = 4
	wr	%g1,%g0,%gsr		! %gsr = c4ff7fb40000002c

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 4e67193a, %l4 = 000000002cdd2ada
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 000000004e67193a
!	Mem[0000000030141400] = 275bf5f0, %l3 = 64fd607dec39e9ff
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000027
!	%l3 = 0000000000000027, Mem[0000000010101420] = 08fae4f8, %asi = 80
	stha	%l3,[%i4+0x020]%asi	! Mem[0000000010101420] = 0027e4f8
!	%f12 = 5a7e8524 12426a25, Mem[0000000010081408] = dea8ff23 b7629264
	stda	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = 5a7e8524 12426a25
!	%l1 = 39dbf07f4468fb79, Mem[0000000010081400] = a03ad272
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = a03afb79
!	%l5 = a6a1dfc9bdd1f0c5, Mem[0000000010141400] = 436b8bc0
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = c56b8bc0
!	%l2 = 36426d0308588b34, Mem[0000000010181408] = 5ef67976
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 5ef68b34
!	%f24 = 745feae8, Mem[0000000030181400] = 503e2a2b
	sta	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = 745feae8
!	%f18 = 33c1830e 5f76b627, Mem[0000000030181408] = 0ede2c4c 27c5df08
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 33c1830e 5f76b627
!	%l3 = 0000000000000027, Mem[000000001000141c] = 136fb193
	stw	%l3,[%i0+0x01c]		! Mem[000000001000141c] = 00000027

p0_label_2:
!	Starting 10 instruction Load Burst
!	%f14 = 31c42682 152c134b, Mem[0000000010081408] = 256a4212 24857e5a
	stda	%f14,[%i2+%o4]0x80	! Mem[0000000010081408] = 31c42682 152c134b
!	%l4 = 000000004e67193a, %l2 = 36426d0308588b34, %l4 = 000000004e67193a
	xnor	%l4,%l2,%l4		! %l4 = c9bd92fcb9c06df1
!	Mem[0000000010041428] = 670d79d6410df4cf, %f12 = 5a7e8524 12426a25
	ldd	[%i1+0x028],%f12	! %f12 = 670d79d6 410df4cf
!	Mem[0000000010141410] = 8da6b10dac54787c, %l4 = c9bd92fcb9c06df1
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = 8da6b10dac54787c
!	Code Fragment 3, seed = 620235
p0_fragment_1:
!	%l0 = c6b1be98b43fb7ce
	setx	0x0edb383779737cce,%g7,%l0 ! %l0 = 0edb383779737cce
!	%l1 = 39dbf07f4468fb79
	setx	0x6283b331e275b079,%g7,%l1 ! %l1 = 6283b331e275b079
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0edb383779737cce
	setx	0xeb9a9c15ceab3034,%g7,%l0 ! %l0 = eb9a9c15ceab3034
!	%l1 = 6283b331e275b079
	setx	0x21d9ef5252af7eff,%g7,%l1 ! %l1 = 21d9ef5252af7eff
p0_fragment_1_end:
!	Mem[0000000030101400] = 557b9d90, %l0 = eb9a9c15ceab3034
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 00000000557b9d90
!	Mem[00000000300c1400] = 3035317c, %l7 = b83dc1e18fbe67cb
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 000000000000007c
!	Mem[00000000100c1400] = 0180bb00, %l5 = a6a1dfc9bdd1f0c5
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000180
!	Mem[0000000030041408] = 2efd260b, %f29 = 2c298695
	lda	[%i1+%o4]0x89,%f29	! %f29 = 2efd260b
!	Mem[0000000030001408] = e7d95e17 ceb9a36e, %l2 = 08588b34, %l3 = 00000027
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000ceb9a36e 00000000e7d95e17

p0_label_3:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 1e227313, %l3 = 00000000e7d95e17
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 000000001e227313
!	Mem[00000000100c1408] = 3fce143e, %l1 = 0000000052af7eff
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 000000003fce143e
!	%f13 = 410df4cf, Mem[00000000300c1410] = 1a9b791c
	sta	%f13,[%i3+%o5]0x81	! Mem[00000000300c1410] = 410df4cf
!	%l4 = 8da6b10dac54787c, Mem[00000000100c1410] = 161ba7ec
	stba	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 7c1ba7ec
!	Mem[0000000010081400] = a03afb79, %l6 = f24ee6cf30926ec0
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000079
!	%f26 = 7b07c966 6c300c1f, Mem[0000000010001410] = ccaca167 2d0a906e
	stda	%f26,[%i0+%o5]0x88	! Mem[0000000010001410] = 7b07c966 6c300c1f
!	Mem[0000000030181408] = 27b6765f, %l2 = 00000000ceb9a36e
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000027b6765f
!	Mem[000000001004141c] = 01189973, %l5 = 0000000000000180, %asi = 80
	swapa	[%i1+0x01c]%asi,%l5	! %l5 = 0000000001189973
!	%l7 = 000000000000007c, immd = 00000272, %y  = 00000000
	umul	%l7,0x272,%l0		! %l0 = 0000000000012f38, %y = 00000000
!	%l6 = 00000079, %l7 = 0000007c, Mem[00000000300c1408] = 78c9d3ee 7765b787
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000079 0000007c

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7e24bcd0, %l0 = 0000000000012f38
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000007e24
!	Mem[0000000010101400] = 17412b60553b61f1, %f28 = 640abc54 2efd260b
	ldda	[%i4+%g0]0x80,%f28	! %f28 = 17412b60 553b61f1
!	Mem[0000000010141408] = fe3af336, %l1 = 000000003fce143e
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = fffffffffffff336
!	Mem[0000000030001400] = e1e1a712109c652a, %l4 = 8da6b10dac54787c
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = e1e1a712109c652a
!	Mem[00000000100c1400] = 0180bb00, %l3 = 000000001e227313
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 000000000180bb00
!	%l6 = 0000000000000079, immd = 000008be, %y  = 00000000
	umul	%l6,0x8be,%l4		! %l4 = 00000000000421ce, %y = 00000000
!	Mem[0000000030041408] = 0b26fd2e, %l6 = 0000000000000079
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000b26
!	Mem[0000000010141410] = 7c7854ac, %f1  = 04bc80b1
	lda	[%i5+%o5]0x80,%f1 	! %f1 = 7c7854ac
!	Mem[0000000010041410] = 2792bb2c0bf0630d, %f30 = 172a4b32 6132f73b
	ldda	[%i1+%o5]0x80,%f30	! %f30 = 2792bb2c 0bf0630d
!	%l7 = 000000000000007c, immd = fffffc97, %y  = 00000000
	sdiv	%l7,-0x369,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 00007e24

p0_label_5:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 722ecf7c, %l2 = 0000000027b6765f
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000722ecf7c
!	%l0 = 00007e24, %l1 = fffff336, Mem[0000000010081438] = 61b65c02 033602cb, %asi = 80
	stda	%l0,[%i2+0x038]%asi	! Mem[0000000010081438] = 00007e24 fffff336
!	%l4 = 0000000000000000, Mem[0000000030101400] = 557b9d902c76ed61
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f29 = 553b61f1, %f24 = 745feae8, %f16 = 1f7e3b50
	fdivs	%f29,%f24,%f16		! %f16 = 20563af7
!	%l4 = 00000000, %l5 = 01189973, Mem[0000000010081400] = fffb3aa0 5c35ac31
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 01189973
!	%l4 = 0000000000000000, Mem[0000000030141408] = 71326aae
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00326aae
!	Mem[0000000030181400] = e8ea5f74, %l5 = 0000000001189973
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000e8
!	%f22 = 5b5f155a, Mem[0000000010101410] = 4c86634e
	sta	%f22,[%i4+%o5]0x88	! Mem[0000000010101410] = 5b5f155a
!	Mem[0000000010101418] = 2465e6ea, %l0 = 0000000000007e24
	ldstuba	[%i4+0x018]%asi,%l0	! %l0 = 0000000000000024
!	%f6  = 11891eaa 5277f1d3, Mem[0000000030181400] = 745feaff 21932f1e
	stda	%f6 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 11891eaa 5277f1d3

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0b26fd2e38a373c7, %f14 = 31c42682 152c134b
	ldda	[%i1+%o4]0x81,%f14	! %f14 = 0b26fd2e 38a373c7
!	Mem[0000000010041408] = 293ead7e03f9f0d7, %f8  = 15e1eab8 1d85ace9, %asi = 80
	ldda	[%i1+0x008]%asi,%f8 	! %f8  = 293ead7e 03f9f0d7
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218001c0] = 2dc4a090, %l1 = fffffffffffff336, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000002dc4
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800041] = 0bd64ce0, %l5 = 00000000000000e8
	ldsb	[%o1+0x041],%l5		! %l5 = ffffffffffffffd6
!	Mem[0000000010181404] = 2171d7b1, %l2 = 00000000722ecf7c, %asi = 80
	lduba	[%i6+0x004]%asi,%l2	! %l2 = 0000000000000021
!	Mem[00000000100c1408] = ff7eaf52, %l2 = 0000000000000021
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 000000000000af52
!	%l4 = 0000000000000000, %l2 = 000000000000af52, %y  = 00007e24
	smul	%l4,%l2,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[0000000030181408] = 6ea3b9ce, %l7 = 000000000000007c
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 000000006ea3b9ce
!	Mem[0000000030041400] = 59fe3470, %l0 = 0000000000000024
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = 0000000059fe3470
!	Mem[0000000010141410] = 7c7854ac, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 000000000000007c

p0_label_7:
!	Starting 10 instruction Store Burst
!	%f22 = 5b5f155a 52241fc3, Mem[0000000010081410] = 04c8b98c 39abebed
	stda	%f22,[%i2+%o5]0x80	! Mem[0000000010081410] = 5b5f155a 52241fc3
!	%f23 = 52241fc3, %f9  = 03f9f0d7, %f14 = 0b26fd2e
	fdivs	%f23,%f9 ,%f14		! %f14 = 7f800000
!	Code Fragment 3, seed = 288175
p0_fragment_2:
!	%l0 = 0000000059fe3470
	setx	0xbdd4bc934db429ae,%g7,%l0 ! %l0 = bdd4bc934db429ae
!	%l1 = 0000000000000000
	setx	0x81e2148b12004759,%g7,%l1 ! %l1 = 81e2148b12004759
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bdd4bc934db429ae
	setx	0x15491986ad239114,%g7,%l0 ! %l0 = 15491986ad239114
!	%l1 = 81e2148b12004759
	setx	0x9c216a2897f389df,%g7,%l1 ! %l1 = 9c216a2897f389df
p0_fragment_2_end:
!	%l1 = 9c216a2897f389df, Mem[0000000010141424] = 69444509
	sth	%l1,[%i5+0x024]		! Mem[0000000010141424] = 89df4509
!	%l5 = ffffffffffffffd6, Mem[0000000030081408] = 8eb02b7b
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffd6
!	%l4 = 000000000000007c, Mem[0000000010101420] = 0027e4f8
	stb	%l4,[%i4+0x020]		! Mem[0000000010101420] = 7c27e4f8
!	%f28 = 17412b60 553b61f1, Mem[0000000030101400] = 00000000 00000000
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 17412b60 553b61f1
!	%l3 = 000000000180bb00, Mem[000000001008143c] = fffff336, %asi = 80
	stwa	%l3,[%i2+0x03c]%asi	! Mem[000000001008143c] = 0180bb00
!	%l4 = 000000000000007c, Mem[0000000010041400] = 5119f96640aadd77
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000007c
!	%f28 = 17412b60 553b61f1, %l1 = 9c216a2897f389df
!	Mem[00000000100c1408] = 52af7eff12dc8497
	add	%i3,0x008,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_PL ! Mem[00000000100c1408] = f1613b5560dc4117

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %f31 = 0bf0630d
	lda	[%i2+%g0]0x80,%f31	! %f31 = 00000000
!	Mem[0000000030181400] = 5277f1d3, %f13 = 410df4cf
	lda	[%i6+%g0]0x89,%f13	! %f13 = 5277f1d3
!	Mem[0000000030041400] = 7034fe59, %l6 = 0000000000000b26
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000059
!	Mem[0000000030181400] = d3f17752, %l6 = 0000000000000059
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000d3
!	Mem[0000000010101408] = 34c1ef9e, %l0 = 15491986ad239114
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000034
!	%f5  = 2f00e86d, %f28 = 17412b60, %f10 = 4e73d3b6
	fdivs	%f5 ,%f28,%f10		! %f10 = 572ad631
!	Mem[0000000030181400] = 5277f1d3, %l3 = 000000000180bb00
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 000000000000f1d3
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 39f09f10, %l1 = 9c216a2897f389df
	ldub	[%o2+%g0],%l1		! %l1 = 0000000000000039
!	Mem[00000000100c1408] = 553b61f1, %l1 = 0000000000000039
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000f1
!	Mem[0000000030081400] = 7e24bcd0, %l1 = 00000000000000f1
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 000000000000007e

p0_label_9:
!	Starting 10 instruction Store Burst
!	%f24 = 745feae8 5b65ce59, Mem[0000000030001400] = 109c652a e1e1a712
	stda	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = 745feae8 5b65ce59
!	%l0 = 0000000000000034, %l7 = 000000006ea3b9ce, %l4 = 000000000000007c
	sub	%l0,%l7,%l4		! %l4 = ffffffff915c4666
!	%l2 = 000000000000af52, %l1 = 000000000000007e, %l6 = 00000000000000d3
	add	%l2,%l1,%l6		! %l6 = 000000000000afd0
!	%l0 = 0000000000000034, Mem[0000000010081410] = 5b5f155a
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0034155a
!	%l5 = ffffffffffffffd6, Mem[0000000010141410] = 7c7854ac
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffd6
!	Mem[00000000100c1430] = 53b4b904091de285, %l5 = ffffffffffffffd6, %l1 = 000000000000007e
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 53b4b904091de285
!	Mem[0000000010001429] = 729ed276, %l7 = 000000006ea3b9ce
	ldstuba	[%i0+0x029]%asi,%l7	! %l7 = 000000000000009e
!	Mem[0000000030101408] = 2cdd2ada, %l2 = 000000000000af52
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000da
!	%l1 = 53b4b904091de285, Mem[00000000100c140c] = 60dc4117, %asi = 80
	stha	%l1,[%i3+0x00c]%asi	! Mem[00000000100c140c] = e2854117
!	%f2  = 125c5b5e 512abb37, %l5 = ffffffffffffffd6
!	Mem[0000000010001420] = 34ffd37828c37aa9
	add	%i0,0x020,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010001420] = 34ffd3785e5b5c12

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 3db33e15cff40d41, %l5 = ffffffffffffffd6
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = 3db33e15cff40d41
!	Mem[0000000030101400] = 602b4117, %f26 = 7b07c966
	lda	[%i4+%g0]0x89,%f26	! %f26 = 602b4117
!	Mem[0000000030101410] = 5f76b627, %l2 = 00000000000000da
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 000000000000b627
!	Mem[0000000021800100] = 465a7e00, %l2 = 000000000000b627, %asi = 80
	ldsha	[%o3+0x100]%asi,%l2	! %l2 = 000000000000465a
!	Mem[00000000100c140c] = e2854117, %l6 = 000000000000afd0, %asi = 80
	lduha	[%i3+0x00c]%asi,%l6	! %l6 = 000000000000e285
!	Mem[0000000010001410] = 1f0c306c, %l0 = 0000000000000034
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 000000001f0c306c
!	Mem[0000000010141408] = 36f33afe, %l5 = 3db33e15cff40d41
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = 00000000000036f3
!	Mem[0000000010141408] = fe3af336, %l5 = 00000000000036f3
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000036
!	Mem[00000000100c1410] = eca71b7c, %l6 = 000000000000e285
	lduba	[%i3+%o5]0x88,%l6	! %l6 = 000000000000007c
!	Mem[0000000010081400] = 73991801 00000000, %l6 = 0000007c, %l7 = 0000009e
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000073991801

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000f1d3, Mem[0000000030001410] = fc15c77d
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = fc15c7d3
!	%l5 = 0000000000000036, Mem[0000000030041408] = 2efd260b
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 2efd0036
!	Mem[0000000010101410] = 5a155f5b, %l1 = 00000000091de285
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 000000005a155f5b
!	%l1 = 000000005a155f5b, Mem[000000001008142a] = 07d79136, %asi = 80
	stha	%l1,[%i2+0x02a]%asi	! Mem[0000000010081428] = 07d75f5b
!	Mem[0000000030001400] = 59ce655b, %l0 = 000000001f0c306c
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000059ce655b
!	Mem[00000000300c1408] = 00000079, %l0 = 0000000059ce655b
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000079
!	%f12 = 670d79d6 5277f1d3, %l6 = 0000000000000000
!	Mem[00000000300c1408] = 59ce655b0000007c
	add	%i3,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_SL ! Mem[00000000300c1408] = 59ce655b0000007c
!	%l1 = 000000005a155f5b, Mem[0000000030041410] = 533f9c5c
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 5a155f5b
!	%f8  = 293ead7e 03f9f0d7, %l6 = 0000000000000000
!	Mem[0000000030181408] = ceb9a36e0e83c133
	add	%i6,0x008,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181408] = ceb9a36e0e83c133
!	%l2 = 000000000000465a, Mem[0000000010081410] = 0034155a
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 5a34155a

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 57d86507fe3af336, %l6 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 57d86507fe3af336
!	Mem[0000000030101408] = ff2add2c, %l7 = 0000000073991801
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 5a34155a 52241fc3, %l4 = 915c4666, %l5 = 00000036
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 000000005a34155a 0000000052241fc3
!	Mem[0000000010181408] = 348bf65e, %l0 = 0000000000000079
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000034
!	Mem[0000000030101400] = 602b4117, %l7 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000017
!	Mem[00000000300c1408] = 59ce655b, %f18 = 33c1830e
	lda	[%i3+%o4]0x81,%f18	! %f18 = 59ce655b
!	Mem[0000000010141408] = fe3af336, %l5 = 0000000052241fc3
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000036
!	Mem[0000000030101400] = 602b4117, %l6 = 57d86507fe3af336
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000017
!	Mem[000000001004140d] = 03f9f0d7, %l4 = 000000005a34155a, %asi = 80
	lduba	[%i1+0x00d]%asi,%l4	! %l4 = 00000000000000f9
!	Mem[0000000010101410] = 091de285, %l6 = 0000000000000017
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000009

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 5a15345a, %l2 = 000000000000465a
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000005a15345a
!	%l0 = 0000000000000034, Mem[0000000030101408] = 2cdd2aff
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000034
!	Mem[0000000030181408] = ceb9a36e, %l6 = 0000000000000009
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ceb9a36e
!	%l2 = 000000005a15345a, Mem[0000000030181408] = 09000000
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 0900005a
!	Mem[0000000010081428] = 07d75f5b, %l2 = 000000005a15345a
	swap	[%i2+0x028],%l2		! %l2 = 0000000007d75f5b
!	Mem[0000000030001400] = 1f0c306c, %l5 = 0000000000000036
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 000000000000001f
!	%l0 = 0000000000000034, Mem[0000000010101436] = 2c455765
	sth	%l0,[%i4+0x036]		! Mem[0000000010101434] = 2c450034
!	Mem[0000000010141400] = c08b6bc5, %l7 = 0000000000000017
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000c5
!	%f2  = 125c5b5e, %f21 = 082bfedd, %f8  = 293ead7e
	fdivs	%f2 ,%f21,%f8 		! %f8  = 49a3fda3
!	%l5 = 000000000000001f, Mem[0000000010181400] = 20dc5731
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 20dc571f

p0_label_14:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010141400] = ff6b8bc0 62f484d1 36f33afe 0765d857
!	Mem[0000000010141410] = ffffffd6 0db1a68d 6ef9904a 520318f3
!	Mem[0000000010141420] = 79ad8158 89df4509 4f4a7756 3cda8c4f
!	Mem[0000000010141430] = 45955dc4 612dfc45 45af9c22 2a93ae6b
	ldda	[%i5+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[00000000300c1410] = 410df4cf 153eb33d, %l6 = ceb9a36e, %l7 = 000000c5
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000410df4cf 00000000153eb33d
!	Mem[000000001008141c] = 712a3153, %l7 = 00000000153eb33d
	ldstub	[%i2+0x01c],%l7		! %l7 = 0000000000000071
!	Mem[0000000030001408] = 6ea3b9ce175ed9e7, %l3 = 000000000000f1d3
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = 6ea3b9ce175ed9e7
!	Mem[0000000010081408] = 31c42682, %l4 = 00000000000000f9
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 00000000000031c4
!	Mem[0000000030141400] = ff5bf5f0, %f15 = 38a373c7
	lda	[%i5+%g0]0x81,%f15	! %f15 = ff5bf5f0
!	Mem[0000000030181400] = d3f17752, %l7 = 0000000000000071
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = ffffffffd3f17752
!	Mem[0000000010001408] = 175ed9e7, %l6 = 00000000410df4cf
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000175e
!	Mem[0000000030041410] = 5a155f5b, %l5 = 000000000000001f
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = 000000000000005a
!	Mem[0000000010141408] = 36f33afe 0765d857, %l6 = 0000175e, %l7 = d3f17752, %asi = 80
	ldda	[%i5+0x008]%asi,%l6	! %l6 = 0000000036f33afe 000000000765d857

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 091de285, %l1 = 000000005a155f5b
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 00000000091de285
!	%l7 = 000000000765d857, Mem[0000000030101408] = 00000034
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000d857
!	Mem[0000000010081410] = 5a460000, %l5 = 000000000000005a
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000000000005a
!	%l5 = 000000000000005a, Mem[0000000030001408] = 6ea3b9ce175ed9e7
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000005a
!	%l6 = 0000000036f33afe, Mem[0000000010081437] = 403f9da5, %asi = 80
	stba	%l6,[%i2+0x037]%asi	! Mem[0000000010081434] = 403f9dfe
!	Mem[0000000030101400] = 17412b60 553b61f1 57d80000 66536167
!	%f0  = 1feb9920 7c7854ac 125c5b5e 512abb37
!	%f4  = 302e600c 2f00e86d 11891eaa 5277f1d3
!	%f8  = 49a3fda3 03f9f0d7 572ad631 64093b2f
!	%f12 = 670d79d6 5277f1d3 7f800000 ff5bf5f0
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	Mem[0000000010041410] = 2cbb9227, %l1 = 00000000091de285
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 000000002cbb9227
!	%l5 = 000000000000005a, Mem[0000000030001410] = fc15c7d3
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = fc15c75a
!	%f14 = 7f800000 ff5bf5f0, %l5 = 000000000000005a
!	Mem[00000000100c1418] = 48caad8a7ddc7933
	add	%i3,0x018,%g1
	stda	%f14,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1418] = 7f80ad8aff5b7933
!	Mem[000000001004142d] = 410df4cf, %l2 = 0000000007d75f5b
	ldstub	[%i1+0x02d],%l2		! %l2 = 000000000000000d

p0_label_16:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030101410] = 302e600c2f00e86d, %f20 = ffffffd6 0db1a68d
	ldda	[%i4+%o5]0x81,%f20	! %f20 = 302e600c 2f00e86d
!	Mem[0000000010001416] = 66c9077b, %l4 = 00000000000031c4, %asi = 80
	ldsba	[%i0+0x016]%asi,%l4	! %l4 = 0000000000000007
!	Mem[0000000010001420] = 34ffd3785e5b5c12, %f30 = 45af9c22 2a93ae6b, %asi = 80
	ldda	[%i0+0x020]%asi,%f30	! %f30 = 34ffd378 5e5b5c12
!	Mem[0000000010141400] = ff6b8bc0, %l2 = 000000000000000d
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = ffffffffff6b8bc0
!	Mem[0000000010141410] = ffffffd6, %l2 = ffffffffff6b8bc0
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010001428] = 72ffd276, %l1 = 000000002cbb9227
	ldsw	[%i0+0x028],%l1		! %l1 = 0000000072ffd276
!	Mem[0000000010081400] = 00000000, %l7 = 000000000765d857
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = d184f462c08b6bff, %l3 = 6ea3b9ce175ed9e7
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = d184f462c08b6bff
!	Code Fragment 3, seed = 245708
p0_fragment_3:
!	%l0 = 0000000000000034
	setx	0x0a968d56491f05c6,%g7,%l0 ! %l0 = 0a968d56491f05c6
!	%l1 = 0000000072ffd276
	setx	0xb3dc8211afb847f1,%g7,%l1 ! %l1 = b3dc8211afb847f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0a968d56491f05c6
	setx	0x08eb8ae73dd98e2c,%g7,%l0 ! %l0 = 08eb8ae73dd98e2c
!	%l1 = b3dc8211afb847f1
	setx	0xc41d157b0060db77,%g7,%l1 ! %l1 = c41d157b0060db77
p0_fragment_3_end:
!	Mem[0000000010141418] = 6ef9904a, %l1 = c41d157b0060db77
	lduw	[%i5+0x018],%l1		! %l1 = 000000006ef9904a

p0_label_17:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081424] = 5e2a0869, %l5 = 0000005a, %l1 = 6ef9904a
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000005e2a0869
!	%l6 = 36f33afe, %l7 = 00000000, Mem[0000000010101410] = 5a155f5b 04148dad
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 36f33afe 00000000
!	%l1 = 000000005e2a0869, Mem[00000000211c0000] = 39f09f10, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 08699f10
!	%l5 = 000000000000005a, Mem[0000000010141400] = d184f462c08b6bff
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000005a
!	%l3 = d184f462c08b6bff, Mem[0000000010101410] = fe3af336
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = c08b6bff
!	%f19 = 0765d857, Mem[0000000010181400] = 20dc571f
	sta	%f19,[%i6+%g0]0x88	! Mem[0000000010181400] = 0765d857
!	%f16 = ff6b8bc0 62f484d1, %l1 = 000000005e2a0869
!	Mem[0000000030181418] = 38ad605a3a4e5ec3
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181418] = d1ad60623a8b6bc3
!	Mem[00000000100c1404] = 714e6f11, %l2 = 000000000000ffff, %asi = 80
	swapa	[%i3+0x004]%asi,%l2	! %l2 = 00000000714e6f11
!	Mem[0000000030141410] = dc157b49, %l3 = d184f462c08b6bff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000049
!	%f2  = 125c5b5e 512abb37, Mem[00000000100c1410] = eca71b7c cda43a0c
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 125c5b5e 512abb37

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0180bb00, %l6 = 0000000036f33afe
	lduwa	[%i3+%g0]0x80,%l6	! %l6 = 000000000180bb00
!	Mem[00000000100c1400] = ffff000000bb8001, %l0 = 08eb8ae73dd98e2c
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = ffff000000bb8001
!	Mem[0000000010041408] = d7f0f9037ead3e29, %f10 = 572ad631 64093b2f
	ldda	[%i1+%o4]0x88,%f10	! %f10 = d7f0f903 7ead3e29
!	Mem[0000000010181416] = 0189ef6d, %l0 = ffff000000bb8001, %asi = 80
	lduba	[%i6+0x016]%asi,%l0	! %l0 = 00000000000000ef
!	Mem[0000000021800081] = 317c7da0, %l4 = 0000000000000007
	ldsb	[%o3+0x081],%l4		! %l4 = 000000000000007c
!	Mem[0000000010081408] = 31c42682 152c134b, %l2 = 714e6f11, %l3 = 00000049
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000031c42682 00000000152c134b
!	Mem[0000000010181427] = 067163e9, %l2 = 0000000031c42682, %asi = 80
	ldsba	[%i6+0x027]%asi,%l2	! %l2 = ffffffffffffffe9
!	Mem[0000000010181408] = 5ef68b34, %l6 = 000000000180bb00
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 0000000000008b34
!	Mem[00000000100c1410] = 37bb2a51, %f11 = 7ead3e29
	lda	[%i3+%o5]0x80,%f11	! %f11 = 37bb2a51
!	Mem[0000000030001408] = 5a00000000000000, %l5 = 000000000000005a
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 5a00000000000000

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 1f0c306c, %l3 = 00000000152c134b
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 000000001f0c306c
!	%l0 = 00000000000000ef, Mem[00000000300c1408] = 5b65ce59
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ef
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l1 = 000000005e2a0869, Mem[0000000010141400] = 5a000000
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 5e2a0869
!	Mem[0000000030081400] = 7e24bcd0 45df07a1 d6ffffff 77bdbda7
!	%f16 = ff6b8bc0 62f484d1 36f33afe 0765d857
!	%f20 = 302e600c 2f00e86d 6ef9904a 520318f3
!	%f24 = 79ad8158 89df4509 4f4a7756 3cda8c4f
!	%f28 = 45955dc4 612dfc45 34ffd378 5e5b5c12
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%f16 = ff6b8bc0, Mem[0000000030101408] = 125c5b5e
	sta	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = ff6b8bc0
!	Mem[0000000010181408] = 5ef68b34, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 000000005ef68b34
!	%l2 = ffffffffffffffe9, %l2 = ffffffffffffffe9, %l3 = 000000001f0c306c
	or	%l2,%l2,%l3		! %l3 = ffffffffffffffe9
!	Mem[0000000010001427] = 5e5b5c12, %l0 = 00000000000000ef
	ldstub	[%i0+0x027],%l0		! %l0 = 0000000000000012
!	%l2 = ffffffffffffffe9, Mem[0000000030041400] = c15cd3377034fe59
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffffffffffe9

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c08b6bff, %l0 = 0000000000000012
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = ffffffffc08b6bff
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0001] = 285e1c80, %l2 = ffffffffffffffe9, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 000000000000005e
!	Mem[0000000030001400] = 6c300cff, %l0 = ffffffffc08b6bff
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000cff
!	Mem[0000000010101410] = ff6b8bc0, %l4 = 000000000000007c
	ldsw	[%i4+%o5],%l4		! %l4 = ffffffffff6b8bc0
!	Mem[0000000030181410] = 3c4c5839, %l6 = 0000000000008b34
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000039
!	Mem[0000000030001408] = 00000000, %f14 = 7f800000
	lda	[%i0+%o4]0x81,%f14	! %f14 = 00000000
!	Mem[0000000020800040] = 0bd64ce0, %l6 = 0000000000000039, %asi = 80
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000bd6
!	Mem[0000000030001400] = ff0c306c, %l6 = 0000000000000bd6
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffff6b8bc0
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 00000000 69082a5e, %l2 = 0000005e, %l3 = ffffffe9
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000069082a5e 0000000000000000

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l7 = 000000005ef68b34, %l6 = ffffffffffffffff, %y  = 00000000
	sdiv	%l7,%l6,%l7		! %l7 = ffffffffa10974cc
	mov	%l0,%y			! %y = 00000cff
!	Mem[00000000100c1400] = 0180bb00, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000001
!	Code Fragment 4, seed = 885751
p0_fragment_4:
!	%l0 = 0000000000000cff
	setx	0xf3bbaf009f43ff6e,%g7,%l0 ! %l0 = f3bbaf009f43ff6e
!	%l1 = 000000005e2a0869
	setx	0x13d90302cb8b3119,%g7,%l1 ! %l1 = 13d90302cb8b3119
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f3bbaf009f43ff6e
	setx	0x8307e4183a4d4ed4,%g7,%l0 ! %l0 = 8307e4183a4d4ed4
!	%l1 = 13d90302cb8b3119
	setx	0x9d66b8eb2e13db9f,%g7,%l1 ! %l1 = 9d66b8eb2e13db9f
p0_fragment_4_end:
!	%f10 = d7f0f903 37bb2a51, Mem[0000000010181400] = 0765d857 b1d77121
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = d7f0f903 37bb2a51
!	%l5 = 5a00000000000000, Mem[0000000030181410] = 3c4c5839
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 3c4c5800
!	Mem[0000000010041438] = 30a026a2, %l3 = 0000000000000000, %asi = 80
	swapa	[%i1+0x038]%asi,%l3	! %l3 = 0000000030a026a2
!	%f20 = 302e600c 2f00e86d, Mem[00000000100c1428] = 20151896 1c04e08f, %asi = 80
	stda	%f20,[%i3+0x028]%asi	! Mem[00000000100c1428] = 302e600c 2f00e86d
!	%f18 = 36f33afe, Mem[0000000030181408] = 5a000009
	sta	%f18,[%i6+%o4]0x81	! Mem[0000000030181408] = 36f33afe
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010081400] = 00000000, %l1 = 9d66b8eb2e13db9f
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140a] = 00000000, %l3 = 0000000030a026a2
	ldstub	[%i6+0x00a],%l3		! %l3 = 0000000000000000

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 394b09e0, %l2 = 0000000069082a5e
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000394b
!	Mem[000000001004141e] = 00000180, %l6 = ffffffffffffffff
	lduh	[%i1+0x01e],%l6		! %l6 = 0000000000000180
!	Mem[0000000010101434] = 2c450034, %l4 = 0000000000000001
	lduh	[%i4+0x034],%l4		! %l4 = 0000000000002c45
!	Mem[0000000010081408] = 31c42682, %l4 = 0000000000002c45
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000031
!	Mem[0000000010181408] = 0000ff0043150a37, %f4  = 302e600c 2f00e86d
	ldda	[%i6+%o4]0x80,%f4 	! %f4  = 0000ff00 43150a37
!	%l0 = 8307e4183a4d4ed4, %l5 = 5a00000000000000, %y  = 00000cff
	umul	%l0,%l5,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1418] = 7f80ad8a, %l7 = ffffffffa10974cc
	ldsw	[%i3+0x018],%l7		! %l7 = 000000007f80ad8a
!	%l1 = 0000000000000000, %l0 = 8307e4183a4d4ed4, %l5 = 5a00000000000000
	subc	%l1,%l0,%l5		! %l5 = 7cf81be7c5b2b12c
!	Mem[0000000010001408] = 175ed9e7, %l2 = 000000000000394b
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = 000000000000175e
!	Mem[00000000100c1410] = 37bb2a51, %l5 = 7cf81be7c5b2b12c
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 00000000000037bb

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 36f33afe, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 0000000036f33afe
!	%l2 = 000000000000175e, %l3 = 0000000036f33afe, %l2 = 000000000000175e
	addc	%l2,%l3,%l2		! %l2 = 0000000036f3525c
!	Mem[0000000030041410] = 5a155f5b, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 000000005a155f5b
!	%l4 = 0000000000000031, Mem[0000000030041400] = e9ffffff
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 31ffffff
!	Mem[0000000030101400] = 1feb9920, %l3 = 0000000036f33afe
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 000000000000001f
!	%f4  = 0000ff00, Mem[00000000100c1400] = 00bb80ff
	sta	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ff00
!	%f20 = 302e600c 2f00e86d, %l0 = 8307e4183a4d4ed4
!	Mem[0000000030081418] = 6ef9904a520318f3
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030081418] = 6ef9904a520318f3
!	Mem[0000000010081410] = ff460000, %l2 = 0000000036f3525c
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff460000
!	%f19 = 0765d857, Mem[0000000030081410] = 302e600c
	sta	%f19,[%i2+%o5]0x81	! Mem[0000000030081410] = 0765d857
!	%l4 = 0000000000000031, Mem[0000000030101410] = 302e600c
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000031

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 7c27e4f87d795629, %f30 = 34ffd378 5e5b5c12
	ldd	[%i4+0x020],%f30	! %f30 = 7c27e4f8 7d795629
!	Mem[0000000010141408] = 57d86507 fe3af336, %l2 = ff460000, %l3 = 0000001f
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000fe3af336 0000000057d86507
!	Mem[0000000030141400] = ff5bf5f03af32841, %l4 = 0000000000000031
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = ff5bf5f03af32841
!	Mem[0000000010141400] = 5e2a0869, %l4 = ff5bf5f03af32841
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 000000005e2a0869
!	Mem[0000000010001400] = 394b09e0, %l2 = 00000000fe3af336
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000394b
!	%l5 = 00000000000037bb, %l2 = 000000000000394b, %l0 = 8307e4183a4d4ed4
	sub	%l5,%l2,%l0		! %l0 = fffffffffffffe70
!	Mem[0000000010081428] = 5a15345a, %l3 = 0000000057d86507
	ldsw	[%i2+0x028],%l3		! %l3 = 000000005a15345a
!	Mem[00000000100c1410] = 37bb2a515e5b5c12, %f12 = 670d79d6 5277f1d3
	ldda	[%i3+%o5]0x80,%f12	! %f12 = 37bb2a51 5e5b5c12
!	Mem[000000001010143c] = 59b31a8b, %l5 = 00000000000037bb, %asi = 80
	ldswa	[%i4+0x03c]%asi,%l5	! %l5 = 0000000059b31a8b
!	Mem[0000000010041408] = 293ead7e03f9f0d7, %f24 = 79ad8158 89df4509
	ldda	[%i1+%o4]0x80,%f24	! %f24 = 293ead7e 03f9f0d7

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000394b, Mem[0000000010081408] = 31c42682152c134b
	stxa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000000000394b
!	%l6 = 5a155f5b, %l7 = 7f80ad8a, Mem[0000000030101410] = 31000000 6de8002f
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 5a155f5b 7f80ad8a
!	Mem[00000000100c143d] = 7e5136ab, %l1 = 0000000000000000
	ldstuba	[%i3+0x03d]%asi,%l1	! %l1 = 0000000000000051
!	%l6 = 000000005a155f5b, Mem[0000000030001400] = ff0c306c
	stba	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 5b0c306c
!	Mem[000000001004142a] = 670d79d6, %l7 = 000000007f80ad8a
	ldstuba	[%i1+0x02a]%asi,%l7	! %l7 = 0000000000000079
!	%f10 = d7f0f903, Mem[0000000010081408] = 00000000
	sta	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = d7f0f903
!	Mem[0000000010001429] = 72ffd276, %l7 = 0000000000000079
	ldstub	[%i0+0x029],%l7		! %l7 = 00000000000000ff
!	%l0 = fffffffffffffe70, Mem[0000000010181414] = 0189ef6d
	stw	%l0,[%i6+0x014]		! Mem[0000000010181414] = fffffe70
!	%l0 = fffffffffffffe70, Mem[0000000010041400] = 7c00000000000000
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = fffffffffffffe70
!	%f18 = 36f33afe 0765d857, %l3 = 000000005a15345a
!	Mem[00000000300c1430] = 213d48345978f6f5
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1430] = 21d84807fe78f3f5

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = e0094b39, %l7 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 0000000000004b39
!	Mem[0000000010081408] = d7f0f903, %f3  = 512abb37
	lda	[%i2+%o4]0x80,%f3 	! %f3 = d7f0f903
!	Mem[0000000030041400] = 31ffffff, %l0 = fffffffffffffe70
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 0000000031ffffff
!	Mem[00000000100c1408] = f1613b55e2854117, %l6 = 000000005a155f5b
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = f1613b55e2854117
!	Mem[00000000100c1408] = 553b61f1, %l7 = 0000000000004b39
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000f1
!	Mem[00000000300c1410] = 410df4cf, %f18 = 36f33afe
	lda	[%i3+%o5]0x81,%f18	! %f18 = 410df4cf
!	Mem[0000000010041410] = 091de285, %l1 = 0000000000000051
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 000000000000e285
!	Mem[0000000010081410] = 36f3525c52241fc3, %f6  = 11891eaa 5277f1d3, %asi = 80
	ldda	[%i2+0x010]%asi,%f6 	! %f6  = 36f3525c 52241fc3
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030081400] = ff6b8bc0 62f484d1 00000000 0765d857
!	Mem[0000000030081410] = 0765d857 2f00e86d 6ef9904a 520318f3
!	Mem[0000000030081420] = 79ad8158 89df4509 4f4a7756 3cda8c4f
!	Mem[0000000030081430] = 45955dc4 612dfc45 34ffd378 5e5b5c12
	ldda	[%i2+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030081400
!	Mem[00000000100c1400] = 00ff0000, %l5 = 0000000059b31a8b
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l6 = f1613b55e2854117, imm = fffffffffffff5e9, %l2 = 000000000000394b
	xnor	%l6,-0xa17,%l2		! %l2 = f1613b55e2854b01
!	Mem[000000001018142c] = 0244ea2f, %l1 = 000000000000e285, %asi = 80
	swapa	[%i6+0x02c]%asi,%l1	! %l1 = 000000000244ea2f
!	Mem[0000000010001400] = 394b09e00ea0b671, %l2 = f1613b55e2854b01, %l7 = 00000000000000f1
	casxa	[%i0]0x80,%l2,%l7	! %l7 = 394b09e00ea0b671
!	%l2 = f1613b55e2854b01, Mem[0000000010141400] = 5e2a0869
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = e2854b01
!	%f18 = 410df4cf 0765d857, Mem[0000000010101410] = c08b6bff 00000000
	stda	%f18,[%i4+%o5]0x88	! Mem[0000000010101410] = 410df4cf 0765d857
!	Mem[0000000030001400] = 6c300c5b, %l7 = 394b09e00ea0b671
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000000000005b
!	Mem[0000000010001409] = 175ed9e7, %l4 = 000000005e2a0869
	ldstuba	[%i0+0x009]%asi,%l4	! %l4 = 000000000000005e
!	Mem[00000000201c0000] = 285e1c80, %l0 = 0000000031ffffff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000028
!	%l2 = f1613b55e2854b01, Mem[0000000010141400] = 014b85e2
	stha	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 014b4b01
!	Mem[0000000010041400] = ffffffff, %l1 = 000000000244ea2f
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000ffffffff

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = fffffe70, %l5 = 00000000000000ff
	ldsw	[%i1+0x004],%l5		! %l5 = fffffffffffffe70
!	Mem[0000000010001424] = 5e5b5cff, %l7 = 000000000000005b, %asi = 80
	ldsba	[%i0+0x024]%asi,%l7	! %l7 = 000000000000005e
!	Mem[0000000010081400] = ff000000 01189973 d7f0f903 0000394b
!	Mem[0000000010081410] = 36f3525c 52241fc3 4c8fe42a ff2a3153
!	Mem[0000000010081420] = 051d7c38 5e2a0869 5a15345a 652992af
!	Mem[0000000010081430] = 52c0cea4 403f9dfe 00007e24 0180bb00
	ldda	[%i2+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[00000000218001c0] = 2dc4a090, %l7 = 000000000000005e
	ldsh	[%o3+0x1c0],%l7		! %l7 = 0000000000002dc4
!	Mem[00000000201c0000] = ff5e1c80, %l0 = 0000000000000028, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ef, %l7 = 0000000000002dc4
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ef
!	Mem[0000000030081408] = 00000000, %l3 = 000000005a15345a
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 512abb37, %f14 = 34ffd378
	lda	[%i6+%g0]0x80,%f14	! %f14 = 512abb37
!	Mem[0000000030081410] = 57d86507, %l1 = 00000000ffffffff
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 0000000057d86507
!	Mem[0000000010001410] = 152c134b66c9077b, %l5 = fffffffffffffe70
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = 152c134b66c9077b

p0_label_29:
!	Starting 10 instruction Store Burst
!	%l6 = f1613b55e2854117, Mem[0000000010141410] = ffffffd60db1a68d
	stx	%l6,[%i5+%o5]		! Mem[0000000010141410] = f1613b55e2854117
!	Mem[0000000030181410] = 00584c3c, %l2 = 00000000e2854b01
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000584c3c
!	Mem[0000000010101418] = ff65e6ea, %l0 = 00000000ffffffff
	swap	[%i4+0x018],%l0		! %l0 = 00000000ff65e6ea
!	Mem[0000000010141400] = 014b4b01, %l5 = 0000000066c9077b
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000014b4b01
	membar	#Sync			! Added by membar checker (5)
!	%l1 = 0000000057d86507, Mem[0000000030081400] = c08b6bff
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = c08b6b07
!	%l3 = 0000000000000000, Mem[0000000010181414] = fffffe70, %asi = 80
	stha	%l3,[%i6+0x014]%asi	! Mem[0000000010181414] = 0000fe70
!	Mem[0000000030001410] = fc15c75a, %l1 = 0000000057d86507
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000000000005a
!	Mem[0000000030041400] = ffffff31, %l4 = 000000000000005e
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ffffff31
!	Mem[0000000010081410] = 5c52f336, %l0 = 00000000ff65e6ea
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 000000005c52f336
!	Mem[0000000010001403] = 394b09e0, %l1 = 000000000000005a
	ldstuba	[%i0+0x003]%asi,%l1	! %l1 = 00000000000000e0

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 7b07c9664b132c15, %l6 = f1613b55e2854117
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 7b07c9664b132c15
!	Mem[0000000010041410] = 85e21d09, %l7 = 00000000000000ef
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffff85e2
!	Mem[00000000100c1410] = 37bb2a51, %l1 = 00000000000000e0
	ldswa	[%i3+%o5]0x80,%l1	! %l1 = 0000000037bb2a51
!	Mem[00000000300c1408] = 000000ef, %f18 = 4b390000
	lda	[%i3+%o4]0x89,%f18	! %f18 = 000000ef
!	Mem[000000001010143c] = 59b31a8b, %l5 = 00000000014b4b01
	ldsw	[%i4+0x03c],%l5		! %l5 = 0000000059b31a8b
!	Mem[000000001010143c] = 59b31a8b, %l6 = 7b07c9664b132c15
	lduh	[%i4+0x03c],%l6		! %l6 = 00000000000059b3
!	Mem[0000000030081410] = 57d86507, %l6 = 00000000000059b3
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 0000000057d86507
!	Mem[0000000030141400] = ff5bf5f0, %l1 = 0000000037bb2a51
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = ffffffffff5bf5f0
!	Mem[000000001010141c] = 0d677113, %l0 = 000000005c52f336
	ldsw	[%i4+0x01c],%l0		! %l0 = 000000000d677113
!	Mem[0000000010041408] = 293ead7e, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 000000000000293e

p0_label_31:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffff31, immd = fffff6ff, %y  = 00000000
	umul	%l4,-0x901,%l6		! %l6 = fffff630000747cf, %y = fffff630
!	%l7 = ffffffffffff85e2, Mem[0000000030101400] = 2099ebff
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 209985e2
!	%f18 = 000000ef 03f9f0d7, Mem[0000000030101400] = e2859920 7c7854ac
	stda	%f18,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ef 03f9f0d7
!	Mem[0000000030181400] = 5277f1d3, %l3 = 000000000000293e
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 000000005277f1d3
!	%l4 = ffffff31, %l5 = 59b31a8b, Mem[00000000300c1408] = ef000000 0000007c
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffff31 59b31a8b
!	Mem[0000000010101410] = 57d86507, %l6 = fffff630000747cf
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000057
!	%l6 = 00000057, %l7 = ffff85e2, Mem[0000000010041410] = 85e21d09 0bf0630d
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000057 ffff85e2
!	%l4 = 00000000ffffff31, Mem[000000001004142a] = 670dffd6
	sth	%l4,[%i1+0x02a]		! Mem[0000000010041428] = 670dff31
!	Mem[0000000030181400] = 0000293e, %l5 = 0000000059b31a8b
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000000000003e
!	Mem[0000000030141408] = ae6a3200, %l4 = 00000000ffffff31
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ae6a3200

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = f1613b55, %f24 = 69082a5e
	lda	[%i3+%o4]0x80,%f24	! %f24 = f1613b55
!	Mem[0000000030041410] = 7d410348 00000000, %l6 = 00000057, %l7 = ffff85e2
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 000000007d410348
!	Mem[0000000030141400] = ff5bf5f0, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffff5b
!	Mem[0000000010041404] = fffffe70, %l1 = ffffffffff5bf5f0
	ldub	[%i1+0x004],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010141410] = f1613b55, %l0 = 000000000d677113
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 000000000000f161
!	Mem[0000000010181427] = 067163e9, %l3 = 000000005277f1d3
	ldsb	[%i6+0x027],%l3		! %l3 = ffffffffffffffe9
!	Mem[0000000030041408] = 2efd0036, %l0 = 000000000000f161
	lduwa	[%i1+%o4]0x89,%l0	! %l0 = 000000002efd0036
!	Mem[0000000030141400] = f0f55bff, %l7 = 000000007d410348
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = fffffffff0f55bff
!	Mem[0000000010181400] = 512abb37, %l6 = ffffffffffffff5b
	ldub	[%i6+%g0],%l6		! %l6 = 0000000000000051
!	%l2 = 0000000000584c3c, %l5 = 000000000000003e, %l1  = 00000000000000ff
	mulx	%l2,%l5,%l1		! %l1 = 0000000015627688

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l6 = 00000051, %l7 = f0f55bff, Mem[0000000010181410] = 0c13324b 70fe0000
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000051 f0f55bff
!	%f8  = 79ad8158, Mem[0000000010041408] = 7ead3e29
	sta	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 79ad8158
!	%l7 = fffffffff0f55bff, Mem[0000000010101413] = ffd86507
	stb	%l7,[%i4+0x013]		! Mem[0000000010101410] = ffd865ff
!	%f16 = 73991801 000000ff, %l0 = 000000002efd0036
!	Mem[0000000010081408] = d7f0f9030000394b
	add	%i2,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081408] = d7f018010000394b
!	Mem[0000000030041408] = 3600fd2e, %l1 = 0000000015627688
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000036
!	%l4 = 00000000ae6a3200, Mem[0000000010041408] = d7f0f90379ad8158
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000ae6a3200
!	%l3 = ffffffffffffffe9, imm = fffffffffffff121, %l0 = 000000002efd0036
	addc	%l3,-0xedf,%l0		! %l0 = fffffffffffff10a
!	Mem[0000000010001400] = 394b09ff 0ea0b671 17ffd9e7 145b2ef7
!	%f0  = ff6b8bc0 62f484d1 00000000 0765d857
!	%f4  = 0765d857 2f00e86d 6ef9904a 520318f3
!	%f8  = 79ad8158 89df4509 4f4a7756 3cda8c4f
!	%f12 = 45955dc4 612dfc45 512abb37 5e5b5c12
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l4 = ae6a3200, %l5 = 0000003e, Mem[0000000030001408] = 00000000 5a000000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ae6a3200 0000003e
!	Mem[0000000010101400] = 17412b60, %l0 = fffffffffffff10a
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000017

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 08699f10, %l5 = 000000000000003e
	ldub	[%o2+%g0],%l5		! %l5 = 0000000000000008
!	Mem[0000000030001410] = fc15c7ff, %l7 = fffffffff0f55bff
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800141] = 2a2ab830, %l0 = 0000000000000017
	ldsb	[%o3+0x141],%l0		! %l0 = 000000000000002a
!	Mem[0000000030101410] = 5b5f155a 8aad807f, %l2 = 00584c3c, %l3 = ffffffe9
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 000000005b5f155a 000000008aad807f
!	Mem[0000000010081408] = 0118f0d7, %l1 = 0000000000000036
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 000000000118f0d7
!	Mem[0000000010141400] = 66c9077b00000000, %f16 = 73991801 000000ff
	ldd	[%i5+%g0],%f16		! %f16 = 66c9077b 00000000
!	%f3  = 0765d857, %f11 = 3cda8c4f, %f30 = 00bb8001
	fmuls	%f3 ,%f11,%f30		! %f30 = 04c43833
!	Mem[0000000010141400] = 00000000 7b07c966, %l2 = 5b5f155a, %l3 = 8aad807f
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 000000007b07c966 0000000000000000
!	Mem[0000000010181408] = 00ff0000, %l0 = 000000000000002a
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 7b07c966, %l6 = 0000000000000051
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000066

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = ffff85e2, %l5 = 00000008, %l2 = 7b07c966
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000ffff85e2
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010001410] = 0765d857, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 000000000765d857
!	%l4 = 00000000ae6a3200, Mem[00000000100c1400] = 00ff0000
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff0000
!	%l3 = 000000000765d857, Mem[0000000010081410] = ff65e6ea
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 0765d857
!	Mem[0000000030101410] = 5b5f155a, %l5 = 0000000000000008
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000000000005b
!	Mem[0000000010141408] = fe3af336, %l1 = 000000000118f0d7
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000036
!	%l2 = 00000000ffff85e2, Mem[0000000010001400] = d184f462c08b6bff
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffff85e2
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = 37bb2a515e5b5c12
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	%l1 = 0000000000000036, Mem[0000000030101408] = ff6b8bc0
	stba	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 366b8bc0
!	%l6 = 0000000000000066, Mem[0000000010001438] = 512abb375e5b5c12, %asi = 80
	stxa	%l6,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000000000066

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff5f155a, %l1 = 0000000000000036
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 0244ea2f, %l0 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = 000000000000002f
!	Mem[0000000010081410] = 0765d857, %l7 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 000000000000d857
!	Mem[0000000020800040] = 0bd64ce0, %l5 = 000000000000005b
	lduh	[%o1+0x040],%l5		! %l5 = 0000000000000bd6
!	Mem[0000000010101400] = 602b41ff, %l2 = 00000000ffff85e2
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 00000000602b41ff
!	Mem[0000000010101410] = ff65d8ff, %l2 = 00000000602b41ff
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = ffffffffffffd8ff
!	Mem[0000000010181408] = 00ff0000, %f3  = 0765d857
	lda	[%i6+%o4]0x88,%f3 	! %f3 = 00ff0000
!	Mem[0000000010041400] = 0244ea2f, %l2 = ffffffffffffd8ff
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 000000000244ea2f
!	Mem[0000000030041410] = 00000000, %l1 = ffffffffffffffff
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 6de8002f 57d86507, %l2 = 0244ea2f, %l3 = 0765d857
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000057d86507 000000006de8002f

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 7c313530, %l0 = 000000000000002f
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 000000007c313530
!	%f22 = 53312aff, Mem[0000000010181410] = 51000000
	sta	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = 53312aff
!	Mem[0000000030181408] = fe3af336, %l5 = 0000000000000bd6
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000036
!	%l5 = 0000000000000036, immd = fffffb0a, %y  = fffff630
	umul	%l5,-0x4f6,%l0		! %l0 = 00000035fffef41c, %y = 00000035
!	%l3 = 000000006de8002f, immd = 00000c87, %y  = 00000035
	umul	%l3,0xc87,%l0		! %l0 = 00000560d55a4cc9, %y = 00000560
!	%l5 = 0000000000000036, Mem[0000000010141410] = 553b61f1
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 553b6136
!	Mem[0000000030141410] = ff7b15dc, %l5 = 0000000000000036
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff7b15dc
!	Mem[0000000010141400] = 66c9077b 00000000 fff33afe 0765d857
!	%f16 = 66c9077b 00000000 000000ef 03f9f0d7
!	%f20 = c31f2452 5c52f336 53312aff 2ae48f4c
!	%f24 = f1613b55 387c1d05 af922965 5a34155a
!	%f28 = fe9d3f40 a4cec052 04c43833 247e0000
	stda	%f16,[%i5+%g0]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[000000001000140c] = 0765d857, %l7 = 000000000000d857
	swap	[%i0+0x00c],%l7		! %l7 = 000000000765d857
!	%l0 = 00000560d55a4cc9, Mem[0000000010041400] = 0244ea2f
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = d55a4cc9

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000ae6a3200
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0001] = ff5e1c80, %l4 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = 000000000000005e
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010141410] = c31f2452, %l2 = 0000000057d86507
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000c31f
!	Mem[0000000030041400] = 5e000000 ffffffff ff00fd2e 38a373c7
!	Mem[0000000030041410] = 00000000 4803417d 6dbf297a 29f8cf63
!	Mem[0000000030041420] = 57ff9808 3f6812f9 0b1d9786 1b074dbf
!	Mem[0000000030041430] = 48df7374 4cde6d35 321af352 55e96adb
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010101400] = ff412b60553b61f1, %l5 = 00000000ff7b15dc
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = ff412b60553b61f1
!	Mem[0000000010001418] = 6ef9904a, %l7 = 000000000765d857
	ldsw	[%i0+0x018],%l7		! %l7 = 000000006ef9904a
!	Mem[00000000300c1400] = 0000002f, %l5 = ff412b60553b61f1
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800041] = 4398b770, %l0 = 00000560d55a4cc9, %asi = 80
	lduba	[%o3+0x041]%asi,%l0	! %l0 = 0000000000000098
!	Mem[0000000030101400] = 000000ef, %l4 = 000000000000005e
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c143e] = 7eff36ab, %l6 = 0000000000000066, %asi = 80
	ldsha	[%i3+0x03e]%asi,%l6	! %l6 = 00000000000036ab

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff290000, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000098, Mem[00000000100c1438] = 09db0162, %asi = 80
	stha	%l0,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00980162
!	Mem[0000000010001414] = 2f00e86d, %l6 = 00000000000036ab
	swap	[%i0+0x014],%l6		! %l6 = 000000002f00e86d
!	%l0 = 0000000000000098, Mem[0000000010141408] = 000000ef03f9f0d7
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000098
!	Mem[00000000100c142c] = 2f00e86d, %l6 = 000000002f00e86d
	ldstub	[%i3+0x02c],%l6		! %l6 = 000000000000002f
!	%f0  = ff6b8bc0, Mem[0000000030141400] = f0f55bff
	sta	%f0 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ff6b8bc0
!	%l2 = 000000000000c31f, %l4 = 0000000000000000, %l6 = 000000000000002f
	andn	%l2,%l4,%l6		! %l6 = 000000000000c31f
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000098
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%f19 = 38a373c7, Mem[00000000300c1408] = ffffff31
	sta	%f19,[%i3+%o4]0x81	! Mem[00000000300c1408] = 38a373c7
!	Mem[00000000211c0000] = 08699f10, %l6 = 000000000000c31f
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000008

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 410df4cf, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 00000000410df4cf
!	Mem[0000000030101400] = ef000000, %l2 = 000000000000c31f
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f11 = 3cda8c4f, %f24 = 57ff9808, %f15 = 5e5b5c12
	fsubs	%f11,%f24,%f15		! %f15 = d7ff9808
!	Mem[0000000010141400] = 7b07c966, %l0 = 00000000410df4cf
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 000000000000c966
!	Mem[0000000010101428] = 76de0ff6 4157de6f, %l0 = 0000c966, %l1 = 00000000
	ldd	[%i4+0x028],%l0		! %l0 = 0000000076de0ff6 000000004157de6f
!	%l3 = 000000006de8002f, imm = 00000000000008b9, %l3 = 000000006de8002f
	and	%l3,0x8b9,%l3		! %l3 = 0000000000000029
!	Mem[00000000100c142a] = 302e600c, %l4 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x02a]%asi,%l4	! %l4 = 0000000000000060
!	Mem[0000000010041408] = 00326aae, %l5 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 0118f0d7, %l0 = 0000000076de0ff6
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = 000000000118f0d7
!	Mem[0000000010101408] = 775690779eefc134, %l0 = 000000000118f0d7
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 775690779eefc134

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = fc15c7ff, %l7 = 000000006ef9904a
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000fc15c7ff
!	%l6 = 0000000000000008, Mem[0000000010041400] = c94c5ad5
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00085ad5
	membar	#Sync			! Added by membar checker (8)
!	%l2 = 0000000000000000, Mem[0000000030041408] = c773a3382efd00ff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%f26 = 0b1d9786 1b074dbf, %l6 = 0000000000000008
!	Mem[0000000030181428] = 31ec046649227b1f
	add	%i6,0x028,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181428] = 31ec046649227b1f
!	%l3 = 0000000000000029, imm = fffffffffffffdfd, %l3 = 0000000000000029
	orn	%l3,-0x203,%l3		! %l3 = 000000000000022b
!	%l4 = 0000000000000060, Mem[00000000100c1430] = 53b4b904
	stw	%l4,[%i3+0x030]		! Mem[00000000100c1430] = 00000060
!	Mem[0000000010141408] = 98000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000098
!	%l2 = 0000000000000000, Mem[0000000030101400] = 000000ef03f9f0d7
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f4  = 0765d857 2f00e86d, Mem[0000000010041410] = 57000000 e285ffff
	stda	%f4 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 0765d857 2f00e86d
!	%f15 = d7ff9808, Mem[0000000030141400] = c08b6bff
	sta	%f15,[%i5+%g0]0x81	! Mem[0000000030141400] = d7ff9808

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 6de8002f57d86507, %l7 = 00000000fc15c7ff
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = 6de8002f57d86507
!	Mem[000000001008142e] = 652992af, %l5 = 0000000000000098, %asi = 80
	ldsha	[%i2+0x02e]%asi,%l5	! %l5 = ffffffffffff92af
!	Mem[0000000030181400] = 000029ff, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000000029ff
!	Mem[0000000030081408] = 00000000, %f12 = 45955dc4
	lda	[%i2+%o4]0x81,%f12	! %f12 = 00000000
!	Mem[00000000100c140c] = e2854117, %l1 = 000000004157de6f, %asi = 80
	lduwa	[%i3+0x00c]%asi,%l1	! %l1 = 00000000e2854117
!	Mem[0000000010101400] = 602b41ff, %l3 = 000000000000022b
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181438] = 328f9182522af24b, %f12 = 00000000 612dfc45, %asi = 80
	ldda	[%i6+0x038]%asi,%f12	! %f12 = 328f9182 522af24b
!	%f18 = ff00fd2e, %f0  = ff6b8bc0, %f4  = 0765d857
	fsubs	%f18,%f0 ,%f4 		! %f4  = 7ed51d24
!	Mem[00000000100c1408] = f1613b55 e2854117, %l2 = 000029ff, %l3 = ffffffff
	ldd	[%i3+%o4],%l2		! %l2 = 00000000f1613b55 00000000e2854117
!	Mem[000000001018143c] = 522af24b, %f8  = 79ad8158
	lda	[%i6+0x03c]%asi,%f8 	! %f8 = 522af24b

p0_label_43:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000f1613b55, Mem[0000000010181400] = 512abb37
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = f1613b55
!	Mem[0000000030141400] = 0898ffd7, %l2 = 00000000f1613b55
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000d7
!	%l6 = 0000000000000008, Mem[0000000030041400] = ffffffff0000005e
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000008
!	%f0  = ff6b8bc0, Mem[0000000030041410] = 00000000
	sta	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ff6b8bc0
!	Mem[0000000021800180] = 6d0a6e60, %l0 = 775690779eefc134
	ldstub	[%o3+0x180],%l0		! %l0 = 000000000000006d
!	%l0 = 000000000000006d, Mem[0000000010081417] = 52241fc3, %asi = 80
	stba	%l0,[%i2+0x017]%asi	! Mem[0000000010081414] = 52241f6d
!	%l6 = 0000000000000008, Mem[0000000030041410] = 7d410348c08b6bff
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000008
!	%f16 = 5e000000 ffffffff, %l7 = 6de8002f57d86507
!	Mem[0000000010001438] = 0000000000000066
	add	%i0,0x038,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001438] = ffffff0000000066
!	Mem[0000000010181427] = 067163e9, %l5 = ffffffffffff92af
	ldstub	[%i6+0x027],%l5		! %l5 = 00000000000000e9
!	%l2 = 00000000000000d7, Mem[0000000030141410] = 36000000
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 360000d7

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = c31f2452, %l4 = 0000000000000060
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = ffffffffc31f2452
!	Mem[0000000010141408] = ff000000, %l2 = 00000000000000d7
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 00326aae, %l2 = 00000000000000ff
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000326aae
!	Mem[0000000010001400] = ffff85e2, %l5 = 00000000000000e9
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = ffffffffffffffe2
!	Mem[0000000010101408] = 34c1ef9e, %l3 = 00000000e2854117
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 0000000034c1ef9e
!	Mem[0000000010001408] = 57d8000000000000, %l1 = 00000000e2854117
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 57d8000000000000
!	Mem[0000000010001410] = 00000000, %l7 = 6de8002f57d86507
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffc31f2452
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081430] = 52c0cea4403f9dfe, %l6 = 0000000000000008
	ldx	[%i2+0x030],%l6		! %l6 = 52c0cea4403f9dfe
!	Mem[0000000030041410] = 00000008, %l6 = 52c0cea4403f9dfe
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000008

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000008, Mem[00000000100c1408] = f1613b55
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00083b55
!	%l0 = 000000000000006d, Mem[0000000021800100] = 465a7e00
	stb	%l0,[%o3+0x100]		! Mem[0000000021800100] = 6d5a7e00
!	%l0 = 000000000000006d, Mem[0000000030141410] = 360000d7
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 3600006d
!	%l3 = 0000000034c1ef9e, Mem[0000000010041408] = 00326aae
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 9e326aae
!	Mem[00000000201c0000] = ff5e1c80, %l2 = 0000000000326aae
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 00000008, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000008
!	%f16 = 5e000000 ffffffff, Mem[0000000010081428] = 5a15345a 652992af, %asi = 80
	stda	%f16,[%i2+0x028]%asi	! Mem[0000000010081428] = 5e000000 ffffffff
!	Mem[0000000030041408] = 00000000, %l3 = 0000000034c1ef9e
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0001] = ff699f10, %l0 = 000000000000006d
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000069
!	Mem[0000000030181410] = e2854b01, %l2 = 0000000000000008
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000e2

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0765d8572f00e86d, %l2 = 00000000000000e2
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 0765d8572f00e86d
!	Mem[0000000010041400] = 00085ad5fffffe70, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 00085ad5fffffe70
!	Mem[00000000100c1408] = 174185e2553b0800, %f4  = 7ed51d24 2f00e86d
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 174185e2 553b0800
!	Mem[0000000010101437] = 2c450034, %l3 = 00085ad5fffffe70, %asi = 80
	lduba	[%i4+0x037]%asi,%l3	! %l3 = 0000000000000034
!	Mem[0000000010041400] = d55a0800, %l2 = 0765d8572f00e86d
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 00000000d55a0800
!	Mem[0000000010081400] = ff00000001189973, %l3 = 0000000000000034
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = ff00000001189973
!	%f7  = 520318f3, %f2  = 00000000, %f18 = ff00fd2e 38a373c7
	fsmuld	%f7 ,%f2 ,%f18		! %f18 = 00000000 00000000
!	%f14 = 512abb37, %f0  = ff6b8bc0
	fsqrts	%f14,%f0 		! %f0  = 4851100d
!	%f30 = 321af352, %f8  = 522af24b
	fcmpes	%fcc3,%f30,%f8 		! %fcc3 = 1
!	Mem[0000000010041410] = 6de8002f57d86507, %f28 = 48df7374 4cde6d35
	ldd	[%i1+%o5],%f28		! %f28 = 6de8002f 57d86507

p0_label_47:
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 00000000, Mem[0000000010001430] = 45955dc4 612dfc45, %asi = 80
	stda	%f18,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000 00000000
!	%f4  = 174185e2 553b0800, Mem[0000000030041400] = ff000000 00000000
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 174185e2 553b0800
!	%l7 = 0000000000000000, Mem[0000000010081408] = d7f01801
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00f01801
!	Mem[00000000201c0000] = ff5e1c80, %l6 = 0000000000000008
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 34c1ef9e, %l5 = 00000000ffffffe2
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 0000000034c1ef9e
!	%f2  = 00000000 00ff0000, Mem[0000000010181400] = 553b61f1 d7f0f903
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00ff0000
!	%l2 = d55a0800, %l3 = 01189973, Mem[0000000030081408] = 00000000 0765d857
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = d55a0800 01189973
!	Mem[0000000030081410] = 0765d857, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000007
!	%l5 = 0000000034c1ef9e, Mem[0000000010181408] = 00ff0000
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00ffef9e
!	%f28 = 6de8002f, %f14 = 512abb37
	fsqrts	%f28,%f14		! %f14 = 56ac5357

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 31ffffff, %l0 = 0000000000000069
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 00000000000031ff
!	Mem[0000000021800040] = 4398b770, %l3 = ff00000001189973
	ldsh	[%o3+0x040],%l3		! %l3 = 0000000000004398
!	Mem[0000000010081420] = 051d7c385e2a0869, %f22 = 6dbf297a 29f8cf63
	ldd	[%i2+0x020],%f22	! %f22 = 051d7c38 5e2a0869
!	Mem[0000000010141428] = af9229655a34155a, %l6 = 00000000000000ff
	ldx	[%i5+0x028],%l6		! %l6 = af9229655a34155a
!	Mem[00000000211c0000] = ffff9f10, %l3 = 0000000000004398
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = 00085ad5fffffe70, %f26 = 0b1d9786 1b074dbf
	ldda	[%i1+%g0]0x80,%f26	! %f26 = 00085ad5 fffffe70
!	Mem[00000000300c1400] = 2f000000, %f8  = 522af24b
	lda	[%i3+%g0]0x89,%f8 	! %f8 = 2f000000
!	Mem[00000000300c1408] = 38a373c7, %l0 = 00000000000031ff
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 00000000000038a3
!	Mem[0000000030081408] = 73991801 00085ad5, %l6 = 5a34155a, %l7 = 00000007
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000000085ad5 0000000073991801
!	Mem[0000000030101400] = 00000000, %l1 = 57d8000000000000
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000085ad5, Mem[0000000010001400] = e285ffff
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 5ad5ffff
!	Mem[00000000201c0000] = ff5e1c80, %l2 = 00000000d55a0800
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000085ad5, Mem[0000000030141408] = ffffff31
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff5ad5
!	%l6 = 0000000000085ad5, Mem[0000000010081430] = 52c0cea4403f9dfe
	stx	%l6,[%i2+0x030]		! Mem[0000000010081430] = 0000000000085ad5
!	%l6 = 00085ad5, %l7 = 73991801, Mem[0000000010041410] = 2f00e86d 0765d857
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00085ad5 73991801
!	%l0 = 00000000000038a3, Mem[00000000201c0000] = ff5e1c80
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = a35e1c80
!	%f26 = 00085ad5 fffffe70, %l1 = 0000000000000000
!	Mem[00000000300c1418] = 431abc3a64eb5f23
	add	%i3,0x018,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_SL ! Mem[00000000300c1418] = 431abc3a64eb5f23
!	Mem[00000000100c142c] = ff00e86d, %l6 = 0000000000085ad5
	ldstuba	[%i3+0x02c]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 174185e2, %l3 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000017
!	%l3 = 0000000000000017, Mem[0000000010041408] = 9e326aae
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00176aae

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff5f155a, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 553b0800, %l2 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000800
!	Mem[0000000030181410] = ff854b01, %l7 = 0000000073991801
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffff85
!	Mem[0000000030141410] = 6d000036, %l2 = 0000000000000800
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 000000000000006d
!	Mem[0000000010001420] = 79ad815889df4509, %l7 = ffffffffffffff85, %asi = 80
	ldxa	[%i0+0x020]%asi,%l7	! %l7 = 79ad815889df4509
!	Mem[00000000100c1408] = 00083b55, %l5 = 0000000034c1ef9e, %asi = 80
	ldsha	[%i3+0x008]%asi,%l5	! %l5 = 0000000000000008
!	%f6  = 6ef9904a, %f19 = 00000000, %f7  = 520318f3
	fsubs	%f6 ,%f19,%f7 		! %f7  = 6ef9904a
!	Mem[0000000010081400] = ff000000, %l1 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 410df4cf, %l7 = 79ad815889df4509
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000041
!	Mem[0000000010081400] = ff000000, %l3 = 0000000000000017
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffff000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000000038a3
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffffff
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000006d
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffff000000
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000008
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000041
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000560,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p0_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 4851100d 62f484d1
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00ff0000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 174185e2 553b0800
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 6ef9904a 6ef9904a
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 2f000000 89df4509
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 4f4a7756 3cda8c4f
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 328f9182 522af24b
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 56ac5357 d7ff9808
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 5e000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 4803417d
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 051d7c38 5e2a0869
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 57ff9808 3f6812f9
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00085ad5 fffffe70
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 6de8002f 57d86507
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 321af352 55e96adb
	bne	%xcc,p0_freg_fail
	nop

!	The test for processor 0 has passed

p0_passed:
	ta	GOOD_TRAP
	nop

p0_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p0_failed
p0_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p0_failed
p0_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p0_failed
p0_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p0_failed
p0_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p0_failed
p0_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p0_failed
p0_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p0_failed
p0_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p0_failed
p0_freg_fail:
	ta	BAD_TRAP


!	The test for processor 0 failed

p0_failed:
	set	p0_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	stx	%fsr,[%g6+24]
	ta	BAD_TRAP


!	The local area data for processor 0 failed

p0_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g6,[%g5+0x000]		! Set processor 0 done flag

	set	p0_temp,%g6
	add	%g1,%g4,%g1
	stx	%g4,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	st	%fsr,[%g6+24]
	ta	BAD_TRAP

p0_selfmod_failed:
	ba	p0_failed
	mov	0xabc,%g1

p0_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p0_failed
	mov	0x0,%g3

inst_access_handler:
	done 

	.align	256
data_access_handler:
1:	done

check_critical_timed_out:
	ta	BAD_TRAP


get_thread_mask:
	retl
	mov	3,%i7

get_park_semaphore:
	set	park_semaphore,%g6
	mov	100,%g5
1:	ldstub	[%g6],%g7
	cmp	%g7,0
	bne	1b
	nop
	retl
	nop

p0_init_memory_pointers:
	set	p0_init_registers,%g1
	mov	%g0,%g2
	mov	%g0,%g3
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p0_local0_start,%i0
	set	p0_local1_start,%i1
	set	p0_local2_start,%i2
	set	p0_local3_start,%i3
	set	p0_local4_start,%i4
	set	p0_local5_start,%i5
	set	p0_local6_start,%i6
	clr	%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0		! %l0 = c6b1be98b43fb7ce
	ldx	[%g1+0x008],%l1		! %l1 = 39dbf07f4468fb79
	ldx	[%g1+0x010],%l2		! %l2 = 36426d0308588b34
	ldx	[%g1+0x018],%l3		! %l3 = 64fd607dec39e9ff
	ldx	[%g1+0x020],%l4		! %l4 = 2867bfba2cdd2ada
	ldx	[%g1+0x028],%l5		! %l5 = a6a1dfc9bdd1f0c5
	ldx	[%g1+0x030],%l6		! %l6 = f24ee6cf30926ec0
	ldx	[%g1+0x038],%l7		! %l7 = b83dc1e18fbe67cb

!	Initialize the output register of window 0

	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	mov	0x08,%o4
	mov	0x10,%o5
	mov	0x18,%o6

	retl
	nop

user_text_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_0_le,p0_near_0_he
	.global	p0_near_0_lo,p0_near_0_ho
	.global	near0_b2b_l,near0_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near0_start:
p0_near_0_le:
	ldsb	[%i0+0x01c],%l0		! Mem[000000001000141c]
	xnor	%l1,%l0,%l4
	umul	%l0,0x519,%l2
	sub	%l2,%l6,%l7
	swap	[%i5+0x02c],%l3		! Mem[000000001014142c]
	mulx	%l7,0x614,%l2
	jmpl	%o7,%g0
	or	%l7,%l1,%l3
p0_near_0_he:
	jmpl	%o7,%g0
	mulx	%l0,0x554,%l0
	jmpl	%o7,%g0
	nop
p0_near_0_lo:
	ldsb	[%o0+0x01c],%l0		! Mem[000000001000141c]
	xnor	%l1,%l0,%l4
	umul	%l0,0x519,%l2
	sub	%l2,%l6,%l7
	swap	[%o5+0x02c],%l3		! Mem[000000001014142c]
	mulx	%l7,0x614,%l2
	jmpl	%o7,%g0
	or	%l7,%l1,%l3
p0_near_0_ho:
	jmpl	%o7,%g0
	mulx	%l0,0x554,%l0
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	udivx	%l3,%l2,%l4
	addc	%l7,-0x2f2,%l1
	udivx	%l6,0x8a8,%l5
	xnor	%l6,0xcf6,%l6
	fmuls	%f31,%f23,%f25
	xnor	%l2,-0x578,%l5
	sub	%l7,%l4,%l6
	jmpl	%o7,%g0
	umul	%l6,-0x0e0,%l1
near0_b2b_l:
	umul	%l7,-0x3d0,%l5
	sdivx	%l6,0xf55,%l1
	sub	%l4,0x8c2,%l4
	fsubs	%f14,%f11,%f9 
	udivx	%l0,0xd1b,%l1
	subc	%l0,-0x065,%l5
	sdivx	%l5,0x5f2,%l4
	jmpl	%o7,%g0
	fcmps	%fcc0,%f6 ,%f15
user_near0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_1_le,p0_near_1_he
	.global	p0_near_1_lo,p0_near_1_ho
	.global	near1_b2b_l,near1_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near1_start:
p0_near_1_le:
	smul	%l2,%l3,%l1
	sub	%l6,-0x6a1,%l0
	sdivx	%l7,%l7,%l6
	smul	%l5,0x6a2,%l3
	mulx	%l2,%l7,%l5
	jmpl	%o7,%g0
	or	%l5,0xc45,%l6
p0_near_1_he:
	stb	%l2,[%i5+0x02d]		! Mem[000000001014142d]
	fcmps	%fcc1,%f19,%f27
	udivx	%l1,%l0,%l7
	jmpl	%o7,%g0
	umul	%l3,0xee2,%l1
p0_near_1_lo:
	smul	%l2,%l3,%l1
	sub	%l6,-0x6a1,%l0
	sdivx	%l7,%l7,%l6
	smul	%l5,0x6a2,%l3
	mulx	%l2,%l7,%l5
	jmpl	%o7,%g0
	or	%l5,0xc45,%l6
p0_near_1_ho:
	stb	%l2,[%o5+0x02d]		! Mem[000000001014142d]
	fcmps	%fcc1,%f19,%f27
	udivx	%l1,%l0,%l7
	jmpl	%o7,%g0
	umul	%l3,0xee2,%l1
near1_b2b_h:
	fadds	%f20,%f27,%f20
	andn	%l1,%l5,%l4
	fmuls	%f16,%f23,%f27
	xnor	%l6,%l1,%l5
	addc	%l7,-0x1ff,%l0
	jmpl	%o7,%g0
	fadds	%f31,%f17,%f19
near1_b2b_l:
	xor	%l1,%l2,%l4
	fmuls	%f6 ,%f4 ,%f5 
	fsubs	%f13,%f11,%f11
	fadds	%f9 ,%f3 ,%f2 
	fadds	%f2 ,%f15,%f6 
	jmpl	%o7,%g0
	mulx	%l6,%l4,%l0
user_near1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_2_le,p0_near_2_he
	.global	p0_near_2_lo,p0_near_2_ho
	.global	near2_b2b_l,near2_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	umul	%l0,%l7,%l4
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	fmuls	%f24,%f26,%f16
	fcmps	%fcc3,%f25,%f20
	and	%l2,-0xfd8,%l5
	add	%l2,-0xf7d,%l2
	fitod	%f20,%f16
	sub	%l3,%l1,%l7
	sdivx	%l5,%l7,%l3
	jmpl	%o7,%g0
	std	%f22,[%i6+0x030]	! Mem[0000000010181430]
p0_near_2_lo:
	jmpl	%o7,%g0
	umul	%l0,%l7,%l4
	jmpl	%o7,%g0
	nop
p0_near_2_ho:
	fmuls	%f24,%f26,%f16
	fcmps	%fcc3,%f25,%f20
	and	%l2,-0xfd8,%l5
	add	%l2,-0xf7d,%l2
	fitod	%f20,%f16
	sub	%l3,%l1,%l7
	sdivx	%l5,%l7,%l3
	jmpl	%o7,%g0
	std	%f22,[%o6+0x030]	! Mem[0000000010181430]
near2_b2b_h:
	add	%l7,0x298,%l0
	jmpl	%o7,%g0
	fsubs	%f22,%f20,%f28
near2_b2b_l:
	addc	%l6,%l4,%l7
	jmpl	%o7,%g0
	subc	%l3,%l6,%l5
user_near2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_3_le,p0_near_3_he
	.global	p0_near_3_lo,p0_near_3_ho
	.global	near3_b2b_l,near3_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near3_start:
p0_near_3_le:
	ldsw	[%i2+0x000],%l1		! Mem[0000000010081400]
	jmpl	%o7,%g0
	sdivx	%l0,0xab5,%l4
p0_near_3_he:
	andn	%l5,0x055,%l7
	sdivx	%l4,0x2ca,%l2
	subc	%l0,%l1,%l5
	lduw	[%i3+0x01c],%l1		! Mem[00000000100c141c]
	jmpl	%o7,%g0
	umul	%l7,%l5,%l1
p0_near_3_lo:
	ldsw	[%o2+0x000],%l1		! Mem[0000000010081400]
	jmpl	%o7,%g0
	sdivx	%l0,0xab5,%l4
p0_near_3_ho:
	andn	%l5,0x055,%l7
	sdivx	%l4,0x2ca,%l2
	subc	%l0,%l1,%l5
	lduw	[%o3+0x01c],%l1		! Mem[00000000100c141c]
	jmpl	%o7,%g0
	umul	%l7,%l5,%l1
near3_b2b_h:
	subc	%l4,%l6,%l3
	and	%l3,%l4,%l5
	fadds	%f30,%f29,%f19
	or	%l3,-0x627,%l1
	jmpl	%o7,%g0
	fcmps	%fcc3,%f22,%f29
near3_b2b_l:
	xnor	%l7,%l5,%l7
	sub	%l4,%l6,%l0
	and	%l4,-0x957,%l2
	andn	%l1,%l1,%l6
	jmpl	%o7,%g0
	andn	%l0,-0x04c,%l1
user_near3_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_0_le,p0_far_0_he
	.global	p0_far_0_lo,p0_far_0_ho
	.global	far0_b2b_l,far0_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far0_start:
p0_far_0_le:
	umul	%l0,-0x7bb,%l7
	add	%l2,%l6,%l7
	fsqrts	%f11,%f12
	orn	%l4,%l5,%l0
	or	%l4,-0xccd,%l4
	jmpl	%o7,%g0
	ldd	[%i3+0x030],%f2 	! Mem[00000000100c1430]
p0_far_0_he:
	sdivx	%l4,%l7,%l3
	and	%l1,%l0,%l0
	udivx	%l3,0xae0,%l1
	jmpl	%o7,%g0
	andn	%l0,%l3,%l4
p0_far_0_lo:
	umul	%l0,-0x7bb,%l7
	add	%l2,%l6,%l7
	fsqrts	%f11,%f12
	orn	%l4,%l5,%l0
	or	%l4,-0xccd,%l4
	jmpl	%o7,%g0
	ldd	[%o3+0x030],%f2 	! Mem[00000000100c1430]
p0_far_0_ho:
	sdivx	%l4,%l7,%l3
	and	%l1,%l0,%l0
	udivx	%l3,0xae0,%l1
	jmpl	%o7,%g0
	andn	%l0,%l3,%l4
far0_b2b_h:
	orn	%l7,%l3,%l5
	smul	%l6,0x116,%l0
	xnor	%l1,%l5,%l4
	jmpl	%o7,%g0
	umul	%l7,-0x09b,%l2
far0_b2b_l:
	smul	%l5,0x953,%l6
	subc	%l5,%l2,%l5
	fsqrts	%f2 ,%f2 
	jmpl	%o7,%g0
	fdivs	%f5 ,%f7 ,%f9 
user_far0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_1_le,p0_far_1_he
	.global	p0_far_1_lo,p0_far_1_ho
	.global	far1_b2b_l,far1_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far1_start:
p0_far_1_le:
	fstoi	%f3 ,%f1 
	fmuls	%f1 ,%f12,%f10
	jmpl	%o7,%g0
	mulx	%l4,%l5,%l7
p0_far_1_he:
	xnor	%l7,%l5,%l1
	jmpl	%o7,%g0
	orn	%l4,-0x630,%l5
p0_far_1_lo:
	fstoi	%f3 ,%f1 
	fmuls	%f1 ,%f12,%f10
	jmpl	%o7,%g0
	mulx	%l4,%l5,%l7
p0_far_1_ho:
	xnor	%l7,%l5,%l1
	jmpl	%o7,%g0
	orn	%l4,-0x630,%l5
far1_b2b_h:
	add	%l6,-0xc1c,%l6
	fdivs	%f27,%f25,%f23
	jmpl	%o7,%g0
	fsqrts	%f21,%f23
far1_b2b_l:
	xor	%l3,%l5,%l3
	fdivs	%f11,%f4 ,%f13
	jmpl	%o7,%g0
	subc	%l3,-0x540,%l2
user_far1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_2_le,p0_far_2_he
	.global	p0_far_2_lo,p0_far_2_ho
	.global	far2_b2b_l,far2_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far2_start:
p0_far_2_le:
	orn	%l7,0xb84,%l2
	fsubs	%f1 ,%f14,%f14
	ldsw	[%i5+0x01c],%l7		! Mem[000000001014141c]
	fdivs	%f14,%f11,%f4 
	addc	%l5,0x5b9,%l4
	fsubs	%f8 ,%f12,%f13
	fcmps	%fcc0,%f1 ,%f6 
	jmpl	%o7,%g0
	xnor	%l6,%l7,%l0
p0_far_2_he:
	andn	%l2,%l1,%l4
	fmuls	%f28,%f23,%f18
	sub	%l4,0xa96,%l4
	fstod	%f28,%f24
	udivx	%l1,0x8ae,%l7
	jmpl	%o7,%g0
	addc	%l7,-0xb5b,%l4
p0_far_2_lo:
	orn	%l7,0xb84,%l2
	fsubs	%f1 ,%f14,%f14
	ldsw	[%o5+0x01c],%l7		! Mem[000000001014141c]
	fdivs	%f14,%f11,%f4 
	addc	%l5,0x5b9,%l4
	fsubs	%f8 ,%f12,%f13
	fcmps	%fcc0,%f1 ,%f6 
	jmpl	%o7,%g0
	xnor	%l6,%l7,%l0
p0_far_2_ho:
	andn	%l2,%l1,%l4
	fmuls	%f28,%f23,%f18
	sub	%l4,0xa96,%l4
	fstod	%f28,%f24
	udivx	%l1,0x8ae,%l7
	jmpl	%o7,%g0
	addc	%l7,-0xb5b,%l4
far2_b2b_h:
	subc	%l4,%l4,%l4
	jmpl	%o7,%g0
	andn	%l5,-0x4f1,%l5
far2_b2b_l:
	umul	%l2,-0x047,%l7
	jmpl	%o7,%g0
	fdivs	%f2 ,%f9 ,%f11
user_far2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_3_le,p0_far_3_he
	.global	p0_far_3_lo,p0_far_3_ho
	.global	far3_b2b_l,far3_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far3_start:
p0_far_3_le:
	fmuls	%f5 ,%f1 ,%f9 
	jmpl	%o7,%g0
	smul	%l1,%l0,%l3
p0_far_3_he:
	mulx	%l3,-0x269,%l5
	subc	%l5,-0xe66,%l5
	or	%l1,%l7,%l5
	umul	%l3,0xa0e,%l7
	sdivx	%l3,%l7,%l6
	sdivx	%l1,0x6db,%l6
	or	%l0,-0x6c5,%l6
	jmpl	%o7,%g0
	mulx	%l0,-0xf17,%l2
p0_far_3_lo:
	fmuls	%f5 ,%f1 ,%f9 
	jmpl	%o7,%g0
	smul	%l1,%l0,%l3
p0_far_3_ho:
	mulx	%l3,-0x269,%l5
	subc	%l5,-0xe66,%l5
	or	%l1,%l7,%l5
	umul	%l3,0xa0e,%l7
	sdivx	%l3,%l7,%l6
	sdivx	%l1,0x6db,%l6
	or	%l0,-0x6c5,%l6
	jmpl	%o7,%g0
	mulx	%l0,-0xf17,%l2
far3_b2b_h:
	addc	%l7,%l3,%l6
	smul	%l0,0xc11,%l4
	fdivs	%f28,%f26,%f19
	and	%l6,%l1,%l0
	jmpl	%o7,%g0
	mulx	%l6,%l2,%l3
far3_b2b_l:
	xnor	%l2,0x620,%l1
	fadds	%f6 ,%f14,%f1 
	fcmps	%fcc0,%f6 ,%f12
	fstoi	%f6 ,%f3 
	jmpl	%o7,%g0
	or	%l4,%l2,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	sub	%l5,0xfc8,%l4
	fadds	%f13,%f10,%f12
	smul	%l6,0xcb4,%l5
	fadds	%f13,%f15,%f1 
	udivx	%l2,%l0,%l1
	smul	%l5,-0x965,%l2
	jmpl	%g6+8,%g0
	addc	%l7,%l1,%l3
p0_call_0_le:
	smul	%l1,%l4,%l4
	orn	%l4,%l6,%l6
	umul	%l0,0x4d1,%l7
	ldd	[%i0+0x028],%l2		! Mem[0000000010001428]
	st	%f12,[%i2+%o5]		! Mem[0000000010081410]
	fsubs	%f10,%f12,%f6 
	retl
	mulx	%l4,-0x8e5,%l2
p0_jmpl_0_lo:
	sub	%l5,0xfc8,%l4
	fadds	%f13,%f10,%f12
	smul	%l6,0xcb4,%l5
	fadds	%f13,%f15,%f1 
	udivx	%l2,%l0,%l1
	smul	%l5,-0x965,%l2
	jmpl	%g6+8,%g0
	addc	%l7,%l1,%l3
p0_call_0_lo:
	smul	%l1,%l4,%l4
	orn	%l4,%l6,%l6
	umul	%l0,0x4d1,%l7
	ldd	[%o0+0x028],%l2		! Mem[0000000010001428]
	st	%f12,[%o2+%i5]		! Mem[0000000010081410]
	fsubs	%f10,%f12,%f6 
	retl
	mulx	%l4,-0x8e5,%l2
p0_jmpl_0_he:
	fcmps	%fcc1,%f27,%f25
	fcmps	%fcc3,%f31,%f26
	sub	%l7,0x1c8,%l7
	sub	%l6,0xbfb,%l1
	mulx	%l0,%l1,%l3
	or	%l4,0xa2e,%l2
	jmpl	%g6+8,%g0
	addc	%l1,-0xb62,%l7
p0_call_0_he:
	addc	%l2,0xfca,%l4
	fdivs	%f18,%f20,%f20
	retl
	andn	%l2,%l3,%l4
p0_jmpl_0_ho:
	fcmps	%fcc1,%f27,%f25
	fcmps	%fcc3,%f31,%f26
	sub	%l7,0x1c8,%l7
	sub	%l6,0xbfb,%l1
	mulx	%l0,%l1,%l3
	or	%l4,0xa2e,%l2
	jmpl	%g6+8,%g0
	addc	%l1,-0xb62,%l7
p0_call_0_ho:
	addc	%l2,0xfca,%l4
	fdivs	%f18,%f20,%f20
	retl
	andn	%l2,%l3,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fdivs	%f4 ,%f2 ,%f5 
	andn	%l2,%l7,%l3
	add	%l6,0x14b,%l6
	fcmps	%fcc1,%f5 ,%f10
	lduw	[%i4+0x034],%l1		! Mem[0000000010101434]
	jmpl	%g6+8,%g0
	xnor	%l0,%l1,%l5
p0_call_1_le:
	retl
	smul	%l6,-0xc61,%l3
p0_jmpl_1_lo:
	fdivs	%f4 ,%f2 ,%f5 
	andn	%l2,%l7,%l3
	add	%l6,0x14b,%l6
	fcmps	%fcc1,%f5 ,%f10
	lduw	[%o4+0x034],%l1		! Mem[0000000010101434]
	jmpl	%g6+8,%g0
	xnor	%l0,%l1,%l5
p0_call_1_lo:
	retl
	smul	%l6,-0xc61,%l3
p0_jmpl_1_he:
	orn	%l1,%l7,%l4
	jmpl	%g6+8,%g0
	and	%l5,%l5,%l3
p0_call_1_he:
	fsqrts	%f21,%f17
	stw	%l6,[%i0+0x008]		! Mem[0000000010001408]
	retl
	fitod	%f22,%f22
p0_jmpl_1_ho:
	orn	%l1,%l7,%l4
	jmpl	%g6+8,%g0
	and	%l5,%l5,%l3
p0_call_1_ho:
	fsqrts	%f21,%f17
	stw	%l6,[%o0+0x008]		! Mem[0000000010001408]
	retl
	fitod	%f22,%f22
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	smul	%l5,-0xe48,%l0
	ldstub	[%i1+0x006],%l1		! Mem[0000000010041406]
	jmpl	%g6+8,%g0
	smul	%l2,%l4,%l3
p0_call_2_le:
	sdivx	%l6,0x575,%l7
	fitos	%f11,%f7 
	subc	%l0,-0x56a,%l3
	fsqrts	%f7 ,%f12
	fdivs	%f13,%f6 ,%f15
	udivx	%l1,0x2f9,%l3
	retl
	fadds	%f14,%f15,%f6 
p0_jmpl_2_lo:
	smul	%l5,-0xe48,%l0
	ldstub	[%o1+0x006],%l1		! Mem[0000000010041406]
	jmpl	%g6+8,%g0
	smul	%l2,%l4,%l3
p0_call_2_lo:
	sdivx	%l6,0x575,%l7
	fitos	%f11,%f7 
	subc	%l0,-0x56a,%l3
	fsqrts	%f7 ,%f12
	fdivs	%f13,%f6 ,%f15
	udivx	%l1,0x2f9,%l3
	retl
	fadds	%f14,%f15,%f6 
p0_jmpl_2_he:
	std	%f26,[%i3+0x028]	! Mem[00000000100c1428]
	xnor	%l3,0x7c7,%l7
	jmpl	%g6+8,%g0
	umul	%l4,%l4,%l3
p0_call_2_he:
	mulx	%l6,0x669,%l2
	mulx	%l6,0xa3b,%l1
	subc	%l3,-0x892,%l3
	ldub	[%o2+0x000],%l2		! Mem[00000000211c0000]
	fsubs	%f27,%f17,%f19
	add	%l4,-0x3fc,%l0
	retl
	add	%l5,%l1,%l7
p0_jmpl_2_ho:
	std	%f26,[%o3+0x028]	! Mem[00000000100c1428]
	xnor	%l3,0x7c7,%l7
	jmpl	%g6+8,%g0
	umul	%l4,%l4,%l3
p0_call_2_ho:
	mulx	%l6,0x669,%l2
	mulx	%l6,0xa3b,%l1
	subc	%l3,-0x892,%l3
	ldub	[%i2+0x000],%l2		! Mem[00000000211c0000]
	fsubs	%f27,%f17,%f19
	add	%l4,-0x3fc,%l0
	retl
	add	%l5,%l1,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fmuls	%f6 ,%f9 ,%f5 
	xor	%l2,-0xd6e,%l7
	or	%l6,-0x898,%l7
	xor	%l7,%l7,%l0
	smul	%l7,-0x02f,%l7
	jmpl	%g6+8,%g0
	umul	%l6,%l2,%l6
p0_call_3_le:
	fadds	%f7 ,%f5 ,%f0 
	umul	%l0,0xd38,%l3
	sub	%l3,%l0,%l6
	orn	%l5,%l4,%l7
	mulx	%l1,-0xa55,%l4
	add	%l7,-0xb43,%l3
	fadds	%f14,%f15,%f9 
	retl
	orn	%l1,-0x0d6,%l5
p0_jmpl_3_lo:
	fmuls	%f6 ,%f9 ,%f5 
	xor	%l2,-0xd6e,%l7
	or	%l6,-0x898,%l7
	xor	%l7,%l7,%l0
	smul	%l7,-0x02f,%l7
	jmpl	%g6+8,%g0
	umul	%l6,%l2,%l6
p0_call_3_lo:
	fadds	%f7 ,%f5 ,%f0 
	umul	%l0,0xd38,%l3
	sub	%l3,%l0,%l6
	orn	%l5,%l4,%l7
	mulx	%l1,-0xa55,%l4
	add	%l7,-0xb43,%l3
	fadds	%f14,%f15,%f9 
	retl
	orn	%l1,-0x0d6,%l5
p0_jmpl_3_he:
	addc	%l4,%l4,%l6
	smul	%l5,-0x668,%l3
	or	%l5,%l6,%l3
	fdivs	%f16,%f19,%f21
	xnor	%l0,-0xdf5,%l4
	jmpl	%g6+8,%g0
	fdivs	%f17,%f16,%f19
p0_call_3_he:
	addc	%l1,-0xf28,%l7
	sdivx	%l2,%l0,%l3
	xnor	%l1,%l5,%l7
	ldd	[%i0+0x020],%f20	! Mem[0000000010001420]
	lduw	[%i1+0x020],%l4		! Mem[0000000010041420]
	retl
	fadds	%f24,%f30,%f23
p0_jmpl_3_ho:
	addc	%l4,%l4,%l6
	smul	%l5,-0x668,%l3
	or	%l5,%l6,%l3
	fdivs	%f16,%f19,%f21
	xnor	%l0,-0xdf5,%l4
	jmpl	%g6+8,%g0
	fdivs	%f17,%f16,%f19
p0_call_3_ho:
	addc	%l1,-0xf28,%l7
	sdivx	%l2,%l0,%l3
	xnor	%l1,%l5,%l7
	ldd	[%o0+0x020],%f20	! Mem[0000000010001420]
	lduw	[%o1+0x020],%l4		! Mem[0000000010041420]
	retl
	fadds	%f24,%f30,%f23
user_jump3_end:

	.seg	"data"
	.align	0x2000
user_data_start:
done_flags:
	.word	0
	.align	8
done_count:
	.word	0,0
Start_Flags:
	.word	0,0,0,0
	.align	64
Finish_Flag:
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.align	8
num_processors:
	.word	1
v8_binary:
	.word	0
no_fpu:
	.word	0
max_ireg:
	.word	8,0
max_freg:
	.word	32,0
	.align	8
park_semaphore:
	.word	0,0
	.align	64
p0_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_fsr:
	.word	0x00000000,0x00000000
	.align	8
p0_loop_cnt:
	.word	1,0
max_windows:
	.word	1,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0

	.align	8
p0_init_registers:
	.word	0xc6b1be98,0xb43fb7ce		! Init value for %l0
	.word	0x39dbf07f,0x4468fb79		! Init value for %l1
	.word	0x36426d03,0x08588b34		! Init value for %l2
	.word	0x64fd607d,0xec39e9ff		! Init value for %l3
	.word	0x2867bfba,0x2cdd2ada		! Init value for %l4
	.word	0xa6a1dfc9,0xbdd1f0c5		! Init value for %l5
	.word	0xf24ee6cf,0x30926ec0		! Init value for %l6
	.word	0xb83dc1e1,0x8fbe67cb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x1feb9920,0x04bc80b1		! Init value for %f0 
	.word	0x125c5b5e,0x512abb37		! Init value for %f2 
	.word	0x302e600c,0x2f00e86d		! Init value for %f4 
	.word	0x11891eaa,0x5277f1d3		! Init value for %f6 
	.word	0x15e1eab8,0x1d85ace9		! Init value for %f8 
	.word	0x4e73d3b6,0x64093b2f		! Init value for %f10
	.word	0x5a7e8524,0x12426a25		! Init value for %f12
	.word	0x31c42682,0x152c134b		! Init value for %f14
	.word	0x1f7e3b50,0x7b117c21		! Init value for %f16
	.word	0x33c1830e,0x5f76b627		! Init value for %f18
	.word	0x2308d93c,0x082bfedd		! Init value for %f20
	.word	0x5b5f155a,0x52241fc3		! Init value for %f22
	.word	0x745feae8,0x5b65ce59		! Init value for %f24
	.word	0x7b07c966,0x6c300c1f		! Init value for %f26
	.word	0x640abc54,0x2c298695		! Init value for %f28
	.word	0x172a4b32,0x6132f73b		! Init value for %f30
	.word	0x7bc25980,0x7c348391		! Init value for %f32
	.word	0x228506be,0x44fe1d17		! Init value for %f34
	.word	0x0a1d8e6c,0x3912e14d		! Init value for %f36
	.word	0x7c32280a,0x59f779b3		! Init value for %f38
	.word	0x0dfce718,0x665b7bc9		! Init value for %f40
	.word	0x5b739b16,0x7e35c90f		! Init value for %f42
	.word	0x0db6af84,0x2cabef05		! Init value for %f44
	.word	0x153f0be2,0x735c872b		! Init value for %f46
	.word	0x2602f3b0,0x69649701
	.word	0x6789e66e,0x7d37f007
	.word	0x5ca77f9c,0x1b248fbd
	.word	0x365556ba,0x1318ffa3
	.word	0x02e3df48,0x4705b539
	.word	0x667a48c6,0x1ff171ff
	.word	0x339d5eb4,0x3298a375
	.word	0x42356892,0x0d2fc31b
p0_share_mask:
	.word	0xffff0000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_registers:
	.word	0x00000000,0x000038a3		! %l0
	.word	0xffffffff,0xffffffff		! %l1
	.word	0x00000000,0x0000006d		! %l2
	.word	0xffffffff,0xff000000		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x00000008		! %l5
	.word	0x00000000,0x000000ff		! %l6
	.word	0x00000000,0x00000041		! %l7
p0_expected_fp_regs:
	.word	0x4851100d,0x62f484d1		! %f0
	.word	0x00000000,0x00ff0000		! %f2
	.word	0x174185e2,0x553b0800		! %f4
	.word	0x6ef9904a,0x6ef9904a		! %f6
	.word	0x2f000000,0x89df4509		! %f8
	.word	0x4f4a7756,0x3cda8c4f		! %f10
	.word	0x328f9182,0x522af24b		! %f12
	.word	0x56ac5357,0xd7ff9808		! %f14
	.word	0x5e000000,0xffffffff		! %f16
	.word	0x00000000,0x00000000		! %f18
	.word	0x00000000,0x4803417d		! %f20
	.word	0x051d7c38,0x5e2a0869		! %f22
	.word	0x57ff9808,0x3f6812f9		! %f24
	.word	0x00085ad5,0xfffffe70		! %f26
	.word	0x6de8002f,0x57d86507		! %f28
	.word	0x321af352,0x55e96adb		! %f30
	.word	0x00000010,0x00000120		! %fsr
p0_local0_expect:
	.word	0x5ad5ffff,0x00000000,0x00000000,0x0000d857 ! PA = 0000000010001400
	.word	0x00000000,0x000036ab,0x6ef9904a,0x520318f3 ! PA = 0000000010001410
	.word	0x79ad8158,0x89df4509,0x4f4a7756,0x3cda8c4f ! PA = 0000000010001420
	.word	0x00000000,0x00000000,0xffffff00,0x00000066 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xff0c306c,0xe8ea5f74,0x00326aae,0x3e000000 ! PA = 0000000030001400
	.word	0x4a90f96e,0x4a44509d,0x1298081a,0x4da28f83 ! PA = 0000000030001410
	.word	0x77fbc3a8,0x49b3cc19,0x66243826,0x45a687df ! PA = 0000000030001420
	.word	0x3946f114,0x53acf055,0x4c52f5f2,0x45af3efb ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x6710a74e,0x1af411bf,0x7c193172,0xa5cd95ab
	.word	0xc4747db6,0x98feebf7,0xb9d2651a,0xef6effa3
	.word	0xe171c89e,0x3104d3af,0x67aad142,0x4a9e431b
	.word	0x48db3006,0xfeecc0e7,0xdf445dea,0xace81813
p0_local1_expect:
	.word	0x00085ad5,0xfffffe70,0x00176aae,0x00000000 ! PA = 0000000010041400
	.word	0xd55a0800,0x01189973,0x5c1d8aca,0x00000180 ! PA = 0000000010041410
	.word	0x4142afd8,0x6ab5a989,0x670dff31,0x41fff4cf ! PA = 0000000010041420
	.word	0x35ffd444,0x063288c5,0x00000000,0x1f297eeb ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff4185e2,0x553b0800,0xe2ffffff,0x00000000 ! PA = 0000000030041400
	.word	0x08000000,0x00000000,0x6dbf297a,0x29f8cf63 ! PA = 0000000030041410
	.word	0x57ff9808,0x3f6812f9,0x0b1d9786,0x1b074dbf ! PA = 0000000030041420
	.word	0x48df7374,0x4cde6d35,0x321af352,0x55e96adb ! PA = 0000000030041430
p0_local2_expect:
	.word	0xff000000,0x01189973,0x00f01801,0x0000394b ! PA = 0000000010081400
	.word	0x57d86507,0x52241f6d,0x4c8fe42a,0xff2a3153 ! PA = 0000000010081410
	.word	0x051d7c38,0x5e2a0869,0x5e000000,0xffffffff ! PA = 0000000010081420
	.word	0x00000000,0x00085ad5,0x00007e24,0x0180bb00 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x076b8bc0,0x62f484d1,0xd55a0800,0x01189973 ! PA = 0000000030081400
	.word	0xff65d857,0x2f00e86d,0x6ef9904a,0x520318f3 ! PA = 0000000030081410
	.word	0x79ad8158,0x89df4509,0x4f4a7756,0x3cda8c4f ! PA = 0000000030081420
	.word	0x45955dc4,0x612dfc45,0x34ffd378,0x5e5b5c12 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00ff0000,0x0000ffff,0x00083b55,0xe2854117 ! PA = 00000000100c1400
	.word	0x00000000,0x000000ff,0x7f80ad8a,0xff5b7933 ! PA = 00000000100c1410
	.word	0x6ee83898,0x61189749,0x302e600c,0xff00e86d ! PA = 00000000100c1420
	.word	0x00000060,0x091de285,0x00980162,0x7eff36ab ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x0000002f,0x55c2e281,0x38a373c7,0x59b31a8b ! PA = 00000000300c1400
	.word	0x410df4cf,0x153eb33d,0x431abc3a,0x64eb5f23 ! PA = 00000000300c1410
	.word	0x762b10c8,0x4fc330b9,0x755ea646,0x07abe97f ! PA = 00000000300c1420
	.word	0x21d84807,0xfe78f3f5,0x2f0a3e12,0x266dd29b ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff412b60,0x553b61f1,0x34c1ef9e,0x77905677 ! PA = 0000000010101400
	.word	0xffd865ff,0xcff40d41,0xffffffff,0x0d677113 ! PA = 0000000010101410
	.word	0x7c27e4f8,0x7d795629,0x76de0ff6,0x4157de6f ! PA = 0000000010101420
	.word	0x72b39364,0x2c450034,0x3ba616c2,0x59b31a8b ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x00000000,0x00000000,0x366b8bc0,0x512abb37 ! PA = 0000000030101400
	.word	0xff5f155a,0x8aad807f,0x11891eaa,0x5277f1d3 ! PA = 0000000030101410
	.word	0x49a3fda3,0x03f9f0d7,0x572ad631,0x64093b2f ! PA = 0000000030101420
	.word	0x670d79d6,0x5277f1d3,0x7f800000,0xff5bf5f0 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x66c9077b,0x00000000,0xff000000,0x00000098 ! PA = 0000000010141400
	.word	0xc31f2452,0x5c52f336,0x53312aff,0x2ae48f4c ! PA = 0000000010141410
	.word	0xf1613b55,0x387c1d05,0xaf922965,0x5a34155a ! PA = 0000000010141420
	.word	0xfe9d3f40,0xa4cec052,0x04c43833,0x247e0000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xffff9808,0x3af32841,0xd55affff,0x7f3ebb47 ! PA = 0000000030141400
	.word	0x6d000036,0x0696e4fd,0x53280efa,0x75b0aee3 ! PA = 0000000030141410
	.word	0x30264988,0x47d70e79,0x5dfd7506,0x439f453f ! PA = 0000000030141420
	.word	0x0b76dcf4,0x342840b5,0x4dc348d2,0x487cfa5b ! PA = 0000000030141430
p0_local6_expect:
	.word	0x0000ff00,0x00000000,0x9eefff00,0x43150a37 ! PA = 0000000010181400
	.word	0x53312aff,0xff5bf5f0,0x741da9aa,0x49e770d3 ! PA = 0000000010181410
	.word	0x03580db8,0x067163ff,0x68724eb6,0x0000e285 ! PA = 0000000010181420
	.word	0x3e321824,0x4b4fd125,0x328f9182,0x522af24b ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0xff290000,0xaa1e8911,0xfff33afe,0x0e83c133 ! PA = 0000000030181400
	.word	0xff854b01,0x4679c5dd,0xd1ad6062,0x3a8b6bc3 ! PA = 0000000030181410
	.word	0x3bedcde8,0x64324559,0x31ec0466,0x49227b1f ! PA = 0000000030181420
	.word	0x4a620f54,0x43f3ad95,0x7ec77632,0x5ba4963b ! PA = 0000000030181430
share0_expect:
	.word	0xa35e1c80,0x43ab5a91,0x1f6e21be,0x3755ec17 ! PA = 00000000201c0000
	.word	0x4168c16c,0x2415684d,0x3b6a330a,0x3f4c78b3 ! PA = 00000000201c0010
	.word	0x04528a18,0x62f8b2c9,0x7d6d9616,0x114ef80f ! PA = 00000000201c0020
	.word	0x2a61c284,0x7a22d605,0x48ddf6e2,0x7db0e62b ! PA = 00000000201c0030
share1_expect:
	.word	0x363e76b0,0x1f242e01,0x7520c16e,0x55ee7f07 ! PA = 0000000020800000
	.word	0x369e729c,0x5fcbd6bd,0x7aa721ba,0x4e08bea3 ! PA = 0000000020800010
	.word	0x18b14248,0x3763ac39,0x3dba03c6,0x6ca160ff ! PA = 0000000020800020
	.word	0x164c31b4,0x78ac4a75,0x63061392,0x45d6e21b ! PA = 0000000020800030
	.word	0x0bd64ce0,0x28990d71,0x59e7bd1e,0x7ce07df7 ! PA = 0000000020800040
	.word	0x41f45fcc,0x25cc112d,0x08772c6a,0x486a3093 ! PA = 0000000020800050
	.word	0x76f4f678,0x38d231a9,0x45544d76,0x75b0b5ef ! PA = 0000000020800060
	.word	0x33fc5ce4,0x691f0ae5,0x0b32cc42,0x265d8a0b ! PA = 0000000020800070
share2_expect:
	.word	0xffff9f10,0x32c8f8e1,0x122614ce,0x4522e8e7 ! PA = 00000000211c0000
	.word	0x122588fc,0x7905179d,0x3aad531a,0x6d17ce83 ! PA = 00000000211c0010
	.word	0x0ec8a6a8,0x51634319,0x767f7326,0x3fd3f6df ! PA = 00000000211c0020
	.word	0x470d4414,0x03ca1755,0x1b1720f2,0x664bddfb ! PA = 00000000211c0030
share3_expect:
	.word	0x5b186d40,0x5b32f051,0x49fec87e,0x386cbfd7 ! PA = 0000000021800000
	.word	0x0bacee2c,0x2325ea0d,0x5adc95ca,0x47789873 ! PA = 0000000021800010
	.word	0x719752d8,0x6df5e089,0x733e74d6,0x472223cf ! PA = 0000000021800020
	.word	0x60d9e744,0x7fbc6fc5,0x382611a2,0x1168ddeb ! PA = 0000000021800030
	.word	0x4398b770,0x7a15f3c1,0x4554d82e,0x413502c7 ! PA = 0000000021800040
	.word	0x78c58f5c,0x249d887d,0x5657f47a,0x1fb38e63 ! PA = 0000000021800050
	.word	0x028bfb08,0x6e2909f9,0x4d545286,0x60723cbf ! PA = 0000000021800060
	.word	0x107d4674,0x02c51435,0x03929e52,0x683b89db ! PA = 0000000021800070
	.word	0x317c7da0,0x12710331,0x0fcb43de,0x1ab2b1b7 ! PA = 0000000021800080
	.word	0x396a6c8c,0x249af2ed,0x6e326f2a,0x6aafb053 ! PA = 0000000021800090
	.word	0x26919f38,0x145bbf69,0x36440c36,0x295b41af ! PA = 00000000218000a0
	.word	0x12d261a4,0x117304a5,0x4a4fc702,0x500ae1cb ! PA = 00000000218000b0
	.word	0x7c8ebfd0,0x42031ea1,0x2cc50b8e,0x40dccca7 ! PA = 00000000218000c0
	.word	0x735685bc,0x610d295d,0x673f05da,0x3a13fe43 ! PA = 00000000218000d0
	.word	0x74533f68,0x75ad00d9,0x2f50a1e6,0x7834329f ! PA = 00000000218000e0
	.word	0x027438d4,0x7f154115,0x35108bb2,0x42dde5bb ! PA = 00000000218000f0
	.word	0x6d5a7e00,0x314b4611,0x47652f3e,0x606a5397 ! PA = 0000000021800100
	.word	0x4204daec,0x1ea32bcd,0x3a10b88a,0x2c477833 ! PA = 0000000021800110
	.word	0x643bdb98,0x69fbce49,0x397d1396,0x4c140f8f ! PA = 0000000021800120
	.word	0x07bdcc04,0x5dbac985,0x7847ec62,0x3f7b95ab ! PA = 0000000021800130
	.word	0x2a2ab830,0x03887981,0x628eaeee,0x46d24687 ! PA = 0000000021800140
	.word	0x66b06c1c,0x18cbfa3d,0x42fa873a,0x5c711e23 ! PA = 0000000021800150
	.word	0x007673c8,0x7be727b9,0x058c6146,0x3cd1d87f ! PA = 0000000021800160
	.word	0x08ca1b34,0x6e329df5,0x0428e912,0x396af19b ! PA = 0000000021800170
	.word	0xff0a6e60,0x46b9b8f1,0x08e48a9e,0x524ba577 ! PA = 0000000021800180
	.word	0x7854394c,0x71b694ad,0x720f71ea,0x5277f013 ! PA = 0000000021800190
	.word	0x14ee07f8,0x58ce0d29,0x24018af6,0x6b048d6f ! PA = 00000000218001a0
	.word	0x59742664,0x100bbe65,0x34a681c2,0x08f2f98b ! PA = 00000000218001b0
	.word	0x2dc4a090,0x639e0461,0x7cc9c24e,0x61cd7067 ! PA = 00000000218001c0
	.word	0x13ab427c,0x2251fb1d,0x7b22789a,0x7302ee03 ! PA = 00000000218001d0
	.word	0x5f4d9828,0x40cf7e99,0x351f90a6,0x70032e5f ! PA = 00000000218001e0
	.word	0x6b56ed94,0x31952ad5,0x0173b672,0x5b1aad7b ! PA = 00000000218001f0
p0_invalidate_semaphore:
	.word	0,0
user_data_end:


SECTION	.p0_local0	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000010000000,0),
	PA = ra2pa(0x0000000010000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local0_start
p0_local0_begin:
	.skip	0x1400
p0_local0_start:
	.word	0x394b09e0,0x0ea0b671,0x1373221e,0x145b2ef7	! PA = 0000000010001400
	.word	0x67a1accc,0x6e900a2d,0x5fdba16a,0x136fb193	! PA = 0000000010001410
	.word	0x34ffd378,0x28c37aa9,0x729ed276,0x5ffa06ef	! PA = 0000000010001420
	.word	0x1f99c9e4,0x7b7ea3e5,0x20006142,0x54f3ab0b	! PA = 0000000010001430
p0_local0_end:

SECTION	.p0_local0_sec	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0_sec,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000030000000,0),
	PA = ra2pa(0x0000000030000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local0_sec_start
p0_local0_sec_begin:
	.skip	0x1400
p0_local0_sec_start:
	.word	0x2a659c10,0x12a7e1e1,0x6ea3b9ce,0x175ed9e7	! PA = 0000000030001400
	.word	0x7dc715fc,0x4a44509d,0x1298081a,0x4da28f83	! PA = 0000000030001410
	.word	0x77fbc3a8,0x49b3cc19,0x66243826,0x45a687df	! PA = 0000000030001420
	.word	0x3946f114,0x53acf055,0x4c52f5f2,0x45af3efb	! PA = 0000000030001430
p0_local0_sec_end:

SECTION	.p0_local1	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000010040000,0),
	PA = ra2pa(0x0000000010040000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local1_start
p0_local1_begin:
	.skip	0x1400
p0_local1_start:
	.word	0x77ddaa40,0x66f91951,0x293ead7e,0x03f9f0d7	! PA = 0000000010041400
	.word	0x2792bb2c,0x0bf0630d,0x5c1d8aca,0x01189973	! PA = 0000000010041410
	.word	0x4142afd8,0x6ab5a989,0x670d79d6,0x410df4cf	! PA = 0000000010041420
	.word	0x35ffd444,0x063288c5,0x30a026a2,0x1f297eeb	! PA = 0000000010041430
p0_local1_end:

SECTION	.p0_local1_sec	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1_sec,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000030040000,0),
	PA = ra2pa(0x0000000030040000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local1_sec_start
p0_local1_sec_begin:
	.skip	0x1400
p0_local1_sec_start:
	.word	0x59fe3470,0x37d35cc1,0x0b26fd2e,0x38a373c7	! PA = 0000000030041400
	.word	0x533f9c5c,0x4803417d,0x6dbf297a,0x29f8cf63	! PA = 0000000030041410
	.word	0x57ff9808,0x3f6812f9,0x0b1d9786,0x1b074dbf	! PA = 0000000030041420
	.word	0x48df7374,0x4cde6d35,0x321af352,0x55e96adb	! PA = 0000000030041430
p0_local1_sec_end:

SECTION	.p0_local2	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000010080000,0),
	PA = ra2pa(0x0000000010080000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local2_start
p0_local2_begin:
	.skip	0x1400
p0_local2_start:
	.word	0x72d23aa0,0x5c35ac31,0x23ffa8de,0x649262b7	! PA = 0000000010081400
	.word	0x04c8b98c,0x39abebed,0x4c8fe42a,0x712a3153	! PA = 0000000010081410
	.word	0x051d7c38,0x5e2a0869,0x07d79136,0x652992af	! PA = 0000000010081420
	.word	0x52c0cea4,0x403f9da5,0x61b65c02,0x033602cb	! PA = 0000000010081430
p0_local2_end:

SECTION	.p0_local2_sec	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2_sec,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000030080000,0),
	PA = ra2pa(0x0000000030080000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local2_sec_start
p0_local2_sec_begin:
	.skip	0x1400
p0_local2_sec_start:
	.word	0x7e24bcd0,0x45df07a1,0x7b2bb08e,0x77bdbda7	! PA = 0000000030081400
	.word	0x05e912bc,0x32d9625d,0x0162bada,0x1c53bf43	! PA = 0000000030081410
	.word	0x43475c68,0x301a89d9,0x627e66e6,0x69cbc39f	! PA = 0000000030081420
	.word	0x123ee5d4,0x47a51a15,0x2c2560b2,0x551646bb	! PA = 0000000030081430
p0_local2_sec_end:

SECTION	.p0_local3	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000100c0000,0),
	PA = ra2pa(0x00000000100c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local3_start
p0_local3_begin:
	.skip	0x1400
p0_local3_start:
	.word	0x0180bb00,0x714e6f11,0x3fce143e,0x12dc8497	! PA = 00000000100c1400
	.word	0x161ba7ec,0x0c3aa4cd,0x48caad8a,0x7ddc7933	! PA = 00000000100c1410
	.word	0x6ee83898,0x61189749,0x20151896,0x1c04e08f	! PA = 00000000100c1420
	.word	0x53b4b904,0x091de285,0x09db0162,0x7e5136ab	! PA = 00000000100c1430
p0_local3_end:

SECTION	.p0_local3_sec	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3_sec,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000300c0000,0),
	PA = ra2pa(0x00000000300c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local3_sec_start
p0_local3_sec_begin:
	.skip	0x1400
p0_local3_sec_start:
	.word	0x7c313530,0x55c2e281,0x78c9d3ee,0x7765b787	! PA = 00000000300c1400
	.word	0x1a9b791c,0x153eb33d,0x431abc3a,0x64eb5f23	! PA = 00000000300c1410
	.word	0x762b10c8,0x4fc330b9,0x755ea646,0x07abe97f	! PA = 00000000300c1420
	.word	0x213d4834,0x5978f6f5,0x2f0a3e12,0x266dd29b	! PA = 00000000300c1430
p0_local3_sec_end:

SECTION	.p0_local4	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000010100000,0),
	PA = ra2pa(0x0000000010100000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local4_start
p0_local4_begin:
	.skip	0x1400
p0_local4_start:
	.word	0x17412b60,0x553b61f1,0x34c1ef9e,0x77905677	! PA = 0000000010101400
	.word	0x4e63864c,0x04148dad,0x2465e6ea,0x0d677113	! PA = 0000000010101410
	.word	0x08fae4f8,0x7d795629,0x76de0ff6,0x4157de6f	! PA = 0000000010101420
	.word	0x72b39364,0x2c455765,0x3ba616c2,0x59b31a8b	! PA = 0000000010101430
p0_local4_end:

SECTION	.p0_local4_sec	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4_sec,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000030100000,0),
	PA = ra2pa(0x0000000030100000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local4_sec_start
p0_local4_sec_begin:
	.skip	0x1400
p0_local4_sec_start:
	.word	0x557b9d90,0x2c76ed61,0x3a19674e,0x66536167	! PA = 0000000030101400
	.word	0x722ecf7c,0x65ab341d,0x647f2d9a,0x0ff7af03	! PA = 0000000030101410
	.word	0x4902b528,0x7e5a0799,0x48d655a6,0x565fbf5f	! PA = 0000000030101420
	.word	0x5db29a94,0x03d203d5,0x6b618b72,0x79280e7b	! PA = 0000000030101430
p0_local4_sec_end:

SECTION	.p0_local5	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000010140000,0),
	PA = ra2pa(0x0000000010140000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local5_start
p0_local5_begin:
	.skip	0x1400
p0_local5_start:
	.word	0x436b8bc0,0x62f484d1,0x36f33afe,0x0765d857	! PA = 0000000010141400
	.word	0x7c7854ac,0x0db1a68d,0x6ef9904a,0x520318f3	! PA = 0000000010141410
	.word	0x79ad8158,0x69444509,0x4f4a7756,0x3cda8c4f	! PA = 0000000010141420
	.word	0x45955dc4,0x612dfc45,0x45af9c22,0x2a93ae6b	! PA = 0000000010141430
p0_local5_end:

SECTION	.p0_local5_sec	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5_sec,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000030140000,0),
	PA = ra2pa(0x0000000030140000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local5_sec_start
p0_local5_sec_begin:
	.skip	0x1400
p0_local5_sec_start:
	.word	0x275bf5f0,0x3af32841,0x71326aae,0x7f3ebb47	! PA = 0000000030141400
	.word	0x497b15dc,0x0696e4fd,0x53280efa,0x75b0aee3	! PA = 0000000030141410
	.word	0x30264988,0x47d70e79,0x5dfd7506,0x439f453f	! PA = 0000000030141420
	.word	0x0b76dcf4,0x342840b5,0x4dc348d2,0x487cfa5b	! PA = 0000000030141430
p0_local5_sec_end:

SECTION	.p0_local6	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000010180000,0),
	PA = ra2pa(0x0000000010180000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local6_start
p0_local6_begin:
	.skip	0x1400
p0_local6_start:
	.word	0x3157dc20,0x2171d7b1,0x7679f65e,0x43150a37	! PA = 0000000010181400
	.word	0x4b32130c,0x0189ef6d,0x741da9aa,0x49e770d3	! PA = 0000000010181410
	.word	0x03580db8,0x067163e9,0x68724eb6,0x0244ea2f	! PA = 0000000010181420
	.word	0x3e321824,0x4b4fd125,0x328f9182,0x522af24b	! PA = 0000000010181430
p0_local6_end:

SECTION	.p0_local6_sec	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6_sec,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000030180000,0),
	PA = ra2pa(0x0000000030180000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local6_sec_start
p0_local6_sec_begin:
	.skip	0x1400
p0_local6_sec_start:
	.word	0x2b2a3e50,0x1e2f9321,0x4c2cde0e,0x08dfc527	! PA = 0000000030181400
	.word	0x39584c3c,0x4679c5dd,0x38ad605a,0x3a4e5ec3	! PA = 0000000030181410
	.word	0x3bedcde8,0x64324559,0x31ec0466,0x49227b1f	! PA = 0000000030181420
	.word	0x4a620f54,0x43f3ad95,0x7ec77632,0x5ba4963b	! PA = 0000000030181430
p0_local6_sec_end:

SECTION	.share0	DATA_VA=0x00080e000

attr_data {
	Name = .share0,
	VA = 0x000000000080e000,
	RA = ra2pa(0x00000000201c0000,0),
	PA = ra2pa(0x00000000201c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share0_start
share0_begin:
share0_start:
	.word	0x285e1c80,0x43ab5a91,0x1f6e21be,0x3755ec17	! PA = 00000000201c0000
	.word	0x4168c16c,0x2415684d,0x3b6a330a,0x3f4c78b3	! PA = 00000000201c0010
	.word	0x04528a18,0x62f8b2c9,0x7d6d9616,0x114ef80f	! PA = 00000000201c0020
	.word	0x2a61c284,0x7a22d605,0x48ddf6e2,0x7db0e62b	! PA = 00000000201c0030
share0_end:

SECTION	.share1	DATA_VA=0x000810000

attr_data {
	Name = .share1,
	VA = 0x0000000000810000,
	RA = ra2pa(0x0000000020800000,0),
	PA = ra2pa(0x0000000020800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share1_start
share1_begin:
share1_start:
	.word	0x363e76b0,0x1f242e01,0x7520c16e,0x55ee7f07	! PA = 0000000020800000
	.word	0x369e729c,0x5fcbd6bd,0x7aa721ba,0x4e08bea3	! PA = 0000000020800010
	.word	0x18b14248,0x3763ac39,0x3dba03c6,0x6ca160ff	! PA = 0000000020800020
	.word	0x164c31b4,0x78ac4a75,0x63061392,0x45d6e21b	! PA = 0000000020800030
	.word	0x0bd64ce0,0x28990d71,0x59e7bd1e,0x7ce07df7	! PA = 0000000020800040
	.word	0x41f45fcc,0x25cc112d,0x08772c6a,0x486a3093	! PA = 0000000020800050
	.word	0x76f4f678,0x38d231a9,0x45544d76,0x75b0b5ef	! PA = 0000000020800060
	.word	0x33fc5ce4,0x691f0ae5,0x0b32cc42,0x265d8a0b	! PA = 0000000020800070
share1_end:

SECTION	.share2	DATA_VA=0x000812000

attr_data {
	Name = .share2,
	VA = 0x0000000000812000,
	RA = ra2pa(0x00000000211c0000,0),
	PA = ra2pa(0x00000000211c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share2_start
share2_begin:
share2_start:
	.word	0x39f09f10,0x32c8f8e1,0x122614ce,0x4522e8e7	! PA = 00000000211c0000
	.word	0x122588fc,0x7905179d,0x3aad531a,0x6d17ce83	! PA = 00000000211c0010
	.word	0x0ec8a6a8,0x51634319,0x767f7326,0x3fd3f6df	! PA = 00000000211c0020
	.word	0x470d4414,0x03ca1755,0x1b1720f2,0x664bddfb	! PA = 00000000211c0030
share2_end:

SECTION	.share3	DATA_VA=0x000814000

attr_data {
	Name = .share3,
	VA = 0x0000000000814000,
	RA = ra2pa(0x0000000021800000,0),
	PA = ra2pa(0x0000000021800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share3_start
share3_begin:
share3_start:
	.word	0x5b186d40,0x5b32f051,0x49fec87e,0x386cbfd7	! PA = 0000000021800000
	.word	0x0bacee2c,0x2325ea0d,0x5adc95ca,0x47789873	! PA = 0000000021800010
	.word	0x719752d8,0x6df5e089,0x733e74d6,0x472223cf	! PA = 0000000021800020
	.word	0x60d9e744,0x7fbc6fc5,0x382611a2,0x1168ddeb	! PA = 0000000021800030
	.word	0x4398b770,0x7a15f3c1,0x4554d82e,0x413502c7	! PA = 0000000021800040
	.word	0x78c58f5c,0x249d887d,0x5657f47a,0x1fb38e63	! PA = 0000000021800050
	.word	0x028bfb08,0x6e2909f9,0x4d545286,0x60723cbf	! PA = 0000000021800060
	.word	0x107d4674,0x02c51435,0x03929e52,0x683b89db	! PA = 0000000021800070
	.word	0x317c7da0,0x12710331,0x0fcb43de,0x1ab2b1b7	! PA = 0000000021800080
	.word	0x396a6c8c,0x249af2ed,0x6e326f2a,0x6aafb053	! PA = 0000000021800090
	.word	0x26919f38,0x145bbf69,0x36440c36,0x295b41af	! PA = 00000000218000a0
	.word	0x12d261a4,0x117304a5,0x4a4fc702,0x500ae1cb	! PA = 00000000218000b0
	.word	0x7c8ebfd0,0x42031ea1,0x2cc50b8e,0x40dccca7	! PA = 00000000218000c0
	.word	0x735685bc,0x610d295d,0x673f05da,0x3a13fe43	! PA = 00000000218000d0
	.word	0x74533f68,0x75ad00d9,0x2f50a1e6,0x7834329f	! PA = 00000000218000e0
	.word	0x027438d4,0x7f154115,0x35108bb2,0x42dde5bb	! PA = 00000000218000f0
	.word	0x465a7e00,0x314b4611,0x47652f3e,0x606a5397	! PA = 0000000021800100
	.word	0x4204daec,0x1ea32bcd,0x3a10b88a,0x2c477833	! PA = 0000000021800110
	.word	0x643bdb98,0x69fbce49,0x397d1396,0x4c140f8f	! PA = 0000000021800120
	.word	0x07bdcc04,0x5dbac985,0x7847ec62,0x3f7b95ab	! PA = 0000000021800130
	.word	0x2a2ab830,0x03887981,0x628eaeee,0x46d24687	! PA = 0000000021800140
	.word	0x66b06c1c,0x18cbfa3d,0x42fa873a,0x5c711e23	! PA = 0000000021800150
	.word	0x007673c8,0x7be727b9,0x058c6146,0x3cd1d87f	! PA = 0000000021800160
	.word	0x08ca1b34,0x6e329df5,0x0428e912,0x396af19b	! PA = 0000000021800170
	.word	0x6d0a6e60,0x46b9b8f1,0x08e48a9e,0x524ba577	! PA = 0000000021800180
	.word	0x7854394c,0x71b694ad,0x720f71ea,0x5277f013	! PA = 0000000021800190
	.word	0x14ee07f8,0x58ce0d29,0x24018af6,0x6b048d6f	! PA = 00000000218001a0
	.word	0x59742664,0x100bbe65,0x34a681c2,0x08f2f98b	! PA = 00000000218001b0
	.word	0x2dc4a090,0x639e0461,0x7cc9c24e,0x61cd7067	! PA = 00000000218001c0
	.word	0x13ab427c,0x2251fb1d,0x7b22789a,0x7302ee03	! PA = 00000000218001d0
	.word	0x5f4d9828,0x40cf7e99,0x351f90a6,0x70032e5f	! PA = 00000000218001e0
	.word	0x6b56ed94,0x31952ad5,0x0173b672,0x5b1aad7b	! PA = 00000000218001f0
share3_end:
