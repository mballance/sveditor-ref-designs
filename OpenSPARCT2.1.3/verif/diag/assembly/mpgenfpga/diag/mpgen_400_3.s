/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_400_3.s
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
!	Seed = 327141853
!	Riesling can be on
!	1 Thread, 400 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_400_3.s created on Mar 27, 2009 (14:18:53)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_400_3 -p 1 -l 400

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
!	%f0  = dd703ad2 f2aedcae 2386b914 9701eb58
!	%f4  = 71a1adf2 dad74e52 5d3a04c9 4c248ccd
!	%f8  = 571bd858 1b907c48 e526033d ae793d12
!	%f12 = 76c0166d e7bb22af 555bb460 bcd86afe
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = fdeb1a21 a122b2fd d998614e 82615636
!	%f20 = 62d06a45 e62bab1e 846341a9 9d08997c
!	%f24 = 5e1cbf9e e0e3d30a b9a75eeb e4d51ac4
!	%f28 = 2ecb66ec 2befdfcc 08f2912c e725ae5f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = b07366b7 0aea1e63 8de62d12 f36ddbc5
!	%f36 = 24fc0181 95d01dc6 9f7b04af f677fd8b
!	%f40 = 794f5e27 60728529 a69170f2 f3dfabaa
!	%f44 = 0f60d100 01479fab dc915ee1 a457bd3a
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x0c942a3800000009,%g7,%g1 ! GSR scale =  1, align = 1
	wr	%g1,%g0,%gsr		! GSR = 0c942a3800000009
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l6 = 1653e384215d3066, Mem[0000000010181417] = 09d80d6e
	stb	%l6,[%i6+0x017]		! Mem[0000000010181414] = 09d80d66
!	Mem[0000000030081410] = 71ea1e28, %l6 = 1653e384215d3066
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000071ea1e28
!	Mem[0000000010141430] = 87998ea9, %l3 = 7d6e86cff6fc6f21
	ldub	[%i5+0x031],%l3		! %l3 = 0000000000000099
!	%f20 = 62d06a45 e62bab1e, Mem[0000000010041410] = 4a3ab556 65b71d14
	stda	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = 62d06a45 e62bab1e
!	Mem[0000000010001408] = 52db5111127ec32e, %f14 = 555bb460 bcd86afe
	ldda	[%i0+%o4]0x88,%f14	! %f14 = 52db5111 127ec32e
!	%l5 = 34dd0e65fb33e228, Mem[0000000010101410] = 351c621c
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 281c621c
!	Mem[0000000030001400] = 22275563, %l5 = 34dd0e65fb33e228
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 00000063000000ff
!	%f6  = 5d3a04c9, Mem[0000000030141408] = 5600a9b5
	sta	%f6 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 5d3a04c9
!	Mem[0000000030101408] = 5601f608, %l0 = 8653b8c63772654d
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = 0000000000005601
!	Starting 10 instruction Store Burst
!	%l2 = 7f2fb1c3df2f4541, Mem[0000000010181410] = 1ec2c2b0
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 1ec24541

p0_label_2:
!	%f26 = b9a75eeb, Mem[0000000010041400] = 06615072
	sta	%f26,[%i1+%g0]0x80	! Mem[0000000010041400] = b9a75eeb
!	Mem[0000000010081400] = 3b8b14fb, %l6 = 0000000071ea1e28
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 000000003b8b14fb
!	%l4 = e50fd359, %l5 = 00000063, Mem[0000000030041410] = bcceb37f ce81faba
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = e50fd359 00000063
!	Mem[0000000010141408] = b0bcf126, %l1 = ecea7b23b02b0543
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000026000000ff
!	%f19 = 82615636, Mem[0000000010101408] = c6127485
	sta	%f19,[%i4+%o4]0x88	! Mem[0000000010101408] = 82615636
!	%l2 = df2f4541, %l3 = 00000099, Mem[0000000010041410] = 62d06a45 e62bab1e
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = df2f4541 00000099
!	Mem[0000000030001408] = 78c7d513, %l2 = 7f2fb1c3df2f4541
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000013000000ff
!	%f28 = 2ecb66ec 2befdfcc, %l5 = 0000000000000063
!	Mem[0000000030181430] = 904306cea2291bf7
	add	%i6,0x030,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181430] = ccdfef2bec66cb2e
!	%f13 = e7bb22af, Mem[0000000010081408] = fbb53caa
	sta	%f13,[%i2+%o4]0x88	! Mem[0000000010081408] = e7bb22af
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = acfd6bdb465287a9, %l3 = 0000000000000099
	ldxa	[%i3+0x018]%asi,%l3	! %l3 = acfd6bdb465287a9

p0_label_3:
!	Mem[0000000010181408] = 9d63ab5cd663614a, %f4  = 71a1adf2 dad74e52
	ldda	[%i6+%o4]0x80,%f4 	! %f4  = 9d63ab5c d663614a
!	Mem[0000000010001420] = 167cf44aac3d4fa5, %f2  = 2386b914 9701eb58
	ldd	[%i0+0x020],%f2 	! %f2  = 167cf44a ac3d4fa5
!	Mem[0000000020800040] = 9cdd9ed5, %l2 = 0000000000000013
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000009cdd
!	Mem[0000000010181400] = dd1cb58a, %l2 = 0000000000009cdd
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffdd1cb58a
!	Mem[00000000100c1400] = 723b3187, %l6 = 000000003b8b14fb
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 00000000723b3187
!	Mem[0000000030041408] = 63cd6657d7158664, %f26 = b9a75eeb e4d51ac4
	ldda	[%i1+%o4]0x81,%f26	! %f26 = 63cd6657 d7158664
!	Mem[0000000030001400] = 789eac55222755ff, %f18 = d998614e 82615636
	ldda	[%i0+%g0]0x89,%f18	! %f18 = 789eac55 222755ff
!	Mem[0000000010141410] = 339c8846, %l2 = ffffffffdd1cb58a
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffff8846
!	Mem[0000000010181400] = dd1cb58ad4b2bcb9, %l7 = 7f5001e22e4c7c44
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = dd1cb58ad4b2bcb9
!	Starting 10 instruction Store Burst
!	%f4  = 9d63ab5c, %f0  = dd703ad2
	fcmps	%fcc2,%f4 ,%f0 		! %fcc2 = 2

p0_label_4:
!	%f8  = 571bd858, Mem[0000000010041420] = d315c112
	st	%f8 ,[%i1+0x020]	! Mem[0000000010041420] = 571bd858
!	Mem[0000000030001408] = ffd5c778, %l4 = 1587e005e50fd359
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f24 = 5e1cbf9e, Mem[0000000030141400] = 1f9c8876
	sta	%f24,[%i5+%g0]0x81	! Mem[0000000030141400] = 5e1cbf9e
!	%l6 = 00000000723b3187, Mem[0000000030041400] = 75113150
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 31873150
!	%l2 = ffff8846, %l3 = 465287a9, Mem[0000000010041410] = 41452fdf 99000000
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff8846 465287a9
!	%l1 = 0000000000000026, Mem[0000000010181408] = 9d63ab5c, %asi = 80
	stwa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000026
!	Mem[0000000010081410] = c2157062, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000c2157062
!	Mem[00000000211c0000] = c0c4f8e3, %l0 = 0000000000005601
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 000000c0000000ff
!	Mem[0000000010141400] = bad30960, %l3 = acfd6bdb465287a9
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 000000ba000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 131bd78e, %l5 = 0000000000000063
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000013

p0_label_5:
!	Mem[0000000010041400] = b9a75eeb, %l6 = 00000000723b3187
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = ffffffffb9a75eeb
!	Mem[0000000010041418] = 10a5a8e1d79b8d37, %l7 = dd1cb58ad4b2bcb9
	ldxa	[%i1+0x018]%asi,%l7	! %l7 = 10a5a8e1d79b8d37
!	Mem[00000000300c1410] = e9833bb1, %f14 = 52db5111
	lda	[%i3+%o5]0x89,%f14	! %f14 = e9833bb1
!	%l1 = 0000000000000026, immed = fffffc67, %y  = 00000000
	udiv	%l1,-0x399,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 000000c0
!	Mem[0000000030141400] = 5e1cbf9e, %l1 = 0000000000000026
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000005e1c
!	Mem[0000000030041408] = 63cd6657, %l7 = 10a5a8e1d79b8d37
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = 0000000063cd6657
!	%l4 = 00000000c2157062, %l3 = 00000000000000ba, %l7 = 0000000063cd6657
	sdivx	%l4,%l3,%l7		! %l7 = 00000000010b2042
!	Mem[0000000030141408] = c9043a5d 6f14a65c, %l0 = 000000c0, %l1 = 00005e1c
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000c9043a5d 000000006f14a65c
!	Mem[0000000030081400] = f5eca431, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000031
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffff8846, Mem[00000000211c0001] = ffc4f8e3
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ff46f8e3

p0_label_6:
!	Mem[0000000010141408] = fff1bcb0, %l4 = 00000000c2157062
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 00000000fff1bcb0
!	%l2 = ffffffffffff8846, Mem[00000000300c1410] = b13b83e9
	stba	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 463b83e9
!	Mem[0000000021800081] = 8af72f56, %l0 = 00000000c9043a5d
	ldstub	[%o3+0x081],%l0		! %l0 = 000000f7000000ff
!	%f16 = fdeb1a21 a122b2fd 789eac55 222755ff
!	%f20 = 62d06a45 e62bab1e 846341a9 9d08997c
!	%f24 = 5e1cbf9e e0e3d30a 63cd6657 d7158664
!	%f28 = 2ecb66ec 2befdfcc 08f2912c e725ae5f
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000030001410] = 17d51292bcc2d471, %f0  = dd703ad2 f2aedcae
	ldda	[%i0+%o5]0x89,%f0 	! %f0  = 17d51292 bcc2d471
!	Mem[0000000030141408] = 5d3a04c9, %l6 = 0000000000000031
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 000000005d3a04c9
!	%f2  = 167cf44a ac3d4fa5, Mem[0000000010041400] = eb5ea7b9 7f1ac3d1
	stda	%f2 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 167cf44a ac3d4fa5
!	%l6 = 000000005d3a04c9, %l7 = 00000000010b2042, %l5 = 0000000000000013
	or	%l6,%l7,%l5		! %l5 = 000000005d3b24cb
!	Mem[0000000030141410] = bce96778, %l0 = 00000000000000f7
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 00000000bce96778
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 9e08c4ab6e5c9f05, %l6 = 000000005d3a04c9
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = 9e08c4ab6e5c9f05

p0_label_7:
!	Mem[0000000010081410] = ff000000, %l0 = 00000000bce96778
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181438] = 15eae64ec2ebfb0f, %l0 = 00000000000000ff
	ldxa	[%i6+0x038]%asi,%l0	! %l0 = 15eae64ec2ebfb0f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030141400] = 5e1cbf9e a72c8bce 31000000 6f14a65c
!	Mem[0000000030141410] = f7000000 a9ef1483 5645428b 01e1fefc
!	Mem[0000000030141420] = 624f4626 ed6217f6 c51d1167 e5e46590
!	Mem[0000000030141430] = 2e59b529 ac50e74e 0ce958dc d7e531f2
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	%l6 = 9e08c4ab6e5c9f05, immed = 00000c18, %y  = 000000c0
	smul	%l6,0xc18,%l2		! %l2 = 00000536b0232478, %y = 00000536
!	%l3 = 00000000000000ba, immd = 0000000000000fa6, %l7 = 00000000010b2042
	sdivx	%l3,0xfa6,%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 36566182d38fd53c, %l4 = 00000000fff1bcb0
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 36566182d38fd53c
!	Mem[0000000030001410] = 17d51292bcc2d471, %l4 = 36566182d38fd53c
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 17d51292bcc2d471
!	Mem[0000000030041410] = e50fd359, %l4 = 17d51292bcc2d471
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000059
!	Mem[00000000300c1408] = 663574f6, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = fffffffffffffff6
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000026, %l5 = 000000005d3b24cb
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000026

p0_label_8:
!	%l4 = 0000000000000059, Mem[0000000010001420] = 167cf44aac3d4fa5
	stx	%l4,[%i0+0x020]		! Mem[0000000010001420] = 0000000000000059
!	%l7 = fffffffffffffff6, Mem[0000000030001410] = 17d51292bcc2d471
	stxa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = fffffffffffffff6
!	Mem[000000001000140a] = 2ec37e12, %l3 = 00000000000000ba
	ldstub	[%i0+0x00a],%l3		! %l3 = 0000007e000000ff
	membar	#Sync			! Added by membar checker (2)
!	%l3 = 000000000000007e, Mem[0000000030141408] = 310000006f14a65c
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000000000007e
!	%f14 = e9833bb1 127ec32e, Mem[0000000030101410] = e62bab1e 62d06a45
	stda	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = e9833bb1 127ec32e
!	Mem[00000000201c0001] = 131bd78e, %l1 = 000000006f14a65c
	ldstub	[%o0+0x001],%l1		! %l1 = 0000001b000000ff
!	%f16 = ce8b2ca7 9ebf1c5e, %l4 = 0000000000000059
!	Mem[0000000010181418] = 53230d4d2cda11d4
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_P ! Mem[0000000010181418] = ce8b0d4d2cda1c5e
!	Mem[0000000030001410] = f6ffffff, %l3 = 000000000000007e
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000f6000000ff
!	%l4 = 0000000000000059, Mem[0000000010181408] = 5d3b24cb
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000059
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 13ffd78e, %l1 = 000000000000001b
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000013ff

p0_label_9:
!	Mem[0000000030081400] = f5eca431, %l7 = fffffffffffffff6
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = fffffffff5eca431
!	Mem[00000000300c1408] = 663574f6, %l2 = 00000536b0232478
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 00000000663574f6
!	Mem[0000000010101408] = 3cd58fd382615636, %f8  = 571bd858 1b907c48
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = 3cd58fd3 82615636
!	Mem[0000000030181400] = 1b693703, %l6 = 9e08c4ab6e5c9f05
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000003703
!	%l7 = fffffffff5eca431, imm = fffffffffffff05d, %l3 = 00000000000000f6
	orn	%l7,-0xfa3,%l3		! %l3 = fffffffff5ecafb3
!	Mem[0000000010141400] = ffd30960, %f4  = 9d63ab5c
	lda	[%i5+%g0]0x80,%f4 	! %f4 = ffd30960
!	%l4 = 0000000000000059, imm = 000000000000037e, %l5 = 0000000000000026
	andn	%l4,0x37e,%l5		! %l5 = 0000000000000001
!	Mem[0000000010041408] = aca4d927, %l6 = 0000000000003703
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffd927
!	Mem[0000000010101408] = 36566182, %l6 = ffffffffffffd927
	lduw	[%i4+%o4],%l6		! %l6 = 0000000036566182
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 723b3187, %l7 = fffffffff5eca431
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000723b3187

p0_label_10:
!	%f31 = dc58e90c, %f9  = 82615636
	fsqrts	%f31,%f9 		! %f9  = 7fffffff
!	%l7 = 00000000723b3187, Mem[0000000010101410] = 281c621c
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 3187621c
!	%f22 = fcfee101, Mem[00000000100c1400] = 31a4ecf5
	st	%f22,[%i3+%g0]		! Mem[00000000100c1400] = fcfee101
!	Mem[0000000010041409] = 27d9a4ac, %l2 = 00000000663574f6
	ldstuba	[%i1+0x009]%asi,%l2	! %l2 = 000000d9000000ff
!	Mem[0000000010041408] = 27ffa4acae8f020f, %f22 = fcfee101 8b424556
	ldda	[%i1+0x008]%asi,%f22	! %f22 = 27ffa4ac ae8f020f
!	%f18 = 5ca6146f, Mem[0000000030181410] = 797054f1
	sta	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 5ca6146f
!	%l6 = 0000000036566182, Mem[0000000030081408] = b1f7f919
	stba	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 82f7f919
!	%l1 = 00000000000013ff, Mem[00000000100c1410] = ed5ee23a
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000013ff
!	%f0  = 17d51292 bcc2d471 167cf44a ac3d4fa5
!	%f4  = ffd30960 d663614a 5d3a04c9 4c248ccd
!	%f8  = 3cd58fd3 7fffffff e526033d ae793d12
!	%f12 = 76c0166d e7bb22af e9833bb1 127ec32e
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 8a7778b5, %l1 = 00000000000013ff
	ldsba	[%i4+0x038]%asi,%l1	! %l1 = ffffffffffffff8a

p0_label_11:
!	Mem[0000000010041408] = 27ffa4ac, %l3 = fffffffff5ecafb3
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000027
!	Mem[0000000010081408] = e7bb22af, %l1 = ffffffffffffff8a
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = ffffffffffffffaf
!	Mem[00000000100c143c] = 40198134, %l0 = 15eae64ec2ebfb0f
	lduw	[%i3+0x03c],%l0		! %l0 = 0000000040198134
!	Mem[0000000030141400] = 5e1cbf9e, %l6 = 0000000036566182
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 000000000000005e
!	Mem[00000000100c1410] = ff130000, %l3 = 0000000000000027
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = f7000000, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l3	! %l3 = 000000000000f700
!	Mem[0000000010081408] = af22bbe7, %l7 = 00000000723b3187
	ldsw	[%i2+%o4],%l7		! %l7 = ffffffffaf22bbe7
!	Mem[0000000010181438] = 15eae64ec2ebfb0f, %l0 = 0000000040198134
	ldx	[%i6+0x038],%l0		! %l0 = 15eae64ec2ebfb0f
!	Mem[0000000010181408] = 00000059, %l6 = 000000000000005e
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000f700, Mem[0000000010141428] = cf2e94a28e551f71, %asi = 80
	stxa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = 000000000000f700

p0_label_12:
!	%l2 = 00000000000000d9, Mem[00000000100c1408] = ef806385
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000d9
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010001418] = cd8c244c, %l6 = 0000000000000000
	ldstub	[%i0+0x018],%l6		! %l6 = 000000cd000000ff
!	%l1 = ffffffffffffffaf, Mem[0000000030141408] = 7e00000000000000
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffffaf
!	%l5 = 0000000000000001, Mem[0000000010141414] = 655965cc
	sth	%l5,[%i5+0x014]		! Mem[0000000010141414] = 000165cc
!	Mem[00000000218001c1] = 773a7cbf, %l3 = 000000000000f700
	ldstuba	[%o3+0x1c1]%asi,%l3	! %l3 = 0000003a000000ff
!	%l3 = 000000000000003a, Mem[0000000010081407] = a8803c86, %asi = 80
	stba	%l3,[%i2+0x007]%asi	! Mem[0000000010081404] = a8803c3a
!	%f6  = 5d3a04c9 4c248ccd, Mem[0000000010181420] = 3df622d8 e4eb15fc
	stda	%f6 ,[%i6+0x020]%asi	! Mem[0000000010181420] = 5d3a04c9 4c248ccd
!	%l5 = 0000000000000001, Mem[000000001008142b] = 4488041c, %asi = 80
	stba	%l5,[%i2+0x02b]%asi	! Mem[0000000010081428] = 44880401
!	%l3 = 000000000000003a, Mem[0000000010181426] = 4c248ccd
	sth	%l3,[%i6+0x026]		! Mem[0000000010181424] = 4c24003a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 463b83e91eb42ac5, %l0 = 15eae64ec2ebfb0f
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = 463b83e91eb42ac5

p0_label_13:
!	Mem[0000000030101408] = ff55272255ac9e78, %f2  = 167cf44a ac3d4fa5
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = ff552722 55ac9e78
!	Mem[0000000020800000] = 4ef1a156, %l3 = 000000000000003a
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000004ef1
!	Mem[0000000030101408] = 789eac55222755ff, %f0  = 17d51292 bcc2d471
	ldda	[%i4+%o4]0x89,%f0 	! %f0  = 789eac55 222755ff
!	Mem[0000000010181410] = 4145c21e09d80d66, %f16 = ce8b2ca7 9ebf1c5e
	ldda	[%i6+%o5]0x80,%f16	! %f16 = 4145c21e 09d80d66
!	Mem[0000000030081408] = 2763e568 19f9f782, %l4 = 00000059, %l5 = 00000001
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 0000000019f9f782 000000002763e568
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 463b83e91eb42ac5
	setx	0x6fbd9bc02a8462f3,%g7,%l0 ! %l0 = 6fbd9bc02a8462f3
!	%l1 = ffffffffffffffaf
	setx	0x0500a98ff651ac70,%g7,%l1 ! %l1 = 0500a98ff651ac70
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6fbd9bc02a8462f3
	setx	0x9dd1bbefeb1a82ea,%g7,%l0 ! %l0 = 9dd1bbefeb1a82ea
!	%l1 = 0500a98ff651ac70
	setx	0xcb3003181c9ce6d0,%g7,%l1 ! %l1 = cb3003181c9ce6d0
!	%f11 = ae793d12, %f26 = 9065e4e5, %f12 = 76c0166d e7bb22af
	fsmuld	%f11,%f26,%f12		! %f12 = 37ebfa4f 4e352340
!	Mem[00000000300c1400] = f6b7691630872293, %f30 = f231e5d7 dc58e90c
	ldda	[%i3+%g0]0x81,%f30	! %f30 = f6b76916 30872293
!	Mem[0000000010141410] = 46889c33 000165cc, %l2 = 000000d9, %l3 = 00004ef1
	ldda	[%i5+0x010]%asi,%l2	! %l2 = 0000000046889c33 00000000000165cc
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = f7000000, %l2 = 0000000046889c33
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 000000f7000000ff

p0_label_14:
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 9dd1bbefeb1a82ea
	setx	0x0d12d9c054cbf968,%g7,%l0 ! %l0 = 0d12d9c054cbf968
!	%l1 = cb3003181c9ce6d0
	setx	0xdbe6f1182eb76ccd,%g7,%l1 ! %l1 = dbe6f1182eb76ccd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0d12d9c054cbf968
	setx	0x324e27983533c293,%g7,%l0 ! %l0 = 324e27983533c293
!	%l1 = dbe6f1182eb76ccd
	setx	0x5fdf770f8858af20,%g7,%l1 ! %l1 = 5fdf770f8858af20
!	Mem[0000000010181400] = 8ab51cdd, %l6 = 00000000000000cd
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000dd000000ff
!	Mem[0000000030141410] = 000000ff, %l7 = ffffffffaf22bbe7
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%f16 = 4145c21e 09d80d66 5ca6146f 00000031
!	%f20 = 8314efa9 000000f7 27ffa4ac ae8f020f
!	%f24 = f61762ed 26464f62 9065e4e5 67111dc5
!	%f28 = 4ee750ac 29b5592e f6b76916 30872293
	stda	%f16,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%f16 = 4145c21e 09d80d66 5ca6146f 00000031
!	%f20 = 8314efa9 000000f7 27ffa4ac ae8f020f
!	%f24 = f61762ed 26464f62 9065e4e5 67111dc5
!	%f28 = 4ee750ac 29b5592e f6b76916 30872293
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	%f0  = 789eac55 222755ff ff552722 55ac9e78
!	%f4  = ffd30960 d663614a 5d3a04c9 4c248ccd
!	%f8  = 3cd58fd3 7fffffff e526033d ae793d12
!	%f12 = 37ebfa4f 4e352340 e9833bb1 127ec32e
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (4)
!	%f16 = 4145c21e 09d80d66 5ca6146f 00000031
!	%f20 = 8314efa9 000000f7 27ffa4ac ae8f020f
!	%f24 = f61762ed 26464f62 9065e4e5 67111dc5
!	%f28 = 4ee750ac 29b5592e f6b76916 30872293
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Mem[00000000201c0000] = 13ffd78e, %l6 = 00000000000000dd
	ldstub	[%o0+%g0],%l6		! %l6 = 00000013000000ff
!	Mem[0000000030101408] = 5ca6146f, %l0 = 324e27983533c293
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 0000005c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = c71998b3, %l0 = 000000000000005c
	ldswa	[%i2+0x024]%asi,%l0	! %l0 = ffffffffc71998b3

p0_label_15:
!	Mem[00000000100c1410] = ff130000, %l3 = 00000000000165cc
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = fcfee101 ed0d8775, %l6 = 00000013, %l7 = 000000ff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000fcfee101 00000000ed0d8775
!	Mem[0000000010101428] = 27d25e9e, %l4 = 0000000019f9f782
	ldswa	[%i4+0x028]%asi,%l4	! %l4 = 0000000027d25e9e
!	Mem[00000000100c1410] = f3e5d6a7 ff130000, %l6 = fcfee101, %l7 = ed0d8775
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000ff130000 00000000f3e5d6a7
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030181410] = f7000000, %l2 = 00000000000000f7
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000f7
!	Mem[0000000010041410] = 4688ffff, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000046
!	Mem[0000000010101410] = 3187621c, %l5 = 000000002763e568
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 000000003187621c
!	Mem[000000001004143c] = 42b53550, %f31 = 30872293
	lda	[%i1+0x03c]%asi,%f31	! %f31 = 42b53550
!	Mem[0000000010141400] = b8f3f147 6009d3ff, %l0 = c71998b3, %l1 = 8858af20
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 000000006009d3ff 00000000b8f3f147
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000046, Mem[0000000010101410] = d320921e1c628731
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000046

p0_label_16:
!	Mem[0000000010101400] = 28383b35, %l6 = 00000000ff130000
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000028000000ff
!	%f14 = e9833bb1 127ec32e, %l3 = 0000000000000046
!	Mem[0000000010101438] = 8a7778b51ebf1d31
	add	%i4,0x038,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101438] = 8a773bb1127e1d31
!	Mem[0000000010041410] = 4688ffff, %l5 = 000000003187621c
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000004688ffff
!	Mem[00000000211c0001] = ff46f8e3, %l7 = 00000000f3e5d6a7
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000046000000ff
!	Mem[00000000300c1400] = f6b76916, %l2 = 00000000000000f7
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 000000f6000000ff
!	Mem[0000000010081420] = daeaa2f9, %l7 = 0000000000000046, %asi = 80
	swapa	[%i2+0x020]%asi,%l7	! %l7 = 00000000daeaa2f9
!	Mem[0000000030081410] = 66305d21, %l1 = 00000000b8f3f147
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 0000000066305d21
!	Mem[0000000010101408] = 36566182, %l7 = 00000000daeaa2f9
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000036000000ff
!	%l1 = 0000000066305d21, Mem[00000000300c1410] = 463b83e9
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 213b83e9
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000031, %l5 = 000000004688ffff
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000031

p0_label_17:
!	Mem[00000000300c1408] = f6743566 73da9dfe, %l4 = 27d25e9e, %l5 = 00000031
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000f6743566 0000000073da9dfe
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 000000006009d3ff
	setx	0x5c1fbc47dcc7334c,%g7,%l0 ! %l0 = 5c1fbc47dcc7334c
!	%l1 = 0000000066305d21
	setx	0x9d7951578b6c5b08,%g7,%l1 ! %l1 = 9d7951578b6c5b08
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5c1fbc47dcc7334c
	setx	0x28f3506fe0169773,%g7,%l0 ! %l0 = 28f3506fe0169773
!	%l1 = 9d7951578b6c5b08
	setx	0xc27b37ef848ba6c3,%g7,%l1 ! %l1 = c27b37ef848ba6c3
!	Mem[0000000030141410] = 000000ff, %l1 = c27b37ef848ba6c3
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = 55ac9e78, %l2 = 00000000000000f6
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 0000000055ac9e78
!	Mem[0000000010101410] = 46000000, %l4 = 00000000f6743566
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = 0000000000004600
!	Mem[0000000010041408] = 27ffa4acae8f020f, %f30 = f6b76916 42b53550
	ldda	[%i1+%o4]0x80,%f30	! %f30 = 27ffa4ac ae8f020f
!	Mem[0000000030141400] = 5e1cbf9e, %l1 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 000000005e1cbf9e
!	Mem[0000000010081400] = 281eea71, %l1 = 000000005e1cbf9e
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = 000000000000281e
!	Mem[00000000211c0000] = fffff8e3, %l3 = 0000000000000046
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c1] = 36b41dd1, %l0 = 28f3506fe0169773
	ldstuba	[%o3+0x0c1]%asi,%l0	! %l0 = 000000b4000000ff

p0_label_18:
!	Mem[0000000030101408] = ffa6146f, %l5 = 0000000073da9dfe
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ffa6146f
!	%f18 = 5ca6146f 00000031, Mem[00000000100c1400] = 01e1fefc 75870ded
	stda	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5ca6146f 00000031
!	Mem[0000000010081408] = af22bbe7, %l5 = 00000000ffa6146f
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000af22bbe7
!	%l0 = 00000000000000b4, Mem[00000000100c1410] = ff130000
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff1300b4
!	Mem[0000000021800080] = 8aff2f56, %l4 = 0000000000004600
	ldstuba	[%o3+0x080]%asi,%l4	! %l4 = 0000008a000000ff
!	%l3 = 000000000000ffff, Mem[00000000100c1408] = 000000d9
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[00000000100c140c] = 8d02ee87, %l3 = 000000000000ffff, %asi = 80
	swapa	[%i3+0x00c]%asi,%l3	! %l3 = 000000008d02ee87
!	%l6 = 00000028, %l7 = 00000036, Mem[0000000010101418] = a58d8831 2b180884
	std	%l6,[%i4+0x018]		! Mem[0000000010101418] = 00000028 00000036
!	Mem[0000000030041408] = ff552722, %l6 = 0000000000000028
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff552722
!	Starting 10 instruction Load Burst
!	%l5 = 00000000af22bbe7, Mem[0000000020800040] = 9cdd9ed5
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = bbe79ed5

p0_label_19:
!	Mem[0000000030141408] = afffffffffffffff, %f20 = 8314efa9 000000f7
	ldda	[%i5+%o4]0x81,%f20	! %f20 = afffffff ffffffff
!	Mem[0000000010141408] = c2157062b73cc1cd, %l1 = 000000000000281e
	ldxa	[%i5+0x008]%asi,%l1	! %l1 = c2157062b73cc1cd
!	Mem[00000000211c0000] = fffff8e3, %l1 = c2157062b73cc1cd
	ldsb	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 6009d3ff, %l1 = ffffffffffffffff
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 000000000000d3ff
!	Mem[0000000010041404] = 4af47c16, %l6 = 00000000ff552722
	ldswa	[%i1+0x004]%asi,%l6	! %l6 = 000000004af47c16
!	Mem[0000000030081408] = 82f7f919, %l1 = 000000000000d3ff
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000082
!	Mem[00000000300c1408] = 663574f6, %l4 = 000000000000008a
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 00000000000074f6
!	%f29 = 29b5592e, %f16 = 4145c21e, %f28 = 4ee750ac 29b5592e
	fsmuld	%f29,%f16,%f28		! %f28 = 3d7182e4 6769ec80
!	Mem[0000000030181400] = 660dd809, %l5 = 00000000af22bbe7
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000660d
!	Starting 10 instruction Store Burst
!	%l2 = 0000000055ac9e78, Mem[0000000010041436] = 634de226, %asi = 80
	stba	%l2,[%i1+0x036]%asi	! Mem[0000000010041434] = 634d7826

p0_label_20:
!	Mem[0000000010041410] = 1c628731, %l2 = 0000000055ac9e78
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 000000001c628731
!	Mem[0000000010001408] = a54f3dac, %l7 = 0000000000000036
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000a5000000ff
!	Mem[0000000030081410] = b8f3f147, %l0 = 00000000000000b4
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000b8f3f147
!	%l2 = 000000001c628731, Mem[0000000010001408] = ff4f3dac
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 87313dac
!	%l5 = 000000000000660d, Mem[00000000300c1408] = f674356673da9dfe
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000000000660d
!	%l4 = 00000000000074f6, immed = fffff1cd, %y  = 00000536
	sdiv	%l4,-0xe33,%l0		! %l0 = ffffffffa20d1965
	mov	%l0,%y			! %y = a20d1965
!	Mem[0000000030101410] = 8314efa9, %l5 = 000000000000660d
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000083000000ff
!	%l1 = 0000000000000082, Mem[0000000010141410] = 339c8846
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 339c8882
!	Mem[0000000030141400] = 5e1cbf9e, %l6 = 000000004af47c16
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 000000005e1cbf9e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff566182, %l7 = 00000000000000a5
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffff566182

p0_label_21:
!	Mem[0000000010101410] = 4600000000000000, %f30 = 27ffa4ac ae8f020f
	ldda	[%i4+%o5]0x80,%f30	! %f30 = 46000000 00000000
!	Mem[0000000030141400] = 167cf44a, %l7 = ffffffffff566182
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = fffffffffffff44a
!	Mem[0000000010041418] = 10a5a8e1 d79b8d37, %l2 = 1c628731, %l3 = 8d02ee87
	ldda	[%i1+0x018]%asi,%l2	! %l2 = 0000000010a5a8e1 00000000d79b8d37
!	%l2 = 0000000010a5a8e1, %l1 = 0000000000000082, %l1 = 0000000000000082
	sdivx	%l2,%l1,%l1		! %l1 = 000000000020c830
!	Mem[0000000030001400] = 222755ff, %l7 = fffffffffffff44a
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 00000000222755ff
!	Mem[0000000010001408] = 167cf44aac3d3187, %f16 = 4145c21e 09d80d66
	ldda	[%i0+%o4]0x88,%f16	! %f16 = 167cf44a ac3d3187
!	Mem[0000000010001408] = 87313dac, %f20 = afffffff
	lda	[%i0+%o4]0x80,%f20	! %f20 = 87313dac
!	%f5  = d663614a, %f7  = 4c248ccd, %f3  = 55ac9e78
	fdivs	%f5 ,%f7 ,%f3 		! %f3  = c9b0dfc9
!	Mem[0000000020800040] = bbe79ed5, %l6 = 000000005e1cbf9e
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffbbe7
!	Starting 10 instruction Store Burst
!	%l1 = 000000000020c830, Mem[0000000010141408] = 627015c2
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 6270c830

p0_label_22:
!	Mem[0000000030081400] = f5eca431, %l1 = 000000000020c830
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000f5eca431
!	Mem[0000000010041422] = 571bd858, %l3 = 00000000d79b8d37
	ldstub	[%i1+0x022],%l3		! %l3 = 000000d8000000ff
!	%l5 = 0000000000000083, Mem[0000000010001410] = 4a6163d6, %asi = 80
	stwa	%l5,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000083
!	%f14 = e9833bb1 127ec32e, Mem[0000000010181410] = 4145c21e 09d80d66
	stda	%f14,[%i6+%o5]0x80	! Mem[0000000010181410] = e9833bb1 127ec32e
!	%l3 = 00000000000000d8, Mem[0000000030181400] = 09d80d66
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 09d80dd8
!	Mem[00000000211c0001] = fffff8e3, %l0 = ffffffffa20d1965
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[000000001018142d] = 42d0fcb0, %l4 = 00000000000074f6
	ldstub	[%i6+0x02d],%l4		! %l4 = 000000d0000000ff
!	Mem[0000000010181408] = 00000059, %l2 = 0000000010a5a8e1
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000083, Mem[0000000010141408] = 6270c830
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000083
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 27ffa4ac, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 00000000000027ff

p0_label_23:
!	Mem[0000000010001410] = 00000083, %l4 = 00000000000000d0
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000083
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000000000d8
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000222755ff
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 000000000000660d, %l0 = 00000000000027ff
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = 000000000000660d
!	Mem[0000000010141400] = ffd3096047f1f3b8, %l1 = 00000000f5eca431
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = ffd3096047f1f3b8
!	Mem[0000000030041408] = 28000000, %l4 = 0000000000000083
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = ff552722, %l1 = ffd3096047f1f3b8
	lduba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 82889c33, %l6 = ffffffffffffbbe7
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffff82
!	Mem[0000000020800040] = bbe79ed5, %l6 = ffffffffffffff82
	lduba	[%o1+0x041]%asi,%l6	! %l6 = 00000000000000e7
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000211c0001] = fffff8e3
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ff00f8e3

p0_label_24:
!	Mem[0000000020800000] = 4ef1a156, %l4 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 0000004e000000ff
!	%f15 = 127ec32e, Mem[0000000030041408] = 28000000
	sta	%f15,[%i1+%o4]0x89	! Mem[0000000030041408] = 127ec32e
!	%l5 = 0000000000000083, Mem[0000000010001410] = ffd3096083000000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000083
!	Mem[0000000030141408] = ffffffaf, %l5 = 0000000000000083
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 000000af000000ff
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001018141c] = 2cda1c5e, %l7 = 0000000000000000
	ldstuba	[%i6+0x01c]%asi,%l7	! %l7 = 0000002c000000ff
!	Mem[0000000010141410] = 82889c33, %l6 = 00000000000000e7, %asi = 80
	swapa	[%i5+0x010]%asi,%l6	! %l6 = 0000000082889c33
!	%l6 = 82889c33, %l7 = 0000002c, Mem[0000000010081408] = ffa6146f 80a6133f
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 82889c33 0000002c
!	%f6  = 5d3a04c9, Mem[0000000010081428] = 44880401
	st	%f6 ,[%i2+0x028]	! Mem[0000000010081428] = 5d3a04c9
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 30c82000, %l0 = 000000000000660d
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 0000000030c82000

p0_label_25:
!	Mem[0000000030101408] = 31000000 fe9dda73, %l4 = 0000004e, %l5 = 000000af
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000fe9dda73 0000000031000000
!	Mem[0000000010181400] = ff1cb58ad4b2bcb9, %f20 = 87313dac ffffffff
	ldda	[%i6+%g0]0x80,%f20	! %f20 = ff1cb58a d4b2bcb9
!	Mem[0000000030101410] = a9ef14ff, %f12 = 37ebfa4f
	lda	[%i4+%o5]0x89,%f12	! %f12 = a9ef14ff
!	Mem[0000000010181434] = 95345268, %l2 = 00000000000000ff
	ldsba	[%i6+0x034]%asi,%l2	! %l2 = ffffffffffffff95
!	Mem[0000000030001410] = ffffffffffffffff, %l7 = 000000000000002c
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141408] = 00000083, %l1 = 00000000000000ff
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000083
!	Mem[0000000010081408] = 82889c330000002c, %f12 = a9ef14ff 4e352340
	ldd	[%i2+%o4],%f12		! %f12 = 82889c33 0000002c
!	%f28 = 3d7182e4, %f18 = 5ca6146f
	fcmps	%fcc0,%f28,%f18		! %fcc0 = 1
!	Mem[0000000010181418] = ce8b0d4d, %l7 = ffffffffffffffff
	lduha	[%i6+0x01a]%asi,%l7	! %l7 = 0000000000000d4d
!	Starting 10 instruction Store Burst
!	%l5 = 0000000031000000, Mem[0000000030081400] = 30c82000
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 31000000

p0_label_26:
!	%f25 = 26464f62, Mem[0000000030141400] = 167cf44a
	sta	%f25,[%i5+%g0]0x89	! Mem[0000000030141400] = 26464f62
!	%l0 = 0000000030c82000, %l6 = 0000000082889c33, %l6 = 0000000082889c33
	xor	%l0,%l6,%l6		! %l6 = 00000000b240bc33
!	%l0 = 0000000030c82000, Mem[00000000300c1400] = ffb76916
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 30c82000
!	%f16 = 167cf44a ac3d3187, Mem[0000000030081408] = 19f9f782 2763e568
	stda	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = 167cf44a ac3d3187
!	%l1 = 0000000000000083, Mem[0000000030041400] = 789eac55
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000083
!	Mem[00000000100c1420] = 061198020bf46051, %l4 = 00000000fe9dda73, %l6 = 00000000b240bc33
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 061198020bf46051
!	%l6 = 061198020bf46051, Mem[0000000010081408] = 82889c33
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 60519c33
!	%l3 = ffffffffffffffff, Mem[0000000030141410] = ff000000
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	Mem[000000001008142c] = 6bc12be7, %l0 = 0000000030c82000
	swap	[%i2+0x02c],%l0		! %l0 = 000000006bc12be7
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000031, %l5 = 0000000031000000
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000031

p0_label_27:
!	%l4 = 00000000fe9dda73, %l3 = ffffffffffffffff, %y  = a20d1965
	smul	%l4,%l3,%l4		! %l4 = 000000000162258d, %y = 00000000
!	Mem[0000000010141420] = 2f30d7e0, %l7 = 0000000000000d4d
	ldsba	[%i5+0x023]%asi,%l7	! %l7 = ffffffffffffffe0
!	Mem[00000000100c1408] = 000000000000ffff, %l6 = 061198020bf46051
	ldx	[%i3+%o4],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030081400] = 31000000, %l3 = ffffffffffffffff
	ldsba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000031
!	Mem[0000000030001400] = 222755ff, %l5 = 0000000000000031
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 00000000000055ff
!	Mem[0000000010101410] = 00000046, %l0 = 000000006bc12be7
	lduha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000046
!	Mem[0000000010181410] = e9833bb1127ec32e, %f8  = 3cd58fd3 7fffffff
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = e9833bb1 127ec32e
!	Mem[0000000010041408] = 27ffa4ac ae8f020f, %l4 = 0162258d, %l5 = 000055ff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 0000000027ffa4ac 00000000ae8f020f
!	Mem[0000000010101400] = ff383b35 f5e23b2c, %l2 = ffffff95, %l3 = 00000031
	ldda	[%i4+0x000]%asi,%l2	! %l2 = 00000000ff383b35 00000000f5e23b2c
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 60519c33, %l3 = 00000000f5e23b2c
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000060000000ff

p0_label_28:
!	%l2 = 00000000ff383b35, Mem[0000000010101408] = 826156ff
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff383b35
!	%l5 = 00000000ae8f020f, Mem[0000000010181400] = 8ab51cff
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 8ab51c0f
!	Mem[0000000020800040] = bbe79ed5, %l1 = 0000000000000083
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 000000bb000000ff
!	%l6 = 000000000000ffff, Mem[0000000010181410] = b13b83e9
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = b13b83ff
!	%l6 = 000000000000ffff, Mem[000000001010142c] = 21ae4791, %asi = 80
	stha	%l6,[%i4+0x02c]%asi	! Mem[000000001010142c] = ffff4791
!	Mem[0000000010101400] = ff383b35, %l3 = 0000000000000060
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ff383b35
!	%l2 = 00000000ff383b35, Mem[000000001008140a] = ff519c33
	sth	%l2,[%i2+0x00a]		! Mem[0000000010081408] = ff513b35
!	%l1 = 00000000000000bb, Mem[00000000100c1432] = cf6e1d7e
	sth	%l1,[%i3+0x032]		! Mem[00000000100c1430] = cf6e00bb
!	Mem[0000000010141408] = 00000083, %l4 = 0000000027ffa4ac
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 00000083000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 09d80dd8, %l0 = 0000000000000046
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000d8

p0_label_29:
!	%l1 = 00000000000000bb, immed = 00000e31, %y  = 00000000
	smul	%l1,0xe31,%l2		! %l2 = 00000000000a5dcb, %y = 00000000
!	Mem[0000000010101428] = 27d25e9effff4791, %f12 = 82889c33 0000002c
	ldda	[%i4+0x028]%asi,%f12	! %f12 = 27d25e9e ffff4791
!	Mem[0000000010041410] = 789eac55, %l4 = 0000000000000083
	ldsha	[%i1+0x010]%asi,%l4	! %l4 = 000000000000789e
!	Mem[0000000010041408] = aca4ff27, %f9  = 127ec32e
	lda	[%i1+%o4]0x88,%f9 	! %f9 = aca4ff27
!	Mem[0000000010001400] = 71d4c2bc 9212d517, %l4 = 0000789e, %l5 = ae8f020f
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000071d4c2bc 000000009212d517
!	%l3 = 00000000ff383b35, immd = fffffffffffff275, %l6 = 000000000000ffff
	udivx	%l3,-0xd8b,%l6		! %l6 = 0000000000000000
!	Mem[0000000030181410] = 8314efa9000000f7, %f2  = ff552722 c9b0dfc9
	ldda	[%i6+%o5]0x89,%f2 	! %f2  = 8314efa9 000000f7
!	Mem[0000000010181410] = b13b83ff, %l6 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = ffffffffffff83ff
!	Mem[0000000030041408] = 127ec32e, %l1 = 00000000000000bb
	ldsba	[%i1+%o4]0x89,%l1	! %l1 = 000000000000002e
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 2ec37e12, %l6 = ffffffffffff83ff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 0000002e000000ff

p0_label_30:
!	Mem[0000000010041410] = 789eac55, %l1 = 000000000000002e
	swap	[%i1+%o5],%l1		! %l1 = 00000000789eac55
!	%f23 = ae8f020f, Mem[0000000010181408] = 590000ff
	sta	%f23,[%i6+%o4]0x88	! Mem[0000000010181408] = ae8f020f
!	%f24 = f61762ed, Mem[0000000010101400] = 00000060
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = f61762ed
!	%l4 = 0000000071d4c2bc, Mem[00000000100c1430] = cf6e00bb
	stw	%l4,[%i3+0x030]		! Mem[00000000100c1430] = 71d4c2bc
!	%l5 = 000000009212d517, Mem[0000000020800040] = ffe79ed5
	stb	%l5,[%o1+0x040]		! Mem[0000000020800040] = 17e79ed5
!	%l4 = 71d4c2bc, %l5 = 9212d517, Mem[0000000030101400] = 1ec24541 660dd809
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 71d4c2bc 9212d517
!	Mem[0000000010101436] = 4d09ffab, %l0 = 00000000000000d8
	ldstub	[%i4+0x036],%l0		! %l0 = 000000ff000000ff
!	%l6 = 000000000000002e, Mem[0000000030141410] = 8314efa9000000ff
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000000000002e
!	%l1 = 00000000789eac55, Mem[000000001004143c] = 42b53550
	stw	%l1,[%i1+0x03c]		! Mem[000000001004143c] = 789eac55
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff833bb1 127ec32e, %l4 = 71d4c2bc, %l5 = 9212d517
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff833bb1 00000000127ec32e

p0_label_31:
!	Mem[0000000010141400] = b8f3f1476009d3ff, %f4  = ffd30960 d663614a
	ldda	[%i5+%g0]0x88,%f4 	! %f4  = b8f3f147 6009d3ff
!	Mem[0000000010181414] = 127ec32e, %l7 = ffffffffffffffe0
	lduha	[%i6+0x014]%asi,%l7	! %l7 = 000000000000127e
!	%l2 = 00000000000a5dcb, imm = fffffffffffffb9a, %l1 = 00000000789eac55
	andn	%l2,-0x466,%l1		! %l1 = 0000000000000441
!	Mem[0000000010141414] = 000165cc, %l0 = 00000000000000ff
	ldswa	[%i5+0x014]%asi,%l0	! %l0 = 00000000000165cc
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030101400] = bcc2d471 17d51292 73da9dfe 00000031
!	Mem[0000000030101410] = ff14efa9 000000f7 27ffa4ac ae8f020f
!	Mem[0000000030101420] = f61762ed 26464f62 9065e4e5 67111dc5
!	Mem[0000000030101430] = 4ee750ac 29b5592e f6b76916 30872293
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001410] = 83000000, %l7 = 000000000000127e
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 0000000083000000
!	Mem[0000000010101420] = 327e141c, %f3  = 000000f7
	ld	[%i4+0x020],%f3 	! %f3 = 327e141c
!	Mem[0000000010041408] = 27ffa4ac, %l2 = 00000000000a5dcb
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000027
!	Mem[0000000030181400] = d80dd809, %f7  = 4c248ccd
	lda	[%i6+%g0]0x81,%f7 	! %f7 = d80dd809
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = f61762ed, %l5 = 00000000127ec32e
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 000000f6000000ff

p0_label_32:
!	%l7 = 0000000083000000, Mem[0000000021800180] = 8855b2ae, %asi = 80
	stba	%l7,[%o3+0x180]%asi	! Mem[0000000021800180] = 0055b2ae
	membar	#Sync			! Added by membar checker (7)
!	%l6 = 000000000000002e, Mem[0000000030101408] = fe9dda73
	stba	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = fe9dda2e
!	%l7 = 0000000083000000, Mem[0000000010001404] = 9212d517
	stw	%l7,[%i0+0x004]		! Mem[0000000010001404] = 83000000
!	%f30 = f6b76916 30872293, Mem[0000000010181400] = 0f1cb58a d4b2bcb9
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = f6b76916 30872293
!	%l2 = 0000000000000027, immd = 00000000000008cc, %l3  = 00000000ff383b35
	mulx	%l2,0x8cc,%l3		! %l3 = 0000000000015714
!	Mem[0000000030041410] = 6009d3ff, %l2 = 0000000000000027
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 000000006009d3ff
!	%f24 = f61762ed 26464f62, %l2 = 000000006009d3ff
!	Mem[0000000010001420] = ffffff7fd38fd53c
	add	%i0,0x020,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010001420] = 624f4626ed6217f6
!	%f12 = 27d25e9e ffff4791, Mem[0000000010101400] = ed6217ff 2c3be2f5
	stda	%f12,[%i4+%g0]0x88	! Mem[0000000010101400] = 27d25e9e ffff4791
!	Mem[0000000010041400] = ac3d4fa5, %l1 = 0000000000000441
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000ac3d4fa5
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 27000000, %l3 = 0000000000015714
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000002700

p0_label_33:
!	Mem[0000000010081428] = 5d3a04c930c82000, %l1 = 00000000ac3d4fa5
	ldxa	[%i2+0x028]%asi,%l1	! %l1 = 5d3a04c930c82000
!	Mem[0000000010141410] = 000000e7, %l3 = 0000000000002700
	ldsha	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l1 = 5d3a04c930c82000, immed = 0000062e, %y  = 00000000
	umul	%l1,0x62e,%l2		! %l2 = 0000012d74b5c000, %y = 0000012d
!	Mem[0000000010181400] = f6b76916, %l1 = 5d3a04c930c82000
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 000000000000f6b7
!	Mem[0000000030041400] = 00000083, %l1 = 000000000000f6b7
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000083
!	Mem[0000000010041400] = 167cf44a00000441, %f4  = b8f3f147 6009d3ff
	ldda	[%i1+%g0]0x88,%f4 	! %f4  = 167cf44a 00000441
!	Mem[0000000030101408] = fe9dda2e, %l4 = 00000000ff833bb1
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 000000000000da2e
!	Mem[0000000030141410] = 0000002e, %l1 = 0000000000000083
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 000000000000002e
!	Mem[0000000021800040] = 6c62a673, %l0 = 00000000000165cc
	ldsba	[%o3+0x040]%asi,%l0	! %l0 = 000000000000006c
!	Starting 10 instruction Store Burst
!	%l2 = 0000012d74b5c000, Mem[00000000201c0000] = ffffd78e, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffd78e

p0_label_34:
!	%l5 = 00000000000000f6, Mem[0000000010141408] = 000000ff
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000f6
!	%l0 = 000000000000006c, Mem[0000000030101410] = a9ef14ff
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000006c
!	%f28 = 4ee750ac, Mem[0000000010101400] = 9147ffff
	sta	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = 4ee750ac
!	%f4  = 167cf44a 00000441, %l7 = 0000000083000000
!	Mem[0000000010041400] = 410400004af47c16
	stda	%f4,[%i1+%l7]ASI_PST16_PL ! Mem[0000000010041400] = 410400004af47c16
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000000000006c
	setx	0x08bc4a8fa372b5f7,%g7,%l0 ! %l0 = 08bc4a8fa372b5f7
!	%l1 = 000000000000002e
	setx	0xbb47075876a05f5d,%g7,%l1 ! %l1 = bb47075876a05f5d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 08bc4a8fa372b5f7
	setx	0xb762b7984b6f0a56,%g7,%l0 ! %l0 = b762b7984b6f0a56
!	%l1 = bb47075876a05f5d
	setx	0xa13022e795bee95a,%g7,%l1 ! %l1 = a13022e795bee95a
!	Mem[0000000010001410] = 00000083, %l0 = b762b7984b6f0a56
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000083000000ff
!	Mem[0000000030101408] = fe9dda2e, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 0000002e000000ff
!	%l2 = 0000012d74b5c000, Mem[0000000010081410] = 153b7f26000000ff
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000012d74b5c000
!	%f24 = f61762ed 26464f62, Mem[0000000030101408] = fe9ddaff 31000000
	stda	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = f61762ed 26464f62
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 27000000, %l5 = 00000000000000f6
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000027

p0_label_35:
!	Mem[0000000010141418] = d6272079 8735c17c, %l4 = 0000da2e, %l5 = 00000027
	ldda	[%i5+0x018]%asi,%l4	! %l4 = 00000000d6272079 000000008735c17c
!	Mem[0000000010001408] = 87313dac 4af47c16, %l0 = 00000083, %l1 = 95bee95a
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000087313dac 000000004af47c16
!	Mem[0000000010141424] = c4394112, %f28 = 4ee750ac
	ld	[%i5+0x024],%f28	! %f28 = c4394112
!	Mem[0000000030001400] = ff552722, %l0 = 0000000087313dac
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = ff00f8e3, %l0 = ffffffffffffffff
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 0d660000 00000000, %l4 = d6272079, %l5 = 8735c17c
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000 000000000d660000
!	%l4 = 0000000000000000, %l0 = 0000000000000000, %y  = 0000012d
	sdiv	%l4,%l0,%l5		! %l5 = 000000000d660000
	mov	%l0,%y			! %y = 00000028
!	Mem[0000000030001410] = ffffffff, %l7 = 0000000083000000
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001438] = 2ec37e12, %f23 = ae8f020f
	ld	[%i0+0x038],%f23	! %f23 = 2ec37e12
!	Starting 10 instruction Store Burst
!	Mem[000000001008141b] = be1a8633, %l0 = 0000000000000028
	ldstub	[%i2+0x01b],%l0		! %l0 = 00000033000000ff

p0_label_36:
!	%f8  = e9833bb1 aca4ff27, %l7 = ffffffffffffffff
!	Mem[0000000010081438] = df91e4cf7e673868
	add	%i2,0x038,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010081438] = 27ffa4acb13b83e9
!	%l7 = ffffffffffffffff, Mem[0000000010001408] = ac3d3187
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	%l6 = 0000002e, %l7 = ffffffff, Mem[0000000010041400] = 00000441 167cf44a
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000002e ffffffff
!	Mem[00000000300c1400] = 30c82000, %l2 = 0000012d74b5c000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000030000000ff
!	Mem[0000000010101438] = 8a773bb1127e1d31, %l0 = 0000000000000033, %l3 = 000000000000002e
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 8a773bb1127e1d31
!	Mem[0000000010041408] = 27ffa4ac, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 0000000027ffa4ac
!	%l7 = 0000000027ffa4ac, Mem[0000000010041408] = ffffffff, %asi = 80
	stha	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = a4acffff
!	%f31 = 30872293, Mem[0000000010081400] = 71ea1e28
	sta	%f31,[%i2+%g0]0x88	! Mem[0000000010081400] = 30872293
!	Mem[0000000010081420] = 00000046c71998b3, %l4 = 0000000000000000, %l3 = 8a773bb1127e1d31
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 00000046c71998b3
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000031, %l5 = 000000000d660000
	ldswa	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000031

p0_label_37:
!	Mem[0000000030081400] = 31000000, %l7 = 0000000027ffa4ac
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000003100
!	%l5 = 0000000000000031, %l2 = 0000000000000030, %l1 = 000000004af47c16
	or	%l5,%l2,%l1		! %l1 = 0000000000000031
!	Mem[0000000020800040] = 17e79ed5, %l5 = 0000000000000031
	ldsh	[%o1+0x040],%l5		! %l5 = 00000000000017e7
!	Mem[00000000211c0000] = ff00f8e3, %l5 = 00000000000017e7
	ldsb	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 0020c8ff, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 000000000020c8ff
!	Mem[0000000010141410] = cc650100e7000000, %f6  = 5d3a04c9 d80dd809
	ldda	[%i5+%o5]0x88,%f6 	! %f6  = cc650100 e7000000
!	Mem[000000001018143c] = c2ebfb0f, %l0 = 0000000000000033
	lduw	[%i6+0x03c],%l0		! %l0 = 00000000c2ebfb0f
!	Mem[0000000030041410] = 4a6163d600000027, %f0  = 789eac55 222755ff
	ldda	[%i1+%o5]0x89,%f0 	! %f0  = 4a6163d6 00000027
!	%l0 = 00000000c2ebfb0f, %l2 = 0000000000000030, %l1 = 0000000000000031
	xnor	%l0,%l2,%l1		! %l1 = ffffffff3d1404c0
!	Starting 10 instruction Store Burst
!	%l3 = 00000046c71998b3, Mem[0000000010041400] = 2e000000ffffffff
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000046c71998b3

p0_label_38:
!	Mem[0000000010001400] = bcc2d471, %l3 = 00000046c71998b3
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000071000000ff
!	%l4 = 00000000, %l5 = 0020c8ff, Mem[0000000030041400] = 83000000 ff552722
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 0020c8ff
!	%f28 = c4394112, Mem[00000000300c1410] = 213b83e9
	sta	%f28,[%i3+%o5]0x81	! Mem[00000000300c1410] = c4394112
!	%l2 = 0000000000000030, Mem[0000000030001408] = 78c7d5ff
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000030
!	Mem[0000000030081410] = 000000b4, %l6 = 000000000000002e
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000b4
!	%l3 = 0000000000000071, Mem[0000000010041408] = ffffaca4
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0071
!	%f12 = 27d25e9e ffff4791, Mem[0000000010101400] = 4ee750ac 9e5ed227
	stda	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = 27d25e9e ffff4791
!	Mem[0000000010081410] = 74b5c000, %l1 = ffffffff3d1404c0
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 0000000074b5c000
!	%l2 = 00000030, %l3 = 00000071, Mem[0000000030101408] = 26464f62 f61762ed
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000030 00000071
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000 00000000, %l0 = c2ebfb0f, %l1 = 74b5c000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000

p0_label_39:
!	Mem[0000000030001400] = ff552722, %l2 = 0000000000000030
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 624f4626a72c8bce, %f0  = 4a6163d6 00000027
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 624f4626 a72c8bce
!	Mem[0000000030181408] = 31000000, %l2 = ffffffffffffffff
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000031
!	Mem[00000000300c1400] = 932287300020c8ff, %f24 = f61762ed 26464f62
	ldda	[%i3+%g0]0x89,%f24	! %f24 = 93228730 0020c8ff
!	Mem[0000000030001410] = ffffffff, %l3 = 0000000000000071
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 222755ff, %l6 = 00000000000000b4
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 00000000222755ff
!	Mem[0000000010141414] = 000165cc, %l0 = 00000000ff000000
	ldsw	[%i5+0x014],%l0		! %l0 = 00000000000165cc
!	Mem[0000000010101410] = 46000000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000046
!	Mem[0000000030041410] = 27000000, %l6 = 00000000222755ff
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000002700
!	Starting 10 instruction Store Burst
!	%f22 = 27ffa4ac 2ec37e12, %l3 = 00000000000000ff
!	Mem[0000000030081420] = 03e5fc7dd7d8da15
	add	%i2,0x020,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081420] = 27ffa4ac2ec37e12

p0_label_40:
!	Mem[0000000010001410] = ff000000, %l6 = 0000000000002700
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000010081408] = 353b51ff
	stha	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 353b0000
!	%f8  = e9833bb1 aca4ff27, Mem[0000000010081400] = 30872293 3a3c80a8
	stda	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = e9833bb1 aca4ff27
!	%l7 = 0000000000003100, Mem[0000000030101408] = 3000000071000000
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000003100
!	%f10 = e526033d ae793d12, Mem[0000000010041408] = 7100ffff ae8f020f
	stda	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = e526033d ae793d12
!	Mem[0000000010081400] = 27ffa4ac, %l5 = 000000000020c8ff
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 0000000027ffa4ac
!	%f16 = bcc2d471 17d51292, Mem[0000000030081400] = 00000031 3cb075fc
	stda	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = bcc2d471 17d51292
!	%l5 = 0000000027ffa4ac, Mem[0000000030041400] = 00000000
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 27ffa4ac
!	%l4 = 0000000000000000, Mem[0000000010041400] = 46000000
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff833bb1, %l3 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ff833bb1

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	or	%l6,%l6,%l1
	fstoi	%f15,%f20
	smul	%l4,0xb22,%l4
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000000165cc
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000046
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000031
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000ff833bb1
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000027ffa4ac
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000ff000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000003100
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000028,%g2
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
	cmp	%l0,%l1			! %f0  should be 624f4626 a72c8bce
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 8314efa9 327e141c
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 167cf44a 00000441
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be cc650100 e7000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be e9833bb1 aca4ff27
	bne	%xcc,p0_f8_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 27d25e9e ffff4791
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be e9833bb1 127ec32e
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be bcc2d471 17d51292
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 73da9dfe 00000031
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff14efa9 000000f7
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 27ffa4ac 2ec37e12
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 93228730 0020c8ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 9065e4e5 67111dc5
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be c4394112 29b5592e
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be f6b76916 30872293
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
	fadds	%f3 ,%f3 ,%f2 
	addc	%l0,%l1,%l5
	done

p0_trap1o:
	fadds	%f3 ,%f3 ,%f2 
	addc	%l0,%l1,%l5
	done


p0_trap2e:
	orn	%l3,0x228,%l1
	udivx	%l4,0x791,%l3
	orn	%l2,%l2,%l7
	fcmps	%fcc1,%f8 ,%f8 
	smul	%l5,%l5,%l5
	or	%l1,0x98e,%l3
	done

p0_trap2o:
	orn	%l3,0x228,%l1
	udivx	%l4,0x791,%l3
	orn	%l2,%l2,%l7
	fcmps	%fcc1,%f8 ,%f8 
	smul	%l5,%l5,%l5
	or	%l1,0x98e,%l3
	done


p0_trap3e:
	subc	%l0,%l7,%l7
	andn	%l2,%l6,%l1
	xor	%l5,%l6,%l0
	orn	%l5,%l6,%l6
	orn	%l6,-0x3d5,%l6
	xnor	%l6,%l7,%l7
	done

p0_trap3o:
	subc	%l0,%l7,%l7
	andn	%l2,%l6,%l1
	xor	%l5,%l6,%l0
	orn	%l5,%l6,%l6
	orn	%l6,-0x3d5,%l6
	xnor	%l6,%l7,%l7
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
	ldx	[%g1+0x000],%l0		! %l0 = 8653b8c63772654d
	ldx	[%g1+0x008],%l1		! %l1 = ecea7b23b02b0543
	ldx	[%g1+0x010],%l2		! %l2 = 7f2fb1c3df2f4541
	ldx	[%g1+0x018],%l3		! %l3 = 7d6e86cff6fc6f21
	ldx	[%g1+0x020],%l4		! %l4 = 1587e005e50fd359
	ldx	[%g1+0x028],%l5		! %l5 = 34dd0e65fb33e228
	ldx	[%g1+0x030],%l6		! %l6 = 1653e384215d3066
	ldx	[%g1+0x038],%l7		! %l7 = 7f5001e22e4c7c44

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
	fadds	%f3 ,%f3 ,%f2 
	addc	%l0,%l1,%l5
	ld	[%i3+0x030],%f6 	! Mem[00000000100c1430]
	jmpl	%o7,%g0
	xnor	%l1,%l5,%l7
p0_near_0_he:
	mulx	%l5,-0x598,%l5
	fadds	%f20,%f31,%f17
	jmpl	%o7,%g0
	fsubs	%f24,%f22,%f27
near0_b2b_h:
	mulx	%l4,-0x5cd,%l3
	fsqrts	%f20,%f29
	xor	%l1,0x9a0,%l3
	jmpl	%o7,%g0
	umul	%l4,%l1,%l5
near0_b2b_l:
	udivx	%l4,%l5,%l7
	sub	%l0,-0xadd,%l2
	fcmps	%fcc2,%f1 ,%f4 
	jmpl	%o7,%g0
	xnor	%l3,-0xd7c,%l7
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	mulx	%l0,%l5,%l7
	and	%l0,0xba1,%l3
	mulx	%l3,%l5,%l4
	swap	[%i0+0x000],%l6		! Mem[0000000010001400]
	fcmps	%fcc2,%f15,%f1 
	fdivs	%f8 ,%f7 ,%f10
	fdivs	%f2 ,%f6 ,%f11
	jmpl	%o7,%g0
	xor	%l6,%l1,%l6
p0_near_1_he:
	xnor	%l0,%l5,%l1
	fadds	%f31,%f24,%f23
	addc	%l1,0xa80,%l2
	xor	%l0,-0x265,%l5
	fitod	%f18,%f18
	umul	%l4,%l7,%l4
	fcmps	%fcc0,%f28,%f31
	jmpl	%o7,%g0
	fdivs	%f17,%f21,%f29
near1_b2b_h:
	jmpl	%o7,%g0
	fsqrts	%f20,%f28
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	umul	%l2,0x9a9,%l6
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	smul	%l6,%l2,%l2
	xor	%l7,%l1,%l5
	and	%l4,%l3,%l3
	and	%l2,%l0,%l4
	jmpl	%o7,%g0
	andn	%l4,%l0,%l0
p0_near_2_he:
	fcmps	%fcc3,%f28,%f26
	jmpl	%o7,%g0
	or	%l1,0xd87,%l4
near2_b2b_h:
	umul	%l0,0x7fb,%l5
	xor	%l0,%l5,%l2
	fcmps	%fcc3,%f22,%f18
	xnor	%l7,0xc98,%l6
	addc	%l4,0xdef,%l3
	fsubs	%f18,%f17,%f26
	jmpl	%o7,%g0
	fdivs	%f20,%f30,%f20
near2_b2b_l:
	xnor	%l7,%l2,%l1
	fitod	%f14,%f2 
	subc	%l0,-0x818,%l6
	orn	%l0,0x11b,%l1
	mulx	%l1,-0x0ea,%l0
	mulx	%l4,%l1,%l1
	jmpl	%o7,%g0
	mulx	%l0,-0x778,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	sub	%l2,-0xf43,%l6
	subc	%l0,%l7,%l3
	fcmps	%fcc2,%f13,%f9 
	fdivs	%f10,%f3 ,%f2 
	jmpl	%o7,%g0
	lduw	[%i6+0x038],%l0		! Mem[0000000010181438]
p0_near_3_he:
	sdivx	%l5,%l3,%l3
	smul	%l3,%l3,%l2
	xnor	%l5,0x3ab,%l0
	jmpl	%o7,%g0
	fadds	%f31,%f23,%f16
near3_b2b_h:
	fsubs	%f31,%f24,%f16
	mulx	%l0,0xb67,%l4
	orn	%l6,0xeca,%l7
	addc	%l7,-0xae3,%l5
	fadds	%f29,%f19,%f17
	fsubs	%f27,%f17,%f19
	jmpl	%o7,%g0
	and	%l0,%l2,%l2
near3_b2b_l:
	xnor	%l1,-0x2e3,%l1
	fsubs	%f10,%f0 ,%f15
	subc	%l1,-0x3ac,%l0
	fmuls	%f1 ,%f15,%f10
	andn	%l5,%l1,%l0
	fsubs	%f4 ,%f13,%f7 
	jmpl	%o7,%g0
	or	%l6,-0xfa0,%l7
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	sdivx	%l5,%l6,%l6
	subc	%l2,0xde6,%l3
	jmpl	%o7,%g0
	fadds	%f12,%f7 ,%f9 
p0_far_0_lem:
	sdivx	%l5,%l6,%l6
	subc	%l2,0xde6,%l3
	jmpl	%o7,%g0
	fadds	%f12,%f7 ,%f9 
p0_far_0_he:
	and	%l7,-0x31d,%l0
	stw	%l5,[%i5+0x00c]		! Mem[000000001014140c]
	xnor	%l2,%l0,%l1
	fsubs	%f17,%f25,%f25
	addc	%l6,%l0,%l6
	fcmps	%fcc2,%f24,%f19
	jmpl	%o7,%g0
	ldx	[%i5+0x000],%l6		! Mem[0000000010141400]
p0_far_0_hem:
	and	%l7,-0x31d,%l0
	membar	#Sync
	stw	%l5,[%i5+0x00c]		! Mem[000000001014140c]
	xnor	%l2,%l0,%l1
	fsubs	%f17,%f25,%f25
	addc	%l6,%l0,%l6
	fcmps	%fcc2,%f24,%f19
	membar	#Sync
	jmpl	%o7,%g0
	ldx	[%i5+0x000],%l6		! Mem[0000000010141400]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	mulx	%l0,0x359,%l4
	xor	%l7,-0x566,%l2
	and	%l6,0xd7c,%l4
	xnor	%l2,-0x514,%l4
	fcmps	%fcc0,%f22,%f16
	mulx	%l0,-0xa64,%l7
	jmpl	%o7,%g0
	andn	%l2,%l2,%l5
far0_b2b_l:
	fsqrts	%f10,%f8 
	orn	%l6,%l7,%l5
	addc	%l2,0x81b,%l0
	andn	%l2,%l4,%l1
	sdivx	%l6,%l1,%l7
	xnor	%l6,%l5,%l2
	jmpl	%o7,%g0
	xnor	%l4,%l5,%l5
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fcmps	%fcc2,%f8 ,%f15
	andn	%l4,0x281,%l5
	sdivx	%l6,0x8cc,%l6
	mulx	%l5,-0x595,%l6
	jmpl	%o7,%g0
	fsqrts	%f15,%f4 
p0_far_1_lem:
	fcmps	%fcc2,%f8 ,%f15
	andn	%l4,0x281,%l5
	sdivx	%l6,0x8cc,%l6
	mulx	%l5,-0x595,%l6
	jmpl	%o7,%g0
	fsqrts	%f15,%f4 
p0_far_1_he:
	fadds	%f27,%f17,%f18
	sdivx	%l4,-0x104,%l4
	sdivx	%l6,-0x08e,%l0
	fmuls	%f28,%f29,%f27
	mulx	%l1,0xb93,%l1
	addc	%l7,0xeb1,%l6
	fsubs	%f25,%f28,%f26
	jmpl	%o7,%g0
	ldx	[%i3+0x018],%l0		! Mem[00000000100c1418]
p0_far_1_hem:
	fadds	%f27,%f17,%f18
	sdivx	%l4,-0x104,%l4
	sdivx	%l6,-0x08e,%l0
	fmuls	%f28,%f29,%f27
	mulx	%l1,0xb93,%l1
	addc	%l7,0xeb1,%l6
	fsubs	%f25,%f28,%f26
	membar	#Sync
	jmpl	%o7,%g0
	ldx	[%i3+0x018],%l0		! Mem[00000000100c1418]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	addc	%l0,%l3,%l1
	sub	%l3,%l0,%l3
	jmpl	%o7,%g0
	xnor	%l4,%l2,%l2
far1_b2b_l:
	fadds	%f10,%f3 ,%f4 
	xnor	%l3,0x053,%l7
	jmpl	%o7,%g0
	xor	%l2,-0x674,%l2
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	subc	%l1,%l4,%l6
	or	%l7,0xd35,%l0
	subc	%l1,0x8f8,%l0
	andn	%l3,%l2,%l6
	fadds	%f14,%f14,%f12
	fdivs	%f7 ,%f15,%f7 
	udivx	%l4,%l7,%l4
	jmpl	%o7,%g0
	xor	%l1,0x633,%l4
p0_far_2_lem:
	subc	%l1,%l4,%l6
	or	%l7,0xd35,%l0
	subc	%l1,0x8f8,%l0
	andn	%l3,%l2,%l6
	fadds	%f14,%f14,%f12
	fdivs	%f7 ,%f15,%f7 
	udivx	%l4,%l7,%l4
	jmpl	%o7,%g0
	xor	%l1,0x633,%l4
p0_far_2_he:
	ldsb	[%i3+0x00e],%l4		! Mem[00000000100c140e]
	or	%l2,%l5,%l6
	fmuls	%f16,%f27,%f16
	fdivs	%f29,%f19,%f28
	jmpl	%o7,%g0
	sth	%l7,[%i5+0x034]		! Mem[0000000010141434]
p0_far_2_hem:
	membar	#Sync
	ldsb	[%i3+0x00e],%l4		! Mem[00000000100c140e]
	or	%l2,%l5,%l6
	fmuls	%f16,%f27,%f16
	fdivs	%f29,%f19,%f28
	membar	#Sync
	jmpl	%o7,%g0
	sth	%l7,[%i5+0x034]		! Mem[0000000010141434]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sub	%l4,%l0,%l2
	jmpl	%o7,%g0
	and	%l1,-0xb02,%l3
far2_b2b_l:
	or	%l4,%l6,%l6
	jmpl	%o7,%g0
	xnor	%l4,0x90d,%l6
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	subc	%l7,%l7,%l5
	stw	%l3,[%i3+0x020]		! Mem[00000000100c1420]
	xnor	%l5,-0xd07,%l5
	sub	%l0,%l4,%l2
	jmpl	%o7,%g0
	andn	%l0,0xa0c,%l7
p0_far_3_lem:
	subc	%l7,%l7,%l5
	membar	#Sync
	stw	%l3,[%i3+0x020]		! Mem[00000000100c1420]
	xnor	%l5,-0xd07,%l5
	sub	%l0,%l4,%l2
	jmpl	%o7,%g0
	andn	%l0,0xa0c,%l7
p0_far_3_he:
	fsubs	%f26,%f18,%f29
	subc	%l5,-0xfb4,%l6
	addc	%l5,%l7,%l4
	xor	%l1,-0x679,%l0
	xor	%l6,0x357,%l0
	sdivx	%l1,-0xf22,%l2
	jmpl	%o7,%g0
	addc	%l6,0x477,%l3
p0_far_3_hem:
	fsubs	%f26,%f18,%f29
	subc	%l5,-0xfb4,%l6
	addc	%l5,%l7,%l4
	xor	%l1,-0x679,%l0
	xor	%l6,0x357,%l0
	sdivx	%l1,-0xf22,%l2
	jmpl	%o7,%g0
	addc	%l6,0x477,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fcmps	%fcc0,%f29,%f26
	sdivx	%l7,%l3,%l5
	sub	%l3,%l1,%l5
	jmpl	%o7,%g0
	and	%l3,0x2a6,%l5
far3_b2b_l:
	add	%l4,0x87b,%l7
	fcmps	%fcc2,%f4 ,%f6 
	fsqrts	%f14,%f0 
	jmpl	%o7,%g0
	subc	%l7,%l0,%l6
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	lduw	[%i1+0x024],%l4		! Mem[0000000010041424]
	subc	%l3,%l2,%l0
	subc	%l3,%l1,%l0
	jmpl	%g6+8,%g0
	umul	%l0,%l5,%l0
p0_call_0_le:
	xor	%l5,%l0,%l0
	fsubs	%f13,%f4 ,%f13
	retl
	or	%l4,0x29e,%l2
p0_jmpl_0_lo:
	lduw	[%o1+0x024],%l4		! Mem[0000000010041424]
	subc	%l3,%l2,%l0
	subc	%l3,%l1,%l0
	jmpl	%g6+8,%g0
	umul	%l0,%l5,%l0
p0_call_0_lo:
	xor	%l5,%l0,%l0
	fsubs	%f13,%f4 ,%f13
	retl
	or	%l4,0x29e,%l2
p0_jmpl_0_he:
	sdivx	%l5,%l1,%l6
	fadds	%f25,%f19,%f21
	and	%l2,-0xf0e,%l7
	fcmps	%fcc3,%f16,%f30
	fmuls	%f20,%f16,%f16
	subc	%l0,-0xd37,%l7
	udivx	%l2,0x614,%l1
	jmpl	%g6+8,%g0
	orn	%l2,-0x83a,%l4
p0_call_0_he:
	fadds	%f22,%f31,%f27
	sdivx	%l7,%l2,%l2
	retl
	smul	%l0,%l0,%l0
p0_jmpl_0_ho:
	sdivx	%l5,%l1,%l6
	fadds	%f25,%f19,%f21
	and	%l2,-0xf0e,%l7
	fcmps	%fcc3,%f16,%f30
	fmuls	%f20,%f16,%f16
	subc	%l0,-0xd37,%l7
	udivx	%l2,0x614,%l1
	jmpl	%g6+8,%g0
	orn	%l2,-0x83a,%l4
p0_call_0_ho:
	fadds	%f22,%f31,%f27
	sdivx	%l7,%l2,%l2
	retl
	smul	%l0,%l0,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fmuls	%f3 ,%f14,%f1 
	jmpl	%g6+8,%g0
	andn	%l2,%l3,%l5
p0_call_1_le:
	retl
	sub	%l5,-0xe0f,%l1
p0_jmpl_1_lo:
	fmuls	%f3 ,%f14,%f1 
	jmpl	%g6+8,%g0
	andn	%l2,%l3,%l5
p0_call_1_lo:
	retl
	sub	%l5,-0xe0f,%l1
p0_jmpl_1_he:
	mulx	%l4,-0xa38,%l3
	orn	%l7,%l6,%l5
	and	%l4,%l3,%l2
	addc	%l4,%l1,%l5
	sdivx	%l7,%l7,%l3
	sdivx	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f24,%f21
p0_call_1_he:
	subc	%l5,%l6,%l1
	fsubs	%f21,%f30,%f30
	andn	%l6,0xa09,%l5
	fdivs	%f16,%f18,%f18
	retl
	fdtos	%f18,%f29
p0_jmpl_1_ho:
	mulx	%l4,-0xa38,%l3
	orn	%l7,%l6,%l5
	and	%l4,%l3,%l2
	addc	%l4,%l1,%l5
	sdivx	%l7,%l7,%l3
	sdivx	%l5,%l4,%l0
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f24,%f21
p0_call_1_ho:
	subc	%l5,%l6,%l1
	fsubs	%f21,%f30,%f30
	andn	%l6,0xa09,%l5
	fdivs	%f16,%f18,%f18
	retl
	fdtos	%f18,%f29
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	udivx	%l2,0xfbe,%l5
	xor	%l1,-0x296,%l3
	fcmps	%fcc3,%f2 ,%f14
	fdivs	%f8 ,%f14,%f10
	jmpl	%g6+8,%g0
	sub	%l3,-0x399,%l5
p0_call_2_le:
	retl
	xor	%l0,0x2e3,%l2
p0_jmpl_2_lo:
	udivx	%l2,0xfbe,%l5
	xor	%l1,-0x296,%l3
	fcmps	%fcc3,%f2 ,%f14
	fdivs	%f8 ,%f14,%f10
	jmpl	%g6+8,%g0
	sub	%l3,-0x399,%l5
p0_call_2_lo:
	retl
	xor	%l0,0x2e3,%l2
p0_jmpl_2_he:
	fadds	%f19,%f21,%f18
	fsubs	%f22,%f25,%f26
	fsqrts	%f27,%f24
	fcmps	%fcc1,%f28,%f30
	fadds	%f19,%f29,%f19
	jmpl	%g6+8,%g0
	subc	%l4,%l3,%l3
p0_call_2_he:
	mulx	%l6,-0x4d3,%l2
	smul	%l0,%l1,%l6
	fcmps	%fcc1,%f26,%f16
	fdivs	%f26,%f28,%f18
	xor	%l5,-0x7ad,%l4
	sub	%l6,%l3,%l1
	xor	%l7,%l0,%l0
	retl
	mulx	%l3,%l2,%l4
p0_jmpl_2_ho:
	fadds	%f19,%f21,%f18
	fsubs	%f22,%f25,%f26
	fsqrts	%f27,%f24
	fcmps	%fcc1,%f28,%f30
	fadds	%f19,%f29,%f19
	jmpl	%g6+8,%g0
	subc	%l4,%l3,%l3
p0_call_2_ho:
	mulx	%l6,-0x4d3,%l2
	smul	%l0,%l1,%l6
	fcmps	%fcc1,%f26,%f16
	fdivs	%f26,%f28,%f18
	xor	%l5,-0x7ad,%l4
	sub	%l6,%l3,%l1
	xor	%l7,%l0,%l0
	retl
	mulx	%l3,%l2,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fdivs	%f6 ,%f5 ,%f3 
	fadds	%f13,%f8 ,%f5 
	smul	%l2,0xc35,%l7
	orn	%l0,-0xbca,%l2
	jmpl	%g6+8,%g0
	or	%l3,%l2,%l3
p0_call_3_le:
	retl
	fsqrts	%f7 ,%f0 
p0_jmpl_3_lo:
	fdivs	%f6 ,%f5 ,%f3 
	fadds	%f13,%f8 ,%f5 
	smul	%l2,0xc35,%l7
	orn	%l0,-0xbca,%l2
	jmpl	%g6+8,%g0
	or	%l3,%l2,%l3
p0_call_3_lo:
	retl
	fsqrts	%f7 ,%f0 
p0_jmpl_3_he:
	std	%l0,[%i2+0x010]		! Mem[0000000010081410]
	xnor	%l0,%l3,%l4
	fadds	%f21,%f26,%f20
	fmuls	%f23,%f20,%f16
	umul	%l3,%l1,%l7
	jmpl	%g6+8,%g0
	orn	%l1,%l7,%l4
p0_call_3_he:
	ldub	[%i3+0x00b],%l3		! Mem[00000000100c140b]
	sub	%l3,0xcf0,%l1
	fdivs	%f24,%f18,%f17
	smul	%l4,-0xca5,%l2
	fdivs	%f22,%f24,%f25
	fdivs	%f17,%f19,%f27
	retl
	fsubs	%f17,%f18,%f23
p0_jmpl_3_ho:
	std	%l0,[%o2+0x010]		! Mem[0000000010081410]
	xnor	%l0,%l3,%l4
	fadds	%f21,%f26,%f20
	fmuls	%f23,%f20,%f16
	umul	%l3,%l1,%l7
	jmpl	%g6+8,%g0
	orn	%l1,%l7,%l4
p0_call_3_ho:
	ldub	[%o3+0x00b],%l3		! Mem[00000000100c140b]
	sub	%l3,0xcf0,%l1
	fdivs	%f24,%f18,%f17
	smul	%l4,-0xca5,%l2
	fdivs	%f22,%f24,%f25
	fdivs	%f17,%f19,%f27
	retl
	fsubs	%f17,%f18,%f23
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
	.word	0x8653b8c6,0x3772654d		! Init value for %l0
	.word	0xecea7b23,0xb02b0543		! Init value for %l1
	.word	0x7f2fb1c3,0xdf2f4541		! Init value for %l2
	.word	0x7d6e86cf,0xf6fc6f21		! Init value for %l3
	.word	0x1587e005,0xe50fd359		! Init value for %l4
	.word	0x34dd0e65,0xfb33e228		! Init value for %l5
	.word	0x1653e384,0x215d3066		! Init value for %l6
	.word	0x7f5001e2,0x2e4c7c44		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xdd703ad2,0xf2aedcae		! Init value for %f0 
	.word	0x2386b914,0x9701eb58		! Init value for %f2 
	.word	0x71a1adf2,0xdad74e52		! Init value for %f4 
	.word	0x5d3a04c9,0x4c248ccd		! Init value for %f6 
	.word	0x571bd858,0x1b907c48		! Init value for %f8 
	.word	0xe526033d,0xae793d12		! Init value for %f10
	.word	0x76c0166d,0xe7bb22af		! Init value for %f12
	.word	0x555bb460,0xbcd86afe		! Init value for %f14
	.word	0xfdeb1a21,0xa122b2fd		! Init value for %f16
	.word	0xd998614e,0x82615636		! Init value for %f18
	.word	0x62d06a45,0xe62bab1e		! Init value for %f20
	.word	0x846341a9,0x9d08997c		! Init value for %f22
	.word	0x5e1cbf9e,0xe0e3d30a		! Init value for %f24
	.word	0xb9a75eeb,0xe4d51ac4		! Init value for %f26
	.word	0x2ecb66ec,0x2befdfcc		! Init value for %f28
	.word	0x08f2912c,0xe725ae5f		! Init value for %f30
	.word	0xb07366b7,0x0aea1e63		! Init value for %f32
	.word	0x8de62d12,0xf36ddbc5		! Init value for %f34
	.word	0x24fc0181,0x95d01dc6		! Init value for %f36
	.word	0x9f7b04af,0xf677fd8b		! Init value for %f38
	.word	0x794f5e27,0x60728529		! Init value for %f40
	.word	0xa69170f2,0xf3dfabaa		! Init value for %f42
	.word	0x0f60d100,0x01479fab		! Init value for %f44
	.word	0xdc915ee1,0xa457bd3a		! Init value for %f46
	.word	0x6a57a046,0x2bf1f6fe
	.word	0x8bc867d6,0x72659590
	.word	0x55559a48,0xb053e6c2
	.word	0x4412fd58,0x4330a125
	.word	0x0e3e00c3,0x357dd591
	.word	0x6b41939b,0xca1c4d14
	.word	0x194d6172,0x3f57cc88
	.word	0xb6a512e9,0x2042b7cc
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
	.word	0x00000000,0x000165cc
	.word	0x00000000,0x00000046
	.word	0x00000000,0x00000031
	.word	0x00000000,0xff833bb1
	.word	0x00000000,0x00000000
	.word	0x00000000,0x27ffa4ac
	.word	0x00000000,0xff000000
	.word	0x00000000,0x00003100
p0_expected_fp_regs:
	.word	0x624f4626,0xa72c8bce
	.word	0x8314efa9,0x327e141c
	.word	0x167cf44a,0x00000441
	.word	0xcc650100,0xe7000000
	.word	0xe9833bb1,0xaca4ff27
	.word	0xe526033d,0xae793d12
	.word	0x27d25e9e,0xffff4791
	.word	0xe9833bb1,0x127ec32e
	.word	0xbcc2d471,0x17d51292
	.word	0x73da9dfe,0x00000031
	.word	0xff14efa9,0x000000f7
	.word	0x27ffa4ac,0x2ec37e12
	.word	0x93228730,0x0020c8ff
	.word	0x9065e4e5,0x67111dc5
	.word	0xc4394112,0x29b5592e
	.word	0xf6b76916,0x30872293
	.word	0x00000008,0x00000400		! %fsr = 0000000800000400
p0_local0_expect:
	.word	0xffd4c2bc,0x83000000
	.word	0xffffffff,0x4af47c16
	.word	0x00002700,0x00000000
	.word	0xff8c244c,0xc9043a5d
	.word	0x624f4626,0xed6217f6
	.word	0x123d79ae,0x3d0326e5
	.word	0xaf22bbe7,0x6d16c076
	.word	0x2ec37e12,0xb13b83e9
p0_local0_sec_expect:
	.word	0xff552722,0x55ac9e78
	.word	0x30000000,0x401c9d09
	.word	0xffffffff,0xffffffff
	.word	0x456fc9cb,0x62aa3f5c
	.word	0x2398c0d9,0xcdb0dea3
	.word	0xbe437fde,0xed8201d9
	.word	0x15017ea3,0x17a9b049
	.word	0xb19a9207,0x51d1fa48
p0_local1_expect:
	.word	0x00000000,0xc71998b3
	.word	0xe526033d,0xae793d12
	.word	0x0000002e,0xa9875246
	.word	0x10a5a8e1,0xd79b8d37
	.word	0x571bff58,0xf6bdc893
	.word	0xbf81e9e1,0xac712621
	.word	0x015ce8be,0x634d7826
	.word	0x8690d32a,0x789eac55
p0_local1_sec_expect:
	.word	0xaca4ff27,0xffc82000
	.word	0xffc37e12,0x55ac9e78
	.word	0x27000000,0xd663614a
	.word	0x5d3a04c9,0x4c248ccd
	.word	0x3cd58fd3,0x7fffffff
	.word	0xe526033d,0xae793d12
	.word	0x37ebfa4f,0x4e352340
	.word	0xe9833bb1,0x127ec32e
p0_local2_expect:
	.word	0x0020c8ff,0xb13b83e9
	.word	0x00003b35,0x0000002c
	.word	0xc004143d,0x2d010000
	.word	0xbe1a86ff,0x2d7b3f45
	.word	0x00000046,0xc71998b3
	.word	0x5d3a04c9,0x30c82000
	.word	0x9e06b803,0x84ec10b3
	.word	0x27ffa4ac,0xb13b83e9
p0_local2_sec_expect:
	.word	0x9212d517,0x71d4c2bc
	.word	0x87313dac,0x4af47c16
	.word	0x2e000000,0xaad46247
	.word	0x0fee3bab,0xb3a6898e
	.word	0x27ffa4ac,0x2ec37e12
	.word	0xbb9f8ab9,0x6bab3b4c
	.word	0x981f013f,0x667976fa
	.word	0xd0fa9f10,0x45ee7738
p0_local3_expect:
	.word	0x31000000,0x6f14a65c
	.word	0x00000000,0x0000ffff
	.word	0xb40013ff,0xa7d6e5f3
	.word	0xacfd6bdb,0x465287a9
	.word	0x06119802,0x0bf46051
	.word	0xf38017bb,0xb326f358
	.word	0x71d4c2bc,0x455acf29
	.word	0xf66a3d35,0x40198134
p0_local3_sec_expect:
	.word	0xffc82000,0x30872293
	.word	0x00000000,0x0000660d
	.word	0xc4394112,0x1eb42ac5
	.word	0x8726ffb3,0x4e0c0e3c
	.word	0x2830d08e,0xcf925f71
	.word	0xe30ded2b,0x291df384
	.word	0x4d06afdb,0xcd428ed8
	.word	0x78f40af0,0x2139c938
p0_local4_expect:
	.word	0x27d25e9e,0xffff4791
	.word	0x353b38ff,0xd38fd53c
	.word	0x46000000,0x00000000
	.word	0x00000028,0x00000036
	.word	0x327e141c,0xe1a419a8
	.word	0x27d25e9e,0xffff4791
	.word	0x9bc84afb,0x4d09ffab
	.word	0x8a773bb1,0x127e1d31
p0_local4_sec_expect:
	.word	0xbcc2d471,0x17d51292
	.word	0x00000000,0x00003100
	.word	0x6c000000,0x000000f7
	.word	0x27ffa4ac,0xae8f020f
	.word	0xf61762ed,0x26464f62
	.word	0x9065e4e5,0x67111dc5
	.word	0x4ee750ac,0x29b5592e
	.word	0xf6b76916,0x30872293
p0_local5_expect:
	.word	0xffd30960,0x47f1f3b8
	.word	0xf6000000,0xb73cc1cd
	.word	0x000000e7,0x000165cc
	.word	0xd6272079,0x8735c17c
	.word	0x2f30d7e0,0xc4394112
	.word	0x00000000,0x0000f700
	.word	0x87998ea9,0x7350c0a3
	.word	0x44b79e24,0xf97ba361
p0_local5_sec_expect:
	.word	0x624f4626,0xa72c8bce
	.word	0xffffffff,0xffffffff
	.word	0x2e000000,0x00000000
	.word	0x5645428b,0x01e1fefc
	.word	0x624f4626,0xed6217f6
	.word	0xc51d1167,0xe5e46590
	.word	0x2e59b529,0xac50e74e
	.word	0x0ce958dc,0xd7e531f2
p0_local6_expect:
	.word	0xf6b76916,0x30872293
	.word	0x0f028fae,0xd663614a
	.word	0xff833bb1,0x127ec32e
	.word	0xce8b0d4d,0xffda1c5e
	.word	0x5d3a04c9,0x4c24003a
	.word	0x7d31ce91,0x42fffcb0
	.word	0xc46793c0,0x95345268
	.word	0x15eae64e,0xc2ebfb0f
p0_local6_sec_expect:
	.word	0xd80dd809,0x1ec24541
	.word	0x31000000,0x6f14a65c
	.word	0xf7000000,0xa9ef1483
	.word	0x0f028fae,0xaca4ff27
	.word	0x624f4626,0xed6217f6
	.word	0xc51d1167,0xe5e46590
	.word	0x2e59b529,0xac50e74e
	.word	0x93228730,0x1669b7f6
share0_expect:
	.word	0x00ffd78e,0x47ff7465
	.word	0x4b811171,0x24ebb7e8
	.word	0x5925d992,0x9bc155e2
	.word	0xac23b3e7,0xad1b91b9
	.word	0x718bc9a3,0x8972a0e2
	.word	0xe5b0cb68,0x20927fd9
	.word	0xc2cfb9cb,0x968177d3
	.word	0xafbebc17,0xc20c9c4c
share1_expect:
	.word	0xfff1a156,0xc6f6bd51
	.word	0x0900f285,0x4a6c346a
	.word	0x5d2e8547,0x823e4b11
	.word	0x913f9aa1,0x801434ba
	.word	0x5a8dbba3,0x09db15a2
	.word	0x24da35cf,0x04b82142
	.word	0xab36790b,0xaf3f12d8
	.word	0xa803ea9d,0x71949cc8
	.word	0x17e79ed5,0x81a4449b
	.word	0xe34d27d3,0x50e157d2
	.word	0x82bd99d2,0x914298c8
	.word	0x281629ad,0x71cc9117
	.word	0x6ef85e7f,0x59d7359d
	.word	0x069d2294,0xe1b117e8
	.word	0xb5a1ab35,0xfeadebc2
	.word	0x71d6d004,0x5397ddc6
share2_expect:
	.word	0xff00f8e3,0x84cd5634
	.word	0x0a857986,0x4854f050
	.word	0x60a13c89,0x9bf560eb
	.word	0x6643951c,0x28c12a07
	.word	0xedcef3bb,0x3877ec6a
	.word	0x2e8c6004,0x8f12eb8f
	.word	0xa62b8653,0x6cfef44b
	.word	0x6c5fe77b,0x6b9bfc91
share3_expect:
	.word	0xdbca18f2,0xba3fbd15
	.word	0x817f596b,0x59daf0f1
	.word	0xfd2b45fe,0xe6423e8a
	.word	0x9fdce61f,0xf8ea11d6
	.word	0x508f4f16,0x121c3e6a
	.word	0x09a3ee32,0xf5dfea33
	.word	0x32a2496a,0x0222817d
	.word	0x7bb43ad0,0x36e24904
	.word	0x6c62a673,0x5c54ff3c
	.word	0xaa10e77e,0x72f0cb92
	.word	0x7f6b6f2a,0xca180017
	.word	0xfa4c7f8e,0xad369d85
	.word	0x6faa5f0d,0xfe3e687f
	.word	0x186aeec9,0x75b70265
	.word	0x1e7e4852,0xdf33d3b9
	.word	0xc7ab47b0,0xea1c2de5
	.word	0xffff2f56,0xe07d4241
	.word	0xcf54ac4f,0x8e6a5a51
	.word	0x98cabcd0,0xaef6c863
	.word	0x66acc936,0x6c474b03
	.word	0x83149b78,0x2f07c7a4
	.word	0x65e01e76,0x07bd8274
	.word	0xd584db6c,0x32b8b88a
	.word	0xc247278a,0x112e6a60
	.word	0x36ff1dd1,0x8eb0ef15
	.word	0xc225f355,0x2629ef3a
	.word	0x9c5b5b8f,0x8badfda3
	.word	0xd8691a66,0x9ba7282a
	.word	0x251f0c6a,0xdeaad89f
	.word	0xe91fa457,0x48cb50e8
	.word	0x8de21061,0xf898bb60
	.word	0x42302242,0x0377bf4c
	.word	0x6a7b7ac1,0xb27db1b4
	.word	0x0e7ab727,0x971cbb1b
	.word	0xa0dd382c,0x08c050dd
	.word	0xbf960aa6,0xd099a8f0
	.word	0xe20fc295,0x16ac0770
	.word	0x9171aba2,0x6dc8c0b0
	.word	0x10bd4caa,0x625da82f
	.word	0x02dffff0,0xa2776b81
	.word	0xe2d555dc,0x9dacfc88
	.word	0x6f39b064,0xa63a669a
	.word	0x5dd77be2,0x3d45e6a2
	.word	0x692e5f3e,0x38e9c118
	.word	0x921de3a1,0x46ee36c0
	.word	0xec451b60,0x3bb08007
	.word	0x9dc55920,0x0cd09d78
	.word	0x84d633b1,0x432a1a01
	.word	0x0055b2ae,0x495e5eb0
	.word	0x0f241a0d,0x6fc56882
	.word	0x0d82d522,0xe2dda478
	.word	0xd033c256,0x7c4867d4
	.word	0x6d9124d9,0x1d69fe9b
	.word	0xfde4ce24,0x4389bd44
	.word	0x660c72d8,0x7e933c54
	.word	0x7da0f475,0x313d3b76
	.word	0x77ff7cbf,0x03a327b6
	.word	0x23b6ca51,0xf0afa99c
	.word	0x462831fd,0xbdd9f515
	.word	0x1dfdae84,0x34e10f0b
	.word	0x4b57ad5e,0x0b5ef3b7
	.word	0xb5c0a828,0x2e30d227
	.word	0x89059138,0xaca61da9
	.word	0x5e286fb1,0xdd91b511
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
	.word	0x82ad7288,0x5f65ca68
	.word	0x00000000,0x00000002
	.word	0xc67e83ef,0xc0bc38cd
	.word	0x00000000,0x00000003
	.word	0xdf63d967,0x9a63528a
	.word	0x00000000,0x00000004
	.word	0x345c91d0,0x68a25636
	.word	0x00000000,0x00000005
	.word	0x1ce038a0,0x6708997e
	.word	0x00000000,0x00000006
	.word	0x5ec7a258,0x00b6c716
	.word	0x00000000,0x00000007
	.word	0xdf90fb30,0x1b950102
	.word	0x00000000,0x00000008
	.word	0xf143d20f,0xad5f3305
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
	.word	0xa2425328,0x54a7871d,0x2ec37e12,0x1151db52
	.word	0x9e08c4ab,0x6e5c9f05,0x25690df0,0xca00cfa4
	.word	0x167cf44a,0xac3d4fa5,0x592863bf,0x73a70004
	.word	0x9ce01392,0xe5042279,0x544ed51e,0xb4edb296
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
	.word	0x63552722,0x55ac9e78,0x13d5c778,0x401c9d09
	.word	0x71d4c2bc,0x9212d517,0x456fc9cb,0x62aa3f5c
	.word	0x2398c0d9,0xcdb0dea3,0xbe437fde,0xed8201d9
	.word	0x15017ea3,0x17a9b049,0xb19a9207,0x51d1fa48
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
	.word	0x06615072,0xd1c31a7f,0x27d9a4ac,0xae8f020f
	.word	0x4a3ab556,0x65b71d14,0x10a5a8e1,0xd79b8d37
	.word	0xd315c112,0xf6bdc893,0xbf81e9e1,0xac712621
	.word	0x015ce8be,0x634de226,0x8690d32a,0x42b53550
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
	.word	0x75113150,0x31ae91c7,0x63cd6657,0xd7158664
	.word	0x7fb3cebc,0xbafa81ce,0xffccb348,0xd5e557b8
	.word	0x3ad398ff,0x61e0df6b,0xadb2aff7,0xc13461a5
	.word	0xa15e6196,0x40d66bdc,0x688a289a,0xe62869dd
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
	.word	0xfb148b3b,0xa8803c86,0xaa3cb5fb,0x80a6133f
	.word	0x627015c2,0x267f3b15,0xbe1a8633,0x2d7b3f45
	.word	0xdaeaa2f9,0xc71998b3,0x4488041c,0x6bc12be7
	.word	0x9e06b803,0x84ec10b3,0xdf91e4cf,0x7e673868
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
	.word	0x31a4ecf5,0xfc75b03c,0xb1f7f919,0x68e56327
	.word	0x71ea1e28,0xaad46247,0x0fee3bab,0xb3a6898e
	.word	0x03e5fc7d,0xd7d8da15,0xbb9f8ab9,0x6bab3b4c
	.word	0x981f013f,0x667976fa,0xd0fa9f10,0x45ee7738
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
	.word	0x87313b72,0xed0d8775,0x856380ef,0x8d02ee87
	.word	0xed5ee23a,0xa7d6e5f3,0xacfd6bdb,0x465287a9
	.word	0x06119802,0x0bf46051,0xf38017bb,0xb326f358
	.word	0xcf6e1d7e,0x455acf29,0xf66a3d35,0x40198134
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
	.word	0xf6b76916,0x30872293,0xf6743566,0x73da9dfe
	.word	0xb13b83e9,0x1eb42ac5,0x8726ffb3,0x4e0c0e3c
	.word	0x2830d08e,0xcf925f71,0xe30ded2b,0x291df384
	.word	0x4d06afdb,0xcd428ed8,0x78f40af0,0x2139c938
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
	.word	0x28383b35,0xf5e23b2c,0x857412c6,0xd38fd53c
	.word	0x351c621c,0x1e9220d3,0xa58d8831,0x2b180884
	.word	0x327e141c,0xe1a419a8,0x27d25e9e,0x21ae4791
	.word	0x9bc84afb,0x4d09ffab,0x8a7778b5,0x1ebf1d31
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
	.word	0x91d26ecf,0x787b44a7,0x5601f608,0x8ebd8644
	.word	0x32d281c5,0x3b1fdd33,0xbe83f5e6,0x33ba2015
	.word	0x3afc212d,0x6eca38ea,0xbd41424b,0x5eed4426
	.word	0x2bf45e65,0x78054a31,0x66427a14,0x023e0a06
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
	.word	0xbad30960,0x47f1f3b8,0x26f1bcb0,0xb73cc1cd
	.word	0x46889c33,0x655965cc,0xd6272079,0x8735c17c
	.word	0x2f30d7e0,0xc4394112,0xcf2e94a2,0x8e551f71
	.word	0x87998ea9,0x7350c0a3,0x44b79e24,0xf97ba361
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
	.word	0x1f9c8876,0xa72c8bce,0xb5a90056,0x6f14a65c
	.word	0x7867e9bc,0xa9ef1483,0x5645428b,0x01e1fefc
	.word	0x624f4626,0xed6217f6,0xc51d1167,0xe5e46590
	.word	0x2e59b529,0xac50e74e,0x0ce958dc,0xd7e531f2
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
	.word	0xdd1cb58a,0xd4b2bcb9,0x9d63ab5c,0xd663614a
	.word	0xb0c2c21e,0x09d80d6e,0x53230d4d,0x2cda11d4
	.word	0x3df622d8,0xe4eb15fc,0x7d31ce91,0x42d0fcb0
	.word	0xc46793c0,0x95345268,0x15eae64e,0xc2ebfb0f
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
	.word	0x0337691b,0x0a5d04f9,0xcfeeb01d,0x7596fdaf
	.word	0x797054f1,0x4ab136c5,0x47591ba7,0x377970d2
	.word	0x3d6134c4,0x1e92b3df,0x1e435cbb,0xe947cf30
	.word	0x904306ce,0xa2291bf7,0xcef05593,0xceaa25d5
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
	.word	0x131bd78e,0x47ff7465,0x4b811171,0x24ebb7e8
	.word	0x5925d992,0x9bc155e2,0xac23b3e7,0xad1b91b9
	.word	0x718bc9a3,0x8972a0e2,0xe5b0cb68,0x20927fd9
	.word	0xc2cfb9cb,0x968177d3,0xafbebc17,0xc20c9c4c
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
	.word	0x4ef1a156,0xc6f6bd51,0x0900f285,0x4a6c346a
	.word	0x5d2e8547,0x823e4b11,0x913f9aa1,0x801434ba
	.word	0x5a8dbba3,0x09db15a2,0x24da35cf,0x04b82142
	.word	0xab36790b,0xaf3f12d8,0xa803ea9d,0x71949cc8
	.word	0x9cdd9ed5,0x81a4449b,0xe34d27d3,0x50e157d2
	.word	0x82bd99d2,0x914298c8,0x281629ad,0x71cc9117
	.word	0x6ef85e7f,0x59d7359d,0x069d2294,0xe1b117e8
	.word	0xb5a1ab35,0xfeadebc2,0x71d6d004,0x5397ddc6
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
	.word	0xc0c4f8e3,0x84cd5634,0x0a857986,0x4854f050
	.word	0x60a13c89,0x9bf560eb,0x6643951c,0x28c12a07
	.word	0xedcef3bb,0x3877ec6a,0x2e8c6004,0x8f12eb8f
	.word	0xa62b8653,0x6cfef44b,0x6c5fe77b,0x6b9bfc91
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
	.word	0xdbca18f2,0xba3fbd15,0x817f596b,0x59daf0f1
	.word	0xfd2b45fe,0xe6423e8a,0x9fdce61f,0xf8ea11d6
	.word	0x508f4f16,0x121c3e6a,0x09a3ee32,0xf5dfea33
	.word	0x32a2496a,0x0222817d,0x7bb43ad0,0x36e24904
	.word	0x6c62a673,0x5c54ff3c,0xaa10e77e,0x72f0cb92
	.word	0x7f6b6f2a,0xca180017,0xfa4c7f8e,0xad369d85
	.word	0x6faa5f0d,0xfe3e687f,0x186aeec9,0x75b70265
	.word	0x1e7e4852,0xdf33d3b9,0xc7ab47b0,0xea1c2de5
	.word	0x8af72f56,0xe07d4241,0xcf54ac4f,0x8e6a5a51
	.word	0x98cabcd0,0xaef6c863,0x66acc936,0x6c474b03
	.word	0x83149b78,0x2f07c7a4,0x65e01e76,0x07bd8274
	.word	0xd584db6c,0x32b8b88a,0xc247278a,0x112e6a60
	.word	0x36b41dd1,0x8eb0ef15,0xc225f355,0x2629ef3a
	.word	0x9c5b5b8f,0x8badfda3,0xd8691a66,0x9ba7282a
	.word	0x251f0c6a,0xdeaad89f,0xe91fa457,0x48cb50e8
	.word	0x8de21061,0xf898bb60,0x42302242,0x0377bf4c
	.word	0x6a7b7ac1,0xb27db1b4,0x0e7ab727,0x971cbb1b
	.word	0xa0dd382c,0x08c050dd,0xbf960aa6,0xd099a8f0
	.word	0xe20fc295,0x16ac0770,0x9171aba2,0x6dc8c0b0
	.word	0x10bd4caa,0x625da82f,0x02dffff0,0xa2776b81
	.word	0xe2d555dc,0x9dacfc88,0x6f39b064,0xa63a669a
	.word	0x5dd77be2,0x3d45e6a2,0x692e5f3e,0x38e9c118
	.word	0x921de3a1,0x46ee36c0,0xec451b60,0x3bb08007
	.word	0x9dc55920,0x0cd09d78,0x84d633b1,0x432a1a01
	.word	0x8855b2ae,0x495e5eb0,0x0f241a0d,0x6fc56882
	.word	0x0d82d522,0xe2dda478,0xd033c256,0x7c4867d4
	.word	0x6d9124d9,0x1d69fe9b,0xfde4ce24,0x4389bd44
	.word	0x660c72d8,0x7e933c54,0x7da0f475,0x313d3b76
	.word	0x773a7cbf,0x03a327b6,0x23b6ca51,0xf0afa99c
	.word	0x462831fd,0xbdd9f515,0x1dfdae84,0x34e10f0b
	.word	0x4b57ad5e,0x0b5ef3b7,0xb5c0a828,0x2e30d227
	.word	0x89059138,0xaca61da9,0x5e286fb1,0xdd91b511
share3_end:
