/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000l_2.s
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
!	Seed = 326164847
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000l_2.s created on Mar 26, 2009 (16:48:47)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_3000l_2 -p 1 -l 3000

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
!	%f0  = 9b6610a8 eea9473d 8f94c9bb a0d52b7a
!	%f4  = c826a210 74a4bfe1 a7044cae 320b66a4
!	%f8  = 800e61d7 3bee7779 6fc4458f 0046c712
!	%f12 = 2a82339a 288edd61 3b16817b b811b45a
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 9e0d8f49 1ee0f128 d173d9e8 6c6c14c4
!	%f20 = 5fd4dae6 27a71f19 6f60d438 ce9b56df
!	%f24 = b1e87f22 d83a31b0 bc365bc2 3ef92cf7
!	%f28 = 538a4ea8 c6ad6b1a 1087ca59 bf357b67
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 0292730c 82332047 3f652052 9888ed6c
!	%f36 = 624aa110 447023ed 20cc3563 d39cf9b7
!	%f40 = 6507fe85 62d12377 211e732a 366f08e3
!	%f44 = 5bdb28e6 8d2c8b76 1c3515d2 4ac005e2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xd8c961df0000003f,%g7,%g1 ! GSR scale =  7, align = 7
	wr	%g1,%g0,%gsr		! GSR = d8c961df0000003f
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l4 = 3f856224, %l5 = fd0b3901, Mem[0000000010141410] = efdfb874 7790dab8
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 3f856224 fd0b3901
!	Mem[0000000030141410] = 40551d0b, %l0 = 47680ca0b03ce8b4
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000004055
!	%f12 = 2a82339a 288edd61, Mem[00000000100c1410] = 4a7dcf2e f2c02a29
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 2a82339a 288edd61
!	Mem[0000000030181410] = 34438a56be230164, %f4  = c826a210 74a4bfe1
	ldda	[%i6+%o5]0x89,%f4 	! %f4  = 34438a56 be230164
!	Mem[0000000010101400] = a6bf002f, %l7 = 27540df20e529674
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 0000002f000000ff
!	Mem[0000000030041410] = 7c05ac51, %l1 = d327b84fbc308a0a
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 000000007c05ac51
!	Mem[0000000030101400] = 11df965e, %l7 = 000000000000002f
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000011
!	%l3 = d63d3a85c8ebf3e6, Mem[0000000010101410] = 2b63ed77
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = c8ebf3e6
!	Mem[0000000030101408] = c4f49cac9b47a3d0, %f26 = bc365bc2 3ef92cf7
	ldda	[%i4+%o4]0x81,%f26	! %f26 = c4f49cac 9b47a3d0
!	Starting 10 instruction Store Burst
!	%f12 = 2a82339a 288edd61, Mem[00000000100c1410] = 288edd61 2a82339a
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 2a82339a 288edd61

p0_label_2:
!	Mem[0000000010081418] = 537145803e4c256a, %l4 = 727b46e43f856224, %l2 = 8017c37828b44f48
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 537145803e4c256a
!	%l0 = 0000000000004055, Mem[00000000100c1408] = 68911fae
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 68914055
!	%l6 = 63532079fe7cf217, Mem[0000000010041438] = 7c0fa9bb, %asi = 80
	stba	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 170fa9bb
!	Mem[000000001008140c] = e4c21301, %l6 = fe7cf217, %l0 = 00004055
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 00000000e4c21301
!	Mem[00000000100c1408] = 55409168, %l4 = 727b46e43f856224
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000055409168
!	Mem[0000000010101400] = ff00bfa6, %l3 = d63d3a85c8ebf3e6
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%f6  = a7044cae 320b66a4, Mem[0000000010181408] = 83bff2c7 ead63534
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = a7044cae 320b66a4
!	%l6 = fe7cf217, %l7 = 00000011, Mem[0000000030181410] = be230164 34438a56
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = fe7cf217 00000011
!	%f25 = d83a31b0, Mem[0000000030101408] = c4f49cac
	sta	%f25,[%i4+%o4]0x81	! Mem[0000000030101408] = d83a31b0
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 78fe8df4, %f20 = 5fd4dae6
	ld	[%i1+0x03c],%f20	! %f20 = 78fe8df4

p0_label_3:
!	Mem[0000000010181408] = ae4c04a7, %f4  = 34438a56
	lda	[%i6+%o4]0x88,%f4 	! %f4 = ae4c04a7
!	Mem[0000000021800080] = d128571f, %l2 = 537145803e4c256a
	ldub	[%o3+0x080],%l2		! %l2 = 00000000000000d1
!	Mem[0000000030141400] = a2accc3c, %l3 = 00000000000000ff
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 000000000000cc3c
!	Mem[0000000010041408] = cbb24a90b1ab37fc, %l3 = 000000000000cc3c
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = cbb24a90b1ab37fc
!	Mem[0000000030181410] = fe7cf217, %l0 = 00000000e4c21301
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = fffffffffffff217
!	Mem[0000000030081400] = 13958612 093bd89b 28c8238d 3e396f14
!	Mem[0000000030081410] = 51c2df25 dfc6b0ff 406ec31f 7b97511a
!	Mem[0000000030081420] = 6ecc0b5f 49a5b322 6b69d5b3 0c5059a4
!	Mem[0000000030081430] = cea292b2 7779089e 9a4ea2f6 57bc1770
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000030041408] = f2ce8acb, %l0 = fffffffffffff217
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000f2
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101400] = ff00bfa6 a6ed2c14 6895e5d0 3c02eba3
!	Mem[0000000010101410] = c8ebf3e6 e4e4fbae 2b4e9914 9207d9ba
!	Mem[0000000010101420] = 96271b53 e2409144 5ca572a0 669e5054
!	Mem[0000000010101430] = 3059c69c 3a6e5eb2 bdec4429 2d7d9f8c
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000010181408] = a7044cae320b66a4, %l5 = 82b6bf41fd0b3901
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = a7044cae320b66a4
!	Starting 10 instruction Store Burst
!	%l5 = a7044cae320b66a4, Mem[0000000010001400] = afbae8ee
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 66a4e8ee

p0_label_4:
!	%l2 = 00000000000000d1, Mem[0000000030141410] = 0b1d5540
	stba	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0b1d55d1
!	%l3 = cbb24a90b1ab37fc, Mem[0000000030101410] = 524ce163
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 37fce163
!	Mem[00000000300c1408] = 39643c18, %l7 = 0000000000000011
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000018000000ff
!	Mem[00000000218001c1] = 632ba59a, %l4 = 0000000055409168
	ldstub	[%o3+0x1c1],%l4		! %l4 = 0000002b000000ff
!	%l5 = a7044cae320b66a4, Mem[00000000300c1408] = ff3c6439
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = a43c6439
!	%f26 = a459500c b3d5696b, Mem[0000000030081408] = 28c8238d 3e396f14
	stda	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = a459500c b3d5696b
!	%f0  = ff00bfa6 a6ed2c14 6895e5d0 3c02eba3
!	%f4  = c8ebf3e6 e4e4fbae 2b4e9914 9207d9ba
!	%f8  = 96271b53 e2409144 5ca572a0 669e5054
!	%f12 = 3059c69c 3a6e5eb2 bdec4429 2d7d9f8c
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l2 = 000000d1, %l3 = b1ab37fc, Mem[0000000010041408] = cbb24a90 b1ab37fc
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000d1 b1ab37fc
!	Mem[0000000030101400] = 5e96df11, %l4 = 000000000000002b
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 000000005e96df11
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = d8f0657e, %l6 = 63532079fe7cf217
	ldswa	[%i2+0x028]%asi,%l6	! %l6 = ffffffffd8f0657e

p0_label_5:
!	Mem[0000000010101410] = e6f3ebc8, %l5 = a7044cae320b66a4
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 00000000e6f3ebc8
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010001400] = 142ceda6a6bf00ff, %f26 = a459500c b3d5696b
	ldda	[%i0+%g0]0x88,%f26	! %f26 = 142ceda6 a6bf00ff
!	Mem[0000000010041408] = 000000d1, %l6 = ffffffffd8f0657e
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 61dd8e28, %l7 = 0000000000000018
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 00000000000061dd
!	Mem[00000000100c1418] = 9829f53a 35a67574, %l4 = 5e96df11, %l5 = e6f3ebc8
	ldd	[%i3+0x018],%l4		! %l4 = 000000009829f53a 0000000035a67574
!	Mem[0000000030001410] = 2eaf9f89, %l0 = 00000000000000f2
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000002eaf
!	Mem[0000000030181400] = b8528f99 58fa70ba 4a1372b3 57404012
!	Mem[0000000030181410] = 17f27cfe 11000000 ecc3ac98 ee72ccef
!	Mem[0000000030181420] = 69387c07 5f1bc9da 36c41009 8d5e390d
!	Mem[0000000030181430] = 416437a4 f83efdca 5dda5b71 54ad0d30
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Mem[0000000030141410] = d1551d0b, %l2 = 00000000000000d1
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = ffffffffd1551d0b
!	Mem[0000000030001400] = ca7996d5, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffff96d5
!	Starting 10 instruction Store Burst
!	%l2 = d1551d0b, %l3 = b1ab37fc, Mem[0000000010001410] = c8ebf3e6 e4e4fbae
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = d1551d0b b1ab37fc

p0_label_6:
!	Mem[000000001000143c] = 2d7d9f8c, %l0 = 00002eaf, %l5 = 35a67574
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000002d7d9f8c
!	%l5 = 000000002d7d9f8c, Mem[0000000010081408] = 851cb0d3e4c21301
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000002d7d9f8c
!	Mem[0000000030181408] = 4a1372b3, %l0 = 0000000000002eaf
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 0000004a000000ff
!	%l0 = 000000000000004a, Mem[0000000010141414] = 01390bfd, %asi = 80
	stwa	%l0,[%i5+0x014]%asi	! Mem[0000000010141414] = 0000004a
!	Mem[0000000030001400] = d59679ca, %l4 = 000000009829f53a
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000d59679ca
!	Mem[0000000010181424] = 39ec15cd, %l5 = 000000002d7d9f8c
	ldstuba	[%i6+0x024]%asi,%l5	! %l5 = 00000039000000ff
!	Mem[0000000020800040] = 3eac55e8, %l2 = ffffffffd1551d0b
	ldstub	[%o1+0x040],%l2		! %l2 = 0000003e000000ff
!	Mem[0000000030001400] = 9829f53a, %l3 = cbb24a90b1ab37fc
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 000000009829f53a
!	%l5 = 0000000000000039, Mem[0000000030081408] = a459500c
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 3959500c
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 86d5ff0b, %l5 = 0000000000000039
	lduh	[%o3+0x0c0],%l5		! %l5 = 00000000000086d5

p0_label_7:
!	Mem[0000000030081408] = 3959500c b3d5696b, %l2 = 0000003e, %l3 = 9829f53a
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 000000003959500c 00000000b3d5696b
!	Mem[0000000010081418] = 53714580, %l0 = 000000000000004a
	ldswa	[%i2+0x018]%asi,%l0	! %l0 = 0000000053714580
!	Mem[0000000030141408] = e95edb07, %l7 = 00000000000061dd
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000007
!	Mem[00000000300c1410] = 2a0065f2, %l1 = 000000007c05ac51
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = 000000002a0065f2
!	Mem[0000000010001408] = 6895e5d0, %l3 = 00000000b3d5696b
	lduba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000068
!	Mem[0000000010181408] = ae4c04a7, %f11 = 669e5054
	lda	[%i6+%o4]0x88,%f11	! %f11 = ae4c04a7
!	Mem[0000000010041408] = 000000d1, %l1 = 000000002a0065f2
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000d1
!	Mem[0000000030041408] = f2ce8acb, %l5 = 00000000000086d5
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = fffffffff2ce8acb
!	Mem[0000000030181400] = 998f52b8, %l2 = 000000003959500c
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffb8
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffff96d5, Mem[00000000211c0001] = 4757fe22
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = 47d5fe22

p0_label_8:
!	%l5 = fffffffff2ce8acb, Mem[0000000030081408] = 3959500c
	stha	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 8acb500c
!	%l0 = 0000000053714580, Mem[000000001010140c] = 3c02eba3
	sth	%l0,[%i4+0x00c]		! Mem[000000001010140c] = 4580eba3
!	%l2 = ffffffffffffffb8, Mem[0000000010141414] = 0000004a, %asi = 80
	stha	%l2,[%i5+0x014]%asi	! Mem[0000000010141414] = ffb8004a
!	%f5  = e4e4fbae, Mem[0000000030041400] = aa99db2a
	sta	%f5 ,[%i1+%g0]0x89	! Mem[0000000030041400] = e4e4fbae
!	%l3 = 0000000000000068, Mem[00000000218000c0] = 86d5ff0b, %asi = 80
	stha	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0068ff0b
!	%f5  = e4e4fbae, Mem[00000000300c1400] = bbfe5b62
	sta	%f5 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = e4e4fbae
!	%l7 = 0000000000000007, Mem[0000000030141400] = a2accc3c
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = a2accc07
!	%l6 = ffffffffffff96d5, Mem[0000000030081408] = 0c50cb8a
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff96d5
!	%l3 = 0000000000000068, Mem[00000000100c1438] = 67c38fa3cba2abe9
	stx	%l3,[%i3+0x038]		! Mem[00000000100c1438] = 0000000000000068
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 2eaf9f89 56c20577, %l2 = ffffffb8, %l3 = 00000068
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 000000002eaf9f89 0000000056c20577

p0_label_9:
!	Mem[0000000010101408] = d0e59568, %f7  = 9207d9ba
	lda	[%i4+%o4]0x88,%f7 	! %f7 = d0e59568
!	Mem[0000000010181410] = 38d597a7, %l1 = 00000000000000d1
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000038
!	Mem[0000000030141400] = 07ccaca29afa7634, %f14 = bdec4429 2d7d9f8c
	ldda	[%i5+%g0]0x81,%f14	! %f14 = 07ccaca2 9afa7634
!	Mem[000000001010142c] = 669e5054, %l0 = 0000000053714580
	lduh	[%i4+0x02e],%l0		! %l0 = 0000000000005054
!	Mem[00000000211c0000] = 47d5fe22, %l4 = 00000000d59679ca
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000d5
!	Mem[0000000010141410] = 2462853f, %l7 = 0000000000000007
	ldub	[%i5+0x011],%l7		! %l7 = 0000000000000062
!	Mem[0000000021800040] = 23b5d7d7, %l3 = 0000000056c20577
	lduba	[%o3+0x040]%asi,%l3	! %l3 = 0000000000000023
!	Mem[00000000211c0000] = 47d5fe22, %l6 = ffffffffffff96d5
	lduh	[%o2+%g0],%l6		! %l6 = 00000000000047d5
!	Mem[0000000030181410] = fe7cf217, %l3 = 0000000000000023
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = fffffffffffff217
!	Starting 10 instruction Store Burst
!	%l2 = 000000002eaf9f89, Mem[0000000010101410] = aefbe4e4e6f3ebc8
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000002eaf9f89

p0_label_10:
!	%l4 = 00000000000000d5, Mem[0000000030081408] = d596ffffb3d5696b
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000d5
!	Mem[0000000030081408] = 00000000, %l4 = 00000000000000d5
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001430] = 3059c69c, %l3 = fffff217, %l6 = 000047d5
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 000000003059c69c
!	%l5 = fffffffff2ce8acb, Mem[00000000211c0000] = 47d5fe22
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = cbd5fe22
!	Mem[0000000010181438] = 2bafd68d, %l7 = 00000062, %l2 = 2eaf9f89
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 000000002bafd68d
!	Mem[0000000030081400] = 13958612, %l2 = 000000002bafd68d
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 0000000013958612
!	Mem[0000000030001400] = fc37abb1, %l7 = 0000000000000062
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000b1000000ff
!	%f0  = ff00bfa6 a6ed2c14 6895e5d0 3c02eba3
!	%f4  = c8ebf3e6 e4e4fbae 2b4e9914 d0e59568
!	%f8  = 96271b53 e2409144 5ca572a0 ae4c04a7
!	%f12 = 3059c69c 3a6e5eb2 07ccaca2 9afa7634
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%f24 = 69387c07 5f1bc9da, Mem[0000000010041428] = 5f48f303 3689c6de
	stda	%f24,[%i1+0x028]%asi	! Mem[0000000010041428] = 69387c07 5f1bc9da
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %f23 = ee72ccef
	lda	[%i2+%o4]0x89,%f23	! %f23 = 000000ff

p0_label_11:
!	Mem[00000000100c1410] = 61dd8e289a33822a, %l3 = fffffffffffff217
	ldxa	[%i3+0x010]%asi,%l3	! %l3 = 61dd8e289a33822a
!	Mem[0000000010041410] = 1544151a, %l0 = 0000000000005054
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = 000000000000001a
!	Mem[0000000010041408] = d1000000, %l0 = 000000000000001a
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = a7044cae 320b66a4, %l6 = 3059c69c, %l7 = 000000b1
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000a7044cae 00000000320b66a4
!	Mem[0000000030081400] = 2bafd68d, %l2 = 0000000013958612
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 000000002bafd68d
!	Mem[0000000010001408] = 6895e5d03c02eba3, %l6 = 00000000a7044cae
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 6895e5d03c02eba3
!	Mem[0000000030001400] = fc37abff, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1408] = 39643ca4, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffa4
!	Mem[00000000300c1410] = f265002a, %l1 = 0000000000000038
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 00000000f265002a
!	Starting 10 instruction Store Burst
!	%l5 = fffffffff2ce8acb, Mem[0000000010101400] = a6bf00ff
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = a6bf8acb

p0_label_12:
!	Mem[0000000030001400] = fc37abff, %l5 = fffffffff2ce8acb
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000fc37abff
!	Mem[0000000030001408] = f0a213df, %l7 = 00000000320b66a4
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000df000000ff
!	Mem[00000000300c1410] = f265002a, %l7 = 00000000000000df
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 00000000f265002a
!	Mem[0000000030001400] = f2ce8acb, %l0 = ffffffffffffffa4
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000f2ce8acb
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010101408] = 6895e5d0, %l2 = 000000002bafd68d
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000068000000ff
!	%f16 = b8528f99 58fa70ba, Mem[0000000010141400] = bbce4961 eb59ba7f
	stda	%f16,[%i5+%g0]0x80	! Mem[0000000010141400] = b8528f99 58fa70ba
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 00000000f2ce8acb
	setx	0x4fa33527e4fb8a0a,%g7,%l0 ! %l0 = 4fa33527e4fb8a0a
!	%l1 = 00000000f265002a
	setx	0xf0f8999814bfc1bb,%g7,%l1 ! %l1 = f0f8999814bfc1bb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4fa33527e4fb8a0a
	setx	0x1cfc48102f4f5347,%g7,%l0 ! %l0 = 1cfc48102f4f5347
!	%l1 = f0f8999814bfc1bb
	setx	0xc7349b8847e1d7a0,%g7,%l1 ! %l1 = c7349b8847e1d7a0
!	%l5 = 00000000fc37abff, Mem[0000000030101400] = ff00bfa6
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = abffbfa6
!	%f8  = 96271b53 e2409144, Mem[0000000030001410] = 2eaf9f89 56c20577
	stda	%f8 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 96271b53 e2409144
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = abffbfa6, %l2 = 0000000000000068
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = ffffffffabffbfa6

p0_label_13:
!	Mem[0000000030041410] = c61f10217c05ac51, %l5 = 00000000fc37abff
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = c61f10217c05ac51
!	Mem[0000000030181408] = ff1372b3, %l4 = ffffffffffffffff
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = ffffffffff1372b3
!	Mem[0000000030141400] = a2accc07, %l1 = c7349b8847e1d7a0
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000007
!	Mem[0000000010181400] = 2d57d652 929a4833 a7044cae 320b66a4
!	Mem[0000000010181410] = 38d597a7 074d012f 3a9c87f5 e258be10
!	Mem[0000000010181420] = e4d46a81 ffec15cd e8aad8a2 69e26c76
!	Mem[0000000010181430] = 774329c7 0bfc1d8b 2bafd68d cdc5ef0e
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	%l0 = 1cfc48102f4f5347, %l2 = ffffffffabffbfa6, %l0 = 1cfc48102f4f5347
	xor	%l0,%l2,%l0		! %l0 = e303b7ef84b0ece1
!	Mem[00000000100c1408] = 2462853f, %l2 = ffffffffabffbfa6
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 000000000000003f
!	Mem[0000000010041408] = 000000d1, %l2 = 000000000000003f
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000d1
!	Mem[00000000218000c0] = 0068ff0b, %l5 = c61f10217c05ac51
	lduba	[%o3+0x0c1]%asi,%l5	! %l5 = 0000000000000068
!	Mem[0000000021800000] = 4030a558, %l4 = ffffffffff1372b3
	ldsb	[%o3+0x001],%l4		! %l4 = 0000000000000030
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (4)
!	%l6 = 6895e5d03c02eba3, Mem[0000000010181400] = 52d6572d
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 52d6eba3

p0_label_14:
!	%l2 = 000000d1, %l3 = 9a33822a, Mem[0000000010081420] = 0de63e2b 3f0e57ed
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000d1 9a33822a
!	%l2 = 00000000000000d1, Mem[00000000211c0000] = cbd5fe22, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00d1fe22
!	%f26 = 36c41009 8d5e390d, %l6 = 6895e5d03c02eba3
!	Mem[0000000030001420] = e6a7f3f7d94a7ecb
	add	%i0,0x020,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001420] = 36c410098d5e390d
!	%l3 = 61dd8e289a33822a, Mem[00000000100c1410] = 61dd8e28
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 9a33822a
!	Mem[00000000100c1410] = 9a33822a, %l1 = 0000000000000007
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 0000009a000000ff
!	Mem[0000000021800100] = 53ff933f, %l0 = e303b7ef84b0ece1
	ldstuba	[%o3+0x100]%asi,%l0	! %l0 = 00000053000000ff
!	Mem[0000000010101434] = 3a6e5eb2, %l1 = 000000000000009a
	ldsha	[%i4+0x034]%asi,%l1	! %l1 = 0000000000003a6e
!	%l3 = 61dd8e289a33822a, Mem[0000000020800040] = ffac55e8
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 822a55e8
!	Mem[0000000030081410] = 25dfc251, %l7 = 00000000f265002a
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000051000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 9a33822a, %l5 = 0000000000000068
	lduw	[%i2+0x024],%l5		! %l5 = 000000009a33822a

p0_label_15:
!	Mem[0000000010001410] = 0b1d55d1, %f16 = b8528f99
	lda	[%i0+%o5]0x88,%f16	! %f16 = 0b1d55d1
!	Mem[00000000100c1410] = 2a8233ff, %l7 = 0000000000000051
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 00000000000033ff
!	Mem[0000000030041408] = f2ce8acb, %l0 = 0000000000000053
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000f2ce
!	Mem[0000000010101408] = ff95e5d04580eba3, %l4 = 0000000000000030
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = ff95e5d04580eba3
!	Mem[0000000010141430] = 7557a3f65ccfe01b, %f2  = a7044cae 320b66a4
	ldd	[%i5+0x030],%f2 	! %f2  = 7557a3f6 5ccfe01b
!	Mem[0000000030081408] = 000000ff, %f25 = 5f1bc9da
	lda	[%i2+%o4]0x89,%f25	! %f25 = 000000ff
!	Mem[0000000030081410] = ffb0c6df 25dfc2ff, %l0 = 0000f2ce, %l1 = 00003a6e
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000025dfc2ff 00000000ffb0c6df
!	Mem[0000000010001400] = 142ceda6 a6bf00ff, %l6 = 3c02eba3, %l7 = 000033ff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000a6bf00ff 00000000142ceda6
!	Mem[00000000211c0000] = 00d1fe22, %l1 = 00000000ffb0c6df
	ldub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 3f856224, %l5 = 000000009a33822a
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 0000003f000000ff

p0_label_16:
!	%l2 = 00000000000000d1, Mem[0000000010101400] = a6bf8acb
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = a6bf00d1
!	Mem[0000000030181408] = ff1372b3, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ff1372b3
!	Mem[000000001000140c] = 3c02eba3, %l6 = a6bf00ff, %l6 = a6bf00ff
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000003c02eba3
!	%l5 = 000000000000003f, Mem[0000000010101420] = 96271b53, %asi = 80
	stwa	%l5,[%i4+0x020]%asi	! Mem[0000000010101420] = 0000003f
!	%l6 = 3c02eba3, %l7 = 142ceda6, Mem[0000000010101410] = 899faf2e 00000000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 3c02eba3 142ceda6
!	Mem[0000000010101410] = 3c02eba3, %l2 = 000000d1, %l4 = 4580eba3
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000003c02eba3
!	%l2 = 00000000000000d1, Mem[0000000010101400] = 142ceda6a6bf00d1
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000d1
!	Mem[0000000010141400] = b8528f99, %l2 = 00000000000000d1
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000b8528f99
!	%l1 = 00000000ff1372b3, Mem[0000000030001400] = a4ffffffb3f37816
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000ff1372b3
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 16a2f93e02d40523, %l6 = 000000003c02eba3
	ldxa	[%i3+0x028]%asi,%l6	! %l6 = 16a2f93e02d40523

p0_label_17:
!	Mem[0000000010001400] = a6bf00ff, %l5 = 000000000000003f
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000a6bf00ff
!	Mem[0000000030081400] = 8dd6af2b, %l6 = 16a2f93e02d40523
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000002b
!	Mem[0000000030141400] = 07ccaca2 9afa7634 07db5ee9 614f62be
!	Mem[0000000030141410] = d1551d0b 5e8884fb a3e23f32 659c7f47
!	Mem[0000000030141420] = 69742726 24009712 b5a4b37f 20be967f
!	Mem[0000000030141430] = 037cf402 45e82c3e 952f2bd2 47a79b2d
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = 000000df, %l5 = 00000000a6bf00ff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000df
!	Mem[0000000030041400] = aefbe4e4, %l6 = 000000000000002b
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 000000000000aefb
!	Mem[0000000010041400] = 71bb71c07509d289, %l3 = 61dd8e289a33822a
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 71bb71c07509d289
!	Mem[0000000010081408] = 00000000, %l1 = 00000000ff1372b3
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 51ac057c, %l2 = 00000000b8528f99
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000051
!	Mem[0000000030001408] = ff13a2f0, %l2 = 0000000000000051
	lduwa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff13a2f0
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1400] = c04a5c60
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00005c60

p0_label_18:
!	Mem[000000001008141c] = 3e4c256a, %l7 = 00000000142ceda6, %asi = 80
	swapa	[%i2+0x01c]%asi,%l7	! %l7 = 000000003e4c256a
!	Mem[0000000030181408] = 00000000, %l6 = 000000000000aefb
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 000000003c02eba3, Mem[0000000030041400] = aefbe4e4
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = a3fbe4e4
!	Mem[0000000030041400] = a3fbe4e4, %l5 = 00000000000000df
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 000000a3000000ff
!	Mem[0000000010081400] = 1e686056, %l0 = 0000000025dfc2ff
	swap	[%i2+%g0],%l0		! %l0 = 000000001e686056
!	Mem[0000000010101408] = ff95e5d0, %l2 = 00000000ff13a2f0
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff95e5d0
!	%l3 = 71bb71c07509d289, Mem[0000000030081410] = ffc2df25
	stwa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 7509d289
!	%l5 = 00000000000000a3, Mem[0000000010041408] = 000000d1b1ab37fc, %asi = 80
	stxa	%l5,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000000000a3
!	Mem[00000000201c0001] = aa27167a, %l3 = 71bb71c07509d289
	ldstub	[%o0+0x001],%l3		! %l3 = 00000027000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000000000a3, %f16 = 0b1d55d1 58fa70ba
	ldda	[%i1+%o4]0x80,%f16	! %f16 = 00000000 000000a3

p0_label_19:
!	Mem[00000000300c1410] = df000000 0d8b778e, %l2 = ff95e5d0, %l3 = 00000027
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000df000000 000000000d8b778e
!	Mem[000000001010141c] = 9207d9ba, %l2 = 00000000df000000
	ldsba	[%i4+0x01d]%asi,%l2	! %l2 = 0000000000000007
!	Mem[0000000010181410] = 38d597a7, %l2 = 0000000000000007
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000038d597a7
!	Mem[0000000010141400] = d1000000, %f26 = 36c41009
	lda	[%i5+%g0]0x88,%f26	! %f26 = d1000000
!	Mem[0000000030081400] = 2bafd68d, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = 000000002bafd68d
!	Mem[0000000030041400] = e4e4fbff, %f25 = 000000ff
	lda	[%i1+%g0]0x89,%f25	! %f25 = e4e4fbff
!	%f20 = 17f27cfe, %f22 = ecc3ac98
	fcmps	%fcc3,%f20,%f22		! %fcc3 = 2
!	Mem[0000000030041408] = f2ce8acb, %l4 = 000000003c02eba3
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = fffffffffffffff2
!	Mem[00000000300c1410] = 8e778b0d000000df, %f22 = ecc3ac98 000000ff
	ldda	[%i3+%o5]0x89,%f22	! %f22 = 8e778b0d 000000df
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (5)
!	%l0 = 000000001e686056, Mem[0000000030141408] = e95edb07
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = e95e6056

p0_label_20:
!	Mem[0000000010181400] = 52d6eba3, %l5 = 00000000000000a3
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 0000000052d6eba3
!	%l2 = 0000000038d597a7, Mem[0000000010101408] = ff13a2f0
	stba	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = a713a2f0
!	%l4 = fffffff2, %l5 = 52d6eba3, Mem[0000000010001400] = a6bf00ff 142ceda6
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = fffffff2 52d6eba3
!	%l4 = fffffff2, %l5 = 52d6eba3, Mem[0000000010081410] = d71c390f b39e89d7
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = fffffff2 52d6eba3
!	Mem[0000000010141408] = dc59e46e, %l2 = 0000000038d597a7
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000dc59e46e
!	%l4 = fffffffffffffff2, Mem[0000000030041410] = 51ac057c
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = fffffff2
!	%f9  = 24009712, Mem[000000001000141c] = 9207d9ba
	st	%f9 ,[%i0+0x01c]	! Mem[000000001000141c] = 24009712
!	%l7 = 000000003e4c256a, Mem[0000000030141408] = 56605ee9614f62be
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000003e4c256a
!	Mem[00000000211c0000] = 00d1fe22, %l1 = 000000002bafd68d
	ldstub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = a3eb8045f0a213a7, %f28 = 416437a4 f83efdca
	ldda	[%i4+%o4]0x88,%f28	! %f28 = a3eb8045 f0a213a7

p0_label_21:
!	Mem[0000000010041410] = 1a154415, %l0 = 000000001e686056
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 000000001a154415
!	Mem[00000000100c1408] = 246285ff, %l0 = 000000001a154415
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 00000000246285ff
!	Mem[0000000030101400] = abffbfa6, %f2  = 07db5ee9
	lda	[%i4+%g0]0x81,%f2 	! %f2 = abffbfa6
!	Mem[00000000100c1410] = ff33822a, %l6 = 0000000000000000
	ldsw	[%i3+%o5],%l6		! %l6 = ffffffffff33822a
!	Mem[0000000030041400] = fffbe4e4, %l4 = fffffffffffffff2
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = fffffffffffbe4e4
!	Mem[0000000030141410] = d1551d0b 5e8884fb, %l0 = 246285ff, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000d1551d0b 000000005e8884fb
!	Mem[0000000010081410] = fffffff2, %f7  = 659c7f47
	lda	[%i2+%o5]0x88,%f7 	! %f7 = fffffff2
!	Mem[00000000300c1400] = aefbe4e4, %l0 = 00000000d1551d0b
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000aefbe4e4
!	Mem[0000000030081400] = 2bafd68d, %l6 = ffffffffff33822a
	ldsha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000002baf
!	Starting 10 instruction Store Burst
!	%f6  = a3e23f32 fffffff2, Mem[0000000010001408] = d0e59568 a3eb023c
	stda	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = a3e23f32 fffffff2

p0_label_22:
!	%l6 = 00002baf, %l7 = 3e4c256a, Mem[0000000030001400] = 00000000 ff1372b3
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00002baf 3e4c256a
!	%l3 = 000000000d8b778e, imm = fffffffffffffb8b, %l0 = 00000000aefbe4e4
	sub	%l3,-0x475,%l0		! %l0 = 000000000d8b7c03
!	%f0  = 07ccaca2 9afa7634 abffbfa6 614f62be
!	%f4  = d1551d0b 5e8884fb a3e23f32 fffffff2
!	%f8  = 69742726 24009712 b5a4b37f 20be967f
!	%f12 = 037cf402 45e82c3e 952f2bd2 47a79b2d
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[0000000030141408] = 00000000, %l2 = 00000000dc59e46e
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 3c02eba3, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 0000003c000000ff
!	Mem[0000000030141408] = ff000000, %l4 = fffffffffffbe4e4
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	%f16 = 00000000 000000a3, %l7 = 000000003e4c256a
!	Mem[0000000030181400] = b8528f9958fa70ba
	stda	%f16,[%i6+%l7]ASI_PST32_SL ! Mem[0000000030181400] = b8528f9900000000
!	%f28 = a3eb8045 f0a213a7, %l5 = 0000000052d6eba3
!	Mem[0000000010101400] = d100000000000000
	stda	%f28,[%i4+%l5]ASI_PST8_PL ! Mem[0000000010101400] = a7130000008000a3
!	Mem[0000000010001408] = f2ffffff, %l7 = 000000003e4c256a
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000f2ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff13a2f0, %f20 = 17f27cfe
	lda	[%i0+%o4]0x81,%f20	! %f20 = ff13a2f0

p0_label_23:
!	Mem[0000000021800000] = 4030a558, %l5 = 0000000052d6eba3
	ldsh	[%o3+%g0],%l5		! %l5 = 0000000000004030
!	Mem[0000000010001408] = 6a254c3e, %l5 = 0000000000004030
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 000000000000003e
!	Mem[0000000010181428] = e8aad8a2, %l5 = 000000000000003e
	lduha	[%i6+0x02a]%asi,%l5	! %l5 = 000000000000d8a2
!	Mem[0000000010001410] = d1551d0b, %l5 = 000000000000d8a2
	lduha	[%i0+0x012]%asi,%l5	! %l5 = 0000000000001d0b
!	Mem[0000000030001410] = 531b2796, %l6 = 0000000000002baf
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000002796
!	Mem[00000000300c1410] = df000000, %l6 = 0000000000002796
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000df00
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030041410] = 0b1d55d1, %l0 = 000000000d8b7c03
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000d1
!	Mem[0000000010141410] = 3f856224, %l5 = 0000000000001d0b
	lduwa	[%i5+%o5]0x88,%l5	! %l5 = 000000003f856224
!	Mem[0000000010181410] = a797d538, %l0 = 00000000000000d1
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 00000000a797d538
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = d1551d0b, %l2 = 000000000000003c
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000d1551d0b

p0_label_24:
!	%f7  = fffffff2, Mem[0000000030101410] = e6f3ebc8
	sta	%f7 ,[%i4+%o5]0x89	! Mem[0000000030101410] = fffffff2
!	%l5 = 000000003f856224, Mem[0000000010041430] = 77080fc2, %asi = 80
	stwa	%l5,[%i1+0x030]%asi	! Mem[0000000010041430] = 3f856224
!	%l2 = d1551d0b, %l3 = 0d8b778e, Mem[0000000030181410] = 17f27cfe 11000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = d1551d0b 0d8b778e
!	%l4 = 00000000ff000000, Mem[000000001018143f] = cdc5ef0e
	stb	%l4,[%i6+0x03f]		! Mem[000000001018143c] = cdc5ef00
!	%l2 = 00000000d1551d0b, Mem[0000000020800000] = b125160c, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 0b25160c
!	%l2 = d1551d0b, %l3 = 0d8b778e, Mem[0000000010101408] = f0a213a7 a3eb8045
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = d1551d0b 0d8b778e
!	Mem[0000000010041400] = 71bb71c0, %l2 = 00000000d1551d0b
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000071bb71c0
!	%l5 = 000000003f856224, Mem[0000000030101400] = abffbfa6
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 24ffbfa6
!	Mem[0000000010001408] = 3e4c256a, %l5 = 000000003f856224
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 0000003e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = d1551d0b, %l5 = 000000000000003e
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffd1551d0b

p0_label_25:
!	Mem[0000000010081410] = fffffff2, %l0 = 00000000a797d538
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = fffffffffffffff2
!	Mem[0000000030141400] = a2accc07, %l1 = 000000005e8884fb
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 00000000a2accc07
!	Mem[0000000010141414] = ffb8004a, %l3 = 000000000d8b778e
	lduh	[%i5+0x016],%l3		! %l3 = 000000000000004a
!	Mem[0000000010081400] = ffc2df25, %l6 = 000000000000df00
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000025
!	Mem[00000000100c1410] = ff33822a 9a33822a, %l4 = ff000000, %l5 = d1551d0b
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff33822a 000000009a33822a
!	Mem[0000000030001400] = 00002baf, %l0 = fffffffffffffff2
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 0000003c, %l6 = 0000000000000025
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 96271b53e2409144, %l3 = 000000000000004a
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 96271b53e2409144
!	Mem[00000000300c1410] = 8e778b0d 000000df, %l0 = 00000000, %l1 = a2accc07
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000df 000000008e778b0d
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 000000a3 4a1372b3 57404012
!	%f20 = ff13a2f0 11000000 8e778b0d 000000df
!	%f24 = 69387c07 e4e4fbff d1000000 8d5e390d
!	%f28 = a3eb8045 f0a213a7 5dda5b71 54ad0d30
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400

p0_label_26:
!	Mem[0000000020800000] = 0b25160c, %l5 = 000000009a33822a
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 0000000b000000ff
!	%l5 = 000000000000000b, Mem[0000000010141408] = 38d597a7
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 38d5000b
!	Mem[0000000010041414] = 3ab20bb5, %l6 = 00000000, %l5 = 0000000b
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000003ab20bb5
!	Mem[00000000300c1408] = a43c6439, %l0 = 00000000000000df
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000a4000000ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[000000001000143b] = bdec4429, %l1 = 000000008e778b0d
	ldstuba	[%i0+0x03b]%asi,%l1	! %l1 = 00000029000000ff
!	%l6 = 0000000000000000, Mem[000000001010141e] = 9207d9ba
	sth	%l6,[%i4+0x01e]		! Mem[000000001010141c] = 92070000
!	%f18 = 4a1372b3 57404012, Mem[0000000010081438] = 987980c3 09e4df43
	std	%f18,[%i2+0x038]	! Mem[0000000010081438] = 4a1372b3 57404012
!	%f5  = 5e8884fb, Mem[0000000030181400] = 998f52b8
	sta	%f5 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 5e8884fb
!	%l4 = 00000000ff33822a, Mem[0000000010001410] = 0b1d55d1
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ff33822a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 25dfc2ff, %l1 = 0000000000000029
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000025dfc2ff

p0_label_27:
!	Mem[0000000010001410] = 2a8233ff, %l0 = 00000000000000a4
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 000000002a8233ff
!	Mem[0000000010181408] = ae4c04a7, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffffa7
!	Mem[00000000100c1410] = ff33822a9a33822a, %l6 = ffffffffffffffa7
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = ff33822a9a33822a
!	Mem[0000000030041410] = fb84885e0b1d55d1, %l6 = ff33822a9a33822a
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = fb84885e0b1d55d1
!	Mem[0000000030001408] = 4a1372b3, %l0 = 000000002a8233ff
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000004a13
!	Mem[0000000030181400] = fb84885e, %l6 = fb84885e0b1d55d1
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = fffffffffffffffb
!	Mem[0000000030181410] = 0b1d55d1, %l3 = 96271b53e2409144
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = 00000000000055d1
!	Mem[0000000010041400] = 0b1d55d1, %l1 = 0000000025dfc2ff
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000d1
!	Mem[00000000300c1408] = ff3c6439e5a90018, %f6  = a3e23f32 fffffff2
	ldda	[%i3+%o4]0x81,%f6 	! %f6  = ff3c6439 e5a90018
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l1 = 00000000000000d1
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_28:
!	%f2  = abffbfa6 614f62be, Mem[0000000030181400] = fb84885e 00000000
	stda	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = abffbfa6 614f62be
!	%l2 = 0000000071bb71c0, Mem[0000000030181400] = abffbfa6
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 71c0bfa6
!	%f2  = abffbfa6 614f62be, Mem[0000000010181408] = ae4c04a7 a4660b32
	stda	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = abffbfa6 614f62be
!	%f4  = d1551d0b, Mem[00000000300c1410] = df000000
	sta	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = d1551d0b
!	Mem[0000000010001401] = f2ffffff, %l5 = 000000003ab20bb5
	ldstub	[%i0+0x001],%l5		! %l5 = 000000ff000000ff
!	%l4 = 00000000ff33822a, Mem[0000000010001400] = fffffff2
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffff2a
!	%l7 = 00000000f2ffffff, Mem[000000001018143d] = cdc5ef00, %asi = 80
	stba	%l7,[%i6+0x03d]%asi	! Mem[000000001018143c] = cdffef00
!	%l6 = fffffffffffffffb, Mem[0000000010041410] = 1a154415
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = fffffffb
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 2462853f
	stba	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ff62853f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffb0c6df 89d20975, %l0 = 00004a13, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000089d20975 00000000ffb0c6df

p0_label_29:
!	Mem[0000000021800100] = ffff933f, %l0 = 0000000089d20975
	lduh	[%o3+0x100],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030101410] = aefbe4e4fffffff2, %f4  = d1551d0b 5e8884fb
	ldda	[%i4+%o5]0x89,%f4 	! %f4  = aefbe4e4 fffffff2
!	Mem[0000000030041400] = a2accc07, %l1 = 00000000ffb0c6df
	ldsba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000007
!	Mem[0000000030181400] = a6bfc071, %l6 = fffffffffffffffb
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = ffffffffa6bfc071
!	Mem[0000000021800140] = 231c5bff, %l0 = 000000000000ffff
	lduba	[%o3+0x141]%asi,%l0	! %l0 = 000000000000001c
!	Mem[00000000100c1408] = b184261e 246285ff, %l4 = ff33822a, %l5 = 000000ff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000246285ff 00000000b184261e
!	Mem[0000000010081420] = 000000d1 9a33822a, %l0 = 0000001c, %l1 = 00000007
	ldd	[%i2+0x020],%l0		! %l0 = 00000000000000d1 000000009a33822a
!	Mem[0000000010041410] = fffffffb, %l2 = 0000000071bb71c0
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1400] = e4e4fbae, %f27 = 8d5e390d
	lda	[%i3+%g0]0x81,%f27	! %f27 = e4e4fbae
!	Starting 10 instruction Store Burst
!	%l4 = 00000000246285ff, Mem[0000000010181408] = 614f62be
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 614f85ff

p0_label_30:
!	Mem[0000000030101400] = a6bfff24, %l0 = 00000000000000d1
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000a6bfff24
!	Mem[0000000010181410] = a797d538, %l6 = ffffffffa6bfc071
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 00000038000000ff
!	%l2 = ffffffff, %l3 = 000055d1, Mem[0000000010101400] = a7130000 008000a3
	std	%l2,[%i4+%g0]		! Mem[0000000010101400] = ffffffff 000055d1
!	%f26 = d1000000 e4e4fbae, Mem[0000000010101438] = bdec4429 2d7d9f8c
	stda	%f26,[%i4+0x038]%asi	! Mem[0000000010101438] = d1000000 e4e4fbae
!	%l5 = 00000000b184261e, Mem[0000000030101410] = f2ffffffe4e4fbae
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000b184261e
!	%l5 = 00000000b184261e, Mem[0000000010041411] = fffffffb
	stb	%l5,[%i1+0x011]		! Mem[0000000010041410] = ff1efffb
!	%f4  = aefbe4e4 fffffff2, %l5 = 00000000b184261e
!	Mem[00000000300c1410] = d1551d0b0d8b778e
	add	%i3,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST16_S ! Mem[00000000300c1410] = aefbe4e4ffff778e
!	%f16 = 00000000, Mem[0000000030001408] = b372134a
	sta	%f16,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000010001434] = 3a6e5eb2, %l4 = 00000000246285ff
	swap	[%i0+0x034],%l4		! %l4 = 000000003a6e5eb2
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 71c0bfa6614f62be, %l1 = 000000009a33822a
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = 71c0bfa6614f62be

p0_label_31:
!	Mem[0000000030181410] = 0b1d55d1, %l4 = 000000003a6e5eb2
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000d1
!	Mem[0000000030081400] = 2bafd68d 093bd89b ff000000 000000d5
!	Mem[0000000030081410] = 7509d289 dfc6b0ff 406ec31f 7b97511a
!	Mem[0000000030081420] = 6ecc0b5f 49a5b322 6b69d5b3 0c5059a4
!	Mem[0000000030081430] = cea292b2 7779089e 9a4ea2f6 57bc1770
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000020800000] = ff25160c, %l7 = 00000000f2ffffff
	ldub	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 0000003c, %l3 = 00000000000055d1
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 000000000000003c
!	Mem[0000000030101410] = 00000000, %l5 = 00000000b184261e
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = f2ffffffa3ebd652, %l4 = 00000000000000d1
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = f2ffffffa3ebd652
!	Mem[0000000010141410] = ff62853f, %l4 = f2ffffffa3ebd652
	ldsha	[%i5+0x010]%asi,%l4	! %l4 = ffffffffffffff62
!	Mem[0000000010101410] = a3eb02ff, %l4 = ffffffffffffff62
	ldsha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000002ff
!	Mem[0000000010081410] = f2ffffffa3ebd652, %f12 = 037cf402 45e82c3e
	ldd	[%i2+%o5],%f12		! %f12 = f2ffffff a3ebd652
!	Starting 10 instruction Store Burst
!	%l6 = 00000038, %l7 = 000000ff, Mem[0000000010001400] = ffffff2a 52d6eba3
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000038 000000ff

p0_label_32:
!	%l0 = 00000000a6bfff24, Mem[0000000030101400] = d1000000
	stba	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 24000000
!	%l0 = a6bfff24, %l1 = 614f62be, Mem[0000000010101408] = d1551d0b 0d8b778e
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = a6bfff24 614f62be
!	%l4 = 000002ff, %l5 = 00000000, Mem[00000000300c1410] = e4e4fbae 8e77ffff
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000002ff 00000000
	membar	#Sync			! Added by membar checker (8)
!	%l1 = 71c0bfa6614f62be, Mem[0000000030081400] = 2bafd68d
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 62bed68d
!	%l4 = 000002ff, %l5 = 00000000, Mem[00000000100c1400] = 605c0000 ae32c506
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000002ff 00000000
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 000002ff
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000038
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f6  = ff3c6439 e5a90018, %l2 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000000000a3
	stda	%f6,[%i0+%l2]ASI_PST16_SL ! Mem[0000000030001400] = 1800a9e539643cff
!	%f6  = ff3c6439, Mem[0000000010141408] = 0b00d538
	sta	%f6 ,[%i5+%o4]0x80	! Mem[0000000010141408] = ff3c6439
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000024, %l5 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000024

p0_label_33:
!	Mem[0000000010181428] = e8aad8a2, %l5 = 0000000000000024
	lduwa	[%i6+0x028]%asi,%l5	! %l5 = 00000000e8aad8a2
!	Mem[0000000030081400] = 9bd83b098dd6be62, %f20 = 7509d289 dfc6b0ff
	ldda	[%i2+%g0]0x89,%f20	! %f20 = 9bd83b09 8dd6be62
!	Mem[0000000010041400] = d1551d0b 7509d289 00000000 000000a3
!	Mem[0000000010041410] = ff1efffb 3ab20bb5 3f8f4308 746f7911
!	Mem[0000000010041420] = a16e566a 29fff62f 69387c07 5f1bc9da
!	Mem[0000000010041430] = 3f856224 a6cf7b9f 170fa9bb 78fe8df4
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[00000000300c1400] = aefbe4e4, %l3 = 000000000000003c
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000aefbe4e4
!	Mem[0000000010001408] = ff4c256a 323fe2a3, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i0+%o4],%l6		! %l6 = 00000000ff4c256a 00000000323fe2a3
!	Mem[0000000010141408] = ff3c6439be6e2552, %l2 = ffffffffffffffff
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = ff3c6439be6e2552
!	Mem[0000000010141430] = 7557a3f6, %l2 = ff3c6439be6e2552
	ldsh	[%i5+0x030],%l2		! %l2 = 0000000000007557
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030101400] = 24000000 a6ed2c14 6895e5d0 3c02eba3
!	Mem[0000000030101410] = ff000000 b184261e 2b4e9914 d0e59568
!	Mem[0000000030101420] = 96271b53 e2409144 5ca572a0 ae4c04a7
!	Mem[0000000030101430] = 3059c69c 3a6e5eb2 07ccaca2 9afa7634
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030101408] = a3eb023cd0e59568, %f4  = aefbe4e4 fffffff2
	ldda	[%i4+%o4]0x89,%f4 	! %f4  = a3eb023c d0e59568
!	Starting 10 instruction Store Burst
!	%f10 = b5a4b37f 20be967f, %l5 = 00000000e8aad8a2
!	Mem[0000000030181430] = 416437a4f83efdca
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_S ! Mem[0000000030181430] = b5a4b37ff83efdca

p0_label_34:
!	%l1 = 71c0bfa6614f62be, Mem[0000000010181410] = a797d5ff
	stha	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = a79762be
!	%f6  = ff3c6439, Mem[0000000010101404] = 000055d1
	st	%f6 ,[%i4+0x004]	! Mem[0000000010101404] = ff3c6439
!	Mem[0000000030041400] = a2accc07, %l2 = 0000000000007557
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 00000000a2accc07
!	Mem[0000000030081408] = 000000ff, %l3 = 00000000aefbe4e4
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000323fe2a3, Mem[0000000030041410] = fb84885e0b1d55d1
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000323fe2a3
!	%l0 = a6bfff24, %l1 = 614f62be, Mem[0000000010101408] = a6bfff24 614f62be
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = a6bfff24 614f62be
!	%l2 = 00000000a2accc07, Mem[0000000010101428] = 5ca572a0669e5054
	stx	%l2,[%i4+0x028]		! Mem[0000000010101428] = 00000000a2accc07
!	%l6 = ff4c256a, %l7 = 323fe2a3, Mem[00000000100c1408] = 246285ff b184261e
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff4c256a 323fe2a3
!	Mem[0000000010141420] = 49f9d485, %l0 = 00000000a6bfff24, %asi = 80
	swapa	[%i5+0x020]%asi,%l0	! %l0 = 0000000049f9d485
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffb0c6df 89d20975, %l2 = a2accc07, %l3 = 000000ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000089d20975 00000000ffb0c6df

p0_label_35:
!	Mem[0000000030001408] = 00000000, %l0 = 0000000049f9d485
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141430] = 7557a3f6, %l5 = 00000000e8aad8a2
	ldswa	[%i5+0x030]%asi,%l5	! %l5 = 000000007557a3f6
!	Mem[0000000010001400] = 38000000, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000038
!	Mem[0000000030081408] = 000000ff, %l4 = 00000000000002ff
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 24ffbfa6, %l2 = 0000000089d20975
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 00000000000024ff
!	Mem[0000000010041420] = a16e566a 29fff62f, %l6 = ff4c256a, %l7 = 323fe2a3
	ldd	[%i1+0x020],%l6		! %l6 = 00000000a16e566a 0000000029fff62f
!	Mem[00000000300c1400] = aefbe4e4, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 000000000000e4e4
!	Mem[0000000010081430] = d8f46c0a, %l1 = 71c0bfa6614f62be
	lduwa	[%i2+0x030]%asi,%l1	! %l1 = 00000000d8f46c0a
!	Mem[00000000300c1400] = aefbe4e4, %l6 = 00000000a16e566a
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffe4e4
!	Starting 10 instruction Store Burst
!	%l5 = 000000007557a3f6, Mem[0000000030141410] = 3c000000
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 3c0000f6

p0_label_36:
!	%l2 = 00000000000024ff, Mem[0000000030081400] = 62bed68d
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffbed68d
!	%l7 = 0000000029fff62f, Mem[000000001010142e] = a2accc07, %asi = 80
	stha	%l7,[%i4+0x02e]%asi	! Mem[000000001010142c] = a2acf62f
!	Mem[00000000211c0001] = ffd1fe22, %l6 = ffffffffffffe4e4
	ldstub	[%o2+0x001],%l6		! %l6 = 000000d1000000ff
!	%l4 = 0000e4e4, %l5 = 7557a3f6, Mem[0000000010001418] = 2b4e9914 24009712
	stda	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000e4e4 7557a3f6
!	%f4  = a3eb023c d0e59568, Mem[0000000030181410] = d1551d0b 0d8b778e
	stda	%f4 ,[%i6+%o5]0x81	! Mem[0000000030181410] = a3eb023c d0e59568
!	%l1 = 00000000d8f46c0a, Mem[0000000010041400] = d1551d0b
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0a551d0b
!	Mem[0000000010101408] = 24ffbfa6, %l6 = 00000000000000d1
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000024ffbfa6
!	%f14 = 952f2bd2, Mem[0000000030181410] = 3c02eba3
	sta	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = 952f2bd2
!	%f0  = 07ccaca2 9afa7634 abffbfa6 614f62be
!	%f4  = a3eb023c d0e59568 ff3c6439 e5a90018
!	%f8  = 69742726 24009712 b5a4b37f 20be967f
!	%f12 = f2ffffff a3ebd652 952f2bd2 47a79b2d
	stda	%f0,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = d22b2f95, %f30 = 07ccaca2
	lda	[%i6+%o5]0x81,%f30	! %f30 = d22b2f95

p0_label_37:
!	Mem[0000000010081408] = 00000000, %l5 = 000000007557a3f6
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = fffffe22, %l7 = 0000000029fff62f
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081410] = ffb0c6df89d20975, %l3 = 00000000ffb0c6df
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = ffb0c6df89d20975
!	Mem[0000000030181410] = d22b2f95, %l3 = ffb0c6df89d20975
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffd22b
!	Mem[0000000010081410] = fffffff2, %l1 = 00000000d8f46c0a
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = fffffffffffffff2
!	Mem[00000000300c1400] = e4e4fbae 483d5f70 ff3c6439 e5a90018
!	Mem[00000000300c1410] = 00000000 00000000 835bd3f7 43a68cc6
!	Mem[00000000300c1420] = 6a88b9f9 e03d0111 ce36933b 88295b08
!	Mem[00000000300c1430] = 5ffc35d7 2f7b8146 02cac046 b9674bfe
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030101400] = 00000024, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000024
!	Mem[0000000010101410] = a3eb02ff, %l1 = fffffffffffffff2
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 00000000a3eb02ff
!	Mem[0000000010081418] = 53714580142ceda6, %f0  = 07ccaca2 9afa7634
	ldda	[%i2+0x018]%asi,%f0 	! %f0  = 53714580 142ceda6
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff02eba3, %l3 = ffffffffffffd22b
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_38:
!	%l7 = 00000000000000ff, Mem[0000000010141410] = ff62853f
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	%l4 = 0000e4e4, %l5 = 00000024, Mem[0000000010081410] = fffffff2 52d6eba3
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000e4e4 00000024
!	%l0 = 00000038, %l1 = a3eb02ff, Mem[0000000010041408] = 00000000 000000a3
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000038 a3eb02ff
!	%l0 = 0000000000000038, Mem[00000000100c1410] = 2a82339a2a8233ff
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000038
!	%f14 = 952f2bd2 47a79b2d, Mem[00000000100c1410] = 38000000 00000000
	stda	%f14,[%i3+%o5]0x80	! Mem[00000000100c1410] = 952f2bd2 47a79b2d
!	%f10 = b5a4b37f 20be967f, Mem[0000000030041400] = 57750000 9afa7634
	stda	%f10,[%i1+%g0]0x81	! Mem[0000000030041400] = b5a4b37f 20be967f
!	%l0 = 0000000000000038, Mem[0000000010081410] = 000000240000e4e4
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000038
!	Mem[0000000010041400] = 0a551d0b, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000000a551d0b
	membar	#Sync			! Added by membar checker (10)
!	%f10 = b5a4b37f, Mem[00000000300c1410] = 00000000
	sta	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = b5a4b37f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffbed68d, %l6 = 0000000024ffbfa6
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 000000000000ffbe

p0_label_39:
!	Mem[0000000030001400] = ff3c6439e5a90018, %l6 = 000000000000ffbe
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = ff3c6439e5a90018
!	Mem[0000000030101400] = 00000024, %l6 = ff3c6439e5a90018
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000024
!	Mem[0000000010101408] = d1000000, %l7 = 000000000a551d0b
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000d1000000
!	Mem[0000000030181400] = 71c0bfa6 614f62be, %l2 = 000024ff, %l3 = 000000ff
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 0000000071c0bfa6 00000000614f62be
!	Mem[0000000010041408] = 38000000, %l4 = 000000000000e4e4
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = ff3c6439, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff3c6439
!	Mem[0000000010041434] = a6cf7b9f, %l0 = 0000000000000038
	ldsw	[%i1+0x034],%l0		! %l0 = ffffffffa6cf7b9f
!	Mem[0000000010141408] = 39643cff, %l6 = 0000000000000024
	ldsha	[%i5+%o4]0x88,%l6	! %l6 = 0000000000003cff
!	Mem[0000000010001408] = ff4c256a, %l1 = 00000000a3eb02ff
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = fbae0000, %l7 = 00000000d1000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_40:
!	%l7 = 0000000000000000, Mem[0000000010141400] = 000000d1
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000d1
!	%l5 = 0000000000000024, Mem[0000000021800000] = 4030a558, %asi = 80
	stha	%l5,[%o3+0x000]%asi	! Mem[0000000021800000] = 0024a558
!	Mem[0000000030081408] = ff000000, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00000000ff3c6439, Mem[0000000030101408] = 6895e5d0
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 6439e5d0
!	%f1  = 142ceda6, Mem[00000000100c1408] = 6a254cff
	sta	%f1 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 142ceda6
!	Mem[00000000211c0001] = fffffe22, %l4 = 00000000ff3c6439
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000100c1410] = d22b2f95, %l0 = ffffffffa6cf7b9f
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 00000000d22b2f95
!	Mem[00000000201c0000] = aaff167a, %l4 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000aa000000ff
!	Mem[0000000030141410] = 3c0000f6, %l0 = 00000000d22b2f95
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 000000003c0000f6
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = d22b2f95, %l4 = 00000000000000aa
	ldswa	[%i5+%o5]0x89,%l4	! %l4 = ffffffffd22b2f95

p0_label_41:
!	Mem[0000000010181410] = 6895e5d0, %l1 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000068
!	Mem[0000000030081400] = 8dd6beff, %l6 = 0000000000003cff
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = ffffffff8dd6beff
!	Mem[0000000010101418] = 2b4e991492070000, %f26 = ce36933b 88295b08
	ldd	[%i4+0x018],%f26	! %f26 = 2b4e9914 92070000
!	Mem[0000000010181410] = d0e59568, %l1 = 0000000000000068
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffff9568
!	Mem[0000000010141400] = d1000000, %l4 = ffffffffd22b2f95
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = ff4c256a, %l6 = ffffffff8dd6beff
	ldsb	[%i0+0x00b],%l6		! %l6 = 000000000000006a
!	Mem[0000000030081410] = 89d20975, %l6 = 000000000000006a
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 0000000089d20975
!	Mem[0000000010001410] = ff33822a, %l5 = 0000000000000024
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffff822a
!	Mem[0000000010101438] = d1000000, %l2 = 0000000071c0bfa6
	lduwa	[%i4+0x038]%asi,%l2	! %l2 = 00000000d1000000
!	Starting 10 instruction Store Burst
!	%f30 = 02cac046 b9674bfe, Mem[0000000030041400] = b5a4b37f 20be967f
	stda	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = 02cac046 b9674bfe

p0_label_42:
!	%f0  = 53714580 142ceda6 abffbfa6 614f62be
!	%f4  = a3eb023c d0e59568 ff3c6439 e5a90018
!	%f8  = 69742726 24009712 b5a4b37f 20be967f
!	%f12 = f2ffffff a3ebd652 952f2bd2 47a79b2d
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Mem[00000000100c1410] = a6cf7b9f, %l1 = ffffffffffff9568
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000a6cf7b9f
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010081400] = 80457153, %l2 = 00000000d1000000
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 0000000080457153
!	Mem[0000000030001400] = e5a90018, %l6 = 0000000089d20975
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000018000000ff
!	Mem[00000000100c1400] = 000002ff, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000002ff
!	Mem[0000000030101410] = 000000ff, %l3 = 00000000614f62be
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000a6cf7b9f, Mem[0000000030181410] = 952f2bd2
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 952f2b9f
!	%l4 = 0000000000000000, Mem[0000000030181400] = 71c0bfa6
	stba	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00c0bfa6
!	%l7 = 00000000000002ff, Mem[0000000010081424] = 24009712
	sth	%l7,[%i2+0x024]		! Mem[0000000010081424] = 02ff9712
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = ffff933f, %l5 = ffffffffffff822a
	lduba	[%o3+0x101]%asi,%l5	! %l5 = 00000000000000ff

p0_label_43:
!	Mem[00000000100c1410] = ffff9568, %l5 = 00000000000000ff
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000068
!	Mem[0000000030101408] = d0e53964, %f10 = b5a4b37f
	lda	[%i4+%o4]0x89,%f10	! %f10 = d0e53964
!	Mem[0000000030141400] = 07ccaca2, %l6 = 0000000000000018
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 00000000000007cc
!	Mem[0000000010101410] = ff02eba3 142ceda6, %l2 = 80457153, %l3 = 000000ff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff02eba3 00000000142ceda6
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i5+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 000000d1, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000d1
!	Mem[0000000030101410] = 614f62be, %l5 = 0000000000000068
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 00000000614f62be
!	Mem[0000000010041400] = 000000ff 7509d289, %l2 = ff02eba3, %l3 = 142ceda6
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff 000000007509d289
!	Mem[00000000100c1400] = 0000000000000000, %l3 = 000000007509d289
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 00000000b5a4b37f
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000

p0_label_44:
!	%f0  = 53714580 142ceda6, %l1 = 00000000a6cf7b9f
!	Mem[0000000030081430] = cea292b27779089e
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030081430] = a6ed2c1480457153
!	Mem[000000001004141c] = 746f7911, %l4 = 00000000000000d1, %asi = 80
	swapa	[%i1+0x01c]%asi,%l4	! %l4 = 00000000746f7911
!	%f0  = 53714580 142ceda6, %l4 = 00000000746f7911
!	Mem[0000000010081400] = 000000d1142ceda6
	stda	%f0,[%i2+%l4]ASI_PST32_P ! Mem[0000000010081400] = 000000d1142ceda6
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181408] = be624f61 a6bfffab
	stda	%l2,[%i6+0x008]%asi	! Mem[0000000010181408] = 000000ff 00000000
!	Mem[0000000030101400] = 24000000, %l7 = 00000000000002ff
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000024000000ff
!	%f18 = ff3c6439, Mem[00000000100c141c] = 35a67574
	st	%f18,[%i3+0x01c]	! Mem[00000000100c141c] = ff3c6439
!	%l4 = 00000000746f7911, Mem[0000000010181413] = 6895e5d0
	stb	%l4,[%i6+0x013]		! Mem[0000000010181410] = 6895e511
!	Mem[0000000010081438] = 952f2bd247a79b2d, %l4 = 00000000746f7911, %l7 = 0000000000000024
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 952f2bd247a79b2d
!	Mem[0000000010041410] = ff1efffb, %l3 = 0000000000000000
	swap	[%i1+%o5],%l3		! %l3 = 00000000ff1efffb
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff3c6439e5a900ff, %f22 = 835bd3f7 43a68cc6
	ldda	[%i0+%g0]0x89,%f22	! %f22 = ff3c6439 e5a900ff

p0_label_45:
!	Mem[0000000030001400] = ff3c6439e5a900ff, %f2  = abffbfa6 614f62be
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = ff3c6439 e5a900ff
!	Mem[00000000211c0000] = fffffe22, %l1 = 00000000a6cf7b9f
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = ff000000 a6ed2c14, %l2 = 000000ff, %l3 = ff1efffb
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff000000 00000000a6ed2c14
!	Mem[0000000030041408] = abffbfa6, %f17 = 483d5f70
	lda	[%i1+%o4]0x81,%f17	! %f17 = abffbfa6
!	Mem[0000000010101408] = 614f62be d1000000, %l2 = ff000000, %l3 = a6ed2c14
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000d1000000 00000000614f62be
!	Mem[0000000030101408] = d0e53964, %f13 = a3ebd652
	lda	[%i4+%o4]0x89,%f13	! %f13 = d0e53964
!	Mem[0000000030181408] = ff00aefb, %l6 = 00000000000007cc
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff00aefb
!	Mem[0000000010001410] = 2a8233ff b1ab37fc, %l0 = 3c0000f6, %l1 = ffffffff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 000000002a8233ff 00000000b1ab37fc
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 000000002a8233ff
	setx	0xd202ae1fa105cfe7,%g7,%l0 ! %l0 = d202ae1fa105cfe7
!	%l1 = 00000000b1ab37fc
	setx	0x8cb07a5f9624ddda,%g7,%l1 ! %l1 = 8cb07a5f9624ddda
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d202ae1fa105cfe7
	setx	0x2e0fd54fdc9db294,%g7,%l0 ! %l0 = 2e0fd54fdc9db294
!	%l1 = 8cb07a5f9624ddda
	setx	0x3ee8000f96374c94,%g7,%l1 ! %l1 = 3ee8000f96374c94
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = a6ed2c14, %l1 = 3ee8000f96374c94
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000a6ed2c14

p0_label_46:
!	%f12 = f2ffffff d0e53964, Mem[00000000100c1430] = db92d96a e14bc547
	stda	%f12,[%i3+0x030]%asi	! Mem[00000000100c1430] = f2ffffff d0e53964
!	Mem[0000000030001400] = e5a900ff, %l2 = 00000000d1000000
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 00000000e5a900ff
!	%l0 = 2e0fd54fdc9db294, Mem[0000000030141410] = d22b2f95
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = dc9db294
!	Mem[00000000218000c0] = 0068ff0b, %l7 = 952f2bd247a79b2d
	ldstub	[%o3+0x0c0],%l7		! %l7 = 00000000000000ff
!	%f22 = ff3c6439 e5a900ff, %l0 = 2e0fd54fdc9db294
!	Mem[00000000100c1420] = 66f377b385f06698
	add	%i3,0x020,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1420] = 66f377b339646698
!	%l4 = 00000000746f7911, Mem[0000000030101400] = 000000ff
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000011
!	%l4 = 00000000746f7911, Mem[0000000030101400] = 11000000
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 746f7911
!	Mem[00000000100c1428] = 16a2f93e, %l2 = 00000000e5a900ff
	swap	[%i3+0x028],%l2		! %l2 = 0000000016a2f93e
!	Mem[0000000010081400] = d1000000, %l5 = 00000000614f62be
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000d1000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000d1, %l3 = 00000000614f62be
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_47:
!	Mem[0000000010141408] = ff3c6439, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000ff3c
!	Mem[0000000010141418] = 0b807b72 e69ca2ca, %l4 = 746f7911, %l5 = d1000000
	ldda	[%i5+0x018]%asi,%l4	! %l4 = 000000000b807b72 00000000e69ca2ca
!	Mem[00000000201c0000] = ffff167a, %l0 = 2e0fd54fdc9db294
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 07ccaca2 9afa7634, %l6 = ff00aefb, %l7 = 0000ff3c
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000007ccaca2 000000009afa7634
!	Mem[0000000030141410] = 94b29ddc, %l2 = 0000000016a2f93e
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff94
!	Mem[0000000030141400] = 3476fa9a a2accc07, %l2 = ffffff94, %l3 = 00000000
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000a2accc07 000000003476fa9a
!	Mem[0000000010141410] = 000000ff, %l2 = 00000000a2accc07
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 0000000057404012, %f14 = 952f2bd2 47a79b2d
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 00000000 57404012
!	Mem[0000000010041408] = 00000038a3eb02ff, %l0 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = 00000038a3eb02ff
!	Starting 10 instruction Store Burst
!	%l6 = 07ccaca2, %l7 = 9afa7634, Mem[0000000010041410] = 00000000 3ab20bb5
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 07ccaca2 9afa7634

p0_label_48:
!	%l4 = 000000000b807b72, Mem[0000000010081410] = 3c02eba3
	stha	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 3c027b72
!	%l6 = 0000000007ccaca2, Mem[0000000030181400] = a6bfc000
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 07ccaca2
!	%l6 = 0000000007ccaca2, Mem[0000000030141400] = a2accc07
	stba	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = a2accca2
!	Mem[0000000030081408] = ff000000, %l0 = 00000038a3eb02ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l6 = 07ccaca2, %l7 = 9afa7634, Mem[00000000300c1408] = 39643cff 1800a9e5
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 07ccaca2 9afa7634
!	%l4 = 0b807b72, %l5 = e69ca2ca, Mem[00000000300c1408] = 07ccaca2 9afa7634
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0b807b72 e69ca2ca
!	Mem[0000000010081410] = 727b023c, %l3 = 000000003476fa9a
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000072000000ff
!	Mem[0000000010001400] = 38000000, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000038000000
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = 142ceda6, %f28 = 5ffc35d7
	lda	[%i2+0x004]%asi,%f28	! %f28 = 142ceda6

p0_label_49:
!	Mem[0000000030181400] = be624f6107ccaca2, %l6 = 0000000007ccaca2
	ldxa	[%i6+%g0]0x89,%l6	! %l6 = be624f6107ccaca2
!	Mem[0000000030041410] = a3e23f3200000000, %l2 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = a3e23f3200000000
!	Mem[0000000030041408] = a6bfffab, %l2 = a3e23f3200000000
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ab
!	Mem[0000000010181400] = 9afa7634, %l4 = 000000000b807b72
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 000000009afa7634
!	Mem[0000000010041408] = 00000038, %l3 = 0000000000000072
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000038
!	Mem[0000000030081410] = 7509d289, %l7 = 000000009afa7634
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000075
!	Mem[0000000030181400] = 07ccaca2, %l6 = be624f6107ccaca2
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = ffffffffffffaca2
!	Mem[0000000030141410] = dc9db294, %f23 = e5a900ff
	lda	[%i5+%o5]0x89,%f23	! %f23 = dc9db294
!	Mem[0000000030101410] = 614f62be, %l1 = 00000000a6ed2c14
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000062be
!	Starting 10 instruction Store Burst
!	%l0 = 0000000038000000, Mem[0000000020800041] = 822a55e8, %asi = 80
	stba	%l0,[%o1+0x041]%asi	! Mem[0000000020800040] = 820055e8

p0_label_50:
!	%f14 = 00000000 57404012, %l2 = 00000000000000ab
!	Mem[0000000010041420] = a16e566a29fff62f
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010041420] = 124056572900f600
!	%f28 = 142ceda6, Mem[00000000300c1410] = 00000000
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 142ceda6
!	%f2  = ff3c6439, Mem[0000000030181410] = 952f2b9f
	sta	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff3c6439
!	%l0 = 0000000038000000, Mem[0000000030041410] = 323fe2a3
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 323f0000
!	%l7 = 0000000000000075, Mem[0000000010101410] = ff02eba3
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0075eba3
!	%l7 = 0000000000000075, Mem[0000000010081410] = 3c027bff
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000075
!	Mem[00000000100c1408] = 944c3796, %l7 = 0000000000000075
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000094000000ff
!	%l2 = 000000ab, %l3 = 00000038, Mem[0000000030181408] = fbae00ff 12404057
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ab 00000038
!	%f30 = 02cac046 b9674bfe, %l2 = 00000000000000ab
!	Mem[0000000010001428] = 5ca572a0669e5054
	add	%i0,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_P ! Mem[0000000010001428] = 02cac046b9674bfe
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 2d9ba747ffff9568, %l6 = ffffffffffffaca2
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 2d9ba747ffff9568

p0_label_51:
!	Mem[0000000010141410] = 000000ff, %f9  = 24009712
	lda	[%i5+%o5]0x80,%f9 	! %f9 = 000000ff
!	Mem[0000000010101418] = 2b4e9914 92070000, %l2 = 000000ab, %l3 = 00000038
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 000000002b4e9914 0000000092070000
!	Mem[0000000010081410] = 75000000, %l2 = 000000002b4e9914
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 0000000075000000
!	Mem[0000000010001410] = 2a8233ff, %l3 = 0000000092070000
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 000000000000002a
!	Mem[0000000030041410] = 323f0000, %l2 = 0000000075000000
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = be624f61b184261e, %l1 = 00000000000062be
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = be624f61b184261e
!	Mem[00000000100c1410] = 6895ffff, %l3 = 000000000000002a
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 000000006895ffff
!	Mem[0000000010001400] = 000000ffff000000, %f28 = 142ceda6 2f7b8146
	ldda	[%i0+%g0]0x88,%f28	! %f28 = 000000ff ff000000
!	Mem[0000000010181400] = 9afa7634, %l0 = 0000000038000000
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 000000009afa7634
!	Starting 10 instruction Store Burst
!	%f6  = ff3c6439 e5a90018, %l6 = 2d9ba747ffff9568
!	Mem[0000000010101430] = 3059c69c3a6e5eb2
	add	%i4,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101430] = 3059c69c3a6e5eb2

p0_label_52:
!	Mem[0000000010101400] = ffffffff, %l4 = 000000009afa7634
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010181411] = 6895e511, %l5 = 00000000e69ca2ca
	ldstub	[%i6+0x011],%l5		! %l5 = 00000095000000ff
!	%f16 = e4e4fbae abffbfa6 ff3c6439 e5a90018
!	%f20 = 00000000 00000000 ff3c6439 dc9db294
!	%f24 = 6a88b9f9 e03d0111 2b4e9914 92070000
!	%f28 = 000000ff ff000000 02cac046 b9674bfe
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l6 = 2d9ba747ffff9568, Mem[0000000010181408] = ff0000ff
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ff009568
!	%l4 = 00000000ffffffff, Mem[0000000030141410] = fb84885edc9db294
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ffffffff
!	Mem[00000000100c1400] = 00000000, %l1 = be624f61b184261e
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000094, Mem[0000000030041400] = 02cac046b9674bfe
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000094
!	Mem[0000000030141408] = e4e4fbff, %l6 = 2d9ba747ffff9568
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000e4e4fbff
!	%f14 = 00000000 57404012, %l5 = 0000000000000095
!	Mem[0000000010101410] = 0075eba3142ceda6
	add	%i4,0x010,%g1
	stda	%f14,[%g1+%l5]ASI_PST16_P ! Mem[0000000010101410] = 00750000142c4012
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00007500, %f0  = 53714580
	lda	[%i4+%o5]0x88,%f0 	! %f0 = 00007500

p0_label_53:
!	Mem[0000000030081410] = 7509d289, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 000000007509d289
!	Mem[0000000010081410] = 6895e5d0 00000075, %l6 = e4e4fbff, %l7 = 00000094
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000075 000000006895e5d0
!	Mem[00000000201c0000] = ffff167a, %l1 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = ff00000000000000, %f8  = 69742726 000000ff
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = ff000000 00000000
!	Mem[0000000030141400] = 3476fa9aa2accca2, %f0  = 00007500 142ceda6
	ldda	[%i5+%g0]0x89,%f0 	! %f0  = 3476fa9a a2accca2
!	Mem[0000000010101438] = d1000000e4e4fbae, %l4 = 00000000ffffffff
	ldx	[%i4+0x038],%l4		! %l4 = d1000000e4e4fbae
!	Mem[0000000030041408] = be624f61 a6bfffab, %l0 = 9afa7634, %l1 = 000000ff
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000a6bfffab 00000000be624f61
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001410] = 2a8233ff, %l7 = 000000006895e5d0
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000002a82
!	Mem[0000000030041408] = abffbfa6, %f12 = f2ffffff
	lda	[%i1+%o4]0x81,%f12	! %f12 = abffbfa6
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 57404012, Mem[0000000010081418] = ff3c6439 e5a90018
	stda	%f14,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000 57404012

p0_label_54:
!	Mem[0000000030181400] = a2accc07, %l6 = 0000000000000075
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000a2000000ff
!	Mem[0000000010101410] = 00007500, %l7 = 0000000000002a82
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000007500
!	Mem[0000000010001424] = e2409144, %l0 = 00000000a6bfffab, %asi = 80
	swapa	[%i0+0x024]%asi,%l0	! %l0 = 00000000e2409144
!	%l6 = 00000000000000a2, Mem[0000000010041400] = ff000000
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000a2
!	%l5 = 0000000000000095, Mem[000000001000142b] = 02cac046, %asi = 80
	stba	%l5,[%i0+0x02b]%asi	! Mem[0000000010001428] = 02cac095
!	%l6 = 00000000000000a2, Mem[0000000010081424] = 02ff9712, %asi = 80
	stwa	%l6,[%i2+0x024]%asi	! Mem[0000000010081424] = 000000a2
!	%l2 = 000000007509d289, Mem[00000000201c0000] = ffff167a, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 89ff167a
!	%l7 = 0000000000007500, Mem[0000000010081400] = be624f61142ceda6
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000007500
!	Mem[0000000020800040] = 820055e8, %l5 = 0000000000000095
	ldstub	[%o1+0x040],%l5		! %l5 = 00000082000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 38000000, %l6 = 00000000000000a2
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_55:
!	Mem[0000000010141410] = 4a00b8ffff000000, %f14 = 00000000 57404012
	ldda	[%i5+%o5]0x88,%f14	! %f14 = 4a00b8ff ff000000
!	Mem[00000000300c1400] = aefbe4e4, %l4 = d1000000e4e4fbae
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffffe4e4
!	Mem[0000000030041408] = abffbfa6, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffabff
!	Mem[00000000100c1408] = 323fe2a396374cff, %l4 = ffffffffffffe4e4
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 323fe2a396374cff
!	Mem[0000000010041400] = ff0000a2, %l7 = 0000000000007500
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = ffffffffffffffa2
!	Mem[0000000030141410] = ffffffff, %l5 = 0000000000000082
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = a2ccaca29afa7634, %f20 = 00000000 00000000
	ldda	[%i5+%g0]0x81,%f20	! %f20 = a2ccaca2 9afa7634
!	Mem[0000000010081404] = 00007500, %f24 = 6a88b9f9
	lda	[%i2+0x004]%asi,%f24	! %f24 = 00007500
!	Mem[0000000010081400] = 0075000000000000, %f28 = 000000ff ff000000
	ldda	[%i2+%g0]0x88,%f28	! %f28 = 00750000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = a6bfffab, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 000000ab000000ff

p0_label_56:
!	Mem[0000000010141410] = 000000ff, %l4 = 323fe2a396374cff
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f28 = 00750000 00000000, Mem[0000000030001408] = e5a90018 ff3c6439
	stda	%f28,[%i0+%o4]0x89	! Mem[0000000030001408] = 00750000 00000000
!	%l3 = 000000006895ffff, Mem[0000000010141410] = ff4c3796
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff4cffff
!	%l1 = 00000000be624f61, Mem[00000000100c141c] = ff3c6439
	sth	%l1,[%i3+0x01c]		! Mem[00000000100c141c] = 4f616439
!	Mem[0000000030001410] = 00000000, %l7 = ffffffffffffffa2
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f24 = 00007500 e03d0111, Mem[0000000030081400] = ffbed68d 093bd89b
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 00007500 e03d0111
!	%l7 = 0000000000000000, Mem[0000000010041408] = 00000038
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000038
!	%l3 = 000000006895ffff, Mem[0000000030001408] = 00000000
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = a6bfffff, %l4 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_57:
!	Mem[0000000010001408] = 6a254cff, %l4 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000004cff
!	Mem[0000000010001400] = ff000000, %l2 = 000000007509d289
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[00000000201c0000] = 89ff167a, %l4 = 0000000000004cff
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffff89ff
!	Mem[0000000030041410] = 00003f32, %l1 = 00000000be624f61
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 9400000000000000, %l4 = ffffffffffff89ff
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 9400000000000000
!	Mem[00000000218000c0] = ff68ff0b, %l2 = ffffffffff000000
	ldub	[%o3+0x0c1],%l2		! %l2 = 0000000000000068
!	Mem[00000000100c1410] = 6895ffff 47a79b2d, %l4 = 00000000, %l5 = 000000ab
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 000000006895ffff 0000000047a79b2d
!	Mem[0000000010101400] = 3476fa9aff3c6439, %l2 = 0000000000000068
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = 3476fa9aff3c6439
!	Mem[00000000300c1410] = a6ed2c14, %l0 = 00000000e2409144
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 000000000000a6ed
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 68ffe511, %l3 = 000000006895ffff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000068000000ff

p0_label_58:
!	%l4 = 6895ffff, %l5 = 47a79b2d, Mem[0000000030041408] = abffbfa6 614f62be
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 6895ffff 47a79b2d
!	%l2 = ff3c6439, %l3 = 00000068, Mem[00000000100c1408] = 96374cff 323fe2a3
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff3c6439 00000068
!	%l4 = 000000006895ffff, Mem[0000000010181408] = 689500ff00000000, %asi = 80
	stxa	%l4,[%i6+0x008]%asi	! Mem[0000000010181408] = 000000006895ffff
!	Mem[0000000010001420] = 96271b53, %l2 = 3476fa9aff3c6439
	swap	[%i0+0x020],%l2		! %l2 = 0000000096271b53
!	%l7 = 0000000000000000, Mem[0000000030081408] = 000000ff
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l0 = 000000000000a6ed, Mem[0000000010041400] = 89d20975ff0000a2
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000a6ed
!	%f2  = ff3c6439, Mem[0000000030041410] = 00003f32
	sta	%f2 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ff3c6439
!	Mem[0000000010141430] = 7557a3f6, %l6 = ffffabff, %l6 = ffffabff
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000007557a3f6
!	%l2 = 96271b53, %l3 = 00000068, Mem[0000000010141408] = ff3c6439 be6e2552
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 96271b53 00000068
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 96271b5300000068, %f8  = ff000000 00000000
	ldda	[%i5+%o4]0x80,%f8 	! %f8  = 96271b53 00000068

p0_label_59:
!	Mem[0000000010101400] = 3476fa9aff3c6439, %f10 = d0e53964 20be967f
	ldd	[%i4+%g0],%f10		! %f10 = 3476fa9a ff3c6439
!	Mem[0000000030041410] = 39643cff, %f29 = 00000000
	lda	[%i1+%o5]0x89,%f29	! %f29 = 39643cff
!	Mem[0000000030001400] = e4e4fbae abffbfa6, %l0 = 0000a6ed, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000abffbfa6 00000000e4e4fbae
!	Mem[0000000010081408] = ffffbfa6, %l6 = 000000007557a3f6
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = a6bfffab, %f27 = 92070000
	lda	[%i0+%g0]0x81,%f27	! %f27 = a6bfffab
!	Mem[00000000100c1420] = 66f377b339646698, %f4  = a3eb023c d0e59568
	ldd	[%i3+0x020],%f4 	! %f4  = 66f377b3 39646698
!	Mem[00000000100c1428] = e5a900ff02d40523, %l7 = 0000000000000000
	ldx	[%i3+0x028],%l7		! %l7 = e5a900ff02d40523
!	Mem[0000000010181410] = a3eb023c 11e5ffff, %l4 = 6895ffff, %l5 = 47a79b2d
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000011e5ffff 00000000a3eb023c
!	Mem[0000000010001410] = 2a8233ff, %l1 = 00000000e4e4fbae
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 000000002a8233ff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = fffffe22, %l6 = ffffffffffffffff
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff

p0_label_60:
!	%f12 = abffbfa6 d0e53964, Mem[0000000030181408] = 000000ab 00000038
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = abffbfa6 d0e53964
!	%l7 = e5a900ff02d40523, imm = fffffffffffffe4b, %l7 = e5a900ff02d40523
	orn	%l7,-0x1b5,%l7		! %l7 = e5a900ff02d405b7
!	Mem[0000000010141410] = ff4cffff, %l0 = 00000000abffbfa6
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 00000000ff4cffff
!	%l7 = e5a900ff02d405b7, Mem[0000000010001400] = ff000000
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000b7
!	%l7 = e5a900ff02d405b7, Mem[0000000010081408] = be624f61a6bfffff
	stxa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = e5a900ff02d405b7
!	%l2 = 0000000096271b53, Mem[0000000030181410] = 39643cff
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 53643cff
!	%l0 = 00000000ff4cffff, Mem[0000000030181410] = 53643cff
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ffff3cff
!	%f0  = 3476fa9a a2accca2 ff3c6439 e5a900ff
!	%f4  = 66f377b3 39646698 ff3c6439 e5a90018
!	%f8  = 96271b53 00000068 3476fa9a ff3c6439
!	%f12 = abffbfa6 d0e53964 4a00b8ff ff000000
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[000000001008143f] = 47a79b2d, %l7 = e5a900ff02d405b7
	ldstub	[%i2+0x03f],%l7		! %l7 = 0000002d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = d1000000, %l1 = 000000002a8233ff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000d1000000

p0_label_61:
!	Mem[00000000211c0000] = fffffe22, %l5 = 00000000a3eb023c
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 6895e5d0ff3cffff, %f20 = a2ccaca2 9afa7634
	ldda	[%i6+%o5]0x89,%f20	! %f20 = 6895e5d0 ff3cffff
!	Mem[0000000030141410] = ffffffff, %l4 = 0000000011e5ffff
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000211c0000] = fffffe22, %l7 = 000000000000002d
	ldub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 39643cff, %l4 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001410] = ffffffa2 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ffffffa2 0000000000000000
!	Mem[0000000030001410] = 00000000a2ffffff, %l4 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 00000000a2ffffff
!	Mem[0000000010181410] = ffffe511, %l3 = 0000000000000068
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181410] = 11e5ffff, %f31 = b9674bfe
	lda	[%i6+%o5]0x88,%f31	! %f31 = 11e5ffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000d1000000, Mem[0000000030001408] = ff00000000007500
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000d1000000

p0_label_62:
!	%l1 = 00000000d1000000, Mem[00000000300c1408] = 0b807b72
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = d1000000
!	%f16 = e4e4fbae abffbfa6, %l7 = 0000000000000000
!	Mem[00000000100c1420] = 66f377b339646698
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_P ! Mem[00000000100c1420] = 66f377b339646698
!	%l6 = 00000000ffffffa2, Mem[0000000010181400] = 3476fa9aa2accc07, %asi = 80
	stxa	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000ffffffa2
!	Mem[0000000030141408] = 6895ffff, %l0 = 00000000ff4cffff
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 000000006895ffff
!	%l3 = 000000000000ffff, Mem[0000000010001408] = ff4c256a
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ffff
!	%l1 = 00000000d1000000, Mem[0000000030041400] = 9400000000000000
	stxa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000d1000000
!	Mem[0000000010081410] = 75000000, %l6 = 00000000ffffffa2
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000075000000ff
!	%f0  = 3476fa9a a2accca2 ff3c6439 e5a900ff
!	%f4  = 66f377b3 39646698 ff3c6439 e5a90018
!	%f8  = 96271b53 00000068 3476fa9a ff3c6439
!	%f12 = abffbfa6 d0e53964 4a00b8ff ff000000
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010001410] = b377f366, %l4 = 00000000a2ffffff
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 00000066000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 705f3d48aefbe4e4, %f12 = abffbfa6 d0e53964
	ldda	[%i3+%g0]0x89,%f12	! %f12 = 705f3d48 aefbe4e4

p0_label_63:
!	Mem[0000000010101410] = 66f377b3, %f14 = 4a00b8ff
	lda	[%i4+%o5]0x80,%f14	! %f14 = 66f377b3
!	Mem[0000000030101408] = a3eb023cd0e53964, %l5 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = a3eb023cd0e53964
!	Mem[0000000010181408] = 00000000 6895ffff, %l4 = 00000066, %l5 = d0e53964
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000 000000006895ffff
!	Mem[0000000010181438] = 2d9ba747 d22b2f95, %l0 = 6895ffff, %l1 = d1000000
	ldda	[%i6+0x038]%asi,%l0	! %l0 = 000000002d9ba747 00000000d22b2f95
!	Mem[0000000010041434] = a6cf7b9f, %l2 = 0000000096271b53
	lduh	[%i1+0x036],%l2		! %l2 = 0000000000007b9f
!	Mem[00000000100c1400] = ff00000000000000, %l2 = 0000000000007b9f
	ldx	[%i3+%g0],%l2		! %l2 = ff00000000000000
!	Mem[00000000300c1408] = e69ca2ca d1000000, %l0 = 2d9ba747, %l1 = d22b2f95
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000d1000000 00000000e69ca2ca
!	Mem[0000000010001410] = b377f3ff, %l2 = ff00000000000000
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = fffffffffffff3ff
!	Mem[0000000010081410] = ff000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 07ccaca2, %l3 = 000000000000ffff
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 0000000007ccaca2

p0_label_64:
!	%l5 = 000000006895ffff, Mem[0000000010081400] = ff000000
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ffff0000
!	Mem[0000000010141406] = 58fa70ba, %l6 = 0000000000000075
	ldstuba	[%i5+0x006]%asi,%l6	! %l6 = 00000070000000ff
!	%l6 = 0000000000000070, Mem[00000000300c1408] = 000000d1caa29ce6
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000070
!	%l4 = 0000000000000000, Mem[000000001018143c] = d22b2f95, %asi = 80
	stwa	%l4,[%i6+0x03c]%asi	! Mem[000000001018143c] = 00000000
!	%f14 = 66f377b3, Mem[0000000030081400] = 00750000
	sta	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = 66f377b3
!	%l4 = 0000000000000000, Mem[00000000300c1410] = a6ed2c1400000000
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%l6 = 0000000000000070, Mem[0000000010101408] = 39643cff
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 39643c70
!	%l4 = 0000000000000000, Mem[0000000030041410] = 39643cff
	stwa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%f26 = 2b4e9914 a6bfffab, Mem[0000000010041400] = eda60000 00000000
	stda	%f26,[%i1+%g0]0x80	! Mem[0000000010041400] = 2b4e9914 a6bfffab
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffffe22, %l3 = 0000000007ccaca2
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff

p0_label_65:
!	Mem[0000000030101408] = d0e53964, %l3 = 000000000000ffff
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000d0e53964
!	Mem[0000000010001408] = ff3c6439, %l5 = 000000006895ffff
	ldswa	[%i0+%o4]0x80,%l5	! %l5 = ffffffffff3c6439
!	Mem[00000000300c1400] = e4e4fbae, %l1 = 00000000e69ca2ca
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffe4e4fbae
!	Mem[0000000010041400] = 2b4e9914, %l3 = 00000000d0e53964
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 000000002b4e9914
!	Mem[00000000100c1410] = ffff9568, %f10 = 3476fa9a
	lda	[%i3+%o5]0x88,%f10	! %f10 = ffff9568
!	Mem[0000000010041400] = abffbfa614994e2b, %l5 = ffffffffff3c6439
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = abffbfa614994e2b
!	Mem[0000000030081408] = 00000000, %l3 = 000000002b4e9914
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041428] = 69387c07 5f1bc9da, %l2 = fffff3ff, %l3 = 00000000
	ldd	[%i1+0x028],%l2		! %l2 = 0000000069387c07 000000005f1bc9da
!	Mem[0000000030081410] = ffb0c6df89d20975, %f8  = 96271b53 00000068
	ldda	[%i2+%o5]0x89,%f8 	! %f8  = ffb0c6df 89d20975
!	Starting 10 instruction Store Burst
!	%f8  = ffb0c6df, Mem[0000000010081400] = ffff0000
	sta	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ffb0c6df

p0_label_66:
!	%l2 = 0000000069387c07, Mem[0000000010081438] = 952f2bd2
	stw	%l2,[%i2+0x038]		! Mem[0000000010081438] = 69387c07
!	Mem[0000000010181418] = 1800a9e539643cff, %l0 = 00000000d1000000, %l1 = ffffffffe4e4fbae
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 1800a9e539643cff
!	%f16 = e4e4fbae abffbfa6, Mem[0000000030181410] = ffff3cff d0e59568
	stda	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = e4e4fbae abffbfa6
!	Mem[0000000010181408] = 00000000, %l7 = 00000000ff000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = 1800a9e539643cff, Mem[0000000030001410] = 00000000a2ffffff
	stxa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 1800a9e539643cff
!	Mem[0000000030041400] = 000000d1, %l3 = 000000005f1bc9da
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000069387c07, Mem[0000000010081404] = 00007500
	stw	%l2,[%i2+0x004]		! Mem[0000000010081404] = 69387c07
!	Mem[00000000100c1400] = ff000000, %l5 = abffbfa614994e2b
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%f16 = e4e4fbae, Mem[0000000010141408] = 531b2796
	sta	%f16,[%i5+%o4]0x88	! Mem[0000000010141408] = e4e4fbae
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 89ff167a, %l2 = 0000000069387c07
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffff89

p0_label_67:
!	Mem[0000000010041408] = 38000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = b705d402, %l5 = 00000000000000ff
	lduba	[%i2+0x00b]%asi,%l5	! %l5 = 0000000000000002
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000d1000000
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001434] = d0e53964, %l1 = 1800a9e539643cff
	lduha	[%i0+0x034]%asi,%l1	! %l1 = 000000000000d0e5
!	Mem[0000000021800080] = d128571f, %l0 = 00000000000000ff
	lduh	[%o3+0x080],%l0		! %l0 = 000000000000d128
!	Mem[0000000010081410] = ff000000d0e59568, %f0  = 3476fa9a a2accca2
	ldda	[%i2+%o5]0x80,%f0 	! %f0  = ff000000 d0e59568
!	Mem[0000000010041410] = ffff0000, %l1 = 000000000000d0e5
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000010141410] = a6bfffab, %l2 = ffffffffffffff89
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000a6
!	Mem[0000000030181410] = aefbe4e4, %l5 = 0000000000000002
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 000000000000e4e4
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = d0e53964, %l0 = 000000000000d128
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000d0e53964

p0_label_68:
!	Mem[0000000030181400] = ffaccc07, %l1 = ffffffffffff0000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000010141400] = 000000d1
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff00d1
!	Mem[00000000300c1400] = aefbe4e4, %l1 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000aefbe4e4
!	%l7 = 0000000000000000, Mem[0000000030141400] = a2accca2
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l6 = 0000000000000070, Mem[0000000010001418] = ff3c6439
	stw	%l6,[%i0+0x018]		! Mem[0000000010001418] = 00000070
!	%l7 = 0000000000000000, Mem[000000001014141a] = 0b807b72, %asi = 80
	stha	%l7,[%i5+0x01a]%asi	! Mem[0000000010141418] = 0b800000
!	%l6 = 0000000000000070, Mem[0000000010101410] = b377f366
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = b3770070
!	%f2  = ff3c6439, Mem[0000000030041400] = ff0000d1
	sta	%f2 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff3c6439
!	Mem[0000000010141410] = abffbfa6, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000a6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 9afa7634, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000007634

p0_label_69:
!	Mem[0000000030101400] = 11796f74, %l2 = 00000000000000a6
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000006f74
!	Mem[0000000030181410] = a6bfffabaefbe4e4, %f12 = 705f3d48 aefbe4e4
	ldda	[%i6+%o5]0x89,%f12	! %f12 = a6bfffab aefbe4e4
!	Mem[0000000010141410] = ffbfffabffb8004a, %f16 = e4e4fbae abffbfa6
	ldda	[%i5+%o5]0x80,%f16	! %f16 = ffbfffab ffb8004a
!	Mem[0000000030081408] = 00000000 000000d5, %l6 = 00000070, %l7 = 000000a6
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000000000d5
!	Mem[0000000010001408] = ff3c6439, %l5 = 000000000000e4e4
	ldswa	[%i0+%o4]0x80,%l5	! %l5 = ffffffffff3c6439
!	Mem[0000000010041438] = 170fa9bb, %l5 = ffffffffff3c6439
	ldsba	[%i1+0x039]%asi,%l5	! %l5 = 000000000000000f
!	Mem[00000000100c1430] = f2ffffffd0e53964, %l6 = 0000000000000000
	ldxa	[%i3+0x030]%asi,%l6	! %l6 = f2ffffffd0e53964
!	Mem[0000000010081430] = f2ffffff a3ebd652, %l0 = d0e53964, %l1 = aefbe4e4
	ldd	[%i2+0x030],%l0		! %l0 = 00000000f2ffffff 00000000a3ebd652
!	Mem[00000000100c1408] = 39643cff, %l2 = 0000000000006f74
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000039
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000020800000] = ff25160c
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 0000160c

p0_label_70:
!	%l2 = 0000000000000039, Mem[0000000010101408] = ff00a9e539643c70
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000039
!	%f21 = ff3cffff, Mem[0000000010001420] = 96271b53
	st	%f21,[%i0+0x020]	! Mem[0000000010001420] = ff3cffff
!	Mem[0000000010041410] = ffff0000, %l2 = 0000000000000039
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l3 = 0000000000007634, Mem[0000000010041400] = 2b4e9914
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 344e9914
!	%l6 = f2ffffffd0e53964, Mem[0000000020800001] = 0000160c
	stb	%l6,[%o1+0x001]		! Mem[0000000020800000] = 0064160c
!	Mem[0000000010141408] = e4e4fbae, %l3 = 0000000000007634
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000e4e4fbae
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000000000f, Mem[0000000020800000] = 0064160c, %asi = 80
	stba	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 0f64160c
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 23b5d7d7, %l1 = 00000000a3ebd652
	lduha	[%o3+0x040]%asi,%l1	! %l1 = 00000000000023b5

p0_label_71:
!	Mem[0000000010141410] = 4a00b8ff abffbfff, %l2 = 00000000, %l3 = e4e4fbae
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000abffbfff 000000004a00b8ff
!	Mem[0000000030101400] = 142ceda611796f74, %l1 = 00000000000023b5
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 142ceda611796f74
!	Mem[0000000010181400] = 00000000ffffffa2, %l0 = 00000000f2ffffff
	ldxa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ffffffa2
!	Mem[00000000100c1408] = 39643cff, %l2 = 00000000abffbfff
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 0000000000003964
!	Mem[0000000030101410] = be624f61 b184261e, %l2 = 00003964, %l3 = 4a00b8ff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000be624f61 00000000b184261e
!	Mem[0000000030081408] = 00000000, %l2 = 00000000be624f61
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ff3c6439, %l6 = f2ffffffd0e53964
	ldswa	[%i0+%o5]0x81,%l6	! %l6 = ffffffffff3c6439
!	Mem[0000000010001410] = 98666439 b377f3ff, %l0 = ffffffa2, %l1 = 11796f74
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000b377f3ff 0000000098666439
!	Mem[0000000030141408] = ff4cffff, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = ff3c6439 e5a900ff, %l2 = 0000000000000000
!	Mem[00000000100c1408] = 39643cff68000000
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_PL ! Mem[00000000100c1408] = 39643cff68000000

p0_label_72:
!	%l0 = b377f3ff, %l1 = 98666439, Mem[0000000030141410] = ffffffff 00000000
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = b377f3ff 98666439
!	Mem[0000000010141417] = ffb8004a, %l1 = 0000000098666439
	ldstub	[%i5+0x017],%l1		! %l1 = 0000004a000000ff
!	Mem[0000000010081400] = ffb0c6df, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ffb0c6df
!	%l4 = ffffffffffffffff, Mem[0000000030041408] = 6895ffff
	stha	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000030101410] = be624f61, %l1 = 000000000000004a
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000be624f61
!	Mem[0000000010141424] = 6599b923, %l3 = b184261e, %l3 = b184261e
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000006599b923
!	Mem[0000000010101408] = 39000000, %l4 = ffffffff, %l6 = ff3c6439
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000039000000
!	Mem[00000000201c0001] = 89ff167a, %l4 = ffffffffffffffff
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	%l3 = 000000006599b923, Mem[0000000010181422] = 12970024, %asi = 80
	stha	%l3,[%i6+0x022]%asi	! Mem[0000000010181420] = 1297b923
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000 00000000, %l2 = ffb0c6df, %l3 = 6599b923
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_73:
!	%f21 = ff3cffff, Mem[0000000030101400] = 11796f74
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = ff3cffff
!	Mem[0000000030141408] = ff4cffff, %l1 = 00000000be624f61
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000ff4c
!	Mem[0000000030081400] = 66f377b3, %l0 = 00000000b377f3ff
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 00000000000077b3
!	Mem[0000000030141400] = 00000000, %l6 = 0000000039000000
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141428] = 9e185a4a, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x028]%asi,%l4	! %l4 = 000000009e185a4a
!	Mem[0000000010141408] = 34760000, %l5 = 000000000000000f
	ldswa	[%i5+0x008]%asi,%l5	! %l5 = 0000000034760000
!	Mem[0000000030181400] = ffaccc07, %l0 = 00000000000077b3
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101400] = ff3cffff, %l5 = 0000000034760000
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000ff3cffff
!	Mem[00000000100c1400] = ff000000, %l7 = 00000000000000d5
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l4 = 9e185a4a, %l5 = ff3cffff, Mem[0000000030081408] = 00000000 d5000000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 9e185a4a ff3cffff

p0_label_74:
!	Mem[00000000100c1410] = ffff9568, %l7 = 000000000000ff00
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 00000000ffff9568
!	%l5 = 00000000ff3cffff, Mem[0000000030001400] = abffbfa6
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = ff3cffff
!	%l7 = 00000000ffff9568, Mem[0000000010001410] = fff377b339646698
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ffff9568
!	%l3 = 0000000000000000, Mem[0000000010101410] = 700077b3
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 000077b3
!	%l1 = 000000000000ff4c, Mem[0000000030041408] = ffffffff
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = ff4cffff
!	%l1 = 000000000000ff4c, Mem[0000000010001414] = ffff9568, %asi = 80
	stwa	%l1,[%i0+0x014]%asi	! Mem[0000000010001414] = 0000ff4c
!	Mem[0000000010141410] = abffbfff, %l4 = 000000009e185a4a
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000abffbfff
!	%l3 = 0000000000000000, Mem[0000000010041408] = ff02eba338000000
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010101408] = 00000039, %l7 = 00000000ffff9568
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000039000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000000069387c07, %f10 = ffff9568 ff3c6439
	ldda	[%i2+%g0]0x80,%f10	! %f10 = 00000000 69387c07

p0_label_75:
!	Mem[0000000030101410] = 0000004a b184261e, %l6 = 00000000, %l7 = 00000039
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 000000000000004a 00000000b184261e
!	Mem[0000000030141400] = 00000000, %l6 = 000000000000004a
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 3476fa9aa2accca2, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 3476fa9aa2accca2
!	Mem[0000000030181410] = a6bfffabaefbe4e4, %l4 = 00000000abffbfff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = a6bfffabaefbe4e4
!	Mem[00000000300c1410] = 00000000 00000000, %l4 = aefbe4e4, %l5 = ff3cffff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010041400] = 14994e34, %l4 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000004e34
!	Mem[0000000021800180] = 671e028c, %l6 = 0000000000000000
	ldsb	[%o3+0x181],%l6		! %l6 = 000000000000001e
!	Mem[0000000010041408] = 00000000, %l3 = 3476fa9aa2accca2
	ldsba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = ff3c6439 e5a90018, Mem[0000000010001428] = 3476fa9a ff3c6439
	std	%f18,[%i0+0x028]	! Mem[0000000010001428] = ff3c6439 e5a90018

p0_label_76:
!	%f30 = 02cac046, Mem[0000000010141400] = d100ff00
	sta	%f30,[%i5+%g0]0x88	! Mem[0000000010141400] = 02cac046
!	%l4 = 0000000000004e34, Mem[000000001000142c] = e5a90018
	stb	%l4,[%i0+0x02c]		! Mem[000000001000142c] = 34a90018
!	Mem[00000000100c1408] = ff3c6439, %l4 = 0000000000004e34
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000039000000ff
!	Mem[0000000010001430] = abffbfa6d0e53964, %l3 = 0000000000000000, %l4 = 0000000000000039
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = abffbfa6d0e53964
!	Mem[00000000211c0001] = fffffe22, %l7 = 00000000b184261e
	ldstub	[%o2+0x001],%l7		! %l7 = 000000ff000000ff
!	Mem[00000000201c0001] = 89ff167a, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%f22 = ff3c6439, Mem[0000000010001400] = 9afa7634
	sta	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = ff3c6439
!	%f26 = 2b4e9914, Mem[0000000010081414] = d0e59568
	st	%f26,[%i2+0x014]	! Mem[0000000010081414] = 2b4e9914
!	%l6 = 0000001e, %l7 = 000000ff, Mem[0000000030041400] = ff3c6439 00000000
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000001e 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 39643cff, %l7 = 00000000000000ff
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000039643cff

p0_label_77:
!	Mem[0000000010001410] = 00000000, %l6 = 000000000000001e
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %f8  = ffb0c6df
	lda	[%i0+%o5]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000010141408] = 00007634, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000007634
!	Mem[0000000030181410] = aefbe4e4, %l1 = 000000000000ff4c
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000e4e4
!	Mem[00000000100c1410] = 00ff0000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000ff0000
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ff3c6439e5a900ff, %l1 = 000000000000e4e4
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = ff3c6439e5a900ff
!	Mem[0000000030181408] = 0000d128, %f20 = 6895e5d0
	lda	[%i6+%o4]0x89,%f20	! %f20 = 0000d128
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = ff000000 d0e59568 ff3c6439 e5a900ff
!	%f4  = 66f377b3 39646698 ff3c6439 e5a90018
!	%f8  = 00000000 89d20975 00000000 69387c07
!	%f12 = a6bfffab aefbe4e4 66f377b3 ff000000
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400

p0_label_78:
!	Mem[0000000010001400] = ff3c6439, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 00000000ff3c6439
!	%l3 = 00000000ff3c6439, Mem[0000000010181400] = 00000000ffffffa2
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ff3c6439
!	%f22 = ff3c6439, Mem[0000000030141400] = 00000000
	sta	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = ff3c6439
!	Mem[0000000010001428] = ff3c643934a90018, %l2 = 0000000000007634, %l0 = 00000000000000ff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = ff3c643934a90018
!	%l3 = 00000000ff3c6439, Mem[0000000030101400] = ff3cffff
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ff3c6439
!	%l2 = 0000000000007634, Mem[00000000100c1400] = 000000ff
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000034
!	%f18 = ff3c6439 e5a90018, %l4 = abffbfa6d0e53964
!	Mem[00000000100c1418] = 9829f53a4f616439
	add	%i3,0x018,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_P ! Mem[00000000100c1418] = 982964394f616439
!	%l6 = 00000000000000ff, Mem[0000000010081410] = ff000000
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030041410] = 39646698, %f26 = 2b4e9914
	lda	[%i1+%o5]0x89,%f26	! %f26 = 39646698

p0_label_79:
!	Mem[0000000030101408] = 6439e5d0, %l4 = abffbfa6d0e53964
	lduba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000064
!	Mem[00000000211c0000] = fffffe22, %l2 = 0000000000007634
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 02d405b7, %l1 = ff3c6439e5a900ff
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000b7
!	Mem[00000000100c1408] = ff643cff, %l7 = 0000000039643cff
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041420] = 124056572900f600, %l3 = 00000000ff3c6439
	ldxa	[%i1+0x020]%asi,%l3	! %l3 = 124056572900f600
!	Mem[0000000010101434] = d0e53964, %l0 = ff3c643934a90018
	ldsha	[%i4+0x034]%asi,%l0	! %l0 = ffffffffffffd0e5
!	Mem[0000000010101410] = b3770000, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = fffffe22, %l0 = ffffffffffffd0e5
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = 89ff167a, %l3 = 124056572900f600
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffff00ff, %l2 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 00000000ffff00ff

p0_label_80:
!	Mem[0000000020800000] = 0f64160c, %l3 = ffffffffffffffff
	ldstub	[%o1+%g0],%l3		! %l3 = 0000000f000000ff
!	%l4 = 0000000000000064, Mem[0000000010081410] = 000000ff2b4e9914
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000064
!	Mem[00000000100c1400] = 34000000, %l1 = 00000000000000b7
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000034000000ff
!	Mem[0000000010181408] = ff000000, %l7 = ffffffffffffffff
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	%f6  = ff3c6439, Mem[0000000030041410] = 98666439
	sta	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ff3c6439
!	%f28 = 00750000 39643cff, Mem[0000000010041410] = ff000000 9afa7634
	stda	%f28,[%i1+%o5]0x80	! Mem[0000000010041410] = 00750000 39643cff
!	%l1 = 0000000000000034, Mem[0000000010141408] = 6800000000007634
	stxa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000034
!	Mem[0000000030041400] = 6895e5d0, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 000000006895e5d0
!	%l0 = ffffffffffffffff, Mem[00000000100c1400] = 000000ff
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 39643cff00000000, %f18 = ff3c6439 e5a90018
	ldda	[%i6+%g0]0x88,%f18	! %f18 = 39643cff 00000000

p0_label_81:
!	Mem[0000000010101408] = 000000ff, %l4 = 0000000000000064
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 1e2684b14a000000, %f2  = ff3c6439 e5a900ff
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = 1e2684b1 4a000000
!	Mem[0000000010001400] = 000000ff, %f17 = ffb8004a
	lda	[%i0+%g0]0x88,%f17	! %f17 = 000000ff
!	Mem[0000000030081410] = 7509d289 dfc6b0ff, %l6 = 6895e5d0, %l7 = ffffff00
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 000000007509d289 00000000dfc6b0ff
!	Mem[0000000010101400] = 3476fa9a, %l2 = 00000000ffff00ff
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000034
!	Mem[0000000010181410] = ffffe511 3c02eba3, %l4 = 00000000, %l5 = 00ff0000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffffe511 000000003c02eba3
!	Mem[0000000010181418] = 1800a9e5, %l1 = 0000000000000034
	lduba	[%i6+0x018]%asi,%l1	! %l1 = 0000000000000018
!	Mem[0000000010041410] = 00750000, %l0 = ffffffffffffffff
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000075
!	Starting 10 instruction Store Burst
!	%l2 = 00000034, %l3 = 0000000f, Mem[0000000010081400] = ff000000 69387c07
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000034 0000000f

p0_label_82:
!	%l0 = 00000075, %l1 = 00000018, Mem[0000000010041410] = 00750000 39643cff
	stda	%l0,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000075 00000018
!	%l5 = 000000003c02eba3, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000a3
!	Mem[0000000010181410] = ffffe511, %l1 = 0000000000000018
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ffffe511
!	Mem[0000000030081410] = 89d20975, %l7 = 00000000dfc6b0ff
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 0000000089d20975
!	%l4 = 00000000ffffe511, Mem[0000000030001410] = ff3c6439e5a90018
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ffffe511
!	Mem[00000000100c1400] = ffffffff, %l4 = 00000000ffffe511
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 3c02eba3, Mem[0000000010141400] = 46c0ca02 58faffba
	stda	%l4,[%i5+0x000]%asi	! Mem[0000000010141400] = 000000ff 3c02eba3
!	%f10 = 00000000 69387c07, %f10 = 00000000 69387c07
	fxtod	%f10,%f10		! %f10 = 41da4e1f 01c00000
!	%l3 = 000000000000000f, Mem[0000000010081434] = a3ebd652, %asi = 80
	stwa	%l3,[%i2+0x034]%asi	! Mem[0000000010081434] = 0000000f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = a3000000, %l1 = 00000000ffffe511
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 00000000a3000000

p0_label_83:
!	Mem[0000000010081410] = 00000000 00000064, %l4 = 000000ff, %l5 = 3c02eba3
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000064
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000064
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %f19 = 00000000
	lda	[%i5+%g0]0x88,%f19	! %f19 = ff000000
!	Mem[0000000020800040] = ff0055e8, %l6 = 000000007509d289
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000010101400] = 3476fa9aa2accca2, %f6  = ff3c6439 e5a90018
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = 3476fa9a a2accca2
!	Mem[0000000010181400] = 000000a3, %l1 = 00000000a3000000
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000a3
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 000000ff, %l0 = 0000000000000075
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1428] = e5a900ff, %l4 = 0000000000000000
	ldub	[%i3+0x028],%l4		! %l4 = 00000000000000e5
!	Starting 10 instruction Store Burst
!	%f0  = ff000000, Mem[0000000030041400] = 00000000
	sta	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000

p0_label_84:
!	%l5 = 00000000000000ff, Mem[00000000100c1410] = 0000ff00
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	Mem[0000000030181400] = 07ccacff, %l2 = 0000000000000034
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 0000000007ccacff
!	Mem[0000000010181418] = 1800a9e539643cff, %l0 = ffffffffffffffff, %l4 = 00000000000000e5
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 1800a9e539643cff
!	%f6  = 3476fa9a a2accca2, Mem[00000000300c1400] = ff000000 483d5f70
	stda	%f6 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3476fa9a a2accca2
!	Mem[0000000030041408] = e5a900ff, %l6 = ffffffffffffff00
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stha	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ff0000
!	%l5 = 00000000000000ff, Mem[0000000030081400] = 66f377b3
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 66f377ff
!	Mem[0000000030001400] = ffff3cff, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ffff3cff
!	Mem[00000000218001c0] = 63ffa59a, %l1 = 00000000000000a3
	ldstuba	[%o3+0x1c0]%asi,%l1	! %l1 = 00000063000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030001400] = 000000ff aefbe4e4 00000000 d1000000
!	Mem[0000000030001410] = 00000000 ffffe511 94b29ddc 39643cff
!	Mem[0000000030001420] = 11013de0 f9b9886a 00000792 14994e2b
!	Mem[0000000030001430] = 000000ff ff000000 fe4b67b9 46c0ca02
	ldda	[%i0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400

p0_label_85:
!	Mem[0000000030081408] = 9e185a4a, %l0 = ffffffffffffffff
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 000000000000004a
!	Mem[0000000010141400] = 000000ff 3c02eba3 34000000 00000000
!	Mem[0000000010141410] = 4a5a189e ffb800ff 0b800000 e69ca2ca
!	Mem[0000000010141420] = a6bfff24 6599b923 000000ff 0df0cc6d
!	Mem[0000000010141430] = 7557a3f6 5ccfe01b a7156c04 450fd3fa
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000030081410] = ffb0c6df, %l6 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffb0c6df
!	Mem[0000000010081400] = 00000034 0000000f, %l6 = ffb0c6df, %l7 = 89d20975
	ldda	[%i2+0x000]%asi,%l6	! %l6 = 0000000000000034 000000000000000f
!	Mem[000000001008142c] = 20be967f, %l3 = 000000000000000f
	lduwa	[%i2+0x02c]%asi,%l3	! %l3 = 0000000020be967f
!	Mem[0000000010141408] = 3400000000000000, %f30 = 02cac046 b9674bfe
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 34000000 00000000
!	Mem[00000000100c1400] = ffffffff, %l4 = 1800a9e539643cff
	lduwa	[%i3+0x000]%asi,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030141408] = ff4cffff, %l1 = 0000000000000063
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffff4c
!	Mem[0000000030081410] = dfc6b0ff, %l5 = 00000000ffff3cff
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = ffffffffdfc6b0ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 000077b3, %l6 = 0000000000000034
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_86:
!	%l2 = 0000000007ccacff, Mem[0000000030081408] = 4a5a189effff3cff
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000007ccacff
!	Mem[0000000010101408] = 000000ff, %l7 = 000000000000000f
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041400] = 14994e34, %l2 = 0000000007ccacff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000014994e34
!	%f24 = 6a88b9f9 e03d0111, Mem[0000000010081410] = 00000000 64000000
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = 6a88b9f9 e03d0111
!	%l2 = 0000000014994e34, Mem[00000000100c1400] = 00000000ffffffff
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000014994e34
!	%l7 = 00000000000000ff, Mem[0000000010181414] = 3c02eba3, %asi = 80
	stha	%l7,[%i6+0x014]%asi	! Mem[0000000010181414] = 00ffeba3
!	Mem[000000001014141c] = e69ca2ca, %l4 = 00000000ffffffff
	ldstub	[%i5+0x01c],%l4		! %l4 = 000000e6000000ff
!	%f23 = dc9db294, Mem[00000000100c1410] = ff000000
	sta	%f23,[%i3+%o5]0x80	! Mem[00000000100c1410] = dc9db294
	membar	#Sync			! Added by membar checker (16)
!	%l2 = 0000000014994e34, Mem[0000000030001410] = 00000000ffffe511
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000014994e34
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 14994e34, %l7 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000034

p0_label_87:
!	Mem[00000000100c1410] = 94b29ddc, %f23 = dc9db294
	lda	[%i3+%o5]0x88,%f23	! %f23 = 94b29ddc
!	Mem[0000000030181408] = abffbfa6 0000d128, %l6 = 00000000, %l7 = 00000034
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 000000000000d128 00000000abffbfa6
!	Mem[0000000010001400] = ff000000 a2accca2 ff3c6439 e5a900ff
!	Mem[0000000010001410] = 00ff0000 0000ff4c 00000070 e5a90018
!	Mem[0000000010001420] = ff3cffff 00000068 ff3c6439 34a90018
!	Mem[0000000010001430] = abffbfa6 d0e53964 4a00b8ff ff000000
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030001408] = 000000d100000000, %f4  = 4a5a189e ffb800ff
	ldda	[%i0+%o4]0x89,%f4 	! %f4  = 000000d1 00000000
!	Mem[00000000300c1408] = 00000000, %f9  = 6599b923
	lda	[%i3+%o4]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000010101400] = 3476fa9aa2accca2, %l2 = 0000000014994e34
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = 3476fa9aa2accca2
!	Mem[0000000030181400] = 00000034, %f3  = 00000000
	lda	[%i6+%g0]0x89,%f3 	! %f3 = 00000034
!	Mem[0000000010141400] = 000000ff, %l0 = 000000000000004a
	lduba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 142ceda6ff3c6439, %f4  = 000000d1 00000000
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 142ceda6 ff3c6439
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 94b29ddc, %l5 = ffffffffdfc6b0ff
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000094b29ddc

p0_label_88:
!	%l3 = 0000000020be967f, Mem[000000001018141b] = 1800a9e5
	stb	%l3,[%i6+0x01b]		! Mem[0000000010181418] = 1800a97f
!	%l7 = 00000000abffbfa6, Mem[0000000010181408] = ffff9568000000ff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000abffbfa6
!	%l4 = 00000000000000e6, Mem[0000000030081410] = ffb0c6dfdfc6b0ff
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000e6
!	%f9  = 00000000, Mem[00000000100c1400] = 344e9914
	sta	%f9 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l3 = 0000000020be967f, Mem[00000000100c1408] = ff643cff
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 20be967f
!	%l0 = 00000000, %l1 = ffffff4c, Mem[0000000010081410] = e03d0111 6a88b9f9
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 ffffff4c
!	%l2 = 3476fa9aa2accca2, Mem[0000000010141410] = 4a5a189e
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = cca2189e
!	%f10 = 000000ff, Mem[0000000010041410] = 75000000
	sta	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[0000000030141400] = ff3c6439, %f5  = ff3c6439
	lda	[%i5+%g0]0x81,%f5 	! %f5 = ff3c6439
!	Starting 10 instruction Load Burst
!	%f12 = 7557a3f6, %f4  = 142ceda6 ff3c6439
	fstod	%f12,%f4 		! %f4  = 46aaf47e c0000000

p0_label_89:
!	Mem[0000000010081434] = 0000000f, %l0 = 0000000000000000
	ldsh	[%i2+0x034],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l3 = 0000000020be967f
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000100c1400] = 00000000, %l1 = ffffffffffffff4c
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ffffff4c00000000, %f0  = 000000ff 3c02eba3
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = ffffff4c 00000000
!	Mem[000000001008142c] = 20be967f, %l0 = 0000000000000000
	ldsw	[%i2+0x02c],%l0		! %l0 = 0000000020be967f
!	Mem[00000000211c0000] = fffffe22, %l5 = 0000000094b29ddc
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = 89ff167a, %l2 = 3476fa9aa2accca2
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001000143c] = ff000000, %l6 = 000000000000d128
	ldsha	[%i0+0x03c]%asi,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000021800100] = ffff933f, %l5 = ffffffffffffffff
	ldsh	[%o3+0x100],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000211c0000] = fffffe22
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 0000fe22

p0_label_90:
	membar	#Sync			! Added by membar checker (17)
!	%l2 = 00000000000000ff, Mem[0000000010001428] = ff3c643934a90018
	stx	%l2,[%i0+0x028]		! Mem[0000000010001428] = 00000000000000ff
!	%f0  = ffffff4c, Mem[0000000030181408] = 0000d128
	sta	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff4c
!	%f28 = abffbfa6 d0e53964, Mem[0000000010141418] = 0b800000 ff9ca2ca
	stda	%f28,[%i5+0x018]%asi	! Mem[0000000010141418] = abffbfa6 d0e53964
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000e6, %l5 = ffffffff, Mem[0000000010141400] = ff000000 a3eb023c
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000e6 ffffffff
!	Mem[0000000030041408] = ff00a9e5, %l0 = 0000000020be967f
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff00a9e5
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000abffbfa6
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 0000ff00, Mem[0000000010041410] = ff000000 00000018
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff 0000ff00
!	%l1 = 0000000000000000, Mem[0000000030041408] = 7f96be20
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 7f96be00
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000 00000000, %l2 = 000000ff, %l3 = 0000ff00
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_91:
!	Mem[0000000030001408] = 00000000d1000000, %f24 = ff3cffff 00000068
	ldda	[%i0+%o4]0x81,%f24	! %f24 = 00000000 d1000000
!	%f4  = 46aaf47e, Mem[0000000010041418] = 3f8f4308
	st	%f4 ,[%i1+0x018]	! Mem[0000000010041418] = 46aaf47e
!	Mem[0000000010081400] = 34000000, %l4 = 00000000000000e6
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030181410] = aefbe4e4 a6bfffab
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 ffffffff
!	Mem[00000000100c1408] = 20be967f, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000020
!	Mem[0000000030141408] = 6a254c3e ffff4cff, %l2 = 00000000, %l3 = 00000020
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 00000000ffff4cff 000000006a254c3e
!	Mem[0000000030101410] = 0000004ab184261e, %l3 = 000000006a254c3e
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = 0000004ab184261e
!	%f20 = 00ff0000 0000ff4c, Mem[0000000010101408] = 000000ff 00000000
	stda	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 00ff0000 0000ff4c
!	Mem[0000000010141408] = 3400000000000000, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = 3400000000000000
!	Starting 10 instruction Store Burst
!	%f15 = 450fd3fa, Mem[0000000030141410] = b377f3ff
	sta	%f15,[%i5+%o5]0x81	! Mem[0000000030141410] = 450fd3fa

p0_label_92:
!	%l6 = ffffffffffffff00, Mem[0000000010041410] = 000000ff
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ff0000ff
!	Mem[0000000010081432] = f2ffffff, %l0 = 00000000ff00a9e5
	ldstuba	[%i2+0x032]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = ffffffffffffff00, Mem[0000000010001410] = 0000ff00
	stha	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ff00
!	%f28 = abffbfa6, Mem[0000000010101400] = 9afa7634
	sta	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = abffbfa6
!	Mem[0000000030081408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f9  = 00000000, Mem[0000000010041400] = ffaccc07
	sta	%f9 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f22 = 00000070 e5a90018, Mem[0000000010141400] = 000000e6 ffffffff
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000070 e5a90018
!	%f26 = ff3c6439 34a90018, %l1 = 0000000000000000
!	Mem[0000000030101418] = 2b4e9914d0e59568
	add	%i4,0x018,%g1
	stda	%f26,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101418] = 2b4e9914d0e59568
!	Mem[0000000010041408] = 00000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000a3, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000a3

p0_label_93:
!	Mem[0000000010141400] = 00000070e5a90018, %l1 = 00000000000000a3
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 00000070e5a90018
!	Mem[0000000010181408] = abffbfa6, %l6 = ffffffffffffff00
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 000000000000bfa6
!	Mem[0000000010181408] = 00000000abffbfa6, %l4 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 00000000abffbfa6
!	Mem[0000000030101400] = 39643cffa6ed2c14, %l5 = ffffffffffffffff
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 39643cffa6ed2c14
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = ff000000 a2accca2 ff3c6439 e5a900ff
!	Mem[0000000010001410] = 00ff0000 0000ff4c 00000070 e5a90018
!	Mem[0000000010001420] = ff3cffff 00000068 00000000 000000ff
!	Mem[0000000010001430] = abffbfa6 d0e53964 4a00b8ff ff000000
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000030141408] = ffff4cff, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 0000000000004cff
!	Mem[00000000100c1400] = 0000000000000000, %l3 = 0000004ab184261e
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = a3000000 ff3c6439, %l0 = 00004cff, %l1 = e5a90018
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000a3000000 00000000ff3c6439
!	Mem[0000000010081408] = b705d402 ff00a9e5, %l6 = 0000bfa6, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000b705d402 00000000ff00a9e5
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1439] = 00000000, %l7 = 00000000ff00a9e5
	ldstuba	[%i3+0x039]%asi,%l7	! %l7 = 00000000000000ff

p0_label_94:
!	%l6 = 00000000b705d402, Mem[00000000100c142b] = e5a900ff, %asi = 80
	stba	%l6,[%i3+0x02b]%asi	! Mem[00000000100c1428] = e5a90002
!	Mem[0000000010041408] = ff000000, %l2 = 00000000ffff4cff
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[0000000030101410] = 1e2684b14a000000
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[0000000010141434] = 5ccfe01b, %asi = 80
	stwa	%l2,[%i5+0x034]%asi	! Mem[0000000010141434] = ff000000
	membar	#Sync			! Added by membar checker (19)
!	%l6 = 00000000b705d402, Mem[0000000010001410] = 00ff0000
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = d4020000
!	%f16 = ff000000, Mem[0000000010081408] = b705d402
	sta	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	Mem[0000000010001408] = ff3c6439, %l1 = 00000000ff3c6439
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00000000abffbfa6, Mem[0000000010041410] = ff0000ff
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = abffbfa6
!	Mem[0000000030081400] = 66f377ff, %l2 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = e5a90018, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000018

p0_label_95:
!	Mem[0000000010141400] = 1800a9e5, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000001800
!	Mem[0000000010041400] = abffbfa600000000, %l7 = 0000000000000018
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = abffbfa600000000
!	Mem[0000000030041400] = ff000000, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = a6bfffaba2accca2, %f18 = ff3c6439 e5a900ff
	ldda	[%i4+%g0]0x80,%f18	! %f18 = a6bfffab a2accca2
!	Mem[0000000010001410] = 000002d4, %l0 = 00000000a3000000
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffd4
!	Mem[0000000010101424] = 00000068, %f13 = d0e53964
	ld	[%i4+0x024],%f13	! %f13 = 00000068
!	Mem[0000000030101400] = 39643cffa6ed2c14, %l5 = 39643cffa6ed2c14
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 39643cffa6ed2c14
!	Mem[00000000201c0000] = 89ff167a, %l3 = 0000000000001800
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000089ff
!	Mem[0000000030181410] = 00000000ffffffff, %l5 = 39643cffa6ed2c14
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000010081400] = 000000340000000f
	stx	%l5,[%i2+%g0]		! Mem[0000000010081400] = 00000000ffffffff

p0_label_96:
!	%f4  = 00ff0000 0000ff4c, %l4 = 00000000abffbfa6
!	Mem[0000000030141410] = 450fd3fa98666439
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141410] = 00ff000098666439
!	%l0 = ffffffd4, %l1 = 00000000, Mem[0000000030181410] = 00000000 ffffffff
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffd4 00000000
!	%f14 = 4a00b8ff ff000000, Mem[0000000010001410] = d4020000 0000ff4c
	stda	%f14,[%i0+0x010]%asi	! Mem[0000000010001410] = 4a00b8ff ff000000
!	Mem[0000000010101410] = ff0077b3, %l6 = 00000000b705d402
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff0077b3
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f2  = ff3c6439 e5a900ff, Mem[0000000010181408] = abffbfa6 00000000
	stda	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ff3c6439 e5a900ff
!	%l7 = abffbfa600000000, Mem[00000000100c1408] = 20be967f68000000
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = abffbfa600000000
!	Mem[0000000030081408] = ff000000, %l0 = ffffffffffffffd4
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%f16 = ff000000, Mem[0000000030041408] = 00be967f
	sta	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 39643cff, %l0 = 00000000ff000000
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000039

p0_label_97:
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000089ff
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = abffbfa6, %l4 = 00000000abffbfa6
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 00000000abffbfa6
!	Mem[0000000010001400] = a2ccaca2000000ff, %l0 = 0000000000000039
	ldxa	[%i0+%g0]0x88,%l0	! %l0 = a2ccaca2000000ff
!	Mem[0000000030101408] = d0e53964, %l4 = 00000000abffbfa6
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000064
!	Mem[0000000010001414] = ff000000, %l1 = 0000000000000000
	lduba	[%i0+0x017]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = abffbfa600000000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = d4ffffff, %l5 = 00000000ffffffff
	ldsha	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = 1800a9e5, %l4 = 0000000000000064
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000001800
!	Mem[0000000010081408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010101410] = b705d402
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0005d402

p0_label_98:
!	%l5 = ffffffffffffffff, Mem[0000000010101400] = abffbfa6
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	Mem[0000000021800101] = ffff933f, %l1 = 00000000000000ff
	ldstub	[%o3+0x101],%l1		! %l1 = 000000ff000000ff
!	%l4 = 00001800, %l5 = ffffffff, Mem[0000000010141400] = e5a90018 00000070
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00001800 ffffffff
!	%f18 = a6bfffab a2accca2, Mem[0000000030101408] = 6439e5d0 3c02eba3
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = a6bfffab a2accca2
!	%l7 = 0000000000000000, Mem[0000000010101438] = 4a00b8ff
	stw	%l7,[%i4+0x038]		! Mem[0000000010101438] = 00000000
!	%l6 = ff0077b3, %l7 = 00000000, Mem[0000000010001400] = 000000ff a2ccaca2
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0077b3 00000000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030181400] = 00000034 be624f61
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 000000ff
!	%l0 = a2ccaca2000000ff, Mem[0000000010081420] = 69742726000000a2
	stx	%l0,[%i2+0x020]		! Mem[0000000010081420] = a2ccaca2000000ff
!	%l7 = 0000000000000000, Mem[0000000030101400] = ff3c6439
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ff3c6400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 39643cff, %f7  = e5a90018
	lda	[%i0+%o4]0x88,%f7 	! %f7 = 39643cff

p0_label_99:
!	Mem[0000000030081410] = 00000000000000e6, %l6 = 00000000ff0077b3
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000e6
!	Mem[0000000030181408] = abffbfa6ffffff4c, %f6  = 00000070 39643cff
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = abffbfa6 ffffff4c
!	Mem[00000000100c1408] = abffbfa600000000, %f10 = 00000000 000000ff
	ldda	[%i3+%o4]0x80,%f10	! %f10 = abffbfa6 00000000
!	Mem[0000000010101410] = 0005d402, %l3 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = 000000000005d402
!	Mem[0000000021800180] = 671e028c, %l4 = 0000000000001800
	ldub	[%o3+0x180],%l4		! %l4 = 0000000000000067
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000e6
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 0000fe22, %l3 = 000000000005d402
	ldub	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001400] = b37700ff00000000, %f4  = 00ff0000 0000ff4c
	ldda	[%i0+0x000]%asi,%f4 	! %f4  = b37700ff 00000000
!	Mem[0000000030181400] = ff000000, %l4 = 0000000000000067
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041410] = a6bfffab 00ff0000
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff 00000000

p0_label_100:
!	Mem[0000000030081410] = 000000e6, %l4 = 00000000ff000000
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000e6
!	%l1 = 00000000000000ff, Mem[0000000030181410] = d4ffffff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = d4ff00ff
!	%l6 = 0000000000000000, Mem[0000000010141438] = a7156c04450fd3fa
	stx	%l6,[%i5+0x038]		! Mem[0000000010141438] = 0000000000000000
!	Mem[000000001008142b] = b5a4b37f, %l0 = a2ccaca2000000ff
	ldstuba	[%i2+0x02b]%asi,%l0	! %l0 = 0000007f000000ff
!	Mem[0000000010001400] = ff0077b3, %l0 = 000000000000007f
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000ff0077b3
!	Mem[0000000010101400] = ffffffff, %l7 = 0000000000000000
	ldstub	[%i4+%g0],%l7		! %l7 = 000000ff000000ff
!	%f21 = 0000ff4c, Mem[0000000030041400] = ff000000
	sta	%f21,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ff4c
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041418] = 46aaf47e 000000d1
	stda	%l2,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff 00000000
!	%l0 = 00000000ff0077b3, immed = 000003b7, %y  = 00000000
	sdiv	%l0,0x3b7,%l4		! %l4 = 000000000044a4de
	mov	%l0,%y			! %y = ff0077b3
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0000fe22, %l7 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000

p0_label_101:
!	Mem[00000000100c1400] = 0000000000000000, %f2  = ff3c6439 e5a900ff
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030081408] = ffffffd4 07ccacff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffffffd4 0000000007ccacff
!	Mem[0000000030181410] = ff00ffd4, %l1 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l1 = 000000000000ff00
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l4 = 000000000044a4de
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = ff4cffff, %f4  = b37700ff
	lda	[%i5+%o4]0x81,%f4 	! %f4 = ff4cffff
!	Mem[0000000010081408] = e5a900ff 000000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff 00000000e5a900ff
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030041400] = 4cff0000 000000ff ff000000 39643cff
!	Mem[0000000030041410] = ff3c6439 b377f366 1800a9e5 39643cff
!	Mem[0000000030041420] = 7509d289 00000000 077c3869 00000000
!	Mem[0000000030041430] = e4e4fbae abffbfa6 000000ff b377f366
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010081408] = ff000000, %l0 = 00000000ff0077b3
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000

p0_label_102:
!	Mem[0000000010041408] = ff4cffff, %l0 = ffffffffffffff00
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l6 = ffffffd4, %l7 = 07ccacff, Mem[00000000100c1408] = a6bfffab 00000000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffd4 07ccacff
!	Mem[00000000100c1408] = d4ffffff, %l4 = 0000000000000000
	ldstub	[%i3+%o4],%l4		! %l4 = 000000d4000000ff
	membar	#Sync			! Added by membar checker (21)
!	%l2 = 000000ff, %l3 = e5a900ff, Mem[0000000030041410] = 39643cff 66f377b3
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff e5a900ff
!	%f0  = ff000000 0000ff4c, %l7 = 0000000007ccacff
!	Mem[0000000030041438] = 000000ffb377f366
	add	%i1,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_S ! Mem[0000000030041438] = ff0000000000ff4c
!	Mem[0000000030181400] = ff000000, %l5 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041410] = ff000000, %l4 = 00000000000000d4
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000030141410] = 00ff0000
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010101400] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e5a900ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_103:
!	Mem[0000000010141408] = 00000034, %l7 = 0000000007ccacff
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000034
!	Mem[0000000010181400] = 000000a3, %l6 = 00000000ffffffd4
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffa3
!	Mem[0000000030001400] = e4e4fbaeff000000, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = e4e4fbaeff000000
!	Mem[0000000010101404] = a2accca2, %l5 = ffffffffffffffff
	ldswa	[%i4+0x004]%asi,%l5	! %l5 = ffffffffa2accca2
!	Mem[00000000300c1400] = 3476fa9a, %l1 = e4e4fbaeff000000
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = 000000003476fa9a
!	Mem[0000000030181400] = 000000ff, %l3 = 00000000e5a900ff
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 9e18a2cc, %l0 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffcc
!	Mem[0000000010181408] = ff00a9e539643cff, %f14 = 66f377b3 ff000000
	ldda	[%i6+0x008]%asi,%f14	! %f14 = ff00a9e5 39643cff
!	Mem[0000000010181424] = 26277469, %l7 = 0000000000000034
	ldsha	[%i6+0x026]%asi,%l7	! %l7 = 0000000000007469
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffa2accca2, Mem[0000000010081400] = 00000000
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = a2accca2

p0_label_104:
!	Mem[000000001014142d] = 0df0cc6d, %l4 = 00000000000000ff
	ldstub	[%i5+0x02d],%l4		! %l4 = 000000f0000000ff
!	Mem[00000000201c0000] = 89ff167a, %l4 = 00000000000000f0
	ldstub	[%o0+%g0],%l4		! %l4 = 00000089000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141400] = 00180000
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010081400] = a2ccaca2, %l5 = ffffffffa2accca2
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000a2000000ff
!	Mem[0000000010101400] = 000000ff, %l1 = 000000003476fa9a
	swap	[%i4+%g0],%l1		! %l1 = 00000000000000ff
!	%f5  = 39643cff, Mem[0000000030081400] = ff77f366
	sta	%f5 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 39643cff
!	%f30 = 4a00b8ff ff000000, %l4 = 0000000000000089
!	Mem[0000000010141400] = 000000ffffffffff
	stda	%f30,[%i5+%l4]ASI_PST8_PL ! Mem[0000000010141400] = 000000ffffffff4a
!	%l7 = 0000000000007469, Mem[00000000211c0000] = 0000fe22, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 7469fe22
!	%f5  = 39643cff, Mem[000000001018141c] = 39643cff
	st	%f5 ,[%i6+0x01c]	! Mem[000000001018141c] = 39643cff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 34000000, %l2 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000034000000ff

p0_label_105:
!	Mem[0000000010001408] = 39643cff, %l1 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l0 = ffffffffffffffcc
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ff3c6439 e5a900ff, %l2 = 00000034, %l3 = 000000ff
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff3c6439 00000000e5a900ff
!	Mem[000000001000143c] = ff000000, %l2 = 00000000ff3c6439
	lduh	[%i0+0x03e],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001408] = ff3c6439, %l7 = 0000000000007469
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ff3c
!	Mem[0000000010041410] = 0000000000000000, %f0  = ff000000 0000ff4c
	ldda	[%i1+%o5]0x88,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010141400] = 000000ff ffffff4a, %l6 = ffffffa3, %l7 = 0000ff3c
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff 00000000ffffff4a
!	Mem[0000000010101410] = 0005d402, %l4 = 0000000000000089
	ldsh	[%i4+0x012],%l4		! %l4 = ffffffffffffd402
!	Mem[00000000100c1400] = 00000000 00000000, %l6 = 000000ff, %l7 = ffffff4a
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000e5a900ff, Mem[000000001018140b] = ff00a9e5, %asi = 80
	stba	%l3,[%i6+0x00b]%asi	! Mem[0000000010181408] = ff00a9ff

p0_label_106:
!	%l6 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010001408] = ff3c6439, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ff3c6439
!	%f28 = abffbfa6 d0e53964, %l4 = ffffffffffffd402
!	Mem[0000000030101400] = 00643cffa6ed2c14
	stda	%f28,[%i4+%l4]ASI_PST8_SL ! Mem[0000000030101400] = 00393cffa6ed2c14
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%f6  = ff3c6439 e5a90018, Mem[0000000030081400] = ff3c6439 11013de0
	stda	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = ff3c6439 e5a90018
!	%l7 = 00000000ff3c6439, Mem[0000000010141410] = cca2189effb800ff
	stxa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000ff3c6439
!	%l0 = 0000000000000000, Mem[0000000030081408] = ffffffd407ccacff
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Mem[0000000010181400] = 000000a3, %l3 = 00000000e5a900ff
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000a3000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010001408] = 00000000 e5a900ff
	stda	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000

p0_label_107:
!	Mem[0000000010141410] = 00000000 ff3c6439, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000ff3c6439
!	Mem[0000000010181410] = 00000018 00ffeba3, %l0 = 00000000, %l1 = ff3c6439
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000018 0000000000ffeba3
!	Mem[00000000300c1400] = 3476fa9a, %f3  = 000000ff
	lda	[%i3+%g0]0x81,%f3 	! %f3 = 3476fa9a
!	Mem[0000000010001424] = 00000068, %l3 = 00000000000000a3
	ldsb	[%i0+0x024],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = 0000000000000000, %f14 = ff00a9e5 39643cff
	ldda	[%i1+%o5]0x88,%f14	! %f14 = 00000000 00000000
!	Mem[0000000030081400] = 1800a9e5, %l5 = 00000000000000a2
	ldswa	[%i2+%g0]0x81,%l5	! %l5 = 000000001800a9e5
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101400] = 3476fa9a a2accca2 4cff0000 0000ff00
!	Mem[0000000010101410] = 0005d402 39646698 ff3c6439 e5a90018
!	Mem[0000000010101420] = 96271b53 00000068 3476fa9a ff3c6439
!	Mem[0000000010101430] = abffbfa6 d0e53964 00000000 ff000000
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010181400] = 000000ff, %f3  = 3476fa9a
	lda	[%i6+%g0]0x88,%f3 	! %f3 = 000000ff
!	Mem[0000000030141400] = ff3c6439 9afa7634 ff4cffff 3e4c256a
!	Mem[0000000030141410] = 00000000 98666439 a3e23f32 659c7f47
!	Mem[0000000030141420] = 69742726 24009712 b5a4b37f 20be967f
!	Mem[0000000030141430] = 037cf402 45e82c3e 952f2bd2 47a79b2d
	ldda	[%i5]ASI_BLK_SL,%f0	! Block Load from 0000000030141400
!	Starting 10 instruction Store Burst
!	%l0 = 00000018, %l1 = 00ffeba3, Mem[0000000010181408] = ff00a9ff 39643cff
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000018 00ffeba3

p0_label_108:
!	Mem[0000000010041418] = 000000ff00000000, %l7 = 00000000ff3c6439, %l0 = 0000000000000018
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 000000ff00000000
	membar	#Sync			! Added by membar checker (23)
!	%l0 = 00000000, %l1 = 00ffeba3, Mem[0000000030141400] = 39643cff 3476fa9a
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00ffeba3
!	%l5 = 000000001800a9e5, Mem[0000000010141410] = 00000000
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 1800a9e5
!	%l7 = 00000000ff3c6439, Mem[0000000010141400] = 000000ff
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = ff3c6439
!	%l7 = 00000000ff3c6439, Mem[0000000010101408] = 0000ff4c
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ff3c6439
!	%l2 = 00000000000000ff, Mem[0000000030101408] = abffbfa6
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = abff00ff
!	%l6 = 00000000, %l7 = ff3c6439, Mem[0000000030081408] = 00000000 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 ff3c6439
!	Mem[0000000030081410] = ff000000, %l5 = 000000001800a9e5
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 000000ff00000000
	setx	0x50a44a97ada72ab0,%g7,%l0 ! %l0 = 50a44a97ada72ab0
!	%l1 = 0000000000ffeba3
	setx	0x73ea87186f10bf63,%g7,%l1 ! %l1 = 73ea87186f10bf63
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 50a44a97ada72ab0
	setx	0x377524bf8de5eb2d,%g7,%l0 ! %l0 = 377524bf8de5eb2d
!	%l1 = 73ea87186f10bf63
	setx	0x9c13a997cb1bf2cb,%g7,%l1 ! %l1 = 9c13a997cb1bf2cb
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_109:
!	Mem[0000000010101400] = 9afa7634, %l0 = 377524bf8de5eb2d
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000034
!	Mem[0000000010101410] = 9866643902d40500, %f28 = 6439e5d0 a6bfffab
	ldda	[%i4+%o5]0x88,%f28	! %f28 = 98666439 02d40500
!	Mem[0000000010141410] = 1800a9e5 ff3c6439, %l4 = ffffd402, %l5 = 00000000
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 000000001800a9e5 00000000ff3c6439
!	Mem[00000000100c1410] = ffb0c6df, %l1 = 9c13a997cb1bf2cb
	lduba	[%i3+0x012]%asi,%l1	! %l1 = 00000000000000c6
!	Mem[00000000300c1408] = ff000000, %f30 = 000000ff
	lda	[%i3+%o4]0x81,%f30	! %f30 = ff000000
!	Mem[0000000030101400] = 00393cff, %l2 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000039
!	Mem[0000000010001410] = 4a00b8ff ff000000, %l6 = 00000000, %l7 = ff3c6439
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 000000004a00b8ff 00000000ff000000
!	Mem[00000000211c0000] = 7469fe22, %l4 = 000000001800a9e5
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000007469
!	Mem[0000000010141420] = a6bfff24, %l0 = 0000000000000034
	ldsw	[%i5+0x020],%l0		! %l0 = ffffffffa6bfff24
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffff4cff00000000, %f28 = 98666439 02d40500
	ldda	[%i1+%o4]0x80,%f28	! %f28 = ffff4cff 00000000

p0_label_110:
!	%f20 = 98666439, Mem[0000000030001408] = 00000000
	sta	%f20,[%i0+%o4]0x89	! Mem[0000000030001408] = 98666439
!	Mem[0000000010181408] = 00000018, %l2 = 0000000000000039
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffff167a, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%l7 = 00000000ff000000, Mem[0000000030181400] = 00000000
	stwa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%f28 = ffff4cff 00000000, Mem[0000000010041408] = ff4cffff 00000000
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff4cff 00000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010001438] = 4a00b8ff ff000000
	std	%l2,[%i0+0x038]		! Mem[0000000010001438] = 00000000 000000ff
!	Mem[0000000010081414] = 4cffffff, %l3 = 00000000000000ff
	swap	[%i2+0x014],%l3		! %l3 = 000000004cffffff
!	Mem[000000001000141c] = e5a90018, %l5 = ff3c6439, %l4 = 00007469
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000e5a90018
!	Mem[0000000021800181] = 671e028c, %l7 = 00000000ff000000
	ldstub	[%o3+0x181],%l7		! %l7 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 39643cff, %l1 = 00000000000000c6
	ldsw	[%i4+%o4],%l1		! %l1 = 0000000039643cff

p0_label_111:
!	Mem[0000000010041410] = 0000000000000000, %f16 = a2ccaca2 9afa7634
	ldda	[%i1+%o5]0x88,%f16	! %f16 = 00000000 00000000
!	Mem[0000000030181410] = ff00ffd4, %l4 = 00000000e5a90018
	lduba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = ff3c6439ffffff4a, %f12 = 3e2ce845 02f47c03
	ldda	[%i5+0x000]%asi,%f12	! %f12 = ff3c6439 ffffff4a
!	Mem[00000000300c1408] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001410] = 4a00b8ff, %l6 = 000000004a00b8ff
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = 000000004a00b8ff
!	Mem[0000000010181400] = 000000ff, %l5 = 00000000ff3c6439
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = ffff167a, %l1 = 0000000039643cff
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = a3ebff00 18000000, %l6 = 4a00b8ff, %l7 = 0000001e
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 0000000018000000 00000000a3ebff00
!	Mem[0000000030181410] = d4ff00ff, %l0 = ffffffffa6bfff24
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f12 = ff3c6439 ffffff4a, Mem[0000000010181400] = ff000000 ff3c6439
	std	%f12,[%i6+%g0]	! Mem[0000000010181400] = ff3c6439 ffffff4a

p0_label_112:
!	%l0 = 00000000000000ff, Mem[0000000010041410] = 00000000
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%f4  = 39646698 00000000, %l2 = 0000000000000000
!	Mem[0000000010041420] = 124056572900f600
	add	%i1,0x020,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_P ! Mem[0000000010041420] = 124056572900f600
!	%f0  = 3476fa9a 39643cff, Mem[0000000030101410] = 000000ff 00000000
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 3476fa9a 39643cff
!	%l1 = ffffffffffffffff, Mem[00000000300c1410] = 0000000000000000
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffffffff
!	%f28 = ffff4cff 00000000, %l6 = 0000000018000000
!	Mem[0000000030141420] = 6974272624009712
	add	%i5,0x020,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141420] = 6974272624009712
!	%f7  = 323fe2a3, Mem[0000000010081400] = a2ccacff
	sta	%f7 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 323fe2a3
!	Mem[0000000030081408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030101400] = ff3c3900
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	%l7 = 00000000a3ebff00, Mem[0000000030141410] = 0000000098666439
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000a3ebff00
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 9afa7634, %f1  = 39643cff
	lda	[%i3+%g0]0x89,%f1 	! %f1 = 9afa7634

p0_label_113:
!	Mem[0000000030041408] = ff000000, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	%l4 = ffffffffffffffff, %l5 = 000000000000ff00, %l2  = 0000000000000000
	mulx	%l4,%l5,%l2		! %l2 = ffffffffffff0100
!	Mem[000000001018140c] = 00ffeba3, %l4 = ffffffffffffffff
	lduw	[%i6+0x00c],%l4		! %l4 = 0000000000ffeba3
!	Mem[00000000300c1400] = 3476fa9a, %l3 = 000000004cffffff
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000003476
!	Mem[0000000030101400] = ffffffff, %l6 = 0000000018000000
	ldsba	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = ffffffff, %l2 = ffffffffffff0100
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 39643cff000000ff, %f20 = 98666439 02d40500
	ldda	[%i2+%o4]0x89,%f20	! %f20 = 39643cff 000000ff
!	Mem[0000000030181410] = ff00ffd4, %l3 = 0000000000003476
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f20 = 39643cff, Mem[0000000010001408] = 00000000
	sta	%f20,[%i0+0x008]%asi	! Mem[0000000010001408] = 39643cff

p0_label_114:
!	Mem[0000000010081408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 39643cff
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010181408] = 180000ff, %l3 = 000000000000ff00
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030141400] = 00000000, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%f30 = ff000000 00000000, %l4 = 0000000000ffeba3
!	Mem[0000000030141408] = ff4cffff3e4c256a
	add	%i5,0x008,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030141408] = 0000ffff3e0025ff
!	%f16 = 00000000 00000000, Mem[0000000030081410] = ff0000ff 00000000
	stda	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000000
!	%f0  = 3476fa9a 9afa7634 6a254c3e ffff4cff
!	%f4  = 39646698 00000000 477f9c65 323fe2a3
!	%f8  = 12970024 26277469 7f96be20 7fb3a4b5
!	%f12 = ff3c6439 ffffff4a 2d9ba747 d22b2f95
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	Mem[0000000010181404] = ffffff4a, %l5 = 000000000000ff00
	swap	[%i6+0x004],%l5		! %l5 = 00000000ffffff4a
!	Mem[000000001014143c] = 00000000, %l7 = 00000000a3ebff00
	ldstuba	[%i5+0x03c]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 67ff028c, %l1 = ffffffffffffffff
	ldsba	[%o3+0x180]%asi,%l1	! %l1 = 0000000000000067

p0_label_115:
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 7f00000000000000, %f30 = ff000000 00000000
	ldda	[%i0+%g0]0x80,%f30	! %f30 = 7f000000 00000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030101400] = ffffffff a6ed2c14 ff00ffab a2accca2
!	Mem[0000000030101410] = 3476fa9a 39643cff 2b4e9914 d0e59568
!	Mem[0000000030101420] = 96271b53 e2409144 5ca572a0 ae4c04a7
!	Mem[0000000030101430] = 3059c69c 3a6e5eb2 07ccaca2 9afa7634
	ldda	[%i4]ASI_BLK_AIUS,%f0	! Block Load from 0000000030101400
!	Mem[0000000010101408] = 000000ff0000ff00, %f28 = ffff4cff 00000000
	ldda	[%i4+%o4]0x80,%f28	! %f28 = 000000ff 0000ff00
!	Mem[0000000020800040] = ff0055e8, %l1 = 0000000000000067
	ldsb	[%o1+0x040],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000021800000] = 0024a558, %l0 = 00000000000000ff
	ldsba	[%o3+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = ffffffff 323fe2a3, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000323fe2a3 00000000ffffffff
!	Mem[0000000030001400] = ff000000, %l2 = 00000000323fe2a3
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff00ffab, %l1 = ffffffffffffffff
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010041428] = 69387c07, %l6 = ffffffffffffffff
	ldstuba	[%i1+0x028]%asi,%l6	! %l6 = 00000069000000ff

p0_label_116:
!	%l6 = 0000000000000069, Mem[0000000010041400] = 00000000a6bfffab
	stx	%l6,[%i1+%g0]		! Mem[0000000010041400] = 0000000000000069
!	%f16 = 00000000 00000000 00ff0000 0000ff4c
!	%f20 = 39643cff 000000ff 1800a9e5 39643cff
!	%f24 = 68000000 531b2796 39643cff 9afa7634
!	%f28 = 000000ff 0000ff00 7f000000 00000000
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%f14 = 07ccaca2 9afa7634, %l0 = 0000000000000000
!	Mem[0000000010181418] = 1800a97f39643cff
	add	%i6,0x018,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181418] = 1800a97f39643cff
!	%l5 = 00000000ffffff4a, Mem[00000000100c1410] = 39646698
	stwa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffff4a
!	%f11 = ae4c04a7, Mem[0000000010141410] = 39643cff
	sta	%f11,[%i5+0x010]%asi	! Mem[0000000010141410] = ae4c04a7
	membar	#Sync			! Added by membar checker (25)
!	%f0  = ffffffff a6ed2c14 ff00ffab a2accca2
!	%f4  = 3476fa9a 39643cff 2b4e9914 d0e59568
!	%f8  = 96271b53 e2409144 5ca572a0 ae4c04a7
!	%f12 = 3059c69c 3a6e5eb2 07ccaca2 9afa7634
	stda	%f0,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 7469fe22, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0069fe22
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010141428] = a7044cae, %l3 = ffffffff, %l6 = 00000069
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000a7044cae
!	%l6 = 00000000a7044cae, Mem[0000000030081408] = 000000ff
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = a7044cae
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_117:
!	Mem[0000000030181408] = ffffff4c, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000004c
!	Mem[0000000010181414] = 00ffeba3, %l1 = 000000000000ff00
	ldswa	[%i6+0x014]%asi,%l1	! %l1 = 0000000000ffeba3
!	Mem[0000000010041430] = 3f856224, %l3 = 00000000ffffffff
	ldsh	[%i1+0x030],%l3		! %l3 = 0000000000003f85
!	Mem[0000000010001400] = 7f000000, %l6 = 00000000a7044cae
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 000000007f000000
!	Mem[0000000010101400] = 3476fa9a a2accca2, %l4 = 00ffeba3, %l5 = ffffff4a
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 000000003476fa9a 00000000a2accca2
!	Mem[00000000300c1408] = 70000000000000ff, %f30 = 7f000000 00000000
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 70000000 000000ff
!	Mem[0000000010141408] = a2ccaca2, %l1 = 0000000000ffeba3
	lduwa	[%i5+0x008]%asi,%l1	! %l1 = 00000000a2ccaca2
!	Mem[0000000030001408] = 39646698d1000000, %l5 = 00000000a2accca2
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 39646698d1000000
!	Mem[0000000010081410] = 00000000 000000ff, %l6 = 7f000000, %l7 = 00000000
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 000000ff, %l3 = 0000000000003f85
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff

p0_label_118:
!	Mem[00000000300c1408] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041410] = ff000000, %l2 = 000000000000004c
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030101400] = ffffffff, %l5 = 39646698d1000000
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	%l4 = 3476fa9a, %l5 = ffffffff, Mem[0000000010081428] = b5a4b3ff 20be967f
	std	%l4,[%i2+0x028]		! Mem[0000000010081428] = 3476fa9a ffffffff
!	Mem[0000000030101400] = d1000000, %l1 = 00000000a2ccaca2
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 4cffffff, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 000000004cffffff
!	%l2 = 00000000000000ff, Mem[00000000218000c0] = ff68ff0b, %asi = 80
	stha	%l2,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ffff0b
!	%l4 = 000000003476fa9a, Mem[0000000010101413] = 0005d402
	stb	%l4,[%i4+0x013]		! Mem[0000000010101410] = 0005d49a
!	%f23 = 39643cff, Mem[00000000100c1400] = 3476fa9a
	sta	%f23,[%i3+%g0]0x80	! Mem[00000000100c1400] = 39643cff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l4 = 000000003476fa9a
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000

p0_label_119:
!	Mem[0000000030001400] = 853f0000, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 3476fa9a, %l4 = 00000000ff000000
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000003476
!	Mem[0000000030141400] = 000000ff, %f24 = 68000000
	lda	[%i5+%g0]0x89,%f24	! %f24 = 000000ff
!	Mem[0000000010001410] = ffb8004a, %f4  = 3476fa9a
	lda	[%i0+%o5]0x88,%f4 	! %f4 = ffb8004a
!	Mem[0000000010001430] = abffbfa6, %l4 = 0000000000003476
	lduh	[%i0+0x032],%l4		! %l4 = 000000000000bfa6
!	Mem[0000000020800000] = ff64160c, %l3 = 0000000000000000
	ldsba	[%o1+0x001]%asi,%l3	! %l3 = 0000000000000064
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l1 = 000000004cffffff
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = a3ebff00180000ff, %f6  = 2b4e9914 d0e59568
	ldda	[%i6+%o4]0x88,%f6 	! %f6  = a3ebff00 180000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_120:
!	%f22 = 1800a9e5 39643cff, Mem[0000000030101408] = ff00ffab a2accca2
	stda	%f22,[%i4+%o4]0x81	! Mem[0000000030101408] = 1800a9e5 39643cff
!	Mem[0000000010141434] = 9cc65930, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x034]%asi,%l6	! %l6 = 000000009cc65930
!	%l5 = 00000000ffffffff, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	%l6 = 000000009cc65930, Mem[0000000030081410] = 00000000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 59300000
!	%l0 = 0000000000000000, Mem[0000000010041404] = 00000069, %asi = 80
	stwa	%l0,[%i1+0x004]%asi	! Mem[0000000010041404] = 00000000
!	%l6 = 9cc65930, %l7 = 000000ff, Mem[00000000300c1410] = ffffffff ffffffff
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9cc65930 000000ff
!	%f30 = 70000000, Mem[00000000100c1400] = 39643cff
	sta	%f30,[%i3+%g0]0x80	! Mem[00000000100c1400] = 70000000
!	Mem[0000000010001434] = d0e53964, %l0 = 0000000000000000
	swap	[%i0+0x034],%l0		! %l0 = 00000000d0e53964
!	%l5 = 00000000ffffffff, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000ff4c, %l0 = 00000000d0e53964
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 000000000000ff4c

p0_label_121:
!	Mem[0000000010081408] = e5a900ff 00000000, %l0 = 0000ff4c, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000 00000000e5a900ff
!	Mem[0000000010041430] = 3f856224, %l6 = 000000009cc65930
	lduwa	[%i1+0x030]%asi,%l6	! %l6 = 000000003f856224
!	Mem[0000000010081410] = ffff0000, %l1 = 00000000e5a900ff
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = 000000d1a6ed2c14, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 000000d1a6ed2c14
!	Mem[0000000010041410] = ff000000, %f5  = 39643cff
	lda	[%i1+%o5]0x80,%f5 	! %f5 = ff000000
!	Mem[0000000030081400] = 1800a9e5, %l6 = 000000003f856224
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 000000001800a9e5
!	Mem[0000000030101408] = 1800a9e5, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000018
!	Mem[0000000030101400] = 142ceda6d1000000, %f2  = ff00ffab a2accca2
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = 142ceda6 d1000000
!	Mem[00000000100c1400] = 00000070, %f16 = 00000000
	lda	[%i3+%g0]0x88,%f16	! %f16 = 00000070
!	Starting 10 instruction Store Burst
!	%f8  = 96271b53 e2409144, Mem[00000000100c1410] = 4affffff 00000000
	stda	%f8 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 96271b53 e2409144

p0_label_122:
!	Mem[0000000010101429] = 3476fa9a, %l6 = 000000001800a9e5
	ldstuba	[%i4+0x029]%asi,%l6	! %l6 = 00000076000000ff
!	%l4 = 000000000000bfa6, Mem[0000000030101408] = 1800a9e5
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = a600a9e5
!	%l4 = 000000000000bfa6, Mem[0000000030041408] = 000000ff
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000a6
!	%l1 = ffffffffffffffff, Mem[0000000030101400] = 000000d1
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%f30 = 70000000 000000ff, Mem[0000000030041400] = 4cff0000 000000ff
	stda	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = 70000000 000000ff
!	%l6 = 0000000000000076, Mem[0000000010101408] = 00ff0000ff000000
	stxa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000076
!	%l5 = 00000000ffffffff, Mem[00000000201c0000] = ffff167a, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff167a
!	%l3 = 0000000000000064, Mem[0000000030001400] = 853f0000
	stwa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000064
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = 9cc65930
	stwa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000018, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = ffffffffff000018

p0_label_123:
!	Mem[0000000010181400] = ff3c6439, %l2 = ffffffffff000018
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff3c6439
!	Mem[0000000010041400] = 00000000, %l0 = 000000d1a6ed2c14
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000ff3c6439
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101410] = ff3c6439 9afa7634, %l6 = 00000076, %l7 = 00000018
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 000000009afa7634 00000000ff3c6439
!	Mem[0000000030181410] = d4ff00ff, %l1 = ffffffffffffffff
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 00000000d4ff00ff
!	Mem[0000000030181400] = 000000ff000000ff, %f8  = 96271b53 e2409144
	ldda	[%i6+%g0]0x89,%f8 	! %f8  = 000000ff 000000ff
!	Mem[0000000010041408] = ffff4cff 00000000, %l6 = 9afa7634, %l7 = ff3c6439
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000ffff4cff
!	Mem[0000000030001408] = 39646698, %f24 = 000000ff
	lda	[%i0+%o4]0x81,%f24	! %f24 = 39646698
!	Mem[0000000010041400] = 0000000000000000, %l2 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f21 = 000000ff, Mem[0000000010081408] = 00000000
	st	%f21,[%i2+%o4]		! Mem[0000000010081408] = 000000ff

p0_label_124:
!	%f6  = a3ebff00 180000ff, Mem[0000000010081410] = 0000ffff ff000000
	stda	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = a3ebff00 180000ff
!	Mem[0000000010141410] = ff3c64399afa7634, %l2 = 0000000000000000, %l4 = 000000000000bfa6
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = ff3c64399afa7634
!	%l2 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l4 = ff3c64399afa7634, Mem[0000000010041410] = 000000ff
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000034
!	%l1 = 00000000d4ff00ff, Mem[0000000010141408] = a2ccaca2
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffaca2
!	%f0  = ffffffff a6ed2c14, %l1 = 00000000d4ff00ff
!	Mem[0000000030141438] = 952f2bd247a79b2d
	add	%i5,0x038,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141438] = 142ceda6ffffffff
!	%l1 = 00000000d4ff00ff, Mem[000000001008140a] = 000000ff, %asi = 80
	stba	%l1,[%i2+0x00a]%asi	! Mem[0000000010081408] = 0000ffff
!	%f30 = 70000000 000000ff, Mem[00000000100c1408] = 3e4c256a ff4cffff
	stda	%f30,[%i3+%o4]0x88	! Mem[00000000100c1408] = 70000000 000000ff
!	%l4 = ff3c64399afa7634, Mem[0000000010041404] = 00000000, %asi = 80
	stwa	%l4,[%i1+0x004]%asi	! Mem[0000000010041404] = 9afa7634
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff3c6439, %l4 = ff3c64399afa7634
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_125:
!	Mem[00000000211c0000] = 0069fe22, %l1 = 00000000d4ff00ff
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 0000000000000069
!	Mem[000000001014140c] = abff00ff, %l7 = 00000000ffff4cff
	ldsb	[%i5+0x00d],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ffffffffa6ed2c14, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffa6ed2c14
!	Mem[0000000030001400] = 64000000 aefbe4e4, %l0 = 00000000, %l1 = 00000069
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 0000000064000000 00000000aefbe4e4
!	Mem[00000000100c1410] = 96271b53e2409144, %f2  = 142ceda6 d1000000
	ldda	[%i3+%o5]0x88,%f2 	! %f2  = 96271b53 e2409144
!	Mem[0000000010041424] = 2900f600, %l1 = 00000000aefbe4e4
	ldsha	[%i1+0x024]%asi,%l1	! %l1 = 0000000000002900
!	Mem[0000000030081410] = 0000000000003059, %f14 = 07ccaca2 9afa7634
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 00000000 00003059
!	Mem[0000000010081400] = 323fe2a3, %l3 = 0000000000000064
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000a3
!	Starting 10 instruction Store Burst
!	%f13 = 3a6e5eb2, Mem[0000000030181408] = 00000000
	sta	%f13,[%i6+%o4]0x89	! Mem[0000000030181408] = 3a6e5eb2

p0_label_126:
!	%l1 = 0000000000002900, Mem[0000000010101408] = 76000000
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000030001408] = 98666439, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000039000000ff
!	%l5 = 00000000ffffffff, Mem[0000000010041429] = ff387c07, %asi = 80
	stba	%l5,[%i1+0x029]%asi	! Mem[0000000010041428] = ffff7c07
!	Mem[0000000010141410] = 39643cff, %l7 = 0000000000000039
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 0000000039643cff
!	%l3 = 00000000000000a3, Mem[0000000030001410] = ff000000
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = a3000000
!	Mem[0000000030081408] = ae4c04a7, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000ae000000ff
!	Mem[0000000010101410] = 9ad40500, %l6 = ffffffffa6ed2c14
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[000000001010140c] = 00000000, %l4 = 00000000000000ae, %asi = 80
	swapa	[%i4+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = e5a90018, %l6 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 00000018000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = a600000039643cff, %l3 = 00000000000000a3
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = a600000039643cff

p0_label_127:
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000002900
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 142ceda6ffffffff, %l0 = 0000000064000000
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 142ceda6ffffffff
!	Mem[0000000030001400] = e4e4fbae00000064, %f24 = 39646698 531b2796
	ldda	[%i0+%g0]0x89,%f24	! %f24 = e4e4fbae 00000064
!	Mem[0000000030101400] = ffffffff, %l7 = 0000000039643cff
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = ff3c64390000ff00, %f6  = a3ebff00 180000ff
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = ff3c6439 0000ff00
!	Mem[0000000030181408] = 3a6e5eb2, %l7 = ffffffffffffffff
	lduha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000005eb2
!	Mem[00000000300c1400] = 3476fa9a a2accca2, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 000000003476fa9a 00000000a2accca2
!	Mem[0000000010001400] = 0000007f, %l5 = 00000000a2accca2
	ldswa	[%i0+%g0]0x88,%l5	! %l5 = 000000000000007f
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 9ad405ff, %l5 = 000000000000007f
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 000000ff000000ff

p0_label_128:
!	%l3 = a600000039643cff, Mem[0000000030041400] = 70000000000000ff
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = a600000039643cff
!	%f2  = 96271b53 e2409144, %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 0000001800ffeba3
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_P ! Mem[0000000010181410] = 96271b53e2409144
!	%l0 = 142ceda6ffffffff, Mem[0000000030181408] = b25e6e3a
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff6e3a
!	%f8  = 000000ff, Mem[0000000030181408] = ffff6e3a
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	Mem[0000000021800100] = ffff933f, %l7 = 0000000000005eb2
	ldstuba	[%o3+0x100]%asi,%l7	! %l7 = 000000ff000000ff
!	%f18 = 00ff0000 0000ff4c, Mem[0000000030181408] = ff000000 abffbfa6
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 00ff0000 0000ff4c
!	%l7 = 00000000000000ff, Mem[0000000010081400] = a3e23f32
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff3f32
!	%f2  = 96271b53, Mem[0000000010081414] = 00ffeba3
	sta	%f2 ,[%i2+0x014]%asi	! Mem[0000000010081414] = 96271b53
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 39643cff, %l5 = 00000000000000ff
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_129:
!	Mem[0000000030001408] = ff646698, %l4 = 000000003476fa9a
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 4a00b8ff, %l3 = a600000039643cff
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = 000000004a00b8ff
!	Mem[00000000100c141c] = 323fe2a3, %l4 = 00000000000000ff
	ldsha	[%i3+0x01c]%asi,%l4	! %l4 = 000000000000323f
!	Mem[0000000010181400] = 00ff000039643cff, %l0 = 142ceda6ffffffff
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 00ff000039643cff
!	Mem[0000000010181400] = ff3c6439, %l4 = 000000000000323f
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldsb	[%i4+0x009],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 9afa7634, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 000000009afa7634
!	Mem[000000001004142c] = 5f1bc9da, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x02c]%asi,%l2	! %l2 = 000000005f1bc9da
!	Mem[0000000030001400] = 64000000aefbe4e4, %l7 = 000000009afa7634
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = 64000000aefbe4e4
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 180000ff, %l3 = 000000004a00b8ff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_130:
!	%f30 = 70000000 000000ff, Mem[0000000010141408] = 00ffaca2 abff00ff
	stda	%f30,[%i5+0x008]%asi	! Mem[0000000010141408] = 70000000 000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l6 = 0000000000000018, Mem[0000000010181408] = 180000ff
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 18000018
!	Mem[00000000100c1408] = 000000ff, %l5 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800181] = 67ff028c, %l5 = 00000000000000ff
	ldstuba	[%o3+0x181]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081407] = ffffffff, %l2 = 000000005f1bc9da
	ldstub	[%i2+0x007],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = 000000ff, %l7 = 64000000aefbe4e4
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 70000000
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	Mem[0000000010181408] = 18000018, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 00000018000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 26277469, %l4 = 0000000000000018
	lduha	[%i3+0x026]%asi,%l4	! %l4 = 0000000000007469

p0_label_131:
!	Mem[0000000030001400] = 00000064, %l7 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000064
!	Mem[00000000100c1410] = 449140e2, %f0  = ffffffff
	lda	[%i3+0x010]%asi,%f0 	! %f0 = 449140e2
!	Mem[0000000030141408] = 0000ffff, %l1 = ffffffffffffffff
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 3476fa9a, %l0 = 00ff000039643cff
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000003476
!	Mem[0000000030101408] = ff3c6439e5a900a6, %l2 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = ff3c6439e5a900a6
!	Mem[0000000010001418] = 00000070 e5a90018, %l2 = e5a900a6, %l3 = 000000ff
	ldda	[%i0+0x018]%asi,%l2	! %l2 = 0000000000000070 00000000e5a90018
!	Mem[0000000010081408] = 0000ffff, %l4 = 0000000000007469
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001400] = 64000000aefbe4e4, %l3 = 00000000e5a90018
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = 64000000aefbe4e4
!	Mem[0000000030041400] = a600000039643cff, %f6  = ff3c6439 0000ff00
	ldda	[%i1+%g0]0x81,%f6 	! %f6  = a6000000 39643cff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000018, Mem[0000000010041425] = 2900f600
	stb	%l6,[%i1+0x025]		! Mem[0000000010041424] = 2918f600

p0_label_132:
!	%f6  = a6000000 39643cff, %l0 = 0000000000003476
!	Mem[0000000010181430] = 52d6eba3fffffff2
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181430] = 52000000ff643cf2
!	%l7 = 0000000000000064, Mem[0000000010181400] = 00ff000039643cff
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000064
!	%l3 = 64000000aefbe4e4, Mem[00000000218001c1] = ffffa59a
	stb	%l3,[%o3+0x1c1]		! Mem[00000000218001c0] = ffe4a59a
!	Mem[00000000211c0000] = 0069fe22, %l2 = 0000000000000070
	ldstub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	%f4  = ffb8004a ff000000, %l1 = 0000000000000000
!	Mem[0000000030001410] = a300000014994e34
	add	%i0,0x010,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030001410] = a300000014994e34
!	%l4 = 000000000000ffff, Mem[0000000030141400] = 000000ff
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000ffff
!	Mem[00000000211c0000] = ff69fe22, %l4 = 000000000000ffff
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000030001408] = ff646698, %l0 = 0000000000003476
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000030001410] = 000000a3
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ae00000000000000, %f16 = 00000070 00000000
	ldda	[%i4+%o4]0x88,%f16	! %f16 = ae000000 00000000

p0_label_133:
!	Mem[0000000030141400] = ffff0000, %l5 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = 000000ff, %l5 = ffffffffffffffff
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000018
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101430] = abffbfa6d0e53964, %f8  = 000000ff 000000ff
	ldd	[%i4+0x030],%f8 	! %f8  = abffbfa6 d0e53964
!	Mem[0000000030081400] = ff00a9e5, %l3 = 64000000aefbe4e4
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = ff000018, %l3 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ff000018
!	Mem[0000000010081404] = ffffffff, %f29 = 0000ff00
	lda	[%i2+0x004]%asi,%f29	! %f29 = ffffffff
!	Mem[00000000300c1408] = 000000ff, %l3 = 00000000ff000018
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081400] = e5a900ff
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = e5a90000

p0_label_134:
!	%l6 = ffffffffffffffff, Mem[0000000021800180] = 67ff028c
	stb	%l6,[%o3+0x180]		! Mem[0000000021800180] = ffff028c
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010001408] = 39643cff 000000ff
	stda	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000ff 00000000
!	%l1 = 0000000000000000, Mem[0000000010101410] = ff05d49a
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000d49a
!	Mem[0000000010181408] = ff000018, %l6 = ffffffffffffffff
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff000018
!	Mem[0000000030141400] = ffff0000, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f16 = ae000000 00000000, Mem[00000000100c1408] = ffffffff 70000000
	stda	%f16,[%i3+%o4]0x88	! Mem[00000000100c1408] = ae000000 00000000
!	%f13 = 3a6e5eb2, Mem[0000000030001410] = 00000000
	sta	%f13,[%i0+%o5]0x89	! Mem[0000000030001410] = 3a6e5eb2
!	Mem[0000000030181408] = 0000ff4c, %l6 = 00000000ff000018
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 000000000000ff4c
!	Mem[0000000030101408] = a600a9e5, %l3 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000a6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 9ad40000, %l6 = 000000000000ff4c
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_135:
!	Mem[0000000030041408] = ff3c6439000000a6, %f12 = 3059c69c 3a6e5eb2
	ldda	[%i1+%o4]0x89,%f12	! %f12 = ff3c6439 000000a6
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000000000a6
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = e2409144, %l7 = 0000000000000064
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000e2409144
!	Mem[0000000010181408] = ffffffff, %f12 = ff3c6439
	lda	[%i6+%o4]0x80,%f12	! %f12 = ffffffff
!	Mem[0000000010001430] = abffbfa6, %l0 = 00000000000000ff
	lduh	[%i0+0x030],%l0		! %l0 = 000000000000abff
!	Mem[0000000010101410] = 0000d49a, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 000000000000d49a
!	Mem[0000000030041400] = a6000000, %f21 = 000000ff
	lda	[%i1+%g0]0x81,%f21	! %f21 = a6000000
!	Mem[0000000010041408] = 000000ff ff4cffff, %l0 = 0000abff, %l1 = 00000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff 00000000ff4cffff
!	Mem[00000000300c1410] = ff000000, %l4 = 000000000000d49a
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030101408] = ff00a9e5 39643cff
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000ff

p0_label_136:
!	%l5 = 00000000000000ff, Mem[0000000010181410] = 531b2796
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 531b27ff
!	%f12 = ffffffff 000000a6, Mem[0000000030101408] = 00000000 ff000000
	stda	%f12,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff 000000a6
!	%l6 = 00000000, %l7 = e2409144, Mem[0000000030181408] = ff000018 00ff0000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 e2409144
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 700000009afa7634
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[000000001000141d] = e5a90018, %l1 = 00000000ff4cffff
	ldstuba	[%i0+0x01d]%asi,%l1	! %l1 = 000000a9000000ff
!	Mem[0000000030141408] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	%f20 = 39643cff a6000000, Mem[00000000100c1400] = 00000000 00000000
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 39643cff a6000000
!	%f18 = 00ff0000, Mem[0000000030141400] = 0000ffff
	sta	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = 00ff0000
!	Mem[0000000030181410] = ff00ffd4, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = e4e4fbae, %f4  = ffb8004a
	lda	[%i6+%g0]0x81,%f4 	! %f4 = e4e4fbae

p0_label_137:
!	Mem[0000000010141400] = ffffffffa6ed2c14, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = ffffffffa6ed2c14
!	Mem[0000000010101408] = 00000000000000ae, %l0 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ae
!	Mem[0000000010101400] = 9afa7634, %f0  = 449140e2
	lda	[%i4+%g0]0x88,%f0 	! %f0 = 9afa7634
!	Mem[0000000010101410] = 0000d49a, %l1 = 00000000000000a9
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ff00001896271b53, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ff00001896271b53
!	Mem[0000000030141400] = 0000ff00, %l4 = 000000000000ff00
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l3 = ffffffffa6ed2c14
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030001408] = ff646698, %l7 = 00000000e2409144
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030181400] = e4e4fbae ff000000 00000000 449140e2
!	Mem[0000000030181410] = ff00ffd4 00000000 ecc3ac98 ee72ccef
!	Mem[0000000030181420] = 69387c07 5f1bc9da 36c41009 8d5e390d
!	Mem[0000000030181430] = b5a4b37f f83efdca 5dda5b71 54ad0d30
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff000000, %l2 = 000000000000ffff
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000ff000000

p0_label_138:
!	%l1 = ff00001896271b53, Mem[0000000010181400] = 64000000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 96271b53
!	%l1 = ff00001896271b53, Mem[00000000300c1410] = 000000ff
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000053
!	%f26 = 39643cff 9afa7634, %l0 = 00000000000000ae
!	Mem[0000000010001438] = 00000000000000ff
	add	%i0,0x038,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001438] = 0000fa9aff3c6439
!	Mem[00000000201c0001] = ffff167a, %l1 = ff00001896271b53
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010141400] = 142ceda6
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001400] = 7f000000
	stwa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1418] = 477f9c65323fe2a3, %asi = 80
	stxa	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000000000ff
!	%l2 = ff000000, %l3 = ff000000, Mem[0000000030081410] = 00003059 00000000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000 ff000000
!	%f31 = 000000ff, Mem[0000000010141408] = 000000ff
	sta	%f31,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000ff00, %l5 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_139:
!	Mem[0000000010081410] = 180000ff, %f19 = 0000ff4c
	lda	[%i2+%o5]0x88,%f19	! %f19 = 180000ff
!	Mem[0000000030101408] = a6000000ffffffff, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = a6000000ffffffff
!	%f26 = 39643cff, Mem[00000000300c1400] = 3476fa9a
	sta	%f26,[%i3+%g0]0x81	! Mem[00000000300c1400] = 39643cff
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff00000053, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 000000ff00000053
!	Mem[0000000030001410] = 3a6e5eb2, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 000000003a6e5eb2
!	Mem[0000000030101410] = ff3c6439 9afa7634, %l0 = 000000ae, %l1 = 000000ff
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 000000009afa7634 00000000ff3c6439
!	Mem[0000000010101410] = 9ad40000, %l2 = 00000000ff000000
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = ffffffff9ad40000
!	Mem[000000001010140c] = 000000ae, %l4 = 0000000000000000
	ldub	[%i4+0x00e],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 3a6e5eb2, Mem[0000000010141420] = 449140e2 531b2796
	std	%l4,[%i5+0x020]		! Mem[0000000010141420] = 00000000 3a6e5eb2

p0_label_140:
!	%l4 = 00000000, %l5 = 3a6e5eb2, Mem[0000000030141400] = 00ff0000 00ffeba3
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 3a6e5eb2
!	%l4 = 00000000, %l5 = 3a6e5eb2, Mem[0000000010041410] = 34000000 00000000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 3a6e5eb2
!	Mem[00000000100c1410] = 449140e2, %l2 = ffffffff9ad40000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000449140e2
!	%l1 = 00000000ff3c6439, Mem[00000000100c1408] = 00000000000000ae
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000ff3c6439
!	%l6 = 000000ff00000053, Mem[0000000010181408] = ffffffff
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000053
!	%l2 = 00000000449140e2, Mem[000000001010143c] = ff000000, %asi = 80
	stha	%l2,[%i4+0x03c]%asi	! Mem[000000001010143c] = 40e20000
!	%l0 = 9afa7634, %l1 = ff3c6439, Mem[0000000010101408] = 00000000 000000ae
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 9afa7634 ff3c6439
!	Mem[0000000010041428] = ffff7c0700000000, %l6 = 000000ff00000053, %l1 = 00000000ff3c6439
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = ffff7c0700000000
!	%l0 = 9afa7634, %l1 = 00000000, Mem[0000000010001400] = ff000000 00000000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 9afa7634 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_141:
!	Mem[00000000100c1410] = 9ad40000531b2796, %f30 = 70000000 000000ff
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 9ad40000 531b2796
!	%f25 = 00000064, %f31 = 531b2796
	fcmpes	%fcc0,%f25,%f31		! %fcc0 = 1
!	Mem[0000000010081408] = ffff0000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffff0000
!	Mem[0000000021800100] = ffff933f, %l1 = ffff7c0700000000
	ldsh	[%o3+0x100],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = a6000000, %l4 = ffffffffffff0000
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = ffffffffa6000000
!	Mem[0000000010081408] = e5a900ffffff0000, %l2 = 00000000449140e2
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = e5a900ffffff0000
!	Mem[0000000010181400] = 531b2796, %l3 = 00000000ff000000
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000096
!	Mem[00000000300c1410] = 00000053, %l2 = e5a900ffffff0000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000053
!	Mem[00000000100c1400] = 39643cffa6000000, %l0 = 000000009afa7634
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 39643cffa6000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000096
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_142:
!	Mem[0000000010101408] = 9afa7634, %l4 = ffffffffa6000000
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 000000009afa7634
!	Mem[000000001008142a] = 3476fa9a, %l3 = 0000000000000000
	ldstub	[%i2+0x02a],%l3		! %l3 = 000000fa000000ff
!	Mem[0000000010181408] = 53000000, %l3 = 00000000000000fa
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 0000000053000000
!	Mem[0000000030041410] = 0000ffff, %l0 = 39643cffa6000000
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 000000ff00000053, Mem[0000000030041408] = 000000a6
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000053
!	Mem[00000000201c0001] = ffff167a, %l4 = 000000009afa7634
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010041410] = 00000000 3a6e5eb2
	std	%l0,[%i1+%o5]		! Mem[0000000010041410] = 00000000 ffffffff
!	%f5  = d4ff00ff, Mem[000000001004140c] = ff4cffff
	sta	%f5 ,[%i1+0x00c]%asi	! Mem[000000001004140c] = d4ff00ff
!	%l5 = 000000003a6e5eb2, Mem[0000000010041430] = 3f856224a6cf7b9f, %asi = 80
	stxa	%l5,[%i1+0x030]%asi	! Mem[0000000010041430] = 000000003a6e5eb2
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = d128571f, %l7 = a6000000ffffffff
	lduba	[%o3+0x080]%asi,%l7	! %l7 = 00000000000000d1

p0_label_143:
!	Mem[0000000010081400] = 323fff00, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181408] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 0000a9e5, %l6 = 000000ff00000053
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = 000000000000a9e5
!	Mem[00000000218001c0] = ffe4a59a, %l5 = 000000003a6e5eb2
	ldub	[%o3+0x1c1],%l5		! %l5 = 00000000000000e4
!	Mem[0000000030141408] = ff25003e 00000000, %l2 = 00000053, %l3 = 53000000
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000 00000000ff25003e
!	Mem[0000000030001410] = b25e6e3a14994e34, %f18 = 00ff0000 180000ff
	ldda	[%i0+%o5]0x81,%f18	! %f18 = b25e6e3a 14994e34
!	Mem[0000000010101410] = 9ad40000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff00ffd4 00000000, %l2 = 00000000, %l3 = ff25003e
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff00ffd4 0000000000000000
!	Mem[0000000010041408] = 000000ffd4ff00ff, %l7 = 00000000000000d1
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = 000000ffd4ff00ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ff00, Mem[00000000100c1408] = ff000000
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ff00

p0_label_144:
!	Mem[0000000030041408] = 00000053, %l6 = 000000000000a9e5
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000053
!	%l3 = 0000000000000000, Mem[00000000300c1400] = a2ccaca2ff3c6439
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%f14 = 300dad54 715bda5d, Mem[0000000010181410] = 531b27ff 449140e2
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = 300dad54 715bda5d
!	%l3 = 0000000000000000, Mem[0000000010041400] = 00000000
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010081400] = 323fff00, %l5 = 00000000000000e4
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f12 = cafd3ef8 7fb3a4b5, %l1 = 0000000000000000
!	Mem[00000000300c1430] = 5ffc35d72f7b8146
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_SL ! Mem[00000000300c1430] = 5ffc35d72f7b8146
!	%f16 = ae000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010001438] = 0000fa9aff3c6439
	add	%i0,0x038,%g1
	stda	%f16,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001438] = 0000fa9aff3c6439
	membar	#Sync			! Added by membar checker (28)
!	%f10 = 0d395e8d, Mem[0000000030181400] = e4e4fbae
	sta	%f10,[%i6+%g0]0x81	! Mem[0000000030181400] = 0d395e8d
!	Mem[0000000030041408] = 0000a9e5, %l7 = 000000ffd4ff00ff
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 000000e5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = e5a90000, %l2 = 00000000ff00ffd4
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_145:
!	Mem[00000000100c1410] = 9ad40000531b2796, %f4  = 00000000 d4ff00ff
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 9ad40000 531b2796
!	Mem[0000000030141410] = 00000000, %l7 = 00000000000000e5
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 0000ff00 ff3c6439, %l6 = 00000053, %l7 = 00000000
	ldd	[%i3+%o4],%l6		! %l6 = 000000000000ff00 00000000ff3c6439
!	Mem[0000000030041408] = ffa90000, %f1  = aefbe4e4
	lda	[%i1+%o4]0x81,%f1 	! %f1 = ffa90000
!	Mem[0000000010041414] = ffffffff, %l4 = 000000000000ff00
	ldsha	[%i1+0x016]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041408] = ffa9000039643cff, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = ffa9000039643cff
!	Mem[00000000100c1408] = 0000ff00, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 986664ff, %l7 = 00000000ff3c6439
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = ffffffff986664ff
!	Mem[0000000021800000] = 0024a558, %l4 = ffffffffffffffff
	ldsb	[%o3+%g0],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f13 = 7fb3a4b5, Mem[0000000010041408] = 000000ff
	st	%f13,[%i1+%o4]		! Mem[0000000010041408] = 7fb3a4b5

p0_label_146:
!	%l6 = 000000000000ff00, Mem[00000000100c1400] = 000000a6
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ff00
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0x347156781ae7e5c8,%g7,%l0 ! %l0 = 347156781ae7e5c8
!	%l1 = 0000000000000000
	setx	0x191a03dfe15fe8fa,%g7,%l1 ! %l1 = 191a03dfe15fe8fa
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 347156781ae7e5c8
	setx	0xbe1d07b81a217612,%g7,%l0 ! %l0 = be1d07b81a217612
!	%l1 = 191a03dfe15fe8fa
	setx	0x2e941bf02cdb6c23,%g7,%l1 ! %l1 = 2e941bf02cdb6c23
!	%l5 = ffa9000039643cff, Mem[0000000030041400] = 000000a6
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00003cff
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	swap	[%i0+%o4],%l2		! %l2 = 00000000000000ff
!	%l7 = ffffffff986664ff, Mem[0000000030181400] = 0d395e8dff000000
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff986664ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001408] = 00000000 00000000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff 00000000
!	Mem[00000000300c1410] = 53000000, %l6 = 000000000000ff00
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000053000000ff
!	%l5 = ffa9000039643cff, Mem[0000000010041410] = 00000000, %asi = 80
	stha	%l5,[%i1+0x010]%asi	! Mem[0000000010041410] = 3cff0000
!	%f28 = 000000ff ffffffff, Mem[0000000010141408] = 000000ff ff000000
	stda	%f28,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = e2409144 00000000, %l0 = 1a217612, %l1 = 2cdb6c23
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000e2409144

p0_label_147:
!	Mem[0000000020800040] = ff0055e8, %l3 = 0000000000000000
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000010001400] = 3476fa9a00000000, %f8  = dac91b5f 077c3869
	ldd	[%i0+%g0],%f8 		! %f8  = 3476fa9a 00000000
!	Mem[0000000010081410] = 180000ff, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = ffff167a, %l7 = ffffffff986664ff
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = ff000000 00000000, %l2 = 000000ff, %l3 = ffffff00
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000030001410] = 3a6e5eb2, %l4 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000005eb2
!	Mem[0000000030001400] = 00000064, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000064
!	%f0  = 000000ff ffa90000 e2409144 00000000
!	%f4  = 9ad40000 531b2796 efcc72ee 98acc3ec
!	%f8  = 3476fa9a 00000000 0d395e8d 0910c436
!	%f12 = cafd3ef8 7fb3a4b5 300dad54 715bda5d
	stda	%f0,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000030141400] = 3a6e5eb200000000, %l6 = 0000000000000053
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = 3a6e5eb200000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = ff4c04a7, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_148:
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = 39643cff00ff0000
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	%l1 = 00000000e2409144, Mem[0000000030001410] = b25e6e3a
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = e2409144
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010181400] = 96271b53 00000000
	stda	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 ffffffff
!	%l3 = 00000000000000ff, Mem[0000000010101422] = 96271b53, %asi = 80
	stha	%l3,[%i4+0x022]%asi	! Mem[0000000010101420] = 962700ff
!	%f18 = b25e6e3a 14994e34, %l6 = 3a6e5eb200000000
!	Mem[0000000010001408] = ff00000000000000
	add	%i0,0x008,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010001408] = ff00000000000000
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010041408] = 7fb3a4b5 d4ff00ff
	std	%l6,[%i1+%o4]		! Mem[0000000010041408] = 00000000 ffffffff
!	Mem[0000000030101408] = a6000000, %l2 = 00000000ff000000
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 000000a6000000ff
!	Mem[0000000010101400] = 3476fa9a, %l1 = 00000000e2409144
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 000000003476fa9a
!	%f18 = b25e6e3a 14994e34, Mem[0000000030081410] = ff000000 ff000000
	stda	%f18,[%i2+%o5]0x89	! Mem[0000000030081410] = b25e6e3a 14994e34
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l1 = 000000003476fa9a
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = ffffffffff000000

p0_label_149:
!	Mem[0000000010101408] = 000000a6, %l4 = 0000000000005eb2
	lduwa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000a6
!	Mem[0000000010141400] = ff000000, %l6 = 3a6e5eb200000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = ff3c643900003cff, %f28 = 000000ff ffffffff
	ldda	[%i1+%g0]0x89,%f28	! %f28 = ff3c6439 00003cff
!	Mem[0000000010141420] = 00000000, %l3 = 00000000000000ff
	lduw	[%i5+0x020],%l3		! %l3 = 0000000000000000
!	Mem[0000000030041408] = 0000a9ff, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 180000ff, %f16 = ae000000
	lda	[%i2+%o5]0x88,%f16	! %f16 = 180000ff
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010181408] = fa000000, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = ff3c000039643cff, %f16 = 180000ff 00000000
	ldda	[%i1+%g0]0x81,%f16	! %f16 = ff3c0000 39643cff
!	Mem[00000000100c1400] = ff00000000000000, %l5 = ffa9000039643cff
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%f6  = efcc72ee 98acc3ec, %l0 = 0000000000000064
!	Mem[0000000010141438] = 3476fa9aa2accc07
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010141438] = 3476fa9aa2accc07

p0_label_150:
!	%l1 = ffffffffff000000, Mem[0000000010141400] = 000000ff, %asi = 80
	stha	%l1,[%i5+0x000]%asi	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010141400] = 000000ff, %l5 = ff00000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010181400] = ffffffff00000000
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	%l2 = 00000000000000a6, Mem[0000000010081408] = 0000ffff
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000a6
!	%l7 = ffffffffffffffff, Mem[0000000010181408] = fa000000
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	%l3 = 00000000000000ff, Mem[0000000010101430] = abffbfa6d0e53964
	stx	%l3,[%i4+0x030]		! Mem[0000000010101430] = 00000000000000ff
!	%f4  = 9ad40000 531b2796, Mem[0000000010041428] = ffff7c07 00000000
	stda	%f4 ,[%i1+0x028]%asi	! Mem[0000000010041428] = 9ad40000 531b2796
!	%f16 = ff3c0000 39643cff, Mem[0000000010181410] = 715bda5d 300dad54
	stda	%f16,[%i6+%o5]0x88	! Mem[0000000010181410] = ff3c0000 39643cff
!	%f20 = 39643cff, Mem[0000000010141400] = ff0000ff
	sta	%f20,[%i5+%g0]0x80	! Mem[0000000010141400] = 39643cff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_151:
!	Mem[0000000010181410] = ff3c6439, %l1 = ffffffffff000000
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ff3c6439
!	Mem[0000000010081400] = ffff3f32, %l4 = 00000000000000a6
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010081408] = 000000a6, %l0 = 0000000000000064
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = e5a900ffa6000000, %f12 = cafd3ef8 7fb3a4b5
	ldda	[%i2+%o4]0x88,%f12	! %f12 = e5a900ff a6000000
!	Mem[0000000030001400] = e4e4fbae00000064, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = e4e4fbae00000064
!	Mem[0000000010101428] = 34fffa9a ff3c6439, %l0 = 00000000, %l1 = ff3c6439
	ldd	[%i4+0x028],%l0		! %l0 = 0000000034fffa9a 00000000ff3c6439
!	Mem[0000000030001410] = 449140e2, %l1 = 00000000ff3c6439
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000449140e2
!	Mem[000000001014143c] = a2accc07, %l4 = 000000000000ffff
	ldsw	[%i5+0x03c],%l4		! %l4 = ffffffffa2accc07
!	Mem[0000000030081400] = e5a90000, %l1 = 00000000449140e2
	lduha	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000020800000] = ff64160c
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = 0064160c

p0_label_152:
!	Mem[0000000010141414] = 9afa7634, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x014]%asi,%l3	! %l3 = 000000009afa7634
!	%l4 = ffffffffa2accc07, Mem[0000000010081410] = 180000ff
	stha	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 1800cc07
!	%l2 = 00000000000000a6, Mem[0000000010081410] = 1800cc07
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 180000a6
!	Mem[0000000010001400] = 3476fa9a, %l6 = e4e4fbae00000064
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000034000000ff
!	%l6 = 0000000000000034, Mem[0000000030101400] = ffffffff
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 34ffffff
!	Mem[0000000030041410] = ffff00ff, %l0 = 0000000034fffa9a
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1420] = 12970024, %l3 = 000000009afa7634
	ldstuba	[%i3+0x020]%asi,%l3	! %l3 = 00000012000000ff
!	Mem[0000000010141400] = ff3c6439, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000039000000ff
!	Mem[0000000010141410] = 00000039, %l7 = 0000000000000039
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000039
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffb8004a, %l4 = ffffffffa2accc07
	ldsha	[%i0+%o5]0x88,%l4	! %l4 = 000000000000004a

p0_label_153:
!	Mem[0000000030001410] = 344e9914 449140e2, %l6 = 00000034, %l7 = 00000039
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000449140e2 00000000344e9914
!	Mem[0000000010141408] = 000000ffffffffff, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l5	! %l5 = 000000ffffffffff
!	Mem[000000001018140c] = 00ffeba3, %l5 = 000000ffffffffff
	lduba	[%i6+0x00e]%asi,%l5	! %l5 = 00000000000000eb
!	Mem[0000000030001410] = 449140e2, %l5 = 00000000000000eb
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 00000000000040e2
!	Mem[0000000030041408] = ffa90000, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 000000000000ffa9
!	Mem[0000000020800040] = ff0055e8, %l0 = 00000000000000ff
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000ff00
!	Mem[0000000010041408] = 00000000, %l7 = 00000000344e9914
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 9ad40000531b2796, %l6 = 00000000449140e2
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 9ad40000531b2796
!	Mem[0000000030181408] = e2409144, %l1 = 000000000000ffa9
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffffe2409144
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 00000000000000ff
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000

p0_label_154:
!	%l5 = 00000000000040e2, Mem[0000000030181410] = 9ad40000531b2796
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000000040e2
!	%f10 = 0d395e8d 0910c436, %l7 = 0000000000000000
!	Mem[0000000010181410] = ff3c643900003cff
	add	%i6,0x010,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181410] = ff3c643900003cff
!	%l3 = 0000000000000012, Mem[0000000030181400] = 000000ffffa90000
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000012
!	Mem[0000000030001400] = 00000064, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000064
!	%f25 = 00000064, Mem[0000000030081408] = a7044cff
	sta	%f25,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000064
!	%f20 = 39643cff a6000000, Mem[0000000030141400] = 00000000 3a6e5eb2
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = 39643cff a6000000
!	%l3 = 0000000000000012, Mem[00000000100c1438] = 2d9ba747d22b2f95
	stx	%l3,[%i3+0x038]		! Mem[00000000100c1438] = 0000000000000012
!	%l2 = 00000000000000a6, Mem[000000001014140e] = ff000000
	stb	%l2,[%i5+0x00e]		! Mem[000000001014140c] = ff00a600
!	Mem[0000000021800180] = ffff028c, %l4 = 000000000000004a
	ldstub	[%o3+0x180],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff167a, %l6 = 9ad40000531b2796
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff

p0_label_155:
!	Mem[0000000010001414] = ff000000, %l3 = 0000000000000012
	lduba	[%i0+0x014]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = ff643cff ffffffff, %l0 = 0000ff00, %l1 = e2409144
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ff643cff 00000000ffffffff
!	Mem[0000000030001408] = ff646698, %l1 = 00000000ffffffff
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ff64
!	Mem[0000000030041408] = ffa90000, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffa90000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[000000001004140c] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i1+0x00c]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000ffffffff, %f6  = efcc72ee 98acc3ec
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = 00000000 ffffffff
!	Mem[0000000010141400] = ffffffffff3c64ff, %f18 = b25e6e3a 14994e34
	ldda	[%i5+%g0]0x88,%f18	! %f18 = ffffffff ff3c64ff
!	Mem[0000000010181408] = a3ebff00ffffffff, %f6  = 00000000 ffffffff
	ldda	[%i6+%o4]0x88,%f6 	! %f6  = a3ebff00 ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 0000d49a, %l7 = 0000000000000064
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 000000000000d49a

p0_label_156:
!	%l6 = 00000000000000ff, Mem[0000000010141408] = ffffffff
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	Mem[0000000030101410] = 3476fa9a, %l1 = 000000000000ff64
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 000000003476fa9a
!	%f24 = e4e4fbae 00000064, Mem[0000000010141400] = ff643cff ffffffff
	stda	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = e4e4fbae 00000064
!	Mem[00000000300c1410] = 000000ff, %l2 = 00000000000000a6
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141410] = 00000039, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000039
!	%l1 = 000000003476fa9a, Mem[000000001018141d] = 39643cff
	stb	%l1,[%i6+0x01d]		! Mem[000000001018141c] = 399a3cff
!	%l6 = 0000000000000039, Mem[0000000010141400] = 64000000aefbe4e4
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000039
!	%l6 = 0000000000000039, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000039
!	Mem[0000000030181410] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff3c6439e5a90000, %l2 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = ff3c6439e5a90000

p0_label_157:
!	Mem[0000000010181418] = 1800a97f, %l0 = 00000000ff643cff
	lduh	[%i6+0x01a],%l0		! %l0 = 000000000000a97f
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000000000039
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = ff000000, %l1 = 000000003476fa9a
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = 70000000000000ff, %f20 = 39643cff a6000000
	ldda	[%i3+%o4]0x89,%f20	! %f20 = 70000000 000000ff
!	Mem[0000000020800040] = ff0055e8, %l0 = 000000000000a97f
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = ffffffffffa90000
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141428] = a7044cae, %f25 = 00000064
	ld	[%i5+0x028],%f25	! %f25 = a7044cae
!	Mem[0000000010041408] = 00000039, %l7 = 000000000000d49a
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000039
!	Mem[0000000010041408] = 39000000, %f8  = 3476fa9a
	lda	[%i1+%o4]0x80,%f8 	! %f8 = 39000000
!	Starting 10 instruction Store Burst
!	%f17 = 39643cff, Mem[00000000100c1408] = 00ff0000
	sta	%f17,[%i3+%o4]0x88	! Mem[00000000100c1408] = 39643cff

p0_label_158:
!	Mem[0000000030081408] = 00000064, %l7 = 0000000000000039
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000064000000ff
!	Mem[000000001008142c] = ffffffff, %l3 = 00000000, %l0 = 00000000
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000ffffffff
!	%f25 = a7044cae, Mem[0000000030001408] = ff646698
	sta	%f25,[%i0+%o4]0x81	! Mem[0000000030001408] = a7044cae
!	%l2 = ff3c6439e5a90000, Mem[00000000201c0000] = ffff167a, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000167a
!	Mem[000000001014140c] = ff00a600, %l6 = 000000ff, %l4 = 00000000
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff00a600
!	Mem[000000001014142a] = a7044cae, %l2 = ff3c6439e5a90000
	ldstuba	[%i5+0x02a]%asi,%l2	! %l2 = 0000004c000000ff
!	Mem[0000000010181408] = ffffffff, %l4 = 00000000ff00a600
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000010141410] = ff000000000000ff
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000ffffffff
!	Mem[0000000030101400] = ffffff34, %l2 = 000000000000004c
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 00000034000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000ff000000, %f22 = 1800a9e5 39643cff
	ldda	[%i3+%o5]0x81,%f22	! %f22 = ff000000 ff000000

p0_label_159:
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = e5a900ffffff00ff, %f4  = 9ad40000 531b2796
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = e5a900ff ffff00ff
!	Mem[00000000100c1410] = 64000000, %l7 = 0000000000000064
	ldsha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000006400
!	Mem[0000000030001400] = 00000000, %l4 = 00000000ffffffff
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 0000ff3c, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 000000000000ff3c
!	Mem[00000000300c1408] = 70000000000000ff, %l7 = 0000000000006400
	ldxa	[%i3+%o4]0x89,%l7	! %l7 = 70000000000000ff
!	Mem[0000000030181410] = ffffffff, %l1 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l7 = 70000000000000ff
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[000000001000140c] = 00000000
	stw	%l1,[%i0+0x00c]		! Mem[000000001000140c] = ffffffff

p0_label_160:
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010101420] = 962700ff 00000068
	std	%l6,[%i4+0x020]		! Mem[0000000010101420] = 000000ff 00000000
!	%l2 = 0000000000000034, Mem[0000000030041400] = 00003cff
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000034
!	Mem[00000000201c0000] = 0000167a, %l3 = 000000000000ff3c
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l5 = 00000000000040e2
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010181438] = 2d9ba747 00000000
	std	%l6,[%i6+0x038]		! Mem[0000000010181438] = 000000ff 00000000
!	%l6 = 00000000000000ff, Mem[00000000100c1410] = 64000000531b2796
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[0000000010101431] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+0x031]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1417] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i3+0x017]%asi,%l6	! %l6 = 000000ff000000ff
!	%f23 = ff000000, Mem[0000000030041410] = ff00ffff
	sta	%f23,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000ffffffff, %l4 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ffffffff

p0_label_161:
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000034
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041418] = 000000ff00000000, %l0 = 0000000000000000
	ldx	[%i1+0x018],%l0		! %l0 = 000000ff00000000
!	Mem[0000000010181408] = ff00a600, %f28 = ff3c6439
	lda	[%i6+%o4]0x80,%f28	! %f28 = ff00a600
!	Mem[0000000010041438] = 170fa9bb, %l4 = 00000000ffffffff
	ldswa	[%i1+0x038]%asi,%l4	! %l4 = 00000000170fa9bb
!	Mem[0000000010081410] = a6000018, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffa6
!	Mem[00000000201c0000] = ff00167a, %l2 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000170fa9bb
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = e2409144, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffe240
!	Mem[0000000030181408] = 449140e2, %l2 = ffffffffffffffff
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000e2
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ae4c04a7, %l6 = ffffffffffffffa6
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ae4c04a7

p0_label_162:
!	Mem[0000000010101400] = e2409144, %l3 = ffffffffffffe240
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000e2409144
!	Mem[0000000010081410] = a6000018, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000a6000000ff
!	%l7 = 00000000000000a6, Mem[00000000211c0000] = ff69fe22
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00a6fe22
!	%f10 = 0d395e8d 0910c436, Mem[00000000100c1410] = 00000000 000000ff
	stda	%f10,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0d395e8d 0910c436
!	Mem[0000000020800040] = ff0055e8, %l1 = ffffffffffffffff
	ldstub	[%o1+0x040],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000030081408] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000201c0000] = ff00167a, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff167a
!	%l3 = 00000000e2409144, Mem[0000000010041400] = 00000000
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00009144
!	Mem[0000000030041400] = 34000000, %l6 = 00000000ae4c04a7
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000034000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %f11 = 0910c436
	lda	[%i4+%o4]0x89,%f11	! %f11 = 000000ff

p0_label_163:
!	Mem[0000000030141410] = 00000000a3ebff00, %f0  = 000000ff ffa90000
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = 00000000 a3ebff00
!	Mem[00000000100c1408] = 39643cff, %l5 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181438] = 000000ff, %l7 = 00000000000000a6
	ldsha	[%i6+0x038]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ff3c6439, %l2 = 00000000000000e2
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 000000000000ff3c
!	Mem[00000000100c1410] = 0d395e8d0910c436, %l2 = 000000000000ff3c
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = 0d395e8d0910c436
!	Mem[0000000010141400] = 39000000, %l1 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000039
!	Mem[0000000010101408] = 000000a6, %l7 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000a6
!	Mem[0000000021800000] = 0024a558, %l3 = 00000000e2409144
	ldsb	[%o3+%g0],%l3		! %l3 = 0000000000000000
!	Mem[000000001018140c] = 00ffeba3, %l0 = 000000ff00000000
	ldsb	[%i6+0x00c],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001410] = 4a00b8ff ff000000
	std	%l4,[%i0+%o5]		! Mem[0000000010001410] = 000000ff 000000ff

p0_label_164:
!	%f11 = 000000ff, Mem[0000000010001408] = 000040e2
	sta	%f11,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%f24 = e4e4fbae a7044cae, Mem[0000000030081410] = 344e9914 3a6e5eb2
	stda	%f24,[%i2+%o5]0x81	! Mem[0000000030081410] = e4e4fbae a7044cae
!	%l6 = 34000000, %l7 = 000000a6, Mem[0000000010001410] = ff000000 ff000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 34000000 000000a6
!	%f14 = 300dad54 715bda5d, Mem[0000000010181438] = 000000ff 00000000
	std	%f14,[%i6+0x038]	! Mem[0000000010181438] = 300dad54 715bda5d
!	Mem[0000000030041400] = a7044cae, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ae000000ff
!	Mem[0000000010101430] = 00ff0000, %l1 = 00000039, %l3 = 000000ae
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000ff0000
!	%f10 = 0d395e8d 000000ff, Mem[0000000010101410] = 0000d49a 39646698
	stda	%f10,[%i4+0x010]%asi	! Mem[0000000010101410] = 0d395e8d 000000ff
!	%l7 = 00000000000000a6, Mem[00000000300c1408] = ff000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00a60000
!	Mem[0000000010041400] = 44910000, %l7 = 00000000000000a6
	ldstuba	[%i1+0x000]%asi,%l7	! %l7 = 00000044000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %f29 = 00003cff
	lda	[%i0+%g0]0x81,%f29	! %f29 = 00000000

p0_label_165:
!	Mem[0000000010041400] = ff910000, %l0 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041400] = ff9100009afa7634, %l1 = 0000000000000039
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = ff9100009afa7634
!	Mem[0000000030141410] = 00000000, %f21 = 000000ff
	lda	[%i5+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[0000000020800040] = ff0055e8, %l2 = 0d395e8d0910c436
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000ff00
!	Mem[0000000030001410] = 344e9914 449140e2, %l6 = 34000000, %l7 = 00000044
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000449140e2 00000000344e9914
!	Mem[0000000010181438] = 300dad54 715bda5d, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i6+0x038]%asi,%l4	! %l4 = 00000000300dad54 00000000715bda5d
!	Mem[0000000030101410] = 0000ff64, %l4 = 00000000300dad54
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010181400] = 00000000 00000000 ff00a600 00ffeba3
!	Mem[0000000010181410] = ff3c6439 00003cff 1800a97f 399a3cff
!	Mem[0000000010181420] = 1297b923 26277469 7f96be20 7fb3a4b5
!	Mem[0000000010181430] = 52000000 ff643cf2 300dad54 715bda5d
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030041410] = 000000ff, %l1 = ff9100009afa7634
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (31)
!	%f16 = ff3c0000, Mem[000000001018143c] = 715bda5d
	st	%f16,[%i6+0x03c]	! Mem[000000001018143c] = ff3c0000

p0_label_166:
!	%l3 = 0000000000ff0000, Mem[0000000030181400] = 0000000000000012
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000ff0000
!	Mem[00000000100c1428] = 7f96be20, %l5 = 715bda5d, %l0 = ffffffff
	add	%i3,0x28,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 000000007f96be20
!	%l5 = 00000000715bda5d, Mem[0000000021800080] = d128571f
	stb	%l5,[%o3+0x080]		! Mem[0000000021800080] = 5d28571f
!	%l5 = 00000000715bda5d, Mem[0000000010001410] = 000000a634000000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000715bda5d
!	%l4 = 00000000, %l5 = 715bda5d, Mem[00000000100c1410] = 8d5e390d 36c41009
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 715bda5d
!	Mem[0000000010001410] = 715bda5d, %l0 = 000000007f96be20
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 0000005d000000ff
!	%l7 = 00000000344e9914, Mem[0000000030001410] = e2409144
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 344e9914
!	%l7 = 00000000344e9914, Mem[00000000300c1410] = 000000ff
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00009914
!	%f20 = 70000000 00000000, %l5 = 00000000715bda5d
!	Mem[0000000010141420] = 000000003a6e5eb2
	add	%i5,0x020,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010141420] = 0000000000000070
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000a6, %l5 = 00000000715bda5d
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_167:
!	Mem[0000000030141400] = a6000000, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ffffffff 00000000, %l0 = 0000005d, %l1 = ffffffff
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[0000000010041408] = 39000000, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000039
!	Mem[0000000030001410] = 344e991414994e34, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 344e991414994e34
!	Mem[0000000010081410] = 531b2796180000ff, %f14 = 5dda5b71 54ad0d30
	ldda	[%i2+%o5]0x88,%f14	! %f14 = 531b2796 180000ff
!	Mem[0000000010141400] = 00000039, %l6 = 00000000449140e2
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000039
!	Mem[0000000021800000] = 0024a558, %l5 = 0000000000000000
	lduba	[%o3+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 39643cff, %l1 = 00000000ffffffff
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 0000000039643cff
!	Mem[0000000010081408] = 000000a6, %l6 = 0000000000000039
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 39643cff, %l7 = 00000000344e9914
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_168:
!	%l0 = 0000000000000039, Mem[00000000300c1400] = 0000000000000000
	stxa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000039
!	%l5 = 0000000000000000, Mem[0000000010001406] = 00000000
	sth	%l5,[%i0+0x006]		! Mem[0000000010001404] = 00000000
!	%f16 = ff3c0000 39643cff ffffffff ff3c64ff
!	%f20 = 70000000 00000000 ff000000 ff000000
!	%f24 = e4e4fbae a7044cae 39643cff 9afa7634
!	%f28 = ff00a600 00000000 9ad40000 531b2796
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[0000000010081408] = a6000000, %l4 = 344e991414994e34
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010001408] = 000000ff ffffffff
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000000ff
!	%l4 = 0000000000000000, Mem[0000000010001428] = 00000000000000ff, %asi = 80
	stxa	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000000000000
!	%l2 = 000000000000ff00, Mem[00000000300c1408] = 700000000000a600
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000000000ff00
!	%l7 = 00000000000000ff, Mem[0000000010041400] = ff910000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%f4  = ff3c0000, Mem[0000000010081400] = ffff3f32
	sta	%f4 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff3c0000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = 7fb3a4b5, %l0 = 0000000000000039
	lduwa	[%i3+0x02c]%asi,%l0	! %l0 = 000000007fb3a4b5

p0_label_169:
!	Mem[0000000030141400] = a6000000, %l2 = 000000000000ff00
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = ffffe240a2accca2, %l2 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ffffe240a2accca2
!	Mem[0000000010081410] = 180000ff, %l1 = 0000000039643cff
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001010142c] = ff3c6439, %l7 = 00000000000000ff
	ldsh	[%i4+0x02e],%l7		! %l7 = 0000000000006439
!	Mem[0000000030141408] = ff25003e00000000, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = ff25003e00000000
!	Mem[0000000030001410] = 14994e34, %f15 = 180000ff
	lda	[%i0+%o5]0x89,%f15	! %f15 = 14994e34
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = ff0000a6 ff00a9e5, %l0 = 7fb3a4b5, %l1 = ffffffff
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff0000a6 00000000ff00a9e5
!	Mem[0000000010081408] = a60000ff, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f10 = b5a4b37f, Mem[000000001018141c] = 000000ff
	sta	%f10,[%i6+0x01c]%asi	! Mem[000000001018141c] = b5a4b37f

p0_label_170:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030141410] = 00000000 00ffeba3
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000
!	%f8  = 69742726 23b99712, Mem[0000000030101408] = ff000000 ffffffff
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 69742726 23b99712
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030141408] = 00000000 ff25003e
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 00000000
!	Mem[0000000010041410] = 0000ff3c, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000000000ff3c
!	%l4 = 000000000000ff3c, Mem[0000000010141408] = ffffffff
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ff3cffff
!	%l2 = ffffe240a2accca2, Mem[0000000010181414] = 00000070, %asi = 80
	stwa	%l2,[%i6+0x014]%asi	! Mem[0000000010181414] = a2accca2
!	Mem[0000000010081400] = 00003cff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%f6  = ff3c9a39 7fa90018, %l1 = 00000000ff00a9e5
!	Mem[0000000010001408] = 00000000ff000000
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001408] = 18000000399a0000
!	%l3 = 0000000000ff0000, Mem[0000000010101410] = 8d5e390d
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 8d5e3900
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l1 = 00000000ff00a9e5
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffff00

p0_label_171:
!	Mem[00000000300c1400] = 0000000000000039, %f2  = a3ebff00 00a600ff
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 00000000 00000039
!	Mem[0000000030101408] = 1297b923 26277469, %l4 = 0000ff3c, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000026277469 000000001297b923
!	Mem[0000000030041410] = ff000000, %l0 = 00000000ff0000a6
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010001400] = ff76fa9a, %l7 = 0000000000006439
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000ff76
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010181410] = 00000000a2accca2, %l4 = 0000000026277469
	ldxa	[%i6+0x010]%asi,%l4	! %l4 = 00000000a2accca2
!	Mem[0000000010001430] = abffbfa6 00000000, %l4 = a2accca2, %l5 = 1297b923
	ldda	[%i0+0x030]%asi,%l4	! %l4 = 00000000abffbfa6 0000000000000000
!	Mem[0000000010081410] = ff000018, %l4 = 00000000abffbfa6
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff000018
!	Mem[0000000020800000] = 0064160c, %l0 = ffffffffff000000
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000064
!	Mem[0000000010001400] = ff76fa9a 00000000 18000000 399a0000
!	Mem[0000000010001410] = ffda5b71 00000000 00000070 e5ff0018
!	Mem[0000000010001420] = ff3cffff 00000068 00000000 00000000
!	Mem[0000000010001430] = abffbfa6 00000000 0000fa9a ff3c6439
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	%l2 = a2accca2, %l3 = 00ff0000, Mem[0000000010181400] = ff3c6439 00003cff
	stda	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = a2accca2 00ff0000

p0_label_172:
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000064
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1430] = ff3c6439, %l4 = 00000000ff000018
	ldstuba	[%i3+0x030]%asi,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000ff0000, Mem[0000000010041408] = 39000000ffffffff
	stx	%l3,[%i1+%o4]		! Mem[0000000010041408] = 0000000000ff0000
!	Mem[00000000201c0001] = 00ff167a, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101410] = 0000ff64, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = 000000ff, %l1 = ffffff00, Mem[0000000030081400] = e5a90000 ff3c6439
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff ffffff00
!	%f22 = ff000000 ff000000, Mem[0000000030141410] = 00000000 00000000
	stda	%f22,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000 ff000000
	membar	#Sync			! Added by membar checker (33)
!	%l1 = ffffffffffffff00, Mem[0000000010001408] = 00000018
	stha	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff00
!	%f4  = ffda5b71 00000000, Mem[0000000010001430] = abffbfa6 00000000
	stda	%f4 ,[%i0+0x030]%asi	! Mem[0000000010001430] = ffda5b71 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000a6, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000a6

p0_label_173:
!	Mem[0000000010141420] = 00000000 00000070, %l0 = 000000ff, %l1 = ffffff00
	ldd	[%i5+0x020],%l0		! %l0 = 0000000000000000 0000000000000070
!	Mem[0000000010081410] = 531b2796 180000ff, %l4 = 000000a6, %l5 = 00000000
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000180000ff 00000000531b2796
!	Mem[0000000030001400] = 00000000 aefbe4e4 a6ffffff d1000000
!	Mem[0000000030001410] = 344e9914 14994e34 94b29ddc 39643cff
!	Mem[0000000030001420] = 11013de0 f9b9886a 00000792 14994e2b
!	Mem[0000000030001430] = 000000ff ff000000 fe4b67b9 46c0ca02
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181400] = 00000000, %l7 = 000000000000ff76
	lduba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 0000ff00, %l3 = 0000000000ff0000
	ldsha	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffff00
!	Mem[000000001010141c] = e5a90018, %l4 = 00000000180000ff
	lduwa	[%i4+0x01c]%asi,%l4	! %l4 = 00000000e5a90018
!	Mem[0000000030181408] = 00000000449140e2, %l4 = 00000000e5a90018
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = 00000000449140e2
!	Mem[0000000010101400] = ffffe240, %l5 = 00000000531b2796
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = e2409144, %l1 = 0000000000000070
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000e2
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (34)
!	%f0  = ff76fa9a, Mem[0000000030001410] = 14994e34
	sta	%f0 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ff76fa9a

p0_label_174:
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001416] = 00000000, %asi = 80
	stha	%l6,[%i0+0x016]%asi	! Mem[0000000010001414] = 000000ff
!	Mem[0000000010181430] = 00000000, %l1 = 000000e2, %l4 = 449140e2
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	%l1 = 00000000000000e2, Mem[0000000030081408] = 000000ff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000e2
!	%f16 = 00000000 aefbe4e4, Mem[0000000010081410] = 180000ff 531b2796
	stda	%f16,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 aefbe4e4
!	%l4 = 0000000000000000, Mem[0000000010181400] = a2ccaca2
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = a2ccac00
!	%l6 = 00000000000000ff, Mem[0000000030041400] = a7044cff
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%f25 = f9b9886a, Mem[0000000030181400] = 00000000
	sta	%f25,[%i6+%g0]0x81	! Mem[0000000030181400] = f9b9886a
!	%f12 = abffbfa6 00000000, Mem[0000000010101400] = ffffe240 a2accca2
	stda	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = abffbfa6 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 39000000, %l7 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = 0000000039000000

p0_label_175:
!	Mem[0000000010141420] = 00000000, %f7  = e5ff0018
	lda	[%i5+0x020]%asi,%f7 	! %f7 = 00000000
!	Mem[0000000030141400] = a6000000, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff000000715bdaff, %f24 = 11013de0 f9b9886a
	ldda	[%i0+%o5]0x88,%f24	! %f24 = ff000000 715bdaff
!	Mem[00000000300c1400] = 39000000 00000000, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 0000000039000000 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l3 = ffffffffffffff00
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff167a, %l7 = 0000000039000000
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 6a88b9f9, %l1 = 00000000000000e2
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 000000000000b9f9
!	Mem[0000000010101408] = a6000000ff3c6439, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = a6000000ff3c6439
!	Mem[0000000010001400] = ff76fa9a00000000, %f0  = ff76fa9a 00000000
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = ff76fa9a 00000000
!	Starting 10 instruction Store Burst
!	%f29 = ff000000, Mem[00000000100c1438] = 00000000
	sta	%f29,[%i3+0x038]%asi	! Mem[00000000100c1438] = ff000000

p0_label_176:
!	Mem[0000000010081408] = ff0000a6, %l0 = a6000000ff3c6439
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f14 = 0000fa9a ff3c6439, %l4 = 0000000039000000
!	Mem[0000000030101400] = ffffffffa6ed2c14
	stda	%f14,[%i4+%l4]ASI_PST16_SL ! Mem[0000000030101400] = ffffffffa6ed2c14
!	%l7 = 00000000000000ff, Mem[0000000010101408] = a6000000
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Mem[00000000218000c1] = 00ffff0b, %l1 = 000000000000b9f9
	ldstuba	[%o3+0x0c1]%asi,%l1	! %l1 = 000000ff000000ff
!	%l2 = a2accca2, %l3 = ffffffff, Mem[0000000010081408] = ff0000a6 ff00a9e5
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = a2accca2 ffffffff
!	Mem[0000000010041410] = ffffffff00000000, %f6  = 00000070 00000000
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = ffffffff 00000000
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%f28 = 000000ff ff000000, Mem[0000000030081410] = e4e4fbae a7044cae
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_177:
!	Mem[0000000030081408] = e2000000, %l2 = ffffe240a2accca2
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 000000000000e200
!	Mem[0000000030101410] = ff00ff64 39643cff, %l4 = 39000000, %l5 = 00000000
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff00ff64 0000000039643cff
!	Mem[0000000010101408] = 000000ffff3c6439, %f0  = ff76fa9a 00000000
	ldda	[%i4+%o4]0x80,%f0 	! %f0  = 000000ff ff3c6439
!	Mem[0000000030041410] = ff000000, %f27 = 14994e2b
	lda	[%i1+%o5]0x81,%f27	! %f27 = ff000000
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 00000000000000ff
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141428] = a704ffae, %l0 = 0000000000000000
	lduwa	[%i5+0x028]%asi,%l0	! %l0 = 00000000a704ffae
!	Mem[00000000100c1410] = 715bda5d 00000000, %l0 = a704ffae, %l1 = 00000000
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000715bda5d
!	Starting 10 instruction Store Burst
!	%l4 = ff00ff64, %l5 = 39643cff, Mem[0000000010181410] = 00000000 a2accca2
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ff00ff64 39643cff

p0_label_178:
!	Mem[0000000030081408] = 000000e2, %l5 = 0000000039643cff
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000e2000000ff
!	%f31 = 46c0ca02, Mem[0000000010141400] = 39000000
	st	%f31,[%i5+%g0]		! Mem[0000000010141400] = 46c0ca02
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000000
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000030181400] = 6a88b9f9, %l1 = 00000000715bda5d
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 000000006a88b9f9
!	Mem[0000000010141400] = 46c0ca02, %l4 = 00000000ff00ff64
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 00000046000000ff
!	%l1 = 000000006a88b9f9, Mem[0000000010181408] = ff3c64ff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = ff3c64f9
!	%l4 = 0000000000000046, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 46000000
!	%f16 = 00000000, Mem[0000000030041400] = ff000000
	sta	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l0 = 00000000, %l1 = 6a88b9f9, Mem[0000000010081400] = ff3c0000 ffffffff
	std	%l0,[%i2+%g0]		! Mem[0000000010081400] = 00000000 6a88b9f9
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff000000ff, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_179:
!	Mem[0000000030041400] = 00000000, %l0 = 000000ff000000ff
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181438] = 96271b530000d49a, %f8  = ff3cffff 00000068
	ldda	[%i6+0x038]%asi,%f8 	! %f8  = 96271b53 0000d49a
!	Mem[0000000030141410] = 000000ff, %l2 = 000000000000e200
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 0000000000000039, %f28 = 000000ff ff000000
	ldda	[%i3+%g0]0x89,%f28	! %f28 = 00000000 00000039
!	Mem[0000000030141408] = 0000000000000000, %f26 = 00000792 ff000000
	ldda	[%i5+%o4]0x81,%f26	! %f26 = 00000000 00000000
!	Mem[0000000010081410] = e4e4fbae00000000, %l1 = 000000006a88b9f9
	ldxa	[%i2+0x010]%asi,%l1	! %l1 = e4e4fbae00000000
!	Mem[0000000010181400] = a2ccac00, %l6 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 00ff167a, %l1 = e4e4fbae00000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000020800040] = ff0055e8, %l6 = 0000000000000000
	ldub	[%o1+0x041],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143a] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i3+0x03a]%asi,%l3	! %l3 = 00000000000000ff

p0_label_180:
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = 0000000000000064
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	Mem[0000000010181410] = 64ff00ff, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000046, Mem[0000000030101408] = 26277469
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 26270046
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030081410] = ff000000 000000ff
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 000000ff
!	Mem[0000000010181400] = 00accca2, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000accca2
!	Mem[00000000300c1410] = 00009914, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000009914
!	%l0 = 00000000000000ff, Mem[0000000010081410] = e4e4fbae00000000
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l5 = 00000000000000e2
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000 8d5e3900, %l2 = 00009914, %l3 = 00000000
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 000000008d5e3900 00000000ff000000

p0_label_181:
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000046
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c143c] = 00000012, %l6 = 0000000000000000
	lduha	[%i3+0x03e]%asi,%l6	! %l6 = 0000000000000012
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 00000000 02cac0ff, %l6 = 00000012, %l7 = 00000000
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000002cac0ff 0000000000000000
!	Mem[0000000030101410] = ff00ff64, %l2 = 000000008d5e3900
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1418] = 00000000, %l3 = 00000000ff000000
	lduba	[%i3+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000000ffffffff, %f20 = 344e9914 14994e34
	ldda	[%i5+%o5]0x80,%f20	! %f20 = 00000000 ffffffff
!	Mem[0000000010081408] = ffffffff a2ccaca2, %l0 = 00000000, %l1 = 00accca2
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000a2ccaca2 00000000ffffffff
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[0000000020800000] = 0064160c, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = ff64160c

p0_label_182:
!	%f8  = 96271b53 0000d49a, Mem[0000000010081400] = e2000000 f9b9886a
	stda	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 96271b53 0000d49a
!	%l0 = 00000000a2ccaca2, Mem[00000000100c1410] = 00000000
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = a2ccaca2
!	%l5 = 0000000000000000, Mem[0000000021800140] = 231c5bff, %asi = 80
	stha	%l5,[%o3+0x140]%asi	! Mem[0000000021800140] = 00005bff
!	%l0 = 00000000a2ccaca2, Mem[0000000030101410] = 64ff00ff
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = a2ccaca2
!	%f2  = 18000000 399a0000, %l0 = 00000000a2ccaca2
!	Mem[0000000030081420] = 6ecc0b5f49a5b322
	add	%i2,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030081420] = 6ecc0b5f00000018
!	%f4  = ffda5b71 00000000, %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000ffffffff
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141410] = 00000000ffffffff
!	%f0  = 000000ff ff3c6439 18000000 399a0000
!	%f4  = ffda5b71 00000000 ffffffff 00000000
!	%f8  = 96271b53 0000d49a 00000000 00000000
!	%f12 = abffbfa6 00000000 0000fa9a ff3c6439
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (35)
!	Mem[000000001004141c] = 00000000, %l5 = 00000000, %l5 = 00000000
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081436] = 0000000f, %asi = 80
	stha	%l3,[%i2+0x036]%asi	! Mem[0000000010081434] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_183:
!	Mem[0000000030081408] = ff000000, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030141400] = a6000000, %l0 = 00000000a2ccaca2
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = ff000000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081408] = a2accca2 ffffffff, %l6 = 02cac0ff, %l7 = 0000ff00
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000a2accca2 00000000ffffffff
!	Mem[00000000100c1408] = 39643cff, %l2 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 0000000039643cff
!	Mem[0000000030101408] = 46002726, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = 0000000046002726
!	Mem[0000000010101400] = 00000000a6bfffab, %f10 = 00000000 00000000
	ldda	[%i4+%g0]0x88,%f10	! %f10 = 00000000 a6bfffab
!	Mem[0000000010101400] = a6bfffab, %l2 = 0000000039643cff
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = ffffffffa6bfffab
!	Mem[0000000020800000] = ff64160c, %l5 = ffffffffffffffff
	ldub	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ff3cffff, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_184:
!	Mem[0000000010101410] = 00395e8d, %l2 = ffffffffa6bfffab
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f10 = 00000000 a6bfffab, Mem[0000000030101408] = 46002726 23b99712
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 a6bfffab
!	Mem[0000000010081408] = a2accca2, %l3 = ffffffffff000000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000a2accca2
!	%f22 = 94b29ddc 39643cff, Mem[0000000030181400] = 5dda5b71 00ff0000
	stda	%f22,[%i6+%g0]0x81	! Mem[0000000030181400] = 94b29ddc 39643cff
!	Mem[0000000010041420] = 96271b530000d49a, %l0 = 0000000046002726, %l4 = 00000000000000ff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 96271b530000d49a
!	Mem[0000000010101400] = a6bfffab, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000a6bfffab
!	Mem[0000000010181400] = ff000000, %l5 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	%l4 = 0000d49a, %l5 = ff000000, Mem[0000000010081400] = 9ad40000 531b2796
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000d49a ff000000
!	%f12 = abffbfa6 00000000, Mem[0000000030141410] = 000000ff 000000ff
	stda	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = abffbfa6 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %f25 = 715bdaff
	lda	[%i1+%o5]0x89,%f25	! %f25 = 000000ff

p0_label_185:
!	Mem[00000000211c0000] = 00a6fe22, %l5 = 00000000ff000000
	ldub	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000021800040] = 23b5d7d7, %l2 = 00000000a6bfffab
	ldsb	[%o3+0x040],%l2		! %l2 = 0000000000000023
!	Mem[0000000030181408] = e2409144, %f12 = abffbfa6
	lda	[%i6+%o4]0x81,%f12	! %f12 = e2409144
!	Mem[0000000010081418] = 00000000, %f13 = 00000000
	lda	[%i2+0x018]%asi,%f13	! %f13 = 00000000
!	Mem[0000000030001410] = ff76fa9a, %l0 = 0000000046002726
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 00000000ff76fa9a
!	Mem[00000000100c1410] = a2ccaca2, %l0 = 00000000ff76fa9a
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffffa2
!	Mem[0000000010001408] = 0000ff00, %l2 = 0000000000000023
	ldsba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = a6ffffff d1000000, %l0 = ffffffa2, %l1 = ffffffff
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000a6ffffff 00000000d1000000
!	Mem[00000000100c1428] = 7f96be20, %l3 = 00000000a2accca2
	ldsb	[%i3+0x02b],%l3		! %l3 = 0000000000000020
!	Starting 10 instruction Store Burst
!	%l1 = 00000000d1000000, Mem[0000000020800040] = ff0055e8, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 000055e8

p0_label_186:
!	Mem[000000001010143c] = 40e20000, %l2 = 0000000000000000
	ldstuba	[%i4+0x03c]%asi,%l2	! %l2 = 00000040000000ff
!	%l0 = 00000000a6ffffff, Mem[0000000010041410] = ffda5b71
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff5b71
!	%l6 = 00000000a2accca2, Mem[0000000010181410] = ff00ff6439643cff
	stx	%l6,[%i6+%o5]		! Mem[0000000010181410] = 00000000a2accca2
!	Mem[0000000010141408] = ff3cffff, %l0 = a6ffffff, %l2 = 00000040
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 00000000ff3cffff
!	Mem[00000000100c1410] = a2ccaca2, %l1 = 00000000d1000000
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000a2000000ff
!	Mem[0000000030141408] = ff000000, %l1 = 00000000000000a2
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030141408] = ff000000, %l4 = 96271b530000d49a
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010141400] = ffc0ca02, %l3 = 0000000000000020
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l0 = 00000000a6ffffff, Mem[0000000010141408] = ff3cffff
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = ff3cffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l3 = 00000000000000ff
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff

p0_label_187:
!	Mem[0000000030101400] = ffffffff, %f4  = ffda5b71
	lda	[%i4+%g0]0x81,%f4 	! %f4 = ffffffff
!	Mem[0000000010081400] = 0000d49a, %f0  = 000000ff
	lda	[%i2+0x000]%asi,%f0 	! %f0 = 0000d49a
!	Mem[0000000010001408] = 00009a390000ff00, %f20 = 00000000 ffffffff
	ldda	[%i0+%o4]0x88,%f20	! %f20 = 00009a39 0000ff00
!	Mem[0000000010001400] = 9afa76ff, %l6 = 00000000a2accca2
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000076ff
!	Mem[0000000010101400] = 00000000 00000000, %l6 = 000076ff, %l7 = ffffffff
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030141408] = 9ad40000, %f20 = 00009a39
	lda	[%i5+%o4]0x89,%f20	! %f20 = 9ad40000
!	Mem[0000000030041408] = ff3c64390000a9ff, %f20 = 9ad40000 0000ff00
	ldda	[%i1+%o4]0x89,%f20	! %f20 = ff3c6439 0000a9ff
!	Mem[0000000010041400] = 000000ff, %f12 = e2409144
	lda	[%i1+%g0]0x80,%f12	! %f12 = 000000ff
!	Mem[00000000100c1410] = ffccaca25dda5b71, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = ffccaca25dda5b71
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = a2accca2, %l1 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000a2accca2

p0_label_188:
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 0000000000000000
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	%l0 = 00000000a6ffffff, Mem[0000000010141400] = ffc0ca02, %asi = 80
	stwa	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = a6ffffff
!	Mem[0000000030081410] = ff000000, %l1 = 00000000a2accca2
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 3900000000000000
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000010001418] = 00000070, %asi = 80
	stwa	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = ff000000
!	%l4 = 00000000ff000000, Mem[0000000010101400] = 000000ff
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	%f0  = 0000d49a ff3c6439, %l5 = 0000000000000000
!	Mem[0000000010141430] = b25e6e3a00000000
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141430] = b25e6e3a00000000
!	Mem[00000000100c1408] = 39643cff, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 00ffff0b, %l0 = 00000000a6ffffff
	ldsh	[%o3+0x0c0],%l0		! %l0 = 00000000000000ff

p0_label_189:
!	Mem[0000000010041408] = 00000018, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000018
!	Mem[00000000100c142c] = 7fb3a4b5, %l3 = 00000000000000ff
	ldsba	[%i3+0x02f]%asi,%l3	! %l3 = ffffffffffffffb5
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001014141c] = 14994e2b, %l4 = 00000000ff000000
	lduh	[%i5+0x01e],%l4		! %l4 = 0000000000004e2b
!	Mem[0000000010141400] = a6ffffff00000000, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = a6ffffff00000000
!	Mem[000000001018140c] = ffffffff, %l2 = 00000000ff3cffff
	ldub	[%i6+0x00f],%l2		! %l2 = 00000000000000ff
!	Mem[0000000021800140] = 00005bff, %l5 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l1 = a6ffffff00000000
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000004e2b
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = ff3c6439 0000a9ff, Mem[00000000100c1408] = 39643cff 39643cff
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff3c6439 0000a9ff

p0_label_190:
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101408] = 000000ffff3c6439
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081408] = 000000ff, %l3 = ffffffffffffffb5
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f16 = 00000000 aefbe4e4 a6ffffff d1000000
!	%f20 = ff3c6439 0000a9ff 94b29ddc 39643cff
!	%f24 = ff000000 000000ff 00000000 00000000
!	%f28 = 00000000 00000039 fe4b67b9 46c0ca02
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l6 = 0000000000000018, Mem[0000000010041420] = 96271b530000d49a
	stx	%l6,[%i1+0x020]		! Mem[0000000010041420] = 0000000000000018
!	Mem[0000000030081410] = ff000000, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = a6ffffff00000000, %l6 = 0000000000000018
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = a6ffffff00000000

p0_label_191:
!	Mem[0000000030101400] = ffffffff a6ed2c14, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffffffff 00000000a6ed2c14
!	Mem[0000000010101408] = 00000000000000ff, %l2 = 00000000ffffffff
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = 00a6fe22, %l4 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000a6
!	Mem[0000000010001408] = 00ff0000, %l2 = 00000000000000ff
	ldsha	[%i0+0x008]%asi,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (36)
!	Mem[00000000100c1424] = 000000ff, %f0  = 0000d49a
	ld	[%i3+0x024],%f0 	! %f0 = 000000ff
!	Mem[00000000100c140f] = ffffffa6, %l5 = 00000000000000ff
	ldstuba	[%i3+0x00f]%asi,%l5	! %l5 = 000000a6000000ff
!	Mem[00000000300c1410] = 000000ff 000000ff, %l6 = 00000000, %l7 = 5dda5b71
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[000000001010141c] = e5a90018, %l4 = 00000000000000a6
	lduh	[%i4+0x01e],%l4		! %l4 = 0000000000000018
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000018, Mem[000000001004143a] = 0000fa9a
	stb	%l4,[%i1+0x03a]		! Mem[0000000010041438] = 0000189a

p0_label_192:
!	Mem[00000000300c1408] = 00ff0000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000ff0000
!	%l6 = 00000000000000ff, Mem[00000000218001c1] = ffe4a59a
	stb	%l6,[%o3+0x1c1]		! Mem[00000000218001c0] = ffffa59a
!	%l6 = 00000000000000ff, %l3 = 00000000a6ed2c14, %l5 = 00000000000000a6
	udivx	%l6,%l3,%l5		! %l5 = 0000000000000000
!	Mem[0000000030141400] = 000000a6, %l1 = 0000000000ff0000
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000000000a6
!	%l6 = 00000000000000ff, Mem[0000000010181408] = ffffffffff3c64f9
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %l4 = 0000000000000018
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030181408] = e2409144, %l4 = 00000000ff000000
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 000000e2000000ff
!	%l2 = 00000000000000ff, Mem[0000000030141408] = 0000d49a
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffd49a
!	%f14 = 0000fa9a ff3c6439, Mem[0000000010081410] = 00000000 ff000000
	stda	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000fa9a ff3c6439
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 00000000, %l5 = 0000000000000000
	ldsha	[%i5+0x022]%asi,%l5	! %l5 = 0000000000000000

p0_label_193:
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081420] = a2ccaca2, %l2 = 00000000000000ff
	ldub	[%i2+0x021],%l2		! %l2 = 00000000000000cc
!	Mem[0000000010101408] = 18000000, %l2 = 00000000000000cc
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000018, %l6 = ffffffffffffffff
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000018
!	Mem[00000000100c1400] = e4e4fbae, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000e4
!	%l0 = 00000000ff000000, Mem[0000000030141410] = 00000000a6bfffab
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ff000000
!	Mem[0000000030141400] = 00ff0000ff3c6439, %f14 = 0000fa9a ff3c6439
	ldda	[%i5+%g0]0x81,%f14	! %f14 = 00ff0000 ff3c6439
!	Mem[00000000218000c0] = 00ffff0b, %l1 = 00000000000000a6
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001438] = 0000fa9aff3c6439, %l6 = 0000000000000018
	ldxa	[%i0+0x038]%asi,%l6	! %l6 = 0000fa9aff3c6439
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000e2, Mem[0000000010041400] = ff000000
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000e2

p0_label_194:
!	%f20 = ff3c6439 0000a9ff, %l6 = 0000fa9aff3c6439
!	Mem[0000000010101400] = ff0000ff00000000
	stda	%f20,[%i4+%l6]ASI_PST8_PL ! Mem[0000000010101400] = ff00000039640000
!	%f14 = 00ff0000 ff3c6439, Mem[0000000010181428] = 3476fa9a ff3c6439
	stda	%f14,[%i6+0x028]%asi	! Mem[0000000010181428] = 00ff0000 ff3c6439
!	Mem[0000000030101400] = ffffffff, %l0 = 00000000ff000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f12 = 000000ff 00000000, %l4 = 00000000000000e2
!	Mem[0000000030081420] = 6ecc0b5f00000018
	add	%i2,0x020,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030081420] = 6ecc0b5fff000000
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l2 = 00000000, %l3 = a6ed2c14, Mem[0000000010101400] = ff000000 39640000
	stda	%l2,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 a6ed2c14
!	%f10 = 00000000, Mem[0000000030081410] = 00000000
	sta	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000030081408] = ff000000, %l5 = 00000000000000e4
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010181400] = ff000000 00ff0000 ff000000 00000000
!	Mem[0000000010181410] = ff000000 a2accca2 000000ff b5a4b37f
!	Mem[0000000010181420] = ae4c04a7 aefbe4e4 00ff0000 ff3c6439
!	Mem[0000000010181430] = 00000000 00a600ff 96271b53 0000d49a
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400

p0_label_195:
!	Mem[0000000030001408] = a6ffffff d1000000, %l4 = 000000e2, %l5 = ff000000
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000a6ffffff 00000000d1000000
!	Mem[0000000010041408] = 00000018, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000018
!	Mem[0000000010141408] = 00a600ff ffff3cff, %l2 = 00000000, %l3 = a6ed2c14
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000ffff3cff 0000000000a600ff
!	Mem[0000000020800000] = ff64160c, %l7 = 00000000000000ff
	lduba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101430] = 00ff0000000000ff, %l1 = 00000000000000ff
	ldx	[%i4+0x030],%l1		! %l1 = 00ff0000000000ff
!	Mem[0000000010041418] = ffffffff, %l6 = 0000fa9aff3c6439
	ldsw	[%i1+0x018],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041410] = 000000ff, %f10 = 00000000
	lda	[%i1+%o5]0x89,%f10	! %f10 = 000000ff
!	Mem[0000000030001400] = ff000000 aefbe4e4, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000 00000000aefbe4e4
!	Mem[0000000010001410] = 715bdaff, %l7 = 00000000aefbe4e4
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 00000000715bdaff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000000018
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_196:
!	Mem[0000000010041410] = ffff5b71, %l1 = 00ff0000000000ff
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ffff5b71
!	%l7 = 00000000715bdaff, Mem[00000000300c1410] = ff000000
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 715bdaff
!	%l0 = 000000ff, %l1 = ffff5b71, Mem[0000000010101400] = 00000000 a6ed2c14
	std	%l0,[%i4+%g0]		! Mem[0000000010101400] = 000000ff ffff5b71
!	Mem[00000000211c0001] = 00a6fe22, %l6 = 00000000ff000000
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000a6000000ff
!	%l4 = a6ffffff, %l5 = d1000000, Mem[0000000030181400] = dc9db294 ff3c6439
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = a6ffffff d1000000
!	Mem[000000001000140c] = 399a0000, %l6 = 00000000000000a6, %asi = 80
	swapa	[%i0+0x00c]%asi,%l6	! %l6 = 00000000399a0000
!	%l4 = 00000000a6ffffff, Mem[0000000010101408] = 18000000
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 1800ffff
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%l5 = 00000000d1000000, Mem[0000000030101408] = 00000000
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = d1000000
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = ff3c6439, %l0 = 00000000000000ff
	lduba	[%i4+0x02f]%asi,%l0	! %l0 = 0000000000000039

p0_label_197:
!	Mem[0000000010041408] = 18000000 399a0000, %l0 = 00000039, %l1 = ffff5b71
	ldda	[%i1+0x008]%asi,%l0	! %l0 = 0000000018000000 00000000399a0000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000018000000
	setx	0xabb1bb4fe8801e3b,%g7,%l0 ! %l0 = abb1bb4fe8801e3b
!	%l1 = 00000000399a0000
	setx	0xe4cb8c182bc31680,%g7,%l1 ! %l1 = e4cb8c182bc31680
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = abb1bb4fe8801e3b
	setx	0xbce0ab584f8f7aea,%g7,%l0 ! %l0 = bce0ab584f8f7aea
!	%l1 = e4cb8c182bc31680
	setx	0xc21c37c78fefc346,%g7,%l1 ! %l1 = c21c37c78fefc346
!	Mem[00000000100c1410] = 0000a9ff, %l5 = 00000000d1000000
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001000142c] = 00000000, %l6 = 00000000399a0000
	lduha	[%i0+0x02e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ff76fa9a 00000000, %l2 = ffff3cff, %l3 = 00a600ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff76fa9a 0000000000000000
!	Mem[00000000100c1400] = e4e4fbae, %l0 = bce0ab584f8f7aea
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffe4
!	Mem[0000000030101400] = ffffffff, %l7 = 00000000715bdaff
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 000000d1, %f1  = ff3c6439
	lda	[%i3+%o4]0x80,%f1 	! %f1 = 000000d1
!	Mem[0000000030081410] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff

p0_label_198:
!	Mem[0000000010101400] = 000000ffffff5b71, %l5 = ffffffffffffffff, %l5 = ffffffffffffffff
	casxa	[%i4]0x80,%l5,%l5	! %l5 = 000000ffffff5b71
!	%l6 = 0000000000000000, Mem[000000001014143a] = 3476fa9a, %asi = 80
	stha	%l6,[%i5+0x03a]%asi	! Mem[0000000010141438] = 34760000
!	Mem[0000000010181404] = 00ff0000, %l7 = 0000000000000000, %asi = 80
	swapa	[%i6+0x004]%asi,%l7	! %l7 = 0000000000ff0000
!	%l0 = ffffffffffffffe4, Mem[000000001008143e] = 47a79bff, %asi = 80
	stha	%l0,[%i2+0x03e]%asi	! Mem[000000001008143c] = 47a7ffe4
!	%l4 = 00000000a6ffffff, Mem[0000000030041410] = e5a900ff000000ff
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000a6ffffff
!	%l7 = 0000000000ff0000, Mem[0000000030081408] = e4000000
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = e4000000
!	%l5 = 000000ffffff5b71, Mem[0000000010081410] = ff3c6439
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = ff3c5b71
!	Mem[0000000030101400] = ffffffff, %l5 = 000000ffffff5b71
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010141400] = a6ffffff, %l2 = 00000000ff76fa9a
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000a6ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffa90000, %l6 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_199:
!	Mem[0000000030081408] = 000000e4, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00000000000000ff, %l1 = c21c37c78fefc346
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 715bdaff, %l7 = 0000000000ff0000
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000071
!	Mem[0000000030041408] = ffa9000039643cff, %l5 = 00000000000000ff
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = ffa9000039643cff
!	Mem[0000000030101408] = abffbfa6d1000000, %f4  = ffffffff 00000000
	ldda	[%i4+%o4]0x89,%f4 	! %f4  = abffbfa6 d1000000
!	Mem[0000000030181408] = ff409144, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ff40
!	Mem[0000000010041418] = ffffffff, %f21 = a2accca2
	lda	[%i1+0x018]%asi,%f21	! %f21 = ffffffff
!	Mem[0000000030141410] = 00000000, %l5 = ffa9000039643cff
	ldsha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l0 = ffffffffffffffe4
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00fffe22, %l1 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_200:
!	%l2 = 00000000a6ffffff, Mem[0000000030101400] = ffffffff
	stwa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = a6ffffff
!	%l3 = 000000000000ff40, Mem[000000001000143c] = ff3c6439, %asi = 80
	stwa	%l3,[%i0+0x03c]%asi	! Mem[000000001000143c] = 0000ff40
!	Mem[0000000030001410] = ff76fa9a, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l5	! %l5 = 000000000000fa9a
!	%l2 = 00000000a6ffffff, Mem[00000000300c1400] = 00000000
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000
!	Mem[0000000010041404] = ff3c6439, %l5 = 000000000000fa9a, %asi = 80
	swapa	[%i1+0x004]%asi,%l5	! %l5 = 00000000ff3c6439
!	%l4 = 00000000a6ffffff, Mem[0000000030141410] = 000000ff00000000
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000a6ffffff
!	Mem[000000001010140c] = 00000000, %l2 = a6ffffff, %l1 = 00000000
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = b5ffffff, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 000000b5000000ff
!	%f12 = 000000ff 00000000, %l0 = 000000000000ff00
!	Mem[0000000030141438] = 142ceda6ffffffff
	add	%i5,0x038,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141438] = 142ceda6ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l6 = ffffffffffffffff
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_201:
!	Mem[00000000201c0000] = 00ff167a, %l7 = 0000000000000071
	ldub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = ff3cffffff00a600, %f12 = 000000ff 00000000
	ldda	[%i5+%o4]0x80,%f12	! %f12 = ff3cffff ff00a600
!	Mem[0000000030041408] = 0000a9ff, %f12 = ff3cffff
	lda	[%i1+%o4]0x89,%f12	! %f12 = 0000a9ff
!	Mem[0000000010181408] = 00000000000000ff, %l6 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = 9afa0000 ff0000e2, %l0 = 0000ff00, %l1 = 000000b5
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff0000e2 000000009afa0000
!	Mem[0000000010041408] = 00000018, %l0 = 00000000ff0000e2
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000018
!	Mem[0000000010181408] = ff000000 00000000, %l0 = 00000018, %l1 = 9afa0000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010081418] = 00000000 57404012, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i2+0x018],%l6		! %l6 = 0000000000000000 0000000057404012
!	Mem[0000000010101408] = ffff0018, %l0 = 00000000ff000000
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ffff0018
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff76fa9a, %l7 = 0000000057404012
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_202:
!	%f5  = d1000000, Mem[0000000030141410] = ffffffa6
	sta	%f5 ,[%i5+%o5]0x81	! Mem[0000000030141410] = d1000000
!	%l7 = 00000000000000ff, Mem[0000000030001410] = 9afa76ff14994e34
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	Mem[0000000010041438] = 0000189aff3c6439, %l0 = 00000000ffff0018, %l3 = 000000000000ff40
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 0000189aff3c6439
!	Mem[0000000030141400] = 00ff0000, %l4 = 00000000a6ffffff
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 0000ffff
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f12 = 0000a9ff, Mem[0000000010001434] = 00000000
	sta	%f12,[%i0+0x034]%asi	! Mem[0000000010001434] = 0000a9ff
!	%l6 = 0000000000000000, Mem[00000000100c1408] = d1000000
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = d1000000
!	%l0 = 00000000ffff0018, Mem[0000000010081408] = ffffffff
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0018ffff
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff00000000, %f14 = 00ff0000 ff3c6439
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 000000ff 00000000

p0_label_203:
!	Mem[00000000300c1410] = 715bdaff ff000000, %l2 = a6ffffff, %l3 = ff3c6439
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000715bdaff 00000000ff000000
!	Mem[0000000010041408] = 00000018, %f13 = ff00a600
	lda	[%i1+%o4]0x88,%f13	! %f13 = 00000018
!	Mem[0000000020800040] = 000055e8, %l1 = 0000000000000000
	ldsh	[%o1+0x040],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00000000ff000000, %l5 = 00000000ff3c6439
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1400] = aefbe4e4, %f7  = 00000000
	lda	[%i3+%g0]0x88,%f7 	! %f7 = aefbe4e4
!	Mem[0000000030041400] = 000000ff, %l5 = 00000000ff000000
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = ff3cffff, %l7 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ff3cffff
!	Mem[0000000020800040] = 000055e8, %l2 = 00000000715bdaff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101438] = 00000000, %f21 = ffffffff
	lda	[%i4+0x038]%asi,%f21	! %f21 = 00000000
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 00a600ff, %l3 = 00000000ff000000
!	Mem[00000000300c1408] = ff00000000000000
	add	%i3,0x008,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1408] = ff00000000000000

p0_label_204:
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010041418] = ffffffff 00000000
	stda	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff 000000ff
!	Mem[0000000030101400] = ffffffa6, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 00000000ffffffa6
!	Mem[0000000010001408] = 00ff0000, %l7 = 00000000ff3cffff
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000010041410] = ff000000, %l3 = 00000000ff000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[00000000100c1400] = e4e4fbae00000000, %asi = 80
	stxa	%l3,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 00ffd49a
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	%l6 = 000000ff, %l7 = 00ff0000, Mem[0000000030141400] = 0000ff00 39643cff
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 00ff0000
!	%f26 = 00ff0000, Mem[0000000030181410] = ffffffff
	sta	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = 00ff0000
!	%l0 = 00000000ffff0018, Mem[0000000030181400] = a6ffffff
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff0018
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00ff0000, %l4 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000ff0000

p0_label_205:
!	Mem[00000000300c1410] = ffda5b71, %l7 = 0000000000ff0000
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffda5b71
!	Mem[0000000030181408] = 00000000449140ff, %f4  = abffbfa6 d1000000
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 00000000 449140ff
!	Mem[0000000010001408] = ff3cffff 000000a6, %l4 = 00ff0000, %l5 = 000000ff
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 00000000ff3cffff 00000000000000a6
!	Mem[0000000010101410] = ff395e8d000000ff, %l2 = 00000000ffffffa6
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = ff395e8d000000ff
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = 00000000000000a6
	ldswa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1420] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i3+0x020]%asi,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030041408] = ffa90000, %l5 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffa90000
!	Mem[0000000010141434] = 00000000, %l4 = 00000000ff3cffff
	lduba	[%i5+0x035]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000021800100] = ffff933f, %asi = 80
	stha	%l1,[%o3+0x100]%asi	! Mem[0000000021800100] = 0000933f

p0_label_206:
!	Mem[0000000030141400] = 000000ff, %l2 = ff395e8d000000ff
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l6 = ff000000, %l7 = ffda5b71, Mem[0000000030081400] = ff000000 00ffffff
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000 ffda5b71
!	%l3 = 00000000ff000000, Mem[0000000010001400] = ff76fa9a
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 0076fa9a
!	%l1 = 0000000000000000, Mem[0000000021800081] = 5d28571f
	stb	%l1,[%o3+0x081]		! Mem[0000000021800080] = 5d00571f
!	%f2  = 18000000 399a0000, %l4 = 00000000000000ff
!	Mem[0000000010141410] = ff000000ffffffff
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_P ! Mem[0000000010141410] = 18000000399a0000
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f24 = ae4c04a7, Mem[0000000010141400] = ff76fa9a
	sta	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = ae4c04a7
!	%l4 = 000000ff, %l5 = ffa90000, Mem[0000000010141408] = ff3cffff ff00a600
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff ffa90000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00000000000000, %l5 = ffffffffffa90000
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = ff00000000000000

p0_label_207:
!	Mem[0000000010001400] = 9afa7600, %l3 = 00000000ff000000
	lduha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000007600
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 00000000ffff0018
	setx	0x9b8aa70066ab4942,%g7,%l0 ! %l0 = 9b8aa70066ab4942
!	%l1 = 0000000000000000
	setx	0x44a234cfa35a7b73,%g7,%l1 ! %l1 = 44a234cfa35a7b73
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9b8aa70066ab4942
	setx	0x29c7f257dbfbca2c,%g7,%l0 ! %l0 = 29c7f257dbfbca2c
!	%l1 = 44a234cfa35a7b73
	setx	0x3f1e1577ad3e4022,%g7,%l1 ! %l1 = 3f1e1577ad3e4022
!	Mem[0000000030181410] = 0000ff00, %f31 = 0000d49a
	lda	[%i6+%o5]0x81,%f31	! %f31 = 0000ff00
!	Mem[0000000030141410] = 000000d1, %l7 = ffffffffffda5b71
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffd1
!	Mem[0000000010081408] = 0018ffffffffffff, %l2 = 0000000000000000
	ldxa	[%i2+0x008]%asi,%l2	! %l2 = 0018ffffffffffff
!	Mem[0000000010141408] = ff000000, %l7 = ffffffffffffffd1
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030041408] = ffa9000039643cff, %l4 = 00000000000000ff
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = ffa9000039643cff
!	Mem[00000000201c0000] = 00ff167a, %l7 = 00000000ff000000
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_208:
!	Mem[00000000100c1438] = 02cac046, %l7 = 0000000000000000, %asi = 80
	swapa	[%i3+0x038]%asi,%l7	! %l7 = 0000000002cac046
!	%l6 = ffffffffff000000, Mem[0000000030141400] = ff000000
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
	membar	#Sync			! Added by membar checker (38)
!	%l6 = ffffffffff000000, Mem[0000000010181408] = ff000000
	stha	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[0000000010141400] = a7044cae, %l5 = ff00000000000000
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000a7044cae
!	%l6 = ff000000, %l7 = 02cac046, Mem[0000000010041428] = 00000000 00000000
	std	%l6,[%i1+0x028]		! Mem[0000000010041428] = ff000000 02cac046
!	%f14 = 000000ff 00000000, Mem[00000000100c1408] = d1000000 ffffffff
	stda	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff 00000000
!	Mem[000000001014141c] = 14994e2b, %l2 = 0018ffffffffffff, %asi = 80
	swapa	[%i5+0x01c]%asi,%l2	! %l2 = 0000000014994e2b
!	%f21 = 00000000, Mem[0000000030041410] = ffffffa6
	sta	%f21,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f30 = 96271b53 0000ff00, %l5 = 00000000a7044cae
!	Mem[00000000300c1408] = ff00000000000000
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_SL ! Mem[00000000300c1408] = ff000000531b2796
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l1 = 3f1e1577ad3e4022
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ff00

p0_label_209:
!	Mem[0000000030041400] = 000000ff, %l4 = ffa9000039643cff
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %f29 = 00a600ff
	lda	[%i3+%g0]0x88,%f29	! %f29 = 00000000
!	Mem[0000000030001408] = a6ffffff, %l7 = 0000000002cac046
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = ffffffffa6ffffff
!	Mem[0000000010001400] = 0076fa9a, %f10 = 000000ff
	lda	[%i0+%g0]0x80,%f10	! %f10 = 0076fa9a
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000007600
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = a6000000ffff3cff, %f0  = 000000ff 000000d1
	ldda	[%i0+%o4]0x88,%f0 	! %f0  = a6000000 ffff3cff
!	Mem[0000000010001428] = 00000000, %l0 = 29c7f257dbfbca2c
	lduba	[%i0+0x02b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 0000000014994e2b
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000 000000d1, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000d1 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = e20000ff, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 000000e2000000ff

p0_label_210:
!	%f20 = ff000000 00000000, Mem[0000000010101410] = 8d5e39ff ff000000
	stda	%f20,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000 00000000
!	Mem[0000000010001408] = ffff3cff, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 00000000ffff3cff
!	%f6  = ffffffff aefbe4e4, Mem[0000000010041410] = 000000ff 00000000
	stda	%f6 ,[%i1+0x010]%asi	! Mem[0000000010041410] = ffffffff aefbe4e4
!	%l3 = 00000000ffff3cff, Mem[0000000010181400] = ff00000000000000
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ffff3cff
!	%l6 = ff000000, %l7 = a6ffffff, Mem[0000000030141410] = 000000d1 00000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000 a6ffffff
!	%l6 = ffffffffff000000, Mem[0000000010101400] = ff000000
	stha	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	%l2 = 00000000000000d1, Mem[0000000010041408] = 00000018
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000d1
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ffff3cff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = ffffffa6, %l7 = ffffffffa6ffffff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000a6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0018ffffffffffff, %l0 = 00000000000000e2
	ldx	[%i2+%o4],%l0		! %l0 = 0018ffffffffffff

p0_label_211:
!	Mem[0000000010041410] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = ffff0018, %l2 = 00000000000000d1
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = ff00000000000000, %f6  = ffffffff aefbe4e4
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = ff000000 00000000
!	Mem[0000000010001410] = ffda5b71 000000ff, %l4 = 000000ff, %l5 = a7044cae
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ffda5b71 00000000000000ff
!	Mem[0000000010001410] = 715bdaff, %f31 = 0000ff00
	lda	[%i0+%o5]0x88,%f31	! %f31 = 715bdaff
!	Mem[0000000030181400] = 1800ffff, %l1 = 000000000000ff00
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 000000001800ffff
!	Mem[0000000030041410] = ffff3cff, %l1 = 000000001800ffff
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = ffff3cff, %l0 = 0018ffffffffffff
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000 000000a6, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000000000a6
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ffda5b71, %l1 = 00000000000000ff
	swap	[%i0+%o5],%l1		! %l1 = 00000000ffda5b71

p0_label_212:
!	Mem[0000000030041400] = ff000000, %l6 = ffffffffff000000
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000201c0000] = 00ff167a, %l2 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 00ff0000, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000ff0000
!	%l6 = 00ff0000, %l7 = 000000a6, Mem[00000000300c1400] = 000000ff 00000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00ff0000 000000a6
!	%f14 = 000000ff, Mem[0000000030181400] = 1800ffff
	sta	%f14,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%l6 = 0000000000ff0000, Mem[0000000010081408] = 0018ffff
	stba	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0018ffff
!	%l6 = 0000000000ff0000, Mem[0000000030001410] = 00000000
	stba	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010181410] = ff000000a2accca2, %l3 = 00000000000000a6, %l7 = 00000000000000a6
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = ff000000a2accca2
!	%f26 = 00ff0000 ff3c6439, %l1 = 00000000ffda5b71
!	Mem[0000000010141438] = 34760000a2accc07
	add	%i5,0x038,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_P ! Mem[0000000010141438] = 34760000ff3c6439
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 69387c0747a7ffe4, %f18 = ff000000 00000000
	ldda	[%i2+0x038]%asi,%f18	! %f18 = 69387c07 47a7ffe4

p0_label_213:
!	Mem[0000000010081410] = ff3c5b71, %l5 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000005b71
!	Mem[0000000010081400] = 9ad40000, %l4 = 00000000ffda5b71
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %l6 = 0000000000ff0000
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030141400] = 00000000 0000ff00, %l4 = 00000000, %l5 = 00005b71
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000 000000000000ff00
!	Mem[0000000030181400] = 000000ff000000d1, %l7 = ff000000a2accca2
	ldxa	[%i6+%g0]0x81,%l7	! %l7 = 000000ff000000d1
!	Mem[0000000030041400] = ff000000, %l1 = 00000000ffda5b71
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[00000000201c0000] = ffff167a, %l7 = 000000ff000000d1
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = d1000000, %f21 = 00000000
	lda	[%i1+%o4]0x80,%f21	! %f21 = d1000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000a6, Mem[00000000100c1400] = 00000000
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000a6

p0_label_214:
!	%f26 = 00ff0000 ff3c6439, %l5 = 000000000000ff00
!	Mem[0000000030041418] = 1800a9e539643cff
	add	%i1,0x018,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041418] = 1800a9e539643cff
!	Mem[0000000010081408] = 0018ffff, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 000000000018ffff
!	%f30 = 96271b53 715bdaff, %l6 = ffffffffff000000
!	Mem[0000000010141438] = 34760000ff3c6439
	add	%i5,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141438] = 34760000ff3c6439
!	%l0 = ffffffff, %l1 = ff000000, Mem[0000000010001408] = 00000000 000000a6
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff ff000000
!	%f6  = ff000000 00000000, %l3 = 00000000000000a6
!	Mem[0000000030181438] = 300dad54715bda5d
	add	%i6,0x038,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030181438] = 300dad54000000ff
!	Mem[0000000030041400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 000000000018ffff, Mem[0000000010181408] = 0000000000000000
	stxa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000018ffff
!	%l2 = 0018ffff, %l3 = 000000a6, Mem[00000000100c1400] = 000000a6 000000ff
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0018ffff 000000a6
!	Mem[0000000030101400] = ff000000, %l3 = 00000000000000a6
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l5 = 000000000000ff00
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_215:
!	Mem[0000000010141410] = 00009a3900000018, %f24 = ae4c04a7 aefbe4e4
	ldda	[%i5+%o5]0x88,%f24	! %f24 = 00009a39 00000018
!	Mem[0000000010181408] = 0018ffff, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 000000000018ffff
!	Mem[0000000020800040] = 000055e8, %l2 = 000000000018ffff
	ldub	[%o1+0x040],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00009a39 00000018, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000018 0000000000009a39
!	Mem[0000000010141408] = ff000000, %f21 = d1000000
	lda	[%i5+%o4]0x88,%f21	! %f21 = ff000000
!	%l3 = 0000000000009a39, imm = 0000000000000b4c, %l3 = 0000000000009a39
	or	%l3,0xb4c,%l3		! %l3 = 0000000000009b7d
!	Mem[0000000010001400] = 0076fa9a00000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 0076fa9a00000000
!	Mem[0000000030101408] = 000000d1, %l4 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ffa90000 39643cff, %l0 = ffffffff, %l1 = ff000000
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000ffa90000 0000000039643cff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000018, Mem[0000000030141410] = ff000000
	stba	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000018

p0_label_216:
!	%l4 = 0000000000000000, Mem[0000000010001424] = 00000068
	stw	%l4,[%i0+0x024]		! Mem[0000000010001424] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041400] = 000000ff ff3c6439
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000
!	%f24 = 00009a39, Mem[0000000030041408] = 0000a9ff
	sta	%f24,[%i1+%o4]0x89	! Mem[0000000030041408] = 00009a39
!	%l4 = 0000000000000000, Mem[0000000010041400] = ff0000ff
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000018
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%f16 = ff000000 00ff0000 69387c07 47a7ffe4
!	%f20 = ff000000 ff000000 000000ff b5a4b37f
!	%f24 = 00009a39 00000018 00ff0000 ff3c6439
!	%f28 = 00000000 00000000 96271b53 715bdaff
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l5 = 0076fa9a00000000, Mem[0000000020800000] = ff64160c
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = 0064160c
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = 000000d1 a6bfffab
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	%f16 = ff000000 00ff0000 69387c07 47a7ffe4
!	%f20 = ff000000 ff000000 000000ff b5a4b37f
!	%f24 = 00009a39 00000018 00ff0000 ff3c6439
!	%f28 = 00000000 00000000 96271b53 715bdaff
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (39)
!	Mem[00000000100c1408] = 69387c07, %l2 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 0000000069387c07

p0_label_217:
!	Mem[0000000030141400] = 00000000, %l1 = 0000000039643cff
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000069387c07
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000 1800ffff, %l6 = ff000000, %l7 = 0018ffff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 000000001800ffff 0000000000000000
!	Mem[0000000010141410] = 00000018, %l2 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000018
!	Mem[0000000010001404] = 00000000, %l2 = 0000000000000018
	lduh	[%i0+0x006],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = e4000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 0000d49a, %f17 = 00ff0000
	lda	[%i2+%g0]0x80,%f17	! %f17 = 0000d49a
!	Mem[0000000030041400] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 000000e4, %l3 = 0000000000009b7d
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000e4
!	Starting 10 instruction Store Burst
!	%l6 = 000000001800ffff, Mem[0000000030181410] = ff000000
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 1800ffff

p0_label_218:
!	%l3 = 00000000000000e4, Mem[00000000100c143c] = 715bdaff, %asi = 80
	stha	%l3,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 00e4daff
!	%f30 = 96271b53 715bdaff, Mem[0000000030041408] = 00009a39 ff3c6439
	stda	%f30,[%i1+%o4]0x89	! Mem[0000000030041408] = 96271b53 715bdaff
!	Mem[00000000100c1400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000000ffa90000, immed = fffff4a1, %y  = ff0077b3
	smul	%l0,-0xb5f,%l6		! %l6 = 00000003dd490000, %y = 00000003
!	Mem[0000000010041408] = 000000d1, %l6 = 00000003dd490000
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000d1
!	%f31 = 715bdaff, Mem[0000000010101410] = 00000000
	sta	%f31,[%i4+%o5]0x88	! Mem[0000000010101410] = 715bdaff
!	%l2 = 0000000000000000, Mem[0000000010181410] = ff000000
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f24 = 00009a39 00000018, Mem[0000000030081408] = e4000000 39643cff
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = 00009a39 00000018
!	%l0 = 00000000ffa90000, Mem[0000000030081410] = 00000000ff000000
	stxa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ffa90000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_219:
!	Mem[00000000100c140c] = 47a7ffe4, %l4 = 00000000000000ff
	lduha	[%i3+0x00c]%asi,%l4	! %l4 = 00000000000047a7
!	Mem[0000000010001400] = 000000009afa7600, %f8  = 96271b53 0000d49a
	ldda	[%i0+%g0]0x88,%f8 	! %f8  = 00000000 9afa7600
!	Mem[0000000030181400] = ff000000, %l4 = 00000000000047a7
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = ffff0018, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000018
!	Mem[000000001018140c] = 00000000, %l5 = 0076fa9a00000000
	lduh	[%i6+0x00e],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = 18000000, %l4 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000001800
!	Mem[000000001008141c] = 57404012, %l5 = 0000000000000000
	ldswa	[%i2+0x01c]%asi,%l5	! %l5 = 0000000057404012
!	Mem[0000000030001410] = ff00000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = ff00000000000000
!	Mem[0000000030101400] = ff000000, %l7 = 0000000000000018
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f3  = 399a0000, Mem[0000000010141400] = 00000000
	sta	%f3 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 399a0000

p0_label_220:
!	Mem[00000000300c1410] = 715bdaff, %l6 = 00000000000000d1
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000071000000ff
!	%l0 = 00000000ffa90000, Mem[00000000100c1400] = ff00000000ff0000
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000ffa90000
!	%f17 = 0000d49a, Mem[0000000010001404] = 00000000
	sta	%f17,[%i0+0x004]%asi	! Mem[0000000010001404] = 0000d49a
!	%l2 = 00000000000000ff, Mem[0000000010001410] = ff000000ff000000
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000ff
!	Mem[0000000030001400] = ff000000, %l4 = 0000000000001800
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l3 = 00000000000000e4, Mem[00000000300c1410] = ff5bdaff
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000e4
!	Mem[0000000030181408] = 69387c07, %l6 = 0000000000000071
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000069387c07
!	%l6 = 0000000069387c07, Mem[0000000010141410] = 00000018
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 69387c07
!	%l6 = 0000000069387c07, Mem[0000000010001400] = 9afa7600
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 69387c07
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 69387c07, %l0 = 00000000ffa90000
	lduba	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000007

p0_label_221:
!	Mem[0000000030181408] = 71000000, %l5 = 0000000057404012
	ldswa	[%i6+%o4]0x89,%l5	! %l5 = 0000000071000000
!	Mem[0000000010141408] = ff000000, %l1 = ff00000000000000
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 0000000000000007
	setx	0x5a5477f7eee2a8e5,%g7,%l0 ! %l0 = 5a5477f7eee2a8e5
!	%l1 = 0000000000000000
	setx	0x48cbdcafa22f7fab,%g7,%l1 ! %l1 = 48cbdcafa22f7fab
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5a5477f7eee2a8e5
	setx	0x649af65fcfcf3ae7,%g7,%l0 ! %l0 = 649af65fcfcf3ae7
!	%l1 = 48cbdcafa22f7fab
	setx	0x217cf39fbbfef8ba,%g7,%l1 ! %l1 = 217cf39fbbfef8ba
!	Mem[0000000030101408] = 00000000, %f26 = 00ff0000
	lda	[%i4+%o4]0x89,%f26	! %f26 = 00000000
!	Mem[0000000010041408] = 000049dd399a0000, %f6  = ff000000 00000000
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = 000049dd 399a0000
!	Mem[00000000100c1420] = 00009a3900000018, %l2 = 0000000000000000
	ldx	[%i3+0x020],%l2		! %l2 = 00009a3900000018
!	Mem[0000000030101400] = 142ceda6 000000ff, %l0 = cfcf3ae7, %l1 = bbfef8ba
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff 00000000142ceda6
!	Mem[0000000030101410] = ff3c6439ff0000ff, %l3 = 00000000000000e4
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = ff3c6439ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000142ceda6
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_222:
!	%f16 = ff000000 0000d49a 69387c07 47a7ffe4
!	%f20 = ff000000 ff000000 000000ff b5a4b37f
!	%f24 = 00009a39 00000018 00000000 ff3c6439
!	%f28 = 00000000 00000000 96271b53 715bdaff
	stda	%f16,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
	membar	#Sync			! Added by membar checker (40)
!	%l6 = 0000000069387c07, Mem[0000000010101414] = ff000000, %asi = 80
	stha	%l6,[%i4+0x014]%asi	! Mem[0000000010101414] = 7c070000
!	%l4 = ff000000, %l5 = 71000000, Mem[0000000010041408] = 000049dd 399a0000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 71000000
!	%l4 = 00000000ff000000, Mem[0000000010181408] = ffff1800
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 00000071, %l3 = ff3c6439ff0000ff
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000069387c07, Mem[0000000010101408] = 69387c0747a7ffe4
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000069387c07
!	Mem[0000000030181400] = ff000000, %l6 = 0000000069387c07
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	%l6 = 00000000ff000000, Mem[00000000300c1410] = 000000e4
	stha	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000e4

p0_label_223:
!	Mem[0000000030041408] = 715bdaff, %l7 = ffffffffffffffff
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = ff000000, %l7 = ffffffffffffffff
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000ff000000
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %f3  = 399a0000
	lda	[%i1+%o4]0x88,%f3 	! %f3 = 000000ff
!	Mem[00000000100c1408] = 69387c07, %l0 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000006938
!	Mem[0000000010181438] = 96271b53, %l7 = 00000000ff000000
	lduha	[%i6+0x038]%asi,%l7	! %l7 = 0000000000009627
!	Mem[0000000010001410] = ff00000000000000, %f30 = 96271b53 715bdaff
	ldd	[%i0+%o5],%f30		! %f30 = ff000000 00000000
!	Mem[00000000300c1400] = 00ff0000, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 000000ff ffff0018, %l4 = 00000000, %l5 = 71000000
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ffff0018 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000009627, Mem[0000000010001410] = 00000000000000ff
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000009627

p0_label_224:
!	Mem[00000000100c1410] = ff000000, %l0 = 0000000000006938
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000009627
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 00000018
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	Mem[0000000010001400] = 077c3869, %l2 = 00009a3900000018
	swap	[%i0+%g0],%l2		! %l2 = 00000000077c3869
!	%l3 = 0000000000000000, Mem[0000000010141408] = 0000a9ffff000000
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 000000a600ff0000
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030101410] = ff0000ff
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 0000a9ffa6ed2c14
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000030181408] = ff000071, %l0 = 00000000ff000000
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff000071
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l0 = 00000000ff000071
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_225:
!	Mem[0000000010181410] = 00000000a2accca2, %f0  = a6000000 ffff3cff
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 00000000 a2accca2
!	Mem[0000000010041408] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %f14 = 000000ff
	lda	[%i0+%o4]0x80,%f14	! %f14 = ffffffff
!	Mem[0000000030041410] = ffff3cff, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030181400] = 69387c07, %l2 = 00000000077c3869
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000069
!	Mem[0000000030001408] = ffffffff, %f19 = 47a7ffe4
	lda	[%i0+%o4]0x81,%f19	! %f19 = ffffffff
!	Mem[0000000010181410] = a2ccaca200000000, %l4 = 00000000ffff0018
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = a2ccaca200000000
!	Mem[0000000020800040] = 000055e8, %l6 = 00000000ff000000
	ldsh	[%o1+0x040],%l6		! %l6 = 0000000000000000
!	Mem[000000001008141c] = 57404012, %l3 = 000000000000ffff
	lduha	[%i2+0x01e]%asi,%l3	! %l3 = 0000000000004012
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 27960000, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000027000000ff

p0_label_226:
!	%f18 = 69387c07, Mem[00000000100c1400] = 00000000
	sta	%f18,[%i3+%g0]0x80	! Mem[00000000100c1400] = 69387c07
!	Mem[0000000010081420] = a2ccaca2, %l2 = 0000000000000069
	ldstuba	[%i2+0x020]%asi,%l2	! %l2 = 000000a2000000ff
!	Mem[0000000030101408] = 000000ff, %l5 = 0000000000000027
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[00000000201c0001] = ffff167a, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff00167a
!	Mem[0000000010181410] = 00000000, %l4 = a2ccaca200000000
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101410] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010041420] = 0000000000000018
	stx	%l7,[%i1+0x020]		! Mem[0000000010041420] = 0000000000000000
!	%l2 = 000000a2, %l3 = 00004012, Mem[0000000010141400] = 399a0000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000a2 00004012
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff

p0_label_227:
!	Mem[0000000010001410] = ff960000, %l2 = 00000000000000a2
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffff96
!	Mem[0000000030141410] = ff000018, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000018
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101418] = 000000ff, %l4 = 0000000000000000
	ldsw	[%i4+0x018],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 18000000, %l3 = 0000000000004012
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000018
	ldswa	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 142ceda6000000ff, %f8  = 00000000 9afa7600
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = 142ceda6 000000ff
!	Mem[0000000030101410] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffffffffaefbe4e4, %l7 = 0000000000000000, %l7 = 0000000000000000
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = ffffffffaefbe4e4

p0_label_228:
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f6  = 000049dd 399a0000, Mem[0000000010181400] = 00000000 ff3cffff
	stda	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 000049dd 399a0000
!	%l6 = 00000000000000ff, Mem[0000000021800100] = 0000933f, %asi = 80
	stba	%l6,[%o3+0x100]%asi	! Mem[0000000021800100] = ff00933f
!	%l5 = 00000000ff000000, Mem[0000000010001434] = 0000a9ff, %asi = 80
	stwa	%l5,[%i0+0x034]%asi	! Mem[0000000010001434] = ff000000
!	%f10 = 0076fa9a a6bfffab, Mem[00000000300c1408] = ff000000 531b2796
	stda	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0076fa9a a6bfffab
!	%l7 = ffffffffaefbe4e4, Mem[0000000010001420] = ff3cffff00000000, %asi = 80
	stxa	%l7,[%i0+0x020]%asi	! Mem[0000000010001420] = ffffffffaefbe4e4
!	Mem[0000000010081408] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030041400] = 0000000000000000
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%f25 = 00000018, Mem[0000000030141408] = ff000000
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000018
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l2 = ffffffffffffff96
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_229:
!	Mem[0000000010001408] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010101408] = 00000000 69387c07, %l4 = 00000000, %l5 = ff000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000069387c07
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141420] = 00000000 00000070, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i5+0x020]%asi,%l2	! %l2 = 0000000000000000 0000000000000070
!	Mem[0000000030181400] = 077c3869, %l4 = ffffffffffffffff
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000003869
!	Mem[0000000030101400] = ff000000, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181408] = ff00000000000000, %l3 = 0000000000000070
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = ff00000000000000
!	Mem[0000000010181408] = 00000000000000ff, %f2  = 18000000 000000ff
	ldda	[%i6+%o4]0x88,%f2 	! %f2  = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff000000, Mem[00000000300c1400] = 00000000
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000

p0_label_230:
!	%f22 = 000000ff b5a4b37f, Mem[0000000030081400] = ff000000 ffda5b71
	stda	%f22,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff b5a4b37f
!	Mem[0000000010181408] = ff000000, %l7 = ffffffffaefbe4e4
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010101400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181418] = 000000ff, %l4 = 0000000000003869
	swap	[%i6+0x018],%l4		! %l4 = 00000000000000ff
!	Mem[00000000218001c1] = ffffa59a, %l7 = 00000000000000ff
	ldstuba	[%o3+0x1c1]%asi,%l7	! %l7 = 000000ff000000ff
!	%f16 = ff000000 0000d49a 69387c07 ffffffff
!	%f20 = ff000000 ff000000 000000ff b5a4b37f
!	%f24 = 00009a39 00000018 00000000 ff3c6439
!	%f28 = 00000000 00000000 ff000000 00000000
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l7 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%f4  = 00000000 449140ff, Mem[0000000030041408] = 715bdaff 96271b53
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 449140ff
!	%l4 = 00000000000000ff, Mem[0000000030001410] = ff000000
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000a2 00004012, %l0 = ff000000, %l1 = 0000ff00
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000000000a2 0000000000004012

p0_label_231:
!	Mem[0000000010041410] = ffffffff, %l3 = ff00000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = ffffffff, %l0 = 00000000000000a2
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 0000000000000018, %f14 = ffffffff 00000000
	ldda	[%i5+%o4]0x89,%f14	! %f14 = 00000000 00000018
!	Mem[00000000100c1410] = 00006938, %l7 = 00000000000000ff
	ldsh	[%i3+0x012],%l7		! %l7 = 0000000000006938
	membar	#Sync			! Added by membar checker (41)
!	Mem[000000001018141c] = b5a4b37f, %l7 = 0000000000006938
	ldub	[%i6+0x01c],%l7		! %l7 = 00000000000000b5
!	Mem[0000000010041408] = ff000000, %l5 = 0000000069387c07
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000004012
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 69387c07, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000006938
!	Mem[0000000030001410] = 0000ff00, %l6 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 000055e8, %l5 = ffffffffffffffff
	ldstub	[%o1+0x040],%l5		! %l5 = 00000000000000ff

p0_label_232:
!	%f16 = ff000000 0000d49a 69387c07 ffffffff
!	%f20 = ff000000 ff000000 000000ff b5a4b37f
!	%f24 = 00009a39 00000018 00000000 ff3c6439
!	%f28 = 00000000 00000000 ff000000 00000000
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[0000000010001410] = ff960000, %l4 = 0000000000006938
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = 18000000, %l7 = 00000000000000b5
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000018000000
	membar	#Sync			! Added by membar checker (42)
!	%f14 = 00000000 00000018, Mem[0000000030081410] = ff000000 ff000000
	stda	%f14,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000018
!	%l7 = 0000000018000000, Mem[0000000010181410] = 000000ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 18000000
!	%l2 = 0000000000000000, Mem[0000000010181400] = 00009a39
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010041408] = ff000000, %l7 = 0000000018000000
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%f29 = 00000000, Mem[0000000030101408] = 000000ff
	sta	%f29,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = ff00167a
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ff167a
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000d1 ffffffff, %l6 = 0000ff00, %l7 = 000000ff
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffffffff 00000000000000d1

p0_label_233:
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 00ff0000, %l0 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 18000000, %l6 = 00000000ffffffff
	lduwa	[%i6+%o5]0x88,%l6	! %l6 = 0000000018000000
!	Mem[000000001004140c] = 71000000, %l5 = 00000000000000ff
	lduw	[%i1+0x00c],%l5		! %l5 = 0000000071000000
!	Mem[0000000030101400] = ff000000, %f7  = 399a0000
	lda	[%i4+%g0]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 00000000 000000ff, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000020800040] = ff0055e8, %l5 = 0000000071000000
	ldub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001014140c] = 00000000, %l2 = 0000000000000000, %asi = 80
	swapa	[%i5+0x00c]%asi,%l2	! %l2 = 0000000000000000

p0_label_234:
!	Mem[0000000010041400] = ff0000ff, %l7 = 00000000000000d1
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081408] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000211c0001] = fffffe22
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = fffffe22
!	%f28 = 00000000 00000000, Mem[00000000100c1400] = 077c3869 00000000
	stda	%f28,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000010081410] = ff3c5b71, %l6 = 0000000018000000
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 00000071000000ff
!	Mem[0000000030041410] = ffff3cff, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000201c0001] = 00ff167a, %l4 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = e4e4fbae 00180000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000180000 00000000e4e4fbae

p0_label_235:
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 9ad40000, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 0000000000009ad4
!	Mem[0000000010001400] = b5000000, %l6 = 0000000000000071
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffb5000000
!	Mem[0000000030141408] = 00000018, %l5 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000018
!	Mem[0000000010001410] = ff960000, %l0 = 0000000000180000
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffff96
!	Mem[0000000010081404] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i2+0x004]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000ff000000, %f22 = 000000ff b5a4b37f
	ldda	[%i6+%o5]0x89,%f22	! %f22 = ff000000 ff000000
!	Mem[0000000010101408] = 00000000, %l6 = ffffffffb5000000
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l1 = 00000000e4e4fbae
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff96, Mem[00000000300c1410] = 000000ffe4000000
	stxa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffffff96

p0_label_236:
!	Mem[000000001000142c] = 00000000, %l5 = 0000000000000018
	ldstub	[%i0+0x02c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 18000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f4  = 00000000 449140ff, %l3 = 0000000000000000
!	Mem[0000000030081428] = 00000000ff3c6439
	add	%i2,0x028,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081428] = 00000000ff3c6439
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 00006938ff000000
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%f31 = 00000000, Mem[0000000030101408] = 00000000
	sta	%f31,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%f12 = 0000a9ff 00000018, Mem[0000000030081410] = ff000000 00000018
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000a9ff 00000018
!	%l3 = 0000000000000000, Mem[0000000030181408] = ffffffff
	stba	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff3c6439 ff000000, %l0 = ffffff96, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff000000 00000000ff3c6439

p0_label_237:
!	Mem[0000000030001408] = ffffffffd1000000, %l1 = 00000000ff3c6439
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = ffffffffd1000000
!	Mem[0000000020800000] = 0064160c, %l4 = ffffffffffffffff
	ldub	[%o1+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000449140ff, %l6 = 00000000000000ff
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 00000000449140ff
!	Mem[0000000010041408] = 0000007100000000, %l2 = 0000000000009ad4
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 0000007100000000
!	%l0 = ff000000, %l1 = d1000000, Mem[0000000010041420] = 00000000 00000000
	std	%l0,[%i1+0x020]		! Mem[0000000010041420] = ff000000 d1000000
!	Mem[0000000030101408] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010041408] = 00000000, %f30 = ff000000
	lda	[%i1+%o4]0x88,%f30	! %f30 = 00000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 0076fa9a a6bfffab, Mem[0000000010101400] = 00000000 0000d49a
	stda	%f10,[%i4+0x000]%asi	! Mem[0000000010101400] = 0076fa9a a6bfffab

p0_label_238:
!	Mem[0000000030041408] = ff409144, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ff409144
!	Mem[0000000030081410] = ffa90000, %l6 = 00000000449140ff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000ffa90000
!	Mem[0000000030181400] = 9ad40000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 0000009a000000ff
!	%f30 = 00000000, Mem[0000000030041408] = 00000000
	sta	%f30,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000030181408] = ffffff00, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ffffff00
!	%l6 = ffa90000, %l7 = ff409144, Mem[0000000010101408] = 00000000 077c3869
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffa90000 ff409144
!	%l6 = ffa90000, %l7 = ff409144, Mem[0000000030101410] = 000000ff 39643cff
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ffa90000 ff409144
!	Mem[0000000030001400] = 00180000, %l3 = 000000000000009a
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = ffa90000, %l7 = ff409144, Mem[0000000010181420] = ae4c04a7 aefbe4e4
	std	%l6,[%i6+0x020]		! Mem[0000000010181420] = ffa90000 ff409144
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 69387c07, %f1  = a2accca2
	lda	[%i5+%o5]0x88,%f1 	! %f1 = 69387c07

p0_label_239:
!	Mem[0000000010001410] = 000096ff, %f23 = ff000000
	lda	[%i0+%o5]0x88,%f23	! %f23 = 000096ff
!	Mem[0000000010041408] = 00000000, %l5 = 00000000ffffff00
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 180000ff, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = 00000000180000ff
!	Mem[0000000010081430] = f2ffffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+0x030]%asi,%l4	! %l4 = 00000000f2ffffff 0000000000000000
!	Mem[0000000010181410] = ff000018, %l3 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ff000018
!	Mem[0000000010181400] = 00000000, %l7 = 00000000ff409144
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800140] = 00005bff, %l3 = 00000000ff000018
	ldsh	[%o3+0x140],%l3		! %l3 = 0000000000000000
!	Mem[0000000010181438] = 96271b53, %l5 = 0000000000000000
	lduha	[%i6+0x038]%asi,%l5	! %l5 = 0000000000009627
!	Mem[0000000030101410] = 449140ff0000a9ff, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 449140ff0000a9ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0000ff00, %l6 = 00000000ffa90000
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_240:
!	%l2 = 00000000180000ff, Mem[0000000010181430] = 0000000000a600ff
	stx	%l2,[%i6+0x030]		! Mem[0000000010181430] = 00000000180000ff
!	%f8  = 142ceda6 000000ff, %l5 = 0000000000009627
!	Mem[0000000010001420] = ffffffffaefbe4e4
	add	%i0,0x020,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001420] = ff000000a6ede4e4
!	Mem[00000000201c0000] = 00ff167a, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000f2ffffff, Mem[0000000030181400] = 0000d4ff
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000d4ff
!	%f18 = 69387c07 ffffffff, Mem[0000000030001400] = 001800ff e4e4fbae
	stda	%f18,[%i0+%g0]0x89	! Mem[0000000030001400] = 69387c07 ffffffff
!	Mem[0000000010181424] = ff409144, %l6 = 00000000, %l4 = f2ffffff
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff409144
!	%l6 = 0000000000000000, Mem[0000000010101420] = 00009a3900000018
	stx	%l6,[%i4+0x020]		! Mem[0000000010101420] = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081410] = ff5b3cff
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 005b3cff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff167a, %l2 = 00000000180000ff
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_241:
!	Mem[0000000030041410] = ff3cffff, %l1 = ffffffffd1000000
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1418] = 000000ff, %l2 = ffffffffffffffff
	lduha	[%i3+0x01a]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 9afa0000ff0000ff, %l4 = 00000000ff409144
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 9afa0000ff0000ff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = e4e4fbaeffffffff, %f14 = 00000000 00000018
	ldda	[%i1+%o5]0x88,%f14	! %f14 = e4e4fbae ffffffff
!	Mem[0000000010141400] = 12400000a2000000, %l5 = 0000000000009627
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 12400000a2000000
!	Mem[0000000030001410] = 0000ffff, %f13 = 00000018
	lda	[%i0+%o5]0x89,%f13	! %f13 = 0000ffff
!	Mem[0000000010081408] = 000000ff, %l5 = 12400000a2000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = ffffffffffffff96, %l5 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffff96
!	Starting 10 instruction Store Burst
!	%f25 = 00000018, Mem[0000000030081400] = ff000000
	sta	%f25,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000018

p0_label_242:
!	Mem[0000000010101400] = 0076fa9aa6bfffab, %l0 = 00000000ff000000, %l1 = 00000000000000ff
	casxa	[%i4]0x80,%l0,%l1	! %l1 = 0076fa9aa6bfffab
!	Mem[0000000010001408] = ffffffff, %l5 = ffffffffffffff96
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[000000001014141b] = 6895e5d0, %l7 = 0000000000000000
	ldstub	[%i5+0x01b],%l7		! %l7 = 000000d0000000ff
!	%f20 = ff000000, Mem[0000000030081400] = 18000000
	sta	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000
!	%f0  = 00000000 69387c07, Mem[0000000030181400] = 0000d4ff ff000000
	stda	%f0 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 69387c07
!	%f16 = ff000000 0000d49a, %l7 = 00000000000000d0
!	Mem[0000000010101438] = 96271b53715bdaff
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l7]ASI_PST32_P ! Mem[0000000010101438] = 96271b53715bdaff
!	Mem[0000000030101400] = 000000ff, %l4 = 9afa0000ff0000ff
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[000000001010143c] = 715bdaff, %asi = 80
	stwa	%l2,[%i4+0x03c]%asi	! Mem[000000001010143c] = 000000ff
!	Mem[0000000030101400] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000 ff3cffff, %l0 = ff000000, %l1 = a6bfffab
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff3cffff 0000000000000000

p0_label_243:
!	Mem[0000000030181400] = 69387c07, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 0000000069387c07
!	Mem[0000000030141408] = 00000018, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000018
!	Mem[0000000030001410] = ffff0000, %l5 = 00000000ffffffff
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = 0076fa9a, %f30 = 00000000
	lda	[%i4+%g0]0x80,%f30	! %f30 = 0076fa9a
!	Mem[0000000010141408] = 00000000 00000000, %l6 = 00000000, %l7 = 000000d0
	ldd	[%i5+%o4],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000100c1418] = 000000ff b5a4b37f, %l2 = 00000018, %l3 = 0000a9ff
	ldd	[%i3+0x018],%l2		! %l2 = 00000000000000ff 00000000b5a4b37f
!	Mem[00000000100c1418] = 000000ff b5a4b37f, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i3+0x018]%asi,%l4	! %l4 = 00000000000000ff 00000000b5a4b37f
!	Mem[0000000010101410] = ff000000, %l1 = 0000000069387c07
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 000000a2 00004012, %l4 = 000000ff, %l5 = b5a4b37f
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000a2 0000000000004012
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000004012
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 00000000ff000000

p0_label_244:
!	Mem[00000000300c1408] = 9afa7600, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 000000009afa7600
!	%l0 = ff3cffff, %l1 = ffffffff, Mem[0000000010041418] = 000000ff 000000ff
	std	%l0,[%i1+0x018]		! Mem[0000000010041418] = ff3cffff ffffffff
!	%l5 = 00000000ff000000, Mem[0000000010101408] = 0000a9ff
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000a9ff
!	%f14 = e4e4fbae ffffffff, %l4 = 00000000000000a2
!	Mem[0000000010081430] = f2ffffff00000000
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081430] = f2ffffff00fb00e4
!	Mem[0000000010101410] = ff000000, %l5 = 00000000ff000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001400] = b5000000, %l0 = 00000000ff3cffff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000b5000000
!	%l5 = 00000000ff000000, Mem[0000000020800040] = ff0055e8, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 000055e8
!	%l4 = 00000000000000a2, Mem[0000000010081408] = ff000000, %asi = 80
	stwa	%l4,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000a2
!	Mem[0000000010081430] = f2ffffff, %l3 = 00000000b5a4b37f, %asi = 80
	swapa	[%i2+0x030]%asi,%l3	! %l3 = 00000000f2ffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 69387c0747a7ffe4, %l6 = 0000000000000000
	ldxa	[%i3+0x008]%asi,%l6	! %l6 = 69387c0747a7ffe4

p0_label_245:
!	Mem[00000000100c1400] = 0000000000000000, %f16 = ff000000 0000d49a
	ldda	[%i3+%g0]0x88,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010101400] = 9afa7600, %l7 = 000000009afa7600
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000007600
!	Mem[0000000030181410] = 12400000000000ff, %l6 = 69387c0747a7ffe4
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 12400000000000ff
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ff000018, %l7 = 0000000000007600
	ldswa	[%i6+%o5]0x80,%l7	! %l7 = ffffffffff000018
!	Mem[0000000010181408] = ff000000, %l7 = ffffffffff000018
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = fffffe22, %l7 = ffffffffffffffff
	ldub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = ffff167a, %l7 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 180000ff, %f30 = 0076fa9a
	lda	[%i5+%o5]0x81,%f30	! %f30 = 180000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ffff0000, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_246:
!	%f26 = 00000000, Mem[0000000010181400] = 00000000
	sta	%f26,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f31 = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f31,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l4 = 00000000000000a2, Mem[0000000010101410] = 000000ff
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000a2
!	%l7 = 00000000000000ff, Mem[0000000020800001] = 0064160c, %asi = 80
	stba	%l7,[%o1+0x001]%asi	! Mem[0000000020800000] = 00ff160c
!	Mem[00000000300c1410] = 96ffffff, %l3 = 00000000f2ffffff
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 00000096000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010001410] = 000096ff
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	%l7 = 00000000000000ff, Mem[0000000030001408] = ffffffff
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%l4 = 00000000000000a2, Mem[0000000020800000] = 00ff160c, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 00a2160c
!	Mem[0000000030141408] = 18000000, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000018000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %l4 = 00000000000000a2
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_247:
!	Mem[0000000030041410] = ffff3cff, %l3 = 0000000000000096
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001400] = ffff3cff, %l3 = ffffffffffffffff
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 00ff000000000000, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 00ff000000000000
!	Mem[00000000300c1408] = 00000000, %f2  = 00000000
	lda	[%i3+%o4]0x81,%f2 	! %f2 = 00000000
!	Mem[0000000030081408] = ffffffff077c3869, %f28 = 00000000 00000000
	ldda	[%i2+%o4]0x89,%f28	! %f28 = ffffffff 077c3869
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000018
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1438] = 96271b53, %l1 = ffffffffffffffff
	lduh	[%i3+0x03a],%l1		! %l1 = 0000000000001b53
!	Mem[00000000211c0000] = fffffe22, %l4 = 00000000000000ff
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000020800040] = 000055e8, %l0 = 00000000b5000000
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 077c3869
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 077c0000

p0_label_248:
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ffff167a
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00ff167a
!	%f26 = 00000000 ff3c6439, Mem[0000000010101408] = 0000a9ff 449140ff
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 ff3c6439
!	Mem[0000000010181418] = 00003869, %l1 = 00001b53, %l4 = ffffffff
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000003869
!	Mem[0000000010181400] = 00000000, %l6 = 12400000000000ff
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 005b3cff, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f10 = 0076fa9a a6bfffab, Mem[0000000010081400] = 9ad40000 000000ff
	stda	%f10,[%i2+%g0]0x88	! Mem[0000000010081400] = 0076fa9a a6bfffab
!	Mem[0000000010181410] = ff000018, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ff000018
!	%l6 = 0000000000000000, Mem[0000000010081404] = 9afa7600, %asi = 80
	stha	%l6,[%i2+0x004]%asi	! Mem[0000000010081404] = 00007600
!	Mem[0000000010001410] = ffffffff00000000, %l1 = 0000000000001b53, %l0 = 00000000ff000018
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = ffffffff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000fa9aff3c5bff, %l5 = 00000000ff000000
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = 0000fa9aff3c5bff

p0_label_249:
!	Mem[00000000201c0000] = 00ff167a, %l2 = 0000000000000000
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ffffffff96, %f12 = 0000a9ff 0000ffff
	ldda	[%i0+%o4]0x88,%f12	! %f12 = 000000ff ffffff96
!	Mem[00000000300c1410] = ffffffff, %l2 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 077c3869, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000007
!	Mem[0000000030101400] = 000000ff, %l3 = 00ff000000000000
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff, %f28 = ffffffff
	lda	[%i2+%g0]0x81,%f28	! %f28 = 000000ff
!	Mem[0000000010141408] = 00000000 00000000, %l4 = 00003869, %l5 = ff3c5bff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081408] = 000000a2, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 69387c07ffffffff, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = 69387c07ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010081410] = ff5b3cff
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff3cff

p0_label_250:
!	%l2 = ffffffffffffffff, Mem[0000000010141420] = 00000000, %asi = 80
	stha	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = ffff0000
!	%f26 = 00000000 ff3c6439, %l0 = ffffffff00000000
!	Mem[0000000010001428] = 00000000ff000000
	add	%i0,0x028,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001428] = 00000000ff000000
!	%l1 = 0000000000001b53, Mem[0000000030081410] = 449140ff
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00001b53
!	%f4  = 00000000 449140ff, Mem[0000000030001408] = 000000ff 000000d1
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 449140ff
!	Mem[0000000010141410] = 077c3869, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 00000000077c3869
!	%f30 = 180000ff 00000000, %l0 = ffffffff00000000
!	Mem[0000000030041420] = 7509d28900000000
	add	%i1,0x020,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041420] = 7509d28900000000
!	%l3 = ffffffffffffffff, Mem[0000000010081408] = 000000a2
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	%f16 = 00000000 00000000 69387c07 ffffffff
!	%f20 = ff000000 ff000000 ff000000 000096ff
!	%f24 = 00009a39 00000018 00000000 ff3c6439
!	%f28 = 000000ff 077c3869 180000ff 00000000
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l1 = 0000000000001b53, Mem[0000000030101408] = 00000000
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00001b53
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_251:
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010101410] = 000000ff 000000ff, %l6 = ffffffff, %l7 = 00000007
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[00000000218001c0] = ffffa59a, %l5 = 00000000077c3869
	ldsba	[%o3+0x1c0]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081408] = 077c3869, %l1 = 0000000000001b53
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000069
!	Mem[00000000100c143c] = 00e4daff, %l3 = 0000000000000000
	lduba	[%i3+0x03f]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %f18 = 69387c07
	lda	[%i1+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000030181410] = 00004012, %l0 = ffffffff00000000
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000012
!	Mem[0000000030141400] = 00000000 0000ff00 ff000000 00000000
!	Mem[0000000030141410] = 180000ff ffffffa6 a3e23f32 659c7f47
!	Mem[0000000030141420] = 69742726 24009712 b5a4b37f 20be967f
!	Mem[0000000030141430] = 037cf402 45e82c3e 142ceda6 ffffffff
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000010181410] = 00000000, %f18 = 00000000
	lda	[%i6+%o5]0x88,%f18	! %f18 = 00000000
!	Mem[0000000020800040] = 000055e8, %l2 = ffffffffffffffff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = ff000000, Mem[0000000010041410] = ffffffff
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000

p0_label_252:
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[00000000211c0001] = fffffe22, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00fe22
!	%f24 = 00009a39 00000018, %l5 = ffffffffffffffff
!	Mem[0000000010181438] = 96271b530000d49a
	add	%i6,0x038,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_P ! Mem[0000000010181438] = 00009a3900000018
!	%l3 = 00000000000000ff, Mem[0000000030081400] = ff000000
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000ff
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000010041410] = 000000ff aefbe4e4
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000 000000ff
!	%l4 = 0000000000000000, Mem[000000001010142c] = ff3c6439, %asi = 80
	stwa	%l4,[%i4+0x02c]%asi	! Mem[000000001010142c] = 00000000
!	Mem[0000000010181400] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%f20 = ff000000 ff000000, Mem[0000000010181400] = 00000000 dd490000
	stda	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = ff3c6439, %l2 = 00000000ff000000
	lduw	[%i1+0x03c],%l2		! %l2 = 00000000ff3c6439

p0_label_253:
!	Mem[00000000211c0000] = ff00fe22, %l4 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000012, %l2 = 00000000ff3c6439, %l3  = 00000000000000ff
	mulx	%l0,%l2,%l3		! %l3 = 00000011f23f0c02
!	Mem[0000000030101410] = 449140ff 0000a9ff, %l0 = 00000012, %l1 = 00000069
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 000000000000a9ff 00000000449140ff
!	Mem[0000000030041400] = 00000000 00000000 00000000 00000000
!	Mem[0000000030041410] = ffff3cff 00000000 1800a9e5 39643cff
!	Mem[0000000030041420] = 7509d289 00000000 077c3869 00000000
!	Mem[0000000030041430] = e4e4fbae abffbfa6 ff000000 0000ff4c
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Mem[0000000010001418] = ff000000, %l5 = 0000000000000000
	lduwa	[%i0+0x018]%asi,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081400] = ff0000ff, %l0 = 000000000000a9ff
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = ff000000 000000ff, %l2 = ff3c6439, %l3 = f23f0c02
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Mem[000000001008141c] = 57404012, %l0 = 00000000000000ff
	lduwa	[%i2+0x01c]%asi,%l0	! %l0 = 0000000057404012
!	Mem[00000000100c1410] = ff000000, %l5 = 00000000ff000000
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = ff000000, Mem[0000000010141414] = 399a0000
	sta	%f20,[%i5+0x014]%asi	! Mem[0000000010141414] = ff000000

p0_label_254:
	membar	#Sync			! Added by membar checker (44)
!	%l2 = 00000000ff000000, Mem[0000000030041410] = 00000000ff3cffff
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000030141400] = 00000000
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%f20 = ff000000 ff000000, Mem[0000000030081408] = 69387c07 ffffffff
	stda	%f20,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000 ff000000
!	%f20 = ff000000 ff000000, %l7 = 0000000000000000
!	Mem[0000000030141408] = ff00000000000000
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141408] = ff00000000000000
!	Mem[00000000201c0001] = 00ff167a, %l0 = 0000000057404012
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030001408] = ff409144, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000ff409144
!	%f10 = 077c3869, Mem[0000000030041400] = 00000000
	sta	%f10,[%i1+%g0]0x89	! Mem[0000000030041400] = 077c3869
!	%l7 = 00000000ff409144, Mem[00000000211c0000] = ff00fe22, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 9144fe22
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 000096ff, %l5 = ffffffffffffffff
	lduw	[%i4+0x01c],%l5		! %l5 = 00000000000096ff

p0_label_255:
!	Mem[0000000030081410] = 00001b53, %l7 = 00000000ff409144
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000000001b53
!	Mem[0000000010081410] = 0000fa9aff3cffff, %f16 = 00000000 00000000
	ldda	[%i2+%o5]0x88,%f16	! %f16 = 0000fa9a ff3cffff
!	Mem[0000000010141400] = 000000a2, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ffffffff 077c3869, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000077c3869 00000000ffffffff
!	Mem[0000000010141400] = 000000a2, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff0000ff, %l6 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001400] = ffffffff077c3869, %f8  = 7509d289 00000000
	ldda	[%i0+%g0]0x81,%f8 	! %f8  = ffffffff 077c3869
!	Mem[0000000010101410] = ff000000 ff000000, %l6 = 000000ff, %l7 = 00001b53
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = ffff3cff 00000000 1800a9e5 39643cff
!	%f8  = ffffffff 077c3869 077c3869 00000000
!	%f12 = e4e4fbae abffbfa6 ff000000 0000ff4c
	stda	%f0,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400

p0_label_256:
!	Mem[00000000218001c0] = ffffa59a, %l5 = 00000000000096ff
	ldstub	[%o3+0x1c0],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000ffffffff
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030001408] = 00000000, %l7 = 00000000ff000000
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f18 = 00000000 ffffffff, Mem[00000000100c1408] = 077c0000 e4ffa747
	stda	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffff
!	%l2 = 00000000077c3869, Mem[00000000201c0000] = 00ff167a
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 69ff167a
!	%l0 = 00000000000000ff, Mem[0000000010001408] = 96ffffff
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff
!	Mem[00000000211c0001] = 9144fe22, %l3 = 00000000ff000000
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000044000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f30 = 180000ff 00000000, Mem[0000000010181400] = ff000000 ff000000
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 180000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffff00

p0_label_257:
!	Mem[00000000211c0000] = 91fffe22, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffff91
!	Mem[0000000010001410] = ffffffff00000000, %f28 = 000000ff 077c3869
	ldda	[%i0+0x010]%asi,%f28	! %f28 = ffffffff 00000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030141400] = 00000000 0000ff00 ff000000 00000000
!	Mem[0000000030141410] = 180000ff ffffffa6 a3e23f32 659c7f47
!	Mem[0000000030141420] = 69742726 24009712 b5a4b37f 20be967f
!	Mem[0000000030141430] = 037cf402 45e82c3e 142ceda6 ffffffff
	ldda	[%i5]ASI_BLK_SL,%f0	! Block Load from 0000000030141400
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 91fffe22, %l5 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1428] = 00ff0000, %l5 = ffffffffffffffff
	lduh	[%i3+0x02a],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l2 = 00000000077c3869
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000000000000000, %l2 = ffffffffffffffff
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff00, Mem[0000000020800040] = 000055e8, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = ff0055e8

p0_label_258:
!	%l7 = ffffffffffffff91, Mem[0000000010081400] = abffbfa600007600
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffffffffff91
!	Mem[0000000030001408] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (46)
!	%l6 = 00000000ff000000, Mem[0000000030141408] = 000000ff
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%f24 = 00009a39 00000018, Mem[0000000010181400] = 180000ff 00000000
	std	%f24,[%i6+%g0]	! Mem[0000000010181400] = 00009a39 00000018
!	%l0 = ffffff00, %l1 = 449140ff, Mem[0000000010041410] = 00000000 000000ff
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffff00 449140ff
!	Mem[0000000010181400] = 399a0000, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000399a0000
!	%f16 = 0000fa9a ff3cffff, Mem[0000000010001410] = ffffffff 00000000
	stda	%f16,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000fa9a ff3cffff
!	%l4 = 00000000399a0000, Mem[0000000010081400] = ffffffffffffff91
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000399a0000
!	%l7 = ffffffffffffff91, Mem[000000001004140a] = 00000000
	sth	%l7,[%i1+0x00a]		! Mem[0000000010041408] = 0000ff91
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %f30 = 180000ff
	lda	[%i4+%o5]0x88,%f30	! %f30 = 000000ff

p0_label_259:
!	Mem[00000000201c0000] = 69ff167a, %l5 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000069ff
!	Mem[00000000201c0000] = 69ff167a, %l3 = 0000000000000044
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000069ff
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000000069ff
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %f24 = 00009a39
	lda	[%i5+%g0]0x81,%f24	! %f24 = 00000000
!	Mem[0000000010181410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 00000000ff000000
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101414] = ff000000, %l0 = ffffffffffffff00
	lduba	[%i4+0x017]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001010140b] = 69387c07, %l4 = 00000000399a0000
	ldstuba	[%i4+0x00b]%asi,%l4	! %l4 = 00000007000000ff

p0_label_260:
!	%l3 = 0000000000000000, Mem[0000000010141400] = 00000000
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = 0000000000000000
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000030001400] = ffffffff
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ffffff
!	%l3 = 0000000000000000, Mem[0000000030001408] = 00000000000000ff
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	Mem[0000000010141424] = ffffffff, %l7 = ffffffffffffff91, %asi = 80
	swapa	[%i5+0x024]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000007
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041420] = ff000000, %l6 = 0000000000000000
	swap	[%i1+0x020],%l6		! %l6 = 00000000ff000000
!	Mem[0000000010081408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 00000000 00000000, %l0 = ffffffff, %l1 = 449140ff
	ldda	[%i4+0x028]%asi,%l0	! %l0 = 0000000000000000 0000000000000000

p0_label_261:
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 00ffffff, %l5 = 00000000000069ff
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000ffffff
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000000ff
	ldsh	[%i5+0x002],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l7 = 00000000ffffffff
	ldsba	[%i4+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = ff000000, %f21 = ff000000
	lda	[%i2+%o4]0x81,%f21	! %f21 = ff000000
!	Mem[0000000010101408] = ff7c3869, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000003869
!	Mem[0000000030101410] = ffa90000ff409144, %l7 = ffffffffffffffff
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = ffa90000ff409144
!	Mem[000000001014140c] = 00000000, %l3 = 0000000000000000
	ldsw	[%i5+0x00c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101410] = ffa90000ff409144, %f16 = 0000fa9a ff3cffff
	ldda	[%i4+%o5]0x81,%f16	! %f16 = ffa90000 ff409144
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 ffffffff, %l1 = 0000000000000000
!	Mem[0000000030181410] = 12400000000000ff
	add	%i6,0x010,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181410] = 12400000000000ff

p0_label_262:
!	Mem[0000000010041400] = ff0000ff, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010141407] = 00000000, %l1 = 0000000000000000
	ldstub	[%i5+0x007],%l1		! %l1 = 00000000000000ff
!	%l6 = 00000000ff000000, Mem[0000000030101410] = 0000a9ff
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010001410] = 9afa0000, %l5 = 0000000000ffffff
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 000000009afa0000
!	%l1 = 0000000000000000, Mem[000000001008141c] = 57404012
	stw	%l1,[%i2+0x01c]		! Mem[000000001008141c] = 00000000
!	Mem[0000000030041400] = 69387c07, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000069000000ff
!	%l7 = ffa90000ff409144, Mem[00000000300c1410] = ffffffff
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff409144
!	Mem[0000000010001400] = ff3cffff0000d49a, %l7 = ffa90000ff409144, %l1 = 0000000000000000
	casxa	[%i0]0x80,%l7,%l1	! %l1 = ff3cffff0000d49a
!	%l6 = ff000000, %l7 = ff409144, Mem[0000000010081400] = 00000000 399a0000
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000 ff409144
!	Starting 10 instruction Load Burst
!	Mem[0000000010041414] = 449140ff, %l3 = 0000000000000069
	lduha	[%i1+0x014]%asi,%l3	! %l3 = 0000000000004491

p0_label_263:
!	Mem[0000000030181400] = 077c3869, %l1 = ff3cffff0000d49a
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000007
!	Mem[0000000030101410] = 00000000, %l5 = 000000009afa0000
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 0000000000001b53, %f14 = ffffffff a6ed2c14
	ldda	[%i4+%o4]0x89,%f14	! %f14 = 00000000 00001b53
!	Mem[0000000010041408] = 0000ff91 71000000, %l6 = ff000000, %l7 = ff409144
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ff91 0000000071000000
!	Mem[0000000010041410] = 00ffffff, %l1 = 0000000000000007
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 449140ff, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 69387cff, %l3 = 0000000000004491
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = 0000000069387cff
!	Mem[0000000030081400] = 9ad40000ff0000ff, %f26 = 00000000 ff3c6439
	ldda	[%i2+%g0]0x89,%f26	! %f26 = 9ad40000 ff0000ff
!	Mem[00000000100c1400] = 00000000 00000000 ffffffff 00000000
!	Mem[00000000100c1410] = ffffffff 00000000 000000ff b5a4b37f
!	Mem[00000000100c1420] = 00009a39 00000018 00ff0000 ff3c6439
!	Mem[00000000100c1430] = 00000000 00000000 96271b53 00e4daff
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%f8  = 12970024 26277469, Mem[00000000300c1400] = 000000ff 00000000
	stda	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 12970024 26277469

p0_label_264:
!	%f14 = 00000000, Mem[0000000010081408] = ffffffff
	st	%f14,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	%l6 = 000000000000ff91, Mem[00000000300c1400] = 6974272624009712
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000000000ff91
	membar	#Sync			! Added by membar checker (47)
!	%l6 = 0000ff91, %l7 = 71000000, Mem[00000000100c1410] = ffffffff 00000000
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff91 71000000
!	Mem[0000000010081400] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l6 = 000000000000ff91
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = ff3cffff, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = 000000ff, %l3 = 69387cff, Mem[0000000010141408] = 00000000 00000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 69387cff
!	%l4 = 00000000ff0000ff, Mem[0000000010181408] = 000000ff
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l4 = 00000000ff0000ff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_265:
!	Mem[00000000300c1408] = abffbfa600000000, %f12 = 3e2ce845 02f47c03
	ldda	[%i3+%o4]0x89,%f12	! %f12 = abffbfa6 00000000
!	Mem[00000000201c0000] = 69ff167a, %l7 = 0000000071000000
	ldub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010141410] = ffff3cff00000000, %f24 = 18000000 399a0000
	ldda	[%i5+%o5]0x88,%f24	! %f24 = ffff3cff 00000000
!	Mem[000000001000142c] = ff000000, %l3 = 0000000069387cff
	lduba	[%i0+0x02f]%asi,%l3	! %l3 = 0000000000000000
!	Randomly selected nop
	nop
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c0] = ffffa59a, %l3 = 0000000000000000
	ldub	[%o3+0x1c1],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001410] = ffffff00 ff3cffff, %l0 = 00003869, %l1 = ffffffff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffffff00 00000000ff3cffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_266:
!	Mem[00000000100c1408] = ffffffff, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010001410] = 00ffffff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030141408] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f31 = 531b2796, Mem[00000000100c1400] = 00000000
	sta	%f31,[%i3+%g0]0x88	! Mem[00000000100c1400] = 531b2796
!	%l4 = 00000000ffffffff, Mem[0000000030041410] = 000000ff
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff00ff
!	%l3 = 00000000000000ff, Mem[0000000030041400] = ff387c0700000000
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff
!	%f4  = a6ffffff ff000018, Mem[00000000300c1400] = 0000ff91 00000000
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = a6ffffff ff000018
!	Mem[0000000010141414] = ff3cffff, %l3 = 00000000000000ff
	swap	[%i5+0x014],%l3		! %l3 = 00000000ff3cffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_267:
!	Mem[0000000010001410] = ffffff00 ff3cffff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ffffff00 00000000ff3cffff
!	Mem[0000000030101410] = 00000000, %l1 = 00000000ff3cffff
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l5 = 00000000ff3cffff
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = ff00ffff, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[000000001008140c] = ffffffff, %l1 = 000000000000ffff
	lduwa	[%i2+0x00c]%asi,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030081410] = 531b0000, %l0 = 00000000ffffff00
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000053
!	Mem[0000000010041410] = ffffff00, %l4 = 00000000ffffff00
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 000000ff, Mem[0000000030101400] = ff000000 a6ed2c14
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000 000000ff

p0_label_268:
!	Mem[0000000030181400] = 077c3869 00000000 00000000 077c3869
!	Mem[0000000030181410] = 12400000 000000ff 7fb3a4b5 ff000000
!	Mem[0000000030181420] = 18000000 399a0000 39643cff 00000000
!	Mem[0000000030181430] = 00000000 00000000 00000000 000000ff
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Mem[0000000010181405] = 00000018, %l6 = ffffffffff000000
	ldstub	[%i6+0x005],%l6		! %l6 = 00000000000000ff
!	%l0 = 0000000000000053, Mem[0000000030081410] = 531b0000
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00530000
!	%l6 = 0000000000000000, Mem[0000000030141410] = ff000018
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000030081410] = 00005300, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000005300
!	Mem[0000000030141408] = 000000ff, %l4 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001410] = ffff0000, %l1 = 00000000ffffffff
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010101404] = 00000000, %l1 = 00000000ffff0000
	swap	[%i4+0x004],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_269:
!	Mem[0000000030041410] = ffff00ff, %l7 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000053
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00ff000000000000, %f22 = 7fb3a4b5 ff000000
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 00ff0000 00000000
!	Mem[00000000218000c0] = 00ffff0b, %l2 = 0000000000000000
	ldsb	[%o3+0x0c1],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00ffffff, %l0 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l0	! %l0 = 0000000000ffffff
!	Mem[00000000201c0000] = 69ff167a, %l7 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000069
!	Mem[0000000030041410] = ff00ffff, %l2 = ffffffffffffffff
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = ffffffffff00ffff
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000005300
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = ffdae400 531b2796, Mem[0000000010041400] = 00000000 9afa0000
	stda	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = ffdae400 531b2796

p0_label_270:
!	%l3 = 00000000ff3cffff, Mem[0000000010101408] = 69387cff, %asi = 80
	stwa	%l3,[%i4+0x008]%asi	! Mem[0000000010101408] = ff3cffff
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000ffffff
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = ff409144, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff409144
!	%l3 = 00000000ff3cffff, Mem[000000001004143e] = ff3c6439
	sth	%l3,[%i1+0x03e]		! Mem[000000001004143c] = ff3cffff
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000ff409144, Mem[0000000010181400] = 00000000
	stwa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ff409144
!	Mem[0000000030081400] = ff0000ff, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000ff0000ff
!	%l7 = 0000000000000069, Mem[0000000010001408] = ffffffff
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000069
!	Mem[0000000030001408] = 000000ff, %l7 = 0000000000000069
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 000000ff, %l1 = 0000000000000000
	ldub	[%i2+0x026],%l1		! %l1 = 0000000000000000

p0_label_271:
!	Mem[0000000030001400] = 00ffffff, %l6 = 00000000ff409144
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = ffff028c, %l1 = 0000000000000000
	ldsba	[%o3+0x181]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000ff91 71000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 000000000000ff91 0000000071000000
!	Mem[00000000300c1408] = ff000000a6bfffab, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = ff000000a6bfffab
!	Mem[0000000030181408] = 00000000, %l0 = ff000000a6bfffab
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ff3cffff, %l7 = 0000000071000000
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001400] = ff3cffff 0000d49a, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff3cffff 000000000000d49a
!	Mem[00000000211c0000] = 91fffe22, %l1 = 000000000000d49a
	ldsb	[%o2+%g0],%l1		! %l1 = ffffffffffffff91
!	%l7 = 000000000000ffff, Mem[0000000030081410] = 00000000
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff0000
!	Starting 10 instruction Store Burst
!	%f2  = 69387c07 00000000, Mem[0000000010041400] = 96271b53 00e4daff
	stda	%f2 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 69387c07 00000000

p0_label_272:
!	%l0 = 00000000ff3cffff, Mem[0000000010001408] = 00000069
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l6 = 0000ff91, %l7 = 0000ffff, Mem[0000000010001410] = ffffff00 ff3cffff
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ff91 0000ffff
!	Mem[0000000010081400] = 000000ff, %l2 = ffffffffff00ffff
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%f28 = 00000000, Mem[00000000100c1434] = 00000000
	sta	%f28,[%i3+0x034]%asi	! Mem[00000000100c1434] = 00000000
!	%l6 = 0000ff91, %l7 = 0000ffff, Mem[0000000010081400] = 000000ff 449140ff
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ff91 0000ffff
!	%f26 = 39643cff 0000ff00, %l1 = ffffffffffffff91
!	Mem[0000000030041400] = 00000000000000ff
	stda	%f26,[%i1+%l1]ASI_PST32_S ! Mem[0000000030041400] = 000000000000ff00
!	Mem[0000000010081438] = 69387c07, %l0 = ff3cffff, %l3 = ff3cffff
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000069387c07
!	%f5  = 00004012, Mem[000000001018141c] = b5a4b37f
	sta	%f5 ,[%i6+0x01c]%asi	! Mem[000000001018141c] = 00004012
!	%f24 = ffff3cff 00000000, Mem[0000000010141420] = 69387c07 ffffff91
	std	%f24,[%i5+0x020]	! Mem[0000000010141420] = ffff3cff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffff3cff, %l1 = ffffffffffffff91
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_273:
!	Mem[0000000010081400] = 0000ffff 0000ff91, %l2 = 000000ff, %l3 = 69387c07
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000000000ff91 000000000000ffff
!	Mem[00000000100c1400] = 96271b53, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = ffffffff96271b53
!	Mem[0000000021800000] = 0024a558, %l5 = 00000000ff0000ff
	ldsh	[%o3+%g0],%l5		! %l5 = 0000000000000024
!	Mem[0000000010001434] = ff000000, %l7 = 000000000000ffff
	lduw	[%i0+0x034],%l7		! %l7 = 00000000ff000000
!	Mem[0000000010081400] = 91ff0000, %l6 = 000000000000ff91
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 00000000000091ff
!	Mem[00000000300c1400] = 180000ff ffffffa6, %l6 = 000091ff, %l7 = ff000000
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000180000ff 00000000ffffffa6
!	Mem[0000000010041410] = ffffff00, %l5 = 0000000000000024
	lduha	[%i1+0x012]%asi,%l5	! %l5 = 000000000000ff00
!	Mem[000000001000140c] = ff000000, %l5 = 000000000000ff00
	lduh	[%i0+0x00e],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l4 = ffffffff96271b53
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101425] = 00000018, %l5 = 0000000000000000
	ldstuba	[%i4+0x025]%asi,%l5	! %l5 = 00000000000000ff

p0_label_274:
!	%f4  = ff000000, Mem[0000000030041408] = 00000000
	sta	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	%l4 = 0000000000000000, Mem[0000000030041408] = 00000000000000ff
	stxa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l2 = 000000000000ff91
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181434] = 180000ff, %l6 = 00000000180000ff, %asi = 80
	swapa	[%i6+0x034]%asi,%l6	! %l6 = 00000000180000ff
!	%l4 = 0000000000000000, Mem[0000000010081400] = 0000ff91
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%f16 = 00000000 00000000, Mem[0000000010081408] = 00000000 ffffffff
	stda	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	Mem[0000000030001410] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000180000ff, Mem[0000000010001410] = 0000ff910000ffff
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000180000ff
!	Mem[0000000010101400] = 00000000, %l7 = 00000000ffffffa6
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l0 = 00000000ff3cffff
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_275:
!	Mem[0000000010101408] = ff3cffff, %l3 = 000000000000ffff
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = ffff000000000018, %f22 = 00ff0000 00000000
	ldda	[%i2+%o5]0x81,%f22	! %f22 = ffff0000 00000018
!	Mem[0000000030041400] = 00000000, %l6 = 00000000180000ff
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ffff3cff 9afa0000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffff3cff 000000009afa0000
!	Mem[00000000100c1400] = 96271b5300000000, %l2 = 00000000ffff3cff
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 96271b5300000000
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ffff3cff, %f19 = ffffffff
	lda	[%i0+%g0]0x88,%f19	! %f19 = ffff3cff
!	Mem[0000000010141410] = ff00000000000000, %f22 = ffff0000 00000018
	ldda	[%i5+%o5]0x88,%f22	! %f22 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010081408] = 00000000 00000000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 ffffffff

p0_label_276:
!	%f18 = 00000000 ffff3cff, Mem[0000000010001408] = ff000000 ff000000
	stda	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 ffff3cff
!	%l6 = 0000000000000000, Mem[0000000010041438] = 0000189a
	stw	%l6,[%i1+0x038]		! Mem[0000000010041438] = 00000000
!	%l5 = 00000000000000ff, Mem[00000000100c1418] = 000000ffb5a4b37f
	stx	%l5,[%i3+0x018]		! Mem[00000000100c1418] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010041408] = 0000ff91
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f6  = 000000ff b5a4b37f, %l2 = 96271b5300000000
!	Mem[00000000300c1418] = 835bd3f743a68cc6
	add	%i3,0x018,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_S ! Mem[00000000300c1418] = 835bd3f743a68cc6
!	Mem[0000000030181408] = 00000000, %l2 = 96271b5300000000
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f10 = 00000000, Mem[0000000030101410] = 00000000
	sta	%f10,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff91, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ff91

p0_label_277:
!	Mem[0000000030141400] = 000000000000ff00, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081430] = b5a4b37f00fb00e4, %f30 = ffdae400 531b2796
	ldd	[%i2+0x030],%f30	! %f30 = b5a4b37f 00fb00e4
!	Mem[0000000010001408] = 00000000, %l2 = 000000000000ff00
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 0000ff9171000000, %f12 = 00000000 00000000
	ldda	[%i3+%o5]0x80,%f12	! %f12 = 0000ff91 71000000
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 0000000000000000
	setx	0xfd52f2e07a78a590,%g7,%l0 ! %l0 = fd52f2e07a78a590
!	%l1 = ffffffffffffffff
	setx	0xd5a181cf8f242781,%g7,%l1 ! %l1 = d5a181cf8f242781
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fd52f2e07a78a590
	setx	0x93bc50e7b0444eda,%g7,%l0 ! %l0 = 93bc50e7b0444eda
!	%l1 = d5a181cf8f242781
	setx	0xa0102637eed8195d,%g7,%l1 ! %l1 = a0102637eed8195d
!	Mem[0000000020800040] = ff0055e8, %l6 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030081400] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l4 = 000000000000ff91
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[000000001018141c] = 00004012, %l5 = 0000000000000000
	ldsba	[%i6+0x01c]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010041400] = 077c3869 00000000
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000000

p0_label_278:
!	Mem[0000000010001424] = a6ede4e4, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x024]%asi,%l7	! %l7 = 00000000a6ede4e4
!	%l3 = 000000009afa0000, Mem[0000000010181408] = ff00000000000000
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000009afa0000
!	%f30 = b5a4b37f 00fb00e4, Mem[0000000010081420] = ffccaca2 000000ff
	stda	%f30,[%i2+0x020]%asi	! Mem[0000000010081420] = b5a4b37f 00fb00e4
!	Mem[0000000010141434] = aefbe4e4, %l7 = 00000000a6ede4e4
	ldstub	[%i5+0x034],%l7		! %l7 = 000000ae000000ff
!	%l0 = 93bc50e7b0444eda, Mem[00000000100c1430] = 00000000, %asi = 80
	stwa	%l0,[%i3+0x030]%asi	! Mem[00000000100c1430] = b0444eda
!	%l7 = 00000000000000ae, Mem[0000000030081400] = ff0000000000d49a
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ae
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081408] = 00000000 ffffffff
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	Mem[0000000010041408] = 00000000, %l6 = ffffffffffffff00
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010081410] = ffff3cff
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff3cff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010101400] = ff000000 ffff0000 ff3cffff ffffffff
!	Mem[0000000010101410] = ff000000 ff000000 ff000000 000096ff
!	Mem[0000000010101420] = 00009a39 00ff0018 00000000 00000000
!	Mem[0000000010101430] = 000000ff 077c3869 180000ff 00000000
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400

p0_label_279:
!	Mem[00000000201c0000] = 69ff167a, %l4 = 0000000000000000
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000069
!	Mem[0000000030001410] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 0000ffff00000000, %l1 = a0102637eed8195d
	ldxa	[%i2+%g0]0x88,%l1	! %l1 = 0000ffff00000000
!	Mem[0000000010181414] = a2accca2, %l5 = ffffffffffffffff
	lduh	[%i6+0x014],%l5		! %l5 = 000000000000a2ac
!	Mem[0000000010041418] = ff3cffff, %l1 = 0000ffff00000000
	ldsw	[%i1+0x018],%l1		! %l1 = ffffffffff3cffff
!	Mem[0000000030141410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = ff00000000000000, %l5 = 000000000000a2ac
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = ff00000000000000
!	Mem[0000000010101408] = ff3cffff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = ffffffff00000000, %f14 = ff000000 00000000
	ldda	[%i3+%o5]0x89,%f14	! %f14 = ffffffff 00000000
!	Starting 10 instruction Store Burst
!	%f14 = ffffffff 00000000, Mem[0000000010181400] = 449140ff 1800ff00
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 00000000

p0_label_280:
!	%l4 = 0000000000000069, Mem[0000000030101408] = 531b0000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00690000
!	Mem[00000000100c1424] = 00000018, %l7 = 000000ae, %l4 = 00000069
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000018
!	%l4 = 0000000000000018, Mem[000000001008143a] = 69387c07, %asi = 80
	stha	%l4,[%i2+0x03a]%asi	! Mem[0000000010081438] = 69380018
!	%f4  = ff000000 00004012, Mem[0000000010141400] = 00000000 ff000000
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000 00004012
!	%f9  = 00000018, Mem[0000000010041430] = abffbfa6
	st	%f9 ,[%i1+0x030]	! Mem[0000000010041430] = 00000018
!	Mem[00000000100c1428] = 00ff0000, %l4 = 0000000000000018
	ldstuba	[%i3+0x028]%asi,%l4	! %l4 = 00000000000000ff
!	%f0  = 00000000 69387c07 69387c07 00000000
!	%f4  = ff000000 00004012 000000ff b5a4b37f
!	%f8  = 00009a39 00000018 00000000 ff3c6439
!	%f12 = 0000ff91 71000000 ffffffff 00000000
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l5 = ff00000000000000, Mem[0000000010001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000030001408] = ff0000ff, %l0 = 93bc50e7b0444eda
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00006900, %l7 = 00000000000000ae
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 0000000000006900

p0_label_281:
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000000ffff0000, %f20 = 000000ff 000000ff
	ldda	[%i2+%g0]0x80,%f20	! %f20 = 00000000 ffff0000
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 0000ffff, %f20 = 00000000
	lda	[%i2+%o5]0x89,%f20	! %f20 = 0000ffff
!	Mem[0000000030141400] = 00ff000000000000, %f18 = ffffffff ffff3cff
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 00ff0000 00000000
!	Mem[0000000030081408] = ff000000, %l1 = ffffffffff3cffff
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (49)
!	Mem[00000000100c1408] = 00000000000000ff, %f30 = 00000000 ff000018
	ldda	[%i3+%o4]0x88,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010001400] = ffff3cff, %l7 = 0000000000006900
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l5 = ff00000000000000
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000010101400] = ff000000
	stba	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000

p0_label_282:
!	%l6 = ffffffffffffffff, Mem[0000000010101410] = ff000000ff000000
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffffffffffff
!	Mem[0000000010081410] = ff3cff00, %l0 = 00000000ff0000ff
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000ff3cff00
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010001400] = ffff3cff 9ad40000
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff 000000ff
!	%l3 = 000000009afa0000, Mem[0000000010141408] = 000000ff
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 9afa0000
!	%f7  = b5a4b37f, Mem[0000000030181408] = 00000000
	sta	%f7 ,[%i6+%o4]0x81	! Mem[0000000030181408] = b5a4b37f
!	Mem[0000000030181410] = 00004012, %l0 = 00000000ff3cff00
	ldstuba	[%i6+%o5]0x89,%l0	! %l0 = 00000012000000ff
!	%f22 = ff960000 000000ff, Mem[0000000010181438] = 00009a39 00000018
	std	%f22,[%i6+0x038]	! Mem[0000000010181438] = ff960000 000000ff
!	%l0 = 0000000000000012, Mem[0000000030141400] = 00ff000000000000
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000012
!	%l5 = 0000000000000000, Mem[0000000030041410] = 00000000ff00ffff
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffff, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 000000000000ffff

p0_label_283:
!	Mem[0000000010141410] = 00000000 000000ff, %l2 = 0000ffff, %l3 = 9afa0000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[00000000300c1400] = 0000000069387c07, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 0000000069387c07
!	Mem[0000000010081404] = ffff0000, %l0 = 0000000000000012
	lduba	[%i2+0x005]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = ffffff00 449140ff, %l2 = 69387c07, %l3 = 000000ff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ffffff00 00000000449140ff
!	Mem[0000000010041410] = ffffff00, %l6 = ffffffffffffffff
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081420] = b5a4b37f 00fb00e4, %l2 = ffffff00, %l3 = 449140ff
	ldd	[%i2+0x020],%l2		! %l2 = 00000000b5a4b37f 0000000000fb00e4
!	Mem[00000000100c1408] = 000000ff, %l2 = 00000000b5a4b37f
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010041408] = 00ffffff, %l6 = ffffffffffffffff
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001408] = 00000000 ffff3cff
	std	%l6,[%i0+%o4]		! Mem[0000000010001408] = 000000ff 000000ff

p0_label_284:
!	%l2 = ffffffffffffffff, Mem[0000000010081410] = ff0000ff
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ff0000ff
!	Mem[0000000010141408] = 9afa0000, %l1 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 000000009afa0000
!	%l7 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stha	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000
!	%l0 = 000000ff, %l1 = 9afa0000, Mem[0000000030181410] = ff400000 000000ff
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 9afa0000
!	%l5 = 0000000000000000, Mem[0000000010081418] = 00000000, %asi = 80
	stwa	%l5,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000
!	Mem[00000000100c1418] = 00000000000000ff, %l4 = 0000000000000000, %l5 = 0000000000000000
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030001400] = 00ffffff
	stha	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ffff
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = ffffffffffffffff, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00690000, %l1 = 000000009afa0000
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000069

p0_label_285:
!	Mem[0000000010001400] = 000000ffffffffff, %f26 = 00000000 00000000
	ldda	[%i0+%g0]0x88,%f26	! %f26 = 000000ff ffffffff
!	Mem[0000000030041410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101418] = ff000000 000096ff, %l0 = 000000ff, %l1 = 00000069
	ldd	[%i4+0x018],%l0		! %l0 = 00000000ff000000 00000000000096ff
!	Mem[0000000030001400] = ffff0000, %l2 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001418] = ff000000e5ff0018, %l1 = 00000000000096ff
	ldx	[%i0+0x018],%l1		! %l1 = ff000000e5ff0018
!	Mem[0000000010001408] = ff000000, %l6 = 00000000000000ff
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff 000000ff, %l2 = 00000000, %l3 = 00fb00e4
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff 000000000000ffff
!	Mem[0000000020800000] = 00a2160c, %l0 = 00000000ff000000
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000a2
!	Mem[0000000010141410] = ffffffff000000ff, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = ffffffff000000ff
!	Starting 10 instruction Store Burst
!	%f31 = 000000ff, Mem[0000000030141400] = 00000012
	sta	%f31,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff

p0_label_286:
!	%l0 = 000000a2, %l1 = e5ff0018, Mem[0000000030041400] = 00000000 00ff0000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000a2 e5ff0018
!	%l4 = 0000000000000000, Mem[0000000010141408] = ffffffff
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f2  = 69387c07 00000000, Mem[0000000010181410] = 00000000 a2accca2
	stda	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 69387c07 00000000
!	%f26 = 000000ff ffffffff, %l0 = 00000000000000a2
!	Mem[0000000010101400] = ff000000ffff0000
	stda	%f26,[%i4+%l0]ASI_PST16_P ! Mem[0000000010101400] = ff000000ffff0000
!	Mem[0000000030141400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f10 = 00000000 ff3c6439, Mem[0000000010181410] = 077c3869 00000000
	stda	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 ff3c6439
!	Mem[0000000010081410] = ff0000ff, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	%l0 = 000000a2, %l1 = e5ff0018, Mem[0000000030081410] = 0000ffff 18000000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000a2 e5ff0018
!	%l5 = 0000000000000000, Mem[0000000030181408] = b5a4b37f
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00a4b37f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = ff960000000000ff, %l7 = 00000000000000ff
	ldxa	[%i6+0x038]%asi,%l7	! %l7 = ff960000000000ff

p0_label_287:
!	Mem[0000000010041410] = 00ffffff, %l6 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 39643cff, %l3 = 000000000000ffff
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000003964
!	Mem[0000000030141400] = 00000000 000000ff, %l0 = 000000a2, %l1 = e5ff0018
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000030041410] = 00000000 00000000, %l2 = 000000ff, %l3 = 00003964
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010181410] = ff3c6439, %l5 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000006439
!	Mem[0000000030041410] = 00000000 00000000, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030181410] = 000000ff 9afa0000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff 000000009afa0000
!	Mem[0000000030041408] = 00000000, %l3 = 000000009afa0000
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 0000ffff, Mem[0000000010101408] = ffff3cff
	sta	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000ffff

p0_label_288:
!	%f0  = 00000000 69387c07 69387c07 00000000
!	%f4  = ff000000 00004012 000000ff b5a4b37f
!	%f8  = 00009a39 00000018 00000000 ff3c6439
!	%f12 = 0000ff91 71000000 ffffffff 00000000
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[00000000211c0001] = 91fffe22, %l1 = 0000000000000000
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030141410] = 00004012, %l5 = 0000000000006439
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000004012
!	%f1  = 69387c07, Mem[00000000100c1410] = 0000ff91
	sta	%f1 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 69387c07
!	Mem[0000000010101420] = 00009a39, %l2 = 000000ff, %l7 = 00000000
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 0000000000009a39
!	Mem[0000000030081408] = 000000ff, %l5 = 0000000000004012
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%f18 = 00ff0000, Mem[0000000010141408] = 00000000
	sta	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = 00ff0000
!	%l5 = 00000000000000ff, Mem[0000000030101400] = 00ff0000000000ff
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041400] = 0000000000000000, %asi = 80
	stxa	%l5,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000000000000000, %f2  = 69387c07 00000000
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = 00000000 00000000

p0_label_289:
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = b0444eda, %l7 = 0000000000009a39
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000004eda
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = ff409144 00ffffff, %l6 = 00000000, %l7 = 00004eda
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 0000000000ffffff 00000000ff409144
!	Code Fragment 3
p0_fragment_9:
!	%l0 = ffffffffffffffff
	setx	0xb1f0b58fdcb10bd6,%g7,%l0 ! %l0 = b1f0b58fdcb10bd6
!	%l1 = 00000000000000ff
	setx	0x62a35687e9adc49f,%g7,%l1 ! %l1 = 62a35687e9adc49f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b1f0b58fdcb10bd6
	setx	0xb4a0ee507493fa8a,%g7,%l0 ! %l0 = b4a0ee507493fa8a
!	%l1 = 62a35687e9adc49f
	setx	0x88f92ed7ceae3ec5,%g7,%l1 ! %l1 = 88f92ed7ceae3ec5
!	Mem[0000000010101410] = ffffffff, %f1  = 69387c07
	lda	[%i4+%o5]0x88,%f1 	! %f1 = ffffffff
!	Mem[0000000010141408] = 00ff0000, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000ff0000
!	Mem[00000000211c0000] = 91fffe22, %l0 = b4a0ee507493fa8a
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffff91
!	Mem[0000000010081400] = 00000000, %l7 = 00000000ff409144
	lduba	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000

p0_label_290:
!	%f24 = 1800ff00 399a0000, Mem[0000000010141410] = ffffffff ff000000
	stda	%f24,[%i5+%o5]0x88	! Mem[0000000010141410] = 1800ff00 399a0000
!	%l3 = 0000000000000000, Mem[0000000021800181] = ffff028c
	stb	%l3,[%o3+0x181]		! Mem[0000000021800180] = ff00028c
!	Mem[0000000010181410] = 39643cff, %l2 = 0000000000ff0000
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000039643cff
!	%f24 = 1800ff00 399a0000, Mem[0000000030101410] = 00000000 ff409144
	stda	%f24,[%i4+%o5]0x81	! Mem[0000000030101410] = 1800ff00 399a0000
!	Mem[0000000010041405] = 000000ff, %l3 = 0000000000000000
	ldstub	[%i1+0x005],%l3		! %l3 = 00000000000000ff
!	%f16 = 0000ffff 000000ff 00ff0000 00000000
!	%f20 = 0000ffff ffff0000 ff960000 000000ff
!	%f24 = 1800ff00 399a0000 000000ff ffffffff
!	%f28 = 69387c07 ff000000 00000000 000000ff
	stda	%f16,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%f2  = 00000000, Mem[000000001000143c] = 0000ff40
	sta	%f2 ,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00000000
	membar	#Sync			! Added by membar checker (51)
!	%f12 = 0000ff91 71000000, Mem[0000000030101408] = 00ff0000 00000000
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff91 71000000
!	%f22 = ff960000 000000ff, Mem[0000000010101410] = ffffffff ffffffff
	stda	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = ff960000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181424] = ff409144, %l1 = 88f92ed7ceae3ec5
	ldsw	[%i6+0x024],%l1		! %l1 = ffffffffff409144

p0_label_291:
!	Mem[0000000010181400] = 00000000, %f7  = b5a4b37f
	lda	[%i6+%g0]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000030041410] = 0000000000000000, %l2 = 0000000039643cff
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 12400000, %l6 = 0000000000ffffff
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000012
!	Mem[0000000030001410] = ffffffff000000ff, %f28 = 69387c07 ff000000
	ldda	[%i0+%o5]0x81,%f28	! %f28 = ffffffff 000000ff
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010101400] = 00000000 ffff0000 ffff0000 ffffffff
!	Mem[0000000010101410] = ff960000 000000ff ff000000 000096ff
!	Mem[0000000010101420] = 00009a39 00ff0018 00000000 00000000
!	Mem[0000000010101430] = 000000ff 077c3869 180000ff 00000000
	ldda	[%i4]ASI_BLK_PL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010181410] = 00ff0000, %l6 = 0000000000000012
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000ff0000
!	Mem[00000000201c0000] = 69ff167a, %l1 = ffffffffff409144
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000069ff
!	Mem[00000000100c1408] = 000000ff, %l1 = 00000000000069ff
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 39640000, %l2 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000003964
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (53)
!	%l1 = 00000000000000ff, Mem[0000000010101410] = ff960000
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff

p0_label_292:
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000ff0000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f22 = ff960000 000000ff, %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 077c386900000000
	stda	%f22,[%i3+%l1]ASI_PST32_S ! Mem[00000000300c1400] = ff960000000000ff
!	Mem[0000000030101400] = 0000ffff, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 00ff0000, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c141c] = 000000ff, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x01c]%asi,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 69387c07
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 69387c00
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l2 = 0000000000003964, Mem[00000000100c1410] = 00000071077c3869
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000003964
!	%f19 = 00000000, Mem[0000000030141400] = 69387c07
	sta	%f19,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %f26 = 000000ff
	lda	[%i1+%o5]0x81,%f26	! %f26 = 00000000

p0_label_293:
!	Mem[00000000300c1410] = 12400000000000ff, %l2 = 0000000000003964
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 12400000000000ff
!	Mem[0000000010041400] = 00000000, %l4 = 00000000ff0000ff
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = ffffff00, %l7 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 00000000 b0444eda, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 00000000b0444eda 0000000000000000
!	Mem[0000000030141408] = 00000000, %l0 = ffffffffffffff91
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ffff00ff, %f3  = 0000ffff
	lda	[%i4+%g0]0x89,%f3 	! %f3 = ffff00ff
!	Mem[0000000010101408] = ffff0000, %l2 = 12400000000000ff
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00ff0000, %l5 = 0000000000000000
	ldsh	[%i6+0x002],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000030001410] = ffffffff ff000000
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 ffffffff

p0_label_294:
!	Mem[000000001010142c] = 00000000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x02c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x994fd1e7eee8827b,%g7,%l0 ! %l0 = 994fd1e7eee8827b
!	%l1 = 0000000000000000
	setx	0x5dfee1c867a1b7cd,%g7,%l1 ! %l1 = 5dfee1c867a1b7cd
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 994fd1e7eee8827b
	setx	0x39781f87cfb11ec2,%g7,%l0 ! %l0 = 39781f87cfb11ec2
!	%l1 = 5dfee1c867a1b7cd
	setx	0xbbb5ca900700b907,%g7,%l1 ! %l1 = bbb5ca900700b907
!	%l5 = 0000000000000000, Mem[0000000021800040] = 23b5d7d7, %asi = 80
	stba	%l5,[%o3+0x040]%asi	! Mem[0000000021800040] = 00b5d7d7
!	%f0  = 0000ffff 00000000 ffffffff ffff00ff
!	%f4  = ff000000 000096ff ff960000 000000ff
!	%f8  = 1800ff00 399a0000 00000000 00000000
!	%f12 = 69387c07 ff000000 00000000 ff000018
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l7 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000030001400] = ffff0000
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l4 = 00000000b0444eda, Mem[0000000010101400] = 00000000
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000da
!	%f28 = ffffffff 000000ff, Mem[0000000010101410] = ff000000 ff000000
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014143c] = 000000ff, %l4 = 00000000b0444eda
	lduw	[%i5+0x03c],%l4		! %l4 = 00000000000000ff

p0_label_295:
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 12400000, %l6 = 0000000000000000
	lduh	[%i5+0x002],%l6		! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 39781f87cfb11ec2
	setx	0x7a5826e02ab4c3cb,%g7,%l0 ! %l0 = 7a5826e02ab4c3cb
!	%l1 = bbb5ca900700b907
	setx	0x18f61a30741c0f99,%g7,%l1 ! %l1 = 18f61a30741c0f99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7a5826e02ab4c3cb
	setx	0xbe852b27ccdd02f3,%g7,%l0 ! %l0 = be852b27ccdd02f3
!	%l1 = 18f61a30741c0f99
	setx	0x50b2e84fb0e0b59b,%g7,%l1 ! %l1 = 50b2e84fb0e0b59b
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l4 = 00000000000000ff
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = 00009a39, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000009a39
!	Mem[0000000030041400] = ffff0000, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081430] = b5a4b37f00fb00e4, %l6 = 0000000000000000, %l3 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = b5a4b37f00fb00e4

p0_label_296:
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010101428] = 00000000 000000ff
	std	%l4,[%i4+0x028]		! Mem[0000000010101428] = 000000ff 00000000
!	%l1 = 50b2e84fb0e0b59b, Mem[0000000030001410] = 00000000
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = b0e0b59b
!	%f2  = ffffffff ffff00ff, Mem[0000000030101408] = 91ff0000 00000071
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff ffff00ff
!	%f21 = ffff0000, Mem[000000001014141c] = e5a90018
	sta	%f21,[%i5+0x01c]%asi	! Mem[000000001014141c] = ffff0000
!	%l3 = b5a4b37f00fb00e4, Mem[0000000010001408] = 000000ff
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00e400ff
!	%l3 = b5a4b37f00fb00e4, Mem[0000000030081400] = 00000000
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00fb00e4
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	swap	[%i6+%o4],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001410] = 9bb5e0b0, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000009bb5e0b0
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 531b2796
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 531b2700
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000 9afa0000, %l6 = 00000000, %l7 = 00009a39
	ldd	[%i2+%o5],%l6		! %l6 = 0000000000000000 000000009afa0000

p0_label_297:
!	Mem[0000000030041408] = ffffffff, %l0 = be852b27ccdd02f3
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141430] = a6bfffab, %l1 = 50b2e84fb0e0b59b
	ldsha	[%i5+0x030]%asi,%l1	! %l1 = ffffffffffffa6bf
!	Mem[0000000030101400] = ffff00ff, %f26 = 00000000
	lda	[%i4+%g0]0x89,%f26	! %f26 = ffff00ff
!	Mem[0000000010041408] = 0000007100ffffff, %f8  = 1800ff00 399a0000
	ldda	[%i1+%o4]0x88,%f8 	! %f8  = 00000071 00ffffff
!	Mem[0000000010141410] = 00009a39, %l4 = 000000009bb5e0b0
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 0000000000009a39
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 00fb00e4, %f3  = ffff00ff
	lda	[%i2+%g0]0x81,%f3 	! %f3 = 00fb00e4
!	Mem[0000000030081400] = e400fb00, %f4  = ff000000
	lda	[%i2+%g0]0x89,%f4 	! %f4 = e400fb00
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00ffffff, %l4 = 0000000000009a39
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 000000000000ffff

p0_label_298:
!	%f10 = 00000000 00000000, %l2 = 0000000000000000
!	Mem[0000000030141418] = 7fb3a4b5ff000000
	add	%i5,0x018,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030141418] = 7fb3a4b5ff000000
!	Mem[000000001014140c] = ff7c3869, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x00c]%asi,%l6	! %l6 = 00000000ff7c3869
!	%f14 = 00000000, Mem[0000000030101410] = ffff0000
	sta	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l6 = ff7c3869, %l7 = 9afa0000, Mem[0000000030101408] = ff00ffff ffffffff
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff7c3869 9afa0000
!	Mem[00000000201c0001] = 69ff167a, %l7 = 000000009afa0000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030081408] = 000000ff
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f12 = 69387c07 ff000000, %l3 = b5a4b37f00fb00e4
!	Mem[0000000030001410] = ff000000ffffffff
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001410] = 69387c00ff00ffff
!	Mem[00000000100c1410] = 64390000, %l6 = 00000000ff7c3869
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 00000064000000ff
!	%l6 = 0000000000000064, Mem[0000000030181408] = 7fb3a400
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 7fb3a464
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000ff00, %l6 = 0000000000000064
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 000000000000ff00

p0_label_299:
!	Mem[0000000010101408] = ffff0000ffffffff, %l6 = 000000000000ff00
	ldxa	[%i4+0x008]%asi,%l6	! %l6 = ffff0000ffffffff
!	Mem[0000000020800040] = ff0055e8, %l3 = b5a4b37f00fb00e4
	ldub	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = ff960000, %l0 = ffffffffffffffff
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff960000
!	Mem[0000000021800180] = ff00028c, %l5 = 0000000000000000
	ldsha	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030181408] = 64a4b37f 077c3869, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 0000000064a4b37f 00000000077c3869
!	Mem[0000000030081410] = a2000000, %l5 = ffffffffffffff00
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000a2
!	Mem[0000000030181400] = 007c3869, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 000000000000007c
!	Mem[0000000010041408] = ffffff0071000000, %f24 = 1800ff00 399a0000
	ldda	[%i1+%o4]0x80,%f24	! %f24 = ffffff00 71000000
!	Mem[00000000211c0000] = 91fffe22, %l7 = 00000000077c3869
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffff91ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffffff00, %l4 = 000000000000ffff
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ffffff00

p0_label_300:
!	%l7 = ffffffffffff91ff, Mem[00000000218001c0] = ffffa59a, %asi = 80
	stha	%l7,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 91ffa59a
!	%f0  = 0000ffff 00000000, Mem[0000000030081408] = 00000000 ff000000
	stda	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ffff 00000000
!	%f0  = 0000ffff 00000000 ffffffff 00fb00e4
!	%f4  = e400fb00 000096ff ff960000 000000ff
!	%f8  = 00000071 00ffffff 00000000 00000000
!	%f12 = 69387c07 ff000000 00000000 ff000018
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%l2 = 000000000000007c, Mem[0000000030041400] = ffff0000
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff007c
!	%l5 = 00000000000000a2, Mem[0000000030001408] = da4e44b0
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00a244b0
!	%l1 = ffffffffffffa6bf, Mem[0000000010101410] = ff000000ffffffff
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffffffffa6bf
!	%l6 = 0000000064a4b37f, Mem[0000000010041410] = ffffff00
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = b37fff00
!	%f24 = ffffff00 71000000, Mem[0000000010101410] = ffffffff bfa6ffff
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffff00 71000000
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000030141408] = e400fb00, %l4 = 00000000ffffff00
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000e400fb00
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000, %l4 = 00000000e400fb00
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stwa	%l4,[%i4+0x03c]%asi
	ldx	[%i6+0x018],%l0
	ldx	[%i3+0x018],%l4
	stba	%l5,[%i6+0x039]%asi
	stwa	%l6,[%i3+0x034]%asi
	nop
	ldxa	[%i0+0x028]%asi,%l2
	fxtod	%f12,%f20
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000ff960000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffa6bf
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000007c
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000a2
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000064a4b37f
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffff91ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000003,%g2
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
	cmp	%l0,%l1			! %f0  should be 0000ffff 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ffffffff 00fb00e4
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be e400fb00 000096ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ff960000 000000ff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000071 00ffffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 69387c07 ff000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 ff000018
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 0000ffff 000000ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00ff0000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 0000ffff ffff0000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff960000 000000ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ffffff00 71000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffff00ff ffffffff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffffffff 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 000000ff
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
	smul	%l3,-0xc1a,%l0
	ldsba	[%i2+%o5]ASI_AS_IF_USER_PRIMARY,%l7	! Mem[0000000010081410]
	fsubs	%f3 ,%f10,%f1 
	done

p0_trap1o:
	smul	%l3,-0xc1a,%l0
	ldsba	[%o2+%i5]ASI_AS_IF_USER_PRIMARY,%l7	! Mem[0000000010081410]
	fsubs	%f3 ,%f10,%f1 
	done


p0_trap2e:
	sub	%l0,-0x43a,%l0
	sub	%l6,%l0,%l3
	ldswa	[%i6+%o4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010181408]
	done

p0_trap2o:
	sub	%l0,-0x43a,%l0
	sub	%l6,%l0,%l3
	ldswa	[%o6+%i4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010181408]
	done


p0_trap3e:
	andn	%l3,%l7,%l4
	xnor	%l2,%l3,%l4
	done

p0_trap3o:
	andn	%l3,%l7,%l4
	xnor	%l2,%l3,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 47680ca0b03ce8b4
	ldx	[%g1+0x008],%l1		! %l1 = d327b84fbc308a0a
	ldx	[%g1+0x010],%l2		! %l2 = 8017c37828b44f48
	ldx	[%g1+0x018],%l3		! %l3 = d63d3a85c8ebf3e6
	ldx	[%g1+0x020],%l4		! %l4 = 727b46e43f856224
	ldx	[%g1+0x028],%l5		! %l5 = 82b6bf41fd0b3901
	ldx	[%g1+0x030],%l6		! %l6 = 63532079fe7cf217
	ldx	[%g1+0x038],%l7		! %l7 = 27540df20e529674

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
	st	%f6 ,[%i0+0x030]	! Mem[0000000010001430]
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	nop
	stw	%l7,[%i5+0x000]		! Mem[0000000010141400]
	jmpl	%o7,%g0
	ldstub	[%o3+0x081],%l4		! Mem[0000000021800081]
near0_b2b_h:
	jmpl	%o7,%g0
	sdivx	%l2,0x08f,%l7
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f1 ,%f10,%f12
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	umul	%l4,%l4,%l7
	jmpl	%o7,%g0
	fstoi	%f5 ,%f9 
p0_near_1_he:
	fdtos	%f22,%f18
	swap	[%i4+0x000],%l2		! Mem[0000000010101400]
	jmpl	%o7,%g0
	add	%l4,%l0,%l7
near1_b2b_h:
	fstoi	%f16,%f25
	sub	%l3,-0x018,%l0
	nop
	fitod	%f25,%f18
	umul	%l6,-0xc0b,%l1
	sub	%l2,%l3,%l2
	jmpl	%o7,%g0
	umul	%l3,%l7,%l1
near1_b2b_l:
	mulx	%l2,0x8da,%l3
	fdtoi	%f8 ,%f9 
	fcmps	%fcc2,%f5 ,%f4 
	fdtoi	%f14,%f14
	smul	%l4,%l4,%l4
	addc	%l0,%l7,%l6
	jmpl	%o7,%g0
	fadds	%f11,%f5 ,%f14
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	ldub	[%i3+0x031],%l5		! Mem[00000000100c1431]
	stb	%l5,[%i6+0x002]		! Mem[0000000010181402]
	ldsh	[%i4+0x01e],%l0		! Mem[000000001010141e]
	fdtos	%f2 ,%f12
	fdtos	%f14,%f10
	and	%l2,-0x8e7,%l0
	stb	%l5,[%i6+0x019]		! Mem[0000000010181419]
	jmpl	%o7,%g0
	lduw	[%i5+0x038],%l2		! Mem[0000000010141438]
p0_near_2_he:
	fcmps	%fcc1,%f21,%f22
	fcmps	%fcc2,%f28,%f18
	st	%f21,[%i1+0x01c]	! Mem[000000001004141c]
	jmpl	%o7,%g0
	stb	%l1,[%i1+0x00e]		! Mem[000000001004140e]
near2_b2b_h:
	smul	%l6,0x607,%l7
	fitos	%f17,%f27
	fstod	%f27,%f16
	fcmps	%fcc3,%f25,%f23
	jmpl	%o7,%g0
	smul	%l1,%l4,%l1
near2_b2b_l:
	fdtos	%f10,%f5 
	addc	%l6,0x0b3,%l3
	addc	%l3,0xa2f,%l1
	udivx	%l6,0x65d,%l4
	jmpl	%o7,%g0
	xor	%l1,-0xe52,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fmuls	%f13,%f2 ,%f10
	udivx	%l0,-0x02f,%l4
	fdtos	%f2 ,%f14
	jmpl	%o7,%g0
	fsubs	%f1 ,%f6 ,%f1 
p0_near_3_he:
	umul	%l1,-0xc50,%l3
	lduw	[%i5+0x034],%l2		! Mem[0000000010141434]
	nop
	xnor	%l3,%l7,%l2
	ld	[%i3+0x020],%f27	! Mem[00000000100c1420]
	fdivs	%f19,%f19,%f31
	subc	%l4,%l2,%l0
	jmpl	%o7,%g0
	ldd	[%i1+0x038],%f26	! Mem[0000000010041438]
near3_b2b_h:
	fdtoi	%f18,%f18
	andn	%l6,-0x67f,%l6
	fitos	%f27,%f16
	fadds	%f21,%f25,%f23
	xor	%l1,%l5,%l7
	jmpl	%o7,%g0
	xnor	%l3,%l5,%l5
near3_b2b_l:
	and	%l2,-0x930,%l1
	xor	%l4,-0xe18,%l3
	sub	%l6,-0xb8b,%l1
	fcmps	%fcc3,%f2 ,%f7 
	xor	%l0,%l0,%l2
	jmpl	%o7,%g0
	fdivs	%f1 ,%f0 ,%f12
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	andn	%l1,-0x26d,%l4
	addc	%l1,0x1b2,%l1
	xor	%l6,0x5c6,%l5
	sdivx	%l6,0x4ed,%l4
	fmuls	%f12,%f14,%f5 
	fstod	%f11,%f14
	or	%l0,0x87e,%l0
	jmpl	%o7,%g0
	smul	%l3,0xccb,%l6
p0_far_0_lem:
	andn	%l1,-0x26d,%l4
	addc	%l1,0x1b2,%l1
	xor	%l6,0x5c6,%l5
	sdivx	%l6,0x4ed,%l4
	fmuls	%f12,%f14,%f5 
	fstod	%f11,%f14
	or	%l0,0x87e,%l0
	jmpl	%o7,%g0
	smul	%l3,0xccb,%l6
p0_far_0_he:
	nop
	nop
	fcmps	%fcc0,%f23,%f22
	lduw	[%i0+0x034],%l0		! Mem[0000000010001434]
	jmpl	%o7,%g0
	xor	%l5,-0xfeb,%l1
p0_far_0_hem:
	nop
	nop
	fcmps	%fcc0,%f23,%f22
	membar	#Sync
	lduw	[%i0+0x034],%l0		! Mem[0000000010001434]
	jmpl	%o7,%g0
	xor	%l5,-0xfeb,%l1
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	and	%l1,-0xcc8,%l3
	orn	%l7,-0x423,%l3
	fitod	%f27,%f24
	jmpl	%o7,%g0
	xnor	%l6,%l2,%l3
far0_b2b_l:
	udivx	%l0,-0xd13,%l7
	xor	%l4,%l5,%l2
	fstod	%f6 ,%f6 
	jmpl	%o7,%g0
	xor	%l6,%l5,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418]
	jmpl	%o7,%g0
	stb	%l6,[%i3+0x037]		! Mem[00000000100c1437]
p0_far_1_lem:
	membar	#Sync
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418]
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l6,[%i3+0x037]		! Mem[00000000100c1437]
p0_far_1_he:
	jmpl	%o7,%g0
	subc	%l7,%l5,%l5
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	jmpl	%o7,%g0
	subc	%l7,%l5,%l5
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	xnor	%l0,%l5,%l7
	fsubs	%f16,%f20,%f25
	fdivs	%f30,%f21,%f30
	fmuls	%f17,%f28,%f23
	subc	%l4,%l3,%l6
	jmpl	%o7,%g0
	fcmps	%fcc2,%f21,%f21
far1_b2b_l:
	fsubs	%f0 ,%f8 ,%f0 
	and	%l6,0x2cd,%l3
	subc	%l0,%l2,%l0
	xor	%l5,%l6,%l0
	fdtos	%f4 ,%f9 
	jmpl	%o7,%g0
	fsqrts	%f6 ,%f0 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ldsh	[%i6+0x024],%l2		! Mem[0000000010181424]
	stx	%l4,[%i5+0x038]		! Mem[0000000010141438]
	or	%l6,0xb79,%l2
	and	%l7,0x02d,%l2
	swap	[%i4+0x004],%l6		! Mem[0000000010101404]
	fitod	%f0 ,%f8 
	subc	%l6,%l0,%l4
	jmpl	%o7,%g0
	fitos	%f9 ,%f1 
p0_far_2_lem:
	membar	#Sync
	ldsh	[%i6+0x024],%l2		! Mem[0000000010181424]
	stx	%l4,[%i5+0x038]		! Mem[0000000010141438]
	or	%l6,0xb79,%l2
	and	%l7,0x02d,%l2
	swap	[%i4+0x004],%l6		! Mem[0000000010101404]
	fitod	%f0 ,%f8 
	subc	%l6,%l0,%l4
	jmpl	%o7,%g0
	fitos	%f9 ,%f1 
p0_far_2_he:
	ldstub	[%i3+0x00b],%l2		! Mem[00000000100c140b]
	stw	%l1,[%i5+0x03c]		! Mem[000000001014143c]
	add	%l3,0x2b8,%l3
	lduw	[%i5+0x018],%l4		! Mem[0000000010141418]
	jmpl	%o7,%g0
	sth	%l2,[%i0+0x012]		! Mem[0000000010001412]
p0_far_2_hem:
	membar	#Sync
	ldstub	[%i3+0x00b],%l2		! Mem[00000000100c140b]
	stw	%l1,[%i5+0x03c]		! Mem[000000001014143c]
	add	%l3,0x2b8,%l3
	lduw	[%i5+0x018],%l4		! Mem[0000000010141418]
	membar	#Sync
	jmpl	%o7,%g0
	sth	%l2,[%i0+0x012]		! Mem[0000000010001412]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	andn	%l1,%l3,%l2
	sdivx	%l1,-0x417,%l4
	fadds	%f29,%f19,%f25
	add	%l5,%l6,%l7
	xnor	%l0,%l6,%l5
	fmuls	%f22,%f27,%f18
	fsqrts	%f22,%f19
	jmpl	%o7,%g0
	subc	%l7,%l6,%l0
far2_b2b_l:
	subc	%l1,%l7,%l6
	fitod	%f14,%f14
	fsqrts	%f2 ,%f6 
	umul	%l2,-0xa95,%l0
	fsubs	%f8 ,%f0 ,%f10
	fadds	%f12,%f9 ,%f8 
	fdivs	%f6 ,%f9 ,%f7 
	jmpl	%o7,%g0
	mulx	%l3,-0x333,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	xnor	%l1,-0x648,%l2
	orn	%l7,%l1,%l5
	jmpl	%o7,%g0
	fsubs	%f0 ,%f5 ,%f7 
p0_far_3_lem:
	xnor	%l1,-0x648,%l2
	orn	%l7,%l1,%l5
	jmpl	%o7,%g0
	fsubs	%f0 ,%f5 ,%f7 
p0_far_3_he:
	smul	%l5,%l7,%l7
	ldd	[%i2+0x018],%f30	! Mem[0000000010081418]
	ldd	[%i2+0x020],%f18	! Mem[0000000010081420]
	ldsh	[%i3+0x02c],%l2		! Mem[00000000100c142c]
	std	%l0,[%i6+0x030]		! Mem[0000000010181430]
	jmpl	%o7,%g0
	mulx	%l7,0xbee,%l7
p0_far_3_hem:
	smul	%l5,%l7,%l7
	membar	#Sync
	ldd	[%i2+0x018],%f30	! Mem[0000000010081418]
	ldd	[%i2+0x020],%f18	! Mem[0000000010081420]
	ldsh	[%i3+0x02c],%l2		! Mem[00000000100c142c]
	std	%l0,[%i6+0x030]		! Mem[0000000010181430]
	jmpl	%o7,%g0
	mulx	%l7,0xbee,%l7
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fstod	%f31,%f30
	jmpl	%o7,%g0
	sub	%l4,%l1,%l0
far3_b2b_l:
	or	%l7,%l7,%l3
	jmpl	%o7,%g0
	orn	%l5,0x86e,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	or	%l0,-0x6c6,%l1
p0_call_0_le:
	fadds	%f3 ,%f0 ,%f6 
	st	%f9 ,[%i3+0x024]	! Mem[00000000100c1424]
	and	%l6,-0x3db,%l0
	fstod	%f15,%f6 
	retl
	ldx	[%i1+0x028],%l4		! Mem[0000000010041428]
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	or	%l0,-0x6c6,%l1
p0_call_0_lo:
	fadds	%f3 ,%f0 ,%f6 
	st	%f9 ,[%o3+0x024]	! Mem[00000000100c1424]
	and	%l6,-0x3db,%l0
	fstod	%f15,%f6 
	retl
	ldx	[%o1+0x028],%l4		! Mem[0000000010041428]
p0_jmpl_0_he:
	swap	[%i1+0x038],%l1		! Mem[0000000010041438]
	umul	%l2,%l1,%l2
	ldsw	[%i0+0x030],%l5		! Mem[0000000010001430]
	sub	%l3,-0xdc0,%l4
	std	%l2,[%i0+0x000]		! Mem[0000000010001400]
	jmpl	%g6+8,%g0
	fstoi	%f27,%f16
p0_call_0_he:
	retl
	nop
p0_jmpl_0_ho:
	swap	[%o1+0x038],%l1		! Mem[0000000010041438]
	umul	%l2,%l1,%l2
	ldsw	[%o0+0x030],%l5		! Mem[0000000010001430]
	sub	%l3,-0xdc0,%l4
	std	%l2,[%o0+0x000]		! Mem[0000000010001400]
	jmpl	%g6+8,%g0
	fstoi	%f27,%f16
p0_call_0_ho:
	retl
	nop
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	andn	%l2,%l4,%l5
	addc	%l2,%l2,%l0
	lduh	[%i2+0x01e],%l3		! Mem[000000001008141e]
	lduh	[%i1+0x026],%l0		! Mem[0000000010041426]
	sth	%l4,[%i2+0x00c]		! Mem[000000001008140c]
	subc	%l6,0x5d4,%l6
	fcmps	%fcc3,%f5 ,%f14
	jmpl	%g6+8,%g0
	xor	%l2,%l1,%l4
p0_call_1_le:
	ld	[%i1+0x014],%f7 	! Mem[0000000010041414]
	std	%f2 ,[%i1+0x018]	! Mem[0000000010041418]
	ldsw	[%i4+0x00c],%l3		! Mem[000000001010140c]
	fadds	%f6 ,%f4 ,%f4 
	fdtoi	%f8 ,%f0 
	stx	%l0,[%i3+0x008]		! Mem[00000000100c1408]
	fdtos	%f12,%f15
	retl
	ldstub	[%o0+0x001],%l7		! Mem[00000000201c0001]
p0_jmpl_1_lo:
	andn	%l2,%l4,%l5
	addc	%l2,%l2,%l0
	lduh	[%o2+0x01e],%l3		! Mem[000000001008141e]
	lduh	[%o1+0x026],%l0		! Mem[0000000010041426]
	sth	%l4,[%o2+0x00c]		! Mem[000000001008140c]
	subc	%l6,0x5d4,%l6
	fcmps	%fcc3,%f5 ,%f14
	jmpl	%g6+8,%g0
	xor	%l2,%l1,%l4
p0_call_1_lo:
	ld	[%o1+0x014],%f7 	! Mem[0000000010041414]
	std	%f2 ,[%o1+0x018]	! Mem[0000000010041418]
	ldsw	[%o4+0x00c],%l3		! Mem[000000001010140c]
	fadds	%f6 ,%f4 ,%f4 
	fdtoi	%f8 ,%f0 
	stx	%l0,[%o3+0x008]		! Mem[00000000100c1408]
	fdtos	%f12,%f15
	retl
	ldstub	[%i0+0x001],%l7		! Mem[00000000201c0001]
p0_jmpl_1_he:
	ldsw	[%i5+0x03c],%l0		! Mem[000000001014143c]
	orn	%l0,0xebe,%l0
	ldx	[%i0+0x020],%l7		! Mem[0000000010001420]
	or	%l6,0x8a0,%l2
	orn	%l2,0xdf3,%l3
	jmpl	%g6+8,%g0
	fmuls	%f22,%f16,%f27
p0_call_1_he:
	add	%l7,%l6,%l7
	ldd	[%i1+0x018],%f30	! Mem[0000000010041418]
	ldstub	[%o3+0x101],%l5		! Mem[0000000021800101]
	ldstub	[%i5+0x01c],%l2		! Mem[000000001014141c]
	xor	%l1,%l5,%l2
	ldstub	[%o1+0x040],%l5		! Mem[0000000020800040]
	fitos	%f28,%f30
	retl
	ldsw	[%i5+0x038],%l0		! Mem[0000000010141438]
p0_jmpl_1_ho:
	ldsw	[%o5+0x03c],%l0		! Mem[000000001014143c]
	orn	%l0,0xebe,%l0
	ldx	[%o0+0x020],%l7		! Mem[0000000010001420]
	or	%l6,0x8a0,%l2
	orn	%l2,0xdf3,%l3
	jmpl	%g6+8,%g0
	fmuls	%f22,%f16,%f27
p0_call_1_ho:
	add	%l7,%l6,%l7
	ldd	[%o1+0x018],%f30	! Mem[0000000010041418]
	ldstub	[%i3+0x101],%l5		! Mem[0000000021800101]
	ldstub	[%o5+0x01c],%l2		! Mem[000000001014141c]
	xor	%l1,%l5,%l2
	ldstub	[%i1+0x040],%l5		! Mem[0000000020800040]
	fitos	%f28,%f30
	retl
	ldsw	[%o5+0x038],%l0		! Mem[0000000010141438]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	std	%l4,[%i6+0x028]		! Mem[0000000010181428]
	fdivs	%f14,%f5 ,%f8 
	jmpl	%g6+8,%g0
	fdtos	%f6 ,%f2 
p0_call_2_le:
	fstoi	%f10,%f15
	udivx	%l5,-0xbb7,%l3
	fdtoi	%f14,%f5 
	smul	%l2,-0xcbc,%l3
	xor	%l5,-0x626,%l7
	st	%f15,[%i2+0x020]	! Mem[0000000010081420]
	fdtoi	%f14,%f14
	retl
	fitos	%f2 ,%f3 
p0_jmpl_2_lo:
	std	%l4,[%o6+0x028]		! Mem[0000000010181428]
	fdivs	%f14,%f5 ,%f8 
	jmpl	%g6+8,%g0
	fdtos	%f6 ,%f2 
p0_call_2_lo:
	fstoi	%f10,%f15
	udivx	%l5,-0xbb7,%l3
	fdtoi	%f14,%f5 
	smul	%l2,-0xcbc,%l3
	xor	%l5,-0x626,%l7
	st	%f15,[%o2+0x020]	! Mem[0000000010081420]
	fdtoi	%f14,%f14
	retl
	fitos	%f2 ,%f3 
p0_jmpl_2_he:
	or	%l3,%l0,%l7
	ldstub	[%i6+0x004],%l0		! Mem[0000000010181404]
	fcmps	%fcc0,%f28,%f19
	ldsw	[%i0+0x034],%l6		! Mem[0000000010001434]
	nop
	ldd	[%i5+0x010],%l0		! Mem[0000000010141410]
	xor	%l0,%l7,%l1
	jmpl	%g6+8,%g0
	xnor	%l0,0x27d,%l0
p0_call_2_he:
	ldsb	[%i4+0x036],%l1		! Mem[0000000010101436]
	fdtoi	%f28,%f25
	std	%f16,[%i3+0x020]	! Mem[00000000100c1420]
	fitos	%f29,%f22
	fdivs	%f23,%f23,%f31
	smul	%l6,%l6,%l5
	retl
	add	%l5,0x519,%l2
p0_jmpl_2_ho:
	or	%l3,%l0,%l7
	ldstub	[%o6+0x004],%l0		! Mem[0000000010181404]
	fcmps	%fcc0,%f28,%f19
	ldsw	[%o0+0x034],%l6		! Mem[0000000010001434]
	nop
	ldd	[%o5+0x010],%l0		! Mem[0000000010141410]
	xor	%l0,%l7,%l1
	jmpl	%g6+8,%g0
	xnor	%l0,0x27d,%l0
p0_call_2_ho:
	ldsb	[%o4+0x036],%l1		! Mem[0000000010101436]
	fdtoi	%f28,%f25
	std	%f16,[%o3+0x020]	! Mem[00000000100c1420]
	fitos	%f29,%f22
	fdivs	%f23,%f23,%f31
	smul	%l6,%l6,%l5
	retl
	add	%l5,0x519,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	ldx	[%i6+0x018],%l7		! Mem[0000000010181418]
	umul	%l1,%l5,%l1
	fsubs	%f14,%f15,%f5 
	sub	%l5,-0xe4b,%l3
	jmpl	%g6+8,%g0
	fmuls	%f2 ,%f10,%f1 
p0_call_3_le:
	xnor	%l6,%l5,%l7
	ldsh	[%i6+0x030],%l7		! Mem[0000000010181430]
	retl
	umul	%l1,0xe50,%l6
p0_jmpl_3_lo:
	ldx	[%o6+0x018],%l7		! Mem[0000000010181418]
	umul	%l1,%l5,%l1
	fsubs	%f14,%f15,%f5 
	sub	%l5,-0xe4b,%l3
	jmpl	%g6+8,%g0
	fmuls	%f2 ,%f10,%f1 
p0_call_3_lo:
	xnor	%l6,%l5,%l7
	ldsh	[%o6+0x030],%l7		! Mem[0000000010181430]
	retl
	umul	%l1,0xe50,%l6
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	ldub	[%i4+0x01d],%l0		! Mem[000000001010141d]
p0_call_3_he:
	fcmps	%fcc2,%f19,%f17
	subc	%l4,%l2,%l7
	stb	%l2,[%i1+0x00c]		! Mem[000000001004140c]
	retl
	ldsh	[%i6+0x03c],%l6		! Mem[000000001018143c]
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	ldub	[%o4+0x01d],%l0		! Mem[000000001010141d]
p0_call_3_ho:
	fcmps	%fcc2,%f19,%f17
	subc	%l4,%l2,%l7
	stb	%l2,[%o1+0x00c]		! Mem[000000001004140c]
	retl
	ldsh	[%o6+0x03c],%l6		! Mem[000000001018143c]
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
	.word	0x47680ca0,0xb03ce8b4		! Init value for %l0
	.word	0xd327b84f,0xbc308a0a		! Init value for %l1
	.word	0x8017c378,0x28b44f48		! Init value for %l2
	.word	0xd63d3a85,0xc8ebf3e6		! Init value for %l3
	.word	0x727b46e4,0x3f856224		! Init value for %l4
	.word	0x82b6bf41,0xfd0b3901		! Init value for %l5
	.word	0x63532079,0xfe7cf217		! Init value for %l6
	.word	0x27540df2,0x0e529674		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x9b6610a8,0xeea9473d		! Init value for %f0 
	.word	0x8f94c9bb,0xa0d52b7a		! Init value for %f2 
	.word	0xc826a210,0x74a4bfe1		! Init value for %f4 
	.word	0xa7044cae,0x320b66a4		! Init value for %f6 
	.word	0x800e61d7,0x3bee7779		! Init value for %f8 
	.word	0x6fc4458f,0x0046c712		! Init value for %f10
	.word	0x2a82339a,0x288edd61		! Init value for %f12
	.word	0x3b16817b,0xb811b45a		! Init value for %f14
	.word	0x9e0d8f49,0x1ee0f128		! Init value for %f16
	.word	0xd173d9e8,0x6c6c14c4		! Init value for %f18
	.word	0x5fd4dae6,0x27a71f19		! Init value for %f20
	.word	0x6f60d438,0xce9b56df		! Init value for %f22
	.word	0xb1e87f22,0xd83a31b0		! Init value for %f24
	.word	0xbc365bc2,0x3ef92cf7		! Init value for %f26
	.word	0x538a4ea8,0xc6ad6b1a		! Init value for %f28
	.word	0x1087ca59,0xbf357b67		! Init value for %f30
	.word	0x0292730c,0x82332047		! Init value for %f32
	.word	0x3f652052,0x9888ed6c		! Init value for %f34
	.word	0x624aa110,0x447023ed		! Init value for %f36
	.word	0x20cc3563,0xd39cf9b7		! Init value for %f38
	.word	0x6507fe85,0x62d12377		! Init value for %f40
	.word	0x211e732a,0x366f08e3		! Init value for %f42
	.word	0x5bdb28e6,0x8d2c8b76		! Init value for %f44
	.word	0x1c3515d2,0x4ac005e2		! Init value for %f46
	.word	0xedaa8bcc,0x28e2e4f3
	.word	0x9dc669d4,0xe0c07bb7
	.word	0x0eb1c906,0xf2bfe06d
	.word	0xaac502b0,0xdd769d8f
	.word	0x2f3902ac,0x602fd57c
	.word	0x0adc13d4,0xb0d5d329
	.word	0x339b875d,0x0550bf7a
	.word	0x5dfaf1dc,0xe8a4b8ae
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
	.word	0x00000000,0xff960000
	.word	0xffffffff,0xffffa6bf
	.word	0x00000000,0x0000007c
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000a2
	.word	0x00000000,0x64a4b37f
	.word	0xffffffff,0xffff91ff
p0_expected_fp_regs:
	.word	0x0000ffff,0x00000000
	.word	0xffffffff,0x00fb00e4
	.word	0xe400fb00,0x000096ff
	.word	0xff960000,0x000000ff
	.word	0x00000071,0x00ffffff
	.word	0x00000000,0x00000000
	.word	0x69387c07,0xff000000
	.word	0x00000000,0xff000018
	.word	0x0000ffff,0x000000ff
	.word	0x00ff0000,0x00000000
	.word	0x0000ffff,0xffff0000
	.word	0xff960000,0x000000ff
	.word	0xffffff00,0x71000000
	.word	0xffff00ff,0xffffffff
	.word	0xffffffff,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000020,0x00000400		! %fsr = 0000002000000400
p0_local0_expect:
	.word	0xffffffff,0xff000000
	.word	0x00e400ff,0x000000ff
	.word	0x00000000,0x180000ff
	.word	0xff000000,0xe5ff0018
	.word	0xff000000,0x000000ff
	.word	0x00000000,0xff000000
	.word	0xffda5b71,0xff000000
	.word	0x0000fa9a,0x00000000
p0_local0_sec_expect:
	.word	0x00000000,0x077c3869
	.word	0x00a244b0,0x00000000
	.word	0x69387c00,0xff00ffff
	.word	0x94b29ddc,0x39643cff
	.word	0x11013de0,0xf9b9886a
	.word	0x00000792,0x14994e2b
	.word	0x000000ff,0xff000000
	.word	0xfe4b67b9,0x46c0ca02
p0_local1_expect:
	.word	0x00000000,0x00ff00ff
	.word	0x0000ffff,0x71000000
	.word	0xb37fff00,0x449140ff
	.word	0xff3cffff,0xffffffff
	.word	0x00000000,0xd1000000
	.word	0xff000000,0x02cac046
	.word	0x00000018,0x00000000
	.word	0x00000000,0xff3cffff
p0_local1_sec_expect:
	.word	0x7c00ffff,0x00000000
	.word	0xffffffff,0xffff00ff
	.word	0xff000000,0x000096ff
	.word	0xff960000,0x000000ff
	.word	0x1800ff00,0x399a0000
	.word	0x00000000,0x00000000
	.word	0x69387c07,0xff000000
	.word	0x00000000,0xff000018
p0_local2_expect:
	.word	0x00000000,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x9afa0000
	.word	0x00000000,0x00000000
	.word	0xb5a4b37f,0x00fb00e4
	.word	0x3476ff9a,0xffffffff
	.word	0xb5a4b37f,0x00fb00e4
	.word	0x69380018,0x47a7ffe4
p0_local2_sec_expect:
	.word	0x00fb00e4,0x000000ae
	.word	0x0000ffff,0x00000000
	.word	0xa2000000,0x1800ffe5
	.word	0x000000ff,0xb5a4b37f
	.word	0x00009a39,0x00000018
	.word	0x00000000,0xff3c6439
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
p0_local3_expect:
	.word	0x00271b53,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff390000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00009a39,0x00000018
	.word	0xffff0000,0xff3c6439
	.word	0xb0444eda,0x00000000
	.word	0x96271b53,0x00e4daff
p0_local3_sec_expect:
	.word	0xff960000,0x000000ff
	.word	0x00000000,0x077c3869
	.word	0x12400000,0x000000ff
	.word	0x7fb3a4b5,0xff000000
	.word	0x18000000,0x399a0000
	.word	0x39643cff,0x00000000
	.word	0x00000071,0x91ff0000
	.word	0x00000000,0xffffffff
p0_local4_expect:
	.word	0xda000000,0xffff0000
	.word	0xffff0000,0xffffffff
	.word	0x00000071,0x00ffffff
	.word	0xff000000,0x000096ff
	.word	0x00009a39,0x00ff0018
	.word	0x000000ff,0x00000000
	.word	0x000000ff,0x077c3869
	.word	0x180000ff,0x00000000
p0_local4_sec_expect:
	.word	0xff00ffff,0x000000ff
	.word	0xff7c3869,0x9afa0000
	.word	0x00000000,0xffff0000
	.word	0xff960000,0x000000ff
	.word	0x1800ff00,0x399a0000
	.word	0x000000ff,0xffffffff
	.word	0x69387c07,0xff000000
	.word	0x00000000,0x000000ff
p0_local5_expect:
	.word	0x12400000,0x000000ff
	.word	0x0000ff00,0x00000000
	.word	0x00009a39,0x00ff0018
	.word	0xff3c6439,0xffff0000
	.word	0xffff3cff,0x00000000
	.word	0x00000000,0x69387c07
	.word	0xa6bfffab,0xfffbe4e4
	.word	0x4cff0000,0x000000ff
p0_local5_sec_expect:
	.word	0x00000000,0xffff0000
	.word	0xffffff00,0xffffffff
	.word	0xff960000,0x00fb00e4
	.word	0xff000000,0x000096ff
	.word	0xffffff00,0x71000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x077c3869
	.word	0x180000ff,0x00000000
p0_local6_expect:
	.word	0x00ff0000,0xffffffff
	.word	0x00000000,0x9afa0000
	.word	0xffff0000,0x00000000
	.word	0x00003869,0x00004012
	.word	0xffa90000,0xff409144
	.word	0x00ff0000,0xff3c6439
	.word	0x00000000,0x180000ff
	.word	0xff960000,0x000000ff
p0_local6_sec_expect:
	.word	0x007c3869,0x00000000
	.word	0x64a4b37f,0x077c3869
	.word	0x000000ff,0x9afa0000
	.word	0x7fb3a4b5,0xff000000
	.word	0x18000000,0x399a0000
	.word	0x39643cff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
share0_expect:
	.word	0x69ff167a,0xc764ee8b
	.word	0x49181bf9,0x228849a8
	.word	0xace03abf,0x488ee2ab
	.word	0x15a58b80,0x87d98411
	.word	0x21723b77,0x4effc930
	.word	0x8e1ab5fb,0x5a3954f0
	.word	0xbc3eea97,0x9fe7b871
	.word	0x50391c14,0x205e44b3
share1_expect:
	.word	0x00a2160c,0x7ae2d61c
	.word	0xf8dd4afd,0x031c05fd
	.word	0x5f443e60,0x2fd610f4
	.word	0x8e72bc43,0xbb9b9b68
	.word	0x7ee851b0,0x6339979a
	.word	0x0c3c4216,0x4d23f9ca
	.word	0x9573cc45,0x8de4b4d6
	.word	0x4892979d,0x43a68208
	.word	0xff0055e8,0xd050b62f
	.word	0xd096dd28,0x63aab402
	.word	0xa1b31fd5,0xb4cb0868
	.word	0x845017db,0xae4e08f2
	.word	0xac7b27e9,0xc9ab0936
	.word	0x261010b7,0xc83e9eed
	.word	0xa56bd35c,0xebedcc56
	.word	0xb5d695cc,0xbd6c71e2
share2_expect:
	.word	0x91fffe22,0xb059a4fa
	.word	0x21bf89bf,0x1aedfaf2
	.word	0xfd9c1d72,0x31c201ad
	.word	0xac7f832b,0x4bbdc778
	.word	0x4b9987ec,0x39239ed3
	.word	0x0535f6ef,0x7e4f15ff
	.word	0x6a0001c3,0x8a8a67a4
	.word	0x4a58e393,0xb6111b85
share3_expect:
	.word	0x0024a558,0x112bdfff
	.word	0xb60e30bc,0xef62deec
	.word	0xd808f46c,0xa92a043c
	.word	0x23b8bf78,0xd356a7cb
	.word	0xffd98583,0x6589b807
	.word	0xfadd041f,0xcffc0e1d
	.word	0xf47c17bc,0x5e8a76b2
	.word	0x17f5a127,0xc2de9945
	.word	0x00b5d7d7,0xb283d4b7
	.word	0x19009336,0x202564e1
	.word	0xec0768dc,0x4a881899
	.word	0xe9c31df2,0x91c4b1b9
	.word	0x3bd14e43,0x678533c7
	.word	0xca803688,0xac3dc2c4
	.word	0xe2cb7a65,0xac407ab4
	.word	0x2568cb2e,0x9f8ece6c
	.word	0x5d00571f,0xf6c00838
	.word	0x56f55487,0xc9305758
	.word	0x965f5c57,0x76a7aad9
	.word	0xefb592f6,0xe195e63e
	.word	0xd1a02013,0x4ba51b5b
	.word	0x22974029,0xb22c2b20
	.word	0x4f2a0ed6,0x4e547abb
	.word	0x59da69ae,0x966438aa
	.word	0x00ffff0b,0xee3a1583
	.word	0x0179545d,0x82c564f7
	.word	0xae3363cc,0x4e0ca13e
	.word	0x6a5d5a82,0x234f025b
	.word	0xccf4b6e2,0x05bcf131
	.word	0x8001a976,0xa6c8bfba
	.word	0x7c87e046,0x5ddbde51
	.word	0x9b40d1bc,0x18480822
	.word	0xff00933f,0x22aa7e1b
	.word	0xe6ab8400,0x3f9285d0
	.word	0x8db6df62,0xab7ffc2f
	.word	0x6417620b,0x688c82da
	.word	0xaef5fc01,0xb4a11798
	.word	0xb37836dd,0xe39f0aa3
	.word	0x29e7d1e7,0x628e6678
	.word	0xbd584391,0x819b81ec
	.word	0x00005bff,0xb019a92c
	.word	0x7b362859,0xee7421cb
	.word	0x7ce90b4b,0xee90937f
	.word	0x4cf69ac5,0x5ad37623
	.word	0x087d63a6,0xb20e8c3d
	.word	0x7eccf74e,0xff08d5a7
	.word	0xe0e854b5,0x80497e99
	.word	0x4a236239,0xe82c22d6
	.word	0xff00028c,0x12aa3e37
	.word	0xf1e4a93f,0xeeeb6ba0
	.word	0x08b749bd,0xe9008c80
	.word	0xa7f737ba,0x39c38ec8
	.word	0xeddd655e,0xc57f07a3
	.word	0x362067c5,0x11e73402
	.word	0x536ed449,0x673902e1
	.word	0xf0eed6a1,0xe767a01a
	.word	0x91ffa59a,0x67976793
	.word	0x1003ed74,0x5eb7b1c3
	.word	0xb24bbb93,0x3df28033
	.word	0xa65917a6,0x0efe866d
	.word	0x196321a0,0xe26f35d1
	.word	0x00e0ac1b,0xc2ffddc0
	.word	0x4094d74f,0xdfc76e47
	.word	0x2d18171a,0x87c8cb7d
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
	.word	0x6314555f,0xcea3c4f0
	.word	0x00000000,0x00000002
	.word	0xf5e46c28,0x10be2ba4
	.word	0x00000000,0x00000003
	.word	0x8a24d767,0xa69ac733
	.word	0x00000000,0x00000004
	.word	0x54f07ccf,0xd8a8bb31
	.word	0x00000000,0x00000005
	.word	0xfafb03ff,0xd7631c97
	.word	0x00000000,0x00000006
	.word	0x1589fbc8,0x2c19d661
	.word	0x00000000,0x00000007
	.word	0xd94c4f5f,0xe9fbda80
	.word	0x00000000,0x00000008
	.word	0x2fc7b91f,0xbcae5dfb
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
	.word	0xafbae8ee,0x5549aa29,0xd9180600,0xe30833e9
	.word	0x923e67bc,0x83afca43,0xededf853,0x126cff7e
	.word	0x63b554f9,0xcd984a68,0xc2fe2c99,0x977d4bba
	.word	0x39667e70,0x0c4a8aff,0xb61c9714,0xe3d9559b
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
	.word	0xd59679ca,0xb3f37816,0xdf13a2f0,0xe1c9a244
	.word	0x2eaf9f89,0x56c20577,0x895c3151,0xf1e0f066
	.word	0xe6a7f3f7,0xd94a7ecb,0x5f9cdf91,0xe4bb04e9
	.word	0xcd4e6bc4,0x862d6361,0x89061e14,0x40876b5a
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
	.word	0x71bb71c0,0x7509d289,0xcbb24a90,0xb1ab37fc
	.word	0x1a154415,0x3ab20bb5,0x3f8f4308,0x746f7911
	.word	0xa16e566a,0x29fff62f,0x5f48f303,0x3689c6de
	.word	0x77080fc2,0xa6cf7b9f,0x7c0fa9bb,0x78fe8df4
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
	.word	0x2adb99aa,0x4594788c,0xf2ce8acb,0x261088f3
	.word	0x51ac057c,0x21101fc6,0xc04b98e4,0xe12aaca4
	.word	0x9e372315,0x6885836b,0x34c585ec,0x8e6d165f
	.word	0x56bb1688,0xc27d6584,0x0ce9a537,0x41df7b1e
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
	.word	0x1e686056,0x9d1a0a3b,0x851cb0d3,0xe4c21301
	.word	0x0f391cd7,0xd7899eb3,0x53714580,0x3e4c256a
	.word	0x0de63e2b,0x3f0e57ed,0xd8f0657e,0x2471f006
	.word	0xd8f46c0a,0x70e190e9,0x987980c3,0x09e4df43
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
	.word	0x13958612,0x093bd89b,0x28c8238d,0x3e396f14
	.word	0x51c2df25,0xdfc6b0ff,0x406ec31f,0x7b97511a
	.word	0x6ecc0b5f,0x49a5b322,0x6b69d5b3,0x0c5059a4
	.word	0xcea292b2,0x7779089e,0x9a4ea2f6,0x57bc1770
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
	.word	0xc04a5c60,0x06c532ae,0xae1f9168,0x1e2684b1
	.word	0x2ecf7d4a,0x292ac0f2,0x9829f53a,0x35a67574
	.word	0x66f377b3,0x85f06698,0x16a2f93e,0x02d40523
	.word	0xdb92d96a,0xe14bc547,0x67c38fa3,0xcba2abe9
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
	.word	0xbbfe5b62,0x483d5f70,0x183c6439,0xe5a90018
	.word	0x2a0065f2,0x0d8b778e,0x835bd3f7,0x43a68cc6
	.word	0x6a88b9f9,0xe03d0111,0xce36933b,0x88295b08
	.word	0x5ffc35d7,0x2f7b8146,0x02cac046,0xb9674bfe
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
	.word	0x2f00bfa6,0xa6ed2c14,0x6895e5d0,0x3c02eba3
	.word	0x2b63ed77,0xe4e4fbae,0x2b4e9914,0x9207d9ba
	.word	0x96271b53,0xe2409144,0x5ca572a0,0x669e5054
	.word	0x3059c69c,0x3a6e5eb2,0xbdec4429,0x2d7d9f8c
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
	.word	0x11df965e,0x7c5b22ae,0xc4f49cac,0x9b47a3d0
	.word	0x524ce163,0xf78aa1b3,0x9d9687d4,0x3738c9c4
	.word	0x48b617b8,0xdfaee5d6,0x75b06576,0xe617a6d0
	.word	0x7c0f47c4,0x69a47e15,0x22b3ac32,0xcdacf8bc
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
	.word	0xbbce4961,0xeb59ba7f,0x6ee459dc,0xbe6e2552
	.word	0x74b8dfef,0xb8da9077,0x0b807b72,0xe69ca2ca
	.word	0x49f9d485,0x6599b923,0x9e185a4a,0x0df0cc6d
	.word	0x7557a3f6,0x5ccfe01b,0xa7156c04,0x450fd3fa
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
	.word	0x3cccaca2,0x9afa7634,0x07db5ee9,0x614f62be
	.word	0x40551d0b,0x5e8884fb,0xa3e23f32,0x659c7f47
	.word	0x69742726,0x24009712,0xb5a4b37f,0x20be967f
	.word	0x037cf402,0x45e82c3e,0x952f2bd2,0x47a79b2d
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
	.word	0x2d57d652,0x929a4833,0x83bff2c7,0xead63534
	.word	0x38d597a7,0x074d012f,0x3a9c87f5,0xe258be10
	.word	0xe4d46a81,0x39ec15cd,0xe8aad8a2,0x69e26c76
	.word	0x774329c7,0x0bfc1d8b,0x2bafd68d,0xcdc5ef0e
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
	.word	0xb8528f99,0x58fa70ba,0x4a1372b3,0x57404012
	.word	0x640123be,0x568a4334,0xecc3ac98,0xee72ccef
	.word	0x69387c07,0x5f1bc9da,0x36c41009,0x8d5e390d
	.word	0x416437a4,0xf83efdca,0x5dda5b71,0x54ad0d30
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
	.word	0xaa27167a,0xc764ee8b,0x49181bf9,0x228849a8
	.word	0xace03abf,0x488ee2ab,0x15a58b80,0x87d98411
	.word	0x21723b77,0x4effc930,0x8e1ab5fb,0x5a3954f0
	.word	0xbc3eea97,0x9fe7b871,0x50391c14,0x205e44b3
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
	.word	0xb125160c,0x7ae2d61c,0xf8dd4afd,0x031c05fd
	.word	0x5f443e60,0x2fd610f4,0x8e72bc43,0xbb9b9b68
	.word	0x7ee851b0,0x6339979a,0x0c3c4216,0x4d23f9ca
	.word	0x9573cc45,0x8de4b4d6,0x4892979d,0x43a68208
	.word	0x3eac55e8,0xd050b62f,0xd096dd28,0x63aab402
	.word	0xa1b31fd5,0xb4cb0868,0x845017db,0xae4e08f2
	.word	0xac7b27e9,0xc9ab0936,0x261010b7,0xc83e9eed
	.word	0xa56bd35c,0xebedcc56,0xb5d695cc,0xbd6c71e2
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
	.word	0x4757fe22,0xb059a4fa,0x21bf89bf,0x1aedfaf2
	.word	0xfd9c1d72,0x31c201ad,0xac7f832b,0x4bbdc778
	.word	0x4b9987ec,0x39239ed3,0x0535f6ef,0x7e4f15ff
	.word	0x6a0001c3,0x8a8a67a4,0x4a58e393,0xb6111b85
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
	.word	0x4030a558,0x112bdfff,0xb60e30bc,0xef62deec
	.word	0xd808f46c,0xa92a043c,0x23b8bf78,0xd356a7cb
	.word	0xffd98583,0x6589b807,0xfadd041f,0xcffc0e1d
	.word	0xf47c17bc,0x5e8a76b2,0x17f5a127,0xc2de9945
	.word	0x23b5d7d7,0xb283d4b7,0x19009336,0x202564e1
	.word	0xec0768dc,0x4a881899,0xe9c31df2,0x91c4b1b9
	.word	0x3bd14e43,0x678533c7,0xca803688,0xac3dc2c4
	.word	0xe2cb7a65,0xac407ab4,0x2568cb2e,0x9f8ece6c
	.word	0xd128571f,0xf6c00838,0x56f55487,0xc9305758
	.word	0x965f5c57,0x76a7aad9,0xefb592f6,0xe195e63e
	.word	0xd1a02013,0x4ba51b5b,0x22974029,0xb22c2b20
	.word	0x4f2a0ed6,0x4e547abb,0x59da69ae,0x966438aa
	.word	0x86d5ff0b,0xee3a1583,0x0179545d,0x82c564f7
	.word	0xae3363cc,0x4e0ca13e,0x6a5d5a82,0x234f025b
	.word	0xccf4b6e2,0x05bcf131,0x8001a976,0xa6c8bfba
	.word	0x7c87e046,0x5ddbde51,0x9b40d1bc,0x18480822
	.word	0x53ff933f,0x22aa7e1b,0xe6ab8400,0x3f9285d0
	.word	0x8db6df62,0xab7ffc2f,0x6417620b,0x688c82da
	.word	0xaef5fc01,0xb4a11798,0xb37836dd,0xe39f0aa3
	.word	0x29e7d1e7,0x628e6678,0xbd584391,0x819b81ec
	.word	0x231c5bff,0xb019a92c,0x7b362859,0xee7421cb
	.word	0x7ce90b4b,0xee90937f,0x4cf69ac5,0x5ad37623
	.word	0x087d63a6,0xb20e8c3d,0x7eccf74e,0xff08d5a7
	.word	0xe0e854b5,0x80497e99,0x4a236239,0xe82c22d6
	.word	0x671e028c,0x12aa3e37,0xf1e4a93f,0xeeeb6ba0
	.word	0x08b749bd,0xe9008c80,0xa7f737ba,0x39c38ec8
	.word	0xeddd655e,0xc57f07a3,0x362067c5,0x11e73402
	.word	0x536ed449,0x673902e1,0xf0eed6a1,0xe767a01a
	.word	0x632ba59a,0x67976793,0x1003ed74,0x5eb7b1c3
	.word	0xb24bbb93,0x3df28033,0xa65917a6,0x0efe866d
	.word	0x196321a0,0xe26f35d1,0x00e0ac1b,0xc2ffddc0
	.word	0x4094d74f,0xdfc76e47,0x2d18171a,0x87c8cb7d
share3_end:
