/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1000_4.s
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
!	Seed = 406111026
!	Riesling can be on
!	1 Thread, 1000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1000_4.s created on Apr 6, 2009 (11:10:26)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_1000_4 -p 1 -l 1000

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
!	%f0  = def3c0a1 99c197bf 83293722 a028dfc5
!	%f4  = 4e9ac385 b61105e4 182f5af9 0d3f1df2
!	%f8  = dcd3f311 07cdefd6 8f0bb3d2 5316e302
!	%f12 = 0687a2d1 665d8714 d683a6bf 1b26a934
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 59e028d5 77c99c15 aad720c7 5a483541
!	%f20 = b50fb6ec a32bc61e 6873507a 8f79bbd0
!	%f24 = 37916c18 598bd5a1 1f00a0f0 e913873f
!	%f28 = cce698f2 5724fdd7 dff6e151 561375b3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = fea24580 9c078f9d ceadd7e2 a09ecb93
!	%f36 = 9be85383 949e90b3 61e5da81 21150229
!	%f40 = bde7d24a 8250b484 ad268c0e 00e1955c
!	%f44 = 764bcf77 519d3a52 4d780f80 5d04aa2e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x6eced9df00000048,%g7,%g1 ! GSR scale =  9, align = 0
	wr	%g1,%g0,%gsr		! GSR = 6eced9df00000048
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l3 = f468074def11eff1, Mem[0000000030141410] = 5aeec272
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = f1eec272
!	Mem[0000000021800080] = 3709535a, %l6 = 4e3ad421a756b5f4
	ldub	[%o3+0x081],%l6		! %l6 = 0000000000000009
!	Mem[0000000010041410] = 1b0acbe5, %l2 = c83e4615d6830b5f
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 0000001b000000ff
!	Mem[0000000030101408] = 650769ed, %l5 = 57864bbc9d432fba
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 00000000650769ed
!	Mem[0000000030181408] = d001ecd6, %l0 = 63941a70357da65b
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000d6
!	Mem[00000000218000c0] = 2c720980, %l3 = f468074def11eff1
	ldsba	[%o3+0x0c1]%asi,%l3	! %l3 = 0000000000000072
!	Mem[0000000010001410] = b8d6bd8c 3e9d4b96, %l6 = 00000009, %l7 = 2d59317c
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000003e9d4b96 00000000b8d6bd8c
!	Mem[0000000030081410] = 95b7d15e, %l3 = 0000000000000072
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 0000000095b7d15e
!	%l6 = 000000003e9d4b96, Mem[0000000010041410] = e5cb0aff
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = e5cb4b96
!	Starting 10 instruction Store Burst
!	%l6 = 000000003e9d4b96, Mem[0000000030141408] = c8c4dc64
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 4b96dc64

p0_label_2:
!	Mem[0000000010141410] = 01c427af, %l6 = 000000003e9d4b96
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 0000000001c427af
!	Mem[0000000030001400] = 6f2cccc4, %l1 = a5b8e582c1fe3540
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 0000006f000000ff
!	%l2 = 0000001b, %l3 = 95b7d15e, Mem[0000000010001408] = b87a98d8 95e5f1bc
	stda	%l2,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000001b 95b7d15e
!	%l4 = b16f4b8878b442b0, Mem[0000000010001400] = d0e3baa22908df1e
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = b16f4b8878b442b0
!	%l1 = 000000000000006f, Mem[0000000030001410] = bc4ba9ed
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = bc4ba96f
!	%l6 = 0000000001c427af, Mem[0000000030101410] = cf544eb9
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 01c427af
!	Mem[00000000100c1410] = 5d4aaaf8, %l5 = 00000000650769ed
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 0000005d000000ff
!	%l3 = 0000000095b7d15e, Mem[0000000010101400] = aba41e70e9a690c7
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000095b7d15e
!	%l7 = 00000000b8d6bd8c, Mem[0000000010101400] = 00000000
	stba	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 8c000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 64dc964b, %f28 = cce698f2
	lda	[%i5+%o4]0x89,%f28	! %f28 = 64dc964b

p0_label_3:
!	Mem[0000000030081400] = 1e50bb5a cde27cf9, %l2 = 0000001b, %l3 = 95b7d15e
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 000000001e50bb5a 00000000cde27cf9
!	Mem[0000000010001400] = 884b6fb1, %f4  = 4e9ac385
	lda	[%i0+%g0]0x88,%f4 	! %f4 = 884b6fb1
!	Mem[0000000010001410] = b8d6bd8c3e9d4b96, %f0  = def3c0a1 99c197bf
	ldda	[%i0+%o5]0x88,%f0 	! %f0  = b8d6bd8c 3e9d4b96
!	Mem[0000000010081414] = 6e09c4b0, %l5 = 000000000000005d
	ldsb	[%i2+0x016],%l5		! %l5 = ffffffffffffffc4
!	Mem[0000000010141404] = ea6d5eea, %l3 = 00000000cde27cf9
	lduw	[%i5+0x004],%l3		! %l3 = 00000000ea6d5eea
!	Mem[0000000030181400] = d68bd32b, %f0  = b8d6bd8c
	lda	[%i6+%g0]0x81,%f0 	! %f0 = d68bd32b
!	Mem[0000000030001410] = bc4ba96f, %l3 = 00000000ea6d5eea
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 000000000000006f
!	Mem[00000000100c1430] = 22c594ec, %l6 = 0000000001c427af
	ldsba	[%i3+0x032]%asi,%l6	! %l6 = ffffffffffffff94
!	Mem[0000000010141400] = 509920c7, %l4 = b16f4b8878b442b0
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffc7
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 3236cde7, %l1 = 000000000000006f
	swap	[%i6+0x028],%l1		! %l1 = 000000003236cde7

p0_label_4:
!	%l2 = 000000001e50bb5a, Mem[00000000300c1408] = 1238f944
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = bb5af944
!	Mem[0000000010081414] = 6e09c4b0, %l3 = 0000006f, %l5 = ffffffc4
	add	%i2,0x14,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 000000006e09c4b0
!	%l0 = 00000000000000d6, Mem[0000000030001410] = 6fa94bbc
	stha	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00d64bbc
!	%l4 = ffffffffffffffc7, Mem[0000000010141408] = 7ce981e7
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = c7e981e7
!	%l5 = 000000006e09c4b0, Mem[0000000010181414] = 2667dead, %asi = 80
	stha	%l5,[%i6+0x014]%asi	! Mem[0000000010181414] = c4b0dead
!	%f8  = dcd3f311 07cdefd6, Mem[0000000030181400] = 2bd38bd6 8285d220
	stda	%f8 ,[%i6+%g0]0x89	! Mem[0000000030181400] = dcd3f311 07cdefd6
!	Mem[0000000010001408] = 0000001b, %l2 = 000000001e50bb5a
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%f15 = 1b26a934, Mem[0000000010081420] = a1407e96
	sta	%f15,[%i2+0x020]%asi	! Mem[0000000010081420] = 1b26a934
!	%l2 = 0000000000000000, Mem[0000000010001408] = ff00001b
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = b4fdc56e, %l5 = 000000006e09c4b0
	lduha	[%i4+0x01a]%asi,%l5	! %l5 = 000000000000c56e

p0_label_5:
!	Mem[0000000030141410] = f1eec2720abed08c, %l1 = 000000003236cde7
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = f1eec2720abed08c
!	Mem[00000000211c0000] = ffc00619, %l5 = 000000000000c56e
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffc0
!	Mem[0000000010081408] = 1d16ff86faf4a072, %f16 = 59e028d5 77c99c15
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 1d16ff86 faf4a072
!	Mem[0000000010081430] = d6a4f28a363c5ef6, %l7 = 00000000b8d6bd8c
	ldxa	[%i2+0x030]%asi,%l7	! %l7 = d6a4f28a363c5ef6
!	Mem[0000000030081410] = 5ed1b795, %l6 = ffffffffffffff94
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 000000005ed1b795
!	Mem[0000000010101410] = 77ecca3d28694386, %f8  = dcd3f311 07cdefd6
	ldda	[%i4+%o5]0x88,%f8 	! %f8  = 77ecca3d 28694386
!	Mem[0000000010001400] = b16f4b88, %l1 = f1eec2720abed08c
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffb1
!	Mem[00000000300c1410] = 57417234, %l3 = 000000000000006f
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000057
!	Mem[0000000030101400] = 1640369b, %l3 = 0000000000000057
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 000000001640369b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 9a3a06ab, %l4 = ffffffffffffffc7
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 000000009a3a06ab

p0_label_6:
!	%f4  = 884b6fb1 b61105e4, Mem[0000000010181400] = 936573a6 79a26200
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 884b6fb1 b61105e4
!	%f4  = 884b6fb1 b61105e4, %l7 = d6a4f28a363c5ef6
!	Mem[0000000030081400] = 1e50bb5acde27cf9
	stda	%f4,[%i2+%l7]ASI_PST8_S ! Mem[0000000030081400] = 884b6fb1cd1105f9
!	%l2 = 0000000000000000, Mem[000000001010141c] = e04450d1, %asi = 80
	stwa	%l2,[%i4+0x01c]%asi	! Mem[000000001010141c] = 00000000
!	Mem[0000000030081410] = 5ed1b795, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000095000000ff
!	Mem[0000000010001418] = 7973e1b3, %l3 = 000000001640369b
	swap	[%i0+0x018],%l3		! %l3 = 000000007973e1b3
!	%f16 = 1d16ff86 faf4a072, %l5 = ffffffffffffffc0
!	Mem[0000000030141410] = f1eec2720abed08c
	add	%i5,0x010,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030141410] = f1eec2720abed08c
!	%f0  = d68bd32b 3e9d4b96, Mem[0000000010141410] = 964b9d3e 94166c3a
	stda	%f0 ,[%i5+%o5]0x88	! Mem[0000000010141410] = d68bd32b 3e9d4b96
!	Mem[0000000030181408] = d6ec01d0, %l6 = 000000005ed1b795
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 000000d6000000ff
!	%l3 = 000000007973e1b3, Mem[0000000030101408] = ed690765
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 7973e1b3
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 43ce5375f45fe3d2, %f6  = 182f5af9 0d3f1df2
	ldda	[%i0+%o4]0x81,%f6 	! %f6  = 43ce5375 f45fe3d2

p0_label_7:
!	Mem[0000000010001410] = 964b9d3e, %f14 = d683a6bf
	lda	[%i0+%o5]0x80,%f14	! %f14 = 964b9d3e
!	Mem[0000000030081400] = 884b6fb1, %l3 = 000000007973e1b3
	ldsha	[%i2+%g0]0x81,%l3	! %l3 = ffffffffffff884b
!	Mem[0000000030081400] = 884b6fb1cd1105f9, %f30 = dff6e151 561375b3
	ldda	[%i2+%g0]0x81,%f30	! %f30 = 884b6fb1 cd1105f9
!	Mem[0000000010041410] = 964bcbe5, %l3 = ffffffffffff884b
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000096
!	Mem[0000000030141408] = 64dc964b, %l5 = ffffffffffffffc0
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffff964b
!	Mem[0000000010001408] = 00000000, %l4 = 000000009a3a06ab
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 6412a6c5cb26e166, %f12 = 0687a2d1 665d8714
	ldda	[%i6+%o5]0x89,%f12	! %f12 = 6412a6c5 cb26e166
!	Mem[000000001000143c] = 87d5e890, %l6 = 00000000000000d6
	lduba	[%i0+0x03f]%asi,%l6	! %l6 = 0000000000000090
!	Mem[0000000010081408] = 1d16ff86, %l5 = ffffffffffff964b
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 000000000000001d
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffc00619, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00000619

p0_label_8:
!	%l3 = 0000000000000096, Mem[0000000010081408] = 72a0f4fa86ff161d
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000096
!	%l5 = 000000000000001d, Mem[0000000030141410] = f1eec272
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000001d
!	%l2 = 0000000000000095, Mem[0000000010101410] = 28694386
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 28690095
!	%f0  = d68bd32b 3e9d4b96, Mem[00000000300c1400] = 61669a8b 063a5713
	stda	%f0 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = d68bd32b 3e9d4b96
!	%l2 = 0000000000000095, Mem[0000000030181400] = dcd3f31107cdefd6
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000095
!	Mem[0000000030041408] = 39cb4cd9, %l3 = 0000000000000096
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000039000000ff
!	%f0  = d68bd32b 3e9d4b96 83293722 a028dfc5
!	%f4  = 884b6fb1 b61105e4 43ce5375 f45fe3d2
!	%f8  = 77ecca3d 28694386 8f0bb3d2 5316e302
!	%f12 = 6412a6c5 cb26e166 964b9d3e 1b26a934
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l0 = 00000000000000d6, Mem[00000000300c1410] = 34724157
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 347241d6
!	%l4 = 0000000000000000, Mem[0000000030041408] = d94ccbff
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = d94c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 66e126cbc5a61264, %l2 = 0000000000000095
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = 66e126cbc5a61264

p0_label_9:
!	Mem[00000000300c1408] = b4c203cd44f95abb, %f30 = 884b6fb1 cd1105f9
	ldda	[%i3+%o4]0x89,%f30	! %f30 = b4c203cd 44f95abb
!	Mem[0000000010181408] = 5e6913849cfa2ec4, %l0 = 00000000000000d6
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = 5e6913849cfa2ec4
!	Mem[0000000030041408] = d94c0000, %l0 = 5e6913849cfa2ec4
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081420] = 1b26a93493a25ee0, %l2 = 66e126cbc5a61264
	ldx	[%i2+0x020],%l2		! %l2 = 1b26a93493a25ee0
!	Mem[00000000300c1408] = bb5af944, %f20 = b50fb6ec
	lda	[%i3+%o4]0x81,%f20	! %f20 = bb5af944
!	Mem[00000000300c1408] = b4c203cd44f95abb, %l5 = 000000000000001d
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = b4c203cd44f95abb
!	Mem[0000000030181400] = 95000000, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 0000000000009500
!	Mem[00000000100c1408] = ffffffc7, %l1 = ffffffffffffffb1
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000c7
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001438] = c7fa2d4c, %l2 = 1b26a93493a25ee0
	ldswa	[%i0+0x038]%asi,%l2	! %l2 = ffffffffc7fa2d4c
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010101410] = 28690095
	stwa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000

p0_label_10:
!	%l7 = d6a4f28a363c5ef6, Mem[0000000010001408] = 5ed1b79500000000
	stxa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = d6a4f28a363c5ef6
!	%f0  = d68bd32b 3e9d4b96 83293722 a028dfc5
!	%f4  = 884b6fb1 b61105e4 43ce5375 f45fe3d2
!	%f8  = 77ecca3d 28694386 8f0bb3d2 5316e302
!	%f12 = 6412a6c5 cb26e166 964b9d3e 1b26a934
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%l7 = d6a4f28a363c5ef6, Mem[0000000030001410] = 884b6fb1
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 5ef66fb1
!	Mem[00000000100c1408] = ffffffc7, %l5 = b4c203cd44f95abb
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 000000c7000000ff
!	%l6 = 0000000000000090, Mem[00000000300c1410] = 347241d6
	stba	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 34724190
!	%f18 = aad720c7, Mem[00000000100c1400] = 0fff847c
	sta	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = aad720c7
!	Mem[0000000010001410] = 964b9d3e, %l3 = 0000000000000039
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000096000000ff
!	Mem[0000000030141410] = 0000001d, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = 0000000000000090, Mem[0000000030081410] = ffb7d15e
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0090d15e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = e40511b6 b16ff65e, %l6 = 00000090, %l7 = 363c5ef6
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000b16ff65e 00000000e40511b6

p0_label_11:
!	Mem[0000000010041408] = 98e97953, %f24 = 37916c18
	lda	[%i1+%o4]0x80,%f24	! %f24 = 98e97953
!	Mem[0000000010181410] = 121acd84, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 000000000000121a
!	Mem[0000000010041400] = b4033e5f 13c04208 98e97953 843f02a8
!	Mem[0000000010041410] = 964bcbe5 b8b9567f ee264689 2a1575f1
!	Mem[0000000010041420] = c43c071a 76c164d0 3f525441 d08c544d
!	Mem[0000000010041430] = c6440722 e5b3a3bb cb90f33f 7d79d4f6
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400
!	Mem[0000000030101400] = 1640369b, %l7 = 00000000e40511b6
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 000000000000009b
!	Mem[0000000010181400] = 884b6fb1 b61105e4, %l6 = b16ff65e, %l7 = 0000009b
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000884b6fb1 00000000b61105e4
!	Mem[0000000010041400] = b4033e5f 13c04208, %l4 = 0000121a, %l5 = 000000c7
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000b4033e5f 0000000013c04208
!	Mem[0000000030001400] = 2bd38bd6, %l7 = 00000000b61105e4
	ldsba	[%i0+%g0]0x89,%l7	! %l7 = ffffffffffffffd6
!	Mem[0000000010001400] = b16f4b88, %f24 = 98e97953
	lda	[%i0+%g0]0x80,%f24	! %f24 = b16f4b88
!	Mem[0000000030081410] = 99f3e70d 5ed19000, %l4 = b4033e5f, %l5 = 13c04208
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 000000005ed19000 0000000099f3e70d
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = b16f4b88, %l7 = ffffffffffffffd6
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000b1000000ff

p0_label_12:
!	Mem[00000000100c1410] = ff4aaaf8, %l7 = 00000000000000b1
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 66e126cb
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ffe126cb
!	%l1 = 00000000000000c7, Mem[0000000010101410] = 884b6fb1
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00c76fb1
!	%l4 = 000000005ed19000, Mem[0000000010081408] = 00000096
	stwa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 5ed19000
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 00000000884b6fb1, Mem[0000000010041416] = b8b9567f
	stb	%l6,[%i1+0x016]		! Mem[0000000010041414] = b8b9b17f
!	%f2  = a8023f84 5379e998, Mem[0000000030101400] = 9b364016 500ea657
	stda	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = a8023f84 5379e998
!	%f29 = 5724fdd7, Mem[0000000030041410] = 8d6306a0
	sta	%f29,[%i1+%o5]0x81	! Mem[0000000030041410] = 5724fdd7
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = 44f95abb
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[000000001004143c] = 7d79d4f6, %l7 = 000000ff, %l4 = 5ed19000
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 000000007d79d4f6
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 5724fdd7, %l2 = ffffffffc7fa2d4c
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000057

p0_label_13:
!	Mem[0000000010001410] = ff4b9d3e, %l7 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 000000000000ff4b
!	Mem[0000000010181410] = 121acd84, %l0 = 0000000000009500
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000012
!	Mem[0000000010101408] = c5df28a022372983, %l1 = 00000000000000c7
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = c5df28a022372983
!	Mem[0000000030181400] = 00000000 00000095, %l6 = 884b6fb1, %l7 = 0000ff4b
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000095 0000000000000000
!	Mem[0000000010101408] = 22372983, %l2 = 0000000000000057
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffff83
!	Mem[0000000030081410] = 0090d15e, %l2 = ffffffffffffff83
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 000000000090d15e
!	Mem[0000000030041408] = 00004cd9abebb5a3, %l6 = 0000000000000095
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = 00004cd9abebb5a3
!	Mem[0000000020800000] = a4fe5636, %l0 = 0000000000000012
	ldsba	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffa4
!	Mem[0000000010081400] = 62fa10da a4121063 0090d15e 00000000
!	Mem[0000000010081410] = fbe6a5a8 6e09c4b0 f853eae2 37b70ff2
!	Mem[0000000010081420] = 1b26a934 93a25ee0 8267c920 744bcb8b
!	Mem[0000000010081430] = d6a4f28a 363c5ef6 e10df74c ac71bc28
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffffffff, %l4 = 000000007d79d4f6
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffffffff

p0_label_14:
!	%l7 = 0000000000000000, Mem[0000000030101410] = af27c401
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000c401
!	%l2 = 0090d15e, %l3 = 00000096, Mem[0000000030101410] = 0000c401 7168212c
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0090d15e 00000096
!	Mem[0000000010101400] = d68bd32b, %l6 = 00004cd9abebb5a3
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 000000d6000000ff
!	Mem[0000000030141410] = ff00001d, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff00001d
	membar	#Sync			! Added by membar checker (3)
!	%l7 = 00000000ff00001d, Mem[0000000010081410] = fbe6a5a8
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 1de6a5a8
!	Mem[00000000211c0000] = 00000619, %l0 = ffffffffffffffa4
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	%f28 = f65e3c36 8af2a4d6, %l1 = c5df28a022372983
!	Mem[0000000030181408] = ffec01d06d972275
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181408] = d6a401d06d9722f6
!	%l2 = 000000000090d15e, Mem[00000000100c1438] = 2c9b1b55
	sth	%l2,[%i3+0x038]		! Mem[00000000100c1438] = d15e1b55
!	%l1 = c5df28a022372983, Mem[0000000010101400] = ff8bd32b
	stba	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 838bd32b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = a8a5e61d, %l6 = 00000000000000d6
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 000000000000e61d

p0_label_15:
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000e61d
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = b3e17379, %l4 = 00000000ffffffff
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = ffffffffb3e17379
!	Mem[00000000211c0000] = ff000619, %l2 = 000000000090d15e
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 7d79d4f6, %f7  = 894626ee
	ld	[%i3+%o4],%f7 	! %f7 = 7d79d4f6
!	Mem[0000000010181414] = c4b0dead, %l3 = 0000000000000096
	ldsw	[%i6+0x014],%l3		! %l3 = ffffffffc4b0dead
!	Mem[0000000030041408] = 00004cd9, %l7 = 00000000ff00001d
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = 29e637be, %l7 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 00000000000029e6
!	Mem[0000000020800000] = a4fe5636, %l6 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l6	! %l6 = 00000000000000fe
!	Mem[0000000020800000] = a4fe5636, %l4 = ffffffffb3e17379
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 000000000000a4fe
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 5465ee02, %l0 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000054000000ff

p0_label_16:
!	%l3 = ffffffffc4b0dead, Mem[0000000030001410] = 5ef66fb1
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = adf66fb1
!	%f0  = 0842c013 5f3e03b4 a8023f84 5379e998
!	%f4  = 7f56b9b8 e5cb4b96 f175152a 7d79d4f6
!	%f8  = d064c176 1a073cc4 4d548cd0 4154523f
!	%f12 = bba3b3e5 220744c6 f6d4797d 3ff390cb
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[0000000030001408] = 83293722, %l1 = c5df28a022372983
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000083293722
!	%f28 = f65e3c36 8af2a4d6, Mem[0000000010181410] = 84cd1a12 addeb0c4
	stda	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = f65e3c36 8af2a4d6
!	%f16 = 631012a4 da10fa62 00000000 5ed19000
!	%f20 = b0c4096e a8a5e6fb f20fb737 e2ea53f8
!	%f24 = e05ea293 34a9261b 8bcb4b74 20c96782
!	%f28 = f65e3c36 8af2a4d6 28bc71ac 4cf70de1
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%l2 = 00000000, %l3 = c4b0dead, Mem[0000000010101408] = 83293722 a028dfc5
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 c4b0dead
!	%l0 = 00000054, %l1 = 83293722, Mem[0000000010181418] = 6722e433 d808dd25
	std	%l0,[%i6+0x018]		! Mem[0000000010181418] = 00000054 83293722
!	%l0 = 00000054, %l1 = 83293722, Mem[00000000100c1410] = f8aa4aff 19f42b9a
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000054 83293722
!	%l0 = 00000054, %l1 = 83293722, Mem[0000000030081400] = 884b6fb1 cd1105f9
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000054 83293722
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 8af2a4d6, %l7 = 00000000000029e6
	lduwa	[%i0+0x00c]%asi,%l7	! %l7 = 000000008af2a4d6

p0_label_17:
!	Mem[0000000030081400] = 00000054, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 4ec21e91, %l7 = 000000008af2a4d6
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 000000000000004e
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010041410] = 7f56b9b8e5cb4b96, %l3 = ffffffffc4b0dead
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 7f56b9b8e5cb4b96
!	Mem[0000000010181434] = 408d6ad5, %f4  = 7f56b9b8
	lda	[%i6+0x034]%asi,%f4 	! %f4 = 408d6ad5
!	Mem[0000000010041400] = 0842c013 5f3e03b4 a8023f84 5379e998
!	Mem[0000000010041410] = 7f56b9b8 e5cb4b96 f175152a 7d79d4f6
!	Mem[0000000010041420] = d064c176 1a073cc4 4d548cd0 4154523f
!	Mem[0000000010041430] = bba3b3e5 220744c6 f6d4797d 3ff390cb
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	Mem[0000000010181410] = d6a4f28a, %l1 = 0000000083293722
	ldsha	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffd6a4
!	Mem[0000000010041410] = 7f56b9b8, %l6 = 00000000000000fe
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 000000007f56b9b8
!	%l3 = 7f56b9b8e5cb4b96, Mem[00000000201c0001] = ff65ee02
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = ff96ee02
!	Mem[0000000030101400] = 843f02a8, %l5 = 0000000099f3e70d
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000a8
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (5)
!	%l5 = 00000000000000a8, Mem[0000000010041418] = f175152a7d79d4f6
	stx	%l5,[%i1+0x018]		! Mem[0000000010041418] = 00000000000000a8

p0_label_18:
!	%l0 = 00000054, %l1 = ffffd6a4, Mem[0000000030041410] = d7fd2457 3fe31914
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000054 ffffd6a4
!	%l4 = 000000000000a4fe, Mem[0000000010141400] = 62fa10daa4121063
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000a4fe
!	%l0 = 0000000000000054, Mem[0000000030081410] = 0090d15e
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 5490d15e
!	%f6  = f6d4797d 2a1575f1, %l7 = 000000000000004e
!	Mem[0000000010041408] = a8023f845379e998
	add	%i1,0x008,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041408] = f6d4797d2a15e998
!	%f18 = 00000000 5ed19000, %l4 = 000000000000a4fe
!	Mem[0000000030181428] = 1c329a43b69606f2
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_S ! Mem[0000000030181428] = 000000005ed106f2
!	Mem[0000000010141419] = f20fb737, %l6 = 000000007f56b9b8
	ldstuba	[%i5+0x019]%asi,%l6	! %l6 = 0000000f000000ff
!	%l6 = 0000000f, %l7 = 0000004e, Mem[0000000010001400] = 884b6fff b042b478
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000f 0000004e
!	Mem[00000000300c1400] = 964b9d3e, %l3 = 7f56b9b8e5cb4b96
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000096000000ff
!	%l1 = ffffffffffffd6a4, Mem[0000000010181400] = 884b6fb1b61105e4
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffffffffd6a4
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 964b9d3e1b26a934, %l0 = 0000000000000054
	ldx	[%i4+0x038],%l0		! %l0 = 964b9d3e1b26a934

p0_label_19:
!	Mem[0000000030081400] = 54000000, %l7 = 000000000000004e
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = c42efa9c, %l0 = 964b9d3e1b26a934
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 000000000000c42e
!	Mem[00000000211c0000] = ff000619, %l6 = 000000000000000f
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = d68bd32b 3e9d4b96, %l0 = 0000c42e, %l1 = ffffd6a4
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000d68bd32b 000000003e9d4b96
!	Mem[0000000010101408] = 00000000, %f8  = c43c071a
	lda	[%i4+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000030181408] = f622976dd001a4d6, %f16 = 631012a4 da10fa62
	ldda	[%i6+%o4]0x89,%f16	! %f16 = f622976d d001a4d6
!	Mem[00000000100c1418] = 6b139b60, %l3 = 0000000000000096
	ldsh	[%i3+0x01a],%l3		! %l3 = ffffffffffff9b60
!	Mem[0000000010001410] = b8d6bd8c3e9d4bff, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l2	! %l2 = b8d6bd8c3e9d4bff
!	Mem[00000000100c1400] = c720d7aa, %f8  = 00000000
	lda	[%i3+%g0]0x80,%f8 	! %f8 = c720d7aa
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = cb26e1ff, %l3 = ffffffffffff9b60
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_20:
!	%f14 = cb90f33f 7d79d4f6, %l0 = 00000000d68bd32b
!	Mem[0000000010001410] = ff4b9d3e8cbdd6b8
	add	%i0,0x010,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001410] = f6d4797d3ff390cb
!	%l4 = 000000000000a4fe, Mem[0000000030001400] = 2bd38bd6
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000a4fe
!	%f24 = e05ea293 34a9261b, Mem[0000000010081410] = a8a5e61d b0c4096e
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = e05ea293 34a9261b
!	Mem[00000000201c0001] = ff96ee02, %l1 = 000000003e9d4b96
	ldstub	[%o0+0x001],%l1		! %l1 = 00000096000000ff
!	Mem[00000000211c0001] = ff000619, %l2 = b8d6bd8c3e9d4bff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181428] = 0000006f9dcac4f4, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 0000006f9dcac4f4
!	%l3 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030001410] = b16ff6ad e40511b6
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 000000ff
!	%f29 = 8af2a4d6, Mem[0000000010001410] = 7d79d4f6
	sta	%f29,[%i0+%o5]0x88	! Mem[0000000010001410] = 8af2a4d6
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 8af2a4d6, %l1 = 0000000000000096
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffffa4d6

p0_label_21:
!	Mem[0000000010141410] = b0c4096e, %l3 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000b0c4
!	Mem[0000000010181410] = d6a4f28a, %f30 = 28bc71ac
	lda	[%i6+%o5]0x80,%f30	! %f30 = d6a4f28a
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030041400] = e6604620 b271d4f2 00004cd9 abebb5a3
!	Mem[0000000030041410] = 54000000 a4d6ffff 64a4b6d8 955f911b
!	Mem[0000000030041420] = 52e27a4e eafd9d40 9ea748b9 892a9ea7
!	Mem[0000000030041430] = 37b92bbb c5e59985 e866e62f 24e272d8
	ldda	[%i1]ASI_BLK_SL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010041400] = 0842c013, %l5 = 00000000000000a8
	ldub	[%i1+0x003],%l5		! %l5 = 0000000000000013
!	Mem[0000000030181408] = f622976dd001a4d6, %f24 = e05ea293 34a9261b
	ldda	[%i6+%o4]0x89,%f24	! %f24 = f622976d d001a4d6
!	Mem[0000000010081430] = d6a4f28a, %l1 = ffffffffffffa4d6
	lduh	[%i2+0x032],%l1		! %l1 = 000000000000f28a
!	Mem[0000000030001410] = 00000000, %l6 = 0000006f9dcac4f4
	lduha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = b3e17379, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000079
!	Mem[0000000010001410] = d6a4f28a, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000d6
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l0 = 00000000d68bd32b
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_22:
!	Mem[0000000010181438] = d5205251b9959758, %l7 = 0000000000000079, %l5 = 0000000000000013
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = d5205251b9959758
!	%l7 = 0000000000000079, Mem[0000000010041438] = f6d4797d3ff390cb
	stx	%l7,[%i1+0x038]		! Mem[0000000010041438] = 0000000000000079
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 54000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff0000
!	Mem[0000000010081420] = 1b26a93493a25ee0, %l2 = 0000000000000000, %l3 = 000000000000b0c4
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 1b26a93493a25ee0
!	%f0  = f2d471b2 204660e6 a3b5ebab d94c0000
!	%f4  = ffffd6a4 00000054 1b915f95 d8b6a464
!	%f8  = 409dfdea 4e7ae252 a79e2a89 b948a79e
!	%f12 = 8599e5c5 bb2bb937 d872e224 2fe666e8
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000030001408] = 83293722, %l0 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000022000000ff
	membar	#Sync			! Added by membar checker (7)
!	%f24 = f622976d, Mem[0000000010141400] = b271d4f2
	sta	%f24,[%i5+%g0]0x88	! Mem[0000000010141400] = f622976d
!	%f24 = f622976d d001a4d6, %l3 = 1b26a93493a25ee0
!	Mem[0000000010081418] = f853eae237b70ff2
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081418] = f853eae237b70ff2
!	%l0 = 0000000000000022, Mem[0000000010041410] = b8b9567f
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000022
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = d2e188d6 7b9de417, %l4 = 0000a4fe, %l5 = b9959758
	ldd	[%i0+0x028],%l4		! %l4 = 00000000d2e188d6 000000007b9de417

p0_label_23:
!	Mem[00000000201c0000] = ffffee02, %l7 = 0000000000000079
	ldub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1434] = 68a9dd5d, %l5 = 000000007b9de417
	ldswa	[%i3+0x034]%asi,%l5	! %l5 = 0000000068a9dd5d
!	Mem[0000000010001408] = 363c5ef6, %l5 = 0000000068a9dd5d
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 00000000363c5ef6
!	Mem[0000000030001400] = fea40000 3e9d4b96, %l4 = d2e188d6, %l5 = 363c5ef6
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000fea40000 000000003e9d4b96
!	Mem[0000000030141408] = 4b96dc64, %f0  = f2d471b2
	lda	[%i5+%o4]0x81,%f0 	! %f0 = 4b96dc64
!	Mem[0000000030141410] = 00000000, %f7  = d8b6a464
	lda	[%i5+%o5]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010141400] = 6d9722f6, %l5 = 000000003e9d4b96
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 000000000000006d
!	Mem[00000000300c1400] = ff4b9d3e 2bd38bd6, %l6 = 000000d6, %l7 = 000000ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff4b9d3e 000000002bd38bd6
!	Mem[0000000010141400] = 6d9722f6, %l1 = 000000000000f28a
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000006d, Mem[0000000021800041] = e76d609e
	stb	%l1,[%o3+0x041]		! Mem[0000000021800040] = e76d609e

p0_label_24:
!	%l2 = 0000000000000000, Mem[0000000010181400] = ffffffffffffd6a4, %asi = 80
	stxa	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000000
!	Mem[0000000030141400] = 7aa4f9da, %l0 = 0000000000000022
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000da000000ff
!	Mem[0000000010141400] = f622976d, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000f622976d
!	%f18 = 00000000 5ed19000, Mem[0000000030141410] = 00000000 8cd0be0a
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 5ed19000
!	%f21 = a8a5e6fb, Mem[0000000030101400] = 843f02a8
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = a8a5e6fb
!	Mem[0000000010041408] = f6d4797d, %l3 = 1b26a93493a25ee0
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000f6d4797d
!	Mem[0000000030101408] = 7973e1b3, %l0 = 00000000000000da
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000079000000ff
!	%l4 = 00000000fea40000, Mem[0000000030081400] = 0000005483293722
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000fea40000
!	%l5 = 000000000000006d, Mem[00000000100c1418] = 6b139b6009154c91
	stx	%l5,[%i3+0x018]		! Mem[00000000100c1418] = 000000000000006d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = b3e173ff, %f15 = 2fe666e8
	lda	[%i4+%o4]0x89,%f15	! %f15 = b3e173ff

p0_label_25:
!	Mem[00000000100c1408] = 7d79d4f6, %l7 = 000000002bd38bd6
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 000000000000007d
!	Mem[0000000010081400] = 62fa10daa4121063, %f14 = d872e224 b3e173ff
	ldd	[%i2+%g0],%f14		! %f14 = 62fa10da a4121063
!	Mem[0000000030081410] = 5490d15e, %f6  = 1b915f95
	lda	[%i2+%o5]0x81,%f6 	! %f6 = 5490d15e
!	Mem[00000000300c1400] = ff4b9d3e, %l4 = 00000000fea40000
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff4b9d3e
!	Mem[0000000010041400] = b4033e5f 13c04208, %l0 = 00000079, %l1 = 0000006d
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000013c04208 00000000b4033e5f
!	Mem[0000000010041410] = 22000000 e5cb4b96, %l2 = f622976d, %l3 = f6d4797d
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000022000000 00000000e5cb4b96
!	Mem[0000000030001410] = 00000000, %l1 = 00000000b4033e5f
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041438] = 00000000, %l0 = 0000000013c04208
	ldsha	[%i1+0x03a]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00ff0000, %l6 = 00000000ff4b9d3e
	lduw	[%i3+%o5],%l6		! %l6 = 0000000000ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 8f0bb3d25316e302, %l7 = 000000000000007d, %l4 = 00000000ff4b9d3e
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 8f0bb3d25316e302

p0_label_26:
!	%l5 = 000000000000006d, Mem[0000000030101400] = fbe6a5a85379e998
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000000000006d
!	%l7 = 000000000000007d, Mem[00000000100c1410] = 00ff0000
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000007d
!	%l5 = 000000000000006d, Mem[0000000010141400] = 00000000
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 006d0000
!	Mem[0000000030141400] = 7aa4f9ff, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 000000007aa4f9ff
!	Mem[0000000010141403] = 006d0000, %l0 = 0000000000000000
	ldstub	[%i5+0x003],%l0		! %l0 = 00000000000000ff
!	%f8  = 409dfdea, Mem[0000000030141400] = 00000000
	sta	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 409dfdea
!	%l6 = 00ff0000, %l7 = 0000007d, Mem[0000000010081400] = da10fa62 631012a4
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff0000 0000007d
!	%f14 = 62fa10da, Mem[0000000030041408] = 00004cd9
	sta	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = 62fa10da
!	%l7 = 000000000000007d, Mem[00000000300c1410] = 34724190
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3472007d
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 000000a8, %l0 = 0000000000000000
	ldswa	[%i1+0x01c]%asi,%l0	! %l0 = 00000000000000a8

p0_label_27:
!	%f28 = f65e3c36 8af2a4d6, Mem[0000000010081410] = 1b26a934 93a25ee0
	stda	%f28,[%i2+0x010]%asi	! Mem[0000000010081410] = f65e3c36 8af2a4d6
!	Mem[0000000030141408] = 78498246 64dc964b, %l6 = 00ff0000, %l7 = 0000007d
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000064dc964b 0000000078498246
!	Mem[0000000030141400] = eafd9d40, %l1 = 000000007aa4f9ff
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 00000000000000ea
!	Mem[0000000010181410] = 8af2a4d6, %f2  = a3b5ebab
	lda	[%i6+%o5]0x88,%f2 	! %f2 = 8af2a4d6
!	Mem[0000000030141400] = eafd9d408e11221e, %l3 = 00000000e5cb4b96
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = eafd9d408e11221e
!	Mem[0000000010181408] = 9cfa2ec4, %l5 = 000000000000006d
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000c4
!	Mem[000000001004143c] = 00000079, %l5 = 00000000000000c4
	lduwa	[%i1+0x03c]%asi,%l5	! %l5 = 0000000000000079
!	Mem[00000000300c1400] = ff4b9d3e2bd38bd6, %l7 = 0000000078498246
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = ff4b9d3e2bd38bd6
!	Mem[0000000030041408] = da10fa62, %l2 = 0000000022000000
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = fffffffffffffa62
!	Starting 10 instruction Store Burst
!	%l6 = 0000000064dc964b, Mem[0000000010141410] = ffffd6a400000054
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000064dc964b

p0_label_28:
!	%l0 = 000000a8, %l1 = 000000ea, Mem[0000000010181400] = 00000000 00000000
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000a8 000000ea
!	Mem[0000000030041410] = 00000054, %l4 = 8f0bb3d25316e302
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000054000000ff
!	Mem[00000000100c1400] = c720d7aa, %l0 = 00000000000000a8
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 000000c7000000ff
!	Mem[0000000030001408] = 832937ff, %l1 = 00000000000000ea
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l0 = 000000c7, %l1 = 000000ff, Mem[0000000010001418] = 1640369b d48afdc6
	std	%l0,[%i0+0x018]		! Mem[0000000010001418] = 000000c7 000000ff
!	%f0  = 4b96dc64 204660e6 8af2a4d6 d94c0000
!	%f4  = ffffd6a4 00000054 5490d15e 00000000
!	%f8  = 409dfdea 4e7ae252 a79e2a89 b948a79e
!	%f12 = 8599e5c5 bb2bb937 62fa10da a4121063
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[0000000010141408] = a3b5ebab, %l7 = ff4b9d3e2bd38bd6
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000a3b5ebab
!	%l3 = eafd9d408e11221e, Mem[000000001010143e] = 1b26a934, %asi = 80
	stha	%l3,[%i4+0x03e]%asi	! Mem[000000001010143c] = 1b26221e
!	%l2 = fffffffffffffa62, Mem[00000000201c0001] = ffffee02
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ff62ee02
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00004cd9 d68bd32b, %l4 = 00000054, %l5 = 00000079
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000d68bd32b 0000000000004cd9

p0_label_29:
!	Mem[0000000030081410] = 5490d15e, %l2 = fffffffffffffa62
	ldsha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000005490
!	Mem[0000000010141410] = 00000000, %f31 = 4cf70de1
	lda	[%i5+%o5]0x88,%f31	! %f31 = 00000000
!	Mem[0000000010081400] = 00ff0000, %f28 = f65e3c36
	lda	[%i2+%g0]0x88,%f28	! %f28 = 00ff0000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030101400] = 00000000 0000006d ff73e1b3 7b3a62e7
!	Mem[0000000030101410] = 0090d15e 00000096 ff074a48 0e2311ac
!	Mem[0000000030101420] = 131eeab4 3009f5cd 86b14b5d cc63a6c5
!	Mem[0000000030101430] = 993177b3 ce4ad7a2 ab7737af dc816b68
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000030041400] = e6604620, %l3 = eafd9d408e11221e
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 000000000000e660
!	Mem[00000000100c1400] = ff20d7aa, %l6 = 0000000064dc964b
	ldsw	[%i3+%g0],%l6		! %l6 = ffffffffff20d7aa
!	Mem[0000000030101408] = ff73e1b3, %f6  = 5490d15e
	lda	[%i4+%o4]0x81,%f6 	! %f6 = ff73e1b3
!	Mem[0000000010081400] = 0000007d 00ff0000, %l4 = d68bd32b, %l5 = 00004cd9
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000ff0000 000000000000007d
!	Mem[0000000010041404] = 5f3e03b4, %l5 = 000000000000007d
	ldsba	[%i1+0x007]%asi,%l5	! %l5 = ffffffffffffffb4
!	Starting 10 instruction Store Burst
!	%f2  = 8af2a4d6 d94c0000, %l5 = ffffffffffffffb4
!	Mem[0000000030141418] = d05d638cabc31641
	add	%i5,0x018,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141418] = d05d4c8cd6a4168a

p0_label_30:
!	Mem[0000000010041410] = 00000022, %l4 = 0000000000ff0000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000022
!	%l1 = 00000000000000ff, Mem[0000000010001410] = d6a4f28a
	stha	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 00fff28a
!	%l3 = 000000000000e660, Mem[0000000030141408] = 7849824664dc964b
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000000000e660
!	%l7 = 00000000a3b5ebab, Mem[00000000211c0000] = ffff0619
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = abff0619
!	Mem[0000000010141400] = ff006d00, %l2 = 0000000000005490
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ff006d00
!	Mem[0000000021800180] = f3152e86, %l0 = 00000000000000c7
	ldstub	[%o3+0x180],%l0		! %l0 = 000000f3000000ff
!	Mem[0000000030081408] = 4ec21e91, %l4 = 0000000000000022
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 000000004ec21e91
	membar	#Sync			! Added by membar checker (9)
!	%f0  = 4b96dc64 204660e6, Mem[0000000030101408] = b3e173ff e7623a7b
	stda	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 4b96dc64 204660e6
!	Mem[0000000030141410] = 0090d15e, %l0 = 00000000000000f3
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000090
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = 4d548cd04154523f, %l0 = 0000000000000090
	ldx	[%i1+0x028],%l0		! %l0 = 4d548cd04154523f

p0_label_31:
!	Mem[0000000010141400] = 00005490, %l2 = 00000000ff006d00
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000005490
!	Mem[0000000010041408] = e05ea293, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000093
!	Mem[0000000010141410] = 0000000064dc964b, %l3 = 000000000000e660
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = 0000000064dc964b
!	Mem[0000000010141430] = 8599e5c5bb2bb937, %l4 = 000000004ec21e91
	ldxa	[%i5+0x030]%asi,%l4	! %l4 = 8599e5c5bb2bb937
!	Mem[0000000030141408] = 0000e660, %l5 = ffffffffffffffb4
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 000000000000e660
!	Mem[0000000010041400] = 0842c013, %l0 = 4d548cd04154523f
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000842
!	Mem[0000000010141400] = 90540000, %l3 = 0000000064dc964b
	lduwa	[%i5+0x000]%asi,%l3	! %l3 = 0000000090540000
!	Mem[0000000010041400] = 0842c013, %f21 = 00000096
	lda	[%i1+%g0]0x80,%f21	! %f21 = 0842c013
!	Mem[0000000010081414] = 8af2a4d6, %l7 = 00000000a3b5ebab
	lduh	[%i2+0x014],%l7		! %l7 = 0000000000008af2
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000093, Mem[0000000020800040] = 29e637be, %asi = 80
	stba	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 93e637be

p0_label_32:
!	%f0  = 4b96dc64 204660e6 8af2a4d6 d94c0000
!	%f4  = ffffd6a4 00000054 ff73e1b3 00000000
!	%f8  = 409dfdea 4e7ae252 a79e2a89 b948a79e
!	%f12 = 8599e5c5 bb2bb937 62fa10da a4121063
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l7 = 0000000000008af2, Mem[0000000010041428] = 4d548cd04154523f
	stx	%l7,[%i1+0x028]		! Mem[0000000010041428] = 0000000000008af2
!	%l3 = 0000000090540000, Mem[0000000030181400] = 00000095
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%f24 = 131eeab4 3009f5cd, %l1 = 0000000000000093
!	Mem[0000000030141408] = 60e6000000000000
	add	%i5,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141408] = 60e600003009f5cd
!	Mem[0000000010101424] = 28694386, %l2 = 00005490, %l3 = 90540000
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000028694386
!	%l0 = 0000000000000842, Mem[0000000030041408] = 62fa10da
	stwa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000842
!	%f25 = 3009f5cd, Mem[0000000010001408] = f65e3c36
	sta	%f25,[%i0+%o4]0x80	! Mem[0000000010001408] = 3009f5cd
!	%l2 = 0000000000005490, Mem[0000000010001400] = 0f0000004e000000
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000005490
!	%f26 = 86b14b5d cc63a6c5, Mem[0000000030041410] = 000000ff ffffd6a4
	stda	%f26,[%i1+%o5]0x89	! Mem[0000000030041410] = 86b14b5d cc63a6c5
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000ff00, %l3 = 0000000028694386
	ldsba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_33:
!	Mem[00000000100c143c] = 0547e448, %l1 = 0000000000000093
	lduba	[%i3+0x03d]%asi,%l1	! %l1 = 0000000000000047
!	Mem[0000000010041410] = 0000ff00, %l1 = 0000000000000047
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 22000000, %l7 = 0000000000008af2
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = d68bd32b, %l2 = 0000000000005490
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 00000000d68bd32b
!	Mem[00000000201c0000] = ff62ee02, %l0 = 0000000000000842
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ff62
!	Mem[0000000030041400] = e6604620, %l4 = 8599e5c5bb2bb937
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffe660
!	Mem[0000000030141400] = eafd9d40, %l6 = ffffffffff20d7aa
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000eafd9d40
!	Mem[0000000030001400] = 4b96dc64, %l3 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 000000004b96dc64
!	Mem[00000000201c0000] = ff62ee02, %l4 = ffffffffffffe660
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffff62
!	Starting 10 instruction Store Burst
!	Mem[0000000010101405] = 3e9d4b96, %l2 = 00000000d68bd32b
	ldstub	[%i4+0x005],%l2		! %l2 = 0000009d000000ff

p0_label_34:
!	%l5 = 000000000000e660, Mem[00000000100c142d] = e62d6e36
	stb	%l5,[%i3+0x02d]		! Mem[00000000100c142c] = e6606e36
!	%l3 = 000000004b96dc64, Mem[0000000030001410] = a4d6ffff
	stwa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 4b96dc64
!	%l4 = ffffffffffffff62, Mem[0000000030081400] = 00000000
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000062
!	%l0 = 0000ff62, %l1 = 00000000, Mem[0000000030181408] = d001a4d6 f622976d
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ff62 00000000
!	%l2 = 0000009d, %l3 = 4b96dc64, Mem[0000000010001410] = 00fff28a 3ff390cb
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000009d 4b96dc64
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010181410] = a4d6ffff, %l6 = 00000000eafd9d40
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l5 = 000000000000e660, Mem[0000000010141410] = 0000000064dc964b
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000e660
!	Mem[0000000010001401] = 00000000, %l6 = 00000000000000ff
	ldstub	[%i0+0x001],%l6		! %l6 = 00000000000000ff
!	%l0 = 0000ff62, %l1 = 00000000, Mem[0000000010181410] = a4d6ffff 54000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ff62 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = 00000000, %l6 = 0000000000000000
	ldub	[%i2+0x00c],%l6		! %l6 = 0000000000000000

p0_label_35:
!	Mem[0000000030001408] = 8af2a4d6d94c0000, %f26 = 86b14b5d cc63a6c5
	ldda	[%i0+%o4]0x81,%f26	! %f26 = 8af2a4d6 d94c0000
!	Mem[00000000100c1418] = 000000000000006d, %f20 = 0090d15e 0842c013
	ldda	[%i3+0x018]%asi,%f20	! %f20 = 00000000 0000006d
!	Mem[0000000010101400] = 2bd38b83, %l5 = 000000000000e660
	lduba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000083
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000083
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 9d000000, %l0 = 000000000000ff62
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffff9d000000
!	Mem[0000000020800000] = a4fe5636, %l6 = 0000000000000000
	lduh	[%o1+%g0],%l6		! %l6 = 000000000000a4fe
!	Mem[0000000030041410] = cc63a6c5, %l0 = ffffffff9d000000
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = ffffffffcc63a6c5
!	Mem[0000000010001410] = 0000009d, %l0 = ffffffffcc63a6c5
	lduwa	[%i0+0x010]%asi,%l0	! %l0 = 000000000000009d
!	Mem[0000000030081410] = 5ed19054, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000009054
!	Starting 10 instruction Store Burst
!	Mem[000000001004143c] = 00000079, %l3 = 4b96dc64, %l1 = 00000000
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 0000000000000079

p0_label_36:
!	%f16 = 00000000 0000006d ff73e1b3 7b3a62e7
!	%f20 = 00000000 0000006d ff074a48 0e2311ac
!	%f24 = 131eeab4 3009f5cd 8af2a4d6 d94c0000
!	%f28 = 993177b3 ce4ad7a2 ab7737af dc816b68
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l1 = 0000000000000079, Mem[0000000030181410] = cb26e1ff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = cb260079
!	%f15 = a4121063, Mem[0000000010141408] = d68bd32b
	sta	%f15,[%i5+%o4]0x88	! Mem[0000000010141408] = a4121063
!	%l0 = 000000000000009d, Mem[0000000010001408] = e7623a7b
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000009d
!	%l5 = 0000000000000000, Mem[0000000010041416] = e5cb4b96
	sth	%l5,[%i1+0x016]		! Mem[0000000010041414] = e5cb0000
!	%f3  = d94c0000, Mem[0000000010041400] = 0842c013
	sta	%f3 ,[%i1+%g0]0x80	! Mem[0000000010041400] = d94c0000
!	%l4 = ffffffffffffff62, Mem[0000000030001408] = 8af2a4d6
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 62f2a4d6
!	Mem[0000000010101414] = b61105e4, %l4 = ffffffffffffff62, %asi = 80
	swapa	[%i4+0x014]%asi,%l4	! %l4 = 00000000b61105e4
!	%l5 = 0000000000000000, Mem[0000000010001400] = 0000006d
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 64dc964b, %l4 = 00000000b61105e4
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 0000000064dc964b

p0_label_37:
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010001400] = 0000000000000000, %l0 = 000000000000009d
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 6d000000, %l4 = 0000000064dc964b
	lduha	[%i0+0x010]%asi,%l4	! %l4 = 0000000000006d00
!	Mem[0000000030141400] = 409dfdea, %l1 = 0000000000000079
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffffea
!	Mem[0000000030001410] = 64dc964b, %l3 = 000000004b96dc64
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 0000000064dc964b
!	Mem[0000000010141410] = 00000000, %l1 = ffffffffffffffea
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 22000000, %l0 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 0000007d00ff0000, %f16 = 00000000 0000006d
	ldda	[%i2+%g0]0x88,%f16	! %f16 = 0000007d 00ff0000
!	Mem[0000000030001400] = 64dc964b, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000064dc964b
!	Mem[0000000010041428] = 00000000, %l4 = 0000000000006d00
	lduha	[%i1+0x02a]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 7d007234, %l0 = 0000000064dc964b
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 000000007d007234

p0_label_38:
!	%f17 = 00ff0000, Mem[0000000010101410] = b16fc700
	sta	%f17,[%i4+%o5]0x88	! Mem[0000000010101410] = 00ff0000
!	Mem[0000000010041408] = e05ea293, %l6 = 000000000000a4fe
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000093000000ff
!	Mem[0000000010101408] = ff000000, %l0 = 000000007d007234
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010181410] = 62ff0000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff0000
!	Mem[00000000201c0000] = ff62ee02, %l7 = 0000000000009054
	ldstub	[%o0+%g0],%l7		! %l7 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041408] = 42080000 a3b5ebab
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[00000000201c0001] = ff62ee02, %l7 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000062000000ff
!	Mem[0000000010181408] = 8af2a4d6, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 000000008af2a4d6
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 832937227d000000, %l4 = 000000008af2a4d6
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 832937227d000000

p0_label_39:
!	Mem[0000000030081400] = 0000a4fe00000062, %f26 = 8af2a4d6 d94c0000
	ldda	[%i2+%g0]0x89,%f26	! %f26 = 0000a4fe 00000062
!	Mem[00000000300c1400] = 3e9d4bff, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 000000003e9d4bff
!	Mem[0000000010141400] = 90540000204660e6, %l3 = 0000000064dc964b
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = 90540000204660e6
!	Mem[0000000030141400] = eafd9d40, %l7 = 0000000000000062
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffea
!	Mem[0000000010001408] = 9d000000, %l2 = 000000000000009d
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 0090d15e, %l3 = 90540000204660e6
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000090
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000000000093
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001420] = cdf50930 b4ea1e13, %l2 = 00000000, %l3 = 00000090
	ldda	[%i0+0x020]%asi,%l2	! %l2 = 00000000cdf50930 00000000b4ea1e13
!	Mem[0000000010081400] = 00ff0000, %l6 = 00000000ff000000
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000b4ea1e13, Mem[00000000100c1428] = e37727ebe6606e36, %asi = 80
	stxa	%l3,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000b4ea1e13

p0_label_40:
!	%f9  = 4e7ae252, Mem[0000000010141434] = bb2bb937
	sta	%f9 ,[%i5+0x034]%asi	! Mem[0000000010141434] = 4e7ae252
!	Mem[00000000201c0001] = ffffee02, %l4 = 832937227d000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010101420] = 77ecca3d28694386, %l5 = 0000000000000000, %l4 = 00000000000000ff
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 77ecca3d28694386
!	%f4  = ffffd6a4, Mem[0000000010041408] = ffa25ee0
	sta	%f4 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffd6a4
!	Mem[0000000010041400] = 00004cd9, %l1 = 000000003e9d4bff
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000004cd9
!	%l4 = 77ecca3d28694386, Mem[0000000010181438] = 62fa10da, %asi = 80
	stwa	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = 28694386
!	Mem[0000000010141400] = 90540000, %l7 = ffffffffffffffea
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000090000000ff
!	%l1 = 0000000000004cd9, Mem[0000000010001410] = 0000006d
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000d9
!	Mem[0000000010041418] = 00000000, %l4 = 77ecca3d28694386
	swap	[%i1+0x018],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000009d, %l2 = 00000000cdf50930
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 000000000000009d

p0_label_41:
!	Mem[0000000010001408] = ff73e1b39d000000, %l7 = 0000000000000090
	ldxa	[%i0+%o4]0x88,%l7	! %l7 = ff73e1b39d000000
!	Mem[00000000201c0000] = ffffee02, %l6 = 0000000000000000
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = 00ff000000000000, %f6  = ff73e1b3 00000000
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = 00ff0000 00000000
!	Mem[0000000030001400] = 4b96dc64, %f23 = 0e2311ac
	lda	[%i0+%g0]0x81,%f23	! %f23 = 4b96dc64
!	Mem[0000000010141428] = a79e2a89, %l7 = ff73e1b39d000000
	lduba	[%i5+0x02a]%asi,%l7	! %l7 = 000000000000002a
!	Mem[0000000010041408] = 98e9152aa4d6ffff, %l6 = ffffffffffffffff
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = 98e9152aa4d6ffff
!	Mem[00000000300c1408] = ff000000cd03c2b4, %l1 = 0000000000004cd9
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ff000000cd03c2b4
!	Mem[0000000010081408] = 5ed19000, %f3  = d94c0000
	lda	[%i2+%o4]0x88,%f3 	! %f3 = 5ed19000
!	Mem[0000000010001400] = 00000000, %l2 = 000000000000009d
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 363c5ef6, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000363c5ef6

p0_label_42:
!	Mem[0000000030101410] = 0090d15e, %l0 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 000000000090d15e
!	Mem[0000000010081410] = 00000000, %l1 = ff000000cd03c2b4
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 5490d15e, %l6 = 98e9152aa4d6ffff
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 000000005490d15e
!	%f27 = 00000062, Mem[00000000100c1408] = 7d79d4f6
	sta	%f27,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000062
!	Mem[00000000100c1400] = aad720ff, %l3 = 00000000b4ea1e13
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000aad720ff
!	%l6 = 000000005490d15e, Mem[00000000100c1400] = b4ea1e13
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = b4ead15e
!	Mem[000000001004142b] = 00000000, %l4 = 00000000363c5ef6
	ldstub	[%i1+0x02b],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010001410] = d9000000, %l0 = 000000000090d15e
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 000000d9000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = 6d00000000000000
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff540000, %f13 = bb2bb937
	lda	[%i5+%g0]0x80,%f13	! %f13 = ff540000

p0_label_43:
!	Mem[0000000030141408] = cdf509300000e660, %f12 = 8599e5c5 ff540000
	ldda	[%i5+%o4]0x89,%f12	! %f12 = cdf50930 0000e660
!	Mem[0000000010001430] = a2d74ace, %l7 = 000000000000002a
	lduh	[%i0+0x032],%l7		! %l7 = 0000000000004ace
!	Mem[0000000010181424] = 4e7ae252, %l7 = 0000000000004ace
	ldsb	[%i6+0x024],%l7		! %l7 = 000000000000004e
!	Mem[000000001004142c] = 00008af2, %f12 = cdf50930
	lda	[%i1+0x02c]%asi,%f12	! %f12 = 00008af2
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001400] = 00000000 00000000 0000009d b3e173ff
!	Mem[0000000010001410] = ff000000 00000000 ac11230e 484a07ff
!	Mem[0000000010001420] = cdf50930 b4ea1e13 00004cd9 d6a4f28a
!	Mem[0000000010001430] = a2d74ace b3773199 686b81dc af3777ab
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	Mem[00000000300c1410] = 16ca32fe 4b96dc64, %l0 = 000000d9, %l1 = 00000000
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 000000004b96dc64 0000000016ca32fe
!	Mem[0000000010081404] = 7d000000, %f18 = ff73e1b3
	lda	[%i2+0x004]%asi,%f18	! %f18 = 7d000000
!	Mem[00000000300c1400] = 3e9d4bff, %l3 = 00000000aad720ff
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000004bff
!	Mem[0000000010101400] = 964bff3e2bd38b83, %l0 = 000000004b96dc64
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 964bff3e2bd38b83
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00004bff, Mem[0000000030101408] = e6604620 64dc964b
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00004bff

p0_label_44:
!	Mem[0000000010001410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030041410] = c5a663cc, %l0 = 964bff3e2bd38b83
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000c5000000ff
!	%l4 = 0000000000000000, Mem[0000000030041410] = ffa663cc
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f29 = ce4ad7a2, Mem[0000000010181400] = 4b96dc64
	sta	%f29,[%i6+%g0]0x80	! Mem[0000000010181400] = ce4ad7a2
!	Randomly selected nop
	nop
!	%l3 = 0000000000004bff, Mem[0000000030081400] = 62000000fea40000
	stxa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000004bff
!	%l0 = 00000000000000c5, Mem[0000000010101430] = 6412a6c5cb26e166, %asi = 80
	stxa	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000000000c5
!	%l1 = 0000000016ca32fe, Mem[0000000030101408] = 0000000000004bff
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000016ca32fe
!	%l5 = 0000000000000000, Mem[0000000010101400] = 838bd32b3eff4b96, %asi = 80
	stxa	%l5,[%i4+0x000]%asi	! Mem[0000000010101400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_45:
!	Mem[0000000030101400] = 00000000, %l1 = 0000000016ca32fe
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = ffffd6a4, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = ffffffffffffffa4
!	Mem[0000000010041400] = ff4b9d3e, %f31 = dc816b68
	lda	[%i1+%g0]0x80,%f31	! %f31 = ff4b9d3e
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181438] = 28694386, %l2 = 0000000000000000
	ldsh	[%i6+0x038],%l2		! %l2 = 0000000000002869
!	Mem[0000000020800040] = 93e637be, %l1 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = ffffffffffff93e6
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000c5
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 3e9d4bff, %l5 = ffffffffffffffa4
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000004bff
!	Mem[0000000010081410] = cd03c2b4, %f26 = 0000a4fe
	lda	[%i2+%o5]0x88,%f26	! %f26 = cd03c2b4
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_46:
!	%l7 = 000000000000004e, Mem[0000000010081413] = b4c203cd, %asi = 80
	stba	%l7,[%i2+0x013]%asi	! Mem[0000000010081410] = b4c2034e
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%f24 = 131eeab4 3009f5cd, %l2 = 0000000000002869
!	Mem[0000000030001408] = 62f2a4d6d94c0000
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001408] = 621eead6304c00cd
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00ff0000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff0000
!	%l0 = 00000000, %l1 = ffff93e6, Mem[00000000100c1400] = 5ed1eab4 70160c7b
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 ffff93e6
!	%f18 = 7d000000 7b3a62e7, %l4 = 0000000000000000
!	Mem[0000000010081408] = 0090d15e00000000
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081408] = 0090d15e00000000
!	%f30 = ab7737af ff4b9d3e, %l0 = 0000000000000000
!	Mem[00000000100c1430] = 22c594ec68a9dd5d
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_P ! Mem[00000000100c1430] = 22c594ec68a9dd5d
!	%f16 = 0000007d, Mem[0000000030081400] = 00000000
	sta	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000007d
!	%l6 = 000000005490d15e, Mem[0000000030101410] = 000000ff
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = d15e00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_47:
!	Mem[00000000300c1400] = ff4b9d3e, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 16ca32fe4b96dc64, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 16ca32fe4b96dc64
!	Mem[0000000010001438] = 686b81dc, %l1 = ffffffffffff93e6
	ldsw	[%i0+0x038],%l1		! %l1 = 00000000686b81dc
!	Mem[0000000010141410] = 00000000, %f29 = ce4ad7a2
	lda	[%i5+%o5]0x80,%f29	! %f29 = 00000000
!	Mem[0000000010181408] = 00000000, %l0 = 16ca32fe4b96dc64
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = addeb0c4000000ff, %f16 = 0000007d 00ff0000
	ldda	[%i4+%o4]0x88,%f16	! %f16 = addeb0c4 000000ff
!	Mem[0000000030041408] = 00000000, %f20 = 00000000
	lda	[%i1+%o4]0x81,%f20	! %f20 = 00000000
!	Mem[0000000010101420] = 77ecca3d, %l7 = 000000000000004e
	ldswa	[%i4+0x020]%asi,%l7	! %l7 = 0000000077ecca3d
!	Mem[0000000030181400] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000002869, Mem[0000000030141408] = 0000e660
	stha	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00002869

p0_label_48:
!	Mem[0000000010001430] = a2d74aceb3773199, %l1 = 00000000686b81dc, %l3 = 0000000000004bff
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = a2d74aceb3773199
!	%l3 = a2d74aceb3773199, Mem[0000000010181417] = 00000000
	stb	%l3,[%i6+0x017]		! Mem[0000000010181414] = 00000099
!	%l7 = 0000000077ecca3d, Mem[0000000030001408] = d6ea1e62
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = d6ea1e3d
!	%l7 = 0000000077ecca3d, Mem[0000000030101410] = d15e00ff
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = ca3d00ff
	membar	#Sync			! Added by membar checker (13)
!	%f6  = ff074a48, Mem[0000000010001408] = 9d000000
	sta	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ff074a48
!	Mem[0000000010001408] = 484a07ff, %l6 = 000000005490d15e
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000484a07ff
!	Mem[0000000010001400] = 00000000, %l2 = 00002869, %l1 = 686b81dc
	casa	[%i0]0x80,%l2,%l1	! %l1 = 0000000000000000
!	%f4  = 00000000 000000ff, Mem[0000000010181410] = 00ff0000 00000099
	std	%f4 ,[%i6+%o5]	! Mem[0000000010181410] = 00000000 000000ff
!	%f22 = ff074a48 4b96dc64, Mem[0000000030101400] = 00000000 00000000
	stda	%f22,[%i4+%g0]0x89	! Mem[0000000030101400] = ff074a48 4b96dc64
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000ff62, %l6 = 00000000484a07ff
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 000000000000ff62

p0_label_49:
!	Mem[0000000030081410] = a4d6ffff, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffa4
!	Mem[00000000300c1410] = 16ca32fe 4b96dc64, %l2 = 00002869, %l3 = b3773199
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 000000004b96dc64 0000000016ca32fe
!	Mem[0000000030001400] = 64dc964b, %f6  = ff074a48
	lda	[%i0+%g0]0x89,%f6 	! %f6 = 64dc964b
!	Mem[00000000100c140c] = 5ce4dada, %l6 = 000000000000ff62
	lduh	[%i3+0x00e],%l6		! %l6 = 000000000000dada
!	Mem[0000000030101400] = 64dc964b, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 0000000064dc964b
!	Mem[0000000010001410] = ff00000000000000, %f8  = 131eeab4 3009f5cd
	ldda	[%i0+%o5]0x80,%f8 	! %f8  = ff000000 00000000
!	Mem[000000001014143c] = 2fe666e8, %l4 = 0000000000000000
	lduw	[%i5+0x03c],%l4		! %l4 = 000000002fe666e8
!	Mem[0000000010181408] = 00000000, %l3 = 0000000016ca32fe
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %f8  = ff000000
	lda	[%i6+%o4]0x88,%f8 	! %f8 = 00000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffa4, Mem[0000000010141408] = 00004cd9a4121063
	stxa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffffffffffa4

p0_label_50:
!	%l7 = 0000000077ecca3d, Mem[0000000010041408] = a4d6ffff
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 77ecca3d
!	%l5 = 0000000000004bff, Mem[0000000010041434] = 220744c6
	stw	%l5,[%i1+0x034]		! Mem[0000000010041434] = 00004bff
!	Mem[0000000010001410] = ff000000, %l7 = 0000000077ecca3d, %asi = 80
	swapa	[%i0+0x010]%asi,%l7	! %l7 = 00000000ff000000
!	%f4  = 00000000 000000ff, Mem[0000000010141400] = 000054ff e6604620
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 000000ff
!	%l6 = 0000dada, %l7 = ff000000, Mem[0000000010081400] = 0000ff00 7d000000
	std	%l6,[%i2+%g0]		! Mem[0000000010081400] = 0000dada ff000000
!	Mem[0000000010001410] = 77ecca3d, %l2 = 000000004b96dc64
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 0000000077ecca3d
!	Mem[0000000030001408] = d6ea1e3d, %l7 = 00000000ff000000
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000d6ea1e3d
!	%l0 = 0000000064dc964b, Mem[0000000030141408] = 00002869
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 64dc964b
!	Mem[0000000010081400] = dada0000, %l6 = 000000000000dada
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = f2d471b2204660e6, %f18 = 7d000000 7b3a62e7
	ldda	[%i1+%g0]0x89,%f18	! %f18 = f2d471b2 204660e6

p0_label_51:
!	Mem[0000000030081400] = 0000007d, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 000000000000007d
!	Mem[0000000010101408] = 000000ff, %f2  = ff73e1b3
	lda	[%i4+%o4]0x88,%f2 	! %f2 = 000000ff
!	Mem[0000000030181410] = 790026cb, %l1 = ffffffffffffffa4
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000079
!	Mem[0000000010001408] = 5490d15e, %l3 = 000000000000007d
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000054
!	Mem[0000000010041410] = 0000ff00 e5cb0000, %l0 = 64dc964b, %l1 = 00000079
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 000000000000ff00 00000000e5cb0000
!	Mem[0000000030081400] = ff4b00000000007d, %l2 = 0000000077ecca3d
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = ff4b00000000007d
!	Mem[0000000030181400] = 00000000, %l2 = ff4b00000000007d
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffffee02, %l2 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 000000ff, %l4 = 000000002fe666e8
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = a2d74ace, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000a2d74ace

p0_label_52:
!	Mem[0000000010141400] = ff000000, %l1 = 00000000e5cb0000
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101430] = 00000000, %l3 = 0000000000000054, %asi = 80
	swapa	[%i4+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ffffd6a4, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000ffffd6a4
!	%f10 = 8af2a4d6, Mem[0000000010181400] = 00000000
	sta	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 8af2a4d6
!	%f16 = addeb0c4 000000ff, Mem[0000000010181400] = 8af2a4d6 e6604620
	stda	%f16,[%i6+%g0]0x88	! Mem[0000000010181400] = addeb0c4 000000ff
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030141408] = 64dc964b cdf50930
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff 00000000
!	%l6 = 00000000a2d74ace, Mem[0000000030181410] = cb260079
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = a2d74ace
!	%f12 = 993177b3 ce4ad7a2, Mem[00000000100c1410] = 0000007d 22372983
	stda	%f12,[%i3+0x010]%asi	! Mem[00000000100c1410] = 993177b3 ce4ad7a2
!	%l6 = a2d74ace, %l7 = d6ea1e3d, Mem[0000000010041400] = ff4b9d3e 5f3e03b4
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = a2d74ace d6ea1e3d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 77ecca3d, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 0000000077ecca3d

p0_label_53:
!	Mem[0000000020800000] = a4fe5636, %l0 = 000000000000ff00
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffa4fe
!	Mem[0000000030141408] = 00000000ffffffff, %f4  = 00000000 000000ff
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 00000000 ffffffff
!	Mem[0000000010001410] = 64dc964b, %l7 = 00000000d6ea1e3d
	ldsha	[%i0+%o5]0x88,%l7	! %l7 = ffffffffffff964b
!	%f24 = 131eeab4 3009f5cd, %f4  = 00000000 ffffffff
	fdtox	%f24,%f4 		! %f4  = 00000000 00000000
!	Mem[0000000030181410] = a2d74ace, %l0 = ffffffffffffa4fe
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000004ace
!	Mem[0000000010081400] = ff00dada, %l4 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff00dada
!	Mem[00000000100c1410] = a2d74ace b3773199, %l4 = ff00dada, %l5 = 00004bff
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000b3773199 00000000a2d74ace
!	Mem[0000000010181410] = 00000000, %f4  = 00000000
	lda	[%i6+%o5]0x88,%f4 	! %f4 = 00000000
!	Mem[00000000100c1410] = 993177b3, %l4 = 00000000b3773199
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffff99
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l5 = 00000000a2d74ace
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_54:
!	Mem[00000000100c1408] = 62000000, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f0  = 00000000, Mem[000000001018141c] = 00000000
	st	%f0 ,[%i6+0x01c]	! Mem[000000001018141c] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010181420] = 409dfdea4e7ae252
	stx	%l5,[%i6+0x020]		! Mem[0000000010181420] = 0000000000000000
!	Mem[00000000218001c1] = 6e7bfc86, %l1 = 00000000ffffd6a4
	ldstub	[%o3+0x1c1],%l1		! %l1 = 0000007b000000ff
!	Mem[00000000100c1408] = 620000ff, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000620000ff
!	Mem[0000000030001408] = 000000ff, %l1 = 000000000000007b
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000004ace, Mem[0000000010001410] = 4b96dc64
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 4acedc64
!	%l4 = ffffffffffffff99, Mem[0000000010141400] = ff000000
	stw	%l4,[%i5+%g0]		! Mem[0000000010141400] = ffffff99
!	%l6 = 00000000a2d74ace, Mem[0000000030081408] = 00000022
	stba	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = ce000022
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = cd004c30 ff0000ff, %l4 = ffffff99, %l5 = 620000ff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 00000000ff0000ff 00000000cd004c30

p0_label_55:
!	Mem[0000000030141410] = 00000000 5ed19000, %l4 = ff0000ff, %l5 = cd004c30
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 000000005ed19000 0000000000000000
!	Mem[0000000020800000] = a4fe5636, %l0 = 0000000000004ace
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffa4fe
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 993177b3, %l0 = ffffffffffffa4fe
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000993177b3
!	Mem[0000000010141400] = ffffff99, %l3 = 0000000077ecca3d
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ffffff99
!	Mem[0000000030101410] = ca3d00ff, %l3 = 00000000ffffff99
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffca3d
!	Mem[0000000030001410] = 64dc964b, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = 0000000064dc964b
!	Mem[0000000010001410] = 00000000 64dcce4a, %l4 = 5ed19000, %l5 = 64dc964b
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 0000000064dcce4a 0000000000000000
!	Mem[0000000010081400] = ff00dada, %l4 = 0000000064dcce4a
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000020800040] = 93e637be, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 00e637be

p0_label_56:
!	Mem[0000000010041408] = 77ecca3d, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 0000000077ecca3d
!	%l5 = 0000000000000000, Mem[00000000100c1410] = b3773199
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = b3773100
!	%l4 = 0000000077ecca3d, Mem[0000000030041400] = 204660e6
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 2046ca3d
!	%f25 = 3009f5cd, Mem[0000000030041400] = 3dca4620
	sta	%f25,[%i1+%g0]0x81	! Mem[0000000030041400] = 3009f5cd
!	%f6  = 64dc964b 0e2311ac, Mem[0000000010141400] = 99ffffff 00000000
	stda	%f6 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 64dc964b 0e2311ac
!	%f20 = 00000000, Mem[0000000010101410] = 0000ff00
	sta	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010041408] = 98e9152a000000ff
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030081408] = 220000ce, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000ce000000ff
!	%f12 = 993177b3 ce4ad7a2, Mem[0000000010141400] = 0e2311ac 64dc964b
	stda	%f12,[%i5+%g0]0x88	! Mem[0000000010141400] = 993177b3 ce4ad7a2
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l6 = 00000000a2d74ace
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_57:
!	Mem[0000000010101410] = 00000000, %l3 = ffffffffffffca3d
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 5490d15e, %l6 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000054
!	Mem[0000000010041424] = 1a073cc4, %f24 = 131eeab4
	ld	[%i1+0x024],%f24	! %f24 = 1a073cc4
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000054
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = a4ffffff, %l6 = 0000000000000000
	ldsw	[%i5+%o4],%l6		! %l6 = ffffffffa4ffffff
!	Mem[0000000030181400] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 00000000993177b3
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000 ffffff62, %l4 = 77ecca3d, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000ffffff62

p0_label_58:
!	%l6 = ffffffffa4ffffff, Mem[0000000010101400] = ff00000000000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffffa4ffffff
!	%l4 = 0000000000000000, Mem[0000000030141400] = eafd9d408e11221e
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000000
!	Mem[00000000100c1410] = 003177b3, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000003177b3
!	%f24 = 1a073cc4, Mem[0000000010181438] = 28694386
	sta	%f24,[%i6+0x038]%asi	! Mem[0000000010181438] = 1a073cc4
!	%l3 = 0000000000000000, Mem[0000000030081400] = ff4b00000000007d
	stxa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	%l6 = a4ffffff, %l7 = ffff964b, Mem[0000000030141410] = 0090d15e 00000000
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = a4ffffff ffff964b
!	%f16 = addeb0c4 000000ff f2d471b2 204660e6
!	%f20 = 00000000 0000006d ff074a48 4b96dc64
!	%f24 = 1a073cc4 3009f5cd cd03c2b4 00000062
!	%f28 = 993177b3 00000000 ab7737af ff4b9d3e
	stda	%f16,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l0 = 0000000000000000, Mem[00000000100c1408] = dadae45c00000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1418] = 000000000000006d
	stx	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 00000000, %l5 = 00000000ffffff62
	lduh	[%i3+0x00c],%l5		! %l5 = 0000000000000000

p0_label_59:
!	Mem[00000000201c0000] = ffffee02, %l1 = 00000000003177b3
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = 64dc964b, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 00000000000064dc
!	Mem[0000000030141400] = 00000000, %l1 = ffffffffffffffff
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 64dc964b, %f14 = ab7737af
	lda	[%i0+%g0]0x89,%f14	! %f14 = 64dc964b
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030101400] = 64dc964b 484a07ff 00000000 16ca32fe
!	Mem[0000000030101410] = ca3d00ff 00000096 ff074a48 0e2311ac
!	Mem[0000000030101420] = 131eeab4 3009f5cd 86b14b5d cc63a6c5
!	Mem[0000000030101430] = 993177b3 ce4ad7a2 ab7737af dc816b68
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000030181408] = 62ff0000, %l4 = 00000000000064dc
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 00000000000062ff
!	Mem[0000000010181410] = 00000000, %l6 = ffffffffa4ffffff
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l4 = 00000000000062ff
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffff964b, Mem[000000001018143d] = a4121063
	stb	%l7,[%i6+0x03d]		! Mem[000000001018143c] = a44b1063

p0_label_60:
!	Mem[0000000010081430] = 993177b3, %l6 = 0000000000000000
	ldstuba	[%i2+0x030]%asi,%l6	! %l6 = 00000099000000ff
!	%f22 = ff074a48 4b96dc64, Mem[00000000100c1430] = 22c594ec 68a9dd5d
	stda	%f22,[%i3+0x030]%asi	! Mem[00000000100c1430] = ff074a48 4b96dc64
!	%f0  = ff074a48 4b96dc64 fe32ca16 00000000
!	%f4  = 96000000 ff003dca ac11230e 484a07ff
!	%f8  = cdf50930 b4ea1e13 c5a663cc 5d4bb186
!	%f12 = a2d74ace b3773199 686b81dc af3777ab
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[00000000201c0000] = ffffee02, %l2 = 00000000000000ce
	ldstub	[%o0+%g0],%l2		! %l2 = 000000ff000000ff
!	%l4 = ffffffffffffff00, Mem[0000000020800001] = a4fe5636, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = a4005636
!	%f18 = f2d471b2, Mem[0000000010001408] = 00000000
	sta	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = f2d471b2
!	Mem[0000000010141408] = ffffffa4, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000ffffffa4
!	%f26 = cd03c2b4 00000062, Mem[0000000010081410] = 00000000 6d000000
	stda	%f26,[%i2+%o5]0x88	! Mem[0000000010081410] = cd03c2b4 00000062
!	%f24 = 1a073cc4, Mem[0000000010141400] = a2d74ace
	sta	%f24,[%i5+0x000]%asi	! Mem[0000000010141400] = 1a073cc4
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_61:
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010001408] = fe32ca16 f2d471b2, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000f2d471b2 00000000fe32ca16
!	Mem[0000000010101410] = 00000000, %l3 = 00000000ffffffa4
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000 ffffff62, %l0 = f2d471b2, %l1 = fe32ca16
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000ffffff62
!	Mem[0000000030101408] = fe32ca1600000000, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = fe32ca1600000000
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000099
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = ffffffffa4ffffff, %f8  = cdf50930 b4ea1e13
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = ffffffff a4ffffff
!	Mem[0000000030101408] = 00000000, %l5 = fe32ca1600000000
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = ff0000ff304c00cd, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = ff0000ff304c00cd
!	Starting 10 instruction Store Burst
!	%f22 = ff074a48 4b96dc64, %l2 = 0000000000000000
!	Mem[0000000010001420] = 131eeab43009f5cd
	add	%i0,0x020,%g1
	stda	%f22,[%g1+%l2]ASI_PST8_P ! Mem[0000000010001420] = 131eeab43009f5cd

p0_label_62:
!	%l6 = ff0000ff304c00cd, Mem[00000000201c0000] = ffffee02
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00cdee02
!	%l2 = 0000000000000000, Mem[0000000020800001] = a4005636, %asi = 80
	stba	%l2,[%o1+0x001]%asi	! Mem[0000000020800000] = a4005636
!	%l0 = 00000000, %l1 = ffffff62, Mem[0000000010081408] = f2d471b2 204660e6
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ffffff62
!	Mem[0000000030001408] = ff0000ff, %l4 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f20 = 00000000, Mem[0000000030081410] = ff000000
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l6 = 304c00cd, %l7 = ffff964b, Mem[0000000010081408] = 00000000 ffffff62
	stda	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 304c00cd ffff964b
!	Mem[0000000010081410] = 00000062, %l1 = 00000000ffffff62
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000062000000ff
!	%l1 = 0000000000000062, Mem[0000000010001400] = 64dc964b484a07ff
	stx	%l1,[%i0+%g0]		! Mem[0000000010001400] = 0000000000000062
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = a2d74ace, %f6  = ac11230e
	lda	[%i1+%g0]0x80,%f6 	! %f6 = a2d74ace

p0_label_63:
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = abff0619, %l3 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ab
!	Mem[0000000010041404] = d6ea1e3d, %l3 = 00000000000000ab
	ldsh	[%i1+0x004],%l3		! %l3 = ffffffffffffd6ea
!	Mem[0000000030101400] = 64dc964b484a07ff, %l6 = ff0000ff304c00cd
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 64dc964b484a07ff
!	Mem[00000000100c1410] = 00000000, %f24 = 1a073cc4
	lda	[%i3+%o5]0x80,%f24	! %f24 = 00000000
!	Mem[00000000100c1400] = 00000000, %l6 = 64dc964b484a07ff
	lduha	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = a2d74ace, %f0  = ff074a48
	lda	[%i1+0x000]%asi,%f0 	! %f0 = a2d74ace
!	Mem[00000000300c1408] = 000000ff, %l7 = ffffffffffff964b
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 0000ff62, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000062
!	Starting 10 instruction Store Burst
!	%f13 = b3773199, %f14 = 686b81dc, %f7  = 484a07ff
	fsubs	%f13,%f14,%f7 		! %f7  = e86b81dc

p0_label_64:
!	%f8  = ffffffff a4ffffff, Mem[0000000010001428] = 86b14b5d cc63a6c5
	std	%f8 ,[%i0+0x028]	! Mem[0000000010001428] = ffffffff a4ffffff
!	Mem[0000000030001400] = 64dc964b, %l3 = ffffffffffffd6ea
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000064dc964b
!	%l1 = 0000000000000062, Mem[0000000030001408] = ff0000ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000062
!	Mem[000000001000143c] = dc816b68, %l6 = 0000000000000000
	swap	[%i0+0x03c],%l6		! %l6 = 00000000dc816b68
!	%l0 = 00000000, %l1 = 00000062, Mem[0000000010101410] = 00000000 ffffff62
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000062
!	%f14 = 686b81dc af3777ab, Mem[0000000010181410] = 00000000 000000ff
	stda	%f14,[%i6+%o5]0x80	! Mem[0000000010181410] = 686b81dc af3777ab
!	%l6 = dc816b68, %l7 = 000000ff, Mem[00000000300c1408] = 000000ff b4c203cd
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = dc816b68 000000ff
!	%l2 = 0000000000000000, Mem[0000000010181400] = ff000000c4b0dead, %asi = 80
	stxa	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000000
!	%f22 = ff074a48 4b96dc64, %l0 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000062
	stda	%f22,[%i0+%l0]ASI_PST8_P ! Mem[0000000010001400] = 0000000000000062
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_65:
!	Mem[0000000010081408] = cd004c30, %l7 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000004c30
!	Mem[0000000010141410] = 60e60000 00000000, %l2 = 00000000, %l3 = 64dc964b
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000 0000000060e60000
!	Mem[0000000030081408] = ff000022, %l0 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffff000022
!	Mem[0000000030181400] = 0000000000000000, %l7 = 0000000000004c30
	ldxa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1420] = 16ab6c5b 77988d1e, %l2 = 00000000, %l3 = 60e60000
	ldda	[%i3+0x020]%asi,%l2	! %l2 = 0000000016ab6c5b 0000000077988d1e
!	Mem[0000000030101400] = 64dc964b, %l0 = ffffffffff000022
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = 00000000000064dc
!	Mem[0000000010181404] = 00000000, %l2 = 0000000016ab6c5b
	ldswa	[%i6+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = a4005636, %l4 = 0000000000000000
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffa4
!	Mem[0000000010001408] = b271d4f2, %l5 = 0000000000000062
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = ffffffffffffffb2
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffa4, Mem[00000000100c1408] = 00000000
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffa40000

p0_label_66:
!	%f24 = 00000000 3009f5cd, Mem[0000000030001400] = ead6ffff 204660e6
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 3009f5cd
!	%l7 = 0000000000000000, Mem[0000000010141418] = 1b915f95d8b6a464
	stx	%l7,[%i5+0x018]		! Mem[0000000010141418] = 0000000000000000
!	Mem[0000000020800040] = 00e637be, %l6 = 00000000dc816b68
	ldstub	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	%l0 = 00000000000064dc, Mem[0000000010101408] = 00000000
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 000064dc
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001408] = 62000000 304c00cd
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	Mem[000000001014141c] = 00000000, %l3 = 0000000077988d1e
	swap	[%i5+0x01c],%l3		! %l3 = 0000000000000000
!	%f10 = c5a663cc 5d4bb186, Mem[0000000010001410] = ca3d00ff 00000096
	stda	%f10,[%i0+%o5]0x80	! Mem[0000000010001410] = c5a663cc 5d4bb186
!	%l5 = ffffffffffffffb2, Mem[00000000300c1400] = 3e9d4bff
	stwa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffb2
!	%l7 = 0000000000000000, Mem[0000000010081400] = c4b0dead
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = d064c176 1a073cc4, %l4 = ffffffa4, %l5 = ffffffb2
	ldd	[%i1+0x020],%l4		! %l4 = 00000000d064c176 000000001a073cc4

p0_label_67:
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l4 = 00000000d064c176
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181418] = ff73e1b3 00000000, %l6 = 00000000, %l7 = 00000000
	ldd	[%i6+0x018],%l6		! %l6 = 00000000ff73e1b3 0000000000000000
!	Mem[0000000030141400] = 00000000, %l0 = 00000000000064dc
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001414] = 5d4bb186, %l4 = 0000000000000000
	lduh	[%i0+0x014],%l4		! %l4 = 0000000000005d4b
!	Mem[0000000010081400] = 00000000000000ff, %l4 = 0000000000005d4b
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 4b96dc64, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000064
!	Mem[0000000010081410] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010140c] = c4b0dead, %l7 = 00000000000000ff
	ldub	[%i4+0x00d],%l7		! %l7 = 00000000000000b0
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 1a073cc4, %l7 = 00000000000000b0
	swap	[%i5+%g0],%l7		! %l7 = 000000001a073cc4

p0_label_68:
!	Mem[0000000030141400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f16 = addeb0c4 000000ff, %l2 = 0000000000000000
!	Mem[0000000010041420] = d064c1761a073cc4
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010041420] = d064c1761a073cc4
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 16ca32fe4b96dc64
	stxa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%l0 = 00000000, %l1 = 00000062, Mem[0000000010001408] = f2d471b2 fe32ca16
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 00000062
!	%l0 = 0000000000000000, Mem[0000000030141408] = ffffffff
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff
!	%f14 = 686b81dc af3777ab, Mem[0000000010181438] = 1a073cc4 a44b1063
	stda	%f14,[%i6+0x038]%asi	! Mem[0000000010181438] = 686b81dc af3777ab
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000062
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000ff73e1b3, Mem[0000000010001408] = 0000000062000000
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ff73e1b3
!	%l5 = 000000001a073cc4, Mem[00000000211c0001] = abff0619, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = abc40619
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_69:
!	Mem[0000000030181410] = ce4ad7a2, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ce
!	Mem[0000000010001430] = 993177b3ce4ad7a2, %l7 = 000000001a073cc4
	ldx	[%i0+0x030],%l7		! %l7 = 993177b3ce4ad7a2
!	Mem[0000000030101400] = 4b96dc64, %l0 = 00000000000000ce
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = 000000004b96dc64
!	Mem[0000000010081424] = 3009f5cd, %l1 = 0000000000000000
	ldsw	[%i2+0x024],%l1		! %l1 = 000000003009f5cd
!	Mem[0000000030001410] = 64dc964b00000054, %f4  = 96000000 ff003dca
	ldda	[%i0+%o5]0x81,%f4 	! %f4  = 64dc964b 00000054
!	Mem[0000000020800040] = ffe637be, %l3 = 0000000000000064
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010142c] = 5316e302, %l4 = 0000000000000000
	ldsha	[%i4+0x02c]%asi,%l4	! %l4 = 0000000000005316
!	Mem[0000000030001410] = 4b96dc64, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000064
!	Mem[0000000030001410] = 64dc964b00000054, %l0 = 000000004b96dc64
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = 64dc964b00000054
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff73e1b3, Mem[0000000030081400] = 00000000
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000e1b3

p0_label_70:
!	%l0 = 64dc964b00000054, Mem[0000000010041400] = ce4ad7a2
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000054
!	Mem[0000000010041410] = 00ff0000, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = ff000000, %l7 = 993177b3ce4ad7a2
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	%l0 = 64dc964b00000054, Mem[0000000010001408] = 00000000
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000054
!	%f20 = 00000000 0000006d, Mem[0000000010141428] = a79e2a89 b948a79e
	stda	%f20,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000 0000006d
!	%f0  = a2d74ace 4b96dc64 fe32ca16 00000000
!	%f4  = 64dc964b 00000054 a2d74ace e86b81dc
!	%f8  = ffffffff a4ffffff c5a663cc 5d4bb186
!	%f12 = a2d74ace b3773199 686b81dc af3777ab
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l4 = 0000000000005316, Mem[000000001010140c] = c4b0dead, %asi = 80
	stwa	%l4,[%i4+0x00c]%asi	! Mem[000000001010140c] = 00005316
!	%l6 = 00000000ff73e1b3, Mem[0000000030041408] = 00000000
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000b3
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010081400] = 00000000 000000ff 304c00cd ffff964b
!	Mem[0000000010081410] = ff000000 b4c203cd ff074a48 4b96dc64
!	Mem[0000000010081420] = 1a073cc4 3009f5cd cd03c2b4 00000062
!	Mem[0000000010081430] = ff3177b3 00000000 ab7737af ff4b9d3e
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400

p0_label_71:
!	Mem[0000000010141408] = 00000000, %l1 = 000000003009f5cd
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 3d1eead600000054, %f10 = c5a663cc 5d4bb186
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 3d1eead6 00000054
!	Mem[0000000010001400] = 00000000 00000062 00000054 ff73e1b3
!	Mem[0000000010001410] = c5a663cc 5d4bb186 ff074a48 0e2311ac
!	Mem[0000000010001420] = 131eeab4 3009f5cd ffffffff a4ffffff
!	Mem[0000000010001430] = 993177b3 ce4ad7a2 ab7737af 00000000
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030001400] = 00000000, %l0 = 64dc964b00000054
	ldsha	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = b3000000, %l7 = 00000000ff000000
	ldsba	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffb3
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001424] = 3009f5cd, %l3 = 0000000000000000
	ldsha	[%i0+0x026]%asi,%l3	! %l3 = fffffffffffff5cd
!	Mem[00000000300c1408] = 686b81dc, %l3 = fffffffffffff5cd
	ldsha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000686b
!	Mem[0000000010141420] = 409dfdea4e7ae252, %f8  = ffffffff a4ffffff
	ldda	[%i5+0x020]%asi,%f8 	! %f8  = 409dfdea 4e7ae252
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffb3, Mem[0000000030181408] = 0000ff62
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ffb3

p0_label_72:
!	%l1 = 0000000000000000, Mem[0000000030081400] = 0000e1b3
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l4 = 0000000000005316, Mem[0000000010141400] = 000000b0
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 160000b0
!	%f0  = a2d74ace 4b96dc64, Mem[0000000030101408] = 16ca32fe 00000000
	stda	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = a2d74ace 4b96dc64
!	%l1 = 0000000000000000, Mem[0000000020800040] = ffe637be, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 000037be
!	%l0 = ffffffffffffff00, Mem[0000000030181408] = b3ff0000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	%l3 = 000000000000686b, imm = fffffffffffff2c7, %l7 = ffffffffffffffb3
	xor	%l3,-0xd39,%l7		! %l7 = ffffffffffff9aac
!	Mem[0000000030101400] = a2d74ace, %l0 = ffffffffffffff00
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000a2000000ff
!	Mem[00000000211c0001] = abc40619, %l4 = 0000000000005316
	ldstub	[%o2+0x001],%l4		! %l4 = 000000c4000000ff
	membar	#Sync			! Added by membar checker (17)
!	%l4 = 00000000000000c4, Mem[000000001000143c] = 00000000
	stw	%l4,[%i0+0x03c]		! Mem[000000001000143c] = 000000c4
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = a4ffffff, %l0 = 00000000000000a2
	lduba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000a4

p0_label_73:
!	Mem[0000000010141400] = b0000016, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000016
!	Mem[0000000010081408] = 304c00cd, %l1 = 0000000000000016
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = 000000000000304c
!	Mem[000000001004140c] = 00000000, %l6 = 00000000ff73e1b3
	ldsba	[%i1+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = ab7737af dc816b68, %l2 = 00000064, %l3 = 0000686b
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000dc816b68 00000000ab7737af
!	Mem[000000001004140c] = 00000000, %l5 = 000000001a073cc4
	ldsb	[%i1+0x00c],%l5		! %l5 = 0000000000000000
!	Mem[000000001000140c] = ff73e1b3, %l7 = ffffffffffff9aac
	ldsba	[%i0+0x00c]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101424] = 28694386, %l2 = 00000000dc816b68
	ldsha	[%i4+0x024]%asi,%l2	! %l2 = 0000000000002869
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000c4
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f16,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000

p0_label_74:
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000002869
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l1 = 000000000000304c, Mem[0000000010101410] = 00000000
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 4c000000
!	%l4 = 0000000000000000, Mem[00000000100c1416] = ce4ad7a2
	sth	%l4,[%i3+0x016]		! Mem[00000000100c1414] = ce4a0000
!	%l6 = 0000000000000000, Mem[0000000030141400] = a2d74ace
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030141410] = ffffffa4
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffff00
!	%f9  = 4e7ae252, Mem[0000000030041410] = 00000000
	sta	%f9 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 4e7ae252
!	%f14 = 686b81dc af3777ab, %l3 = 00000000ab7737af
!	Mem[0000000010041428] = 000000ff00008af2
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_P ! Mem[0000000010041428] = 680081ffaf3777ab
!	%l6 = 0000000000000000, Mem[0000000010001408] = 00000054ff73e1b3
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	Mem[00000000211c0000] = abff0619, %l7 = ffffffffffffffff
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ab000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00ff00ff, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_75:
!	Mem[00000000300c1408] = 686b81dc, %l0 = 00000000000000a4
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 000000000000686b
!	Mem[0000000010141408] = ffffffff00000000, %f6  = a2d74ace e86b81dc
	ldda	[%i5+%o4]0x88,%f6 	! %f6  = ffffffff 00000000
!	Mem[0000000030081410] = 00000000, %l0 = 000000000000686b
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 64dc964b, %l2 = ffffffffffffffff
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 0000000064dc964b
!	Mem[0000000030101408] = 64dc964b, %l3 = 00000000ab7737af
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = 0000000064dc964b
!	Mem[0000000030101410] = 64dc964b, %l6 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 0000000064dc964b
!	Mem[0000000010101410] = 4c000000, %f26 = ffffffff
	ld	[%i4+%o5],%f26	! %f26 = 4c000000
!	Mem[0000000010041408] = 00000000, %l7 = 00000000000000ab
	lduwa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ffffffa4 ffffffff, %l2 = 64dc964b, %l3 = 64dc964b
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ffffffff 00000000ffffffa4
!	Starting 10 instruction Store Burst
!	%f4  = 64dc964b, Mem[0000000010141410] = 00000000
	st	%f4 ,[%i5+%o5]		! Mem[0000000010141410] = 64dc964b

p0_label_76:
!	%f28 = 993177b3 ce4ad7a2, %l3 = 00000000ffffffa4
!	Mem[0000000030041428] = 9ea748b9892a9ea7
	add	%i1,0x028,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030041428] = 9ea748b9892a9ea7
!	%l1 = 000000000000304c, Mem[0000000010141400] = 160000b0b3773199
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000000000304c
!	Mem[0000000010101400] = ffffffff, %l2 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f25 = 3009f5cd, Mem[000000001010141c] = f45fe3d2
	st	%f25,[%i4+0x01c]	! Mem[000000001010141c] = 3009f5cd
!	Mem[0000000021800141] = c7fa199f, %l5 = 0000000000000000
	ldstuba	[%o3+0x141]%asi,%l5	! %l5 = 000000fa000000ff
!	Mem[0000000030041400] = cdf50930, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 00000030000000ff
!	%l2 = 000000ff, %l3 = ffffffa4, Mem[0000000010081418] = ff074a48 4b96dc64
	stda	%l2,[%i2+0x018]%asi	! Mem[0000000010081418] = 000000ff ffffffa4
!	Mem[0000000021800100] = 35fb9db1, %l0 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l0	! %l0 = 00000035000000ff
!	%f18 = 00000054, Mem[0000000010101408] = dc640000
	sta	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000054
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = a4005636, %l3 = 00000000ffffffa4
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000a400

p0_label_77:
!	Mem[0000000030001410] = 64dc964b00000054, %l5 = 00000000000000fa
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = 64dc964b00000054
!	Mem[0000000010041430] = bba3b3e5 00004bff, %l0 = 00000035, %l1 = 0000304c
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 00000000bba3b3e5 0000000000004bff
!	Mem[0000000030181410] = a2d74ace, %l3 = 000000000000a400
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 0000000000004ace
!	Mem[0000000021800140] = c7ff199f, %l2 = 00000000000000ff
	ldub	[%o3+0x141],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l6 = 0000000064dc964b
	ldsha	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	%l1 = 0000000000004bff, %l1 = 0000000000004bff, %y  = 00000000
	udiv	%l1,%l1,%l0		! %l0 = 0000000000000001
	mov	%l0,%y			! %y = 00000001
!	Mem[0000000010101410] = 0000004c, %l2 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = 000000000000004c
!	Mem[0000000020800000] = a4005636, %l5 = 64dc964b00000054
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000a400
!	Mem[00000000300c1400] = d68bd32b ffffffb2, %l0 = 00000001, %l1 = 00004bff
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000ffffffb2 00000000d68bd32b
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000004ace, Mem[0000000030001400] = 000000003009f5cd
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000004ace

p0_label_78:
!	%f24 = 131eeab4 3009f5cd, %l5 = 000000000000a400
!	Mem[00000000300c1430] = f66049cd8031de45
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_SL ! Mem[00000000300c1430] = f66049cd8031de45
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000030
	ldstub	[%i1+%o4],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 4c000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 0000004c000000ff
!	%l1 = 00000000d68bd32b, Mem[0000000010081410] = ff000000b4c203cd
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000d68bd32b
!	Mem[0000000030041400] = ff09f5cd, %l5 = 000000000000a400
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ff09f5cd
!	%f2  = fe32ca16, Mem[00000000300c1400] = ffffffb2
	sta	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = fe32ca16
!	%l2 = 0000004c, %l3 = 00004ace, Mem[0000000030181408] = ff000000 00000000
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000004c 00004ace
!	%l4 = 00000000, %l5 = ff09f5cd, Mem[0000000010041410] = ff00ff00 e5cb0000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 ff09f5cd
!	Mem[00000000201c0001] = 00cdee02, %l2 = 000000000000004c
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000cd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffd74ace, %l7 = 000000000000004c
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff

p0_label_79:
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000d68bd32b
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030001400] = 00000000 00004ace 00000000 00000000
!	Mem[0000000030001410] = 64dc964b 00000054 5490d15e 00000000
!	Mem[0000000030001420] = 409dfdea 4e7ae252 a79e2a89 b948a79e
!	Mem[0000000030001430] = 8599e5c5 bb2bb937 62fa10da a4121063
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[00000000300c1408] = 686b81dc ff000000, %l0 = ffffffb2, %l1 = 000000ff
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000686b81dc 00000000ff000000
!	Mem[0000000010001410] = c5a663cc 5d4bb186, %l4 = 00000000, %l5 = ff09f5cd
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000c5a663cc 000000005d4bb186
!	Mem[0000000010001408] = 00000000 00000000, %l4 = c5a663cc, %l5 = 5d4bb186
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010041408] = 00000000000000ff, %l1 = 00000000ff000000
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = ff00000000000000, %l4 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = ff00000000000000
!	Mem[0000000010041408] = ff000000, %l7 = 00000000000000ff
	ldsb	[%i1+0x00a],%l7		! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000004ace
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101430] = 00000054
	stw	%l7,[%i4+0x030]		! Mem[0000000010101430] = 00000000

p0_label_80:
!	%l6 = ffffffffffffff00, Mem[0000000030081400] = 00000000
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ff00
!	Mem[0000000020800001] = a4005636, %l5 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000cd, Mem[0000000010001408] = 00000000
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000cd
!	%f30 = ab7737af 00000000, Mem[0000000030181408] = 0000004c 00004ace
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = ab7737af 00000000
!	%l3 = 0000000000000000, Mem[0000000010101400] = ffffffff
	stba	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ffffff
!	%f30 = ab7737af 00000000, %l7 = 0000000000000000
!	Mem[0000000030041430] = 37b92bbbc5e59985
	add	%i1,0x030,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030041430] = 37b92bbbc5e59985
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000686b81dc
	setx	0x3c940db80506cd3b,%g7,%l0 ! %l0 = 3c940db80506cd3b
!	%l1 = 00000000000000ff
	setx	0x1ef8c9a00c93b88d,%g7,%l1 ! %l1 = 1ef8c9a00c93b88d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3c940db80506cd3b
	setx	0xb94938a00e0550e7,%g7,%l0 ! %l0 = b94938a00e0550e7
!	%l1 = 1ef8c9a00c93b88d
	setx	0xf30b0e701862bed1,%g7,%l1 ! %l1 = f30b0e701862bed1
!	Mem[0000000030101400] = ffd74ace, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffd74ace
!	Mem[0000000010181400] = 69280000, %l2 = 00000000000000cd
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000069280000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000000000004ace, %f20 = c5a663cc 5d4bb186
	ldda	[%i0+%g0]0x81,%f20	! %f20 = 00000000 00004ace

p0_label_81:
!	Mem[0000000030101410] = 64dc964b, %l0 = b94938a00e0550e7
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 00000000000064dc
!	Mem[0000000010181408] = 00000000, %l4 = ff00000000000000
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l1 = f30b0e701862bed1
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181405] = 00000000, %l7 = 0000000000000000
	ldstub	[%i6+0x005],%l7		! %l7 = 00000000000000ff
!	Mem[0000000020800000] = a4ff5636, %l5 = 00000000ffd74ace
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000a4ff
!	Mem[0000000010081438] = ab7737af, %l3 = 0000000000000000
	lduw	[%i2+0x038],%l3		! %l3 = 00000000ab7737af
!	Mem[00000000100c1430] = ff074a484b96dc64, %f16 = 00000000 00000062
	ldda	[%i3+0x030]%asi,%f16	! %f16 = ff074a48 4b96dc64
!	Mem[0000000010041400] = 00000054, %l0 = 00000000000064dc
	lduba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000054
!	Mem[0000000010101408] = 00000054, %l1 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 5ed19054, Mem[0000000030101410] = 64dc964b 00000054
	stda	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 5ed19054

p0_label_82:
!	%l6 = ffffff00, %l7 = 00000000, Mem[0000000010081408] = cd004c30 4b96ffff
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff00 00000000
!	%f0  = ce4a0000, Mem[0000000030101410] = 00000000
	sta	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = ce4a0000
!	Mem[0000000030081400] = 0000ff00, %l0 = 0000000000000054
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l1 = 0000000000000000, Mem[000000001004140a] = ff000000
	sth	%l1,[%i1+0x00a]		! Mem[0000000010041408] = ff000000
!	%f0  = ce4a0000 00000000, Mem[0000000030181410] = ce4ad7a2 c5a61264
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ce4a0000 00000000
!	Mem[0000000030141408] = ffff0000, %l3 = 00000000ab7737af
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0001] = 00ffee02, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001407] = 00000062, %l7 = 0000000000000000
	ldstuba	[%i0+0x007]%asi,%l7	! %l7 = 00000062000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 62000000 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000062000000

p0_label_83:
!	Mem[0000000030001410] = 4b96dc64, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffdc64
!	Mem[0000000010181400] = cd000000, %f22 = ff074a48
	lda	[%i6+%g0]0x88,%f22	! %f22 = cd000000
!	Mem[0000000010101434] = 000000c5, %l2 = 0000000069280000
	ldswa	[%i4+0x034]%asi,%l2	! %l2 = 00000000000000c5
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000062
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = 000037be, %l4 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l0 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 4b96dc64, %l6 = ffffffffffffff00
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000064
!	Mem[0000000010181408] = 00000000 d94c0000, %l0 = 00000000, %l1 = 62000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000d94c0000
!	Mem[00000000100c1430] = ff074a48 4b96dc64, %l4 = 00000000, %l5 = 0000a4ff
	ldda	[%i3+0x030]%asi,%l4	! %l4 = 00000000ff074a48 000000004b96dc64
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_84:
!	%f26 = 4c000000, Mem[0000000030141410] = 00ffffff
	sta	%f26,[%i5+%o5]0x81	! Mem[0000000030141410] = 4c000000
!	Mem[0000000010101410] = ff000000, %l4 = 00000000ff074a48
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010181420] = 0000000000000000, %l1 = 00000000d94c0000, %l6 = 0000000000000064
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 0000000000000000
!	%f3  = 00000000, Mem[0000000030141408] = ffff00ff
	sta	%f3 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 64dc964b
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ff964b
!	Mem[0000000010181410] = 686b81dc, %l5 = 000000004b96dc64, %asi = 80
	swapa	[%i6+0x010]%asi,%l5	! %l5 = 00000000686b81dc
!	%f20 = 00000000 00004ace, %l6 = 0000000000000000
!	Mem[00000000300c1418] = 1855bab766e31c33
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1418] = 1855bab766e31c33
!	%l0 = 00000000, %l1 = d94c0000, Mem[0000000030181408] = ab7737af 00000000
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 d94c0000
!	%l0 = 0000000000000000, Mem[0000000030101410] = 00004ace
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff0619, %l5 = 00000000686b81dc
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff

p0_label_85:
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = ffff0000, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141408] = 00000000 00000000, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041418] = 28694386, %f15 = da10fa62
	lda	[%i1+0x018]%asi,%f15	! %f15 = 28694386
!	Mem[0000000010141410] = 4b96dc64, %l4 = 00000000000000ff
	lduwa	[%i5+%o5]0x88,%l4	! %l4 = 000000004b96dc64
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f14 = 631012a4 28694386, Mem[0000000010141400] = 00000000 0000304c
	stda	%f14,[%i5+0x000]%asi	! Mem[0000000010141400] = 631012a4 28694386
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000004b96dc64, Mem[0000000010041410] = 00000000
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 4b96dc64

p0_label_86:
!	%f31 = 00000000, Mem[0000000030081400] = 0000ffff
	sta	%f31,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f18 = 00000054 ff73e1b3, Mem[0000000010101408] = 00000054 00005316
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000054 ff73e1b3
!	Mem[0000000010101410] = ff000000, %l1 = 00000000d94c0000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010101410] = 62000000000000ff
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000030181410] = 00004ace, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ce000000ff
!	%l6 = 000000ce, %l7 = 00000000, Mem[0000000010181408] = 00000000 d94c0000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ce 00000000
!	%f2  = 00000000 00000000, Mem[0000000030101410] = 00000000 5490d15e
	stda	%f2 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	Mem[0000000030141408] = 00000000, %l3 = ffffffffffffdc64
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000000000ff, %f8  = 52e27a4e eafd9d40
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = 00000000 000000ff

p0_label_87:
!	Mem[0000000010181410] = ab7737af64dc964b, %l7 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = ab7737af64dc964b
!	Mem[0000000020800000] = a4ff5636, %l1 = 00000000000000ff
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000a4ff
!	Mem[0000000030101400] = 00000000, %f9  = 000000ff
	lda	[%i4+%g0]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000010101400] = 00ffffff a4ffffff, %l2 = 000000c5, %l3 = 00000000
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000ffffff 00000000a4ffffff
!	Mem[0000000030041410] = 86b14b5d4e7ae252, %f0  = ce4a0000 00000000
	ldda	[%i1+%o5]0x89,%f0 	! %f0  = 86b14b5d 4e7ae252
!	Mem[0000000010041400] = 54000000, %l3 = 00000000a4ffffff
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000054
!	Mem[0000000030181410] = ff4a0000 00000000, %l6 = 000000ce, %l7 = 64dc964b
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff4a0000 0000000000000000
!	Mem[0000000010101400] = ffffff00, %l3 = 0000000000000054
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00ffffff, %l4 = 000000004b96dc64
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[0000000010001438] = ab7737af
	st	%f2 ,[%i0+0x038]	! Mem[0000000010001438] = 00000000

p0_label_88:
!	%l2 = 0000000000ffffff, Mem[0000000010041410] = 4b96dc64
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ffffff
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l2 = 00ffffff, %l3 = 00000000, Mem[0000000010041408] = 000000ff 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00ffffff 00000000
!	Mem[0000000010001410] = c5a663cc, %l5 = ffffffffffffffff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000c5a663cc
!	%l4 = 00000000000000ff, Mem[0000000030141408] = ff000000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff0000
!	Mem[0000000010101408] = 54000000, %l6 = 00000000ff4a0000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000054000000
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = 00ffffff, %l3 = 00000000, Mem[0000000030041400] = 00a40000 f2d471b2
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ffffff 00000000
!	%f16 = ff074a48 4b96dc64 00000054 ff73e1b3
!	%f20 = 00000000 00004ace cd000000 0e2311ac
!	%f24 = 131eeab4 3009f5cd 4c000000 a4ffffff
!	%f28 = 993177b3 ce4ad7a2 ab7737af 00000000
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_89:
!	Mem[0000000010041400] = 54000000, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000005400
!	Mem[0000000010141400] = 631012a4 28694386, %l2 = 00ffffff, %l3 = 00005400
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000631012a4 0000000028694386
!	Mem[0000000010101400] = ffffff00, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030101408] = 4b96ff00, %l6 = 0000000054000000
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = 000000004b96ff00
!	Mem[0000000010101408] = 00004affff73e1b3, %f14 = 631012a4 28694386
	ldda	[%i4+%o4]0x80,%f14	! %f14 = 00004aff ff73e1b3
!	Mem[0000000010081408] = ffffff00, %f6  = 00000000
	lda	[%i2+%o4]0x88,%f6 	! %f6 = ffffff00
	membar	#Sync			! Added by membar checker (19)
!	Mem[00000000100c1418] = ac11230e, %l2 = 00000000631012a4
	ldub	[%i3+0x019],%l2		! %l2 = 0000000000000011
!	Mem[0000000030041410] = 86b14b5d4e7ae252, %l3 = 0000000028694386
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 86b14b5d4e7ae252
!	Mem[0000000010041410] = ffffff00, %l6 = 000000004b96ff00
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l6 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_90:
!	%l6 = 0000000000000000, Mem[0000000010181410] = 4b96dc64
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0096dc64
!	%l2 = 00000011, %l3 = 4e7ae252, Mem[0000000010181410] = 0096dc64 af3777ab
	stda	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 00000011 4e7ae252
!	Mem[00000000211c0000] = ffff0619, %l3 = 86b14b5d4e7ae252
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141420] = 409dfdea4e7ae252, %l0 = ffffffffffffff00, %l7 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 409dfdea4e7ae252
!	Mem[0000000030141408] = 0000ff00, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 000000000000ff00
!	%l7 = 409dfdea4e7ae252, Mem[00000000100c1400] = 4b96dc64
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4e7ae252
!	Mem[0000000030101408] = 4b96ff00, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000004b96ff00
!	%l6 = 000000004b96ff00, Mem[0000000030181408] = 00000000
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ff00
!	Mem[0000000030181400] = 00000000, %l7 = 409dfdea4e7ae252
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 28694386, %l7 = 0000000000000000
	lduha	[%i5+0x006]%asi,%l7	! %l7 = 0000000000004386

p0_label_91:
!	Mem[0000000030041400] = 00ffffff, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00000000 ce000000, %l4 = 000000ff, %l5 = c5a663cc
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000ce000000 0000000000000000
!	Mem[0000000010141400] = 631012a428694386, %l2 = 0000000000000011
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 631012a428694386
!	Mem[0000000030141410] = 4c000000, %l0 = ffffffffffffff00
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000004c00
!	Mem[0000000010001400] = 00000000, %f0  = 86b14b5d
	ld	[%i0+%g0],%f0 	! %f0 = 00000000
!	Mem[0000000030101408] = 00000000, %l4 = 00000000ce000000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00ffee02, %l3 = 000000000000ff00
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_92:
!	%f25 = 3009f5cd, Mem[0000000010181408] = ce000000
	sta	%f25,[%i6+%o4]0x88	! Mem[0000000010181408] = 3009f5cd
!	%l2 = 631012a428694386, Mem[0000000010101410] = 00000000
	stwa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 28694386
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000004c00
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = ffffffffffffffff, Mem[00000000100c1410] = ce4a0000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffff0000
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 00000000
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l2 = 631012a428694386, Mem[00000000100c141e] = 000000cd
	sth	%l2,[%i3+0x01e]		! Mem[00000000100c141c] = 00004386
!	%l0 = 000000ff, %l1 = 0000a4ff, Mem[0000000030001400] = 00000000 ce4a0000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff 0000a4ff
!	%l0 = 00000000000000ff, Mem[000000001000140c] = 00000000, %asi = 80
	stwa	%l0,[%i0+0x00c]%asi	! Mem[000000001000140c] = 000000ff
!	%l6 = 4b96ff00, %l7 = 00004386, Mem[0000000010001410] = ffffffff 5d4bb186
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 4b96ff00 00004386
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000004386
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_93:
!	Mem[0000000010101408] = 00004aff, %l5 = ffffffffffffffff
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 00ff964b, %l2 = 631012a428694386
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000ff964b
!	Mem[0000000010181420] = 00000000, %l3 = 00000000000000ff
	ldub	[%i6+0x021],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ffff000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = ffff000000000000
!	Mem[0000000030101400] = 00000000, %f8  = 00000000
	lda	[%i4+%g0]0x81,%f8 	! %f8 = 00000000
!	Mem[0000000010001408] = 000000cd, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000cd
!	Mem[0000000010041430] = bba3b3e5, %f30 = ab7737af
	ld	[%i1+0x030],%f30	! %f30 = bba3b3e5
!	Mem[0000000010141438] = d872e224 2fe666e8, %l0 = 000000ff, %l1 = 0000a4ff
	ldd	[%i5+0x038],%l0		! %l0 = 00000000d872e224 000000002fe666e8
!	Mem[0000000030041400] = ffffff00, %l7 = ffff000000000000
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = ff074a48 4b96dc64, %l0 = 00000000d872e224
!	Mem[0000000010001438] = 00000000000000c4
	add	%i0,0x038,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010001438] = 00009600004a00c4

p0_label_94:
!	Mem[0000000010101434] = 000000c5, %l3 = 00000000, %l4 = 000000ff
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000000000c5
!	%f8  = 00000000 00000000, Mem[0000000030001400] = 000000ff 0000a4ff
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	Mem[00000000100c143c] = af3777ab, %l3 = 00000000, %l7 = ffffffff
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000af3777ab
!	Mem[0000000010041408] = 00ffffff, %l1 = 000000002fe666e8
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000ffffff
!	%l6 = 000000004b96ff00, Mem[0000000030081410] = 00000000
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l7 = 00000000af3777ab, Mem[0000000010001408] = cd000000
	stba	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = ab000000
!	%l4 = 000000c5, %l5 = 000000cd, Mem[0000000030101400] = 00000000 4b96dc64
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000c5 000000cd
!	Mem[0000000010141408] = 00004c00, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000004c00
!	Mem[00000000300c1400] = 16ca32fe, %l4 = 00000000000000c5
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000016000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 11000000, %l5 = 00000000000000cd
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_95:
!	Mem[0000000010041408] = 2fe666e8, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000066e8
!	Mem[0000000010101408] = ff4a0000, %l3 = 0000000000004c00
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ff4a0000
!	Mem[0000000010001408] = ab000000, %l2 = 0000000000ff964b
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ab
!	Mem[0000000010001410] = 4b96ff00, %l7 = 00000000af3777ab
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 000000004b96ff00
!	Mem[0000000010001400] = 000000ff, %l3 = 00000000ff4a0000
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 00ffffff, %l6 = 000000004b96ff00
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010181430] = 8599e5c5bb2bb937, %l5 = 00000000000066e8
	ldx	[%i6+0x030],%l5		! %l5 = 8599e5c5bb2bb937
!	Mem[0000000030001400] = 00000000, %l7 = 000000004b96ff00
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 52e27a4e484a07ff, %l0 = 00000000d872e224
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 52e27a4e484a07ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041424] = 1a073cc4, %l1 = 00ffffff, %l7 = 00000000
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 000000001a073cc4

p0_label_96:
!	%l0 = 52e27a4e484a07ff, Mem[0000000010101410] = 8643692800000000
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 52e27a4e484a07ff
!	%f24 = 131eeab4 3009f5cd, Mem[00000000100c1410] = 0000ffff 00000000
	stda	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = 131eeab4 3009f5cd
!	%f19 = ff73e1b3, Mem[00000000100c1410] = 3009f5cd
	sta	%f19,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff73e1b3
!	Mem[00000000100c1408] = ff73e1b3, %l5 = 8599e5c5bb2bb937
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000ff73e1b3
!	%l0 = 52e27a4e484a07ff, Mem[0000000010041410] = ffffff00
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff
!	Mem[0000000010141400] = a4121063, %l5 = 00000000ff73e1b3
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000a4121063
!	Mem[0000000030101400] = 000000c5, %l5 = 00000000a4121063
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000c5
!	%f6  = ffffff00, Mem[0000000010081400] = 00000000
	sta	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffff00
!	%l3 = 00000000000000ff, Mem[000000001014140f] = ffffffff, %asi = 80
	stba	%l3,[%i5+0x00f]%asi	! Mem[000000001014140c] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000 00000000, %l4 = 00000016, %l5 = 000000c5
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_97:
!	Mem[00000000100c1408] = 37b92bbb, %l7 = 000000001a073cc4
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000037b92bbb
!	Mem[0000000021800140] = c7ff199f, %l4 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l4	! %l4 = ffffffffffffc7ff
!	Mem[00000000100c1408] = 00000054 bb2bb937, %l6 = 00ffffff, %l7 = 37b92bbb
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000bb2bb937 0000000000000054
!	Mem[0000000030101408] = 00000000, %f9  = 00000000
	lda	[%i4+%o4]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000030081408] = 26ed582f 220000ff, %l4 = ffffc7ff, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000220000ff 0000000026ed582f
!	Mem[0000000030101410] = 00000000 00000000, %l4 = 220000ff, %l5 = 26ed582f
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l0 = 52e27a4e484a07ff
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f9  = 00000000, %f4  = 54000000
	fstoi	%f9 ,%f4 		! %f4  = 00000000
!	Mem[000000001014142c] = 0000006d, %l1 = 0000000000ffffff
	ldsw	[%i5+0x02c],%l1		! %l1 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%f16 = ff074a48, Mem[0000000030141400] = 00000000
	sta	%f16,[%i5+%g0]0x81	! Mem[0000000030141400] = ff074a48

p0_label_98:
!	%l1 = 000000000000006d, Mem[0000000030141408] = ff000000
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 006d0000
!	Mem[0000000010041400] = 54000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000054000000ff
!	%f10 = 9ea748b9, Mem[0000000030001400] = 00000000
	sta	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 9ea748b9
!	%l5 = 0000000000000000, Mem[0000000010081408] = ffffff00
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l6 = 00000000bb2bb937, Mem[0000000010141400] = b3e173ff
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = b93773ff
!	%l3 = 00000000000000ff, Mem[0000000030141408] = 00006d00
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 0000000000000054
	setx	0xd3f112285fbadc35,%g7,%l0 ! %l0 = d3f112285fbadc35
!	%l1 = 000000000000006d
	setx	0xef740460416f0494,%g7,%l1 ! %l1 = ef740460416f0494
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d3f112285fbadc35
	setx	0x3217f1403a6f5bc3,%g7,%l0 ! %l0 = 3217f1403a6f5bc3
!	%l1 = ef740460416f0494
	setx	0xb195846003838db1,%g7,%l1 ! %l1 = b195846003838db1
!	Mem[000000001008142a] = cd03c2b4, %l4 = 0000000000000000
	ldstuba	[%i2+0x02a]%asi,%l4	! %l4 = 000000c2000000ff
!	%l0 = 3a6f5bc3, %l1 = 03838db1, Mem[0000000010141420] = 409dfdea 4e7ae252
	std	%l0,[%i5+0x020]		! Mem[0000000010141420] = 3a6f5bc3 03838db1
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 686b81dcff000000, %f8  = 00000000 00000000
	ldda	[%i3+%o4]0x81,%f8 	! %f8  = 686b81dc ff000000

p0_label_99:
!	Mem[0000000030181408] = 0000ff00, %l6 = 00000000bb2bb937
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 00000011, %l0 = 3217f1403a6f5bc3
	lduba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ffffff00, %f6  = ffffff00
	lda	[%i4+%g0]0x88,%f6 	! %f6 = ffffff00
!	Mem[0000000030041410] = 4e7ae252, %l2 = 00000000000000ab
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 000000000000e252
!	Mem[0000000010001400] = ff000000 000000ff, %l6 = 00000000, %l7 = 00000054
	ldda	[%i0+0x000]%asi,%l6	! %l6 = 00000000ff000000 00000000000000ff
!	Mem[0000000010001410] = 00ff964b, %l1 = b195846003838db1
	lduha	[%i0+%o5]0x88,%l1	! %l1 = 000000000000964b
!	Mem[0000000010101410] = ff074a484e7ae252, %l5 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = ff074a484e7ae252
!	Mem[0000000010001430] = 993177b3, %l0 = 0000000000000000
	lduba	[%i0+0x031]%asi,%l0	! %l0 = 0000000000000031
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[0000000010081400] = ff00000000ffffff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000ff000000

p0_label_100:
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = ffff0619
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = ffff0619
!	%f0  = 00000000, Mem[0000000010041408] = e866e62f
	sta	%f0 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l0 = 0000000000000031, Mem[0000000010081435] = 00000000
	stb	%l0,[%i2+0x035]		! Mem[0000000010081434] = 00310000
!	%f30 = bba3b3e5 00000000, Mem[00000000100c1408] = bb2bb937 00000054
	stda	%f30,[%i3+%o4]0x88	! Mem[00000000100c1408] = bba3b3e5 00000000
!	%f12 = 37b92bbb c5e59985, %l5 = ff074a484e7ae252
!	Mem[0000000010001418] = ff074a480e2311ac
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001418] = ff07e5c50e2311ac
!	Mem[0000000030081400] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ffffff00, %l0 = 0000000000000031
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 00000000ffffff00
!	%f30 = bba3b3e5 00000000, Mem[0000000010141410] = 4b96dc64 60e60000
	stda	%f30,[%i5+%o5]0x88	! Mem[0000000010141410] = bba3b3e5 00000000
!	%f22 = cd000000 0e2311ac, Mem[0000000010001438] = 00009600 004a00c4
	stda	%f22,[%i0+0x038]%asi	! Mem[0000000010001438] = cd000000 0e2311ac
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, imm = fffffffffffff024, %l1 = 000000000000964b
	subc	%l6,-0xfdc,%l1		! %l1 = 0000000000000fdc

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldd	[%i0+0x018],%l2
	lduba	[%i1+0x018]%asi,%l4
	addc	%l6,%l2,%l6
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000ffffff00
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000fdc
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000e252
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000c2
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ff074a484e7ae252
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000001,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 4e7ae252
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 4b96dc64
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffffff00 5ed19054
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 686b81dc ff000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 9ea748b9 892a9ea7
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 37b92bbb c5e59985
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00004aff ff73e1b3
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff074a48 4b96dc64
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000054 ff73e1b3
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00004ace
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be cd000000 0e2311ac
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 131eeab4 3009f5cd
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 4c000000 a4ffffff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 993177b3 ce4ad7a2
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be bba3b3e5 00000000
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
	fmuls	%f7 ,%f0 ,%f14
	andn	%l2,0xb34,%l0
	done

p0_trap1o:
	fmuls	%f7 ,%f0 ,%f14
	andn	%l2,0xb34,%l0
	done


p0_trap2e:
	orn	%l4,0x34d,%l0
	or	%l4,%l5,%l5
	ldxa	[%i0+%o4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001408]
	fstoi	%f8 ,%f15
	stxa	%l5,[%i5+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141400]
	done

p0_trap2o:
	orn	%l4,0x34d,%l0
	or	%l4,%l5,%l5
	ldxa	[%o0+%i4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001408]
	fstoi	%f8 ,%f15
	stxa	%l5,[%o5+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141400]
	done


p0_trap3e:
	xnor	%l3,%l6,%l6
	and	%l2,0xba3,%l0
	addc	%l1,-0xce3,%l3
	or	%l3,%l0,%l4
	and	%l4,-0x737,%l4
	done

p0_trap3o:
	xnor	%l3,%l6,%l6
	and	%l2,0xba3,%l0
	addc	%l1,-0xce3,%l3
	or	%l3,%l0,%l4
	and	%l4,-0x737,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 63941a70357da65b
	ldx	[%g1+0x008],%l1		! %l1 = a5b8e582c1fe3540
	ldx	[%g1+0x010],%l2		! %l2 = c83e4615d6830b5f
	ldx	[%g1+0x018],%l3		! %l3 = f468074def11eff1
	ldx	[%g1+0x020],%l4		! %l4 = b16f4b8878b442b0
	ldx	[%g1+0x028],%l5		! %l5 = 57864bbc9d432fba
	ldx	[%g1+0x030],%l6		! %l6 = 4e3ad421a756b5f4
	ldx	[%g1+0x038],%l7		! %l7 = 97fa894a2d59317c

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
	ldstub	[%o2+0x001],%l2		! Mem[00000000211c0001]
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	ldx	[%i4+0x010],%l4		! Mem[0000000010101410]
	ldsb	[%i1+0x00a],%l2		! Mem[000000001004140a]
	jmpl	%o7,%g0
	ldsb	[%i6+0x014],%l7		! Mem[0000000010181414]
near0_b2b_h:
	fsubs	%f28,%f30,%f30
	xnor	%l0,%l0,%l7
	sdivx	%l2,0x9f4,%l0
	fdivs	%f17,%f22,%f29
	nop
	jmpl	%o7,%g0
	sdivx	%l5,0x4f9,%l1
near0_b2b_l:
	fcmps	%fcc0,%f6 ,%f15
	sdivx	%l5,%l2,%l1
	udivx	%l5,0x20a,%l3
	add	%l1,%l2,%l2
	udivx	%l2,0xeb9,%l4
	jmpl	%o7,%g0
	fstod	%f14,%f6 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	umul	%l3,%l1,%l1
	swap	[%i6+0x01c],%l5		! Mem[000000001018141c]
	fstod	%f12,%f8 
	fdivs	%f15,%f7 ,%f4 
	mulx	%l3,%l5,%l2
	nop
	addc	%l4,-0x7a8,%l3
	jmpl	%o7,%g0
	stb	%l2,[%i0+0x007]		! Mem[0000000010001407]
p0_near_1_he:
	ldub	[%i0+0x017],%l5		! Mem[0000000010001417]
	nop
	xnor	%l3,0x582,%l5
	jmpl	%o7,%g0
	swap	[%i4+0x030],%l7		! Mem[0000000010101430]
near1_b2b_h:
	fitod	%f29,%f16
	fstoi	%f17,%f31
	fsubs	%f19,%f26,%f30
	andn	%l3,0xfc3,%l5
	fmuls	%f26,%f16,%f23
	fcmps	%fcc0,%f23,%f30
	xnor	%l3,0xe44,%l6
	jmpl	%o7,%g0
	fdivs	%f29,%f24,%f27
near1_b2b_l:
	add	%l4,%l1,%l0
	fadds	%f0 ,%f0 ,%f15
	fitos	%f8 ,%f15
	nop
	andn	%l0,%l2,%l2
	andn	%l7,0x0cb,%l2
	fsqrts	%f3 ,%f9 
	jmpl	%o7,%g0
	fdivs	%f10,%f7 ,%f5 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fmuls	%f0 ,%f8 ,%f6 
	jmpl	%o7,%g0
	andn	%l6,-0xb80,%l4
p0_near_2_he:
	mulx	%l6,-0xaf0,%l0
	swap	[%i4+0x03c],%l3		! Mem[000000001010143c]
	fdivs	%f30,%f28,%f18
	jmpl	%o7,%g0
	andn	%l5,-0x65b,%l0
near2_b2b_h:
	fitod	%f29,%f24
	fdivs	%f27,%f17,%f19
	add	%l0,%l5,%l0
	mulx	%l3,0xf17,%l7
	xnor	%l6,%l0,%l0
	sub	%l5,-0x9a4,%l7
	subc	%l0,%l7,%l0
	jmpl	%o7,%g0
	add	%l1,%l5,%l2
near2_b2b_l:
	fsubs	%f6 ,%f1 ,%f13
	fitod	%f3 ,%f4 
	fstoi	%f15,%f15
	andn	%l4,%l6,%l3
	subc	%l2,%l2,%l2
	orn	%l5,0xd4e,%l6
	orn	%l5,%l6,%l1
	jmpl	%o7,%g0
	fitod	%f9 ,%f0 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fitod	%f6 ,%f14
	fitod	%f9 ,%f12
	stb	%l6,[%i4+0x024]		! Mem[0000000010101424]
	fdtos	%f4 ,%f11
	ldsw	[%i3+0x018],%l7		! Mem[00000000100c1418]
	jmpl	%o7,%g0
	std	%l6,[%i0+0x010]		! Mem[0000000010001410]
p0_near_3_he:
	stw	%l2,[%i3+0x008]		! Mem[00000000100c1408]
	udivx	%l7,0xf83,%l4
	lduh	[%i1+0x004],%l3		! Mem[0000000010041404]
	stb	%l4,[%i3+0x02d]		! Mem[00000000100c142d]
	ld	[%i5+0x018],%f27	! Mem[0000000010141418]
	fmuls	%f16,%f19,%f20
	jmpl	%o7,%g0
	nop
near3_b2b_h:
	add	%l3,-0x4e2,%l7
	subc	%l1,%l3,%l1
	jmpl	%o7,%g0
	orn	%l7,%l6,%l3
near3_b2b_l:
	and	%l7,%l2,%l3
	fdtos	%f2 ,%f6 
	jmpl	%o7,%g0
	xnor	%l5,-0xbf1,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	subc	%l6,%l3,%l2
	fstoi	%f15,%f9 
	fdtoi	%f0 ,%f1 
	fdtos	%f6 ,%f1 
	fstoi	%f1 ,%f7 
	sub	%l6,0xe74,%l2
	jmpl	%o7,%g0
	fcmps	%fcc1,%f11,%f11
p0_far_0_lem:
	subc	%l6,%l3,%l2
	fstoi	%f15,%f9 
	fdtoi	%f0 ,%f1 
	fdtos	%f6 ,%f1 
	fstoi	%f1 ,%f7 
	sub	%l6,0xe74,%l2
	jmpl	%o7,%g0
	fcmps	%fcc1,%f11,%f11
p0_far_0_he:
	jmpl	%o7,%g0
	lduw	[%i1+0x024],%l5		! Mem[0000000010041424]
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i1+0x024],%l5		! Mem[0000000010041424]
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	xnor	%l3,%l4,%l3
	nop
	jmpl	%o7,%g0
	fstod	%f23,%f16
far0_b2b_l:
	add	%l0,%l6,%l5
	orn	%l2,-0x9d5,%l2
	jmpl	%o7,%g0
	fitos	%f11,%f6 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	ldd	[%i3+0x028],%f6 	! Mem[00000000100c1428]
	std	%l0,[%i4+0x018]		! Mem[0000000010101418]
	jmpl	%o7,%g0
	sth	%l0,[%i5+0x01e]		! Mem[000000001014141e]
p0_far_1_lem:
	membar	#Sync
	ldd	[%i3+0x028],%f6 	! Mem[00000000100c1428]
	std	%l0,[%i4+0x018]		! Mem[0000000010101418]
	membar	#Sync
	jmpl	%o7,%g0
	sth	%l0,[%i5+0x01e]		! Mem[000000001014141e]
p0_far_1_he:
	std	%f18,[%i5+0x018]	! Mem[0000000010141418]
	jmpl	%o7,%g0
	fsqrts	%f29,%f25
p0_far_1_hem:
	membar	#Sync
	std	%f18,[%i5+0x018]	! Mem[0000000010141418]
	jmpl	%o7,%g0
	fsqrts	%f29,%f25
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fitod	%f17,%f26
	xnor	%l6,-0xb95,%l6
	sub	%l6,%l2,%l3
	add	%l0,0x596,%l1
	fitos	%f24,%f30
	fmuls	%f25,%f26,%f16
	jmpl	%o7,%g0
	fdivs	%f20,%f18,%f24
far1_b2b_l:
	xor	%l7,-0x5cf,%l5
	fitod	%f8 ,%f14
	fadds	%f2 ,%f1 ,%f9 
	and	%l3,%l4,%l4
	or	%l2,-0x4b0,%l7
	andn	%l0,0x268,%l7
	jmpl	%o7,%g0
	fdivs	%f11,%f1 ,%f13
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ldd	[%i4+0x028],%l2		! Mem[0000000010101428]
	fdivs	%f3 ,%f9 ,%f12
	fitod	%f5 ,%f12
	fsqrts	%f10,%f7 
	swap	[%i5+0x020],%l6		! Mem[0000000010141420]
	jmpl	%o7,%g0
	sdivx	%l7,%l1,%l4
p0_far_2_lem:
	membar	#Sync
	ldd	[%i4+0x028],%l2		! Mem[0000000010101428]
	fdivs	%f3 ,%f9 ,%f12
	fitod	%f5 ,%f12
	fsqrts	%f10,%f7 
	swap	[%i5+0x020],%l6		! Mem[0000000010141420]
	jmpl	%o7,%g0
	sdivx	%l7,%l1,%l4
p0_far_2_he:
	jmpl	%o7,%g0
	add	%l6,-0x5ab,%l2
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	add	%l6,-0x5ab,%l2
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sub	%l2,-0x351,%l3
	jmpl	%o7,%g0
	addc	%l3,0x97f,%l3
far2_b2b_l:
	or	%l7,-0x512,%l2
	jmpl	%o7,%g0
	sub	%l3,-0xd00,%l6
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	smul	%l2,-0x4b1,%l1
	stw	%l2,[%i0+0x02c]		! Mem[000000001000142c]
	stb	%l2,[%i3+0x016]		! Mem[00000000100c1416]
	jmpl	%o7,%g0
	std	%l4,[%i6+0x020]		! Mem[0000000010181420]
p0_far_3_lem:
	smul	%l2,-0x4b1,%l1
	membar	#Sync
	stw	%l2,[%i0+0x02c]		! Mem[000000001000142c]
	stb	%l2,[%i3+0x016]		! Mem[00000000100c1416]
	membar	#Sync
	jmpl	%o7,%g0
	std	%l4,[%i6+0x020]		! Mem[0000000010181420]
p0_far_3_he:
	fadds	%f22,%f22,%f17
	jmpl	%o7,%g0
	fitod	%f18,%f26
p0_far_3_hem:
	fadds	%f22,%f22,%f17
	jmpl	%o7,%g0
	fitod	%f18,%f26
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sdivx	%l3,%l4,%l2
	jmpl	%o7,%g0
	fstod	%f24,%f16
far3_b2b_l:
	xnor	%l4,%l0,%l2
	jmpl	%o7,%g0
	fsqrts	%f0 ,%f5 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	orn	%l1,0x0a3,%l2
p0_call_0_le:
	ldsb	[%i4+0x020],%l4		! Mem[0000000010101420]
	fsqrts	%f5 ,%f0 
	ld	[%i0+0x000],%f6 	! Mem[0000000010001400]
	mulx	%l3,%l6,%l3
	st	%f3 ,[%i0+0x01c]	! Mem[000000001000141c]
	xnor	%l3,-0x028,%l1
	retl
	std	%f2 ,[%i5+0x038]	! Mem[0000000010141438]
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	orn	%l1,0x0a3,%l2
p0_call_0_lo:
	ldsb	[%o4+0x020],%l4		! Mem[0000000010101420]
	fsqrts	%f5 ,%f0 
	ld	[%o0+0x000],%f6 	! Mem[0000000010001400]
	mulx	%l3,%l6,%l3
	st	%f3 ,[%o0+0x01c]	! Mem[000000001000141c]
	xnor	%l3,-0x028,%l1
	retl
	std	%f2 ,[%o5+0x038]	! Mem[0000000010141438]
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	stb	%l1,[%i6+0x03e]		! Mem[000000001018143e]
p0_call_0_he:
	ldub	[%i5+0x005],%l2		! Mem[0000000010141405]
	retl
	ldsw	[%i2+0x030],%l4		! Mem[0000000010081430]
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	stb	%l1,[%o6+0x03e]		! Mem[000000001018143e]
p0_call_0_ho:
	ldub	[%o5+0x005],%l2		! Mem[0000000010141405]
	retl
	ldsw	[%o2+0x030],%l4		! Mem[0000000010081430]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	stb	%l4,[%i6+0x006]		! Mem[0000000010181406]
	ldstub	[%o3+0x180],%l6		! Mem[0000000021800180]
	smul	%l7,%l6,%l7
	swap	[%i1+0x010],%l5		! Mem[0000000010041410]
	stb	%l3,[%i0+0x018]		! Mem[0000000010001418]
	fmuls	%f4 ,%f3 ,%f6 
	fitod	%f2 ,%f0 
	jmpl	%g6+8,%g0
	lduh	[%i4+0x024],%l5		! Mem[0000000010101424]
p0_call_1_le:
	swap	[%i4+0x030],%l7		! Mem[0000000010101430]
	xnor	%l0,%l1,%l2
	retl
	ldsh	[%i1+0x036],%l4		! Mem[0000000010041436]
p0_jmpl_1_lo:
	stb	%l4,[%o6+0x006]		! Mem[0000000010181406]
	ldstub	[%i3+0x180],%l6		! Mem[0000000021800180]
	smul	%l7,%l6,%l7
	swap	[%o1+0x010],%l5		! Mem[0000000010041410]
	stb	%l3,[%o0+0x018]		! Mem[0000000010001418]
	fmuls	%f4 ,%f3 ,%f6 
	fitod	%f2 ,%f0 
	jmpl	%g6+8,%g0
	lduh	[%o4+0x024],%l5		! Mem[0000000010101424]
p0_call_1_lo:
	swap	[%o4+0x030],%l7		! Mem[0000000010101430]
	xnor	%l0,%l1,%l2
	retl
	ldsh	[%o1+0x036],%l4		! Mem[0000000010041436]
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	fmuls	%f26,%f28,%f24
p0_call_1_he:
	ldub	[%i4+0x039],%l5		! Mem[0000000010101439]
	sub	%l6,0x6f1,%l0
	swap	[%i3+0x00c],%l0		! Mem[00000000100c140c]
	ldsw	[%i6+0x03c],%l3		! Mem[000000001018143c]
	ldstub	[%i6+0x028],%l6		! Mem[0000000010181428]
	retl
	xnor	%l0,%l2,%l6
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	fmuls	%f26,%f28,%f24
p0_call_1_ho:
	ldub	[%o4+0x039],%l5		! Mem[0000000010101439]
	sub	%l6,0x6f1,%l0
	swap	[%o3+0x00c],%l0		! Mem[00000000100c140c]
	ldsw	[%o6+0x03c],%l3		! Mem[000000001018143c]
	ldstub	[%o6+0x028],%l6		! Mem[0000000010181428]
	retl
	xnor	%l0,%l2,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldstub	[%i2+0x00e],%l6		! Mem[000000001008140e]
	jmpl	%g6+8,%g0
	mulx	%l7,-0x480,%l5
p0_call_2_le:
	andn	%l0,0xfa4,%l2
	retl
	andn	%l4,-0xb8e,%l2
p0_jmpl_2_lo:
	ldstub	[%o2+0x00e],%l6		! Mem[000000001008140e]
	jmpl	%g6+8,%g0
	mulx	%l7,-0x480,%l5
p0_call_2_lo:
	andn	%l0,0xfa4,%l2
	retl
	andn	%l4,-0xb8e,%l2
p0_jmpl_2_he:
	st	%f30,[%i4+0x000]	! Mem[0000000010101400]
	jmpl	%g6+8,%g0
	or	%l5,%l4,%l7
p0_call_2_he:
	fitos	%f20,%f21
	nop
	fstod	%f21,%f16
	std	%f18,[%i4+0x010]	! Mem[0000000010101410]
	retl
	stw	%l6,[%i5+0x014]		! Mem[0000000010141414]
p0_jmpl_2_ho:
	st	%f30,[%o4+0x000]	! Mem[0000000010101400]
	jmpl	%g6+8,%g0
	or	%l5,%l4,%l7
p0_call_2_ho:
	fitos	%f20,%f21
	nop
	fstod	%f21,%f16
	std	%f18,[%o4+0x010]	! Mem[0000000010101410]
	retl
	stw	%l6,[%o5+0x014]		! Mem[0000000010141414]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	ldsh	[%i6+0x02a],%l2		! Mem[000000001018142a]
p0_call_3_le:
	fsubs	%f13,%f14,%f10
	andn	%l7,%l5,%l0
	retl
	sth	%l1,[%i4+0x01c]		! Mem[000000001010141c]
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	ldsh	[%o6+0x02a],%l2		! Mem[000000001018142a]
p0_call_3_lo:
	fsubs	%f13,%f14,%f10
	andn	%l7,%l5,%l0
	retl
	sth	%l1,[%o4+0x01c]		! Mem[000000001010141c]
p0_jmpl_3_he:
	ldsw	[%i2+0x01c],%l6		! Mem[000000001008141c]
	xor	%l5,%l7,%l4
	swap	[%i2+0x030],%l4		! Mem[0000000010081430]
	nop
	ldstub	[%o1+0x041],%l2		! Mem[0000000020800041]
	add	%l1,%l6,%l5
	jmpl	%g6+8,%g0
	ld	[%i5+0x02c],%f24	! Mem[000000001014142c]
p0_call_3_he:
	orn	%l3,-0x75e,%l7
	xnor	%l2,0x627,%l0
	swap	[%i3+0x034],%l3		! Mem[00000000100c1434]
	retl
	std	%l4,[%i6+0x018]		! Mem[0000000010181418]
p0_jmpl_3_ho:
	ldsw	[%o2+0x01c],%l6		! Mem[000000001008141c]
	xor	%l5,%l7,%l4
	swap	[%o2+0x030],%l4		! Mem[0000000010081430]
	nop
	ldstub	[%i1+0x041],%l2		! Mem[0000000020800041]
	add	%l1,%l6,%l5
	jmpl	%g6+8,%g0
	ld	[%o5+0x02c],%f24	! Mem[000000001014142c]
p0_call_3_ho:
	orn	%l3,-0x75e,%l7
	xnor	%l2,0x627,%l0
	swap	[%o3+0x034],%l3		! Mem[00000000100c1434]
	retl
	std	%l4,[%o6+0x018]		! Mem[0000000010181418]
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
	.word	0x63941a70,0x357da65b		! Init value for %l0
	.word	0xa5b8e582,0xc1fe3540		! Init value for %l1
	.word	0xc83e4615,0xd6830b5f		! Init value for %l2
	.word	0xf468074d,0xef11eff1		! Init value for %l3
	.word	0xb16f4b88,0x78b442b0		! Init value for %l4
	.word	0x57864bbc,0x9d432fba		! Init value for %l5
	.word	0x4e3ad421,0xa756b5f4		! Init value for %l6
	.word	0x97fa894a,0x2d59317c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xdef3c0a1,0x99c197bf		! Init value for %f0 
	.word	0x83293722,0xa028dfc5		! Init value for %f2 
	.word	0x4e9ac385,0xb61105e4		! Init value for %f4 
	.word	0x182f5af9,0x0d3f1df2		! Init value for %f6 
	.word	0xdcd3f311,0x07cdefd6		! Init value for %f8 
	.word	0x8f0bb3d2,0x5316e302		! Init value for %f10
	.word	0x0687a2d1,0x665d8714		! Init value for %f12
	.word	0xd683a6bf,0x1b26a934		! Init value for %f14
	.word	0x59e028d5,0x77c99c15		! Init value for %f16
	.word	0xaad720c7,0x5a483541		! Init value for %f18
	.word	0xb50fb6ec,0xa32bc61e		! Init value for %f20
	.word	0x6873507a,0x8f79bbd0		! Init value for %f22
	.word	0x37916c18,0x598bd5a1		! Init value for %f24
	.word	0x1f00a0f0,0xe913873f		! Init value for %f26
	.word	0xcce698f2,0x5724fdd7		! Init value for %f28
	.word	0xdff6e151,0x561375b3		! Init value for %f30
	.word	0xfea24580,0x9c078f9d		! Init value for %f32
	.word	0xceadd7e2,0xa09ecb93		! Init value for %f34
	.word	0x9be85383,0x949e90b3		! Init value for %f36
	.word	0x61e5da81,0x21150229		! Init value for %f38
	.word	0xbde7d24a,0x8250b484		! Init value for %f40
	.word	0xad268c0e,0x00e1955c		! Init value for %f42
	.word	0x764bcf77,0x519d3a52		! Init value for %f44
	.word	0x4d780f80,0x5d04aa2e		! Init value for %f46
	.word	0x075857cd,0xe387fe47
	.word	0x3effb029,0x6f083e7d
	.word	0x0c25ff0b,0x6a06810a
	.word	0x853445b4,0x706f5406
	.word	0x2dafbede,0xa6a779f9
	.word	0x3b017ccd,0xf0d476cc
	.word	0x16cf0e29,0xf17f2cad
	.word	0x89a14364,0x3a96a349
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
	.word	0x00000000,0xffffff00
	.word	0x00000000,0x00000fdc
	.word	0x00000000,0x0000e252
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000c2
	.word	0xff074a48,0x4e7ae252
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0x00000000,0x4e7ae252
	.word	0x00000000,0x00000000
	.word	0x00000000,0x4b96dc64
	.word	0xffffff00,0x5ed19054
	.word	0x686b81dc,0xff000000
	.word	0x9ea748b9,0x892a9ea7
	.word	0x37b92bbb,0xc5e59985
	.word	0x00004aff,0xff73e1b3
	.word	0xff074a48,0x4b96dc64
	.word	0x00000054,0xff73e1b3
	.word	0x00000000,0x00004ace
	.word	0xcd000000,0x0e2311ac
	.word	0x131eeab4,0x3009f5cd
	.word	0x4c000000,0xa4ffffff
	.word	0x993177b3,0xce4ad7a2
	.word	0xbba3b3e5,0x00000000
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0xff000000,0x000000ff
	.word	0xab000000,0x000000ff
	.word	0x4b96ff00,0x00004386
	.word	0xff07e5c5,0x0e2311ac
	.word	0x131eeab4,0x3009f5cd
	.word	0xffffffff,0xa4ffffff
	.word	0x993177b3,0xce4ad7a2
	.word	0xcd000000,0x0e2311ac
p0_local0_sec_expect:
	.word	0x9ea748b9,0x00000000
	.word	0xff000000,0x00000000
	.word	0x64dc964b,0x00000054
	.word	0x5490d15e,0x00000000
	.word	0x409dfdea,0x4e7ae252
	.word	0xa79e2a89,0xb948a79e
	.word	0x8599e5c5,0xbb2bb937
	.word	0x62fa10da,0xa4121063
p0_local1_expect:
	.word	0xff000000,0xd6ea1e3d
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xff09f5cd
	.word	0x28694386,0x000000a8
	.word	0xd064c176,0x1a073cc4
	.word	0x680081ff,0xaf3777ab
	.word	0xbba3b3e5,0x00004bff
	.word	0x00000000,0x00000079
p0_local1_sec_expect:
	.word	0xffffff00,0x00000000
	.word	0xb3000000,0x00000000
	.word	0x52e27a4e,0x5d4bb186
	.word	0x64a4b6d8,0x955f911b
	.word	0x52e27a4e,0xeafd9d40
	.word	0x9ea748b9,0x892a9ea7
	.word	0x37b92bbb,0xc5e59985
	.word	0xe866e62f,0x24e272d8
p0_local2_expect:
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0xd68bd32b
	.word	0x000000ff,0xffffffa4
	.word	0x1a073cc4,0x3009f5cd
	.word	0xcd03ffb4,0x00000062
	.word	0xff3177b3,0x00310000
	.word	0xab7737af,0xff4b9d3e
p0_local2_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xff000022,0x2f58ed26
	.word	0x00000000,0x0de7f399
	.word	0x138d5da1,0x4b1a65d1
	.word	0xea84ad9f,0xb97c3607
	.word	0x256c63b8,0xfe412abb
	.word	0xbd7c6083,0xb0d2299b
	.word	0x80e74541,0xb4d70255
p0_local3_expect:
	.word	0x52e27a4e,0x484a07ff
	.word	0x00000000,0xe5b3a3bb
	.word	0xb3e173ff,0xb4ea1e13
	.word	0xac11230e,0x00004386
	.word	0xcdf50930,0xb4ea1e13
	.word	0xffffffa4,0x0000004c
	.word	0xa2d74ace,0xb3773199
	.word	0x00000000,0xaf3777ab
p0_local3_sec_expect:
	.word	0xffca32fe,0x2bd38bd6
	.word	0x686b81dc,0xff000000
	.word	0x00000000,0x00000000
	.word	0x1855bab7,0x66e31c33
	.word	0x92f1cdc0,0xc1239e45
	.word	0x4472cbcc,0x4c6ae43a
	.word	0xf66049cd,0x8031de45
	.word	0xc1b4496a,0x128a8c87
p0_local4_expect:
	.word	0x31000000,0xa4ffffff
	.word	0x00004aff,0xff73e1b3
	.word	0x52e27a4e,0x484a07ff
	.word	0x43ce5375,0x3009f5cd
	.word	0x77ecca3d,0x28694386
	.word	0x8f0bb3d2,0x5316e302
	.word	0x00000000,0x000000c5
	.word	0x964b9d3e,0x1b26221e
p0_local4_sec_expect:
	.word	0xa4121063,0x000000cd
	.word	0x00000000,0xce4ad7a2
	.word	0x00000000,0x00000000
	.word	0xa2d74ace,0xe86b81dc
	.word	0xffffffff,0xa4ffffff
	.word	0xc5a663cc,0x5d4bb186
	.word	0xa2d74ace,0xb3773199
	.word	0x686b81dc,0xaf3777ab
p0_local5_expect:
	.word	0xb93773ff,0x28694386
	.word	0x00000000,0xffffffff
	.word	0x00000000,0xe5b3a3bb
	.word	0x00000000,0x77988d1e
	.word	0x3a6f5bc3,0x03838db1
	.word	0x00000000,0x0000006d
	.word	0x8599e5c5,0x4e7ae252
	.word	0xd872e224,0x2fe666e8
p0_local5_sec_expect:
	.word	0xff074a48,0x00000000
	.word	0xff000000,0x00000000
	.word	0x4c000000,0xffff964b
	.word	0xd05d4c8c,0xd6a4168a
	.word	0x676bab33,0x7fd3b699
	.word	0x857ee4b5,0xfbd29878
	.word	0xd12d5a9b,0xeda7c78a
	.word	0x86c81544,0xdc9fc27b
p0_local6_expect:
	.word	0x000000cd,0x00ff0000
	.word	0xcdf50930,0x00000000
	.word	0x00000011,0x4e7ae252
	.word	0xff73e1b3,0x00000000
	.word	0x00000000,0x00000000
	.word	0xa79e2a89,0xb948a79e
	.word	0x8599e5c5,0xbb2bb937
	.word	0x686b81dc,0xaf3777ab
p0_local6_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x00ff0000,0xd94c0000
	.word	0xff4a0000,0x00000000
	.word	0x030cba71,0x293afb45
	.word	0x388b4e88,0x9ddf8014
	.word	0x00000000,0x5ed106f2
	.word	0x8bb9da06,0x4411bad2
	.word	0x7e14f938,0x9d64910f
share0_expect:
	.word	0x00ffee02,0x2b0ba38a
	.word	0xa918ddf2,0x0fe1aee6
	.word	0xd642d522,0x14b4573b
	.word	0x1de41854,0x01c691db
	.word	0x0a5aecb9,0x2fc0504b
	.word	0xebf5ca17,0x81409b95
	.word	0xc1d7ad05,0x5f2771d5
	.word	0x011a15b1,0x983a6041
share1_expect:
	.word	0xa4ff5636,0x83fe7165
	.word	0x0d9083ab,0x10b2e165
	.word	0x5d297d96,0xe7e39d40
	.word	0xb150f222,0x542f6746
	.word	0x29a9670a,0x51176758
	.word	0xf1e4c74f,0x7dda7d1e
	.word	0x3e678a95,0x135f6c71
	.word	0xc11de379,0x249da8da
	.word	0x000037be,0xa179d3f8
	.word	0xacee9e8b,0xf3080596
	.word	0x6941c65e,0x1679fc8b
	.word	0x91849ef1,0x12bb5a5c
	.word	0x97ce7323,0x5e43a3fc
	.word	0x2eca81e2,0x70685286
	.word	0x43659b6e,0xddff833f
	.word	0x8670c86a,0x648f9cd7
share2_expect:
	.word	0xffff0619,0x64342211
	.word	0x727fbb4c,0x37e6f646
	.word	0x2604ecdd,0x3479860b
	.word	0x9dbb4ea3,0xd3ed04e9
	.word	0x83c4ea7c,0x4f2e3ff8
	.word	0x961c541f,0xaf23f5d6
	.word	0xfcf07816,0xafc7def5
	.word	0xb621186f,0xdff6c4c8
share3_expect:
	.word	0xecf2a13b,0x0847ed6d
	.word	0x94168260,0xe5bbcc13
	.word	0xd2cb9e46,0x42f4b60b
	.word	0xdbccbe86,0x6f3a3670
	.word	0x091e0f19,0x828d45c0
	.word	0xe64da267,0xb22c3566
	.word	0x8cc5e96c,0x81e60a1d
	.word	0xd02c2348,0x3f45ce64
	.word	0xe76d609e,0xb4906aac
	.word	0xd16a35c5,0x68c47f7b
	.word	0xe424f89d,0x62f4fdf5
	.word	0xfa80205a,0x905810a5
	.word	0x501e280d,0x7aa7a20b
	.word	0xe9d7b91d,0x002f1d51
	.word	0x5be5770e,0x0f59a065
	.word	0x24e54d53,0xfeae1f9a
	.word	0x3709535a,0xac810fef
	.word	0xe41d0665,0x3faeee2b
	.word	0x21ad0250,0x9f178e06
	.word	0xc4714b85,0x1abfb87d
	.word	0x237128b2,0x0a461827
	.word	0x5ad812fb,0x6e53a7f8
	.word	0xfb6e09e7,0x853a583f
	.word	0x4d992986,0x6017574c
	.word	0x2c720980,0xe71ea061
	.word	0x323187c6,0x90ed11e9
	.word	0x7ab3010d,0xab94fa41
	.word	0x7a01d63b,0xb686bc05
	.word	0x535e8fc8,0xd0507c1c
	.word	0x1a735966,0xe9138c6c
	.word	0xe6b558b2,0xa09e7f48
	.word	0xc79cdfe5,0x1cea0afa
	.word	0xfffb9db1,0x3367250c
	.word	0xaac4fd67,0x514eb70e
	.word	0x955143c4,0xb7fce027
	.word	0x72586eef,0x824c7c8d
	.word	0xda8e4019,0xadbcdb9a
	.word	0x99fedabf,0x5d52e90d
	.word	0x3ca61631,0xba2874ca
	.word	0xfc3d44ca,0x0111c7bd
	.word	0xc7ff199f,0x5de73d33
	.word	0xbb968c9e,0x0acfc1db
	.word	0x2110a351,0x4b3d33c2
	.word	0x8a2cde2f,0x92023d57
	.word	0xaab7b65a,0xa9141b08
	.word	0xe44904f7,0x4963618a
	.word	0x002db7ca,0x7c715660
	.word	0xd1ce02f9,0x4414a710
	.word	0xff152e86,0x0ec6f180
	.word	0x67749205,0xad3d5086
	.word	0x9888153e,0x377d8eb7
	.word	0x590b1259,0x26a71295
	.word	0x8e272f40,0x97502bac
	.word	0x0453f992,0xfe712220
	.word	0x8131e76b,0x41b9ef72
	.word	0x45c0893d,0xa11b5c3e
	.word	0x6efffc86,0x75f75ea7
	.word	0x47384b59,0x8b30f4c1
	.word	0x293ee257,0x1e1c0764
	.word	0xb146c587,0xd2891f43
	.word	0xc4e204d7,0x117a707e
	.word	0x270a1a05,0x54d565e7
	.word	0x59ed623f,0xebffc616
	.word	0x17738e3b,0x018db780
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
	.word	0x223e7408,0x6a349668
	.word	0x00000000,0x00000002
	.word	0x249f5e90,0x7a78f885
	.word	0x00000000,0x00000003
	.word	0x3ce5f2b8,0x34abc7d9
	.word	0x00000000,0x00000004
	.word	0x1e838d9f,0xa653878d
	.word	0x00000000,0x00000005
	.word	0xd9ae46ff,0xdbfdc531
	.word	0x00000000,0x00000006
	.word	0xe3fae447,0x942d8bfd
	.word	0x00000000,0x00000007
	.word	0xa5dc6a67,0xfffb693d
	.word	0x00000000,0x00000008
	.word	0x73259e77,0x999f762c
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
	.word	0xd0e3baa2,0x2908df1e,0xb87a98d8,0x95e5f1bc
	.word	0x964b9d3e,0x8cbdd6b8,0x7973e1b3,0xd48afdc6
	.word	0x8198f755,0x96b8efcd,0xd2e188d6,0x7b9de417
	.word	0xe0fbba8b,0xf6de4bb8,0xc7fa2d4c,0x87d5e890
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
	.word	0x6f2cccc4,0x9f30a542,0x43ce5375,0xf45fe3d2
	.word	0xeda94bbc,0xe77c533d,0x8e53315b,0x4b1f2f17
	.word	0x5464f6c8,0x87a55aac,0x56372253,0xbb2397dd
	.word	0x966b3016,0xd3d53641,0x730c4047,0x3460cf51
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
	.word	0xb4033e5f,0x13c04208,0x98e97953,0x843f02a8
	.word	0x1b0acbe5,0xb8b9567f,0xee264689,0x2a1575f1
	.word	0xc43c071a,0x76c164d0,0x3f525441,0xd08c544d
	.word	0xc6440722,0xe5b3a3bb,0xcb90f33f,0x7d79d4f6
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
	.word	0xe6604620,0xb271d4f2,0x39cb4cd9,0xabebb5a3
	.word	0x8d6306a0,0x1419e33f,0x64a4b6d8,0x955f911b
	.word	0x52e27a4e,0xeafd9d40,0x9ea748b9,0x892a9ea7
	.word	0x37b92bbb,0xc5e59985,0xe866e62f,0x24e272d8
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
	.word	0x62fa10da,0xa4121063,0x1d16ff86,0xfaf4a072
	.word	0xfbe6a5a8,0x6e09c4b0,0xf853eae2,0x37b70ff2
	.word	0xa1407e96,0x93a25ee0,0x8267c920,0x744bcb8b
	.word	0xd6a4f28a,0x363c5ef6,0xe10df74c,0xac71bc28
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
	.word	0x1e50bb5a,0xcde27cf9,0x4ec21e91,0x2f58ed26
	.word	0x95b7d15e,0x0de7f399,0x138d5da1,0x4b1a65d1
	.word	0xea84ad9f,0xb97c3607,0x256c63b8,0xfe412abb
	.word	0xbd7c6083,0xb0d2299b,0x80e74541,0xb4d70255
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
	.word	0x7c84ff0f,0x70160c7b,0xab063a9a,0x5ce4dada
	.word	0x5d4aaaf8,0x9a2bf419,0x6b139b60,0x09154c91
	.word	0x16ab6c5b,0x77988d1e,0xe37727eb,0xe62d6e36
	.word	0x22c594ec,0x68a9dd5d,0x2c9b1b55,0x0547e448
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
	.word	0x8b9a6661,0x13573a06,0x1238f944,0xcd03c2b4
	.word	0x57417234,0xfe32ca16,0x1855bab7,0x66e31c33
	.word	0x92f1cdc0,0xc1239e45,0x4472cbcc,0x4c6ae43a
	.word	0xf66049cd,0x8031de45,0xc1b4496a,0x128a8c87
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
	.word	0xaba41e70,0xe9a690c7,0xfc45a66e,0x4bb59e31
	.word	0x86436928,0x3dcaec77,0xb4fdc56e,0xe04450d1
	.word	0x5280199c,0x247db1db,0xc7a02612,0x356cc4e0
	.word	0x0c01aaad,0x4b379f01,0x191a0dd2,0x3ba26743
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
	.word	0x9b364016,0x500ea657,0xed690765,0x7b3a62e7
	.word	0xb94e54cf,0x7168212c,0xff074a48,0x0e2311ac
	.word	0x131eeab4,0x3009f5cd,0x86b14b5d,0xcc63a6c5
	.word	0x993177b3,0xce4ad7a2,0xab7737af,0xdc816b68
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
	.word	0xc7209950,0xea6d5eea,0x7ce981e7,0x1b7360e3
	.word	0x01c427af,0x3a6c1694,0x96ea312d,0xd1beadbd
	.word	0xaaa957e8,0x11777827,0xc2e3caf8,0xd1f45dcf
	.word	0x47840293,0x740d4952,0xf1590538,0x036c1108
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
	.word	0xdaf9a47a,0x8e11221e,0xc8c4dc64,0x46824978
	.word	0x5aeec272,0x0abed08c,0xd05d638c,0xabc31641
	.word	0x676bab33,0x7fd3b699,0x857ee4b5,0xfbd29878
	.word	0xd12d5a9b,0xeda7c78a,0x86c81544,0xdc9fc27b
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
	.word	0x936573a6,0x79a26200,0xc42efa9c,0x8413695e
	.word	0x121acd84,0x2667dead,0x6722e433,0xd808dd25
	.word	0x5aa104f7,0x498d7c33,0x3236cde7,0x9dcac4f4
	.word	0xd734fdf5,0x408d6ad5,0xd5205251,0xb9959758
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
	.word	0xd68bd32b,0x20d28582,0xd6ec01d0,0x6d972275
	.word	0x66e126cb,0xc5a61264,0x030cba71,0x293afb45
	.word	0x388b4e88,0x9ddf8014,0x1c329a43,0xb69606f2
	.word	0x8bb9da06,0x4411bad2,0x7e14f938,0x9d64910f
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
	.word	0x5465ee02,0x2b0ba38a,0xa918ddf2,0x0fe1aee6
	.word	0xd642d522,0x14b4573b,0x1de41854,0x01c691db
	.word	0x0a5aecb9,0x2fc0504b,0xebf5ca17,0x81409b95
	.word	0xc1d7ad05,0x5f2771d5,0x011a15b1,0x983a6041
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
	.word	0xa4fe5636,0x83fe7165,0x0d9083ab,0x10b2e165
	.word	0x5d297d96,0xe7e39d40,0xb150f222,0x542f6746
	.word	0x29a9670a,0x51176758,0xf1e4c74f,0x7dda7d1e
	.word	0x3e678a95,0x135f6c71,0xc11de379,0x249da8da
	.word	0x29e637be,0xa179d3f8,0xacee9e8b,0xf3080596
	.word	0x6941c65e,0x1679fc8b,0x91849ef1,0x12bb5a5c
	.word	0x97ce7323,0x5e43a3fc,0x2eca81e2,0x70685286
	.word	0x43659b6e,0xddff833f,0x8670c86a,0x648f9cd7
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
	.word	0xffc00619,0x64342211,0x727fbb4c,0x37e6f646
	.word	0x2604ecdd,0x3479860b,0x9dbb4ea3,0xd3ed04e9
	.word	0x83c4ea7c,0x4f2e3ff8,0x961c541f,0xaf23f5d6
	.word	0xfcf07816,0xafc7def5,0xb621186f,0xdff6c4c8
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
	.word	0xecf2a13b,0x0847ed6d,0x94168260,0xe5bbcc13
	.word	0xd2cb9e46,0x42f4b60b,0xdbccbe86,0x6f3a3670
	.word	0x091e0f19,0x828d45c0,0xe64da267,0xb22c3566
	.word	0x8cc5e96c,0x81e60a1d,0xd02c2348,0x3f45ce64
	.word	0xe76d609e,0xb4906aac,0xd16a35c5,0x68c47f7b
	.word	0xe424f89d,0x62f4fdf5,0xfa80205a,0x905810a5
	.word	0x501e280d,0x7aa7a20b,0xe9d7b91d,0x002f1d51
	.word	0x5be5770e,0x0f59a065,0x24e54d53,0xfeae1f9a
	.word	0x3709535a,0xac810fef,0xe41d0665,0x3faeee2b
	.word	0x21ad0250,0x9f178e06,0xc4714b85,0x1abfb87d
	.word	0x237128b2,0x0a461827,0x5ad812fb,0x6e53a7f8
	.word	0xfb6e09e7,0x853a583f,0x4d992986,0x6017574c
	.word	0x2c720980,0xe71ea061,0x323187c6,0x90ed11e9
	.word	0x7ab3010d,0xab94fa41,0x7a01d63b,0xb686bc05
	.word	0x535e8fc8,0xd0507c1c,0x1a735966,0xe9138c6c
	.word	0xe6b558b2,0xa09e7f48,0xc79cdfe5,0x1cea0afa
	.word	0x35fb9db1,0x3367250c,0xaac4fd67,0x514eb70e
	.word	0x955143c4,0xb7fce027,0x72586eef,0x824c7c8d
	.word	0xda8e4019,0xadbcdb9a,0x99fedabf,0x5d52e90d
	.word	0x3ca61631,0xba2874ca,0xfc3d44ca,0x0111c7bd
	.word	0xc7fa199f,0x5de73d33,0xbb968c9e,0x0acfc1db
	.word	0x2110a351,0x4b3d33c2,0x8a2cde2f,0x92023d57
	.word	0xaab7b65a,0xa9141b08,0xe44904f7,0x4963618a
	.word	0x002db7ca,0x7c715660,0xd1ce02f9,0x4414a710
	.word	0xf3152e86,0x0ec6f180,0x67749205,0xad3d5086
	.word	0x9888153e,0x377d8eb7,0x590b1259,0x26a71295
	.word	0x8e272f40,0x97502bac,0x0453f992,0xfe712220
	.word	0x8131e76b,0x41b9ef72,0x45c0893d,0xa11b5c3e
	.word	0x6e7bfc86,0x75f75ea7,0x47384b59,0x8b30f4c1
	.word	0x293ee257,0x1e1c0764,0xb146c587,0xd2891f43
	.word	0xc4e204d7,0x117a707e,0x270a1a05,0x54d565e7
	.word	0x59ed623f,0xebffc616,0x17738e3b,0x018db780
share3_end:
