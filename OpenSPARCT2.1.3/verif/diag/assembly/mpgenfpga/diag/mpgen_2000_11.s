/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_11.s
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
!	Seed = 327144528
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_11.s created on Mar 27, 2009 (14:45:28)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_2000_11 -p 1 -l 2000

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
!	%f0  = f8511d1b efb2d718 393e2a63 9eed9753
!	%f4  = da6229f7 a19f87bd b3fc65cc 64804183
!	%f8  = 082da03a b1a1a9fd 44cc3530 23145b02
!	%f12 = bdce655c 80119692 faf2162c 1aee0638
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = bc8ad5ed a79d9bf2 f404cd1d af703dc3
!	%f20 = 9e3612e3 fa8a642b 14da5593 f482f3f5
!	%f24 = e7cdd534 98f0288b 72016081 64902294
!	%f28 = 47d58ad6 31dcbcd9 2579ae5c 22487c2b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 7737f8a3 e4921899 821ec8e2 b507acd4
!	%f36 = 13dfcadc 2c2a5f34 55725e6d 1e017edd
!	%f40 = f5d75abc 2f9b2906 f1137fd6 51341abb
!	%f44 = 18f4aba1 edeabd4f f47520a7 36cff8c6
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xb95eb40700000022,%g7,%g1 ! GSR scale =  4, align = 2
	wr	%g1,%g0,%gsr		! GSR = b95eb40700000022
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f9  = b1a1a9fd, Mem[0000000030081408] = 8fa37352
	sta	%f9 ,[%i2+%o4]0x89	! Mem[0000000030081408] = b1a1a9fd
!	%l6 = e883873ca254d25b, Mem[00000000201c0000] = 747075c1, %asi = 80
	stba	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 5b7075c1
!	Mem[00000000201c0000] = 5b7075c1, %l5 = e9214980c6704eb9
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000005b70
!	%f31 = 22487c2b, Mem[0000000030181400] = 203ad056
	sta	%f31,[%i6+%g0]0x89	! Mem[0000000030181400] = 22487c2b
!	%l2 = 022c5b4266427080, immed = 000006e4, %y  = 00000000
	udiv	%l2,0x6e4,%l4		! %l4 = 00000000000ed723
	mov	%l0,%y			! %y = 3155831c
!	Mem[0000000010001408] = 32520af018ba0478, %l7 = 52a876b9e69113cc
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = 32520af018ba0478
!	Mem[0000000010181410] = c51e0ba2 fa17dbfb, %l6 = a254d25b, %l7 = 18ba0478
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000c51e0ba2 00000000fa17dbfb
!	%f5  = a19f87bd, Mem[0000000010141400] = f264173e
	sta	%f5 ,[%i5+%g0]0x80	! Mem[0000000010141400] = a19f87bd
!	%l6 = c51e0ba2, %l7 = fa17dbfb, Mem[00000000300c1408] = e74c0a50 2300bc85
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = c51e0ba2 fa17dbfb
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000ed723, Mem[0000000010001408] = 32520af0
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 000ed723

p0_label_2:
!	%f0  = f8511d1b efb2d718 393e2a63 9eed9753
!	%f4  = da6229f7 a19f87bd b3fc65cc 64804183
!	%f8  = 082da03a b1a1a9fd 44cc3530 23145b02
!	%f12 = bdce655c 80119692 faf2162c 1aee0638
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l2 = 66427080, %l3 = a99da124, Mem[0000000010001400] = c58868bd 0da57a2a
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 66427080 a99da124
!	Mem[00000000211c0000] = fe39877b, %l3 = 507f85a7a99da124
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000fe000000ff
!	Mem[0000000030141410] = b30a3843, %l0 = ca8662063155831c
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 00000000b30a3843
!	%l2 = 022c5b4266427080, Mem[0000000010141410] = 1506448b
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 66427080
!	%f26 = 72016081 64902294, Mem[0000000010001408] = 000ed723 18ba0478
	stda	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = 72016081 64902294
!	%l4 = 00000000000ed723, Mem[0000000010081408] = a41a702a
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = d723702a
!	Mem[0000000030101410] = a1064b63, %l3 = 00000000000000fe
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000063000000ff
!	Mem[0000000010001400] = 80704266, %l1 = 4891b675fea9c1a1
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000080000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 8b7d1d2d, %l7 = 00000000fa17dbfb
	ldsha	[%i3+0x030]%asi,%l7	! %l7 = ffffffffffff8b7d

p0_label_3:
!	Mem[0000000030001408] = b3083336, %l4 = 00000000000ed723
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000003336
!	%l5 = 0000000000005b70, Mem[00000000211c0001] = ff39877b, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff70877b
!	Mem[0000000021800000] = 14e5ddab, %l6 = 00000000c51e0ba2
	lduh	[%o3+%g0],%l6		! %l6 = 00000000000014e5
!	Mem[0000000030181400] = 2b7c4822, %l2 = 022c5b4266427080
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 000000002b7c4822
!	%l2 = 000000002b7c4822, Mem[0000000010081400] = 6b26c342c90352a2
	stx	%l2,[%i2+%g0]		! Mem[0000000010081400] = 000000002b7c4822
!	Mem[0000000010101400] = 17de5232 d2ccd9a9, %l6 = 000014e5, %l7 = ffff8b7d
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000d2ccd9a9 0000000017de5232
!	Mem[0000000010101428] = fe4731838b39271f, %l5 = 0000000000005b70
	ldx	[%i4+0x028],%l5		! %l5 = fe4731838b39271f
!	Mem[0000000030141400] = 54360ebd, %f17 = a79d9bf2
	lda	[%i5+%g0]0x81,%f17	! %f17 = 54360ebd
!	Mem[0000000030081408] = 246eee7fb1a1a9fd, %l5 = fe4731838b39271f
	ldxa	[%i2+%o4]0x89,%l5	! %l5 = 246eee7fb1a1a9fd
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 664270ff, %l2 = 000000002b7c4822
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000664270ff

p0_label_4:
!	Mem[0000000010101410] = d364a9da, %l0 = 00000000b30a3843
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000d364a9da
!	%l7 = 0000000017de5232, imm = fffffffffffff25f, %l6 = 00000000d2ccd9a9
	orn	%l7,-0xda1,%l6		! %l6 = 0000000017de5fb2
!	%f26 = 72016081 64902294, %l7 = 0000000017de5232
!	Mem[0000000030141400] = 54360ebdef0bfc1d
	stda	%f26,[%i5+%l7]ASI_PST8_S ! Mem[0000000030141400] = 54366081ef0b221d
!	%l7 = 0000000017de5232, Mem[0000000010101400] = 17de5232d2ccd9a9
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000017de5232
!	Mem[00000000100c1408] = 45828532, %l3 = 0000000000000063
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 0000000045828532
!	%f18 = f404cd1d, Mem[0000000010141400] = a19f87bd
	sta	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = f404cd1d
!	Mem[0000000030081410] = 92236e92, %l6 = 0000000017de5fb2
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000092236e92
!	Mem[0000000030141400] = 54366081, %l1 = 0000000000000080
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 00000054000000ff
!	Mem[0000000030001410] = 918eed5a, %l0 = 00000000d364a9da
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000091000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff70877b, %l7 = 0000000017de5232
	lduba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000070

p0_label_5:
!	Mem[0000000030041400] = d2c46fab, %l0 = 0000000000000091
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000d2c4
!	Mem[0000000030141400] = ff366081 ef0b221d, %l4 = 00003336, %l5 = b1a1a9fd
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff366081 00000000ef0b221d
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181438] = faf2162c, %l5 = 00000000ef0b221d
	lduw	[%i6+0x038],%l5		! %l5 = 00000000faf2162c
!	Mem[00000000100c1400] = 56ac0c11dabdccce, %f22 = 14da5593 f482f3f5
	ldda	[%i3+%g0]0x88,%f22	! %f22 = 56ac0c11 dabdccce
!	Mem[00000000100c1430] = 8b7d1d2d, %l2 = 00000000664270ff
	ldsh	[%i3+0x032],%l2		! %l2 = 0000000000001d2d
!	Mem[0000000010181438] = faf2162c, %l0 = 000000000000d2c4
	ldswa	[%i6+0x038]%asi,%l0	! %l0 = fffffffffaf2162c
!	Mem[00000000211c0000] = ff70877b, %l4 = 00000000ff366081
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 2b7c4822037cf36c, %l1 = 0000000000000054
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = 2b7c4822037cf36c
!	Mem[0000000030101410] = ff4b06a1, %l4 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffff4b
!	Starting 10 instruction Store Burst
!	%l1 = 2b7c4822037cf36c, Mem[0000000010141408] = 9861b7ff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 9861f36c

p0_label_6:
!	%l4 = ffffff4b, %l5 = faf2162c, Mem[0000000030081400] = f9f60e05 3c70cee3
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffff4b faf2162c
!	%l5 = 00000000faf2162c, Mem[0000000030041408] = 139bd8c4
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = faf2162c
!	Mem[0000000030181400] = 2b7c4822, %l4 = ffffffffffffff4b
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 000000002b7c4822
!	%f12 = bdce655c, Mem[0000000010081400] = 00000000
	sta	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = bdce655c
!	Mem[0000000010041403] = 4b594e7c, %l7 = 0000000000000070
	ldstuba	[%i1+0x003]%asi,%l7	! %l7 = 0000007c000000ff
!	%l4 = 2b7c4822, %l5 = faf2162c, Mem[0000000030041410] = 2bcc552e 5376db64
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 2b7c4822 faf2162c
!	%f16 = bc8ad5ed 54360ebd, %f18 = f404cd1d af703dc3
	fxtod	%f16,%f18		! %f18 = c3d0dd4a 84aaf27c
!	%l3 = 0000000045828532, Mem[0000000030181408] = 13fa6119
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 13fa8532
!	%l6 = 92236e92, %l7 = 0000007c, Mem[00000000100c1408] = 63000000 487c30c3
	std	%l6,[%i3+%o4]		! Mem[00000000100c1408] = 92236e92 0000007c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0000000017de5232, %f28 = 47d58ad6 31dcbcd9
	ldda	[%i4+%g0]0x88,%f28	! %f28 = 00000000 17de5232

p0_label_7:
!	Mem[0000000030001400] = 67be1bddbf74240a, %f16 = bc8ad5ed 54360ebd
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 67be1bdd bf74240a
!	Mem[0000000030041400] = ab6fc4d2, %l0 = fffffffffaf2162c
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 000000000000c4d2
!	Mem[0000000010101410] = 43380ab3, %l5 = 00000000faf2162c
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000ab3
!	Mem[00000000211c0000] = ff70877b, %l0 = 000000000000c4d2
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffff70
!	Mem[0000000030141410] = 3155831c, %f15 = 1aee0638
	lda	[%i5+%o5]0x89,%f15	! %f15 = 3155831c
!	%l6 = 0000000092236e92, imm = ffffffffffffff4c, %l6 = 0000000092236e92
	orn	%l6,-0x0b4,%l6		! %l6 = 0000000092236eb3
!	Mem[0000000010101400] = 17de5232, %f18 = c3d0dd4a
	lda	[%i4+%g0]0x88,%f18	! %f18 = 17de5232
!	Mem[0000000030141400] = ff366081 ef0b221d, %l0 = ffffff70, %l1 = 037cf36c
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff366081 00000000ef0b221d
!	Mem[000000001000140c] = 64902294, %l4 = 000000002b7c4822
	lduba	[%i0+0x00c]%asi,%l4	! %l4 = 0000000000000064
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 17de5232, %l5 = 0000000000000ab3
!	Mem[0000000030041408] = 2c16f2fa3741f12c
	add	%i1,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030041408] = 3252de173741f12c

p0_label_8:
!	Mem[0000000010181408] = 393e2a63, %l2 = 0000000000001d2d
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000393e2a63
!	%f8  = 082da03a b1a1a9fd, %l4 = 0000000000000064
!	Mem[0000000010001410] = 74cb7a9714f96e1e
	add	%i0,0x010,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010001410] = 74cb7a9714f96e1e
!	%l2 = 00000000393e2a63, Mem[0000000030141408] = a59ff5fa
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 393e2a63
!	Mem[0000000010101410] = b30a3843, %l2 = 00000000393e2a63
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000b30a3843
!	Mem[0000000010181410] = da6229f7, %l6 = 0000000092236eb3
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000da6229f7
!	Mem[0000000010181400] = f8511d1b, %l2 = 00000000b30a3843
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000f8000000ff
!	%l2 = 00000000000000f8, Mem[0000000030141408] = 393e2a63
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000f8
!	Mem[00000000100c1438] = d04808b7a77b3f76, %l6 = 00000000da6229f7, %l4 = 0000000000000064
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = d04808b7a77b3f76
!	%f6  = b3fc65cc 64804183, %l3 = 0000000045828532
!	Mem[0000000030101408] = 96a9d7b0ad40bccd
	add	%i4,0x008,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101408] = 9641d7b0cc65bccd
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 3ddb4ee0, %l1 = 00000000ef0b221d
	ldsh	[%o3+0x080],%l1		! %l1 = 0000000000003ddb

p0_label_9:
!	Mem[0000000030181410] = a1ed70f8, %l4 = d04808b7a77b3f76
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = ffffffffa1ed70f8
!	Mem[0000000030141400] = 816036ff, %f25 = 98f0288b
	lda	[%i5+%g0]0x89,%f25	! %f25 = 816036ff
!	Mem[0000000030041400] = d2c46fab, %f9  = b1a1a9fd
	lda	[%i1+%g0]0x81,%f9 	! %f9 = d2c46fab
!	Mem[00000000100c1418] = 079e2c00, %l5 = 0000000000000ab3
	ldsha	[%i3+0x01a]%asi,%l5	! %l5 = 0000000000002c00
!	Mem[0000000030081400] = ffffff4bfaf2162c, %l5 = 0000000000002c00
	ldxa	[%i2+%g0]0x81,%l5	! %l5 = ffffff4bfaf2162c
!	Mem[0000000010101410] = 632a3e39, %l3 = 0000000045828532
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000632a3e39
!	Mem[0000000010181400] = 1b1d51ff, %l7 = 000000000000007c
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = b36e2392, %l2 = 00000000000000f8
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000092
!	Mem[0000000030181410] = d5fe12afa1ed70f8, %l4 = ffffffffa1ed70f8
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = d5fe12afa1ed70f8
!	Starting 10 instruction Store Burst
!	%l6 = da6229f7, %l7 = 000000ff, Mem[0000000010081400] = bdce655c 2b7c4822
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = da6229f7 000000ff

p0_label_10:
!	%f18 = 17de5232 84aaf27c, Mem[0000000030141408] = f8000000 fe0c4ed0
	stda	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = 17de5232 84aaf27c
!	Mem[0000000010181428] = 44cc3530, %l3 = 00000000632a3e39
	ldstuba	[%i6+0x028]%asi,%l3	! %l3 = 00000044000000ff
!	Mem[000000001000142f] = c6f3cf0c, %l1 = 0000000000003ddb
	ldstub	[%i0+0x02f],%l1		! %l1 = 0000000c000000ff
!	Mem[0000000030141400] = 816036ff, %l1 = 000000000000000c
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000816036ff
!	%l0 = 00000000ff366081, Mem[00000000201c0000] = 5b7075c1
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 608175c1
!	%l2 = 00000092, %l3 = 00000044, Mem[0000000010101410] = 632a3e39 1318ed04
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000092 00000044
!	%f24 = e7cdd534, Mem[0000000010141400] = f404cd1d
	sta	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = e7cdd534
!	%l0 = 00000000ff366081, Mem[0000000030181400] = 6cf37c034bffffff
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000ff366081
!	%f16 = 67be1bdd bf74240a, %l7 = 00000000000000ff
!	Mem[0000000010041420] = 3829b1c29b2e5c82
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l7]ASI_PST32_P ! Mem[0000000010041420] = 67be1bddbf74240a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 297fe946 1030f3bb, %l6 = da6229f7, %l7 = 000000ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000297fe946 000000001030f3bb

p0_label_11:
!	Mem[0000000010101410] = 92000000, %f31 = 22487c2b
	ld	[%i4+%o5],%f31	! %f31 = 92000000
!	Mem[0000000030081410] = 17de5fb2 d303d2ce, %l6 = 297fe946, %l7 = 1030f3bb
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 0000000017de5fb2 00000000d303d2ce
!	Mem[0000000010001408] = 81600172, %f0  = f8511d1b
	lda	[%i0+%o4]0x88,%f0 	! %f0 = 81600172
!	Mem[0000000010181410] = 92236eb3a19f87bd, %l6 = 0000000017de5fb2
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = 92236eb3a19f87bd
!	Mem[0000000030081400] = 4bffffff, %l2 = 0000000000000092
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000ff366081, %l5 = ffffff4bfaf2162c, %l6 = 92236eb3a19f87bd
	and	%l0,%l5,%l6		! %l6 = 00000000fa320000
!	Mem[0000000010181410] = 92236eb3, %l7 = 00000000d303d2ce
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000009223
!	Mem[0000000010081408] = d723702a, %f29 = 17de5232
	lda	[%i2+%o4]0x80,%f29	! %f29 = d723702a
!	Mem[0000000030081400] = ffffff4b faf2162c, %l6 = fa320000, %l7 = 00009223
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffffff4b 00000000faf2162c
!	Starting 10 instruction Store Burst
!	%f10 = 44cc3530, Mem[0000000030141410] = 1c835531
	sta	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 44cc3530

p0_label_12:
!	Mem[0000000010041438] = 866c804db051662a, %l2 = 00000000000000ff, %l1 = 00000000816036ff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 866c804db051662a
!	Mem[0000000010181436] = 80119692, %l0 = 00000000ff366081
	ldstub	[%i6+0x036],%l0		! %l0 = 00000096000000ff
!	Mem[0000000030081410] = 17de5fb2, %l0 = 0000000000000096
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000017000000ff
!	Mem[0000000030081410] = b25fdeff, %l5 = ffffff4bfaf2162c
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000b25fdeff
!	%f3  = 9eed9753, Mem[0000000030181408] = 13fa8532
	sta	%f3 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 9eed9753
!	Mem[0000000010041400] = 4b594eff, %l5 = 00000000b25fdeff
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 000000004b594eff
!	%f16 = 67be1bdd, %f12 = bdce655c, %f5  = a19f87bd
	fdivs	%f16,%f12,%f5 		! %f5  = e96bcc6e
!	%f18 = 17de5232 84aaf27c, %l3 = 0000000000000044
!	Mem[0000000010181418] = b3fc65cc64804183
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010181418] = b3fc65cc64804183
!	Mem[0000000010101408] = 15ba01af, %l7 = 00000000faf2162c
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000015ba01af
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030081400] = ffffff4b faf2162c fda9a1b1 7fee6e24
!	Mem[0000000030081410] = 2c16f2fa d303d2ce 12fb159c f399fb61
!	Mem[0000000030081420] = 3d8f6c31 cadf75ee 919c4ae1 fb7eb842
!	Mem[0000000030081430] = 6c8eb036 89fff5dd 487ef861 15effd90
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400

p0_label_13:
!	Mem[00000000211c0000] = ff70877b, %l5 = 000000004b594eff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff70
!	Mem[0000000030001410] = 5aed8eff, %f28 = 00000000
	lda	[%i0+%o5]0x89,%f28	! %f28 = 5aed8eff
!	Mem[0000000010001408] = 81600172, %l1 = 866c804db051662a
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = ffffffff81600172
!	Mem[0000000010001400] = 2b7c4822, %l3 = 0000000000000044
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000022
!	Mem[00000000300c1400] = 46e97f29, %l1 = ffffffff81600172
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 0000000046e97f29
!	%l6 = 00000000ffffff4b, %l6 = 00000000ffffff4b, %l6 = 00000000ffffff4b
	xnor	%l6,%l6,%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = fa17dbfb c51e0ba2, %l4 = a1ed70f8, %l5 = 0000ff70
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000c51e0ba2 00000000fa17dbfb
!	Mem[0000000010081400] = f72962da, %l7 = 0000000015ba01af
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 00000000000062da
!	Mem[0000000030041410] = 22487c2b, %f17 = bf74240a
	lda	[%i1+%o5]0x81,%f17	! %f17 = 22487c2b
!	Starting 10 instruction Store Burst
!	%l4 = 00000000c51e0ba2, %l1 = 0000000046e97f29, %l2 = 00000000000000ff
	orn	%l4,%l1,%l2		! %l2 = fffffffffd1e8bf6

p0_label_14:
!	%l3 = 0000000000000022, Mem[0000000030001400] = 67be1bdd
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000022
!	%l7 = 00000000000062da, Mem[0000000010081400] = f72962da
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = f72962da
!	%l5 = 00000000fa17dbfb, Mem[0000000020800000] = 1fa6edbb
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = dbfbedbb
!	%f21 = fa8a642b, Mem[0000000030141400] = 0c000000
	sta	%f21,[%i5+%g0]0x81	! Mem[0000000030141400] = fa8a642b
!	Mem[00000000201c0001] = 608175c1, %l0 = 0000000000000017
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000081000000ff
!	%f18 = 17de5232 84aaf27c, %l1 = 0000000046e97f29
!	Mem[0000000030181410] = f870eda1af12fed5
	add	%i6,0x010,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030181410] = 7cf2aa84af12fed5
!	%l0 = 0000000000000081, Mem[0000000010041400] = b25fdeff
	stw	%l0,[%i1+%g0]		! Mem[0000000010041400] = 00000081
!	%f16 = 67be1bdd, Mem[00000000100c1408] = 92236e92
	sta	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 67be1bdd
!	Mem[0000000020800041] = 1b19ecd0, %l0 = 0000000000000081
	ldstub	[%o1+0x041],%l0		! %l0 = 00000019000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = 89b2e2bd, %l7 = 00000000000062da
	ldsw	[%i3+0x014],%l7		! %l7 = ffffffff89b2e2bd

p0_label_15:
!	Mem[0000000010041408] = fafdf856b3cf8cba, %f20 = 9e3612e3 fa8a642b
	ldda	[%i1+%o4]0x88,%f20	! %f20 = fafdf856 b3cf8cba
!	Mem[0000000030081408] = fda9a1b17fee6e24, %f28 = 5aed8eff d723702a
	ldda	[%i2+%o4]0x81,%f28	! %f28 = fda9a1b1 7fee6e24
!	Mem[00000000211c0000] = ff70877b, %l1 = 0000000046e97f29
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 363308b3 f45d30ec, %l4 = c51e0ba2, %l5 = fa17dbfb
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000363308b3 00000000f45d30ec
!	Mem[0000000030141408] = 7cf2aa84 3252de17, %l4 = 363308b3, %l5 = f45d30ec
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 000000003252de17 000000007cf2aa84
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000000000019
	setx	0x3d4610d0609a3a80,%g7,%l0 ! %l0 = 3d4610d0609a3a80
!	%l1 = 00000000000000ff
	setx	0x900a6f1feeac1800,%g7,%l1 ! %l1 = 900a6f1feeac1800
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d4610d0609a3a80
	setx	0xfb0e46a828ac98f1,%g7,%l0 ! %l0 = fb0e46a828ac98f1
!	%l1 = 900a6f1feeac1800
	setx	0x10bdcaafc73dcb2b,%g7,%l1 ! %l1 = 10bdcaafc73dcb2b
!	Mem[0000000010181410] = 92236eb3, %l6 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000092
!	Mem[0000000010001438] = fadc9f770f1b0b95, %f20 = fafdf856 b3cf8cba
	ldda	[%i0+0x038]%asi,%f20	! %f20 = fadc9f77 0f1b0b95
!	Mem[0000000010041400] = 00000081, %l0 = fb0e46a828ac98f1
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000081
!	Starting 10 instruction Store Burst
!	%l4 = 000000003252de17, Mem[0000000010181408] = 00001d2d
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = de171d2d

p0_label_16:
!	%l4 = 3252de17, %l5 = 7cf2aa84, Mem[0000000030101400] = 54d291c4 80eb0b2a
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 3252de17 7cf2aa84
!	%l5 = 000000007cf2aa84, Mem[0000000010001410] = 74cb7a97
	stha	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = aa847a97
!	Mem[0000000030001408] = b3083336, %l7 = ffffffff89b2e2bd
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000b3083336
!	Mem[0000000010101400] = 3252de17, %l3 = 0000000000000022
	swap	[%i4+%g0],%l3		! %l3 = 000000003252de17
!	%f18 = 17de5232, %f28 = fda9a1b1
	fcmps	%fcc2,%f18,%f28		! %fcc2 = 2
!	%l7 = 00000000b3083336, Mem[00000000100c143f] = a77b3f76, %asi = 80
	stba	%l7,[%i3+0x03f]%asi	! Mem[00000000100c143c] = a77b3f36
!	%l5 = 000000007cf2aa84, Mem[0000000010141408] = 9861f36c
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 9861f384
!	%f12 = 6c8eb036 89fff5dd, %l3 = 000000003252de17
!	Mem[0000000010081438] = 8fe3d4ec3d356f5d
	add	%i2,0x038,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081438] = 8fe3b03689fff5dd
!	%l1 = 10bdcaafc73dcb2b, Mem[0000000021800180] = e960f473, %asi = 80
	stha	%l1,[%o3+0x180]%asi	! Mem[0000000021800180] = cb2bf473
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = d04808b7a77b3f36, %f10 = 919c4ae1 fb7eb842
	ldda	[%i3+0x038]%asi,%f10	! %f10 = d04808b7 a77b3f36

p0_label_17:
!	Mem[0000000010181400] = 1b1d51ff, %f4  = 2c16f2fa
	lda	[%i6+%g0]0x88,%f4 	! %f4 = 1b1d51ff
!	Mem[0000000030081400] = 2c16f2fa4bffffff, %f16 = 67be1bdd 22487c2b
	ldda	[%i2+%g0]0x89,%f16	! %f16 = 2c16f2fa 4bffffff
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010181400] = ff511d1b efb2d718 de171d2d 9eed9753
!	Mem[0000000010181410] = 92236eb3 a19f87bd b3fc65cc 64804183
!	Mem[0000000010181420] = 082da03a b1a1a9fd ffcc3530 23145b02
!	Mem[0000000010181430] = bdce655c 8011ff92 faf2162c 1aee0638
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030181400] = ff366081, %l1 = 10bdcaafc73dcb2b
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = ffffffffff366081
!	Mem[0000000010141404] = ef5a0afd, %f28 = fda9a1b1
	lda	[%i5+0x004]%asi,%f28	! %f28 = ef5a0afd
!	Mem[0000000010181408] = de171d2d, %l4 = 000000003252de17
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffffde
!	Mem[0000000030181400] = ff366081, %l3 = 000000003252de17
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffff81
!	Mem[0000000030041400] = d2c46fab, %l1 = ffffffffff366081
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000d2
!	Mem[0000000030141410] = 3035cc44, %f30 = 2579ae5c
	lda	[%i5+%o5]0x89,%f30	! %f30 = 3035cc44
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff81, Mem[0000000010141408] = 84f36198
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = ff816198

p0_label_18:
!	%f16 = 2c16f2fa, %f28 = ef5a0afd
	fcmps	%fcc2,%f16,%f28		! %fcc2 = 2
!	Mem[0000000010001410] = 977a84aa, %l1 = 00000000000000d2
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000aa000000ff
!	%l2 = fffffffffd1e8bf6, Mem[0000000010081400] = f72962da
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = f72962f6
!	Mem[0000000020800041] = 1bffecd0, %l0 = 0000000000000081
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030001400] = 00000022, %l6 = 0000000000000092
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000022
!	Mem[0000000010041410] = 5317a465, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000053000000ff
!	%f25 = 816036ff, %f22 = 56ac0c11
	fcmps	%fcc1,%f25,%f22		! %fcc1 = 1
!	Mem[000000001014140a] = ff816198, %l6 = 0000000000000022
	ldstuba	[%i5+0x00a]%asi,%l6	! %l6 = 00000061000000ff
!	%l4 = ffffffde, %l5 = 7cf2aa84, Mem[0000000030001408] = bde2b289 f45d30ec
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffde 7cf2aa84
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 977a84ff, %l0 = 0000000000000053
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 00000000000084ff

p0_label_19:
!	Mem[0000000010041400] = 00000081, %l7 = 00000000b3083336
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 00000092, %l0 = 00000000000084ff
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 9641d7b0cc65bccd, %f16 = 2c16f2fa 4bffffff
	ldda	[%i4+%o4]0x81,%f16	! %f16 = 9641d7b0 cc65bccd
!	Mem[0000000030081408] = fda9a1b1, %f22 = 56ac0c11
	lda	[%i2+%o4]0x81,%f22	! %f22 = fda9a1b1
!	%l1 = 00000000000000aa, imm = fffffffffffff6af, %l4 = ffffffffffffffde
	xor	%l1,-0x951,%l4		! %l4 = fffffffffffff605
!	Mem[0000000010101400] = 0000000022000000, %f26 = 72016081 64902294
	ldda	[%i4+%g0]0x88,%f26	! %f26 = 00000000 22000000
!	Mem[0000000010041410] = 65a417ff, %l1 = 00000000000000aa
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = 00000000000017ff
!	Mem[0000000010081408] = d723702a 13876b2e, %l0 = 00000000, %l1 = 000017ff
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000d723702a 0000000013876b2e
!	Mem[0000000010001410] = ff847a97, %l3 = ffffffffffffff81
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 81000000, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 0000000081000000

p0_label_20:
!	%f31 = 92000000, Mem[00000000100c140c] = 0000007c
	sta	%f31,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 92000000
!	Mem[0000000030101408] = 9641d7b0, %l3 = 0000000081000000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 000000009641d7b0
!	%f28 = ef5a0afd 7fee6e24, %l2 = fffffffffd1e8bf6
!	Mem[0000000030081438] = 487ef86115effd90
	add	%i2,0x038,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081438] = ef5a0afd15effd90
!	Mem[0000000010101408] = faf2162c, %l1 = 0000000013876b2e
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 0000002c000000ff
	membar	#Sync			! Added by membar checker (4)
!	%l7 = 0000000000000000, Mem[0000000010181408] = 5397ed9e2d1d17de
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	%l6 = 0000000000000061, Mem[00000000201c0001] = 60ff75c1, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = 606175c1
!	%f26 = 00000000, Mem[0000000030001410] = ff8eed5a
	sta	%f26,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[00000000201c0001] = 606175c1, %l4 = fffffffffffff605
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000061000000ff
!	Mem[00000000300c1408] = c51e0ba2, %l3 = 000000009641d7b0
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000c51e0ba2
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 92000000, %l0 = 00000000d723702a
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000092

p0_label_21:
!	Mem[0000000010141400] = e7cdd534 ef5a0afd ff81ff98 97946159
!	Mem[0000000010141410] = 66427080 b6f43338 c95d38d7 21c5323f
!	Mem[0000000010141420] = 6abf5bc0 9a8b5de6 4838317d 9ce5f11e
!	Mem[0000000010141430] = 42afcd89 9e8cd5cc 3caf1050 6540383c
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000030141410] = 3035cc44, %f19 = 84aaf27c
	lda	[%i5+%o5]0x89,%f19	! %f19 = 3035cc44
!	Mem[0000000030141410] = 44cc3530, %l1 = 000000000000002c
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000044
!	Mem[00000000300c1400] = 46e97f29, %l2 = fffffffffd1e8bf6
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000029
!	Mem[00000000100c1408] = 00000092dd1bbe67, %f26 = 00000000 22000000
	ldda	[%i3+%o4]0x88,%f26	! %f26 = 00000092 dd1bbe67
!	Mem[0000000030101408] = cdbc65cc00000081, %f20 = fadc9f77 0f1b0b95
	ldda	[%i4+%o4]0x89,%f20	! %f20 = cdbc65cc 00000081
!	Mem[0000000030001400] = 92000000, %l4 = 0000000000000061
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 038d0c6f, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 00000000038d0c6f
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 0000000000000092
	setx	0x1910f6904c574669,%g7,%l0 ! %l0 = 1910f6904c574669
!	%l1 = 0000000000000044
	setx	0x19f6ae102308e944,%g7,%l1 ! %l1 = 19f6ae102308e944
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1910f6904c574669
	setx	0x74e07ed832f3e29c,%g7,%l0 ! %l0 = 74e07ed832f3e29c
!	%l1 = 19f6ae102308e944
	setx	0x1ce09b585eff4720,%g7,%l1 ! %l1 = 1ce09b585eff4720
!	Starting 10 instruction Store Burst
!	Mem[0000000010041419] = df8af42f, %l1 = 1ce09b585eff4720
	ldstuba	[%i1+0x019]%asi,%l1	! %l1 = 0000008a000000ff

p0_label_22:
!	%l4 = 00000000038d0c6f, Mem[0000000030181410] = 84aaf27c
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 038d0c6f
!	%f30 = 3035cc44 92000000, Mem[0000000030181410] = 6f0c8d03 af12fed5
	stda	%f30,[%i6+%o5]0x81	! Mem[0000000030181410] = 3035cc44 92000000
!	Mem[0000000010001400] = 2b7c4822, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000002b7c4822
	membar	#Sync			! Added by membar checker (5)
!	%f18 = 17de5232 3035cc44, Mem[0000000010141400] = e7cdd534 ef5a0afd
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 17de5232 3035cc44
!	Mem[0000000030141410] = 3035cc44, %l4 = 00000000038d0c6f
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 00000044000000ff
!	Mem[00000000218000c1] = bbec968e, %l3 = 00000000c51e0ba2
	ldstub	[%o3+0x0c1],%l3		! %l3 = 000000ec000000ff
!	Mem[000000001010143d] = 52966f1f, %l3 = 00000000000000ec
	ldstuba	[%i4+0x03d]%asi,%l3	! %l3 = 00000096000000ff
!	%l1 = 000000000000008a, Mem[00000000100c142f] = a282e87f, %asi = 80
	stba	%l1,[%i3+0x02f]%asi	! Mem[00000000100c142c] = a282e88a
!	Mem[0000000030181400] = ff366081, %l0 = 74e07ed832f3e29c
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000081000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000f72962f6, %f8  = 6abf5bc0 9a8b5de6
	ldda	[%i2+%g0]0x88,%f8 	! %f8  = ff000000 f72962f6

p0_label_23:
!	Mem[0000000030081410] = 2c16f2fa, %l7 = 000000002b7c4822
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 000000000000002c
!	Mem[0000000010081410] = 2ad746df, %f26 = 00000092
	lda	[%i2+%o5]0x88,%f26	! %f26 = 2ad746df
!	Mem[0000000010081410] = 2ad746df, %l1 = 000000000000008a
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 000000002ad746df
!	Mem[0000000010001408] = 72016081, %l0 = 0000000000000081
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000072
!	%l4 = 0000000000000044, imm = 0000000000000a50, %l6 = 0000000000000061
	subc	%l4,0xa50,%l6		! %l6 = fffffffffffff5f4
!	Mem[00000000300c1408] = b0d74196, %l5 = 000000007cf2aa84
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffb0
!	Mem[0000000030081400] = 4bffffff, %l7 = 000000000000002c
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 60ff75c1, %l3 = 0000000000000096
	ldub	[%o0+%g0],%l3		! %l3 = 0000000000000060
!	Mem[0000000030141400] = 2b648afa, %l7 = 00000000000000ff
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = 000000002b648afa
!	Starting 10 instruction Store Burst
!	%f22 = fda9a1b1 dabdccce, %l1 = 000000002ad746df
!	Mem[0000000010141410] = 66427080b6f43338
	add	%i5,0x010,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141410] = fda9a1b1dabdccce

p0_label_24:
!	Mem[0000000010141408] = ff81ff98, %l1 = 000000002ad746df
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030181408] = 5397ed9e, %l1 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 000000005397ed9e
!	Mem[000000001008143c] = 89fff5dd, %l4 = 0000000000000044, %asi = 80
	swapa	[%i2+0x03c]%asi,%l4	! %l4 = 0000000089fff5dd
!	%f21 = 00000081, Mem[0000000010141428] = 4838317d
	sta	%f21,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000081
!	%l7 = 000000002b648afa, Mem[00000000100c1410] = 038d0c6f
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = fa8d0c6f
!	%l3 = 0000000000000060, Mem[000000001008142c] = 1a856004
	stw	%l3,[%i2+0x02c]		! Mem[000000001008142c] = 00000060
!	%l5 = ffffffffffffffb0, Mem[0000000010041400] = ff0000009c47a94e
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffffffffffb0
!	Mem[00000000100c1400] = ceccbdda, %l7 = 000000002b648afa
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ce000000ff
!	%f4  = 66427080 b6f43338, %l2 = 0000000000000029
!	Mem[0000000010001430] = 043260496a782d43
	add	%i0,0x030,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010001430] = 383360496a784266
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 2b648afa, %l1 = 000000005397ed9e
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = 000000002b648afa

p0_label_25:
!	Mem[00000000218001c0] = c5ad75f7, %l5 = ffffffffffffffb0
	ldsh	[%o3+0x1c0],%l5		! %l5 = ffffffffffffc5ad
!	Mem[00000000100c1408] = 67be1bdd, %l7 = 00000000000000ce
	ldsb	[%i3+0x009],%l7		! %l7 = ffffffffffffffbe
!	Mem[00000000201c0000] = 60ff75c1, %l5 = ffffffffffffc5ad
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000060
!	Mem[0000000010101400] = 00000022 00000000, %l2 = 00000029, %l3 = 00000060
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000022 0000000000000000
!	Mem[0000000030101400] = 17de5232, %l7 = ffffffffffffffbe
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = 00000000000017de
!	Mem[0000000010081408] = d723702a 13876b2e, %l2 = 00000022, %l3 = 00000000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 00000000d723702a 0000000013876b2e
!	Mem[0000000030001410] = 00000000, %f2  = ff81ff98
	lda	[%i0+%o5]0x81,%f2 	! %f2 = 00000000
!	Mem[0000000030001400] = 00000092bf74240a, %f14 = 3caf1050 6540383c
	ldda	[%i0+%g0]0x81,%f14	! %f14 = 00000092 bf74240a
!	Mem[0000000010181424] = b1a1a9fd, %l2 = 00000000d723702a
	ldsba	[%i6+0x025]%asi,%l2	! %l2 = ffffffffffffffa1
!	Starting 10 instruction Store Burst
!	%f6  = c95d38d7 21c5323f, %l4 = 0000000089fff5dd
!	Mem[00000000100c1418] = 079e2c001e49fec9
	add	%i3,0x018,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1418] = 3f9ec521d7495dc9

p0_label_26:
!	Mem[0000000010081408] = d723702a, %l4 = 0000000089fff5dd
	swap	[%i2+%o4],%l4		! %l4 = 00000000d723702a
!	Mem[0000000030101400] = 3252de17, %l4 = 00000000d723702a
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000017000000ff
!	%l1 = 000000002b648afa, Mem[0000000010081400] = ff000000f72962f6
	stxa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000002b648afa
!	%l3 = 0000000013876b2e, Mem[0000000010081408] = 89fff5dd
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 6b2ef5dd
!	Mem[0000000030041410] = 2b7c4822, %l4 = 0000000000000017
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 000000002b7c4822
!	Mem[0000000010001408] = 81600172, %l3 = 0000000013876b2e
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 00000072000000ff
!	Mem[0000000030141408] = 3252de17, %l0 = 0000000000000072
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000003252de17
!	%l0 = 000000003252de17, Mem[00000000211c0000] = ff70877b, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = de17877b
!	Mem[00000000300c1400] = 46e97f29, %l5 = 0000000000000060
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000046e97f29
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffffffffffb0, %l3 = 0000000000000072
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffb0

p0_label_27:
!	Mem[0000000010101434] = e67dabc1, %l4 = 000000002b7c4822
	ldswa	[%i4+0x034]%asi,%l4	! %l4 = ffffffffe67dabc1
!	Mem[00000000100c1408] = 67be1bdd, %l7 = 00000000000017de
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000067be1bdd
!	Mem[0000000020800000] = dbfbedbb, %l7 = 0000000067be1bdd
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffdb
!	%l0 = 000000003252de17, immed = 00000fb5, %y  = 3155831c
	umul	%l0,0xfb5,%l4		! %l4 = 000003166f9a5f43, %y = 00000316
!	Mem[0000000030141400] = fa8a642b, %l5 = 0000000046e97f29
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000fa
!	Mem[0000000030141410] = 3035ccff, %f18 = 17de5232
	lda	[%i5+%o5]0x89,%f18	! %f18 = 3035ccff
!	Mem[0000000010101408] = 10f8b35ffaf216ff, %f28 = ef5a0afd 7fee6e24
	ldda	[%i4+%o4]0x88,%f28	! %f28 = 10f8b35f faf216ff
!	Mem[0000000030141410] = ffcc3530691ec5b0, %f30 = 3035cc44 92000000
	ldda	[%i5+%o5]0x81,%f30	! %f30 = ffcc3530 691ec5b0
!	Mem[0000000030041400] = 59146161 ab6fc4d2, %l0 = 3252de17, %l1 = 2b648afa
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000ab6fc4d2 0000000059146161
!	Starting 10 instruction Store Burst
!	%l2 = ffffffa1, %l3 = ffffffb0, Mem[0000000030181408] = ff000000 8df17230
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffa1 ffffffb0

p0_label_28:
!	Mem[00000000201c0001] = 60ff75c1, %l7 = ffffffffffffffdb
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001014143c] = 6540383c, %l6 = fffffffffffff5f4
	swap	[%i5+0x03c],%l6		! %l6 = 000000006540383c
!	Mem[0000000010101408] = ff16f2fa, %l6 = 000000006540383c
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff16f2fa
!	%l7 = 00000000000000ff, Mem[0000000010141410] = b1a1a9fd
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l5 = 00000000000000fa, Mem[00000000211c0000] = de17877b
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00fa877b
!	%l7 = 00000000000000ff, Mem[0000000010101410] = 9200000044000000
	stxa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	%l6 = 00000000ff16f2fa, Mem[0000000010181400] = ff511d1b
	stha	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = f2fa1d1b
!	%l3 = ffffffffffffffb0, Mem[0000000010101408] = 6540383c
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = b040383c
!	%f30 = ffcc3530, %f2  = 00000000, %f20 = cdbc65cc
	fsubs	%f30,%f2 ,%f20		! %f20 = ffcc3530
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffcc3530, %l2 = ffffffffffffffa1
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffffcc

p0_label_29:
!	Mem[00000000211c0000] = 00fa877b, %l7 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081428] = a8fbcaf5, %l1 = 0000000059146161
	lduwa	[%i2+0x028]%asi,%l1	! %l1 = 00000000a8fbcaf5
!	Mem[00000000300c1408] = 9641d7b0, %f27 = dd1bbe67
	lda	[%i3+%o4]0x89,%f27	! %f27 = 9641d7b0
!	Mem[0000000030081410] = faf2162c, %l3 = ffffffffffffffb0
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000faf2162c
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010081400] = fa8a642b 00000000 6b2ef5dd 13876b2e
!	Mem[0000000010081410] = df46d72a 9442646f aa578b53 b7e40821
!	Mem[0000000010081420] = 32c0fc82 93318abb a8fbcaf5 00000060
!	Mem[0000000010081430] = 0542b5e2 2a7232f0 8fe3b036 00000044
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000030141410] = ffcc3530 691ec5b0, %l2 = ffffffcc, %l3 = faf2162c
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffcc3530 00000000691ec5b0
!	Mem[0000000010041408] = ba8ccfb3 56f8fdfa, %l4 = 6f9a5f43, %l5 = 000000fa
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ba8ccfb3 0000000056f8fdfa
!	Mem[0000000030101408] = 00000081, %l1 = 00000000a8fbcaf5
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000081
!	Mem[0000000030101400] = ffde5232, %l5 = 0000000056f8fdfa
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffde5232
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 67be1bdd, %l2 = 00000000ffcc3530
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000067000000ff

p0_label_30:
!	%l4 = 00000000ba8ccfb3, Mem[0000000030041408] = 17de5232
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ba8ccfb3
!	Mem[0000000030141400] = 2b648afa, %l1 = 0000000000000081
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 000000fa000000ff
!	Mem[0000000010141410] = 000000ff, %l2 = 0000000000000067
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000691ec5b0, Mem[000000001018143c] = 1aee0638, %asi = 80
	stwa	%l3,[%i6+0x03c]%asi	! Mem[000000001018143c] = 691ec5b0
!	%l2 = 00000000000000ff, Mem[0000000010101428] = fe4731838b39271f
	stx	%l2,[%i4+0x028]		! Mem[0000000010101428] = 00000000000000ff
	membar	#Sync			! Added by membar checker (7)
!	%f30 = ffcc3530 691ec5b0, %l6 = 00000000ff16f2fa
!	Mem[0000000010081418] = aa578b53b7e40821
	add	%i2,0x018,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_P ! Mem[0000000010081418] = ffcc8b53691e0821
!	%l3 = 00000000691ec5b0, Mem[00000000211c0001] = 00fa877b
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 00b0877b
!	%l4 = ba8ccfb3, %l5 = ffde5232, Mem[0000000030041400] = d2c46fab 61611459
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ba8ccfb3 ffde5232
!	%l3 = 00000000691ec5b0, Mem[0000000010181410] = bd879fa1b36e2392
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000691ec5b0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = df46d72a, %f11 = 00000060
	lda	[%i2+%o5]0x80,%f11	! %f11 = df46d72a

p0_label_31:
!	Mem[0000000010181430] = bdce655c 8011ff92, %l0 = ab6fc4d2, %l1 = 000000fa
	ldda	[%i6+0x030]%asi,%l0	! %l0 = 00000000bdce655c 000000008011ff92
!	Mem[0000000030101400] = 7cf2aa843252deff, %f28 = 10f8b35f faf216ff
	ldda	[%i4+%g0]0x89,%f28	! %f28 = 7cf2aa84 3252deff
!	Mem[0000000010141410] = 00000067, %l3 = 00000000691ec5b0
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000067
!	%l2 = 00000000000000ff, %l0 = 00000000bdce655c, %l6 = 00000000ff16f2fa
	subc	%l2,%l0,%l6		! %l6 = ffffffff42319ba3
!	Mem[0000000030181410] = 3035cc4492000000, %l5 = ffffffffffde5232
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 3035cc4492000000
!	Mem[0000000030001410] = 00000000, %l5 = 3035cc4492000000
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000218000c0] = bbff968e, %l6 = ffffffff42319ba3
	ldsha	[%o3+0x0c0]%asi,%l6	! %l6 = ffffffffffffbbff
!	Mem[00000000100c1408] = dd1bbeff, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 000000000000beff
!	Mem[0000000010081424] = 93318abb, %l4 = 00000000ba8ccfb3
	lduw	[%i2+0x024],%l4		! %l4 = 0000000093318abb
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 3252deff, %l0 = 00000000bdce655c
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_32:
!	Mem[00000000100c1410] = 6f0c8dfa, %l1 = 000000008011ff92
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000fa000000ff
!	%l6 = ffffffffffffbbff, immed = 00000aca, %y  = 00000316
	umul	%l6,0xaca,%l7		! %l7 = 00000ac9fd224d36, %y = 00000ac9
!	%l3 = 0000000000000067, Mem[000000001014142c] = 9ce5f11e
	stb	%l3,[%i5+0x02c]		! Mem[000000001014142c] = 67e5f11e
!	Mem[0000000010181402] = f2fa1d1b, %l2 = 00000000000000ff
	ldstuba	[%i6+0x002]%asi,%l2	! %l2 = 0000001d000000ff
!	%l7 = 00000ac9fd224d36, Mem[0000000030141410] = ffcc3530
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = fd224d36
!	%f24 = e7cdd534 816036ff, %l7 = 00000ac9fd224d36
!	Mem[0000000010001428] = 16848775c6f3cfff
	add	%i0,0x028,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_P ! Mem[0000000010001428] = 1684d534c66036ff
!	%f3  = 13876b2e, Mem[00000000100c1410] = ff8d0c6f
	sta	%f3 ,[%i3+0x010]%asi	! Mem[00000000100c1410] = 13876b2e
!	%l2 = 000000000000001d, Mem[0000000010101408] = 3c3840b0
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 3c38001d
!	%l7 = 00000ac9fd224d36, Mem[0000000010181408] = 00000000
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00004d36
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %f4  = df46d72a
	lda	[%i1+%g0]0x88,%f4 	! %f4 = ffffffff

p0_label_33:
!	Mem[0000000030001408] = ffffffde 7cf2aa84, %l0 = 000000ff, %l1 = 000000fa
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ffffffde 000000007cf2aa84
!	Mem[0000000010101410] = ff00000000000000, %f28 = 7cf2aa84 3252deff
	ldda	[%i4+%o5]0x88,%f28	! %f28 = ff000000 00000000
!	Mem[000000001000142c] = c66036ff, %l2 = 000000000000001d
	ldsb	[%i0+0x02e],%l2		! %l2 = 0000000000000036
!	Mem[0000000030001408] = ffffffde7cf2aa84, %l0 = 00000000ffffffde
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = ffffffde7cf2aa84
!	Mem[0000000010181418] = b3fc65cc, %l7 = 00000ac9fd224d36
	ldsh	[%i6+0x018],%l7		! %l7 = ffffffffffffb3fc
!	Mem[0000000010001410] = ff847a97, %l1 = 000000007cf2aa84
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = ffffffa1, %l6 = ffffffffffffbbff
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffffffa1
!	Mem[00000000201c0000] = 60ff75c1, %l6 = ffffffffffffffa1
	lduh	[%o0+%g0],%l6		! %l6 = 00000000000060ff
!	Mem[00000000100c1400] = dabdccff, %l4 = 0000000093318abb
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = ffffffffdabdccff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 60ff75c1, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff75c1

p0_label_34:
!	Mem[0000000010141404] = 3035cc44, %l7 = ffffffffffffb3fc, %asi = 80
	swapa	[%i5+0x004]%asi,%l7	! %l7 = 000000003035cc44
!	%f11 = df46d72a, Mem[0000000010081400] = 2b648afa
	sta	%f11,[%i2+%g0]0x88	! Mem[0000000010081400] = df46d72a
!	%f2  = 6b2ef5dd, Mem[00000000100c1408] = ffbe1bdd
	sta	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6b2ef5dd
!	%l7 = 000000003035cc44, Mem[0000000010001431] = 38336049
	stb	%l7,[%i0+0x031]		! Mem[0000000010001430] = 38446049
!	Mem[0000000010081428] = a8fbcaf5, %l7 = 3035cc44, %l5 = 00000000
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000a8fbcaf5
!	Mem[0000000010081434] = 2a7232f0, %l2 = 0000000000000036, %asi = 80
	swapa	[%i2+0x034]%asi,%l2	! %l2 = 000000002a7232f0
!	%f6  = aa578b53 b7e40821, Mem[0000000010001438] = fadc9f77 0f1b0b95
	stda	%f6 ,[%i0+0x038]%asi	! Mem[0000000010001438] = aa578b53 b7e40821
!	%f0  = fa8a642b 00000000 6b2ef5dd 13876b2e
!	%f4  = ffffffff 9442646f aa578b53 b7e40821
!	%f8  = 32c0fc82 93318abb a8fbcaf5 df46d72a
!	%f12 = 0542b5e2 2a7232f0 8fe3b036 00000044
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l4 = ffffffffdabdccff, Mem[000000001004140a] = ba8ccfb3, %asi = 80
	stba	%l4,[%i1+0x00a]%asi	! Mem[0000000010041408] = ba8cffb3
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 3252deffb3cf8cba, %l0 = ffffffde7cf2aa84
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 3252deffb3cf8cba

p0_label_35:
!	Mem[000000001014143c] = fffff5f4, %l2 = 000000002a7232f0
	ldub	[%i5+0x03f],%l2		! %l2 = 00000000000000f4
!	Mem[0000000010041410] = af85c604 65a417ff, %l2 = 000000f4, %l3 = 00000067
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 0000000065a417ff 00000000af85c604
!	%l6 = 00000000000060ff, %l6 = 00000000000060ff, %l4 = ffffffffdabdccff
	addc	%l6,%l6,%l4		! %l4 = 000000000000c1fe
!	Mem[0000000010101414] = 000000ff, %l6 = 00000000000060ff
	lduha	[%i4+0x016]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = dbfbedbb, %l3 = 00000000af85c604
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000dbfb
!	Mem[00000000300c1408] = 9641d7b0, %l7 = 000000003035cc44
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffb0
!	Mem[0000000010081430] = 0542b5e2, %l7 = ffffffffffffffb0
	lduwa	[%i2+0x030]%asi,%l7	! %l7 = 000000000542b5e2
!	%f20 = ffcc3530, %f27 = 9641d7b0, %f19 = 3035cc44
	fdivs	%f20,%f27,%f19		! %f19 = ffcc3530
!	Mem[0000000010081408] = 6b2ef5dd, %l1 = 00000000000000ff
	lduha	[%i2+0x00a]%asi,%l1	! %l1 = 000000000000f5dd
!	Starting 10 instruction Store Burst
!	%f18 = 3035ccff ffcc3530, Mem[0000000010041400] = ffffffff ffffffb0
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = 3035ccff ffcc3530

p0_label_36:
!	%l2 = 0000000065a417ff, Mem[0000000030081400] = 4bffffff
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 4bff17ff
!	Mem[0000000030141400] = 2b648aff, %l5 = 00000000a8fbcaf5
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 000000002b648aff
!	%f27 = 9641d7b0, Mem[0000000010141400] = 17de5232
	sta	%f27,[%i5+%g0]0x80	! Mem[0000000010141400] = 9641d7b0
!	Mem[0000000010181410] = 691ec5b0, %l1 = 000000000000f5dd
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000691ec5b0
!	%f24 = e7cdd534, %f22 = fda9a1b1, %f20 = ffcc3530 00000081
	fsmuld	%f24,%f22,%f20		! %f20 = 4cc10c78 17439e80
!	%l3 = 000000000000dbfb, Mem[0000000020800041] = 1bffecd0
	stb	%l3,[%o1+0x041]		! Mem[0000000020800040] = 1bfbecd0
!	%l0 = 3252deffb3cf8cba, Mem[00000000201c0000] = 00ff75c1
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 8cba75c1
!	%l4 = 0000c1fe, %l5 = 2b648aff, Mem[0000000010081408] = ddf52e6b 2e6b8713
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000c1fe 2b648aff
!	%l0 = 3252deffb3cf8cba, Mem[0000000020800000] = dbfbedbb
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 8cbaedbb
!	Starting 10 instruction Load Burst
!	%l1 = 00000000691ec5b0, %l6 = 00000000000000ff, %y  = 00000ac9
	smul	%l1,%l6,%l1		! %l1 = 00000068b5a6ea50, %y = 00000068

p0_label_37:
!	Mem[0000000030001410] = 00000000, %l0 = 3252deffb3cf8cba
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000022, %f25 = 816036ff
	lda	[%i4+%g0]0x80,%f25	! %f25 = 00000022
!	%l1 = 00000068b5a6ea50, immd = 0000000000000c8f, %l5  = 000000002b648aff
	mulx	%l1,0xc8f,%l5		! %l5 = 000523014b38a2b0
!	Mem[0000000010141408] = ff81ff98, %l4 = 000000000000c1fe
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffff81
!	Mem[0000000030081408] = fda9a1b1, %l5 = 000523014b38a2b0
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = fffffffffffffffd
!	Mem[0000000030001400] = 0a2474bf 92000000, %l0 = 00000000, %l1 = b5a6ea50
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000092000000 000000000a2474bf
!	Mem[0000000030041410] = 00000017, %l6 = 00000000000000ff
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000017
!	Mem[0000000010001438] = aa578b53 b7e40821, %l0 = 92000000, %l1 = 0a2474bf
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 00000000aa578b53 00000000b7e40821
!	Mem[0000000010081408] = fec10000, %l3 = 000000000000dbfb
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 000000000000fec1
!	Starting 10 instruction Store Burst
!	%l2 = 0000000065a417ff, Mem[00000000300c1408] = 9641d7b0
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 9641d7ff

p0_label_38:
!	Mem[0000000010081400] = df46d72a, %l6 = 0000000000000017
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 0000002a000000ff
!	%f26 = 2ad746df, %f24 = e7cdd534, %f3  = 13876b2e
	fdivs	%f26,%f24,%f3 		! %f3  = 8285df76
!	%f18 = 3035ccff ffcc3530, %l1 = 00000000b7e40821
!	Mem[0000000030081400] = ff17ff4bfaf2162c
	stda	%f18,[%i2+%l1]ASI_PST16_S ! Mem[0000000030081400] = ff17ff4bfaf23530
!	%l3 = 000000000000fec1, Mem[0000000010141410] = 67000000
	stw	%l3,[%i5+%o5]		! Mem[0000000010141410] = 0000fec1
!	%l4 = ffffffffffffff81, Mem[0000000010101410] = 00000000
	stba	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 81000000
!	%l0 = 00000000aa578b53, Mem[0000000030181408] = a1ffffff
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 8b53ffff
!	Mem[0000000030181410] = 44cc3530, %l7 = 000000000542b5e2
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 00000030000000ff
!	%f10 = a8fbcaf5, %f7  = b7e40821
	fcmps	%fcc2,%f10,%f7 		! %fcc2 = 2
!	%l5 = fffffffffffffffd, Mem[0000000030181400] = ff6036ff
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = fffd36ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffcc3530, %f21 = 17439e80
	lda	[%i1+%g0]0x88,%f21	! %f21 = ffcc3530

p0_label_39:
!	Mem[0000000010101408] = 1d00383c, %l6 = 000000000000002a
	ldsha	[%i4+0x008]%asi,%l6	! %l6 = 0000000000001d00
!	Mem[0000000030181410] = 44cc35ff, %f20 = 4cc10c78
	lda	[%i6+%o5]0x89,%f20	! %f20 = 44cc35ff
!	Mem[0000000021800040] = 27dfd2c8, %l2 = 0000000065a417ff
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = ffffffffffffffdf
!	Mem[0000000010041400] = ffcc3530, %f31 = 691ec5b0
	lda	[%i1+%g0]0x88,%f31	! %f31 = ffcc3530
	membar	#Sync			! Added by membar checker (8)
!	Mem[00000000100c1408] = 6b2ef5dd, %l4 = ffffffffffffff81
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = 000000000000006b
!	Mem[0000000030101400] = ffde5232 84aaf27c 81000000 cc65bccd
!	Mem[0000000030101410] = ff4b06a1 29ad2ce4 5727e874 f6cc8abd
!	Mem[0000000030101420] = d488a646 1a315cff 595e11c7 0710d380
!	Mem[0000000030101430] = 909c4eed 836e8709 b181e1df 24c24b88
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010041410] = 65a417ff, %l5 = fffffffffffffffd
	ldsha	[%i1+%o5]0x88,%l5	! %l5 = 00000000000017ff
!	Mem[0000000030101400] = ffde5232 84aaf27c 81000000 cc65bccd
!	Mem[0000000030101410] = ff4b06a1 29ad2ce4 5727e874 f6cc8abd
!	Mem[0000000030101420] = d488a646 1a315cff 595e11c7 0710d380
!	Mem[0000000030101430] = 909c4eed 836e8709 b181e1df 24c24b88
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001420] = da50baaf, %l6 = 0000000000001d00
	ldswa	[%i0+0x020]%asi,%l6	! %l6 = ffffffffda50baaf
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 3c38001d, %l1 = 00000000b7e40821
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000003c38001d

p0_label_40:
!	Mem[00000000300c1408] = 9641d7ff, %l0 = 00000000aa578b53
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010081400] = ffd746df
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff46df
!	%l2 = ffffffffffffffdf, immed = 00000066, %y  = 00000068
	smul	%l2,0x066,%l4		! %l4 = fffffffffffff2da, %y = ffffffff
!	Mem[00000000100c1410] = ffffffff, %l1 = 000000003c38001d
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ffffffff
!	%l4 = fffffffffffff2da, Mem[0000000010081408] = fec10000ff8a642b, %asi = 80
	stxa	%l4,[%i2+0x008]%asi	! Mem[0000000010081408] = fffffffffffff2da
!	Mem[0000000010181400] = 1bfffaf2, %l3 = 000000000000fec1
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000f2000000ff
!	Mem[0000000010181408] = 00004d36, %l2 = ffffffffffffffdf
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000004d36
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010141408] = 98ff81ff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 98ff0000
!	Starting 10 instruction Load Burst
!	%f8  = ff5c311a, %f10 = 80d31007 c7115e59
	fitod	%f8 ,%f10		! %f10 = c16479dc c0000000

p0_label_41:
!	%f3  = 00000081, %f1  = 3252deff, %f14 = 884bc224
	fsubs	%f3 ,%f1 ,%f14		! %l0 = 0000000000000022, Unfinished, %fsr = 0900000000
!	Mem[0000000010001408] = 94229064 816001ff, %l2 = 00004d36, %l3 = 000000f2
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000816001ff 0000000094229064
!	Mem[0000000010101400] = 0000002200000000, %f14 = 884bc224 dfe181b1
	ldda	[%i4+%g0]0x80,%f14	! %f14 = 00000022 00000000
!	Mem[0000000010041428] = 7ffbc477, %l2 = 00000000816001ff
	ldsh	[%i1+0x02a],%l2		! %l2 = ffffffffffffc477
!	Mem[0000000030081408] = fda9a1b1, %l5 = 00000000000017ff
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 00000000fda9a1b1
!	Mem[00000000300c1408] = ffd74196fbdb17fa, %f2  = cdbc65cc 00000081
	ldda	[%i3+%o4]0x81,%f2 	! %f2  = ffd74196 fbdb17fa
!	Mem[00000000201c0000] = 8cba75c1, %l1 = 00000000ffffffff
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 000000000000008c
!	Mem[0000000010181408] = dfffffff, %l1 = 000000000000008c
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000dfff
!	Mem[00000000100c1400] = fa8a642b 00000000, %l0 = 00000022, %l1 = 0000dfff
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000fa8a642b 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000fda9a1b1, Mem[0000000030181410] = 0000009244cc35ff
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000fda9a1b1

p0_label_42:
!	Mem[00000000100c1400] = 2b648afa, %l6 = ffffffffda50baaf
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 000000002b648afa
!	%l2 = ffffc477, %l3 = 94229064, Mem[0000000030001410] = 00000000 dde5bb7e
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffc477 94229064
!	Mem[0000000010041408] = ba8cffb356f8fdfa, %l5 = 00000000fda9a1b1, %l0 = 00000000fa8a642b
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = ba8cffb356f8fdfa
!	%f12 = 09876e83, Mem[0000000010081400] = df46ff00
	sta	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 09876e83
!	%l7 = 0000000000000030, Mem[0000000010141400] = 9641d7b0
	stba	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 3041d7b0
!	%l4 = fffffffffffff2da, Mem[000000001000143b] = aa578b53, %asi = 80
	stba	%l4,[%i0+0x03b]%asi	! Mem[0000000010001438] = aa578bda
	membar	#Sync			! Added by membar checker (9)
!	%l5 = 00000000fda9a1b1, Mem[0000000030101400] = ffde5232
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = a1b15232
!	Mem[000000001000141e] = 7a2b4159, %l0 = ba8cffb356f8fdfa
	ldstuba	[%i0+0x01e]%asi,%l0	! %l0 = 00000041000000ff
!	%f0  = 7cf2aa84 3252deff, Mem[0000000010041400] = 3035ccff ffcc3530
	stda	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 7cf2aa84 3252deff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ba8ccfb3, %l7 = 0000000000000030
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000ba8c

p0_label_43:
!	Mem[00000000300c1408] = 9641d7ff, %l6 = 000000002b648afa
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = ffffffff9641d7ff
!	Mem[0000000030181410] = fda9a1b1, %l4 = fffffffffffff2da
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffffb1
!	Mem[0000000010041410] = 65a417ff, %l0 = 0000000000000041
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000017ff
!	Mem[0000000010041410] = ff17a465 04c685af, %l2 = ffffc477, %l3 = 94229064
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff17a465 0000000004c685af
!	Mem[00000000211c0000] = 00b0877b, %l2 = 00000000ff17a465
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000b0
!	Mem[0000000030181400] = ff36fdff, %l7 = 000000000000ba8c
	ldsha	[%i6+%g0]0x89,%l7	! %l7 = fffffffffffffdff
!	Mem[0000000030081408] = fda9a1b1, %l6 = ffffffff9641d7ff
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 00000000fda9a1b1
!	Mem[0000000010001400] = 000000ff, %f3  = fbdb17fa
	lda	[%i0+%g0]0x88,%f3 	! %f3 = 000000ff
!	Mem[0000000010041408] = ba8cffb3, %l2 = 00000000000000b0
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 000000000000ba8c
!	Starting 10 instruction Store Burst
!	%f10 = c16479dc c0000000, %l1 = 0000000000000000
!	Mem[0000000030041400] = ba8ccfb3ffde5232
	stda	%f10,[%i1+%l1]ASI_PST32_S ! Mem[0000000030041400] = ba8ccfb3ffde5232

p0_label_44:
!	%f16 = ffde5232 84aaf27c 81000000 cc65bccd
!	%f20 = ff4b06a1 29ad2ce4 5727e874 f6cc8abd
!	%f24 = d488a646 1a315cff 595e11c7 0710d380
!	%f28 = 909c4eed 836e8709 b181e1df 24c24b88
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%f6  = bd8accf6, Mem[0000000010101408] = b7e40821
	sta	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = bd8accf6
!	%l1 = 0000000000000000, imm = fffffffffffffdbc, %l1 = 0000000000000000
	xnor	%l1,-0x244,%l1		! %l1 = 0000000000000243
!	%l1 = 0000000000000243, Mem[0000000030041400] = b3cf8cba
	stba	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = b3cf8c43
!	%l1 = 0000000000000243, Mem[000000001000140c] = 64902294, %asi = 80
	stwa	%l1,[%i0+0x00c]%asi	! Mem[000000001000140c] = 00000243
!	Mem[0000000030181410] = fda9a1b1, %l4 = ffffffffffffffb1
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000fda9a1b1
!	Mem[0000000010141400] = b0d74130, %l5 = 00000000fda9a1b1
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 00000030000000ff
!	%l0 = 000017ff, %l1 = 00000243, Mem[0000000010181410] = ddf50000 00000000
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 000017ff 00000243
!	Mem[00000000100c1434] = 2a7232f0, %l2 = 0000ba8c, %l3 = 04c685af
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 000000002a7232f0
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0a2474bf 92000000, %l0 = 000017ff, %l1 = 00000243
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000092000000 000000000a2474bf

p0_label_45:
!	Mem[0000000030141400] = f5cafba8, %l5 = 0000000000000030
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = fffffffff5cafba8
!	Mem[00000000300c1408] = ffd74196, %l6 = 00000000fda9a1b1
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 00b0877b, %l3 = 000000002a7232f0
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 01c816460f6355d7, %f0  = 7cf2aa84 3252deff
	ldda	[%i3+%o5]0x89,%f0 	! %f0  = 01c81646 0f6355d7
!	Mem[00000000300c1400] = 600000001030f3bb, %f12 = 09876e83 ed4e9c90
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 60000000 1030f3bb
!	%l0 = 0000000092000000, Mem[0000000010001410] = ff847a97
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00007a97
!	Mem[00000000100c1420] = 32c0fc8293318abb, %f10 = c16479dc c0000000
	ldd	[%i3+0x020],%f10	! %f10 = 32c0fc82 93318abb
!	%l2 = 000000000000ba8c, %l1 = 000000000a2474bf, %l1 = 000000000a2474bf
	sdivx	%l2,%l1,%l1		! Div by zero, %l0 = 0000000092000028
!	Mem[0000000010101408] = bd8accf6, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l3	! %l3 = ffffffffbd8accf6
!	Starting 10 instruction Store Burst
!	%l4 = 00000000fda9a1b1, Mem[0000000030001410] = 6490229477c4ffff
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000fda9a1b1

p0_label_46:
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010081410] = df46d72a, %l5 = fffffffff5cafba8
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000df46d72a
!	%l7 = fffffffffffffdff, Mem[0000000030001410] = fda9a1b1
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = fda9a1ff
!	%l5 = 00000000df46d72a, Mem[0000000010181410] = 000017ff
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 2a0017ff
!	Mem[0000000010081418] = ffcc8b53, %l0 = 0000000092000000, %asi = 80
	swapa	[%i2+0x018]%asi,%l0	! %l0 = 00000000ffcc8b53
!	%l4 = 00000000fda9a1b1, %l5 = 00000000df46d72a, %l0 = 00000000ffcc8b53
	andn	%l4,%l5,%l0		! %l0 = 0000000020a92091
!	%f18 = 81000000 cc65bccd, %l2 = 000000000000ba8c
!	Mem[0000000010081438] = 8fe3b03600000044
	add	%i2,0x038,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_P ! Mem[0000000010081438] = 81e3b036cc650044
!	%f2  = ffd74196, Mem[0000000010041400] = 7cf2aa84
	st	%f2 ,[%i1+%g0]		! Mem[0000000010041400] = ffd74196
!	Mem[000000001014141c] = 21c5323f, %l4 = 00000000fda9a1b1, %asi = 80
	swapa	[%i5+0x01c]%asi,%l4	! %l4 = 0000000021c5323f
!	%f6  = bd8accf6, Mem[0000000010041410] = 65a417ff
	sta	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = bd8accf6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = bd8accf6, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000f6

p0_label_47:
!	Mem[0000000030081410] = e42cad29 a1064bff, %l2 = 0000ba8c, %l3 = bd8accf6
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000a1064bff 00000000e42cad29
!	Mem[0000000010101410] = 81000000000000ff, %f10 = 32c0fc82 93318abb
	ldda	[%i4+%o5]0x80,%f10	! %f10 = 81000000 000000ff
!	Mem[0000000030081410] = ff4b06a1, %l3 = 00000000e42cad29
	lduha	[%i2+%o5]0x81,%l3	! %l3 = 000000000000ff4b
!	Mem[0000000030081400] = ffde5232, %l1 = 00000000000000f6
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000211c0000] = 00b0877b, %l3 = 000000000000ff4b
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000b0
!	Mem[0000000010001408] = ff016081, %l4 = 0000000021c5323f
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = cdbc65cc00000081, %l2 = 00000000a1064bff
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = cdbc65cc00000081
!	Mem[0000000010001408] = 43020000816001ff, %f24 = d488a646 1a315cff
	ldda	[%i0+%o4]0x88,%f24	! %f24 = 43020000 816001ff
!	Mem[000000001014143c] = fffff5f4, %f25 = 816001ff
	lda	[%i5+0x03c]%asi,%f25	! %f25 = fffff5f4
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000030041400] = 438ccfb3
	stha	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffcfb3

p0_label_48:
!	%l4 = 00000000000000ff, Mem[0000000030181400] = 00000000ff36fdff
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000000ff
!	Mem[000000001008140c] = fffff2da, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x00c]%asi,%l1	! %l1 = 00000000fffff2da
!	%f22 = 5727e874 f6cc8abd, Mem[0000000010141400] = ff41d7b0 ffffb3fc
	stda	%f22,[%i5+%g0]0x80	! Mem[0000000010141400] = 5727e874 f6cc8abd
!	%l2 = cdbc65cc00000081, Mem[0000000010001408] = 816001ff
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 81600081
!	Mem[0000000010141410] = c1fe0000, %l2 = cdbc65cc00000081
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000c1fe0000
!	%l5 = 00000000df46d72a, Mem[0000000010001408] = 81600081
	stha	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 8160d72a
!	%l0 = 0000000020a92091, Mem[0000000010081400] = 09876e83
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 09876e91
!	%l6 = ffffffffffffffff, Mem[0000000030001410] = fda9a1ff
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = fda9ffff
!	%l0 = 0000000020a92091, Mem[0000000010001400] = 000000ff
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000091
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 81000000000000ff, %l5 = 00000000df46d72a
	ldxa	[%i4+0x010]%asi,%l5	! %l5 = 81000000000000ff

p0_label_49:
!	Mem[0000000030181408] = 8b53ffff, %l5 = 81000000000000ff
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 000000000000008b
!	Mem[0000000030101408] = 81000000, %f24 = 43020000
	lda	[%i4+%o4]0x81,%f24	! %f24 = 81000000
!	Mem[0000000010041410] = bd8accf6, %l6 = ffffffffffffffff
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000f6
!	Mem[00000000100c1408] = 2e6b8713ddf52e6b, %l3 = 00000000000000b0
	ldxa	[%i3+%o4]0x88,%l3	! %l3 = 2e6b8713ddf52e6b
!	Mem[0000000010081400] = 09876e91, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000006e91
!	Mem[0000000021800140] = 58a1d198, %l3 = 2e6b8713ddf52e6b
	lduba	[%o3+0x140]%asi,%l3	! %l3 = 0000000000000058
!	Mem[0000000010181408] = dfffffff, %f26 = 595e11c7
	lda	[%i6+%o4]0x80,%f26	! %f26 = dfffffff
!	Mem[0000000030001400] = 92000000, %l4 = 0000000000006e91
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 98ff0000, %l5 = 000000000000008b
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000058, Mem[0000000020800040] = 1bfbecd0, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 0058ecd0

p0_label_50:
!	%f16 = ffde5232 84aaf27c, Mem[0000000010041400] = ffd74196 3252deff
	stda	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = ffde5232 84aaf27c
!	%f6  = bd8accf6 74e82757, Mem[0000000030041400] = ffffcfb3 ffde5232
	stda	%f6 ,[%i1+%g0]0x81	! Mem[0000000030041400] = bd8accf6 74e82757
!	%l7 = fffffffffffffdff, Mem[00000000300c1408] = ffd74196
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = fdff4196
!	%l6 = 00000000000000f6, Mem[0000000010141408] = 0000ff9897946159
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000f6
!	Mem[0000000020800041] = 0058ecd0, %l2 = 00000000c1fe0000
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 00000058000000ff
!	%l2 = 0000000000000058, Mem[0000000010141400] = 74e82757
	stha	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 74e80058
!	%f23 = f6cc8abd, Mem[00000000300c1408] = fdff4196
	sta	%f23,[%i3+%o4]0x81	! Mem[00000000300c1408] = f6cc8abd
!	Mem[0000000010081400] = 916e8709, %l0 = 0000000020a92091
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000916e8709
!	Mem[00000000211c0001] = 00b0877b, %l7 = fffffffffffffdff
	ldstub	[%o2+0x001],%l7		! %l7 = 000000b0000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 3c38001d, %l3 = 0000000000000058
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = 000000000000001d

p0_label_51:
!	Mem[00000000100c1408] = 6b2ef5dd 13876b2e, %l0 = 916e8709, %l1 = fffff2da
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 000000006b2ef5dd 0000000013876b2e
!	Mem[0000000030141408] = 00000072, %l7 = 00000000000000b0
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000072
!	Mem[0000000030101410] = a1064bff, %l7 = 0000000000000072
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 0000000000004bff
!	Mem[0000000010001408] = 8160d72a, %l6 = 00000000000000f6
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = 000000000000002a
!	Mem[0000000020800000] = 8cbaedbb, %l5 = 0000000000000000
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffff8cba
!	Mem[0000000010181400] = fffaff1b, %l3 = 000000000000001d
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 00000000fffaff1b
!	Mem[00000000100c1410] = 3c38001d, %l2 = 0000000000000058
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 000000000000001d
!	Mem[0000000010041408] = fafdf856 b3ff8cba, %l2 = 0000001d, %l3 = fffaff1b
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000b3ff8cba 00000000fafdf856
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000300c1400] = 60000000 1030f3bb f6cc8abd fbdb17fa
!	Mem[00000000300c1410] = d755630f 4616c801 a0182e7f d42a75e0
!	Mem[00000000300c1420] = b1c86ba3 513c3df7 56078ad3 90fb5ccf
!	Mem[00000000300c1430] = b6179133 17937f0f 589e1785 cd4a7dbc
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00007a97, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_52:
!	%l0 = 000000006b2ef5dd, Mem[0000000010041434] = b6bd1e94
	sth	%l0,[%i1+0x034]		! Mem[0000000010041434] = f5dd1e94
!	Mem[0000000010141400] = 5800e874, %l6 = 000000000000002a
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 000000005800e874
!	Mem[0000000030141400] = a8fbcaf5, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 000000f5000000ff
!	%f30 = b181e1df 24c24b88, %l7 = 0000000000004bff
!	Mem[00000000100c1430] = 0542b5e22a7232f0
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l7]ASI_PST32_PL ! Mem[00000000100c1430] = 884bc224dfe181b1
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 000000006b2ef5dd
	setx	0xf71d99a05a84cb83,%g7,%l0 ! %l0 = f71d99a05a84cb83
!	%l1 = 0000000013876b2e
	setx	0x3a5cbab07336ecf2,%g7,%l1 ! %l1 = 3a5cbab07336ecf2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f71d99a05a84cb83
	setx	0x35fe39284c020602,%g7,%l0 ! %l0 = 35fe39284c020602
!	%l1 = 3a5cbab07336ecf2
	setx	0x00963cb0089f95d9,%g7,%l1 ! %l1 = 00963cb0089f95d9
!	%l0 = 35fe39284c020602, Mem[0000000010101410] = ff00000000000081
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 35fe39284c020602
!	%l5 = ffffffffffff8cba, Mem[0000000010141438] = 3caf1050fffff5f4
	stx	%l5,[%i5+0x038]		! Mem[0000000010141438] = ffffffffffff8cba
!	Mem[0000000030001408] = ffffffde, %l1 = 00963cb0089f95d9
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1424] = 93318abb, %l4 = 00000000000000f5
	ldstuba	[%i3+0x024]%asi,%l4	! %l4 = 00000093000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 9120a920, %l5 = ffffffffffff8cba
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000020

p0_label_53:
!	Mem[0000000030001408] = deffffff, %l2 = 00000000b3ff8cba
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = ffffa9fd00000000, %l3 = 00000000fafdf856
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = ffffa9fd00000000
!	Mem[0000000010081410] = a8fbcaf5, %l4 = 0000000000000093
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000caf5
!	%f25 = fffff5f4, %f22 = 5727e874, %f26 = dfffffff
	fsubs	%f25,%f22,%f26		! %f26 = fffff5f4
!	Mem[0000000010001408] = 2ad76081, %f22 = 5727e874
	lda	[%i0+%o4]0x80,%f22	! %f22 = 2ad76081
!	Mem[0000000010141408] = 00000000 000000f6, %l0 = 4c020602, %l1 = 000000ff
	ldd	[%i5+%o4],%l0		! %l0 = 0000000000000000 00000000000000f6
!	Mem[0000000010041408] = ba8cffb356f8fdfa, %f20 = ff4b06a1 29ad2ce4
	ldda	[%i1+%o4]0x80,%f20	! %f20 = ba8cffb3 56f8fdfa
!	Mem[0000000021800100] = 8bdd9604, %l6 = 000000005800e874
	ldub	[%o3+0x100],%l6		! %l6 = 000000000000008b
!	Mem[0000000010041430] = c44dc347, %l6 = 000000000000008b
	ldsba	[%i1+0x031]%asi,%l6	! %l6 = 000000000000004d
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1420] = 32c0fc82, %l4 = 0000caf5, %l6 = 0000004d
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000032c0fc82

p0_label_54:
!	%f0  = 60000000, Mem[0000000030181410] = ffffffb1
	sta	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 60000000
!	%f18 = 81000000 cc65bccd, Mem[0000000030141400] = ffcafba8 ef0b221d
	stda	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = 81000000 cc65bccd
!	%f5  = 4616c801, Mem[0000000010141408] = 00000000
	sta	%f5 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 4616c801
!	Mem[0000000010181410] = ff17002a, %l5 = 0000000000000020
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 0000002a000000ff
!	%f0  = 60000000 1030f3bb f6cc8abd fbdb17fa
!	%f4  = d755630f 4616c801 a0182e7f d42a75e0
!	%f8  = b1c86ba3 513c3df7 56078ad3 90fb5ccf
!	%f12 = b6179133 17937f0f 589e1785 cd4a7dbc
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%f19 = cc65bccd, Mem[0000000030101400] = 3252b1a1
	sta	%f19,[%i4+%g0]0x89	! Mem[0000000030101400] = cc65bccd
!	Mem[0000000010101410] = 0206024c, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000002000000ff
!	%l4 = 000000000000caf5, Mem[0000000010141410] = 81000000dabdccce
	stx	%l4,[%i5+%o5]		! Mem[0000000010141410] = 000000000000caf5
!	%f26 = fffff5f4 0710d380, Mem[0000000010081410] = a8fbcaf5 6f644294
	stda	%f26,[%i2+%o5]0x88	! Mem[0000000010081410] = fffff5f4 0710d380
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (12)
!	Mem[00000000100c1400] = da50baaf, %l6 = 0000000032c0fc82
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffaf

p0_label_55:
!	Mem[0000000020800000] = 8cbaedbb, %l5 = 000000000000002a
	lduba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ba
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000ba
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181434] = 8011ff92, %l6 = ffffffffffffffaf
	ldswa	[%i6+0x034]%asi,%l6	! %l6 = ffffffff8011ff92
!	Mem[00000000100c1410] = 6f644294 3c38001d, %l0 = 00000002, %l1 = 000000f6
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 000000003c38001d 000000006f644294
!	Mem[0000000030041408] = b3cf8cba, %l1 = 000000006f644294
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 00000000000000b3
!	Mem[0000000010001408] = 2ad76081, %l7 = 0000000000004bff
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 000000000000002a
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000003c38001d
	setx	0x6cbf72e7f08cf4b6,%g7,%l0 ! %l0 = 6cbf72e7f08cf4b6
!	%l1 = 00000000000000b3
	setx	0x284f58483a0076f0,%g7,%l1 ! %l1 = 284f58483a0076f0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6cbf72e7f08cf4b6
	setx	0xe2338a27d6d6bf0c,%g7,%l0 ! %l0 = e2338a27d6d6bf0c
!	%l1 = 284f58483a0076f0
	setx	0x7c37eb28634b0c10,%g7,%l1 ! %l1 = 7c37eb28634b0c10
!	Mem[0000000010081404] = 00000000, %l5 = 0000000000000000
	ldsh	[%i2+0x004],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = f6cc8abd5fb3f810, %l2 = ffffffffffffffff
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = f6cc8abd5fb3f810
!	Starting 10 instruction Store Burst
!	%l0 = e2338a27d6d6bf0c, Mem[0000000010001424] = a3a45df4, %asi = 80
	stha	%l0,[%i0+0x024]%asi	! Mem[0000000010001424] = bf0c5df4

p0_label_56:
!	%l2 = 5fb3f810, %l3 = 00000000, Mem[00000000300c1408] = bd8accf6 fa17dbfb
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5fb3f810 00000000
!	%f13 = 17937f0f, Mem[0000000030041400] = f6cc8abd
	sta	%f13,[%i1+%g0]0x89	! Mem[0000000030041400] = 17937f0f
!	%l4 = 0000caf5, %l5 = 00000000, Mem[0000000010081408] = ffffffff ffffffff
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000caf5 00000000
!	%l6 = 8011ff92, %l7 = 0000002a, Mem[0000000010041400] = ffde5232 84aaf27c
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 8011ff92 0000002a
!	Mem[0000000030041410] = 17000000, %l0 = e2338a27d6d6bf0c
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 00000017000000ff
!	%l1 = 7c37eb28634b0c10, Mem[0000000030041408] = 2cf14137ba8ccfb3
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 7c37eb28634b0c10
!	%l0 = 0000000000000017, Mem[0000000030181400] = 000000ff
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000017
!	Mem[00000000100c1400] = da50baaf, %l7 = 000000000000002a
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 000000af000000ff
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000000017
	setx	0xb3ea00a789879238,%g7,%l0 ! %l0 = b3ea00a789879238
!	%l1 = 7c37eb28634b0c10
	setx	0x1d7049b0355662b4,%g7,%l1 ! %l1 = 1d7049b0355662b4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b3ea00a789879238
	setx	0x8442ad08631df9aa,%g7,%l0 ! %l0 = 8442ad08631df9aa
!	%l1 = 1d7049b0355662b4
	setx	0xfc80a50068f3f975,%g7,%l1 ! %l1 = fc80a50068f3f975
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = fda9ffff, %l4 = 000000000000caf5
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffffff

p0_label_57:
!	Mem[00000000100c1408] = ddf52e6b, %l4 = ffffffffffffffff
	ldswa	[%i3+%o4]0x88,%l4	! %l4 = ffffffffddf52e6b
!	Mem[0000000010101408] = bd8accf6, %l4 = ffffffffddf52e6b
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000f6
!	Mem[0000000010181400] = 1bfffaff, %l6 = ffffffff8011ff92
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 000000001bfffaff
!	Mem[0000000030141408] = 7200000084aaf27c, %f20 = ba8cffb3 56f8fdfa
	ldda	[%i5+%o4]0x81,%f20	! %f20 = 72000000 84aaf27c
!	Mem[0000000010141408] = 4616c801, %l6 = 000000001bfffaff
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000001
!	Mem[0000000010001400] = 9100000024a19da9, %f22 = 2ad76081 f6cc8abd
	ldda	[%i0+%g0]0x80,%f22	! %f22 = 91000000 24a19da9
!	Mem[0000000030101408] = cdbc65cc00000081, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = cdbc65cc00000081
!	Mem[0000000010081410] = 0710d380, %l2 = f6cc8abd5fb3f810
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 000000000000d380
!	Mem[0000000010041408] = ba8cffb356f8fdfa, %f20 = 72000000 84aaf27c
	ldd	[%i1+%o4],%f20		! %f20 = ba8cffb3 56f8fdfa
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = bd8accf6, %l1 = fc80a50068f3f975
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000f6000000ff

p0_label_58:
!	%f28 = 909c4eed 836e8709, Mem[0000000010041408] = ba8cffb3 56f8fdfa
	stda	%f28,[%i1+%o4]0x80	! Mem[0000000010041408] = 909c4eed 836e8709
!	%f18 = 81000000 cc65bccd, Mem[00000000100c1408] = 6b2ef5dd 13876b2e
	stda	%f18,[%i3+%o4]0x80	! Mem[00000000100c1408] = 81000000 cc65bccd
!	%l6 = 00000001, %l7 = 000000af, Mem[0000000010181400] = fffaff1b efb2d718
	std	%l6,[%i6+%g0]		! Mem[0000000010181400] = 00000001 000000af
!	%l2 = 000000000000d380, %l4 = 00000000000000f6, %l4 = 00000000000000f6
	sdivx	%l2,%l4,%l4		! %l4 = 00000000000000dc
!	%l5 = cdbc65cc00000081, Mem[00000000100c1408] = 81000000
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00810000
!	%l0 = 8442ad08631df9aa, Mem[0000000030101410] = ff4b06a129ad2ce4
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 8442ad08631df9aa
!	%l6 = 00000001, %l7 = 000000af, Mem[00000000100c1410] = 1d00383c 9442646f
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000001 000000af
!	%l0 = 8442ad08631df9aa, Mem[0000000010181420] = 082da03a, %asi = 80
	stwa	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = 631df9aa
!	Mem[0000000010081410] = 0710d380, %l7 = 00000000000000af
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 000000000710d380
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 7cf2aa8400000072, %f24 = 81000000 fffff5f4
	ldda	[%i5+%o4]0x89,%f24	! %f24 = 7cf2aa84 00000072

p0_label_59:
!	Mem[0000000010081410] = af000000, %l1 = 00000000000000f6
	ldsba	[%i2+0x010]%asi,%l1	! %l1 = ffffffffffffffaf
!	Mem[00000000211c0000] = 00ff877b, %l3 = ffffa9fd00000000
	ldub	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 10f8b35f 00000000, %l2 = 0000d380, %l3 = 00000000
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000010f8b35f 0000000000000000
!	Mem[0000000010181418] = b3fc65cc, %l4 = 00000000000000dc
	lduw	[%i6+0x018],%l4		! %l4 = 00000000b3fc65cc
!	Mem[0000000010081410] = af000000, %l5 = cdbc65cc00000081
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 00000000af000000
!	Mem[0000000030081410] = a1064bff, %l1 = ffffffffffffffaf
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = 634b0c10, %l1 = ffffffffffffffff
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 00000000634b0c10
!	Mem[0000000010081408] = 0000caf5, %l1 = 00000000634b0c10
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1404] = 00000000, %f31 = 24c24b88
	lda	[%i3+0x004]%asi,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000300c1410] = d755630f
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000

p0_label_60:
!	Mem[00000000300c1400] = 00000060, %l7 = 000000000710d380
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000060000000ff
!	Mem[0000000010041408] = 909c4eed, %l4 = 00000000b3fc65cc
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000909c4eed
!	Mem[0000000030041408] = 100c4b63, %l6 = 0000000000000001
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 00000010000000ff
!	%f0  = 60000000 1030f3bb, %l2 = 0000000010f8b35f
!	Mem[0000000030181418] = 207fa94bcf6c2a13
	add	%i6,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181418] = bbf3301000000060
!	%l5 = 00000000af000000, Mem[0000000010081410] = 000000af
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = 4c0206ff
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 4c020600
!	%f12 = b6179133 17937f0f, Mem[0000000010181418] = b3fc65cc 64804183
	std	%f12,[%i6+0x018]	! Mem[0000000010181418] = b6179133 17937f0f
!	Mem[0000000030141408] = 72000000, %l7 = 0000000000000060
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000072000000ff
!	%l0 = 8442ad08631df9aa, Mem[0000000010081407] = 00000000
	stb	%l0,[%i2+0x007]		! Mem[0000000010081404] = 000000aa
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = cdbc65cc 00000081, %l4 = 909c4eed, %l5 = af000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000081 00000000cdbc65cc

p0_label_61:
!	Mem[0000000010081420] = 32c0fc82, %l3 = 0000000000000000
	lduh	[%i2+0x022],%l3		! %l3 = 000000000000fc82
!	Mem[0000000030101410] = 8442ad08631df9aa, %f6  = a0182e7f d42a75e0
	ldda	[%i4+%o5]0x81,%f6 	! %f6  = 8442ad08 631df9aa
!	Mem[0000000030001410] = fda9ffff, %l7 = 0000000000000072
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 00000000fda9ffff
!	Mem[0000000010001400] = 00000091, %l6 = 0000000000000010
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000091
!	Mem[00000000100c1408] = 00008100, %l2 = 0000000010f8b35f
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000008100
!	Mem[0000000010181408] = dfffffff, %l4 = 0000000000000081
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000dfffffff
!	Mem[0000000030181408] = 8b53ffffb0ffffff, %f14 = 589e1785 cd4a7dbc
	ldda	[%i6+%o4]0x81,%f14	! %f14 = 8b53ffff b0ffffff
!	Mem[0000000010041408] = 09876e83cc65fcb3, %f6  = 8442ad08 631df9aa
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = 09876e83 cc65fcb3
!	%f12 = b6179133, %f29 = 836e8709, %f18 = 81000000
	fsubs	%f12,%f29,%f18		! %f18 = b6179133
!	Starting 10 instruction Store Burst
!	%f12 = b6179133, Mem[0000000030081400] = 3252deff
	sta	%f12,[%i2+%g0]0x89	! Mem[0000000030081400] = b6179133

p0_label_62:
!	%l0 = 8442ad08631df9aa, Mem[0000000010081408] = 0000caf5
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = f9aacaf5
!	%f14 = 8b53ffff b0ffffff, Mem[0000000010041400] = 8011ff92 0000002a
	stda	%f14,[%i1+%g0]0x80	! Mem[0000000010041400] = 8b53ffff b0ffffff
!	%l3 = 000000000000fc82, Mem[0000000030101400] = cdbc65cc84aaf27c
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000000000fc82
!	Mem[00000000100c1408] = 00810000cc65bccd, %l6 = 0000000000000091, %l5 = 00000000cdbc65cc
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 00810000cc65bccd
!	%f8  = b1c86ba3 513c3df7, %l2 = 0000000000008100
!	Mem[0000000030101438] = b181e1df24c24b88
	add	%i4,0x038,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030101438] = b181e1df24c24b88
!	%f20 = ba8cffb3 56f8fdfa, Mem[0000000010001430] = 38446049 6a784266
	stda	%f20,[%i0+0x030]%asi	! Mem[0000000010001430] = ba8cffb3 56f8fdfa
!	Mem[0000000010041410] = bd8accf6, %l7 = 00000000fda9ffff
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 000000f6000000ff
!	%l2 = 0000000000008100, Mem[0000000010181424] = b1a1a9fd
	stw	%l2,[%i6+0x024]		! Mem[0000000010181424] = 00008100
!	%l0 = 8442ad08631df9aa, Mem[0000000021800180] = cb2bf473, %asi = 80
	stha	%l0,[%o3+0x180]%asi	! Mem[0000000021800180] = f9aaf473
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = fffff5f400000000, %f18 = b6179133 cc65bccd
	ldda	[%i2+%o5]0x88,%f18	! %f18 = fffff5f4 00000000

p0_label_63:
!	Mem[0000000010181428] = ffcc3530, %f29 = 836e8709
	ld	[%i6+0x028],%f29	! %f29 = ffcc3530
!	Mem[0000000020800000] = 8cbaedbb, %l0 = 8442ad08631df9aa
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000008cba
!	Mem[0000000010101410] = 0006024c, %l5 = 00810000cc65bccd
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffba50da, %l4 = 00000000dfffffff
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 8b53ffff, %f3  = fbdb17fa
	lda	[%i1+%g0]0x80,%f3 	! %f3 = 8b53ffff
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1400] = ffba50da 00000000 00810000 cc65bccd
!	Mem[00000000100c1410] = 00000001 000000af aa578b53 b7e40821
!	Mem[00000000100c1420] = 32c0fc82 ff318abb a8fbcaf5 df46d72a
!	Mem[00000000100c1430] = 884bc224 dfe181b1 8fe3b036 00000044
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010041408] = cc65fcb3, %l2 = 0000000000008100
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000b3
!	Mem[0000000010041410] = ffcc8abd04c685af, %f18 = fffff5f4 00000000
	ldda	[%i1+%o5]0x80,%f18	! %f18 = ffcc8abd 04c685af
!	Mem[0000000010181438] = faf2162c691ec5b0, %f16 = ffde5232 84aaf27c
	ldd	[%i6+0x038],%f16	! %f16 = faf2162c 691ec5b0
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (14)
!	%f20 = ba8cffb3 56f8fdfa, Mem[00000000100c1408] = 00810000 cc65bccd
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = ba8cffb3 56f8fdfa

p0_label_64:
!	Mem[0000000010141438] = ffffffff, %l2 = 00000000000000b3
	ldstub	[%i5+0x038],%l2		! %l2 = 000000ff000000ff
!	%l6 = 00000091, %l7 = 000000f6, Mem[0000000030041410] = ff000000 2c16f2fa
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000091 000000f6
!	Mem[0000000010101410] = 4c020600, %l6 = 0000000000000091
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 17937f0f, %l7 = 00000000000000f6
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000017937f0f
!	Mem[0000000010001400] = 91000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffff9100
!	Mem[0000000030181400] = 17000000, %l7 = 0000000017937f0f
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 00000017000000ff
!	%l6 = 0000000000000000, Mem[0000000030081408] = 81000000
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f20 = ba8cffb3 56f8fdfa, Mem[0000000010101410] = ff06024c 2839fe35
	stda	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = ba8cffb3 56f8fdfa
!	%f8  = 32c0fc82 ff318abb, Mem[0000000010181400] = 01000000 af000000
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 32c0fc82 ff318abb
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000002a, %l4 = ffffffffffffffff
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_65:
!	Mem[0000000010101410] = ba8cffb3, %l2 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ba8cffb3
!	Mem[0000000030181400] = ff000000 00000000, %l4 = 00000000, %l5 = ffff9100
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	%l2 = 00000000ba8cffb3, Mem[0000000010041410] = bd8accff
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = bd8affb3
!	Mem[0000000030041408] = ff0c4b63, %l2 = 00000000ba8cffb3
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffff0c
!	Mem[0000000030101408] = 00000081, %l2 = ffffffffffffff0c
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffff81
!	Mem[00000000201c0000] = 8cba75c1, %l5 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffff8cba
!	%l3 = 000000000000fc82, imm = 00000000000003be, %l3 = 000000000000fc82
	add	%l3,0x3be,%l3		! %l3 = 0000000000010040
!	Mem[0000000030181408] = ffff538b, %l0 = 0000000000008cba
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 000000000000008b
!	Mem[00000000211c0000] = 00ff877b, %l0 = 000000000000008b
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = da50baff, %l4 = 00000000ff000000
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000da50baff

p0_label_66:
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = dfffffff, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000dfffffff
!	%l3 = 0000000000010040, Mem[0000000030001408] = deffffff
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00010040
!	Mem[0000000010081408] = f9aacaf5, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000f9000000ff
!	Mem[0000000010141400] = 2a000000, %l5 = ffffffffffff8cba
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 000000002a000000
!	%f6  = aa578b53, %f31 = 00000000
	fcmps	%fcc3,%f6 ,%f31		! %fcc3 = 1
!	%f0  = ffba50da, Mem[0000000030101408] = 81000000
	sta	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ffba50da
!	Mem[0000000010001410] = 977a00ff, %l7 = 0000000000000017
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000977a00ff
!	%l2 = ffffffffffffff81, Mem[00000000300c1408] = 10f8b35f00000000
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffffffff81
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = b3ff8abd04c685af, %l4 = 00000000da50baff
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = b3ff8abd04c685af

p0_label_67:
!	Mem[00000000100c1408] = b3ff8cba, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ba
!	Mem[0000000030181400] = ff000000, %l5 = 000000002a000000
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010141424] = 9a8b5de6, %l6 = 00000000000000f9
	ldsba	[%i5+0x025]%asi,%l6	! %l6 = ffffffffffffff8b
!	Mem[0000000030101408] = da50baff, %l5 = 00000000ff000000
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = f5caaaff, %l4 = b3ff8abd04c685af
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffaaff
!	Mem[000000001010143c] = 52ff6f1f, %l1 = 00000000dfffffff
	ldsba	[%i4+0x03d]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = cc65fcb3, %l7 = 00000000977a00ff
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000b3
!	Mem[0000000030001410] = fda9ffff, %f0  = ffba50da
	lda	[%i0+%o5]0x89,%f0 	! %f0 = fda9ffff
!	Mem[0000000030101408] = da50baff, %l4 = ffffffffffffaaff
	lduba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000

p0_label_68:
!	Mem[0000000010041414] = 04c685af, %l6 = ffffffffffffff8b
	swap	[%i1+0x014],%l6		! %l6 = 0000000004c685af
!	%l2 = ffffffffffffff81, Mem[0000000030001410] = fda9ffff
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = fda9ff81
!	%l2 = ffffffffffffff81, Mem[0000000010041400] = ffff538b
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffff81
!	Mem[0000000030081410] = ff4b06a1, %l0 = 00000000000000ba
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1420] = 32c0fc82, %asi = 80
	stha	%l5,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00fffc82
!	%f0  = fda9ffff 00000000, %l2 = ffffffffffffff81
!	Mem[0000000010181420] = 631df9aa00008100
	add	%i6,0x020,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181420] = 0000000000008100
!	Mem[0000000030101410] = 8442ad08, %l5 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 000000008442ad08
!	%l7 = 00000000000000b3, Mem[0000000010101408] = ffcc8abd5fb3f810
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000b3
!	%f12 = 884bc224 dfe181b1, %l7 = 00000000000000b3
!	Mem[0000000030001430] = e0aad552a742ee43
	add	%i0,0x030,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030001430] = b181e1dfa742ee43
!	Starting 10 instruction Load Burst
!	%f0  = fda9ffff, %f27 = 0710d380, %f22 = 91000000
	fdivs	%f0 ,%f27,%f22		! %f22 = ff800000

p0_label_69:
!	Mem[0000000010181408] = 0000000000000000, %f18 = ffcc8abd 04c685af
	ldda	[%i6+0x008]%asi,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030001408] = 40000100 7cf2aa84, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000040000100 000000007cf2aa84
!	%l1 = 000000007cf2aa84, imm = 0000000000000d2d, %l7 = 00000000000000b3
	sub	%l1,0xd2d,%l7		! %l7 = 000000007cf29d57
!	Mem[0000000010181410] = ff1700ff, %l2 = ffffffffffffff81
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ff1700ff
!	Mem[00000000300c1400] = 000000ff, %l7 = 000000007cf29d57
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l0 = 0000000040000100
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000020800040] = 00ffecd0, %l2 = 00000000ff1700ff
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101410] = ff000000, %l3 = 0000000000010040
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = da50baff, %l4 = 00000000ff000000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 000000000000baff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000baff, Mem[0000000010181408] = 0000000000000000
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000baff

p0_label_70:
!	%l4 = 000000000000baff, Mem[0000000010101400] = 00000022
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000022
!	Mem[000000001010142a] = 00000000, %l5 = 000000008442ad08
	ldstub	[%i4+0x02a],%l5		! %l5 = 00000000000000ff
!	%l6 = 0000000004c685af, Mem[0000000010001408] = 8160d72a
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 816085af
!	%l7 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	%f6  = aa578b53 b7e40821, Mem[0000000010001420] = da50baaf bf0c5df4
	std	%f6 ,[%i0+0x020]	! Mem[0000000010001420] = aa578b53 b7e40821
!	Mem[00000000100c1422] = 00fffc82, %l2 = ffffffffffffffff
	ldstuba	[%i3+0x022]%asi,%l2	! %l2 = 000000fc000000ff
!	Mem[0000000010101408] = 00000000, %l6 = 0000000004c685af
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l1 = 000000007cf2aa84, Mem[0000000020800000] = 8cbaedbb, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = aa84edbb
!	%f16 = faf2162c 691ec5b0 00000000 00000000
!	%f20 = ba8cffb3 56f8fdfa ff800000 24a19da9
!	%f24 = 7cf2aa84 00000072 fffff5f4 0710d380
!	%f28 = 909c4eed ffcc3530 b181e1df 00000000
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010101408] = af85c604 000000b3, %l2 = 000000fc, %l3 = 00000000
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000af85c604 00000000000000b3

p0_label_71:
!	Mem[0000000030041410] = 91000000, %l4 = 000000000000baff
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = ffffffff91000000
!	Mem[00000000300c1410] = 000000004616c801, %l0 = 000000000000ff00
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = 000000004616c801
!	Mem[0000000030001400] = 00000092, %l3 = 00000000000000b3
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000092
!	Mem[0000000030081400] = 7cf2aa84b6179133, %f30 = b181e1df 00000000
	ldda	[%i2+%g0]0x89,%f30	! %f30 = 7cf2aa84 b6179133
!	Mem[0000000030001408] = 400001007cf2aa84, %l7 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l7	! %l7 = 400001007cf2aa84
!	Mem[0000000010081410] = fffff5f4 000000ff, %l2 = af85c604, %l3 = 00000092
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff 00000000fffff5f4
!	Mem[0000000010081408] = ffaacaf5, %l7 = 400001007cf2aa84
	lduba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f26 = fffff5f4, %f18 = 00000000
	fcmpes	%fcc0,%f26,%f18		! %fcc0 = 3
!	Mem[0000000010181400] = ff318abb, %l0 = 000000004616c801
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 00000000ff318abb
!	Starting 10 instruction Store Burst
!	%f8  = 32c0fc82 ff318abb, Mem[0000000010001408] = af856081 00000243
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 32c0fc82 ff318abb

p0_label_72:
!	%l0 = 00000000ff318abb, %l7 = 00000000000000ff, %y  = ffffffff
	smul	%l0,%l7,%l0		! %l0 = ffffffff32593045, %y = ffffffff
!	Mem[0000000010181400] = ff318abb, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000ff318abb
!	%f2  = 00810000 cc65bccd, Mem[0000000030141400] = 00000081 cdbc65cc
	stda	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00810000 cc65bccd
!	Mem[0000000030181408] = ffff538b, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ffff538b
!	Mem[0000000010041410] = b3ff8abd, %l0 = ffffffff32593045
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000b3000000ff
!	Mem[0000000010001415] = 14f96e1e, %l1 = 000000007cf2aa84
	ldstuba	[%i0+0x015]%asi,%l1	! %l1 = 000000f9000000ff
!	%f4  = 00000001, Mem[00000000300c1400] = 000000ff
	sta	%f4 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000001
!	%l7 = 00000000000000ff, Mem[0000000010101408] = af85c604000000b3
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	%l2 = 00000000000000ff, %l0 = 00000000000000b3, %l6 = 00000000ffff538b
	subc	%l2,%l0,%l6		! %l6 = 000000000000004c
!	Starting 10 instruction Load Burst
!	%l0 = 00000000000000b3, imm = fffffffffffff975, %l7 = 00000000000000ff
	add	%l0,-0x68b,%l7		! %l7 = fffffffffffffa28

p0_label_73:
!	Mem[000000001004141c] = 8447cd5f, %l4 = ffffffff91000000
	lduba	[%i1+0x01e]%asi,%l4	! %l4 = 00000000000000cd
!	Mem[0000000010001408] = 82fcc032, %f18 = 00000000
	lda	[%i0+%o4]0x88,%f18	! %f18 = 82fcc032
!	Mem[00000000100c1410] = 00000001, %l1 = 00000000000000f9
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 9120a920, %l6 = 000000000000004c
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = ffffffffffffa920
!	Mem[0000000030181410] = 60000000, %l6 = ffffffffffffa920
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000001, %f22 = ff800000
	lda	[%i3+%o5]0x80,%f22	! %f22 = 00000001
!	Mem[0000000030181400] = 000000ff, %l4 = 00000000000000cd
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141434] = 9e8cd5cc, %l2 = 00000000000000ff
	lduba	[%i5+0x036]%asi,%l2	! %l2 = 00000000000000d5
!	Mem[0000000030001408] = 00010040, %l7 = fffffffffffffa28
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000010040
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffaacaf500000000, %l1 = 0000000000000000, %l2 = 00000000000000d5
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = ffaacaf500000000

p0_label_74:
!	%l3 = 00000000fffff5f4, Mem[0000000030141408] = 7cf2aa84000000ff
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000fffff5f4
!	%f16 = faf2162c, %f6  = aa578b53
	fcmpes	%fcc0,%f16,%f6 		! %fcc0 = 1
!	%f28 = 909c4eed ffcc3530, %l6 = 0000000000000000
!	Mem[0000000030081430] = 909c4eed836e8709
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_S ! Mem[0000000030081430] = 909c4eed836e8709
!	%l7 = 0000000000010040, Mem[0000000030001410] = fda9ff81
	stwa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00010040
!	Mem[00000000300c1408] = ffffffff, %l0 = 00000000000000b3
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l3 = 00000000fffff5f4, Mem[0000000030041410] = 91000000
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = fffff5f4
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 8cba75c1, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 000075c1
!	%l2 = ffaacaf500000000, Mem[0000000020800040] = 00ffecd0, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000ecd0
!	%l0 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	Starting 10 instruction Load Burst
!	%l3 = 00000000fffff5f4, %l7 = 0000000000010040, %y  = ffffffff
	sdiv	%l3,%l7,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000

p0_label_75:
!	Mem[00000000300c1400] = 01000000, %f29 = ffcc3530
	lda	[%i3+%g0]0x89,%f29	! %f29 = 01000000
!	Mem[0000000030141400] = cc65bccd, %l5 = 00000000ff318abb
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffbccd
!	Mem[0000000020800000] = aa84edbb, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000aa84
!	Mem[0000000010101400] = ff000022 00000000, %l4 = 000000ff, %l5 = ffffbccd
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff000022 0000000000000000
!	Mem[0000000010041438] = 866c804d, %l5 = 0000000000000000
	lduwa	[%i1+0x038]%asi,%l5	! %l5 = 00000000866c804d
!	Mem[00000000300c1408] = ffffffff, %l4 = 00000000ff000022
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = 9120a920, %f4  = 00000001
	lda	[%i2+%g0]0x88,%f4 	! %f4 = 9120a920
!	Mem[0000000010181410] = ff1700ff, %l3 = 00000000fffff5f4
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = b3ff8cba, %l6 = 000000000000aa84
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ba
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 91000000, %l5 = 00000000866c804d
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000091000000

p0_label_76:
!	%f17 = 691ec5b0, Mem[00000000100c1408] = ba8cffb3
	sta	%f17,[%i3+%o4]0x80	! Mem[00000000100c1408] = 691ec5b0
!	%f1  = 00000000, Mem[0000000010041408] = b3fc65cc
	sta	%f1 ,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000
!	%f18 = 82fcc032 00000000, %l1 = 0000000000000000
!	Mem[0000000010081420] = 32c0fc8293318abb
	add	%i2,0x020,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081420] = 32c0fc8293318abb
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030041410] = f4f5ffff 000000f6
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff
!	%l6 = 000000ba, %l7 = 00010040, Mem[00000000100c1400] = ff000000 00000000
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ba 00010040
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041418] = dffff42f 8447cd5f
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = 00000000 000000ff
!	Mem[0000000010101400] = 220000ff, %l5 = 0000000091000000
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 00000000220000ff
!	%f22 = 00000001, Mem[000000001004143c] = b051662a
	sta	%f22,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00000001
!	%l0 = 0000000000000000, Mem[0000000030081410] = ff4b06a1
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 004b06a1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000091, %l1 = 0000000000000000
	lduh	[%i4+0x002],%l1		! %l1 = 0000000000000091

p0_label_77:
!	Mem[0000000030081400] = 339117b6, %l6 = 00000000000000ba
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000339117b6
!	Mem[0000000010001408] = 32c0fc82, %l4 = ffffffffffffffff
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000032
!	Mem[0000000021800180] = f9aaf473, %l0 = 0000000000000000
	lduba	[%o3+0x181]%asi,%l0	! %l0 = 00000000000000aa
!	Mem[0000000010041410] = ffff8abd, %f25 = 00000072
	lda	[%i1+%o5]0x80,%f25	! %f25 = ffff8abd
!	Mem[0000000010001400] = 866c804d24a19da9, %f10 = a8fbcaf5 df46d72a
	ldda	[%i0+0x000]%asi,%f10	! %f10 = 866c804d 24a19da9
!	Mem[0000000010181410] = ff1700ff, %l0 = 00000000000000aa
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffff1700ff
!	Mem[0000000010141438] = ffffffffffff8cba, %f26 = fffff5f4 0710d380
	ldd	[%i5+0x038],%f26	! %f26 = ffffffff ffff8cba
!	Code Fragment 3
p0_fragment_6:
!	%l0 = ffffffffff1700ff
	setx	0x71fa729fcca87486,%g7,%l0 ! %l0 = 71fa729fcca87486
!	%l1 = 0000000000000091
	setx	0xc9eef81fdbdbeeb7,%g7,%l1 ! %l1 = c9eef81fdbdbeeb7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 71fa729fcca87486
	setx	0x069a0377fb2abc56,%g7,%l0 ! %l0 = 069a0377fb2abc56
!	%l1 = c9eef81fdbdbeeb7
	setx	0x2893c3df817902f8,%g7,%l1 ! %l1 = 2893c3df817902f8
!	Mem[000000001018140c] = 00000000, %l0 = 069a0377fb2abc56
	lduha	[%i6+0x00e]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000010040, Mem[00000000300c1410] = 00000000
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00400000

p0_label_78:
!	%l0 = 0000000000000000, Mem[0000000020800040] = 0000ecd0
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 0000ecd0
!	%l4 = 0000000000000032, %l3 = 00000000000000ff, %y  = 00000000
	umul	%l4,%l3,%l5		! %l5 = 00000000000031ce, %y = 00000000
!	%l7 = 0000000000010040, Mem[0000000010081400] = aa0000009120a920
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000010040
!	%f18 = 82fcc032, Mem[0000000010181408] = ffba0000
	sta	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 82fcc032
!	%l0 = 0000000000000000, Mem[0000000030081408] = 00000000
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l2 = ffaacaf500000000, Mem[0000000010041408] = 00000000
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010181408] = 82fcc032, %l7 = 0000000000010040
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 0000000082fcc032
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000031ce
	ldstuba	[%i4+0x008]%asi,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000082fcc032, Mem[0000000010141408] = 01c81646000000f6
	stx	%l7,[%i5+%o4]		! Mem[0000000010141408] = 0000000082fcc032
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 364d22fd, %f20 = ba8cffb3
	lda	[%i5+%o5]0x89,%f20	! %f20 = 364d22fd

p0_label_79:
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000032
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = 0000ecd0, %l0 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181424] = 00008100, %l5 = 0000000000000000
	ldsh	[%i6+0x024],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081400] = 0000000000010040, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000010040
!	Mem[0000000010181408] = 40000100, %l5 = 0000000000010040
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = 0000000040000100
!	Mem[0000000010141428] = 0000008167e5f11e, %l7 = 0000000082fcc032
	ldxa	[%i5+0x028]%asi,%l7	! %l7 = 0000008167e5f11e
!	Mem[0000000030001400] = 00000092, %l2 = ffaacaf500000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = f6000000, %l1 = 2893c3df817902f8
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 000000000000f600
!	Mem[0000000030001400] = 00000092, %l1 = 000000000000f600
	lduba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 56f8fdfa, %l0 = 00000000, %l6 = 339117b6
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 0000000056f8fdfa

p0_label_80:
!	%f1  = 00000000, Mem[0000000030081400] = 339117b6
	sta	%f1 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = 0000000056f8fdfa, Mem[0000000010081410] = ff000000
	stba	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = fa000000
!	%l4 = 000000ff, %l5 = 40000100, Mem[0000000030141410] = fd224d36 691ec5b0
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff 40000100
!	%l1 = 0000000000000000, Mem[000000001014143c] = ffff8cba, %asi = 80
	stba	%l1,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00ff8cba
!	Mem[00000000211c0001] = 00ff877b, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010041410] = ffff8abdffffff8b
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%f10 = 866c804d 24a19da9, %l6 = 0000000056f8fdfa
!	Mem[0000000010041430] = c44dc347f5dd1e94
	add	%i1,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041430] = 866cc34724a11e94
!	%l0 = 0000000000000000, Mem[0000000030001410] = 0000000000010040
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff877b, %l6 = 0000000056f8fdfa
	ldsb	[%o2+%g0],%l6		! %l6 = 0000000000000000

p0_label_81:
!	Mem[00000000211c0000] = 00ff877b, %l5 = 0000000040000100
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 00000092, %l2 = 00000000000000ff
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000092
!	Mem[00000000100c1430] = 884bc224, %l2 = 0000000000000092
	lduh	[%i3+0x032],%l2		! %l2 = 000000000000c224
!	Mem[0000000021800100] = 8bdd9604, %l7 = 0000008167e5f11e
	ldsba	[%o3+0x101]%asi,%l7	! %l7 = ffffffffffffffdd
!	Mem[0000000030101400] = faf2162c, %l7 = ffffffffffffffdd
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000fa
!	Mem[0000000010081408] = 00000000 f5caaaff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000f5caaaff 0000000000000000
!	Mem[0000000010101410] = b3ff8cba, %l5 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffffba
!	Mem[0000000010181438] = faf2162c691ec5b0, %f24 = 7cf2aa84 ffff8abd
	ldd	[%i6+0x038],%f24	! %f24 = faf2162c 691ec5b0
!	Mem[0000000020800000] = aa84edbb, %l6 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffaa84
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 00000000f5caaaff
	setx	0x2873b0b786290d45,%g7,%l0 ! %l0 = 2873b0b786290d45
!	%l1 = 0000000000000000
	setx	0x079ca07f9130cfff,%g7,%l1 ! %l1 = 079ca07f9130cfff
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2873b0b786290d45
	setx	0x2eb85e88412f1f1e,%g7,%l0 ! %l0 = 2eb85e88412f1f1e
!	%l1 = 079ca07f9130cfff
	setx	0x3acbf15046561b08,%g7,%l1 ! %l1 = 3acbf15046561b08

p0_label_82:
!	%l2 = 0000c224, %l3 = 000000ff, Mem[00000000300c1410] = 00400000 4616c801
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000c224 000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%f12 = 884bc224, Mem[0000000010141408] = 00000000
	sta	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 884bc224
!	Mem[0000000010081428] = a8fbcaf5, %l6 = ffffffffffffaa84, %asi = 80
	swapa	[%i2+0x028]%asi,%l6	! %l6 = 00000000a8fbcaf5
!	%l2 = 000000000000c224, Mem[0000000010141400] = ba8cffff
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000c224
!	Mem[00000000300c1400] = 01000000, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 0000000001000000
!	%f24 = faf2162c, Mem[000000001004141c] = 000000ff
	st	%f24,[%i1+0x01c]	! Mem[000000001004141c] = faf2162c
!	%l3 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030001400] = 92000000, %l4 = 0000000001000000
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff877b, %l1 = 3acbf15046561b08
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff

p0_label_83:
!	Mem[0000000030101408] = 0000000000000000, %f18 = 82fcc032 00000000
	ldda	[%i4+%o4]0x89,%f18	! %f18 = 00000000 00000000
!	%l5 = ffffffffffffffba, %l2 = 000000000000c224, %y  = 00000000
	sdiv	%l5,%l2,%l4		! %l4 = 0000000000015191
	mov	%l0,%y			! %y = 412f1f1e
!	Mem[0000000030041410] = ff000000, %l7 = 00000000000000fa
	ldsba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010101400] = 00000091 00000000 ff000000 000000ff
!	Mem[0000000010101410] = ba8cffb3 56f8fdfa 4fd3af3c d1efd355
!	Mem[0000000010101420] = 6d8d4e8c b644550d 0000ff00 000000ff
!	Mem[0000000010101430] = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000030181408] = ff000000, %l5 = ffffffffffffffba
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = b0c51e692c16f2fa, %f4  = 9120a920 000000af
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = b0c51e69 2c16f2fa
!	Mem[0000000030141408] = fffff5f4, %l5 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 000000000000f5f4
!	Mem[0000000010081438] = 81e3b036cc650044, %f2  = 00810000 cc65bccd
	ldd	[%i2+0x038],%f2 	! %f2  = 81e3b036 cc650044
!	Mem[0000000030001400] = ff000092, %l3 = 00000000000000ff
	ldswa	[%i0+%g0]0x81,%l3	! %l3 = ffffffffff000092
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (17)
!	%l0 = 2eb85e88412f1f1e, Mem[0000000010101408] = ff000000000000ff
	stxa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 2eb85e88412f1f1e

p0_label_84:
!	Mem[0000000030101408] = 00000000, %l6 = 00000000a8fbcaf5
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f9  = ff318abb, Mem[0000000010041418] = 00000000
	sta	%f9 ,[%i1+0x018]%asi	! Mem[0000000010041418] = ff318abb
!	%l5 = 000000000000f5f4, Mem[0000000030141408] = fffff5f4
	stha	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = fffff5f4
!	%l6 = 0000000000000000, Mem[0000000030101408] = f5cafba8
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000fba8
!	%f1  = 00000000, Mem[00000000100c1418] = aa578b53
	sta	%f1 ,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030141400] = 00810000cc65bccd
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f14 = 8fe3b036 00000044, Mem[0000000030181400] = 000000ff 00000000
	stda	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = 8fe3b036 00000044
!	%l0 = 2eb85e88412f1f1e, %l7 = 0000000000000000, %l1 = 00000000000000ff
	and	%l0,%l7,%l1		! %l1 = 0000000000000000
!	%l0 = 2eb85e88412f1f1e, Mem[0000000030001408] = 40000100
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 1f1e0100
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff877b, %l2 = 000000000000c224
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000000

p0_label_85:
!	Mem[0000000030141410] = ff000000, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f5  = 2c16f2fa, %f15 = 00000044, %f16 = 00000091
	fadds	%f5 ,%f15,%f16		! %l0 = 2eb85e88412f1f40, Unfinished, %fsr = 1900000400
!	Mem[0000000010041410] = 00000000, %l3 = ffffffffff000092
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f20 = ba8cffb3, %f26 = 0000ff00, %f2  = 81e3b036
	fsubs	%f20,%f26,%f2 		! %l0 = 2eb85e88412f1f62, Unfinished, %fsr = 1900000400
!	Mem[00000000100c1414] = 000000af, %l3 = 0000000000000000
	lduwa	[%i3+0x014]%asi,%l3	! %l3 = 00000000000000af
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000060, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000060
!	Mem[00000000100c1400] = ba00000040000100, %f8  = 32c0fc82 ff318abb
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = ba000000 40000100
!	%f2  = 81e3b036, %f6  = aa578b53
	fcmps	%fcc1,%f2 ,%f6 		! %fcc1 = 2
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1424] = ff318abb, %l1 = 0000000000000000
	swap	[%i3+0x024],%l1		! %l1 = 00000000ff318abb

p0_label_86:
!	%f10 = 866c804d, Mem[0000000010001400] = 4d806c86
	sta	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 866c804d
!	%l6 = 0000000000000060, Mem[0000000010001410] = 1700000014ff6e1e
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000060
!	Mem[0000000010041410] = 00000000, %l3 = 00000000000000af
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = ba8cffb3, %l5 = 000000000000f5f4
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000ba000000ff
!	%f24 = 6d8d4e8c b644550d, Mem[0000000010141410] = 00000000 0000caf5
	stda	%f24,[%i5+0x010]%asi	! Mem[0000000010141410] = 6d8d4e8c b644550d
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000060
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081410] = fa000000
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010081408] = f5caaaff, %l4 = 0000000000015191
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000ff318abb, Mem[00000000100c1417] = 000000af
	stb	%l1,[%i3+0x017]		! Mem[00000000100c1414] = 000000bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 44000000, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 0000000044000000

p0_label_87:
!	Mem[00000000100c1410] = 00000001, %f25 = b644550d
	lda	[%i3+%o5]0x80,%f25	! %f25 = 00000001
!	Mem[0000000010181410] = ff0017ff 00000243, %l4 = 000000ff, %l5 = 000000ba
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff0017ff 0000000000000243
!	Mem[0000000010081418] = 92000000, %l1 = 00000000ff318abb
	lduba	[%i2+0x01a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181430] = bdce655c8011ff92, %l2 = 0000000000000000
	ldxa	[%i6+0x030]%asi,%l2	! %l2 = bdce655c8011ff92
!	Mem[0000000010081408] = f5caaaff, %l4 = 00000000ff0017ff
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = 000075c1, %l7 = 0000000044000000
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141408] = f4f5ffff, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000f4
!	Mem[0000000030181400] = 00000044, %l5 = 0000000000000243
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000044
!	Mem[0000000030141410] = 000000ff, %l5 = 0000000000000044
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = 0000ff00 000000ff, Mem[00000000300c1410] = 0000c224 000000ff
	stda	%f26,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000ff00 000000ff

p0_label_88:
!	%l0 = 2eb85e88412f1f62, Mem[00000000100c1400] = ba000000
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 412f1f62
!	%f10 = 866c804d 24a19da9, Mem[0000000010181408] = 40000100 00000000
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 866c804d 24a19da9
!	%l2 = 8011ff92, %l3 = 00000000, Mem[0000000010181400] = ff000000 32c0fc82
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 8011ff92 00000000
!	Mem[0000000010141400] = 24c20000, %l0 = 2eb85e88412f1f62
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030081408] = 00000000 cc65bccd
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000
!	Mem[0000000010041410] = 000000ff, %l7 = 00000000000000f4
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = bdce655c8011ff92, %l1 = 0000000000000000, %l0 = 0000000000000000
	or	%l2,%l1,%l0		! %l0 = bdce655c8011ff92
!	Mem[0000000010081427] = 93318abb, %l1 = 0000000000000000
	ldstuba	[%i2+0x027]%asi,%l1	! %l1 = 000000bb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 92ff1180, %l0 = bdce655c8011ff92
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffff92ff

p0_label_89:
!	Mem[0000000010001434] = 56f8fdfa, %l3 = 0000000000000000
	ldsba	[%i0+0x034]%asi,%l3	! %l3 = 0000000000000056
!	Mem[0000000010101410] = b3ff8cba, %l7 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffba
!	Mem[0000000030141400] = 0000000000000000, %f2  = 81e3b036 cc650044
	ldda	[%i5+%g0]0x89,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030041400] = 000000f6, %l1 = 00000000000000bb
	ldsba	[%i1+%g0]0x89,%l1	! %l1 = fffffffffffffff6
!	Mem[0000000010181410] = ff0017ff, %l7 = ffffffffffffffba
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010041400] = ffffffb0ffffff81, %l4 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = ffffffb0ffffff81
!	%l3 = 0000000000000056, Mem[0000000030181410] = 60000000
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 60000056
!	Mem[0000000010141400] = 24c200ff, %l2 = bdce655c8011ff92
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 0000000024c200ff
!	Mem[0000000010181400] = 000000008011ff92, %l0 = ffffffffffff92ff
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 000000008011ff92
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ffffffff, %l2 = 0000000024c200ff
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000ffffffff

p0_label_90:
!	%f1  = 00000000, Mem[00000000100c1418] = 00000000
	sta	%f1 ,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000
!	Mem[00000000100c1410] = 00000001, %l7 = 000000000000ff00, %asi = 80
	swapa	[%i3+0x010]%asi,%l7	! %l7 = 0000000000000001
!	Mem[0000000030001410] = 00000060, %l1 = fffffffffffffff6
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000030181410] = 60000056
	stba	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 600000ff
!	%l2 = ffffffff, %l3 = 00000056, Mem[0000000010081400] = 40000100 00000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 00000056
!	%f12 = 884bc224 dfe181b1, %l0 = 000000008011ff92
!	Mem[0000000010181410] = ff0017ff00000243
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181410] = 8800172400008143
!	Mem[0000000010181408] = a99da124, %l3 = 0000000000000056
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 00000000a99da124
!	Mem[0000000030041400] = f6000000, %l0 = 000000008011ff92
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 000000f6000000ff
!	%f30 = ab8de634 52ff6f1f, Mem[0000000030081410] = a1064b00 e42cad29
	stda	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = ab8de634 52ff6f1f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 32c0fc82, %l6 = 0000000000000000
	ldsha	[%i2+0x020]%asi,%l6	! %l6 = 00000000000032c0

p0_label_91:
!	Mem[0000000030001408] = 00011e1f, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 000000000000001f
!	Mem[0000000010101420] = 6d8d4e8c, %l5 = 000000000000001f
	lduba	[%i4+0x021]%asi,%l5	! %l5 = 000000000000008d
!	Mem[00000000218000c0] = bbff968e, %l1 = 0000000000000000
	ldsb	[%o3+0x0c0],%l1		! %l1 = ffffffffffffffbb
!	Mem[0000000030081400] = 7cf2aa84 00000000, %l2 = ffffffff, %l3 = a99da124
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000 000000007cf2aa84
!	Mem[00000000201c0000] = 000075c1, %l0 = 00000000000000f6
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 000000f4, %l6 = 00000000000032c0
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = fffffffffffffff4
!	Mem[0000000010181408] = 00000056, %l3 = 000000007cf2aa84
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000056
!	Mem[00000000300c1408] = 24c200ff, %l5 = 000000000000008d
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101408] = 00000000a8fb0000, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 00000000a8fb0000
!	Starting 10 instruction Store Burst
!	%l6 = fffffff4, %l7 = 00000001, Mem[0000000030101410] = ff8cffb3 56f8fdfa
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = fffffff4 00000001

p0_label_92:
!	%f2  = 00000000 00000000, Mem[0000000030101408] = a8fb0000 00000000
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%l5 = ffffffffffffffff, Mem[0000000010141416] = b644550d
	stb	%l5,[%i5+0x016]		! Mem[0000000010141414] = b644ff0d
!	Mem[0000000010081413] = 00000000, %l6 = fffffffffffffff4
	ldstub	[%i2+0x013],%l6		! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030041410] = 000000ff
	stha	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%l0 = 00000000a8fb0000, Mem[0000000010101400] = 00000091
	stba	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000091
!	%l6 = 0000000000000000, Mem[0000000010181400] = 92ff1180
	stwa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l0 = 00000000a8fb0000, Mem[00000000211c0000] = 00ff877b, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000877b
!	Mem[0000000010101418] = 4fd3af3cd1efd355, %l2 = 0000000000000000
	ldx	[%i4+0x018],%l2		! %l2 = 4fd3af3cd1efd355
!	Mem[0000000030141410] = 000000ff, %l0 = 00000000a8fb0000
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00ff0000, %l2 = 4fd3af3cd1efd355
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_93:
!	Mem[0000000010141408] = 24c24b88 82fcc032, %l2 = 00000000, %l3 = 00000056
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000024c24b88 0000000082fcc032
!	Mem[0000000010001400] = 4d806c8624a19da9, %l5 = ffffffffffffffff
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 4d806c8624a19da9
!	Mem[0000000030141410] = a8fb0000, %l4 = ffffffb0ffffff81
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffa8fb0000
!	Mem[0000000010141410] = 8c4e8d6d, %l5 = 4d806c8624a19da9
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 000000000000006d
!	Mem[0000000030101400] = 2c16f2fa, %l7 = 0000000000000001
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 000000002c16f2fa
!	Mem[00000000100c1438] = 8fe3b036, %l5 = 000000000000006d
	lduwa	[%i3+0x038]%asi,%l5	! %l5 = 000000008fe3b036
!	Mem[0000000010001428] = 1684d534c66036ff, %f22 = 4fd3af3c d1efd355
	ldda	[%i0+0x028]%asi,%f22	! %f22 = 1684d534 c66036ff
!	Mem[0000000010041418] = ff318abb faf2162c, %l2 = 24c24b88, %l3 = 82fcc032
	ldda	[%i1+0x018]%asi,%l2	! %l2 = 00000000ff318abb 00000000faf2162c
!	Mem[0000000010181410] = 8800172400008143, %l7 = 000000002c16f2fa
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 8800172400008143
!	Starting 10 instruction Store Burst
!	%l3 = 00000000faf2162c, Mem[000000001018140a] = 00000056, %asi = 80
	stha	%l3,[%i6+0x00a]%asi	! Mem[0000000010181408] = 0000162c

p0_label_94:
!	%f18 = ff000000 000000ff, Mem[0000000030081410] = 1f6fff52 34e68dab
	stda	%f18,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000 000000ff
!	%l5 = 000000008fe3b036, Mem[00000000218000c1] = bbff968e
	stb	%l5,[%o3+0x0c1]		! Mem[00000000218000c0] = bb36968e
!	%f24 = 6d8d4e8c, Mem[0000000010141410] = 8c4e8d6d
	sta	%f24,[%i5+%o5]0x88	! Mem[0000000010141410] = 6d8d4e8c
!	%f30 = ab8de634 52ff6f1f, Mem[0000000010081408] = f5caaaff 00000000
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = ab8de634 52ff6f1f
!	%l1 = ffffffffffffffbb, %l7 = 8800172400008143, %y  = 412f1f1e
	smul	%l1,%l7,%l5		! %l5 = ffffffffffdd28f1, %y = ffffffff
!	Mem[00000000201c0001] = 000075c1, %l3 = 00000000faf2162c
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f20 = ba8cffb3 56f8fdfa, %l4 = ffffffffa8fb0000
!	Mem[0000000010001438] = aa578bdab7e40821
	add	%i0,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010001438] = aa578bdab7e40821
!	%f16 = 00000091 00000000 ff000000 000000ff
!	%f20 = ba8cffb3 56f8fdfa 1684d534 c66036ff
!	%f24 = 6d8d4e8c 00000001 0000ff00 000000ff
!	%f28 = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	stda	%f16,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l5 = ffffffffffdd28f1, Mem[0000000030041410] = ff000000
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ffdd28f1
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 920000ff, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_95:
!	Mem[0000000030141400] = 00000000, %l4 = ffffffffa8fb0000
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l7 = 8800172400008143
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 1f6fff52, %l5 = ffffffffffdd28f1
	lduba	[%i2+0x00b]%asi,%l5	! %l5 = 0000000000000052
!	Mem[0000000010001408] = 82fcc032, %l0 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = ffffffff82fcc032
!	Mem[0000000030001408] = 1f1e0100, %l1 = ffffffffffffffbb
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = 0000000000001f1e
!	Mem[0000000010101408] = 2eb85e88412f1f1e, %l1 = 0000000000001f1e
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = 2eb85e88412f1f1e
!	Mem[0000000010081438] = 81e3b036cc650044, %l6 = 00000000000000ff
	ldxa	[%i2+0x038]%asi,%l6	! %l6 = 81e3b036cc650044
	membar	#Sync			! Added by membar checker (18)
!	Mem[00000000300c1400] = 00000091, %l2 = 00000000ff318abb
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 0dff44b6 6d8d4e8c, %l4 = 00000000, %l5 = 00000052
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 000000006d8d4e8c 000000000dff44b6
!	Starting 10 instruction Store Burst
!	%f20 = ba8cffb3 56f8fdfa, Mem[00000000100c1408] = 691ec5b0 56f8fdfa
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = ba8cffb3 56f8fdfa

p0_label_96:
!	%l4 = 000000006d8d4e8c, immed = 000004ee, %y  = ffffffff
	smul	%l4,0x4ee,%l5		! %l5 = 0000021c0e993628, %y = 0000021c
!	%l3 = 0000000000000000, Mem[0000000010181408] = 2c160000
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 2c160000
!	Mem[00000000211c0000] = 0000877b, %l0 = ffffffff82fcc032
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	%l4 = 6d8d4e8c, %l5 = 0e993628, Mem[00000000300c1410] = b3ff8cba fafdf856
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6d8d4e8c 0e993628
!	%l5 = 0000021c0e993628, imm = fffffffffffff50f, %l1 = 2eb85e88412f1f1e
	addc	%l5,-0xaf1,%l1		! %l1 = 0000021c0e992b37
!	%l1 = 0000021c0e992b37, Mem[0000000020800040] = 0000ecd0, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 2b37ecd0
!	%l5 = 0000021c0e993628, Mem[0000000010101408] = 412f1f1e
	stba	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 412f1f28
!	%f3  = 00000000, %f7  = b7e40821
	fcmpes	%fcc2,%f3 ,%f7 		! %fcc2 = 2
!	Mem[0000000010001410] = 00000000, %l6 = 81e3b036cc650044
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 32c0fc82, %l4 = 000000006d8d4e8c
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000032c0fc82

p0_label_97:
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = ffffff81, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffffffffff81
!	Mem[0000000010141408] = 24c24b8882fcc032, %f4  = b0c51e69 2c16f2fa
	ldda	[%i5+%o4]0x80,%f4 	! %f4  = 24c24b88 82fcc032
!	Mem[000000001018140c] = 4d806c86, %l3 = 0000000000000000
	lduw	[%i6+0x00c],%l3		! %l3 = 000000004d806c86
!	Mem[00000000300c1408] = 000000ff, %l1 = 0000021c0e992b37
	ldsba	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 281f2f41, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000281f2f41
!	Mem[0000000010081410] = ff000000, %l3 = 000000004d806c86
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f19 = 000000ff, %f15 = 00000044, %f17 = 00000000
	fdivs	%f19,%f15,%f17		! %l0 = ffffffffffffffa3, Unfinished, %fsr = 1a00000400
!	Starting 10 instruction Store Burst
!	%l5 = 0000021c0e993628, Mem[00000000218001c0] = c5ad75f7
	stb	%l5,[%o3+0x1c0]		! Mem[00000000218001c0] = 28ad75f7

p0_label_98:
!	Mem[0000000010001408] = 82fcc032, %l5 = 0000021c0e993628
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 0000000082fcc032
!	%l2 = 0000000000000000, Mem[0000000030001410] = 600000ff
	stwa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000030141408] = fffff5f4, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000fffff5f4
!	%l0 = ffffffa3, %l1 = ffffffff, Mem[0000000010181400] = 00000000 00000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffa3 ffffffff
!	%f18 = ff000000, Mem[0000000030041408] = 634b0cff
	sta	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000
!	%l3 = 00000000fffff5f4, Mem[0000000010101408] = 412f1f28
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 412f1ff4
!	Mem[0000000020800041] = 2b37ecd0, %l5 = 0000000082fcc032
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000037000000ff
!	Mem[0000000030041408] = 000000ff, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, %l1 = ffffffffffffffff, %l3  = 00000000fffff5f4
	mulx	%l6,%l1,%l3		! %l3 = ffffffffffffff01
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l4 = 0000000032c0fc82
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_99:
!	Mem[00000000100c1410] = 0000ff00000000bb, %l1 = ffffffffffffffff
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 0000ff00000000bb
!	%l5 = 0000000000000037, immed = fffff9e2, %y  = 0000021c
	umul	%l5,-0x61e,%l2		! %l2 = 00000036fffeaf8e, %y = 00000036
!	%l6 = 00000000000000ff, imm = fffffffffffffc9f, %l6 = 00000000000000ff
	or	%l6,-0x361,%l6		! %l6 = fffffffffffffcff
!	Mem[00000000100c1400] = 621f2f41, %l5 = 0000000000000037
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 00000000621f2f41
!	Mem[00000000300c1410] = 8c4e8d6d, %f6  = aa578b53
	lda	[%i3+%o5]0x81,%f6 	! %f6 = 8c4e8d6d
!	Mem[0000000010101420] = 6d8d4e8c, %l4 = 0000000000000000
	ldsw	[%i4+0x020],%l4		! %l4 = 000000006d8d4e8c
!	Mem[0000000010181410] = 4381000024170088, %f24 = 6d8d4e8c 00000001
	ldda	[%i6+%o5]0x88,%f24	! %f24 = 43810000 24170088
!	Mem[0000000010141408] = 884bc224, %l6 = fffffffffffffcff
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 00000000884bc224
!	Mem[0000000010101408] = f41f2f41885eb82e, %f30 = ab8de634 52ff6f1f
	ldda	[%i4+%o4]0x80,%f30	! %f30 = f41f2f41 885eb82e
!	Starting 10 instruction Store Burst
!	%l1 = 0000ff00000000bb, Mem[0000000030141408] = 00000000
	stwa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000bb

p0_label_100:
!	Mem[0000000010141408] = 24c24b88, %l5 = 00000000621f2f41
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000024000000ff
!	%l2 = 00000036fffeaf8e, Mem[00000000211c0000] = ff00877b
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = af8e877b
!	%l3 = ffffffffffffff01, Mem[00000000100c1400] = 412f1f62
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 012f1f62
!	Mem[0000000030101400] = 2c16f2fa, %l1 = 0000ff00000000bb
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000fa000000ff
!	%f12 = 884bc224 dfe181b1, Mem[0000000010001428] = 1684d534 c66036ff
	stda	%f12,[%i0+0x028]%asi	! Mem[0000000010001428] = 884bc224 dfe181b1
!	Mem[0000000010001400] = 4d806c86, %l2 = 00000036fffeaf8e, %asi = 80
	swapa	[%i0+0x000]%asi,%l2	! %l2 = 000000004d806c86
!	Mem[0000000030041410] = ffdd28f1, %l0 = ffffffffffffffa3
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 000000f1000000ff
!	Mem[0000000030181400] = 44000000, %l3 = ffffffffffffff01
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000044000000
!	%l4 = 000000006d8d4e8c, Mem[00000000300c1408] = 000000ff
	stha	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00004e8c
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffffff, %l2 = 000000004d806c86
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_101:
!	Mem[0000000010181410] = 24170088, %l4 = 000000006d8d4e8c
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 0000000024170088
!	Mem[00000000100c1400] = 012f1f62, %l7 = 00000000281f2f41
	lduw	[%i3+%g0],%l7		! %l7 = 00000000012f1f62
!	%l7 = 00000000012f1f62, immed = fffffe13, %y  = 00000036
	sdiv	%l7,-0x1ed,%l4		! %l4 = ffffffffe3f4fff0
	mov	%l0,%y			! %y = 000000f1
!	Mem[0000000020800000] = aa84edbb, %l1 = 00000000000000fa
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000aa84
!	Mem[0000000020800040] = 2bffecd0, %l0 = 00000000000000f1
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000002bff
!	Mem[00000000300c1408] = ff00000000004e8c, %l0 = 0000000000002bff
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = ff00000000004e8c
!	Mem[0000000030041410] = ff28ddff, %l1 = 000000000000aa84
	ldswa	[%i1+%o5]0x81,%l1	! %l1 = ffffffffff28ddff
!	Mem[0000000010101410] = ba8cffb3 56f8fdfa, %l2 = 000000ff, %l3 = 44000000
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ba8cffb3 0000000056f8fdfa
!	Mem[0000000010101408] = 412f1ff4, %l1 = ffffffffff28ddff
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 00000000412f1ff4
!	Starting 10 instruction Store Burst
!	%l0 = ff00000000004e8c, %l2 = 00000000ba8cffb3, %l0 = ff00000000004e8c
	xnor	%l0,%l2,%l0		! %l0 = 00ffffff45734ec0

p0_label_102:
!	Mem[0000000010141430] = 42afcd89, %l1 = 00000000412f1ff4
	swap	[%i5+0x030],%l1		! %l1 = 0000000042afcd89
!	%f10 = 866c804d 24a19da9, %l6 = 00000000884bc224
!	Mem[00000000100c1430] = 884bc224dfe181b1
	add	%i3,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1430] = 884b804ddfe181b1
!	%f21 = 56f8fdfa, Mem[0000000010141408] = 884bc2ff
	sta	%f21,[%i5+%o4]0x88	! Mem[0000000010141408] = 56f8fdfa
!	%l2 = ba8cffb3, %l3 = 56f8fdfa, Mem[0000000030001408] = 00011e1f 84aaf27c
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ba8cffb3 56f8fdfa
!	Mem[0000000030101400] = 2c16f2ff, %l6 = 00000000884bc224
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000002c16f2ff
!	Mem[0000000010101408] = 412f1ff4, %l0 = 00ffffff45734ec0
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000412f1ff4
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000024
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181428] = ffcc3530, %l7 = 00000000012f1f62
	ldstuba	[%i6+0x028]%asi,%l7	! %l7 = 000000ff000000ff
!	%f6  = 8c4e8d6d b7e40821, Mem[0000000030081408] = 00000024 00000000
	stda	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 8c4e8d6d b7e40821
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = b3ff8cba, %l2 = 00000000ba8cffb3
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = ffffffffb3ff8cba

p0_label_103:
!	Mem[000000001018141c] = 17937f0f, %l1 = 0000000042afcd89
	ldsw	[%i6+0x01c],%l1		! %l1 = 0000000017937f0f
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000412f1ff4
	setx	0x2bf63ca05f4c0d51,%g7,%l0 ! %l0 = 2bf63ca05f4c0d51
!	%l1 = 0000000017937f0f
	setx	0xc1580b00354f26dd,%g7,%l1 ! %l1 = c1580b00354f26dd
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2bf63ca05f4c0d51
	setx	0x84d84ab7d3e9ad0b,%g7,%l0 ! %l0 = 84d84ab7d3e9ad0b
!	%l1 = c1580b00354f26dd
	setx	0x2ba4ea8854daf292,%g7,%l1 ! %l1 = 2ba4ea8854daf292
!	Mem[0000000010041410] = f4000000, %l6 = 000000002c16f2ff
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = fffffffffffffff4
!	Mem[0000000010141400] = ff00c224f6cc8abd, %f16 = 00000091 00000000
	ldd	[%i5+%g0],%f16		! %f16 = ff00c224 f6cc8abd
!	Mem[0000000030001400] = ff000092 bf74240a, %l2 = b3ff8cba, %l3 = 56f8fdfa
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000092 00000000bf74240a
!	Mem[00000000100c1410] = bb00000000ff0000, %l6 = fffffffffffffff4
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = bb00000000ff0000
!	%l6 = bb00000000ff0000, immed = 00000d81, %y  = 000000f1
	sdiv	%l6,0xd81,%l7		! %l7 = 0000000011d8d36b
	mov	%l0,%y			! %y = d3e9ad0b
!	Mem[0000000030181410] = 600000ff, %l4 = ffffffffe3f4fff0
	lduwa	[%i6+%o5]0x89,%l4	! %l4 = 00000000600000ff
!	Mem[00000000211c0000] = af8e877b, %l7 = 0000000011d8d36b
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000af
!	Starting 10 instruction Store Burst
!	%l0 = 84d84ab7d3e9ad0b, Mem[0000000010081400] = ffffffff
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffad0b

p0_label_104:
!	%f14 = 8fe3b036 00000044, %l3 = 00000000bf74240a
!	Mem[0000000030141428] = fba5249550c30c35
	add	%i5,0x028,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_S ! Mem[0000000030141428] = fba5249500c30035
!	%l4 = 00000000600000ff, imm = fffffffffffffdb2, %l5 = 0000000000000000
	addc	%l4,-0x24e,%l5		! %l5 = 000000005ffffeb1
!	%l2 = 00000000ff000092, Mem[00000000100c1400] = 012f1f6240000100
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000ff000092
!	Mem[0000000030141400] = 00000000 00000000, %l6 = 00ff0000, %l7 = 000000af
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010181400] = ffffffa3, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000a3000000ff
!	Mem[000000001014141d] = fda9a1b1, %l6 = 00000000000000a3
	ldstuba	[%i5+0x01d]%asi,%l6	! %l6 = 000000a9000000ff
!	%l3 = 00000000bf74240a, Mem[00000000100c1400] = 00000000
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = bf74240a
!	%f27 = 000000ff, Mem[0000000010001410] = cc650044
	sta	%f27,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%f28 = 2815cd2e e67dabc1, %l0 = 84d84ab7d3e9ad0b
!	Mem[0000000030001430] = b181e1dfa742ee43
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_S ! Mem[0000000030001430] = b181e1dfe642abc1
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0a2474bf, %l2 = 00000000ff000092
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 000000000a2474bf

p0_label_105:
!	Mem[00000000300c1408] = 00004e8c, %l3 = 00000000bf74240a
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 000000000000008c
!	Mem[00000000201c0000] = 00ff75c1, %l1 = 2ba4ea8854daf292
	lduh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010081400] = 0badffff 00000056 1f6fff52 34e68dab
!	Mem[0000000010081410] = 000000ff f4f5ffff 92000000 691e0821
!	Mem[0000000010081420] = 32c0fc82 93318aff ffffaa84 00000060
!	Mem[0000000010081430] = 0542b5e2 00000036 81e3b036 cc650044
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000020800040] = 2bffecd0, %l5 = 000000005ffffeb1
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 0000000000002bff
!	Mem[0000000030141408] = 000000bb, %l2 = 000000000a2474bf
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = aa84edbb, %l2 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffaa84
!	Mem[00000000300c1408] = 8c4e0000, %f28 = 2815cd2e
	lda	[%i3+%o4]0x81,%f28	! %f28 = 8c4e0000
!	Mem[0000000010141410] = 6d8d4e8c, %f20 = ba8cffb3
	lda	[%i5+%o5]0x88,%f20	! %f20 = 6d8d4e8c
!	Mem[0000000010081420] = 32c0fc82, %l0 = 84d84ab7d3e9ad0b
	lduha	[%i2+0x020]%asi,%l0	! %l0 = 00000000000032c0
!	Starting 10 instruction Store Burst
!	%l4 = 00000000600000ff, Mem[0000000030081400] = 00000000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff

p0_label_106:
!	%l2 = ffffffffffffaa84, Mem[0000000010101408] = c04e7345885eb82e
	stxa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffffffffaa84
!	%l2 = ffffffffffffaa84, %l0 = 00000000000032c0, %y  = d3e9ad0b
	smul	%l2,%l0,%l3		! %l3 = ffffffffef0dab00, %y = ffffffff
!	%f22 = 1684d534 c66036ff, Mem[00000000300c1410] = 6d8d4e8c 0e993628
	stda	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1684d534 c66036ff
!	%l4 = 00000000600000ff, Mem[0000000010101410] = ba8cffb356f8fdfa
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000600000ff
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 00000091
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l0 = 00000000000032c0, Mem[0000000030081410] = ff000000000000ff
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000032c0
!	Mem[0000000030041408] = 00000000, %l4 = 00000000600000ff
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ff000060, %l3 = ffffffffef0dab00
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000002bff
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = c0320000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000c0

p0_label_107:
!	Mem[0000000030101408] = 0000000000000000, %l2 = ffffffffffffaa84
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 6d8d4e8c, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 000000006d8d4e8c
!	Mem[0000000030181410] = 600000ff, %l0 = 00000000000032c0
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = 00000000600000ff
!	Mem[0000000010101430] = 2815cd2ee67dabc1, %l7 = 000000006d8d4e8c
	ldxa	[%i4+0x030]%asi,%l7	! %l7 = 2815cd2ee67dabc1
!	Mem[0000000030081400] = ff000000, %l5 = 00000000000000c0
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %f29 = e67dabc1
	lda	[%i6+%o4]0x89,%f29	! %f29 = ff000000
!	Mem[00000000100c1400] = bf74240aff000092, %f22 = 1684d534 c66036ff
	ldda	[%i3+%g0]0x80,%f22	! %f22 = bf74240a ff000092
!	Mem[0000000010001408] = 2836990e, %f19 = 000000ff
	lda	[%i0+%o4]0x80,%f19	! %f19 = 2836990e
!	Mem[0000000010141400] = 24c200ff, %l5 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 600000ff, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000600000ff

p0_label_108:
!	%l1 = 00000000000000ff, Mem[0000000010041410] = f4000000
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	Mem[0000000030141408] = 000000bb, %l6 = 00000000000000a9
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (20)
!	%f22 = bf74240a ff000092, Mem[0000000010081410] = ff000000 fffff5f4
	stda	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = bf74240a ff000092
!	Mem[0000000010081410] = 920000ff, %l1 = 00000000000000ff
	ldstuba	[%i2+0x010]%asi,%l1	! %l1 = 00000092000000ff
!	%f6  = 92000000 691e0821, %l6 = 0000000000000000
!	Mem[0000000030041430] = df712ac756dbeb7e
	add	%i1,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030041430] = df712ac756dbeb7e
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800001] = aa84edbb, %l2 = 0000000000000000
	ldstub	[%o1+0x001],%l2		! %l2 = 00000084000000ff
!	%l7 = 2815cd2ee67dabc1, Mem[0000000010141408] = fafdf85682fcc032
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 2815cd2ee67dabc1
!	Mem[0000000030001400] = ff000092, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 2815cd2ee67dabc1, %f16 = ff00c224 f6cc8abd
	ldda	[%i4+0x030]%asi,%f16	! %f16 = 2815cd2e e67dabc1

p0_label_109:
!	Mem[0000000010001400] = fffeaf8e 24a19da9 2836990e ff318abb
!	Mem[0000000010001410] = 000000ff 00000060 a0536e47 7a2bff59
!	Mem[0000000010001420] = aa578b53 b7e40821 884bc224 dfe181b1
!	Mem[0000000010001430] = ba8cffb3 56f8fdfa aa578bda b7e40821
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	%f22 = bf74240a, %f31 = 885eb82e
	fcmpes	%fcc1,%f22,%f31		! %fcc1 = 1
!	Mem[0000000030041410] = ff28ddff, %l3 = 00000000600000ff
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 000000000000ff28
!	Mem[0000000030101410] = fffffff4, %l0 = 00000000600000ff
	lduba	[%i4+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 0badffff, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 000000000badffff
!	Mem[0000000010181400] = ffffffffffffffff, %l1 = 0000000000000092
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 88001724 00008143, %l2 = 00000084, %l3 = 0000ff28
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000088001724 0000000000008143
!	Mem[0000000010181438] = faf2162c, %l2 = 0000000088001724
	ldub	[%i6+0x039],%l2		! %l2 = 00000000000000f2
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 00000000000000ff
	setx	0x949426e0379dba9c,%g7,%l0 ! %l0 = 949426e0379dba9c
!	%l1 = ffffffffffffffff
	setx	0xa83b5d186c32b279,%g7,%l1 ! %l1 = a83b5d186c32b279
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 949426e0379dba9c
	setx	0x9bdbc70f94052c66,%g7,%l0 ! %l0 = 9bdbc70f94052c66
!	%l1 = a83b5d186c32b279
	setx	0x7da9e91fb57a6f7e,%g7,%l1 ! %l1 = 7da9e91fb57a6f7e
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (21)
!	%l1 = 7da9e91fb57a6f7e, Mem[0000000010001408] = 0e993628
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = b57a6f7e

p0_label_110:
!	%l1 = 7da9e91fb57a6f7e, Mem[00000000300c1410] = 1684d534c66036ff
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 7da9e91fb57a6f7e
!	%f12 = ba8cffb3 56f8fdfa, Mem[0000000030101400] = 884bc224 b0c51e69
	stda	%f12,[%i4+%g0]0x89	! Mem[0000000030101400] = ba8cffb3 56f8fdfa
!	%l2 = 00000000000000f2, Mem[0000000030041400] = ff000000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00f20000
!	%f3  = ff318abb, Mem[0000000010081410] = ff0000ff
	sta	%f3 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ff318abb
!	%f16 = 2815cd2e e67dabc1, Mem[00000000100c1408] = ba8cffb3 56f8fdfa
	stda	%f16,[%i3+0x008]%asi	! Mem[00000000100c1408] = 2815cd2e e67dabc1
!	Mem[0000000030141410] = 0000fba8, %l0 = 9bdbc70f94052c66
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000a8000000ff
!	%l7 = 2815cd2ee67dabc1, Mem[00000000100c1410] = 00ff0000
	stwa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = e67dabc1
!	Mem[00000000100c1430] = 884b804d, %l1 = b57a6f7e, %l3 = 00008143
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000884b804d
!	Mem[0000000010101420] = 6d8d4e8cb644550d, %l4 = 00000000000000ff, %l1 = 7da9e91fb57a6f7e
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 6d8d4e8cb644550d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 56f8fdfa, %l1 = 6d8d4e8cb644550d
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 0000000056f8fdfa

p0_label_111:
!	Mem[0000000010101400] = 00000091, %l2 = 00000000000000f2
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000091
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000000091
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 00000000 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000020800040] = 2bffecd0, %l2 = 0000000000000000
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000002bff
!	Mem[0000000030001400] = ff000092 bf74240a b3ff8cba fafdf856
!	Mem[0000000030001410] = 00000000 00000000 44817c95 33b9f0ff
!	Mem[0000000030001420] = a10a760e 5a2be836 c09d1212 a82c0c11
!	Mem[0000000030001430] = b181e1df e642abc1 5d018ec3 c57ab026
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000030001410] = 00000000, %l6 = 000000000badffff
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = fffffff4, %l3 = 00000000884b804d
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	%l5 = 0000000000000000, Mem[0000000010081410] = bb8a31ff0a2474bf
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000010001418] = a0536e47 7a2bff59, %l2 = 00002bff, %l3 = ffffffff
	ldda	[%i0+0x018]%asi,%l2	! %l2 = 00000000a0536e47 000000007a2bff59
!	Starting 10 instruction Store Burst
!	%f30 = f41f2f41 885eb82e, Mem[0000000010101410] = 000000ff ff000060
	stda	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = f41f2f41 885eb82e

p0_label_112:
!	%l1 = 0000000056f8fdfa, Mem[00000000211c0001] = af8e877b
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = affa877b
!	%l4 = 0000000000000000, immd = fffffffffffff376, %l0 = 00000000000000a8
	sdivx	%l4,-0xc8a,%l0		! %l0 = 0000000000000000
!	%f24 = 43810000, Mem[0000000010141410] = 8c4e8d6d
	sta	%f24,[%i5+0x010]%asi	! Mem[0000000010141410] = 43810000
!	%l3 = 000000007a2bff59, Mem[0000000030181410] = 000000ff
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff59
!	%l1 = 0000000056f8fdfa, Mem[0000000020800040] = 2bffecd0, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = fdfaecd0
	membar	#Sync			! Added by membar checker (22)
!	%l1 = 0000000056f8fdfa, Mem[0000000030001400] = ff000092
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = fa000092
!	Mem[0000000010041428] = 7ffbc477, %l6 = 0000000000000000
	swap	[%i1+0x028],%l6		! %l6 = 000000007ffbc477
!	%l0 = 0000000000000000, imm = fffffffffffff366, %l7 = 2815cd2ee67dabc1
	subc	%l0,-0xc9a,%l7		! %l7 = 0000000000000c9a
!	%f0  = ff000092 bf74240a b3ff8cba fafdf856
!	%f4  = 00000000 00000000 44817c95 33b9f0ff
!	%f8  = a10a760e 5a2be836 c09d1212 a82c0c11
!	%f12 = b181e1df e642abc1 5d018ec3 c57ab026
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
!	%l3 = 000000007a2bff59, %l6 = 000000007ffbc477, %l2 = 00000000a0536e47
	addc	%l3,%l6,%l2		! %l2 = 00000000fa27c3d0

p0_label_113:
!	Mem[0000000020800000] = aaffedbb, %l4 = 0000000000000000
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffaaff
!	Mem[00000000100c1408] = 2815cd2e, %l7 = 0000000000000c9a
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000002815
!	Mem[00000000100c1400] = bf74240a, %l6 = 000000007ffbc477
	lduwa	[%i3+%g0]0x80,%l6	! %l6 = 00000000bf74240a
!	Mem[00000000201c0000] = 00ff75c1, %l3 = 000000007a2bff59
	ldub	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081408] = 8c4e8d6d, %l6 = 00000000bf74240a
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffff8c4e
!	Mem[0000000010041410] = ff000000, %l5 = 0000000000000000
	lduha	[%i1+0x012]%asi,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010141400] = ff00c224 f6cc8abd 2815cd2e e67dabc1
!	Mem[0000000010141410] = 43810000 b644ff0d c95d38d7 fdffa1b1
!	Mem[0000000010141420] = 6abf5bc0 9a8b5de6 00000081 67e5f11e
!	Mem[0000000010141430] = 412f1ff4 9e8cd5cc ffffffff 00ff8cba
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010041408] = ff000000836e8709, %l1 = 0000000056f8fdfa, %l6 = ffffffffffff8c4e
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = ff000000836e8709
!	Mem[0000000010181408] = 0000162c4d806c86, %f8  = a10a760e 5a2be836
	ldda	[%i6+%o4]0x80,%f8 	! %f8  = 0000162c 4d806c86
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffaaff, Mem[0000000030101400] = fafdf856b3ff8cba
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffffffffaaff

p0_label_114:
!	Mem[0000000010141410] = 00008143, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000008143
!	Mem[0000000010041410] = ff000000, %l6 = ff000000836e8709
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000fa27c3d0, Mem[0000000010001408] = 7e6f7ab5
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = d06f7ab5
!	%l6 = 000000ff, %l7 = 00002815, Mem[0000000010081410] = 00000000 00000000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 00002815
!	%l4 = ffffffffffffaaff, Mem[00000000211c0001] = affa877b, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = afff877b
!	%f15 = c57ab026, %f13 = e642abc1, %f6  = 44817c95
	fsubs	%f15,%f13,%f6 		! %f6  = 6642abc1
!	%f5  = 00000000, %f9  = 4d806c86
	fcmpes	%fcc1,%f5 ,%f9 		! %fcc1 = 1
!	%l7 = 0000000000002815, Mem[0000000010081410] = 000000ff00002815
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000002815
	membar	#Sync			! Added by membar checker (24)
!	%f10 = c09d1212 a82c0c11, %l4 = ffffffffffffaaff
!	Mem[0000000010141408] = 2815cd2ee67dabc1
	add	%i5,0x008,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141408] = c09d1212a82c0c11
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = e67dabc1, %l0 = 0000000000000000
	ldub	[%i4+0x034],%l0		! %l0 = 00000000000000e6

p0_label_115:
!	Mem[0000000030041408] = ff000060, %l6 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000056f8fdfa, %l5 = 0000000000008143, %l1  = 0000000056f8fdfa
	mulx	%l1,%l5,%l1		! %l1 = 00002bea3b25726e
!	Mem[0000000010001434] = 56f8fdfa, %l6 = 00000000000000ff
	lduba	[%i0+0x035]%asi,%l6	! %l6 = 00000000000000f8
!	Mem[00000000100c1400] = bf74240a ff000092, %l2 = fa27c3d0, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000bf74240a 00000000ff000092
!	Mem[00000000300c1400] = 00000000 00000000 8c4e0000 000000ff
!	Mem[00000000300c1410] = 7e6f7ab5 1fe9a97d 1684d534 c66036ff
!	Mem[00000000300c1420] = 6d8d4e8c 00000001 0000ff00 000000ff
!	Mem[00000000300c1430] = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030181400] = 8fe3b036 01ffffff, %l2 = bf74240a, %l3 = ff000092
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000001ffffff 000000008fe3b036
!	Mem[0000000010101400] = 0000000091000000, %l1 = 00002bea3b25726e
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 0000000091000000
!	Mem[0000000030141408] = b3ff8cbafafdf856, %l3 = 000000008fe3b036
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = b3ff8cbafafdf856
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000002815
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffaaff, %l5 = 00008143, Mem[0000000010041408] = 000000ff 09876e83
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffaaff 00008143

p0_label_116:
!	%f18 = 2815cd2e e67dabc1, Mem[0000000010001400] = 8eaffeff a99da124
	stda	%f18,[%i0+%g0]0x88	! Mem[0000000010001400] = 2815cd2e e67dabc1
!	Mem[0000000010101408] = ffffffff, %l3 = b3ff8cbafafdf856
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000000000f8, Mem[00000000100c1410] = e67dabc1
	stwa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000f8
	membar	#Sync			! Added by membar checker (25)
!	%l0 = 00000000000000e6, Mem[00000000300c1408] = 8c4e0000000000ff
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000e6
!	%f28 = 412f1ff4 9e8cd5cc, %l1 = 0000000091000000
!	Mem[0000000010101418] = 4fd3af3cd1efd355
	add	%i4,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_P ! Mem[0000000010101418] = 4fd3af3cd1efd355
!	Mem[00000000100c1408] = 2815cd2e, %l6 = 00000000000000f8
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000028000000ff
!	%l6 = 0000000000000028, imm = 0000000000000055, %l3 = 00000000000000ff
	xnor	%l6,0x055,%l3		! %l3 = ffffffffffffff82
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000028
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 60000000ff000000, %f24 = 6abf5bc0 9a8b5de6
	ldda	[%i0+%o5]0x88,%f24	! %f24 = 60000000 ff000000

p0_label_117:
!	Mem[0000000010041428] = 00000000, %f3  = 00004e8c
	ld	[%i1+0x028],%f3 	! %f3 = 00000000
!	Mem[0000000030141410] = 00000000, %l3 = ffffffffffffff82
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1438] = 8fe3b036, %l4 = ffffffffffffaaff
	ldsba	[%i3+0x039]%asi,%l4	! %l4 = ffffffffffffffe3
!	Mem[0000000010181430] = bdce655c, %l3 = 0000000000000000
	lduh	[%i6+0x032],%l3		! %l3 = 000000000000655c
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 000032c0, %l2 = 0000000001ffffff
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 00000000000032c0
!	%l7 = 0000000000000000, imm = 00000000000009aa, %l0 = 00000000000000e6
	add	%l7,0x9aa,%l0		! %l0 = 00000000000009aa
!	%l1 = 0000000091000000, %l3 = 000000000000655c, %l4 = ffffffffffffffe3
	xnor	%l1,%l3,%l4		! %l4 = ffffffff6eff9aa3
!	Mem[0000000010001400] = 2815cd2ee67dabc1, %l2 = 00000000000032c0
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 2815cd2ee67dabc1
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = bdce655c, %l5 = 0000000000008143
	swap	[%i6+0x030],%l5		! %l5 = 00000000bdce655c

p0_label_118:
!	%l2 = 2815cd2ee67dabc1, Mem[0000000030141408] = fafdf856
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = e67dabc1
!	%f28 = 412f1ff4 9e8cd5cc, %l0 = 00000000000009aa
!	Mem[0000000010001418] = a0536e477a2bff59
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001418] = a0538c9e7a2b2f41
!	%f0  = 00000000 00000000 ff000000 00000000
!	%f4  = 7da9e91f b57a6f7e ff3660c6 34d58416
!	%f8  = 01000000 8c4e8d6d ff000000 00ff0000
!	%f12 = c1ab7de6 2ecd1528 1f6fff52 34e68dab
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[0000000030041410] = ffdd28ff, %l1 = 0000000091000000
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[000000001010143c] = 52ff6f1f, %l3 = 000000000000655c, %asi = 80
	swapa	[%i4+0x03c]%asi,%l3	! %l3 = 0000000052ff6f1f
!	%l1 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff0000
!	%l6 = 0000000000000000, Mem[0000000030041408] = 600000ff
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000030041408] = 00000000, %l2 = 2815cd2ee67dabc1
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = 01ffffff
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 01ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 7da9e91fb57a6f7e, %l0 = 00000000000009aa
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 7da9e91fb57a6f7e

p0_label_119:
!	Mem[0000000010141410] = 0dff44b600000000, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 0dff44b600000000
!	Mem[0000000010181408] = 0000162c, %l3 = 0000000052ff6f1f
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffaaffff43810000, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = ffaaffff43810000
!	Mem[0000000010001410] = 000000ff, %l5 = 00000000bdce655c
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (26)
!	Mem[00000000100c1420] = 01000000, %l7 = 0dff44b600000000
	ldsha	[%i3+0x020]%asi,%l7	! %l7 = 0000000000000100
!	Mem[00000000100c1418] = ff3660c634d58416, %l7 = 0000000000000100
	ldxa	[%i3+0x018]%asi,%l7	! %l7 = ff3660c634d58416
!	Mem[0000000010081400] = ffffad0b, %l3 = ffaaffff43810000
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffffad0b
!	Mem[0000000010001408] = b57a6fd0, %l2 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffffd0
!	Mem[00000000300c1400] = 00000000 00000000 00000000 000000e6
!	Mem[00000000300c1410] = 7e6f7ab5 1fe9a97d 1684d534 c66036ff
!	Mem[00000000300c1420] = 6d8d4e8c 00000001 0000ff00 000000ff
!	Mem[00000000300c1430] = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_120:
!	Mem[0000000010181408] = 0000162c, %l3 = ffffffffffffad0b
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = afff877b, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 000000af000000ff
!	Mem[0000000030181408] = ff0000ff, %l4 = ffffffff6eff9aa3
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141438] = ffffffff, %l0 = 7da9e91fb57a6f7e
	ldstuba	[%i5+0x038]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000030141408] = c1ab7de6, %l3 = 00000000000000af
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 000000c1000000ff
!	%l5 = 0000000000000000, Mem[0000000030181410] = 0000ff59
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030001408] = b3ff8cba fafdf856
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff 000000ff
!	%f26 = 00000081 67e5f11e, %l5 = 0000000000000000
!	Mem[0000000030081428] = 595e11c70710d380
	add	%i2,0x028,%g1
	stda	%f26,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030081428] = 595e11c70710d380
!	Starting 10 instruction Load Burst
!	%l7 = ff3660c634d58416, %l6 = 0000000000000000, %l7 = ff3660c634d58416
	orn	%l7,%l6,%l7		! %l7 = ffffffffffffffff

p0_label_121:
!	Mem[0000000010041400] = ffffffb0ffffff81, %l3 = 00000000000000c1
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = ffffffb0ffffff81
!	Mem[0000000030001408] = 000000ff, %l2 = ffffffffffffffd0
	ldsha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = c1ab7de6, %l7 = ffffffffffffffff
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffc1ab
!	Mem[0000000010101400] = 91000000, %f22 = c95d38d7
	lda	[%i4+%g0]0x88,%f22	! %f22 = 91000000
!	Mem[0000000030141410] = 00ff000000000000, %f30 = ffffffff 00ff8cba
	ldda	[%i5+%o5]0x81,%f30	! %f30 = 00ff0000 00000000
!	Mem[00000000100c1410] = 7da9e91f, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 000000007da9e91f
!	Mem[0000000010081410] = 00000000, %l4 = 000000007da9e91f
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000 000032c0, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000000032c0 0000000000000000
!	Mem[0000000010001400] = c1ab7de6, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 00000000c1ab7de6
!	Starting 10 instruction Store Burst
!	%l4 = 000032c0, %l5 = c1ab7de6, Mem[0000000010041418] = ff318abb faf2162c
	std	%l4,[%i1+0x018]		! Mem[0000000010041418] = 000032c0 c1ab7de6

p0_label_122:
!	Mem[0000000030081400] = 00000000, %l7 = ffffffffffffc1ab
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010081408] = 1f6fff52
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ff52
!	%l5 = 00000000c1ab7de6, Mem[0000000010081410] = 0000000000002815
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000c1ab7de6
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000c1ab7de6
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	%f24 = 60000000 ff000000, %l4 = 00000000000032c0
!	Mem[0000000010041420] = 67be1bddbf74240a
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_P ! Mem[0000000010041420] = 67be1bddbf74240a
!	%f24 = 60000000 ff000000, %l7 = 0000000000000000
!	Mem[0000000010081420] = 32c0fc8293318aff
	add	%i2,0x020,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081420] = 32c0fc8293318aff
!	%l2 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030141400] = 0a2474bf
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 002474bf
!	%f28 = 412f1ff4, Mem[00000000100c1410] = 7da9e91f
	sta	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = 412f1ff4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 24a11e94, %l4 = 00000000000032c0
	ldsw	[%i1+0x034],%l4		! %l4 = 0000000024a11e94

p0_label_123:
!	Mem[0000000010001400] = c1ab7de6, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000c1
!	Mem[0000000010141414] = b644ff0d, %l2 = 00000000000000c1
	lduwa	[%i5+0x014]%asi,%l2	! %l2 = 00000000b644ff0d
!	Mem[0000000010001410] = 000000ff, %f26 = 00000081
	lda	[%i0+%o5]0x80,%f26	! %f26 = 000000ff
!	Mem[00000000100c1408] = c1ab7de6, %l0 = 00000000000000ff
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffffc1ab7de6
!	Mem[0000000030081400] = abc1ffff, %l5 = 00000000ff000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ab
!	Mem[0000000030141408] = e67dabff, %l5 = 00000000000000ab
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 000000000000abff
!	Mem[000000001018142c] = 23145b02, %f23 = fdffa1b1
	lda	[%i6+0x02c]%asi,%f23	! %f23 = 23145b02
!	Mem[0000000010181410] = 88001724, %l3 = ffffffb0ffffff81
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000088
!	Mem[0000000030141400] = 002474bf, %l1 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 00000000002474bf
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = 34e68dab, %l1 = 00000000002474bf, %asi = 80
	swapa	[%i2+0x00c]%asi,%l1	! %l1 = 0000000034e68dab

p0_label_124:
!	Mem[0000000010041410] = ff000000, %l7 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001400] = c1ab7de6, %l1 = 0000000034e68dab
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000c1ab7de6
!	Mem[00000000100c1408] = e67dabc1, %l3 = 0000000000000088
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000c1000000ff
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000024a11e94
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%f9  = 00000001, Mem[0000000010001408] = d06f7ab5
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000001
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff00c224
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000c224
!	%f24 = 60000000 ff000000, Mem[0000000030001408] = ff000000 ff000000
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = 60000000 ff000000
!	Mem[0000000010101400] = 00000091, %l1 = 00000000c1ab7de6
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f16 = ff00c224 f6cc8abd, Mem[0000000030101400] = ffffffff ffaaffff
	stda	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00c224 f6cc8abd
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l5 = 000000000000abff
	ldsb	[%i3+0x002],%l5		! %l5 = 0000000000000000

p0_label_125:
!	Mem[0000000030181408] = ff0000ff, %l0 = ffffffffc1ab7de6
	lduwa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010101400] = ff000091, %l3 = 00000000000000c1
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	%f21 = b644ff0d, %f1  = 00000000, %f20 = 43810000
	fdivs	%f21,%f1 ,%f20		! %f20 = ff800000
!	Mem[0000000010101410] = 2eb85e88, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000002eb8
!	Mem[0000000030181400] = 0000ff01, %l7 = 00000000ff000000
	lduba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = c0320000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000c0
!	Mem[00000000100c1410] = 412f1ff4b57a6f7e, %f4  = 7e6f7ab5 1fe9a97d
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 412f1ff4 b57a6f7e
!	%l4 = 0000000000000000, imm = 0000000000000116, %l1 = 0000000000002eb8
	xor	%l4,0x116,%l1		! %l1 = 0000000000000116
!	Mem[0000000010141410] = 00000000, %l3 = ffffffffffffffff
	ldsha	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000b644ff0d, Mem[0000000010141410] = 00000000
	stha	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ff0d

p0_label_126:
!	%l4 = 00000000, %l5 = 000000c0, Mem[0000000030101408] = 28000000 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000c0
!	%l4 = 0000000000000000, Mem[00000000218000c0] = bb36968e, %asi = 80
	stha	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0000968e
!	%f1  = 00000000, Mem[00000000100c1410] = 412f1ff4
	sta	%f1 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010181410] = 88001724, %l5 = 00000000000000c0
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 0000000088001724
!	%l6 = 0000000000000000, Mem[0000000010081410] = 00000000c1ab7de6
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000010081408] = 0000ff52, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f3  = 000000e6, Mem[0000000010181408] = 2c1600ff
	sta	%f3 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000e6
!	Mem[0000000010141438] = ffffffff, %l4 = 00000000, %l1 = 00000116
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181400] = 0000ff01, %l1 = 00000000ffffffff
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 000000000000ff01
!	Starting 10 instruction Load Burst
!	%f22 = 91000000, %f4  = 412f1ff4, %f24 = 60000000 ff000000
	fsmuld	%f22,%f4 ,%f24		! %f24 = ba55e3fe 80000000

p0_label_127:
!	Mem[0000000010081408] = 52ff00ff, %l2 = 00000000b644ff0d
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00ff0000, %l5 = 0000000088001724
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010181400] = ffffffff ffffffff e6000000 4d806c86
!	Mem[0000000010181410] = 000000c0 00008143 b6179133 17937f0f
!	Mem[0000000010181420] = 00000000 00008100 ffcc3530 23145b02
!	Mem[0000000010181430] = 00008143 8011ff92 faf2162c 691ec5b0
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Mem[00000000100c1434] = 2ecd1528, %l5 = 00000000000000ff
	ldsha	[%i3+0x036]%asi,%l5	! %l5 = 0000000000001528
!	Mem[0000000010041400] = 81ffffff, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 0000000081ffffff
!	%f26 = 000000ff 67e5f11e, Mem[0000000010141408] = c09d1212 a82c0c11
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff 67e5f11e
!	Mem[0000000030001408] = 000000ff00000060, %f22 = 91000000 23145b02
	ldda	[%i0+%o4]0x81,%f22	! %f22 = 000000ff 00000060
!	Mem[0000000030001408] = 000000ff00000060, %l5 = 0000000000001528
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 000000ff00000060
!	Mem[00000000201c0000] = 00ff75c1, %l3 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041400] = 00f20000
	stha	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000

p0_label_128:
!	%f26 = 000000ff 67e5f11e, Mem[0000000010101428] = 0000ff00 000000ff
	stda	%f26,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000ff 67e5f11e
!	%l7 = 0000000000000000, Mem[0000000030001408] = 000000ff
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f20 = ff800000, Mem[00000000300c1400] = 00000000
	sta	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff800000
!	%l1 = 000000000000ff01, Mem[0000000010101408] = ffffffff, %asi = 80
	stwa	%l1,[%i4+0x008]%asi	! Mem[0000000010101408] = 0000ff01
!	%l0 = ff0000ff, %l1 = 0000ff01, Mem[00000000300c1408] = 941ea124 000000e6
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0000ff 0000ff01
!	Mem[0000000030081410] = c0320000, %l2 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000c0320000
!	%l1 = 000000000000ff01, Mem[0000000030001400] = 0a2474bf920000fa
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000ff01
!	%f26 = 000000ff 67e5f11e, Mem[0000000010001410] = 000000ff 00000060
	stda	%f26,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff 67e5f11e
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l5 = 000000ff00000060, %l6 = 0000000081ffffff, %y  = ffffffff
	smul	%l5,%l6,%l3		! %l3 = ffffffd0bfffffa0, %y = ffffffd0

p0_label_129:
!	Mem[0000000030041400] = 00000000, %l1 = 000000000000ff01
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 000000c000008143, %l3 = ffffffd0bfffffa0
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = 000000c000008143
!	Mem[0000000030001408] = 60000000 00000000, %l0 = ff0000ff, %l1 = 00000000
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000060000000
!	Mem[0000000010141408] = ff000000, %f22 = 000000ff
	lda	[%i5+%o4]0x88,%f22	! %f22 = ff000000
!	%l0 = 0000000000000000, %l3 = 000000c000008143, %l0 = 0000000000000000
	and	%l0,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000030101400] = ff00c224 f6cc8abd, %l2 = c0320000, %l3 = 00008143
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000f6cc8abd 00000000ff00c224
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000060000000
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000f6cc8abd
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = bf742400, %l5 = 000000ff00000060
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000bf742400
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, %l5 = 00000000bf742400, %l4 = 0000000000000000
	xnor	%l2,%l5,%l4		! %l4 = ffffffff408bdbff

p0_label_130:
!	Mem[0000000010041400] = 81ffffff, %l6 = 0000000081ffffff
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000081000000ff
!	Mem[0000000030101400] = f6cc8abd, %l6 = 0000000000000081
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000bd000000ff
!	%l3 = 00000000ff00c224, Mem[00000000100c1400] = 00000000
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000024
!	Mem[0000000010081438] = 81e3b036, %l0 = 0000000000000000, %asi = 80
	swapa	[%i2+0x038]%asi,%l0	! %l0 = 0000000081e3b036
!	%f30 = 00ff0000 00000000, Mem[0000000010041408] = ffffaaff 00008143
	stda	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = 00ff0000 00000000
!	Mem[0000000030001408] = 00000000, %l0 = 0000000081e3b036
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 0000c224, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 000000000000c224
!	%f18 = 2815cd2e e67dabc1, Mem[0000000030041408] = c1ab7de6 7c37eb28
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 2815cd2e e67dabc1
!	Mem[00000000100c1408] = e67dabff, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 2eb85e88, %l7 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 000000000000002e

p0_label_131:
!	Mem[0000000010081400] = 56000000ffffad0b, %f24 = ba55e3fe 80000000
	ldda	[%i2+%g0]0x88,%f24	! %f24 = 56000000 ffffad0b
!	Mem[00000000100c1410] = 00000000 b57a6f7e, %l4 = 408bdbff, %l5 = bf742400
	ldd	[%i3+%o5],%l4		! %l4 = 0000000000000000 00000000b57a6f7e
!	%f4  = 43810000, %f6  = 0f7f9317, %f0  = ffffffff
	fmuls	%f4 ,%f6 ,%f0 		! %f0  = 1380c91f
!	%l7 = 000000000000002e, %l0 = 0000000000000000, %l4 = 0000000000000000
	orn	%l7,%l0,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101400] = ff8accf6, %l4 = ffffffffffffffff
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = ffdd28ff, %l2 = 000000000000c224
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l3 = 00000000ff00c224
	ldsba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = bb8a31ff01000000, %l5 = 00000000b57a6f7e
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = bb8a31ff01000000
!	%l3 = 0000000000000000, %l2 = ffffffffffffffff, %l0 = 0000000000000000
	xor	%l3,%l2,%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081400] = 0badffff00000056
	stxa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000

p0_label_132:
!	%l1 = 0000000000000000, Mem[00000000300c1408] = 01ff0000ff0000ff
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l7 = 000000000000002e
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f0  = 1380c91f ffffffff 866c804d 000000e6
!	%f4  = 43810000 c0000000 0f7f9317 339117b6
!	%f8  = 00810000 00000000 025b1423 3035ccff
!	%f12 = 92ff1180 43810000 b0c51e69 2c16f2fa
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	Mem[0000000010101410] = 885eb82e, %l2 = ffffffffffffffff
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 00000000885eb82e
!	%l7 = 0000000000000000, Mem[00000000100c1408] = e67dabff
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = e67dab00
!	%l3 = 0000000000000000, Mem[00000000300c1400] = 000080ff
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00008000
!	%l6 = 00000000000000bd, Mem[00000000300c1410] = 7e6f7ab5
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000bd
!	%l7 = 0000000000000000, Mem[0000000010141400] = 00000000f6cc8abd
	stx	%l7,[%i5+%g0]		! Mem[0000000010141400] = 0000000000000000
!	%l4 = ffffffff, %l5 = 01000000, Mem[00000000300c1408] = 00000000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff 01000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff00009100000000, %l6 = 00000000000000bd
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = ff00009100000000

p0_label_133:
!	Mem[0000000030141410] = 00ff0000, %l4 = ffffffffffffffff
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 0080000000000000, %f24 = 56000000 ffffad0b
	ldda	[%i3+%g0]0x81,%f24	! %f24 = 00800000 00000000
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010181408] = 000000e6, %l0 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000e6
!	Mem[0000000010041410] = 00000000, %l5 = bb8a31ff01000000
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041414] = 00000000, %l0 = 00000000000000e6
	lduw	[%i1+0x014],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001408] = 36b0e381, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 00000000000036b0
!	Mem[000000001000140c] = ff318abb, %l0 = 0000000000000000
	ldub	[%i0+0x00f],%l0		! %l0 = 00000000000000bb
!	Mem[0000000010181400] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = 4d806c86, %l4 = 00000000000000ff
	swap	[%i6+0x00c],%l4		! %l4 = 000000004d806c86

p0_label_134:
!	Mem[0000000010181410] = 000000c0, %l7 = 00000000000036b0
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000c0
!	%l3 = 0000000000000000, Mem[0000000030181410] = c0000000
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = c0000000
!	Mem[0000000010181410] = b0360000, %l2 = 00000000885eb82e
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000b0360000
!	%f28 = 412f1ff4, Mem[00000000300c1410] = bd000000
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 412f1ff4
!	Mem[0000000010001410] = 000000ff, %l0 = 00000000000000bb
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000b0360000, Mem[00000000100c1400] = 00000024
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[00000000100c1408] = e67dab00, %l6 = ff00009100000000
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000004d806c86, Mem[0000000010181408] = e6000000
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 6c860000
!	Mem[0000000010181402] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i6+0x002]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_135:
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000218001c0] = 28ad75f7, %l0 = 0000000000000000
	lduba	[%o3+0x1c0]%asi,%l0	! %l0 = 0000000000000028
!	Mem[0000000010181400] = ffffffff, %l1 = ffffffffffffffff
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 60000000, %f2  = 866c804d
	lda	[%i5+%g0]0x81,%f2 	! %f2 = 60000000
!	Mem[00000000100c1408] = ffab7de6, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ffab7de6
!	Mem[0000000030041408] = c1ab7de6, %l1 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = ffffffffc1ab7de6
!	Mem[00000000300c1400] = 00800000, %l0 = 0000000000000028
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000080
!	Mem[0000000030001400] = 01ff0000, %l5 = 00000000ffab7de6
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = 00000000000001ff
!	Mem[0000000010141400] = 00000000, %l7 = 00000000000000c0
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = 2815cd2e e67dabc1, %l1 = ffffffffc1ab7de6
!	Mem[0000000010001418] = a0538c9e7a2b2f41
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001418] = a0537de62ecd2f41

p0_label_136:
!	%l1 = ffffffffc1ab7de6, Mem[0000000010181400] = ffffffff
	stba	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = e6ffffff
!	Mem[0000000030141410] = 0000ff00, %l1 = ffffffffc1ab7de6
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 000000000000ff00
!	%l1 = 000000000000ff00, Mem[0000000010101411] = ffffffff
	stb	%l1,[%i4+0x011]		! Mem[0000000010101410] = ff00ffff
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l4 = 000000004d806c86, Mem[000000001010143c] = 0000655c, %asi = 80
	stha	%l4,[%i4+0x03c]%asi	! Mem[000000001010143c] = 6c86655c
!	%f11 = 3035ccff, Mem[0000000010001400] = ab8de634
	sta	%f11,[%i0+%g0]0x88	! Mem[0000000010001400] = 3035ccff
!	Mem[0000000030141410] = e67dabc1, %l2 = 00000000b0360000
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 000000e6000000ff
!	%l4 = 000000004d806c86, Mem[0000000010001400] = ffcc3530
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 4d806c86
!	%l0 = 0000000000000080, Mem[0000000030041410] = ff28ddff
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000080
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff877b, %l4 = 000000004d806c86
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff

p0_label_137:
!	%l2 = 00000000000000e6, imm = 000000000000042f, %l0 = 0000000000000080
	subc	%l2,0x42f,%l0		! %l0 = fffffffffffffcb7
!	Mem[0000000010101410] = f41f2f41ffff00ff, %f4  = 43810000 c0000000
	ldda	[%i4+%o5]0x88,%f4 	! %f4  = f41f2f41 ffff00ff
!	Mem[0000000030141408] = ffab7de6, %l4 = 000000000000ffff
	lduba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = e6ffffff, %l5 = 00000000000001ff
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 000000000000e6ff
!	Mem[0000000010101408] = 0000ff01, %l2 = 00000000000000e6
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	%f11 = 3035ccff, %f12 = 92ff1180
	fcmps	%fcc3,%f11,%f12		! %fcc3 = 2
!	Mem[0000000010081408] = ff00ff52, %l1 = 000000000000ff00
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffff00ff52
!	Mem[0000000030041408] = e67dabc1, %l1 = ffffffffff00ff52
	ldsba	[%i1+%o4]0x89,%l1	! %l1 = ffffffffffffffc1
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[000000001004141e] = c1ab7de6
	stb	%l7,[%i1+0x01e]		! Mem[000000001004141c] = c1abffe6

p0_label_138:
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l1 = ffffffffffffffc1, Mem[0000000030101408] = 2e000000000000c0
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffffffffffc1
!	Mem[0000000010081400] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000211c0000] = ffff877b, %l5 = 000000000000e6ff
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181400] = ffffffff 1fc98013
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	Mem[0000000010141400] = 00000000, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 00000060, %l1 = ffffffffffffffc1
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000060
!	%l5 = 0000000000000000, Mem[0000000010181427] = 00008100
	stb	%l5,[%i6+0x027]		! Mem[0000000010181424] = 00008100
!	%l0 = fffffffffffffcb7, Mem[00000000100c1418] = ff3660c634d58416
	stx	%l0,[%i3+0x018]		! Mem[00000000100c1418] = fffffffffffffcb7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 60000000 81e3b036, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000081e3b036 0000000060000000

p0_label_139:
!	Mem[0000000010081400] = 00000000 00000000 ff00ff52 002474bf
!	Mem[0000000010081410] = 00000000 00000000 92000000 691e0821
!	Mem[0000000010081420] = 32c0fc82 93318aff ffffaa84 00000060
!	Mem[0000000010081430] = 0542b5e2 00000036 00000000 cc650044
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000030101408] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101430] = 2815cd2ee67dabc1, %f20 = ff800000 b644ff0d
	ldda	[%i4+0x030]%asi,%f20	! %f20 = 2815cd2e e67dabc1
!	Mem[00000000201c0000] = 00ff75c1, %l0 = fffffffffffffcb7
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 01ff0000, %l5 = 0000000060000000
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000080, %l4 = 0000000081e3b036
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000080
!	Mem[0000000030101400] = f6cc8aff, %l3 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000f6cc8aff
!	Mem[0000000030081408] = 6d8d4e8c, %l0 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 000000006d8d4e8c
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 00000000, %l3 = 00000000f6cc8aff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_140:
!	%l1 = 0000000000000060, Mem[0000000010001418] = a0537de6, %asi = 80
	stba	%l1,[%i0+0x018]%asi	! Mem[0000000010001418] = 60537de6
!	%f26 = 000000ff 67e5f11e, %l7 = 0000000000000000
!	Mem[0000000030081408] = 8c4e8d6db7e40821
	add	%i2,0x008,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030081408] = 8c4e8d6db7e40821
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000060
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030081410] = 00000000ff000000
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000010101408] = 0000ff01, %l4 = 0000000000000080
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f19 = e67dabc1, Mem[0000000030081408] = 8c4e8d6d
	sta	%f19,[%i2+%o4]0x81	! Mem[0000000030081408] = e67dabc1
!	%l4 = 0000000000000000, Mem[0000000010181400] = e6ffffff
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff
!	Mem[00000000201c0001] = 00ff75c1, %l5 = 0000000000000000
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%f22 = ff000000 00000060, %l2 = 0000000000000000
!	Mem[00000000100c1410] = 00000000b57a6f7e
	add	%i3,0x010,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1410] = 00000000b57a6f7e
!	Starting 10 instruction Load Burst
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010101400] = ff000091 00000000
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 000000ff

p0_label_141:
!	Mem[0000000010101400] = 00000000, %l0 = 000000006d8d4e8c
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ffab7de6 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000ffab7de6 0000000000000000
!	Mem[0000000030081408] = e67dabc1, %l7 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l7	! %l7 = 00000000e67dabc1
!	Mem[0000000030101408] = ffffffff, %l7 = 00000000e67dabc1
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030101410] = f4ffffff, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = fffffffff4ffffff
!	Mem[0000000030081410] = 00000000, %l0 = 00000000ffab7de6
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 36b0e381, %f29 = 9e8cd5cc
	lda	[%i0+%o4]0x81,%f29	! %f29 = 36b0e381
!	Mem[0000000010141418] = c95d38d7, %l2 = fffffffff4ffffff
	lduw	[%i5+0x018],%l2		! %l2 = 00000000c95d38d7
!	Mem[0000000030101410] = 01000000f4ffffff, %f26 = 000000ff 67e5f11e
	ldda	[%i4+%o5]0x89,%f26	! %f26 = 01000000 f4ffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000030141410] = c1ab7dff 00000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff ffffffff

p0_label_142:
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 412f1ff4
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 412f1f00
!	%l7 = 00000000ffffffff, Mem[0000000030001400] = 0000ff01
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff
!	%l3 = 0000000000000000, Mem[0000000010001400] = 4d806c86
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000010041400] = ffffffff ffffffb0
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff ffffffff
!	%l2 = 00000000c95d38d7, Mem[00000000100c1428] = ff00000000ff0000
	stx	%l2,[%i3+0x028]		! Mem[00000000100c1428] = 00000000c95d38d7
!	Mem[00000000300c1400] = 00008000, %l2 = 00000000c95d38d7
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000008000
!	%f22 = ff000000 00000060, Mem[0000000010141408] = 000000ff 67e5f11e
	stda	%f22,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000 00000060
!	%f26 = 01000000, Mem[0000000030141400] = c1ffffff
	sta	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 01000000
!	Mem[0000000010081408] = ff00ff52, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000ff00ff52
!	Starting 10 instruction Load Burst
!	%f5  = 00000000, %f28 = 412f1ff4, %f3  = 002474bf
	fdivs	%f5 ,%f28,%f3 		! %f3  = 00000000

p0_label_143:
!	Mem[0000000010001410] = ff0000ff, %f15 = cc650044
	lda	[%i0+%o5]0x80,%f15	! %f15 = ff0000ff
!	Mem[0000000030081400] = abc1ffff, %f11 = 00000060
	lda	[%i2+%g0]0x81,%f11	! %f11 = abc1ffff
!	Mem[0000000010081408] = 00000000002474bf, %f28 = 412f1ff4 36b0e381
	ldda	[%i2+%o4]0x80,%f28	! %f28 = 00000000 002474bf
!	Mem[0000000030081410] = 0000000000000000, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l6 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041400] = ffffffff ffffffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010141400] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800100] = 8bdd9604, %l6 = 000000000000ffff
	ldsh	[%o3+0x100],%l6		! %l6 = ffffffffffff8bdd
!	Mem[0000000010041408] = 000000000000ff00, %l1 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181408] = 6c860000000000ff
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000

p0_label_144:
!	Mem[0000000030081408] = c1ab7de6, %l6 = ffffffffffff8bdd
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000e6000000ff
!	Mem[0000000010101410] = ff00ffff, %l3 = 00000000ff00ff52
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff00ffff
!	Mem[0000000030181410] = c0000000, %l2 = 0000000000008000
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f30 = 00ff0000 00000000, Mem[0000000030041408] = e67dabc1 2815cd2e
	stda	%f30,[%i1+%o4]0x89	! Mem[0000000030041408] = 00ff0000 00000000
!	%l3 = 00000000ff00ffff, Mem[0000000030001410] = 00000000ff8accf6
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000ff00ffff
!	%l2 = 0000000000000000, imm = 0000000000000929, %l5 = 00000000ffffffff
	xnor	%l2,0x929,%l5		! %l5 = fffffffffffff6d6
!	Mem[0000000010001408] = 01000000, %l5 = fffffffffffff6d6
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 0000000001000000
!	%l7 = 00000000ffffffff, Mem[0000000020800041] = fdfaecd0, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = fdffecd0
!	Mem[000000001014141c] = fdffa1b1, %l2 = 00000000, %l0 = 00000000
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000fdffa1b1
!	Starting 10 instruction Load Burst
!	%l4 = 00000000ffffffff, imm = fffffffffffffd68, %l3 = 00000000ff00ffff
	andn	%l4,-0x298,%l3		! %l3 = 0000000000000297

p0_label_145:
!	Mem[00000000100c1408] = ffab7de6, %l4 = 00000000ffffffff
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ffab
!	Mem[00000000211c0000] = ffff877b, %l1 = 000000000000ff00
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = 01ff00ff, %f5  = 00000000
	lda	[%i4+%o4]0x88,%f5 	! %f5 = 01ff00ff
!	Mem[0000000030141400] = 00000001, %l0 = 00000000fdffa1b1
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000001
!	Mem[0000000010101408] = 01ff00ff, %l4 = 000000000000ffab
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000297
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00000000 00000000, %l6 = 000000e6, %l7 = ffffffff
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = abc1ffff, %l0 = 0000000000000001
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 000000000000abc1
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 000000000000abc1
	setx	0x13ea5f9fd5ca33f9,%g7,%l0 ! %l0 = 13ea5f9fd5ca33f9
!	%l1 = ffffffffffffffff
	setx	0xba171070420b54e1,%g7,%l1 ! %l1 = ba171070420b54e1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 13ea5f9fd5ca33f9
	setx	0xe10275905cbdbb80,%g7,%l0 ! %l0 = e10275905cbdbb80
!	%l1 = ba171070420b54e1
	setx	0x51d9b9185e37dbd7,%g7,%l1 ! %l1 = 51d9b9185e37dbd7
!	Starting 10 instruction Store Burst
!	%l5 = 0000000001000000, Mem[000000001018141b] = b6179133, %asi = 80
	stba	%l5,[%i6+0x01b]%asi	! Mem[0000000010181418] = b6179100

p0_label_146:
!	%f22 = ff000000 00000060, Mem[0000000010001410] = ff0000ff 67e5f11e
	stda	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000 00000060
!	%f26 = 01000000 f4ffffff, Mem[0000000030081408] = ff7dabc1 b7e40821
	stda	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = 01000000 f4ffffff
!	%f30 = 00ff0000 00000000, Mem[0000000030181410] = ff0000c0 00008143
	stda	%f30,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000 00000000
	membar	#Sync			! Added by membar checker (29)
!	%l0 = 5cbdbb80, %l1 = 5e37dbd7, Mem[0000000010081408] = 00000000 002474bf
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 5cbdbb80 5e37dbd7
!	%f8  = 32c0fc82 93318aff, Mem[0000000030101408] = ffffffff ffffffc1
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 32c0fc82 93318aff
!	Mem[0000000030141408] = ffab7de6, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffab7de6
!	%f31 = 00000000, Mem[0000000010141410] = 0dff0000
	sta	%f31,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f10 = ffffaa84 abc1ffff, Mem[00000000100c1408] = e67dabff 00000000
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffaa84 abc1ffff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181410] = 0000ff00 00000000
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = abc1ffff, %l4 = ffffffffffffffff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffabc1ffff

p0_label_147:
!	Mem[0000000010181400] = ffff0000, %l2 = 00000000ffab7de6
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = e10275905cbdbb80, imm = fffffffffffffb52, %l6 = 0000000000000000
	and	%l0,-0x4ae,%l6		! %l6 = e10275905cbdbb00
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l4 = ffffffffabc1ffff
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f29 = 002474bf, %f18 = 2815cd2e
	fcmps	%fcc1,%f29,%f18		! %fcc1 = 1
!	%l1 = 51d9b9185e37dbd7, immed = fffff607, %y  = ffffffd0
	sdiv	%l1,-0x9f9,%l0		! %l0 = 0000000004c6b8b8
	mov	%l0,%y			! %y = 04c6b8b8
!	Mem[0000000010001410] = 60000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff 0000000060000000
!	Mem[0000000010001410] = 60000000000000ff, %f8  = 32c0fc82 93318aff
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 60000000 000000ff
!	Mem[00000000300c1408] = ffffffff, %l5 = 0000000001000000
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 0000000000000000, %asi = 80
	stxa	%l5,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000000000ff

p0_label_148:
!	Mem[0000000030041400] = 00000000, %l1 = 51d9b9185e37dbd7
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 412f1f00, %l3 = 0000000060000000
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f2  = ff00ff52, Mem[0000000030181408] = 000000e6
	sta	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff00ff52
!	%f30 = 00ff0000 00000000, Mem[00000000100c1428] = 00000000 c95d38d7
	std	%f30,[%i3+0x028]	! Mem[00000000100c1428] = 00ff0000 00000000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000004c6b8b8
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f14 = 00000000 ff0000ff, Mem[0000000010001420] = aa578b53 b7e40821
	stda	%f14,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 ff0000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030041410] = 00000080 000000ff
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff
!	Mem[0000000030081400] = abc1ffff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000abc1ffff
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000300c1400] = c95d38d7 00000000
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %f23 = 00000060
	lda	[%i5+%o4]0x80,%f23	! %f23 = ff000000

p0_label_149:
!	%l5 = 00000000000000ff, %l0 = 0000000000000000, %l1 = 0000000000000000
	add	%l5,%l0,%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l3 = 00000000abc1ffff
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l6 = e10275905cbdbb00
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 32c0fc82, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = 0000000032c0fc82
!	Mem[0000000030141408] = b3ff8cba 00000000, %l6 = 00000000, %l7 = 32c0fc82
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000b3ff8cba
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[000000001018142c] = 23145b02, %f13 = 00000036
	lda	[%i6+0x02c]%asi,%f13	! %f13 = 23145b02
!	Mem[00000000201c0000] = 00ff75c1, %l4 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181423] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i6+0x023]%asi,%l2	! %l2 = 00000000000000ff

p0_label_150:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081410] = 00000000 00000000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000000
!	%f18 = 2815cd2e, Mem[0000000010041408] = 00000000
	sta	%f18,[%i1+%o4]0x88	! Mem[0000000010041408] = 2815cd2e
!	%l3 = 0000000000000000, Mem[0000000030041400] = 5e37dbd7
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 0037dbd7
!	%l4 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stba	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[0000000021800041] = 27dfd2c8, %l1 = 00000000000000ff
	ldstub	[%o3+0x041],%l1		! %l1 = 000000df000000ff
!	%f0  = 00000000 00000000 ff00ff52 00000000
!	%f4  = 00000000 01ff00ff 92000000 691e0821
!	%f8  = 60000000 000000ff ffffaa84 abc1ffff
!	%f12 = 0542b5e2 23145b02 00000000 ff0000ff
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	%l4 = 000000ff, %l5 = 000000ff, Mem[00000000300c1408] = ffffffff 01000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030181400] = 00000000 00000000
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00000000
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 04c6b8b8, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 00000000000004c6

p0_label_151:
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i2+0x012]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 000000ff00000000, %f18 = 2815cd2e e67dabc1
	ldda	[%i5+%g0]0x80,%f18	! %f18 = 000000ff 00000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010181410] = 885eb82e, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 000000000000b82e
!	Mem[00000000100c1408] = ffffc1ab84aaffff, %f18 = 000000ff 00000000
	ldda	[%i3+%o4]0x80,%f18	! %f18 = ffffc1ab 84aaffff
!	Mem[0000000010041400] = ffffffff, %f11 = abc1ffff
	lda	[%i1+0x000]%asi,%f11	! %f11 = ffffffff
!	Mem[00000000300c1408] = 000000ff, %f22 = ff000000
	lda	[%i3+%o4]0x81,%f22	! %f22 = 000000ff
!	Mem[0000000030141400] = ff00009200000001, %f26 = 01000000 f4ffffff
	ldda	[%i5+%g0]0x89,%f26	! %f26 = ff000092 00000001
!	Mem[0000000010041410] = 00000000, %l1 = 00000000000000df
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 885eb82e, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 0000002e000000ff

p0_label_152:
!	Mem[00000000201c0001] = 00ff75c1, %l5 = 000000000000b82e
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000030141400] = 01000000, %l6 = 00000000000004c6
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 00000001000000ff
!	%f2  = ff00ff52 00000000, %l0 = 0000000000000000
!	Mem[0000000030001408] = 36b0e38100000060
	add	%i0,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_S ! Mem[0000000030001408] = 36b0e38100000060
!	%l2 = 0000000000000000, Mem[0000000010101438] = ab8de6346c86655c, %asi = 80
	stxa	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = ff00ffff
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000
!	%f10 = ffffaa84 ffffffff, %l2 = 00000000000000ff
!	Mem[0000000010141430] = 412f1ff49e8cd5cc
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141430] = ffffaa84ffffffff
!	%l7 = 00000000b3ff8cba, Mem[00000000100c1410] = 00000000
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ba
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 01000000, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000100

p0_label_153:
!	Mem[00000000218000c0] = 0000968e, %l4 = 000000000000002e
	ldsb	[%o3+0x0c1],%l4		! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00ff75c1, %l7 = 00000000b3ff8cba
	ldub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c141c] = fffffcb7, %l7 = 0000000000000000
	ldsba	[%i3+0x01e]%asi,%l7	! %l7 = fffffffffffffffc
!	Mem[0000000030001400] = 00000000ffffffff, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000300c1408] = ff000000ff000000, %l1 = 00000000ffffffff
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = ff000000ff000000
!	%f19 = 84aaffff, %f31 = 00000000, %f4  = 00000000
	fdivs	%f19,%f31,%f4 		! %f4  = ff800000
!	Mem[0000000030041408] = 00000000 0000ff00, %l0 = 00000000, %l1 = ff000000
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000 000000000000ff00
!	Mem[0000000010001414] = 00000060, %l0 = 0000000000000000
	ldsb	[%i0+0x015],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l5 = 0000000000000100
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000001, Mem[0000000010001400] = 04c6b8b8
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 0001b8b8

p0_label_154:
!	%f0  = 00000000 00000000, Mem[0000000030101410] = fffffff4 00000001
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 00000000
!	%l4 = 00000000, %l5 = ffffff00, Mem[0000000010001400] = 0001b8b8 2ecd1528
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 ffffff00
!	Mem[0000000010101408] = ff00ff01, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff00ff01
!	%l5 = ffffffffffffff00, Mem[0000000030041408] = 000000000000ff00
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffff00
!	%f1  = 00000000, Mem[0000000010101408] = 00000000
	sta	%f1 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000030181408] = ff00ff52
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ff00ff52
!	%f0  = 00000000 00000000, Mem[00000000100c1410] = 000000ba 7e6f7ab5
	stda	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000000
!	%f30 = 00ff0000 00000000, %l0 = 0000000000000000
!	Mem[0000000010081418] = 92000000691e0821
	add	%i2,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081418] = 92000000691e0821
!	%l3 = 0000000000000000, Mem[0000000010181402] = 0000ffff, %asi = 80
	stha	%l3,[%i6+0x002]%asi	! Mem[0000000010181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 01ff00ff, %l0 = 00000000, %l1 = 0000ff00
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000001ff00ff

p0_label_155:
!	Mem[0000000030141400] = ff000092 000000ff, %l4 = ff00ff01, %l5 = ffffff00
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000ff000092
!	Mem[0000000030141410] = ffffffff, %l6 = 0000000000000001
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010141410] = ff000000b644ff0d, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = ff000000b644ff0d
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030141400] = ff000000 920000ff 00000000 ba8cffb3
!	Mem[0000000030141410] = ffffffff ffffffff fff0b933 957c8144
!	Mem[0000000030141420] = 36e82b5a 0e760aa1 110c2ca8 12129dc0
!	Mem[0000000030141430] = c1ab42e6 dfe181b1 26b07ac5 c38e015d
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = ff1f2f41, %f12 = 0542b5e2
	lda	[%i3+%o5]0x81,%f12	! %f12 = ff1f2f41
!	Mem[0000000030101408] = ff8a319382fcc032, %f0  = 00000000 00000000
	ldda	[%i4+%o4]0x89,%f0 	! %f0  = ff8a3193 82fcc032
!	Mem[0000000010101408] = 84aaffff00000000, %f6  = 92000000 691e0821
	ldda	[%i4+%o4]0x88,%f6 	! %f6  = 84aaffff 00000000
!	Mem[0000000010181418] = b6179100, %l1 = 0000000001ff00ff
	ldub	[%i6+0x01b],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101428] = 000000ff, %l7 = fffffffffffffffc
	lduha	[%i4+0x028]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff

p0_label_156:
!	Mem[00000000100c1420] = 010000008c4e8d6d, %l3 = ff000000b644ff0d, %l3 = ff000000b644ff0d
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 010000008c4e8d6d
!	Mem[0000000021800100] = 8bdd9604, %l3 = 010000008c4e8d6d
	ldstuba	[%o3+0x100]%asi,%l3	! %l3 = 0000008b000000ff
!	Mem[0000000010041438] = 866c804d, %l5 = ff000092, %l4 = 000000ff
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000866c804d
!	Mem[0000000030101408] = 32c0fc82, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 0000000032c0fc82
!	%f6  = 84aaffff 00000000, Mem[0000000030081400] = 00000000 84aaf27c
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 84aaffff 00000000
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	ldstub	[%i2+%o5],%l0		! %l0 = 00000000000000ff
!	%l5 = 00000000ff000092, Mem[0000000021800140] = 58a1d198, %asi = 80
	stba	%l5,[%o3+0x140]%asi	! Mem[0000000021800140] = 92a1d198
!	%l2 = 32c0fc82, %l3 = 0000008b, Mem[0000000010141430] = ffffaa84 ffffffff
	std	%l2,[%i5+0x030]		! Mem[0000000010141430] = 32c0fc82 0000008b
!	%f3  = 00000000, Mem[0000000030041400] = d7db3700
	sta	%f3 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff00ff52412f1ff4, %l7 = 0000000000000000
	ldxa	[%i4+0x010]%asi,%l7	! %l7 = ff00ff52412f1ff4

p0_label_157:
!	Mem[0000000010041410] = 00000000 00000000, %l6 = 0000ffff, %l7 = 412f1ff4
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[000000001000141c] = 2ecd2f41, %l1 = 0000000000000000
	ldub	[%i0+0x01c],%l1		! %l1 = 000000000000002e
!	Mem[0000000010041410] = 00000000, %l2 = 0000000032c0fc82
	ldswa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010001400] = 00000000, %f13 = 23145b02
	lda	[%i0+%g0]0x80,%f13	! %f13 = 00000000
!	Mem[0000000030081408] = 01000000f4ffffff, %f8  = 60000000 000000ff
	ldda	[%i2+%o4]0x81,%f8 	! %f8  = 01000000 f4ffffff
!	Mem[0000000020800000] = aaffedbb, %l4 = 00000000866c804d
	ldub	[%o1+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001018142c] = 23145b02, %l1 = 000000000000002e
	ldsha	[%i6+0x02c]%asi,%l1	! %l1 = 0000000000002314
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = f6cc8aff, %l1 = 0000000000002314
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_158:
!	%l3 = 000000000000008b, Mem[00000000100c1408] = ffffc1ab84aaffff
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000008b
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001004141c] = c1abffe6, %l0 = 0000000000000000
	swap	[%i1+0x01c],%l0		! %l0 = 00000000c1abffe6
!	Mem[0000000030101400] = f6cc8aff, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000f6cc8aff
!	%f9  = f4ffffff, Mem[00000000100c1400] = 00000000
	sta	%f9 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = f4ffffff
!	Mem[0000000010101408] = 00000000, %l3 = 000000000000008b
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, imm = 000000000000048a, %l5 = 00000000ff000092
	add	%l2,0x48a,%l5		! %l5 = 000000000000048a
!	Mem[0000000021800000] = 14e5ddab, %l2 = 0000000000000000
	ldstub	[%o3+%g0],%l2		! %l2 = 00000014000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff, %l4 = 00000000f6cc8aff
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff

p0_label_159:
!	Mem[0000000030141408] = 00000000, %l4 = ffffffffffffffff
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 2ecd1528, %l4 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 000000002ecd1528
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = d6f6ffff, %f5  = 01ff00ff
	lda	[%i0+%o4]0x80,%f5 	! %f5 = d6f6ffff
	membar	#Sync			! Added by membar checker (32)
!	%l7 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[0000000030001410] = ff000000, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ff00000000000000, %f0  = ff8a3193 82fcc032
	ldda	[%i4+%g0]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[0000000030181400] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 ba8cffb3, %l1 = 0000000000000000
!	Mem[0000000010001410] = ff00000000000060
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l1]ASI_PST16_P ! Mem[0000000010001410] = ff00000000000060

p0_label_160:
!	%l4 = 000000002ecd1528, Mem[0000000030041408] = ffffffff
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 2ecd1528
!	%l5 = 000000000000048a, Mem[0000000020800000] = aaffedbb, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 048aedbb
!	Mem[0000000010141412] = ff000000, %l5 = 000000000000048a
	ldstub	[%i5+0x012],%l5		! %l5 = 00000000000000ff
!	%l6 = 00000000ffffffff, Mem[00000000100c1408] = 00000000, %asi = 80
	stwa	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffff
!	%f16 = ff000000, %f0  = ff000000 00000000
	fstod	%f16,%f0 		! %f0  = c7e00000 00000000
!	%f22 = fff0b933, Mem[00000000100c1410] = 00000000
	sta	%f22,[%i3+%o5]0x88	! Mem[00000000100c1410] = fff0b933
!	%l0 = 00000000c1abffe6, Mem[0000000030101410] = 0000000000000000
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000c1abffe6
!	%l7 = 00000000000000ff, Mem[0000000010081408] = 5cbdbb80
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ffbdbb80
!	%l4 = 000000002ecd1528, Mem[0000000010181400] = 00000000
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000028
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff75c1, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000

p0_label_161:
!	Mem[0000000010041400] = ffffffff, %l1 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030181410] = 0000000001ff00ff, %l2 = 0000000000000014
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = 0000000001ff00ff
!	Mem[0000000010101400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = d6f6ffff ff318abb, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000d6f6ffff 00000000ff318abb
!	Mem[0000000030101400] = ff00000024c200ff, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = ff00000024c200ff
!	Mem[0000000010101410] = ff00ff52, %l0 = 00000000c1abffe6
	ldub	[%i4+0x011],%l0		! %l0 = 0000000000000000
!	Mem[000000001010141c] = d1efd355, %l7 = 00000000ff318abb
	lduha	[%i4+0x01e]%asi,%l7	! %l7 = 000000000000d355
!	Mem[0000000010001408] = d6f6ffff, %l4 = 000000002ecd1528
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffffd6f6ffff
!	Mem[0000000030001408] = 36b0e381, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 0000000036b0e381
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000d355, imm = 0000000000000dfa, %l5 = ff00000024c200ff
	and	%l7,0xdfa,%l5		! %l5 = 0000000000000150

p0_label_162:
!	%l0 = 36b0e381, %l1 = 0000ffff, Mem[0000000010081408] = ffbdbb80 5e37dbd7
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 36b0e381 0000ffff
!	%l6 = 00000000d6f6ffff, Mem[0000000030041400] = 00000000
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000
!	%l2 = 0000000001ff00ff, Mem[0000000010141408] = ff000000
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	%l1 = 000000000000ffff, Mem[0000000010081408] = 81e3b036
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 81e3b0ff
!	%l0 = 0000000036b0e381, Mem[0000000010081408] = ffb0e381
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 81b0e381
!	Mem[0000000010081410] = ff000000, %l4 = ffffffffd6f6ffff
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f26 = 110c2ca8, Mem[0000000010081408] = 81e3b081
	sta	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = 110c2ca8
!	%f20 = ffffffff, %f24 = 36e82b5a, %f27 = 12129dc0
	fmuls	%f20,%f24,%f27		! %f27 = ffffffff
!	%f8  = 01000000 f4ffffff, Mem[0000000010081400] = 00000000 000000ff
	stda	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 01000000 f4ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000ffffaa84, %l1 = 000000000000ffff
	ldxa	[%i4+%o4]0x80,%l1	! %l1 = ff000000ffffaa84

p0_label_163:
!	Mem[00000000100c1418] = fffffffffffffcb7, %f4  = ff800000 d6f6ffff
	ldd	[%i3+0x018],%f4 	! %f4  = ffffffff fffffcb7
!	Mem[00000000300c1410] = 412f1fff, %l4 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000001fff
!	Mem[0000000020800000] = 048aedbb, %l2 = 0000000001ff00ff
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000004
!	Mem[00000000100c1400] = f4ffffff, %f9  = f4ffffff
	lda	[%i3+%g0]0x80,%f9 	! %f9 = f4ffffff
!	Mem[00000000300c1408] = ff000000, %l5 = 0000000000000150
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = fffff6d6, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000d6
!	Mem[0000000030001410] = 000000ff, %l1 = ff000000ffffaa84
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, %l6 = 00000000d6f6ffff, %y  = 04c6b8b8
	sdiv	%l5,%l6,%l5		! %l5 = ffffffffe233fc98
	mov	%l0,%y			! %y = 36b0e381
!	Mem[000000001010140c] = ffffaa84, %l4 = 0000000000001fff
	lduha	[%i4+0x00c]%asi,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000004, Mem[00000000300c1400] = 00000000ff000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000004

p0_label_164:
!	%l5 = ffffffffe233fc98, Mem[0000000010141412] = ff00ff00
	sth	%l5,[%i5+0x012]		! Mem[0000000010141410] = ff00fc98
!	Mem[0000000030181410] = 00000000, %l7 = 000000000000d355
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l0 = 0000000036b0e381, Mem[00000000300c1400] = 0400000000000000
	stxa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000036b0e381
!	Mem[000000001008140d] = 0000ffff, %l1 = 0000000000000000
	ldstub	[%i2+0x00d],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010041400] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l0 = 0000000036b0e381, Mem[0000000030001410] = ff000000
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000081
!	Mem[00000000300c1410] = ff1f2f41, %l6 = 00000000d6f6ffff
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff1f2f41
!	%f0  = c7e00000 00000000, Mem[0000000010001408] = fffff6d6 bb8a31ff
	stda	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = c7e00000 00000000
!	%l4 = 000000000000ffff, Mem[0000000030101400] = 000000ff
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff00ff01000000ff, %l4 = 000000000000ffff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = ff00ff01000000ff

p0_label_165:
!	Mem[0000000010101408] = ff000000, %f10 = ffffaa84
	ld	[%i4+%o4],%f10	! %f10 = ff000000
!	Mem[0000000030001400] = 00000000 ffffffff, %l4 = 000000ff, %l5 = e233fc98
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010041438] = 866c804d, %l4 = 00000000ffffffff
	lduwa	[%i1+0x038]%asi,%l4	! %l4 = 00000000866c804d
!	Mem[0000000030001408] = 36b0e381, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000036
!	Mem[0000000030141410] = ffffffffffffffff, %l3 = 00000000000000d6
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = 36b0e381, %l4 = 00000000866c804d
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000036
!	Mem[0000000010001410] = ff000000 00000060, %l4 = 00000036, %l5 = 00000000
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000000060
!	Mem[00000000100c1408] = 8b000000ffffffff, %f16 = ff000000 920000ff
	ldda	[%i3+%o4]0x88,%f16	! %f16 = 8b000000 ffffffff
!	Mem[0000000010081408] = 110c2ca8, %l5 = 0000000000000060
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000110c2ca8
!	Starting 10 instruction Store Burst
!	%l5 = 00000000110c2ca8, %l1 = 00000000000000ff, %l5 = 00000000110c2ca8
	udivx	%l5,%l1,%l5		! %l5 = 0000000000111d49

p0_label_166:
!	%l6 = 00000000ff1f2f41, Mem[0000000021800041] = 27ffd2c8
	stb	%l6,[%o3+0x041]		! Mem[0000000021800040] = 2741d2c8
!	%f19 = ba8cffb3, Mem[0000000010181408] = 00000000
	sta	%f19,[%i6+%o4]0x88	! Mem[0000000010181408] = ba8cffb3
!	%f2  = ff00ff52, Mem[0000000010101400] = 00000000
	sta	%f2 ,[%i4+%g0]0x80	! Mem[0000000010101400] = ff00ff52
!	%l4 = 00000000ff000000, Mem[0000000010001410] = ff00000000000060
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff000000
!	%f3  = 00000000, Mem[0000000010181410] = 885eb8ff
	sta	%f3 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000010101434] = e67dabc1
	stw	%l1,[%i4+0x034]		! Mem[0000000010101434] = 000000ff
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000036
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000030141410] = ffffffff
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	%l6 = ff1f2f41, %l7 = 00000000, Mem[0000000030181410] = ff000000 01ff00ff
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ff1f2f41 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = fdffecd0, %l6 = 00000000ff1f2f41
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000fdff

p0_label_167:
!	Mem[0000000030081410] = ff000000, %f8  = 01000000
	lda	[%i2+%o5]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000030141408] = 000000ff, %l3 = ffffffffffffffff
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000004
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 00000000 00008143, %l4 = ff000000, %l5 = 00111d49
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000008143
!	Mem[0000000030081400] = ffffaa84, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000084
!	Mem[0000000030081400] = 00000000ffffaa84, %f18 = 00000000 ba8cffb3
	ldda	[%i2+%g0]0x89,%f18	! %f18 = 00000000 ffffaa84
!	Mem[0000000010001400] = 36000000, %l6 = 000000000000fdff
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 0000000036000000
!	Mem[0000000010101400] = ff00000052ff00ff, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = ff00000052ff00ff
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = ffffffff fffffcb7, Mem[0000000010181418] = b6179100 17937f0f
	std	%f4 ,[%i6+0x018]	! Mem[0000000010181418] = ffffffff fffffcb7

p0_label_168:
!	%l1 = 00000000000000ff, Mem[00000000100c1410] = 33b9f0ff
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l6 = 0000000036000000, Mem[0000000010081420] = 32c0fc82, %asi = 80
	stwa	%l6,[%i2+0x020]%asi	! Mem[0000000010081420] = 36000000
!	%l6 = 0000000036000000, Mem[0000000010001400] = 36000000
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 36000000
!	Mem[00000000300c1400] = 81e3b036, %l2 = 0000000000000084
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000081000000ff
!	%l6 = 0000000036000000, Mem[00000000300c1410] = d6f6ffff
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00f6ffff
!	%f26 = 110c2ca8 ffffffff, Mem[0000000030141408] = ff000000 ba8cffb3
	stda	%f26,[%i5+%o4]0x81	! Mem[0000000030141408] = 110c2ca8 ffffffff
!	%l7 = ff00000052ff00ff, Mem[0000000010041410] = 00000000
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 52ff00ff
!	Mem[00000000201c0001] = 00ff75c1, %l0 = 0000000036b0e381
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141400] = ff000000, %l0 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 01000000 f4ffffff, %l2 = 00000081, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000001000000 00000000f4ffffff

p0_label_169:
!	Mem[0000000030081400] = 84aaffff, %l1 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000084
!	Mem[0000000010081400] = 01000000, %l3 = 00000000f4ffffff
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000100
!	Mem[00000000201c0000] = 00ff75c1, %l7 = ff00000052ff00ff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = ff000000 ff000000, %l0 = ff000000, %l1 = 00000084
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000ff000000 00000000ff000000
!	Mem[0000000010081410] = ff000000 00000000, %l0 = ff000000, %l1 = ff000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000300c1410] = 00f6ffff1fe9a97d, %f8  = ff000000 f4ffffff
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = 00f6ffff 1fe9a97d
!	Mem[0000000030141410] = ff000000, %l2 = 0000000001000000
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1400] = ffe3b03600000000, %f8  = 00f6ffff 1fe9a97d
	ldda	[%i3+%g0]0x81,%f8 	! %f8  = ffe3b036 00000000
!	Mem[0000000030101408] = 000000ff93318aff, %f10 = ff000000 ffffffff
	ldda	[%i4+%o4]0x81,%f10	! %f10 = 000000ff 93318aff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 0000ffff, %l6 = 0000000036000000
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 000000000000ffff

p0_label_170:
!	%l1 = 0000000000000000, Mem[0000000030001400] = ffffffff00000000
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000010041408] = 2815cd2e, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000002815cd2e
!	%f2  = ff00ff52 00000000, Mem[0000000030081408] = 00000001 fffffff4
	stda	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00ff52 00000000
!	%l0 = 00000000ff000000, Mem[00000000201c0000] = 00ff75c1
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 000075c1
!	Mem[0000000030041400] = 00000036, %l1 = 000000002815cd2e
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[000000001008140b] = a82c0c11, %l2 = 000000000000ff00
	ldstuba	[%i2+0x00b]%asi,%l2	! %l2 = 00000011000000ff
!	Mem[0000000020800040] = fdffecd0, %l0 = 00000000ff000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 000000fd000000ff
!	Mem[0000000010101404] = 000000ff, %l0 = 00000000000000fd, %asi = 80
	swapa	[%i4+0x004]%asi,%l0	! %l0 = 00000000000000ff
!	%f3  = 00000000, Mem[0000000010001408] = 00000000
	sta	%f3 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000920000ff, %f8  = ffe3b036 00000000
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = ff000000 920000ff

p0_label_171:
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001430] = ba8cffb356f8fdfa, %f6  = 84aaffff 00000000
	ldda	[%i0+0x030]%asi,%f6 	! %f6  = ba8cffb3 56f8fdfa
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030141400] = ff000000 920000ff 110c2ca8 ffffffff
!	Mem[0000000030141410] = ff000000 ffffffff fff0b933 957c8144
!	Mem[0000000030141420] = 36e82b5a 0e760aa1 110c2ca8 12129dc0
!	Mem[0000000030141430] = c1ab42e6 dfe181b1 26b07ac5 c38e015d
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[0000000010141408] = 0000ff00, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101410] = 52ff00ff, %l3 = 0000000000000100
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = ffe3b036, %l6 = 000000000000ffff
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 000000000000ffe3
!	Mem[0000000010141408] = 0000ff00, %f4  = ffffffff
	lda	[%i5+%o4]0x88,%f4 	! %f4 = 0000ff00
!	Mem[0000000030041410] = 000000ff, %l7 = ffffffffffffffff
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 412f1fff
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff

p0_label_172:
!	%l2 = 00000011, %l3 = 000000ff, Mem[0000000030041410] = 000000ff ff000000
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000011 000000ff
!	Mem[0000000010081408] = ff0c2ca8, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ff0c2ca8
!	%f5  = fffffcb7, Mem[0000000030001410] = 810000ff
	sta	%f5 ,[%i0+%o5]0x81	! Mem[0000000030001410] = fffffcb7
!	%f2  = ff00ff52, Mem[0000000010181410] = 00000000
	sta	%f2 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff00ff52
!	Mem[00000000100c1410] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000008143, Mem[0000000010141404] = 00000000, %asi = 80
	stwa	%l5,[%i5+0x004]%asi	! Mem[0000000010141404] = 00008143
!	%l0 = ffffffffffffff00, Mem[00000000300c1410] = 7da9e91ffffff600
	stxa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffffff00
!	Mem[0000000010081410] = ff000000, %l2 = 0000000000000011
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = 00000000ff0000ff
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 84aaffff, %l0 = ffffffffffffff00
	ldsba	[%i2+%g0]0x81,%l0	! %l0 = ffffffffffffff84

p0_label_173:
!	Mem[0000000030101400] = ff000000 24c200ff 000000ff 93318aff
!	Mem[0000000030101410] = 00000000 c1abffe6 ff800000 24a19da9
!	Mem[0000000030101420] = 7cf2aa84 00000072 fffff5f4 0710d380
!	Mem[0000000030101430] = 909c4eed ffcc3530 b181e1df 00000000
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000100c1410] = ff000000, %l1 = 00000000ff0c2ca8
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030041410] = 00000011, %l6 = 000000000000ffe3
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000011
!	Mem[0000000030001400] = 00000000 00000000, %l6 = 00000011, %l7 = 00000000
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = ffffaa84, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000084
!	Mem[000000001000140c] = 0000e0c7, %l6 = 0000000000000084
	lduwa	[%i0+0x00c]%asi,%l6	! %l6 = 000000000000e0c7
!	Mem[0000000030181400] = 00000000, %l1 = ffffffffffffff00
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %f10 = 000000ff
	lda	[%i6+%o5]0x89,%f10	! %f10 = 000000ff
!	Mem[0000000030041400] = ff000036, %l0 = ffffffffffffff84
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffff000036
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffffffff, %l0 = ffffffffff000036
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 00000000ffffffff

p0_label_174:
!	%l4 = 0000000000000000, Mem[00000000201c0000] = 000075c1
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 000075c1
!	Mem[0000000030101408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 000000000000e0c7
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	%l6 = 0000e0c7, %l7 = 00000000, Mem[0000000010181408] = b3ff8cba 00000000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000e0c7 00000000
!	Mem[0000000030001408] = 36b0e381, %l2 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000036b0e381
!	Mem[0000000021800180] = f9aaf473, %l3 = 00000000000000ff
	ldstub	[%o3+0x180],%l3		! %l3 = 000000f9000000ff
!	Mem[0000000010081410] = 000000ff, %l6 = 000000000000e0c7
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (34)
!	%l3 = 00000000000000f9, Mem[0000000030141400] = ff000000920000ff
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000f9
!	%f10 = 000000ff 93318aff, Mem[0000000010041420] = 67be1bdd bf74240a
	std	%f10,[%i1+0x020]	! Mem[0000000010041420] = 000000ff 93318aff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 0000e0c7, %f7  = 56f8fdfa
	ld	[%i6+%o4],%f7 	! %f7 = 0000e0c7

p0_label_175:
!	Mem[00000000300c1400] = ffe3b036, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000ffe3
!	Mem[0000000010081420] = 36000000 93318aff, %l4 = 0000ffe3, %l5 = 00008143
	ldda	[%i2+0x020]%asi,%l4	! %l4 = 0000000036000000 0000000093318aff
!	Mem[0000000030101410] = 00000000, %l4 = 0000000036000000
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = f4ffffff 00000000 360000ff 0000008b
!	Mem[00000000100c1410] = ff000000 00000000 ffffffff fffffcb7
!	Mem[00000000100c1420] = 01000000 8c4e8d6d 00ff0000 00000000
!	Mem[00000000100c1430] = c1ab7de6 2ecd1528 1f6fff52 34e68dab
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030001410] = b7fcffff, %l6 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 00000000000000ff, %f2  = ff00ff52 00000000
	ldda	[%i2+%o5]0x88,%f2 	! %f2  = 00000000 000000ff
!	Mem[0000000010181410] = 52ff00ff00008143, %l2 = 0000000036b0e381
	ldx	[%i6+%o5],%l2		! %l2 = 52ff00ff00008143
!	Mem[0000000010081410] = ff000000 00000000, %l2 = 00008143, %l3 = 000000f9
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (35)
!	%l0 = ffffffff, %l1 = 000000ff, Mem[00000000100c1410] = 000000ff 00000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff 000000ff

p0_label_176:
!	%f21 = 000000ff, Mem[0000000030141400] = 00000000
	sta	%f21,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%f14 = 00000000 ff0000ff, Mem[00000000100c1408] = 360000ff 0000008b
	stda	%f14,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 ff0000ff
!	Mem[0000000020800041] = ffffecd0, %l0 = 00000000ffffffff
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 000000ff000000ff
!	%l1 = 00000000000000ff, %l6 = ffffffffffffffff, %l0 = 00000000000000ff
	xnor	%l1,%l6,%l0		! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, %l3 = 0000000000000000, %l7 = 0000000000000000
	udivx	%l4,%l3,%l7		! Div by zero, %l0 = 000000000000014f
!	%l6 = ffffffffffffffff, Mem[0000000030101400] = ff00000024c200ff
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffffffffffff
!	%l1 = 00000000000000ff, Mem[0000000010141410] = 98fc00ff
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f2  = 00000000 000000ff, %l2 = 00000000ff000000
!	Mem[0000000030101430] = 909c4eedffcc3530
	add	%i4,0x030,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_S ! Mem[0000000030101430] = 909c4eedffcc3530
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000 52ff00ff, %l4 = 00000000, %l5 = 93318aff
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000052ff00ff 0000000000000000

p0_label_177:
!	Mem[000000001010143c] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i4+0x03f]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff0000ff, %l2 = 00000000ff000000
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 00ff000000000000, %f6  = ba8cffb3 0000e0c7
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = 00ff0000 00000000
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00ffffff 36000000, %l4 = 52ff00ff, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000036000000 0000000000ffffff
!	Mem[0000000030181410] = 00000000 000000ff, %l0 = 00000127, %l1 = 000000ff
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[00000000201c0000] = 000075c1, %l7 = 0000000000000000
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101400] = ffffffff ffffffff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000021800000] = ffe5ddab, %l0 = 00000000ffffffff
	lduh	[%o3+%g0],%l0		! %l0 = 000000000000ffe5
!	Starting 10 instruction Store Burst
!	%f18 = 8b000000, Mem[0000000030101408] = ff0000ff
	sta	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = 8b000000

p0_label_178:
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010101400] = ff00ff52 000000fd
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 00000036
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%f16 = 00000000 fffffff4 8b000000 ff000036
!	%f20 = 00000000 000000ff b7fcffff ffffffff
!	%f24 = 6d8d4e8c 00000001 00000000 0000ff00
!	%f28 = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%f2  = 00000000, Mem[000000001014141c] = fdffa1b1
	sta	%f2 ,[%i5+0x01c]%asi	! Mem[000000001014141c] = 00000000
!	%l0 = 000000000000ffe5, Mem[00000000300c1410] = ff00000000000000
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000000000ffe5
!	%f13 = 00000000, Mem[0000000010001410] = 00000000
	st	%f13,[%i0+%o5]		! Mem[0000000010001410] = 00000000
!	Mem[0000000030001410] = fffffcb7, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000fffffcb7
!	%l1 = 00000000ffffffff, Mem[0000000030141410] = 000000ff
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	%l6 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (36)
!	Mem[00000000100c1430] = c1ab7de6, %l7 = 00000000fffffcb7
	lduw	[%i3+0x030],%l7		! %l7 = 00000000c1ab7de6

p0_label_179:
!	Mem[00000000100c1410] = ffffffff, %l2 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = ffffffff, %l4 = 0000000036000000
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l0 = 000000000000ffe5
	ldsba	[%i0+0x00b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000000 00ffffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000ffffff
!	Mem[0000000010101408] = ff000000, %l1 = 00000000ffffffff
	lduh	[%i4+%o4],%l1		! %l1 = 000000000000ff00
!	%l7 = 00000000c1ab7de6, imm = fffffffffffffb9d, %l5 = 0000000000ffffff
	xnor	%l7,-0x463,%l5		! %l5 = 00000000c1ab7984
!	Mem[0000000030141400] = f9000000 000000ff, %l6 = 00000000, %l7 = c1ab7de6
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000f9000000
!	Mem[00000000100c1400] = f4ffffff 00000000 00000000 ff0000ff
!	Mem[00000000100c1410] = ffffffff ff000000 ffffffff fffffcb7
!	Mem[00000000100c1420] = 01000000 8c4e8d6d 00ff0000 00000000
!	Mem[00000000100c1430] = c1ab7de6 2ecd1528 1f6fff52 34e68dab
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030181408] = ff00ff5200000000, %f12 = ff1f2f41 00000000
	ldda	[%i6+%o4]0x81,%f12	! %f12 = ff00ff52 00000000
!	Starting 10 instruction Store Burst
!	%f4  = 0000ff00 fffffcb7, Mem[0000000030081400] = 84aaffff 00000000
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000ff00 fffffcb7

p0_label_180:
	membar	#Sync			! Added by membar checker (37)
!	%f3  = 000000ff, Mem[00000000100c1404] = 00000000
	st	%f3 ,[%i3+0x004]	! Mem[00000000100c1404] = 000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1420] = 01000000
	sth	%l6,[%i3+0x020]		! Mem[00000000100c1420] = 00ff0000
!	Mem[0000000010181408] = 0000e0c7, %l5 = 00000000c1ab7984
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f2  = 00000000 000000ff, Mem[0000000010181400] = 28000000 ffffffff
	stda	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 000000ff
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000ff00
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 8b000000ff000036
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 0000008b93318aff
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_181:
!	Mem[0000000010101410] = ff00ff52412f1ff4, %f6  = 00ff0000 00000000
	ldda	[%i4+%o5]0x80,%f6 	! %f6  = ff00ff52 412f1ff4
!	Mem[00000000201c0000] = 000075c1, %l5 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141408] = 0000ff00, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1400] = f4ffffff, %l2 = ffffffffff000000
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = fffffffff4ffffff
!	%f14 = 00000000, %f19 = 00000000, %f10 = 000000ff 93318aff
	fsmuld	%f14,%f19,%f10		! %f10 = 00000000 00000000
!	Mem[0000000030141408] = a82c0c11, %l2 = fffffffff4ffffff
	ldsha	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000c11
!	Mem[0000000010041410] = ff00ff52, %l1 = 000000000000ff00
	lduwa	[%i1+0x010]%asi,%l1	! %l1 = 00000000ff00ff52
!	Mem[00000000100c1410] = ffffffffff000000, %l6 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 000000ff, Mem[0000000010001410] = 00000000 000000ff
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 000000ff

p0_label_182:
!	%l6 = ff000000, %l7 = f9000000, Mem[0000000030181410] = ff000000 00000000
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000 f9000000
!	%l6 = ffffffffff000000, imm = 0000000000000967, %l4 = ffffffffffffffff
	xor	%l6,0x967,%l4		! %l4 = ffffffffff000967
!	Mem[0000000010141410] = ff000000, %l3 = 0000000000ffffff
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[00000000201c0001] = 000075c1, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = 000075c1
!	%l4 = ffffffffff000967, Mem[00000000201c0000] = 000075c1, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 096775c1
!	%l0 = 0000000000000000, Mem[0000000010001428] = 884bc224, %asi = 80
	stwa	%l0,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l4 = ffffffffff000967, Mem[0000000030141410] = ffffffff
	stba	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffff67
!	Mem[00000000100c1400] = f4ffffff, %l3 = ff000000, %l7 = f9000000
	casa	[%i3]0x80,%l3,%l7	! %l7 = 00000000f4ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 60000000ff000000, %l2 = 0000000000000c11
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 60000000ff000000

p0_label_183:
!	Mem[0000000030101410] = 00000000, %l3 = 00000000ff000000
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x0037160869cc5e19,%g7,%l0 ! %l0 = 0037160869cc5e19
!	%l1 = 00000000ff00ff52
	setx	0x2e6973a020274392,%g7,%l1 ! %l1 = 2e6973a020274392
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0037160869cc5e19
	setx	0x6184275fba082ee3,%g7,%l0 ! %l0 = 6184275fba082ee3
!	%l1 = 2e6973a020274392
	setx	0xd5caa0c017501609,%g7,%l1 ! %l1 = d5caa0c017501609
!	%l1 = d5caa0c017501609, Mem[00000000218000c0] = 0000968e
	sth	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = 1609968e
!	Mem[00000000211c0000] = ffff877b, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[00000000100c1410] = ffffffff, %l2 = 60000000ff000000
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l0 = 6184275fba082ee3
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000000000ff, %f4  = 0000ff00 fffffcb7
	ldda	[%i6+%g0]0x89,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000010001410] = 000000ff, %l3 = 000000000000ffff
	ldsba	[%i0+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = fffffff4, %l7 = 00000000f4ffffff
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 00000000fffffff4

p0_label_184:
!	%l7 = 00000000fffffff4, %l5 = 00000000000000ff, %l6  = ffffffffff000000
	mulx	%l7,%l5,%l6		! %l6 = 000000fefffff40c
!	Mem[0000000030101400] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010001408] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%f16 = 00000000 fffffff4 ff0000ff 00000000
!	%f20 = 000000ff ffffffff b7fcffff ffffffff
!	%f24 = 6d8d4e8c 00000001 00000000 0000ff00
!	%f28 = 2815cd2e e67dabc1 ab8de634 52ff6f1f
	stda	%f16,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	Mem[0000000030141408] = 110c2ca8, %l5 = 00000000ffffffff
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000110c2ca8
!	Mem[0000000030001408] = 000000ff, %l6 = 000000fefffff40c
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f6  = ff00ff52 412f1ff4, %l7 = 00000000fffffff4
!	Mem[0000000030041400] = ff00003674e82757
	stda	%f6,[%i1+%l7]ASI_PST8_S ! Mem[0000000030041400] = ff00ff52742f2757
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = ffff877b
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff877b
!	Mem[000000001014142b] = 00000081, %l6 = 0000000000000000
	ldstub	[%i5+0x02b],%l6		! %l6 = 00000081000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff00ff52, %l5 = 00000000110c2ca8
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000ff00ff52

p0_label_185:
!	Mem[0000000010181410] = 52ff00ff, %l2 = 00000000000000ff
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 00000000000052ff
!	Mem[0000000010081400] = 01000000 f4ffffff, %l6 = 00000081, %l7 = fffffff4
	ldd	[%i2+%g0],%l6		! %l6 = 0000000001000000 00000000f4ffffff
!	%l0 = 0000000000000000, %l7 = 00000000f4ffffff, %l5 = 00000000ff00ff52
	and	%l0,%l7,%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00ffffff b644ff0d, %l2 = 000052ff, %l3 = ffffffff
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000ffffff 00000000b644ff0d
!	Mem[0000000010041410] = ff00ff52, %l6 = 0000000001000000
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff00ff52
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffff000967
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000b644ff0d
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff00ff5200000000, %l1 = d5caa0c017501609
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = ff00ff5200000000
!	Mem[0000000010141408] = 600000000000ff00, %f4  = 00000000 000000ff
	ldda	[%i5+%o4]0x88,%f4 	! %f4  = 60000000 0000ff00
!	Starting 10 instruction Store Burst
!	%l7 = 00000000f4ffffff, Mem[0000000010081408] = ffffff0000000000
	stxa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000f4ffffff

p0_label_186:
!	%l2 = 00ffffff, %l3 = 00000000, Mem[0000000030081408] = 00000000 ff00ff52
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ffffff 00000000
!	%l1 = ff00ff5200000000, %l4 = 0000000000000000, %l1 = ff00ff5200000000
	addc	%l1,%l4,%l1		! %l1 = ff00ff5200000000
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141410] = 0dff44b6ffffff00
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%f14 = 00000000 ff0000ff, Mem[0000000010001408] = 000000ff ff000000
	stda	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 ff0000ff
!	%l1 = ff00ff5200000000, Mem[00000000300c1408] = 00000000
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0xcfabcc27fac57061,%g7,%l0 ! %l0 = cfabcc27fac57061
!	%l1 = ff00ff5200000000
	setx	0x0df96c580fc84ac9,%g7,%l1 ! %l1 = 0df96c580fc84ac9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = cfabcc27fac57061
	setx	0x59493aa046351d9d,%g7,%l0 ! %l0 = 59493aa046351d9d
!	%l1 = 0df96c580fc84ac9
	setx	0x040ba2b7acfcc543,%g7,%l1 ! %l1 = 040ba2b7acfcc543
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 59493aa046351d9d
	setx	0x2186fc37b03272f4,%g7,%l0 ! %l0 = 2186fc37b03272f4
!	%l1 = 040ba2b7acfcc543
	setx	0x9d36586fecd74221,%g7,%l1 ! %l1 = 9d36586fecd74221
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2186fc37b03272f4
	setx	0x547055706909519a,%g7,%l0 ! %l0 = 547055706909519a
!	%l1 = 9d36586fecd74221
	setx	0xd929506f84f3e79b,%g7,%l1 ! %l1 = d929506f84f3e79b
!	%l7 = 00000000f4ffffff, Mem[0000000020800040] = ffffecd0, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffecd0
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff00ff52, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = ffffffffff00ff52

p0_label_187:
!	Mem[00000000300c1408] = 00000000, %f6  = ff00ff52
	lda	[%i3+%o4]0x81,%f6 	! %f6 = 00000000
!	Mem[0000000020800000] = 048aedbb, %l7 = 00000000f4ffffff
	ldsb	[%o1+%g0],%l7		! %l7 = 0000000000000004
!	Mem[0000000010081430] = 0542b5e2, %l2 = 0000000000ffffff
	ldsw	[%i2+0x030],%l2		! %l2 = 000000000542b5e2
!	Mem[000000001014142c] = 67e5f11e, %l3 = 0000000000000000
	lduh	[%i5+0x02e],%l3		! %l3 = 000000000000f11e
!	Mem[0000000030001410] = 00000000, %l1 = d929506f84f3e79b
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = f4ffffff, %l4 = ffffffffff00ff52
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = fffffffffffffff4
!	Mem[0000000010001400] = 00ffffffff000000, %f30 = ab8de634 52ff6f1f
	ldda	[%i0+%g0]0x88,%f30	! %f30 = 00ffffff ff000000
!	Mem[000000001008141c] = 691e0821, %l2 = 000000000542b5e2
	lduwa	[%i2+0x01c]%asi,%l2	! %l2 = 00000000691e0821
!	Mem[00000000300c1410] = 00000000, %f27 = 0000ff00
	lda	[%i3+%o5]0x81,%f27	! %f27 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_188:
!	%f24 = 6d8d4e8c 00000001, Mem[00000000300c1400] = f4ffffff 00000000
	stda	%f24,[%i3+%g0]0x89	! Mem[00000000300c1400] = 6d8d4e8c 00000001
	membar	#Sync			! Added by membar checker (38)
!	%f10 = 00000000 00000000, Mem[0000000010101430] = 2815cd2e e67dabc1
	std	%f10,[%i4+0x030]	! Mem[0000000010101430] = 00000000 00000000
!	Mem[0000000010181410] = 52ff00ff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 0000000052ff00ff
!	%l5 = 0000000052ff00ff, Mem[0000000010081418] = 92000000, %asi = 80
	stwa	%l5,[%i2+0x018]%asi	! Mem[0000000010081418] = 52ff00ff
!	Mem[0000000010001408] = ff0000ff, %l5 = 0000000052ff00ff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff0000ff
!	%l3 = 000000000000f11e, Mem[0000000030141400] = 000000ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000001e
!	%f31 = ff000000, Mem[0000000010001408] = 52ff00ff
	st	%f31,[%i0+%o4]		! Mem[0000000010001408] = ff000000
!	%f0  = c7e00000 00000000, Mem[0000000010001408] = ff000000 00000000
	stda	%f0 ,[%i0+%o4]0x80	! Mem[0000000010001408] = c7e00000 00000000
!	%l2 = 00000000691e0821, Mem[0000000010181410] = 00000000
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000821
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = c7e00000, %l6 = 00000000ff00ff52
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000c7e00000

p0_label_189:
!	Mem[0000000010041408] = 00000000, %l6 = 00000000c7e00000
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 00000000 c7e000ff, %l0 = 6909519a, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000c7e000ff 0000000000000000
!	Mem[0000000030101410] = ff000000, %f25 = 00000001
	lda	[%i4+%o5]0x81,%f25	! %f25 = ff000000
!	Mem[00000000100c1400] = ff000000fffffff4, %l4 = fffffffffffffff4
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = ff000000fffffff4
!	Mem[0000000030041400] = 52ff00ff, %l5 = 00000000ff0000ff
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 2ecd1528, %l7 = 0000000000000004
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = 000000002ecd1528
!	Mem[0000000010101404] = fffffff4, %l4 = ff000000fffffff4
	ldub	[%i4+0x007],%l4		! %l4 = 00000000000000f4
!	Mem[0000000030081410] = ff00000000000000, %l0 = 00000000c7e000ff
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = ff00000000000000
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000211c0000] = ffff877b
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 0000877b

p0_label_190:
!	%l0 = ff00000000000000, Mem[0000000030101410] = ff000000
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l3 = 000000000000f11e, Mem[0000000010041400] = ffffffffffffffff
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000f11e
!	Mem[0000000030141408] = ffffffff, %l1 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	%l1 = 00000000ffffffff, Mem[000000001008143a] = 00000000
	sth	%l1,[%i2+0x03a]		! Mem[0000000010081438] = 0000ffff
!	Mem[00000000201c0001] = 096775c1, %l2 = 00000000691e0821
	ldstub	[%o0+0x001],%l2		! %l2 = 00000067000000ff
!	%l2 = 0000000000000067, Mem[0000000010181400] = 00000000
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00670000
!	%l7 = 000000002ecd1528, Mem[0000000020800040] = ffffecd0, %asi = 80
	stba	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 28ffecd0
!	%f15 = ff0000ff, Mem[0000000010101408] = ff0000ff
	sta	%f15,[%i4+%o4]0x80	! Mem[0000000010101408] = ff0000ff
!	Mem[000000001008142e] = 00000060, %l7 = 000000002ecd1528
	ldstub	[%i2+0x02e],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l1 = 00000000ffffffff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_191:
!	Mem[0000000010081420] = 36000000, %l7 = 0000000000000000
	ldsb	[%i2+0x022],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l2 = 0000000000000067
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l3 = 000000000000f11e
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 1ef10000, %l3 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 000000001ef10000
!	Mem[00000000201c0000] = 09ff75c1, %l7 = 0000000000000000
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000009ff
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010101400] = 00000000 fffffff4 ff0000ff 00000000
!	Mem[0000000010101410] = 000000ff ffffffff b7fcffff ffffffff
!	Mem[0000000010101420] = 6d8d4e8c 00000001 00000000 0000ff00
!	Mem[0000000010101430] = 00000000 00000000 ab8de634 52ff6f1f
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[00000000300c1400] = 01000000, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000100
!	Mem[0000000030101408] = 0000000000000000, %l2 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = e3ff0000, %l0 = ff00000000000000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000e3ff0000

p0_label_192:
!	Mem[0000000010001420] = 00000000, %l6 = 0000000000000000
	swap	[%i0+0x020],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041400] = 1ef10000, %l0 = 00000000e3ff0000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000001e000000ff
!	%l5 = 0000000000000100, Mem[0000000030081400] = 00ff0000
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 00ff0000
!	Mem[0000000010101408] = ff0000ff, %l7 = 00000000000009ff
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010081400] = 00000001 fffffff4
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 000000ff
!	Mem[00000000100c1408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f14 = 00000000 ff0000ff, Mem[0000000010041400] = 0000f1ff 00000000
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 ff0000ff
!	%f9  = 920000ff, Mem[0000000010141418] = c95d38d7
	st	%f9 ,[%i5+0x018]	! Mem[0000000010141418] = 920000ff
!	%f2  = 00000000 000000ff, %l7 = 00000000000000ff
!	Mem[0000000030081410] = ff00000000000000
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff00e0c7, %l7 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 000000000000ff00

p0_label_193:
!	Mem[0000000010041408] = 00000000, %l3 = 000000001ef10000
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = c7e00000, %l5 = 0000000000000100
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000c7
!	Mem[0000000030141400] = 1e000000, %l7 = 000000000000ff00
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 000000001e000000
!	Mem[00000000201c0000] = 09ff75c1, %l3 = 0000000000000000
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000009ff
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = ffffffff000000ff, %l0 = 000000000000001e
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = ffffffff000000ff
!	Mem[0000000010041400] = ff0000ff, %f15 = ff0000ff
	lda	[%i1+%g0]0x88,%f15	! %f15 = ff0000ff
!	Mem[0000000010001410] = 000000ff, %f1  = 00000000
	lda	[%i0+%o5]0x88,%f1 	! %f1 = 000000ff
!	Mem[00000000100c1400] = ff000000fffffff4, %l0 = ffffffff000000ff
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = ff000000fffffff4
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ff00ff52, %l4 = 00000000000000f4
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff00ff52

p0_label_194:
!	%l6 = 00000000, %l7 = 1e000000, Mem[0000000010141400] = ff000000 00008143
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 1e000000
!	Mem[0000000010001400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000000009ff, Mem[000000001000141f] = 2ecd2f41
	stb	%l3,[%i0+0x01f]		! Mem[000000001000141c] = 2ecd2fff
!	%l2 = 0000000000000000, Mem[0000000010081400] = 00000000
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%f13 = 00000000, %f10 = 00000000
	fcmpes	%fcc0,%f13,%f10		! %fcc0 = 0
!	%l0 = ff000000fffffff4, Mem[0000000010041410] = f4000000
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = f40000f4
!	%f0  = c7e00000 000000ff, %l5 = 00000000000000c7
!	Mem[0000000010041410] = f40000f400000000
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l5]ASI_PST32_P ! Mem[0000000010041410] = c7e00000000000ff
!	%f16 = f4ffffff 00000000 00000000 ff0000ff
!	%f20 = ffffffff ff000000 ffffffff fffffcb7
!	%f24 = 01000000 8c4e8d6d 00ff0000 00000000
!	%f28 = 00000000 00000000 1f6fff52 34e68dab
	stda	%f16,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%f0  = c7e00000 000000ff 00000000 000000ff
!	%f4  = 60000000 0000ff00 00000000 412f1ff4
!	%f8  = ff000000 920000ff 00000000 00000000
!	%f12 = ff00ff52 00000000 00000000 ff0000ff
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
!	%l7 = 000000001e000000, %l6 = 0000000000000000, %l2 = 0000000000000000
	xor	%l7,%l6,%l2		! %l2 = 000000001e000000

p0_label_195:
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010141408] = 00000000, %f26 = 00ff0000
	lda	[%i5+%o4]0x80,%f26	! %f26 = 00000000
!	Mem[0000000010001400] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1400] = fffffff4, %l4 = 00000000ff00ff52
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = fffffffffffffff4
!	Mem[0000000010001410] = ff00000000000000, %f26 = 00000000 00000000
	ldda	[%i0+%o5]0x80,%f26	! %f26 = ff000000 00000000
!	Mem[0000000010081410] = ff000000 00000000, %l2 = 1e000000, %l3 = 000009ff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010141410] = ffffffffff000000, %f4  = 60000000 0000ff00
	ldda	[%i5+%o5]0x80,%f4 	! %f4  = ffffffff ff000000
!	Mem[0000000020800000] = 048aedbb, %l7 = 000000001e000000
	ldsb	[%o1+%g0],%l7		! %l7 = 0000000000000004
!	%f13 = 00000000, %f0  = c7e00000, %f16 = f4ffffff
	fadds	%f13,%f0 ,%f16		! %f16 = c7e00000
!	Mem[00000000100c1420] = 00ff00008c4e8d6d, %f8  = ff000000 920000ff
	ldd	[%i3+0x020],%f8 	! %f8  = 00ff0000 8c4e8d6d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141411] = ffffffff, %l4 = fffffffffffffff4
	ldstuba	[%i5+0x011]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_196:
!	Mem[0000000010101408] = ff0000ff, %l1 = ffffffffffffff00
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff0000ff
!	%f26 = ff000000 00000000, %l0 = ff000000fffffff4
!	Mem[0000000010041408] = 000000000000ff00
	add	%i1,0x008,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010041408] = 000000000000ff00
!	%f28 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010141438] = 1f6fff5234e68dab
	add	%i5,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141438] = 1f6fff5234e68dab
!	Mem[0000000010001418] = 60537de62ecd2fff, %l6 = 0000000000000000, %l4 = 00000000000000ff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 60537de62ecd2fff
!	%l6 = 0000000000000000, Mem[0000000030141400] = f90000000000001e
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000010101408] = ffffff00, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000010101400] = 00000000, %l6 = 00000000ffffff00
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f18 = 00000000 ff0000ff, Mem[0000000010041408] = 00000000 0000ff00
	stda	%f18,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 ff0000ff
!	%l4 = 60537de62ecd2fff, Mem[0000000030141400] = 00000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000e0c7, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000c7

p0_label_197:
!	Mem[0000000030041408] = 2ecd1528, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 000000002ecd1528
!	Mem[00000000100c1400] = fffffff4, %f10 = 00000000
	lda	[%i3+%g0]0x88,%f10	! %f10 = fffffff4
!	%f17 = 00000000, %f2  = 00000000, %f17 = 00000000
	fadds	%f17,%f2 ,%f17		! %f17 = 00000000
!	Mem[0000000030041410] = 00000000ff000000, %l3 = 00000000000000c7
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001414] = 00000000, %l5 = 00000000000000c7
	lduh	[%i0+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff ffffff00, %l6 = 2ecd1528, %l7 = 00000004
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff0000ff 00000000ffffff00
!	Mem[0000000010001410] = ff000000, %l4 = 60537de62ecd2fff
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	%l1 = 00000000ff0000ff, %l0 = ff000000fffffff4, %l7 = 00000000ffffff00
	or	%l1,%l0,%l7		! %l7 = ff000000ffffffff
!	Mem[0000000020800000] = 048aedbb, %l7 = ff000000ffffffff
	ldsb	[%o1+0x001],%l7		! %l7 = ffffffffffffff8a
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff8a, Mem[00000000201c0001] = 09ff75c1
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = 098a75c1

p0_label_198:
!	%l4 = ffffffffffffffff, Mem[0000000010001408] = 0000e0c7
	stwa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	Mem[00000000100c1410] = 000000ff ffffffff, %l0 = fffffff4, %l1 = ff0000ff
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010141418] = fffffffffffffcb7, %l4 = ffffffffffffffff, %l0 = 00000000ffffffff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = fffffffffffffcb7
!	Mem[0000000030101400] = 0000e0c7, %l0 = fffffffffffffcb7
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000c7000000ff
!	Mem[0000000010101410] = 000000ff, %l0 = 00000000000000c7
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 00000000000000ff
	setx	0x39c6023033d9c6b3,%g7,%l0 ! %l0 = 39c6023033d9c6b3
!	%l1 = 00000000000000ff
	setx	0x09c49ea839dab3e7,%g7,%l1 ! %l1 = 09c49ea839dab3e7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39c6023033d9c6b3
	setx	0xc4b8e2483105f18b,%g7,%l0 ! %l0 = c4b8e2483105f18b
!	%l1 = 09c49ea839dab3e7
	setx	0x844e6aafccac832d,%g7,%l1 ! %l1 = 844e6aafccac832d
!	%f30 = 1f6fff52 34e68dab, Mem[0000000030081410] = 00000000 ff000000
	stda	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = 1f6fff52 34e68dab
!	Mem[0000000010101438] = ab8de634, %l0 = c4b8e2483105f18b, %asi = 80
	swapa	[%i4+0x038]%asi,%l0	! %l0 = 00000000ab8de634
!	%l6 = ff0000ff, %l7 = ffffff8a, Mem[0000000010101400] = ffffff00 f4ffffff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0000ff ffffff8a
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 098a75c1, %l0 = 00000000ab8de634
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000098a

p0_label_199:
!	Mem[0000000030141400] = ff000000, %l0 = 000000000000098a
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000020800000] = 048aedbb, %l4 = ffffffffffffffff
	lduba	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000004
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000ff000000
	setx	0xa1addda84d828f7f,%g7,%l0 ! %l0 = a1addda84d828f7f
!	%l1 = 844e6aafccac832d
	setx	0x9566ee3ff1115b8c,%g7,%l1 ! %l1 = 9566ee3ff1115b8c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a1addda84d828f7f
	setx	0xbdd97e3020969215,%g7,%l0 ! %l0 = bdd97e3020969215
!	%l1 = 9566ee3ff1115b8c
	setx	0x406c73b028257312,%g7,%l1 ! %l1 = 406c73b028257312
!	Mem[00000000100c1408] = 000000ff, %l1 = 406c73b028257312
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = ffffffff, %l6 = 00000000ff0000ff
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000201c0000] = 098a75c1, %l3 = 00000000ff000000
	ldsb	[%o0+%g0],%l3		! %l3 = 0000000000000009
!	Mem[0000000030001408] = ff0000ff, %l7 = ffffffffffffff8a
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = ff000000, %l6 = ffffffffffffffff
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 52ff00ff, %l0 = bdd97e3020969215
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 0000000052ff00ff

p0_label_200:
!	Mem[0000000010181410] = 00000821, %l2 = 00000000ff000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000821
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000821
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, %l5 = 0000000000000000, %y  = 36b0e381
	sdiv	%l2,%l5,%l4		! Div by zero, %l0 = 0000000052ff014f
	mov	%l0,%y			! %y = 52ff0127
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000004
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = ffffffffffffffff, Mem[0000000010101400] = ff0000ff
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	%l0 = 0000000052ff0127, Mem[0000000010041400] = ff0000ff
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 270000ff
!	%l4 = 0000000000000000, %l6 = 00000000ff000000, %y  = 52ff0127
	sdiv	%l4,%l6,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 52ff0127
!	%l7 = ffffffffffffffff, Mem[0000000020800001] = 048aedbb, %asi = 80
	stba	%l7,[%o1+0x001]%asi	! Mem[0000000020800000] = 04ffedbb
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041400] = 20969215 57272f74
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = fffffff4, %l6 = ffffffff80000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	mulx	%l3,0x215,%l1
	nop
	udivx	%l2,%l5,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000052ff0127
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000009
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x52ff0127,%g2
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
	cmp	%l0,%l1			! %f0  should be c7e00000 000000ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 000000ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff ff000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 412f1ff4
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00ff0000 8c4e8d6d
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be fffffff4 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ff00ff52 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 ff0000ff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be c7e00000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 ff0000ff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffffff ff000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ffffffff fffffcb7
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 01000000 8c4e8d6d
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff000000 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 1f6fff52 34e68dab
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
	smul	%l3,%l1,%l4
	done

p0_trap1o:
	smul	%l3,%l1,%l4
	done


p0_trap2e:
	fdtoi	%f8 ,%f4 
	fsubs	%f9 ,%f14,%f6 
	done

p0_trap2o:
	fdtoi	%f8 ,%f4 
	fsubs	%f9 ,%f14,%f6 
	done


p0_trap3e:
	orn	%l4,%l3,%l0
	xor	%l4,%l0,%l7
	orn	%l0,-0x353,%l5
	done

p0_trap3o:
	orn	%l4,%l3,%l0
	xor	%l4,%l0,%l7
	orn	%l0,-0x353,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = ca8662063155831c
	ldx	[%g1+0x008],%l1		! %l1 = 4891b675fea9c1a1
	ldx	[%g1+0x010],%l2		! %l2 = 022c5b4266427080
	ldx	[%g1+0x018],%l3		! %l3 = 507f85a7a99da124
	ldx	[%g1+0x020],%l4		! %l4 = 25d87e7a29036b6d
	ldx	[%g1+0x028],%l5		! %l5 = e9214980c6704eb9
	ldx	[%g1+0x030],%l6		! %l6 = e883873ca254d25b
	ldx	[%g1+0x038],%l7		! %l7 = 52a876b9e69113cc

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
	smul	%l3,%l1,%l4
	fdivs	%f0 ,%f4 ,%f9 
	fsubs	%f9 ,%f14,%f6 
	jmpl	%o7,%g0
	fsubs	%f15,%f12,%f8 
p0_near_0_he:
	fadds	%f25,%f22,%f24
	xor	%l4,-0xd38,%l7
	orn	%l0,-0x353,%l5
	jmpl	%o7,%g0
	ldsb	[%i0+0x00f],%l7		! Mem[000000001000140f]
near0_b2b_h:
	mulx	%l2,%l7,%l7
	smul	%l6,-0xc1b,%l5
	mulx	%l6,-0x620,%l2
	mulx	%l2,0x690,%l6
	addc	%l7,%l6,%l5
	orn	%l2,-0x4b7,%l1
	and	%l5,-0x875,%l7
	jmpl	%o7,%g0
	and	%l2,%l7,%l6
near0_b2b_l:
	add	%l6,%l2,%l0
	and	%l0,0xd6a,%l1
	orn	%l2,0xfc8,%l7
	smul	%l3,%l7,%l5
	xor	%l1,%l6,%l3
	smul	%l1,%l0,%l1
	orn	%l7,-0xf86,%l2
	jmpl	%o7,%g0
	and	%l7,%l7,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	smul	%l6,0xb04,%l0
	addc	%l6,-0x0fa,%l0
	jmpl	%o7,%g0
	xnor	%l2,%l2,%l7
p0_near_1_he:
	fmuls	%f24,%f22,%f26
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l5
near1_b2b_h:
	fmuls	%f17,%f19,%f31
	smul	%l3,%l5,%l4
	jmpl	%o7,%g0
	and	%l3,0x0d6,%l5
near1_b2b_l:
	sub	%l1,%l3,%l1
	fsubs	%f7 ,%f1 ,%f2 
	jmpl	%o7,%g0
	addc	%l4,%l5,%l7
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	add	%l0,0xc3b,%l0
	xnor	%l4,%l4,%l5
	orn	%l7,%l1,%l0
	addc	%l4,%l2,%l7
	fdivs	%f3 ,%f4 ,%f7 
	orn	%l4,%l3,%l4
	nop
	jmpl	%o7,%g0
	fdivs	%f14,%f1 ,%f3 
p0_near_2_he:
	udivx	%l6,%l6,%l1
	fdivs	%f19,%f28,%f21
	fstod	%f23,%f30
	smul	%l2,0x73c,%l4
	orn	%l6,%l0,%l5
	subc	%l3,%l2,%l4
	jmpl	%o7,%g0
	andn	%l2,%l2,%l2
near2_b2b_h:
	xnor	%l1,%l2,%l3
	fadds	%f18,%f31,%f24
	xor	%l3,-0x9a2,%l6
	fadds	%f28,%f30,%f31
	xnor	%l6,%l1,%l0
	smul	%l4,-0x465,%l0
	umul	%l3,%l2,%l7
	jmpl	%o7,%g0
	andn	%l4,%l0,%l4
near2_b2b_l:
	fcmps	%fcc0,%f14,%f10
	fsqrts	%f8 ,%f12
	addc	%l7,0xa4a,%l3
	sub	%l2,0xd4f,%l5
	fsqrts	%f14,%f14
	mulx	%l4,%l5,%l4
	udivx	%l1,%l6,%l4
	jmpl	%o7,%g0
	fmuls	%f0 ,%f11,%f8 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fdivs	%f6 ,%f1 ,%f5 
	mulx	%l1,0x010,%l6
	sdivx	%l0,0xa35,%l3
	fcmps	%fcc3,%f4 ,%f13
	orn	%l2,-0xf30,%l6
	orn	%l4,-0x3c3,%l6
	umul	%l3,%l4,%l2
	jmpl	%o7,%g0
	std	%l0,[%i4+0x018]		! Mem[0000000010101418]
p0_near_3_he:
	or	%l6,%l2,%l6
	fsqrts	%f16,%f20
	xnor	%l1,-0x953,%l4
	jmpl	%o7,%g0
	fsubs	%f23,%f29,%f25
near3_b2b_h:
	addc	%l6,-0xc58,%l4
	fcmps	%fcc2,%f23,%f29
	addc	%l7,%l3,%l3
	jmpl	%o7,%g0
	sdivx	%l1,0x576,%l7
near3_b2b_l:
	fdivs	%f15,%f0 ,%f7 
	fmuls	%f6 ,%f3 ,%f14
	umul	%l2,-0x2fd,%l3
	jmpl	%o7,%g0
	udivx	%l2,0xbe6,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fadds	%f7 ,%f13,%f14
	jmpl	%o7,%g0
	and	%l5,%l4,%l6
p0_far_0_lem:
	fadds	%f7 ,%f13,%f14
	jmpl	%o7,%g0
	and	%l5,%l4,%l6
p0_far_0_he:
	fdivs	%f30,%f22,%f26
	fsubs	%f22,%f18,%f20
	smul	%l4,0x70d,%l2
	fsqrts	%f21,%f18
	fmuls	%f27,%f23,%f28
	fsubs	%f22,%f16,%f17
	jmpl	%o7,%g0
	fcmps	%fcc3,%f25,%f30
p0_far_0_hem:
	fdivs	%f30,%f22,%f26
	fsubs	%f22,%f18,%f20
	smul	%l4,0x70d,%l2
	fsqrts	%f21,%f18
	fmuls	%f27,%f23,%f28
	fsubs	%f22,%f16,%f17
	jmpl	%o7,%g0
	fcmps	%fcc3,%f25,%f30
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	or	%l5,0x245,%l2
	fsqrts	%f18,%f30
	subc	%l1,%l3,%l2
	jmpl	%o7,%g0
	fcmps	%fcc3,%f23,%f17
far0_b2b_l:
	fcmps	%fcc1,%f15,%f5 
	fdivs	%f9 ,%f3 ,%f4 
	mulx	%l1,-0x742,%l2
	jmpl	%o7,%g0
	fsqrts	%f12,%f15
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l2,%l0,%l6
	st	%f6 ,[%i6+0x030]	! Mem[0000000010181430]
	sub	%l1,-0xa12,%l6
	fcmps	%fcc3,%f11,%f4 
	orn	%l5,%l3,%l1
	and	%l6,0xdc3,%l4
	mulx	%l6,%l5,%l7
	jmpl	%o7,%g0
	udivx	%l5,0xeb1,%l6
p0_far_1_lem:
	mulx	%l2,%l0,%l6
	membar	#Sync
	st	%f6 ,[%i6+0x030]	! Mem[0000000010181430]
	sub	%l1,-0xa12,%l6
	fcmps	%fcc3,%f11,%f4 
	orn	%l5,%l3,%l1
	and	%l6,0xdc3,%l4
	mulx	%l6,%l5,%l7
	jmpl	%o7,%g0
	udivx	%l5,0xeb1,%l6
p0_far_1_he:
	sub	%l3,%l2,%l0
	andn	%l1,%l2,%l6
	andn	%l4,%l6,%l1
	or	%l4,%l3,%l0
	jmpl	%o7,%g0
	xnor	%l6,%l1,%l1
p0_far_1_hem:
	sub	%l3,%l2,%l0
	andn	%l1,%l2,%l6
	andn	%l4,%l6,%l1
	or	%l4,%l3,%l0
	jmpl	%o7,%g0
	xnor	%l6,%l1,%l1
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	and	%l6,%l5,%l7
	umul	%l3,%l7,%l7
	fitos	%f18,%f16
	udivx	%l4,0x1f9,%l4
	addc	%l1,-0x28c,%l6
	jmpl	%o7,%g0
	fdivs	%f18,%f21,%f25
far1_b2b_l:
	xor	%l6,-0xa3a,%l4
	sub	%l0,0xb5b,%l7
	xor	%l2,%l4,%l7
	sub	%l3,-0x32b,%l6
	andn	%l5,-0x2e0,%l4
	jmpl	%o7,%g0
	and	%l7,-0x7a4,%l5
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	mulx	%l1,%l7,%l5
	sdivx	%l3,%l7,%l2
	fcmps	%fcc1,%f8 ,%f12
	or	%l6,-0x25b,%l7
	jmpl	%o7,%g0
	orn	%l7,%l4,%l4
p0_far_2_lem:
	mulx	%l1,%l7,%l5
	sdivx	%l3,%l7,%l2
	fcmps	%fcc1,%f8 ,%f12
	or	%l6,-0x25b,%l7
	jmpl	%o7,%g0
	orn	%l7,%l4,%l4
p0_far_2_he:
	and	%l0,0x638,%l4
	xor	%l1,0x26c,%l0
	jmpl	%o7,%g0
	orn	%l7,0x6d9,%l0
p0_far_2_hem:
	and	%l0,0x638,%l4
	xor	%l1,0x26c,%l0
	jmpl	%o7,%g0
	orn	%l7,0x6d9,%l0
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fstod	%f21,%f20
	sdivx	%l7,-0xbe5,%l5
	addc	%l4,-0x6cb,%l6
	xor	%l1,%l3,%l4
	sub	%l2,%l7,%l7
	jmpl	%o7,%g0
	udivx	%l5,%l6,%l0
far2_b2b_l:
	fcmps	%fcc3,%f7 ,%f11
	subc	%l0,-0x514,%l1
	umul	%l7,-0xa28,%l3
	xor	%l6,-0x4d2,%l7
	fsubs	%f10,%f10,%f9 
	jmpl	%o7,%g0
	fsubs	%f12,%f12,%f1 
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fsqrts	%f11,%f1 
	orn	%l1,%l6,%l1
	jmpl	%o7,%g0
	mulx	%l3,0x11f,%l1
p0_far_3_lem:
	fsqrts	%f11,%f1 
	orn	%l1,%l6,%l1
	jmpl	%o7,%g0
	mulx	%l3,0x11f,%l1
p0_far_3_he:
	xnor	%l6,%l1,%l5
	jmpl	%o7,%g0
	andn	%l7,-0x698,%l1
p0_far_3_hem:
	xnor	%l6,%l1,%l5
	jmpl	%o7,%g0
	andn	%l7,-0x698,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	orn	%l6,-0x979,%l7
	addc	%l7,0x035,%l2
	sdivx	%l4,0x4d7,%l5
	jmpl	%o7,%g0
	sub	%l0,%l2,%l6
far3_b2b_l:
	fcmps	%fcc3,%f7 ,%f9 
	fmuls	%f3 ,%f10,%f2 
	sdivx	%l5,0xf3f,%l6
	jmpl	%o7,%g0
	fcmps	%fcc2,%f4 ,%f11
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	nop
	addc	%l1,%l0,%l1
	udivx	%l1,%l5,%l4
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f14,%f6 
p0_call_0_le:
	xor	%l0,-0x155,%l3
	smul	%l6,0xb2c,%l0
	fsqrts	%f7 ,%f8 
	smul	%l3,-0xf45,%l6
	smul	%l0,0x88b,%l3
	retl
	add	%l4,%l7,%l1
p0_jmpl_0_lo:
	nop
	addc	%l1,%l0,%l1
	udivx	%l1,%l5,%l4
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f14,%f6 
p0_call_0_lo:
	xor	%l0,-0x155,%l3
	smul	%l6,0xb2c,%l0
	fsqrts	%f7 ,%f8 
	smul	%l3,-0xf45,%l6
	smul	%l0,0x88b,%l3
	retl
	add	%l4,%l7,%l1
p0_jmpl_0_he:
	sdivx	%l3,%l5,%l1
	and	%l6,-0x471,%l2
	jmpl	%g6+8,%g0
	addc	%l5,%l0,%l3
p0_call_0_he:
	retl
	subc	%l4,0x203,%l3
p0_jmpl_0_ho:
	sdivx	%l3,%l5,%l1
	and	%l6,-0x471,%l2
	jmpl	%g6+8,%g0
	addc	%l5,%l0,%l3
p0_call_0_ho:
	retl
	subc	%l4,0x203,%l3
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	smul	%l7,%l3,%l4
	fmuls	%f10,%f5 ,%f13
	mulx	%l5,%l0,%l0
	fadds	%f2 ,%f0 ,%f13
	xor	%l4,-0xc10,%l3
	ld	[%i0+0x008],%f15	! Mem[0000000010001408]
	fsubs	%f1 ,%f11,%f11
	jmpl	%g6+8,%g0
	udivx	%l0,%l0,%l1
p0_call_1_le:
	andn	%l6,%l1,%l1
	add	%l6,-0x02d,%l3
	retl
	fmuls	%f12,%f0 ,%f3 
p0_jmpl_1_lo:
	smul	%l7,%l3,%l4
	fmuls	%f10,%f5 ,%f13
	mulx	%l5,%l0,%l0
	fadds	%f2 ,%f0 ,%f13
	xor	%l4,-0xc10,%l3
	ld	[%o0+0x008],%f15	! Mem[0000000010001408]
	fsubs	%f1 ,%f11,%f11
	jmpl	%g6+8,%g0
	udivx	%l0,%l0,%l1
p0_call_1_lo:
	andn	%l6,%l1,%l1
	add	%l6,-0x02d,%l3
	retl
	fmuls	%f12,%f0 ,%f3 
p0_jmpl_1_he:
	fcmps	%fcc2,%f30,%f18
	or	%l1,-0x7dd,%l0
	jmpl	%g6+8,%g0
	fmuls	%f18,%f22,%f16
p0_call_1_he:
	xnor	%l7,-0xa37,%l5
	std	%f16,[%i2+0x010]	! Mem[0000000010081410]
	xnor	%l0,0xad1,%l4
	smul	%l2,-0x4f2,%l2
	udivx	%l0,%l4,%l4
	retl
	addc	%l0,%l5,%l1
p0_jmpl_1_ho:
	fcmps	%fcc2,%f30,%f18
	or	%l1,-0x7dd,%l0
	jmpl	%g6+8,%g0
	fmuls	%f18,%f22,%f16
p0_call_1_ho:
	xnor	%l7,-0xa37,%l5
	std	%f16,[%o2+0x010]	! Mem[0000000010081410]
	xnor	%l0,0xad1,%l4
	smul	%l2,-0x4f2,%l2
	udivx	%l0,%l4,%l4
	retl
	addc	%l0,%l5,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	mulx	%l6,0xc4f,%l1
	mulx	%l0,0x5a3,%l0
	sub	%l7,0x30f,%l3
	fdivs	%f11,%f11,%f14
	andn	%l7,0x1d0,%l4
	smul	%l6,%l1,%l3
	jmpl	%g6+8,%g0
	fdivs	%f10,%f15,%f0 
p0_call_2_le:
	fadds	%f10,%f9 ,%f4 
	ldd	[%i6+0x010],%f14	! Mem[0000000010181410]
	retl
	and	%l1,%l1,%l3
p0_jmpl_2_lo:
	mulx	%l6,0xc4f,%l1
	mulx	%l0,0x5a3,%l0
	sub	%l7,0x30f,%l3
	fdivs	%f11,%f11,%f14
	andn	%l7,0x1d0,%l4
	smul	%l6,%l1,%l3
	jmpl	%g6+8,%g0
	fdivs	%f10,%f15,%f0 
p0_call_2_lo:
	fadds	%f10,%f9 ,%f4 
	ldd	[%o6+0x010],%f14	! Mem[0000000010181410]
	retl
	and	%l1,%l1,%l3
p0_jmpl_2_he:
	fsqrts	%f26,%f16
	umul	%l2,%l0,%l7
	add	%l5,-0xf14,%l5
	sdivx	%l7,-0xda5,%l7
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f25
p0_call_2_he:
	orn	%l5,%l2,%l6
	and	%l5,%l3,%l5
	sub	%l2,%l0,%l5
	sub	%l2,0xad4,%l0
	retl
	fmuls	%f29,%f24,%f16
p0_jmpl_2_ho:
	fsqrts	%f26,%f16
	umul	%l2,%l0,%l7
	add	%l5,-0xf14,%l5
	sdivx	%l7,-0xda5,%l7
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f25
p0_call_2_ho:
	orn	%l5,%l2,%l6
	and	%l5,%l3,%l5
	sub	%l2,%l0,%l5
	sub	%l2,0xad4,%l0
	retl
	fmuls	%f29,%f24,%f16
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	smul	%l5,-0x87f,%l2
	add	%l5,%l6,%l1
	ld	[%i4+0x028],%f6 	! Mem[0000000010101428]
	subc	%l3,%l2,%l0
	or	%l5,%l7,%l6
	jmpl	%g6+8,%g0
	mulx	%l1,0xde5,%l5
p0_call_3_le:
	fmuls	%f8 ,%f8 ,%f15
	udivx	%l1,%l0,%l4
	smul	%l2,0xd28,%l4
	subc	%l1,%l3,%l3
	fsubs	%f6 ,%f7 ,%f11
	retl
	sth	%l0,[%i1+0x036]		! Mem[0000000010041436]
p0_jmpl_3_lo:
	smul	%l5,-0x87f,%l2
	add	%l5,%l6,%l1
	ld	[%o4+0x028],%f6 	! Mem[0000000010101428]
	subc	%l3,%l2,%l0
	or	%l5,%l7,%l6
	jmpl	%g6+8,%g0
	mulx	%l1,0xde5,%l5
p0_call_3_lo:
	fmuls	%f8 ,%f8 ,%f15
	udivx	%l1,%l0,%l4
	smul	%l2,0xd28,%l4
	subc	%l1,%l3,%l3
	fsubs	%f6 ,%f7 ,%f11
	retl
	sth	%l0,[%o1+0x036]		! Mem[0000000010041436]
p0_jmpl_3_he:
	or	%l4,%l3,%l2
	xnor	%l0,%l2,%l6
	or	%l2,%l6,%l5
	smul	%l4,-0x0a6,%l6
	fdivs	%f24,%f25,%f22
	jmpl	%g6+8,%g0
	subc	%l6,0xf6f,%l7
p0_call_3_he:
	fcmps	%fcc0,%f25,%f25
	retl
	xnor	%l5,-0xdc6,%l6
p0_jmpl_3_ho:
	or	%l4,%l3,%l2
	xnor	%l0,%l2,%l6
	or	%l2,%l6,%l5
	smul	%l4,-0x0a6,%l6
	fdivs	%f24,%f25,%f22
	jmpl	%g6+8,%g0
	subc	%l6,0xf6f,%l7
p0_call_3_ho:
	fcmps	%fcc0,%f25,%f25
	retl
	xnor	%l5,-0xdc6,%l6
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
	.word	0xca866206,0x3155831c		! Init value for %l0
	.word	0x4891b675,0xfea9c1a1		! Init value for %l1
	.word	0x022c5b42,0x66427080		! Init value for %l2
	.word	0x507f85a7,0xa99da124		! Init value for %l3
	.word	0x25d87e7a,0x29036b6d		! Init value for %l4
	.word	0xe9214980,0xc6704eb9		! Init value for %l5
	.word	0xe883873c,0xa254d25b		! Init value for %l6
	.word	0x52a876b9,0xe69113cc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xf8511d1b,0xefb2d718		! Init value for %f0 
	.word	0x393e2a63,0x9eed9753		! Init value for %f2 
	.word	0xda6229f7,0xa19f87bd		! Init value for %f4 
	.word	0xb3fc65cc,0x64804183		! Init value for %f6 
	.word	0x082da03a,0xb1a1a9fd		! Init value for %f8 
	.word	0x44cc3530,0x23145b02		! Init value for %f10
	.word	0xbdce655c,0x80119692		! Init value for %f12
	.word	0xfaf2162c,0x1aee0638		! Init value for %f14
	.word	0xbc8ad5ed,0xa79d9bf2		! Init value for %f16
	.word	0xf404cd1d,0xaf703dc3		! Init value for %f18
	.word	0x9e3612e3,0xfa8a642b		! Init value for %f20
	.word	0x14da5593,0xf482f3f5		! Init value for %f22
	.word	0xe7cdd534,0x98f0288b		! Init value for %f24
	.word	0x72016081,0x64902294		! Init value for %f26
	.word	0x47d58ad6,0x31dcbcd9		! Init value for %f28
	.word	0x2579ae5c,0x22487c2b		! Init value for %f30
	.word	0x7737f8a3,0xe4921899		! Init value for %f32
	.word	0x821ec8e2,0xb507acd4		! Init value for %f34
	.word	0x13dfcadc,0x2c2a5f34		! Init value for %f36
	.word	0x55725e6d,0x1e017edd		! Init value for %f38
	.word	0xf5d75abc,0x2f9b2906		! Init value for %f40
	.word	0xf1137fd6,0x51341abb		! Init value for %f42
	.word	0x18f4aba1,0xedeabd4f		! Init value for %f44
	.word	0xf47520a7,0x36cff8c6		! Init value for %f46
	.word	0x4ef5c7d7,0x828ce2ca
	.word	0xc06c747b,0x48f15b7e
	.word	0xe772311d,0xf7ad36a7
	.word	0x8c8159dc,0xad05108c
	.word	0x8ea2f88d,0xc66fcf96
	.word	0xfb69ff2c,0x9947a3af
	.word	0x289a87c6,0x08e5ba2b
	.word	0x25391679,0x810937d7
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
	.word	0x00000000,0x52ff0127
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000009
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffff
p0_expected_fp_regs:
	.word	0xc7e00000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xff000000
	.word	0x00000000,0x412f1ff4
	.word	0x00ff0000,0x8c4e8d6d
	.word	0xfffffff4,0x00000000
	.word	0xff00ff52,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0xc7e00000,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0xffffffff,0xff000000
	.word	0xffffffff,0xfffffcb7
	.word	0x01000000,0x8c4e8d6d
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x1f6fff52,0x34e68dab
	.word	0x00000029,0x00000000		! %fsr = 0000002900000000
p0_local0_expect:
	.word	0xff0000ff,0xffffff00
	.word	0xffffffff,0x00000000
	.word	0xff000000,0x00000000
	.word	0x60537de6,0x2ecd2fff
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0xdfe181b1
	.word	0xba8cffb3,0x56f8fdfa
	.word	0xaa578bda,0xb7e40821
p0_local0_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff0000ff,0x00000060
	.word	0x00000000,0x00000000
	.word	0x44817c95,0x33b9f0ff
	.word	0xa10a760e,0x5a2be836
	.word	0xc09d1212,0xa82c0c11
	.word	0xb181e1df,0xe642abc1
	.word	0x5d018ec3,0xc57ab026
p0_local1_expect:
	.word	0x270000ff,0x00000000
	.word	0xff000000,0xff0000ff
	.word	0xc7e00000,0x000000ff
	.word	0x000032c0,0x00000000
	.word	0x000000ff,0x93318aff
	.word	0x00000000,0xc727cf71
	.word	0x866cc347,0x24a11e94
	.word	0x866c804d,0x00000001
p0_local1_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x2815cd2e,0xffffff00
	.word	0x00000000,0xff000000
	.word	0x2ce0798a,0x580c7ef8
	.word	0xb37058a8,0x1428fa21
	.word	0x627c52ad,0x0f3b87e9
	.word	0xdf712ac7,0x56dbeb7e
	.word	0xeb3bc258,0x93e09dfe
p0_local2_expect:
	.word	0x00000000,0xff000000
	.word	0xfffffff4,0x00000000
	.word	0xff000000,0x00000000
	.word	0x52ff00ff,0x691e0821
	.word	0x36000000,0x93318aff
	.word	0xffffaa84,0x0000ff60
	.word	0x0542b5e2,0x00000036
	.word	0x0000ffff,0xcc650044
p0_local2_sec_expect:
	.word	0x0000ff00,0xfffffcb7
	.word	0xffffff00,0x00000000
	.word	0xab8de634,0x52ff6f1f
	.word	0x5727e874,0xf6cc8abd
	.word	0xd488a646,0x1a315cff
	.word	0x595e11c7,0x0710d380
	.word	0x909c4eed,0x836e8709
	.word	0xb181e1df,0x24c24b88
p0_local3_expect:
	.word	0xf4ffffff,0x000000ff
	.word	0x000000ff,0xff0000ff
	.word	0xffffffff,0xff000000
	.word	0xffffffff,0xfffffcb7
	.word	0x00ff0000,0x8c4e8d6d
	.word	0x00ff0000,0x00000000
	.word	0xc1ab7de6,0x2ecd1528
	.word	0x1f6fff52,0x34e68dab
p0_local3_sec_expect:
	.word	0x01000000,0x8c4e8d6d
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000ffe5
	.word	0xffffffff,0xfffffcb7
	.word	0x01000000,0x8c4e8d6d
	.word	0x00ff0000,0x00000000
	.word	0xc1ab7de6,0x2ecd1528
	.word	0x1f6fff52,0x34e68dab
p0_local4_expect:
	.word	0xffffffff,0x8affffff
	.word	0x00000000,0x00000000
	.word	0x000000c7,0xffffffff
	.word	0xb7fcffff,0xffffffff
	.word	0x6d8d4e8c,0x00000001
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0x3105f18b,0x52ff6f1f
p0_local4_sec_expect:
	.word	0xffe00000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x60000000,0x0000ff00
	.word	0x00000000,0x412f1ff4
	.word	0xff000000,0x920000ff
	.word	0x00000000,0x00000000
	.word	0xff00ff52,0x00000000
	.word	0x00000000,0xff0000ff
p0_local5_expect:
	.word	0xf4ffffff,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0xffffffff,0xff000000
	.word	0xffffffff,0xfffffcb7
	.word	0x01000000,0x8c4e8d6d
	.word	0x00ff0000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x1f6fff52,0x34e68dab
p0_local5_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x67ffffff,0xffffffff
	.word	0xfff0b933,0x957c8144
	.word	0x36e82b5a,0x0e760aa1
	.word	0x110c2ca8,0x12129dc0
	.word	0xc1ab42e6,0xdfe181b1
	.word	0x26b07ac5,0xc38e015d
p0_local6_expect:
	.word	0x00670000,0x000000ff
	.word	0xff00e0c7,0x00000000
	.word	0xff0000ff,0x00008143
	.word	0xffffffff,0xfffffcb7
	.word	0x000000ff,0x00008100
	.word	0xffcc3530,0x23145b02
	.word	0x00008143,0x8011ff92
	.word	0xfaf2162c,0x691ec5b0
p0_local6_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xff00ff52,0x00000000
	.word	0xff000000,0xf9000000
	.word	0x92000000,0x691e0821
	.word	0x60000000,0x000000ff
	.word	0xffffaa84,0xabc1ffff
	.word	0x0542b5e2,0x23145b02
	.word	0x00000000,0xff0000ff
share0_expect:
	.word	0x098a75c1,0x3605c8b8
	.word	0x73c609b0,0x97354f09
	.word	0x39ea50ce,0xd21dffc4
	.word	0x1f784432,0xb2959b14
	.word	0x3633a2d5,0xe4eb9729
	.word	0x5681ba3a,0x42b60eb4
	.word	0x5511ba9e,0x219ee664
	.word	0x0bf8f617,0x3db12154
share1_expect:
	.word	0x04ffedbb,0x9a5bc1ac
	.word	0x709c4692,0xb35ddedc
	.word	0x3b91db55,0xa0b248f9
	.word	0x1434d037,0xe62d0cf1
	.word	0x54ef96e3,0x9575155f
	.word	0x8f612637,0xdaf61005
	.word	0x62ee9803,0x925aacaf
	.word	0xa36e91b3,0x2f4c6f53
	.word	0x28ffecd0,0x6ed76079
	.word	0x22f8e395,0xc2eb1142
	.word	0x91ec12b5,0x9aa3c2f2
	.word	0x0fa7ea49,0xf6beed58
	.word	0xadd0f03e,0xa08ac409
	.word	0xfacbcc2b,0xd606b14c
	.word	0x96bb82b8,0x32f6e2c9
	.word	0x5543797f,0xfff98399
share2_expect:
	.word	0x0000877b,0xdb509472
	.word	0xa5282547,0x330972db
	.word	0xc0759970,0x51c5dd88
	.word	0x7c2ee3d1,0xb7e5d9e5
	.word	0xeecd1937,0xd272abc5
	.word	0x1507b25d,0x87930b51
	.word	0x70296e0d,0x23cd4b60
	.word	0xdd42d516,0xee989edc
share3_expect:
	.word	0xffe5ddab,0x140a5683
	.word	0xf76cac04,0x3766cd6e
	.word	0x378a2b6c,0x8533c52e
	.word	0x0223fb96,0xf3e037ec
	.word	0x6cda1702,0x049c9290
	.word	0x8c8395c3,0x1395cad4
	.word	0xbb146f5c,0xe6b8a51d
	.word	0xb3ba408d,0xf166c325
	.word	0x2741d2c8,0xc407232a
	.word	0x765946c6,0xc6749241
	.word	0x0e2bf1ee,0x64aabdef
	.word	0xc0cd4382,0x28185771
	.word	0xc6c5d1ae,0x7f044ec3
	.word	0x2970ea24,0xa4f4f8c2
	.word	0xfad28fcb,0x061a80b3
	.word	0x444d8c58,0x6565aa90
	.word	0x3ddb4ee0,0x6fbac26d
	.word	0x2250d472,0x524c4af9
	.word	0xe3916f9d,0xb4270d04
	.word	0x871990e5,0x91053e84
	.word	0x40af4cb8,0x1835c464
	.word	0x53b9505f,0x0ff134fc
	.word	0x50e8b025,0x3d142063
	.word	0x81a9b128,0x11af7b3f
	.word	0x1609968e,0x4017e230
	.word	0x8030717b,0xf46379a1
	.word	0x030b7932,0x04641358
	.word	0x8c47335c,0xcb692e8a
	.word	0xf9762425,0xbc6abe90
	.word	0xdac03a95,0x50e907af
	.word	0x31e2445c,0xb6745d99
	.word	0xd5ed1c27,0xfe6068ce
	.word	0xffdd9604,0x084bdbb6
	.word	0x1416d987,0x6936f5f8
	.word	0xafbdf2de,0x891da5b1
	.word	0x13a27d2d,0x9d9a886e
	.word	0x113f9d2b,0x3d116457
	.word	0x4ae9870a,0x57b4601b
	.word	0x80d78eb9,0xdf1ca2ec
	.word	0x1669228c,0x10d41c56
	.word	0x92a1d198,0x9ccf68b0
	.word	0x35a0eb64,0x2247efb9
	.word	0x6ec632f9,0x8772701c
	.word	0xb9dd0b87,0x3233f779
	.word	0x60248288,0x306ca232
	.word	0xec7a11f6,0x64f453da
	.word	0xad7127e2,0x303c0010
	.word	0x205bcf20,0x53625b60
	.word	0xffaaf473,0xc7f90297
	.word	0x03563a19,0x250a043a
	.word	0x880493fc,0x39f83a18
	.word	0xa21b5d61,0xf667e195
	.word	0x675835c1,0x549a217c
	.word	0x3b2403f5,0x2f7ddca8
	.word	0xa243213c,0xffbb5847
	.word	0x46aa789f,0x75556b94
	.word	0x28ad75f7,0x473a8709
	.word	0x78fec55d,0xaf3bbc02
	.word	0x8054831a,0x83e9e97c
	.word	0xf1ea332c,0x6c2ad524
	.word	0xfa944878,0x40308d86
	.word	0x26914997,0xa7352046
	.word	0x6ef86dc6,0x461aca30
	.word	0x33218b14,0x92272857
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
	.word	0x8d8c84a7,0xf786cf81
	.word	0x00000000,0x00000002
	.word	0xc8284740,0x4342702a
	.word	0x00000000,0x00000003
	.word	0xdd0276b7,0xbc407cdd
	.word	0x00000000,0x00000004
	.word	0x85c72898,0x6cd1ce09
	.word	0x00000000,0x00000005
	.word	0x6ac5b480,0x474cdd31
	.word	0x00000000,0x00000006
	.word	0x1468ea27,0xe02f9edd
	.word	0x00000000,0x00000007
	.word	0x532cad80,0x7e602a73
	.word	0x00000000,0x00000008
	.word	0xc05f782f,0xa9867c33
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
	.word	0xbd6888c5,0x2a7aa50d,0x32520af0,0x18ba0478
	.word	0x74cb7a97,0x14f96e1e,0xa0536e47,0x7a2b4159
	.word	0xda50baaf,0xa3a45df4,0x16848775,0xc6f3cf0c
	.word	0x04326049,0x6a782d43,0xfadc9f77,0x0f1b0b95
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
	.word	0x67be1bdd,0xbf74240a,0x363308b3,0xf45d30ec
	.word	0x918eed5a,0xdde5bb7e,0x44817c95,0x33b9f0ff
	.word	0xa10a760e,0x5a2be836,0xc09d1212,0xa82c0c11
	.word	0xe0aad552,0xa742ee43,0x5d018ec3,0xc57ab026
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
	.word	0x4b594e7c,0x9c47a94e,0xba8ccfb3,0x56f8fdfa
	.word	0x5317a465,0x04c685af,0xdf8af42f,0x8447cd5f
	.word	0x3829b1c2,0x9b2e5c82,0x7ffbc477,0xc727cf71
	.word	0xc44dc347,0xb6bd1e94,0x866c804d,0xb051662a
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
	.word	0xd2c46fab,0x61611459,0xc4d89b13,0x3741f12c
	.word	0x2e55cc2b,0x64db7653,0x2ce0798a,0x580c7ef8
	.word	0xb37058a8,0x1428fa21,0x627c52ad,0x0f3b87e9
	.word	0xdf712ac7,0x56dbeb7e,0xeb3bc258,0x93e09dfe
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
	.word	0x6b26c342,0xc90352a2,0xa41a702a,0x13876b2e
	.word	0xdf46d72a,0x9442646f,0xaa578b53,0xb7e40821
	.word	0x32c0fc82,0x93318abb,0xa8fbcaf5,0x1a856004
	.word	0x0542b5e2,0x2a7232f0,0x8fe3d4ec,0x3d356f5d
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
	.word	0xf9f60e05,0x3c70cee3,0x5273a38f,0x7fee6e24
	.word	0x92236e92,0xd303d2ce,0x12fb159c,0xf399fb61
	.word	0x3d8f6c31,0xcadf75ee,0x919c4ae1,0xfb7eb842
	.word	0x6c8eb036,0x89fff5dd,0x487ef861,0x15effd90
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
	.word	0xceccbdda,0x110cac56,0x32858245,0x487c30c3
	.word	0x038d0c6f,0x89b2e2bd,0x079e2c00,0x1e49fec9
	.word	0xc2b40ebb,0xb0c42538,0x1123110b,0xa282e87f
	.word	0x8b7d1d2d,0xdb18e563,0xd04808b7,0xa77b3f76
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
	.word	0x297fe946,0x1030f3bb,0x500a4ce7,0x85bc0023
	.word	0xd755630f,0x4616c801,0xa0182e7f,0xd42a75e0
	.word	0xb1c86ba3,0x513c3df7,0x56078ad3,0x90fb5ccf
	.word	0xb6179133,0x17937f0f,0x589e1785,0xcd4a7dbc
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
	.word	0xa9d9ccd2,0x3252de17,0xaf01ba15,0x5fb3f810
	.word	0xd364a9da,0x04ed1813,0x4fd3af3c,0xd1efd355
	.word	0x6d8d4e8c,0xb644550d,0xfe473183,0x8b39271f
	.word	0x2815cd2e,0xe67dabc1,0xab8de634,0x52966f1f
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
	.word	0xc491d254,0x2a0beb80,0x96a9d7b0,0xad40bccd
	.word	0x634b06a1,0x29ad2ce4,0x5727e874,0xf6cc8abd
	.word	0xd488a646,0x1a315cff,0x595e11c7,0x0710d380
	.word	0x909c4eed,0x836e8709,0xb181e1df,0x24c24b88
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
	.word	0xf264173e,0xef5a0afd,0xffb76198,0x97946159
	.word	0x1506448b,0xb6f43338,0xc95d38d7,0x21c5323f
	.word	0x6abf5bc0,0x9a8b5de6,0x4838317d,0x9ce5f11e
	.word	0x42afcd89,0x9e8cd5cc,0x3caf1050,0x6540383c
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
	.word	0x54360ebd,0xef0bfc1d,0xfaf59fa5,0xfe0c4ed0
	.word	0x43380ab3,0x691ec5b0,0xe7e8db9d,0x9da97487
	.word	0x5085344e,0x76f96546,0xfba52495,0x50c30c35
	.word	0x5b5c0c0b,0x4387f566,0xd29902f7,0x5027d04a
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
	.word	0xb9df78dd,0x807f980a,0x444b475d,0x994277b2
	.word	0xc51e0ba2,0xfa17dbfb,0xfe20eef2,0xa64097fe
	.word	0x1bc514b0,0xbd7eb60b,0x4a95ce68,0x30510163
	.word	0x5366a742,0x9c90feef,0x4a361d6d,0x616a5cee
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
	.word	0x56d03a20,0x037cf36c,0x1961fa13,0x3072f18d
	.word	0xf870eda1,0xaf12fed5,0x207fa94b,0xcf6c2a13
	.word	0x758ec0b7,0x19e49941,0xd731e1de,0xe63f31b3
	.word	0x9a830e4e,0x9e85a25a,0x3f38c3db,0x4a026c65
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
	.word	0x747075c1,0x3605c8b8,0x73c609b0,0x97354f09
	.word	0x39ea50ce,0xd21dffc4,0x1f784432,0xb2959b14
	.word	0x3633a2d5,0xe4eb9729,0x5681ba3a,0x42b60eb4
	.word	0x5511ba9e,0x219ee664,0x0bf8f617,0x3db12154
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
	.word	0x1fa6edbb,0x9a5bc1ac,0x709c4692,0xb35ddedc
	.word	0x3b91db55,0xa0b248f9,0x1434d037,0xe62d0cf1
	.word	0x54ef96e3,0x9575155f,0x8f612637,0xdaf61005
	.word	0x62ee9803,0x925aacaf,0xa36e91b3,0x2f4c6f53
	.word	0x1b19ecd0,0x6ed76079,0x22f8e395,0xc2eb1142
	.word	0x91ec12b5,0x9aa3c2f2,0x0fa7ea49,0xf6beed58
	.word	0xadd0f03e,0xa08ac409,0xfacbcc2b,0xd606b14c
	.word	0x96bb82b8,0x32f6e2c9,0x5543797f,0xfff98399
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
	.word	0xfe39877b,0xdb509472,0xa5282547,0x330972db
	.word	0xc0759970,0x51c5dd88,0x7c2ee3d1,0xb7e5d9e5
	.word	0xeecd1937,0xd272abc5,0x1507b25d,0x87930b51
	.word	0x70296e0d,0x23cd4b60,0xdd42d516,0xee989edc
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
	.word	0x14e5ddab,0x140a5683,0xf76cac04,0x3766cd6e
	.word	0x378a2b6c,0x8533c52e,0x0223fb96,0xf3e037ec
	.word	0x6cda1702,0x049c9290,0x8c8395c3,0x1395cad4
	.word	0xbb146f5c,0xe6b8a51d,0xb3ba408d,0xf166c325
	.word	0x27dfd2c8,0xc407232a,0x765946c6,0xc6749241
	.word	0x0e2bf1ee,0x64aabdef,0xc0cd4382,0x28185771
	.word	0xc6c5d1ae,0x7f044ec3,0x2970ea24,0xa4f4f8c2
	.word	0xfad28fcb,0x061a80b3,0x444d8c58,0x6565aa90
	.word	0x3ddb4ee0,0x6fbac26d,0x2250d472,0x524c4af9
	.word	0xe3916f9d,0xb4270d04,0x871990e5,0x91053e84
	.word	0x40af4cb8,0x1835c464,0x53b9505f,0x0ff134fc
	.word	0x50e8b025,0x3d142063,0x81a9b128,0x11af7b3f
	.word	0xbbec968e,0x4017e230,0x8030717b,0xf46379a1
	.word	0x030b7932,0x04641358,0x8c47335c,0xcb692e8a
	.word	0xf9762425,0xbc6abe90,0xdac03a95,0x50e907af
	.word	0x31e2445c,0xb6745d99,0xd5ed1c27,0xfe6068ce
	.word	0x8bdd9604,0x084bdbb6,0x1416d987,0x6936f5f8
	.word	0xafbdf2de,0x891da5b1,0x13a27d2d,0x9d9a886e
	.word	0x113f9d2b,0x3d116457,0x4ae9870a,0x57b4601b
	.word	0x80d78eb9,0xdf1ca2ec,0x1669228c,0x10d41c56
	.word	0x58a1d198,0x9ccf68b0,0x35a0eb64,0x2247efb9
	.word	0x6ec632f9,0x8772701c,0xb9dd0b87,0x3233f779
	.word	0x60248288,0x306ca232,0xec7a11f6,0x64f453da
	.word	0xad7127e2,0x303c0010,0x205bcf20,0x53625b60
	.word	0xe960f473,0xc7f90297,0x03563a19,0x250a043a
	.word	0x880493fc,0x39f83a18,0xa21b5d61,0xf667e195
	.word	0x675835c1,0x549a217c,0x3b2403f5,0x2f7ddca8
	.word	0xa243213c,0xffbb5847,0x46aa789f,0x75556b94
	.word	0xc5ad75f7,0x473a8709,0x78fec55d,0xaf3bbc02
	.word	0x8054831a,0x83e9e97c,0xf1ea332c,0x6c2ad524
	.word	0xfa944878,0x40308d86,0x26914997,0xa7352046
	.word	0x6ef86dc6,0x461aca30,0x33218b14,0x92272857
share3_end:
