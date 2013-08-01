/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_12.s
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
!	Seed = 327144530
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_12.s created on Mar 27, 2009 (14:45:30)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_12 -p 1 -l 3000

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

!	Random code for Processor 0

processor_0:
	ta	T_CHANGE_PRIV
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi		! Setting default asi to 80

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
!	%f0  = 7b5ae341 3f766aaf dd428a92 d215c5a5
!	%f4  = dec33de5 23ad26d4 a2f25549 ad7b3a62
!	%f8  = 8246e301 86583ea6 cdb8f032 8b246702
!	%f12 = 865c65e1 50ea83f4 503f1b6f 7bd75ff4
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = b54e5f55 a6f69fc5 f46ef127 04e0f9a1
!	%f20 = 90365cfc 06dd9ece 09ff9d6a fe527200
!	%f24 = fe8ba858 7f82a701 6d88f660 91f2eeef
!	%f28 = d3dbec32 154d92b7 c8c387a1 53e80133
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 8d020e50 98067ddd f4cf87e2 fe320903
!	%f36 = 7fe612f3 5f8aa323 2472cfc1 144ce569
!	%f40 = d97a506a 0acd33e4 2424ed8e 814d88ac
!	%f44 = 2bbebdd7 d29f2302 3c034490 ea4741ae
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4c21bb5f00000028,%g7,%g1 ! GSR scale =  5, align = 0
	wr	%g1,%g0,%gsr		! GSR = 4c21bb5f00000028
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l7 = 3d920a4a6987147c, Mem[0000000010141408] = bd4a91ca
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 6987147c
!	%l1 = 440b4842357675b0, Mem[00000000300c1408] = f809d706
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 75b0d706
!	%l4 = a38361688f76d360, Mem[00000000100c1410] = 1a61d271
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 1a61d260
!	Mem[00000000100c1414] = 99bb9ea8, %f22 = 09ff9d6a
	lda	[%i3+0x014]%asi,%f22	! %f22 = 99bb9ea8
!	Mem[0000000010101400] = 071c0907, %l2 = 15075156832a9fcf
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000007000000ff
!	%f12 = 865c65e1 50ea83f4, Mem[0000000010081410] = 72218dff 889af8f4
	stda	%f12,[%i2+%o5]0x88	! Mem[0000000010081410] = 865c65e1 50ea83f4
!	%l6 = 77be6b81f9cd7d04, Mem[0000000030141400] = 1a36f366482f4ebc
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 77be6b81f9cd7d04
!	Mem[00000000100c1410] = 60d2611a, %l5 = ff2e297c22c0294a
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000060
!	Mem[0000000030101400] = a3982bc6, %l3 = 3bfc0aae51215841
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000c6000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001008143e] = e335012c, %l6 = 77be6b81f9cd7d04
	ldstub	[%i2+0x03e],%l6		! %l6 = 00000001000000ff

p0_label_2:
!	Mem[0000000010141408] = 6987147c, %l5 = 0000000000000060
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 000000006987147c
!	Mem[0000000030001410] = 12cd3352, %l4 = a38361688f76d360
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000012000000ff
!	Mem[0000000021800100] = cd2fe14a, %l2 = 0000000000000007
	ldstub	[%o3+0x100],%l2		! %l2 = 000000cd000000ff
!	%l3 = 00000000000000c6, Mem[000000001014141e] = 4483644d, %asi = 80
	stha	%l3,[%i5+0x01e]%asi	! Mem[000000001014141c] = 448300c6
!	%l7 = 3d920a4a6987147c, Mem[0000000010081426] = 0e08bf46
	stb	%l7,[%i2+0x026]		! Mem[0000000010081424] = 0e087c46
!	%f14 = 503f1b6f, Mem[0000000010141410] = cf9de403
	sta	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = 503f1b6f
!	%f0  = 7b5ae341 3f766aaf dd428a92 d215c5a5
!	%f4  = dec33de5 23ad26d4 a2f25549 ad7b3a62
!	%f8  = 8246e301 86583ea6 cdb8f032 8b246702
!	%f12 = 865c65e1 50ea83f4 503f1b6f 7bd75ff4
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	Mem[00000000100c1410] = 1a61d260, %l4 = 0000000000000012
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 000000001a61d260
!	Mem[00000000300c1400] = f8cc8998, %l3 = 00000000000000c6
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000f8cc8998
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 2cee2328, %l2 = 00000000000000cd
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 000000002cee2328

p0_label_3:
!	Mem[0000000030101410] = 9f49bdd7, %l6 = 0000000000000001
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffff9f49
!	Mem[0000000030081400] = 971a1ca8 767fafba, %l2 = 2cee2328, %l3 = f8cc8998
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000971a1ca8 00000000767fafba
!	Mem[0000000030081400] = 971a1ca8, %f25 = 7f82a701
	lda	[%i2+%g0]0x81,%f25	! %f25 = 971a1ca8
!	Mem[0000000010081410] = 50ea83f4, %l4 = 000000001a61d260
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffff83f4
!	Mem[00000000100c1404] = c82f0b2f, %l7 = 3d920a4a6987147c
	lduwa	[%i3+0x004]%asi,%l7	! %l7 = 00000000c82f0b2f
!	Mem[0000000010141428] = b6662aa7f92dc578, %f18 = f46ef127 04e0f9a1
	ldda	[%i5+0x028]%asi,%f18	! %f18 = b6662aa7 f92dc578
!	Mem[0000000010141410] = 503f1b6f, %l5 = 000000006987147c
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000503f
!	Mem[0000000010101408] = 378f6de2, %l2 = 00000000971a1ca8
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000378f6de2
!	Mem[0000000010101400] = 07091cff, %l5 = 000000000000503f
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000001cff
!	Starting 10 instruction Store Burst
!	%f28 = d3dbec32 154d92b7, Mem[0000000030141410] = 28c7a559 c21bc7fc
	stda	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = d3dbec32 154d92b7

p0_label_4:
!	%l2 = 00000000378f6de2, %l1 = 440b4842357675b0, %l0 = dfa150100b3150cb
	subc	%l2,%l1,%l0		! %l0 = bbf4b7be0218f832
!	Mem[0000000010141400] = d8c0dd82, %l4 = ffffffffffff83f4
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000d8c0dd82
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181418] = a2f25549, %l6 = ffffffffffff9f49
	ldstuba	[%i6+0x018]%asi,%l6	! %l6 = 000000a2000000ff
!	%l1 = 440b4842357675b0, Mem[0000000010041410] = c521a8d0089993f2
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 440b4842357675b0
!	%l6 = 00000000000000a2, Mem[0000000030101410] = d7bd499f
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000a2
!	Mem[0000000030141400] = f9cd7d04, %l0 = bbf4b7be0218f832
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000004000000ff
!	%f8  = 8246e301 86583ea6, %l2 = 00000000378f6de2
!	Mem[00000000100c1408] = 27b67d2b6b87469a
	add	%i3,0x008,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1408] = 273e7d2b6be34682
!	%f16 = b54e5f55 a6f69fc5, %l0 = 0000000000000004
!	Mem[0000000030101418] = 7ea57c9c82b88d78
	add	%i4,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101418] = 7ea55f5582b88d78
!	%l1 = 440b4842357675b0, Mem[0000000030081410] = d6fc9778
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 357675b0
!	Starting 10 instruction Load Burst
!	%l6 = 000000a2, %l7 = c82f0b2f, Mem[0000000030101410] = a2000000 1f89a07f
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000a2 c82f0b2f

p0_label_5:
!	Mem[0000000010101400] = ff1c0907, %l3 = 00000000767fafba
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181400] = c1f8e7a8 6786584b, %l6 = 000000a2, %l7 = c82f0b2f
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000c1f8e7a8 000000006786584b
!	Mem[0000000030001410] = 5233cdff, %l4 = 00000000d8c0dd82
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffcdff
!	Mem[00000000100c1410] = 00000012, %l2 = 00000000378f6de2
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000012
!	Mem[0000000030101410] = 000000a2, %f30 = c8c387a1
	lda	[%i4+%o5]0x81,%f30	! %f30 = 000000a2
!	Mem[0000000030081410] = b0757635, %l1 = 440b4842357675b0
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000b0757635
!	Mem[0000000010181418] = fff25549ad7b3a62, %l5 = 0000000000001cff
	ldxa	[%i6+0x018]%asi,%l5	! %l5 = fff25549ad7b3a62
!	Mem[0000000010001408] = c03ed33e, %l2 = 0000000000000012
	lduh	[%i0+0x00a],%l2		! %l2 = 000000000000d33e
!	Mem[00000000100c1410] = a89ebb9900000012, %f24 = fe8ba858 971a1ca8
	ldda	[%i3+%o5]0x88,%f24	! %f24 = a89ebb99 00000012
!	Starting 10 instruction Store Burst
!	%f14 = 503f1b6f 7bd75ff4, %l7 = 000000006786584b
!	Mem[0000000010181410] = dec33de523ad26d4
	add	%i6,0x010,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010181410] = f45fd77b6f1b3f50

p0_label_6:
!	Mem[0000000010101430] = 440ff950b49ed50d, %l0 = 0000000000000004, %l7 = 000000006786584b
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 440ff950b49ed50d
!	Mem[0000000010041439] = d62fdfdb, %l0 = 0000000000000004
	ldstuba	[%i1+0x039]%asi,%l0	! %l0 = 0000002f000000ff
!	%l6 = 00000000c1f8e7a8, Mem[0000000030041400] = 16cfdee3
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = c1f8e7a8
!	%l4 = ffffffffffffcdff, Mem[0000000030181400] = a8e7f8c1
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = a8e7f8ff
!	%l0 = 0000002f, %l1 = b0757635, Mem[0000000030101408] = dde08bd7 df25a2f5
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000002f b0757635
!	%l5 = fff25549ad7b3a62, Mem[0000000030141410] = b7924d15
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 62924d15
!	%l5 = fff25549ad7b3a62, Mem[000000001018142b] = cdb8f032
	stb	%l5,[%i6+0x02b]		! Mem[0000000010181428] = cdb8f062
!	%f28 = d3dbec32 154d92b7, %l6 = 00000000c1f8e7a8
!	Mem[0000000030001428] = b18b44fcdecb7663
	add	%i0,0x028,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001428] = b18b44fcdecb7663
!	Mem[0000000010141410] = 503f1b6f, %l3 = ffffffffffffffff
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000503f1b6f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 83c04ec2, %f29 = 154d92b7
	lda	[%i6+%o4]0x81,%f29	! %f29 = 83c04ec2

p0_label_7:
!	Mem[00000000100c1410] = 00000012, %l2 = 000000000000d33e
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000012
!	Mem[000000001010141c] = 64ecce2e, %l6 = 00000000c1f8e7a8
	lduba	[%i4+0x01e]%asi,%l6	! %l6 = 00000000000000ce
!	Mem[0000000010081410] = 50ea83f4, %l2 = 0000000000000012
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = 0000000050ea83f4
!	Mem[00000000100c1410] = a89ebb9900000012, %f10 = cdb8f032 8b246702
	ldda	[%i3+%o5]0x88,%f10	! %f10 = a89ebb99 00000012
!	Mem[0000000010041400] = 71192a93, %l6 = 00000000000000ce
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 0000000071192a93
!	Mem[0000000030181410] = 4bb9ae9885788b7f, %f6  = a2f25549 ad7b3a62
	ldda	[%i6+%o5]0x89,%f6 	! %f6  = 4bb9ae98 85788b7f
!	Mem[0000000010081400] = 5210793873898dba, %l0 = 000000000000002f
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 5210793873898dba
!	Mem[00000000201c0000] = 37349a5f, %l3 = 00000000503f1b6f
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000003734
!	%l4 = ffffffffffffcdff, %l7 = 440ff950b49ed50d, %y  = 00000000
	udiv	%l4,%l7,%l0		! %l0 = 0000000000000001
	mov	%l0,%y			! %y = 00000001
!	Starting 10 instruction Store Burst
!	%f14 = 503f1b6f 7bd75ff4, %l7 = 440ff950b49ed50d
!	Mem[0000000030001400] = d075b96070d86894
	stda	%f14,[%i0+%l7]ASI_PST32_SL ! Mem[0000000030001400] = f45fd77b70d86894

p0_label_8:
!	Mem[0000000010141408] = 00000060, %l6 = 0000000071192a93
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000060
!	Mem[0000000010001408] = c03ed33e, %l6 = 0000000000000060
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000c03ed33e
!	Mem[0000000010101400] = 07091cff, %l0 = 0000000000000001
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 0000000007091cff
!	Mem[0000000030181400] = fff8e7a8, %l2 = 0000000050ea83f4
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 00000000fff8e7a8
!	Mem[0000000010101410] = 91720d09, %l3 = 0000000000003734
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000091720d09
!	Mem[000000001000142c] = 5d16c3c6, %l1 = 00000000b0757635, %asi = 80
	swapa	[%i0+0x02c]%asi,%l1	! %l1 = 000000005d16c3c6
!	%l4 = ffffffffffffcdff, Mem[00000000201c0000] = 37349a5f
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = ff349a5f
!	%l3 = 0000000091720d09, Mem[0000000010041410] = 357675b0
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 35760d09
!	Mem[0000000010101438] = 92118061f7c1d812, %l2 = 00000000fff8e7a8, %l6 = 00000000c03ed33e
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 92118061f7c1d812
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 6cee8ad5, %l4 = ffffffffffffcdff
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000006cee

p0_label_9:
!	Mem[00000000211c0000] = 8993b6f7, %l0 = 0000000007091cff
	lduba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000089
!	Mem[0000000030081400] = a81c1a97, %l0 = 0000000000000089
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000001a97
!	Mem[00000000100c1400] = 6cee8ad5, %f14 = 503f1b6f
	lda	[%i3+%g0]0x80,%f14	! %f14 = 6cee8ad5
!	Mem[0000000010141408] = 932a1971, %l6 = 92118061f7c1d812
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000071
!	Mem[0000000030181400] = 4b588667f483ea50, %f14 = 6cee8ad5 7bd75ff4
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 4b588667 f483ea50
!	Mem[0000000030001410] = 5233cdff, %l0 = 0000000000001a97
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000cdff
!	Mem[0000000030141408] = d051cffe, %f2  = dd428a92
	lda	[%i5+%o4]0x81,%f2 	! %f2 = d051cffe
!	Mem[0000000010101400] = 01000000 c41c7f20, %l2 = fff8e7a8, %l3 = 91720d09
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000001000000 00000000c41c7f20
!	%l1 = 000000005d16c3c6, imm = 0000000000000124, %l7 = 440ff950b49ed50d
	subc	%l1,0x124,%l7		! %l7 = 000000005d16c2a2
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000006cee, Mem[0000000030081400] = 971a1ca8
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00006cee

p0_label_10:
!	%l5 = fff25549ad7b3a62, Mem[0000000010181428] = cdb8f0628b246702, %asi = 80
	stxa	%l5,[%i6+0x028]%asi	! Mem[0000000010181428] = fff25549ad7b3a62
!	Mem[0000000010101400] = 01000000, %l5 = fff25549ad7b3a62
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000001000000ff
!	%f16 = b54e5f55 a6f69fc5 b6662aa7 f92dc578
!	%f20 = 90365cfc 06dd9ece 99bb9ea8 fe527200
!	%f24 = a89ebb99 00000012 6d88f660 91f2eeef
!	%f28 = d3dbec32 83c04ec2 000000a2 53e80133
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l0 = 000000000000cdff, Mem[0000000010101420] = e5547f31, %asi = 80
	stba	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = ff547f31
!	Mem[00000000300c1400] = c6000000, %l0 = 000000000000cdff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000c6000000
!	%l4 = 0000000000006cee, Mem[0000000010001410] = 80019a2c6a9d131e
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000006cee
!	Mem[00000000300c1400] = ffcd0000, %l1 = 000000005d16c3c6
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l3 = 00000000c41c7f20, immd = fffffffffffff368, %l4 = 0000000000006cee
	udivx	%l3,-0xc98,%l4		! %l4 = 0000000000000000
!	%l3 = 00000000c41c7f20, Mem[0000000021800100] = ff2fe14a, %asi = 80
	stha	%l3,[%o3+0x100]%asi	! Mem[0000000021800100] = 7f20e14a
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = dd428a92, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffdd42

p0_label_11:
!	Mem[000000001018141c] = ad7b3a62, %f10 = a89ebb99
	ld	[%i6+0x01c],%f10	! %f10 = ad7b3a62
!	Mem[00000000300c1408] = 75b0d706cfd92c64, %f14 = 4b588667 f483ea50
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 75b0d706 cfd92c64
!	Mem[0000000010101400] = ff000000, %l2 = 0000000001000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181410] = f45fd77b, %l4 = ffffffffffffdd42
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = fffffffffffffff4
!	Mem[00000000211c0000] = 8993b6f7, %l2 = 000000000000ff00
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffff8993
!	Mem[0000000010101408] = e26d8f37, %l5 = 0000000000000001
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 00000000e26d8f37
!	Mem[0000000030181400] = 50ea83f4, %f1  = 3f766aaf
	lda	[%i6+%g0]0x81,%f1 	! %f1 = 50ea83f4
!	Mem[0000000010181410] = 7bd75ff4, %l4 = fffffffffffffff4
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 000000007bd75ff4
!	Mem[0000000030141410] = 154d9262, %l4 = 000000007bd75ff4
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffff9262
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030081410] = fc5c3690, %l5 = 00000000e26d8f37
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000fc5c3690

p0_label_12:
!	%l5 = 00000000fc5c3690, imm = 0000000000000c1f, %l6 = 0000000000000071
	xor	%l5,0xc1f,%l6		! %l6 = 00000000fc5c3a8f
!	Mem[00000000201c0000] = ff349a5f, %l1 = 00000000000000ff
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	%l4 = ffffffffffff9262, Mem[0000000010101400] = 000000ff
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00009262
!	Mem[0000000010001408] = 00000060, %l6 = 00000000fc5c3a8f
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000060
!	%f21 = 06dd9ece, Mem[00000000300c1408] = 06d7b075
	sta	%f21,[%i3+%o4]0x89	! Mem[00000000300c1408] = 06dd9ece
!	Mem[0000000010041410] = 090d763542480b44, %l3 = 00000000c41c7f20, %l4 = ffffffffffff9262
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 090d763542480b44
!	%l6 = 0000000000000060, Mem[000000001010143c] = f7c1d812, %asi = 80
	stwa	%l6,[%i4+0x03c]%asi	! Mem[000000001010143c] = 00000060
!	Mem[0000000010041438] = d6ffdfdb, %l3 = c41c7f20, %l6 = 00000060
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000d6ffdfdb
!	%f7  = 85788b7f, Mem[0000000030081400] = b54e5f55
	sta	%f7 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 85788b7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 52107938, %l2 = ffffffffffff8993
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000052

p0_label_13:
!	Mem[0000000010181430] = 865c65e1, %l6 = 00000000d6ffdfdb
	ldsw	[%i6+0x030],%l6		! %l6 = ffffffff865c65e1
!	Mem[0000000030181400] = f483ea50, %l3 = 00000000c41c7f20
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000050
!	Mem[0000000010081430] = 3083808b, %f2  = d051cffe
	lda	[%i2+0x030]%asi,%f2 	! %f2 = 3083808b
!	Mem[0000000030001408] = d341cf12 13520df5, %l0 = c6000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000d341cf12 0000000013520df5
!	%l0 = 00000000d341cf12, imm = 0000000000000bab, %l4 = 090d763542480b44
	add	%l0,0xbab,%l4		! %l4 = 00000000d341dabd
!	Mem[0000000010101414] = af429358, %l4 = 00000000d341dabd
	lduwa	[%i4+0x014]%asi,%l4	! %l4 = 00000000af429358
!	Mem[00000000211c0000] = 8993b6f7, %l7 = 000000005d16c2a2
	lduh	[%o2+%g0],%l7		! %l7 = 0000000000008993
!	Mem[0000000030041410] = 039d06b1, %l7 = 0000000000008993
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 00000000000006b1
!	Mem[0000000030141400] = f9cd7dff, %l4 = 00000000af429358
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000007dff
!	Starting 10 instruction Store Burst
!	%l4 = 00007dff, %l5 = fc5c3690, Mem[0000000010081418] = b83a9450 5c3b7262
	std	%l4,[%i2+0x018]		! Mem[0000000010081418] = 00007dff fc5c3690

p0_label_14:
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000052
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f2  = 3083808b d215c5a5, Mem[0000000010081400] = 52107938 73898dba
	stda	%f2 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 3083808b d215c5a5
!	%f31 = 53e80133, Mem[0000000030141400] = ff7dcdf9
	sta	%f31,[%i5+%g0]0x81	! Mem[0000000030141400] = 53e80133
!	%l0 = d341cf12, %l1 = 13520df5, Mem[0000000010001410] = 00000052 ee6c0000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = d341cf12 13520df5
!	Mem[0000000010001400] = 7a6ade26, %l3 = 0000000000000050
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 000000007a6ade26
!	%l6 = ffffffff865c65e1, Mem[0000000030081410] = 378f6de2
	stba	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = e18f6de2
!	%l0 = 00000000d341cf12, Mem[00000000300c1410] = bcb407c4
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = d341cf12
!	%l5 = 00000000fc5c3690, imm = fffffffffffffaac, %l3 = 000000007a6ade26
	subc	%l5,-0x554,%l3		! %l3 = 00000000fc5c3be4
!	%l5 = 00000000fc5c3690, Mem[0000000010041408] = 000000cd
	stba	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 900000cd
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 8f3a5cfc, %l0 = 00000000d341cf12
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000005cfc

p0_label_15:
!	Mem[0000000030141410] = 62924d1532ecdbd3, %l0 = 0000000000005cfc
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 62924d1532ecdbd3
!	Mem[00000000300c1408] = ce9edd06, %l4 = 0000000000007dff
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffce9e
!	%l4 = ffffffffffffce9e, imm = fffffffffffff657, %l4 = ffffffffffffce9e
	xnor	%l4,-0x9a9,%l4		! %l4 = ffffffffffffc736
!	Mem[00000000300c1408] = ce9edd06, %l0 = 62924d1532ecdbd3
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffffce
!	Mem[0000000010001430] = fca17147, %l3 = 00000000fc5c3be4
	ldsba	[%i0+0x032]%asi,%l3	! %l3 = 0000000000000071
!	Mem[0000000010101410] = 00003734, %l4 = ffffffffffffc736
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000003734
!	Mem[0000000030001400] = f45fd77b70d86894, %l5 = 00000000fc5c3690
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = f45fd77b70d86894
!	Mem[0000000010101400] = 207f1cc4 00009262, %l0 = ffffffce, %l1 = 13520df5
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000009262 00000000207f1cc4
!	Mem[0000000030141408] = fecf51d0, %l6 = ffffffff865c65e1
	ldsha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000051d0
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffff83f4, %l3 = 0000000000000071
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ffff83f4

p0_label_16:
!	%f2  = 3083808b d215c5a5, Mem[0000000010041400] = 932a1971 2eb2821f
	stda	%f2 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 3083808b d215c5a5
!	Mem[00000000201c0001] = ff349a5f, %l1 = 00000000207f1cc4
	ldstub	[%o0+0x001],%l1		! %l1 = 00000034000000ff
!	%l3 = 00000000ffff83f4, Mem[0000000030141408] = d051cffee6249d14
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ffff83f4
!	Mem[00000000100c1408] = 273e7d2b, %l6 = 00000000000051d0
	ldstuba	[%i3+0x008]%asi,%l6	! %l6 = 00000027000000ff
!	%f0  = 7b5ae341 50ea83f4, Mem[00000000300c1408] = 06dd9ece 642cd9cf
	stda	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7b5ae341 50ea83f4
!	%l5 = f45fd77b70d86894, Mem[0000000030081408] = 78c52df9a72a66b6
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = f45fd77b70d86894
!	%f8  = 8246e301 86583ea6, Mem[0000000010081400] = 3083808b d215c5a5
	stda	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 8246e301 86583ea6
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000009262
	setx	0xc7bee2c799ca187c,%g7,%l0 ! %l0 = c7bee2c799ca187c
!	%l1 = 0000000000000034
	setx	0x5b4754484d04721d,%g7,%l1 ! %l1 = 5b4754484d04721d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7bee2c799ca187c
	setx	0xb0ad13cfc75a039b,%g7,%l0 ! %l0 = b0ad13cfc75a039b
!	%l1 = 5b4754484d04721d
	setx	0x2fe5126fa932972a,%g7,%l1 ! %l1 = 2fe5126fa932972a
!	%l6 = 0000000000000027, immed = 00000e40, %y  = 00000001
	smul	%l6,0xe40,%l6		! %l6 = 0000000000022bc0, %y = 00000000
!	Starting 10 instruction Load Burst
!	%l5 = f45fd77b70d86894, %l5 = f45fd77b70d86894, %l5 = f45fd77b70d86894
	or	%l5,%l5,%l5		! %l5 = f45fd77b70d86894

p0_label_17:
!	Mem[0000000030001410] = cc6dfb055233cdff, %l1 = 2fe5126fa932972a
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = cc6dfb055233cdff
!	Mem[0000000030041410] = 039d06b1, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 00000000000006b1
!	Mem[0000000030081408] = 70d86894, %l5 = f45fd77b70d86894
	lduwa	[%i2+%o4]0x89,%l5	! %l5 = 0000000070d86894
!	Mem[0000000030141408] = 00000000, %l3 = 00000000ffff83f4
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001414] = f50d5213, %l6 = 0000000000022bc0
	lduh	[%i0+0x016],%l6		! %l6 = 0000000000005213
!	Mem[0000000030081400] = 7f8b7885, %l5 = 0000000070d86894
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 000000007f8b7885
!	Mem[0000000010001410] = 12cf41d3, %l6 = 0000000000005213
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = 00000000000012cf
!	Mem[00000000100c1400] = 6cee8ad5c82f0b2f, %l5 = 000000007f8b7885
	ldx	[%i3+%g0],%l5		! %l5 = 6cee8ad5c82f0b2f
!	%l0 = b0ad13cfc75a039b, %l1 = cc6dfb055233cdff, %l6  = 00000000000012cf
	mulx	%l0,%l1,%l6		! %l6 = 48cdb5b8056db665
!	Starting 10 instruction Store Burst
!	%f18 = b6662aa7 f92dc578, %l6 = 48cdb5b8056db665
!	Mem[0000000010141438] = 050f12123f28bea8
	add	%i5,0x038,%g1
	stda	%f18,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141438] = 050f1212f92dc578

p0_label_18:
!	%l3 = 0000000000000000, Mem[0000000030081410] = e18f6de206dd9ece
	stxa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l2 = 00000000000006b1, Mem[0000000030141410] = 154d9262
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 154d06b1
!	%f22 = 99bb9ea8 fe527200, Mem[0000000010001400] = 50000000 55f25062
	stda	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = 99bb9ea8 fe527200
!	Mem[0000000010141408] = 71192a93, %l5 = 6cee8ad5c82f0b2f
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000071192a93
!	%l6 = 48cdb5b8056db665, Mem[000000001018142e] = ad7b3a62
	sth	%l6,[%i6+0x02e]		! Mem[000000001018142c] = ad7bb665
!	%f26 = 6d88f660, Mem[0000000030141410] = 154d06b1
	sta	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = 6d88f660
!	%f16 = b54e5f55 a6f69fc5 b6662aa7 f92dc578
!	%f20 = 90365cfc 06dd9ece 99bb9ea8 fe527200
!	%f24 = a89ebb99 00000012 6d88f660 91f2eeef
!	%f28 = d3dbec32 83c04ec2 000000a2 53e80133
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f0  = 7b5ae341 50ea83f4, %l0 = b0ad13cfc75a039b
!	Mem[0000000030041408] = cebcf472eeea58f9
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041408] = 7bbcf44150ea83f4
!	%l4 = 00003734, %l5 = 71192a93, Mem[0000000010081410] = f483ea50 e1655c86
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00003734 71192a93
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff3e7d2b, %l2 = 00000000000006b1
	ldsh	[%i3+0x00a],%l2		! %l2 = 0000000000007d2b

p0_label_19:
!	Mem[00000000100c1430] = b3a24116b91f6d7c, %l5 = 0000000071192a93
	ldx	[%i3+0x030],%l5		! %l5 = b3a24116b91f6d7c
!	Mem[0000000010001400] = a89ebb99, %l6 = 48cdb5b8056db665
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffa89ebb99
!	Mem[0000000010001408] = 8f3a5cfc, %l7 = 00000000000006b1
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffff8f3a5cfc
!	Mem[0000000010181434] = 50ea83f4, %l0 = b0ad13cfc75a039b
	ldsba	[%i6+0x035]%asi,%l0	! %l0 = ffffffffffffffea
!	Mem[00000000100c1410] = 12000000, %l4 = 0000000000003734
	ldsw	[%i3+%o5],%l4		! %l4 = 0000000012000000
!	Mem[0000000030181400] = 50ea83f4, %l0 = ffffffffffffffea
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = 0000000050ea83f4
!	Mem[0000000010081410] = 34370000, %f9  = 86583ea6
	lda	[%i2+%o5]0x88,%f9 	! %f9 = 34370000
!	Mem[0000000010041400] = a5c515d28b808330, %l4 = 0000000012000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = a5c515d28b808330
!	Mem[0000000010081418] = 00007dff, %l3 = 0000000000000000
	lduba	[%i2+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = b3a24116b91f6d7c, Mem[00000000100c1400] = 6cee8ad5
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 6d7c8ad5

p0_label_20:
!	Mem[0000000010181428] = fff25549ad7bb665, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = fff25549ad7bb665
!	Mem[0000000010001404] = fe527200, %l3 = fff25549ad7bb665
	swap	[%i0+0x004],%l3		! %l3 = 00000000fe527200
!	%f7  = 85788b7f, %f0  = 7b5ae341
	fcmpes	%fcc3,%f7 ,%f0 		! %fcc3 = 1
!	Mem[00000000201c0000] = ffff9a5f, %l1 = cc6dfb055233cdff
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%l0 = 0000000050ea83f4, Mem[0000000010041410] = 440b484235760d09
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000050ea83f4
!	%l4 = a5c515d28b808330, %l4 = a5c515d28b808330, %l0 = 0000000050ea83f4
	subc	%l4,%l4,%l0		! %l0 = 0000000000000000
!	Mem[0000000010081408] = 0d040fb3f57fea46, %l1 = 00000000000000ff, %l5 = b3a24116b91f6d7c
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 0d040fb3f57fea46
!	%f16 = b54e5f55 a6f69fc5 b6662aa7 f92dc578
!	%f20 = 90365cfc 06dd9ece 99bb9ea8 fe527200
!	%f24 = a89ebb99 00000012 6d88f660 91f2eeef
!	%f28 = d3dbec32 83c04ec2 000000a2 53e80133
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	Mem[0000000030081400] = 85788b7f, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000085000000ff
!	Starting 10 instruction Load Burst
!	%l7 = ffffffff8f3a5cfc, %l7 = ffffffff8f3a5cfc, %y  = 00000000
	sdiv	%l7,%l7,%l6		! %l6 = ffffffffffffffff
	mov	%l0,%y			! %y = 00000085

p0_label_21:
!	Mem[0000000030041400] = 507c0835c1f8e7a8, %l3 = 00000000fe527200
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = 507c0835c1f8e7a8
!	Mem[0000000030181400] = 50ea83f4, %l0 = 0000000000000085
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 0000000050ea83f4
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141408] = c82f0b2f, %f8  = 8246e301
	lda	[%i5+%o4]0x80,%f8 	! %f8 = c82f0b2f
!	Mem[0000000010081410] = 34370000, %l1 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 9f23bd26ffffffff, %l2 = 0000000000007d2b
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 9f23bd26ffffffff
!	Mem[00000000201c0000] = ffff9a5f, %l4 = a5c515d28b808330
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141410] = ffffffff, %f7  = 85788b7f
	lda	[%i5+%o5]0x80,%f7 	! %f7 = ffffffff
!	Mem[0000000030041400] = c1f8e7a8, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = ffffffffffffe7a8
!	Mem[0000000030001400] = a6f69fc5, %l4 = 00000000000000ff
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = ffffffffa6f69fc5
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff9a5f, %l3 = 507c0835c1f8e7a8
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_22:
!	%l0 = 0000000050ea83f4, Mem[0000000030141410] = fc5c3690
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 50ea83f4
!	Mem[0000000010081410] = 00003734, %l4 = ffffffffa6f69fc5
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000003734
!	%l5 = 0d040fb3f57fea46, Mem[0000000030141408] = b6662aa7
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ea462aa7
!	%l7 = ffffffff8f3a5cfc, Mem[0000000010001408] = fc5c3a8f
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 8f3a5cfc
!	%f22 = 99bb9ea8, Mem[0000000010081408] = 0d040fb3
	sta	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = 99bb9ea8
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000030181400] = f483ea50 4b588667
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff 000000ff
!	Mem[0000000020800041] = 0095978a, %l4 = 0000000000003734
	ldstub	[%o1+0x041],%l4		! %l4 = 00000095000000ff
!	%l5 = 0d040fb3f57fea46, %l0 = 0000000050ea83f4, %l2 = 9f23bd26ffffffff
	udivx	%l5,%l0,%l2		! %l2 = 00000000292de1b9
!	Mem[0000000030141408] = ea462aa7, %l4 = 0000000000000095
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ea462aa7
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffcd0000a6e7e8c1, %l2 = 00000000292de1b9
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ffcd0000a6e7e8c1

p0_label_23:
!	Mem[00000000100c142c] = 0ac1faeb, %l5 = 0d040fb3f57fea46
	lduh	[%i3+0x02c],%l5		! %l5 = 0000000000000ac1
!	Mem[0000000030001400] = a6f69fc5, %l0 = 0000000050ea83f4
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000009fc5
!	Mem[0000000010181410] = f45fd77b, %l6 = ffffffffffffffff
	lduba	[%i6+0x012]%asi,%l6	! %l6 = 00000000000000d7
!	Mem[00000000211c0000] = 8993b6f7, %l4 = 00000000ea462aa7
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffff93
!	Mem[00000000100c141c] = f42423f0, %l1 = ffffffffffffe7a8
	ldswa	[%i3+0x01c]%asi,%l1	! %l1 = fffffffff42423f0
!	Mem[0000000030081408] = 9468d870, %l6 = 00000000000000d7
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffff94
!	Mem[0000000010101410] = 589342af 00003734, %l2 = a6e7e8c1, %l3 = 000000ff
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 0000000000003734 00000000589342af
!	Mem[0000000030101410] = 2f0b2fc8a2000000, %l0 = 0000000000009fc5
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = 2f0b2fc8a2000000
!	Mem[0000000010041400] = 3083808b, %l5 = 0000000000000ac1
	ldsba	[%i1+0x000]%asi,%l5	! %l5 = 0000000000000030
!	Starting 10 instruction Store Burst
!	%f10 = ad7b3a62 00000012, %l4 = ffffffffffffff93
!	Mem[00000000100c1400] = 6d7c8ad5c82f0b2f
	stda	%f10,[%i3+%l4]ASI_PST16_PL ! Mem[00000000100c1400] = 12000000c82f0b2f

p0_label_24:
!	%l6 = ffffffffffffff94, Mem[0000000030141410] = f483ea50
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffff94
!	Mem[0000000030141408] = 00000095, %l1 = fffffffff42423f0
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000095
!	%l0 = 2f0b2fc8a2000000, Mem[0000000030141400] = 555f4eb5
	stha	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 555f0000
!	Mem[0000000010181408] = dd428a92, %l6 = ffffffffffffff94
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000dd428a92
!	Mem[00000000211c0001] = 8993b6f7, %l6 = 00000000dd428a92
	ldstub	[%o2+0x001],%l6		! %l6 = 00000093000000ff
!	%l0 = a2000000, %l1 = 00000095, Mem[0000000010181400] = 7b5ae341 3f766aaf
	std	%l0,[%i6+%g0]		! Mem[0000000010181400] = a2000000 00000095
!	%l4 = ffffffffffffff93, Mem[0000000030041400] = a8e7f8c135087c50
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffffffff93
!	%l0 = 2f0b2fc8a2000000, Mem[0000000030141410] = 94ffffff
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 94ffff00
!	Mem[00000000100c143c] = b6560cd5, %l7 = ffffffff8f3a5cfc
	ldstub	[%i3+0x03c],%l7		! %l7 = 000000b6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 900000cd74f91143, %f12 = 865c65e1 50ea83f4
	ldda	[%i1+%o4]0x80,%f12	! %f12 = 900000cd 74f91143

p0_label_25:
!	Mem[0000000010001438] = 9d4d84f8, %l0 = 2f0b2fc8a2000000
	ldsh	[%i0+0x038],%l0		! %l0 = ffffffffffff9d4d
!	Mem[00000000201c0000] = ffff9a5f, %l1 = 0000000000000095
	ldub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	%f26 = 6d88f660, %f30 = 000000a2, %f22 = 99bb9ea8
	fadds	%f26,%f30,%f22		! %l0 = ffffffffffff9d6f, Unfinished, %fsr = 1000000000
!	Mem[00000000100c1410] = a89ebb9900000012, %l5 = 0000000000000030
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = a89ebb9900000012
!	Mem[000000001014140c] = c76a59f7, %l6 = 0000000000000093
	lduwa	[%i5+0x00c]%asi,%l6	! %l6 = 00000000c76a59f7
!	Mem[0000000010101400] = 62920000, %l4 = ffffffffffffff93
	ldsba	[%i4+0x000]%asi,%l4	! %l4 = 0000000000000062
!	Mem[0000000030101400] = ff2b98a3, %f17 = a6f69fc5
	lda	[%i4+%g0]0x81,%f17	! %f17 = ff2b98a3
!	Mem[0000000010181400] = 000000a2, %l2 = 0000000000003734
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000a2
!	Mem[00000000100c1410] = 00000012, %l7 = 00000000000000b6
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000012
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000012, %l4 = 0000000000000062
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000012

p0_label_26:
!	%l1 = 00000000000000ff, Mem[0000000030101408] = 0000002f
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l7 = 0000000000000012, Mem[0000000030141400] = 555f0000
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 555f0012
!	Mem[00000000201c0001] = ffff9a5f, %l2 = 00000000000000a2
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%f28 = d3dbec32, Mem[0000000030081408] = 9468d870
	sta	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = d3dbec32
!	Mem[0000000030001410] = 06dd9ece, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000006dd9ece
!	%l1 = 0000000006dd9ece, Mem[0000000030041400] = ffffffff
	stba	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = ceffffff
!	Mem[0000000010001410] = 12cf41d3, %l7 = 0000000000000012
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000012000000ff
!	%l0 = ffff9d6f, %l1 = 06dd9ece, Mem[0000000030081408] = 32ecdbd3 f45fd77b
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff9d6f 06dd9ece
!	Mem[0000000010101400] = 00009262, %l5 = a89ebb9900000012
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000009262
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = a5c515d294ffffff, %l5 = 0000000000009262
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = a5c515d294ffffff

p0_label_27:
!	Mem[0000000030081408] = 6f9dffff, %f17 = ff2b98a3
	lda	[%i2+%o4]0x81,%f17	! %f17 = 6f9dffff
!	Mem[0000000030141408] = 78c52df9f02324f4, %f4  = dec33de5 23ad26d4
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 78c52df9 f02324f4
!	Mem[0000000010081410] = 932a1971c59ff6a6, %f8  = c82f0b2f 34370000
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = 932a1971 c59ff6a6
!	%l7 = 0000000000000012, %l5 = a5c515d294ffffff, %l2 = 00000000000000ff
	or	%l7,%l5,%l2		! %l2 = a5c515d294ffffff
!	Mem[000000001008141b] = 00007dff, %l3 = 00000000589342af
	ldstub	[%i2+0x01b],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000020800040] = 00ff978a, %l0 = ffffffffffff9d6f
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffce, %l2 = a5c515d294ffffff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffce
!	Mem[0000000010001408] = 88ca0061fc5c3a8f, %f12 = 900000cd 74f91143
	ldda	[%i0+%o4]0x88,%f12	! %f12 = 88ca0061 fc5c3a8f
!	%f8  = 932a1971, %f0  = 7b5ae341
	fcmpes	%fcc2,%f8 ,%f0 		! %fcc2 = 1
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, immed = fffff8d5, %y  = 00000085
	sdiv	%l0,-0x72b,%l5		! %l5 = ffffffffed4e43ce
	mov	%l0,%y			! %y = ffffffff

p0_label_28:
!	Mem[0000000020800041] = 00ff978a, %l0 = ffffffffffffffff
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000000000ff
	setx	0x90c794b00f72245c,%g7,%l0 ! %l0 = 90c794b00f72245c
!	%l1 = 0000000006dd9ece
	setx	0xda74aa279a73d4d7,%g7,%l1 ! %l1 = da74aa279a73d4d7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 90c794b00f72245c
	setx	0x4bf4cf9fab662041,%g7,%l0 ! %l0 = 4bf4cf9fab662041
!	%l1 = da74aa279a73d4d7
	setx	0x350eb8f86744e969,%g7,%l1 ! %l1 = 350eb8f86744e969
!	Mem[0000000010001400] = 99bb9ea8, %l5 = ffffffffed4e43ce
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000099000000ff
!	%f16 = b54e5f55 6f9dffff b6662aa7 f92dc578
!	%f20 = 90365cfc 06dd9ece 99bb9ea8 fe527200
!	%f24 = a89ebb99 00000012 6d88f660 91f2eeef
!	%f28 = d3dbec32 83c04ec2 000000a2 53e80133
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l5 = 0000000000000099, Mem[00000000300c1400] = ffcd0000
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00990000
!	%l5 = 0000000000000099, Mem[0000000010101410] = 589342af00003734
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000099
!	%l6 = 00000000c76a59f7, Mem[000000001004142c] = 4064aa31, %asi = 80
	stha	%l6,[%i1+0x02c]%asi	! Mem[000000001004142c] = 59f7aa31
!	Mem[0000000021800040] = 8a1bf914, %l6 = 00000000c76a59f7
	ldstub	[%o3+0x040],%l6		! %l6 = 0000008a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ceffffff, %l7 = 0000000000000012
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000ceff

p0_label_29:
!	Mem[0000000010101400] = 00000012, %l5 = 0000000000000099
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000012
!	Mem[0000000010181410] = 503f1b6f 7bd75ff4, %l4 = 00000012, %l5 = 00000012
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000007bd75ff4 00000000503f1b6f
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 7f8b7885, %l5 = 00000000503f1b6f
	lduha	[%i6+%o5]0x81,%l5	! %l5 = 0000000000007f8b
!	Mem[00000000300c1400] = 00990000a6e7e8c1, %f12 = 88ca0061 fc5c3a8f
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 00990000 a6e7e8c1
!	Mem[00000000300c1408] = f483ea50, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000f4
!	Mem[0000000030001400] = c59ff6a6 555f4eb5, %l0 = ab662041, %l1 = 6744e969
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000c59ff6a6 00000000555f4eb5
!	Mem[0000000030101408] = 000000ffb0757635, %l5 = 0000000000007f8b
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 000000ffb0757635
!	Mem[0000000010081410] = a6f69fc5, %l7 = 000000000000ceff
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffa6
!	Starting 10 instruction Store Burst
!	%l4 = 000000007bd75ff4, Mem[0000000030181408] = 83c04ec2
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 7bd75ff4

p0_label_30:
!	Mem[0000000030081408] = 6f9dffff, %l5 = 000000ffb0757635
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 000000006f9dffff
!	%l0 = c59ff6a6, %l1 = 555f4eb5, Mem[0000000010041420] = 4a3ebc91 0b41da4a
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = c59ff6a6 555f4eb5
!	%l0 = 00000000c59ff6a6, Mem[00000000300c1410] = 12cf41d3
	stwa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = c59ff6a6
!	%f10 = ad7b3a62 00000012, Mem[0000000030101400] = a3982bff 3665c383
	stda	%f10,[%i4+%g0]0x89	! Mem[0000000030101400] = ad7b3a62 00000012
!	Mem[0000000010141400] = f483ffff, %l7 = ffffffffffffffa6
	ldstuba	[%i5+0x000]%asi,%l7	! %l7 = 000000f4000000ff
!	%l4 = 7bd75ff4, %l5 = 6f9dffff, Mem[0000000010041410] = f483ea50 00000000
	stda	%l4,[%i1+0x010]%asi	! Mem[0000000010041410] = 7bd75ff4 6f9dffff
!	%l0 = 00000000c59ff6a6, Mem[0000000030181400] = 000000ffffffffff
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000c59ff6a6
!	%l6 = 000000000000008a, Mem[0000000030141410] = 00ffff94
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000008a
!	%f8  = 932a1971 c59ff6a6, %l1 = 00000000555f4eb5
!	Mem[0000000030181400] = a6f69fc500000000
	stda	%f8,[%i6+%l1]ASI_PST8_SL ! Mem[0000000030181400] = a6f69fc571190093
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010001410] = ce9edd06, %l4 = 000000007bd75ff4
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffce9edd06

p0_label_31:
!	Mem[0000000030101410] = a2000000, %l1 = 00000000555f4eb5
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 99bb9ea8, %l5 = 000000006f9dffff
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 00000000000099bb
!	Mem[0000000020800000] = a1f38691, %l6 = 000000000000008a
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffa1f3
!	Mem[0000000010101410] = 99000000, %l4 = ffffffffce9edd06
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = ffffffff99000000
!	Mem[0000000030041400] = ceffffff ffffff93, %l4 = 99000000, %l5 = 000099bb
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ceffffff 00000000ffffff93
!	Mem[0000000030001410] = 90365cfc 000000ff, %l6 = ffffa1f3, %l7 = 000000f4
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000090365cfc
!	Mem[0000000010101410] = 9900000000000000, %f18 = b6662aa7 f92dc578
	ldda	[%i4+%o5]0x80,%f18	! %f18 = 99000000 00000000
!	Mem[0000000030081408] = 06dd9ece357675b0, %f8  = 932a1971 c59ff6a6
	ldda	[%i2+%o4]0x89,%f8 	! %f8  = 06dd9ece 357675b0
!	Mem[00000000100c1408] = ff3e7d2b, %l0 = 00000000c59ff6a6
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff83ffff, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff83ffff

p0_label_32:
!	%l7 = 0000000090365cfc, imm = fffffffffffffd4b, %l2 = ffffffffffffffce
	xnor	%l7,-0x2b5,%l2		! %l2 = 0000000090365e48
!	Mem[0000000010001408] = f92dc578, %l5 = 00000000ffffff93
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000f92dc578
!	%f19 = 00000000, Mem[0000000010041410] = 7bd75ff4
	sta	%f19,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f8  = 06dd9ece 357675b0, %l1 = 0000000000000000
!	Mem[0000000030141438] = 000000a253e80133
	add	%i5,0x038,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030141438] = 000000a253e80133
!	%l2 = 90365e48, %l3 = 000000f4, Mem[0000000010001408] = ffffff93 b6662aa7
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 90365e48 000000f4
!	Mem[0000000010181434] = 50ea83f4, %l6 = 00000000ff83ffff, %asi = 80
	swapa	[%i6+0x034]%asi,%l6	! %l6 = 0000000050ea83f4
!	Mem[000000001018142c] = ad7bb665, %l2 = 0000000090365e48
	swap	[%i6+0x02c],%l2		! %l2 = 00000000ad7bb665
!	Mem[0000000030141410] = 0000008a, %l6 = 0000000050ea83f4
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 000000000000008a
!	%f2  = 3083808b d215c5a5, %l1 = 0000000000000000
!	Mem[0000000010001430] = c24ec08332ecdbd3
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001430] = c24ec08332ecdbd3
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 90365e48, %l2 = 00000000ad7bb665
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 0000000090365e48

p0_label_33:
!	Mem[0000000030141400] = c59ff6a6 555f0012, %l4 = ceffffff, %l5 = f92dc578
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000555f0012 00000000c59ff6a6
!	Mem[0000000010081410] = 932a1971 c59ff6a6, %l4 = 555f0012, %l5 = c59ff6a6
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000c59ff6a6 00000000932a1971
!	Mem[0000000010101410] = 99000000, %l2 = 0000000090365e48
	ldsba	[%i4+0x012]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l6 = 000000000000008a
	lduha	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %l7 = 0000000090365cfc
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l4 = 00000000c59ff6a6, %l1 = 0000000000000000
	sdivx	%l7,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000010141408] = c82f0b2f, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000c82f0b2f
!	Mem[0000000010181400] = 95000000 000000a2, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000a2 0000000095000000
!	Mem[0000000030041410] = b1069d03, %l0 = 00000000000000a2
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffb1
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = c82f0b2f, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000c82f0b2f

p0_label_34:
!	%l5 = 00000000932a1971, Mem[0000000010101410] = 00000099
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 932a1971
!	%l6 = 0000000000000000, Mem[00000000211c0000] = 89ffb6f7
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 0000b6f7
!	%l4 = 00000000c59ff6a6, Mem[00000000300c1400] = 00009900
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = c59ff6a6
!	Mem[0000000030081410] = ff000000, %l1 = 0000000095000000
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101410] = 71192a9300000000, %l2 = 00000000c82f0b2f, %l5 = 00000000932a1971
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 71192a9300000000
!	%f14 = 75b0d706 cfd92c64, %l7 = 00000000c82f0b2f
!	Mem[0000000030041428] = e096edc010956a09
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041428] = 75b0d706cfd92c64
!	%l6 = 0000000000000000, Mem[000000001008143e] = e335ff2c
	sth	%l6,[%i2+0x03e]		! Mem[000000001008143c] = e3350000
!	%l6 = 00000000, %l7 = c82f0b2f, Mem[0000000030081408] = 357675b0 06dd9ece
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 c82f0b2f
!	Mem[0000000030081408] = 00000000, %l0 = ffffffffffffffb1
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffff94 d215c5a5, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffff94 00000000d215c5a5

p0_label_35:
!	Mem[0000000010001420] = 12000000, %l7 = 00000000c82f0b2f
	lduw	[%i0+0x020],%l7		! %l7 = 0000000012000000
!	Mem[0000000010001410] = ce9edd06, %l2 = 00000000c82f0b2f
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ce9e
!	%l2 = 000000000000ce9e, %l7 = 0000000012000000, %l4 = 00000000c59ff6a6
	xnor	%l2,%l7,%l4		! %l4 = ffffffffedff3161
!	Mem[00000000100c1434] = b91f6d7c, %l3 = 00000000000000f4
	ldsha	[%i3+0x036]%asi,%l3	! %l3 = 0000000000006d7c
!	%l7 = 0000000012000000, imm = ffffffffffffffc7, %l5 = 71192a9300000000
	or	%l7,-0x039,%l5		! %l5 = ffffffffffffffc7
!	Mem[0000000030181408] = f45fd77b, %f23 = fe527200
	lda	[%i6+%o4]0x89,%f23	! %f23 = f45fd77b
!	%l1 = 00000000d215c5a5, %l3 = 0000000000006d7c, %l0 = 00000000ffffff94
	orn	%l1,%l3,%l0		! %l0 = ffffffffffffd7a7
!	Mem[0000000030001408] = f92dc578, %l4 = ffffffffedff3161
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000078
!	Mem[00000000201c0000] = ffff9a5f, %l2 = 000000000000ce9e
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 0000b6f7, %l1 = 00000000d215c5a5
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_36:
!	Mem[0000000010181400] = 000000a2, %l4 = 0000000000000078
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000a2000000ff
!	%l4 = 000000a2, %l5 = ffffffc7, Mem[0000000010101410] = 71192a93 00000000
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000a2 ffffffc7
!	%l7 = 0000000012000000, imm = 0000000000000f3a, %l1 = 0000000000000000
	orn	%l7,0xf3a,%l1		! %l1 = fffffffffffff0c5
!	%f16 = b54e5f55, Mem[0000000030081410] = 000000ff
	sta	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = b54e5f55
!	%f0  = 7b5ae341, Mem[0000000010181410] = 7bd75ff4
	sta	%f0 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 7b5ae341
!	%f28 = d3dbec32 83c04ec2, Mem[0000000010141400] = ff000000 e0720fbe
	stda	%f28,[%i5+%g0]0x88	! Mem[0000000010141400] = d3dbec32 83c04ec2
!	%f14 = 75b0d706 cfd92c64, Mem[0000000030181408] = f45fd77b d054b9cb
	stda	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = 75b0d706 cfd92c64
!	%l2 = ffffffff, %l3 = 00006d7c, Mem[0000000030041408] = 41f4bc7b f483ea50
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff 00006d7c
!	Mem[0000000030101400] = 12000000, %l1 = fffffffffffff0c5
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 0000000012000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000 b54e5f55, %l4 = 000000a2, %l5 = ffffffc7
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000b54e5f55 0000000000000000

p0_label_37:
!	%f14 = 75b0d706, %f17 = 6f9dffff
	fcmps	%fcc0,%f14,%f17		! %fcc0 = 2
!	Mem[0000000010101418] = 941ec96764ecce2e, %f0  = 7b5ae341 50ea83f4
	ldd	[%i4+0x018],%f0 	! %f0  = 941ec967 64ecce2e
!	%l2 = ffffffffffffffff, imm = fffffffffffff0db, %l3 = 0000000000006d7c
	and	%l2,-0xf25,%l3		! %l3 = fffffffffffff0db
!	Code Fragment 4
p0_fragment_3:
!	%l0 = ffffffffffffd7a7
	setx	0xd9c68d2fa021851a,%g7,%l0 ! %l0 = d9c68d2fa021851a
!	%l1 = 0000000012000000
	setx	0x83962ca024f39943,%g7,%l1 ! %l1 = 83962ca024f39943
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d9c68d2fa021851a
	setx	0x3c1dd367e799ed78,%g7,%l0 ! %l0 = 3c1dd367e799ed78
!	%l1 = 83962ca024f39943
	setx	0xc7e2519788699ab5,%g7,%l1 ! %l1 = c7e2519788699ab5
!	Mem[0000000030041410] = 039d06b1, %f17 = 6f9dffff
	lda	[%i1+%o5]0x89,%f17	! %f17 = 039d06b1
!	Mem[0000000010081408] = 99bb9ea8, %f13 = a6e7e8c1
	lda	[%i2+%o4]0x80,%f13	! %f13 = 99bb9ea8
!	Mem[00000000300c1400] = a6f69fc5a6e7e8c1, %f30 = 000000a2 53e80133
	ldda	[%i3+%g0]0x81,%f30	! %f30 = a6f69fc5 a6e7e8c1
!	Mem[0000000010181430] = 865c65e1ff83ffff, %l1 = c7e2519788699ab5
	ldxa	[%i6+0x030]%asi,%l1	! %l1 = 865c65e1ff83ffff
!	%l4 = 00000000b54e5f55, %l7 = 0000000012000000, %l5 = 0000000000000000
	udivx	%l4,%l7,%l5		! %l5 = 000000000000000a
!	Starting 10 instruction Store Burst
!	%f0  = 941ec967 64ecce2e, %l7 = 0000000012000000
!	Mem[0000000030141400] = 12005f55a6f69fc5
	stda	%f0,[%i5+%l7]ASI_PST32_S ! Mem[0000000030141400] = 12005f55a6f69fc5

p0_label_38:
!	%l0 = 3c1dd367e799ed78, Mem[0000000010041403] = 3083808b, %asi = 80
	stba	%l0,[%i1+0x003]%asi	! Mem[0000000010041400] = 30838078
!	%l7 = 0000000012000000, Mem[00000000201c0000] = ffff9a5f, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00009a5f
!	Mem[0000000010101434] = b49ed50d, %l1 = ff83ffff, %l0 = e799ed78
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000b49ed50d
!	Mem[0000000010101400] = 12000000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000012000000ff
!	Mem[000000001018141c] = ad7b3a62, %l3 = fffffffffffff0db
	ldstuba	[%i6+0x01c]%asi,%l3	! %l3 = 000000ad000000ff
!	%l4 = 00000000b54e5f55, Mem[00000000300c1400] = a6f69fc5a6e7e8c1
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000b54e5f55
!	%f16 = b54e5f55, Mem[0000000030141400] = 12005f55
	sta	%f16,[%i5+%g0]0x81	! Mem[0000000030141400] = b54e5f55
!	%l2 = ffffffffffffffff, Mem[0000000010001410] = 90365cfc06dd9ece
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffffffffff
!	Mem[0000000010141410] = ffffffff, %l3 = 00000000000000ad
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = b54e5f55, %l6 = 0000000000000012
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000055

p0_label_39:
!	Mem[0000000010001408] = 000000f490365e48, %f22 = 99bb9ea8 f45fd77b
	ldda	[%i0+%o4]0x88,%f22	! %f22 = 000000f4 90365e48
!	Mem[00000000300c1410] = c59ff6a6, %l0 = 00000000b49ed50d
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = fffffffffffff6a6
!	Mem[0000000030101408] = ff000000, %l5 = 000000000000000a
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 83c04ec2, %l2 = ffffffffffffffff
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000c2
!	Mem[0000000030081410] = b54e5f55, %l6 = 0000000000000055
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 00000000b54e5f55
!	Mem[0000000030041400] = 93ffffffffffffce, %l1 = 865c65e1ff83ffff
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 93ffffffffffffce
!	Mem[0000000010041410] = 00000000, %l6 = 00000000b54e5f55
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ff3e7d2b6be34682, %l4 = 00000000b54e5f55
	ldxa	[%i3+0x008]%asi,%l4	! %l4 = ff3e7d2b6be34682
!	Mem[0000000010181400] = 000000ff, %l7 = 0000000012000000
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 99bb9ea8, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x008]%asi,%l7	! %l7 = 0000000099bb9ea8

p0_label_40:
!	%l4 = ff3e7d2b6be34682, Mem[0000000010181400] = 000000ff
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000082
!	%l6 = 00000000, %l7 = 99bb9ea8, Mem[0000000030001400] = c59ff6a6 555f4eb5
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 99bb9ea8
!	%l1 = 93ffffffffffffce, Mem[0000000020800000] = a1f38691, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = ffce8691
!	%l7 = 0000000099bb9ea8, Mem[0000000010141400] = c24ec08332ecdbd3
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000099bb9ea8
!	%f26 = 6d88f660 91f2eeef, %l7 = 0000000099bb9ea8
!	Mem[0000000010101408] = e26d8f3745dac62e
	add	%i4,0x008,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101408] = e26d8f3745dac62e
!	Mem[0000000010041404] = d215c5a5, %l7 = 0000000099bb9ea8
	swap	[%i1+0x004],%l7		! %l7 = 00000000d215c5a5
!	%l5 = 0000000000000000, Mem[0000000010001402] = ffff9d6f
	sth	%l5,[%i0+0x002]		! Mem[0000000010001400] = ffff0000
!	Mem[00000000100c1410] = 12000000, %l7 = 00000000d215c5a5
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000012000000ff
!	%l5 = 0000000000000000, imm = fffffffffffff344, %l2 = 00000000000000c2
	xor	%l5,-0xcbc,%l2		! %l2 = fffffffffffff344
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %l0 = fffffffffffff6a6
	ldswa	[%i0+0x010]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_41:
!	Mem[0000000030081410] = 555f4eb5, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = 00000000555f4eb5
!	Mem[0000000010041420] = c59ff6a6, %l3 = 00000000ffffffff
	lduba	[%i1+0x021]%asi,%l3	! %l3 = 000000000000009f
!	Mem[0000000010001408] = 485e3690, %l0 = ffffffffffffffff
	lduba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000048
!	Mem[0000000030101410] = 000000a2, %l3 = 000000000000009f
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000a2
!	Mem[0000000010041400] = 3083807899bb9ea8, %l0 = 0000000000000048
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 3083807899bb9ea8
!	Mem[0000000030101410] = 000000a2c82f0b2f, %l0 = 3083807899bb9ea8
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 000000a2c82f0b2f
!	Mem[0000000030041410] = 039d06b1, %f21 = 06dd9ece
	lda	[%i1+%o5]0x89,%f21	! %f21 = 039d06b1
!	Mem[0000000010041410] = 00000000, %l0 = 000000a2c82f0b2f
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = ffce8691, %l2 = fffffffffffff344
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000ffce
!	Starting 10 instruction Store Burst
!	%l4 = ff3e7d2b6be34682, Mem[0000000030081410] = b54e5f55
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = b54e4682

p0_label_42:
!	Mem[0000000010081410] = a6f69fc5, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000a6000000ff
!	Mem[0000000030001410] = ff000000, %l7 = 0000000000000012
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%l3 = 00000000000000a2, Mem[0000000030041400] = 93ffffffffffffce
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000a2
!	Mem[0000000010001410] = ffffffff, %l2 = 000000000000ffce
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001410] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000201c0001] = 00009a5f, %l4 = ff3e7d2b6be34682
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000021800140] = a286154d, %l1 = 93ffffffffffffce
	ldstub	[%o3+0x140],%l1		! %l1 = 000000a2000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1438] = 91c3a07d
	stw	%l0,[%i3+0x038]		! Mem[00000000100c1438] = 00000000
!	Mem[0000000010081410] = fff69fc5, %l6 = 00000000555f4eb5
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000fff69fc5
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 62000000, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000006200

p0_label_43:
!	Mem[0000000030181400] = 93001971c59ff6a6, %f2  = 3083808b d215c5a5
	ldda	[%i6+%g0]0x89,%f2 	! %f2  = 93001971 c59ff6a6
!	Mem[0000000010081438] = 2fd3c516e3350000, %f22 = 000000f4 90365e48
	ldd	[%i2+0x038],%f22	! %f22 = 2fd3c516 e3350000
!	Mem[0000000010001410] = 000000ffffffffff, %l1 = 00000000000000a2
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 000000ffffffffff
!	Mem[0000000020800040] = 00ff978a, %l3 = 00000000000000a2
	ldsb	[%o1+0x041],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff9a5f, %l4 = 0000000000006200
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101400] = ff000000c41c7f20, %l7 = 00000000ff000000
	ldx	[%i4+%g0],%l7		! %l7 = ff000000c41c7f20
!	Mem[0000000010041408] = cd000090, %l4 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 00000000cd000090
!	Mem[0000000030181400] = 93001971c59ff6a6, %f0  = 941ec967 64ecce2e
	ldda	[%i6+%g0]0x89,%f0 	! %f0  = 93001971 c59ff6a6
!	Mem[0000000020800000] = ffce8691, %l0 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 01e34682, %l3 = ffffffffffffffff
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000001e34682

p0_label_44:
!	Mem[0000000030101408] = ff000000, %l7 = ff000000c41c7f20
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010101408] = e26d8f37, %l7 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 000000e2000000ff
!	Mem[00000000211c0000] = ff00b6f7, %l6 = 00000000fff69fc5
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030041408] = ffffffff, %l5 = 00000000000000a6
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010181400] = 00000082, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000082
!	Mem[0000000030001410] = 12000000, %l1 = 000000ffffffffff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000012000000
!	%l3 = 0000000001e34682, Mem[0000000021800040] = ff1bf914, %asi = 80
	stba	%l3,[%o3+0x040]%asi	! Mem[0000000021800040] = 821bf914
!	%l4 = cd000090, %l5 = ffffffff, Mem[0000000030141408] = f02324f4 78c52df9
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = cd000090 ffffffff
!	Mem[00000000218001c1] = ec18ae2e, %l0 = 0000000000000082
	ldstub	[%o3+0x1c1],%l0		! %l0 = 00000018000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000, %l1 = 0000000012000000
	ldsba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_45:
!	Mem[0000000030101408] = 207f1cc4, %l5 = 00000000ffffffff
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000207f
!	Mem[00000000300c1408] = f483ea50 41e35a7b, %l0 = 00000018, %l1 = 00000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000f483ea50 0000000041e35a7b
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000f483ea50
	setx	0x28fd09279bc0ef89,%g7,%l0 ! %l0 = 28fd09279bc0ef89
!	%l1 = 0000000041e35a7b
	setx	0x398ab21040338a87,%g7,%l1 ! %l1 = 398ab21040338a87
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 28fd09279bc0ef89
	setx	0x7d45c3387e1a9a50,%g7,%l0 ! %l0 = 7d45c3387e1a9a50
!	%l1 = 398ab21040338a87
	setx	0xf9d543481e451c5a,%g7,%l1 ! %l1 = f9d543481e451c5a
!	Mem[0000000010141400] = 00000000, %l3 = 0000000001e34682
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 7d45c3387e1a9a50
	ldsb	[%i5+0x00a],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141400] = 0000000099bb9ea8, %f22 = 2fd3c516 e3350000
	ldda	[%i5+%g0]0x80,%f22	! %f22 = 00000000 99bb9ea8
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000000000
	setx	0xc53ffe1fe6429c4d,%g7,%l0 ! %l0 = c53ffe1fe6429c4d
!	%l1 = f9d543481e451c5a
	setx	0x8bb54c07aab626d4,%g7,%l1 ! %l1 = 8bb54c07aab626d4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c53ffe1fe6429c4d
	setx	0x0e6f88cfac50c125,%g7,%l0 ! %l0 = 0e6f88cfac50c125
!	%l1 = 8bb54c07aab626d4
	setx	0xeb65ba780aa5dd7f,%g7,%l1 ! %l1 = eb65ba780aa5dd7f
!	Mem[0000000030081400] = ff788b7f, %f17 = 039d06b1
	lda	[%i2+%g0]0x81,%f17	! %f17 = ff788b7f
!	Mem[00000000211c0000] = ff00b6f7, %l7 = 00000000000000e2
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l4 = 00000000cd000090, Mem[0000000021800080] = f522fa8a, %asi = 80
	stba	%l4,[%o3+0x080]%asi	! Mem[0000000021800080] = 9022fa8a

p0_label_46:
!	%l7 = ffffffffffffff00, Mem[00000000211c0000] = ff00b6f7, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000b6f7
!	%f4  = 78c52df9 f02324f4, %l7 = ffffffffffffff00
!	Mem[0000000010001418] = 007252fea89ebb99
	add	%i0,0x018,%g1
	stda	%f4,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001418] = 007252fea89ebb99
!	%l2 = 00000000ffffffff, Mem[000000001008141e] = fc5c3690
	sth	%l2,[%i2+0x01e]		! Mem[000000001008141c] = fc5cffff
!	%f27 = 91f2eeef, Mem[0000000010001408] = 90365e48
	sta	%f27,[%i0+%o4]0x88	! Mem[0000000010001408] = 91f2eeef
!	Mem[0000000010181420] = 8246e30186583ea6, %l2 = 00000000ffffffff, %l6 = 00000000000000ff
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 8246e30186583ea6
!	%l0 = 0e6f88cfac50c125, Mem[00000000100c1400] = 00000062
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000c125
!	%l3 = 0000000000000000, Mem[000000001018143d] = 7bd75ff4
	stb	%l3,[%i6+0x03d]		! Mem[000000001018143c] = 7b005ff4
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffff00
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0001] = 00ff9a5f, %l4 = 00000000cd000090
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = f483ea5041e35a7b, %f24 = a89ebb99 00000012
	ldda	[%i3+%o4]0x81,%f24	! %f24 = f483ea50 41e35a7b

p0_label_47:
!	Mem[0000000030181410] = 4bb9ae98 85788b7f, %l4 = 000000ff, %l5 = 0000207f
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 0000000085788b7f 000000004bb9ae98
!	Mem[0000000010181410] = 41e35a7b, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 00000000000041e3
!	Mem[00000000100c1400] = 2f0b2fc8 0000c125, %l6 = 86583ea6, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 000000000000c125 000000002f0b2fc8
!	Mem[00000000300c1410] = c59ff6a6, %l6 = 000000000000c125
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 00000000c59ff6a6
!	Mem[0000000010041400] = a89ebb9978808330, %f0  = 93001971 c59ff6a6
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = a89ebb99 78808330
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0e6f88cfac50c125
	setx	0x7588a2cfaa10de63,%g7,%l0 ! %l0 = 7588a2cfaa10de63
!	%l1 = eb65ba780aa5dd7f
	setx	0x5e54899879e95b9a,%g7,%l1 ! %l1 = 5e54899879e95b9a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7588a2cfaa10de63
	setx	0x94e1de30389a19c4,%g7,%l0 ! %l0 = 94e1de30389a19c4
!	%l1 = 5e54899879e95b9a
	setx	0xd0f7fc701e366a1f,%g7,%l1 ! %l1 = d0f7fc701e366a1f
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000041e3
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 00ff9a5f, %l1 = d0f7fc701e366a1f
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 50ea83f4, %f30 = a6f69fc5
	lda	[%i5+%o5]0x81,%f30	! %f30 = 50ea83f4
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 900000cd, %l0 = 94e1de30389a19c4
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000090000000ff

p0_label_48:
!	%l3 = 0000000000000000, Mem[0000000010101410] = 000000a2ffffffc7
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000090
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000c59ff6a6, Mem[00000000300c1410] = a6f69fc5
	stha	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = f6a69fc5
!	Mem[0000000010081424] = 0e087c46, %l6 = c59ff6a6, %l4 = 85788b7f
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 000000000e087c46
!	%l4 = 000000000e087c46, Mem[0000000010141400] = 00000000
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00007c46
!	Mem[0000000030001410] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	%f22 = 00000000 99bb9ea8, %l1 = 00000000ffffffff
!	Mem[0000000010041438] = d6ffdfdb588dfcbf
	add	%i1,0x038,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041438] = 0000000099bb9ea8
!	Mem[0000000010101400] = ff000000, %l6 = 00000000c59ff6a6
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%l7 = 000000002f0b2fc8, Mem[00000000100c1408] = 2b7d3eff
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 2b7d3ec8
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, immd = fffffffffffff709, %l3  = 0000000000000000
	mulx	%l3,-0x8f7,%l3		! %l3 = 0000000000000000

p0_label_49:
!	Mem[0000000010101410] = 00000000 00000000, %l4 = 0e087c46, %l5 = 4bb9ae98
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101404] = c41c7f20, %l4 = 0000000000000000
	lduh	[%i4+0x004],%l4		! %l4 = 000000000000c41c
!	Mem[0000000010141400] = 00007c46, %l1 = 00000000ffffffff
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000007c46
!	Mem[0000000010141400] = a89ebb9900007c46, %l1 = 0000000000007c46
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = a89ebb9900007c46
!	Mem[00000000100c1410] = ff000000, %f15 = cfd92c64
	lda	[%i3+%o5]0x80,%f15	! %f15 = ff000000
!	Mem[0000000010141410] = 9f23bd26 000000ad, %l6 = ff000000, %l7 = 2f0b2fc8
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ad 000000009f23bd26
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010141400] = 467c0000 99bb9ea8 ff000000 c76a59f7
!	Mem[0000000010141410] = ad000000 26bd239f 919fd6c4 448300c6
!	Mem[0000000010141420] = 0f6fa18d 6ba14678 b6662aa7 f92dc578
!	Mem[0000000010141430] = c9b591df 6288d4f3 050f1212 f92dc578
	ldda	[%i5]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[0000000021800140] = ff86154d, %l5 = 0000000000000000
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 000000000000ff86
!	Mem[0000000010181400] = ff000000, %l0 = 0000000000000000
	ldsb	[%i6+%g0],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = a89ebb9900007c46, Mem[0000000030181408] = cfd92c64
	stba	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = cfd92c46

p0_label_50:
!	%f10 = ad7b3a62, Mem[0000000030181400] = a6f69fc5
	sta	%f10,[%i6+%g0]0x81	! Mem[0000000030181400] = ad7b3a62
!	Mem[0000000030141400] = b54e5f55, %l2 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000b5000000ff
!	%f10 = ad7b3a62 00000012, Mem[0000000010041410] = 00000000 6f9dffff
	stda	%f10,[%i1+%o5]0x80	! Mem[0000000010041410] = ad7b3a62 00000012
!	%l0 = ffffffffffffffff, Mem[0000000030181400] = ad7b3a62
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ff7b3a62
!	%f8  = 06dd9ece 357675b0, Mem[0000000010041408] = ff0000cd 74f91143
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 06dd9ece 357675b0
!	Mem[0000000030101410] = a2000000, %l1 = a89ebb9900007c46
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000000000ad, Mem[0000000010101405] = c41c7f20
	stb	%l6,[%i4+0x005]		! Mem[0000000010101404] = c4ad7f20
!	Code Fragment 4
p0_fragment_7:
!	%l0 = ffffffffffffffff
	setx	0x7b28a250580c88c3,%g7,%l0 ! %l0 = 7b28a250580c88c3
!	%l1 = 0000000000000000
	setx	0x357fa62fd9a25bd9,%g7,%l1 ! %l1 = 357fa62fd9a25bd9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7b28a250580c88c3
	setx	0x14e1027025aa6464,%g7,%l0 ! %l0 = 14e1027025aa6464
!	%l1 = 357fa62fd9a25bd9
	setx	0xc33e27f7d145984f,%g7,%l1 ! %l1 = c33e27f7d145984f
!	Mem[0000000010101400] = a6f69fc5, %l5 = 000000000000ff86
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000c5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000, %l2 = 00000000000000b5
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_51:
!	Mem[0000000030181408] = 462cd9cf 06d7b075, %l4 = 0000c41c, %l5 = 000000c5
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000462cd9cf 0000000006d7b075
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffffffffff
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = a89ebb9900000000, %f14 = 75b0d706 ff000000
	ldda	[%i0+%g0]0x89,%f14	! %f14 = a89ebb99 00000000
!	Mem[0000000010081420] = 8407ba22 0e087c46, %l2 = 00000000, %l3 = 00000000
	ldd	[%i2+0x020],%l2		! %l2 = 000000008407ba22 000000000e087c46
!	Mem[00000000201c0000] = 00ff9a5f, %l1 = c33e27f7d145984f
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 2b7d3ec8, %f12 = 00990000
	lda	[%i3+%o4]0x88,%f12	! %f12 = 2b7d3ec8
!	Mem[00000000300c1400] = 00000090, %f9  = 357675b0
	lda	[%i3+%g0]0x81,%f9 	! %f9 = 00000090
!	Mem[0000000030181410] = 7f8b7885 98aeb94b, %l2 = 8407ba22, %l3 = 0e087c46
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000007f8b7885 0000000098aeb94b
!	Mem[0000000010101408] = ff6d8f37 45dac62e, %l6 = 000000ad, %l7 = 9f23bd26
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff6d8f37 0000000045dac62e
!	Starting 10 instruction Store Burst
!	%f4  = 78c52df9 f02324f4, %l1 = 00000000000000ff
!	Mem[0000000010001438] = 3301e853a2000000
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001438] = 78c52df9f02324f4

p0_label_52:
!	Mem[0000000010081400] = ffffffff, %l3 = 0000000098aeb94b
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030181410] = 85788b7f, %l6 = 00000000ff6d8f37
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 0000007f000000ff
!	Mem[0000000030081408] = ffffffb1, %l0 = 14e1027025aa6464
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101408] = 207f1cc4, %l5 = 0000000006d7b075
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000020000000ff
!	%l3 = 00000000ffffffff, Mem[0000000010181400] = 000000ff
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	Mem[0000000030141400] = 555f4eff, %l2 = 000000007f8b7885
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%f21 = 000000ad, Mem[0000000030181400] = 623a7bff
	sta	%f21,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ad
!	%l6 = 0000007f, %l7 = 45dac62e, Mem[00000000100c1408] = 2b7d3ec8 8246e36b
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000007f 45dac62e
!	%l6 = 0000007f, %l7 = 45dac62e, Mem[0000000010001438] = 78c52df9 f02324f4
	std	%l6,[%i0+0x038]		! Mem[0000000010001438] = 0000007f 45dac62e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff9ff6a6, %l4 = 00000000462cd9cf
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_53:
!	Mem[0000000010141400] = 467c0000, %l5 = 0000000000000020
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000046
!	Mem[0000000021800100] = 7f20e14a, %l7 = 0000000045dac62e
	lduha	[%o3+0x100]%asi,%l7	! %l7 = 0000000000007f20
!	Mem[0000000030101400] = c5f0ffff, %l5 = 0000000000000046
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l6 = 000000000000007f
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 50ea83f4, %l7 = 0000000000007f20
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = 0000000050ea83f4
!	Mem[0000000010041400] = 3083807899bb9ea8, %f2  = 93001971 c59ff6a6
	ldda	[%i1+%g0]0x80,%f2 	! %f2  = 30838078 99bb9ea8
!	Mem[0000000010181410] = 41e35a7b6f1b3f50, %l0 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = 41e35a7b6f1b3f50
!	Mem[0000000030001408] = 78c52df9, %l5 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = 00000000000078c5
!	Mem[00000000300c1408] = f483ea50, %l7 = 0000000050ea83f4
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000f483ea50
!	Starting 10 instruction Store Burst
!	%f14 = a89ebb99, Mem[0000000010041400] = 78808330
	sta	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = a89ebb99

p0_label_54:
	membar	#Sync			! Added by membar checker (6)
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010141408] = 000000ff f7596ac7
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff ffffffff
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 70064778039d06b1
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	%f16 = a89ebb99 00007c46 f7596ac7 000000ff
!	%f20 = 9f23bd26 000000ad c6008344 c4d69f91
!	%f24 = 7846a16b 8da16f0f 78c52df9 a72a66b6
!	%f28 = f3d48862 df91b5c9 78c52df9 12120f05
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l1 = 00000000000000ff, Mem[0000000030041400] = a89ebb99
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%l7 = 00000000f483ea50, Mem[0000000010081410] = b54e5f55
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = b54eea50
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010141400] = 467c0000 99bb9ea8
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff ffffffff
!	%l5 = 00000000000078c5, Mem[000000001004142e] = 59f7aa31, %asi = 80
	stba	%l5,[%i1+0x02e]%asi	! Mem[000000001004142c] = 59f7c531
!	%l6 = 0000000000000000, Mem[0000000030081408] = b1ffffff
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = b1ffff00
!	Mem[0000000030141400] = 555f4eff, %l5 = 00000000000078c5
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030041408] = c76a59f7, %l0 = 41e35a7b6f1b3f50
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = ffffffffc76a59f7

p0_label_55:
!	Mem[0000000010081410] = 50ea4eb5, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 00000000000050ea
!	Mem[0000000030141408] = 900000cd, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffff90
!	Mem[00000000100c1410] = ff000000, %l0 = ffffffffc76a59f7
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081408] = 00ffffb1, %l7 = 00000000f483ea50
	lduha	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 98aeb94b86583ea6, %l1 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 98aeb94b86583ea6
!	Mem[0000000010081400] = 98aeb94b, %l2 = 00000000000050ea
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000098
!	Mem[0000000010101438] = 9211806100000060, %l7 = 00000000000000ff
	ldx	[%i4+0x038],%l7		! %l7 = 9211806100000060
!	Mem[0000000030081410] = 82464eb5, %l5 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffff82
!	Mem[00000000100c1408] = 7f000000, %l7 = 9211806100000060
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000007f00
!	Starting 10 instruction Store Burst
!	%l6 = ffffff90, %l7 = 00007f00, Mem[0000000030001410] = ff000000 fc5c3690
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffff90 00007f00

p0_label_56:
!	%l6 = ffffffffffffff90, Mem[00000000211c0001] = 0000b6f7, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0090b6f7
!	%f16 = a89ebb99 00007c46, Mem[0000000010181438] = 503f1b6f 7b005ff4
	std	%f16,[%i6+0x038]	! Mem[0000000010181438] = a89ebb99 00007c46
!	Mem[0000000010001400] = 0000ffff, %l0 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[000000001018140e] = d215c5a5, %l2 = 0000000000000098
	ldstuba	[%i6+0x00e]%asi,%l2	! %l2 = 000000c5000000ff
!	Mem[0000000010181408] = ffffff94, %l1 = 98aeb94b86583ea6
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l5 = ffffffffffffff82, Mem[0000000030141408] = 900000cd
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffff82
!	%l3 = 00000000ffffffff, Mem[0000000010181410] = 7b5ae341
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 7b5ae3ff
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000007f00
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 82464eb5, %l0 = 000000000000ffff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000082000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000c125, %l1 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffffc125

p0_label_57:
!	Mem[0000000010001410] = ffffffff ff000000, %l4 = ffffffff, %l5 = ffffff82
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000ff000000 00000000ffffffff
!	Mem[00000000100c1400] = 25c10000c82f0b2f, %l5 = 00000000ffffffff
	ldx	[%i3+%g0],%l5		! %l5 = 25c10000c82f0b2f
!	Mem[00000000100c1408] = 7f000000, %l5 = 25c10000c82f0b2f
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000007f00
!	Mem[00000000211c0000] = 0090b6f7, %l5 = 0000000000007f00
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 9f23bd26, %l6 = ffffffffffffff90
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff9f
!	Mem[00000000300c1408] = f483ea50, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = fffffffffffff483
!	Mem[0000000030001408] = f92dc578, %l0 = 0000000000000082
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = fffffffff92dc578
!	Mem[0000000030101400] = c5f0ffff, %f26 = 78c52df9
	lda	[%i4+%g0]0x89,%f26	! %f26 = c5f0ffff
!	Mem[0000000010001400] = 000000ff, %l3 = 00000000ffffffff
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 90ffffff, %l2 = 00000000000000c5
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_58:
!	%f11 = 00000012, Mem[0000000010101408] = ff6d8f37
	sta	%f11,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000012
!	Mem[0000000020800041] = 00ff978a, %l2 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000ff000000ff
!	%l6 = ffffffffffffff9f, Mem[0000000010181410] = ffe35a7b, %asi = 80
	stwa	%l6,[%i6+0x010]%asi	! Mem[0000000010181410] = ffffff9f
!	%f18 = f7596ac7, Mem[000000001008141c] = fc5cffff
	st	%f18,[%i2+0x01c]	! Mem[000000001008141c] = f7596ac7
!	%l2 = 00000000000000ff, Mem[0000000010101428] = a5ac22bb
	stw	%l2,[%i4+0x028]		! Mem[0000000010101428] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010181426] = 86583ea6, %asi = 80
	stha	%l7,[%i6+0x026]%asi	! Mem[0000000010181424] = 86580000
!	%l1 = ffffffffffffc125, Mem[00000000100c1428] = 9af9f82e
	stw	%l1,[%i3+0x028]		! Mem[00000000100c1428] = ffffc125
!	%f19 = 000000ff, Mem[00000000300c1410] = f6a69fc5
	sta	%f19,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%l1 = ffffffffffffc125, Mem[0000000030081400] = 7f8b78ff
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 7f8b7825
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 78c52df9, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 00000000000078c5

p0_label_59:
!	Mem[0000000010181410] = ffffff9f, %l5 = fffffffffffff483
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001434] = 32ecdbd3, %l3 = 00000000000000ff
	ldsw	[%i0+0x034],%l3		! %l3 = 0000000032ecdbd3
!	Mem[0000000030081400] = 25788b7f, %f7  = ffffffff
	lda	[%i2+%g0]0x81,%f7 	! %f7 = 25788b7f
!	Mem[0000000010041400] = a89ebb99a89ebb99, %f4  = 78c52df9 f02324f4
	ldda	[%i1+%g0]0x88,%f4 	! %f4  = a89ebb99 a89ebb99
!	Mem[0000000030181400] = ad000000, %l3 = 0000000032ecdbd3
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffad00
!	%l7 = 00000000000078c5, %l2 = 00000000000000ff, %l4 = 00000000ff000000
	or	%l7,%l2,%l4		! %l4 = 00000000000078ff
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000000078ff
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[000000001008142c] = 40519a40, %l2 = 00000000000000ff
	lduba	[%i2+0x02f]%asi,%l2	! %l2 = 0000000000000040
!	Mem[0000000010141408] = ff000000ffffffff, %f4  = a89ebb99 a89ebb99
	ldda	[%i5+%o4]0x80,%f4 	! %f4  = ff000000 ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000040, %l2 = 0000000000000040, %y  = ffffffff
	umul	%l2,%l2,%l3		! %l3 = 0000000000001000, %y = 00000000

p0_label_60:
!	%l6 = ffffffffffffff9f, Mem[0000000010181408] = ffffff94
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 9fffff94
!	%l2 = 0000000000000040, Mem[000000001008140c] = f57fea46
	stw	%l2,[%i2+0x00c]		! Mem[000000001008140c] = 00000040
!	%l0 = f92dc578, %l1 = ffffc125, Mem[0000000010141400] = 000000ff ffffffff
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = f92dc578 ffffc125
!	%f19 = 000000ff, Mem[0000000030041410] = 26bd239f
	sta	%f19,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Mem[0000000010041433] = 0d1b7abd, %l0 = fffffffff92dc578
	ldstuba	[%i1+0x033]%asi,%l0	! %l0 = 000000bd000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 00000000000000bd
	setx	0x44b82ec06ef3ba82,%g7,%l0 ! %l0 = 44b82ec06ef3ba82
!	%l1 = ffffffffffffc125
	setx	0xe445425799ddec60,%g7,%l1 ! %l1 = e445425799ddec60
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 44b82ec06ef3ba82
	setx	0x964dd8405eeef776,%g7,%l0 ! %l0 = 964dd8405eeef776
!	%l1 = e445425799ddec60
	setx	0x9baaad5fb0351a41,%g7,%l1 ! %l1 = 9baaad5fb0351a41
!	%l4 = ffffffffff000000, Mem[0000000030141408] = ffffffff82ffffff
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffff000000
!	%l0 = 964dd8405eeef776, Mem[0000000010001410] = 000000ff
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 760000ff
!	Mem[0000000010141408] = ff000000, %l7 = 00000000000078c5
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = f7596ac7, %l3 = 0000000000001000
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 000000000000f759

p0_label_61:
!	Mem[0000000010001408] = 000000f4 91f2eeef, %l6 = ffffff9f, %l7 = 000000ff
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000091f2eeef 00000000000000f4
!	Mem[0000000010181410] = 9fffffff, %l6 = 0000000091f2eeef
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = f483ea50, %l0 = 964dd8405eeef776
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = fffffffff483ea50
!	Mem[0000000021800040] = 821bf914, %l7 = 00000000000000f4
	lduha	[%o3+0x040]%asi,%l7	! %l7 = 000000000000821b
!	Mem[0000000010041400] = 99bb9ea8, %f1  = 78808330
	ld	[%i1+%g0],%f1 	! %f1 = 99bb9ea8
!	Mem[0000000010081408] = 000000ff, %l1 = 9baaad5fb0351a41
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 50ea83f4, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 0000000050ea83f4
!	Mem[0000000030081408] = b1ffff00, %l6 = 00000000000000ff
	lduwa	[%i2+%o4]0x89,%l6	! %l6 = 00000000b1ffff00
!	Mem[0000000030101400] = fffff0c5, %l7 = 000000000000821b
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 00000000fffff0c5
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000040, Mem[0000000030101408] = ff7f1cc4b0757635
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000040

p0_label_62:
!	%l5 = 000000000000ffff, Mem[0000000010181408] = 9fffff94, %asi = 80
	stba	%l5,[%i6+0x008]%asi	! Mem[0000000010181408] = ffffff94
!	%l5 = 000000000000ffff, imm = 0000000000000a55, %l4 = ffffffffff000000
	or	%l5,0xa55,%l4		! %l4 = 000000000000ffff
!	%f10 = ad7b3a62, %f11 = 00000012, %f16 = a89ebb99
	fdivs	%f10,%f11,%f16		! %l0 = fffffffff483ea72, Unfinished, %fsr = 1400000800
!	%f2  = 30838078 99bb9ea8, %l3 = 000000000000f759
!	Mem[0000000030001408] = 78c52df9a72a66b6
	add	%i0,0x008,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001408] = a89e2df9a72a8330
!	%l1 = 0000000050ea83f4, Mem[000000001014142c] = f92dc578
	sth	%l1,[%i5+0x02c]		! Mem[000000001014142c] = 83f4c578
!	Mem[0000000010181400] = ffffffff, %l2 = 0000000000000040
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041400] = 99bb9ea8, %l5 = 000000000000ffff
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000099000000ff
!	Mem[0000000030081410] = ff464eb5, %l0 = fffffffff483ea72
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = 0090b6f7, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffb6f7
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ad000000, %f21 = 000000ad
	lda	[%i6+%g0]0x81,%f21	! %f21 = ad000000

p0_label_63:
!	Mem[0000000010081400] = 98aeb94b86583ea6, %l7 = 00000000fffff0c5
	ldxa	[%i2+%g0]0x80,%l7	! %l7 = 98aeb94b86583ea6
!	Mem[0000000010041400] = ffbb9ea899bb9ea8, %f0  = a89ebb99 99bb9ea8
	ldd	[%i1+%g0],%f0 		! %f0  = ffbb9ea8 99bb9ea8
!	Mem[0000000010141430] = c9b591df6288d4f3, %f14 = a89ebb99 00000000
	ldd	[%i5+0x030],%f14	! %f14 = c9b591df 6288d4f3
!	Mem[0000000010181408] = ffffff94, %l6 = 00000000b1ffff00
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 25c1ffff78c52df9, %l5 = 0000000000000099
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 25c1ffff78c52df9
!	Mem[0000000021800000] = 1b56d648, %l0 = 00000000000000ff
	lduba	[%o3+0x001]%asi,%l0	! %l0 = 0000000000000056
!	Mem[0000000030141400] = c59ff6a6 555f4eff, %l4 = 0000ffff, %l5 = 78c52df9
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000555f4eff 00000000c59ff6a6
!	Mem[0000000010001410] = 760000ff, %l0 = 0000000000000056
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 00000000760000ff
!	Mem[00000000100c1404] = c82f0b2f, %l7 = 98aeb94b86583ea6
	ldub	[%i3+0x005],%l7		! %l7 = 000000000000002f
!	Starting 10 instruction Store Burst
!	%f18 = f7596ac7, Mem[0000000010181410] = 9fffffff
	sta	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = f7596ac7

p0_label_64:
!	Mem[00000000100c1400] = 0000c125, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000025000000ff
!	%f0  = ffbb9ea8, Mem[0000000010041410] = ad7b3a62
	sta	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ffbb9ea8
!	%f0  = ffbb9ea8 99bb9ea8 30838078 99bb9ea8
!	%f4  = ff000000 ffffffff 4bb9ae98 25788b7f
!	%f8  = 06dd9ece 00000090 ad7b3a62 00000012
!	%f12 = 2b7d3ec8 99bb9ea8 c9b591df 6288d4f3
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%l2 = 0000000000000025, Mem[0000000010141400] = f92dc578ffffc125
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000025
!	%f18 = f7596ac7 000000ff, Mem[0000000010081408] = ff000000 40000000
	stda	%f18,[%i2+%o4]0x88	! Mem[0000000010081408] = f7596ac7 000000ff
!	Mem[0000000010041408] = 06dd9ece, %l1 = 0000000050ea83f4
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 00000006000000ff
!	%l0 = 00000000760000ff, Mem[0000000010101404] = c4ad7f20, %asi = 80
	stha	%l0,[%i4+0x004]%asi	! Mem[0000000010101404] = 00ff7f20
!	%f26 = c5f0ffff a72a66b6, Mem[0000000010141420] = 0f6fa18d 6ba14678
	std	%f26,[%i5+0x020]	! Mem[0000000010141420] = c5f0ffff a72a66b6
!	Mem[00000000211c0000] = 00ffb6f7, %l3 = 000000000000f759
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000000025
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_65:
!	Mem[0000000010181428] = fff2554990365e48, %f20 = 9f23bd26 ad000000
	ldda	[%i6+0x028]%asi,%f20	! %f20 = fff25549 90365e48
!	Mem[0000000010101438] = 92118061, %l3 = 0000000000000000
	ldub	[%i4+0x03b],%l3		! %l3 = 0000000000000061
!	Mem[0000000010041408] = ce9eddff, %f28 = f3d48862
	lda	[%i1+%o4]0x88,%f28	! %f28 = ce9eddff
!	Mem[0000000030041400] = 467c0000ff000000, %l5 = 00000000c59ff6a6
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 467c0000ff000000
!	Mem[0000000010001408] = 91f2eeef, %l2 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ef
!	Mem[0000000020800040] = 00ff978a, %l1 = 0000000000000006
	ldsh	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 0000007f, %l5 = 467c0000ff000000
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 000000000000007f
!	Mem[0000000030181400] = 93001971 000000ad, %l6 = 000000ff, %l7 = 0000002f
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ad 0000000093001971
!	Mem[0000000010081408] = ff000000c76a59f7, %f28 = ce9eddff df91b5c9
	ldda	[%i2+%o4]0x80,%f28	! %f28 = ff000000 c76a59f7
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ef, Mem[0000000010001422] = 12000000
	stb	%l2,[%i0+0x022]		! Mem[0000000010001420] = 1200ef00

p0_label_66:
!	%l4 = 00000000555f4eff, Mem[000000001004141d] = 3ccbbec9
	stb	%l4,[%i1+0x01d]		! Mem[000000001004141c] = 3cffbec9
!	Mem[0000000010081408] = 000000ff, %l4 = 00000000555f4eff
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = 00ff9a5f
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ff9a5f
!	%l6 = 00000000000000ad, Mem[0000000010001430] = c24ec083
	stw	%l6,[%i0+0x030]		! Mem[0000000010001430] = 000000ad
!	Mem[000000001010140e] = 45dac62e, %l0 = 00000000760000ff
	ldstub	[%i4+0x00e],%l0		! %l0 = 000000c6000000ff
!	%f21 = 90365e48, %f31 = 12120f05
	fcmps	%fcc3,%f21,%f31		! %fcc3 = 1
!	%f19 = 000000ff, Mem[0000000030141408] = 78808330
	sta	%f19,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%l0 = 00000000000000c6, Mem[0000000010181408] = ffffff94
	stha	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00c6ff94
!	%f20 = fff25549, Mem[0000000030181408] = 462cd9cf
	sta	%f20,[%i6+%o4]0x81	! Mem[0000000030181408] = fff25549
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 865c65e1, %l5 = 000000000000007f
	ldsha	[%i6+0x030]%asi,%l5	! %l5 = ffffffffffff865c

p0_label_67:
!	Mem[0000000030081410] = b54e46ff, %l0 = 00000000000000c6
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001438] = 0000007f 45dac62e, %l4 = 000000ff, %l5 = ffff865c
	ldd	[%i0+0x038],%l4		! %l4 = 000000000000007f 0000000045dac62e
!	%l3 = 0000000000000061, imm = fffffffffffff287, %l7 = 0000000093001971
	andn	%l3,-0xd79,%l7		! %l7 = 0000000000000060
!	Mem[00000000300c1410] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030141400] = a89ebbff, %l0 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l0	! %l0 = 000000000000bbff
!	Mem[00000000300c1410] = 000000ff 9f121584, %l0 = 0000bbff, %l1 = 000000ff
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff 000000009f121584
!	Mem[0000000010081434] = 3d78e25a, %l7 = 0000000000000060
	ldswa	[%i2+0x034]%asi,%l7	! %l7 = 000000003d78e25a
!	Mem[00000000300c1400] = 555f4eb590000000, %l0 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = 555f4eb590000000
!	Mem[0000000030101400] = fffff0c5, %l5 = 0000000045dac62e
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 000000009f121584, Mem[0000000030181400] = ad00000071190093
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000009f121584

p0_label_68:
!	%f16 = a89ebb99 00007c46 f7596ac7 000000ff
!	%f20 = fff25549 90365e48 c6008344 c4d69f91
!	%f24 = 7846a16b 8da16f0f c5f0ffff a72a66b6
!	%f28 = ff000000 c76a59f7 78c52df9 12120f05
	stda	%f16,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%l2 = 00000000000000ef, Mem[0000000010181400] = ffffffff
	stwa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ef
!	%f4  = ff000000 ffffffff, Mem[0000000030101410] = a20000ff 2f0b2fc8
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 ffffffff
!	%f2  = 30838078, Mem[00000000300c1410] = 000000ff
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 30838078
!	Mem[00000000218000c1] = 0d5c635c, %l3 = 0000000000000061
	ldstuba	[%o3+0x0c1]%asi,%l3	! %l3 = 0000005c000000ff
!	Mem[000000001004140c] = 357675b0, %l7 = 3d78e25a, %l3 = 0000005c
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000357675b0
!	%l4 = 0000007f, %l5 = 000000ff, Mem[0000000010001410] = 760000ff ffffffff
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000007f 000000ff
!	Mem[0000000020800041] = 00ff978a, %l3 = 00000000357675b0
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000211c0000] = ffffb6f7
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00ffb6f7
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 78808330, %l7 = 000000003d78e25a
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 0000000000008330

p0_label_69:
!	Mem[00000000300c1400] = 555f4eb590000000, %f2  = 30838078 99bb9ea8
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 555f4eb5 90000000
!	Mem[0000000030081400] = 25788b7f, %l1 = 000000009f121584
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000025
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141428] = b6662aa783f4c578, %f6  = 4bb9ae98 25788b7f
	ldd	[%i5+0x028],%f6 	! %f6  = b6662aa7 83f4c578
!	Mem[0000000030001410] = 90ffffff, %l0 = 555f4eb590000000
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000021800000] = 1b56d648, %l4 = 000000000000007f
	lduh	[%o3+%g0],%l4		! %l4 = 0000000000001b56
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000000000ad
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101420] = ff547f31e837839c, %l5 = 00000000000000ff
	ldx	[%i4+0x020],%l5		! %l5 = ff547f31e837839c
!	Mem[0000000010041428] = 8e4407a0, %f7  = 83f4c578
	lda	[%i1+0x028]%asi,%f7 	! %f7 = 8e4407a0
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 007f0000, %l2 = 00000000000000ef
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000007f0000

p0_label_70:
!	%f9  = 00000090, Mem[0000000030141410] = 000000ff
	sta	%f9 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000090
!	%l1 = 0000000000000025, Mem[0000000030141410] = 90000000ffffffff
	stxa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000025
!	%l4 = 0000000000001b56, Mem[0000000030141400] = ffbb9ea8
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 1b569ea8
!	%f6  = b6662aa7 8e4407a0, %l4 = 0000000000001b56
!	Mem[0000000010141430] = c9b591df6288d4f3
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l4]ASI_PST16_P ! Mem[0000000010141430] = c9b52aa78e44d4f3
!	Mem[0000000010101408] = 12000000, %l5 = ff547f31e837839c
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000007f0000, %l0 = ffffffffffffffff, %l5 = 0000000000000000
	and	%l2,%l0,%l5		! %l5 = 00000000007f0000
!	%f10 = ad7b3a62 00000012, Mem[0000000030101408] = 00000000 00000040
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = ad7b3a62 00000012
!	%l7 = 0000000000008330, Mem[00000000300c1400] = 00000090b54e5f55
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000008330
!	%l0 = ffffffff, %l1 = 00000025, Mem[0000000030081408] = b1ffff00 c82f0b2f
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff 00000025
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_71:
!	Mem[0000000030041400] = 000000ff 00007c46 f7596ac7 000000ff
!	Mem[0000000030041410] = ff000000 000000ad c6008344 c4d69f91
!	Mem[0000000030041420] = 7846a16b 8da16f0f 78c52df9 a72a66b6
!	Mem[0000000030041430] = f3d48862 df91b5c9 78c52df9 12120f05
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000020800040] = 00ff978a, %l6 = 00000000000000ff
	ldub	[%o1+0x041],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %f1  = 99bb9ea8
	lda	[%i5+%g0]0x88,%f1 	! %f1 = 00000000
!	Mem[0000000030001408] = a89e2df9, %f2  = 555f4eb5
	lda	[%i0+%o4]0x81,%f2 	! %f2 = a89e2df9
!	Mem[0000000030001400] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 000000ef, %l1 = 0000000000000025
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ef
!	%f4  = ff000000 ffffffff, %f10 = ad7b3a62
	fxtos	%f4 ,%f10		! %f10 = db7fffff
!	%l6 = 0000000000000000, imm = fffffffffffffc2f, %l0 = 0000000000000000
	sub	%l6,-0x3d1,%l0		! %l0 = 00000000000003d1
!	%l5 = 00000000007f0000, imm = 0000000000000627, %l4 = 0000000000001b56
	andn	%l5,0x627,%l4		! %l4 = 00000000007f0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000008330
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_72:
!	Mem[0000000021800101] = 7f20e14a, %l3 = 0000000000000000
	ldstub	[%o3+0x101],%l3		! %l3 = 00000020000000ff
!	%f8  = 06dd9ece 00000090, Mem[00000000300c1400] = 00000000 30830000
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 06dd9ece 00000090
!	Mem[0000000010141400] = 00000000, %l2 = 00000000007f0000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%f4  = ff000000, Mem[0000000030181410] = 85788bff
	sta	%f4 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000
!	%l6 = 0000000000000000, %l0 = 00000000000003d1, %l1 = 00000000000000ef
	addc	%l6,%l0,%l1		! %l1 = 00000000000003d1
!	Mem[0000000010001408] = efeef291, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 000000ef000000ff
	membar	#Sync			! Added by membar checker (9)
!	%l4 = 00000000007f0000, Mem[0000000030041400] = ff000000
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000007f0000, Mem[0000000030081408] = ffffffff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 007f0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000007f, %l6 = 0000000000000000
	lduw	[%i0+%o5],%l6		! %l6 = 000000000000007f

p0_label_73:
!	Mem[0000000010081408] = ff000000, %l1 = 00000000000003d1
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001414] = 000000ff, %l6 = 000000000000007f
	lduwa	[%i0+0x014]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l5 = 00000000007f0000
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ffbb9ea8, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffbb9ea8
!	Mem[0000000010101410] = 000000ef, %l7 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000 98aeb94b, %l2 = 000000ef, %l3 = 00000020
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000098aeb94b
!	%l4 = 00000000007f0000, %l1 = ffffffffffffff00, %l1 = ffffffffffffff00
	sdivx	%l4,%l1,%l1		! %l1 = ffffffffffff8100
!	Mem[00000000100c1404] = c82f0b2f, %l2 = 0000000000000000
	ldsw	[%i3+0x004],%l2		! %l2 = ffffffffc82f0b2f
!	Mem[0000000030001400] = 00000000, %l3 = 0000000098aeb94b
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000007f0000, Mem[0000000010081400] = 467c0000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 007f0000

p0_label_74:
!	Mem[0000000030081410] = b54e46ff, %l1 = ffffffffffff8100
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000b54e46ff
!	%l0 = 00000000000003d1, Mem[0000000030081408] = 007f0000
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000003d1
!	%l0 = 000003d1, %l1 = b54e46ff, Mem[0000000030101400] = fffff0c5 623a7bad
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000003d1 b54e46ff
!	%f0  = ffbb9ea8 00000000, Mem[0000000010141410] = 000000ad 9f23bd26
	stda	%f0 ,[%i5+%o5]0x88	! Mem[0000000010141410] = ffbb9ea8 00000000
!	%l4 = 00000000007f0000, Mem[0000000010101410] = 000000ef00000000
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000007f0000
!	%f22 = c6008344, Mem[0000000010081400] = 007f0000
	sta	%f22,[%i2+0x000]%asi	! Mem[0000000010081400] = c6008344
!	Mem[0000000010141434] = 8e44d4f3, %l5 = ffffffffffbb9ea8, %asi = 80
	swapa	[%i5+0x034]%asi,%l5	! %l5 = 000000008e44d4f3
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = c6008344, %l4 = 00000000007f0000
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000c6
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00007f00, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_75:
!	Mem[0000000010001400] = 000000ff 555f4eb5 ffeef291 f4000000
!	Mem[0000000010001410] = 0000007f 000000ff 007252fe a89ebb99
!	Mem[0000000010001420] = 1200ef00 99bb9ea8 efeef291 60f6886d
!	Mem[0000000010001430] = 000000ad 32ecdbd3 0000007f 45dac62e
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[00000000100c1408] = 0000007f, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 000000000000007f
!	Mem[0000000010181400] = 000000ef, %l5 = 000000008e44d4f3
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ef
!	Mem[00000000300c1410] = 30838078, %l0 = 00000000000003d1
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 0000000030838078
!	Mem[0000000030081408] = 000003d1, %f10 = db7fffff
	lda	[%i2+%o4]0x89,%f10	! %f10 = 000003d1
!	Mem[0000000010081408] = 000000ff, %l5 = 00000000000000ef
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001430] = 000000ad, %l6 = 00000000000000ff
	ldsb	[%i0+0x030],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081400] = c600834499bb9ea8, %l1 = 00000000b54e46ff
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = c600834499bb9ea8
!	Mem[00000000201c0000] = 00ff9a5f, %l0 = 0000000030838078
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = a89e2df9, %f2  = a89e2df9
	fsqrts	%f2 ,%f2 		! %f2  = 7fffffff

p0_label_76:
!	%f0  = ffbb9ea8 00000000, Mem[0000000030101400] = d1030000 ff464eb5
	stda	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ffbb9ea8 00000000
!	%f4  = ff000000 ffffffff, Mem[0000000030101410] = ffffffff ff000000
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 ffffffff
!	Mem[0000000030041410] = ff000000, %l1 = c600834499bb9ea8
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%f12 = 2b7d3ec8 99bb9ea8, Mem[0000000030141408] = ff000000 99bb9ea8
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = 2b7d3ec8 99bb9ea8
!	%f12 = 2b7d3ec8 99bb9ea8, Mem[0000000030141408] = 2b7d3ec8 99bb9ea8
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = 2b7d3ec8 99bb9ea8
!	%f0  = ffbb9ea8, Mem[0000000030101400] = 00000000
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ffbb9ea8
!	%l3 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000030141410] = 30830000, %l5 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 00000030000000ff
!	%l7 = 000000000000007f, Mem[0000000010041408] = b0757635ce9eddff
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000007f
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff830000, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_77:
!	Mem[00000000211c0000] = 00ffb6f7, %l4 = 00000000000000c6
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181408] = fff2554906d7b075, %l0 = ffffffffffffffff
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = fff2554906d7b075
!	Mem[0000000010181408] = 94ffc600, %l7 = 000000000000007f
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 000000000000c600
!	Mem[00000000201c0000] = 00ff9a5f, %l0 = fff2554906d7b075
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 78808330, %l2 = ffffffffc82f0b2f
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 0000000078808330
!	Mem[0000000010081400] = a89ebb99448300c6, %f2  = 7fffffff 90000000
	ldda	[%i2+%g0]0x88,%f2 	! %f2  = a89ebb99 448300c6
!	Mem[0000000030081410] = 0081ffff00000000, %l6 = ffffffffffffffff
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 0081ffff00000000
!	Mem[0000000010181408] = 94ffc600, %l4 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffff94ffc600
!	Mem[00000000201c0000] = 00ff9a5f, %l4 = ffffffff94ffc600
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_9:
!	%l0 = ffffffffffffffff
	setx	0x2a1a07e8683bc60a,%g7,%l0 ! %l0 = 2a1a07e8683bc60a
!	%l1 = 00000000000000ff
	setx	0x9ca7756ff2369fe0,%g7,%l1 ! %l1 = 9ca7756ff2369fe0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a1a07e8683bc60a
	setx	0x9cc9f7b000f7b04e,%g7,%l0 ! %l0 = 9cc9f7b000f7b04e
!	%l1 = 9ca7756ff2369fe0
	setx	0x3e48465841ee871c,%g7,%l1 ! %l1 = 3e48465841ee871c

p0_label_78:
!	%l2 = 78808330, %l3 = 00000000, Mem[0000000010101428] = 000000ff 2e79d972
	stda	%l2,[%i4+0x028]%asi	! Mem[0000000010101428] = 78808330 00000000
!	%l4 = 000000ff, %l5 = 00000030, Mem[0000000030001410] = 90ffffff 007f0000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000030
!	%f27 = 91f2eeef, Mem[0000000010041400] = ffbb9ea8
	sta	%f27,[%i1+%g0]0x80	! Mem[0000000010041400] = 91f2eeef
!	%l5 = 0000000000000030, Mem[0000000010141410] = 00000000a89ebbff
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000030
!	%f2  = a89ebb99, %f0  = ffbb9ea8, %f18 = 000000f4
	fadds	%f2 ,%f0 ,%f18		! %f18 = fffb9ea8
!	%f10 = 000003d1, Mem[0000000010101400] = a6f69fff
	sta	%f10,[%i4+%g0]0x88	! Mem[0000000010101400] = 000003d1
!	Mem[0000000010141408] = ff000000, %l2 = 0000000078808330
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%f0  = ffbb9ea8 00000000 a89ebb99 448300c6
!	%f4  = ff000000 ffffffff b6662aa7 8e4407a0
!	%f8  = 06dd9ece 00000090 000003d1 00000012
!	%f12 = 2b7d3ec8 99bb9ea8 c9b591df 6288d4f3
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[000000001014141c] = 448300c6, %l2 = ff000000, %l1 = 41ee871c
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000448300c6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = efeef291, %l6 = 0081ffff00000000
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = fffffffffffff291

p0_label_79:
!	Mem[0000000010081430] = f7596ac7, %l5 = 0000000000000030
	ldswa	[%i2+0x030]%asi,%l5	! %l5 = fffffffff7596ac7
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010181400] = ffbb9ea8, %l6 = fffffffffffff291
	ldswa	[%i6+%g0]0x80,%l6	! %l6 = ffffffffffbb9ea8
!	Mem[0000000020800040] = 00ff978a, %l6 = ffffffffffbb9ea8
	lduh	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181400] = ffbb9ea8, %l0 = 9cc9f7b000f7b04e
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffbb9ea8
!	Mem[0000000010001408] = ffeef291, %l0 = ffffffffffbb9ea8
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = d1030000, %l7 = 000000000000c600
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000d1030000
!	Mem[00000000100c1400] = ffc10000, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ffc1
!	Mem[00000000211c0000] = 00ffb6f7, %l5 = fffffffff7596ac7
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 90000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000090
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101400] = ffbb9ea8ffbb9ea8
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000

p0_label_80:
!	%l4 = 0000ffc1, %l5 = 00000090, Mem[00000000100c1400] = 0000c1ff 2f0b2fc8
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ffc1 00000090
!	%l5 = 0000000000000090, Mem[00000000211c0000] = 00ffb6f7, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 90ffb6f7
!	%l5 = 0000000000000090, %l3 = 0000000000000000, %l6  = 00000000000000ff
	mulx	%l5,%l3,%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = 1b569ea8, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000001b000000ff
!	%l1 = 00000000448300c6, Mem[00000000100c1400] = 0000ffc1
	stwa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 448300c6
!	%f4  = ff000000 ffffffff, Mem[00000000100c1410] = ff000000 99bb9ea8
	stda	%f4 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 ffffffff
!	Mem[00000000100c1410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 448300c6, %l0 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000c6000000ff
!	Mem[00000000300c1410] = 30838078, %l1 = 00000000448300c6
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 00000030000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = c9b52aa7, %l7 = 00000000d1030000
	ldswa	[%i5+0x030]%asi,%l7	! %l7 = ffffffffc9b52aa7

p0_label_81:
!	Mem[0000000010101400] = d1030000, %f4  = ff000000
	lda	[%i4+0x000]%asi,%f4 	! %f4 = d1030000
!	Mem[0000000010141420] = c5f0ffff, %l4 = 000000000000ffc1
	ldsh	[%i5+0x020],%l4		! %l4 = ffffffffffffc5f0
!	Mem[0000000010041400] = efeef291, %l7 = ffffffffc9b52aa7
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = fffffffffffff291
!	Mem[0000000010081410] = fff2554990365e48, %f8  = 06dd9ece 00000090
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = fff25549 90365e48
!	Mem[0000000010101408] = 120000ff, %l5 = 0000000000000090
	lduha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 007f0000, %l2 = 00000000ff000000
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800080] = 9022fa8a, %l5 = 00000000000000ff
	ldub	[%o3+0x081],%l5		! %l5 = 0000000000000022
!	Mem[00000000100c1410] = 00000000, %l6 = 000000000000001b
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001438] = 0000007f, %l1 = 0000000000000030
	ldsha	[%i0+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = fff25549, %f16 = b54e5f55
	fcmpes	%fcc2,%f8 ,%f16		! %fcc2 = 3

p0_label_82:
!	%l0 = 000000c6, %l1 = 00000000, Mem[0000000030141410] = 000083ff 25000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000c6 00000000
!	%l3 = 00000000000000ff, %l1 = 0000000000000000, %l3 = 00000000000000ff
	and	%l3,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000021800081] = 9022fa8a, %l3 = 0000000000000000
	ldstuba	[%o3+0x081]%asi,%l3	! %l3 = 00000022000000ff
!	%l0 = 00000000000000c6, Mem[00000000100c1410] = 00000000
	stwa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000c6
!	%l0 = 00000000000000c6, Mem[0000000010041410] = ffbb9ea8
	sth	%l0,[%i1+%o5]		! Mem[0000000010041410] = 00c69ea8
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 90ffb6f7
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 0000b6f7
!	%f8  = fff25549 90365e48, Mem[0000000010101400] = 000003d1 207fff00
	stda	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = fff25549 90365e48
!	%l6 = 0000000000000000, imm = 00000000000003d3, %l6 = 0000000000000000
	sub	%l6,0x3d3,%l6		! %l6 = fffffffffffffc2d
!	%f12 = 2b7d3ec8 99bb9ea8, %l5 = 0000000000000022
!	Mem[0000000030041430] = f3d48862df91b5c9
	add	%i1,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_S ! Mem[0000000030041430] = f3d43e62df919ec9
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000c6, %l4 = ffffffffffffc5f0
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = ffffffffffffffc6

p0_label_83:
!	Mem[00000000201c0000] = 00ff9a5f, %l2 = 0000000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 91f2eeef 99bb9ea8, %l2 = 000000ff, %l3 = 00000022
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 0000000091f2eeef 0000000099bb9ea8
!	Mem[0000000010081424] = 6ba14678, %l3 = 0000000099bb9ea8
	ldsh	[%i2+0x026],%l3		! %l3 = 0000000000004678
!	Mem[0000000010001410] = 0000007f, %l2 = 0000000091f2eeef
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = 000000000000007f
!	Mem[000000001000140c] = f4000000, %f18 = fffb9ea8
	lda	[%i0+0x00c]%asi,%f18	! %f18 = f4000000
!	Mem[0000000010041410] = a89ec600, %l5 = 0000000000000022
	lduba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = f7596ac7, %f14 = c9b591df
	lda	[%i1+%o4]0x81,%f14	! %f14 = f7596ac7
!	Mem[00000000100c143c] = ff560cd5, %l5 = 0000000000000000
	ldsha	[%i3+0x03e]%asi,%l5	! %l5 = 0000000000000cd5
!	Mem[0000000030001400] = 0000000099bb9ea8, %l5 = 0000000000000cd5
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = 0000000099bb9ea8
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 99bb9ea8, %l6 = fffffffffffffc2d
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000a8000000ff

p0_label_84:
!	%f0  = ffbb9ea8 00000000 a89ebb99 448300c6
!	%f4  = d1030000 ffffffff b6662aa7 8e4407a0
!	%f8  = fff25549 90365e48 000003d1 00000012
!	%f12 = 2b7d3ec8 99bb9ea8 f7596ac7 6288d4f3
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l3 = 0000000000004678, Mem[0000000030001408] = a89e2df9
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 46782df9
!	Mem[000000001008141b] = 919fd6c4, %l4 = ffffffffffffffc6
	ldstub	[%i2+0x01b],%l4		! %l4 = 000000c4000000ff
!	%l3 = 0000000000004678, Mem[0000000030041410] = 000000ff
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00004678
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1408] = 99bb9ea8, %l2 = 000000000000007f
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000099bb9ea8
!	Mem[0000000021800040] = 821bf914, %l6 = 00000000000000a8
	ldstuba	[%o3+0x040]%asi,%l6	! %l6 = 00000082000000ff
!	Mem[000000001000141b] = 007252fe, %l3 = 0000000000004678
	ldstuba	[%i0+0x01b]%asi,%l3	! %l3 = 000000fe000000ff
!	%l1 = 0000000000000000, Mem[0000000010081400] = 448300ff
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 44830000
!	%f4  = d1030000 ffffffff, Mem[0000000010141430] = c9b52aa7 ffbb9ea8
	std	%f4 ,[%i5+0x030]	! Mem[0000000010141430] = d1030000 ffffffff
!	Starting 10 instruction Load Burst
!	%l0 = 00000000000000c6, immd = fffffffffffffe38, %l1  = 0000000000000000
	mulx	%l0,-0x1c8,%l1		! %l1 = fffffffffffe9f50

p0_label_85:
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000000000c6
	setx	0xd87bedefd7974d0e,%g7,%l0 ! %l0 = d87bedefd7974d0e
!	%l1 = fffffffffffe9f50
	setx	0x0fcf30d00d0c4c1c,%g7,%l1 ! %l1 = 0fcf30d00d0c4c1c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d87bedefd7974d0e
	setx	0xfacce377a9dc285e,%g7,%l0 ! %l0 = facce377a9dc285e
!	%l1 = 0fcf30d00d0c4c1c
	setx	0x3dab389f81f4f091,%g7,%l1 ! %l1 = 3dab389f81f4f091
!	Mem[000000001014140c] = ffffffff, %l0 = facce377a9dc285e
	lduw	[%i5+0x00c],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000030141410] = c6000000, %l2 = 0000000099bb9ea8
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000c6
!	Mem[0000000010001408] = ffeef291, %f27 = 91f2eeef
	lda	[%i0+%o4]0x80,%f27	! %f27 = ffeef291
!	Mem[0000000010041408] = 00000000 0000007f, %l0 = ffffffff, %l1 = 81f4f091
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 000000000000007f 0000000000000000
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000082
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041414] = 00000012, %f29 = ad000000
	ld	[%i1+0x014],%f29	! %f29 = 00000012
!	%l4 = 00000000000000c4, %l5 = 0000000099bb9ea8, %l2 = 00000000000000c6
	udivx	%l4,%l5,%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081408] = 000003d1
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000

p0_label_86:
!	%f22 = 99bb9ea8 fe527200, Mem[00000000300c1408] = 50ea83f4 7b5ae341
	stda	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 99bb9ea8 fe527200
!	%l6 = 00000000, %l7 = fffff291, Mem[0000000030001410] = ff000000 30000000
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 fffff291
!	%l0 = 0000007f, %l1 = 00000000, Mem[0000000030141410] = 000000c6 00000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000007f 00000000
!	%l3 = 00000000000000fe, Mem[00000000211c0000] = 0000b6f7, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = fe00b6f7
!	%l7 = fffffffffffff291, Mem[00000000300c1408] = fe527200
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = fe52f291
!	Mem[0000000030041408] = c76a59f7, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000c76a59f7
!	%f12 = 2b7d3ec8 99bb9ea8, Mem[0000000030001408] = f92d7846 30832aa7
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = 2b7d3ec8 99bb9ea8
!	%f26 = 6d88f660, Mem[00000000300c1400] = 00000090
	sta	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 6d88f660
!	Mem[0000000030181408] = fff25549, %l0 = 000000000000007f
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 00000000fff25549
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030141400] = ff569ea8 99bb9ea8 2b7d3ec8 99bb9ea8
!	Mem[0000000030141410] = 7f000000 00000000 4bb9ae98 25788b7f
!	Mem[0000000030141420] = 06dd9ece 00000090 ad7b3a62 00000012
!	Mem[0000000030141430] = 2b7d3ec8 99bb9ea8 c9b591df 6288d4f3
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400

p0_label_87:
!	Mem[00000000100c1400] = ffbb9ea8, %l4 = 00000000000000c4
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ffbb
!	Mem[0000000030041410] = 00004678, %l0 = 00000000fff25549
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 0000000000004678
!	Mem[0000000030181410] = 00000000, %l7 = fffffffffffff291
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = 00ff978a, %l6 = 0000000000000000
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = ffffffffffffffff
!	%l5 = 0000000099bb9ea8, immd = 0000000000000283, %l2 = 00000000c76a59f7
	udivx	%l5,0x283,%l2		! %l2 = 00000000003d34cc
!	Mem[00000000218000c0] = 0dff635c, %l0 = 0000000000004678
	ldsh	[%o3+0x0c0],%l0		! %l0 = 0000000000000dff
!	Mem[0000000030181408] = 7f000000, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800140] = ff86154d, %l7 = 0000000000000000
	ldsba	[%o3+0x140]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = ff000012 45daff2e, %l0 = 00000dff, %l1 = 00000000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff000012 0000000045daff2e
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (13)
!	%f31 = 7f000000, Mem[0000000030141400] = ff569ea8
	sta	%f31,[%i5+%g0]0x81	! Mem[0000000030141400] = 7f000000

p0_label_88:
!	%f26 = 6d88f660, Mem[0000000010141410] = 00000000
	sta	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 6d88f660
!	%l7 = ffffffffffffffff, Mem[0000000010141418] = 919fd6c4448300c6, %asi = 80
	stxa	%l7,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffffffffffffff
!	Mem[0000000010181428] = 000003d100000012, %l7 = ffffffffffffffff, %l4 = 000000000000ffbb
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 000003d100000012
!	Mem[0000000010081414] = 4955f2ff, %l6 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x014]%asi,%l6	! %l6 = 000000004955f2ff
!	%l6 = 000000004955f2ff, Mem[0000000010141408] = 78808330
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 4955f2ff
!	Mem[00000000100c143c] = 6288d4f3, %l6 = 000000004955f2ff, %asi = 80
	swapa	[%i3+0x03c]%asi,%l6	! %l6 = 000000006288d4f3
!	%l3 = 00000000000000fe, Mem[00000000100c142e] = 00000012
	sth	%l3,[%i3+0x02e]		! Mem[00000000100c142c] = 000000fe
!	%l4 = 000003d100000012, Mem[000000001010142e] = 00000000
	sth	%l4,[%i4+0x02e]		! Mem[000000001010142c] = 00000012
!	Mem[0000000030041410] = 78460000, %l4 = 000003d100000012
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000078000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000007f, %l5 = 0000000099bb9ea8
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 000000000000007f

p0_label_89:
!	Mem[0000000010001408] = ffeef291f4000000, %l6 = 000000006288d4f3
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = ffeef291f4000000
!	%l7 = ffffffffffffffff, imm = 0000000000000801, %l6 = ffeef291f4000000
	add	%l7,0x801,%l6		! %l6 = 0000000000000800
!	Mem[0000000010141410] = 60f6886d, %l6 = 0000000000000800
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000060f6886d
!	Mem[000000001018142c] = 00000012, %l2 = 00000000003d34cc
	ldsha	[%i6+0x02e]%asi,%l2	! %l2 = 0000000000000012
!	Mem[0000000010181408] = 99bb9eff, %l3 = 00000000000000fe
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 90365e48, %l4 = 0000000000000078
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = ffffffff90365e48
!	Mem[0000000010001400] = ff000000, %f4  = 00000000
	lda	[%i0+%g0]0x88,%f4 	! %f4 = ff000000
!	Mem[0000000010181408] = ff9ebb99 448300c6, %l2 = 00000012, %l3 = ffffffff
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff9ebb99 00000000448300c6
!	Mem[00000000300c1408] = 91f252fe, %l1 = 0000000045daff2e
	ldsba	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffff91
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff91, %l3 = 00000000448300c6, %l0 = 00000000ff000012
	udivx	%l1,%l3,%l0		! %l0 = 00000003bc90ecfb

p0_label_90:
!	Mem[0000000010101400] = 485e3690, %l1 = ffffffffffffff91
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 00000048000000ff
!	%l5 = 000000000000007f, %l7 = ffffffffffffffff, %l5 = 000000000000007f
	udivx	%l5,%l7,%l5		! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000048
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 7f000000, %l2 = 00000000ff9ebb99
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 000000007f000000
!	%l3 = 00000000448300c6, Mem[0000000030081408] = 00000000
	stba	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000c6
!	%l1 = 0000000000000000, Mem[00000000300c1408] = fe52f291
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = fe52f200
!	%l6 = 0000000060f6886d, Mem[0000000030101410] = ffffffff
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 60f6886d
!	Mem[0000000010041408] = 7f000000, %l0 = 00000003bc90ecfb
	swap	[%i1+%o4],%l0		! %l0 = 000000007f000000
!	%f26 = 6d88f660 ffeef291, Mem[00000000100c1400] = a89ebbff 00000000
	stda	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = 6d88f660 ffeef291
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff 555f4eb5, %l0 = 7f000000, %l1 = 00000000
	ldda	[%i0+0x000]%asi,%l0	! %l0 = 00000000000000ff 00000000555f4eb5

p0_label_91:
!	Mem[0000000030101408] = ad7b3a6200000012, %f6  = 7f8b7825 98aeb94b
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = ad7b3a62 00000012
!	Mem[0000000010101408] = 2effda45 120000ff, %l6 = 60f6886d, %l7 = ffffffff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000120000ff 000000002effda45
!	Mem[0000000030041400] = ff000000, %l2 = 000000007f000000
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 000003d1, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 00000000000003d1
!	Mem[0000000010041400] = 91f2eeef99bb9ea8, %f16 = b54e5f55 ff000000
	ldda	[%i1+%g0]0x80,%f16	! %f16 = 91f2eeef 99bb9ea8
!	Mem[0000000010081408] = 000000ff, %l1 = 00000000555f4eb5
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = 120000ff, %l6 = 00000000120000ff
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 00000000120000ff
!	Mem[000000001008143c] = f92dc578, %l3 = 00000000448300c6
	ldswa	[%i2+0x03c]%asi,%l3	! %l3 = fffffffff92dc578
!	Mem[00000000211c0000] = fe00b6f7, %l0 = 00000000000000ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000fe00
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000fe00, Mem[0000000010181420] = 06dd9ece
	sth	%l0,[%i6+0x020]		! Mem[0000000010181420] = fe009ece

p0_label_92:
!	%f0  = a89ebb99, Mem[0000000010141410] = 6d88f660
	st	%f0 ,[%i5+%o5]		! Mem[0000000010141410] = a89ebb99
!	%l5 = 0000000000000000, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030141408] = 2b7d3ec8
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[000000001008140c] = c76a59f7, %l7 = 000000002effda45
	swap	[%i2+0x00c],%l7		! %l7 = 00000000c76a59f7
!	%l0 = 000000000000fe00, Mem[0000000030041408] = 00000000
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000fe00
!	%l5 = 0000000000000000, Mem[0000000030181408] = 7f000000
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 7f000000
!	Mem[0000000010101428] = 7880833000000012, %l0 = 000000000000fe00, %l1 = ffffffffffffffff
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 7880833000000012
!	Mem[0000000010101408] = 120000ff, %l1 = 7880833000000012
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	%l2 = 00000000000003d1, Mem[0000000030181410] = 00000048
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 000003d1
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff838078 9f121584, %l0 = 0000fe00, %l1 = 000000ff
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff838078 000000009f121584

p0_label_93:
!	Mem[0000000030181410] = d103000098aeb94b, %f26 = 6d88f660 ffeef291
	ldda	[%i6+%o5]0x81,%f26	! %f26 = d1030000 98aeb94b
!	Mem[0000000030141400] = ff9ebb99, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000ff9e
!	Mem[00000000100c1410] = d1030000ffffffff, %f18 = f4000000 91f2eeff
	ldd	[%i3+%o5],%f18		! %f18 = d1030000 ffffffff
!	Mem[0000000010181428] = 000003d1 00000012, %l4 = 90365e48, %l5 = 0000ff9e
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 00000000000003d1 0000000000000012
!	Mem[0000000010141400] = 00007f0000000025, %f14 = f3d48862 df91b5c9
	ldda	[%i5+%g0]0x80,%f14	! %f14 = 00007f00 00000025
!	Mem[00000000100c1410] = d1030000 ffffffff, %l0 = ff838078, %l1 = 9f121584
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000d1030000 00000000ffffffff
!	Mem[0000000010081438] = 050f1212, %l0 = 00000000d1030000
	ldsh	[%i2+0x038],%l0		! %l0 = 000000000000050f
!	Mem[0000000010101404] = 4955f2ff, %l0 = 000000000000050f
	lduwa	[%i4+0x004]%asi,%l0	! %l0 = 000000004955f2ff
!	%f22 = 99bb9ea8 fe527200, %l0 = 000000004955f2ff
!	Mem[0000000030001420] = 1200000099bb9ea8
	add	%i0,0x020,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_S ! Mem[0000000030001420] = 99bb9ea8fe527200
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00008344, %l4 = 00000000000003d1
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000008344

p0_label_94:
!	%l3 = fffffffff92dc578, Mem[0000000010041400] = 91f2eeef
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 78f2eeef
!	Mem[0000000030141410] = 0000007f, %l5 = 0000000000000012
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 0000007f000000ff
!	%f22 = 99bb9ea8, %f29 = 00000012
	fsqrts	%f22,%f29		! %f29 = 7fffffff
!	%f16 = 91f2eeef 99bb9ea8 d1030000 ffffffff
!	%f20 = ff000000 7f000000 99bb9ea8 fe527200
!	%f24 = a89ebb99 00ef0012 d1030000 98aeb94b
!	%f28 = d3dbec32 7fffffff 2ec6da45 7f000000
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l4 = 0000000000008344, Mem[0000000030141410] = 000000ff
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00008344
!	Mem[0000000010141410] = a89ebb99, %l0 = 000000004955f2ff
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000a89ebb99
!	%f12 = a89ebb99 c83e7d2b, %l0 = 00000000a89ebb99
!	Mem[0000000030141430] = 2b7d3ec899bb9ea8
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141430] = 2b7d3ec899bb9ea8
!	%l2 = 00000000000003d1, Mem[0000000010081410] = 485e3690
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000003d1
!	Mem[00000000100c1408] = 7f000000, %l4 = 0000000000008344
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 0000007f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff460000, %l7 = 00000000c76a59f7
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffff460000

p0_label_95:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030001408] = ffffffff 000003d1, %l6 = 120000ff, %l7 = ff460000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000000003d1
!	Mem[0000000010041410] = a89ec600, %f31 = 7f000000
	lda	[%i1+%o5]0x88,%f31	! %f31 = a89ec600
!	Mem[0000000030041410] = 000046ff, %l7 = 00000000000003d1
	ldsba	[%i1+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	%l4 = 000000000000007f, %l1 = 00000000ffffffff, %l7 = ffffffffffffffff
	andn	%l4,%l1,%l7		! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000 ffff8100, %l4 = 0000007f, %l5 = 0000007f
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ffff8100 0000000000000000
!	Mem[0000000010101410] = 00007f0000000000, %f2  = a89ebb99 c83e7d2b
	ldda	[%i4+%o5]0x88,%f2 	! %f2  = 00007f00 00000000
!	%l4 = 00000000ffff8100, imm = 00000000000008cf, %l7 = 0000000000000000
	andn	%l4,0x8cf,%l7		! %l7 = 00000000ffff8100
!	Mem[0000000010081410] = 000003d1 ffffffff, %l4 = ffff8100, %l5 = 00000000
	ldda	[%i2+0x010]%asi,%l4	! %l4 = 00000000000003d1 00000000ffffffff
!	%f24 = a89ebb99, %f18 = d1030000, %f21 = 7f000000
	fmuls	%f24,%f18,%f21		! %f21 = 3a2273ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l2 = 00000000000003d1
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_96:
!	Mem[0000000010181404] = 00000000, %l3 = f92dc578, %l3 = f92dc578
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 78f2eeef, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000078f2eeef
!	%l2 = 0000000078f2eeef, Mem[00000000211c0000] = fe00b6f7, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = eeefb6f7
!	Mem[0000000010041410] = a89ec600, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081428] = b6662aa7, %l0 = 00000000a89ebb99, %asi = 80
	swapa	[%i2+0x028]%asi,%l0	! %l0 = 00000000b6662aa7
!	%l1 = 00000000ffffffff, Mem[0000000020800000] = ffce8691, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = ffff8691
!	Mem[0000000010081408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 99bb9eff, %l4 = 00000000000003d1
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 0000000099bb9eff
!	Mem[0000000030141410] = 44830000, %l5 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 00000044000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l2 = 0000000078f2eeef
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_97:
!	Mem[0000000010141430] = d1030000, %l1 = 00000000ffffffff
	lduha	[%i5+0x030]%asi,%l1	! %l1 = 000000000000d103
!	Mem[00000000300c1410] = 788083ff, %l0 = 00000000b6662aa7
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 00000000788083ff
!	Mem[0000000010081410] = 000003d1, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000000003d1
!	%l3 = 00000000000000ff, imm = fffffffffffff40b, %l1 = 000000000000d103
	subc	%l3,-0xbf5,%l1		! %l1 = 0000000000000cf4
!	Mem[0000000010101408] = ff000012, %l5 = 0000000000000044
	ldsw	[%i4+%o4],%l5		! %l5 = ffffffffff000012
!	Mem[0000000030181408] = 75b0d706 7f000000, %l4 = 99bb9eff, %l5 = ff000012
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 000000007f000000 0000000075b0d706
!	Mem[0000000030041410] = ff460000000000ad, %l1 = 0000000000000cf4
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ff460000000000ad
!	Mem[0000000030141410] = 000083ff, %l4 = 000000007f000000
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041408] = 00fe0000, %l7 = 00000000ffff8100
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000fe
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000fe, Mem[00000000100c1408] = ff000000448300c6
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000000000fe

p0_label_98:
!	%l5 = 0000000075b0d706, Mem[0000000010041400] = 0000000099bb9ea8
	stx	%l5,[%i1+%g0]		! Mem[0000000010041400] = 0000000075b0d706
!	%l0 = 788083ff, %l1 = 000000ad, Mem[0000000010181430] = 2b7d3ec8 99bb9ea8
	stda	%l0,[%i6+0x030]%asi	! Mem[0000000010181430] = 788083ff 000000ad
!	%f2  = 00007f00 00000000, Mem[0000000030141410] = 000083ff 00000000
	stda	%f2 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00007f00 00000000
!	Mem[0000000010181410] = 000000ff, %l0 = 00000000788083ff
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000075b0d706, Mem[0000000030101408] = 623a7bad
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 623ad706
!	Mem[0000000030181408] = 7f000000, %l7 = 00000000000000fe
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000000003d1, Mem[0000000010101410] = 00000000
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000003d1
!	Mem[0000000010141410] = 4955f2ff, %l5 = 0000000075b0d706
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000049000000ff
!	%l7 = 0000000000000000, Mem[00000000201c0000] = 00ff9a5f
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00009a5f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 7f000000, %l7 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_99:
!	Mem[0000000010101408] = 2effda45 120000ff, %l4 = ffffffff, %l5 = 00000049
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000120000ff 000000002effda45
!	Mem[0000000010081420] = 0f6fa18d6ba14678, %l7 = 0000000000000000
	ldx	[%i2+0x020],%l7		! %l7 = 0f6fa18d6ba14678
!	Mem[0000000010081400] = d1030000, %l0 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f22 = 99bb9ea8, %f30 = 2ec6da45 a89ec600
	fitod	%f22,%f30		! %f30 = c1d99118 56000000
!	Mem[00000000300c1400] = 60f6886d, %l5 = 000000002effda45
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = 00000000000060f6
!	Mem[0000000010181410] = ff838078, %l1 = ff460000000000ad
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = ffffffffff838078
!	Mem[0000000010001410] = 7f000000, %f5  = 0000007f
	lda	[%i0+%o5]0x88,%f5 	! %f5 = 7f000000
!	Mem[000000001008143c] = f92dc578, %l7 = 0f6fa18d6ba14678
	lduha	[%i2+0x03c]%asi,%l7	! %l7 = 000000000000f92d
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = d1030000, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_100:
!	%f16 = 91f2eeef 99bb9ea8, Mem[0000000030001410] = 7f000000 ff000000
	stda	%f16,[%i0+%o5]0x89	! Mem[0000000030001410] = 91f2eeef 99bb9ea8
!	Mem[0000000010041400] = 00000000, %l4 = 00000000120000ff
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l5 = 00000000000060f6, Mem[0000000010101400] = 90365eff
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 90365ef6
!	%l6 = 00000000, %l7 = 0000f92d, Mem[0000000030081408] = c6000000 25000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 0000f92d
!	%l1 = ffffffffff838078, Mem[0000000010041400] = 120000ff
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 780000ff
!	Mem[0000000010001400] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%f30 = c1d99118, Mem[0000000010181434] = 000000ad
	st	%f30,[%i6+0x034]	! Mem[0000000010181434] = c1d99118
!	%l2 = 00000000000003d1, Mem[0000000010181410] = 788083ff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 788083d1
!	%f15 = 00000025, %f6  = ad7b3a62, %f16 = 91f2eeef
	fmuls	%f15,%f6 ,%f16		! %f16 = 80000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 30000000 fff255ff, %l6 = 00000000, %l7 = 0000f92d
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000fff255ff 0000000030000000

p0_label_101:
!	Mem[0000000010041418] = ce40ce0f, %l5 = 00000000000060f6
	ldsha	[%i1+0x01a]%asi,%l5	! %l5 = ffffffffffffce0f
!	Mem[0000000030181410] = d1030000, %l0 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffd103
!	Mem[0000000030001410] = 99bb9ea8, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 0000000099bb9ea8
!	%f31 = 56000000, %f23 = fe527200
	fcmpes	%fcc3,%f31,%f23		! %fcc3 = 2
!	Mem[0000000030101410] = 60f6886d, %l2 = 00000000000003d1
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = 0000000060f6886d
!	Mem[0000000030081410] = 00000000 ffff8100, %l6 = fff255ff, %l7 = 30000000
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000ffff8100 0000000000000000
!	Mem[0000000010101424] = e837839c, %l1 = ffffffffff838078
	lduba	[%i4+0x026]%asi,%l1	! %l1 = 0000000000000083
!	Mem[0000000010041410] = ffc69ea8, %l5 = ffffffffffffce0f
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ffc69ea8
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010181400] = ffbb9ea8 00000000 ff9ebb99 448300c6
!	Mem[0000000010181410] = d1838078 ffffffff b6662aa7 8e4407a0
!	Mem[0000000010181420] = fe009ece 00000090 000003d1 00000012
!	Mem[0000000010181430] = 788083ff c1d99118 c9b591df 6288d4f3
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	%f26 = d1030000 98aeb94b, Mem[0000000010181400] = ffbb9ea8 00000000
	std	%f26,[%i6+%g0]	! Mem[0000000010181400] = d1030000 98aeb94b

p0_label_102:
!	Mem[0000000030081408] = 00000000, %l5 = 00000000ffc69ea8
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000083, Mem[0000000010101400] = 90365ef6
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 90365e83
!	%l5 = 0000000000000000, Mem[0000000010101400] = 90365e83
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 90365e00
!	Mem[0000000030101410] = 60f6886d, %l6 = 00000000ffff8100
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000060000000ff
!	Mem[0000000010081410] = 000003d1, %l2 = 0000000060f6886d
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000099bb9ea8, Mem[0000000010141400] = 25000000007f0000
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000099bb9ea8
!	Mem[0000000010041438] = 00000000, %l1 = 0000000000000083
	swap	[%i1+0x038],%l1		! %l1 = 0000000000000000
!	Mem[000000001018142d] = 00000012, %l2 = 0000000000000000
	ldstub	[%i6+0x02d],%l2		! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010141400] = 0000000099bb9ea8
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000003d1, %l4 = 0000000099bb9ea8
	lduba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000d1

p0_label_103:
!	%f13 = c1d99118, %f3  = 448300c6
	fcmpes	%fcc0,%f13,%f3 		! %fcc0 = 1
!	Mem[0000000030081408] = 000000ff, %f0  = ffbb9ea8
	lda	[%i2+%o4]0x89,%f0 	! %f0 = 000000ff
!	Mem[0000000010101408] = ff00001245daff2e, %f0  = 000000ff 00000000
	ldda	[%i4+%o4]0x80,%f0 	! %f0  = ff000012 45daff2e
!	Mem[0000000010101400] = 005e3690 4955f2ff, %l0 = ffffd103, %l1 = 00000000
	ldda	[%i4+0x000]%asi,%l0	! %l0 = 00000000005e3690 000000004955f2ff
!	Mem[0000000010181418] = b6662aa7 8e4407a0, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+0x018]%asi,%l2	! %l2 = 00000000b6662aa7 000000008e4407a0
!	Mem[0000000030001408] = d1030000ffffffff, %l6 = 0000000000000060
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = d1030000ffffffff
!	Mem[0000000030181410] = d103000098aeb94b, %l0 = 00000000005e3690
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = d103000098aeb94b
!	Mem[00000000100c1408] = 00000000, %l0 = d103000098aeb94b
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 6d88f6ff, %l4 = 00000000000000d1
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 000000000000f6ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 7f0000ff, %l6 = d1030000ffffffff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 000000007f0000ff

p0_label_104:
!	%l1 = 000000004955f2ff, Mem[0000000010081408] = 000000002effda45, %asi = 80
	stxa	%l1,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000004955f2ff
!	%f21 = 3a2273ff, Mem[0000000010181400] = d1030000
	sta	%f21,[%i6+%g0]0x80	! Mem[0000000010181400] = 3a2273ff
!	%f16 = 80000000 99bb9ea8, %l0 = 0000000000000000
!	Mem[0000000010101400] = 005e36904955f2ff
	stda	%f16,[%i4+%l0]ASI_PST8_PL ! Mem[0000000010101400] = 005e36904955f2ff
!	%l7 = 0000000000000000, Mem[00000000201c0000] = 00009a5f
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00009a5f
!	%f6  = b6662aa7 8e4407a0, Mem[0000000010141400] = 00000000 00000000
	stda	%f6 ,[%i5+%g0]0x88	! Mem[0000000010141400] = b6662aa7 8e4407a0
!	%f0  = ff000012 45daff2e, %l3 = 000000008e4407a0
!	Mem[0000000010001410] = 0000007f000000ff
	add	%i0,0x010,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_P ! Mem[0000000010001410] = 0000007f000000ff
!	%f8  = fe009ece 00000090, %l6 = 000000007f0000ff
!	Mem[0000000010181420] = fe009ece00000090
	add	%i6,0x020,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_P ! Mem[0000000010181420] = fe009ece00000090
!	Mem[00000000300c1400] = 60f6886d, %l3 = 000000008e4407a0
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000060000000ff
!	%f24 = a89ebb99 00ef0012, Mem[0000000010081410] = d10300ff ffffffff
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = a89ebb99 00ef0012
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 780000ff 75b0d706, %l2 = b6662aa7, %l3 = 00000060
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000780000ff 0000000075b0d706

p0_label_105:
!	Mem[0000000030041410] = ff460000000000ad, %f6  = b6662aa7 8e4407a0
	ldda	[%i1+%o5]0x81,%f6 	! %f6  = ff460000 000000ad
!	Mem[0000000010001400] = 000000ff, %l4 = 000000000000f6ff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 120000ff, %l3 = 0000000075b0d706
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 8e4407a0, %l0 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 00000000000007a0
!	Mem[00000000100c1420] = fff2554990365e48, %l4 = 0000000000000000
	ldx	[%i3+0x020],%l4		! %l4 = fff2554990365e48
!	Mem[0000000010001418] = 007252ff, %l0 = 00000000000007a0
	lduw	[%i0+0x018],%l0		! %l0 = 00000000007252ff
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000007252ff
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 000003d1, %l6 = 000000007f0000ff
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 00000000000003d1
!	Mem[0000000030141400] = d1030000, %l3 = ffffffffffffffff
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffd1
!	Starting 10 instruction Store Burst
!	%f28 = d3dbec32 7fffffff, Mem[0000000010001400] = ff000000 b54e5f55
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = d3dbec32 7fffffff

p0_label_106:
!	%f16 = 80000000 99bb9ea8 d1030000 ffffffff
!	%f20 = ff000000 3a2273ff 99bb9ea8 fe527200
!	%f24 = a89ebb99 00ef0012 d1030000 98aeb94b
!	%f28 = d3dbec32 7fffffff c1d99118 56000000
	stda	%f16,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%f4  = d1838078, Mem[0000000030181408] = ffffffff
	sta	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = d1838078
!	%l4 = 90365e48, %l5 = 00000000, Mem[00000000100c1408] = 00000000 fe000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 90365e48 00000000
!	Mem[0000000010041414] = 00000012, %l5 = 00000000, %l7 = 00000000
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000000000012
!	%l5 = 0000000000000000, Mem[0000000010001410] = ff0000007f000000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 90365e48, %l5 = 00000000, Mem[0000000030081408] = 000000ff 2df90000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 90365e48 00000000
!	Mem[0000000030041400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 99bb9ea8, %l6 = 00000000000003d1
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 000000a8000000ff
!	Mem[0000000030141400] = d1030000, %l3 = ffffffffffffffd1
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000d1030000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00fe0000, %f14 = c9b591df
	lda	[%i1+%o4]0x81,%f14	! %f14 = 00fe0000

p0_label_107:
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030101408] = d1030000, %l6 = 00000000000000a8
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000d1030000
!	Mem[00000000300c1400] = fff6886d, %l6 = 00000000d1030000
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = fffffffffff6886d
!	Mem[0000000030041400] = ff0000ff, %f3  = 448300c6
	lda	[%i1+%g0]0x89,%f3 	! %f3 = ff0000ff
!	Mem[0000000010141400] = 8e4407a0, %l1 = 000000004955f2ff
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 00000000000007a0
!	Mem[0000000010141408] = 4955f2ff, %f26 = d1030000
	lda	[%i5+%o4]0x80,%f26	! %f26 = 4955f2ff
!	Mem[0000000010101408] = ff000012, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010101408] = ff000012, %l1 = 00000000000007a0
	ldsba	[%i4+0x009]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 99bb9ea8, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 0000000099bb9ea8
!	Mem[0000000030041400] = ff0000ff, %l7 = 0000000000000012
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000012, %l1 = 0000000099bb9ea8
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 00000000ff000012

p0_label_108:
!	Mem[0000000010101408] = 99bb9ea8, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 0000000099bb9ea8
!	Mem[0000000010041403] = 780000ff, %l5 = 000000000000ff00
	ldstuba	[%i1+0x003]%asi,%l5	! %l5 = 000000ff000000ff
!	%l3 = 00000000d1030000, Mem[0000000020800040] = 00ff978a
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 0000978a
!	%f0  = ff000012 45daff2e, Mem[0000000030001408] = ffffffff d1030000
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000012 45daff2e
!	%f24 = a89ebb99 00ef0012, Mem[0000000030001400] = ff9ebb99 efeef291
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = a89ebb99 00ef0012
!	%f9  = 00000090, Mem[0000000010081424] = 6ba14678
	st	%f9 ,[%i2+0x024]	! Mem[0000000010081424] = 00000090
!	%l3 = 00000000d1030000, Mem[0000000021800040] = ff1bf914
	sth	%l3,[%o3+0x040]		! Mem[0000000021800040] = 0000f914
!	Mem[0000000030101410] = 000000ff, %l3 = 00000000d1030000
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081424] = 00000090, %l2 = 00000000780000ff, %asi = 80
	swapa	[%i2+0x024]%asi,%l2	! %l2 = 0000000000000090
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00009a5f, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000000

p0_label_109:
!	Mem[0000000030101410] = 000003d1, %f17 = 99bb9ea8
	lda	[%i4+%o5]0x81,%f17	! %f17 = 000003d1
!	%f3  = ff0000ff, %f2  = ff9ebb99
	fsqrts	%f3 ,%f2 		! %f2  = 7fffffff
!	Mem[0000000030001410] = 91f2eeef 99bb9ea8, %l4 = 90365e48, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000099bb9ea8 0000000091f2eeef
!	Mem[0000000010081408] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00fe0000, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000fe0000
!	Mem[0000000010081428] = a89ebb99, %l3 = 0000000000fe0000
	ldsw	[%i2+0x028],%l3		! %l3 = ffffffffa89ebb99
!	%f15 = 6288d4f3, %f30 = c1d99118, %f5  = ffffffff
	fdivs	%f15,%f30,%f5 		! %f5  = e02100d3
!	Mem[0000000010141408] = fff25549, %l6 = fffffffffff6886d
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000049
!	Mem[00000000100c1400] = 91f2eeff, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = ffffffff91f2eeff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 91f2eeff, %l3 = ffffffffa89ebb99
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000091000000ff

p0_label_110:
!	%f0  = ff000012, %f19 = ffffffff, %f18 = d1030000 ffffffff
	fsmuld	%f0 ,%f19,%f18		! %f18 = ffffffff e0000000
!	%f0  = ff000012 45daff2e, %l2 = 0000000000000090
!	Mem[0000000010181438] = c9b591df6288d4f3
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181438] = c9b591df6288d4f3
!	%l6 = 00000049, %l7 = 99bb9ea8, Mem[0000000010141400] = a007448e a72a66b6
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000049 99bb9ea8
!	%l1 = 00000000ff000012, Mem[0000000010141408] = 4955f2ff
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 1255f2ff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = ffffffff91f2eeff
	setx	0x96d189107ac47135,%g7,%l0 ! %l0 = 96d189107ac47135
!	%l1 = 00000000ff000012
	setx	0x49e74f287a192eea,%g7,%l1 ! %l1 = 49e74f287a192eea
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 96d189107ac47135
	setx	0x450bbe68336ab3a2,%g7,%l0 ! %l0 = 450bbe68336ab3a2
!	%l1 = 49e74f287a192eea
	setx	0x1ee8b7a831a32807,%g7,%l1 ! %l1 = 1ee8b7a831a32807
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 450bbe68336ab3a2
	setx	0xd163a320775ea511,%g7,%l0 ! %l0 = d163a320775ea511
!	%l1 = 1ee8b7a831a32807
	setx	0x13e4fbd0348671e9,%g7,%l1 ! %l1 = 13e4fbd0348671e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d163a320775ea511
	setx	0x9fef24c82501c2a9,%g7,%l0 ! %l0 = 9fef24c82501c2a9
!	%l1 = 13e4fbd0348671e9
	setx	0x20ddad1818f891e1,%g7,%l1 ! %l1 = 20ddad1818f891e1
!	%l3 = 0000000000000091, Mem[0000000010041400] = 780000ff
	stwa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000091
!	%f0  = ff000012 45daff2e, Mem[0000000030101410] = d1030000 ff73223a
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000012 45daff2e
!	%l2 = 0000000000000090, Mem[0000000010001402] = ffffff7f
	sth	%l2,[%i0+0x002]		! Mem[0000000010001400] = ffff0090
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = c9b591df6288d4f3, %f30 = c1d99118 56000000
	ldda	[%i6+0x038]%asi,%f30	! %f30 = c9b591df 6288d4f3

p0_label_111:
!	Mem[0000000010181408] = c600834499bb9eff, %f22 = 99bb9ea8 fe527200
	ldda	[%i6+%o4]0x88,%f22	! %f22 = c6008344 99bb9eff
!	Mem[0000000010001430] = 000000ad, %l6 = 0000000000000049
	lduh	[%i0+0x030],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101428] = 7880833000000012, %f10 = 000003d1 00000012
	ldd	[%i4+0x028],%f10	! %f10 = 78808330 00000012
!	Mem[0000000030001408] = 45daff2e, %l1 = 20ddad1818f891e1
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 0000000045daff2e
!	Mem[0000000010141400] = 00000049, %l2 = 0000000000000090
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 1200ef00, %l0 = 9fef24c82501c2a9
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 000000001200ef00
!	Mem[0000000010041408] = bc90ecfb 00000000, %l6 = 00000000, %l7 = 99bb9ea8
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000bc90ecfb 0000000000000000
!	Mem[0000000010001410] = 00000000 00000000, %l6 = bc90ecfb, %l7 = 00000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041400] = 0000009175b0d706, %f10 = 78808330 00000012
	ldda	[%i1+%g0]0x80,%f10	! %f10 = 00000091 75b0d706
!	Starting 10 instruction Store Burst
!	%l5 = 0000000091f2eeef, Mem[00000000300c1408] = fe52f200
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = fe52f2ef

p0_label_112:
!	%l2 = 00000000, %l3 = 00000091, Mem[0000000010041400] = 00000091 75b0d706
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000091
!	%l2 = 0000000000000000, Mem[0000000010101400] = 90365e00
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 90360000
!	%f8  = fe009ece 00000090, Mem[0000000010001408] = ffeef291 f4000000
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = fe009ece 00000090
!	%l4 = 99bb9ea8, %l5 = 91f2eeef, Mem[0000000010001400] = ffff0090 32ecdbd3
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 99bb9ea8 91f2eeef
!	Mem[0000000030181408] = d1838078, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000d1838078
!	Mem[0000000010001400] = a89ebb99, %l4 = 0000000099bb9ea8
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000099000000ff
!	%l3 = 0000000000000091, Mem[0000000030101408] = 000003d1
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000391
!	%l5 = 0000000091f2eeef, %l0 = 000000001200ef00, %l2 = 0000000000000000
	subc	%l5,%l0,%l2		! %l2 = 000000007ff1ffef
!	%l1 = 0000000045daff2e, Mem[0000000030141400] = ffffffd1
	stwa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 45daff2e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030141400] = 45daff2e 99bb9ea8 00000000 99bb9ea8
!	Mem[0000000030141410] = 00000000 007f0000 4bb9ae98 25788b7f
!	Mem[0000000030141420] = 06dd9ece 00000090 ad7b3a62 00000012
!	Mem[0000000030141430] = 2b7d3ec8 99bb9ea8 c9b591df 6288d4f3
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400

p0_label_113:
!	Mem[0000000010041404] = 00000091, %l2 = 000000007ff1ffef
	ldub	[%i1+0x006],%l2		! %l2 = 0000000000000000
!	%l2 = 0000000000000000, immd = 0000000000000c4a, %l6  = 00000000d1838078
	mulx	%l2,0xc4a,%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = 45daff2e, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 0000000045daff2e
!	Mem[0000000030181400] = 00000000, %l1 = 0000000045daff2e
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ff9ebb99, %l0 = 000000001200ef00
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 00000049 99bb9ea8 1255f2ff ffffffff
!	Mem[0000000010141410] = ff55f2ff 00000030 ffffffff ffffffff
!	Mem[0000000010141420] = c5f0ffff a72a66b6 b6662aa7 83f4c578
!	Mem[0000000010141430] = d1030000 ffffffff 050f1212 f92dc578
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010101410] = 000003d1, %l4 = 0000000000000099
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 00000000000003d1
!	Mem[0000000010141410] = fff255ff, %l1 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 00000000000055ff
!	Mem[00000000211c0000] = eeefb6f7, %l6 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000eeef
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 45daff2e, %l6 = 000000000000eeef
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000045daff2e

p0_label_114:
!	%f0  = a89ebb99 49000000 ffffffff fff25512
!	%f4  = 30000000 fff255ff ffffffff ffffffff
!	%f8  = b6662aa7 fffff0c5 78c5f483 a72a66b6
!	%f12 = ffffffff 000003d1 78c52df9 12120f05
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%f28 = d3dbec32, Mem[0000000010041410] = a89ec6ff
	sta	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = d3dbec32
!	%l4 = 00000000000003d1, Mem[0000000030081400] = 7f8b7825
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000003d1
!	%l0 = ffffffff, %l1 = 000055ff, Mem[0000000030181410] = d1030000 98aeb94b
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 000055ff
!	Mem[0000000010181400] = ff73223a, %l6 = 0000000045daff2e
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ff73223a
!	%l0 = ffffffff, %l1 = 000055ff, Mem[0000000030041408] = 0000fe00 ff000000
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff 000055ff
!	Mem[00000000300c1400] = fff6886d, %l7 = 0000000045daff2e
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000ff73223a, Mem[00000000218000c0] = 0dff635c, %asi = 80
	stha	%l6,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 223a635c
!	%l0 = ffffffffffffffff, Mem[0000000021800000] = 1b56d648
	sth	%l0,[%o3+%g0]		! Mem[0000000021800000] = ffffd648
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 1200ef00, %l6 = 00000000ff73223a
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000001200

p0_label_115:
!	Mem[0000000010141404] = 99bb9ea8, %l2 = 0000000000000000
	ldsb	[%i5+0x006],%l2		! %l2 = ffffffffffffff9e
!	Mem[000000001010140c] = 45daff2e, %l3 = 0000000000000091
	lduba	[%i4+0x00d]%asi,%l3	! %l3 = 00000000000000da
!	Mem[0000000010181420] = fe009ece, %l4 = 00000000000003d1
	ldub	[%i6+0x023],%l4		! %l4 = 00000000000000ce
!	Mem[000000001014142c] = 83f4c578, %l1 = 00000000000055ff
	ldub	[%i5+0x02d],%l1		! %l1 = 00000000000000f4
!	Mem[0000000030001400] = a89ebb99, %l1 = 00000000000000f4
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 000000000000a89e
!	Mem[0000000030081408] = 90365e48, %l2 = ffffffffffffff9e
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = ffffffff90365e48
!	Mem[0000000030101400] = 00000080, %l6 = 0000000000001200
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000080
!	Mem[0000000010101430] = 440ff950b49ed50d, %l4 = 00000000000000ce
	ldx	[%i4+0x030],%l4		! %l4 = 440ff950b49ed50d
!	Mem[0000000030141400] = efee0000, %l1 = 000000000000a89e
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 00000000efee0000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000080, Mem[0000000010081400] = d10300ff
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000080

p0_label_116:
!	Mem[0000000030101408] = 00000391, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000091000000ff
!	%f22 = c6008344 99bb9eff, Mem[00000000300c1400] = 6d88f6ff 06dd9ece
	stda	%f22,[%i3+%g0]0x89	! Mem[00000000300c1400] = c6008344 99bb9eff
	membar	#Sync			! Added by membar checker (19)
!	%f22 = c6008344 99bb9eff, Mem[0000000030141408] = 00000000 a89ebb99
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = c6008344 99bb9eff
!	Mem[0000000010041410] = d3dbec32, %l4 = 440ff950b49ed50d
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000d3dbec32
!	Mem[0000000030101410] = 2effda45, %l0 = 0000000000000091
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 000000002effda45
!	%l6 = 0000000000000080, Mem[00000000300c1400] = ff9ebb99
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0080bb99
!	Mem[0000000010141414] = 00000030, %l4 = 00000000d3dbec32
	swap	[%i5+0x014],%l4		! %l4 = 0000000000000030
!	Mem[0000000030081408] = 90365e48, %l2 = ffffffff90365e48
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 00000048000000ff
!	%l1 = 00000000efee0000, Mem[0000000010181410] = 788083d1
	stha	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 78800000
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 000000002effda45
	setx	0x803064b78e95d611,%g7,%l0 ! %l0 = 803064b78e95d611
!	%l1 = 00000000efee0000
	setx	0x9f328e784d285b7a,%g7,%l1 ! %l1 = 9f328e784d285b7a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 803064b78e95d611
	setx	0xdec83c38111d0bf5,%g7,%l0 ! %l0 = dec83c38111d0bf5
!	%l1 = 9f328e784d285b7a
	setx	0xfdb54297f6c5a493,%g7,%l1 ! %l1 = fdb54297f6c5a493

p0_label_117:
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000080
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800080] = 90fffa8a, %l0 = dec83c38111d0bf5
	ldsba	[%o3+0x080]%asi,%l0	! %l0 = ffffffffffffff90
!	Mem[0000000030101400] = 00000080, %l5 = 0000000091f2eeef
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000080
!	Mem[0000000030181410] = ffffffff, %l7 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010181400] = 4bb9ae9845daff2e, %f6  = ffffffff ffffffff
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = 4bb9ae98 45daff2e
!	Mem[00000000100c1410] = 000003d1, %l5 = 0000000000000080
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffffd1
!	Mem[00000000300c1408] = fe52f2ef, %l3 = 00000000000000da
	ldsha	[%i3+%o4]0x89,%l3	! %l3 = fffffffffffff2ef
!	Mem[0000000010141408] = fff25512, %l3 = fffffffffffff2ef
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000005512
!	Mem[0000000010081428] = a89ebb99, %l2 = 0000000000000048
	lduba	[%i2+0x029]%asi,%l2	! %l2 = 000000000000009e
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = eff252fe, %l3 = 0000000000005512
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 000000ef000000ff

p0_label_118:
!	Mem[0000000030041400] = ff0000ff, %l2 = 000000000000009e
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l0 = ffffffffffffff90, Mem[00000000211c0000] = eeefb6f7, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 90efb6f7
!	%l4 = 00000030, %l5 = ffffffd1, Mem[0000000030081410] = 0081ffff 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000030 ffffffd1
!	%l4 = 0000000000000030, Mem[0000000030041400] = ff0000ff00007c46
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000030
!	%f12 = ffffffff 000003d1, Mem[0000000010001410] = 30000000 fff255ff
	stda	%f12,[%i0+0x010]%asi	! Mem[0000000010001410] = ffffffff 000003d1
!	%l2 = 000000ff, %l3 = 000000ef, Mem[0000000010181410] = 00008078 ffffffff
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff 000000ef
!	Mem[00000000100c1400] = ffeef2ff, %l7 = 00000000ffffffff
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000ffeef2ff
!	Mem[00000000300c1400] = 0080bb99, %l1 = fdb54297f6c5a493
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 000000000080bb99
!	%l0 = ffffffffffffff90, Mem[0000000010141408] = 1255f2ffffffffff
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffffff90
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 80000000, %l5 = ffffffffffffffd1
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffff80

p0_label_119:
!	Mem[0000000010001400] = a89ebb99, %l0 = ffffffffffffff90
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 000000000000a89e
!	Mem[0000000030181400] = 00000000, %l3 = 00000000000000ef
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = bc90ecfb 00000000, %l0 = 0000a89e, %l1 = 0080bb99
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000bc90ecfb 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000030
	ldswa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l7 = 00000000ffeef2ff, %l6 = 0000000000000000, %y  = 00000000
	umul	%l7,%l6,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%f11 = a72a66b6, %f13 = 000003d1, %f26 = 4955f2ff 98aeb94b
	fsmuld	%f11,%f13,%f26		! %l0 = 00000000bc90ed1d, Unfinished, %fsr = 2c00000400
!	Mem[0000000010101400] = 000036904955f2ff, %f26 = 4955f2ff 98aeb94b
	ldda	[%i4+%g0]0x80,%f26	! %f26 = 00003690 4955f2ff
!	Mem[0000000030081408] = ff5e369000000000, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = ff5e369000000000
!	Mem[00000000300c1408] = fff252fe, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 00000000bc90ed1d
	setx	0x93ac511fe4e52284,%g7,%l0 ! %l0 = 93ac511fe4e52284
!	%l1 = ff5e369000000000
	setx	0x39ca05385a4bbadf,%g7,%l1 ! %l1 = 39ca05385a4bbadf
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 93ac511fe4e52284
	setx	0xb8c308f7d91ffa9b,%g7,%l0 ! %l0 = b8c308f7d91ffa9b
!	%l1 = 39ca05385a4bbadf
	setx	0x07c6330fb68129c6,%g7,%l1 ! %l1 = 07c6330fb68129c6

p0_label_120:
!	%l6 = ffffffffffffffff, Mem[0000000010181410] = ff000000
	stwa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	Mem[0000000010001408] = ffffffff, %l7 = 00000000ffeef2ff
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030101408] = 000003ff, %l5 = ffffffffffffff80
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 00000080
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f13 = 000003d1, Mem[000000001008142c] = fffff0c5
	sta	%f13,[%i2+0x02c]%asi	! Mem[000000001008142c] = 000003d1
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l0 = b8c308f7d91ffa9b, Mem[0000000010001436] = 000003d1, %asi = 80
	stba	%l0,[%i0+0x036]%asi	! Mem[0000000010001434] = 00009bd1
!	%l0 = d91ffa9b, %l1 = b68129c6, Mem[0000000010141410] = fff255ff 32ecdbd3
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = d91ffa9b b68129c6
!	%f26 = 00003690, Mem[000000001014140c] = ffffff90
	st	%f26,[%i5+0x00c]	! Mem[000000001014140c] = 00003690
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 45daff2e, %l4 = 0000000000000000
	ldsba	[%i4+0x00f]%asi,%l4	! %l4 = 000000000000002e

p0_label_121:
!	Mem[0000000030001408] = 45daff2e, %l5 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = 0000000045daff2e
!	Mem[0000000010101400] = 00003690, %f22 = c6008344
	lda	[%i4+%g0]0x80,%f22	! %f22 = 00003690
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010081400] = ff000000 99bb9ea8 ff000000 4955f2ff
!	Mem[0000000010081410] = 1200ef00 99bb9ea8 919fd6ff 448300c6
!	Mem[0000000010081420] = 0f6fa18d 780000ff a89ebb99 000003d1
!	Mem[0000000010081430] = f7596ac7 000000ff 050f1212 f92dc578
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	%l4 = 000000000000002e, %l6 = ffffffffffffffff, %y  = 00000000
	sdiv	%l4,%l6,%l4		! %l4 = ffffffffffffffd2
	mov	%l0,%y			! %y = d91ffa9b
!	Mem[0000000010181410] = ffffffff, %l6 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181404] = 98aeb94b, %l3 = 0000000000000000
	lduba	[%i6+0x004]%asi,%l3	! %l3 = 0000000000000098
!	Mem[00000000211c0000] = 90efb6f7, %l3 = 0000000000000098
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffff90
!	Mem[0000000010081410] = 1200ef0099bb9ea8, %f16 = 80000000 000003d1
	ldd	[%i2+%o5],%f16		! %f16 = 1200ef00 99bb9ea8
!	Mem[0000000010101408] = 000000ff45daff2e, %f26 = 00003690 4955f2ff
	ldd	[%i4+%o4],%f26		! %f26 = 000000ff 45daff2e
!	Starting 10 instruction Store Burst
!	%l0 = b8c308f7d91ffa9b, Mem[00000000300c1410] = ff8380789f121584
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = b8c308f7d91ffa9b

p0_label_122:
!	%l3 = ffffffffffffff90, Mem[0000000010001404] = 49000000
	sth	%l3,[%i0+0x004]		! Mem[0000000010001404] = ff900000
!	Mem[0000000030001410] = 99bb9ea8, %l3 = ffffffffffffff90
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 0000000099bb9ea8
!	Mem[0000000010001410] = ffffffff, %l6 = ffffffffffffffff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010101408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%f21 = 3a2273ff, %f31 = 6288d4f3
	fsqrts	%f21,%f31		! %f31 = 3ccbee6d
!	%f20 = ff000000 3a2273ff, Mem[00000000100c1408] = 485e3690 00000000
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000 3a2273ff
!	%l2 = 00000000000000ff, Mem[0000000010101434] = b49ed50d
	stw	%l2,[%i4+0x034]		! Mem[0000000010101434] = 000000ff
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000030 ffffffd1, %l2 = 00000000, %l3 = 99bb9ea8
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000030 00000000ffffffd1

p0_label_123:
!	%l0 = b8c308f7d91ffa9b, %l4 = ffffffffffffffd2, %l7 = 00000000ffffffff
	sdivx	%l0,%l4,%l7		! %l7 = 018c74acb2ee9bf1
!	Mem[0000000010141410] = 9bfa1fd9, %l4 = ffffffffffffffd2
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffff9bfa
!	Mem[0000000010181410] = ef000000ffffffff, %f28 = d3dbec32 7fffffff
	ldda	[%i6+%o5]0x88,%f28	! %f28 = ef000000 ffffffff
!	Mem[0000000030041408] = ffffffff, %l6 = 00000000ffffffff
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = ffffffff, %l6 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = ff9ebb99, %l2 = 0000000000000030
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l6 = ffffffffffffffff
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = ffffff90, %l1 = 07c6330fb68129c6
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = ffffffffffffff90
!	Mem[0000000030181410] = ffffffff, %l1 = ffffffffffffff90
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[00000000100c1438] = f7596ac74955f2ff, %asi = 80
	stxa	%l2,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000000000ff

p0_label_124:
!	%l0 = b8c308f7d91ffa9b, Mem[0000000030101408] = 000003ff
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000fa9b
!	Mem[0000000030001410] = 90ffffff, %l4 = ffffffffffff9bfa
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 0000000090ffffff
!	%f21 = 3a2273ff, Mem[0000000010181410] = ffffffff
	sta	%f21,[%i6+%o5]0x80	! Mem[0000000010181410] = 3a2273ff
!	%l3 = 00000000ffffffd1, Mem[0000000010041400] = 00000000
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000d1
!	%f30 = c9b591df 3ccbee6d, Mem[00000000100c1428] = 000003d1 000000fe
	std	%f30,[%i3+0x028]	! Mem[00000000100c1428] = c9b591df 3ccbee6d
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = fff252fe
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff52fe
!	%f25 = 00ef0012, Mem[000000001010141c] = 64ecce2e
	st	%f25,[%i4+0x01c]	! Mem[000000001010141c] = 00ef0012
!	Mem[00000000100c141c] = 8e4407a0, %l1 = 0000ffff, %l4 = 90ffffff
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000008e4407a0
!	%f16 = 1200ef00 99bb9ea8 ffffffff e0000000
!	%f20 = ff000000 3a2273ff 00003690 99bb9eff
!	%f24 = a89ebb99 00ef0012 000000ff 45daff2e
!	%f28 = ef000000 ffffffff c9b591df 3ccbee6d
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = f6c5a493448300c6, %l5 = 0000000045daff2e
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = f6c5a493448300c6

p0_label_125:
!	Mem[0000000030181408] = 0000000006d7b075, %l4 = 000000008e4407a0
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 0000000006d7b075
!	Mem[0000000010181410] = 3a2273ff, %l7 = 018c74acb2ee9bf1
	ldsha	[%i6+0x012]%asi,%l7	! %l7 = 00000000000073ff
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff460000000000ad, %f12 = ff000000 c76a59f7
	ldda	[%i1+%o5]0x81,%f12	! %f12 = ff460000 000000ad
!	Mem[0000000010041410] = 0dd59eb4, %l3 = 00000000ffffffd1
	ldswa	[%i1+%o5]0x80,%l3	! %l3 = 000000000dd59eb4
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030001410] = ff73223a000000ff, %l7 = 00000000000073ff
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = ff73223a000000ff
!	Mem[0000000010181400] = 4bb9ae9845daff2e, %f8  = ff000078 8da16f0f
	ldda	[%i6+%g0]0x88,%f8 	! %f8  = 4bb9ae98 45daff2e
!	Mem[00000000300c1410] = f708c3b8, %l1 = 000000000000ffff
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = fffffffff708c3b8
!	Mem[0000000010101438] = 92118061 00000060, %l4 = 06d7b075, %l5 = 448300c6
	ldda	[%i4+0x038]%asi,%l4	! %l4 = 0000000092118061 0000000000000060
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[000000001008143f] = f92dc578, %asi = 80
	stba	%l6,[%i2+0x03f]%asi	! Mem[000000001008143c] = f92dc5ff

p0_label_126:
!	Mem[0000000030001408] = e0000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l7 = ff73223a000000ff, imm = 0000000000000633, %l5 = 0000000000000060
	sub	%l7,0x633,%l5		! %l5 = ff732239fffffacc
!	%l1 = fffffffff708c3b8, Mem[0000000010081418] = 919fd6ff448300c6
	stx	%l1,[%i2+0x018]		! Mem[0000000010081418] = fffffffff708c3b8
!	%l5 = ff732239fffffacc, %l2 = 0000000000000000, %l4 = 0000000092118061
	subc	%l5,%l2,%l4		! %l4 = ff732239fffffacc
!	Mem[00000000100c1410] = 000003d1, %l7 = ff73223a000000ff
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 00000000000003d1
!	Mem[0000000030141400] = efee0000, %l1 = fffffffff708c3b8
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = ff732239fffffacc, Mem[0000000010001420] = b6662aa7, %asi = 80
	stha	%l5,[%i0+0x020]%asi	! Mem[0000000010001420] = facc2aa7
!	Mem[0000000030141410] = 000000ff, %l3 = 000000000dd59eb4
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f6  = c6008344, %f26 = 000000ff, %f13 = 000000ad
	fmuls	%f6 ,%f26,%f13		! %l0 = b8c308f7d91ffabd, Unfinished, %fsr = 2c00000400
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = 59f7c531, %l0 = b8c308f7d91ffabd
	lduwa	[%i1+0x02c]%asi,%l0	! %l0 = 0000000059f7c531

p0_label_127:
!	Mem[0000000010001408] = fff2eeff, %l5 = ff732239fffffacc
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ff000000 9f121584, %l4 = fffffacc, %l5 = 000000ff
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000 000000009f121584
!	Mem[0000000030101410] = 91000000, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 9bfa1fd9c62981b6, %f0  = a89ebb99 000000ff
	ldd	[%i5+%o5],%f0 		! %f0  = 9bfa1fd9 c62981b6
!	Mem[00000000100c1410] = ff000000, %f21 = 3a2273ff
	lda	[%i3+%o5]0x80,%f21	! %f21 = ff000000
!	Mem[0000000010101400] = 90360000, %l4 = 00000000ff000000
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = d100000000000091, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = d100000000000091
!	Mem[0000000010001428] = 78c5f483, %l6 = 0000000000000000
	ldsb	[%i0+0x02a],%l6		! %l6 = fffffffffffffff4
!	Mem[0000000030181400] = ff000000, %l3 = d100000000000091
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010141436] = ffffffff, %l2 = 0000000000000000
	ldstub	[%i5+0x036],%l2		! %l2 = 000000ff000000ff

p0_label_128:
!	%l5 = 000000009f121584, Mem[000000001010142c] = 00000012, %asi = 80
	stha	%l5,[%i4+0x02c]%asi	! Mem[000000001010142c] = 15840012
!	%f18 = ffffffff e0000000, Mem[0000000010041428] = 8e4407a0 59f7c531
	stda	%f18,[%i1+0x028]%asi	! Mem[0000000010041428] = ffffffff e0000000
!	Mem[0000000010141410] = d91ffa9b, %l0 = 0000000059f7c531
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 0000009b000000ff
!	%l0 = 000000000000009b, Mem[0000000010001410] = ffffffff
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff009b
!	Mem[0000000030181410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010081436] = 000000ff
	sth	%l1,[%i2+0x036]		! Mem[0000000010081434] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010101400] = fff2554990360000
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = c600834499bb9eff
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%f28 = ef000000, Mem[00000000300c1408] = 00ff52fe
	sta	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = ef000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffffffff, %l7 = 00000000000003d1
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_129:
!	Mem[0000000030181410] = ffffffff, %l0 = 000000000000009b
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 00000049, %f7  = ffd69f91
	lda	[%i5+%g0]0x80,%f7 	! %f7 = 00000049
!	Mem[0000000010101408] = 000000ff, %l3 = ffffffffffffff00
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 000003d1, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffffd1
!	Mem[0000000010181438] = c9b591df, %l4 = 00000000000000ff
	ldsw	[%i6+0x038],%l4		! %l4 = ffffffffc9b591df
!	Code Fragment 3
p0_fragment_15:
!	%l0 = ffffffffffffffff
	setx	0x6f73da4fed142406,%g7,%l0 ! %l0 = 6f73da4fed142406
!	%l1 = ffffffffffffffd1
	setx	0xe00e182ffebd5171,%g7,%l1 ! %l1 = e00e182ffebd5171
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6f73da4fed142406
	setx	0x31c2ef9f89c08892,%g7,%l0 ! %l0 = 31c2ef9f89c08892
!	%l1 = e00e182ffebd5171
	setx	0x10fdcaa0645d921e,%g7,%l1 ! %l1 = 10fdcaa0645d921e
!	%f28 = ef000000 ffffffff, %l0 = 31c2ef9f89c08892
!	Mem[0000000030141408] = 0000000000000000
	add	%i5,0x008,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030141408] = 00000000000000ef
!	Mem[00000000100c1410] = ff000000, %l0 = 31c2ef9f89c08892
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181408] = ff9ebb99, %l6 = fffffffffffffff4
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff9e
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = 17a89b10, %l7 = ffffffffffffffff
	ldstub	[%o3+0x181],%l7		! %l7 = 000000a8000000ff

p0_label_130:
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = ffffffffff000000, Mem[00000000300c1410] = b8c308f7d91ffa9b
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffff000000
!	Mem[000000001008143d] = f92dc5ff, %l4 = ffffffffc9b591df
	ldstub	[%i2+0x03d],%l4		! %l4 = 0000002d000000ff
!	%l4 = 0000002d, %l5 = 9f121584, Mem[0000000030181410] = ffffffff ff550000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000002d 9f121584
!	%l1 = 10fdcaa0645d921e, Mem[0000000010181410] = ff73223a
	stha	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ff73921e
!	%f2  = fff25549, Mem[00000000300c1400] = 93a4c5f6
	sta	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = fff25549
!	Mem[00000000300c1400] = 4955f2ff, %l3 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000049000000ff
!	%l7 = 00000000000000a8, Mem[00000000300c1400] = ff55f2ff
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000a8
!	%l2 = 0000000000000000, Mem[00000000100c140a] = ff000000, %asi = 80
	stba	%l2,[%i3+0x00a]%asi	! Mem[00000000100c1408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l7 = 00000000000000a8
	ldsb	[%i2+0x009],%l7		! %l7 = 0000000000000000

p0_label_131:
!	Mem[0000000010081410] = 00ef0012, %l3 = 0000000000000049
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000012
!	Mem[0000000030001400] = 99bb9ea8, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffffa8
!	Mem[0000000010001408] = fff2eeff, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffeeff
!	Mem[00000000100c1410] = ff000000ffffffff, %l0 = ffffffffff000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = ff000000ffffffff
!	Mem[00000000100c1400] = 6d88f660 ffffffff, %l6 = ffffff9e, %l7 = ffffeeff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000ffffffff 000000006d88f660
!	Mem[00000000300c1410] = ffffffff, %l3 = 0000000000000012
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = ff73921e, %l3 = ffffffffffffffff
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ff73921e
!	Mem[0000000010101408] = ff000000, %l7 = 000000006d88f660
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f12 = ff460000 000000ad, %f7  = 00000049
	fdtoi	%f12,%f7 		! %f7  = 80000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, imm = 0000000000000d56, %l4 = 000000000000002d
	addc	%l6,0xd56,%l4		! %l4 = 0000000100000d55

p0_label_132:
!	%l6 = ffffffff, %l7 = 00000000, Mem[00000000100c1400] = ffffffff 60f6886d
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff 00000000
!	%l4 = 00000d55, %l5 = 9f121584, Mem[0000000010001400] = 99bb9ea8 000090ff
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000d55 9f121584
!	%f10 = d1030000 99bb9ea8, Mem[00000000100c1408] = 000000ff ff73223a
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = d1030000 99bb9ea8
!	%f0  = 9bfa1fd9 c62981b6 fff25549 000000ff
!	%f4  = a89ebb99 00ef0012 c6008344 80000000
!	%f8  = 4bb9ae98 45daff2e d1030000 99bb9ea8
!	%f12 = ff460000 000000ad 78c52df9 12120f05
	stda	%f0,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l4 = 00000d55, %l5 = 9f121584, Mem[0000000030081410] = 30000000 d1ffffff
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000d55 9f121584
!	Mem[0000000010181424] = 00000090, %l2 = ffffffffffffffa8, %asi = 80
	swapa	[%i6+0x024]%asi,%l2	! %l2 = 0000000000000090
!	%l4 = 0000000100000d55, Mem[0000000010181408] = 99bb9eff
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000d55
!	Mem[00000000100c1410] = ff000000, %l0 = ff000000ffffffff
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141408] = ffffffff, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 550d00008415129f, %l1 = 10fdcaa0645d921e
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = 550d00008415129f

p0_label_133:
!	Mem[0000000030041408] = ffffffff, %l3 = 00000000ff73921e
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = 45daff2e, %l5 = 000000009f121584
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = 000000000000002e
!	Mem[0000000010081400] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ff000000 9f121584, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000 000000009f121584
!	Mem[0000000010081400] = 000000ff, %l5 = 000000000000002e
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l3 = ffffffffffffffff
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l1 = 550d00008415129f
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 00000d55, %l7 = 000000009f121584
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000055
!	Mem[0000000010141410] = d91ffaff, %l4 = 0000000100000d55
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffd91ffaff
!	Starting 10 instruction Store Burst
!	%f0  = 9bfa1fd9 c62981b6 fff25549 000000ff
!	%f4  = a89ebb99 00ef0012 c6008344 80000000
!	%f8  = 4bb9ae98 45daff2e d1030000 99bb9ea8
!	%f12 = ff460000 000000ad 78c52df9 12120f05
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400

p0_label_134:
!	Mem[00000000100c1410] = ff000000, %l6 = 00000000ff000000
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001408] = fff2eeff, %l7 = 0000000000000055
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081410] = 550d0000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000055000000ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101414] = 007f0000, %l5 = 000000ff, %l1 = 000000ff
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000007f0000
!	Mem[00000000100c1408] = 99bb9ea8, %l1 = 00000000007f0000
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 000000a8000000ff
!	%l1 = 00000000000000a8, %l3 = 0000000000000055, %y  = d91ffa9b
	umul	%l1,%l3,%l7		! %l7 = 00000000000037c8, %y = 00000000
!	Mem[0000000010101400] = 000000ff, %l2 = 0000000000000090
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000055, Mem[0000000010141400] = 00000049
	stba	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 55000049
!	%f14 = 78c52df9 12120f05, %l6 = 00000000ff000000
!	Mem[00000000100c1420] = fff2554990365e48
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_PL ! Mem[00000000100c1420] = fff2554990365e48
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 90000000, %l3 = 0000000000000055
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000009000

p0_label_135:
!	Mem[0000000030041400] = 00000000 00000030 ffffffff ff550000
!	Mem[0000000030041410] = ff460000 000000ad c6008344 c4d69f91
!	Mem[0000000030041420] = 7846a16b 8da16f0f 78c52df9 a72a66b6
!	Mem[0000000030041430] = f3d43e62 df919ec9 78c52df9 12120f05
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[00000000201c0000] = 00009a5f, %l1 = 00000000000000a8
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff000000ff, %l5 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = ffffffff000000ff
!	Mem[0000000010181410] = 1e9273ff, %l3 = 0000000000009000
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 000000001e9273ff
!	Mem[00000000300c1410] = ffffffff, %l5 = ffffffff000000ff
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = fff2eeff, %l7 = 00000000000037c8
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 000000000000eeff
!	Mem[0000000030101408] = ff0000004955f2ff, %f6  = c6008344 80000000
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = ff000000 4955f2ff
!	Mem[0000000010081408] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 0000002d, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 000000000000002d
!	Starting 10 instruction Store Burst
!	Mem[000000001008142f] = 000003d1, %l4 = ffffffffd91ffaff
	ldstub	[%i2+0x02f],%l4		! %l4 = 000000d1000000ff

p0_label_136:
!	%f12 = ff460000 000000ad, Mem[0000000030081400] = 000003d1 c59ff6a6
	stda	%f12,[%i2+%g0]0x89	! Mem[0000000030081400] = ff460000 000000ad
!	%l0 = 000000ff, %l1 = 0000002d, Mem[0000000030141400] = efee00ff a89ebb99
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 0000002d
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 1200ef00
	sth	%l5,[%i2+%o5]		! Mem[0000000010081410] = 00ffef00
	membar	#Sync			! Added by membar checker (23)
!	%f9  = 45daff2e, Mem[0000000030041400] = 00000000
	sta	%f9 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 45daff2e
!	%l6 = 00000000ff000000, Mem[00000000201c0000] = 00009a5f
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00009a5f
!	%f2  = fff25549 000000ff, Mem[0000000010001430] = ffffffff 00009bd1
	std	%f2 ,[%i0+0x030]	! Mem[0000000010001430] = fff25549 000000ff
!	Mem[0000000030081400] = ad000000, %l6 = 00000000ff000000
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 000000ad000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001408] = ffeef2ff
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Mem[00000000100c1400] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffffff550000, %f14 = 78c52df9 12120f05
	ldda	[%i1+%o4]0x81,%f14	! %f14 = ffffffff ff550000

p0_label_137:
!	Mem[00000000201c0000] = 00009a5f, %l5 = 00000000000000ff
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0x5d4f87f83525c097,%g7,%l0 ! %l0 = 5d4f87f83525c097
!	%l1 = 000000000000002d
	setx	0x4f801b301337a354,%g7,%l1 ! %l1 = 4f801b301337a354
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5d4f87f83525c097
	setx	0x2ab8a8a7a06cd904,%g7,%l0 ! %l0 = 2ab8a8a7a06cd904
!	%l1 = 4f801b301337a354
	setx	0xfbab95582b0a1c92,%g7,%l1 ! %l1 = fbab95582b0a1c92
!	Mem[00000000300c1400] = c6008344a8000000, %f6  = ff000000 4955f2ff
	ldda	[%i3+%g0]0x89,%f6 	! %f6  = c6008344 a8000000
!	Mem[0000000010041400] = 91000000000000d1, %f8  = 4bb9ae98 45daff2e
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = 91000000 000000d1
!	Mem[0000000030141400] = 0000002d000000ff, %l1 = fbab95582b0a1c92
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = 0000002d000000ff
!	Mem[0000000010001408] = 000000ff, %l7 = 000000000000eeff
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 550d0000, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000055
!	Mem[0000000030081410] = ff0d0000, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	%l6 = 00000000000000ad, immd = 0000000000000c18, %l0 = 2ab8a8a7a06cd904
	sdivx	%l6,0xc18,%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000ad, %l7 = 00000055, Mem[0000000030101408] = 000000ff fff25549
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ad 00000055

p0_label_138:
!	%l5 = 0000000000000000, Mem[00000000100c1400] = ffffffff, %asi = 80
	stha	%l5,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000ffff
!	%f12 = ff460000 000000ad, %l0 = 0000000000000000
!	Mem[00000000300c1430] = 3031db6aa13b2a6d
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_S ! Mem[00000000300c1430] = 3031db6aa13b2a6d
!	%f5  = 00ef0012, Mem[0000000030001408] = ff0000e0
	sta	%f5 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ef0012
!	Mem[0000000030001400] = 99bb9ea8, %l3 = 000000001e9273ff
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 000000a8000000ff
!	Mem[0000000020800040] = 0000978a, %l3 = 00000000000000a8
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff000000
!	%l5 = 0000000000000000, immd = fffffffffffff9ab, %l4 = 00000000000000d1
	sdivx	%l5,-0x655,%l4		! %l4 = 0000000000000000
!	Mem[0000000010041400] = d1000000, %l2 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000d1000000ff
!	%f6  = c6008344 a8000000, %l5 = 0000000000000000
!	Mem[0000000030081438] = 000000a253e80133
	add	%i2,0x038,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081438] = 000000a253e80133
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 75b0d706 000000ff, %l6 = 000000ad, %l7 = 00000055
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000075b0d706

p0_label_139:
!	Mem[0000000030181400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030101410] = 00ef0012, %l4 = 00000000ff000000
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000012
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000012
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 99bb9eff, %l0 = 00000000ff000000
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffff9eff
!	Mem[0000000030001400] = ff9ebb99 00ef0012, %l0 = ffff9eff, %l1 = 000000ff
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff9ebb99 0000000000ef0012
!	Mem[00000000300c1410] = ffffffff ff000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ffffffff 00000000ff000000
!	Mem[000000001008141c] = 448300c6, %l1 = 0000000000ef0012
	ldsba	[%i2+0x01c]%asi,%l1	! %l1 = 0000000000000044
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 00000000ff9ebb99
	setx	0x62ece2f030feb645,%g7,%l0 ! %l0 = 62ece2f030feb645
!	%l1 = 0000000000000044
	setx	0x2dd0fbafb616e6a3,%g7,%l1 ! %l1 = 2dd0fbafb616e6a3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 62ece2f030feb645
	setx	0xd3f311304d63b50b,%g7,%l0 ! %l0 = d3f311304d63b50b
!	%l1 = 2dd0fbafb616e6a3
	setx	0x46ec590835886fdb,%g7,%l1 ! %l1 = 46ec590835886fdb
!	Mem[0000000010081408] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 75b0d706, Mem[00000000100c1400] = 0000ffff 00000000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000 75b0d706

p0_label_140:
!	Mem[0000000010141400] = 55000049, %l2 = 00000000000000d1
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000055000049
!	%f24 = 7846a16b 8da16f0f, Mem[0000000010081400] = b68129c6 d91ffa9b
	stda	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = 7846a16b 8da16f0f
!	Mem[00000000201c0000] = 00009a5f, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%f12 = ff460000 000000ad, Mem[0000000030001408] = 1200ef00 ffffffff
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = ff460000 000000ad
!	Mem[00000000100c1410] = ff000000, %l0 = d3f311304d63b50b
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	%l5 = 00000000ff000000, %l1 = 46ec590835886fdb, %l7 = 0000000075b0d706
	subc	%l5,%l1,%l7		! %l7 = b913a6f8c9779025
!	%l7 = b913a6f8c9779025, Mem[0000000010141400] = d1000000
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = d1000025
!	%l4 = 00000000ffffffff, Mem[0000000010181430] = 788083ff
	sth	%l4,[%i6+0x030]		! Mem[0000000010181430] = ffff83ff
!	Mem[0000000010041408] = bc90ecfb, %l6 = 00000000ff000000
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000bc90ecfb
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 4bb9ae98 45daff2e, %l0 = ff000000, %l1 = 35886fdb
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 0000000045daff2e 000000004bb9ae98

p0_label_141:
!	Mem[0000000010181410] = ff73921e, %f5  = 00ef0012
	lda	[%i6+%o5]0x88,%f5 	! %f5 = ff73921e
!	Mem[0000000010001400] = 9f12158400000d55, %l5 = 00000000ff000000
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 9f12158400000d55
!	Mem[00000000100c1410] = 4d63b50b, %l6 = 00000000bc90ecfb
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000004d63
!	Mem[0000000030001400] = 99bb9eff, %l4 = 00000000ffffffff
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800040] = 0000f914, %l7 = b913a6f8c9779025
	lduha	[%o3+0x040]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff460000 000000ff, %l0 = 45daff2e, %l1 = 4bb9ae98
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff 00000000ff460000
!	Mem[0000000030041400] = 45daff2e 00000030, %l6 = 00004d63, %l7 = 00000000
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 0000000045daff2e 0000000000000030
!	Mem[0000000010041400] = 91000000 000000ff, %l0 = 000000ff, %l1 = ff460000
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000091000000
!	Mem[0000000030081410] = ff0d0000, %l4 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 55000049, %l3 = 00000000, Mem[0000000030141410] = ff0000ff 007f0000
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 55000049 00000000

p0_label_142:
!	%l3 = 0000000000000000, Mem[0000000010001410] = ffff009b
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff0000
!	%l2 = 0000000055000049, Mem[0000000021800100] = 7fffe14a
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 0049e14a
!	%l1 = 0000000091000000, Mem[0000000030081400] = ff000000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%f4  = a89ebb99 ff73921e, %l0 = 00000000000000ff
!	Mem[0000000010001418] = ffffffffffffffff
	add	%i0,0x018,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001418] = 1e9273ff99bb9ea8
!	%l2 = 0000000055000049, Mem[0000000010041438] = 0000008399bb9ea8
	stx	%l2,[%i1+0x038]		! Mem[0000000010041438] = 0000000055000049
!	Mem[00000000211c0000] = 90efb6f7, %l6 = 0000000045daff2e
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000090000000ff
!	%l0 = 00000000000000ff, Mem[0000000020800001] = ffff8691
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = ffff8691
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 00000000000000ff
	setx	0x2a9278985cad4478,%g7,%l0 ! %l0 = 2a9278985cad4478
!	%l1 = 0000000091000000
	setx	0x1342b2f0214071d6,%g7,%l1 ! %l1 = 1342b2f0214071d6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a9278985cad4478
	setx	0xdefefa0fb2dea3c0,%g7,%l0 ! %l0 = defefa0fb2dea3c0
!	%l1 = 1342b2f0214071d6
	setx	0x4daadeb7f24f7b0e,%g7,%l1 ! %l1 = 4daadeb7f24f7b0e
!	%l3 = 0000000000000000, Mem[0000000030101400] = b68129c6
	stba	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 008129c6
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000030
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_143:
!	Mem[00000000211c0000] = ffefb6f7, %l0 = defefa0fb2dea3c0
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffef
!	Mem[0000000010001424] = fffff0c5, %l2 = 0000000055000049
	lduwa	[%i0+0x024]%asi,%l2	! %l2 = 00000000fffff0c5
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030101400] = 008129c6 d91ffa9b ad000000 55000000
!	Mem[0000000030101410] = 1200ef00 99bb9ea8 00000080 448300c6
!	Mem[0000000030101420] = 2effda45 98aeb94b a89ebb99 000003d1
!	Mem[0000000030101430] = ad000000 000046ff 050f1212 f92dc578
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000010181400] = 45daff2e, %l6 = 0000000000000090
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 000000000000002e
!	Mem[0000000010081400] = 6ba14678, %f0  = 9bfa1fd9
	lda	[%i2+%g0]0x88,%f0 	! %f0 = 6ba14678
!	%l3 = 0000000000000000, imm = 00000000000008c7, %l0 = ffffffffffffffef
	addc	%l3,0x8c7,%l0		! %l0 = 00000000000008c7
!	Mem[0000000030181410] = 2d000000, %f10 = d1030000
	lda	[%i6+%o5]0x81,%f10	! %f10 = 2d000000
!	Mem[0000000030081400] = 00000000, %l2 = 00000000fffff0c5
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001004143c] = 55000049, %l1 = 4daadeb7f24f7b0e
	ldsha	[%i1+0x03c]%asi,%l1	! %l1 = 0000000000005500
!	Starting 10 instruction Store Burst
!	%f12 = ff460000 000000ad, %l3 = 0000000000000000
!	Mem[00000000100c1410] = 4d63b50bffffffff
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_PL ! Mem[00000000100c1410] = 4d63b50bffffffff

p0_label_144:
!	%l6 = 000000000000002e, Mem[0000000010141410] = d91ffaff
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000002e
!	%l7 = 0000000000000000, Mem[0000000030001400] = 99bb9eff
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f0  = 6ba14678 c62981b6 fff25549 000000ff
!	%f4  = a89ebb99 ff73921e c6008344 a8000000
!	%f8  = 91000000 000000d1 2d000000 99bb9ea8
!	%f12 = ff460000 000000ad ffffffff ff550000
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[0000000030041400] = 45daff2e, %l6 = 000000000000002e
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000045daff2e
!	%f26 = a89ebb99 000003d1, Mem[0000000010081408] = 000000ff fff25549
	stda	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = a89ebb99 000003d1
!	%l4 = ffffffff, %l5 = 00000d55, Mem[0000000010041410] = b49ed50d 12000000
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff 00000d55
!	%f24 = 2effda45 98aeb94b, Mem[00000000100c1400] = 000000ff 06d7b075
	stda	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2effda45 98aeb94b
!	%l2 = 0000000000000000, Mem[0000000010041408] = ff000000
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l6 = 0000000045daff2e, Mem[0000000030081400] = 00000000
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 2e000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 17ff9b10, %l1 = 0000000000005500
	ldsh	[%o3+0x180],%l1		! %l1 = 00000000000017ff

p0_label_145:
!	Mem[00000000100c1408] = ff9ebb99, %f16 = 008129c6
	lda	[%i3+%o4]0x80,%f16	! %f16 = ff9ebb99
!	Mem[0000000010181400] = 2effda45, %l4 = ffffffffffffffff
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = 0000000000002eff
!	Mem[0000000010181410] = 1e9273ff, %f22 = 00000080
	lda	[%i6+%o5]0x80,%f22	! %f22 = 1e9273ff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030001408] = 4955f2ff, %l5 = 9f12158400000d55
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = 000000004955f2ff
!	%l6 = 0000000045daff2e, immd = 0000000000000992, %l0 = 00000000000008c7
	sdivx	%l6,0x992,%l0		! %l0 = 0000000000074c97
!	Mem[0000000030101410] = 1200ef00, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000012
!	Mem[0000000030081410] = 9f12158400000dff, %f24 = 2effda45 98aeb94b
	ldda	[%i2+%o5]0x89,%f24	! %f24 = 9f121584 00000dff
!	Mem[0000000030181408] = ff000000, %f20 = 1200ef00
	lda	[%i6+%o4]0x81,%f20	! %f20 = ff000000
!	Mem[0000000030101410] = 00ef0012, %l1 = 00000000000017ff
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000ef0012
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 0000002e, %l5 = 000000004955f2ff
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_146:
!	Mem[0000000010001420] = facc2aa7, %l4 = 0000000000002eff, %asi = 80
	swapa	[%i0+0x020]%asi,%l4	! %l4 = 00000000facc2aa7
!	%f30 = 050f1212 f92dc578, %l7 = 0000000000000000
!	Mem[0000000010041410] = ffffffff550d0000
	add	%i1,0x010,%g1
	stda	%f30,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041410] = ffffffff550d0000
!	Mem[00000000218000c0] = 223a635c, %l3 = 0000000000000000
	ldstub	[%o3+0x0c0],%l3		! %l3 = 00000022000000ff
!	%f14 = ffffffff ff550000, %l6 = 0000000045daff2e
!	Mem[0000000010041410] = ffffffff550d0000
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_P ! Mem[0000000010041410] = ffffffff550d0000
!	%l7 = 0000000000000000, Mem[0000000010081420] = 2effda45, %asi = 80
	stwa	%l7,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000
!	Mem[0000000010101400] = 90000000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000090000000ff
!	%f4  = a89ebb99 ff73921e, Mem[0000000010081400] = 6ba14678 0f6fa18d
	stda	%f4 ,[%i2+%g0]0x88	! Mem[0000000010081400] = a89ebb99 ff73921e
!	%l3 = 0000000000000022, immd = 000000000000002c, %l2 = 0000000000000012
	sdivx	%l3,0x02c,%l2		! %l2 = 0000000000000000
!	%l7 = 0000000000000000, %l2 = 0000000000000000, %l2 = 0000000000000000
	xnor	%l7,%l2,%l2		! %l2 = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff00000000000091, %l3 = 0000000000000022
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = ff00000000000091

p0_label_147:
!	Mem[0000000030141410] = 5500004900000000, %l3 = ff00000000000091
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 5500004900000000
!	Mem[0000000010001410] = 0000ffff, %f27 = 000003d1
	lda	[%i0+%o5]0x80,%f27	! %f27 = 0000ffff
!	Mem[0000000010101410] = d1030000, %l3 = 5500004900000000
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffd103
!	Mem[0000000010001428] = 78c5f483, %l4 = 00000000facc2aa7
	lduw	[%i0+0x028],%l4		! %l4 = 0000000078c5f483
!	Mem[0000000010041400] = ff000000, %f29 = 000046ff
	lda	[%i1+%g0]0x80,%f29	! %f29 = ff000000
!	Mem[00000000201c0000] = ff009a5f, %l5 = 0000000000000090
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = 98aeb94b, %l2 = ffffffffffffffff
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 0000000098aeb94b
!	Mem[0000000010081408] = d1030000, %l4 = 0000000078c5f483
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffd103
!	Mem[00000000211c0000] = ffefb6f7, %l0 = 0000000000074c97
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ef
!	Starting 10 instruction Store Burst
!	%l2 = 0000000098aeb94b, Mem[00000000300c1400] = 000000a8
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 4b0000a8

p0_label_148:
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 00000000000000ef
	setx	0xd6e3ff304746065e,%g7,%l0 ! %l0 = d6e3ff304746065e
!	%l1 = 0000000000ef0012
	setx	0xeeb811d84be7b1a1,%g7,%l1 ! %l1 = eeb811d84be7b1a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d6e3ff304746065e
	setx	0x49bdba37c286c90d,%g7,%l0 ! %l0 = 49bdba37c286c90d
!	%l1 = eeb811d84be7b1a1
	setx	0x99e2571fe060a0cc,%g7,%l1 ! %l1 = 99e2571fe060a0cc
!	Mem[0000000010001410] = ffff0000, %l0 = 49bdba37c286c90d
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = ffffffffffffd103, Mem[0000000010141408] = 00000000
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = d1030000
!	Mem[0000000010081410] = 00efff00, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = 90365eff, %l4 = ffffffffffffd103
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 0000000090365eff
!	%l4 = 0000000090365eff, Mem[0000000030001408] = ff0000004955f2ff
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000090365eff
!	%l0 = 0000000000000000, Mem[0000000030081408] = 03d1ffff
	stwa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l2 = 98aeb94b, %l3 = ffffd103, Mem[0000000010081410] = 00efffff a89ebb99
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 98aeb94b ffffd103
!	Mem[00000000100c1400] = 4bb9ae98, %l4 = 0000000090365eff
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000004b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff00978a, %l7 = 0000000000000000
	ldub	[%o1+0x040],%l7		! %l7 = 00000000000000ff

p0_label_149:
!	Mem[0000000030001410] = a89ebb99, %l2 = 0000000098aeb94b
	ldsha	[%i0+%o5]0x81,%l2	! %l2 = ffffffffffffa89e
!	Mem[0000000030081410] = ff0d00008415129f, %l1 = 99e2571fe060a0cc
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = ff0d00008415129f
!	Mem[0000000030041410] = ff460000, %l2 = ffffffffffffa89e
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffffff460000
!	Mem[0000000010141400] = 250000d1, %l2 = ffffffffff460000
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 00000000250000d1
!	Mem[0000000010181400] = 2effda45 98aeb94b 550d0000 448300c6
!	Mem[0000000010181410] = 1e9273ff 000000ef b6662aa7 8e4407a0
!	Mem[0000000010181420] = fe009ece ffffffa8 000003d1 00ff0012
!	Mem[0000000010181430] = ffff83ff c1d99118 c9b591df 6288d4f3
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000020800040] = ff00978a, %l4 = 000000000000004b
	lduh	[%o1+0x040],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030081410] = ff0d0000, %l6 = 0000000045daff2e
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffff0d
!	%f2  = fff25549, %f5  = ff73921e, %f4  = a89ebb99
	fdivs	%f2 ,%f5 ,%f4 		! %f4  = fff25549
!	Mem[0000000010181408] = 550d0000, %l0 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 000000000000550d
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ff00, Mem[0000000010001410] = ffff00ff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ff00

p0_label_150:
!	%f10 = 2d000000 99bb9ea8, Mem[00000000300c1400] = a800004b c6008344
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2d000000 99bb9ea8
!	Mem[0000000030101410] = 00ef0012, %l4 = 000000000000ff00
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000ef0012
!	Mem[00000000300c1400] = 99bb9ea8, %l2 = 00000000250000d1
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000a8000000ff
!	%f12 = ff460000 000000ad, Mem[0000000010081408] = 000003d1 a89ebb99
	stda	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = ff460000 000000ad
!	%l2 = 00000000000000a8, Mem[0000000030081408] = 00000000
	stba	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000a8
!	%l6 = ffffffffffffff0d, Mem[00000000211c0001] = ffefb6f7
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = ff0db6f7
!	%f0  = 6ba14678, Mem[0000000030041408] = ffffffff
	sta	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 6ba14678
!	%f2  = fff25549 000000ff, Mem[0000000010081418] = 00000080 448300c6
	stda	%f2 ,[%i2+0x018]%asi	! Mem[0000000010081418] = fff25549 000000ff
	membar	#Sync			! Added by membar checker (26)
!	%l5 = ffffffffffffffff, Mem[0000000010181400] = 2effda45
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffda45
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 2d000000, %l7 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000002d00

p0_label_151:
!	Mem[0000000030141410] = 0000000049000055, %f12 = ff460000 000000ad
	ldda	[%i5+%o5]0x89,%f12	! %f12 = 00000000 49000055
!	Mem[0000000010001414] = 000003d1, %l1 = ff0d00008415129f
	ldsha	[%i0+0x014]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = d1030000 0000ff00, %l6 = ffffff0d, %l7 = 00002d00
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000000000ff00 00000000d1030000
!	Mem[0000000010181408] = 550d0000, %l5 = ffffffffffffffff
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000055
!	Mem[000000001018140c] = 448300c6, %l1 = 0000000000000000
	lduba	[%i6+0x00e]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ff9ebb99, %l0 = 000000000000550d
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081430] = ad000000, %l5 = 0000000000000055
	lduw	[%i2+0x030],%l5		! %l5 = 00000000ad000000
!	Mem[0000000010041420] = c59ff6a6, %l5 = 00000000ad000000
	ldub	[%i1+0x021],%l5		! %l5 = 000000000000009f
!	%l7 = 00000000d1030000, %l4 = 0000000000ef0012, %l5 = 000000000000009f
	xnor	%l7,%l4,%l5		! %l5 = ffffffff2e13ffed
!	Starting 10 instruction Store Burst
!	%f18 = c6008344 00000d55, %l7 = 00000000d1030000
!	Mem[0000000010181430] = ffff83ffc1d99118
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181430] = ffff83ffc1d99118

p0_label_152:
!	%l1 = 0000000000000000, Mem[0000000030081400] = 2e000000
	stwa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000010081410] = 4bb9ae98, %l2 = 00000000000000a8, %asi = 80
	swapa	[%i2+0x010]%asi,%l2	! %l2 = 000000004bb9ae98
!	%l7 = 00000000d1030000, Mem[0000000010001425] = fffff0c5, %asi = 80
	stba	%l7,[%i0+0x025]%asi	! Mem[0000000010001424] = ff00f0c5
!	%f0  = 6ba14678 c62981b6 fff25549 000000ff
!	%f4  = fff25549 ff73921e c6008344 a8000000
!	%f8  = 91000000 000000d1 2d000000 99bb9ea8
!	%f12 = 00000000 49000055 ffffffff ff550000
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff0000
!	Mem[0000000010141410] = 2e000000, %l6 = 000000000000ff00
	lduha	[%i5+0x012]%asi,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffffffd103, Mem[00000000211c0000] = ff0db6f7
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 030db6f7
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000100c1410] = 1e9273ff4955f2ff, %l7 = 00000000d1030000, %l7 = 00000000d1030000
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 1e9273ff4955f2ff
!	%l7 = 1e9273ff4955f2ff, Mem[0000000010041408] = 00000000
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000f2ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 99bb9ea8, %l3 = ffffffffffffd103
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 0000000099bb9ea8

p0_label_153:
!	Mem[00000000211c0000] = 030db6f7, %l2 = 000000004bb9ae98
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000003
!	Mem[0000000030181408] = ff000000, %l1 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = ff5e3690, %l3 = 0000000099bb9ea8
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141408] = d103000000003690, %f2  = fff25549 000000ff
	ldda	[%i5+%o4]0x80,%f2 	! %f2  = d1030000 00003690
!	Mem[0000000010081400] = 1e9273ff99bb9ea8, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 1e9273ff99bb9ea8
!	Mem[0000000010001400] = 550d0000, %l7 = 1e9273ff4955f2ff
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000550d
!	Mem[00000000100c143c] = ffffffff, %l6 = 1e9273ff99bb9ea8
	ldsw	[%i3+0x03c],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = b68129c67846a16b, %f12 = 00000000 49000055
	ldda	[%i0+%g0]0x89,%f12	! %f12 = b68129c6 7846a16b
!	Mem[0000000030141400] = 000000ff, %l4 = 0000000000ef0012
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = b68129c6, %l2 = 0000000000000003, %asi = 80
	swapa	[%i3+0x000]%asi,%l2	! %l2 = 00000000b68129c6

p0_label_154:
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = 030db6f7, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff0db6f7
!	%l7 = 000000000000550d, Mem[0000000010041410] = ffffffff
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000550d
!	Mem[0000000010181419] = b6662aa7, %l4 = 00000000000000ff
	ldstuba	[%i6+0x019]%asi,%l4	! %l4 = 00000066000000ff
!	%l4 = 0000000000000066, Mem[0000000030001408] = 90365eff
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 90360066
!	%f14 = ffffffff, %f4  = fff25549, %f4  = fff25549
	fadds	%f14,%f4 ,%f4 		! %f4  = fff25549
!	%l3 = ffffffffffffffff, Mem[0000000030041410] = ff460000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = ff460000
!	%l3 = ffffffffffffffff, %l6 = ffffffffffffffff, %l4 = 0000000000000066
	addc	%l3,%l6,%l4		! %l4 = fffffffffffffffe
!	Mem[0000000030081408] = 000000a8, %l5 = ffffffff2e13ffed
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000a8
!	%l6 = ffffffffffffffff, Mem[0000000010041410] = 0d550000
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0d5500ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ad000000, %l7 = 000000000000550d
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = ffffffffad000000

p0_label_155:
!	%l2 = 00000000b68129c6, imm = 0000000000000ef5, %l0 = 00000000000000ff
	and	%l2,0xef5,%l0		! %l0 = 00000000000008c4
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 00000000000008c4
	setx	0x39fa84c7fc18e471,%g7,%l0 ! %l0 = 39fa84c7fc18e471
!	%l1 = ffffffffffffffff
	setx	0x773849a7819a392d,%g7,%l1 ! %l1 = 773849a7819a392d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39fa84c7fc18e471
	setx	0xb96a8ff86dc7f97d,%g7,%l0 ! %l0 = b96a8ff86dc7f97d
!	%l1 = 773849a7819a392d
	setx	0x4bc99e0fd02cbf3e,%g7,%l1 ! %l1 = 4bc99e0fd02cbf3e
!	Mem[00000000300c1410] = ffffffff, %l0 = b96a8ff86dc7f97d
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = ff73921e, %l3 = ffffffffffffffff
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ff73921e
!	Mem[0000000010101408] = 00000000, %f1  = c62981b6
	lda	[%i4+%o4]0x80,%f1 	! %f1 = 00000000
!	Mem[0000000030041408] = 6ba14678, %l3 = 00000000ff73921e
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000078
!	Mem[00000000211c0000] = ff0db6f7, %l5 = 00000000000000a8
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0db6f7, %l3 = 0000000000000078
	ldub	[%o2+0x001],%l3		! %l3 = 000000000000000d
!	Mem[0000000010001400] = 9f12158400000d55, %f12 = b68129c6 7846a16b
	ldda	[%i0+%g0]0x88,%f12	! %f12 = 9f121584 00000d55
!	Starting 10 instruction Store Burst
!	%f16 = 4bb9ae98 45daff2e c6008344 00000d55
!	%f20 = ef000000 ff73921e a007448e a72a66b6
!	%f24 = a8ffffff ce9e00fe 1200ff00 d1030000
!	%f28 = 1891d9c1 ff83ffff f3d48862 df91b5c9
	stda	%f16,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400

p0_label_156:
!	%f13 = 00000d55, Mem[0000000010081400] = 1e9273ff
	st	%f13,[%i2+%g0]		! Mem[0000000010081400] = 00000d55
!	Mem[00000000100c1400] = 00000003, %l2 = 00000000b68129c6
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = a8000000, %l7 = ffffffffad000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010081400] = 00000d55
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000d55
!	Mem[0000000030001400] = 7846a16b, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 0000006b000000ff
!	%l4 = fffffffffffffffe, Mem[0000000030141408] = 00ff0000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = fffe0000
!	Mem[0000000010041408] = fff20000, %l5 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 00000000fff20000
!	%f10 = 2d000000 99bb9ea8, Mem[00000000300c1408] = ef000000 a89ebb99
	stda	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2d000000 99bb9ea8
!	Mem[0000000030101400] = c6298100, %l5 = 00000000fff20000
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000c6298100
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff, %l3 = 000000000000000d
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_157:
!	Mem[0000000010081410] = a80000ff, %f0  = 6ba14678
	lda	[%i2+%o5]0x88,%f0 	! %f0 = a80000ff
!	Mem[00000000201c0000] = ff009a5f, %l6 = ffffffffffffffff
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000030141400] = ff000000, %l6 = ffffffffffffff00
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = a89ebb990000002d, %f14 = ffffffff ff550000
	ldda	[%i3+%o4]0x89,%f14	! %f14 = a89ebb99 0000002d
!	Mem[0000000021800000] = ffffd648, %l0 = 00000000000000ff
	ldsh	[%o3+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030181410] = 2d0000008415129f, %l3 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l3	! %l3 = 2d0000008415129f
!	%l7 = 0000000000000000, %l4 = fffffffffffffffe, %y  = 00000000
	udiv	%l7,%l4,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000010101400] = 000000ff, %l1 = 4bc99e0fd02cbf3e
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 0000ff00, %l1 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010041408] = ffffffff 00000000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff 00000000

p0_label_158:
!	Mem[0000000030141400] = 0000002d000000ff, %f4  = fff25549 ff73921e
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = 0000002d 000000ff
!	Mem[00000000201c0000] = ff009a5f, %l5 = 00000000c6298100
	ldstub	[%o0+%g0],%l5		! %l5 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[000000001008142c] = 000003ff, %asi = 80
	stwa	%l2,[%i2+0x02c]%asi	! Mem[000000001008142c] = 00000000
!	%l0 = ffffffff, %l1 = 0000ff00, Mem[0000000010181418] = b6ff2aa7 8e4407a0
	stda	%l0,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffff 0000ff00
!	%f6  = c6008344 a8000000, %l2 = 0000000000000000
!	Mem[0000000030041408] = 7846a16bff550000
	add	%i1,0x008,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041408] = 7846a16bff550000
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010141400] = 4bb9ae98, %l6 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 0000004b000000ff
!	%f18 = c6008344 00000d55, Mem[0000000030141408] = fffe0000 000000ef
	stda	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = c6008344 00000d55
!	%l2 = 0000000000000000, Mem[0000000010141410] = ef000000
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l0 = ffffffffffffffff, Mem[000000001004142c] = e0000000, %asi = 80
	stwa	%l0,[%i1+0x02c]%asi	! Mem[000000001004142c] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000000, %l1 = 000000000000ff00
	lduwa	[%i1+0x000]%asi,%l1	! %l1 = 00000000ff000000

p0_label_159:
!	Mem[0000000010041408] = ffffffff 00000000, %l2 = 00000000, %l3 = 8415129f
	ldda	[%i1+0x008]%asi,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000021800000] = ffffd648, %l7 = 0000000000000000
	lduh	[%o3+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030001410] = a89ebb99, %l4 = fffffffffffffffe
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = ffffffffa89ebb99
!	%l5 = 00000000000000ff, immed = 000000ff, %y  = ffffffff
	umul	%l5,0x0ff,%l1		! %l1 = 000000000000fe01, %y = 00000000
!	Mem[0000000010081410] = a80000ff, %l6 = 000000000000004b
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000a80000ff
!	Mem[00000000300c1400] = ff9ebb99, %l7 = 000000000000ffff
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 75b0d706 000000ff, %l6 = a80000ff, %l7 = ffffffff
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000075b0d706
!	Mem[00000000211c0000] = ff0db6f7, %l4 = ffffffffa89ebb99
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 448300c6, %l0 = ffffffffffffffff
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000c6
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000fe01, Mem[00000000211c0000] = ff0db6f7, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 010db6f7

p0_label_160:
!	%f24 = a8ffffff ce9e00fe, Mem[0000000010081408] = ad000000 000046ff
	stda	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = a8ffffff ce9e00fe
!	Mem[0000000010081400] = ff000d55, %l7 = 0000000075b0d706
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1400] = ff9ebb99, %f27 = d1030000
	lda	[%i3+%g0]0x81,%f27	! %f27 = ff9ebb99
!	Mem[0000000030181410] = 2d000000, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 000000002d000000
!	Mem[0000000010181410] = 1e9273ff, %l5 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 000000001e9273ff
!	Mem[0000000010001410] = 0000ff00, %l1 = 000000000000fe01
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1420] = d1000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x020]%asi,%l3	! %l3 = 00000000d1000000
!	%l2 = 00000000ffffffff, Mem[0000000030001400] = ffa14678
	stwa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	%f6  = c6008344 a8000000, Mem[0000000010101400] = ff000000 00000000
	stda	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = c6008344 a8000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 448300c6, %l0 = 00000000000000c6
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 00000000448300c6

p0_label_161:
!	Mem[0000000030041410] = ff460000 000000ad, %l4 = 000000ff, %l5 = 1e9273ff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff460000 00000000000000ad
!	Mem[0000000030081400] = 00000000, %l3 = 00000000d1000000
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181400] = ffffda45, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000021800100] = 0049e14a, %l4 = 00000000ff460000
	ldub	[%o3+0x100],%l4		! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010101400] = c6008344 a8000000 00000000 45daff2e
!	Mem[0000000010101410] = d1030000 007f0000 941ec967 00ef0012
!	Mem[0000000010101420] = ff547f31 e837839c 78808330 15840012
!	Mem[0000000010101430] = 440ff950 000000ff 92118061 00000060
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	%l4 = 0000000000000000, imm = 00000000000001fd, %l2 = 00000000ffffffff
	and	%l4,0x1fd,%l2		! %l2 = 0000000000000000
!	Mem[0000000030001400] = ffffffff, %l6 = 00000000000000ff
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030101410] = 0000ff00, %l5 = 00000000000000ad
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[000000001004143c] = 55000049, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x03c]%asi,%l2	! %l2 = 0000000055000049

p0_label_162:
!	Mem[0000000010041400] = ff000000, %l6 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010001410] = 0000ffff, %l2 = 0000000055000049
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000211c0001] = 010db6f7, %l7 = 000000002d000000
	ldstub	[%o2+0x001],%l7		! %l7 = 0000000d000000ff
!	Mem[0000000010041410] = 0d5500ff, %l5 = 000000000000ff00
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (30)
!	%l0 = 00000000448300c6, Mem[0000000010101410] = d1030000007f0000
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000448300c6
!	%l1 = 000000000000ff00, %l0 = 00000000448300c6, %l6 = 00000000000000ff
	subc	%l1,%l0,%l6		! %l6 = ffffffffbb7dfe3a
!	Mem[0000000010101420] = ff547f31, %l3 = 000000000000ffff
	ldstuba	[%i4+0x020]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030141400] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, %l2 = 00000000000000ff, %l7 = 000000000000000d
	orn	%l2,%l2,%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000003 7846a16b, %l6 = bb7dfe3a, %l7 = ffffffff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000ff000003 000000007846a16b

p0_label_163:
!	Mem[0000000030181400] = ff0000009f121584, %l5 = 00000000000000ff
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = ff0000009f121584
!	Mem[0000000010181408] = 00000d55, %l0 = 00000000448300c6
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000055
!	Mem[0000000010181400] = ffffda45 98aeb94b, %l2 = 000000ff, %l3 = 000000ff
	ldd	[%i6+%g0],%l2		! %l2 = 00000000ffffda45 0000000098aeb94b
!	Mem[0000000010081410] = ff0000a8, %l4 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff0000a8
!	Mem[000000001010141c] = 00ef0012, %l3 = 0000000098aeb94b
	ldsb	[%i4+0x01e],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141434] = ff83ffff, %f30 = f3d48862
	lda	[%i5+0x034]%asi,%f30	! %f30 = ff83ffff
!	Mem[0000000030141410] = 0000000049000055, %f0  = c6008344 a8000000
	ldda	[%i5+%o5]0x89,%f0 	! %f0  = 00000000 49000055
!	Mem[00000000300c1410] = ffffffff, %l7 = 000000007846a16b
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = ff0000009f121584, Mem[0000000030101400] = 0000f2ff
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 8400f2ff

p0_label_164:
!	%l6 = 00000000ff000003, Mem[0000000030041400] = 2e0000ff
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 2e000003
!	%l2 = 00000000ffffda45, Mem[0000000010181400] = ffffda45
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = da45da45
!	%l0 = 0000000000000055, Mem[00000000100c1408] = 000000ff
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000055
!	%l6 = 00000000ff000003, Mem[000000001014142f] = d1030000, %asi = 80
	stba	%l6,[%i5+0x02f]%asi	! Mem[000000001014142c] = d1030003
!	%f18 = c6008344 00000d55, %l7 = 00000000000000ff
!	Mem[0000000010181408] = 550d0000448300c6
	add	%i6,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_P ! Mem[0000000010181408] = c600834400000d55
!	Mem[00000000300c1410] = ffffffff, %l1 = 000000000000ff00
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101408] = ad000000
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%f26 = 1200ff00 ff9ebb99, Mem[00000000300c1408] = 0000002d a89ebb99
	stda	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1200ff00 ff9ebb99
!	Mem[0000000010041408] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = a89ebb99, %l6 = 00000000ff000003
	lduha	[%i0+%o5]0x81,%l6	! %l6 = 000000000000a89e

p0_label_165:
!	Mem[0000000030081408] = 2e13ffed, %f6  = 941ec967
	lda	[%i2+%o4]0x89,%f6 	! %f6 = 2e13ffed
!	Mem[0000000010081408] = a8ffffff, %l2 = 00000000ffffda45
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000a8
!	Mem[0000000010181418] = ffffffff, %l5 = ff0000009f121584
	lduwa	[%i6+0x018]%asi,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010041400] = 000000ff, %f30 = ff83ffff
	lda	[%i1+%g0]0x88,%f30	! %f30 = 000000ff
!	Mem[00000000211c0000] = 01ffb6f7, %l1 = 00000000000000ff
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000001ff
!	Mem[0000000030101400] = 9bfa1fd9fff20084, %f2  = 00000000 45daff2e
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = 9bfa1fd9 fff20084
!	Mem[0000000020800040] = ff00978a, %l6 = 000000000000a89e
	ldsb	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 8400f2ff, %l2 = 00000000000000a8
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = ffffffff8400f2ff
!	Mem[0000000010041400] = ff000000, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f28 = 1891d9c1, Mem[0000000010181410] = 000000ff
	sta	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = 1891d9c1

p0_label_166:
!	%f19 = 00000d55, Mem[0000000030141410] = 49000055
	sta	%f19,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000d55
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f12 = 440ff950, Mem[0000000010001414] = 000003d1
	sta	%f12,[%i0+0x014]%asi	! Mem[0000000010001414] = 440ff950
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = 7846a16b
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ff46a16b
!	Mem[000000001018142e] = 00ff0012, %l6 = ffffffffffffffff
	ldstuba	[%i6+0x02e]%asi,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000001ff, Mem[0000000030181410] = 000000ff
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0000ff
!	%l4 = 00000000ff0000a8, Mem[00000000218000c0] = ff3a635c, %asi = 80
	stha	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00a8635c
!	%l5 = 00000000ffffffff, Mem[0000000030101410] = 00ff0000
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff
!	%f0  = 00000000 49000055 9bfa1fd9 fff20084
!	%f4  = d1030000 007f0000 2e13ffed 00ef0012
!	%f8  = ff547f31 e837839c 78808330 15840012
!	%f12 = 440ff950 000000ff 92118061 00000060
	stda	%f0,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000055
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_167:
!	Mem[0000000030001400] = ffffffff c62981b6 66003690 00000000
!	Mem[0000000030001410] = a89ebb99 ff73921e c6008344 a8000000
!	Mem[0000000030001420] = 91000000 000000d1 2d000000 99bb9ea8
!	Mem[0000000030001430] = ff460000 000000ad ffffffff ff550000
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010081410] = a80000ff, %l5 = 00000000ffffffff
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1428] = a89ebb99, %l2 = ffffffff8400f2ff
	ldsba	[%i3+0x02a]%asi,%l2	! %l2 = ffffffffffffffbb
!	Mem[0000000010081410] = ff0000a8, %l2 = ffffffffffffffbb
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = 2effda4598aeb9ff, %l2 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 2effda4598aeb9ff
!	Mem[0000000010081400] = ff000d55, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffff000d55
!	Mem[0000000030141408] = c600834400000d55, %f22 = a007448e a72a66b6
	ldda	[%i5+%o4]0x81,%f22	! %f22 = c6008344 00000d55
!	Mem[0000000010181418] = ffffffff, %l5 = 00000000000000ff
	ldsba	[%i6+0x019]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = 1e9273ff, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 000000001e9273ff
!	Starting 10 instruction Store Burst
!	%l2 = 2effda4598aeb9ff, Mem[0000000010101410] = 00000000
	stba	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000

p0_label_168:
!	%f20 = ef000000 ff73921e, %l2 = 2effda4598aeb9ff
!	Mem[0000000030101438] = 050f1212f92dc578
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101438] = ef000000ff73921e
!	%f2  = 00000000 90360066, %l7 = ffffffffff000d55
!	Mem[0000000010181400] = da45da4598aeb94b
	stda	%f2,[%i6+%l7]ASI_PST8_P ! Mem[0000000010181400] = da00da009836b966
!	Mem[0000000010181410] = 1891d9c1, %l0 = 000000001e9273ff
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 000000001891d9c1
!	Mem[0000000010041408] = ffffffff, %l2 = 2effda4598aeb9ff
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ffffffff
!	%f29 = ff83ffff, Mem[0000000010081408] = a8ffffff
	sta	%f29,[%i2+%o4]0x80	! Mem[0000000010081408] = ff83ffff
!	%l4 = 00000000ff0000a8, Mem[0000000020800040] = ff00978a
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = a800978a
!	Mem[0000000030181408] = 000000ff, %l4 = 00000000ff0000a8
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = 00000055
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000030101400] = 8400f2ff, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 000000008400f2ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff, %l7 = ffffffffff000d55
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_169:
!	Mem[0000000030101410] = ffffffff, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = a80000ff, %l2 = 00000000ffffffff
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000a8
!	Mem[0000000010141408] = c6008344, %l5 = ffffffffffffffff
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffc600
!	Mem[00000000218001c0] = ecffae2e, %l5 = ffffffffffffc600
	lduba	[%o3+0x1c1]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ff73921e, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff73921e
!	Mem[0000000010001410] = 0000ffff, %l1 = 00000000000001ff
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = ff46a16b, %l0 = 000000001891d9c1
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff46a16b
!	%l6 = 000000008400f2ff, immed = fffff6db, %y  = 00000000
	smul	%l6,-0x925,%l0		! %l0 = 0000046de351ea25, %y = 0000046d
!	Mem[0000000010041428] = ffffffff, %l4 = ffffffffffffffff
	lduwa	[%i1+0x028]%asi,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f24 = a8ffffff, Mem[0000000030001400] = ffffffff
	sta	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = a8ffffff

p0_label_170:
!	%f28 = 1891d9c1 ff83ffff, %l0 = 0000046de351ea25
!	Mem[0000000010041408] = 98aeb9ff00000000
	add	%i1,0x008,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_P ! Mem[0000000010041408] = 98aed9ff008300ff
!	%l0 = e351ea25, %l1 = ffffffff, Mem[0000000010101410] = 000000ff c6008344
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = e351ea25 ffffffff
!	%l6 = 000000008400f2ff, Mem[0000000010041400] = ff000000
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%f29 = ff83ffff, Mem[0000000010041408] = ffd9ae98
	sta	%f29,[%i1+%o4]0x88	! Mem[0000000010041408] = ff83ffff
!	%l5 = 00000000000000ff, Mem[0000000010101428] = 7880833015840012, %asi = 80
	stxa	%l5,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[00000000100c1400] = 030000ff
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 030000ff
!	%l5 = 00000000000000ff, Mem[0000000010081400] = ff000d55
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	%f22 = c6008344, Mem[00000000100c1400] = ff000003
	st	%f22,[%i3+%g0]		! Mem[00000000100c1400] = c6008344
!	%l3 = 00000000ff73921e, Mem[0000000010081410] = ffffd103a80000ff
	stxa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000ff73921e
!	Starting 10 instruction Load Burst
!	%f22 = c6008344 00000d55, Mem[0000000010041430] = 0d1b7aff 49e52052
	stda	%f22,[%i1+0x030]%asi	! Mem[0000000010041430] = c6008344 00000d55

p0_label_171:
!	Mem[000000001018143c] = 6288d4f3, %l2 = 00000000000000a8
	lduw	[%i6+0x03c],%l2		! %l2 = 000000006288d4f3
!	Mem[0000000010041408] = ff83ffff, %l7 = ffffffffffffffff
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = ffffffffff83ffff
!	Mem[00000000100c1400] = c6008344, %l1 = ffffffffffffffff
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffc600
!	Mem[0000000030081408] = 8400f2ff, %l0 = 0000046de351ea25
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffff8400
!	Mem[0000000030001408] = 00000000 90360066, %l6 = 8400f2ff, %l7 = ff83ffff
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000090360066 0000000000000000
!	Mem[0000000010041434] = 00000d55, %l2 = 000000006288d4f3
	ldsha	[%i1+0x034]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141430] = 1891d9c1, %l5 = 00000000000000ff
	ldsh	[%i5+0x032],%l5		! %l5 = ffffffffffffd9c1
!	Mem[0000000010001408] = ff000000, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %f30 = 000000ff
	lda	[%i4+%o5]0x81,%f30	! %f30 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 0000ffff, %l4 = 00000000ffffffff
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 000000000000ffff

p0_label_172:
!	%l5 = ffffffffffffd9c1, Mem[0000000010141400] = ffb9ae9845daff2e
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffffffffd9c1
!	Mem[000000001010143f] = 00000060, %l0 = ffffffffffff8400
	ldstuba	[%i4+0x03f]%asi,%l0	! %l0 = 00000060000000ff
!	Mem[0000000010141400] = ffffffff, %l4 = 000000000000ffff
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000100c1410] = ff73921e, %l1 = ffffffffffffc600
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 0000001e000000ff
!	Mem[00000000100c1414] = 4955f2ff, %l3 = 00000000ff73921e
	swap	[%i3+0x014],%l3		! %l3 = 000000004955f2ff
!	Mem[0000000030181400] = ff000000, %l1 = 000000000000001e
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00000000ffffffff, Mem[0000000010001400] = 00000d55
	stha	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ffff
!	%l0 = 0000000000000060, Mem[0000000021800000] = ffffd648, %asi = 80
	stha	%l0,[%o3+0x000]%asi	! Mem[0000000021800000] = 0060d648
!	Mem[0000000030041408] = 6ba146ff, %l4 = 00000000ffffffff
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 000000006ba146ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 99bb9eff, %f8  = d1000000
	lda	[%i3+%g0]0x89,%f8 	! %f8 = 99bb9eff

p0_label_173:
!	Mem[00000000100c143c] = ffffffff, %l0 = 0000000000000060
	ldsb	[%i3+0x03c],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = 448300c6, %l3 = 000000004955f2ff
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffffc6
!	Mem[0000000030081408] = 8400f2ff, %l1 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = ffffffff8400f2ff
!	Mem[0000000030041410] = 000046ff, %l1 = ffffffff8400f2ff
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 00000000000046ff
!	Mem[0000000030141400] = ff000000, %l6 = 0000000090360066
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010041408] = ff008300 ff83ffff, %l0 = ffffffff, %l1 = 000046ff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000ff83ffff 00000000ff008300
!	Mem[0000000030001408] = 6600369000000000, %l2 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = 6600369000000000
!	Mem[00000000100c1408] = ff000000 4955f2ff, %l0 = ff83ffff, %l1 = ff008300
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000ff000000 000000004955f2ff
!	Mem[0000000010181410] = ff73921e, %l5 = ffffffffffffd9c1
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffffff73921e
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff00000045daff2e, %l6 = 00000000ff000000, %l2 = 6600369000000000
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = ff00000045daff2e

p0_label_174:
!	%l5 = ffffffffff73921e, Mem[0000000020800000] = ffff8691
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = 1eff8691
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 6ba146ff, %l5 = ff73921e, Mem[0000000030101410] = ffffffff 99bb9ea8
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 6ba146ff ff73921e
!	%l4 = 000000006ba146ff, Mem[00000000201c0000] = ff009a5f
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 46ff9a5f
!	Mem[000000001018140c] = 00000d55, %l4 = 000000006ba146ff
	swap	[%i6+0x00c],%l4		! %l4 = 0000000000000d55
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041410] = ff00550d 550d0000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	Mem[00000000100c1408] = ff000000, %l3 = ffffffffffffffc6
	ldstuba	[%i3+0x008]%asi,%l3	! %l3 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000021800040] = 0000f914
	sth	%l6,[%o3+0x040]		! Mem[0000000021800040] = 0000f914
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000ff000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff83ffff, %l0 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = ffffffffff83ffff

p0_label_175:
!	Mem[00000000300c1410] = 000000ff ffffffff, %l4 = 00000d55, %l5 = ff73921e
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l1 = 000000004955f2ff
	ldsh	[%i5+%o5],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081410] = 1e9273ff, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 000000001e9273ff
!	Mem[0000000010081410] = ff73921e, %l4 = 00000000ffffffff
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 000000000000001e
!	Mem[0000000030041410] = 000046ff, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = ff00000045daff2e, imm = 0000000000000137, %l2 = ff00000045daff2e
	xor	%l2,0x137,%l2		! %l2 = ff00000045dafe19
!	Mem[0000000010001430] = fff25549000000ff, %f4  = 1e9273ff 99bb9ea8
	ldda	[%i0+0x030]%asi,%f4 	! %f4  = fff25549 000000ff
!	Mem[0000000010181418] = ffffffff0000ff00, %l2 = ff00000045dafe19
	ldx	[%i6+0x018],%l2		! %l2 = ffffffff0000ff00
!	Mem[0000000010041410] = 00000000, %l2 = ffffffff0000ff00
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = 1200ff00, Mem[0000000030101400] = ff000000
	sta	%f26,[%i4+%g0]0x81	! Mem[0000000030101400] = 1200ff00

p0_label_176:
!	%l6 = 0000000000000000, Mem[0000000021800080] = 90fffa8a, %asi = 80
	stha	%l6,[%o3+0x080]%asi	! Mem[0000000021800080] = 0000fa8a
!	%f4  = fff25549 000000ff, %l2 = 0000000000000000
!	Mem[0000000010181410] = 1e9273ff000000ef
	add	%i6,0x010,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181410] = 1e9273ff000000ef
!	%l2 = 0000000000000000, Mem[0000000010181410] = 1e9273ff000000ef
	stxa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	%f30 = ffffffff df91b5c9, %l1 = 00000000000000ff
!	Mem[0000000010101408] = ff00000045daff2e
	add	%i4,0x008,%g1
	stda	%f30,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101408] = c9b591dfffffffff
!	Mem[0000000010041408] = ffff83ff, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ffff83ff
!	%f4  = fff25549 000000ff, Mem[00000000300c1408] = ff9ebb99 1200ff00
	stda	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = fff25549 000000ff
!	Mem[0000000010101410] = e351ea25, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000025000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141408] = 448300c6
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%f20 = ef000000 ff73921e, %l0 = ffffffffff83ffff
!	Mem[00000000300c1428] = e9ed8395fa8a4bdc
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_SL ! Mem[00000000300c1428] = 1e9273ff000000ef
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000000000000000, %f4  = fff25549 000000ff
	ldda	[%i6+%o5]0x88,%f4 	! %f4  = 00000000 00000000

p0_label_177:
!	Mem[00000000300c1410] = 000000ffffffffff, %f28 = 1891d9c1 ff83ffff
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 000000ff ffffffff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030001400] = ffffffa8 c62981b6 66003690 00000000
!	Mem[0000000030001410] = a89ebb99 ff73921e c6008344 a8000000
!	Mem[0000000030001420] = 91000000 000000d1 2d000000 99bb9ea8
!	Mem[0000000030001430] = ff460000 000000ad ffffffff ff550000
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010081408] = ff83ffffce9e00fe, %f8  = 99bb9eff 00000091
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = ff83ffff ce9e00fe
!	Mem[0000000030181408] = a80000ff, %f0  = b68129c6
	lda	[%i6+%o4]0x81,%f0 	! %f0 = a80000ff
!	Mem[0000000010101414] = ffffffff, %l4 = 000000000000001e
	ldsha	[%i4+0x014]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101418] = 941ec967, %l2 = 00000000ffff83ff
	ldub	[%i4+0x01a],%l2		! %l2 = 00000000000000c9
!	Mem[0000000010181408] = 448300c6, %l2 = 00000000000000c9
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 00000000448300c6
!	Mem[0000000020800040] = a800978a, %l0 = ffffffffff83ffff
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081424] = 98aeb94b, %l1 = 00000000000000ff
	lduha	[%i2+0x024]%asi,%l1	! %l1 = 00000000000098ae
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000025, Mem[0000000030141408] = 550d0000000000ff
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000025

p0_label_178:
!	%f2  = 00000000 90360066, Mem[0000000010081410] = ff73921e 00000000
	stda	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 90360066
!	%l2 = 00000000448300c6, Mem[00000000100c1400] = 448300c6
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 448300c6
!	%l1 = 00000000000098ae, Mem[0000000021800140] = ff86154d
	sth	%l1,[%o3+0x140]		! Mem[0000000021800140] = 98ae154d
!	Mem[0000000030141408] = 25000000, %l1 = 00000000000098ae
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 0000000025000000
!	%l2 = 448300c6, %l3 = 1e9273ff, Mem[0000000010141410] = 00000000 ff73921e
	std	%l2,[%i5+%o5]		! Mem[0000000010141410] = 448300c6 1e9273ff
!	Mem[0000000030001400] = a8ffffff, %l3 = 000000001e9273ff
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000a8ffffff
!	%l1 = 0000000025000000, Mem[0000000010181408] = 448300c6
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 44830000
!	Mem[00000000211c0000] = 01ffb6f7, %l3 = 00000000a8ffffff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000001000000ff
!	Mem[0000000010181408] = 44830000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = c6008344, %f3  = 90360066
	lda	[%i5+%o5]0x88,%f3 	! %f3 = c6008344

p0_label_179:
!	Mem[0000000010001410] = ffffffff440ff950, %f2  = 00000000 c6008344
	ldda	[%i0+%o5]0x80,%f2 	! %f2  = ffffffff 440ff950
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000001
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l1 = 0000000025000000
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001000142c] = a72a66b6, %l4 = ffffffffffffffff
	ldsh	[%i0+0x02e],%l4		! %l4 = 00000000000066b6
!	%l3 = ffffffffffffffff, %l3 = ffffffffffffffff, %y  = 0000046d
	sdiv	%l3,%l3,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101410] = ffea51e3, %f12 = ad000000
	lda	[%i4+0x010]%asi,%f12	! %f12 = ffea51e3
!	Mem[00000000100c1408] = ff000000, %f14 = 000055ff
	lda	[%i3+%o4]0x80,%f14	! %f14 = ff000000
!	Mem[0000000010081408] = ff83ffffce9e00fe, %f8  = ff83ffff ce9e00fe
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = ff83ffff ce9e00fe
!	Mem[0000000030081410] = 00007f00000003d1, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = 00007f00000003d1
!	Starting 10 instruction Store Burst
!	%f6  = 000000a8 448300c6, Mem[0000000010001410] = ffffffff 50f90f44
	stda	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000a8 448300c6

p0_label_180:
!	Mem[000000001010143f] = 000000ff, %l3 = ffffffffffffffff
	ldstuba	[%i4+0x03f]%asi,%l3	! %l3 = 000000ff000000ff
!	%l2 = ffffffff80000000, Mem[0000000010081410] = 66003690
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00003690
!	%l6 = 0000000000000000, Mem[0000000021800140] = 98ae154d, %asi = 80
	stha	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = 0000154d
	membar	#Sync			! Added by membar checker (33)
!	%f8  = ff83ffff ce9e00fe, %l3 = 00000000000000ff
!	Mem[0000000030001410] = a89ebb99ff73921e
	add	%i0,0x010,%g1
	stda	%f8,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030001410] = fe009eceffff83ff
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 2e000003
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 2e0000ff
!	%l0 = 00007f00000003d1, Mem[0000000010141408] = c6008344
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = d1008344
!	Mem[0000000030141400] = ff000000, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010141410] = c6008344
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	Mem[0000000010081410] = 00003690, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000003690
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 1200ff00, %f16 = b68129c6
	lda	[%i4+%g0]0x81,%f16	! %f16 = 1200ff00

p0_label_181:
!	Mem[0000000010101410] = ffea51e3ffffffff, %l2 = ffffffff80000000
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = ffea51e3ffffffff
!	Mem[0000000030141408] = 000098ae00000000, %f20 = 1e9273ff 99bb9ea8
	ldda	[%i5+%o4]0x81,%f20	! %f20 = 000098ae 00000000
!	Mem[0000000010181408] = 448300ff, %l0 = 00007f00000003d1
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = ffffffff, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = d1008344, %l7 = 0000000000000025
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 00000000d1008344
!	Mem[0000000030041410] = ff460000, %l7 = 00000000d1008344
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff460000
!	Mem[0000000030081410] = 00007f00000003d1, %l4 = 00000000000066b6
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = 00007f00000003d1
!	Mem[0000000030081400] = 49000055, %l5 = ffffffffffffffff
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000055
!	Mem[000000001000142c] = a72a66b6, %f27 = 0000002d
	lda	[%i0+0x02c]%asi,%f27	! %f27 = a72a66b6
!	Starting 10 instruction Store Burst
!	%f12 = ffea51e3 000046ff, %l7 = 00000000ff460000
!	Mem[0000000010101418] = 941ec96700ef0012
	add	%i4,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_P ! Mem[0000000010101418] = 941ec96700ef0012

p0_label_182:
!	%f7  = 448300c6, Mem[0000000030181408] = ff0000a8
	sta	%f7 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 448300c6
!	%f8  = ff83ffff ce9e00fe, Mem[0000000010001410] = c6008344 a8000000
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff83ffff ce9e00fe
!	%f26 = a89ebb99, Mem[0000000010141424] = ce9e00fe
	st	%f26,[%i5+0x024]	! Mem[0000000010141424] = a89ebb99
!	Mem[0000000030001410] = ce9e00fe, %l5 = 0000000000000055
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000ce9e00fe
!	Mem[0000000010141408] = 448300d1, %l1 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000448300d1
!	%f4  = 00000000 00000000, %l7 = 00000000ff460000
!	Mem[0000000010041408] = 00000000008300ff
	add	%i1,0x008,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_P ! Mem[0000000010041408] = 00000000008300ff
!	%l2 = ffea51e3ffffffff, Mem[0000000010141408] = 00000000
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	%f0  = a80000ff, Mem[0000000010181408] = ff008344
	sta	%f0 ,[%i6+%o4]0x80	! Mem[0000000010181408] = a80000ff
!	%f20 = 000098ae 00000000, Mem[0000000010081408] = ff83ffff ce9e00fe
	stda	%f20,[%i2+%o4]0x80	! Mem[0000000010081408] = 000098ae 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = c1d9ffff0000ffff, %f2  = ffffffff 440ff950
	ldda	[%i5+%g0]0x88,%f2 	! %f2  = c1d9ffff 0000ffff

p0_label_183:
!	Mem[0000000010001410] = fe009eceffff83ff, %l3 = 00000000ff000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = fe009eceffff83ff
!	Mem[0000000030141400] = ff000000, %l6 = 0000000000003690
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f30 = 000055ff, %f26 = a89ebb99
	fcmps	%fcc0,%f30,%f26		! %fcc0 = 2
!	Mem[0000000010181408] = a80000ff, %l1 = 00000000448300d1
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffa80000ff
!	Mem[00000000100c1410] = ff9273ff, %l3 = fe009eceffff83ff
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l7 = 00000000ff460000
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001428] = 78c5f483, %l2 = ffea51e3ffffffff
	ldsh	[%i0+0x028],%l2		! %l2 = 00000000000078c5
!	%f8  = ff83ffff ce9e00fe, %f2  = c1d9ffff 0000ffff
	fxtod	%f8 ,%f2 		! %f2  = c35f0000 0c587fc0
!	Mem[0000000030041408] = ffffffff, %l2 = 00000000000078c5
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[0000000030101410] = 1e9273ffff46a16b
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ffffffff

p0_label_184:
!	%l7 = 00000000000000ff, Mem[0000000030101408] = ff000000
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = ff0000ff
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = 6ba14678448300c6
	stxa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	%l5 = 00000000ce9e00fe, %l3 = 00000000000000ff, %l7 = 00000000000000ff
	sdivx	%l5,%l3,%l7		! %l7 = 0000000000cf6d6e
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010181400] = 00da00da 66b93698
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 000000ff
!	%f4  = 00000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000010041430] = c600834400000d55
	add	%i1,0x030,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041430] = 0000000000000000
!	%f0  = a80000ff ffffffff, Mem[0000000030141408] = ae980000 00000000
	stda	%f0 ,[%i5+%o4]0x89	! Mem[0000000030141408] = a80000ff ffffffff
!	Mem[0000000010001410] = ffff83ff, %l1 = ffffffffa80000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000ffff83ff
!	%l4 = 00007f00000003d1, Mem[0000000010181410] = 0000000000000000
	stx	%l4,[%i6+%o5]		! Mem[0000000010181410] = 00007f00000003d1
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 1255f2ffff000000
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030041400] = ff00002e 00000030 ffffffff ff550000
!	Mem[0000000030041410] = ff460000 000000ad c6008344 c4d69f91
!	Mem[0000000030041420] = 7846a16b 8da16f0f 78c52df9 a72a66b6
!	Mem[0000000030041430] = f3d43e62 df919ec9 78c52df9 12120f05
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400

p0_label_185:
!	Mem[0000000010001410] = a80000ff, %l7 = 0000000000cf6d6e
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = 55000049 00000000 8400f2ff d91ffa9b
!	Mem[0000000030081410] = 00007f00 000003d1 1200ef00 edff132e
!	Mem[0000000030081420] = 9c8337e8 317f54ff 12008415 30838078
!	Mem[0000000030081430] = ff000000 50f90f44 60000000 61801192
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000010081408] = 000098ae00000000, %f14 = ff000000 ffffffff
	ldda	[%i2+%o4]0x80,%f14	! %f14 = 000098ae 00000000
!	Mem[0000000010101408] = c9b591df, %l2 = 00000000ffffffff
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000c9b591df
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000000000ff
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[00000000300c1408] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000ce9e00fe, immd = fffffffffffff826, %l3  = 00000000000000ff
	mulx	%l5,-0x7da,%l3		! %l3 = fffff9a9bb6c35b4
!	%f1  = ffffffff, %f7  = 448300c6, %f5  = 00000000
	fdivs	%f1 ,%f7 ,%f5 		! %f5  = ffffffff
!	Mem[00000000100c1410] = ff7392ff, %l7 = ffffffffff000000
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000ff7392ff
!	Starting 10 instruction Store Burst
!	%f10 = a89ebb99 0000002d, Mem[0000000030101400] = 00ff0012 9bfa1fd9
	stda	%f10,[%i4+%g0]0x89	! Mem[0000000030101400] = a89ebb99 0000002d

p0_label_186:
!	%l2 = 00000000c9b591df, Mem[0000000010081410] = 00000000
	stwa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = c9b591df
	membar	#Sync			! Added by membar checker (35)
!	%l4 = 000003d1, %l5 = ce9e00fe, Mem[0000000030041400] = ff00002e 00000030
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000003d1 ce9e00fe
!	%l2 = 00000000c9b591df, Mem[00000000100c1400] = ff000000
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = df000000
!	Mem[00000000201c0000] = 46ff9a5f, %l3 = fffff9a9bb6c35b4
	ldstub	[%o0+%g0],%l3		! %l3 = 00000046000000ff
!	%l0 = 00000000000000ff, imm = fffffffffffffb83, %l2 = 00000000c9b591df
	orn	%l0,-0x47d,%l2		! %l2 = 00000000000004ff
!	%l7 = 00000000ff7392ff, imm = fffffffffffff677, %l1 = 00000000ffff83ff
	and	%l7,-0x989,%l1		! %l1 = 00000000ff739277
!	%f1  = ffffffff, Mem[0000000010081410] = df91b5c9
	sta	%f1 ,[%i2+0x010]%asi	! Mem[0000000010081410] = ffffffff
!	%f23 = edff132e, Mem[0000000010141408] = ff000000
	sta	%f23,[%i5+%o4]0x80	! Mem[0000000010141408] = edff132e
!	%l6 = 00000000000000ff, Mem[0000000030041410] = ad000000000046ff
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 66003690, %l3 = 0000000000000046
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 0000000066003690

p0_label_187:
!	Mem[0000000010041400] = ff000000, %l1 = 00000000ff739277
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1424] = 00000091, %l6 = 00000000000000ff
	lduw	[%i3+0x024],%l6		! %l6 = 0000000000000091
!	%l4 = 00007f00000003d1, Mem[0000000030041408] = ffffffff
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff03d1
!	Mem[0000000030001410] = 55000000, %l0 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000055
!	Mem[0000000010101414] = ffffffff, %l6 = 0000000000000091
	lduha	[%i4+0x014]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010181400] = ffffffff, %l7 = 00000000ff7392ff
	lduwa	[%i6+0x000]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030141410] = 550d0000, %l6 = 000000000000ffff
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = 00000000550d0000
!	Mem[0000000030041410] = 000000ff, %l3 = 0000000066003690
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = c6008344, %l5 = 00000000ce9e00fe
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffc6008344
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffc6008344, Mem[0000000030001410] = 00000055
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = c6008344

p0_label_188:
!	%l0 = 0000000000000055, Mem[0000000030041400] = 000003d1
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000055
!	Mem[00000000201c0001] = ffff9a5f, %l3 = 00000000000000ff
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	%l4 = 000003d1, %l5 = c6008344, Mem[0000000010041410] = 00000000 00000000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 000003d1 c6008344
!	%l4 = 00007f00000003d1, %l6 = 00000000550d0000, %l4 = 00007f00000003d1
	andn	%l4,%l6,%l4		! %l4 = 00007f00000003d1
!	%l2 = 000004ff, %l3 = 000000ff, Mem[0000000010101410] = e351eaff ffffffff
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000004ff 000000ff
!	Mem[0000000010001408] = 000000ff, %l4 = 00007f00000003d1
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l5 = ffffffffc6008344, Mem[0000000010101408] = df91b5c9
	stha	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = df918344
!	%l4 = 000000ff, %l5 = c6008344, Mem[0000000010001410] = ff0000a8 ce9e00fe
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff c6008344
!	%f0  = a80000ff ffffffff, %l2 = 00000000000004ff
!	Mem[0000000010081430] = ad000000000046ff
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081430] = ffffffffff0000a8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 448300c6, %l2 = 00000000000004ff
	lduba	[%i3+0x01e]%asi,%l2	! %l2 = 0000000000000000

p0_label_189:
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000055
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff, %l0 = ffffffffffffffff
	lduba	[%i5+0x012]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181438] = c9b591df, %f13 = 000046ff
	ld	[%i6+0x038],%f13	! %f13 = c9b591df
!	Mem[0000000030141408] = ffffffff, %l6 = 00000000550d0000
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = ffff0000, %l1 = 000000000000ff00
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000030101410] = 00000000ffffffff, %l1 = ffffffffffff0000
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000300c1410] = ffffffff, %l6 = ffffffffffffffff
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c143c] = ffffffff, %l6 = ffffffffffffffff
	ldsh	[%i3+0x03e],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[0000000010101408] = 448391df, %asi = 80
	stha	%l1,[%i4+0x008]%asi	! Mem[0000000010101408] = ffff91df

p0_label_190:
!	%f4  = 00000000 ffffffff, Mem[00000000300c1410] = ffffffff 000000ff
	stda	%f4 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 ffffffff
!	%f16 = 55000049 00000000 8400f2ff d91ffa9b
!	%f20 = 00007f00 000003d1 1200ef00 edff132e
!	%f24 = 9c8337e8 317f54ff 12008415 30838078
!	%f28 = ff000000 50f90f44 60000000 61801192
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Mem[0000000010101408] = ffff91df, %l7 = 00000000ffffffff
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ffff91df
!	%l3 = 00000000000000ff, %l6 = ffffffffffffffff, %y  = 00000000
	smul	%l3,%l6,%l4		! %l4 = ffffffffffffff01, %y = ffffffff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010001400] = ffff0000, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ffff0000
!	%f20 = 00007f00 000003d1, Mem[0000000010141400] = ffff0000 ffffd9c1
	stda	%f20,[%i5+%g0]0x80	! Mem[0000000010141400] = 00007f00 000003d1
!	%f24 = 9c8337e8, %f17 = 00000000, %f16 = 55000049
	fmuls	%f24,%f17,%f16		! %f16 = 80000000
!	Mem[0000000030081408] = 8400f2ff, %l3 = 00000000ffff0000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000084000000ff
!	%f15 = 00000000, %f26 = 12008415
	fitos	%f15,%f26		! %f26 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_191:
!	Mem[0000000030081400] = 49000055, %l5 = ffffffffc6008344
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000055
!	Mem[0000000010081410] = ffffffff00000000, %l3 = 0000000000000084
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = ffffffff00000000
!	Mem[000000001014140c] = 00000d55, %l1 = 00000000ffffffff
	ldsha	[%i5+0x00e]%asi,%l1	! %l1 = 0000000000000d55
!	Mem[0000000010001410] = ff000000, %l6 = ffffffffffffffff
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 550d0000, %l7 = 00000000ffff91df
	lduba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000055
!	Mem[00000000100c1434] = 00000000, %l4 = ffffffffffffff01
	ldswa	[%i3+0x034]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 5500004900000000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 5500004900000000
!	Mem[0000000030001408] = 9bfa1fd9, %l1 = 0000000000000d55
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 000000000000009b
!	Mem[00000000211c0000] = ffffb6f7, %l6 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 5500004900000000, Mem[0000000010181410] = 00007f00
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000

p0_label_192:
!	Mem[0000000030081400] = 55000049, %l5 = 0000000000000055
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000055000049
!	Mem[0000000030041400] = 00000055, %l5 = 0000000055000049
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000055
!	%l1 = 000000000000009b, Mem[0000000030181408] = 448300c6
	stba	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 4483009b
!	%l0 = 0000000000000000, Mem[00000000300c1410] = ffffffff
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ffffff
!	%l0 = 0000000000000000, Mem[00000000201c0001] = ffff9a5f, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff009a5f
!	Mem[0000000030101400] = 2d000000, %l1 = 000000000000009b
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 000000002d000000
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000055
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 5500004900000000, Mem[000000001014142a] = 1200ff00, %asi = 80
	stba	%l4,[%i5+0x02a]%asi	! Mem[0000000010141428] = 12000000
!	%l0 = 0000000000000000, Mem[0000000010001410] = 448300c6ff000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %f12 = ffea51e3
	lda	[%i2+%o5]0x88,%f12	! %f12 = ffffffff

p0_label_193:
!	Mem[00000000300c1400] = ff9ebb99 0000002d, %l0 = 00000000, %l1 = 2d000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff9ebb99 000000000000002d
!	Mem[0000000030101400] = 0000009b 99bb9ea8, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 000000000000009b 0000000099bb9ea8
!	Mem[0000000030181408] = 4483009b, %f4  = 00000000
	lda	[%i6+%o4]0x89,%f4 	! %f4 = 4483009b
!	Mem[0000000010141408] = 2e13ffed, %l6 = ffffffffffffffff
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 000000000000ffed
!	Mem[0000000010041400] = ff000000, %f21 = 000003d1
	lda	[%i1+%g0]0x80,%f21	! %f21 = ff000000
!	%l0 = 00000000ff9ebb99, immed = 00000eee, %y  = ffffffff
	smul	%l0,0xeee,%l0		! %l0 = fffffffa53d4c63e, %y = fffffffa
!	Mem[0000000010181408] = ff46a16bff0000a8, %f2  = c35f0000 0c587fc0
	ldda	[%i6+%o4]0x88,%f2 	! %f2  = ff46a16b ff0000a8
!	Mem[00000000100c1410] = ff9273ff, %f15 = 00000000
	lda	[%i3+%o5]0x80,%f15	! %f15 = ff9273ff
!	Mem[0000000010141410] = ff0000ff, %f24 = 9c8337e8
	lda	[%i5+%o5]0x88,%f24	! %f24 = ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff000000, %l5 = 0000000099bb9ea8
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000ff000000

p0_label_194:
!	Mem[0000000010101400] = c6008344, %l7 = 0000000000000055
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 00000000c6008344
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181438] = c9b591df 6288d4f3
	stda	%l2,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 00000000
!	%l0 = fffffffa53d4c63e, Mem[000000001010142c] = 000000ff
	stw	%l0,[%i4+0x02c]		! Mem[000000001010142c] = 53d4c63e
!	%l0 = fffffffa53d4c63e, Mem[0000000010081408] = 000098ae
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 3e0098ae
!	%l4 = 0000009b, %l5 = ff000000, Mem[0000000010041408] = 00000000 008300ff
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000009b ff000000
!	%f10 = a89ebb99 0000002d, Mem[0000000010101418] = 941ec967 00ef0012
	stda	%f10,[%i4+0x018]%asi	! Mem[0000000010101418] = a89ebb99 0000002d
!	%l5 = 00000000ff000000, Mem[00000000300c1400] = ff9ebb99
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 009ebb99
!	%l7 = 00000000c6008344, Mem[0000000030181408] = 4483009b
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 44838344
!	%l6 = 0000ffed, %l7 = c6008344, Mem[0000000010081400] = a89ebb99 99bb9ea8
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ffed c6008344
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_195:
!	Mem[0000000010001400] = 9f121584 ff000000, %l6 = 0000ffed, %l7 = c6008344
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000ff000000 000000009f121584
!	Mem[0000000030181408] = 44838344, %l7 = 000000009f121584
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000004483
!	Mem[0000000010041410] = d1030000, %l6 = 00000000ff000000
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 55000049, %f5  = ffffffff
	lda	[%i1+%g0]0x81,%f5 	! %f5 = 55000049
!	Mem[00000000100c1420] = 00000000, %l1 = 000000000000002d
	ldsb	[%i3+0x023],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041408] = ffff03d1, %l0 = fffffffa53d4c63e
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000003d1
!	Mem[0000000010081420] = 00000000 98aeb94b, %l0 = 000003d1, %l1 = 00000000
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 0000000000000000 0000000098aeb94b
!	Mem[0000000030101400] = a89ebb999b000000, %f10 = a89ebb99 0000002d
	ldda	[%i4+%g0]0x89,%f10	! %f10 = a89ebb99 9b000000
!	Mem[0000000030141410] = 0000000000000d55, %f28 = ff000000 50f90f44
	ldda	[%i5+%o5]0x89,%f28	! %f28 = 00000000 00000d55
!	Starting 10 instruction Store Burst
!	%f8  = ff83ffff ce9e00fe, %l7 = 0000000000004483
!	Mem[0000000030041420] = 7846a16b8da16f0f
	add	%i1,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_S ! Mem[0000000030041420] = ff83ffffce9e00fe

p0_label_196:
!	Mem[00000000100c1413] = ff9273ff, %l7 = 0000000000004483
	ldstuba	[%i3+0x013]%asi,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[000000001000140c] = 00000000
	stw	%l2,[%i0+0x00c]		! Mem[000000001000140c] = 00000000
!	Mem[0000000010101410] = 000004ff, %l4 = 000000000000009b
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000000004ff
!	Mem[000000001010142c] = 53d4c63e, %l7 = 00000000000000ff
	ldsb	[%i4+0x02f],%l7		! %l7 = 000000000000003e
!	%f12 = ffffffff c9b591df, %l6 = 0000000000000000
!	Mem[0000000010081408] = 3e0098ae00000000
	add	%i2,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_P ! Mem[0000000010081408] = 3e0098ae00000000
!	%l4 = 00000000000004ff, %l1 = 0000000098aeb94b, %l3 = ffffffff00000000
	xnor	%l4,%l1,%l3		! %l3 = ffffffff6751424b
!	Mem[0000000010041400] = 000000ff, %l3 = ffffffff6751424b
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010101400] = 55000000
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%f14 = 000098ae ff9273ff, Mem[00000000100c1408] = ff000000 4955f2ff
	stda	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000098ae ff9273ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000df, %l4 = 00000000000004ff
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000df

p0_label_197:
!	Mem[0000000010181430] = ffff83ffc1d99118, %f16 = 80000000 00000000
	ldda	[%i6+0x030]%asi,%f16	! %f16 = ffff83ff c1d99118
!	Mem[0000000020800000] = 1eff8691, %l3 = 00000000000000ff
	ldsb	[%o1+%g0],%l3		! %l3 = 000000000000001e
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 0000000000000000
	setx	0xc72472af8dd5b79a,%g7,%l0 ! %l0 = c72472af8dd5b79a
!	%l1 = 0000000098aeb94b
	setx	0x32f7768face58225,%g7,%l1 ! %l1 = 32f7768face58225
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c72472af8dd5b79a
	setx	0x193cfe80393e3719,%g7,%l0 ! %l0 = 193cfe80393e3719
!	%l1 = 32f7768face58225
	setx	0x3e96db0ff5b965b6,%g7,%l1 ! %l1 = 3e96db0ff5b965b6
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	%l6 = ffffffffffffffff, imm = 00000000000008bd, %l2 = 0000000000000000
	xor	%l6,0x8bd,%l2		! %l2 = fffffffffffff742
!	Mem[00000000100c1400] = df000000, %f28 = 00000000
	lda	[%i3+0x000]%asi,%f28	! %f28 = df000000
!	Mem[0000000010001410] = 00000000, %l5 = 00000000ff000000
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141424] = a89ebb99, %l7 = 000000000000003e
	lduwa	[%i5+0x024]%asi,%l7	! %l7 = 00000000a89ebb99
!	Mem[0000000010101410] = 0000009b, %l4 = 00000000000000df
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 000000000000009b
!	Starting 10 instruction Store Burst
!	%f17 = c1d99118, Mem[0000000010101410] = 9b000000
	sta	%f17,[%i4+0x010]%asi	! Mem[0000000010101410] = c1d99118

p0_label_198:
!	%f14 = 000098ae, %f0  = a80000ff ffffffff
	fstod	%f14,%f0 		! %l0 = 193cfe80393e373b, Unfinished, %fsr = 2c00000800
!	Mem[0000000010141408] = edff132e, %l3 = 000000000000001e
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000edff132e
!	Mem[0000000010141410] = ff0000ff, %l1 = 3e96db0ff5b965b6
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1410] = ff9273ff, %l4 = 000000000000009b
	ldstub	[%i3+%o5],%l4		! %l4 = 000000ff000000ff
!	%f14 = 000098ae, Mem[0000000030081408] = ff00f2ff
	sta	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = 000098ae
!	%f0  = a80000ff ffffffff ff46a16b ff0000a8
!	%f4  = 4483009b 55000049 000000a8 448300c6
!	%f8  = ff83ffff ce9e00fe a89ebb99 9b000000
!	%f12 = ffffffff c9b591df 000098ae ff9273ff
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	%f0  = a80000ff ffffffff ff46a16b ff0000a8
!	%f4  = 4483009b 55000049 000000a8 448300c6
!	%f8  = ff83ffff ce9e00fe a89ebb99 9b000000
!	%f12 = ffffffff c9b591df 000098ae ff9273ff
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l3 = 00000000edff132e, Mem[0000000030041408] = d103ffff
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 132effff
!	%l2 = fffff742, %l3 = edff132e, Mem[0000000010081408] = 3e0098ae 00000000
	stda	%l2,[%i2+0x008]%asi	! Mem[0000000010081408] = fffff742 edff132e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff 2d000000, %l6 = ffffffff, %l7 = a89ebb99
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff 000000002d000000

p0_label_199:
!	Mem[0000000030101410] = ffffffff, %l1 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010141410] = ff0000ff 1e9273ff, %l0 = 393e373b, %l1 = 0000ffff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff0000ff 000000001e9273ff
!	Mem[0000000030141410] = 00000d55, %l6 = 00000000000000ff
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000055
!	%l6 = 0000000000000055, immd = fffffffffffff2a5, %l0 = 00000000ff0000ff
	sdivx	%l6,-0xd5b,%l0		! %l0 = 0000000000000000
!	Mem[00000000218001c0] = ecffae2e, %l0 = 0000000000000000
	lduha	[%o3+0x1c0]%asi,%l0	! %l0 = 000000000000ecff
!	Mem[0000000030101410] = 00000000ffffffff, %f28 = df000000 00000d55
	ldda	[%i4+%o5]0x89,%f28	! %f28 = 00000000 ffffffff
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010041408] = 6ba146ff, %f24 = ff0000ff
	lda	[%i1+%o4]0x88,%f24	! %f24 = 6ba146ff
!	Mem[0000000030041408] = ffff2e13, %l7 = 000000002d000000
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000013
!	%l7 = 0000000000000013, %l5 = 0000000000000000, %l3 = 00000000edff132e
	udivx	%l7,%l5,%l3		! Div by zero, %l0 = 000000000000ed4f
!	Starting 10 instruction Store Burst
!	%l0 = 0000ed27, %l1 = 1e9273ff, Mem[0000000010001400] = ff000000 9f121584
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ed27 1e9273ff

p0_label_200:
!	%l0 = 000000000000ed27, Mem[0000000010181408] = 6ba146ff
	stwa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ed27
!	%l7 = 0000000000000013, %l0 = 000000000000ed27, %l1 = 000000001e9273ff
	xor	%l7,%l0,%l1		! %l1 = 000000000000ed34
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000055
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 99bb9e00, %l1 = 000000000000ed34
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = edff0000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000edff0000
!	%l6 = 00000000edff0000, %l7 = 0000000000000013, %l3 = 00000000edff132e
	xor	%l6,%l7,%l3		! %l3 = 00000000edff0013
!	%l6 = edff0000, %l7 = 00000013, Mem[0000000010041420] = ff83ffff ce9e00fe
	std	%l6,[%i1+0x020]		! Mem[0000000010041420] = edff0000 00000013
!	%l3 = 00000000edff0013, Mem[00000000201c0000] = ff009a5f
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 13009a5f
!	Mem[0000000010081408] = fffff742, %l0 = 000000000000ed27
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000fffff742
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000edff0000
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_201:
!	Mem[00000000100c1408] = ae980000, %l7 = 0000000000000013
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 9b000000, %l6 = ffffffffffffffff
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 000000009b000000
!	Mem[00000000100c1408] = 000098ae, %l3 = 00000000edff0013
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ffffffff, %l6 = 000000009b000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 55000000, %f31 = 61801192
	lda	[%i4+%g0]0x88,%f31	! %f31 = 55000000
!	Mem[0000000010181410] = 4483009b, %l0 = 00000000fffff742
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 000000004483009b
!	Mem[00000000100c1408] = ff7392ffae980000, %f14 = 000098ae ff9273ff
	ldda	[%i3+%o4]0x88,%f14	! %f14 = ff7392ff ae980000
!	Mem[0000000010181410] = 4483009b, %l4 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 000000004483009b
!	Mem[00000000100c1408] = 000098aeff9273ff, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 000098aeff9273ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181438] = 000098ae
	stw	%l1,[%i6+0x038]		! Mem[0000000010181438] = 00000000

p0_label_202:
!	Mem[000000001014142a] = 12000000, %l1 = 0000000000000000
	ldstub	[%i5+0x02a],%l1		! %l1 = 00000000000000ff
!	%l4 = 000000004483009b, Mem[0000000030181410] = ff0000ff
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 9b0000ff
!	%l2 = fffff742, %l3 = ff9273ff, Mem[0000000030001400] = 00000000 55000049
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = fffff742 ff9273ff
!	Mem[0000000030001410] = d1030000 007f0000, %l2 = fffff742, %l3 = ff9273ff
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000d1030000 00000000007f0000
!	Mem[0000000030101410] = ffffffff, %l3 = 00000000007f0000
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	%l0 = 000000004483009b, Mem[0000000010001408] = ff00000000000000
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000004483009b
!	%l0 = 000000004483009b, Mem[0000000030181400] = ff0000009f121584
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000004483009b
!	%l3 = 00000000ffffffff, Mem[0000000030001400] = fffff742
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = fffff7ff
!	Mem[0000000010081410] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000a855000000, %f28 = 00000000 ffffffff
	ldda	[%i4+%g0]0x88,%f28	! %f28 = 000000a8 55000000

p0_label_203:
!	Mem[0000000030081400] = 00000055, %l7 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000055
!	Mem[00000000201c0000] = 13009a5f, %l7 = 0000000000000055
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000001300
!	Mem[0000000010041408] = 6ba146ff, %l7 = 0000000000001300
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 00000000000046ff
!	Mem[0000000030141400] = 000000ff, %f8  = ff83ffff
	lda	[%i5+%g0]0x81,%f8 	! %f8 = 000000ff
!	Mem[00000000100c1420] = 0000000000000091, %f6  = 000000a8 448300c6
	ldd	[%i3+0x020],%f6 	! %f6  = 00000000 00000091
!	Mem[0000000030141400] = ff000000, %f19 = d91ffa9b
	lda	[%i5+%g0]0x89,%f19	! %f19 = ff000000
!	Mem[0000000030081400] = 0000000055000000, %f28 = 000000a8 55000000
	ldda	[%i2+%g0]0x89,%f28	! %f28 = 00000000 55000000
!	Mem[0000000030101400] = 0000009b 99bb9ea8, %l6 = ffffffff, %l7 = 000046ff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000000000009b 0000000099bb9ea8
!	Mem[0000000010101408] = ffffffff, %l7 = 0000000099bb9ea8
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 0000ed27, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000027000000ff

p0_label_204:
!	%l6 = 000000000000009b, Mem[00000000100c1408] = 000098ae
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 009b98ae
!	%l4 = 000000004483009b, Mem[0000000010081408] = 0000ed27edff132e
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000004483009b
!	Mem[0000000030081400] = 55000000, %l3 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 550000ff, %l2 = 00000000d1030000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000020800040] = a800978a, %l2 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000a8000000ff
!	Mem[0000000030001408] = 9bfa1fd9, %l6 = 000000000000009b
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000009b000000ff
!	%l7 = ffffffffffffffff, Mem[00000000300c1410] = 00ffffff
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff
!	%f6  = 00000000 00000091, Mem[0000000030041410] = ff000000 00000000
	stda	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 00000091
!	%f10 = a89ebb99 9b000000, Mem[00000000100c1408] = ae989b00 ff7392ff
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = a89ebb99 9b000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = ff0000a8, %l0 = 000000004483009b
	ldub	[%i2+0x036],%l0		! %l0 = 0000000000000000

p0_label_205:
!	Mem[0000000030001400] = fff7ffff ff7392ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000fff7ffff 00000000ff7392ff
!	Mem[0000000010181400] = ff0000a8, %l0 = 00000000fff7ffff
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000a8
!	Mem[0000000010001414] = 00000000, %l4 = 000000004483009b
	lduwa	[%i0+0x014]%asi,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010181400] = a80000ff ffffffff ffed0000 ff0000a8
!	Mem[0000000010181410] = 4483009b 55000049 000000a8 448300c6
!	Mem[0000000010181420] = ff83ffff ce9e00fe a89ebb99 9b000000
!	Mem[0000000010181430] = ffffffff c9b591df 00000000 ff9273ff
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010141410] = ff0000ff, %l3 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c140c] = 99bb9ea8, %l5 = 0000000000000027
	lduh	[%i3+0x00e],%l5		! %l5 = 0000000000009ea8
!	Mem[0000000010141410] = ff0000ff, %l3 = ffffffffffffffff
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff0000ff
!	Mem[0000000010101400] = 000000a855000000, %f30 = 60000000 55000000
	ldda	[%i4+%g0]0x88,%f30	! %f30 = 000000a8 55000000
!	Mem[0000000030181410] = ff00009b, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 000000000000009b
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000a8, Mem[0000000030041408] = 132effff
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000a8

p0_label_206:
!	Mem[00000000300c1408] = ff000000, %l5 = 0000000000009ea8
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l3 = ffffffffff0000ff, Mem[0000000010141410] = ff0000ff
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff0000ff
!	Mem[0000000030181400] = 00000000, %l1 = 00000000ff7392ff
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 000000000000009b, Mem[0000000030141410] = 00000d55
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000d9b
!	%f30 = 000000a8, Mem[0000000030081408] = 000098ae
	sta	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000a8
!	%f30 = 000000a8, Mem[0000000030041410] = 00000000
	sta	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000a8
!	%f21 = ff000000, Mem[0000000030041400] = 55000049
	sta	%f21,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%l6 = 0000009b, %l7 = ffffffff, Mem[0000000030181400] = 000000ff 9b008344
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000009b ffffffff
!	%f27 = 30838078, Mem[0000000010001410] = 00000000
	sta	%f27,[%i0+%o5]0x88	! Mem[0000000010001410] = 30838078
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff00000000, %l0 = 00000000000000a8
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffffffff00000000

p0_label_207:
!	Mem[0000000010001408] = 00000000, %l0 = ffffffff00000000
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0x34609dd7bcddc893,%g7,%l0 ! %l0 = 34609dd7bcddc893
!	%l1 = 0000000000000000
	setx	0xd588c1001d464288,%g7,%l1 ! %l1 = d588c1001d464288
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 34609dd7bcddc893
	setx	0x6a2e973877798a4d,%g7,%l0 ! %l0 = 6a2e973877798a4d
!	%l1 = d588c1001d464288
	setx	0x58f705200db0110a,%g7,%l1 ! %l1 = 58f705200db0110a
!	Mem[0000000010141400] = 00007f00000003d1, %f22 = 1200ef00 edff132e
	ldda	[%i5+%g0]0x80,%f22	! %f22 = 00007f00 000003d1
!	Mem[00000000100c1418] = 000000a8, %l6 = 000000000000009b
	ldsha	[%i3+0x01a]%asi,%l6	! %l6 = 00000000000000a8
!	Mem[0000000010041408] = ff46a16b, %f19 = ff000000
	lda	[%i1+%o4]0x80,%f19	! %f19 = ff46a16b
!	Mem[0000000010041410] = 490000559b008344, %l6 = 00000000000000a8
	ldxa	[%i1+%o5]0x88,%l6	! %l6 = 490000559b008344
!	Mem[0000000010181418] = 000000a8, %l4 = 000000000000009b
	ldsb	[%i6+0x01b],%l4		! %l4 = ffffffffffffffa8
!	Mem[0000000010001400] = 0000ed27, %l1 = 58f705200db0110a
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffed27
!	%l3 = ffffffffff0000ff, immd = fffffffffffff913, %l0  = 6a2e973877798a4d
	mulx	%l3,-0x6ed,%l0		! %l0 = 00000006ecf919ed
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 99bb9eff, %l1 = ffffffffffffed27
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_208:
!	%f20 = 00007f00, Mem[0000000030081410] = 00007f00
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 00007f00
!	%l5 = 00000000000000ff, Mem[0000000030181410] = 9b0000ff
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff00ff
!	%f8  = ff83ffff ce9e00fe, %l3 = ffffffffff0000ff
!	Mem[0000000010001428] = 78c5f483a72a66b6
	add	%i0,0x028,%g1
	stda	%f8,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010001428] = fe009eceffff83ff
!	Mem[0000000030141400] = 000000ff, %l4 = ffffffffffffffa8
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010101410] = c1d99118 ff000000
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 000000ff
!	%l0 = 00000006ecf919ed, Mem[0000000010141410] = ff0000ff
	stw	%l0,[%i5+%o5]		! Mem[0000000010141410] = ecf919ed
!	Mem[0000000010181408] = ffed0000, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%f4  = 4483009b, Mem[0000000010081434] = ff0000a8
	sta	%f4 ,[%i2+0x034]%asi	! Mem[0000000010081434] = 4483009b
!	%l6 = 9b008344, %l7 = ffffffff, Mem[0000000030141400] = a8ffffff 0000002d
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 9b008344 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = fff25549000000ff, %l4 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = fff25549000000ff

p0_label_209:
!	Mem[0000000030101410] = 007f0000, %l3 = ffffffffff0000ff
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030041400] = ff000000 ce9e00fe 000000a8 ff550000
!	Mem[0000000030041410] = a8000000 00000091 c6008344 c4d69f91
!	Mem[0000000030041420] = ff83ffff ce9e00fe 78c52df9 a72a66b6
!	Mem[0000000030041430] = f3d43e62 df919ec9 78c52df9 12120f05
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000030041400] = ff000000 ce9e00fe, %l2 = 000000a8, %l3 = ffffffff
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff000000 00000000ce9e00fe
!	Mem[0000000010041410] = 9b008344, %l3 = 00000000ce9e00fe
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000044
!	Mem[0000000010041420] = edff000000000013, %l7 = ffffffffffffffff
	ldxa	[%i1+0x020]%asi,%l7	! %l7 = edff000000000013
!	Mem[0000000030081400] = ff00005500000000, %l2 = 00000000ff000000
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = ff00005500000000
!	Mem[0000000021800100] = 0049e14a, %l0 = 00000006ecf919ed
	ldub	[%o3+0x100],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l3 = 0000000000000044
	ldsha	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 ff9273ff, %l0 = 0000000000000000
!	Mem[00000000100c1428] = a89ebb990000002d
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_P ! Mem[00000000100c1428] = a89ebb990000002d

p0_label_210:
!	Mem[0000000030081408] = 000000a8, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f0  = a80000ff ffffffff, Mem[0000000010181408] = 0000edff a80000ff
	stda	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = a80000ff ffffffff
!	%f8  = ff83ffff ce9e00fe, %l3 = 00000000000000ff
!	Mem[0000000010041438] = 000098aeff9273ff
	add	%i1,0x038,%g1
	stda	%f8,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041438] = ff83ffffce9e00fe
!	%l4 = fff25549000000ff, Mem[0000000010081410] = ffffffff
	stha	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff00ff
!	Mem[0000000030181410] = ff00ff00, %l4 = fff25549000000ff
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff00ff00
!	%l1 = 00000000000000ff, imm = fffffffffffff209, %l3 = 00000000000000ff
	andn	%l1,-0xdf7,%l3		! %l3 = 00000000000000f6
!	%l3 = 00000000000000f6, Mem[0000000021800140] = 0000154d
	sth	%l3,[%o3+0x140]		! Mem[0000000021800140] = 00f6154d
!	%l6 = 490000559b008344, Mem[0000000010041410] = 9b008344
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 9b008344
!	%f10 = a89ebb99, Mem[0000000010041400] = a80000ff
	sta	%f10,[%i1+%g0]0x80	! Mem[0000000010041400] = a89ebb99
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_211:
!	Mem[00000000211c0000] = ffffb6f7, %l5 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = ed19f9ec, %l5 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l5	! %l5 = 000000000000f9ec
!	Mem[00000000300c1410] = ffffffff, %l1 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001410] = d1030000, %l7 = edff000000000013
	ldswa	[%i0+%o5]0x81,%l7	! %l7 = ffffffffd1030000
!	%l0 = 0000000000000000, imm = 0000000000000ef4, %l6 = 490000559b008344
	add	%l0,0xef4,%l6		! %l6 = 0000000000000ef4
!	Mem[0000000030041410] = 000000a8, %l4 = 00000000ff00ff00
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000a8
!	Mem[0000000010041410] = 490000559b008344, %l2 = ff00005500000000
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 490000559b008344
!	Mem[0000000030001400] = fff7ffff, %l2 = 490000559b008344
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 000000000000fff7
!	Mem[0000000010141434] = ff83ffff, %l1 = 000000000000ffff
	lduh	[%i5+0x036],%l1		! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 00002eff, %l2 = 000000000000fff7, %asi = 80
	swapa	[%i0+0x020]%asi,%l2	! %l2 = 0000000000002eff

p0_label_212:
!	Mem[0000000030101408] = ff0000ff, %l4 = 00000000000000a8
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff0000ff
!	Mem[000000001004143c] = ce9e00fe, %l2 = 00002eff, %l6 = 00000ef4
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000ce9e00fe
!	%l2 = 00002eff, %l3 = 000000f6, Mem[00000000100c1410] = ff7392ff 1e9273ff
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00002eff 000000f6
!	Mem[0000000021800180] = 17ff9b10, %l2 = 0000000000002eff
	ldstub	[%o3+0x180],%l2		! %l2 = 00000017000000ff
!	%l6 = 00000000ce9e00fe, Mem[0000000010041400] = 99bb9ea8
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 99bb00fe
!	Mem[0000000010041400] = fe00bb99, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 000000fe000000ff
!	%f12 = ffffffff c9b591df, %l0 = 00000000000000fe
!	Mem[0000000030081428] = 1200841530838078
	add	%i2,0x028,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_S ! Mem[0000000030081428] = ffffffff30838078
!	%l4 = 00000000ff0000ff, %l1 = 000000000000ffff, %l2 = 0000000000000017
	udivx	%l4,%l1,%l2		! %l2 = 000000000000ff01
!	Mem[0000000030141400] = 4483009b, %l0 = 00000000000000fe
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 000000004483009b
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000055, %l5 = 000000000000f9ec
	lduha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_213:
!	Mem[0000000010181408] = a80000ffffffffff, %l7 = ffffffffd1030000
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = a80000ffffffffff
!	Mem[00000000218001c0] = ecffae2e, %l5 = 0000000000000000
	lduba	[%o3+0x1c1]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 007f0000, %l4 = 00000000ff0000ff
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l1 = 000000000000ffff
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l3 = 00000000000000f6
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f8  = ff83ffff, %f17 = 000000ff, %f24 = fe009ece ffff83ff
	fsmuld	%f8 ,%f17,%f24		! %f24 = fff87fff e0000000
!	Mem[0000000010101408] = ffffffffffffffff, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041408] = a80000ff6ba146ff, %f14 = 00000000 ff9273ff
	ldda	[%i1+%o4]0x88,%f14	! %f14 = a80000ff 6ba146ff
!	Mem[00000000300c1400] = ff9ebb99 0000002d ff000000 4955f2ff
!	Mem[00000000300c1410] = ffffffff 00000000 0ec602c6 3e081c37
!	Mem[00000000300c1420] = 01ec8a13 e925ff50 1e9273ff 000000ef
!	Mem[00000000300c1430] = 3031db6a a13b2a6d 9ccb0aa5 f810a75a
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	%f16 = fe009ece 000000ff, %l4 = 0000000000000000
!	Mem[0000000010041420] = edff000000000013
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010041420] = edff000000000013

p0_label_214:
!	%l6 = 00000000ce9e00fe, Mem[0000000030141408] = ffffffff
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ce9e00fe
!	%f19 = a8000000, Mem[0000000010041408] = 6ba146ff
	sta	%f19,[%i1+%o4]0x88	! Mem[0000000010041408] = a8000000
!	%f31 = f92dc578, %f20 = 91000000
	fcmpes	%fcc3,%f31,%f20		! %fcc3 = 1
!	%l6 = ce9e00fe, %l7 = ffffffff, Mem[0000000010041438] = ff83ffff ce9e00fe
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = ce9e00fe ffffffff
!	%l5 = 00000000000000ff, Mem[0000000010101410] = ff000000
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000030001408] = fffa1fd9
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff1fd9
!	%l7 = a80000ffffffffff, Mem[0000000030001408] = d91fff00
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
!	%l7 = a80000ffffffffff, Mem[0000000010141400] = 007f0000
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 007f00ff
!	%l0 = 4483009b, %l1 = 000000ff, Mem[0000000010101430] = 440ff950 000000ff
	std	%l0,[%i4+0x030]		! Mem[0000000010101430] = 4483009b 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000a8ff0000a8, %l7 = a80000ffffffffff
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = 000000a8ff0000a8

p0_label_215:
!	Mem[0000000010181400] = a80000ff, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffa8
!	Mem[00000000211c0000] = ffffb6f7, %l5 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = fe009ece 000000ff, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000fe009ece
!	Mem[0000000010181400] = ff0000a8, %l7 = 000000a8ff0000a8
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ff0000a8
!	Mem[00000000300c1408] = ff000000, %l2 = 000000000000ff01
	ldswa	[%i3+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[00000000100c1430] = 5500004900000000, %f22 = 919fd6c4 448300c6
	ldda	[%i3+0x030]%asi,%f22	! %f22 = 55000049 00000000
!	Mem[00000000100c143c] = ffffffff, %l6 = 00000000ce9e00fe
	ldsw	[%i3+0x03c],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 99bb00ff, %l3 = ffffffffffffffa8
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = fffffffffff20084, %l1 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = fffffffffff20084
!	Starting 10 instruction Store Burst
!	%l5 = 00000000fe009ece, Mem[0000000010081408] = 00000000
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ce000000

p0_label_216:
!	Mem[0000000030041410] = a8000000, %l7 = 00000000ff0000a8
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000a8000000
!	Mem[0000000010141410] = ecf919ed1e9273ff, %l1 = fffffffffff20084, %l1 = fffffffffff20084
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = ecf919ed1e9273ff
!	%f16 = fe009ece 000000ff, %l6 = ffffffffffffffff
!	Mem[0000000030181408] = 4483834406d7b075
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181408] = fe009ece000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101408] = ffffffff
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000030181410] = ff000000, %l7 = 00000000a8000000
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%f24 = fff87fff e0000000, Mem[0000000030101400] = 0000009b 99bb9ea8
	stda	%f24,[%i4+%g0]0x81	! Mem[0000000030101400] = fff87fff e0000000
!	%l2 = ffffffffff000000, Mem[0000000010141400] = 007f00ff
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 007f0000
!	Mem[0000000010081400] = 00000000, %l2 = ffffffffff000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l5 = 00000000fe009ece, Mem[0000000010081400] = ff000000
	stb	%l5,[%i2+%g0]		! Mem[0000000010081400] = ce000000
!	Starting 10 instruction Load Burst
!	%f18 = 000055ff, %f27 = f92dc578
	fcmpes	%fcc1,%f18,%f27		! %fcc1 = 2

p0_label_217:
!	Mem[0000000021800080] = 0000fa8a, %l2 = 0000000000000000
	ldsha	[%o3+0x080]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = fe009ece, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ce
!	Mem[0000000010001434] = 000000ff, %l0 = 000000004483009b
	lduha	[%i0+0x034]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 9b0d0000 00000000, %l4 = 000000ce, %l5 = fe009ece
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 000000009b0d0000 0000000000000000
!	%f2  = ff000000, %f24 = fff87fff, %f1  = 0000002d
	fadds	%f2 ,%f24,%f1 		! %f1  = fff87fff
!	%l4 = 000000009b0d0000, imm = fffffffffffffce8, %l6 = ffffffffffffffff
	xnor	%l4,-0x318,%l6		! %l6 = 000000009b0d0317
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000a8d91ffa9b, %f18 = 000055ff a8000000
	ldda	[%i2+%o4]0x81,%f18	! %f18 = ff0000a8 d91ffa9b
!	Mem[0000000010081408] = ce000000, %l7 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ce
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = 0049e14a, %l2 = 0000000000000000
	ldstuba	[%o3+0x101]%asi,%l2	! %l2 = 00000049000000ff

p0_label_218:
!	%l0 = ffffffffffffffff, Mem[00000000211c0000] = ffffb6f7, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffffb6f7
!	%f22 = 55000049, %f26 = b6662aa7
	fcmpes	%fcc3,%f22,%f26		! %fcc3 = 2
!	%l3 = 00000000000000ff, Mem[0000000010041408] = a8000000
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = a80000ff
!	%f10 = 1e9273ff, Mem[0000000010041410] = 9b008344
	sta	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 1e9273ff
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f20 = 91000000 000000a8, Mem[0000000010081438] = 050f1212 f92dc578
	stda	%f20,[%i2+0x038]%asi	! Mem[0000000010081438] = 91000000 000000a8
	membar	#Sync			! Added by membar checker (40)
!	%l0 = ffffffff, %l1 = 1e9273ff, Mem[0000000030041400] = ff000000 ce9e00fe
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff 1e9273ff
!	%l4 = 000000009b0d0000, Mem[0000000010101410] = ff000000000000ff, %asi = 80
	stxa	%l4,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000009b0d0000
!	%l5 = 0000000000000000, Mem[0000000030181410] = ff0000008415129f
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_219:
!	Mem[0000000010141438] = f3d48862 df91b5c9, %l4 = 9b0d0000, %l5 = 00000000
	ldd	[%i5+0x038],%l4		! %l4 = 00000000f3d48862 00000000df91b5c9
!	Mem[0000000010001400] = 1e9273ff 0000ed27, %l4 = f3d48862, %l5 = df91b5c9
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 000000000000ed27 000000001e9273ff
!	Mem[00000000300c1410] = ffffffff, %f17 = 000000ff
	lda	[%i3+%o5]0x89,%f17	! %f17 = ffffffff
!	Mem[00000000300c1410] = ffffffff 00000000, %l2 = 00000049, %l3 = 00000000
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030101410] = 007f0000, %l5 = 000000001e9273ff
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 000000000000007f
!	Mem[0000000030001400] = fff7ffff, %l7 = 00000000000000ce
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ff000055 00000000, %l6 = 9b0d0317, %l7 = ffffffff
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000055 0000000000000000
!	Mem[0000000010081410] = ffff00ff, %l5 = 000000000000007f
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ff73921e, %f12 = 3031db6a
	lda	[%i1+%o5]0x80,%f12	! %f12 = ff73921e
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000ff000000ff

p0_label_220:
!	Mem[0000000030081408] = ff0000a8, %l1 = ecf919ed1e9273ff
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ff0000a8
!	%f26 = b6662aa7 f92dc578, Mem[0000000010141408] = 0000001e 00000d55
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = b6662aa7 f92dc578
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030081410] = 00007f00 000003d1
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff 00000000
!	Mem[000000001008140c] = 4483009b, %l7 = 0000000000000000
	swap	[%i2+0x00c],%l7		! %l7 = 000000004483009b
!	%f6  = 0ec602c6 3e081c37, %l0 = ffffffffffffffff
!	Mem[0000000030181430] = bcd0b58201510486
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_S ! Mem[0000000030181430] = 0ec602c63e081c37
!	%l3 = 0000000000000000, Mem[0000000010141408] = 78c52df9a72a66b6
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%f16 = fe009ece ffffffff ff0000a8 d91ffa9b
!	%f20 = 91000000 000000a8 55000049 00000000
!	%f24 = fff87fff e0000000 b6662aa7 f92dc578
!	%f28 = c99e91df 623ed4f3 050f1212 f92dc578
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[0000000030001400] = fffff7ff, %l7 = 000000004483009b
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000fffff7ff
!	%f9  = e925ff50, Mem[0000000010001408] = 9bfa1fd9
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = e925ff50
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = 00000000, %l4 = 000000000000ed27
	ldsh	[%i3+0x006],%l4		! %l4 = 0000000000000000

p0_label_221:
!	Mem[0000000030141408] = ce9e00fe, %l0 = ffffffffffffffff
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ce
!	Mem[0000000010141410] = ff73921e ed19f9ec, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000ed19f9ec 00000000ff73921e
!	Code Fragment 4
p0_fragment_23:
!	%l0 = 00000000000000ce
	setx	0x9ee83f484804ef21,%g7,%l0 ! %l0 = 9ee83f484804ef21
!	%l1 = 00000000ff0000a8
	setx	0xbd9a4b1f843a3eb6,%g7,%l1 ! %l1 = bd9a4b1f843a3eb6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9ee83f484804ef21
	setx	0xed495180744c8f9c,%g7,%l0 ! %l0 = ed495180744c8f9c
!	%l1 = bd9a4b1f843a3eb6
	setx	0x67f3ed604af9e3fb,%g7,%l1 ! %l1 = 67f3ed604af9e3fb
!	Mem[0000000030041408] = 000000a8, %l0 = ed495180744c8f9c
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000a8
!	Mem[00000000100c1400] = 000000df, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000df
!	Mem[0000000030001400] = ff9273ff4483009b, %f6  = 0ec602c6 3e081c37
	ldda	[%i0+%g0]0x89,%f6 	! %f6  = ff9273ff 4483009b
!	Mem[0000000030041408] = a8000000, %l2 = 00000000ed19f9ec
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = ffffffffa8000000
	membar	#Sync			! Added by membar checker (41)
!	Mem[000000001000143c] = 12120f05, %l5 = 00000000000000df
	lduw	[%i0+0x03c],%l5		! %l5 = 0000000012120f05
!	Mem[00000000218001c0] = ecffae2e, %l2 = ffffffffa8000000
	ldsb	[%o3+0x1c1],%l2		! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff

p0_label_222:
!	%l6 = 00000000ff000055, Mem[00000000201c0000] = 13009a5f
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00559a5f
!	%f22 = 55000049 00000000, %l2 = 0000000000000000
!	Mem[0000000010081430] = ffffffff4483009b
	add	%i2,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010081430] = ffffffff4483009b
!	Mem[0000000010041428] = a89ebb99, %l1 = 4af9e3fb, %l0 = 000000a8
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000a89ebb99
!	%f16 = fe009ece ffffffff, %l7 = 00000000fffff7ff
!	Mem[00000000100c1408] = 0000009b99bb9ea8
	add	%i3,0x008,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1408] = ffffffffce9e00fe
!	Mem[0000000030141410] = 00000d9b, %l6 = 00000000ff000055
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000d9b
!	%l1 = 67f3ed604af9e3fb, Mem[00000000211c0001] = ffffb6f7
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = fffbb6f7
!	%f0  = ff9ebb99 fff87fff ff000000 4955f2ff
!	%f4  = ffffffff 00000000 ff9273ff 4483009b
!	%f8  = 01ec8a13 e925ff50 1e9273ff 000000ef
!	%f12 = ff73921e a13b2a6d 9ccb0aa5 f810a75a
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l1 = 67f3ed604af9e3fb, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = e3fb0000
!	%l5 = 0000000012120f05, Mem[0000000010101400] = 00000055
	stb	%l5,[%i4+%g0]		! Mem[0000000010101400] = 05000055
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000030041408] = ff0000004955f2ff, %f28 = c99e91df 623ed4f3
	ldda	[%i1+%o4]0x89,%f28	! %f28 = ff000000 4955f2ff

p0_label_223:
!	%l6 = 0000000000000d9b, %l4 = 0000000000000000, %l3 = 00000000ff73921e
	subc	%l6,%l4,%l3		! %l3 = 0000000000000d9b
!	Mem[0000000010001400] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i0+0x000]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010041408] = ff0000a8, %l5 = 0000000012120f05
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = 0000fbe3, %l2 = 00000000ffffffff
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 000000000000fbe3
!	Mem[0000000030181408] = fe009ece000000ff, %f6  = ff9273ff 4483009b
	ldda	[%i6+%o4]0x81,%f6 	! %f6  = fe009ece 000000ff
!	Mem[0000000010081410] = 00000000 ffff00ff, %l2 = 0000fbe3, %l3 = 00000d9b
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000ffff00ff 0000000000000000
!	Mem[000000001010141c] = 0000002d, %f30 = 050f1212
	lda	[%i4+0x01c]%asi,%f30	! %f30 = 0000002d
!	Mem[0000000010001430] = f3d43e62, %l2 = 00000000ffff00ff
	ldsw	[%i0+0x030],%l2		! %l2 = fffffffff3d43e62
!	Mem[0000000010081430] = ffffffff, %l2 = fffffffff3d43e62
	ldsha	[%i2+0x032]%asi,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f28 = ff000000 4955f2ff, %l7 = 00000000fffff7ff
!	Mem[0000000010181410] = 4483009b55000049
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181410] = fff25549000000ff

p0_label_224:
!	%l5 = ffffffffffffffff, Mem[0000000010081400] = 000000ce
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 00000000a89ebb99
	setx	0x87996b17a253cbbe,%g7,%l0 ! %l0 = 87996b17a253cbbe
!	%l1 = 67f3ed604af9e3fb
	setx	0xfff3f0afc4576130,%g7,%l1 ! %l1 = fff3f0afc4576130
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 87996b17a253cbbe
	setx	0x8a8d93c859703c15,%g7,%l0 ! %l0 = 8a8d93c859703c15
!	%l1 = fff3f0afc4576130
	setx	0xf483a0a05db7b76c,%g7,%l1 ! %l1 = f483a0a05db7b76c
!	Mem[0000000010001410] = a8000000, %l6 = 0000000000000d9b
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000a8000000ff
!	%l6 = 00000000000000a8, Mem[0000000030001400] = 9b008344ff7392ff
	stxa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000a8
!	Mem[0000000010001400] = ffffffff, %l5 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030041410] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000fffff7ff, Mem[0000000030181400] = 9b000000
	stba	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010041400] = ff00bb99, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff00bb99
!	%l6 = 00000000000000a8, Mem[0000000010101410] = 000000ff
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000a8
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000 00007f00, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000007f00 0000000000000000

p0_label_225:
!	Mem[0000000010141400] = 00007f00000003d1, %f24 = fff87fff e0000000
	ldda	[%i5+%g0]0x80,%f24	! %f24 = 00007f00 000003d1
!	Mem[0000000030181400] = 000000ff, %l4 = 0000000000007f00
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 55000005, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 0000000055000005
!	Mem[0000000030081408] = 9bfa1fd9 ff73921e, %l2 = ff00bb99, %l3 = 00000000
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000ff73921e 000000009bfa1fd9
!	Mem[0000000020800000] = 1eff8691, %l5 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l5	! %l5 = 000000000000001e
!	Mem[0000000030181408] = ce9e00fe, %l4 = 0000000055000005
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = ffffffffce9e00fe
!	Mem[0000000030181408] = fe009ece, %l3 = 000000009bfa1fd9
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = fffffffffffffffe
!	Mem[0000000010101400] = 05000055 a8000000, %l2 = ff73921e, %l3 = fffffffe
	ldda	[%i4+0x000]%asi,%l2	! %l2 = 0000000005000055 00000000a8000000
!	%l0 = 8a8d93c859703c15, %l5 = 000000000000001e, %l5 = 000000000000001e
	or	%l0,%l5,%l5		! %l5 = 8a8d93c859703c1f
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 05000055, %l0 = 8a8d93c859703c15
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 0000000005000055

p0_label_226:
!	%l2 = 05000055, %l3 = a8000000, Mem[0000000010141418] = a007448e a72a66b6
	stda	%l2,[%i5+0x018]%asi	! Mem[0000000010141418] = 05000055 a8000000
!	Mem[0000000010101400] = 153c7059, %l7 = 00000000fffff7ff
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000059000000ff
!	%f3  = 4955f2ff, Mem[0000000030141410] = 550000ff
	sta	%f3 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 4955f2ff
!	%l2 = 05000055, %l3 = a8000000, Mem[0000000010101400] = ff703c15 a8000000
	std	%l2,[%i4+%g0]		! Mem[0000000010101400] = 05000055 a8000000
!	Mem[0000000010081400] = ffffffff, %l4 = ffffffffce9e00fe
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	%f18 = ff0000a8 d91ffa9b, %l0 = 0000000005000055
!	Mem[00000000100c1418] = 000000a8448300c6
	add	%i3,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_P ! Mem[00000000100c1418] = 000000a8d91ffa9b
!	%l6 = 00000000000000a8, Mem[0000000030041400] = ff7ff8ff99bb9eff
	stxa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000a8
!	%l5 = 8a8d93c859703c1f, Mem[0000000010041424] = 00000013
	stw	%l5,[%i1+0x024]		! Mem[0000000010041424] = 59703c1f
!	%f6  = fe009ece 000000ff, Mem[0000000010181410] = 4955f2ff ff000000
	stda	%f6 ,[%i6+%o5]0x88	! Mem[0000000010181410] = fe009ece 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff00ffff, %l3 = 00000000a8000000
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ff00ffff

p0_label_227:
!	Mem[0000000010001400] = ffffffff, %l0 = 0000000005000055
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = 000000ff, %l1 = f483a0a05db7b76c
	ldswa	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = ce000000, %l5 = 8a8d93c859703c1f
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 000000000000ce00
!	Mem[0000000020800000] = 1eff8691, %l4 = 00000000ffffffff
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = 000000000000001e
!	Mem[0000000010181400] = ff0000a8, %f24 = 00007f00
	lda	[%i6+%g0]0x88,%f24	! %f24 = ff0000a8
!	Mem[0000000030001408] = ffffffff, %f15 = f810a75a
	lda	[%i0+%o4]0x81,%f15	! %f15 = ffffffff
!	Mem[0000000030041410] = 000000ff, %f16 = fe009ece
	lda	[%i1+%o5]0x89,%f16	! %f16 = 000000ff
!	Mem[0000000010101410] = 000000a8, %l0 = ffffffffffffffff
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000a8
!	Mem[0000000030101410] = 00007f00, %f7  = 000000ff
	lda	[%i4+%o5]0x89,%f7 	! %f7 = 00007f00
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000059, Mem[00000000100c1430] = 5500004900000000
	stx	%l7,[%i3+0x030]		! Mem[00000000100c1430] = 0000000000000059

p0_label_228:
!	%l5 = 000000000000ce00, Mem[0000000010101410] = 000000a8
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ce00
!	Mem[000000001004143c] = ffffffff, %l1 = 000000ff, %l6 = 000000a8
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000020800000] = 1eff8691, %l7 = 0000000000000059
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 0000001e000000ff
!	Mem[00000000100c1408] = ffffffff, %l7 = 000000000000001e
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l0 = 00000000000000a8, Mem[0000000030141408] = fe009ece
	stba	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = fe009ea8
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010041410] = 1e9273ff 49000055
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff 000000ff
!	%l0 = 00000000000000a8, Mem[00000000100c1417] = f6000000
	stb	%l0,[%i3+0x017]		! Mem[00000000100c1414] = f60000a8
!	Mem[0000000010081408] = ce000000, %l2 = 0000000005000055
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ce000000
!	Mem[0000000010001410] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l6 = 00000000ffffffff
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ff00

p0_label_229:
!	Mem[0000000010101400] = 05000055, %l6 = 000000000000ff00
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 0000000005000055
!	Mem[0000000010001400] = ffffffff, %l2 = 00000000ce000000
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = ff0000a8 ff0000a8, %l2 = ffffffff, %l3 = ff00ffff
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff0000a8 00000000ff0000a8
!	Mem[00000000300c1408] = 000000ff, %l0 = 00000000000000a8
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000005000055
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = a80000ff, %l3 = 00000000ff0000a8
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 00000000a80000ff
!	Mem[0000000010141400] = 00007f00, %l0 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000007f00
!	Mem[0000000010001400] = ffffffffce9e00fe, %l1 = 00000000000000ff
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffce9e00fe
!	Mem[00000000201c0000] = 00559a5f, %l3 = 00000000a80000ff
	ldsb	[%o0+0x001],%l3		! %l3 = 0000000000000055
!	Starting 10 instruction Store Burst
!	%f25 = 000003d1, %f16 = 000000ff ffffffff
	fstod	%f25,%f16		! %l0 = 0000000000007f22, Unfinished, %fsr = 2e00000800

p0_label_230:
!	Mem[0000000030041410] = ff000000, %l3 = 0000000000000055
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[000000001018141c] = 448300c6, %l5 = 000000000000ce00, %asi = 80
	swapa	[%i6+0x01c]%asi,%l5	! %l5 = 00000000448300c6
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = ffffffffce9e00fe
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[00000000201c0001] = 00559a5f, %l4 = 000000000000001e
	ldstub	[%o0+0x001],%l4		! %l4 = 00000055000000ff
!	Mem[0000000010141400] = 00007f00, %l5 = 00000000448300c6
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000007f00
!	Mem[00000000100c1408] = 00000000, %l1 = ffffffffce9e00fe
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[000000001014140c] = 00000000, %l7 = 00000000000000ff
	ldstub	[%i5+0x00c],%l7		! %l7 = 00000000000000ff
!	%f4  = ffffffff 00000000, Mem[00000000100c1438] = 000055ff ffffffff
	stda	%f4 ,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffffffff 00000000
!	Mem[00000000300c1408] = 000000ff, %l5 = 0000000000007f00
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ecf919ed, %f15 = ffffffff
	lda	[%i5+%o5]0x80,%f15	! %f15 = ecf919ed

p0_label_231:
!	Mem[0000000010141408] = e3fb0000, %l2 = 00000000ff0000a8
	ldsba	[%i5+%o4]0x80,%l2	! %l2 = ffffffffffffffe3
!	%l6 = ffffffffffffffff, imm = fffffffffffff247, %l1 = 0000000000000000
	xnor	%l6,-0xdb9,%l1		! %l1 = fffffffffffff247
!	Mem[00000000201c0000] = 00ff9a5f, %l4 = 0000000000000055
	ldsh	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101428] = 00000000 53d4c63e, %l2 = ffffffe3, %l3 = ff000000
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 0000000000000000 0000000053d4c63e
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000007f22
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ff, %f20 = 91000000
	lda	[%i3+%o4]0x89,%f20	! %f20 = 000000ff
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030041400] = 00000000 000000a8 fff25549 000000ff
!	Mem[0000000030041410] = 00000055 ffffffff 9b008344 ff7392ff
!	Mem[0000000030041420] = 50ff25e9 138aec01 ef000000 ff73921e
!	Mem[0000000030041430] = 6d2a3ba1 1e9273ff 5aa710f8 a50acb9c
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[00000000211c0000] = fffbb6f7, %l6 = ffffffffffffffff
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000053d4c63e, Mem[000000001004142a] = a89ebb99, %asi = 80
	stha	%l3,[%i1+0x02a]%asi	! Mem[0000000010041428] = a89ec63e

p0_label_232:
!	%l6 = ffffffffffffffff, Mem[0000000010081408] = 55000005
	stha	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 5500ffff
!	Mem[0000000020800000] = ffff8691, %l6 = ffffffffffffffff
	ldstub	[%o1+%g0],%l6		! %l6 = 000000ff000000ff
!	%f6  = fe009ece 00007f00, %l7 = 0000000000000000
!	Mem[0000000030081430] = ff00000050f90f44
	add	%i2,0x030,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_S ! Mem[0000000030081430] = ff00000050f90f44
!	%f14 = 9ccb0aa5, Mem[0000000010181428] = a89ebb99
	st	%f14,[%i6+0x028]	! Mem[0000000010181428] = 9ccb0aa5
!	Mem[0000000030141400] = 000000fe, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000fe
!	%f8  = 01ec8a13 e925ff50, Mem[0000000030101410] = 00007f00 00000000
	stda	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 01ec8a13 e925ff50
!	Mem[0000000030181410] = 00000000, %l2 = 00000000000000fe
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%f8  = 01ec8a13 e925ff50, Mem[0000000030101408] = 000000a8 55000000
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 01ec8a13 e925ff50
!	Mem[00000000100c1400] = df000000, %l5 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000df000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = c6008344, %l6 = 00000000000000ff
	lduwa	[%i2+0x004]%asi,%l6	! %l6 = 00000000c6008344

p0_label_233:
!	Mem[00000000300c1408] = ff0000004955f2ff, %l1 = fffffffffffff247
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ff0000004955f2ff
!	Mem[0000000030141408] = a89e00feff0000a8, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = a89e00feff0000a8
!	Mem[0000000030081408] = 9bfa1fd9ff73921e, %l4 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l4	! %l4 = 9bfa1fd9ff73921e
!	Mem[000000001000140c] = a80000ff, %l1 = ff0000004955f2ff
	lduba	[%i0+0x00f]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l1 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001010141c] = 0000002d, %l1 = 0000000000000000
	ldsba	[%i4+0x01c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 000003d1, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000003d1
!	Mem[0000000030141408] = a89e00fe ff0000a8, %l2 = 00000000, %l3 = 53d4c63e
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000a89e00fe 00000000ff0000a8
!	Mem[0000000010101408] = ff000000, %l7 = a89e00feff0000a8
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ecf919ed, %l4 = 9bfa1fd9ff73921e
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ec000000ff

p0_label_234:
!	Mem[0000000030081408] = ff73921e, %l2 = 00000000a89e00fe
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = ffffffffff73921e
!	Mem[0000000030081408] = 1e9273ff, %l1 = 00000000000003d1
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000001e000000ff
!	%l2 = ffffffffff73921e, Mem[00000000100c1438] = ffffffff00000000, %asi = 80
	stxa	%l2,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffffffffff73921e
!	Mem[0000000030001400] = 00000000, %l6 = 00000000c6008344
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffffff73921e, %l7 = 00000000ff000000, %l4 = 00000000000000ec
	xor	%l2,%l7,%l4		! %l4 = ffffffff0073921e
!	%f12 = ff73921e a13b2a6d, Mem[0000000010141400] = 448300c6 000003d1
	stda	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = ff73921e a13b2a6d
!	%l2 = ffffffffff73921e, Mem[0000000010081410] = ff00ffff
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 1e00ffff
!	Mem[0000000010001410] = ff000000, %l2 = ffffffffff73921e
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%f10 = 1e9273ff 000000ef, Mem[0000000010081410] = ffff001e 00000000
	stda	%f10,[%i2+%o5]0x88	! Mem[0000000010081410] = 1e9273ff 000000ef
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff, %f12 = ff73921e
	lda	[%i3+%o4]0x88,%f12	! %f12 = 000000ff

p0_label_235:
!	Mem[0000000010101418] = a89ebb99 0000002d, %l0 = 00000000, %l1 = 0000001e
	ldd	[%i4+0x018],%l0		! %l0 = 00000000a89ebb99 000000000000002d
!	Mem[0000000010081400] = ce9e00fe, %f10 = 1e9273ff
	lda	[%i2+0x000]%asi,%f10	! %f10 = ce9e00fe
!	%f5  = 00000000, %f1  = fff87fff
	fcmpes	%fcc1,%f5 ,%f1 		! %fcc1 = 3
!	Mem[0000000010141410] = fff919ed, %l1 = 000000000000002d
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	%l5 = 00000000000000df, %l1 = ffffffffffffffff, %l2 = 00000000000000ff
	xor	%l5,%l1,%l2		! %l2 = ffffffffffffff20
!	Mem[00000000100c1424] = 00000091, %l1 = ffffffffffffffff
	ldsba	[%i3+0x024]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 55000005, %l3 = 00000000ff0000a8
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000005
!	Mem[0000000010101400] = 05000055, %l3 = 0000000000000005
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 0000000005000055
!	Mem[00000000201c0000] = 00ff9a5f, %l2 = ffffffffffffff20
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041408] = ff0000a8
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_236:
!	%l1 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%f10 = ce9e00fe 000000ef, Mem[0000000010101420] = ff547f31 e837839c
	stda	%f10,[%i4+0x020]%asi	! Mem[0000000010101420] = ce9e00fe 000000ef
!	Mem[00000000300c1410] = ffffffff, %l3 = 0000000005000055
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181400] = a80000ff, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l6	! %l6 = 00000000a80000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[0000000030041408] = fff25549, %l5 = 00000000000000df
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 00000000fff25549
!	%f9  = e925ff50, Mem[0000000010001400] = ffffffff
	sta	%f9 ,[%i0+%g0]0x80	! Mem[0000000010001400] = e925ff50
!	%f14 = 9ccb0aa5 ecf919ed, Mem[0000000010101408] = 000000ff ffffffff
	stda	%f14,[%i4+%o4]0x88	! Mem[0000000010101408] = 9ccb0aa5 ecf919ed
!	Mem[000000001000140f] = a80000ff, %l3 = 00000000000000ff
	ldstub	[%i0+0x00f],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff9a5f, %l0 = 00000000a89ebb99
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_237:
!	Mem[0000000030001400] = c6008344, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = ffffffffc6008344
!	Mem[0000000020800000] = ffff8691, %l4 = ffffffff0073921e
	ldub	[%o1+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 00000000ffffffff, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030081410] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = ffffffff00000000, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff00000000
!	Mem[00000000100c1400] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = ce9e00fe, %l6 = 00000000a80000ff
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = ffffffffce9e00fe
!	Mem[0000000010041400] = 00000000, %l5 = 00000000fff25549
	ldswa	[%i1+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = ff000000, Mem[0000000010141424] = a89ebb99
	st	%f2 ,[%i5+0x024]	! Mem[0000000010141424] = ff000000

p0_label_238:
!	Mem[00000000100c1410] = 00002eff, %l0 = ffffffff00000000
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000002eff
!	Mem[0000000030001410] = 000003d1, %l6 = ffffffffce9e00fe
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000000003d1
!	%f20 = ffffffff 55000000, Mem[00000000100c1400] = 000000ff 00000000
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff 55000000
!	%f1  = fff87fff, Mem[0000000030181400] = 000000ff
	sta	%f1 ,[%i6+%g0]0x89	! Mem[0000000030181400] = fff87fff
!	Mem[0000000010081408] = ffff005500000000, %l6 = 00000000000003d1, %l2 = 00000000ffffffff
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = ffff005500000000
!	%l2 = ffff005500000000, Mem[0000000010001410] = ff00000000000091, %asi = 80
	stxa	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = ffff005500000000
!	Mem[0000000030041408] = 000000df000000ff, %l7 = 00000000ff000000
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = 000000df000000ff
!	%l6 = 000003d1, %l7 = 000000ff, Mem[0000000010141400] = ff73921e a13b2a6d
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000003d1 000000ff
!	%f6  = fe009ece 00007f00, %l5 = 0000000000000000
!	Mem[0000000010081420] = 0000000098aeb94b
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081420] = 0000000098aeb94b
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %l1 = ffffffffc6008344
	andn	%l5,%l5,%l1		! %l1 = 0000000000000000

p0_label_239:
!	Mem[0000000030041410] = 55000000, %l4 = ffffffffffffffff
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041420] = edff0000, %l3 = ffffffffffffffff
	lduh	[%i1+0x020],%l3		! %l3 = 000000000000edff
!	Mem[0000000010141400] = ff000000d1030000, %l7 = 000000df000000ff
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = ff000000d1030000
!	Mem[00000000211c0000] = fffbb6f7, %l2 = ffff005500000000
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000fb
!	Mem[0000000030101410] = 01ec8a13e925ff50, %l2 = 00000000000000fb
	ldxa	[%i4+%o5]0x89,%l2	! %l2 = 01ec8a13e925ff50
!	Mem[0000000020800040] = ff00978a, %l0 = 0000000000002eff
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 50ff25e9 138aec01, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 0000000050ff25e9 00000000138aec01
!	Mem[0000000010001400] = e925ff50, %l0 = 0000000050ff25e9
	ldswa	[%i0+0x000]%asi,%l0	! %l0 = ffffffffe925ff50
!	Mem[0000000010001400] = e925ff50, %l7 = ff000000d1030000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 00000000e925ff50
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000138aec01
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_240:
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1410] = 00000000 a80000f6
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000000
!	%l7 = 00000000e925ff50, Mem[00000000218001c0] = ecffae2e
	sth	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = ff50ae2e
!	%l6 = 00000000000003d1, Mem[0000000030081400] = ff000055
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = d1000055
!	Mem[0000000010141410] = fff919ed, %l3 = 000000000000edff
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000fff919ed
!	Mem[0000000030181400] = fff87fff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000fff87fff
!	Mem[0000000010101400] = 55000005, %l0 = ffffffffe925ff50
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 0000000055000005
!	Mem[000000001000140c] = a80000ff, %l5 = fff87fff, %l5 = fff87fff
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000a80000ff
!	Mem[0000000010041400] = 00000000, %l0 = 0000000055000005
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 138aec01, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000001000000ff
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l7 = 00000000e925ff50
	addc	%l4,%l4,%l7		! %l7 = 0000000000000000

p0_label_241:
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000001
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 138aecff, %l3 = 00000000fff919ed
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000ecff
!	%l5 = 00000000a80000ff, %l1 = 0000000000000000, %l0 = 0000000000000000
	subc	%l5,%l1,%l0		! %l0 = 00000000a80000ff
!	Mem[0000000010041410] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141410] = 4955f2ff, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000049
!	%l5 = 00000000a80000ff, %l1 = 0000000000000000, %y  = fffffffa
	udiv	%l5,%l1,%l0		! Div by zero, %l0 = 00000000a800014f
	mov	%l0,%y			! %y = a8000127
!	Mem[0000000030141400] = 00000000, %l2 = 01ec8a13e925ff50
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l1 = 0000000000000000, %l6 = 00000000000003d1, %l4 = ffffffffffffffff
	addc	%l1,%l6,%l4		! %l4 = 00000000000003d1
!	%f19 = 4955f2ff, %f25 = e925ff50, %f8  = 01ec8a13
	fmuls	%f19,%f25,%f8 		! %f8  = f30abafe
!	Starting 10 instruction Store Burst
!	%f10 = ce9e00fe 000000ef, Mem[0000000030081400] = 550000d1 00000000
	stda	%f10,[%i2+%g0]0x89	! Mem[0000000030081400] = ce9e00fe 000000ef

p0_label_242:
!	Mem[0000000010101408] = ecf919ed, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ecf919ed
!	%l6 = 00000000000003d1, Mem[000000001014143c] = df91b5c9, %asi = 80
	stha	%l6,[%i5+0x03c]%asi	! Mem[000000001014143c] = 03d1b5c9
!	Code Fragment 3
p0_fragment_25:
!	%l0 = 00000000a8000127
	setx	0x8485cac01fdfe399,%g7,%l0 ! %l0 = 8485cac01fdfe399
!	%l1 = 0000000000000000
	setx	0x645dcae7e30348b5,%g7,%l1 ! %l1 = 645dcae7e30348b5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8485cac01fdfe399
	setx	0x966e8b885388de1d,%g7,%l0 ! %l0 = 966e8b885388de1d
!	%l1 = 645dcae7e30348b5
	setx	0x6338374ff7c2aad2,%g7,%l1 ! %l1 = 6338374ff7c2aad2
!	%l7 = 0000000000000049, Mem[0000000030181410] = ff000000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000049
!	%f14 = 9ccb0aa5, Mem[0000000030001400] = c6008344
	sta	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 9ccb0aa5
!	Mem[0000000010181400] = 00000000, %l1 = 6338374ff7c2aad2
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l2 = 00000000ecf919ed, Mem[0000000010101412] = 00ce0000, %asi = 80
	stba	%l2,[%i4+0x012]%asi	! Mem[0000000010101410] = 00ceed00
!	Mem[0000000010181410] = ffec8a13, %l5 = 00000000a80000ff
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1424] = 00000091, %l6 = 000003d1, %l2 = ecf919ed
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 0000000000000091
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff, %l6 = 00000000000003d1
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_243:
!	%f30 = 9ccb0aa5, %f27 = 000000ef, %f20 = ffffffff 55000000
	fsmuld	%f30,%f27,%f20		! %l0 = 966e8b885388de3f, Unfinished, %fsr = 2f00000800
!	Mem[0000000030081410] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff9a5f, %l5 = 00000000000000ff
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l1 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001418] = 00000000, %l6 = ffffffffffffffff
	ldsh	[%i0+0x018],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081408] = ff7392ff, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000000003d1
	lduwa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l0 = 966e8b885388de3f
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000000091
	ldswa	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = e3fb0000, %l3 = 000000000000ecff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 000000e3000000ff

p0_label_244:
!	Mem[00000000100c1410] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081418] = fff25549, %l2 = 0000000000000000
	swap	[%i2+0x018],%l2		! %l2 = 00000000fff25549
!	Mem[0000000030141408] = a89e00fe, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 000000a8000000ff
!	%l4 = 0000000000000000, Mem[0000000010041408] = 00000000
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000030081400] = 000000ef, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ef
!	%f16 = a8000000 00000000 ff000000 4955f2ff
!	%f20 = ffffffff 55000000 ff9273ff 4483009b
!	%f24 = 01ec8a13 e925ff50 1e9273ff 000000ef
!	%f28 = ff73921e a13b2a6d 9ccb0aa5 f810a75a
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	%f16 = a8000000 00000000 ff000000 4955f2ff
!	%f20 = ffffffff 55000000 ff9273ff 4483009b
!	%f24 = 01ec8a13 e925ff50 1e9273ff 000000ef
!	%f28 = ff73921e a13b2a6d 9ccb0aa5 f810a75a
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%l0 = 0000000000000000, Mem[0000000010181400] = d2aac2f7
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
	membar	#Sync			! Added by membar checker (44)
!	%f14 = 9ccb0aa5 ecf919ed, Mem[0000000030141400] = 000000a8 00000000
	stda	%f14,[%i5+%g0]0x89	! Mem[0000000030141400] = 9ccb0aa5 ecf919ed
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff, %l1 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_245:
!	Mem[0000000010181400] = 00000000, %l2 = 00000000fff25549
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000000000049, %l1 = ffffffffffffffff, %l3 = 00000000000000e3
	add	%l7,%l1,%l3		! %l3 = 0000000000000048
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000049
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = ff9ebb99, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ff9e
!	Mem[0000000030141408] = 000000ff, %l7 = 000000000000ff9e
	ldsha	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = ff73921effed0000, %f18 = ff000000 4955f2ff
	ldda	[%i5+%o5]0x88,%f18	! %f18 = ff73921e ffed0000
!	Mem[0000000010181410] = ffec8a13ce9e00fe, %l3 = 0000000000000048
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = ffec8a13ce9e00fe
!	Mem[0000000010081400] = ce9e00fe, %l2 = 0000000000000000
	ldsb	[%i2+%g0],%l2		! %l2 = ffffffffffffffce
!	%l0 = 0000000000000000, %l2 = ffffffffffffffce, %y  = a8000127
	udiv	%l0,%l2,%l5		! %l5 = 00000000a8000147
	mov	%l0,%y			! %y = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ff7ff8ff, %l6 = 00000000000000a8
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_246:
!	%l4 = 0000000000000000, Mem[0000000010141420] = a8ffffffff000000
	stx	%l4,[%i5+0x020]		! Mem[0000000010141420] = 0000000000000000
!	Mem[0000000030141408] = ff000000, %l1 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141418] = 05000055a8000000, %l5 = 00000000a8000147, %l2 = ffffffffffffffce
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 05000055a8000000
!	Mem[0000000030141400] = ed19f9ec, %l3 = ffec8a13ce9e00fe
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 000000ed000000ff
!	%l0 = 0000000000000000, Mem[0000000010181400] = 00000000
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%f29 = a13b2a6d, Mem[0000000010181410] = 138aecff
	sta	%f29,[%i6+%o5]0x88	! Mem[0000000010181410] = a13b2a6d
!	%f5  = 00000000, Mem[0000000030101410] = e925ff50
	sta	%f5 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l5 = 00000000a8000147, Mem[0000000030101410] = 00000000
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = a8000147
!	Mem[0000000010141411] = 0000edff, %l3 = 00000000000000ed
	ldstub	[%i5+0x011],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = fe009ece, %l5 = 00000000a8000147
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000fe009ece

p0_label_247:
!	Mem[0000000030081410] = ffffffff, %f0  = ff9ebb99
	lda	[%i2+%o5]0x81,%f0 	! %f0 = ffffffff
!	Mem[0000000010041410] = ffffffffff000000, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030041408] = df000000, %l1 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l1	! %l1 = 00000000df000000
!	Mem[0000000010041410] = ffffffff, %l2 = 05000055a8000000
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 000000df, %l6 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 000000ff ffffffff, %l0 = 00000000, %l1 = df000000
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010081410] = 1e9273ff000000ef, %l7 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 1e9273ff000000ef
!	Mem[0000000010001400] = a8000000, %l1 = 00000000000000ff
	ldub	[%i0+%g0],%l1		! %l1 = 00000000000000a8
!	Mem[0000000010181410] = 6d2a3ba1, %l1 = 00000000000000a8
	ldswa	[%i6+0x010]%asi,%l1	! %l1 = 000000006d2a3ba1
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000df, %l3 = ffffffffff000000
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_248:
!	Mem[0000000010081400] = fe009ece, %l5 = 00000000fe009ece
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000fe009ece
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = ffffffff, %l1 = 6d2a3ba1, Mem[0000000010181410] = 6d2a3ba1 ce9e00fe
	std	%l0,[%i6+%o5]		! Mem[0000000010181410] = ffffffff 6d2a3ba1
!	Mem[0000000030001410] = fe009ece, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000fe009ece
!	%l6 = fe009ece, %l7 = 000000ef, Mem[0000000010141418] = 05000055 a8000000
	std	%l6,[%i5+0x018]		! Mem[0000000010141418] = fe009ece 000000ef
!	Mem[0000000010081404] = c6008344, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x004]%asi,%l3	! %l3 = 00000000c6008344
!	%l3 = 00000000c6008344, Mem[0000000030101408] = 01ec8a13
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = c6008344
!	%l0 = ffffffff, %l1 = 6d2a3ba1, Mem[00000000100c1410] = ff000000 00000000
	stda	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = ffffffff 6d2a3ba1
!	%l0 = ffffffff, %l1 = 6d2a3ba1, Mem[0000000030181410] = 49000000 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff 6d2a3ba1
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff9a5f, %l2 = 00000000000000ff
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000

p0_label_249:
!	Mem[00000000100c1410] = ffffffff, %l0 = 00000000ffffffff
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010081400] = fe009ece, %f13 = a13b2a6d
	lda	[%i2+%g0]0x88,%f13	! %f13 = fe009ece
!	Mem[0000000010101420] = ce9e00fe, %l6 = 00000000fe009ece
	ldub	[%i4+0x020],%l6		! %l6 = 00000000000000ce
!	Mem[0000000030001408] = 8400f2ff ffffffff, %l6 = 000000ce, %l7 = 000000ef
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffffffff 000000008400f2ff
!	Mem[0000000010081410] = ef000000 ff73921e, %l2 = 00000000, %l3 = c6008344
	ldda	[%i2+0x010]%asi,%l2	! %l2 = 00000000ef000000 00000000ff73921e
!	Mem[0000000010081400] = ce9e00fe 00000000, %l4 = 00000000, %l5 = fe009ece
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ce9e00fe 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l7 = 000000008400f2ff
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l2 = 00000000ef000000
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000010181410] = ffffffff6d2a3ba1
	stxa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000ffffffff

p0_label_250:
!	Mem[00000000100c1400] = 55000000, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 0000000055000000
!	%f5  = 00000000, Mem[0000000010041420] = edff0000
	st	%f5 ,[%i1+0x020]	! Mem[0000000010041420] = 00000000
!	%l2 = 00000000ffffffff, Mem[0000000030081410] = ffffffff
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	Mem[0000000010001438] = 9ccb0aa5, %l4 = 00000000ce9e00fe
	swap	[%i0+0x038],%l4		! %l4 = 000000009ccb0aa5
!	Mem[0000000010041400] = 05000055, %l5 = 0000000055000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000005000055
!	Mem[0000000030101408] = c6008344, %l3 = 00000000ff73921e
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000c6008344
!	%f0  = ffffffff fff87fff, Mem[0000000010101408] = 00000000 9ccb0aa5
	stda	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff fff87fff
!	%l2 = 00000000ffffffff, Mem[00000000201c0000] = 00ff9a5f
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ffff9a5f
!	%l1 = 000000006d2a3ba1, Mem[0000000030081408] = ff9273ff
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 6d2a3ba1
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffffffff, %l3 = 00000000c6008344
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ffffffff

p0_label_251:
!	Mem[0000000010041410] = ffffffffff000000, %f26 = 1e9273ff 000000ef
	ldda	[%i1+%o5]0x80,%f26	! %f26 = ffffffff ff000000
!	Mem[0000000010181400] = 00000000, %l2 = 00000000ffffffff
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff, %l3 = 00000000ffffffff
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l6 = 00000000ffffffff
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 470100a8, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000a8
!	Mem[0000000030101408] = 50ff25e91e9273ff, %f18 = ff73921e ffed0000
	ldda	[%i4+%o4]0x89,%f18	! %f18 = 50ff25e9 1e9273ff
!	Mem[00000000201c0000] = ffff9a5f, %l0 = 00000000ffffffff
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = ffffffff, %l0 = ffffffffffffffff
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101430] = 4483009b, %l4 = 000000009ccb0aa5
	lduha	[%i4+0x030]%asi,%l4	! %l4 = 0000000000004483
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 99bb9eff, %l6 = 00000000000000a8
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_252:
!	%l7 = 0000000000000000, Mem[0000000030041410] = 00000055
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000055
!	%f16 = a8000000 00000000 50ff25e9 1e9273ff
!	%f20 = ffffffff 55000000 ff9273ff 4483009b
!	%f24 = 01ec8a13 e925ff50 ffffffff ff000000
!	%f28 = ff73921e a13b2a6d 9ccb0aa5 f810a75a
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l5 = 0000000005000055, Mem[0000000030141408] = ff000000
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 55000000
!	%f8  = f30abafe e925ff50, Mem[0000000010001410] = ffffffff 00000055
	stda	%f8 ,[%i0+%o5]0x88	! Mem[0000000010001410] = f30abafe e925ff50
!	%l7 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010041400] = 00000055, %l5 = 0000000005000055
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000055
!	%f12 = 000000ff fe009ece, Mem[0000000030181410] = ffffffff 6d2a3ba1
	stda	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff fe009ece
!	%l7 = 0000000000000000, Mem[0000000010101424] = 000000ef, %asi = 80
	stha	%l7,[%i4+0x024]%asi	! Mem[0000000010101424] = 000000ef
!	%l7 = 0000000000000000, immd = 00000000000003c6, %l0 = ffffffffffffffff
	sdivx	%l7,0x3c6,%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000ff0000a8, %l7 = 0000000000000000
	ldx	[%i1+%o4],%l7		! %l7 = 00000000ff0000a8

p0_label_253:
!	Mem[0000000030101400] = fff87fff, %l2 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = fffffffffff87fff
!	Mem[0000000010101400] = 50ff25e9a8000000, %f14 = 9ccb0aa5 ecf919ed
	ldda	[%i4+%g0]0x80,%f14	! %f14 = 50ff25e9 a8000000
!	Mem[0000000010101410] = 00ceed00, %l7 = 00000000ff0000a8
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = a50acb9c, %l2 = fffffffffff87fff
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffa5
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010081418] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i2+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = ff73921e, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ff73921e
!	Mem[0000000030001408] = ffffffff, %l6 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = fffbb6f7, %l5 = 0000000000000055
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = fffffffffffffffb
!	Mem[0000000010181400] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffff0055, %l2 = ffffffffffffffa5
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_254:
!	%l0 = 00000000, %l1 = 6d2a3ba1, Mem[0000000030041400] = 00000000 000000a8
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 6d2a3ba1
!	Mem[0000000010081430] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i2+0x030]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141410] = 00ffedff, %l7 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030181408] = fe009ece000000ff
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%f12 = 000000ff fe009ece, %l2 = 00000000000000ff
!	Mem[0000000010141418] = fe009ece000000ef
	add	%i5,0x018,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141418] = 000000fffe009ece
!	%f7  = 00007f00, Mem[0000000010181410] = 00000000
	sta	%f7 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00007f00
!	%l2 = 00000000000000ff, Mem[000000001000143d] = f810a75a, %asi = 80
	stba	%l2,[%i0+0x03d]%asi	! Mem[000000001000143c] = f8ffa75a
!	%l2 = 00000000000000ff, Mem[0000000030141400] = ff19f9ec
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ff19f9ec
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_255:
!	Mem[0000000010101400] = 50ff25e9, %l1 = 000000006d2a3ba1
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 00000000000050ff
!	Mem[00000000100c1410] = ffffffff, %f26 = ffffffff
	lda	[%i3+%o5]0x80,%f26	! %f26 = ffffffff
!	Mem[0000000030101408] = 00000000e925ff50, %l5 = fffffffffffffffb
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 00000000e925ff50
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000004483
	ldswa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000e925ff50
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001004141c] = 448300c6, %l7 = 0000000000000000
	ldsw	[%i1+0x01c],%l7		! %l7 = 00000000448300c6
!	Mem[0000000030081408] = ff73921e, %l2 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffff73921e
!	%l3 = 00000000ff73921e, %l1 = 00000000000050ff, %l5 = 0000000000000000
	add	%l3,%l1,%l5		! %l5 = 00000000ff73e31d
!	Starting 10 instruction Store Burst
!	%f14 = 50ff25e9, Mem[0000000030001408] = ffffffff
	sta	%f14,[%i0+%o4]0x89	! Mem[0000000030001408] = 50ff25e9

p0_label_256:
!	%f28 = ff73921e a13b2a6d, %l2 = ffffffffff73921e
!	Mem[0000000030141410] = ffffffff55000000
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_S ! Mem[0000000030141410] = ff73921ea13b0000
!	%f22 = ff9273ff 4483009b, %l2 = ffffffffff73921e
!	Mem[0000000010101418] = a89ebb990000002d
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010101418] = a89ebb99ff7392ff
!	%l4 = 00000000, %l5 = ff73e31d, Mem[0000000030141408] = 00000055 fff25549
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 ff73e31d
!	Mem[0000000010041400] = 05000055, %l5 = 00000000ff73e31d
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000055000000ff
!	%l4 = 0000000000000000, Mem[0000000010081404] = 00000000, %asi = 80
	stba	%l4,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000000
!	%l2 = ff73921e, %l3 = ff73921e, Mem[0000000030101410] = 470100a8 01ec8a13
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff73921e ff73921e
!	%l1 = 00000000000050ff, Mem[0000000030141408] = 000000001de373ff
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000050ff
!	%f10 = ce9e00fe, %f10 = ce9e00fe
	fcmpes	%fcc1,%f10,%f10		! %fcc1 = 0
!	%l3 = 00000000ff73921e, Mem[0000000030141408] = ff50000000000000
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000ff73921e
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffbb6f7, %l2 = ffffffffff73921e
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000fffb

p0_label_257:
!	Mem[0000000010101400] = 50ff25e9a8000000, %f2  = ff000000 4955f2ff
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = 50ff25e9 a8000000
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000055
	lduh	[%i6+0x002],%l5		! %l5 = 0000000000000000
!	Mem[0000000020800000] = ffff8691, %l3 = 00000000ff73921e
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000030181400] = ffffffff00000000, %f12 = 000000ff fe009ece
	ldda	[%i6+%g0]0x89,%f12	! %f12 = ffffffff 00000000
!	Mem[0000000010181428] = 9ccb0aa59b000000, %f8  = f30abafe e925ff50
	ldd	[%i6+0x028],%f8 	! %f8  = 9ccb0aa5 9b000000
!	Mem[0000000030001400] = a50acb9c000000a8, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = a50acb9c000000a8
!	Mem[00000000100c1408] = 00000000, %f26 = ffffffff
	lda	[%i3+%o4]0x88,%f26	! %f26 = 00000000
!	Mem[0000000030101410] = ff73921e, %l6 = ffffffffffffffff
	ldswa	[%i4+%o5]0x89,%l6	! %l6 = ffffffffff73921e
!	Mem[0000000010101420] = ce9e00fe000000ef, %f12 = ffffffff 00000000
	ldd	[%i4+0x020],%f12	! %f12 = ce9e00fe 000000ef
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ffff, Mem[00000000201c0000] = ffff9a5f
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ffff9a5f

p0_label_258:
!	Mem[0000000010081408] = ffff0055, %l7 = 00000000448300c6
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ffff0055
!	Mem[0000000010101408] = ff7ff8ff, %l7 = 00000000ffff0055
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff7ff8ff
!	Mem[0000000030181408] = 00000000, %l3 = 000000000000ffff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l1 = 00000000000050ff
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1410] = ffffffff, %l5 = a50acb9c000000a8
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000300c1410] = ffffffff
	stwa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f18 = 50ff25e9 1e9273ff, %l4 = 0000000000000000
!	Mem[0000000030001408] = e925ff50fff20084
	add	%i0,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_S ! Mem[0000000030001408] = e925ff50fff20084
!	%l3 = 0000000000000000, Mem[0000000010041424] = 59703c1f, %asi = 80
	stba	%l3,[%i1+0x024]%asi	! Mem[0000000010041424] = 00703c1f
!	%l2 = 000000000000fffb, imm = 000000000000088b, %l3 = 0000000000000000
	xnor	%l2,0x88b,%l3		! %l3 = ffffffffffff088f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l4 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 00000000ffffffff

p0_label_259:
!	Mem[0000000010141408] = 000000ff0000fbff, %f20 = ffffffff 55000000
	ldda	[%i5+%o4]0x88,%f20	! %f20 = 000000ff 0000fbff
!	Mem[0000000010081400] = fe009ece, %l6 = ffffffffff73921e
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000009ece
!	Mem[0000000010081420] = 00000000, %l0 = 0000000000000000
	ldub	[%i2+0x021],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 2d000000 99bb9eff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000099bb9eff 000000002d000000
!	Mem[0000000030041400] = a13b2a6d 00000000, %l0 = 99bb9eff, %l1 = 2d000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000a13b2a6d
!	%f22 = ff9273ff 4483009b, Mem[0000000010101410] = 00ceed00 9b0d0000
	stda	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = ff9273ff 4483009b
!	Mem[0000000030181400] = ffffffff00000000, %l4 = 00000000ffffffff
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = ffffffff00000000
!	Mem[0000000010101408] = ffff0055, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = a13b2a6d, Mem[00000000300c1410] = 00000000 00000000
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 a13b2a6d

p0_label_260:
!	%l3 = ffffffffffff088f, Mem[0000000030181400] = 00000000
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000088f
!	%l3 = ffffffffffff088f, Mem[0000000030101410] = 1e9273ff
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 8f9273ff
!	%l7 = 00000000ff7ff8ff, Mem[0000000010141410] = ffedffff
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = ff7ff8ff
!	%f22 = ff9273ff 4483009b, %l0 = 0000000000000000
!	Mem[00000000100c1428] = a89ebb990000002d
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_P ! Mem[00000000100c1428] = a89ebb990000002d
!	%l7 = 00000000ff7ff8ff, Mem[00000000100c1410] = ffffffff
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff7ff8ff
!	Mem[0000000010101434] = 000000ff, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x034]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l4 = ffffffff00000000
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%f8  = 9ccb0aa5 9b000000, Mem[0000000010041410] = ffffffff ff000000
	stda	%f8 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 9ccb0aa5 9b000000
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 50ff25e9, %l1 = 00000000a13b2a6d
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 0000000050ff25e9

p0_label_261:
!	%l7 = 00000000ff7ff8ff, immd = fffffffffffff89e, %l6 = 0000000000009ece
	udivx	%l7,-0x762,%l6		! %l6 = 0000000000000000
!	Mem[0000000021800140] = 00f6154d, %l0 = 0000000000000000
	ldsh	[%o3+0x140],%l0		! %l0 = 00000000000000f6
!	Mem[0000000010041400] = ff000005ffffffff, %f26 = 00000000 ff000000
	ldd	[%i1+%g0],%f26		! %f26 = ff000005 ffffffff
!	Mem[0000000010181428] = 9ccb0aa59b000000, %f6  = fe009ece 00007f00
	ldd	[%i6+0x028],%f6 	! %f6  = 9ccb0aa5 9b000000
!	Mem[0000000010081400] = ce9e00fe00000000, %f6  = 9ccb0aa5 9b000000
	ldd	[%i2+%g0],%f6 		! %f6  = ce9e00fe 00000000
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 50ff25e9, %l1 = 0000000050ff25e9
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000050
!	%l1 = 0000000000000050, imm = 0000000000000c4c, %l2 = 000000000000fffb
	addc	%l1,0xc4c,%l2		! %l2 = 0000000000000c9c
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = 9ccb0aa5, Mem[0000000010101408] = 5500ffff
	sta	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 9ccb0aa5

p0_label_262:
!	%l4 = 0000000000000000, Mem[000000001014143a] = f3d48862, %asi = 80
	stha	%l4,[%i5+0x03a]%asi	! Mem[0000000010141438] = f3d40000
!	Mem[0000000010041401] = ff000005, %l4 = 0000000000000000
	ldstuba	[%i1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%f6  = ce9e00fe 00000000, Mem[0000000010081410] = 000000ef 1e9273ff
	stda	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ce9e00fe 00000000
!	%l0 = 00000000000000f6, Mem[0000000021800040] = 0000f914, %asi = 80
	stba	%l0,[%o3+0x040]%asi	! Mem[0000000021800040] = f600f914
!	Mem[0000000030141408] = 1e9273ff, %l2 = 0000000000000c9c
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 0000001e000000ff
!	%l2 = 0000001e, %l3 = ffff088f, Mem[0000000030181400] = 0000088f ffffffff
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000001e ffff088f
!	%l3 = ffffffffffff088f, Mem[0000000010181410] = 00007f00
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff088f
!	Mem[00000000201c0000] = ffff9a5f, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	%l7 = 00000000ff7ff8ff, Mem[00000000211c0001] = fffbb6f7, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffffb6f7
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 50ff25e9, %l7 = 00000000ff7ff8ff
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 00000000000050ff

p0_label_263:
!	Mem[0000000030181410] = ce9e00fe ff000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ce9e00fe 00000000ff000000
!	Mem[0000000030181400] = 0000001e, %f7  = 00000000
	lda	[%i6+%g0]0x89,%f7 	! %f7 = 0000001e
!	Mem[0000000030041400] = 000000006d2a3ba1, %l3 = ffffffffffff088f
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 000000006d2a3ba1
!	%f27 = ffffffff, %f11 = 000000ef
	fcmpes	%fcc3,%f27,%f11		! %fcc3 = 3
!	Mem[0000000030101408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181424] = ce9e00fe, %l6 = 0000000000000000
	lduha	[%i6+0x024]%asi,%l6	! %l6 = 000000000000ce9e
!	Mem[0000000010101410] = ff7392ff, %l3 = 000000006d2a3ba1
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l6 = 000000000000ce9e
	lduwa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = ff73921e a13b2a6d, Mem[0000000030081400] = 00000000 a8000000
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = ff73921e a13b2a6d

p0_label_264:
!	%l2 = 000000000000001e, Mem[0000000030001408] = e925ff50
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 001eff50
!	%l0 = 000000f6, %l1 = 00000050, Mem[0000000010001408] = 000000ff fff25549
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000f6 00000050
!	%l3 = ffffffffffffffff, Mem[0000000030141400] = ecf919ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = ecf919ff
!	Mem[0000000030041408] = ff0000df, %l0 = 00000000000000f6
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff0000df
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	swap	[%i1+%o4],%l6		! %l6 = 0000000000000000
!	%l0 = 00000000ff0000df, %l5 = 0000000000000000, %l4 = 00000000ce9e00fe
	or	%l0,%l5,%l4		! %l4 = 00000000ff0000df
!	%l2 = 0000001e, %l3 = ffffffff, Mem[0000000010141408] = 0000fbff 000000ff
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000001e ffffffff
!	%f19 = 1e9273ff, Mem[0000000030001400] = 9ccb0aa5
	sta	%f19,[%i0+%g0]0x89	! Mem[0000000030001400] = 1e9273ff
!	%f6  = ce9e00fe 0000001e, %l0 = 00000000ff0000df
!	Mem[0000000030181418] = 81cda254b0523971
	add	%i6,0x018,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181418] = ce9ea2fe0000001e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = fff87fff 1e9273ff, %l0 = ff0000df, %l1 = 00000050
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000fff87fff 000000001e9273ff

p0_label_265:
!	Mem[0000000010041408] = 00000000, %l3 = ffffffffffffffff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 1e9273ff, %l1 = 000000001e9273ff
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000030081400] = 6d2a3ba1 1e9273ff ff73921e e925ff50
!	Mem[0000000030081410] = 00000055 ffffffff 9b008344 ff7392ff
!	Mem[0000000030081420] = 50ff25e9 138aec01 000000ff ffffffff
!	Mem[0000000030081430] = 6d2a3ba1 1e9273ff 5aa710f8 a50acb9c
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000010081420] = 00000000, %l1 = ffffffffffffffff
	ldsh	[%i2+0x022],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00000055, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%f8  = 9ccb0aa5, %f9  = 9b000000
	fcmps	%fcc0,%f8 ,%f9 		! %fcc0 = 1
!	Mem[0000000030081408] = ff73921e, %l0 = 00000000fff87fff
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = fff87fff, %l0 = ffffffffffffffff
	ldswa	[%i5+%o5]0x80,%l0	! %l0 = fffffffffff87fff
!	Mem[0000000030101400] = ff7ff8ff, %l0 = fffffffffff87fff
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = ffffffffff7ff8ff
!	Starting 10 instruction Store Burst
!	%f6  = ce9e00fe 0000001e, Mem[0000000030001410] = 00000000 00007f00
	stda	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ce9e00fe 0000001e

p0_label_266:
!	%f5  = 00000000, Mem[0000000010181408] = 00000000
	sta	%f5 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[00000000211c0000] = ffffb6f7, %l4 = 00000000ff0000df
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030141400] = ecf919ff 9ccb0aa5
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 00000000
!	Mem[00000000211c0001] = ffffb6f7, %l1 = 0000000000000000
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181410] = ce9e00fe
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ff9e00fe
!	%f12 = ce9e00fe 000000ef, %l6 = 0000000000000000
!	Mem[0000000030001410] = 1e000000fe009ece
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l6]ASI_PST8_S ! Mem[0000000030001410] = 1e000000fe009ece
!	%l2 = 000000000000001e, Mem[0000000010001410] = 50ff25e9
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 1eff25e9
!	Mem[0000000030041408] = f6000000, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000f6000000
!	%l4 = 00000000000000ff, Mem[0000000010181408] = a80000ff00000000
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_267:
!	Mem[0000000010141408] = 1e000000ffffffff, %f4  = ffffffff 00000000
	ldd	[%i5+%o4],%f4 		! %f4  = 1e000000 ffffffff
!	Mem[0000000010141408] = ffffffff 0000001e, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 000000000000001e 00000000ffffffff
!	Mem[0000000010141410] = ff7ff8ff, %l4 = 000000000000001e
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = fffffffffffff8ff
!	Mem[0000000030101410] = ff73928f, %l2 = 000000000000001e
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffff8f
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000ffffffff
	ldsba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 55000000, %l4 = fffffffffffff8ff
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = ff73921eff73928f, %l7 = 00000000000050ff
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = ff73921eff73928f
!	Mem[0000000010001400] = 00000000000000a8, %f0  = ffffffff fff87fff
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = 00000000 000000a8
!	Mem[0000000010001438] = ce9e00fe f8ffa75a, %l4 = 00000000, %l5 = 00000000
	ldd	[%i0+0x038],%l4		! %l4 = 00000000ce9e00fe 00000000f8ffa75a
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 50ff1e00, %l4 = 00000000ce9e00fe
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_268:
!	Mem[0000000010101410] = ff9273ff, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001408] = ff1eff50, %l2 = ffffffffffffff8f
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff1eff50
!	Mem[0000000010001410] = 1eff25e9, %l5 = 00000000f8ffa75a
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 000000001eff25e9
!	Mem[0000000030141400] = ff000000, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Code Fragment 3
p0_fragment_26:
!	%l0 = ffffffffff7ff8ff
	setx	0xf7b4de606b285e98,%g7,%l0 ! %l0 = f7b4de606b285e98
!	%l1 = 00000000000000ff
	setx	0x870cfdc7f4a3ba49,%g7,%l1 ! %l1 = 870cfdc7f4a3ba49
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f7b4de606b285e98
	setx	0x3f072de026546c3e,%g7,%l0 ! %l0 = 3f072de026546c3e
!	%l1 = 870cfdc7f4a3ba49
	setx	0x12d0c3efe391d5ab,%g7,%l1 ! %l1 = 12d0c3efe391d5ab
!	%f0  = 00000000 000000a8, Mem[0000000030141408] = ff7392ff 00000000
	stda	%f0 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 000000a8
!	%f8  = 9ccb0aa5, %f13 = 000000ef
	fcmps	%fcc1,%f8 ,%f13		! %fcc1 = 1
!	%l4 = ff000000, %l5 = 1eff25e9, Mem[0000000010181410] = 8f08ffff ffffffff
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000 1eff25e9
!	%l1 = 12d0c3efe391d5ab, Mem[00000000211c0000] = ffffb6f7
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = abffb6f7
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 6d2a3ba1, %l7 = ff73921eff73928f
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = 000000000000006d

p0_label_269:
!	Mem[0000000010041410] = 0000009ba50acb9c, %f6  = ce9e00fe 0000001e
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = 0000009b a50acb9c
!	Mem[0000000010181408] = ff000000, %l0 = 3f072de026546c3e
	ldsha	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030041400] = 00000000, %l4 = 00000000ff000000
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 ffffffff, %l2 = ff1eff50, %l3 = 000000ff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000ffffffff
!	Mem[0000000030041400] = 00000000, %l6 = 00000000f6000000
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = fff87fff, %l5 = 000000001eff25e9
	lduw	[%i5+%o5],%l5		! %l5 = 00000000fff87fff
!	Mem[0000000030101408] = 00000000, %l5 = 00000000fff87fff
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = a13b2a6d00000000, %l0 = ffffffffffffff00
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = a13b2a6d00000000
!	Mem[0000000010081410] = 00000000, %l0 = a13b2a6d00000000
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081408] = 448300c600000000
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000

p0_label_270:
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010101408] = a50acb9c, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000a50acb9c
!	Mem[0000000010001400] = a8000000, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000a8000000
!	%l0 = 00000000, %l1 = e391d5ab, Mem[0000000010181408] = ff000000 00000000
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 e391d5ab
!	%l3 = 00000000ffffffff, Mem[0000000010041400] = ffffffff0500ffff
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000ffffffff
!	Mem[0000000010041410] = 9ccb0aa5, %l4 = 00000000a50acb9c
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000009ccb0aa5
!	%l3 = 00000000ffffffff, Mem[0000000030141400] = 0000000000000000
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ffffffff
!	%f30 = 5aa710f8 a50acb9c, %l3 = 00000000ffffffff
!	Mem[0000000010041428] = a89ec63e9b000000
	add	%i1,0x028,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_P ! Mem[0000000010041428] = 5aa710f8a50acb9c
!	Mem[00000000211c0001] = abffb6f7, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff8691, %l0 = 0000000000000000
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffff

p0_label_271:
!	Mem[0000000010081408] = 00000000, %l4 = 000000009ccb0aa5
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = a13b2a6d, %l6 = 00000000000000ff
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000006d
!	Mem[0000000010181438] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+0x03b]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = a8000000, %l7 = 000000000000006d
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000a8
!	Mem[0000000030141410] = ff73921e, %l4 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff73921e
!	Mem[0000000030101400] = ff7ff8ff, %l0 = ffffffffffffffff
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	%f7  = a50acb9c, %f14 = 50ff25e9, %f21 = ffffffff
	fdivs	%f7 ,%f14,%f21		! %f21 = 938b423f
!	Mem[0000000030041408] = ff00000000000000, %f30 = 5aa710f8 a50acb9c
	ldda	[%i1+%o4]0x89,%f30	! %f30 = ff000000 00000000
!	Mem[00000000100c1410] = fff87fff, %l7 = 00000000000000a8
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000007fff
!	Starting 10 instruction Store Burst
!	%f12 = ce9e00fe 000000ef, %l5 = 0000000000000000
!	Mem[0000000030181410] = ff9e00feff000000
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181410] = ff9e00feff000000

p0_label_272:
!	%f2  = 50ff25e9 a8000000, %l3 = 00000000ffffffff
!	Mem[0000000010181408] = 00000000e391d5ab
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181408] = 50ff25e9a8000000
!	Mem[0000000010101400] = e925ff50, %l2 = 00000000a8000000
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000e925ff50
!	%l7 = 0000000000007fff, Mem[0000000030101410] = 8f9273ff
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 7fff73ff
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = ffffffff, %l1 = e391d5ab, Mem[00000000300c1400] = ff9ebb99 0000002d
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff e391d5ab
	membar	#Sync			! Added by membar checker (47)
!	%f0  = 00000000 000000a8, %l4 = 00000000ff73921e
!	Mem[0000000030081410] = 00000055ffffffff
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030081410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101430] = 4483009b000000ff, %asi = 80
	stxa	%l5,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000000000000000
!	Mem[0000000010101410] = ff9273ff, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = e925ff50, %l3 = ffffffff, Mem[0000000010041408] = 00000000 ff0000a8
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = e925ff50 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 0000fa8a, %l5 = 00000000000000ff
	lduba	[%o3+0x081]%asi,%l5	! %l5 = 0000000000000000

p0_label_273:
!	Mem[00000000100c1408] = 00000000000000ff, %f4  = 1e000000 ffffffff
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030081408] = 50ff25e91e9273ff, %f8  = 9ccb0aa5 9b000000
	ldda	[%i2+%o4]0x89,%f8 	! %f8  = 50ff25e9 1e9273ff
!	Mem[0000000030101408] = 00000000, %l6 = 000000000000006d
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 000000a8, %l7 = 0000000000007fff
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000a8
!	Mem[0000000010041408] = 50ff25e9, %l4 = 00000000ff73921e
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = ffffffffffffffe9
!	Mem[0000000010041408] = 50ff25e9, %l7 = 00000000000000a8
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffe9
!	Mem[00000000211c0000] = abffb6f7, %l4 = ffffffffffffffe9
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffabff
!	Mem[0000000030081408] = ff73921e, %l1 = 12d0c3efe391d5ab
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ff73921e
!	Mem[0000000010181410] = ff0000ff, %l7 = ffffffffffffffe9
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000055, %l2 = 00000000e925ff50
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000055

p0_label_274:
!	%f1  = 000000a8, Mem[0000000010181410] = ff0000ff
	sta	%f1 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000a8
!	%l4 = ffffffffffffabff, Mem[00000000300c1400] = ffffffff
	stba	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	%l5 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f20 = 00000055 938b423f, Mem[0000000010181408] = e925ff50 000000a8
	stda	%f20,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000055 938b423f
!	Mem[00000000100c1400] = 00000000ffffffff, %l3 = 00000000ffffffff, %l1 = 00000000ff73921e
	casxa	[%i3]0x80,%l3,%l1	! %l1 = 00000000ffffffff
!	%l5 = 0000000000000000, Mem[0000000010041410] = 9ccb0aa5
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 9ccb0a00
!	%f4  = 00000000, Mem[0000000030041408] = 00000000
	sta	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l4 = ffffabff, %l5 = 00000000, Mem[0000000030181408] = ffff0000 00000000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffabff 00000000
!	Mem[0000000010041418] = 000000a8, %l5 = 00000000, %l4 = ffffabff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000000000a8
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0000001e, %f28 = 6d2a3ba1
	lda	[%i6+%g0]0x89,%f28	! %f28 = 0000001e

p0_label_275:
!	Mem[0000000010041408] = e925ff50, %l0 = ffffffffffffffff
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffe9
!	%l5 = 0000000000000000, imm = fffffffffffff1bf, %l0 = ffffffffffffffe9
	xnor	%l5,-0xe41,%l0		! %l0 = 0000000000000e40
!	Mem[0000000030141410] = 00003ba11e9273ff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 00003ba11e9273ff
!	Mem[0000000030141400] = ffffffff, %l4 = 00000000000000a8
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000ffffffff, imm = fffffffffffff67f, %l0 = 0000000000000e40
	orn	%l3,-0x981,%l0		! %l0 = 00000000ffffffff
!	Mem[0000000030141410] = ff73921ea13b0000, %l0 = 00000000ffffffff
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = ff73921ea13b0000
!	Mem[0000000030181408] = ffabffff, %l0 = ff73921ea13b0000
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffabffff
!	Mem[00000000100c1410] = fff87fff, %l2 = 0000000000000055
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000007fff
!	Mem[0000000010181400] = 00000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 1e9273ff, %l3 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_276:
!	Mem[0000000030101400] = ff7ff8ff, %l4 = 00000000000000ff
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081428] = a89ebb99, %l2 = 00007fff, %l0 = ffabffff
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000a89ebb99
!	Mem[0000000010041400] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f16 = 6d2a3ba1 1e9273ff, %l1 = 00000000ffffffff
!	Mem[0000000010001408] = f600000050000000
	add	%i0,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_P ! Mem[0000000010001408] = 6d2a3ba11e9273ff
!	%l7 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stba	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	%l0 = 00000000a89ebb99, Mem[00000000201c0000] = ffff9a5f, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = bb999a5f
!	Mem[00000000218000c0] = 00a8635c, %l7 = 00000000000000ff
	ldstuba	[%o3+0x0c0]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000030181410] = fe009eff 000000ff
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff 00000000
!	%l6 = 00000000ffffffff, Mem[0000000010081410] = 00000000
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff73921e 000000a8 ffffff8f fff20084
!	Mem[0000000030001410] = 1e000000 fe009ece 2e13ffed 00ef0012
!	Mem[0000000030001420] = ff547f31 e837839c 78808330 15840012
!	Mem[0000000030001430] = 440ff950 000000ff 92118061 00000060
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400

p0_label_277:
!	Mem[0000000030181410] = 00000000ffffffff, %f22 = 9b008344 ff7392ff
	ldda	[%i6+%o5]0x89,%f22	! %f22 = 00000000 ffffffff
!	Mem[0000000010001410] = f8ffa75afeba0af3, %l2 = 0000000000007fff
	ldxa	[%i0+%o5]0x80,%l2	! %l2 = f8ffa75afeba0af3
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000a89ebb99
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 0000001e, %f18 = ff73921e
	lda	[%i0+%o5]0x89,%f18	! %f18 = 0000001e
!	Mem[0000000010141400] = 000003d1 000000ff, %l4 = ffffffff, %l5 = 1e9273ff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000000003d1 00000000000000ff
!	Mem[0000000030081410] = 00000000 00000000, %l2 = feba0af3, %l3 = 000000ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1410] = fff87fff, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000007fff
!	Mem[0000000030081408] = ff73921e e925ff50, %l4 = 000003d1, %l5 = 000000ff
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff73921e 00000000e925ff50
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010101400] = 000000a8 a8000000 00000000 ffffffff
!	Mem[0000000010101410] = ff9273ff 4483009b a89ebb99 ff7392ff
!	Mem[0000000010101420] = ce9e00fe 000000ef 00000000 53d4c63e
!	Mem[0000000010101430] = 00000000 00000000 92118061 000000ff
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030001410] = ce9e00fe0000001e
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000

p0_label_278:
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
	membar	#Sync			! Added by membar checker (49)
!	%f28 = 0000001e, Mem[0000000010101400] = 000000a8
	sta	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000001e
!	Mem[0000000010041400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	%l2 = 0000000000000000, Mem[0000000010081400] = ce9e00fe
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010041410] = 9ccb0a00
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 9ccb0000
!	%f0  = 000000a8 a8000000, Mem[00000000100c1410] = ff7ff8ff 6d2a3ba1
	stda	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000a8 a8000000
!	%l5 = 00000000e925ff50, Mem[0000000030141408] = 00000000000000a8
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000e925ff50
!	%f5  = 4483009b, Mem[00000000100c1408] = 00000000
	sta	%f5 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 4483009b
!	%l7 = 0000000000000000, Mem[0000000010101408] = 00000000
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = f8ffa75a, %l5 = 00000000e925ff50
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = fffffffffffffff8

p0_label_279:
!	Mem[0000000010141420] = 00000000, %l1 = 00000000ffffffff
	ldswa	[%i5+0x020]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00003ba1 1e9273ff, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 000000001e9273ff 0000000000003ba1
!	Mem[00000000211c0000] = abffb6f7, %l3 = 00000000ffffffff
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 1e000000, %l7 = 0000000000003ba1
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = 000000000000001e
!	Mem[0000000010181410] = a8000000, %f0  = 000000a8
	lda	[%i6+%o5]0x80,%f0 	! %f0 = a8000000
!	Mem[0000000010141410] = fff87fff, %l7 = 000000000000001e
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 000000000000fff8
!	Mem[0000000010141410] = ff7ff8ff, %l3 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000f8ff
!	Starting 10 instruction Store Burst
!	%f12 = 00000000, Mem[0000000010141410] = ff7ff8ff
	sta	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000

p0_label_280:
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = a8000000, %l3 = 000000000000f8ff
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000a8000000
!	%l1 = 0000000000000000, Mem[0000000030141400] = ffffffff
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff
!	%l2 = 0000000000000000, Mem[00000000300c1410] = 000000006d2a3ba1
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%f0  = a8000000 a8000000, Mem[0000000030081400] = 6d2a3ba1 1e9273ff
	stda	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = a8000000 a8000000
!	Mem[0000000030041400] = 00000000, %l3 = 00000000a8000000
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f19 = e925ff50, Mem[0000000010081430] = ffffffff
	st	%f19,[%i2+0x030]	! Mem[0000000010081430] = e925ff50
!	%l6 = 000000001e9273ff, immd = fffffffffffffe7f, %l1 = 0000000000000000
	sdivx	%l6,-0x181,%l1		! %l1 = ffffffffffebabeb
!	Mem[0000000030181400] = 1e000000, %l6 = 000000001e9273ff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 5aa7fff8, %l5 = fffffffffffffff8
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = fffffffffffffff8

p0_label_281:
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 0000000000007fff
	setx	0x4ad06857ce936ebe,%g7,%l0 ! %l0 = 4ad06857ce936ebe
!	%l1 = ffffffffffebabeb
	setx	0x5f54b9781ec1a4e9,%g7,%l1 ! %l1 = 5f54b9781ec1a4e9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ad06857ce936ebe
	setx	0xc5edcfb86f7a0c69,%g7,%l0 ! %l0 = c5edcfb86f7a0c69
!	%l1 = 5f54b9781ec1a4e9
	setx	0x1252f907fd860512,%g7,%l1 ! %l1 = 1252f907fd860512
!	Mem[00000000211c0000] = abffb6f7, %l3 = 0000000000000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffabff
!	Mem[000000001010140c] = ffffffff, %f4  = ff9273ff
	lda	[%i4+0x00c]%asi,%f4 	! %f4 = ffffffff
!	Mem[0000000030101408] = 00000000, %l3 = ffffffffffffabff
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000 00000000, %l4 = ff73921e, %l5 = fffffff8
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000021800040] = f600f914, %l7 = 000000000000fff8
	ldsha	[%o3+0x040]%asi,%l7	! %l7 = fffffffffffff600
!	Mem[0000000030001410] = 00000000, %l7 = fffffffffffff600
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = abffb6f7, %l1 = 1252f907fd860512
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000abff
!	Starting 10 instruction Store Burst
!	%f4  = ffffffff 4483009b, Mem[0000000010081410] = 0000ffff ce9e00fe
	stda	%f4 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff 4483009b

p0_label_282:
!	%l1 = 000000000000abff, Mem[0000000010041430] = ffffffffc9b591df
	stx	%l1,[%i1+0x030]		! Mem[0000000010041430] = 000000000000abff
!	%l2 = 0000000000000000, Mem[0000000030081408] = 50ff25e91e9273ff
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000000000, %l4 = ffffffffffffffff, %l3 = 0000000000000000
	addc	%l7,%l4,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = a13b2a6d, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 0000006d000000ff
!	%l6 = 000000000000001e, Mem[00000000100c1420] = 0000000000000091, %asi = 80
	stxa	%l6,[%i3+0x020]%asi	! Mem[00000000100c1420] = 000000000000001e
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffabffff
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00abffff
!	%l1 = 000000000000abff, Mem[0000000020800040] = ff00978a, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = abff978a
!	%f25 = 138aec01, Mem[0000000030081400] = a8000000
	sta	%f25,[%i2+%g0]0x81	! Mem[0000000030081400] = 138aec01
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_283:
!	Mem[000000001008140c] = 00000000, %l4 = ffffffffffffffff
	ldsb	[%i2+0x00e],%l4		! %l4 = 0000000000000000
!	Mem[0000000030041410] = 50ff25e9, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 0000000050ff25e9
!	Mem[0000000030101400] = ff7ff8ff, %l0 = c5edcfb86f7a0c69
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 50ff25e9, %f21 = 938b423f
	lda	[%i1+%o4]0x88,%f21	! %f21 = 50ff25e9
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c143c] = ff73921e, %l5 = 0000000000000000
	lduha	[%i3+0x03c]%asi,%l5	! %l5 = 000000000000ff73
!	Mem[0000000030001408] = ffffff8f, %l5 = 000000000000ff73
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001408] = a13b2aff, %l6 = 000000000000001e
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l1 = 000000000000abff
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 9b008344, %l0 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 000000009b008344

p0_label_284:
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f19 = e925ff50, Mem[0000000010101408] = 00000000
	sta	%f19,[%i4+%o4]0x80	! Mem[0000000010101408] = e925ff50
!	Mem[00000000211c0000] = abffb6f7, %l3 = 000000000000006d
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffffab
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l5 = 000000000000ffff, Mem[0000000030041400] = ff000000
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%l1 = 0000000000000000, Mem[0000000010101400] = 1e000000
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 1e000000
!	Mem[00000000100c1430] = 00000000, %l0 = 000000009b008344, %asi = 80
	swapa	[%i3+0x030]%asi,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_28:
!	%l0 = 0000000000000000
	setx	0x244d81c87b1e66ad,%g7,%l0 ! %l0 = 244d81c87b1e66ad
!	%l1 = 0000000000000000
	setx	0xb60e42a7a434526b,%g7,%l1 ! %l1 = b60e42a7a434526b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 244d81c87b1e66ad
	setx	0xcaf079703de746a3,%g7,%l0 ! %l0 = caf079703de746a3
!	%l1 = b60e42a7a434526b
	setx	0x0e06a467eede918c,%g7,%l1 ! %l1 = 0e06a467eede918c
!	%f21 = 50ff25e9, %f7  = ff7392ff
	fstoi	%f21,%f7 		! %f7  = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 3f428b93 55000000, %l0 = 3de746a3, %l1 = eede918c
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 000000003f428b93 0000000055000000

p0_label_285:
!	Mem[00000000100c1408] = 000000ff, %l7 = 0000000050ff25e9
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l3 = ffffffffffffffab
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141408] = 50ff25e9, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 00000000000050ff
!	Mem[0000000010101400] = 1e000000, %f20 = 00000055
	lda	[%i4+%g0]0x88,%f20	! %f20 = 1e000000
!	Mem[0000000010101400] = 1e000000, %l0 = 000000003f428b93
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = fff80000, %l6 = ffffffffffffffff
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l3 = 000000000000ffff
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010101410] = ff9273ff4483009b, %f26 = 000000ff ffffffff
	ldd	[%i4+%o5],%f26		! %f26 = ff9273ff 4483009b
!	Mem[0000000030101400] = fff87fff, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000fff8
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000

p0_label_286:
!	%f10 = 00000000 53d4c63e, %l6 = 0000000000000000
!	Mem[0000000030001420] = ff547f31e837839c
	add	%i0,0x020,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030001420] = ff547f31e837839c
!	%f8  = ce9e00fe 000000ef, %l1 = 0000000055000000
!	Mem[00000000300c1428] = 1e9273ff000000ef
	add	%i3,0x028,%g1
	stda	%f8,[%g1+%l1]ASI_PST16_SL ! Mem[00000000300c1428] = 1e9273ff000000ef
!	%f22 = 00000000 ffffffff, %l7 = 0000000000000000
!	Mem[0000000030101418] = 00000080448300c6
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101418] = 00000080448300c6
!	Mem[0000000030181410] = ffffffff, %l5 = 000000000000ffff
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000ffffffff, Mem[0000000010041408] = e925ff50ffffffff
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ffffffff
!	%l6 = 0000000000000000, Mem[0000000030181400] = ff000000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000030141410] = ff73921e, %l1 = 0000000055000000
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030041410] = 50ff25e9 ffffffff
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 00f6154d, %l7 = 0000000000000000
	ldsba	[%o3+0x140]%asi,%l7	! %l7 = 0000000000000000

p0_label_287:
!	Mem[00000000100c1400] = 00000000, %f20 = 1e000000
	lda	[%i3+%g0]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010081410] = 9b008344, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 000000009b008344
!	Mem[0000000010181410] = 0000f8ffe925ff1e, %f26 = ff9273ff 4483009b
	ldda	[%i6+%o5]0x80,%f26	! %f26 = 0000f8ff e925ff1e
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 00000000ffffffff
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030101400] = fff87fff e0000000 00000000 e925ff50
!	Mem[0000000030101410] = 7fff73ff 1e9273ff 00000080 448300c6
!	Mem[0000000030101420] = 2effda45 98aeb94b a89ebb99 000003d1
!	Mem[0000000030101430] = ad000000 000046ff ef000000 ff73921e
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000100c1418] = 000000a8, %f10 = 00000000
	ld	[%i3+0x018],%f10	! %f10 = 000000a8
!	Mem[0000000010181410] = fff80000, %l4 = 00000000000050ff
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %f8  = ce9e00fe 000000ef
	ldda	[%i2+%o4]0x89,%f8 	! %f8  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000009b008344, Mem[00000000211c0000] = abffb6f7, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 8344b6f7

p0_label_288:
!	%l7 = 0000000000000000, Mem[0000000030001408] = ffffff8f
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ff8f
!	%l6 = 0000000000000000, Mem[0000000030001400] = 1e9273ff
	stba	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 1e927300
!	%f12 = 00000000, %f6  = a89ebb99, %f14 = 92118061
	fdivs	%f12,%f6 ,%f14		! %f14 = 80000000
!	Mem[0000000010181410] = fff80000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000fff80000
!	%l1 = 0000000000000000, Mem[0000000030141400] = 00000000ffff0000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f0  = a8000000 a8000000, Mem[0000000010081410] = 4483009b ffffffff
	stda	%f0 ,[%i2+%o5]0x88	! Mem[0000000010081410] = a8000000 a8000000
!	Mem[0000000030181410] = 0000ffff, %l7 = 00000000fff80000
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = ff2a3ba1, %l2 = 000000009b008344, %asi = 80
	swapa	[%i0+0x008]%asi,%l2	! %l2 = 00000000ff2a3ba1
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000000000000000, %f8  = 00000000 00000000
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = 00000000 00000000

p0_label_289:
!	Mem[00000000100c1408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f0  = a8000000, %f6  = a89ebb99
	fcmpes	%fcc1,%f0 ,%f6 		! %fcc1 = 2
!	Mem[0000000030001400] = 1e927300, %l2 = 00000000ff2a3ba1
	ldswa	[%i0+%g0]0x89,%l2	! %l2 = 000000001e927300
!	Mem[00000000100c1408] = ff000000, %l2 = 000000001e927300
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 0000001ea8000000, %f14 = 80000000 000000ff
	ldda	[%i4+%g0]0x80,%f14	! %f14 = 0000001e a8000000
!	Mem[0000000010141404] = 000000ff, %f0  = a8000000
	ld	[%i5+0x004],%f0 	! %f0 = 000000ff
!	Mem[0000000010081400] = 00000000 00000000, %l0 = 0000fff8, %l1 = 00000000
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181408] = 938b423f, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 000000000000423f
!	%l2 = 0000000000000000, immed = fffff838, %y  = 00000000
	smul	%l2,-0x7c8,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = a8000000
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = a80000ff

p0_label_290:
	membar	#Sync			! Added by membar checker (51)
!	%f8  = 00000000 00000000, Mem[0000000030101408] = 00000000 e925ff50
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001410] = f8ffa75a feba0af3
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000010041410] = 0000009b9ccb0000
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	Mem[00000000218001c0] = ff50ae2e, %l6 = 0000000000000000
	ldstub	[%o3+0x1c0],%l6		! %l6 = 000000ff000000ff
!	%l4 = 0000000000000000, %l0 = 0000000000000000, %y  = 00000000
	umul	%l4,%l0,%l7		! %l7 = 0000000000000000, %y = 00000000
!	%l3 = 00000000ffffffff, Mem[0000000010041410] = 00000000
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	%f16 = fff87fff e0000000, %f2  = 00000000 ffffffff
	fdtox	%f16,%f2 		! %f2  = 80000000 00000000
!	Mem[000000001004142b] = 5aa710f8, %l5 = 0000000000000000
	ldstuba	[%i1+0x02b]%asi,%l5	! %l5 = 000000f8000000ff
!	Mem[00000000100c1430] = 9b008344, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x030]%asi,%l6	! %l6 = 000000009b008344
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = 000000a8, %l1 = 0000000000000000
	lduw	[%i2+0x03c],%l1		! %l1 = 00000000000000a8

p0_label_291:
!	Mem[0000000010041400] = 00000000, %l3 = 00000000ffffffff
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l6 = 000000009b008344
	ldsh	[%i0+0x002],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = e925ff50, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffe925
!	Mem[0000000030081410] = 00000000000000ff, %f10 = 000000a8 53d4c63e
	ldda	[%i2+%o5]0x89,%f10	! %f10 = 00000000 000000ff
!	Mem[00000000201c0000] = bb999a5f, %l3 = ffffffffffffe925
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffff99
!	Mem[0000000010001410] = 0000000000000000, %l1 = 00000000000000a8
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101420] = ce9e00fe 000000ef, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+0x020]%asi,%l0	! %l0 = 00000000ce9e00fe 00000000000000ef
!	Mem[000000001000143c] = f8ffa75a, %l7 = 0000000000000000
	ldub	[%i0+0x03c],%l7		! %l7 = 00000000000000f8
!	Mem[000000001008143c] = 000000a8, %l7 = 00000000000000f8
	lduha	[%i2+0x03e]%asi,%l7	! %l7 = 00000000000000a8
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010181400] = ffffffff000000ff
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000

p0_label_292:
!	%l1 = 00000000000000ef, Mem[0000000010141410] = ff73921e00000000
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ef
!	Mem[0000000030181408] = ffffab00, %l0 = 00000000ce9e00fe
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffffab00
!	%f0  = 000000ff a8000000, %l0 = 00000000ffffab00
!	Mem[0000000030041408] = 00000000000000ff
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041408] = 00000000000000ff
!	Mem[0000000030001400] = 1e927300, %l7 = 00000000000000a8
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f20 = 7fff73ff 1e9273ff, Mem[00000000300c1410] = 00000000 00000000
	stda	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7fff73ff 1e9273ff
!	Mem[0000000010141410] = ef00000000000000, %l1 = 00000000000000ef, %l6 = 0000000000000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = ef00000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ef
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000f8, Mem[0000000030041410] = 00000000 00000000
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000f8
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff000000, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ff000000

p0_label_293:
!	Mem[00000000100c1408] = 000000ff000000ff, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010001400] = 00000000 00000000 9b008344 1e9273ff
!	Mem[0000000010001410] = 00000000 00000000 ff9273ff 4483009b
!	Mem[0000000010001420] = 01ec8a13 e925ff50 1e9273ff 000000ef
!	Mem[0000000010001430] = ff73921e a13b2a6d ce9e00fe f8ffa75a
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030181408] = ce9e00fe, %l0 = 00000000ffffab00
	ldsba	[%i6+%o4]0x89,%l0	! %l0 = fffffffffffffffe
!	Mem[0000000010141400] = 000003d1, %l6 = ef00000000000000
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = ff00ffff00000000, %f0  = 000000ff a8000000
	ldda	[%i6+%o5]0x81,%f0 	! %f0  = ff00ffff 00000000
!	Mem[0000000030001408] = 8fff0000, %l2 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff e391d5ab, %l6 = 00000000, %l7 = ff000000
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000e391d5ab
!	Mem[0000000010141408] = 0000001e, %l3 = ffffffffffffff99
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 000000000000001e
!	Mem[0000000010041434] = 0000abff, %l6 = 00000000ffffffff
	ldsh	[%i1+0x034],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = fffffffffffffffe, Mem[000000001018143f] = ff9273ff, %asi = 80
	stba	%l0,[%i6+0x03f]%asi	! Mem[000000001018143c] = ff9273fe

p0_label_294:
!	%l4 = 000000ff000000ff, Mem[0000000010041410] = ff00000000000000
	stx	%l4,[%i1+%o5]		! Mem[0000000010041410] = 000000ff000000ff
!	%l5 = 00000000000000f8, Mem[0000000010041400] = 00000000
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f8
!	Mem[0000000010141408] = 0000001e, %l3 = 000000000000001e
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 0000001e000000ff
!	Mem[0000000010001408] = 9b008344, %l0 = fffffffffffffffe
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 0000009b000000ff
!	%l0 = 000000000000009b, Mem[0000000010141408] = ff000000
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 009b0000
!	%l2 = 00000000, %l3 = 0000001e, Mem[0000000010181408] = 938b423f 00000055
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 0000001e
!	%l5 = 00000000000000f8, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000f8
!	%l0 = 000000000000009b, Mem[0000000020800040] = abff978a
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 9bff978a
!	Mem[0000000010141408] = 00009b00, %l3 = 000000000000001e
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000009b00
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 9bff978a, %l1 = 0000000000000000
	ldsb	[%o1+0x040],%l1		! %l1 = ffffffffffffff9b

p0_label_295:
!	Mem[0000000010181408] = 00000000 1e000000, %l2 = 00000000, %l3 = 00009b00
	ldd	[%i6+%o4],%l2		! %l2 = 0000000000000000 000000001e000000
!	Mem[00000000300c1400] = ffffffff, %l7 = 00000000e391d5ab
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181420] = ff83ffff, %l3 = 000000001e000000
	ldsh	[%i6+0x020],%l3		! %l3 = ffffffffffffff83
!	Mem[00000000300c1400] = ffffffff, %f9  = 00000000
	lda	[%i3+%g0]0x89,%f9 	! %f9 = ffffffff
!	Mem[0000000010181408] = 00000000 1e000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000 000000001e000000
!	Mem[0000000030001400] = 1e9273ff, %f1  = 00000000
	lda	[%i0+%g0]0x89,%f1 	! %f1 = 1e9273ff
!	Mem[0000000010041400] = f8000000, %f10 = 00000000
	lda	[%i1+%g0]0x88,%f10	! %f10 = f8000000
!	Mem[0000000030001408] = 0000ff8f, %l4 = 000000ff000000ff
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 000000000000ff8f
!	Mem[0000000010041400] = f8000000, %l7 = 000000001e000000
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = fffffffff8000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ef000000, %l3 = ffffffffffffff83
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ef000000

p0_label_296:
!	%f2  = 80000000, %f8  = 00000000, %f13 = 00000000
	fmuls	%f2 ,%f8 ,%f13		! %f13 = 80000000
!	Mem[0000000010081410] = 000000a8, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000a8
!	%l1 = ffffffffffffff9b, Mem[0000000030081408] = 000000ff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff9b
!	%l0 = 0000009b, %l1 = ffffff9b, Mem[0000000010101438] = 92118061 000000ff
	stda	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000009b ffffff9b
!	Mem[0000000030101408] = 00000000, %l7 = fffffffff8000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000ef000000, Mem[0000000030081410] = ff000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l7 = 0000000000000000, %l4 = 000000000000ff8f, %l0 = 000000000000009b
	orn	%l7,%l4,%l0		! %l0 = ffffffffffff0070
!	%f0  = ff00ffff, Mem[000000001008140c] = 00000000
	st	%f0 ,[%i2+0x00c]	! Mem[000000001008140c] = ff00ffff
!	%f12 = 00000000 80000000, %l5 = 00000000000000f8
!	Mem[0000000030081408] = 9bffffff00000000
	add	%i2,0x008,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081408] = 9bffff8000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffff00ff 00000000, %l4 = 0000ff8f, %l5 = 000000f8
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ffff00ff

p0_label_297:
!	Mem[0000000010041410] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ffffffff 50ff25e9, %l0 = ffff0070, %l1 = ffffff9b
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000050ff25e9 00000000ffffffff
!	Mem[0000000010081408] = 00000000, %l0 = 0000000050ff25e9
	ldsh	[%i2+0x00a],%l0		! %l0 = 0000000000000000
!	Mem[000000001004143c] = ffffffff, %l1 = 00000000ffffffff
	ldsba	[%i1+0x03f]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = ce9e00fe, %l6 = 00000000000000a8
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ce9e00fe
!	Mem[0000000010041410] = 000000ff000000ff, %l2 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141400] = 000003d1000000ff, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 000003d1000000ff
!	Mem[00000000218000c0] = ffa8635c, %l1 = ffffffffffffffff
	ldsh	[%o3+0x0c0],%l1		! %l1 = ffffffffffffffa8
!	Mem[0000000010141410] = ffffff83, %l4 = 0000000000000000
	ldsha	[%i5+0x012]%asi,%l4	! %l4 = ffffffffffffff83
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l0 = 000003d1000000ff
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_298:
!	%l5 = 00000000ffff00ff, Mem[0000000010141408] = 0000001e
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff00ff
!	%f0  = ff00ffff, Mem[00000000100c1400] = 00000000
	st	%f0 ,[%i3+%g0]		! Mem[00000000100c1400] = ff00ffff
!	%l4 = ffffffffffffff83, Mem[0000000010181400] = 0000000000000000
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffffffffff83
!	%f4  = ffffffff 4483009b, Mem[0000000030141400] = 00000000 00000000
	stda	%f4 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff 4483009b
!	%l2 = 000000ff, %l3 = ef000000, Mem[0000000030081400] = 01ec8a13 000000a8
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff ef000000
!	%f27 = ff73921e, Mem[0000000010181400] = ffffff83
	sta	%f27,[%i6+%g0]0x88	! Mem[0000000010181400] = ff73921e
!	Mem[0000000010081410] = 00000000, %l7 = 00000000, %l5 = ffff00ff
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = a80000ff, %l1 = ffffffffffffffa8
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000a80000ff
!	%l3 = 00000000ef000000, Mem[0000000030001408] = 0000ff8ffff20084
	stxa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ef000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 00000000, %f22 = 9b008344
	lda	[%i4+0x034]%asi,%f22	! %f22 = 00000000

p0_label_299:
!	Mem[0000000010101408] = 50ff25e9, %l2 = 000000ff000000ff
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 0000000050ff25e9
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 4483009b, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 000000004483009b
!	Mem[0000000030041410] = 00000000, %f7  = 7fffffff
	lda	[%i1+%o5]0x89,%f7 	! %f7 = 00000000
!	Mem[00000000100c1420] = 00000000, %l3 = 00000000ef000000
	ldub	[%i3+0x023],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f19 = 4483009b
	lda	[%i2+%o5]0x81,%f19	! %f19 = 00000000
!	Mem[0000000030141410] = ff73921e, %l2 = 0000000050ff25e9
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff73
!	Mem[0000000030081410] = 00000000 00000000, %l4 = ffffff83, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 00000000ce9e00fe
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = ffffffff 4483009b, Mem[0000000010101410] = ff9273ff 4483009b
	stda	%f4 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff 4483009b

p0_label_300:
!	Mem[0000000030001400] = 1e9273ff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010081400] = 00000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000030101408] = f800000000000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000030101400] = fff87fff, %l0 = 000000004483009b
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 00000000fff87fff
!	%l4 = 0000000000000000, %l3 = 0000000000000000, %l2 = ffffffffffffff73
	addc	%l4,%l3,%l2		! %l2 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030001400] = 1e9273ff
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 1e927300
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 00000000fff87fff
	setx	0xee4b3dc86e6b516f,%g7,%l0 ! %l0 = ee4b3dc86e6b516f
!	%l1 = 00000000a80000ff
	setx	0x842e818f9ea10b74,%g7,%l1 ! %l1 = 842e818f9ea10b74
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ee4b3dc86e6b516f
	setx	0xc802a4686ffc7ec4,%g7,%l0 ! %l0 = c802a4686ffc7ec4
!	%l1 = 842e818f9ea10b74
	setx	0x0ccc7cdf88d15544,%g7,%l1 ! %l1 = 0ccc7cdf88d15544
!	%f26 = ef000000, Mem[00000000100c1400] = ffff00ff
	sta	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = ef000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	subc	%l5,%l5,%l0
	and	%l5,%l1,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be c802a4686ffc7ec4
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0ccc7cdf88d15544
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be ff00ffff 1e9273ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 80000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff 4483009b
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be a89ebb99 00000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 ffffffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be f8000000 000000ff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 80000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 0000001e a8000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff73921e 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 ff7392ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 50ff25e9 138aec01
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ef000000 ff73921e
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 6d2a3ba1 1e9273ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 5aa7fff8 fe009ece
	bne	%xcc,p0_f30_fail
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
p0_f0_fail:
	set	p0_temp,%g6
	mov	0xf00,%l0
	stx	%l0,[%g6]
	std	%f0,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f2_fail:
	set	p0_temp,%g6
	mov	0xf02,%l0
	stx	%l0,[%g6]
	std	%f2,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f4_fail:
	set	p0_temp,%g6
	mov	0xf04,%l0
	stx	%l0,[%g6]
	std	%f4,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f6_fail:
	set	p0_temp,%g6
	mov	0xf06,%l0
	stx	%l0,[%g6]
	std	%f6,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f8_fail:
	set	p0_temp,%g6
	mov	0xf08,%l0
	stx	%l0,[%g6]
	std	%f8,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f10_fail:
	set	p0_temp,%g6
	mov	0xf10,%l0
	stx	%l0,[%g6]
	std	%f10,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f12_fail:
	set	p0_temp,%g6
	mov	0xf12,%l0
	stx	%l0,[%g6]
	std	%f12,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f14_fail:
	set	p0_temp,%g6
	mov	0xf14,%l0
	stx	%l0,[%g6]
	std	%f14,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f16_fail:
	set	p0_temp,%g6
	mov	0xf16,%l0
	stx	%l0,[%g6]
	std	%f16,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f18_fail:
	set	p0_temp,%g6
	mov	0xf18,%l0
	stx	%l0,[%g6]
	std	%f18,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f20_fail:
	set	p0_temp,%g6
	mov	0xf20,%l0
	stx	%l0,[%g6]
	std	%f20,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f22_fail:
	set	p0_temp,%g6
	mov	0xf22,%l0
	stx	%l0,[%g6]
	std	%f22,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f24_fail:
	set	p0_temp,%g6
	mov	0xf24,%l0
	stx	%l0,[%g6]
	std	%f24,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f26_fail:
	set	p0_temp,%g6
	mov	0xf26,%l0
	stx	%l0,[%g6]
	std	%f26,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f28_fail:
	set	p0_temp,%g6
	mov	0xf28,%l0
	stx	%l0,[%g6]
	std	%f28,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f30_fail:
	set	p0_temp,%g6
	mov	0xf30,%l0
	stx	%l0,[%g6]
	std	%f30,[%g6+8]
	stx	%fsr,[%g6+16]
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

p0_trap1e:
	mulx	%l1,-0xa50,%l2
	stwa	%l4,[%i1+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010041400]
	orn	%l7,-0xb42,%l0
	sdivx	%l5,%l4,%l5
	done

p0_trap1o:
	mulx	%l1,-0xa50,%l2
	stwa	%l4,[%o1+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010041400]
	orn	%l7,-0xb42,%l0
	sdivx	%l5,%l4,%l5
	done


p0_trap2e:
	fcmps	%fcc3,%f1 ,%f11
	fmuls	%f2 ,%f12,%f8 
	add	%l7,%l5,%l5
	fcmps	%fcc2,%f13,%f2 
	add	%l6,0x7af,%l0
	fdtoi	%f0 ,%f1 
	done

p0_trap2o:
	fcmps	%fcc3,%f1 ,%f11
	fmuls	%f2 ,%f12,%f8 
	add	%l7,%l5,%l5
	fcmps	%fcc2,%f13,%f2 
	add	%l6,0x7af,%l0
	fdtoi	%f0 ,%f1 
	done


p0_trap3e:
	addc	%l6,0x6fa,%l0
	andn	%l3,%l4,%l5
	andn	%l1,%l5,%l1
	done

p0_trap3o:
	addc	%l6,0x6fa,%l0
	andn	%l3,%l4,%l5
	andn	%l1,%l5,%l1
	done

!	Cross Processor Interrupt Handler

cross_intr_handler:
	membar	#Sync
!	Identify the recipient of the interrupt
	mov	0x10,%g1		! VA of Core ID Register
	ldxa	[%g1]ASI_CMP_CORE_ID,%g1
	and	%g1,0x3f,%g4		! Extract Core ID in %g4
	sll	%g4,2,%g1		! Index into intr receive array
	set	received_xintr,%g2	! Pointer to receive counters
	lduw	[%g2+%g1],%g3		! Get receive count
	inc	%g3			! Incement by 1
	st	%g3,[%g2+%g1]		! Update receive count
!	Reset busy bit interrupts and return
	mov	0x40,%g1		! Busy bit
	stxa	%g1,[%g0]ASI_INTR_RECEIVE ! Clear the busy bit
	membar	#Sync
	retry

inst_access_handler:
	done 

	.align	256
data_access_handler:
1:	done

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
	ldx	[%g1+0x000],%l0		! %l0 = dfa150100b3150cb
	ldx	[%g1+0x008],%l1		! %l1 = 440b4842357675b0
	ldx	[%g1+0x010],%l2		! %l2 = 15075156832a9fcf
	ldx	[%g1+0x018],%l3		! %l3 = 3bfc0aae51215841
	ldx	[%g1+0x020],%l4		! %l4 = a38361688f76d360
	ldx	[%g1+0x028],%l5		! %l5 = ff2e297c22c0294a
	ldx	[%g1+0x030],%l6		! %l6 = 77be6b81f9cd7d04
	ldx	[%g1+0x038],%l7		! %l7 = 3d920a4a6987147c

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
user_near0_start:
p0_near_0_le:
	jmpl	%o7,%g0
	mulx	%l1,-0xa50,%l2
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	sdivx	%l5,-0xb84,%l5
	fadds	%f24,%f17,%f19
	sdivx	%l3,%l4,%l7
	jmpl	%o7,%g0
	fmuls	%f28,%f24,%f24
near0_b2b_h:
	fdivs	%f29,%f20,%f28
	add	%l6,0x7af,%l0
	xnor	%l0,-0x928,%l5
	jmpl	%o7,%g0
	fsqrts	%f18,%f20
near0_b2b_l:
	udivx	%l2,%l4,%l0
	fdtoi	%f0 ,%f1 
	and	%l0,0x635,%l3
	jmpl	%o7,%g0
	addc	%l6,%l2,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fsubs	%f13,%f13,%f3 
	xnor	%l4,%l6,%l4
	andn	%l1,0xd5d,%l1
	fsqrts	%f2 ,%f1 
	fstod	%f14,%f12
	xnor	%l1,-0x4e0,%l2
	orn	%l2,%l4,%l1
	jmpl	%o7,%g0
	sub	%l2,%l1,%l4
p0_near_1_he:
	addc	%l0,-0x7e4,%l1
	mulx	%l3,-0xcac,%l6
	umul	%l4,%l3,%l5
	umul	%l0,%l1,%l3
	jmpl	%o7,%g0
	sub	%l7,0x78c,%l3
near1_b2b_h:
	fcmps	%fcc0,%f23,%f23
	fsubs	%f29,%f21,%f18
	fcmps	%fcc3,%f29,%f28
	fsubs	%f19,%f20,%f31
	addc	%l2,%l3,%l5
	fadds	%f22,%f30,%f25
	mulx	%l6,0x92c,%l3
	jmpl	%o7,%g0
	fadds	%f22,%f20,%f16
near1_b2b_l:
	smul	%l4,%l3,%l7
	mulx	%l3,-0x8ce,%l7
	addc	%l6,0x496,%l3
	fsqrts	%f6 ,%f15
	and	%l3,%l5,%l1
	mulx	%l0,%l2,%l4
	subc	%l1,0xbb7,%l0
	jmpl	%o7,%g0
	or	%l0,%l5,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fsubs	%f10,%f5 ,%f13
	st	%f11,[%i2+0x034]	! Mem[0000000010081434]
	and	%l7,0x5cc,%l6
	fstoi	%f0 ,%f14
	sub	%l0,0x350,%l0
	fdivs	%f8 ,%f0 ,%f15
	or	%l5,%l3,%l1
	jmpl	%o7,%g0
	xnor	%l6,0xb21,%l0
p0_near_2_he:
	or	%l2,0x536,%l6
	udivx	%l4,%l6,%l5
	fsubs	%f26,%f17,%f30
	xor	%l1,-0x891,%l0
	lduw	[%i1+0x028],%l4		! Mem[0000000010041428]
	jmpl	%o7,%g0
	add	%l5,-0xe22,%l2
near2_b2b_h:
	smul	%l5,%l1,%l2
	jmpl	%o7,%g0
	fsubs	%f28,%f23,%f16
near2_b2b_l:
	umul	%l0,%l6,%l6
	jmpl	%o7,%g0
	sdivx	%l3,-0x0ef,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	andn	%l4,%l3,%l5
	mulx	%l3,0xfff,%l3
	umul	%l6,%l4,%l7
	jmpl	%o7,%g0
	xnor	%l3,0xc0e,%l7
p0_near_3_he:
	sdivx	%l2,-0x6a9,%l3
	andn	%l5,0xe94,%l4
	or	%l7,0xb16,%l4
	xnor	%l5,%l5,%l3
	jmpl	%o7,%g0
	sub	%l7,%l3,%l2
near3_b2b_h:
	fadds	%f27,%f17,%f26
	and	%l6,%l7,%l3
	fdivs	%f23,%f21,%f20
	jmpl	%o7,%g0
	umul	%l7,%l5,%l0
near3_b2b_l:
	orn	%l4,%l4,%l4
	add	%l6,-0x8be,%l0
	subc	%l2,-0xf23,%l4
	jmpl	%o7,%g0
	add	%l7,%l7,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fmuls	%f13,%f12,%f8 
	smul	%l5,%l7,%l4
	sdivx	%l5,-0xc60,%l1
	fdivs	%f5 ,%f10,%f2 
	sdivx	%l1,0x5b1,%l6
	andn	%l7,%l3,%l4
	jmpl	%o7,%g0
	sub	%l0,0x612,%l2
p0_far_0_lem:
	fmuls	%f13,%f12,%f8 
	smul	%l5,%l7,%l4
	sdivx	%l5,-0xc60,%l1
	fdivs	%f5 ,%f10,%f2 
	sdivx	%l1,0x5b1,%l6
	andn	%l7,%l3,%l4
	jmpl	%o7,%g0
	sub	%l0,0x612,%l2
p0_far_0_he:
	sub	%l2,%l7,%l5
	mulx	%l2,%l0,%l1
	orn	%l3,-0x78a,%l2
	smul	%l5,%l3,%l2
	jmpl	%o7,%g0
	subc	%l7,0xaf9,%l3
p0_far_0_hem:
	sub	%l2,%l7,%l5
	mulx	%l2,%l0,%l1
	orn	%l3,-0x78a,%l2
	smul	%l5,%l3,%l2
	jmpl	%o7,%g0
	subc	%l7,0xaf9,%l3
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	addc	%l0,0x894,%l0
	or	%l5,-0x22d,%l6
	fadds	%f30,%f22,%f18
	addc	%l6,%l2,%l5
	fsubs	%f21,%f31,%f19
	fcmps	%fcc2,%f18,%f21
	jmpl	%o7,%g0
	xnor	%l1,0xff4,%l7
far0_b2b_l:
	fsqrts	%f1 ,%f0 
	fsubs	%f9 ,%f15,%f6 
	andn	%l1,0x89e,%l7
	umul	%l1,%l2,%l3
	xnor	%l3,%l6,%l5
	smul	%l5,0x51d,%l2
	jmpl	%o7,%g0
	fadds	%f6 ,%f9 ,%f5 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l5,0x248,%l0
	fcmps	%fcc3,%f4 ,%f2 
	fdivs	%f14,%f6 ,%f0 
	smul	%l5,%l4,%l4
	fitos	%f11,%f2 
	jmpl	%o7,%g0
	xnor	%l1,-0x89b,%l6
p0_far_1_lem:
	mulx	%l5,0x248,%l0
	fcmps	%fcc3,%f4 ,%f2 
	fdivs	%f14,%f6 ,%f0 
	smul	%l5,%l4,%l4
	fitos	%f11,%f2 
	jmpl	%o7,%g0
	xnor	%l1,-0x89b,%l6
p0_far_1_he:
	fsqrts	%f21,%f29
	jmpl	%o7,%g0
	fitos	%f27,%f21
p0_far_1_hem:
	fsqrts	%f21,%f29
	jmpl	%o7,%g0
	fitos	%f27,%f21
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	subc	%l2,-0xfeb,%l4
	xor	%l0,%l4,%l3
	xnor	%l4,%l7,%l6
	umul	%l1,-0x22f,%l3
	umul	%l2,%l0,%l7
	fmuls	%f27,%f25,%f18
	xor	%l7,0x994,%l1
	jmpl	%o7,%g0
	fdivs	%f23,%f27,%f30
far1_b2b_l:
	fdivs	%f13,%f1 ,%f12
	fdivs	%f14,%f12,%f0 
	fmuls	%f9 ,%f5 ,%f0 
	or	%l6,%l2,%l3
	xnor	%l1,-0xeb0,%l7
	fadds	%f3 ,%f2 ,%f8 
	sub	%l6,-0x716,%l1
	jmpl	%o7,%g0
	subc	%l2,0x568,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	orn	%l7,0x4bc,%l4
	ldstub	[%o3+0x000],%l1		! Mem[0000000021800000]
	fmuls	%f13,%f3 ,%f0 
	fsubs	%f8 ,%f5 ,%f2 
	smul	%l4,0xfdc,%l3
	jmpl	%o7,%g0
	smul	%l6,0xc5f,%l5
p0_far_2_lem:
	orn	%l7,0x4bc,%l4
	ldstub	[%o3+0x000],%l1		! Mem[0000000021800000]
	fmuls	%f13,%f3 ,%f0 
	fsubs	%f8 ,%f5 ,%f2 
	smul	%l4,0xfdc,%l3
	jmpl	%o7,%g0
	smul	%l6,0xc5f,%l5
p0_far_2_he:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f24,%f22
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f24,%f22
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	mulx	%l1,0x15a,%l2
	smul	%l5,-0xca1,%l1
	fsqrts	%f28,%f18
	sdivx	%l1,0x962,%l2
	xor	%l4,-0x514,%l3
	addc	%l3,%l3,%l5
	jmpl	%o7,%g0
	udivx	%l2,%l5,%l0
far2_b2b_l:
	fadds	%f2 ,%f5 ,%f10
	fcmps	%fcc2,%f12,%f1 
	mulx	%l3,-0x71f,%l3
	orn	%l6,%l0,%l5
	umul	%l4,-0xcab,%l6
	fdivs	%f6 ,%f1 ,%f4 
	jmpl	%o7,%g0
	sub	%l4,%l6,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	sth	%l5,[%i3+0x01e]		! Mem[00000000100c141e]
	xor	%l0,0x60d,%l2
	jmpl	%o7,%g0
	or	%l2,%l4,%l0
p0_far_3_lem:
	membar	#Sync
	sth	%l5,[%i3+0x01e]		! Mem[00000000100c141e]
	xor	%l0,0x60d,%l2
	jmpl	%o7,%g0
	or	%l2,%l4,%l0
p0_far_3_he:
	orn	%l4,-0x930,%l7
	sub	%l7,-0xedd,%l5
	andn	%l6,%l0,%l0
	jmpl	%o7,%g0
	mulx	%l7,-0x92e,%l3
p0_far_3_hem:
	orn	%l4,-0x930,%l7
	sub	%l7,-0xedd,%l5
	andn	%l6,%l0,%l0
	jmpl	%o7,%g0
	mulx	%l7,-0x92e,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	and	%l2,%l7,%l4
	orn	%l2,%l0,%l6
	and	%l0,%l5,%l4
	xnor	%l6,-0x60a,%l7
	jmpl	%o7,%g0
	orn	%l6,%l0,%l5
far3_b2b_l:
	addc	%l7,%l1,%l2
	or	%l5,%l1,%l4
	sub	%l3,%l4,%l4
	fmuls	%f1 ,%f8 ,%f13
	jmpl	%o7,%g0
	subc	%l3,%l0,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	umul	%l6,%l7,%l7
p0_call_0_le:
	xnor	%l2,-0x229,%l1
	stx	%l0,[%i2+0x018]		! Mem[0000000010081418]
	orn	%l7,0x42d,%l5
	subc	%l5,%l2,%l2
	retl
	sth	%l6,[%i3+0x018]		! Mem[00000000100c1418]
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	umul	%l6,%l7,%l7
p0_call_0_lo:
	xnor	%l2,-0x229,%l1
	stx	%l0,[%o2+0x018]		! Mem[0000000010081418]
	orn	%l7,0x42d,%l5
	subc	%l5,%l2,%l2
	retl
	sth	%l6,[%o3+0x018]		! Mem[00000000100c1418]
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	andn	%l0,%l1,%l0
p0_call_0_he:
	udivx	%l0,-0x678,%l5
	retl
	smul	%l3,%l0,%l5
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	andn	%l0,%l1,%l0
p0_call_0_ho:
	udivx	%l0,-0x678,%l5
	retl
	smul	%l3,%l0,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	umul	%l4,%l1,%l2
p0_call_1_le:
	smul	%l0,0x90c,%l5
	sub	%l6,-0x41f,%l5
	mulx	%l6,-0xf82,%l6
	fcmps	%fcc3,%f10,%f7 
	retl
	smul	%l3,%l6,%l7
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	umul	%l4,%l1,%l2
p0_call_1_lo:
	smul	%l0,0x90c,%l5
	sub	%l6,-0x41f,%l5
	mulx	%l6,-0xf82,%l6
	fcmps	%fcc3,%f10,%f7 
	retl
	smul	%l3,%l6,%l7
p0_jmpl_1_he:
	fmuls	%f29,%f28,%f20
	fadds	%f17,%f31,%f16
	and	%l3,0x2c8,%l1
	swap	[%i5+0x034],%l4		! Mem[0000000010141434]
	add	%l7,%l1,%l5
	xnor	%l1,%l7,%l2
	fsubs	%f17,%f26,%f31
	jmpl	%g6+8,%g0
	xor	%l0,%l2,%l7
p0_call_1_he:
	sdivx	%l3,0xd12,%l1
	smul	%l1,%l0,%l6
	sub	%l4,%l6,%l2
	umul	%l4,%l1,%l0
	retl
	xor	%l2,-0x5f4,%l3
p0_jmpl_1_ho:
	fmuls	%f29,%f28,%f20
	fadds	%f17,%f31,%f16
	and	%l3,0x2c8,%l1
	swap	[%o5+0x034],%l4		! Mem[0000000010141434]
	add	%l7,%l1,%l5
	xnor	%l1,%l7,%l2
	fsubs	%f17,%f26,%f31
	jmpl	%g6+8,%g0
	xor	%l0,%l2,%l7
p0_call_1_ho:
	sdivx	%l3,0xd12,%l1
	smul	%l1,%l0,%l6
	sub	%l4,%l6,%l2
	umul	%l4,%l1,%l0
	retl
	xor	%l2,-0x5f4,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	andn	%l6,%l7,%l1
	or	%l7,%l2,%l5
	udivx	%l2,%l3,%l1
	umul	%l2,0x10b,%l3
	orn	%l7,%l5,%l6
	st	%f6 ,[%i6+0x030]	! Mem[0000000010181430]
	jmpl	%g6+8,%g0
	addc	%l4,0x796,%l4
p0_call_2_le:
	mulx	%l4,%l0,%l3
	fadds	%f12,%f12,%f8 
	sub	%l3,%l4,%l4
	add	%l2,0x2b8,%l1
	xnor	%l6,0x0a4,%l1
	retl
	fadds	%f10,%f0 ,%f7 
p0_jmpl_2_lo:
	andn	%l6,%l7,%l1
	or	%l7,%l2,%l5
	udivx	%l2,%l3,%l1
	umul	%l2,0x10b,%l3
	orn	%l7,%l5,%l6
	st	%f6 ,[%o6+0x030]	! Mem[0000000010181430]
	jmpl	%g6+8,%g0
	addc	%l4,0x796,%l4
p0_call_2_lo:
	mulx	%l4,%l0,%l3
	fadds	%f12,%f12,%f8 
	sub	%l3,%l4,%l4
	add	%l2,0x2b8,%l1
	xnor	%l6,0x0a4,%l1
	retl
	fadds	%f10,%f0 ,%f7 
p0_jmpl_2_he:
	stx	%l7,[%i2+0x020]		! Mem[0000000010081420]
	fadds	%f27,%f30,%f23
	sub	%l6,0x25a,%l2
	fdivs	%f21,%f16,%f31
	fadds	%f28,%f21,%f28
	andn	%l2,-0xa63,%l1
	umul	%l0,%l2,%l2
	jmpl	%g6+8,%g0
	addc	%l4,%l7,%l4
p0_call_2_he:
	mulx	%l5,-0x7e0,%l7
	fmuls	%f20,%f16,%f19
	mulx	%l0,%l3,%l1
	retl
	mulx	%l6,0xb88,%l5
p0_jmpl_2_ho:
	stx	%l7,[%o2+0x020]		! Mem[0000000010081420]
	fadds	%f27,%f30,%f23
	sub	%l6,0x25a,%l2
	fdivs	%f21,%f16,%f31
	fadds	%f28,%f21,%f28
	andn	%l2,-0xa63,%l1
	umul	%l0,%l2,%l2
	jmpl	%g6+8,%g0
	addc	%l4,%l7,%l4
p0_call_2_ho:
	mulx	%l5,-0x7e0,%l7
	fmuls	%f20,%f16,%f19
	mulx	%l0,%l3,%l1
	retl
	mulx	%l6,0xb88,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	smul	%l7,%l5,%l3
p0_call_3_le:
	smul	%l2,-0x408,%l0
	orn	%l3,0x68e,%l3
	fcmps	%fcc0,%f13,%f8 
	addc	%l4,0xdde,%l7
	fitod	%f13,%f2 
	sub	%l0,-0xb25,%l5
	retl
	sub	%l3,-0x688,%l1
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	smul	%l7,%l5,%l3
p0_call_3_lo:
	smul	%l2,-0x408,%l0
	orn	%l3,0x68e,%l3
	fcmps	%fcc0,%f13,%f8 
	addc	%l4,0xdde,%l7
	fitod	%f13,%f2 
	sub	%l0,-0xb25,%l5
	retl
	sub	%l3,-0x688,%l1
p0_jmpl_3_he:
	xnor	%l2,%l2,%l6
	fsqrts	%f27,%f16
	smul	%l7,0x080,%l4
	subc	%l2,%l1,%l2
	jmpl	%g6+8,%g0
	sub	%l1,0xcc3,%l0
p0_call_3_he:
	fdivs	%f26,%f29,%f25
	xnor	%l2,%l7,%l1
	retl
	sdivx	%l2,0xb82,%l6
p0_jmpl_3_ho:
	xnor	%l2,%l2,%l6
	fsqrts	%f27,%f16
	smul	%l7,0x080,%l4
	subc	%l2,%l1,%l2
	jmpl	%g6+8,%g0
	sub	%l1,0xcc3,%l0
p0_call_3_ho:
	fdivs	%f26,%f29,%f25
	xnor	%l2,%l7,%l1
	retl
	sdivx	%l2,0xb82,%l6
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
Finish_Flag:
	.word	0,0
	.align	8
num_processors:
	.word	1
num_agents:
	.word	0
no_membar:
	.word	0
max_ireg:
	.word	8,0
max_freg:
	.word	32,0
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
	.word	0xdfa15010,0x0b3150cb		! Init value for %l0
	.word	0x440b4842,0x357675b0		! Init value for %l1
	.word	0x15075156,0x832a9fcf		! Init value for %l2
	.word	0x3bfc0aae,0x51215841		! Init value for %l3
	.word	0xa3836168,0x8f76d360		! Init value for %l4
	.word	0xff2e297c,0x22c0294a		! Init value for %l5
	.word	0x77be6b81,0xf9cd7d04		! Init value for %l6
	.word	0x3d920a4a,0x6987147c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7b5ae341,0x3f766aaf		! Init value for %f0 
	.word	0xdd428a92,0xd215c5a5		! Init value for %f2 
	.word	0xdec33de5,0x23ad26d4		! Init value for %f4 
	.word	0xa2f25549,0xad7b3a62		! Init value for %f6 
	.word	0x8246e301,0x86583ea6		! Init value for %f8 
	.word	0xcdb8f032,0x8b246702		! Init value for %f10
	.word	0x865c65e1,0x50ea83f4		! Init value for %f12
	.word	0x503f1b6f,0x7bd75ff4		! Init value for %f14
	.word	0xb54e5f55,0xa6f69fc5		! Init value for %f16
	.word	0xf46ef127,0x04e0f9a1		! Init value for %f18
	.word	0x90365cfc,0x06dd9ece		! Init value for %f20
	.word	0x09ff9d6a,0xfe527200		! Init value for %f22
	.word	0xfe8ba858,0x7f82a701		! Init value for %f24
	.word	0x6d88f660,0x91f2eeef		! Init value for %f26
	.word	0xd3dbec32,0x154d92b7		! Init value for %f28
	.word	0xc8c387a1,0x53e80133		! Init value for %f30
	.word	0x8d020e50,0x98067ddd		! Init value for %f32
	.word	0xf4cf87e2,0xfe320903		! Init value for %f34
	.word	0x7fe612f3,0x5f8aa323		! Init value for %f36
	.word	0x2472cfc1,0x144ce569		! Init value for %f38
	.word	0xd97a506a,0x0acd33e4		! Init value for %f40
	.word	0x2424ed8e,0x814d88ac		! Init value for %f42
	.word	0x2bbebdd7,0xd29f2302		! Init value for %f44
	.word	0x3c034490,0xea4741ae		! Init value for %f46
	.word	0x8c10802d,0x42bfc317
	.word	0x7b620049,0x5d90c8ed
	.word	0x5867f7eb,0x1919bbfa
	.word	0xa33bd434,0x8a71eb66
	.word	0xaa10b86e,0x35d94229
	.word	0x053f755d,0x80950f1c
	.word	0x8696cd99,0x8aded18d
	.word	0x49ad7854,0x01e54969
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
	.word	0xc802a468,0x6ffc7ec4
	.word	0x0ccc7cdf,0x88d15544
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xff00ffff,0x1e9273ff
	.word	0x80000000,0x00000000
	.word	0xffffffff,0x4483009b
	.word	0xa89ebb99,0x00000000
	.word	0x00000000,0xffffffff
	.word	0xf8000000,0x000000ff
	.word	0x00000000,0x80000000
	.word	0x0000001e,0xa8000000
	.word	0x00000000,0x00000000
	.word	0xff73921e,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff7392ff
	.word	0x50ff25e9,0x138aec01
	.word	0xef000000,0xff73921e
	.word	0x6d2a3ba1,0x1e9273ff
	.word	0x5aa7fff8,0xfe009ece
	.word	0x0000003e,0x00000400		! %fsr = 0000003e00000400
p0_local0_expect:
	.word	0x00000000,0x00000000
	.word	0xff008344,0x1e9273ff
	.word	0x00000000,0x00000000
	.word	0xff9273ff,0x4483009b
	.word	0x01ec8a13,0xe925ff50
	.word	0x1e9273ff,0x000000ef
	.word	0xff73921e,0xa13b2a6d
	.word	0xce9e00fe,0xf8ffa75a
p0_local0_sec_expect:
	.word	0x0073921e,0x000000a8
	.word	0x00000000,0xef000000
	.word	0xff000000,0x00000000
	.word	0x2e13ffed,0x00ef0012
	.word	0xff547f31,0xe837839c
	.word	0x78808330,0x15840012
	.word	0x440ff950,0x000000ff
	.word	0x92118061,0x00000060
p0_local1_expect:
	.word	0x000000f8,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x000000ff,0x000000ff
	.word	0x000000a8,0x448300c6
	.word	0x00000000,0x00703c1f
	.word	0x5aa710ff,0xa50acb9c
	.word	0x00000000,0x0000abff
	.word	0xce9e00fe,0xffffffff
p0_local1_sec_expect:
	.word	0xff000000,0x6d2a3ba1
	.word	0xff000000,0x000000ff
	.word	0x00000000,0xf8000000
	.word	0x9b008344,0xff7392ff
	.word	0x50ff25e9,0x138aec01
	.word	0xef000000,0xff73921e
	.word	0x6d2a3ba1,0x1e9273ff
	.word	0x5aa710f8,0xa50acb9c
p0_local2_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0xff00ffff
	.word	0xffff00ff,0x000000a8
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x98aeb94b
	.word	0xa89ebb99,0x00000000
	.word	0xe925ff50,0x4483009b
	.word	0x91000000,0x000000a8
p0_local2_sec_expect:
	.word	0xff000000,0x000000ef
	.word	0x9bffff80,0x00000000
	.word	0x00000000,0x00000000
	.word	0x9b008344,0xff7392ff
	.word	0x50ff25e9,0x138aec01
	.word	0x000000ff,0xffffffff
	.word	0x6d2a3ba1,0x1e9273ff
	.word	0x5aa710f8,0xa50acb9c
p0_local3_expect:
	.word	0x000000ef,0xff73921e
	.word	0x000000ff,0x000000ff
	.word	0xa8ffffff,0xa8000000
	.word	0x000000a8,0xd91ffa9b
	.word	0x00000000,0x0000001e
	.word	0xa89ebb99,0x0000002d
	.word	0x000000ff,0x00000059
	.word	0xffffffff,0xff73921e
p0_local3_sec_expect:
	.word	0xffffffff,0xe391d5ab
	.word	0x00000000,0x4955f2ff
	.word	0x7fff73ff,0x1e9273ff
	.word	0x0ec602c6,0x3e081c37
	.word	0x01ec8a13,0xe925ff50
	.word	0x1e9273ff,0x000000ef
	.word	0x3031db6a,0xa13b2a6d
	.word	0x9ccb0aa5,0xf810a75a
p0_local4_expect:
	.word	0x0000001e,0xa8000000
	.word	0xe925ff50,0xffffffff
	.word	0xffffffff,0x4483009b
	.word	0xa89ebb99,0xff7392ff
	.word	0xce9e00fe,0x000000ef
	.word	0x00000000,0x53d4c63e
	.word	0x00000000,0x00000000
	.word	0x0000009b,0xffffff9b
p0_local4_sec_expect:
	.word	0x4483009b,0xe0000000
	.word	0x00000000,0x000000ff
	.word	0x7fff73ff,0x1e9273ff
	.word	0x00000080,0x448300c6
	.word	0x2effda45,0x98aeb94b
	.word	0xa89ebb99,0x000003d1
	.word	0xad000000,0x000046ff
	.word	0xef000000,0xff73921e
p0_local5_expect:
	.word	0x000003d1,0x000000ff
	.word	0xff00ffff,0xffffffff
	.word	0xffffff83,0x00000000
	.word	0x000000ff,0xfe009ece
	.word	0x00000000,0x00000000
	.word	0x1200ff00,0xd1030003
	.word	0x1891d9c1,0xff83ffff
	.word	0xf3d40000,0x03d1b5c9
p0_local5_sec_expect:
	.word	0x9b008344,0xffffffff
	.word	0x50ff25e9,0x00000000
	.word	0xff73921e,0xa13b0000
	.word	0xff9273ff,0x4483009b
	.word	0x01ec8a13,0xe925ff50
	.word	0x1e9273ff,0x000000ef
	.word	0xff73921e,0xa13b2a6d
	.word	0x9ccb0aa5,0xf810a75a
p0_local6_expect:
	.word	0x1e9273ff,0xffffffff
	.word	0x00000000,0x1e000000
	.word	0xf8000000,0xe925ff1e
	.word	0x000000a8,0x0000ce00
	.word	0xff83ffff,0xce9e00fe
	.word	0x9ccb0aa5,0x9b000000
	.word	0xffffffff,0xc9b591df
	.word	0x00000000,0xff9273fe
p0_local6_sec_expect:
	.word	0x00000000,0x8f08ffff
	.word	0xfe009ece,0x00000000
	.word	0xff00ffff,0x00000000
	.word	0xce9ea2fe,0x0000001e
	.word	0xb5d90845,0xf6fa03d8
	.word	0x47d28ba4,0x8bd65383
	.word	0x0ec602c6,0x3e081c37
	.word	0xbb7c7642,0xc1667cd8
share0_expect:
	.word	0xbb999a5f,0x8c80cb32
	.word	0x5bd0315a,0xa9157202
	.word	0xd1c49706,0x8a9feb02
	.word	0xf18375db,0x28c781f4
	.word	0x5edec5cb,0x21c13da9
	.word	0xe920467b,0xdc256777
	.word	0x765a7755,0x469c8c75
	.word	0x57be5425,0x355b2c61
share1_expect:
	.word	0xffff8691,0x34a972a6
	.word	0x5c466ff5,0xe189c8ab
	.word	0x0d224475,0x999e2bd6
	.word	0x857f5180,0x57b5daf2
	.word	0xee297b16,0x1fc8b97a
	.word	0x9c42f048,0xe058680f
	.word	0x23c1128e,0xea9d5c75
	.word	0x72a73531,0x9bd13319
	.word	0x9bff978a,0x04ddce6e
	.word	0x3fd185c8,0xfffdeefb
	.word	0xd141cc26,0x5293c0ae
	.word	0x7d0b5e9b,0xb33de4b1
	.word	0xa115a83c,0x99acff83
	.word	0x2592f73c,0xe62029a2
	.word	0x20a0ba56,0x9afe5a1e
	.word	0xe04e876f,0x6c92a64a
share2_expect:
	.word	0x8344b6f7,0x0b1516b9
	.word	0xd58cd291,0x7ff4eedc
	.word	0x60f99906,0x1130597d
	.word	0x9e78050b,0x9d785ed3
	.word	0xf1af3f79,0xbcacdd2c
	.word	0xce39e1a8,0x968e659f
	.word	0x7a3fdb66,0xe5695726
	.word	0x376d0235,0x5b07318f
share3_expect:
	.word	0x0060d648,0xcc5ba30b
	.word	0xb59417fd,0x751ee730
	.word	0xc8c19513,0x8140b2a6
	.word	0x7c4f88db,0x8c841966
	.word	0xa1ace690,0x20332449
	.word	0xc6f5cd00,0x2c0e2c37
	.word	0x205f8f06,0x7516fd7c
	.word	0x9272182d,0x3d460f88
	.word	0xf600f914,0x7112ee2e
	.word	0xd146e15c,0x541f5a95
	.word	0xe64cb4cb,0x1192d08d
	.word	0xf88636b5,0x47f1c89a
	.word	0x7c5aa4c5,0x31c409fd
	.word	0xaaa023ab,0x9856b38d
	.word	0x1a098eb1,0x14f1d6ee
	.word	0x7ccc7995,0x2d9a66d3
	.word	0x0000fa8a,0xcc96d2ba
	.word	0xa8ad235f,0x88b04e35
	.word	0x3d4cd10b,0xf8174170
	.word	0xbf309a56,0xd1ef7405
	.word	0x7f2f128d,0x2ff20542
	.word	0x870aa697,0xd8b1ba2b
	.word	0xf68ebf38,0x2ce97867
	.word	0x92c817ef,0x8a13bd16
	.word	0xffa8635c,0xe2cc2700
	.word	0xf9019a81,0x50a3aa46
	.word	0xcc1168f9,0xca170eed
	.word	0xa7d9e041,0x0e1990cb
	.word	0x4abe05d5,0xd643e688
	.word	0xb654687c,0x5ead56f6
	.word	0x0e9d402c,0x94bc6fc2
	.word	0x0e45d458,0xac7ff5f5
	.word	0x00ffe14a,0xbf8331d1
	.word	0xe204f42c,0x60245cd7
	.word	0x82d34d8e,0x9776e614
	.word	0xdd56c197,0x235e297f
	.word	0xa731854d,0xc98ef159
	.word	0x6baa66da,0xe10edb7f
	.word	0xf8bb46ed,0x0cfcab21
	.word	0x462e3d7a,0x66e6465a
	.word	0x00f6154d,0x95a66fcf
	.word	0xa5dbf843,0xaabddd3e
	.word	0xef2c3d0b,0xc410d121
	.word	0x4a2501d2,0xc8dbaa8f
	.word	0xddcc4187,0xba72200a
	.word	0x2c232eb8,0x0966c667
	.word	0x1c947a0a,0x558c170a
	.word	0xc6fa6880,0xa773cee9
	.word	0xffff9b10,0xa0892226
	.word	0xa3ec2f80,0x375bae25
	.word	0x8471ce36,0xdf11a70e
	.word	0xf81c23c7,0x50abd4e9
	.word	0x1b1ab765,0x8b0b87f0
	.word	0x6476245c,0xbab648e2
	.word	0x2462ebe0,0x53785e8b
	.word	0x07396312,0x0710738d
	.word	0xff50ae2e,0x0c03b5b6
	.word	0xa78b10d7,0x326d6e39
	.word	0xa1f9b541,0xe30df5b7
	.word	0xbb214a84,0x0237d7d7
	.word	0x7882fdb3,0x25eb0b87
	.word	0x3aa70fde,0xeb1e8ed5
	.word	0xba4b8277,0xa75dd0bf
	.word	0x60607916,0x52b05fcb
p0_invalidate_semaphore:
	.word	0
!	Data for Cross Processor Interrupt
	.align	8
received_xintr:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_dispatch_retry:
	.word	0,0
p0_xintr_data:
	.word	0x00000000,0x00000001
	.word	0x2dac1520,0x648dda41
	.word	0x00000000,0x00000002
	.word	0x3fa92067,0x8aaf6982
	.word	0x00000000,0x00000003
	.word	0x950d2c08,0x656a68e7
	.word	0x00000000,0x00000004
	.word	0x77e3e3c7,0x9d171b5c
	.word	0x00000000,0x00000005
	.word	0x6b4da918,0x07960710
	.word	0x00000000,0x00000006
	.word	0x71af59d0,0x2ad1f227
	.word	0x00000000,0x00000007
	.word	0x1825e6b7,0x83077563
	.word	0x00000000,0x00000008
	.word	0x0d90f510,0x1b006041
	.align	8
p0_xintr_expected:
	.word	0
	.align	64
xintr_data_ptrs:
	.word	p0_xintr_data
	.align	8
p0_xintr_db:
	.skip	512
p0_xintr_retry_count:
	.word	0,0
p0_reset_cnt:
	.word	0
	.align	8
p0_ec_timing_ctrl:
	.word	0,0
p0_ec_control:
	.word	0,0
p0_mcu_shadow:
	.skip	80
user_data_end:


SECTION	.p0_local0	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0,
	VA = 0x0000000000800000,
	RA = 0x0000000010000000,
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
	.word	0x26de6a7a,0x55f25062,0xc03ed33e,0x6100ca88
	.word	0x80019a2c,0x6a9d131e,0xbfd862b8,0xe4606973
	.word	0x60103c46,0x05f85d75,0xf69a840d,0x5d16c3c6
	.word	0xfca17147,0xe3c10c6b,0x9d4d84f8,0x2d1039fc
p0_local0_end:

SECTION	.p0_local0_sec	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0_sec,
	VA = 0x0000000000800000,
	RA = 0x0000000030000000,
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
	.word	0xd075b960,0x70d86894,0xd341cf12,0x13520df5
	.word	0x12cd3352,0x05fb6dcc,0x587c804d,0x99469fab
	.word	0x2e7ad2e7,0xa6473278,0xb18b44fc,0xdecb7663
	.word	0xac5654cd,0x678899d6,0xdfd01d41,0xdd954297
p0_local0_sec_end:

SECTION	.p0_local1	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1,
	VA = 0x0000000000802000,
	RA = 0x0000000010040000,
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
	.word	0x932a1971,0x2eb2821f,0x2cee2328,0x74f91143
	.word	0xf2939908,0xd0a821c5,0xce40ce0f,0x3ccbbec9
	.word	0x4a3ebc91,0x0b41da4a,0x8e4407a0,0x4064aa31
	.word	0x0d1b7abd,0x49e52052,0xd62fdfdb,0x588dfcbf
p0_local1_end:

SECTION	.p0_local1_sec	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1_sec,
	VA = 0x0000000000802000,
	RA = 0x0000000030040000,
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
	.word	0xe3decf16,0x35087c50,0xcebcf472,0xeeea58f9
	.word	0xb1069d03,0x78470670,0xf0c93d6f,0x44405368
	.word	0xb0f7719b,0xd433200e,0xe096edc0,0x10956a09
	.word	0x0e9195c7,0xa477e5db,0x683865c5,0xcfaeccaf
p0_local1_sec_end:

SECTION	.p0_local2	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2,
	VA = 0x0000000000804000,
	RA = 0x0000000010080000,
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
	.word	0x52107938,0x73898dba,0x0d040fb3,0xf57fea46
	.word	0xff8d2172,0xf4f89a88,0xb83a9450,0x5c3b7262
	.word	0x8407ba22,0x0e08bf46,0xb4921890,0x40519a40
	.word	0x3083808b,0x3d78e25a,0x2fd3c516,0xe335012c
p0_local2_end:

SECTION	.p0_local2_sec	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2_sec,
	VA = 0x0000000000804000,
	RA = 0x0000000030080000,
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
	.word	0x971a1ca8,0x767fafba,0x60cdac39,0x02745951
	.word	0x7897fcd6,0xcabeaece,0xb5c3b2e9,0x995a2511
	.word	0xa2727881,0xdcc2504f,0x9c5851a7,0x1f999ca8
	.word	0xd176e30b,0x034f1da3,0xa13efcab,0x8547f031
p0_local2_sec_end:

SECTION	.p0_local3	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3,
	VA = 0x0000000000806000,
	RA = 0x00000000100c0000,
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
	.word	0x6cee8ad5,0xc82f0b2f,0x27b67d2b,0x6b87469a
	.word	0x71d2611a,0x99bb9ea8,0x4ec52279,0xf42423f0
	.word	0x2d6bac51,0xba6f1e0b,0x9af9f82e,0x0ac1faeb
	.word	0xb3a24116,0xb91f6d7c,0x91c3a07d,0xb6560cd5
p0_local3_end:

SECTION	.p0_local3_sec	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3_sec,
	VA = 0x0000000000806000,
	RA = 0x00000000300c0000,
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
	.word	0xf8cc8998,0xa6e7e8c1,0xf809d706,0xcfd92c64
	.word	0xbcb407c4,0x9f121584,0x0ec602c6,0x3e081c37
	.word	0x01ec8a13,0xe925ff50,0xe9ed8395,0xfa8a4bdc
	.word	0x3031db6a,0xa13b2a6d,0x9ccb0aa5,0xf810a75a
p0_local3_sec_end:

SECTION	.p0_local4	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4,
	VA = 0x0000000000808000,
	RA = 0x0000000010100000,
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
	.word	0x071c0907,0xc41c7f20,0xe26d8f37,0x45dac62e
	.word	0x090d7291,0xaf429358,0x941ec967,0x64ecce2e
	.word	0xe5547f31,0xe837839c,0xa5ac22bb,0x2e79d972
	.word	0x440ff950,0xb49ed50d,0x92118061,0xf7c1d812
p0_local4_end:

SECTION	.p0_local4_sec	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4_sec,
	VA = 0x0000000000808000,
	RA = 0x0000000030100000,
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
	.word	0xc62b98a3,0x83c36536,0xdde08bd7,0xdf25a2f5
	.word	0x9f49bdd7,0x1f89a07f,0x7ea57c9c,0x82b88d78
	.word	0x7ba5552c,0x9827f6b4,0x9b06c2cd,0xef34cf4d
	.word	0xb37ce9a5,0xe74872f3,0xf0e15c42,0xce876e4f
p0_local4_sec_end:

SECTION	.p0_local5	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5,
	VA = 0x000000000080a000,
	RA = 0x0000000010140000,
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
	.word	0x82ddc0d8,0xbe0f72e0,0xbd4a91ca,0xc76a59f7
	.word	0xcf9de403,0x26bd239f,0x919fd6c4,0x4483644d
	.word	0x0f6fa18d,0x6ba14678,0xb6662aa7,0xf92dc578
	.word	0xc9b591df,0x6288d4f3,0x050f1212,0x3f28bea8
p0_local5_end:

SECTION	.p0_local5_sec	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5_sec,
	VA = 0x000000000080a000,
	RA = 0x0000000030140000,
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
	.word	0xbc4e2f48,0x66f3361a,0xd051cffe,0xe6249d14
	.word	0x59a5c728,0xfcc71bc2,0xa46b574c,0x1e62e89c
	.word	0x6c61e0d1,0x0b633693,0x2412d6b9,0x05166fa5
	.word	0xe9723e58,0x2586e5fb,0x0fa9aada,0xa26fa654
p0_local5_sec_end:

SECTION	.p0_local6	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6,
	VA = 0x000000000080c000,
	RA = 0x0000000010180000,
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
	.word	0x9658f28b,0x67923216,0xa1e282e0,0xfa627f0c
	.word	0x0e862a9e,0xa3fec8f4,0x69a3995d,0xc8df6ac3
	.word	0x5437d745,0x4fd95307,0x2bb44903,0x24b7cbd7
	.word	0x6c9d94c4,0x2103f245,0xa74b50f5,0x2b3bdbc1
p0_local6_end:

SECTION	.p0_local6_sec	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6_sec,
	VA = 0x000000000080c000,
	RA = 0x0000000030180000,
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
	.word	0xc1f8e7a8,0x6786584b,0x83c04ec2,0xcbb954d0
	.word	0x7f8b7885,0x98aeb94b,0x81cda254,0xb0523971
	.word	0xb5d90845,0xf6fa03d8,0x47d28ba4,0x8bd65383
	.word	0xbcd0b582,0x01510486,0xbb7c7642,0xc1667cd8
p0_local6_sec_end:

SECTION	.share0	DATA_VA=0x00080e000

attr_data {
	Name = .share0,
	VA = 0x000000000080e000,
	RA = 0x00000000201c0000,
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
	.word	0x37349a5f,0x8c80cb32,0x5bd0315a,0xa9157202
	.word	0xd1c49706,0x8a9feb02,0xf18375db,0x28c781f4
	.word	0x5edec5cb,0x21c13da9,0xe920467b,0xdc256777
	.word	0x765a7755,0x469c8c75,0x57be5425,0x355b2c61
share0_end:

SECTION	.share1	DATA_VA=0x000810000

attr_data {
	Name = .share1,
	VA = 0x0000000000810000,
	RA = 0x0000000020800000,
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
	.word	0xa1f38691,0x34a972a6,0x5c466ff5,0xe189c8ab
	.word	0x0d224475,0x999e2bd6,0x857f5180,0x57b5daf2
	.word	0xee297b16,0x1fc8b97a,0x9c42f048,0xe058680f
	.word	0x23c1128e,0xea9d5c75,0x72a73531,0x9bd13319
	.word	0x0095978a,0x04ddce6e,0x3fd185c8,0xfffdeefb
	.word	0xd141cc26,0x5293c0ae,0x7d0b5e9b,0xb33de4b1
	.word	0xa115a83c,0x99acff83,0x2592f73c,0xe62029a2
	.word	0x20a0ba56,0x9afe5a1e,0xe04e876f,0x6c92a64a
share1_end:

SECTION	.share2	DATA_VA=0x000812000

attr_data {
	Name = .share2,
	VA = 0x0000000000812000,
	RA = 0x00000000211c0000,
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
	.word	0x8993b6f7,0x0b1516b9,0xd58cd291,0x7ff4eedc
	.word	0x60f99906,0x1130597d,0x9e78050b,0x9d785ed3
	.word	0xf1af3f79,0xbcacdd2c,0xce39e1a8,0x968e659f
	.word	0x7a3fdb66,0xe5695726,0x376d0235,0x5b07318f
share2_end:

SECTION	.share3	DATA_VA=0x000814000

attr_data {
	Name = .share3,
	VA = 0x0000000000814000,
	RA = 0x0000000021800000,
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
	.word	0x1b56d648,0xcc5ba30b,0xb59417fd,0x751ee730
	.word	0xc8c19513,0x8140b2a6,0x7c4f88db,0x8c841966
	.word	0xa1ace690,0x20332449,0xc6f5cd00,0x2c0e2c37
	.word	0x205f8f06,0x7516fd7c,0x9272182d,0x3d460f88
	.word	0x8a1bf914,0x7112ee2e,0xd146e15c,0x541f5a95
	.word	0xe64cb4cb,0x1192d08d,0xf88636b5,0x47f1c89a
	.word	0x7c5aa4c5,0x31c409fd,0xaaa023ab,0x9856b38d
	.word	0x1a098eb1,0x14f1d6ee,0x7ccc7995,0x2d9a66d3
	.word	0xf522fa8a,0xcc96d2ba,0xa8ad235f,0x88b04e35
	.word	0x3d4cd10b,0xf8174170,0xbf309a56,0xd1ef7405
	.word	0x7f2f128d,0x2ff20542,0x870aa697,0xd8b1ba2b
	.word	0xf68ebf38,0x2ce97867,0x92c817ef,0x8a13bd16
	.word	0x0d5c635c,0xe2cc2700,0xf9019a81,0x50a3aa46
	.word	0xcc1168f9,0xca170eed,0xa7d9e041,0x0e1990cb
	.word	0x4abe05d5,0xd643e688,0xb654687c,0x5ead56f6
	.word	0x0e9d402c,0x94bc6fc2,0x0e45d458,0xac7ff5f5
	.word	0xcd2fe14a,0xbf8331d1,0xe204f42c,0x60245cd7
	.word	0x82d34d8e,0x9776e614,0xdd56c197,0x235e297f
	.word	0xa731854d,0xc98ef159,0x6baa66da,0xe10edb7f
	.word	0xf8bb46ed,0x0cfcab21,0x462e3d7a,0x66e6465a
	.word	0xa286154d,0x95a66fcf,0xa5dbf843,0xaabddd3e
	.word	0xef2c3d0b,0xc410d121,0x4a2501d2,0xc8dbaa8f
	.word	0xddcc4187,0xba72200a,0x2c232eb8,0x0966c667
	.word	0x1c947a0a,0x558c170a,0xc6fa6880,0xa773cee9
	.word	0x17a89b10,0xa0892226,0xa3ec2f80,0x375bae25
	.word	0x8471ce36,0xdf11a70e,0xf81c23c7,0x50abd4e9
	.word	0x1b1ab765,0x8b0b87f0,0x6476245c,0xbab648e2
	.word	0x2462ebe0,0x53785e8b,0x07396312,0x0710738d
	.word	0xec18ae2e,0x0c03b5b6,0xa78b10d7,0x326d6e39
	.word	0xa1f9b541,0xe30df5b7,0xbb214a84,0x0237d7d7
	.word	0x7882fdb3,0x25eb0b87,0x3aa70fde,0xeb1e8ed5
	.word	0xba4b8277,0xa75dd0bf,0x60607916,0x52b05fcb
share3_end:
