/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_2.s
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
!	Seed = 626121811
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_3000_2.s created on Jun 26, 2009 (12:18:11)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_3000_2 -p 1 -l 3000

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
!	%f0  = 50b14ae0 14115371 329b2b1e 22c973f7
!	%f4  = 0527bdcc 737f372d 082dfa6a 6fad0693
!	%f8  = 046eb478 383637a9 5bec7b76 4bf36bef
!	%f12 = 430a7ae4 0b89f0e5 16ea5a42 1226200b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 4b411d10 3170bee1 2d9b02ce 3bd75ee7
!	%f20 = 2dc666fc 5affbd9d 6adda11a 28fe2483
!	%f24 = 6227e4a8 51a6c919 38c92126 56122cdf
!	%f28 = 22f8e214 572c7d55 53382ef2 3ce7f3fb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 11be6b40 566a3651 1015367e 5c4cb5d7
!	%f36 = 2e9b4c2c 40c8100d 296663ca 22626e73
!	%f40 = 6fbc10d8 3478e689 3519a2d6 35bbd9cf
!	%f44 = 04830544 477655c5 36909fa2 593873eb
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x9a2e920c00000054,%g7,%g1 ! %gsr scale = 10, align = 4
	wr	%g1,%g0,%gsr		! %gsr = 9a2e920c00000054

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%f0  = 50b14ae0 14115371, %l6 = 2d9fb5b88d2b2780
!	Mem[0000000030081410] = 6a38207c1008a11d
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081410] = 5038207c1008a11d
!	Mem[00000000300c1408] = 4db233ae, %l5 = 61d1749162e3c585
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 000000000000004d
!	%f28 = 22f8e214 572c7d55, Mem[0000000010101410] = 0c248723 6d1cac48
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 22f8e214 572c7d55
!	%l7 = fe0e9d3ac1f8c48b, Mem[0000000030181410] = 7638d9fc5104849d
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = fe0e9d3ac1f8c48b
!	Mem[0000000030041408] = ee9cec1b, %l5 = 000000000000004d
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000000000001b
!	%l7 = fe0e9d3ac1f8c48b, Mem[0000000030141400] = 099377b00c908b01
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = fe0e9d3ac1f8c48b
!	%l3 = 3f09df8f883e36bf, Mem[0000000030101408] = 0e27bb55
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 883e36bf
!	%l5 = 000000000000001b, Mem[0000000030141410] = 344f439c0a82c3bd
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000000000001b
!	Mem[0000000030181400] = 56a02010, %l3 = 3f09df8f883e36bf
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000056
!	Mem[0000000010041408] = 3e9dc126, %l1 = a673660f325ac039
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000026

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 7fba0c0a 6b214db3, %l6 = 8d2b2780, %l7 = c1f8c48b, %asi = 80
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 000000007fba0c0a 000000006b214db3
!	Mem[0000000010001400] = 1d6d7ba0, %l0 = 4a41bc37ff34588e
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000001d6d
!	Mem[0000000010101410] = 557d2c57, %l4 = 3e06a74c993edb9a
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = 000000000000557d
!	Mem[0000000010081410] = adba25704c97735f, %f14 = 16ea5a42 1226200b
	ldda	[%i2+%o5]0x88,%f14	! %f14 = adba2570 4c97735f
!	Mem[0000000030181408] = ce5d9136, %l4 = 000000000000557d
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ce5d9136
!	Mem[00000000300c1400] = f0f6bb22, %l4 = 00000000ce5d9136
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = fffffffff0f6bb22
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 09cd2e40, %l0 = 0000000000001d6d
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000009cd
!	%l3 = 0000000000000056, Mem[00000000100c1408] = fec3035f
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000056
!	Mem[000000001000143a] = 02ed5502, %l1 = 0000000000000026
	ldsh	[%i0+0x03a],%l1		! %l1 = 0000000000005502
!	Mem[0000000010081400] = 0e116c60, %l6 = 000000007fba0c0a
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000e11

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000e11, Mem[00000000100c1400] = c04cb635
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = c04c0e11
!	%l4 = fffffffff0f6bb22, Mem[0000000010041410] = 36e938ec
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = bb2238ec
!	Mem[0000000010101420] = 7ac5eeb8128720e9, %l0 = 00000000000009cd, %l6 = 0000000000000e11
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 7ac5eeb8128720e9
!	%f20 = 2dc666fc, Mem[0000000030141408] = 6e8afd0b
	sta	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = 2dc666fc
!	Mem[0000000010081428] = 04a5b8f6, %l7 = 000000006b214db3, %asi = 80
	swapa	[%i2+0x028]%asi,%l7	! %l7 = 0000000004a5b8f6
!	Mem[0000000030141408] = 2dc666fc, %l4 = 00000000f0f6bb22
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000002dc666fc
!	%f0  = 50b14ae0, %f19 = 3bd75ee7, %f6  = 082dfa6a
	fdivs	%f0 ,%f19,%f6 		! %f6  = 5452bd06
!	%l2 = 6c9b1e9bca8e33f4, Mem[0000000010041400] = 6b167c00, %asi = 80
	stwa	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = ca8e33f4
!	%f24 = 6227e4a8 51a6c919, Mem[0000000030041408] = ffec9cee 1e2bbc87
	stda	%f24,[%i1+%o4]0x81	! Mem[0000000030041408] = 6227e4a8 51a6c919
!	%l6 = 7ac5eeb8128720e9, Mem[0000000030181410] = fe0e9d3a
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 20e99d3a

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 110e4cc07ee7a1d1, %l5 = 000000000000001b, %asi = 80
	ldxa	[%i3+0x000]%asi,%l5	! %l5 = 110e4cc07ee7a1d1
!	Mem[0000000010001410] = 5793ca8c, %l7 = 0000000004a5b8f6
	ldsba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000057
!	Mem[0000000030041410] = 35424a1c, %l1 = 0000000000005502
	ldswa	[%i1+%o5]0x81,%l1	! %l1 = 0000000035424a1c
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800000] = 67e2b870, %l4 = 000000002dc666fc, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000067e2
!	Mem[0000000030041410] = 1c4a4235, %f30 = 53382ef2
	lda	[%i1+%o5]0x89,%f30	! %f30 = 1c4a4235
!	Mem[0000000010181400] = 46108de0, %l6 = 7ac5eeb8128720e9
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000004610
!	Mem[0000000030181400] = ffa02010, %l4 = 00000000000067e2
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000020800041] = 62ebbea0, %l2 = 6c9b1e9bca8e33f4
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffeb
!	Mem[0000000010081400] = 0e116c60, %f11 = 4bf36bef
	ld	[%i2+%g0],%f11		! %f11 = 0e116c60
!	Mem[0000000010041400] = ca8e33f4 1c808c11, %l0 = 000009cd, %l1 = 35424a1c
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ca8e33f4 000000001c808c11

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000004610, Mem[00000000300c1410] = 3126e6dc7a7cd1fd
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000004610
!	Randomly selected nop
	nop
!	%l3 = 0000000000000056, Mem[000000001010142a] = 19f6f7b6, %asi = 80
	stba	%l3,[%i4+0x02a]%asi	! Mem[0000000010101428] = 19f656b6
!	%f16 = 4b411d10 3170bee1, Mem[0000000010181438] = 5150c542 6573ff0b, %asi = 80
	stda	%f16,[%i6+0x038]%asi	! Mem[0000000010181438] = 4b411d10 3170bee1
!	Mem[000000001004142e] = 6fdbc58f, %l3 = 0000000000000056
	ldstuba	[%i1+0x02e]%asi,%l3	! %l3 = 00000000000000c5
!	Mem[00000000100c1400] = 110e4cc0, %l3 = 00000000000000c5, %asi = 80
	swapa	[%i3+0x000]%asi,%l3	! %l3 = 00000000110e4cc0
!	%l7 = 0000000000000057, %l5 = 110e4cc07ee7a1d1, %l6 = 0000000000004610
	xnor	%l7,%l5,%l6		! %l6 = eef1b33f81185e79
!	%f24 = 6227e4a8 51a6c919, %l7 = 0000000000000057
!	Mem[00000000100c1418] = 7a9c694a77feedf3
	add	%i3,0x018,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_P ! Mem[00000000100c1418] = 7a9ce4a851a6c919
!	%l3 = 00000000110e4cc0, Mem[0000000010041418] = 2cc0868a4aff4e33, %asi = 80
	stxa	%l3,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000110e4cc0
!	%f9  = 383637a9, Mem[0000000010081410] = 5f73974c
	sta	%f9 ,[%i2+0x010]%asi	! Mem[0000000010081410] = 383637a9

p0_label_6:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = 5364bf50 7f7b7021 bf363e88 43334a27
!	Mem[0000000030101410] = 42e69d3c 052832dd 3339f95a 1674f3c3
!	Mem[0000000030101420] = 28d8eee8 20884259 4d87ed66 7849201f
!	Mem[0000000030101430] = 67030054 0d463a95 7453af32 32884b3b
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010081408] = 9ef82314, %l2 = ffffffffffffffeb
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 0000000000002314
!	Mem[0000000010181410] = 6a8e70cc, %l2 = 0000000000002314
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 000000000000006a
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800140] = 35e879f0, %l5 = 110e4cc07ee7a1d1, %asi = 80
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 00000000000035e8
!	Mem[0000000010101408] = 5eff7857, %l2 = 000000000000006a
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 000000005eff7857
!	Mem[0000000010081400] = 0e116c60 122dfef1, %l4 = ffffffff, %l5 = 000035e8, %asi = 80
	ldda	[%i2+0x000]%asi,%l4	! %l4 = 000000000e116c60 00000000122dfef1
!	Mem[0000000010081400] = 0e116c60, %l1 = 000000001c808c11
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 000000000000000e
!	Mem[0000000030001408] = 8ef9ff51, %l2 = 000000005eff7857
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 000000000000ff51
!	Mem[0000000030101408] = bf363e8843334a27, %l4 = 000000000e116c60
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = bf363e8843334a27
!	Mem[0000000010001408] = deb1c442, %l5 = 00000000122dfef1
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000042

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 901e4102, %l5 = 0000000000000042
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000901e4102
!	Mem[0000000010101408] = 5778ff5e, %l0 = 00000000ca8e33f4
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 000000005778ff5e
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 06b340d0, %l4 = bf363e8843334a27
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000b3
!	%f8  = 046eb478, Mem[0000000010041408] = 3e9dc1ff
	sta	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 046eb478
!	%l5 = 00000000901e4102, Mem[00000000300c1410] = 00000000
	stba	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000002
!	%l0 = 000000005778ff5e, Mem[0000000010041400] = ca8e33f4
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 5778ff5e
!	%l6 = eef1b33f81185e79, Mem[0000000010001420] = 08e15d38
	stw	%l6,[%i0+0x020]		! Mem[0000000010001420] = 81185e79
!	%l2 = 000000000000ff51, Mem[0000000030081410] = 5038207c
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 5138207c
!	Mem[0000000010001408] = 42c4b1de, %l3 = 00000000110e4cc0
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000042
!	%f20 = dd322805 3c9de642, %l0 = 000000005778ff5e
!	Mem[0000000010181438] = 4b411d103170bee1
	add	%i6,0x038,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_P ! Mem[0000000010181438] = dd3228053170bee1

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 62d0a056, %f8  = 046eb478
	lda	[%i3+0x028]%asi,%f8 	! %f8 = 62d0a056
!	Mem[0000000010001410] = 5793ca8c, %l1 = 000000000000000e
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 000000005793ca8c
!	Mem[0000000010181408] = 7d83c61e, %l3 = 0000000000000042
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = 000000007d83c61e
!	Mem[0000000021800140] = 35e879f0, %l1 = 000000005793ca8c
	lduh	[%o3+0x140],%l1		! %l1 = 00000000000035e8
!	Mem[0000000030081400] = 42000000, %l7 = 0000000000000057
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000042
!	Mem[00000000100c1408] = 00000056, %l7 = 0000000000000042
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000056
!	Mem[0000000010101410] = 557d2c57, %l0 = 000000005778ff5e
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 00000000557d2c57
!	Mem[0000000021800001] = 28c43f00, %l1 = 00000000000035e8
	ldsb	[%o3+0x001],%l1		! %l1 = ffffffffffffffc4
!	Mem[0000000030141400] = 3a9d0efe, %l7 = 0000000000000056
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000efe
!	Mem[0000000010041400] = 5778ff5e, %l5 = 00000000901e4102
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000005778

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l6 = eef1b33f81185e79, Mem[0000000010041410] = ec3822bb
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 81185e79
!	%f12 = 430a7ae4 0b89f0e5, Mem[0000000030081400] = 42000000 2d41ca61
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 430a7ae4 0b89f0e5
!	%l2 = 000000000000ff51, Mem[0000000010101408] = f4338eca
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = f433ff51
!	%l7 = 0000000000000efe, Mem[0000000030141408] = 22bbf6f005468407
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000efe
!	Mem[0000000030001400] = 28753dd0, %l7 = 0000000000000efe
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000028
!	Mem[000000001008143a] = 382a0fc2, %l0 = 00000000557d2c57
	ldstuba	[%i2+0x03a]%asi,%l0	! %l0 = 000000000000000f
!	%l0 = 000000000000000f, Mem[00000000100c1400] = c5000000
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000f
!	Mem[00000000100c1400] = 0f000000, %l5 = 0000000000005778
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 000000000f000000
!	%l6 = eef1b33f81185e79, Mem[0000000010181410] = 6a8e70cc
	stha	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 5e7970cc
!	%l0 = 000000000000000f, Mem[0000000010081408] = 1423f89e
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000ff89e

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 5e7970cc 0cff3e2d, %l0 = 0000000f, %l1 = ffffffc4, %asi = 80
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 000000005e7970cc 000000000cff3e2d
!	Mem[0000000010101408] = f433ff51, %l0 = 000000005e7970cc
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffff51
!	Mem[0000000010141430] = 7293f384, %l1 = 000000000cff3e2d, %asi = 80
	ldsha	[%i5+0x030]%asi,%l1	! %l1 = 0000000000007293
!	Mem[0000000030181410] = 20e99d3ac1f8c48b, %l1 = 0000000000007293
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 20e99d3ac1f8c48b
!	Mem[00000000201c0000] = 09cd2e40, %l3 = 000000007d83c61e
	ldsb	[%o0+%g0],%l3		! %l3 = 0000000000000009
!	Mem[00000000300c1400] = 22bbf6f02d5e8541, %f12 = 430a7ae4 0b89f0e5
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 22bbf6f0 2d5e8541
!	Mem[00000000100c1408] = 56000000, %l4 = 00000000000000b3
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000056
!	%l6 = eef1b33f81185e79, %l3 = 0000000000000009, %l0 = ffffffffffffff51
	sdivx	%l6,%l3,%l0		! %l0 = fe1adb070e580a80
!	Mem[0000000021800080] = 4eaeaf60, %l0 = fe1adb070e580a80, %asi = 80
	ldsha	[%o3+0x080]%asi,%l0	! %l0 = 0000000000004eae
!	%l3 = 0000000000000009, imm = 0000000000000595, %l3 = 0000000000000009
	orn	%l3,0x595,%l3		! %l3 = fffffffffffffa6b

p0_label_11:
!	Starting 10 instruction Store Burst
!	Mem[000000001014140c] = 4343b117, %l4 = 0000000000000056
	swap	[%i5+0x00c],%l4		! %l4 = 000000004343b117
!	Mem[0000000010141400] = 5c5ddd80, %l6 = 0000000081185e79
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 000000005c5ddd80
!	%l3 = fffffffffffffa6b, Mem[0000000010101410] = 557d2c57
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 6b7d2c57
!	Mem[0000000010081410] = 383637a9, %l4 = 000000004343b117
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 00000000383637a9
	membar	#Sync			! Added by membar checker (2)
!	%f10 = 5bec7b76 0e116c60, Mem[0000000030101410] = 42e69d3c 052832dd
	stda	%f10,[%i4+%o5]0x81	! Mem[0000000030101410] = 5bec7b76 0e116c60
!	Mem[00000000100c1416] = 2eab538d, %l6 = 000000005c5ddd80
	ldstuba	[%i3+0x016]%asi,%l6	! %l6 = 0000000000000053
!	%f12 = 22bbf6f0 2d5e8541, %l4 = 00000000383637a9
!	Mem[0000000010181410] = 5e7970cc0cff3e2d
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181410] = 5e7970cc2d5e8541
!	%f22 = c3f37416 5af93933, Mem[0000000010001408] = deb1c4ff b7a7090e
	stda	%f22,[%i0+%o4]0x88	! Mem[0000000010001408] = c3f37416 5af93933
!	%f14 = adba2570 4c97735f, Mem[00000000100c1410] = ace50a40 8dffab2e
	stda	%f14,[%i3+%o5]0x88	! Mem[00000000100c1410] = adba2570 4c97735f
!	%l1 = 20e99d3ac1f8c48b, Mem[0000000010181408] = f7c272251ec6837d
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 20e99d3ac1f8c48b

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 8bc4f8c1, %l5 = 000000000f000000
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000008bc4
!	Mem[0000000030141410] = 00000000, %l2 = 000000000000ff51
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800140] = 35e879f0, %l3 = fffffffffffffa6b, %asi = 80
	lduba	[%o3+0x140]%asi,%l3	! %l3 = 0000000000000035
!	Mem[0000000020800040] = 62ebbea0, %l6 = 0000000000000053, %asi = 80
	lduba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000062
!	Mem[0000000030101408] = 274a3343 883e36bf, %l4 = 383637a9, %l5 = 00008bc4
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000883e36bf 00000000274a3343
!	Mem[0000000010001408] = 3339f95a, %l5 = 00000000274a3343
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000003339
!	Mem[0000000030181400] = ffa020106995d5e1, %l4 = 00000000883e36bf
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = ffa020106995d5e1
!	Mem[0000000010081400] = 0e116c60, %f23 = 5af93933
	lda	[%i2+%g0]0x80,%f23	! %f23 = 0e116c60
!	Code Fragment 3, seed = 579706
p0_fragment_1:
!	%l0 = 0000000000004eae
	setx	0xf0e832a9f3144e56,%g7,%l0 ! %l0 = f0e832a9f3144e56
!	%l1 = 20e99d3ac1f8c48b
	setx	0x66666fd457c26b81,%g7,%l1 ! %l1 = 66666fd457c26b81
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f0e832a9f3144e56
	setx	0x6e374051cd3d9cbc,%g7,%l0 ! %l0 = 6e374051cd3d9cbc
!	%l1 = 66666fd457c26b81
	setx	0xd9d70d9f4e96e507,%g7,%l1 ! %l1 = d9d70d9f4e96e507
p0_fragment_1_end:
!	Mem[0000000010041400] = 5778ff5e, %l1 = d9d70d9f4e96e507
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000057

p0_label_13:
!	Starting 10 instruction Store Burst
!	%f16 = 21707b7f 50bf6453, Mem[0000000030041400] = 189c3630 422d3f81
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 21707b7f 50bf6453
!	%f19 = 883e36bf, Mem[0000000030141410] = 00000000
	sta	%f19,[%i5+%o5]0x81	! Mem[0000000030141410] = 883e36bf
!	%l0 = 6e374051cd3d9cbc, Mem[0000000030081400] = 430a7ae40b89f0e5
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 6e374051cd3d9cbc
!	Code Fragment 3, seed = 431484
p0_fragment_2:
!	%l0 = 6e374051cd3d9cbc
	setx	0x2339e1435a3d0846,%g7,%l0 ! %l0 = 2339e1435a3d0846
!	%l1 = 0000000000000057
	setx	0xac9fe49ed088c271,%g7,%l1 ! %l1 = ac9fe49ed088c271
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2339e1435a3d0846
	setx	0x73ee47172b3300ac,%g7,%l0 ! %l0 = 73ee47172b3300ac
!	%l1 = ac9fe49ed088c271
	setx	0x837acb358151c5f7,%g7,%l1 ! %l1 = 837acb358151c5f7
p0_fragment_2_end:
!	%l0 = 2b3300ac, %l1 = 8151c5f7, Mem[0000000010101410] = 6b7d2c57 14e2f822
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 2b3300ac 8151c5f7
!	%f2  = 329b2b1e 22c973f7, Mem[0000000030181410] = 3a9de920 8bc4f8c1
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 329b2b1e 22c973f7
!	Mem[0000000030141400] = fe0e9d3a, %l3 = 0000000000000035
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000fe0e9d3a
!	%f30 = 3b4b8832 32af5374, Mem[0000000030081408] = 29cab04e 3c5de667
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 3b4b8832 32af5374
!	Mem[0000000010001408] = 5af93933, %l6 = 0000000000000062
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000033
!	Mem[0000000010041410] = 795e1881, %l3 = 00000000fe0e9d3a
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000795e1881

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 883e36bf0000001b, %l1 = 837acb358151c5f7
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 883e36bf0000001b
!	Mem[0000000010141400] = 91775f05795e1881, %l0 = 73ee47172b3300ac
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 91775f05795e1881
!	Mem[0000000021800000] = 28c43f00, %l5 = 0000000000003339, %asi = 80
	ldsba	[%o3+0x000]%asi,%l5	! %l5 = 0000000000000028
!	Mem[0000000030181408] = 36915dce, %l1 = 883e36bf0000001b
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000036
!	Mem[0000000010141419] = 7fba0c0a, %l5 = 0000000000000028
	ldsb	[%i5+0x019],%l5		! %l5 = ffffffffffffffba
!	Mem[0000000010181410] = 5e7970cc2d5e8541, %l0 = 91775f05795e1881
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = 5e7970cc2d5e8541
!	Mem[0000000010001400] = 1d6d7ba0, %l5 = ffffffffffffffba
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000001d6d
!	Mem[0000000030001408] = 8ef9ff51, %l1 = 0000000000000036
	ldsha	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffff51
!	%l1 = ffffffffffffff51, immd = 0000000000000a1d, %l108 = 0000000000000007
	udivx	%l1,0xa1d,%l7		! %l7 = 001950310b5f0608
!	Mem[0000000010001438] = 02ed55026d6177cb, %f4  = 0527bdcc 737f372d
	ldd	[%i0+0x038],%f4 	! %f4  = 02ed5502 6d6177cb

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff51, Mem[0000000030041408] = 6227e4a8
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 5127e4a8
!	%l6 = 00000033, %l7 = 0b5f0608, Mem[0000000010041438] = 72987a62 6bd92bab, %asi = 80
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000033 0b5f0608
!	%f11 = 0e116c60, Mem[0000000010081408] = 000ff89e
	sta	%f11,[%i2+%o4]0x80	! Mem[0000000010081408] = 0e116c60
!	%l0 = 5e7970cc2d5e8541, Mem[0000000030001408] = 8ef9ff51
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 8ef9ff41
!	Mem[00000000218000c0] = 1e5e2190, %l2 = 0000000000000000
	ldstub	[%o3+0x0c0],%l2		! %l2 = 000000000000001e
!	Mem[00000000100c1408] = 56000000, %l3 = 00000000795e1881
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000056
!	%l1 = ffffffffffffff51, Mem[0000000020800041] = 62ebbea0, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = 6251bea0
!	%l3 = 0000000000000056, Mem[0000000030041410] = 35424a1c5753a03d
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000056
!	%l7 = 001950310b5f0608, Mem[00000000100c1408] = 000000ff
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000608
!	%f23 = 0e116c60, Mem[000000001008141c] = 0156c613
	st	%f23,[%i2+0x01c]	! Mem[000000001008141c] = 0e116c60

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 06ff40d0, %l7 = 001950310b5f0608
	lduh	[%o2+%g0],%l7		! %l7 = 00000000000006ff
!	Mem[00000000100c1410] = 5f73974c, %f10 = 5bec7b76
	lda	[%i3+%o5]0x80,%f10	! %f10 = 5f73974c
!	Mem[0000000010041400] = 5778ff5e1c808c11, %l2 = 000000000000001e
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 5778ff5e1c808c11
!	%l0 = 5e7970cc2d5e8541, imm = fffffffffffffe68, %l7 = 00000000000006ff
	add	%l0,-0x198,%l7		! %l7 = 5e7970cc2d5e83a9
!	Mem[0000000030181408] = e76dbf40 ce5d9136, %l0 = 2d5e8541, %l1 = ffffff51
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000ce5d9136 00000000e76dbf40
!	Mem[0000000010041408] = 78b46e04, %f0  = 50b14ae0
	lda	[%i1+%o4]0x80,%f0 	! %f0 = 78b46e04
!	Mem[0000000030041410] = 00000000, %l0 = 00000000ce5d9136
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 02000000, %l7 = 5e7970cc2d5e83a9
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000002
!	Mem[0000000030001410] = 5dcfe54dbc636d35, %f30 = 3b4b8832 32af5374
	ldda	[%i0+%o5]0x89,%f30	! %f30 = 5dcfe54d bc636d35
!	Mem[0000000030101400] = 50bf6453, %l4 = ffa020106995d5e1
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000006453

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f14 = adba2570 4c97735f, Mem[0000000010001400] = 1d6d7ba0 22e74931
	stda	%f14,[%i0+%g0]0x80	! Mem[0000000010001400] = adba2570 4c97735f
!	Mem[0000000020800001] = 67e2b870, %l1 = 00000000e76dbf40
	ldstub	[%o1+0x001],%l1		! %l1 = 00000000000000e2
!	%l2 = 5778ff5e1c808c11, Mem[0000000030041400] = 21707b7f
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 11707b7f
!	%f9  = 383637a9, Mem[0000000030181408] = ce5d9136
	sta	%f9 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 383637a9
!	Mem[0000000010041420] = 5e369998, %l2 = 000000001c808c11, %asi = 80
	swapa	[%i1+0x020]%asi,%l2	! %l2 = 000000005e369998
!	%l0 = 0000000000000000, Mem[0000000010001421] = 81185e79, %asi = 80
	stba	%l0,[%i0+0x021]%asi	! Mem[0000000010001420] = 81005e79
!	%f11 = 0e116c60, %f8  = 62d0a056, %f2  = 329b2b1e
	fadds	%f11,%f8 ,%f2 		! %f2  = 62d0a056
!	Mem[0000000010041410] = 3a9d0efe, %l6 = 0000000000000033
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000fe
!	%f0  = 78b46e04, Mem[0000000010101400] = 201d5d2d
	sta	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 78b46e04
!	%l6 = 000000fe, %l7 = 00000002, Mem[0000000030141410] = bf363e88 1b000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000fe 00000002

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000fe, %l4 = 0000000000006453
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000fe
!	Mem[0000000010181424] = 6dc8eea9, %l1 = 00000000000000e2, %asi = 80
	lduwa	[%i6+0x024]%asi,%l1	! %l1 = 000000006dc8eea9
!	Mem[0000000030001408] = a7427f468ef9ff41, %f22 = c3f37416 0e116c60
	ldda	[%i0+%o4]0x89,%f22	! %f22 = a7427f46 8ef9ff41
!	Mem[0000000010081408] = 779b1059606c110e, %l5 = 0000000000001d6d
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 779b1059606c110e
!	%l3 = 0000000000000056, %l1 = 000000006dc8eea9, %l7 = 0000000000000002
	udivx	%l3,%l1,%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = beaa9b49, %f14 = adba2570
	lda	[%i5+%o4]0x88,%f14	! %f14 = beaa9b49
!	Mem[0000000020800040] = 6251bea0, %l5 = 779b1059606c110e, %asi = 80
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 0000000000006251
!	Mem[0000000030181410] = f773c922, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000f7
!	Mem[0000000030001410] = bc636d35, %l6 = 00000000000000fe
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000035
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000006251
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 3a9d0eff, %l2 = 000000005e369998
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 00000035, %l7 = 00000000000000f7
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000035
!	Mem[0000000010001408] = ff39f95a, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff39f95a
!	%l6 = 0000000000000035, Mem[0000000010041412] = ff0e9d3a, %asi = 80
	stha	%l6,[%i1+0x012]%asi	! Mem[0000000010041410] = ff0e0035
!	%f30 = 5dcfe54d, Mem[0000000010181408] = 8bc4f8c1
	st	%f30,[%i6+%o4]		! Mem[0000000010181408] = 5dcfe54d
!	Mem[000000001000142c] = 71cbf7af, %l7 = 00000035, %l7 = 00000035
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000071cbf7af
!	%l6 = 0000000000000035, Mem[00000000218000c1] = ff5e2190
	stb	%l6,[%o3+0x0c1]		! Mem[00000000218000c0] = ff352190
!	%l6 = 0000000000000035, Mem[0000000010001410] = 5793ca8c
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0035ca8c
!	%l4 = 000000fe, %l5 = ff39f95a, Mem[0000000010181400] = e08d1046 71aa0d71
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000fe ff39f95a
!	%l6 = 0000000000000035, Mem[0000000030101408] = bf363e88
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00353e88

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 67ffb870, %l1 = 000000006dc8eea9
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000067ff
!	Mem[0000000030081408] = 3b4b8832, %l3 = 0000000000000056
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000003b4b
!	Mem[0000000030141408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 8ef9ff41, %l0 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = ffffffff8ef9ff41
!	Mem[0000000010181410] = 5e7970cc, %l1 = 00000000000067ff
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 000000000000005e
!	Mem[0000000010081400] = 0e116c60122dfef1, %l3 = 0000000000003b4b
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = 0e116c60122dfef1
!	Mem[0000000010001410] = ed18ac0f 8cca3500, %l2 = 000000ff, %l3 = 122dfef1
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 000000008cca3500 00000000ed18ac0f
!	Mem[0000000010101411] = 2b3300ac, %l5 = 00000000ff39f95a, %asi = 80
	ldsba	[%i4+0x011]%asi,%l5	! %l5 = 0000000000000033
!	Mem[0000000010181408] = 4de5cf5d, %l4 = 00000000000000fe
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = 000000004de5cf5d
!	Code Fragment 4, seed = 375461
p0_fragment_3:
!	%l0 = ffffffff8ef9ff41
	setx	0xe52bbcc07d1e57fe,%g7,%l0 ! %l0 = e52bbcc07d1e57fe
!	%l1 = 000000000000005e
	setx	0x15ae887513ad64a9,%g7,%l1 ! %l1 = 15ae887513ad64a9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e52bbcc07d1e57fe
	setx	0xaf6912b45b8c6d64,%g7,%l0 ! %l0 = af6912b45b8c6d64
!	%l1 = 15ae887513ad64a9
	setx	0x9699f055d077f52f,%g7,%l1 ! %l1 = 9699f055d077f52f
p0_fragment_3_end:

p0_label_21:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 22bbf6f0, %l7 = 0000000071cbf7af
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000022
!	%f0  = 78b46e04 14115371, Mem[0000000010141400] = 795e1881 91775f05
	stda	%f0 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 78b46e04 14115371
!	%l3 = 00000000ed18ac0f, Mem[0000000010181400] = ff39f95a000000fe
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000ed18ac0f
!	%f18 = 274a3343 883e36bf, Mem[0000000010181408] = 5dcfe54d 3a9de920
	std	%f18,[%i6+%o4]		! Mem[0000000010181408] = 274a3343 883e36bf
!	%f9  = 383637a9, Mem[0000000030101410] = 5bec7b76
	sta	%f9 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 383637a9
!	%l7 = 0000000000000022, Mem[0000000030141408] = fe0e000000000000
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000022
!	Mem[00000000100c1400] = 00005778 7ee7a1d1 08060000 0fca9d57
!	%f16 = 21707b7f 50bf6453 274a3343 883e36bf
!	%f20 = dd322805 3c9de642 a7427f46 8ef9ff41
!	%f24 = 59428820 e8eed828 1f204978 66ed874d
!	%f28 = 953a460d 54000367 5dcfe54d bc636d35
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000030081400] = 5140376e, %l7 = 0000000000000022
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000000000006e
!	%l3 = 00000000ed18ac0f, Mem[0000000010181408] = 43334a27
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 4333ac0f
!	%l1 = 9699f055d077f52f, Mem[0000000010181421] = 2db7d778, %asi = 80
	stba	%l1,[%i6+0x021]%asi	! Mem[0000000010181420] = 2d2fd778

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ac00332b, %l6 = 0000000000000035
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 000000000000002b
!	Mem[0000000010081408] = 0e116c60, %l0 = af6912b45b8c6d64
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 000000000000000e
!	Mem[0000000010141408] = beaa9b49, %l0 = 000000000000000e
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffff9b49
!	Mem[0000000010141410] = 30c0526c, %f13 = 2d5e8541
	lda	[%i5+%o5]0x80,%f13	! %f13 = 30c0526c
!	Mem[0000000010181434] = 45ee57e5, %l2 = 000000008cca3500
	lduw	[%i6+0x034],%l2		! %l2 = 0000000045ee57e5
!	Mem[0000000010041410] = cd51a31435000eff, %l1 = 9699f055d077f52f
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = cd51a31435000eff
!	Mem[0000000030041400] = 7f7b7011, %l1 = cd51a31435000eff
	lduwa	[%i1+%g0]0x89,%l1	! %l1 = 000000007f7b7011
!	%f10 = 5f73974c, %f6  = 5452bd06
	fcmpes	%fcc2,%f10,%f6 		! %fcc2 = 2
!	Mem[0000000010101410] = f7c55181 ac00332b, %l4 = 4de5cf5d, %l5 = 00000033
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000ac00332b 00000000f7c55181
!	Mem[0000000010041400] = 5eff7857, %l0 = ffffffffffff9b49
	ldsha	[%i1+%g0]0x88,%l0	! %l0 = 0000000000007857

p0_label_23:
!	Starting 10 instruction Store Burst
!	%f3  = 22c973f7, Mem[0000000010001400] = 7025baad
	sta	%f3 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 22c973f7
!	%l4 = 00000000ac00332b, Mem[000000001008142a] = 6b214db3, %asi = 80
	stba	%l4,[%i2+0x02a]%asi	! Mem[0000000010081428] = 6b212bb3
!	Mem[000000001008141e] = 0e116c60, %l3 = 00000000ed18ac0f
	ldstuba	[%i2+0x01e]%asi,%l3	! %l3 = 000000000000006c
!	Mem[0000000010001408] = 00000000, %l1 = 000000007f7b7011
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = a9373638, %l2 = 0000000045ee57e5
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000a9373638
!	%l3 = 000000000000006c, Mem[0000000010101408] = 51ff33f4
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000006c
!	%f0  = 78b46e04, Mem[0000000010101410] = 2b3300ac
	sta	%f0 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 78b46e04
!	Mem[00000000201c0000] = 09cd2e40, %l3 = 000000000000006c
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000009
!	%l7 = 000000000000006e, Mem[00000000218001c0] = 1860c250, %asi = 80
	stba	%l7,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 6e60c250
!	Mem[0000000010181425] = 6dc8eea9, %l7 = 000000000000006e
	ldstub	[%i6+0x025],%l7		! %l7 = 00000000000000c8

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[000000001010141e] = 4d2fc5d3, %l4 = 00000000ac00332b, %asi = 80
	ldsba	[%i4+0x01e]%asi,%l4	! %l4 = ffffffffffffffc5
!	Mem[0000000030001408] = 41fff98e, %l3 = 0000000000000009
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = 0000000041fff98e
!	Mem[0000000021800080] = 4eaeaf60, %l4 = ffffffffffffffc5
	lduh	[%o3+0x080],%l4		! %l4 = 0000000000004eae
!	Mem[0000000010181410] = cc70795e, %l2 = 00000000a9373638
	ldsba	[%i6+%o5]0x88,%l2	! %l2 = 000000000000005e
!	Mem[0000000010041400] = 5eff7857, %l0 = 0000000000007857
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = 000000005eff7857
!	Mem[0000000030001408] = 8ef9ff41, %l0 = 000000005eff7857
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 000000000000ff41
!	Mem[0000000021800101] = 64030fc0, %l5 = 00000000f7c55181, %asi = 80
	lduba	[%o3+0x101]%asi,%l5	! %l5 = 0000000000000003
!	Mem[0000000030081408] = 3b4b8832, %f9  = 383637a9
	lda	[%i2+%o4]0x81,%f9 	! %f9 = 3b4b8832
!	Mem[0000000010141438] = 0a356fe2 392adb2b, %l0 = 0000ff41, %l1 = 00000000, %asi = 80
	ldda	[%i5+0x038]%asi,%l0	! %l0 = 000000000a356fe2 00000000392adb2b
!	Mem[0000000010181408] = 0fac3343, %l7 = 00000000000000c8
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 000000000fac3343

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000041fff98e, Mem[0000000010001410] = 8cca3500
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 41fff98e
!	Mem[0000000030081408] = 32884b3b, %l6 = 000000000000002b
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000000000003b
!	%f7  = 6fad0693, Mem[000000001000140c] = 1674f3c3
	sta	%f7 ,[%i0+0x00c]%asi	! Mem[000000001000140c] = 6fad0693
!	%l2 = 0000005e, %l3 = 41fff98e, Mem[0000000030181400] = ffa02010 6995d5e1
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000005e 41fff98e
!	%l2 = 000000000000005e, Mem[0000000010181410] = 5e7970cc
	sth	%l2,[%i6+%o5]		! Mem[0000000010181410] = 005e70cc
!	%l2 = 0000005e, %l3 = 41fff98e, Mem[0000000030001400] = d03d75ff a1e4285b
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000005e 41fff98e
!	Mem[0000000021800140] = 35e879f0, %l3 = 0000000041fff98e
	ldstuba	[%o3+0x140]%asi,%l3	! %l3 = 0000000000000035
!	%l1 = 00000000392adb2b, Mem[0000000010001408] = 000000ff
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 392adb2b
!	%l5 = 0000000000000003, Mem[00000000211c0000] = 06ff40d0, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 03ff40d0
!	%l0 = 0a356fe2, %l1 = 392adb2b, Mem[0000000010101408] = 0000006c 799e4f37, %asi = 80
	stda	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = 0a356fe2 392adb2b

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 5eff7857, %l6 = 000000000000003b
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 000000005eff7857
!	Mem[000000001018143c] = 3170bee1, %l2 = 000000000000005e
	ldsw	[%i6+0x03c],%l2		! %l2 = 000000003170bee1
!	Mem[0000000010081410] = 4343b117, %l1 = 00000000392adb2b
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 000000004343b117
!	Mem[0000000010041400] = 5eff7857, %f20 = dd322805
	lda	[%i1+%g0]0x88,%f20	! %f20 = 5eff7857
!	%l4 = 0000000000004eae, %l4 = 0000000000004eae, %l1 = 000000004343b117
	xnor	%l4,%l4,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181400] = ed18ac0f, %f10 = 5f73974c
	lda	[%i6+%g0]0x88,%f10	! %f10 = ed18ac0f
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1400] = 5364bf507f7b7021, %l7 = 000000000fac3343
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 5364bf507f7b7021
!	Mem[0000000030081408] = 32884bff, %l3 = 0000000000000035
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000004bff
!	Mem[0000000010001400] = 22c973f7, %l4 = 0000000000004eae
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 00000000000073f7
!	Mem[0000000030141400] = 000000f7 c1f8c48b, %l2 = 3170bee1, %l3 = 00004bff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000f7 00000000c1f8c48b

p0_label_27:
!	Starting 10 instruction Store Burst
!	%f14 = beaa9b49 4c97735f, Mem[0000000010081400] = 0e116c60 122dfef1
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = beaa9b49 4c97735f
!	%f24 = 59428820, Mem[0000000010141418] = 7fba0c0a
	sta	%f24,[%i5+0x018]%asi	! Mem[0000000010141418] = 59428820
!	%f30 = 5dcfe54d, Mem[0000000010141410] = 30c0526c
	st	%f30,[%i5+%o5]		! Mem[0000000010141410] = 5dcfe54d
!	%l6 = 000000005eff7857, Mem[0000000010001410] = ed18ac0f41fff98e
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000005eff7857
!	%l2 = 00000000000000f7, Mem[0000000010141408] = 56000000beaa9b49
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000f7
!	Mem[0000000030001400] = 5e000000, %l3 = 00000000c1f8c48b
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000000000005e
!	%l6 = 000000005eff7857, Mem[0000000020800000] = 67ffb870, %asi = 80
	stba	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 57ffb870
!	%l1 = ffffffffffffffff, Mem[0000000010001410] = 5eff7857
	stha	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 5effffff
!	Mem[0000000010041410] = 35000eff, %l1 = 00000000ffffffff
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000035000eff
!	Mem[0000000010041400] = 5778ff5e, %l3 = 000000000000005e
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000057

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 046eb478, %l4 = 00000000000073f7
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 00000000046eb478
!	Mem[0000000010141400] = 14115371, %l5 = 0000000000000003
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 0000000000005371
!	Mem[00000000218000c0] = ff352190, %l4 = 00000000046eb478
	ldsh	[%o3+0x0c0],%l4		! %l4 = ffffffffffffff35
!	Mem[0000000010101410] = 046eb478, %l1 = 0000000035000eff
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffb478
!	Mem[0000000030181400] = 0000005e, %l2 = 00000000000000f7
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 383637a90e116c60, %f14 = beaa9b49 4c97735f
	ldda	[%i4+%o5]0x81,%f14	! %f14 = 383637a9 0e116c60
!	Mem[00000000100c1408] = 274a3343, %l2 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = 00000000274a3343
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000005371
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041438] = 000000330b5f0608, %l4 = ffffffffffffff35
	ldx	[%i1+0x038],%l4		! %l4 = 000000330b5f0608
!	Mem[00000000300c1410] = 02000000, %l7 = 5364bf507f7b7021
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = 0000000002000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	%f22 = a7427f46 8ef9ff41, Mem[00000000100c1408] = 274a3343 883e36bf
	stda	%f22,[%i3+%o4]0x80	! Mem[00000000100c1408] = a7427f46 8ef9ff41
!	Mem[0000000010141408] = f7000000, %l3 = 0000000000000057
	ldstuba	[%i5+0x008]%asi,%l3	! %l3 = 00000000000000f7
!	%l0 = 000000000a356fe2, Mem[0000000010041408] = 046eb478
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 046e6fe2
!	%l0 = 000000000a356fe2, Mem[00000000300c1400] = ffbbf6f0
	stba	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = e2bbf6f0
!	Mem[0000000030041410] = 00000000, %l1 = ffffffffffffb478
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 383637a9, %l2 = 00000000274a3343
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000038
!	%f31 = bc636d35, Mem[0000000010181400] = 0fac18ed
	sta	%f31,[%i6+%g0]0x80	! Mem[0000000010181400] = bc636d35
!	%f3  = 22c973f7, Mem[000000001000142c] = 71cbf7af
	st	%f3 ,[%i0+0x02c]	! Mem[000000001000142c] = 22c973f7
!	%l4 = 000000330b5f0608, %l5 = 00000000000000ff, %y  = 00000000
	udiv	%l4,%l5,%l6		! %l6 = 00000000000b6a70
	mov	%l0,%y			! %y = 0a356fe2
!	%f30 = 5dcfe54d bc636d35, %l4 = 000000330b5f0608
!	Mem[0000000030141400] = 000000f7c1f8c48b
	stda	%f30,[%i5+%l4]ASI_PST16_S ! Mem[0000000030141400] = 5dcf00f7c1f8c48b

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000000038
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141410] = 5dcfe54d, %l5 = 00000000000000ff
	ldsb	[%i5+%o5],%l5		! %l5 = 000000000000005d
!	Mem[0000000010141410] = 4de5cf5d, %l0 = 000000000a356fe2
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 000000004de5cf5d
!	Mem[00000000300c1400] = e2bbf6f0, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 000000000000e2bb
!	Mem[00000000100c1400] = 5364bf507f7b7021, %f22 = a7427f46 8ef9ff41
	ldda	[%i3+%g0]0x88,%f22	! %f22 = 5364bf50 7f7b7021
!	Mem[0000000010101408] = e26f350a, %f21 = 3c9de642
	lda	[%i4+%o4]0x88,%f21	! %f21 = e26f350a
!	Mem[0000000010141400] = 14115371, %l1 = 000000000000e2bb
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 0000000014115371
!	Mem[0000000030141400] = 5dcf00f7, %f18 = 274a3343
	lda	[%i5+%g0]0x81,%f18	! %f18 = 5dcf00f7
!	Mem[0000000010181430] = 4f010de4 45ee57e5, %l0 = 4de5cf5d, %l1 = 14115371, %asi = 80
	ldda	[%i6+0x030]%asi,%l0	! %l0 = 000000004f010de4 0000000045ee57e5
!	%l1 = 0000000045ee57e5, %l3 = 00000000000000f7, %y  = 0a356fe2
	smul	%l1,%l3,%l4		! %l4 = 0000004378f6cdf3, %y = 00000043

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffcd2e40, %l0 = 000000004f010de4
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000cd
!	Mem[0000000010181424] = 6dffeea9, %l1 = 0000000045ee57e5
	swap	[%i6+0x024],%l1		! %l1 = 000000006dffeea9
!	Mem[0000000010081410] = 17b14343, %l2 = 000000000000ffff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000043
!	%l2 = 0000000000000043, Mem[0000000030041408] = 5127e4a8
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0043e4a8
!	%f0  = 78b46e04, Mem[000000001004140c] = 34b84997
	sta	%f0 ,[%i1+0x00c]%asi	! Mem[000000001004140c] = 78b46e04
!	%f16 = 21707b7f 50bf6453, %l1 = 000000006dffeea9
!	Mem[0000000010141420] = 004aeb1848deefc9
	add	%i5,0x020,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010141420] = 5364eb1848de7021
!	%f4  = 02ed5502 6d6177cb, %l3 = 00000000000000f7
!	Mem[0000000030141418] = 51ca3aba045bd3a3
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141418] = 51ca55026d6177cb
!	%f28 = 953a460d 54000367, Mem[0000000010101400] = 046eb478 09a574b1
	stda	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = 953a460d 54000367
!	%f8  = 62d0a056 3b4b8832, Mem[0000000030101400] = 50bf6453 21707b7f
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 62d0a056 3b4b8832
!	%f6  = 5452bd06 6fad0693, Mem[0000000030141408] = 22000000 00000000
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 5452bd06 6fad0693

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff78ff5e, %l3 = 00000000000000f7
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1418] = a7427f46, %l1 = 000000006dffeea9, %asi = 80
	ldswa	[%i3+0x018]%asi,%l1	! %l1 = ffffffffa7427f46
!	Mem[0000000030001400] = ff0000008ef9ff41, %f28 = 953a460d 54000367
	ldda	[%i0+%g0]0x81,%f28	! %f28 = ff000000 8ef9ff41
!	Mem[0000000030141408] = 5452bd066fad0693, %l1 = ffffffffa7427f46
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 5452bd066fad0693
!	Mem[0000000010081400] = beaa9b49, %l5 = 000000000000005d
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = ffffffffbeaa9b49
!	Mem[0000000030081400] = 514037ff, %l3 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000037ff
!	Mem[00000000300c1410] = 0200000000004610, %l7 = 0000000002000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 0200000000004610
!	Mem[0000000030101408] = 00353e88, %l6 = 00000000000b6a70
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = e26f6e04, %l5 = ffffffffbeaa9b49
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffffe26f6e04
!	Mem[00000000211c0001] = 03ff40d0, %l1 = 5452bd066fad0693
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000043, Mem[0000000030141400] = 8bc4f8c1f700cf5d
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000043
!	Mem[0000000030041408] = a8e44300, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 0200000000004610, Mem[0000000030141400] = 43000000
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 46100000
!	%l2 = 00000043, %l3 = 000037ff, Mem[0000000010081410] = ff43b117 7025baad
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000043 000037ff
!	%f26 = 1f204978 66ed874d, Mem[0000000010141410] = 4de5cf5d 4d15a022
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = 1f204978 66ed874d
!	%l2 = 0000000000000043, Mem[0000000010041408] = 046eb478046e6fe2
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000043
!	%l1 = 0000000000000000, Mem[0000000030181408] = 45ee57e5
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ee57e5
!	Mem[0000000010141408] = ff000000 00000000, %l0 = 000000cd, %l1 = 00000000
	ldd	[%i5+%o4],%l0		! %l0 = 00000000ff000000 0000000000000000
!	%f26 = 1f204978, Mem[0000000030081410] = 5138207c
	sta	%f26,[%i2+%o5]0x81	! Mem[0000000030081410] = 1f204978
!	%f16 = 21707b7f 50bf6453, Mem[00000000300c1400] = e2bbf6f0 2d5e8541
	stda	%f16,[%i3+%g0]0x81	! Mem[00000000300c1400] = 21707b7f 50bf6453

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 14115371, %l5 = ffffffffe26f6e04
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000071
!	Mem[0000000030041408] = 19c9a651a8e443ff, %l3 = 00000000000037ff
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = 19c9a651a8e443ff
!	Mem[000000001014141c] = 6b214db3, %l5 = 0000000000000071
	ldsw	[%i5+0x01c],%l5		! %l5 = 000000006b214db3
!	Mem[00000000211c0001] = 03ff40d0, %l0 = 00000000ff000000
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001400] = f773c922 4c97735f, %l2 = 00000043, %l3 = a8e443ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000f773c922 000000004c97735f
!	Mem[0000000010181408] = 0fac3343883e36bf, %l3 = 000000004c97735f, %asi = 80
	ldxa	[%i6+0x008]%asi,%l3	! %l3 = 0fac3343883e36bf
!	Mem[0000000010141410] = 66ed874d, %l4 = 0000004378f6cdf3
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 000000000000004d
!	Mem[0000000010001400] = f773c922, %l3 = 0fac3343883e36bf
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000f773c922
!	Mem[0000000010001408] = 392adb2b, %l7 = 0200000000004610
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 00000000392adb2b
!	Mem[0000000030181410] = f773c922, %l5 = 000000006b214db3
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = fffffffffffffff7

p0_label_35:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030041408] = ff43e4a8
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000030141408] = 06bd5254, %l5 = fffffffffffffff7
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000054
!	%l3 = 00000000f773c922, Mem[0000000010001408] = 392adb2b
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 392ac922
!	%l3 = 00000000f773c922, Mem[0000000010001438] = 02ed5502
	stw	%l3,[%i0+0x038]		! Mem[0000000010001438] = f773c922
!	%l2 = 00000000f773c922, Mem[0000000030101410] = ff3637a90e116c60
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000f773c922
!	%l5 = 0000000000000054, Mem[0000000030101408] = 274a3343883e3500
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000054
!	Mem[0000000030141408] = ff52bd06, %l2 = 00000000f773c922
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff52bd06
!	Mem[0000000010141408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000000000054, Mem[0000000030181408] = 00ee57e5
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 54ee57e5
!	Mem[0000000020800001] = 57ffb870, %l4 = 000000000000004d
	ldstuba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141401] = 71531114, %l6 = 00000000000000ff
	ldsb	[%i5+0x001],%l6		! %l6 = 0000000000000053
!	Mem[0000000030081400] = 514037ff, %l7 = 00000000392adb2b
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000514037ff
!	Mem[0000000030101410] = 00000000, %l3 = 00000000f773c922
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 0a356fe2, %l7 = 00000000514037ff
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 000000000a356fe2
!	Mem[0000000020800041] = 6251bea0, %l7 = 000000000a356fe2
	ldsb	[%o1+0x041],%l7		! %l7 = 0000000000000051
!	Mem[0000000030001400] = ff000000, %l7 = 0000000000000051
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000100c1400] = 5364bf50 7f7b7021, %l2 = ff52bd06, %l3 = 00000000
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000007f7b7021 000000005364bf50
!	Mem[000000001008142a] = 6b212bb3, %l1 = 0000000000000000, %asi = 80
	lduba	[%i2+0x02a]%asi,%l1	! %l1 = 000000000000002b
!	Mem[0000000010181408] = bf363e884333ac0f, %l6 = 0000000000000053
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = bf363e884333ac0f
!	Mem[0000000030081408] = ff4b8832, %l0 = 00000000000000ff
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 000000000000ff4b

p0_label_37:
!	Starting 10 instruction Store Burst
!	%f30 = 5dcfe54d bc636d35, Mem[0000000030081410] = 7849201f 1da10810
	stda	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = 5dcfe54d bc636d35
!	%l1 = 000000000000002b, Mem[0000000010041400] = 5eff78ff
	stha	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 5eff002b
!	%l3 = 000000005364bf50, Mem[0000000010001438] = f773c922
	sth	%l3,[%i0+0x038]		! Mem[0000000010001438] = bf50c922
!	%f14 = 383637a9 0e116c60, Mem[0000000010041410] = ffffffff cd51a314
	stda	%f14,[%i1+%o5]0x88	! Mem[0000000010041410] = 383637a9 0e116c60
!	%l0 = 0000ff4b, %l1 = 0000002b, Mem[00000000100c1410] = dd322805 3c9de642
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff4b 0000002b
!	%f28 = ff000000 8ef9ff41, Mem[0000000010001410] = 5effffff 00000000
	stda	%f28,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000 8ef9ff41
!	%l5 = 0000000000000054, Mem[0000000010181415] = 2d5e8541
	stb	%l5,[%i6+0x015]		! Mem[0000000010181414] = 2d548541
!	%f6  = 5452bd06, Mem[000000001008142c] = 2ba3436f
	sta	%f6 ,[%i2+0x02c]%asi	! Mem[000000001008142c] = 5452bd06
!	%l6 = 4333ac0f, %l7 = ff000000, Mem[0000000010001400] = 22c973f7 5f73974c
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 4333ac0f ff000000
!	Mem[0000000010101410] = 78b46e04, %l2 = 000000007f7b7021
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000078b46e04

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0fac3343000000ff, %f6  = 5452bd06 6fad0693
	ldda	[%i0+%g0]0x80,%f6 	! %f6  = 0fac3343 000000ff
!	Mem[00000000201c0000] = ffff2e40, %l3 = 000000005364bf50
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000ffff
!	%l6 = bf363e884333ac0f, %l4 = 00000000000000ff, %l5  = 0000000000000054
	mulx	%l6,%l4,%l5		! %l5 = 770849baf07862f1
!	Mem[0000000030041408] = 0000000051a6c919, %l3 = 000000000000ffff
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = 0000000051a6c919
!	Mem[0000000010041400] = 2b00ff5e 1c808c11, %l4 = 000000ff, %l5 = f07862f1
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000002b00ff5e 000000001c808c11
!	Mem[0000000030081408] = ff4b8832, %l5 = 000000001c808c11
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 000000000000ff4b
!	Mem[0000000010101424] = 128720e9, %l7 = 00000000ff000000
	ldsb	[%i4+0x024],%l7		! %l7 = 0000000000000012
!	Mem[0000000010001410] = 41fff98e000000ff, %l1 = 000000000000002b
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 41fff98e000000ff
!	Mem[0000000010041400] = 2b00ff5e 1c808c11, %l2 = 78b46e04, %l3 = 51a6c919
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 000000002b00ff5e 000000001c808c11
!	Mem[0000000030181410] = f773c922, %l5 = 000000000000ff4b
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000f773c922

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l2 = 000000002b00ff5e, Mem[000000001018140a] = 0fac3343, %asi = 80
	stha	%l2,[%i6+0x00a]%asi	! Mem[0000000010181408] = 0facff5e
!	Mem[00000000100c1400] = 21707b7f, %l3 = 000000001c808c11
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000021
!	%l5 = 00000000f773c922, Mem[0000000010101408] = 0a356fe2
	sth	%l5,[%i4+%o4]		! Mem[0000000010101408] = c9226fe2
!	Mem[0000000030081408] = ff4b8832, %l6 = 000000004333ac0f
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ff4b8832
!	%f3  = 22c973f7, Mem[0000000010041414] = a9373638
	st	%f3 ,[%i1+0x014]	! Mem[0000000010041414] = 22c973f7
!	Mem[000000001014143b] = 0a356fe2, %l2 = 000000002b00ff5e
	ldstuba	[%i5+0x03b]%asi,%l2	! %l2 = 00000000000000e2
!	%l4 = 2b00ff5e, %l5 = f773c922, Mem[0000000010101400] = 953a460d 54000367
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 2b00ff5e f773c922
!	%f30 = 5dcfe54d bc636d35, Mem[0000000010141400] = 71531114 046eb478
	stda	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 5dcfe54d bc636d35
!	Mem[0000000030181410] = f773c922, %l3 = 0000000000000021
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000f773c922
!	Mem[0000000030081410] = bc636d35, %l3 = 00000000f773c922
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000035

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 7ac5eeb8, %f4  = 02ed5502
	lda	[%i4+0x020]%asi,%f4 	! %f4 = 7ac5eeb8
!	Mem[0000000010081414] = 000037ff, %l1 = 41fff98e000000ff, %asi = 80
	lduha	[%i2+0x014]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 22c92a396fad0693, %l5 = 00000000f773c922, %asi = 80
	ldxa	[%i0+0x008]%asi,%l5	! %l5 = 22c92a396fad0693
!	Mem[0000000010081400] = beaa9b49, %l6 = 00000000ff4b8832
	ldsba	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffffbe
!	Mem[0000000030041410] = ff00000000000056, %l4 = 000000002b00ff5e
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff00000000000056
!	Mem[0000000030141410] = fe000000, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = fffffffffffffe00
!	Mem[0000000030001410] = bc636d35, %l6 = ffffffffffffffbe
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000006d35
!	Mem[00000000100c1410] = 0000ff4b, %l4 = ff00000000000056
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = e557ee54, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = ffffffffe557ee54
!	Mem[0000000030181400] = 0000005e, %l4 = ffffffffe557ee54
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 000000000000005e

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l1 = fffffffffffffe00, Mem[0000000030001408] = 8ef9ff41
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = fffffe00
!	%f13 = 30c0526c, Mem[0000000010181438] = dd322805
	st	%f13,[%i6+0x038]	! Mem[0000000010181438] = 30c0526c
!	%l3 = 0000000000000035, Mem[0000000010141408] = ff00000000000000
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000035
!	%f2  = 62d0a056 22c973f7, %l6 = 0000000000006d35
!	Mem[0000000030041428] = 375f0f463ad50e7f
	add	%i1,0x028,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041428] = f773c9223ad50e7f
!	Mem[00000000201c0000] = ffff2e40, %l5 = 22c92a396fad0693
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 02000000, %l2 = 00000000000000e2
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000002000000
!	%l0 = 0000ff4b, %l1 = fffffe00, Mem[0000000030101400] = 3b4b8832 62d0a056
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff4b fffffe00
!	%l7 = 0000000000000012, Mem[0000000010001400] = 0fac3343000000ff
	stx	%l7,[%i0+%g0]		! Mem[0000000010001400] = 0000000000000012
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000002000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 000000000000005e, Mem[0000000030041408] = 00000000
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000005e

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000054, %f9  = 3b4b8832
	lda	[%i4+%o4]0x89,%f9 	! %f9 = 00000054
!	Mem[0000000010181400] = bc636d3500000000, %f4  = 7ac5eeb8 6d6177cb
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = bc636d35 00000000
!	Mem[0000000010041405] = 1c808c11, %l2 = 00000000000000ff
	ldub	[%i1+0x005],%l2		! %l2 = 0000000000000080
!	%f25 = e8eed828, %f15 = 0e116c60, %f12 = 22bbf6f0
	fdivs	%f25,%f15,%f12		! %f12 = ff800000
!	Mem[00000000300c1410] = e2000000, %l3 = 0000000000000035
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 499baabe, %l6 = 0000000000006d35
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000aabe
!	Mem[0000000030081408] = 4333ac0f, %l1 = fffffffffffffe00
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000043
!	Mem[0000000010041408] = 43000000, %l4 = 000000000000005e
	lduw	[%i1+%o4],%l4		! %l4 = 0000000043000000
!	Mem[0000000010081408] = 779b1059606c110e, %l7 = 0000000000000012
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 779b1059606c110e
!	Mem[00000000201c0000] = ffff2e40, %l3 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f0  = 78b46e04 14115371, %l7 = 779b1059606c110e
!	Mem[0000000030181430] = 71533514590da455
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030181430] = 71531114046eb478
!	Mem[00000000100c1408] = 467f42a7, %l7 = 779b1059606c110e
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000a7
!	%l1 = 0000000000000043, Mem[00000000100c1400] = 7f7b70ff
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7f7b0043
!	%f28 = ff000000 8ef9ff41, Mem[0000000030101410] = 00000000 f773c922
	stda	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000 8ef9ff41
!	Mem[0000000030181400] = 5e000000, %l1 = 0000000000000043
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 000000005e000000
!	%f1  = 14115371, %f19 = 883e36bf, %f0  = 78b46e04
	fadds	%f1 ,%f19,%f0 		! %f0  = 14115370
!	%f25 = e8eed828, Mem[0000000010101438] = 3b608a82
	st	%f25,[%i4+0x038]	! Mem[0000000010101438] = e8eed828
!	Mem[0000000030101400] = 4bff0000 00feffff 54000000 00000000
!	%f0  = 14115370 14115371 62d0a056 22c973f7
!	%f4  = bc636d35 00000000 0fac3343 000000ff
!	%f8  = 62d0a056 00000054 ed18ac0f 0e116c60
!	%f12 = ff800000 30c0526c 383637a9 0e116c60
	stda	%f0 ,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	%f30 = 5dcfe54d bc636d35, %l5 = 00000000000000ff
!	Mem[00000000100c1418] = a7427f468ef9ff41
	add	%i3,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_P ! Mem[00000000100c1418] = 5dcfe54dbc636d35
!	%l0 = 000000000000ff4b, Mem[0000000030101400] = 14115371
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff4b

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000043 000037ff, %l0 = 0000ff4b, %l1 = 5e000000, %asi = 80
	ldda	[%i2+0x010]%asi,%l0	! %l0 = 0000000000000043 00000000000037ff
!	Mem[0000000010041410] = f773c922 0e116c60, %l2 = 00000080, %l3 = 0000ffff
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 000000000e116c60 00000000f773c922
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030141400] = 46100000 00000000 f773c922 6fad0693
!	Mem[0000000030141410] = fe000000 02000000 51ca5502 6d6177cb
!	Mem[0000000030141420] = 7146e348 242a2939 07b46cc6 439c85ff
!	Mem[0000000030141430] = 0c9fa2b4 43575775 6338cc92 62b7171b
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010001404] = 00000012, %f3  = 22c973f7
	lda	[%i0+0x004]%asi,%f3 	! %f3 = 00000012
!	Mem[00000000211c0000] = 03ff40d0, %l1 = 00000000000037ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000003ff
!	Mem[0000000010001400] = 00000000, %l2 = 000000000e116c60
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001018141e] = 080b8593, %l0 = 0000000000000043, %asi = 80
	lduha	[%i6+0x01e]%asi,%l0	! %l0 = 0000000000008593
!	Mem[0000000010141432] = 7293f384, %l1 = 00000000000003ff, %asi = 80
	ldsba	[%i5+0x032]%asi,%l1	! %l1 = fffffffffffffff3
!	Mem[0000000030181408] = e557ee54, %l1 = fffffffffffffff3
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffee54
!	Code Fragment 4, seed = 917884
p0_fragment_4:
!	%l0 = 0000000000008593
	setx	0xc370d65f992da846,%g7,%l0 ! %l0 = c370d65f992da846
!	%l1 = ffffffffffffee54
	setx	0xda20332621176271,%g7,%l1 ! %l1 = da20332621176271
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c370d65f992da846
	setx	0x6a855db3b2ffa0ac,%g7,%l0 ! %l0 = 6a855db3b2ffa0ac
!	%l1 = da20332621176271
	setx	0xd51fbfa0f3fc65f7,%g7,%l1 ! %l1 = d51fbfa0f3fc65f7
p0_fragment_4_end:

p0_label_45:
!	Starting 10 instruction Store Burst
!	%f26 = 07b46cc6 439c85ff, %l4 = 0000000043000000
!	Mem[00000000300c1400] = 21707b7f50bf6453
	stda	%f26,[%i3+%l4]ASI_PST32_SL ! Mem[00000000300c1400] = 21707b7f50bf6453
!	%l4 = 0000000043000000, Mem[00000000211c0000] = 03ff40d0, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000040d0
!	%f24 = 7146e348, Mem[0000000010181400] = 356d63bc
	sta	%f24,[%i6+%g0]0x88	! Mem[0000000010181400] = 7146e348
!	%l3 = 00000000f773c922, Mem[0000000010041408] = 43000000
	stwa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = f773c922
!	%l6 = 0000aabe, %l7 = 000000a7, Mem[0000000030001410] = bc636d35 5dcfe54d
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000aabe 000000a7
!	Mem[0000000030001408] = 00feffff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000000feffff
!	Mem[000000001018143c] = 3170bee1, %l2 = 0000000000feffff
	ldstub	[%i6+0x03c],%l2		! %l2 = 0000000000000031
!	Mem[0000000010041424] = 5f3cd449, %l7 = 000000a7, %l3 = f773c922
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000005f3cd449
!	%l2 = 0000000000000031, Mem[0000000010101408] = c9226fe2
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00316fe2
!	Mem[00000000300c1400] = 7f7b7021, %l7 = 00000000000000a7
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000021

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = beaa9b49, %f4  = bc636d35
	lda	[%i2+%g0]0x80,%f4 	! %f4 = beaa9b49
!	Mem[0000000021800100] = 64030fc0, %l6 = 000000000000aabe, %asi = 80
	lduha	[%o3+0x100]%asi,%l6	! %l6 = 0000000000006403
!	Mem[0000000010001410] = ff0000008ef9ff41, %f10 = ed18ac0f 0e116c60
	ldda	[%i0+%o5]0x88,%f10	! %f10 = ff000000 8ef9ff41
!	Mem[0000000030001400] = 41fff98e 000000ff, %l4 = 43000000, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 0000000041fff98e
!	Mem[00000000300c1408] = ffb233ae, %l4 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 000000000000ffb2
!	Mem[0000000030041400] = 7f7b7011, %l2 = 0000000000000031
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000007011
!	Mem[00000000100c1410] = 0000ff4b 0000002b, %l2 = 00007011, %l3 = 5f3cd449, %asi = 80
	ldda	[%i3+0x010]%asi,%l2	! %l2 = 000000000000ff4b 000000000000002b
!	Mem[0000000010001410] = 41fff98e, %l4 = 000000000000ffb2
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000041fff98e
!	%f18 = f773c922, %f1  = 14115371, %f5  = 00000000
	fdivs	%f18,%f1 ,%f5 		! %f5  = ff800000
!	%l1 = d51fbfa0f3fc65f7, immd = fffffffffffffa74, %l108 = 0000000000000001
	udivx	%l1,-0x58c,%l1		! %l1 = 0000000000000000

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000021, Mem[00000000201c0001] = ffff2e40
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = ff212e40
!	%l4 = 0000000041fff98e, Mem[0000000010041410] = 0e116c60
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0e11f98e
!	%f28 = 0c9fa2b4 43575775, Mem[0000000010001408] = 22c92a39 6fad0693
	stda	%f28,[%i0+%o4]0x80	! Mem[0000000010001408] = 0c9fa2b4 43575775
!	Mem[0000000030001408] = 00000000, %l3 = 000000000000002b
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000006403, %l1 = 0000000000000000, %l7 = 0000000000000021
	xnor	%l6,%l1,%l7		! %l7 = ffffffffffff9bfc
!	%l3 = 0000000000000000, Mem[0000000030181408] = e557ee54
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = e557ee00
!	%f0  = 14115370 14115371, Mem[0000000010181410] = 005e70cc 2d548541
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 14115370 14115371
!	%f14 = 383637a9, Mem[00000000300c1400] = 7f7b70ff
	sta	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 383637a9
!	%l0 = b2ffa0ac, %l1 = 00000000, Mem[0000000010001410] = 8ef9ff41 ff000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = b2ffa0ac 00000000
!	%l2 = 000000000000ff4b, Mem[0000000010101420] = 7ac5eeb8128720e9, %asi = 80
	stxa	%l2,[%i4+0x020]%asi	! Mem[0000000010101420] = 000000000000ff4b

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 7f7b0043, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000043
!	Mem[00000000100c1408] = 467f42ff, %l5 = 0000000041fff98e
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4, seed = 718419
p0_fragment_5:
!	%l0 = 6a855db3b2ffa0ac
	setx	0x3607b8336fa5888e,%g7,%l0 ! %l0 = 3607b8336fa5888e
!	%l1 = 0000000000000000
	setx	0xbc04da4d73c4f039,%g7,%l1 ! %l1 = bc04da4d73c4f039
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3607b8336fa5888e
	setx	0x01b5ecb23fa163f4,%g7,%l0 ! %l0 = 01b5ecb23fa163f4
!	%l1 = bc04da4d73c4f039
	setx	0xfbd5eacfd4aa66bf,%g7,%l1 ! %l1 = fbd5eacfd4aa66bf
p0_fragment_5_end:
!	Mem[0000000030081400] = 2bdb2a39cd3d9cbc, %l0 = 01b5ecb23fa163f4
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 2bdb2a39cd3d9cbc
!	Mem[0000000010041418] = 00000000110e4cc0, %f18 = f773c922 6fad0693, %asi = 80
	ldda	[%i1+0x018]%asi,%f18	! %f18 = 00000000 110e4cc0
!	Mem[0000000010001408] = b4a29f0c, %l4 = 0000000041fff98e
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 000000000000000c
!	Mem[0000000010081428] = 6b212bb3, %f16 = 46100000
	ld	[%i2+0x028],%f16	! %f16 = 6b212bb3
!	Mem[000000001018141a] = 4f7d856a, %l1 = fbd5eacfd4aa66bf, %asi = 80
	lduha	[%i6+0x01a]%asi,%l1	! %l1 = 000000000000856a
!	Mem[0000000010081400] = beaa9b494c97735f, %f2  = 62d0a056 00000012
	ldda	[%i2+%g0]0x80,%f2 	! %f2  = beaa9b49 4c97735f
!	Mem[0000000030181408] = e557ee00, %l4 = 000000000000000c
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = ffffffffe557ee00

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l0 = cd3d9cbc, %l1 = 0000856a, Mem[00000000100c1408] = 467f42ff 41fff98e
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = cd3d9cbc 0000856a
!	Mem[0000000030081410] = bc636dff, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000bc636dff
!	%l2 = 000000000000ff4b, Mem[0000000010141400] = 4de5cf5d
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ff4b
!	Mem[0000000030181410] = 21000000, %l2 = 000000000000ff4b
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f14 = 383637a9 0e116c60, %l2 = 0000000000000000
!	Mem[0000000030101418] = ff0000004333ac0f
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l2]ASI_PST16_S ! Mem[0000000030101418] = ff0000004333ac0f
!	Mem[0000000030141408] = f773c922, %l7 = ffffffffffff9bfc
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000f7
!	Mem[0000000030081408] = 4333ac0f, %l4 = ffffffffe557ee00
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000043
!	%f23 = 6d6177cb, Mem[0000000030041408] = 5e000000
	sta	%f23,[%i1+%o4]0x81	! Mem[0000000030041408] = 6d6177cb
!	%l3 = 0000000000000043, Mem[0000000030101408] = 62d0a05622c973f7
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000043
!	Mem[0000000030041400] = 7f7b7011, %l7 = 00000000000000f7
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 000000007f7b7011

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 6d6177cb, %l4 = 0000000000000043
	lduha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000006d61
!	Mem[0000000010041420] = 1c808c115f3cd449, %f10 = ff000000 8ef9ff41
	ldd	[%i1+0x020],%f10	! %f10 = 1c808c11 5f3cd449
!	Mem[0000000030141408] = ff73c922, %l7 = 000000007f7b7011
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1426] = e8eed828, %l3 = 0000000000000043
	lduh	[%i3+0x026],%l3		! %l3 = 000000000000d828
!	Mem[0000000010101410] = 7f7b70218151c5f7, %l7 = 00000000000000ff
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 7f7b70218151c5f7
!	Mem[0000000010141408] = 00000000, %l5 = 00000000bc636dff
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001426] = 177dc569, %l0 = 2bdb2a39cd3d9cbc
	lduh	[%i0+0x026],%l0		! %l0 = 000000000000c569
!	Mem[0000000020800000] = 57ffb870, %l5 = 0000000000000000
	ldsh	[%o1+%g0],%l5		! %l5 = 00000000000057ff
!	Mem[0000000010181408] = 0facff5e, %l4 = 0000000000006d61
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000fac
!	Mem[00000000300c1400] = 5364bf50383637a9, %f4  = beaa9b49 ff800000
	ldda	[%i3+%g0]0x89,%f4 	! %f4  = 5364bf50 383637a9

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000fac, Mem[00000000300c1408] = ffb233ae
	stwa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000fac
!	Mem[00000000300c1408] = ac0f0000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000fac, Mem[0000000010141410] = 4d87ed66
	stba	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ac87ed66
!	%l0 = 0000c569, %l1 = 0000856a, Mem[0000000010141410] = 66ed87ac 1f204978
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000c569 0000856a
!	%l3 = 000000000000d828, Mem[0000000010001400] = 0000000000000012
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000000d828
!	Mem[0000000030141400] = 00001046, %l4 = 0000000000000fac
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000001046
!	Mem[0000000030101408] = 43000000, %l5 = 00000000000057ff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000043
!	Mem[0000000030041408] = cb77616d, %l4 = 0000000000001046
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000000000006d
!	Mem[0000000030001400] = ff000000, %l1 = 000000000000856a
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 8ef9110e, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l2	! %l2 = ffffffff8ef9110e

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 779b1059606c110e, %f4  = 5364bf50 383637a9
	ldda	[%i2+%o4]0x88,%f4 	! %f4  = 779b1059 606c110e
!	%f15 = 0e116c60, %f13 = 30c0526c, %f3  = 4c97735f
	fadds	%f15,%f13,%f3 		! %f3  = 30c0526c
!	%l5 = 0000000000000043, imm = 000000000000081c, %l4 = 000000000000006d
	orn	%l5,0x81c,%l4		! %l4 = fffffffffffff7e3
!	Mem[00000000201c0001] = ff212e40, %l6 = 0000000000006403
	ldsb	[%o0+0x001],%l6		! %l6 = 0000000000000021
!	Mem[0000000030181410] = 210000ff, %l7 = 7f7b70218151c5f7
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 000000fe, %l0 = 000000000000c569
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000fe
!	Mem[0000000030001400] = 000000ff, %l6 = 0000000000000021
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %f16 = 6b212bb3
	lda	[%i0+%g0]0x88,%f16	! %f16 = 00000000
!	Mem[0000000030001400] = ff000000, %l0 = 00000000000000fe
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000020800040] = 6251bea0, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 0000000000006251

p0_label_53:
!	Starting 10 instruction Store Burst
!	%f24 = 7146e348 242a2939, %l6 = 00000000000000ff
!	Mem[0000000030001418] = 141553da60485443
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l6]ASI_PST16_S ! Mem[0000000030001418] = 7146e348242a2939
!	%l6 = 000000ff, %l7 = 00006251, Mem[0000000030081410] = ff000000 4de5cf5d
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 00006251
!	Mem[00000000211c0000] = 000040d0, %l2 = ffffffff8ef9110e
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (5)
!	%f24 = 7146e348, Mem[0000000030141408] = 22c973ff
	sta	%f24,[%i5+%o4]0x89	! Mem[0000000030141408] = 7146e348
!	Mem[00000000100c1410] = 4bff0000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001014141c] = 6b214db3, %l1 = 0000000000000000, %asi = 80
	swapa	[%i5+0x01c]%asi,%l1	! %l1 = 000000006b214db3
!	%l0 = 0000ff00, %l1 = 6b214db3, Mem[0000000010181408] = 0facff5e 883e36bf
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000ff00 6b214db3
!	Mem[00000000100c1408] = bc9c3dcd, %l3 = 000000000000d828
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000bc9c3dcd
!	Mem[0000000030181408] = e557ee00, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = ff6177cb
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 006177cb

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 43000000, %l6 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 0000000043000000
!	Mem[0000000010041400] = 2b00ff5e1c808c11, %l3 = 00000000bc9c3dcd
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 2b00ff5e1c808c11
!	Mem[0000000010041410] = 8ef9110e, %l7 = 0000000000006251
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = ffffffff8ef9110e
!	Mem[0000000030141400] = 00000fac, %f6  = 0fac3343
	lda	[%i5+%g0]0x89,%f6 	! %f6 = 00000fac
!	Mem[0000000010141410] = 69c50000, %l1 = 000000006b214db3
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000069c50000
!	Mem[0000000010081400] = beaa9b49, %l7 = ffffffff8ef9110e
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000be
!	Mem[0000000030081410] = 51620000ff000000, %l6 = 0000000043000000
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 51620000ff000000
!	Mem[0000000030141400] = ac0f0000 00000000, %l0 = 0000ff00, %l1 = 69c50000
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ac0f0000 0000000000000000
!	Mem[00000000211c0000] = ff0040d0, %l5 = 0000000000000043
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffff00
!	Mem[000000001014142e] = 5a77dd0f, %l6 = 51620000ff000000, %asi = 80
	lduba	[%i5+0x02e]%asi,%l6	! %l6 = 00000000000000dd

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffff7e3, immd = 00000c32, %y  = 00000043
	udiv	%l4,0xc32,%l3		! %l3 = 0000000005936f06
	mov	%l0,%y			! %y = ac0f0000
!	%f12 = ff800000, %f10 = 1c808c11, %f10 = 1c808c11 5f3cd449
	fsmuld	%f12,%f10,%f10		! %f10 = fff00000 00000000
!	Mem[0000000030001408] = 0000002b, %l4 = fffffffffffff7e3
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000000000002b
!	%f6  = 00000fac, Mem[0000000010141430] = 7293f384
	sta	%f6 ,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000fac
!	%f10 = fff00000, Mem[0000000030181408] = ffee57e5
	sta	%f10,[%i6+%o4]0x81	! Mem[0000000030181408] = fff00000
!	%f16 = 00000000, %f6  = 00000fac
	fcmps	%fcc3,%f16,%f6 		! %fcc3 = 1
!	Mem[00000000211c0001] = ff0040d0, %l2 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00ff0000, %l5 = ffffffffffffff00
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l3 = 0000000005936f06, Mem[0000000010101410] = 21707b7f
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 21707b06
!	%f8  = 62d0a056 00000054, %l0 = 00000000ac0f0000
!	Mem[0000000010141430] = 00000fac74f9a305
	add	%i5,0x030,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141430] = 00000fac74f9a305

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ffe879f0, %l6 = 00000000000000dd
	lduh	[%o3+0x140],%l6		! %l6 = 000000000000ffe8
!	Mem[0000000010101408] = 00316fe2, %f28 = 0c9fa2b4
	lda	[%i4+0x008]%asi,%f28	! %f28 = 00316fe2
!	Mem[00000000300c1408] = ac0f00ff, %f9  = 00000054
	lda	[%i3+%o4]0x89,%f9 	! %f9 = ac0f00ff
!	Mem[00000000300c1408] = ff000fac, %l4 = 000000000000002b
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001010141a] = 59f702aa, %l4 = ffffffffffffffff, %asi = 80
	ldsha	[%i4+0x01a]%asi,%l4	! %l4 = 00000000000002aa
!	Mem[0000000030041408] = 006177cb, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = aca0ffb200000000, %f20 = fe000000 02000000
	ldda	[%i0+%o5]0x80,%f20	! %f20 = aca0ffb2 00000000
!	Mem[0000000010141410] = 69c50000, %l0 = 00000000ac0f0000, %asi = 80
	ldswa	[%i5+0x010]%asi,%l0	! %l0 = 0000000069c50000
!	Mem[0000000010081408] = 606c110e, %l3 = 0000000005936f06
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 000000000000110e
!	Mem[0000000030101410] = bc636d3500000000, %l6 = 000000000000ffe8
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = bc636d3500000000

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 0000110e, Mem[0000000010081410] = 43000000 ff370000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 0000110e
!	%l7 = 00000000000000be, Mem[0000000010181410] = 14115370
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = be115370
!	%f7  = 000000ff, Mem[0000000030181410] = 210000ff
	sta	%f7 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l2 = 00000000, %l3 = 0000110e, Mem[0000000030001410] = 0000aabe 000000a7
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 0000110e
!	%f6  = 00000fac 000000ff, Mem[0000000010181438] = 30c0526c ff70bee1, %asi = 80
	stda	%f6 ,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000fac 000000ff
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ff212e40
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00212e40
!	%l2 = 0000000000000000, Mem[0000000030181408] = 0000f0ff
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%f18 = 00000000 110e4cc0, %l0 = 0000000069c50000
!	Mem[0000000030141438] = 6338cc9262b7171b
	add	%i5,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141438] = 6338cc9262b7171b
!	Mem[00000000100c1408] = 0000d828, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 0fac33ff, %l0 = 0000000069c50000
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = b4a29f0c, %l7 = 00000000000000be
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 000000000000000c
!	Mem[0000000010101410] = 067b7021, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000067b
!	Mem[00000000100c1410] = ff00ff4b0000002b, %l1 = 0000000000000000
	ldx	[%i3+%o5],%l1		! %l1 = ff00ff4b0000002b
!	%l3 = 000000000000110e, immd = fffffffffffffdff, %l5  = 0000000000000000
	mulx	%l3,-0x201,%l5		! %l5 = ffffffffffddd2f2
!	Mem[0000000010101436] = 5d6e1e25, %l7 = 000000000000000c, %asi = 80
	lduha	[%i4+0x036]%asi,%l7	! %l7 = 0000000000001e25
!	Mem[0000000030081408] = ff33ac0f, %l7 = 0000000000001e25
	lduwa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ff33ac0f
!	Mem[0000000030041410] = 5600000002000000, %f10 = fff00000 00000000
	ldda	[%i1+%o5]0x89,%f10	! %f10 = 56000000 02000000
!	Mem[0000000010081400] = beaa9b49 4c97735f, %l0 = 000000ff, %l1 = 0000002b
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000beaa9b49 000000004c97735f
!	Mem[0000000030041400] = f700000050bf6453, %f20 = aca0ffb2 00000000
	ldda	[%i1+%g0]0x81,%f20	! %f20 = f7000000 50bf6453
!	Mem[0000000010181400] = 7146e348, %l0 = 00000000beaa9b49
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 000000000000e348

p0_label_59:
!	Starting 10 instruction Store Burst
!	%f22 = 51ca5502 6d6177cb, Mem[0000000010101428] = 19f656b6 07394f2f
	std	%f22,[%i4+0x028]	! Mem[0000000010101428] = 51ca5502 6d6177cb
!	%l2 = 000000000000067b, Mem[0000000030081410] = ff000000
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000067b
!	%l3 = 000000000000110e, Mem[0000000030041410] = 02000000
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000110e
!	%f16 = 00000000 00000000, Mem[0000000030101410] = 00000000 bc636d35
	stda	%f16,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%f26 = 07b46cc6, Mem[00000000100c142c] = 66ed874d
	st	%f26,[%i3+0x02c]	! Mem[00000000100c142c] = 07b46cc6
!	%f14 = 383637a9 0e116c60, %l4 = 00000000000002aa
!	Mem[0000000030141428] = 07b46cc6439c85ff
	add	%i5,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030141428] = 076c6c0e43378538
!	%f3  = 30c0526c, Mem[0000000030041400] = 000000f7
	sta	%f3 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 30c0526c
!	Mem[0000000010041410] = 0e11f98e, %l2 = 000000000000067b
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 000000000e11f98e
!	%f26 = 07b46cc6 439c85ff, Mem[0000000010101410] = 067b7021 8151c5f7
	stda	%f26,[%i4+%o5]0x80	! Mem[0000000010101410] = 07b46cc6 439c85ff
!	Mem[0000000020800041] = 6251bea0, %l0 = 000000000000e348
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000051

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000fac, %l5 = ffffffffffddd2f2
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = 7b060000, %f24 = 7146e348
	ld	[%i1+%o5],%f24		! %f24 = 7b060000
!	Mem[0000000010101422] = 00000000, %l5 = ffffffffffffffff
	ldsh	[%i4+0x022],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141400] = 4bff0000, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 0000000000004bff
!	Mem[0000000010041410] = 7b060000, %l0 = 0000000000000051
	lduha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000007b06
!	Mem[0000000010141410] = 69c50000, %l7 = 00000000ff33ac0f
	lduba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000069
!	%l4 = 00000000000002aa, %l4 = 00000000000002aa, %l6 = bc636d3500000000
	and	%l4,%l4,%l6		! %l6 = 00000000000002aa
!	Mem[00000000300c1400] = 383637a9, %l6 = 00000000000002aa
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000a9
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000069
	ldsba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 383637a9, %l3 = 000000000000110e
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 00000000383637a9

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l4 = 000002aa, %l5 = 00004bff, Mem[0000000010001408] = 0c9fa2b4 43575775
	std	%l4,[%i0+%o4]		! Mem[0000000010001408] = 000002aa 00004bff
!	Mem[0000000030181408] = 00000000, %l6 = 00000000000000a9
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000fac, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000fac
!	%l5 = 0000000000004bff, imm = 000000000000053a, %l0 = 0000000000007b06
	xnor	%l5,0x53a,%l0		! %l0 = ffffffffffffb13a
!	%l4 = 00000000000002aa, %l6 = 0000000000000000, %l4 = 00000000000002aa
	sub	%l4,%l6,%l4		! %l4 = 00000000000002aa
!	%l4 = 00000000000002aa, Mem[0000000030141400] = 00000000
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 000002aa
!	Mem[0000000030141408] = 48e34671, %l0 = 00000000ffffb13a
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 0000000048e34671
!	%l2 = 000000000e11f98e, Mem[0000000030041410] = 0000110e
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000f98e
!	%l4 = 00000000000002aa, Mem[0000000030041400] = 6c52c030
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = aa52c030
!	%l7 = 0000000000000fac, Mem[0000000010101408] = 00316fe2
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000fac

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 43007b7f, %l2 = 000000000e11f98e
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000043007b7f
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = ff000000 8ef9ff41 ff000000 467f42a7
!	Mem[0000000030001410] = 00000000 0e110000 7146e348 242a2939
!	Mem[0000000030001420] = 40087d68 5f2e86d9 57204fe6 3220689f
!	Mem[0000000030001430] = 4e95d6d4 6815a715 119799b2 3487fbbb
	ldda	[%i0+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030041408] = 19c9a651cb776100, %f10 = 56000000 02000000
	ldda	[%i1+%o4]0x89,%f10	! %f10 = 19c9a651 cb776100
!	Mem[0000000010041408] = f773c922, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = fffffffffffff773
!	Mem[0000000030001410] = 00000000, %l3 = 00000000383637a9
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 000000e2, %l5 = 0000000000004bff
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000e2
!	Mem[0000000010041410] = f773c9220000067b, %f2  = beaa9b49 30c0526c
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = f773c922 0000067b
!	%f8  = 62d0a056 ac0f00ff, Mem[0000000010001408] = 000002aa 00004bff
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 62d0a056 ac0f00ff
!	Mem[0000000010081400] = beaa9b494c97735f, %l4 = 00000000000002aa
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = beaa9b494c97735f
!	Mem[0000000030001408] = 000000ff, %l4 = beaa9b494c97735f
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = aa52c030, %l0 = 0000000048e34671
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 00000000aa52c030
!	Mem[0000000010041400] = 2b00ff5e, %l5 = 00000000000000e2
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000002b
!	Code Fragment 4, seed = 292904
p0_fragment_6:
!	%l0 = 00000000aa52c030
	setx	0x27d293751d8c5ee6,%g7,%l0 ! %l0 = 27d293751d8c5ee6
!	%l1 = 000000004c97735f
	setx	0x016b35e2e674d711,%g7,%l1 ! %l1 = 016b35e2e674d711
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 27d293751d8c5ee6
	setx	0x0e253746de77734c,%g7,%l0 ! %l0 = 0e253746de77734c
!	%l1 = 016b35e2e674d711
	setx	0x86e644cb80583697,%g7,%l1 ! %l1 = 86e644cb80583697
p0_fragment_6_end:
!	Mem[0000000030041400] = 7146e348, %l7 = 0000000000000fac
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000048
!	%l2 = 0000000043007b7f, Mem[0000000030041400] = 7146e3ff
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 71467b7f
!	%l6 = fffff773, %l7 = 00000048, Mem[0000000030101400] = 4bff0000 70531114
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = fffff773 00000048
!	%f2  = f773c922 0000067b, Mem[0000000030081400] = 392adb2b bc9c3dcd
	stda	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = f773c922 0000067b
!	%f4  = 779b1059 606c110e, Mem[0000000030081400] = 0000067b f773c922
	stda	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 779b1059 606c110e
!	%l1 = 86e644cb80583697, Mem[0000000010181400] = 48e3467100000000, %asi = 80
	stxa	%l1,[%i6+0x000]%asi	! Mem[0000000010181400] = 86e644cb80583697
!	Mem[0000000010101422] = 00000000, %l1 = 86e644cb80583697
	ldstuba	[%i4+0x022]%asi,%l1	! %l1 = 0000000000000000

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = a9000000 40bf6de7, %l0 = de77734c, %l1 = 00000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000a9000000 0000000040bf6de7
!	Mem[0000000030001410] = 0000110e00000000, %f16 = ff000000 8ef9ff41
	ldda	[%i0+%o5]0x89,%f16	! %f16 = 0000110e 00000000
!	Mem[0000000010001421] = 81005e79, %l1 = 0000000040bf6de7, %asi = 80
	lduba	[%i0+0x021]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141426] = 48de7021, %l5 = 000000000000002b
	ldsb	[%i5+0x026],%l5		! %l5 = 0000000000000070
!	Mem[000000001014141c] = 00000000, %l3 = 0000000000000000, %asi = 80
	lduha	[%i5+0x01c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[000000001014142a] = 0530bf16, %l5 = 0000000000000070
	lduh	[%i5+0x02a],%l5		! %l5 = 000000000000bf16
!	Mem[0000000030001410] = 00000000, %f9  = ac0f00ff
	lda	[%i0+%o5]0x89,%f9 	! %f9 = 00000000
!	Mem[00000000211c0001] = ffff40d0, %l6 = fffffffffffff773, %asi = 80
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 7b060000 22c973f7, %l6 = 000000ff, %l7 = 00000048
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 000000007b060000 0000000022c973f7
!	Mem[00000000300c1410] = 10460000e2000000, %f28 = 4e95d6d4 6815a715
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 10460000 e2000000

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l6 = 000000007b060000, Mem[00000000100c1410] = ff00ff4b0000002b
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000007b060000
!	Mem[0000000010001410] = aca0ffb2, %l7 = 0000000022c973f7
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 00000000aca0ffb2
!	%f14 = 383637a9 0e116c60, Mem[0000000010081408] = 606c110e 779b1059
	stda	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = 383637a9 0e116c60
!	Mem[00000000201c0001] = 00212e40, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000021
!	%l2 = 43007b7f, %l3 = 00000021, Mem[0000000010001420] = 81005e79 177dc569, %asi = 80
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 43007b7f 00000021
!	%l4 = ffffffffffffffff, Mem[0000000030101410] = 0000000000000000
	stxa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffffffffffff
!	%l6 = 000000007b060000, Mem[00000000211c0000] = ffff40d0
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 000040d0
!	%f7  = 000000ff, Mem[00000000300c1408] = ff000fac
	sta	%f7 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%f12 = ff800000, %f1  = 14115371, %f13 = 30c0526c
	fdivs	%f12,%f1 ,%f13		! %f13 = ff800000
!	%f20 = 00000000 0e110000, Mem[0000000010181410] = 705311be 71531114
	stda	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 0e110000

p0_label_66:
!	Starting 10 instruction Load Burst
!	%l4 = ffffffffffffffff, %l1 = 0000000000000000, %l5  = 000000000000bf16
	mulx	%l4,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = 56a0d062, %l6 = 000000007b060000
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000062
!	Mem[0000000010181408] = ff00ff00, %l4 = ffffffffffffffff
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff00ff00
!	Mem[00000000300c1400] = 383637a9, %l3 = 0000000000000021
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000383637a9
!	Mem[0000000030001408] = ff000000, %l7 = 00000000aca0ffb2
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101400] = 73f7ffff, %l0 = 00000000a9000000
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = 0000f98e, %f8  = 62d0a056
	lda	[%i1+%o5]0x89,%f8 	! %f8 = 0000f98e
!	Mem[0000000030041408] = cb776100, %l5 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000006100
!	Mem[0000000030041410] = 8ef90000, %l4 = 00000000ff00ff00
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000008ef9
!	%l5 = 0000000000006100, immd = 00000324, %y  = ac0f0000
	udiv	%l5,0x324,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000383637a9, Mem[0000000030081410] = 7b060000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = a9060000
!	%l2 = 0000000043007b7f, Mem[00000000300c1410] = 000000e2
	stwa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 43007b7f
!	Code Fragment 4, seed = 742298
p0_fragment_7:
!	%l0 = ffffffffffffffff
	setx	0xc6ba98c942059556,%g7,%l0 ! %l0 = c6ba98c942059556
!	%l1 = 0000000000000000
	setx	0x903de93242bd0281,%g7,%l1 ! %l1 = 903de93242bd0281
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6ba98c942059556
	setx	0xe0f741e34c4083bc,%g7,%l0 ! %l0 = e0f741e34c4083bc
!	%l1 = 903de93242bd0281
	setx	0xd1e3d7a705711c07,%g7,%l1 ! %l1 = d1e3d7a705711c07
p0_fragment_7_end:
!	%f28 = 10460000 e2000000, Mem[00000000100c1408] = 28d800ff 0000856a
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = 10460000 e2000000
!	%l3 = 00000000383637a9, Mem[0000000030101400] = 73f7ffff
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 383637a9
!	%l2 = 43007b7f, %l3 = 383637a9, Mem[0000000010101410] = 07b46cc6 439c85ff
	std	%l2,[%i4+%o5]		! Mem[0000000010101410] = 43007b7f 383637a9
!	Mem[0000000020800041] = 62ffbea0, %l6 = 0000000000000062
	ldstuba	[%o1+0x041]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l5 = 00000000ffffffff
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l1 = 0000000005711c07
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = f773c922, %l2 = 0000000043007b7f
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = fffffffff773c922
!	Mem[0000000021800140] = ffe879f0, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x140]%asi,%l5	! %l5 = ffffffffffffffe8
!	Mem[00000000100c1408] = e2000000, %l4 = 0000000000008ef9
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000e2000000
!	Mem[00000000201c0001] = 00ff2e40, %l2 = fffffffff773c922
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 56a0d062, %l7 = ffffffffffffffff
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 0000000056a0d062
!	Mem[000000001004140e] = 00000000, %l1 = 00000000000000ff
	lduh	[%i1+0x00e],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041410] = 8ef90000, %l4 = 00000000e2000000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffff8ef9
!	Mem[0000000030101400] = a9373638, %f30 = 119799b2
	lda	[%i4+%g0]0x81,%f30	! %f30 = a9373638
!	Mem[0000000030101410] = ffffffff, %f8  = 0000f98e
	lda	[%i4+%o5]0x81,%f8 	! %f8 = ffffffff
!	Mem[0000000010101421] = 0000ff00, %l4 = ffffffffffff8ef9, %asi = 80
	ldsba	[%i4+0x021]%asi,%l4	! %l4 = 0000000000000000

p0_label_69:
!	Starting 10 instruction Store Burst
!	Mem[000000001018143c] = 000000ff, %l3 = 00000000383637a9
	ldstuba	[%i6+0x03c]%asi,%l3	! %l3 = 0000000000000000
!	%f20 = 00000000, %f15 = 0e116c60, %f26 = 57204fe6
	fsubs	%f20,%f15,%f26		! %f26 = 8e116c60
!	%l4 = 00000000, %l5 = ffffffe8, Mem[0000000030101410] = ffffffff ffffffff
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 ffffffe8
!	%l7 = 0000000056a0d062, Mem[0000000021800000] = 28c43f00, %asi = 80
	stha	%l7,[%o3+0x000]%asi	! Mem[0000000021800000] = d0623f00
!	%l3 = 0000000000000000, Mem[0000000030141408] = 9306ad6f3ab1ffff
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[0000000030081410] = a9060000, %l2 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000a9060000
!	%l5 = ffffffffffffffe8, Mem[0000000010081410] = ff000000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = ff00ffe8
!	%f12 = ff800000 ff800000, Mem[0000000030081410] = ff000000 51620000
	stda	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = ff800000 ff800000
!	%f6  = 00000fac 000000ff, Mem[0000000010101400] = 2b00ff5e f773c922
	std	%f6 ,[%i4+%g0]		! Mem[0000000010101400] = 00000fac 000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 00000000a9060000
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_70:
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, %l2 = 0000000000000000, %l0 = e0f741e34c4083bc
	udivx	%l4,%l2,%l0		! Div by zero, %l0 = e0f741e34c4083e4
!	Mem[0000000010041408] = f773c922, %l6 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000f773
!	%f28 = 10460000, %f28 = 10460000, %f28 = 10460000
	fadds	%f28,%f28,%f28		! %f28 = 10c60000
!	Mem[0000000010041410] = 7b060000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 000000000000007b
!	Mem[00000000100c1438] = 5dcfe54dbc636d35, %l4 = 000000000000007b
	ldx	[%i3+0x038],%l4		! %l4 = 5dcfe54dbc636d35
	membar	#Sync			! Added by membar checker (7)
!	Mem[00000000100c1400] = 43007b7f 50bf6453 000000e2 00004610
!	Mem[00000000100c1410] = 00000000 7b060000 5dcfe54d bc636d35
!	Mem[00000000100c1420] = 59428820 e8eed828 1f204978 07b46cc6
!	Mem[00000000100c1430] = 953a460d 54000367 5dcfe54d bc636d35
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081408] = 0e116c60, %l7 = 0000000056a0d062
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000060
!	%f21 = 7b060000, %f9  = 00000000, %f6  = 00000fac 000000ff
	fsmuld	%f21,%f9 ,%f6 		! %f6  = 00000000 00000000
!	Code Fragment 3, seed = 222137
p0_fragment_8:
!	%l0 = e0f741e34c4083e4
	setx	0xfc63daa64e0a635e,%g7,%l0 ! %l0 = fc63daa64e0a635e
!	%l1 = 0000000000000000
	setx	0x002e92758a471209,%g7,%l1 ! %l1 = 002e92758a471209
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc63daa64e0a635e
	setx	0x9a335f02528a1cc4,%g7,%l0 ! %l0 = 9a335f02528a1cc4
!	%l1 = 002e92758a471209
	setx	0x0e831bcc2c42068f,%g7,%l1 ! %l1 = 0e831bcc2c42068f
p0_fragment_8_end:
!	Mem[0000000010081410] = ff00ffe8, %f13 = ff800000
	lda	[%i2+%o5]0x88,%f13	! %f13 = ff00ffe8

p0_label_71:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081414] = 0e110000, %l7 = 0000000000000060
	ldstub	[%i2+0x014],%l7		! %l7 = 000000000000000e
!	Mem[0000000010081400] = beaa9b49, %l5 = 00000000ffffffe8, %asi = 80
	swapa	[%i2+0x000]%asi,%l5	! %l5 = 00000000beaa9b49
!	Mem[0000000010181420] = 2d2fd77845ee57e5, %l1 = 0e831bcc2c42068f, %l6 = 000000000000f773
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 2d2fd77845ee57e5
!	%l1 = 0e831bcc2c42068f, Mem[0000000010001426] = 00000021, %asi = 80
	stha	%l1,[%i0+0x026]%asi	! Mem[0000000010001424] = 0000068f
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 000040d0, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000040d0
!	%l0 = 9a335f02528a1cc4, Mem[0000000030081410] = ff800000
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = ff8000c4
!	Mem[0000000010141400] = 0000ff4b, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 000000000000ff4b
!	%f0  = 14115370 14115371, Mem[0000000030181410] = 000000ff 329b2b1e
	stda	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 14115370 14115371
!	%f30 = 5dcfe54d bc636d35, Mem[0000000030181410] = 71531114 70531114
	stda	%f30,[%i6+%o5]0x81	! Mem[0000000030181410] = 5dcfe54d bc636d35
!	%f4  = 779b1059, Mem[00000000300c1400] = a9373638
	sta	%f4 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 779b1059

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%f13 = ff00ffe8, %f22 = 5dcfe54d, %f6  = 00000000
	fdivs	%f13,%f22,%f6 		! %f6  = e09ed933
!	Mem[0000000030141410] = 000000fe, %l0 = 9a335f02528a1cc4
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000fe
!	Mem[0000000010181400] = 86e644cb 80583697, %l0 = 000000fe, %l1 = 2c42068f
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 0000000086e644cb 0000000080583697
!	Mem[0000000010101411] = 43007b7f, %l7 = 000000000000000e, %asi = 80
	ldsba	[%i4+0x011]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041420] = 1c808c115f3cd449, %f14 = 383637a9 0e116c60, %asi = 80
	ldda	[%i1+0x020]%asi,%f14	! %f14 = 1c808c11 5f3cd449
!	Mem[0000000010141410] = 69c50000, %f6  = e09ed933
	ld	[%i5+%o5],%f6 		! %f6 = 69c50000
!	Mem[0000000021800000] = d0623f00, %l0 = 0000000086e644cb, %asi = 80
	lduha	[%o3+0x000]%asi,%l0	! %l0 = 000000000000d062
!	Mem[0000000021800140] = ffe879f0, %l1 = 0000000080583697, %asi = 80
	ldsha	[%o3+0x140]%asi,%l1	! %l1 = ffffffffffffffe8
!	%f4  = 779b1059, Mem[0000000030141400] = 000002aa
	sta	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 779b1059

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 47c0cd7bff000000
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000010181408] = 00ff00ff, %l5 = 00000000beaa9b49
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stba	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000010101410] = 43007b7f, %l4 = 5dcfe54dbc636d35
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000043
!	Mem[0000000030141408] = 00000000, %l3 = 000000000000ff4b
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081408] = 383637a90e116c60
	stxa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000000
!	%l4 = 0000000000000043, Mem[0000000010181400] = 97365880cb44e686
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000043
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141400] = 779b1059 00000000
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	Mem[0000000010101438] = e8eed8287d48674b, %l3 = 0000000000000000, %l7 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = e8eed8287d48674b
!	Mem[0000000030081408] = ff33ac0f, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff33ac0f

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000000e110000, %f4  = 779b1059 606c110e
	ldda	[%i0+%o5]0x81,%f4 	! %f4  = 00000000 0e110000
!	Mem[0000000020800000] = 57ffb870, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = 0000000000000057
!	Mem[0000000020800040] = 62ffbea0, %l6 = 2d2fd77845ee57e5, %asi = 80
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 00000000000062ff
!	Mem[0000000010181400] = 4300000000000000, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 4300000000000000
!	Mem[0000000010001418] = 230f3d2a 02c08653, %l4 = 00000043, %l5 = ff33ac0f, %asi = 80
	ldda	[%i0+0x018]%asi,%l4	! %l4 = 00000000230f3d2a 0000000002c08653
!	Mem[0000000030101408] = ff000000 00000000, %l0 = 0000d062, %l1 = ffffffe8
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1408] = 000000e2, %l0 = 00000000ff000000
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000e2
!	Mem[0000000030081410] = c40080ff000080ff, %l6 = 00000000000062ff
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = c40080ff000080ff
!	%f19 = 00004610, %f15 = 5f3cd449
	fcmpes	%fcc3,%f19,%f15		! %fcc3 = 1
!	Mem[0000000010081400] = ffffffe8, %l4 = 00000000230f3d2a
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l7 = e8eed8287d48674b, Mem[0000000010181436] = 45ee57e5
	sth	%l7,[%i6+0x036]		! Mem[0000000010181434] = 45ee674b
!	%l7 = e8eed8287d48674b, Mem[0000000010081408] = 00000000
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 7d48674b
!	%l2 = 4300000000000000, %l1 = 0000000000000000, %y  = ffffffff
	umul	%l2,%l1,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000030081408] = 000000ff, %l6 = c40080ff000080ff
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l1 = 0000000000000000, %l7 = e8eed8287d48674b, %l3 = 0000000000000057
	and	%l1,%l7,%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 000000e2, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = e8ffffff, %l5 = 0000000002c08653
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181408] = ff00ff006b214db3
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000030041410] = 8ef90000, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 000000008ef90000
!	Mem[0000000030081408] = ff0000ff, %l4 = 00000000ffffffff
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000ff0000ff

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 05711c07, %l0 = 000000008ef90000
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000007
!	Mem[0000000010101408] = 00000fac, %l2 = 4300000000000000
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ff00ff5e, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffff00ff5e
!	%f7  = 00000000, %f23 = bc636d35
	fsqrts	%f7 ,%f23		! %f23 = 00000000
!	Mem[0000000010141408] = 0000000000000035, %f20 = 00000000 7b060000
	ldda	[%i5+%o4]0x80,%f20	! %f20 = 00000000 00000035
!	Mem[0000000030041408] = 006177cb51a6c919, %f24 = 59428820 e8eed828
	ldda	[%i1+%o4]0x81,%f24	! %f24 = 006177cb 51a6c919
!	Mem[0000000010101410] = a93736387f7b00ff, %f10 = 19c9a651 cb776100
	ldda	[%i4+%o5]0x88,%f10	! %f10 = a9373638 7f7b00ff
!	%f28 = 953a460d 54000367, Mem[0000000010041410] = 0000067b f773c922
	stda	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 953a460d 54000367
!	%f6  = 69c50000, %f1  = 14115371, %f10 = a9373638
	fsubs	%f6 ,%f1 ,%f10		! %f10 = 69c50000
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l6 = 0000000000000000
	xor	%l3,%l3,%l6		! %l6 = 0000000000000000

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l0 = 00000007, %l1 = 00000000, Mem[0000000010141408] = 00000000 00000035
	std	%l0,[%i5+%o4]		! Mem[0000000010141408] = 00000007 00000000
!	%l1 = 0000000000000000, Mem[000000001004140c] = 00000000
	stb	%l1,[%i1+0x00c]		! Mem[000000001004140c] = 00000000
!	Mem[00000000300c1400] = 779b1059, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000077
!	%f20 = 00000000, Mem[0000000010141418] = 59428820
	st	%f20,[%i5+0x018]	! Mem[0000000010141418] = 00000000
!	Mem[0000000021800041] = 1869b930, %l4 = 00000000ff0000ff
	ldstub	[%o3+0x041],%l4		! %l4 = 0000000000000069
!	%f2  = f773c922 0000067b, Mem[0000000010141408] = 00000007 00000000, %asi = 80
	stda	%f2 ,[%i5+0x008]%asi	! Mem[0000000010141408] = f773c922 0000067b
!	%f31 = bc636d35, %f6  = 69c50000, %f26 = 1f204978
	fdivs	%f31,%f6 ,%f26		! %f26 = 9213c502
	membar	#Sync			! Added by membar checker (8)
!	%l2 = ff00ff5e, %l3 = 00000000, Mem[00000000100c1420] = 59428820 e8eed828, %asi = 80
	stda	%l2,[%i3+0x020]%asi	! Mem[00000000100c1420] = ff00ff5e 00000000
!	Mem[0000000030081410] = c40080ff, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 00000000c40080ff
!	%f4  = 00000000 0e110000, %l1 = 0000000000000077
!	Mem[0000000010141400] = 00000000bc636d35
	stda	%f4,[%i5+%l1]ASI_PST8_PL ! Mem[0000000010141400] = 0000110000000035

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000000000ff, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000007
	lduha	[%i4+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030001400] = 41fff98e05711c07, %f30 = 5dcfe54d bc636d35
	ldda	[%i0+%g0]0x89,%f30	! %f30 = 41fff98e 05711c07
!	Mem[0000000010141408] = f773c922, %l1 = 0000000000000077
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000f773c922
!	Mem[0000000010141428] = 0530bf165a77dd0f, %f16 = 43007b7f 50bf6453, %asi = 80
	ldda	[%i5+0x028]%asi,%f16	! %f16 = 0530bf16 5a77dd0f
!	Mem[0000000030141410] = fe000000, %l4 = 0000000000000069
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = fffffffffffffe00
!	%f4  = 00000000, %f26 = 9213c502, %f9  = 00000000
	fdivs	%f4 ,%f26,%f9 		! %f9  = 80000000
!	Mem[0000000010141400] = 00001100, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f2  = f773c922, %f20 = 00000000, %f7  = 00000000
	fsubs	%f2 ,%f20,%f7 		! %f7  = f773c922
!	Mem[0000000030081408] = ffffffff, %l4 = fffffffffffffe00
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l1 = 00000000f773c922, Mem[000000001010142b] = 51ca5502
	stb	%l1,[%i4+0x02b]		! Mem[0000000010101428] = 51ca5522
!	%l2 = ffffffffff00ff5e, Mem[0000000010141410] = 69c50000
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff00ff5e
!	%f14 = 1c808c11 5f3cd449, Mem[0000000010141400] = 00110000 35000000
	stda	%f14,[%i5+%g0]0x88	! Mem[0000000010141400] = 1c808c11 5f3cd449
!	Mem[0000000030101400] = 383637a9, %l0 = 000000000000ff00
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000a9
!	%f4  = 00000000 0e110000, Mem[0000000030041410] = 00000000 00000056
	stda	%f4 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 0e110000
!	%l4 = 000000ff, %l5 = c40080ff, Mem[0000000010101408] = 00000fac 392adb2b
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff c40080ff
!	Mem[0000000030141408] = 000000ff, %l1 = 00000000f773c922
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = ff00ff5e, %l3 = 00000000, Mem[0000000030101400] = 383637ff 48000000
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00ff5e 00000000
!	%l2 = ffffffffff00ff5e, Mem[00000000211c0000] = 000040d0, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff5e40d0

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 67030054, %l0 = 00000000000000a9
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 0000000067030054
!	%l1 = 00000000000000ff, immd = 000002cb, %y  = 00000000
	umul	%l1,0x2cb,%l0		! %l0 = 000000000002c835, %y = 00000000
!	Mem[0000000010001424] = 0000068f, %l0 = 000000000002c835, %asi = 80
	lduha	[%i0+0x024]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ff800000ff000000, %l1 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = ff800000ff000000
!	Mem[00000000211c0000] = ff5e40d0, %l5 = 00000000c40080ff
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[000000001014142c] = 5a77dd0f, %f20 = 00000000
	lda	[%i5+0x02c]%asi,%f20	! %f20 = 5a77dd0f
!	Mem[0000000010081400] = e8ffffff, %l2 = ffffffffff00ff5e
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = ffffffffe8ffffff
!	Mem[0000000010181424] = 45ee57e5, %f19 = 00004610
	lda	[%i6+0x024]%asi,%f19	! %f19 = 45ee57e5
!	Mem[0000000010081434] = 58b2a465, %l4 = 00000000000000ff, %asi = 80
	ldswa	[%i2+0x034]%asi,%l4	! %l4 = 0000000058b2a465

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = 22c973f7, %l0 = 0000000000000000, %asi = 80
	swapa	[%i0+0x02c]%asi,%l0	! %l0 = 0000000022c973f7
!	%l0 = 0000000022c973f7, Mem[0000000010181419] = 4f7d856a, %asi = 80
	stba	%l0,[%i6+0x019]%asi	! Mem[0000000010181418] = 4ff7856a
!	%f26 = 9213c502 07b46cc6, Mem[0000000010141408] = f773c922 0000067b
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 9213c502 07b46cc6
!	%l7 = e8eed8287d48674b, Mem[0000000030081408] = ffffffff
	stwa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 7d48674b
!	%f0  = 14115370 14115371, Mem[0000000010041410] = 67030054 0d463a95
	stda	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 14115370 14115371
!	%l6 = 0000000000000000, Mem[0000000030041408] = cb776100
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l3 = 0000000000000000, %l1 = ff800000ff000000, %y  = 00000000
	sdiv	%l3,%l1,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 22c973f7
!	Mem[0000000030141400] = 00000000, %l1 = ff800000ff000000
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f28 = 953a460d 54000367, %l2 = ffffffffe8ffffff
!	Mem[00000000100c1420] = ff00ff5e00000000
	add	%i3,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1420] = 670300540d463a95
!	%f9  = 80000000, Mem[0000000010181400] = 43000000
	sta	%f9 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 80000000

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 118c801c5eff00ff, %l7 = e8eed8287d48674b
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 118c801c5eff00ff
!	Mem[00000000300c1400] = 5364bf5059109bff, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 5364bf5059109bff
!	%l1 = 0000000000000000, Mem[00000000100c1422] = 67030054, %asi = 80
	stha	%l1,[%i3+0x022]%asi	! Mem[00000000100c1420] = 67030000
!	Mem[0000000030081410] = 000000ff, %l2 = ffffffffe8ffffff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 62d0a056, %f27 = 07b46cc6
	lda	[%i0+%o4]0x80,%f27	! %f27 = 62d0a056
!	Mem[0000000030081408] = 4b67487d, %l0 = 0000000022c973f7
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 000000004b67487d
!	Mem[0000000030041400] = 5364bf5071467b7f, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 5364bf5071467b7f
!	Mem[0000000010181400] = 8000000000000000, %l3 = 5364bf5059109bff
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = 8000000000000000
!	Mem[00000000201c0000] = 00ff2e40, %l1 = 0000000000000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l7 = 118c801c5eff00ff, Mem[0000000030041408] = 00000000
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%l4 = 5364bf5071467b7f, Mem[00000000100c1400] = 5364bf507f7b0043
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5364bf5071467b7f
!	Mem[0000000030041410] = 00000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l3 = 8000000000000000, Mem[0000000010001410] = 22c973f7
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00c973f7
!	%f1  = 14115371, Mem[0000000030141400] = ff000000
	sta	%f1 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 14115371
!	%l7 = 118c801c5eff00ff, Mem[0000000010181408] = 00000000
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 5eff00ff
!	%f8  = ffffffff, Mem[0000000010141410] = ff00ff5e
	sta	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%f30 = 41fff98e 05711c07, Mem[0000000010181410] = 0000110e 00000000
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = 41fff98e 05711c07
!	%f2  = f773c922 0000067b, %l0 = 000000004b67487d
!	Mem[0000000030081408] = 7d48674b32af5374
	add	%i2,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030081408] = 7b06674b22c973f7
!	Mem[000000001004140c] = 00000000, %l7 = 000000005eff00ff
	swap	[%i1+0x00c],%l7		! %l7 = 0000000000000000

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081432] = 7fee4464, %l5 = 0000000000000000
	ldsb	[%i2+0x032],%l5		! %l5 = 0000000000000044
!	Mem[0000000010081410] = e8ff00ff, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000e8
!	Mem[00000000100c1408] = e20000ff, %l6 = 00000000000000e8
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	%l6 = ffffffffffffffff, %l5 = 0000000000000044, %l3 = 8000000000000000
	andn	%l6,%l5,%l3		! %l3 = ffffffffffffffbb
!	Mem[0000000020800040] = 62ffbea0, %l4 = 5364bf5071467b7f
	ldub	[%o1+0x040],%l4		! %l4 = 0000000000000062
!	Mem[0000000010181408] = 5eff00ff, %l3 = ffffffffffffffbb
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 000000000000005e
!	%f10 = 69c50000 7f7b00ff, %f17 = 5a77dd0f
	fdtoi	%f10,%f17		! %f17 = 7fffffff
!	%f27 = 62d0a056, %f29 = 54000367, %f25 = 51a6c919
	fadds	%f27,%f29,%f25		! %f25 = 62d0a056
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l7  = 0000000000000000
	mulx	%l7,%l7,%l7		! %l7 = 0000000000000000
!	Mem[0000000030041408] = ff00000051a6c919, %l6 = ffffffffffffffff
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = ff00000051a6c919

p0_label_85:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000044
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010041400] = ff00ff5e
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ff5e
!	%l6 = ff00000051a6c919, %l1 = 00000000000000ff, %l0 = 000000004b67487d
	subc	%l6,%l1,%l0		! %l0 = ff00000051a6c81a
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = ff00000051a6c81a, Mem[0000000010141410] = ffffffff
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 1affffff
!	Mem[0000000010001400] = ff000000, %l6 = 0000000051a6c919
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010081408] = 4b67487d, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000004b67487d
!	Mem[0000000030181400] = 00000043, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000043
!	Mem[00000000300c1400] = 59109bff, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 0000000059109bff
!	%l7 = 0000000059109bff, Mem[0000000010101400] = ff000000ac0f0000
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000059109bff

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff0000e2, %l1 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ff0000e2
!	Mem[0000000030041400] = 7f7b467150bf6453, %l6 = 00000000ff000000
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = 7f7b467150bf6453
!	Mem[0000000030081408] = 4b67067b, %l2 = 0000000000000043
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 000000000000007b
!	Mem[0000000030001408] = 000000ff, %l6 = 7f7b467150bf6453
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 19c9a651, %l0 = ff00000051a6c81a
	ldsha	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffa651
!	Mem[00000000100c1410] = 0000067b000000ff, %l2 = 000000000000007b
	ldxa	[%i3+%o5]0x88,%l2	! %l2 = 0000067b000000ff
!	Mem[000000001014142a] = 0530bf16, %l4 = 0000000000000062
	ldub	[%i5+0x02a],%l4		! %l4 = 00000000000000bf
!	Mem[0000000010081400] = ffffffe8, %l4 = 00000000000000bf
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041400] = 71467b7f, %l0 = ffffffffffffa651
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 000000000000007f
!	Mem[000000001014143e] = 392adb2b, %l1 = 00000000ff0000e2, %asi = 80
	lduha	[%i5+0x03e]%asi,%l1	! %l1 = 000000000000db2b

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff9b1059, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff9b1059
!	%l7 = 0000000059109bff, Mem[00000000300c1410] = 43007b7f
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff007b7f
!	Mem[0000000010081400] = ffffffe8, %l0 = 000000000000007f
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	%l2 = 0000067b000000ff, Mem[0000000030181408] = a900000040bf6de7
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000067b000000ff
!	Mem[0000000010041410] = 14115370, %l3 = 000000000000005e
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 0000000014115370
!	%l6 = 00000000ff9b1059, Mem[0000000030141408] = 00000000000000ff
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000ff9b1059
!	Mem[0000000030001400] = 05711c07, %l3 = 0000000014115370
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000007
!	%l2 = 0000067b000000ff, Mem[0000000010001408] = 62d0a056ac0f00ff
	stx	%l2,[%i0+%o4]		! Mem[0000000010001408] = 0000067b000000ff
!	%l3 = 0000000000000007, Mem[00000000211c0000] = ff5e40d0
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 000740d0
!	%l0 = ffffffffffffffff, Mem[00000000100c1408] = ff0000e2, %asi = 80
	stwa	%l0,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffff

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000067b, %l0 = ffffffffffffffff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 000000000000067b
!	Mem[0000000021800040] = 18ffb930, %l1 = 000000000000db2b
	lduh	[%o3+0x040],%l1		! %l1 = 00000000000018ff
!	Mem[0000000010101428] = 51ca55226d6177cb, %l7 = 0000000059109bff
	ldx	[%i4+0x028],%l7		! %l7 = 51ca55226d6177cb
!	Mem[0000000030181400] = 000000ff, %l6 = 00000000ff9b1059
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = ff000000467f42a7, %f8  = ffffffff 80000000
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = ff000000 467f42a7
!	Mem[0000000030141400] = 14115371, %l2 = 0000067b000000ff
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000014
!	Mem[0000000010041410] = 0000005e, %l1 = 00000000000018ff
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 000000000000005e
!	Mem[0000000030181400] = ff000000 41fff98e, %l2 = 00000014, %l3 = 00000007
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000ff000000 0000000041fff98e
!	Mem[0000000010141400] = 49d43c5f, %l0 = 000000000000067b
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = 00000000000049d4
!	Mem[0000000010141420] = 5364eb18, %l2 = 00000000ff000000, %asi = 80
	lduha	[%i5+0x020]%asi,%l2	! %l2 = 0000000000005364

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000005e, Mem[0000000030041408] = 19c9a651000000ff
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000005e
!	%l6 = 000000ff, %l7 = 6d6177cb, Mem[0000000010101408] = 00000000 c40080ff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 6d6177cb
!	Mem[0000000030141400] = 14115371 00000000 59109bff 00000000
!	%f0  = 14115370 14115371 f773c922 0000067b
!	%f4  = 00000000 0e110000 69c50000 f773c922
!	%f8  = ff000000 467f42a7 69c50000 7f7b00ff
!	%f12 = ff800000 ff00ffe8 1c808c11 5f3cd449
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l4 = 000000000000ffff, Mem[00000000300c1408] = 00000000
	stba	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[00000000100c1408] = ffffffff, %l1 = 000000000000005e
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 7f7b4671 50bf6453 ffffffff 00004610
!	%f16 = 0530bf16 7fffffff 000000e2 45ee57e5
!	%f20 = 5a77dd0f 00000035 5dcfe54d 00000000
!	%f24 = 006177cb 62d0a056 9213c502 62d0a056
!	%f28 = 953a460d 54000367 41fff98e 05711c07
	stda	%f16,[%i3+%g0]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%f18 = 000000e2, Mem[0000000010141410] = 1affffff
	sta	%f18,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000e2
!	Mem[0000000010001410] = 00c973f7, %l2 = 0000000000005364
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000211c0001] = 000740d0, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 000040d0
!	Mem[0000000010181408] = 5eff00ff, %l3 = 0000000041fff98e
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 000000005eff00ff

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 715311145e000000, %f6  = 69c50000 f773c922
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = 71531114 5e000000
	membar	#Sync			! Added by membar checker (9)
!	Mem[000000001014140f] = 07b46cc6, %l1 = 00000000000000ff
	ldub	[%i5+0x00f],%l1		! %l1 = 00000000000000c6
!	%f2  = f773c922, %f1  = 14115371, %f10 = 69c50000
	fdivs	%f2 ,%f1 ,%f10		! %f10 = ff800000
!	Mem[00000000300c1400] = 5364bf5000000000, %l1 = 00000000000000c6
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = 5364bf5000000000
!	Mem[0000000030001408] = 000000ff, %l0 = 00000000000049d4
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l4 = 000000000000ffff
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l1 = 5364bf5000000000
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 0e116c60, %l6 = 00000000000000ff
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 000000000000000e
!	Mem[0000000030181408] = 7b060000, %l5 = 000000004b67487d
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 000000007b060000
!	Mem[00000000100c1400] = ffffff7f, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffff7f

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 7b060000, %l7 = 51ca55226d6177cb
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 41fff98e, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000041
!	%f16 = 0530bf16 7fffffff, Mem[0000000010041408] = f773c922 5eff00ff, %asi = 80
	stda	%f16,[%i1+0x008]%asi	! Mem[0000000010041408] = 0530bf16 7fffffff
!	%l2 = 0000000000000000, Mem[0000000010101437] = 5d6e1e25, %asi = 80
	stba	%l2,[%i4+0x037]%asi	! Mem[0000000010101434] = 5d6e1e00
!	Mem[0000000010001408] = 0000067b, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x008]%asi,%l0	! %l0 = 000000000000067b
!	Mem[0000000030041400] = 71467b7f, %l6 = 000000000000000e
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 000000000000007f
!	%l5 = 000000007b060000, Mem[00000000201c0000] = 00ff2e40, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00002e40
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000000041
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010141400] = 49d43c5f, %asi = 80
	stwa	%l1,[%i5+0x000]%asi	! Mem[0000000010141400] = ffffffff
!	%l6 = 000000000000007f, Mem[0000000030041410] = 000000ff
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 007f00ff

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000ff5e, %l6 = 000000000000007f
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ff5e
!	Mem[0000000030141408] = 0000067b, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 000000000000067b
!	Mem[00000000100c143e] = 8ef9ff41, %l4 = ffffffffffffff7f, %asi = 80
	lduha	[%i3+0x03e]%asi,%l4	! %l4 = 000000000000ff41
!	Mem[0000000010041408] = 0530bf167fffffff, %l2 = 000000000000067b
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 0530bf167fffffff
!	Mem[0000000030101400] = 5eff00ff 00000000, %l6 = 0000ff5e, %l7 = 000000ff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000005eff00ff 0000000000000000
!	Mem[0000000030001408] = ff000000, %l6 = 000000005eff00ff
	lduwa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041408] = 5e00000000000000, %l0 = 000000000000067b
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 5e00000000000000
!	Mem[0000000010181408] = 8ef9ffff, %l4 = 000000000000ff41
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 51a6c919 0000d828, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000051a6c919 000000000000d828
!	%l4 = 00000000000000ff, imm = fffffffffffff128, %l1 = 000000000000d828
	sub	%l4,-0xed8,%l1		! %l1 = 0000000000000fd7

p0_label_93:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 619472
p0_fragment_9:
!	%l0 = 0000000051a6c919
	setx	0xf5fb683f1878a9a6,%g7,%l0 ! %l0 = f5fb683f1878a9a6
!	%l1 = 0000000000000fd7
	setx	0x477334579b9625d1,%g7,%l1 ! %l1 = 477334579b9625d1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f5fb683f1878a9a6
	setx	0x1465919d1f0e860c,%g7,%l0 ! %l0 = 1465919d1f0e860c
!	%l1 = 477334579b9625d1
	setx	0x0406fccaf8c9cd57,%g7,%l1 ! %l1 = 0406fccaf8c9cd57
p0_fragment_9_end:
!	Mem[000000001004142c] = 6fdbff8f, %l3 = 000000005eff00ff, %asi = 80
	lduwa	[%i1+0x02c]%asi,%l3	! %l3 = 000000006fdbff8f
!	%l6 = 00000000ff000000, imm = 0000000000000c2d, %l2 = 0530bf167fffffff
	orn	%l6,0xc2d,%l2		! %l2 = fffffffffffff3d2
!	%l5 = 000000007b060000, Mem[0000000030001408] = 000000ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l3 = 000000006fdbff8f, Mem[0000000010101400] = 000000ff
	stba	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 8f0000ff
!	%f10 = ff800000 7f7b00ff, Mem[0000000010041410] = 5e000000 71531114
	stda	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = ff800000 7f7b00ff
!	%l6 = ff000000, %l7 = 00000000, Mem[00000000300c1410] = 7f7b00ff 10460000
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000 00000000
!	%l3 = 000000006fdbff8f, Mem[0000000030101408] = 00000000000000ff
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000006fdbff8f
!	%l3 = 000000006fdbff8f, Mem[0000000030101400] = 00000000ff00ff5e
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000006fdbff8f
!	%l4 = 00000000000000ff, Mem[000000001008141f] = 0e11ff60, %asi = 80
	stba	%l4,[%i2+0x01f]%asi	! Mem[000000001008141c] = 0e11ffff

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 8f0000ff00000000, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = 8f0000ff00000000
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010181400] = 80000000 00000000 fffff98e 00000000
!	Mem[0000000010181410] = 41fff98e 05711c07 4ff7856a 080b8593
!	Mem[0000000010181420] = 2d2fd778 45ee57e5 7b95f676 524e1aef
!	Mem[0000000010181430] = 4f010de4 45ee674b 00000fac ff0000ff
	ldda	[%i6+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010081410] = 000011ffff00ffe8, %f0  = 14115370 14115371
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = 000011ff ff00ffe8
!	Mem[0000000030181400] = ff000000, %l1 = 0406fccaf8c9cd57
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081400] = 0e116c60, %l2 = fffffffffffff3d2
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = 000000000000000e
!	%l6 = 00000000ff000000, imm = 0000000000000a26, %l0 = 1465919d1f0e860c
	xor	%l6,0xa26,%l0		! %l0 = 00000000ff000a26
!	Mem[0000000010101414] = 383637a9, %f13 = ff00ffe8
	ld	[%i4+0x014],%f13	! %f13 = 383637a9
!	Mem[0000000030101400] = 8fffdb6f00000000, %f10 = ff800000 7f7b00ff
	ldda	[%i4+%g0]0x81,%f10	! %f10 = 8fffdb6f 00000000
!	Mem[0000000010001408] = ff000000, %l0 = 00000000ff000a26
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff00008f, %f10 = 8fffdb6f
	lda	[%i4+%g0]0x88,%f10	! %f10 = ff00008f

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 4ff7856a080b8593, %l0 = 0000000000000000
	ldx	[%i6+0x018],%l0		! %l0 = 4ff7856a080b8593
	membar	#Sync			! Added by membar checker (11)
!	%l4 = 00000000000000ff, Mem[0000000010181400] = 8000000000000000, %asi = 80
	stxa	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030181408] = ff0000007b0600ff
	stxa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001438] = bf50c9226d6177cb, %asi = 80
	stxa	%l4,[%i0+0x038]%asi	! Mem[0000000010001438] = 00000000000000ff
!	%f30 = 00000fac ff0000ff, %l7 = 8f0000ff00000000
!	Mem[0000000010141428] = 0530bf165a77dd0f
	add	%i5,0x028,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010141428] = 0530bf165a77dd0f
!	Mem[0000000030041410] = ff007f00, %l1 = 00000000ff000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000ff007f00
!	%f20 = 41fff98e 05711c07, Mem[0000000010081400] = ffffffe8 4c97735f
	stda	%f20,[%i2+%g0]0x80	! Mem[0000000010081400] = 41fff98e 05711c07
!	Mem[000000001008140e] = 00000000, %l5 = 000000007b060000
	ldstub	[%i2+0x00e],%l5		! %l5 = 0000000000000000
!	%l7 = 8f0000ff00000000, Mem[0000000030141400] = 14115371
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l0 = 4ff7856a080b8593, Mem[0000000010101410] = ff007b7f383637a9
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 4ff7856a080b8593

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 71467bff, %f15 = 5f3cd449
	lda	[%i1+%g0]0x89,%f15	! %f15 = 71467bff
!	Mem[0000000010181408] = fffff98e, %l2 = 000000000000000e
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000fffff98e
!	%f13 = 383637a9, %f5  = 0e110000, %f2  = f773c922
	fsubs	%f13,%f5 ,%f2 		! %f2  = 383637a9
!	Mem[0000000021800081] = 4eaeaf60, %l7 = 8f0000ff00000000, %asi = 80
	ldsba	[%o3+0x081]%asi,%l7	! %l7 = ffffffffffffffae
!	Mem[0000000030081408] = 7b06674b, %l7 = ffffffffffffffae
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = 000000007b06674b
!	Mem[0000000010001408] = ff000000, %f1  = ff00ffe8
	lda	[%i0+%o4]0x88,%f1 	! %f1 = ff000000
!	Mem[0000000030041410] = ff000000, %l0 = 4ff7856a080b8593
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141439] = 0a356fff, %l0 = 0000000000000000
	ldub	[%i5+0x039],%l0		! %l0 = 0000000000000035
!	Mem[0000000010181410] = 41fff98e05711c07, %f18 = fffff98e 00000000
	ldda	[%i6+%o5]0x80,%f18	! %f18 = 41fff98e 05711c07
!	Mem[0000000010141408] = c66cb407 02c51392, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000002c51392 00000000c66cb407

p0_label_97:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000035
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l7 = 000000007b06674b, Mem[0000000010041436] = 7892af85
	sth	%l7,[%i1+0x036]		! Mem[0000000010041434] = 7892674b
!	Mem[0000000010001400] = 51a6c919, %l5 = 00000000c66cb407
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000051a6c919
!	%l6 = 00000000ff000000, Mem[0000000030181410] = 4de5cf5d
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 4de50000
!	Mem[0000000010141410] = 000000e2, %l5 = 0000000051a6c919
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000e2
!	%f0  = 000011ff ff000000, %l6 = 00000000ff000000
!	Mem[0000000030001400] = ff1c71058ef9ff41
	stda	%f0,[%i0+%l6]ASI_PST8_SL ! Mem[0000000030001400] = ff1c71058ef9ff41
!	%l6 = 00000000ff000000, Mem[0000000010181410] = 8ef9ff41
	stwa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000
!	%f0  = 000011ff ff000000, Mem[0000000030041400] = ff7b4671 50bf6453
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 000011ff ff000000
!	Mem[00000000211c0000] = 000040d0, %l3 = 000000006fdbff8f
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = e8ff00ff, %l6 = 00000000ff000000
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000e8

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffff00ff, %l3 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 000000000000ffff
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030001400] = ff1c7105 8ef9ff41 00000000 467f42a7
!	Mem[0000000030001410] = 00000000 0e110000 7146e348 242a2939
!	Mem[0000000030001420] = 40087d68 5f2e86d9 57204fe6 3220689f
!	Mem[0000000030001430] = 4e95d6d4 6815a715 119799b2 3487fbbb
	ldda	[%i0+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030001400
!	Mem[0000000030101408] = 8fffdb6f 00000000, %l0 = 00000000, %l1 = ff007f00
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 000000008fffdb6f 0000000000000000
!	Mem[00000000100c1408] = e557ee45, %l2 = 00000000fffff98e
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000e5
!	Mem[0000000010101400] = 8f0000ff00000000, %f24 = 2d2fd778 45ee57e5
	ldda	[%i4+%g0]0x80,%f24	! %f24 = 8f0000ff 00000000
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000000000e5
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 00000000000000e2, immd = fffffffffffffab3, %l3  = 000000000000ffff
	mulx	%l5,-0x54d,%l3		! %l3 = fffffffffffb5206
!	Mem[00000000300c1410] = ff000000, %l0 = 000000008fffdb6f
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 35000000, %l2 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 0000000035000000
!	Mem[000000001018142e] = 524e1aef, %l7 = 000000007b06674b
	ldub	[%i6+0x02e],%l7		! %l7 = 000000000000001a

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffb5206, Mem[00000000300c1408] = 00000041
	stwa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = fffb5206
!	%l6 = 00000000000000e8, Mem[00000000100c1410] = 5a77dd0f00000035
	stxa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000e8
!	%l3 = fffffffffffb5206, Mem[0000000030041410] = 000000ff
	stha	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 520600ff
!	%f4  = 00000000 0e110000, Mem[0000000010141400] = ffffffff 1c808c11
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 0e110000
!	Mem[0000000010181424] = 45ee57e5, %l1 = 0000000000000000, %asi = 80
	swapa	[%i6+0x024]%asi,%l1	! %l1 = 0000000045ee57e5
!	%l4 = 0000000002c51392, Mem[0000000030181400] = 000000ff
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00001392
!	%l7 = 000000000000001a, imm = 0000000000000782, %l5 = 00000000000000e2
	or	%l7,0x782,%l5		! %l5 = 000000000000079a
!	Mem[0000000030101410] = 00000000, %l4 = 0000000002c51392
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000000, immd = 00000000000003f0, %l108 = 0000000000000002
	sdivx	%l0,0x3f0,%l2		! %l2 = 0000000000000000
!	%l6 = 00000000000000e8, Mem[0000000010101410] = 93850b086a85f74f
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000e8

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 45ee57e5, %l2 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = 0000000045ee57e5
!	Mem[0000000030181400] = 00001392, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000001392
!	Mem[0000000030181400] = 00001392, %l0 = 0000000000001392
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000001392
!	Mem[0000000030041410] = 0000110eff000652, %f16 = 80000000 00000000
	ldda	[%i1+%o5]0x89,%f16	! %f16 = 0000110e ff000652
!	Mem[0000000010141400] = 0000110e, %l2 = 0000000045ee57e5
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l0 = 0000000000001392
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000021800000] = d0623f00, %l0 = ffffffffffffff00
	lduh	[%o3+%g0],%l0		! %l0 = 000000000000d062
!	Mem[0000000030001410] = 00000000, %f16 = 0000110e
	lda	[%i0+%o5]0x89,%f16	! %f16 = 00000000
!	Mem[0000000030101408] = 6fdbff8f, %l1 = 0000000045ee57e5
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 000000000000008f
!	Mem[0000000010041410] = 7f7b00ff, %l4 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 000000007f7b00ff

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000e8, Mem[00000000100c1410] = e8000000
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = e8000000
!	%l0 = 000000000000d062, Mem[0000000030181408] = ff000000
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 62000000
!	%l4 = 000000007f7b00ff, Mem[00000000211c0001] = ff0040d0, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff40d0
!	Mem[0000000030141400] = 00000000, %l5 = 000000000000079a
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 7f7b00ff, %l0 = 000000000000d062
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = 000000ff, %l4 = 000000007f7b00ff
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 0e116c60, %l3 = fffffffffffb5206
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000000000000e
!	%f12 = 4e95d6d4 6815a715, Mem[0000000030181400] = 00001392 8ef9ff41
	stda	%f12,[%i6+%g0]0x89	! Mem[0000000030181400] = 4e95d6d4 6815a715
!	%f0  = ff1c7105, %f13 = 6815a715, %f24 = 8f0000ff
	fsubs	%f0 ,%f13,%f24		! %f24 = ff1c7105
!	%l0 = 000000ff, %l1 = 0000008f, Mem[0000000010181410] = ff007b7f 071c7105
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 0000008f

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0530bf16, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 000000000530bf16
!	Mem[0000000030181408] = 0000000000000062, %f28 = 4f010de4 45ee674b
	ldda	[%i6+%o4]0x89,%f28	! %f28 = 00000000 00000062
!	Mem[0000000030101408] = 8fffdb6f00000000, %l0 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 8fffdb6f00000000
!	Mem[0000000030001410] = 0000110e 00000000, %l0 = 00000000, %l1 = 0000008f
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000 000000000000110e
!	Mem[0000000010081408] = 000000ff, %f18 = 41fff98e
	lda	[%i2+%o4]0x88,%f18	! %f18 = 000000ff
!	Mem[0000000010001410] = ffc973f7, %l0 = 0000000000000000
	ldsw	[%i0+%o5],%l0		! %l0 = ffffffffffc973f7
!	Mem[0000000030141408] = 0000067b, %l4 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = 000000000000067b
!	Mem[0000000010081438] = 382affc2, %l4 = 000000000000067b
	lduh	[%i2+0x038],%l4		! %l4 = 000000000000382a
!	Mem[00000000100c1406] = 16bf3005, %l3 = 000000000000000e
	ldub	[%i3+0x006],%l3		! %l3 = 0000000000000030
!	Mem[0000000021800140] = ffe879f0, %l0 = ffffffffffc973f7, %asi = 80
	lduha	[%o3+0x140]%asi,%l0	! %l0 = 000000000000ffe8

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000530bf16, Mem[0000000030101400] = 8fffdb6f
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 16ffdb6f
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ffff40d0
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 000040d0
!	%l6 = 00000000000000e8, Mem[0000000030181408] = 6200000000000000
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000e8
!	Mem[000000001004141b] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+0x01b]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l0 = 000000000000ffe8
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 0000079a, %l7 = 000000000000001a
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010101400] = 00000000ff00008f
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%f28 = 00000000 00000062, Mem[0000000030141410] = 0000110e 00000000
	stda	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000062
!	%f8  = 40087d68, %f30 = 00000fac, %f30 = 00000fac
	fdivs	%f8 ,%f30,%f30		! tt=0x22, %l0 = 0000000000000022
!	Mem[0000000030001408] = e8ff0000, %l4 = 000000000000382a
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff000000ff, %l1 = 000000000000110e
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101410] = 000000ff, %f12 = 4e95d6d4
	lda	[%i4+%o5]0x89,%f12	! %f12 = 000000ff
!	Mem[00000000100c1400] = ffffff7f16bf3005, %l0 = 0000000000000022
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = ffffff7f16bf3005
!	Mem[00000000100c1410] = 00000000000000e8, %f4  = 00000000 0e110000
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 00000000 000000e8
!	Mem[00000000201c0001] = 00002e40, %l1 = 000000ff000000ff, %asi = 80
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 779b1059 606c11ff, %l6 = 000000e8, %l7 = 00000000
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000606c11ff 00000000779b1059
!	Mem[00000000201c0000] = 00002e40, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c142c] = 02c51392, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x02c]%asi,%l2	! %l2 = 00000000000002c5
!	Mem[0000000030001408] = ff00ffe8467f42a7, %f10 = 57204fe6 3220689f
	ldda	[%i0+%o4]0x81,%f10	! %f10 = ff00ffe8 467f42a7
!	Mem[00000000100c1408] = 45ee57e5, %l0 = ffffff7f16bf3005
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 00000000000057e5

p0_label_105:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 9a0700ff, %l2 = 00000000000002c5
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 000000009a0700ff
!	%l3 = 0000000000000030, %l2 = 000000009a0700ff, %l1 = 0000000000000000
	subc	%l3,%l2,%l1		! %l1 = ffffffff65f8ff31
!	%f14 = 119799b2 3487fbbb, %l3 = 0000000000000030
!	Mem[0000000030141408] = 7b06000022c973f7
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_S ! Mem[0000000030141408] = 7b0699b222c973f7
!	Mem[00000000100c1408] = 45ee57e5, %l5 = 000000000530bf16
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 0000000045ee57e5
!	%l4 = 00000000, %l5 = 45ee57e5, Mem[0000000010141410] = 51a6c919 6a850000
	std	%l4,[%i5+%o5]		! Mem[0000000010141410] = 00000000 45ee57e5
!	%l4 = 0000000000000000, Mem[000000001000140a] = 000000ff
	sth	%l4,[%i0+0x00a]		! Mem[0000000010001408] = 00000000
!	%l0 = 00000000000057e5, Mem[0000000010101410] = 000000e8
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 000057e5
!	Mem[0000000010141408] = 9213c502, %l3 = 0000000000000030
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 000000009213c502
!	Mem[00000000100c1400] = ffffff7f, %l6 = 00000000606c11ff
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 9a0700ff, %l3 = 9213c502, Mem[0000000010181408] = 8ef9ffff 00000000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 9a0700ff 9213c502

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff800000 7f7b00ff, %l0 = 000057e5, %l1 = 65f8ff31
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000007f7b00ff 00000000ff800000
!	Mem[0000000030001408] = ff00ffe8, %l0 = 000000007f7b00ff
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	%l7 = 00000000779b1059, %l5 = 0000000045ee57e5, %l5 = 0000000045ee57e5
	subc	%l7,%l5,%l5		! %l5 = 0000000031acb874
!	Mem[0000000030081400] = ff116c60, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffff11
!	Mem[0000000010181430] = 4f010de445ee674b, %f24 = ff1c7105 00000000
	ldd	[%i6+0x030],%f24	! %f24 = 4f010de4 45ee674b
!	Mem[0000000010181410] = ff000000, %f12 = 000000ff
	lda	[%i6+0x010]%asi,%f12	! %f12 = ff000000
!	Mem[0000000021800140] = ffe879f0, %l5 = 0000000031acb874, %asi = 80
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 000000000000ffe8
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030081400] = ff116c60 59109b77 7b06674b 22c973f7
!	Mem[0000000030081410] = 000000ff 000080ff 029ec69a 29854403
!	Mem[0000000030081420] = 7158d628 698f0499 00753ea6 539d645f
!	Mem[0000000030081430] = 55ae8b94 663390d5 2060c472 4dd2c37b
	ldda	[%i2+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000010101410] = e557000000000000, %l4 = ffffffffffffff11
	ldxa	[%i4+%o5]0x80,%l4	! %l4 = e557000000000000
!	%l5 = 000000000000ffe8, Mem[0000000010001438] = 00000000, %asi = 80
	stha	%l5,[%i0+0x038]%asi	! Mem[0000000010001438] = ffe80000

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = c66cb407, %l1 = 00000000ff800000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000c6
!	%l7 = 00000000779b1059, Mem[00000000300c1408] = 0652fbff
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 5952fbff
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000c6
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f1  = 8ef9ff41, Mem[000000001000143c] = 000000ff
	sta	%f1 ,[%i0+0x03c]%asi	! Mem[000000001000143c] = 8ef9ff41
!	%f4  = 00000000 000000e8, Mem[0000000010001418] = 230f3d2a 02c08653, %asi = 80
	stda	%f4 ,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 000000e8
!	%f16 = 779b1059 606c11ff, %l3 = 000000009213c502
!	Mem[0000000030181400] = 15a71568d4d6954e
	stda	%f16,[%i6+%l3]ASI_PST16_SL ! Mem[0000000030181400] = 15a76c60d4d6954e
!	%l5 = 000000000000ffe8, Mem[0000000010101420] = 0000ff00
	stw	%l5,[%i4+0x020]		! Mem[0000000010101420] = 0000ffe8
!	Mem[0000000010041410] = ff007b7f, %l3 = 000000009213c502
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f2  = 00000000, Mem[0000000030041408] = 5e000000
	sta	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 4eaeaf60, %l6 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x080]%asi,%l6	! %l6 = 0000000000004eae
!	Mem[0000000030141400] = c5020000 70531114, %l6 = 00004eae, %l7 = 779b1059
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000c5020000 0000000070531114
!	Mem[0000000020800000] = 57ffb870, %l7 = 0000000070531114
	ldsh	[%o1+%g0],%l7		! %l7 = 00000000000057ff
!	Mem[0000000030081400] = 606c11ff, %f13 = 6815a715
	lda	[%i2+%g0]0x89,%f13	! %f13 = 606c11ff
!	Mem[0000000030181408] = e8000000 00000000, %l4 = 00000000, %l5 = 0000ffe8
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000e8000000
!	Mem[0000000030001410] = c6000000, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[000000001010140f] = 6d6177cb, %l6 = 00000000c5020000, %asi = 80
	lduba	[%i4+0x00f]%asi,%l6	! %l6 = 00000000000000cb
!	Mem[0000000010001400] = 07b46cff, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l2 = 000000009a0700ff
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181422] = 2d2fd778, %l1 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x022]%asi,%l1	! %l1 = ffffffffffffd778

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000e8000000, %l7 = 00000000000057ff, %l5 = 00000000e8000000
	addc	%l5,%l7,%l5		! %l5 = 00000000e80057ff
	membar	#Sync			! Added by membar checker (14)
!	%l1 = ffffffffffffd778, Mem[0000000030081408] = 7b06674b
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 7806674b
!	%l2 = 0000000000000000, Mem[0000000010041408] = ffffff7f16bf3005
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l3 = 00000000000000ff
	swap	[%i2+%o4],%l3		! %l3 = 00000000ff000000
!	%l7 = 00000000000057ff, Mem[0000000030101400] = 16ffdb6f
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffdb6f
!	Mem[0000000010081410] = ff00ffff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000e80057ff, Mem[0000000010081430] = 7fee446458b2a465, %asi = 80
	stxa	%l5,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000e80057ff
!	%l6 = 00000000000000cb, Mem[0000000010081430] = 00000000e80057ff, %asi = 80
	stxa	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000000000cb
!	%l1 = ffffffffffffd778, Mem[0000000010181408] = 9a0700ff
	stha	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 9a07d778
!	Mem[000000001000143a] = ffe80000, %l3 = 00000000ff000000
	ldstuba	[%i0+0x03a]%asi,%l3	! %l3 = 0000000000000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 7b0699b2, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 000000007b0699b2
!	%f19 = 4b67067b, %f15 = 3487fbbb
	fcmps	%fcc1,%f19,%f15		! %fcc1 = 2
!	Mem[0000000010141408] = 30000000, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ff0000008f000000, %l1 = ffffffffffffd778
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ff0000008f000000
!	Mem[0000000010101408] = ff0000ff, %f0  = ff1c7105
	lda	[%i4+%o4]0x80,%f0 	! %f0 = ff0000ff
!	Mem[0000000030081408] = f773c9224b670678, %l1 = ff0000008f000000
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = f773c9224b670678
!	Mem[0000000030181400] = 606ca715, %l1 = f773c9224b670678
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000015
!	Mem[0000000010101408] = ff0000ff6d6177cb, %f28 = d5903366 948bae55
	ldda	[%i4+%o4]0x80,%f28	! %f28 = ff0000ff 6d6177cb
!	Mem[00000000300c1408] = fffb5259, %l6 = 00000000000000cb
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000059
!	%l1 = 0000000000000015, %l0 = ffffffffffffff00, %l7 = 00000000000057ff
	sub	%l1,%l0,%l7		! %l7 = 0000000000000115

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, immd = 00000eea, %y  = 22c973f7
	sdiv	%l2,0xeea,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = ffffff00
!	Code Fragment 3, seed = 343699
p0_fragment_10:
!	%l0 = ffffffffffffff00
	setx	0x0e31f5115dcf868e,%g7,%l0 ! %l0 = 0e31f5115dcf868e
!	%l1 = 0000000000000015
	setx	0x16824a02d0268e39,%g7,%l1 ! %l1 = 16824a02d0268e39
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0e31f5115dcf868e
	setx	0x343a7ee9c528a1f4,%g7,%l0 ! %l0 = 343a7ee9c528a1f4
!	%l1 = 16824a02d0268e39
	setx	0x704be20462e544bf,%g7,%l1 ! %l1 = 704be20462e544bf
p0_fragment_10_end:
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f30 = 7bc3d24d 72c46020, %l6 = 0000000000000059
!	Mem[0000000010041400] = 0000ff5e1c808c11
	stda	%f30,[%i1+%l6]ASI_PST32_PL ! Mem[0000000010041400] = 2060c4721c808c11
!	%l2 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000010181408] = 9a07d778, %l4 = 000000007b0699b2
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000078
!	%l4 = 0000000000000078, Mem[0000000010041400] = 2060c472
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 7860c472
!	%l5 = 00000000e80057ff, Mem[0000000030141410] = 00000000
	stwa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = e80057ff
!	Mem[0000000010001400] = ff6cb407 0000d828 00000000 000000ff
!	%f0  = ff0000ff 8ef9ff41 00000000 467f42a7
!	%f4  = 00000000 000000e8 7146e348 242a2939
!	%f8  = 40087d68 5f2e86d9 ff00ffe8 467f42a7
!	%f12 = ff000000 606c11ff 119799b2 3487fbbb
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[00000000100c1424] = cb776100, %l0 = 343a7ee9c528a1f4
	ldstub	[%i3+0x024],%l0		! %l0 = 00000000000000cb

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000e54d bc636d35, %l4 = 00000078, %l5 = e80057ff
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 000000000000e54d 00000000bc636d35
!	Mem[0000000010101408] = ff0000ff6d6177cb, %l4 = 000000000000e54d
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = ff0000ff6d6177cb
!	Mem[0000000010081408] = 000000ff0000ff00, %l4 = ff0000ff6d6177cb
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = 000000ff0000ff00
!	Mem[0000000030101410] = ff000000, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141400] = 000000000e110000, %l1 = 704be20462e544bf
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 000000000e110000
!	Mem[0000000020800000] = 57ffb870, %l0 = 00000000000000cb
	ldsh	[%o1+%g0],%l0		! %l0 = 00000000000057ff
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000059
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = f773c922 4b670678, %l2 = ff000000, %l3 = 00000000
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 000000004b670678 00000000f773c922
!	Mem[0000000030141410] = e80057ff, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = 000011ffff00ffff, %l4 = 000000ff0000ff00
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 000011ffff00ffff

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000bc636d35, Mem[0000000010081400] = 41fff98e
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 35fff98e
!	%l1 = 000000000e110000, Mem[0000000030141400] = 000002c5
	stwa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0e110000
!	%l7 = 000000007fffffff, Mem[0000000030001400] = 05711cff
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 05711cff
!	%l4 = 000011ffff00ffff, Mem[0000000010001410] = 000000e8
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%f14 = 119799b2 3487fbbb, Mem[0000000030141408] = 7b0699b2 22c973f7
	stda	%f14,[%i5+%o4]0x81	! Mem[0000000030141408] = 119799b2 3487fbbb
!	Code Fragment 4, seed = 537958
p0_fragment_11:
!	%l0 = 00000000000057ff
	setx	0x4f5758120c2612f6,%g7,%l0 ! %l0 = 4f5758120c2612f6
!	%l1 = 000000000e110000
	setx	0x84a6cd83dafd8e21,%g7,%l1 ! %l1 = 84a6cd83dafd8e21
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4f5758120c2612f6
	setx	0x861e8796e43bbd5c,%g7,%l0 ! %l0 = 861e8796e43bbd5c
!	%l1 = 84a6cd83dafd8e21
	setx	0xf420e8e3283fa3a7,%g7,%l1 ! %l1 = f420e8e3283fa3a7
p0_fragment_11_end:
!	Mem[0000000010081408] = ff000000, %l2 = 000000004b670678
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	%l5 = 00000000bc636d35, Mem[00000000100c1404] = 16bf3005, %asi = 80
	stha	%l5,[%i3+0x004]%asi	! Mem[00000000100c1404] = 6d353005
!	%l5 = 00000000bc636d35, Mem[00000000218001c0] = 6e60c250
	sth	%l5,[%o3+0x1c0]		! Mem[00000000218001c0] = 6d35c250

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = a7427f46e8ff00ff, %l1 = f420e8e3283fa3a7
	ldxa	[%i0+%o4]0x89,%l1	! %l1 = a7427f46e8ff00ff
!	Mem[00000000100c141e] = 4de5cf5d, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x01e]%asi,%l6	! %l6 = ffffffffffffcf5d
!	Mem[0000000010041410] = ff007b7f000080ff, %f30 = 7bc3d24d 72c46020
	ldda	[%i1+%o5]0x80,%f30	! %f30 = ff007b7f 000080ff
!	Mem[00000000100c1418] = 000000004de5cf5d, %l3 = 00000000f773c922, %asi = 80
	ldxa	[%i3+0x018]%asi,%l3	! %l3 = 000000004de5cf5d
!	Mem[0000000030101400] = 6fdbffff, %l6 = ffffffffffffcf5d
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001010142b] = 51ca5522, %l6 = ffffffffffffffff, %asi = 80
	ldsba	[%i4+0x02b]%asi,%l6	! %l6 = 0000000000000022
!	Mem[0000000030041400] = ff110000, %l6 = 0000000000000022
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffffff110000
!	Mem[0000000010041408] = ff000000, %l5 = 00000000bc636d35
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030101410] = e8ffffff 000000ff, %l2 = ff000000, %l3 = 4de5cf5d
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff 00000000e8ffffff
!	Mem[00000000201c0000] = 00002e40, %l3 = 00000000e8ffffff, %asi = 80
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	%l1 = a7427f46e8ff00ff, Mem[0000000010181400] = 00000000000000ff
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = a7427f46e8ff00ff
!	%f2  = 00000000, Mem[0000000030041400] = 000011ff
	sta	%f2 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000030181400] = 15a76c60, %l0 = 00000000e43bbd5c
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000015a76c60
!	%l5 = ffffffffff000000, %l0 = 0000000015a76c60, %l1 = a7427f46e8ff00ff
	add	%l5,%l0,%l1		! %l1 = 0000000014a76c60
!	Mem[0000000030081410] = 000000ff, %l0 = 0000000015a76c60
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l4 = 000011ffff00ffff, Mem[0000000030141408] = b2999711
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ff00ffff
!	Mem[0000000010181408] = ffd7079a, %l2 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ffd7079a
!	Mem[0000000010101430] = 3dd1c924, %l4 = 00000000ff00ffff
	swap	[%i4+0x030],%l4		! %l4 = 000000003dd1c924
!	%l4 = 3dd1c924, %l5 = ff000000, Mem[0000000010141400] = 0000110e 00000000
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 3dd1c924 ff000000
!	Mem[00000000300c1408] = 5952fbff, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 000000005952fbff

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = e43bbd5c, %l5 = ffffffffff000000
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffffe4
!	Mem[0000000030141408] = ff00ffff, %l4 = 000000003dd1c924
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = ffffffffff00ffff
!	Mem[0000000010141408] = 00000030, %l1 = 0000000014a76c60
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = 57ffb870, %l3 = 0000000000000000
	ldsb	[%o1+%g0],%l3		! %l3 = 0000000000000057
!	Mem[0000000030101400] = 000000006fdbffff, %l5 = ffffffffffffffe4
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 000000006fdbffff
!	%f31 = 000080ff, %f12 = ff000000
	fcmpes	%fcc2,%f31,%f12		! %fcc2 = 2
!	Mem[0000000030001400] = ff1c7105, %f15 = 3487fbbb
	lda	[%i0+%g0]0x81,%f15	! %f15 = ff1c7105
!	%l6 = ffffffffff110000, imm = 00000000000004ac, %l7 = 000000007fffffff
	xor	%l6,0x4ac,%l7		! %l7 = ffffffffff1104ac
!	Mem[0000000030001408] = e8ff00ff, %l5 = 000000006fdbffff
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	%l3 = 0000000000000057, %l7 = ffffffffff1104ac, %y  = ffffff00
	umul	%l3,%l7,%l6		! %l6 = 00000056aec89674, %y = 00000056

p0_label_117:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1404] = 6d353005, %l2 = 00000000ffd7079a
	swap	[%i3+0x004],%l2		! %l2 = 000000006d353005
!	%f30 = ff007b7f 000080ff, %l4 = ffffffffff00ffff
!	Mem[0000000010001420] = d9862e5f687d0840
	add	%i0,0x020,%g1
	stda	%f30,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010001420] = ff8000007f7b00ff
!	%l2 = 6d353005, %l3 = 00000057, Mem[00000000300c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6d353005 00000057
!	Mem[00000000100c1400] = ffffff7f ffd7079a 16bf3005 e2000000
!	%f16 = 779b1059 606c11ff f773c922 4b67067b
!	%f20 = ff800000 ff000000 03448529 9ac69e02
!	%f24 = 99048f69 28d65871 5f649d53 a63e7500
!	%f28 = ff0000ff 6d6177cb ff007b7f 000080ff
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000010081400] = 8ef9ff35, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000035
!	%l3 = 0000000000000057, Mem[0000000010041408] = 000000ff
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000057
!	%f9  = 5f2e86d9, Mem[0000000030041400] = 00000000
	sta	%f9 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 5f2e86d9
!	%l4 = ffffffffff00ffff, Mem[0000000010081400] = fffff98e
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ff00ffff
!	Mem[0000000030001408] = e8ff00ff, %l7 = ffffffffff1104ac
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f16 = 779b1059 606c11ff, Mem[0000000030001400] = ff1c7105 8ef9ff41
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = 779b1059 606c11ff

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = d9862e5f, %l2 = 000000006d353005
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000002e5f
!	Mem[0000000010101400] = 00000000, %l0 = 000000005952fbff
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l5 = ffffffffffffffff, %l3 = 0000000000000057, %l2 = 0000000000002e5f
	subc	%l5,%l3,%l2		! %l2 = ffffffffffffffa8
!	Mem[0000000030141410] = ff5700e8, %l0 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = ffffffffff5700e8
!	Mem[0000000030081408] = 4b670678, %l6 = 00000056aec89674
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000678
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000100c1400] = 779b1059, %l7 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000077
!	Mem[0000000010041410] = ff007b7f000080ff, %l3 = 0000000000000057
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = ff007b7f000080ff
!	Mem[0000000010141400] = 24c9d13d, %f6  = 7146e348
	lda	[%i5+%g0]0x88,%f6 	! %f6 = 24c9d13d
!	Mem[0000000010101410] = e5570000, %l2 = ffffffffffffffa8
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000e5
!	Mem[0000000010181426] = 00000000, %l6 = 0000000000000678
	ldsh	[%i6+0x026],%l6		! %l6 = 0000000000000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l0 = ff5700e8, %l1 = 00000035, Mem[0000000030101410] = ff000000 ffffffe8
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ff5700e8 00000035
!	Mem[0000000010141410] = 0000000045ee57e5, %l4 = ffffffffff00ffff, %l7 = 0000000000000077
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 0000000045ee57e5
!	Mem[0000000030081410] = ff0000ff, %l2 = 00000000000000e5
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff0000ff
!	%l4 = ffffffffff00ffff, Mem[0000000030141400] = 0e110000
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0e11ffff
!	Mem[0000000010081430] = 00000000, %l2 = 00000000ff0000ff, %asi = 80
	swapa	[%i2+0x030]%asi,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010001400] = ff0000ff8ef9ff41
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[0000000010081418] = 3a123fea0e11ffff
	stx	%l5,[%i2+0x018]		! Mem[0000000010081418] = ffffffffffffffff
!	%f10 = ff00ffe8 467f42a7, %l6 = 0000000000000000
!	Mem[0000000030101428] = 606c110e0fac18ed
	add	%i4,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101428] = 606c110e0fac18ed
!	%l3 = ff007b7f000080ff, Mem[000000001000141c] = 48e34671
	sth	%l3,[%i0+0x01c]		! Mem[000000001000141c] = 80ff4671
!	%l4 = ff00ffff, %l5 = ffffffff, Mem[0000000030041410] = ff000652 0000110e
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = ff00ffff ffffffff

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = c6000000, %l1 = 0000000000000035
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101438] = e8eed828 7d48674b, %l6 = 00000000, %l7 = 45ee57e5, %asi = 80
	ldda	[%i4+0x038]%asi,%l6	! %l6 = 00000000e8eed828 000000007d48674b
!	Mem[0000000030101410] = e80057ff, %f14 = 119799b2
	lda	[%i4+%o5]0x89,%f14	! %f14 = e80057ff
!	Mem[000000001018142c] = 524e1aef, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x02c]%asi,%l2	! %l2 = 00000000524e1aef
!	Mem[000000001014143e] = 392adb2b, %l3 = ff007b7f000080ff
	ldsh	[%i5+0x03e],%l3		! %l3 = ffffffffffffdb2b
!	Mem[0000000010181408] = ff000000, %l3 = ffffffffffffdb2b
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l0 = ffffffffff5700e8
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010081400] = ffff00ff, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 00000000 000000ff, %l4 = ff00ffff, %l5 = ffffffff
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l7 = 000000007d48674b
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010041410] = ff007b7f, %asi = 80
	stha	%l4,[%i1+0x010]%asi	! Mem[0000000010041410] = 00ff7b7f
!	%l7 = 0000000000000000, Mem[0000000010181410] = 000000ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f8  = 40087d68 5f2e86d9, Mem[0000000010041400] = 72c46078 118c801c
	stda	%f8 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 40087d68 5f2e86d9
!	%l7 = 0000000000000000, Mem[0000000030181410] = 0000e54d
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000e54d
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 30000000
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 300000ff
!	Mem[0000000010001408] = 467f42a7, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000a7
!	%l3 = 00000000000000ff, Mem[0000000010081410] = ffff00ff
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%f20 = ff800000 ff000000, Mem[0000000010001400] = 00000000 00000000
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = ff800000 ff000000
!	Mem[0000000030141410] = e80057ff, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000e80057ff
!	Mem[00000000300c1408] = 0530356d, %l2 = 00000000524e1aef
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 000000000530356d

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %f8  = 40087d68
	lda	[%i4+%g0]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000010081410] = 000000ff ff110000, %l0 = ffffff00, %l1 = e80057ff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff 00000000ff110000
!	Mem[0000000030041400] = d9862e5f, %f25 = 28d65871
	lda	[%i1+%g0]0x89,%f25	! %f25 = d9862e5f
!	Mem[0000000010101408] = ff0000ff, %l2 = 000000000530356d
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = c6000000, %l6 = 00000000e8eed828
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = ffffffffc6000000
!	%f26 = 5f649d53, %f4  = 00000000, %f29 = 6d6177cb
	fdivs	%f26,%f4 ,%f29		! %f29 = 7f800000
!	Mem[00000000201c0000] = 00002e40, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 606c11ff, %l0 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 00000000000011ff
!	Mem[0000000030041410] = ffff00ff, %f21 = ff000000
	lda	[%i1+%o5]0x81,%f21	! %f21 = ffff00ff
!	Mem[0000000030141400] = 0e11ffff, %f17 = 606c11ff
	lda	[%i5+%g0]0x89,%f17	! %f17 = 0e11ffff

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff110000, Mem[0000000010101408] = ff0000ff
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ff110000
!	%l2 = ffffffffffffffff, immd = fffff605, %y  = 00000056
	umul	%l2,-0x9fb,%l5		! %l5 = fffff604000009fb, %y = fffff604
!	Mem[0000000010181400] = a7427f46 e8ff00ff 000000ff 02c51392
!	%f0  = ff0000ff 8ef9ff41 00000000 467f42a7
!	%f4  = 00000000 000000e8 24c9d13d 242a2939
!	%f8  = 00000000 5f2e86d9 ff00ffe8 467f42a7
!	%f12 = ff000000 606c11ff e80057ff ff1c7105
	stda	%f0 ,[%i6+%g0]ASI_BLK_P	! Block Store to 0000000010181400
!	%l1 = 00000000ff110000, Mem[000000001010142c] = 6d6177cb
	stw	%l1,[%i4+0x02c]		! Mem[000000001010142c] = ff110000
!	Mem[0000000010001428] = a7427f46, %l3 = 000000ff, %l7 = 00000000
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000a7427f46
!	%f1  = 8ef9ff41, Mem[00000000100c1400] = 779b1059
	sta	%f1 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8ef9ff41
!	%l1 = 00000000ff110000, Mem[00000000100c1410] = ff800000ff000000
	stx	%l1,[%i3+%o5]		! Mem[00000000100c1410] = 00000000ff110000
!	%f24 = 99048f69 d9862e5f, %l1 = 00000000ff110000
!	Mem[0000000030041428] = f773c9223ad50e7f
	add	%i1,0x028,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041428] = f773c9223ad50e7f
!	%l7 = 00000000a7427f46, Mem[0000000030101408] = 6fdbff8f
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 6fdbff46
!	%l3 = 00000000000000ff, Mem[0000000030101408] = 6fdbff46
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000e5, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 000000c6, %l5 = fffff604000009fb
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l7 = 00000000a7427f46
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff800000 ff000000, %l6 = c6000000, %l7 = 00000000, %asi = 80
	ldda	[%i0+0x000]%asi,%l6	! %l6 = 00000000ff800000 00000000ff000000
!	Mem[000000001004142a] = 205e4196, %l5 = 0000000000000000, %asi = 80
	lduha	[%i1+0x02a]%asi,%l5	! %l5 = 0000000000004196
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l1 = 00000000ff110000, imm = 0000000000000536, %l5 = 0000000000004196
	orn	%l1,0x536,%l5		! %l5 = fffffffffffffac9
!	Code Fragment 3, seed = 748671
p0_fragment_12:
!	%l0 = 00000000000011ff
	setx	0xade845242b4bc32e,%g7,%l0 ! %l0 = ade845242b4bc32e
!	%l1 = 00000000ff110000
	setx	0xa2b72fc70722a8d9,%g7,%l1 ! %l1 = a2b72fc70722a8d9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ade845242b4bc32e
	setx	0xd8a0f70111763a94,%g7,%l0 ! %l0 = d8a0f70111763a94
!	%l1 = a2b72fc70722a8d9
	setx	0xc35c29aa4023fb5f,%g7,%l1 ! %l1 = c35c29aa4023fb5f
p0_fragment_12_end:
!	Mem[0000000030141408] = ffff00ff, %l7 = 00000000ff000000
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 5f2e86d9, %l6 = 00000000ff800000
	lduba	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000d9

p0_label_125:
!	Starting 10 instruction Store Burst
!	%l6 = 000000d9, %l7 = 000000ff, Mem[00000000100c1408] = 22c973f7 7b06674b
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000d9 000000ff
!	Mem[00000000100c1410] = 00000000, %l1 = 000000004023fb5f
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l6 = 000000d9, %l7 = 000000ff, Mem[0000000010141400] = 3dd1c924 ff000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000d9 000000ff
!	%l6 = 000000d9, %l7 = 000000ff, Mem[00000000100c1400] = 41fff98e ff116c60
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000d9 000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 00000000
	stha	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010181410] = 00000000, %l6 = 00000000000000d9
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f16 = 779b1059 0e11ffff, Mem[00000000100c1400] = 000000d9 000000ff
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 779b1059 0e11ffff
!	%l1 = 0000000000000000, Mem[0000000030081408] = 4b670678
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010181408] = 00000000467f42a7
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l5 = fffffffffffffac9, Mem[0000000030081400] = ff116c60
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = fffffac9

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff116c6059109b77, %f16 = 779b1059 0e11ffff
	ldda	[%i0+%g0]0x89,%f16	! %f16 = ff116c60 59109b77
!	Mem[0000000010041410] = 7f7bff00, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010141400] = ff000000 d9000000, %l2 = ffffffff, %l3 = 0000ff00
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000d9000000 00000000ff000000
!	Mem[00000000100c1408] = d9000000ff000000, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = d9000000ff000000
!	%l2 = 00000000d9000000, imm = fffffffffffffe35, %l3 = 00000000ff000000
	add	%l2,-0x1cb,%l3		! %l3 = 00000000d8fffe35
!	Mem[0000000010181400] = ff0000ff8ef9ff41, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = ff0000ff8ef9ff41
!	Mem[0000000030101410] = ff5700e8, %l6 = ff0000ff8ef9ff41
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ff5700e8
!	Mem[0000000030001410] = c6000000, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000011ff 4023fb5f, %l4 = ff000000, %l5 = fffffac9
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 000000004023fb5f 00000000000011ff
!	Mem[0000000030081410] = e5000000, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = ffffffffe5000000

p0_label_127:
!	Starting 10 instruction Store Burst
!	%f22 = 03448529 9ac69e02, Mem[0000000010181408] = 00000000 00000000
	std	%f22,[%i6+%o4]		! Mem[0000000010181408] = 03448529 9ac69e02
!	%f26 = 5f649d53 a63e7500, Mem[0000000030181400] = 5cbd3be4 4e95d6d4
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 5f649d53 a63e7500
!	Mem[00000000201c0000] = 00002e40, %l0 = d8a0f70111763a94
	ldstub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l1 = ffffffffe5000000
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 4023fb5f, %l5 = 000011ff, Mem[0000000030001410] = c6000000 0000110e
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 4023fb5f 000011ff
!	%f26 = 5f649d53 a63e7500, %l3 = 00000000d8fffe35
!	Mem[0000000030181408] = 00000000000000e8
	add	%i6,0x008,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030181408] = 00750000539d00e8
!	%f6  = 24c9d13d 242a2939, Mem[0000000030181400] = 00753ea6 539d645f
	stda	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 24c9d13d 242a2939
!	Mem[0000000010181408] = 29854403, %l2 = 00000000d9000000
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 0000000029854403
!	Mem[0000000010181400] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff000030, %l5 = 00000000000011ff
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = d9000000, %l6 = 00000000ff5700e8
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff110000 6d6177cb, %l4 = 4023fb5f, %l5 = 000000ff
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff110000 000000006d6177cb
!	Mem[0000000030041400] = 5f2e86d9, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 000000005f2e86d9
!	Mem[00000000300c1400] = 00000000, %l5 = 000000006d6177cb
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041409] = 57000000, %l7 = 00000000000000ff, %asi = 80
	ldsba	[%i1+0x009]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 5ffb2340, %l3 = 00000000d8fffe35
	ldub	[%i3+%o5],%l3		! %l3 = 000000000000005f
!	Mem[0000000030041400] = d9862e5f, %l2 = 0000000029854403
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = 000000000000005f
!	Mem[0000000021800000] = d0623f00, %l2 = 000000000000005f, %asi = 80
	ldsba	[%o3+0x000]%asi,%l2	! %l2 = ffffffffffffffd0
!	%f1  = 8ef9ff41, %f6  = 24c9d13d, %f20 = ff800000
	fsubs	%f1 ,%f6 ,%f20		! %f20 = a4c9d13d
!	Mem[0000000030081410] = e5000000, %l2 = ffffffffffffffd0
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = ffffffffe5000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000005f, Mem[0000000030141408] = ff00ffff
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000005f
!	Mem[0000000010181400] = ff0000ff, %l4 = 00000000ff110000
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010081434] = 000000cb, %l1 = 0000000000000000
	swap	[%i2+0x034],%l1		! %l1 = 00000000000000cb
!	%f16 = ff116c60 59109b77, %l6 = 000000005f2e86d9
!	Mem[0000000030101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030101408] = 779b0000000011ff
!	Mem[0000000010041410] = 00ff7b7f, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 000000000000005f, Mem[0000000030041400] = d9862e5f
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000005f
!	Mem[0000000030001410] = 5ffb2340, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 000000005ffb2340
!	Mem[0000000010101420] = 0000ffe8, %l0 = 00000000, %l6 = 5f2e86d9
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 000000000000ffe8
!	%l2 = e5000000, %l3 = 0000005f, Mem[0000000030041400] = 0000005f 000000ff
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = e5000000 0000005f
!	Mem[0000000010081400] = ff00ffff 05711c07 7806674b 0000ff00
!	%f16 = ff116c60 59109b77 f773c922 4b67067b
!	%f20 = a4c9d13d ffff00ff 03448529 9ac69e02
!	%f24 = 99048f69 d9862e5f 5f649d53 a63e7500
!	%f28 = ff0000ff 7f800000 ff007b7f 000080ff
	stda	%f16,[%i2+%g0]ASI_BLK_P	! Block Store to 0000000010081400

p0_label_130:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010081410] = 3dd1c9a4, %l4 = 00000000ff0000ff
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffa4
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l1 = 00000000000000cb
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffff0000ff
!	Mem[00000000300c1400] = 00000000, %l2 = ffffffffe5000000
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 0000005fe5000000, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 0000005fe5000000
!	%l3 = 000000000000005f, imm = 0000000000000d31, %l4 = ffffffffffffffa4
	subc	%l3,0xd31,%l4		! %l4 = fffffffffffff32e
!	Mem[000000001010143f] = 7d48674b, %l6 = 000000000000ffe8
	ldsb	[%i4+0x03f],%l6		! %l6 = 000000000000004b
!	Mem[0000000030181410] = 0000e54d bc636d35, %l2 = 00000000, %l3 = 0000005f
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000000000e54d 00000000bc636d35
!	Mem[0000000030141410] = 00000000, %l1 = ffffffffff0000ff
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 22c973f7, %l2 = 000000000000e54d
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 0000000022c973f7

p0_label_131:
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffff32e, Mem[0000000030141410] = 6200000000000000
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = fffffffffffff32e
!	%l0 = 0000005fe5000000, %l4 = fffffffffffff32e, %l0 = 0000005fe5000000
	orn	%l0,%l4,%l0		! %l0 = 0000005fe5000cd1
!	%l1 = 0000000000000000, Mem[0000000010181408] = d9000000
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = d9000000
!	%l4 = fffffffffffff32e, Mem[0000000020800041] = 62ffbea0, %asi = 80
	stba	%l4,[%o1+0x041]%asi	! Mem[0000000020800040] = 622ebea0
!	Mem[0000000010101408] = 000011ff, %l7 = 000000005ffb2340
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000011ff
!	%l1 = 0000000000000000, Mem[0000000030001408] = ff00ffe8
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f0  = ff0000ff, Mem[0000000010081408] = f773c922
	sta	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff0000ff
!	Mem[0000000030141410] = 2ef3ffff, %l0 = 00000000e5000cd1
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 000000002ef3ffff
!	Mem[0000000030001410] = 00000000, %l0 = 000000002ef3ffff
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000000, %l2 = 0000000022c973f7, %l4 = fffffffffffff32e
	or	%l1,%l2,%l4		! %l4 = 0000000022c973f7

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 4023fb5f, %f1  = 8ef9ff41
	lda	[%i4+%o4]0x80,%f1 	! %f1 = 4023fb5f
!	%f4  = 00000000 000000e8, %l3 = 00000000bc636d35
!	Mem[0000000030041418] = 2163d53a560c7423
	add	%i1,0x018,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041418] = 21630000560074e8
!	Mem[0000000030101410] = ff5700e8, %l6 = 000000000000004b
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 000080ff, %l7 = 00000000000011ff
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001000143e] = b2999711, %l0 = 0000000000000000
	ldsh	[%i0+0x03e],%l0		! %l0 = ffffffffffff9711
!	Mem[0000000010181408] = 029ec69ad9000000, %f22 = 03448529 9ac69e02
	ldda	[%i6+%o4]0x88,%f22	! %f22 = 029ec69a d9000000
!	Mem[0000000030181408] = 00750000, %l3 = 00000000bc636d35
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ff116c60, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff11
!	Mem[0000000010141408] = 300000ff, %l2 = 0000000022c973f7
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = d9000000ff000000, %f26 = 5f649d53 a63e7500
	ldda	[%i3+%o4]0x80,%f26	! %f26 = d9000000 ff000000

p0_label_133:
!	Starting 10 instruction Store Burst
!	%f15 = ff1c7105, Mem[0000000010181424] = 5f2e86d9
	sta	%f15,[%i6+0x024]%asi	! Mem[0000000010181424] = ff1c7105
!	Mem[00000000100c141b] = 03448529, %l2 = ffffffffffffffff
	ldstuba	[%i3+0x01b]%asi,%l2	! %l2 = 0000000000000029
!	Mem[0000000010181408] = d9000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%f16 = ff116c60 59109b77, %l5 = 0000000000000000
!	Mem[0000000030101420] = 5400000056a0d062
	add	%i4,0x020,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101420] = 5400000056a0d062
!	%l3 = 0000000000000000, Mem[0000000010141408] = 300000ff
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 30000000
!	%l1 = ffffffffffffff11, imm = fffffffffffffae5, %l3 = 0000000000000000
	addc	%l1,-0x51b,%l3		! %l3 = fffffffffffff9f6
!	%l3 = fffffffffffff9f6, Mem[0000000010181424] = ff1c7105, %asi = 80
	stwa	%l3,[%i6+0x024]%asi	! Mem[0000000010181424] = fffff9f6
!	%l3 = fffffffffffff9f6, Mem[0000000010041424] = 5f3cd449, %asi = 80
	stba	%l3,[%i1+0x024]%asi	! Mem[0000000010041424] = f63cd449
!	%l7 = 00000000000000ff, Mem[000000001010143d] = 7d48674b
	stb	%l7,[%i4+0x03d]		! Mem[000000001010143c] = 7dff674b
!	%f22 = 029ec69a d9000000, Mem[0000000010081410] = a4c9d13d ffff00ff
	stda	%f22,[%i2+%o5]0x80	! Mem[0000000010081410] = 029ec69a d9000000

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = ff002e40, %l5 = 0000000000000000
	ldsb	[%o0+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041426] = f63cd449, %l2 = 0000000000000029
	ldsh	[%i1+0x026],%l2		! %l2 = ffffffffffffd449
!	Mem[0000000030001410] = 2ef3ffff, %l2 = ffffffffffffd449
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 000000002ef3ffff
!	Mem[0000000010041410] = 7f7bffff, %l6 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 000000007f7bffff
!	Mem[0000000010081430] = ff0000ff, %l2 = 000000002ef3ffff
	ldsw	[%i2+0x030],%l2		! %l2 = ffffffffff0000ff
!	Mem[0000000030001410] = 2ef3ffff, %l6 = 000000007f7bffff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 000000002ef3ffff
!	Mem[0000000010041400] = d9862e5f, %f16 = ff116c60
	lda	[%i1+%g0]0x80,%f16	! %f16 = d9862e5f
!	Mem[0000000030081408] = 00000000, %l2 = ffffffffff0000ff
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1420] = 99048f69, %l7 = 00000000000000ff
	lduw	[%i3+0x020],%l7		! %l7 = 0000000099048f69
!	Mem[000000001014143a] = 0a356fff, %l1 = ffffffffffffff11, %asi = 80
	lduha	[%i5+0x03a]%asi,%l1	! %l1 = 0000000000006fff

p0_label_135:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l4 = 0000000022c973f7
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l1 = 0000000000006fff, Mem[0000000020800040] = 622ebea0, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 6fffbea0
!	Mem[00000000300c1410] = ff0000ff, %l7 = 0000000099048f69
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff0000ff
!	%l1 = 0000000000006fff, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%l1 = 0000000000006fff, Mem[0000000010141410] = 00000000
	stwa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 00006fff
!	Mem[0000000030141408] = 5f000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000000000005f
!	%l3 = fffffffffffff9f6, Mem[0000000020800041] = 6fffbea0, %asi = 80
	stba	%l3,[%o1+0x041]%asi	! Mem[0000000020800040] = 6ff6bea0
!	%l5 = 0000000000000000, Mem[00000000100c141a] = 034485ff, %asi = 80
	stha	%l5,[%i3+0x01a]%asi	! Mem[00000000100c1418] = 03440000
!	%l4 = 000000000000005f, Mem[00000000100c1400] = 0e11ffff
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0e11005f
!	%l0 = ffff9711, %l1 = 00006fff, Mem[0000000030001408] = 000000ff a7427f46
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffff9711 00006fff

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 5ffb2340, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000002340
!	Mem[00000000201c0000] = ff002e40, %l5 = 0000000000002340
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000, %f3  = 467f42a7
	lda	[%i3+%g0]0x81,%f3 	! %f3 = 00000000
!	%l2 = 0000000000000000, %l0 = ffffffffffff9711, %l5 = ffffffffffffffff
	addc	%l2,%l0,%l5		! %l5 = ffffffffffff9711
!	Mem[0000000010041410] = 7f7bffff, %l5 = ffffffffffff9711
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030141410] = d10c00e5, %l5 = 000000000000ffff
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = ffffffffd10c00e5
!	Mem[0000000010041410] = ffff7b7f000080ff, %l1 = 0000000000006fff
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = ffff7b7f000080ff
!	Mem[00000000100c1426] = 28d65871, %l6 = 000000002ef3ffff
	ldub	[%i3+0x026],%l6		! %l6 = 0000000000000058
!	Mem[0000000010141400] = 000000d9000000ff, %f22 = 029ec69a d9000000
	ldda	[%i5+%g0]0x80,%f22	! %f22 = 000000d9 000000ff
!	Mem[0000000010181400] = ff110000, %l0 = ffffffffffff9711
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_137:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = d9000000, %l7 = 00000000ff0000ff
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000d9000000
!	%l6 = 0000000000000058, imm = 00000000000006b8, %l0 = 0000000000000000
	add	%l6,0x6b8,%l0		! %l0 = 0000000000000710
!	Mem[00000000100c1424] = 28d65871, %l4 = 000000000000005f
	swap	[%i3+0x024],%l4		! %l4 = 0000000028d65871
!	Mem[0000000030181408] = 00750000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000000750000
!	%l3 = fffffffffffff9f6, Mem[0000000010101410] = 000057e5
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 000057f6
!	%f21 = ffff00ff, Mem[0000000030181400] = 24c9d13d
	sta	%f21,[%i6+%g0]0x81	! Mem[0000000030181400] = ffff00ff
!	%l6 = 00000058, %l7 = d9000000, Mem[0000000010041410] = 7f7bffff ff800000
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000058 d9000000
!	%f16 = d9862e5f 59109b77, %l3 = fffffffffffff9f6
!	Mem[0000000010041438] = 000000330b5f0608
	add	%i1,0x038,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041438] = 009b10335f2e86d9
!	%f18 = f773c922, Mem[0000000030081400] = fffffac9
	sta	%f18,[%i2+%g0]0x81	! Mem[0000000030081400] = f773c922
!	%l4 = 0000000028d65871, Mem[0000000030181410] = 356d63bc4de50000
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000028d65871

p0_label_138:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000750000, Mem[0000000010041400] = d9862e5f
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00002e5f
!	Mem[0000000030101400] = ffffdb6f, %l4 = 0000000028d65871
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00002e5f687d0840, %l4 = 00000000000000ff
	ldx	[%i1+%g0],%l4		! %l4 = 00002e5f687d0840
!	Mem[0000000010181408] = ff0000d9, %l1 = ffff7b7f000080ff
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = 6fdbffff, %l0 = 0000000000000710
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000006fdbffff
!	Mem[0000000010101410] = f657000000000000, %f2  = 00000000 00000000
	ldda	[%i4+%o5]0x80,%f2 	! %f2  = f6570000 00000000
!	Mem[00000000300c1410] = 00000000698f0499, %l0 = 000000006fdbffff
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 00000000698f0499
!	Mem[0000000010081400] = ff116c60, %l4 = 00002e5f687d0840
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 0000005f e5000000, %l2 = 00750000, %l3 = fffff9f6
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000e5000000 000000000000005f
!	Mem[0000000030141400] = 0e11ffff, %l4 = 00000000000000ff
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = 000000000e11ffff

p0_label_139:
!	Starting 10 instruction Store Burst
!	%f28 = ff0000ff 7f800000, %l2 = 00000000e5000000
!	Mem[00000000100c1430] = ff0000ff6d6177cb
	add	%i3,0x030,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1430] = ff0000ff6d6177cb
!	%l2 = 00000000e5000000, Mem[000000001004143f] = 5f2e86d9
	stb	%l2,[%i1+0x03f]		! Mem[000000001004143c] = 5f2e8600
!	%l1 = ffffffffffffffff, Mem[0000000010181400] = ff110000
	stwa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	%l4 = 000000000e11ffff, Mem[0000000010101410] = f6570000
	stba	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = ff570000
!	Mem[0000000010141408] = 00000030, %l4 = 000000000e11ffff
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000058, Mem[0000000010001408] = 467f42ff
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000058
!	Mem[00000000201c0000] = ff002e40, %l2 = 00000000e5000000
	ldstub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	%l7 = 00000000d9000000, Mem[0000000010101408] = 4023fb5f6d6177cb
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000d9000000
!	Mem[00000000100c1408] = d9000000, %l5 = 00000000d10c00e5
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000d9000000
!	%l3 = 000000000000005f, Mem[0000000030101410] = ff5700e8
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000005f

p0_label_140:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 529068
p0_fragment_13:
!	%l0 = 00000000698f0499
	setx	0xb84a07e400254ec6,%g7,%l0 ! %l0 = b84a07e400254ec6
!	%l1 = ffffffffffffffff
	setx	0x94b452c2ec6040f1,%g7,%l1 ! %l1 = 94b452c2ec6040f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b84a07e400254ec6
	setx	0xcb0d430ef434372c,%g7,%l0 ! %l0 = cb0d430ef434372c
!	%l1 = 94b452c2ec6040f1
	setx	0xd9123817fbaf3477,%g7,%l1 ! %l1 = d9123817fbaf3477
p0_fragment_13_end:
!	Mem[00000000100c1410] = 4023fb5f, %l2 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = fffffffffffffb5f
!	Mem[0000000010081408] = ff0000ff, %f21 = ffff00ff
	lda	[%i2+%o4]0x80,%f21	! %f21 = ff0000ff
!	Mem[0000000020800040] = 6ff6bea0, %l6 = 0000000000000058
	ldub	[%o1+0x040],%l6		! %l6 = 000000000000006f
!	Mem[0000000030041400] = 000000e5, %l5 = 00000000d9000000
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000e5
!	Mem[0000000030181400] = ffff00ff242a2939, %l0 = cb0d430ef434372c
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = ffff00ff242a2939
!	%f22 = 000000d9, %f20 = a4c9d13d
	fsqrts	%f22,%f20		! tt=0x22, %l0 = ffff00ff242a295b
!	Mem[0000000030041408] = f773c922, %l7 = 00000000d9000000
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = fffffffffffff773
!	Mem[0000000030101400] = 6fdbffff, %l6 = 000000000000006f
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 000040d0, %l5 = 00000000000000e5, %asi = 80
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000

p0_label_141:
!	Starting 10 instruction Store Burst
!	%f16 = d9862e5f 59109b77, Mem[0000000030181408] = 00000000 539d00e8
	stda	%f16,[%i6+%o4]0x81	! Mem[0000000030181408] = d9862e5f 59109b77
!	Mem[0000000010001400] = 000080ff, %l7 = fffffffffffff773
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = d9123817fbaf3477, Mem[0000000030001410] = fffff32e
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = fffff377
!	%f25 = d9862e5f, %f14 = e80057ff
	fcmps	%fcc1,%f25,%f14		! %fcc1 = 2
!	%f17 = 59109b77, Mem[00000000100c1408] = e5000cd1
	sta	%f17,[%i3+%o4]0x88	! Mem[00000000100c1408] = 59109b77
!	Mem[000000001014142c] = 5a77dd0f, %l5 = 0000000000000000, %asi = 80
	swapa	[%i5+0x02c]%asi,%l5	! %l5 = 000000005a77dd0f
!	Mem[0000000010041430] = 771cea04, %l7 = 000000ff, %l0 = 242a295b
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000771cea04
!	%l3 = 000000000000005f, Mem[0000000010081410] = 9ac69e02
	stha	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 9ac6005f
!	%f28 = ff0000ff 7f800000, %l7 = 00000000000000ff
!	Mem[0000000010081400] = ff116c6059109b77
	stda	%f28,[%i2+%l7]ASI_PST8_PL ! Mem[0000000010081400] = 0000807fff0000ff
!	%l1 = d9123817fbaf3477, Mem[0000000010141422] = 5364eb18
	stb	%l1,[%i5+0x022]		! Mem[0000000010141420] = 53647718

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 9ac6005f, %f6  = 24c9d13d
	lda	[%i2+%o5]0x88,%f6 	! %f6 = 9ac6005f
!	%l2 = fffffffffffffb5f, immd = 0000000000000cc0, %l108 = 0000000000000000
	sdivx	%l2,0xcc0,%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000058, %l2 = fffffffffffffb5f
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000058
!	%l6 = ffffffffffffffff, %l4 = ffffffffffffffff, %l1 = d9123817fbaf3477
	and	%l6,%l4,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = 000000e5, %l2 = 0000000000000058
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000e5
!	Mem[0000000010101428] = 51ca5522 ff110000, %l6 = ffffffff, %l7 = 000000ff, %asi = 80
	ldda	[%i4+0x028]%asi,%l6	! %l6 = 0000000051ca5522 00000000ff110000
!	Mem[0000000030181400] = ffff00ff242a2939, %f26 = d9000000 ff000000
	ldda	[%i6+%g0]0x81,%f26	! %f26 = ffff00ff 242a2939
!	%f30 = ff007b7f, %f0  = ff0000ff, %f8  = 00000000
	fdivs	%f30,%f0 ,%f8 		! %f8  = 3f807a7f
!	Mem[0000000010041408] = 57000000, %l1 = ffffffffffffffff
	ldsw	[%i1+%o4],%l1		! %l1 = 0000000057000000

p0_label_143:
!	Starting 10 instruction Store Burst
!	%f8  = 3f807a7f 5f2e86d9, Mem[0000000010141400] = ff0000ff 000000ff
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 3f807a7f 5f2e86d9
!	%f29 = 7f800000, %f27 = 242a2939
	fcmps	%fcc3,%f29,%f27		! %fcc3 = 2
!	%l2 = 000000e5, %l3 = 0000005f, Mem[0000000030141400] = ffff110e 70531114
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000e5 0000005f
!	Mem[0000000010181408] = ff0000d9, %l5 = 000000005a77dd0f
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f14 = e80057ff, %f17 = 59109b77
	fcmpes	%fcc1,%f14,%f17		! %fcc1 = 1
!	%f28 = ff0000ff, %f11 = 467f42a7, %f25 = d9862e5f
	fadds	%f28,%f11,%f25		! %f25 = ff0000ff
!	%l2 = 00000000000000e5, Mem[00000000201c0000] = ff002e40
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00e52e40
!	Mem[0000000030041410] = ffff00ff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = 00000000, %l1 = 57000000, Mem[0000000030041400] = 000000e5 5f000000
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 57000000
!	%l2 = 00000000000000e5, Mem[0000000010141408] = c66cb407300000ff
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000e5

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffff00ff, %l1 = 0000000057000000
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001018142e] = 467f42a7, %l6 = 0000000051ca5522, %asi = 80
	ldsba	[%i6+0x02e]%asi,%l6	! %l6 = 0000000000000042
!	Mem[0000000010101400] = ff000000, %l2 = 00000000000000e5
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030181400] = 39292a24 ff00ffff, %l6 = 00000042, %l7 = ff110000
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff00ffff 0000000039292a24
!	Mem[0000000030001400] = 59109b77, %l0 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 0000000059109b77
!	Mem[00000000100c1400] = 0e11005f, %l6 = 00000000ff00ffff
	ldswa	[%i3+%g0]0x88,%l6	! %l6 = 000000000e11005f
!	Mem[0000000010101408] = 00000000d9000000, %l2 = 00000000ff000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 00000000d9000000
!	Mem[0000000010001410] = ff000000, %f27 = 242a2939
	lda	[%i0+%o5]0x80,%f27	! %f27 = ff000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010181400] = ffffffff 8ef9ff41 ff0000d9 9ac69e02
!	Mem[0000000010181410] = ff000000 000000e8 24c9d13d 242a2939
!	Mem[0000000010181420] = 00000000 fffff9f6 ff00ffe8 467f42a7
!	Mem[0000000010181430] = ff000000 606c11ff e80057ff ff1c7105
	ldda	[%i6+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010181400
!	Mem[00000000218001c0] = 6d35c250, %l1 = ffffffffffffffff, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000006d35

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ff0000ff, %l7 = 0000000039292a24
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[00000000100c1400] = 0e11005f, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 000000000e11005f
!	Mem[0000000010081400] = 0000807f, %l6 = 000000000e11005f
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 000000000000807f
!	Mem[0000000010001408] = 00000058, %l1 = 0000000000006d35
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000058
!	%f11 = e8ff00ff, Mem[0000000010101408] = 00000000
	sta	%f11,[%i4+0x008]%asi	! Mem[0000000010101408] = e8ff00ff
!	%l6 = 0000807f, %l7 = ff0000ff, Mem[0000000030041400] = 00000000 00000057
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000807f ff0000ff
!	%l6 = 0000807f, %l7 = ff0000ff, Mem[0000000010081408] = 39292a24 7b06674b
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000807f ff0000ff
!	Mem[00000000100c1408] = 59109b77, %l3 = 000000000000005f
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 0000000059109b77
!	Mem[0000000030001400] = 59109b77, %l7 = 00000000ff0000ff
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000077
!	Mem[0000000030181410] = 7158d628, %l7 = 0000000000000077
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000071

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 3f807a7f, %l0 = 0000000059109b77
	lduw	[%i5+%g0],%l0		! %l0 = 000000003f807a7f
!	Mem[0000000030001410] = fffff377, %l4 = ffffffffffffffff
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = fffffffffffff377
!	Mem[0000000030081400] = 22c973f7, %l5 = 000000000e11005f
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000f7
!	Mem[0000000010041410] = 58000000, %l0 = 000000003f807a7f
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000058
!	Mem[0000000010001410] = ff000000, %f19 = 4b67067b
	lda	[%i0+%o5]0x80,%f19	! %f19 = ff000000
!	Mem[0000000010141400] = d9862e5f7f7a803f, %l0 = 0000000000000058
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = d9862e5f7f7a803f
!	Mem[00000000100c1428] = 5f649d53 a63e7500, %l6 = 0000807f, %l7 = 00000071
	ldd	[%i3+0x028],%l6		! %l6 = 000000005f649d53 00000000a63e7500
!	Mem[0000000010181410] = ff000000, %l1 = 0000000000000058
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000021800040] = 18ffb930, %l2 = 00000000d9000000
	ldsb	[%o3+0x040],%l2		! %l2 = 0000000000000018
!	%l0 = d9862e5f7f7a803f, immd = fffffffffffff315, %l108 = 0000000000000004
	sdivx	%l0,-0xceb,%l4		! %l4 = 0002fa7d60b9d3fd

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l2 = 00000018, %l3 = 59109b77, Mem[0000000010081418] = 03448529 9ac69e02
	std	%l2,[%i2+0x018]		! Mem[0000000010081418] = 00000018 59109b77
!	%l1 = ffffffffff000000, Mem[0000000030141400] = 5f000000e5000000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffffff000000
!	%f14 = 05711cff ff5700e8, Mem[00000000300c1400] = 00000000 50bf6453
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = 05711cff ff5700e8
!	Mem[00000000100c1400] = 000000ff, %l5 = 00000000000000f7
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000018, Mem[00000000100c1410] = 5ffb2340
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 18fb2340
!	Mem[0000000030081400] = 22c973f7, %l0 = d9862e5f7f7a803f
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000f7
!	%l1 = ffffffffff000000, Mem[00000000300c1410] = 99048f69
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
	membar	#Sync			! Added by membar checker (19)
!	%l6 = 000000005f649d53, Mem[0000000010181408] = ff0000d9
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 5f649d53
!	%l3 = 0000000059109b77, Mem[0000000010181428] = ff00ffe8
	sth	%l3,[%i6+0x028]		! Mem[0000000010181428] = 9b77ffe8
!	%l1 = ffffffffff000000, Mem[00000000100c1400] = ff000000
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 779b1059 22c973ff, %l2 = 00000018, %l3 = 59109b77
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000022c973ff 00000000779b1059
!	Mem[0000000030181400] = ff00ffff, %l7 = 00000000a63e7500
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = ffffffffff00ffff
!	%l6 = 000000005f649d53, imm = fffffffffffff375, %l2 = 0000000022c973ff
	addc	%l6,-0xc8b,%l2		! %l2 = 000000005f6490c8
!	%l7 = ffffffffff00ffff, %l7 = ffffffffff00ffff, %y  = fffff604
	umul	%l7,%l7,%l7		! %l7 = fe02fdff01fe0001, %y = fe02fdff
!	Mem[00000000300c1408] = 524e1aef, %f2  = 029ec69a
	lda	[%i3+%o4]0x89,%f2 	! %f2 = 524e1aef
!	%l4 = 0002fa7d60b9d3fd, imm = fffffffffffffab2, %l2 = 000000005f6490c8
	xor	%l4,-0x54e,%l2		! %l2 = fffd05829f46294f
!	Mem[00000000100c1410] = 18fb2340, %f28 = ff0000ff
	lda	[%i3+%o5]0x80,%f28	! %f28 = 18fb2340
!	Mem[0000000030081408] = 00000000, %l1 = ffffffffff000000
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = ffffdb6f, %l2 = fffd05829f46294f
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffdb6f
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000000000f7
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 000000ff
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l4 = 0002fa7d60b9d3fd, Mem[00000000100c1408] = 5f000000
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = fd000000
!	Mem[0000000030041400] = 7f800000 ff0000ff f773c922 00000000
!	%f16 = d9862e5f 59109b77 f773c922 ff000000
!	%f20 = a4c9d13d ff0000ff 000000d9 000000ff
!	%f24 = 99048f69 ff0000ff ffff00ff ff000000
!	%f28 = 18fb2340 7f800000 ff007b7f 000080ff
	stda	%f16,[%i1+%g0]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l4 = 0002fa7d60b9d3fd, Mem[0000000020800040] = 6ff6bea0
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = d3fdbea0
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l2 = ffffffffffffdb6f, %l7 = fe02fdff01fe0001, %l3 = 00000000779b1059
	orn	%l2,%l7,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = 0000005f, %l7 = fe02fdff01fe0001
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 0e11005f, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 000000000000000e
!	Mem[0000000010181400] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000100c1400] = 00000000, %l0 = 000000000000000e
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffdb6f, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffdb6f
!	Mem[00000000211c0000] = 000040d0, %l1 = 00000000ffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	%l6 = 000000005f649d53, %l6 = 000000005f649d53, %l5  = 00000000000000ff
	mulx	%l6,%l6,%l5		! %l5 = 238bd44ee386e8e9
!	Mem[0000000010081418] = 0000001859109b77, %f8  = f6f9ffff 00000000, %asi = 80
	ldda	[%i2+0x018]%asi,%f8 	! %f8  = 00000018 59109b77
!	Mem[0000000020800000] = 57ffb870, %l6 = 000000005f649d53
	lduh	[%o1+%g0],%l6		! %l6 = 00000000000057ff
!	Mem[0000000010081408] = 7f800000, %l6 = 00000000000057ff
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 000000007f800000
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030041410] = 3dd1c9a4, %l7 = ffffffffffffdb6f
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 000000000000c9a4
!	Mem[0000000030081400] = 779b105922c973ff, %f28 = 18fb2340 7f800000
	ldda	[%i2+%g0]0x89,%f28	! %f28 = 779b1059 22c973ff
!	Mem[00000000300c1408] = 524e1aef, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 00000000524e1aef
!	Mem[0000000010081428] = 5f649d53, %l1 = 0000000000000000, %asi = 80
	ldsba	[%i2+0x028]%asi,%l1	! %l1 = 000000000000005f

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffdb6f, Mem[0000000010081408] = 7f800000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffdb6f
!	%l0 = 00000000524e1aef, Mem[0000000010001400] = 000080ff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00001aef
!	%f30 = ff007b7f 000080ff, Mem[0000000030141408] = 000000ff bbfb8734
	stda	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = ff007b7f 000080ff
!	Mem[0000000030101408] = 779b0000, %l6 = 000000007f800000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000077
!	Mem[00000000201c0001] = 00e52e40, %l0 = 00000000524e1aef
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000e5
!	Mem[0000000030081408] = 00000000, %l2 = 00000000ffffdb6f
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00002e5f 687d0840 57000000 00000000
!	%f16 = d9862e5f 59109b77 f773c922 ff000000
!	%f20 = a4c9d13d ff0000ff 000000d9 000000ff
!	%f24 = 99048f69 ff0000ff ffff00ff ff000000
!	%f28 = 779b1059 22c973ff ff007b7f 000080ff
	stda	%f16,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[0000000030081400] = ff73c922 59109b77 ffffdb6f 22c973f7
!	%f16 = d9862e5f 59109b77 f773c922 ff000000
!	%f20 = a4c9d13d ff0000ff 000000d9 000000ff
!	%f24 = 99048f69 ff0000ff ffff00ff ff000000
!	%f28 = 779b1059 22c973ff ff007b7f 000080ff
	stda	%f16,[%i2+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030081400
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010041400] = 779b1059, %l0 = 00000000000000e5
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000077
!	%l3 = ffffffffffffffff, Mem[0000000010081408] = ff0000ff6fdbffff
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffffffffffff

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = fd000000 ff000000, %l0 = 00000077, %l1 = 0000005f
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000fd000000 00000000ff000000
!	%f3  = d90000ff, %f23 = 000000ff
	fcmps	%fcc1,%f3 ,%f23		! %fcc1 = 1
!	%f29 = 22c973ff, %f7  = 3dd1c924, %f27 = ff000000
	fdivs	%f29,%f7 ,%f27		! %f27 = 2475d4f0
!	Mem[00000000100c1408] = 000000ff000000fd, %l6 = 0000000000000077
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = 000000ff000000fd
!	Mem[00000000100c1430] = ff0000ff 6d6177cb, %l2 = 00000000, %l3 = ffffffff
	ldd	[%i3+0x030],%l2		! %l2 = 00000000ff0000ff 000000006d6177cb
!	Mem[00000000300c1400] = 05711cff, %l4 = 0002fa7d60b9d3fd
	ldsba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000005
!	Mem[00000000300c1400] = ff1c7105, %l4 = 0000000000000005
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000007105
!	Mem[0000000010141438] = 0a356fff, %l0 = 00000000fd000000, %asi = 80
	ldswa	[%i5+0x038]%asi,%l0	! %l0 = 000000000a356fff
!	Mem[0000000030141410] = e5000cd1, %f26 = ffff00ff
	lda	[%i5+%o5]0x81,%f26	! %f26 = e5000cd1
!	Mem[0000000020800041] = d3fdbea0, %l2 = 00000000ff0000ff
	ldsb	[%o1+0x041],%l2		! %l2 = fffffffffffffffd

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l2 = fffffffd, %l3 = 6d6177cb, Mem[0000000010081410] = 9ac6005f 000000d9
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = fffffffd 6d6177cb
!	%l0 = 000000000a356fff, Mem[0000000010141408] = 00000000000000e5
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000a356fff
!	%l6 = 000000ff000000fd, Mem[000000001004143e] = 7f7b00ff, %asi = 80
	stba	%l6,[%i1+0x03e]%asi	! Mem[000000001004143c] = 7f7bfdff
!	Mem[0000000030101410] = ff00005f, %l6 = 00000000000000fd
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ff00005f
!	Mem[00000000100c1410] = 4023fb18, %l3 = 000000006d6177cb
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000018
!	%l0 = 000000000a356fff, Mem[0000000010041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 0a356fff
!	%f15 = ff5700e8, Mem[00000000100c1408] = 000000fd
	sta	%f15,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff5700e8
!	%f24 = 99048f69 ff0000ff, Mem[0000000010101408] = e8ff00ff d9000000
	stda	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = 99048f69 ff0000ff
!	%f4  = e8000000 000000ff, Mem[0000000010081418] = 00000018 59109b77
	std	%f4 ,[%i2+0x018]	! Mem[0000000010081418] = e8000000 000000ff
!	%f6  = 39292a24, %f15 = ff5700e8
	fcmpes	%fcc1,%f6 ,%f15		! %fcc1 = 2

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000ff000000
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 3f807a7f, %l0 = 000000000a356fff
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000003f80
!	%l5 = 238bd44ee386e8e9, imm = fffffffffffffc9b, %l0 = 0000000000003f80
	subc	%l5,-0x365,%l0		! %l0 = 238bd44ee386ec4e
!	Mem[0000000030141410] = e5000cd1, %l1 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = ffffffffe5000cd1
!	Mem[0000000010101408] = 698f0499, %l6 = 00000000ff00005f
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000499
!	Mem[0000000030001408] = 1197ffff, %l7 = 000000000000c9a4
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000011
!	Mem[0000000030141400] = 000000ffffffffff, %f26 = e5000cd1 2475d4f0
	ldda	[%i5+%g0]0x81,%f26	! %f26 = 000000ff ffffffff
!	Mem[00000000300c1400] = 05711cff ff5700e8, %l6 = 00000499, %l7 = 00000011
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000005711cff 00000000ff5700e8
!	Mem[0000000030181408] = 5f2e86d9, %l7 = 00000000ff5700e8
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 000000005f2e86d9
!	Mem[0000000030101410] = 35000000fd000000, %l6 = 0000000005711cff
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 35000000fd000000

p0_label_155:
!	Starting 10 instruction Store Burst
!	%f8  = 00000018, Mem[0000000010181408] = 539d645f
	sta	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000018
!	%l3 = 0000000000000018, Mem[00000000300c1408] = ef1a4e52
	stha	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00184e52
!	Mem[00000000300c1400] = ff1c7105, %l3 = 0000000000000018
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 00000000ff1c7105
!	Mem[00000000100c1400] = 000000ff, %l3 = 00000000ff1c7105
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f8  = 00000018 59109b77, Mem[0000000030101408] = ff9b0000 000011ff
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000018 59109b77
!	%l6 = 35000000fd000000, Mem[0000000010101414] = 00000000, %asi = 80
	stwa	%l6,[%i4+0x014]%asi	! Mem[0000000010101414] = fd000000
!	Mem[0000000010141424] = 48de7021, %l2 = 00000000fffffffd
	swap	[%i5+0x024],%l2		! %l2 = 0000000048de7021
!	Mem[0000000030041400] = d9862e5f, %l4 = 0000000000007105
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 00000000d9862e5f
!	Mem[0000000030001410] = fffff377, %l1 = 00000000e5000cd1
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000fffff377
!	%l5 = 238bd44ee386e8e9, Mem[0000000010181404] = 8ef9ff41
	sth	%l5,[%i6+0x004]		! Mem[0000000010181404] = e8e9ff41

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l0 = 238bd44ee386ec4e
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000300c1400] = e80057ff 00000018, %l6 = fd000000, %l7 = 5f2e86d9
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000018 00000000e80057ff
!	%l0 = ff000000, %l1 = fffff377, Mem[00000000300c1410] = 00000000 00000000
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000 fffff377
!	Mem[0000000010081400] = 5f0011ff, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000 fffff377, %l6 = 00000018, %l7 = e80057ff
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000fffff377
!	Mem[0000000010081408] = ffffffff, %l3 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000000000e8, %l1 = 00000000fffff377
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000e8
!	Mem[0000000030041410] = 3dd1c9a4, %l3 = ffffffffffffffff
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 000000000000c9a4
!	Mem[0000000030101410] = 35000000 fd000000, %l2 = 48de7021, %l3 = 0000c9a4
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000fd000000 0000000035000000
!	Mem[00000000201c0000] = 00ff2e40, %l3 = 0000000035000000
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff

p0_label_157:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff000000, Mem[00000000100c143a] = ff007b7f
	sth	%l0,[%i3+0x03a]		! Mem[00000000100c1438] = ff000000
!	Mem[0000000010101400] = 000000ff, %l2 = 00000000fd000000
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000218000c0] = ff352190, %l6 = 00000000ff000000
	ldstub	[%o3+0x0c0],%l6		! %l6 = 00000000000000ff
!	%f8  = 00000018 59109b77, %f7  = 3dd1c924
	fdtoi	%f8 ,%f7 		! tt=0x22, %l0 = 00000000ff000022
!	%f5  = 000000ff, %f27 = ffffffff
	fcmps	%fcc0,%f5 ,%f27		! %fcc0 = 3
!	%f21 = ff0000ff, %f29 = 22c973ff
	fcmps	%fcc0,%f21,%f29		! %fcc0 = 1
!	%l0 = 00000000ff000022, Mem[0000000030181408] = 5f2e86d9
	stha	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 5f2e0022
!	%f24 = 99048f69 ff0000ff, %l4 = 00000000d9862e5f
!	Mem[00000000300c1430] = 08a54df465624db5
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_S ! Mem[00000000300c1430] = 08044d69ff0000ff
!	Mem[0000000010001400] = 00001aef, %l4 = 00000000d9862e5f
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ef
!	Mem[0000000030081410] = ff0000ff, %l0 = 00000000ff000022
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000ff0000ff

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff6f350a, %l6 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 00000000ff6f350a
!	%f1  = ffffffff, %f1  = ffffffff, %f8  = 00000018
	fsubs	%f1 ,%f1 ,%f8 		! %f8  = ffffffff
!	Code Fragment 4, seed = 219214
p0_fragment_14:
!	%l0 = 00000000ff0000ff
	setx	0xc1faecdb326c63b6,%g7,%l0 ! %l0 = c1faecdb326c63b6
!	%l1 = 00000000000000e8
	setx	0xed2cdbb6695202e1,%g7,%l1 ! %l1 = ed2cdbb6695202e1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c1faecdb326c63b6
	setx	0x8b891d221315161c,%g7,%l0 ! %l0 = 8b891d221315161c
!	%l1 = ed2cdbb6695202e1
	setx	0x415ecb531d58a067,%g7,%l1 ! %l1 = 415ecb531d58a067
p0_fragment_14_end:
!	Mem[0000000010041438] = ff800000, %l2 = 00000000000000ff
	lduw	[%i1+0x038],%l2		! %l2 = 00000000ff800000
!	Mem[0000000010041408] = ff6f350a, %l0 = 8b891d221315161c
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 00000000ff6f350a
!	Mem[0000000010101400] = ff000000 00000000, %l6 = ff6f350a, %l7 = fffff377
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010001408] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = ff00000000000000
!	Mem[0000000021800180] = 14196020, %l2 = 00000000ff800000
	ldub	[%o3+0x180],%l2		! %l2 = 0000000000000014
!	Mem[00000000300c1408] = 00184e52, %l6 = 00000000ff000000
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000184e52
!	Mem[0000000010081402] = ff11005f, %l1 = 415ecb531d58a067
	ldstub	[%i2+0x002],%l1		! %l1 = 0000000000000000

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000014, Mem[0000000030181410] = ff58d628
	stha	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 0014d628
!	Mem[0000000010081404] = ff0000ff, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x004]%asi,%l3	! %l3 = 00000000ff0000ff
!	%l6 = 0000000000184e52, Mem[0000000030081400] = 779b10595f2e86d9
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000184e52
!	Mem[0000000030181400] = ffff00ff, %l3 = 00000000ff0000ff
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ffff00ff
!	Mem[0000000010101410] = 000057ff, %l3 = 00000000ffff00ff
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000057ff
!	Mem[0000000010041408] = 0a356fff, %l0 = 00000000ff6f350a
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 000000000000000a
!	%l6 = 0000000000184e52, %l4 = 00000000000000ef, %l0 = 000000000000000a
	addc	%l6,%l4,%l0		! %l0 = 0000000000184f41
!	Mem[0000000030081408] = 000000ff, %l2 = 0000000000000014
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%f1  = ffffffff, Mem[0000000010101410] = ff00ffff
	sta	%f1 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff
!	%l2 = 000000ff, %l3 = 000057ff, Mem[0000000030041408] = f773c922 ff000000
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff 000057ff

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = d10c00e5, %f30 = ff007b7f
	lda	[%i0+%o5]0x81,%f30	! %f30 = d10c00e5
!	Mem[0000000030141410] = e5000cd1, %l6 = 0000000000184e52
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000e500
!	Mem[0000000030041410] = 3dd1c9a4, %l0 = 0000000000184f41
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 000000003dd1c9a4
!	Mem[0000000030141410] = e5000cd1, %l6 = 000000000000e500
	lduwa	[%i5+%o5]0x81,%l6	! %l6 = 00000000e5000cd1
!	Mem[0000000030101400] = 6fdbffff, %l2 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041438] = ff8000007f7bfdff, %l0 = 000000003dd1c9a4, %l7 = ff00000000000000
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ff8000007f7bfdff
!	Mem[0000000030041410] = a4c9d13d, %l3 = 00000000000057ff
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000a4c9d13d
!	Mem[0000000030001410] = d10c00e5ff110000, %f24 = 99048f69 ff0000ff
	ldda	[%i0+%o5]0x81,%f24	! %f24 = d10c00e5 ff110000
!	Mem[00000000100c1418] = 034400009ac69e02, %l6 = 00000000e5000cd1, %asi = 80
	ldxa	[%i3+0x018]%asi,%l6	! %l6 = 034400009ac69e02
!	Mem[0000000030041410] = a4c9d13d, %l0 = 000000003dd1c9a4
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = ffffffffa4c9d13d

p0_label_161:
!	Starting 10 instruction Store Burst
!	%f2  = 524e1aef, Mem[0000000010101410] = ffffffff
	sta	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 524e1aef
!	%f8  = ffffffff 59109b77, %l4 = 00000000000000ef
!	Mem[0000000010041418] = ff000000d9000000
	add	%i1,0x018,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_P ! Mem[0000000010041418] = ffffffff59109b77
!	Mem[0000000010041400] = ff9b1059, %l7 = 000000007f7bfdff
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ff9b1059
!	%l3 = 00000000a4c9d13d, Mem[0000000010141408] = ff6f350a
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = d13d350a
!	%l6 = 034400009ac69e02, %l5 = 238bd44ee386e8e9, %l5 = 238bd44ee386e8e9
	xnor	%l6,%l5,%l5		! %l5 = df302bb186bf8914
!	Mem[0000000010041410] = ff0000ff, %l4 = 00000000000000ef
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010141403] = 3f807a7f, %l5 = df302bb186bf8914
	ldstub	[%i5+0x003],%l5		! %l5 = 000000000000007f
!	Mem[0000000030141410] = e5000cd1, %l7 = 00000000ff9b1059
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000e5000cd1
!	%l3 = 00000000a4c9d13d, Mem[00000000211c0000] = 000040d0, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = d13d40d0
!	%l0 = ffffffffa4c9d13d, Mem[0000000030081408] = 00000014
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 3d000014

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff ffffffff, %l2 = 000000ff, %l3 = a4c9d13d
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010041410] = 000000ef, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 7f7bfdff, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000007f
!	Mem[0000000010181400] = 000000ff, %l3 = 00000000ffffffff
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000018, %f12 = ff116c60
	lda	[%i3+%g0]0x89,%f12	! %f12 = 00000018
!	Mem[0000000030101408] = 00000018, %l2 = 000000000000007f
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000018
!	Mem[0000000020800040] = d3fdbea0, %l5 = 000000000000007f
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffd3fd
!	Mem[0000000030001410] = 000011ffe5000cd1, %f30 = d10c00e5 000080ff
	ldda	[%i0+%o5]0x89,%f30	! %f30 = 000011ff e5000cd1
!	Mem[00000000201c0000] = 00ff2e40, %l0 = ffffffffa4c9d13d, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 57000000524e1800, %l4 = 00000000ff0000ff
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = 57000000524e1800

p0_label_163:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 659088
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0xaa8f3b2529ca93a6,%g7,%l0 ! %l0 = aa8f3b2529ca93a6
!	%l1 = 0000000000000000
	setx	0x426518b8c20befd1,%g7,%l1 ! %l1 = 426518b8c20befd1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa8f3b2529ca93a6
	setx	0x6dd2bc0f06e2300c,%g7,%l0 ! %l0 = 6dd2bc0f06e2300c
!	%l1 = 426518b8c20befd1
	setx	0x89127093a1155757,%g7,%l1 ! %l1 = 89127093a1155757
p0_fragment_15_end:
!	Mem[0000000030141410] = ff9b1059, %l6 = 000000009ac69e02
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000ff9b1059
!	%l6 = 00000000ff9b1059, Mem[0000000010001408] = ff000000
	stba	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 59000000
!	%f14 = 05711cff ff5700e8, Mem[0000000010101400] = ff000000 00000000
	std	%f14,[%i4+%g0]		! Mem[0000000010101400] = 05711cff ff5700e8
!	Mem[0000000010141404] = 5f2e86d9, %l7 = 00000000e5000cd1, %asi = 80
	swapa	[%i5+0x004]%asi,%l7	! %l7 = 000000005f2e86d9
!	Mem[0000000030041408] = ff000000, %l0 = 0000000006e2300c
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000ff000000
!	%f6  = 39292a24 3dd1c924, %l1 = 89127093a1155757
!	Mem[00000000100c1400] = ff00000059109b77
	stda	%f6,[%i3+%l1]ASI_PST16_PL ! Mem[00000000100c1400] = 24c9d13d242a9b77
!	Mem[00000000300c1400] = 18000000, %l1 = 00000000a1155757
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000018000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = ef000000
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ef000000
!	%f18 = f773c922 ff000000, %l0 = 00000000ff000000
!	Mem[0000000010001438] = bbfb8734b2999711
	add	%i0,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001438] = bbfb8734b2999711

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l4 = 57000000524e1800
	ldub	[%i2+%o4],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 00000000 000000e8, %l4 = 000000ff, %l5 = ffffd3fd
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000000000e8
!	Mem[0000000030141400] = ffffffffff000000, %l0 = 00000000ff000000
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c1400] = 24c9d13d242a9b77, %l5 = 00000000000000e8, %asi = 80
	ldxa	[%i3+0x000]%asi,%l5	! %l5 = 24c9d13d242a9b77
!	Mem[0000000030041410] = a4c9d13d, %f16 = d9862e5f
	lda	[%i1+%o5]0x81,%f16	! %f16 = a4c9d13d
!	Mem[0000000010141410] = e557ee45 ff6f0000, %l6 = ff9b1059, %l7 = 5f2e86d9
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000ff6f0000 00000000e557ee45
!	Mem[000000001018143e] = ff1c7105, %l4 = 0000000000000000
	ldsh	[%i6+0x03e],%l4		! %l4 = 0000000000007105
!	Mem[0000000010141410] = 00006fff, %l1 = 0000000018000000
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000006fff
!	Mem[0000000030001410] = d10c00e5 ff110000, %l2 = 00000018, %l3 = 00000000
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000d10c00e5 00000000ff110000
!	Mem[0000000030181410] = 0014d628, %l0 = ffffffffff000000
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000006fff, Mem[00000000300c1410] = ff000000
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
!	%l7 = 00000000e557ee45, Mem[0000000030081400] = 00000000
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ee45
!	Mem[0000000010101400] = ff1c7105, %l2 = 00000000d10c00e5
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000005
!	Mem[0000000010141408] = 0a353dd1, %l6 = 00000000ff6f0000
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 000000000a353dd1
!	%l6 = 000000000a353dd1, Mem[0000000010001400] = ff1a0000ff000000
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000a353dd1
!	%l4 = 0000000000007105, Mem[0000000030101400] = 6fdbffff
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 6fdb7105
!	%l4 = 0000000000007105, Mem[0000000010141408] = 00006fff
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00007105
!	Mem[0000000030081410] = ff000022, %l1 = 0000000000006fff
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000ff000022
!	%l2 = 0000000000000005, Mem[00000000201c0000] = 00ff2e40, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00052e40
!	Mem[000000001014141d] = 00000000, %l4 = 0000000000007105
	ldstub	[%i5+0x01d],%l4		! %l4 = 0000000000000000

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 28d61400, %l2 = 0000000000000005
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff356fff 22c973f7, %l2 = 00000000, %l3 = ff110000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff356fff 0000000022c973f7
!	Mem[0000000010081410] = fdffffff, %l7 = 00000000e557ee45
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = fffffffffffffdff
!	Mem[00000000300c1408] = 00184e52, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000018
!	Mem[0000000010001408] = 59000000, %l3 = 0000000022c973f7, %asi = 80
	lduwa	[%i0+0x008]%asi,%l3	! %l3 = 0000000059000000
!	Mem[0000000010081400] = ff11ff5f, %l7 = fffffffffffffdff
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff11ff5f
!	Mem[0000000010041420] = ff0000ff, %l7 = 00000000ff11ff5f, %asi = 80
	lduha	[%i1+0x020]%asi,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030181400] = ff0000ff, %l1 = 00000000ff000022
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000030101400] = 000000006fdb7105, %f16 = a4c9d13d 59109b77
	ldda	[%i4+%g0]0x89,%f16	! %f16 = 00000000 6fdb7105
!	Mem[000000001008141f] = 000000ff, %l7 = 000000000000ff00
	ldub	[%i2+0x01f],%l7		! %l7 = 00000000000000ff

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l6 = 0a353dd1, %l7 = 000000ff, Mem[0000000010141410] = ff6f0000 e557ee45
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0a353dd1 000000ff
!	%l4 = 0000000000000000, Mem[0000000030101408] = 779b105918000000
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030081410] = ff6f0000
	stba	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 006f0000
!	Mem[0000000030101400] = 0571db6f, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 000000000571db6f
!	%f2  = 524e1aef d90000ff, %l0 = 0000000000000018
!	Mem[0000000010181420] = 00000000fffff9f6
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181420] = 000000d9effff9f6
!	%l5 = 24c9d13d242a9b77, Mem[0000000010081410] = fffffffd
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 242a9b77
!	Mem[000000001018140c] = 9ac69e02, %l0 = 0000000000000018, %asi = 80
	swapa	[%i6+0x00c]%asi,%l0	! %l0 = 000000009ac69e02
!	Mem[0000000010041408] = ff356fff, %l0 = 000000009ac69e02
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff356fff
!	%l7 = 00000000000000ff, Mem[00000000211c0001] = d13d40d0, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = d1ff40d0
!	%f1  = ffffffff, %f24 = d10c00e5, %f19 = ff000000
	fadds	%f1 ,%f24,%f19		! %f19 = ffffffff

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 029ec69a, %f24 = d10c00e5
	lda	[%i1+%o4]0x88,%f24	! %f24 = 029ec69a
!	Mem[0000000010181408] = 00000018, %l4 = 000000000571db6f
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000018
!	Mem[0000000010101420] = 0000ffe80000ff4b, %l6 = 000000000a353dd1, %asi = 80
	ldxa	[%i4+0x020]%asi,%l6	! %l6 = 0000ffe80000ff4b
!	Mem[0000000010181410] = 00000000 000000e8, %l2 = ff356fff, %l3 = 59000000, %asi = 80
	ldda	[%i6+0x010]%asi,%l2	! %l2 = 0000000000000000 00000000000000e8
!	Mem[0000000010001410] = ff00000000000000, %f28 = 779b1059 22c973ff
	ldda	[%i0+%o5]0x80,%f28	! %f28 = ff000000 00000000
!	Mem[0000000030181400] = ff0000ff, %l0 = 00000000ff356fff
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030181410] = 00000000 28d61400, %l4 = 00000018, %l5 = 242a9b77
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 0000000028d61400 0000000000000000
!	Mem[0000000010001410] = ff000000, %f1  = ffffffff
	lda	[%i0+%o5]0x80,%f1 	! %f1 = ff000000
!	Mem[0000000010101400] = ff711cffff5700e8, %l0 = 000000000000ff00
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = ff711cffff5700e8
!	Mem[0000000010141430] = 00000fac, %l7 = 00000000000000ff
	ldsw	[%i5+0x030],%l7		! %l7 = 0000000000000fac

p0_label_169:
!	Starting 10 instruction Store Burst
!	%l6 = 0000ff4b, %l7 = 00000fac, Mem[0000000030101408] = 00000000 00000000
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff4b 00000fac
!	Mem[00000000100c1438] = ff000000000080ff, %l2 = 0000000000000000, %l4 = 0000000028d61400
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = ff000000000080ff
!	%l4 = ff000000000080ff, Mem[0000000030101408] = 4bff0000
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 4bff80ff
!	Mem[00000000100c1400] = 24c9d13d, %l1 = 00000000ff0000ff
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000024c9d13d
!	%f22 = 000000d9 000000ff, Mem[0000000010001408] = 00000059 00000000
	stda	%f22,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000d9 000000ff
!	%l5 = 0000000000000000, Mem[0000000010141408] = 05710000
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 05710000
!	%l7 = 0000000000000fac, Mem[0000000010141410] = 0a353dd1
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000fac
!	Mem[0000000010041408] = 029ec69a, %l4 = 00000000000080ff
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000029ec69a
!	Code Fragment 4, seed = 991900
p0_fragment_16:
!	%l0 = ff711cffff5700e8
	setx	0xe6b09b94a5afbf46,%g7,%l0 ! %l0 = e6b09b94a5afbf46
!	%l1 = 0000000024c9d13d
	setx	0x68a4e0a94109c971,%g7,%l1 ! %l1 = 68a4e0a94109c971
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e6b09b94a5afbf46
	setx	0x919b2a418db157ac,%g7,%l0 ! %l0 = 919b2a418db157ac
!	%l1 = 68a4e0a94109c971
	setx	0x5db15fe2fb8c6cf7,%g7,%l1 ! %l1 = 5db15fe2fb8c6cf7
p0_fragment_16_end:
!	%l4 = 00000000029ec69a, Mem[00000000201c0001] = 00052e40
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 009a2e40

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l3 = 00000000000000e8
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = 1400003d, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = 000000000000003d
!	Mem[00000000300c1408] = 00184e52, %l7 = 0000000000000fac
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 99048f69, %l6 = 0000ffe80000ff4b
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 0000000099048f69
!	Mem[0000000030001400] = ff9b1059, %l3 = ffffffffffffffff
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff9b1059
!	Mem[0000000030041400] = 779b1059 05710000, %l2 = 00000000, %l3 = ff9b1059
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000005710000 00000000779b1059
!	Mem[0000000021800000] = d0623f00, %l5 = 000000000000003d
	ldub	[%o3+%g0],%l5		! %l5 = 00000000000000d0
!	%l6 = 0000000099048f69, %l4 = 00000000029ec69a, %l4 = 00000000029ec69a
	or	%l6,%l4,%l4		! %l4 = 000000009b9ecffb
!	Mem[0000000030081400] = 524e1800 0000ee45, %l6 = 99048f69, %l7 = 00000000
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 000000000000ee45 00000000524e1800
!	Mem[0000000030141400] = ff000000, %l5 = 00000000000000d0
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = ffffffffff000000

p0_label_171:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 05710000, %l1 = 00000000fb8c6cf7
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000005710000
!	%f22 = 000000d9 000000ff, %l5 = ffffffffff000000
!	Mem[0000000030041410] = a4c9d13dff0000ff
	add	%i1,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041410] = a4c9d13dff0000ff
!	%l5 = ffffffffff000000, Mem[0000000030001400] = 59109bff
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 59109b00
!	%l5 = ffffffffff000000, Mem[0000000010181408] = 1800000000000018
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffff000000
!	%f22 = 000000d9 000000ff, Mem[0000000010181408] = ffffffff 000000ff
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000d9 000000ff
!	%l6 = 000000000000ee45, Mem[0000000010081410] = 779b2a24
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ee45
!	Mem[0000000030081410] = 00006f00, %l1 = 0000000005710000
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 0000000000006f00
!	%f2  = 524e1aef d90000ff, %l7 = 00000000524e1800
!	Mem[00000000300c1428] = 537ade060a316a3f
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1428] = 537ade060a316a3f
!	%f14 = 05711cff ff5700e8, %l4 = 000000009b9ecffb
!	Mem[0000000010081410] = 0000ee45cb77616d
	add	%i2,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010081410] = e80057ffff1c7105
!	%f4  = e8000000, %f15 = ff5700e8
	fsqrts	%f4 ,%f15		! %f15 = 7fffffff

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 9ac69e02, %l6 = 000000000000ee45
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffff9ac6
!	Mem[0000000010081428] = 5f649d53, %l3 = 00000000779b1059
	lduw	[%i2+0x028],%l3		! %l3 = 000000005f649d53
!	Mem[0000000030101410] = fd000000, %l4 = 000000009b9ecffb
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 45ee0000, %l7 = 00000000524e1800
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000045
!	Mem[0000000030041408] = ff57000006e2300c, %f6  = 39292a24 3dd1c924
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = ff570000 06e2300c
!	Mem[0000000030181410] = 28d61400, %f27 = ffffffff
	lda	[%i6+%o5]0x89,%f27	! %f27 = 28d61400
!	Mem[0000000010001408] = ff000000, %l6 = ffffffffffff9ac6
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1410] = 4023fbff, %l2 = 0000000005710000
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = ffffffffffffffff, %l1 = 0000000000006f00
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = 0014d628, %f16 = 00000000
	lda	[%i6+%o5]0x81,%f16	! %f16 = 0014d628

p0_label_173:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = ff73c922, %l7 = 0000000000000045
	ldstuba	[%i1+0x030]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 1197ffff, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 000000001197ffff
!	%f22 = 000000d9 000000ff, Mem[0000000010001400] = 00000000 d13d350a
	stda	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000d9 000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010181410] = 00000000, %l6 = 00000000ff000000
	ldstub	[%i6+%o5],%l6		! %l6 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000030041410] = a4c9d13d
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ffd13d
!	%l5 = ffffffffff000000, Mem[0000000030001408] = 00006fff00000000
	stxa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffff000000
!	%f9  = 59109b77, %f25 = ff110000
	fcmpes	%fcc0,%f9 ,%f25		! %fcc0 = 2
!	Mem[00000000100c141b] = 03440000, %l2 = 00000000000000ff
	ldstub	[%i3+0x01b],%l2		! %l2 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081410] = 05710000
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 524e1800, %l6 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = 00000000524e1800
!	Mem[0000000010081410] = ff5700e8, %l6 = 00000000524e1800
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff5700e8
!	Mem[0000000010141410] = ac0f0000 ff000000, %l0 = 8db157ac, %l1 = ffffffff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ac0f0000 00000000ff000000
!	Mem[0000000010081410] = 05711cffff5700e8, %l4 = 000000001197ffff
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 05711cffff5700e8
!	Mem[0000000030141400] = 000000ff ffffffff, %l6 = ff5700e8, %l7 = 000000ff
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff 00000000ffffffff
!	Mem[00000000100c1428] = 5f649d53 a63e7500, %l4 = ff5700e8, %l5 = ff000000
	ldd	[%i3+0x028],%l4		! %l4 = 000000005f649d53 00000000a63e7500
!	Mem[0000000030141410] = ffffffff029ec69a, %f30 = 000011ff e5000cd1
	ldda	[%i5+%o5]0x89,%f30	! %f30 = ffffffff 029ec69a
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l6 = 00000000000000ff
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010101424] = 0000ff4b, %l1 = 00000000ff000000
	ldub	[%i4+0x024],%l1		! %l1 = 0000000000000000

p0_label_175:
!	Starting 10 instruction Store Burst
!	%f18 = f773c922 ffffffff, Mem[0000000010001400] = ff000000 d9000000
	stda	%f18,[%i0+%g0]0x80	! Mem[0000000010001400] = f773c922 ffffffff
!	Mem[00000000100c141f] = 9ac69e02, %l7 = 00000000ffffffff
	ldstuba	[%i3+0x01f]%asi,%l7	! %l7 = 0000000000000002
!	%l5 = 00000000a63e7500, Mem[0000000010041400] = 7f7bfdff
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 7500fdff
!	Mem[0000000030041400] = f76c8cfb, %l3 = 000000005f649d53
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000f76c8cfb
!	Mem[000000001018141c] = 242a2939, %l2 = 00000000000000ff
	swap	[%i6+0x01c],%l2		! %l2 = 00000000242a2939
!	%f28 = ff000000 00000000, %l0 = 00000000ac0f0000
!	Mem[0000000030041438] = ff007b7f000080ff
	add	%i1,0x038,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030041438] = ff007b7f000080ff
!	Mem[0000000030041400] = 539d645f, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 000000000000005f
!	%l7 = 0000000000000002, Mem[00000000100c1406] = 242a9b77, %asi = 80
	stba	%l7,[%i3+0x006]%asi	! Mem[00000000100c1404] = 242a0277
!	Mem[0000000010141421] = 53647718, %l0 = 00000000ac0f0000
	ldstub	[%i5+0x021],%l0		! %l0 = 0000000000000064
!	%f4  = e8000000, Mem[000000001008141c] = 000000ff
	sta	%f4 ,[%i2+0x01c]%asi	! Mem[000000001008141c] = e8000000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000ee45, %f5  = 000000ff
	lda	[%i2+%g0]0x89,%f5 	! %f5 = 0000ee45
!	Mem[00000000300c1408] = 00184e5200000057, %l6 = 000000000000ff00
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 00184e5200000057
!	Mem[0000000010001410] = 000000ff, %l0 = 0000000000000064
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %f10 = a7427f46
	lda	[%i0+%o5]0x80,%f10	! %f10 = ff000000
!	Mem[0000000010141408] = 05710000, %l2 = 00000000242a2939
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1433] = ff0000ff, %l3 = 00000000f76c8cfb
	ldsb	[%i3+0x033],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = 59109b00, %l1 = 000000000000005f
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 0000000059109b00
!	Code Fragment 3, seed = 527294
p0_fragment_17:
!	%l0 = 00000000000000ff
	setx	0xdde31a9308853836,%g7,%l0 ! %l0 = dde31a9308853836
!	%l1 = 0000000059109b00
	setx	0x8a79d932f40caf61,%g7,%l1 ! %l1 = 8a79d932f40caf61
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dde31a9308853836
	setx	0x6930c4db37aa1a9c,%g7,%l0 ! %l0 = 6930c4db37aa1a9c
!	%l1 = 8a79d932f40caf61
	setx	0x855b380e85987ce7,%g7,%l1 ! %l1 = 855b380e85987ce7
p0_fragment_17_end:
!	Mem[0000000030041408] = 06e2300c, %l6 = 00184e5200000057
	lduha	[%i1+%o4]0x89,%l6	! %l6 = 000000000000300c
!	Mem[0000000030081400] = 45ee0000, %l7 = 0000000000000002
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000045

p0_label_177:
!	Starting 10 instruction Store Burst
!	%f2  = 524e1aef, Mem[0000000030141410] = 9ac69e02
	sta	%f2 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 524e1aef
!	Mem[0000000030041408] = 0c30e206, %l1 = 0000000085987ce7
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 000000000c30e206
!	%l2 = 0000000000000000, Mem[0000000010101408] = ff0000ff698f0499
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
!	%l7 = 0000000000000045, Mem[0000000030081410] = 00000000
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000045
!	%l2 = 00000000, %l3 = ffffffff, Mem[00000000100c1408] = ff5700e8 000000ff
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffff
!	Mem[0000000010141400] = 3f807aff, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 000000003f807aff
!	Mem[000000001014143b] = 0a356fff, %l3 = ffffffffffffffff
	ldstub	[%i5+0x03b],%l3		! %l3 = 00000000000000ff
!	%l5 = 00000000a63e7500, Mem[0000000010101435] = 5d6e1e00
	stb	%l5,[%i4+0x035]		! Mem[0000000010101434] = 5d001e00
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000045
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 000000ef, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181436] = 606c11ff, %l6 = 000000000000300c
	lduh	[%i6+0x036],%l6		! %l6 = 00000000000011ff
!	Mem[0000000030181400] = ff0000ff, %f14 = 05711cff
	lda	[%i6+%g0]0x89,%f14	! %f14 = ff0000ff
!	Mem[0000000030081410] = 000000453dd1c9a4, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 000000453dd1c9a4
!	Mem[0000000010081408] = ffffffff, %f18 = f773c922
	lda	[%i2+%o4]0x80,%f18	! %f18 = ffffffff
!	Mem[0000000010181408] = 000000ff, %l4 = 000000005f649d53
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = 05711cffff5700e8, %l1 = 000000000c30e206
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = 05711cffff5700e8
!	Mem[0000000010141400] = 00000000, %f8  = ffffffff
	ld	[%i5+%g0],%f8 		! %f8 = 00000000
!	Mem[0000000030101410] = fd000000, %l1 = 05711cffff5700e8
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, imm = fffffffffffffca7, %l1 = 0000000000000000
	addc	%l7,-0x359,%l1		! %l1 = fffffffffffffca7
!	Mem[0000000030041410] = 00ffd13dff0000ff, %l1 = fffffffffffffca7
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 00ffd13dff0000ff

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l0 = 6930c4db37aa1a9c, Mem[0000000030001410] = 000011ffe5000cd1
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 6930c4db37aa1a9c
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 3d000014
	stba	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000014
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 779b1059539d64ff
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000ff
!	%f30 = ffffffff 029ec69a, Mem[0000000010041400] = 7500fdff 5f2e86d9
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff 029ec69a
!	%l7 = 0000000000000000, Mem[0000000030081410] = 45000000
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 45000000
!	%f28 = ff000000 00000000, %l1 = 00ffd13dff0000ff
!	Mem[0000000010081418] = e8000000e8000000
	add	%i2,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081418] = 00000000000000ff
!	Mem[0000000010101408] = 00000045, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000045
!	Mem[0000000010101430] = ff00ffff, %l3 = 000000003dd1c9a4, %asi = 80
	swapa	[%i4+0x030]%asi,%l3	! %l3 = 00000000ff00ffff
!	%l2 = 000000003f807aff, Mem[0000000030001410] = 9c1aaa37
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff1aaa37
!	%l2 = 000000003f807aff, Mem[0000000030101408] = 4bff80ff
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 4bff80ff

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %f23 = 000000ff
	lda	[%i1+%g0]0x88,%f23	! %f23 = ffffffff
!	Mem[000000001018140c] = d9000000, %l7 = 0000000000000000
	lduw	[%i6+0x00c],%l7		! %l7 = 00000000d9000000
!	%l4 = 0000000000000045, %l2 = 000000003f807aff, %y  = fe02fdff
	udiv	%l4,%l2,%l6		! %l6 = 00000000ffffffff
	mov	%l0,%y			! %y = 37aa1a9c
!	Mem[0000000030101410] = 000000fd, %l3 = 00000000ff00ffff
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000fd
!	Mem[0000000010001410] = ff00000000000000, %l5 = 00000000a63e7500
	ldx	[%i0+%o5],%l5		! %l5 = ff00000000000000
!	Mem[0000000010181400] = 41ffe9e8 ff000000, %l2 = 3f807aff, %l3 = 000000fd
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000ff000000 0000000041ffe9e8
!	Mem[0000000010141430] = 00000fac, %l6 = 00000000ffffffff
	ldsh	[%i5+0x030],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041438] = ff8000007f7bfdff, %l3 = 0000000041ffe9e8
	ldx	[%i1+0x038],%l3		! %l3 = ff8000007f7bfdff
!	Mem[0000000010001404] = ffffffff, %l1 = 00ffd13dff0000ff, %asi = 80
	ldsha	[%i0+0x004]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001014143e] = 392adb2b, %l0 = 6930c4db37aa1a9c
	lduh	[%i5+0x03e],%l0		! %l0 = 000000000000db2b

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 000000ff, %l3 = 000000007f7bfdff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = 000000000000db2b, Mem[0000000020800000] = 57ffb870
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = db2bb870
!	%l1 = ffffffffffffffff, Mem[0000000030141408] = ff007b7f000080ff
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000000045, %asi = 80
	swapa	[%i5+0x000]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000ff000000, Mem[00000000201c0000] = 009a2e40, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00002e40
!	%l5 = ff00000000000000, Mem[00000000100c1400] = ff0000ff
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	Code Fragment 4, seed = 314430
p0_fragment_18:
!	%l0 = 000000000000db2b
	setx	0x234c6f5853c7b436,%g7,%l0 ! %l0 = 234c6f5853c7b436
!	%l1 = ffffffffffffffff
	setx	0x0dd675496a766b61,%g7,%l1 ! %l1 = 0dd675496a766b61
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 234c6f5853c7b436
	setx	0x3f2d3f377197169c,%g7,%l0 ! %l0 = 3f2d3f377197169c
!	%l1 = 0dd675496a766b61
	setx	0x900303addca4b8e7,%g7,%l1 ! %l1 = 900303addca4b8e7
p0_fragment_18_end:
!	%f4  = e8000000, Mem[0000000010001410] = ff000000
	st	%f4 ,[%i0+%o5]		! Mem[0000000010001410] = e8000000
!	%l5 = ff00000000000000, Mem[0000000010001408] = ff000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f2  = 524e1aef d90000ff, Mem[0000000010001418] = 39292a24 80ff4671
	std	%f2 ,[%i0+0x018]	! Mem[0000000010001418] = 524e1aef d90000ff

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 6930c4db 37aa1aff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000037aa1aff 000000006930c4db
!	Mem[0000000010101410] = ef1a4e52, %l1 = 900303addca4b8e7
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000004e52
!	Mem[0000000010041410] = ff0000ef, %l5 = 000000006930c4db
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010101400] = ff711cff, %l5 = ffffffffffffff00
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffff71
!	Mem[0000000030001408] = 000000ffffffffff, %l1 = 0000000000004e52
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 000000ffffffffff
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000037aa1aff
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030041400] = ff000000, %f30 = ffffffff
	lda	[%i1+%g0]0x81,%f30	! %f30 = ff000000
!	Mem[00000000211c0000] = d1ff40d0, %l7 = 00000000d9000000
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffd1ff
!	Mem[0000000030041400] = 000000ff, %l4 = ffffffffffffff00
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff

p0_label_183:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffd1ff, %l3 = 00000000000000ff, %l5 = ffffffffffffff71
	udivx	%l7,%l3,%l5		! %l5 = 01010101010100d2
!	%f14 = ff0000ff, Mem[0000000010141410] = 00000fac
	sta	%f14,[%i5+%o5]0x88	! Mem[0000000010141410] = ff0000ff
!	%f18 = ffffffff ffffffff, Mem[0000000030081408] = 140000ff f773c922
	stda	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff ffffffff
!	Mem[00000000300c1408] = 524e1800, %l7 = ffffffffffffd1ff
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l0 = 3f2d3f377197169c, Mem[00000000300c1408] = 57000000524e18ff
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 3f2d3f377197169c
!	%l2 = 00000000ff000000, imm = 000000000000012e, %l0 = 3f2d3f377197169c
	addc	%l2,0x12e,%l0		! %l0 = 00000000ff00012e
!	Mem[0000000010141410] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030141410] = 524e1aef ffffffff
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff 00000000
!	%l0 = 00000000ff00012e, Mem[00000000100c1408] = ffffffff00000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000ff00012e
!	Mem[0000000010141400] = 00000045, %l5 = 00000000010100d2
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000045

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 000000ff, %l0 = 00000000ff00012e
	ldsh	[%i0+0x034],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141400] = 7f7bfdff, %l6 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 000000007f7bfdff
!	%l7 = 0000000000000000, %l0 = 0000000000000000, %l5 = 0000000000000045
	xnor	%l7,%l0,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041400] = ffffffff029ec69a, %f8  = 00000000 59109b77
	ldda	[%i1+%g0]0x80,%f8 	! %f8  = ffffffff 029ec69a
!	Mem[0000000030081408] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	%l6 = 000000007f7bfdff, %l2 = 00000000ff000000, %l5 = ffffffffffffffff
	udivx	%l6,%l2,%l5		! %l5 = 0000000000000000
!	Mem[000000001018142c] = 467f42a7, %f13 = 000000ff
	lda	[%i6+0x02c]%asi,%f13	! %f13 = 467f42a7
!	Mem[0000000010081408] = ffffffff, %l6 = 000000007f7bfdff
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = ff000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010141408] = 05710000, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 0000000005710000

p0_label_185:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = e77c9885, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000085
!	%l3 = 00000000000000ff, Mem[0000000010101400] = ff711cff
	stwa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	Mem[0000000010041410] = ff0000ef, %l4 = 00000000ff000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 3dd1ff00
	stha	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 3dd100ff
!	Mem[0000000010101420] = 0000ffe8, %l0 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x020]%asi,%l0	! %l0 = 000000000000ffe8
!	%f9  = 029ec69a, Mem[0000000030101410] = fd000000
	sta	%f9 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 029ec69a
!	%l6 = 0000000000000085, Mem[0000000030141408] = ffffffffffffffff
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000085
!	%f6  = ff570000 06e2300c, Mem[0000000010181400] = 000000ff e8e9ff41
	stda	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff570000 06e2300c
!	Mem[0000000030141408] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 7f7bfdff, %f14 = ff0000ff
	lda	[%i5+%g0]0x81,%f14	! %f14 = 7f7bfdff
!	Mem[00000000300c1408] = 3f2d3f37 7197169c, %l6 = 00000085, %l7 = 05710000
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 000000007197169c 000000003f2d3f37
!	Mem[0000000010041410] = ff0000ef, %f4  = e8000000
	lda	[%i1+0x010]%asi,%f4 	! %f4 = ff0000ef
!	Mem[00000000300c1410] = ff000000fffff377, %l3 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l3	! %l3 = ff000000fffff377
!	Mem[0000000030101410] = 029ec69a, %l4 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffc69a
!	Mem[0000000030141400] = 7f7bfdff, %l1 = 000000ffffffffff
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 000000007f7bfdff
!	Mem[0000000030101410] = 9ac69e0200000035, %f0  = 41fff98e ff000000
	ldda	[%i4+%o5]0x81,%f0 	! %f0  = 9ac69e02 00000035
!	Mem[0000000010001410] = e8000000, %l7 = 000000003f2d3f37
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffe800
!	Mem[000000001008142a] = 5f649d53, %l7 = ffffffffffffe800, %asi = 80
	ldsha	[%i2+0x02a]%asi,%l7	! %l7 = ffffffffffff9d53
!	Mem[0000000010081408] = ffffffff, %l0 = 000000000000ffe8
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_187:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 633027
p0_fragment_19:
!	%l0 = ffffffffffffffff
	setx	0x4caa97c37b1d650e,%g7,%l0 ! %l0 = 4caa97c37b1d650e
!	%l1 = 000000007f7bfdff
	setx	0xf254ee5ee85024b9,%g7,%l1 ! %l1 = f254ee5ee85024b9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4caa97c37b1d650e
	setx	0xb7a8388cd5c07074,%g7,%l0 ! %l0 = b7a8388cd5c07074
!	%l1 = f254ee5ee85024b9
	setx	0x760773f846f5cb3f,%g7,%l1 ! %l1 = 760773f846f5cb3f
p0_fragment_19_end:
!	Mem[0000000010001408] = 00000000, %l7 = 00000000ffff9d53
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010041400] = ffffffff
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Mem[00000000211c0000] = d1ff40d0, %l4 = ffffffffffffc69a
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000d1
!	%f20 = a4c9d13d ff0000ff, Mem[0000000010141420] = 53ff7718 fffffffd
	std	%f20,[%i5+0x020]	! Mem[0000000010141420] = a4c9d13d ff0000ff
!	%l2 = 00000000, %l3 = fffff377, Mem[0000000030101400] = 00000000 00000000
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 fffff377
!	Mem[00000000100c1408] = 2e0100ff, %l0 = 00000000d5c07074
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 000000002e0100ff
!	%l0 = 000000002e0100ff, Mem[0000000030101408] = ff80ff4b
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ffff4b
!	%f26 = 000000ff 28d61400, %l2 = 0000000000000000
!	Mem[00000000100c1430] = ff0000ff6d6177cb
	add	%i3,0x030,%g1
	stda	%f26,[%g1+%l2]ASI_PST16_PL ! Mem[00000000100c1430] = ff0000ff6d6177cb
!	%l1 = 760773f846f5cb3f, Mem[0000000030081410] = 00000045
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = cb3f0045

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = f773c922, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = fffffffffffffff7
!	Mem[0000000030101408] = ac0f00004bffff00, %l1 = 760773f846f5cb3f
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = ac0f00004bffff00
!	Mem[0000000010001408] = 539dffff, %l5 = fffffffffffffff7
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 000000000000539d
!	Mem[0000000010181400] = ff57000006e2300c, %l6 = 000000007197169c
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = ff57000006e2300c
!	Mem[0000000010001400] = ffffffff 22c973f7, %l6 = 06e2300c, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000022c973f7 00000000ffffffff
!	Mem[0000000030041410] = ff00d13d, %l4 = 00000000000000d1
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = ffffffffff00d13d
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010001400] = f773c922 ffffffff 539dffff d9000000
!	Mem[0000000010001410] = e8000000 00000000 524e1aef d90000ff
!	Mem[0000000010001420] = ff800000 7f7b00ff a7427f46 e8ff00ff
!	Mem[0000000010001430] = ff116c60 000000ff bbfb8734 b2999711
	ldda	[%i0+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010141410] = ff0000ffff000000, %l5 = 000000000000539d
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = ff0000ffff000000
!	Mem[000000001008143c] = 000080ff, %l1 = ac0f00004bffff00, %asi = 80
	ldsha	[%i2+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = cb3f0045, %l6 = 0000000022c973f7
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffcb3f0045

p0_label_189:
!	Starting 10 instruction Store Burst
!	%l0 = 000000002e0100ff, Mem[0000000030141410] = 000000ff
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ff0000ff
!	%f24 = 029ec69a, Mem[0000000030181408] = 22002e5f
	sta	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = 029ec69a
	membar	#Sync			! Added by membar checker (23)
!	%f2  = 000000d9 ffff9d53, %l0 = 000000002e0100ff
!	Mem[0000000010001400] = f773c922ffffffff
	stda	%f2,[%i0+%l0]ASI_PST8_P ! Mem[0000000010001400] = 000000d9ffff9d53
!	%f30 = ff000000 029ec69a, %l6 = ffffffffcb3f0045
!	Mem[0000000030101400] = 0000000077f3ffff
	stda	%f30,[%i4+%l6]ASI_PST16_SL ! Mem[0000000030101400] = 9ac600000000ffff
!	%l5 = ff0000ffff000000, Mem[0000000010041400] = ff000000
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%l5 = ff0000ffff000000, Mem[0000000030041408] = e77c98ff
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = e77c0000
!	Mem[0000000010001400] = 000000d9 ffff9d53 539dffff d9000000
!	%f16 = 0014d628 6fdb7105 ffffffff ffffffff
!	%f20 = a4c9d13d ff0000ff 000000d9 ffffffff
!	%f24 = 029ec69a ff110000 000000ff 28d61400
!	%f28 = ff000000 00000000 ff000000 029ec69a
	stda	%f16,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%f14 = 119799b2, Mem[0000000010141408] = 05710000
	sta	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 119799b2
!	Mem[0000000030001408] = 000000ff, %l3 = 00000000fffff377
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f22 = 000000d9 ffffffff, %l4 = ffffffffff00d13d
!	Mem[0000000030101410] = 9ac69e0200000035
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101410] = ffffffff00000035

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 010100d2, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000001
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010001408] = ffffffffffffffff, %l5 = ff0000ffff000000, %asi = 80
	ldxa	[%i0+0x008]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = 37aa1aff, %l6 = ffffffffcb3f0045
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000001aff
!	Mem[0000000030001400] = 009b1059, %l7 = 00000000ffffffff
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = 000000000000009b
!	Mem[0000000030141408] = ff000000, %l0 = 000000002e0100ff
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010081400] = ff11ff5f, %l5 = ffffffffffffffff
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffff11
!	Mem[0000000030001410] = ff1aaa37, %l6 = 0000000000001aff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff1aaa37
!	Mem[0000000030041400] = ff000000, %l5 = ffffffffffffff11
	lduba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ff800000 22c973f7, %l0 = 0000ff00, %l1 = 00000001
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff800000 0000000022c973f7
!	Mem[0000000030001410] = ff1aaa37, %l1 = 0000000022c973f7
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_191:
!	Starting 10 instruction Store Burst
!	%f16 = 0014d628, Mem[0000000010181410] = ff000000
	sta	%f16,[%i6+%o5]0x80	! Mem[0000000010181410] = 0014d628
!	%f2  = 000000d9 ffff9d53, %l4 = ffffffffff00d13d
!	Mem[00000000300c1410] = ff000000fffff377
	add	%i3,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1410] = ff000000ffff9d53
!	Mem[0000000030181400] = ff0000ff, %l4 = 00000000ff00d13d
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000ff0000ff
!	%l1 = ffffffffffffffff, Mem[0000000021800180] = 14196020, %asi = 80
	stha	%l1,[%o3+0x180]%asi	! Mem[0000000021800180] = ffff6020
!	%l0 = ff800000, %l1 = ffffffff, Mem[0000000010181410] = 0014d628 000000e8
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ff800000 ffffffff
!	Mem[0000000010001410] = ff0000ff, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000ff0000ff
!	%f14 = 119799b2 3487fbbb, %l6 = 00000000ff1aaa37
!	Mem[0000000010041410] = ff0000ef3dd1c9a4
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041410] = ff0099b23487fbbb
!	Mem[0000000010141410] = ff0000ff, %l0 = 00000000ff800000
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = fffd7b7f, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 00000000fffd7b7f
!	Mem[00000000300c1400] = a1155757, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000a1155757

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001416] = 3dd1c9a4, %l0 = 00000000000000ff
	ldub	[%i0+0x016],%l0		! %l0 = 00000000000000c9
!	Mem[0000000010101408] = 000000ff, %l5 = 00000000ff0000ff
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 77f3ffff, %l4 = 00000000ff0000ff
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = 0571db6f, %l3 = 00000000a1155757
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000005
!	Mem[0000000030041400] = ff00000000000000, %f4  = 00000000 000000e8
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = ff000000 00000000
!	Mem[000000001004143e] = 7f7bfdff, %l7 = 000000000000009b, %asi = 80
	lduha	[%i1+0x03e]%asi,%l7	! %l7 = 000000000000fdff
!	Mem[0000000030141408] = ff000000, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030041400] = 000000ff, %l1 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000ff1aaa37
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[000000001010140c] = 00000000, %l6 = 0000000000000000, %asi = 80
	lduha	[%i4+0x00c]%asi,%l6	! %l6 = 0000000000000000

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffff000000, Mem[0000000010101410] = 524e1aef
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00001aef
!	%l5 = ffffffffff000000, %l2 = 00000000fffd7b7f, %y  = 37aa1a9c
	sdiv	%l5,%l2,%l7		! %l7 = ffffffff80000000
	mov	%l0,%y			! %y = 000000c9
!	Mem[0000000010001428] = 0014d628ff000000, %l1 = 00000000000000ff, %l5 = ffffffffff000000
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 0014d628ff000000
!	%l5 = 0014d628ff000000, Mem[0000000010001418] = ffffffffd9000000
	stx	%l5,[%i0+0x018]		! Mem[0000000010001418] = 0014d628ff000000
!	%l7 = ffffffff80000000, Mem[00000000201c0000] = 00002e40
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00002e40
!	Mem[000000001004141c] = 59109b77, %l1 = 00000000000000ff
	swap	[%i1+0x01c],%l1		! %l1 = 0000000059109b77
!	%f25 = ff110000, Mem[0000000010141408] = 119799b2
	sta	%f25,[%i5+%o4]0x88	! Mem[0000000010141408] = ff110000
!	Mem[0000000030041400] = ff000000, %l3 = 0000000000000005
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141400] = d2000101, %l5 = 0014d628ff000000
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000001
!	Mem[0000000030141400] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_194:
!	Starting 10 instruction Load Burst
!	%l0 = 00000000000000c9, imm = 000000000000074b, %l5 = 0000000000000001
	subc	%l0,0x74b,%l5		! %l5 = fffffffffffff97e
!	Mem[0000000010141408] = 000011ff, %l0 = 00000000000000c9
	ldswa	[%i5+%o4]0x80,%l0	! %l0 = 00000000000011ff
!	Mem[00000000100c1408] = d5c0707400000000, %f18 = ffffffff ffffffff
	ldd	[%i3+%o4],%f18		! %f18 = d5c07074 00000000
!	Mem[0000000030081400] = 45ee0000, %l5 = fffffffffffff97e
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 0000000045ee0000
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000000011ff
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101410] = 00001aeffd000000, %f6  = ff0000d9 ef1a4e52
	ldda	[%i4+%o5]0x80,%f6 	! %f6  = 00001aef fd000000
!	Mem[0000000010081420] = 99048f69, %l2 = 00000000fffd7b7f
	lduw	[%i2+0x020],%l2		! %l2 = 0000000099048f69
!	Mem[0000000010181430] = ff000000 606c11ff, %l6 = 00000000, %l7 = 80000000
	ldd	[%i6+0x030],%l6		! %l6 = 00000000ff000000 00000000606c11ff
!	Mem[0000000030081400] = 0000ee45, %l5 = 0000000045ee0000
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffee45
!	Mem[0000000030041400] = 05000000, %f22 = 000000d9
	lda	[%i1+%g0]0x89,%f22	! %f22 = 05000000

p0_label_195:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff0000ff, %l7 = 00000000606c11ff
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000030001408] = ffffffff77f3ffff
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010081438] = ff007b7f000080ff
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438] = 00000000ff000000
!	%l0 = ffffffffffffffff, Mem[0000000010141410] = ff0000ff
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = ff0000ff
!	%l1 = 0000000059109b77, Mem[0000000030181408] = 9ac69e02
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 9ac69b77
!	Mem[00000000100c1400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f26 = 000000ff 28d61400, Mem[0000000010081410] = ff5700e8 05711cff
	stda	%f26,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 28d61400
!	%f28 = ff000000, Mem[0000000010141414] = ff000000
	sta	%f28,[%i5+0x014]%asi	! Mem[0000000010141414] = ff000000
!	%f0  = ffffffff, Mem[0000000010101410] = ef1a0000
	sta	%f0 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Mem[0000000020800000] = db2bb870, %l2 = 0000000099048f69
	ldstub	[%o1+%g0],%l2		! %l2 = 00000000000000db

p0_label_196:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010081400] = ff11ff5f 000000ff ffffffff ffffffff
!	Mem[0000000010081410] = 0014d628 ff000000 00000000 000000ff
!	Mem[0000000010081420] = 99048f69 d9862e5f 5f649d53 a63e7500
!	Mem[0000000010081430] = ff0000ff 7f800000 00000000 ff000000
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030101400] = 9ac60000, %l2 = 00000000000000db
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffff9a
!	Mem[0000000010041408] = 000080ff, %l1 = 0000000059109b77
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffff80ff
!	Mem[00000000201c0000] = 00002e40, %l3 = 00000000ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 00002e40, %l7 = 00000000000000ff
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff40d0, %l6 = 00000000ff000000
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010001428] = 0014d628 ff000000, %l2 = ffffff9a, %l3 = 00000000
	ldd	[%i0+0x028],%l2		! %l2 = 000000000014d628 00000000ff000000
!	Mem[0000000030181410] = 28d61400, %l6 = 000000000000ffff
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l0 = ffffffffffffffff, imm = fffffffffffffe65, %l6 = 0000000000000000
	xor	%l0,-0x19b,%l6		! %l6 = 000000000000019a
!	Mem[0000000010181408] = 000000ff, %l2 = 000000000014d628
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_197:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = ffffffff, %l0 = 00000000ffffffff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030081400] = 0000ee45, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 000000000000ee45
!	Mem[0000000010101410] = ffffffff, %l3 = 00000000ff000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010041418] = ffffffff
	stw	%l2,[%i1+0x018]		! Mem[0000000010041418] = 000000ff
!	%l6 = 000000000000019a, Mem[00000000100c1408] = 7470c0d5
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000019a
!	%l5 = ffffffffffffee45, Mem[0000000010141400] = ff0100d2
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = ee4500d2
!	%f28 = 0000807f ff0000ff, %l7 = 000000000000ee45
!	Mem[0000000010101428] = 51ca5522ff110000
	add	%i4,0x028,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_P ! Mem[0000000010101428] = 51ca807fff1100ff
!	Mem[0000000010081410] = 0014d628, %l5 = ffffffffffffee45
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030001408] = ff000000
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[00000000100c1400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010081410] = ff14d628, %l6 = 000000000000019a
	ldswa	[%i2+%o5]0x80,%l6	! %l6 = ffffffffff14d628
!	Mem[0000000030041408] = e77c0000, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[00000000218001c0] = 6d35c250, %l4 = ffffffffff000000
	ldsb	[%o3+0x1c0],%l4		! %l4 = 000000000000006d
!	Mem[00000000100c1400] = ff0000ff, %f15 = 3487fbbb
	lda	[%i3+%g0]0x80,%f15	! %f15 = ff0000ff
!	Mem[00000000100c1400] = ff0000ff, %f11 = 467f42a7
	lda	[%i3+%g0]0x80,%f11	! %f11 = ff0000ff
!	Mem[0000000010041410] = b29900ff, %l1 = ffffffffffff80ff
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 5fff11ff, %l4 = 000000000000006d
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 00000000000011ff
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000000, %l0 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = ffffffff, %l6 = ffffffffff14d628
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f14 = 119799b2 ff0000ff, Mem[0000000030101408] = 00ffff4b 00000fac
	stda	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = 119799b2 ff0000ff
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = ffff40d0
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00ff40d0
!	Mem[000000001004142a] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i1+0x02a]%asi,%l3	! %l3 = 0000000000000000
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000030181408] = 779bc69a 59109b77
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff00 00000000
!	%l4 = 000011ff, %l5 = 00000000, Mem[0000000010101410] = ffffffff 000000fd
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000011ff 00000000
!	%l7 = 000000000000ee45, Mem[0000000030101408] = ff0000ffb2999711
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000000000ee45
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 00002e40, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00002e40

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff0000ff, %l6 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 000011ff, %l4 = 00000000000011ff
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 00000000000000ff, %f16 = ff000000 5fff11ff
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 00000000 000000ff
!	Mem[0000000030181410] = 28d61400, %l7 = 000000000000ee45
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 00ff40d0, %l7 = 0000000000000000
	lduh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041410] = ff00d13d, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041400] = 9ac69e02ff000000, %f20 = 000000ff 28d61400
	ldda	[%i1+%g0]0x88,%f20	! %f20 = 9ac69e02 ff000000
!	Mem[000000001018141c] = 000000ff, %l1 = ffffffffffffffff
	lduw	[%i6+0x01c],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %l6 = 00000000000000ff
	lduh	[%i0+%o5],%l6		! %l6 = 000000000000ff00
!	Mem[0000000010101410] = ff110000, %l6 = 000000000000ff00
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 000000000000ff11

p0_label_201:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ff11, Mem[0000000030181410] = 0014d628
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ff11
!	Mem[0000000020800001] = ff2bb870, %l3 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000000000002b
!	%f5  = 00000000, %f24 = 5f2e86d9, %f2  = 000000d9
	fadds	%f5 ,%f24,%f2 		! %f2  = 5f2e86d9
!	%f6  = 00001aef, Mem[0000000010041408] = 000080ff
	sta	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00001aef
!	%l6 = 000000000000ff11, Mem[000000001018141c] = 000000ff, %asi = 80
	stha	%l6,[%i6+0x01c]%asi	! Mem[000000001018141c] = ff1100ff
!	%l5 = 0000000000000000, Mem[0000000020800000] = ffffb870, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000b870
!	%l2 = ffffffffffffff00, Mem[0000000010001400] = 0014d6286fdb7105
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffffffff00
!	Mem[000000001010141c] = 4d2fc5d3, %l4 = 0000000000000000, %asi = 80
	swapa	[%i4+0x01c]%asi,%l4	! %l4 = 000000004d2fc5d3
!	Mem[0000000010101410] = ff110000, %l3 = 000000000000002b
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff110000
!	%l5 = 0000000000000000, Mem[0000000030101410] = ffffffff
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffff00

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 45ee0000, %l3 = 00000000ff110000
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000045
!	Mem[0000000030001408] = 00000000 00000000, %l2 = ffffff00, %l3 = 00000045
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = 000011ff 00000000, %l2 = 00000000, %l3 = 00000000
	ldd	[%i5+%o4],%l2		! %l2 = 00000000000011ff 0000000000000000
!	Mem[0000000030001410] = ff1aaa37, %l4 = 000000004d2fc5d3
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ffffff00, %l0 = 000000000000ff00
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 000011ff, %l5 = 0000000000000000
	lduw	[%i5+%o4],%l5		! %l5 = 00000000000011ff
!	Mem[00000000211c0000] = 00ff40d0, %l0 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000000011ff, imm = 0000000000000e59, %l7 = 00000000000000ff
	addc	%l2,0xe59,%l7		! %l7 = 0000000000002058
!	Mem[000000001004140e] = 22c973f7, %l5 = 00000000000011ff, %asi = 80
	lduha	[%i1+0x00e]%asi,%l5	! %l5 = 00000000000073f7

p0_label_203:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00ffffff, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000ffffff
!	%l4 = 000000ff, %l5 = 000073f7, Mem[0000000030001408] = 00000000 00000000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 000073f7
!	Mem[00000000300c1410] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f10 = ff00ffe8 ff0000ff, Mem[0000000030181408] = 00000000 00000000
	stda	%f10,[%i6+%o4]0x89	! Mem[0000000030181408] = ff00ffe8 ff0000ff
	membar	#Sync			! Added by membar checker (26)
!	%l7 = 0000000000002058, Mem[0000000010081410] = ff14d628ff000000
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000002058
!	%l4 = 00000000000000ff, %l3 = 0000000000ffffff, %y  = 000000c9
	umul	%l4,%l3,%l5		! %l5 = 00000000feffff01, %y = 00000000
!	%l3 = 0000000000ffffff, Mem[000000001004141c] = 000000ff, %asi = 80
	stwa	%l3,[%i1+0x01c]%asi	! Mem[000000001004141c] = 00ffffff
!	%l7 = 0000000000002058, Mem[0000000010101408] = 00000000000000ff
	stxa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000002058
!	Mem[0000000010181410] = ff800000, %l7 = 0000000000002058
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041402] = 000000ff, %l2 = 00000000000011ff
	ldstub	[%i1+0x002],%l2		! %l2 = 0000000000000000

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000002b, %l3 = 0000000000ffffff
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ff0000ff, %l6 = 000000000000ff11
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = ffffffffff0000ff
!	Mem[0000000010041408] = 00001aef, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000001aef
!	Mem[0000000030181410] = 0000ff11, %l6 = ffffffffff0000ff
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %f7  = fd000000
	lda	[%i0+%o4]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000010101410] = 2b000000, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001018142e] = 467f42a7, %l0 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x02e]%asi,%l0	! %l0 = 00000000000042a7
!	Code Fragment 4, seed = 229676
p0_fragment_20:
!	%l0 = 00000000000042a7
	setx	0x4a5ab26f2f805ac6,%g7,%l0 ! %l0 = 4a5ab26f2f805ac6
!	%l1 = 00000000000000ff
	setx	0x57203a9e62bd8cf1,%g7,%l1 ! %l1 = 57203a9e62bd8cf1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4a5ab26f2f805ac6
	setx	0x5db66215deffc32c,%g7,%l0 ! %l0 = 5db66215deffc32c
!	%l1 = 57203a9e62bd8cf1
	setx	0xf922e2db7c950077,%g7,%l1 ! %l1 = f922e2db7c950077
p0_fragment_20_end:
!	Mem[0000000010081400] = 5fff11ff, %l0 = 5db66215deffc32c
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = ff0000ff, %l5 = 00000000feffff01
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 00000000ff0000ff

p0_label_205:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 0000002b, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f0  = ffffffff 22c973f7, Mem[0000000010181408] = 000000ff 000000d9
	stda	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff 22c973f7
!	Mem[0000000010081410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l1 = f922e2db7c950077, Mem[0000000030001408] = 000073f7000000ff
	stxa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = f922e2db7c950077
!	%l1 = f922e2db7c950077, Mem[0000000030181400] = ff00d13d
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 7c950077
!	%l4 = 000000ff, %l5 = ff0000ff, Mem[0000000030041408] = e77c0000 ff570000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff ff0000ff
!	Mem[0000000010141408] = 000011ff, %l5 = 00000000ff0000ff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000000011ff
!	Mem[000000001014143c] = 392adb2b, %l5 = 00000000000011ff
	ldstuba	[%i5+0x03c]%asi,%l5	! %l5 = 0000000000000039
!	Mem[0000000030101400] = 0000c69a, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000000000c69a
!	%l7 = 0000000000000000, imm = fffffffffffff66c, %l6 = 000000000000c69a
	xor	%l7,-0x994,%l6		! %l6 = fffffffffffff66c

p0_label_206:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 970699
p0_fragment_21:
!	%l0 = 00000000000000ff
	setx	0x245f49ec1af1b4ce,%g7,%l0 ! %l0 = 245f49ec1af1b4ce
!	%l1 = f922e2db7c950077
	setx	0xdf74ac8151fe6879,%g7,%l1 ! %l1 = df74ac8151fe6879
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 245f49ec1af1b4ce
	setx	0x64301ca760366834,%g7,%l0 ! %l0 = 64301ca760366834
!	%l1 = df74ac8151fe6879
	setx	0x04f017b678b536ff,%g7,%l1 ! %l1 = 04f017b678b536ff
p0_fragment_21_end:
!	Mem[0000000030141410] = ff0000ff, %l0 = 64301ca760366834
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030081410] = cb3f0045, %l6 = fffffffffffff66c
	lduwa	[%i2+%o5]0x81,%l6	! %l6 = 00000000cb3f0045
!	Mem[00000000300c1408] = 7197169c, %f17 = 000000ff
	lda	[%i3+%o4]0x89,%f17	! %f17 = 7197169c
!	Mem[0000000010101404] = ff5700e8, %f22 = ff000000
	lda	[%i4+0x004]%asi,%f22	! %f22 = ff5700e8
!	Mem[0000000010041408] = ef1a0000, %l4 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffffef
!	Mem[0000000020800041] = d3fdbea0, %l0 = ffffffffffffff00
	ldsb	[%o1+0x041],%l0		! %l0 = fffffffffffffffd
!	Mem[00000000100c1408] = 9a010000, %l0 = fffffffffffffffd
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffff9a010000
!	Mem[0000000030141408] = 000000ff, %l5 = 0000000000000039
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, imm = 0000000000000ff0, %l7 = 0000000000000000
	xor	%l5,0xff0,%l7		! %l7 = 0000000000000f0f

p0_label_207:
!	Starting 10 instruction Store Burst
!	%f14 = 119799b2 ff0000ff, Mem[00000000300c1400] = ff000000 e80057ff
	stda	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 119799b2 ff0000ff
!	%l2 = 0000000000000000, Mem[0000000030101400] = 00000000
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010041400] = 0000ffff 029ec69a ef1a0000 22c973f7
!	%f16 = 00000000 7197169c ffffffff ffffffff
!	%f20 = 9ac69e02 ff000000 ff5700e8 00000000
!	%f24 = 5f2e86d9 698f0499 00753ea6 539d645f
!	%f28 = 0000807f ff0000ff 000000ff 00000000
	stda	%f16,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	%l0 = ffffffff9a010000, Mem[0000000030101400] = 00000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l3 = 0000000000001aef, Mem[0000000030101410] = 00ffffff
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 1aefffff
!	%l2 = 0000000000000000, %l4 = ffffffffffffffef, %l5 = 00000000000000ff
	add	%l2,%l4,%l5		! %l5 = ffffffffffffffef
!	Mem[0000000010001420] = 000011ff, %l2 = 00000000, %l6 = cb3f0045
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000000011ff
!	%f3  = ffff9d53, %f3  = ffff9d53
	fcmps	%fcc0,%f3 ,%f3 		! %fcc0 = 3
!	%l6 = 000011ff, %l7 = 00000f0f, Mem[0000000010101410] = ff00002b 00000000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000011ff 00000f0f
!	%l2 = 0000000000000000, Mem[00000000100c140a] = 9a010000
	sth	%l2,[%i3+0x00a]		! Mem[00000000100c1408] = 9a010000

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 009b1059, %l5 = ffffffffffffffef
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1430] = ff0000ff6d6177cb, %f10 = ff00ffe8 ff0000ff, %asi = 80
	ldda	[%i3+0x030]%asi,%f10	! %f10 = ff0000ff 6d6177cb
!	Mem[0000000010181410] = ff800000ffffffff, %f8  = ff007b7f 000080ff
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = ff800000 ffffffff
!	Mem[0000000030001408] = 7700957c, %l0 = ffffffff9a010000
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 000000007700957c
!	Mem[0000000030181408] = ff0000ff, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010001400] = ffffff00, %l7 = 0000000000000f0f
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ffffff00
!	%l4 = ffffffffffffffef, %l7 = 00000000ffffff00, %y  = 00000000
	smul	%l4,%l7,%l1		! %l1 = 0000000000001100, %y = 00000000
!	Mem[0000000010001408] = ffffffff, %l4 = ffffffffffffffef
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = ff0000ffff000000, %f4  = ff000000 00000000
	ldda	[%i5+%o5]0x80,%f4 	! %f4  = ff0000ff ff000000
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010041435] = 7f800000, %l6 = 00000000000011ff, %asi = 80
	lduba	[%i1+0x035]%asi,%l6	! %l6 = 0000000000000080

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010041410] = 000000ff
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	%l2 = 00000000, %l3 = 00001aef, Mem[0000000010001418] = 0014d628 ff000000
	std	%l2,[%i0+0x018]		! Mem[0000000010001418] = 00000000 00001aef
!	Mem[00000000201c0001] = 00002e40, %l4 = ffffffffffffffff
	ldstub	[%o0+0x001],%l4		! %l4 = 0000000000000000
!	%l6 = 0000000000000080, Mem[0000000010141410] = 000000ffff0000ff
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000080
!	%l1 = 0000000000001100, Mem[00000000300c1408] = 9c169771
	stwa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00001100
!	Mem[0000000010041410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000ffffffff
!	%f7  = ff000000, Mem[0000000010001410] = ff000000
	sta	%f7 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Mem[00000000100c1410] = fffb2340, %l6 = 0000000000000080
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000fffb2340
!	Mem[0000000010041417] = 029ec69a, %l7 = 00000000ffffff00
	ldstuba	[%i1+0x017]%asi,%l7	! %l7 = 000000000000009a
!	%f14 = 119799b2, Mem[0000000010181408] = f773c922
	sta	%f14,[%i6+%o4]0x80	! Mem[0000000010181408] = 119799b2

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000ffff9d53, %l4 = 00000000ffffffff
	ldxa	[%i3+%o5]0x81,%l4	! %l4 = ff000000ffff9d53
!	%f2  = 5f2e86d9, %f11 = 6d6177cb, %f12 = ff000000
	fdivs	%f2 ,%f11,%f12		! %f12 = 31462919
!	Mem[0000000030141408] = 000000ff, %l7 = 000000000000009a
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101430] = 3dd1c9a4, %l3 = 0000000000001aef
	lduh	[%i4+0x030],%l3		! %l3 = 0000000000003dd1
!	Mem[0000000010101400] = e80057ff ff0000ff, %l0 = 7700957c, %l1 = 00001100
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 00000000e80057ff
!	Mem[0000000010141408] = ff0000ff 00000000, %l4 = ffff9d53, %l5 = ffffff00
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010181401] = ff570000, %l6 = 00000000fffb2340
	ldub	[%i6+0x001],%l6		! %l6 = 0000000000000057
!	Mem[0000000030041410] = ff00d13d, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffffff00d13d
!	Mem[0000000010181400] = 000057ff, %l2 = ffffffffff00d13d
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 00000000000057ff
!	Mem[0000000030101410] = ffffef1a, %l4 = 00000000ff0000ff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 000000000000ef1a

p0_label_211:
!	Starting 10 instruction Store Burst
!	%l0 = ff0000ff, %l1 = e80057ff, Mem[0000000010141408] = ff0000ff 00000000
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff e80057ff
!	Mem[0000000010041400] = 9c169771, %l3 = 0000000000003dd1
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 000000009c169771
!	%l2 = 00000000000057ff, Mem[000000001010141c] = 00000000
	stw	%l2,[%i4+0x01c]		! Mem[000000001010141c] = 000057ff
!	%l5 = 0000000000000000, Mem[0000000010001420] = 000011ff9ac69e02, %asi = 80
	stxa	%l5,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000000000000
!	%l7 = 00000000000000ff, immd = 0000095e, %y  = 00000000
	sdiv	%l7,0x95e,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = ff0000ff
!	Mem[0000000010141408] = ff0000ff, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l3 = 000000009c169771, Mem[00000000100c1410] = 00000080
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 9c169771
!	%f16 = 00000000, %f3  = ffff9d53
	fcmpes	%fcc2,%f16,%f3 		! %fcc2 = 3
!	Mem[000000001018140f] = ffffffff, %l1 = 00000000e80057ff
	ldstuba	[%i6+0x00f]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ff0000ff, %l6 = 0000000000000057
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000ff

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffc69e02 00000000, %l2 = 000057ff, %l3 = 9c169771
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000 00000000ffc69e02
!	Mem[0000000030041410] = ff0000ff3dd100ff, %f10 = ff0000ff 6d6177cb
	ldda	[%i1+%o5]0x89,%f10	! %f10 = ff0000ff 3dd100ff
!	Mem[0000000010001400] = 00ffffff, %l7 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff0000ff, %f13 = 606c11ff
	lda	[%i4+%g0]0x88,%f13	! %f13 = ff0000ff
!	%l6 = 00000000000000ff, imm = fffffffffffff8f0, %l3 = 00000000ffc69e02
	xnor	%l6,-0x710,%l3		! %l3 = 00000000000007f0
!	Mem[0000000010141428] = 0530bf1600000000, %l5 = 0000000000000000
	ldx	[%i5+0x028],%l5		! %l5 = 0530bf1600000000
!	Mem[00000000201c0000] = 00ff2e40, %l6 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff1aaa37, %l3 = 00000000000007f0
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 00000000ff1aaa37
!	Mem[0000000030181410] = 11ff0000, %l5 = 0530bf1600000000
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 000011ff, %l0 = 00000000ff0000ff
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_213:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041400] = d13d0000
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = d13d00ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030181400] = 7c950077 39292a24
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 000000ff
!	Mem[00000000211c0001] = 00ff40d0, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	%f22 = ff5700e8 00000000, Mem[0000000030181408] = ff0000ff e8ff00ff
	stda	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = ff5700e8 00000000
!	%l4 = 00000000000000ff, Mem[0000000010081428] = 5f649d53a63e7500
	stx	%l4,[%i2+0x028]		! Mem[0000000010081428] = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010041400] = ff003dd1 00000000
	std	%l0,[%i1+%g0]		! Mem[0000000010041400] = 00000000 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001410] = ff000000, %asi = 80
	stwa	%l4,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000030181410] = 0000000011ff0000
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[00000000100c1400] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 00002058, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000058

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = ff000000, %l1 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030181410] = 0000000000000000, %l4 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, %l2 = 00000000000000ff, %l5 = 00000000000000ff
	and	%l6,%l2,%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000000000ff
	lduw	[%i0+%o5],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 7c950077, %l1 = ffffffffff000000
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 000000007c950077
!	%l2 = 00000000000000ff, %l6 = 00000000000000ff, %l5 = 00000000000000ff
	andn	%l2,%l6,%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = ffffef1a, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 000000000000ef1a
!	Mem[0000000010081410] = ff000000, %l6 = 00000000000000ff
	ldsh	[%i2+%o5],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000030081410] = cb3f0045, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffcb

p0_label_215:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffcb, Mem[00000000100c1408] = 0000019a
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffcb
!	Mem[000000001010143b] = e8eed828, %l2 = 000000000000ef1a
	ldstub	[%i4+0x03b],%l2		! %l2 = 0000000000000028
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 000000ff
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030081410] = 45003fcb, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000cb
!	Mem[0000000010101400] = ff0000ff ff5700e8 ff200000 00000000
!	%f16 = 00000000 7197169c ffffffff ffffffff
!	%f20 = 9ac69e02 ff000000 ff5700e8 00000000
!	%f24 = 5f2e86d9 698f0499 00753ea6 539d645f
!	%f28 = 0000807f ff0000ff 000000ff 00000000
	stda	%f16,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f21 = ff000000, Mem[0000000010041400] = 00000000
	sta	%f21,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%f1  = 22c973f7, Mem[0000000030141410] = ff0000ff
	sta	%f1 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 22c973f7
!	%f28 = 0000807f, Mem[0000000010141410] = 00000080
	sta	%f28,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000807f
!	%l1 = 000000007c950077, Mem[0000000030041400] = 05000000
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 7c950077
!	%f10 = ff0000ff 3dd100ff, Mem[0000000010181400] = 000057ff 0c30e206
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff 3dd100ff

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0000ee45, %l3 = 00000000ff1aaa37
	lduha	[%i4+%o4]0x89,%l3	! %l3 = 000000000000ee45
!	Mem[0000000010001410] = ff000000, %l3 = 000000000000ee45
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010041408] = ffffffff, %l2 = 0000000000000028
	ldsw	[%i1+%o4],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = ff0000ff, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000021800180] = ffff6020, %l2 = ffffffffffffffff, %asi = 80
	lduba	[%o3+0x180]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ff00d13d, %l6 = ffffffffffffff00
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ff00d13d
!	Mem[0000000030001400] = 009b1059, %f1  = 22c973f7
	lda	[%i0+%g0]0x81,%f1 	! %f1 = 009b1059
!	Mem[000000001000140c] = ffffffff, %l4 = 00000000000000cb
	ldub	[%i0+0x00c],%l4		! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff40d0, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff00000000, %f4  = ff0000ff ff000000
	ldda	[%i6+%g0]0x89,%f4 	! %f4  = 000000ff 00000000

p0_label_217:
!	Starting 10 instruction Store Burst
!	%f18 = ffffffff ffffffff, Mem[0000000010141408] = ff0000ff e80057ff
	stda	%f18,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff ffffffff
!	Mem[0000000010141408] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010001400] = 00ffffff, %l6 = 00000000ff00d13d
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000058, Mem[00000000100c1400] = ff0000ff
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 005800ff
!	Mem[00000000201c0000] = 00ff2e40, %l1 = 000000007c950077
	ldstub	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	%l5 = ffffffffffffffcb, Mem[0000000010081420] = 99048f69
	sth	%l5,[%i2+0x020]		! Mem[0000000010081420] = ffcb8f69
!	%f10 = ff0000ff 3dd100ff, %l6 = 0000000000000000
!	Mem[0000000010101420] = 5f2e86d9698f0499
	add	%i4,0x020,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_P ! Mem[0000000010101420] = 5f2e86d9698f0499
!	%l5 = ffffffffffffffcb, Mem[000000001008142c] = 000000ff, %asi = 80
	stwa	%l5,[%i2+0x02c]%asi	! Mem[000000001008142c] = ffffffcb
!	Mem[0000000010081410] = ff000000, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081408] = ffffffff, %l5 = 00000000ffffffcb
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000ffffffff

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffffff ffffffff, %l2 = ffffffff, %l3 = ff000000
	ldd	[%i0+%g0],%l2		! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030141410] = f773c922, %l7 = 0000000000000058
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = fffffffff773c922
!	Mem[0000000030081408] = ffffffcb, %l7 = fffffffff773c922
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffffcb
!	Mem[00000000300c1408] = 00001100, %l1 = 00000000ff000000
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffcb
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = cbffffff, %f11 = 3dd100ff
	lda	[%i2+%o4]0x81,%f11	! %f11 = cbffffff
!	Mem[0000000030141400] = ffffffff000000ff, %l2 = 00000000ffffffff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = ffffffff000000ff
!	Mem[0000000010141434] = 74f9a305, %l3 = 00000000ffffffff, %asi = 80
	ldsha	[%i5+0x034]%asi,%l3	! %l3 = 00000000000074f9
!	Mem[0000000010181408] = 119799b2, %f15 = ff0000ff
	lda	[%i6+%o4]0x80,%f15	! %f15 = 119799b2
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ff0000ff
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_219:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[00000000300c1400] = ff0000ff
	stha	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff00ffff
!	%f18 = ffffffff ffffffff, Mem[0000000010041420] = 99048f69 d9862e5f, %asi = 80
	stda	%f18,[%i1+0x020]%asi	! Mem[0000000010041420] = ffffffff ffffffff
!	Mem[00000000100c1410] = 9c169771, %l5 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 000000000000009c
!	%l2 = ffffffff000000ff, Mem[0000000010081410] = 0000000000002058
	stx	%l2,[%i2+%o5]		! Mem[0000000010081410] = ffffffff000000ff
!	%l2 = 000000ff, %l3 = 000074f9, Mem[0000000030181400] = 00000000 000000ff
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 000074f9
!	Mem[000000001010141b] = ff5700e8, %l4 = 00000000000000ff
	ldstuba	[%i4+0x01b]%asi,%l4	! %l4 = 00000000000000e8
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010001410] = 000000ff 3dd1c9a4
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 00000000
!	%l5 = 000000000000009c, Mem[00000000300c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000009c
!	%l2 = ffffffff000000ff, Mem[0000000030181408] = e80057ff
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = e80057ff
!	%l2 = ffffffff000000ff, Mem[0000000030101410] = 35000000ffffef1a
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff000000ff

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l5 = 000000000000009c
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001014143c] = ff2adb2b, %l3 = 00000000000074f9, %asi = 80
	ldsha	[%i5+0x03c]%asi,%l3	! %l3 = ffffffffffffff2a
!	Mem[0000000010141410] = 7f80000000000000, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = 7f80000000000000
!	Mem[0000000010141410] = 00000000 0000807f, %l4 = 000000e8, %l5 = 00000000
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 000000000000807f 0000000000000000
!	Mem[0000000010181410] = ff800000, %f27 = 539d645f
	lda	[%i6+%o5]0x80,%f27	! %f27 = ff800000
!	Mem[0000000030081410] = 45003fff, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ff116c6059109b00, %f2  = 5f2e86d9 ffff9d53
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = ff116c60 59109b00
!	Mem[0000000030181400] = 000074f9000000ff, %f14 = 119799b2 119799b2
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 000074f9 000000ff
!	%f0  = ffffffff, %f9  = ffffffff
	fsqrts	%f0 ,%f9 		! %f9  = ffffffff
!	Mem[0000000030041408] = ff000000, %l4 = 000000000000807f
	ldswa	[%i1+%o4]0x81,%l4	! %l4 = ffffffffff000000

p0_label_221:
!	Starting 10 instruction Store Burst
!	%f5  = 00000000, Mem[0000000010181400] = 3dd100ff
	sta	%f5 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000020800040] = d3fdbea0, %l7 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000d3
!	%l1 = 0000000000000000, Mem[0000000030141408] = ff000000
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030181410] = 00000000, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f0  = ffffffff 009b1059, %l6 = 0000000000000000
!	Mem[0000000030181418] = 62a6ec1a78d76383
	add	%i6,0x018,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181418] = 62a6ec1a78d76383
!	Mem[0000000030141400] = ff000000 ffffffff 00000000 00000085
!	%f16 = 00000000 7197169c ffffffff ffffffff
!	%f20 = 9ac69e02 ff000000 ff5700e8 00000000
!	%f24 = 5f2e86d9 698f0499 00753ea6 ff800000
!	%f28 = 0000807f ff0000ff 000000ff 00000000
	stda	%f16,[%i5+%g0]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000010181421] = 000000d9, %l5 = 00000000000000ff
	ldstuba	[%i6+0x021]%asi,%l5	! %l5 = 0000000000000000
!	%f17 = 7197169c, Mem[0000000010081428] = 00000000
	sta	%f17,[%i2+0x028]%asi	! Mem[0000000010081428] = 7197169c
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000d3
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%f1  = 009b1059, Mem[0000000010141410] = 0000807f
	sta	%f1 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 009b1059

p0_label_222:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010141420] = a4c9d13dff0000ff, %f4  = 000000ff 00000000, %asi = 80
	ldda	[%i5+0x020]%asi,%f4 	! %f4  = a4c9d13d ff0000ff
!	Mem[0000000030041410] = ff00d13d, %f20 = 9ac69e02
	lda	[%i1+%o5]0x81,%f20	! %f20 = ff00d13d
!	Mem[0000000010001408] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = 000000d300000000, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l2	! %l2 = 000000d300000000
!	Mem[00000000201c0000] = ffff2e40, %l6 = 0000000000000000
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030041408] = 000000ff, %l5 = ffffffffffffffff
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %l6 = 000000000000ffff
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff2e40, %l6 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = 9ac69e02, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000009ac6
!	Mem[0000000010001400] = ffffffff, %l5 = 0000000000009ac6
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff

p0_label_223:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 00ff40d0
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00ff40d0
!	%l1 = 0000000000000000, Mem[0000000010001400] = ffffffffffffffff
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%l4 = ff000000, %l5 = ffffffff, Mem[0000000010081408] = ffffffff ffffffff
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 ffffffff
!	%f30 = 000000ff 00000000, Mem[0000000010181408] = 119799b2 ffffffff
	stda	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff 00000000
!	Mem[0000000010001400] = 00000000, %l2 = 000000d300000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f7  = ff000000, Mem[0000000030181410] = 000000ff
	sta	%f7 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%f24 = 5f2e86d9 698f0499, Mem[0000000010141400] = d20045ee d10c00e5
	stda	%f24,[%i5+%g0]0x88	! Mem[0000000010141400] = 5f2e86d9 698f0499
!	Mem[0000000010041408] = ffffffff, %l4 = 00000000ff000000
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030001408] = 7700957c dbe222f9, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 000000007700957c 00000000dbe222f9
!	Mem[0000000030001410] = 37aa1aff, %l4 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff 000000ff, %l2 = 00000000, %l3 = ffffff2a
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff 00000000000000ff
!	Mem[00000000300c1410] = 9c000000, %l5 = ffffffffffffffff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 45003fff, %l7 = 00000000dbe222f9
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000045003fff
!	Mem[0000000010141408] = 000000ff, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001000140d] = ffffffff, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x00d]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = ffff00ff, %f12 = 31462919
	lda	[%i3+%g0]0x81,%f12	! %f12 = ffff00ff
!	Mem[0000000010041410] = 00000000, %l0 = 7f80000000000000
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = ffffffff000000ff, %l3 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = ffffffff000000ff
!	Mem[0000000030041400] = 7700957c 00000000 ff000000 ff0000ff
!	Mem[0000000030041410] = ff00d13d ff0000ff 000000d9 000000ff
!	Mem[0000000030041420] = 99048f69 ff0000ff ffff00ff ff000000
!	Mem[0000000030041430] = 18fb2340 7f800000 ff007b7f 000080ff
	ldda	[%i1+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030041400

p0_label_225:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff000000ff, Mem[0000000010081410] = ffffffff
	stha	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff00ff
!	%l7 = 0000000045003fff, Mem[0000000010001420] = 0000000000000000, %asi = 80
	stxa	%l7,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000045003fff
!	%f6  = ff000000 d9000000, Mem[00000000100c1418] = 034400ff 9ac69eff
	std	%f6 ,[%i3+0x018]	! Mem[00000000100c1418] = ff000000 d9000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001008140c] = ffffffff, %l4 = 000000ff, %l5 = ffffffff
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010041400] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l0 = 0000000000000000
	ldstub	[%i0+%o4],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081408] = ffffffcb, %l6 = 000000007700957c
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000cb
!	%l1 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%l7 = 0000000045003fff, Mem[0000000030001410] = 6930c4db37aa1aff
	stxa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000045003fff

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l6 = 00000000000000cb
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041408] = 000000ff, %l5 = 00000000ffffffff
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = ff000000, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010081410] = ff00ffff, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = ffffffffff00ffff
!	Code Fragment 4, seed = 812029
p0_fragment_22:
!	%l0 = 00000000000000ff
	setx	0xe8973e01f789e53e,%g7,%l0 ! %l0 = e8973e01f789e53e
!	%l1 = 0000000000000000
	setx	0xc44c7f5e933c6de9,%g7,%l1 ! %l1 = c44c7f5e933c6de9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e8973e01f789e53e
	setx	0xec1eb308399632a4,%g7,%l0 ! %l0 = ec1eb308399632a4
!	%l1 = c44c7f5e933c6de9
	setx	0x9e23144367afb66f,%g7,%l1 ! %l1 = 9e23144367afb66f
p0_fragment_22_end:
!	Mem[0000000030081400] = 000000ff, %l7 = 0000000045003fff
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800041] = fffdbea0, %l3 = ffffffff000000ff, %asi = 80
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000fd
!	Mem[0000000010001400] = ff000000, %l4 = ffffffffff00ffff
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = 7c950077, %l4 = ffffffffffffffff
	lduba	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000077
!	Mem[0000000010001438] = 9ac69e02, %l3 = 00000000000000fd
	lduw	[%i0+0x038],%l3		! %l3 = 000000009ac69e02

p0_label_227:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 00000000, %l5 = 00000000ff000000
	swap	[%i0+0x030],%l5		! %l5 = 0000000000000000
!	%l4 = 00000077, %l5 = 00000000, Mem[0000000030081408] = ffffffff ffffffff
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000077 00000000
!	%l4 = 0000000000000077, Mem[0000000010181410] = ff800000ffffffff
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000077
!	Mem[0000000010141408] = 000000ff, %l1 = 9e23144367afb66f
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = ff000000 f9740000 ff5700e8 00000000
!	%f16 = 00000000 7197169c ffffffff ffffffff
!	%f20 = ff00d13d ff000000 ff5700e8 00000000
!	%f24 = 5f2e86d9 698f0499 00753ea6 ff800000
!	%f28 = 0000807f ff0000ff 000000ff 00000000
	stda	%f16,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000010041400] = ff0000ff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010101407] = 7197169c, %l4 = 0000000000000077
	ldstub	[%i4+0x007],%l4		! %l4 = 000000000000009c
!	%l6 = ffffffffffffffff, Mem[0000000030081400] = 000000ff
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l5 = 00000000ff0000ff, Mem[0000000010181408] = 000000ff
	stb	%l5,[%i6+%o4]		! Mem[0000000010181408] = ff0000ff
!	%l4 = 000000000000009c, Mem[0000000010001410] = d3000000
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000009c

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %f4  = ff0000ff
	lda	[%i2+%g0]0x81,%f4 	! %f4 = ff000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010181400] = 00000000ff0000ff, %f6  = ff000000 d9000000
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = 00000000 ff0000ff
!	Mem[0000000030141400] = 7197169c, %f27 = ff800000
	lda	[%i5+%g0]0x89,%f27	! %f27 = 7197169c
!	Mem[0000000010041400] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff2e40, %l2 = 00000000000000ff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = 0000000000000077, %l0 = ec1eb308399632a4
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000077
!	Mem[0000000030041408] = ff000000, %l5 = 00000000ff0000ff
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030101400] = 00000000, %l4 = 000000000000009c
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001427] = 45003fff, %l7 = 00000000000000ff, %asi = 80
	lduba	[%i0+0x027]%asi,%l7	! %l7 = 00000000000000ff
!	Code Fragment 3, seed = 808482
p0_fragment_23:
!	%l0 = 0000000000000077
	setx	0xb808f7c07e2e8916,%g7,%l0 ! %l0 = b808f7c07e2e8916
!	%l1 = 00000000000000ff
	setx	0xa6e2d456b06eaa41,%g7,%l1 ! %l1 = a6e2d456b06eaa41
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b808f7c07e2e8916
	setx	0xc9426eb36a2c9f7c,%g7,%l0 ! %l0 = c9426eb36a2c9f7c
!	%l1 = a6e2d456b06eaa41
	setx	0x8963c444469d6bc7,%g7,%l1 ! %l1 = 8963c444469d6bc7
p0_fragment_23_end:

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l0 = c9426eb36a2c9f7c, Mem[00000000300c1410] = 9c000000
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9c009f7c
!	Mem[0000000030001400] = 009b1059, %f11 = ff00ffff
	lda	[%i0+%g0]0x81,%f11	! %f11 = 009b1059
!	%l5 = 000000000000ff00, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l4 = 0000000000000000, Mem[00000000300c1400] = ff00ffff
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010081400] = ff11ff5f, %l6 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010081400] = ff11ff5f
	stba	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = ff11ff5f
!	%l2 = ffffffffffffffff, Mem[0000000030001400] = 59109b00
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 5910ffff
!	Mem[0000000030181410] = ff00d13d, %l5 = 000000000000ff00
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff00d13d
!	%f4  = ff000000, Mem[0000000010001408] = ffffffff
	sta	%f4 ,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%f1  = 7c950077, %f26 = 00753ea6, %f13 = 4023fb18
	fsubs	%f1 ,%f26,%f13		! tt=0x22, %l0 = c9426eb36a2c9f9e

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	%l3 = 000000009ac69e02, %l7 = 00000000000000ff, %l1 = 8963c444469d6bc7
	or	%l3,%l7,%l1		! %l1 = 000000009ac69eff
!	Mem[0000000021800140] = ffe879f0, %l0 = c9426eb36a2c9f9e
	ldub	[%o3+0x140],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041410] = 3dd100ff, %l3 = 000000009ac69e02
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = ff3f00453dd1c9a4, %l4 = ffffffffffffffff
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = ff3f00453dd1c9a4
!	Mem[0000000010141410] = 59109b00, %l1 = 000000009ac69eff
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000059109b00
!	Mem[00000000100c1418] = ff000000 d9000000, %l4 = 3dd1c9a4, %l5 = ff00d13d, %asi = 80
	ldda	[%i3+0x018]%asi,%l4	! %l4 = 00000000ff000000 00000000d9000000
!	Mem[00000000211c0000] = 00ff40d0, %l2 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000000007197169c, %l4 = 00000000ff000000
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = 000000007197169c
!	Mem[0000000010181408] = ff0000ff, %l5 = 00000000d9000000
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_231:
!	Starting 10 instruction Store Burst
!	%f28 = 0000807f, %f18 = ffffffff
	fsqrts	%f28,%f18		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000010081410] = ff00ffff, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800181] = ffff6020, %l0 = 0000000000000121
	ldstuba	[%o3+0x181]%asi,%l0	! %l0 = 00000000000000ff
!	%f12 = 0000807f 4023fb18, Mem[0000000030101408] = 45ee0000 00000000
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000807f 4023fb18
!	Mem[00000000300c1410] = 7c9f009c, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 000000007c9f009c
!	%l4 = 000000007197169c, Mem[0000000030001408] = 7700957c
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 169c957c
!	Mem[0000000030181400] = 00000000, %l1 = 0000000059109b00
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = ffff1059, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010041426] = ffffffff
	sth	%l0,[%i1+0x026]		! Mem[0000000010041424] = ffff00ff
!	%l4 = 000000007197169c, Mem[0000000030081408] = 77000000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 169c0000

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = 7f800000, %f11 = 009b1059
	ld	[%i2+0x034],%f11	! %f11 = 7f800000
!	Mem[000000001014142e] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+0x02e]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 7c959c16, %f21 = ff000000
	lda	[%i0+%o4]0x89,%f21	! %f21 = 7c959c16
!	%l3 = 00000000000000ff, imm = fffffffffffff32d, %l1 = 0000000000000000
	sub	%l3,-0xcd3,%l1		! %l1 = 0000000000000dd2
!	Mem[0000000010181410] = 00000000 00000077, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000077
!	Mem[0000000010181410] = 7700000000000000, %l2 = 000000007c9f009c
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 7700000000000000
!	Mem[0000000030001408] = 7c959c16, %l5 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000016
!	Mem[0000000010001408] = 000000ff, %l2 = 7700000000000000
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081438] = 00000000ff000000, %l4 = 000000007197169c
	ldx	[%i2+0x038],%l4		! %l4 = 00000000ff000000
!	Mem[0000000030001400] = ffff1059, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_233:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010081438] = 00000000ff000000
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438] = ffffffffffffffff
!	%l3 = ffffffffffffffff, Mem[0000000030041410] = ff00d13dff0000ff
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffffff
!	%l6 = 0000000000000000, Mem[0000000010141410] = 009b1059
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010081400] = ff11ff5f, %l7 = 0000000000000077
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff11ff5f
!	%l6 = 00000000, %l7 = ff11ff5f, Mem[00000000100c1400] = 005800ff 242a0277
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 ff11ff5f
!	%l4 = 00000000ff000000, %l7 = 00000000ff11ff5f, %l2 = 00000000000000ff
	addc	%l4,%l7,%l2		! %l2 = 00000001fe11ff5f
!	%l7 = 00000000ff11ff5f, Mem[0000000030001408] = 7c959c16
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 7c959c5f
!	%f30 = 000000ff, Mem[00000000100c141c] = d9000000
	st	%f30,[%i3+0x01c]	! Mem[00000000100c141c] = 000000ff
!	Mem[0000000030001408] = 7c959c5f, %l3 = 00000000ffffffff
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 000000007c959c5f
!	%l4 = 00000000ff000000, Mem[0000000030041400] = 7c950077
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 7c950000

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0001] = 00ff40d0, %l0 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 698f0499, %l0 = ffffffffffffffff
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 00000000698f0499
!	Mem[0000000021800041] = 18ffb930, %l0 = 00000000698f0499, %asi = 80
	lduba	[%o3+0x041]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800040] = fffdbea0, %l0 = 00000000000000ff
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000fffd
!	Mem[0000000021800080] = 4eaeaf60, %l3 = 000000007c959c5f
	lduh	[%o3+0x080],%l3		! %l3 = 0000000000004eae
!	Mem[0000000010101430] = 0000807f, %l5 = 0000000000000016, %asi = 80
	lduwa	[%i4+0x030]%asi,%l5	! %l5 = 000000000000807f
!	Mem[0000000010001400] = ff000000, %l4 = 00000000ff000000
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041408] = 000000ff, %l3 = 0000000000004eae
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = 0000807f, %l5 = 000000000000807f
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %f8  = ff0000ff
	lda	[%i0+%o4]0x80,%f8 	! %f8 = ff000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%f14 = ff800000, Mem[0000000010081408] = 000000ff
	sta	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = ff800000
!	%f22 = ff5700e8, Mem[0000000030101408] = 7f800000
	sta	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = ff5700e8
!	Mem[0000000010081400] = 00000077, %l0 = 000000000000fffd
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000077
!	%f31 = 00000000, Mem[0000000030081410] = 45003fff
	sta	%f31,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f22 = ff5700e8, Mem[0000000030101400] = ff000000
	sta	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = ff5700e8
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000077
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = 000000000000ff00, Mem[0000000030001400] = ffff1059
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff1059
!	Mem[0000000030041410] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041428] = 5f649d53a63e7500, %l3 = 0000000000000000, %l1 = 0000000000000dd2
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 5f649d53a63e7500

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030101408] = ff5700e8, %f5  = 3dd100ff
	lda	[%i4+%o4]0x89,%f5 	! %f5 = ff5700e8
!	Mem[00000000100c1400] = 5fff11ff00000000, %f26 = 00753ea6 7197169c
	ldda	[%i3+%g0]0x88,%f26	! %f26 = 5fff11ff 00000000
!	Mem[0000000010001420] = 00000000, %l7 = 00000000ff11ff5f
	lduw	[%i0+0x020],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l4 = 000000000000ff00
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff2e40, %l5 = 00000000000000ff
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 9ac69e02, %l5 = ffffffffffffffff
	ldsh	[%i4+%o5],%l5		! %l5 = ffffffffffff9ac6
!	Mem[00000000100c1408] = 0000ffcb, %f2  = ff0000ff
	lda	[%i3+%o4]0x88,%f2 	! %f2 = 0000ffcb
!	Mem[0000000010141408] = ffffffff000000ff, %f0  = 00000000 7c950077
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = ffffffff 000000ff
!	Mem[000000001014140a] = ff000000, %l3 = 0000000000000000
	lduh	[%i5+0x00a],%l3		! %l3 = 0000000000000000

p0_label_237:
!	Starting 10 instruction Store Burst
!	%f0  = ffffffff 000000ff, %l5 = ffffffffffff9ac6
!	Mem[0000000010101430] = 0000807fff0000ff
	add	%i4,0x030,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101430] = 00000000ffff00ff
!	%f16 = 00000000 7197169c, Mem[0000000030081400] = ff000000 00184e52
	stda	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 7197169c
!	Mem[0000000010001408] = ff000000, %l1 = a63e7500, %l2 = fe11ff5f
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[0000000010081400] = fdff0000
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = fdff0000
!	Mem[0000000030181408] = ffffffff, %l2 = 00000000ff000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000021800100] = 64030fc0
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 00ff0fc0
!	Mem[0000000010181428] = 9b77ffe8467f42a7, %l4 = ffffffffffffffff, %l0 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 9b77ffe8467f42a7
!	%f5  = ff5700e8, Mem[0000000010041410] = 00000000
	sta	%f5 ,[%i1+0x010]%asi	! Mem[0000000010041410] = ff5700e8
!	%l0 = 9b77ffe8467f42a7, Mem[00000000300c1408] = 00110000
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 001142a7
!	%l3 = 0000000000000000, Mem[000000001014140c] = ffffffff
	sth	%l3,[%i5+0x00c]		! Mem[000000001014140c] = 0000ffff

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[000000001000140a] = ff000000, %l5 = ffffffffffff9ac6
	lduh	[%i0+0x00a],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 0000ffcb, %l1 = 5f649d53a63e7500
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 000000000000ffcb
!	Mem[00000000100c1424] = 0000005f, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x024]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 5fff11ff 00000000, %l6 = ff000000, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 000000005fff11ff
!	Mem[0000000030041400] = 0000957c, %l6 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 000080ff, %l5 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 00000000000080ff
!	Mem[0000000030181410] = 00ff0000, %l7 = 000000005fff11ff
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Code Fragment 4, seed = 695086
p0_fragment_24:
!	%l0 = 9b77ffe8467f42a7
	setx	0xd6d82d780f4b2cb6,%g7,%l0 ! %l0 = d6d82d780f4b2cb6
!	%l1 = 000000000000ffcb
	setx	0x250820a52e6a7be1,%g7,%l1 ! %l1 = 250820a52e6a7be1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d6d82d780f4b2cb6
	setx	0xd1970a0e10f83f1c,%g7,%l0 ! %l0 = d1970a0e10f83f1c
!	%l1 = 250820a52e6a7be1
	setx	0x323c92bed3c77967,%g7,%l1 ! %l1 = 323c92bed3c77967
p0_fragment_24_end:

p0_label_239:
!	Starting 10 instruction Store Burst
!	Mem[000000001018143f] = ff1c7105, %l4 = ffffffffffffffff
	ldstuba	[%i6+0x03f]%asi,%l4	! %l4 = 0000000000000005
!	Mem[0000000030141408] = ffffffff, %l0 = d1970a0e10f83f1c
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041438] = 00000000ff000000, %l1 = 323c92bed3c77967, %l6 = 0000000000000000
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030141400] = 9c169771 00000000 ffffffff ffffffff
!	%f16 = 00000000 7197169c ffffffff ffffffff
!	%f20 = ff00d13d 7c959c16 ff5700e8 00000000
!	%f24 = 5f2e86d9 698f0499 5fff11ff 00000000
!	%f28 = 0000807f ff0000ff 000000ff 00000000
	stda	%f16,[%i5+%g0]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	Mem[0000000010001400] = 000000ff, %l6 = 00000000ff000000
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = 0000b870, %l2 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	%f18 = ffffffff ffffffff, %l4 = 0000000000000005
!	Mem[0000000010181428] = 9b77ffe8467f42a7
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181428] = 9b77ffe8ffffffff
!	%l5 = 00000000000080ff, Mem[0000000030081410] = ff000000
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%f30 = 000000ff 00000000, %l2 = 0000000000000000
!	Mem[0000000010081428] = 7197169cffffffcb
	add	%i2,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010081428] = 7197169cffffffcb
!	Mem[0000000030181410] = 0000ff00, %l4 = 0000000000000005
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 000000000000ff00

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000000000000077, %l5 = 00000000000080ff
	ldxa	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000077
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010141408] = 000000ff, %f10 = 000000ff
	lda	[%i5+%o4]0x88,%f10	! %f10 = 000000ff
!	Mem[0000000030001400] = 00ff1059, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 99048f69 d9862e5f, %l0 = 000000ff, %l1 = d3c77967
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000099048f69 00000000d9862e5f
!	Mem[00000000100c1410] = ff169771, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff169771
!	Mem[0000000010141400] = 99048f69, %f14 = ff800000
	lda	[%i5+%g0]0x80,%f14	! %f14 = 99048f69
!	Mem[0000000010181408] = ff0000ff, %l7 = 00000000ff169771
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000010101410] = 029ec69a, %l6 = 00000000000000ff
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 000000000000009a
!	Mem[0000000010101408] = ffffffff, %l0 = 0000000099048f69
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	%f26 = 5fff11ff, %f0  = ffffffff
	fcmpes	%fcc0,%f26,%f0 		! %fcc0 = 3

p0_label_241:
!	Starting 10 instruction Store Burst
!	%f23 = 00000000, Mem[00000000300c1408] = 001142a7
	sta	%f23,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l5 = 0000000000000077, Mem[0000000010181410] = 7700000000000000
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000077
!	%l1 = 00000000d9862e5f, Mem[00000000201c0000] = ffff2e40
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 5fff2e40
!	Mem[0000000030081410] = ff000000, %l6 = 000000000000009a
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = ffffffffff000000
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l5 = 0000000000000077
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000000000ff00, Mem[0000000010141408] = 000000ff
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f14 = 99048f69 7f7b00ff, Mem[00000000100c1400] = 00000000 ff11ff5f
	stda	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = 99048f69 7f7b00ff
!	%f26 = 5fff11ff, Mem[00000000300c1410] = 000000ff
	sta	%f26,[%i3+%o5]0x81	! Mem[00000000300c1410] = 5fff11ff
!	Mem[0000000010001408] = 000000ff, %l4 = 000000000000ff00
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l5 = 00000000000000ff
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 119799b200000000, %f12 = 0000807f 4023fb18
	ldda	[%i3+%g0]0x89,%f12	! %f12 = 119799b2 00000000
!	Mem[0000000010001430] = ff000000, %l1 = 00000000d9862e5f
	ldsw	[%i0+0x030],%l1		! %l1 = ffffffffff000000
!	%l0 = ffffffffffffffff, %l4 = 00000000000000ff, %l4  = 00000000000000ff
	mulx	%l0,%l4,%l4		! %l4 = ffffffffffffff01
!	Mem[0000000010001408] = ff000000, %l4 = ffffffffffffff01
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030181400] = 59109b00, %l4 = ffffffffff000000
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 0000000059109b00
!	Mem[0000000030181408] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181420] = 00ff00d9, %l7 = 00000000ff0000ff
	ldsw	[%i6+0x020],%l7		! %l7 = 0000000000ff00d9
!	Mem[0000000010001400] = 000000ff, %f6  = 00000000
	lda	[%i0+%g0]0x88,%f6 	! %f6 = 000000ff
!	Mem[00000000300c1410] = 5fff11ffffff9d53, %l1 = ffffffffff000000
	ldxa	[%i3+%o5]0x81,%l1	! %l1 = 5fff11ffffff9d53

p0_label_243:
!	Starting 10 instruction Store Burst
!	%f5  = ff5700e8, %f14 = 99048f69, %f12 = 119799b2
	fdivs	%f5 ,%f14,%f12		! %f12 = 7f800000
!	Mem[00000000201c0001] = 5fff2e40, %l3 = ffffffffffffffff
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	%l7 = 0000000000ff00d9, Mem[0000000010181408] = ff0000ff
	stba	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = d90000ff
!	%l7 = 0000000000ff00d9, Mem[0000000030041408] = ff0000ff00000077
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000ff00d9
!	%l4 = 59109b00, %l5 = 000000ff, Mem[0000000030081400] = 00000000 7197169c
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 59109b00 000000ff
!	Mem[00000000100c1400] = 99048f697f7b00ff, %l0 = ffffffffffffffff, %l6 = 00000000000000ff
	casxa	[%i3]0x80,%l0,%l6	! %l6 = 99048f697f7b00ff
!	%l5 = 00000000000000ff, Mem[000000001010141c] = 00000000, %asi = 80
	stwa	%l5,[%i4+0x01c]%asi	! Mem[000000001010141c] = 000000ff
!	%l1 = 5fff11ffffff9d53, Mem[0000000030141408] = ffffffff
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 53ffffff
!	%l0 = ffffffffffffffff, Mem[0000000030101400] = e80057ff
	stba	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = e80057ff
!	%f10 = 000000ff 7f800000, %l6 = 99048f697f7b00ff
!	Mem[0000000030181438] = 000000ff00000000
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181438] = 000000ff7f800000

p0_label_244:
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000ff, %l5 = 00000000000000ff, %l1 = 5fff11ffffff9d53
	subc	%l5,%l5,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l7 = 0000000000ff00d9
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001412] = 9c000000, %l6 = 99048f697f7b00ff
	ldsb	[%i0+0x012],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %f24 = 5f2e86d9
	lda	[%i6+%g0]0x88,%f24	! %f24 = 00000000
!	Mem[0000000010001408] = ff000000ffffffff, %l5 = 00000000000000ff, %asi = 80
	ldxa	[%i0+0x008]%asi,%l5	! %l5 = ff000000ffffffff
!	Mem[0000000030001408] = ffffffff, %l3 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = 000000ff029ec69a, %l2 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l2	! %l2 = 000000ff029ec69a
!	Mem[00000000300c1408] = 00000000373f2d3f, %f10 = 000000ff 7f800000
	ldda	[%i3+%o4]0x81,%f10	! %f10 = 00000000 373f2d3f
!	Mem[0000000021800141] = ffe879f0, %l5 = ff000000ffffffff
	ldub	[%o3+0x141],%l5		! %l5 = 00000000000000e8
!	Mem[00000000100c1400] = 99048f69, %l4 = 0000000059109b00
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000009904

p0_label_245:
!	Starting 10 instruction Store Burst
!	%f22 = ff5700e8 00000000, Mem[0000000010101430] = 00000000 ffff00ff, %asi = 80
	stda	%f22,[%i4+0x030]%asi	! Mem[0000000010101430] = ff5700e8 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010041410] = e80057ff
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = e800ffff
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ff00b870, %l0 = ffffffffffffffff
	ldstub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141414] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x014]%asi,%l6	! %l6 = 0000000000000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030141400] = 00000000 7197169c
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff 00000000
!	%l7 = 0000000000000000, Mem[0000000010101408] = ffffffff
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f16 = 00000000 7197169c, Mem[0000000030141400] = ff000000 00000000
	stda	%f16,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 7197169c
!	%l0 = 00000000000000ff, Mem[0000000010041418] = 00000000, %asi = 80
	stwa	%l0,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 719716ff, %l5 = 00000000000000e8
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = 00000000000016ff
!	Mem[0000000010081400] = 0000fffd000000ff, %f12 = 7f800000 00000000
	ldda	[%i2+%g0]0x80,%f12	! %f12 = 0000fffd 000000ff
!	Mem[0000000010081408] = 000080ff, %l5 = 00000000000016ff
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c140c] = 00000000, %f12 = 0000fffd
	ld	[%i3+0x00c],%f12	! %f12 = 00000000
!	Mem[0000000030101408] = ff5700e8, %f24 = 00000000
	lda	[%i4+%o4]0x89,%f24	! %f24 = ff5700e8
!	Mem[0000000010101410] = 029ec69a, %f1  = 000000ff
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 029ec69a
!	Mem[0000000010101410] = 029ec69a, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 000000000000009a
!	Mem[0000000010141428] = 0530bf16 0000ff00, %l2 = 029ec69a, %l3 = ffffffff
	ldd	[%i5+0x028],%l2		! %l2 = 000000000530bf16 000000000000ff00
!	Mem[0000000010001430] = ff000000, %l7 = 0000000000000000, %asi = 80
	lduha	[%i0+0x030]%asi,%l7	! %l7 = 000000000000ff00
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030101400] = ff5700e8 0000ffff e80057ff 4023fb18
!	Mem[0000000030101410] = ff000000 ffffffff ff000000 4333ac0f
!	Mem[0000000030101420] = 54000000 56a0d062 606c110e 0fac18ed
!	Mem[0000000030101430] = 6c52c030 000080ff 606c110e a9373638
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400

p0_label_247:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001416] = 00000000, %l6 = 0000000000000000
	ldstub	[%i0+0x016],%l6		! %l6 = 0000000000000000
!	%f24 = 62d0a056 00000054, %l3 = 000000000000ff00
!	Mem[0000000010001400] = ff00000000000000
	stda	%f24,[%i0+%l3]ASI_PST16_P ! Mem[0000000010001400] = ff00000000000000
!	%l7 = 000000000000ff00, Mem[0000000030041408] = d900ff0000000000
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000ff00
!	Mem[0000000030181400] = 59109b00, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 0000000059109b00
!	Mem[0000000010081400] = 0000fffd, %l0 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (33)
!	%l3 = 000000000000ff00, Mem[0000000030101400] = ff5700e8
	stha	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = ff0000e8
!	Mem[0000000030041408] = 00000000, %l7 = 000000000000ff00
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 0000009c, %l1 = 000000000000009a
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 000000000000009c
!	%f28 = ff800000 30c0526c, Mem[0000000010181410] = 00000077 00000000
	stda	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = ff800000 30c0526c
!	%l2 = 0530bf16, %l3 = 0000ff00, Mem[0000000010001408] = 000000ff ffffffff
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0530bf16 0000ff00

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041422] = ffffffff, %l2 = 000000000530bf16
	ldub	[%i1+0x022],%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff40d0, %l3 = 000000000000ff00
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 029ec69a, %l5 = 0000000059109b00
	lduba	[%i4+%o5]0x88,%l5	! %l5 = 000000000000009a
!	%l2 = 00000000000000ff, %l1 = 000000000000009c, %l0 = 0000000000000000
	subc	%l2,%l1,%l0		! %l0 = 0000000000000063
!	Mem[00000000211c0000] = 00ff40d0, %l5 = 000000000000009a, %asi = 80
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	%f22 = 0fac3343, %f20 = ffffffff
	fcmpes	%fcc2,%f22,%f20		! %fcc2 = 3
!	%f22 = 0fac3343, %f21 = 000000ff
	fsqrts	%f22,%f21		! %f21 = 279476d8
!	Mem[00000000100c1428] = 5f649d53, %l1 = 000000000000009c, %asi = 80
	ldsha	[%i3+0x028]%asi,%l1	! %l1 = 0000000000005f64
!	Mem[0000000010041400] = 00000000000000ff, %f22 = 0fac3343 000000ff
	ldda	[%i1+%g0]0x80,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000010181408] = d90000ff, %l2 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffd900

p0_label_249:
!	Starting 10 instruction Store Burst
!	%f24 = 62d0a056 00000054, %l4 = 0000000000009904
!	Mem[0000000030101408] = e80057ff4023fb18
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101408] = e80057ff4023fb18
!	%l2 = ffffd900, %l3 = 000000ff, Mem[0000000010181408] = d90000ff 00000000
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffd900 000000ff
!	%l2 = ffffffffffffd900, Mem[00000000300c1410] = 5fff11ff
	stha	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = d90011ff
!	%f22 = 00000000 000000ff, Mem[0000000030101410] = 000000ff ffffffff
	stda	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 000000ff
!	%l0 = 00000063, %l1 = 00005f64, Mem[00000000300c1410] = d90011ff ffff9d53
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000063 00005f64
!	Mem[00000000300c1408] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f20 = ffffffff, %f4  = ff000000, %f31 = 0e116c60
	fadds	%f20,%f4 ,%f31		! %f31 = ffffffff
!	Mem[0000000030081408] = 169c0000, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 00000000169c0000
!	Mem[0000000010081410] = ff00ffff, %l3 = 00000000169c0000
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030001410] = ff3f0045
	stba	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 003f0045

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 9c169771 00000000 53ffffff ffffffff
!	Mem[0000000030141410] = ff00d13d 7c959c16 ff5700e8 00000000
!	Mem[0000000030141420] = 5f2e86d9 698f0499 5fff11ff 00000000
!	Mem[0000000030141430] = 0000807f ff0000ff 000000ff 00000000
	ldda	[%i5+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000010141400] = 99048f69, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000009904
!	Mem[0000000030001408] = ffffffff, %l0 = 0000000000000063
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000, %l0 = ffffffffffffffff
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00ff40d0, %l0 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 00000000000000ff, %l1 = 0000000000005f64
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141434] = 74f9a305, %l6 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x034]%asi,%l6	! %l6 = 00000000000074f9
!	Mem[000000001018141f] = ff1100ff, %l7 = 0000000000009904
	ldsb	[%i6+0x01f],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = 9c169771, %l7 = ffffffffffffffff
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000009c16
!	Mem[0000000030181408] = ffffffff ffffffff, %l4 = 00009904, %l5 = 00000000
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ffffffff 00000000ffffffff

p0_label_251:
!	Starting 10 instruction Store Burst
!	%f24 = 62d0a056 00000054, Mem[0000000010041408] = 00000000 00000000
	stda	%f24,[%i1+%o4]0x80	! Mem[0000000010041408] = 62d0a056 00000054
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = ffffffff
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	%l4 = 00000000ffffffff, Mem[0000000010041410] = ffc69e02e800ffff
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ffffffff
!	%l3 = 00000000000000ff, Mem[0000000030041400] = 0000957c00000000
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff
!	%l2 = ffffffffffffd900, Mem[0000000030181410] = 05000000
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffd900
!	%l1 = 00000000000000ff, Mem[0000000010041410] = ffffffff
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ffffff
!	Mem[0000000010041400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ffffd900, %l4 = 00000000ffffffff
	swap	[%i6+%o4],%l4		! %l4 = 00000000ffffd900
!	%l2 = ffffffffffffd900, Mem[0000000010181402] = 00000000
	stb	%l2,[%i6+0x002]		! Mem[0000000010181400] = 00000000
!	%l6 = 00000000000074f9, Mem[00000000300c1410] = 63000000
	stwa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000074f9

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %l2 = ffffffffffffd900
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181434] = 606c11ff, %l6 = 00000000000074f9, %asi = 80
	lduwa	[%i6+0x034]%asi,%l6	! %l6 = 00000000606c11ff
!	Mem[0000000010081408] = ff800000, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181408] = ffffffff, %l1 = 00000000ffffffff
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010141410] = 00000000, %l4 = 00000000ffffd900
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 16bf3005, %l6 = 00000000606c11ff
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000016bf3005
!	%l3 = 00000000000000ff, %l1 = 000000000000ffff, %l4 = 0000000000000000
	xor	%l3,%l1,%l4		! %l4 = 000000000000ff00
!	Mem[0000000010181400] = 00000000, %l4 = 000000000000ff00
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 99048f697f7b00ff, %l1 = 000000000000ffff
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = 99048f697f7b00ff

p0_label_253:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stha	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l7 = 0000000000009c16, Mem[0000000030001408] = ffffffffdbe222f9
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000009c16
!	%l5 = 00000000ffffffff, Mem[0000000030041410] = ffffffffffffffff
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000ffffffff
!	%l6 = 16bf3005, %l7 = 00009c16, Mem[0000000010101408] = 00000000 ffffffff
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 16bf3005 00009c16
!	%l2 = 00000000ff000000, Mem[0000000010181408] = ffffffff
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff00
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010181400] = 00000000 ff0000ff
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ffffffff
!	%l1 = 99048f697f7b00ff, Mem[0000000030181408] = ffffffff
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 7f7b00ff
!	Mem[0000000010101435] = 00000000, %l7 = 0000000000009c16
	ldstub	[%i4+0x035],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = 3dd100ff, %l1 = 000000007f7b00ff
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 000000003dd100ff
!	Mem[0000000030181400] = 00000000 7197169c ff007b7f ffffffff
!	%f0  = 00000000 7197169c ffffffff ffffff53
!	%f4  = 169c957c 3dd100ff 00000000 e80057ff
!	%f8  = 99048f69 d9862e5f 00000000 ff11ff5f
!	%f12 = ff0000ff 7f800000 00000000 ff000000
	stda	%f0 ,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 6d35c250, %l0 = 00000000000000ff
	ldub	[%o3+0x1c0],%l0		! %l0 = 000000000000006d
!	Mem[0000000010141428] = 0530bf160000ff00, %f24 = 62d0a056 00000054, %asi = 80
	ldda	[%i5+0x028]%asi,%f24	! %f24 = 0530bf16 0000ff00
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010181410] = ff80000030c0526c, %f30 = 383637a9 ffffffff
	ldda	[%i6+%o5]0x88,%f30	! %f30 = ff800000 30c0526c
!	Mem[0000000020800040] = fffdbea0, %l3 = 00000000000000ff
	ldsb	[%o1+0x040],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000016bf3005
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00ffffff, %l7 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000030081408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l1 = 000000003dd100ff
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_255:
!	Starting 10 instruction Store Burst
!	%f29 = 30c0526c, Mem[0000000030041400] = 00000000
	sta	%f29,[%i1+%g0]0x89	! Mem[0000000030041400] = 30c0526c
!	Code Fragment 4, seed = 673031
p0_fragment_25:
!	%l0 = 000000000000006d
	setx	0x00c0f54d3b3c06ee,%g7,%l0 ! %l0 = 00c0f54d3b3c06ee
!	%l1 = 0000000000000000
	setx	0xf012e8d60c3aa099,%g7,%l1 ! %l1 = f012e8d60c3aa099
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 00c0f54d3b3c06ee
	setx	0x9c6fd318e437a654,%g7,%l0 ! %l0 = 9c6fd318e437a654
!	%l1 = f012e8d60c3aa099
	setx	0x8c3804c1c4649b1f,%g7,%l1 ! %l1 = 8c3804c1c4649b1f
p0_fragment_25_end:
!	Mem[0000000010041408] = 62d0a056, %l0 = 9c6fd318e437a654
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000062
!	Mem[0000000030001408] = 00000000, %l2 = 00000000ff000000
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f2  = ffffffff ffffff53, Mem[00000000100c1408] = cbff0000 00000000
	std	%f2 ,[%i3+%o4]		! Mem[00000000100c1408] = ffffffff ffffff53
!	Mem[0000000030141408] = 53ffffff, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000053
!	%l2 = 0000000000000000, Mem[00000000201c0001] = 5fff2e40
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = 5f002e40
!	Mem[0000000010081410] = ff00ffff, %l0 = 0000000000000062
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f30 = ff800000, Mem[0000000010041410] = ffffff00
	sta	%f30,[%i1+%o5]0x88	! Mem[0000000010041410] = ff800000
!	Mem[00000000201c0001] = 5f002e40, %l4 = 0000000000000053
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000000

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l5 = 00000000ffffffff
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 0000ff000530bf16, %f30 = ff800000 30c0526c
	ldda	[%i0+%o4]0x88,%f30	! %f30 = 0000ff00 0530bf16
!	Mem[0000000030001408] = 000000ff, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800001] = ff00b870, %l5 = 0000000000000000
	ldub	[%o1+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041400] = ff000000 ff000000, %l0 = 000000ff, %l1 = c4649b1f
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff000000 00000000ff000000
!	Mem[0000000010081410] = ffff00ff, %f31 = 0530bf16
	lda	[%i2+%o5]0x88,%f31	! %f31 = ffff00ff
!	Mem[0000000030101400] = ffff0000 e80000ff, %l0 = ff000000, %l1 = ff000000
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000e80000ff 00000000ffff0000
!	Mem[00000000201c0000] = 5fff2e40, %l7 = 0000000000ffffff
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000005fff
!	Mem[0000000010001408] = 0530bf16, %l7 = 0000000000005fff
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 000000000000bf16
!	Mem[0000000010181418] = 24c9d13d, %f3  = ffffff53
	ld	[%i6+0x018],%f3 	! %f3 = 24c9d13d

p0_label_257:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e80000ff, Mem[0000000010001410] = 9a000000
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Mem[0000000030041400] = 6c52c030 000000ff ff000000 0000ff00
!	%f0  = 00000000 7197169c ffffffff 24c9d13d
!	%f4  = 169c957c 3dd100ff 00000000 e80057ff
!	%f8  = 99048f69 d9862e5f 00000000 ff11ff5f
!	%f12 = ff0000ff 7f800000 00000000 ff000000
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l3 = ffffffffffffffff, Mem[00000000100c1400] = 698f0499
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 698f04ff
!	%l3 = ffffffffffffffff, Mem[00000000100c1400] = 698f04ff
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 698fffff
!	%f10 = 00000000 ff11ff5f, Mem[0000000030141410] = ff007b7f 7c959c16
	stda	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 ff11ff5f
!	Mem[0000000010081400] = fdff00ff, %l0 = 00000000e80000ff
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000fdff00ff
!	Mem[0000000021800000] = d0623f00, %l3 = ffffffffffffffff
	ldstuba	[%o3+0x000]%asi,%l3	! %l3 = 00000000000000d0
!	Mem[0000000010081408] = ff800000, %l7 = 000000000000bf16
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000ff800000
!	%f24 = 0530bf16, Mem[0000000010181410] = 30c0526c
	sta	%f24,[%i6+%o5]0x88	! Mem[0000000010181410] = 0530bf16
!	%f22 = 00000000 000000ff, Mem[0000000010081428] = 7197169c ffffffcb, %asi = 80
	stda	%f22,[%i2+0x028]%asi	! Mem[0000000010081428] = 00000000 000000ff

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %l3 = 00000000000000d0
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 9ac69e02, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000009ac6
!	Mem[0000000030141400] = 7197169c, %l4 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000007197169c
!	Mem[0000000010101400] = 00000000719716ff, %l4 = 000000007197169c
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = 00000000719716ff
!	Mem[0000000010001428] = 0014d628, %l0 = 00000000fdff00ff, %asi = 80
	lduha	[%i0+0x028]%asi,%l0	! %l0 = 0000000000000014
!	Mem[0000000030081400] = 59109b00, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000059
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000030041408] = ffffffff 24c9d13d, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffffffff 0000000024c9d13d
!	Mem[00000000201c0000] = 5fff2e40, %l2 = 00000000ffffffff
	ldub	[%o0+%g0],%l2		! %l2 = 000000000000005f
!	Mem[0000000010141400] = 99048f69, %l4 = 00000000719716ff
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000009904
!	Mem[0000000010181408] = ffffff00, %f20 = ffffffff
	lda	[%i6+%o4]0x88,%f20	! %f20 = ffffff00

p0_label_259:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000005f, Mem[0000000010181408] = ffffff00
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff005f
!	%f26 = ed18ac0f 0e116c60, %l0 = 0000000000000014
!	Mem[00000000300c1438] = 34e901d23ca42f5b
	add	%i3,0x038,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1438] = 34e901d23ca42f5b
!	%l2 = 0000005f, %l3 = 24c9d13d, Mem[00000000300c1410] = 000074f9 645f0000
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000005f 24c9d13d
!	%l0 = 0000000000000014, Mem[00000000300c1408] = ffffffff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000014
!	Mem[0000000030081400] = 009b1059, %l7 = 00000000ff800000
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000009b1059
!	Mem[00000000211c0001] = 00ff40d0, %l3 = 0000000024c9d13d
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %l6 = 0000000000000059
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%f24 = 0530bf16 0000ff00, Mem[0000000010181410] = 16bf3005 000080ff
	stda	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = 0530bf16 0000ff00
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000009904
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 16bf3005, %l0 = 0000000000000014
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000005

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 59000000, %l7 = 00000000009b1059
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000059000000
!	Mem[0000000030101400] = ff0000e8 0000ffff, %l0 = 00000005, %l1 = ffff0000
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ff0000e8 000000000000ffff
!	Mem[00000000300c1408] = 14000000, %l3 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000001400
!	Mem[0000000010041400] = ff000000, %l2 = 000000000000005f
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00ff40d0, %l5 = 0000000000009ac6, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = ffffffff, %f18 = 18fb2340
	lda	[%i5+%o4]0x89,%f18	! %f18 = ffffffff
!	Mem[0000000030041400] = 000000007197169c, %f24 = 0530bf16 0000ff00
	ldda	[%i1+%g0]0x81,%f24	! %f24 = 00000000 7197169c
!	Mem[00000000100c1416] = ff110000, %l6 = 00000000ff000000, %asi = 80
	ldsha	[%i3+0x016]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141418] = 00000000 00ff0000, %l6 = 00000000, %l7 = 59000000
	ldd	[%i5+0x018],%l6		! %l6 = 0000000000000000 0000000000ff0000
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_261:
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 000000ff, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x01c]%asi,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041408] = ffffffff
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff00ff
!	Mem[0000000030101400] = ff0000e8, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%f24 = 00000000, %f29 = 30c0526c, %f20 = ffffff00 279476d8
	fsmuld	%f24,%f29,%f20		! %f20 = 00000000 00000000
!	Mem[0000000030101400] = e80000ff, %l3 = 0000000000001400
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000e80000ff
!	%l3 = 00000000e80000ff, Mem[0000000020800040] = fffdbea0
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ffbea0
!	%f22 = 00000000, Mem[0000000010181408] = 5f00ffff
	sta	%f22,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l1 = 000000000000ffff, Mem[00000000100c1400] = ffff8f69
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff8f69
!	%l3 = 00000000e80000ff, Mem[0000000010181400] = 00000000
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030001400] = 00ff1059, %l3 = 00000000e80000ff
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = ff352190, %l1 = 000000000000ffff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = ffffffffffffff35
!	Mem[0000000010141400] = 99048f69, %f10 = 00000000
	lda	[%i5+%g0]0x80,%f10	! %f10 = 99048f69
!	Mem[00000000300c1400] = 119799b2 000000ff, %l6 = 000000ff, %l7 = 00ff0000
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000119799b2
!	Mem[0000000030101408] = ff5700e8, %l7 = 00000000119799b2
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffffe8
!	Mem[0000000010141418] = 00000000, %l7 = ffffffffffffffe8, %asi = 80
	ldswa	[%i5+0x018]%asi,%l7	! %l7 = 0000000000000000
!	%f30 = 0000ff00 ffff00ff, Mem[0000000010141400] = 698f0499 5f2e86d9
	stda	%f30,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ff00 ffff00ff
!	Mem[00000000300c1408] = 14000000373f2d3f, %f14 = 00000000 ff000000
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 14000000 373f2d3f
!	Mem[000000001008141e] = 000000ff, %l2 = 0000000000000000, %asi = 80
	lduba	[%i2+0x01e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1404] = 7f7b00ff, %l7 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x004]%asi,%l7	! %l7 = 000000007f7b00ff
!	Mem[0000000030041400] = 9c169771 00000000, %l6 = 000000ff, %l7 = 7f7b00ff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000 000000009c169771

p0_label_263:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 59000000, %l1 = 00000000ffffff35
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000059000000
!	%l6 = 00000000, %l7 = 9c169771, Mem[0000000010081408] = 16bf0000 ffffffff, %asi = 80
	stda	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000 9c169771
!	%f22 = 00000000 000000ff, %l6 = 0000000000000000
!	Mem[0000000030141400] = 9c16977100000000
	stda	%f22,[%i5+%l6]ASI_PST16_SL ! Mem[0000000030141400] = 9c16977100000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = ffff00ff
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff0000
!	Mem[0000000021800140] = ffe879f0, %l1 = 0000000059000000
	ldstub	[%o3+0x140],%l1		! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030041410] = ff00d13d7c959c16
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	%f18 = ffffffff ff5700e8, Mem[00000000300c1410] = 5f000000 3dd1c924
	stda	%f18,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff ff5700e8
!	Mem[0000000010141420] = a4c9d13d, %l0 = 00000000ff0000e8, %asi = 80
	swapa	[%i5+0x020]%asi,%l0	! %l0 = 00000000a4c9d13d
!	%f23 = 000000ff, Mem[0000000030081400] = ff800000
	sta	%f23,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 698fffff
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 698fff00

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffff35, %l0 = 00000000a4c9d13d
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffff35
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = ffffffffffffff35, %l1 = 00000000000000ff, %y  = ff0000ff
	umul	%l0,%l1,%l7		! %l7 = 000000feffff35cb, %y = 000000fe
!	Mem[00000000211c0000] = 00ff40d0, %l7 = 000000feffff35cb, %asi = 80
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c140c] = ffffff53, %l7 = 0000000000000000
	ldsh	[%i3+0x00c],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l7 = ffffffffffffffff
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ffff1059, %f11 = ff11ff5f
	lda	[%i0+%g0]0x81,%f11	! %f11 = ffff1059
!	Mem[0000000030101400] = 00140000, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = 0000000000140000
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_265:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 9ac69e02, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 000000000000009a
!	%l1 = 000000000000009a, Mem[00000000300c1410] = ffffffff
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000009a
!	%l6 = 00000000000000ff, Mem[0000000010141400] = ff00ffff
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff00ffff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010141408] = 00000000 0000ffff, %asi = 80
	stda	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000ff 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141408] = 000000ff000000ff
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = 14000000
	stba	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%l1 = 000000000000009a, Mem[0000000030181410] = 169c957c
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 009a957c
!	%f4  = 169c957c 3dd100ff, %l4 = 00000000000000ff
!	Mem[0000000030041428] = 00000000ff11ff5f
	add	%i1,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_S ! Mem[0000000030041428] = 169c957c3dd100ff
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010181400] = ffffffff000000ff
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 9a000000, %l2 = 0000000000140000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 000000009a000000
!	Mem[0000000030141410] = 00000000, %l2 = 000000009a000000
	lduwa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffffffff35
	ldswa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 18fb2340 ff5700e8, %l0 = 00000000, %l1 = 0000009a
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000ff5700e8 0000000018fb2340
!	Mem[0000000030181400] = 9c169771 00000000, %l0 = ff5700e8, %l1 = 18fb2340
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000 000000009c169771
!	Mem[0000000010041408] = ffd0a056, %l6 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ffd0
!	Mem[0000000030041410] = ff000000, %l6 = 000000000000ffd0
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = ff0000ff, %l1 = 000000009c169771
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010041408] = 56a0d0ff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffd0ff
!	Mem[00000000300c1410] = 0000009aff5700e8, %l7 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 0000009aff5700e8

p0_label_267:
!	Starting 10 instruction Store Burst
!	%f11 = ffff1059, %f15 = 373f2d3f
	fcmpes	%fcc1,%f11,%f15		! %fcc1 = 3
!	Mem[0000000010001410] = ffffff35, %l7 = 00000000ff5700e8
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ffffff35
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	ldsw	[%i6+%o4],%l5		! %l5 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030101410] = 000000ff
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l6 = 00000000000000ff, Mem[0000000030141408] = ffffffff
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff00ff
!	Code Fragment 3, seed = 308214
p0_fragment_26:
!	%l0 = 0000000000000000
	setx	0xe9dff9d3b7d5ae76,%g7,%l0 ! %l0 = e9dff9d3b7d5ae76
!	%l1 = ffffffffff0000ff
	setx	0x3ec225c3246051a1,%g7,%l1 ! %l1 = 3ec225c3246051a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e9dff9d3b7d5ae76
	setx	0xca6ed479ba0928dc,%g7,%l0 ! %l0 = ca6ed479ba0928dc
!	%l1 = 3ec225c3246051a1
	setx	0x872b795c31973727,%g7,%l1 ! %l1 = 872b795c31973727
p0_fragment_26_end:
!	Code Fragment 3, seed = 657124
p0_fragment_27:
!	%l0 = ca6ed479ba0928dc
	setx	0x48f986d7b2576506,%g7,%l0 ! %l0 = 48f986d7b2576506
!	%l1 = 872b795c31973727
	setx	0x9b6d6ef982638331,%g7,%l1 ! %l1 = 9b6d6ef982638331
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 48f986d7b2576506
	setx	0x5fd8ddbc5db0e56c,%g7,%l0 ! %l0 = 5fd8ddbc5db0e56c
!	%l1 = 9b6d6ef982638331
	setx	0xf0226ea46cd98eb7,%g7,%l1 ! %l1 = f0226ea46cd98eb7
p0_fragment_27_end:
!	Mem[0000000010181400] = ff00000000000000, %l4 = 00000000000000ff, %l6 = 00000000000000ff
	casxa	[%i6]0x80,%l4,%l6	! %l6 = ff00000000000000
!	%l6 = ff00000000000000, Mem[0000000030181408] = ffffffff
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l0 = 5db0e56c, %l1 = 6cd98eb7, Mem[0000000010041410] = 000080ff 00000000
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 5db0e56c 6cd98eb7

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 18fb2340ff5700e8, %f28 = ff800000 30c0526c
	ldda	[%i4+%o4]0x89,%f28	! %f28 = 18fb2340 ff5700e8
!	Mem[0000000010081408] = 00000000, %l3 = ffffffffffffd0ff
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000000ff000000, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1438] = ff000000, %l7 = 00000000ffffff35, %asi = 80
	lduwa	[%i3+0x038]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010181418] = 24c9d13dff1100ff, %f10 = 99048f69 ffff1059
	ldd	[%i6+0x018],%f10	! %f10 = 24c9d13d ff1100ff
!	%l0 = 5fd8ddbc5db0e56c, immd = 0000000000000f60, %l108 = 0000000000000000
	udivx	%l0,0xf60,%l0		! %l0 = 00063be4cbbb2ab9
!	Mem[000000001008143f] = ffffffff, %l6 = ff00000000000000
	ldsb	[%i2+0x03f],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000ff, %l0 = 00063be4cbbb2ab9
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000b2999711, %l1 = f0226ea46cd98eb7
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = ff000000b2999711
!	%l3 = 00000000ff000000, %l1 = ff000000b2999711, %l6 = ffffffffffffffff
	sdivx	%l3,%l1,%l6		! %l6 = 0000000000000000

p0_label_269:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1408] = ffffffff
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ffff
!	%f5  = 3dd100ff, Mem[0000000010101408] = 16bf30ff
	sta	%f5 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 3dd100ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010181410] = 16bf3005 00ff0000
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 00000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010141408] = ff00000000000000
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 000000ff
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%f4  = 169c957c, Mem[00000000100c1408] = ffff0000
	sta	%f4 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 169c957c
!	%f8  = 99048f69, Mem[0000000030001400] = 5910ffff
	sta	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 99048f69
!	%l3 = 00000000ff000000, Mem[0000000010181408] = ff00000000000000
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000ff000000
!	Mem[0000000010001410] = e80057ff0000ff00, %l3 = 00000000ff000000, %l4 = 00000000000000ff
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = e80057ff0000ff00

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff00000000000000, %l0 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = ff00000000000000
!	%l3 = 00000000ff000000, %l2 = 0000000000000000, %l5 = 0000000000000000
	xnor	%l3,%l2,%l5		! %l5 = ffffffff00ffffff
!	Mem[0000000030081410] = a4c9d13d000000ff, %l3 = 00000000ff000000
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = a4c9d13d000000ff
!	Mem[0000000010181430] = ff000000, %l0 = ff00000000000000, %asi = 80
	ldsba	[%i6+0x030]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001018143a] = e80057ff, %l7 = 00000000ff000000
	ldsh	[%i6+0x03a],%l7		! %l7 = 00000000000057ff
!	%f8  = 99048f69, %f3  = 24c9d13d, %f23 = 000000ff
	fadds	%f8 ,%f3 ,%f23		! %f23 = 24c9d13c
!	Mem[0000000020800040] = 00ffbea0, %l4 = e80057ff0000ff00, %asi = 80
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000057ff
	ldsw	[%i4+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101408] = ff5700e8, %l7 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000e8
!	Mem[00000000100c1408] = 169c957c, %l1 = ff000000b2999711
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 000000000000007c

p0_label_271:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[00000000300c1408] = 3f2d3f37000000ff
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffffffffffff
!	Mem[00000000100c141c] = 000000ff, %l4 = 00000000000000ff
	swap	[%i3+0x01c],%l4		! %l4 = 00000000000000ff
!	%l1 = 000000000000007c, Mem[0000000010181400] = ff000000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000007c
!	%f30 = 0000ff00 ffff00ff, %l3 = a4c9d13d000000ff
!	Mem[0000000030001430] = 4e95d6d46815a715
	add	%i0,0x030,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001430] = 0000ff00ffff00ff
!	%l6 = 0000000000000000, Mem[0000000010141410] = 000000ff
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	%l7 = 00000000000000e8, Mem[00000000100c1410] = 000011ff719716ff
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000e8
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ffff00ff
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff00ff
!	%l5 = ffffffff00ffffff, Mem[0000000030181400] = 9c16977100000000
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff00ffffff
!	%f28 = 18fb2340 ff5700e8, Mem[0000000010181428] = 9b77ffe8 ffffffff
	std	%f28,[%i6+0x028]	! Mem[0000000010181428] = 18fb2340 ff5700e8

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 7c959a00, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffff9a00
!	Mem[0000000010181410] = ff000000, %l2 = ffffffffffff9a00, %asi = 80
	ldswa	[%i6+0x010]%asi,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141410] = 000000ff, %l5 = ffffffff00ffffff
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 009a957c, %l1 = 000000000000007c
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = 000000000000009a
!	Mem[00000000211c0000] = 00ff40d0, %l4 = 00000000000000ff
	lduh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 698f0499606c11ff, %f22 = 00000000 24c9d13c
	ldda	[%i0+%g0]0x81,%f22	! %f22 = 698f0499 606c11ff
!	Mem[0000000010181408] = 00000000 ff000000, %l6 = 00000000, %l7 = 000000e8
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1400] = 698fff00, %l0 = ffffffffffffffff
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 00000000698fff00
!	Mem[00000000300c1410] = 9a000000, %f28 = 18fb2340
	lda	[%i3+%o5]0x89,%f28	! %f28 = 9a000000
!	Mem[0000000030181400] = ffffffff00ffffff, %f28 = 9a000000 ff5700e8
	ldda	[%i6+%g0]0x89,%f28	! %f28 = ffffffff 00ffffff

p0_label_273:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000698fff00, Mem[0000000010001400] = ff000000
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l6 = 00000000ff000000, Mem[0000000030181408] = 00000000ffffff53
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000ff000000
!	%f30 = 0000ff00 ffff00ff, %l2 = ffffffffff000000
!	Mem[0000000030181418] = 00000000e80057ff
	add	%i6,0x018,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181418] = 00000000e80057ff
!	%f0  = 00000000 7197169c, Mem[0000000010041420] = ffffffff ffff00ff, %asi = 80
	stda	%f0 ,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000 7197169c
!	%l4 = 000000ff, %l5 = 00000000, Mem[00000000100c1410] = 000000e8 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 00000000
!	%l5 = 0000000000000000, Mem[0000000030141408] = ffff00ff
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000010041408] = 56a0d0ff, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = 698f0499, %l1 = 000000000000009a
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000069
!	%l1 = 0000000000000069, Mem[0000000030081408] = ff0000ff
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 690000ff
!	Mem[0000000030081400] = 000000ff, %l2 = ffffffffff000000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 7c959c16, %l0 = 00000000698fff00
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 000000000000007c
!	Mem[00000000100c143c] = 000080ff, %l3 = a4c9d13d000000ff
	ldsh	[%i3+0x03c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %l6 = 00000000ff000000
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001400] = ff8f0499606c11ff, %l0 = 000000000000007c
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = ff8f0499606c11ff
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 000000ff, %f31 = ffff00ff
	lda	[%i1+%g0]0x80,%f31	! %f31 = 000000ff
!	Mem[00000000211c0000] = 00ff40d0, %l7 = 00000000000000ff
	ldsh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 0000ff00ffff00ff, %f0  = 00000000 7197169c
	ldda	[%i5+%g0]0x88,%f0 	! %f0  = 0000ff00 ffff00ff
!	Mem[0000000010181400] = 7c000000, %l3 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_275:
!	Starting 10 instruction Store Burst
!	%f10 = 24c9d13d ff1100ff, Mem[0000000010181400] = 0000007c 00000000
	stda	%f10,[%i6+%g0]0x80	! Mem[0000000010181400] = 24c9d13d ff1100ff
!	Mem[0000000010101410] = 029ec6ff, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 00000000029ec6ff
!	Mem[00000000201c0001] = 5fff2e40, %l5 = 0000000000000000
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	%l1 = 0000000000000069, Mem[00000000100c1410] = 00000000000000ff
	stxa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000069
!	%l3 = 0000000000000000, %l1 = 0000000000000069, %l5 = 00000000000000ff
	udivx	%l3,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%f2  = ffffffff 24c9d13d, %l3 = 0000000000000000
!	Mem[0000000030101400] = 001400000000ffff
	stda	%f2,[%i4+%l3]ASI_PST32_SL ! Mem[0000000030101400] = 001400000000ffff
!	%f16 = ffff0000 e80057ff, Mem[00000000100c1428] = 5f649d53 a63e7500
	std	%f16,[%i3+0x028]	! Mem[00000000100c1428] = ffff0000 e80057ff
!	Mem[0000000010081410] = ffff00ff, %l2 = 00000000029ec6ff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000201c0001] = 5fff2e40, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = 5fff2e40

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff00d13d, %l6 = ffffffffff000000, %asi = 80
	lduwa	[%i4+0x008]%asi,%l6	! %l6 = 00000000ff00d13d
!	Mem[0000000010041408] = ffd0a05600000054, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = ffd0a05600000054
!	Mem[0000000010081439] = ffffffff, %l6 = 00000000ff00d13d, %asi = 80
	ldsba	[%i2+0x039]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000009aff5700e8, %l2 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 0000009aff5700e8
!	Mem[0000000030081400] = 000000ff, %f4  = 169c957c
	lda	[%i2+%g0]0x89,%f4 	! %f4 = 000000ff
!	Mem[0000000030081408] = 690000ff, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = 00000000690000ff
!	Mem[0000000030081410] = ff000000, %l4 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101410] = 000000ff, %l0 = ff8f0499606c11ff
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Code Fragment 4, seed = 379933
p0_fragment_28:
!	%l0 = ffffffffffffffff
	setx	0x311db536f240c43e,%g7,%l0 ! %l0 = 311db536f240c43e
!	%l1 = 0000000000000069
	setx	0x00c1302200e91ce9,%g7,%l1 ! %l1 = 00c1302200e91ce9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 311db536f240c43e
	setx	0x20d65f43388fb1a4,%g7,%l0 ! %l0 = 20d65f43388fb1a4
!	%l1 = 00c1302200e91ce9
	setx	0xcfebe6b4d29d056f,%g7,%l1 ! %l1 = cfebe6b4d29d056f
p0_fragment_28_end:
!	Mem[0000000030081410] = ff000000, %l2 = 0000009aff5700e8
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ff00

p0_label_277:
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff, %f11 = ff1100ff, %f31 = 000000ff
	fdivs	%f4 ,%f11,%f31		! %f31 = 80000000
!	Mem[00000000100c1408] = 169c957c, %l7 = 00000000690000ff
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000169c957c
!	%f24 = 00000000 7197169c, Mem[0000000010001410] = e80057ff 0000ff00
	stda	%f24,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 7197169c
!	%f28 = ffffffff 00ffffff, Mem[0000000030181408] = 00000000 000000ff
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff 00ffffff
!	Mem[0000000010041400] = 000000ff 000000ff ffd0a056 00000054
!	%f0  = 0000ff00 ffff00ff ffffffff 24c9d13d
!	%f4  = 000000ff 3dd100ff 00000000 e80057ff
!	%f8  = 99048f69 d9862e5f 24c9d13d ff1100ff
!	%f12 = ff0000ff 7f800000 14000000 373f2d3f
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%l7 = 00000000169c957c, Mem[00000000211c0001] = 00ff40d0, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = 007c40d0
!	%f11 = ff1100ff, %f12 = ff0000ff, %f16 = ffff0000
	fdivs	%f11,%f12,%f16		! %f16 = 3f90ffde
!	Mem[0000000010001430] = ff000000, %l2 = 000000000000ff00
	swap	[%i0+0x030],%l2		! %l2 = 00000000ff000000
!	%f29 = 00ffffff, Mem[0000000010041410] = 000000ff
	sta	%f29,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ffffff
!	%l4 = 000000000000ff00, Mem[0000000010101400] = 00000000
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000e80000ff, %l6 = ffffffffffffffff
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = ff000000e80000ff
!	%f11 = ff1100ff, %f22 = 698f0499, %f29 = 00ffffff
	fadds	%f11,%f22,%f29		! %f29 = ff1100ff
!	Mem[00000000100c143c] = 000080ff, %l3 = ffd0a05600000054, %asi = 80
	ldswa	[%i3+0x03c]%asi,%l3	! %l3 = 00000000000080ff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010041400] = 0000ff00 ffff00ff, %l4 = 0000ff00, %l5 = 00000000, %asi = 80
	ldda	[%i1+0x000]%asi,%l4	! %l4 = 000000000000ff00 00000000ffff00ff
!	Mem[0000000030141410] = ff000000ff11ff5f, %f0  = 0000ff00 ffff00ff
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = ff000000 ff11ff5f
!	Mem[0000000010001408] = 16bf3005, %l2 = 00000000ff000000
	ldsba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000016
!	%l5 = 00000000ffff00ff, immd = fffffffffffff133, %l1  = cfebe6b4d29d056f
	mulx	%l5,-0xecd,%l1		! %l1 = fffff1330ebe41cd
!	Mem[00000000100c1400] = 00ff8f69 7f7b00ff, %l4 = 0000ff00, %l5 = ffff00ff
	ldd	[%i3+%g0],%l4		! %l4 = 0000000000ff8f69 000000007f7b00ff
!	Mem[0000000030041408] = 0000ffff 24c9d13d, %l2 = 00000016, %l3 = 000080ff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 000000000000ffff 0000000024c9d13d
!	%f12 = ff0000ff 7f800000, %l2 = 000000000000ffff
!	Mem[00000000100c1408] = ff000069ffffff53
	add	%i3,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_P ! Mem[00000000100c1408] = ff0000ff7f800000

p0_label_279:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 009a957c, %l6 = ff000000e80000ff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%f6  = 00000000 e80057ff, Mem[0000000010041410] = 00ffffff 3dd100ff
	stda	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 e80057ff
!	%l2 = 000000000000ffff, Mem[0000000030041410] = ff00000000000000
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000ffff
!	Mem[0000000010141410] = 000000ff, %l2 = 000000000000ffff
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = 24c9d13d, Mem[0000000010181410] = 000000ff 00000000
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 24c9d13d
!	%l5 = 000000007f7b00ff, Mem[0000000010081438] = ffffffff
	stw	%l5,[%i2+0x038]		! Mem[0000000010081438] = 7f7b00ff
!	%l5 = 000000007f7b00ff, Mem[0000000030041410] = 00000000
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Mem[0000000030081410] = ff000000, %l5 = 000000007f7b00ff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	%f18 = ffffffff ff5700e8, %l2 = 0000000000000000
!	Mem[00000000300c1430] = 08044d69ff0000ff
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1430] = 08044d69ff0000ff
!	%f30 = 0000ff00, Mem[0000000010101410] = 000000ff
	sta	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ff00

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[000000001008141c] = 000000ff, %l4 = 0000000000ff8f69
	lduh	[%i2+0x01c],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081408] = 000000009c169771, %f6  = 00000000 e80057ff
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = 00000000 9c169771
!	Mem[0000000030181410] = 7c959aff, %l0 = 20d65f43388fb1a4
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 000000007c959aff
!	Mem[0000000010101421] = 5f2e86d9, %l2 = 0000000000000000, %asi = 80
	ldsba	[%i4+0x021]%asi,%l2	! %l2 = 000000000000002e
!	Mem[0000000030041408] = 0000ffff 24c9d13d, %l6 = 00000000, %l7 = 169c957c
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 000000000000ffff 0000000024c9d13d
!	Mem[0000000010041410] = 00000000, %l3 = 0000000024c9d13d
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000024c9d13d, %l7 = 0000000024c9d13d, %l7  = 0000000024c9d13d
	mulx	%l7,%l7,%l7		! %l7 = 054961f364cea889
!	Mem[0000000030041410] = ff000000, %l6 = 000000000000ffff
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030181400] = ffffff00, %f0  = ff000000
	lda	[%i6+%g0]0x81,%f0 	! %f0 = ffffff00
!	Mem[0000000010181400] = 24c9d13d, %l2 = 000000000000002e
	ldsw	[%i6+%g0],%l2		! %l2 = 0000000024c9d13d

p0_label_281:
!	Starting 10 instruction Store Burst
!	%l7 = 054961f364cea889, Mem[0000000010081422] = ffcb8f69, %asi = 80
	stba	%l7,[%i2+0x022]%asi	! Mem[0000000010081420] = ffcb8969
!	Code Fragment 4, seed = 101199
p0_fragment_29:
!	%l0 = 000000007c959aff
	setx	0xe0bb18b19c029cae,%g7,%l0 ! %l0 = e0bb18b19c029cae
!	%l1 = fffff1330ebe41cd
	setx	0xf442cf3106404a59,%g7,%l1 ! %l1 = f442cf3106404a59
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e0bb18b19c029cae
	setx	0x145e418f6fe02414,%g7,%l0 ! %l0 = 145e418f6fe02414
!	%l1 = f442cf3106404a59
	setx	0xf455551a07c7acdf,%g7,%l1 ! %l1 = f455551a07c7acdf
p0_fragment_29_end:
!	%l6 = ffffffffff000000, Mem[0000000030141400] = 7197169c
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 71970000
!	%f27 = 0e116c60, Mem[0000000010001400] = 00000000
	sta	%f27,[%i0+%g0]0x88	! Mem[0000000010001400] = 0e116c60
!	%l1 = f455551a07c7acdf, Mem[0000000030001408] = ff000000
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 07c7acdf
!	%f28 = ffffffff ff1100ff, Mem[0000000010041410] = 00000000 e80057ff
	stda	%f28,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff ff1100ff
!	Mem[0000000030041410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000ff000000, Mem[0000000030181400] = ffffffff00ffffff
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000ff000000
!	%l1 = f455551a07c7acdf, Mem[0000000021800180] = ffff6020
	sth	%l1,[%o3+0x180]		! Mem[0000000021800180] = acdf6020
!	%l0 = 145e418f6fe02414, Mem[0000000010101410] = 000000ff0000ff00
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 145e418f6fe02414

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 698fff00, %f15 = 373f2d3f
	lda	[%i3+%g0]0x88,%f15	! %f15 = 698fff00
!	Mem[0000000010181400] = 24c9d13dff1100ff, %f6  = 00000000 9c169771
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = 24c9d13d ff1100ff
!	Mem[0000000010041400] = 00ff0000, %l0 = 145e418f6fe02414
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000030081408] = ff000069, %l5 = 00000000ff000000
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = ffffffffff000069
!	Mem[00000000300c1400] = ff000000, %l7 = 054961f364cea889
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[00000000100c143c] = 000080ff, %l2 = 0000000024c9d13d
	ldsh	[%i3+0x03c],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 69000000, %f26 = ed18ac0f
	lda	[%i3+%o5]0x80,%f26	! %f26 = 69000000
!	Mem[0000000010181400] = 3dd1c924, %f9  = d9862e5f
	lda	[%i6+%g0]0x88,%f9 	! %f9 = 3dd1c924
!	Mem[0000000021800100] = 00ff0fc0, %l0 = 0000000000ff0000
	ldub	[%o3+0x100],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l7 = ffffffffff000000
	ldsba	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_283:
!	Starting 10 instruction Store Burst
!	%f20 = 00000000, %f26 = 69000000
	fcmpes	%fcc2,%f20,%f26		! %fcc2 = 1
!	%f6  = 24c9d13d ff1100ff, %l6 = ffffffffff000000
!	Mem[0000000030041428] = 169c957c3dd100ff
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041428] = 169c957c3dd100ff
!	%l4 = 00000000000000ff, Mem[00000000211c0000] = 007c40d0, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff40d0
!	%f2  = ffffffff, %f30 = 0000ff00, %f16 = 3f90ffde
	fadds	%f2 ,%f30,%f16		! %f16 = ffffffff
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000010141410] = ff0000ff 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 ffffffff
!	%l7 = ffffffffffffffff, Mem[00000000100c1408] = 0000807fff0000ff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffffffffffff
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f2  = ffffffff 24c9d13d, %l0 = 0000000000000000
!	Mem[00000000300c1428] = 537ade060a316a3f
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1428] = 537ade060a316a3f
!	%l6 = ffffffffff000000, Mem[0000000030101408] = 18fb2340ff5700e8
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffffff000000
!	%l0 = 0000000000000000, Mem[0000000020800041] = 00ffbea0, %asi = 80
	stba	%l0,[%o1+0x041]%asi	! Mem[0000000020800040] = 0000bea0

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 1424e06f8f415e14, %f0  = ffffff00 ff11ff5f, %asi = 80
	ldda	[%i4+0x010]%asi,%f0 	! %f0  = 1424e06f 8f415e14
!	%f7  = ff1100ff, %f6  = 24c9d13d ff1100ff
	fstox	%f7 ,%f6 		! %f6  = 80000000 00000000
!	Mem[0000000010181408] = 000000ff00000000, %l6 = ffffffffff000000
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 000000ff00000000
!	Mem[0000000030101400] = 00140000, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 0000ff00ffff00ff, %f10 = 24c9d13d ff1100ff
	ldda	[%i1+%g0]0x80,%f10	! %f10 = 0000ff00 ffff00ff
!	Mem[00000000300c1410] = 9a000000, %l5 = ffffffffff000069
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1428] = ffff0000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x028]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff, %l6 = 000000ff00000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = ffffffffffffffff, immd = ffffffa5, %y  = 000000fe
	smul	%l0,-0x05b,%l3		! %l3 = 000000000000005b, %y = 00000000
!	Mem[0000000010141408] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_285:
!	Starting 10 instruction Store Burst
!	%l1 = f455551a07c7acdf, Mem[0000000010001437] = 000000ff, %asi = 80
	stba	%l1,[%i0+0x037]%asi	! Mem[0000000010001434] = 000000df
!	%l0 = ffffffffffffffff, Mem[0000000010181400] = 24c9d13d
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffff
!	Mem[0000000030041408] = 0000ffff, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030041408] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l2 = 000000ff, %l3 = 0000005b, Mem[0000000010181410] = 00000000 24c9d13d
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 0000005b
!	Mem[0000000010141400] = ff00ffff 00ff0000 00000000 00000000
!	%f0  = 1424e06f 8f415e14 ffffffff 24c9d13d
!	%f4  = 000000ff 3dd100ff 80000000 00000000
!	%f8  = 99048f69 3dd1c924 0000ff00 ffff00ff
!	%f12 = ff0000ff 7f800000 14000000 698fff00
	stda	%f0 ,[%i5+%g0]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%l5 = 000000000000ffff, Mem[0000000010041410] = ffffffff
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	%l0 = ffffffff, %l1 = 07c7acdf, Mem[00000000300c1400] = ff000000 b2999711
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff 07c7acdf
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000010081400] = e80000ff ff000000
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 0000ffff
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 9a000000
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l6 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081434] = 7f800000, %l1 = f455551a07c7acdf
	lduh	[%i2+0x034],%l1		! %l1 = 0000000000007f80
!	Mem[0000000030101408] = ffffffffff000000, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030081408] = 00000000 ff000069, %l2 = 000000ff, %l3 = 0000005b
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000ff000069 0000000000000000
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l6 = ffffffffff000000
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010081414] = 000000ff, %f21 = 00000000
	ld	[%i2+0x014],%f21	! %f21 = 000000ff
!	Mem[0000000010001408] = 0530bf16, %f24 = 00000000
	lda	[%i0+%o4]0x88,%f24	! %f24 = 0530bf16
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010141400] = 1424e06f8f415e14, %l2 = 00000000ff000069
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 1424e06f8f415e14

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 16bf3005, %l1 = 0000000000007f80
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000016
!	Mem[0000000030001408] = dfacc707, %l5 = 000000000000ffff
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 00000000dfacc707
!	%f4  = 000000ff 3dd100ff, Mem[0000000030041410] = 000000ff ffff0000
	stda	%f4 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 3dd100ff
!	Mem[0000000010181408] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f26 = 69000000, %f3  = 24c9d13d, %f6  = 80000000
	fadds	%f26,%f3 ,%f6 		! %f6  = 69000000
!	Mem[0000000010141400] = 6fe02414, %l0 = 00000000ffffffff
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 000000006fe02414
!	%f10 = 0000ff00 ffff00ff, Mem[00000000100c1438] = ff000000 000080ff, %asi = 80
	stda	%f10,[%i3+0x038]%asi	! Mem[00000000100c1438] = 0000ff00 ffff00ff
!	%l5 = 00000000dfacc707, Mem[0000000030181410] = ff00d13d7c959aff
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000dfacc707
!	Mem[0000000010141410] = ff000000, %l2 = 1424e06f8f415e14
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = 000000006fe02414, Mem[0000000030101410] = 0000000000000000
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000006fe02414

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 606c110e, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 00000000606c110e
!	Mem[0000000010101400] = 000000ff, %l0 = 000000006fe02414
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = ffffffff, %l4 = 00000000606c110e
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000300c1400] = ffffffff, %l6 = 00000000ffffffff
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010101410] = 6fe02414, %l6 = 00000000ffffffff
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000014
!	Mem[0000000010001400] = 606c110e, %l4 = 00000000ffffffff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000606c
!	Mem[00000000100c1400] = 00ff8f69, %l4 = 000000000000606c
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 00000000ffffffff, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030101408] = ffffffff ff000000, %l4 = ffffffff, %l5 = dfacc707
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000ff000000 00000000ffffffff
!	Mem[00000000211c0001] = 00ff40d0, %l0 = 00000000000000ff
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000014, Mem[0000000010081430] = ff0000ff
	stb	%l6,[%i2+0x030]		! Mem[0000000010081430] = 140000ff
!	Mem[000000001008143c] = ffffffff, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x03c]%asi,%l2	! %l2 = 00000000ffffffff
!	%f8  = 99048f69, %f18 = ffffffff, %f7  = 00000000
	fadds	%f8 ,%f18,%f7 		! %f7  = ffffffff
!	Mem[0000000010001400] = 0e116c60, %l1 = 0000000000000016
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 000000000e116c60
!	Mem[0000000021800140] = ffe879f0, %l0 = ffffffffffffffff
	ldstuba	[%o3+0x140]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = ff00ffff, %l0 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff00ffff
!	Mem[0000000010041414] = ff1100ff, %l0 = 00000000ff00ffff
	ldstuba	[%i1+0x014]%asi,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010101410] = 1424e06f
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffe06f
!	%l2 = 00000000ffffffff, Mem[0000000010141410] = ff0000ff
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff
!	%l4 = 00000000ff000000, Mem[0000000010101407] = 719716ff
	stb	%l4,[%i4+0x007]		! Mem[0000000010101404] = 71971600

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 07c7acdf, %l2 = 00000000ffffffff
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000007
!	Mem[00000000300c1400] = ffffffff 07c7acdf, %l6 = 00000014, %l7 = 00000000
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffffffff 0000000007c7acdf
!	Mem[00000000201c0000] = 5fff2e40, %l5 = 00000000ffffffff
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000005fff
!	Mem[0000000030001408] = 0000ffff, %l7 = 0000000007c7acdf
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081400] = ff000000000000ff, %l3 = 0000000000000000
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = ff000000000000ff
!	Mem[0000000030181408] = ffffff00, %l3 = ff000000000000ff
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030081400] = 000000ff, %l4 = 00000000ff000000
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000007, %asi = 80
	lduwa	[%i3+0x008]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010041410] = ffffffff ff1100ff, %l6 = ffffffff, %l7 = 0000ffff, %asi = 80
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 00000000ffffffff 00000000ff1100ff
!	Mem[0000000020800040] = 0000bea0, %l1 = 000000000e116c60
	ldsb	[%o1+0x040],%l1		! %l1 = 0000000000000000

p0_label_291:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010101408] = 3dd100ff
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 3dd10000
!	Code Fragment 4, seed = 586878
p0_fragment_30:
!	%l0 = 00000000000000ff
	setx	0xb6e45f06d182b236,%g7,%l0 ! %l0 = b6e45f06d182b236
!	%l1 = 0000000000000000
	setx	0x2067d5ce55990961,%g7,%l1 ! %l1 = 2067d5ce55990961
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b6e45f06d182b236
	setx	0x30eecb611e0f549c,%g7,%l0 ! %l0 = 30eecb611e0f549c
!	%l1 = 2067d5ce55990961
	setx	0x1e215a7b730096e7,%g7,%l1 ! %l1 = 1e215a7b730096e7
p0_fragment_30_end:
!	Mem[0000000030141408] = 00000000, %l6 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffff, %l3 = ffffff00, Mem[0000000010181400] = ffffffff ff1100ff
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffff ffffff00
!	Mem[0000000021800001] = ff623f00, %l3 = ffffffffffffff00
	ldstuba	[%o3+0x001]%asi,%l3	! %l3 = 0000000000000062
!	Mem[0000000030081400] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f5  = 3dd100ff, Mem[00000000300c1410] = 00000000
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3dd100ff
!	%l4 = 00000000000000ff, Mem[0000000010181438] = e80057ff
	sth	%l4,[%i6+0x038]		! Mem[0000000010181438] = 00ff57ff
!	%f10 = 0000ff00 ffff00ff, Mem[0000000010141430] = ff0000ff 7f800000
	std	%f10,[%i5+0x030]	! Mem[0000000010141430] = 0000ff00 ffff00ff
!	%f6  = 69000000, %f11 = ffff00ff, %f12 = ff0000ff
	fdivs	%f6 ,%f11,%f12		! %f12 = ffff00ff

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 000000ff, %f27 = 0e116c60
	ld	[%i0+0x03c],%f27	! %f27 = 000000ff
!	Mem[0000000010101400] = ff000000, %l7 = 00000000ff1100ff
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030041410] = 000000ff3dd100ff, %l7 = 00000000ff000000
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = 000000ff3dd100ff
!	Mem[0000000020800001] = ff00b870, %l5 = 0000000000005fff
	ldub	[%o1+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff8f0499, %l4 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000062
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 5fff2e40, %l1 = 1e215a7b730096e7, %asi = 80
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000005fff
!	%f20 = 00000000 000000ff, %f8  = 99048f69
	fdtoi	%f20,%f8 		! tt=0x22, %l0 = 30eecb611e0f54be
!	Mem[0000000030001408] = 169c0000ffff0000, %f22 = 698f0499 606c11ff
	ldda	[%i0+%o4]0x89,%f22	! %f22 = 169c0000 ffff0000

p0_label_293:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000000, Mem[00000000100c1408] = ffffffff ffffffff
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff 00000000
!	%l6 = 00000000, %l7 = 3dd100ff, Mem[00000000100c1408] = ffffffff 00000000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 3dd100ff
!	%f22 = 169c0000 ffff0000, %l1 = 0000000000005fff
!	Mem[0000000010181420] = 00ff00d9effff9f6
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181420] = 0000ffff00009c16
!	Mem[0000000030001408] = 0000ffff, %l4 = 00000000ffffffff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141410] = ffffffff, %l7 = 000000ff3dd100ff
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030081400] = ff000000
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010081428] = 00000000 000000ff, %asi = 80
	stda	%l6,[%i2+0x028]%asi	! Mem[0000000010081428] = 00000000 000000ff
!	%l3 = 0000000000000000, Mem[0000000010181438] = 00ff57ffff1c71ff, %asi = 80
	stxa	%l3,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	%l5 = 0000000000000000, Mem[0000000030101400] = 00001400
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00001400

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %f9  = 3dd1c924
	lda	[%i2+%o4]0x88,%f9 	! %f9 = 00000000
!	Mem[0000000030181410] = dfacc707, %l7 = 00000000ffffffff
	lduwa	[%i6+%o5]0x89,%l7	! %l7 = 00000000dfacc707
!	Randomly selected nop
	nop
!	Code Fragment 3, seed = 619753
p0_fragment_31:
!	%l0 = 30eecb611e0f54be
	setx	0x27f1772680a209de,%g7,%l0 ! %l0 = 27f1772680a209de
!	%l1 = 0000000000005fff
	setx	0x9be3b0e4cf2ff089,%g7,%l1 ! %l1 = 9be3b0e4cf2ff089
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 27f1772680a209de
	setx	0x6512575f5b5eb344,%g7,%l0 ! %l0 = 6512575f5b5eb344
!	%l1 = 9be3b0e4cf2ff089
	setx	0x88ddb0eae994d50f,%g7,%l1 ! %l1 = 88ddb0eae994d50f
p0_fragment_31_end:
!	%f25 = 7197169c, %f23 = ffff0000, %f6  = 69000000
	fmuls	%f25,%f23,%f6 		! %f6  = ffff0000
!	Mem[0000000030041400] = 00000000, %f19 = ff5700e8
	lda	[%i1+%g0]0x81,%f19	! %f19 = 00000000
!	Mem[0000000010101410] = 00ffe06f, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff40d0, %l3 = 00000000000000ff
	ldub	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000 ff0000ff, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010181408] = 00000000ff0000ff, %f10 = 0000ff00 ffff00ff
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 00000000 ff0000ff

p0_label_295:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 6fe0ff00, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 000000006fe0ff00
!	Mem[0000000030041400] = 00000000, %l4 = 000000000000ffff
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l2 = ff0000ff, %l3 = 6fe0ff00, Mem[0000000010081410] = 000000ff 000000ff, %asi = 80
	stda	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = ff0000ff 6fe0ff00
!	%f16 = ffffffff e80057ff, Mem[0000000010141400] = ffffffff 8f415e14
	stda	%f16,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff e80057ff
!	%l3 = 000000006fe0ff00, Mem[0000000010001408] = ffbf3005
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 6fe0ff00
!	Mem[0000000030181400] = ff000000, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	%l0 = 5b5eb344, %l1 = e994d50f, Mem[0000000030141410] = ff000000 ff11ff5f
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 5b5eb344 e994d50f
!	Mem[0000000030181400] = 00000000 00000000 ffffff00 ffffffff
!	%f16 = ffffffff e80057ff ffffffff 00000000
!	%f20 = 00000000 000000ff 169c0000 ffff0000
!	%f24 = 0530bf16 7197169c 69000000 000000ff
!	%f28 = ffffffff ff1100ff 0000ff00 80000000
	stda	%f16,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000030101400] = 00140000, %l5 = 00000000ff000000
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f10 = 00000000 ff0000ff, Mem[00000000100c1410] = 69000000 00000000, %asi = 80
	stda	%f10,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000 ff0000ff

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 690000ff 00000000, %l0 = 5b5eb344, %l1 = e994d50f
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000690000ff 0000000000000000
!	%l5 = 0000000000000000, imm = 000000000000004f, %l5 = 0000000000000000
	xor	%l5,0x04f,%l5		! %l5 = 000000000000004f
!	Mem[0000000010081408] = 00000000, %l2 = 00000000ff0000ff
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010181418] = 24c9d13d, %f3  = 24c9d13d
	lda	[%i6+0x018]%asi,%f3 	! %f3 = 24c9d13d
!	Mem[0000000010001410] = 00000000, %l0 = 00000000690000ff
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ffffffff e80057ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000e80057ff
!	Mem[0000000010081408] = 00000000, %l0 = 00000000ffffffff
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Code Fragment 3, seed = 99904
p0_fragment_32:
!	%l0 = 0000000000000000
	setx	0x00bccc8e3b858626,%g7,%l0 ! %l0 = 00bccc8e3b858626
!	%l1 = 00000000e80057ff
	setx	0x7d88f083f7a65a51,%g7,%l1 ! %l1 = 7d88f083f7a65a51
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 00bccc8e3b858626
	setx	0x6e63525829a2928c,%g7,%l0 ! %l0 = 6e63525829a2928c
!	%l1 = 7d88f083f7a65a51
	setx	0x6133c55a997a31d7,%g7,%l1 ! %l1 = 6133c55a997a31d7
p0_fragment_32_end:
!	Mem[0000000010041400] = 0000ff00, %l7 = 00000000dfacc707
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081429] = 00000000, %l3 = 000000006fe0ff00, %asi = 80
	ldsba	[%i2+0x029]%asi,%l3	! %l3 = 0000000000000000

p0_label_297:
!	Starting 10 instruction Store Burst
!	%l0 = 6e63525829a2928c, Mem[0000000030081408] = 690000ff00000000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 6e63525829a2928c
!	%l1 = 6133c55a997a31d7, Mem[0000000010141400] = ffffffff
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 997a31d7
!	%l7 = 0000000000000000, immd = 000009cf, %y  = 00000000
	sdiv	%l7,0x9cf,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 29a2928c
!	%f10 = 00000000, Mem[0000000010081400] = 00000000
	sta	%f10,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f26 = 69000000 000000ff, %l0 = 6e63525829a2928c
!	Mem[0000000030181410] = 00000000000000ff
	add	%i6,0x010,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181410] = 00000000000000ff
!	Mem[0000000010141410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030101408] = ff000000
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 00ff40d0
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00ff40d0
!	Mem[0000000030041400] = 0000ffff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800041] = 0000bea0, %l6 = 0000000000000000
	ldstub	[%o1+0x041],%l6		! %l6 = 0000000000000000

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 80000000 00000000, %l6 = 00000000, %l7 = 00000000, %asi = 80
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 0000000080000000 0000000000000000
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000ff0000ff, %f26 = 69000000 000000ff
	ldda	[%i6+%o4]0x88,%f26	! %f26 = 00000000 ff0000ff
!	Mem[00000000300c1410] = 3dd100ff, %l1 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 000000003dd100ff
!	Mem[000000001000143c] = 000000ff, %f9  = 00000000
	ld	[%i0+0x03c],%f9 	! %f9 = 000000ff
!	Mem[0000000030101400] = 000014ff, %l4 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 00000000000014ff
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = e80057ff3dd100ff, %f18 = ffffffff 00000000
	ldda	[%i3+%o5]0x89,%f18	! %f18 = e80057ff 3dd100ff
!	Mem[00000000100c1400] = 00ff8f697f7b00ff, %f12 = ffff00ff 7f800000
	ldda	[%i3+%g0]0x80,%f12	! %f12 = 00ff8f69 7f7b00ff
!	Mem[0000000010141400] = 997a31d7e80057ff, %f2  = ffffffff 24c9d13d
	ldda	[%i5+%g0]0x80,%f2 	! %f2  = 997a31d7 e80057ff

p0_label_299:
!	Starting 10 instruction Store Burst
!	%l4 = 000014ff, %l5 = 0000004f, Mem[0000000010001400] = 16000000 00000000
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000014ff 0000004f
!	%l7 = 0000000000000000, Mem[0000000030001410] = 003f004500000000
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Mem[00000000201c0000] = 5fff2e40, %l2 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000000000005f
!	Mem[0000000010181400] = ffffffff, %l5 = 000000000000004f
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[000000001014141c] = 00000000, %l1 = 000000003dd100ff
	swap	[%i5+0x01c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101438] = 000000ff, %l5 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x038]%asi,%l5	! %l5 = 00000000000000ff
!	%f28 = ffffffff ff1100ff, Mem[0000000030181410] = 00000000 ff000000
	stda	%f28,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff ff1100ff
!	%l0 = 29a2928c, %l1 = 00000000, Mem[0000000010141400] = 997a31d7 e80057ff
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 29a2928c 00000000
!	Mem[0000000010081436] = 7f800000, %l2 = 000000000000005f
	ldstub	[%i2+0x036],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ffffffff

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 00753ea6539d645f, %f24 = 0530bf16 7197169c
	ldd	[%i4+0x028],%f24	! %f24 = 00753ea6 539d645f
!	Mem[0000000030001400] = 99048fff, %l3 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = ffffffff, %l7 = 0000000000000000
	lduw	[%i1+%o5],%l7		! %l7 = 00000000ffffffff
!	Mem[000000001010142c] = 539d645f, %l2 = 0000000000000000, %asi = 80
	lduwa	[%i4+0x02c]%asi,%l2	! %l2 = 00000000539d645f
!	Mem[0000000010081410] = 00ffe06fff0000ff, %f14 = 14000000 698fff00
	ldda	[%i2+%o5]0x88,%f14	! %f14 = 00ffe06f ff0000ff
!	Mem[0000000030041400] = 9c169771ffff00ff, %l0 = 6e63525829a2928c
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 9c169771ffff00ff
!	Mem[0000000010081418] = 00000000000000ff, %l6 = 0000000080000000, %asi = 80
	ldxa	[%i2+0x018]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = ff000000ff000000, %f18 = e80057ff 3dd100ff
	ldda	[%i2+%g0]0x89,%f18	! %f18 = ff000000 ff000000
!	Mem[0000000010181410] = ff000000, %l1 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000ffffffff
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 9c169771ffff00ff
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffff00
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000539d645f
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000014ff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ffffffff
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x29a2928c,%g2
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
	cmp	%l0,%l1			! %f0  should be 1424e06f 8f415e14
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 997a31d7 e80057ff
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff 3dd100ff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffff0000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 99048f69 000000ff
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 ff0000ff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00ff8f69 7f7b00ff
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00ffe06f ff0000ff
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffffff e80057ff
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff000000 ff000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 169c0000 ffff0000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00753ea6 539d645f
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 ff0000ff
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffffffff ff1100ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 0000ff00 80000000
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
	ldx	[%g1+0x000],%l0		! %l0 = 4a41bc37ff34588e
	ldx	[%g1+0x008],%l1		! %l1 = a673660f325ac039
	ldx	[%g1+0x010],%l2		! %l2 = 6c9b1e9bca8e33f4
	ldx	[%g1+0x018],%l3		! %l3 = 3f09df8f883e36bf
	ldx	[%g1+0x020],%l4		! %l4 = 3e06a74c993edb9a
	ldx	[%g1+0x028],%l5		! %l5 = 61d1749162e3c585
	ldx	[%g1+0x030],%l6		! %l6 = 2d9fb5b88d2b2780
	ldx	[%g1+0x038],%l7		! %l7 = fe0e9d3ac1f8c48b

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
	fcmps	%fcc0,%f4 ,%f5 
	subc	%l6,%l6,%l1
	jmpl	%o7,%g0
	fmuls	%f14,%f10,%f13
p0_near_0_he:
	jmpl	%o7,%g0
	subc	%l5,%l6,%l5
	jmpl	%o7,%g0
	nop
p0_near_0_lo:
	fcmps	%fcc0,%f4 ,%f5 
	subc	%l6,%l6,%l1
	jmpl	%o7,%g0
	fmuls	%f14,%f10,%f13
p0_near_0_ho:
	jmpl	%o7,%g0
	subc	%l5,%l6,%l5
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	and	%l5,0xac1,%l2
	or	%l0,%l5,%l6
	fmuls	%f31,%f18,%f23
	udivx	%l5,%l0,%l1
	smul	%l3,%l7,%l0
	andn	%l3,%l4,%l6
	jmpl	%o7,%g0
	fdivs	%f19,%f21,%f22
near0_b2b_l:
	fmuls	%f14,%f8 ,%f14
	mulx	%l4,%l2,%l4
	sdivx	%l4,%l5,%l1
	fsqrts	%f10,%f14
	addc	%l1,0x220,%l6
	sdivx	%l1,0xa5f,%l7
	jmpl	%o7,%g0
	sub	%l0,-0x796,%l7
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
	fdivs	%f6 ,%f10,%f14
	sub	%l4,-0xb2a,%l5
	xor	%l2,%l4,%l7
	jmpl	%o7,%g0
	xor	%l3,%l5,%l7
p0_near_1_he:
	addc	%l3,%l7,%l1
	fmuls	%f17,%f24,%f20
	smul	%l6,-0x13f,%l5
	fcmps	%fcc0,%f31,%f22
	jmpl	%o7,%g0
	sdivx	%l1,0x8ce,%l4
p0_near_1_lo:
	fdivs	%f6 ,%f10,%f14
	sub	%l4,-0xb2a,%l5
	xor	%l2,%l4,%l7
	jmpl	%o7,%g0
	xor	%l3,%l5,%l7
p0_near_1_ho:
	addc	%l3,%l7,%l1
	fmuls	%f17,%f24,%f20
	smul	%l6,-0x13f,%l5
	fcmps	%fcc0,%f31,%f22
	jmpl	%o7,%g0
	sdivx	%l1,0x8ce,%l4
near1_b2b_h:
	andn	%l3,-0x57a,%l1
	andn	%l5,-0x01b,%l5
	fadds	%f22,%f18,%f25
	smul	%l2,%l6,%l4
	fsubs	%f21,%f21,%f16
	xor	%l3,%l4,%l2
	orn	%l2,%l6,%l5
	jmpl	%o7,%g0
	subc	%l0,-0x555,%l5
near1_b2b_l:
	mulx	%l4,%l3,%l0
	umul	%l0,%l2,%l0
	sub	%l5,%l2,%l1
	fdivs	%f15,%f9 ,%f11
	andn	%l7,0xbbd,%l2
	xnor	%l7,%l4,%l5
	fmuls	%f1 ,%f12,%f8 
	jmpl	%o7,%g0
	or	%l7,%l4,%l4
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
	and	%l5,%l4,%l1
	xnor	%l1,-0xf44,%l0
	fcmps	%fcc0,%f12,%f11
	fmuls	%f15,%f13,%f15
	jmpl	%o7,%g0
	ldsh	[%o1+0x000],%l3		! Mem[0000000020800000]
p0_near_2_he:
	fadds	%f28,%f26,%f16
	jmpl	%o7,%g0
	sdivx	%l4,0xb26,%l6
p0_near_2_lo:
	and	%l5,%l4,%l1
	xnor	%l1,-0xf44,%l0
	fcmps	%fcc0,%f12,%f11
	fmuls	%f15,%f13,%f15
	jmpl	%o7,%g0
	ldsh	[%i1+0x000],%l3		! Mem[0000000020800000]
p0_near_2_ho:
	fadds	%f28,%f26,%f16
	jmpl	%o7,%g0
	sdivx	%l4,0xb26,%l6
near2_b2b_h:
	sdivx	%l4,0x2d5,%l7
	jmpl	%o7,%g0
	sub	%l0,0xafe,%l3
near2_b2b_l:
	smul	%l0,0x5a4,%l3
	jmpl	%o7,%g0
	fsqrts	%f4 ,%f15
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
	udivx	%l1,0x5c4,%l7
	jmpl	%o7,%g0
	and	%l3,%l3,%l5
p0_near_3_he:
	smul	%l2,%l0,%l0
	mulx	%l0,0xdae,%l4
	sub	%l3,0xe8a,%l1
	fsqrts	%f22,%f21
	fcmps	%fcc2,%f25,%f17
	fstod	%f30,%f16
	jmpl	%o7,%g0
	subc	%l5,0x707,%l4
p0_near_3_lo:
	udivx	%l1,0x5c4,%l7
	jmpl	%o7,%g0
	and	%l3,%l3,%l5
p0_near_3_ho:
	smul	%l2,%l0,%l0
	mulx	%l0,0xdae,%l4
	sub	%l3,0xe8a,%l1
	fsqrts	%f22,%f21
	fcmps	%fcc2,%f25,%f17
	fstod	%f30,%f16
	jmpl	%o7,%g0
	subc	%l5,0x707,%l4
near3_b2b_h:
	xor	%l2,%l3,%l2
	addc	%l5,%l6,%l6
	fstod	%f29,%f26
	jmpl	%o7,%g0
	mulx	%l0,-0x80b,%l6
near3_b2b_l:
	umul	%l0,-0xd39,%l1
	fdivs	%f15,%f8 ,%f7 
	fsubs	%f12,%f11,%f1 
	jmpl	%o7,%g0
	fsubs	%f4 ,%f12,%f8 
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
	nop
	jmpl	%o7,%g0
	udivx	%l6,0x28a,%l3
p0_far_0_he:
	fdivs	%f20,%f31,%f23
	andn	%l3,%l4,%l4
	andn	%l5,%l6,%l2
	fdivs	%f19,%f22,%f24
	addc	%l1,%l7,%l5
	sub	%l1,0x914,%l5
	umul	%l7,-0x419,%l5
	jmpl	%o7,%g0
	fsubs	%f27,%f17,%f16
p0_far_0_lo:
	nop
	jmpl	%o7,%g0
	udivx	%l6,0x28a,%l3
p0_far_0_ho:
	fdivs	%f20,%f31,%f23
	andn	%l3,%l4,%l4
	andn	%l5,%l6,%l2
	fdivs	%f19,%f22,%f24
	addc	%l1,%l7,%l5
	sub	%l1,0x914,%l5
	umul	%l7,-0x419,%l5
	jmpl	%o7,%g0
	fsubs	%f27,%f17,%f16
far0_b2b_h:
	fsubs	%f27,%f18,%f29
	subc	%l4,0x96d,%l5
	xnor	%l7,-0x329,%l3
	jmpl	%o7,%g0
	umul	%l4,%l6,%l3
far0_b2b_l:
	fdivs	%f9 ,%f0 ,%f14
	fsubs	%f7 ,%f12,%f15
	fdivs	%f2 ,%f12,%f11
	jmpl	%o7,%g0
	sub	%l7,-0x60a,%l2
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
	sdivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	or	%l7,%l4,%l7
p0_far_1_he:
	jmpl	%o7,%g0
	andn	%l3,0x660,%l2
	jmpl	%o7,%g0
	nop
p0_far_1_lo:
	sdivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	or	%l7,%l4,%l7
p0_far_1_ho:
	jmpl	%o7,%g0
	andn	%l3,0x660,%l2
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far1_b2b_h:
	jmpl	%o7,%g0
	add	%l5,-0xf32,%l7
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	udivx	%l3,%l5,%l7
	jmpl	%o7,%g0
	nop
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
	fmuls	%f14,%f13,%f10
	smul	%l1,-0xccf,%l7
	orn	%l3,0x5a9,%l2
	andn	%l0,%l7,%l0
	or	%l1,%l4,%l5
	jmpl	%o7,%g0
	ldx	[%i0+0x010],%l2		! Mem[0000000010001410]
p0_far_2_he:
	jmpl	%o7,%g0
	orn	%l1,0xc18,%l2
	jmpl	%o7,%g0
	nop
p0_far_2_lo:
	fmuls	%f14,%f13,%f10
	smul	%l1,-0xccf,%l7
	orn	%l3,0x5a9,%l2
	andn	%l0,%l7,%l0
	or	%l1,%l4,%l5
	jmpl	%o7,%g0
	ldx	[%o0+0x010],%l2		! Mem[0000000010001410]
p0_far_2_ho:
	jmpl	%o7,%g0
	orn	%l1,0xc18,%l2
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far2_b2b_h:
	fadds	%f23,%f30,%f20
	fmuls	%f18,%f20,%f27
	fadds	%f20,%f24,%f31
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	smul	%l5,%l6,%l4
	sub	%l2,-0x46c,%l6
	xnor	%l3,%l5,%l6
	jmpl	%o7,%g0
	sub	%l5,0x068,%l3
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
	ldd	[%i2+0x038],%f6 	! Mem[0000000010081438]
	jmpl	%o7,%g0
	fcmps	%fcc0,%f5 ,%f8 
p0_far_3_he:
	fsqrts	%f29,%f25
	fdivs	%f29,%f19,%f16
	fadds	%f27,%f21,%f19
	addc	%l6,-0xa8d,%l6
	jmpl	%o7,%g0
	addc	%l5,%l0,%l6
p0_far_3_lo:
	ldd	[%o2+0x038],%f6 	! Mem[0000000010081438]
	jmpl	%o7,%g0
	fcmps	%fcc0,%f5 ,%f8 
p0_far_3_ho:
	fsqrts	%f29,%f25
	fdivs	%f29,%f19,%f16
	fadds	%f27,%f21,%f19
	addc	%l6,-0xa8d,%l6
	jmpl	%o7,%g0
	addc	%l5,%l0,%l6
far3_b2b_h:
	smul	%l7,%l2,%l3
	sdivx	%l5,%l3,%l2
	addc	%l2,%l6,%l7
	fmuls	%f20,%f19,%f28
	jmpl	%o7,%g0
	sub	%l1,%l1,%l7
far3_b2b_l:
	addc	%l6,%l7,%l7
	xnor	%l7,0xa40,%l5
	umul	%l4,-0xca8,%l0
	fmuls	%f0 ,%f10,%f7 
	jmpl	%o7,%g0
	sub	%l5,%l6,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	ldx	[%i4+0x010],%l1		! Mem[0000000010101410]
	fsubs	%f0 ,%f0 ,%f14
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f8 ,%f3 
p0_call_0_le:
	fdivs	%f14,%f5 ,%f1 
	fdivs	%f10,%f10,%f15
	sdivx	%l4,0x204,%l3
	mulx	%l5,%l5,%l4
	add	%l7,-0x593,%l2
	fdivs	%f12,%f11,%f4 
	fcmps	%fcc0,%f10,%f0 
	retl
	or	%l3,0xc24,%l6
p0_jmpl_0_lo:
	ldx	[%o4+0x010],%l1		! Mem[0000000010101410]
	fsubs	%f0 ,%f0 ,%f14
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f8 ,%f3 
p0_call_0_lo:
	fdivs	%f14,%f5 ,%f1 
	fdivs	%f10,%f10,%f15
	sdivx	%l4,0x204,%l3
	mulx	%l5,%l5,%l4
	add	%l7,-0x593,%l2
	fdivs	%f12,%f11,%f4 
	fcmps	%fcc0,%f10,%f0 
	retl
	or	%l3,0xc24,%l6
p0_jmpl_0_he:
	stb	%l1,[%i0+0x039]		! Mem[0000000010001439]
	mulx	%l0,%l1,%l5
	xnor	%l2,0xf53,%l7
	jmpl	%g6+8,%g0
	sub	%l1,-0x84c,%l2
p0_call_0_he:
	ldstub	[%i6+0x005],%l1		! Mem[0000000010181405]
	retl
	andn	%l3,0x857,%l2
p0_jmpl_0_ho:
	stb	%l1,[%o0+0x039]		! Mem[0000000010001439]
	mulx	%l0,%l1,%l5
	xnor	%l2,0xf53,%l7
	jmpl	%g6+8,%g0
	sub	%l1,-0x84c,%l2
p0_call_0_ho:
	ldstub	[%o6+0x005],%l1		! Mem[0000000010181405]
	retl
	andn	%l3,0x857,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	or	%l3,0x1ae,%l2
	fcmps	%fcc1,%f11,%f15
	sub	%l6,0xca9,%l3
	sdivx	%l1,0xd24,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f12,%f8 
p0_call_1_le:
	stx	%l5,[%i6+0x038]		! Mem[0000000010181438]
	stb	%l5,[%o0+0x000]		! Mem[00000000201c0000]
	fmuls	%f4 ,%f14,%f7 
	smul	%l1,0x8d4,%l6
	fsubs	%f13,%f5 ,%f9 
	or	%l3,%l7,%l4
	and	%l4,%l1,%l0
	retl
	sdivx	%l6,%l2,%l3
p0_jmpl_1_lo:
	or	%l3,0x1ae,%l2
	fcmps	%fcc1,%f11,%f15
	sub	%l6,0xca9,%l3
	sdivx	%l1,0xd24,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f12,%f8 
p0_call_1_lo:
	stx	%l5,[%o6+0x038]		! Mem[0000000010181438]
	stb	%l5,[%i0+0x000]		! Mem[00000000201c0000]
	fmuls	%f4 ,%f14,%f7 
	smul	%l1,0x8d4,%l6
	fsubs	%f13,%f5 ,%f9 
	or	%l3,%l7,%l4
	and	%l4,%l1,%l0
	retl
	sdivx	%l6,%l2,%l3
p0_jmpl_1_he:
	fcmps	%fcc1,%f17,%f22
	fmuls	%f18,%f27,%f20
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f27,%f30
p0_call_1_he:
	mulx	%l7,%l0,%l1
	fcmps	%fcc2,%f19,%f26
	orn	%l2,0x1f8,%l5
	fadds	%f25,%f30,%f19
	andn	%l3,%l3,%l5
	smul	%l3,0x4f6,%l2
	sdivx	%l2,%l2,%l0
	retl
	umul	%l5,%l2,%l3
p0_jmpl_1_ho:
	fcmps	%fcc1,%f17,%f22
	fmuls	%f18,%f27,%f20
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f27,%f30
p0_call_1_ho:
	mulx	%l7,%l0,%l1
	fcmps	%fcc2,%f19,%f26
	orn	%l2,0x1f8,%l5
	fadds	%f25,%f30,%f19
	andn	%l3,%l3,%l5
	smul	%l3,0x4f6,%l2
	sdivx	%l2,%l2,%l0
	retl
	umul	%l5,%l2,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	fsubs	%f6 ,%f4 ,%f7 
	or	%l1,-0x55d,%l7
	smul	%l5,%l3,%l3
	mulx	%l6,%l2,%l5
	sdivx	%l1,0x9a7,%l2
	subc	%l6,-0x1f5,%l6
	jmpl	%g6+8,%g0
	umul	%l7,0x80f,%l4
p0_call_2_le:
	retl
	add	%l3,-0x723,%l3
p0_jmpl_2_lo:
	fsubs	%f6 ,%f4 ,%f7 
	or	%l1,-0x55d,%l7
	smul	%l5,%l3,%l3
	mulx	%l6,%l2,%l5
	sdivx	%l1,0x9a7,%l2
	subc	%l6,-0x1f5,%l6
	jmpl	%g6+8,%g0
	umul	%l7,0x80f,%l4
p0_call_2_lo:
	retl
	add	%l3,-0x723,%l3
p0_jmpl_2_he:
	sub	%l6,%l6,%l2
	jmpl	%g6+8,%g0
	xnor	%l7,%l0,%l5
p0_call_2_he:
	subc	%l0,-0xcf1,%l2
	fsubs	%f19,%f24,%f26
	sub	%l1,-0x0a4,%l1
	xor	%l4,0x1dc,%l4
	udivx	%l0,0x02d,%l4
	retl
	and	%l1,%l1,%l4
p0_jmpl_2_ho:
	sub	%l6,%l6,%l2
	jmpl	%g6+8,%g0
	xnor	%l7,%l0,%l5
p0_call_2_ho:
	subc	%l0,-0xcf1,%l2
	fsubs	%f19,%f24,%f26
	sub	%l1,-0x0a4,%l1
	xor	%l4,0x1dc,%l4
	udivx	%l0,0x02d,%l4
	retl
	and	%l1,%l1,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fsubs	%f10,%f9 ,%f9 
	jmpl	%g6+8,%g0
	sdivx	%l7,%l3,%l0
p0_call_3_le:
	retl
	sdivx	%l1,%l5,%l4
p0_jmpl_3_lo:
	fsubs	%f10,%f9 ,%f9 
	jmpl	%g6+8,%g0
	sdivx	%l7,%l3,%l0
p0_call_3_lo:
	retl
	sdivx	%l1,%l5,%l4
p0_jmpl_3_he:
	subc	%l6,-0xe60,%l3
	udivx	%l6,0x9c9,%l7
	jmpl	%g6+8,%g0
	fsqrts	%f27,%f27
p0_call_3_he:
	addc	%l5,%l0,%l3
	ldx	[%i3+0x028],%l4		! Mem[00000000100c1428]
	retl
	smul	%l2,-0xb9d,%l2
p0_jmpl_3_ho:
	subc	%l6,-0xe60,%l3
	udivx	%l6,0x9c9,%l7
	jmpl	%g6+8,%g0
	fsqrts	%f27,%f27
p0_call_3_ho:
	addc	%l5,%l0,%l3
	ldx	[%o3+0x028],%l4		! Mem[00000000100c1428]
	retl
	smul	%l2,-0xb9d,%l2
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
	.word	0x4a41bc37,0xff34588e		! Init value for %l0
	.word	0xa673660f,0x325ac039		! Init value for %l1
	.word	0x6c9b1e9b,0xca8e33f4		! Init value for %l2
	.word	0x3f09df8f,0x883e36bf		! Init value for %l3
	.word	0x3e06a74c,0x993edb9a		! Init value for %l4
	.word	0x61d17491,0x62e3c585		! Init value for %l5
	.word	0x2d9fb5b8,0x8d2b2780		! Init value for %l6
	.word	0xfe0e9d3a,0xc1f8c48b		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x50b14ae0,0x14115371		! Init value for %f0 
	.word	0x329b2b1e,0x22c973f7		! Init value for %f2 
	.word	0x0527bdcc,0x737f372d		! Init value for %f4 
	.word	0x082dfa6a,0x6fad0693		! Init value for %f6 
	.word	0x046eb478,0x383637a9		! Init value for %f8 
	.word	0x5bec7b76,0x4bf36bef		! Init value for %f10
	.word	0x430a7ae4,0x0b89f0e5		! Init value for %f12
	.word	0x16ea5a42,0x1226200b		! Init value for %f14
	.word	0x4b411d10,0x3170bee1		! Init value for %f16
	.word	0x2d9b02ce,0x3bd75ee7		! Init value for %f18
	.word	0x2dc666fc,0x5affbd9d		! Init value for %f20
	.word	0x6adda11a,0x28fe2483		! Init value for %f22
	.word	0x6227e4a8,0x51a6c919		! Init value for %f24
	.word	0x38c92126,0x56122cdf		! Init value for %f26
	.word	0x22f8e214,0x572c7d55		! Init value for %f28
	.word	0x53382ef2,0x3ce7f3fb		! Init value for %f30
	.word	0x11be6b40,0x566a3651		! Init value for %f32
	.word	0x1015367e,0x5c4cb5d7		! Init value for %f34
	.word	0x2e9b4c2c,0x40c8100d		! Init value for %f36
	.word	0x296663ca,0x22626e73		! Init value for %f38
	.word	0x6fbc10d8,0x3478e689		! Init value for %f40
	.word	0x3519a2d6,0x35bbd9cf		! Init value for %f42
	.word	0x04830544,0x477655c5		! Init value for %f44
	.word	0x36909fa2,0x593873eb		! Init value for %f46
	.word	0x10743570,0x133cb9c1
	.word	0x75ecc62e,0x66a078c7
	.word	0x69e16d5c,0x5d472e7d
	.word	0x091b427a,0x1c00e463
	.word	0x28563908,0x784b8ff9
	.word	0x3aa10086,0x37c772bf
	.word	0x0ec3e474,0x3a367a35
	.word	0x3a26ac52,0x1f9e9fdb
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
	.word	0x9c169771,0xffff00ff		! %l0
	.word	0xffffffff,0xffffff00		! %l1
	.word	0x00000000,0x539d645f		! %l2
	.word	0xffffffff,0xffffffff		! %l3
	.word	0x00000000,0x000014ff		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0x00000000,0x000000ff		! %l6
	.word	0x00000000,0xffffffff		! %l7
p0_expected_fp_regs:
	.word	0x1424e06f,0x8f415e14		! %f0
	.word	0x997a31d7,0xe80057ff		! %f2
	.word	0x000000ff,0x3dd100ff		! %f4
	.word	0xffff0000,0xffffffff		! %f6
	.word	0x99048f69,0x000000ff		! %f8
	.word	0x00000000,0xff0000ff		! %f10
	.word	0x00ff8f69,0x7f7b00ff		! %f12
	.word	0x00ffe06f,0xff0000ff		! %f14
	.word	0xffffffff,0xe80057ff		! %f16
	.word	0xff000000,0xff000000		! %f18
	.word	0x00000000,0x000000ff		! %f20
	.word	0x169c0000,0xffff0000		! %f22
	.word	0x00753ea6,0x539d645f		! %f24
	.word	0x00000000,0xff0000ff		! %f26
	.word	0xffffffff,0xff1100ff		! %f28
	.word	0x0000ff00,0x80000000		! %f30
	.word	0x00000027,0x00000fe0		! %fsr
p0_local0_expect:
	.word	0x000014ff,0x0000004f,0x6fe0ff00,0x00ff0000 ! PA = 0000000010001400
	.word	0x00000000,0x7197169c,0x00000000,0x00001aef ! PA = 0000000010001410
	.word	0x00000000,0x45003fff,0x0014d628,0xff000000 ! PA = 0000000010001420
	.word	0x0000ff00,0x000000df,0x9ac69e02,0x000000ff ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xff8f0499,0x606c11ff,0xffffffff,0x00009c16 ! PA = 0000000030001400
	.word	0x00000000,0x00000000,0x7146e348,0x242a2939 ! PA = 0000000030001410
	.word	0x40087d68,0x5f2e86d9,0x57204fe6,0x3220689f ! PA = 0000000030001420
	.word	0x0000ff00,0xffff00ff,0x119799b2,0x3487fbbb ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0xd33ea58e,0x6266e47f,0x830d31b2,0x4e7f2e6b
	.word	0x43330ff6,0x3412fab7,0x7e48995a,0xd2f2b463
	.word	0xd0d92ede,0xe89ade6f,0xd90d7982,0xf08ad3db
	.word	0x7cb7aa46,0x988187a7,0x0551ba2a,0x3d5044d3
p0_local1_expect:
	.word	0x0000ff00,0xffff00ff,0x000000ff,0x24c9d13d ! PA = 0000000010041400
	.word	0xffffffff,0xff1100ff,0x00000000,0xe80057ff ! PA = 0000000010041410
	.word	0x99048f69,0xd9862e5f,0x24c9d13d,0xff1100ff ! PA = 0000000010041420
	.word	0xff0000ff,0x7f800000,0x14000000,0x373f2d3f ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff00ffff,0x7197169c,0xff000000,0x24c9d13d ! PA = 0000000030041400
	.word	0xff00d13d,0xff000000,0x00000000,0xe80057ff ! PA = 0000000030041410
	.word	0x99048f69,0xd9862e5f,0x169c957c,0x3dd100ff ! PA = 0000000030041420
	.word	0xff0000ff,0x7f800000,0x00000000,0xff000000 ! PA = 0000000030041430
p0_local2_expect:
	.word	0x00000000,0xffff0000,0x00000000,0x9c169771 ! PA = 0000000010081400
	.word	0xff0000ff,0x6fe0ff00,0x00000000,0x000000ff ! PA = 0000000010081410
	.word	0xffcb8969,0xd9862e5f,0x00000000,0x000000ff ! PA = 0000000010081420
	.word	0x140000ff,0x7f80ff00,0x7f7b00ff,0x00000000 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x000000ff,0x000000ff,0x6e635258,0x29a2928c ! PA = 0000000030081400
	.word	0x7f7b00ff,0x3dd1c9a4,0xff000000,0xd9000000 ! PA = 0000000030081410
	.word	0xff0000ff,0x698f0499,0x000000ff,0xff00ffff ! PA = 0000000030081420
	.word	0xff73c922,0x59109b77,0xff800000,0x7f7b00ff ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00ff8f69,0x7f7b00ff,0x00000000,0x3dd100ff ! PA = 00000000100c1400
	.word	0x00000000,0xff0000ff,0xff000000,0x000000ff ! PA = 00000000100c1410
	.word	0x99048f69,0x0000005f,0xffff0000,0xe80057ff ! PA = 00000000100c1420
	.word	0xff0000ff,0x6d6177cb,0x0000ff00,0xffff00ff ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xffffffff,0x07c7acdf,0xffffffff,0xffffffff ! PA = 00000000300c1400
	.word	0xff00d13d,0xff5700e8,0x455e27fa,0x52eac3e3 ! PA = 00000000300c1410
	.word	0x17a6ea88,0x38fc8b79,0x537ade06,0x0a316a3f ! PA = 00000000300c1420
	.word	0x08044d69,0xff0000ff,0x34e901d2,0x3ca42f5b ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff000000,0x71971600,0x0000d13d,0x169c0000 ! PA = 0000000010101400
	.word	0x00000000,0x8f415e14,0xff5700ff,0x000000ff ! PA = 0000000010101410
	.word	0x5f2e86d9,0x698f0499,0x00753ea6,0x539d645f ! PA = 0000000010101420
	.word	0xff5700e8,0x00ff0000,0xffffffff,0x00000000 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xff140000,0x0000ffff,0x000000ff,0xffffffff ! PA = 0000000030101400
	.word	0x00000000,0x6fe02414,0xff000000,0x4333ac0f ! PA = 0000000030101410
	.word	0x54000000,0x56a0d062,0x606c110e,0x0fac18ed ! PA = 0000000030101420
	.word	0x6c52c030,0x000080ff,0x606c110e,0xa9373638 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x29a2928c,0x00000000,0xffffffff,0x24c9d13d ! PA = 0000000010141400
	.word	0xffffffff,0x3dd100ff,0x80000000,0x3dd100ff ! PA = 0000000010141410
	.word	0x99048f69,0x3dd1c924,0x0000ff00,0xffff00ff ! PA = 0000000010141420
	.word	0x0000ff00,0xffff00ff,0x14000000,0x698fff00 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00009771,0x00000000,0xff000000,0xffffffff ! PA = 0000000030141400
	.word	0x5b5eb344,0xe994d50f,0xff5700e8,0x00000000 ! PA = 0000000030141410
	.word	0x5f2e86d9,0x698f0499,0x5fff11ff,0x00000000 ! PA = 0000000030141420
	.word	0x0000807f,0xff0000ff,0x000000ff,0x00000000 ! PA = 0000000030141430
p0_local6_expect:
	.word	0x4f000000,0xffffff00,0xff0000ff,0x00000000 ! PA = 0000000010181400
	.word	0xff000000,0x5b000000,0x24c9d13d,0xff1100ff ! PA = 0000000010181410
	.word	0x0000ffff,0x00009c16,0x18fb2340,0xff5700e8 ! PA = 0000000010181420
	.word	0xff000000,0x606c11ff,0x00000000,0x00000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0xffffffff,0xe80057ff,0xff000000,0x00000000 ! PA = 0000000030181400
	.word	0xff0011ff,0xffffffff,0x169c0000,0xffff0000 ! PA = 0000000030181410
	.word	0x0530bf16,0x7197169c,0x69000000,0x000000ff ! PA = 0000000030181420
	.word	0xffffffff,0xff1100ff,0x0000ff00,0x80000000 ! PA = 0000000030181430
share0_expect:
	.word	0xffff2e40,0x77a80d51,0x3749517e,0x64e384d7 ! PA = 00000000201c0000
	.word	0x2fc97f2c,0x4441970d,0x68d96eca,0x26266d73 ! PA = 00000000201c0010
	.word	0x3964b3d8,0x073d1d89,0x503e9dd6,0x267408cf ! PA = 00000000201c0020
	.word	0x78f11844,0x57c43cc5,0x6f4a8aa2,0x675bd2eb ! PA = 00000000201c0030
share1_expect:
	.word	0xff00b870,0x578350c1,0x178ea12e,0x005607c7 ! PA = 0000000020800000
	.word	0x557b605c,0x0b25757d,0x63680d7a,0x1c1fa363 ! PA = 0000000020800010
	.word	0x65369c08,0x6b9086f9,0x0ccbbb86,0x44d661bf ! PA = 0000000020800020
	.word	0x68f5b774,0x0be12135,0x0dd25752,0x3ad4bedb ! PA = 0000000020800030
	.word	0x00ffbea0,0x7026a031,0x37044cde,0x524df6b7 ! PA = 0000000020800040
	.word	0x3b497d8c,0x70df1fed,0x2765c82a,0x13aa0553 ! PA = 0000000020800050
	.word	0x75a98038,0x47337c69,0x5242b536,0x1aa1a6af ! PA = 0000000020800060
	.word	0x723c12a4,0x1df351a5,0x7ebac002,0x701a56cb ! PA = 0000000020800070
share2_expect:
	.word	0x00ff40d0,0x4350fba1,0x6d0d548e,0x5ac251a7 ! PA = 00000000211c0000
	.word	0x7aeed6bc,0x575d965d,0x0da59eda,0x626c9343 ! PA = 00000000211c0010
	.word	0x35686068,0x1344fdd9,0x75e68ae6,0x022cd79f ! PA = 00000000211c0020
	.word	0x235f29d4,0x0549ce15,0x7eb6c4b2,0x45339abb ! PA = 00000000211c0030
share3_expect:
	.word	0xffff3f00,0x5d816311,0x38ccb83e,0x4a6a1897 ! PA = 0000000021800000
	.word	0x23e66bec,0x274fd8cd,0x22ba918a,0x6ace4d33 ! PA = 0000000021800010
	.word	0x50de3c98,0x0ba40b49,0x4cba3c96,0x7e8ef48f ! PA = 0000000021800020
	.word	0x18b9fd04,0x77f39685,0x56396562,0x7ce78aab ! PA = 0000000021800030
	.word	0x18ffb930,0x45f6d681,0x712577ee,0x72bc4b87 ! PA = 0000000021800040
	.word	0x6b6b3d1c,0x4024e73d,0x56f7a03a,0x0bf63323 ! PA = 0000000021800050
	.word	0x063614c8,0x1eefa4b9,0x5b80ca46,0x2b9efd7f ! PA = 0000000021800060
	.word	0x2c678c34,0x5abfaaf5,0x0975a212,0x4ebd269b ! PA = 0000000021800070
	.word	0x4eaeaf60,0x6eb055f1,0x74ba939e,0x35efea77 ! PA = 0000000021800080
	.word	0x5c784a4c,0x680bc1ad,0x2e6fcaea,0x11cb4513 ! PA = 0000000021800090
	.word	0x555ae8f8,0x5e86ca29,0x06bd33f6,0x2df3f26f ! PA = 00000000218000a0
	.word	0x2642d764,0x313d0b65,0x085e7ac2,0x56fb6e8b ! PA = 00000000218000b0
	.word	0xff352190,0x246ce161,0x59ef0b4e,0x76fbf567 ! PA = 00000000218000c0
	.word	0x07c8937c,0x3bf3681d,0x70f6119a,0x24f48303 ! PA = 00000000218000d0
	.word	0x2ff7b928,0x6e887b99,0x42b279a6,0x22e4d35f ! PA = 00000000218000e0
	.word	0x6be6de94,0x0dbab7d5,0x5ea6ef72,0x06a9627b ! PA = 00000000218000f0
	.word	0x00ff0fc0,0x7eab78d1,0x1ee5defe,0x09976c57 ! PA = 0000000021800100
	.word	0x33d718ac,0x1f8ada8d,0x5a1d744a,0x3ad8ecf3 ! PA = 0000000021800110
	.word	0x29778558,0x75d3b909,0x43639b56,0x1088a04f ! PA = 0000000021800120
	.word	0x30aea1c4,0x0147b045,0x63c20022,0x138e026b ! PA = 0000000021800130
	.word	0xffe879f0,0x4fab1c41,0x59820eae,0x22394f47 ! PA = 0000000021800140
	.word	0x0cded9dc,0x2d4118fd,0x4938f2fa,0x059f82e3 ! PA = 0000000021800150
	.word	0x27054d88,0x0e078279,0x2c939906,0x55b6593f ! PA = 0000000021800160
	.word	0x25b520f4,0x0bb2f4b5,0x6ae2acd2,0x68304e5b ! PA = 0000000021800170
	.word	0xacdf6020,0x146acbb1,0x67669a5e,0x46189e37 ! PA = 0000000021800180
	.word	0x54dad70c,0x2645236d,0x715b8daa,0x642f44d3 ! PA = 0000000021800190
	.word	0x0f8c11b8,0x3382d7e9,0x41c572b6,0x1a04fe2f ! PA = 00000000218001a0
	.word	0x29d55c24,0x0b8b8525,0x72fbf582,0x13d7464b ! PA = 00000000218001b0
	.word	0x6d35c250,0x64a98721,0x1df6820e,0x3b2c5927 ! PA = 00000000218001c0
	.word	0x1386103c,0x6285f9dd,0x0958445a,0x522f32c3 ! PA = 00000000218001d0
	.word	0x7bb6d1e8,0x3564b959,0x163c2866,0x3dcb8f1f ! PA = 00000000218001e0
	.word	0x79aa5354,0x2e206195,0x56c0da32,0x3a89ea3b ! PA = 00000000218001f0
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
	.word	0x1d6d7ba0,0x22e74931,0x42c4b1de,0x0e09a7b7	! PA = 0000000010001400
	.word	0x5793ca8c,0x0fac18ed,0x230f3d2a,0x02c08653	! PA = 0000000010001410
	.word	0x08e15d38,0x177dc569,0x52e23a36,0x71cbf7af	! PA = 0000000010001420
	.word	0x16967fa4,0x6bfbeaa5,0x02ed5502,0x6d6177cb	! PA = 0000000010001430
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
	.word	0x28753dd0,0x5b28e4a1,0x51fff98e,0x467f42a7	! PA = 0000000030001400
	.word	0x356d63bc,0x4de5cf5d,0x141553da,0x60485443	! PA = 0000000030001410
	.word	0x40087d68,0x5f2e86d9,0x57204fe6,0x3220689f	! PA = 0000000030001420
	.word	0x4e95d6d4,0x6815a715,0x119799b2,0x3487fbbb	! PA = 0000000030001430
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
	.word	0x6b167c00,0x1c808c11,0x26c19d3e,0x34b84997	! PA = 0000000010041400
	.word	0x36e938ec,0x14a351cd,0x2cc0868a,0x4aff4e33	! PA = 0000000010041410
	.word	0x5e369998,0x5f3cd449,0x205e4196,0x6fdbc58f	! PA = 0000000010041420
	.word	0x771cea04,0x7892af85,0x72987a62,0x6bd92bab	! PA = 0000000010041430
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
	.word	0x189c3630,0x422d3f81,0x1bec9cee,0x1e2bbc87	! PA = 0000000030041400
	.word	0x35424a1c,0x5753a03d,0x2163d53a,0x560c7423	! PA = 0000000030041410
	.word	0x0596b1c8,0x5a47adb9,0x375f0f46,0x3ad50e7f	! PA = 0000000030041420
	.word	0x0e46b934,0x164203f5,0x6e22f712,0x7edc079b	! PA = 0000000030041430
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
	.word	0x0e116c60,0x122dfef1,0x1423f89e,0x59109b77	! PA = 0000000010081400
	.word	0x5f73974c,0x7025baad,0x3a123fea,0x0156c613	! PA = 0000000010081410
	.word	0x1a13c5f8,0x35ae1329,0x04a5b8f6,0x2ba3436f	! PA = 0000000010081420
	.word	0x7fee4464,0x58b2a465,0x382a0fc2,0x3dd78f8b	! PA = 0000000010081430
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
	.word	0x02411e90,0x2d41ca61,0x29cab04e,0x3c5de667	! PA = 0000000030081400
	.word	0x6a38207c,0x1008a11d,0x029ec69a,0x29854403	! PA = 0000000030081410
	.word	0x7158d628,0x698f0499,0x00753ea6,0x539d645f	! PA = 0000000030081420
	.word	0x55ae8b94,0x663390d5,0x2060c472,0x4dd2c37b	! PA = 0000000030081430
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
	.word	0x35b64cc0,0x7ee7a1d1,0x5f03c3fe,0x0fca9d57	! PA = 00000000100c1400
	.word	0x400ae5ac,0x2eab538d,0x7a9c694a,0x77feedf3	! PA = 00000000100c1410
	.word	0x02d0e258,0x70c98209,0x62d0a056,0x2cda714f	! PA = 00000000100c1420
	.word	0x66e28ec4,0x63d3c945,0x423a1522,0x1894a36b	! PA = 00000000100c1430
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
	.word	0x22bbf6f0,0x2d5e8541,0x4db233ae,0x7bcdc047	! PA = 00000000300c1400
	.word	0x3126e6dc,0x7a7cd1fd,0x455e27fa,0x52eac3e3	! PA = 00000000300c1410
	.word	0x17a6ea88,0x38fc8b79,0x537ade06,0x0a316a3f	! PA = 00000000300c1420
	.word	0x08a54df4,0x65624db5,0x34e901d2,0x3ca42f5b	! PA = 00000000300c1430
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
	.word	0x2d5d1d20,0x09a574b1,0x5778ff5e,0x799e4f37	! PA = 0000000010101400
	.word	0x2387240c,0x48ac1c6d,0x59f702aa,0x4d2fc5d3	! PA = 0000000010101410
	.word	0x7ac5eeb8,0x128720e9,0x19f6f7b6,0x07394f2f	! PA = 0000000010101420
	.word	0x3dd1c924,0x5d6e1e25,0x3b608a82,0x7d48674b	! PA = 0000000010101430
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
	.word	0x5364bf50,0x7f7b7021,0x55bb270e,0x43334a27	! PA = 0000000030101400
	.word	0x42e69d3c,0x052832dd,0x3339f95a,0x1674f3c3	! PA = 0000000030101410
	.word	0x28d8eee8,0x20884259,0x4d87ed66,0x7849201f	! PA = 0000000030101420
	.word	0x67030054,0x0d463a95,0x7453af32,0x32884b3b	! PA = 0000000030101430
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
	.word	0x5c5ddd80,0x055f7791,0x499baabe,0x4343b117	! PA = 0000000010141400
	.word	0x30c0526c,0x22a0154d,0x7fba0c0a,0x6b214db3	! PA = 0000000010141410
	.word	0x004aeb18,0x48deefc9,0x0530bf16,0x5a77dd0f	! PA = 0000000010141420
	.word	0x7293f384,0x74f9a305,0x0a356fe2,0x392adb2b	! PA = 0000000010141430
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
	.word	0x099377b0,0x0c908b01,0x0bfd8a6e,0x05468407	! PA = 0000000030141400
	.word	0x344f439c,0x0a82c3bd,0x51ca3aba,0x045bd3a3	! PA = 0000000030141410
	.word	0x7146e348,0x242a2939,0x07b46cc6,0x439c85ff	! PA = 0000000030141420
	.word	0x0c9fa2b4,0x43575775,0x6338cc92,0x62b7171b	! PA = 0000000030141430
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
	.word	0x46108de0,0x710daa71,0x7d83c61e,0x2572c2f7	! PA = 0000000010181400
	.word	0x6a8e70cc,0x0cff3e2d,0x4f7d856a,0x080b8593	! PA = 0000000010181410
	.word	0x2db7d778,0x6dc8eea9,0x7b95f676,0x524e1aef	! PA = 0000000010181420
	.word	0x4f010de4,0x45ee57e5,0x5150c542,0x6573ff0b	! PA = 0000000010181430
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
	.word	0x56a02010,0x6995d5e1,0x36915dce,0x40bf6de7	! PA = 0000000030181400
	.word	0x7638d9fc,0x5104849d,0x62a6ec1a,0x78d76383	! PA = 0000000030181410
	.word	0x5948c7a8,0x73da4019,0x17185c26,0x1de39bdf	! PA = 0000000030181420
	.word	0x71533514,0x590da455,0x423059f2,0x4c6892fb	! PA = 0000000030181430
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
	.word	0x09cd2e40,0x77a80d51,0x3749517e,0x64e384d7	! PA = 00000000201c0000
	.word	0x2fc97f2c,0x4441970d,0x68d96eca,0x26266d73	! PA = 00000000201c0010
	.word	0x3964b3d8,0x073d1d89,0x503e9dd6,0x267408cf	! PA = 00000000201c0020
	.word	0x78f11844,0x57c43cc5,0x6f4a8aa2,0x675bd2eb	! PA = 00000000201c0030
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
	.word	0x67e2b870,0x578350c1,0x178ea12e,0x005607c7	! PA = 0000000020800000
	.word	0x557b605c,0x0b25757d,0x63680d7a,0x1c1fa363	! PA = 0000000020800010
	.word	0x65369c08,0x6b9086f9,0x0ccbbb86,0x44d661bf	! PA = 0000000020800020
	.word	0x68f5b774,0x0be12135,0x0dd25752,0x3ad4bedb	! PA = 0000000020800030
	.word	0x62ebbea0,0x7026a031,0x37044cde,0x524df6b7	! PA = 0000000020800040
	.word	0x3b497d8c,0x70df1fed,0x2765c82a,0x13aa0553	! PA = 0000000020800050
	.word	0x75a98038,0x47337c69,0x5242b536,0x1aa1a6af	! PA = 0000000020800060
	.word	0x723c12a4,0x1df351a5,0x7ebac002,0x701a56cb	! PA = 0000000020800070
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
	.word	0x06b340d0,0x4350fba1,0x6d0d548e,0x5ac251a7	! PA = 00000000211c0000
	.word	0x7aeed6bc,0x575d965d,0x0da59eda,0x626c9343	! PA = 00000000211c0010
	.word	0x35686068,0x1344fdd9,0x75e68ae6,0x022cd79f	! PA = 00000000211c0020
	.word	0x235f29d4,0x0549ce15,0x7eb6c4b2,0x45339abb	! PA = 00000000211c0030
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
	.word	0x28c43f00,0x5d816311,0x38ccb83e,0x4a6a1897	! PA = 0000000021800000
	.word	0x23e66bec,0x274fd8cd,0x22ba918a,0x6ace4d33	! PA = 0000000021800010
	.word	0x50de3c98,0x0ba40b49,0x4cba3c96,0x7e8ef48f	! PA = 0000000021800020
	.word	0x18b9fd04,0x77f39685,0x56396562,0x7ce78aab	! PA = 0000000021800030
	.word	0x1869b930,0x45f6d681,0x712577ee,0x72bc4b87	! PA = 0000000021800040
	.word	0x6b6b3d1c,0x4024e73d,0x56f7a03a,0x0bf63323	! PA = 0000000021800050
	.word	0x063614c8,0x1eefa4b9,0x5b80ca46,0x2b9efd7f	! PA = 0000000021800060
	.word	0x2c678c34,0x5abfaaf5,0x0975a212,0x4ebd269b	! PA = 0000000021800070
	.word	0x4eaeaf60,0x6eb055f1,0x74ba939e,0x35efea77	! PA = 0000000021800080
	.word	0x5c784a4c,0x680bc1ad,0x2e6fcaea,0x11cb4513	! PA = 0000000021800090
	.word	0x555ae8f8,0x5e86ca29,0x06bd33f6,0x2df3f26f	! PA = 00000000218000a0
	.word	0x2642d764,0x313d0b65,0x085e7ac2,0x56fb6e8b	! PA = 00000000218000b0
	.word	0x1e5e2190,0x246ce161,0x59ef0b4e,0x76fbf567	! PA = 00000000218000c0
	.word	0x07c8937c,0x3bf3681d,0x70f6119a,0x24f48303	! PA = 00000000218000d0
	.word	0x2ff7b928,0x6e887b99,0x42b279a6,0x22e4d35f	! PA = 00000000218000e0
	.word	0x6be6de94,0x0dbab7d5,0x5ea6ef72,0x06a9627b	! PA = 00000000218000f0
	.word	0x64030fc0,0x7eab78d1,0x1ee5defe,0x09976c57	! PA = 0000000021800100
	.word	0x33d718ac,0x1f8ada8d,0x5a1d744a,0x3ad8ecf3	! PA = 0000000021800110
	.word	0x29778558,0x75d3b909,0x43639b56,0x1088a04f	! PA = 0000000021800120
	.word	0x30aea1c4,0x0147b045,0x63c20022,0x138e026b	! PA = 0000000021800130
	.word	0x35e879f0,0x4fab1c41,0x59820eae,0x22394f47	! PA = 0000000021800140
	.word	0x0cded9dc,0x2d4118fd,0x4938f2fa,0x059f82e3	! PA = 0000000021800150
	.word	0x27054d88,0x0e078279,0x2c939906,0x55b6593f	! PA = 0000000021800160
	.word	0x25b520f4,0x0bb2f4b5,0x6ae2acd2,0x68304e5b	! PA = 0000000021800170
	.word	0x14196020,0x146acbb1,0x67669a5e,0x46189e37	! PA = 0000000021800180
	.word	0x54dad70c,0x2645236d,0x715b8daa,0x642f44d3	! PA = 0000000021800190
	.word	0x0f8c11b8,0x3382d7e9,0x41c572b6,0x1a04fe2f	! PA = 00000000218001a0
	.word	0x29d55c24,0x0b8b8525,0x72fbf582,0x13d7464b	! PA = 00000000218001b0
	.word	0x1860c250,0x64a98721,0x1df6820e,0x3b2c5927	! PA = 00000000218001c0
	.word	0x1386103c,0x6285f9dd,0x0958445a,0x522f32c3	! PA = 00000000218001d0
	.word	0x7bb6d1e8,0x3564b959,0x163c2866,0x3dcb8f1f	! PA = 00000000218001e0
	.word	0x79aa5354,0x2e206195,0x56c0da32,0x3a89ea3b	! PA = 00000000218001f0
share3_end:
