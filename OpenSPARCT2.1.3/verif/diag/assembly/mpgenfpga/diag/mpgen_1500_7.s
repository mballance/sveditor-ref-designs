/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_7.s
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
!	Seed = 327144522
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_7.s created on Mar 27, 2009 (14:45:22)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_7 -p 1 -l 1500

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
!	%f0  = fe404be9 e15ff053 4c7409d6 faf1fd1d
!	%f4  = c0dd6dad ac4afc78 66e69755 abc494e6
!	%f8  = 9b3da965 49f66542 d5798c2a 8c640302
!	%f12 = 2ddbe38d 11c9ce6c fa897263 ff007ac4
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 1a5e06f5 024d0e79 7ec1827f ba63f429
!	%f20 = 79712c98 1e002b42 6a65fdce ad3359d4
!	%f24 = 1aa3d4c8 60cf7529 a3f8d4e4 412a4443
!	%f28 = 80b96942 812fd83f fa50418d 05b6d313
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 94ad1c1c d7cfd5cd 498c63e2 166f67c7
!	%f36 = 4f58c117 d70ef967 625005b1 34ed13b9
!	%f40 = d70f8fb2 3847586c 73caa9ae c01dc268
!	%f44 = 98dee8ff 9f025c36 87a2d8ec 0674e1ce
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x01159dff00000010,%g7,%g1 ! GSR scale =  2, align = 0
	wr	%g1,%g0,%gsr		! GSR = 01159dff00000010
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000100c1400] = 45c0c745 f0fa9075, %l0 = a3c21a0f, %l1 = da43a574
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 0000000045c0c745 00000000f0fa9075
!	Mem[0000000030001400] = 81e80175, %l5 = a6faa98c3180bf06
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000075
!	%l1 = 00000000f0fa9075, %l6 = 3ad2da6a9bead260, %l0 = 0000000045c0c745
	addc	%l1,%l6,%l0		! %l0 = 3ad2da6b8ce562d5
!	%l4 = f5a93394, %l5 = 00000075, Mem[0000000010001410] = 1eff6dbe 95e5065c
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = f5a93394 00000075
!	Mem[0000000010081438] = dedcd297d3d1ac9b, %l2 = c99b79068f89e293, %l0 = 3ad2da6b8ce562d5
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = dedcd297d3d1ac9b
!	Mem[00000000201c0000] = 2a5ff5e1, %l4 = acd7d5aff5a93394
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000002a5f
!	%l3 = 8e09f69633127bcd, Mem[0000000030181400] = 86bf798a
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 86bf7bcd
!	Mem[00000000300c1400] = 4da5938e, %l2 = c99b79068f89e293
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = ffffffffffffff8e
!	Mem[0000000010081408] = 88c15e99, %l1 = 00000000f0fa9075
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = ffffffff88c15e99
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff8e, Mem[0000000010041408] = a765890e
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffff8e

p0_label_2:
!	Mem[0000000010001410] = f5a93394, %l6 = 3ad2da6a9bead260
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000f5a93394
!	%f24 = 1aa3d4c8 60cf7529, %l6 = 00000000f5a93394
!	Mem[0000000010001430] = 20da190867476ccf
	add	%i0,0x030,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_P ! Mem[0000000010001430] = 20da190867476ccf
!	%l4 = 0000000000002a5f, %l2 = ffffffffffffff8e, %y  = 00000000
	umul	%l4,%l2,%l4		! %l4 = 00002a5effed21b2, %y = 00002a5e
!	%l4 = ffed21b2, %l5 = 00000075, Mem[0000000010001418] = beb72a72 48820868
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = ffed21b2 00000075
!	%l5 = 0000000000000075, Mem[0000000010001400] = 48d7e647
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 48d7e675
!	%l3 = 8e09f69633127bcd, %l6 = 00000000f5a93394, %l4  = 00002a5effed21b2
	mulx	%l3,%l6,%l4		! %l4 = a1eae2b120ae6984
!	Mem[0000000030041410] = 53f2069f, %l1 = ffffffff88c15e99
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 0000000053f2069f
!	%f12 = 2ddbe38d 11c9ce6c, %l4 = a1eae2b120ae6984
!	Mem[0000000010041410] = 26f74f52c7916701
	add	%i1,0x010,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_P ! Mem[0000000010041410] = 2df74f52c7c96701
!	%f2  = 4c7409d6 faf1fd1d, Mem[0000000030041408] = 5f32d010 5898a632
	stda	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 4c7409d6 faf1fd1d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = d99178ce, %l2 = ffffffffffffff8e
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = ffffffffd99178ce

p0_label_3:
!	Mem[0000000010141408] = 587577c9, %l4 = a1eae2b120ae6984
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = 00000000587577c9
!	Mem[0000000030141400] = da0e2e46, %f15 = ff007ac4
	lda	[%i5+%g0]0x81,%f15	! %f15 = da0e2e46
!	Mem[0000000010141408] = c9777558 3f98fef2, %l4 = 587577c9, %l5 = 00000075
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000c9777558 000000003f98fef2
!	Mem[0000000010181400] = 96f4972d 80d089c5, %l6 = f5a93394, %l7 = 5daf11bc
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000096f4972d 0000000080d089c5
!	Mem[0000000030041408] = d609744c, %l0 = dedcd297d3d1ac9b
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 000000000000744c
!	Mem[0000000010181400] = 2d97f496, %l6 = 0000000096f4972d
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 000000002d97f496
!	Mem[0000000030081408] = a4c8aff5, %l7 = 0000000080d089c5
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffffa4
!	Mem[0000000030081408] = f5afc8a4, %l2 = ffffffffd99178ce
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = fffffffff5afc8a4
!	Mem[0000000010001428] = 6b5c1a83, %l6 = 000000002d97f496
	ldswa	[%i0+0x028]%asi,%l6	! %l6 = 000000006b5c1a83
!	Starting 10 instruction Store Burst
!	Mem[0000000010081438] = dedcd297, %l3 = 8e09f69633127bcd
	ldsw	[%i2+0x038],%l3		! %l3 = ffffffffdedcd297

p0_label_4:
!	Mem[0000000010141408] = 587577c9, %l3 = ffffffffdedcd297
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000587577c9
!	%l2 = fffffffff5afc8a4, Mem[0000000010181434] = ab34f7d3
	stw	%l2,[%i6+0x034]		! Mem[0000000010181434] = f5afc8a4
!	Mem[0000000030081410] = d8650bbf, %l3 = 00000000587577c9
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000d8650bbf
!	%l4 = c9777558, %l5 = 3f98fef2, Mem[0000000030081400] = 07913d55 059068f8
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = c9777558 3f98fef2
!	Mem[0000000030001410] = 0e3dea20, %l4 = 00000000c9777558
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 000000000e3dea20
!	%l6 = 000000006b5c1a83, Mem[0000000030141408] = 379ca0f7
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 379c1a83
!	%l6 = 000000006b5c1a83, %l5 = 000000003f98fef2, %l1 = 0000000053f2069f
	sdivx	%l6,%l5,%l1		! %l1 = 0000000000000001
!	%l2 = fffffffff5afc8a4, Mem[0000000030181400] = 86bf7bcd
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = f5afc8a4
!	%l5 = 000000003f98fef2, Mem[0000000030041400] = 55ce4e7c
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 3f98fef2
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 38ca7fe3, %l2 = fffffffff5afc8a4
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000038ca

p0_label_5:
!	Mem[0000000010101420] = b43671e0771290dc, %f22 = 6a65fdce ad3359d4
	ldda	[%i4+0x020]%asi,%f22	! %f22 = b43671e0 771290dc
!	Mem[00000000100c1410] = 62842646b16b1eec, %f20 = 79712c98 1e002b42
	ldda	[%i3+%o5]0x80,%f20	! %f20 = 62842646 b16b1eec
!	Mem[00000000100c1410] = 62842646 b16b1eec, %l6 = 6b5c1a83, %l7 = ffffffa4
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 0000000062842646 00000000b16b1eec
!	%f12 = 2ddbe38d, Mem[0000000010101400] = 196cc887
	sta	%f12,[%i4+%g0]0x88	! Mem[0000000010101400] = 2ddbe38d
!	Mem[0000000010181408] = 84ac5c2f, %l0 = 000000000000744c
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 0000000084ac5c2f
!	Mem[0000000030041410] = 76b69b9d 995ec188, %l0 = 84ac5c2f, %l1 = 00000001
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000995ec188 0000000076b69b9d
!	Mem[0000000010001410] = 60d2ea9b, %l5 = 000000003f98fef2
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = 0000000060d2ea9b
!	Mem[0000000030001410] = c9777558, %l3 = 00000000d8650bbf
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000c977
!	Mem[0000000010141404] = c5c8722c, %l2 = 00000000000038ca
	lduh	[%i5+0x004],%l2		! %l2 = 000000000000c5c8
!	Starting 10 instruction Store Burst
!	%l2 = 0000c5c8, %l3 = 0000c977, Mem[0000000010101438] = 1198ad0d 8cb03c43
	stda	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000c5c8 0000c977

p0_label_6:
!	%f11 = 8c640302, Mem[0000000030081400] = c9777558
	sta	%f11,[%i2+%g0]0x89	! Mem[0000000030081400] = 8c640302
!	%l4 = 0e3dea20, %l5 = 60d2ea9b, Mem[0000000030001410] = c9777558 4d21e627
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0e3dea20 60d2ea9b
!	Mem[0000000030001408] = 41b5aeb9, %l2 = 000000000000c5c8
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = 0000000041b5aeb9
!	%l0 = 00000000995ec188, Mem[00000000211c0000] = 889f6ca5, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 889f6ca5
!	Mem[0000000020800000] = 6025e181, %l0 = 00000000995ec188
	ldstub	[%o1+%g0],%l0		! %l0 = 00000060000000ff
!	%f10 = d5798c2a, Mem[0000000010001400] = 75e6d748
	sta	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = d5798c2a
!	%l3 = 000000000000c977, Mem[0000000030001408] = b9aeb541
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = b9aeb577
!	Mem[0000000030141408] = 831a9c37, %l2 = 0000000041b5aeb9
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000083000000ff
!	Mem[0000000010141410] = 2db19af65be790f8, %l0 = 0000000000000060, %l6 = 0000000062842646
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 2db19af65be790f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 2db19af6 5be790f8, %l0 = 00000060, %l1 = 76b69b9d
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 000000002db19af6 000000005be790f8

p0_label_7:
!	Mem[0000000010041418] = b7fb00db1a1368fc, %f24 = 1aa3d4c8 60cf7529
	ldd	[%i1+0x018],%f24	! %f24 = b7fb00db 1a1368fc
!	Mem[0000000010001400] = d5798c2a, %l5 = 0000000060d2ea9b
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000d5
!	Mem[0000000010181410] = 8999a672, %l4 = 000000000e3dea20
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000089
!	Mem[00000000201c0000] = 2a5ff5e1, %l5 = 00000000000000d5
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = 000000000000005f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101400] = 8de3db2d 49ab3c82 42cb47db 2b32282e
!	Mem[0000000010101410] = 4cf81df7 f136a371 e3ae467b f2cdcb03
!	Mem[0000000010101420] = b43671e0 771290dc c8cebecc 8c3855b4
!	Mem[0000000010101430] = 107ed60d b565b7b1 0000c5c8 0000c977
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010101400] = 8de3db2d, %l7 = 00000000b16b1eec
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 000000008de3db2d
!	Mem[0000000010001400] = d5798c2a, %l4 = 0000000000000089
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffd5798c2a
!	Mem[0000000030001408] = 77b5aeb9, %l6 = 2db19af65be790f8
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 00000000000077b5
!	Mem[0000000010141400] = 20c913c2c5c8722c, %l5 = 000000000000005f
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 20c913c2c5c8722c
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffd5798c2a, Mem[0000000020800040] = 38ca7fe3, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 8c2a7fe3

p0_label_8:
!	%f1  = e15ff053, %f7  = abc494e6
	fcmpes	%fcc2,%f1 ,%f7 		! %fcc2 = 1
	membar	#Sync			! Added by membar checker (2)
!	%f6  = 66e69755 abc494e6, Mem[0000000010101410] = f71df84c 71a336f1
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 66e69755 abc494e6
!	Mem[00000000300c1408] = 67777b67, %l6 = 00000000000077b5
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000067777b67
!	%l6 = 0000000067777b67, Mem[0000000020800041] = 8c2a7fe3
	stb	%l6,[%o1+0x041]		! Mem[0000000020800040] = 8c677fe3
!	%f24 = b43671e0 771290dc, %l0 = 000000002db19af6
!	Mem[00000000100c1428] = e627c24b9e3f378c
	add	%i3,0x028,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1428] = e627c24be07136b4
!	%f30 = 0000c5c8 0000c977, Mem[0000000010141418] = 510d1b7c 7313ca4e
	stda	%f30,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000c5c8 0000c977
!	Mem[00000000300c1408] = 000077b5, %l4 = ffffffffd5798c2a
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f12 = 2ddbe38d 11c9ce6c, %l5 = 20c913c2c5c8722c
!	Mem[0000000030181428] = 609351efda226fcd
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181428] = 6093c911dae36fcd
!	%l5 = 20c913c2c5c8722c, Mem[0000000020800001] = ff25e181
	stb	%l5,[%o1+0x001]		! Mem[0000000020800000] = ff2ce181
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 8de3db2d49ab3c82, %f10 = d5798c2a 8c640302
	ldda	[%i4+%g0]0x80,%f10	! %f10 = 8de3db2d 49ab3c82

p0_label_9:
!	Mem[000000001008140c] = daef9282, %l6 = 0000000067777b67
	ldsb	[%i2+0x00e],%l6		! %l6 = ffffffffffffff92
!	Mem[00000000100c1408] = 6acd3744 5fe82999, %l0 = 2db19af6, %l1 = 5be790f8
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 000000006acd3744 000000005fe82999
!	Mem[00000000211c0000] = 889f6ca5, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000889f
!	Mem[0000000010001400] = 2a8c79d5, %f16 = 8de3db2d
	lda	[%i0+%g0]0x88,%f16	! %f16 = 2a8c79d5
!	Mem[0000000030041410] = 88c15e99, %f7  = abc494e6
	lda	[%i1+%o5]0x81,%f7 	! %f7 = 88c15e99
!	Mem[0000000010001418] = ffed21b2, %l4 = 000000000000889f
	ldsb	[%i0+0x018],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = 995ec188, %l5 = 20c913c2c5c8722c
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = ffffffff995ec188
!	Mem[0000000010141410] = 2db19af6, %l7 = 000000008de3db2d
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000002db1
!	Mem[0000000020800040] = 8c677fe3, %l3 = 000000000000c977
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffff8c67
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = e694c4ab, %l3 = ffffffffffff8c67
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000e6000000ff

p0_label_10:
!	Mem[0000000010081410] = 4e5b5089, %l6 = ffffffffffffff92
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 000000004e5b5089
!	%f2  = 4c7409d6, %f26 = c8cebecc, %f14 = fa897263 da0e2e46
	fsmuld	%f2 ,%f26,%f14		! %f14 = c2b8a2b9 7f155100
!	%l4 = ffffffffffffffff, Mem[0000000010141410] = 2db19af6
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%l7 = 0000000000002db1, Mem[0000000030141410] = d068ac26084837fe
	stxa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000002db1
!	Mem[00000000300c1408] = ff0077b5, %l5 = ffffffff995ec188
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ff0077b5
!	%l4 = ffffffff, %l5 = ff0077b5, Mem[00000000100c1408] = 4437cd6a 9929e85f
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff ff0077b5
!	%f23 = f2cdcb03, Mem[0000000030101410] = 83665fc2
	sta	%f23,[%i4+%o5]0x81	! Mem[0000000030101410] = f2cdcb03
!	%l0 = 000000006acd3744, Mem[00000000100c140c] = b57700ff, %asi = 80
	stba	%l0,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 447700ff
!	%l2 = 00000083, %l3 = 000000e6, Mem[0000000030001410] = 20ea3d0e 9bead260
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000083 000000e6
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 45c0c745, %f18 = 42cb47db
	lda	[%i3+%g0]0x80,%f18	! %f18 = 45c0c745

p0_label_11:
!	Mem[0000000010181410] = 8999a672, %l3 = 00000000000000e6
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffff8999
!	Mem[0000000010001400] = 2a8c79d5, %l0 = 000000006acd3744
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffffd5
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030101400] = 076757ba 712bedc7 8204c21c 44d14edc
!	Mem[0000000030101410] = f2cdcb03 872e8493 a0e9002b f5572383
!	Mem[0000000030101420] = 750df918 e182ed45 d5c38f39 76d8a6f4
!	Mem[0000000030101430] = 63550c07 d193eb58 04489dfb 04763e1b
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000021800180] = 39412b6a, %l0 = ffffffffffffffd5
	ldub	[%o3+0x180],%l0		! %l0 = 0000000000000039
!	Mem[0000000010101408] = 42cb47db, %l3 = ffffffffffff8999
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 00000000000042cb
!	%f30 = 0000c5c8, %f28 = 107ed60d, %f24 = b43671e0 771290dc
	fsmuld	%f30,%f28,%f24		! %l0 = 000000000000005b, Unfinished, %fsr = 0400000000
!	Mem[000000001004141c] = 1a1368fc, %l6 = 000000004e5b5089
	ldsba	[%i1+0x01f]%asi,%l6	! %l6 = fffffffffffffffc
!	Mem[00000000100c1410] = 62842646, %f17 = 49ab3c82
	lda	[%i3+%o5]0x80,%f17	! %f17 = 62842646
!	%l2 = 0000000000000083, imm = 0000000000000b98, %l6 = fffffffffffffffc
	orn	%l2,0xb98,%l6		! %l6 = fffffffffffff4e7
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000042cb, Mem[0000000010041410] = 524ff72d
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 524f42cb

p0_label_12:
	membar	#Sync			! Added by membar checker (4)
!	%f22 = e3ae467b f2cdcb03, %l1 = 000000005fe82999
!	Mem[0000000030101428] = d5c38f3976d8a6f4
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101428] = 03cb8f3976d8aee3
!	%l5 = 00000000ff0077b5, Mem[0000000030001408] = b9aeb577
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0077b5
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000000005b
	setx	0x71e1fd58151d23e3,%g7,%l0 ! %l0 = 71e1fd58151d23e3
!	%l1 = 000000005fe82999
	setx	0x5719f1d7f3fa2f7b,%g7,%l1 ! %l1 = 5719f1d7f3fa2f7b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 71e1fd58151d23e3
	setx	0x9b4479284d42720b,%g7,%l0 ! %l0 = 9b4479284d42720b
!	%l1 = 5719f1d7f3fa2f7b
	setx	0x5aa18c3f9c7ccf63,%g7,%l1 ! %l1 = 5aa18c3f9c7ccf63
!	Mem[0000000030081410] = c9777558, %l7 = 0000000000002db1
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000c9777558
!	%l2 = 0000000000000083, Mem[0000000030101408] = 1cc20482
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000083
!	%f8  = 45ed82e1 18f90d75, %l1 = 5aa18c3f9c7ccf63
!	Mem[0000000010001400] = d5798c2aa9997bb0
	stda	%f8,[%i0+%l1]ASI_PST8_P ! Mem[0000000010001400] = d5ed822aa9990d75
!	%l5 = 00000000ff0077b5, Mem[0000000010001410] = 60d2ea9b75000000
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff0077b5
!	Mem[0000000010181410] = 72a69989, %l6 = fffffffffffff4e7
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 0000000072a69989
!	Mem[000000001008140c] = daef9282, %l0 = 9b4479284d42720b
	swap	[%i2+0x00c],%l0		! %l0 = 00000000daef9282
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 750d99a92a82edd5, %l7 = 00000000c9777558
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = 750d99a92a82edd5

p0_label_13:
!	Mem[0000000010141400] = 20c913c2, %l7 = 750d99a92a82edd5
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 00000000000020c9
!	Mem[0000000010141400] = c213c920, %l4 = ffffffffffffffff
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffc920
!	Mem[00000000300c1410] = 0b3586c4, %f27 = 8c3855b4
	lda	[%i3+%o5]0x89,%f27	! %f27 = 0b3586c4
!	Mem[0000000010181408] = d32ad924 84ac5c2f, %l0 = daef9282, %l1 = 9c7ccf63
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 0000000084ac5c2f 00000000d32ad924
!	Mem[0000000010081408] = 995ec188, %l2 = 0000000000000083
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 00000099000000ff
!	Mem[00000000100c1408] = ffffffff, %l5 = 00000000ff0077b5
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1400] = 45c0c745, %l4 = ffffffffffffc920
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000045
!	%l5 = 000000000000ffff, Mem[00000000100c1408] = ffffffff, %asi = 80
	stwa	%l5,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000ffff
!	Mem[0000000010141400] = 20c913c2 c5c8722c, %l6 = 72a69989, %l7 = 000020c9
	ldd	[%i5+%g0],%l6		! %l6 = 0000000020c913c2 00000000c5c8722c
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = f2cdcb03, %l5 = 000000000000ffff
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000f2000000ff

p0_label_14:
!	%f16 = 2a8c79d5 62842646 45c0c745 2b32282e
!	%f20 = 4cf81df7 f136a371 e3ae467b f2cdcb03
!	%f24 = b43671e0 771290dc c8cebecc 0b3586c4
!	%f28 = 107ed60d b565b7b1 0000c5c8 0000c977
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%f4  = 93842e87 03cbcdf2, Mem[0000000030141400] = da0e2e46 37bf0970
	stda	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 93842e87 03cbcdf2
!	%f8  = 45ed82e1 18f90d75, %l6 = 0000000020c913c2
!	Mem[0000000030001428] = 459e9c0916e5d2de
	add	%i0,0x028,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_S ! Mem[0000000030001428] = 459e9c0918f9d2de
!	%f4  = 93842e87, Mem[0000000030041400] = f2fe983f
	sta	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 93842e87
!	Mem[00000000300c1400] = 8e93a54d, %l0 = 0000000084ac5c2f
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 000000008e93a54d
!	%l1 = 00000000d32ad924, Mem[0000000010041414] = c7c96701
	stb	%l1,[%i1+0x014]		! Mem[0000000010041414] = 24c96701
!	%l3 = 00000000000042cb, Mem[0000000030101408] = 00000083
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000cb
!	Mem[00000000300c1408] = 995ec188, %l7 = 00000000c5c8722c
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 00000099000000ff
!	%l6 = 0000000020c913c2, Mem[0000000010041410] = cb424f52
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = c2424f52
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181410] = e7f4ffff, %l5 = 00000000000000f2
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000e7f4

p0_label_15:
!	Mem[00000000211c0000] = 889f6ca5, %l1 = 00000000d32ad924
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 000000000000009f
!	Mem[0000000010001400] = d5ed822a, %l3 = 00000000000042cb
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffd5
!	Mem[00000000300c1400] = 2f5cac84, %l0 = 000000008e93a54d
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffac84
!	Mem[0000000030101400] = ba576707, %l7 = 0000000000000099
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000007
!	Mem[0000000030101410] = 03cbcdff, %l3 = ffffffffffffffd5
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 0000000003cbcdff
!	Mem[0000000030081410] = 00002db1, %l0 = ffffffffffffac84
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000b1
!	Mem[0000000030181408] = 2e28322b 45c7c045, %l2 = 00000099, %l3 = 03cbcdff
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000045c7c045 000000002e28322b
!	Mem[0000000030141400] = 872e8493, %l7 = 0000000000000007
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = ffffffff872e8493
!	Mem[0000000010141410] = ffffffff, %l1 = 000000000000009f
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 2a82edd5, %l7 = ffffffff872e8493
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 000000d5000000ff

p0_label_16:
!	%l2 = 0000000045c7c045, %l1 = 000000000000ffff, %y  = 00002a5e
	sdiv	%l2,%l1,%l3		! %l3 = 000000002a5e7026
	mov	%l0,%y			! %y = 000000b1
!	Mem[0000000030081410] = 00002db1, %l5 = 000000000000e7f4
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000b1000000ff
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000000000b1
	setx	0x2b71c8ffc4ce05fd,%g7,%l0 ! %l0 = 2b71c8ffc4ce05fd
!	%l1 = 000000000000ffff
	setx	0xbae483d7f558bc67,%g7,%l1 ! %l1 = bae483d7f558bc67
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2b71c8ffc4ce05fd
	setx	0x18857d7ff1b0d56b,%g7,%l0 ! %l0 = 18857d7ff1b0d56b
!	%l1 = bae483d7f558bc67
	setx	0xf741cba856a88a07,%g7,%l1 ! %l1 = f741cba856a88a07
!	%l0 = 18857d7ff1b0d56b, Mem[0000000010081410] = 92ffffff
	stba	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 92ffff6b
!	%f2  = dc4ed144 1cc20482, Mem[0000000030141410] = b12d0000 00000000
	stda	%f2 ,[%i5+%o5]0x81	! Mem[0000000030141410] = dc4ed144 1cc20482
!	Mem[0000000010101410] = abc494ff, %l4 = 0000000000000045
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001400] = 7501e881, %l5 = 00000000000000b1
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 000000007501e881
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 995ec188
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 995ec1ff
!	%l7 = 00000000000000d5, Mem[0000000010101408] = db47cb42
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = db4700d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 17bc24109e037e63, %f20 = 4cf81df7 f136a371
	ldd	[%i5+0x038],%f20	! %f20 = 17bc2410 9e037e63

p0_label_17:
!	Mem[0000000030141408] = 379c1aff, %l4 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000379c1aff
!	Mem[00000000300c1410] = 0b3586c4, %l1 = f741cba856a88a07
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 000000000b3586c4
!	Mem[0000000030141410] = 44d14edc, %l6 = 0000000020c913c2
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = 0000000044d14edc
!	Mem[0000000020800040] = 8c677fe3, %l2 = 0000000045c7c045
	ldsh	[%o1+0x040],%l2		! %l2 = ffffffffffff8c67
!	Mem[0000000010001400] = ffed822a, %l6 = 0000000044d14edc
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 000000000000ffed
!	%f20 = 17bc2410, %f30 = 0000c5c8, %f22 = e3ae467b
	fadds	%f20,%f30,%f22		! %l0 = 18857d7ff1b0d58d, Unfinished, %fsr = 0400000000
!	Mem[0000000030041408] = 1dfdf1fad609744c, %f16 = 2a8c79d5 62842646
	ldda	[%i1+%o4]0x89,%f16	! %f16 = 1dfdf1fa d609744c
!	Mem[0000000030001408] = ff0077b5, %l2 = ffffffffffff8c67
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 00000000ff0077b5
!	Mem[0000000010141400] = 20c913c2, %l1 = 000000000b3586c4
	lduha	[%i5+0x000]%asi,%l1	! %l1 = 00000000000020c9
!	Starting 10 instruction Store Burst
!	%f10 = f4a6d876, %f14 = 1b3e7604, %f1  = ba576707
	fdivs	%f10,%f14,%f1 		! %f1  = ff800000

p0_label_18:
!	%f14 = 1b3e7604 fb9d4804, Mem[0000000010141408] = dedcd297 f2fe983f
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 1b3e7604 fb9d4804
!	%l6 = 0000ffed, %l7 = 000000d5, Mem[0000000030001400] = b1000000 8376d92f
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000ffed 000000d5
!	%l0 = f1b0d58d, %l1 = 000020c9, Mem[0000000030101408] = cb000000 44d14edc
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = f1b0d58d 000020c9
!	%l6 = 000000000000ffed, Mem[0000000030081410] = 00002dff
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00002ded
!	%f8  = 45ed82e1 18f90d75, Mem[0000000010101400] = 8de3db2d 49ab3c82
	stda	%f8 ,[%i4+0x000]%asi	! Mem[0000000010101400] = 45ed82e1 18f90d75
!	Mem[00000000100c1420] = 81da077a, %l2 = 00000000ff0077b5
	swap	[%i3+0x020],%l2		! %l2 = 0000000081da077a
!	%l7 = 00000000000000d5, %l1 = 00000000000020c9, %l6 = 000000000000ffed
	addc	%l7,%l1,%l6		! %l6 = 000000000000219e
!	%f14 = 1b3e7604 fb9d4804, %l4 = 00000000379c1aff
!	Mem[0000000010101430] = 107ed60db565b7b1
	add	%i4,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010101430] = 04489dfb04763e1b
!	Mem[0000000010181400] = 2d97f496, %l4 = 00000000379c1aff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000096000000ff
!	Starting 10 instruction Load Burst
!	%l3 = 000000002a5e7026, %l0 = 18857d7ff1b0d58d, %l2 = 0000000081da077a
	subc	%l3,%l0,%l2		! %l2 = e77a828038ad9a99

p0_label_19:
!	Mem[0000000010081408] = ff5ec188, %l7 = 00000000000000d5
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000ff5e
!	Mem[0000000010001410] = b57700ff 00000000, %l6 = 0000219e, %l7 = 0000ff5e
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 00000000b57700ff
!	Mem[0000000030141410] = dc4ed144, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffdc4e
!	%l4 = 0000000000000096, %l7 = 00000000b57700ff, %l1  = 00000000000020c9
	mulx	%l4,%l7,%l1		! %l1 = 0000006a53ba956a
!	Mem[0000000030041400] = 0f092bea 872e8493, %l6 = ffffdc4e, %l7 = b57700ff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000872e8493 000000000f092bea
!	Mem[0000000010141410] = ffffffff, %l3 = 000000002a5e7026
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 45c0c745, %l3 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 0000000045c0c745
!	Mem[00000000201c0000] = 2a5ff5e1, %l0 = 18857d7ff1b0d58d
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000002a5f
!	Mem[0000000010041438] = f115586f, %l3 = 0000000045c0c745
	lduha	[%i1+0x038]%asi,%l3	! %l3 = 000000000000f115
!	Starting 10 instruction Store Burst
!	%l1 = 0000006a53ba956a, %l2 = e77a828038ad9a99, %l2 = e77a828038ad9a99
	udivx	%l1,%l2,%l2		! Div by zero, %l0 = 0000000000002a87

p0_label_20:
!	Mem[0000000010041421] = 7f5b4d63, %l1 = 0000006a53ba956a
	ldstuba	[%i1+0x021]%asi,%l1	! %l1 = 0000005b000000ff
!	%l7 = 000000000f092bea, Mem[0000000010001410] = b57700ff00000000
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000000f092bea
!	%l3 = 000000000000f115, Mem[0000000010141410] = ffffffff
	stwa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000f115
!	Mem[0000000010081408] = 88c15eff, %l5 = 000000007501e881
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l1 = 000000000000005b, Mem[0000000030141410] = dc4ed144
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 005bd144
!	%f9  = 18f90d75, Mem[00000000100c1418] = 6b0547a0
	sta	%f9 ,[%i3+0x018]%asi	! Mem[00000000100c1418] = 18f90d75
!	%f30 = 0000c5c8, Mem[0000000010101424] = 771290dc
	sta	%f30,[%i4+0x024]%asi	! Mem[0000000010101424] = 0000c5c8
!	%l2 = 0000000000000000, Mem[0000000010141400] = 20c913c2
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l4 = 0000000000000096, Mem[0000000010081410] = 92ffff6b
	stha	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 92ff0096
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 2a8c79d562842646, %f0  = c7ed2b71 ff800000
	ldda	[%i6+%g0]0x81,%f0 	! %f0  = 2a8c79d5 62842646

p0_label_21:
!	Mem[0000000010041410] = 524f42c2, %f20 = 17bc2410
	lda	[%i1+%o5]0x88,%f20	! %f20 = 524f42c2
!	Mem[0000000010181434] = f5afc8a4, %f24 = b43671e0
	ld	[%i6+0x034],%f24	! %f24 = f5afc8a4
!	Mem[000000001014140c] = 04763e1b, %l7 = 000000000f092bea
	lduha	[%i5+0x00c]%asi,%l7	! %l7 = 0000000000000476
!	Mem[0000000030081408] = a4c8aff5d941fd77, %f20 = 524f42c2 9e037e63
	ldda	[%i2+%o4]0x81,%f20	! %f20 = a4c8aff5 d941fd77
!	Mem[0000000010101410] = 66e69755 abc494ff, %l4 = 00000096, %l5 = 000000ff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000abc494ff 0000000066e69755
!	Mem[0000000010181400] = 2d97f4ff, %l3 = 000000000000f115
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000f4ff
!	Mem[0000000030181400] = 2a8c79d5, %l6 = 00000000872e8493
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = 000000000000002a
!	Mem[0000000010181410] = e7f4ffff 001d2690, %l0 = 00002a5f, %l1 = 0000005b
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 00000000e7f4ffff 00000000001d2690
!	Mem[00000000300c1410] = 0b3586c4, %l0 = 00000000e7f4ffff
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000c4
!	Starting 10 instruction Store Burst
!	%l1 = 00000000001d2690, Mem[0000000010101408] = d50047db
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 001d2690

p0_label_22:
!	Mem[0000000010181408] = 2f5cac84, %l0 = 00000000000000c4
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 0000002f000000ff
!	%l4 = abc494ff, %l5 = 66e69755, Mem[0000000010041410] = 524f42c2 0167c924
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = abc494ff 66e69755
!	Mem[0000000010141410] = 15f10000, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f18 = 45c0c745 2b32282e, Mem[0000000010141438] = 17bc2410 9e037e63
	std	%f18,[%i5+0x038]	! Mem[0000000010141438] = 45c0c745 2b32282e
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 7590faf045c7c045
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l4 = 00000000abc494ff, Mem[0000000010141408] = fb9d4804
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = abc494ff
!	%f25 = 771290dc, Mem[0000000030001408] = ff0077b5
	sta	%f25,[%i0+%o4]0x89	! Mem[0000000030001408] = 771290dc
!	Mem[0000000020800001] = ff2ce181, %l6 = 000000000000002a
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 0000002c000000ff
!	%l5 = 0000000066e69755, Mem[00000000100c1408] = 0000ffff
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5500ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff94c4ab, %f5  = 03cbcdf2
	lda	[%i4+%o5]0x80,%f5 	! %f5 = ff94c4ab

p0_label_23:
!	%l4 = 00000000abc494ff, %l1 = 00000000001d2690, %y  = 000000b1
	umul	%l4,%l1,%l4		! %l4 = 00138f24ad94a970, %y = 00138f24
!	Mem[00000000300c1408] = ff5ec188, %l6 = 000000000000002c
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffff5ec188
!	Mem[00000000201c0000] = 2a5ff5e1, %l7 = 0000000000000476
	ldsb	[%o0+%g0],%l7		! %l7 = 000000000000002a
!	Mem[0000000030101408] = 8dd5b0f1, %l1 = 00000000001d2690
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffb0f1
!	Mem[0000000030181410] = 4cf81df7, %l0 = 000000000000002f
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 000000004cf81df7
!	Mem[0000000030181400] = 2a8c79d5, %l5 = 0000000066e69755
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000002a8c
!	Mem[0000000010101408] = 001d2690, %l3 = 000000000000f4ff
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000001d
!	%f22 = e3ae467b, %f2  = dc4ed144
	fsqrts	%f22,%f2 		! %f2  = 7fffffff
!	Mem[0000000010081400] = d99178ce, %l0 = 000000004cf81df7
	ldswa	[%i2+0x000]%asi,%l0	! %l0 = ffffffffd99178ce
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffd99178ce, Mem[0000000030101400] = 076757ba
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = d99178ce

p0_label_24:
!	%l4 = ad94a970, %l5 = 00002a8c, Mem[00000000100c1420] = ff0077b5 9fc5c897
	std	%l4,[%i3+0x020]		! Mem[00000000100c1420] = ad94a970 00002a8c
!	%l3 = 000000000000001d, Mem[00000000300c1408] = ff5ec188
	stha	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 001dc188
!	Mem[0000000030001410] = 83000000, %l6 = ffffffffff5ec188
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000083000000
!	Mem[0000000010081408] = 88c15eff, %l5 = 0000000000002a8c
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_3:
!	%l0 = ffffffffd99178ce
	setx	0x4ccd03a7d8bc4509,%g7,%l0 ! %l0 = 4ccd03a7d8bc4509
!	%l1 = ffffffffffffb0f1
	setx	0x28cf9e707bcf98a4,%g7,%l1 ! %l1 = 28cf9e707bcf98a4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ccd03a7d8bc4509
	setx	0x960b46302e092376,%g7,%l0 ! %l0 = 960b46302e092376
!	%l1 = 28cf9e707bcf98a4
	setx	0x6b51c597cb5e6b70,%g7,%l1 ! %l1 = 6b51c597cb5e6b70
!	%f6  = 832357f5, Mem[0000000010001400] = 2a82edff
	sta	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 832357f5
!	Mem[0000000030001408] = 771290dc, %l3 = 000000000000001d
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000dc000000ff
!	%l7 = 000000000000002a, imm = 0000000000000fe8, %l2 = 0000000000000000
	and	%l7,0xfe8,%l2		! %l2 = 0000000000000028
!	%l1 = 6b51c597cb5e6b70, Mem[0000000010041410] = ff94c4ab
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = cb5e6b70
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 88c15eff, %l5 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_25:
!	Mem[0000000030081408] = a4c8aff5, %l0 = 960b46302e092376
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffa4c8aff5
!	Mem[0000000030001410] = ff5ec188, %l3 = 00000000000000dc
	ldsha	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffff5e
!	Mem[0000000030081408] = a4c8aff5, %f16 = 1dfdf1fa
	lda	[%i2+%o4]0x81,%f16	! %f16 = a4c8aff5
!	Mem[0000000010001428] = 6b5c1a83, %l5 = 00000000000000ff
	ldsb	[%i0+0x028],%l5		! %l5 = 000000000000006b
!	Mem[0000000010041400] = 2ace19b3 ad794f5f, %l0 = a4c8aff5, %l1 = cb5e6b70
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 000000002ace19b3 00000000ad794f5f
!	Mem[0000000030081410] = 9afba2d1 00002ded, %l0 = 2ace19b3, %l1 = ad794f5f
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000000002ded 000000009afba2d1
!	Mem[0000000010141408] = ff94c4ab 04763e1b, %l6 = 83000000, %l7 = 0000002a
	ldd	[%i5+%o4],%l6		! %l6 = 00000000ff94c4ab 0000000004763e1b
!	Mem[0000000010041424] = 5fb65974, %l6 = 00000000ff94c4ab
	ldswa	[%i1+0x024]%asi,%l6	! %l6 = 000000005fb65974
!	Mem[00000000100c1438] = bb2d5a5e568f4e05, %l4 = 00138f24ad94a970
	ldxa	[%i3+0x038]%asi,%l4	! %l4 = bb2d5a5e568f4e05
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 88c15eff, %l7 = 0000000004763e1b
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000ff000000ff

p0_label_26:
!	Mem[0000000030181400] = 2a8c79d5, %l0 = 0000000000002ded
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 000000002a8c79d5
!	%l6 = 000000005fb65974, Mem[0000000030181400] = ed2d0000
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 5fb65974
!	%f6  = 832357f5, Mem[0000000010181434] = f5afc8a4
	sta	%f6 ,[%i6+0x034]%asi	! Mem[0000000010181434] = 832357f5
!	%l0 = 000000002a8c79d5, Mem[00000000100c1408] = 5500ffff
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 2a8c79d5
!	Mem[0000000030001408] = ff901277, %l0 = 000000002a8c79d5
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff901277
!	%f2  = 7fffffff 1cc20482, Mem[0000000030081400] = 0203648c f2fe983f
	stda	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 7fffffff 1cc20482
!	%l7 = 00000000000000ff, Mem[0000000010101420] = b43671e00000c5c8
	stx	%l7,[%i4+0x020]		! Mem[0000000010101420] = 00000000000000ff
!	Mem[0000000020800040] = 8c677fe3, %l5 = 000000000000006b
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 0000008c000000ff
!	Mem[000000001018142c] = bef76aa4, %l0 = 00000000ff901277, %asi = 80
	swapa	[%i6+0x02c]%asi,%l0	! %l0 = 00000000bef76aa4
!	Starting 10 instruction Load Burst
!	%f26 = c8cebecc 0b3586c4, Mem[00000000100c1400] = 00000000 00000000
	stda	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = c8cebecc 0b3586c4

p0_label_27:
!	Mem[00000000300c1408] = 001dc18872dd1cb4, %l0 = 00000000bef76aa4
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = 001dc18872dd1cb4
!	Mem[0000000030141410] = 005bd1441cc20482, %f18 = 45c0c745 2b32282e
	ldda	[%i5+%o5]0x81,%f18	! %f18 = 005bd144 1cc20482
!	Mem[0000000010001400] = f5572383, %l5 = 000000000000008c
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = fffffffff5572383
!	Mem[0000000010181410] = fffff4e7, %l0 = 001dc18872dd1cb4
	lduha	[%i6+%o5]0x88,%l0	! %l0 = 000000000000f4e7
!	Mem[000000001014140c] = 04763e1b, %l3 = ffffffffffffff5e
	lduw	[%i5+0x00c],%l3		! %l3 = 0000000004763e1b
!	Mem[0000000030041410] = 995ec1ff, %l5 = fffffffff5572383
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = 872e8493, %l0 = 000000000000f4e7
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000008493
!	Mem[0000000030001410] = ff5ec188, %l0 = 0000000000008493
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffff5e
!	Mem[0000000030181400] = 5fb65974, %l3 = 0000000004763e1b
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000005974
!	Starting 10 instruction Store Burst
!	Mem[0000000010101436] = 04763e1b, %l3 = 0000000000005974
	ldstuba	[%i4+0x036]%asi,%l3	! %l3 = 0000003e000000ff

p0_label_28:
!	Mem[0000000030101400] = d99178ce, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000d99178ce
!	%l2 = 00000028, %l3 = 0000003e, Mem[0000000010141408] = ff94c4ab 04763e1b
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000028 0000003e
!	Mem[00000000100c1410] = 62842646, %l1 = 000000009afba2d1
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000062000000ff
!	%l0 = ffffffffffffff5e, Mem[0000000010081410] = 9600ff92a17ddc21
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffffffff5e
!	%f4  = 93842e87 ff94c4ab, Mem[0000000030101400] = ffffffff 712bedc7
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 93842e87 ff94c4ab
!	Mem[0000000030141410] = 005bd144, %l0 = ffffffffffffff5e
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 00000000005bd144
!	%l6 = 5fb65974, %l7 = 000000ff, Mem[0000000010081410] = ffffffff 5effffff
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 5fb65974 000000ff
!	%l5 = 00000000d99178ce, Mem[0000000010141410] = 15f100ff
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = d99178ce
!	Mem[0000000021800141] = f6e63528, %l5 = 00000000d99178ce
	ldstuba	[%o3+0x141]%asi,%l5	! %l5 = 000000e6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 872e8493, %f22 = e3ae467b
	lda	[%i4+%g0]0x89,%f22	! %f22 = 872e8493

p0_label_29:
!	Mem[0000000010141410] = f890e75b d99178ce, %l4 = 568f4e05, %l5 = 000000e6
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000d99178ce 00000000f890e75b
!	Mem[0000000010101408] = 001d2690, %l5 = 00000000f890e75b
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 000000000000001d
!	Mem[0000000010041410] = cb5e6b70, %l5 = 000000000000001d
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffcb
!	Mem[0000000010001408] = a6656aecc61e3420, %l7 = 00000000000000ff
	ldx	[%i0+%o4],%l7		! %l7 = a6656aecc61e3420
!	Mem[0000000030181410] = 4cf81df7, %l7 = a6656aecc61e3420
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 000000000000004c
!	Mem[0000000010001404] = a9990d75, %l7 = 000000000000004c
	ldswa	[%i0+0x004]%asi,%l7	! %l7 = ffffffffa9990d75
!	Mem[0000000010001408] = ec6a65a6, %l0 = 00000000005bd144
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 00000000000065a6
!	Mem[0000000030001410] = ff5ec188, %l7 = ffffffffa9990d75
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = ce7891d9, %l6 = 000000005fb65974
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 00000000000091d9
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ffffff5e, %l3 = 000000000000003e
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000ffffff5e

p0_label_30:
!	%l1 = 0000000000000062, imm = 0000000000000d7b, %l1 = 0000000000000062
	and	%l1,0xd7b,%l1		! %l1 = 0000000000000062
!	Mem[0000000030141410] = 0000003e, %l0 = 00000000000065a6
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f30 = 0000c5c8 0000c977, %l0 = 0000000000000000
!	Mem[0000000030101438] = 04489dfb04763e1b
	add	%i4,0x038,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_S ! Mem[0000000030101438] = 04489dfb04763e1b
!	Mem[00000000100c1400] = 0b3586c4, %l6 = 00000000000091d9
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000c4000000ff
!	Mem[0000000030041400] = 872e8493, %l4 = 00000000d99178ce
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000093000000ff
!	%l1 = 0000000000000062, Mem[0000000010101418] = e3ae467bf2cdcb03, %asi = 80
	stxa	%l1,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000000000062
!	%f24 = f5afc8a4 771290dc, Mem[0000000030101410] = 03cbcdff 93842e87
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = f5afc8a4 771290dc
!	%l4 = 0000000000000093, Mem[0000000020800041] = ff677fe3, %asi = 80
	stba	%l4,[%o1+0x041]%asi	! Mem[0000000020800040] = ff937fe3
!	%l0 = 0000000000000000, Mem[0000000030141410] = 3e0000ff
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 3e000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 3e000000, %l3 = 00000000ffffff5e
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_31:
!	Mem[0000000010101400] = 45ed82e1, %l1 = 0000000000000062
	ldsb	[%i4+0x001],%l1		! %l1 = ffffffffffffffed
!	Mem[0000000010181400] = fff4972d 80d089c5, %l6 = 000000c4, %l7 = 000000ff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000fff4972d 0000000080d089c5
!	Mem[00000000300c1410] = c486350b, %l1 = ffffffffffffffed
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 000000000000c486
!	Mem[0000000030141400] = 872e8493, %l2 = 0000000000000028
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffff872e8493
!	Mem[0000000030101400] = 93842e87, %l7 = 0000000080d089c5
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000093842e87
!	Mem[00000000100c1400] = ff86350b, %l5 = ffffffffffffffcb
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = ffc15e99, %l4 = 0000000000000093
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[000000001018140c] = 24d92ad3, %l4 = 00000000000000ff
	ldsw	[%i6+0x00c],%l4		! %l4 = 0000000024d92ad3
!	Mem[0000000010141438] = 45c0c745, %f0  = 2a8c79d5
	lda	[%i5+0x038]%asi,%f0 	! %f0 = 45c0c745
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000c486, Mem[0000000010041408] = 8effffff
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000c486

p0_label_32:
!	%f7  = 2b00e9a0, Mem[000000001008143c] = d3d1ac9b
	st	%f7 ,[%i2+0x03c]	! Mem[000000001008143c] = 2b00e9a0
!	%f22 = 872e8493, Mem[0000000010181410] = e7f4ffff
	sta	%f22,[%i6+0x010]%asi	! Mem[0000000010181410] = 872e8493
!	Mem[000000001014141d] = 0000c977, %l3 = 0000000000000000
	ldstub	[%i5+0x01d],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030101408] = c92000008dd5b0f1, %f10 = f4a6d876 398fc3d5
	ldda	[%i4+%o4]0x89,%f10	! %f10 = c9200000 8dd5b0f1
!	Mem[0000000010101410] = abc494ff, %l7 = 0000000093842e87
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 90261d00
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010181410] = 872e8493, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000872e8493
!	%f29 = b565b7b1, Mem[0000000010141418] = 0000c5c8
	sta	%f29,[%i5+0x018]%asi	! Mem[0000000010141418] = b565b7b1
!	%f16 = a4c8aff5 d609744c, Mem[0000000010101408] = 000000ff 2e28322b
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = a4c8aff5 d609744c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000c486
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_33:
!	Mem[00000000100c1400] = ff86350b, %l3 = 00000000872e8493
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffff86
!	Mem[0000000010081410] = 000000ff5fb65974, %l3 = ffffffffffffff86
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 000000ff5fb65974
!	Mem[0000000010181408] = ff5cac84, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffff5cac84
!	Mem[0000000030101410] = dc901277 a4c8aff5, %l0 = 00000000, %l1 = ff5cac84
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000dc901277 00000000a4c8aff5
!	Mem[0000000010041400] = 2ace19b3ad794f5f, %l1 = 00000000a4c8aff5
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = 2ace19b3ad794f5f
!	Mem[0000000010041408] = 0000c486, %l7 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000086
!	Mem[0000000030141400] = 93842e87, %l2 = ffffffff872e8493
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 0000000093842e87
!	Mem[0000000030101408] = f1b0d58d, %l1 = 2ace19b3ad794f5f
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 00000000f1b0d58d
!	Mem[0000000010101408] = d609744c, %l7 = 0000000000000086
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 000000000000744c
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000744c, Mem[0000000010181408] = 84ac5cff
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 84ac5c4c

p0_label_34:
!	Mem[0000000010041408] = 0000c486, %l1 = 00000000f1b0d58d
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000086000000ff
!	%l1 = 0000000000000086, Mem[0000000030041410] = ffc15e99
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 00865e99
!	Mem[0000000030101410] = 771290dc, %l6 = 00000000fff4972d
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 00000000771290dc
!	Mem[0000000010181400] = fff4972d, %l5 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000fff4972d
!	Mem[0000000021800000] = b0b731c9, %l2 = 0000000093842e87
	ldstuba	[%o3+0x000]%asi,%l2	! %l2 = 000000b0000000ff
!	%l4 = 0000000024d92ad3, Mem[0000000030181408] = 45c0c745
	stha	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 2ad3c745
!	Mem[00000000100c1410] = 462684ff, %l0 = 00000000dc901277
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000024d92ad3, Mem[0000000030001410] = ff5ec188
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 2ad3c188
!	Mem[00000000201c0001] = 2a5ff5e1, %l4 = 0000000024d92ad3
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000005f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff5ec188, %l6 = 00000000771290dc
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = ffffffffff5ec188

p0_label_35:
!	Mem[00000000100c1410] = ff842646, %l3 = 000000ff5fb65974
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffff84
!	Mem[0000000030001400] = 0000ffed, %l5 = 00000000fff4972d
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 000000000000ffed
!	Mem[0000000010101408] = 4c7409d6, %l7 = 000000000000744c
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 000000000000004c
!	Mem[00000000211c0000] = 889f6ca5, %l4 = 000000000000005f
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffff889f
!	Mem[0000000010041410] = 706b5ecb, %l5 = 000000000000ffed
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000706b5ecb
!	%l4 = ffffffffffff889f, %l6 = ffffffffff5ec188, %l0 = 00000000000000ff
	xor	%l4,%l6,%l0		! %l0 = 0000000000a14917
!	Mem[0000000030001400] = 0000ffed, %f27 = 0b3586c4
	lda	[%i0+%g0]0x89,%f27	! %f27 = 0000ffed
!	Mem[0000000010041428] = 42a7327b, %l0 = 0000000000a14917
	lduwa	[%i1+0x028]%asi,%l0	! %l0 = 0000000042a7327b
!	Mem[0000000010041430] = 41ecb9e0, %l2 = 00000000000000b0
	ldsh	[%i1+0x030],%l2		! %l2 = 00000000000041ec
!	Starting 10 instruction Store Burst
!	%f16 = a4c8aff5 d609744c 005bd144 1cc20482
!	%f20 = a4c8aff5 d941fd77 872e8493 f2cdcb03
!	%f24 = f5afc8a4 771290dc c8cebecc 0000ffed
!	%f28 = 107ed60d b565b7b1 0000c5c8 0000c977
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400

p0_label_36:
!	Mem[00000000100c1428] = e627c24b, %l3 = ffffff84, %l1 = 00000086
	add	%i3,0x28,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000e627c24b
!	%l7 = 000000000000004c, Mem[0000000010081424] = 2dd0e715, %asi = 80
	stwa	%l7,[%i2+0x024]%asi	! Mem[0000000010081424] = 0000004c
!	Mem[0000000030001400] = 0000ffed, %l1 = 00000000e627c24b
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000ed000000ff
!	%f8  = 45ed82e1 18f90d75, Mem[0000000010041408] = ffc40000 0fa9fc44
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 45ed82e1 18f90d75
!	%f10 = c9200000, Mem[0000000030001410] = 88c1d32a
	sta	%f10,[%i0+%o5]0x89	! Mem[0000000030001410] = c9200000
!	Mem[00000000218001c1] = c38f86d6, %l0 = 0000000042a7327b
	ldstuba	[%o3+0x1c1]%asi,%l0	! %l0 = 0000008f000000ff
!	%l4 = ffffffffffff889f, immed = fffffdae, %y  = 00138f24
	udiv	%l4,-0x252,%l3		! %l3 = 0000000000138f25
	mov	%l0,%y			! %y = 0000008f
!	%f4  = 93842e87 ff94c4ab, Mem[0000000030041400] = ff842e87 ea2b090f
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 93842e87 ff94c4ab
!	Mem[0000000010001410] = ea2b090f, %l3 = 0000000000138f25
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ea2b090f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 872e8493, %l3 = 00000000ea2b090f
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffff93

p0_label_37:
!	Mem[0000000030041408] = 1dfdf1fad609744c, %f10 = c9200000 8dd5b0f1
	ldda	[%i1+%o4]0x89,%f10	! %f10 = 1dfdf1fa d609744c
!	Mem[0000000020800000] = ffffe181, %l3 = ffffffffffffff93
	lduba	[%o1+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%l4 = ffffffffffff889f, imm = 00000000000002a8, %l6 = ffffffffff5ec188
	xnor	%l4,0x2a8,%l6		! %l6 = 00000000000075c8
!	Mem[00000000211c0000] = 889f6ca5, %l6 = 00000000000075c8
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000889f
!	%l1 = 00000000000000ed, imm = 000000000000068f, %l1 = 00000000000000ed
	or	%l1,0x68f,%l1		! %l1 = 00000000000006ef
!	Mem[0000000010141408] = 28000000, %l0 = 000000000000008f
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = 0000000028000000
!	Mem[0000000010001410] = 258f1300, %l6 = 000000000000889f
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800000] = ffb731c9, %l1 = 00000000000006ef
	lduha	[%o3+0x000]%asi,%l1	! %l1 = 000000000000ffb7
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010181410] = a4c8aff5d941fd77, %f12 = 58eb93d1 070c5563
	ldda	[%i6+%o5]0x88,%f12	! %f12 = a4c8aff5 d941fd77
!	Starting 10 instruction Store Burst
!	%f26 = c8cebecc 0000ffed, %l4 = ffffffffffff889f
!	Mem[0000000010181438] = 77c90000c8c50000
	add	%i6,0x038,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_P ! Mem[0000000010181438] = c8c900cc0000ffed

p0_label_38:
!	%l6 = 0000000000000000, Mem[0000000010081400] = ce7891d9
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ce780000
!	Mem[0000000010141408] = 28000000, %l2 = 00000000000041ec
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 872e8493, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000093000000ff
!	%l0 = 0000000028000000, Mem[00000000300c1408] = 001dc18872dd1cb4
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000028000000
!	%l4 = ffffffffffff889f, Mem[00000000100c1430] = 9af82241, %asi = 80
	stba	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = 9ff82241
!	Mem[0000000030041408] = d609744c, %l3 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000d609744c
!	%l7 = 000000000000004c, Mem[0000000010181430] = b1b765b5
	sth	%l7,[%i6+0x030]		! Mem[0000000010181430] = 004c65b5
!	Mem[00000000300c1410] = c486350b, %l1 = 000000000000ffb7
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000c4000000ff
!	%l6 = 0000000000000093, Mem[0000000010081400] = 000078ce
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000093
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff937fe3, %l0 = 0000000028000000
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff

p0_label_39:
!	Mem[0000000010001410] = 00138f25, %l1 = 00000000000000c4
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = ce7891d95be790f8, %f28 = 107ed60d b565b7b1
	ldda	[%i5+%o5]0x80,%f28	! %f28 = ce7891d9 5be790f8
!	Mem[0000000030141400] = f2cdcb03 872e8493, %l2 = 00000000, %l3 = d609744c
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000872e8493 00000000f2cdcb03
!	Mem[0000000010181408] = 1cc20482, %l0 = ffffffffffffffff
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000482
!	Mem[0000000010041438] = f115586fae6ee463, %f0  = 45c0c745 62842646
	ldd	[%i1+0x038],%f0 	! %f0  = f115586f ae6ee463
!	Mem[00000000211c0000] = 889f6ca5, %l6 = 0000000000000093
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000889f
!	Mem[00000000100c1418] = 18f90d758b53f310, %l4 = ffffffffffff889f
	ldxa	[%i3+0x018]%asi,%l4	! %l4 = 18f90d758b53f310
!	Mem[0000000020800040] = ff937fe3, %l0 = 0000000000000482
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000ff93
!	Mem[0000000010041400] = 2ace19b3, %l5 = 00000000706b5ecb
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000002ace
!	Starting 10 instruction Store Burst
!	%f14 = 1b3e7604 fb9d4804, %l3 = 00000000f2cdcb03
!	Mem[0000000030101418] = a0e9002bf5572383
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_S ! Mem[0000000030101418] = a0e9002bf5574804

p0_label_40:
!	%f6  = 832357f5, Mem[0000000010001408] = ec6a65a6
	sta	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 832357f5
!	Mem[000000001018140c] = 44d15b00, %l0 = 0000ff93, %l4 = 8b53f310
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000044d15b00
!	Mem[0000000010141400] = 00000000, %l7 = 000000000000004c
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f16 = a4c8aff5 d609744c 005bd144 1cc20482
!	%f20 = a4c8aff5 d941fd77 872e8493 f2cdcb03
!	%f24 = f5afc8a4 771290dc c8cebecc 0000ffed
!	%f28 = ce7891d9 5be790f8 0000c5c8 0000c977
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	Mem[000000001008143c] = 2b00e9a0, %l2 = 00000000872e8493
	ldstuba	[%i2+0x03c]%asi,%l2	! %l2 = 0000002b000000ff
!	%f7  = 2b00e9a0, Mem[0000000010081400] = 93000000
	sta	%f7 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 2b00e9a0
!	%l5 = 0000000000002ace, Mem[0000000030141408] = 379c1aff
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 379c1ace
!	%f3  = 1cc20482, Mem[0000000030101408] = 8dd5b0f1
	sta	%f3 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 1cc20482
!	Mem[0000000020800000] = ffffe181, %l2 = 000000000000002b
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 5f4f79adb319ce2a, %f8  = 45ed82e1 18f90d75
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = 5f4f79ad b319ce2a

p0_label_41:
!	Mem[000000001004143c] = ae6ee463, %l3 = 00000000f2cdcb03
	ldsha	[%i1+0x03e]%asi,%l3	! %l3 = ffffffffffffe463
!	Mem[0000000010181430] = 004c65b5, %l1 = 0000000000000000
	ldsb	[%i6+0x033],%l1		! %l1 = ffffffffffffffb5
!	Mem[0000000030101400] = 872e84ff, %f12 = a4c8aff5
	lda	[%i4+%g0]0x89,%f12	! %f12 = 872e84ff
!	Mem[0000000010081410] = 7459b65f ff000000, %l0 = 0000ff93, %l1 = ffffffb5
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 000000007459b65f 00000000ff000000
!	Mem[0000000020800000] = ffffe181, %l6 = 000000000000889f
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041400] = 5f4f79adb319ce2a, %l4 = 0000000044d15b00
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 5f4f79adb319ce2a
!	Mem[00000000100c1408] = d5798c2a, %l6 = 000000000000ffff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000008c2a
!	%l7 = 0000000000000000, %l1 = 00000000ff000000, %l3 = ffffffffffffe463
	sub	%l7,%l1,%l3		! %l3 = ffffffff01000000
!	Mem[0000000030081410] = 9afba2d100002ded, %l5 = 0000000000002ace
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = 9afba2d100002ded
!	Starting 10 instruction Store Burst
!	%f0  = f115586f, Mem[0000000010181408] = 1cc20482
	sta	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = f115586f

p0_label_42:
!	%l2 = 00000000000000ff, Mem[0000000010081400] = a0e9002b
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Mem[0000000010101410] = ff94c4ab5597e666, %l1 = 00000000ff000000, %l1 = 00000000ff000000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = ff94c4ab5597e666
!	%f0  = f115586f ae6ee463 7fffffff 1cc20482
!	%f4  = 93842e87 ff94c4ab 832357f5 2b00e9a0
!	%f8  = 5f4f79ad b319ce2a 1dfdf1fa d609744c
!	%f12 = 872e84ff d941fd77 1b3e7604 fb9d4804
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%l4 = b319ce2a, %l5 = 00002ded, Mem[0000000010181400] = 4c7409d6 f5afc8a4
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = b319ce2a 00002ded
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 2afff5e1, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00fff5e1
!	%l0 = 000000007459b65f, Mem[0000000030101408] = c92000001cc20482
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000007459b65f
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030001408] = 005bd144, %l6 = 0000000000008c2a
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000005bd144
!	%f0  = f115586f, %f27 = 0000ffed
	fitos	%f0 ,%f27		! %f27 = cd6eaa79
!	%l6 = 005bd144, %l7 = 00000000, Mem[0000000030041408] = 000000ff 1dfdf1fa
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 005bd144 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d5798c2a, %l1 = ff94c4ab5597e666
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000008c2a

p0_label_43:
!	Mem[0000000010041430] = 41ecb9e09109f485, %f14 = 1b3e7604 fb9d4804
	ldda	[%i1+0x030]%asi,%f14	! %f14 = 41ecb9e0 9109f485
!	Mem[0000000010081410] = 7459b65f, %f21 = d941fd77
	lda	[%i2+0x010]%asi,%f21	! %f21 = 7459b65f
!	Mem[0000000030041408] = 005bd144, %l5 = 9afba2d100002ded
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000044
!	Mem[0000000010181410] = 77fd41d9, %l2 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 0000000077fd41d9
!	Mem[0000000010001400] = f5572383, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 00000000f5572383
!	Mem[0000000010001400] = f5572383 a9990d75 f5572383 c61e3420
!	Mem[0000000010001410] = 00138f25 00000000 ffed21b2 00000075
!	Mem[0000000010001420] = 6df6c2c9 625702e7 6b5c1a83 38d0cbec
!	Mem[0000000010001430] = 20da1908 67476ccf ad01c571 26c585c6
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000010081410] = 7459b65fff000000, %l1 = 0000000000008c2a
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = 7459b65fff000000
!	Mem[0000000010101410] = ff94c4ab, %l3 = ffffffff01000000
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = ffffffffff94c4ab
!	Mem[0000000010141400] = f115586f ae6ee463 7fffffff 1cc20482
!	Mem[0000000010141410] = 93842e87 ff94c4ab 832357f5 2b00e9a0
!	Mem[0000000010141420] = 5f4f79ad b319ce2a 1dfdf1fa d609744c
!	Mem[0000000010141430] = 872e84ff d941fd77 1b3e7604 fb9d4804
	ldda	[%i5]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffff94c4ab, Mem[0000000020800041] = ff937fe3, %asi = 80
	stba	%l3,[%o1+0x041]%asi	! Mem[0000000020800040] = ffab7fe3

p0_label_44:
!	%f0  = f5572383 a9990d75, Mem[0000000030101400] = ff842e87 ff94c4ab
	stda	%f0 ,[%i4+%g0]0x81	! Mem[0000000030101400] = f5572383 a9990d75
	membar	#Sync			! Added by membar checker (8)
!	%l4 = 5f4f79adb319ce2a, Mem[0000000010141410] = 872e8493
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 872ece2a
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000007459b65f
	setx	0xd86fc1e0735d8517,%g7,%l0 ! %l0 = d86fc1e0735d8517
!	%l1 = 7459b65fff000000
	setx	0xdd54fcbfaba68599,%g7,%l1 ! %l1 = dd54fcbfaba68599
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d86fc1e0735d8517
	setx	0x01540937cfc21540,%g7,%l0 ! %l0 = 01540937cfc21540
!	%l1 = dd54fcbfaba68599
	setx	0x5767f378587d1674,%g7,%l1 ! %l1 = 5767f378587d1674
!	%l2 = 0000000077fd41d9, Mem[0000000010081400] = 000000ff
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 77fd41d9
!	%l6 = 00000000005bd144, Mem[0000000030181410] = f71df84c
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = f71dd144
!	Mem[0000000021800101] = b94770fe, %l6 = 00000000005bd144
	ldstub	[%o3+0x101],%l6		! %l6 = 00000047000000ff
!	Mem[0000000010041400] = 2ace19b3, %l5 = 0000000000000044
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 0000002a000000ff
!	Mem[0000000010181408] = 6f5815f1, %l5 = 000000000000002a, %asi = 80
	swapa	[%i6+0x008]%asi,%l5	! %l5 = 000000006f5815f1
!	%l0 = 01540937cfc21540, Mem[0000000030041400] = 872e8493
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = cfc21540
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = c8cebecc0b3586ff, %l2 = 0000000077fd41d9
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = c8cebecc0b3586ff

p0_label_45:
!	Mem[0000000010141410] = abc494ff872ece2a, %l5 = 000000006f5815f1
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = abc494ff872ece2a
!	Mem[0000000030001408] = 2a8c0000, %l4 = 5f4f79adb319ce2a
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ff94c4ab5597e666, %f18 = 7fffffff 1cc20482
	ldd	[%i4+%o5],%f18		! %f18 = ff94c4ab 5597e666
!	Mem[0000000030001410] = f5afc8a4, %l1 = 5767f378587d1674
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000a4
!	Mem[0000000010001420] = 6df6c2c9 625702e7, %l0 = cfc21540, %l1 = 000000a4
	ldda	[%i0+0x020]%asi,%l0	! %l0 = 000000006df6c2c9 00000000625702e7
!	Mem[0000000030181410] = f71dd144, %l3 = ffffffffff94c4ab
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000044
!	Mem[0000000030101400] = f5572383, %l0 = 000000006df6c2c9
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000f557
!	Mem[0000000010041408] = 45ed82e1, %f29 = d941fd77
	lda	[%i1+%o4]0x80,%f29	! %f29 = 45ed82e1
!	Mem[0000000030081400] = 7fffffff, %l1 = 00000000625702e7
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 000000000000007f
!	Starting 10 instruction Store Burst
!	%f31 = fb9d4804, %f15 = 26c585c6, %f16 = f115586f
	fmuls	%f31,%f15,%f16		! %f16 = e2f2b536

p0_label_46:
!	%f4  = 00138f25 00000000, Mem[0000000010181410] = 77fd41d9 f5afc8a4
	stda	%f4 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00138f25 00000000
!	%l2 = 0b3586ff, %l3 = 00000044, Mem[00000000100c1410] = 462684ff ec1e6bb1
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0b3586ff 00000044
!	%f8  = 6df6c2c9 625702e7, Mem[0000000010001400] = f5572383 a9990d75
	stda	%f8 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 6df6c2c9 625702e7
!	%l0 = 000000000000f557, Mem[0000000030181408] = 2ad3c7452b32282e
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000000000f557
!	%l3 = 0000000000000044, Mem[0000000010181400] = 2ace19b3
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 2ace1944
!	%f26 = 1dfdf1fa d609744c, Mem[00000000100c1408] = 2a8c79d5 447700ff
	stda	%f26,[%i3+0x008]%asi	! Mem[00000000100c1408] = 1dfdf1fa d609744c
!	%l7 = 00000000f5572383, Mem[00000000100c1410] = ff86350b
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 8386350b
!	Mem[0000000030041408] = 005bd144, %l0 = 000000000000f557
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000005bd144
!	%l4 = 0000000000000000, Mem[0000000030141400] = f2cdcb03872e8493
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 5fb65974, %l2 = c8cebecc0b3586ff
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = 000000000000005f

p0_label_47:
!	Mem[00000000300c1410] = ff86350b, %l1 = 000000000000007f
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffff86350b
!	Mem[0000000010081410] = 7459b65f ff000000, %l4 = 00000000, %l5 = 872ece2a
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 000000007459b65f 00000000ff000000
!	Mem[00000000100c1408] = 1dfdf1fa, %l4 = 000000007459b65f
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000001dfd
!	Mem[0000000010081400] = 77fd41d9, %l0 = 00000000005bd144
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 0000000077fd41d9
!	Mem[00000000100c1400] = ff86350b, %l1 = ffffffffff86350b
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffff86
!	Mem[0000000030081410] = ed2d0000, %f16 = e2f2b536
	lda	[%i2+%o5]0x81,%f16	! %f16 = ed2d0000
!	Mem[0000000020800040] = ffab7fe3, %l4 = 0000000000001dfd
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000ffab
!	Mem[00000000100c1410] = 8386350b, %l4 = 000000000000ffab
	lduh	[%i3+%o5],%l4		! %l4 = 0000000000008386
!	Mem[0000000030041400] = 4015c2cf ff94c4ab, %l6 = 00000047, %l7 = f5572383
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 000000004015c2cf 00000000ff94c4ab
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000044, Mem[0000000020800000] = ffffe181, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 0044e181

p0_label_48:
!	%l2 = 000000000000005f, Mem[0000000010101417] = 5597e666, %asi = 80
	stba	%l2,[%i4+0x017]%asi	! Mem[0000000010101414] = 5597e65f
!	%f20 = 93842e87 ff94c4ab, %l3 = 0000000000000044
!	Mem[0000000030141428] = 5420f09d0aeff173
	add	%i5,0x028,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141428] = 54202e870aeff173
!	%l2 = 000000000000005f, Mem[0000000030181400] = 5fb65974
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 5fb6005f
!	Mem[00000000300c1410] = 0b3586ff, %l0 = 0000000077fd41d9
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000000b3586ff
!	%l5 = 00000000ff000000, Mem[0000000021800040] = 6f2e79c9
	sth	%l5,[%o3+0x040]		! Mem[0000000021800040] = 000079c9
!	%l3 = 0000000000000044, Mem[0000000030141410] = 0000003e
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000044
!	%f5  = 00000000, Mem[0000000010081410] = 5fb65974
	sta	%f5 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[000000001018142a] = edff0000, %l1 = ffffffffffffff86
	ldstuba	[%i6+0x02a]%asi,%l1	! %l1 = 00000000000000ff
!	%f8  = 6df6c2c9 625702e7, Mem[0000000010141410] = 872ece2a abc494ff
	stda	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 6df6c2c9 625702e7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = f5afc8a4, %l3 = 0000000000000044
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = ffffffffffffffa4

p0_label_49:
!	Mem[0000000010141428] = 1dfdf1fa, %l6 = 000000004015c2cf
	ldsw	[%i5+0x028],%l6		! %l6 = 000000001dfdf1fa
!	Mem[0000000030041410] = 00865e99, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 4c7409d6 f5afc8a4, %l4 = 00008386, %l5 = ff000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 000000004c7409d6 00000000f5afc8a4
!	Mem[0000000030001410] = a4c8aff5, %l0 = 000000000b3586ff
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = ffffffffa4c8aff5
!	Mem[0000000030041408] = 57f50000, %l2 = 000000000000005f
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000057
!	Mem[0000000010141408] = 7fffffff, %l3 = ffffffffffffffa4
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = 000000000000007f
!	Mem[0000000010101420] = 00000000, %l0 = ffffffffa4c8aff5
	ldsha	[%i4+0x020]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 000000001dfdf1fa, imm = 0000000000000386, %l3 = 000000000000007f
	add	%l6,0x386,%l3		! %l3 = 000000001dfdf580
!	Mem[0000000010181400] = 2ace1944, %l2 = 0000000000000057
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 000000002ace1944
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010041410] = 706b5ecb
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 706b5e00

p0_label_50:
!	%l4 = 4c7409d6, %l5 = f5afc8a4, Mem[0000000010081400] = 77fd41d9 f6cf53c4
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 4c7409d6 f5afc8a4
!	Mem[00000000300c1410] = d941fd77, %l5 = 00000000f5afc8a4
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 00000000d941fd77
!	%l0 = 0000000000000000, Mem[0000000030081408] = f5afc8a4
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = f5af0000
!	Mem[0000000030101408] = 5fb65974, %l7 = 00000000ff94c4ab
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 0000005f000000ff
!	Mem[0000000030041400] = 4015c2cf, %l4 = 000000004c7409d6
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 00000040000000ff
!	%l4 = 0000000000000040, Mem[0000000010041438] = f115586f, %asi = 80
	stba	%l4,[%i1+0x038]%asi	! Mem[0000000010041438] = 4015586f
!	%f16 = ed2d0000 ae6ee463, %l5 = 00000000d941fd77
!	Mem[00000000300c1400] = 84ac5c2f501d983e
	stda	%f16,[%i3+%l5]ASI_PST8_SL ! Mem[00000000300c1400] = 63e46e2f00002d3e
!	Mem[0000000030101400] = 832357f5, %l3 = 000000001dfdf580
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000f5000000ff
!	%l2 = 000000002ace1944, Mem[0000000010001408] = 832357f5
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 83231944
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 03cbcdf293842e87, %f12 = 20da1908 67476ccf
	ldda	[%i6+0x018]%asi,%f12	! %f12 = 03cbcdf2 93842e87

p0_label_51:
!	Mem[0000000010181410] = 258f1300, %l3 = 00000000000000f5
	ldswa	[%i6+%o5]0x88,%l3	! %l3 = 00000000258f1300
!	Mem[0000000030041400] = abc494ffcfc215ff, %l4 = 0000000000000040
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = abc494ffcfc215ff
!	Mem[0000000030181400] = 5f00b65f, %l4 = abc494ffcfc215ff
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = 000000000000005f
!	Mem[00000000100c1410] = 0b358683, %l3 = 00000000258f1300
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 000000000b358683
!	Mem[0000000030101410] = 2d97f4ff a4c8aff5, %l2 = 2ace1944, %l3 = 0b358683
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 000000002d97f4ff 00000000a4c8aff5
!	Mem[0000000030101410] = fff4972d, %l4 = 000000000000005f
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000002d
!	Mem[0000000030141410] = 44000000, %l2 = 000000002d97f4ff
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = abc494ff cfc215ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000cfc215ff 00000000abc494ff
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = 4419ce2a 00002ded 0000002a 44d15b00
!	Mem[0000000010181410] = 00138f25 00000000 03cbcdf2 93842e87
!	Mem[0000000010181420] = dc901277 a4c8aff5 edffff00 ccbecec8
!	Mem[0000000010181430] = 004c65b5 0dd67e10 c8c900cc 0000ffed
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%f6  = ffed21b2 00000075, %l1 = 00000000abc494ff
!	Mem[0000000030081408] = 0000aff5d941fd77
	add	%i2,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_S ! Mem[0000000030081408] = ffed21b200000075

p0_label_52:
!	Mem[0000000010141424] = b319ce2a, %l3 = 00000000a4c8aff5
	swap	[%i5+0x024],%l3		! %l3 = 00000000b319ce2a
!	Mem[0000000020800001] = 0044e181, %l3 = 00000000b319ce2a
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 00000044000000ff
!	%l7 = 000000000000005f, Mem[0000000010081400] = a4c8aff5d609744c
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000000000005f
!	%l1 = 00000000abc494ff, Mem[0000000030081408] = b221edff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = abc494ff
!	%l1 = 00000000abc494ff, %l7 = 000000000000005f, %l3 = 0000000000000044
	subc	%l1,%l7,%l3		! %l3 = 00000000abc494a0
!	%l4 = 0000002d, %l5 = d941fd77, Mem[0000000010081400] = 5f000000 00000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000002d d941fd77
!	%f5  = 00000000, Mem[0000000030001410] = f5afc8a4
	sta	%f5 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f8  = 6df6c2c9, Mem[00000000300c1410] = a4c8aff5
	sta	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6df6c2c9
!	%l4 = 000000000000002d, Mem[00000000100c1400] = ff86350bccbecec8, %asi = 80
	stxa	%l4,[%i3+0x000]%asi	! Mem[00000000100c1400] = 000000000000002d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0b358683, %l5 = 00000000d941fd77
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000083

p0_label_53:
!	Mem[0000000030041400] = abc494ffcfc215ff, %l3 = 00000000abc494a0
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = abc494ffcfc215ff
!	Mem[00000000300c1410] = c9c2f66da82fc6be, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = c9c2f66da82fc6be
!	Mem[0000000020800040] = ffab7fe3, %l5 = 0000000000000083
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffffab
!	Mem[0000000030081400] = 7fffffff, %l1 = 00000000abc494ff
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 000000007fffffff
!	Mem[0000000021800180] = 39412b6a, %l2 = c9c2f66da82fc6be
	ldub	[%o3+0x180],%l2		! %l2 = 0000000000000039
!	Mem[0000000030101408] = 7459b6ff, %l0 = 00000000cfc215ff
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 45ed82e1, %l4 = 000000000000002d
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000045
!	Mem[0000000010001410] = 00138f25, %l6 = 000000001dfdf1fa
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000013
!	Mem[0000000010141408] = ffffff7f, %l7 = 000000000000005f
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = 000000000000007f
!	Starting 10 instruction Store Burst
!	%f12 = 03cbcdf2, Mem[0000000010101410] = abc494ff
	sta	%f12,[%i4+%o5]0x88	! Mem[0000000010101410] = 03cbcdf2

p0_label_54:
!	%f15 = 26c585c6, Mem[0000000030001408] = 00008c2a
	sta	%f15,[%i0+%o4]0x81	! Mem[0000000030001408] = 26c585c6
!	%l4 = 0000000000000045, Mem[0000000010141400] = 6f5815f1
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 6f581545
!	%l6 = 00000013, %l7 = 0000007f, Mem[0000000030141400] = 00000000 00000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000013 0000007f
!	%l7 = 000000000000007f, Mem[0000000010141410] = 6df6c2c9625702e7
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000007f
!	Mem[0000000030101408] = ffb65974, %l6 = 0000000000000013
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ffb65974
!	%l7 = 000000000000007f, Mem[00000000100c1400] = 00000000
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000007f
!	Mem[0000000030181400] = 5f00b65f, %l7 = 000000000000007f
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 000000005f00b65f
!	Mem[0000000010081420] = d972d7d50000004c, %l0 = 00000000000000ff, %l3 = abc494ffcfc215ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = d972d7d50000004c
!	%l1 = 000000007fffffff, Mem[0000000030101410] = 2d97f4ff
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 7fffffff, %l3 = d972d7d50000004c
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = 000000007fffffff

p0_label_55:
!	%f15 = 26c585c6, %f2  = f5572383, %f1  = a9990d75
	fmuls	%f15,%f2 ,%f1 		! %f1  = dca5fec0
!	Mem[0000000010081408] = 0b72424d88c15eff, %f0  = f5572383 dca5fec0
	ldda	[%i2+%o4]0x88,%f0 	! %f0  = 0b72424d 88c15eff
!	Mem[00000000300c1410] = 6df6c2c9, %f16 = ed2d0000
	lda	[%i3+%o5]0x89,%f16	! %f16 = 6df6c2c9
!	Mem[00000000211c0000] = 889f6ca5, %l4 = 0000000000000045
	ldsb	[%o2+%g0],%l4		! %l4 = ffffffffffffff88
!	Mem[0000000030041410] = 995e8600, %l6 = 00000000ffb65974
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 00000000995e8600
!	Mem[0000000010041400] = ffce19b3, %l5 = ffffffffffffffab
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 6f581545, %l2 = 0000000000000039
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000045
!	Mem[0000000030101408] = 0000001300000000, %l5 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 0000001300000000
!	Mem[00000000300c1400] = 2f6ee463, %l3 = 000000007fffffff
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 000000002f6ee463
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0000007f, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 000000000000007f

p0_label_56:
!	%l7 = 000000005f00b65f, Mem[00000000100c1408] = faf1fd1d
	stwa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 5f00b65f
	membar	#Sync			! Added by membar checker (10)
!	%f8  = 6df6c2c9 625702e7, Mem[0000000010181408] = 0000002a 44d15b00
	stda	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 6df6c2c9 625702e7
!	%f30 = edff0000 cc00c9c8, %l2 = 0000000000000045
!	Mem[0000000010101428] = c8cebecc8c3855b4
	add	%i4,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_P ! Mem[0000000010101428] = c8cebecccc00c9c8
!	%l2 = 0000000000000045, Mem[0000000030001400] = f5afc8a4
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = f5afc845
!	%f16 = 6df6c2c9 2ace1944, %l4 = ffffffffffffff88
!	Mem[0000000010041420] = 7fff4d635fb65974
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_P ! Mem[0000000010041420] = 7fff4d635fb65974
!	Mem[00000000300c1400] = 2f6ee463, %l6 = 00000000995e8600
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000063000000ff
!	%l7 = 000000005f00b65f, %l3 = 000000002f6ee463, %l0  = 000000000000007f
	mulx	%l7,%l3,%l0		! %l0 = 119a488b2d8522bd
!	%l2 = 00000045, %l3 = 2f6ee463, Mem[0000000010181410] = 00138f25 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000045 2f6ee463
!	%l0 = 119a488b2d8522bd, Mem[0000000010001410] = 258f1300
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 258f22bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = bd228f25, %l0 = 119a488b2d8522bd
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = ffffffffbd228f25

p0_label_57:
!	Mem[00000000100c143c] = 568f4e05, %l2 = 0000000000000045
	ldsha	[%i3+0x03c]%asi,%l2	! %l2 = 000000000000568f
!	Mem[0000000010141438] = 1b3e7604fb9d4804, %f10 = 6b5c1a83 38d0cbec
	ldda	[%i5+0x038]%asi,%f10	! %f10 = 1b3e7604 fb9d4804
!	Mem[0000000030101400] = 832357ff, %l0 = ffffffffbd228f25
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 00000000832357ff
!	Mem[0000000010181430] = 004c65b50dd67e10, %l6 = 0000000000000063
	ldxa	[%i6+0x030]%asi,%l6	! %l6 = 004c65b50dd67e10
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000300c1400] = ffe46e2f 00002d3e 00000000 28000000
!	Mem[00000000300c1410] = c9c2f66d a82fc6be ecebef69 827dbc4c
!	Mem[00000000300c1420] = 09488ecb b778e99e 9f3b0db9 cb14511c
!	Mem[00000000300c1430] = 5143aa23 28a010da 05086044 d43a2725
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030181408] = 00000000 0000f557, %l2 = 0000568f, %l3 = 2f6ee463
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 000000000000f557
!	Mem[0000000030141410] = 00000044, %l6 = 004c65b50dd67e10
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = e182ed45, %l1 = 000000007fffffff
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffe182ed45
!	Mem[0000000010101410] = f2cdcb03, %l1 = ffffffffe182ed45
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000f2cdcb03
!	Starting 10 instruction Store Burst
!	%l0 = 00000000832357ff, Mem[0000000010041410] = 005e6b70
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 832357ff

p0_label_58:
!	%l4 = ffffffffffffff88, Mem[0000000030041400] = cfc215ff
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffff88
!	%l6 = 0000000000000000, Mem[0000000010141430] = 872e84ff, %asi = 80
	stwa	%l6,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000
!	Mem[0000000010041410] = 832357ff, %l0 = 00000000832357ff
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000832357ff
!	Mem[00000000100c1400] = ff0000000000002d, %l7 = 000000005f00b65f, %l5 = 0000001300000000
	casxa	[%i3]0x80,%l7,%l5	! %l5 = ff0000000000002d
!	%f0  = 0b72424d, %f12 = 03cbcdf2, %f6  = ffed21b2
	fsubs	%f0 ,%f12,%f6 		! %f6  = 0b7240b5
!	Mem[0000000010081408] = 88c15eff, %l7 = 000000005f00b65f
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000088c15eff
!	%l7 = 0000000088c15eff, Mem[0000000010081410] = 00000000
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 88c15eff
!	%l3 = 000000000000f557, Mem[0000000010081400] = 2d000000
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 2d00f557
!	%f2  = f5572383 c61e3420, Mem[0000000010181430] = 004c65b5 0dd67e10
	stda	%f2 ,[%i6+0x030]%asi	! Mem[0000000010181430] = f5572383 c61e3420
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 46268462 7f000000, %l6 = 00000000, %l7 = 88c15eff
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 000000007f000000 0000000046268462

p0_label_59:
!	%f10 = 1b3e7604, %f4  = 00138f25
	fcmpes	%fcc3,%f10,%f4 		! %fcc3 = 2
!	Mem[00000000100c141c] = 8b53f310, %l3 = 000000000000f557
	ldsw	[%i3+0x01c],%l3		! %l3 = ffffffff8b53f310
!	Mem[0000000030081408] = ff94c4ab00000075, %f6  = 0b7240b5 00000075
	ldda	[%i2+%o4]0x81,%f6 	! %f6  = ff94c4ab 00000075
!	Mem[000000001018142c] = ccbecec8, %l0 = 00000000832357ff
	lduha	[%i6+0x02e]%asi,%l0	! %l0 = 000000000000cec8
!	Mem[0000000010001410] = 258f22bd, %l7 = 0000000046268462
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 00000000258f22bd
!	Mem[0000000010101410] = f2cdcb03, %l3 = ffffffff8b53f310
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000f2cdcb03
!	Mem[00000000201c0000] = 00fff5e1, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 0000f557, %l3 = 00000000f2cdcb03
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000057
!	Mem[0000000030001400] = 45c8aff5, %l7 = 00000000258f22bd
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000045
!	Starting 10 instruction Store Burst
!	%f3  = c61e3420, Mem[0000000010141400] = 6f581545
	sta	%f3 ,[%i5+%g0]0x88	! Mem[0000000010141400] = c61e3420

p0_label_60:
!	Mem[0000000010081400] = 2d00f557, %l7 = 0000000000000045
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000002d00f557
!	Mem[0000000010001400] = 6df6c2c9, %l6 = 000000007f000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 0000006d000000ff
!	%l6 = 000000000000006d, Mem[0000000010101408] = d609744c
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000006d
!	Mem[0000000030181400] = 7f000000, %l1 = 00000000f2cdcb03
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0001] = 889f6ca5, %l2 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 0000009f000000ff
!	%l2 = 000000000000009f, Mem[0000000010041408] = 45ed82e118f90d75, %asi = 80
	stxa	%l2,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000000000009f
!	%l1 = 0000000000000000, Mem[0000000030141400] = 7f00000013000000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030141408] = ce1a9c379bb6229a
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%f19 = 28000000, Mem[000000001004143c] = ae6ee463
	st	%f19,[%i1+0x03c]	! Mem[000000001004143c] = 28000000
!	Starting 10 instruction Load Burst
!	%l5 = ff0000000000002d, imm = fffffffffffff0dd, %l1 = 0000000000000000
	and	%l5,-0xf23,%l1		! %l1 = ff0000000000000d

p0_label_61:
!	Mem[0000000030081408] = abc494ff, %l2 = 000000000000009f
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 00000000000094ff
!	Mem[0000000010101410] = 03cbcdf2, %l3 = 0000000000000057
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 0000000003cbcdf2
!	Mem[0000000030081400] = abc494ff, %l2 = 00000000000094ff
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffffab
!	Mem[0000000010081410] = 88c15effff000000, %f8  = 6df6c2c9 625702e7
	ldda	[%i2+%o5]0x80,%f8 	! %f8  = 88c15eff ff000000
!	Mem[0000000010081400] = 45000000, %l0 = 000000000000cec8
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000004500
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010041400] = ffce19b3 ad794f5f 00000000 0000009f
!	Mem[0000000010041410] = 832357ff 5597e666 b7fb00db 1a1368fc
!	Mem[0000000010041420] = 7fff4d63 5fb65974 42a7327b 3af4027e
!	Mem[0000000010041430] = 41ecb9e0 9109f485 4015586f 28000000
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010001400] = fff6c2c9625702e7, %l2 = ffffffffffffffab
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = fff6c2c9625702e7
!	%f3  = c61e3420, %f10 = 1b3e7604
	fcmps	%fcc1,%f3 ,%f10		! %fcc1 = 1
!	Mem[0000000030001410] = 00000000, %l2 = fff6c2c9625702e7
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (13)
!	%f0  = 0b72424d 88c15eff, Mem[0000000010041410] = ff572383 66e69755
	stda	%f0 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 0b72424d 88c15eff

p0_label_62:
!	%l6 = 000000000000006d, Mem[0000000010141400] = 20341ec6ae6ee463
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000000000006d
!	Mem[0000000030081400] = abc494ff, %l7 = 000000002d00f557
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000abc494ff
!	Mem[0000000010141438] = 1b3e7604, %l4 = ffffffffffffff88
	swap	[%i5+0x038],%l4		! %l4 = 000000001b3e7604
!	%l7 = 00000000abc494ff, Mem[000000001010143c] = 0000c977
	stb	%l7,[%i4+0x03c]		! Mem[000000001010143c] = ff00c977
!	%l6 = 000000000000006d, Mem[0000000030041400] = ffffff88
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000006d
!	%l7 = 00000000abc494ff, Mem[0000000010181410] = 00000045
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 94ff0045
!	%f0  = 0b72424d 88c15eff f5572383 c61e3420
!	%f4  = 00138f25 00000000 ff94c4ab 00000075
!	%f8  = 88c15eff ff000000 1b3e7604 fb9d4804
!	%f12 = 03cbcdf2 93842e87 ad01c571 26c585c6
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f20 = 832357ff 5597e666, Mem[0000000030001410] = 00000000 d941fd77
	stda	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = 832357ff 5597e666
!	Mem[0000000030041408] = 57f50000, %l3 = 0000000003cbcdf2
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000057f50000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffe46e2f00002d3e, %l4 = 000000001b3e7604
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = ffe46e2f00002d3e

p0_label_63:
!	Mem[0000000010081410] = 88c15effff000000, %f28 = 41ecb9e0 9109f485
	ldda	[%i2+%o5]0x80,%f28	! %f28 = 88c15eff ff000000
!	Mem[00000000201c0000] = 00fff5e1, %l2 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030141400] = 4d42720b, %l7 = 00000000abc494ff
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000720b
!	Mem[0000000030001408] = 8204c21cc685c526, %f24 = 7fff4d63 5fb65974
	ldda	[%i0+%o4]0x89,%f24	! %f24 = 8204c21c c685c526
!	Mem[0000000010041438] = 4015586f, %l0 = 0000000000004500
	lduba	[%i1+0x038]%asi,%l0	! %l0 = 0000000000000040
!	Mem[0000000010041408] = 00000000, %l1 = ff0000000000000d
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ffe46e2f00002d3e, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ffe46e2f00002d3e
!	Mem[00000000300c1408] = 00000000, %f16 = ffce19b3
	lda	[%i3+%o4]0x89,%f16	! %f16 = 00000000
!	Mem[0000000030181400] = 7f0000ff, %l3 = 0000000057f50000
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 000000007f0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 88c15eff, %l2 = ffe46e2f00002d3e
	swap	[%i2+%o5],%l2		! %l2 = 0000000088c15eff

p0_label_64:
!	Mem[0000000030001408] = c685c526, %l6 = 000000000000006d
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000026000000ff
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000026
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l5 = ff0000000000002d, Mem[000000001018142b] = edffff00, %asi = 80
	stba	%l5,[%i6+0x02b]%asi	! Mem[0000000010181428] = edffff2d
!	%l6 = 00000000, %l7 = 0000720b, Mem[00000000100c1410] = 8386350b 44000000
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 0000720b
!	%l4 = ffe46e2f00002d3e, Mem[0000000010181400] = 4419ce2a
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00002d3e
!	%f22 = b7fb00db 1a1368fc, Mem[0000000030081408] = ff94c4ab 00000075
	stda	%f22,[%i2+%o4]0x81	! Mem[0000000030081408] = b7fb00db 1a1368fc
!	%f24 = 8204c21c c685c526, Mem[0000000030181410] = f71dd144 71a336f1
	stda	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 8204c21c c685c526
!	%l0 = 00000040, %l1 = 00000000, Mem[00000000300c1410] = c9c2f66d a82fc6be
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000040 00000000
!	%f12 = 03cbcdf2 93842e87, %l4 = ffe46e2f00002d3e
!	Mem[00000000100c1410] = 000000000000720b
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_PL ! Mem[00000000100c1410] = 00000000f2cdcb03
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 5f00b65f, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 000000005f00b65f

p0_label_65:
!	Mem[0000000010041410] = ff5ec188, %l7 = 000000000000720b
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 4500ff94, %l3 = 000000007f0000ff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffff94
!	Mem[0000000030141408] = 832357f5, %l5 = ff0000000000002d
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 00000000832357f5
!	Mem[0000000030041410] = 995e8600, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffff8600
!	Mem[0000000010101408] = a4c8aff50000006d, %l6 = ffffffffffff8600
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = a4c8aff50000006d
!	Mem[0000000010041410] = 88c15eff, %l7 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000005eff
!	Mem[00000000300c1408] = 2600000028000000, %l6 = a4c8aff50000006d
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 2600000028000000
!	Mem[0000000030101408] = 00000013, %l6 = 2600000028000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 5f4f79adb319ceff, %l7 = 0000000000005eff
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 5f4f79adb319ceff
!	Starting 10 instruction Store Burst
!	%f0  = 0b72424d 88c15eff f5572383 c61e3420
!	%f4  = 00138f25 00000000 ff94c4ab 00000075
!	%f8  = 88c15eff ff000000 1b3e7604 fb9d4804
!	%f12 = 03cbcdf2 93842e87 ad01c571 26c585c6
	stda	%f0,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400

p0_label_66:
!	Mem[0000000020800000] = 00ffe181, %l0 = 0000000000000040
	ldstub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001400] = c9c2f6ff, %l1 = 000000005f00b65f
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 00000000c9c2f6ff
!	%l2 = 0000000088c15eff, Mem[0000000030001400] = f5afc845
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 88c15eff
!	%f16 = 00000000 ad794f5f, Mem[0000000030181400] = 7f0000ff 46268462
	stda	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 ad794f5f
!	%f29 = ff000000, Mem[0000000010001410] = 258f22bd
	sta	%f29,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000
!	%l1 = 00000000c9c2f6ff, Mem[00000000100c1408] = 5fb6005f
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = f6ff005f
!	%l7 = 5f4f79adb319ceff, Mem[0000000010141408] = c61e3420
	stba	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = c61e34ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010141400] = 88c15eff, %l3 = ffffffffffffff94
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010101410] = f2cdcb03
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 5f00b65f, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 000000005f00b65f

p0_label_67:
!	Mem[0000000030101400] = ff572383, %l0 = 000000005f00b65f
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000ff57
!	Mem[0000000010141410] = 00000000, %l5 = 00000000832357f5
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00138f2500000000, %f22 = b7fb00db 1a1368fc
	ldda	[%i5+%o5]0x88,%f22	! %f22 = 00138f25 00000000
!	Mem[0000000010181400] = 00002d3e, %l6 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffe46e2f, %l7 = 5f4f79adb319ceff
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = 45000000, %l3 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000045
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000045
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 44192383, %l0 = 000000000000ff57
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 0000000044192383
!	Mem[0000000010141400] = 88c15eff, %l7 = ffffffffffffffff
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 0000000088c15eff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000c9c2f6ff, %l1 = 00000000c9c2f6ff, %l0 = 0000000044192383
	sdivx	%l1,%l1,%l0		! %l0 = 0000000000000001

p0_label_68:
!	%l3 = 0000000000000000, Mem[0000000030041408] = f2cdcb03
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = f2cdcb00
!	%l7 = 0000000088c15eff, Mem[00000000300c1410] = 40000000
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 40005eff
!	Mem[0000000010041410] = ff5ec188, %l4 = ffe46e2f00002d3e
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000c9c2f6ff, Mem[0000000010181408] = 6df6c2c9625702e7
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000c9c2f6ff
!	%l1 = 00000000c9c2f6ff, Mem[0000000010041408] = 00000000
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = c9c2f6ff
!	%l6 = 0000000000000000, Mem[0000000010081408] = 5f00b65f
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f4  = 00138f25 00000000, Mem[00000000100c1408] = f6ff005f d609744c
	stda	%f4 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00138f25 00000000
!	Mem[0000000010001434] = 67476ccf, %l6 = 0000000000000000
	ldstuba	[%i0+0x034]%asi,%l6	! %l6 = 00000067000000ff
!	%l4 = 00000000000000ff, immd = fffffffffffffe3e, %l7  = 0000000088c15eff
	mulx	%l4,-0x1c2,%l7		! %l7 = fffffffffffe3fc2
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 41ecb9e09109f485, %l5 = 0000000000000000
	ldxa	[%i1+0x030]%asi,%l5	! %l5 = 41ecb9e09109f485

p0_label_69:
!	Mem[0000000010181400] = 00002d3e, %l1 = 00000000c9c2f6ff
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000001
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800140] = f6ff3528, %l0 = 0000000000000000
	lduba	[%o3+0x141]%asi,%l0	! %l0 = 00000000000000ff
!	%f16 = 00000000, %f0  = 0b72424d
	fcmpes	%fcc2,%f16,%f0 		! %fcc2 = 1
!	Mem[0000000010181410] = 94ff0045, %l7 = fffffffffffe3fc2
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 0000000094ff0045
!	Mem[0000000030101400] = 832357ff, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081408] = 0b72424d 00000000, %l6 = 00000067, %l7 = 94ff0045
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000 000000000b72424d
!	%l5 = 41ecb9e09109f485, %l3 = 0000000000000000, %y  = 0000008f
	smul	%l5,%l3,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000021800140] = f6ff3528, %l5 = 41ecb9e09109f485
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 000000000000f6ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 4d42720b, %l5 = 000000000000f6ff
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 000000004d42720b

p0_label_70:
!	%f22 = 00138f25 00000000, Mem[0000000010001410] = 000000ff 00000000
	stda	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = 00138f25 00000000
!	%l2 = 0000000000000000, Mem[0000000010041400] = 5f4f79adb319ceff
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l1 = ffffffffffffffff, Mem[0000000030081400] = 2d00f557
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ff00f557
!	%l4 = 000000ff, %l5 = 4d42720b, Mem[0000000010141410] = 00000000 00138f25
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 4d42720b
!	%l4 = 000000ff, %l5 = 4d42720b, Mem[00000000100c1410] = 00000000 f2cdcb03
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff 4d42720b
!	%l2 = 0000000000000000, Mem[0000000030141408] = f5572383
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00002383
!	%l1 = ffffffffffffffff, Mem[0000000010041410] = 88c15eff
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 88c1ffff
!	%l0 = 00000000000000ff, Mem[0000000030181410] = c685c526
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 00fff5e1
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00fff5e1
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000045, %l7 = 000000000b72424d
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000045

p0_label_71:
!	Mem[0000000030101410] = 7fffffffa4c8aff5, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 7fffffffa4c8aff5
!	Mem[00000000100c140c] = 00000000, %l5 = 000000004d42720b
	ldswa	[%i3+0x00c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00fff5e1, %l4 = 7fffffffa4c8aff5
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 0000006d, %f29 = ff000000
	lda	[%i4+%o4]0x88,%f29	! %f29 = 0000006d
!	Mem[0000000030081408] = b7fb00db, %f1  = 88c15eff
	lda	[%i2+%o4]0x81,%f1 	! %f1 = b7fb00db
!	Mem[0000000020800040] = ffab7fe3, %l5 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffab
!	Mem[0000000010081410] = 00002d3eff000000, %f10 = 1b3e7604 fb9d4804
	ldda	[%i2+%o5]0x80,%f10	! %f10 = 00002d3e ff000000
!	Mem[000000001004140c] = 0000009f, %l3 = 0000000000000000
	ldsha	[%i1+0x00c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101434] = 0476ff1b, %l7 = 0000000000000045
	ldub	[%i4+0x034],%l7		! %l7 = 0000000000000004
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffab, Mem[0000000010081400] = 45000000d941fd77
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffffffffffab

p0_label_72:
!	Mem[0000000010001400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = b7fb00db, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000b7fb00db
!	Mem[0000000010001400] = 000000ff, %l6 = 00000000b7fb00db
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l4 = 00000000, %l5 = ffffffab, Mem[0000000030141408] = 83230000 20341ec6
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 ffffffab
!	Mem[00000000100c1420] = ad94a970, %l6 = 00000000000000ff
	ldstub	[%i3+0x020],%l6		! %l6 = 000000ad000000ff
!	Mem[000000001018143c] = 0000ffed, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l1	! %l1 = 000000000000ffed
!	Mem[000000001010142c] = cc00c9c8, %l0 = 00000000000000ff
	ldstuba	[%i4+0x02c]%asi,%l0	! %l0 = 000000cc000000ff
!	%f22 = 00138f25, Mem[0000000030101408] = 13000000
	sta	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = 00138f25
!	Mem[0000000010101400] = 45ed82e1, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000045ed82e1
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00138f25, %l5 = ffffffffffffffab
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000025

p0_label_73:
!	Mem[0000000030041408] = 00cbcdf2, %f4  = 00138f25
	lda	[%i1+%o4]0x81,%f4 	! %f4 = 00cbcdf2
!	Mem[00000000201c0000] = 00fff5e1, %l2 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041418] = b7fb00db, %f5  = 00000000
	ld	[%i1+0x018],%f5 	! %f5 = b7fb00db
!	%f21 = 5597e666, %f15 = 26c585c6, %f24 = 8204c21c
	fdivs	%f21,%f15,%f24		! %f24 = 6e44dee5
!	%l7 = 0000000000000004, %l7 = 0000000000000004, %y  = 00000000
	sdiv	%l7,%l7,%l4		! %l4 = 0000000000000001
	mov	%l0,%y			! %y = 000000cc
!	Mem[0000000030181400] = 5f4f79ad, %l4 = 0000000000000001
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 000000000000005f
!	Mem[0000000010141400] = 88c15eff, %l0 = 00000000000000cc
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 0000000088c15eff
!	Mem[000000001018140c] = c9c2f6ff, %l6 = 00000000000000ad
	lduha	[%i6+0x00c]%asi,%l6	! %l6 = 000000000000c9c2
!	Mem[000000001000142c] = 38d0cbec, %l2 = 0000000000000000
	ldsb	[%i0+0x02e],%l2		! %l2 = ffffffffffffffcb
!	Starting 10 instruction Store Burst
!	%f10 = 00002d3e ff000000, %l6 = 000000000000c9c2
!	Mem[00000000300c1400] = ffe46e2f00002d3e
	stda	%f10,[%i3+%l6]ASI_PST32_S ! Mem[00000000300c1400] = 00002d3e00002d3e

p0_label_74:
!	Mem[00000000100c1433] = 9ff82241, %l4 = 000000000000005f
	ldstuba	[%i3+0x033]%asi,%l4	! %l4 = 00000041000000ff
!	%f11 = ff000000, Mem[0000000010001408] = 44192383
	sta	%f11,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Mem[0000000010101430] = 04489dfb0476ff1b, %l0 = 0000000088c15eff, %l1 = 000000000000ffed
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 04489dfb0476ff1b
!	%l7 = 0000000000000004, Mem[0000000030001408] = ffc585c6
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 000485c6
!	%l6 = 000000000000c9c2, immd = 0000000000000146, %l7  = 0000000000000004
	mulx	%l6,0x146,%l7		! %l7 = 000000000100ed0c
!	Mem[0000000020800041] = ffab7fe3, %l7 = 000000000100ed0c
	ldstub	[%o1+0x041],%l7		! %l7 = 000000ab000000ff
!	%l6 = 000000000000c9c2, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000c9c2
!	Mem[0000000030141408] = 00000000, %l6 = 000000000000c9c2
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l1 = 04489dfb0476ff1b
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff7fe3, %l6 = 0000000000000000
	ldsb	[%o1+0x041],%l6		! %l6 = ffffffffffffffff

p0_label_75:
!	Mem[0000000010001408] = ff000000 c61e3420, %l4 = 00000041, %l5 = 00000025
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000 00000000c61e3420
!	Mem[0000000030081408] = 00000000, %l4 = 00000000ff000000
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f26 = 42a7327b
	lda	[%i2+0x008]%asi,%f26	! %f26 = 00000000
!	Mem[0000000030001410] = 832357ff5597e666, %l5 = 00000000c61e3420
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = 832357ff5597e666
!	Mem[0000000030141410] = 00000000258f1300, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 00000000258f1300
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000088c15eff
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041420] = 7fff4d635fb65974, %l7 = 00000000000000ab
	ldx	[%i1+0x020],%l7		! %l7 = 7fff4d635fb65974
!	%l0 = 00000000000000ff, %l2 = ffffffffffffffcb, %l6 = ffffffffffffffff
	andn	%l0,%l2,%l6		! %l6 = 0000000000000034
!	Starting 10 instruction Store Burst
!	%l4 = 00000000258f1300, Mem[0000000010041410] = 88c1ffff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 88c11300

p0_label_76:
!	%l2 = ffffffffffffffcb, Mem[0000000030081400] = ff00f557
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = cb00f557
!	%l4 = 00000000258f1300, Mem[0000000010141410] = 000000ff
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 258f1300
!	Mem[0000000030101410] = 7fffffff, %l3 = 0000000045ed82e1
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 0000007f000000ff
!	Mem[0000000030081410] = 00002ded, %l6 = 0000000000000034
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000002ded
!	%l6 = 0000000000002ded, Mem[0000000010101400] = 0000000018f90d75
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000002ded
!	%f8  = 88c15eff ff000000, Mem[00000000300c1408] = 00000026 00000028
	stda	%f8 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 88c15eff ff000000
!	Mem[00000000201c0000] = 00fff5e1, %l4 = 00000000258f1300
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	%f6  = ff94c4ab 00000075, %l4 = 0000000000000000
!	Mem[0000000010001408] = ff000000c61e3420
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_P ! Mem[0000000010001408] = ff000000c61e3420
!	%l5 = 832357ff5597e666, Mem[0000000030001400] = ff5ec188
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 665ec188
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00002d3e ff000000, %l6 = 00002ded, %l7 = 5fb65974
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 0000000000002d3e 00000000ff000000

p0_label_77:
!	Mem[0000000010081410] = 00002d3e, %l0 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %f19 = 0000009f
	lda	[%i3+%o4]0x89,%f19	! %f19 = ff000000
!	Mem[0000000030101408] = 258f1300, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000025
!	Mem[0000000030101410] = ffffffff, %l5 = 832357ff5597e666
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = 3e2d0000, %f31 = 28000000
	lda	[%i2+%o5]0x88,%f31	! %f31 = 3e2d0000
!	Mem[0000000010141400] = ff5ec188 4d42720b, %l6 = 00002d3e, %l7 = ff000000
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff5ec188 000000004d42720b
!	Mem[0000000030141400] = 0000f6ff, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l0	! %l0 = 000000000000f6ff
!	Mem[00000000300c1408] = ff000000, %l7 = 000000004d42720b
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010101400] = 00000000 00002ded, %l2 = ffffffcb, %l3 = 0000007f
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000000002ded
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffffffff, %l6 = 00000000ff5ec188
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 000000ff000000ff

p0_label_78:
!	%f12 = 03cbcdf2 93842e87, Mem[0000000010001408] = ff000000 c61e3420
	stda	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = 03cbcdf2 93842e87
!	Mem[0000000030041408] = 00cbcdf2, %l7 = ffffffffff000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000cbcdf2
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000cbcdf2
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l0 = 000000000000f6ff, Mem[0000000010101400] = 00000000
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000f6ff
!	Mem[0000000030041408] = 000000ff, %l5 = ffffffffffffffff
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101418] = 00000000, %l4 = 0000000000000000
	swap	[%i4+0x018],%l4		! %l4 = 0000000000000000
!	%f0  = 0b72424d b7fb00db f5572383 c61e3420
!	%f4  = 00cbcdf2 b7fb00db ff94c4ab 00000075
!	%f8  = 88c15eff ff000000 00002d3e ff000000
!	%f12 = 03cbcdf2 93842e87 ad01c571 26c585c6
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l4 = 0000000000000000, Mem[0000000010081437] = 15026e8c
	stb	%l4,[%i2+0x037]		! Mem[0000000010081434] = 15026e00
!	%f16 = 00000000 ad794f5f 00000000 ff000000
!	%f20 = 832357ff 5597e666 00138f25 00000000
!	%f24 = 6e44dee5 c685c526 00000000 3af4027e
!	%f28 = 88c15eff 0000006d 4015586f 3e2d0000
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010141400] = 88c15eff, %l5 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 0000000088c15eff

p0_label_79:
!	Mem[0000000030141410] = 66e69755, %f27 = 3af4027e
	lda	[%i5+%o5]0x81,%f27	! %f27 = 66e69755
!	Mem[0000000030101400] = 4d42720b, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 000000000000720b
!	Mem[0000000010041408] = c9c2f6ff, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000c9
!	Mem[0000000030101410] = db00fbb7 f2cdcb00, %l4 = 0000720b, %l5 = 88c15eff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000f2cdcb00 00000000db00fbb7
!	Mem[0000000030001408] = c6850400, %l6 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = ffffffffc6850400
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 000000000000f6ff
	setx	0xf287292038b16c45,%g7,%l0 ! %l0 = f287292038b16c45
!	%l1 = 0000000000000025
	setx	0x8797f0682b505e68,%g7,%l1 ! %l1 = 8797f0682b505e68
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f287292038b16c45
	setx	0x5da8dcd04bdccc09,%g7,%l0 ! %l0 = 5da8dcd04bdccc09
!	%l1 = 8797f0682b505e68
	setx	0x0dc569483aadf714,%g7,%l1 ! %l1 = 0dc569483aadf714
!	Mem[0000000010041400] = 0000c9c2, %l5 = 00000000db00fbb7
	lduha	[%i1+0x002]%asi,%l5	! %l5 = 000000000000c9c2
!	Mem[00000000100c1410] = 000000ff, %l7 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ff5ec188, %l4 = 00000000f2cdcb00
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000ff5e
!	Starting 10 instruction Store Burst
!	%l4 = 0000ff5e, %l5 = 0000c9c2, Mem[0000000030101408] = f5572383 c61e3420
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff5e 0000c9c2

p0_label_80:
!	%l2 = 00000000000000c9, Mem[0000000030101410] = db00fbb7f2cdcb00
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000c9
!	Mem[0000000010081410] = 3e2d0000, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 4d42720b, %l2 = 00000000000000c9
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 000000004d42720b
!	Mem[0000000030101400] = 000000c9, %l0 = 5da8dcd04bdccc09
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000c9000000ff
!	Mem[00000000211c0001] = 88ff6ca5, %l0 = 00000000000000c9
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1410] = ff5e0040
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000040
!	Mem[0000000030101408] = 5eff0000, %l5 = 000000000000c9c2
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f15 = 26c585c6, Mem[0000000010041400] = 0000c9c2
	sta	%f15,[%i1+%g0]0x80	! Mem[0000000010041400] = 26c585c6
!	%l7 = 0000000000000000, Mem[000000001010143e] = ff00c977, %asi = 80
	stha	%l7,[%i4+0x03e]%asi	! Mem[000000001010143c] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 5f4f79ad, %l2 = 000000004d42720b
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 000000000000005f

p0_label_81:
!	Mem[0000000030081408] = 000000ff, %l2 = 000000000000005f
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 00000034, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000034
!	Mem[0000000010081410] = ff002d3e, %l2 = 00000000000000ff
	ldsb	[%i2+0x012],%l2		! %l2 = 000000000000002d
!	Mem[0000000030041408] = ffffffff, %l1 = 0dc569483aadf714
	ldsha	[%i1+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001410] = 832357ff 5597e666, %l4 = 0000ff5e, %l5 = 00000034
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000832357ff 000000005597e666
!	Mem[0000000010081410] = 000000ff3e2d00ff, %l2 = 000000000000002d
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 000000ff3e2d00ff
!	Mem[0000000030081408] = ff0000001a1368fc, %f6  = ff94c4ab 00000075
	ldda	[%i2+%o4]0x81,%f6 	! %f6  = ff000000 1a1368fc
!	Mem[0000000010041410] = 0b72424d88c11300, %f6  = ff000000 1a1368fc
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = 0b72424d 88c11300
!	Mem[0000000030001410] = 832357ff5597e666, %f2  = f5572383 c61e3420
	ldda	[%i0+%o5]0x81,%f2 	! %f2  = 832357ff 5597e666
!	Starting 10 instruction Store Burst
!	%f22 = 00138f25, Mem[0000000010041410] = 0013c188
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 00138f25

p0_label_82:
!	%l5 = 000000005597e666, immed = fffff6dc, %y  = 000000cc
	sdiv	%l5,-0x924,%l1		! %l1 = ffffffffe9a53db7
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010041434] = 9109f485, %l7 = 0000000000000000
	swap	[%i1+0x034],%l7		! %l7 = 000000009109f485
!	Mem[00000000211c0000] = 88ff6ca5, %l2 = 000000ff3e2d00ff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 00000088000000ff
!	%f6  = 0b72424d 88c11300, %l4 = 00000000832357ff
!	Mem[0000000010041400] = 26c585c600000000
	stda	%f6,[%i1+%l4]ASI_PST8_PL ! Mem[0000000010041400] = 0013c1884d42720b
!	Mem[0000000010101400] = fff60000, %l2 = 0000000000000088
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000fff60000
!	%f18 = 00000000, Mem[0000000010081404] = ffffffab
	st	%f18,[%i2+0x004]	! Mem[0000000010081404] = 00000000
!	Mem[00000000211c0000] = ffff6ca5, %l6 = ffffffffc6850400
	ldstub	[%o2+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010181410] = 94ff0045, %l4 = 00000000832357ff
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000094000000ff
!	Mem[0000000010081408] = 00000000, %l5 = 000000005597e666
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 00000062, %f31 = 3e2d0000
	lda	[%i4+0x01c]%asi,%f31	! %f31 = 00000062

p0_label_83:
!	Mem[0000000010081408] = 0b72424d000000ff, %l2 = 00000000fff60000
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = 0b72424d000000ff
!	Mem[00000000300c1400] = 00002d3e 00002d3e, %l2 = 000000ff, %l3 = 00002ded
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 0000000000002d3e 0000000000002d3e
!	Mem[0000000010041410] = 258f1300, %l0 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 00000000258f1300
!	Mem[0000000030101410] = c9000000 00000000, %l2 = 00002d3e, %l3 = 00002d3e
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000c9000000 0000000000000000
!	Mem[0000000010041400] = 0013c188 4d42720b, %l4 = 00000094, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000000013c188 000000004d42720b
!	Mem[00000000100c1438] = bb2d5a5e, %l0 = 00000000258f1300
	ldsw	[%i3+0x038],%l0		! %l0 = ffffffffbb2d5a5e
!	Mem[0000000030081400] = cb00f5571cc20482, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = cb00f5571cc20482
!	Mem[0000000010181400] = 3e2d0000, %l4 = 000000000013c188
	ldswa	[%i6+%g0]0x88,%l4	! %l4 = 000000003e2d0000
!	Mem[0000000030141408] = 000000ff, %f14 = ad01c571
	lda	[%i5+%o4]0x81,%f14	! %f14 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 665ec188, %l1 = ffffffffe9a53db7
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000066000000ff

p0_label_84:
!	Mem[0000000010141410] = 00138f25, %l1 = 0000000000000066
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000138f25
!	%f6  = 0b72424d, Mem[0000000030081400] = 57f500cb
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 0b72424d
!	Mem[0000000030041408] = ffffffff, %l1 = 0000000000138f25
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l2 = c9000000, %l3 = 00000000, Mem[0000000010041430] = 41ecb9e0 00000000
	stda	%l2,[%i1+0x030]%asi	! Mem[0000000010041430] = c9000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010081410] = ff002d3e
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000030001400] = ff5ec188, %l7 = 000000009109f485
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l0 = ffffffffbb2d5a5e, Mem[00000000201c0001] = fffff5e1, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff5ef5e1
!	Mem[000000001010143d] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i4+0x03d]%asi,%l1	! %l1 = 00000000000000ff
!	%l6 = 1cc20482, %l7 = 000000ff, Mem[0000000030041410] = 995e8600 76b69b9d
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 1cc20482 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000000040000000, %f14 = 000000ff 26c585c6
	ldda	[%i3+%o5]0x89,%f14	! %f14 = 00000000 40000000

p0_label_85:
!	Mem[0000000010001410] = 00138f25 00000000, %l0 = bb2d5a5e, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000138f25 0000000000000000
!	Mem[0000000010041410] = 0b72424d258f1300, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = 0b72424d258f1300
!	Mem[00000000100c1404] = 0000002d, %l0 = 0000000000138f25
	lduha	[%i3+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l6 = cb00f5571cc20482
	lduha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 000000ff, %l2 = 00000000c9000000
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 000485c6, %l4 = 000000003e2d0000
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 00000000000485c6
!	Mem[000000001000142c] = 38d0cbec, %l4 = 00000000000485c6
	ldsb	[%i0+0x02d],%l4		! %l4 = ffffffffffffffd0
!	Mem[0000000010041408] = c9c2f6ff, %l4 = ffffffffffffffd0
	ldsba	[%i1+0x009]%asi,%l4	! %l4 = ffffffffffffffc2
!	Mem[0000000010181418] = 03cbcdf2, %l5 = 000000004d42720b
	ldsh	[%i6+0x018],%l5		! %l5 = 00000000000003cb
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041408] = fff6c2c9
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = fff600ff

p0_label_86:
!	%l3 = 0b72424d258f1300, Mem[0000000010141410] = 258f1300
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 258f1300
!	%f30 = 4015586f 00000062, Mem[0000000010141400] = ff5ec188 4d42720b
	stda	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 4015586f 00000062
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0x60ba19d83a8877e0,%g7,%l0 ! %l0 = 60ba19d83a8877e0
!	%l1 = 0000000000000000
	setx	0xaa8d73bfd84db554,%g7,%l1 ! %l1 = aa8d73bfd84db554
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 60ba19d83a8877e0
	setx	0x656ab4283e56dd0c,%g7,%l0 ! %l0 = 656ab4283e56dd0c
!	%l1 = aa8d73bfd84db554
	setx	0x90a595382dbc6ce4,%g7,%l1 ! %l1 = 90a595382dbc6ce4
!	%f0  = 0b72424d b7fb00db, Mem[00000000100c1420] = ff94a970 00002a8c
	stda	%f0 ,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0b72424d b7fb00db
!	%f20 = 832357ff 5597e666, %l7 = 00000000000000ff
!	Mem[0000000010101428] = c8cebeccff00c9c8
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101428] = 66e69755ff572383
!	%l4 = ffffffffffffffc2, Mem[0000000010141410] = 00138f250b72424d
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffffffffc2
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 00138f25
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	Mem[00000000218001c1] = c3ff86d6, %l5 = 00000000000003cb
	ldstuba	[%o3+0x1c1]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041408] = ff00f6ff, %l1 = 90a595382dbc6ce4
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ed2d0000 3e2d0000, %l2 = 000000ff, %l3 = 258f1300
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 000000003e2d0000 00000000ed2d0000

p0_label_87:
!	Mem[0000000010041400] = 88c11300, %l6 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000001300
!	Mem[0000000010141410] = ffffffff ffffffc2, %l0 = 3e56dd0c, %l1 = 000000ff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffffff 00000000ffffffc2
!	Mem[0000000030141410] = 832357ff 5597e666, %l6 = 00001300, %l7 = 000000ff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 000000005597e666 00000000832357ff
!	Mem[0000000010141410] = ffffffff, %l6 = 000000005597e666
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = c61e34ff, %l7 = 00000000832357ff
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 6d000000 f5afc8a4, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 000000006d000000 00000000f5afc8a4
!	Mem[0000000030101400] = 000000ff, %l0 = 00000000ffffffff
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ff5ef5e1, %l1 = 00000000ffffffc2
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffff5e
!	Mem[0000000030041400] = 6d000000 ff94c4ab, %l4 = ffffffc2, %l5 = 000000ff
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 000000006d000000 00000000ff94c4ab
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff5e, Mem[0000000030041408] = ffffffff
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 5effffff

p0_label_88:
!	%f16 = 00000000 ad794f5f, Mem[0000000010041418] = b7fb00db 1a1368fc
	stda	%f16,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 ad794f5f
!	%l3 = 00000000ed2d0000, %l3 = 00000000ed2d0000, %l2 = 000000003e2d0000
	add	%l3,%l3,%l2		! %l2 = 00000001da5a0000
!	%l4 = 000000006d000000, Mem[0000000010041420] = 7fff4d63
	sth	%l4,[%i1+0x020]		! Mem[0000000010041420] = 00004d63
!	Mem[0000000030181408] = 00000000, %l6 = 000000006d000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f14 = 00000000 40000000, Mem[0000000030041410] = 8204c21c ff000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 40000000
!	%f8  = 88c15eff, %f4  = 00cbcdf2
	fcmpes	%fcc3,%f8 ,%f4 		! %fcc3 = 1
!	%f2  = 832357ff 5597e666, Mem[0000000010141428] = 04489dfb 04763e1b
	stda	%f2 ,[%i5+0x028]%asi	! Mem[0000000010141428] = 832357ff 5597e666
!	Mem[00000000100c1408] = 258f1300, %l2 = 00000001da5a0000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000258f1300
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 00000000000000ff
	setx	0xf875abb7e4d5759b,%g7,%l0 ! %l0 = f875abb7e4d5759b
!	%l1 = ffffffffffffff5e
	setx	0x3fb61bb04e692516,%g7,%l1 ! %l1 = 3fb61bb04e692516
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f875abb7e4d5759b
	setx	0xf279425fe070a0a8,%g7,%l0 ! %l0 = f279425fe070a0a8
!	%l1 = 3fb61bb04e692516
	setx	0x208fc13850110d98,%g7,%l1 ! %l1 = 208fc13850110d98
!	Starting 10 instruction Load Burst
!	Mem[000000001018143c] = ffffffff, %l4 = 000000006d000000
	ldub	[%i6+0x03c],%l4		! %l4 = 00000000000000ff

p0_label_89:
!	Mem[0000000010181408] = 00000000, %l3 = 00000000ed2d0000
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = ffff0045, %f4  = 00cbcdf2
	ld	[%i6+%o5],%f4 	! %f4 = ffff0045
!	%l6 = 0000000000000000, imm = fffffffffffffd01, %l6 = 0000000000000000
	subc	%l6,-0x2ff,%l6		! %l6 = 00000000000002ff
!	Mem[0000000010081414] = ff000000, %l7 = 00000000f5afc8a4
	ldsha	[%i2+0x014]%asi,%l7	! %l7 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 88000000 00002ded 6d000000 f5afc8a4
!	Mem[0000000010101410] = 00000000 5597e65f 00000000 00000062
!	Mem[0000000010101420] = 00000000 000000ff 66e69755 ff572383
!	Mem[0000000010101430] = 04489dfb 0476ff1b 0000c5c8 ffff0000
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030081400] = 4d42720b, %l5 = 00000000ff94c4ab
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 0000000000004d42
!	Mem[0000000030141400] = 00000000 ad794f5f, %l6 = 000002ff, %l7 = ffffff00
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000ad794f5f 0000000000000000
!	Mem[00000000211c0000] = ffff6ca5, %l1 = 208fc13850110d98
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181434] = c61e3420, %l6 = 00000000ad794f5f
	ldsb	[%i6+0x034],%l6		! %l6 = ffffffffffffffc6
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = f2cdcb03, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 00000003000000ff

p0_label_90:
!	Mem[0000000030181408] = 6d000000, %l2 = 00000000258f1300
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 000000006d000000
!	%f8  = 88c15eff, %f8  = 88c15eff, %f6  = 0b72424d
	fdivs	%f8 ,%f8 ,%f6 		! %f6  = 3f800000
!	%f4  = ffff0045, Mem[0000000010001420] = 6df6c2c9
	sta	%f4 ,[%i0+0x020]%asi	! Mem[0000000010001420] = ffff0045
!	%l2 = 000000006d000000, Mem[000000001008141a] = f8a2380a, %asi = 80
	stba	%l2,[%i2+0x01a]%asi	! Mem[0000000010081418] = f8a2000a
!	%f9  = ff000000, Mem[0000000030001400] = 88c15eff
	sta	%f9 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000
!	%l1 = ffffffffffffffff, Mem[0000000030041408] = 5effffff
	stwa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000010101400] = 00000088, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000088000000ff
!	%l0 = f279425fe070a0a8, Mem[0000000030181408] = 258f1300
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = e070a0a8
!	%f10 = 00002d3e ff000000, Mem[00000000300c1410] = 40000000 00000000
	stda	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00002d3e ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000006d, %f3  = 5597e666
	lda	[%i1+%g0]0x89,%f3 	! %f3 = 0000006d

p0_label_91:
!	Mem[0000000030001400] = 000000ffd609744c, %f8  = 88c15eff ff000000
	ldda	[%i0+%g0]0x81,%f8 	! %f8  = 000000ff d609744c
!	Mem[000000001010143c] = ffff0000, %l5 = 0000000000004d42
	lduh	[%i4+0x03c],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010041410] = 000000ff, %l0 = f279425fe070a0a8
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1416] = 4d42720b, %l5 = 000000000000ffff
	ldstub	[%i3+0x016],%l5		! %l5 = 00000072000000ff
!	Mem[0000000010181408] = fff6c2c900000000, %f12 = 03cbcdf2 93842e87
	ldda	[%i6+%o4]0x88,%f12	! %f12 = fff6c2c9 00000000
!	Mem[0000000010081410] = 00000000 ff000000, %l4 = 00000000, %l5 = 00000072
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000ff000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[00000000100c1400] = ff000000 0000002d 00005ada 00000000
!	Mem[00000000100c1410] = 000000ff 4d42ff0b 18f90d75 8b53f310
!	Mem[00000000100c1420] = 0b72424d b7fb00db e627c24b e07136b4
!	Mem[00000000100c1430] = 9ff822ff 8f4ccaf8 bb2d5a5e 568f4e05
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	%f17 = 00002ded, %f19 = f5afc8a4, %f17 = 00002ded
	fsubs	%f17,%f19,%f17		! %l0 = 0000000000000022, Unfinished, %fsr = 1500000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800080] = d6eb5823, %l2 = 000000006d000000
	ldstub	[%o3+0x080],%l2		! %l2 = 000000d6000000ff

p0_label_92:
!	%f24 = 00000000, %f23 = 00000062
	fcmps	%fcc3,%f24,%f23		! %fcc3 = 1
!	%l1 = ffffffffffffffff, Mem[0000000030081400] = 0b72424d
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	%l7 = 0000000000000088, Mem[0000000010041408] = ff00f6ff0000009f
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000088
!	Mem[0000000010041420] = 00004d63, %l7 = 0000000000000088
	swap	[%i1+0x020],%l7		! %l7 = 0000000000004d63
!	Mem[00000000201c0001] = ff5ef5e1, %l7 = 0000000000004d63
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 0000005e000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 0000000000000022
	setx	0x2e844b37bd74bc90,%g7,%l0 ! %l0 = 2e844b37bd74bc90
!	%l1 = ffffffffffffffff
	setx	0x7a382d285a7f1c1c,%g7,%l1 ! %l1 = 7a382d285a7f1c1c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e844b37bd74bc90
	setx	0x9a2cc8c85aa0799e,%g7,%l0 ! %l0 = 9a2cc8c85aa0799e
!	%l1 = 7a382d285a7f1c1c
	setx	0x8018ed1818e6cb71,%g7,%l1 ! %l1 = 8018ed1818e6cb71
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010101430] = 04489dfb 0476ff1b
	stda	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 ff000000
!	%f31 = ffff0000, %f16 = 88000000
	fcmpes	%fcc3,%f31,%f16		! %fcc3 = 3
!	%l3 = 0000000000000003, %l6 = ffffffffffffffc6, %l1 = 8018ed1818e6cb71
	xnor	%l3,%l6,%l1		! %l1 = 000000000000003a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l6 = ffffffffffffffc6
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff

p0_label_93:
!	Mem[0000000030041400] = 6d000000, %l0 = 9a2cc8c85aa0799e
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000006d00
!	Mem[0000000020800000] = ffffe181, %l5 = 00000000ff000000
	lduba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ffff6ca5, %l1 = 000000000000003a
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030081408] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000211c0000] = ffff6ca5, %l0 = 0000000000006d00
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[00000000300c1400] = 3e2d00003e2d0000, %l6 = ffffffffffffffff
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 3e2d00003e2d0000
!	Mem[0000000010001410] = 00138f25, %l2 = 00000000000000d6
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000138f25
!	Mem[00000000100c1410] = 000000ff 4d42ff0b, %l2 = 00138f25, %l3 = 00000003
	ldda	[%i3+0x010]%asi,%l2	! %l2 = 00000000000000ff 000000004d42ff0b
!	Mem[0000000030081410] = 9afba2d100000034, %f0  = ff000000 0000002d
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = 9afba2d1 00000034
!	Starting 10 instruction Store Burst
!	%l6 = 3e2d00003e2d0000, Mem[00000000201c0000] = fffff5e1, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000f5e1

p0_label_94:
!	Mem[0000000010181400] = 3e2d0000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081410] = 34000000, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000034000000ff
!	Mem[0000000030181400] = ad794f5f, %l0 = 000000000000ffff
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 0000005f000000ff
!	%l0 = 000000000000005f, Mem[0000000030141400] = ad794f5f
	stha	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ad79005f
!	Mem[0000000010181410] = ffff0045, %l5 = 00000000ff000000
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = 0000000000000034, Mem[0000000020800000] = ffffe181, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 0034e181
!	%l0 = 0000005f, %l1 = 0000ffff, Mem[0000000010001400] = ff000000 625702e7
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000005f 0000ffff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010101400] = 000000ff ed2d0000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 000000ff
!	%f19 = f5afc8a4, Mem[0000000010181410] = ffff0045
	sta	%f19,[%i6+%o5]0x80	! Mem[0000000010181410] = f5afc8a4
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000034
	ldsh	[%i4+0x002],%l2		! %l2 = 0000000000000000

p0_label_95:
!	Mem[00000000300c1408] = 000000ff, %l3 = 000000004d42ff0b
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010181400] = ff002d3e 00002ded 00000000 c9c2f6ff
!	Mem[0000000010181410] = f5afc8a4 2f6ee463 03cbcdf2 93842e87
!	Mem[0000000010181420] = dc901277 a4c8aff5 edffff2d ccbecec8
!	Mem[0000000010181430] = f5572383 c61e3420 c8c900cc ffffffff
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101408] = 6d000000, %l1 = 000000000000ffff
	ldsw	[%i4+%o4],%l1		! %l1 = 000000006d000000
!	Mem[0000000030081410] = ff000000, %l1 = 000000006d000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = c9000000, %l3 = 00000000000000ff
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000c9000000
!	Mem[0000000010041400] = 0b72424d 88c11300, %l6 = 3e2d0000, %l7 = 0000005e
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000088c11300 000000000b72424d
!	Mem[0000000010001408] = ffcbcdf2 93842e87, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffcbcdf2 0000000093842e87
!	%l4 = 00000000ffcbcdf2, %l3 = 00000000c9000000, %y  = 000000ff
	udiv	%l4,%l3,%l3		! %l3 = 0000000000000146
	mov	%l0,%y			! %y = 0000005f
!	Mem[0000000010001424] = 625702e7, %l3 = 0000000000000146
	ldsb	[%i0+0x025],%l3		! %l3 = 0000000000000057
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000057, Mem[0000000010001410] = 00000000258f1300
	stxa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000057

p0_label_96:
!	Mem[0000000010181415] = 2f6ee463, %l2 = 0000000000000000
	ldstuba	[%i6+0x015]%asi,%l2	! %l2 = 0000006e000000ff
!	%f13 = 8f4ccaf8, Mem[0000000010081410] = 00000000
	sta	%f13,[%i2+%o5]0x80	! Mem[0000000010081410] = 8f4ccaf8
!	%l1 = 00000000000000ff, Mem[0000000030101408] = c2c900005eff00ff
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010041406] = 4d42720b
	sth	%l1,[%i1+0x006]		! Mem[0000000010041404] = 4d4200ff
!	%f0  = 9afba2d1 00000034, Mem[0000000010001410] = 57000000 00000000
	stda	%f0 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 9afba2d1 00000034
!	%l4 = 00000000ffcbcdf2, Mem[0000000010001400] = ffff00005f000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffcbcdf2
!	%l0 = 0000005f, %l1 = 000000ff, Mem[0000000010141430] = 872e8493 f2cdcb03
	stda	%l0,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000005f 000000ff
!	%l0 = 0000005f, %l1 = 000000ff, Mem[0000000010141410] = ffffffff c2ffffff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000005f 000000ff
!	Mem[000000001010140c] = f5afc8a4, %l3 = 0000000000000057
	swap	[%i4+0x00c],%l3		! %l3 = 00000000f5afc8a4
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l7 = 000000000b72424d
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = ffffffffff000000

p0_label_97:
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 000000000000005f
	setx	0x0bf20537d306eba6,%g7,%l0 ! %l0 = 0bf20537d306eba6
!	%l1 = 00000000000000ff
	setx	0xc268adcfd7b33842,%g7,%l1 ! %l1 = c268adcfd7b33842
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0bf20537d306eba6
	setx	0x85860fd7c5b29634,%g7,%l0 ! %l0 = 85860fd7c5b29634
!	%l1 = c268adcfd7b33842
	setx	0xa1ee782f94284e7c,%g7,%l1 ! %l1 = a1ee782f94284e7c
!	Mem[0000000010101428] = 66e69755ff572383, %f6  = 18f90d75 8b53f310
	ldda	[%i4+0x028]%asi,%f6 	! %f6  = 66e69755 ff572383
!	Mem[00000000211c0000] = ffff6ca5, %l5 = 0000000093842e87
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %l0 = 85860fd7c5b29634
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010181400] = ff002d3e, %f5  = 4d42ff0b
	ld	[%i6+%g0],%f5 	! %f5 = ff002d3e
!	Mem[00000000100c1418] = 18f90d75 8b53f310, %l4 = ffcbcdf2, %l5 = 000000ff
	ldd	[%i3+0x018],%l4		! %l4 = 0000000018f90d75 000000008b53f310
!	Mem[0000000030181408] = 57f50000a8a070e0, %f4  = 000000ff ff002d3e
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 57f50000 a8a070e0
!	Mem[0000000010041410] = ff000000, %f14 = bb2d5a5e
	lda	[%i1+%o5]0x88,%f14	! %f14 = ff000000
!	Mem[0000000030041410] = 00000000, %l3 = 00000000f5afc8a4
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1403] = ff000000, %l1 = a1ee782f94284e7c
	ldstuba	[%i3+0x003]%asi,%l1	! %l1 = 00000000000000ff

p0_label_98:
!	%f23 = 93842e87, Mem[00000000300c1410] = 000000ff
	sta	%f23,[%i3+%o5]0x81	! Mem[00000000300c1410] = 93842e87
!	%f16 = ff002d3e 00002ded 00000000 c9c2f6ff
!	%f20 = f5afc8a4 2f6ee463 03cbcdf2 93842e87
!	%f24 = dc901277 a4c8aff5 edffff2d ccbecec8
!	%f28 = f5572383 c61e3420 c8c900cc ffffffff
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	%f2  = 00005ada, %f5  = a8a070e0, %f9  = b7fb00db
	fdivs	%f2 ,%f5 ,%f9 		! %l0 = 000000000000ff22, Unfinished, %fsr = 3500000000
!	Mem[0000000030001400] = 000000ff, %l5 = 000000008b53f310
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000018f90d75, Mem[0000000030141408] = 00000000ff000000
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000018f90d75
!	%f4  = 57f50000, Mem[0000000010101410] = 00000000
	sta	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 57f50000
!	%l5 = 00000000000000ff, Mem[0000000030101410] = c9000000
	stha	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff0000
!	%l4 = 0000000018f90d75, Mem[0000000010081408] = ff0000004d42720b
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000018f90d75
!	Mem[00000000218000c0] = 5f69d8f4, %l0 = 000000000000ff22
	ldstuba	[%o3+0x0c0]%asi,%l0	! %l0 = 0000005f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ad79005f, %l5 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = 000000000000005f

p0_label_99:
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010181410] = a4c8aff5, %l0 = 000000000000005f
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffa4c8aff5
!	Mem[0000000010141410] = 0000005f, %l0 = ffffffffa4c8aff5
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 000000000000005f
!	Mem[00000000211c0000] = ffff6ca5, %l1 = 0000000000000000
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[000000001000143c] = 26c585c6, %l4 = 0000000018f90d75
	ldsh	[%i0+0x03c],%l4		! %l4 = 00000000000026c5
!	%l2 = 000000000000006e, immed = 00000591, %y  = 0000005f
	umul	%l2,0x591,%l7		! %l7 = 000000000002644e, %y = 00000000
!	Mem[0000000010141400] = 4015586f, %l5 = 000000000000005f
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 000000004015586f
!	Mem[00000000201c0000] = 0000f5e1, %l7 = 000000000002644e
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 832357ff 5597e666, %l6 = 88c11300, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000832357ff 000000005597e666
!	Mem[0000000010181410] = f5afc8a4, %l7 = 000000005597e666
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000f5
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030001400] = 4c7409d610f3538b
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000

p0_label_100:
!	Mem[00000000100c1408] = da5a0000, %l5 = 000000004015586f
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000da5a0000
!	%l6 = 00000000832357ff, Mem[0000000010041410] = ff000000
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 832357ff
!	%l0 = 000000000000005f, Mem[0000000030041400] = 0000006d
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000005f
!	Mem[0000000010141400] = 4015586f, %l6 = 00000000832357ff
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000040000000ff
!	Mem[0000000010081408] = 00000000, %l5 = 00000000da5a0000
	ldstub	[%i2+%o4],%l5		! %l5 = 00000000000000ff
!	%l2 = 000000000000006e, Mem[000000001000142c] = 38d0cbec, %asi = 80
	stba	%l2,[%i0+0x02c]%asi	! Mem[000000001000142c] = 6ed0cbec
!	%l2 = 000000000000006e, Mem[00000000300c1410] = 93842e873e2d0000
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000000000006e
!	%l5 = 0000000000000000, Mem[0000000030181410] = 63e46e2fa4c8aff5
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000030141400] = ad79005f, %l0 = 000000000000005f
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000ad79005f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffcbcdf2, %l1 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000f2

p0_label_101:
!	Mem[0000000030141408] = 00000000 18f90d75, %l4 = 000026c5, %l5 = 00000000
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000018f90d75 0000000000000000
!	Mem[00000000300c1400] = 3e2d0000, %l6 = 0000000000000040
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l2 = 000000000000006e
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ff002d3e 00002ded 00000000 c9c2f6ff
!	Mem[0000000010181410] = f5afc8a4 2fffe463 03cbcdf2 93842e87
!	Mem[0000000010181420] = dc901277 a4c8aff5 edffff2d ccbecec8
!	Mem[0000000010181430] = f5572383 c61e3420 c8c900cc ffffffff
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101408] = 6d000000, %l6 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 000000000000006d
!	Mem[0000000010041410] = ff5723834d42720b, %f12 = 9ff822ff 8f4ccaf8
	ldda	[%i1+%o5]0x80,%f12	! %f12 = ff572383 4d42720b
!	Mem[000000001004140c] = 00000088, %l5 = 0000000000000000
	lduha	[%i1+0x00e]%asi,%l5	! %l5 = 0000000000000088
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000088
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 3e2d00ff, %l1 = 00000000000000f2
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010041410] = 0b72424d832357ff
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000

p0_label_102:
!	%l1 = ffffffffffffffff, Mem[00000000300c1408] = 88c15effff000000
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffffffffffff
!	%l7 = 00000000000000f5, Mem[00000000211c0001] = ffff6ca5, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = fff56ca5
!	%l2 = 00000000000000ff, imm = ffffffffffffff39, %l6 = 000000000000006d
	addc	%l2,-0x0c7,%l6		! %l6 = 0000000000000038
!	%l3 = 0000000000000000, Mem[0000000020800040] = ffff7fe3, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 00007fe3
!	%f6  = 66e69755 ff572383, Mem[0000000030081400] = ffffffff 8204c21c
	stda	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 66e69755 ff572383
!	Mem[0000000010181410] = a4c8aff5, %l1 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000a4c8aff5
!	%l1 = 00000000a4c8aff5, Mem[0000000030081408] = fc68131a000000ff
	stxa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000a4c8aff5
!	%l4 = 0000000018f90d75, Mem[0000000010081408] = 000000ff
	stha	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000d75
!	%f16 = ed2d0000 3e2d00ff fff6c2c9 00000000
!	%f20 = 63e4ff2f a4c8aff5 872e8493 f2cdcb03
!	%f24 = f5afc8a4 771290dc c8cebecc 2dffffed
!	%f28 = 20341ec6 832357f5 ffffffff cc00c9c8
	stda	%f16,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, imm = 000000000000022c, %l7 = 00000000000000f5
	xor	%l3,0x22c,%l7		! %l7 = 000000000000022c

p0_label_103:
!	Mem[0000000010041404] = 4d4200ff, %l5 = 0000000000000000
	lduwa	[%i1+0x004]%asi,%l5	! %l5 = 000000004d4200ff
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010001400] = f2cdcbff 00000000 ffcbcdf2 93842e87
!	Mem[0000000010001410] = 9afba2d1 00000034 ffed21b2 00000075
!	Mem[0000000010001420] = ffff0045 625702e7 6b5c1a83 6ed0cbec
!	Mem[0000000010001430] = 20da1908 ff476ccf ad01c571 26c585c6
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Mem[0000000010081410] = 8f4ccaf8, %l7 = 000000000000022c
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000008f4c
!	Mem[00000000211c0000] = fff56ca5, %l2 = 00000000000000ff
	ldsh	[%o2+%g0],%l2		! %l2 = fffffffffffffff5
!	Mem[0000000021800080] = ffeb5823, %l0 = 00000000ad79005f
	lduh	[%o3+0x080],%l0		! %l0 = 000000000000ffeb
!	%l7 = 0000000000008f4c, %l0 = 000000000000ffeb, %l3 = 0000000000000000
	addc	%l7,%l0,%l3		! %l3 = 0000000000018f37
!	Mem[0000000010041408] = 00000000, %l0 = 000000000000ffeb
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000008f4c
	ldsha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ff0000ff 0000002d 6f581540 00000000
!	Mem[00000000100c1410] = 000000ff 4d42ff0b 18f90d75 8b53f310
!	Mem[00000000100c1420] = 0b72424d b7fb00db e627c24b e07136b4
!	Mem[00000000100c1430] = 9ff822ff 8f4ccaf8 bb2d5a5e 568f4e05
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%l4 = 0000000018f90d75, Mem[0000000030181400] = 3e2d00ff
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 3e2d0075

p0_label_104:
!	%f24 = f5afc8a4 771290dc, Mem[0000000010181418] = 872e8493 f2cdcb03
	stda	%f24,[%i6+0x018]%asi	! Mem[0000000010181418] = f5afc8a4 771290dc
!	%l4 = 0000000018f90d75, Mem[00000000211c0000] = fff56ca5
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 0d756ca5
	membar	#Sync			! Added by membar checker (22)
!	%f30 = ffffffff cc00c9c8, Mem[0000000010001410] = d1a2fb9a 34000000
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff cc00c9c8
!	%l7 = 0000000000000000, Mem[0000000030041408] = ffffffff00000000
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000
!	%l4 = 18f90d75, %l5 = 4d4200ff, Mem[0000000010101400] = 00000000 000000ff
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 18f90d75 4d4200ff
!	%f15 = 568f4e05, Mem[0000000010181410] = 63e4ff2f
	sta	%f15,[%i6+%o5]0x80	! Mem[0000000010181410] = 568f4e05
!	%l7 = 0000000000000000, Mem[0000000030181400] = ed2d00003e2d0075
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%f16 = ed2d0000 3e2d00ff, Mem[0000000030181400] = 00000000 00000000
	stda	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = ed2d0000 3e2d00ff
!	%f16 = ed2d0000 3e2d00ff, Mem[0000000010001438] = ad01c571 26c585c6
	std	%f16,[%i0+0x038]	! Mem[0000000010001438] = ed2d0000 3e2d00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffcbcdf2, %l3 = 0000000000018f37
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffffcb

p0_label_105:
!	Mem[0000000010101420] = 00000000000000ff, %l0 = 0000000000000000
	ldxa	[%i4+0x020]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141418] = 75000000, %f0  = ff0000ff
	ld	[%i5+0x018],%f0 	! %f0 = 75000000
!	Mem[0000000030101408] = ff000000, %l2 = fffffffffffffff5
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = ff572383, %l1 = 00000000a4c8aff5
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = ffffffffff572383
!	Mem[0000000010081400] = ffffffff, %l5 = 000000004d4200ff
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = ffffffff, %l4 = 0000000018f90d75
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010001408] = f2cdcbff, %l0 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffcbff
!	Mem[0000000030041408] = 00000000, %l3 = ffffffffffffffcb
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = f5572383 c61e34ff, %l6 = 00000038, %l7 = 00000000
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000c61e34ff 00000000f5572383
!	Starting 10 instruction Store Burst
!	Mem[000000001018142a] = c8cebecc, %l4 = 00000000ffffffff
	ldstub	[%i6+0x02a],%l4		! %l4 = 000000be000000ff

p0_label_106:
!	%l0 = ffffffffffffcbff, Mem[00000000201c0001] = 0000f5e1, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00fff5e1
!	Mem[00000000100c1408] = 6f581540, %l2 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 0000006f000000ff
!	%f14 = bb2d5a5e, Mem[0000000010141404] = 00000062
	st	%f14,[%i5+0x004]	! Mem[0000000010141404] = bb2d5a5e
!	Mem[0000000030181400] = 3e2d00ff, %l7 = 00000000f5572383
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%l1 = ffffffffff572383, Mem[0000000010081408] = 750d000018f90d75, %asi = 80
	stxa	%l1,[%i2+0x008]%asi	! Mem[0000000010081408] = ffffffffff572383
!	Mem[00000000300c1408] = ffffffff, %l1 = ffffffffff572383
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l2 = 0000006f, %l3 = 00000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000006f 00000000
!	%f16 = ed2d0000 3e2d00ff, Mem[0000000010041400] = 0013c188 4d4200ff
	std	%f16,[%i1+%g0]	! Mem[0000000010041400] = ed2d0000 3e2d00ff
!	Mem[0000000030081410] = ff000000, %l5 = ffffffffffffffff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, %l1 = 00000000000000ff, %l6 = 00000000c61e34ff
	sub	%l3,%l1,%l6		! %l6 = ffffffffffffff01

p0_label_107:
!	Mem[0000000030101400] = ff000000 b7fb00db, %l4 = 000000be, %l5 = ff000000
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000b7fb00db
!	Mem[0000000010141400] = ff15586f, %l2 = 000000000000006f
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = ffffffffffffcbff
	setx	0x0f573b205794e6fe,%g7,%l0 ! %l0 = 0f573b205794e6fe
!	%l1 = 00000000000000ff
	setx	0x1c032bbff362cfc3,%g7,%l1 ! %l1 = 1c032bbff362cfc3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0f573b205794e6fe
	setx	0xd0284807f85593e5,%g7,%l0 ! %l0 = d0284807f85593e5
!	%l1 = 1c032bbff362cfc3
	setx	0x22e68a17b1946ed5,%g7,%l1 ! %l1 = 22e68a17b1946ed5
!	Mem[0000000010101400] = 750df918, %l5 = 00000000b7fb00db
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000075
!	Mem[0000000010101428] = 66e69755ff572383, %l4 = 00000000ff000000
	ldxa	[%i4+0x028]%asi,%l4	! %l4 = 66e69755ff572383
!	Mem[0000000010181410] = f5afc8a4054e8f56, %f14 = bb2d5a5e 568f4e05
	ldda	[%i6+%o5]0x88,%f14	! %f14 = f5afc8a4 054e8f56
!	Mem[0000000010141410] = 000000ff0000005f, %f6  = 18f90d75 8b53f310
	ldda	[%i5+%o5]0x88,%f6 	! %f6  = 000000ff 0000005f
!	Mem[0000000010101408] = 6d000000, %l6 = ffffffffffffff01
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 000000006d000000
!	Mem[0000000010101408] = 6d000000, %f4  = 000000ff
	lda	[%i4+%o4]0x80,%f4 	! %f4 = 6d000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ed2d0000, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ed000000ff

p0_label_108:
!	Mem[0000000020800001] = 0034e181, %l1 = 22e68a17b1946ed5
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 00000034000000ff
!	%l2 = 00000000000000ff, Mem[0000000030081400] = ff572383
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = ff5723ff
!	Mem[0000000010141410] = 0000005f, %l7 = 00000000000000ed
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 0000005f000000ff
!	%l5 = 0000000000000075, Mem[0000000010181408] = 00000000c9c2f6ff
	stxa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000075
!	%f4  = 6d000000 4d42ff0b, %l7 = 000000000000005f
!	Mem[0000000010081438] = dedcd297ff00e9a0
	add	%i2,0x038,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_P ! Mem[0000000010081438] = 6d0000004d42ff0b
!	Mem[0000000010041408] = 0000000000000088, %l6 = 000000006d000000, %l1 = 0000000000000034
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 0000000000000088
!	Mem[00000000100c1400] = ff0000ff, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = ff002d3e, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001410] = c8c900cc, %l1 = 0000000000000088
	ldstub	[%i0+%o5],%l1		! %l1 = 000000c8000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000f557 5597e65f, %l6 = 6d000000, %l7 = 0000005f
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 000000000000f557 000000005597e65f

p0_label_109:
!	%l5 = 0000000000000075, imm = fffffffffffff0f4, %l5 = 0000000000000075
	addc	%l5,-0xf0c,%l5		! %l5 = fffffffffffff169
!	%f5  = 4d42ff0b, Mem[00000000100c1400] = ff0000ff
	sta	%f5 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4d42ff0b
!	Mem[00000000100c1408] = 401558ff, %l0 = d0284807f85593e5
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = ff15586f bb2d5a5e, %l4 = ff572383, %l5 = fffff169
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff15586f 00000000bb2d5a5e
!	Mem[0000000030181410] = 00000000, %l6 = 000000000000f557
	ldswa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 57f50000, %l0 = ffffffffffffffff
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800000] = ffb731c9, %l5 = 00000000bb2d5a5e
	ldsh	[%o3+%g0],%l5		! %l5 = ffffffffffffffb7
!	Mem[0000000010081408] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010141410] = 000000ff000000ff, %f10 = e627c24b e07136b4
	ldda	[%i5+%o5]0x88,%f10	! %f10 = 000000ff 000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000010181408] = 0000000000000075
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000ffffffff

p0_label_110:
!	Mem[0000000030141408] = 750df918, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000075000000ff
!	%f21 = a4c8aff5, %f15 = 054e8f56, %f10 = 000000ff
	fdivs	%f21,%f15,%f10		! %f10 = def8b8ca
!	%l0 = 00000000, %l1 = 000000c8, Mem[00000000100c1430] = 9ff822ff 8f4ccaf8
	std	%l0,[%i3+0x030]		! Mem[00000000100c1430] = 00000000 000000c8
!	%f2  = 6f581540 00000000, Mem[0000000010181410] = 568f4e05 a4c8aff5
	stda	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 6f581540 00000000
!	%l6 = 00000000ffffffff, Mem[0000000010001414] = ffffffff, %asi = 80
	stba	%l6,[%i0+0x014]%asi	! Mem[0000000010001414] = ffffffff
!	Mem[0000000010081408] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181400] = ed2d0000, %l7 = 000000005597e65f
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000ed2d0000
!	%l6 = ffffffff, %l7 = ed2d0000, Mem[0000000010081400] = ffffffff 00000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff ed2d0000
!	Mem[000000001010142d] = ff572383, %l1 = 00000000000000c8
	ldstub	[%i4+0x02d],%l1		! %l1 = 00000057000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 3e2d0000, %l1 = 0000000000000057
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_111:
!	Mem[0000000010041400] = ff2d0000 3e2d00ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff2d0000 000000003e2d00ff
!	Mem[000000001014143c] = 71c501ad, %l2 = 00000000000000ff
	ldsha	[%i5+0x03e]%asi,%l2	! %l2 = 00000000000001ad
!	Mem[0000000010001408] = 872e8493f2cdcbff, %f10 = def8b8ca 000000ff
	ldda	[%i0+%o4]0x88,%f10	! %f10 = 872e8493 f2cdcbff
!	Mem[0000000010141410] = 000000ff000000ff, %l5 = ffffffffffffffb7
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101400] = 000000ff, %l2 = 00000000000001ad
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = ffffffff, %l4 = 00000000ff15586f
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[000000001014142c] = 5597e666, %l7 = 00000000ed2d0000
	ldsha	[%i5+0x02c]%asi,%l7	! %l7 = 0000000000005597
!	Mem[0000000010041400] = 00002dff, %l6 = 00000000ffffffff
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 0000000000002dff
!	Mem[00000000201c0000] = 00fff5e1, %l7 = 0000000000005597
	ldub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000010081408] = ffffffff
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff

p0_label_112:
!	Mem[0000000010081430] = 2f73f64f15026e00, %l1 = 000000003e2d00ff, %l6 = 0000000000002dff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 2f73f64f15026e00
!	%l1 = 000000003e2d00ff, Mem[0000000010001400] = f2cdcbff
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 3e2d00ff
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = 0bff424d
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff424d
!	Mem[00000000300c1408] = ffffffff, %l0 = 00000000ff2d0000
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f20 = 63e4ff2f, Mem[0000000030081408] = a4c8aff5
	sta	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = 63e4ff2f
!	%l1 = 000000003e2d00ff, Mem[0000000010001424] = 625702e7
	stw	%l1,[%i0+0x024]		! Mem[0000000010001424] = 3e2d00ff
!	%f10 = 872e8493 f2cdcbff, %l5 = 000000ff000000ff
!	Mem[0000000030001428] = c8cebecc0000ffed
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030001428] = ffcbcdf293842e87
!	%f0  = 75000000 0000002d 6f581540 00000000
!	%f4  = 6d000000 4d42ff0b 000000ff 0000005f
!	%f8  = 0b72424d b7fb00db 872e8493 f2cdcbff
!	%f12 = 9ff822ff 8f4ccaf8 f5afc8a4 054e8f56
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%f21 = a4c8aff5, Mem[00000000300c1400] = 3e2d0000
	sta	%f21,[%i3+%g0]0x89	! Mem[00000000300c1400] = a4c8aff5
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (23)
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000075
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_113:
!	%l0 = 00000000000000ff, %l5 = 000000ff000000ff, %y  = 00000000
	umul	%l0,%l5,%l7		! %l7 = 000000000000fe01, %y = 00000000
!	Mem[0000000010101408] = 6d000000, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 000000006d000000
!	Mem[0000000030001400] = 00000000 00000000, %l6 = 15026e00, %l7 = 0000fe01
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = ed2d00003e2d00ff, %f14 = f5afc8a4 054e8f56
	ldda	[%i6+%g0]0x89,%f14	! %f14 = ed2d0000 3e2d00ff
!	Mem[00000000218000c0] = ff69d8f4, %l1 = 000000003e2d00ff
	ldsh	[%o3+0x0c0],%l1		! %l1 = ffffffffffffff69
!	%l0 = 00000000000000ff, %l4 = 00000000ffffffff, %l6 = 0000000000000000
	add	%l0,%l4,%l6		! %l6 = 00000001000000fe
!	Mem[0000000010101428] = 66e69755, %l0 = 00000000000000ff
	lduw	[%i4+0x028],%l0		! %l0 = 0000000066e69755
!	Mem[0000000030101410] = 0000ff00, %l2 = 000000006d000000
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1408] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000010001408] = ffcbcdf2 93842e87
	stda	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = ffffffff 000000ff

p0_label_114:
!	%l1 = ffffffffffffff69, Mem[0000000010181408] = ffffffff
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = ff69ffff
!	%l2 = 0000ff00, %l3 = ffffffff, Mem[0000000010181410] = 6f581540 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ff00 ffffffff
!	%l0 = 0000000066e69755, Mem[0000000030141408] = 18f90dff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 66e69755
!	%l2 = 000000000000ff00, imm = 0000000000000317, %l7 = 0000000000000000
	subc	%l2,0x317,%l7		! %l7 = 000000000000fbe9
!	Mem[0000000010081430] = 2f73f64f, %l6 = 00000001000000fe, %asi = 80
	swapa	[%i2+0x030]%asi,%l6	! %l6 = 000000002f73f64f
!	%f7  = 0000005f, Mem[00000000100c1410] = 4d42ff0b
	sta	%f7 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000005f
!	%f24 = f5afc8a4 771290dc, Mem[0000000010001430] = 20da1908 ff476ccf
	std	%f24,[%i0+0x030]	! Mem[0000000010001430] = f5afc8a4 771290dc
!	%l5 = 000000ff000000ff, Mem[0000000010081410] = 8f4ccaf8ff000000
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff000000ff
!	Mem[0000000010041434] = 00000000, %l7 = 000000000000fbe9, %asi = 80
	swapa	[%i1+0x034]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0000006f, %f15 = 3e2d00ff
	lda	[%i4+%o4]0x89,%f15	! %f15 = 0000006f

p0_label_115:
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l2 = 000000000000ff00
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = cc00c9ff, %f15 = 0000006f
	lda	[%i0+%o5]0x88,%f15	! %f15 = cc00c9ff
!	Mem[00000000211c0001] = 0d756ca5, %l4 = 00000000ffffffff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000075000000ff
!	Mem[00000000100c1418] = 5f000000ff000000, %f16 = ed2d0000 3e2d00ff
	ldda	[%i3+0x018]%asi,%f16	! %f16 = 5f000000 ff000000
!	Mem[0000000010141410] = 000000ff, %l0 = 0000000066e69755
	lduwa	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 6d000000, %l0 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000006d00
!	Mem[0000000021800000] = ffb731c9, %l1 = ffffffffffffff69
	ldsh	[%o3+%g0],%l1		! %l1 = ffffffffffffffb7
!	Mem[00000000300c1408] = ffffffff, %l4 = 0000000000000075
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 000000ff000000ff, Mem[0000000010001410] = ffc900ccffffffff, %asi = 80
	stxa	%l5,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000ff000000ff

p0_label_116:
!	Mem[0000000010141410] = 000000ff, %l6 = 000000002f73f64f
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030181410] = 0000000000000000
	stxa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	%f4  = 6d000000, Mem[0000000010081408] = ffffffff
	sta	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 6d000000
!	%l1 = ffffffffffffffb7, Mem[0000000010101408] = 6d00000000000057
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffffffffffb7
!	%l5 = 000000ff000000ff, immed = fffff3eb, %y  = 00000000
	smul	%l5,-0xc15,%l6		! %l6 = fffffffffff3f715, %y = ffffffff
!	Mem[0000000030001410] = ff572383, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 00000083000000ff
!	Mem[0000000010041416] = 00000000, %l3 = 0000000000000083
	ldstub	[%i1+0x016],%l3		! %l3 = 00000000000000ff
!	%f26 = c8cebecc 2dffffed, Mem[0000000010081430] = 000000fe 15026e00
	std	%f26,[%i2+0x030]	! Mem[0000000010081430] = c8cebecc 2dffffed
!	Mem[0000000030041410] = 00000000, %l1 = ffffffffffffffb7
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 5f000000, %l0 = 0000000000006d00
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 000000000000005f

p0_label_117:
!	Mem[0000000030101400] = ff000000, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 66e69755, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 0000000066e69755
!	Mem[0000000030081408] = 2fffe46300000000, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 2fffe46300000000
!	Mem[0000000010001400] = ff002d3e, %l3 = 2fffe46300000000
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 000000000000003e
!	Mem[00000000211c0000] = 0dff6ca5, %l4 = ffffffffffffffff
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000000dff
!	Mem[0000000030041400] = abc494ff 0000005f, %l0 = 0000005f, %l1 = 66e69755
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 000000000000005f 00000000abc494ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 000000000000005f
	setx	0x09b5e888031c386f,%g7,%l0 ! %l0 = 09b5e888031c386f
!	%l1 = 00000000abc494ff
	setx	0x1a7395081aa5d3fe,%g7,%l1 ! %l1 = 1a7395081aa5d3fe
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 09b5e888031c386f
	setx	0x6f54f3bfc1a980e7,%g7,%l0 ! %l0 = 6f54f3bfc1a980e7
!	%l1 = 1a7395081aa5d3fe
	setx	0xbc3af680674d2cbe,%g7,%l1 ! %l1 = bc3af680674d2cbe
!	Mem[0000000010081408] = 832357ff 6d000000, %l6 = fff3f715, %l7 = 000000ff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 000000006d000000 00000000832357ff
!	Mem[0000000030141408] = 66e69755, %l1 = bc3af680674d2cbe
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 0000000066e69755
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l6 = 000000006d000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_118:
!	%f30 = ffffffff cc00c9c8, %l6 = 0000000000000000
!	Mem[0000000030041408] = 0000000000000000
	add	%i1,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041408] = 0000000000000000
!	Mem[0000000010181410] = 0000ff00, %l0 = 6f54f3bfc1a980e7
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f11 = f2cdcbff, Mem[0000000010081408] = 0000006d
	sta	%f11,[%i2+%o4]0x80	! Mem[0000000010081408] = f2cdcbff
!	Mem[0000000010041404] = 3e2d00ff, %l7 = 00000000832357ff
	ldstuba	[%i1+0x004]%asi,%l7	! %l7 = 0000003e000000ff
!	%l3 = 000000000000003e, Mem[0000000010181400] = ff002d3e5fe69755
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000003e
!	%l6 = 00000000, %l7 = 0000003e, Mem[0000000010181418] = f5afc8a4 771290dc
	stda	%l6,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000 0000003e
!	%l5 = 000000ff000000ff, Mem[0000000010001408] = ffffffff
	stwa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Mem[0000000030081400] = ff2357ff, %l1 = 0000000066e69755
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l3 = 000000000000003e, Mem[0000000030141410] = 66e69755
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 003e9755
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff000000, %l2 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff

p0_label_119:
!	Mem[0000000030081410] = ffffffff, %l5 = 000000ff000000ff
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = f2cdcbff, %l3 = 000000000000003e
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = fffffffffffffff2
!	Mem[0000000030141410] = 003e9755 ff572383, %l4 = 00000dff, %l5 = ffffffff
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000003e9755 00000000ff572383
!	Mem[0000000030181400] = 3e2d00ff, %l5 = 00000000ff572383
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ffffffff, %f28 = 20341ec6
	lda	[%i2+%o5]0x89,%f28	! %f28 = ffffffff
!	Mem[0000000010101400] = 18f90d75, %l2 = 00000000000000ff
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000d75
!	Mem[00000000300c1408] = ffffffffffffffff, %l5 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = 3e000000, %l3 = fffffffffffffff2
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000003e00
!	Mem[0000000030041400] = abc494ff 0000005f, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 000000000000005f 00000000abc494ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 0000003e, Mem[0000000010141400] = 6f5815ff 5e5a2dbb
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 0000003e

p0_label_120:
!	%l5 = ffffffffffffffff, Mem[0000000010141408] = c61e34ff
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	%l4 = 00000000003e9755, Mem[00000000100c1400] = 0000002d
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000055
!	%f6  = 000000ff 0000005f, Mem[0000000030081410] = ffffffff 9afba2d1
	stda	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 0000005f
!	%f0  = 75000000 0000002d, Mem[0000000010001438] = ed2d0000 3e2d00ff
	stda	%f0 ,[%i0+0x038]%asi	! Mem[0000000010001438] = 75000000 0000002d
!	%l6 = 00000000, %l7 = 0000003e, Mem[0000000030141400] = 5f000000 00000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 0000003e
!	Mem[00000000300c1410] = 00000000, %l3 = 0000000000003e00
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010143c] = ffff0000, %l1 = abc494ff, %l3 = 00000000
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ffff0000
!	%l5 = ffffffffffffffff, Mem[0000000010101408] = ffffffffffffffb7
	stxa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffffffffffff
!	%l3 = 00000000ffff0000, Mem[00000000100c1410] = 0000005f
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 4ff6732fff000000, %f24 = f5afc8a4 771290dc
	ldd	[%i5+%o5],%f24		! %f24 = 4ff6732f ff000000

p0_label_121:
!	Mem[0000000030081408] = 2fffe463, %l5 = ffffffffffffffff
	lduba	[%i2+%o4]0x81,%l5	! %l5 = 000000000000002f
!	Mem[0000000010181414] = ffffffff, %l6 = 0000000000000000
	ldswa	[%i6+0x014]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = 000000ff, %f26 = c8cebecc
	lda	[%i0+0x008]%asi,%f26	! %f26 = 000000ff
!	Mem[0000000030041400] = 5f000000, %l1 = 00000000abc494ff
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 000000000000005f
!	Mem[0000000030141410] = 832357ff55973e00, %l6 = ffffffffffffffff
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 832357ff55973e00
!	Mem[0000000010001410] = 000000ff, %f22 = 872e8493
	lda	[%i0+%o5]0x80,%f22	! %f22 = 000000ff
!	%f24 = 4ff6732f, %f27 = 2dffffed
	fcmps	%fcc0,%f24,%f27		! %fcc0 = 2
!	Mem[0000000010041400] = 00002dff, %l2 = 0000000000000d75
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000021800040] = 000079c9, %l3 = 00000000ffff0000
	lduba	[%o3+0x041]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 003e9755, %l5 = 0000002f, Mem[0000000030081410] = 5f000000 ff000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 003e9755 0000002f

p0_label_122:
!	Mem[00000000100c1408] = 00000000, %l6 = 832357ff55973e00
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f31 = cc00c9c8, Mem[00000000100c1410] = 00000000
	sta	%f31,[%i3+%o5]0x88	! Mem[00000000100c1410] = cc00c9c8
!	%l6 = 0000000000000000, imm = fffffffffffffc92, %l0 = 000000000000005f
	and	%l6,-0x36e,%l0		! %l0 = 0000000000000000
!	%l5 = 000000000000002f, Mem[0000000010141410] = 4ff6732f
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000002f
!	Mem[00000000211c0000] = 0dff6ca5, %l2 = ffffffffffffffff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 0000000d000000ff
!	%l6 = 0000000000000000, Mem[000000001008140c] = ff572383, %asi = 80
	stwa	%l6,[%i2+0x00c]%asi	! Mem[000000001008140c] = 00000000
!	Mem[0000000010141408] = ffffffff832357f5, %l2 = 000000000000000d, %l2 = 000000000000000d
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = ffffffff832357f5
!	%l6 = 0000000000000000, Mem[0000000010081410] = 000000ff
	stba	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%f30 = ffffffff cc00c9c8, Mem[0000000030181408] = 00000000 fff6c2c9
	stda	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff cc00c9c8
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = b9ff70fe, %l3 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000b9ff

p0_label_123:
!	Mem[0000000010001410] = 000000ff, %l1 = 000000000000005f
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 6d000000 cc00c9c8, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000cc00c9c8 000000006d000000
!	Mem[0000000021800100] = b9ff70fe, %l3 = 000000000000b9ff
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000b9ff
!	Mem[0000000030101410] = 00ff000000000000, %f0  = 75000000 0000002d
	ldda	[%i4+%o5]0x81,%f0 	! %f0  = 00ff0000 00000000
!	Mem[00000000300c1410] = ff000000, %l4 = 00000000003e9755
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ffffffff832357f5, %f2  = 6f581540 00000000
	ldda	[%i5+%o4]0x80,%f2 	! %f2  = ffffffff 832357f5
!	Mem[0000000010181408] = ff69ffff00000000, %f18 = fff6c2c9 00000000
	ldda	[%i6+0x008]%asi,%f18	! %f18 = ff69ffff 00000000
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff6ca5, %l4 = ffffffffffffffff
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000002f, Mem[0000000030181408] = c8c900cc
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 002f00cc

p0_label_124:
!	%l7 = 000000000000003e, Mem[0000000030101408] = 0000006f
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000003e
!	Mem[0000000030081400] = ff5723ff, %l7 = 000000000000003e
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000ff5723ff
!	%l2 = 832357f5, %l3 = 0000b9ff, Mem[0000000030081408] = 63e4ff2f 00000000
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 832357f5 0000b9ff
!	%l5 = 000000000000002f, %l3 = 000000000000b9ff, %l1 = 000000006d000000
	xnor	%l5,%l3,%l1		! %l1 = ffffffffffff462f
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 00000000cc00c9c8
	setx	0xa98f43686d0a504d,%g7,%l0 ! %l0 = a98f43686d0a504d
!	%l1 = ffffffffffff462f
	setx	0xe22cbea06a33f960,%g7,%l1 ! %l1 = e22cbea06a33f960
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a98f43686d0a504d
	setx	0xa675ba8789a95afa,%g7,%l0 ! %l0 = a675ba8789a95afa
!	%l1 = e22cbea06a33f960
	setx	0x799e3b7fb67f477a,%g7,%l1 ! %l1 = 799e3b7fb67f477a
!	%l5 = 000000000000002f, Mem[0000000010181410] = ff00ff00
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000002f
!	%l6 = 00000000, %l7 = ff5723ff, Mem[00000000100c1418] = 5f000000 ff000000
	stda	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 ff5723ff
!	%l2 = ffffffff832357f5, Mem[0000000020800000] = 00ffe181, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = f5ffe181
!	Mem[0000000030041410] = ff000000, %l5 = 000000000000002f
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 88000000 00000000, %l2 = 832357f5, %l3 = 0000b9ff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000088000000

p0_label_125:
!	Mem[0000000010041408] = 00000000, %f30 = ffffffff
	lda	[%i1+%o4]0x80,%f30	! %f30 = 00000000
!	Mem[00000000100c1400] = 55000000, %l0 = a675ba8789a95afa
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000055
!	Mem[0000000010141400] = 0000003e00000000, %l3 = 0000000088000000
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 0000003e00000000
!	Mem[0000000020800000] = f5ffe181, %l3 = 0000003e00000000
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000f5ff
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 0000000000000055
	setx	0xb13407b85287e192,%g7,%l0 ! %l0 = b13407b85287e192
!	%l1 = 799e3b7fb67f477a
	setx	0x1db386d848738a96,%g7,%l1 ! %l1 = 1db386d848738a96
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b13407b85287e192
	setx	0x031d5f67caa633c1,%g7,%l0 ! %l0 = 031d5f67caa633c1
!	%l1 = 1db386d848738a96
	setx	0xd7a80087ed8c5709,%g7,%l1 ! %l1 = d7a80087ed8c5709
!	Mem[0000000030081410] = 003e97550000002f, %f2  = ffffffff 832357f5
	ldda	[%i2+%o5]0x81,%f2 	! %f2  = 003e9755 0000002f
!	Mem[0000000010101410] = 0000f557, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = 000000000000f557
!	Mem[0000000010141408] = ffffffff, %l5 = 00000000ff000000
	lduba	[%i5+0x00a]%asi,%l5	! %l5 = 00000000000000ff
!	%l3 = 000000000000f5ff, Mem[0000000010101408] = ffffffff
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010001428] = 6b5c1a836ed0cbec
	stx	%l5,[%i0+0x028]		! Mem[0000000010001428] = 00000000000000ff

p0_label_126:
!	%l0 = caa633c1, %l1 = ed8c5709, Mem[00000000100c1410] = cc00c9c8 6d000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = caa633c1 ed8c5709
!	%l4 = ffffffffffffffff, %l5 = 00000000000000ff, %l3 = 000000000000f5ff
	sdivx	%l4,%l5,%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1425] = 4d42720b, %l3 = 0000000000000000
	ldstuba	[%i3+0x025]%asi,%l3	! %l3 = 00000042000000ff
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000042
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010041400] = ff2d0000
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 002d0000
!	%f14 = ed2d0000 cc00c9ff, Mem[0000000010041410] = 00000000 0000ff00
	stda	%f14,[%i1+%o5]0x80	! Mem[0000000010041410] = ed2d0000 cc00c9ff
!	%l0 = 031d5f67caa633c1, Mem[0000000020800000] = f5ffe181, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 33c1e181
!	Mem[0000000030101400] = ff000000, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l1 = d7a80087ed8c5709, Mem[0000000020800000] = 33c1e181, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 5709e181
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = caa633c1, %f8  = 0b72424d
	lda	[%i3+%o5]0x88,%f8 	! %f8 = caa633c1

p0_label_127:
!	Mem[00000000100c1400] = 55000000, %l2 = 000000000000f557
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000005500
!	Mem[0000000010001414] = 000000ff, %l7 = 00000000ff5723ff
	lduw	[%i0+0x014],%l7		! %l7 = 00000000000000ff
!	%f26 = 000000ff, %f25 = ff000000, %f23 = f2cdcb03
	fmuls	%f26,%f25,%f23		! %l0 = 031d5f67caa633e3, Unfinished, %fsr = 3500000800
!	Mem[00000000300c1400] = a4c8aff5, %l4 = ffffffffffffffff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 000000000000aff5
!	Mem[0000000030081408] = f5572383, %l0 = 031d5f67caa633e3
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000f5572383
!	Mem[0000000010141408] = ffffffff, %l4 = 000000000000aff5
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181400] = ff002d3e, %f15 = cc00c9ff
	lda	[%i6+%g0]0x81,%f15	! %f15 = ff002d3e
!	Mem[00000000100c1400] = 55000000, %l1 = d7a80087ed8c5709
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000055000000
!	Mem[0000000010001434] = 771290dc, %l6 = 0000000000000000
	ldsw	[%i0+0x034],%l6		! %l6 = 00000000771290dc
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000485c6, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000000485c6

p0_label_128:
!	%l3 = 00000000ff000000, Mem[0000000030101400] = 00000000
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010001410] = 000000ff, %l0 = 00000000f5572383
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 00000000000000ff, %l2 = 0000000000005500, %l5 = 00000000000000ff
	add	%l5,%l2,%l5		! %l5 = 00000000000055ff
!	Mem[0000000030101408] = 0000003e, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 0000003e000000ff
!	%f22 = 000000ff f2cdcb03, Mem[0000000030101400] = 00000000 b7fb00db
	stda	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff f2cdcb03
!	Mem[0000000010001438] = 75000000, %l4 = ffffffff, %l0 = 0000003e
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000075000000
!	Mem[0000000010081400] = ffffffff, %l2 = 0000000000005500
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l3 = 00000000ff000000, Mem[0000000010101400] = 18f90d75
	stwa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000030001408] = 000000ff 1cc20482
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 00000000ff000000, %l5 = 00000000000055ff
	ldx	[%i4+0x030],%l5		! %l5 = 00000000ff000000

p0_label_129:
!	Mem[00000000100c1400] = 00000055, %l3 = 00000000ff000000
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000055
!	%f16 = 5f000000, %f13 = 8f4ccaf8, %f14 = ed2d0000 ff002d3e
	fsmuld	%f16,%f13,%f14		! %f14 = bdd9995f 00000000
!	Mem[0000000010181408] = ff69ffff00000000, %f14 = bdd9995f 00000000
	ldda	[%i6+%o4]0x80,%f14	! %f14 = ff69ffff 00000000
!	Mem[00000000211c0000] = ffff6ca5, %l6 = 00000000771290dc
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010181410] = 0000002f, %l5 = 00000000ff000000
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%f10 = 872e8493, %f28 = ffffffff, %f5  = 4d42ff0b
	fmuls	%f10,%f28,%f5 		! %f5  = ffffffff
!	Mem[0000000030001410] = 66e69755ff5723ff, %f18 = ff69ffff 00000000
	ldda	[%i0+%o5]0x89,%f18	! %f18 = 66e69755 ff5723ff
!	Mem[0000000030001408] = 000000ff ff000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 00000000ff000000 00000000000000ff
!	Mem[00000000100c1410] = c133a6ca, %l2 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffc133a6ca
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = f2cdcbff, %l2 = ffffffffc133a6ca
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000f2000000ff

p0_label_130:
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000f2
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000075000000, Mem[0000000010181400] = 3e000000
	stha	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l4 = 00000000ff000000, Mem[00000000201c0001] = 00fff5e1
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 0000f5e1
!	Mem[0000000010141408] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010181414] = ffffffff, %l2 = 0000000000000000, %asi = 80
	swapa	[%i6+0x014]%asi,%l2	! %l2 = 00000000ffffffff
!	%l1 = 0000000055000000, Mem[0000000010081400] = ffffffff
	sth	%l1,[%i2+%g0]		! Mem[0000000010081400] = 0000ffff
!	%f18 = 66e69755, Mem[0000000030001410] = ff5723ff
	sta	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 66e69755
!	Mem[0000000030141408] = 66e69755, %l7 = 00000000000485c6
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 00000055000000ff
!	Mem[00000000100c1410] = caa633c1, %l5 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 000000c1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l2 = 00000000ffffffff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_131:
!	Mem[0000000010041410] = ed2d0000cc00c9ff, %f16 = 5f000000 ff000000
	ldda	[%i1+%o5]0x80,%f16	! %f16 = ed2d0000 cc00c9ff
!	Mem[0000000030001410] = 66e69755, %f28 = ffffffff
	lda	[%i0+%o5]0x89,%f28	! %f28 = 66e69755
!	Mem[0000000010181400] = 00000000, %l6 = 000000000000ffff
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 00000000ffcbcdff, %f30 = 00000000 cc00c9c8
	ldda	[%i2+%o4]0x88,%f30	! %f30 = 00000000 ffcbcdff
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030041400] = 5f000000 ff94c4ab 00000000 00000000
!	Mem[0000000030041410] = 0000002f 40000000 aa84feb2 761ca310
!	Mem[0000000030041420] = 36d6a1c8 996cc182 5f098316 aab5637a
!	Mem[0000000030041430] = 6ffefb54 15f0db48 b2cbaccb 6f7a03c6
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000000000055
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 00007fe3, %l3 = 0000000000000000
	ldub	[%o1+0x041],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041434] = 0000fbe9, %l4 = 00000000ff000000
	ldsh	[%i1+0x034],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = ed2d0000cc00c9ff, %f0  = 00ff0000 00000000
	ldda	[%i1+0x010]%asi,%f0 	! %f0  = ed2d0000 cc00c9ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000000c1, Mem[0000000010181408] = ffff69ff 00000000
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 000000c1

p0_label_132:
!	%f4  = 6d000000 ffffffff, Mem[00000000300c1400] = a4c8aff5 3e2d0000
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 6d000000 ffffffff
!	%l7 = 0000000000000055, Mem[00000000100c1410] = ed8c5709caa633ff
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000055
!	%l3 = 0000000000000000, Mem[0000000010081400] = 0000ffff00002ded
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	%l0 = 75000000, %l1 = 55000000, Mem[00000000100c1408] = ff000000 4015586f
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 75000000 55000000
!	%f4  = 6d000000, %f14 = ff69ffff, %f10 = 872e8493
	fsubs	%f4 ,%f14,%f10		! %f10 = 7f69ffff
!	Mem[00000000211c0000] = ffff6ca5, %l1 = 0000000055000000
	ldstub	[%o2+%g0],%l1		! %l1 = 000000ff000000ff
!	%l7 = 0000000000000055, Mem[00000000100c1410] = 55000000
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000055
!	Mem[0000000010081418] = f8a2000a, %l5 = 00000000000000c1, %asi = 80
	swapa	[%i2+0x018]%asi,%l5	! %l5 = 00000000f8a2000a
!	%f14 = ff69ffff 00000000, %l3 = 0000000000000000
!	Mem[0000000030101428] = 00002d3eff000000
	add	%i4,0x028,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101428] = 00002d3eff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 3e2d00ff, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = 000000000000003e

p0_label_133:
!	Mem[0000000010041410] = ed2d0000, %l5 = 00000000f8a2000a
	ldsw	[%i1+%o5],%l5		! %l5 = ffffffffed2d0000
!	%f4  = 6d000000, %f2  = 003e9755
	fcmps	%fcc1,%f4 ,%f2 		! %fcc1 = 2
!	Mem[0000000030081410] = 003e9755, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000003e9755
!	Mem[0000000010101400] = 4d4200ff ff000000, %l6 = 00000000, %l7 = 00000055
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000ff000000 000000004d4200ff
!	Mem[0000000030181408] = ffffffffcc002f00, %f12 = 9ff822ff 8f4ccaf8
	ldda	[%i6+%o4]0x89,%f12	! %f12 = ffffffff cc002f00
!	Mem[0000000010141400] = 42000000, %l7 = 000000004d4200ff
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 002d0000ff2d00ff, %f4  = 6d000000 ffffffff
	ldda	[%i1+%g0]0x80,%f4 	! %f4  = 002d0000 ff2d00ff
!	%l7 = 0000000000000000, %l5 = ffffffffed2d0000, %l5 = ffffffffed2d0000
	addc	%l7,%l5,%l5		! %l5 = ffffffffed2d0000
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = ffffffff cc002f00, Mem[0000000010081418] = 000000c1 b9a941d2
	std	%f12,[%i2+0x018]	! Mem[0000000010081418] = ffffffff cc002f00

p0_label_134:
!	%l3 = 0000000000000000, Mem[0000000030101400] = ff000000
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	%f12 = ffffffff cc002f00, Mem[0000000010001400] = 3e2d00ff 00000000
	stda	%f12,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff cc002f00
!	Mem[00000000100c1408] = 75000000, %l2 = 00000000003e9755
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000075000000ff
!	Mem[00000000201c0001] = 0000f5e1, %l0 = 0000000075000000
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	%f2  = 003e9755, Mem[0000000010181408] = 00000000
	sta	%f2 ,[%i6+0x008]%asi	! Mem[0000000010181408] = 003e9755
!	Mem[00000000201c0000] = 00fff5e1, %l5 = ffffffffed2d0000
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 0000002f, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ff000000, %l6 = ff000000, %l4 = 0000003e
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff000000
!	%f6  = 000000ff 0000005f, %l2 = 0000000000000075
!	Mem[0000000030141400] = 000000000000003e
	stda	%f6,[%i5+%l2]ASI_PST32_SL ! Mem[0000000030141400] = 5f0000000000003e
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+0x004]%asi,%l0	! %l0 = 0000000000000000

p0_label_135:
!	Mem[0000000020800040] = 00007fe3, %l6 = 00000000ff000000
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f18 = 00000000
	lda	[%i1+%o4]0x81,%f18	! %f18 = 00000000
!	%f27 = aab5637a, %f11 = f2cdcbff
	fcmps	%fcc3,%f27,%f11		! %fcc3 = 2
!	Mem[00000000100c1438] = 568f4e05, %l6 = 0000000000000000
	ldsha	[%i3+0x038]%asi,%l6	! %l6 = 000000000000568f
!	Mem[0000000030141408] = ff97e666, %f31 = 6f7a03c6
	lda	[%i5+%o4]0x81,%f31	! %f31 = ff97e666
!	Mem[0000000021800080] = ffeb5823, %l0 = 0000000000000000
	ldsh	[%o3+0x080],%l0		! %l0 = ffffffffffffffeb
!	Mem[00000000100c1408] = 00000055000000ff, %f14 = ff69ffff 00000000
	ldda	[%i3+%o4]0x88,%f14	! %f14 = 00000055 000000ff
!	Mem[0000000030081408] = f5572383, %l6 = 000000000000568f
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000f5
!	Mem[00000000300c1408] = ffffffff, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f16 = 5f000000 ff94c4ab, Mem[00000000100c1410] = 55000000 00000000
	stda	%f16,[%i3+%o5]0x88	! Mem[00000000100c1410] = 5f000000 ff94c4ab

p0_label_136:
!	Mem[0000000030081410] = 003e9755, %l7 = 000000000000ffff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000003e9755
!	%f15 = 000000ff, Mem[0000000010101410] = 57f50000
	sta	%f15,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%f9  = b7fb00db, Mem[0000000010041408] = 0000003e
	sta	%f9 ,[%i1+%o4]0x80	! Mem[0000000010041408] = b7fb00db
!	Mem[0000000010141400] = 00000042, %l2 = 0000000000000075
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ffffffff, %l0 = ffffffffffffffeb
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffffffff
!	%l7 = 00000000003e9755, Mem[00000000100c1406] = 00000075
	stb	%l7,[%i3+0x006]		! Mem[00000000100c1404] = 00005575
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 00000000ffffffff
	setx	0xdefb411045987a4e,%g7,%l0 ! %l0 = defb411045987a4e
!	%l1 = 00000000000000ff
	setx	0x802bcba87a8bc232,%g7,%l1 ! %l1 = 802bcba87a8bc232
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = defb411045987a4e
	setx	0x54f6f4dfd120b643,%g7,%l0 ! %l0 = 54f6f4dfd120b643
!	%l1 = 802bcba87a8bc232
	setx	0xb08379b81d51fe0c,%g7,%l1 ! %l1 = b08379b81d51fe0c
!	Mem[0000000030081410] = ffff0000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ffff0000
!	%l4 = 00000000ff000000, Mem[0000000021800000] = ffb731c9
	stb	%l4,[%o3+%g0]		! Mem[0000000021800000] = 00b731c9
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = 0000005f, %l4 = 00000000ff000000
	lduha	[%i3+0x014]%asi,%l4	! %l4 = 0000000000000000

p0_label_137:
!	Mem[0000000030041408] = 0000000000000000, %f2  = 003e9755 0000002f
	ldda	[%i1+%o4]0x89,%f2 	! %f2  = 00000000 00000000
!	Mem[00000000100c1400] = 00000055, %f13 = cc002f00
	lda	[%i3+%g0]0x88,%f13	! %f13 = 00000055
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 54f6f4dfd120b643
	setx	0xdd2caac03ff3be98,%g7,%l0 ! %l0 = dd2caac03ff3be98
!	%l1 = b08379b81d51fe0c
	setx	0xdec3c52fc2867216,%g7,%l1 ! %l1 = dec3c52fc2867216
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd2caac03ff3be98
	setx	0x040a835faaa144a4,%g7,%l0 ! %l0 = 040a835faaa144a4
!	%l1 = dec3c52fc2867216
	setx	0xb7edb6386a13cb52,%g7,%l1 ! %l1 = b7edb6386a13cb52
!	Mem[0000000030041408] = 0000000000000000, %l7 = 00000000003e9755
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %f17 = ff94c4ab
	lda	[%i6+%o5]0x89,%f17	! %f17 = 000000ff
!	Mem[00000000201c0000] = fffff5e1, %l4 = 0000000000000000
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030101400] = ff000000, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030101410] = 0000ff00, %f8  = caa633c1
	lda	[%i4+%o5]0x89,%f8 	! %f8 = 0000ff00
!	Starting 10 instruction Store Burst
!	%l1 = b7edb6386a13cb52, Mem[00000000201c0000] = fffff5e1, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 52fff5e1

p0_label_138:
!	%l2 = 00000000ff000000, imm = 00000000000007c3, %l2 = 00000000ff000000
	xnor	%l2,0x7c3,%l2		! %l2 = ffffffff00fff83c
!	Mem[0000000021800080] = ffeb5823, %l3 = 00000000ffff0000
	ldstub	[%o3+0x080],%l3		! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (25)
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l2 = 00fff83c, %l3 = 000000ff, Mem[0000000030141408] = 66e697ff 00000000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00fff83c 000000ff
!	Mem[0000000010041400] = 002d0000ff2d00ff, %l4 = ffffffffffffffff, %l4 = ffffffffffffffff
	casxa	[%i1]0x80,%l4,%l4	! %l4 = 002d0000ff2d00ff
!	Mem[0000000030141400] = 0000005f, %l2 = ffffffff00fff83c
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 0000005f000000ff
!	%f12 = ffffffff 00000055, Mem[0000000010081400] = 00000000 00000000
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff 00000055
!	Mem[00000000211c0001] = ffff6ca5, %l1 = b7edb6386a13cb52
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%f16 = 5f000000 000000ff 00000000 00000000
!	%f20 = 0000002f 40000000 aa84feb2 761ca310
!	%f24 = 36d6a1c8 996cc182 5f098316 aab5637a
!	%f28 = 6ffefb54 15f0db48 b2cbaccb ff97e666
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff832357f5, %f14 = 00000055 000000ff
	ldda	[%i5+%o4]0x80,%f14	! %f14 = 000000ff 832357f5

p0_label_139:
!	Mem[0000000010141420] = 000000ffff5ec188, %l5 = 0000000000000000
	ldx	[%i5+0x020],%l5		! %l5 = 000000ffff5ec188
!	Mem[0000000010001400] = ffffffff, %l6 = 00000000000000f5
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101400] = 000000ff, %l7 = ffffffffff000000
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00ff0000, %l1 = 00000000000000ff
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 0000006d, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 000000000000006d
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010101408] = 00000000, %l1 = 000000000000006d
	ldswa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l0 = 040a835faaa144a4
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010101408] = 0000000000000000, %f18 = 00000000 00000000
	ldda	[%i4+%o4]0x88,%f18	! %f18 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffff000000, Mem[0000000030101400] = 000000ff
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff

p0_label_140:
!	%l7 = 0000000000000000, Mem[0000000010101400] = 5f000000
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[000000001004141c] = ad794f5f, %l2 = 000000000000005f, %asi = 80
	swapa	[%i1+0x01c]%asi,%l2	! %l2 = 00000000ad794f5f
!	%l3 = 00000000000000ff, Mem[0000000010141408] = 000000ff832357f5
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l5 = 000000ffff5ec188, imm = 00000000000002dc, %l3 = 00000000000000ff
	add	%l5,0x2dc,%l3		! %l3 = 000000ffff5ec464
!	%l5 = 000000ffff5ec188, Mem[00000000300c1410] = ff000000
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = c1880000
!	%l5 = 000000ffff5ec188, immd = 0000000000000bed, %l4 = 002d0000ff2d00ff
	sdivx	%l5,0xbed,%l4		! %l4 = 00000000157744bc
!	%l0 = 00000000, %l1 = ff000000, Mem[0000000010141410] = ff00002f ff000000
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ff000000
!	%l6 = 000000000000ffff, Mem[00000000100c1410] = abc494ff
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffff94ff
!	Mem[0000000030101408] = 000000ff, %l5 = 000000ffff5ec188
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000 00000000, %l4 = 157744bc, %l5 = 000000ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_141:
!	Mem[0000000010081400] = ffffffff00000055, %f2  = 00000000 00000000
	ldda	[%i2+%g0]0x88,%f2 	! %f2  = ffffffff 00000055
!	Mem[0000000010081410] = 000000ff 000000ff, %l6 = 0000ffff, %l7 = 00000000
	ldd	[%i2+%o5],%l6		! %l6 = 00000000000000ff 00000000000000ff
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x78291077f264873a,%g7,%l0 ! %l0 = 78291077f264873a
!	%l1 = ffffffffff000000
	setx	0xae6a1d001627f413,%g7,%l1 ! %l1 = ae6a1d001627f413
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 78291077f264873a
	setx	0x699fd5affa843978,%g7,%l0 ! %l0 = 699fd5affa843978
!	%l1 = ae6a1d001627f413
	setx	0x70b89d700d047e04,%g7,%l1 ! %l1 = 70b89d700d047e04
!	Mem[0000000010181418] = 00000000 0000003e, %l6 = 000000ff, %l7 = 000000ff
	ldd	[%i6+0x018],%l6		! %l6 = 0000000000000000 000000000000003e
!	Mem[0000000030001408] = 000000ff ff000000, %l2 = ad794f5f, %l3 = ff5ec464
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Mem[00000000211c0000] = ffff6ca5, %l4 = 00000000ff000000
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081428] = a3c4c3b5d2612183, %f8  = 0000ff00 b7fb00db
	ldd	[%i2+0x028],%f8 	! %f8  = a3c4c3b5 d2612183
!	Mem[0000000010081408] = ffcdcbff, %f14 = 000000ff
	lda	[%i2+%o4]0x80,%f14	! %f14 = ffcdcbff
!	Mem[0000000010181408] = 55973e00, %l1 = 70b89d700d047e04
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000003e00
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 832357f5, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000832357f5

p0_label_142:
!	Mem[0000000010081410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l1 = 0000000000003e00, Mem[0000000010041400] = 00002d00
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00002d00
!	Mem[0000000010001400] = ffffffff, %l4 = 00000000, %l6 = 00000000
	casa	[%i0]0x80,%l4,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010181408] = 003e9755, %l0 = 699fd5affa843978
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000003e9755
!	%l2 = 00000000ff000000, Mem[0000000010081428] = a3c4c3b5d2612183
	stx	%l2,[%i2+0x028]		! Mem[0000000010081428] = 00000000ff000000
!	Mem[00000000100c140d] = 55000000, %l0 = 00000000003e9755
	ldstub	[%i3+0x00d],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141414] = ff000000, %l5 = 0000000000000000
	swap	[%i5+0x014],%l5		! %l5 = 00000000ff000000
!	%l3 = 00000000832357f5, Mem[0000000030101400] = 000000ff
	stba	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = f50000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 55000000, %f22 = aa84feb2
	lda	[%i2+%g0]0x80,%f22	! %f22 = 55000000

p0_label_143:
!	Mem[0000000010141408] = 00000000, %f11 = f2cdcbff
	lda	[%i5+%o4]0x88,%f11	! %f11 = 00000000
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000ff000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = b7fb00db, %l7 = 000000000000003e
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffffb7
!	Mem[00000000100c1408] = 0000ff55000000ff, %f2  = ffffffff 00000055
	ldda	[%i3+%o4]0x88,%f2 	! %f2  = 0000ff55 000000ff
!	Mem[0000000030101400] = f50000ff, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000f5
!	Mem[0000000030041410] = 0000002f, %l2 = 00000000ff000000
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = 000000000000002f
!	Mem[0000000010181408] = 000000c1783984fa, %l7 = ffffffffffffffb7
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = 000000c1783984fa
!	Mem[0000000010141410] = 00000000, %l3 = 00000000832357f5
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = c1880000, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffffc1
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000201c0000] = 52fff5e1, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000f5e1

p0_label_144:
!	Mem[0000000030081408] = 000000ff, %l4 = 00000000000000f5
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffc1, %l1 = 00003e00, Mem[0000000030041408] = 00000000 00000000
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffc1 00003e00
!	%f6  = 000000ff, Mem[0000000010041420] = 00000088
	st	%f6 ,[%i1+0x020]	! Mem[0000000010041420] = 000000ff
!	%l6 = 00000000ffffffff, Mem[0000000010081410] = ff0000ff000000ff
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ffffffff
!	Mem[0000000030041400] = 0000005f, %l6 = 00000000ffffffff
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 000000000000005f
!	%l7 = 000000c1783984fa, Mem[0000000030001400] = 6d000000
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = fa000000
!	%l2 = 000000000000002f, Mem[0000000010041408] = b7fb00db
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 002f00db
!	Mem[0000000010081430] = c8cebecc, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x030]%asi,%l3	! %l3 = 00000000c8cebecc
!	%f12 = ffffffff 00000055, Mem[0000000010001400] = ffffffff cc002f00
	std	%f12,[%i0+%g0]	! Mem[0000000010001400] = ffffffff 00000055
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000 0000003e 3cf8ff00 ff000000
!	Mem[0000000030141410] = 003e9755 ff572383 00000000 258f1300
!	Mem[0000000030141420] = 26c585c6 e5de446e 7e02f43a 00000000
!	Mem[0000000030141430] = 6d000000 ff5ec188 00002d3e 6f581540
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400

p0_label_145:
!	Mem[0000000030081408] = 000000f5, %l4 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000f5
!	Mem[0000000030181410] = ff000000, %l1 = 0000000000003e00
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010181410] = 0000002f00000000, %f6  = 000000ff 0000005f
	ldd	[%i6+%o5],%f6 		! %f6  = 0000002f 00000000
!	Mem[00000000100c1400] = 7555000000000055, %l3 = 00000000c8cebecc
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = 7555000000000055
!	Mem[0000000030181400] = ff002d3e, %l7 = 000000c1783984fa
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 66e69755, %l2 = 000000000000002f
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000055
!	Mem[0000000030081400] = 0000003e, %l6 = 000000000000005f
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 000000000000003e
!	Mem[0000000030181400] = ff002d3e00002ded, %l1 = ffffffffffffff00
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = ff002d3e00002ded
!	Mem[0000000030101410] = 0000ff00, %l1 = ff002d3e00002ded
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (27)
!	%l2 = 0000000000000055, Mem[0000000030141408] = 3cf8ff00
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 55f8ff00

p0_label_146:
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = ff0000ff000000ff
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffffffffff
!	%f8  = a3c4c3b5 d2612183, Mem[0000000010081410] = 00000000 ffffffff
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = a3c4c3b5 d2612183
!	%l1 = 000000000000ff00, Mem[0000000030081408] = 000000f5
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ff00
!	%l0 = ffffffffffffffc1, Mem[0000000010181408] = fa843978
	stwa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffc1
!	%l7 = ffffffffffffffff, Mem[0000000020800041] = 00007fe3
	stb	%l7,[%o1+0x041]		! Mem[0000000020800040] = 00ff7fe3
!	%l5 = 00000000000000ff, Mem[0000000030181408] = cc002f00
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = cc0000ff
!	Mem[0000000010041408] = 002f00db00000088, %l4 = 00000000000000f5, %l3 = 7555000000000055
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 002f00db00000088
!	%l6 = 000000000000003e, Mem[00000000100c1408] = ff00000055ff0000
	stxa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000003e
!	Mem[0000000030001410] = 66e69755, %l7 = ffffffffffffffff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000066e69755
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = c1ffffff003e0000, %f14 = ffcdcbff 832357f5
	ldda	[%i1+%o4]0x81,%f14	! %f14 = c1ffffff 003e0000

p0_label_147:
!	Mem[0000000030141410] = 003e9755, %l3 = 002f00db00000088
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 00000000003e9755
!	Mem[0000000010081408] = ffcdcbff00000000, %f6  = 0000002f 00000000
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = ffcdcbff 00000000
!	Mem[0000000030081408] = 0000ff00, %l7 = 0000000066e69755
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[00000000300c1408] = ffffffff, %f25 = c685c526
	lda	[%i3+%o4]0x89,%f25	! %f25 = ffffffff
!	Mem[0000000010181410] = 2f000000, %f6  = ffcdcbff
	lda	[%i6+%o5]0x88,%f6 	! %f6 = 2f000000
!	Mem[0000000010081410] = a3c4c3b5, %l6 = 000000000000003e
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000a3
!	Mem[0000000030141400] = ff000000, %l6 = 00000000000000a3
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = 0000003e, %l6 = ffffffffffffffff
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000003e
!	Mem[00000000201c0000] = 0000f5e1, %l3 = 00000000003e9755
	ldub	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff002d3e, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ff002d3e

p0_label_148:
!	%l2 = 0000000000000055, Mem[0000000030041410] = 0000002f40000000
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000055
!	%l0 = ffffffffffffffc1, Mem[0000000010041410] = ed2d0000
	stba	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = c12d0000
!	Mem[0000000010141410] = 00000000, %l7 = 000000000000ff00
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010041410] = c12d0000
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 00ff000000000000
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	%l4 = 000000f5, %l5 = 000000ff, Mem[0000000030041410] = 00000000 00000055
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000f5 000000ff
!	%l4 = 000000f5, %l5 = 000000ff, Mem[0000000010041400] = 00002d00 ff002dff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000f5 000000ff
!	Mem[0000000030081400] = 0000003e, %l4 = 00000000000000f5
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 000000000000003e
!	%f14 = c1ffffff, Mem[0000000030101408] = ff000000
	sta	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = c1ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 003e9755, %l1 = 000000000000ff00
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_149:
!	Mem[0000000030041400] = ffffffffff94c4ab, %f22 = 00138f25 00000000
	ldda	[%i1+%g0]0x81,%f22	! %f22 = ffffffff ff94c4ab
!	Mem[0000000030141400] = 3e000000000000ff, %f8  = a3c4c3b5 d2612183
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = 3e000000 000000ff
!	Mem[0000000010001410] = ffffffff ffffffff, %l0 = ffffffc1, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030041408] = c1ffffff, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000c1
!	Mem[0000000010001408] = ff000000, %l2 = 0000000000000055
	ldsba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c0] = c3ff86d6, %l6 = 000000000000003e
	ldsba	[%o3+0x1c1]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff6ca5, %l2 = 0000000000000000
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 2f000000, %l7 = 00000000000000c1
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 55000000ffffffff, %f0  = ed2d0000 cc00c9ff
	ldda	[%i2+0x000]%asi,%f0 	! %f0  = 55000000 ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ffffffc1, %l3 = 00000000ff002d3e
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 000000c1000000ff

p0_label_150:
!	%f6  = 2f000000, Mem[00000000300c1408] = ffffffff
	sta	%f6 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2f000000
!	%l6 = ffffffffffffffff, Mem[0000000030141408] = 000000ff00fff855
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffffff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%l3 = 00000000000000c1, Mem[0000000030081400] = 000000f5
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000c1
!	Mem[0000000010001408] = ff000000, %l1 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = ffffffff, %l2 = ffffffffffffffff
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[000000001010143c] = ff97e666, %l7 = 0000000000000000
	swap	[%i4+0x03c],%l7		! %l7 = 00000000ff97e666
!	Mem[0000000030001410] = ffffffff, %l0 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffcdcbff, %l2 = 00000000ffffffff
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stba	%l0,[%i6+0x020]%asi
	lduba	[%i3+0x011]%asi,%l1
	sdivx	%l0,%l2,%l1
	smul	%l5,%l1,%l4
	sdiv	%l4,0x4ea,%l0
	subc	%l7,%l6,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000c1
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000000000003e
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ff97e666
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffffff,%g2
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
	cmp	%l0,%l1			! %f0  should be 55000000 ffffffff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000ff55 000000ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 002d0000 ff2d00ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 2f000000 00000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 3e000000 000000ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 7f69ffff 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ffffffff 00000055
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be c1ffffff 003e0000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 3e000000 000000ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 000000ff 00fff83c
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 832357ff 55973e00
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ffffffff ff94c4ab
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 6e44dee5 ffffffff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 3af4027e
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 88c15eff 0000006d
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 4015586f 3e2d0000
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
	fcmps	%fcc3,%f3 ,%f14
	subc	%l5,-0x0c1,%l0
	sub	%l3,%l5,%l0
	fmuls	%f14,%f7 ,%f4 
	fadds	%f8 ,%f13,%f15
	fitod	%f8 ,%f10
	done

p0_trap1o:
	fcmps	%fcc3,%f3 ,%f14
	subc	%l5,-0x0c1,%l0
	sub	%l3,%l5,%l0
	fmuls	%f14,%f7 ,%f4 
	fadds	%f8 ,%f13,%f15
	fitod	%f8 ,%f10
	done


p0_trap2e:
	fsqrts	%f1 ,%f0 
	done

p0_trap2o:
	fsqrts	%f1 ,%f0 
	done


p0_trap3e:
	addc	%l2,%l4,%l4
	xor	%l1,%l4,%l4
	done

p0_trap3o:
	addc	%l2,%l4,%l4
	xor	%l1,%l4,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 8b3597e7a3c21a0f
	ldx	[%g1+0x008],%l1		! %l1 = 56250111da43a574
	ldx	[%g1+0x010],%l2		! %l2 = c99b79068f89e293
	ldx	[%g1+0x018],%l3		! %l3 = 8e09f69633127bcd
	ldx	[%g1+0x020],%l4		! %l4 = acd7d5aff5a93394
	ldx	[%g1+0x028],%l5		! %l5 = a6faa98c3180bf06
	ldx	[%g1+0x030],%l6		! %l6 = 3ad2da6a9bead260
	ldx	[%g1+0x038],%l7		! %l7 = 91ebbc0a5daf11bc

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
	fdivs	%f14,%f3 ,%f11
	smul	%l7,%l6,%l4
	smul	%l5,-0xda0,%l3
	subc	%l4,0xfc7,%l6
	jmpl	%o7,%g0
	fadds	%f8 ,%f13,%f15
p0_near_0_he:
	add	%l2,0xe8c,%l0
	xor	%l7,0x2b1,%l1
	fdivs	%f21,%f22,%f18
	add	%l5,-0xb4f,%l4
	sdivx	%l6,%l0,%l6
	subc	%l5,%l0,%l6
	orn	%l2,%l4,%l0
	jmpl	%o7,%g0
	sdivx	%l2,%l3,%l4
near0_b2b_h:
	jmpl	%o7,%g0
	udivx	%l6,0x33e,%l5
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	subc	%l2,-0x1ee,%l5
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	xnor	%l5,%l0,%l6
	jmpl	%o7,%g0
	fdivs	%f11,%f7 ,%f10
p0_near_1_he:
	umul	%l6,-0xd96,%l1
	fmuls	%f31,%f22,%f29
	fdivs	%f19,%f19,%f29
	jmpl	%o7,%g0
	smul	%l2,%l2,%l4
near1_b2b_h:
	fitos	%f17,%f23
	orn	%l2,-0x0eb,%l4
	jmpl	%o7,%g0
	xnor	%l4,-0x0cb,%l4
near1_b2b_l:
	fcmps	%fcc3,%f6 ,%f14
	fcmps	%fcc2,%f7 ,%f9 
	jmpl	%o7,%g0
	subc	%l3,%l6,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xor	%l0,-0x5c0,%l1
	sub	%l6,%l3,%l1
	xnor	%l5,%l0,%l5
	jmpl	%o7,%g0
	fcmps	%fcc0,%f14,%f14
p0_near_2_he:
	fadds	%f20,%f31,%f27
	fadds	%f25,%f19,%f22
	andn	%l0,%l2,%l4
	sub	%l3,-0x40f,%l0
	jmpl	%o7,%g0
	fdivs	%f23,%f19,%f22
near2_b2b_h:
	smul	%l6,%l1,%l2
	sub	%l4,%l6,%l7
	jmpl	%o7,%g0
	smul	%l0,0x371,%l6
near2_b2b_l:
	sdivx	%l5,-0x861,%l0
	orn	%l5,%l1,%l1
	jmpl	%o7,%g0
	and	%l1,-0x540,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	orn	%l0,%l3,%l2
	fcmps	%fcc0,%f9 ,%f0 
	jmpl	%o7,%g0
	fmuls	%f2 ,%f6 ,%f9 
p0_near_3_he:
	xor	%l7,%l2,%l2
	nop
	std	%l4,[%i6+0x010]		! Mem[0000000010181410]
	fsqrts	%f18,%f26
	fdivs	%f19,%f20,%f19
	jmpl	%o7,%g0
	xor	%l7,%l3,%l2
near3_b2b_h:
	or	%l0,-0xeb9,%l2
	fsqrts	%f25,%f29
	fdivs	%f26,%f28,%f24
	fdivs	%f25,%f26,%f17
	subc	%l2,%l6,%l2
	orn	%l4,0x6a8,%l1
	jmpl	%o7,%g0
	addc	%l2,%l4,%l5
near3_b2b_l:
	xor	%l3,0x920,%l1
	orn	%l2,-0x47f,%l4
	mulx	%l5,0xee8,%l2
	mulx	%l5,%l7,%l1
	addc	%l3,%l5,%l5
	fdivs	%f12,%f2 ,%f4 
	jmpl	%o7,%g0
	fcmps	%fcc2,%f11,%f7 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fsubs	%f4 ,%f5 ,%f0 
	xnor	%l6,%l6,%l1
	jmpl	%o7,%g0
	xnor	%l6,%l5,%l2
p0_far_0_lem:
	fsubs	%f4 ,%f5 ,%f0 
	xnor	%l6,%l6,%l1
	jmpl	%o7,%g0
	xnor	%l6,%l5,%l2
p0_far_0_he:
	jmpl	%o7,%g0
	mulx	%l7,-0xb37,%l1
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	mulx	%l7,-0xb37,%l1
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	fsubs	%f16,%f23,%f24
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f6 ,%f6 ,%f0 
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fsubs	%f10,%f15,%f6 
	subc	%l3,%l6,%l5
	xor	%l0,0xe06,%l2
	fadds	%f14,%f6 ,%f3 
	jmpl	%o7,%g0
	subc	%l5,-0x6a0,%l4
p0_far_1_lem:
	fsubs	%f10,%f15,%f6 
	subc	%l3,%l6,%l5
	xor	%l0,0xe06,%l2
	fadds	%f14,%f6 ,%f3 
	jmpl	%o7,%g0
	subc	%l5,-0x6a0,%l4
p0_far_1_he:
	umul	%l2,-0x508,%l2
	udivx	%l3,0x174,%l6
	mulx	%l1,%l7,%l2
	smul	%l5,%l3,%l1
	jmpl	%o7,%g0
	subc	%l4,0xa64,%l5
p0_far_1_hem:
	umul	%l2,-0x508,%l2
	udivx	%l3,0x174,%l6
	mulx	%l1,%l7,%l2
	smul	%l5,%l3,%l1
	jmpl	%o7,%g0
	subc	%l4,0xa64,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	jmpl	%o7,%g0
	and	%l2,%l7,%l3
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	subc	%l4,%l2,%l4
	jmpl	%o7,%g0
	nop
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	add	%l1,0xaaa,%l3
	jmpl	%o7,%g0
	nop
p0_far_2_lem:
	jmpl	%o7,%g0
	add	%l1,0xaaa,%l3
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	andn	%l3,%l7,%l7
	fmuls	%f20,%f19,%f24
	umul	%l1,%l6,%l6
	andn	%l1,%l5,%l1
	xnor	%l3,%l2,%l1
	jmpl	%o7,%g0
	xor	%l7,%l4,%l0
p0_far_2_hem:
	andn	%l3,%l7,%l7
	fmuls	%f20,%f19,%f24
	umul	%l1,%l6,%l6
	andn	%l1,%l5,%l1
	xnor	%l3,%l2,%l1
	jmpl	%o7,%g0
	xor	%l7,%l4,%l0
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fmuls	%f29,%f25,%f26
	xor	%l5,%l1,%l7
	jmpl	%o7,%g0
	addc	%l0,%l3,%l1
far2_b2b_l:
	fitos	%f10,%f4 
	subc	%l5,0x692,%l3
	jmpl	%o7,%g0
	andn	%l6,-0x114,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	sub	%l2,0xd24,%l3
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	sub	%l2,0xd24,%l3
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	addc	%l2,-0x900,%l3
	sub	%l6,0x4d7,%l2
	fsqrts	%f31,%f24
	subc	%l0,-0xbd9,%l0
	andn	%l1,0x7f0,%l1
	fcmps	%fcc2,%f29,%f27
	fsubs	%f21,%f27,%f20
	jmpl	%o7,%g0
	fadds	%f21,%f22,%f24
p0_far_3_hem:
	addc	%l2,-0x900,%l3
	sub	%l6,0x4d7,%l2
	fsqrts	%f31,%f24
	subc	%l0,-0xbd9,%l0
	andn	%l1,0x7f0,%l1
	fcmps	%fcc2,%f29,%f27
	fsubs	%f21,%f27,%f20
	jmpl	%o7,%g0
	fadds	%f21,%f22,%f24
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l5,%l6,%l6
	fdivs	%f23,%f25,%f27
	add	%l3,-0xa97,%l3
	fadds	%f28,%f25,%f22
	fadds	%f23,%f28,%f20
	fdivs	%f20,%f19,%f30
	jmpl	%o7,%g0
	fsqrts	%f26,%f28
far3_b2b_l:
	fadds	%f10,%f11,%f4 
	xnor	%l3,%l2,%l2
	fsubs	%f8 ,%f6 ,%f15
	xor	%l3,-0xa5e,%l2
	smul	%l0,%l7,%l2
	smul	%l1,0x23f,%l0
	jmpl	%o7,%g0
	xnor	%l3,%l1,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	subc	%l6,%l2,%l5
	fcmps	%fcc2,%f7 ,%f14
	xnor	%l3,-0x06e,%l3
	fdivs	%f15,%f6 ,%f13
	jmpl	%g6+8,%g0
	mulx	%l2,%l4,%l4
p0_call_0_le:
	add	%l6,%l2,%l7
	fitos	%f7 ,%f5 
	xor	%l1,0x7f2,%l1
	fcmps	%fcc0,%f6 ,%f6 
	udivx	%l6,%l6,%l1
	retl
	orn	%l2,%l4,%l6
p0_jmpl_0_lo:
	subc	%l6,%l2,%l5
	fcmps	%fcc2,%f7 ,%f14
	xnor	%l3,-0x06e,%l3
	fdivs	%f15,%f6 ,%f13
	jmpl	%g6+8,%g0
	mulx	%l2,%l4,%l4
p0_call_0_lo:
	add	%l6,%l2,%l7
	fitos	%f7 ,%f5 
	xor	%l1,0x7f2,%l1
	fcmps	%fcc0,%f6 ,%f6 
	udivx	%l6,%l6,%l1
	retl
	orn	%l2,%l4,%l6
p0_jmpl_0_he:
	xnor	%l4,%l0,%l3
	stx	%l0,[%i5+0x030]		! Mem[0000000010141430]
	jmpl	%g6+8,%g0
	xnor	%l7,%l2,%l0
p0_call_0_he:
	ldstub	[%o1+0x001],%l3		! Mem[0000000020800001]
	retl
	sub	%l4,%l2,%l2
p0_jmpl_0_ho:
	xnor	%l4,%l0,%l3
	stx	%l0,[%o5+0x030]		! Mem[0000000010141430]
	jmpl	%g6+8,%g0
	xnor	%l7,%l2,%l0
p0_call_0_ho:
	ldstub	[%i1+0x001],%l3		! Mem[0000000020800001]
	retl
	sub	%l4,%l2,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	add	%l0,%l0,%l6
	smul	%l4,-0x281,%l6
	sub	%l6,0x6a2,%l3
	or	%l0,-0xb2d,%l0
	nop
	mulx	%l7,%l2,%l1
	fstoi	%f7 ,%f2 
	jmpl	%g6+8,%g0
	and	%l5,-0x36f,%l6
p0_call_1_le:
	udivx	%l6,%l2,%l1
	retl
	subc	%l3,0x655,%l3
p0_jmpl_1_lo:
	add	%l0,%l0,%l6
	smul	%l4,-0x281,%l6
	sub	%l6,0x6a2,%l3
	or	%l0,-0xb2d,%l0
	nop
	mulx	%l7,%l2,%l1
	fstoi	%f7 ,%f2 
	jmpl	%g6+8,%g0
	and	%l5,-0x36f,%l6
p0_call_1_lo:
	udivx	%l6,%l2,%l1
	retl
	subc	%l3,0x655,%l3
p0_jmpl_1_he:
	xnor	%l1,%l3,%l1
	smul	%l7,0x5f2,%l1
	fdivs	%f22,%f21,%f20
	addc	%l6,%l4,%l4
	add	%l0,0x0d9,%l2
	jmpl	%g6+8,%g0
	addc	%l7,-0xe20,%l2
p0_call_1_he:
	retl
	mulx	%l3,%l7,%l5
p0_jmpl_1_ho:
	xnor	%l1,%l3,%l1
	smul	%l7,0x5f2,%l1
	fdivs	%f22,%f21,%f20
	addc	%l6,%l4,%l4
	add	%l0,0x0d9,%l2
	jmpl	%g6+8,%g0
	addc	%l7,-0xe20,%l2
p0_call_1_ho:
	retl
	mulx	%l3,%l7,%l5
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fcmps	%fcc3,%f14,%f4 
	jmpl	%g6+8,%g0
	xnor	%l5,%l2,%l5
p0_call_2_le:
	and	%l2,-0x407,%l5
	retl
	std	%f14,[%i5+0x010]	! Mem[0000000010141410]
p0_jmpl_2_lo:
	fcmps	%fcc3,%f14,%f4 
	jmpl	%g6+8,%g0
	xnor	%l5,%l2,%l5
p0_call_2_lo:
	and	%l2,-0x407,%l5
	retl
	std	%f14,[%o5+0x010]	! Mem[0000000010141410]
p0_jmpl_2_he:
	fcmps	%fcc3,%f27,%f29
	andn	%l0,-0x3b1,%l5
	sub	%l0,%l0,%l4
	mulx	%l6,-0x28b,%l7
	xnor	%l2,%l3,%l5
	fmuls	%f24,%f16,%f18
	fsubs	%f16,%f27,%f26
	jmpl	%g6+8,%g0
	fsqrts	%f30,%f19
p0_call_2_he:
	subc	%l6,%l4,%l2
	fsqrts	%f19,%f28
	retl
	fcmps	%fcc0,%f29,%f17
p0_jmpl_2_ho:
	fcmps	%fcc3,%f27,%f29
	andn	%l0,-0x3b1,%l5
	sub	%l0,%l0,%l4
	mulx	%l6,-0x28b,%l7
	xnor	%l2,%l3,%l5
	fmuls	%f24,%f16,%f18
	fsubs	%f16,%f27,%f26
	jmpl	%g6+8,%g0
	fsqrts	%f30,%f19
p0_call_2_ho:
	subc	%l6,%l4,%l2
	fsqrts	%f19,%f28
	retl
	fcmps	%fcc0,%f29,%f17
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	std	%f8 ,[%i4+0x028]	! Mem[0000000010101428]
	fcmps	%fcc1,%f2 ,%f3 
	jmpl	%g6+8,%g0
	orn	%l4,-0xc1e,%l1
p0_call_3_le:
	fsqrts	%f12,%f0 
	retl
	mulx	%l1,%l5,%l5
p0_jmpl_3_lo:
	std	%f8 ,[%o4+0x028]	! Mem[0000000010101428]
	fcmps	%fcc1,%f2 ,%f3 
	jmpl	%g6+8,%g0
	orn	%l4,-0xc1e,%l1
p0_call_3_lo:
	fsqrts	%f12,%f0 
	retl
	mulx	%l1,%l5,%l5
p0_jmpl_3_he:
	smul	%l6,-0xf8c,%l3
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f28,%f27
p0_call_3_he:
	fsubs	%f18,%f24,%f21
	retl
	xnor	%l2,0x89a,%l1
p0_jmpl_3_ho:
	smul	%l6,-0xf8c,%l3
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f28,%f27
p0_call_3_ho:
	fsubs	%f18,%f24,%f21
	retl
	xnor	%l2,0x89a,%l1
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
	.word	0x8b3597e7,0xa3c21a0f		! Init value for %l0
	.word	0x56250111,0xda43a574		! Init value for %l1
	.word	0xc99b7906,0x8f89e293		! Init value for %l2
	.word	0x8e09f696,0x33127bcd		! Init value for %l3
	.word	0xacd7d5af,0xf5a93394		! Init value for %l4
	.word	0xa6faa98c,0x3180bf06		! Init value for %l5
	.word	0x3ad2da6a,0x9bead260		! Init value for %l6
	.word	0x91ebbc0a,0x5daf11bc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xfe404be9,0xe15ff053		! Init value for %f0 
	.word	0x4c7409d6,0xfaf1fd1d		! Init value for %f2 
	.word	0xc0dd6dad,0xac4afc78		! Init value for %f4 
	.word	0x66e69755,0xabc494e6		! Init value for %f6 
	.word	0x9b3da965,0x49f66542		! Init value for %f8 
	.word	0xd5798c2a,0x8c640302		! Init value for %f10
	.word	0x2ddbe38d,0x11c9ce6c		! Init value for %f12
	.word	0xfa897263,0xff007ac4		! Init value for %f14
	.word	0x1a5e06f5,0x024d0e79		! Init value for %f16
	.word	0x7ec1827f,0xba63f429		! Init value for %f18
	.word	0x79712c98,0x1e002b42		! Init value for %f20
	.word	0x6a65fdce,0xad3359d4		! Init value for %f22
	.word	0x1aa3d4c8,0x60cf7529		! Init value for %f24
	.word	0xa3f8d4e4,0x412a4443		! Init value for %f26
	.word	0x80b96942,0x812fd83f		! Init value for %f28
	.word	0xfa50418d,0x05b6d313		! Init value for %f30
	.word	0x94ad1c1c,0xd7cfd5cd		! Init value for %f32
	.word	0x498c63e2,0x166f67c7		! Init value for %f34
	.word	0x4f58c117,0xd70ef967		! Init value for %f36
	.word	0x625005b1,0x34ed13b9		! Init value for %f38
	.word	0xd70f8fb2,0x3847586c		! Init value for %f40
	.word	0x73caa9ae,0xc01dc268		! Init value for %f42
	.word	0x98dee8ff,0x9f025c36		! Init value for %f44
	.word	0x87a2d8ec,0x0674e1ce		! Init value for %f46
	.word	0x1423f4d5,0xd1f87e23
	.word	0x33f4b691,0x2a2a4ab1
	.word	0x6782f3b3,0x2e378eae
	.word	0x2b3d41d4,0x0981b7fe
	.word	0xbbcdbbea,0x8f95b85d
	.word	0x0ed45f99,0x6e919da8
	.word	0x9eee654d,0x13783405
	.word	0xdb6c0028,0x861a5b21
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
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000c1
	.word	0x00000000,0x0000003e
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0xff97e666
p0_expected_fp_regs:
	.word	0x55000000,0xffffffff
	.word	0x0000ff55,0x000000ff
	.word	0x002d0000,0xff2d00ff
	.word	0x2f000000,0x00000000
	.word	0x3e000000,0x000000ff
	.word	0x7f69ffff,0x00000000
	.word	0xffffffff,0x00000055
	.word	0xc1ffffff,0x003e0000
	.word	0x3e000000,0x000000ff
	.word	0x000000ff,0x00fff83c
	.word	0x832357ff,0x55973e00
	.word	0xffffffff,0xff94c4ab
	.word	0x6e44dee5,0xffffffff
	.word	0x00000000,0x3af4027e
	.word	0x88c15eff,0x0000006d
	.word	0x4015586f,0x3e2d0000
	.word	0x00000026,0x00000800		! %fsr = 0000002600000800
p0_local0_expect:
	.word	0xffffffff,0x00000055
	.word	0xff0000ff,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0xffed21b2,0x00000075
	.word	0xffff0045,0x3e2d00ff
	.word	0x00000000,0x000000ff
	.word	0xf5afc8a4,0x771290dc
	.word	0x75000000,0x0000002d
p0_local0_sec_expect:
	.word	0xfa000000,0x00000000
	.word	0x000000ff,0xff000000
	.word	0xffffffff,0x5597e666
	.word	0x872e8493,0xf2cdcb03
	.word	0xf5afc8a4,0x771290dc
	.word	0xffcbcdf2,0x93842e87
	.word	0xce7891d9,0x5be790f8
	.word	0x0000c5c8,0x0000c977
p0_local1_expect:
	.word	0xf5000000,0xff000000
	.word	0x002f00db,0x00000088
	.word	0x000000ff,0xcc00c9ff
	.word	0x00000000,0x0000005f
	.word	0x000000ff,0x5fb65974
	.word	0x42a7327b,0x3af4027e
	.word	0xc9000000,0x0000fbe9
	.word	0x4015586f,0x28000000
p0_local1_sec_expect:
	.word	0xffffffff,0xff94c4ab
	.word	0xc1ffffff,0x003e0000
	.word	0x000000f5,0x000000ff
	.word	0xaa84feb2,0x761ca310
	.word	0x36d6a1c8,0x996cc182
	.word	0x5f098316,0xaab5637a
	.word	0x6ffefb54,0x15f0db48
	.word	0xb2cbaccb,0x6f7a03c6
p0_local2_expect:
	.word	0x55000000,0xffffffff
	.word	0xffcdcbff,0x00000000
	.word	0xa3c4c3b5,0xd2612183
	.word	0xffffffff,0xcc002f00
	.word	0xd972d7d5,0x0000004c
	.word	0x00000000,0xff000000
	.word	0x00000000,0x2dffffed
	.word	0x6d000000,0x4d42ff0b
p0_local2_sec_expect:
	.word	0xc1000000,0x5597e666
	.word	0x00ff0000,0xffb90000
	.word	0x00000000,0x0000002f
	.word	0xb204ec0a,0x1018af1c
	.word	0xeb5e29a1,0xeff8ddec
	.word	0xbd468381,0x4b2a025f
	.word	0x0ae9e55a,0x1aaac9ab
	.word	0x8ed9d39e,0x708cc338
p0_local3_expect:
	.word	0x55000000,0x00005575
	.word	0x00000000,0x0000003e
	.word	0xffff94ff,0x0000005f
	.word	0x00000000,0xff5723ff
	.word	0xdb00fbb7,0x4dff720b
	.word	0xffcbcdf2,0x93842e87
	.word	0xf8ca4c8f,0xff22f89f
	.word	0x568f4e05,0xa4c8aff5
p0_local3_sec_expect:
	.word	0xffffffeb,0x0000006d
	.word	0x2f000000,0xffffffff
	.word	0xc1880000,0x0000006e
	.word	0xecebef69,0x827dbc4c
	.word	0x09488ecb,0xb778e99e
	.word	0x9f3b0db9,0xcb14511c
	.word	0x5143aa23,0x28a010da
	.word	0x05086044,0xd43a2725
p0_local4_expect:
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x0000002f,0x40000000
	.word	0xaa84feb2,0x761ca310
	.word	0x36d6a1c8,0x996cc182
	.word	0x5f098316,0xaab5637a
	.word	0x6ffefb54,0x15f0db48
	.word	0xb2cbaccb,0x00000000
p0_local4_sec_expect:
	.word	0xf50000ff,0xf2cdcb03
	.word	0xffffffff,0x00000000
	.word	0x00ff0000,0x00000000
	.word	0xff94c4ab,0x00000075
	.word	0x88c15eff,0xff000000
	.word	0x00002d3e,0xff000000
	.word	0x03cbcdf2,0x93842e87
	.word	0xad01c571,0x26c585c6
p0_local5_expect:
	.word	0xff000042,0x3e000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x75000000,0xabc494ff
	.word	0x000000ff,0xff5ec188
	.word	0x832357ff,0x5597e666
	.word	0x0000005f,0x000000ff
	.word	0xc685c526,0x71c501ad
p0_local5_sec_expect:
	.word	0xff000000,0x0000003e
	.word	0xffffffff,0xffffffff
	.word	0x003e9755,0xff572383
	.word	0x00000000,0x258f1300
	.word	0x26c585c6,0xe5de446e
	.word	0x7e02f43a,0x00000000
	.word	0x6d000000,0xff5ec188
	.word	0x00002d3e,0x6f581540
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0xffffffc1,0xc1000000
	.word	0x0000002f,0x00000000
	.word	0x00000000,0x0000003e
	.word	0xf5afc8a4,0x771290dc
	.word	0xc8ceffcc,0x2dffffed
	.word	0x20341ec6,0x832357f5
	.word	0xffffffff,0xcc00c9c8
p0_local6_sec_expect:
	.word	0xff000000,0x00002ded
	.word	0xff0000cc,0xffffffff
	.word	0xff000000,0x00000000
	.word	0x03cbcdf2,0x93842e87
	.word	0xdc901277,0xa4c8aff5
	.word	0xedffff2d,0xccbecec8
	.word	0xf5572383,0xc61e3420
	.word	0xc8c900cc,0xffffffff
share0_expect:
	.word	0x0000f5e1,0x0a388215
	.word	0xad5ffedd,0x9e18c7ea
	.word	0x1e8cb671,0xb04d94eb
	.word	0x8e47c891,0x280d50c6
	.word	0x3cf51130,0xe735e67e
	.word	0xbc75af62,0x40e5ec6e
	.word	0xc4259e2c,0x53cad15f
	.word	0x2969e752,0xfbeff27d
share1_expect:
	.word	0x5709e181,0xa71f5f41
	.word	0xd8c6fd1e,0xac1f1a42
	.word	0xf9e27ff4,0xe90d670f
	.word	0x3f305b72,0x809fcd0a
	.word	0x42ad5c37,0x24fd64c1
	.word	0x88a950d4,0x0a32839b
	.word	0xd1bc4dac,0x7c651c12
	.word	0xa3158da2,0x388e8252
	.word	0x00ff7fe3,0xc0fe2182
	.word	0x2885213f,0xd3edbbd1
	.word	0x88afae71,0x7705f058
	.word	0xb67b8d76,0xca101125
	.word	0x9523ebcb,0xe94a9647
	.word	0x70faca35,0x36ae8840
	.word	0x4266465c,0xf79d347f
	.word	0x2bab65e2,0x23a8ec02
share2_expect:
	.word	0xffff6ca5,0x14ca1c87
	.word	0x59c069a8,0xa2bc7f37
	.word	0xdade7279,0xbe794b1c
	.word	0x1f6b6ad3,0x4cb2ebde
	.word	0x18b3baa7,0xb58cf87e
	.word	0x75970808,0xa8e5c17d
	.word	0xa2a6ecb0,0xb95e2963
	.word	0x524225ee,0x14ca5f58
share3_expect:
	.word	0x00b731c9,0xa5627358
	.word	0x989d0978,0x8db3b7aa
	.word	0xd2c67380,0x5f1d7be1
	.word	0x86d63747,0x756c6ab1
	.word	0xaeb53865,0x6cb6742a
	.word	0x9a5326ad,0x9121efd1
	.word	0x6483a243,0x00131b11
	.word	0x5a578979,0xc8b0cd86
	.word	0x000079c9,0x04b85533
	.word	0x7102b66e,0xf1aa1e32
	.word	0xb18b52a3,0xc4a20ce1
	.word	0x46b3ea93,0x91a27578
	.word	0xa621fae2,0x927722e5
	.word	0x872d5f69,0xa81832ce
	.word	0xab1b2e4b,0x0ae60c1f
	.word	0x7d73d3e8,0xbde91907
	.word	0xffeb5823,0xa23702d2
	.word	0xdc353f78,0xbe3d94e0
	.word	0xae7edc79,0xb9b75966
	.word	0x4c32c3d5,0xd3bcb6a5
	.word	0x7403c3c1,0x02039467
	.word	0xa6527ca1,0xbe4aa7d8
	.word	0xd62766b4,0xf992ee32
	.word	0x9202c9bc,0x65fea40e
	.word	0xff69d8f4,0x11492c51
	.word	0xc8a19586,0xd638e2a9
	.word	0x03fa40b4,0x4a9f760b
	.word	0x6881276e,0x0fb1abe0
	.word	0xdf44b71b,0x71e6bcfb
	.word	0x78a833dd,0x93e2c6e9
	.word	0x5b6cdaaa,0xa052eeaf
	.word	0x9573d715,0x808fe485
	.word	0xb9ff70fe,0x3055d1d6
	.word	0x19fc98c9,0x60adb5c3
	.word	0xaed2698f,0xd32cd8a6
	.word	0x59ce589f,0xe5d4e72d
	.word	0xcdfe956e,0x1d270a37
	.word	0x27f59cdb,0xd6e639fe
	.word	0x9f5601bc,0x9ba0c0eb
	.word	0x1274a6ea,0x8b949dfa
	.word	0xf6ff3528,0x5c44528d
	.word	0xbbe7c510,0x20c289ce
	.word	0xa5d27f00,0xf04c335d
	.word	0x017897ba,0xcd86653a
	.word	0x65afaa93,0x16054f35
	.word	0x8b6252b1,0x890f2934
	.word	0x6ae51340,0x961dae9e
	.word	0xc6fdcc50,0xa99b0973
	.word	0x39412b6a,0x6ecc3149
	.word	0x565fca92,0x8fa06a1a
	.word	0x01b5c4cb,0x40d56031
	.word	0x58f32c61,0xbeb4300f
	.word	0x8d88207c,0xfb1365e3
	.word	0xd420c057,0x5272cc1b
	.word	0xf0b00bb6,0x4eafc361
	.word	0xa4b8a533,0xebaf99df
	.word	0xc3ff86d6,0xc21154f7
	.word	0x22b22740,0x8cbad3da
	.word	0x83237828,0xafba1ed2
	.word	0x317a1557,0x8cf51abe
	.word	0x23d791c5,0x50c9a5a1
	.word	0xa05bd338,0x14b01e13
	.word	0xc5a55917,0x40b102f6
	.word	0x008a9509,0x5dcb0ba7
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
	.word	0x751b9207,0xd88f3ede
	.word	0x00000000,0x00000002
	.word	0x640f07b0,0x641c9f0a
	.word	0x00000000,0x00000003
	.word	0x95f51a38,0x3c28cfb9
	.word	0x00000000,0x00000004
	.word	0x042a6737,0x9caf0f0a
	.word	0x00000000,0x00000005
	.word	0xbf1abc10,0x740d18f9
	.word	0x00000000,0x00000006
	.word	0x66bf486f,0x92e85c60
	.word	0x00000000,0x00000007
	.word	0xeadc3510,0x7a485a61
	.word	0x00000000,0x00000008
	.word	0x35010058,0x31cea981
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
	.word	0x47e6d748,0xa9997bb0,0xa6656aec,0xc61e3420
	.word	0xbe6dff1e,0x5c06e595,0xbeb72a72,0x48820868
	.word	0x6df6c2c9,0x625702e7,0x6b5c1a83,0x38d0cbec
	.word	0x20da1908,0x67476ccf,0xad01c571,0x26c585c6
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
	.word	0x7501e881,0x2fd97683,0x41b5aeb9,0x081e73af
	.word	0x0e3dea20,0x4d21e627,0x0859f0e0,0xb926d93d
	.word	0x6160d9fb,0x36119839,0x459e9c09,0x16e5d2de
	.word	0xfcade25c,0xe072d5f5,0x15e4f291,0x9dfcd0e6
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
	.word	0x2ace19b3,0xad794f5f,0xa765890e,0x0fa9fc44
	.word	0x26f74f52,0xc7916701,0xb7fb00db,0x1a1368fc
	.word	0x7f5b4d63,0x5fb65974,0x42a7327b,0x3af4027e
	.word	0x41ecb9e0,0x9109f485,0xf115586f,0xae6ee463
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
	.word	0x7c4ece55,0xea2b090f,0x5f32d010,0x5898a632
	.word	0x53f2069f,0x9d9bb676,0xaa84feb2,0x761ca310
	.word	0x36d6a1c8,0x996cc182,0x5f098316,0xaab5637a
	.word	0x6ffefb54,0x15f0db48,0xb2cbaccb,0x6f7a03c6
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
	.word	0xd99178ce,0xf6cf53c4,0x995ec188,0xdaef9282
	.word	0x4e5b5089,0xa17ddc21,0xf8a2380a,0xb9a941d2
	.word	0xd972d7d5,0x2dd0e715,0xa3c4c3b5,0xd2612183
	.word	0x2f73f64f,0x15026e8c,0xdedcd297,0xd3d1ac9b
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
	.word	0x553d9107,0xf8689005,0xa4c8aff5,0xd941fd77
	.word	0xd8650bbf,0xd1a2fb9a,0xb204ec0a,0x1018af1c
	.word	0xeb5e29a1,0xeff8ddec,0xbd468381,0x4b2a025f
	.word	0x0ae9e55a,0x1aaac9ab,0x8ed9d39e,0x708cc338
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
	.word	0x45c0c745,0xf0fa9075,0x6acd3744,0x5fe82999
	.word	0x62842646,0xb16b1eec,0x6b0547a0,0x8b53f310
	.word	0x81da077a,0x9fc5c897,0xe627c24b,0x9e3f378c
	.word	0x9af82241,0x8f4ccaf8,0xbb2d5a5e,0x568f4e05
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
	.word	0x8e93a54d,0x501d983e,0x67777b67,0x72dd1cb4
	.word	0xc486350b,0xa82fc6be,0xecebef69,0x827dbc4c
	.word	0x09488ecb,0xb778e99e,0x9f3b0db9,0xcb14511c
	.word	0x5143aa23,0x28a010da,0x05086044,0xd43a2725
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
	.word	0x87c86c19,0x49ab3c82,0x42cb47db,0x2b32282e
	.word	0x4cf81df7,0xf136a371,0xe3ae467b,0xf2cdcb03
	.word	0xb43671e0,0x771290dc,0xc8cebecc,0x8c3855b4
	.word	0x107ed60d,0xb565b7b1,0x1198ad0d,0x8cb03c43
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
	.word	0x076757ba,0x712bedc7,0x8204c21c,0x44d14edc
	.word	0x83665fc2,0x872e8493,0xa0e9002b,0xf5572383
	.word	0x750df918,0xe182ed45,0xd5c38f39,0x76d8a6f4
	.word	0x63550c07,0xd193eb58,0x04489dfb,0x04763e1b
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
	.word	0x20c913c2,0xc5c8722c,0xc9777558,0x3f98fef2
	.word	0x2db19af6,0x5be790f8,0x510d1b7c,0x7313ca4e
	.word	0x5f514d5c,0x33bda438,0xe0dc4c4d,0x781832bb
	.word	0x86f55af1,0xb34fb149,0x17bc2410,0x9e037e63
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
	.word	0xda0e2e46,0x37bf0970,0xf7a09c37,0x9bb6229a
	.word	0xfe374808,0x26ac68d0,0x19ac604e,0x95d55b18
	.word	0xa90db231,0x2180f63f,0x5420f09d,0x0aeff173
	.word	0x43029b6f,0x2f3e883b,0xb70534a0,0x78a230d1
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
	.word	0x96f4972d,0x80d089c5,0x2f5cac84,0x24d92ad3
	.word	0x8999a672,0x001d2690,0xc0914c21,0x6251ac6b
	.word	0xc47434b8,0x12d254b1,0x1ae56785,0xbef76aa4
	.word	0x45380f60,0xab34f7d3,0x3f04807e,0x5f5f84e6
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
	.word	0x8a79bf86,0x99b23db0,0xa9287a4b,0x3664ec96
	.word	0x7eb82286,0xf53d6f7e,0xc365e74e,0xd7ba69fa
	.word	0xbd5b9a13,0x9ae7419c,0x609351ef,0xda226fcd
	.word	0x4715351f,0xbc49d9ef,0xb49b28e5,0x0d90af49
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
	.word	0x2a5ff5e1,0x0a388215,0xad5ffedd,0x9e18c7ea
	.word	0x1e8cb671,0xb04d94eb,0x8e47c891,0x280d50c6
	.word	0x3cf51130,0xe735e67e,0xbc75af62,0x40e5ec6e
	.word	0xc4259e2c,0x53cad15f,0x2969e752,0xfbeff27d
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
	.word	0x6025e181,0xa71f5f41,0xd8c6fd1e,0xac1f1a42
	.word	0xf9e27ff4,0xe90d670f,0x3f305b72,0x809fcd0a
	.word	0x42ad5c37,0x24fd64c1,0x88a950d4,0x0a32839b
	.word	0xd1bc4dac,0x7c651c12,0xa3158da2,0x388e8252
	.word	0x38ca7fe3,0xc0fe2182,0x2885213f,0xd3edbbd1
	.word	0x88afae71,0x7705f058,0xb67b8d76,0xca101125
	.word	0x9523ebcb,0xe94a9647,0x70faca35,0x36ae8840
	.word	0x4266465c,0xf79d347f,0x2bab65e2,0x23a8ec02
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
	.word	0x889f6ca5,0x14ca1c87,0x59c069a8,0xa2bc7f37
	.word	0xdade7279,0xbe794b1c,0x1f6b6ad3,0x4cb2ebde
	.word	0x18b3baa7,0xb58cf87e,0x75970808,0xa8e5c17d
	.word	0xa2a6ecb0,0xb95e2963,0x524225ee,0x14ca5f58
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
	.word	0xb0b731c9,0xa5627358,0x989d0978,0x8db3b7aa
	.word	0xd2c67380,0x5f1d7be1,0x86d63747,0x756c6ab1
	.word	0xaeb53865,0x6cb6742a,0x9a5326ad,0x9121efd1
	.word	0x6483a243,0x00131b11,0x5a578979,0xc8b0cd86
	.word	0x6f2e79c9,0x04b85533,0x7102b66e,0xf1aa1e32
	.word	0xb18b52a3,0xc4a20ce1,0x46b3ea93,0x91a27578
	.word	0xa621fae2,0x927722e5,0x872d5f69,0xa81832ce
	.word	0xab1b2e4b,0x0ae60c1f,0x7d73d3e8,0xbde91907
	.word	0xd6eb5823,0xa23702d2,0xdc353f78,0xbe3d94e0
	.word	0xae7edc79,0xb9b75966,0x4c32c3d5,0xd3bcb6a5
	.word	0x7403c3c1,0x02039467,0xa6527ca1,0xbe4aa7d8
	.word	0xd62766b4,0xf992ee32,0x9202c9bc,0x65fea40e
	.word	0x5f69d8f4,0x11492c51,0xc8a19586,0xd638e2a9
	.word	0x03fa40b4,0x4a9f760b,0x6881276e,0x0fb1abe0
	.word	0xdf44b71b,0x71e6bcfb,0x78a833dd,0x93e2c6e9
	.word	0x5b6cdaaa,0xa052eeaf,0x9573d715,0x808fe485
	.word	0xb94770fe,0x3055d1d6,0x19fc98c9,0x60adb5c3
	.word	0xaed2698f,0xd32cd8a6,0x59ce589f,0xe5d4e72d
	.word	0xcdfe956e,0x1d270a37,0x27f59cdb,0xd6e639fe
	.word	0x9f5601bc,0x9ba0c0eb,0x1274a6ea,0x8b949dfa
	.word	0xf6e63528,0x5c44528d,0xbbe7c510,0x20c289ce
	.word	0xa5d27f00,0xf04c335d,0x017897ba,0xcd86653a
	.word	0x65afaa93,0x16054f35,0x8b6252b1,0x890f2934
	.word	0x6ae51340,0x961dae9e,0xc6fdcc50,0xa99b0973
	.word	0x39412b6a,0x6ecc3149,0x565fca92,0x8fa06a1a
	.word	0x01b5c4cb,0x40d56031,0x58f32c61,0xbeb4300f
	.word	0x8d88207c,0xfb1365e3,0xd420c057,0x5272cc1b
	.word	0xf0b00bb6,0x4eafc361,0xa4b8a533,0xebaf99df
	.word	0xc38f86d6,0xc21154f7,0x22b22740,0x8cbad3da
	.word	0x83237828,0xafba1ed2,0x317a1557,0x8cf51abe
	.word	0x23d791c5,0x50c9a5a1,0xa05bd338,0x14b01e13
	.word	0xc5a55917,0x40b102f6,0x008a9509,0x5dcb0ba7
share3_end:
