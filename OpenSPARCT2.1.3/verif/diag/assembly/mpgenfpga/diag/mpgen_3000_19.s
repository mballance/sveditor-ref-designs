/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_19.s
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
!	Seed = 327144541
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_19.s created on Mar 27, 2009 (14:45:41)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_19 -p 1 -l 3000

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
!	%f0  = b6676252 8a83776e 3dc8ce54 0d3979d8
!	%f4  = c84ecf72 9c431712 2dbdf489 03b54f8d
!	%f8  = e36b8f98 bb1f4708 52a8cdbd af2f2d12
!	%f12 = c01458ad 0c37b12f 2ec37420 007f4ffe
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 43bc2821 d1f2b6bd 0f6c4ace 5c5af8b6
!	%f20 = 9595e585 3d02f0de 759de8e9 365480bc
!	%f24 = 3a845c9e d6ffc78a e40ee32b 53b75484
!	%f28 = 9a92a3ec 6ddb114c f0fd5b6c e6f2585f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 6564e2f7 036e6963 ee528d12 074c0485
!	%f36 = 2d0d26c1 63b54486 ae2d7faf a9166c8b
!	%f40 = d5c308a7 a86d17a9 ca568af2 b6c47aea
!	%f44 = c9450d80 3a37e3eb fff82721 5a85ff3a
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x8cad9c3800000009,%g7,%g1 ! GSR scale =  1, align = 1
	wr	%g1,%g0,%gsr		! GSR = 8cad9c3800000009
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l7 = c996b5e239d01844, Mem[0000000030181400] = d4c6be3c
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 1844be3c
!	Mem[0000000010001420] = cce7181d, %l4 = d6af4185c2f18f19
	lduha	[%i0+0x022]%asi,%l4	! %l4 = 000000000000181d
!	%l0 = 796a3c0d, %l1 = 62dc5403, Mem[0000000030141400] = 52bc7711 a2199f3c
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 796a3c0d 62dc5403
!	Mem[0000000010081414] = 4bdf8c9a, %l3 = cb28e64fea7dc761
	lduha	[%i2+0x016]%asi,%l3	! %l3 = 0000000000008c9a
!	%f1  = 8a83776e, Mem[0000000010181408] = 935c30d0
	st	%f1 ,[%i6+%o4]		! Mem[0000000010181408] = 8a83776e
!	Mem[0000000021800040] = d91b856a, %l4 = 000000000000181d
	ldub	[%o3+0x041],%l4		! %l4 = 000000000000001b
!	%f5  = 9c431712, Mem[0000000030181408] = 3053c8fa
	sta	%f5 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 9c431712
!	Mem[0000000010141400] = d7013e6a9f13630b, %l7 = c996b5e239d01844, %l6 = 0b8253045add27a6
	casxa	[%i5]0x80,%l7,%l6	! %l6 = d7013e6a9f13630b
!	Mem[00000000100c1400] = d57f77b8, %f21 = 3d02f0de
	lda	[%i3+%g0]0x88,%f21	! %f21 = d57f77b8
!	Starting 10 instruction Store Burst
!	%l2 = 7cbb9ac42227a401, Mem[0000000010181408] = 6e77838a
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 2227a401

p0_label_2:
!	%l5 = f874f9669e6f5b68, Mem[0000000010141410] = 7151927c
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 9e6f5b68
!	%l6 = 9f13630b, %l7 = 39d01844, Mem[0000000030001408] = 44981409 d283ce1c
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 9f13630b 39d01844
!	%l2 = 7cbb9ac42227a401, Mem[0000000030181400] = 1844be3c
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 2227a401
!	%l4 = 000000000000001b, imm = fffffffffffff454, %l1 = 2b27ea2462dc5403
	andn	%l4,-0xbac,%l1		! %l1 = 000000000000000b
!	%l1 = 000000000000000b, Mem[0000000010041408] = 99004cd9
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 000b4cd9
!	%l2 = 7cbb9ac42227a401, Mem[00000000100c1408] = ff138ff3cc81e4c9
	stxa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 7cbb9ac42227a401
!	%f24 = 3a845c9e d6ffc78a, %l6 = d7013e6a9f13630b
!	Mem[0000000010141428] = 46bd640d4a572233
	add	%i5,0x028,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141428] = 8ac764d64a572233
!	Mem[000000001004141a] = baec0bc8, %l3 = 0000000000008c9a
	ldstuba	[%i1+0x01a]%asi,%l3	! %l3 = 0000000b000000ff
!	%f22 = 759de8e9 365480bc, Mem[0000000010081428] = b8cb577f ed3a5f02
	stda	%f22,[%i2+0x028]%asi	! Mem[0000000010081428] = 759de8e9 365480bc
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 01a42722, %l6 = d7013e6a9f13630b
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000001

p0_label_3:
!	Mem[0000000010081420] = bd66d286, %l1 = 000000000000000b
	ldub	[%i2+0x020],%l1		! %l1 = 00000000000000bd
!	Mem[00000000211c0000] = 5418d61d, %l6 = 0000000000000001
	ldsb	[%o2+0x001],%l6		! %l6 = 0000000000000018
!	Mem[0000000010041410] = dd060c89 0ffd8287, %l4 = 0000001b, %l5 = 9e6f5b68
	ldda	[%i1+0x010]%asi,%l4	! %l4 = 00000000dd060c89 000000000ffd8287
!	Mem[0000000010081420] = bd66d286, %l3 = 000000000000000b
	ldsb	[%i2+0x023],%l3		! %l3 = ffffffffffffff86
!	Mem[0000000020800000] = 4698b0a2, %l0 = 53b56d46796a3c0d
	ldub	[%o1+%g0],%l0		! %l0 = 0000000000000046
!	Mem[00000000300c1408] = d88e3083, %l6 = 0000000000000018
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000003083
!	Mem[0000000010181410] = 591ce98e 923563dc, %l2 = 2227a401, %l3 = ffffff86
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000591ce98e 00000000923563dc
!	Mem[0000000010041408] = 000b4cd9, %l7 = c996b5e239d01844
	lduw	[%i1+%o4],%l7		! %l7 = 00000000000b4cd9
!	Mem[00000000100c1410] = 101228b1fa66ebe7, %l0 = 0000000000000046
	ldxa	[%i3+%o5]0x88,%l0	! %l0 = 101228b1fa66ebe7
!	Starting 10 instruction Store Burst
!	%l2 = 00000000591ce98e, Mem[0000000010001410] = e74713f3388ccb8f
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000591ce98e

p0_label_4:
!	%l0 = fa66ebe7, %l1 = 000000bd, Mem[0000000010141408] = ccdfdf66 a617c9e5
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = fa66ebe7 000000bd
!	%f16 = 43bc2821 d1f2b6bd, Mem[00000000100c1408] = 01a42722 c49abb7c
	std	%f16,[%i3+%o4]	! Mem[00000000100c1408] = 43bc2821 d1f2b6bd
!	%l2 = 00000000591ce98e, Mem[0000000030001408] = 0b63139f
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 591ce98e
!	Mem[0000000021800101] = b7096d5f, %l4 = 00000000dd060c89
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 00000009000000ff
!	%l5 = 000000000ffd8287, %l4 = 0000000000000009, %l2 = 00000000591ce98e
	xnor	%l5,%l4,%l2		! %l2 = fffffffff0027d71
!	%l1 = 00000000000000bd, Mem[0000000010101400] = f10aea31
	stw	%l1,[%i4+%g0]		! Mem[0000000010101400] = 000000bd
!	%l2 = fffffffff0027d71, Mem[0000000030041408] = e176cc67
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = f0027d71
!	%l6 = 0000000000003083, Mem[0000000010001403] = 476805d9
	stb	%l6,[%i0+0x003]		! Mem[0000000010001400] = 47680583
!	%l6 = 00003083, %l7 = 000b4cd9, Mem[0000000010101408] = 2ad9f144 cd31359b
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00003083 000b4cd9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 38bbf1959e87c233, %f2  = 3dc8ce54 0d3979d8
	ldda	[%i2+0x030]%asi,%f2 	! %f2  = 38bbf195 9e87c233

p0_label_5:
!	Mem[0000000010101400] = 000000bd, %l2 = fffffffff0027d71
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 01a42722 2d1a78a9, %l0 = fa66ebe7, %l1 = 000000bd
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000001a42722 000000002d1a78a9
!	Mem[0000000010101410] = 708bf3f2d8d3c85f, %f26 = e40ee32b 53b75484
	ldda	[%i4+%o5]0x88,%f26	! %f26 = 708bf3f2 d8d3c85f
!	Mem[0000000010001410] = 591ce98e, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 000000000000008e
!	Mem[00000000100c1400] = d57f77b8, %l5 = 000000000ffd8287
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000b8
!	Mem[0000000010141410] = 9e6f5b68, %l0 = 0000000001a42722
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000005b68
!	Mem[00000000300c1408] = d88e3083, %f15 = 007f4ffe
	lda	[%i3+%o4]0x89,%f15	! %f15 = d88e3083
!	Mem[00000000211c0000] = 5418d61d, %l0 = 0000000000005b68
	ldub	[%o2+0x001],%l0		! %l0 = 0000000000000018
!	Mem[0000000010041400] = 5ecdee9fe338f285, %f10 = 52a8cdbd af2f2d12
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 5ecdee9f e338f285
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 5418d61d, %l0 = 0000000000000018
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000018000000ff

p0_label_6:
!	%f27 = d8d3c85f, Mem[0000000010141408] = fa66ebe7
	sta	%f27,[%i5+%o4]0x80	! Mem[0000000010141408] = d8d3c85f
!	%l4 = 0000000000000009, Mem[00000000300c1400] = 4de06e51
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000009
!	%l5 = 00000000000000b8, Mem[0000000010041400] = 85f238e3
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = b8f238e3
!	Mem[0000000030041408] = 717d02f0, %l6 = 0000000000003083
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000717d02f0
!	Mem[0000000030081410] = b985c7b3, %l1 = 000000002d1a78a9
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000b985c7b3
!	%f6  = 2dbdf489, Mem[0000000030001400] = 6574ea7c
	sta	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 2dbdf489
!	Mem[0000000010041400] = b8f238e3, %l7 = 00000000000b4cd9
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000b8000000ff
!	Mem[0000000010141408] = 5fc8d3d8, %l1 = 00000000b985c7b3
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 000000005fc8d3d8
!	Mem[0000000030041408] = 00003083, %l3 = 00000000923563dc
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000003083
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000b8, %l7 = 00000000000000b8, %y  = 00000000
	udiv	%l7,%l7,%l4		! %l4 = 0000000000000001
	mov	%l0,%y			! %y = 00000018

p0_label_7:
!	Mem[0000000010041414] = 0ffd8287, %l0 = 0000000000000018
	lduwa	[%i1+0x014]%asi,%l0	! %l0 = 000000000ffd8287
!	Mem[0000000030001408] = 591ce98e, %l5 = 00000000000000b8
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 00000000591ce98e
!	Mem[00000000100c1418] = e29f3f78, %l0 = 000000000ffd8287
	ldsw	[%i3+0x018],%l0		! %l0 = ffffffffe29f3f78
!	Mem[00000000100c1410] = e7eb66fa, %l6 = 00000000717d02f0
	ldswa	[%i3+0x010]%asi,%l6	! %l6 = ffffffffe7eb66fa
!	Mem[000000001018143c] = efbdc558, %l0 = ffffffffe29f3f78
	lduw	[%i6+0x03c],%l0		! %l0 = 00000000efbdc558
!	Mem[00000000100c1410] = fa66ebe7, %l2 = 000000000000008e
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 00000000fa66ebe7
!	Mem[0000000030101410] = ebea515a, %l4 = 0000000000000001
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000005a
!	Mem[0000000010141408] = bd000000b985c7b3, %l6 = ffffffffe7eb66fa
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = bd000000b985c7b3
!	Mem[0000000030001408] = 8ee91c59, %l7 = 00000000000000b8
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = ffffffff8ee91c59
!	Starting 10 instruction Store Burst
!	%l6 = bd000000b985c7b3, Mem[0000000021800180] = 59572d80
	stb	%l6,[%o3+0x180]		! Mem[0000000021800180] = b3572d80

p0_label_8:
!	%l1 = 000000005fc8d3d8, Mem[0000000010081400] = 6bf91ea0
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 6bf91ed8
!	%l5 = 00000000591ce98e, Mem[0000000030001410] = 1ef30dc27924dc8a
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000591ce98e
!	Mem[00000000300c1400] = 00000009, %l2 = 00000000fa66ebe7
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 00003083, %l0 = 00000000efbdc558
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = b985c7b3, %l7 = ffffffff8ee91c59
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 00000000b985c7b3
!	Mem[00000000201c0001] = e432075f, %l1 = 000000005fc8d3d8
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000032000000ff
!	Mem[0000000010181414] = 923563dc, %l6 = bd000000b985c7b3
	swap	[%i6+0x014],%l6		! %l6 = 00000000923563dc
!	%l5 = 00000000591ce98e, Mem[0000000010041400] = fff238e3
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = e98e38e3
!	%l6 = 923563dc, %l7 = b985c7b3, Mem[0000000030001410] = 8ee91c59 00000000
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 923563dc b985c7b3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 5fc8d3d8, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 000000005fc8d3d8

p0_label_9:
!	Mem[0000000020800000] = 4698b0a2, %l1 = 0000000000000032
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 0000000000004698
!	Mem[0000000030041410] = c147e5a6, %l5 = 00000000591ce98e
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = ffffffffc147e5a6
!	Mem[0000000010041408] = 000b4cd9, %l6 = 00000000923563dc
	lduwa	[%i1+%o4]0x80,%l6	! %l6 = 00000000000b4cd9
!	Mem[0000000030001408] = 591ce98e 4418d039, %l4 = 0000005a, %l5 = c147e5a6
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000591ce98e 000000004418d039
!	Mem[0000000010141408] = 591ce98e, %l4 = 00000000591ce98e
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000059
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030081400] = 0de3dd33 f266ae1c 41455167 f074df03
!	Mem[0000000030081410] = 2d1a78a9 1809a90f e00dcf28 5f03e6b5
!	Mem[0000000030081420] = f995557c 80786cd9 11fb7f67 ef082ea8
!	Mem[0000000030081430] = fc28c107 f5c1a26b 9a16530e 195c64bd
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000030141400] = 0d3c6a79, %l3 = 0000000000003083
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = 000000000d3c6a79
!	Mem[0000000010181400] = f1cd54b6 c8a3b3a7, %l0 = 00000000, %l1 = 00004698
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000f1cd54b6 00000000c8a3b3a7
!	Mem[0000000010181408] = 01a42722, %f26 = 708bf3f2
	lda	[%i6+%o4]0x80,%f26	! %f26 = 01a42722
!	Starting 10 instruction Store Burst
!	%f25 = d6ffc78a, Mem[00000000100c1408] = 43bc2821
	st	%f25,[%i3+%o4]		! Mem[00000000100c1408] = d6ffc78a

p0_label_10:
!	Mem[0000000010141437] = a1877db9, %l7 = 00000000b985c7b3
	ldstuba	[%i5+0x037]%asi,%l7	! %l7 = 000000b9000000ff
!	%f16 = 43bc2821 d1f2b6bd, Mem[00000000300c1410] = 4ea6b8a9 f0670df5
	stda	%f16,[%i3+%o5]0x81	! Mem[00000000300c1410] = 43bc2821 d1f2b6bd
!	%l0 = 00000000f1cd54b6, %l3 = 000000000d3c6a79, %l3 = 000000000d3c6a79
	udivx	%l0,%l3,%l3		! %l3 = 0000000000000012
!	%l0 = 00000000f1cd54b6, Mem[00000000211c0000] = 54ffd61d
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = b6ffd61d
!	Mem[0000000010101400] = 000000bd, %l1 = 00000000c8a3b3a7, %asi = 80
	swapa	[%i4+0x000]%asi,%l1	! %l1 = 00000000000000bd
!	%l2 = 000000005fc8d3d8, Mem[0000000030101408] = bcad6911
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 5fc8d3d8
!	%l6 = 00000000000b4cd9, Mem[000000001018143a] = 94fa6994, %asi = 80
	stba	%l6,[%i6+0x03a]%asi	! Mem[0000000010181438] = 94fad994
!	Mem[0000000010101408] = ff003083, %l6 = 00000000000b4cd9
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f16 = 43bc2821 d1f2b6bd, Mem[00000000100c1400] = d57f77b8 b90411c5
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 43bc2821 d1f2b6bd
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 83308ed8, %f26 = 01a42722
	lda	[%i3+%o4]0x81,%f26	! %f26 = 83308ed8

p0_label_11:
!	Mem[0000000030001408] = 8ee91c59, %l3 = 0000000000000012
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000059
!	Mem[00000000211c0000] = b6ffd61d, %l0 = 00000000f1cd54b6
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = f1bba2a8, %l6 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = fffffffff1bba2a8
!	Mem[0000000010181410] = 8ee91c59, %f24 = 3a845c9e
	lda	[%i6+%o5]0x88,%f24	! %f24 = 8ee91c59
!	Mem[0000000010181400] = f1cd54b6, %l4 = 0000000000000059
	lduba	[%i6+0x001]%asi,%l4	! %l4 = 00000000000000cd
!	Mem[0000000010081410] = 91969edc, %l5 = 000000004418d039
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 0000000000009196
!	Mem[0000000030081400] = 0de3dd33f266ae1c, %f18 = 0f6c4ace 5c5af8b6
	ldda	[%i2+%g0]0x81,%f18	! %f18 = 0de3dd33 f266ae1c
!	Mem[00000000300c1400] = ff000009bfb2887b, %f24 = 8ee91c59 d6ffc78a
	ldda	[%i3+%g0]0x81,%f24	! %f24 = ff000009 bfb2887b
!	Mem[0000000010001400] = 47680583 6139a7a3 fe8a25d8 65bdebc1
!	Mem[0000000010001410] = 8ee91c59 00000000 fb9706db 8b0c1328
!	Mem[0000000010001420] = cce7181d b6229c12 cb8d75d2 302e35ab
!	Mem[0000000010001430] = d48a37c5 911b8130 a8760424 6978bf4a
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	%l6 = f1bba2a8, %l7 = 000000b9, Mem[0000000030101410] = 5a51eaeb 702323f5
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = f1bba2a8 000000b9

p0_label_12:
!	%l5 = 0000000000009196, Mem[0000000010181408] = 01a427222d1a78a9
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000009196
!	%f8  = d96c7880, Mem[0000000030141410] = 20bc59e3
	sta	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = d96c7880
!	%f14 = bd645c19, Mem[0000000010081400] = d81ef96b
	sta	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = bd645c19
!	Mem[0000000010081410] = dc9e9691, %l1 = 00000000000000bd
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000091000000ff
!	%f4  = 0fa90918 a9781a2d, %l2 = 000000005fc8d3d8
!	Mem[0000000010081418] = 188b3c5d8ef465bb
	add	%i2,0x018,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081418] = 188b3ca918f4a90f
!	%l3 = 0000000000000059, immd = fffffffffffffbb1, %l6  = fffffffff1bba2a8
	mulx	%l3,-0x44f,%l6		! %l6 = fffffffffffe8089
!	%l3 = 0000000000000059, Mem[0000000010041400] = e3388ee9
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000059
!	Mem[000000001010143c] = 6107799c, %l6 = fffffffffffe8089
	ldstub	[%i4+0x03c],%l6		! %l6 = 00000061000000ff
!	Mem[0000000030141410] = 80786cd9, %l6 = 0000000000000061
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 000000d9000000ff
!	Starting 10 instruction Load Burst
!	%f10 = a82e08ef, %f7  = 28cf0de0
	fcmps	%fcc2,%f10,%f7 		! %fcc2 = 1

p0_label_13:
!	Mem[0000000010081400] = 195c64bd, %f4  = 0fa90918
	lda	[%i2+%g0]0x88,%f4 	! %f4 = 195c64bd
!	Mem[0000000010081410] = ff969edc4bdf8c9a, %l3 = 0000000000000059
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = ff969edc4bdf8c9a
!	Mem[0000000010101410] = 5fc8d3d8f2f38b70, %f14 = bd645c19 0e53169a
	ldda	[%i4+%o5]0x80,%f14	! %f14 = 5fc8d3d8 f2f38b70
!	Mem[0000000030181408] = 1217439c, %l3 = ff969edc4bdf8c9a
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000012
!	Mem[0000000030181400] = 511b2afc 01a42722, %l2 = 5fc8d3d8, %l3 = 00000012
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000001a42722 00000000511b2afc
!	Mem[0000000030001408] = 591ce98e, %l3 = 00000000511b2afc
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000059
!	Mem[0000000010001414] = 00000000, %l3 = 0000000000000059
	ldsha	[%i0+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 591ce98e, %l7 = 00000000000000b9
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000059
!	Mem[0000000010141410] = 685b6f9e, %l4 = 00000000000000cd
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 00000000685b6f9e
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = b6ffd61d, %l4 = 00000000685b6f9e
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000b6000000ff

p0_label_14:
!	Mem[0000000010081400] = bd645c19, %l0 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000bd645c19
!	%f0  = 1cae66f2 33dde30d, %l3 = 0000000000000000
!	Mem[0000000030101418] = 2fcadc71f7902f0f
	add	%i4,0x018,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101418] = 2fcadc71f7902f0f
!	Mem[0000000010141408] = 8ee91c59, %l4 = 00000000000000b6
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 000000008ee91c59
!	%l5 = 0000000000009196, Mem[00000000100c141a] = e29f3f78
	stb	%l5,[%i3+0x01a]		! Mem[00000000100c1418] = e29f9678
!	Mem[0000000030141410] = 80786cff, %l4 = 000000008ee91c59
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f0  = 1cae66f2 33dde30d, %l4 = 00000000000000ff
!	Mem[0000000010181438] = 94fad994efbdc558
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_P ! Mem[0000000010181438] = 1cae66f233dde30d
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 000000d9, %l7 = 00000059, Mem[0000000010001420] = cce7181d b6229c12
	std	%l6,[%i0+0x020]		! Mem[0000000010001420] = 000000d9 00000059
!	%f0  = 1cae66f2, Mem[0000000030181408] = 1217439c
	sta	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 1cae66f2
!	Mem[0000000010141410] = 9e6f5b68, %l2 = 0000000001a42722
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 000000009e6f5b68
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 5fc8d3d8, %l7 = 0000000000000059
	ldswa	[%i4+0x010]%asi,%l7	! %l7 = 000000005fc8d3d8

p0_label_15:
!	Mem[0000000010081400] = ffffffff, %l4 = 00000000000000ff
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010041408] = 000b4cd9, %l1 = 0000000000000091
	lduba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = d1f2b6bd, %l4 = 00000000ffffffff
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 00000000d1f2b6bd
!	Mem[0000000030041400] = 2f04e293, %l2 = 000000009e6f5b68
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 000000002f04e293
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 00000000bd645c19
	setx	0x272ffb3ff7b16106,%g7,%l0 ! %l0 = 272ffb3ff7b16106
!	%l1 = 0000000000000000
	setx	0x880feed7c25feed6,%g7,%l1 ! %l1 = 880feed7c25feed6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 272ffb3ff7b16106
	setx	0xfe4c75e7f8362302,%g7,%l0 ! %l0 = fe4c75e7f8362302
!	%l1 = 880feed7c25feed6
	setx	0x74ce14e78d3b72c5,%g7,%l1 ! %l1 = 74ce14e78d3b72c5
!	Mem[0000000030041400] = 619cf55093e2042f, %l5 = 0000000000009196
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 619cf55093e2042f
!	%f9  = 7c5595f9, %f28 = d48a37c5, %f21 = 00000000
	fmuls	%f9 ,%f28,%f21		! %f21 = ff800000
!	Mem[0000000030041408] = be4220a5 dc633592, %l6 = 000000d9, %l7 = 5fc8d3d8
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000dc633592 00000000be4220a5
!	Mem[0000000010141400] = d7013e6a, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = ffffffffd7013e6a
!	Starting 10 instruction Store Burst
!	%l6 = 00000000dc633592, Mem[0000000010141410] = 01a42722
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 01a43592

p0_label_16:
!	%f17 = 6139a7a3, Mem[0000000030181408] = 1cae66f2
	sta	%f17,[%i6+%o4]0x81	! Mem[0000000030181408] = 6139a7a3
!	%l4 = 00000000d1f2b6bd, Mem[0000000010181410] = b3c785b98ee91c59
	stxa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000d1f2b6bd
!	Mem[0000000030001400] = 89f4bd2d, %l2 = 000000002f04e293
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 0000000089f4bd2d
!	%f24 = cce7181d b6229c12, Mem[0000000010081408] = a37e5325 d274fb56
	stda	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = cce7181d b6229c12
!	%f3  = 67514541, %f26 = cb8d75d2, %f10 = a82e08ef 677ffb11
	fsmuld	%f3 ,%f26,%f10		! %f10 = c66ce8dd 47a11480
!	%f0  = 1cae66f2, Mem[0000000010081408] = cce7181d
	sta	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 1cae66f2
!	%f22 = fb9706db 8b0c1328, Mem[0000000010141408] = 000000b6 bd000000
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = fb9706db 8b0c1328
!	Mem[0000000030001400] = 93e2042f, %l4 = 00000000d1f2b6bd
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 0000002f000000ff
!	%l2 = 0000000089f4bd2d, %l1 = 74ce14e78d3b72c5, %l0 = fe4c75e7f8362302
	addc	%l2,%l1,%l0		! %l0 = 74ce14e817302ff2
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 6139a7a31aa7aac0, %l7 = 00000000be4220a5
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = 6139a7a31aa7aac0

p0_label_17:
!	Mem[0000000010101408] = ff003083000b4cd9, %f16 = 47680583 6139a7a3
	ldda	[%i4+%o4]0x80,%f16	! %f16 = ff003083 000b4cd9
!	Mem[0000000030001410] = 923563dc b985c7b3, %l2 = 89f4bd2d, %l3 = d7013e6a
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000923563dc 00000000b985c7b3
!	Mem[0000000010141408] = 8b0c1328, %l3 = 00000000b985c7b3
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 000000008b0c1328
!	Mem[0000000010181400] = b654cdf1, %f7  = 28cf0de0
	lda	[%i6+%g0]0x88,%f7 	! %f7 = b654cdf1
!	Mem[0000000010141400] = 6a3e01d7, %l0 = 74ce14e817302ff2
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 000000006a3e01d7
!	Mem[0000000010041410] = dd060c89, %l3 = 000000008b0c1328
	ldsba	[%i1+0x010]%asi,%l3	! %l3 = ffffffffffffffdd
!	Mem[0000000030181408] = 6139a7a31aa7aac0, %f16 = ff003083 000b4cd9
	ldda	[%i6+%o4]0x81,%f16	! %f16 = 6139a7a3 1aa7aac0
!	Mem[0000000010001400] = 47680583, %l1 = 74ce14e78d3b72c5
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000047
!	Mem[0000000010041400] = 59000000, %l2 = 00000000923563dc
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 0000000059000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 6139a7a3, %l3 = ffffffffffffffdd
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 000000006139a7a3

p0_label_18:
!	%f19 = 65bdebc1, %f30 = a8760424, %f1  = 33dde30d
	fadds	%f19,%f30,%f1 		! %f1  = 65bdebc1
!	%l4 = 000000000000002f, Mem[0000000030081410] = a9781a2d
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = a978002f
!	Mem[00000000201c0000] = e4ff075f, %l3 = 000000006139a7a3
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000e4000000ff
!	%l0 = 6a3e01d7, %l1 = 00000047, Mem[0000000010001410] = 591ce98e 00000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 6a3e01d7 00000047
!	Mem[0000000010141410] = 01a43592, %l2 = 0000000059000000
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 0000000001a43592
!	%l0 = 000000006a3e01d7, Mem[0000000030041410] = c147e5a6
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 6a3e01d7
!	Mem[0000000010181400] = b654cdf1, %l4 = 000000000000002f
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000f1000000ff
!	%l6 = 00000000dc633592, Mem[000000001000140c] = 65bdebc1, %asi = 80
	stha	%l6,[%i0+0x00c]%asi	! Mem[000000001000140c] = 3592ebc1
!	Mem[0000000030141408] = f1bba2a8, %l3 = 00000000000000e4
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000f1bba2a8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 7b88b2bf090000ff, %f10 = c66ce8dd 47a11480
	ldda	[%i3+%g0]0x89,%f10	! %f10 = 7b88b2bf 090000ff

p0_label_19:
!	Mem[00000000300c1408] = 83308ed8 8c7d617e, %l6 = dc633592, %l7 = 1aa7aac0
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000083308ed8 000000008c7d617e
!	Mem[00000000300c1410] = 43bc2821d1f2b6bd, %l3 = 00000000f1bba2a8
	ldxa	[%i3+%o5]0x81,%l3	! %l3 = 43bc2821d1f2b6bd
!	Mem[0000000010081420] = bd66d286cbbba13b, %f18 = fe8a25d8 65bdebc1
	ldd	[%i2+0x020],%f18	! %f18 = bd66d286 cbbba13b
!	Mem[0000000010001408] = c1eb9235 d8258afe, %l0 = 6a3e01d7, %l1 = 00000047
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000d8258afe 00000000c1eb9235
!	Mem[0000000030141410] = ff6c7880, %l7 = 000000008c7d617e
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = bdb6f2d1, %l4 = 00000000000000f1
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000bd
!	Mem[0000000030041400] = 2f04e29350f59c61, %f6  = b5e6035f b654cdf1
	ldda	[%i1+%g0]0x81,%f6 	! %f6  = 2f04e293 50f59c61
!	Mem[00000000300c1408] = 7e617d8cd88e3083, %f12 = 6ba2c1f5 07c128fc
	ldda	[%i3+%o4]0x89,%f12	! %f12 = 7e617d8c d88e3083
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = d1f2b6bd, %l2 = 0000000001a43592
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000d1f2b6bd

p0_label_20:
!	%l2 = 00000000d1f2b6bd, Mem[0000000030001400] = ffabe3ce93e204ff
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000d1f2b6bd
!	Mem[0000000010101400] = c8a3b3a7, %l6 = 0000000083308ed8
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000c8a3b3a7
!	Mem[0000000030101408] = 5fc8d3d8, %l6 = 00000000c8a3b3a7
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 000000005fc8d3d8
!	%l2 = 00000000d1f2b6bd, %l4 = 00000000000000bd, %l1 = 00000000c1eb9235
	addc	%l2,%l4,%l1		! %l1 = 00000000d1f2b77a
!	Mem[0000000030141410] = 80786cff, %l0 = 00000000d8258afe
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000080786cff
!	%l7 = 0000000000000000, imm = 00000000000002a0, %l0 = 0000000080786cff
	orn	%l7,0x2a0,%l0		! %l0 = fffffffffffffd5f
!	%l1 = 00000000d1f2b77a, Mem[0000000030101408] = c8a3b3a7
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = d1f2b77a
!	%f5  = a9781a2d, %f7  = 50f59c61
	fcmps	%fcc0,%f5 ,%f7 		! %fcc0 = 1
!	Mem[00000000211c0000] = ffffd61d, %l6 = 000000005fc8d3d8
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0de3dd33, %l2 = 00000000d1f2b6bd
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 000000000de3dd33

p0_label_21:
!	Mem[0000000010041410] = dd060c89, %l4 = 00000000000000bd
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 000000000000dd06
!	Mem[0000000010001400] = 83056847, %l3 = 43bc2821d1f2b6bd
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000083056847
!	Mem[0000000030081400] = 33dde30d, %l3 = 0000000083056847
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 0000000033dde30d
!	Mem[0000000010081410] = dc9e96ff, %l5 = 619cf55093e2042f
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffff96ff
!	Mem[0000000030081400] = 0de3dd33 f266ae1c, %l0 = fffffd5f, %l1 = d1f2b77a
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 000000000de3dd33 00000000f266ae1c
!	Mem[0000000010001400] = 47680583, %l7 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000047
!	Mem[00000000211c0000] = ffffd61d, %l0 = 000000000de3dd33
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1408] = 8ac7ffd6, %l5 = ffffffffffff96ff
	lduwa	[%i3+%o4]0x88,%l5	! %l5 = 000000008ac7ffd6
!	Mem[0000000030001410] = 923563dc, %l3 = 0000000033dde30d
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 00000000923563dc
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = d8258afe, %l7 = 0000000000000047
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 000000fe000000ff

p0_label_22:
!	%l6 = 00000000000000ff, Mem[0000000021800040] = d91b856a, %asi = 80
	stha	%l6,[%o3+0x040]%asi	! Mem[0000000021800040] = 00ff856a
!	Mem[0000000030041400] = 2f04e293, %l6 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 000000002f04e293
!	%l3 = 00000000923563dc, Mem[00000000211c0001] = ffffd61d, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffdcd61d
!	%l6 = 000000002f04e293, Mem[0000000010001414] = 47000000, %asi = 80
	stba	%l6,[%i0+0x014]%asi	! Mem[0000000010001414] = 93000000
!	Mem[0000000030081400] = 0de3dd33, %l7 = 00000000000000fe
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 0000000d000000ff
!	%l2 = 0de3dd33, %l3 = 923563dc, Mem[0000000010041438] = 5cee6ef7 16f20592
	std	%l2,[%i1+0x038]		! Mem[0000000010041438] = 0de3dd33 923563dc
!	Mem[0000000030141410] = ff8a25d8, %l4 = 000000000000dd06
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff8a25d8
!	%l2 = 000000000de3dd33, Mem[000000001004143c] = 923563dc, %asi = 80
	stha	%l2,[%i1+0x03c]%asi	! Mem[000000001004143c] = dd3363dc
!	Mem[0000000010101414] = f2f38b70, %l2 = 0de3dd33, %l0 = ffffffff
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000f2f38b70
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = eafa2222, %l2 = 000000000de3dd33
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffeafa

p0_label_23:
!	Mem[0000000010041410] = 890c06dd, %l0 = 00000000f2f38b70
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000006dd
!	Mem[00000000100c143c] = 1c67d382, %l3 = 00000000923563dc
	ldsh	[%i3+0x03c],%l3		! %l3 = 0000000000001c67
!	Mem[0000000030041400] = 619cf550ff000000, %f24 = cce7181d b6229c12
	ldda	[%i1+%g0]0x89,%f24	! %f24 = 619cf550 ff000000
!	Mem[0000000030141408] = e4000000, %f10 = 7b88b2bf
	lda	[%i5+%o4]0x81,%f10	! %f10 = e4000000
!	Mem[0000000010181400] = ffcd54b6, %l7 = 000000000000000d
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = ff003083 000b4cd9, %l6 = 2f04e293, %l7 = ffffffff
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff003083 00000000000b4cd9
!	Mem[0000000010181400] = b654cdff, %l0 = 00000000000006dd
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 2128bc43, %f14 = 5fc8d3d8
	lda	[%i3+%o5]0x89,%f14	! %f14 = 2128bc43
!	Mem[0000000010041400] = 590000009feecd5e, %l6 = 00000000ff003083
	ldx	[%i1+%g0],%l6		! %l6 = 590000009feecd5e
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 6a3e01d7, %l7 = 00000000000b4cd9
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 000000006a3e01d7

p0_label_24:
!	%l2 = ffffffffffffeafa, Mem[0000000010041408] = 000b4cd9
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffeafa
!	%f2  = 03df74f0, Mem[0000000010101410] = 5fc8d3d8
	sta	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 03df74f0
!	Mem[0000000030081400] = 33dde3ff, %l1 = 00000000f266ae1c
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000033dde3ff
!	Mem[0000000030041408] = 923563dc, %l0 = ffffffffffffffff
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000923563dc
!	%l4 = 00000000ff8a25d8, Mem[00000000300c1400] = ff000009
	stba	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = d8000009
!	%l0 = 923563dc, %l1 = 33dde3ff, Mem[0000000030101410] = a8a2bbf1 b9000000
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 923563dc 33dde3ff
!	Mem[0000000010181410] = 9235a401, %l5 = 000000008ac7ffd6
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 000000009235a401
!	Mem[0000000010081408] = f266ae1c, %l0 = 00000000923563dc
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 0000001c000000ff
!	Mem[0000000030041408] = ffffffff, %l0 = 000000000000001c
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 4698b0a2, %l4 = 00000000ff8a25d8
	lduh	[%o1+%g0],%l4		! %l4 = 0000000000004698

p0_label_25:
!	Mem[0000000030001410] = dc633592, %f28 = d48a37c5
	lda	[%i0+%o5]0x89,%f28	! %f28 = dc633592
!	Mem[0000000010181410] = d6ffc78a, %f7  = 50f59c61
	lda	[%i6+%o5]0x88,%f7 	! %f7 = d6ffc78a
!	Mem[00000000100c1404] = 2128bc43, %l7 = 000000006a3e01d7
	lduh	[%i3+0x006],%l7		! %l7 = 000000000000bc43
!	Mem[00000000300c1410] = 2128bc43, %l7 = 000000000000bc43
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 000000002128bc43
!	Mem[0000000030141408] = 000000e4, %l4 = 0000000000004698
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000e4
!	Mem[0000000010041410] = 890c06dd, %l2 = ffffffffffffeafa
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffdd
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030081400] = 1cae66f2 f266ae1c 41455167 f074df03
!	Mem[0000000030081410] = 2f0078a9 1809a90f e00dcf28 5f03e6b5
!	Mem[0000000030081420] = f995557c 80786cd9 11fb7f67 ef082ea8
!	Mem[0000000030081430] = fc28c107 f5c1a26b 9a16530e 195c64bd
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000010041400] = 590000009feecd5e, %f16 = 6139a7a3 1aa7aac0
	ldda	[%i1+%g0]0x80,%f16	! %f16 = 59000000 9feecd5e
!	Mem[0000000030181408] = ffffffdd, %l7 = 000000002128bc43
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ffffffdd
!	Starting 10 instruction Store Burst
!	%l1 = 0000000033dde3ff, Mem[000000001014142e] = 4a572233, %asi = 80
	stba	%l1,[%i5+0x02e]%asi	! Mem[000000001014142c] = 4a57ff33

p0_label_26:
	membar	#Sync			! Added by membar checker (4)
!	%f19 = cbbba13b, Mem[0000000030081410] = a978002f
	sta	%f19,[%i2+%o5]0x89	! Mem[0000000030081410] = cbbba13b
!	%f13 = f5c1a26b, %f18 = bd66d286, %f21 = ff800000
	fsubs	%f13,%f18,%f21		! %f21 = f5c1a26b
!	Mem[00000000100c1408] = d6ffc78a, %l2 = ffffffffffffffdd
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000d6ffc78a
!	%l1 = 0000000033dde3ff, Mem[000000001000140e] = 3592ebc1, %asi = 80
	stha	%l1,[%i0+0x00e]%asi	! Mem[000000001000140c] = 3592e3ff
!	Mem[0000000030081400] = f266ae1c, %l1 = 0000000033dde3ff
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 0000001c000000ff
!	Mem[0000000010081430] = 38bbf195, %l5 = 000000009235a401
	ldstub	[%i2+0x030],%l5		! %l5 = 00000038000000ff
!	Mem[0000000010181429] = 8e91b08a, %l5 = 0000000000000038
	ldstuba	[%i6+0x029]%asi,%l5	! %l5 = 00000091000000ff
!	%f12 = fc28c107 f5c1a26b, Mem[0000000010141408] = 28130c8b db0697fb
	stda	%f12,[%i5+0x008]%asi	! Mem[0000000010141408] = fc28c107 f5c1a26b
!	%f0  = 1cae66f2 f266ae1c, %l1 = 000000000000001c
!	Mem[0000000010041400] = 590000009feecd5e
	stda	%f0,[%i1+%l1]ASI_PST8_PL ! Mem[0000000010041400] = 590066f2f2eecd5e
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffae66f2f266ae1c, %l5 = 0000000000000091
	ldxa	[%i2+%g0]0x81,%l5	! %l5 = ffae66f2f266ae1c

p0_label_27:
!	Mem[0000000010141408] = 07c128fc, %l4 = 00000000000000e4
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000fc
!	Mem[0000000030041410] = aa708a88d7013e6a, %f10 = 11fb7f67 ef082ea8
	ldda	[%i1+%o5]0x89,%f10	! %f10 = aa708a88 d7013e6a
!	%f28 = dc633592, %f14 = 9a16530e, %f22 = fb9706db
	fdivs	%f28,%f14,%f22		! %f22 = 7f800000
!	Mem[0000000010101400] = 83308ed8 bc66032b, %l2 = d6ffc78a, %l3 = 00001c67
	ldd	[%i4+%g0],%l2		! %l2 = 0000000083308ed8 00000000bc66032b
!	Mem[0000000010001408] = d8258afe, %l3 = 00000000bc66032b
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = ffffffffd8258afe
!	Mem[0000000030181410] = 6c3a0e68, %l4 = 00000000000000fc
	ldsha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000006c3a
!	Mem[0000000030101408] = d1f2b77a, %l5 = ffae66f2f266ae1c
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000d1f2
!	Mem[0000000010141410] = 59000000, %l3 = ffffffffd8258afe
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c142c] = 59ae007a, %l7 = 00000000ffffffdd
	lduwa	[%i3+0x02c]%asi,%l7	! %l7 = 0000000059ae007a
!	Starting 10 instruction Store Burst
!	Mem[0000000010101433] = 1b3bf853, %l5 = 000000000000d1f2
	ldstub	[%i4+0x033],%l5		! %l5 = 00000053000000ff

p0_label_28:
!	Mem[0000000030181400] = 2227a401, %l0 = 00000000ffffffff
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 000000002227a401
!	%l0 = 2227a401, %l1 = 0000001c, Mem[0000000030001408] = 8ee91c59 39d01844
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 2227a401 0000001c
!	Mem[0000000030141410] = 0000dd06, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 000000000000dd06
!	%l6 = 590000009feecd5e, Mem[0000000030081410] = cbbba13b
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 9feecd5e
!	%l1 = 000000000000001c, imm = 00000000000005e0, %l3 = 000000000000dd06
	andn	%l1,0x5e0,%l3		! %l3 = 000000000000001c
!	%l0 = 000000002227a401, Mem[0000000010001408] = d8258afe
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = d8258a01
!	Mem[0000000010041408] = ffffeafa, %l1 = 000000000000001c, %asi = 80
	swapa	[%i1+0x008]%asi,%l1	! %l1 = 00000000ffffeafa
!	%l5 = 0000000000000053, Mem[0000000030081400] = f266aeff
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = f266ae53
!	%f14 = 9a16530e 195c64bd, %l2 = 0000000083308ed8
!	Mem[0000000010141408] = fc28c107f5c1a26b
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_P ! Mem[0000000010141408] = fc28c107f5c1a26b
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff075f, %l3 = 000000000000001c
	ldsb	[%o0+%g0],%l3		! %l3 = ffffffffffffffff

p0_label_29:
!	Mem[0000000010081410] = ff969edc, %l0 = 000000002227a401
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 000000000000ff96
!	Mem[0000000030081400] = 53ae66f2f266ae1c, %f12 = fc28c107 f5c1a26b
	ldda	[%i2+%g0]0x81,%f12	! %f12 = 53ae66f2 f266ae1c
!	Mem[00000000300c1408] = 7e617d8c d88e3083, %l0 = 0000ff96, %l1 = ffffeafa
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000d88e3083 000000007e617d8c
!	Mem[0000000030101410] = dc633592, %l1 = 000000007e617d8c
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffdc
!	%f23 = 8b0c1328, %f2  = 41455167, %f0  = 1cae66f2 f266ae1c
	fsmuld	%f23,%f2 ,%f0 		! %f0  = b99afdd2 0cd74600
!	%f29 = 911b8130, %f16 = 59000000, %f4  = 2f0078a9
	fdivs	%f29,%f16,%f4 		! %l0 = 00000000d88e30a5, Unfinished, %fsr = 0400000400
!	%f28 = dc633592, %f28 = dc633592, %f19 = cbbba13b
	fadds	%f28,%f28,%f19		! %f19 = dce33592
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030181400] = ffffffff fc2a1b51 ffffffdd 1aa7aac0
!	Mem[0000000030181410] = 6c3a0e68 736f228e ba6b8d0f 5131fddb
!	Mem[0000000030181420] = e1f888f9 66c0041d 08c80a6f 41f71331
!	Mem[0000000030181430] = 339cb7c5 b6e9ee67 9077aed2 6bdc8384
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[00000000300c1400] = d8000009 bfb2887b, %l6 = 9feecd5e, %l7 = 59ae007a
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000d8000009 00000000bfb2887b
!	Starting 10 instruction Store Burst
!	%l7 = 00000000bfb2887b, immed = fffff6cc, %y  = 00000018
	sdiv	%l7,-0x934,%l6		! %l6 = fffffffffd4f9233
	mov	%l0,%y			! %y = d88e30a5

p0_label_30:
!	%l2 = 83308ed8, %l3 = ffffffff, Mem[0000000010041410] = 890c06dd 8782fd0f
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 83308ed8 ffffffff
!	Mem[0000000030081408] = 67514541, %l6 = fffffffffd4f9233
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 00000041000000ff
!	%l5 = 0000000000000053, Mem[0000000020800000] = 4698b0a2, %asi = 80
	stba	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 5398b0a2
!	%l2 = 83308ed8, %l3 = ffffffff, Mem[0000000030001410] = dc633592 b3c785b9
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 83308ed8 ffffffff
!	%f12 = 53ae66f2, %f12 = 53ae66f2
	fcmpes	%fcc2,%f12,%f12		! %fcc2 = 0
	membar	#Sync			! Added by membar checker (6)
!	%l0 = 00000000d88e30a5, Mem[0000000030181400] = ffffffff
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = d88e30a5
!	Mem[0000000030181408] = ffffffdd, %l4 = 0000000000006c3a
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ffffffdd
!	Mem[0000000010141408] = fc28c107, %l6 = 0000000000000041
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 000000fc000000ff
!	Mem[0000000010001400] = 83056847, %l2 = 0000000083308ed8
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000083056847
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = d88e3083, %l2 = 0000000083056847
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffd88e

p0_label_31:
!	Mem[0000000010041408] = 2385bf991c000000, %f24 = 1d04c066 f988f8e1
	ldda	[%i1+%o4]0x88,%f24	! %f24 = 2385bf99 1c000000
!	Mem[0000000030101410] = 923563dc, %f16 = 511b2afc
	lda	[%i4+%o5]0x89,%f16	! %f16 = 923563dc
!	Mem[0000000010181404] = c8a3b3a7, %l3 = ffffffffffffffff
	lduw	[%i6+0x004],%l3		! %l3 = 00000000c8a3b3a7
!	Mem[0000000030181410] = 6c3a0e68, %l2 = ffffffffffffd88e
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 000000000000006c
!	Mem[0000000010101410] = f074df03, %l2 = 000000000000006c
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = fffffffff074df03
!	Mem[0000000010041408] = 0000001c, %l6 = 00000000000000fc
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[000000001008142c] = 365480bc, %l0 = 00000000d88e30a5
	ldub	[%i2+0x02d],%l0		! %l0 = 0000000000000054
!	Mem[0000000010181420] = c3a609f9b7e5a7dc, %f30 = 8483dc6b d2ae7790
	ldda	[%i6+0x020]%asi,%f30	! %f30 = c3a609f9 b7e5a7dc
!	Mem[0000000030041408] = 1c000000a52042be, %l2 = fffffffff074df03
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = 1c000000a52042be
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000054, Mem[0000000010101408] = 833000ff
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 83300054

p0_label_32:
!	%l0 = 0000000000000054, Mem[0000000010041408] = 1c000000
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 1c000054
!	%f11 = d7013e6a, Mem[0000000010081400] = ffffffff
	sta	%f11,[%i2+%g0]0x80	! Mem[0000000010081400] = d7013e6a
!	%f2  = 41455167, %f15 = 195c64bd
	fcmpes	%fcc1,%f2 ,%f15		! %fcc1 = 2
!	Mem[0000000030181408] = 00006c3a, %l3 = 00000000c8a3b3a7
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000006c3a
!	Mem[0000000030181408] = a7b3a3c8, %l7 = 00000000bfb2887b
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 00000000a7b3a3c8
!	%l2 = 1c000000a52042be, imm = fffffffffffff3ea, %l1 = ffffffffffffffdc
	or	%l2,-0xc16,%l1		! %l1 = fffffffffffff3fe
!	%l7 = 00000000a7b3a3c8, Mem[0000000010141428] = 8ac764d6, %asi = 80
	stwa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = a7b3a3c8
!	Mem[00000000211c0000] = ffdcd61d, %l0 = 0000000000000054
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000dc
!	%f28 = 67eee9b6 c5b79c33, Mem[0000000010081408] = ffae66f2 b6229c12
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 67eee9b6 c5b79c33
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff, %l7 = 00000000a7b3a3c8
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_33:
!	Mem[0000000030141408] = 000000e4, %l0 = 00000000000000dc
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000e4
!	Mem[00000000300c1410] = 43bc2821, %l6 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000043
!	Mem[00000000100c1430] = e3e681f3 f59d585b, %l2 = a52042be, %l3 = 00006c3a
	ldda	[%i3+0x030]%asi,%l2	! %l2 = 00000000e3e681f3 00000000f59d585b
!	Mem[0000000010001410] = d94c0b00, %l2 = 00000000e3e681f3
	ldswa	[%i0+0x010]%asi,%l2	! %l2 = ffffffffd94c0b00
!	Mem[0000000030041410] = d7013e6a, %f21 = 680e3a6c
	lda	[%i1+%o5]0x89,%f21	! %f21 = d7013e6a
!	Mem[00000000100c1400] = bdb6f2d1 2128bc43 ffffffdd d1f2b6bd
!	Mem[00000000100c1410] = e7eb66fa b1281210 e29f9678 8bdf57f2
!	Mem[00000000100c1420] = 0d6a01b5 d187fbef afd6e547 59ae007a
!	Mem[00000000100c1430] = e3e681f3 f59d585b 1140c8e9 1c67d382
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010181410] = 8ac7ffd600000000, %f28 = 67eee9b6 c5b79c33
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 8ac7ffd6 00000000
!	Mem[0000000030141408] = e4000000, %l1 = fffffffffffff3fe
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000e400
!	Mem[0000000030041410] = 6a3e01d7, %f24 = 2385bf99
	lda	[%i1+%o5]0x81,%f24	! %f24 = 6a3e01d7
!	Starting 10 instruction Store Burst
!	%f22 = dbfd3151 0f8d6bba, Mem[0000000010141428] = a7b3a3c8 4a57ff33
	stda	%f22,[%i5+0x028]%asi	! Mem[0000000010141428] = dbfd3151 0f8d6bba

p0_label_34:
!	%l4 = 00000000ffffffdd, Mem[0000000010141400] = d7013e6a, %asi = 80
	stba	%l4,[%i5+0x000]%asi	! Mem[0000000010141400] = dd013e6a
!	%f27 = 6f0ac808, Mem[0000000010081438] = 3d97a105
	sta	%f27,[%i2+0x038]%asi	! Mem[0000000010081438] = 6f0ac808
!	%f24 = 6a3e01d7, Mem[0000000030081400] = f266ae53
	sta	%f24,[%i2+%g0]0x89	! Mem[0000000030081400] = 6a3e01d7
!	Mem[00000000201c0000] = ffff075f, %l3 = 00000000f59d585b
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[00000000211c0000] = ffdcd61d, %l4 = 00000000ffffffdd
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 00000053, Mem[0000000010181410] = 8ac7ffd6 00000000
	std	%l4,[%i6+%o5]		! Mem[0000000010181410] = 000000ff 00000053
!	Mem[0000000010081400] = d7013e6a, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000d7013e6a
!	Mem[000000001018140c] = 00009196, %l1 = 000000000000e400
	swap	[%i6+0x00c],%l1		! %l1 = 0000000000009196
!	%f25 = 1c000000, Mem[0000000010101408] = 83300054
	sta	%f25,[%i4+%o4]0x88	! Mem[0000000010101408] = 1c000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = bdb6f2d1, %l1 = 0000000000009196
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffbdb6

p0_label_35:
!	Mem[0000000010041408] = 5400001c, %l5 = 0000000000000053
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = 000000005400001c
!	Mem[0000000010001410] = 000b4cd9, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000d9
!	Mem[0000000030041400] = ff000000, %l1 = ffffffffffffbdb6
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffff075f, %l0 = 00000000000000e4
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1408] = ffffffddd1f2b6bd, %l5 = 000000005400001c
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = ffffffddd1f2b6bd
!	Mem[0000000030141400] = 0d3c6a79, %l0 = ffffffffffffffff
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 000000000000000d
!	Mem[0000000010181404] = c8a3b3a7, %l6 = 0000000000000043
	ldsb	[%i6+0x004],%l6		! %l6 = ffffffffffffffc8
!	Mem[0000000030001410] = d88e3083, %l5 = ffffffddd1f2b6bd
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffffd8
!	Mem[00000000300c1400] = d8000009, %l3 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l3	! %l3 = ffffffffffffffd8
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffffffdd, %l0 = 000000000000000d
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_36:
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010141420] = 9655d538 52bca2f0
	stda	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 000000ff 00000000
!	Mem[0000000010041410] = d88e3083, %l3 = ffffffffffffffd8
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000d8000000ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = e4000000edddf329
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000000000ff
	setx	0x042498ff8d48ff23,%g7,%l0 ! %l0 = 042498ff8d48ff23
!	%l1 = 0000000000000000
	setx	0x12b777480821fbc0,%g7,%l1 ! %l1 = 12b777480821fbc0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 042498ff8d48ff23
	setx	0xb5fcffa0760b2907,%g7,%l0 ! %l0 = b5fcffa0760b2907
!	%l1 = 12b777480821fbc0
	setx	0xadb2460035bd90ea,%g7,%l1 ! %l1 = adb2460035bd90ea
!	%l2 = d94c0b00, %l3 = 000000d8, Mem[0000000010101400] = d88e3083 2b0366bc
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = d94c0b00 000000d8
!	%l5 = ffffffffffffffd8, Mem[0000000030041410] = 6a3e01d7888a70aa
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffffd8
	membar	#Sync			! Added by membar checker (7)
!	%l5 = ffffffffffffffd8, Mem[00000000100c142c] = 59ae007a
	stw	%l5,[%i3+0x02c]		! Mem[00000000100c142c] = ffffffd8
!	Mem[00000000100c1438] = 1140c8e9, %l6 = ffffffffffffffc8, %asi = 80
	swapa	[%i3+0x038]%asi,%l6	! %l6 = 000000001140c8e9
!	%l7 = 00000000000000d9, Mem[0000000010181410] = 000000ff00000053
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000d9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l5 = ffffffffffffffd8
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_37:
!	Mem[000000001008140c] = c5b79c33, %l4 = 00000000d7013e6a
	lduh	[%i2+0x00c],%l4		! %l4 = 000000000000c5b7
!	%f8  = 0d6a01b5, %f3  = d1f2b6bd, %f29 = 00000000
	fdivs	%f8 ,%f3 ,%f29		! %l0 = b5fcffa0760b2929, Unfinished, %fsr = 0200000400
!	Mem[0000000010101410] = 03df74f0, %l0 = b5fcffa0760b2929
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 00000000000003df
!	Mem[0000000010001408] = 018a25d8, %l1 = adb2460035bd90ea
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000018a25d8
!	Mem[000000001010143c] = ff07799c, %l7 = 00000000000000d9
	ldub	[%i4+0x03d],%l7		! %l7 = 0000000000000007
!	Mem[0000000030141400] = 0d3c6a79, %l7 = 0000000000000007
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 000000000000000d
!	Mem[0000000010141400] = 0b63139f 6a3e01dd, %l2 = d94c0b00, %l3 = 000000d8
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 000000006a3e01dd 000000000b63139f
!	Mem[0000000030041400] = ff000000, %l4 = 000000000000c5b7
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030181400] = d88e30a5, %l2 = 000000006a3e01dd
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffd8
!	Starting 10 instruction Store Burst
!	%l6 = 000000001140c8e9, Mem[00000000100c1400] = bdb6f2d1
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = c8e9f2d1

p0_label_38:
!	%l7 = 000000000000000d, Mem[0000000010141410] = 59000000
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000d
!	Mem[0000000030141408] = 00000000, %l4 = 00000000ff000000
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l7 = 000000000000000d, Mem[000000001008141c] = 18f4a90f, %asi = 80
	stwa	%l7,[%i2+0x01c]%asi	! Mem[000000001008141c] = 0000000d
!	%l4 = 0000000000000000, Mem[0000000010181408] = 00000000
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[00000000211c0001] = ffdcd61d, %l0 = 00000000000003df
	ldstub	[%o2+0x001],%l0		! %l0 = 000000dc000000ff
!	Mem[0000000010001438] = a87604246978bf4a, %l4 = 0000000000000000, %l4 = 0000000000000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = a87604246978bf4a
!	%l1 = 00000000018a25d8, Mem[0000000010081400] = ff000000
	stwa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 018a25d8
!	%l2 = ffffffd8, %l3 = 0b63139f, Mem[0000000010041400] = 590066f2 f2eecd5e
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = ffffffd8 0b63139f
!	%l4 = 6978bf4a, %l5 = 00000000, Mem[0000000010041400] = ffffffd8 0b63139f
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 6978bf4a 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = dc9e96ff, %l3 = 000000000b63139f
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000096ff

p0_label_39:
!	Mem[000000001018140c] = 0000e400, %l2 = ffffffffffffffd8
	lduha	[%i6+0x00c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 9feecd5e, %l7 = 000000000000000d
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 000000009feecd5e
!	Mem[0000000010001400] = a3a7396183308ed8, %f6  = e29f9678 8bdf57f2
	ldda	[%i0+%g0]0x88,%f6 	! %f6  = a3a73961 83308ed8
!	Mem[0000000030041400] = ff000000, %f25 = 1c000000
	lda	[%i1+%g0]0x89,%f25	! %f25 = ff000000
!	Mem[0000000010001410] = d94c0b00 93000000, %l6 = 1140c8e9, %l7 = 9feecd5e
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000d94c0b00 0000000093000000
!	Mem[0000000030181400] = a5308ed8, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000d8
!	Mem[0000000030081400] = d7013e6a f266ae1c ff455167 f074df03
!	Mem[0000000030081410] = 5ecdee9f 1809a90f e00dcf28 5f03e6b5
!	Mem[0000000030081420] = f995557c 80786cd9 11fb7f67 ef082ea8
!	Mem[0000000030081430] = fc28c107 f5c1a26b 9a16530e 195c64bd
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000010101400] = d94c0b00, %l3 = 00000000000096ff
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 0000001c, %l6 = 00000000d94c0b00
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 0000001c000000ff

p0_label_40:
!	Mem[0000000030081408] = ff455167, %l0 = 00000000000000dc
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff455167
!	Mem[0000000010141410] = 0000000d, %l4 = a87604246978bf4a
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000000d000000ff
!	%f16 = d7013e6a f266ae1c ff455167 f074df03
!	%f20 = 5ecdee9f 1809a90f e00dcf28 5f03e6b5
!	%f24 = f995557c 80786cd9 11fb7f67 ef082ea8
!	%f28 = fc28c107 f5c1a26b 9a16530e 195c64bd
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f2  = ffffffdd d1f2b6bd, Mem[0000000030041410] = ffffffff d8ffffff
	stda	%f2 ,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffdd d1f2b6bd
!	%l4 = 0000000d, %l5 = 000000d8, Mem[0000000010181430] = 70a1f8ae eb03a68d
	stda	%l4,[%i6+0x030]%asi	! Mem[0000000010181430] = 0000000d 000000d8
!	%f5  = b1281210, %f8  = 0d6a01b5, %f0  = bdb6f2d1 2128bc43
	fsmuld	%f5 ,%f8 ,%f0 		! %f0  = b7e33434 30daaa00
!	%l2 = 0000000000000000, Mem[0000000030141408] = ff000000
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
	membar	#Sync			! Added by membar checker (8)
!	%l5 = 00000000000000d8, Mem[0000000030081400] = f266ae1c
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000d8
!	Mem[0000000010181410] = 00000000, %l5 = 00000000000000d8
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = b6e9ee67, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000067

p0_label_41:
!	Mem[00000000211c0000] = ffffd61d, %l7 = 0000000093000000
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081410] = ff969edc4bdf8c9a, %f28 = fc28c107 f5c1a26b
	ldd	[%i2+%o5],%f28		! %f28 = ff969edc 4bdf8c9a
!	Mem[0000000010101408] = 0000001c, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l4 = 000000000000000d, %l4 = 000000000000000d, %l3  = ffffffffffffffff
	mulx	%l4,%l4,%l3		! %l3 = 00000000000000a9
!	Mem[00000000100c1418] = e29f9678, %l5 = 0000000000000067
	lduw	[%i3+0x018],%l5		! %l5 = 00000000e29f9678
!	Mem[0000000030101408] = d1f2b77a, %l3 = 00000000000000a9
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000d1
!	Mem[0000000010141410] = 944b365b000000ff, %f0  = b7e33434 30daaa00
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = 944b365b 000000ff
!	Mem[0000000010101410] = 03df74f0, %l6 = 000000000000001c
	ldsb	[%i4+%o5],%l6		! %l6 = 0000000000000003
!	Mem[00000000211c0000] = ffffd61d, %l6 = 0000000000000003
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f0  = 944b365b 000000ff, Mem[0000000030081400] = 000000d8 d7013e6a
	stda	%f0 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 944b365b 000000ff

p0_label_42:
!	%l0 = 00000000ff455167, Mem[0000000030081408] = 03df74f0
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 67df74f0
!	%l0 = ff455167, %l1 = 018a25d8, Mem[0000000010001410] = d94c0b00 93000000
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff455167 018a25d8
!	%l7 = 00000000000000ff, Mem[0000000010001400] = d88e3083
	stha	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff3083
!	%f0  = 944b365b 000000ff, %l7 = 00000000000000ff
!	Mem[0000000030101400] = 9a17eaa871b5331e
	stda	%f0,[%i4+%l7]ASI_PST32_S ! Mem[0000000030101400] = 944b365b000000ff
!	Mem[0000000030001400] = bdb6f2d1, %l5 = 00000000e29f9678
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 000000bd000000ff
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000000d1
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l0 = ff455167, %l1 = 018a25d8, Mem[0000000010181408] = ff000000 0000e400
	stda	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = ff455167 018a25d8
!	%l6 = 0000ffff, %l7 = 000000ff, Mem[0000000030101410] = dc633592 ffe3dd33
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffff 000000ff
!	%l0 = 00000000ff455167, Mem[0000000030041408] = ff000000
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 67000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l6 = 000000000000ffff
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_43:
!	Mem[0000000010141400] = 6a3e01dd, %f11 = 59ae007a
	lda	[%i5+%g0]0x88,%f11	! %f11 = 6a3e01dd
!	Mem[0000000010181408] = ff455167018a25d8, %l0 = 00000000ff455167
	ldx	[%i6+%o4],%l0		! %l0 = ff455167018a25d8
!	Mem[0000000010181400] = b654cdff, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000cdff
!	Mem[0000000030181408] = 7b88b2bf, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000007b88
!	Mem[0000000010101410] = 03df74f0, %l3 = 000000000000cdff
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = 0000000003df74f0
!	Mem[0000000030181408] = 7b88b2bf, %f16 = d7013e6a
	lda	[%i6+%o4]0x81,%f16	! %f16 = 7b88b2bf
!	Mem[00000000300c1410] = 43bc2821 d1f2b6bd, %l6 = 00007b88, %l7 = 000000ff
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 0000000043bc2821 00000000d1f2b6bd
!	Mem[0000000010141400] = dd013e6a, %l6 = 0000000043bc2821
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000dd013e6a
!	Code Fragment 3
p0_fragment_3:
!	%l0 = ff455167018a25d8
	setx	0x1b71a0d7fc6a67e5,%g7,%l0 ! %l0 = 1b71a0d7fc6a67e5
!	%l1 = 00000000018a25d8
	setx	0xe1f416981952efdc,%g7,%l1 ! %l1 = e1f416981952efdc
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1b71a0d7fc6a67e5
	setx	0x5c9567dff7d7afdb,%g7,%l0 ! %l0 = 5c9567dff7d7afdb
!	%l1 = e1f416981952efdc
	setx	0xb450bfc02de6ae76,%g7,%l1 ! %l1 = b450bfc02de6ae76
!	Starting 10 instruction Store Burst
!	%l6 = 00000000dd013e6a, Mem[00000000218001c1] = 2fa807db, %asi = 80
	stba	%l6,[%o3+0x1c1]%asi	! Mem[00000000218001c0] = 2f6a07db

p0_label_44:
!	%l1 = b450bfc02de6ae76, Mem[0000000030181400] = a5308ed8
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = a530ae76
!	%f16 = 7b88b2bf f266ae1c ff455167 f074df03
!	%f20 = 5ecdee9f 1809a90f e00dcf28 5f03e6b5
!	%f24 = f995557c 80786cd9 11fb7f67 ef082ea8
!	%f28 = ff969edc 4bdf8c9a 9a16530e 195c64bd
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%f2  = ffffffdd d1f2b6bd, Mem[00000000300c1408] = d88e3083 7e617d8c
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffdd d1f2b6bd
!	%l3 = 0000000003df74f0, Mem[00000000100c1410] = 101228b1fa66ebe7
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000003df74f0
!	Mem[0000000010181400] = b654cdff, %l4 = 000000000000000d
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000b654cdff
!	%l7 = 00000000d1f2b6bd, Mem[0000000030101400] = 944b365b
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = bd4b365b
!	Mem[0000000030141400] = 0d3c6a79, %l1 = b450bfc02de6ae76
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 000000000d3c6a79
!	%l5 = 00000000000000bd, Mem[0000000030001408] = 2227a401
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 2227a4bd
!	Mem[00000000100c1408] = ffffffddd1f2b6bd, %l2 = 0000000000000000, %l1 = 000000000d3c6a79
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = ffffffddd1f2b6bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 675145ff, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_45:
!	Mem[0000000020800040] = eafa2222, %l5 = 00000000000000bd
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000fa
!	Mem[00000000100c1404] = 2128bc43, %l3 = 0000000003df74f0
	ldsb	[%i3+0x006],%l3		! %l3 = ffffffffffffffbc
!	Mem[0000000030001400] = 00000000d1f2b6ff, %f14 = 1140c8e9 1c67d382
	ldda	[%i0+%g0]0x89,%f14	! %f14 = 00000000 d1f2b6ff
!	Mem[0000000030081400] = ff000000, %l7 = 00000000d1f2b6bd
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030041410] = bdb6f2d1ddffffff, %l5 = 00000000000000fa
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = bdb6f2d1ddffffff
!	Mem[0000000030081400] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffdd, %l4 = 00000000b654cdff
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030101410] = ffff0000, %f15 = d1f2b6ff
	lda	[%i4+%o5]0x89,%f15	! %f15 = ffff0000
!	Mem[0000000030101410] = ffff0000, %l1 = ffffffddd1f2b6bd
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = cb8d75d2, %l4 = 000000000000ffff
	swap	[%i0+0x028],%l4		! %l4 = 00000000cb8d75d2

p0_label_46:
!	Mem[0000000030041408] = 67000000, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 0000000067000000
	membar	#Sync			! Added by membar checker (9)
!	%f14 = 00000000 ffff0000, Mem[0000000010141410] = 5ecdee9f 1809a90f
	stda	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ffff0000
!	Mem[0000000010081410] = ff969edc, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000201c0001] = ffff075f, %l7 = ffffffffffffff00
	ldstub	[%o0+0x001],%l7		! %l7 = 000000ff000000ff
!	%l4 = 00000000cb8d75d2, Mem[0000000030001410] = 83308ed8
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = cb8d75d2
!	%l0 = f7d7afdb, %l1 = 67000000, Mem[0000000030141410] = 00000000 6494ddd6
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = f7d7afdb 67000000
!	%f10 = afd6e547 6a3e01dd, Mem[0000000030041410] = d1f2b6bd ffffffdd
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = afd6e547 6a3e01dd
!	Mem[0000000010181420] = c3a609f9b7e5a7dc, %l7 = 00000000000000ff, %l0 = 5c9567dff7d7afdb
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = c3a609f9b7e5a7dc
!	Mem[00000000201c0000] = ffff075f, %l0 = c3a609f9b7e5a7dc
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000ffff000000ff, %f30 = 9a16530e 195c64bd
	ldda	[%i4+%o5]0x81,%f30	! %f30 = 0000ffff 000000ff

p0_label_47:
!	Mem[0000000010141400] = 7b88b2bf, %l5 = bdb6f2d1ddffffff
	ldsh	[%i5+0x002],%l5		! %l5 = ffffffffffffb2bf
!	Mem[00000000100c1400] = d1f2e9c8, %f17 = f266ae1c
	lda	[%i3+%g0]0x88,%f17	! %f17 = d1f2e9c8
!	Mem[0000000010001400] = 00ff3083 6139a7a3 018a25d8 3592e3ff
!	Mem[0000000010001410] = ff455167 018a25d8 fb9706db 8b0c1328
!	Mem[0000000010001420] = 000000d9 00000059 0000ffff 302e35ab
!	Mem[0000000010001430] = d48a37c5 911b8130 a8760424 6978bf4a
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000010041408] = 1c000054, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000054
!	Mem[00000000300c1400] = d8000009 bfb2887b bdb6f2d1 ddffffff
!	Mem[00000000300c1410] = 43bc2821 d1f2b6bd 071769f4 b1df1156
!	Mem[00000000300c1420] = 3a260c93 8badb4e6 4af804be d3e62a29
!	Mem[00000000300c1430] = 009b5e05 79575273 6c98c1bc 58812f0e
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[00000000100c1408] = bdb6f2d1ddffffff, %l7 = 00000000000000ff
	ldxa	[%i3+%o4]0x88,%l7	! %l7 = bdb6f2d1ddffffff
!	Mem[0000000030141400] = 76aee62d, %l3 = ffffffffffffffbc
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000002d
!	Mem[00000000100c1400] = 43bc2821 d1f2e9c8, %l4 = cb8d75d2, %l5 = ffffb2bf
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 00000000d1f2e9c8 0000000043bc2821
!	Mem[0000000030181410] = 6c3a0e68 736f228e, %l2 = 00000054, %l3 = 0000002d
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000006c3a0e68 00000000736f228e
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = 9e87c233, %l5 = 43bc2821, %l2 = 6c3a0e68
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 000000009e87c233

p0_label_48:
!	%l0 = 00000000000000ff, Mem[0000000010181424] = b7e5a7dc, %asi = 80
	stwa	%l0,[%i6+0x024]%asi	! Mem[0000000010181424] = 000000ff
!	%l7 = bdb6f2d1ddffffff, Mem[00000000201c0000] = ffff075f, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff075f
!	%l5 = 0000000043bc2821, Mem[0000000010141400] = 7b88b2bf
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 2821b2bf
!	%l2 = 000000009e87c233, Mem[00000000100c1400] = d1f2e9c8
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 9e87c233
!	Mem[0000000010041433] = d4d07454, %l1 = 0000000067000000
	ldstuba	[%i1+0x033]%asi,%l1	! %l1 = 00000054000000ff
!	%l4 = 00000000d1f2e9c8, Mem[0000000010101408] = 1c000000
	stba	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 1c0000c8
!	%l0 = 00000000000000ff, Mem[0000000030081410] = 0fa909189feecd5e
	stxa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000000000ff
!	%l1 = 0000000000000054, Mem[0000000030181410] = 6c3a0e68
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000054
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 00000000d1f2e9c8, Mem[000000001000142e] = 302e35ab
	sth	%l4,[%i0+0x02e]		! Mem[000000001000142c] = 302ee9c8
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff969edc4bdf8c9a, %l4 = 00000000d1f2e9c8
	ldxa	[%i2+0x010]%asi,%l4	! %l4 = ff969edc4bdf8c9a

p0_label_49:
!	Mem[0000000010101400] = 000b4cd9d8000000, %f8  = 3a260c93 8badb4e6
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = 000b4cd9 d8000000
!	Mem[0000000010101408] = c800001c, %f13 = 79575273
	lda	[%i4+%o4]0x80,%f13	! %f13 = c800001c
!	Mem[0000000030181400] = 76ae30a5, %l3 = 00000000736f228e
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = 00000000000076ae
!	Mem[0000000030041410] = dd013e6a47e5d6af, %f22 = e00dcf28 5f03e6b5
	ldda	[%i1+%o5]0x81,%f22	! %f22 = dd013e6a 47e5d6af
!	%f28 = ff969edc, %f20 = 5ecdee9f, %f4  = 43bc2821
	fmuls	%f28,%f20,%f4 		! %f4  = ffd69edc
!	Mem[00000000300c1410] = 43bc2821, %l1 = 0000000000000054
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 00000000000043bc
!	Mem[0000000010081400] = d8258a01 fa6bb877, %l4 = 4bdf8c9a, %l5 = 43bc2821
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000d8258a01 00000000fa6bb877
!	%l5 = 00000000fa6bb877, immd = fffffffffffff489, %l6 = 00000000dd013e6a
	sdivx	%l5,-0xb77,%l6		! %l6 = ffffffffffea2853
!	Mem[00000000211c0000] = ffffd61d, %l5 = 00000000fa6bb877
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f22 = dd013e6a 47e5d6af, Mem[00000000100c1418] = e29f9678 8bdf57f2
	std	%f22,[%i3+0x018]	! Mem[00000000100c1418] = dd013e6a 47e5d6af

p0_label_50:
!	Mem[0000000010001408] = 018a25d8, %l7 = bdb6f2d1ddffffff
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 00000001000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 000000009e87c233
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = ff455167, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff455167
!	Mem[0000000030101410] = 0000ffff, %l2 = 00000000ff455167
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010001410] = 675145ff, %l3 = 00000000000076ae
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141429] = 11fb7f67, %l6 = ffffffffffea2853
	ldstub	[%i5+0x029],%l6		! %l6 = 000000fb000000ff
!	%l1 = 00000000000043bc, Mem[0000000030101410] = ff455167
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 000043bc
!	%l5 = 000000000000ffff, Mem[0000000020800001] = 5398b0a2
	stb	%l5,[%o1+0x001]		! Mem[0000000020800000] = 53ffb0a2
!	%l1 = 00000000000043bc, Mem[0000000010101408] = c800001c000b4cd9
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000043bc
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %l0 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 000000000000ff00

p0_label_51:
!	Mem[0000000010081410] = ff969edc4bdf8c9a, %f8  = 000b4cd9 d8000000
	ldda	[%i2+0x010]%asi,%f8 	! %f8  = ff969edc 4bdf8c9a
!	Mem[0000000030181410] = 54000000, %l3 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 54000000, %l6 = 00000000000000fb
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l4 = 00000000d8258a01
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 000043bc, %l1 = 00000000000043bc
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 33c2879e, %l5 = 000000000000ffff
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = 0000000033c2879e
!	Mem[0000000030081408] = ff455167f074df67, %f14 = 6c98c1bc 58812f0e
	ldda	[%i2+%o4]0x89,%f14	! %f14 = ff455167 f074df67
!	Mem[0000000010101408] = 00000000000043bc, %l2 = 000000000000ffff
	ldx	[%i4+%o4],%l2		! %l2 = 00000000000043bc
!	Mem[0000000010041400] = 6978bf4a 00000000, %l4 = 00000000, %l5 = 33c2879e
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 000000006978bf4a 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001410] = 675145ff
	stha	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 67510000

p0_label_52:
!	%l2 = 000043bc, %l3 = 00000000, Mem[0000000010181400] = 0d000000 c8a3b3a7
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000043bc 00000000
!	%l5 = 0000000000000000, Mem[0000000010101438] = ec51d404ff07799c
	stx	%l5,[%i4+0x038]		! Mem[0000000010101438] = 0000000000000000
!	Mem[0000000030101410] = 000043bc, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[000000001018143c] = 33dde30d, %l1 = 00000000, %l0 = 0000ff00
	add	%i6,0x3c,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 0000000033dde30d
!	%f14 = ff455167, Mem[0000000030001410] = cb8d75d2
	sta	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = ff455167
!	%l6 = 0000000000000000, Mem[00000000201c0001] = ffff075f
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff00075f
!	%l4 = 000000006978bf4a, Mem[00000000211c0001] = ffffd61d
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ff4ad61d
!	%f26 = 11fb7f67, Mem[0000000010181414] = 000000d9
	st	%f26,[%i6+0x014]	! Mem[0000000010181414] = 11fb7f67
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = 4bdf8c9a, %l4 = 000000006978bf4a
	lduha	[%i2+0x014]%asi,%l4	! %l4 = 0000000000004bdf

p0_label_53:
!	Mem[0000000020800000] = 53ffb0a2, %l0 = 0000000033dde30d
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = 00000000000053ff
!	Mem[0000000030001408] = 2227a4bd, %l4 = 0000000000004bdf
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 000000000000a4bd
!	Mem[00000000201c0000] = ff00075f, %l7 = 0000000000000001
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffff00
!	%f17 = d1f2e9c8, %f0  = d8000009, %f25 = 80786cd9
	fsubs	%f17,%f0 ,%f25		! %f25 = 57fff0e3
!	Mem[0000000030001408] = bda42722, %l1 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffbda4
!	Mem[0000000030041400] = 000000ff 50f59c61, %l0 = 000053ff, %l1 = ffffbda4
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000ff 0000000050f59c61
!	%l1 = 0000000050f59c61, %l4 = 000000000000a4bd, %l7 = ffffffffffffff00
	and	%l1,%l4,%l7		! %l7 = 0000000000008421
!	Mem[00000000100c1410] = f074df03, %l4 = 000000000000a4bd
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000f074df03
!	Mem[0000000010001400] = 00ff30836139a7a3, %l2 = 00000000000043bc
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 00ff30836139a7a3
!	Starting 10 instruction Store Burst
!	%f20 = 5ecdee9f 1809a90f, Mem[0000000010001400] = 00ff3083 6139a7a3
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = 5ecdee9f 1809a90f

p0_label_54:
!	%f29 = 4bdf8c9a, Mem[0000000010081408] = b6e9ee67
	sta	%f29,[%i2+%o4]0x88	! Mem[0000000010081408] = 4bdf8c9a
!	%f8  = ff969edc 4bdf8c9a, Mem[0000000030001408] = bda42722 1c000000
	stda	%f8 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ff969edc 4bdf8c9a
!	%l0 = 00000000000000ff, imm = 00000000000009f1, %l1 = 0000000050f59c61
	xor	%l0,0x9f1,%l1		! %l1 = 000000000000090e
!	Mem[0000000010181400] = 000043bc, %l4 = 00000000f074df03
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000000043bc
!	Mem[0000000030001408] = dc9e96ff, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 00000000dc9e96ff
!	Mem[000000001010142c] = 15176a9c, %l0 = 000000ff, %l3 = 00000000
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000015176a9c
!	%l6 = 0000000000000000, Mem[0000000010001430] = d48a37c5
	stw	%l6,[%i0+0x030]		! Mem[0000000010001430] = 00000000
!	Mem[00000000300c1400] = 090000d8, %l4 = 00000000000043bc
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000090000d8
!	Mem[0000000030141408] = 00000000, %l0 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 11ff7f67ef082ea8, %l0 = 0000000000000000
	ldxa	[%i5+0x028]%asi,%l0	! %l0 = 11ff7f67ef082ea8

p0_label_55:
!	Mem[0000000030081410] = 00000000000000ff, %l0 = 11ff7f67ef082ea8
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 944b365b000000ff, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 944b365b000000ff
!	Mem[0000000010101434] = 9a69f871, %l7 = 0000000000008421
	lduba	[%i4+0x037]%asi,%l7	! %l7 = 0000000000000071
!	Mem[00000000100c1410] = f074df03, %l0 = 944b365b000000ff
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000f074df03
!	Mem[00000000100c1400] = 33c2879e2128bc43, %l0 = 00000000f074df03
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 33c2879e2128bc43
!	Mem[00000000211c0000] = ff4ad61d, %l5 = 00000000dc9e96ff
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 000000000000004a
!	Mem[00000000300c1410] = 43bc2821, %l4 = 00000000090000d8
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = 00000000000043bc
!	Mem[0000000030001400] = ffb6f2d1, %l7 = 0000000000000071
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[000000001008140c] = c5b79c33, %l4 = 00000000000043bc
	ldsh	[%i2+0x00e],%l4		! %l4 = ffffffffffff9c33
!	Starting 10 instruction Store Burst
!	%l2 = 00ff30836139a7a3, Mem[0000000030041410] = 6a3e01dd
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 6a3e01a3

p0_label_56:
!	%l0 = 33c2879e2128bc43, Mem[0000000010001408] = ff8a25d8
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 2128bc43
!	Mem[00000000100c1430] = e3e681f3, %l3 = 0000000015176a9c
	swap	[%i3+0x030],%l3		! %l3 = 00000000e3e681f3
!	%f6  = 071769f4 b1df1156, Mem[0000000030141408] = ff000000 00000000
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 071769f4 b1df1156
!	%l5 = 000000000000004a, Mem[0000000030141400] = 2de6ae76
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 4ae6ae76
!	%f28 = ff969edc 4bdf8c9a, %l1 = 000000000000090e
!	Mem[0000000030001418] = b96ad1d6e51fe5e2
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030001418] = b98cdf4be51fe5e2
!	%l6 = 0000000000000000, Mem[000000001014141a] = e00dcf28, %asi = 80
	stba	%l6,[%i5+0x01a]%asi	! Mem[0000000010141418] = e00d0028
!	%l2 = 00ff30836139a7a3, Mem[0000000021800040] = 00ff856a
	sth	%l2,[%o3+0x040]		! Mem[0000000021800040] = a7a3856a
!	%l2 = 00ff30836139a7a3, Mem[0000000030041408] = 00000000
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = a3000000
!	Mem[0000000010181400] = f074df0300000000, %l1 = 000000000000090e, %l0 = 33c2879e2128bc43
	casxa	[%i6]0x80,%l1,%l0	! %l0 = f074df0300000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff8e3083, %l4 = ffffffffffff9c33
	lduwa	[%i1+0x010]%asi,%l4	! %l4 = 00000000ff8e3083

p0_label_57:
!	Mem[0000000010181410] = 000000ff, %l1 = 000000000000090e
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = a3013e6a, %l7 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000a3013e6a
!	Mem[0000000030101400] = ff000000 5b364bbd, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 000000005b364bbd 00000000ff000000
!	%f3  = ddffffff, %f10 = 4af804be d3e62a29
	fstox	%f3 ,%f10		! %f10 = e0000020 00000000
!	Mem[00000000100c1408] = ddffffff, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = bfb22128, %f18 = ff455167
	lda	[%i5+%g0]0x88,%f18	! %f18 = bfb22128
!	Mem[0000000030181408] = 7b88b2bf, %f26 = 11fb7f67
	lda	[%i6+%o4]0x81,%f26	! %f26 = 7b88b2bf
!	Mem[0000000030141408] = f4691707, %l5 = 000000000000004a
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000001707
!	Mem[0000000010101400] = d94c0b00, %l1 = 00000000ff000000
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffd94c0b00
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000001707
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 000000ff000000ff

p0_label_58:
!	Mem[0000000030081400] = ff000000, %l3 = 00000000e3e681f3
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%f0  = d8000009, %f25 = 57fff0e3, %f0  = d8000009
	fdivs	%f0 ,%f25,%f0 		! %f0  = bf800798
!	%f24 = f995557c 57fff0e3, %l0 = 000000005b364bbd
!	Mem[0000000010101410] = 03df74f0f2f38b70
	add	%i4,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_P ! Mem[0000000010101410] = f9df557c57ff8be3
!	%l2 = 6139a7a3, %l3 = 000000ff, Mem[0000000030041410] = 6a3e01a3 afd6e547
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 6139a7a3 000000ff
!	Mem[0000000010001408] = 2128bc43, %l7 = 00000000a3013e6a
	swap	[%i0+%o4],%l7		! %l7 = 000000002128bc43
!	Mem[0000000010081408] = 4bdf8c9a, %l2 = 00ff30836139a7a3
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 0000009a000000ff
!	%l4 = ff8e3083, %l5 = 000000ff, Mem[0000000030001400] = ffb6f2d1 00000000
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ff8e3083 000000ff
!	%l0 = 5b364bbd, %l1 = d94c0b00, Mem[0000000030081408] = f074df67 ff455167
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 5b364bbd d94c0b00
!	%l5 = 00000000000000ff, Mem[0000000030001410] = 675145ff
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 03df74f0, %l4 = 00000000ff8e3083
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 0000000003df74f0

p0_label_59:
!	Mem[0000000010181410] = 000000ff, %f3  = ddffffff
	lda	[%i6+%o5]0x88,%f3 	! %f3 = 000000ff
!	Mem[0000000010141408] = 03df74f0675145ff, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = 03df74f0675145ff
!	Mem[0000000010181400] = f074df03, %l7 = 000000002128bc43
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = fffffffffffffff0
!	%l1 = ffffffffd94c0b00, %l2 = 000000000000009a, %l6 = ffffffffffffffff
	add	%l1,%l2,%l6		! %l6 = ffffffffd94c0b9a
!	Mem[0000000010141400] = 2821b2bff266ae1c, %f6  = 071769f4 b1df1156
	ldda	[%i5+%g0]0x80,%f6 	! %f6  = 2821b2bf f266ae1c
!	Mem[00000000100c1438] = ffffffc8, %l4 = 0000000003df74f0
	lduwa	[%i3+0x038]%asi,%l4	! %l4 = 00000000ffffffc8
!	Mem[0000000030181408] = c0aaa71abfb2887b, %l4 = 00000000ffffffc8
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = c0aaa71abfb2887b
!	Mem[0000000030041410] = 6139a7a3, %l6 = ffffffffd94c0b9a
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffa7a3
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f15 = f074df67, Mem[0000000010001400] = 5ecdee9f
	sta	%f15,[%i0+%g0]0x80	! Mem[0000000010001400] = f074df67

p0_label_60:
!	Mem[0000000010141400] = 2821b2bf, %l1 = ffffffffd94c0b00
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 000000002821b2bf
!	Mem[0000000030181410] = 00000054, %l7 = fffffffffffffff0
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000054
!	Mem[0000000010001428] = 0000ffff302ee9c8, %l3 = 03df74f0675145ff, %l5 = 0000000000000000
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 0000ffff302ee9c8
!	Mem[0000000010181408] = 00000000, %l3 = 03df74f0675145ff
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000005b364bbd
	setx	0xa6aa6c8077d5d4ee,%g7,%l0 ! %l0 = a6aa6c8077d5d4ee
!	%l1 = 000000002821b2bf
	setx	0x01b965f84706440d,%g7,%l1 ! %l1 = 01b965f84706440d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a6aa6c8077d5d4ee
	setx	0xa7714977cc14e735,%g7,%l0 ! %l0 = a7714977cc14e735
!	%l1 = 01b965f84706440d
	setx	0x4093a0503bd7a23a,%g7,%l1 ! %l1 = 4093a0503bd7a23a
!	%f16 = 7b88b2bf d1f2e9c8, Mem[0000000010081410] = ff969edc 4bdf8c9a
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 7b88b2bf d1f2e9c8
!	%l7 = 0000000000000054, Mem[0000000030041408] = 000000a3
	stwa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000054
!	%l0 = a7714977cc14e735, Mem[00000000300c1408] = bdb6f2d1
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = e735f2d1
!	%l6 = ffffffffffffa7a3, Mem[0000000030181408] = 7b88b2bf
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = a7a3b2bf
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 03df74f0, %l0 = a7714977cc14e735
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = fffffffffffffff0

p0_label_61:
!	%f11 = 00000000, %f28 = ff969edc, %f1  = bfb2887b
	fadds	%f11,%f28,%f1 		! %f1  = ffd69edc
!	Mem[0000000030001408] = ff969edc, %l1 = 4093a0503bd7a23a
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ff96
!	Mem[0000000010001410] = 00005167, %l1 = 000000000000ff96
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = c8e9f2d1 bfb2887b, %l6 = ffffa7a3, %l7 = 00000054
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 00000000bfb2887b 00000000c8e9f2d1
!	Mem[0000000010141420] = f995557c80786cd9, %f2  = bdb6f2d1 000000ff
	ldda	[%i5+0x020]%asi,%f2 	! %f2  = f995557c 80786cd9
!	Mem[0000000030081400] = ff000000 5b364b94, %l0 = fffffff0, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000005b364b94
!	Mem[0000000020800040] = eafa2222, %l7 = 00000000c8e9f2d1
	ldsb	[%o1+0x040],%l7		! %l7 = ffffffffffffffea
!	Mem[0000000010141400] = 000b4cd9, %l1 = 000000005b364b94
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000000b4cd9
!	Mem[0000000010181410] = ff00000011fb7f67, %f16 = 7b88b2bf d1f2e9c8
	ldda	[%i6+%o5]0x80,%f16	! %f16 = ff000000 11fb7f67
!	Starting 10 instruction Store Burst
!	%f13 = c800001c, Mem[0000000030001408] = ff969edc
	sta	%f13,[%i0+%o4]0x81	! Mem[0000000030001408] = c800001c

p0_label_62:
!	Mem[00000000100c1410] = 03df74f0, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000003df74f0
!	Mem[0000000010141428] = 11ff7f67ef082ea8, %l4 = c0aaa71abfb2887b, %l3 = 0000000003df74f0
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 11ff7f67ef082ea8
!	Mem[00000000100c1400] = 33c2879e, %l7 = ffffffffffffffea
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000033000000ff
!	%l2 = 000000000000009a, Mem[0000000010041408] = 1c000054
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 1c00009a
!	%l2 = 000000000000009a, Mem[000000001014143e] = 195c64bd, %asi = 80
	stba	%l2,[%i5+0x03e]%asi	! Mem[000000001014143c] = 195c9abd
!	Mem[0000000030041400] = ff000000, %l2 = 000000000000009a
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 11ff7f67ef082ea8, Mem[0000000020800000] = 53ffb0a2
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = a8ffb0a2
!	%f17 = 11fb7f67, Mem[0000000010001404] = 1809a90f
	sta	%f17,[%i0+0x004]%asi	! Mem[0000000010001404] = 11fb7f67
!	%l7 = 0000000000000033, Mem[0000000010101400] = d94c0b00
	stha	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = d94c0033
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff8cdf4b, %l7 = 0000000000000033
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffff8c

p0_label_63:
!	Mem[0000000010141410] = 00000000 ffff0000, %l0 = ff000000, %l1 = 000b4cd9
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000ffff0000
!	Mem[0000000030041408] = 00000054, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000054
!	Mem[0000000010081404] = fa6bb877, %l2 = 0000000000000054
	ldsw	[%i2+0x004],%l2		! %l2 = fffffffffa6bb877
!	Mem[000000001000143c] = 6978bf4a, %f12 = 009b5e05
	lda	[%i0+0x03c]%asi,%f12	! %f12 = 6978bf4a
!	Mem[0000000030141400] = 76aee64a, %f7  = f266ae1c
	lda	[%i5+%g0]0x89,%f7 	! %f7 = 76aee64a
!	Mem[0000000010041410] = ff8e3083ffffffff, %f6  = 2821b2bf 76aee64a
	ldda	[%i1+%o5]0x80,%f6 	! %f6  = ff8e3083 ffffffff
!	Mem[00000000218001c0] = 2f6a07db, %l7 = ffffffffffffff8c
	lduh	[%o3+0x1c0],%l7		! %l7 = 0000000000002f6a
!	Mem[0000000010181430] = 0000000d, %l6 = 00000000bfb2887b
	ldub	[%i6+0x033],%l6		! %l6 = 000000000000000d
!	Mem[0000000010181410] = ff000000, %l7 = 0000000000002f6a
	ldswa	[%i6+%o5]0x80,%l7	! %l7 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = fffffff0, %l1 = 00000000ffff0000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000fffffff0

p0_label_64:
!	%l7 = ffffffffff000000, immd = fffffffffffff9dc, %l0 = 0000000000000000
	sdivx	%l7,-0x624,%l0		! %l0 = 00000000000029b0
!	Mem[00000000100c1408] = ddffffff, %l3 = 11ff7f67ef082ea8
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101410] = 7c55dff9, %l4 = c0aaa71abfb2887b
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 000000007c55dff9
!	Mem[0000000010001437] = 911b8130, %l1 = 00000000fffffff0
	ldstub	[%i0+0x037],%l1		! %l1 = 00000030000000ff
!	Mem[0000000010181408] = 675145ff, %l1 = 0000000000000030
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000675145ff
!	%f28 = ff969edc, Mem[0000000010041400] = 4abf7869
	sta	%f28,[%i1+%g0]0x88	! Mem[0000000010041400] = ff969edc
!	Mem[0000000010101436] = 9a69f871, %l3 = 00000000000000ff
	ldstuba	[%i4+0x036]%asi,%l3	! %l3 = 000000f8000000ff
!	%l2 = fa6bb877, %l3 = 000000f8, Mem[0000000010001428] = 0000ffff 302ee9c8
	std	%l2,[%i0+0x028]		! Mem[0000000010001428] = fa6bb877 000000f8
!	%l0 = 00000000000029b0, Mem[0000000030001400] = ff8e3083
	stha	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 29b03083
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = d94c0b00f266ae1c, %l7 = ffffffffff000000
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = d94c0b00f266ae1c

p0_label_65:
!	Mem[0000000030041410] = a3a73961, %l3 = 00000000000000f8
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000a3a73961
!	Mem[0000000030141400] = 76aee64a, %l6 = 000000000000000d
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = 000000000000004a
!	Mem[0000000020800000] = a8ffb0a2, %l5 = 0000ffff302ee9c8
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000a8ff
!	Mem[0000000030081408] = 5b364bbd, %l3 = 00000000a3a73961
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000004bbd
!	Mem[0000000030001410] = 000000ffffffffff, %l1 = 00000000675145ff
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 000000ffffffffff
!	Mem[00000000100c142c] = ffffffd8, %l3 = 0000000000004bbd
	ldsw	[%i3+0x02c],%l3		! %l3 = ffffffffffffffd8
!	Mem[0000000010041400] = dc9e96ff, %l5 = 000000000000a8ff
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000dc9e96ff
!	Mem[0000000030141410] = dbafd7f7, %l7 = d94c0b00f266ae1c
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 00000000dbafd7f7
!	Mem[0000000030041408] = 54000000, %l0 = 00000000000029b0
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000005400
!	Starting 10 instruction Store Burst
!	Mem[0000000021800041] = a7a3856a, %l4 = 000000007c55dff9
	ldstub	[%o3+0x041],%l4		! %l4 = 000000a3000000ff

p0_label_66:
!	%f20 = 5ecdee9f, Mem[00000000300c1410] = 43bc2821
	sta	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = 5ecdee9f
!	Mem[0000000020800000] = a8ffb0a2, %l6 = 000000000000004a
	ldstub	[%o1+%g0],%l6		! %l6 = 000000a8000000ff
!	Mem[0000000010001400] = f074df67, %l5 = 00000000dc9e96ff
	ldstub	[%i0+%g0],%l5		! %l5 = 000000f0000000ff
!	%l3 = ffffffffffffffd8, Mem[0000000030101400] = bd4b365b
	stha	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = ffd8365b
!	%f29 = 4bdf8c9a, %f14 = ff455167
	fcmpes	%fcc2,%f29,%f14		! %fcc2 = 2
!	Mem[0000000030001410] = ff000000, %l7 = 00000000dbafd7f7
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000ff000000
!	%f16 = ff000000 11fb7f67 bfb22128 f074df03
!	%f20 = 5ecdee9f 1809a90f dd013e6a 47e5d6af
!	%f24 = f995557c 57fff0e3 7b88b2bf ef082ea8
!	%f28 = ff969edc 4bdf8c9a 0000ffff 000000ff
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[000000001010141c] = 7fc8e475, %l5 = 00000000000000f0, %asi = 80
	swapa	[%i4+0x01c]%asi,%l5	! %l5 = 000000007fc8e475
!	%f15 = f074df67, Mem[000000001018140c] = 018a25d8
	st	%f15,[%i6+0x00c]	! Mem[000000001018140c] = f074df67
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 76ae30a5, %l5 = 000000007fc8e475
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000076

p0_label_67:
!	Mem[0000000010001410] = 00005167, %l4 = 00000000000000a3
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000005167
!	Mem[0000000030181400] = 76ae30a5, %l2 = fffffffffa6bb877
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 00000000000076ae
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141424] = 57fff0e3, %l3 = ffffffffffffffd8
	lduw	[%i5+0x024],%l3		! %l3 = 0000000057fff0e3
!	Mem[0000000010081400] = d8258a01, %l5 = 0000000000000076
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 00000000d8258a01
!	Mem[0000000010181408] = 30000000, %l3 = 0000000057fff0e3
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ff4ad61d, %l2 = 00000000000076ae
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffff4a
!	Mem[0000000010141400] = ff000000, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001400] = ff74df67, %l4 = 0000000000005167
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff74df67
!	%f30 = 0000ffff, %f8  = ff969edc
	fsqrts	%f30,%f8 		! %l0 = 0000000000005422, Unfinished, %fsr = 0a00000400
!	Starting 10 instruction Store Burst
!	%f20 = 5ecdee9f, %f15 = f074df67
	fcmpes	%fcc0,%f20,%f15		! %fcc0 = 2

p0_label_68:
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000000005422
	setx	0xeef01bdfa0a17b45,%g7,%l0 ! %l0 = eef01bdfa0a17b45
!	%l1 = 000000ffffffffff
	setx	0x9d9f8bb066116a1b,%g7,%l1 ! %l1 = 9d9f8bb066116a1b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = eef01bdfa0a17b45
	setx	0x29dfe5503651a4f5,%g7,%l0 ! %l0 = 29dfe5503651a4f5
!	%l1 = 9d9f8bb066116a1b
	setx	0x99647f6781acd7db,%g7,%l1 ! %l1 = 99647f6781acd7db
!	%l5 = 00000000d8258a01, Mem[00000000211c0000] = ff4ad61d, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 014ad61d
!	%l6 = 00000000000000a8, Mem[0000000010181408] = 00000030
	stw	%l6,[%i6+%o4]		! Mem[0000000010181408] = 000000a8
!	Mem[0000000030081408] = 5b364bbd, %l1 = 99647f6781acd7db
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000bd000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141408] = bfb22128
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff2128
!	%f0  = bf800798 ffd69edc f995557c 80786cd9
!	%f4  = ffd69edc d1f2b6bd ff8e3083 ffffffff
!	%f8  = ff969edc 4bdf8c9a e0000020 00000000
!	%f12 = 6978bf4a c800001c ff455167 f074df67
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%f18 = bfb22128 f074df03, Mem[0000000010181410] = 000000ff 677ffb11
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = bfb22128 f074df03
!	Mem[0000000010081410] = 7b88b2bf, %l5 = 00000000d8258a01
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000007b000000ff
!	%l4 = ffffffffff74df67, Mem[00000000100c1410] = d1f2b6bd
	stwa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff74df67
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 67510000, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 0000000067510000

p0_label_69:
!	%f19 = f074df03, %f20 = 5ecdee9f, %f24 = f995557c 57fff0e3
	fsmuld	%f19,%f20,%f24		! %f24 = c9f89f5a 9a499ba0
!	Mem[0000000030141410] = f7d7afdb, %l1 = 00000000000000bd
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffafdb
	membar	#Sync			! Added by membar checker (12)
!	Mem[00000000100c1400] = ffd69edc, %l4 = ffffffffff74df67
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 0000000000009edc
!	Mem[0000000010081400] = 77b86bfa 018a25d8, %l0 = 3651a4f5, %l1 = ffffafdb
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000018a25d8 0000000077b86bfa
!	Mem[000000001004143c] = dd3363dc, %l3 = 0000000067510000
	lduba	[%i1+0x03d]%asi,%l3	! %l3 = 0000000000000033
!	Mem[0000000020800040] = eafa2222, %l7 = 00000000ff000000
	ldsb	[%o1+0x041],%l7		! %l7 = fffffffffffffffa
!	Mem[00000000201c0000] = ff00075f, %l5 = 000000000000007b
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030141410] = 67000000 f7d7afdb, %l2 = ffffff4a, %l3 = 00000033
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000f7d7afdb 0000000067000000
!	Mem[0000000030001408] = 1c0000c8, %l1 = 0000000077b86bfa
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 000000001c0000c8
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffffb0a2, %l3 = 0000000067000000
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_70:
!	Mem[0000000030141410] = f7d7afdb, %l5 = ffffffffffffff00
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000f7d7afdb
!	%l0 = 00000000018a25d8, Mem[0000000010001403] = ff74df67
	stb	%l0,[%i0+0x003]		! Mem[0000000010001400] = ff74dfd8
!	Mem[00000000211c0000] = 014ad61d, %l0 = 00000000018a25d8
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000001
!	%l3 = 00000000000000ff, Mem[000000001010143a] = 00000000
	sth	%l3,[%i4+0x03a]		! Mem[0000000010101438] = 000000ff
!	%l6 = 000000a8, %l7 = fffffffa, Mem[0000000010101408] = 00000000 000043bc
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000a8 fffffffa
!	%l2 = f7d7afdb, %l3 = 000000ff, Mem[0000000030001410] = f7d7afdb ffffffff
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = f7d7afdb 000000ff
!	%l2 = 00000000f7d7afdb, Mem[00000000300c1410] = 5ecdee9fd1f2b6bd
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000f7d7afdb
!	Mem[0000000010081408] = 4bdf8cff, %l7 = fffffffffffffffa
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 000000004bdf8cff
!	Mem[0000000021800101] = b7ff6d5f, %l0 = 0000000000000001
	ldstub	[%o3+0x101],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 0000ffff 000000ff, %l2 = f7d7afdb, %l3 = 000000ff
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 000000000000ffff 00000000000000ff

p0_label_71:
!	Mem[0000000030181410] = ffff0000, %l3 = 00000000000000ff
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffff0000
!	Mem[0000000010041408] = 9a00001c, %l1 = 000000001c0000c8
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 000000009a00001c
!	Mem[0000000010101410] = bfb2887b, %l2 = 000000000000ffff
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 000000000000007b
!	Mem[0000000010181400] = f074df0300000000, %l7 = 000000004bdf8cff
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = f074df0300000000
!	Mem[0000000010101400] = d94c0033, %l3 = ffffffffffff0000
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000033
!	Mem[0000000030101400] = ffd8365b, %l7 = f074df0300000000
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffd8
!	Mem[0000000010101410] = 7b88b2bf, %l1 = 000000009a00001c
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 000000000000007b
!	Mem[0000000010181408] = 000000a8, %l7 = ffffffffffffffd8
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000a8
!	%f5  = d1f2b6bd, %f11 = 00000000, %f23 = 47e5d6af
	fdivs	%f5 ,%f11,%f23		! %f23 = ff800000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = f4691707, %l6 = 00000000000000a8
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000007000000ff

p0_label_72:
!	%l3 = 0000000000000033, Mem[0000000010041410] = 83308eff
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 83300033
!	%l6 = 0000000000000007, Mem[0000000010101400] = 33004cd9d8000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000007
!	%f28 = ff969edc, Mem[0000000010101408] = a8000000
	sta	%f28,[%i4+%o4]0x88	! Mem[0000000010101408] = ff969edc
!	%l7 = 00000000000000a8, immd = 00000000000008f3, %l3 = 0000000000000033
	sdivx	%l7,0x8f3,%l3		! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001410] = d8258a0167510000
	stxa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f28 = ff969edc, Mem[00000000100c1430] = 1c0000c8
	sta	%f28,[%i3+0x030]%asi	! Mem[00000000100c1430] = ff969edc
!	%l0 = 00000000000000ff, Mem[0000000020800040] = eafa2222
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00ff2222
!	Mem[0000000010141410] = 9feecd5e, %l4 = 0000000000009edc
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000005e000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001410] = dbafd7f7
	stha	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = dbaf00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f2  = f995557c
	lda	[%i0+%o5]0x88,%f2 	! %f2 = 00000000

p0_label_73:
!	Mem[00000000100c1418] = ffffffff, %l2 = 000000000000007b
	lduw	[%i3+0x018],%l2		! %l2 = 00000000ffffffff
!	Mem[0000000010041410] = 33003083, %f29 = 4bdf8c9a
	lda	[%i1+%o5]0x80,%f29	! %f29 = 33003083
!	Mem[0000000010181420] = c3a609f9, %l6 = 0000000000000007
	ldswa	[%i6+0x020]%asi,%l6	! %l6 = ffffffffc3a609f9
!	Mem[0000000030081410] = ff000000 00000000, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010141400] = 000000ff, %f8  = ff969edc
	lda	[%i5+%g0]0x88,%f8 	! %f8 = 000000ff
!	Mem[0000000030181400] = a530ae76, %l6 = ffffffffc3a609f9
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000a530ae76
!	Mem[00000000300c1400] = 000043bc, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000043bc
!	Mem[0000000010081414] = d1f2e9c8, %l4 = 000000000000005e
	ldub	[%i2+0x017],%l4		! %l4 = 00000000000000c8
!	Mem[0000000010081400] = 018a25d8, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 00000000000025d8
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = d1f2b77a, %l3 = 00000000ff000000
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000d1000000ff

p0_label_74:
!	%l3 = 00000000000000d1, Mem[0000000010001408] = 6a3e01a3
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 6a3e00d1
!	%f25 = 9a499ba0, Mem[000000001004140c] = 99bf8523
	st	%f25,[%i1+0x00c]	! Mem[000000001004140c] = 9a499ba0
!	%l5 = 00000000f7d7afdb, Mem[0000000030181410] = 0000ffff
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000afdb
!	%f0  = bf800798 ffd69edc 00000000 80786cd9
!	%f4  = ffd69edc d1f2b6bd ff8e3083 ffffffff
!	%f8  = 000000ff 4bdf8c9a e0000020 00000000
!	%f12 = 6978bf4a c800001c ff455167 f074df67
	stda	%f0,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l2 = 000025d8, %l3 = 000000d1, Mem[00000000100c1400] = dc9ed6ff 980780bf
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000025d8 000000d1
!	%f24 = c9f89f5a, Mem[0000000030001410] = ff00afdb
	sta	%f24,[%i0+%o5]0x81	! Mem[0000000030001410] = c9f89f5a
!	%f16 = ff000000 11fb7f67, %l0 = 00000000000043bc
!	Mem[0000000030001410] = c9f89f5a000000ff
	add	%i0,0x010,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_S ! Mem[0000000030001410] = fff8000011fb00ff
!	%f27 = ef082ea8, Mem[0000000010141400] = 000000ff
	sta	%f27,[%i5+%g0]0x88	! Mem[0000000010141400] = ef082ea8
!	Mem[0000000010141433] = ff969edc, %l0 = 00000000000043bc
	ldstub	[%i5+0x033],%l0		! %l0 = 000000dc000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d96c7880, %l0 = 00000000000000dc
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffffd9

p0_label_75:
!	Mem[0000000010181400] = 03df74f0, %l7 = 00000000000000a8
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 0000000003df74f0
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030081408] = 0000000080786cd9, %f20 = 5ecdee9f 1809a90f
	ldda	[%i2+%o4]0x81,%f20	! %f20 = 00000000 80786cd9
!	Mem[0000000030081408] = 00000000, %f0  = bf800798
	lda	[%i2+%o4]0x81,%f0 	! %f0 = 00000000
!	Mem[0000000030041410] = 6139a7a3, %l2 = 00000000000025d8
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = 000000006139a7a3
!	Mem[0000000030141410] = 00ffffff00000067, %f18 = bfb22128 f074df03
	ldda	[%i5+%o5]0x81,%f18	! %f18 = 00ffffff 00000067
!	Mem[00000000201c0000] = ff00075f, %l0 = ffffffffffffffd9
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 00ffffff, %l2 = 000000006139a7a3
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %f23 = ff800000
	lda	[%i2+%o4]0x81,%f23	! %f23 = 00000000
!	Mem[0000000010001410] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = e0000020 00000000, Mem[0000000030081410] = dc9ed6ff bdb6f2d1
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = e0000020 00000000

p0_label_76:
!	Mem[0000000010001408] = 6a3e00d1, %l2 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000d1000000ff
!	Mem[0000000030001400] = 29b03083, %l2 = 00000000000000d1
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 0000000029b03083
!	%f14 = ff455167 f074df67, Mem[0000000010081428] = 759de8e9 365480bc
	std	%f14,[%i2+0x028]	! Mem[0000000010081428] = ff455167 f074df67
!	Mem[0000000030001400] = 000000d1, %l5 = 00000000f7d7afdb
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f2  = 00000000 80786cd9, %l0 = 0000000000000000
!	Mem[0000000010101400] = 0000000000000007
	stda	%f2,[%i4+%l0]ASI_PST8_PL ! Mem[0000000010101400] = 0000000000000007
!	Mem[000000001018143e] = 33dde30d, %l0 = 0000000000000000
	ldstuba	[%i6+0x03e]%asi,%l0	! %l0 = 000000e3000000ff
!	%l2 = 0000000029b03083, Mem[0000000030001410] = ff00fb110000f8ff
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000029b03083
!	Mem[0000000010001408] = 6a3e00ff, %l1 = 000000000000007b
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101410] = 7b88b2bf, %l2 = 0000000029b03083
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 0000007b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = bfb288ff, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000088ff

p0_label_77:
!	Mem[0000000010181408] = a8000000, %l6 = 00000000a530ae76
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 9a00001c, %l4 = 00000000000000c8
	lduw	[%i1+%o4],%l4		! %l4 = 000000009a00001c
!	Mem[0000000010141410] = ffcdee9f, %l3 = 00000000000000d1
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000ffcd
!	Mem[0000000010101430] = 1b3bf8ff, %l0 = 00000000000000e3
	ldsh	[%i4+0x032],%l0		! %l0 = fffffffffffff8ff
!	Mem[0000000030181410] = dbaf0000 736f228e, %l0 = fffff8ff, %l1 = 000000ff
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000dbaf0000 00000000736f228e
!	Mem[0000000030101400] = ff0000005b36d8ff, %l0 = 00000000dbaf0000
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = ff0000005b36d8ff
!	%l1 = 00000000736f228e, immd = fffffffffffff766, %l6 = 0000000000000000
	sdivx	%l1,-0x89a,%l6		! %l6 = fffffffffff29473
!	Mem[0000000010001400] = d8df74ff, %l5 = 00000000000088ff
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ffd69edc ff74df67, %l6 = fff29473, %l7 = 03df74f0
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000ff74df67 00000000ffd69edc
!	Starting 10 instruction Store Burst
!	%l6 = ff74df67, %l7 = ffd69edc, Mem[0000000010141410] = ffcdee9f 1809a90f
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff74df67 ffd69edc

p0_label_78:
!	Mem[0000000030101410] = ff0043bc, %l2 = 000000000000007b
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff0043bc
!	%l0 = ff0000005b36d8ff, Mem[0000000030181410] = 8e226f730000afdb
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ff0000005b36d8ff
!	Mem[00000000100c1428] = 00000000, %l2 = 00000000ff0043bc, %asi = 80
	swapa	[%i3+0x028]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 8330b029, %l0 = ff0000005b36d8ff
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000083000000ff
!	Mem[0000000010001408] = 6a3e00ff, %l1 = 00000000736f228e
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 000000006a3e00ff
!	Mem[0000000030141410] = ffffff00, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 000000006a3e00ff, Mem[0000000010141400] = a82e08ef
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = ff2e08ef
!	Mem[0000000010141408] = 2821ff00, %l0 = 0000000000000083
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 000000002821ff00
!	%l2 = 0000000000000000, Mem[0000000010001416] = 00000000
	sth	%l2,[%i0+0x016]		! Mem[0000000010001414] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff88b2bf, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ff88

p0_label_79:
!	Mem[0000000010141408] = 83000000, %l1 = 000000006a3e00ff
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = ffffffff83000000
!	Mem[00000000300c1408] = e735f2d1, %l3 = 000000000000ffcd
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000e7
!	Mem[0000000030041408] = be4220a5 00000054, %l4 = 9a00001c, %l5 = 000000ff
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000054 00000000be4220a5
!	Mem[0000000030041400] = ff0000ff50f59c61, %f18 = 00ffffff 00000067
	ldda	[%i1+%g0]0x81,%f18	! %f18 = ff0000ff 50f59c61
!	Mem[00000000100c1408] = 80786cd9, %l3 = 00000000000000e7
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000d9
!	Mem[0000000010001410] = 00000000 00000000, %l4 = 00000054, %l5 = be4220a5
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000100c1400] = d8250000, %l0 = 000000002821ff00
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = faffffff, %l3 = 00000000000000d9
	ldsh	[%i2+%o4],%l3		! %l3 = fffffffffffffaff
!	Mem[00000000100c1434] = 4abf7869, %l1 = ffffffff83000000
	lduwa	[%i3+0x034]%asi,%l1	! %l1 = 000000004abf7869
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff88b2bf, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = ffffffffff88b2bf

p0_label_80:
!	%l6 = 00000000ff74df67, Mem[0000000010001408] = 736f228e
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 736f2267
!	%l5 = 0000000000000000, Mem[0000000010141404] = 11fb7f67, %asi = 80
	stwa	%l5,[%i5+0x004]%asi	! Mem[0000000010141404] = 00000000
!	%l6 = 00000000ff74df67, Mem[0000000021800040] = a7ff856a, %asi = 80
	stha	%l6,[%o3+0x040]%asi	! Mem[0000000021800040] = df67856a
!	%f26 = 7b88b2bf ef082ea8, %l0 = ffffffffff88b2bf
!	Mem[00000000300c1408] = e735f2d1ddffffff
	add	%i3,0x008,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_SL ! Mem[00000000300c1408] = a82e08efbfb2887b
!	%f12 = 6978bf4a c800001c, %l3 = fffffffffffffaff
!	Mem[0000000010181438] = 1cae66f233ddff0d
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010181438] = 1c0000c84abf7869
!	Mem[0000000010141420] = f995557c, %l3 = fffffffffffffaff
	ldstuba	[%i5+0x020]%asi,%l3	! %l3 = 000000f9000000ff
!	Randomly selected nop
	nop
!	%l0 = ff88b2bf, %l1 = 4abf7869, Mem[0000000010041408] = 9a00001c 9a499ba0
	std	%l0,[%i1+%o4]		! Mem[0000000010041408] = ff88b2bf 4abf7869
!	%l7 = 00000000ffd69edc, Mem[0000000030001410] = ff30b02900000000
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ffd69edc
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = ffbbf195, %l2 = 000000000000ff88
	lduwa	[%i2+0x030]%asi,%l2	! %l2 = 00000000ffbbf195

p0_label_81:
!	Mem[0000000030181400] = f909a6c3fc2a1b51, %f8  = 000000ff 4bdf8c9a
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = f909a6c3 fc2a1b51
!	Mem[00000000201c0000] = ff00075f, %l4 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1428] = ff0043bc 200000e0, %l0 = ff88b2bf, %l1 = 4abf7869
	ldda	[%i3+0x028]%asi,%l0	! %l0 = 00000000ff0043bc 00000000200000e0
!	Mem[0000000030001410] = dc9ed6ff00000000, %f22 = dd013e6a 00000000
	ldda	[%i0+%o5]0x89,%f22	! %f22 = dc9ed6ff 00000000
!	Mem[00000000100c1428] = ff0043bc200000e0, %l0 = 00000000ff0043bc, %l6 = 00000000ff74df67
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = ff0043bc200000e0
!	Mem[00000000100c1410] = 67df74ff, %l6 = ff0043bc200000e0
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000067
!	Mem[0000000010041420] = 7560c77f5442c92c, %f4  = ffd69edc d1f2b6bd
	ldd	[%i1+0x020],%f4 	! %f4  = 7560c77f 5442c92c
!	Mem[0000000010081438] = 6f0ac808, %l3 = 00000000000000f9
	lduw	[%i2+0x038],%l3		! %l3 = 000000006f0ac808
!	Mem[0000000010141408] = 00000083, %l5 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000083
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010181408] = 000000a8f074df67
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000

p0_label_82:
!	%f0  = 00000000 ffd69edc, %l0 = 00000000ff0043bc
!	Mem[00000000300c1400] = bc430000bfb2887b
	stda	%f0,[%i3+%l0]ASI_PST8_S ! Mem[00000000300c1400] = 00430000ffd6887b
!	%l5 = 0000000000000083, Mem[0000000030181410] = 5b36d8ff
	stwa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000083
!	Mem[0000000010141409] = 83000000, %l4 = 0000000000000000
	ldstuba	[%i5+0x009]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0001] = ff00075f, %l7 = 00000000ffd69edc
	ldstub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	%f27 = ef082ea8, Mem[0000000010001400] = ff74dfd8
	sta	%f27,[%i0+%g0]0x80	! Mem[0000000010001400] = ef082ea8
!	%l2 = 00000000ffbbf195, imm = fffffffffffff3ed, %l7 = 0000000000000000
	xnor	%l2,-0xc13,%l7		! %l7 = 00000000ffbbfd87
!	%f26 = 7b88b2bf ef082ea8, Mem[0000000030181400] = f909a6c3 fc2a1b51
	stda	%f26,[%i6+%g0]0x81	! Mem[0000000030181400] = 7b88b2bf ef082ea8
!	%f14 = ff455167 f074df67, Mem[0000000010081420] = bd66d286 cbbba13b
	std	%f14,[%i2+0x020]	! Mem[0000000010081420] = ff455167 f074df67
!	%l2 = 00000000ffbbf195, Mem[0000000030141408] = ff1769f4
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = f19569f4
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffb0a2, %l7 = 00000000ffbbfd87
	lduba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff

p0_label_83:
!	Mem[0000000030001410] = dc9ed6ff 00000000, %l6 = 00000067, %l7 = 000000ff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000dc9ed6ff
!	Mem[0000000030101410] = 7b000000, %l1 = 00000000200000e0
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = bfb2887b, %l7 = 00000000dc9ed6ff
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 000000000000887b
!	Mem[0000000030081408] = 00000000, %l3 = 000000006f0ac808
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 54000000, %l5 = 0000000000000083
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000054
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %l0 = 00000000ff0043bc
	sdivx	%l1,%l4,%l0		! Div by zero, %l0 = 00000000ff00440c
!	Mem[0000000030141400] = 4ae6ae76, %l5 = 0000000000000054
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 000000004ae6ae76
!	Mem[00000000100c1408] = 80786cd9, %l2 = 00000000ffbbf195
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffd9
!	Mem[00000000211c0000] = 014ad61d, %l0 = 00000000ff0043e4
	ldub	[%o2+0x001],%l0		! %l0 = 000000000000004a
!	Starting 10 instruction Store Burst
!	%f21 = 80786cd9, Mem[00000000100c140c] = 7c5595f9
	sta	%f21,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 80786cd9

p0_label_84:
!	%l4 = 00000000, %l5 = 4ae6ae76, Mem[0000000030181400] = bfb2887b a82e08ef
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 4ae6ae76
!	Mem[00000000201c0001] = ffff075f, %l0 = 000000000000004a
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1400] = 000025d8, %l4 = 0000000000000000
	ldstub	[%i3+%g0],%l4		! %l4 = 00000000000000ff
!	%l5 = 000000004ae6ae76, Mem[00000000211c0001] = 014ad61d
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = 0176d61d
!	Mem[0000000030001408] = c800001c, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000c8000000ff
!	Mem[0000000010041408] = bfb288ff, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ffff075f
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00ff075f
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000000c8
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 83000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000083000000
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, immd = fffffffffffff707, %l6 = 0000000000000000
	udivx	%l6,-0x8f9,%l6		! %l6 = 0000000000000000

p0_label_85:
!	Mem[0000000010181408] = ff000000, %l7 = 000000000000887b
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 0000007b, %l7 = ffffffffffffffff
	lduha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, immed = fffffc28, %y  = d88e30a5
	smul	%l7,-0x3d8,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010001410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = fff2b77a, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = fffffffffffffff2
!	Mem[0000000030081400] = dc9ed6ff 980780bf, %l0 = 000000ff, %l1 = 83000000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000980780bf 00000000dc9ed6ff
!	Mem[0000000030081400] = 980780bf, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = ffffffff980780bf
!	Mem[00000000211c0000] = 0176d61d, %l4 = 0000000000000000
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000076
!	Mem[0000000010041400] = dc9e96ff00000000, %f22 = dc9ed6ff 00000000
	ldda	[%i1+%g0]0x80,%f22	! %f22 = dc9e96ff 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000980780bf, Mem[00000000100c1408] = 80786cd9
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 807880bf

p0_label_86:
!	Mem[0000000010041400] = ff969edc, %l0 = 00000000980780bf
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff969edc
!	%f8  = f909a6c3 fc2a1b51, Mem[00000000300c1400] = 00004300 7b88d6ff
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = f909a6c3 fc2a1b51
!	%l4 = 0000000000000076, Mem[0000000010181428] = 8effb08a, %asi = 80
	stwa	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000076
!	%l6 = fffffffffffffff2, %l1 = 00000000dc9ed6ff, %y  = 00000000
	sdiv	%l6,%l1,%l7		! %l7 = fffffffffffffff9
	mov	%l0,%y			! %y = ff969edc
!	Mem[0000000021800001] = 9b4f37ea, %l6 = fffffffffffffff2
	ldstuba	[%o3+0x001]%asi,%l6	! %l6 = 0000004f000000ff
!	%l1 = 00000000dc9ed6ff, Mem[0000000030041410] = 000000ff6139a7a3
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000dc9ed6ff
!	Mem[0000000010081400] = 018a25d8, %l7 = fffffffffffffff9
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000018a25d8
!	Mem[000000001008141d] = 0000000d, %l2 = ffffffff980780bf
	ldstub	[%i2+0x01d],%l2		! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010041410] = 33003083
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00003083
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 6f0ac808, %f28 = ff969edc
	ld	[%i2+0x038],%f28	! %f28 = 6f0ac808

p0_label_87:
!	Mem[0000000010181400] = f074df03, %f7  = ffffffff
	lda	[%i6+%g0]0x80,%f7 	! %f7 = f074df03
!	Mem[0000000010101408] = faffffff ff969edc, %l0 = ff969edc, %l1 = dc9ed6ff
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff969edc 00000000faffffff
!	Mem[0000000010081400] = f9ffffff, %l5 = 000000004ae6ae76
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = fffffffffffff9ff
!	Mem[0000000020800040] = 00ff2222, %l4 = 0000000000000076
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %f21 = 80786cd9
	lda	[%i2+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[00000000300c1400] = 511b2afc, %l1 = 00000000faffffff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000051
!	Mem[0000000030141400] = 76aee64a, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000004a
!	Mem[00000000300c1400] = 511b2afc, %f1  = ffd69edc
	lda	[%i3+%g0]0x81,%f1 	! %f1 = 511b2afc
!	Mem[0000000010141408] = 0000ff83, %l1 = 0000000000000051
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = ffffffffffffff83
!	Starting 10 instruction Store Burst
!	%l0 = ff969edc, %l1 = ffffff83, Mem[0000000010181400] = 03df74f0 00000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ff969edc ffffff83

p0_label_88:
!	%f2  = 00000000 80786cd9, Mem[00000000300c1410] = 00000000 f7d7afdb
	stda	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 80786cd9
!	Mem[0000000010101410] = ff88b2bf, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x010]%asi,%l4	! %l4 = 00000000ff88b2bf
!	%l0 = 00000000ff969edc, Mem[00000000300c1408] = a82e08ef
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 9edc08ef
!	%l1 = ffffffffffffff83, Mem[0000000010001432] = 00000000
	sth	%l1,[%i0+0x032]		! Mem[0000000010001430] = 0000ff83
!	%l2 = 00000000, %l3 = 0000004a, Mem[0000000010001410] = 00000000 00000000
	stda	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000 0000004a
!	Mem[00000000100c1400] = ff0025d8, %l0 = 00000000ff969edc
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff0025d8
!	Mem[0000000010181410] = f074df03, %l1 = ffffffffffffff83
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000003000000ff
!	Mem[0000000030181408] = bfb2a3a7, %l5 = fffffffffffff9ff
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000a7000000ff
!	%f8  = f909a6c3 fc2a1b51, %l0 = 00000000ff0025d8
!	Mem[0000000010041420] = 7560c77f5442c92c
	add	%i1,0x020,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010041420] = 7560c77f5442c92c
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff0000007b000000, %l6 = 000000000000004f
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = ff0000007b000000

p0_label_89:
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[000000001000142c] = 000000f8, %f14 = ff455167
	lda	[%i0+0x02c]%asi,%f14	! %f14 = 000000f8
!	Mem[0000000010101428] = 0abf9d3c15176a9c, %l3 = 000000000000004a
	ldx	[%i4+0x028],%l3		! %l3 = 0abf9d3c15176a9c
!	%l7 = 00000000018a25d8, immd = 0000000000000987, %l5  = 00000000000000a7
	mulx	%l7,0x987,%l5		! %l5 = 0000000eab2e8ce8
!	Mem[00000000100c1410] = ff74df67, %l5 = 0000000eab2e8ce8
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffdf67
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181420] = c3a609f9 000000ff, %l0 = ff0025d8, %l1 = 00000003
	ldd	[%i6+0x020],%l0		! %l0 = 00000000c3a609f9 00000000000000ff
!	%f4  = 7560c77f, %f16 = ff000000
	fsqrts	%f4 ,%f16		! %f16 = 5a6fe1db
!	Mem[0000000010141408] = 83ff0000, %l5 = ffffffffffffdf67
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = ffffffff83ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = f46995f1, %l0 = 00000000c3a609f9
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000f46995f1

p0_label_90:
!	%f16 = 5a6fe1db 11fb7f67, %l2 = 0000000000000000
!	Mem[0000000030001420] = 5cd1e738e61c2fb8
	add	%i0,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030001420] = 5cd1e738e61c2fb8
!	Mem[0000000010141417] = ffd69edc, %l4 = 00000000ff88b2bf
	ldstuba	[%i5+0x017]%asi,%l4	! %l4 = 000000dc000000ff
!	Mem[0000000030101408] = 7ab7f2ff, %l3 = 0abf9d3c15176a9c
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000007ab7f2ff
!	%f0  = 00000000 511b2afc, Mem[0000000030181410] = 00000000 ff000000
	stda	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 511b2afc
!	%l7 = 00000000018a25d8, Mem[0000000010101408] = dc9e96ff
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = d89e96ff
!	%l5 = ffffffff83ff0000, Mem[0000000010041438] = 0de3dd33, %asi = 80
	stha	%l5,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000dd33
!	Mem[00000000300c1410] = 00000000, %l5 = ffffffff83ff0000
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f13 = c800001c, Mem[0000000010101408] = ff969ed8
	sta	%f13,[%i4+%o4]0x88	! Mem[0000000010101408] = c800001c
!	%l1 = 00000000000000ff, Mem[0000000010081410] = ff88b2bfd1f2e9c8, %asi = 80
	stxa	%l1,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 15176a9c, %f11 = 00000000
	lda	[%i4+%o4]0x89,%f11	! %f11 = 15176a9c

p0_label_91:
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000f46995f1
	setx	0x65eef92ff159948a,%g7,%l0 ! %l0 = 65eef92ff159948a
!	%l1 = 00000000000000ff
	setx	0x54008437abdcde80,%g7,%l1 ! %l1 = 54008437abdcde80
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 65eef92ff159948a
	setx	0x2b1ac19ff03f2189,%g7,%l0 ! %l0 = 2b1ac19ff03f2189
!	%l1 = 54008437abdcde80
	setx	0x022ea70fd3ef22b6,%g7,%l1 ! %l1 = 022ea70fd3ef22b6
!	Mem[0000000010041400] = bf800798, %f7  = f074df03
	lda	[%i1+%g0]0x80,%f7 	! %f7 = bf800798
!	Mem[0000000030181400] = 00000000, %l0 = 2b1ac19ff03f2189
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = ff00001c, %l6 = ff0000007b000000
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000 ef082eff, %l0 = 00000000, %l1 = d3ef22b6
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000ef082eff 0000000000000000
!	Mem[00000000100c1400] = d1000000dc9e96ff, %f10 = e0000020 15176a9c
	ldda	[%i3+%g0]0x88,%f10	! %f10 = d1000000 dc9e96ff
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00003083, %l7 = 00000000018a25d8
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ff969edc, %l6 = ffffffffffffffff
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffff96
!	Starting 10 instruction Store Burst
!	%f12 = 6978bf4a c800001c, Mem[0000000010001400] = a82e08ef 677ffb11
	stda	%f12,[%i0+%g0]0x88	! Mem[0000000010001400] = 6978bf4a c800001c

p0_label_92:
!	Mem[0000000010181408] = 000000ff, %l6 = ffffffffffffff96
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 54000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000054000000ff
!	Mem[0000000010181408] = ffffff96, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000096000000ff
!	Mem[0000000030041408] = ff000000, %l4 = 00000000000000dc
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f20 = 00000000, %f8  = f909a6c3, %f22 = dc9e96ff
	fadds	%f20,%f8 ,%f22		! %f22 = f909a6c3
!	%f30 = 0000ffff, %f11 = dc9e96ff, %f12 = 6978bf4a
	fadds	%f30,%f11,%f12		! %l0 = 00000000ef082f21, Unfinished, %fsr = 0a00000800
!	%l3 = 000000007ab7f2ff, Mem[0000000030101400] = 5b36d8ff
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 7ab7f2ff
!	%f11 = dc9e96ff, Mem[0000000030141408] = c3a609f9
	sta	%f11,[%i5+%o4]0x89	! Mem[0000000030141408] = dc9e96ff
!	%f16 = 5a6fe1db 11fb7f67 ff0000ff 50f59c61
!	%f20 = 00000000 00000000 f909a6c3 00000000
!	%f24 = c9f89f5a 9a499ba0 7b88b2bf ef082ea8
!	%f28 = 6f0ac808 33003083 0000ffff 000000ff
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l3 = 000000007ab7f2ff
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_93:
!	Mem[0000000030101408] = 9c6a1715, %l6 = 0000000000000096
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 000000009c6a1715
!	Mem[0000000030041400] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = ffffffffff0000ff
!	Mem[0000000010041408] = ff88b2bf, %l5 = 0000000000000054
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffff88
!	Mem[0000000030101400] = fff2b77a, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800040] = 00ff2222, %l7 = ffffffffff0000ff
	lduba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 83ff0000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 0000000083ff0000
!	Mem[0000000010081430] = ffbbf1959e87c233, %f0  = 00000000 511b2afc
	ldd	[%i2+0x030],%f0 	! %f0  = ffbbf195 9e87c233
!	Mem[0000000010001408] = 67226f733592e3ff, %f14 = 000000f8 f074df67
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 67226f73 3592e3ff
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010001408] = 736f2267
	stba	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 736f2200

p0_label_94:
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1408] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l6 = 000000009c6a1715, Mem[0000000010181430] = 0000000d000000d8, %asi = 80
	stxa	%l6,[%i6+0x030]%asi	! Mem[0000000010181430] = 000000009c6a1715
!	Mem[0000000030141400] = 4ae6ae76, %l2 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 000000004ae6ae76
!	%l2 = 000000004ae6ae76, %l7 = 0000000083ff0000, %l3 = 0000000000000000
	sdivx	%l2,%l7,%l3		! %l3 = 0000000000000000
!	%f16 = 5a6fe1db 11fb7f67, Mem[0000000030041400] = ff0000ff 619cf550
	stda	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = 5a6fe1db 11fb7f67
!	Mem[000000001010140c] = fffffffa, %l0 = 00000000ef082f21
	swap	[%i4+0x00c],%l0		! %l0 = 00000000fffffffa
!	Mem[0000000010181410] = f074dfff, %l0 = 00000000fffffffa
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000f074dfff
!	Mem[0000000010081408] = fffffffa, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 000000fa000000ff
!	Mem[0000000030041400] = 677ffb11, %l7 = 0000000083ff0000
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000677ffb11
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00003083, %f1  = 9e87c233
	lda	[%i1+%o5]0x80,%f1 	! %f1 = 00003083

p0_label_95:
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 00000000f074dfff
	setx	0xa167626ff9de035c,%g7,%l0 ! %l0 = a167626ff9de035c
!	%l1 = 00000000000000fa
	setx	0xfc8501d055655f28,%g7,%l1 ! %l1 = fc8501d055655f28
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a167626ff9de035c
	setx	0xa0f5105fd4e206bc,%g7,%l0 ! %l0 = a0f5105fd4e206bc
!	%l1 = fc8501d055655f28
	setx	0x00f38a08766c906c,%g7,%l1 ! %l1 = 00f38a08766c906c
!	Mem[0000000010181400] = dc9e96ff 83ffffff, %l0 = d4e206bc, %l1 = 766c906c
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000dc9e96ff 0000000083ffffff
!	Mem[0000000010101410] = 000000ff 57ff8be3, %l0 = dc9e96ff, %l1 = 83ffffff
	ldd	[%i4+%o5],%l0		! %l0 = 00000000000000ff 0000000057ff8be3
!	Mem[0000000010101408] = 1c0000c8, %f27 = ef082ea8
	lda	[%i4+%o4]0x80,%f27	! %f27 = 1c0000c8
!	Mem[0000000020800040] = 00ff2222, %l0 = 00000000000000ff
	ldsb	[%o1+0x041],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 83300000, %f5  = 5442c92c
	lda	[%i1+%o5]0x88,%f5 	! %f5 = 83300000
!	Mem[0000000030101408] = fb1cdaef15176a9c, %f8  = f909a6c3 fc2a1b51
	ldda	[%i4+%o4]0x89,%f8 	! %f8  = fb1cdaef 15176a9c
!	Mem[0000000010081400] = f9ffffff, %l2 = 000000004ae6ae76
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000f9ffffff
!	Mem[000000001018143c] = 4abf7869, %l3 = 0000000000000000
	ldub	[%i6+0x03f],%l3		! %l3 = 0000000000000069
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000010001410] = 00000000
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff

p0_label_96:
!	Mem[0000000030081400] = bf800798, %l2 = 00000000f9ffffff
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000bf000000ff
!	Mem[0000000010181430] = 00000000, %l2 = 00000000000000bf, %asi = 80
	swapa	[%i6+0x030]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00ff075f, %l1 = 0000000057ff8be3
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l6 = 000000009c6a1715, immd = fffffffffffff8e9, %l7 = 00000000677ffb11
	sdivx	%l6,-0x717,%l7		! %l7 = ffffffffffe9f031
!	%l6 = 9c6a1715, %l7 = ffe9f031, Mem[0000000010181408] = ffffffff 00000000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 9c6a1715 ffe9f031
!	%l7 = ffffffffffe9f031, Mem[0000000010141408] = 83ff0000f074df03
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffe9f031
!	Mem[00000000211c0000] = 0176d61d, %l1 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000001000000ff
!	%l3 = 0000000000000069, Mem[0000000010001400] = 1c0000c84abf7869
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000069
!	%f0  = ffbbf195 00003083 00000000 80786cd9
!	%f4  = 7560c77f 83300000 ff8e3083 bf800798
!	%f8  = fb1cdaef 15176a9c d1000000 dc9e96ff
!	%f12 = 6978bf4a c800001c 67226f73 3592e3ff
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000000ff, %l0 = ffffffffffffffff
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_97:
!	Mem[00000000211c0000] = ff76d61d, %l0 = ffffffffffffffff
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010141420] = ff95557c57fff0e3, %l7 = ffffffffffe9f031
	ldx	[%i5+0x020],%l7		! %l7 = ff95557c57fff0e3
!	Mem[0000000010041410] = 83300000, %l2 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 0000000083300000
!	Mem[00000000100c1408] = 619cf550ff0000ff, %f18 = ff0000ff 50f59c61
	ldda	[%i3+%o4]0x88,%f18	! %f18 = 619cf550 ff0000ff
!	Mem[0000000030141408] = ff969edc, %f29 = 33003083
	lda	[%i5+%o4]0x81,%f29	! %f29 = ff969edc
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081400] = 77b86bfa fffffff9, %l4 = 000000ff, %l5 = ffffff88
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000fffffff9 0000000077b86bfa
!	Mem[0000000030101408] = fb1cdaef15176a9c, %f30 = 0000ffff 000000ff
	ldda	[%i4+%o4]0x89,%f30	! %f30 = fb1cdaef 15176a9c
!	Mem[0000000030081408] = d96c7880, %l0 = ffffffffffffffff
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000d9
!	Mem[0000000030001400] = d10000ff, %l6 = 000000009c6a1715
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f6  = ff8e3083, Mem[0000000030081408] = 80786cd9
	sta	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff8e3083

p0_label_98:
!	%l0 = 00000000000000d9, Mem[0000000030181408] = bfb2a3ff
	stha	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = bfb200d9
!	Mem[0000000010181434] = 9c6a1715, %l4 = 00000000fffffff9
	swap	[%i6+0x034],%l4		! %l4 = 000000009c6a1715
!	%f2  = 00000000 80786cd9, Mem[0000000030141408] = dc9e96ff 5611dfb1
	stda	%f2 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 80786cd9
!	Mem[000000001008142d] = f074df67, %l0 = 00000000000000d9
	ldstuba	[%i2+0x02d]%asi,%l0	! %l0 = 00000074000000ff
!	%l3 = 0000000000000069, Mem[0000000030081400] = 00003083
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 00003069
!	%l0 = 0000000000000074, Mem[0000000010001410] = ff000000
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00740000
!	%l6 = 000000ff, %l7 = 57fff0e3, Mem[0000000030141410] = ffffffff 00000067
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff 57fff0e3
!	Mem[00000000100c141e] = 00000000, %l7 = ff95557c57fff0e3
	ldstuba	[%i3+0x01e]%asi,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000077b86bfa, Mem[0000000030101400] = 7ab7f2ff
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 7ab76bfa
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 15176a9c, %l6 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000006a9c

p0_label_99:
!	Mem[0000000030181400] = 00000000, %l3 = 0000000000000069
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = f909a6c3 fc2a1b51, %l0 = 00000074, %l1 = 00000001
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000fc2a1b51 00000000f909a6c3
!	Mem[0000000030141408] = d96c7880, %l1 = 00000000f909a6c3
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000d96c
!	Mem[0000000010181408] = 15176a9c, %l2 = 0000000083300000
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffff9c
!	Mem[0000000010081408] = ffffffff, %l5 = 0000000077b86bfa
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001014140c] = ffe9f031, %l0 = 00000000fc2a1b51
	ldub	[%i5+0x00d],%l0		! %l0 = 00000000000000e9
!	Mem[0000000030101408] = 9c6a1715, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffff9c
!	%f23 = 00000000, %f16 = 5a6fe1db
	fcmps	%fcc1,%f23,%f16		! %fcc1 = 1
!	Mem[00000000100c1418] = f909a6c30000ff00, %f4  = 7560c77f 83300000
	ldd	[%i3+0x018],%f4 	! %f4  = f909a6c3 0000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l4 = 000000009c6a1715
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_100:
!	%l0 = 00000000000000e9, %l0 = 00000000000000e9, %l1 = 000000000000d96c
	addc	%l0,%l0,%l1		! %l1 = 00000000000001d2
!	%l5 = ffffffffffffffff, %l3 = ffffffffffffff9c, %l5 = ffffffffffffffff
	addc	%l5,%l3,%l5		! %l5 = ffffffffffffff9b
!	%l3 = ffffffffffffff9c, Mem[00000000201c0000] = ffff075f
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ff9c075f
!	%l2 = ffffffffffffff9c, Mem[0000000010041400] = 980780bf
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 9807ff9c
!	%l2 = ffffffffffffff9c, Mem[0000000010181400] = dc9e96ff
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffff9c
!	%l4 = 0000000000000000, Mem[0000000010101410] = ff000000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	Mem[0000000030001400] = ff0000d1, %l6 = 0000000000006a9c
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030081400] = 69300000
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l7 = 0000000000000000, imm = 0000000000000283, %l2 = ffffffffffffff9c
	xnor	%l7,0x283,%l2		! %l2 = fffffffffffffd7c
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 1c0000ff, %l3 = ffffffffffffff9c
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_101:
!	Mem[0000000030081408] = 83308eff00000000, %l5 = ffffffffffffff9b
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = 83308eff00000000
!	Mem[00000000100c1400] = dbe16f5a, %l5 = 83308eff00000000
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000006f5a
!	Mem[00000000100c1408] = ff0000ff, %l5 = 0000000000006f5a
	lduwa	[%i3+%o4]0x88,%l5	! %l5 = 00000000ff0000ff
!	%l6 = 00000000000000ff, imm = fffffffffffffed4, %l7 = 0000000000000000
	orn	%l6,-0x12c,%l7		! %l7 = 00000000000001ff
!	Mem[0000000030041410] = dc9ed6ff, %f12 = 6978bf4a
	lda	[%i1+%o5]0x89,%f12	! %f12 = dc9ed6ff
!	Mem[0000000010041410] = 00003083, %l4 = 0000000000000000
	ldsha	[%i1+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000000000e9
	setx	0x3876e28fd3f25bcc,%g7,%l0 ! %l0 = 3876e28fd3f25bcc
!	%l1 = 00000000000001d2
	setx	0x61e545bfa28d8ff5,%g7,%l1 ! %l1 = 61e545bfa28d8ff5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3876e28fd3f25bcc
	setx	0x34356f90132d5a88,%g7,%l0 ! %l0 = 34356f90132d5a88
!	%l1 = 61e545bfa28d8ff5
	setx	0xf7f2c4c8640da592,%g7,%l1 ! %l1 = f7f2c4c8640da592
!	Mem[0000000030101400] = fa6bb77a, %f12 = dc9ed6ff
	lda	[%i4+%g0]0x81,%f12	! %f12 = fa6bb77a
!	Mem[0000000010101400] = 0000000000000007, %f22 = f909a6c3 00000000
	ldda	[%i4+%g0]0x80,%f22	! %f22 = 00000000 00000007
!	Starting 10 instruction Store Burst
!	%f6  = ff8e3083 bf800798, %l7 = 00000000000001ff
!	Mem[0000000010041420] = 7560c77f5442c92c
	add	%i1,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010041420] = 980780bf83308eff

p0_label_102:
!	%l4 = 0000000000000000, Mem[00000000100c1430] = 6f0ac80833003083, %asi = 80
	stxa	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = 0000000000000000
!	Mem[00000000100c141c] = 0000ff00, %l5 = 00000000ff0000ff
	swap	[%i3+0x01c],%l5		! %l5 = 000000000000ff00
!	%l0 = 132d5a88, %l1 = 640da592, Mem[00000000300c1410] = 83ff0000 80786cd9
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 132d5a88 640da592
!	%f8  = fb1cdaef 15176a9c, %l2 = fffffffffffffd7c
!	Mem[0000000030001400] = ff0000d1000000ff
	stda	%f8,[%i0+%l2]ASI_PST32_SL ! Mem[0000000030001400] = ff0000d1000000ff
!	Mem[0000000010001408] = 736f2200, %l7 = 00000000000001ff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000736f2200
!	%l2 = fffffd7c, %l3 = ffffffff, Mem[0000000010001420] = 000000d9 00000059
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = fffffd7c ffffffff
!	%f28 = 6f0ac808, Mem[0000000030141408] = d96c7880
	sta	%f28,[%i5+%o4]0x81	! Mem[0000000030141408] = 6f0ac808
!	Mem[0000000030141400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = bfb200d9, %l1 = f7f2c4c8640da592
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000bfb200d9
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 31f0e9ffffffffff, %f20 = 00000000 00000000
	ldda	[%i5+%o4]0x88,%f20	! %f20 = 31f0e9ff ffffffff

p0_label_103:
!	Mem[0000000030081410] = 00003083, %l5 = 000000000000ff00
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 000001ff, %l6 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 00000000000001ff
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 83ff0000, %l0 = 34356f90132d5a88
	lduba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000083
!	Mem[0000000010181408] = 31f0e9ff 15176a9c, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 0000000015176a9c 0000000031f0e9ff
!	Mem[0000000010101408] = 212f08efc800001c, %l7 = 00000000736f2200
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 212f08efc800001c
!	Mem[0000000010141408] = ffffffff, %l5 = 0000000031f0e9ff
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010101434] = 9a69ff71, %f11 = dc9e96ff
	lda	[%i4+0x034]%asi,%f11	! %f11 = 9a69ff71
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000030081410] = 000030837fc76075
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ffffffff

p0_label_104:
!	%f2  = 00000000 80786cd9, Mem[0000000030041408] = 000000ff be4220a5
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 80786cd9
!	%f4  = f909a6c3 0000ff00, Mem[0000000010141400] = ef082eff 00000000
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = f909a6c3 0000ff00
!	%l4 = 0000000015176a9c, Mem[0000000030181410] = fc2a1b51
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 15176a9c
!	%l4 = 15176a9c, %l5 = ffffffff, Mem[0000000030041410] = dc9ed6ff 00000000
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 15176a9c ffffffff
!	Mem[00000000100c1427] = 9a499ba0, %l6 = 00000000000001ff
	ldstub	[%i3+0x027],%l6		! %l6 = 000000a0000000ff
!	%f16 = 5a6fe1db 11fb7f67 619cf550 ff0000ff
!	%f20 = 31f0e9ff ffffffff 00000000 00000007
!	%f24 = c9f89f5a 9a499ba0 7b88b2bf 1c0000c8
!	%f28 = 6f0ac808 ff969edc fb1cdaef 15176a9c
	stda	%f16,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[0000000030181408] = 92a50d64, %l2 = fffffffffffffd7c
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000092000000ff
!	%f14 = 67226f73, Mem[0000000030041400] = 0000ff83
	sta	%f14,[%i1+%g0]0x89	! Mem[0000000030041400] = 67226f73
!	%f2  = 00000000, Mem[000000001000140c] = 3592e3ff
	sta	%f2 ,[%i0+0x00c]%asi	! Mem[000000001000140c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = dd013e6a47e5d6af, %f4  = f909a6c3 0000ff00
	ldd	[%i5+0x018],%f4 	! %f4  = dd013e6a 47e5d6af

p0_label_105:
!	Mem[0000000010141410] = ff74df67, %l2 = 0000000000000092
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000bfb200d9, %l5 = 00000000ffffffff, %y  = ff969edc
	umul	%l1,%l5,%l6		! %l6 = bfb200d8404dff27, %y = bfb200d8
!	Mem[00000000100c1400] = dbe16f5a, %l7 = 212f08efc800001c
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000006f5a
!	%l6 = bfb200d8404dff27, %l0 = 0000000000000083, %l1 = 00000000bfb200d9
	orn	%l6,%l0,%l1		! %l1 = ffffffffffffff7f
!	Mem[0000000030181408] = 640da5ff, %l5 = 00000000ffffffff
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 00000000640da5ff
!	Mem[0000000030001410] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff, %f8  = fb1cdaef
	lda	[%i5+%g0]0x89,%f8 	! %f8 = ff0000ff
!	Mem[0000000010181400] = 9cffffff, %f11 = 9a69ff71
	lda	[%i6+%g0]0x88,%f11	! %f11 = 9cffffff
!	Mem[00000000201c0000] = ff9c075f, %l1 = ffffffffffffff7f
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f12 = fa6bb77a, Mem[0000000010181410] = faffffff
	sta	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = fa6bb77a

p0_label_106:
!	%f4  = dd013e6a, Mem[00000000300c1408] = ef08dc9e
	sta	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = dd013e6a
!	%l7 = 0000000000006f5a, Mem[0000000010101410] = ff000000
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00006f5a
!	Mem[000000001010143a] = 000000ff, %l2 = 0000000000000000
	ldstub	[%i4+0x03a],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 7ab76bfa, %l0 = 0000000000000083
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 000000007ab76bfa
!	%l1 = ffffffffffffffff, Mem[0000000030041410] = 15176a9c
	stwa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff
!	%f11 = 9cffffff, Mem[0000000030101400] = fa6bb77a
	sta	%f11,[%i4+%g0]0x81	! Mem[0000000030101400] = 9cffffff
!	Mem[0000000030001400] = d10000ff, %l5 = 00000000640da5ff
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000d10000ff
!	%l6 = bfb200d8404dff27, Mem[0000000020800000] = ffffb0a2
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = 27ffb0a2
!	Mem[0000000030041408] = 80786cd9, %l3 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 000000d9000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010041400] = 5a6fe1db, %f3  = 80786cd9
	lda	[%i1+%g0]0x80,%f3 	! %f3 = 5a6fe1db

p0_label_107:
!	Mem[0000000010101410] = 00006f5a, %f2  = 00000000
	lda	[%i4+%o5]0x88,%f2 	! %f2 = 00006f5a
!	Mem[0000000030101408] = 9c6a1715, %l0 = 000000007ab76bfa
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = ffffffff9c6a1715
!	Mem[0000000020800040] = 00ff2222, %l0 = ffffffff9c6a1715
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 00ff0000 c3a609f9, %l4 = 15176a9c, %l5 = d10000ff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000ff0000 00000000c3a609f9
!	Mem[0000000010181400] = ffffff9c, %l4 = 0000000000ff0000
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010081410] = 9c6a1715, %l5 = 00000000c3a609f9
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000015
!	%l5 = 0000000000000015, imm = ffffffffffffff76, %l5 = 0000000000000015
	orn	%l5,-0x08a,%l5		! %l5 = 000000000000009d
!	Mem[0000000010181400] = 9cffffff, %f13 = c800001c
	lda	[%i6+%g0]0x88,%f13	! %f13 = 9cffffff
!	Mem[0000000010081410] = 15176a9c000000ff, %l5 = 000000000000009d
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 15176a9c000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000d9, Mem[0000000010181410] = 00000083 bfb22128
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 000000d9

p0_label_108:
!	%l5 = 15176a9c000000ff, Mem[00000000300c1408] = dd013e6a
	stha	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = dd0100ff
!	Mem[0000000010041434] = ff969edc, %l6 = bfb200d8404dff27, %asi = 80
	swapa	[%i1+0x034]%asi,%l6	! %l6 = 00000000ff969edc
!	%l1 = ffffffffffffffff, Mem[0000000030001408] = 1c0000ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
!	%f28 = 6f0ac808 ff969edc, Mem[0000000010101400] = 00000000 00000007
	stda	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = 6f0ac808 ff969edc
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ff9c075f, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000075f
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000d9
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 00000000000000ff
	setx	0xe0a4fd902b2eeeb5,%g7,%l0 ! %l0 = e0a4fd902b2eeeb5
!	%l1 = ffffffffffffffff
	setx	0xb106d28013f4cf77,%g7,%l1 ! %l1 = b106d28013f4cf77
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e0a4fd902b2eeeb5
	setx	0x481f4caffc7d1124,%g7,%l0 ! %l0 = 481f4caffc7d1124
!	%l1 = b106d28013f4cf77
	setx	0x787042d7cf699f63,%g7,%l1 ! %l1 = 787042d7cf699f63
!	%l4 = 000000000000ffff, Mem[0000000030141400] = ff0000ff
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff00ff
!	Mem[0000000030001408] = ffffffff, %l1 = 787042d7cf699f63
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff9ed6ff67df74ff, %l5 = 15176a9c000000ff
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = ff9ed6ff67df74ff

p0_label_109:
!	Mem[0000000010141410] = 67df74ff, %f0  = ffbbf195
	lda	[%i5+%o5]0x88,%f0 	! %f0 = 67df74ff
!	Mem[0000000010001438] = a8760424, %l6 = 00000000ff969edc
	lduha	[%i0+0x038]%asi,%l6	! %l6 = 000000000000a876
!	Mem[0000000010041408] = 50f59c61, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000009c61
!	%l7 = 0000000000006f5a, imm = 0000000000000067, %l1 = 00000000000000ff
	xor	%l7,0x067,%l1		! %l1 = 0000000000006f3d
!	%l3 = 00000000000000ff, imm = 000000000000036f, %l5 = ff9ed6ff67df74ff
	andn	%l3,0x36f,%l5		! %l5 = 0000000000000090
!	Mem[0000000030001408] = ffffffff, %l4 = 000000000000ffff
	ldsha	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 6f0ac808 ff969edc 1c0000c8 ef082f21
!	Mem[0000000010101410] = 5a6f0000 57ff8be3 619239f8 000000f0
!	Mem[0000000010101420] = 2301522c 122ffd46 0abf9d3c 15176a9c
!	Mem[0000000010101430] = 1b3bf8ff 9a69ff71 0000ffff 00000000
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000020800040] = 00ff2222, %l4 = ffffffffffffffff
	ldsb	[%o1+0x040],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081428] = ff455167, %l0 = 481f4caffc7d1124
	ldswa	[%i2+0x028]%asi,%l0	! %l0 = ffffffffff455167
!	Starting 10 instruction Store Burst
!	%f2  = 00006f5a 5a6fe1db, Mem[0000000010081408] = ffffffff 339cb7c5
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 00006f5a 5a6fe1db

p0_label_110:
!	Mem[0000000010001402] = 00000000, %l6 = 000000000000a876
	ldstub	[%i0+0x002],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 50f59c61, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000061000000ff
!	%f14 = 67226f73 3592e3ff, Mem[0000000030041410] = ffffffff ffffffff
	stda	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = 67226f73 3592e3ff
!	Mem[000000001004143c] = 15176a9c, %l0 = ff455167, %l6 = 00000061
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 0000000015176a9c
!	%l4 = 0000000000000000, Mem[0000000010041410] = ffe9f031
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l5 = 0000000000000090, Mem[0000000030081408] = 83308eff00000000
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000090
!	%l6 = 0000000015176a9c, Mem[0000000010141410] = ff74df67ffd69eff, %asi = 80
	stxa	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000000015176a9c
	membar	#Sync			! Added by membar checker (18)
!	%f3  = 5a6fe1db, Mem[0000000010101420] = 2301522c
	st	%f3 ,[%i4+0x020]	! Mem[0000000010101420] = 5a6fe1db
!	Mem[0000000030181400] = 00000000, %l6 = 0000000015176a9c
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 132d5a88, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000013

p0_label_111:
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ffffff9c, %f11 = 9cffffff
	lda	[%i4+%g0]0x89,%f11	! %f11 = ffffff9c
!	%l6 = 0000000000000000, immed = fffff586, %y  = bfb200d8
	smul	%l6,-0xa7a,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[000000001008140c] = 5a6f0000, %f14 = 67226f73
	ld	[%i2+0x00c],%f14	! %f14 = 5a6f0000
!	Mem[0000000010141400] = 0000ff00, %l2 = 0000000000009c61
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001400] = ff000000640da5ff, %l2 = 000000000000ff00
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = ff000000640da5ff
!	Mem[0000000030001408] = ffffffff4bdf8c9a, %f0  = 67df74ff 00003083
	ldda	[%i0+%o4]0x81,%f0 	! %f0  = ffffffff 4bdf8c9a
!	Mem[0000000010101408] = c800001c, %f23 = 000000f0
	lda	[%i4+%o4]0x88,%f23	! %f23 = c800001c
!	Mem[0000000010041408] = ff9cf550, %f3  = 5a6fe1db
	lda	[%i1+%o4]0x80,%f3 	! %f3 = ff9cf550
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000006f5a, Mem[000000001014140a] = ffffffff, %asi = 80
	stha	%l7,[%i5+0x00a]%asi	! Mem[0000000010141408] = ffff6f5a

p0_label_112:
!	%f30 = 0000ffff 00000000, %l6 = 0000000000000000
!	Mem[0000000010101420] = 5a6fe1db122ffd46
	add	%i4,0x020,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101420] = 5a6fe1db122ffd46
!	%l2 = ff000000640da5ff, Mem[0000000010101408] = 1c0000c8
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = a5ff00c8
!	%f4  = dd013e6a 47e5d6af, %l7 = 0000000000006f5a
!	Mem[0000000010041438] = fb1cdaef15176a9c
	add	%i1,0x038,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_P ! Mem[0000000010041438] = dd013e6a15176a9c
!	%l7 = 0000000000006f5a, Mem[00000000100c1428] = 7b88b2bfef082ea8, %asi = 80
	stxa	%l7,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000006f5a
!	Mem[0000000020800041] = 00ff2222, %l7 = 0000000000006f5a
	ldstub	[%o1+0x041],%l7		! %l7 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010101405] = ff969edc
	stb	%l4,[%i4+0x005]		! Mem[0000000010101404] = ff009edc
!	Mem[0000000010001400] = 0000ff00, %l2 = ff000000640da5ff
	swap	[%i0+%g0],%l2		! %l2 = 000000000000ff00
!	%l0 = ffffffffff455167, Mem[0000000030081410] = 00000000
	stwa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = ff455167
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1400] = dbe16f5a 677ffb11
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 80786cff, %l5 = 0000000000000090
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_113:
!	Mem[0000000030041400] = 5a6fe1db67226f73, %f12 = fa6bb77a 9cffffff
	ldda	[%i1+%g0]0x89,%f12	! %f12 = 5a6fe1db 67226f73
!	Mem[0000000010101410] = 5a6f0000, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000005a6f
!	Mem[0000000030141400] = ff00ffff, %l2 = 000000000000ff00
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	%f30 = 0000ffff, %f21 = 57ff8be3, %f15 = 3592e3ff
	fmuls	%f30,%f21,%f15		! %l0 = ffffffffff455189, Unfinished, %fsr = 0900000800
!	%l2 = 000000000000ffff, imm = fffffffffffff3bd, %l1 = 0000000000006f3d
	or	%l2,-0xc43,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 675145ffffffffff, %f30 = 0000ffff 00000000
	ldda	[%i2+%o5]0x81,%f30	! %f30 = 675145ff ffffffff
!	Mem[0000000010081408] = 5a6fe1db, %l7 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 000000000000e1db
!	Mem[0000000010141408] = ffff6f5a, %l7 = 000000000000e1db
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = 6f0ac808, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = 000000000000006f
!	Starting 10 instruction Store Burst
!	%l0 = ff455189, %l1 = ffffffff, Mem[0000000030001400] = 640da5ff ff000000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ff455189 ffffffff

p0_label_114:
!	%l5 = ffffffffffffffff, Mem[00000000100c1408] = ff0000ff
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00ffff
!	%l4 = 0000006f, %l5 = ffffffff, Mem[0000000010141410] = 00000000 15176a9c
	stda	%l4,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000006f ffffffff
!	%l0 = ff455189, %l1 = ffffffff, Mem[00000000300c1410] = 885a2d13 92a50d64
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff455189 ffffffff
!	%f26 = 0abf9d3c, %f21 = 57ff8be3
	fcmpes	%fcc2,%f26,%f21		! %fcc2 = 1
!	%f20 = 5a6f0000 57ff8be3, %l7 = ffffffffffffffff
!	Mem[00000000300c1438] = 6c98c1bc58812f0e
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1438] = e38bff5700006f5a
!	Mem[0000000030081410] = 675145ff, %l6 = 0000000000005a6f
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000675145ff
!	Mem[00000000100c1410] = 00000000, %l0 = ffffffffff455189
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001014143c] = 000000ff, %l7 = ffffffff, %l6 = 675145ff
	add	%i5,0x3c,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000000000ff
!	%f4  = dd013e6a 47e5d6af, Mem[0000000010181410] = 00000000 000000d9
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = dd013e6a 47e5d6af
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff00000076aee64a, %l5 = ffffffffffffffff
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = ff00000076aee64a

p0_label_115:
!	Mem[00000000201c0000] = 0000075f, %l3 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff455189, %l6 = 00000000000000ff
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = ffffffffff455189
!	Mem[0000000030081408] = 90000000 00000000, %l6 = ff455189, %l7 = ffffffff
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000090000000
!	Mem[0000000010101410] = 5a6f0000, %l6 = 0000000000000000
	lduha	[%i4+0x010]%asi,%l6	! %l6 = 0000000000005a6f
!	Mem[0000000010101418] = 619239f8, %l4 = 000000000000006f
	ldsba	[%i4+0x019]%asi,%l4	! %l4 = ffffffffffffff92
!	Mem[0000000010081400] = f9ffffff, %l4 = ffffffffffffff92
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000f9ffffff
!	Mem[0000000010181400] = 9cffffff, %l6 = 0000000000005a6f
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	%l5 = ff00000076aee64a, %l4 = 00000000f9ffffff, %l2 = 000000000000ffff
	or	%l5,%l4,%l2		! %l2 = ff000000ffffffff
!	Mem[0000000030081410] = ffffffff6f5a0000, %f10 = d1000000 ffffff9c
	ldda	[%i2+%o5]0x89,%f10	! %f10 = ffffffff 6f5a0000
!	Starting 10 instruction Store Burst
!	%f28 = 1b3bf8ff 9a69ff71, Mem[0000000030101410] = 7b000000 ff000000
	stda	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = 1b3bf8ff 9a69ff71

p0_label_116:
!	Mem[0000000030181410] = 15176a9c, %l7 = 0000000090000000
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000015000000ff
!	Mem[0000000030101410] = 9a69ff71, %l1 = ffffffffffffffff
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 000000009a69ff71
!	Mem[00000000100c1410] = ff455189, %l1 = 000000009a69ff71
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x7bcc56d7a47c0848,%g7,%l0 ! %l0 = 7bcc56d7a47c0848
!	%l1 = 00000000000000ff
	setx	0xa96e9d87d6cc71fc,%g7,%l1 ! %l1 = a96e9d87d6cc71fc
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7bcc56d7a47c0848
	setx	0x84dd920028e3de1d,%g7,%l0 ! %l0 = 84dd920028e3de1d
!	%l1 = a96e9d87d6cc71fc
	setx	0xab551fb813c67b82,%g7,%l1 ! %l1 = ab551fb813c67b82
!	%l4 = 00000000f9ffffff, Mem[0000000010181410] = 47e5d6af
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 47e5d6ff
!	%l1 = ab551fb813c67b82, Mem[0000000010101410] = e38bff5700006f5a
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ab551fb813c67b82
!	%l1 = ab551fb813c67b82, Mem[0000000010181420] = c3a609f9, %asi = 80
	stha	%l1,[%i6+0x020]%asi	! Mem[0000000010181420] = 7b8209f9
!	%l3 = 0000000000000000, Mem[0000000010141408] = ffff6f5a
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00006f5a
!	%l7 = 0000000000000015, Mem[00000000218001c0] = 2f6a07db, %asi = 80
	stha	%l7,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 001507db
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00ff0000, %l1 = ab551fb813c67b82
	lduwa	[%i5+0x000]%asi,%l1	! %l1 = 0000000000ff0000

p0_label_117:
!	Mem[0000000010141400] = 00ff0000, %l4 = 00000000f9ffffff
	lduwa	[%i5+0x000]%asi,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010041408] = ff9cf550 ff0000ff, %l0 = 28e3de1d, %l1 = 00ff0000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff9cf550 00000000ff0000ff
!	Mem[00000000211c0000] = ff76d61d, %l4 = 0000000000ff0000
	ldub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081400] = f9ffffff, %l1 = 00000000ff0000ff
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 000000000000f9ff
!	Mem[0000000030141410] = 000000d957fff0e3, %l2 = ff000000ffffffff
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = 000000d957fff0e3
!	Mem[0000000010041420] = c9f89f5a, %l5 = ff00000076aee64a
	ldsba	[%i1+0x023]%asi,%l5	! %l5 = 000000000000005a
!	Mem[0000000030101400] = 9cffffff, %l5 = 000000000000005a
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = ffffffff9cffffff
!	Mem[0000000030001400] = 895145ffffffffff, %l2 = 000000d957fff0e3
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = 895145ffffffffff
!	Mem[0000000010081420] = ff455167f074df67, %l6 = ffffffffffffffff
	ldx	[%i2+0x020],%l6		! %l6 = ff455167f074df67
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000f9ff, Mem[0000000010181408] = 9c6a1715
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = f9ff1715

p0_label_118:
!	%f19 = ef082f21, Mem[0000000010001410] = 00740000
	sta	%f19,[%i0+%o5]0x80	! Mem[0000000010001410] = ef082f21
!	%f14 = 5a6f0000 3592e3ff, %l4 = 00000000000000ff
!	Mem[0000000010001400] = 640da5ff00000069
	stda	%f14,[%i0+%l4]ASI_PST16_PL ! Mem[0000000010001400] = ffe3923500006f5a
!	%l0 = 00000000ff9cf550, Mem[0000000030101400] = ffffff9c
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ff9cf550
!	%l5 = ffffffff9cffffff, Mem[00000000100c1408] = ff00ffff
	stba	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00ffff
!	%l6 = ff455167f074df67, Mem[0000000030041410] = 67226f733592e3ff
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ff455167f074df67
!	Mem[0000000020800000] = 27ffb0a2, %l3 = 0000000000000000
	ldstub	[%o1+%g0],%l3		! %l3 = 00000027000000ff
!	Mem[00000000100c1420] = c9f89f5a, %l0 = 00000000ff9cf550
	ldstuba	[%i3+0x020]%asi,%l0	! %l0 = 000000c9000000ff
!	Mem[00000000300c1408] = ff0001dd, %l6 = ff455167f074df67
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%f15 = 3592e3ff, %f22 = 619239f8, %f24 = 2301522c 122ffd46
	fsmuld	%f15,%f22,%f24		! %f24 = 42f4f9d2 9fa98200
!	Starting 10 instruction Load Burst
!	%l6 = 00000000000000ff, %l2 = 895145ffffffffff, %l5 = ffffffff9cffffff
	subc	%l6,%l2,%l5		! %l5 = 76aeba0000000100

p0_label_119:
!	Mem[000000001000142c] = 000000f8, %l0 = 00000000000000c9
	lduba	[%i0+0x02e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 00000000 80786cff, %l2 = ffffffff, %l3 = 00000027
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 0000000080786cff 0000000000000000
!	Mem[00000000300c1410] = ff455189, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000ff455189
!	Mem[0000000030101400] = ff9cf550, %l2 = 0000000080786cff
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000050
!	Mem[0000000010181400] = 9cffffff, %l7 = 0000000000000015
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = f9ffffff, %l5 = 76aeba0000000100
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = fffffffffffffff9
!	Mem[0000000010141430] = ff969eff4bdf8c9a, %l4 = 00000000000000ff
	ldxa	[%i5+0x030]%asi,%l4	! %l4 = ff969eff4bdf8c9a
!	Mem[0000000030181400] = 4ae6ae76000000ff, %l0 = 00000000ff455189
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 4ae6ae76000000ff
!	Mem[0000000021800080] = 257e727f, %l5 = fffffffffffffff9
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000257e
!	Starting 10 instruction Store Burst
!	%f5  = 47e5d6af, Mem[0000000010081410] = 15176a9c
	sta	%f5 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 47e5d6af

p0_label_120:
!	Mem[0000000010181410] = ffd6e547, %l1 = 000000000000f9ff
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l4 = ff969eff4bdf8c9a, Mem[00000000100c1410] = 895145ff
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 89518c9a
!	%l3 = 0000000000000000, Mem[0000000010101424] = 122ffd46, %asi = 80
	stha	%l3,[%i4+0x024]%asi	! Mem[0000000010101424] = 0000fd46
!	Mem[0000000010001408] = ff010000, %l0 = 4ae6ae76000000ff
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff010000
!	%l4 = ff969eff4bdf8c9a, Mem[0000000010041424] = 9a499ba0, %asi = 80
	stwa	%l4,[%i1+0x024]%asi	! Mem[0000000010041424] = 4bdf8c9a
!	Mem[0000000030001410] = 00000000, %l0 = 00000000ff010000
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = 000000000000257e, Mem[00000000300c1408] = dd0100ff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = dd01007e
!	%l2 = 00000050, %l3 = 00000000, Mem[0000000030181408] = ffa50d64 1aa7aac0
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000050 00000000
!	%f6  = ff8e3083 bf800798, %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000ff000000
	stda	%f6,[%i3+%l0]ASI_PST32_PL ! Mem[00000000100c1400] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff6c7880 00000000, %l4 = 4bdf8c9a, %l5 = 0000257e
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff6c7880 0000000000000000

p0_label_121:
!	%f12 = 5a6fe1db, %f24 = 42f4f9d2, %f28 = 1b3bf8ff 9a69ff71
	fsmuld	%f12,%f24,%f28		! %f28 = 43bcb1ab 862914c0
!	Mem[00000000100c1410] = 89518c9a, %f9  = 15176a9c
	lda	[%i3+%o5]0x88,%f9 	! %f9 = 89518c9a
!	Mem[0000000010081410] = 47e5d6af, %l7 = ffffffffffffffff
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = 00000000000047e5
!	Mem[00000000300c1408] = 7b88b2bfdd01007e, %l2 = 0000000000000050
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = 7b88b2bfdd01007e
!	Mem[0000000021800180] = b3572d80, %l4 = 00000000ff6c7880
	lduha	[%o3+0x180]%asi,%l4	! %l4 = 000000000000b357
!	Mem[0000000030041410] = f074df67, %f11 = 6f5a0000
	lda	[%i1+%o5]0x89,%f11	! %f11 = f074df67
!	Mem[0000000010041410] = 00000000, %l7 = 00000000000047e5
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 0000075f, %l5 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %f13 = 67226f73
	lda	[%i4+%o5]0x81,%f13	! %f13 = ffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030181400] = ff000000
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000

p0_label_122:
!	%l4 = 000000000000b357, Mem[0000000010141400] = 00ff0000c3a609f9, %asi = 80
	stxa	%l4,[%i5+0x000]%asi	! Mem[0000000010141400] = 000000000000b357
!	Mem[0000000010141410] = 6f000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010141427] = 57fff0e3
	stb	%l5,[%i5+0x027]		! Mem[0000000010141424] = 57fff000
!	Mem[0000000010181414] = 6a3e01dd, %l6 = 00000000000000ff
	swap	[%i6+0x014],%l6		! %l6 = 000000006a3e01dd
!	%f8  = ff0000ff 89518c9a, %l2 = 7b88b2bfdd01007e
!	Mem[0000000010101408] = a5ff00c8ef082f21
	add	%i4,0x008,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_P ! Mem[0000000010101408] = a50000ff89518c21
!	%f16 = 6f0ac808 ff969edc, %l4 = 000000000000b357
!	Mem[0000000010041428] = 7b88b2bf1c0000c8
	add	%i1,0x028,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041428] = dc9e96ff08c80a6f
!	%l2 = 7b88b2bfdd01007e, Mem[00000000300c1408] = 7e0001dd
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 007e01dd
!	%l2 = 7b88b2bfdd01007e, Mem[0000000030101408] = 9c6a1715
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 7e6a1715
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010141408] = 00006f5a ffe9f031
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 511b2afcc3a609f9, %f14 = 5a6f0000 3592e3ff
	ldda	[%i3+%g0]0x81,%f14	! %f14 = 511b2afc c3a609f9

p0_label_123:
!	Mem[0000000030101410] = ffffffff, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	%l4 = 000000000000b357, imm = 0000000000000c74, %l6 = 000000006a3e01dd
	xor	%l4,0xc74,%l6		! %l6 = 000000000000bf23
!	Mem[0000000010181424] = 000000ff, %l2 = 7b88b2bfdd01007e
	ldsw	[%i6+0x024],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030101400] = ff000000ff9cf550, %l3 = 000000000000ffff
	ldxa	[%i4+%g0]0x89,%l3	! %l3 = ff000000ff9cf550
!	Mem[0000000030081400] = 00000000 95f1bbff, %l6 = 0000bf23, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000095f1bbff
!	Mem[0000000010081438] = 6f0ac808, %l1 = 00000000000000ff
	ldsha	[%i2+0x038]%asi,%l1	! %l1 = 0000000000006f0a
!	Mem[0000000030101408] = 15176a7e, %l7 = 0000000095f1bbff
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 0000000000006a7e
!	Mem[0000000010101408] = a50000ff, %l7 = 0000000000006a7e
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffffffa5
!	Mem[0000000030001410] = ff010000, %l3 = ff000000ff9cf550
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 7e6a1715, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 0000007e000000ff

p0_label_124:
!	%f16 = 6f0ac808 ff969edc 1c0000c8 ef082f21
!	%f20 = 5a6f0000 57ff8be3 619239f8 c800001c
!	%f24 = 42f4f9d2 9fa98200 0abf9d3c 15176a9c
!	%f28 = 43bcb1ab 862914c0 675145ff ffffffff
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f1  = 4bdf8c9a, Mem[00000000100c142c] = 00006f5a
	sta	%f1 ,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 4bdf8c9a
!	Mem[0000000010141410] = 6f0000ff, %l7 = ffffffffffffffa5
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 000000006f0000ff
!	Mem[00000000201c0001] = 0000075f, %l2 = 00000000000000ff
	ldstub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	%f4  = dd013e6a, Mem[0000000010181408] = 1517fff9
	sta	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = dd013e6a
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000006f0a
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = ff6a1715, %l3 = 000000000000007e
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101400] = 50f59cff, %l4 = 000000000000b357
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000050f59cff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffff00ff, %l3 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffff00ff

p0_label_125:
!	Mem[0000000030101410] = ffffffff, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = a5ffffff, %l4 = 0000000050f59cff
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000a5
!	Mem[0000000010141410] = ffffffa5, %l7 = 000000006f0000ff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffa5
!	Mem[0000000010081400] = fffffff9, %l1 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = fffffffffffffff9
!	Mem[0000000030041408] = ff6c7880, %f8  = ff0000ff
	lda	[%i1+%o4]0x81,%f8 	! %f8 = ff6c7880
!	Mem[0000000010001410] = ef082f21, %l3 = ffffffffffff00ff
	ldsw	[%i0+%o5],%l3		! %l3 = ffffffffef082f21
!	Mem[0000000030141400] = ff00ffff, %f12 = 5a6fe1db
	lda	[%i5+%g0]0x89,%f12	! %f12 = ff00ffff
!	Mem[0000000010101400] = 6f0ac808, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = 000000000000006f
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff000000, %l3 = ffffffffef082f21
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 00000000ff000000

p0_label_126:
	membar	#Sync			! Added by membar checker (19)
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000a5
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f14 = 511b2afc, Mem[0000000030041400] = 736f2267
	sta	%f14,[%i1+%g0]0x81	! Mem[0000000030041400] = 511b2afc
!	%l3 = 00000000ff000000, Mem[0000000030001400] = 895145ff
	stha	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 000045ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x05b07c781e7c8e8a,%g7,%l0 ! %l0 = 05b07c781e7c8e8a
!	%l1 = fffffffffffffff9
	setx	0x15c7160824274be0,%g7,%l1 ! %l1 = 15c7160824274be0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 05b07c781e7c8e8a
	setx	0xab03853f8fc9d38f,%g7,%l0 ! %l0 = ab03853f8fc9d38f
!	%l1 = 15c7160824274be0
	setx	0xdbdb31086147b40d,%g7,%l1 ! %l1 = dbdb31086147b40d
!	Mem[0000000030101408] = 15176aff, %l1 = dbdb31086147b40d
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%f8  = ff6c7880 89518c9a, Mem[0000000010181408] = 6a3e01dd ffe9f031
	std	%f8 ,[%i6+%o4]	! Mem[0000000010181408] = ff6c7880 89518c9a
!	%f22 = 619239f8 c800001c, %l0 = ab03853f8fc9d38f
!	Mem[0000000030041400] = 511b2afcdbe16f5a
	stda	%f22,[%i1+%l0]ASI_PST32_S ! Mem[0000000030041400] = 619239f8c800001c
!	Mem[0000000030081408] = 00000000, %l7 = ffffffffffffffa5
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%f30 = 675145ff ffffffff, %l2 = 0000000000000000
!	Mem[0000000030181438] = 9077aed26bdc8384
	add	%i6,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181438] = 9077aed26bdc8384
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %f1  = 4bdf8c9a
	lda	[%i5+%g0]0x80,%f1 	! %f1 = 00000000

p0_label_127:
!	Mem[00000000300c1408] = 212f08efc800001c, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 212f08efc800001c
!	Mem[00000000201c0000] = 00ff075f, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c141c] = ff0000ff, %l4 = 0000000000000000
	lduwa	[%i3+0x01c]%asi,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010101408] = a50000ff, %f29 = 862914c0
	lda	[%i4+%o4]0x80,%f29	! %f29 = a50000ff
!	Mem[0000000010081410] = 47e5d6af, %l5 = 000000000000006f
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000047
!	Mem[00000000201c0000] = 00ff075f, %l2 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 57ff8be3, %l4 = 00000000ff0000ff
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 0000000057ff8be3
!	Mem[00000000100c1400] = 000000ff 000000ff, %l2 = 00000000, %l3 = ff000000
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000000000ff
!	Mem[00000000300c1408] = ef082f21, %l2 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000021
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 5a6fe1db, %l0 = ab03853f8fc9d38f
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 000000db000000ff

p0_label_128:
!	Mem[0000000010181400] = 9cffffff, %l2 = 0000000000000021
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 000000009cffffff
!	Mem[00000000300c1400] = ff969edc, %l1 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000ff969edc
!	Mem[00000000201c0000] = 00ff075f, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081404] = fa6bb877, %l6 = 00000000, %l3 = 000000ff
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 00000000fa6bb877
!	Mem[0000000010041410] = 00000000, %l3 = fa6bb877, %l6 = 00000000
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000000
!	%f20 = 5a6f0000 57ff8be3, Mem[0000000010001410] = ef082f21 0000004a
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = 5a6f0000 57ff8be3
!	%l6 = 0000000000000000, Mem[0000000010141418] = dd013e6a
	sth	%l6,[%i5+0x018]		! Mem[0000000010141418] = 00003e6a
!	%l6 = 0000000000000000, Mem[0000000010141410] = ffffffa5
	stba	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffff00
!	Mem[0000000010181428] = 00000076, %l3 = fa6bb877, %l0 = 000000db
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000000000076
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000ef082f21, %l3 = 00000000fa6bb877
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = 00000000ef082f21

p0_label_129:
!	Mem[0000000030001400] = ff450000, %l0 = 0000000000000076
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141430] = ff969eff4bdf8c9a, %f14 = 511b2afc c3a609f9
	ldd	[%i5+0x030],%f14	! %f14 = ff969eff 4bdf8c9a
!	Mem[0000000010181408] = 9a8c518980786cff, %l4 = 0000000057ff8be3
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 9a8c518980786cff
!	Mem[0000000030101408] = 15176aff, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000000000ff, %l3 = 00000000ef082f21
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101428] = 0abf9d3c15176a9c, %l4 = 9a8c518980786cff
	ldxa	[%i4+0x028]%asi,%l4	! %l4 = 0abf9d3c15176a9c
!	Code Fragment 4
p0_fragment_12:
!	%l0 = ffffffffffffffff
	setx	0x22dba650626b7275,%g7,%l0 ! %l0 = 22dba650626b7275
!	%l1 = 00000000ff969edc
	setx	0x4367fc406e67a904,%g7,%l1 ! %l1 = 4367fc406e67a904
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 22dba650626b7275
	setx	0xf2566b2fa313dab9,%g7,%l0 ! %l0 = f2566b2fa313dab9
!	%l1 = 4367fc406e67a904
	setx	0xd182648ff7252cdc,%g7,%l1 ! %l1 = d182648ff7252cdc
!	Mem[0000000030181400] = 4ae6ae76 000000ff, %l6 = 00000000, %l7 = c800001c
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff 000000004ae6ae76
!	Mem[00000000300c1410] = e38bff57, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 3592e3ff, %l0 = f2566b2fa313dab9
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 000000003592e3ff

p0_label_130:
!	%l0 = 000000003592e3ff, Mem[0000000030141408] = 6f0ac808
	stba	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ff0ac808
!	Mem[00000000100c1408] = ffff00ff, %l4 = 0abf9d3c15176a9c
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1410] = e38bff57, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000e38bff57
!	%f20 = 5a6f0000, Mem[0000000010181400] = 00000021
	sta	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 5a6f0000
!	Mem[0000000030041408] = 80786cff, %l0 = 000000003592e3ff
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 0000000080786cff
!	%l3 = ffffffffffffffe3, imm = 00000000000005ab, %l2 = 000000009cffffff
	xnor	%l3,0x5ab,%l2		! %l2 = 00000000000005b7
!	Mem[00000000211c0001] = ff76d61d, %l1 = d182648ff7252cdc
	ldstub	[%o2+0x001],%l1		! %l1 = 00000076000000ff
!	%l7 = 000000004ae6ae76, Mem[0000000010081414] = 000000ff
	stw	%l7,[%i2+0x014]		! Mem[0000000010081414] = 4ae6ae76
!	%l4 = 00000000000000ff, Mem[0000000030141400] = ffff00ff
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = a8760424, %f27 = 15176a9c
	ld	[%i0+0x038],%f27	! %f27 = a8760424

p0_label_131:
!	Mem[00000000100c1410] = 9a8c5189, %l5 = 0000000000000047
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffff9a8c
!	Mem[0000000010181400] = 5a6f0000, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 000000005a6f0000
!	%l5 = ffffffffffff9a8c, imm = fffffffffffffa02, %l2 = 00000000000005b7
	or	%l5,-0x5fe,%l2		! %l2 = fffffffffffffa8e
!	Mem[00000000100c1438] = 0000ffff, %l5 = ffffffffffff9a8c
	lduw	[%i3+0x038],%l5		! %l5 = 000000000000ffff
!	Mem[0000000021800180] = b3572d80, %l4 = 000000005a6f0000
	ldsb	[%o3+0x180],%l4		! %l4 = ffffffffffffffb3
!	Mem[0000000030001408] = ffffffff, %l6 = 00000000e38bff57
	ldsha	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101430] = 1b3bf8ff9a69ff71, %f8  = ff6c7880 89518c9a
	ldd	[%i4+0x030],%f8 	! %f8  = 1b3bf8ff 9a69ff71
!	Mem[0000000030041400] = 619239f8 c800001c, %l6 = ffffffff, %l7 = 4ae6ae76
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000619239f8 00000000c800001c
!	%f3  = ff9cf550, %f14 = ff969eff, %f3  = ff9cf550
	fdivs	%f3 ,%f14,%f3 		! %f3  = ffd69eff
!	Starting 10 instruction Store Burst
!	%f28 = 43bcb1ab, Mem[0000000010141410] = ffffff00
	sta	%f28,[%i5+%o5]0x88	! Mem[0000000010141410] = 43bcb1ab

p0_label_132:
!	Mem[0000000010141430] = ff969eff, %l0 = 0000000080786cff
	swap	[%i5+0x030],%l0		! %l0 = 00000000ff969eff
!	%l2 = fffffffffffffa8e, imm = 0000000000000f44, %l7 = 00000000c800001c
	xor	%l2,0xf44,%l7		! %l7 = fffffffffffff5ca
!	Mem[0000000020800041] = 00ff2222, %l0 = 00000000ff969eff
	ldstub	[%o1+0x041],%l0		! %l0 = 000000ff000000ff
!	%f30 = 675145ff ffffffff, Mem[00000000300c1410] = ff000000 5a6f0000
	stda	%f30,[%i3+%o5]0x89	! Mem[00000000300c1410] = 675145ff ffffffff
!	%l0 = 000000ff, %l1 = 00000076, Mem[0000000010101420] = 5a6fe1db 0000fd46
	stda	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = 000000ff 00000076
!	%f3  = ffd69eff, Mem[0000000010141400] = 00000000
	sta	%f3 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ffd69eff
!	Mem[0000000010181408] = ff6c7880, %l6 = 00000000619239f8, %asi = 80
	swapa	[%i6+0x008]%asi,%l6	! %l6 = 00000000ff6c7880
!	Mem[0000000030081410] = 6f5a0000, %l3 = ffffffffffffffe3
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 000000006f5a0000
!	Mem[0000000010001400] = b9da13a3, %l2 = fffffffffffffa8e
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000b9da13a3
!	Starting 10 instruction Load Burst
!	%l5 = 000000000000ffff, immed = fffff84f, %y  = 00000000
	umul	%l5,-0x7b1,%l0		! %l0 = 0000fffef84f07b1, %y = 0000fffe

p0_label_133:
!	Mem[0000000030141400] = ff00ffff, %f23 = c800001c
	lda	[%i5+%g0]0x89,%f23	! %f23 = ff00ffff
!	Mem[0000000010081400] = f9ffffff fa6bb877, %l4 = ffffffb3, %l5 = 0000ffff
	ldd	[%i2+%g0],%l4		! %l4 = 00000000f9ffffff 00000000fa6bb877
!	Mem[0000000030101410] = ffffffff, %l7 = fffffffffffff5ca
	ldsha	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 212f08ef, %l6 = 00000000ff6c7880
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000212f
!	Mem[0000000010181408] = 619239f889518c9a, %f26 = 0abf9d3c a8760424
	ldda	[%i6+%o4]0x80,%f26	! %f26 = 619239f8 89518c9a
!	Mem[0000000030141410] = 000000d957fff0e3, %l4 = 00000000f9ffffff
	ldxa	[%i5+%o5]0x81,%l4	! %l4 = 000000d957fff0e3
!	Mem[0000000010081418] = 188b3ca9, %l0 = 0000fffef84f07b1
	ldsb	[%i2+0x01a],%l0		! %l0 = 000000000000003c
!	Mem[0000000010181410] = ffd6e547 000000ff, %l0 = 0000003c, %l1 = 00000076
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 00000000ffd6e547 00000000000000ff
!	Mem[0000000030141408] = 08c80aff, %l5 = 00000000fa6bb877
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 0000000008c80aff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000b9da13a3, Mem[0000000030081408] = ffffffa5
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = b9da13a3

p0_label_134:
!	%f2  = 00006f5a ffd69eff, %l7 = ffffffffffffffff
!	Mem[00000000300c1418] = 1c0000c8f8399261
	add	%i3,0x018,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1418] = ff9ed6ff5a6f0000
!	%f4  = dd013e6a, Mem[0000000030041410] = f074df67
	sta	%f4 ,[%i1+%o5]0x89	! Mem[0000000030041410] = dd013e6a
!	%f17 = ff969edc, %f7  = bf800798, %f10 = ffffffff
	fsubs	%f17,%f7 ,%f10		! %f10 = ffd69edc
!	Mem[0000000010101418] = 619239f8, %l0 = 00000000ffd6e547
	ldstub	[%i4+0x018],%l0		! %l0 = 00000061000000ff
!	Mem[0000000030181400] = ff000000, %l5 = 0000000008c80aff
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	%l6 = 000000000000212f, Mem[0000000020800040] = 00ff2222, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 212f2222
!	Mem[0000000030001400] = 000045ff, %l2 = 00000000b9da13a3
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = ff176a9c, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff176a9c
!	%f14 = ff969eff 4bdf8c9a, Mem[0000000010141408] = 00000000 000000ff
	stda	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = ff969eff 4bdf8c9a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 911b81ff, %l0 = 0000000000000061
	lduh	[%i0+0x036],%l0		! %l0 = 00000000000081ff

p0_label_135:
!	Mem[0000000010001408] = ef082f21, %l4 = 000000d957fff0e3
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000002f21
!	Mem[0000000030181410] = 0000000000000000, %l0 = 00000000000081ff
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %f2  = 00006f5a ffd69eff
	ldda	[%i6+%o5]0x89,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000010101410] = 827bc613b81f55ab, %l2 = 00000000ff176a9c
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 827bc613b81f55ab
!	Mem[00000000100c1430] = 00000000, %l0 = 0000000000000000
	ldswa	[%i3+0x030]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = 212f2222, %l6 = 000000000000212f
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000212f
!	Mem[0000000030041410] = dd013e6a, %l7 = ffffffffffffffff
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 00000000dd013e6a
!	Mem[0000000030141400] = ff00ffff, %l6 = 000000000000212f
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = e3ffffffffffffff, %l4 = 0000000000002f21
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = e3ffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 08c80aff, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_136:
!	%l4 = e3ffffffffffffff, Mem[0000000010001400] = fffffa8e00006f5a
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = e3ffffffffffffff
!	%l5 = 00000000ff000000, Mem[0000000010181410] = ffd6e547
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 00000000000000ff
	setx	0xd9300ce81bc06cc6,%g7,%l0 ! %l0 = d9300ce81bc06cc6
!	%l1 = 00000000000000ff
	setx	0x4b91c0f07ba39b73,%g7,%l1 ! %l1 = 4b91c0f07ba39b73
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d9300ce81bc06cc6
	setx	0x96697308289b3e1b,%g7,%l0 ! %l0 = 96697308289b3e1b
!	%l1 = 4b91c0f07ba39b73
	setx	0x48b916583e17ac76,%g7,%l1 ! %l1 = 48b916583e17ac76
!	%l2 = b81f55ab, %l3 = 6f5a0000, Mem[00000000300c1410] = ffffffff 675145ff
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = b81f55ab 6f5a0000
!	Mem[0000000010101428] = 0abf9d3c, %l3 = 6f5a0000, %l4 = ffffffff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 000000000abf9d3c
!	%l3 = 000000006f5a0000, Mem[0000000010141408] = ff969eff4bdf8c9a
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000006f5a0000
!	%l4 = 000000000abf9d3c, Mem[00000000201c0000] = ffff075f
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 3cff075f
!	Mem[0000000021800040] = df67856a, %l5 = 00000000ff000000
	ldstub	[%o3+0x040],%l5		! %l5 = 000000df000000ff
!	%l0 = 96697308289b3e1b, Mem[0000000010041436] = 404dff27, %asi = 80
	stba	%l0,[%i1+0x036]%asi	! Mem[0000000010041434] = 404d1b27
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ef082f21, %l6 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000002f21

p0_label_137:
!	%l7 = 00000000dd013e6a, %l2 = 827bc613b81f55ab, %l1 = 48b916583e17ac76
	xnor	%l7,%l2,%l1		! %l1 = 7d8439ec9ae1943e
!	Mem[0000000030181408] = 50000000, %l0 = 96697308289b3e1b
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c143c] = 000000ff, %f12 = ff00ffff
	ld	[%i3+0x03c],%f12	! %f12 = 000000ff
!	%l3 = 000000006f5a0000, %l4 = 000000000abf9d3c, %l0 = 0000000000000000
	sdivx	%l3,%l4,%l0		! %l0 = 000000000000000a
!	Mem[0000000010001408] = 212f08ef, %l4 = 000000000abf9d3c
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000021
!	Mem[000000001018141c] = 05736bca, %l3 = 000000006f5a0000
	lduwa	[%i6+0x01c]%asi,%l3	! %l3 = 0000000005736bca
!	Mem[0000000010141410] = abb1bc43, %l6 = 0000000000002f21
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ab000000ff
!	Mem[00000000100c1408] = ffff00ff50f59c61, %l4 = 0000000000000021
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = ffff00ff50f59c61
!	Mem[0000000010141414] = ffffffff, %l1 = 7d8439ec9ae1943e
	ldsha	[%i5+0x016]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = f9ffffff, %l3 = 0000000005736bca
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000f9ffffff

p0_label_138:
!	Mem[0000000030041410] = 6a3e01dd, %l3 = 00000000f9ffffff
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 0000006a000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010181406] = 83ffffff, %asi = 80
	stba	%l1,[%i6+0x006]%asi	! Mem[0000000010181404] = 83ffffff
!	Mem[0000000010001438] = a87604246978bf4a, %l5 = 00000000000000df, %l3 = 000000000000006a
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = a87604246978bf4a
!	%f11 = f074df67, %f24 = 42f4f9d2
	fcmpes	%fcc1,%f11,%f24		! %fcc1 = 1
!	Mem[0000000030101400] = 57b30000, %l6 = 00000000000000ab
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = f8399261, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000061000000ff
!	%l3 = a87604246978bf4a, Mem[0000000030141400] = ffff00ff
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 6978bf4a
!	Mem[0000000030041400] = f83992ff, %l5 = 00000000000000df
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000000000000061, Mem[0000000030001410] = dc9ed6ffff010000
	stxa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000061
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 827bc613, %l4 = ffff00ff50f59c61
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffff82

p0_label_139:
!	Mem[0000000010101408] = a50000ff, %l4 = ffffffffffffff82
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffa500
!	Mem[0000000010041408] = 50f59cff, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l5	! %l5 = 0000000050f59cff
!	Mem[00000000201c0000] = 3cff075f, %l7 = 00000000dd013e6a
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000003cff
!	Mem[0000000010101410] = 827bc613, %l0 = 000000000000000a
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 00000000827bc613
!	Mem[0000000010141410] = ffffffff 43bcb1ff, %l4 = ffffa500, %l5 = 50f59cff
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 0000000043bcb1ff 00000000ffffffff
!	%f16 = 6f0ac808, %f16 = 6f0ac808, %f4  = dd013e6a
	fdivs	%f16,%f16,%f4 		! %f4  = 3f800000
!	Mem[0000000021800040] = ff67856a, %l3 = a87604246978bf4a
	ldsb	[%o3+0x040],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = ffd69eff, %l1 = ffffffffffffffff
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ffd6
!	Mem[0000000030101400] = ff00b357, %l2 = 827bc613b81f55ab
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = fb1cdaef15176aff, %l0 = 00000000827bc613
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = fb1cdaef15176aff

p0_label_140:
!	%l4 = 0000000043bcb1ff, Mem[00000000100c1410] = 9a8c518900000000
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000043bcb1ff
!	%l6 = 0000000000000061, imm = fffffffffffffe4f, %l5 = 00000000ffffffff
	xor	%l6,-0x1b1,%l5		! %l5 = fffffffffffffe2e
!	Mem[00000000100c1410] = 00000000, %l5 = fffffffffffffe2e
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000043bcb1ff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	%f31 = ffffffff, Mem[00000000300c1400] = 000000ff
	sta	%f31,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff
!	%l6 = 0000000000000061, Mem[0000000030081408] = a313dab9
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = a3130061
!	%l0 = fb1cdaef15176aff, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 15176aff
!	Mem[0000000010141437] = 4bdf8c9a, %l1 = 000000000000ffd6
	ldstub	[%i5+0x037],%l1		! %l1 = 0000009a000000ff
!	%l4 = 00000000ff000000, Mem[00000000211c0000] = ffffd61d
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00ffd61d
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffffff4500ff, %l0 = fb1cdaef15176aff
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = ffffffffff4500ff

p0_label_141:
!	Mem[0000000010001408] = 212f08ef, %l1 = 000000000000009a
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000212f
!	Mem[0000000030181408] = 0000000050000000, %l7 = 0000000000003cff
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 0000000050000000
!	Mem[000000001000141c] = 8b0c1328, %l4 = 00000000ff000000
	lduwa	[%i0+0x01c]%asi,%l4	! %l4 = 000000008b0c1328
!	Mem[00000000201c0000] = 3cff075f, %l5 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 000000000000003c
!	Mem[0000000030001400] = ff4500ff, %l4 = 000000008b0c1328
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081420] = ff455167f074df67, %f4  = 3f800000 47e5d6af
	ldd	[%i2+0x020],%f4 	! %f4  = ff455167 f074df67
!	%l6 = 0000000000000061, %l6 = 0000000000000061, %l4 = ffffffffffffffff
	sub	%l6,%l6,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001408] = ef082f21, %f13 = ffffffff
	lda	[%i0+%o4]0x88,%f13	! %f13 = ef082f21
!	Mem[00000000100c1410] = 2efeffff, %l2 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000061, Mem[0000000010101432] = 1b3bf8ff
	stb	%l6,[%i4+0x032]		! Mem[0000000010101430] = 1b3b61ff

p0_label_142:
!	%l4 = 0000000000000000, Mem[0000000010141400] = ffd69eff
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00d69eff
!	%l0 = ffffffffff4500ff, Mem[0000000010081408] = 5a6fe1ff
	stha	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 5a6f00ff
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000000000061
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010001438] = a87604246978bf4a, %l5 = 000000000000003c, %l2 = 00000000000000ff
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = a87604246978bf4a
!	%l7 = 0000000050000000, Mem[0000000010101400] = 6f0ac808
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 50000000
!	%f2  = 00000000 00000000, Mem[00000000100c1410] = 2efeffff ffb1bc43
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000000
!	%f22 = 619239f8 ff00ffff, Mem[0000000030081410] = e3ffffff ffffffff
	stda	%f22,[%i2+%o5]0x81	! Mem[0000000030081410] = 619239f8 ff00ffff
!	Mem[0000000010101400] = 50000000, %l6 = 000000ff, %l4 = 00000000
	casa	[%i4]0x80,%l6,%l4	! %l4 = 0000000050000000
!	Mem[00000000100c1410] = 00000000, %l1 = 000000000000212f
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 5a6f000057ff8be3, %f20 = 5a6f0000 57ff8be3
	ldda	[%i0+%o5]0x80,%f20	! %f20 = 5a6f0000 57ff8be3

p0_label_143:
!	Mem[0000000030081410] = ffff00fff8399261, %l6 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = ffff00fff8399261
!	Mem[00000000300c1400] = ffffffff08c80a6f, %l3 = ffffffffffffffff
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ffffffff08c80a6f
!	Mem[0000000030181410] = 00000000, %l0 = ffffffffff4500ff
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c141c] = ff0000ff, %l2 = a87604246978bf4a
	ldsb	[%i3+0x01c],%l2		! %l2 = ffffffffffffffff
!	%l1 = 0000000000000000, %l1 = 0000000000000000, %l3 = ffffffff08c80a6f
	orn	%l1,%l1,%l3		! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = ab551fb8, %l5 = 000000000000003c
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000ab55
!	Mem[0000000010101410] = 13c67b82, %l6 = ffff00fff8399261
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 0000000013c67b82
!	Mem[0000000030101408] = ff6a1715efda1cfb, %f2  = 00000000 00000000
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = ff6a1715 efda1cfb
!	Mem[0000000030101400] = ff00000057b300ff, %l3 = ffffffffffffffff
	ldxa	[%i4+%g0]0x89,%l3	! %l3 = ff00000057b300ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00006f5a, %l7 = 0000000050000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 0000005a000000ff

p0_label_144:
!	%l1 = 0000000000000000, Mem[0000000010141400] = ff9ed600
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010141408] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 212f08ef, %l5 = 000000000000ab55
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 00000021000000ff
!	%l6 = 13c67b82, %l7 = 0000005a, Mem[0000000010001420] = fffffd7c ffffffff
	stda	%l6,[%i0+0x020]%asi	! Mem[0000000010001420] = 13c67b82 0000005a
!	%l4 = 0000000050000000, Mem[0000000010141408] = 000000ff
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 50000000
!	%l4 = 0000000050000000, %l6 = 0000000013c67b82, %l2 = 0000000000000000
	sub	%l4,%l6,%l2		! %l2 = 000000003c39847e
!	Mem[0000000030141408] = ff0ac808, %l1 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ff0ac808
!	%l2 = 000000003c39847e, Mem[0000000010001438] = a8760424
	stw	%l2,[%i0+0x038]		! Mem[0000000010001438] = 3c39847e
!	%l5 = 0000000000000021, Mem[0000000030081410] = f8399261
	stwa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000021
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff4500ff, %l7 = 000000000000005a
	ldsba	[%i0+%g0]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_145:
!	%l6 = 0000000013c67b82, Mem[0000000010101400] = 00000050
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 13c67b82
!	Mem[0000000010081400] = ca6b7305, %l7 = ffffffffffffffff
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 00000000ca6b7305
!	Mem[0000000030141410] = 000000d9, %l4 = 0000000050000000
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000d9
!	Mem[0000000010081400] = 05736bca, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000005736bca
!	Mem[0000000030081408] = 610013a3, %f9  = 9a69ff71
	lda	[%i2+%o4]0x81,%f9 	! %f9 = 610013a3
!	Mem[0000000030101408] = 15176aff, %l0 = 0000000005736bca
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ff9239f8, %l0 = 00000000000000ff
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141400] = 6978bf4a 0354dc62, %l2 = 3c39847e, %l3 = 57b300ff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 000000006978bf4a 000000000354dc62
!	Mem[00000000211c0000] = 00ffd61d, %l4 = 00000000000000d9
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000021800000] = 9bff37ea
	sth	%l4,[%o3+%g0]		! Mem[0000000021800000] = 000037ea

p0_label_146:
!	Mem[0000000010041400] = 5a6fe1db, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 000000005a6fe1db
!	%l1 = 00000000ff0ac808, Mem[00000000100c1400] = 43bcb1ff
	stba	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 08bcb1ff
!	%l2 = 6978bf4a, %l3 = 0354dc62, Mem[0000000030001400] = ff4500ff ffffffff
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 6978bf4a 0354dc62
!	%l2 = 6978bf4a, %l3 = 0354dc62, Mem[0000000030181408] = 50000000 00000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 6978bf4a 0354dc62
!	Mem[00000000100c1400] = 08bcb1ff, %l4 = 000000005a6fe1db
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000008bcb1ff
!	%l0 = ffffffffffffffff, Mem[00000000100c1422] = fff89f5a
	sth	%l0,[%i3+0x022]		! Mem[00000000100c1420] = fff8ffff
!	%l1 = 00000000ff0ac808, %l7 = 00000000ca6b7305, %l3 = 000000000354dc62
	udivx	%l1,%l7,%l3		! %l3 = 0000000000000001
!	%l0 = ffffffffffffffff, Mem[0000000030001410] = 00000061
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%l0 = ffffffffffffffff, imm = fffffffffffff5db, %l0 = ffffffffffffffff
	andn	%l0,-0xa25,%l0		! %l0 = 0000000000000a24
!	Starting 10 instruction Load Burst
!	%l1 = 00000000ff0ac808, immed = fffffe21, %y  = 0000fffe
	umul	%l1,-0x1df,%l0		! %l0 = ff0ac62acad3b908, %y = ff0ac62a

p0_label_147:
!	Mem[00000000300c1410] = b81f55ab, %l2 = 000000006978bf4a
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = ffffffffb81f55ab
!	Mem[0000000010101400] = 13c67b82, %l1 = 00000000ff0ac808
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffff82
!	Mem[0000000010041400] = 677ffb11 00000000, %l0 = cad3b908, %l1 = ffffff82
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000677ffb11
!	Mem[0000000010181414] = 000000ff, %f21 = 57ff8be3
	lda	[%i6+0x014]%asi,%f21	! %f21 = 000000ff
!	Mem[0000000030141410] = d9000000, %f1  = 00000000
	lda	[%i5+%o5]0x89,%f1 	! %f1 = d9000000
!	Mem[0000000010041428] = dc9e96ff, %l5 = 0000000000000021
	ldsha	[%i1+0x02a]%asi,%l5	! %l5 = ffffffffffff96ff
!	Mem[0000000030141400] = 6978bf4a0354dc62, %f26 = 619239f8 89518c9a
	ldda	[%i5+%g0]0x81,%f26	! %f26 = 6978bf4a 0354dc62
!	Mem[0000000010081410] = 47e5d6af4ae6ae76, %l6 = 0000000013c67b82
	ldx	[%i2+%o5],%l6		! %l6 = 47e5d6af4ae6ae76
!	Mem[0000000010101434] = 9a69ff71, %l2 = ffffffffb81f55ab
	lduba	[%i4+0x034]%asi,%l2	! %l2 = 000000000000009a
!	Starting 10 instruction Store Burst
!	%f20 = 5a6f0000 000000ff, %l4 = 0000000008bcb1ff
!	Mem[0000000010001428] = fa6bb877000000f8
	add	%i0,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_P ! Mem[0000000010001428] = 5a6f0000000000ff

p0_label_148:
!	%l2 = 000000000000009a, Mem[0000000030141400] = 6978bf4a
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000009a
!	Mem[0000000010181410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f27 = 0354dc62, Mem[0000000030081400] = 00000000
	sta	%f27,[%i2+%g0]0x81	! Mem[0000000030081400] = 0354dc62
!	Mem[0000000030081410] = 00000021, %l6 = 47e5d6af4ae6ae76
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000021
!	Mem[0000000010081426] = f074df67, %l5 = ffffffffffff96ff
	ldstub	[%i2+0x026],%l5		! %l5 = 000000df000000ff
!	%l1 = 00000000677ffb11, Mem[0000000030081408] = 610013a3
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 677ffb11
!	%f2  = ff6a1715 efda1cfb, Mem[0000000010181428] = 00000076 840ac85e
	stda	%f2 ,[%i6+0x028]%asi	! Mem[0000000010181428] = ff6a1715 efda1cfb
!	%l0 = 000000ff, %l1 = 677ffb11, Mem[0000000030001408] = ffffffff 9a8cdf4b
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 677ffb11
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000000001
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff006f5a5a6f0000, %l2 = 000000000000009a
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = ff006f5a5a6f0000

p0_label_149:
!	Mem[0000000030141400] = 9a000000, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 1b3bf8ffffffffff, %l6 = 0000000000000021
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 1b3bf8ffffffffff
!	Mem[0000000010141410] = ffb1bc43ffffffff, %f14 = ff969eff 4bdf8c9a
	ldda	[%i5+%o5]0x80,%f14	! %f14 = ffb1bc43 ffffffff
!	Mem[00000000100c142c] = 4bdf8c9a, %l5 = 00000000000000df
	ldswa	[%i3+0x02c]%asi,%l5	! %l5 = 000000004bdf8c9a
!	Mem[0000000010081410] = 47e5d6af, %f21 = 000000ff
	lda	[%i2+%o5]0x80,%f21	! %f21 = 47e5d6af
!	Mem[0000000010041420] = c9f89f5a 4bdf8c9a, %l2 = 5a6f0000, %l3 = 00000000
	ldd	[%i1+0x020],%l2		! %l2 = 00000000c9f89f5a 000000004bdf8c9a
!	Mem[0000000030101400] = 57b300ff, %l1 = 00000000677ffb11
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = f8399261, %l1 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 00000000f8399261
!	Mem[0000000010041438] = dd013e6a, %l3 = 000000004bdf8c9a
	ldub	[%i1+0x038],%l3		! %l3 = 00000000000000dd
!	Starting 10 instruction Store Burst
!	%f30 = 675145ff ffffffff, Mem[0000000030041410] = ff3e01dd 675145ff
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = 675145ff ffffffff

p0_label_150:
!	%l0 = 000000ff, %l1 = f8399261, Mem[0000000010141408] = 50000000 00005a6f
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff f8399261
!	%l2 = 00000000c9f89f5a, Mem[0000000010001408] = ff2f08ef00000000
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000c9f89f5a
!	Mem[00000000218000c0] = 0f110164, %l1 = 00000000f8399261
	ldstub	[%o3+0x0c0],%l1		! %l1 = 0000000f000000ff
!	%l3 = 00000000000000dd, Mem[00000000201c0000] = 3cff075f
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00dd075f
!	Mem[0000000030181400] = 08c80aff, %l3 = 00000000000000dd
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000008c80aff
!	%l3 = 0000000008c80aff, %l7 = 00000000ca6b7305, %l4 = 0000000008bcb1ff
	andn	%l3,%l7,%l4		! %l4 = 00000000008008fa
!	Mem[0000000010001410] = 00006fff, %l4 = 00000000008008fa
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000006fff
!	Mem[0000000010081430] = ffbbf195, %l7 = ca6b7305, %l3 = 08c80aff
	add	%i2,0x30,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000ffbbf195
!	Mem[0000000010141410] = 43bcb1ff, %l2 = 00000000c9f89f5a
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 212f08ef, %l7 = 00000000ca6b7305
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 00000000212f08ef

p0_label_151:
!	Mem[0000000010141438] = 0000ffff, %l6 = 1b3bf8ffffffffff
	ldsh	[%i5+0x03a],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010181424] = 000000ff, %f25 = 9fa98200
	lda	[%i6+0x024]%asi,%f25	! %f25 = 000000ff
!	Mem[0000000010081420] = ff455167 f074ff67, %l0 = 000000ff, %l1 = 0000000f
	ldd	[%i2+0x020],%l0		! %l0 = 00000000ff455167 00000000f074ff67
!	Mem[0000000010141408] = ff000000 619239f8, %l6 = ffffffff, %l7 = 212f08ef
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000ff000000 00000000619239f8
!	Mem[0000000010101434] = 9a69ff71, %l1 = 00000000f074ff67
	lduha	[%i4+0x036]%asi,%l1	! %l1 = 000000000000ff71
!	Mem[0000000030041400] = ff9239f8, %f20 = 5a6f0000
	lda	[%i1+%g0]0x81,%f20	! %f20 = ff9239f8
!	Mem[00000000300c1410] = ab551fb8, %l6 = 00000000ff000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000ab55
!	Mem[0000000030041400] = ff9239f8, %f25 = 000000ff
	lda	[%i1+%g0]0x81,%f25	! %f25 = ff9239f8
!	Mem[0000000030081408] = 677ffb11, %l6 = 000000000000ab55
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000067
!	Starting 10 instruction Store Burst
!	%l7 = 00000000619239f8, Mem[00000000100c1408] = ffff00ff
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 619239f8

p0_label_152:
!	%l3 = 00000000ffbbf195, Mem[0000000020800001] = ffffb0a2, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = ff95b0a2
!	Mem[0000000010181418] = 7ec016b205736bca, %l5 = 000000004bdf8c9a, %l4 = 0000000000006fff
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 7ec016b205736bca
!	%l4 = 7ec016b205736bca, Mem[0000000010041410] = ffffffff15176aff
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 7ec016b205736bca
!	%l2 = 00000000000000ff, Mem[0000000030041408] = ffe3923500000000
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	%f11 = f074df67, Mem[0000000030001400] = 4abf7869
	sta	%f11,[%i0+%g0]0x81	! Mem[0000000030001400] = f074df67
!	Mem[00000000100c1400] = dbe16f5a, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 0000005a000000ff
!	%l6 = 00000067, %l7 = 619239f8, Mem[0000000010141408] = ff000000 619239f8
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000067 619239f8
!	Mem[0000000030181408] = 4abf7869, %l0 = 00000000ff455167
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 0000004a000000ff
!	%f4  = ff455167 f074df67, Mem[0000000030101410] = ffffffff fff83b1b
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = ff455167 f074df67
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l2 = 000000000000005a
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_153:
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = f83992ff, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 00000000000092ff
!	Mem[0000000010041428] = dc9e96ff08c80a6f, %f16 = 6f0ac808 ff969edc
	ldda	[%i1+0x028]%asi,%f16	! %f16 = dc9e96ff 08c80a6f
!	Mem[0000000010101400] = 827bc613, %f26 = 6978bf4a
	lda	[%i4+%g0]0x80,%f26	! %f26 = 827bc613
!	Mem[000000001008140c] = 5a6f0000, %l6 = 0000000000000067
	lduw	[%i2+0x00c],%l6		! %l6 = 000000005a6f0000
!	Mem[0000000030001408] = ff000000, %l2 = 00000000000092ff
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010181410] = ff000000, %l1 = 000000000000ff71
	ldsb	[%i6+%o5],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = f074df67, %l1 = ffffffffffffffff
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 00000000f074df67
!	Starting 10 instruction Store Burst
!	%l1 = 00000000f074df67, Mem[00000000218001c0] = 001507db, %asi = 80
	stba	%l1,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 671507db

p0_label_154:
!	Mem[00000000100c140c] = 50f59c61, %l0 = 0000004a, %l4 = 05736bca
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000050f59c61
!	Mem[0000000010081410] = afd6e547, %l6 = 000000005a6f0000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000afd6e547
!	Randomly selected nop
	nop
!	Mem[00000000100c1400] = ff6fe1db, %l3 = 00000000ffbbf195
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff6fe1db
!	Mem[0000000010181408] = 619239f8, %l2 = ffffffffff000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000619239f8
!	%l0 = 000000000000004a, Mem[0000000030101400] = ff00b357
	stba	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 4a00b357
!	%f15 = ffffffff, Mem[0000000030001408] = 000000ff
	sta	%f15,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
!	%f16 = dc9e96ff 08c80a6f 1c0000c8 ef082f21
!	%f20 = ff9239f8 47e5d6af 619239f8 ff00ffff
!	%f24 = 42f4f9d2 ff9239f8 827bc613 0354dc62
!	%f28 = 43bcb1ab a50000ff 675145ff ffffffff
	stda	%f16,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
	membar	#Sync			! Added by membar checker (20)
!	%f12 = 000000ff ef082f21, %l6 = 00000000afd6e547
!	Mem[0000000010101408] = a50000ff89518c21
	add	%i4,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_P ! Mem[0000000010101408] = a50000ffef082f21
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff969edc, %l5 = 000000004bdf8c9a
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffffdc

p0_label_155:
!	Mem[0000000030101408] = 212f08efc800001c, %f20 = ff9239f8 47e5d6af
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 212f08ef c800001c
!	Mem[00000000100c1410] = 2f210000, %l4 = 0000000050f59c61
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 000000000000002f
!	Mem[0000000010041400] = 00000000, %l6 = 00000000afd6e547
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000619239f8
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 50f59cff, %l0 = 000000000000004a
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000009cff
!	Mem[0000000010101438] = 0000ffff, %f17 = 08c80a6f
	ld	[%i4+0x038],%f17	! %f17 = 0000ffff
!	Mem[00000000100c1420] = fff8ffff, %l5 = ffffffffffffffdc
	lduha	[%i3+0x020]%asi,%l5	! %l5 = 000000000000fff8
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1430] = 0000000000000000, %f2  = ff6a1715 efda1cfb
	ldd	[%i3+0x030],%f2 	! %f2  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000002f, Mem[0000000010141400] = 00000000
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000002f

p0_label_156:
!	%f20 = 212f08ef, %f6  = ff8e3083, %f19 = ef082f21
	fdivs	%f20,%f6 ,%f19		! %f19 = ffce3083
!	Mem[0000000030101408] = 1c0000c8, %l7 = 00000000619239f8
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 000000001c0000c8
!	%l1 = 00000000f074df67, Mem[0000000030101408] = 619239f8ef082f21
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000f074df67
!	Mem[0000000010081410] = 5a6f0000, %l4 = 000000000000002f
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 000000005a6f0000
!	Mem[0000000030081400] = 0354dc62, %l0 = 0000000000009cff
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 000000000354dc62
!	%f4  = ff455167, Mem[0000000010181400] = ff000000
	sta	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff455167
!	%f26 = 827bc613, %f5  = f074df67
	fsqrts	%f26,%f5 		! %f5  = 7fffffff
!	%l3 = 00000000ff6fe1db, Mem[0000000030041400] = ff9239f8c800001c
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000ff6fe1db
!	%l3 = 00000000ff6fe1db, %l0 = 000000000354dc62, %y  = ff0ac62a
	umul	%l3,%l0,%l7		! %l7 = 0352fc419bc8a9d6, %y = 0352fc41
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = dc9e96ff, %l3 = 00000000ff6fe1db
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 00000000dc9e96ff

p0_label_157:
!	%f14 = ffb1bc43, %f31 = ffffffff, %f8  = 1b3bf8ff 610013a3
	fsmuld	%f14,%f31,%f8 		! %f8  = fffe3788 60000000
!	Mem[0000000010141430] = 80786cff4bdf8cff, %f26 = 827bc613 0354dc62
	ldda	[%i5+0x030]%asi,%f26	! %f26 = 80786cff 4bdf8cff
!	Mem[00000000100c1400] = ffbbf195, %l7 = 0352fc419bc8a9d6
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	%f16 = dc9e96ff, %f6  = ff8e3083, %f16 = dc9e96ff 0000ffff
	fsmuld	%f16,%f6 ,%f16		! %f16 = fff9c610 60000000
!	Mem[0000000010081410] = 0000002f, %l7 = ffffffffffffffff
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 000000000000002f
!	Mem[0000000020800000] = ff95b0a2, %l4 = 000000005a6f0000
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffff95
!	%f18 = 1c0000c8, %f16 = fff9c610, %f29 = a50000ff
	fdivs	%f18,%f16,%f29		! %f29 = fff9c610
!	Mem[0000000030101408] = 00000000f074df67, %f24 = 42f4f9d2 ff9239f8
	ldda	[%i4+%o4]0x81,%f24	! %f24 = 00000000 f074df67
!	Mem[0000000010041410] = 05736bca, %l5 = 000000000000fff8
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000006bca
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff

p0_label_158:
!	%f25 = f074df67, %f16 = fff9c610, %f2  = 00000000
	fsubs	%f25,%f16,%f2 		! %f2  = fff9c610
!	%l6 = 00000000, %l7 = 0000002f, Mem[0000000030081400] = ff9c0000 ffbbf195
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 0000002f
!	%l3 = 00000000dc9e96ff, Mem[0000000010041430] = 6f0ac808, %asi = 80
	stwa	%l3,[%i1+0x030]%asi	! Mem[0000000010041430] = dc9e96ff
!	Mem[0000000010181430] = 000000bf, %l4 = ffffff95, %l7 = 0000002f
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000000000bf
!	%f24 = 00000000, Mem[00000000300c1400] = ffffffff
	sta	%f24,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010001408] = 00000000, %l1 = 00000000f074df67
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = d9000000, %l0 = 000000000354dc62
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 00000000d9000000
!	Mem[0000000010081408] = ff006f5a, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%f25 = f074df67, Mem[0000000010001408] = 67df74f0
	sta	%f25,[%i0+%o4]0x88	! Mem[0000000010001408] = f074df67
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 008008fa, %l7 = 00000000000000bf
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = fffffffffffffffa

p0_label_159:
!	Mem[0000000010081410] = 2f000000 4ae6ae76, %l2 = 00000000, %l3 = dc9e96ff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000002f000000 000000004ae6ae76
!	Mem[0000000010081410] = 2f0000004ae6ae76, %f6  = ff8e3083 bf800798
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = 2f000000 4ae6ae76
!	Mem[0000000010041410] = ca6b7305 b216c07e, %l0 = d9000000, %l1 = 000000ff
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 00000000ca6b7305 00000000b216c07e
!	Mem[0000000030101410] = f83992ff, %l7 = fffffffffffffffa
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 00000000f83992ff
!	Mem[0000000010101408] = ff0000a5, %l1 = 00000000b216c07e
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000a5
!	Mem[0000000010141400] = 57b300000000002f, %f4  = ff455167 7fffffff
	ldda	[%i5+%g0]0x88,%f4 	! %f4  = 57b30000 0000002f
!	Mem[0000000010101410] = 827bc613, %l2 = 000000002f000000
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000827b
!	Mem[0000000030101408] = 67df74f0 00000000, %l2 = 0000827b, %l3 = 4ae6ae76
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000067df74f0
!	Mem[00000000218000c0] = ff110164, %l5 = 0000000000006bca
	ldub	[%o3+0x0c1],%l5		! %l5 = 0000000000000011
!	Starting 10 instruction Store Burst
!	%f0  = ffffffff d9000000, Mem[0000000030141410] = 62dc5403 57fff0e3
	stda	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff d9000000

p0_label_160:
!	Mem[000000001004141c] = 00000007, %l3 = 0000000067df74f0
	swap	[%i1+0x01c],%l3		! %l3 = 0000000000000007
!	%f18 = 1c0000c8 ffce3083, Mem[0000000010181410] = 000000ff ff000000
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 1c0000c8 ffce3083
!	Mem[0000000010081408] = 5a6f00ff, %l7 = 00000000f83992ff
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 000000005a6f00ff
!	%l1 = 00000000000000a5, immd = 0000000000000477, %l0 = 00000000ca6b7305
	sdivx	%l1,0x477,%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081410] = 2f000000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%f16 = fff9c610 60000000, Mem[00000000100c1410] = 2f210000 00000000
	stda	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = fff9c610 60000000
!	Mem[0000000010181400] = ff455167, %l1 = 00000000000000a5
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181404] = 83ffffff, %l3 = 0000000000000007
	swap	[%i6+0x004],%l3		! %l3 = 0000000083ffffff
!	Mem[0000000010101422] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+0x022]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l3 = 0000000083ffffff
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_161:
!	%f16 = fff9c610, %f4  = 57b30000, %f15 = ffffffff
	fsubs	%f16,%f4 ,%f15		! %f15 = fff9c610
!	Mem[00000000100c1410] = 10c6f9ff, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101418] = ff9239f8, %l7 = 000000005a6f00ff
	lduw	[%i4+0x018],%l7		! %l7 = 00000000ff9239f8
!	%f8  = fffe3788 60000000, Mem[0000000030041400] = 00000000 ff6fe1db
	stda	%f8 ,[%i1+%g0]0x81	! Mem[0000000030041400] = fffe3788 60000000
!	Mem[0000000030141400] = 0000009a0354dc62, %l4 = ffffffffffffff95
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = 0000009a0354dc62
!	Mem[0000000010141400] = 57b30000 0000002f, %l6 = 00000000, %l7 = ff9239f8
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 000000000000002f 0000000057b30000
!	Mem[0000000010041408] = ff9cf550, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffff9c
!	Mem[00000000100c1400] = ffbbf195, %l6 = 000000000000002f
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ffbb
!	Mem[0000000010081408] = f83992ff, %l4 = 0000009a0354dc62
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffff92ff
!	Starting 10 instruction Store Burst
!	%f8  = fffe3788 60000000, Mem[0000000010141400] = 2f000000 0000b357
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = fffe3788 60000000

p0_label_162:
!	Mem[00000000300c1410] = ab551fb8, %l1 = ffffffffffffff9c
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ab551fb8
!	Mem[0000000010141400] = 8837feff, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 000000008837feff
!	%f28 = 43bcb1ab, Mem[0000000010081400] = 05736bca
	sta	%f28,[%i2+%g0]0x80	! Mem[0000000010081400] = 43bcb1ab
!	%l4 = ffffffffffff92ff, Mem[00000000211c0000] = 00ffd61d, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 92ffd61d
!	Mem[0000000030001408] = ffffff00, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f7  = 4ae6ae76, Mem[0000000030101408] = 00000000
	sta	%f7 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 4ae6ae76
!	Mem[000000001018143e] = 4abf7869, %l2 = 000000008837feff
	ldstuba	[%i6+0x03e]%asi,%l2	! %l2 = 00000078000000ff
!	Mem[0000000010001408] = f074df67, %l7 = 0000000057b30000
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000f074df67
!	Mem[0000000010081410] = 00000000, %l1 = 00000000ab551fb8
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 13c67b82, %l5 = 0000000000000011
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000007b82

p0_label_163:
!	Mem[0000000010001410] = 008008fa, %l6 = 000000000000ffbb
	lduha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000008fa
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010181400] = ff455167 00000007 ff000000 89518c9a
!	Mem[0000000010181410] = 8330ceff c800001c 7ec016b2 05736bca
!	Mem[0000000010181420] = 7b8209f9 000000ff ff6a1715 efda1cfb
!	Mem[0000000010181430] = 000000bf fffffff9 1c0000c8 4abfff69
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010181410] = 8330ceffc800001c, %f20 = 212f08ef c800001c
	ldda	[%i6+%o5]0x80,%f20	! %f20 = 8330ceff c800001c
!	Mem[00000000100c1400] = 95f1bbff, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000 11fb7f67 ff9cf550 ff0000ff
!	Mem[0000000010041410] = ca6b7305 b216c07e 00000000 67df74f0
!	Mem[0000000010041420] = c9f89f5a 4bdf8c9a dc9e96ff 08c80a6f
!	Mem[0000000010041430] = dc9e96ff 404d1b27 dd013e6a 15176a9c
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010181400] = 675145ff, %l3 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 00000000675145ff
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000008fa
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 76aee64a, %l0 = ffffffffffffffff
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000076
!	Mem[000000001010142c] = 15176a9c, %l0 = 0000000000000076
	ldsh	[%i4+0x02c],%l0		! %l0 = 0000000000001517
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = fb9706db8b0c1328, %l6 = 0000000000000000, %l3 = 00000000675145ff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = fb9706db8b0c1328

p0_label_164:
!	Mem[0000000030141408] = 01000000, %l2 = 0000000000000078
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000001000000ff
!	%l2 = 0000000000000001, Mem[0000000010081400] = 77b86bfaabb1bc43
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000001
!	%l0 = 0000000000001517, Mem[0000000010081400] = 00000001
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00001517
!	Mem[0000000030181400] = dd000000, %l0 = 0000000000001517
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 13c67b82, %l2 = 0000000000000001
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000082000000ff
!	Mem[0000000021800140] = 57db0a30, %l3 = fb9706db8b0c1328
	ldstub	[%o3+0x140],%l3		! %l3 = 00000057000000ff
!	Mem[0000000010041410] = 05736bca, %l7 = 00000000f074df67
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 0000000005736bca
!	Mem[0000000010001438] = 3c39847e, %l3 = 0000000000000057, %asi = 80
	swapa	[%i0+0x038]%asi,%l3	! %l3 = 000000003c39847e
!	Mem[0000000030141408] = ff000000, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = ff9239f8 000000f0, %l0 = ff000000, %l1 = 00000000
	ldda	[%i4+0x018]%asi,%l0	! %l0 = 00000000ff9239f8 00000000000000f0

p0_label_165:
!	Mem[00000000100c1408] = 619cf550f8399261, %f30 = 675145ff ffffffff
	ldda	[%i3+%o4]0x88,%f30	! %f30 = 619cf550 f8399261
!	Mem[0000000010001400] = e3ffffff, %l2 = 0000000000000082
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffe3ff
!	Mem[0000000010001410] = fa088000, %l4 = ffffffffffff92ff
	lduwa	[%i0+0x010]%asi,%l4	! %l4 = 00000000fa088000
!	Mem[0000000010141400] = 00000000, %l1 = 00000000000000f0
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = f074df6762dc5403, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l6	! %l6 = f074df6762dc5403
!	Mem[0000000010181400] = ff455167, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001014143c] = 000000ff, %l4 = 00000000fa088000
	ldsh	[%i5+0x03e],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081408] = ff9239f85a6f0000, %l0 = 00000000ff9239f8
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = ff9239f85a6f0000
!	Mem[0000000010181400] = 675145ff, %l0 = ff9239f85a6f0000
	lduba	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f26 = 80786cff 4bdf8cff, %l6 = f074df6762dc5403
!	Mem[0000000010141410] = ffb1bc43ffffffff
	add	%i5,0x010,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_P ! Mem[0000000010141410] = ffb1bc43ffff8cff

p0_label_166:
!	Mem[0000000010181410] = 8330ceff, %l1 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 000000008330ceff
!	%f31 = f8399261, %f21 = c800001c
	fcmpes	%fcc2,%f31,%f21		! %fcc2 = 1
!	%l4 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l2 = ffffffffffffe3ff, Mem[0000000010001405] = ffffffff, %asi = 80
	stba	%l2,[%i0+0x005]%asi	! Mem[0000000010001404] = ffffffff
!	%f16 = fff9c610 60000000, Mem[0000000010141408] = 00000067 619239f8
	stda	%f16,[%i5+%o4]0x80	! Mem[0000000010141408] = fff9c610 60000000
!	Mem[0000000010141408] = fff9c610, %l0 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l1 = 000000008330ceff, Mem[0000000030041410] = ff455167
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = ff4551ff
!	Mem[0000000010141400] = 00000000, %l2 = ffffffffffffe3ff
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f0  = 00000000 11fb7f67 ff9cf550 ff0000ff
!	%f4  = ca6b7305 b216c07e 00000000 67df74f0
!	%f8  = c9f89f5a 4bdf8c9a dc9e96ff 08c80a6f
!	%f12 = dc9e96ff 404d1b27 dd013e6a 15176a9c
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff455167, %l4 = 00000000000000ff
	ldsba	[%i6+0x002]%asi,%l4	! %l4 = 0000000000000051

p0_label_167:
!	Mem[0000000010101428] = 0abf9d3c 15176a9c, %l6 = 62dc5403, %l7 = 05736bca
	ldd	[%i4+0x028],%l6		! %l6 = 000000000abf9d3c 0000000015176a9c
!	Mem[00000000211c0000] = 92ffd61d, %l7 = 0000000015176a9c
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffff92ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030081400] = 677ffb11, %l7 = ffffffffffff92ff
	ldswa	[%i2+%g0]0x81,%l7	! %l7 = 00000000677ffb11
!	Mem[0000000010081420] = ff455167f074ff67, %l7 = 00000000677ffb11
	ldxa	[%i2+0x020]%asi,%l7	! %l7 = ff455167f074ff67
!	Mem[0000000010041408] = ff9cf550, %l0 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = ff0000ff, %l4 = 0000000000000051
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = ffffffffff0000ff
!	%l5 = 0000000000007b82, %l6 = 000000000abf9d3c, %l6 = 000000000abf9d3c
	add	%l5,%l6,%l6		! %l6 = 000000000ac018be
!	Mem[0000000030081408] = ff0000ff50f59cff, %f28 = 43bcb1ab fff9c610
	ldda	[%i2+%o4]0x81,%f28	! %f28 = ff0000ff 50f59cff
!	Mem[00000000211c0000] = 92ffd61d, %l4 = ffffffffff0000ff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffff92ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000003c39847e, Mem[0000000010041408] = 50f59cff
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 50f5847e

p0_label_168:
!	%l0 = 00000000000000ff, Mem[0000000010081400] = 17150000
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ff150000
!	Mem[0000000030041410] = ff4551ff, %l3 = 000000003c39847e
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f9  = 4bdf8c9a, Mem[0000000010181400] = 675145ff
	sta	%f9 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 4bdf8c9a
!	%l4 = ffffffffffff92ff, Mem[0000000030001408] = ffffffff
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff92ff
!	%l3 = 00000000000000ff, Mem[0000000010141408] = 10c6f9ff
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030081400] = 11fb7f67, %l5 = 0000000000007b82
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 0000000011fb7f67
!	%f30 = 619cf550 f8399261, %l1 = 000000008330ceff
!	Mem[0000000010181420] = 7b8209f9000000ff
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_P ! Mem[0000000010181420] = 619cf550f8399261
!	%f2  = ff9cf550 ff0000ff, Mem[0000000030181400] = ff0000dd 76aee64a
	stda	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ff9cf550 ff0000ff
!	%l4 = ffffffffffff92ff, Mem[0000000030081408] = ff0000ff
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff92ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 9a000000, %l7 = ff455167f074ff67
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_169:
!	Mem[0000000021800040] = ff67856a, %l2 = 0000000000000000
	lduha	[%o3+0x040]%asi,%l2	! %l2 = 000000000000ff67
!	Mem[0000000010041434] = 404d1b27, %l4 = ffffffffffff92ff
	lduw	[%i1+0x034],%l4		! %l4 = 00000000404d1b27
!	Mem[0000000010081410] = b81f55ab, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = ffffffffb81f55ab
!	Mem[0000000010141400] = ff000000, %l2 = 000000000000ff67
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101400] = 827bc613 ff009edc a50000ff ef082f21
!	Mem[0000000010101410] = ff7bc613 b81f55ab ff9239f8 000000f0
!	Mem[0000000010101420] = 0000ffff 00000076 0abf9d3c 15176a9c
!	Mem[0000000010101430] = 1b3b61ff 9a69ff71 0000ffff 00000000
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010101410] = 13c67bff, %l5 = 0000000011fb7f67
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = 6978bfff, %l3 = ffffffffb81f55ab
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffbfff
!	Mem[0000000010141408] = 00000060000000ff, %f18 = 1c0000c8 ffce3083
	ldda	[%i5+%o4]0x88,%f18	! %f18 = 00000060 000000ff
!	Mem[0000000010101418] = ff9239f8, %l1 = 000000008330ceff
	ldswa	[%i4+0x018]%asi,%l1	! %l1 = ffffffffff9239f8
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = a50000ff, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000a50000ff

p0_label_170:
	membar	#Sync			! Added by membar checker (23)
!	%l0 = 000000ff, %l1 = ff9239f8, Mem[0000000010101408] = 00000000 ef082f21
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff ff9239f8
!	%f26 = 80786cff 4bdf8cff, %l6 = 000000000ac018be
!	Mem[0000000010141420] = ff95557c57fff000
	add	%i5,0x020,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_P ! Mem[0000000010141420] = 80956cff4bdf8c00
!	%l7 = 00000000a50000ff, Mem[0000000010001420] = 13c67b82
	stb	%l7,[%i0+0x020]		! Mem[0000000010001420] = ffc67b82
!	%l1 = ffffffffff9239f8, Mem[0000000030101400] = ff969edc
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = ff9639f8
!	%f6  = f0000000, Mem[0000000010081408] = f83992ff
	sta	%f6 ,[%i2+%o4]0x88	! Mem[0000000010081408] = f0000000
!	%l0 = 000000ff, %l1 = ff9239f8, Mem[0000000030141410] = ffffffff 000000d9
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff ff9239f8
!	Mem[00000000100c1400] = 95f1bbff, %l4 = 00000000404d1b27
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = ff9239f8, Mem[0000000010081400] = ff150000 00000000
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff ff9239f8
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000030041400] = 8837feff 00000060
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffb1bc43ffff8cff, %f0  = dc9e00ff 13c67b82
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = ffb1bc43 ffff8cff

p0_label_171:
!	Mem[00000000300c1408] = 212f08ef, %l7 = 00000000a50000ff
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000021
!	Mem[0000000010141400] = ff000000, %l2 = ffffffffffffffff
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 0354dc6267df74f0, %f14 = 00000000 ffff0000
	ldda	[%i0+%g0]0x89,%f14	! %f14 = 0354dc62 67df74f0
!	Mem[000000001014142c] = ef082ea8, %l5 = ffffffffffffffff
	ldswa	[%i5+0x02c]%asi,%l5	! %l5 = ffffffffef082ea8
!	Mem[0000000030081408] = ff92ffff, %l0 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = e3ffffff ffffffff, %l0 = ffffffff, %l1 = ff9239f8
	ldd	[%i0+%g0],%l0		! %l0 = 00000000e3ffffff 00000000ffffffff
!	Mem[00000000300c1408] = 1c0000c8 ef082f21, %l0 = e3ffffff, %l1 = ffffffff
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000ef082f21 000000001c0000c8
!	Mem[00000000211c0000] = 92ffd61d, %l7 = 0000000000000021
	ldub	[%o2+%g0],%l7		! %l7 = 0000000000000092
!	Mem[00000000100c1428] = 000000004bdf8c9a, %f30 = 619cf550 f8399261
	ldda	[%i3+0x028]%asi,%f30	! %f30 = 00000000 4bdf8c9a
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 67df74f0, %l3 = ffffffffffffbfff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000067000000ff

p0_label_172:
!	%l6 = 000000000ac018be, Mem[0000000020800040] = 212f2222, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 18be2222
!	Mem[0000000030141410] = ff000000, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181410] = 000000ff, %l7 = 0000000000000092
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%f24 = 00000000 f074df67, %l4 = 00000000000000ff
!	Mem[0000000010041408] = 7e84f550ff0000ff
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010041408] = 00000000f074df67
!	%f12 = 71ff699a ff613b1b, %l4 = 00000000000000ff
!	Mem[0000000010041438] = dd013e6a15176a9c
	add	%i1,0x038,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041438] = 1b3b61ff9a69ff71
!	%l5 = ffffffffef082ea8, Mem[0000000010081408] = f0000000
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = ef082ea8
!	%l5 = ffffffffef082ea8, Mem[0000000030041410] = ff4551ff
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ff4551a8
!	%l6 = 0ac018be, %l7 = 000000ff, Mem[0000000010041408] = 00000000 67df74f0
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0ac018be 000000ff
!	%l6 = 000000000ac018be, Mem[000000001008140c] = 5a6f0000
	stw	%l6,[%i2+0x00c]		! Mem[000000001008140c] = 0ac018be
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %l0 = 00000000ef082f21
	ldsha	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffff00

p0_label_173:
!	Mem[0000000010001410] = fa088000, %f22 = 619239f8
	ld	[%i0+%o5],%f22	! %f22 = fa088000
!	Mem[00000000201c0000] = 00dd075f, %l3 = 0000000000000067
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000dd
!	Mem[00000000218000c0] = ff110164, %l5 = ffffffffef082ea8
	ldub	[%o3+0x0c0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 6f0ac808 ff9639f8, %l2 = ff000000, %l3 = 000000dd
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff9639f8 000000006f0ac808
!	Mem[0000000010001408] = 5a9ff8c957b30000, %l1 = 000000001c0000c8
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 5a9ff8c957b30000
!	Mem[0000000030101408] = 76aee64a, %l7 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 0000000076aee64a
!	Mem[0000000030181410] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 00000000ff9639f8
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l1 = 5a9ff8c957b30000
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff000000, %l6 = 000000000ac018be
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_174:
!	%f30 = 00000000 4bdf8c9a, %l0 = ffffffffffffff00
!	Mem[0000000030181400] = ff9cf550ff0000ff
	stda	%f30,[%i6+%l0]ASI_PST32_S ! Mem[0000000030181400] = ff9cf550ff0000ff
!	Mem[0000000030101400] = ff9639f8, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000f8000000ff
!	Mem[00000000100c1400] = ffbbf195, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffbbf195
!	%l2 = ffbbf195, %l3 = 6f0ac808, Mem[0000000030181408] = ffbf7869 62dc5403
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffbbf195 6f0ac808
!	%f8  = 76000000, Mem[0000000030001408] = ff92ffff
	sta	%f8 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 76000000
!	%l4 = 00000000000000ff, Mem[0000000030001410] = 000000ff
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%l2 = 00000000ffbbf195, Mem[0000000010081408] = a82e08ef0ac018be
	stxa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000ffbbf195
!	Code Fragment 3
p0_fragment_14:
!	%l0 = ffffffffffffff00
	setx	0x5a0a2f579583f39c,%g7,%l0 ! %l0 = 5a0a2f579583f39c
!	%l1 = 0000000000000000
	setx	0xea6b595838cca5f4,%g7,%l1 ! %l1 = ea6b595838cca5f4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5a0a2f579583f39c
	setx	0x01e23677ed37de9f,%g7,%l0 ! %l0 = 01e23677ed37de9f
!	%l1 = ea6b595838cca5f4
	setx	0x9a6f072874b74b89,%g7,%l1 ! %l1 = 9a6f072874b74b89
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 01e23677ed37de9f
	setx	0x3db6a31fa867225a,%g7,%l0 ! %l0 = 3db6a31fa867225a
!	%l1 = 9a6f072874b74b89
	setx	0xeea262ffbbe819e4,%g7,%l1 ! %l1 = eea262ffbbe819e4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3db6a31fa867225a
	setx	0xf03808f81223e570,%g7,%l0 ! %l0 = f03808f81223e570
!	%l1 = eea262ffbbe819e4
	setx	0xa1667757c7edffa1,%g7,%l1 ! %l1 = a1667757c7edffa1
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff4551a8, %l0 = f03808f81223e570
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff4551a8

p0_label_175:
!	Mem[0000000010181400] = 9a8cdf4b, %l2 = 00000000ffbbf195
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000009a8c
!	Mem[0000000010101400] = 827bc613ff009edc, %l3 = 000000006f0ac808
	ldx	[%i4+%g0],%l3		! %l3 = 827bc613ff009edc
!	%l5 = 0000000000000000, %l7 = 0000000076aee64a, %l6 = 00000000000000f8
	add	%l5,%l7,%l6		! %l6 = 0000000076aee64a
!	%l4 = 00000000000000ff, immd = 0000000000000fad, %l4 = 00000000000000ff
	udivx	%l4,0xfad,%l4		! %l4 = 0000000000000000
!	Mem[0000000030001400] = 67df74f0, %f29 = 50f59cff
	lda	[%i0+%g0]0x89,%f29	! %f29 = 67df74f0
!	Mem[0000000010181410] = 00000092c800001c, %l6 = 0000000076aee64a
	ldxa	[%i6+0x010]%asi,%l6	! %l6 = 00000092c800001c
!	Mem[0000000010041420] = c9f89f5a 4bdf8c9a, %l2 = 00009a8c, %l3 = ff009edc
	ldda	[%i1+0x020]%asi,%l2	! %l2 = 00000000c9f89f5a 000000004bdf8c9a
!	Mem[0000000030041408] = ff00000000000000, %l6 = 00000092c800001c
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = ff00000000000000
!	Mem[0000000010181400] = 4bdf8c9a, %f5  = 13c67bff
	lda	[%i6+%g0]0x88,%f5 	! %f5 = 4bdf8c9a
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_176:
!	Mem[0000000030041408] = 00000000, %l6 = ff00000000000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f26 = 80786cff, Mem[00000000300c1400] = 00000000
	sta	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 80786cff
!	Mem[0000000030001400] = 67df74f0, %l3 = 000000004bdf8c9a
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000067df74f0
!	Mem[0000000010041414] = b216c07e, %l5 = 0000000000000000
	ldstuba	[%i1+0x014]%asi,%l5	! %l5 = 000000b2000000ff
!	Mem[0000000030101400] = ff9639ff, %l1 = a1667757c7edffa1
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%f24 = 00000000 f074df67, Mem[0000000030001410] = 000000ff 00000000
	stda	%f24,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 f074df67
!	Mem[0000000030001410] = 67df74f0, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000067000000ff
!	%l7 = 0000000076aee64a, Mem[0000000030181408] = 95f1bbff
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 95f1bb4a
!	%f2  = 212f08ef, Mem[0000000010101408] = 000000ff
	sta	%f2 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 212f08ef
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffdf74f0ff16c07e, %f24 = 00000000 f074df67
	ldda	[%i1+%o5]0x80,%f24	! %f24 = ffdf74f0 ff16c07e

p0_label_177:
!	Mem[0000000030081410] = 7ec016b2, %l1 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000007ec0
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 0ac018be, %l1 = 0000000000007ec0
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 00000000000018be
!	%f16 = fff9c610, %f11 = 3c9dbf0a, %f6  = f0000000
	fdivs	%f16,%f11,%f6 		! %f6  = fff9c610
!	Mem[0000000030081408] = ff9cf550 ffff92ff, %l4 = 00000067, %l5 = 000000b2
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000ffff92ff 00000000ff9cf550
!	%l6 = 00000000, %l7 = 76aee64a, Mem[0000000030081410] = b216c07e ca6b7305
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 76aee64a
!	Mem[0000000010001410] = 008008fa, %l4 = 00000000ffff92ff
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000fa
!	Mem[00000000300c1410] = 6f5a00009cffffff, %l3 = 0000000067df74f0
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = 6f5a00009cffffff
!	Mem[0000000030181400] = ff9cf550, %l5 = 00000000ff9cf550
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = 212f08ef ff0000a5, Mem[0000000030181408] = 95f1bb4a 08c80a6f
	stda	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 212f08ef ff0000a5

p0_label_178:
!	Mem[0000000030001410] = f074dfff, %l0 = 00000000ff4551a8
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000f074dfff
!	Mem[00000000100c1410] = fff9c610, %l1 = 00000000000018be
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000fff9c610
!	%l0 = 00000000f074dfff, Mem[000000001018140f] = 89518c9a, %asi = 80
	stba	%l0,[%i6+0x00f]%asi	! Mem[000000001018140c] = 89518cff
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000fa
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f16 = fff9c610 60000000 00000060 000000ff
!	%f20 = 8330ceff c800001c fa088000 ff00ffff
!	%f24 = ffdf74f0 ff16c07e 80786cff 4bdf8cff
!	%f28 = ff0000ff 67df74f0 00000000 4bdf8c9a
	stda	%f16,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%f12 = 71ff699a ff613b1b, %l0 = 00000000f074dfff
!	Mem[0000000030081420] = 9a8cdf4b5a9ff8c9
	add	%i2,0x020,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_S ! Mem[0000000030081420] = 71ff699aff613b1b
!	%l6 = 00000000, %l7 = 76aee64a, Mem[00000000300c1400] = ff6c7880 08c80a6f
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 76aee64a
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030141410] = ff0000ff ff9239f8
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 ffffffff
!	%l4 = 0000000000000000, Mem[0000000010141400] = 0000006000000000
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = be180000, %l7 = 0000000076aee64a
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000be180000

p0_label_179:
!	Mem[0000000030101400] = ff9639ff, %l7 = 00000000be180000
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 00000000000039ff
!	Mem[0000000030001410] = 00000000 ff4551a8, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000ff4551a8 0000000000000000
!	Mem[0000000010001400] = ffffffe3, %l2 = 00000000c9f89f5a
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffffe3
!	Mem[00000000300c1408] = ef082f21, %l6 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000021
!	Mem[0000000010141430] = 80786cff, %l6 = 0000000000000021
	lduh	[%i5+0x032],%l6		! %l6 = 0000000000006cff
!	Mem[0000000030041400] = ff000000, %l7 = 00000000000039ff
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 76000000, %l0 = 00000000f074dfff
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = e3ffffff, %l4 = 00000000ff4551a8
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffe3ffffff
!	Mem[00000000201c0000] = 00dd075f, %l1 = 00000000fff9c610
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 9c6a1715 3c9dbf0a, Mem[0000000010001400] = e3ffffff ffffffff
	stda	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 9c6a1715 3c9dbf0a

p0_label_180:
!	%f2  = 212f08ef ff0000a5, Mem[00000000300c1410] = ffffff9c 00005a6f
	stda	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 212f08ef ff0000a5
!	%f0  = ffb1bc43 ffff8cff 212f08ef ff0000a5
!	%f4  = ab551fb8 4bdf8c9a fff9c610 f83992ff
!	%f8  = 76000000 ffff0000 9c6a1715 3c9dbf0a
!	%f12 = 71ff699a ff613b1b 0354dc62 67df74f0
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	Mem[0000000030001408] = 76000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = ffffffe3, %l3 = 9cffffff, Mem[00000000100c1410] = be180000 00000060
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffe3 9cffffff
!	%l4 = ffffffffe3ffffff, Mem[0000000030001408] = ff00007611fb7f67
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffffe3ffffff
!	Mem[0000000010141408] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141434] = 4bdf8cff, %l6 = 0000000000006cff
	swap	[%i5+0x034],%l6		! %l6 = 000000004bdf8cff
!	Mem[0000000010041400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081400] = ff000000
	stba	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	Starting 10 instruction Load Burst
!	%f16 = fff9c610, %f31 = 4bdf8c9a, %f28 = ff0000ff
	fadds	%f16,%f31,%f28		! %f28 = fff9c610

p0_label_181:
!	Mem[0000000010141400] = 00000000, %l4 = ffffffffe3ffffff
	ldsh	[%i5+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000021800100] = b7ff6d5f, %l4 = 0000000000000000
	ldsh	[%o3+0x100],%l4		! %l4 = ffffffffffffb7ff
!	Mem[0000000010141400] = 00000000, %l3 = 6f5a00009cffffff
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141418] = 00003e6a 47e5d6af, %l6 = 4bdf8cff, %l7 = 00000000
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 0000000000003e6a 0000000047e5d6af
!	Mem[0000000010141418] = 00003e6a47e5d6af, %l2 = ffffffffffffffe3
	ldx	[%i5+0x018],%l2		! %l2 = 00003e6a47e5d6af
!	Mem[0000000010041400] = ff000000, %l2 = 00003e6a47e5d6af
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00dd075f, %l6 = 0000000000003e6a
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000dd
!	Mem[0000000030001400] = 9a8cdf4b, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffff9a8c
!	Mem[0000000010041400] = 000000ff, %l7 = 0000000047e5d6af
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 4bdf8c9a, %l6 = 00000000000000dd
!	Mem[00000000300c1400] = ffb1bc43ffff8cff
	stda	%f30,[%i3+%l6]ASI_PST32_SL ! Mem[00000000300c1400] = 9a8cdf4bffff8cff

p0_label_182:
!	%l7 = 00000000000000ff, Mem[0000000010041400] = ff000000
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000ff
!	%l1 = 00000000000000ff, Mem[0000000010101410] = 13c67bff
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 13c67bff
!	%f22 = fa088000, Mem[0000000030001410] = ff4551a8
	sta	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = fa088000
!	%f26 = 80786cff 4bdf8cff, Mem[0000000030181400] = 50f59cff ff0000ff
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 80786cff 4bdf8cff
!	%f21 = c800001c, Mem[0000000010101400] = 827bc613
	sta	%f21,[%i4+%g0]0x80	! Mem[0000000010101400] = c800001c
!	Mem[0000000030181400] = 4bdf8cff, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 000000004bdf8cff
!	%f16 = fff9c610 60000000, Mem[0000000010041408] = 0ac018be 000000ff
	stda	%f16,[%i1+%o4]0x88	! Mem[0000000010041408] = fff9c610 60000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010181400] = fff9c610, %l4 = ffffffffffffb7ff
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000fff9c610
!	%l3 = 0000000000000000, Mem[0000000010181410] = 1c0000c8ffce3083
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %f19 = 000000ff
	lda	[%i2+%g0]0x88,%f19	! %f19 = ff000000

p0_label_183:
!	Mem[0000000010181410] = 00000000, %l0 = 000000004bdf8cff
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 008008fa 00000000, %l6 = 000000dd, %l7 = 000000ff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000008008fa 0000000000000000
!	Mem[00000000100c1410] = 9cffffffffffffe3, %f12 = 71ff699a ff613b1b
	ldda	[%i3+%o5]0x88,%f12	! %f12 = 9cffffff ffffffe3
!	Mem[0000000030101400] = ff3996ff08c80a6f, %f18 = 00000060 ff000000
	ldda	[%i4+%g0]0x81,%f18	! %f18 = ff3996ff 08c80a6f
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0xffd5f6a8752724f8,%g7,%l0 ! %l0 = ffd5f6a8752724f8
!	%l1 = 00000000000000ff
	setx	0x874322c80e1ff904,%g7,%l1 ! %l1 = 874322c80e1ff904
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ffd5f6a8752724f8
	setx	0x6e7705c803fd699e,%g7,%l0 ! %l0 = 6e7705c803fd699e
!	%l1 = 874322c80e1ff904
	setx	0x442a5a1fa511116d,%g7,%l1 ! %l1 = 442a5a1fa511116d
!	Mem[0000000030101410] = f83992ff, %f18 = ff3996ff
	lda	[%i4+%o5]0x89,%f18	! %f18 = f83992ff
!	Mem[0000000010101400] = c800001c, %l5 = ffffffffffff9a8c
	lduha	[%i4+%g0]0x80,%l5	! %l5 = 000000000000c800
!	Mem[0000000010101408] = 212f08ef, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000021
!	Mem[0000000010081420] = ff455167 f074ff67, %l2 = 00000000, %l3 = 00000021
	ldd	[%i2+0x020],%l2		! %l2 = 00000000ff455167 00000000f074ff67
!	Starting 10 instruction Store Burst
!	%f17 = 60000000, Mem[00000000300c1400] = 9a8cdf4b
	sta	%f17,[%i3+%g0]0x81	! Mem[00000000300c1400] = 60000000

p0_label_184:
!	%f14 = 0354dc62, Mem[0000000010141408] = ff000000
	sta	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 0354dc62
!	Mem[0000000010141410] = 43bcb1ff, %l6 = 00000000008008fa
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 0000000043bcb1ff
!	%l2 = 00000000ff455167, Mem[0000000010041400] = ff0000ff
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ff455167
!	%f0  = ffb1bc43 ffff8cff, Mem[0000000010001408] = 0000b357 c9f89f5a
	std	%f0 ,[%i0+%o4]	! Mem[0000000010001408] = ffb1bc43 ffff8cff
!	%f29 = 67df74f0, Mem[000000001004141c] = 67df74f0
	sta	%f29,[%i1+0x01c]%asi	! Mem[000000001004141c] = 67df74f0
!	%l1 = 442a5a1fa511116d, Mem[00000000100c1408] = 619cf550f8399261
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 442a5a1fa511116d
!	%l3 = 00000000f074ff67, %l3 = 00000000f074ff67, %l5 = 000000000000c800
	and	%l3,%l3,%l5		! %l5 = 00000000f074ff67
!	Mem[00000000300c1408] = 212f08ef, %l4 = 00000000fff9c610
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000212f08ef
!	Mem[0000000010181434] = 67df74f0, %l6 = 0000000043bcb1ff
	swap	[%i6+0x034],%l6		! %l6 = 0000000067df74f0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = ff455167, %l4 = 00000000212f08ef
	ldsw	[%i2+0x028],%l4		! %l4 = ffffffffff455167

p0_label_185:
!	%l5 = 00000000f074ff67, Mem[0000000010081408] = 00000000
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000067
!	Mem[0000000030101400] = ff3996ff, %l6 = 0000000067df74f0
	ldswa	[%i4+%g0]0x81,%l6	! %l6 = ffffffffff3996ff
!	Mem[0000000030181410] = 00000000, %l0 = 6e7705c803fd699e
	lduha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000f074ff67, %l3 = 00000000f074ff67, %l5 = 00000000f074ff67
	andn	%l3,%l3,%l5		! %l5 = 0000000000000000
!	Mem[0000000010081414] = 4ae6ae76, %l7 = 0000000000000000
	lduwa	[%i2+0x014]%asi,%l7	! %l7 = 000000004ae6ae76
!	Mem[0000000010101400] = 1c0000c8, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000c8
!	Mem[0000000010141408] = 0354dc62, %l2 = 00000000ff455167
	ldswa	[%i5+%o4]0x80,%l2	! %l2 = 000000000354dc62
!	Mem[0000000030081410] = 000000004ae6ae76, %l4 = ffffffffff455167
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = 000000004ae6ae76
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_186:
!	%l3 = 00000000f074ff67, Mem[0000000030001408] = ffffffe3ffffffff
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000f074ff67
!	%f2  = 212f08ef ff0000a5, Mem[0000000030081410] = 00000000 4ae6ae76
	stda	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 212f08ef ff0000a5
!	%f16 = fff9c610, Mem[0000000030101400] = ff9639ff
	sta	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = fff9c610
!	%l2 = 000000000354dc62, %l4 = 000000004ae6ae76, %l6 = ffffffffff3996ff
	and	%l2,%l4,%l6		! %l6 = 0000000002448c62
!	Mem[0000000010181408] = 00000060, %l1 = 442a5a1fa511116d
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x3f1e1eb0368521e9,%g7,%l0 ! %l0 = 3f1e1eb0368521e9
!	%l1 = 0000000000000000
	setx	0xe332e65810da6c7d,%g7,%l1 ! %l1 = e332e65810da6c7d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f1e1eb0368521e9
	setx	0x7ff3800f93683f75,%g7,%l0 ! %l0 = 7ff3800f93683f75
!	%l1 = e332e65810da6c7d
	setx	0x9c1d9d6040567f7b,%g7,%l1 ! %l1 = 9c1d9d6040567f7b
!	%l0 = 7ff3800f93683f75, Mem[0000000021800140] = ffdb0a30, %asi = 80
	stha	%l0,[%o3+0x140]%asi	! Mem[0000000021800140] = 3f750a30
!	Mem[0000000010001408] = 43bcb1ff, %l5 = 00000000000000c8
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081408] = 67000000, %l7 = 000000004ae6ae76
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000067000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff8cffff00000060, %l6 = 0000000002448c62
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = ff8cffff00000060

p0_label_187:
!	Mem[00000000201c0000] = 00dd075f, %l7 = 0000000067000000
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffdd
!	Mem[0000000030041400] = ffffffff 000000ff, %l4 = 4ae6ae76, %l5 = 000000ff
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010101410] = 13c67bff, %l0 = 7ff3800f93683f75
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = fff9c610, %l5 = 00000000ffffffff
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffc610
!	Mem[0000000010081408] = 76aee64a, %l0 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = 0000000076aee64a
!	%l7 = ffffffffffffffdd, %l4 = 0000000000000000, %l7 = ffffffffffffffdd
	orn	%l7,%l4,%l7		! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 6d1111a5, %l5 = ffffffffffffc610
	ldsba	[%i3+%o4]0x80,%l5	! %l5 = 000000000000006d
!	Mem[0000000010081438] = 6f0ac808 90ee7d79, %l4 = 00000000, %l5 = 0000006d
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 000000006f0ac808 0000000090ee7d79
!	Starting 10 instruction Store Burst
!	%f8  = 76000000 ffff0000, %l5 = 0000000090ee7d79
!	Mem[0000000010141428] = 7b88b2bfef082ea8
	add	%i5,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141428] = 0088b2ff000000a8

p0_label_188:
!	%l0 = 0000000076aee64a, Mem[0000000010101410] = ab551fb813c67bff
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000076aee64a
!	%l7 = ffffffffffffffff, Mem[0000000020800040] = 18be2222
	sth	%l7,[%o1+0x040]		! Mem[0000000020800040] = ffff2222
!	Mem[0000000010101410] = 4ae6ae76, %l0 = 0000000076aee64a
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 0000004a000000ff
!	%l6 = 00000060, %l7 = ffffffff, Mem[0000000030141400] = 0000009a 0354dc62
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000060 ffffffff
!	%l2 = 0354dc62, %l3 = f074ff67, Mem[0000000010081410] = ab551fb8 4ae6ae76
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0354dc62 f074ff67
!	%l4 = 000000006f0ac808, Mem[0000000030001400] = 9a8cdf4b
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 6f0ac808
!	Mem[0000000030101410] = ff9239f8, %l7 = ffffffffffffffff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff9239f8
!	Mem[00000000100c1410] = e3ffffff, %l4 = 000000006f0ac808
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000e3ffffff
!	%l6 = ff8cffff00000060, Mem[0000000010081410] = 0354dc62
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0060dc62
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0060dc62, %l0 = 000000000000004a
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = 000000000060dc62

p0_label_189:
!	Mem[0000000010001414] = 57ff8be3, %l1 = 9c1d9d6040567f7b
	ldswa	[%i0+0x014]%asi,%l1	! %l1 = 0000000057ff8be3
!	Mem[0000000010041418] = 00000000, %l2 = 000000000354dc62
	ldsh	[%i1+0x01a],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041400] = 675145ff, %l6 = ff8cffff00000060
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000067
!	Mem[0000000030141400] = 00000060, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000060
!	Mem[0000000030141408] = 0000000000000000, %l2 = 0000000000000060
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 4ae6ae76, %l4 = 00000000e3ffffff
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 000000000000ae76
!	Mem[0000000030041410] = ffffffff ff4551a8, %l0 = 0060dc62, %l1 = 57ff8be3
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff4551a8 00000000ffffffff
!	Mem[000000001014143c] = 000000ff, %l3 = 00000000f074ff67
	lduba	[%i5+0x03c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141438] = 0000ffff000000ff, %f10 = 9c6a1715 3c9dbf0a
	ldd	[%i5+0x038],%f10	! %f10 = 0000ffff 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff4551a8, Mem[0000000010081410] = 0060dc62
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = a860dc62

p0_label_190:
!	%l4 = 000000000000ae76, Mem[000000001014143e] = 000000ff, %asi = 80
	stba	%l4,[%i5+0x03e]%asi	! Mem[000000001014143c] = 000076ff
!	%l7 = 00000000ff9239f8, Mem[0000000010101408] = ef082f21
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ef0839f8
!	%f14 = 0354dc62 67df74f0, %l0 = 00000000ff4551a8
!	Mem[0000000030101418] = 619239f8ff00ffff
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030101418] = 61923967ffdcff03
!	%f14 = 0354dc62 67df74f0, %l1 = 00000000ffffffff
!	Mem[0000000010001430] = 0000ff83911b81ff
	add	%i0,0x030,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_P ! Mem[0000000010001430] = 0354dc6267df74f0
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 000000fa
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000fa
!	%f12 = 9cffffff ffffffe3, %l3 = 0000000000000000
!	Mem[0000000030001400] = 6f0ac80862dc5403
	stda	%f12,[%i0+%l3]ASI_PST8_S ! Mem[0000000030001400] = 6f0ac80862dc5403
!	%l4 = 0000ae76, %l5 = 90ee7d79, Mem[00000000300c1400] = 60000000 ffff8cff
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ae76 90ee7d79
!	%l5 = 0000000090ee7d79, Mem[00000000211c0000] = 92ffd61d
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 7d79d61d
!	%l0 = 00000000ff4551a8, Mem[000000001008141e] = 00ff000d
	sth	%l0,[%i2+0x01e]		! Mem[000000001008141c] = 00ff51a8
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = fa088000, %l0 = 00000000ff4551a8
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000fa

p0_label_191:
!	Mem[00000000300c1410] = 9a8cdf4b b81f55ab, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000b81f55ab 000000009a8cdf4b
!	Mem[0000000010081408] = 76aee64a, %l3 = 000000009a8cdf4b
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 000000000000004a
!	Mem[00000000100c1430] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i3+0x032]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 9c6a1715, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 000000009c6a1715
!	Mem[00000000100c1400] = 000000fa, %l7 = 00000000ff9239f8
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181418] = fa088000 ff00ffff, %l2 = b81f55ab, %l3 = 0000004a
	ldda	[%i6+0x018]%asi,%l2	! %l2 = 00000000fa088000 00000000ff00ffff
!	%f31 = 4bdf8c9a, %f20 = 8330ceff, %f20 = 8330ceff c800001c
	fsmuld	%f31,%f20,%f20		! %f20 = b9f34cad 761f2cc0
!	Mem[0000000010041400] = 677ffb11ff455167, %f12 = 9cffffff ffffffe3
	ldda	[%i1+%g0]0x88,%f12	! %f12 = 677ffb11 ff455167
!	%f30 = 00000000, %f17 = 60000000, %f23 = ff00ffff
	fsubs	%f30,%f17,%f23		! %f23 = e0000000
!	Starting 10 instruction Store Burst
!	%f0  = ffb1bc43 ffff8cff, Mem[0000000010041428] = dc9e96ff 08c80a6f
	std	%f0 ,[%i1+0x028]	! Mem[0000000010041428] = ffb1bc43 ffff8cff

p0_label_192:
!	Mem[0000000010101410] = 76aee6ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141410] = 008008fa, %l1 = 000000009c6a1715
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 00000000008008fa
!	%l7 = 00000000000000ff, Mem[0000000010141428] = 0088b2ff000000a8, %asi = 80
	stxa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000000000ff
!	Mem[0000000010141408] = 0354dc62, %l6 = 0000000000000067
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 000000000354dc62
!	Mem[0000000010041418] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i1+0x018]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000fa, Mem[000000001014143c] = 000076ff, %asi = 80
	stba	%l0,[%i5+0x03c]%asi	! Mem[000000001014143c] = fa0076ff
!	Mem[0000000010081414] = f074ff67, %l5 = 0000000090ee7d79
	ldstub	[%i2+0x014],%l5		! %l5 = 000000f0000000ff
!	%f24 = ffdf74f0 ff16c07e, %l5 = 00000000000000f0
!	Mem[0000000030181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010101430] = 1b3b61ff, %l4 = 000000000000ae76
	ldstub	[%i4+0x030],%l4		! %l4 = 0000001b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000, %l6 = 000000000354dc62
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_193:
!	Mem[0000000010001410] = fa088000, %l4 = 000000000000001b
	ldsha	[%i0+0x012]%asi,%l4	! %l4 = ffffffffffff8000
!	Mem[0000000030081408] = ffff92ff, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffff92ff
!	Mem[0000000010081408] = 4ae6ae76, %l6 = ffffffffffffffff
	lduha	[%i2+0x008]%asi,%l6	! %l6 = 0000000000004ae6
!	Mem[0000000010041400] = ff455167, %l1 = 00000000008008fa
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 00000000ff455167
!	Mem[0000000010001400] = 15176a9c, %l4 = ffffffffffff8000
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 0000000015176a9c
!	Mem[0000000030081408] = ff92ffff50f59cff, %f4  = ab551fb8 4bdf8c9a
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = ff92ffff 50f59cff
!	%f22 = fa088000, %f12 = 677ffb11
	fcmps	%fcc2,%f22,%f12		! %fcc2 = 1
!	Mem[0000000010081410] = a860dc62ff74ff67, %l3 = 00000000ff00ffff
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = a860dc62ff74ff67
!	Mem[0000000010101410] = ffe6ae76, %l0 = 00000000000000fa
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = ffff92ff, %l6 = 0000000000004ae6
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 00000000ffff92ff

p0_label_194:
!	Mem[0000000010041408] = 00000060, %l5 = 00000000000000f0
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010141410] = ff8cffff9c6a1715
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffffffffffff
!	%l0 = ffffffffffffffff, %l4 = 0000000015176a9c, %l4 = 0000000015176a9c
	add	%l0,%l4,%l4		! %l4 = 0000000015176a9b
!	%f0  = ffb1bc43 ffff8cff 212f08ef ff0000a5
!	%f4  = ff92ffff 50f59cff fff9c610 f83992ff
!	%f8  = 76000000 ffff0000 0000ffff 000000ff
!	%f12 = 677ffb11 ff455167 0354dc62 67df74f0
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%l0 = ffffffffffffffff, Mem[00000000100c1410] = 6f0ac808
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffc808
!	Mem[0000000010041410] = ffdf74f0, %l7 = ffffffffffff92ff
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l3 = a860dc62ff74ff67, Mem[0000000030181400] = 00000000ff6c7880
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = a860dc62ff74ff67
!	Mem[0000000030101400] = fff9c610, %l0 = ffffffffffffffff
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000fff9c610
!	%l4 = 15176a9b, %l5 = 00000000, Mem[0000000030041408] = 000000ff ff000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 15176a9b 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = f83992ff ef0839f8, %l6 = ffff92ff, %l7 = 000000ff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000ef0839f8 00000000f83992ff

p0_label_195:
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010141400] = 00000000, %l7 = 00000000f83992ff
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00dd075f, %l2 = 00000000fa088000
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000dd
!	Mem[0000000030181408] = a50000ff ef082f21, %l4 = 15176a9b, %l5 = 00000000
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000a50000ff 00000000ef082f21
!	Mem[00000000100c1410] = 08c8ffff, %f30 = 00000000
	lda	[%i3+%o5]0x88,%f30	! %f30 = 08c8ffff
!	Mem[0000000030041410] = ffffffffff4551a8, %l5 = 00000000ef082f21
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = ffffffffff4551a8
!	Mem[0000000010041434] = 404d1b27, %l5 = ffffffffff4551a8
	lduw	[%i1+0x034],%l5		! %l5 = 00000000404d1b27
!	Mem[0000000010141410] = ffffffffffffffff, %f20 = b9f34cad 761f2cc0
	ldda	[%i5+%o5]0x88,%f20	! %f20 = ffffffff ffffffff
!	Mem[0000000010001400] = 9c6a17153c9dbf0a, %f30 = 08c8ffff 4bdf8c9a
	ldda	[%i0+%g0]0x80,%f30	! %f30 = 9c6a1715 3c9dbf0a
!	Mem[0000000010081410] = 67ff74ff62dc60a8, %f22 = fa088000 e0000000
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 67ff74ff 62dc60a8
!	Starting 10 instruction Store Burst
!	Mem[000000001018140a] = ff000060, %l1 = 00000000ff455167
	ldstuba	[%i6+0x00a]%asi,%l1	! %l1 = 00000000000000ff

p0_label_196:
!	%l6 = ef0839f8, %l7 = 00000000, Mem[00000000300c1410] = ab551fb8 4bdf8c9a
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ef0839f8 00000000
!	%f26 = 80786cff 4bdf8cff, Mem[0000000010081428] = ff455167 f0ffdf67
	stda	%f26,[%i2+0x028]%asi	! Mem[0000000010081428] = 80786cff 4bdf8cff
!	%l3 = a860dc62ff74ff67, Mem[0000000030181400] = a860dc62
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ff67dc62
!	%l5 = 00000000404d1b27, %l7 = 0000000000000000, %y  = 0352fc41
	umul	%l5,%l7,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%l5 = 00000000404d1b27, imm = fffffffffffff010, %l2 = 00000000000000dd
	andn	%l5,-0xff0,%l2		! %l2 = 0000000000000b27
!	%f4  = ff92ffff 50f59cff, %l0 = 00000000fff9c610
!	Mem[0000000030141418] = fff9c610f83992ff
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_S ! Mem[0000000030141418] = fff9c610f83992ff
!	%l2 = 0000000000000b27, %l6 = 00000000ef0839f8, %y  = 00000000
	udiv	%l2,%l6,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = fff9c610
!	%l3 = a860dc62ff74ff67, Mem[0000000030141410] = ffff92ff
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ff74ff67
!	Mem[0000000010101413] = ffe6ae76, %l6 = 00000000ef0839f8
	ldstuba	[%i4+0x013]%asi,%l6	! %l6 = 00000076000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ef0839f8, %l6 = 0000000000000076
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ef

p0_label_197:
!	Mem[0000000010081410] = 62dc60a8, %l2 = 0000000000000b27
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 0000000062dc60a8
!	Mem[0000000010081428] = 80786cff4bdf8cff, %l0 = 00000000fff9c610
	ldx	[%i2+0x028],%l0		! %l0 = 80786cff4bdf8cff
!	Mem[0000000020800000] = ff95b0a2, %l2 = 0000000062dc60a8
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000ff95
!	%l5 = 00000000404d1b27, imm = 0000000000000342, %l3 = a860dc62ff74ff67
	andn	%l5,0x342,%l3		! %l3 = 00000000404d1825
!	Mem[0000000021800180] = b3572d80, %l0 = 80786cff4bdf8cff
	ldsh	[%o3+0x180],%l0		! %l0 = ffffffffffffb357
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 675145ff, %l4 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000006751
!	Mem[0000000010081400] = 000000ff, %l6 = 00000000000000ef
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 00004ae6, %l5 = 00000000404d1b27
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000004ae6
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030001410] = fa088000
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = fa080000

p0_label_198:
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 00dd075f, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000075f
!	%l0 = ffffffffffffb357, Mem[0000000030141410] = ff74ff67
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffb357
!	%f18 = f83992ff 08c80a6f, Mem[0000000010141430] = 80786cff 00006cff
	std	%f18,[%i5+0x030]	! Mem[0000000010141430] = f83992ff 08c80a6f
!	%l4 = 00006751, %l5 = 00004ae6, Mem[0000000030081410] = ef082f21 a50000ff
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00006751 00004ae6
!	Mem[0000000030081400] = 827b0000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000827b0000
!	%l0 = ffffffffffffb357, Mem[0000000010081410] = a860dc62
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffb357
!	%l0 = ffffffffffffb357, %l7 = 0000000000000000, %l4 = 0000000000006751
	addc	%l0,%l7,%l4		! %l4 = ffffffffffffb357
!	%f14 = 0354dc62 67df74f0, %l3 = 00000000404d1825
!	Mem[0000000030181408] = a50000ffef082f21
	add	%i6,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_S ! Mem[0000000030181408] = a500dc62ef0874f0
!	Mem[0000000020800040] = ffff2222, %l1 = 00000000827b0000
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = b3572d80, %l1 = 00000000000000ff
	ldsb	[%o3+0x181],%l1		! %l1 = 0000000000000057

p0_label_199:
!	Mem[0000000010181410] = 00000000, %l2 = 000000000000ff95
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = ffffb7ff60000000, %f0  = ffb1bc43 ffff8cff
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = ffffb7ff 60000000
!	Mem[000000001014141c] = 47e5d6af, %l3 = 00000000404d1825
	ldub	[%i5+0x01c],%l3		! %l3 = 0000000000000047
!	Mem[0000000010101400] = 1c0000c8, %l4 = ffffffffffffb357
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffc8
!	%l6 = 0000000000000000, imm = 000000000000008d, %l5 = 0000000000004ae6
	xnor	%l6,0x08d,%l5		! %l5 = ffffffffffffff72
!	Mem[0000000030081408] = e64a0000, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffe64a0000
!	Code Fragment 4
p0_fragment_18:
!	%l0 = ffffffffffffb357
	setx	0x7e69c0e02742031a,%g7,%l0 ! %l0 = 7e69c0e02742031a
!	%l1 = 0000000000000057
	setx	0xc645ace86bf67a20,%g7,%l1 ! %l1 = c645ace86bf67a20
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7e69c0e02742031a
	setx	0xa5d8ad17da36ed92,%g7,%l0 ! %l0 = a5d8ad17da36ed92
!	%l1 = c645ace86bf67a20
	setx	0x92a5aad8586c8654,%g7,%l1 ! %l1 = 92a5aad8586c8654
!	Mem[0000000010041410] = ffdf74f0ff16c07e, %l5 = ffffffffffffff72
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = ffdf74f0ff16c07e
!	Mem[00000000218001c0] = 671507db, %l2 = 0000000000000000
	lduh	[%o3+0x1c0],%l2		! %l2 = 0000000000006715
!	Starting 10 instruction Store Burst
!	%f10 = 0000ffff, Mem[0000000010141400] = 00000000
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ffff

p0_label_200:
!	%l2 = 00006715, %l3 = 00000047, Mem[00000000100c1410] = ffffc808 ffffff9c
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00006715 00000047
!	%l4 = ffffffc8, %l5 = ff16c07e, Mem[0000000010001408] = 43bcb1ff ff8cffff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffc8 ff16c07e
!	%f29 = 67df74f0, Mem[0000000010181404] = 60000000
	sta	%f29,[%i6+0x004]%asi	! Mem[0000000010181404] = 67df74f0
!	%l1 = 92a5aad8586c8654, Mem[0000000030041408] = 15176a9b
	stha	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 15178654
!	Mem[0000000010001410] = 008008fa, %l0 = a5d8ad17da36ed92
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 00000000008008fa
!	%f14 = 0354dc62 67df74f0, %l4 = ffffffffffffffc8
!	Mem[0000000010081430] = ffbbf1959e87c233
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081430] = ffbbf1959e87c233
!	Mem[00000000211c0001] = 7d79d61d, %l3 = 0000000000000047
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000079000000ff
!	%f26 = 80786cff 4bdf8cff, Mem[0000000030041410] = a85145ff ffffffff
	stda	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = 80786cff 4bdf8cff
!	%l0 = 00000000008008fa, Mem[0000000010041428] = ffb1bc43ffff8cff
	stx	%l0,[%i1+0x028]		! Mem[0000000010041428] = 00000000008008fa
!	Starting 10 instruction Load Burst
!	Mem[000000001018143c] = 4bdf8c9a, %l0 = 00000000008008fa
	lduwa	[%i6+0x03c]%asi,%l0	! %l0 = 000000004bdf8c9a

p0_label_201:
!	Mem[0000000010001400] = 9c6a17153c9dbf0a, %f24 = ffdf74f0 ff16c07e
	ldda	[%i0+0x000]%asi,%f24	! %f24 = 9c6a1715 3c9dbf0a
!	Mem[0000000010101410] = 00000000ffaee6ff, %l1 = 92a5aad8586c8654
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = 00000000ffaee6ff
!	Mem[0000000010181430] = ff0000ff43bcb1ff, %l0 = 000000004bdf8c9a
	ldx	[%i6+0x030],%l0		! %l0 = ff0000ff43bcb1ff
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000006715
	lduha	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 600000ff, %l5 = ffdf74f0ff16c07e
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000600000ff
!	Mem[0000000030101400] = ffffffff 08c80a6f, %l4 = ffffffc8, %l5 = 600000ff
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ffffffff 0000000008c80a6f
!	Mem[00000000100c1400] = fa000000, %l2 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = fffffffffa000000
!	Mem[0000000030101400] = ffffffff, %l7 = ffffffffe64a0000
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800000] = ff95b0a2, %l1 = 00000000ffaee6ff
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffff95
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 60ff00ff, %l0 = ff0000ff43bcb1ff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 0000000060ff00ff

p0_label_202:
!	Mem[0000000010181433] = ff0000ff, %l4 = 00000000ffffffff
	ldstuba	[%i6+0x033]%asi,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000000079, Mem[0000000010001410] = e38bff57da36ed92
	stxa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000079
!	%f0  = ffffb7ff, Mem[0000000030001408] = 67ff74f0
	sta	%f0 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffb7ff
!	%f28 = fff9c610 67df74f0, %l4 = 00000000000000ff
!	Mem[0000000010141418] = 00003e6a47e5d6af
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141418] = fff9c61067df74f0
!	Mem[0000000010001424] = 0000005a, %l0 = 0000000060ff00ff
	swap	[%i0+0x024],%l0		! %l0 = 000000000000005a
!	Mem[0000000010181400] = ffb7ffff, %l3 = 0000000000000079
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffb7ffff
!	Mem[0000000010001408] = ffffffc8, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000c8000000ff
!	%l0 = 0000005a, %l1 = ffffff95, Mem[00000000300c1410] = f83908ef 00000000
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000005a ffffff95
!	%l7 = 00000000000000ff, Mem[0000000021800000] = 000037ea, %asi = 80
	stba	%l7,[%o3+0x000]%asi	! Mem[0000000021800000] = ff0037ea
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff8cdf4bff6c7880, %l0 = 000000000000005a
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = ff8cdf4bff6c7880

p0_label_203:
!	Mem[0000000010141410] = ffffffffffffffff, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000201c0000] = 0000075f, %l5 = 0000000008c80a6f
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 000000fa, %l4 = 00000000000000c8
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000fa
!	Mem[0000000010081410] = 67ff74ff57b3ffff, %f4  = ff92ffff 50f59cff
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = 67ff74ff 57b3ffff
!	Mem[00000000100c1400] = 000000fa, %l1 = ffffffffffffff95
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001430] = 0354dc62, %l5 = 0000000000000000
	lduba	[%i0+0x033]%asi,%l5	! %l5 = 0000000000000062
!	Mem[00000000300c1408] = fff9c610, %l6 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000fff9
!	Mem[00000000100c1400] = fa000000, %l3 = 00000000ffb7ffff
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l0 = ff8cdf4bff6c7880
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 5a00000095ffffff
	stxa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000

p0_label_204:
!	Mem[0000000030101400] = ffffffff, %l6 = 000000000000fff9
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f30 = 9c6a1715 3c9dbf0a, %l6 = 00000000000000ff
!	Mem[00000000100c1420] = fff8ffff9a499bff
	add	%i3,0x020,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1420] = 9c6a17153c9dbf0a
!	%l5 = 0000000000000062, Mem[0000000010141408] = 00000067
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 62000067
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 000000000000ffff
	setx	0x5fed1ee016cc4793,%g7,%l0 ! %l0 = 5fed1ee016cc4793
!	%l1 = 0000000000000000
	setx	0xafd386b7c407aae2,%g7,%l1 ! %l1 = afd386b7c407aae2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5fed1ee016cc4793
	setx	0x1e697a7800e6a2de,%g7,%l0 ! %l0 = 1e697a7800e6a2de
!	%l1 = afd386b7c407aae2
	setx	0x0f472837a79af3ba,%g7,%l1 ! %l1 = 0f472837a79af3ba
!	%f1  = 60000000, Mem[00000000100c1400] = fa000000
	sta	%f1 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 60000000
!	%f2  = 212f08ef ff0000a5, %l2 = fffffffffa000000
!	Mem[00000000300c1408] = fff9c610ff0000a5
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1408] = fff9c610ff0000a5
!	%f12 = 677ffb11, Mem[00000000300c1400] = 0000ae76
	sta	%f12,[%i3+%g0]0x81	! Mem[00000000300c1400] = 677ffb11
!	Mem[0000000010081408] = 4ae6ae76, %l2 = fa000000, %l0 = 00e6a2de
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 000000004ae6ae76
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010081400] = 000000ff ff9239f8
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l7 = 00000000000000ff
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_205:
!	Mem[00000000201c0000] = 0000075f, %l0 = 000000004ae6ae76
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000060, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %f29 = 67df74f0
	lda	[%i4+%o5]0x89,%f29	! %f29 = ffffffff
!	Mem[0000000010001434] = 67df74f0, %l4 = 00000000000000fa
	lduha	[%i0+0x034]%asi,%l4	! %l4 = 00000000000067df
!	Mem[00000000211c0000] = 7dffd61d, %l0 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 0000000000007dff
!	Mem[0000000030041408] = 15178654, %f29 = ffffffff
	lda	[%i1+%o4]0x89,%f29	! %f29 = 15178654
!	Mem[0000000010081410] = 57b3ffff, %l5 = 0000000000000062
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 7dffd61d, %l2 = fffffffffa000000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000007dff
!	Starting 10 instruction Store Burst
!	%f28 = fff9c610 15178654, Mem[00000000300c1400] = 11fb7f67 797dee90
	stda	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = fff9c610 15178654

p0_label_206:
!	Mem[0000000010101408] = f83908ef, %l0 = 0000000000007dff
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000f8000000ff
!	%f20 = ffffffff, Mem[0000000010001400] = 15176a9c
	sta	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	Mem[0000000010101410] = ffe6aeff, %l0 = 00000000000000f8
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141410] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 00000000ffffffff
!	%f6  = fff9c610 f83992ff, %l5 = 00000000000000ff
!	Mem[0000000030101418] = 61923967ffdcff03
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101418] = fff9c610f83992ff
!	Mem[00000000211c0000] = 7dffd61d, %l6 = 00000000000000ff
	ldstub	[%o2+%g0],%l6		! %l6 = 0000007d000000ff
!	Mem[0000000010081430] = ffbbf195, %l4 = 00000000000067df, %asi = 80
	swapa	[%i2+0x030]%asi,%l4	! %l4 = 00000000ffbbf195
!	%l6 = 000000000000007d, Mem[0000000010041410] = f074dfff
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000007d
!	%l2 = 00007dff, %l3 = 00000000, Mem[0000000010141410] = ff000000 ffffffff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00007dff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff8cffff43bcb1ff, %l6 = 000000000000007d
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = ff8cffff43bcb1ff

p0_label_207:
!	Mem[0000000030001408] = ffb7ffff, %l4 = 00000000ffbbf195
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = ff16c07effffffff, %l1 = 0f472837a79af3ba
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = ff16c07effffffff
!	%l5 = 00000000000000ff, imm = fffffffffffffb51, %l0 = 00000000ffffffff
	xnor	%l5,-0x4af,%l0		! %l0 = 0000000000000451
!	Mem[0000000030081408] = ff9cf55000004ae6, %l5 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l5	! %l5 = ff9cf55000004ae6
!	Mem[0000000010001400] = ffffffff, %l4 = ffffffffffffffff
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010081400] = ff000000, %l4 = 00000000ffffffff
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010001410] = 0000000000000079, %f8  = 76000000 ffff0000
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 00000000 00000079
!	Mem[0000000010101410] = ffaee6ff, %l2 = 0000000000007dff
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 000000000000e6ff
!	Mem[0000000010181400] = 79000000, %l4 = ffffffffff000000
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000079
!	Starting 10 instruction Store Burst
!	%l6 = ff8cffff43bcb1ff, Mem[0000000010001408] = ffffffff7ec016ff
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ff8cffff43bcb1ff

p0_label_208:
!	%l6 = 43bcb1ff, %l7 = 00000000, Mem[0000000010141400] = ffff0000 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 43bcb1ff 00000000
!	Mem[0000000010181400] = 79000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 0000000079000000
!	%l6 = 43bcb1ff, %l7 = 79000000, Mem[0000000010141410] = 00007dff 00000000
	std	%l6,[%i5+%o5]		! Mem[0000000010141410] = 43bcb1ff 79000000
!	%f1  = 60000000, %f19 = 08c80a6f
	fcmpes	%fcc2,%f1 ,%f19		! %fcc2 = 2
!	Mem[0000000030101408] = 76aee64a, %l5 = ff9cf55000004ae6
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000076aee64a
!	%l2 = 000000000000e6ff, Mem[0000000020800000] = ff95b0a2, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = ff95b0a2
!	Mem[0000000010141410] = ffb1bc43, %l6 = ff8cffff43bcb1ff
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000043000000ff
!	%l4 = 00000079, %l5 = 76aee64a, Mem[0000000030181400] = ff67dc62 ff74ff67
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000079 76aee64a
!	%l4 = 0000000000000079, Mem[0000000010041400] = 675145ff11fb7f67, %asi = 80
	stxa	%l4,[%i1+0x000]%asi	! Mem[0000000010041400] = 0000000000000079
!	Starting 10 instruction Load Burst
!	%l7 = 0000000079000000, immed = 00000bfa, %y  = fff9c610
	smul	%l7,0xbfa,%l2		! %l2 = 000005a92a000000, %y = 000005a9

p0_label_209:
!	%l2 = 000005a92a000000, imm = 000000000000038c, %l0 = 0000000000000451
	subc	%l2,0x38c,%l0		! %l0 = 000005a929fffc74
!	Mem[0000000030041408] = 54861715, %l7 = 0000000079000000
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000005486
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 4ae6ae76, %l2 = 000005a92a000000
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 000000000000004a
!	Mem[00000000211c0000] = ffffd61d, %l6 = 0000000000000043
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141408] = ef082f21, %l7 = 0000000000005486
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000002f21
!	Mem[0000000010041438] = 1b3b61ff 9a69ff71, %l4 = 00000079, %l5 = 76aee64a
	ldda	[%i1+0x038]%asi,%l4	! %l4 = 000000001b3b61ff 000000009a69ff71
!	Mem[0000000030081400] = 0000000000000000, %l1 = ff16c07effffffff
	ldxa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = ff8cffff43bcb1ff, %f12 = 677ffb11 ff455167
	ldda	[%i0+%o4]0x80,%f12	! %f12 = ff8cffff 43bcb1ff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 0000075f, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff

p0_label_210:
!	%l6 = 000000ff, %l7 = 00002f21, Mem[00000000100c1400] = 00000060 ff000000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00002f21
!	%l5 = 000000009a69ff71, Mem[0000000020800040] = ffff2222, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ff712222
!	Mem[0000000030081410] = 00006751, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000006751
!	%f12 = ff8cffff 43bcb1ff, Mem[00000000100c1400] = 000000ff 00002f21
	stda	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff8cffff 43bcb1ff
!	%l1 = 0000000000000000, Mem[0000000030041410] = 80786cff4bdf8cff
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000010181408] = ffb1bc43, %l7 = 0000000000002f21
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l6 = 0000000000006751, Mem[0000000030181408] = f07408ef62dc00a5
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000006751
!	Mem[0000000030001408] = ffffb7ff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%f16 = fff9c610 60000000, Mem[0000000030101408] = e64a0000 67df74f0
	stda	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = fff9c610 60000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 57b3ffff 50f59cff, %l0 = 29fffc74, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 0000000057b3ffff 0000000050f59cff

p0_label_211:
!	Mem[000000001018141c] = ff00ffff, %l4 = 000000001b3b61ff
	ldsw	[%i6+0x01c],%l4		! %l4 = ffffffffff00ffff
!	Mem[0000000030041400] = 000000ff, %l5 = 000000009a69ff71
	lduba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = ffe6aeff, %l6 = 0000000000006751
	ldub	[%i4+0x013],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l2 = 000000000000004a
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 4ae6ae76, %l0 = 0000000057b3ffff
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000004ae6ae76
!	Mem[0000000030001410] = fa080000, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 43bcb1ff, %f27 = 4bdf8cff
	lda	[%i6+%o4]0x88,%f27	! %f27 = 43bcb1ff
!	Mem[0000000010041410] = 0000007d, %l0 = 000000004ae6ae76
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = 000000000000007d
!	Mem[0000000030101400] = ffffffff, %l2 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030001410] = fa080000
	stwa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff

p0_label_212:
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001410] = 79000000 00000000
	stda	%l6,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000ff 000000ff
!	%f11 = 000000ff, Mem[0000000030041410] = 00000000
	sta	%f11,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Mem[0000000010181408] = ffb1bc43, %l1 = 0000000050f59cff
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010001408] = ff8cffff43bcb1ff
	stxa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%l4 = ff00ffff, %l5 = 00000000, Mem[0000000010141400] = ffb1bc43 00000000
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ff00ffff 00000000
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001410] = ff000000 ff000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 000000ff
!	Mem[000000001008141c] = 00ff51a8, %l1 = 000000ff, %l1 = 000000ff
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000000ff51a8
!	%f2  = 212f08ef, Mem[0000000030081400] = 00000000
	sta	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 212f08ef
!	%l1 = 0000000000ff51a8, Mem[0000000020800041] = ff712222, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = ffa82222
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ef082f21, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000002f21

p0_label_213:
!	Mem[0000000010101400] = 1c0000c8, %l0 = 000000000000007d
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000c8
!	%l7 = 0000000000002f21, immd = fffffffffffffb74, %l2 = 00000000000000ff
	udivx	%l7,-0x48c,%l2		! %l2 = 0000000000000000
!	Mem[0000000030181400] = 0000007976aee64a, %f14 = 0354dc62 67df74f0
	ldda	[%i6+%g0]0x81,%f14	! %f14 = 00000079 76aee64a
!	Mem[00000000211c0000] = ffffd61d, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010081400] = 000000ff000000ff, %l6 = 00000000000000ff
	ldx	[%i2+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010101408] = ff3908ef, %l1 = 0000000000ff51a8
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 000000000000ff39
!	Mem[0000000030181400] = 79000000, %l4 = ffffffffff00ffff
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 0000000079000000
!	Mem[0000000030101408] = fff9c61060000000, %l5 = 000000000000ffff
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = fff9c61060000000
!	Mem[0000000010001400] = ffffffff 3c9dbf0a, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffffffff 000000003c9dbf0a
!	Starting 10 instruction Store Burst
!	%f16 = fff9c610 60000000 f83992ff 08c80a6f
!	%f20 = ffffffff ffffffff 67ff74ff 62dc60a8
!	%f24 = 9c6a1715 3c9dbf0a 80786cff 43bcb1ff
!	%f28 = fff9c610 15178654 9c6a1715 3c9dbf0a
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400

p0_label_214:
!	%l0 = 000000c8, %l1 = 0000ff39, Mem[0000000010001410] = 000000ff 000000ff
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000c8 0000ff39
!	%f10 = 0000ffff 000000ff, Mem[00000000300c1410] = 00000000 00000000
	stda	%f10,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000ffff 000000ff
!	Mem[00000000100c1400] = ffff8cff, %l1 = 000000000000ff39
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ffff8cff
!	%l7 = 0000000000002f21, Mem[00000000100c1400] = 0000ff39
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00002f21
!	%l1 = 00000000ffff8cff, Mem[0000000010181410] = 00000000
	stba	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%f2  = 212f08ef ff0000a5, %l7 = 0000000000002f21
!	Mem[0000000030101430] = 43bcb1aba50000ff
	add	%i4,0x030,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_S ! Mem[0000000030101430] = 43bc08aba50000a5
!	%l4 = 0000000079000000, Mem[0000000030181400] = 00000060
	stha	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000060
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010181400] = 00000000, %l6 = 000000ff000000ff
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[000000001018141d] = ff00ffff, %l3 = 000000003c9dbf0a
	ldstub	[%i6+0x01d],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffaee6ff, %l7 = 0000000000002f21
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_215:
!	%l3 = 0000000000000000, %l4 = 0000000079000000, %l6 = 0000000000000000
	xor	%l3,%l4,%l6		! %l6 = 0000000079000000
!	Mem[0000000030081400] = ef082f21, %l4 = 0000000079000000
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000021
!	Mem[0000000010081400] = 000000ff, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 4700000015670000, %f4  = 67ff74ff 57b3ffff
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 47000000 15670000
!	Mem[0000000010041408] = 600000ff, %l4 = 0000000000000021
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ff00ffff, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 00000000ff00ffff
!	Mem[0000000021800040] = ff67856a, %l2 = 00000000ffffffff
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = 0000000000000067
!	Mem[00000000100c1400] = 00002f21, %l7 = 00000000ff00ffff
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000002f21
!	Mem[0000000030001400] = 08c80a6f, %l5 = fff9c61060000000
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000a6f
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff000000, %l4 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ff000000

p0_label_216:
!	%l3 = 0000000000000000, Mem[0000000020800040] = ffa82222
	stb	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00a82222
!	%l3 = 0000000000000000, Mem[0000000010181408] = 43bcb1ff
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 43bcb100
!	%l5 = 0000000000000a6f, imm = 000000000000084f, %l6 = 0000000079000000
	addc	%l5,0x84f,%l6		! %l6 = 00000000000012be
!	Mem[00000000100c1408] = a511116d, %l7 = 0000000000002f21
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000a511116d
!	Mem[0000000030001408] = ffb7ffff, %l1 = 00000000ffff8cff
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 00000000ffb7ffff
!	%l0 = 00000000000000c8, Mem[0000000021800041] = ff67856a, %asi = 80
	stba	%l0,[%o3+0x041]%asi	! Mem[0000000021800040] = ffc8856a
!	%l3 = 0000000000000000, Mem[0000000010181400] = ff000000
	stw	%l3,[%i6+%g0]		! Mem[0000000010181400] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030081408] = 00004ae6
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000030001408] = ff8cffff, %l5 = 0000000000000a6f
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = fff9c61015178654, %f20 = ffffffff ffffffff
	ldda	[%i3+%g0]0x89,%f20	! %f20 = fff9c610 15178654

p0_label_217:
!	Mem[00000000300c1408] = 10c6f9ff, %l0 = 00000000000000c8
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %f9  = 00000079
	lda	[%i1+%o5]0x81,%f9 	! %f9 = ff000000
!	Mem[0000000010141410] = ffbcb1ff, %l2 = 0000000000000067
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ffbcb1ff
!	Mem[000000001018142c] = 4bdf8cff, %l5 = 00000000000000ff
	ldsb	[%i6+0x02d],%l5		! %l5 = ffffffffffffffdf
!	Mem[0000000010101408] = ef0839ff, %l2 = 00000000ffbcb1ff
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000039ff
!	Mem[0000000030041408] = 15178654, %l6 = 00000000000012be
	lduba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000054
!	Mem[0000000010041410] = 7d000000, %l1 = 00000000ffb7ffff
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000007d00
!	Mem[0000000010141400] = ffff00ff 00000000, %l0 = 000000ff, %l1 = 00007d00
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffff00ff 0000000000000000
!	Mem[00000000300c1408] = 10c6f9ff, %l5 = ffffffffffffffdf
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 000000000000f9ff
!	Starting 10 instruction Store Burst
!	%f4  = 47000000 15670000, Mem[0000000030101410] = ffffffff 47e5d6af
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 47000000 15670000

p0_label_218:
!	Mem[0000000030001408] = ffff8cff, %l2 = 00000000000039ff
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181410] = 000000ff, %l7 = 00000000a511116d
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 000000000000f9ff, Mem[000000001018140c] = 000000ff
	sth	%l5,[%i6+0x00c]		! Mem[000000001018140c] = f9ff00ff
!	%l3 = 0000000000000000, Mem[0000000030181410] = ffffffff
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffff00
!	Mem[0000000010181408] = 00b1bc43, %l6 = 0000000000000054, %asi = 80
	swapa	[%i6+0x008]%asi,%l6	! %l6 = 0000000000b1bc43
!	%l0 = 00000000ffff00ff, Mem[00000000100c1400] = 00002f21
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000030181408] = 08c80a6f, %l4 = 00000000ff000000
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 0000006f000000ff
!	%l4 = 000000000000006f, Mem[0000000010141410] = ffbcb1ff
	stba	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 6fbcb1ff
!	%l5 = 000000000000f9ff, Mem[0000000030081410] = 00004ae6000000ff
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000f9ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffb1bc43 ffff8cff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ffb1bc43 00000000ffff8cff

p0_label_219:
!	Mem[0000000030081410] = 00000000 0000f9ff, %l4 = 0000006f, %l5 = 0000f9ff
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 000000000000f9ff 0000000000000000
!	Mem[00000000100c1438] = 0000ffff000000ff, %l7 = 00000000000000ff
	ldxa	[%i3+0x038]%asi,%l7	! %l7 = 0000ffff000000ff
!	Mem[00000000100c1400] = ff000000, %f13 = 43bcb1ff
	lda	[%i3+%g0]0x80,%f13	! %f13 = ff000000
!	Mem[00000000300c1408] = fff9c610ff0000a5, %l4 = 000000000000f9ff
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = fff9c610ff0000a5
!	Mem[0000000030001410] = ffffffff, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1408] = 212f00001f5a2a44, %l6 = 0000000000b1bc43
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 212f00001f5a2a44
!	Mem[0000000010141410] = ffb1bc6f, %l5 = 000000000000ffff
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 000000000000006f
!	Mem[00000000211c0000] = ffffd61d, %l2 = 00000000ffb1bc43
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = ff95b0a2, %l6 = 212f00001f5a2a44
	ldsh	[%o1+%g0],%l6		! %l6 = ffffffffffffff95
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010101410] = ffe6aeff
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00e6aeff

p0_label_220:
!	%l4 = fff9c610ff0000a5, imm = 0000000000000e49, %l7 = 0000ffff000000ff
	xnor	%l4,0xe49,%l7		! %l7 = 000639ef00fff113
!	%l5 = 000000000000006f, Mem[0000000020800000] = ff95b0a2, %asi = 80
	stba	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 6f95b0a2
!	Mem[0000000030101400] = ffffffff, %l6 = ffffffffffffff95
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%l2 = ffffffff, %l3 = ffff8cff, Mem[0000000030141400] = 43bcb1ff ff8cffff
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff ffff8cff
!	Mem[00000000100c1401] = ff000000, %l0 = 00000000ffff00ff
	ldstuba	[%i3+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = ffffb357, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ffffb357
!	%l1 = 00000000ffffb357, Mem[0000000030181410] = 00ffffff
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = b357ffff
!	Mem[0000000030141400] = ffffffff, %l3 = 00000000ffff8cff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030001400] = 08c80a6f, %l3 = 00000000ffffffff
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000008c80a6f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff0ac808, %l7 = 000639ef00fff113
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffff0a

p0_label_221:
!	Mem[0000000010141430] = f83992ff, %l0 = 0000000000000000
	ldsha	[%i5+0x030]%asi,%l0	! %l0 = fffffffffffff839
!	Mem[0000000010181404] = 67df74f0, %f23 = 62dc60a8
	ld	[%i6+0x004],%f23	! %f23 = 67df74f0
!	Mem[0000000021800100] = b7ff6d5f, %l0 = fffffffffffff839
	lduba	[%o3+0x100]%asi,%l0	! %l0 = 00000000000000b7
!	Mem[0000000010081408] = 95f1bbff76aee64a, %f22 = 67ff74ff 67df74f0
	ldda	[%i2+%o4]0x88,%f22	! %f22 = 95f1bbff 76aee64a
!	Mem[0000000010081400] = 000000ff 000000ff, %l0 = 000000b7, %l1 = ffffb357
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff 00000000000000ff
!	Mem[00000000100c1408] = 212f0000, %l4 = fff9c610ff0000a5
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000021
!	Mem[0000000030081408] = 00000000, %f5  = 15670000
	lda	[%i2+%o4]0x89,%f5 	! %f5 = 00000000
!	Mem[0000000010081408] = 95f1bbff76aee64a, %f12 = ff8cffff ff000000
	ldda	[%i2+%o4]0x88,%f12	! %f12 = 95f1bbff 76aee64a
!	%l5 = 000000000000006f, %l4 = 0000000000000021, %l7 = ffffffffffffff0a
	add	%l5,%l4,%l7		! %l7 = 0000000000000090
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000060, %l6 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_222:
!	%l4 = 0000000000000021, Mem[0000000010181410] = 6d1111a500000000
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000021
!	%l1 = 00000000000000ff, Mem[0000000010081418] = 188b3ca9, %asi = 80
	stha	%l1,[%i2+0x018]%asi	! Mem[0000000010081418] = 00ff3ca9
!	%f20 = fff9c610 15178654, Mem[0000000030001400] = ffffffff 62dc5403
	stda	%f20,[%i0+%g0]0x81	! Mem[0000000030001400] = fff9c610 15178654
!	%f9  = ff000000, Mem[0000000010081410] = 00000000
	sta	%f9 ,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	Mem[000000001000141c] = 8b0c1328, %l3 = 0000000008c80a6f
	swap	[%i0+0x01c],%l3		! %l3 = 000000008b0c1328
!	Mem[0000000030141408] = ef082f21, %l4 = 0000000000000021
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000021000000ff
!	%l1 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%f14 = 00000079 76aee64a, %l3 = 000000008b0c1328
!	Mem[00000000300c1408] = fff9c610ff0000a5
	add	%i3,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_S ! Mem[00000000300c1408] = fff90010760000a5
!	Mem[0000000010041410] = 0000007d, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 0000007d000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = fff90010, %l0 = 000000000000007d
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = fffffffffffffff9

p0_label_223:
!	Mem[0000000030001408] = ff8cffff, %l1 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ff8c
!	Mem[00000000100c1408] = 212f0000, %l4 = 0000000000000021
	ldsh	[%i3+%o4],%l4		! %l4 = 000000000000212f
!	Mem[0000000030041408] = 00000000 15178654, %l0 = fffffff9, %l1 = 0000ff8c
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 0000000015178654 0000000000000000
!	Mem[0000000010041408] = ff00006010c6f9ff, %f0  = ffffb7ff 60000000
	ldda	[%i1+%o4]0x80,%f0 	! %f0  = ff000060 10c6f9ff
!	Mem[0000000030041410] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001014140c] = 60000000, %l7 = 0000000000000090
	ldsh	[%i5+0x00c],%l7		! %l7 = 0000000000006000
!	Mem[0000000030041410] = 000000ff, %l3 = 000000008b0c1328
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081424] = f074ff67, %l5 = 000000000000006f
	ldsba	[%i2+0x025]%asi,%l5	! %l5 = 0000000000000074
!	Mem[0000000010081400] = 000000ff 000000ff, %l0 = 15178654, %l1 = 00000000
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000074, Mem[0000000030101400] = 6f0ac808ffffffff
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000074

p0_label_224:
!	%l4 = 0000212f, %l5 = 00000074, Mem[0000000030041400] = 000000ff ffffffff
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000212f 00000074
!	%l0 = 00000000000000ff, Mem[0000000030101410] = 00000047
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	Mem[00000000211c0000] = ffffd61d, %l5 = 0000000000000074
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000211c0000] = ffffd61d, %l1 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%f5  = 00000000, Mem[000000001000141c] = 08c80a6f
	st	%f5 ,[%i0+0x01c]	! Mem[000000001000141c] = 00000000
!	%l5 = 00000000000000ff, Mem[000000001010140c] = ff9239f8, %asi = 80
	stha	%l5,[%i4+0x00c]%asi	! Mem[000000001010140c] = 00ff39f8
!	Mem[0000000030041410] = ff000000, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1400] = 0000ffff, %l7 = 0000000000006000
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l3 = 00000000ff000000, Mem[0000000030081408] = 00000000
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_225:
!	%l3 = 00000000ff000000, %l3 = 00000000ff000000, %l4 = 000000000000212f
	udivx	%l3,%l3,%l4		! %l4 = 0000000000000001
!	Mem[000000001014141c] = 67df74f0, %l2 = 00000000000000ff
	ldsha	[%i5+0x01c]%asi,%l2	! %l2 = 00000000000067df
!	Mem[00000000300c1400] = 15178654, %l0 = 00000000000000ff
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 0000000015178654
!	Mem[0000000010081410] = ff000000 ff74ff67, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i2+%o5],%l6		! %l6 = 00000000ff000000 00000000ff74ff67
!	Mem[00000000201c0000] = ff00075f, %l0 = 0000000015178654
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101438] = 0000ffff, %l1 = 00000000000000ff
	lduha	[%i4+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff8cffff, %l6 = 00000000ff000000
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = ffffffffff8cffff
!	Mem[00000000300c1410] = ffff0000, %f1  = 10c6f9ff
	lda	[%i3+%o5]0x89,%f1 	! %f1 = ffff0000
!	Mem[0000000010181408] = 54000000, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = 0000000054000000
!	Starting 10 instruction Store Burst
!	%l2 = 000067df, %l3 = ff000000, Mem[0000000010041410] = ff000000 ff16c07e
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000067df ff000000

p0_label_226:
!	Mem[000000001008140c] = ffbbf195, %l1 = 54000000, %l3 = ff000000
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ffbbf195
!	%l4 = 0000000000000001, Mem[0000000010181400] = 00000000
	stha	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000001
!	%f0  = ff000060 ffff0000 212f08ef ff0000a5
!	%f4  = 47000000 00000000 fff9c610 f83992ff
!	%f8  = 00000000 ff000000 0000ffff 000000ff
!	%f12 = 95f1bbff 76aee64a 00000079 76aee64a
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f18 = f83992ff 08c80a6f, %l0 = ffffffffffffff00
!	Mem[00000000300c1438] = 0354dc6267df74f0
	add	%i3,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_S ! Mem[00000000300c1438] = 0354dc6267df74f0
!	Mem[0000000010141410] = 6fbcb1ff, %l1 = 0000000054000000
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 000000006fbcb1ff
!	Mem[0000000010141438] = 0000ffff, %l3 = 00000000ffbbf195
	swap	[%i5+0x038],%l3		! %l3 = 000000000000ffff
!	%l3 = 000000000000ffff, Mem[0000000010081408] = 76aee64a
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 76aee6ff
!	Mem[00000000100c143c] = 000000ff, %l0 = ffffff00, %l6 = ff8cffff
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = b357ffff, %l7 = 00000000ff74ff67
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000b357ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l0 = ffffffffffffff00
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_227:
!	Mem[0000000010141400] = ff00ffff, %l2 = 00000000000067df
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041408] = fff9c610600000ff, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = fff9c610600000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030081410] = 4700000000000000, %l3 = 000000000000ffff
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = 4700000000000000
!	Mem[00000000300c1400] = 54861715, %l2 = 000000000000ffff
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000005486
!	Mem[00000000100c1410] = 00006715, %l1 = 000000006fbcb1ff
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, imm = fffffffffffff0b8, %l6 = 00000000000000ff
	sub	%l1,-0xf48,%l6		! %l6 = 0000000000000f48
!	Mem[0000000010001400] = 0abf9d3cffffffff, %l7 = 00000000b357ffff
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = 0abf9d3cffffffff
!	Mem[000000001018142c] = 4bdf8cff, %l0 = fff9c610600000ff
	ldub	[%i6+0x02c],%l0		! %l0 = 000000000000004b
!	Mem[0000000021800080] = 257e727f, %l0 = 000000000000004b
	lduha	[%o3+0x080]%asi,%l0	! %l0 = 000000000000257e
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000001, Mem[00000000300c1400] = 15178654
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 15170001

p0_label_228:
!	Mem[00000000300c1410] = 0000ffff, %l4 = 0000000000000001
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f14 = 00000079 76aee64a, Mem[0000000010001410] = 000000c8 0000ff39
	stda	%f14,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000079 76aee64a
!	Mem[0000000030141410] = ffffb357, %l2 = 0000000000005486
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000057000000ff
!	Mem[0000000020800000] = 6f95b0a2, %l6 = 0000000000000f48
	ldstub	[%o1+%g0],%l6		! %l6 = 0000006f000000ff
!	%f19 = 08c80a6f, %f13 = 76aee64a
	fcmps	%fcc2,%f19,%f13		! %fcc2 = 1
!	%f25 = 3c9dbf0a, Mem[0000000010101410] = 00e6aeff
	sta	%f25,[%i4+%o5]0x80	! Mem[0000000010101410] = 3c9dbf0a
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 000000ff
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%f16 = fff9c610 60000000 f83992ff 08c80a6f
!	%f20 = fff9c610 15178654 95f1bbff 76aee64a
!	%f24 = 9c6a1715 3c9dbf0a 80786cff 43bcb1ff
!	%f28 = fff9c610 15178654 9c6a1715 3c9dbf0a
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	%f10 = 0000ffff, %f10 = 0000ffff
	fcmpes	%fcc3,%f10,%f10		! %fcc3 = 0

p0_label_229:
!	Mem[00000000300c1408] = 1000f9ff, %l6 = 000000000000006f
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = fffffffffffff9ff
!	Mem[0000000030101400] = 74000000, %l5 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000074
!	Mem[0000000010101400] = c800001c ff009edc, %l6 = fffff9ff, %l7 = ffffffff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000c800001c 00000000ff009edc
!	Mem[0000000010001408] = ff00000000000000, %l2 = 0000000000000057
	ldxa	[%i0+0x008]%asi,%l2	! %l2 = ff00000000000000
!	Mem[0000000030081410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1430] = 00000000, %l7 = 00000000ff009edc
	lduh	[%i3+0x032],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %f12 = 95f1bbff
	lda	[%i0+%o4]0x88,%f12	! %f12 = 000000ff
!	Mem[0000000010101400] = c800001c, %f6  = fff9c610
	lda	[%i4+%g0]0x80,%f6 	! %f6 = c800001c
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010001400] = ffffffff 3c9dbf0a ff000000 00000000
!	Mem[0000000010001410] = 4ae6ae76 79000000 fb9706db 00000000
!	Mem[0000000010001420] = ffc67b82 60ff00ff 5a6f0000 000000ff
!	Mem[0000000010001430] = 0354dc62 67df74f0 00000057 6978bf4a
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (29)
!	%l4 = 0000000000000000, Mem[0000000010001434] = 67df74f0, %asi = 80
	stha	%l4,[%i0+0x034]%asi	! Mem[0000000010001434] = 000074f0

p0_label_230:
!	%l0 = 000000000000257e, Mem[0000000030041408] = 6f0ac808ff9239f8
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000257e
!	%f0  = ff000060, %f26 = 5a6f0000
	fcmpes	%fcc0,%f0 ,%f26		! %fcc0 = 1
!	Mem[0000000010101420] = 0000ffff00000076, %l2 = ff00000000000000, %l2 = ff00000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 0000ffff00000076
!	Mem[00000000201c0001] = ff00075f, %l3 = 4700000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%l0 = 000000000000257e, Mem[0000000030181400] = 00000060
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 7e000060
!	%l0 = 000000000000257e, Mem[0000000030101400] = 7400000000000000
	stxa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000000000257e
!	%f8  = 00000000, Mem[0000000030041408] = 00000000
	sta	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = 000000ff
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l2 = 0000ffff00000076, Mem[0000000020800000] = ff95b0a2
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 0076b0a2
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = fff9c610600000ff, %l5 = 0000000000000074
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = fff9c610600000ff

p0_label_231:
!	Mem[0000000030001410] = ffffffff, %l2 = 0000ffff00000076
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001400] = fff9c610, %l5 = fff9c610600000ff
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000fff9
!	Mem[00000000201c0000] = ffff075f, %l3 = 0000000000000000
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = a50000ff, %l0 = 000000000000257e
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000a5
!	Mem[00000000100c1400] = ffff0000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = 08c80aff, %f16 = ffffffff
	lda	[%i6+%o4]0x89,%f16	! %f16 = 08c80aff
!	%f7  = f83992ff, %f6  = c800001c, %f21 = 79000000
	fmuls	%f7 ,%f6 ,%f21		! %f21 = 7f800000
!	Mem[0000000010001408] = 00000000, %l2 = 000000000000ffff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 00002f21, %l5 = 000000000000fff9
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000002f21
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = f9ff00ff, %l3 = ffffffff, %l0 = 000000a5
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000f9ff00ff

p0_label_232:
!	%l3 = ffffffffffffffff, Mem[0000000030081400] = ffff0000
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = ffff00ff
!	%f8  = 00000000 ff000000, Mem[0000000030101408] = 600000ff fff9c610
	stda	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 ff000000
!	%l0 = 00000000f9ff00ff, Mem[0000000010081402] = 000000ff
	stb	%l0,[%i2+0x002]		! Mem[0000000010081400] = 0000ffff
!	%f2  = 212f08ef ff0000a5, %l0 = 00000000f9ff00ff
!	Mem[0000000030101428] = 827bc6130354dc62
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_S ! Mem[0000000030101428] = 212f08efff0000a5
!	%l5 = 0000000000002f21, %l0 = 00000000f9ff00ff, %l7 = 0000000000000000
	add	%l5,%l0,%l7		! %l7 = 00000000f9ff3020
!	%l1 = ffffffffffffffff, Mem[0000000010101408] = f839ff00ef0839ff
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffffffffffff
!	%l5 = 0000000000002f21, Mem[0000000030041400] = 0000006010c6f9ff
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000002f21
!	%l1 = ffffffffffffffff, Mem[0000000010141414] = 79000000
	stb	%l1,[%i5+0x014]		! Mem[0000000010141414] = ff000000
!	Mem[0000000030001400] = fff9c610, %l3 = ffffffffffffffff
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000fff9c610
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 0000ffff000000ff, %f24 = ffc67b82 60ff00ff
	ldd	[%i3+0x038],%f24	! %f24 = 0000ffff 000000ff

p0_label_233:
!	Mem[0000000021800100] = b7ff6d5f, %l0 = 00000000f9ff00ff
	lduh	[%o3+0x100],%l0		! %l0 = 000000000000b7ff
!	Mem[0000000030181408] = f83992ff 08c80aff, %l0 = 0000b7ff, %l1 = ffffffff
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 0000000008c80aff 00000000f83992ff
!	Mem[0000000010101408] = ffffffff, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000201c0000] = ffff075f, %l1 = 00000000f83992ff
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[00000000300c1400] = 0100171510c6f9ff, %l1 = 000000000000ffff
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 0100171510c6f9ff
!	Mem[0000000010181428] = 80786cff, %l6 = 00000000c800001c
	lduwa	[%i6+0x028]%asi,%l6	! %l6 = 0000000080786cff
!	Mem[0000000030081408] = a50000ff, %l6 = 0000000080786cff
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = ffffffffa50000ff
!	Mem[0000000030081400] = ff00ffff, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff00ffff
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000ffffffff
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff00ffff, imm = 00000000000002c9, %l5 = 0000000000002f21
	addc	%l2,0x2c9,%l5		! %l5 = 00000000ff0102c8

p0_label_234:
!	%l7 = 00000000f9ff3020, Mem[000000001010140c] = ffffffff
	stw	%l7,[%i4+0x00c]		! Mem[000000001010140c] = f9ff3020
!	%l0 = 0000000008c80aff, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	Mem[00000000211c0001] = ffffd61d, %l3 = 00000000fff9c610
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000010041400] = 00000000, %l0 = 0000000008c80aff
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f2  = 212f08ef, %f19 = 00000000
	fcmpes	%fcc1,%f2 ,%f19		! %fcc1 = 2
!	Mem[0000000030081408] = ff0000a5, %l3 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 000000a5000000ff
!	%l7 = 00000000f9ff3020, Mem[0000000010001425] = 60ff00ff, %asi = 80
	stba	%l7,[%i0+0x025]%asi	! Mem[0000000010001424] = 602000ff
!	%l0 = 0000000000000000, immed = 00000b6e, %y  = 000005a9
	smul	%l0,0xb6e,%l6		! %l6 = 0000000000000000, %y = 00000000
!	%f6  = c800001c f83992ff, %l2 = 00000000ff00ffff
!	Mem[00000000100c1428] = 000000004bdf8c9a
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1428] = ff9239f81c0000c8
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff0000ff, %l3 = 00000000000000a5
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_235:
!	Mem[0000000010001410] = 00000079 76aee64a, %l6 = 00000000, %l7 = f9ff3020
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000076aee64a 0000000000000079
!	Mem[00000000201c0000] = ffff075f, %l6 = 0000000076aee64a
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010041410] = 000067df, %l7 = 0000000000000079
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l6 = 000000000000ffff, imm = ffffffffffffff0d, %l3 = 00000000000000ff
	or	%l6,-0x0f3,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010181408] = 54000000, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 0000000054000000
!	Mem[0000000010041414] = ff000000, %l6 = 000000000000ffff
	lduw	[%i1+0x014],%l6		! %l6 = 00000000ff000000
!	Mem[0000000030141410] = ff9cf550 ffffb3ff, %l0 = 00000000, %l1 = 10c6f9ff
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 00000000ffffb3ff 00000000ff9cf550
!	Mem[0000000030101410] = ff00000015670000, %l0 = 00000000ffffb3ff
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = ff00000015670000
!	Mem[0000000030181410] = ff74ff67ffffffff, %l7 = 0000000054000000
	ldxa	[%i6+%o5]0x81,%l7	! %l7 = ff74ff67ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff

p0_label_236:
!	%l4 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff0000
!	%l7 = ff74ff67ffffffff, Mem[0000000010041400] = 08c80aff
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 08c8ffff
!	%l3 = ffffffffffffffff, Mem[0000000010181400] = 0100000067df74f0, %asi = 80
	stxa	%l3,[%i6+0x000]%asi	! Mem[0000000010181400] = ffffffffffffffff
!	%f27 = 000000ff, Mem[0000000010181408] = 54000000
	sta	%f27,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%l6 = 00000000ff000000, Mem[00000000211c0000] = ffffd61d, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000d61d
!	%l7 = ff74ff67ffffffff, Mem[0000000010081410] = 000000ff
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	Mem[0000000030041400] = ff000000, %l2 = 00000000ff00ffff
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081400] = 0000ffff000000ff, %l4 = 00000000000000ff, %l2 = 00000000000000ff
	casxa	[%i2]0x80,%l4,%l2	! %l2 = 0000ffff000000ff
!	Mem[0000000010001430] = 0354dc62, %l7 = ff74ff67ffffffff, %asi = 80
	swapa	[%i0+0x030]%asi,%l7	! %l7 = 000000000354dc62
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = ffbbf195, %l4 = 00000000000000ff
	ldsba	[%i2+0x00e]%asi,%l4	! %l4 = fffffffffffffff1

p0_label_237:
!	Mem[00000000201c0000] = ffff075f, %l4 = fffffffffffffff1
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030001410] = ffffffff, %l0 = ff00000015670000
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = 01001715, %l4 = 000000000000ffff
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000001
!	Mem[000000001000140c] = 00000000, %l7 = 000000000354dc62
	lduha	[%i0+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 54861715, %l3 = ffffffffffffffff
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000054
!	Code Fragment 4
p0_fragment_20:
!	%l0 = ffffffffffffffff
	setx	0x407266b82135f6ba,%g7,%l0 ! %l0 = 407266b82135f6ba
!	%l1 = 00000000ff9cf550
	setx	0x90e721f7b73e3c7a,%g7,%l1 ! %l1 = 90e721f7b73e3c7a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 407266b82135f6ba
	setx	0x19b520e82915b439,%g7,%l0 ! %l0 = 19b520e82915b439
!	%l1 = 90e721f7b73e3c7a
	setx	0x54b6080063526529,%g7,%l1 ! %l1 = 54b6080063526529
!	Mem[00000000100c142c] = 1c0000c8, %l6 = 00000000ff000000
	ldsb	[%i3+0x02f],%l6		! %l6 = ffffffffffffffc8
!	Mem[0000000030041400] = ff000000, %l3 = 0000000000000054
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 3c9dbf0a, %l1 = 54b6080063526529
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 000000003c9dbf0a
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 7e000060, %l6 = ffffffffffffffc8
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 000000007e000060

p0_label_238:
!	Mem[0000000010101400] = c800001c, %l2 = 0000ffff000000ff
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 000000c8000000ff
!	%l5 = 00000000ff0102c8, Mem[0000000030181408] = 08c80aff
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 08c80ac8
!	%f8  = 00000000 ff000000, Mem[00000000100c1408] = 00002f21 442a5a1f
	stda	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ff000000
!	%f16 = 08c80aff 3c9dbf0a ff000000 00000000
!	%f20 = 4ae6ae76 7f800000 fb9706db 00000000
!	%f24 = 0000ffff 000000ff 5a6f0000 000000ff
!	%f28 = 0354dc62 67df74f0 00000057 6978bf4a
	stda	%f16,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400
!	%f0  = ff000060, Mem[0000000030001400] = ffffffff
	sta	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000060
!	%l4 = 0000000000000001, Mem[0000000030181400] = 6000007e
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 60000001
!	%f0  = ff000060, Mem[0000000010081428] = 80786cff
	sta	%f0 ,[%i2+0x028]%asi	! Mem[0000000010081428] = ff000060
!	%l1 = 000000003c9dbf0a, Mem[0000000010141408] = 6200006760000000
	stx	%l1,[%i5+%o4]		! Mem[0000000010141408] = 000000003c9dbf0a
!	Mem[0000000030081410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff74ff67, %l1 = 000000003c9dbf0a
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_239:
	membar	#Sync			! Added by membar checker (30)
!	Mem[000000001004140c] = 000000ff, %l1 = ffffffffffffffff
	ldswa	[%i1+0x00c]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141418] = fff9c610, %l6 = 000000007e000060
	ldswa	[%i5+0x018]%asi,%l6	! %l6 = fffffffffff9c610
!	Mem[00000000211c0000] = 0000d61d, %l0 = 19b520e82915b439
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 15170001, %l6 = fffffffffff9c610
	ldswa	[%i3+%g0]0x89,%l6	! %l6 = 0000000015170001
!	Mem[0000000030141400] = ff8cffffff8cffff, %l7 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = ff8cffffff8cffff
!	%l0 = 0000000000000000, immed = 00000d13, %y  = 00000000
	sdiv	%l0,0xd13,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010141400] = ff00ffff, %l3 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = ff8cffffff8cffff, %f8  = 00000000 ff000000
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = ff8cffff ff8cffff
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = ff000060 ffff0000, Mem[0000000030101410] = 000000ff 00006715
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000060 ffff0000

p0_label_240:
!	%f21 = 7f800000, %f26 = 5a6f0000
	fstoi	%f21,%f26		! %f26 = 7fffffff
!	%f20 = 4ae6ae76 7f800000, %l5 = 00000000ff0102c8
!	Mem[0000000030101428] = 212f08efff0000a5
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030101428] = 212f08efff0000a5
!	%l3 = ffffffffffffffff, Mem[0000000010181400] = ffffffff
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	%l3 = ffffffffffffffff, Mem[0000000010081410] = ffffffffff74ff67
	stxa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffffffffff
!	%l3 = ffffffffffffffff, Mem[0000000030101410] = 0000ffff
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff
!	%l5 = 00000000ff0102c8, Mem[0000000010101400] = 1c0000ff
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0102c8
!	Mem[0000000030101410] = ffffffff, %l2 = 00000000000000c8
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000000000ff, %l2 = 00000000000000ff, %l0 = 0000000000000000
	addc	%l1,%l2,%l0		! %l0 = 00000000000001fe
!	Mem[0000000010141438] = ffbbf195fa0076ff, %l1 = 00000000000000ff, %l6 = 0000000015170001
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = ffbbf195fa0076ff
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 4bdf8cff, %l1 = 00000000000000ff
	ldub	[%i6+0x02e],%l1		! %l1 = 000000000000008c

p0_label_241:
!	Mem[0000000010181400] = ffffffff ffffffff, %l0 = 000001fe, %l1 = 0000008c
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010101428] = 0abf9d3c15176a9c, %l6 = ffbbf195fa0076ff
	ldxa	[%i4+0x028]%asi,%l6	! %l6 = 0abf9d3c15176a9c
!	Mem[00000000211c0000] = 0000d61d, %l5 = 00000000ff0102c8
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 54861715, %l2 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = 0000000054861715
!	Mem[0000000030041408] = ff000000, %l7 = ff8cffffff8cffff
	ldsba	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ff000060, %l7 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = 76aee6ff, %f16 = 08c80aff
	lda	[%i2+%o4]0x88,%f16	! %f16 = 76aee6ff
!	Mem[0000000010141434] = 08c80a6f, %f27 = 000000ff
	lda	[%i5+0x034]%asi,%f27	! %f27 = 08c80a6f
!	Mem[0000000010041410] = 7f800000, %l2 = 0000000054861715
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 000000007f800000
!	Starting 10 instruction Store Burst
!	%f0  = ff000060, Mem[0000000010101408] = ffffffff
	sta	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000060

p0_label_242:
!	%f24 = 0000ffff, Mem[0000000030041400] = ff000000
	sta	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000ffff
!	Mem[000000001008142c] = 4bdf8cff, %l3 = ffffffff, %l7 = ffffffff
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000004bdf8cff
!	Mem[0000000010041418] = 00000000db0697fb, %l3 = ffffffffffffffff, %l4 = 0000000000000001
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 00000000db0697fb
!	%l0 = 00000000ffffffff, Mem[00000000300c1408] = 1000f9ff
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1000f9ff
!	Mem[00000000201c0000] = ffff075f, %l3 = ffffffffffffffff
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[00000000100c141c] = ff0000ff, %l5 = 00000000, %l2 = 7f800000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010141410] = 00000054, %l3 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000054
!	Mem[0000000030081400] = ff00ffff, %l3 = 0000000000000054
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000ff00ffff
!	Mem[0000000010181410] = 00000000, %l7 = 000000004bdf8cff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff8cffff ff8cffff, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff8cffff 00000000ff8cffff

p0_label_243:
!	Mem[0000000010181410] = ff8cdf4b, %l6 = 0abf9d3c15176a9c
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 000000000000004b
!	Mem[0000000010181430] = ff0000ff, %l2 = 00000000ff0000ff
	ldsba	[%i6+0x032]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 54000000, %l2 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f12 = 000000ff, %f19 = 00000000, %f29 = 67df74f0
	fmuls	%f12,%f19,%f29		! %f29 = 00000000
!	Mem[0000000010141428] = 00000000, %l5 = 0000000000000000
	lduh	[%i5+0x02a],%l5		! %l5 = 0000000000000000
!	Mem[0000000021800040] = ffc8856a, %l7 = 0000000000000000
	ldsb	[%o3+0x041],%l7		! %l7 = ffffffffffffffc8
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030081400] = 00000054 600000ff ff0000ff ef082f21
!	Mem[0000000030081410] = ff000000 00000047 ff9239f8 10c6f9ff
!	Mem[0000000030081420] = 000000ff 00000000 ff000000 ffff0000
!	Mem[0000000030081430] = 4ae6ae76 ffbbf195 4ae6ae76 79000000
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000030081400] = ff00006054000000, %f4  = 47000000 00000000
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = ff000060 54000000
!	Mem[0000000030001410] = 00000000ffffffff, %f4  = ff000060 54000000
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = 00000000 ffffffff
!	Starting 10 instruction Store Burst
!	%f14 = 00000079 76aee64a, Mem[0000000010101410] = 3c9dbf0a 00000000
	stda	%f14,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000079 76aee64a

p0_label_244:
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000000ff000000
	stxa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%f14 = 00000079, Mem[0000000010081420] = ff455167
	sta	%f14,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000079
!	Mem[0000000030041408] = ff000000, %l4 = 00000000db0697fb
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	%l4 = 00000000ff000000, Mem[00000000100c1426] = 3c9dbf0a
	sth	%l4,[%i3+0x026]		! Mem[00000000100c1424] = 3c9d0000
!	%l6 = 000000000000004b, Mem[00000000100c1410] = 15670000
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 1567004b
!	Mem[0000000010101433] = ff3b61ff, %l6 = 000000000000004b
	ldstuba	[%i4+0x033]%asi,%l6	! %l6 = 000000ff000000ff
!	%f8  = ff8cffff ff8cffff, Mem[0000000010041410] = 0000807f 76aee64a
	stda	%f8 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ff8cffff ff8cffff
!	%l6 = 00000000000000ff, %l7 = ffffffffffffffc8, %l2 = 0000000000000000
	and	%l6,%l7,%l2		! %l2 = 00000000000000c8
!	Mem[00000000100c1428] = ff9239f8, %l0 = 00000000ff8cffff, %asi = 80
	swapa	[%i3+0x028]%asi,%l0	! %l0 = 00000000ff9239f8
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff075f, %l6 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_245:
!	Mem[0000000010001400] = ffffffff, %l7 = ffffffffffffffc8
	lduh	[%i0+0x002],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010041414] = ff8cffff, %l2 = 00000000000000c8
	ldsb	[%i1+0x014],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = 0076b0a2, %l0 = 00000000ff9239f8
	ldsh	[%o1+%g0],%l0		! %l0 = 0000000000000076
!	Mem[0000000010101410] = 79000000, %l0 = 0000000000000076
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800180] = b3572d80, %l2 = ffffffffffffffff
	lduh	[%o3+0x180],%l2		! %l2 = 000000000000b357
!	Mem[0000000030041408] = 7e250000 fb9706db, %l0 = 00000000, %l1 = ff8cffff
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000fb9706db 000000007e250000
!	Mem[0000000010081410] = ffffffff, %f13 = 76aee64a
	lda	[%i2+%o5]0x80,%f13	! %f13 = ffffffff
!	Mem[0000000030081410] = ff000000, %l7 = 000000000000ffff
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = ff74ff67ffffffff, %l7 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l7	! %l7 = ff74ff67ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff8cffff, %l7 = ff74ff67ffffffff
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_246:
	membar	#Sync			! Added by membar checker (32)
!	%l7 = 00000000000000ff, Mem[0000000030081410] = ff000000
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000fb9706db
	setx	0x863ff88f8401edde,%g7,%l0 ! %l0 = 863ff88f8401edde
!	%l1 = 000000007e250000
	setx	0xfae13b6041318b6b,%g7,%l1 ! %l1 = fae13b6041318b6b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 863ff88f8401edde
	setx	0x99316a478c00b7fb,%g7,%l0 ! %l0 = 99316a478c00b7fb
!	%l1 = fae13b6041318b6b
	setx	0x52f442c83311924f,%g7,%l1 ! %l1 = 52f442c83311924f
!	%l6 = ffffffffffffffff, Mem[0000000010181408] = 000000ff
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	%l4 = 00000000ff000000, Mem[0000000010041400] = 3c9dbf0a
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 3c9dbf00
!	Mem[0000000010001408] = 0000ff00, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f4  = 00000000 ffffffff, Mem[0000000030041408] = fb9706db 7e250000
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 ffffffff
!	%f8  = ff8cffff ff8cffff, Mem[0000000030001408] = ffff8cff 00000000
	stda	%f8 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ff8cffff ff8cffff
!	Mem[0000000030001400] = 600000ff, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000600000ff
!	%f1  = ffff0000, Mem[0000000010001430] = ffffffff
	st	%f1 ,[%i0+0x030]	! Mem[0000000010001430] = ffff0000
!	Starting 10 instruction Load Burst
!	%l1 = 52f442c83311924f, %l7 = 00000000000000ff, %l0 = 99316a478c00b7fb
	xnor	%l1,%l7,%l0		! %l0 = ad0bbd37ccee6d4f

p0_label_247:
!	Mem[00000000211c0000] = 0000d61d, %l3 = 00000000ff00ffff
	ldub	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141410] = ffffb3ff, %l0 = ad0bbd37ccee6d4f
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 1567004b, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x88,%l7	! %l7 = 000000001567004b
!	Mem[0000000010141420] = 80956cff 4bdf8c00, %l4 = ff000000, %l5 = 00000000
	ldd	[%i5+0x020],%l4		! %l4 = 0000000080956cff 000000004bdf8c00
!	Mem[0000000010141408] = 000000003c9dbf0a, %l0 = 00000000000000ff
	ldxa	[%i5+0x008]%asi,%l0	! %l0 = 000000003c9dbf0a
!	Mem[0000000010101418] = ff9239f8, %l7 = 000000001567004b
	ldsh	[%i4+0x01a],%l7		! %l7 = 00000000000039f8
!	Mem[0000000021800080] = 257e727f, %l6 = 00000000600000ff
	lduh	[%o3+0x080],%l6		! %l6 = 000000000000257e
!	Mem[0000000010141400] = ffff00ff 00000000 00000000 3c9dbf0a
!	Mem[0000000010141410] = ff000000 ff000000 fff9c610 67df74f0
!	Mem[0000000010141420] = 80956cff 4bdf8c00 00000000 000000ff
!	Mem[0000000010141430] = f83992ff 08c80a6f ffbbf195 fa0076ff
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[0000000030001410] = ffffffff, %l6 = 000000000000257e
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f29 = ffbbf195, Mem[0000000010001438] = 00000057
	st	%f29,[%i0+0x038]	! Mem[0000000010001438] = ffbbf195

p0_label_248:
!	Mem[0000000030041400] = ffff0000, %l2 = 000000000000b357
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030101408] = 000000ff00000000
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%f26 = ff000000 ffff0000, Mem[0000000010101408] = 600000ff f9ff3020
	std	%f26,[%i4+%o4]	! Mem[0000000010101408] = ff000000 ffff0000
!	Mem[00000000100c140c] = 00000000, %l4 = 80956cff, %l7 = 000039f8
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 0000000000000000
!	%l1 = 52f442c83311924f, Mem[0000000030101408] = 00000000
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 3311924f
!	%f26 = ff000000, %f30 = 4ae6ae76, %f26 = ff000000
	fdivs	%f26,%f30,%f26		! %f26 = f38e0c76
!	%l6 = 00000000ffffffff, Mem[0000000030141408] = ff2f08ef
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%l6 = 00000000ffffffff, Mem[00000000201c0000] = ffff075f
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = ffff075f
!	Mem[0000000010101428] = 0abf9d3c, %l3 = 0000000000000000, %asi = 80
	swapa	[%i4+0x028]%asi,%l3	! %l3 = 000000000abf9d3c
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0000d61d, %l2 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000

p0_label_249:
!	Mem[0000000030141410] = ffb3ffff 50f59cff, %l2 = 00000000, %l3 = 0abf9d3c
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffb3ffff 0000000050f59cff
!	Mem[0000000010101408] = 0000ffff000000ff, %l6 = 00000000ffffffff
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = 0000ffff000000ff
!	Mem[0000000030101400] = 00000000, %l1 = 52f442c83311924f
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ff0000ffef082f21, %l4 = 0000000080956cff
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = ff0000ffef082f21
!	Mem[00000000218001c0] = 671507db, %l6 = 0000ffff000000ff
	ldsb	[%o3+0x1c1],%l6		! %l6 = 0000000000000015
!	Mem[0000000010101438] = 0000ffff, %l7 = 0000000000000000
	ldsw	[%i4+0x038],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030101410] = ffffffff, %f27 = ffff0000
	lda	[%i4+%o5]0x81,%f27	! %f27 = ffffffff
!	Mem[00000000300c1408] = 1000f9ff, %l5 = 000000004bdf8c00
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 000000001000f9ff
!	Mem[0000000010001410] = 4ae6ae7679000000, %l4 = ff0000ffef082f21
	ldx	[%i0+%o5],%l4		! %l4 = 4ae6ae7679000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 4bdf8cff, %l5 = 000000001000f9ff
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 000000004bdf8cff

p0_label_250:
!	%l1 = 0000000000000000, Mem[0000000030041408] = 00000000ffffffff
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	Mem[00000000300c1408] = fff90010, %l4 = 4ae6ae7679000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c140a] = 00000000, %l7 = 000000000000ffff
	ldstub	[%i3+0x00a],%l7		! %l7 = 00000000000000ff
!	%f16 = 00000054 600000ff ff0000ff ef082f21
!	%f20 = ff000000 00000047 ff9239f8 10c6f9ff
!	%f24 = 000000ff 00000000 f38e0c76 ffffffff
!	%f28 = 4ae6ae76 ffbbf195 4ae6ae76 79000000
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = 00ff0000
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l3 = 0000000050f59cff, Mem[0000000010001438] = ffbbf1956978bf4a, %asi = 80
	stxa	%l3,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000050f59cff
!	Mem[0000000010001438] = 00000000, %l0 = 3c9dbf0a, %l3 = 50f59cff
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ffffffff
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ffffff
!	%l2 = ffb3ffff, %l3 = 00000000, Mem[0000000010001408] = ffff0000 00000000
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffb3ffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 602000ff, %l6 = 0000000000000015
	ldsb	[%i0+0x026],%l6		! %l6 = 0000000000000000

p0_label_251:
!	Mem[0000000010141408] = 00000000, %l5 = 000000004bdf8cff
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ff000000ff000000, %l2 = 00000000ffb3ffff
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = ff000000ff000000
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 0000d61d, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000d61d
!	Mem[0000000030081400] = 00000054, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 0000d61d, %l4 = 00000000000000ff
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141430] = f83992ff 08c80a6f, %l0 = 3c9dbf0a, %l1 = 00000000
	ldd	[%i5+0x030],%l0		! %l0 = 00000000f83992ff 0000000008c80a6f
!	Mem[0000000010001408] = ffb3ffff, %f15 = 95f1bbff
	lda	[%i0+%o4]0x80,%f15	! %f15 = ffb3ffff
!	Mem[00000000201c0000] = ffff075f, %l5 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ff000000 00000047, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff000000 0000000000000047
!	Starting 10 instruction Store Burst
!	%f10 = ff000000 00000000, Mem[0000000030101400] = 00000000 0000257e
	stda	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000 00000000

p0_label_252:
!	%f6  = f074df67 10c6f9ff, Mem[0000000010101400] = 00000054 600000ff
	stda	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = f074df67 10c6f9ff
!	%l5 = 0000000000000047, Mem[0000000020800001] = 0076b0a2
	stb	%l5,[%o1+0x001]		! Mem[0000000020800000] = 0047b0a2
!	%l4 = 00000000ff000000, Mem[000000001004143a] = 4abf7869, %asi = 80
	stha	%l4,[%i1+0x03a]%asi	! Mem[0000000010041438] = 4abf0000
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1408] = ff000000 00000000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000000
!	Mem[0000000030101408] = 4f921133, %l4 = 00000000ff000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 0000004f000000ff
!	%f16 = 00000054 600000ff ff0000ff ef082f21
!	%f20 = ff000000 00000047 ff9239f8 10c6f9ff
!	%f24 = 000000ff 00000000 f38e0c76 ffffffff
!	%f28 = 4ae6ae76 ffbbf195 4ae6ae76 79000000
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l2 = ff000000ff000000, Mem[000000001008143d] = 90ee7d79, %asi = 80
	stba	%l2,[%i2+0x03d]%asi	! Mem[000000001008143c] = 90007d79
!	%l7 = 0000000000000000, Mem[000000001000142c] = 000000ff, %asi = 80
	stwa	%l7,[%i0+0x02c]%asi	! Mem[000000001000142c] = 00000000
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = ffbbf195, %l5 = 0000000000000047
	lduw	[%i5+0x038],%l5		! %l5 = 00000000ffbbf195

p0_label_253:
!	Mem[0000000030081400] = 00000054, %l4 = 000000000000004f
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff075f, %l3 = 0000000000000000
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141430] = f83992ff 08c80a6f, %l4 = 00000000, %l5 = ffbbf195
	ldda	[%i5+0x030]%asi,%l4	! %l4 = 00000000f83992ff 0000000008c80a6f
!	Mem[0000000030101408] = 331192ff, %l7 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = ffffffff600000ff, %f4  = 000000ff 000000ff
	ldda	[%i4+%o5]0x81,%f4 	! %f4  = ffffffff 600000ff
!	Mem[00000000211c0000] = 0000d61d, %l3 = 00000000000000ff
	lduh	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1408] = fff90010, %l5 = 0000000008c80a6f
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 000000000000fff9
!	Mem[0000000030141408] = ffffffff, %l0 = 00000000f83992ff
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %f0  = 00000000
	lda	[%i1+%o4]0x89,%f0 	! %f0 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000f83992ff, Mem[0000000010081410] = 00ffffff
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = f83992ff

p0_label_254:
!	%f2  = 0abf9d3c, Mem[0000000010081410] = f83992ff
	sta	%f2 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 0abf9d3c
!	%f0  = 00000000 ff00ffff, Mem[0000000030181410] = 47000000 000000ff
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 ff00ffff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010081400] = 0000ffff 000000ff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 000000ff
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030181408] = ef082f21, %l1 = 0000000008c80a6f
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 00000021000000ff
!	%l5 = 000000000000fff9, Mem[0000000030101400] = 000000ff
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000f9
!	%l6 = 0000000000000000, Mem[0000000010041410] = ffff8cff
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff8c00
!	Mem[0000000030141408] = ffffffff, %l1 = 0000000000000021
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	%f26 = f38e0c76 ffffffff, %l1 = 00000000ffffffff
!	Mem[0000000010101400] = f074df6710c6f9ff
	stda	%f26,[%i4+%l1]ASI_PST32_PL ! Mem[0000000010101400] = ffffffff760c8ef3
!	%l1 = 00000000ffffffff, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 21000000, %l7 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l7	! %l7 = 0000000021000000

p0_label_255:
!	Mem[0000000010041428] = ff00000000006f5a, %f30 = 4ae6ae76 79000000
	ldda	[%i1+0x028]%asi,%f30	! %f30 = ff000000 00006f5a
!	Mem[0000000010181438] = 00000000, %l0 = ffffffffffffffff
	ldsba	[%i6+0x03b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = ff0000ff, %l0 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010101408] = ff0000ffef082f21, %f30 = ff000000 00006f5a
	ldda	[%i4+0x008]%asi,%f30	! %f30 = ff0000ff ef082f21
!	Mem[0000000010101408] = ff0000ffef082f21, %f30 = ff0000ff ef082f21
	ldda	[%i4+%o4]0x80,%f30	! %f30 = ff0000ff ef082f21
!	Mem[00000000300c1400] = 01001715, %l2 = ff000000ff000000
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000100
!	Mem[0000000010141400] = ff00ffff, %l1 = 00000000ffffffff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ff00ffff
!	Mem[0000000030181410] = 00000000 ff00ffff, %l0 = ff0000ff, %l1 = ff00ffff
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000ff00ffff
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000020800041] = 00a82222, %asi = 80
	stba	%l6,[%o1+0x041]%asi	! Mem[0000000020800040] = 00002222

p0_label_256:
!	%l6 = 0000000000000000, Mem[0000000030101410] = ffffffff600000ff
	stxa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	Mem[0000000010181424] = ff16c07e, %l6 = 0000000000000000
	swap	[%i6+0x024],%l6		! %l6 = 00000000ff16c07e
!	%f14 = ff7600fa ffb3ffff, Mem[00000000100c1410] = 4b006715 00000047
	stda	%f14,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff7600fa ffb3ffff
!	%f30 = ff0000ff ef082f21, %l4 = 00000000f83992ff
!	Mem[0000000010001400] = ffffffff3c9dbf0a
	stda	%f30,[%i0+%l4]ASI_PST8_P ! Mem[0000000010001400] = ff0000ffef082f21
!	%l7 = 0000000021000000, Mem[0000000010101400] = ffffffff
	stha	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffff0000
!	Mem[00000000300c1400] = 15170001, %l2 = 0000000000000100
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000001000000ff
!	%l0 = 0000000000000000, Mem[0000000010101408] = ff0000ff
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000030181408] = ef082fff, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f3  = 00000000, Mem[00000000100c1408] = 00000000
	sta	%f3 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000001, %l4 = 00000000f83992ff, %l6 = 00000000ff16c07e
	xnor	%l2,%l4,%l6		! %l6 = ffffffff07c66d01

p0_label_257:
!	Mem[0000000010041410] = 008cffff, %l1 = 00000000ff00ffff
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 00000000008cffff
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000001
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff075f, %l4 = 00000000f83992ff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[00000000100c1408] = 00000000, %l6 = ffffffff07c66d01
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000021000000
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000000000ff, %l4 = 000000000000ffff, %l4 = 000000000000ffff
	and	%l0,%l4,%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101428] = f38e0c76 ffffffff, %l6 = 00000000, %l7 = 00000000
	ldd	[%i4+0x028],%l6		! %l6 = 00000000f38e0c76 00000000ffffffff
!	Mem[0000000030141410] = ffb3ffff, %l0 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffffb3
!	%l6 = 00000000f38e0c76, imm = fffffffffffffa29, %l0 = ffffffffffffffb3
	sub	%l6,-0x5d7,%l0		! %l0 = 00000000f38e124d
!	Starting 10 instruction Store Burst
!	%f26 = f38e0c76 ffffffff, %f1  = ff00ffff
	fdtos	%f26,%f1 		! %f1  = ff800000

p0_label_258:
!	%l2 = 0000000000000000, Mem[0000000030101410] = 0000000000000000
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Mem[0000000010081408] = 76aee6ff, %l0 = 00000000f38e124d
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 0000000076aee6ff
!	%l2 = 0000000000000000, Mem[0000000030101408] = ff921133
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000030081410] = ff000000, %l1 = 00000000008cffff
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = ff7600fa ffb3ffff, %l3 = ffffffffffffffff
!	Mem[00000000100c1418] = f909a6c3ff0000ff
	add	%i3,0x018,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_P ! Mem[00000000100c1418] = ff7600faffb3ffff
!	%f22 = ff9239f8 10c6f9ff, Mem[0000000030001410] = ffffffff 00000000
	stda	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = ff9239f8 10c6f9ff
!	Mem[0000000010141431] = f83992ff, %l2 = 0000000000000000
	ldstuba	[%i5+0x031]%asi,%l2	! %l2 = 00000039000000ff
!	Mem[000000001000140c] = 00000000, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i0+0x00c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = fa0076ff, %l7 = 00000000ffffffff
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 00000000fa0076ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff 15178654, %l2 = 00000039, %l3 = 00000000
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ffffffff 0000000015178654

p0_label_259:
!	Mem[0000000010001410] = 76aee64a, %f26 = f38e0c76
	lda	[%i0+%o5]0x88,%f26	! %f26 = 76aee64a
!	Mem[0000000010101410] = ff000000 00000047, %l0 = 76aee6ff, %l1 = 000000ff
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000047
!	Mem[0000000020800000] = 0047b0a2, %l7 = 00000000fa0076ff
	lduh	[%o1+%g0],%l7		! %l7 = 0000000000000047
!	Mem[0000000030101400] = f900000000000000, %f26 = 76aee64a ffffffff
	ldda	[%i4+%g0]0x81,%f26	! %f26 = f9000000 00000000
!	Mem[0000000010081410] = 0abf9d3c, %l4 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000abf
!	Mem[00000000211c0000] = 0000d61d, %l2 = 00000000ffffffff
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000abf
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 600000ff, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000000000000, imm = fffffffffffffa9f, %l7 = 0000000000000047
	add	%l4,-0x561,%l7		! %l7 = fffffffffffffa9f
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030101410] = 0000000000000000
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000

p0_label_260:
!	%f12 = 6f0ac808, Mem[0000000010001404] = ef082f21
	sta	%f12,[%i0+0x004]%asi	! Mem[0000000010001404] = 6f0ac808
!	%l4 = 00000000, %l5 = 0000fff9, Mem[0000000010181408] = ffffffff f9ff00ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 0000fff9
!	Mem[0000000030141410] = ffb3ffff, %l1 = 0000000000000047
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l0 = ff000000, %l1 = 000000ff, Mem[0000000010081410] = 0abf9d3c ffffffff
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000 000000ff
!	Mem[0000000030101400] = f9000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000f9000000ff
!	Mem[0000000030081400] = 54000000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000054000000
!	%l4 = 00000000, %l5 = 0000fff9, Mem[00000000100c1408] = 00000000 00000000
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 0000fff9
!	%l2 = 00000000000000f9, Mem[0000000010041410] = 008cffff
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00f9ffff
!	Mem[0000000030041410] = 15178654, %l5 = 000000000000fff9
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 0000000000008654
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffff00ff, %l0 = 00000000ff000000
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_261:
!	Mem[0000000010001410] = 0000007976aee64a, %f6  = f074df67 10c6f9ff
	ldda	[%i0+%o5]0x88,%f6 	! %f6  = 00000079 76aee64a
!	Mem[0000000030181410] = 00000000 ff00ffff, %l2 = 000000f9, %l3 = 15178654
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000 00000000ff00ffff
!	%l4 = 0000000000000000, imm = fffffffffffff6f2, %l2 = 0000000000000000
	or	%l4,-0x90e,%l2		! %l2 = fffffffffffff6f2
!	Mem[0000000010101430] = 4ae6ae76, %l5 = 0000000000008654
	lduh	[%i4+0x032],%l5		! %l5 = 000000000000ae76
!	Mem[0000000030081400] = 000000ff, %f8  = 008cdf4b
	lda	[%i2+%g0]0x89,%f8 	! %f8 = 000000ff
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141428] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+0x02a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff075f, %l6 = 00000000f38e0c76
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0xa3c51797e1fbdd67,%g7,%l0 ! %l0 = a3c51797e1fbdd67
!	%l1 = 0000000054000000
	setx	0x28d2ad5faa81de45,%g7,%l1 ! %l1 = 28d2ad5faa81de45
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a3c51797e1fbdd67
	setx	0xcfe61197b950e4e8,%g7,%l0 ! %l0 = cfe61197b950e4e8
!	%l1 = 28d2ad5faa81de45
	setx	0xe4606a2fe02dfc3e,%g7,%l1 ! %l1 = e4606a2fe02dfc3e
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 00000021, %l3 = 00000000ff00ffff
	swap	[%i6+0x014],%l3		! %l3 = 0000000000000021

p0_label_262:
!	%l4 = 0000000000000000, Mem[0000000020800000] = 0047b0a2
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 0000b0a2
!	%l7 = fffffffffffffa9f, Mem[00000000201c0000] = ffff075f
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = fa9f075f
!	%l3 = 0000000000000021, Mem[0000000010101410] = ff000000
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000021
!	Mem[0000000030101400] = 000000ff, %l1 = e4606a2fe02dfc3e
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l7 = fffffffffffffa9f, Mem[0000000010081408] = 4d128ef3
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 9f128ef3
!	%l4 = 0000000000000000, Mem[00000000201c0001] = fa9f075f
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = fa00075f
!	%l7 = fffffffffffffa9f, Mem[0000000030141408] = 00000021
	stwa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = fffffa9f
!	%f26 = f9000000, Mem[00000000100c1408] = 00000000
	sta	%f26,[%i3+%o4]0x88	! Mem[00000000100c1408] = f9000000
!	%l0 = cfe61197b950e4e8, Mem[0000000030101410] = 00000000
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000e4e8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = f9000000, %l4 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_263:
!	%l5 = 000000000000ae76, immed = fffff930, %y  = 00000000
	sdiv	%l5,-0x6d0,%l5		! %l5 = ffffffffffffffe7
	mov	%l0,%y			! %y = b950e4e8
!	Mem[0000000030081408] = ff0000ff, %l7 = fffffffffffffa9f
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041410] = 00f9ffffff8cffff, %f6  = 00000079 76aee64a
	ldda	[%i1+0x010]%asi,%f6 	! %f6  = 00f9ffff ff8cffff
!	Mem[000000001018143c] = 4bdf8c9a, %l0 = cfe61197b950e4e8
	ldsba	[%i6+0x03d]%asi,%l0	! %l0 = ffffffffffffffdf
!	Mem[0000000010181400] = ffffffff, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000020800040] = 00002222, %l0 = ffffffffffffffdf
	ldsb	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081430] = 000067df, %l3 = 0000000000000021
	ldub	[%i2+0x031],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffffff
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ffffffff, %l1 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1438] = 0000ffff, %l2 = fffffffffffff6f2
	ldstub	[%i3+0x038],%l2		! %l2 = 00000000000000ff

p0_label_264:
!	%f23 = 10c6f9ff, Mem[0000000030101400] = e02dfc3e
	sta	%f23,[%i4+%g0]0x89	! Mem[0000000030101400] = 10c6f9ff
!	Mem[0000000021800140] = 3f750a30, %l4 = 000000000000ffff
	ldstub	[%o3+0x140],%l4		! %l4 = 0000003f000000ff
!	Mem[0000000010101420] = 000000ff00000000, %l1 = ffffffffffffffff, %l4 = 000000000000003f
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 000000ff00000000
!	Mem[0000000030141408] = 9ffaffff, %l6 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010081408] = 9f128ef3
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff8ef3
!	Mem[0000000010001410] = 4ae6ae76, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 0000004a000000ff
!	%l4 = 000000ff00000000, Mem[0000000010041400] = 3c9dbf00
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 3c9d0000
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = ffffffffffffffe7, Mem[0000000010181410] = fff90010
	stha	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = fff9ffe7
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffff, %l2 = 000000000000004a
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_265:
!	Mem[0000000030101410] = 0000e4e8, %f15 = ffb3ffff
	lda	[%i4+%o5]0x89,%f15	! %f15 = 0000e4e8
!	Mem[0000000030081410] = ff00000000000047, %f12 = 6f0ac808 ff9239f8
	ldda	[%i2+%o5]0x81,%f12	! %f12 = ff000000 00000047
!	Mem[00000000100c1400] = ffff0000, %l5 = ffffffffffffffe7
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffff0000
!	Mem[0000000030181400] = ff00006054000000, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = ff00006054000000
!	Mem[0000000030101408] = 00000000000000ff, %f20 = ff000000 00000047
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000030041410] = 54861715, %l5 = ffffffffffff0000
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 0000000054861715
!	Mem[00000000211c0000] = 0000d61d, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = ff00006054000000
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff 6f0ac808, %l4 = 00000000, %l5 = 54861715
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff0000ff 000000006f0ac808
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0000e4e8, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 000000000000e4e8

p0_label_266:
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030041400] = ffff00ff 212f0000
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff 00000000
!	%f22 = ff9239f8, Mem[0000000010101408] = 00000000
	sta	%f22,[%i4+%o4]0x80	! Mem[0000000010101408] = ff9239f8
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff0000ffef082f21
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081408] = f38effff
	stba	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = f38eff00
!	%f30 = ff0000ff ef082f21, %l0 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff760c8ef3
	stda	%f30,[%i4+%l0]ASI_PST8_PL ! Mem[0000000010101400] = 0000ffff760c8ef3
!	Mem[0000000010101410] = 21000000, %l1 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041400] = 00009d3c ff0ac808
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[000000001008143f] = 90007d79, %asi = 80
	stba	%l7,[%i2+0x03f]%asi	! Mem[000000001008143c] = 90007d00
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i6+0x008]%asi,%l7	! %l7 = 0000000000000000

p0_label_267:
!	Mem[0000000010001428] = 5a6f000000000000, %f2  = 0abf9d3c 00000000
	ldda	[%i0+0x028]%asi,%f2 	! %f2  = 5a6f0000 00000000
!	Mem[0000000010101400] = 0000ffff, %f10 = ff000000
	lda	[%i4+%g0]0x80,%f10	! %f10 = 0000ffff
!	Mem[0000000030081410] = 000000ff, %l3 = 000000000000e4e8
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000000000ff, %l7 = 0000000000000000, %y  = b950e4e8
	umul	%l6,%l7,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1408] = f9000000, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %f22 = ff9239f8
	lda	[%i4+%o5]0x89,%f22	! %f22 = 00000000
!	Mem[0000000010081414] = 000000ff, %f26 = f9000000
	lda	[%i2+0x014]%asi,%f26	! %f26 = 000000ff
!	Mem[0000000010081420] = 00000079f074ff67, %l6 = 0000000000000000
	ldxa	[%i2+0x020]%asi,%l6	! %l6 = 00000079f074ff67
!	Mem[0000000021800140] = ff750a30, %l6 = 00000079f074ff67
	ldsh	[%o3+0x140],%l6		! %l6 = ffffffffffffff75
!	Starting 10 instruction Store Burst
!	%f13 = 00000047, Mem[0000000010141424] = 4bdf8c00
	sta	%f13,[%i5+0x024]%asi	! Mem[0000000010141424] = 00000047

p0_label_268:
!	Mem[00000000300c1410] = ffff00ff, %l4 = 00000000ff0000ff
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 00000000ffff00ff
!	%l1 = 0000000000000000, Mem[0000000010001408] = ffb3ffff
	stwa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l4 = 00000000ffff00ff, Mem[00000000211c0000] = 0000d61d, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffd61d
!	Mem[0000000010041410] = 00f9ffff, %l6 = ffffffffffffff75, %asi = 80
	swapa	[%i1+0x010]%asi,%l6	! %l6 = 0000000000f9ffff
!	%l4 = 00000000ffff00ff, Mem[0000000010141400] = ff00ffff
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff00ff
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010141410] = ff000000
	stha	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff0000
!	%f14 = ff7600fa 0000e4e8, %l4 = 00000000ffff00ff
!	Mem[0000000030041400] = ff00000000000000
	stda	%f14,[%i1+%l4]ASI_PST16_S ! Mem[0000000030041400] = ff7600fa0000e4e8
!	Mem[0000000010141404] = 00000000, %l6 = 0000000000f9ffff
	swap	[%i5+0x004],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = ff110164, %l5 = 000000006f0ac808
	lduh	[%o3+0x0c0],%l5		! %l5 = 000000000000ff11

p0_label_269:
!	Mem[000000001004140c] = 000000ff, %l1 = 0000000000000000
	ldsb	[%i1+0x00f],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101400] = 0000ffff, %f11 = 00000000
	lda	[%i4+%g0]0x80,%f11	! %f11 = 0000ffff
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000ffff00ff, %l0 = 0000000000000000, %l4 = 00000000ffff00ff
	and	%l4,%l0,%l4		! %l4 = 0000000000000000
!	Mem[0000000010101418] = ff9239f810c6f9ff, %l7 = 0000000000000000
	ldxa	[%i4+0x018]%asi,%l7	! %l7 = ff9239f810c6f9ff
!	Code Fragment 4
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0x733c1ee83c264363,%g7,%l0 ! %l0 = 733c1ee83c264363
!	%l1 = ffffffffffffffff
	setx	0x3d054c57e890aaac,%g7,%l1 ! %l1 = 3d054c57e890aaac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 733c1ee83c264363
	setx	0x805c934fa6d42aaa,%g7,%l0 ! %l0 = 805c934fa6d42aaa
!	%l1 = 3d054c57e890aaac
	setx	0x5037dc4fa03914f5,%g7,%l1 ! %l1 = 5037dc4fa03914f5
!	Mem[0000000010001410] = ffe6ae76, %l3 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = ffffffffffffffe6
!	Mem[0000000010041410] = ffffff75, %l1 = 5037dc4fa03914f5
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffff75
!	Mem[0000000010101408] = ff9239f8ef082f21, %f4  = ffffffff 600000ff
	ldda	[%i4+0x008]%asi,%f4 	! %f4  = ff9239f8 ef082f21
!	Starting 10 instruction Store Burst
!	%l0 = a6d42aaa, %l1 = ffffff75, Mem[0000000010181420] = ffdf74f0 00000000
	std	%l0,[%i6+0x020]		! Mem[0000000010181420] = a6d42aaa ffffff75

p0_label_270:
!	%f2  = 5a6f0000 00000000, Mem[0000000010081400] = 00000000 000000ff
	stda	%f2 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 5a6f0000 00000000
!	%l0 = 805c934fa6d42aaa, Mem[0000000030041408] = 00000000
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00002aaa
!	Mem[0000000010081410] = ff000000, %l5 = 000000000000ff11
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041400] = 00000000, %l1 = ffffffffffffff75
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f27 = 00000000, Mem[0000000030101408] = 000000ff
	sta	%f27,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = ffff0000, %asi = 80
	stwa	%l6,[%i3+0x000]%asi	! Mem[00000000100c1400] = 000000ff
!	%l2 = ffffffffffffffff, Mem[00000000211c0000] = 00ffd61d
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = ffffd61d
!	%f30 = ff0000ff ef082f21, Mem[0000000010001438] = 00000000 50f59cff
	std	%f30,[%i0+0x038]	! Mem[0000000010001438] = ff0000ff ef082f21
!	%l6 = 00000000000000ff, Mem[0000000010041420] = ff000000, %asi = 80
	stha	%l6,[%i1+0x020]%asi	! Mem[0000000010041420] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = fff9c610, %l5 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_271:
!	%f0  = 00000000, %f19 = ef082f21
	fcmpes	%fcc3,%f0 ,%f19		! %fcc3 = 2
!	Mem[0000000010041408] = 00000000000000ff, %l0 = 805c934fa6d42aaa
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041428] = ff000000 00006f5a, %l0 = 000000ff, %l1 = 00000000
	ldd	[%i1+0x028],%l0		! %l0 = 00000000ff000000 0000000000006f5a
!	Mem[0000000010141408] = 00000000, %f29 = ffbbf195
	lda	[%i5+%o4]0x80,%f29	! %f29 = 00000000
!	Mem[0000000010081408] = 00ff8ef3, %f25 = 00000000
	lda	[%i2+%o4]0x80,%f25	! %f25 = 00ff8ef3
!	Mem[0000000010081408] = 00ff8ef3ffbbf195, %f12 = ff000000 00000047
	ldda	[%i2+0x008]%asi,%f12	! %f12 = 00ff8ef3 ffbbf195
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010081408] = 00ff8ef3, %l4 = 00000000ff000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000ff8ef3
!	Mem[0000000010081410] = ff000000 000000ff, %l4 = 00ff8ef3, %l5 = 000000ff
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000006f5a
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_272:
!	Mem[0000000010081400] = 00006f5a, %l2 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 0000005a000000ff
!	Mem[00000000100c1415] = ffb3ffff, %l7 = ff9239f810c6f9ff
	ldstub	[%i3+0x015],%l7		! %l7 = 000000b3000000ff
!	Mem[0000000010081410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l7 = 00000000000000b3, Mem[0000000010141420] = 80956cff00000047
	stx	%l7,[%i5+0x020]		! Mem[0000000010141420] = 00000000000000b3
!	%f29 = 00000000, Mem[0000000010101410] = 210000ff
	sta	%f29,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f30 = ff0000ff, Mem[0000000010181404] = ffffffff
	st	%f30,[%i6+0x004]	! Mem[0000000010181404] = ff0000ff
!	%f22 = 00000000 10c6f9ff, Mem[0000000010141438] = ffbbf195 fa0076ff
	stda	%f22,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000 10c6f9ff
!	Mem[0000000030081400] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%f0  = 00000000 ff800000, Mem[0000000030081410] = 5a6f0000 00000047
	stda	%f0 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 ff800000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_273:
!	Mem[0000000030001408] = ffff8cff, %l6 = 00000000ff000000
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffd61d, %l2 = 000000000000005a
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010181424] = ffffff75, %f0  = 00000000
	ld	[%i6+0x024],%f0 	! %f0 = ffffff75
!	Mem[0000000030101408] = 00000000, %l2 = 000000000000ffff
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = fa00075f, %l2 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000fa00
!	Mem[0000000030081400] = ff000000, %f19 = ef082f21
	lda	[%i2+%g0]0x81,%f19	! %f19 = ff000000
!	Mem[0000000030081408] = 0000000000000000, %l2 = 000000000000fa00
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = fa0076ff, %l6 = ffffffffffffffff
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000076ff
!	Starting 10 instruction Store Burst
!	%f22 = 00000000 10c6f9ff, %l0 = 00000000ff000000
!	Mem[0000000010001418] = fb9706db00000000
	add	%i0,0x018,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001418] = fb9706db00000000

p0_label_274:
!	%f0  = ffffff75 ff800000 5a6f0000 00000000
!	%f4  = ff9239f8 ef082f21 00f9ffff ff8cffff
!	%f8  = 000000ff ff6c9580 0000ffff 0000ffff
!	%f12 = 00ff8ef3 ffbbf195 ff7600fa 0000e4e8
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000030041410] = 54861715, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 0000000054861715
!	%l4 = 00000000ff000000, Mem[00000000100c1400] = 000000ff43bcb1ff
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000ff000000
!	%l0 = ff000000, %l1 = 000000ff, Mem[0000000030101408] = 00000000 00000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 000000ff
!	%l6 = 00000000000076ff, Mem[0000000010001400] = ff0000ff
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000076ff
!	Mem[0000000021800041] = ffc8856a, %l7 = 00000000000000b3
	ldstub	[%o3+0x041],%l7		! %l7 = 000000c8000000ff
!	Mem[0000000010001420] = ffc67b82, %l5 = 0000000000000000
	swap	[%i0+0x020],%l5		! %l5 = 00000000ffc67b82
!	Mem[0000000010181410] = e7fff9ff, %l0 = 00000000ff000000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000e7fff9ff
!	%l4 = 00000000ff000000, Mem[0000000020800000] = 0000b0a2, %asi = 80
	stba	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000b0a2
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = fa00075f, %l7 = 00000000000000c8
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000fa

p0_label_275:
!	Mem[0000000030181408] = ff2f08ef ff0000ff, %l4 = ff000000, %l5 = ffc67b82
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff2f08ef 00000000ff0000ff
!	Mem[0000000030081408] = 00000000, %l2 = 0000000054861715
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l5 = 00000000ff0000ff
	ldsba	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = 00002222, %l2 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 151700ff, %l1 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 95f1bbff f38eff00, %l2 = 00000000, %l3 = ffffffe6
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000f38eff00 0000000095f1bbff
!	Mem[0000000030181400] = 600000ff, %l5 = ffffffffffffffff
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 00000000600000ff
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 00000000e7fff9ff
	setx	0xdc0a3eafb6ed50e0,%g7,%l0 ! %l0 = dc0a3eafb6ed50e0
!	%l1 = 00000000000000ff
	setx	0xea8d64f0391d11f4,%g7,%l1 ! %l1 = ea8d64f0391d11f4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dc0a3eafb6ed50e0
	setx	0xf80449d7d24023cb,%g7,%l0 ! %l0 = f80449d7d24023cb
!	%l1 = ea8d64f0391d11f4
	setx	0xc4cfcd503ce65b19,%g7,%l1 ! %l1 = c4cfcd503ce65b19
!	Mem[0000000010101410] = 00000000, %l0 = f80449d7d24023cb
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000054, Mem[0000000010141424] = 000000b3
	st	%f16,[%i5+0x024]	! Mem[0000000010141424] = 00000054

p0_label_276:
!	%f20 = 00000000 000000ff, %l6 = 00000000000076ff
!	Mem[0000000010181438] = 000000004bdf8c9a
	add	%i6,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_P ! Mem[0000000010181438] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1400] = ff001715
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00001715
!	%l5 = 00000000600000ff, Mem[0000000030081400] = ff000000
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff0000
!	%f1  = ff800000, Mem[00000000100c1408] = 000000f9
	sta	%f1 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff800000
!	%f22 = 00000000 10c6f9ff, Mem[0000000030101400] = fff9c610 00000000
	stda	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 10c6f9ff
!	%l3 = 0000000095f1bbff, %l5 = 00000000600000ff, %l0 = 0000000000000000
	and	%l3,%l5,%l0		! %l0 = 00000000000000ff
!	%l7 = 00000000000000fa, Mem[0000000010141410] = 00ff0000
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00fa0000
!	Mem[00000000100c142c] = 1c0000c8, %l7 = 00000000000000fa
	swap	[%i3+0x02c],%l7		! %l7 = 000000001c0000c8
!	%f6  = 00f9ffff ff8cffff, Mem[00000000300c1408] = fff90010 760000a5
	stda	%f6 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00f9ffff ff8cffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff2f08ef, %l1 = c4cfcd503ce65b19
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000ff2f

p0_label_277:
!	Mem[0000000030181410] = 00000000, %l7 = 000000001c0000c8
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ff00ffff, %l6 = 00000000000076ff
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010081408] = 00ff8ef3, %l6 = ffffffffffffff00
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000ff8ef3
!	%l4 = 00000000ff2f08ef, %l5 = 00000000600000ff, %l0 = 00000000000000ff
	xor	%l4,%l5,%l0		! %l0 = 000000009f2f0810
!	Mem[0000000010081438] = 6f0ac808, %l7 = 0000000000000000
	ldub	[%i2+0x039],%l7		! %l7 = 000000000000000a
!	Mem[0000000030001408] = ff8cffff, %l7 = 000000000000000a
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = ffff8cff ffff8cff, %l6 = 00ff8ef3, %l7 = 000000ff
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffff8cff 00000000ffff8cff
!	Mem[0000000030181410] = 00000000, %f31 = ef082f21
	lda	[%i6+%o5]0x89,%f31	! %f31 = 00000000
!	Mem[00000000300c1408] = 00f9ffff, %l0 = 000000009f2f0810
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000f9ffff
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ff2f, Mem[0000000010081400] = ff6f0000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 2f6f0000

p0_label_278:
!	Mem[0000000030181410] = 00000000, %l2 = 00000000f38eff00
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f0  = ffffff75 ff800000 5a6f0000 00000000
!	%f4  = ff9239f8 ef082f21 00f9ffff ff8cffff
!	%f8  = 000000ff ff6c9580 0000ffff 0000ffff
!	%f12 = 00ff8ef3 ffbbf195 ff7600fa 0000e4e8
	stda	%f0,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[0000000010101408] = ff9239f8, %l5 = 00000000600000ff
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181410] = f38eff00, %l3 = 0000000095f1bbff
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000f3000000ff
!	%l4 = ff2f08ef, %l5 = 000000ff, Mem[0000000030181400] = 600000ff 00000054
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = ff2f08ef 000000ff
!	%l4 = 00000000ff2f08ef, Mem[0000000010181408] = 00000000
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 08ef0000
!	%l5 = 00000000000000ff, Mem[0000000010101408] = ff9239f8ef082f21
	stxa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	%f26 = 000000ff 00000000, Mem[00000000100c1400] = 00000000 ff000000
	stda	%f26,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00000000
	membar	#Sync			! Added by membar checker (34)
!	%l6 = ffff8cff, %l7 = ffff8cff, Mem[0000000010141400] = ff00ffff 00f9ffff
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff8cff ffff8cff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffff8cffffff8cff, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = ffff8cffffff8cff

p0_label_279:
!	Mem[0000000030041400] = fa0076ff, %l4 = 00000000ff2f08ef
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030181410] = ff8eff00, %l1 = 000000000000ff2f
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = ffffffffff8eff00
!	Mem[0000000030041410] = fff9c610 00000000, %l2 = 00000000, %l3 = 000000f3
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000fff9c610
!	Mem[0000000010181434] = 43bcb1ff, %l1 = ffffffffff8eff00
	ldsw	[%i6+0x034],%l1		! %l1 = 0000000043bcb1ff
!	%l2 = 0000000000000000, imm = 000000000000014a, %l2 = 0000000000000000
	xnor	%l2,0x14a,%l2		! %l2 = fffffffffffffeb5
!	Mem[0000000030081400] = ff0000600000ff00, %l5 = ffff8cffffff8cff
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = ff0000600000ff00
!	Mem[0000000010101410] = 00000000, %l1 = 0000000043bcb1ff
	lduha	[%i4+0x012]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041414] = ef082f21, %f1  = ff800000
	ld	[%i1+0x014],%f1 	! %f1 = ef082f21
!	Mem[000000001004142c] = 0000ffff, %l7 = 00000000ffff8cff
	ldsw	[%i1+0x02c],%l7		! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffff8cff, %l5 = ff0000600000ff00, %l0 = 0000000000f9ffff
	sub	%l6,%l5,%l0		! %l0 = 00ffffa0fffe8dff

p0_label_280:
!	%f24 = 000000ff, Mem[0000000010101410] = 00000000
	sta	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l0 = 00ffffa0fffe8dff, Mem[000000001010140a] = 00000000
	sth	%l0,[%i4+0x00a]		! Mem[0000000010101408] = 00008dff
!	Mem[0000000030101400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1414] = ffffffff, %l0 = 00ffffa0fffe8dff, %asi = 80
	swapa	[%i3+0x014]%asi,%l0	! %l0 = 00000000ffffffff
!	%l2 = fffffeb5, %l3 = fff9c610, Mem[0000000010101430] = 4ae6ae76 ffbbf195
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = fffffeb5 fff9c610
!	Mem[0000000030081408] = 00000000, %l3 = 00000000fff9c610
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800000] = ff0037ea, %l2 = fffffffffffffeb5
	ldstuba	[%o3+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1400] = ff000000
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	%l0 = 00000000ffffffff, Mem[0000000021800101] = b7ff6d5f, %asi = 80
	stba	%l0,[%o3+0x101]%asi	! Mem[0000000021800100] = b7ff6d5f
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff9239f8ef082f21, %f8  = 000000ff ff6c9580
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = ff9239f8 ef082f21

p0_label_281:
!	Mem[00000000300c1410] = ff0000ff, %l6 = 00000000ffff8cff
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = fa00075f, %l4 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000fa
!	Mem[0000000021800140] = ff750a30, %l1 = 0000000000000000
	ldsba	[%o3+0x141]%asi,%l1	! %l1 = 0000000000000075
!	Mem[0000000010081408] = 95f1bbff f38eff00, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000f38eff00 0000000095f1bbff
!	Mem[0000000010101430] = fffffeb5, %l2 = 00000000000000ff
	ldsh	[%i4+0x030],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000021800040] = ffff856a, %l6 = 00000000f38eff00
	lduh	[%o3+0x040],%l6		! %l6 = 000000000000ffff
!	Mem[00000000100c1400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010141400] = ffff8cff ffff8cff 00000000 3c9dbf0a
!	Mem[0000000010141410] = 00fa0000 ff000000 fff9c610 67df74f0
!	Mem[0000000010141420] = 00000000 00000054 00000000 000000ff
!	Mem[0000000010141430] = f8ff92ff 08c80a6f 00000000 10c6f9ff
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[00000000100c1410] = ffffffff fffe8dff, %l6 = 0000ffff, %l7 = 95f1bbff
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 00000000ffffffff 00000000fffe8dff
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = 0000fff9, %l3 = 00000000, %l3 = 00000000
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000000000fff9

p0_label_282:
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000000075
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030001410] = fff9c610
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00f9c610
!	%f20 = 00000000, Mem[0000000010101400] = ffff0000
	sta	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
	membar	#Sync			! Added by membar checker (36)
!	%l5 = ff0000600000ff00, Mem[0000000010141414] = ff000000, %asi = 80
	stba	%l5,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000000
!	%l5 = ff0000600000ff00, Mem[00000000300c1408] = 00f9ffffff8cffff
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0000600000ff00
!	%f9  = 00000054, Mem[0000000010001400] = ff760000
	sta	%f9 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000054
!	Code Fragment 4
p0_fragment_25:
!	%l0 = 00000000ffffffff
	setx	0x7139d827f4d5940d,%g7,%l0 ! %l0 = 7139d827f4d5940d
!	%l1 = 0000000000000000
	setx	0x28e27bc8092670b5,%g7,%l1 ! %l1 = 28e27bc8092670b5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7139d827f4d5940d
	setx	0xaafdee905102769c,%g7,%l0 ! %l0 = aafdee905102769c
!	%l1 = 28e27bc8092670b5
	setx	0x211d495ff57f3eb1,%g7,%l1 ! %l1 = 211d495ff57f3eb1
!	%l6 = 00000000ffffffff, Mem[0000000010001400] = 540000006f0ac808
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000ffffffff
!	%l3 = 000000000000fff9, Mem[0000000010141418] = fff9c61067df74f0
	stx	%l3,[%i5+0x018]		! Mem[0000000010141418] = 000000000000fff9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 6f0ac808, %l4 = 00000000000000fa
	lduwa	[%i2+0x038]%asi,%l4	! %l4 = 000000006f0ac808

p0_label_283:
!	Mem[0000000010081428] = ff0000604bdf8cff, %f2  = 00000000 3c9dbf0a
	ldda	[%i2+0x028]%asi,%f2 	! %f2  = ff000060 4bdf8cff
!	Mem[0000000030181400] = ff2f08ef, %l5 = ff0000600000ff00
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ef
!	Mem[0000000030141410] = ff9239f8, %l5 = 00000000000000ef
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 000000000000ff92
!	Mem[0000000010181410] = ff000000, %l2 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 2f6f0000 00000000, %l2 = 000000ff, %l3 = 0000fff9
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 000000002f6f0000 0000000000000000
!	Mem[0000000010081410] = 000000ff, %f12 = f8ff92ff
	lda	[%i2+%o5]0x80,%f12	! %f12 = 000000ff
!	Mem[0000000010041408] = 00006f5a, %l1 = 211d495ff57f3eb1
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 000000000000005a
!	Mem[0000000010041410] = 212f08eff83992ff, %f26 = 000000ff 00000000
	ldda	[%i1+%o5]0x88,%f26	! %f26 = 212f08ef f83992ff
!	Mem[0000000010041438] = ff7600fa, %l7 = 00000000fffe8dff
	ldsh	[%i1+0x03a],%l7		! %l7 = 00000000000000fa
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 10c6f9ff, %l2 = 000000002f6f0000, %asi = 80
	swapa	[%i4+0x01c]%asi,%l2	! %l2 = 0000000010c6f9ff

p0_label_284:
!	%f21 = 000000ff, Mem[00000000100c1408] = ff800000
	sta	%f21,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ff
!	Mem[000000001000141c] = 00000000, %l1 = 000000000000005a
	ldstub	[%i0+0x01c],%l1		! %l1 = 00000000000000ff
!	%l7 = 00000000000000fa, Mem[0000000021800100] = b7ff6d5f
	sth	%l7,[%o3+0x100]		! Mem[0000000021800100] = 00fa6d5f
!	%f4  = 00fa0000, Mem[0000000010141430] = f8ff92ff
	sta	%f4 ,[%i5+0x030]%asi	! Mem[0000000010141430] = 00fa0000
!	Mem[00000000300c1410] = ff0000ff, %l4 = 000000006f0ac808
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l6 = 00000000ffffffff, Mem[0000000010001404] = ffffffff, %asi = 80
	stwa	%l6,[%i0+0x004]%asi	! Mem[0000000010001404] = ffffffff
!	%l4 = 000000ff, %l5 = 0000ff92, Mem[0000000030081410] = ff000000 ff800000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 0000ff92
!	%l0 = aafdee905102769c, Mem[0000000010001404] = ffffffff
	stw	%l0,[%i0+0x004]		! Mem[0000000010001404] = 5102769c
!	%l2 = 10c6f9ff, %l3 = 00000000, Mem[0000000030001410] = 10c6f900 ff9239f8
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 10c6f9ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffd61d, %l6 = 00000000ffffffff
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff

p0_label_285:
!	Mem[00000000300c1410] = ff0000ff 000000ff, %l6 = 000000ff, %l7 = 000000fa
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff0000ff 00000000000000ff
!	Mem[0000000030181410] = 00ff8eff, %l4 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000008eff
!	Mem[00000000201c0000] = fa00075f, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000fa00
!	Mem[0000000010001408] = 00000000, %l2 = 0000000010c6f9ff
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ffffffff15178654, %f18 = ff0000ff ff000000
	ldda	[%i0+%g0]0x81,%f18	! %f18 = ffffffff 15178654
!	Mem[0000000010081400] = 2f6f000000000000, %l4 = 0000000000008eff
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 2f6f000000000000
!	Mem[0000000030001400] = ffffffff, %l0 = aafdee905102769c
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = 00fa0000, %l5 = 000000000000ff92
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000fa0000
!	Mem[0000000010001400] = 9c76025100000000, %l4 = 2f6f000000000000
	ldxa	[%i0+%g0]0x88,%l4	! %l4 = 9c76025100000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffff8cff, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ffff8cff

p0_label_286:
!	%f2  = ff000060, %f8  = 00000000
	fcmps	%fcc3,%f2 ,%f8 		! %fcc3 = 1
!	Mem[0000000010141408] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l7 = 00000000ffff8cff, Mem[0000000010041408] = 00006f5a
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00008cff
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l7 = 00000000ffff8cff, Mem[000000001004142c] = 0000ffff
	stw	%l7,[%i1+0x02c]		! Mem[000000001004142c] = ffff8cff
!	%l7 = 00000000ffff8cff, Mem[0000000030101410] = 00000000
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff8cff
!	Mem[0000000010081424] = f074ff67, %l6 = ff0000ff, %l3 = 00000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 00000000f074ff67
!	%l0 = 0000000000000000, Mem[0000000010081400] = 2f6f0000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l5 = 0000000000fa0000, Mem[0000000010081410] = 000000ff
	stwa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00fa0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffffff, %l5 = 0000000000fa0000
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 000000000000ffff

p0_label_287:
!	Mem[0000000010101408] = ff8d0000, %l6 = 00000000ff0000ff
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = ffffffffff8d0000
!	Mem[0000000010181410] = ff000000, %l7 = 00000000ffff8cff
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030181400] = 000000ffff2f08ef, %l4 = 9c76025100000000
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = 000000ffff2f08ef
!	Mem[0000000010141410] = 00fa0000, %l4 = 000000ffff2f08ef
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = f9ff00000000ef08, %l4 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = f9ff00000000ef08
!	Mem[0000000010041400] = 75ffffff, %l3 = 00000000f074ff67
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141410] = 000000000000fa00, %f26 = 212f08ef f83992ff
	ldda	[%i5+%o5]0x88,%f26	! %f26 = 00000000 0000fa00
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041410] = ff9239f8, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffff92
!	Starting 10 instruction Store Burst
!	%l6 = ff8d0000, %l7 = ff000000, Mem[00000000300c1408] = 600000ff 00ff0000
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff8d0000 ff000000

p0_label_288:
!	%l6 = ffffffffff8d0000, Mem[0000000010141408] = ffffffff
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ff8d0000
!	%l2 = ffffffffffffff92, Mem[0000000010001418] = fb9706db, %asi = 80
	stha	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = ff9206db
!	%l5 = 000000000000ffff, Mem[0000000010041400] = ffffff75
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ffff
!	%l7 = 00000000ff000000, Mem[0000000010041406] = ff800000, %asi = 80
	stha	%l7,[%i1+0x006]%asi	! Mem[0000000010041404] = ff800000
!	%f28 = 4ae6ae76 00000000, Mem[0000000010081418] = 00ff3ca9 00ff51a8
	std	%f28,[%i2+0x018]	! Mem[0000000010081418] = 4ae6ae76 00000000
!	Mem[0000000030001400] = ffffffff, %l3 = 000000000000ffff
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001014141c] = 0000fff9, %l1 = 0000fa00, %l5 = 0000ffff
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 000000000000fff9
!	%l4 = f9ff00000000ef08, Mem[0000000010181434] = 43bcb1ff
	stw	%l4,[%i6+0x034]		! Mem[0000000010181434] = 0000ef08
!	Mem[0000000010101400] = 00000000, %l2 = ffffffffffffff92
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l0 = 000000000000ff00
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_289:
!	Mem[0000000010081438] = 6f0ac80890007d00, %f22 = 00000000 10c6f9ff
	ldd	[%i2+0x038],%f22	! %f22 = 6f0ac808 90007d00
!	Mem[0000000030181400] = ef082fff, %l7 = 00000000ff000000
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = ffffffffef082fff
!	Mem[0000000030181410] = ffff00ff 00ff8eff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 0000000000ff8eff 00000000ffff00ff
!	Mem[0000000010041400] = ffff0000, %l6 = ffffffffff8d0000
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = f9ff0000ff000000, %f0  = ffff8cff ffff8cff
	ldda	[%i3+%o4]0x88,%f0 	! %f0  = f9ff0000 ff000000
!	Mem[000000001014142c] = 000000ff, %f3  = 4bdf8cff
	lda	[%i5+0x02c]%asi,%f3 	! %f3 = 000000ff
!	Mem[0000000030101410] = ffff8cff00000000, %f2  = ff000060 000000ff
	ldda	[%i4+%o5]0x81,%f2 	! %f2  = ffff8cff 00000000
!	Mem[0000000010141408] = 00008dff, %f24 = 000000ff
	lda	[%i5+%o4]0x80,%f24	! %f24 = 00008dff
!	Mem[0000000010101410] = 000000ff, %l4 = f9ff00000000ef08
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ffffffff, %l0 = 0000000000000000
	swap	[%i6+%g0],%l0		! %l0 = 00000000ffffffff

p0_label_290:
!	%l3 = 00000000ffff00ff, Mem[00000000201c0000] = fa00075f, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff00075f
!	%l3 = 00000000ffff00ff, Mem[0000000010001430] = ffff0000000074f0, %asi = 80
	stxa	%l3,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000ffff00ff
!	%l7 = ffffffffef082fff, imm = 0000000000000bcc, %l7 = ffffffffef082fff
	xnor	%l7,0xbcc,%l7		! %l7 = 0000000010f7dbcc
!	%l1 = 000000000000fa00, Mem[0000000030081400] = 00ff0000
	stwa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000fa00
!	Mem[0000000010101428] = f38e0c76ffffffff, %l3 = 00000000ffff00ff, %l0 = 00000000ffffffff
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = f38e0c76ffffffff
!	%f6  = fff9c610 67df74f0, Mem[0000000010081408] = 00ff8ef3 ffbbf195
	stda	%f6 ,[%i2+%o4]0x80	! Mem[0000000010081408] = fff9c610 67df74f0
!	%f24 = 00008dff 00ff8ef3, Mem[0000000030001410] = fff9c610 00000000
	stda	%f24,[%i0+%o5]0x81	! Mem[0000000030001410] = 00008dff 00ff8ef3
!	%f14 = 00000000 10c6f9ff, %l3 = 00000000ffff00ff
!	Mem[0000000030141420] = 000000ffff6c9580
	add	%i5,0x020,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141420] = 0000000010c6f9ff
!	Mem[0000000010141404] = ffff8cff, %l7 = 0000000010f7dbcc
	swap	[%i5+0x004],%l7		! %l7 = 00000000ffff8cff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = ff0000ffef082f21, %f18 = ffffffff 15178654
	ldd	[%i0+0x038],%f18	! %f18 = ff0000ff ef082f21

p0_label_291:
!	Mem[00000000300c1408] = 00008dff 000000ff, %l0 = ffffffff, %l1 = 0000fa00
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000008dff 00000000000000ff
!	Mem[0000000010141410] = 0000fa00, %l2 = 0000000000ff8eff
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 000000000000fa00
!	Mem[0000000030081410] = 92ff0000 ff000000, %l2 = 0000fa00, %l3 = ffff00ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000ff000000 0000000092ff0000
!	Mem[0000000010081410] = 00fa0000 000000ff, %l0 = 00008dff, %l1 = 000000ff
	ldd	[%i2+%o5],%l0		! %l0 = 0000000000fa0000 00000000000000ff
!	Mem[0000000010181410] = ff000000, %l7 = 00000000ffff8cff
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030181410] = 00ff8eff, %f18 = ff0000ff
	lda	[%i6+%o5]0x89,%f18	! %f18 = 00ff8eff
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = fff9c610, %l5 = 000000000000fff9
	lduba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %f17 = 600000ff
	lda	[%i4+%o4]0x81,%f17	! %f17 = ff000000
!	Starting 10 instruction Store Burst
!	%l0 = 00fa0000, %l1 = 000000ff, Mem[0000000010101410] = 000000ff 47000000
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00fa0000 000000ff

p0_label_292:
!	%l4 = 00000000000000ff, Mem[0000000030101400] = 000000ff10c6f9ff
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 00000000ff000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000010181420] = a6d42aaa
	stw	%l1,[%i6+0x020]		! Mem[0000000010181420] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000020800040] = 00002222
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00ff2222
!	%l1 = 00000000000000ff, Mem[0000000010081400] = 000000ff
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l0 = 0000000000fa0000, %l1 = 00000000000000ff, %y  = 00000000
	sdiv	%l0,%l1,%l6		! %l6 = 000000000000fafa
	mov	%l0,%y			! %y = 00fa0000
!	%l0 = 0000000000fa0000, Mem[0000000030181408] = ff2f08ef
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 002f08ef
!	%l3 = 0000000092ff0000, Mem[0000000010101408] = 00008dff
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 00008dff
!	Mem[0000000010081408] = 10c6f9ff, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff9239f8, %l6 = 000000000000fafa
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_293:
!	Mem[0000000030001408] = ffff8cff, %l1 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1410] = ff0000ff, %l1 = 000000000000ffff
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = ffffffffff0000ff
!	%f23 = 90007d00, %f19 = ef082f21, %f18 = 00ff8eff
	fadds	%f23,%f19,%f18		! %f18 = ef082f21
!	Mem[0000000030141410] = ff9239f8ef082f21, %l0 = 0000000000fa0000
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = ff9239f8ef082f21
!	Code Fragment 3
p0_fragment_26:
!	%l0 = ff9239f8ef082f21
	setx	0xcfe22fbf82dc2ff2,%g7,%l0 ! %l0 = cfe22fbf82dc2ff2
!	%l1 = ffffffffff0000ff
	setx	0x9cb7924826c7ce35,%g7,%l1 ! %l1 = 9cb7924826c7ce35
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cfe22fbf82dc2ff2
	setx	0x1d748680731205e0,%g7,%l0 ! %l0 = 1d748680731205e0
!	%l1 = 9cb7924826c7ce35
	setx	0x1f26085858309034,%g7,%l1 ! %l1 = 1f26085858309034
!	Mem[0000000010081408] = fff9c61067df74f0, %l6 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = fff9c61067df74f0
!	Mem[0000000010141410] = 0000fa00, %l2 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 000000000000fa00
!	Mem[0000000010141408] = 00008dff, %l2 = 000000000000fa00
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000008dff
!	Mem[00000000300c1400] = fff9c610 15170000, %l0 = 731205e0, %l1 = 58309034
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000015170000 00000000fff9c610
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = fff9c610, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000fff9c610

p0_label_294:
!	Mem[000000001008140a] = 000000ff, %l6 = fff9c61067df74f0
	ldstuba	[%i2+0x00a]%asi,%l6	! %l6 = 00000000000000ff
!	%f26 = 00000000 0000fa00, Mem[0000000030101408] = 000000ff ff000000
	stda	%f26,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 0000fa00
!	%l0 = 15170000, %l1 = fff9c610, Mem[0000000010001408] = 00000000 ffffffff
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 15170000 fff9c610
!	%f20 = 00000000 000000ff, Mem[0000000010101408] = ff8d0000 ff000000
	stda	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 000000ff
!	Mem[0000000030181408] = 002f08ef, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l7 = ffffffffffffff00
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010101410] = 0000fa00, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 00fa0000, %l1 = 00000000fff9c610
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000fa0000
!	%f10 = 00000000 000000ff, %l0 = 0000000015170000
!	Mem[00000000100c1420] = 9c6a17153c9d0000
	add	%i3,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_PL ! Mem[00000000100c1420] = 9c6a17153c9d0000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffd61d, %l5 = 00000000fff9c610
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff

p0_label_295:
!	Mem[0000000030001408] = ff8cffff, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = ffffffffff8cffff
!	Mem[0000000021800080] = 257e727f, %l6 = ffffffffff8cffff
	ldsba	[%o3+0x080]%asi,%l6	! %l6 = 0000000000000025
!	Mem[0000000030141410] = ff9239f8ef082f21, %f10 = 00000000 000000ff
	ldda	[%i5+%o5]0x81,%f10	! %f10 = ff9239f8 ef082f21
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000092ff0000
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 10c6f9ff, %l1 = 0000000000fa0000
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141400] = ffffff75, %l7 = 00000000ff000000
	ldsha	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ffffffff, %f8  = 00000000
	lda	[%i0+%g0]0x89,%f8 	! %f8 = ffffffff
!	Mem[0000000010081400] = ffffff00, %l4 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ffffff00
!	Mem[00000000300c1400] = 00001715, %l7 = ffffffffffffffff
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010181408] = 0000ef08
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ffff

p0_label_296:
!	Mem[0000000030081400] = 0000fa00, %l1 = ffffffffffffffff
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 000000000000fa00
!	Mem[0000000030101400] = 00000000, %l4 = 00000000ffffff00
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041406] = ff800000, %l3 = ffffffffffffffff
	ldstuba	[%i1+0x006]%asi,%l3	! %l3 = 00000000000000ff
!	%f18 = ef082f21 ef082f21, Mem[0000000030181410] = ff8eff00 ff00ffff
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = ef082f21 ef082f21
!	Mem[0000000010041410] = f83992ff, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1400] = 00001715, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 000000000000fa00, Mem[00000000100c143c] = 000000ff, %asi = 80
	stwa	%l1,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 0000fa00
!	%f18 = ef082f21 ef082f21, Mem[0000000010081408] = 0000ffff 67df74f0
	std	%f18,[%i2+%o4]	! Mem[0000000010081408] = ef082f21 ef082f21
!	%l6 = 0000000000000025, Mem[0000000020800000] = 0000b0a2, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 0025b0a2
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = fa0076ff, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = fffffffffa0076ff

p0_label_297:
!	Mem[0000000030001408] = ffff8cff, %l5 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = fa0076ff, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = ff0000ff, %f28 = 4ae6ae76
	lda	[%i3+%o5]0x89,%f28	! %f28 = ff0000ff
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001008142c] = 4bdf8cff, %l3 = ffffffffffffffff
	ldsba	[%i2+0x02f]%asi,%l3	! %l3 = ffffffffffffffff
!	%l2 = 0000000000008dff, imm = fffffffffffff685, %l7 = 0000000000000000
	or	%l2,-0x97b,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 212f08ef f83992ff, %l4 = fa0076ff, %l5 = ffffffff
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000f83992ff 00000000212f08ef
!	Mem[0000000030001410] = 00008dff, %l5 = 00000000212f08ef
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = fff9c610, %f26 = 00000000
	lda	[%i2+%o4]0x81,%f26	! %f26 = fff9c610
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1414] = fffe8dff, %l1 = 000000000000fa00
	swap	[%i3+0x014],%l1		! %l1 = 00000000fffe8dff

p0_label_298:
!	%f2  = ffff8cff, Mem[00000000300c1408] = 00008dff
	sta	%f2 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff8cff
!	%l1 = 00000000fffe8dff, Mem[0000000010181410] = 000000ff
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = fffe8dff
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000008dff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000201c0001] = ff00075f
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = ff00075f
!	%l6 = 0000000000000025, Mem[0000000030001400] = ffffffff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000025
!	%l2 = 0000000000000000, Mem[0000000030181410] = 212f08ef212f08ef
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030001400] = 00000025
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l5 = 0000000000000000, Mem[000000001014140c] = 3c9dbf0a
	stw	%l5,[%i5+0x00c]		! Mem[000000001014140c] = 00000000
!	%l4 = 00000000f83992ff, Mem[0000000030001400] = 0000000015178654
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000f83992ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = f9ff0000ff000000, %f12 = 000000ff 08c80a6f
	ldda	[%i3+%o4]0x88,%f12	! %f12 = f9ff0000 ff000000

p0_label_299:
!	Mem[0000000030081408] = 10c6f9ff, %l0 = 0000000015170000
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ff00075f, %l5 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ff8cffff, %l3 = ffffffffffffffff
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = ff00075f, %l2 = 0000000000000000
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ff00
!	Mem[0000000010001410] = 00000079 76aee6ff, %l0 = ffffffff, %l1 = fffe8dff
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000076aee6ff 0000000000000079
!	%l7 = ffffffffffffffff, %l3 = ffffffffffffffff, %l3 = ffffffffffffffff
	addc	%l7,%l3,%l3		! %l3 = fffffffffffffffe
!	Mem[000000001000141c] = ff000000, %l2 = 000000000000ff00
	ldsh	[%i0+0x01e],%l2		! %l2 = 0000000000000000
!	%f15 = 10c6f9ff, %f20 = 00000000, %f20 = 00000000 000000ff
	fsmuld	%f15,%f20,%f20		! %f20 = 00000000 00000000
!	%f17 = ff000000, %f6  = fff9c610
	fcmps	%fcc2,%f17,%f6 		! %fcc2 = 3
!	Starting 10 instruction Store Burst
!	%l6 = 00000025, %l7 = ffffffff, Mem[0000000010101430] = fffffeb5 fff9c610
	std	%l6,[%i4+0x030]		! Mem[0000000010101430] = 00000025 ffffffff

p0_label_300:
!	%l3 = fffffffffffffffe, Mem[0000000010181434] = 0000ef08
	stw	%l3,[%i6+0x034]		! Mem[0000000010181434] = fffffffe
!	%f3  = 00000000, %f19 = ef082f21, %f28 = ff0000ff
	fmuls	%f3 ,%f19,%f28		! %f28 = 80000000
!	%l6 = 0000000000000025, Mem[0000000010001430] = 00000000
	stw	%l6,[%i0+0x030]		! Mem[0000000010001430] = 00000025
!	%l0 = 0000000076aee6ff, Mem[0000000010041410] = ff9239f8ef082f21
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000076aee6ff
!	%l6 = 0000000000000025, Mem[0000000030041410] = fff9c61000000000
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000025
!	%l0 = 0000000076aee6ff, Mem[0000000030081400] = ffffffff
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffe6ff
!	%f13 = ff000000, %f17 = ff000000, %f14 = 00000000
	fsubs	%f13,%f17,%f14		! %f14 = 00000000
!	%f16 = 00000054 ff000000 ef082f21 ef082f21
!	%f20 = 00000000 00000000 6f0ac808 90007d00
!	%f24 = 00008dff 00ff8ef3 fff9c610 0000fa00
!	%f28 = 80000000 00000000 ff0000ff 00000000
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l5 = 0000000000000000, Mem[0000000030041410] = 0000000000000025
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ef082fff, %l4 = 00000000f83992ff
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffffef

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	add	%l6,%l6,%l7
	ldda	[%i5+0x010]%asi,%l0
	sdivx	%l3,0xbe1,%l7
	stda	%l0,[%i2+0x038]%asi
	nop
	nop
	stda	%l0,[%i2+0x000]%asi
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000076aee6ff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000079
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be fffffffffffffffe
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffef
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000025
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00fa0000,%g2
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
	cmp	%l0,%l1			! %f0  should be f9ff0000 ff000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ffff8cff 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00fa0000 ff000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be fff9c610 67df74f0
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be ffffffff 00000054
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ff9239f8 ef082f21
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be f9ff0000 ff000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 10c6f9ff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000054 ff000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ef082f21 ef082f21
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 6f0ac808 90007d00
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00008dff 00ff8ef3
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be fff9c610 0000fa00
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 80000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff0000ff 00000000
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
	sdivx	%l3,%l2,%l3
	xnor	%l4,%l3,%l1
	swapa	[%i0+%o5]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010001410]
	or	%l3,-0x241,%l1
	done

p0_trap1o:
	sdivx	%l3,%l2,%l3
	xnor	%l4,%l3,%l1
	swapa	[%o0+%i5]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010001410]
	or	%l3,-0x241,%l1
	done


p0_trap2e:
	sub	%l2,%l5,%l5
	fsubs	%f11,%f10,%f8 
	fcmps	%fcc1,%f1 ,%f6 
	done

p0_trap2o:
	sub	%l2,%l5,%l5
	fsubs	%f11,%f10,%f8 
	fcmps	%fcc1,%f1 ,%f6 
	done


p0_trap3e:
	xor	%l6,-0x301,%l0
	addc	%l5,%l2,%l3
	addc	%l6,%l1,%l6
	add	%l7,%l2,%l7
	addc	%l4,%l6,%l1
	done

p0_trap3o:
	xor	%l6,-0x301,%l0
	addc	%l5,%l2,%l3
	addc	%l6,%l1,%l6
	add	%l7,%l2,%l7
	addc	%l4,%l6,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = 53b56d46796a3c0d
	ldx	[%g1+0x008],%l1		! %l1 = 2b27ea2462dc5403
	ldx	[%g1+0x010],%l2		! %l2 = 7cbb9ac42227a401
	ldx	[%g1+0x018],%l3		! %l3 = cb28e64fea7dc761
	ldx	[%g1+0x020],%l4		! %l4 = d6af4185c2f18f19
	ldx	[%g1+0x028],%l5		! %l5 = f874f9669e6f5b68
	ldx	[%g1+0x030],%l6		! %l6 = 0b8253045add27a6
	ldx	[%g1+0x038],%l7		! %l7 = c996b5e239d01844

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
	sdivx	%l3,%l2,%l3
	and	%l3,%l4,%l7
	orn	%l1,0x086,%l3
	jmpl	%o7,%g0
	or	%l2,0x26e,%l0
p0_near_0_he:
	sub	%l0,-0x08e,%l0
	fdivs	%f30,%f25,%f16
	sdivx	%l0,0xd48,%l2
	jmpl	%o7,%g0
	add	%l6,%l0,%l2
near0_b2b_h:
	sdivx	%l6,%l5,%l0
	subc	%l1,%l4,%l6
	fcmps	%fcc2,%f19,%f21
	fitod	%f18,%f26
	addc	%l0,%l4,%l6
	jmpl	%o7,%g0
	xnor	%l6,%l7,%l5
near0_b2b_l:
	fsqrts	%f14,%f9 
	andn	%l3,%l4,%l4
	and	%l7,%l4,%l1
	fsubs	%f1 ,%f10,%f10
	mulx	%l0,0xfc2,%l6
	jmpl	%o7,%g0
	andn	%l1,%l3,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fsqrts	%f2 ,%f15
	fitos	%f9 ,%f3 
	subc	%l3,%l7,%l0
	jmpl	%o7,%g0
	fsqrts	%f15,%f7 
p0_near_1_he:
	umul	%l6,0x6f3,%l7
	udivx	%l5,%l4,%l4
	smul	%l7,-0xcb6,%l4
	fdivs	%f20,%f24,%f27
	fitod	%f22,%f30
	sub	%l4,-0xc34,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f17,%f23
near1_b2b_h:
	mulx	%l3,-0x36f,%l1
	fsubs	%f22,%f25,%f16
	fmuls	%f21,%f16,%f25
	jmpl	%o7,%g0
	xor	%l3,%l1,%l6
near1_b2b_l:
	fcmps	%fcc2,%f3 ,%f6 
	or	%l5,%l2,%l1
	andn	%l7,0x708,%l7
	jmpl	%o7,%g0
	mulx	%l3,-0xc24,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	udivx	%l6,%l2,%l0
	orn	%l0,0x3da,%l4
	smul	%l0,0xe4a,%l1
	and	%l6,-0x252,%l3
	jmpl	%o7,%g0
	addc	%l4,%l0,%l5
p0_near_2_he:
	sub	%l5,0x1a6,%l4
	jmpl	%o7,%g0
	sdivx	%l0,0x818,%l3
near2_b2b_h:
	fsubs	%f27,%f23,%f16
	fadds	%f18,%f22,%f24
	jmpl	%o7,%g0
	andn	%l3,%l2,%l3
near2_b2b_l:
	fsubs	%f5 ,%f3 ,%f9 
	subc	%l4,%l4,%l7
	jmpl	%o7,%g0
	udivx	%l5,0x0d1,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	smul	%l3,%l6,%l2
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	fcmps	%fcc1,%f19,%f31
	or	%l7,-0x4cb,%l2
	xor	%l4,-0xbec,%l3
	fsubs	%f23,%f16,%f31
	jmpl	%o7,%g0
	subc	%l2,0x35e,%l3
near3_b2b_h:
	add	%l5,-0x2fc,%l5
	subc	%l4,0x878,%l0
	subc	%l3,0x0aa,%l0
	sdivx	%l3,%l2,%l6
	subc	%l1,%l3,%l1
	fsqrts	%f25,%f24
	xor	%l3,0x3c3,%l2
	jmpl	%o7,%g0
	xnor	%l5,%l3,%l7
near3_b2b_l:
	fdtoi	%f2 ,%f14
	xor	%l5,%l0,%l7
	andn	%l0,%l5,%l7
	subc	%l3,%l1,%l1
	mulx	%l2,%l6,%l3
	mulx	%l7,0x0da,%l6
	mulx	%l3,0x6d0,%l0
	jmpl	%o7,%g0
	or	%l1,%l4,%l7
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	sub	%l5,0x7ae,%l6
	add	%l5,%l2,%l5
	jmpl	%o7,%g0
	xor	%l6,0x4f8,%l2
p0_far_0_lem:
	sub	%l5,0x7ae,%l6
	add	%l5,%l2,%l5
	jmpl	%o7,%g0
	xor	%l6,0x4f8,%l2
p0_far_0_he:
	and	%l4,0x859,%l3
	udivx	%l6,-0x346,%l6
	umul	%l7,-0x185,%l3
	xnor	%l6,%l0,%l1
	jmpl	%o7,%g0
	fadds	%f24,%f31,%f28
p0_far_0_hem:
	and	%l4,0x859,%l3
	udivx	%l6,-0x346,%l6
	umul	%l7,-0x185,%l3
	xnor	%l6,%l0,%l1
	jmpl	%o7,%g0
	fadds	%f24,%f31,%f28
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	add	%l7,%l2,%l0
	or	%l6,%l0,%l4
	sub	%l1,%l4,%l0
	fsqrts	%f31,%f27
	and	%l7,-0xf42,%l7
	jmpl	%o7,%g0
	umul	%l0,%l6,%l5
far0_b2b_l:
	fadds	%f15,%f9 ,%f0 
	andn	%l1,%l2,%l2
	smul	%l0,-0x12a,%l5
	fdivs	%f3 ,%f5 ,%f10
	mulx	%l4,%l1,%l1
	jmpl	%o7,%g0
	andn	%l3,%l7,%l6
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fsubs	%f10,%f3 ,%f6 
	fsqrts	%f11,%f12
	fsubs	%f8 ,%f1 ,%f4 
	smul	%l4,%l4,%l0
	jmpl	%o7,%g0
	subc	%l1,%l7,%l5
p0_far_1_lem:
	fsubs	%f10,%f3 ,%f6 
	fsqrts	%f11,%f12
	fsubs	%f8 ,%f1 ,%f4 
	smul	%l4,%l4,%l0
	jmpl	%o7,%g0
	subc	%l1,%l7,%l5
p0_far_1_he:
	andn	%l4,%l2,%l4
	xor	%l4,0xf71,%l6
	add	%l4,%l5,%l1
	umul	%l6,-0x6f6,%l7
	fdivs	%f28,%f17,%f27
	jmpl	%o7,%g0
	subc	%l0,-0x848,%l3
p0_far_1_hem:
	andn	%l4,%l2,%l4
	xor	%l4,0xf71,%l6
	add	%l4,%l5,%l1
	umul	%l6,-0x6f6,%l7
	fdivs	%f28,%f17,%f27
	jmpl	%o7,%g0
	subc	%l0,-0x848,%l3
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	udivx	%l3,-0xeef,%l0
	fdivs	%f18,%f21,%f18
	jmpl	%o7,%g0
	addc	%l4,-0xbbb,%l7
far1_b2b_l:
	andn	%l1,%l1,%l2
	mulx	%l3,-0x981,%l3
	jmpl	%o7,%g0
	fdivs	%f14,%f15,%f5 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ldstub	[%o3+0x1c0],%l3		! Mem[00000000218001c0]
	smul	%l4,-0x4c8,%l6
	jmpl	%o7,%g0
	add	%l0,-0x663,%l4
p0_far_2_lem:
	ldstub	[%o3+0x1c0],%l3		! Mem[00000000218001c0]
	smul	%l4,-0x4c8,%l6
	jmpl	%o7,%g0
	add	%l0,-0x663,%l4
p0_far_2_he:
	orn	%l6,%l3,%l7
	ldsb	[%i1+0x022],%l0		! Mem[0000000010041422]
	udivx	%l7,0x1c9,%l7
	smul	%l4,0x8ff,%l4
	jmpl	%o7,%g0
	xor	%l0,0x764,%l3
p0_far_2_hem:
	orn	%l6,%l3,%l7
	membar	#Sync
	ldsb	[%i1+0x022],%l0		! Mem[0000000010041422]
	udivx	%l7,0x1c9,%l7
	smul	%l4,0x8ff,%l4
	jmpl	%o7,%g0
	xor	%l0,0x764,%l3
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	andn	%l7,0x456,%l6
	fcmps	%fcc0,%f29,%f24
	udivx	%l5,-0x66f,%l0
	jmpl	%o7,%g0
	or	%l6,-0x36b,%l2
far2_b2b_l:
	fsqrts	%f2 ,%f8 
	fmuls	%f2 ,%f0 ,%f9 
	sdivx	%l7,0x8ee,%l1
	jmpl	%o7,%g0
	andn	%l1,%l1,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fcmps	%fcc0,%f1 ,%f12
	fsubs	%f7 ,%f11,%f14
	xor	%l0,-0xb7c,%l3
	ldsb	[%i4+0x01b],%l4		! Mem[000000001010141b]
	umul	%l5,%l7,%l1
	sth	%l4,[%i1+0x030]		! Mem[0000000010041430]
	jmpl	%o7,%g0
	sdivx	%l3,%l3,%l2
p0_far_3_lem:
	fcmps	%fcc0,%f1 ,%f12
	fsubs	%f7 ,%f11,%f14
	xor	%l0,-0xb7c,%l3
	membar	#Sync
	ldsb	[%i4+0x01b],%l4		! Mem[000000001010141b]
	umul	%l5,%l7,%l1
	sth	%l4,[%i1+0x030]		! Mem[0000000010041430]
	jmpl	%o7,%g0
	sdivx	%l3,%l3,%l2
p0_far_3_he:
	mulx	%l5,-0x6c0,%l6
	subc	%l5,%l0,%l3
	jmpl	%o7,%g0
	orn	%l0,-0x058,%l0
p0_far_3_hem:
	mulx	%l5,-0x6c0,%l6
	subc	%l5,%l0,%l3
	jmpl	%o7,%g0
	orn	%l0,-0x058,%l0
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	jmpl	%o7,%g0
	xnor	%l7,-0x1d3,%l1
	jmpl	%o7,%g0
	nop
far3_b2b_l:
	jmpl	%o7,%g0
	fadds	%f1 ,%f0 ,%f3 
	jmpl	%o7,%g0
	nop
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	sdivx	%l3,%l2,%l3
	fdtos	%f4 ,%f1 
	sdivx	%l3,%l7,%l1
	jmpl	%g6+8,%g0
	fmuls	%f7 ,%f10,%f5 
p0_call_0_le:
	umul	%l7,0x90b,%l5
	fmuls	%f1 ,%f12,%f2 
	addc	%l7,%l1,%l5
	fadds	%f8 ,%f0 ,%f8 
	udivx	%l1,%l2,%l2
	retl
	fsubs	%f14,%f4 ,%f8 
p0_jmpl_0_lo:
	sdivx	%l3,%l2,%l3
	fdtos	%f4 ,%f1 
	sdivx	%l3,%l7,%l1
	jmpl	%g6+8,%g0
	fmuls	%f7 ,%f10,%f5 
p0_call_0_lo:
	umul	%l7,0x90b,%l5
	fmuls	%f1 ,%f12,%f2 
	addc	%l7,%l1,%l5
	fadds	%f8 ,%f0 ,%f8 
	udivx	%l1,%l2,%l2
	retl
	fsubs	%f14,%f4 ,%f8 
p0_jmpl_0_he:
	fsubs	%f28,%f16,%f24
	sdivx	%l1,-0x632,%l6
	fdivs	%f21,%f26,%f17
	add	%l1,0x5a6,%l3
	jmpl	%g6+8,%g0
	udivx	%l0,0xf4a,%l1
p0_call_0_he:
	orn	%l3,%l1,%l4
	sdivx	%l2,-0x53e,%l0
	retl
	ldstub	[%o1+0x000],%l0		! Mem[0000000020800000]
p0_jmpl_0_ho:
	fsubs	%f28,%f16,%f24
	sdivx	%l1,-0x632,%l6
	fdivs	%f21,%f26,%f17
	add	%l1,0x5a6,%l3
	jmpl	%g6+8,%g0
	udivx	%l0,0xf4a,%l1
p0_call_0_ho:
	orn	%l3,%l1,%l4
	sdivx	%l2,-0x53e,%l0
	retl
	ldstub	[%i1+0x000],%l0		! Mem[0000000020800000]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	fadds	%f7 ,%f8 ,%f14
p0_call_1_le:
	xnor	%l5,%l0,%l0
	fdivs	%f9 ,%f2 ,%f9 
	fsubs	%f5 ,%f3 ,%f6 
	mulx	%l7,0x3b5,%l2
	xor	%l0,%l2,%l4
	retl
	stb	%l1,[%i6+0x017]		! Mem[0000000010181417]
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	fadds	%f7 ,%f8 ,%f14
p0_call_1_lo:
	xnor	%l5,%l0,%l0
	fdivs	%f9 ,%f2 ,%f9 
	fsubs	%f5 ,%f3 ,%f6 
	mulx	%l7,0x3b5,%l2
	xor	%l0,%l2,%l4
	retl
	stb	%l1,[%o6+0x017]		! Mem[0000000010181417]
p0_jmpl_1_he:
	fcmps	%fcc1,%f28,%f16
	sdivx	%l0,%l5,%l5
	udivx	%l1,%l7,%l7
	fmuls	%f21,%f27,%f22
	orn	%l6,-0x7ee,%l0
	fsubs	%f20,%f26,%f25
	jmpl	%g6+8,%g0
	smul	%l5,0xa53,%l5
p0_call_1_he:
	addc	%l6,0xe87,%l5
	subc	%l3,-0x196,%l0
	or	%l1,%l5,%l6
	sdivx	%l0,-0x11b,%l0
	subc	%l6,%l2,%l3
	xor	%l3,-0x9cc,%l7
	retl
	xor	%l5,%l5,%l3
p0_jmpl_1_ho:
	fcmps	%fcc1,%f28,%f16
	sdivx	%l0,%l5,%l5
	udivx	%l1,%l7,%l7
	fmuls	%f21,%f27,%f22
	orn	%l6,-0x7ee,%l0
	fsubs	%f20,%f26,%f25
	jmpl	%g6+8,%g0
	smul	%l5,0xa53,%l5
p0_call_1_ho:
	addc	%l6,0xe87,%l5
	subc	%l3,-0x196,%l0
	or	%l1,%l5,%l6
	sdivx	%l0,-0x11b,%l0
	subc	%l6,%l2,%l3
	xor	%l3,-0x9cc,%l7
	retl
	xor	%l5,%l5,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	sub	%l0,0x2c4,%l2
	add	%l4,%l3,%l2
	jmpl	%g6+8,%g0
	fsubs	%f6 ,%f14,%f5 
p0_call_2_le:
	mulx	%l7,%l1,%l7
	retl
	xnor	%l6,0x4d6,%l6
p0_jmpl_2_lo:
	sub	%l0,0x2c4,%l2
	add	%l4,%l3,%l2
	jmpl	%g6+8,%g0
	fsubs	%f6 ,%f14,%f5 
p0_call_2_lo:
	mulx	%l7,%l1,%l7
	retl
	xnor	%l6,0x4d6,%l6
p0_jmpl_2_he:
	udivx	%l1,%l6,%l6
	smul	%l2,%l1,%l5
	fsqrts	%f19,%f26
	umul	%l3,%l6,%l2
	or	%l0,0xe1c,%l4
	jmpl	%g6+8,%g0
	xnor	%l2,-0x17b,%l4
p0_call_2_he:
	fmuls	%f19,%f28,%f19
	retl
	addc	%l2,%l5,%l7
p0_jmpl_2_ho:
	udivx	%l1,%l6,%l6
	smul	%l2,%l1,%l5
	fsqrts	%f19,%f26
	umul	%l3,%l6,%l2
	or	%l0,0xe1c,%l4
	jmpl	%g6+8,%g0
	xnor	%l2,-0x17b,%l4
p0_call_2_ho:
	fmuls	%f19,%f28,%f19
	retl
	addc	%l2,%l5,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	add	%l6,-0x9d2,%l1
	sdivx	%l6,%l5,%l5
	fdivs	%f6 ,%f2 ,%f11
	andn	%l6,-0xaf9,%l7
	jmpl	%g6+8,%g0
	and	%l1,0x679,%l6
p0_call_3_le:
	swap	[%i0+0x024],%l3		! Mem[0000000010001424]
	fadds	%f9 ,%f1 ,%f0 
	fcmps	%fcc3,%f1 ,%f3 
	fstoi	%f3 ,%f14
	ldsh	[%i1+0x026],%l6		! Mem[0000000010041426]
	addc	%l5,0xcf4,%l2
	retl
	addc	%l3,%l1,%l6
p0_jmpl_3_lo:
	add	%l6,-0x9d2,%l1
	sdivx	%l6,%l5,%l5
	fdivs	%f6 ,%f2 ,%f11
	andn	%l6,-0xaf9,%l7
	jmpl	%g6+8,%g0
	and	%l1,0x679,%l6
p0_call_3_lo:
	swap	[%o0+0x024],%l3		! Mem[0000000010001424]
	fadds	%f9 ,%f1 ,%f0 
	fcmps	%fcc3,%f1 ,%f3 
	fstoi	%f3 ,%f14
	ldsh	[%o1+0x026],%l6		! Mem[0000000010041426]
	addc	%l5,0xcf4,%l2
	retl
	addc	%l3,%l1,%l6
p0_jmpl_3_he:
	fmuls	%f18,%f21,%f31
	sub	%l2,%l5,%l6
	fcmps	%fcc1,%f17,%f17
	fdivs	%f24,%f29,%f27
	fadds	%f17,%f28,%f26
	fdivs	%f18,%f16,%f28
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f20,%f22
p0_call_3_he:
	fadds	%f29,%f21,%f24
	smul	%l3,-0xdb3,%l0
	retl
	fdivs	%f31,%f26,%f25
p0_jmpl_3_ho:
	fmuls	%f18,%f21,%f31
	sub	%l2,%l5,%l6
	fcmps	%fcc1,%f17,%f17
	fdivs	%f24,%f29,%f27
	fadds	%f17,%f28,%f26
	fdivs	%f18,%f16,%f28
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f20,%f22
p0_call_3_ho:
	fadds	%f29,%f21,%f24
	smul	%l3,-0xdb3,%l0
	retl
	fdivs	%f31,%f26,%f25
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
	.word	0x53b56d46,0x796a3c0d		! Init value for %l0
	.word	0x2b27ea24,0x62dc5403		! Init value for %l1
	.word	0x7cbb9ac4,0x2227a401		! Init value for %l2
	.word	0xcb28e64f,0xea7dc761		! Init value for %l3
	.word	0xd6af4185,0xc2f18f19		! Init value for %l4
	.word	0xf874f966,0x9e6f5b68		! Init value for %l5
	.word	0x0b825304,0x5add27a6		! Init value for %l6
	.word	0xc996b5e2,0x39d01844		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xb6676252,0x8a83776e		! Init value for %f0 
	.word	0x3dc8ce54,0x0d3979d8		! Init value for %f2 
	.word	0xc84ecf72,0x9c431712		! Init value for %f4 
	.word	0x2dbdf489,0x03b54f8d		! Init value for %f6 
	.word	0xe36b8f98,0xbb1f4708		! Init value for %f8 
	.word	0x52a8cdbd,0xaf2f2d12		! Init value for %f10
	.word	0xc01458ad,0x0c37b12f		! Init value for %f12
	.word	0x2ec37420,0x007f4ffe		! Init value for %f14
	.word	0x43bc2821,0xd1f2b6bd		! Init value for %f16
	.word	0x0f6c4ace,0x5c5af8b6		! Init value for %f18
	.word	0x9595e585,0x3d02f0de		! Init value for %f20
	.word	0x759de8e9,0x365480bc		! Init value for %f22
	.word	0x3a845c9e,0xd6ffc78a		! Init value for %f24
	.word	0xe40ee32b,0x53b75484		! Init value for %f26
	.word	0x9a92a3ec,0x6ddb114c		! Init value for %f28
	.word	0xf0fd5b6c,0xe6f2585f		! Init value for %f30
	.word	0x6564e2f7,0x036e6963		! Init value for %f32
	.word	0xee528d12,0x074c0485		! Init value for %f34
	.word	0x2d0d26c1,0x63b54486		! Init value for %f36
	.word	0xae2d7faf,0xa9166c8b		! Init value for %f38
	.word	0xd5c308a7,0xa86d17a9		! Init value for %f40
	.word	0xca568af2,0xb6c47aea		! Init value for %f42
	.word	0xc9450d80,0x3a37e3eb		! Init value for %f44
	.word	0xfff82721,0x5a85ff3a		! Init value for %f46
	.word	0x7d0185c6,0x9823ba3e
	.word	0x9c83cd56,0xbed8eb50
	.word	0xd69491c8,0x2226b502
	.word	0x5f82ef58,0x78e1a8a5
	.word	0x69034383,0xb63bd1d1
	.word	0xbb99c0db,0x721b19d4
	.word	0xb7367eb2,0x09f67208
	.word	0xec942c29,0x4eadb64c
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
	.word	0x00000000,0x76aee6ff
	.word	0x00000000,0x00000079
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xfffffffe
	.word	0xffffffff,0xffffffef
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000025
	.word	0xffffffff,0xffffffff
p0_expected_fp_regs:
	.word	0xf9ff0000,0xff000000
	.word	0xffff8cff,0x00000000
	.word	0x00fa0000,0xff000000
	.word	0xfff9c610,0x67df74f0
	.word	0xffffffff,0x00000054
	.word	0xff9239f8,0xef082f21
	.word	0xf9ff0000,0xff000000
	.word	0x00000000,0x10c6f9ff
	.word	0x00000054,0xff000000
	.word	0xef082f21,0xef082f21
	.word	0x00000000,0x00000000
	.word	0x6f0ac808,0x90007d00
	.word	0x00008dff,0x00ff8ef3
	.word	0xfff9c610,0x0000fa00
	.word	0x80000000,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x0000001e,0x00000400		! %fsr = 0000001e00000400
p0_local0_expect:
	.word	0xff000000,0x5102769c
	.word	0x00001715,0x10c6f9ff
	.word	0xffe6ae76,0x79000000
	.word	0xff9206db,0xff000000
	.word	0x00000000,0x602000ff
	.word	0x5a6f0000,0x00000000
	.word	0x00000025,0xffff00ff
	.word	0xff0000ff,0xef082f21
p0_local0_sec_expect:
	.word	0x00000000,0xf83992ff
	.word	0xffff8cff,0xffff8cff
	.word	0x00008dff,0x00ff8ef3
	.word	0xb98cdf4b,0xe51fe5e2
	.word	0x5cd1e738,0xe61c2fb8
	.word	0x68458549,0xab9fa2fc
	.word	0x783182d7,0xf735f08b
	.word	0x1c73925c,0x35d68cd9
p0_local1_expect:
	.word	0x0000ffff,0xff80ff00
	.word	0xff8c0000,0x00000000
	.word	0x00000000,0x76aee6ff
	.word	0x00f9ffff,0xff8cffff
	.word	0x000000ff,0xff6c9580
	.word	0x0000ffff,0xffff8cff
	.word	0x00ff8ef3,0xffbbf195
	.word	0xff7600fa,0x0000e4e8
p0_local1_sec_expect:
	.word	0xff7600fa,0x0000e4e8
	.word	0xaa2a0000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x4ae6ae76,0xffbbf195
	.word	0x0abf9d3c,0x15176a9c
	.word	0xffb1bc43,0xff6c7880
	.word	0x54861715,0x10c6f9ff
	.word	0x0abf9d3c,0x15176a9c
p0_local2_expect:
	.word	0xffffff00,0x00000000
	.word	0xef082f21,0xef082f21
	.word	0xfff9c610,0x000000ff
	.word	0x4ae6ae76,0x00000000
	.word	0x00000079,0xf074ff67
	.word	0xff000060,0x4bdf8cff
	.word	0x000067df,0x9e87c233
	.word	0x6f0ac808,0x90007d00
p0_local2_sec_expect:
	.word	0xffe6ffff,0x600000ff
	.word	0xfff9c610,0x00000000
	.word	0x000000ff,0x0000ff92
	.word	0xff9239f8,0x10c6f9ff
	.word	0x000000ff,0x00000000
	.word	0xff000000,0xffff0000
	.word	0x4ae6ae76,0xffbbf195
	.word	0x4ae6ae76,0x79000000
p0_local3_expect:
	.word	0x000000ff,0x54000000
	.word	0x212f08ef,0x212f08ef
	.word	0x00000000,0x00000000
	.word	0x007d0090,0x08c80a6f
	.word	0xf38eff00,0xff8d0000
	.word	0x00fa0000,0x10c6f9ff
	.word	0x00000000,0x00000080
	.word	0x00000000,0xff0000ff
p0_local3_sec_expect:
	.word	0xff001715,0x10c6f9ff
	.word	0xffff8cff,0x000000ff
	.word	0xff0000ff,0x000000ff
	.word	0xfff9c610,0xf83992ff
	.word	0x76000000,0xffff0000
	.word	0x9c6a1715,0x3c9dbf0a
	.word	0x71ff699a,0xff613b1b
	.word	0x0354dc62,0x67df74f0
p0_local4_expect:
	.word	0xff000000,0x760c8ef3
	.word	0xff000000,0x00000000
	.word	0xff00fa00,0xff000000
	.word	0xff9239f8,0x2f6f0000
	.word	0x000000ff,0x00000000
	.word	0xf38e0c76,0xffffffff
	.word	0x00000025,0xffffffff
	.word	0x4ae6ae76,0x79000000
p0_local4_sec_expect:
	.word	0xffffff00,0x000000ff
	.word	0x00fa0000,0x00000000
	.word	0xffff8cff,0x00000000
	.word	0xfff9c610,0xf83992ff
	.word	0x42f4f9d2,0xff9239f8
	.word	0x212f08ef,0xff0000a5
	.word	0x43bc08ab,0xa50000a5
	.word	0x675145ff,0xffffffff
p0_local5_expect:
	.word	0x000000ff,0x10f7dbcc
	.word	0x00008dff,0x00000000
	.word	0x00fa0000,0x00000000
	.word	0x00000000,0x0000fff9
	.word	0x00000000,0x00000054
	.word	0x00000000,0x000000ff
	.word	0x00fa0000,0x08c80a6f
	.word	0x00000000,0x10c6f9ff
p0_local5_sec_expect:
	.word	0xffffff75,0xff800000
	.word	0x5a6f0000,0x00000000
	.word	0xff9239f8,0xef082f21
	.word	0x00f9ffff,0xff8cffff
	.word	0x00000000,0x10c6f9ff
	.word	0x0000ffff,0x0000ffff
	.word	0x00ff8ef3,0xffbbf195
	.word	0xff7600fa,0x0000e4e8
p0_local6_expect:
	.word	0x00000000,0xff0000ff
	.word	0xffff0000,0x0000fff9
	.word	0xff8dfeff,0xff00ffff
	.word	0xfa088000,0xffffffff
	.word	0x000000ff,0xffffff75
	.word	0x80786cff,0x4bdf8cff
	.word	0xff0000ff,0xfffffffe
	.word	0x00000000,0x000000ff
p0_local6_sec_expect:
	.word	0xef082fff,0xff000000
	.word	0xff2f08ef,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0xfff9c610,0xf83992ff
	.word	0x00000000,0xff000000
	.word	0xffffffff,0x760c8ef3
	.word	0x95f1bbff,0x76aee64a
	.word	0x00000079,0x76aee64a
share0_expect:
	.word	0xff00075f,0x7ca7f27b
	.word	0x50c59670,0xe335008e
	.word	0x54bd8537,0xba57cc13
	.word	0xf41db355,0xd941850e
	.word	0x5691cce5,0x934af431
	.word	0x2e4874a8,0x14a34ed2
	.word	0x74a07762,0x1aa86ce7
	.word	0x8aee3a79,0xc892d8e3
share1_expect:
	.word	0x0025b0a2,0xe8466728
	.word	0xffaabe19,0x580dba8b
	.word	0x9f5343d3,0x6b9a1cd7
	.word	0xf5c25b4c,0xeea7a656
	.word	0xe8d92591,0xae69ea45
	.word	0x9c34f42a,0x4a5be287
	.word	0x6b0b5011,0xbd37a3e1
	.word	0xfb1f6a3a,0x589282a3
	.word	0x00ff2222,0x8d2fe38f
	.word	0x094abc82,0xa91d93cb
	.word	0xbba22098,0x309cbf5d
	.word	0x10a5ff08,0xf8eb3d95
	.word	0x4afee99b,0xeec3ca53
	.word	0x2142c752,0xef297cd2
	.word	0x479425c8,0x4b12b26d
	.word	0x5943f557,0x3abd163f
share2_expect:
	.word	0xffffd61d,0xb4caed14
	.word	0xaf0fd768,0x85808d35
	.word	0x65e99902,0x19fa2904
	.word	0x484f8946,0x217a0ce3
	.word	0x7c3dcdf4,0xc19c9e46
	.word	0x432e5e90,0xcfbafc49
	.word	0x0748aeeb,0x9ebb27dc
	.word	0xea7119c7,0x08e2d6bb
share3_expect:
	.word	0xff0037ea,0xbf1a4204
	.word	0x78e0e24f,0x3f8bb993
	.word	0x26fe128b,0xbbf2337b
	.word	0x84cd8b11,0x6cdd44b2
	.word	0x9f861e95,0x5dfe37eb
	.word	0xcc535cb1,0xcfea62fe
	.word	0x0dc270ca,0x3c0cf39f
	.word	0x50d55496,0x0ccb9cd6
	.word	0xffff856a,0x9807ed72
	.word	0x160d8d73,0x309f5a2a
	.word	0x3612cd3d,0xf19f1f10
	.word	0x76facc44,0x1c7b8773
	.word	0x0dff083c,0x4a5fcbfe
	.word	0x95a41652,0xb18ffeaa
	.word	0x722b55d7,0x98f3b90e
	.word	0x0e50f905,0x0b6243cd
	.word	0x257e727f,0xa3c42789
	.word	0xff2150e5,0xb9996a92
	.word	0xf0480279,0xe5c92530
	.word	0x28c0b865,0xcc50d716
	.word	0x089e1c41,0x3e926c8f
	.word	0xf77d8211,0x7b341090
	.word	0x63797423,0x9eecb036
	.word	0xf05e7d03,0xab605f38
	.word	0xff110164,0x65eeb9b6
	.word	0x040d5074,0x04e1b5ec
	.word	0x03c9ce8a,0xae5c80ca
	.word	0xc9ccf4e0,0xdbe405d1
	.word	0x3990e255,0x5db4e395
	.word	0x9b4f263a,0xb742310f
	.word	0xc12d74e3,0x4c378566
	.word	0x40c755ea,0xd94fe52a
	.word	0x00fa6d5f,0xc1c20597
	.word	0x286ba568,0x7146cde1
	.word	0x164ed6a0,0x047f7042
	.word	0xa66f038c,0x10ef7981
	.word	0x7dbb7ef4,0x9a164a27
	.word	0x1717601b,0xae66332c
	.word	0xea3d3fdd,0xc290d626
	.word	0x8174d030,0xb1da6155
	.word	0xff750a30,0x4cfb6ee2
	.word	0x74cdc070,0x8ac6016a
	.word	0xeb9573af,0xb21d2db0
	.word	0x4bf1ea41,0xf2de991c
	.word	0xb7c62b08,0x33f6c1a4
	.word	0x6fa8f6da,0x324566a2
	.word	0x13d3e5e2,0x47b4dd3e
	.word	0x097c2e18,0x36e62b21
	.word	0xb3572d80,0x8ea22b60
	.word	0x62572387,0x69a2f120
	.word	0xeebc84f8,0xeb52c671
	.word	0x4f590c41,0x2ad84eee
	.word	0x5840faf0,0x27cbcecd
	.word	0x6e9df9c2,0x4d332062
	.word	0x062dbab8,0x0cc12f56
	.word	0xa39cdb54,0x60a80859
	.word	0x671507db,0x4be4c2e4
	.word	0x56a2e584,0xc0a13298
	.word	0xea6341d4,0xb5aa1a75
	.word	0x3805b0f6,0x2231b63f
	.word	0xd67fc776,0xf5252d11
	.word	0x922cdb5c,0xe667d17d
	.word	0x81439d55,0x81edafc4
	.word	0x723d390b,0x78b1f95e
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
	.word	0x8a5133cf,0x92397cc2
	.word	0x00000000,0x00000002
	.word	0x45f8df58,0x7095e80d
	.word	0x00000000,0x00000003
	.word	0xa1fba50f,0x88fa9639
	.word	0x00000000,0x00000004
	.word	0x5a4ec6e0,0x71404222
	.word	0x00000000,0x00000005
	.word	0x1a7ac81f,0xea4101ad
	.word	0x00000000,0x00000006
	.word	0x6cfa8f9f,0x8b9bd251
	.word	0x00000000,0x00000007
	.word	0xd1c836b0,0x528ae365
	.word	0x00000000,0x00000008
	.word	0x2a724598,0x0714344e
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
	.word	0x476805d9,0x6139a7a3,0xfe8a25d8,0x65bdebc1
	.word	0x8fcb8c38,0xf31347e7,0xfb9706db,0x8b0c1328
	.word	0xcce7181d,0xb6229c12,0xcb8d75d2,0x302e35ab
	.word	0xd48a37c5,0x911b8130,0xa8760424,0x6978bf4a
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
	.word	0x7cea7465,0xcee3abff,0x09149844,0x1cce83d2
	.word	0x8adc2479,0xc20df31e,0xb96ad1d6,0xe51fe5e2
	.word	0x5cd1e738,0xe61c2fb8,0x68458549,0xab9fa2fc
	.word	0x783182d7,0xf735f08b,0x1c73925c,0x35d68cd9
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
	.word	0x85f238e3,0x9feecd5e,0x99004cd9,0x99bf8523
	.word	0xdd060c89,0x0ffd8287,0xbaec0bc8,0x2d07a632
	.word	0x7560c77f,0x5442c92c,0xbb13f1cf,0xf8fca896
	.word	0xd4d07454,0xe10636a1,0x5cee6ef7,0x16f20592
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
	.word	0x2f04e293,0x50f59c61,0x67cc76e1,0xa52042be
	.word	0xc147e5a6,0x888a70aa,0x9c236d10,0xa5d60110
	.word	0xa471c187,0x7d64cc57,0xba707364,0x197fa0bc
	.word	0x7036030e,0x4dc45bc8,0xf6a43838,0x940cddff
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
	.word	0xa01ef96b,0xfa6bb877,0xa37e5325,0xd274fb56
	.word	0x91969edc,0x4bdf8c9a,0x188b3c5d,0x8ef465bb
	.word	0xbd66d286,0xcbbba13b,0xb8cb577f,0xed3a5f02
	.word	0x38bbf195,0x9e87c233,0x3d97a105,0x90ee7d79
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
	.word	0x0de3dd33,0xf266ae1c,0x41455167,0xf074df03
	.word	0xb985c7b3,0x1809a90f,0xe00dcf28,0x5f03e6b5
	.word	0xf995557c,0x80786cd9,0x11fb7f67,0xef082ea8
	.word	0xfc28c107,0xf5c1a26b,0x9a16530e,0x195c64bd
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
	.word	0xb8777fd5,0xc51104b9,0xc9e481cc,0xf38f13ff
	.word	0xe7eb66fa,0xb1281210,0xe29f3f78,0x8bdf57f2
	.word	0x0d6a01b5,0xd187fbef,0xafd6e547,0x59ae007a
	.word	0xe3e681f3,0xf59d585b,0x1140c8e9,0x1c67d382
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
	.word	0x4de06e51,0xbfb2887b,0x83308ed8,0x8c7d617e
	.word	0x4ea6b8a9,0xf0670df5,0x071769f4,0xb1df1156
	.word	0x3a260c93,0x8badb4e6,0x4af804be,0xd3e62a29
	.word	0x009b5e05,0x79575273,0x6c98c1bc,0x58812f0e
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
	.word	0xf10aea31,0xbc66032b,0x2ad9f144,0xcd31359b
	.word	0x5fc8d3d8,0xf2f38b70,0x619239f8,0x7fc8e475
	.word	0x2301522c,0x122ffd46,0x0abf9d3c,0x15176a9c
	.word	0x1b3bf853,0x9a69f871,0xec51d404,0x6107799c
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
	.word	0x9a17eaa8,0x71b5331e,0xbcad6911,0xefda1cfb
	.word	0x5a51eaeb,0x702323f5,0x2fcadc71,0xf7902f0f
	.word	0x483323e7,0x5ef0bc08,0x27b76644,0x4367cdc5
	.word	0x48530673,0xfb6c7c66,0xca117915,0x62a23bad
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
	.word	0xd7013e6a,0x9f13630b,0xccdfdf66,0xa617c9e5
	.word	0x7c925171,0x5b364b94,0x4782e746,0xfe5f6aa0
	.word	0x9655d538,0x52bca2f0,0x46bd640d,0x4a572233
	.word	0xf5e153cc,0xa1877db9,0x2d152cfc,0x609e58e0
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
	.word	0x1177bc52,0x3c9f19a2,0xa8a2bbf1,0xedddf329
	.word	0x20bc59e3,0xd6dd9464,0xbd1a1ba1,0x10a6e376
	.word	0x40d7fc8e,0x64061516,0x5925b3dc,0x0ec71e3c
	.word	0x25439f43,0x282b7c0b,0x9c23e77c,0x862538e6
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
	.word	0xf1cd54b6,0xc8a3b3a7,0x935c30d0,0x2d1a78a9
	.word	0x591ce98e,0x923563dc,0x7ec016b2,0x05736bca
	.word	0xc3a609f9,0xb7e5a7dc,0x8e91b08a,0x840ac85e
	.word	0x70a1f8ae,0xeb03a68d,0x94fa6994,0xefbdc558
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
	.word	0xd4c6be3c,0xfc2a1b51,0xfac85330,0x1aa7aac0
	.word	0x6c3a0e68,0x736f228e,0xba6b8d0f,0x5131fddb
	.word	0xe1f888f9,0x66c0041d,0x08c80a6f,0x41f71331
	.word	0x339cb7c5,0xb6e9ee67,0x9077aed2,0x6bdc8384
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
	.word	0xe432075f,0x7ca7f27b,0x50c59670,0xe335008e
	.word	0x54bd8537,0xba57cc13,0xf41db355,0xd941850e
	.word	0x5691cce5,0x934af431,0x2e4874a8,0x14a34ed2
	.word	0x74a07762,0x1aa86ce7,0x8aee3a79,0xc892d8e3
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
	.word	0x4698b0a2,0xe8466728,0xffaabe19,0x580dba8b
	.word	0x9f5343d3,0x6b9a1cd7,0xf5c25b4c,0xeea7a656
	.word	0xe8d92591,0xae69ea45,0x9c34f42a,0x4a5be287
	.word	0x6b0b5011,0xbd37a3e1,0xfb1f6a3a,0x589282a3
	.word	0xeafa2222,0x8d2fe38f,0x094abc82,0xa91d93cb
	.word	0xbba22098,0x309cbf5d,0x10a5ff08,0xf8eb3d95
	.word	0x4afee99b,0xeec3ca53,0x2142c752,0xef297cd2
	.word	0x479425c8,0x4b12b26d,0x5943f557,0x3abd163f
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
	.word	0x5418d61d,0xb4caed14,0xaf0fd768,0x85808d35
	.word	0x65e99902,0x19fa2904,0x484f8946,0x217a0ce3
	.word	0x7c3dcdf4,0xc19c9e46,0x432e5e90,0xcfbafc49
	.word	0x0748aeeb,0x9ebb27dc,0xea7119c7,0x08e2d6bb
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
	.word	0x9b4f37ea,0xbf1a4204,0x78e0e24f,0x3f8bb993
	.word	0x26fe128b,0xbbf2337b,0x84cd8b11,0x6cdd44b2
	.word	0x9f861e95,0x5dfe37eb,0xcc535cb1,0xcfea62fe
	.word	0x0dc270ca,0x3c0cf39f,0x50d55496,0x0ccb9cd6
	.word	0xd91b856a,0x9807ed72,0x160d8d73,0x309f5a2a
	.word	0x3612cd3d,0xf19f1f10,0x76facc44,0x1c7b8773
	.word	0x0dff083c,0x4a5fcbfe,0x95a41652,0xb18ffeaa
	.word	0x722b55d7,0x98f3b90e,0x0e50f905,0x0b6243cd
	.word	0x257e727f,0xa3c42789,0xff2150e5,0xb9996a92
	.word	0xf0480279,0xe5c92530,0x28c0b865,0xcc50d716
	.word	0x089e1c41,0x3e926c8f,0xf77d8211,0x7b341090
	.word	0x63797423,0x9eecb036,0xf05e7d03,0xab605f38
	.word	0x0f110164,0x65eeb9b6,0x040d5074,0x04e1b5ec
	.word	0x03c9ce8a,0xae5c80ca,0xc9ccf4e0,0xdbe405d1
	.word	0x3990e255,0x5db4e395,0x9b4f263a,0xb742310f
	.word	0xc12d74e3,0x4c378566,0x40c755ea,0xd94fe52a
	.word	0xb7096d5f,0xc1c20597,0x286ba568,0x7146cde1
	.word	0x164ed6a0,0x047f7042,0xa66f038c,0x10ef7981
	.word	0x7dbb7ef4,0x9a164a27,0x1717601b,0xae66332c
	.word	0xea3d3fdd,0xc290d626,0x8174d030,0xb1da6155
	.word	0x57db0a30,0x4cfb6ee2,0x74cdc070,0x8ac6016a
	.word	0xeb9573af,0xb21d2db0,0x4bf1ea41,0xf2de991c
	.word	0xb7c62b08,0x33f6c1a4,0x6fa8f6da,0x324566a2
	.word	0x13d3e5e2,0x47b4dd3e,0x097c2e18,0x36e62b21
	.word	0x59572d80,0x8ea22b60,0x62572387,0x69a2f120
	.word	0xeebc84f8,0xeb52c671,0x4f590c41,0x2ad84eee
	.word	0x5840faf0,0x27cbcecd,0x6e9df9c2,0x4d332062
	.word	0x062dbab8,0x0cc12f56,0xa39cdb54,0x60a80859
	.word	0x2fa807db,0x4be4c2e4,0x56a2e584,0xc0a13298
	.word	0xea6341d4,0xb5aa1a75,0x3805b0f6,0x2231b63f
	.word	0xd67fc776,0xf5252d11,0x922cdb5c,0xe667d17d
	.word	0x81439d55,0x81edafc4,0x723d390b,0x78b1f95e
share3_end:
